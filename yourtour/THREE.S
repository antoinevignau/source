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

	use	THREE.E
	use	THREE.X
	
	use	4/Event.Macs
	use	4/Load.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/NoteSeq.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Util.Macs
	
*-------------------------------

L040000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E0
         TCS
         STZ   $E8
         STZ   $EA
         PEI   $F9
         PEI   $F7
         JSL   L04023C
         PLY
         PLY
         _CompactMem
         BCS   L040025
         LDA   #$0000
L040025  STAL  L0B0002
         PEI   $FD
         PEI   $FB
         LDA   L0B0066
         PHA
         PEI   $FF
         PEA   $0000
         PEA   $0000
         PEI   $F9
         PEI   $F7
         _ReallocHandle
         BCS   L040049
         LDA   #$0000
L040049  STAL  L0B0002
         LDA   L0B0002
         STA   $E2
         LDA   $E2
         CMP   #$0201
         BEQ   L04005C
         BRL   L0401CB
L04005C  LDA   #$0033
         STA   $E6
L040061  STZ   $E4
         BRL   L04014C
L040066  LDA   $E4
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
         STA   $EC
         STX   $EE
         LDA   [$EC]
         CMP   $E6
         BEQ   L040090
         BRL   L04014A
L040090  PEA   ^L0C261F
         PEA   L0C261F
         LDA   $E4
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
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
         CLC
         ADC   #$0006
         BCC   L0400C2
         INX
L0400C2  PHX
         PHA
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0400D2
         BRL   L04014A
L0400D2  LDA   $E4
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
         STA   $EC
         STX   $EE
         LDY   #$0004
         LDA   [$EC],Y
         TAX
         LDY   #$0002
         LDA   [$EC],Y
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         PEA   $019B
         JSL   L021DFD
         PLY
         PEA   ^L0C2620
         PEA   L0C2620
         LDA   $E4
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
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
         CLC
         ADC   #$0006
         BCC   L040140
         INX
L040140  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L04014A  INC   $E4
L04014C  LDA   $E4
         SEC
         SBC   #$0032
         BVS   L040157
         EOR   #$8000
L040157  BMI   L04015C
         BRL   L040066
L04015C  _CompactMem
         BCS   L040168
         LDA   #$0000
L040168  STAL  L0B0002
         DEC   $E6
         PHX
         PHA
         _MaxBlock
         BCS   L04017C
         LDA   #$0000
L04017C  STAL  L0B0002
         LDX   $FD
         LDA   $FB
         JSL   L010B98
         BCS   L04019A
         LDA   $E6
         SEC
         SBC   #$0000
         BVS   L040195
         EOR   #$8000
L040195  BPL   L04019A
         BRL   L040061
L04019A  PEI   $FD
         PEI   $FB
         LDA   L0B0066
         PHA
         PEI   $FF
         PEA   $0000
         PEA   $0000
         PEI   $F9
         PEI   $F7
         _ReallocHandle
         BCS   L0401BA
         LDA   #$0000
L0401BA  STAL  L0B0002
         LDA   L0B0002
         STA   $E2
         PEA   $01A4
         JSL   L021DFD
         PLY
L0401CB  LDX   $EA
         LDA   $E8
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PLD
         RTL

L0401D9  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         STZ   $F0
         PEI   $FF
         PEI   $FD
         _CheckHandle
         BCS   L0401F6
         LDA   #$0000
L0401F6  STAL  L0B0002
         LDA   L0B0002
         BNE   L040230
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STX   $F2
         ORA   $F2
         BEQ   L040230
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         _GetHandleSize
         BCS   L04021F
         LDA   #$0000
L04021F  STAL  L0B0002
         PLA
         PLX
         STX   $F2
         ORA   $F2
         BEQ   L040230
         LDA   #$0001
         STA   $F0
L040230  LDA   $F0
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L04023C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEI   $FF
         PEI   $FD
         _HUnlock
         BCS   L040257
         LDA   #$0000
L040257  STAL  L0B0002
         PEA   $01F1
         JSL   L021DFD
         PLY
         PEA   $0001
         PEI   $FF
         PEI   $FD
         _SetPurge
         BCS   L040276
         LDA   #$0000
L040276  STAL  L0B0002
         PEA   $01F2
         JSL   L021DFD
         PLY
         PEI   $FF
         PEI   $FD
         _PurgeHandle
         BCS   L040292
         LDA   #$0000
L040292  STAL  L0B0002
         PEA   $01F3
         JSL   L021DFD
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0402A6  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         PHA
         PHA
         PHA
         LDA   $FF
         PHA
         LDA   $FD
         PHA
         _UnloadSeg
         BCC   L0402C6
         STA   L0B0002
L0402C6  PLA
         PLA
         PLA
         STA   $F0
         PEA   $000A
         JSL   L021DFD
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0402DB  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E2
         TCS
         PEA   $0000
         PEA   $0800
         PEI   $FB
         PEI   $F9
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         LDAL  L0C0FEE
         STA   $E4
         LDA   $F7
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         LDX   #$0000
         TAY
         BPL   L040311
         DEX
L040311  STX   $E8
         STA   $E6
         JSL   L050FB3
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0016
         LDX   #$0000
         JSL   GSOS2
         BCS   L040331
         LDA   #$0000
L040331  STAL  L0B0002
         PEA   $01FF
         JSL   L021DFD
         PLY
         LDX   $FB
         LDA   $F9
         PHA
         TXA
         STAL  L0C0FF2
         PLA
         STAL  L0C0FF0
         LDX   #$0000
         LDA   #$0800
         PHA
         TXA
         STAL  L0C0FF6
         PLA
         STAL  L0C0FF4
         PEA   ^L0C0FEE
         PEA   L0C0FEE
         PEA   $0012
         LDX   #$0000
         JSL   GSOS2
         BCS   L040372
         LDA   #$0000
L040372  STAL  L0B0002
         PEA   $0200
         JSL   L021DFD
         PLY
         LDA   $F7
         STA   L0B006C
         LDA   #$0000
         STA   [$FD]
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L040390  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         STZ   $EC
         PEI   $FF
         PEI   $FD
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEA   ^L0C2621
         PEA   L0C2621
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L010D87
         PLY
         PLY
         SEP   #$20
         STA   [$F9]
         REP   #$20
         PEI   $FB
         PEI   $F9
         JSL   $040961
         PLY
         PLY
         STA   $EC
         TAY
         BNE   L04044B
         PEI   $FF
         PEI   $FD
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L010D87
         PLY
         PLY
         SEP   #$20
         STA   [$F9]
         REP   #$20
         PEI   $FB
         PEI   $F9
         JSL   $040961
         PLY
         PLY
         STA   $EC
L04044B  LDA   $EC
         BEQ   L040457
         LDAL  L0C0FFC
         STAL  L0C0FEE
L040457  LDA   $EC
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L040463  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00BE
         TCS
         PEA   ^L0C262A
         PEA   L0C262A
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         STZ   L0B0068
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00C0
         PHA
         JSL   L040390
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0404C0
         PEA   $0000
         PEA   $0800
         PEA   ^L0C1252
         PEA   L0C1252
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         STZ   L0B006A
         STZ   L0B006C
         LDA   #$0001
         STA   L0B0088
         BRL   L040500
L0404C0  STZ   L0B006C
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         PEA   ^L0C1221
         PEA   L0C1221
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $C0
         SEP   #$20
         STAL  L0C1220
         REP   #$20
         PEA   ^L0B006A
         PEA   L0B006A
         PEA   ^L0C1252
         PEA   L0C1252
         LDA   L0B006C
         PHA
         JSL   L0402DB
         PLY
         PLY
         PLY
         PLY
         PLY
         STZ   L0B0088
L040500  TSC
         CLC
         ADC   #$0038
         TCS
         PLD
         RTL

L040508  ENT
         PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00E2
         TCS
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$0000
         STA   [$FD]
L040521  LDA   $E4
         AND   #$00FF
         BNE   L04052B
         BRL   L040611
L04052B  LDA   [$F5]
         SEC
         SBC   #$0800
         BVS   L040536
         EOR   #$8000
L040536  BPL   L040557
         LDA   L0B006C
         CLC
         ADC   #$0004
         STA   L0B006C
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         LDA   L0B006C
         PHA
         JSL   L0402DB
         PLY
         PLY
         PLY
         PLY
         PLY
L040557  LDA   [$F5]
         LDX   #$0000
         TAY
         BPL   L040560
         DEX
L040560  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         SEP   #$20
         STA   $E5
         REP   #$20
         LDA   $E5
         AND   #$00FF
         AND   #$0080
         TAY
         BEQ   L0405A8
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L04058D
         INC   $FB
L04058D  STA   $E6
         STX   $E8
         LDA   #$0020
         SEP   #$20
         STA   [$E6]
         REP   #$20
         LDA   $E5
         AND   #$00FF
         AND   #$FF7F
         SEP   #$20
         STA   $E5
         REP   #$20
L0405A8  LDA   $E5
         AND   #$00FF
         CMP   #$0000
         BNE   L0405C9
         SEP   #$20
         STZ   $E4
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STA   [$F9]
         REP   #$20
         LDA   #$0001
         STA   L0B0088
         BRA   L04060E
L0405C9  LDA   $E5
         AND   #$00FF
         CMP   #$000D
         BEQ   L0405DD
         LDA   $E5
         AND   #$00FF
         CMP   #$000A
         BNE   L0405F3
L0405DD  SEP   #$20
         STZ   $E4
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STA   [$F9]
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L04060E
L0405F3  LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L0405FD
         INC   $FB
L0405FD  STA   $E6
         STX   $E8
         LDA   $E5
         SEP   #$20
         STA   [$E6]
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
L04060E  BRL   L040521
L040611  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L040619  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0B0088
         BNE   L04064D
         PEA   ^L0B0068
         PEA   L0B0068
         PEA   ^L0C1124
         PEA   L0C1124
         PEA   ^L0B006A
         PEA   L0B006A
         PEA   ^L0C1252
         PEA   L0C1252
         JSL   L040508
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
L04064D  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L040655  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   L0B006C
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         LDX   #$0000
         TAY
         BPL   L040674
         DEX
L040674  PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         JSL   L010B98
         BEQ   L04068B
         BVS   L040689
         EOR   #$8000
L040689  BMI   L0406BA
L04068B  LDA   L0B006C
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADC   #$0800
         LDX   #$0000
         TAY
         BPL   L0406A3
         DEX
L0406A3  PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         JSL   L010B98
         BEQ   L0406BA
         BVS   L0406B8
         EOR   #$8000
L0406B8  BMI   L0406E2
L0406BA  PEA   ^L0B006A
         PEA   L0B006A
         PEA   ^L0C1252
         PEA   L0C1252
         LDA   #$0200
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         SEC
         JSL   L01092D
         PLY
         PHA
         JSL   L0402DB
         PLY
         PLY
         PLY
         PLY
         PLY
L0406E2  LDA   L0B006C
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         LDX   #$0000
         TAY
         BPL   L0406F6
         DEX
L0406F6  PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         JSL   L010AA3
         PLA
         PLX
         STA   L0B006A
         PEA   ^L0C262B
         PEA   L0C262B
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         STZ   L0B0068
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L040728  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         LDA   L0B008A
         BEQ   L04073C
         JSL   L03096B
L04073C  STZ   L0B006E
         PEA   $0000
         PEA   $00B4
         PEA   ^L0C1006
         PEA   L0C1006
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $0004
         PEA   ^L0B005A
         PEA   L0B005A
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $0004
         PEA   ^L0B005E
         PEA   L0B005E
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         LDA   #$0001
         STA   L0B0096
         LDA   #$0001
         STA   L0B009A
         LDA   #$0001
         STA   L0B009C
         LDA   #$0001
         STA   L0B0092
         JSL   L0503D4
         TAY
         BEQ   L0407AD
         PEA   $0000
         _StopSeq
         BCS   L0407A9
         LDA   #$0000
L0407A9  STAL  L0B0002
L0407AD  LDA   L0B008E
         BEQ   L0407B9
         JSL   L030EB7
         STZ   L0B008E
L0407B9  STZ   $F0
         BRA   L0407EF
L0407BD  PEA   $0007
         PEI   $F0
         PEA   $0000
         _SetColorEntry
         BCS   L0407D1
         LDA   #$0000
L0407D1  STAL  L0B0002
         PEA   $0008
         PEI   $F0
         PEA   $0000
         _SetColorEntry
         BCS   L0407E9
         LDA   #$0000
L0407E9  STAL  L0B0002
         INC   $F0
L0407EF  LDA   $F0
         SEC
         SBC   #$0010
         BVS   L0407FA
         EOR   #$8000
L0407FA  BPL   L0407BD
         PEA   $0087
         LDA   L0B00B9
         PHA
         PEA   $0000
         JSL   L0321FD
         PLY
         PLY
         PLY
         PEA   $0001
         JSL   L030F81
         PLY
         LDAL  L0C0FEE
         BEQ   L04083B
         PEA   ^L0C0FEE
         PEA   L0C0FEE
         PEA   $0014
         LDX   #$0000
         JSL   GSOS2
         BCS   L040830
         LDA   #$0000
L040830  STAL  L0B0002
         LDA   #$0000
         STAL  L0C0FEE
L04083B  PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L04085C
         LDA   #$0000
L04085C  STAL  L0B0002
         PLA
         PLX
         STX   $EE
         STA   $EC
         PEA   $4556
         JSL   L021DFD
         PLY
         LDA   L0B00A6
         BNE   L040876
         BRL   L040925
L040876  PEI   $FF
         PEI   $FD
         JSL   L0242F7
         PLY
         PLY
         PEA   ^L0C262C
         PEA   L0C262C
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0408D4
         LDA   L0B00A8
         BEQ   L0408D1
         PEA   ^L0E004A
         PEA   L0E004A
         JSL   L0402A6
         PLY
         PLY
         STZ   L0B00A8
         PEA   $0100
         PEA   $0000
         PEA   $4200
         PEI   $EE
         PEI   $EC
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $EE
         PEI   $EC
         JSL   L04023C
         PLY
         PLY
         PEA   $4557
         JSL   L021DFD
         PLY
L0408D1  BRL   L040925
L0408D4  PEA   ^L0C2633
         PEA   L0C2633
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L040925
         LDA   L0B00AA
         BEQ   L040925
         PEA   ^L0E0074
         PEA   L0E0074
         JSL   L0402A6
         PLY
         PLY
         STZ   L0B00AA
         PEA   $0100
         PEA   $0000
         PEA   $6200
         PEI   $EE
         PEI   $EC
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $EE
         PEI   $EC
         JSL   L04023C
         PLY
         PLY
         PEA   $455F
         JSL   L021DFD
         PLY
L040925  PEA   $0100
         PEA   $0000
         PEA   $6200
         PEI   $EE
         PEI   $EC
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $EE
         PEI   $EC
         _DisposeHandle
         BCS   L04094B
         LDA   #$0000
L04094B  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         JSL   L040463
         PLY
         PLY
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00BC
         TCS
         STZ   $BE
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00C0
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2638
         PEA   L0C2638
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         JSL   L0252AD
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         JSL   L010D87
         PLY
         PLY
         SEP   #$20
         STA   $C0
         REP   #$20
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C0
         PHA
         TXA
         STAL  L0C1000
         PLA
         STAL  L0C0FFE
         PEA   ^L0C0FFC
         PEA   L0C0FFC
         PEA   $0010
         LDX   #$0000
         JSL   GSOS2
         BCS   L0409D7
         LDA   #$0000
L0409D7  STAL  L0B0002
         LDA   L0B0002
         STA   $BE
         TAY
         BNE   L0409E6
         BRL   L040A45
L0409E6  PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00C0
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C263D
         PEA   L0C263D
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         JSL   L0252AD
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00C1
         PHA
         JSL   L010D87
         PLY
         PLY
         SEP   #$20
         STA   $C0
         REP   #$20
         PEA   ^L0C0FFC
         PEA   L0C0FFC
         PEA   $0010
         LDX   #$0000
         JSL   GSOS2
         BCS   L040A3C
         LDA   #$0000
L040A3C  STAL  L0B0002
         LDA   L0B0002
         STA   $BE
L040A45  LDA   $BE
         BEQ   L040A4E
         LDA   #$0000
         BRA   L040A51
L040A4E  LDA   #$0001
L040A51  TAY
         TSC
         CLC
         ADC   #$003A
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00B0
         TCS
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00B2
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00B2
         PHA
         JSL   L0244F2
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$00B2
         STX   $E8
         STA   $E6
         JSL   L050FB3
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0010
         LDX   #$0000
         JSL   GSOS2
         BCS   L040AB2
         LDA   #$0000
L040AB2  STAL  L0B0002
         LDA   L0B0002
         CMP   #$0000
         BNE   L040AC8
         LDA   $E4
         STA   [$F9]
         LDA   [$F9]
         BRA   L040AD5
         BRA   L040AD5
L040AC8  LDA   L0B0002
         BEQ   L040AD2
         LDA   #$0000
         BRA   L040AD5
L040AD2  LDA   #$0001
L040AD5  TAY
         TSC
         CLC
         ADC   #$0042
         TCS
         TYA
         PLD
         RTL

L040ADF  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00A2
         TCS
         STZ   $A6
         LDA   #$FFFF
         STA   $A4
         PEA   ^L0C2641
         PEA   L0C2641
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2646
         PEA   L0C2646
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C264B
         PEA   L0C264B
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEI   $FD
         PEI   $FB
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         PEI   $F9
         PEI   $F7
         JSL   $040C05
         PLY
         PLY
         PLY
         PLY
         PLY
         STA   $A4
         LDA   $A4
         BNE   L040BE0
         STZ   $A6
L040B6B  LDA   $A6
         SEC
         SBC   #$0003
         BVS   L040B76
         EOR   #$8000
L040B76  BMI   L040BE0
         LDA   $A4
         BNE   L040BE0
         PEI   $FD
         PEI   $FB
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         LDA   $A6
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00DA
         JSL   L010922
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L040BDC
         PEI   $FF
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         PEI   $F9
         PEI   $F7
         JSL   $040C05
         PLY
         PLY
         PLY
         PLY
         PLY
         STA   $A4
L040BDC  INC   $A6
         BRA   L040B6B
L040BE0  LDA   $A4
         BEQ   L040BF9
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         PEI   $FD
         PEI   $FB
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L040BF9  LDA   $A4
         TAY
         TSC
         CLC
         ADC   #$004E
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$004B
         TCS
         LDA   $FF
         BEQ   L040C18
         STZ   $E2
         BRA   L040C1D
L040C18  LDA   #$0001
         STA   $E2
L040C1D  PEA   ^L0C2651
         PEA   L0C2651
         PEA   $0000
         TDC
         CLC
         ADC   #$004D
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2657
         PEA   L0C2657
         PEA   $0000
         TDC
         CLC
         ADC   #$0056
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C265C
         PEA   L0C265C
         PEA   $0000
         TDC
         CLC
         ADC   #$005F
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C265D
         PEA   L0C265D
         PEA   $0000
         TDC
         CLC
         ADC   #$0068
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2664
         PEA   L0C2664
         PEA   $0000
         TDC
         CLC
         ADC   #$0071
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C266A
         PEA   L0C266A
         PEA   $0000
         TDC
         CLC
         ADC   #$007A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C266B
         PEA   L0C266B
         PEA   $0000
         TDC
         CLC
         ADC   #$0083
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2671
         PEA   L0C2671
         PEA   $0000
         TDC
         CLC
         ADC   #$008C
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2677
         PEA   L0C2677
         PEA   $0000
         TDC
         CLC
         ADC   #$0095
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C267D
         PEA   L0C267D
         PEA   $0000
         TDC
         CLC
         ADC   #$009E
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C267E
         PEA   L0C267E
         PEA   $0000
         TDC
         CLC
         ADC   #$00A7
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEI   $FD
         PEI   $FB
         JSL   L0242F7
         PLY
         PLY
         STZ   $E8
         LDA   #$000A
         STA   $E4
         PEI   $FD
         PEI   $FB
         PEA   ^L0C2684
         PEA   L0C2684
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L040D43
         BRL   L040D88
L040D43  LDA   [$FB]
         AND   #$00FF
         BRL   L040D79
L040D4B  LDA   #$0000
         CLC
         ADC   $E2
         STA   $E8
         LDA   #$0002
         STA   $E4
         BRL   L040D88
L040D5B  LDA   #$0003
         CLC
         ADC   $E2
         STA   $E8
         LDA   #$0007
         STA   $E4
         BRL   L040D88
L040D6B  LDA   #$0008
         STA   $E8
         LDA   #$000A
         STA   $E4
         BRA   L040D88
         BRA   L040D88
L040D79  CMP   #$0064
         BEQ   L040D6B
         CMP   #$0067
         BEQ   L040D4B
         CMP   #$0073
         BEQ   L040D5B
L040D88  PEI   $FD
         PEI   $FB
         PEA   $0000
         TDC
         CLC
         ADC   #$00B0
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $E8
         PHA
         LDA   #$0009
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$004D
         JSL   L010922
         PEA   $0000
         TDC
         CLC
         ADC   #$00B0
         PHA
         JSL   L010CFD
         PLY
         PLY
         PLY
         PLY
         LDA   $FF
         BEQ   L040DF4
         PEA   $0000
         TDC
         CLC
         ADC   #$00B0
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         JSL   $040A5B
         PLY
         PLY
         PLY
         PLY
         STA   $E6
         TAY
         BEQ   L040DF2
         LDA   $EA
         STA   [$F7]
L040DF2  BRA   L040E17
L040DF4  PEA   $0000
         TDC
         CLC
         ADC   #$00B0
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         JSL   $040F12
         PLY
         PLY
         PLY
         PLY
         STA   $E6
         TAY
         BEQ   L040E17
         LDA   $EA
         STA   [$F7]
L040E17  INC   $E8
         LDA   $E8
         SEC
         SBC   $E4
         BEQ   L040E27
         BVS   L040E25
         EOR   #$8000
L040E25  BMI   L040E2E
L040E27  LDA   $E6
         BNE   L040E2E
         BRL   L040D88
L040E2E  LDA   $E6
         BEQ   L040E47
         PEA   $0000
         TDC
         CLC
         ADC   #$00B0
         PHA
         PEI   $FD
         PEI   $FB
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L040E47  LDA   $E6
         TAY
         TSC
         CLC
         ADC   #$00A5
         TCS
         TYA
         PLD
         RTL

L040E53  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00B8
         TCS
         LDA   #$FFFF
         STA   $BA
         PEA   $0000
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00BE
         PHA
         JSL   L040ADF
         PLY
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L040E91
         LDA   $BE
         STA   $BA
         PEA   $0000
         PEI   $BA
         JSL   $041131
         PLY
         PLY
         BRL   L040F06
L040E91  PEA   $0001
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L040ADF
         PLY
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L040F01
         JSL   $04100F
         STA   $BE
         PEI   $FF
         PEI   $FD
         PEI   $BC
         PEI   $BE
         JSL   $0412BB
         PLY
         PLY
         PLY
         PLY
         LDA   $BE
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
         STA   $F2
         STX   $F4
         LDA   #$0000
         STA   [$F2]
         PEI   $BE
         JSL   $04175D
         PLY
         LDA   $BE
         STA   $BA
         PEA   $0001
         PEI   $BA
         JSL   $041131
         PLY
         PLY
         BRA   L040F06
L040F01  LDA   #$FFFF
         STA   $BA
L040F06  LDA   $BA
         TAY
         TSC
         CLC
         ADC   #$003E
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         LDA   #$0000
         STA   [$F9]
         STZ   $EC
L040F24  LDA   $EC
         BNE   L040F87
         LDA   [$F9]
         SEC
         SBC   #$0032
         BVS   L040F33
         EOR   #$8000
L040F33  BMI   L040F87
         LDA   [$F9]
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
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         CLC
         ADC   #$0006
         BCC   L040F61
         INX
L040F61  PHX
         PHA
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L040F77
         LDA   #$0000
         BRA   L040F7A
L040F77  LDA   #$0001
L040F7A  STA   $EC
         LDA   $EC
         BNE   L040F85
         LDA   [$F9]
         INC
         STA   [$F9]
L040F85  BRA   L040F24
L040F87  LDA   $EC
         BNE   L040F8E
         BRL   L041003
L040F8E  LDA   [$F9]
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
         STA   $EE
         STX   $F0
         LDY   #$0004
         LDA   [$EE],Y
         TAX
         LDY   #$0002
         LDA   [$EE],Y
         PHX
         PHA
         JSL   L0401D9
         PLY
         PLY
         TAY
         BNE   L041003
         PEA   ^L0C2685
         PEA   L0C2685
         LDA   [$F9]
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
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         CLC
         ADC   #$0006
         BCC   L040FF7
         INX
L040FF7  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         STZ   $EC
L041003  LDA   $EC
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EA
         TCS
         LDA   #$FFFF
         STA   $F2
L04101F  INC   $F2
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
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         TAX
         LDY   #$0002
         LDA   [$F6],Y
         PHX
         PHA
         JSL   L0401D9
         PLY
         PLY
         TAY
         BEQ   L0410A7
         PEA   ^L0C2686
         PEA   L0C2686
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
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         CLC
         ADC   #$0006
         BCC   L04108A
         INX
L04108A  PHX
         PHA
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0410A7
         LDA   $F2
         SEC
         SBC   #$0032
         BVS   L0410A2
         EOR   #$8000
L0410A2  BMI   L0410A7
         BRL   L04101F
L0410A7  LDA   $F2
         SEC
         SBC   #$0032
         BVS   L0410B2
         EOR   #$8000
L0410B2  BMI   L0410B7
         BRL   L041125
L0410B7  STZ   $F0
         STZ   $F4
         BRL   L041118
L0410BE  LDA   $F4
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
         LDA   [$F6]
         SEC
         SBC   $F0
         BEQ   L041116
         BVS   L0410EB
         EOR   #$8000
L0410EB  BPL   L041116
         LDA   $F4
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
         LDA   [$F6]
         STA   $F0
         LDA   $F4
         STA   $F2
L041116  INC   $F4
L041118  LDA   $F4
         SEC
         SBC   #$0032
         BVS   L041123
         EOR   #$8000
L041123  BPL   L0410BE
L041125  LDA   $F2
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E8
         TCS
         LDA   $FF
         BEQ   L041145
         LDA   #$0032
         BRA   L041168
L041145  LDA   $FD
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
         STA   $F2
         STX   $F4
         LDA   [$F2]
L041168  STA   $EE
         STZ   $F0
         BRL   L04127D
L04116F  LDA   $F0
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
         STA   $F2
         STX   $F4
         LDY   #$0004
         LDA   [$F2],Y
         TAX
         LDY   #$0002
         LDA   [$F2],Y
         PHX
         PHA
         JSL   L0401D9
         PLY
         PLY
         TAY
         BNE   L0411A9
         BRL   L04123F
L0411A9  PEA   $0000
         LDA   $F0
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
         STA   $F2
         STX   $F4
         LDY   #$0004
         LDA   [$F2],Y
         TAX
         LDY   #$0002
         LDA   [$F2],Y
         PHX
         PHA
         _SetPurge
         BCS   L0411E6
         LDA   #$0000
L0411E6  STAL  L0B0002
         LDA   $F0
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
         STA   $F2
         STX   $F4
         LDA   [$F2]
         SEC
         SBC   $EE
         BVS   L041215
         EOR   #$8000
L041215  BMI   L04123D
         LDA   $F0
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
         STA   $F2
         STX   $F4
         LDA   [$F2]
         INC
         STA   [$F2]
L04123D  BRA   L04127B
L04123F  PEA   ^L0C2687
         PEA   L0C2687
         LDA   $F0
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
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0006
         BCC   L041271
         INX
L041271  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L04127B  INC   $F0
L04127D  LDA   $F0
         SEC
         SBC   #$0032
         BVS   L041288
         EOR   #$8000
L041288  BMI   L04128D
         BRL   L04116F
L04128D  LDA   $FD
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
         STA   $F2
         STX   $F4
         LDA   #$0000
         STA   [$F2]
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         PEI   $FF
         PEI   $FD
         LDA   $F9
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
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         CLC
         ADC   #$0006
         BCC   L0412F6
         INX
L0412F6  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $F9
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
         STA   $EE
         STX   $F0
         LDY   #$0004
         LDA   [$EE],Y
         TAX
         LDY   #$0002
         LDA   [$EE],Y
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEI   $FB
         JSL   $04134A
         PLY
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00CE
         TCS
         LDA   $F7
         STA   $E4
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0019
         LDX   #$0000
         JSL   GSOS2
         BCS   L041371
         LDA   #$0000
L041371  STAL  L0B0002
         LDX   $E8
         LDA   $E6
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         PEI   $FF
         PEI   $FD
         JSL   L04023C
         PLY
         PLY
         PEA   $0000
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         _HLock
         BCS   L0413B7
         LDA   #$0000
L0413B7  STAL  L0B0002
         PEA   $0048
         JSL   L021DFD
         PLY
         LDA   $F7
         STAL  L0C0FD0
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         PHA
         TXA
         STAL  L0C0FD4
         PLA
         STAL  L0C0FD2
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHA
         TXA
         STAL  L0C0FD8
         PLA
         STAL  L0C0FD6
         PEA   ^L0C0FD0
         PEA   L0C0FD0
         PEA   $0012
         LDX   #$0000
         JSL   GSOS2
         BCS   L041404
         LDA   #$0000
L041404  STAL  L0B0002
         PEA   ^L0C0FD0
         PEA   L0C0FD0
         PEA   $0014
         LDX   #$0000
         JSL   GSOS2
         BCS   L04141D
         LDA   #$0000
L04141D  STAL  L0B0002
         PEA   $004A
         JSL   L021DFD
         PLY
         PEI   $FF
         PEI   $FD
         _HUnlock
         BCS   L041439
         LDA   #$0000
L041439  STAL  L0B0002
         TSC
         CLC
         ADC   #$0022
         TCS
         PLD
         RTL

L041445  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EA
         TCS
         STZ   $F2
         BRL   L0414F0
L041455  JSL   L040619
         PEA   ^L0C2688
         PEA   L0C2688
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   #L0C10BE
         LDX   #^L0C10BE
         STX   $EE
         STA   $EC
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L023BE0
         PLY
         PLY
         TAY
         BNE   L041489
         BRL   L0414D6
L041489  LDA   #$0001
         STA   L0B0068
         PEA   ^L0B0068
         PEA   L0B0068
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   #L0C10BE
         LDX   #^L0C10BE
         STX   $EE
         STA   $EC
         PEA   ^L0C2689
         PEA   L0C2689
         PEI   $EE
         PEI   $EC
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0414D6
         PEA   ^L0B0068
         PEA   L0B0068
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L041503
         PLY
         PLY
         PLY
         PLY
L0414D6  PEA   ^L0C268B
         PEA   L0C268B
         PEI   $EE
         PEI   $EC
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0414EE
         BRL   L041455
L0414EE  INC   $F2
L0414F0  LDA   $FF
         CMP   $F2
         BEQ   L0414FB
         BCC   L0414FB
         BRL   L041455
L0414FB  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L041503  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         SEC
         SBC   #$0000
         BVS   L04152A
         EOR   #$8000
L04152A  BMI   L04152F
         BRL   L041586
L04152F  LDA   L0B0082
         SEC
         SBC   #$002D
         BVS   L04153B
         EOR   #$8000
L04153B  BMI   L041586
         LDA   L0B0082
         STA   L0B006E
         STZ   L0B008C
         LDA   L0B006C
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADC   L0B006A
         LDX   #$0000
         TAY
         BPL   L04155E
         DEX
L04155E  PHX
         PHA
         LDA   L0B006E
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1006
         LDX   #^L0C1006
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$EE],Y
         PLA
         STA   [$EE]
L041586  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L04158E  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0B006E
         SEC
         SBC   #$0000
         BNE   L0415A5
         BRL   L0415E0
L0415A5  BVS   L0415AA
         EOR   #$8000
L0415AA  BPL   L0415E0
         DEC   L0B006E
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L010D87
         PLY
         PLY
         STA   L0B0068
         LDA   #$0001
         STA   L0B008C
         LDA   L0B006E
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1006
         LDX   #^L0C1006
         JSL   L010922
         JSL   L040655
         PLY
         PLY
         BRA   L0415F0
L0415E0  JSL   L060614
         PEA   ^L0B005A
         PEA   L0B005A
         JSL   L040655
         PLY
         PLY
L0415F0  PHA
         PEA   $00FF
         PEA   $0000
         _FlushEvents
         BCS   L041603
         LDA   #$0000
L041603  STAL  L0B0002
         PLA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L041610  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
L04161B  LDA   L0B006E
         CMP   $FF
         BNE   L041625
         BRL   L041692
L041625  LDA   L0B0088
         BEQ   L04162D
         BRL   L041692
L04162D  JSL   L040619
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L023BE0
         PLY
         PLY
         TAY
         BNE   L041643
         BRL   L041690
L041643  LDA   #$0001
         STA   L0B0068
         PEA   ^L0B0068
         PEA   L0B0068
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   #L0C10BE
         LDX   #^L0C10BE
         STX   $F2
         STA   $F0
         PEA   ^L0C268D
         PEA   L0C268D
         PEI   $F2
         PEI   $F0
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L041690
         PEA   ^L0B0068
         PEA   L0B0068
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L041503
         PLY
         PLY
         PLY
         PLY
L041690  BRA   L04161B
L041692  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L04169A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDAL  L0C1A7A
         CMP   #$0000
         BNE   L0416B1
         BRL   L041715
L0416B1  LDA   #L0C1A7A
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
         LDA   L0B0078
         CMP   #$0001
         BNE   L0416F1
         JSL   L04158E
         LDA   #$0001
         BRL   L041753
         BRA   L041713
L0416F1  LDA   L0B0078
         CMP   #$0002
         BNE   L04170D
         PEA   ^L0C268F
         PEA   L0C268F
         JSL   L040728
         PLY
         PLY
         LDA   #$0001
         BRL   L041753
         BRA   L041713
L04170D  LDA   #$0000
         BRL   L041753
L041713  BRA   L041753
L041715  JSL   L061036
         SEC
         SBC   #$00B4
         BEQ   L041750
         BVS   L041724
         EOR   #$8000
L041724  BPL   L041750
         LDA   L0B007E
         BEQ   L041750
         LDA   #$0002
         STA   L0B0078
         PEA   $0000
         PEA   $0013
         JSL   L0251CD
         PLY
         PLY
         PEA   ^L0C2694
         PEA   L0C2694
         JSL   L040728
         PLY
         PLY
         LDA   #$0001
         BRA   L041753
         BRA   L041753
L041750  LDA   #$0000
L041753  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00DC
         TCS
         LDA   $FF
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
         LDA   $F4
         LDX   $F6
         CLC
         ADC   #$0006
         BCC   L041794
         INX
L041794  PHX
         PHA
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0001
         LDX   #$0000
         PHX
         PHA
         LDA   $FF
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
         LDX   $F6
         LDA   #$0006
         CLC
         ADC   $F4
         BCC   L0417D1
         INX
L0417D1  JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         CMP   #$007A
         BEQ   L0417E8
         BRL   L041B4C
L0417E8  STZ   L0B0107
         STZ   L0B010B
         STZ   L0B00F3
         STZ   L0B00F5
         PHX
         PHA
         LDA   $FF
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
         _GetHandleSize
         BCS   L041830
         LDA   #$0000
L041830  STAL  L0B0002
         PLA
         PLX
         STX   $EA
         STA   $E8
         PEA   $0000
         PEI   $EA
         PEI   $E8
         LDX   L0B00F1
         LDA   L0B00EF
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $FF
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
         LDX   L0B00F1
         LDA   L0B00EF
         PHX
         PHA
         PEI   $EA
         PEI   $E8
         _HandToHand
         BCS   L041898
         LDA   #$0000
L041898  STAL  L0B0002
         PEA   $0834
         JSL   L021DFD
         PLY
         LDX   L0B00F1
         LDA   L0B00EF
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $E6
         STA   $E4
         LDY   #$0002
         LDA   [$E4],Y
         TAX
         LDA   [$E4]
         STX   $E2
         STA   $E0
         LDX   #$0000
         LDA   #$0004
         STX   L0B00F9
         STA   L0B00F7
         PEA   $0000
         PEI   $E2
         PEI   $E0
         LDA   $FF
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
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0200
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L041931
         LDA   #$0000
L041931  STAL  L0B0002
         PLA
         PLX
         STX   $EE
         STA   $EC
         PEA   $0835
         JSL   L021DFD
         PLY
         PEA   $0000
         PEA   $0000
         PEA   $2716
         PEI   $EE
         PEI   $EC
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0200
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L04197A
         LDA   #$0000
L04197A  STAL  L0B0002
         PLA
         PLX
         STX   $F2
         STA   $F0
         PEA   $0836
         JSL   L021DFD
         PLY
         PEA   $0000
         PEA   $0000
         PEA   $138B
         PEI   $F2
         PEI   $F0
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $EE
         PEI   $EC
         _HLock
         BCS   L0419B2
         LDA   #$0000
L0419B2  STAL  L0B0002
         PEI   $F2
         PEI   $F0
         _HLock
         BCS   L0419C6
         LDA   #$0000
L0419C6  STAL  L0B0002
         LDX   L0B00F1
         LDA   L0B00EF
         PHX
         PHA
         _HLock
         BCS   L0419DE
         LDA   #$0000
L0419DE  STAL  L0B0002
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         PHX
         PHA
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         PHX
         PHA
         LDA   $FF
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
         JSL   $041BEE
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEI   $F2
         PEI   $F0
         JSL   L04023C
         PLY
         PLY
         PEI   $EE
         PEI   $EC
         JSL   L04023C
         PLY
         PLY
         PEI   $F2
         PEI   $F0
         _DisposeHandle
         BCS   L041A54
         LDA   #$0000
L041A54  STAL  L0B0002
         PEA   $083E
         JSL   L021DFD
         PLY
         PEI   $EE
         PEI   $EC
         _DisposeHandle
         BCS   L041A70
         LDA   #$0000
L041A70  STAL  L0B0002
         PEA   $083F
         JSL   L021DFD
         PLY
         LDX   L0B00F1
         LDA   L0B00EF
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         LDA   $FF
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
         _HUnlock
         BCS   L041AC4
         LDA   #$0000
L041AC4  STAL  L0B0002
         PEA   $0840
         JSL   L021DFD
         PLY
         LDA   $FF
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
         LDA   $F4
         LDX   $F6
         CLC
         ADC   #$0006
         BCC   L041AFC
         INX
L041AFC  PHX
         PHA
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0001
         LDX   #$0000
         PHX
         PHA
         LDA   $FF
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
         LDX   $F6
         LDA   #$0006
         CLC
         ADC   $F4
         BCC   L041B39
         INX
L041B39  JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   #$0000
         SEP   #$20
         STA   [$F4]
         REP   #$20
L041B4C  TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDX   L0B00F5
         LDA   L0B00F3
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   L0B00F3
         LDA   L0B00F5
         BCC   L041B74
         INC
L041B74  STA   L0B00F5
         LDX   L0B00ED
         LDA   L0B00EB
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   $FF
         SEP   #$20
         STA   [$F4]
         REP   #$20
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0B00F9
         LDA   L0B00F7
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   L0B00F7
         LDA   L0B00F9
         BCC   L041BC3
         INC
L041BC3  STA   L0B00F9
         LDX   L0B00F1
         LDA   L0B00EF
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00B8
         TCS
         LDA   #L0C24F4
         LDX   #^L0C24F4
         STX   $CA
         STA   $C8
         LDA   $F9
         CLC
         ADC   #$1000
         LDX   $FB
         BCC   L041C0E
         INX
L041C0E  STX   $C6
         STA   $C4
         LDA   #L0C24F4
         LDX   #^L0C24F4
         STX   $C2
         STA   $C0
         LDX   $F7
         LDA   $F5
         STX   L0B00ED
         STA   L0B00EB
         LDX   L0B00ED
         LDA   L0B00EB
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         STX   $D4
         STA   $D2
         PHX
         PHA
         LDX   L0B00F1
         LDA   L0B00EF
         PHX
         PHA
         _GetHandleSize
         BCS   L041C52
         LDA   #$0000
L041C52  STAL  L0B0002
         PLA
         PLX
         STX   L0B010F
         STA   L0B010D
         LDX   L0B00F1
         LDA   L0B00EF
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         STX   L0B0113
         STA   L0B0111
         LDX   L0B00ED
         LDA   L0B00EB
         PHX
         PHA
         _HLock
         BCS   L041C8A
         LDA   #$0000
L041C8A  STAL  L0B0002
         JSL   $041BA3
         JSL   $041BA3
         STZ   L0B00FB
         STZ   L0B00FD
         LDA   L0B0101
         PHA
         LDA   #$0001
         SEC
         JSL   L010CA2
         PLA
         STA   L0B0105
         JSL   $041BA3
         AND   #$00FF
         STA   L0B0101
         LDA   L0B0101
         AND   #$0080
         STA   L0B0109
         LDA   L0B0101
         AND   #$001F
         STA   L0B0101
         LDA   L0B0101
         PHA
         LDA   #$0001
         SEC
         JSL   L010CA2
         PLA
         STA   L0B0105
         LDA   #$0009
         STA   L0B00FF
         PHA
         LDA   #$0001
         SEC
         JSL   L010CA2
         PLA
         SEC
         SBC   #$0001
         STA   L0B0103
         LDA   #$00FF
         STA   $E2
         BRA   L041D40
L041CF6  LDA   $E2
         LDX   #$0000
         TAY
         BPL   L041CFF
         DEX
L041CFF  STX   $EE
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
         LDA   #$0000
         STA   [$EA]
         LDA   $E2
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L041D27
         DEX
L041D27  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         PLA
         SEP   #$20
         STA   [$EA]
         REP   #$20
         DEC   $E2
L041D40  LDA   $E2
         SEC
         SBC   #$0000
         BVS   L041D4B
         EOR   #$8000
L041D4B  BMI   L041CF6
         LDA   L0B0109
         BEQ   L041D57
         LDA   #$0101
         BRA   L041D5A
L041D57  LDA   #$0100
L041D5A  STA   L0B0107
         PER   L041D60+2
L041D60  BRL   L041E7A
         LDA   $E2
         STA   $E0
         STA   $E4
         LDA   $E0
         CMP   #$FFFF
         BNE   L041D73
         BRL   L042013
L041D73  LDA   $E4
         AND   #$00FF
         PHA
         JSL   $041B54
         PLY
         LDA   $F9
         CLC
         ADC   #$1000
         LDX   $FB
         BCC   L041D89
         INX
L041D89  STX   $E8
         STA   $E6
L041D8D  PER   L041D90+2
L041D90  BRL   L041E7A
         LDA   $E2
         BPL   L041D9A
         BRL   L042013
L041D9A  LDA   $E2
         CMP   #$0100
         BNE   L041DCE
         LDA   L0B0109
         BEQ   L041DCE
         LDY   #$01FE
         LDA   #$0000
L041DAC  STA   [$FD],Y
         DEY
         DEY
         BPL   L041DAC
         LDA   #$0001
         STA   L0B010B
         LDA   #$0100
         STA   L0B0107
         PER   L041DC1+2
L041DC1  BRL   L041E7A
         LDA   $E2
         CMP   #$FFFF
         BNE   L041DCE
         BRL   L042013
L041DCE  LDA   $E2
         STA   $DE
         CMP   L0B0107
         BCC   L041DE9
         LDA   $E4
         SEP   #$20
         STA   [$E6]
         REP   #$20
         INC   $E6
         BNE   L041DE5
         INC   $E8
L041DE5  LDA   $E0
         STA   $E2
L041DE9  CMP   #$0100
         BCC   L041E06
         TAY
         ASL
         TAX
         LDA   [$F9],Y
         SEP   #$20
         STA   [$E6]
         REP   #$20
         INC   $E6
         BNE   L041DFF
         INC   $E8
L041DFF  TXY
         LDA   [$FD],Y
         STA   $E2
         BRA   L041DE9
L041E06  TAY
         LDA   [$F9],Y
         AND   #$00FF
         STA   $E4
         SEP   #$20
         STA   [$E6]
         REP   #$20
         INC   $E6
         BNE   L041E1A
         INC   $E8
L041E1A  LDA   $D2
         CLC
         ADC   L0B00F3
         STA   $DA
         LDA   $D4
         ADC   L0B00F5
         STA   $DC
         LDY   #$0000
         LDX   $C4
L041E2E  LDA   $E6
         BNE   L041E34
         DEC   $E8
L041E34  DEC   $E6
         SEP   #$20
         LDA   [$E6]
         STA   [$DA],Y
         REP   #$20
         INY
         CPX   $E6
         BCC   L041E2E
         TYA
         CLC
         ADC   L0B00F3
         STA   L0B00F3
         LDA   #$0000
         ADC   L0B00F5
         STA   L0B00F5
         LDA   L0B0107
         STA   $E2
         CMP   L0B0105
         BCS   L041E73
         TAX
         ASL
         TAY
         LDA   $E0
         STA   [$FD],Y
         TXY
         LDA   $E4
         SEP   #$20
         STA   [$F9],Y
         REP   #$20
         TXA
         INC
         STA   L0B0107
L041E73  LDA   $DE
         STA   $E0
         BRL   L041D8D
L041E7A  LDA   $C0
         STA   $C8
         LDA   $C2
         STA   $CA
         LDA   L0B0103
         CMP   L0B0107
         BCC   L041EA2
         LDA   L0B010B
         BEQ   L041E94
         BMI   L041E94
         BRL   L041ECC
L041E94  LDA   L0B00FB
         CMP   L0B00FD
         BCC   L041E9F
         BRL   L041EE2
L041E9F  BRL   L041F59
L041EA2  INC   L0B00FF
         LDA   L0B00FF
         CMP   L0B0101
         BNE   L041EB5
         LDA   L0B0105
         STA   L0B0103
         BRA   L041EC5
L041EB5  LDX   L0B00FF
         LDA   #$0001
         BRA   L041EBE
L041EBD  ASL
L041EBE  DEX
         BPL   L041EBD
         DEC
         STA   L0B0103
L041EC5  LDA   L0B010B
         BMI   L041EE2
         BEQ   L041EE2
L041ECC  LDX   #$0009
         STX   L0B00FF
         LDA   #$0001
         BRA   L041ED8
L041ED7  ASL
L041ED8  DEX
         BPL   L041ED7
         DEC
         STA   L0B0103
         STZ   L0B010B
L041EE2  LDA   L0B010D
         SEC
         SBC   L0B00F7
         CMP   L0B00FF
         BCC   L041EF1
         LDA   L0B00FF
L041EF1  STA   L0B00FD
         STA   $BA
         LDY   #$0000
         LDA   L0B0111
         CLC
         ADC   L0B00F7
         STA   $DA
         LDA   L0B0113
         ADC   L0B00F9
         STA   $DC
         LDA   $C0
         STA   $BC
         LDA   $C2
         STA   $BE
         SEP   #$20
         BRA   L041F1B
L041F16  LDA   [$DA],Y
         STA   [$BC],Y
         INY
L041F1B  CPY   L0B00FD
         BCC   L041F16
         REP   #$20
         TYA
         CLC
         ADC   L0B00F7
         STA   L0B00F7
         LDA   #$0000
         ADC   L0B00F9
         STA   L0B00F9
         LDA   L0B00FD
         BEQ   L041F3A
         BPL   L041F42
L041F3A  LDA   #$FFFF
         STA   $D0
         BRL   L04200E
L041F42  STZ   L0B00FB
         LDX   L0B00FF
         DEX
         LDA   L0B00FD
         ASL
         ASL
         ASL
         STX   L0B00FD
         SEC
         SBC   L0B00FD
         STA   L0B00FD
L041F59  LDA   L0B00FB
         STA   $CE
         LDX   L0B00FF
         STX   $CC
         LSR
         LSR
         LSR
         CLC
         ADC   $C8
         STA   $C8
         LDA   #$0000
         ADC   $CA
         STA   $CA
         LDA   $CE
         AND   #$0007
         STA   $CE
         LDA   #$0008
         SEC
         SBC   $CE
         PHA
         TAY
         LDA   L0B0119
         STA   $D6
         LDA   L0B011B
         STA   $D8
         LDA   [$D6],Y
         TAY
         LDA   [$C8]
         AND   #$00FF
         INC   $C8
         BNE   L041F99
         INC   $CA
L041F99  LDX   $CE
         BRA   L041F9E
L041F9D  LSR
L041F9E  DEX
         BPL   L041F9D
         STA   $D0
         TYA
         AND   $D0
         AND   #$00FF
         STA   $D0
         PLA
         STA   $CE
         LDA   $CC
         SEC
         SBC   $CE
         STA   $CC
         CMP   #$0008
         BCC   L041FE1
         LDA   [$C8]
         INC   $C8
         BNE   L041FC2
         INC   $CA
L041FC2  AND   #$00FF
         LDX   $CE
         BRA   L041FCA
L041FC9  ASL
L041FCA  DEX
         BPL   L041FC9
         ORA   $D0
         STA   $D0
         LDA   $CE
         CLC
         ADC   #$0008
         STA   $CE
         LDA   $CC
         SEC
         SBC   #$0008
         STA   $CC
L041FE1  LDY   L0B0119
         STY   $D6
         LDY   L0B011B
         STY   $D8
         LDY   $CC
         LDA   [$D6],Y
         STA   $BC
         LDA   [$C8]
         AND   $BC
         AND   #$00FF
         LDX   $CE
         BRA   L041FFD
L041FFC  ASL
L041FFD  DEX
         BPL   L041FFC
         ORA   $D0
         STA   $D0
         LDA   L0B00FB
         CLC
         ADC   L0B00FF
         STA   L0B00FB
L04200E  LDA   $D0
         STA   $E2
         RTS

L042013  TAY
         TSC
         CLC
         ADC   #$0036
         TCS
         TYA
         PLD
         RTL

