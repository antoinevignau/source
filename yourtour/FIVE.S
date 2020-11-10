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

	use	FIVE.X
	
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------

L060000  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         LDA   L0B00C9
         STA   $F0
         LDA   L0B009A
         BEQ   L06006B
         LDA   L0B00AC
         BEQ   L06006B
         LDA   #$0002
         PHA
         PHA
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEI   $F0
         _TextWidth
         BCS   L06003E
         LDA   #$0000
L06003E  STAL  L0B0002
         LDAL  L0C0F80
         SEC
         SBCL  L0C0F7C
         PLX
         STX   $F6
         SEC
         SBC   $F6
         SEC
         JSL   L01092D
         PLY
         PHA
         PEA   $0000
         _Move
         BCS   L060067
         LDA   #$0000
L060067  STAL  L0B0002
L06006B  LDA   L0B00A0
         BEQ   L060081
         PEI   $FF
         PEI   $FD
         LDA   L0B00C9
         PHA
         JSL   L0600DC
         PLY
         PLY
         PLY
         BRA   L0600B3
L060081  LDA   $F0
         SEC
         SBC   #$0000
         BEQ   L0600B3
         BVS   L06008E
         EOR   #$8000
L06008E  BPL   L0600B3
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEI   $F0
         _DrawText
         BCS   L0600AF
         LDA   #$0000
L0600AF  STAL  L0B0002
L0600B3  LDA   L0B00C9
         CLC
         ADC   #$0001
         PHA
         PEA   $0000
         PEI   $FF
         PEI   $FD
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L0244F2
         PLY
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0600DC  PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E8
         TCS
         LDA   #$0001
         STA   $EE
         BRL   L0601AA
L0600EF  LDA   L0B00C1
         BNE   L060117
         LDA   $EE
         LDX   #$0000
         TAY
         BPL   L0600FD
         DEX
L0600FD  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         CMP   #$0020
         BNE   L06011C
L060117  LDA   #$0000
         BRA   L06011F
L06011C  LDA   #$0001
L06011F  STA   $EA
         STZ   $EC
         BRA   L060127
L060125  INC   $EC
L060127  LDA   $EC
         SEC
         SBC   #$0EA6
         BEQ   L060125
         BVS   L060134
         EOR   #$8000
L060134  BPL   L060125
         LDA   $EA
         BEQ   L06014D
         LDX   L0B00B5
         LDA   L0B00B3
         STA   $F0
         STX   $F2
         LDA   #$0001
         SEP   #$20
         STA   [$F0]
         REP   #$20
L06014D  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L060156
         DEX
L060156  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         PHA
         _DrawChar
         BCS   L060178
         LDA   #$0000
L060178  STAL  L0B0002
         STZ   $EC
         BRA   L060182
L060180  INC   $EC
L060182  LDA   $EC
         SEC
         SBC   #$0EA6
         BEQ   L060180
         BVS   L06018F
         EOR   #$8000
L06018F  BPL   L060180
         LDA   $EA
         BEQ   L0601A8
         LDX   L0B00B5
         LDA   L0B00B3
         STA   $F0
         STX   $F2
         LDA   #$0001
         SEP   #$20
         STA   [$F0]
         REP   #$20
L0601A8  INC   $EE
L0601AA  LDA   $EE
         SEC
         SBC   $FB
         BNE   L0601B4
         BRL   L0600EF
L0601B4  BVS   L0601B9
         EOR   #$8000
L0601B9  BMI   L0601BE
         BRL   L0600EF
L0601BE  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0601C6  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00ED
         TCS
         LDA   #$0020
         SEP   #$20
         STA   $F1
         REP   #$20
         JSL   L03117F
         PEI   $FF
         PEI   $FD
         JSL   L060593
         PLY
         PLY
         TAY
         BNE   L0601F8
         PEI   $FF
         PEI   $FD
         JSL   L0605F0
         PLY
         PLY
         TAY
         BEQ   L060215
L0601F8  LDA   L0B0096
         BEQ   L060215
         LDAL  L0C0D1E
         CMPL  L0C0F7C
         BEQ   L06020B
         JSL   L0604FD
L06020B  JSL   L0604FD
         STZ   L0B00A2
         BRL   L0604DE
L060215  LDA   L0B00A2
         BEQ   L060232
         LDA   [$FD]
         AND   #$00FF
         STA   L0B00C9
         PEI   $FF
         PEI   $FD
         JSL   L060000
         PLY
         PLY
         STZ   L0B00A2
         BRL   L0604DE
L060232  LDA   L0B009A
         BEQ   L06027E
         LDY   #$0001
         LDA   [$FD],Y
         AND   #$00FF
         CMP   #$0020
         BNE   L06027E
         LDA   #$0001
         STA   L0B00AC
         PEA   $0020
         PEA   $0001
         PEI   $FF
         PEI   $FD
         JSL   L024161
         PLY
         PLY
         PLY
         PLY
         STA   L0B00C9
         LDA   L0B00C9
         PHA
         PEA   $0000
         PEI   $FF
         PEI   $FD
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L0244F2
         PLY
         PLY
         BRA   L060281
L06027E  STZ   L0B00AC
L060281  LDA   L0B009A
         BEQ   L060299
         LDA   L0B00AC
         BEQ   L060299
         LDAL  L0C0D1E
         CMPL  L0C0F7C
         BEQ   L060299
         JSL   L0604FD
L060299  LDA   [$FD]
         AND   #$00FF
         STA   L0B00C9
L0602A1  PEI   $FF
         PEI   $FD
         JSL   L0605F0
         PLY
         PLY
         TAY
         BEQ   L0602B1
         BRL   L0604DE
L0602B1  PHA
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   L0B00C9
         PHA
         _TextWidth
         BCS   L0602D3
         LDA   #$0000
L0602D3  STAL  L0B0002
         PLA
         STA   $EF
         LDA   $EF
         CLC
         ADCL  L0C0D1E
         SEC
         SBCL  L0C0F80
         BEQ   L0602F2
         BVS   L0602ED
         EOR   #$8000
L0602ED  BPL   L0602F2
         BRL   L0603FC
L0602F2  LDA   [$FD]
         AND   #$00FF
         STA   L0B00C9
         PEI   $FF
         PEI   $FD
         JSL   L060000
         PLY
         PLY
         LDA   L0B0096
         BNE   L06030C
         BRL   L0603F9
L06030C  LDA   L0B00C9
         LDX   #$0000
         TAY
         BPL   L060316
         DEX
L060316  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$0020
         BNE   L060333
         BRL   L0603F9
L060333  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F1
         PHA
         PEA   $0001
         _TextWidth
         BCS   L06034C
         LDA   #$0000
L06034C  STAL  L0B0002
         LDAL  L0C0F80
         PLX
         STX   $F6
         SEC
         SBC   $F6
         SEC
         SBCL  L0C0D1E
         BEQ   L060384
         BVS   L060366
         EOR   #$8000
L060366  BPL   L060384
         PEA   $0000
         TDC
         CLC
         ADC   #$00F1
         PHA
         PEA   $0001
         _DrawText
         BCS   L060380
         LDA   #$0000
L060380  STAL  L0B0002
L060384  LDA   L0B00C9
         LDX   #$0000
         TAY
         BPL   L06038E
         DEX
L06038E  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$002E
         BNE   L0603F9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F1
         PHA
         PEA   $0001
         _TextWidth
         BCS   L0603C1
         LDA   #$0000
L0603C1  STAL  L0B0002
         LDAL  L0C0F80
         PLX
         STX   $F6
         SEC
         SBC   $F6
         SEC
         SBCL  L0C0D1E
         BEQ   L0603F9
         BVS   L0603DB
         EOR   #$8000
L0603DB  BPL   L0603F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00F1
         PHA
         PEA   $0001
         _DrawText
         BCS   L0603F5
         LDA   #$0000
L0603F5  STAL  L0B0002
L0603F9  BRL   L0604DB
L0603FC  LDA   L0B00C9
         SEC
         SBC   #$0000
         BNE   L060408
         BRL   L060485
L060408  BVS   L06040D
         EOR   #$8000
L06040D  BMI   L060412
         BRL   L060485
L060412  PHA
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   L0B00C9
         PHA
         _TextWidth
         BCS   L060434
         LDA   #$0000
L060434  STAL  L0B0002
         PLA
         CLC
         ADCL  L0C0D1E
         SEC
         SBCL  L0C0F80
         BVS   L060448
         EOR   #$8000
L060448  BPL   L060485
         LDA   L0B00C9
         CMP   #$0001
         BNE   L060457
         STZ   L0B00C9
         BRA   L060482
L060457  PEA   $0020
         LDA   L0B00C9
         SEC
         SBC   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L024078
         PLY
         PLY
         PLY
         PLY
         STA   L0B00C9
L060482  BRL   L0603FC
L060485  LDA   L0B00C9
         SEC
         SBC   #$0000
         BVS   L060491
         EOR   #$8000
L060491  BPL   L06049D
         PEI   $FF
         PEI   $FD
         JSL   L060000
         PLY
         PLY
L06049D  JSL   L0604FD
         PEA   $0020
         PEA   $0001
         PEI   $FF
         PEI   $FD
         JSL   L024161
         PLY
         PLY
         PLY
         PLY
         STA   L0B00C9
         LDA   L0B00C9
         PHA
         PEA   $0000
         PEI   $FF
         PEI   $FD
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L0244F2
         PLY
         PLY
         LDA   [$FD]
         AND   #$00FF
         STA   L0B00C9
L0604DB  BRL   L0602A1
L0604DE  LDA   L0B0096
         BEQ   L0604ED
         LDA   L0B009A
         BEQ   L0604F1
         LDA   L0B00AC
         BEQ   L0604F1
L0604ED  JSL   L0604FD
L0604F1  JSL   L0311AA
         TSC
         CLC
         ADC   #$0009
         TCS
         PLD
         RTL

L0604FD  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         LDA   L0B0070
         PHA
         LDAL  L0C0F7E
         SEC
         SBCL  L0C0D1C
         SEC
         JSL   L01092D
         PLY
         SEC
         SBC   #$0000
         BEQ   L060555
         BVS   L060526
         EOR   #$8000
L060526  BPL   L060555
         PEA   ^L0C10BA
         PEA   L0C10BA
         _GetPen
         BCS   L06053A
         LDA   #$0000
L06053A  STAL  L0B0002
         PEA   $0000
         LDA   L0B0070
         PHA
         _Move
         BCS   L060551
         LDA   #$0000
L060551  STAL  L0B0002
L060555  LDA   L0B009E
         BEQ   L060571
         PEA   $0000
         LDA   L0B0070
         PHA
         _Move
         BCS   L06056D
         LDA   #$0000
L06056D  STAL  L0B0002
L060571  LDAL  L0C0F7C
         PHA
         LDAL  L0C0D1C
         PHA
         _MoveTo
         BCS   L060587
         LDA   #$0000
L060587  STAL  L0B0002
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L060593  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         LDA   #$0001
         STA   $F0
         LDA   #$0001
         STA   $F0
         BRA   L0605D4
L0605AA  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L0605B3
         DEX
L0605B3  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$0020
         BEQ   L0605D2
         LDA   #$0000
         BRA   L0605E6
L0605D2  INC   $F0
L0605D4  LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   $F0
         BVS   L0605E1
         EOR   #$8000
L0605E1  BMI   L0605AA
         LDA   #$0001
L0605E6  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L0605F0  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   [$FD]
         AND   #$00FF
         BEQ   L060607
         LDA   #$0000
         BRA   L06060A
L060607  LDA   #$0001
L06060A  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L060614  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0007
         _WriteChar
         BCS   L06062E
         LDA   #$0000
L06062E  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L06063A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PHA
         PEA   $046E
         PEA   ^L0C1A7A
         PEA   L0C1A7A
         _GetNextEvent
         BCS   L06065B
         LDA   #$0000
L06065B  STAL  L0B0002
         PLA
         LDAL  L0C1A86
         ASL
         STAL  L0C1A86
         STZ   L0B00CB
         JSL   L060DE3
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L060679  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F0
         TCS
         LDA   $FF
         BRL   L060776
L060689  LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L060697
         LDA   #$0000
         BRA   L06069A
L060697  LDA   #$0001
L06069A  STA   $F2
         LDAL  L0C1A7A
         CMP   #$0002
         BNE   L0606EB
         LDA   #L0C1A7A
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
         SEC
         SBC   #$0000
         BEQ   L0606E1
         BVS   L0606DF
         EOR   #$8000
L0606DF  BMI   L0606E6
L0606E1  LDA   #$0000
         BRA   L0606E9
L0606E6  LDA   #$0001
L0606E9  STA   $F2
L0606EB  BRL   L060783
L0606EE  LDA   $FF
         CMPL  L0C1A7A
         BEQ   L060704
         LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L060704
         LDA   #$0000
         BRA   L060707
L060704  LDA   #$0001
L060707  STA   $F2
         STZ   L0B00CB
         LDA   #L0C1A7A
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
         BRL   L060783
L06073B  LDAL  L0C1A7A
         CMP   #$0000
         BNE   L060749
         LDA   #$0000
         BRA   L06074C
L060749  LDA   #$0001
L06074C  STA   $F2
         BRL   L060783
L060751  LDAL  L0C1A7A
         CMP   #$0000
         BEQ   L06075F
         LDA   #$0000
         BRA   L060762
L06075F  LDA   #$0001
L060762  STA   $F2
         BRL   L060783
L060767  BRL   L060783
L06076A  DA    L060751
         DA    L0606EE
         DA    L0606EE
         DA    L060689
         DA    L06073B
         DA    L060767
L060776  CMP   #$0005
         BCC   L06077E
         LDA   #$0005
L06077E  ASL
         TAX
         JMP   (L06076A,X)

L060783  LDA   $F2
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L06078F  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
L06079A  JSL   L06063A
         JSL   L04169A
         TAY
         BNE   L0607B6
         JSL   L0612DE
         TAY
         BNE   L0607B6
         PEI   $FF
         JSL   L060679
         PLY
         TAY
         BEQ   L06079A
L0607B6  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0607BE  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEA   $0001
         LDA   $FF
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0F82
         LDX   #^L0C0F82
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
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
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L060815  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         _InvertRect
         BCS   L060835
         LDA   #$0000
L060835  STAL  L0B0002
         LDA   L0B00C5
         BEQ   L060843
         LDA   #$0000
         BRA   L060846
L060843  LDA   #$0001
L060846  STA   L0B00C5
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L060851  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00D6
         TCS
         STZ   $F2
         JSL   L0612B1
         LDA   $FF
         CMP   #$0001
         BEQ   L060885
         LDA   $FF
         CMP   #$0004
         BEQ   L060885
         LDA   $FF
         CMP   #$0002
         BEQ   L060885
         LDAL  L0C072F
         CMP   #$FFFD
         BEQ   L060885
         LDA   #$0000
         BRA   L060888
L060885  LDA   #$0001
L060888  STA   L0B00C7
         LDA   $FF
         CMP   #$0001
         BEQ   L06089B
         LDAL  L0C072F
         CMP   #$FFFD
         BNE   L0608C0
L06089B  LDA   #L0C0F9A
         LDX   #^L0C0F9A
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   #$0004
         STA   L0B0080
         BRA   L0608FA
L0608C0  STZ   L0B0080
         LDAL  L0C072F
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
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
L0608FA  JSL   L0311DD
L0608FE  LDX   #$0000
         TDC
         CLC
         ADC   #$00D8
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
         PEA   $0001
         PEI   $F2
         JSL   L060C20
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDAL  L0C1A7A
         CMP   #$0001
         BEQ   L06093D
         BRL   L060B0A
L06093D  LDA   #L0C1A7A
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
         CMP   #$0000
         BNE   L060974
         BRL   L060ADA
L060974  JSL   L061210
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   L0B0078
         STA   $EC
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _InvertRect
         BCS   L0609A9
         LDA   #$0000
L0609A9  STAL  L0B0002
         LDA   #$0001
         STA   L0B00C5
L0609B3  JSL   L06063A
         LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _PtInRect
         BCS   L0609F3
         LDA   #$0000
L0609F3  STAL  L0B0002
         PLA
         TAY
         BEQ   L060A21
         LDA   L0B00C5
         BNE   L060A21
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _InvertRect
         BCS   L060A15
         LDA   #$0000
L060A15  STAL  L0B0002
         LDA   #$0001
         STA   L0B00C5
         BRA   L060A69
L060A21  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _PtInRect
         BCS   L060A40
         LDA   #$0000
L060A40  STAL  L0B0002
         PLA
         TAY
         BNE   L060A69
         LDA   L0B00C5
         BEQ   L060A69
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _InvertRect
         BCS   L060A62
         LDA   #$0000
L060A62  STAL  L0B0002
         STZ   L0B00C5
L060A69  PHA
         PEA   $0000
         _StillDown
         BCS   L060A79
         LDA   #$0000
L060A79  STAL  L0B0002
         PLA
         TAY
         BEQ   L060A84
         BRL   L0609B3
L060A84  LDA   L0B00C5
         BEQ   L060AA2
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _InvertRect
         BCS   L060A9E
         LDA   #$0000
L060A9E  STAL  L0B0002
L060AA2  LDA   #L0C1A7A
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
         CMP   $EC
         BEQ   L060AD8
         STZ   L0B0078
L060AD8  BRA   L060AF8
L060ADA  PHA
         PEA   $0000
         _StillDown
         BCS   L060AEA
         LDA   #$0000
L060AEA  STAL  L0B0002
         PLA
         TAY
         BEQ   L060AF8
         JSL   L06063A
         BRA   L060ADA
L060AF8  LDAL  L0C1A7A
         CMP   #$0002
         BEQ   L060B08
         LDA   #$0002
         STAL  L0C1A7A
L060B08  BRA   L060B36
L060B0A  LDA   #L0C1A7A
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
L060B36  LDA   $FF
         BRL   L060BA7
L060B3B  LDA   L0B0078
         CMP   #$0001
         BEQ   L060B53
         LDA   L0B0078
         CMP   #$0002
         BEQ   L060B53
         LDA   L0B0078
         CMP   #$0003
         BNE   L060B5A
L060B53  LDA   #$0001
         STA   $EE
         BRA   L060B5C
L060B5A  STZ   $EE
L060B5C  BRL   L060BB5
L060B5F  LDAL  L0C1A7A
         CMP   #$0002
         BNE   L060B6F
         LDA   #$0001
         STA   $EE
         BRA   L060B71
L060B6F  STZ   $EE
L060B71  BRL   L060BB5
L060B74  LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L060B86
         LDAL  L0C1A7A
         CMP   #$0005
         BNE   L060B8D
L060B86  LDA   #$0001
         STA   $EE
         BRA   L060B8F
L060B8D  STZ   $EE
L060B8F  BRL   L060BB5
L060B92  LDA   #$0001
         STA   $EE
         BRL   L060BB5
L060B9A  BRL   L060BB5
L060B9D  DA    L060B3B
         DA    L060B5F
         DA    L060B74
         DA    L060B92
         DA    L060B9A
L060BA7  DEC
         CMP   #$0004
         BCC   L060BB0
         LDA   #$0004
L060BB0  ASL
         TAX
         JMP   (L060B9D,X)

L060BB5  JSL   L04169A
         TAY
         BNE   L060BEC
         JSL   L0612DE
         TAY
         BNE   L060BC7
         LDA   $EE
         BNE   L060BE5
L060BC7  INC   $F2
         LDA   $F2
         SEC
         SBC   #$0001
         BEQ   L060BE3
         BVS   L060BD6
         EOR   #$8000
L060BD6  BPL   L060BE3
         PEI   $FF
         JSL   L06145F
         PLY
         JSL   L0311DD
L060BE3  BRA   L060BEA
L060BE5  LDA   #$FFFF
         STA   $F2
L060BEA  BRA   L060BF1
L060BEC  LDA   #$FFFF
         STA   $F2
L060BF1  LDA   $F2
         SEC
         SBC   #$0000
         BVS   L060BFC
         EOR   #$8000
L060BFC  BPL   L060C08
         JSL   L0612DE
         TAY
         BNE   L060C08
         BRL   L0608FE
L060C08  JSL   L031208
         PEA   $0000
         PEA   $0000
         JSL   L0251CD
         PLY
         PLY
         TSC
         CLC
         ADC   #$0022
         TCS
         PLD
         RTL

L060C20  ENT
         PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E4
         TCS
L060C2B  STZ   L0B00C5
L060C2E  JSL   L06063A
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDX   #$0000
         LDA   #$002C
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L060C50
         LDA   #$0000
L060C50  STAL  L0B0002
         PLA
         PLX
         CLC
         JSL   L0109B2
         PLA
         PLX
         JSL   L010B98
         BNE   L060C68
         LDA   #$0001
         STA   $E8
L060C68  LDA   L0B00C7
         BNE   L060C70
         BRL   L060CF1
L060C70  LDA   $F5
         SEC
         SBC   #$0000
         BEQ   L060C7F
         BVS   L060C7D
         EOR   #$8000
L060C7D  BMI   L060C90
L060C7F  JSL   L061036
         SEC
         SBC   L0B0080
         BEQ   L060CF1
         BVS   L060C8E
         EOR   #$8000
L060C8E  BPL   L060CF1
L060C90  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDX   #$0000
         LDA   #$002D
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L060CAE
         LDA   #$0000
L060CAE  STAL  L0B0002
         PLA
         PLX
         CLC
         JSL   L0109B2
         PLA
         PLX
         JSL   L010B98
         BNE   L060CF1
         LDA   $E8
         BEQ   L060CEF
         LDX   #$0000
         TDC
         CLC
         ADC   #$00F9
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
         JSL   L060815
         PLY
         PLY
         PLY
         PLY
L060CEF  STZ   $E8
L060CF1  LDA   $F7
         BEQ   L060D0B
         LDAL  L0C1A7A
         CMP   #$0000
         BNE   L060D03
         LDA   #$0000
         BRA   L060D06
L060D03  LDA   #$0001
L060D06  STA   $E6
         BRL   L060D75
L060D0B  LDA   #L0C1A7A
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
         PHA
         PEA   ^L0C1A84
         PEA   L0C1A84
         PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         _PtInRect
         BCS   L060D53
         LDA   #$0000
L060D53  STAL  L0B0002
         PLA
         TAY
         BNE   L060D70
         LDA   L0B0078
         CMP   #$0001
         BEQ   L060D70
         LDA   L0B0078
         CMP   #$0002
         BEQ   L060D70
         LDA   #$0000
         BRA   L060D73
L060D70  LDA   #$0001
L060D73  STA   $E6
L060D75  LDA   $E6
         BNE   L060D83
         JSL   L0612DE
         TAY
         BNE   L060D83
         BRL   L060C2E
L060D83  LDA   L0B00C5
         BEQ   L060DB2
         LDX   #$0000
         TDC
         CLC
         ADC   #$00F9
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
         JSL   L060815
         PLY
         PLY
         PLY
         PLY
L060DB2  LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L060DDB
         LDAL  L0C1A7A
         CMP   #$0005
         BEQ   L060DDB
         LDAL  L0C1A7A
         CMP   #$0001
         BEQ   L060DDB
         LDA   $E6
         BNE   L060DDB
         JSL   L0612DE
         TAY
         BNE   L060DDB
         BRL   L060C2B
L060DDB  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L060DE3  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F1
         TCS
         STZ   $F3
         LDAL  L0C1A88
         AND   #$0300
         CMP   #$0300
         BEQ   L060DFF
         BRL   L06102A
L060DFF  LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L060E0B
         BRL   L06102A
L060E0B  LDAL  L0C1A7E
         TAX
         LDAL  L0C1A7C
         AND   #$00FF
         ORA   #$0020
         SEP   #$20
         STA   $F5
         REP   #$20
         LDA   $F5
         AND   #$00FF
         CMP   #$0064
         BNE   L060E32
         LDA   #$0001
         STA   L0B007E
         BRA   L060E3F
L060E32  LDA   $F5
         AND   #$00FF
         CMP   #$0074
         BNE   L060E3F
         STZ   L0B007E
L060E3F  LDA   $F5
         AND   #$00FF
         CMP   #$0073
         BNE   L060E4C
         BRL   L060FF5
L060E4C  _GrafOff
         BCS   L060E58
         LDA   #$0000
L060E58  STAL  L0B0002
         PEA   ^L0C2699
         PEA   L0C2699
         _WriteCString
         BCS   L060E6E
         LDA   #$0000
L060E6E  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L060E81
         LDA   #$0000
L060E81  STAL  L0B0002
         PEA   ^L0C26A3
         PEA   L0C26A3
         _WriteCString
         BCS   L060E97
         LDA   #$0000
L060E97  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L060EAA
         LDA   #$0000
L060EAA  STAL  L0B0002
         PEA   ^L0C26C7
         PEA   L0C26C7
         _WriteCString
         BCS   L060EC0
         LDA   #$0000
L060EC0  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L060ED3
         LDA   #$0000
L060ED3  STAL  L0B0002
         PEA   ^L0C26F4
         PEA   L0C26F4
         _WriteCString
         BCS   L060EE9
         LDA   #$0000
L060EE9  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L060EFC
         LDA   #$0000
L060EFC  STAL  L0B0002
         PEA   ^L0C2739
         PEA   L0C2739
         _WriteCString
         BCS   L060F12
         LDA   #$0000
L060F12  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L060F25
         LDA   #$0000
L060F25  STAL  L0B0002
         PEA   ^L0C276A
         PEA   L0C276A
         _WriteCString
         BCS   L060F3B
         LDA   #$0000
L060F3B  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L060F4E
         LDA   #$0000
L060F4E  STAL  L0B0002
         PEA   ^L0C279C
         PEA   L0C279C
         _WriteCString
         BCS   L060F64
         LDA   #$0000
L060F64  STAL  L0B0002
         LDA   L0B007E
         BEQ   L060F85
         PEA   ^L0C27AF
         PEA   L0C27AF
         _WriteCString
         BCS   L060F7F
         LDA   #$0000
L060F7F  STAL  L0B0002
         BRA   L060F9B
L060F85  PEA   ^L0C27B5
         PEA   L0C27B5
         _WriteCString
         BCS   L060F97
         LDA   #$0000
L060F97  STAL  L0B0002
L060F9B  PEA   ^L0C27BF
         PEA   L0C27BF
         _WriteCString
         BCS   L060FAD
         LDA   #$0000
L060FAD  STAL  L0B0002
         PEA   $0006
         _WriteChar
         BCS   L060FC0
         LDA   #$0000
L060FC0  STAL  L0B0002
         PEA   $0039
         JSL   L06135C
         PLY
         _GrafOn
         BCS   L060FD8
         LDA   #$0000
L060FD8  STAL  L0B0002
         PEA   $0005
         _WriteChar
         BCS   L060FEB
         LDA   #$0000
L060FEB  STAL  L0B0002
         JSL   L0311DD
         BRA   L06102A
L060FF5  _GrafOff
         BCS   L061001
         LDA   #$0000
L061001  STAL  L0B0002
         PHA
         PEA   $0000
         _ReadChar
         BCS   L061015
         LDA   #$0000
L061015  STAL  L0B0002
         PLA
         _GrafOn
         BCS   L061026
         LDA   #$0000
L061026  STAL  L0B0002
L06102A  LDA   $F3
         TAY
         TSC
         CLC
         ADC   #$0009
         TCS
         TYA
         PLD
         RTL

L061036  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   #$0000
         LDA   #$003C
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L061057
         LDA   #$0000
L061057  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   L0B0062
         PHA
         TXA
         SBC   L0B0064
         TAX
         PLA
         CLC
         JSL   L0109B2
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L061079  ENT
         PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00DE
         TCS
         LDA   L0B00CB
         BEQ   L06108C
         BRL   L061208
L06108C  STZ   L0B0078
         SEP   #$20
         STZ   L0B00B2
         REP   #$20
         LDA   $F1
         CMP   #$0003
         BNE   L0610A0
         BRL   L06116C
L0610A0  LDA   $F1
         CMP   #$0005
         BNE   L0610AA
         BRL   L06116C
L0610AA  STZ   $E4
L0610AC  LDA   $E4
         SEC
         SBC   #$0010
         BEQ   L0610BB
         BVS   L0610B9
         EOR   #$8000
L0610B9  BMI   L06111B
L0610BB  LDX   #$0000
         TDC
         CLC
         ADC   #$00FB
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
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
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
         _PtInRect
         BCS   L061104
         LDA   #$0000
L061104  STAL  L0B0002
         PLA
         TAY
         BEQ   L061117
         LDA   $E4
         EOR   #$FFFF
         INC
         STA   L0B0078
         BRA   L06111B
L061117  INC   $E4
         BRA   L0610AC
L06111B  LDA   L0B0078
         CMP   #$0000
         BNE   L061169
         LDA   #$0003
         STA   $E4
L061128  LDA   $E4
         BEQ   L061169
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         LDA   $E4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0F82
         LDX   #^L0C0F82
         JSL   L010922
         _PtInRect
         BCS   L061156
         LDA   #$0000
L061156  STAL  L0B0002
         PLA
         TAY
         BEQ   L061165
         LDA   $E4
         STA   L0B0078
         BRA   L061169
L061165  DEC   $E4
         BRA   L061128
L061169  BRL   L061202
L06116C  LDA   $F3
         CMP   #$000D
         BNE   L06118A
         LDA   $F5
         CMP   #$0000
         BNE   L06118A
         LDA   #$0003
         STA   L0B0078
         PEA   $0003
         JSL   L0607BE
         PLY
         BRA   L0611A6
L06118A  LDA   $F3
         CMP   #$001B
         BNE   L0611A6
         LDA   $F5
         CMP   #$0000
         BNE   L0611A6
         LDA   #$0002
         STA   L0B0078
         PEA   $0002
         JSL   L0607BE
         PLY
L0611A6  LDX   $F5
         LDA   $F3
         SEP   #$20
         STA   L0B00B2
         REP   #$20
         LDA   L0B009C
         BEQ   L0611EA
         LDA   L0B00B2
         AND   #$00FF
         SEC
         SBC   #$005A
         BEQ   L0611C9
         BVS   L0611C7
         EOR   #$8000
L0611C7  BMI   L0611EA
L0611C9  LDA   L0B00B2
         AND   #$00FF
         SEC
         SBC   #$0041
         BVS   L0611D8
         EOR   #$8000
L0611D8  BPL   L0611EA
         LDA   L0B00B2
         AND   #$00FF
         ORA   #$0020
         SEP   #$20
         STA   L0B00B2
         REP   #$20
L0611EA  LDA   $FF
         AND   #$0100
         TAY
         BEQ   L061202
         LDA   L0B00B2
         AND   #$00FF
         ORA   #$0080
         SEP   #$20
         STA   L0B00B2
         REP   #$20
L061202  LDA   #$0001
         STA   L0B00CB
L061208  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L061210  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0B0078
         SEC
         SBC   #$0001
         BVS   L061227
         EOR   #$8000
L061227  BPL   L061270
         LDA   L0B0078
         SEC
         SBC   #$0003
         BEQ   L061239
         BVS   L061237
         EOR   #$8000
L061237  BMI   L061270
L061239  LDA   L0B0078
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0F82
         LDX   #^L0C0F82
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         PHX
         PHA
         PEA   ^L0C27D7
         PEA   L0C27D7
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         BRA   L0612A7
         BRA   L0612A7
L061270  LDA   L0B0078
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
         PHX
         PHA
         PEA   ^L0C27D7
         PEA   L0C27D7
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
L0612A7  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0612B1  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PHX
         PHA
         _TickCount
         BCS   L0612CA
         LDA   #$0000
L0612CA  STAL  L0B0002
         PLA
         PLX
         STX   L0B0064
         STA   L0B0062
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0612DE  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L061036
         SEC
         SBC   L0B007A
         BEQ   L06130A
         BVS   L0612F8
         EOR   #$8000
L0612F8  BPL   L06130A
         LDA   L0B007A
         SEC
         SBC   #$0000
         BEQ   L06130A
         BVS   L061308
         EOR   #$8000
L061308  BMI   L06130F
L06130A  LDA   #$0000
         BRA   L061312
L06130F  LDA   #$0001
L061312  STA   L0B007C
         JSL   L061036
         SEC
         SBC   #$00B4
         BEQ   L06134F
         BVS   L061324
         EOR   #$8000
L061324  BPL   L06134F
         LDA   L0B007E
         BEQ   L06134F
         LDA   #$0002
         STA   L0B0078
         PEA   $0000
         PEA   $0013
         JSL   L0251CD
         PLY
         PLY
         PEA   ^L0C27C9
         PEA   L0C27C9
         JSL   L040728
         PLY
         PLY
         LDA   #$0001
         STA   L0B007C
L06134F  LDA   L0B007C
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L06135C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00E2
         TCS
         JSL   L0311DD
         JSL   L0612B1
L06136F  JSL   L06063A
         JSL   L0612DE
         TAY
         BNE   L0613C0
         JSL   L04169A
         TAY
         BNE   L0613C0
         LDAL  L0C1A7A
         CMP   #$0000
         BNE   L0613C0
         LDA   $FF
         PHA
         LDA   #$0006
         SEC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L0613A9
         LDA   #$0000
L0613A9  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   L0B0062
         PHA
         TXA
         SBC   L0B0064
         TAX
         PLA
         JSL   L010B98
         BCS   L06136F
L0613C0  PHA
         PEA   $0247
         PEA   $0000
         _FlushEvents
         BCS   L0613D3
         LDA   #$0000
L0613D3  STAL  L0B0002
         PLA
         JSL   L031208
         TSC
         CLC
         ADC   #$0016
         TCS
         PLD
         RTL

L0613E4  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E4
         TCS
         LDA   $FF
         CMP   #$0000
         BNE   L0613FD
         LDA   #$0001
         STA   $E6
         BRA   L06140B
L0613FD  LDA   $FF
         PHA
         LDA   #$0002
         SEC
         JSL   L010AAE
         PLA
         STA   $E6
L06140B  LDA   #$0001
         STA   $EA
         BRA   L061449
L061412  PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         _InvertRect
         BCS   L061427
         LDA   #$0000
L061427  STAL  L0B0002
         LDA   #$0001
         STA   $E8
         BRA   L061438
L061432  LDA   $E8
         STA   $E8
         INC   $E8
L061438  LDA   $E8
         SEC
         SBC   #$1B58
         BEQ   L061432
         BVS   L061445
         EOR   #$8000
L061445  BPL   L061432
         INC   $EA
L061449  LDA   $EA
         SEC
         SBC   $E6
         BEQ   L061412
         BVS   L061455
         EOR   #$8000
L061455  BPL   L061412
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L06145F  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$0088
         TCS
         STZ   $F2
         LDA   $FF
         SEC
         SBC   #$0006
         BEQ   L06147E
         BVS   L061479
         EOR   #$8000
L061479  BPL   L06147E
         BRL   L061524
L06147E  PEA   ^L0C27CE
         PEA   L0C27CE
         PEA   $0000
         TDC
         CLC
         ADC   #$008A
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $FF
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1A8A
         LDX   #^L0C1A8A
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   [$F4]
         STA   $EE
L0614B1  PEA   $0000
         TDC
         CLC
         ADC   #$008A
         PHA
         JSL   L023BE0
         PLY
         PLY
         TAY
         BEQ   L0614CD
         LDA   $8B
         AND   #$00FF
         CMP   #$0077
         BEQ   L061524
L0614CD  PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$008A
         PHA
         JSL   L023C7E
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$008A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         LDX   L0B0028
         LDA   L0B0026
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         PHX
         PHA
         JSL   L040508
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         BRA   L0614B1
L061524  TSC
         CLC
         ADC   #$0070
         TCS
         PLD
         RTL

L06152C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   $FF
         STA   L0B007A
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L061544  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00A0
         TCS
         STZ   $A2
         STZ   $A4
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L061834
         PLY
         PLY
         PEA   ^L0C27D1
         PEA   L0C27D1
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         _GetMenuBar
         BCS   L061584
         LDA   #$0000
L061584  STAL  L0B0002
         PLA
         PLX
         STX   $E4
         STA   $E2
         JSL   L0612B1
         JSL   L0311DD
L061596  PEA   $0004
         JSL   L06078F
         PLY
         LDA   L0B0078
         CMP   #$0001
         BEQ   L0615B3
         LDA   L0B0078
         CMP   #$0002
         BEQ   L0615B3
         LDA   #$0000
         BRA   L0615B6
L0615B3  LDA   #$0001
L0615B6  STA   $AC
         LDAL  L0C1A7A
         CMP   #$0000
         BNE   L0615CC
         JSL   L0612DE
         TAY
         BNE   L0615CC
         LDA   $AC
         BEQ   L061596
L0615CC  JSL   L0612DE
         TAY
         BNE   L0615D7
         LDA   $AC
         BEQ   L0615E9
L0615D7  STZ   L0B0076
         STZ   L0B0074
         LDA   L0B0078
         PHA
         JSL   L0607BE
         PLY
         BRL   L06181A
L0615E9  LDX   #$0000
         TDC
         CLC
         ADC   #$00C6
         STX   $C4
         STA   $C2
         LDA   #L0C1A7A
         LDX   #^L0C1A7A
         STX   $C0
         STA   $BE
         LDA   $BE
         LDX   $C0
         PHX
         PHA
         LDA   $C4
         PHA
         LDA   $C2
         PHA
         PEA   $0010
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L061623
         BRL   L0616C7
L061623  STZ   $F2
         STZ   $F0
         LDA   $D4
         AND   #$0100
         TAY
         BNE   L061632
         BRL   L0616A1
L061632  PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEI   $E4
         PEI   $E2
         _MenuKey
         BCS   L06164B
         LDA   #$0000
L06164B  STAL  L0B0002
         PHA
         PEI   $D8
         PEI   $D6
         _LoWord
         BCS   L061660
         LDA   #$0000
L061660  STAL  L0B0002
         PLA
         STA   $F0
         PHA
         PEI   $D8
         PEI   $D6
         _HiWord
         BCS   L061678
         LDA   #$0000
L061678  STAL  L0B0002
         PLA
         STA   $F2
         LDA   $F2
         CMP   L0B0074
         BNE   L0616A1
         LDA   $F0
         CMP   L0B0076
         BNE   L0616A1
         PEA   ^L0C27D3
         PEA   L0C27D3
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L0616A1  LDA   $F2
         BEQ   L0616BA
         PEA   $0000
         PEI   $F2
         _HiliteMenu
         BCS   L0616B6
         LDA   #$0000
L0616B6  STAL  L0B0002
L0616BA  LDA   $F2
         STA   L0B0074
         LDA   $F0
         STA   L0B0076
         BRL   L06181A
L0616C7  LDA   #L0C1A84
         LDX   #^L0C1A84
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DE
         PHA
         PEA   $0004
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
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
         _PtInRect
         BCS   L061703
         LDA   #$0000
L061703  STAL  L0B0002
         PLA
         TAY
         BEQ   L06171B
         LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L06172E
         BVS   L061719
         EOR   #$8000
L061719  BPL   L06172E
L06171B  LDA   L0B0074
         BNE   L061725
         LDA   L0B0076
         BEQ   L06172E
L061725  STZ   L0B0074
         STZ   L0B0076
         BRL   L06181A
L06172E  PHX
         PHA
         _GetTick
         BCS   L06173C
         LDA   #$0000
L06173C  STAL  L0B0002
         PLA
         PLX
         STX   $A4
         STA   $A2
         JSL   L061EBD
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEI   $E4
         PEI   $E2
         _MenuSelect
         BCS   L061763
         LDA   #$0000
L061763  STAL  L0B0002
         JSL   L061F5B
         PHA
         PEI   $D8
         PEI   $D6
         _LoWord
         BCS   L06177C
         LDA   #$0000
L06177C  STAL  L0B0002
         PLA
         STA   $F0
         PHA
         PEI   $D8
         PEI   $D6
         _HiWord
         BCS   L061794
         LDA   #$0000
L061794  STAL  L0B0002
         PLA
         STA   $F2
         PHX
         PHA
         _GetTick
         BCS   L0617A9
         LDA   #$0000
L0617A9  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   $A2
         PHA
         TXA
         SBC   $A4
         TAX
         PLA
         STX   $A4
         STA   $A2
         LDA   $F2
         CMP   #$0000
         BNE   L0617CA
         LDA   $F0
         CMP   #$0000
         BEQ   L061801
L0617CA  LDA   $F2
         CMP   L0B0074
         BNE   L0617EC
         LDA   $F0
         CMP   L0B0076
         BNE   L0617EC
         PEA   ^L0C27D5
         PEA   L0C27D5
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L0617EC  PEA   $0000
         PEI   $F2
         _HiliteMenu
         BCS   L0617FD
         LDA   #$0000
L0617FD  STAL  L0B0002
L061801  LDA   $F2
         CMP   #$0000
         BNE   L061810
         LDA   L0B0074
         CMP   #$0000
         BNE   L061815
L061810  LDA   $F2
         STA   L0B0074
L061815  LDA   $F0
         STA   L0B0076
L06181A  LDX   $A4
         LDA   $A2
         PHA
         PEA   $0000
         JSL   L0251CD
         PLY
         PLY
         JSL   L031208
         TSC
         CLC
         ADC   #$005A
         TCS
         PLD
         RTL

L061834  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         LDA   #$03E8
         PHA
         LDA   L0B0076
         SEC
         JSL   L01092D
         PLY
         STA   L0B0074
         LDA   #$0000
         STA   [$FD]
         LDA   #$0000
         LDY   #$0002
         STA   [$FD],Y
         LDA   #$0001
         STA   $F0
         BRA   L061888
L061863  PHA
         PEI   $F0
         _GetMTitleWidth
         BCS   L061872
         LDA   #$0000
L061872  STAL  L0B0002
         LDY   #$0002
         LDA   [$FD],Y
         PLX
         STX   $F6
         CLC
         ADC   $F6
         LDY   #$0002
         STA   [$FD],Y
         INC   $F0
L061888  LDA   $F0
         SEC
         SBC   L0B0074
         BVS   L061893
         EOR   #$8000
L061893  BPL   L061863
         PHA
         _GetMTitleStart
         BCS   L0618A2
         LDA   #$0000
L0618A2  STAL  L0B0002
         LDY   #$0002
         LDA   [$FD],Y
         PLX
         STX   $F6
         CLC
         ADC   $F6
         LDY   #$0002
         STA   [$FD],Y
         PHA
         LDA   L0B0074
         PHA
         _GetMTitleWidth
         BCS   L0618C7
         LDA   #$0000
L0618C7  STAL  L0B0002
         LDY   #$0002
         LDA   [$FD],Y
         PLX
         STX   $F6
         CLC
         ADC   $F6
         LDY   #$0006
         STA   [$FD],Y
         LDA   L0B00B9
         LDY   #$0004
         STA   [$FD],Y
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0618EB  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00CB
         TCS
         STZ   L0B0078
         PEA   $0000
         TDC
         CLC
         ADC   #$00D9
         PHA
         _GetPen
         BCS   L06190E
         LDA   #$0000
L06190E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00E5
         PHA
         PEI   $DB
         LDA   $D9
         SEC
         SBC   L0B0070
         CLC
         ADC   #$0001
         PHA
         LDAL  L0C0F80
         SEC
         SBC   #$0001
         PHA
         LDA   $D9
         CLC
         ADC   #$0001
         PHA
         _SetRect
         BCS   L061944
         LDA   #$0000
L061944  STAL  L0B0002
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E5
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DD
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDAL  L0C1AA2
         BEQ   L061970
         BRL   L0619EF
L061970  STZ   $EF
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0000
         BEQ   L0619B9
         BVS   L061989
         EOR   #$8000
L061989  BPL   L0619B9
         PHA
         PEA   ^L0C11BB
         PEA   L0C11BB
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         PHA
         _TextWidth
         BCS   L0619AB
         LDA   #$0000
L0619AB  STAL  L0B0002
         LDA   $EF
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $EF
L0619B9  LDA   $DB
         CLC
         ADC   $EF
         CLC
         ADC   #$0001
         PHA
         LDAL  L0C0F80
         SEC
         SBC   #$0001
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BEQ   L0619E5
         BVS   L0619D8
         EOR   #$8000
L0619D8  BPL   L0619E5
         LDA   $DB
         CLC
         ADC   $EF
         CLC
         ADC   #$0001
         BRA   L0619ED
L0619E5  LDAL  L0C0F80
         SEC
         SBC   #$0001
L0619ED  STA   $E3
L0619EF  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DD
         PHA
         PEA   $0066
         _LENew
         BCS   L061A12
         LDA   #$0000
L061A12  STAL  L0B0002
         PLA
         PLX
         STX   $D7
         STA   $D5
         PEA   $05DD
         JSL   L021DFD
         PLY
         PEA   ^L0C11BB
         PEA   L0C11BB
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L010D87
         PLY
         PLY
         PHA
         PEI   $D7
         PEI   $D5
         _LEInsert
         BCS   L061A47
         LDA   #$0000
L061A47  STAL  L0B0002
         PEA   $05E3
         JSL   L021DFD
         PLY
         LDAL  L0C1AA8
         PHA
         LDAL  L0C1AA8
         PHA
         PEI   $D7
         PEI   $D5
         _LESetSelect
         BCS   L061A6D
         LDA   #$0000
L061A6D  STAL  L0B0002
         PEA   $05E5
         JSL   L021DFD
         PLY
         PEI   $D7
         PEI   $D5
         _LEActivate
         BCS   L061A89
         LDA   #$0000
L061A89  STAL  L0B0002
         PEA   $05E7
         JSL   L021DFD
         PLY
         JSL   L0612B1
         JSL   L0311DD
         LDA   #$0001
         SEP   #$20
         STA   $F5
         REP   #$20
L061AA6  PEI   $D7
         PEI   $D5
         _LEIdle
         BCS   L061AB6
         LDA   #$0000
L061AB6  STAL  L0B0002
         JSL   L06063A
         LDA   #L0C1A7A
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
         JSL   L0612DE
         TAY
         BNE   L061B09
         JSL   L04169A
         TAY
         BNE   L061B09
         LDA   L0B0078
         CMP   #$0003
         BNE   L061B12
         LDAL  L0C1A7A
         CMP   #$0000
         BEQ   L061B12
L061B09  SEP   #$20
         STZ   $F5
         REP   #$20
         BRL   L061D06
L061B12  LDAL  L0C1A7A
         CMP   #$0003
         BEQ   L061B27
         LDAL  L0C1A7A
         CMP   #$0005
         BEQ   L061B27
         BRL   L061D06
L061B27  LDAL  L0C1A88
         AND   #$1000
         TAY
         BEQ   L061B34
         BRL   L061D06
L061B34  LDA   #$0001
         SEP   #$20
         STA   $F3
         REP   #$20
         LDAL  L0C1A7E
         TAX
         LDAL  L0C1A7C
         AND   #$00FF
         PHA
         TXA
         AND   #$0000
         TAX
         PLA
         STA   $ED
         LDAL  L0C1A88
         STA   $F1
         LDAL  L0C1AAC
         BEQ   L061B7F
         LDA   $ED
         CMP   #$007F
         BEQ   L061B76
         SEP   #$20
         STZ   $F5
         REP   #$20
         LDAL  L0C1AAE
         INC
         STAL  L0C1AAE
         BRA   L061B7F
L061B76  LDAL  L0C1AAE
         DEC
         STAL  L0C1AAE
L061B7F  LDA   $ED
         CMP   #$000A
         BEQ   L061B8D
         LDA   $ED
         CMP   #$000D
         BNE   L061B99
L061B8D  SEP   #$20
         STZ   $F5
         REP   #$20
         SEP   #$20
         STZ   $F3
         REP   #$20
L061B99  LDAL  L0C1AA6
         BEQ   L061BAB
         SEP   #$20
         STZ   $F3
         REP   #$20
         SEP   #$20
         STZ   $F5
         REP   #$20
L061BAB  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         CLC
         ADC   #$0001
         PHA
         LDAL  L0C1A9A
         PLX
         STX   $F6
         CMP   $F6
         BEQ   L061BCE
         BCS   L061BDD
L061BCE  LDAL  L0C1AB0
         CMP   #$0001
         BNE   L061BDD
         SEP   #$20
         STZ   $F5
         REP   #$20
L061BDD  LDA   $ED
         CMP   #$007F
         BEQ   L061BEB
         LDA   $ED
         CMP   #$0008
         BNE   L061BFF
L061BEB  LDA   #$0001
         SEP   #$20
         STA   $F3
         REP   #$20
         LDA   #$0001
         SEP   #$20
         STA   $F5
         REP   #$20
         BRA   L061C1B
L061BFF  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         CMP   #$0064
         BCC   L061C1B
         SEP   #$20
         STZ   $F3
         REP   #$20
L061C1B  LDAL  L0C1AA2
         BEQ   L061C24
         BRL   L061CC6
L061C24  LDA   $F3
         AND   #$00FF
         BNE   L061C2E
         BRL   L061CC6
L061C2E  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STX   $D3
         STA   $D1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00ED
         PHA
         PEA   $0001
         _TextWidth
         BCS   L061C53
         LDA   #$0000
L061C53  STAL  L0B0002
         PHA
         LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         PHX
         PHA
         LDY   #$0004
         LDA   [$D1],Y
         PHA
         _TextWidth
         BCS   L061C80
         LDA   #$0000
L061C80  STAL  L0B0002
         PLA
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $EF
         LDA   $DB
         CLC
         ADC   $EF
         CLC
         ADC   #$0001
         PHA
         LDAL  L0C0F80
         SEC
         SBC   #$0001
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BEQ   L061CB9
         BVS   L061CAC
         EOR   #$8000
L061CAC  BPL   L061CB9
         LDA   $DB
         CLC
         ADC   $EF
         CLC
         ADC   #$0001
         BRA   L061CC1
L061CB9  LDAL  L0C0F80
         SEC
         SBC   #$0001
L061CC1  LDY   #$0016
         STA   [$D1],Y
L061CC6  LDA   $F3
         AND   #$00FF
         BEQ   L061CE5
         PEI   $ED
         PEI   $F1
         PEI   $D7
         PEI   $D5
         _LEKey
         BCS   L061CE1
         LDA   #$0000
L061CE1  STAL  L0B0002
L061CE5  LDAL  L0C1AAA
         BEQ   L061CF1
         SEP   #$20
         STZ   $F5
         REP   #$20
L061CF1  LDAL  L0C1AAC
         BEQ   L061D06
         LDAL  L0C1AAE
         CMP   #$0000
         BNE   L061D06
         SEP   #$20
         STZ   $F5
         REP   #$20
L061D06  LDA   $F5
         AND   #$00FF
         BEQ   L061D10
         BRL   L061AA6
L061D10  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STX   $CF
         STA   $CD
         LDAL  L0C1A9C
         BEQ   L061D88
         LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         CMPL  L0C1A9A
         BEQ   L061D59
         BCC   L061D59
         LDAL  L0C1A9A
         BRA   L061D6A
L061D59  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
L061D6A  LDX   #$0000
         PHX
         PHA
         LDX   $CF
         LDA   $CD
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         SEP   #$20
         STA   [$F6]
         REP   #$20
         BRA   L061DD2
L061D88  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         CMP   #$0031
         BEQ   L061DA5
         BCC   L061DA5
         LDA   #$0031
         BRA   L061DB6
L061DA5  LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
L061DB6  LDX   #$0000
         PHX
         PHA
         LDX   $CF
         LDA   $CD
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         SEP   #$20
         STA   [$F6]
         REP   #$20
L061DD2  PEI   $CF
         PEI   $CD
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEI   $CF
         PEI   $CD
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         JSL   L031208
         LDAL  L0C1AA4
         BNE   L061E03
         BRL   L061E7C
L061E03  PEA   $0020
         PEA   $0000
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L024161
         PLY
         PLY
         PLY
         PLY
         STA   $EF
         PEI   $EF
         PEA   $0000
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEA   $0020
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0001
         EOR   #$FFFF
         INC
         PHA
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L024161
         PLY
         PLY
         PLY
         PLY
         STA   $EF
         LDA   $EF
         CLC
         ADC   #$0001
         STA   $EF
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   $EF
         PHA
         PEI   $EF
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
L061E7C  LDA   L0B009C
         BEQ   L061E8D
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0242F7
         PLY
         PLY
L061E8D  PEI   $D7
         PEI   $D5
         _LEDeactivate
         BCS   L061E9D
         LDA   #$0000
L061E9D  STAL  L0B0002
         PEI   $D7
         PEI   $D5
         _LEDispose
         BCS   L061EB1
         LDA   #$0000
L061EB1  STAL  L0B0002
         TSC
         CLC
         ADC   #$002F
         TCS
         PLD
         RTL

L061EBD  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         _HideCursor
         BCS   L061ED4
         LDA   #$0000
L061ED4  STAL  L0B0002
         PEA   $0000
         PEA   $027F
         PEA   $0000
         PEA   $00C7
         _ClampMouse
         BCS   L061EF0
         LDA   #$0000
L061EF0  STAL  L0B0002
         PEA   $0001
         PEA   $0000
         LDAL  L0C1A86
         PHA
         LDAL  L0C1A84
         PHA
         PEA   $8000
         _FakeMouse
         BCS   L061F13
         LDA   #$0000
L061F13  STAL  L0B0002
         _InitCursor
         BCS   L061F23
         LDA   #$0000
L061F23  STAL  L0B0002
         LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         _SetCursor
         BCS   L061F3B
         LDA   #$0000
L061F3B  STAL  L0B0002
         JSL   L0620B1
         _ShowCursor
         BCS   L061F4F
         LDA   #$0000
L061F4F  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L061F5B  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L06204F
         _HideCursor
         BCS   L061F76
         LDA   #$0000
L061F76  STAL  L0B0002
         PEA   ^L0C1A84
         PEA   L0C1A84
         _GetMouse
         BCS   L061F8C
         LDA   #$0000
L061F8C  STAL  L0B0002
         PEA   $0000
         PEA   $013F
         PEA   $0000
         PEA   $00C7
         _ClampMouse
         BCS   L061FA8
         LDA   #$0000
L061FA8  STAL  L0B0002
         LDA   #$0002
         PHA
         LDAL  L0C1A86
         SEC
         JSL   L01092D
         PLY
         STAL  L0C1A86
         PEA   $0000
         _SetMasterSCB
         BCS   L061FCD
         LDA   #$0000
L061FCD  STAL  L0B0002
         PEA   $0001
         PEA   $0000
         LDAL  L0C1A86
         PHA
         LDAL  L0C1A84
         PHA
         PEA   $8000
         _FakeMouse
         BCS   L061FF0
         LDA   #$0000
L061FF0  STAL  L0B0002
         LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         _SetCursor
         BCS   L062008
         LDA   #$0000
L062008  STAL  L0B0002
         _InitCursor
         BCS   L062018
         LDA   #$0000
L062018  STAL  L0B0002
         PEA   $0080
         _SetMasterSCB
         BCS   L06202B
         LDA   #$0000
L06202B  STAL  L0B0002
         PHA
         PEA   $00FF
         PEA   $0000
         _FlushEvents
         BCS   L062042
         LDA   #$0000
L062042  STAL  L0B0002
         PLA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L06204F  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0B00D7
         LDA   L0B00D5
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STX   L0B00D3
         STA   L0B00D1
         LDX   #$0000
         LDA   #$0008
         PHX
         PHA
         LDA   #L0620DE
         LDX   #^L0620DE
         SEC
         JSL   L010CB2
         PLA
         PLX
         ORA   #$005C
         PHA
         TXA
         ORA   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   L0B00D7
         LDA   L0B00D5
         STA   $F6
         STX   $F8
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$F6],Y
         PLA
         STA   [$F6]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0620B1  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0B00D7
         LDA   L0B00D5
         STA   $F6
         STX   $F8
         LDX   L0B00D3
         LDA   L0B00D1
         LDY   #$0002
         PHA
         TXA
         STA   [$F6],Y
         PLA
         STA   [$F6]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0620DE  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E8
         TCS
         LDX   L0B00CF
         LDA   L0B00CD
         STX   $F4
         STA   $F2
         LDA   $F2
         LDX   $F4
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   #$0002
         PHA
         LDY   #$0002
         LDA   [$F2],Y
         SEC
         JSL   L01092D
         PLY
         LDY   #$0002
         STA   [$F2],Y
         LDA   #$0002
         PHA
         LDY   #$0006
         LDA   [$F2],Y
         SEC
         JSL   L01092D
         PLY
         LDY   #$0006
         STA   [$F2],Y
         PHD
         LDAL  L0B00CD
         TCD
         JSL   L0B00D1
         PLD
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         PHX
         PHA
         LDA   $F4
         PHA
         LDA   $F2
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

