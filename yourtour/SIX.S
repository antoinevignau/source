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

	use	SIX.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/NoteSeq.Macs
	use	4/NoteSyn.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Util.Macs
	
*-------------------------------

L070000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00BC
         TCS
         PEI   $FF
         PEI   $FD
         PEA   ^L0C251F
         PEA   L0C251F
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
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
         PEA   $0000
         TDC
         CLC
         ADC   #$00C0
         PHA
         PEA   ^L0C11EE
         PEA   L0C11EE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L070085
         PEA   $0000
         TDC
         CLC
         ADC   #$00C0
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $BE
         LDA   $BE
         SEC
         SBC   #$0000
         BVS   L070068
         EOR   #$8000
L070068  BPL   L070083
         PEI   $BE
         JSL   L070091
         PLY
         PEI   $FF
         PEI   $FD
         PEA   ^L0C11EE
         PEA   L0C11EE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L070083  BRA   L070089
L070085  JSL   L071812
L070089  TSC
         CLC
         ADC   #$003A
         TCS
         PLD
         RTL

L070091  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00E1
         TCS
         STZ   $F2
         BRL   L070122
L0700A1  LDA   $F2
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1A52
         LDX   #^L0C1A52
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STA   $F4
         STX   $F6
         LDA   [$F4]
         PHA
         _DeleteMenu
         BCS   L0700E1
         LDA   #$0000
L0700E1  STAL  L0B0002
         PEA   $0320
         JSL   L021DFD
         PLY
         LDA   $F2
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1A52
         LDX   #^L0C1A52
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         PHX
         PHA
         _DisposeHandle
         BCS   L07011C
         LDA   #$0000
L07011C  STAL  L0B0002
         INC   $F2
L070122  LDA   $F2
         SEC
         SBC   L0B00B7
         BVS   L07012D
         EOR   #$8000
L07012D  BMI   L070132
         BRL   L0700A1
L070132  PHX
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
         BCS   L07016E
         LDA   #$0000
L07016E  STAL  L0B0002
         PLA
         PLX
         STX   $EE
         STA   $EC
         PEA   $0000
         PEI   $EE
         PEI   $EC
         LDX   L0B004C
         LDA   L0B004A
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0321
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
         LDY   #$0004
         LDA   [$F4],Y
         TAX
         LDY   #$0002
         LDA   [$F4],Y
         PHX
         PHA
         LDX   L0B004C
         LDA   L0B004A
         PHX
         PHA
         PEI   $EE
         PEI   $EC
         _HandToHand
         BCS   L0701DE
         LDA   #$0000
L0701DE  STAL  L0B0002
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
         LDA   #$0032
         STA   [$F4]
         _CompactMem
         BCS   L070214
         LDA   #$0000
L070214  STAL  L0B0002
         LDX   L0B004C
         LDA   L0B004A
         PHX
         PHA
         _HLock
         BCS   L07022C
         LDA   #$0000
L07022C  STAL  L0B0002
         LDX   L0B004C
         LDA   L0B004A
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $EA
         STA   $E8
         LDX   L0B004C
         LDA   L0B004A
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $E6
         STA   $E4
         STZ   L0B00B7
         LDA   [$E8]
         SEP   #$20
         STA   $E3
         REP   #$20
L070267  LDX   $EA
         LDA   $E8
         CLC
         ADC   $EC
         PHA
         TXA
         ADC   $EE
         TAX
         PLA
         PHX
         PHA
         LDX   $E6
         LDA   $E4
         JSL   L010B98
         BNE   L070283
         BRL   L070324
L070283  BVS   L070288
         EOR   #$8000
L070288  BMI   L07028D
         BRL   L070324
L07028D  PHX
         PHA
         PEI   $E6
         PEI   $E4
         _NewMenu
         BCS   L07029F
         LDA   #$0000
L07029F  STAL  L0B0002
         LDA   L0B00B7
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1A52
         LDX   #^L0C1A52
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
         PEA   $0323
         JSL   L021DFD
         PLY
         INC   L0B00B7
         LDX   $E6
         LDA   $E4
         CLC
         ADC   #$0002
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $E6
         STA   $E4
L0702E7  LDA   [$E4]
         AND   #$00FF
         PHA
         LDA   $E3
         AND   #$00FF
         PLX
         STX   $F4
         CMP   $F4
         BEQ   L070321
         LDX   $EA
         LDA   $E8
         CLC
         ADC   $EC
         PHA
         TXA
         ADC   $EE
         TAX
         PLA
         PHX
         PHA
         LDX   $E6
         LDA   $E4
         JSL   L010B98
         BEQ   L070321
         BVS   L070317
         EOR   #$8000
L070317  BPL   L070321
         INC   $E4
         BNE   L07031F
         INC   $E6
L07031F  BRA   L0702E7
L070321  BRL   L070267
L070324  LDA   L0B00B7
         SEC
         SBC   #$0001
         STA   $F2
         BRA   L07036F
L07032F  LDA   $F2
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1A52
         LDX   #^L0C1A52
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         PHX
         PHA
         PEA   $0000
         _InsertMenu
         BCS   L070361
         LDA   #$0000
L070361  STAL  L0B0002
         PEA   $0324
         JSL   L021DFD
         PLY
         DEC   $F2
L07036F  LDA   $F2
         SEC
         SBC   #$0000
         BVS   L07037A
         EOR   #$8000
L07037A  BMI   L07032F
         PHA
         _FixMenuBar
         BCS   L070389
         LDA   #$0000
L070389  STAL  L0B0002
         PLA
         SEC
         SBC   #$0001
         STA   L0B00B9
         JSL   L071812
         TSC
         CLC
         ADC   #$0017
         TCS
         PLD
         RTL

L0703A1  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E7
         TCS
         PEA   ^L0C2525
         PEA   L0C2525
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0703EE
         PEA   ^L0C2529
         PEA   L0C2529
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0703EE
         PEA   ^L0C2530
         PEA   L0C2530
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0703EE
         BRL   L070435
L0703EE  PHX
         PHA
         _GetSysFont
         BCS   L0703FC
         LDA   #$0000
L0703FC  STAL  L0B0002
         _SetFont
         BCS   L07040C
         LDA   #$0000
L07040C  STAL  L0B0002
         PEA   ^L0B0070
         PEA   L0B0070
         PEA   ^L0B0072
         PEA   L0B0072
         JSL   L070547
         PLY
         PLY
         PLY
         PLY
         LDX   L0B0050
         LDA   L0B004E
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         BRL   L07053F
L070435  PEI   $FF
         PEI   $FD
         PEA   ^L0C2538
         PEA   L0C2538
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L040E53
         PLY
         PLY
         STA   $EB
         LDA   $EB
         SEC
         SBC   #$0000
         BVS   L07045E
         EOR   #$8000
L07045E  BMI   L070463
         BRL   L07053F
L070463  PHX
         PHA
         LDA   $EB
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
         _GetHandleSize
         BCS   L07049F
         LDA   #$0000
L07049F  STAL  L0B0002
         PLA
         PLX
         STX   $EF
         STA   $ED
         PEA   $0000
         PEI   $EF
         PEI   $ED
         LDX   L0B0050
         LDA   L0B004E
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $EB
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
         LDX   L0B0050
         LDA   L0B004E
         PHX
         PHA
         PEI   $EF
         PEI   $ED
         _HandToHand
         BCS   L070507
         LDA   #$0000
L070507  STAL  L0B0002
         PEA   $02BC
         JSL   L021DFD
         PLY
         LDX   L0B0050
         LDA   L0B004E
         PHX
         PHA
         _SetFont
         BCS   L070527
         LDA   #$0000
L070527  STAL  L0B0002
         PEA   ^L0B0070
         PEA   L0B0070
         PEA   ^L0B0072
         PEA   L0B0072
         JSL   L070547
         PLY
         PLY
         PLY
         PLY
L07053F  TSC
         CLC
         ADC   #$000F
         TCS
         PLD
         RTL

L070547  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E4
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         _GetFontInfo
         BCS   L070567
         LDA   #$0000
L070567  STAL  L0B0002
         LDA   $EA
         STA   [$F9]
         LDA   $E6
         CLC
         ADC   $E8
         CLC
         ADC   $EC
         STA   [$FD]
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L070581  ENT
         PHD
         TSC
         SEC
         SBC   #$00E1
         TCD
         ADC   #$00DA
         TCS
         PEI   $F5
         PEI   $F3
         PEI   $F7
         PEI   $F1
         PEI   $E9
         PEI   $E7
         JSL   L071136
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         JSL   L0311DD
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F5
         PEI   $F3
         PEI   $ED
         PEI   $EF
         PEI   $EB
         PEI   $F7
         PEI   $F1
         JSL   L0705F6
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         JSL   L031208
         LDA   $F7
         BEQ   L0705EE
         LDX   L0B0048
         LDA   L0B0046
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
L0705EE  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0705F6  ENT
         PHD
         TSC
         SEC
         SBC   #$00E5
         TCD
         ADC   #$00A6
         TCS
         STZ   $D8
         STZ   $DE
         STZ   $DA
         PEA   $0000
         TDC
         CLC
         ADC   #$00A8
         PHA
         PEA   $0000
         PEA   $0000
         _SetPt
         BCS   L070622
         LDA   #$0000
L070622  STAL  L0B0002
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         STX   $AE
         STA   $AC
         LDA   #L0C0E30
         LDX   #^L0C0E30
         STX   $B2
         STA   $B0
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C2
         STX   $B6
         STA   $B4
         LDX   #$0000
         TDC
         CLC
         ADC   #$00A8
         STX   $BA
         STA   $B8
         LDA   #$0000
         STA   $BC
         LDAL  L0C0CF6
         TAX
         LDAL  L0C0CF4
         STX   $C0
         STA   $BE
         LDA   #$0001
         STA   L0B00AE
         _StartInts
         BCS   L070676
         LDA   #$0000
L070676  STAL  L0B0002
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L07068D
         LDA   #$0000
L07068D  STAL  L0B0002
         PLA
L070692  STZ   $DC
         BRL   L0710E6
L070697  LDA   $ED
         BNE   L07069E
         BRL   L070C34
L07069E  LDA   $DA
         BNE   L0706A5
         BRL   L070828
L0706A5  LDA   $F1
         SEC
         SBC   #$0000
         BVS   L0706B0
         EOR   #$8000
L0706B0  BMI   L0706BF
         LDA   $EB
         SEC
         SBC   #$0001
         CMP   $DC
         BNE   L0706BF
         BRL   L070828
L0706BF  PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $DC
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L0706DB
         DEX
L0706DB  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L07070B
         DEX
L07070B  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0006
         LDA   [$E0],Y
         PLX
         STX   $E4
         SEC
         SBC   $E4
         PHA
         LDA   $DC
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L070741
         DEX
L070741  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         LDA   $DC
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L07076E
         DEX
L07076E  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0004
         LDA   [$E0],Y
         PLX
         STX   $E4
         SEC
         SBC   $E4
         PHA
         _SetRect
         BCS   L0707A3
         LDA   #$0000
L0707A3  STAL  L0B0002
         PEA   ^L0C0E30
         PEA   L0C0E30
         PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L0707C3
         DEX
L0707C3  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L0707F0
         DEX
L0707F0  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         PEA   $0000
         _PPToPort
         BCS   L07081C
         LDA   #$0000
L07081C  STAL  L0B0002
         PEA   $07D3
         JSL   L021DFD
         PLY
L070828  PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L07083A
         DEX
L07083A  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070863
         DEX
L070863  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070889
         DEX
L070889  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L0708B2
         DEX
L0708B2  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L0708DE
         DEX
L0708DE  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0006
         LDA   [$E0],Y
         PLX
         STX   $E4
         SEC
         SBC   $E4
         PLX
         STX   $E4
         CLC
         ADC   $E4
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070916
         DEX
L070916  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L07093C
         DEX
L07093C  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070965
         DEX
L070965  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0004
         LDA   [$E0],Y
         PLX
         STX   $E4
         SEC
         SBC   $E4
         PLX
         STX   $E4
         CLC
         ADC   $E4
         PHA
         _SetRect
         BCS   L0709A0
         LDA   #$0000
L0709A0  STAL  L0B0002
         JSL   L03117F
         PEA   $0000
         TDC
         CLC
         ADC   #$00AC
         PHA
         _PaintPixels
         BCS   L0709BD
         LDA   #$0000
L0709BD  STAL  L0B0002
         JSL   L0311AA
         LDA   $ED
         CMP   #$0002
         BEQ   L0709CF
         BRL   L070B09
L0709CF  PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L0709E1
         DEX
L0709E1  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070A0D
         DEX
L070A0D  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070A36
         DEX
L070A36  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0006
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070A62
         DEX
L070A62  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0004
         LDA   [$E0],Y
         PHA
         _SetRect
         BCS   L070A91
         LDA   #$0000
L070A91  STAL  L0B0002
         PEA   ^L0C0C32
         PEA   L0C0C32
         PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070AAD
         DEX
L070AAD  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070AD6
         DEX
L070AD6  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         PEA   $0000
         _PPToPort
         BCS   L070B02
         LDA   #$0000
L070B02  STAL  L0B0002
         BRL   L070C2C
L070B09  LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070B12
         DEX
L070B12  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   $E0
         LDX   $E2
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   ^L0C0D86
         PEA   L0C0D86
         PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070B62
         DEX
L070B62  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070B8B
         DEX
L070B8B  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         PEA   $0003
         _PPToPort
         BCS   L070BB7
         LDA   #$0000
L070BB7  STAL  L0B0002
         PEA   ^L0C0C32
         PEA   L0C0C32
         PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070BD3
         DEX
L070BD3  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070BFC
         DEX
L070BFC  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         PEA   $0001
         _PPToPort
         BCS   L070C28
         LDA   #$0000
L070C28  STAL  L0B0002
L070C2C  LDA   #$0001
         STA   $DA
         BRL   L070D6B
L070C34  PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070C46
         DEX
L070C46  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070C72
         DEX
L070C72  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070C9B
         DEX
L070C9B  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0006
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070CC7
         DEX
L070CC7  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0004
         LDA   [$E0],Y
         PHA
         _SetRect
         BCS   L070CF6
         LDA   #$0000
L070CF6  STAL  L0B0002
         PEA   ^L0C0C32
         PEA   L0C0C32
         PEA   $0000
         TDC
         CLC
         ADC   #$00C2
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070D12
         DEX
L070D12  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070D3B
         DEX
L070D3B  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         PHA
         PEA   $0000
         _PPToPort
         BCS   L070D67
         LDA   #$0000
L070D67  STAL  L0B0002
L070D6B  LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070D74
         DEX
L070D74  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         AND   #$007F
         TAY
         BNE   L070D99
         BRL   L070F29
L070D99  PHA
         PEA   $007F
         _AllocGen
         BCS   L070DA9
         LDA   #$0000
L070DA9  STAL  L0B0002
         PLA
         STA   $D6
         PEI   $D6
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070DBB
         DEX
L070DBB  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         AND   #$007F
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070DEC
         DEX
L070DEC  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         AND   #$007F
         PHA
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070E15
         DEX
L070E15  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         XBA
         AND   #$00FF
         LSR
         LSR
         LSR
         AND   #$000F
         PHA
         LDA   #$0040
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2156
         LDX   #^L0C2156
         JSL   L010922
         _NoteOn
         BCS   L070E63
         LDA   #$0000
L070E63  STAL  L0B0002
         PHX
         PHA
         _GetTick
         BCS   L070E75
         LDA   #$0000
L070E75  STAL  L0B0002
         PLA
         PLX
         STX   $D0
         STA   $CE
         STZ   $CA
         STZ   $CC
L070E83  LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070E8C
         DEX
L070E8C  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDY   #$0002
         LDA   [$E0],Y
         AND   #$07FF
         LDX   #$0000
         PHX
         PHA
         LDX   $D0
         LDA   $CE
         JSL   L010922
         LDX   $CC
         LDA   $CA
         JSL   L010B98
         BEQ   L070EE6
         BVS   L070ECA
         EOR   #$8000
L070ECA  BPL   L070EE6
         PHX
         PHA
         _GetTick
         BCS   L070EDA
         LDA   #$0000
L070EDA  STAL  L0B0002
         PLA
         PLX
         STX   $CC
         STA   $CA
         BRA   L070E83
L070EE6  PEI   $D6
         LDA   $DC
         LDX   #$0000
         TAY
         BPL   L070EF1
         DEX
L070EF1  STX   $E4
         ASL
         ROL   $E4
         ASL
         ROL   $E4
         LDX   $E4
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E0
         STX   $E2
         LDA   [$E0]
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         AND   #$007F
         PHA
         _NoteOff
         BCS   L070F25
         LDA   #$0000
L070F25  STAL  L0B0002
L070F29  PHX
         PHA
         _TickCount
         BCS   L070F37
         LDA   #$0000
L070F37  STAL  L0B0002
         PLA
         PLX
         STX   $D4
         STA   $D2
L070F41  LDA   $EF
         LDX   #$0000
         PHX
         PHA
         PHX
         PHA
         _TickCount
         BCS   L070F56
         LDA   #$0000
L070F56  STAL  L0B0002
         PLA
         PLX
         SEC
         SBC   $D2
         PHA
         TXA
         SBC   $D4
         TAX
         PLA
         JSL   L010B98
         BEQ   L070F6F
         BCC   L070F6F
         BRA   L070F41
L070F6F  PHA
         PEA   $046E
         PEA   ^L0C1A7A
         PEA   L0C1A7A
         _EventAvail
         BCS   L070F85
         LDA   #$0000
L070F85  STAL  L0B0002
         PLA
         TAY
         BNE   L070F90
         BRL   L0710D8
L070F90  LDA   $F3
         SEC
         SBC   #$0005
         BEQ   L070FA2
         BVS   L070F9D
         EOR   #$8000
L070F9D  BPL   L070FA2
         BRL   L0710D8
L070FA2  STZ   L0B00CB
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
         LDA   $F1
         CMP   #$001B
         BNE   L070FEA
         LDA   L0B00B2
         AND   #$00FF
         CMP   #$001B
         BNE   L070FEA
         LDA   $F3
         CMP   #$0003
         BEQ   L070FF4
L070FEA  PEA   $0004
         JSL   L060851
         PLY
         BRA   L07100F
L070FF4  PHA
         PEA   $046E
         PEA   ^L0C1A7A
         PEA   L0C1A7A
         _GetNextEvent
         BCS   L07100A
         LDA   #$0000
L07100A  STAL  L0B0002
         PLA
L07100F  LDA   $F3
         BRL   L071088
L071014  LDAL  L0C1A7A
         CMP   #$0003
         BNE   L071033
         LDA   $F1
         LDX   #$0000
         PHX
         PHA
         LDAL  L0C1A7E
         TAX
         LDAL  L0C1A7C
         JSL   L010B98
         BEQ   L071038
L071033  LDA   #$0000
         BRA   L07103B
L071038  LDA   #$0001
L07103B  STA   $D8
         BRL   L071096
L071040  LDAL  L0C1A7A
         CMP   #$0002
         BEQ   L07104E
         LDA   #$0000
         BRA   L071051
L07104E  LDA   #$0001
L071051  STA   $D8
         BRL   L071096
L071056  LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L071066
         BVS   L071064
         EOR   #$8000
L071064  BMI   L07106B
L071066  LDA   #$0000
         BRA   L07106E
L07106B  LDA   #$0001
L07106E  STA   $D8
         BRL   L071096
L071073  LDA   #$0001
         STA   $D8
         BRL   L071096
L07107B  BRL   L071096
L07107E  DA    L071056
         DA    L071040
         DA    L071014
         DA    L071073
         DA    L07107B
L071088  DEC
         CMP   #$0004
         BCC   L071091
         LDA   #$0004
L071091  ASL
         TAX
         JMP   (L07107E,X)

L071096  LDA   $D8
         BNE   L0710AA
         LDA   L0B0078
         CMP   #$0001
         BEQ   L0710AA
         LDA   L0B0078
         CMP   #$0002
         BNE   L0710B3
L0710AA  LDA   #$0001
         STA   $DE
         BRA   L0710F9
         BRA   L0710D6
L0710B3  PEI   $F3
         JSL   L06145F
         PLY
         JSL   L0311DD
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L0710D1
         LDA   #$0000
L0710D1  STAL  L0B0002
         PLA
L0710D6  BRA   L0710E4
L0710D8  JSL   L0612DE
         TAY
         BEQ   L0710E4
         LDA   #$0001
         STA   $DE
L0710E4  INC   $DC
L0710E6  LDA   $EB
         SEC
         SBC   #$0001
         SEC
         SBC   $DC
         BVS   L0710F4
         EOR   #$8000
L0710F4  BPL   L0710F9
         BRL   L070697
L0710F9  LDA   $DE
         BNE   L071104
         LDA   $F1
         BEQ   L071104
         BRL   L070692
L071104  JSL   L0503D4
         TAY
         BNE   L07112B
         _AllNotesOff
         BCS   L071117
         LDA   #$0000
L071117  STAL  L0B0002
         _StopInts
         BCS   L071127
         LDA   #$0000
L071127  STAL  L0B0002
L07112B  STZ   L0B00AE
         TSC
         CLC
         ADC   #$003E
         TCS
         PLD
         RTL

L071136  ENT
         PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$008A
         TCS
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E2
         STX   $DC
         STA   $DA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00BE
         STX   $C4
         STA   $C2
         LDX   $F7
         LDA   $F5
         STX   $A8
         STA   $A6
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDA   [$EA]
         AND   #$00FF
         AND   #$0080
         CMP   #$0000
         BEQ   L071181
         LDA   #$0004
         STA   $D2
         BRA   L071186
L071181  LDA   #$0002
         STA   $D2
L071186  LDA   $D2
         PHA
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         SEC
         JSL   L01092D
         PLY
         CLC
         ADC   #$0001
         STAL  L0C0C38
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDY   #$0001
         LDA   [$EA],Y
         AND   #$00FF
         CLC
         ADC   #$0001
         PHA
         LDAL  L0C0C38
         CLC
         JSL   L010AAE
         PLA
         STA   $CC
         LDX   L0B0048
         LDA   L0B0046
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         PEA   ^L0C0C32
         PEA   L0C0C32
         PEA   ^L0B002A
         PEA   L0B002A
         JSL   L030D54
         PLY
         PLY
         PLY
         PLY
         _CompactMem
         BCS   L071209
         LDA   #$0000
L071209  STAL  L0B0002
         PEI   $CC
         PEA   ^L0C0C32
         PEA   L0C0C32
         PEA   ^L0B002A
         PEA   L0B002A
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L071236
         LDA   #$0000
L071236  STAL  L0B0002
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDY   #$0001
         LDA   [$EA],Y
         AND   #$00FF
         CLC
         ADC   #$0024
         LDX   #$0000
         TAY
         BPL   L071259
         DEX
L071259  STX   $B8
         STA   $B6
         STZ   $E6
         STZ   $E0
         BRA   L07129D
L071263  LDA   $E0
         LDX   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDX   $EC
         LDA   #$0024
         CLC
         ADC   $EA
         BCC   L071281
         INX
L071281  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         AND   #$00FF
         PHA
         LDA   $E6
         PLX
         STX   $EE
         CLC
         ADC   $EE
         STA   $E6
         INC   $E0
L07129D  LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDY   #$0001
         LDA   [$EA],Y
         AND   #$00FF
         SEC
         SBC   $E0
         BEQ   L0712BD
         BVS   L0712BB
         EOR   #$8000
L0712BB  BMI   L071263
L0712BD  LDA   $CC
         CLC
         ADC   #$00C8
         STA   [$DA]
         LDAL  L0C0C36
         TAX
         LDAL  L0C0C34
         LDY   #$0002
         PHA
         TXA
         STA   [$C2],Y
         PLA
         STA   [$C2]
         PEI   $F7
         PEI   $F5
         _HLock
         BCS   L0712E8
         LDA   #$0000
L0712E8  STAL  L0B0002
         PHA
         LDY   #$0002
         LDA   [$F5],Y
         TAX
         LDA   [$F5]
         CLC
         ADC   $B6
         PHA
         TXA
         ADC   $B8
         TAX
         PLA
         PHX
         PHA
         PEI   $E6
         PEI   $C4
         PEI   $C2
         PEI   $DC
         PEI   $DA
         _UnPackBytes
         BCS   L071316
         LDA   #$0000
L071316  STAL  L0B0002
         PLA
         STA   $E4
         PEI   $F7
         PEI   $F5
         _HUnlock
         BCS   L07132D
         LDA   #$0000
L07132D  STAL  L0B0002
         LDA   $FB
         BNE   L071338
         BRL   L07157B
L071338  PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         PEI   $FF
         PEI   $FD
         JSL   L071583
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         PHX
         PHA
         PEA   ^L0C0E30
         PEA   L0C0E30
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $D2
         PHA
         LDA   $D0
         LDX   #$0000
         TAY
         BPL   L071376
         DEX
L071376  STX   $EE
         ASL
         ROL   $EE
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
         LDA   $D0
         LDX   #$0000
         TAY
         BPL   L0713A2
         DEX
L0713A2  STX   $EE
         ASL
         ROL   $EE
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
         LDY   #$0006
         LDA   [$EA],Y
         PLX
         STX   $EE
         SEC
         SBC   $EE
         SEC
         JSL   L01092D
         PLY
         CLC
         ADC   #$0002
         STA   $CE
         LDA   $CE
         STAL  L0C0E36
         LDA   $CE
         CLC
         ADC   #$0001
         PHA
         LDA   $D0
         LDX   #$0000
         TAY
         BPL   L0713EC
         DEX
L0713EC  STX   $EE
         ASL
         ROL   $EE
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
         LDA   [$EA]
         PHA
         LDA   $D0
         LDX   #$0000
         TAY
         BPL   L071415
         DEX
L071415  STX   $EE
         ASL
         ROL   $EE
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
         LDY   #$0004
         LDA   [$EA],Y
         PLX
         STX   $EE
         SEC
         SBC   $EE
         SEC
         JSL   L010AAE
         PLA
         STA   $CA
         LDA   #L0C0C32
         LDX   #^L0C0C32
         PHX
         PHA
         PEA   ^L0C0D86
         PEA   L0C0D86
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEI   $CA
         PEA   ^L0C0E30
         PEA   L0C0E30
         PEA   ^L0B0046
         PEA   L0B0046
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $CC
         PEA   ^L0C0D86
         PEA   L0C0D86
         PEA   ^L0B0042
         PEA   L0B0042
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $FB
         CMP   #$0001
         BEQ   L071497
         BRL   L071565
L071497  LDA   #$0000
         STA   $8E
         LDA   #$0000
         STA   $8C
         PEA   $0000
         TDC
         CLC
         ADC   #$00AA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $D2
         PHA
         LDA   #$0004
         SEC
         JSL   L01092D
         PLY
         PHA
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         SEC
         SBC   #$0001
         SEC
         JSL   L010AAE
         LDY   #$0002
         LDA   [$A6],Y
         TAX
         LDA   [$A6]
         STA   $EA
         STX   $EC
         LDY   #$0001
         LDA   [$EA],Y
         AND   #$00FF
         SEC
         SBC   #$0001
         PHA
         _SetRect
         BCS   L0714FC
         LDA   #$0000
L0714FC  STAL  L0B0002
         LDX   #$0000
         TDC
         CLC
         ADC   #$008C
         STX   $9E
         STA   $9C
         LDA   #$0000
         STA   $A0
         LDAL  L0C0CF6
         TAX
         LDAL  L0C0CF4
         STX   $A4
         STA   $A2
         LDA   #L0C0C32
         LDX   #^L0C0C32
         STX   $92
         STA   $90
         LDA   #L0C0D86
         LDX   #^L0C0D86
         STX   $96
         STA   $94
         LDX   #$0000
         TDC
         CLC
         ADC   #$00AA
         STX   $9A
         STA   $98
         PEA   $0000
         TDC
         CLC
         ADC   #$0090
         PHA
         _PaintPixels
         BCS   L071553
         LDA   #$0000
L071553  STAL  L0B0002
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L071684
         PLY
         PLY
L071565  PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L071577
         LDA   #$0000
L071577  STAL  L0B0002
L07157B  TSC
         CLC
         ADC   #$0064
         TCS
         PLD
         RTL

L071583  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E6
         TCS
         LDA   #$0000
         STA   [$FB]
         LDA   #$0001
         STA   $EA
         BRL   L071647
L07159B  LDA   $EA
         LDX   #$0000
         TAY
         BPL   L0715A4
         DEX
L0715A4  STX   $F0
         ASL
         ROL   $F0
         ASL
         ROL   $F0
         ASL
         ROL   $F0
         LDX   $F0
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
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
         JSL   L07165E
         PLY
         PLY
         PLY
         PLY
         PHA
         LDA   [$FB]
         LDX   #$0000
         TAY
         BPL   L0715F1
         DEX
L0715F1  STX   $F0
         ASL
         ROL   $F0
         ASL
         ROL   $F0
         ASL
         ROL   $F0
         LDX   $F0
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
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
         JSL   L07165E
         PLY
         PLY
         PLY
         PLY
         PLX
         STX   $EC
         SEC
         SBC   $EC
         BVS   L07163F
         EOR   #$8000
L07163F  BMI   L071645
         LDA   $EA
         STA   [$FB]
L071645  INC   $EA
L071647  LDA   $EA
         SEC
         SBC   $FF
         BVS   L071651
         EOR   #$8000
L071651  BMI   L071656
         BRL   L07159B
L071656  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L07165E  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDA   $FD
         SEC
         SBC   $F9
         PHA
         LDA   $FF
         SEC
         SBC   $FB
         SEC
         JSL   L010AAE
         PLA
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L071684  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E8
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L0401D9
         PLY
         PLY
         TAY
         BNE   L07169F
         BRL   L07180A
L07169F  PEI   $FF
         PEI   $FD
         _HLock
         BCS   L0716AF
         LDA   #$0000
L0716AF  STAL  L0B0002
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STX   $EC
         STA   $EA
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         _GetHandleSize
         BCS   L0716D1
         LDA   #$0000
L0716D1  STAL  L0B0002
         PLA
         PLX
         STA   $F0
         STZ   $EE
         BRL   L0717FB
L0716DE  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L0716E7
         DEX
L0716E7  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         BNE   L071701
         BRL   L0717F9
L071701  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L07170A
         DEX
L07170A  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         SEC
         SBC   #$0010
         BVS   L071728
         EOR   #$8000
L071728  BMI   L07176F
         LDA   $EE
         LDX   #$0000
         TAY
         BPL   L071733
         DEX
L071733  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         ORA   #$000F
         PHA
         LDA   $EE
         LDX   #$0000
         TAY
         BPL   L071755
         DEX
L071755  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         BRL   L0717F9
L07176F  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L071778
         DEX
L071778  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         AND   #$000F
         TAY
         BEQ   L0717B7
         LDA   $EE
         LDX   #$0000
         TAY
         BPL   L07179C
         DEX
L07179C  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$00FF
         SEP   #$20
         STA   [$F2]
         REP   #$20
         BRA   L0717F9
L0717B7  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L0717C0
         DEX
L0717C0  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         ORA   #$00F0
         PHA
         LDA   $EE
         LDX   #$0000
         TAY
         BPL   L0717E2
         DEX
L0717E2  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
L0717F9  INC   $EE
L0717FB  LDA   $EE
         SEC
         SBC   $F0
         BVS   L071805
         EOR   #$8000
L071805  BMI   L07180A
         BRL   L0716DE
L07180A  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L071812  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         JSL   L03117F
         PEA   $0080
         PEA   $000C
         PEA   $0000
         JSL   L0321FD
         PLY
         PLY
         PLY
         _DrawMenuBar
         BCS   L07183D
         LDA   #$0000
L07183D  STAL  L0B0002
         _InitPalette
         BCS   L07184D
         LDA   #$0000
L07184D  STAL  L0B0002
         STZ   $F4
         BRA   L0718A5
L071855  STZ   $F2
         BRA   L071894
L071859  PEI   $F4
         PEI   $F2
         PEA   $0000
         _SetColorEntry
         BCS   L07186C
         LDA   #$0000
L07186C  STAL  L0B0002
         PEI   $F4
         LDA   $F2
         CLC
         ADC   #$0003
         PHA
         PEA   $0FFF
         _SetColorEntry
         BCS   L071888
         LDA   #$0000
L071888  STAL  L0B0002
         LDA   $F2
         CLC
         ADC   #$0004
         STA   $F2
L071894  LDA   $F2
         SEC
         SBC   #$000F
         BEQ   L071859
         BVS   L0718A1
         EOR   #$8000
L0718A1  BPL   L071859
         INC   $F4
L0718A5  LDA   $F4
         SEC
         SBC   #$0006
         BEQ   L071855
         BVS   L0718B2
         EOR   #$8000
L0718B2  BPL   L071855
         JSL   L0718C4
         JSL   L0311AA
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L0718C4  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #L0C0256
         LDX   #^L0C0256
         STX   L0B00DF
         STA   L0B00DD
         LDA   #L0C019E
         LDX   #^L0C019E
         STX   L0B00DB
         STA   L0B00D9
         JSL   L031208
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0718F3  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #L0C00E6
         LDX   #^L0C00E6
         STX   L0B00DF
         STA   L0B00DD
         LDA   #L0C002E
         LDX   #^L0C002E
         STX   L0B00DB
         STA   L0B00D9
         JSL   L031208
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

