*
* Your tour of the Apple IIgs
*
* (c) 1989, Apple Computer
* (s) 2020, Antoine Vignau
*

	mx	%00
	rel
	lst	off

*-------------------------------

	use	LTRICKS.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Util.Macs
	
*-------------------------------

L090000  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$0044
         TCS
         STZ   $46
         BRA   L09004F
L09000F  LDA   $46
         LDX   #$0000
         TAY
         BPL   L090018
         DEX
L090018  PHX
         PHA
         LDA   #L0C030E
         LDX   #^L0C030E
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   [$F4]
         PHA
         LDA   $46
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$0050
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         PLA
         SEP   #$20
         STA   [$F4]
         REP   #$20
         INC   $46
L09004F  LDA   $46
         SEC
         SBC   #$00A4
         BVS   L09005A
         EOR   #$8000
L09005A  BPL   L09000F
         LDA   $FF
         BEQ   L09009E
         PEA   $0000
         PEA   $004E
         PEA   $0000
         TDC
         CLC
         ADC   #$0054
         PHA
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$0048
         PHA
         PEA   $005C
         PEA   $001C
         PEA   $0274
         PEA   $007E
         _SetRect
         BCS   L090098
         LDA   #$0000
L090098  STAL  L0B0002
         BRA   L0900C3
L09009E  PEA   $0000
         TDC
         CLC
         ADC   #$0048
         PHA
         PEA   $001C
         PEA   $0022
         PEA   $0240
         PEA   $00AD
         _SetRect
         BCS   L0900BF
         LDA   #$0000
L0900BF  STAL  L0B0002
L0900C3  JSL   L06063A
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEA   $0000
         TDC
         CLC
         ADC   #$0048
         PHA
         _PtInRect
         BCS   L0900E3
         LDA   #$0000
L0900E3  STAL  L0B0002
         PLA
         TAY
         BEQ   L09012A
         LDX   #$0000
         TDC
         CLC
         ADC   #$0050
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L090103
         LDA   #$0000
L090103  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L090128
         PEA   $0000
         TDC
         CLC
         ADC   #$0050
         PHA
         _SetCursor
         BCS   L090124
         LDA   #$0000
L090124  STAL  L0B0002
L090128  BRA   L090150
L09012A  LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L090140
         LDA   #$0000
L090140  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L090150
         JSL   L0311DD
L090150  PEA   $0001
         JSL   L060679
         PLY
         TAY
         BNE   L09015E
         BRL   L0900C3
L09015E  PEA   $0000
         JSL   L06152C
         PLY
         STZ   L0B00C7
         JSL   L0612DE
         JSL   L04169A
         JSL   L031208
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L09018E
         BVS   L090183
         EOR   #$8000
L090183  BPL   L09018E
         LDA   L0B0078
         PHA
         JSL   L0607BE
         PLY
L09018E  TSC
         CLC
         ADC   #$00B4
         TCS
         PLD
         RTL

L090196  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$FDA4
         TCS
         LDAL  L0C072F
         PHA
         JSL   L0108F6
         PLY
         SEC
         SBC   #$0001
         PHA
         JSL   L0108F6
         PLY
         STA   $D8
         PEA   $0000
         PEA   $00F8
         PEA   $0000
         TDC
         CLC
         ADC   #$FF08
         PHA
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $00B8
         PEA   $0000
         TDC
         CLC
         ADC   #$FE50
         PHA
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         LDA   #$000B
         SEP   #$20
         LDX   #$FE50
         STA   $00,X
         REP   #$20
         LDA   #$0004
         SEP   #$20
         LDX   #$FE52
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEAE
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEB6
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEBE
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEC6
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FECE
         STA   $00,X
         REP   #$20
         PEA   $00FF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FED4
         PHA
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         LDA   #$00F0
         SEP   #$20
         LDX   #$FED8
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEDE
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEE6
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEEE
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEF6
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FEFE
         STA   $00,X
         REP   #$20
         LDA   #$0005
         SEP   #$20
         LDX   #$FF04
         STA   $00,X
         REP   #$20
         LDA   #$0004
         SEP   #$20
         LDX   #$FF06
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FF08
         STA   $00,X
         REP   #$20
         LDA   #$0004
         SEP   #$20
         LDX   #$FF0A
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FF86
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FF87
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FF8E
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FF90
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FF95
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FF98
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FF9D
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FF9E
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FF9F
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFA5
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FFA6
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FFA7
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFAD
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFAF
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FFB4
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFB7
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FFBC
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FFBE
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFC4
         STA   $00,X
         REP   #$20
         LDA   #$000F
         SEP   #$20
         LDX   #$FFC6
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFCC
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFCE
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FFD4
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFD6
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FFDC
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FFDD
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FFE4
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFE5
         STA   $00,X
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         LDX   #$FFEC
         STA   $00,X
         REP   #$20
         LDA   #$00F0
         SEP   #$20
         LDX   #$FFF4
         STA   $00,X
         REP   #$20
         LDA   #$000E
         SEP   #$20
         LDX   #$FFFC
         STA   $00,X
         REP   #$20
         JSL   L090D3B
         PEA   $0000
         TDC
         CLC
         ADC   #$FDA6
         PHA
         _OpenPort
         BCS   L090455
         LDA   #$0000
L090455  STAL  L0B0002
         LDA   L0B0002
         BEQ   L0904AF
         PEA   $56B9
         JSL   L021DFD
         PLY
         PEA   $0200
         PEA   $0000
         PEA   $5000
         LDX   L0B0040
         LDA   L0B003E
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   L0B0040
         LDA   L0B003E
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FDA6
         PHA
         _OpenPort
         BCS   L0904A3
         LDA   #$0000
L0904A3  STAL  L0B0002
         PEA   $56BA
         JSL   L021DFD
         PLY
L0904AF  PEA   $0000
         TDC
         CLC
         ADC   #$FDA6
         PHA
         _SetPort
         BCS   L0904C4
         LDA   #$0000
L0904C4  STAL  L0B0002
         PEA   $000F
         _SetForeColor
         BCS   L0904D7
         LDA   #$0000
L0904D7  STAL  L0B0002
         PEA   $000F
         _SetSolidPenPat
         BCS   L0904EA
         LDA   #$0000
L0904EA  STAL  L0B0002
         PEA   $0004
         _SetTextMode
         BCS   L0904FD
         LDA   #$0000
L0904FD  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $002E
         PEA   $001C
         PEA   $013A
         PEA   $007E
         _SetRect
         BCS   L090522
         LDA   #$0000
L090522  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _ClipRect
         BCS   L09053B
         LDA   #$0000
L09053B  STAL  L0B0002
         PEA   ^L0C27DF
         PEA   L0C27DF
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $FF
         CMP   #$004B
         BEQ   L09055D
         BRL   L09062D
L09055D  PEA   $0000
         TDC
         CLC
         ADC   #$FDB6
         PHA
         _ClipRect
         BCS   L090572
         LDA   #$0000
L090572  STAL  L0B0002
         PEA   $0000
         _SetPenMode
         BCS   L090585
         LDA   #$0000
L090585  STAL  L0B0002
         PEI   $D8
         _SetForeColor
         BCS   L090597
         LDA   #$0000
L090597  STAL  L0B0002
         PEI   $D8
         _SetSolidPenPat
         BCS   L0905A9
         LDA   #$0000
L0905A9  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         PEA   $0030
         PEA   $0083
         PEA   $0048
         PEA   $0093
         _SetRect
         BCS   L0905CE
         LDA   #$0000
L0905CE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _PaintRect
         BCS   L0905E7
         LDA   #$0000
L0905E7  STAL  L0B0002
         PEA   $000F
         _SetForeColor
         BCS   L0905FA
         LDA   #$0000
L0905FA  STAL  L0B0002
         PEA   $000F
         _SetSolidPenPat
         BCS   L09060D
         LDA   #$0000
L09060D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _FrameRect
         BCS   L090626
         LDA   #$0000
L090626  STAL  L0B0002
         BRL   L090CC2
L09062D  LDA   $FF
         CMP   #$004F
         BEQ   L090637
         BRL   L0906F0
L090637  JSL   L0311DD
         LDA   #$0002
         PHA
         LDAL  L0C0731
         SEC
         JSL   L01092D
         PLY
         PHA
         LDAL  L0C0733
         PHA
         _MoveTo
         BCS   L09065B
         LDA   #$0000
L09065B  STAL  L0B0002
         PEA   $000F
         _SetForeColor
         BCS   L09066E
         LDA   #$0000
L09066E  STAL  L0B0002
         PEA   $000F
         _SetSolidPenPat
         BCS   L090681
         LDA   #$0000
L090681  STAL  L0B0002
         PEA   $0000
         _SetBackColor
         BCS   L090694
         LDA   #$0000
L090694  STAL  L0B0002
         PEA   $0000
         _SetSolidBackPat
         BCS   L0906A7
         LDA   #$0000
L0906A7  STAL  L0B0002
         PEA   ^L0C27E1
         PEA   L0C27E1
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   #$0000
         STAL  L0C1AA2
         LDA   #$0000
         STAL  L0C1AA8
         LDA   #$0014
         STAL  L0C1A9A
         LDA   #$0000
         STAL  L0C1AA6
         LDA   #$0000
         STAL  L0C1AB0
         JSL   L0618EB
         LDA   #$0001
         STAL  L0C1AA2
         BRL   L090CC2
L0906F0  JSL   L06063A
         LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   #$0001
         PHA
         LDA   $E2
         SEC
         JSL   L010CD9
         PLA
         STA   $E2
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _PtInRect
         BCS   L09073E
         LDA   #$0000
L09073E  STAL  L0B0002
         PLA
         TAY
         BNE   L090749
         BRL   L0907CE
L090749  LDA   $FF
         CMP   #$0051
         BNE   L09078F
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF08
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L090768
         LDA   #$0000
L090768  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L09078D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF08
         PHA
         _SetCursor
         BCS   L090789
         LDA   #$0000
L090789  STAL  L0B0002
L09078D  BRA   L0907CC
L09078F  LDX   #$0000
         TDC
         CLC
         ADC   #$FE50
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L0907A7
         LDA   #$0000
L0907A7  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L0907CC
         PEA   $0000
         TDC
         CLC
         ADC   #$FE50
         PHA
         _SetCursor
         BCS   L0907C8
         LDA   #$0000
L0907C8  STAL  L0B0002
L0907CC  BRA   L0907F4
L0907CE  LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L0907E4
         LDA   #$0000
L0907E4  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L0907F4
         JSL   L0311DD
L0907F4  PEA   $0001
         JSL   L060679
         PLY
         TAY
         BNE   L090802
         BRL   L0906F0
L090802  JSL   L0612DE
         TAY
         BEQ   L09080C
         BRL   L090CC2
L09080C  JSL   L04169A
         TAY
         BEQ   L090816
         BRL   L090CC2
L090816  LDA   L0B0078
         BEQ   L09081E
         BRL   L090CC2
L09081E  LDAL  L0C1A7A
         CMP   #$0001
         BEQ   L09082A
         BRL   L090CC2
L09082A  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _PtInRect
         BCS   L090849
         LDA   #$0000
L090849  STAL  L0B0002
         PLA
         TAY
         BNE   L090854
         BRL   L090CC2
L090854  PEA   ^L0C27E2
         PEA   L0C27E2
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0002
         _SetPenMode
         BCS   L090877
         LDA   #$0000
L090877  STAL  L0B0002
         PEA   $000F
         _SetForeColor
         BCS   L09088A
         LDA   #$0000
L09088A  STAL  L0B0002
         PEA   $000F
         _SetSolidPenPat
         BCS   L09089D
         LDA   #$0000
L09089D  STAL  L0B0002
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E0
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $FF
         SEC
         SBC   #$0050
         BVS   L0908CB
         EOR   #$8000
L0908CB  BPL   L0908D0
         BRL   L090AA1
L0908D0  JSL   L06063A
         LDA   #$0001
         PHA
         LDAL  L0C1A86
         SEC
         JSL   L010CD9
         PLA
         STAL  L0C1A86
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _PtInRect
         BCS   L090902
         LDA   #$0000
L090902  STAL  L0B0002
         PLA
         TAY
         BEQ   L090949
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE50
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L090922
         LDA   #$0000
L090922  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L090947
         PEA   $0000
         TDC
         CLC
         ADC   #$FE50
         PHA
         _SetCursor
         BCS   L090943
         LDA   #$0000
L090943  STAL  L0B0002
L090947  BRA   L09096F
L090949  LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L09095F
         LDA   #$0000
L09095F  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L09096F
         JSL   L0311DD
L09096F  LDA   $FF
         SEC
         SBC   #$0046
         BVS   L09097A
         EOR   #$8000
L09097A  BMI   L0909DB
         PEI   $E2
         PEI   $E0
         _MoveTo
         BCS   L09098C
         LDA   #$0000
L09098C  STAL  L0B0002
         LDAL  L0C1A86
         PHA
         LDAL  L0C1A84
         PHA
         _LineTo
         BCS   L0909A6
         LDA   #$0000
L0909A6  STAL  L0B0002
         PEI   $E2
         PEI   $E0
         _MoveTo
         BCS   L0909BA
         LDA   #$0000
L0909BA  STAL  L0B0002
         LDAL  L0C1A86
         PHA
         LDAL  L0C1A84
         PHA
         _LineTo
         BCS   L0909D4
         LDA   #$0000
L0909D4  STAL  L0B0002
         BRL   L090A86
L0909DB  PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         LDAL  L0C1A86
         SEC
         SBC   $E2
         BVS   L0909F0
         EOR   #$8000
L0909F0  BMI   L0909F8
         LDAL  L0C1A86
         BRA   L0909FA
L0909F8  LDA   $E2
L0909FA  PHA
         LDAL  L0C1A84
         SEC
         SBC   $E0
         BVS   L090A07
         EOR   #$8000
L090A07  BMI   L090A0F
         LDAL  L0C1A84
         BRA   L090A11
L090A0F  LDA   $E0
L090A11  PHA
         LDAL  L0C1A86
         SEC
         SBC   $E2
         BEQ   L090A28
         BVS   L090A20
         EOR   #$8000
L090A20  BPL   L090A28
         LDAL  L0C1A86
         BRA   L090A2A
L090A28  LDA   $E2
L090A2A  PHA
         LDAL  L0C1A84
         SEC
         SBC   $E0
         BEQ   L090A41
         BVS   L090A39
         EOR   #$8000
L090A39  BPL   L090A41
         LDAL  L0C1A84
         BRA   L090A43
L090A41  LDA   $E0
L090A43  PHA
         _SetRect
         BCS   L090A50
         LDA   #$0000
L090A50  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _FrameRect
         BCS   L090A69
         LDA   #$0000
L090A69  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _FrameRect
         BCS   L090A82
         LDA   #$0000
L090A82  STAL  L0B0002
L090A86  PHA
         PEA   $0000
         _StillDown
         BCS   L090A96
         LDA   #$0000
L090A96  STAL  L0B0002
         PLA
         TAY
         BEQ   L090AA1
         BRL   L0908D0
L090AA1  PEA   $0000
         _SetPenMode
         BCS   L090AB0
         LDA   #$0000
L090AB0  STAL  L0B0002
         LDA   $FF
         BRL   L090CB1
L090AB9  PEI   $E2
         PEI   $E0
         _MoveTo
         BCS   L090AC9
         LDA   #$0000
L090AC9  STAL  L0B0002
         LDAL  L0C1A86
         PHA
         LDAL  L0C1A84
         PHA
         _LineTo
         BCS   L090AE3
         LDA   #$0000
L090AE3  STAL  L0B0002
         BRL   L090CC2
L090AEA  PEI   $D8
         _SetForeColor
         BCS   L090AF8
         LDA   #$0000
L090AF8  STAL  L0B0002
         PEI   $D8
         _SetSolidPenPat
         BCS   L090B0A
         LDA   #$0000
L090B0A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _PaintRect
         BCS   L090B23
         LDA   #$0000
L090B23  STAL  L0B0002
         PEA   $000F
         _SetForeColor
         BCS   L090B36
         LDA   #$0000
L090B36  STAL  L0B0002
         PEA   $000F
         _SetSolidPenPat
         BCS   L090B49
         LDA   #$0000
L090B49  STAL  L0B0002
L090B4D  PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _FrameRect
         BCS   L090B62
         LDA   #$0000
L090B62  STAL  L0B0002
         BRL   L090CC2
L090B69  PEI   $E2
         PEI   $E0
         _MoveTo
         BCS   L090B79
         LDA   #$0000
L090B79  STAL  L0B0002
L090B7D  JSL   L06063A
         LDA   #$0001
         PHA
         LDAL  L0C1A86
         SEC
         JSL   L010CD9
         PLA
         STAL  L0C1A86
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _PtInRect
         BCS   L090BAF
         LDA   #$0000
L090BAF  STAL  L0B0002
         PLA
         TAY
         BEQ   L090BF6
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF08
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L090BCF
         LDA   #$0000
L090BCF  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L090BF4
         PEA   $0000
         TDC
         CLC
         ADC   #$FF08
         PHA
         _SetCursor
         BCS   L090BF0
         LDA   #$0000
L090BF0  STAL  L0B0002
L090BF4  BRA   L090C1C
L090BF6  LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L090C0C
         LDA   #$0000
L090C0C  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L090C1C
         JSL   L0311DD
L090C1C  LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E0
         PHX
         PHA
         LDY   #$0003
         JSL   L01122C
         BEQ   L090C6E
         LDAL  L0C1A86
         PHA
         LDAL  L0C1A84
         PHA
         _LineTo
         BCS   L090C4D
         LDA   #$0000
L090C4D  STAL  L0B0002
         LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
L090C6E  PHA
         PEA   $0000
         _StillDown
         BCS   L090C7E
         LDA   #$0000
L090C7E  STAL  L0B0002
         PLA
         TAY
         BEQ   L090C89
         BRL   L090B7D
L090C89  JSL   L0311DD
         BRL   L090CC2
L090C90  BRL   L090CC2
L090C93  DA    L090AB9
         DA    L090AB9
         DA    L090C90
         DA    L090C90
         DA    L090B4D
         DA    L090B4D
         DA    L090C90
         DA    L090C90
         DA    L090AEA
         DA    L090AEA
         DA    L090C90
         DA    L090C90
         DA    L090C90
         DA    L090B69
         DA    L090C90
L090CB1  SEC
         SBC   #$0044
         CMP   #$000E
         BCC   L090CBD
         LDA   #$000E
L090CBD  ASL
         TAX
         JMP   (L090C93,X)

L090CC2  PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L090CD4
         LDA   #$0000
L090CD4  STAL  L0B0002
         JSL   L090D65
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L090CF5
         BVS   L090CEA
         EOR   #$8000
L090CEA  BPL   L090CF5
         LDA   L0B0078
         PHA
         JSL   L0607BE
         PLY
L090CF5  JSL   L031208
         LDX   #$FDC0
         LDA   $00,X
         TAX
         PHX
         LDX   #$FDBE
         LDA   $00,X
         PHA
         _DisposeHandle
         BCS   L090D12
         LDA   #$0000
L090D12  STAL  L0B0002
         LDX   #$FDC4
         LDA   $00,X
         TAX
         PHX
         LDX   #$FDC2
         LDA   $00,X
         PHA
         _DisposeHandle
         BCS   L090D2F
         LDA   #$0000
L090D2F  STAL  L0B0002
         TSC
         CLC
         ADC   #$0354
         TCS
         PLD
         RTL

L090D3B  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L0620B1
         PEA   $0008
         _SetMasterSCB
         BCS   L090D59
         LDA   #$0000
L090D59  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L090D65  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L06204F
         PEA   $0087
         _SetMasterSCB
         BCS   L090D83
         LDA   #$0000
L090D83  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L090D8F  ENT
L0E004A  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EA
         TCS
         LDA   #$0001
         STA   L0B00A8
         LDA   $FF
         BRL   L091139
L090DA5  LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         LDAL  L0C0731
         BRL   L090F20
L090DBD  PEA   $006E
         PEA   $0000
         PEA   $0032
         PEA   $0010
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDAL  L0C246C
         TAX
         LDAL  L0C246A
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         LDA   #$0003
         STA   $EE
         BRL   L090F2E
L090DFC  PEA   $006E
         PEA   $0000
         PEA   $0032
         PEA   $0008
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDAL  L0C246C
         TAX
         LDAL  L0C246A
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         LDA   #$0003
         STA   $EE
         BRL   L090F2E
L090E3B  PEA   $006E
         PEA   $0000
         PEA   $0032
         PEA   $0010
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         PEA   $006E
         PEA   $0000
         PEA   $0039
         PEA   $0010
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         LDAL  L0C2470
         TAX
         LDAL  L0C246E
         PHA
         TXA
         STAL  L0C2474
         PLA
         STAL  L0C2472
         LDA   #$0004
         STA   $EE
         BRL   L090F2E
L090E9D  PEA   $006E
         PEA   $0000
         PEA   $0039
         PEA   $0005
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDAL  L0C246C
         TAX
         LDAL  L0C246A
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         LDAL  L0C246C
         TAX
         LDAL  L0C246A
         PHA
         TXA
         STAL  L0C2474
         PLA
         STAL  L0C2472
         PEA   $006E
         PEA   $0000
         PEA   $0032
         PEA   $0010
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2478
         PLA
         STAL  L0C2476
         LDA   #$0005
         STA   $EE
         BRL   L090F2E
L090F13  BRL   L090F2E
L090F16  DA    L090DBD
         DA    L090DFC
         DA    L090E3B
         DA    L090E9D
         DA    L090F13
L090F20  DEC
         CMP   #$0004
         BCC   L090F29
         LDA   #$0004
L090F29  ASL
         TAX
         JMP   (L090F16,X)

L090F2E  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000C
         PEA   $0002
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         LDA   $EE
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$F4],Y
         PLA
         STA   [$F4]
         INC   $EE
         LDA   $EE
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDX   #$0000
         LDA   #$0002
         LDY   #$0002
         PHA
         TXA
         STA   [$F4],Y
         PLA
         STA   [$F4]
         INC   $EE
         LDA   $EE
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDX   #$FFFF
         LDA   #$FFFF
         LDY   #$0002
         PHA
         TXA
         STA   [$F4],Y
         PLA
         STA   [$F4]
         PEA   ^L0C2466
         PEA   L0C2466
         JSL   L0502A4
         PLY
         PLY
         BRL   L091154
L090FD2  JSL   L094449
         BRL   L091154
L090FD9  JSL   L0311DD
         JSL   L0612B1
         PEA   ^L0C09F0
         PEA   L0C09F0
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         STAL  L0C1A9A
         LDA   #$0000
         STAL  L0C1AB0
         LDA   #$0001
         STAL  L0C1AAC
         STZ   L0B0078
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         _GetPen
         BCS   L09102B
         LDA   #$0000
L09102B  STAL  L0B0002
L09102F  LDAL  L0C0733
         STAL  L0C1AA8
         LDAL  L0C0731
         STAL  L0C1AAE
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         STA   $EE
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L091060
         LDA   #$0000
L091060  STAL  L0B0002
         PLA
         JSL   L0618EB
         LDAL  L0C1AAE
         BEQ   L09107D
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L09107D
         BVS   L09107D
         EOR   #$8000
L09107D  PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         CMP   $EE
         BEQ   L0910C6
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         PHA
         LDA   $EE
         PLX
         STX   $F8
         SEC
         SBC   $F8
         STA   $EC
         LDAL  L0C0731
         SEC
         SBC   $EC
         PHA
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C0733
         SEC
         SBC   $EC
         PHA
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
L0910C6  PEI   $F2
         PEI   $F0
         _MoveTo
         BCS   L0910D6
         LDA   #$0000
L0910D6  STAL  L0B0002
         LDAL  L0C0731
         BEQ   L091109
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         TAY
         BEQ   L091109
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L0910FF
         BVS   L0910FD
         EOR   #$8000
L0910FD  BMI   L091109
L0910FF  JSL   L0612DE
         TAY
         BNE   L091109
         BRL   L09102F
L091109  LDA   #$0000
         STAL  L0C1AAC
         PEA   $0001
         JSL   L06135C
         PLY
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L09112B
         LDA   #$0000
L09112B  STAL  L0B0002
         PLA
         JSL   L031208
         BRL   L091154
L091137  BRA   L091154
L091139  CMP   #$0002
         BNE   L091141
         BRL   L090DA5
L091141  CMP   #$001B
         BNE   L091149
         BRL   L090FD2
L091149  CMP   #$001F
         BNE   L091151
         BRL   L090FD9
L091151  JMP   L091137

L091154  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L09115C  ENT
L0E0058  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         LDA   #$0001
         STA   L0B00A8
         LDA   $FF
         BRL   L0912D6
L091172  BRL   L09131B
L091175  LDX   L0B0030
         LDA   L0B002E
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         PHX
         PHA
         LDAL  L0C0745
         PHA
         LDAL  L0C0743
         PHA
         LDAL  L0C0733
         PHA
         LDAL  L0C0731
         PHA
         JSL   L095311
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         BRL   L09131B
L0911AC  LDA   #L0C0EFA
         LDX   #^L0C0EFA
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         PHA
         LDAL  L0C0EFA
         PHA
         JSL   L09546C
         PLY
         PLY
         BRL   L09131B
L0911CA  JSL   L095160
         PHA
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         JSL   L0951A8
         PHA
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
         BRL   L09131B
L0911E9  PEA   $0000
         JSL   L090000
         PLY
         BRL   L09131B
L0911F4  PEA   ^L0C078C
         PEA   L0C078C
         JSL   L040E53
         PLY
         PLY
         STA   $F2
         SEC
         SBC   #$0000
         BVS   L09120B
         EOR   #$8000
L09120B  BPL   L091256
         LDA   $F2
         SEC
         SBC   #$0032
         BVS   L091218
         EOR   #$8000
L091218  BMI   L091256
         LDA   $F2
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         PHX
         PHA
         PEA   ^L0C07BF
         PEA   L0C07BF
         JSL   L0915E3
         PLY
         PLY
         PLY
         PLY
L091256  BRL   L09131B
L091259  PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0246BF
         PLY
         PLY
         STA   $F0
         LDA   #$0001
         STA   $F2
         BRA   L091294
L09126E  LDA   $F2
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L09128E
         LDA   #$0000
L09128E  STAL  L0B0002
         INC   $F2
L091294  LDA   $F2
         SEC
         SBC   $F0
         BEQ   L09126E
         BVS   L0912A0
         EOR   #$8000
L0912A0  BPL   L09126E
         PEA   ^L0C27E4
         PEA   L0C27E4
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         BRL   L09131B
L0912B9  JSL   L091323
         BRL   L09131B
L0912C0  PEA   $0001
         JSL   L090000
         PLY
         BRL   L09131B
L0912CB  PEI   $FF
         JSL   L090196
         PLY
         BRA   L09131B
         BRA   L09131B
L0912D6  CMP   #$0000
         BNE   L0912DE
         BRL   L091172
L0912DE  CMP   #$0006
         BNE   L0912E6
         BRL   L0911AC
L0912E6  CMP   #$0007
         BNE   L0912EE
         BRL   L0911CA
L0912EE  CMP   #$0013
         BNE   L0912F6
         BRL   L0911E9
L0912F6  CMP   #$0016
         BNE   L0912FE
         BRL   L0911F4
L0912FE  CMP   #$0039
         BNE   L091306
         BRL   L091259
L091306  CMP   #$003A
         BEQ   L0912B9
         CMP   #$004E
         BEQ   L0912C0
         CMP   #$FFFA
         BNE   L091318
         BRL   L091175
L091318  JMP   L0912CB

L09131B  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L091323  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E0
         TCS
         STZ   $E4
         BRA   L091353
L091332  LDA   $E4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         INC   $E4
L091353  LDA   $E4
         SEC
         SBC   #$0005
         BEQ   L091332
         BVS   L091360
         EOR   #$8000
L091360  BPL   L091332
         JSL   L0311DD
         PEA   $0001
         JSL   L06078F
         PLY
         LDA   L0B0078
         CMP   #$FFFF
         BNE   L091379
         BRL   L0913E9
L091379  PEA   ^L0C27E6
         PEA   L0C27E6
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L0913E6
         BVS   L09139B
         EOR   #$8000
L09139B  BPL   L0913E6
         PEA   $0001
         LDA   L0B0078
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L0613E4
         PLY
         PLY
         PLY
         PLY
         PLY
L0913E6  BRL   L0915D7
L0913E9  LDA   #$0001
         STA   $E8
         PEA   ^L0C0EFA
         PEA   L0C0EFA
         _InvertRect
         BCS   L091400
         LDA   #$0000
L091400  STAL  L0B0002
         LDA   #$0001
         STA   $EC
L091409  JSL   L06063A
         STZ   $E6
         LDA   #$0001
         STA   $E4
         BRA   L091446
L091416  LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         SEC
         SBCL  L0C1A84
         BEQ   L091440
         BVS   L09143E
         EOR   #$8000
L09143E  BMI   L091444
L091440  LDA   $E4
         STA   $E6
L091444  INC   $E4
L091446  LDA   $E4
         SEC
         SBC   #$0005
         BEQ   L091416
         BVS   L091453
         EOR   #$8000
L091453  BPL   L091416
         LDA   $E6
         CMP   $E8
         BNE   L09145E
         BRL   L0915AD
L09145E  PHA
         PEA   $0000
         _StillDown
         BCS   L09146E
         LDA   #$0000
L09146E  STAL  L0B0002
         PLA
         TAY
         BNE   L091479
         BRL   L0915AD
L091479  LDA   $E6
         SEC
         SBC   $E8
         BVS   L091483
         EOR   #$8000
L091483  BPL   L091488
         BRL   L091506
L091488  LDA   $E6
         CLC
         ADC   #$0001
         STA   $E4
         BRA   L0914F5
L091492  LDA   $E4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         BEQ   L0914F3
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L0914D0
         LDA   #$0000
L0914D0  STAL  L0B0002
         LDA   $E4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
L0914F3  INC   $E4
L0914F5  LDA   $E4
         SEC
         SBC   $E8
         BEQ   L091492
         BVS   L091501
         EOR   #$8000
L091501  BPL   L091492
         BRL   L0915A9
L091506  LDA   $E6
         SEC
         SBC   $E8
         BNE   L091510
         BRL   L0915A9
L091510  BVS   L091515
         EOR   #$8000
L091515  BMI   L09151A
         BRL   L0915A9
L09151A  LDA   #$0001
         STA   $E2
         LDA   $E8
         SEC
         SBC   #$0001
         BEQ   L091532
         BVS   L09152C
         EOR   #$8000
L09152C  BPL   L091532
         LDA   $E8
         STA   $E2
L091532  LDA   $E2
         STA   $E4
         BRA   L09159B
L091538  LDA   $E4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         BNE   L091599
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _InvertRect
         BCS   L091576
         LDA   #$0000
L091576  STAL  L0B0002
         LDA   $E4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0001
         STA   [$F6]
L091599  INC   $E4
L09159B  LDA   $E4
         SEC
         SBC   $E6
         BEQ   L091538
         BVS   L0915A7
         EOR   #$8000
L0915A7  BPL   L091538
L0915A9  LDA   $E6
         STA   $E8
L0915AD  PHA
         PEA   $0000
         _StillDown
         BCS   L0915BD
         LDA   #$0000
L0915BD  STAL  L0B0002
         PLA
         TAY
         BEQ   L0915C8
         BRL   L091409
L0915C8  PEA   ^L0C1188
         PEA   L0C1188
         PEI   $E8
         JSL   L02441B
         PLY
         PLY
         PLY
L0915D7  JSL   L031208
         TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L0915E3  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$006A
         TCS
         LDA   #$00C8
         STA   $E4
         STZ   $E2
         LDA   #$0001
         STA   $DC
         STZ   $EA
         LDA   #$FFFF
         STA   $EC
         STZ   $E8
         STZ   $D8
         STZ   $DA
         STZ   $DE
         STZ   $E0
         PEA   ^L0C27E8
         PEA   L0C27E8
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $0000
         PEA   $0078
         LDX   L0B0030
         LDA   L0B002E
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C27E9
         PEA   L0C27E9
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L09166D
         STZ   $E0
         BRL   L0916C1
L09166D  PEA   ^L0C27ED
         PEA   L0C27ED
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L09168B
         LDA   #$0001
         STA   $E0
         BRA   L0916C1
L09168B  PEA   ^L0C27F2
         PEA   L0C27F2
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0916C1
         LDA   #$0002
         STA   $E0
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $DE
L0916C1  PHX
         PHA
         PEI   $FF
         PEI   $FD
         _GetHandleSize
         BCS   L0916D3
         LDA   #$0000
L0916D3  STAL  L0B0002
         PLA
         PLX
         STX   $D6
         STA   $D4
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00DE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         PEI   $E0
         JSL   L0919E1
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
L09170A  LDA   $EC
         SEC
         SBC   #$0000
         BVS   L091715
         EOR   #$8000
L091715  BMI   L09171A
         BRL   L0919D9
L09171A  LDA   $EC
         SEC
         SBC   $EA
         BVS   L091724
         EOR   #$8000
L091724  BPL   L091743
         SEC
         LDA   $D8
         SBC   $D4
         BNE   L091733
         LDA   $DA
         SBC   $D6
         BRA   L091739
L091733  LDA   $DA
         SBC   $D6
         REP   #$02
L091739  BVS   L09173E
         EOR   #$8000
L09173E  BPL   L091743
         BRL   L0919D9
L091743  LDA   $EC
         SEC
         SBC   $EA
         BVS   L09174D
         EOR   #$8000
L09174D  BMI   L091755
         STZ   $D8
         STZ   $DA
         STZ   $EA
L091755  LDA   $EA
         SEC
         SBC   $EC
         BVS   L09175F
         EOR   #$8000
L09175F  BMI   L09179F
         SEC
         LDA   $D8
         SBC   $D4
         BNE   L09176E
         LDA   $DA
         SBC   $D6
         BRA   L091774
L09176E  LDA   $DA
         SBC   $D6
         REP   #$02
L091774  BVS   L091779
         EOR   #$8000
L091779  BMI   L09179F
         PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         JSL   L091A7A
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         BRA   L091755
L09179F  LDA   $EA
         CMP   $EC
         BEQ   L0917A8
         BRL   L0919A9
L0917A8  LDX   $DA
         LDA   $D8
         CLC
         ADC   #$0002
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $DA
         STA   $D8
         PEA   ^L0C1A84
         PEA   L0C1A84
         _GetPen
         BCS   L0917CD
         LDA   #$0000
L0917CD  STAL  L0B0002
         JSL   L0951A8
         STA   $E2
L0917D7  PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L091BE6
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L091E64
         PLY
         PLY
         PEA   ^L0C27F9
         PEA   L0C27F9
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L09182E
         BRL   L091898
L09182E  PEA   ^L0C10BA
         PEA   L0C10BA
         _GetPen
         BCS   L091840
         LDA   #$0000
L091840  STAL  L0B0002
         LDX   L0B0030
         LDA   L0B002E
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STX   $6E
         STA   $6C
         LDA   #L0C10BA
         LDX   #^L0C10BA
         PHX
         PHA
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L091873
         DEX
L091873  SEC
         JSL   L010CB2
         LDX   $6E
         LDA   $6C
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         PEI   $F0
         PEI   $EE
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         INC   $E2
L091898  LDA   #$0000
         STAL  L0C10BC
         LDA   #$0000
         STAL  L0C10BA
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L0601C6
         PLY
         PLY
         LDAL  L0C10BC
         BNE   L0918C1
         LDAL  L0C10BA
         BEQ   L09191B
L0918C1  LDX   L0B0030
         LDA   L0B002E
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STX   $6E
         STA   $6C
         LDA   #L0C10BA
         LDX   #^L0C10BA
         PHX
         PHA
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L0918F0
         DEX
L0918F0  SEC
         JSL   L010CB2
         LDX   $6E
         LDA   $6C
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         PEI   $F0
         PEI   $EE
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDAL  L0C10BA
         STA   $E4
         INC   $E2
L09191B  SEC
         LDA   $D8
         SBC   $D4
         BNE   L091928
         LDA   $DA
         SBC   $D6
         BRA   L09192E
L091928  LDA   $DA
         SBC   $D6
         REP   #$02
L09192E  BVS   L091933
         EOR   #$8000
L091933  BMI   L09193E
         LDA   $EA
         CMP   $EC
         BNE   L09193E
         BRL   L0917D7
L09193E  LDA   #L0C0D1C
         LDX   #^L0C0D1C
         PHX
         PHA
         LDA   #L0C10BA
         LDX   #^L0C10BA
         PHX
         PHA
         LDY   #$0003
         JSL   L01122C
         BEQ   L0919A9
         LDX   L0B0030
         LDA   L0B002E
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STX   $6E
         STA   $6C
         LDA   #L0C0D1C
         LDX   #^L0C0D1C
         PHX
         PHA
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L091986
         DEX
L091986  SEC
         JSL   L010CB2
         LDX   $6E
         LDA   $6C
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         PEI   $F0
         PEI   $EE
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
L0919A9  PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00DE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         PEI   $E0
         JSL   L0919E1
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         BRL   L09170A
L0919D9  TSC
         CLC
         ADC   #$0088
         TCS
         PLD
         RTL

L0919E1  PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$00E0
         TCS
         LDA   $EF
         CMP   #$0000
         BNE   L0919FB
         LDA   [$F1]
         INC
         STA   [$F1]
         BRL   L091A72
L0919FB  LDA   $EF
         CMP   #$0001
         BNE   L091A2F
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010D87
         PLY
         PLY
         TAY
         BNE   L091A28
         LDA   #$FFFF
         STA   [$F1]
         BRA   L091A2D
L091A28  LDA   L0B0082
         STA   [$F1]
L091A2D  BRA   L091A72
L091A2F  LDA   $EF
         CMP   #$0002
         BNE   L091A72
         LDA   [$F1]
         INC
         STA   [$F1]
L091A3B  LDA   [$F1]
         PHA
         LDA   [$F5]
         PLX
         STX   $E4
         CMP   $E4
         BNE   L091A72
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010D87
         PLY
         PLY
         TAY
         BEQ   L091A6B
         LDA   L0B0082
         STA   [$F5]
L091A6B  LDA   [$F1]
         INC
         STA   [$F1]
         BRA   L091A3B
L091A72  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L091A7A  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E0
         TCS
         PHX
         PHA
         PEI   $FB
         PEI   $F9
         _GetHandleSize
         BCS   L091A97
         LDA   #$0000
L091A97  STAL  L0B0002
         PLA
         PLX
         STX   $E8
         STA   $E6
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0002
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L091ACD
         DEX
L091ACD  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         SEP   #$20
         STA   $E3
         REP   #$20
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         LDX   #$0000
         TAY
         BPL   L091B03
         DEX
L091B03  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         SEP   #$20
         STA   $E2
         REP   #$20
L091B1F  LDX   $E8
         LDA   $E6
         PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         JSL   L010B98
         BNE   L091B36
         BRL   L091BD9
L091B36  BVS   L091B3B
         EOR   #$8000
L091B3B  BMI   L091B40
         BRL   L091BD9
L091B40  LDA   $E3
         AND   #$00FF
         CMP   #$0025
         BNE   L091B57
         LDA   $E2
         AND   #$00FF
         CMP   #$0025
         BNE   L091B57
         BRL   L091BD9
L091B57  LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         STA   [$FD]
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         BCC   L091B6E
         INC
L091B6E  TAX
         LDY   #$0002
         STA   [$FD],Y
         PLA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L091B84
         DEX
L091B84  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         SEP   #$20
         STA   $E3
         REP   #$20
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         LDX   #$0000
         TAY
         BPL   L091BBA
         DEX
L091BBA  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         SEP   #$20
         STA   $E2
         REP   #$20
         BRL   L091B1F
L091BD9  LDA   [$F5]
         INC
         STA   [$F5]
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L091BE6  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00D8
         TCS
         LDX   $F3
         LDA   $F1
         STX   $DC
         STA   $DA
         PHX
         PHA
         PEI   $FB
         PEI   $F9
         _GetHandleSize
         BCS   L091C0B
         LDA   #$0000
L091C0B  STAL  L0B0002
         PLA
         PLX
         STX   $E2
         STA   $E0
         LDA   #$0001
         STA   $E4
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L091C29
         DEX
L091C29  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $DF
         REP   #$20
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         LDX   #$0000
         TAY
         BPL   L091C5F
         DEX
L091C5F  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $DE
         REP   #$20
L091C7B  LDA   $E4
         BNE   L091C82
         BRL   L091E53
L091C82  LDX   $E2
         LDA   $E0
         PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         JSL   L010B98
         BEQ   L091C9D
         BVS   L091C9B
         EOR   #$8000
L091C9B  BMI   L091CA2
L091C9D  STZ   $E4
         BRL   L091DEF
L091CA2  LDA   $DF
         AND   #$00FF
         CMP   #$0025
         BNE   L091CC0
         LDA   $DE
         AND   #$00FF
         CMP   #$0025
         BNE   L091CC0
         STZ   $E4
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L091DEF
L091CC0  LDA   $DF
         AND   #$00FF
         CMP   #$000D
         BEQ   L091CD7
         LDA   $DF
         AND   #$00FF
         CMP   #$000A
         BEQ   L091CD7
         BRL   L091D99
L091CD7  STZ   $E4
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         STA   [$FD]
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         BCC   L091CF0
         INC
L091CF0  TAX
         LDY   #$0002
         STA   [$FD],Y
         PLA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L091D06
         DEX
L091D06  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $DF
         REP   #$20
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         LDX   #$0000
         TAY
         BPL   L091D3C
         DEX
L091D3C  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $DE
         REP   #$20
         LDX   $E2
         LDA   $E0
         SEC
         SBC   #$0002
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         JSL   L010B98
         BEQ   L091D97
         BVS   L091D7C
         EOR   #$8000
L091D7C  BPL   L091D97
         LDA   $DF
         AND   #$00FF
         CMP   #$0025
         BNE   L091D97
         LDA   $DE
         AND   #$00FF
         CMP   #$0025
         BNE   L091D97
         LDA   [$F5]
         INC
         STA   [$F5]
L091D97  BRA   L091DEF
L091D99  LDA   $DF
         AND   #$00FF
         SEC
         SBC   #$0020
         BVS   L091DA7
         EOR   #$8000
L091DA7  BPL   L091DD1
         LDA   $DF
         AND   #$00FF
         SEC
         SBC   #$007E
         BEQ   L091DBB
         BVS   L091DB9
         EOR   #$8000
L091DB9  BMI   L091DD1
L091DBB  LDX   $F3
         LDA   $F1
         INC   $F1
         BNE   L091DC5
         INC   $F3
L091DC5  STA   $E6
         STX   $E8
         LDA   $DF
         SEP   #$20
         STA   [$E6]
         REP   #$20
L091DD1  LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         STA   [$FD]
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         BCC   L091DE8
         INC
L091DE8  TAX
         LDY   #$0002
         STA   [$FD],Y
         PLA
L091DEF  LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L091DFE
         DEX
L091DFE  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $DF
         REP   #$20
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         LDX   #$0000
         TAY
         BPL   L091E34
         DEX
L091E34  PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $DE
         REP   #$20
         BRL   L091C7B
L091E53  LDA   #$0000
         SEP   #$20
         STA   [$F1]
         REP   #$20
         TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L091E64  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EF
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L024E6B
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L0244F2
         PLY
         PLY
         TSC
         CLC
         ADC   #$0007
         TCS
         PLD
         RTL

L091E8B  ENT
L0E0066  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00A1
         TCS
         LDA   #$0001
         STA   L0B00A8
         LDA   $FF
         BRL   L092002
L091EA1  PEA   ^L0C27FA
         PEA   L0C27FA
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $A3
         LDA   $A3
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         STX   $BF
         STA   $BD
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L091F1A
         LDA   #$0000
L091F1A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00B5
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L091F3F
         LDA   #$0000
L091F3F  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0001
         PEA   $0002
         PEI   $BF
         PEI   $BD
         JSL   L071136
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         BRL   L092010
L091F65  LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0150
         PEA   $0002
         PEA   $01A2
         PEA   $0024
         _SetRect
         BCS   L091F97
         LDA   #$0000
L091F97  STAL  L0B0002
         LDX   #$0000
         TDC
         CLC
         ADC   #$00A5
         STA   $F4
         STX   $F6
         LDAL  L0C0731
         LDY   #$0002
         STA   [$F4],Y
         LDAL  L0C0733
         STA   $A5
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$00A5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L092010
L091FEC  JSL   L092018
         BRL   L092010
L091FF3  BRL   L092010
L091FF6  DA    L091EA1
         DA    L091FF3
         DA    L091FF3
         DA    L091F65
         DA    L091FEC
         DA    L091FF3
L092002  DEC
         CMP   #$0005
         BCC   L09200B
         LDA   #$0005
L09200B  ASL
         TAX
         JMP   (L091FF6,X)

L092010  TSC
         CLC
         ADC   #$0057
         TCS
         PLD
         RTL

L092018  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$FD27
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE0
         PHA
         JSL   L09361D
         PLY
         PLY
         STZ   $E4
         BRA   L092061
L092036  LDA   $E4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2466
         LDX   #^L0C2466
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F6],Y
         PLA
         STA   [$F6]
         INC   $E4
L092061  LDA   $E4
         SEC
         SBC   #$0020
         BVS   L09206C
         EOR   #$8000
L09206C  BPL   L092036
         LDA   #$0002
         STA   $EE
         LDA   #$0001
         STA   $EC
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L092099
         LDA   #$0000
L092099  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L0920BE
         LDA   #$0000
L0920BE  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FD48
         PHA
         LDAL  L0C0731
         PHA
         LDAL  L0C0733
         PHA
         _SetPt
         BCS   L0920E1
         LDA   #$0000
L0920E1  STAL  L0B0002
         LDAL  L0C0735
         STA   $F0
         PEA   ^L0C2805
         PEA   L0C2805
         PEA   $0000
         TDC
         CLC
         ADC   #$FD2A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FD2A
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $E6
         LDA   $E6
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         TAX
         LDY   #$0002
         LDA   [$F6],Y
         TXY
         LDX   #$FEDC
         STY   $02,X
         STA   $00,X
         TYX
         STZ   $E4
L09214A  LDA   $E4
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0759
         LDX   #^L0C0759
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         CMP   #$0000
         BNE   L09216E
         BRL   L092971
L09216E  PEA   $0000
         TDC
         CLC
         ADC   #$FDCC
         PHA
         LDX   #$FD4A
         LDA   $00,X
         SEC
         SBC   #$0018
         PHA
         LDX   #$FD48
         LDA   $00,X
         SEC
         SBC   #$0008
         PHA
         LDX   #$FD4A
         LDA   $00,X
         CLC
         ADC   #$0052
         SEC
         SBC   #$0018
         PHA
         LDX   #$FD48
         LDA   $00,X
         CLC
         ADC   #$0022
         SEC
         SBC   #$0008
         PHA
         _SetRect
         BCS   L0921B3
         LDA   #$0000
L0921B3  STAL  L0B0002
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FDCC
         PHA
         PEA   $0001
         PEA   $0005
         LDX   #$FD48
         LDA   $00,X
         PHA
         LDX   #$FD4A
         LDA   $00,X
         PHA
         LDX   #$FEDE
         LDA   $00,X
         TAX
         PHX
         LDX   #$FEDC
         LDA   $00,X
         PHA
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   $E4
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0759
         LDX   #^L0C0759
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         BRL   L092939
L09220D  LDX   #$0000
         TDC
         CLC
         ADC   #$FD48
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDX   #$0000
         TDC
         CLC
         ADC   #$FD4C
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD50
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0064
         PEA   $0000
         PEA   $001E
         PEA   $0008
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $0064
         PEA   $0000
         PEA   $0021
         PEA   $0021
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDA   $F0
         BRL   L09250E
L092296  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $00A8
         PEA   $0002
         PEA   $00FA
         PEA   $0024
         _SetRect
         BCS   L0922B7
         LDA   #$0000
L0922B7  STAL  L0B0002
         LDAL  L0C073D
         BEQ   L0922E8
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $00FC
         PEA   $0071
         PEA   $014E
         PEA   $0093
         _SetRect
         BCS   L0922E2
         LDA   #$0000
L0922E2  STAL  L0B0002
         BRA   L09230D
L0922E8  PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L092309
         LDA   #$0000
L092309  STAL  L0B0002
L09230D  PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         LDA   #$0003
         STA   $F0
         BRL   L09251B
L092348  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $01A4
         PEA   $004C
         PEA   $01F6
         PEA   $006E
         _SetRect
         BCS   L092369
         LDA   #$0000
L092369  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0150
         PEA   $0002
         PEA   $01A2
         PEA   $0024
         _SetRect
         BCS   L09238E
         LDA   #$0000
L09238E  STAL  L0B0002
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         STZ   $F0
         BRL   L09251B
L0923CA  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0150
         PEA   $0027
         PEA   $01A2
         PEA   $0049
         _SetRect
         BCS   L0923EB
         LDA   #$0000
L0923EB  STAL  L0B0002
         LDAL  L0C073D
         BEQ   L09241C
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0000
         PEA   $0071
         PEA   $0052
         PEA   $0093
         _SetRect
         BCS   L092416
         LDA   #$0000
L092416  STAL  L0B0002
         BRA   L092441
L09241C  PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $01A4
         PEA   $0002
         PEA   $01F6
         PEA   $0024
         _SetRect
         BCS   L09243D
         LDA   #$0000
L09243D  STAL  L0B0002
L092441  PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         LDA   #$0001
         STA   $F0
         BRL   L09251B
L09247C  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0150
         PEA   $004C
         PEA   $01A2
         PEA   $006E
         _SetRect
         BCS   L09249D
         LDA   #$0000
L09249D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0054
         PEA   $0002
         PEA   $00A6
         PEA   $0024
         _SetRect
         BCS   L0924C2
         LDA   #$0000
L0924C2  STAL  L0B0002
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         LDA   #$0002
         STA   $F0
         BRL   L09251B
L092501  BRL   L09251B
L092504  DA    L092296
         DA    L092348
         DA    L0923CA
         DA    L09247C
         DA    L092501
L09250E  CMP   #$0004
         BCC   L092516
         LDA   #$0004
L092516  ASL
         TAX
         JMP   (L092504,X)

L09251B  BRL   L09296C
L09251E  LDX   #$0000
         TDC
         CLC
         ADC   #$FD48
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDX   #$0000
         TDC
         CLC
         ADC   #$FD4C
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD50
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0064
         PEA   $0000
         PEA   $001E
         PEA   $0008
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $0064
         PEA   $0000
         PEA   $0021
         PEA   $0021
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDA   $F0
         BRL   L09281F
L0925A7  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $01A4
         PEA   $004C
         PEA   $01F6
         PEA   $006E
         _SetRect
         BCS   L0925C8
         LDA   #$0000
L0925C8  STAL  L0B0002
         LDAL  L0C073D
         BEQ   L0925F9
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0000
         PEA   $0071
         PEA   $0052
         PEA   $0093
         _SetRect
         BCS   L0925F3
         LDA   #$0000
L0925F3  STAL  L0B0002
         BRA   L09261E
L0925F9  PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $01A4
         PEA   $0002
         PEA   $01F6
         PEA   $0024
         _SetRect
         BCS   L09261A
         LDA   #$0000
L09261A  STAL  L0B0002
L09261E  PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         LDA   #$0001
         STA   $F0
         BRL   L09282C
L092659  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0150
         PEA   $0027
         PEA   $01A2
         PEA   $0049
         _SetRect
         BCS   L09267A
         LDA   #$0000
L09267A  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0054
         PEA   $0002
         PEA   $00A6
         PEA   $0024
         _SetRect
         BCS   L09269F
         LDA   #$0000
L09269F  STAL  L0B0002
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         LDA   #$0002
         STA   $F0
         BRL   L09282C
L0926DE  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0150
         PEA   $004C
         PEA   $01A2
         PEA   $006E
         _SetRect
         BCS   L0926FF
         LDA   #$0000
L0926FF  STAL  L0B0002
         LDAL  L0C073D
         BEQ   L092730
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $00FC
         PEA   $0071
         PEA   $014E
         PEA   $0093
         _SetRect
         BCS   L09272A
         LDA   #$0000
L09272A  STAL  L0B0002
         BRA   L092755
L092730  PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L092751
         LDA   #$0000
L092751  STAL  L0B0002
L092755  PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         LDA   #$0003
         STA   $F0
         BRL   L09282C
L092790  PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $00A8
         PEA   $0002
         PEA   $00FA
         PEA   $0024
         _SetRect
         BCS   L0927B1
         LDA   #$0000
L0927B1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE4
         PHA
         PEA   $0150
         PEA   $0002
         PEA   $01A2
         PEA   $0024
         _SetRect
         BCS   L0927D6
         LDA   #$0000
L0927D6  STAL  L0B0002
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         STZ   $F0
         BRL   L09282C
L092812  BRL   L09282C
L092815  DA    L0925A7
         DA    L092659
         DA    L0926DE
         DA    L092790
         DA    L092812
L09281F  CMP   #$0004
         BCC   L092827
         LDA   #$0004
L092827  ASL
         TAX
         JMP   (L092815,X)

L09282C  BRL   L09296C
L09282F  LDX   #$0000
         TDC
         CLC
         ADC   #$FD48
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDX   #$0000
         TDC
         CLC
         ADC   #$FD4C
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD50
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0056
         PEA   $0000
         PEA   $0026
         PEA   $000A
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0150
         PEA   $0071
         PEA   $01AA
         PEA   $0093
         _SetRect
         BCS   L0928B1
         LDA   #$0000
L0928B1  STAL  L0B0002
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4C
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDC
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L09296C
L0928EB  LDA   $E4
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0759
         LDX   #^L0C0759
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         SEC
         SBC   #$0030
         STA   $E2
         PEA   ^L0C2466
         PEA   L0C2466
         PEA   $0000
         TDC
         CLC
         ADC   #$FD48
         PHA
         PEI   $E2
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE0
         PHA
         PEI   $F0
         JSL   L0929A2
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         BRA   L09296C
         BRA   L09296C
L092939  CMP   #$004C
         BNE   L092941
         BRL   L09220D
L092941  CMP   #$0052
         BNE   L092949
         BRL   L09251E
L092949  CMP   #$0058
         BNE   L092951
         BRL   L09282F
L092951  CMP   #$006C
         BNE   L092959
         BRL   L09220D
L092959  CMP   #$0072
         BNE   L092961
         BRL   L09251E
L092961  CMP   #$0078
         BNE   L092969
         BRL   L09282F
L092969  JMP   L0928EB

L09296C  INC   $E4
         BRL   L09214A
L092971  LDX   #$FD4A
         LDA   $00,X
         PHA
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         LDX   #$FD48
         LDA   $00,X
         PHA
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
         PEI   $F0
         PEA   $0003
         JSL   L0251CD
         PLY
         PLY
         TSC
         CLC
         ADC   #$03D3
         TCS
         PLD
         RTL

L0929A2  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$FE76
         TCS
         LDA   #$0040
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         SEC
         SBC   #$0018
         SEC
         SBC   #$0110
         PHA
         LDA   [$F9]
         SEC
         SBC   #$0008
         SEC
         SBC   #$0035
         CLC
         ADC   #$0022
         PHA
         LDA   #$0008
         SEC
         JSL   L010AAE
         PLA
         PLX
         STX   $EA
         CLC
         ADC   $EA
         SEC
         JSL   L01092D
         PLY
         STA   $E2
         LDA   #$0040
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         SEC
         SBC   #$0018
         SEC
         SBC   #$0110
         PHA
         LDA   [$F9]
         SEC
         SBC   #$0008
         SEC
         SBC   #$0035
         CLC
         ADC   #$0022
         PHA
         LDA   #$0008
         SEC
         JSL   L010AAE
         PLA
         PLX
         STX   $EA
         SEC
         SBC   $EA
         SEC
         JSL   L01092D
         PLY
         STA   $E0
         LDA   $F7
         STA   $DC
         LDA   $F7
         STA   $DE
         LDA   #$006C
         SEP   #$20
         STA   $DB
         REP   #$20
L092A2E  LDA   $F1
         CMP   #$0000
         BNE   L092A39
         INC   $E2
         BRA   L092A58
L092A39  LDA   $F1
         CMP   #$0001
         BNE   L092A44
         INC   $E0
         BRA   L092A58
L092A44  LDA   $F1
         CMP   #$0002
         BNE   L092A4F
         DEC   $E2
         BRA   L092A58
L092A4F  LDA   $F1
         CMP   #$0003
         BNE   L092A58
         DEC   $E0
L092A58  LDA   $E0
         LDX   #$0000
         TAY
         BPL   L092A61
         DEX
L092A61  STX   $EA
         ASL
         ROL   $EA
         LDX   $EA
         PHX
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L092A73
         DEX
L092A73  PEA   $0000
         PEA   $0018
         CLC
         JSL   L010AF3
         LDX   $F5
         LDA   $F3
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         BEQ   L092AD0
         LDA   $E2
         SEC
         SBC   #$0000
         BVS   L092AA1
         EOR   #$8000
L092AA1  BPL   L092AD0
         LDA   $E2
         SEC
         SBC   #$000B
         BEQ   L092AB2
         BVS   L092AB0
         EOR   #$8000
L092AB0  BMI   L092AD0
L092AB2  LDA   $E0
         SEC
         SBC   #$0000
         BVS   L092ABD
         EOR   #$8000
L092ABD  BPL   L092AD0
         LDA   $E0
         SEC
         SBC   #$000A
         BEQ   L092ACE
         BVS   L092ACC
         EOR   #$8000
L092ACC  BMI   L092AD0
L092ACE  DEC   $DE
L092AD0  LDA   $E0
         LDX   #$0000
         TAY
         BPL   L092AD9
         DEX
L092AD9  STX   $EA
         ASL
         ROL   $EA
         LDX   $EA
         PHX
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L092AEB
         DEX
L092AEB  PEA   $0000
         PEA   $0018
         CLC
         JSL   L010AF3
         LDX   $F5
         LDA   $F3
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         BEQ   L092B58
         LDA   $E2
         SEC
         SBC   #$0000
         BVS   L092B19
         EOR   #$8000
L092B19  BPL   L092B58
         LDA   $E2
         SEC
         SBC   #$000B
         BEQ   L092B2A
         BVS   L092B28
         EOR   #$8000
L092B28  BMI   L092B58
L092B2A  LDA   $E0
         SEC
         SBC   #$0000
         BVS   L092B35
         EOR   #$8000
L092B35  BPL   L092B58
         LDA   $E0
         SEC
         SBC   #$000A
         BEQ   L092B46
         BVS   L092B44
         EOR   #$8000
L092B44  BMI   L092B58
L092B46  LDA   $DE
         SEC
         SBC   #$0000
         BEQ   L092B58
         BVS   L092B53
         EOR   #$8000
L092B53  BPL   L092B58
         BRL   L092A2E
L092B58  LDA   $F7
         SEC
         SBC   $DE
         STA   $F7
         LDA   $F7
         BNE   L092B66
         BRL   L09345A
L092B66  LDA   $DB
         AND   #$00FF
         CMP   #$0072
         BEQ   L092B73
         BRL   L092C07
L092B73  PEA   $0064
         PEA   $0000
         PEA   $0026
         PEA   $0014
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         PEA   $0056
         PEA   $0000
         PEA   $0026
         PEA   $000A
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$0006
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0004
         STA   [$FD],Y
         PEA   $0064
         PEA   $0000
         PEA   $0028
         PEA   $0014
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$000A
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0008
         STA   [$FD],Y
         PEA   $0057
         PEA   $0000
         PEA   $0024
         PEA   $000B
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$000E
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000C
         STA   [$FD],Y
         BRL   L092C98
L092C07  PEA   $0064
         PEA   $0000
         PEA   $0028
         PEA   $0014
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         PEA   $0057
         PEA   $0000
         PEA   $0024
         PEA   $000B
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$0006
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0004
         STA   [$FD],Y
         PEA   $0064
         PEA   $0000
         PEA   $0026
         PEA   $0014
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$000A
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0008
         STA   [$FD],Y
         PEA   $0056
         PEA   $0000
         PEA   $0026
         PEA   $000A
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$000E
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000C
         STA   [$FD],Y
L092C98  LDA   #$0004
         STA   $E4
         BRA   L092D01
L092C9F  LDA   $E4
         SEC
         SBC   #$0004
         LDX   #$0000
         TAY
         BPL   L092CAC
         DEX
L092CAC  STX   $EA
         ASL
         ROL   $EA
         ASL
         ROL   $EA
         LDX   $EA
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDY   #$0002
         LDA   [$E6],Y
         TAX
         LDA   [$E6]
         PHX
         PHA
         LDA   $E4
         LDX   #$0000
         TAY
         BPL   L092CD9
         DEX
L092CD9  STX   $EA
         ASL
         ROL   $EA
         ASL
         ROL   $EA
         LDX   $EA
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$E6],Y
         PLA
         STA   [$E6]
         INC   $E4
L092D01  LDA   $E4
         SEC
         SBC   #$001C
         BVS   L092D0C
         EOR   #$8000
L092D0C  BPL   L092C9F
         LDA   $F1
         BRL   L09344A
L092D13  STZ   $E4
         BRL   L092E6A
L092D18  LDA   $DB
         AND   #$00FF
         CMP   #$0072
         BNE   L092D5F
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0000
         PEA   $0027
         PEA   $0052
         PEA   $0049
         _SetRect
         BCS   L092D50
         LDA   #$0000
L092D50  STAL  L0B0002
         LDA   #$006C
         SEP   #$20
         STA   $DB
         REP   #$20
         BRA   L092D9A
L092D5F  LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $00A8
         PEA   $0027
         PEA   $00FA
         PEA   $0049
         _SetRect
         BCS   L092D8D
         LDA   #$0000
L092D8D  STAL  L0B0002
         LDA   #$0072
         SEP   #$20
         STA   $DB
         REP   #$20
L092D9A  LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0150
         PEA   $0002
         PEA   $01A2
         PEA   $0024
         _SetRect
         BCS   L092DCC
         LDA   #$0000
L092DCC  STAL  L0B0002
         LDY   #$0002
         LDA   [$F9],Y
         CLC
         ADC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         CLC
         ADC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDY   #$0002
         LDA   [$F9],Y
         CLC
         ADC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         CLC
         ADC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $E4
         CLC
         ADC   #$0002
         STA   $E4
L092E6A  LDA   $F7
         ASL
         SEC
         SBC   $E4
         BEQ   L092E7C
         BVS   L092E77
         EOR   #$8000
L092E77  BPL   L092E7C
         BRL   L092D18
L092E7C  PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$FE78
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         LDA   $F7
         ASL
         PHA
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L093457
L092EB1  STZ   $E4
         BRL   L0930BA
L092EB6  LDA   $DB
         AND   #$00FF
         CMP   #$0072
         BNE   L092F37
         LDAL  L0C073D
         BEQ   L092EFA
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $00A8
         PEA   $0071
         PEA   $00FA
         PEA   $0093
         _SetRect
         BCS   L092EF4
         LDA   #$0000
L092EF4  STAL  L0B0002
         BRA   L092F2C
L092EFA  LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $00FC
         PEA   $0027
         PEA   $014E
         PEA   $0049
         _SetRect
         BCS   L092F28
         LDA   #$0000
L092F28  STAL  L0B0002
L092F2C  LDA   #$006C
         SEP   #$20
         STA   $DB
         REP   #$20
         BRA   L092FAC
L092F37  LDAL  L0C073D
         BEQ   L092F71
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0054
         PEA   $0071
         PEA   $00A6
         PEA   $0093
         _SetRect
         BCS   L092F6B
         LDA   #$0000
L092F6B  STAL  L0B0002
         BRA   L092FA3
L092F71  LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0054
         PEA   $0027
         PEA   $00A6
         PEA   $0049
         _SetRect
         BCS   L092F9F
         LDA   #$0000
L092F9F  STAL  L0B0002
L092FA3  LDA   #$0072
         SEP   #$20
         STA   $DB
         REP   #$20
L092FAC  LDAL  L0C073D
         BEQ   L092FEA
         LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0000
         PEA   $0071
         PEA   $0052
         PEA   $0093
         _SetRect
         BCS   L092FE4
         LDA   #$0000
L092FE4  STAL  L0B0002
         BRA   L093020
L092FEA  LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $01A4
         PEA   $0002
         PEA   $01F6
         PEA   $0024
         _SetRect
         BCS   L09301C
         LDA   #$0000
L09301C  STAL  L0B0002
L093020  LDY   #$0002
         LDA   [$F9],Y
         SEC
         SBC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         CLC
         ADC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDY   #$0002
         LDA   [$F9],Y
         SEC
         SBC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         CLC
         ADC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $E4
         CLC
         ADC   #$0002
         STA   $E4
L0930BA  LDA   $F7
         ASL
         SEC
         SBC   $E4
         BEQ   L0930CC
         BVS   L0930C7
         EOR   #$8000
L0930C7  BPL   L0930CC
         BRL   L092EB6
L0930CC  PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$FE78
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         LDA   $F7
         ASL
         PHA
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L093457
L093101  STZ   $E4
         BRL   L093258
L093106  LDA   $DB
         AND   #$00FF
         CMP   #$0072
         BNE   L09314D
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $00A8
         PEA   $004C
         PEA   $00FA
         PEA   $006E
         _SetRect
         BCS   L09313E
         LDA   #$0000
L09313E  STAL  L0B0002
         LDA   #$006C
         SEP   #$20
         STA   $DB
         REP   #$20
         BRA   L093188
L09314D  LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0000
         PEA   $004C
         PEA   $0052
         PEA   $006E
         _SetRect
         BCS   L09317B
         LDA   #$0000
L09317B  STAL  L0B0002
         LDA   #$0072
         SEP   #$20
         STA   $DB
         REP   #$20
L093188  LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0054
         PEA   $0002
         PEA   $00A6
         PEA   $0024
         _SetRect
         BCS   L0931BA
         LDA   #$0000
L0931BA  STAL  L0B0002
         LDY   #$0002
         LDA   [$F9],Y
         SEC
         SBC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         SEC
         SBC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDY   #$0002
         LDA   [$F9],Y
         SEC
         SBC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         SEC
         SBC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $E4
         CLC
         ADC   #$0002
         STA   $E4
L093258  LDA   $F7
         ASL
         SEC
         SBC   $E4
         BEQ   L09326A
         BVS   L093265
         EOR   #$8000
L093265  BPL   L09326A
         BRL   L093106
L09326A  PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$FE78
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         LDA   $F7
         ASL
         PHA
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L093457
L09329F  STZ   $E4
         BRL   L0933F6
L0932A4  LDA   $DB
         AND   #$00FF
         CMP   #$0072
         BNE   L0932EB
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0054
         PEA   $004C
         PEA   $00A6
         PEA   $006E
         _SetRect
         BCS   L0932DC
         LDA   #$0000
L0932DC  STAL  L0B0002
         LDA   #$006C
         SEP   #$20
         STA   $DB
         REP   #$20
         BRA   L093326
L0932EB  LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $00FC
         PEA   $004C
         PEA   $014E
         PEA   $006E
         _SetRect
         BCS   L093319
         LDA   #$0000
L093319  STAL  L0B0002
         LDA   #$0072
         SEP   #$20
         STA   $DB
         REP   #$20
L093326  LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FF00
         JSL   L010922
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L093358
         LDA   #$0000
L093358  STAL  L0B0002
         LDY   #$0002
         LDA   [$F9],Y
         CLC
         ADC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         SEC
         SBC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDY   #$0002
         LDA   [$F9],Y
         CLC
         ADC   #$0010
         LDY   #$0002
         STA   [$F9],Y
         LDA   [$F9]
         SEC
         SBC   #$0002
         STA   [$F9]
         LDA   $F9
         LDX   $FB
         PHX
         PHA
         LDA   $E4
         CLC
         ADC   #$0001
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE78
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         PEI   $E8
         PEI   $E6
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $E4
         CLC
         ADC   #$0002
         STA   $E4
L0933F6  LDA   $F7
         ASL
         SEC
         SBC   $E4
         BEQ   L093408
         BVS   L093403
         EOR   #$8000
L093403  BPL   L093408
         BRL   L0932A4
L093408  PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$FE78
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         LDA   $F7
         ASL
         PHA
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L093457
L09343D  BRL   L093457
L093440  DA    L092D13
         DA    L092EB1
         DA    L093101
         DA    L09329F
         DA    L09343D
L09344A  CMP   #$0004
         BCC   L093452
         LDA   #$0004
L093452  ASL
         TAX
         JMP   (L093440,X)

L093457  BRL   L093592
L09345A  LDA   $F1
         BRL   L093539
L09345F  PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0150
         PEA   $0002
         PEA   $01A2
         PEA   $0024
         _SetRect
         BCS   L093480
         LDA   #$0000
L093480  STAL  L0B0002
         BRL   L093546
L093487  LDAL  L0C073D
         BEQ   L0934B4
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0000
         PEA   $0071
         PEA   $0052
         PEA   $0093
         _SetRect
         BCS   L0934AE
         LDA   #$0000
L0934AE  STAL  L0B0002
         BRA   L0934D9
L0934B4  PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $01A4
         PEA   $0002
         PEA   $01F6
         PEA   $0024
         _SetRect
         BCS   L0934D5
         LDA   #$0000
L0934D5  STAL  L0B0002
L0934D9  BRL   L093546
L0934DC  PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0054
         PEA   $0002
         PEA   $00A6
         PEA   $0024
         _SetRect
         BCS   L0934FD
         LDA   #$0000
L0934FD  STAL  L0B0002
         BRL   L093546
L093504  PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0052
         PEA   $0024
         _SetRect
         BCS   L093525
         LDA   #$0000
L093525  STAL  L0B0002
         BRL   L093546
L09352C  BRL   L093546
L09352F  DA    L09345F
         DA    L093487
         DA    L0934DC
         DA    L093504
         DA    L09352C
L093539  CMP   #$0004
         BCC   L093541
         LDA   #$0004
L093541  ASL
         TAX
         JMP   (L09352F,X)

L093546  LDA   $F9
         LDX   $FB
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE78
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$FE78
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEA   $0063
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
L093592  LDA   $F7
         SEC
         SBC   $DC
         BVS   L09359C
         EOR   #$8000
L09359C  BMI   L093615
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         PEA   $0059
         PEA   $0000
         PEA   $0024
         PEA   $0013
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$0006
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0004
         STA   [$FD],Y
         PEA   $0056
         PEA   $0000
         PEA   $0027
         PEA   $000A
         PEA   $0005
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$000A
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0008
         STA   [$FD],Y
         LDX   #$FFFF
         LDA   #$FFFF
         LDY   #$000E
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000C
         STA   [$FD],Y
         PEI   $FF
         PEI   $FD
         JSL   L0502A4
         PLY
         PLY
L093615  TSC
         CLC
         ADC   #$0274
         TCS
         PLD
         RTL

L09361D  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         STZ   $F0
         BRA   L093680
L09362C  STZ   $EE
         BRA   L093671
L093630  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L093639
         DEX
L093639  STX   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L09364B
         DEX
L09364B  PEA   $0000
         PEA   $0018
         CLC
         JSL   L010AF3
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0001
         STA   [$F2]
         INC   $EE
L093671  LDA   $EE
         SEC
         SBC   #$000C
         BVS   L09367C
         EOR   #$8000
L09367C  BPL   L093630
         INC   $F0
L093680  LDA   $F0
         SEC
         SBC   #$000C
         BVS   L09368B
         EOR   #$8000
L09368B  BPL   L09362C
         STZ   $F0
         BRA   L0936BD
L093691  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L09369A
         DEX
L09369A  PEA   $0000
         PEA   $0018
         CLC
         JSL   L010AF3
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0016
         STA   [$F2],Y
         INC   $F0
L0936BD  LDA   $F0
         SEC
         SBC   #$000C
         BVS   L0936C8
         EOR   #$8000
L0936C8  BPL   L093691
         STZ   $F0
         BRA   L0936F7
L0936CE  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L0936D7
         DEX
L0936D7  PEA   $0000
         PEA   $0018
         CLC
         JSL   L010AF3
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         STA   [$F2]
         INC   $F0
L0936F7  LDA   $F0
         SEC
         SBC   #$000C
         BVS   L093702
         EOR   #$8000
L093702  BPL   L0936CE
         LDA   $FD
         CLC
         ADC   #$0060
         LDX   $FF
         BCC   L09370F
         INX
L09370F  STA   $F2
         STX   $F4
         LDA   #$0001
         STA   [$F2]
         LDA   #$0000
         LDY   #$0002
         STA   [$FD],Y
         LDA   $FD
         CLC
         ADC   #$0018
         LDX   $FF
         BCC   L09372B
         INX
L09372B  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0002
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$00C0
         LDX   $FF
         BCC   L093742
         INX
L093742  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0002
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$00D8
         LDX   $FF
         BCC   L093759
         INX
L093759  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0002
         STA   [$F2],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$FD],Y
         LDA   $FD
         CLC
         ADC   #$00D8
         LDX   $FF
         BCC   L093778
         INX
L093778  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0004
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$00F0
         LDX   $FF
         BCC   L09378F
         INX
L09378F  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0004
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0108
         LDX   $FF
         BCC   L0937A6
         INX
L0937A6  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0006
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0108
         LDX   $FF
         BCC   L0937BD
         INX
L0937BD  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$000C
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0108
         LDX   $FF
         BCC   L0937D4
         INX
L0937D4  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$000E
         STA   [$F2],Y
         LDA   #$0000
         LDY   #$0010
         STA   [$FD],Y
         LDA   $FD
         CLC
         ADC   #$0108
         LDX   $FF
         BCC   L0937F3
         INX
L0937F3  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0010
         STA   [$F2],Y
         LDA   #$0000
         LDY   #$0012
         STA   [$FD],Y
         LDA   $FD
         CLC
         ADC   #$0018
         LDX   $FF
         BCC   L093812
         INX
L093812  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0012
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0030
         LDX   $FF
         BCC   L093829
         INX
L093829  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0012
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0108
         LDX   $FF
         BCC   L093840
         INX
L093840  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0012
         STA   [$F2],Y
         STZ   $F0
         BRA   L09387C
L093850  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L093859
         DEX
L093859  PEA   $0000
         PEA   $0018
         CLC
         JSL   L010AF3
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0014
         STA   [$F2],Y
         INC   $F0
L09387C  LDA   $F0
         SEC
         SBC   #$000C
         BVS   L093887
         EOR   #$8000
L093887  BPL   L093850
         LDA   $FD
         CLC
         ADC   #$0078
         LDX   $FF
         BCC   L093894
         INX
L093894  STA   $F2
         STX   $F4
         LDA   #$0001
         LDY   #$0014
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0090
         LDX   $FF
         BCC   L0938AB
         INX
L0938AB  STA   $F2
         STX   $F4
         LDA   #$0001
         LDY   #$0014
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$00A8
         LDX   $FF
         BCC   L0938C2
         INX
L0938C2  STA   $F2
         STX   $F4
         LDA   #$0001
         LDY   #$0014
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$00C0
         LDX   $FF
         BCC   L0938D9
         INX
L0938D9  STA   $F2
         STX   $F4
         LDA   #$0001
         LDY   #$0014
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$00D8
         LDX   $FF
         BCC   L0938F0
         INX
L0938F0  STA   $F2
         STX   $F4
         LDA   #$0001
         LDY   #$0014
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0060
         LDX   $FF
         BCC   L093907
         INX
L093907  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$0008
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0060
         LDX   $FF
         BCC   L09391E
         INX
L09391E  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$000A
         STA   [$F2],Y
         LDA   $FD
         CLC
         ADC   #$0078
         LDX   $FF
         BCC   L093935
         INX
L093935  STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$000A
         STA   [$F2],Y
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L093949  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0B00B2
         AND   #$00FF
         CMP   #$000B
         BEQ   L093985
         LDA   L0B00B2
         AND   #$00FF
         CMP   #$0008
         BEQ   L093985
         LDA   L0B00B2
         AND   #$00FF
         CMP   #$000A
         BEQ   L093985
         LDA   L0B00B2
         AND   #$00FF
         CMP   #$0015
         BEQ   L093985
         LDA   #$0000
         BRA   L093988
L093985  LDA   #$0001
L093988  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L093992  ENT
L0E0082  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00DA
         TCS
         STZ   $EA
         LDX   #$0000
         LDA   #$001E
         STX   $E2
         STA   $E0
         JSL   L0311DD
         JSL   L0612B1
         STZ   L0B0078
         STZ   $EC
         PEA   ^L0C280F
         PEA   L0C280F
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0072
         PHA
         LDAL  L0C0731
         SEC
         JSL   L010AAE
         LDAL  L0C0F7C
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $E6
         LDA   L0B0070
         PHA
         LDAL  L0C0733
         CLC
         ADC   #$0001
         SEC
         JSL   L010AAE
         LDAL  L0C0F7A
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $E8
         LDA   L0B0072
         PHA
         LDAL  L0C0F80
         SEC
         SBCL  L0C0F7C
         SEC
         JSL   L01092D
         PLY
         STA   $F2
         LDA   L0B0070
         PHA
         LDAL  L0C0F7E
         SEC
         SBCL  L0C0F7A
         SEC
         JSL   L01092D
         PLY
         SEC
         SBC   #$0001
         STA   $F0
         PEA   $0002
         _SetPenMode
         BCS   L093A3D
         LDA   #$0000
L093A3D  STAL  L0B0002
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L093A54
         LDA   #$0000
L093A54  STAL  L0B0002
         PLA
L093A59  LDA   $E6
         SEC
         SBC   #$0001
         PHA
         PEI   $E8
         _MoveTo
         BCS   L093A6E
         LDA   #$0000
L093A6E  STAL  L0B0002
L093A72  JSL   L06063A
         LDX   $E2
         LDA   $E0
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L093A8A
         LDA   #$0000
L093A8A  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   $DC
         PHA
         TXA
         SBC   $DE
         TAX
         PLA
         JSL   L010B98
         BEQ   L093AA1
         BCS   L093AFF
L093AA1  LDA   $E6
         SEC
         SBC   #$0001
         PHA
         PEI   $E8
         _MoveTo
         BCS   L093AB6
         LDA   #$0000
L093AB6  STAL  L0B0002
         PEA   $0000
         LDA   L0B0070
         SEC
         SBC   #$0001
         EOR   #$FFFF
         INC
         PHA
         _Line
         BCS   L093AD5
         LDA   #$0000
L093AD5  STAL  L0B0002
         PHX
         PHA
         _TickCount
         BCS   L093AE7
         LDA   #$0000
L093AE7  STAL  L0B0002
         PLA
         PLX
         STX   $DE
         STA   $DC
         LDA   $EA
         BEQ   L093AFA
         LDA   #$0000
         BRA   L093AFD
L093AFA  LDA   #$0001
L093AFD  STA   $EA
L093AFF  LDAL  L0C1A7A
         CMP   #$0000
         BNE   L093B12
         JSL   L0612DE
         TAY
         BNE   L093B12
         BRL   L093A72
L093B12  JSL   L04169A
         TAY
         BEQ   L093B1C
         BRL   L093D7F
L093B1C  LDA   L0B0078
         CMP   #$0003
         BNE   L093B27
         BRL   L093D7F
L093B27  LDA   $EA
         BEQ   L093B65
         LDA   $E6
         SEC
         SBC   #$0001
         PHA
         PEI   $E8
         _MoveTo
         BCS   L093B40
         LDA   #$0000
L093B40  STAL  L0B0002
         PEA   $0000
         LDA   L0B0070
         SEC
         SBC   #$0001
         EOR   #$FFFF
         INC
         PHA
         _Line
         BCS   L093B5F
         LDA   #$0000
L093B5F  STAL  L0B0002
         STZ   $EA
L093B65  LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L093B77
         LDAL  L0C1A7A
         CMP   #$0005
         BNE   L093B84
L093B77  LDAL  L0C1A7E
         TAX
         LDAL  L0C1A7C
         STA   $EE
         BRA   L093B86
L093B84  STZ   $EE
L093B86  LDA   $EE
         BRL   L093D2B
L093B8B  LDAL  L0C0731
         SEC
         SBC   $F2
         BVS   L093B97
         EOR   #$8000
L093B97  BPL   L093BE1
         LDAL  L0C0733
         SEC
         SBC   $F0
         BVS   L093BA5
         EOR   #$8000
L093BA5  BMI   L093BC7
         LDA   #$0000
         STAL  L0C0731
         LDAL  L0C0F7C
         STA   $E6
         LDAL  L0C0733
         INC
         STAL  L0C0733
         LDA   $E8
         CLC
         ADC   L0B0070
         STA   $E8
         BRA   L093BDF
L093BC7  PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L093BDA
         LDA   #$0000
L093BDA  STAL  L0B0002
         PLA
L093BDF  BRA   L093BF2
L093BE1  LDAL  L0C0731
         INC
         STAL  L0C0731
         LDA   $E6
         CLC
         ADC   L0B0072
         STA   $E6
L093BF2  BRL   L093D4E
L093BF5  LDAL  L0C0731
         SEC
         SBC   #$0000
         BEQ   L093C09
         BVS   L093C04
         EOR   #$8000
L093C04  BPL   L093C09
         BRL   L093C64
L093C09  LDAL  L0C0733
         SEC
         SBC   #$0000
         BEQ   L093C4A
         BVS   L093C18
         EOR   #$8000
L093C18  BPL   L093C4A
         LDA   $F2
         STAL  L0C0731
         LDA   $F2
         PHA
         LDA   L0B0072
         SEC
         JSL   L010AAE
         LDAL  L0C0F7C
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $E6
         LDAL  L0C0733
         DEC
         STAL  L0C0733
         LDA   $E8
         SEC
         SBC   L0B0070
         STA   $E8
         BRA   L093C62
L093C4A  PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L093C5D
         LDA   #$0000
L093C5D  STAL  L0B0002
         PLA
L093C62  BRA   L093C75
L093C64  LDAL  L0C0731
         DEC
         STAL  L0C0731
         LDA   $E6
         SEC
         SBC   L0B0072
         STA   $E6
L093C75  BRL   L093D4E
L093C78  LDAL  L0C0733
         SEC
         SBC   $F0
         BVS   L093C84
         EOR   #$8000
L093C84  BPL   L093CA0
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L093C99
         LDA   #$0000
L093C99  STAL  L0B0002
         PLA
         BRA   L093CB1
L093CA0  LDAL  L0C0733
         INC
         STAL  L0C0733
         LDA   $E8
         CLC
         ADC   L0B0070
         STA   $E8
L093CB1  BRL   L093D4E
L093CB4  LDAL  L0C0733
         SEC
         SBC   #$0000
         BEQ   L093CC5
         BVS   L093CC3
         EOR   #$8000
L093CC3  BMI   L093CDF
L093CC5  PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L093CD8
         LDA   #$0000
L093CD8  STAL  L0B0002
         PLA
         BRA   L093CF0
L093CDF  LDAL  L0C0733
         DEC
         STAL  L0C0733
         LDA   $E8
         SEC
         SBC   L0B0070
         STA   $E8
L093CF0  BRL   L093D4E
L093CF3  LDAL  L0C0731
         PHA
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C0733
         PHA
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L093D22
         LDA   #$0000
L093D22  STAL  L0B0002
         PLA
         BRA   L093D4E
         BRA   L093D4E
L093D2B  CMP   #$0008
         BNE   L093D33
         BRL   L093BF5
L093D33  CMP   #$000A
         BNE   L093D3B
         BRL   L093C78
L093D3B  CMP   #$000B
         BNE   L093D43
         BRL   L093CB4
L093D43  CMP   #$0015
         BNE   L093D4B
         BRL   L093B8B
L093D4B  JMP   L093CF3

L093D4E  LDAL  L0C0731
         CMPL  L0C0743
         BNE   L093D62
         LDAL  L0C0733
         CMPL  L0C0745
         BEQ   L093D67
L093D62  LDA   #$0000
         BRA   L093D6A
L093D67  LDA   #$0001
L093D6A  STA   $EC
         LDX   $DE
         LDA   $DC
         SEC
         SBC   $E0
         PHA
         TXA
         SBC   $E2
         TAX
         PLA
         STX   $DE
         STA   $DC
         BRA   L093DC8
L093D7F  LDA   L0B0078
         PHA
         JSL   L0607BE
         PLY
         LDA   $EA
         BEQ   L093DC6
         LDA   $E6
         SEC
         SBC   #$0001
         PHA
         PEI   $E8
         _MoveTo
         BCS   L093DA1
         LDA   #$0000
L093DA1  STAL  L0B0002
         PEA   $0000
         LDA   L0B0070
         SEC
         SBC   #$0001
         EOR   #$FFFF
         INC
         PHA
         _Line
         BCS   L093DC0
         LDA   #$0000
L093DC0  STAL  L0B0002
         STZ   $EA
L093DC6  BRA   L093DCF
L093DC8  LDA   $EC
         BNE   L093DCF
         BRL   L093A59
L093DCF  LDAL  L0C0731
         PHA
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C0733
         PHA
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
         PEA   $0000
         _SetPenMode
         BCS   L093DFA
         LDA   #$0000
L093DFA  STAL  L0B0002
         LDA   $EC
         BEQ   L093E16
         PEA   ^L0C2811
         PEA   L0C2811
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L093E16  JSL   L031208
         TSC
         CLC
         ADC   #$0020
         TCS
         PLD
         RTL

L093E22  PHD
         TSC
         SEC
         SBC   #$00E5
         TCD
         ADC   #$00D0
         TCS
         LDA   [$EF]
         PHA
         LDA   #$0056
         SEC
         JSL   L010AAE
         LDA   #$001E
         PLX
         STX   $E4
         CLC
         ADC   $E4
         STA   $DE
         LDA   [$F3]
         PHA
         LDA   #$0025
         SEC
         JSL   L010AAE
         LDA   #$000F
         PLX
         STX   $E4
         CLC
         ADC   $E4
         SEC
         SBC   #$0004
         STA   $DC
         PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         PEI   $DE
         PEI   $DC
         LDA   $DE
         CLC
         ADC   #$0044
         PHA
         LDA   $DC
         CLC
         ADC   #$001C
         SEC
         SBC   #$0001
         PHA
         _SetRect
         BCS   L093E88
         LDA   #$0000
L093E88  STAL  L0B0002
         LDA   $FF
         AND   #$00FF
         BRL   L093FDE
L093E94  PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         _EraseRect
         BCS   L093EA9
         LDA   #$0000
L093EA9  STAL  L0B0002
         LDA   $DC
         SEC
         SBC   #$0025
         STA   $DC
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $DC
         PEI   $DE
         PEI   $ED
         PEI   $EB
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   [$F3]
         SEC
         SBC   #$0001
         STA   [$F3]
         BRL   L093FFE
L093EE6  PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         _EraseRect
         BCS   L093EFB
         LDA   #$0000
L093EFB  STAL  L0B0002
         LDA   $DC
         CLC
         ADC   #$0025
         STA   $DC
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $DC
         PEI   $DE
         PEI   $ED
         PEI   $EB
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   [$F3]
         CLC
         ADC   #$0001
         STA   [$F3]
         BRL   L093FFE
L093F38  PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         _EraseRect
         BCS   L093F4D
         LDA   #$0000
L093F4D  STAL  L0B0002
         LDA   $DE
         SEC
         SBC   #$0056
         STA   $DE
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $DC
         PEI   $DE
         PEI   $ED
         PEI   $EB
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   [$EF]
         SEC
         SBC   #$0001
         STA   [$EF]
         BRL   L093FFE
L093F8A  PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         _EraseRect
         BCS   L093F9F
         LDA   #$0000
L093F9F  STAL  L0B0002
         LDA   $DE
         CLC
         ADC   #$0056
         STA   $DE
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $DC
         PEI   $DE
         PEI   $ED
         PEI   $EB
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   [$EF]
         CLC
         ADC   #$0001
         STA   [$EF]
         BRL   L093FFE
L093FDC  BRA   L093FFE
L093FDE  CMP   #$0064
         BNE   L093FE6
         BRL   L093EE6
L093FE6  CMP   #$006C
         BNE   L093FEE
         BRL   L093F38
L093FEE  CMP   #$0072
         BEQ   L093F8A
         CMP   #$0075
         BNE   L093FFB
         BRL   L093E94
L093FFB  JMP   L093FDC

L093FFE  TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L094006  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00C2
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00E2
         PHA
         PEA   $00D8
         PEA   $0023
         PEA   $011C
         PEA   $003E
         _SetRect
         BCS   L094032
         LDA   #$0000
L094032  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $00D8
         PEA   $0000
         PEA   $0126
         PEA   $0021
         _SetRect
         BCS   L094057
         LDA   #$0000
L094057  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         PEA   $00D8
         PEA   $0040
         PEA   $011C
         PEA   $005B
         _SetRect
         BCS   L09407C
         LDA   #$0000
L09407C  STAL  L0B0002
         LDA   [$F9]
         PHA
         LDA   #$0012
         SEC
         JSL   L010AAE
         LDA   [$F9]
         PHA
         LDA   #$0044
         SEC
         JSL   L010AAE
         LDA   #$001E
         PLX
         STX   $EE
         CLC
         ADC   $EE
         PLX
         STX   $EE
         CLC
         ADC   $EE
         STA   $C8
         LDA   [$FD]
         PHA
         LDA   #$0009
         SEC
         JSL   L010AAE
         LDA   [$FD]
         PHA
         LDA   #$001C
         SEC
         JSL   L010AAE
         LDA   #$000F
         PLX
         STX   $EE
         CLC
         ADC   $EE
         PLX
         STX   $EE
         CLC
         ADC   $EE
         SEC
         SBC   #$0004
         STA   $C6
         PEA   $0000
         TDC
         CLC
         ADC   #$00CA
         PHA
         PEI   $C8
         PEI   $C6
         LDA   $C8
         CLC
         ADC   #$0044
         PHA
         LDA   $C6
         CLC
         ADC   #$001C
         SEC
         SBC   #$0001
         PHA
         _SetRect
         BCS   L0940FD
         LDA   #$0000
L0940FD  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00CA
         PHA
         _EraseRect
         BCS   L094116
         LDA   #$0000
L094116  STAL  L0B0002
         LDA   $C8
         CLC
         ADC   #$0056
         STA   $C8
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00E2
         PHA
         PEA   $0001
         PEA   $0004
         PEA   $0028
         PEA   $01CC
         PEI   $F7
         PEI   $F5
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $0005
         JSL   L06135C
         PLY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         PEA   $0001
         PEA   $0003
         PEA   $0028
         PEA   $01CC
         PEI   $F7
         PEI   $F5
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $0001
         PEA   $0004
         PEA   $0008
         PEA   $021C
         PEI   $F7
         PEI   $F5
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   #$0005
         STA   [$F9]
         LDA   #$0001
         STA   [$FD]
         TSC
         CLC
         ADC   #$002C
         TCS
         PLD
         RTL

L0941B4  PHD
         TSC
         SEC
         SBC   #$00D7
         TCD
         ADC   #$00C8
         TCS
         LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0C2468
         PLA
         STAL  L0C2466
         PEA   $007F
         PEA   $0000
         PEA   $0027
         PEA   $000D
         PEA   $0000
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L0C246C
         PLA
         STAL  L0C246A
         LDX   #$FFFF
         LDA   #$FFFF
         PHA
         TXA
         STAL  L0C2470
         PLA
         STAL  L0C246E
         LDA   [$E1]
         PHA
         LDA   #$0012
         SEC
         JSL   L010AAE
         LDA   [$E1]
         PHA
         LDA   #$0044
         SEC
         JSL   L010AAE
         LDA   #$001E
         PLX
         STX   $D6
         CLC
         ADC   $D6
         PLX
         STX   $D6
         CLC
         ADC   $D6
         STA   $D0
         LDA   [$E5]
         PHA
         LDA   #$0009
         SEC
         JSL   L010AAE
         LDA   [$E5]
         PHA
         LDA   #$001C
         SEC
         JSL   L010AAE
         LDA   #$000F
         PLX
         STX   $D6
         CLC
         ADC   $D6
         PLX
         STX   $D6
         CLC
         ADC   $D6
         SEC
         SBC   #$0004
         STA   $CE
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F1
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $CE
         PEI   $D0
         PEI   $DF
         PEI   $DD
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   ^L0C2466
         PEA   L0C2466
         JSL   L0502A4
         PLY
         PLY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $CE
         PEI   $D0
         PEI   $DF
         PEI   $DD
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0942B6  PHD
         TSC
         SEC
         SBC   #$00CB
         TCD
         ADC   #$00C4
         TCS
         PEI   $D3
         PEI   $D1
         PEA   $0000
         PEA   $003A
         PEA   $0044
         PEA   $0055
         _SetRect
         BCS   L0942DD
         LDA   #$0000
L0942DD  STAL  L0B0002
         PEI   $D7
         PEI   $D5
         PEA   $0048
         PEA   $003A
         PEA   $008C
         PEA   $0055
         _SetRect
         BCS   L0942FD
         LDA   #$0000
L0942FD  STAL  L0B0002
         PEI   $DB
         PEI   $D9
         PEA   $0090
         PEA   $003A
         PEA   $00D4
         PEA   $0055
         _SetRect
         BCS   L09431D
         LDA   #$0000
L09431D  STAL  L0B0002
         PEI   $DF
         PEI   $DD
         PEA   $0000
         PEA   $0000
         PEA   $0044
         PEA   $001B
         _SetRect
         BCS   L09433D
         LDA   #$0000
L09433D  STAL  L0B0002
         PEI   $E3
         PEI   $E1
         PEA   $0048
         PEA   $0000
         PEA   $008C
         PEA   $001B
         _SetRect
         BCS   L09435D
         LDA   #$0000
L09435D  STAL  L0B0002
         PEI   $E7
         PEI   $E5
         PEA   $0090
         PEA   $0000
         PEA   $00D4
         PEA   $001B
         _SetRect
         BCS   L09437D
         LDA   #$0000
L09437D  STAL  L0B0002
         PEI   $EB
         PEI   $E9
         PEA   $0000
         PEA   $0057
         PEA   $0044
         PEA   $0072
         _SetRect
         BCS   L09439D
         LDA   #$0000
L09439D  STAL  L0B0002
         PEI   $EF
         PEI   $ED
         PEA   $0048
         PEA   $0057
         PEA   $008C
         PEA   $0072
         _SetRect
         BCS   L0943BD
         LDA   #$0000
L0943BD  STAL  L0B0002
         PEI   $F3
         PEI   $F1
         PEA   $0090
         PEA   $0057
         PEA   $00D4
         PEA   $0072
         _SetRect
         BCS   L0943DD
         LDA   #$0000
L0943DD  STAL  L0B0002
         PEI   $F7
         PEI   $F5
         PEA   $0000
         PEA   $001D
         PEA   $0044
         PEA   $0038
         _SetRect
         BCS   L0943FD
         LDA   #$0000
L0943FD  STAL  L0B0002
         PEI   $FB
         PEI   $F9
         PEA   $0048
         PEA   $001D
         PEA   $008C
         PEA   $0038
         _SetRect
         BCS   L09441D
         LDA   #$0000
L09441D  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEA   $0090
         PEA   $001D
         PEA   $00D4
         PEA   $0038
         _SetRect
         BCS   L09443D
         LDA   #$0000
L09443D  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L094449  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$006E
         TCS
         LDA   #$0001
         STA   $F0
         LDA   #$0004
         STA   $EE
         JSL   L0311DD
         PEA   ^L0C2813
         PEA   L0C2813
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$0070
         PHA
         JSL   L040E53
         PLY
         PLY
         PHA
         LDA   #$0022
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1AB2
         LDX   #^L0C1AB2
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         TAX
         LDY   #$0002
         LDA   [$F6],Y
         STX   $F4
         STA   $F2
         LDA   #$0000
         STAL  L0C2820
         LDA   #$0000
         STAL  L0C2848
         LDA   #L0C2820
         LDX   #^L0C2820
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2848
         LDX   #^L0C2848
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2820
         LDX   #^L0C2820
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2848
         LDX   #^L0C2848
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2820
         LDX   #^L0C2820
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2848
         LDX   #^L0C2848
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2870
         LDA   #$0000
         STAL  L0C2898
         LDA   #L0C2870
         LDX   #^L0C2870
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2898
         LDX   #^L0C2898
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2870
         LDX   #^L0C2870
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2898
         LDX   #^L0C2898
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2870
         LDX   #^L0C2870
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2898
         LDX   #^L0C2898
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C28C0
         LDA   #L0C28C0
         LDX   #^L0C28C0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28C0
         LDX   #^L0C28C0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28C0
         LDX   #^L0C28C0
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0001
         STAL  L0C2828
         LDA   #$0001
         STAL  L0C2850
         LDA   #L0C2828
         LDX   #^L0C2828
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2850
         LDX   #^L0C2850
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2828
         LDX   #^L0C2828
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2850
         LDX   #^L0C2850
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2828
         LDX   #^L0C2828
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2850
         LDX   #^L0C2850
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2878
         LDA   #$0000
         STAL  L0C28A0
         LDA   #L0C2878
         LDX   #^L0C2878
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28A0
         LDX   #^L0C28A0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2878
         LDX   #^L0C2878
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28A0
         LDX   #^L0C28A0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2878
         LDX   #^L0C2878
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C28A0
         LDX   #^L0C28A0
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0001
         STAL  L0C28C8
         LDA   #L0C28C8
         LDX   #^L0C28C8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28C8
         LDX   #^L0C28C8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28C8
         LDX   #^L0C28C8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0001
         STAL  L0C2830
         LDA   #$0001
         STAL  L0C2858
         LDA   #L0C2830
         LDX   #^L0C2830
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2858
         LDX   #^L0C2858
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2830
         LDX   #^L0C2830
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2858
         LDX   #^L0C2858
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2830
         LDX   #^L0C2830
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2858
         LDX   #^L0C2858
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2880
         LDA   #$0001
         STAL  L0C28A8
         LDA   #L0C2880
         LDX   #^L0C2880
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28A8
         LDX   #^L0C28A8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2880
         LDX   #^L0C2880
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28A8
         LDX   #^L0C28A8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2880
         LDX   #^L0C2880
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C28A8
         LDX   #^L0C28A8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C28D0
         LDA   #$0000
         STAL  L0C28F8
         LDA   #L0C28D0
         LDX   #^L0C28D0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28F8
         LDX   #^L0C28F8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28D0
         LDX   #^L0C28D0
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28F8
         LDX   #^L0C28F8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28D0
         LDX   #^L0C28D0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C28F8
         LDX   #^L0C28F8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2920
         LDA   #L0C2920
         LDX   #^L0C2920
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2920
         LDX   #^L0C2920
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2920
         LDX   #^L0C2920
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2888
         LDA   #$0000
         STAL  L0C28B0
         LDA   #L0C2888
         LDX   #^L0C2888
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28B0
         LDX   #^L0C28B0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2888
         LDX   #^L0C2888
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28B0
         LDX   #^L0C28B0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2888
         LDX   #^L0C2888
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C28B0
         LDX   #^L0C28B0
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C28D8
         LDA   #$0001
         STAL  L0C2900
         LDA   #L0C28D8
         LDX   #^L0C28D8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2900
         LDX   #^L0C2900
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28D8
         LDX   #^L0C28D8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2900
         LDX   #^L0C2900
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28D8
         LDX   #^L0C28D8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2900
         LDX   #^L0C2900
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0001
         STAL  L0C2928
         LDA   #L0C2928
         LDX   #^L0C2928
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2928
         LDX   #^L0C2928
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2928
         LDX   #^L0C2928
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2868
         LDA   #$0001
         STAL  L0C2890
         LDA   #L0C2868
         LDX   #^L0C2868
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2890
         LDX   #^L0C2890
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2868
         LDX   #^L0C2868
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2890
         LDX   #^L0C2890
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2868
         LDX   #^L0C2868
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2890
         LDX   #^L0C2890
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0001
         STAL  L0C28B8
         LDA   #$0001
         STAL  L0C28E0
         LDA   #L0C28B8
         LDX   #^L0C28B8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28E0
         LDX   #^L0C28E0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C28B8
         LDX   #^L0C28B8
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28E0
         LDX   #^L0C28E0
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C28B8
         LDX   #^L0C28B8
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C28E0
         LDX   #^L0C28E0
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #$0000
         STAL  L0C2908
         LDA   #$0001
         STAL  L0C2930
         LDA   #L0C2908
         LDX   #^L0C2908
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2930
         LDX   #^L0C2930
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         LDA   #L0C2908
         LDX   #^L0C2908
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2930
         LDX   #^L0C2930
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0004
         STA   [$F6],Y
         LDA   #L0C2908
         LDX   #^L0C2908
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0006
         STA   [$F6],Y
         LDA   #L0C2930
         LDX   #^L0C2930
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0006
         STA   [$F6],Y
         PEA   $0000
         TDC
         CLC
         ADC   #$00B6
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0044
         PEA   $001B
         _SetRect
         BCS   L094B83
         LDA   #$0000
L094B83  STAL  L0B0002
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00B6
         PHA
         PEA   $0001
         PEA   $0001
         PEA   $009E
         PEA   $0074
         PEI   $F4
         PEI   $F2
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$008E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0096
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$009E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00A6
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00AE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00B6
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00BE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00CE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L0942B6
         TAY
         TSC
         CLC
         ADC   #$0030
         TCS
         TYA
         JSL   L0612B1
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L094C3E
         LDA   #$0000
L094C3E  STAL  L0B0002
         PLA
         STZ   L0B00CB
L094C46  PEA   $0003
         JSL   L06078F
         PLY
         LDA   L0B0078
         CMP   #$0002
         BNE   L094C58
         BRA   L094CA3
L094C58  LDA   #L0C1A7A
         LDX   #^L0C1A7A
         TAY
         TSC
         SEC
         SBC   #$0010
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0010
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L061079
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         _ObscureCursor
         BCS   L094C90
         LDA   #$0000
L094C90  STAL  L0B0002
         JSL   L093949
         TAY
         BNE   L094CA3
         LDA   L0B0078
         CMP   #$0000
         BEQ   L094C46
L094CA3  LDA   L0B00B2
         AND   #$00FF
         BRL   L095110
L094CAC  LDA   $EE
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $F0
         PHA
         LDA   #$0028
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2820
         LDX   #^L0C2820
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         BEQ   L094D2E
         PEA   $006C
         LDX   #$0000
         TDC
         CLC
         ADC   #$009E
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L093E22
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L094DB6
L094D2E  LDX   #$0000
         TDC
         CLC
         ADC   #$008E
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$0096
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$009E
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L0941B4
         TAY
         TSC
         CLC
         ADC   #$0024
         TCS
         TYA
L094DB6  BRL   L095130
L094DB9  LDA   $EE
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $F0
         PHA
         LDA   #$0028
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2820
         LDX   #^L0C2820
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         BEQ   L094E38
         PEA   $0075
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L093E22
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L094EC0
L094E38  LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00DE
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L0941B4
         TAY
         TSC
         CLC
         ADC   #$0024
         TCS
         TYA
L094EC0  BRL   L095130
L094EC3  LDA   $EE
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $F0
         PHA
         LDA   #$0028
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2820
         LDX   #^L0C2820
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0006
         LDA   [$F6],Y
         BEQ   L094F77
         LDA   $F0
         CMP   #$0004
         BNE   L094F09
         LDA   $EE
         CMP   #$0001
         BEQ   L094F52
L094F09  PEA   $0072
         LDX   #$0000
         TDC
         CLC
         ADC   #$00CE
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L093E22
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRA   L094F74
L094F52  PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L094006
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
L094F74  BRL   L094FFF
L094F77  LDX   #$0000
         TDC
         CLC
         ADC   #$00BE
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00CE
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L0941B4
         TAY
         TSC
         CLC
         ADC   #$0024
         TCS
         TYA
L094FFF  BRL   L095130
L095002  LDA   $EE
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $F0
         PHA
         LDA   #$0028
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2820
         LDX   #^L0C2820
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         BEQ   L095084
         PEA   $0064
         LDX   #$0000
         TDC
         CLC
         ADC   #$00B6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L093E22
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L09510C
L095084  LDX   #$0000
         TDC
         CLC
         ADC   #$00A6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00AE
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00B6
         TAY
         TSC
         SEC
         SBC   #$0008
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0008
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L0941B4
         TAY
         TSC
         CLC
         ADC   #$0024
         TCS
         TYA
L09510C  BRA   L095130
         BRA   L095130
L095110  CMP   #$0008
         BNE   L095118
         BRL   L094CAC
L095118  CMP   #$000A
         BNE   L095120
         BRL   L095002
L095120  CMP   #$000B
         BNE   L095128
         BRL   L094DB9
L095128  CMP   #$0015
         BNE   L095130
         BRL   L094EC3
L095130  LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L095140
         BVS   L09513E
         EOR   #$8000
L09513E  BMI   L095154
L095140  LDA   $F0
         CMP   #$0005
         BEQ   L09514A
         BRL   L094C46
L09514A  LDA   $EE
         CMP   #$0001
         BEQ   L095154
         BRL   L094C46
L095154  JSL   L031208
         TSC
         CLC
         ADC   #$008C
         TCS
         PLD
         RTL

L095160  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDAL  L0C1A86
         SEC
         SBCL  L0C0F7C
         STA   $F4
         LDA   L0B0072
         PHA
         LDA   $F4
         CLC
         ADC   #$0004
         SEC
         JSL   L01092D
         PLY
         STA   $F4
         LDA   #$0000
         SEC
         SBC   $F4
         BEQ   L09519C
         BVS   L095195
         EOR   #$8000
L095195  BPL   L09519C
         LDA   #$0000
         BRA   L09519E
L09519C  LDA   $F4
L09519E  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L0951A8  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDAL  L0C1A84
         SEC
         SBCL  L0C0F7A
         STA   $F4
         LDA   L0B0070
         PHA
         LDA   $F4
         SEC
         SBC   #$0001
         SEC
         JSL   L01092D
         PLY
         STA   $F4
         LDA   $F4
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L0951DC  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   L0B0072
         PHA
         LDA   $FF
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADCL  L0C0F7C
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L095202  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F0
         TCS
         LDA   L0B0070
         PHA
         LDA   $FF
         CLC
         ADC   #$0001
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADCL  L0C0F7A
         CLC
         ADC   #$0001
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L095230  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E2
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         LDA   $F9
         SEC
         SBCL  L0C0F7C
         BEQ   L095258
         BVS   L095252
         EOR   #$8000
L095252  BPL   L095258
         LDA   $F9
         BRA   L09525C
L095258  LDAL  L0C0F7C
L09525C  PHA
         LDA   L0B0070
         SEC
         SBC   #$0001
         PHA
         PEI   $F7
         JSL   L095202
         PLY
         PLX
         STX   $F0
         SEC
         SBC   $F0
         PHA
         LDA   $F7
         LDX   #$0000
         TAY
         BPL   L09527C
         DEX
L09527C  STX   $F0
         ASL
         ROL   $F0
         ASL
         ROL   $F0
         LDX   $F0
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         SEC
         SBC   $FB
         BEQ   L0952AB
         BVS   L0952A5
         EOR   #$8000
L0952A5  BPL   L0952AB
         LDA   $FB
         BRA   L0952D3
L0952AB  LDA   $F7
         LDX   #$0000
         TAY
         BPL   L0952B4
         DEX
L0952B4  STX   $F0
         ASL
         ROL   $F0
         ASL
         ROL   $F0
         LDX   $F0
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
L0952D3  PHA
         PEI   $F7
         JSL   L095202
         PLY
         CLC
         ADC   #$0001
         PHA
         _SetRect
         BCS   L0952EC
         LDA   #$0000
L0952EC  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _InvertRect
         BCS   L095305
         LDA   #$0000
L095305  STAL  L0B0002
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L095311  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E6
         TCS
         LDA   $F7
         CMP   $FB
         BNE   L095344
         PEI   $FF
         PEI   $FD
         PEI   $F9
         JSL   L0951DC
         PLY
         PHA
         PEI   $F5
         JSL   L0951DC
         PLY
         PHA
         PEI   $F7
         JSL   L095230
         PLY
         PLY
         PLY
         PLY
         PLY
         BRL   L0953F9
L095344  PEI   $FF
         PEI   $FD
         LDA   $F7
         LDX   #$0000
         TAY
         BPL   L095351
         DEX
L095351  STX   $EE
         ASL
         ROL   $EE
         ASL
         ROL   $EE
         LDX   $EE
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         PHA
         PEI   $F5
         JSL   L0951DC
         PLY
         PHA
         PEI   $F7
         JSL   L095230
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $F7
         CLC
         ADC   #$0001
         STA   $E8
         BRA   L0953CD
L09538E  PEI   $FF
         PEI   $FD
         LDA   $E8
         LDX   #$0000
         TAY
         BPL   L09539B
         DEX
L09539B  STX   $EE
         ASL
         ROL   $EE
         ASL
         ROL   $EE
         LDX   $EE
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         PHA
         LDAL  L0C0F7C
         PHA
         PEI   $E8
         JSL   L095230
         PLY
         PLY
         PLY
         PLY
         PLY
         INC   $E8
L0953CD  LDA   $FB
         SEC
         SBC   #$0001
         SEC
         SBC   $E8
         BVS   L0953DB
         EOR   #$8000
L0953DB  BMI   L09538E
         PEI   $FF
         PEI   $FD
         PEI   $F9
         JSL   L0951DC
         PLY
         PHA
         LDAL  L0C0F7C
         PHA
         PEI   $FB
         JSL   L095230
         PLY
         PLY
         PLY
         PLY
         PLY
L0953F9  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L095401  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E8
         TCS
         LDA   $F9
         SEC
         SBC   $FD
         BVS   L095416
         EOR   #$8000
L095416  BMI   L09541E
         LDA   $FB
         CMP   $FF
         BEQ   L09542A
L09541E  LDA   $FB
         SEC
         SBC   $FF
         BVS   L095428
         EOR   #$8000
L095428  BMI   L095448
L09542A  PEI   $F7
         PEI   $F5
         PEI   $F9
         PEI   $FB
         PEI   $FD
         PEI   $FF
         _SetRect
         BCS   L095442
         LDA   #$0000
L095442  STAL  L0B0002
         BRA   L095464
L095448  PEI   $F7
         PEI   $F5
         PEI   $FD
         PEI   $FF
         PEI   $F9
         PEI   $FB
         _SetRect
         BCS   L095460
         LDA   #$0000
L095460  STAL  L0B0002
L095464  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L09546C  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$0022
         TCS
         PHA
         PEA   $0006
         PEA   $0000
         _FlushEvents
         BCS   L09548A
         LDA   #$0000
L09548A  STAL  L0B0002
         PLA
         LDAL  L0C0735
         STA   $DE
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         _NewRgn
         BCS   L0954BC
         LDA   #$0000
L0954BC  STAL  L0B0002
         PLA
         PLX
         STX   $3E
         STA   $3C
         PEA   $16A8
         JSL   L021DFD
         PLY
         PHX
         PHA
         _NewRgn
         BCS   L0954DC
         LDA   #$0000
L0954DC  STAL  L0B0002
         PLA
         PLX
         STX   $D4
         STA   $D2
         PEA   $16A9
         JSL   L021DFD
         PLY
         LDA   L0B0002
         CMP   #$0201
         BNE   L095556
         PEA   $0200
         PEA   $0000
         PEA   $4E20
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         PHX
         PHA
         _NewRgn
         BCS   L09552C
         LDA   #$0000
L09552C  STAL  L0B0002
         PLA
         PLX
         STX   $3E
         STA   $3C
         PHX
         PHA
         _NewRgn
         BCS   L095544
         LDA   #$0000
L095544  STAL  L0B0002
         PLA
         PLX
         STX   $D4
         STA   $D2
         PEA   $16AA
         JSL   L021DFD
         PLY
L095556  PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         LDAL  L0C0F7C
         SEC
         SBC   #$0006
         PHA
         LDAL  L0C0F7A
         SEC
         SBC   #$0003
         PHA
         LDAL  L0C0F80
         CLC
         ADC   #$0008
         PHA
         LDAL  L0C0F7E
         PHA
         _SetRect
         BCS   L09558B
         LDA   #$0000
L09558B  STAL  L0B0002
         PEI   $3E
         PEI   $3C
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         _RectRgn
         BCS   L0955A8
         LDA   #$0000
L0955A8  STAL  L0B0002
         PEA   $16AD
         JSL   L021DFD
         PLY
         PEI   $D4
         PEI   $D2
         PEA   ^L0C0EE2
         PEA   L0C0EE2
         _RectRgn
         BCS   L0955CA
         LDA   #$0000
L0955CA  STAL  L0B0002
         PEA   $16AE
         JSL   L021DFD
         PLY
         PEI   $3E
         PEI   $3C
         PEI   $D4
         PEI   $D2
         PEI   $3E
         PEI   $3C
         _DiffRgn
         BCS   L0955EE
         LDA   #$0000
L0955EE  STAL  L0B0002
         PEA   $16AF
         JSL   L021DFD
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         _SetPort
         BCS   L09560F
         LDA   #$0000
L09560F  STAL  L0B0002
         PEA   ^L0C030E
         PEA   L0C030E
         _SetCursor
         BCS   L095625
         LDA   #$0000
L095625  STAL  L0B0002
L095629  JSL   L06063A
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEI   $3E
         PEI   $3C
         _PtInRgn
         BCS   L095644
         LDA   #$0000
L095644  STAL  L0B0002
         PLA
         TAY
         BEQ   L095686
         LDA   #L0C030E
         LDX   #^L0C030E
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L095662
         LDA   #$0000
L095662  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L095684
         PEA   ^L0C030E
         PEA   L0C030E
         _SetCursor
         BCS   L095680
         LDA   #$0000
L095680  STAL  L0B0002
L095684  BRA   L0956AC
L095686  LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L09569C
         LDA   #$0000
L09569C  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L0956AC
         JSL   L0311DD
L0956AC  PEA   $0004
         JSL   L060679
         PLY
         TAY
         BNE   L0956BA
         BRL   L095629
L0956BA  LDA   #L0C1A7A
         LDX   #^L0C1A7A
         TAY
         TSC
         SEC
         SBC   #$0010
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0010
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L061079
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         JSL   L04169A
         TAY
         LDAL  L0C1A7A
         CMP   #$0001
         BEQ   L09570A
         LDA   L0B0078
         SEC
         SBC   #$0000
         BNE   L095700
         BRL   L095629
L095700  BVS   L095705
         EOR   #$8000
L095705  BMI   L09570A
         BRL   L095629
L09570A  LDA   L0B0078
         CMP   #$0000
         BEQ   L095715
         BRL   L095966
L095715  PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEI   $3E
         PEI   $3C
         _PtInRgn
         BCS   L09572C
         LDA   #$0000
L09572C  STAL  L0B0002
         PLA
         TAY
         BNE   L095737
         BRL   L095966
L095737  LDA   $DE
         BEQ   L095792
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         LDAL  L0C0731
         PHA
         LDAL  L0C0733
         PHA
         LDAL  L0C0743
         PHA
         LDAL  L0C0745
         PHA
         _SetRect
         BCS   L095764
         LDA   #$0000
L095764  STAL  L0B0002
         LDX   L0B0030
         LDA   L0B002E
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         PEI   $DA
         PEI   $DC
         PEI   $D6
         PEI   $D8
         JSL   L095311
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         STZ   $DE
L095792  JSL   L095160
         STA   $EC
         JSL   L0951A8
         SEC
         SBC   $FF
         BVS   L0957A4
         EOR   #$8000
L0957A4  BMI   L0957AC
         JSL   L0951A8
         BRA   L0957AE
L0957AC  LDA   $FF
L0957AE  SEC
         SBC   $FD
         BEQ   L0957D2
         BVS   L0957B8
         EOR   #$8000
L0957B8  BPL   L0957D2
         JSL   L0951A8
         SEC
         SBC   $FF
         BVS   L0957C6
         EOR   #$8000
L0957C6  BMI   L0957CE
         JSL   L0951A8
         BRA   L0957D0
L0957CE  LDA   $FF
L0957D0  BRA   L0957D4
L0957D2  LDA   $FD
L0957D4  STA   $EA
         LDA   $EC
         STA   $E8
         LDA   $EA
         STA   $E6
L0957DE  JSL   L06063A
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEI   $3E
         PEI   $3C
         _PtInRgn
         BCS   L0957F9
         LDA   #$0000
L0957F9  STAL  L0B0002
         PLA
         TAY
         BEQ   L09583B
         LDA   #L0C030E
         LDX   #^L0C030E
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L095817
         LDA   #$0000
L095817  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L095839
         PEA   ^L0C030E
         PEA   L0C030E
         _SetCursor
         BCS   L095835
         LDA   #$0000
L095835  STAL  L0B0002
L095839  BRA   L095861
L09583B  LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         PHX
         PHA
         _GetCursorAdr
         BCS   L095851
         LDA   #$0000
L095851  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L095861
         JSL   L0311DD
L095861  JSL   L095160
         STA   $E2
         JSL   L0951A8
         SEC
         SBC   $FF
         BVS   L095873
         EOR   #$8000
L095873  BMI   L09587B
         JSL   L0951A8
         BRA   L09587D
L09587B  LDA   $FF
L09587D  SEC
         SBC   $FD
         BEQ   L0958A1
         BVS   L095887
         EOR   #$8000
L095887  BPL   L0958A1
         JSL   L0951A8
         SEC
         SBC   $FF
         BVS   L095895
         EOR   #$8000
L095895  BMI   L09589D
         JSL   L0951A8
         BRA   L09589F
L09589D  LDA   $FF
L09589F  BRA   L0958A3
L0958A1  LDA   $FD
L0958A3  STA   $E0
         LDA   $E2
         CMP   $E8
         BNE   L0958B1
         LDA   $E0
         CMP   $E6
         BEQ   L0958FE
L0958B1  PEI   $E6
         PEI   $E8
         PEI   $E0
         PEI   $E2
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         JSL   L095401
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDX   L0B0030
         LDA   L0B002E
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         PEI   $DA
         PEI   $DC
         PEI   $D6
         PEI   $D8
         JSL   L095311
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   $E2
         STA   $E8
         LDA   $E0
         STA   $E6
L0958FE  PHA
         PEA   $0000
         _StillDown
         BCS   L09590E
         LDA   #$0000
L09590E  STAL  L0B0002
         PLA
         TAY
         BEQ   L095919
         BRL   L0957DE
L095919  JSL   L031208
         PEI   $EA
         PEI   $EC
         PEI   $E6
         PEI   $E8
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         JSL   L095401
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEI   $D8
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         PEI   $D6
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
         PEI   $DC
         PEA   $000A
         JSL   L0251CD
         PLY
         PLY
         PEI   $DA
         PEA   $000B
         JSL   L0251CD
         PLY
         PLY
L095966  PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L095978
         LDA   #$0000
L095978  STAL  L0B0002
         PEI   $3E
         PEI   $3C
         _DisposeRgn
         BCS   L09598C
         LDA   #$0000
L09598C  STAL  L0B0002
         PEA   $16B2
         JSL   L021DFD
         PLY
         PEI   $D4
         PEI   $D2
         _DisposeRgn
         BCS   L0959A8
         LDA   #$0000
L0959A8  STAL  L0B0002
         PEA   $16B3
         JSL   L021DFD
         PLY
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L0959CD
         BVS   L0959C2
         EOR   #$8000
L0959C2  BPL   L0959CD
         LDA   L0B0078
         PHA
         JSL   L0607BE
         PLY
L0959CD  TSC
         CLC
         ADC   #$00D4
         TCS
         PLD
         RTL

