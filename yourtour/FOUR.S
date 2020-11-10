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

	use	FOUR.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/NoteSeq.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Sound.Macs
	use	4/Util.Macs
	
*-------------------------------

L050000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00BC
         TCS
         STZ   $C4
         LDA   #$FFFF
         STA   $C2
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         JSL   L0503D4
         TAY
         BEQ   L050040
         PEA   $0000
         _StopSeq
         BCS   L050038
         LDA   #$0000
L050038  STAL  L0B0002
         JSL   L05039A
L050040  LDA   L0B0084
         BEQ   L050048
         BRL   L05016F
L050048  LDA   L0B0082
         STA   $C4
         PEA   $8100
         LDA   $C4
         CLC
         ADC   #$0004
         LDX   #$0000
         TAY
         BPL   L05005D
         DEX
L05005D  PHX
         PHA
         LDX   #$0000
         LDA   #$0004
         SEC
         JSL   L010AF3
         LDX   L0B0054
         LDA   L0B0052
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   L0B0054
         LDA   L0B0052
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STX   $CA
         STA   $C8
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$C8],Y
         PLA
         STA   [$C8]
         LDA   #$0001
         STA   $C6
         BRA   L0500F0
L0500A8  JSL   L040619
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L01020C
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L0500CF
         DEX
L0500CF  SEC
         JSL   L010CB2
         LDX   $CA
         LDA   $C8
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
         INC   $C6
L0500F0  LDA   $C6
         SEC
         SBC   $C4
         BEQ   L0500A8
         BVS   L0500FC
         EOR   #$8000
L0500FC  BPL   L0500A8
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $C4
         LDX   #$0000
         TAY
         BPL   L05010F
         DEX
L05010F  SEC
         JSL   L010CB2
         LDX   $CA
         LDA   $C8
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDX   #$0000
         LDA   #$0002
         LDY   #$0006
         PHA
         TXA
         STA   [$EE],Y
         PLA
         LDY   #$0004
         STA   [$EE],Y
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $C4
         LDX   #$0000
         TAY
         BPL   L050146
         DEX
L050146  SEC
         JSL   L010CB2
         LDX   $CA
         LDA   $C8
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDX   #$FFFF
         LDA   #$FFFF
         LDY   #$000A
         PHA
         TXA
         STA   [$EE],Y
         PLA
         LDY   #$0008
         STA   [$EE],Y
         BRL   L050259
L05016F  PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         PEA   ^L0C25B1
         PEA   L0C25B1
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C25B6
         PEA   L0C25B6
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         JSL   L0252AD
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $C2
         LDA   $C2
         SEC
         SBC   #$0000
         BVS   L0501D0
         EOR   #$8000
L0501D0  BMI   L0501D5
         BRL   L050259
L0501D5  LDA   $C2
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
         STX   $C0
         STA   $BE
         PHX
         PHA
         PEI   $C0
         PEI   $BE
         _GetHandleSize
         BCS   L050217
         LDA   #$0000
L050217  STAL  L0B0002
         PLA
         PLX
         STX   $CE
         STA   $CC
         PEA   $8100
         PEI   $CE
         PEI   $CC
         LDX   L0B0054
         LDA   L0B0052
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $C0
         PEI   $BE
         LDX   L0B0054
         LDA   L0B0052
         PHX
         PHA
         PEI   $CE
         PEI   $CC
         _HandToHand
         BCS   L050255
         LDA   #$0000
L050255  STAL  L0B0002
L050259  LDA   $C2
         SEC
         SBC   #$0000
         BVS   L050264
         EOR   #$8000
L050264  BMI   L05026A
         LDA   $C4
         BEQ   L05029C
L05026A  LDX   L0B0054
         LDA   L0B0052
         PHX
         PHA
         _HLock
         BCS   L05027E
         LDA   #$0000
L05027E  STAL  L0B0002
         LDX   L0B0054
         LDA   L0B0052
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         PHX
         PHA
         JSL   L0502A4
         PLY
         PLY
L05029C  TSC
         CLC
         ADC   #$0036
         TCS
         PLD
         RTL

L0502A4  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         LDX   L0B0058
         LDA   L0B0056
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STX   $F0
         STA   $EE
         LDX   #$0000
         LDA   #$0001
         LDY   #$0002
         PHA
         TXA
         STA   [$EE],Y
         PLA
         STA   [$EE]
         LDX   $FF
         LDA   $FD
         LDY   #$0006
         PHA
         TXA
         STA   [$EE],Y
         PLA
         LDY   #$0004
         STA   [$EE],Y
         LDX   #$FFFF
         LDA   #$FFFF
         LDY   #$000A
         PHA
         TXA
         STA   [$EE],Y
         PLA
         LDY   #$0008
         STA   [$EE],Y
         STZ   L0B00E9
         LDA   #$0000
         STAL  L0C24F0
         LDA   #$0000
         STAL  L0C24EE
         LDA   #$0000
         STAL  L0C24F2
         LDX   L0B0058
         LDA   L0B0056
         PHX
         PHA
         _HLock
         BCS   L050325
         LDA   #$0000
L050325  STAL  L0B0002
         LDX   L0B0054
         LDA   L0B0052
         PHX
         PHA
         _HLock
         BCS   L05033D
         LDA   #$0000
L05033D  STAL  L0B0002
         LDAL  $333333
         PEA   ^L05037D
         PEA   L05037D
         PEA   ^L05039A
         PEA   L05039A
         LDX   L0B0058
         LDA   L0B0056
         PHX
         PHA
         _StartSeq
         BCS   L050365
         LDA   #$0000
L050365  STAL  L0B0002
         LDAL  $444444
         PEA   $6590
         JSL   L021DFD
         PLY
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L05037D  STA   L0B00E9
         PHA
         PHA
         PHA
         _GetLoc
         PLA
         STAL  L0C24F0
         PLA
         STAL  L0C24EE
         PLA
         STAL  L0C24F2
         RTL

L05039A  LDA   L0B0054
         PHA
         LDA   L0B0052
         PHA
         _HUnlock
         LDA   L0B0054
         PHA
         LDA   L0B0052
         PHA
         _PurgeHandle
         LDA   L0B0058
         PHA
         LDA   L0B0056
         PHA
         _HUnlock
         LDA   L0B00AE
         BNE   L0503D3
         _StopInts
L0503D3  RTL

L0503D4  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0B00BF
         LDA   L0B00BD
         STA   $F6
         STX   $F8
         LDA   [$F6]
         CMP   #$0000
         BEQ   L0503F5
         LDA   #$0000
         BRA   L0503F8
L0503F5  LDA   #$0001
L0503F8  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L050402  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         LDA   #$FFFF
         STA   $F0
         STZ   $EE
         STZ   $EC
L050416  LDA   $EE
         SEC
         SBC   #$0010
         BVS   L050421
         EOR   #$8000
L050421  BMI   L050473
         LDA   $EC
         BNE   L050473
         PEI   $FF
         PEI   $FD
         LDA   $EE
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0002
         BCC   L050457
         INX
L050457  PHX
         PHA
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L05046F
         LDA   #$0001
         STA   $EC
         LDA   $EE
         STA   $F0
         BRA   L050471
L05046F  INC   $EE
L050471  BRA   L050416
L050473  LDA   $F0
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PLD
         RTL

L05047F  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00A2
         TCS
         STZ   $DE
         LDA   #$0008
         STA   $DC
         LDA   #$0001
         STA   $DA
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         JSL   L0242F7
         PLY
         PLY
         PEA   ^L0C25BC
         PEA   L0C25BC
         PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         JSL   L0252AD
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         PEA   ^L0C25C2
         PEA   L0C25C2
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L050402
         PLY
         PLY
         STA   $F0
         SEC
         SBC   #$0000
         BVS   L0504FD
         EOR   #$8000
L0504FD  BPL   L050502
         BRL   L0509E2
L050502  PEA   $0000
         TDC
         CLC
         ADC   #$00A4
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $E8
         LDA   $E8
         SEC
         SBC   #$0000
         BVS   L05051E
         EOR   #$8000
L05051E  BMI   L050523
         BRL   L0509E2
L050523  LDA   $E8
         SEC
         SBC   #$0032
         BVS   L05052E
         EOR   #$8000
L05052E  BPL   L050533
         BRL   L0509E2
L050533  PHX
         PHA
         LDA   $E8
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
         BCS   L05056F
         LDA   #$0000
L05056F  STAL  L0B0002
         PLA
         PLX
         STX   $D8
         STA   $D6
         LDA   #$0000
         SEP   #$20
         STA   $AE
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$00AA
         PHA
         PEA   ^L0C25C7
         PEA   L0C25C7
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0505A1
         LDA   #$0000
         BRA   L0505A4
L0505A1  LDA   #$0001
L0505A4  STA   $E0
         SEC
         LDA   $D6
         SBC   #$1000
         BNE   L0505B5
         LDA   $D8
         SBC   #$0000
         BRA   L0505BC
L0505B5  LDA   $D8
         SBC   #$0000
         REP   #$02
L0505BC  BEQ   L0505D3
         BVS   L0505C3
         EOR   #$8000
L0505C3  BPL   L0505D3
         LDA   $E0
         BNE   L0505D3
         LDA   #$0001
         STA   $DE
         LDA   #$0004
         STA   $DC
L0505D3  SEC
         LDA   $D6
         SBC   #$2000
         BNE   L0505E2
         LDA   $D8
         SBC   #$0000
         BRA   L0505E9
L0505E2  LDA   $D8
         SBC   #$0000
         REP   #$02
L0505E9  BEQ   L0505F2
         BVS   L0505F0
         EOR   #$8000
L0505F0  BMI   L0505F6
L0505F2  LDA   $E0
         BEQ   L0505FB
L0505F6  LDA   #$0002
         STA   $DA
L0505FB  LDA   $DE
         CMP   #$0000
         BEQ   L050605
         BRL   L0506D6
L050605  LDA   $E0
         BEQ   L05062D
         LDA   #$0002
         PHA
         LDA   L0B00E3
         SEC
         JSL   L01092D
         PLA
         TAY
         BEQ   L05062D
         LDA   #$0008
         PHA
         LDA   L0B00E3
         INC
         STA   L0B00E3
         SEC
         JSL   L01092D
         PLA
         STA   L0B00E3
L05062D  LDA   L0B00E3
         STA   $EA
         LDA   $E0
         BNE   L050639
         BRL   L0506BF
L050639  PEA   ^L0C25CC
         PEA   L0C25CC
         LDA   L0B00E3
         INC
         STA   L0B00E3
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0002
         BCC   L050670
         INX
L050670  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   L0B00E3
         ASL
         ASL
         ASL
         ASL
         PHA
         LDA   L0B00E3
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDA   #$0008
         PHA
         LDA   L0B00E3
         INC
         STA   L0B00E3
         SEC
         JSL   L01092D
         PLA
         STA   L0B00E3
L0506BF  LDA   #$0008
         PHA
         LDA   L0B00E3
         INC
         STA   L0B00E3
         SEC
         JSL   L01092D
         PLA
         STA   L0B00E3
         BRL   L0507A9
L0506D6  LDA   $DA
         CMP   #$0002
         BNE   L050701
         LDA   #$0002
         PHA
         LDA   L0B00E1
         SEC
         JSL   L01092D
         PLA
         TAY
         BEQ   L050701
         LDA   #$0004
         PHA
         LDA   L0B00E1
         INC
         STA   L0B00E1
         SEC
         JSL   L01092D
         PLA
         STA   L0B00E1
L050701  LDA   L0B00E1
         ASL
         PHA
         LDA   #$0008
         PLX
         STX   $F6
         CLC
         ADC   $F6
         STA   $EA
         LDA   $DA
         CMP   #$0002
         BEQ   L05071B
         BRL   L050795
L05071B  PEA   ^L0C25D4
         PEA   L0C25D4
         LDA   $EA
         CLC
         ADC   #$0002
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0002
         BCC   L050751
         INX
L050751  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $EA
         CLC
         ADC   #$0002
         ASL
         ASL
         ASL
         ASL
         PHA
         LDA   $EA
         CLC
         ADC   #$0002
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         INC   L0B00E1
L050795  LDA   #$0004
         PHA
         LDA   L0B00E1
         INC
         STA   L0B00E1
         SEC
         JSL   L01092D
         PLA
         STA   L0B00E1
L0507A9  PEA   ^L0C25DC
         PEA   L0C25DC
         LDA   $EA
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0002
         BCC   L0507DB
         INX
L0507DB  PHX
         PHA
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L050827
         PEA   ^L0C25E4
         PEA   L0C25E4
         LDA   $EA
         SEC
         SBC   $DA
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0002
         BCC   L05081D
         INX
L05081D  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L050827  PEI   $FF
         PEI   $FD
         LDA   $EA
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0002
         BCC   L050857
         INX
L050857  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $EA
         ASL
         ASL
         ASL
         ASL
         PHA
         LDA   $EA
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         PHP
         SEI
         LDA   $E8
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
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         LDA   $EA
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         PHA
         LDA   #$0100
         CLC
         JSL   L010AAE
         LDX   $D8
         LDA   $D6
         PHA
         _WriteRamBlock
         BCS   L05090C
         LDA   #$0000
L05090C  STAL  L0B0002
         PEA   $0308
         JSL   L021DFD
         PLY
         PHA
         PEA   $0000
         _GetSoundVolume
         BCS   L050928
         LDA   #$0000
L050928  STAL  L0B0002
         PLA
         PEA   $0309
         JSL   L021DFD
         PLY
         PLP
         LDX   #$0000
         LDA   #$0100
         PHX
         PHA
         LDX   $D8
         LDA   $D6
         SEC
         JSL   L0109B2
         PLY
         PLY
         STA   $E6
         LDA   #$0002
         PHA
         LDA   $E6
         SEC
         JSL   L01092D
         PLA
         TAY
         BEQ   L05096B
         LDA   $E6
         SEC
         SBC   #$0001
         BEQ   L05096B
         BVS   L050967
         EOR   #$8000
L050967  BPL   L05096B
         INC   $E6
L05096B  LDA   $E6
         STA   $EC
         STZ   $E4
L050971  LDA   $EC
         SEC
         SBC   #$0001
         BEQ   L050992
         BVS   L05097E
         EOR   #$8000
L05097E  BPL   L050992
         LDA   #$0002
         PHA
         LDA   $EC
         SEC
         JSL   L01092D
         PLY
         STA   $EC
         INC   $E4
         BRA   L050971
L050992  LDA   $E4
         PHA
         LDA   #$0001
         SEC
         JSL   L010CA2
         PLA
         SEC
         SBC   $E6
         BVS   L0509A6
         EOR   #$8000
L0509A6  BMI   L0509AA
         INC   $E4
L0509AA  LDA   $E4
         ASL
         ASL
         ASL
         CLC
         ADC   $E4
         PHA
         LDA   $EA
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         LDY   #$0001
         STA   [$F2],Y
         REP   #$20
         LDA   $EA
         STA   $F0
L0509E2  LDA   $F0
         TAY
         TSC
         CLC
         ADC   #$0054
         TCS
         TYA
         PLD
         RTL

L0509EE  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$004E
         TCS
         STZ   $EC
         STZ   $E6
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
         STA   $EA
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
         PEA   $0000
         TDC
         CLC
         ADC   #$0050
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
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
         PEA   $0000
         TDC
         CLC
         ADC   #$00B4
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
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
         PEA   $0000
         TDC
         CLC
         ADC   #$0082
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$0082
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00B4
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0050
         PHA
         PEI   $EA
         JSL   L050AB8
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         TSC
         CLC
         ADC   #$00A4
         TCS
         PLD
         RTL

L050AB8  PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$00AA
         TCS
         STZ   $E6
         STZ   $E0
         PEI   $F7
         PEI   $F5
         PEA   $0000
         TDC
         CLC
         ADC   #$00AC
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00AC
         PHA
         PEA   ^L0C25E5
         PEA   L0C25E5
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C25EA
         PEA   L0C25EA
         PEA   $0000
         TDC
         CLC
         ADC   #$00AC
         PHA
         JSL   L0252AD
         PLY
         PLY
         PLY
         PLY
L050B0A  LDA   $E6
         SEC
         SBC   #$0008
         BVS   L050B15
         EOR   #$8000
L050B15  BMI   L050B50
         LDA   $E0
         BNE   L050B50
         PEI   $F7
         PEI   $F5
         LDA   $E6
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2416
         LDX   #^L0C2416
         JSL   L010922
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L050B4C
         LDA   #$0001
         STA   $E0
         BRA   L050B4E
L050B4C  INC   $E6
L050B4E  BRA   L050B0A
L050B50  LDA   $E0
         BEQ   L050BAF
         LDA   $E6
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   $E8
         LDX   $EA
         PHX
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         PEI   $EA
         PEI   $E8
         PEA   $0040
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         BRL   L050C6D
L050BAF  PEA   $0000
         TDC
         CLC
         ADC   #$00AC
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $E2
         LDA   $E2
         SEC
         SBC   #$0000
         BVS   L050BCB
         EOR   #$8000
L050BCB  BMI   L050BD0
         BRL   L050C6D
L050BD0  LDA   $E2
         SEC
         SBC   #$0032
         BVS   L050BDB
         EOR   #$8000
L050BDB  BPL   L050BE0
         BRL   L050C6D
L050BE0  LDA   $E2
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
         STA   $E8
         STX   $EA
         LDY   #$0004
         LDA   [$E8],Y
         TAX
         LDY   #$0002
         LDA   [$E8],Y
         PHX
         PHA
         LDA   $F3
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
         PEA   $0000
         PEA   $002C
         _HandToPtr
         BCS   L050C3B
         LDA   #$0000
L050C3B  STAL  L0B0002
         PEA   $0308
         JSL   L021DFD
         PLY
         LDA   $E2
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
         STA   $E8
         STX   $EA
         LDA   #$0032
         STA   [$E8]
L050C6D  PEI   $FB
         PEI   $F9
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   $E8
         LDX   $EA
         CLC
         ADC   #$002C
         BCC   L050C9D
         INX
L050C9D  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C25F0
         PEA   L0C25F0
         PEI   $FF
         PEI   $FD
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L050CCC
         PEI   $FB
         PEI   $F9
         PEI   $FF
         PEI   $FD
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L050CCC  PEI   $FF
         PEI   $FD
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   $E8
         LDX   $EA
         CLC
         ADC   #$0036
         BCC   L050CFC
         INX
L050CFC  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $E0
         BNE   L050D1A
         LDA   $E2
         SEC
         SBC   #$0000
         BVS   L050D15
         EOR   #$8000
L050D15  BMI   L050D1A
         BRL   L050FAB
L050D1A  PEI   $F7
         PEI   $F5
         LDA   $F3
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2416
         LDX   #^L0C2416
         JSL   L010922
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0021
         LDA   [$E8],Y
         AND   #$00FF
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0027
         LDA   [$E8],Y
         AND   #$00FF
         PLX
         STX   $EC
         SEC
         SBC   $EC
         STA   $DE
         PEI   $FB
         PEI   $F9
         JSL   L05047F
         PLY
         PLY
         STA   $E6
         LDA   $E6
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         PLA
         SEP   #$20
         LDY   #$0021
         STA   [$E8],Y
         REP   #$20
         LDA   $E6
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0001
         LDA   [$E8],Y
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         PLA
         SEP   #$20
         LDY   #$0022
         STA   [$E8],Y
         REP   #$20
         STZ   $E4
L050E4B  LDA   $E4
         LDX   #$0000
         TAY
         BPL   L050E54
         DEX
L050E54  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         AND   #$00FF
         CMP   #$002E
         BEQ   L050E7F
         LDA   $E4
         SEC
         SBC   #$0032
         BVS   L050E79
         EOR   #$8000
L050E79  BMI   L050E7F
         INC   $E4
         BRA   L050E4B
L050E7F  LDA   $E4
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L050E8C
         DEX
L050E8C  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         AND   #$00FF
         CMP   #$006C
         BNE   L050EFE
         LDA   $E6
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         AND   #$00FF
         CLC
         ADC   $DE
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         PLA
         SEP   #$20
         LDY   #$0027
         STA   [$E8],Y
         REP   #$20
         BRL   L050FAB
L050EFE  PEI   $FF
         PEI   $FD
         JSL   L05047F
         PLY
         PLY
         STA   $E6
         LDA   $E6
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDA   [$E8]
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         PLA
         SEP   #$20
         LDY   #$0027
         STA   [$E8],Y
         REP   #$20
         LDA   $E6
         PHA
         LDA   #$000C
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C2356
         LDX   #^L0C2356
         JSL   L010922
         PLA
         PLX
         STA   $E8
         STX   $EA
         LDY   #$0001
         LDA   [$E8],Y
         PHA
         LDA   $F3
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
         PLA
         PLX
         STA   $E8
         STX   $EA
         PLA
         SEP   #$20
         LDY   #$0028
         STA   [$E8],Y
         REP   #$20
L050FAB  TSC
         CLC
         ADC   #$0042
         TCS
         PLD
         RTL

L050FB3  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PHA
         PEA   $0247
         PEA   $0000
         _FlushEvents
         BCS   L050FD1
         LDA   #$0000
L050FD1  STAL  L0B0002
         PLA
L050FD6  JSL   L06063A
         JSL   L0503D4
         TAY
         BEQ   L051006
         JSL   L04169A
         TAY
         BNE   L051006
         PHA
         PEA   $046E
         PEA   ^L0C1A7A
         PEA   L0C1A7A
         _EventAvail
         BCS   L050FFE
         LDA   #$0000
L050FFE  STAL  L0B0002
         PLA
         TAY
         BEQ   L050FD6
L051006  PHA
         PEA   $0247
         PEA   $0000
         _FlushEvents
         BCS   L051019
         LDA   #$0000
L051019  STAL  L0B0002
         PLA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

