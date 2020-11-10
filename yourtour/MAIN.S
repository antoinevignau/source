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

	use	MAIN.E
	use	MAIN.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/SANE.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------

         PHA
         SEP   #$20
         LDA   #^L0B0004
         PHA
         PLB
         REP   #$20
         PLA
         STA   L0B0004
         STX   L0B0014
         STY   L0B0012
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         PHA
         _MMStartUp
         BCS   L01002B
         LDA   #$0000
L01002B  STAL  L0B0002
         PLA
         PHX
         PHA
         PEA   $0000
         PEA   $0100
         LDA   L0B0004
         PHA
         PEA   $C011
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L010051
         LDA   #$0000
L010051  STAL  L0B0002
         PLA
         PLX
         STX   L0B0018
         STA   L0B0016
         STX   $F6
         ORA   $F6
         BNE   L01007C
         PEA   ^L0C0000
         PEA   L0C0000
         _WriteCString
         BCS   L010075
         LDA   #$0000
L010075  STAL  L0B0002
         BRL   L01014A
L01007C  LDX   L0B0018
         LDA   L0B0016
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F4
         PEI   $F4
         _SANEStartUp
         LDX   L0B0014
         LDA   L0B0012
         PHX
         PHA
         JSL   L0103AF
         PLY
         PLY
         PEA   $0000
         JSL   L010E5F
         PLY
         LDA   #L0D0000
         LDX   #^L0D0000
         STX   $F2
         STA   $F0
         PEA   ^L0C0020
         PEA   L0C0020
         JSL   L010D6A
         PLY
         PLY
         TAY
         BNE   L0100E1
         LDX   L0B000A
         LDA   L0B0008
         PHX
         PHA
         LDA   L0B0006
         PHA
         JSL   L010154
         PLY
         PLY
         PLY
         PHA
         JSL   L011007
         PLY
L0100E1  LDA   L0B0004
         ORA   #$0F00
         PHA
         _DisposeAll
         BCS   L0100F4
         LDA   #$0000
L0100F4  STAL  L0B0002
         SEC
         LDA   L0B000E
         SBC   #$0000
         BNE   L010109
         LDA   L0B0010
         SBC   #$0000
         BRA   L010111
L010109  LDA   L0B0010
         SBC   #$0000
         REP   #$02
L010111  BEQ   L010121
         LDX   L0B0010
         LDA   L0B000E
         PHX
         PHA
         JSL   L010C36
         PLY
         PLY
L010121  LDX   L0B0010
         LDA   L0B000E
         PHA
         TXA
         STAL  L0C002A
         PLA
         STAL  L0C0028
         LDA   L0B0000
         STAL  L0C002C
         LDA   L0B000C
         PHA
         PEA   ^L0C0028
         PEA   L0C0028
         JSL   L010C1D
         PLY
         PLY
         PLY
L01014A  TAY
         TDC
         CLC
         ADC   #$00FB
         TCS
         TYA
         PLD
         RTL

L010154  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L0E0012
         JSL   L0E0020
         JSL   L01017B
         JSL   L01019A
         JSL   L0E002E
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L01017B  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L0E003C
         PEA   L0E003C
         JSL   L0402A6
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L01019A  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00BD
         TCS
         LDX   #$0000
         LDA   #$0001
         STX   $C1
         STA   $BF
         PEA   ^L0C1220
         PEA   L0C1220
         PEA   $0000
         TDC
         CLC
         ADC   #$00C3
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00C3
         PHA
         JSL   L040463
         PLY
         PLY
         _GrafOn
         BCS   L0101E1
         LDA   #$0000
L0101E1  STAL  L0B0002
L0101E5  LDA   L0B0088
         BNE   L010204
         JSL   L040619
         PEA   ^L0B0068
         PEA   L0B0068
         PEA   ^L0C1124
         PEA   L0C1124
         JSL   L023C7E
         PLY
         PLY
         PLY
         PLY
         BRA   L0101E5
L010204  TSC
         CLC
         ADC   #$003D
         TCS
         PLD
         RTL

L01020C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00DE
         TCS
         STZ   $EA
         STZ   $EC
         STZ   $E8
         STZ   $E6
         STZ   $E4
         STZ   $E2
         STZ   $E0
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
         STA   $E8
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L010243
         DEX
L010243  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         BEQ   L0102C5
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
         STA   $E6
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
         STA   $E4
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
         STA   $E2
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
         STA   $E0
         PEI   $E0
         PEI   $E2
         PEI   $E4
         PEI   $E6
         PEI   $E8
         JSL   L0102D3
         PLY
         PLY
         PLY
         PLY
         PLY
         STX   $EC
         STA   $EA
L0102C5  LDX   $EC
         LDA   $EA
         TAY
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         PLD
         RTL

L0102D3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E6
         TCS
         LDA   $FD
         BEQ   L0102E7
         LDA   #$0000
         BRA   L0102EA
L0102E7  LDA   #$0001
L0102EA  AND   #$0001
         PHA
         PHA
         LDA   $EA
         AND   #$7FFF
         STA   $F0
         PLA
         XBA
         AND   #$FF00
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ORA   $F0
         STA   $EA
         PLA
         LDA   $F7
         AND   #$000F
         PHA
         PHA
         LDA   $EA
         AND   #$87FF
         STA   $F0
         PLA
         XBA
         AND   #$FF00
         ASL
         ASL
         ASL
         ORA   $F0
         STA   $EA
         PLA
         LDA   $F9
         AND   #$07FF
         PHA
         PHA
         LDA   $EA
         AND   #$F800
         STA   $F0
         PLA
         ORA   $F0
         STA   $EA
         PLA
         LDA   #$0001
         AND   #$0001
         PHA
         PHA
         LDA   $E8
         AND   #$7FFF
         STA   $F0
         PLA
         XBA
         AND   #$FF00
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ORA   $F0
         STA   $E8
         PLA
         LDA   $FB
         AND   #$007F
         PHA
         PHA
         LDA   $E8
         AND   #$80FF
         STA   $F0
         PLA
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ORA   $F0
         STA   $E8
         PLA
         LDA   $FD
         AND   #$0001
         PHA
         PHA
         LDA   $E8
         AND   #$FF7F
         STA   $F0
         PLA
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ORA   $F0
         STA   $E8
         PLA
         LDA   $FF
         AND   #$007F
         PHA
         PHA
         LDA   $E8
         AND   #$FF80
         STA   $F0
         PLA
         ORA   $F0
         STA   $E8
         PLA
         LDX   $EA
         LDA   $E8
         TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L0103AF  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00DF
         TCS
         STZ   $EF
         STZ   L0B0006
         LDA   $FD
         CMP   #$0000
         BNE   L0103D6
         LDA   $FF
         CMP   #$0000
         BNE   L0103D6
         LDA   #$0001
         STA   L0B011D
         BRL   L0107FA
L0103D6  LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0008
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $E9
         STA   $E7
         LDA   [$E7]
         SEP   #$20
         STA   $F1
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STA   [$E7]
         REP   #$20
         PEA   $0001
         PEA   ^L0C2D08
         PEA   L0C2D08
         PEI   $FF
         PEI   $FD
         JSL   L010804
         PLY
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L010424
         LDA   #$0001
         STA   L0B011D
         LDA   $F1
         SEP   #$20
         STA   [$E7]
         REP   #$20
         BRL   L0107FA
L010424  STZ   L0B011D
         LDA   $F1
         SEP   #$20
         STA   [$E7]
         REP   #$20
         PHX
         PHA
         PEA   $0000
         PEA   $0100
         LDA   L0B0004
         ORA   #$0F00
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L010453
         LDA   #$0000
L010453  STAL  L0B0002
         PLA
         PLX
         STX   $ED
         STA   $EB
         LDA   L0B0002
         BEQ   L01046A
         PEA   $FFFF
         JSL   L010B7A
         PLY
L01046A  LDA   #$0100
         STA   $E1
L01046F  LDA   [$E7]
         AND   #$00FF
         CMP   #$0000
         BNE   L01047C
         BRL   L0106DA
L01047C  INC   L0B0006
         LDA   [$E7]
         AND   #$00FF
         CMP   #$0022
         BEQ   L01048C
         BRL   L0105B3
L01048C  INC   $E7
         BNE   L010492
         INC   $E9
L010492  LDA   [$E7]
         AND   #$00FF
         CMP   #$0000
         BNE   L01049F
         BRL   L0105B0
L01049F  LDA   [$E7]
         AND   #$00FF
         CMP   #$0022
         BEQ   L0104AC
         BRL   L010538
L0104AC  INC   $E7
         BNE   L0104B2
         INC   $E9
L0104B2  LDA   [$E7]
         AND   #$00FF
         CMP   #$0022
         BNE   L010533
         LDA   $EF
         CMP   $E1
         BNE   L0104FA
         LDA   $E1
         CLC
         ADC   #$0100
         LDX   #$0000
         TAY
         BPL   L0104CF
         DEX
L0104CF  PHX
         PHA
         PEI   $ED
         PEI   $EB
         _SetHandleSize
         BCS   L0104E1
         LDA   #$0000
L0104E1  STAL  L0B0002
         LDA   L0B0002
         BEQ   L0104F2
         PEA   $FFFF
         JSL   L010B7A
         PLY
L0104F2  LDA   $E1
         CLC
         ADC   #$0100
         STA   $E1
L0104FA  LDX   $E9
         LDA   $E7
         INC   $E7
         BNE   L010504
         INC   $E9
L010504  STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDA   $EF
         INC   $EF
         LDX   #$0000
         TAY
         BPL   L010516
         DEX
L010516  PHX
         PHA
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         BRA   L010536
L010533  BRL   L0105B0
L010536  BRA   L0105AD
L010538  LDA   $EF
         CMP   $E1
         BNE   L010576
         LDA   $E1
         CLC
         ADC   #$0100
         LDX   #$0000
         TAY
         BPL   L01054B
         DEX
L01054B  PHX
         PHA
         PEI   $ED
         PEI   $EB
         _SetHandleSize
         BCS   L01055D
         LDA   #$0000
L01055D  STAL  L0B0002
         LDA   L0B0002
         BEQ   L01056E
         PEA   $FFFF
         JSL   L010B7A
         PLY
L01056E  LDA   $E1
         CLC
         ADC   #$0100
         STA   $E1
L010576  LDX   $E9
         LDA   $E7
         INC   $E7
         BNE   L010580
         INC   $E9
L010580  STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDA   $EF
         INC   $EF
         LDX   #$0000
         TAY
         BPL   L010592
         DEX
L010592  PHX
         PHA
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
L0105AD  BRL   L010492
L0105B0  BRL   L010655
L0105B3  LDA   [$E7]
         SEP   #$20
         STA   $F1
         REP   #$20
         AND   #$00FF
         CMP   #$0020
         BNE   L0105C6
         BRL   L010655
L0105C6  LDA   $F1
         AND   #$00FF
         CMP   #$0000
         BNE   L0105D3
         BRL   L010655
L0105D3  LDA   $F1
         AND   #$00FF
         CMP   #$0009
         BEQ   L010655
         LDA   $EF
         CMP   $E1
         BNE   L01061B
         LDA   $E1
         CLC
         ADC   #$0100
         LDX   #$0000
         TAY
         BPL   L0105F0
         DEX
L0105F0  PHX
         PHA
         PEI   $ED
         PEI   $EB
         _SetHandleSize
         BCS   L010602
         LDA   #$0000
L010602  STAL  L0B0002
         LDA   L0B0002
         BEQ   L010613
         PEA   $FFFF
         JSL   L010B7A
         PLY
L010613  LDA   $E1
         CLC
         ADC   #$0100
         STA   $E1
L01061B  LDX   $E9
         LDA   $E7
         INC   $E7
         BNE   L010625
         INC   $E9
L010625  STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDA   $EF
         INC   $EF
         LDX   #$0000
         TAY
         BPL   L010637
         DEX
L010637  PHX
         PHA
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         BRL   L0105B3
L010655  LDA   $EF
         CMP   $E1
         BNE   L010693
         LDA   $E1
         CLC
         ADC   #$0100
         LDX   #$0000
         TAY
         BPL   L010668
         DEX
L010668  PHX
         PHA
         PEI   $ED
         PEI   $EB
         _SetHandleSize
         BCS   L01067A
         LDA   #$0000
L01067A  STAL  L0B0002
         LDA   L0B0002
         BEQ   L01068B
         PEA   $FFFF
         JSL   L010B7A
         PLY
L01068B  LDA   $E1
         CLC
         ADC   #$0100
         STA   $E1
L010693  LDA   $EF
         INC   $EF
         LDX   #$0000
         TAY
         BPL   L01069E
         DEX
L01069E  PHX
         PHA
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         SEP   #$20
         STA   [$F2]
         REP   #$20
L0106BB  LDA   [$E7]
         AND   #$00FF
         CMP   #$0020
         BEQ   L0106CF
         LDA   [$E7]
         AND   #$00FF
         CMP   #$0009
         BNE   L0106D7
L0106CF  INC   $E7
         BNE   L0106D5
         INC   $E9
L0106D5  BRA   L0106BB
L0106D7  BRL   L01046F
L0106DA  LDA   $EF
         LDX   #$0000
         TAY
         BPL   L0106E3
         DEX
L0106E3  PHX
         PHA
         PEI   $ED
         PEI   $EB
         _SetHandleSize
         BCS   L0106F5
         LDA   #$0000
L0106F5  STAL  L0B0002
         PEI   $ED
         PEI   $EB
         _HLock
         BCS   L010709
         LDA   #$0000
L010709  STAL  L0B0002
         LDA   L0B0006
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L01071B
         DEX
L01071B  STX   $F6
         ASL
         ROL   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         JSL   L01114D
         PLY
         PLY
         STX   L0B000A
         STA   L0B0008
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         PHX
         PHA
         LDX   L0B000A
         LDA   L0B0008
         STA   $F2
         STX   $F4
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$F2],Y
         PLA
         STA   [$F2]
         LDA   #$0001
         STA   $EF
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STX   $E5
         STA   $E3
         BRA   L0107B7
L010766  LDA   [$E3]
         AND   #$00FF
         BNE   L0107B1
         LDX   $E5
         LDA   $E3
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   $EF
         INC   $EF
         LDX   #$0000
         TAY
         BPL   L010789
         DEX
L010789  STX   $F6
         ASL
         ROL   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   L0B000A
         LDA   L0B0008
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$F2],Y
         PLA
         STA   [$F2]
L0107B1  INC   $E3
         BNE   L0107B7
         INC   $E5
L0107B7  LDA   $EF
         SEC
         SBC   L0B0006
         BVS   L0107C2
         EOR   #$8000
L0107C2  BPL   L010766
         LDA   L0B0006
         LDX   #$0000
         TAY
         BPL   L0107CE
         DEX
L0107CE  STX   $F6
         ASL
         ROL   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   L0B000A
         LDA   L0B0008
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F2],Y
         PLA
         STA   [$F2]
L0107FA  TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L010804  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         BRL   L0108D5
L010812  LDA   [$F7]
         AND   #$00FF
         PHA
         LDA   [$FB]
         AND   #$00FF
         PLX
         STX   $EC
         CMP   $EC
         BNE   L01082A
         LDA   #$0001
         BRL   L0108AF
L01082A  LDA   $FF
         BEQ   L010833
         LDA   #$0000
         BRA   L0108AF
L010833  LDA   [$F7]
         AND   #$00FF
         SEC
         SBC   #$0061
         BVS   L010841
         EOR   #$8000
L010841  BPL   L010855
         LDA   [$F7]
         AND   #$00FF
         SEC
         SBC   #$007A
         BEQ   L01085C
         BVS   L010853
         EOR   #$8000
L010853  BPL   L01085C
L010855  LDA   [$F7]
         AND   #$00FF
         BRA   L010869
L01085C  LDA   [$F7]
         AND   #$00FF
         CLC
         ADC   #$0041
         SEC
         SBC   #$0061
L010869  PHA
         LDA   [$FB]
         AND   #$00FF
         SEC
         SBC   #$0061
         BVS   L010878
         EOR   #$8000
L010878  BPL   L01088C
         LDA   [$FB]
         AND   #$00FF
         SEC
         SBC   #$007A
         BEQ   L010893
         BVS   L01088A
         EOR   #$8000
L01088A  BPL   L010893
L01088C  LDA   [$FB]
         AND   #$00FF
         BRA   L0108A0
L010893  LDA   [$FB]
         AND   #$00FF
         CLC
         ADC   #$0041
         SEC
         SBC   #$0061
L0108A0  PLX
         STX   $EC
         CMP   $EC
         BEQ   L0108AC
         LDA   #$0000
         BRA   L0108AF
L0108AC  LDA   #$0001
L0108AF  TAY
         BNE   L0108B7
         LDA   #$0000
         BRA   L0108EC
L0108B7  LDX   $F9
         LDA   $F7
         INC   $F7
         BNE   L0108C1
         INC   $F9
L0108C1  STA   $EC
         STX   $EE
         LDX   $FD
         LDA   $FB
         INC   $FB
         BNE   L0108CF
         INC   $FD
L0108CF  STA   $EC
         STX   $EE
         LDA   [$EC]
L0108D5  LDA   [$F7]
         AND   #$00FF
         BEQ   L0108DF
         BRL   L010812
L0108DF  LDA   [$FB]
         AND   #$00FF
         BEQ   L0108E9
         BRL   L010812
L0108E9  LDA   #$0001
L0108EC  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L0108F6  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   $FF
         SEC
         SBC   #$0000
         BVS   L01090C
         EOR   #$8000
L01090C  BPL   L010912
         LDA   $FF
         BRA   L010918
L010912  LDA   $FF
         EOR   #$FFFF
         INC
L010918  TAY
         TDC
         CLC
         ADC   #$00F9
         TCS
         TYA
         PLD
         RTL

L010922  ENT
         CLC
         ADC   $04,S
         STA   $04,S
         TXA
         ADC   $06,S
         STA   $06,S
         RTL

L01092D  ENT
         PHD
         PHA
         PEA   $0001
         TSC
         TCD
         LDA   $0A
         BEQ   L0109A2
         LDX   #$0000
         BCC   L010958
         BIT   #$8000
         BEQ   L010949
         EOR   #$FFFF
         INC
         STA   $0A
         INX
L010949  LDA   $03
         BIT   #$8000
         BEQ   L010958
         EOR   #$FFFF
         INC
         STA   $03
         INX
         INX
L010958  LDY   #$0000
         BRA   L01095F
L01095D  ASL   $01
L01095F  ASL   $0A
         BCC   L01095D
         ROR   $0A
L010965  LDA   $03
         CMP   $0A
         BCC   L010976
         LDA   $03
         SEC
         SBC   $0A
         STA   $03
         TYA
         ORA   $01
         TAY
L010976  LSR   $0A
         LSR   $01
         BCC   L010965
         LDA   $03
         STA   $0A
         TYA
         CPX   #$0000
         BEQ   L01099E
         CPX   #$0003
         BEQ   L010994
         EOR   #$FFFF
         INC
         CPX   #$0001
         BEQ   L01099E
L010994  TAY
         LDA   $0A
         EOR   #$FFFF
         INC
         STA   $0A
         TYA
L01099E  PLY
         PLY
         PLD
         RTL

L0109A2  PEA   $0004
         PEA   $0000
         PEA   $0000
         _SysFailMgr
L0109B2  ENT
         PHD
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         TSC
         TCD
         LDA   $12
         ORA   $14
         BNE   L0109CF
         LDX   #$0000
         BRL   L010A93
L0109CF  LDX   #$0000
         BCC   L010A07
         LDA   $14
         BIT   #$8000
         BEQ   L0109ED
         EOR   #$FFFF
         STA   $14
         LDA   $12
         EOR   #$FFFF
         INC
         BNE   L0109EA
         INC   $14
L0109EA  STA   $12
         INX
L0109ED  LDA   $0B
         BIT   #$8000
         BEQ   L010A07
         EOR   #$FFFF
         STA   $0B
         LDA   $09
         EOR   #$FFFF
         INC
         BNE   L010A03
         INC   $0B
L010A03  STA   $09
         INX
         INX
L010A07  BRA   L010A0D
L010A09  ASL   $05
         ROL   $07
L010A0D  ASL   $12
         ROL   $14
         BCC   L010A09
         ROR   $14
         ROR   $12
L010A17  LDA   $0B
         CMP   $14
         BEQ   L010A21
         BCC   L010A40
         BRA   L010A27
L010A21  LDA   $09
         CMP   $12
         BCC   L010A40
L010A27  LDA   $09
         SEC
         SBC   $12
         STA   $09
         LDA   $0B
         SBC   $14
         STA   $0B
         LDA   $01
         ORA   $05
         STA   $01
         LDA   $03
         ORA   $07
         STA   $03
L010A40  LSR   $14
         ROR   $12
         LSR   $07
         ROR   $05
         BCC   L010A17
         CPX   #$0000
         BEQ   L010A7F
         CPX   #$0003
         BEQ   L010A6C
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L010A65
         INC
L010A65  STA   $03
         CPX   #$0001
         BEQ   L010A7F
L010A6C  LDA   $09
         EOR   #$FFFF
         STA   $09
         LDA   $0B
         EOR   #$FFFF
         INC   $09
         BNE   L010A7D
         INC
L010A7D  STA   $0B
L010A7F  LDA   $09
         STA   $12
         LDA   $0B
         STA   $14
         LDA   $01
         LDX   $03
         PLY
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L010A93  PEA   $0004
         PEA   $0000
         PEA   $0000
         _SysFailMgr
L010AA3  ENT
         SEC
         SBC   $04,S
         STA   $04,S
         TXA
         SBC   $06,S
         STA   $06,S
         RTL

L010AAE  ENT
         PHD
         PHA
         TSC
         TCD
         LDX   #$0000
         BCC   L010AD3
         LDA   $08
         BIT   #$8000
         BEQ   L010AC5
         EOR   #$FFFF
         INC
         STA   $08
         INX
L010AC5  LDA   $01
         BIT   #$8000
         BEQ   L010AD3
         EOR   #$FFFF
         INC
         STA   $01
         DEX
L010AD3  LDA   #$0000
         BRA   L010AE1
L010AD8  LSR   $01
         BCC   L010ADF
         CLC
         ADC   $08
L010ADF  ASL   $08
L010AE1  LDY   $01
         BNE   L010AD8
         CPX   #$0000
         BEQ   L010AEE
         EOR   #$FFFF
         INC
L010AEE  STA   $08
         PLY
         PLD
         RTL

L010AF3  ENT
         PHD
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         TSC
         TCD
         LDX   #$0000
         BCC   L010B35
         LDA   $10
         BIT   #$8000
         BEQ   L010B1C
         EOR   #$FFFF
         STA   $10
         LDA   $0E
         EOR   #$FFFF
         INC
         BNE   L010B19
         INC   $10
L010B19  STA   $0E
         INX
L010B1C  LDA   $07
         BIT   #$8000
         BEQ   L010B35
         EOR   #$FFFF
         STA   $07
         LDA   $05
         EOR   #$FFFF
         INC
         BNE   L010B32
         INC   $07
L010B32  STA   $05
         DEX
L010B35  BRA   L010B4E
L010B37  LSR   $07
         ROR   $05
         BCC   L010B4A
         LDA   $01
         CLC
         ADC   $0E
         STA   $01
         LDA   $03
         ADC   $10
         STA   $03
L010B4A  ASL   $0E
         ROL   $10
L010B4E  LDA   $05
         ORA   $07
         BNE   L010B37
         CPX   #$0000
         BEQ   L010B6C
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L010B6A
         INC
L010B6A  STA   $03
L010B6C  LDA   $01
         STA   $0E
         LDA   $03
         STA   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L010B7A  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   $FF
         AND   #$FFFF
         PHA
         JSL   L011007
         PLY
         TDC
         CLC
         ADC   #$00F9
         TCS
         PLD
         RTL

L010B98  ENT
         PHX
         PHA
         LDA   $08,S
         TAX
         LDA   $0A,S
         TAY
         LDA   $06,S
         STA   $0A,S
         LDA   $04,S
         STA   $08,S
         TXA
         SEC
         SBC   $01,S
         BNE   L010BB3
         TYA
         SBC   $03,S
         BRA   L010BB8
L010BB3  TYA
         SBC   $03,S
         REP   #$02
L010BB8  PHP
         LDA   $00,S
         STA   $08,S
         PLY
         PLY
         PLY
         PLY
         PLP
         RTL

L010BC3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E6
         TCS
         LDX   $FB
         LDA   $F9
         STX   $EA
         STA   $E8
L010BD6  LDA   $F7
         CMP   #$0001
         BEQ   L010C01
         BCC   L010C01
         LDA   [$FD]
         STA   [$F9]
         LDA   $F9
         CLC
         ADC   #$0002
         STA   $F9
         BCC   L010BEF
         INC   $FB
L010BEF  LDA   $FD
         CLC
         ADC   #$0002
         STA   $FD
         BCC   L010BFB
         INC   $FF
L010BFB  DEC   $F7
         DEC   $F7
         BRA   L010BD6
L010C01  LDA   $F7
         BEQ   L010C0D
         SEP   #$20
         LDA   [$FD]
         STA   [$F9]
         REP   #$20
L010C0D  LDX   $EA
         LDA   $E8
         STX   $FF
         STA   $FD
         TDC
         CLC
         ADC   #$00F1
         TCS
         PLD
         RTL

L010C1D  LDA   $04,S
         STAL  L010C31
         LDA   $06,S
         STAL  L010C31+2
         LDA   $08,S
         JSL   GSOS
         DW    $0029
L010C31  ADRL  $00000000
         RTL

L010C36  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E6
         TCS
         LDX   $FF
         LDA   $FD
         STX   $EA
         STA   $E8
         LDX   $FF
         LDA   $FD
         STX   $F2
         ORA   $F2
         BEQ   L010C94
L010C53  LDA   [$FD]
         AND   #$00FF
         STA   $EC
         LDA   $EE
         PHA
         LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L010C67
         INC   $FF
L010C67  STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDA   $EC
         STA   $EE
         LDA   $EC
         BNE   L010C53
         LDX   $EA
         LDA   $E8
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010AA3
         PLA
         PLX
         SEC
         SBC   #$0001
         SEP   #$20
         STA   [$E8]
         REP   #$20
L010C94  LDX   $EA
         LDA   $E8
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L010CA2  ENT
         TAY
         LDA   $04,S
         TAX
         BEQ   L010CAE
         TYA
L010CA9  ASL
         DEX
         BNE   L010CA9
         TAY
L010CAE  TYA
         STA   $04,S
         RTL

L010CB2  ENT
         PHD
         PHX
         PHA
         TSC
         TCD
         LDX   $0A
         LDA   $0C
         BEQ   L010CC0
         LDX   #$0021
L010CC0  TXY
         BEQ   L010CCD
         LDA   $01
L010CC5  ASL
         ROL   $03
         DEX
         BNE   L010CC5
         STA   $01
L010CCD  LDA   $01
         STA   $0A
         LDA   $03
         STA   $0C
         PLY
         PLY
         PLD
         RTL

L010CD9  ENT
         BCC   L010CED
         TAY
         LDA   $04,S
         TAX
         BEQ   L010CF9
         TYA
         BEQ   L010CFA
         BPL   L010CF4
L010CE6  SEC
         ROR
         DEX
         BNE   L010CE6
         BRA   L010CFA
L010CED  TAY
         LDA   $04,S
         TAX
         BEQ   L010CF9
         TYA
L010CF4  LSR
         DEX
         BNE   L010CF4
         TAY
L010CF9  TYA
L010CFA  STA   $04,S
         RTL

L010CFD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         LDX   $FB
         LDA   $F9
         STX   $EC
         STA   $EA
L010D10  LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L010D1A
         INC   $FB
L010D1A  STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         BEQ   L010D27
         BRA   L010D10
L010D27  LDA   $F9
         BNE   L010D2D
         DEC   $FB
L010D2D  DEC   $F9
L010D2F  LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L010D39
         INC   $FF
L010D39  STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L010D4A
         INC   $FB
L010D4A  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         AND   #$00FF
         BEQ   L010D5C
         BRA   L010D2F
L010D5C  LDX   $EC
         LDA   $EA
         TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L010D6A  PHD
         TSC
         TCD
         STA   [$06]
         LDA   $01,S
         LDY   #$0002
         STA   [$06],Y
         LDA   $02,S
         INY
         INY
         STA   [$06],Y
         LDA   $04,S
         INY
         INY
         STA   [$06],Y
         PLD
         LDA   #$0000
         RTL

L010D87  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $F0
         STA   $EE
L010DA5  LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L010DAF
         INC   $FF
L010DAF  STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$0000
         BEQ   L010DBF
         BRA   L010DA5
L010DBF  LDX   $F0
         LDA   $EE
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010AA3
         PLA
         PLX
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L010DD9  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDA   $F9
         CMP   $FD
         BNE   L010DF5
         LDA   $FB
         CMP   $FF
         BNE   L010DF5
         LDA   #$0000
         BRA   L010E55
L010DF5  LDA   [$F9]
         AND   #$00FF
         PHA
         LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L010E05
         INC   $FF
L010E05  STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         PLX
         STX   $EE
         CMP   $EE
         BNE   L010E34
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L010E1F
         INC   $FB
L010E1F  STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         CMP   #$0000
         BNE   L010E32
         LDA   #$0000
         BRA   L010E55
L010E32  BRA   L010DF5
L010E34  LDA   $FD
         BNE   L010E3A
         DEC   $FF
L010E3A  DEC   $FD
         LDX   $FF
         LDA   $FD
         STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         PHA
         LDA   [$F9]
         AND   #$00FF
         PLX
         STX   $F2
         SEC
         SBC   $F2
L010E55  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L010E5F  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$FFEA
         TCS
         LDA   #L011264
         LDX   #^L011264
         PHX
         PHA
         LDAL  L0C2CEA+2
         TAX
         LDAL  L0C2CEA
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
         LDA   L0B011D
         BNE   L010E93
         BRL   L010FE5
L010E93  LDX   #$0000
         TDC
         CLC
         ADC   #$FFEC
         PHA
         TXA
         STAL  L0C2D57
         PLA
         STAL  L0C2D55
         PEA   $0027
         PEA   ^L0C2D55
         PEA   L0C2D55
         JSL   L0110B9
         LDAL  L0C2D57
         TAX
         LDAL  L0C2D55
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         STA   $F0
         STA   $EE
L010EC9  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L010ED2
         DEX
L010ED2  PHX
         PHA
         LDAL  L0C2D57
         TAX
         LDAL  L0C2D55
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         CMP   #$002F
         BEQ   L010F04
         LDA   $F0
         SEC
         SBC   #$0000
         BEQ   L010F04
         BVS   L010EFE
         EOR   #$8000
L010EFE  BPL   L010F04
         DEC   $F0
         BRA   L010EC9
L010F04  LDA   $EE
         SEC
         SBC   $F0
         STA   $EC
         SEP   #$20
         STAL  L0C2D45
         REP   #$20
         BRA   L010F67
L010F15  LDA   $EE
         DEC   $EE
         LDX   #$0000
         TAY
         BPL   L010F20
         DEX
L010F20  PHX
         PHA
         LDAL  L0C2D57
         TAX
         LDAL  L0C2D55
         JSL   L010922
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   [$F4]
         PHA
         LDA   $EC
         LDX   #$0000
         TAY
         BPL   L010F41
         DEX
L010F41  PHX
         PHA
         LDA   #L0C2D46
         LDX   #^L0C2D46
         JSL   L010922
         PLA
         PLX
         SEC
         SBC   #$0001
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STA   $F4
         STX   $F6
         PLA
         SEP   #$20
         STA   [$F4]
         REP   #$20
         DEC   $EC
L010F67  LDA   $EC
         SEC
         SBC   #$0000
         BEQ   L010F76
         BVS   L010F74
         EOR   #$8000
L010F74  BMI   L010F15
L010F76  LDA   #L0C2D45
         LDX   #^L0C2D45
         PHX
         PHA
         LDAL  L0C2CDC+2
         TAX
         LDAL  L0C2CDC
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
         LDA   $FF
         BNE   L010FB8
         LDAL  L0C2CDC+2
         TAX
         LDAL  L0C2CDC
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         PHX
         PHA
         JSL   L011287
         PLY
         PLY
L010FB8  LDA   #$0001
         STA   L0B0006
         LDAL  L0C2CDC+2
         TAX
         LDAL  L0C2CDC
         STX   L0B000A
         STA   L0B0008
         PEA   $007F
         PEA   $0000
         _SetInGlobals
         BCS   L010FDF
         LDA   #$0000
L010FDF  STAL  L0B0002
         BRA   L010FFD
L010FE5  LDA   L0B0006
         STAL  L0C2CDA
         LDX   L0B000A
         LDA   L0B0008
         PHA
         TXA
         STAL  L0C2CDC+2
         PLA
         STAL  L0C2CDC
L010FFD  TAY
         TDC
         CLC
         ADC   #$00F9
         TCS
         TYA
         PLD
         RTL

L011007  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         LDAL  L0C2CEA+2
         TAX
         LDAL  L0C2CEA
         STA   $F4
         STX   $F6
         LDX   $F6
         LDA   #$0024
         CLC
         ADC   $F4
         BCC   L01102A
         INX
L01102A  STX   $F2
         STA   $F0
         BRA   L011069
L011030  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         JSL   L010B98
         BEQ   L01105D
         PEI   $FF
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         JSL   L011145
         PLY
L01105D  LDA   $F0
         SEC
         SBC   #$0004
         STA   $F0
         BCS   L011069
         DEC   $F2
L011069  SEC
         LDA   $F0
         SBCL  L0C2CEA
         BNE   L01107A
         LDA   $F2
         SBCL  L0C2CEA+2
         BRA   L011082
L01107A  LDA   $F2
         SBCL  L0C2CEA+2
         REP   #$02
L011082  BEQ   L01108B
         BVS   L011089
         EOR   #$8000
L011089  BMI   L011030
L01108B  LDA   $FF
         STA   L0B000C
         LDAL  L0C2CEA+2
         TAX
         LDAL  L0C2CEA
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         JSL   L011145
         TDC
         CLC
         ADC   #$00F9
         TCS
         PLD
         RTL

L0110B9  PHB
         PLA
         XBA
         STAL  L0110F4
         PLA
         STAL  L0110F4+1
         PLA
         STAL  L0110DA
         PLA
         STAL  L0110DA+2
         PLA
         STAL  L0110D8
         JSL   GSOS
L0110D8  DW    $0000
L0110DA  ADRL  $00000000
         BCS   L0110E3
         LDA   #$0000
L0110E3  STAL  L0B0002
         LDAL  L0110F4+1
         PHA
         PHB
         LDAL  L0110F4
         STA   $01,S
         RTL

L0110F4  ADR   $000000
L0110F7  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         LDX   $FB
         LDA   $F9
         STX   $EC
         STA   $EA
L01110A  LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L011114
         INC   $FF
L011114  STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L011125
         INC   $FB
L011125  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         AND   #$00FF
         BEQ   L011137
         BRA   L01110A
L011137  LDX   $EC
         LDA   $EA
         TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L011145  ENT
         SEP   #$10
         PHX
         REP   #$10
         DEC
         PHA
         RTL

L01114D  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         LDA   L0B0004
         ORA   #$0F00
         PHA
         PEA   $8300
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L01117A
         LDA   #$0000
L01117A  STAL  L0B0002
         PLA
         PLX
         STX   $F0
         STA   $EE
         STX   $F2
         ORA   $F2
         BEQ   L011194
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         BRA   L01119A
L011194  LDX   #$0000
         LDA   #$0000
L01119A  TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L0111A4  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E6
         TCS
         LDX   $F9
         LDA   $F7
         STX   $EA
         STA   $E8
L0111B7  DEC   $FF
         LDA   $FF
         SEC
         SBC   #$0000
         BVS   L0111C4
         EOR   #$8000
L0111C4  BPL   L01121E
         LDX   $FD
         LDA   $FB
         INC   $FB
         BNE   L0111D0
         INC   $FD
L0111D0  STA   $EC
         STX   $EE
         LDA   [$EC]
         PHA
         LDX   $F9
         LDA   $F7
         INC   $F7
         BNE   L0111E1
         INC   $F9
L0111E1  STA   $EC
         STX   $EE
         PLA
         SEP   #$20
         STA   [$EC]
         REP   #$20
         AND   #$00FF
         CMP   #$0000
         BNE   L01121C
L0111F4  DEC   $FF
         LDA   $FF
         SEC
         SBC   #$0000
         BVS   L011201
         EOR   #$8000
L011201  BPL   L01121C
         LDX   $F9
         LDA   $F7
         INC   $F7
         BNE   L01120D
         INC   $F9
L01120D  STA   $EC
         STX   $EE
         LDA   #$0000
         SEP   #$20
         STA   [$EC]
         REP   #$20
         BRA   L0111F4
L01121C  BRA   L0111B7
L01121E  LDX   $EA
         LDA   $E8
         TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L01122C  ENT
         PHD
         TSC
         TCD
         TYA
         AND   #$0001
         BNE   L01124E
         SEP   #$20
         LDA   [$06],Y
         CMP   [$0A],Y
         REP   #$20
         BNE   L011251
         TYA
         BNE   L01124D
         LDY   #$FFFE
         BRA   L011251
L011247  LDA   [$06],Y
         CMP   [$0A],Y
         BNE   L011251
L01124D  DEY
L01124E  DEY
         BPL   L011247
L011251  LDA   $04,S
         STA   $0C,S
         LDA   $02,S
         STA   $0A,S
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         CPY   #$FFFE
         RTL

L011264  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEA   $0001
         PEA   ^L0C0020
         PEA   L0C0020
         JSL   L011303
         PLY
         PLY
         PLY
         TDC
         CLC
         ADC   #$00F9
         TCS
         PLD
         RTL

L011287  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E6
         TCS
         LDX   $FF
         LDA   $FD
         STX   $EA
         STA   $E8
         LDX   $FF
         LDA   $FD
         STX   $F2
         ORA   $F2
         BEQ   L0112F5
         LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L0112AE
         INC   $FF
L0112AE  STX   $EE
         STA   $EC
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         STA   $F0
         BRA   L0112E5
L0112BF  LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L0112C9
         INC   $FF
L0112C9  STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDX   $EE
         LDA   $EC
         INC   $EC
         BNE   L0112DA
         INC   $EE
L0112DA  STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
L0112E5  LDA   $F0
         DEC   $F0
         TAY
         BNE   L0112BF
         LDA   #$0000
         SEP   #$20
         STA   [$EC]
         REP   #$20
L0112F5  LDX   $EA
         LDA   $E8
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L011303  TSC
         TCD
         LDA   [$04]
         TAX
         LDA   $04,S
         TAY
         LDA   $06,S
         TCD
         LDA   $08,S
         TXS
         PHA
         PHD
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$01],Y
         TAX
         INY
         INY
         LDA   [$01],Y
         STA   $08,S
         INY
         INY
         LDA   [$01],Y
         STA   $0A,S
         PLA
         PLA
         PLA
         PLY
         CMP   #$0000
         BNE   L011332
         INC
L011332  PHX
         PLD
         RTL

