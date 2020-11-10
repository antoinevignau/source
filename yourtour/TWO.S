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

	use	TWO.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Util.Macs
	
*-------------------------------

L030000  ENT
         PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$FF54
         TCS
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         STX   $D0
         STA   $CE
         LDX   #$0000
         TDC
         CLC
         ADC   #$00BA
         STX   $C0
         STA   $BE
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STX   $94
         STA   $92
         LDX   $F1
         LDA   $EF
         STX   $90
         STA   $8E
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDA   [$E4]
         AND   #$00FF
         STA   $A2
         LDA   $A2
         AND   #$0080
         CMP   #$0000
         BEQ   L030062
         LDA   #$0004
         STA   $8C
         STZ   $FF
         LDA   #$0087
         STA   $A2
         BRA   L03006C
L030062  LDA   #$0008
         STA   $A2
         LDA   #$0002
         STA   $8C
L03006C  LDA   $F7
         CMP   #$0006
         BNE   L030075
         STZ   $FF
L030075  LDA   $A2
         SEC
         SBC   #$0080
         BVS   L030080
         EOR   #$8000
L030080  BMI   L03008B
         LDA   $F9
         BEQ   L03008B
         LDA   #$0000
         BRA   L03008E
L03008B  LDA   #$0001
L03008E  STA   $88
         LDA   $F9
         BNE   L0300EE
         PEI   $FD
         PEI   $FB
         PEA   $0000
         PEA   $0000
         LDA   $8C
         PHA
         LDA   #$0004
         SEC
         JSL   L01092D
         PLY
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         SEC
         SBC   #$0001
         SEC
         JSL   L010AAE
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0001
         LDA   [$E4],Y
         AND   #$00FF
         SEC
         SBC   #$0001
         PHA
         _SetRect
         BCS   L0300EA
         LDA   #$0000
L0300EA  STAL  L0B0002
L0300EE  LDA   [$FB]
         STA   $E0
         LDY   #$0004
         LDA   [$FB],Y
         SEC
         SBC   #$0001
         STA   $DE
         LDA   $DE
         SEC
         SBC   $E0
         CLC
         ADC   #$0001
         STA   $E2
         LDA   #L0C0C32
         LDX   #^L0C0C32
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF56
         PHA
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $8C
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         SEC
         JSL   L01092D
         PLY
         CLC
         ADC   #$0001
         LDX   #$FF5C
         STA   $00,X
         LDX   #$FF5C
         LDA   $00,X
         CLC
         ADC   #$0001
         STA   $C2
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0001
         LDA   [$E4],Y
         AND   #$00FF
         CLC
         ADC   #$0001
         PHA
         LDA   #$0002
         SEC
         JSL   L010AAE
         PLA
         LDX   #$0000
         TAY
         BPL   L03017C
         DEX
L03017C  STX   $A6
         STA   $A4
         PEA   $C000
         PEI   $A6
         PEI   $A4
         LDX   L0B0034
         LDA   L0B0032
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0386
         JSL   L021DFD
         PLY
         LDX   L0B0034
         LDA   L0B0032
         PHX
         PHA
         _HLock
         BCS   L0301B4
         LDA   #$0000
L0301B4  STAL  L0B0002
         PEA   $0387
         JSL   L021DFD
         PLY
         LDX   L0B0034
         LDA   L0B0032
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         TAX
         LDA   [$E4]
         STX   $B2
         STA   $B0
         LDA   $F7
         SEC
         SBC   #$0003
         BVS   L0301E1
         EOR   #$8000
L0301E1  BPL   L0301F2
         LDA   $F7
         SEC
         SBC   #$0004
         BEQ   L030234
         BVS   L0301F0
         EOR   #$8000
L0301F0  BPL   L030234
L0301F2  STZ   $C6
         BRA   L030225
L0301F6  LDA   $C6
         CLC
         ADC   $E0
         PHA
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L03020D
         DEX
L03020D  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         PLA
         STA   [$E4]
         INC   $C6
L030225  LDA   $C6
         SEC
         SBC   $E2
         BVS   L03022F
         EOR   #$8000
L03022F  BPL   L0301F6
         BRL   L0302CD
L030234  STZ   $C6
         BRL   L0302BE
L030239  LDA   #$0002
         PHA
         LDA   $C6
         SEC
         JSL   L01092D
         PLY
         PHA
         LDA   $E0
         PLX
         STX   $E8
         CLC
         ADC   $E8
         PHA
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L030260
         DEX
L030260  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         PLA
         STA   [$E4]
         LDA   #$0002
         PHA
         LDA   $C6
         SEC
         JSL   L01092D
         PLY
         PHA
         LDA   $DE
         PLX
         STX   $E8
         SEC
         SBC   $E8
         PHA
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L03029D
         DEX
L03029D  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         PLA
         LDY   #$0002
         STA   [$E4],Y
         LDA   $C6
         CLC
         ADC   #$0002
         STA   $C6
L0302BE  LDA   $C6
         SEC
         SBC   $E2
         BVS   L0302C8
         EOR   #$8000
L0302C8  BMI   L0302CD
         BRL   L030239
L0302CD  LDA   $F7
         CMP   #$0002
         BEQ   L0302DE
         LDA   $F7
         CMP   #$0004
         BEQ   L0302DE
         BRL   L030375
L0302DE  STZ   $C6
         BRA   L030353
L0302E2  LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L0302F3
         DEX
L0302F3  SEC
         JSL   L010CB2
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $E2
         LDX   #$0000
         TAY
         BPL   L030309
         DEX
L030309  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         PLA
         PLX
         JSL   L010AA3
         PLA
         PLX
         SEC
         SBC   #$0002
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L03033C
         DEX
L03033C  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         JSL   L0321DE
         PLY
         PLY
         PLY
         PLY
         INC   $C6
L030353  LDA   #$0002
         PHA
         LDA   $E2
         SEC
         SBC   #$0001
         SEC
         JSL   L01092D
         PLY
         SEC
         SBC   $C6
         BEQ   L030372
         BVS   L03036D
         EOR   #$8000
L03036D  BPL   L030372
         BRL   L0302E2
L030372  BRL   L0303FC
L030375  LDA   $F7
         CMP   #$0001
         BNE   L0303DD
         STZ   $C6
         BRA   L0303CF
L030380  PEI   $E2
         JSL   L031FA1
         PLY
         STA   $CC
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $CC
         LDX   #$0000
         TAY
         BPL   L03039A
         DEX
L03039A  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L0303B8
         DEX
L0303B8  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         JSL   L0321DE
         PLY
         PLY
         PLY
         PLY
         INC   $C6
L0303CF  LDA   $C6
         SEC
         SBC   $E2
         BVS   L0303D9
         EOR   #$8000
L0303D9  BPL   L030380
         BRA   L0303FC
L0303DD  LDA   $F7
         CMP   #$0005
         BEQ   L0303EB
         LDA   $F7
         CMP   #$0007
         BNE   L0303FC
L0303EB  LDA   $E2
         CLC
         ADC   #$0001
         PHA
         LDA   $C2
         CLC
         JSL   L010AAE
         PLA
         STA   $C2
L0303FC  LDA   #L0C0CE4
         LDX   #^L0C0CE4
         STX   $A0
         STA   $9E
         PEA   $0000
         TDC
         CLC
         ADC   #$FF5E
         PHA
         LDY   #$0002
         LDA   [$9E],Y
         PHA
         LDA   [$9E]
         PHA
         LDY   #$0006
         LDA   [$9E],Y
         PHA
         LDY   #$0004
         LDA   [$9E],Y
         PHA
         _SetRect
         BCS   L030430
         LDA   #$0000
L030430  STAL  L0B0002
         PEI   $C2
         PEA   $0000
         TDC
         CLC
         ADC   #$FF56
         PHA
         PEA   ^L0B0036
         PEA   L0B0036
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L030460
         LDA   #$0000
L030460  STAL  L0B0002
         PEA   $0000
         PEI   $F1
         PEI   $EF
         _SetPurge
         BCS   L030477
         LDA   #$0000
L030477  STAL  L0B0002
         PEA   $038C
         JSL   L021DFD
         PLY
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0001
         LDA   [$E4],Y
         AND   #$00FF
         CLC
         ADC   #$0001
         PHA
         LDA   #$0004
         SEC
         JSL   L010AAE
         PLA
         LDX   #$0000
         TAY
         BPL   L0304AC
         DEX
L0304AC  STX   $A6
         STA   $A4
         PEA   $038E
         JSL   L021DFD
         PLY
         PEA   $C000
         PEI   $A6
         PEI   $A4
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
         PEA   $0398
         JSL   L021DFD
         PLY
         PEI   $F1
         PEI   $EF
         _HLock
         BCS   L0304E8
         LDA   #$0000
L0304E8  STAL  L0B0002
         PEA   $03A2
         JSL   L021DFD
         PLY
         LDX   L0B0030
         LDA   L0B002E
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         TAX
         LDA   [$E4]
         STX   $AE
         STA   $AC
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0001
         LDA   [$E4],Y
         AND   #$00FF
         LDX   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         JSL   L010922
         PLA
         PLX
         CLC
         ADC   #$0024
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $AA
         STA   $A8
         STZ   $C4
         BRA   L0305B8
L030544  LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $C4
         LDX   #$0000
         TAY
         BPL   L030555
         DEX
L030555  SEC
         JSL   L010CB2
         LDX   $AE
         LDA   $AC
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDX   $AA
         LDA   $A8
         LDY   #$0002
         PHA
         TXA
         STA   [$E4],Y
         PLA
         STA   [$E4]
         LDA   $C4
         LDX   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDX   $E6
         LDA   #$0024
         CLC
         ADC   $E4
         BCC   L030594
         INX
L030594  JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         AND   #$00FF
         LDX   #$0000
         PHX
         PHA
         LDX   $AA
         LDA   $A8
         JSL   L010922
         PLA
         PLX
         STX   $AA
         STA   $A8
         INC   $C4
L0305B8  LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0001
         LDA   [$E4],Y
         AND   #$00FF
         SEC
         SBC   $C4
         BEQ   L0305DB
         BVS   L0305D6
         EOR   #$8000
L0305D6  BPL   L0305DB
         BRL   L030544
L0305DB  LDA   $FF
         BEQ   L03060F
         PEA   $0008
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDA   $E4
         LDX   $E6
         CLC
         ADC   #$0004
         BCC   L0305F9
         INX
L0305F9  PHX
         PHA
         _SetColorTable
         BCS   L030607
         LDA   #$0000
L030607  STAL  L0B0002
         JSL   L03223A
L03060F  PEA   $0000
         TDC
         CLC
         ADC   #$0096
         PHA
         LDY   #$0002
         LDA   [$FB],Y
         PHA
         PEA   $0000
         LDY   #$0006
         LDA   [$FB],Y
         PHA
         PEA   $0001
         _SetRect
         BCS   L030636
         LDA   #$0000
L030636  STAL  L0B0002
         STZ   $8A
         LDA   $F7
         CMP   #$0005
         BEQ   L03064D
         LDA   $F7
         CMP   #$0007
         BEQ   L03064D
         BRL   L0307B4
L03064D  LDA   $E2
         STA   $9A
         STZ   $DA
         LDA   [$FB]
         STA   $C6
         BRA   L030693
L030659  LDA   $C6
         LDX   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDX   $E6
         LDA   #$0024
         CLC
         ADC   $E4
         BCC   L030677
         INX
L030677  JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         AND   #$00FF
         PHA
         LDA   $DA
         PLX
         STX   $E8
         CLC
         ADC   $E8
         STA   $DA
         INC   $C6
L030693  LDA   [$FB]
         CLC
         ADC   $E2
         SEC
         SBC   $C6
         BEQ   L0306A4
         BVS   L0306A2
         EOR   #$8000
L0306A2  BMI   L030659
L0306A4  LDA   $E2
         CLC
         ADC   #$0002
         PHA
         LDA   $8C
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         SEC
         JSL   L01092D
         PLY
         SEC
         JSL   L010AAE
         PLA
         STA   $D6
         LDX   #$FF5A
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF58
         LDA   $00,X
         PLX
         STX   $BC
         STA   $BA
         PHA
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   [$FB]
         LDX   #$0000
         TAY
         BPL   L0306F0
         DEX
L0306F0  SEC
         JSL   L010CB2
         LDX   $AE
         LDA   $AC
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         TAX
         LDA   [$E4]
         PHX
         PHA
         LDA   $DA
         PHA
         PEI   $C0
         PEI   $BE
         PEI   $D0
         PEI   $CE
         _UnPackBytes
         BCS   L030724
         LDA   #$0000
L030724  STAL  L0B0002
         PLA
         STA   $D8
         LDA   [$FB]
         PHA
         LDA   $F5
         PLX
         STX   $E8
         SEC
         SBC   $E8
         STA   $DC
         LDA   $88
         BEQ   L030751
         PEI   $A2
         LDA   $DC
         CLC
         ADC   $E2
         SEC
         SBC   #$0001
         PHA
         PEI   $DC
         JSL   L0321FD
         PLY
         PLY
         PLY
L030751  LDA   $F7
         CMP   #$0005
         BNE   L030781
         PEA   $0000
         TDC
         CLC
         ADC   #$FF56
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0096
         PHA
         PEI   $F3
         PEI   $F5
         PEA   $0000
         _PPToPort
         BCS   L03077D
         LDA   #$0000
L03077D  STAL  L0B0002
L030781  LDA   $F7
         CMP   #$0007
         BNE   L0307B1
         PEA   $0000
         TDC
         CLC
         ADC   #$FF56
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0096
         PHA
         PEI   $F3
         PEI   $F5
         PEA   $0001
         _PPToPort
         BCS   L0307AD
         LDA   #$0000
L0307AD  STAL  L0B0002
L0307B1  BRL   L0308F6
L0307B4  STZ   $C6
         BRL   L0308E7
L0307B9  LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $C6
         LDX   #$0000
         TAY
         BPL   L0307CA
         DEX
L0307CA  SEC
         JSL   L010CB2
         LDX   $B2
         LDA   $B0
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         STA   $D4
         LDA   $D4
         LDX   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDX   $E6
         LDA   #$0024
         CLC
         ADC   $E4
         BCC   L0307FF
         INX
L0307FF  JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         AND   #$00FF
         STA   $DA
         LDA   $8C
         PHA
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         SEC
         JSL   L01092D
         PLY
         CLC
         ADC   #$0003
         STA   $D6
         LDX   #$FF5A
         LDA   $00,X
         TAX
         PHX
         LDX   #$FF58
         LDA   $00,X
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$BE],Y
         PLA
         STA   [$BE]
         PHA
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   $D4
         LDX   #$0000
         TAY
         BPL   L030859
         DEX
L030859  SEC
         JSL   L010CB2
         LDX   $AE
         LDA   $AC
         JSL   L010922
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDY   #$0002
         LDA   [$E4],Y
         TAX
         LDA   [$E4]
         PHX
         PHA
         LDA   $DA
         PHA
         PEI   $C0
         PEI   $BE
         PEI   $D0
         PEI   $CE
         _UnPackBytes
         BCS   L03088D
         LDA   #$0000
L03088D  STAL  L0B0002
         PLA
         STA   $D8
         LDA   [$FB]
         PHA
         LDA   $F5
         CLC
         ADC   $D4
         PLX
         STX   $E8
         SEC
         SBC   $E8
         STA   $DC
         PEA   $0000
         TDC
         CLC
         ADC   #$FF56
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0096
         PHA
         PEI   $F3
         PEI   $DC
         PEA   $0000
         _PPToPort
         BCS   L0308C9
         LDA   #$0000
L0308C9  STAL  L0B0002
         LDA   $88
         BEQ   L0308E5
         PEI   $DC
         PEI   $A2
         _SetSCB
         BCS   L0308E1
         LDA   #$0000
L0308E1  STAL  L0B0002
L0308E5  INC   $C6
L0308E7  LDA   $C6
         SEC
         SBC   $E2
         BVS   L0308F1
         EOR   #$8000
L0308F1  BMI   L0308F6
         BRL   L0307B9
L0308F6  LDA   $F7
         CMP   #$0006
         BNE   L03091C
         LDY   #$0002
         LDA   [$8E],Y
         TAX
         LDA   [$8E]
         STA   $E4
         STX   $E6
         LDA   $E4
         LDX   $E6
         CLC
         ADC   #$0004
         BCC   L030914
         INX
L030914  PHX
         PHA
         JSL   L031FD5
         PLY
         PLY
L03091C  PEA   $0000
         TDC
         CLC
         ADC   #$FF56
         PHA
         PEA   ^L0B0036
         PEA   L0B0036
         JSL   L030D54
         PLY
         PLY
         PLY
         PLY
         LDX   L0B0030
         LDA   L0B002E
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         LDX   L0B0034
         LDA   L0B0032
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         PEI   $F1
         PEI   $EF
         _HUnlock
         BCS   L03095F
         LDA   #$0000
L03095F  STAL  L0B0002
         TSC
         CLC
         ADC   #$0194
         TCS
         PLD
         RTL

L03096B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EC
         TCS
         LDA   L0B008A
         BNE   L03097E
         BRL   L030A0B
L03097E  JSL   L03117F
         LDA   #$0000
         STA   $F0
         LDA   #$0000
         STA   $EE
         LDAL  L0C0EE8
         SEC
         SBCL  L0C0EE4
         STA   $F4
         LDAL  L0C0EE6
         SEC
         SBCL  L0C0EE2
         STA   $F2
         PEA   ^L0C0B88
         PEA   L0C0B88
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         LDAL  L0C0EE4
         PHA
         LDAL  L0C0EE2
         PHA
         PEA   $0000
         _PPToPort
         BCS   L0309CA
         LDA   #$0000
L0309CA  STAL  L0B0002
         PEA   ^L0C0B88
         PEA   L0C0B88
         PEA   ^L0B003A
         PEA   L0B003A
         JSL   L030D54
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C0F7A
         PEA   L0C0F7A
         PEA   $0000
         PEA   $0000
         PEA   $0280
         PEA   $00C8
         _SetRect
         BCS   L030A00
         LDA   #$0000
L030A00  STAL  L0B0002
         STZ   L0B008A
         JSL   L0311AA
L030A0B  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L030A13  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00C6
         TCS
         JSL   L03096B
         PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         PEA   $0000
         PEA   $0000
         _SetPt
         BCS   L030A3D
         LDA   #$0000
L030A3D  STAL  L0B0002
         LDA   $FD
         LDX   $FF
         PHX
         PHA
         PEA   ^L0C0EE2
         PEA   L0C0EE2
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDAL  L0C0CE2
         PHA
         LDA   #$0280
         CLC
         JSL   L01092D
         PLY
         STA   $CA
         LDA   $CA
         PHA
         LDAL  L0C0EE8
         SEC
         SBCL  L0C0EE4
         CLC
         ADC   #$0001
         CLC
         JSL   L01092D
         PLY
         CLC
         ADC   #$0001
         STAL  L0C0B8E
         LDAL  L0C0EE6
         SEC
         SBCL  L0C0EE2
         CLC
         ADC   #$0001
         PHA
         LDAL  L0C0B8E
         CLC
         ADC   #$0001
         CLC
         JSL   L010AAE
         PLA
         STA   $C8
         PEI   $C8
         PEA   ^L0C0B88
         PEA   L0C0B88
         PEA   ^L0B003A
         PEA   L0B003A
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #L0C0CE4
         LDX   #^L0C0CE4
         STX   $D6
         STA   $D4
         PEA   ^L0C0B90
         PEA   L0C0B90
         LDY   #$0002
         LDA   [$D4],Y
         PHA
         LDA   [$D4]
         PHA
         LDY   #$0006
         LDA   [$D4],Y
         PHA
         LDY   #$0004
         LDA   [$D4],Y
         PHA
         _SetRect
         BCS   L030AED
         LDA   #$0000
L030AED  STAL  L0B0002
         LDA   #L0C0CDC
         LDX   #^L0C0CDC
         STX   $DE
         STA   $DC
         LDA   #L0C0B88
         LDX   #^L0C0B88
         STX   $E2
         STA   $E0
         LDA   #L0C0EE2
         LDX   #^L0C0EE2
         STX   $E6
         STA   $E4
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D8
         STX   $EA
         STA   $E8
         LDA   #$0000
         STA   $EC
         LDAL  L0C0CF6
         TAX
         LDAL  L0C0CF4
         STX   $F0
         STA   $EE
         JSL   L03117F
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         _PaintPixels
         BCS   L030B46
         LDA   #$0000
L030B46  STAL  L0B0002
         PEA   $0087
         LDAL  L0C0EE6
         PHA
         LDAL  L0C0EE2
         PHA
         JSL   L0321FD
         PLY
         PLY
         PLY
         PEA   $0000
         _SetPenMode
         BCS   L030B6D
         LDA   #$0000
L030B6D  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00CC
         PHA
         LDAL  L0C0EE4
         PHA
         LDAL  L0C0EE2
         PHA
         LDAL  L0C0EE8
         SEC
         SBC   #$0006
         PHA
         LDAL  L0C0EE6
         SEC
         SBC   #$0003
         PHA
         _SetRect
         BCS   L030BA2
         LDA   #$0000
L030BA2  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00CC
         PHA
         _EraseRect
         BCS   L030BBB
         LDA   #$0000
L030BBB  STAL  L0B0002
         PEA   $0002
         PEA   $0001
         _SetPenSize
         BCS   L030BD1
         LDA   #$0000
L030BD1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00CC
         PHA
         _FrameRect
         BCS   L030BEA
         LDA   #$0000
L030BEA  STAL  L0B0002
         PEA   $0006
         PEA   $0003
         _SetPenSize
         BCS   L030C00
         LDA   #$0000
L030C00  STAL  L0B0002
         LDAL  L0C0EE4
         CLC
         ADC   #$0006
         PHA
         LDAL  L0C0EE6
         SEC
         SBC   #$0004
         PHA
         _MoveTo
         BCS   L030C22
         LDA   #$0000
L030C22  STAL  L0B0002
         LDAL  L0C0EE8
         SEC
         SBC   #$0006
         PHA
         LDAL  L0C0EE6
         SEC
         SBC   #$0004
         PHA
         _LineTo
         BCS   L030C44
         LDA   #$0000
L030C44  STAL  L0B0002
         LDAL  L0C0EE8
         SEC
         SBC   #$0006
         PHA
         LDAL  L0C0EE2
         CLC
         ADC   #$0003
         PHA
         _LineTo
         BCS   L030C66
         LDA   #$0000
L030C66  STAL  L0B0002
         JSL   L0311AA
         PEA   ^L0C0F7A
         PEA   L0C0F7A
         LDA   $CE
         CLC
         ADC   #$0014
         PHA
         LDA   $CC
         CLC
         ADC   #$0006
         PHA
         LDA   $D2
         SEC
         SBC   #$0012
         PHA
         LDA   $D0
         SEC
         SBC   #$0001
         PHA
         _SetRect
         BCS   L030C9C
         LDA   #$0000
L030C9C  STAL  L0B0002
         LDA   #L0C0F7A
         LDX   #^L0C0F7A
         PHX
         PHA
         PEA   ^L0C0EDA
         PEA   L0C0EDA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   #$0001
         STA   L0B008A
         STZ   L0B00A2
         PEA   $0001
         PEA   $0001
         _SetPenSize
         BCS   L030CD5
         LDA   #$0000
L030CD5  STAL  L0B0002
         LDAL  L0C0F7C
         PHA
         LDAL  L0C0F7A
         CLC
         ADC   L0B0070
         SEC
         SBC   #$0001
         PHA
         _MoveTo
         BCS   L030CF7
         LDA   #$0000
L030CF7  STAL  L0B0002
         TSC
         CLC
         ADC   #$0030
         TCS
         PLD
         RTL

L030D03  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         PEA   $C000
         LDA   $FF
         LDX   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$F7],Y
         TAX
         LDA   [$F7]
         PHX
         PHA
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         LDY   #$0002
         LDA   [$F7],Y
         TAX
         LDA   [$F7]
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         LDY   #$0004
         PHA
         TXA
         STA   [$FB],Y
         PLA
         LDY   #$0002
         STA   [$FB],Y
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L030D54  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         JSL   L04023C
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L030D77  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00CE
         TCS
         LDA   #L0C00E6
         LDX   #^L0C00E6
         PHX
         PHA
         LDX   L0B00DF
         LDA   L0B00DD
         JSL   L010B98
         BNE   L030DAF
         PEA   ^L0C2500
         PEA   L0C2500
         PEA   $0000
         TDC
         CLC
         ADC   #$00DD
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         BRA   L030DC6
L030DAF  PEA   ^L0C2509
         PEA   L0C2509
         PEA   $0000
         TDC
         CLC
         ADC   #$00DD
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L030DC6  PEA   $0000
         TDC
         CLC
         ADC   #$00DD
         PHA
         JSL   L010D87
         PLY
         PLY
         SEP   #$20
         STA   $DC
         REP   #$20
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         JSL   L031F08
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $0087
         LDA   $FF
         CLC
         ADC   #$000F
         PHA
         PEI   $FF
         JSL   L0321FD
         PLY
         PLY
         PLY
         PEA   ^L0C0F8A
         PEA   L0C0F8A
         LDA   #$0004
         CLC
         ADC   $FD
         PHA
         LDA   #$0001
         CLC
         ADC   $FF
         PHA
         LDA   #$0031
         CLC
         ADC   $FD
         PHA
         LDA   #$000E
         CLC
         ADC   $FF
         PHA
         _SetRect
         BCS   L030E47
         LDA   #$0000
L030E47  STAL  L0B0002
         PEA   ^L0C0F92
         PEA   L0C0F92
         LDA   #$0033
         CLC
         ADC   $FD
         PHA
         LDA   #$0001
         CLC
         ADC   $FF
         PHA
         LDA   #$0081
         CLC
         ADC   $FD
         PHA
         LDA   #$000E
         CLC
         ADC   $FF
         PHA
         _SetRect
         BCS   L030E79
         LDA   #$0000
L030E79  STAL  L0B0002
         PEA   ^L0C0F9A
         PEA   L0C0F9A
         LDA   #$0083
         CLC
         ADC   $FD
         PHA
         LDA   #$0001
         CLC
         ADC   $FF
         PHA
         LDA   #$00B0
         CLC
         ADC   $FD
         PHA
         LDA   #$000E
         CLC
         ADC   $FF
         PHA
         _SetRect
         BCS   L030EAB
         LDA   #$0000
L030EAB  STAL  L0B0002
         TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL

L030EB7  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         PEA   ^L0C0F92
         PEA   L0C0F92
         LDA   #L0C0F8A
         LDX   #^L0C0F8A
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         SEC
         SBC   #$0008
         PHA
         LDAL  L0C0F8A
         SEC
         SBC   #$0001
         PHA
         LDA   #L0C0F9A
         LDX   #^L0C0F9A
         STA   $F6
         STX   $F8
         LDY   #$0006
         LDA   [$F6],Y
         CLC
         ADC   #$0006
         PHA
         LDA   #L0C0F9A
         LDX   #^L0C0F9A
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         CLC
         ADC   #$0001
         PHA
         _SetRect
         BCS   L030F19
         LDA   #$0000
L030F19  STAL  L0B0002
         PEA   ^L0C0F92
         PEA   L0C0F92
         _EraseRect
         BCS   L030F2F
         LDA   #$0000
L030F2F  STAL  L0B0002
         LDA   #$0001
         STA   $F4
         BRA   L030F6C
L030F3A  LDA   $F4
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0F82
         LDX   #^L0C0F82
         JSL   L010922
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         _SetRect
         BCS   L030F66
         LDA   #$0000
L030F66  STAL  L0B0002
         INC   $F4
L030F6C  LDA   $F4
         SEC
         SBC   #$0004
         BVS   L030F77
         EOR   #$8000
L030F77  BPL   L030F3A
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L030F81  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00DA
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         LDA   #L0C0F8A
         LDX   #^L0C0F8A
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         SEC
         SBC   #$0004
         PHA
         LDAL  L0C0F8A
         SEC
         SBC   #$0001
         PHA
         LDA   #L0C0F9A
         LDX   #^L0C0F9A
         STA   $F4
         STX   $F6
         LDY   #$0006
         LDA   [$F4],Y
         CLC
         ADC   #$0003
         PHA
         LDA   #L0C0F9A
         LDX   #^L0C0F9A
         STA   $F4
         STX   $F6
         LDY   #$0004
         LDA   [$F4],Y
         CLC
         ADC   #$0002
         PHA
         _SetRect
         BCS   L030FE6
         LDA   #$0000
L030FE6  STAL  L0B0002
         LDA   #L0C0F8A
         LDX   #^L0C0F8A
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         PHA
         LDA   #L0C0F8A
         LDX   #^L0C0F8A
         STA   $F4
         STX   $F6
         LDY   #$0006
         LDA   [$F4],Y
         PLX
         STX   $F8
         SEC
         SBC   $F8
         CMP   #$0000
         BNE   L031019
         LDA   #$FFFF
         STA   $F0
L031019  PEA   $0000
         _SetPenMode
         BCS   L031028
         LDA   #$0000
L031028  STAL  L0B0002
         LDA   #L0C0F7A
         LDX   #^L0C0F7A
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $FF
         BEQ   L031076
         JSL   L03096B
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0280
         PEA   $00C8
         _SetRect
         BCS   L031072
         LDA   #$0000
L031072  STAL  L0B0002
L031076  LDA   L0B008E
         BEQ   L0310F0
         LDA   $E8
         SEC
         SBC   $EC
         BEQ   L0310F0
         BVS   L031087
         EOR   #$8000
L031087  BPL   L0310F0
         LDA   $EA
         SEC
         SBC   $EE
         BEQ   L0310F0
         BVS   L031095
         EOR   #$8000
L031095  BPL   L0310F0
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         PEI   $E6
         PEI   $EC
         PEI   $EE
         PEI   $E8
         _SetRect
         BCS   L0310B4
         LDA   #$0000
L0310B4  STAL  L0B0002
         LDA   $EC
         STA   $E8
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _EraseRect
         BCS   L0310D1
         LDA   #$0000
L0310D1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         _EraseRect
         BCS   L0310EA
         LDA   #$0000
L0310EA  STAL  L0B0002
         BRA   L031109
L0310F0  PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _EraseRect
         BCS   L031105
         LDA   #$0000
L031105  STAL  L0B0002
L031109  LDA   $FF
         BEQ   L031152
         PEA   $0008
         LDA   $EC
         SEC
         SBC   #$0001
         PHA
         PEA   $0000
         JSL   L0321FD
         PLY
         PLY
         PLY
         PEA   $0008
         PEA   $00C8
         LDA   $F0
         CLC
         ADC   #$0001
         PHA
         JSL   L0321FD
         PLY
         PLY
         PLY
         PEA   $0008
         PEA   $000A
         PEA   $0FFF
         _SetColorEntry
         BCS   L03114A
         LDA   #$0000
L03114A  STAL  L0B0002
         JSL   L0718F3
L031152  STZ   L0B00A2
         LDAL  L0C0F7C
         PHA
         LDAL  L0C0F7A
         CLC
         ADC   L0B0070
         SEC
         SBC   #$0001
         PHA
         _MoveTo
         BCS   L031173
         LDA   #$0000
L031173  STAL  L0B0002
         TSC
         CLC
         ADC   #$001E
         TCS
         PLD
         RTL

L03117F  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0B0094
         BEQ   L0311A2
         STZ   L0B0094
         _HideCursor
         BCS   L03119E
         LDA   #$0000
L03119E  STAL  L0B0002
L0311A2  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0311AA  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0B0092
         BEQ   L0311D5
         LDA   L0B0094
         BNE   L0311D5
         LDA   #$0001
         STA   L0B0094
         _ShowCursor
         BCS   L0311D1
         LDA   #$0000
L0311D1  STAL  L0B0002
L0311D5  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0311DD  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0B00DF
         LDA   L0B00DD
         PHX
         PHA
         _SetCursor
         BCS   L0311FC
         LDA   #$0000
L0311FC  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L031208  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0B00DB
         LDA   L0B00D9
         PHX
         PHA
         _SetCursor
         BCS   L031227
         LDA   #$0000
L031227  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L031233  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L031251
         LDA   #$0000
L031251  STAL  L0B0002
         PLA
         JSL   L0311DD
         JSL   L0612B1
         PEA   $0001
         JSL   L06078F
         PLY
         JSL   L0612DE
         TAY
         BEQ   L031291
         LDAL  L0C1A7A
         CMP   #$0000
         BNE   L031291
         STZ   L0B0078
         PEA   ^L0C2515
         PEA   L0C2515
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         BRA   L0312BE
         BRA   L0312B0
L031291  LDAL  L0C1A7A
         CMP   #$0003
         BNE   L0312B0
         PEA   ^L0C2517
         PEA   L0C2517
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         BRA   L0312BE
L0312B0  PEI   $FF
         PEI   $FD
         JSL   L0312C8
         PLY
         PLY
         JSL   L031208
L0312BE  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0312C8  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$0020
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         PEA   ^L0B003E
         PEA   L0B003E
         JSL   L030D54
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0078
         SEC
         SBC   #$0000
         BVS   L0312F6
         EOR   #$8000
L0312F6  BPL   L0312FB
         BRL   L03163D
L0312FB  LDA   L0B0078
         EOR   #$FFFF
         INC
         STA   $22
         LDA   $22
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
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E2
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $22
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
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         STA   $D8
         LDA   $22
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
         STA   $F2
         STX   $F4
         LDA   [$F2]
         STA   $D6
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         LDA   $22
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         PHX
         PHA
         _GetPort
         BCS   L0313AC
         LDA   #$0000
L0313AC  STAL  L0B0002
         JSL   L031DB9
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   $FF
         BNE   L0313FE
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0017
         PEA   $0025
         PEA   $0239
         PEA   $0028
         _SetRect
         BCS   L0313E1
         LDA   #$0000
L0313E1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         _ClipRect
         BCS   L0313FA
         LDA   #$0000
L0313FA  STAL  L0B0002
L0313FE  PEI   $FF
         LDA   $22
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         JSL   L031717
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         LDA   $22
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
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         STA   $D4
         LDA   $22
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
         STA   $F2
         STX   $F4
         LDA   [$F2]
         STA   $D2
         LDA   $FD
         BEQ   L0314BA
         LDAL  L0C0733
         PHA
         LDAL  L0C0731
         PHA
         LDAL  L0C0745
         PHA
         LDAL  L0C0743
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D2
         TAY
         TSC
         SEC
         SBC   #$0004
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0004
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L0316A6
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BNE   L031505
L0314BA  LDA   $FD
         BEQ   L0314C1
         BRL   L0315B9
L0314C1  PEA   $0000
         PEA   $0000
         LDAL  L0C0745
         PHA
         LDAL  L0C0743
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D2
         TAY
         TSC
         SEC
         SBC   #$0004
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0004
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L0316A6
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BNE   L031505
         BRL   L0315B9
L031505  PEA   ^L0C2519
         PEA   L0C2519
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDAL  L0C0743
         STA   $D0
         LDAL  L0C0745
         STA   $CE
         PEI   $FF
         LDX   #$0000
         TDC
         CLC
         ADC   #$00CE
         TAY
         TSC
         SEC
         SBC   #$0004
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0004
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $22
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         JSL   L03191A
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEI   $FF
         PEA   $0000
         TDC
         CLC
         ADC   #$00CE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00CE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E2
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         JSL   L031C09
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         BRL   L031623
L0315B9  PEA   ^L0C251B
         PEA   L0C251B
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         TAY
         TSC
         SEC
         SBC   #$0004
         TCS
         PHX
         PHY
         PEA   $0000
         INC
         PHA
         PEA   $0004
         JSL   L010BC3
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $22
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         JSL   L03191A
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
L031623  PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         PEA   ^L0B003E
         PEA   L0B003E
         JSL   L030D54
         PLY
         PLY
         PLY
         PLY
         BRL   L031684
L03163D  PEA   ^L0C251D
         PEA   L0C251D
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L031651  PHA
         PEA   $0000
         _StillDown
         BCS   L031661
         LDA   #$0000
L031661  STAL  L0B0002
         PLA
         TAY
         BEQ   L03166B
         BRA   L031651
L03166B  LDA   L0B0078
         SEC
         SBC   #$0000
         BEQ   L031684
         BVS   L031679
         EOR   #$8000
L031679  BPL   L031684
         LDA   L0B0078
         PHA
         JSL   L0607BE
         PLY
L031684  LDA   $FF
         BNE   L03169E
         PEA   ^L0C0CEC
         PEA   L0C0CEC
         _ClipRect
         BCS   L03169A
         LDA   #$0000
L03169A  STAL  L0B0002
L03169E  TSC
         CLC
         ADC   #$00D6
         TCS
         PLD
         RTL

L0316A6  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E6
         TCS
         LDA   $FD
         BNE   L0316C3
         LDA   $FF
         BNE   L0316C3
         LDA   #$000B
         STA   $FD
         LDA   #$0004
         STA   $FF
L0316C3  LDA   $F9
         SEC
         SBC   $FD
         SEC
         SBC   $F7
         BEQ   L0316D4
         BVS   L0316D2
         EOR   #$8000
L0316D2  BMI   L031703
L0316D4  LDA   $F9
         CLC
         ADC   $FD
         SEC
         SBC   $F7
         BVS   L0316E1
         EOR   #$8000
L0316E1  BPL   L031703
         LDA   $FB
         SEC
         SBC   $FF
         SEC
         SBC   $F5
         BEQ   L0316F4
         BVS   L0316F2
         EOR   #$8000
L0316F2  BMI   L031703
L0316F4  LDA   $FB
         CLC
         ADC   $FF
         SEC
         SBC   $F5
         BVS   L031701
         EOR   #$8000
L031701  BMI   L03170A
L031703  LDA   #$0000
         BRA   L03170D
         BRA   L03170D
L03170A  LDA   #$0001
L03170D  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L031717  PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$0016
         TCS
         PHX
         PHA
         _GetPort
         BCS   L031730
         LDA   #$0000
L031730  STAL  L0B0002
         PLA
         PLX
         STX   $30
         STA   $2E
         LDA   $2E
         LDX   $30
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0032
         PHA
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0000
         TDC
         CLC
         ADC   #$0032
         PHA
         _SetPort
         BCS   L03176A
         LDA   #$0000
L03176A  STAL  L0B0002
         PEA   $0002
         _SetPenMode
         BCS   L03177D
         LDA   #$0000
L03177D  STAL  L0B0002
         PEA   $0002
         PEA   $0001
         _SetPenSize
         BCS   L031793
         LDA   #$0000
L031793  STAL  L0B0002
         PEI   $FD
         PEI   $FB
         _FrameRect
         BCS   L0317A7
         LDA   #$0000
L0317A7  STAL  L0B0002
         PEI   $FD
         PEI   $FB
         _FrameRect
         BCS   L0317BB
         LDA   #$0000
L0317BB  STAL  L0B0002
         LDY   #$0002
         LDA   [$FB],Y
         STA   $E6
         LDA   [$FB]
         STA   $E4
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
         LDX   $F5
         LDA   $F3
         STX   $1A
         STA   $18
         LDX   $30
         LDA   $2E
         STX   $1E
         STA   $1C
         LDX   $F9
         LDA   $F7
         STX   $22
         STA   $20
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E4
         STX   $26
         STA   $24
         LDY   #$001A
         LDA   [$2E],Y
         TAX
         LDY   #$0018
         LDA   [$2E],Y
         STX   $2C
         STA   $2A
L03181A  PHA
         PEA   $0000
         _StillDown
         BCS   L03182A
         LDA   #$0000
L03182A  STAL  L0B0002
         PLA
         TAY
         BNE   L031835
         BRL   L0318B8
L031835  JSL   L06063A
         LDA   #L0C1A84
         LDX   #^L0C1A84
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
         BNE   L03185E
         LDA   $E0
         STA   $DC
L03185E  LDA   $DE
         CMP   $E2
         BNE   L03186A
         LDA   $DC
         CMP   $E0
         BEQ   L0318B5
L03186A  PEI   $FF
         LDA   $DC
         SEC
         SBC   $E0
         PHA
         LDA   $DE
         SEC
         SBC   $E2
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0018
         PHA
         JSL   L031B0B
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00DC
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
L0318B5  BRL   L03181A
L0318B8  LDY   #$0002
         LDA   [$FB],Y
         PHA
         LDY   #$0006
         LDA   [$FB],Y
         PHA
         LDA   $E6
         PLX
         STX   $EC
         CLC
         ADC   $EC
         PLX
         STX   $EC
         SEC
         SBC   $EC
         LDY   #$0006
         STA   [$FB],Y
         LDA   $E6
         LDY   #$0002
         STA   [$FB],Y
         LDA   [$FB]
         PHA
         LDY   #$0004
         LDA   [$FB],Y
         PHA
         LDA   $E4
         PLX
         STX   $EC
         CLC
         ADC   $EC
         PLX
         STX   $EC
         SEC
         SBC   $EC
         LDY   #$0004
         STA   [$FB],Y
         LDA   $E4
         STA   [$FB]
         PEI   $30
         PEI   $2E
         _SetPort
         BCS   L03190E
         LDA   #$0000
L03190E  STAL  L0B0002
         TSC
         CLC
         ADC   #$00D6
         TCS
         PLD
         RTL

L03191A  PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$00B8
         TCS
         PHX
         PHA
         _GetPort
         BCS   L031933
         LDA   #$0000
L031933  STAL  L0B0002
         PLA
         PLX
         STX   $D2
         STA   $D0
         JSL   L03117F
         LDY   #$0002
         LDA   [$F7],Y
         STA   $D6
         LDA   [$F7]
         STA   $D4
         LDX   $F1
         LDA   $EF
         STX   $BC
         STA   $BA
         LDX   $D2
         LDA   $D0
         STX   $C0
         STA   $BE
         LDX   $F5
         LDA   $F3
         STX   $C4
         STA   $C2
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D4
         STX   $C8
         STA   $C6
         LDY   #$001A
         LDA   [$D0],Y
         TAX
         LDY   #$0018
         LDA   [$D0],Y
         STX   $CE
         STA   $CC
         LDA   $FD
         SEC
         SBC   $D6
         STA   $DE
         LDA   $FB
         SEC
         SBC   $D4
         STA   $DC
L03198D  LDA   $DE
         BNE   L031998
         LDA   $DC
         BNE   L031998
         BRL   L031ABD
L031998  PEI   $DE
         JSL   L0108F6
         PLY
         STA   $E2
         PEI   $DC
         JSL   L0108F6
         PLY
         STA   $E0
         LDA   $E0
         CMP   #$0000
         BNE   L0319DF
         LDA   #$0000
         STA   $D8
         LDA   $E2
         CMP   #$0000
         BNE   L0319C4
         LDA   #$0000
         STA   $DA
         BRA   L0319DC
L0319C4  LDA   $E2
         SEC
         SBC   #$0008
         BVS   L0319CF
         EOR   #$8000
L0319CF  BPL   L0319D8
         LDA   #$0008
         STA   $DA
         BRA   L0319DC
L0319D8  LDA   $E2
         STA   $DA
L0319DC  BRL   L031A5E
L0319DF  LDA   $E0
         PHA
         LDA   $E2
         SEC
         JSL   L01092D
         PLY
         STA   $DA
         SEC
         SBC   #$0001
         BVS   L0319F5
         EOR   #$8000
L0319F5  BPL   L031A12
         LDA   #$0001
         STA   $D8
         LDA   $DA
         SEC
         SBC   #$0008
         BEQ   L031A10
         BVS   L031A09
         EOR   #$8000
L031A09  BPL   L031A10
         LDA   #$0008
         STA   $DA
L031A10  BRA   L031A5E
L031A12  LDA   $E2
         CMP   #$0000
         BNE   L031A38
         LDA   #$0000
         STA   $DA
         LDA   $E0
         SEC
         SBC   #$0004
         BVS   L031A29
         EOR   #$8000
L031A29  BPL   L031A32
         LDA   #$0004
         STA   $D8
         BRA   L031A36
L031A32  LDA   $E0
         STA   $D8
L031A36  BRA   L031A5E
L031A38  LDA   #$0001
         STA   $DA
         LDA   $E2
         PHA
         LDA   $E0
         SEC
         JSL   L01092D
         PLY
         STA   $D8
         LDA   $D8
         SEC
         SBC   #$0004
         BEQ   L031A5E
         BVS   L031A57
         EOR   #$8000
L031A57  BPL   L031A5E
         LDA   #$0004
         STA   $D8
L031A5E  LDA   $DE
         SEC
         SBC   #$0000
         BVS   L031A69
         EOR   #$8000
L031A69  BMI   L031A73
         LDA   $DA
         EOR   #$FFFF
         INC
         STA   $DA
L031A73  LDA   $DC
         SEC
         SBC   #$0000
         BVS   L031A7E
         EOR   #$8000
L031A7E  BMI   L031A88
         LDA   $D8
         EOR   #$FFFF
         INC
         STA   $D8
L031A88  PEI   $FF
         PEI   $D8
         PEI   $DA
         PEA   $0000
         TDC
         CLC
         ADC   #$00D4
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00BA
         PHA
         JSL   L031B0B
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         LDA   $FD
         SEC
         SBC   $D6
         STA   $DE
         LDA   $FB
         SEC
         SBC   $D4
         STA   $DC
         BRL   L03198D
L031ABD  JSL   L0311AA
         LDY   #$0002
         LDA   [$F7],Y
         PHA
         LDY   #$0006
         LDA   [$F7],Y
         PLX
         STX   $E8
         SEC
         SBC   $E8
         STA   $DA
         LDA   [$F7]
         PHA
         LDY   #$0004
         LDA   [$F7],Y
         PLX
         STX   $E8
         SEC
         SBC   $E8
         STA   $D8
         LDA   $FD
         LDY   #$0002
         STA   [$F7],Y
         LDA   $FB
         STA   [$F7]
         LDA   $FD
         CLC
         ADC   $DA
         LDY   #$0006
         STA   [$F7],Y
         LDA   $FB
         CLC
         ADC   $D8
         LDY   #$0004
         STA   [$F7],Y
         TSC
         CLC
         ADC   #$0030
         TCS
         PLD
         RTL

L031B0B  PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$00C4
         TCS
         LDX   $F9
         LDA   $F7
         LDY   #$000E
         PHA
         TXA
         STA   [$F3],Y
         PLA
         LDY   #$000C
         STA   [$F3],Y
         LDA   $FF
         BEQ   L031B4A
         LDA   #$0002
         LDY   #$0010
         STA   [$F3],Y
         PEI   $F5
         PEI   $F3
         _PaintPixels
         BCS   L031B43
         LDA   #$0000
L031B43  STAL  L0B0002
         BRL   L031BD9
L031B4A  LDA   $F3
         LDX   $F5
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         PEA   $0016
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $CE
         LDX   $D0
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
         LDA   $D2
         LDX   $D4
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
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEI   $DE
         PEI   $DC
         _OffsetRect
         BCS   L031BB4
         LDA   #$0000
L031BB4  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _EraseRect
         BCS   L031BCD
         LDA   #$0000
L031BCD  STAL  L0B0002
         LDA   #$0000
         LDY   #$0010
         STA   [$F3],Y
L031BD9  LDY   #$0002
         LDA   [$F7],Y
         CLC
         ADC   $FB
         LDY   #$0002
         STA   [$F7],Y
         LDA   [$F7]
         CLC
         ADC   $FD
         STA   [$F7]
         PEI   $F5
         PEI   $F3
         _PaintPixels
         BCS   L031BFD
         LDA   #$0000
L031BFD  STAL  L0B0002
         TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL

L031C09  PHD
         TSC
         SEC
         SBC   #$00E5
         TCD
         ADC   #$0011
         TCS
         JSL   L03117F
         LDA   #$0004
         STA   $16
         LDA   #$0000
         STA   $1A
         LDA   #$0000
         STA   $18
         PHX
         PHA
         _GetPort
         BCS   L031C35
         LDA   #$0000
L031C35  STAL  L0B0002
         PLA
         PLX
         STX   $C8
         STA   $C6
         PEI   $F5
         PEI   $F3
         _EraseRect
         BCS   L031C4F
         LDA   #$0000
L031C4F  STAL  L0B0002
         LDX   $ED
         LDA   $EB
         STX   $CC
         STA   $CA
         LDX   $C8
         LDA   $C6
         STX   $D0
         STA   $CE
         LDX   $F1
         LDA   $EF
         STX   $D4
         STA   $D2
         LDY   #$001A
         LDA   [$C6],Y
         TAX
         LDY   #$0018
         LDA   [$C6],Y
         STX   $DE
         STA   $DC
         LDX   $F9
         LDA   $F7
         STX   $D8
         STA   $D6
         LDA   #$0002
         STA   $DA
         PEA   $0000
         TDC
         CLC
         ADC   #$00CA
         PHA
         _PaintPixels
         BCS   L031C9C
         LDA   #$0000
L031C9C  STAL  L0B0002
         LDA   $EB
         LDX   $ED
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001C
         PHA
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   [$EF]
         PHA
         LDY   #$0004
         LDA   [$EF],Y
         PLX
         STX   $E4
         SEC
         SBC   $E4
         CLC
         ADC   #$0001
         PHA
         LDA   $22
         CLC
         JSL   L010AAE
         PLA
         STA   $14
         PEI   $14
         PEA   $0000
         TDC
         CLC
         ADC   #$001C
         PHA
         PEA   ^L0B0042
         PEA   L0B0042
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$001C
         STX   $D0
         STA   $CE
         LDX   #$0000
         TDC
         CLC
         ADC   #$0018
         STX   $D8
         STA   $D6
         LDA   #$0000
         STA   $DA
         PEA   $0000
         TDC
         CLC
         ADC   #$00CA
         PHA
         _PaintPixels
         BCS   L031D24
         LDA   #$0000
L031D24  STAL  L0B0002
         LDX   L0B0044
         LDA   L0B0042
         PHX
         PHA
         JSL   L071684
         PLY
         PLY
         LDX   $C8
         LDA   $C6
         STX   $D0
         STA   $CE
         LDX   $FD
         LDA   $FB
         STX   $D8
         STA   $D6
         LDA   #$0003
         STA   $DA
         LDX   #$0000
         TDC
         CLC
         ADC   #$001C
         STX   $CC
         STA   $CA
         PEA   $0000
         TDC
         CLC
         ADC   #$00CA
         PHA
         _PaintPixels
         BCS   L031D6C
         LDA   #$0000
L031D6C  STAL  L0B0002
         LDA   #$0001
         STA   $DA
         LDX   $ED
         LDA   $EB
         STX   $CC
         STA   $CA
         PEA   $0000
         TDC
         CLC
         ADC   #$00CA
         PHA
         _PaintPixels
         BCS   L031D92
         LDA   #$0000
L031D92  STAL  L0B0002
         JSL   L0311AA
         PEA   $0000
         TDC
         CLC
         ADC   #$001C
         PHA
         PEA   ^L0B0042
         PEA   L0B0042
         JSL   L030D54
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$00D3
         TCS
         PLD
         RTL

L031DB9  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00C6
         TCS
         JSL   L03117F
         LDA   $F1
         LDX   $F3
         PHX
         PHA
         LDA   $F7
         PHA
         LDA   $F5
         PHA
         PEA   $00AA
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         LDY   #$0006
         LDA   [$F1],Y
         PHA
         LDA   #$0280
         CLC
         JSL   L01092D
         PLY
         STA   $CA
         LDA   $CA
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         PLX
         STX   $EA
         SEC
         SBC   $EA
         CLC
         ADC   #$0001
         CLC
         JSL   L01092D
         PLY
         CLC
         ADC   #$0001
         LDY   #$0006
         STA   [$F5],Y
         LDA   [$F9]
         PHA
         LDY   #$0004
         LDA   [$F9],Y
         PLX
         STX   $EA
         SEC
         SBC   $EA
         CLC
         ADC   #$0001
         PHA
         LDY   #$0006
         LDA   [$F5],Y
         CLC
         ADC   #$0001
         CLC
         JSL   L010AAE
         PLA
         STA   $C8
         PEI   $C8
         PEI   $F7
         PEI   $F5
         PEA   ^L0B003E
         PEA   L0B003E
         JSL   L030D03
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00CC
         PHA
         PEA   $0000
         PEA   $0000
         _SetPt
         BCS   L031E6C
         LDA   #$0000
L031E6C  STAL  L0B0002
         LDX   $F3
         LDA   $F1
         STX   $D2
         STA   $D0
         LDX   $F7
         LDA   $F5
         STX   $D6
         STA   $D4
         LDX   $FB
         LDA   $F9
         STX   $DA
         STA   $D8
         LDX   #$0000
         TDC
         CLC
         ADC   #$00CC
         STX   $DE
         STA   $DC
         LDA   #$0000
         STA   $E0
         LDY   #$001A
         LDA   [$F1],Y
         TAX
         LDY   #$0018
         LDA   [$F1],Y
         STX   $E4
         STA   $E2
         PEA   $0000
         TDC
         CLC
         ADC   #$00D0
         PHA
         _PaintPixels
         BCS   L031EBD
         LDA   #$0000
L031EBD  STAL  L0B0002
         JSL   L0311AA
         PEI   $FF
         PEI   $FD
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$F9],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         PLX
         STX   $EA
         SEC
         SBC   $EA
         PHA
         LDA   [$F9]
         PHA
         LDY   #$0004
         LDA   [$F9],Y
         PLX
         STX   $EA
         SEC
         SBC   $EA
         PHA
         _SetRect
         BCS   L031EFC
         LDA   #$0000
L031EFC  STAL  L0B0002
         TSC
         CLC
         ADC   #$0024
         TCS
         PLD
         RTL

L031F08  ENT
         PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$0075
         TCS
         PEI   $F1
         PEI   $EF
         PEA   $0000
         TDC
         CLC
         ADC   #$007F
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$0080
         PHA
         JSL   L040E53
         PLY
         PLY
         STA   $77
         SEC
         SBC   #$0000
         BVS   L031F42
         EOR   #$8000
L031F42  BPL   L031F99
         LDA   $77
         SEC
         SBC   #$0032
         BVS   L031F4F
         EOR   #$8000
L031F4F  BMI   L031F99
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         PEI   $F5
         PEI   $F3
         LDA   $77
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
         STA   $E4
         STX   $E6
         LDY   #$0004
         LDA   [$E4],Y
         TAX
         LDY   #$0002
         LDA   [$E4],Y
         PHX
         PHA
         JSL   L030000
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
L031F99  TSC
         CLC
         ADC   #$0073
         TCS
         PLD
         RTL

L031FA1  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   $FF
         PHA
         PHA
         _Random
         BCS   L031FBC
         LDA   #$0000
L031FBC  STAL  L0B0002
         PLA
         SEC
         JSL   L01092D
         JSL   L0108F6
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L031FD5  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00CA
         TCS
         STZ   $CE
         BRA   L032005
L031FE4  LDA   $CE
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D2
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         STA   [$F2]
         INC   $CE
L032005  LDA   $CE
         SEC
         SBC   #$0010
         BVS   L032010
         EOR   #$8000
L032010  BPL   L031FE4
         PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         _SetColorTable
         BCS   L03202A
         LDA   #$0000
L03202A  STAL  L0B0002
         LDA   #$000E
         STA   $D0
         BRL   L0321C2
L032036  STZ   $CE
         BRL   L03214A
L03203B  LDA   #$0008
         PHA
         LDA   $CE
         LDX   #$0000
         TAY
         BPL   L032048
         DEX
L032048  STX   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$0F00
         SEC
         JSL   L010CD9
         PLA
         SEC
         SBC   $D0
         BEQ   L032098
         BVS   L032074
         EOR   #$8000
L032074  BPL   L032098
         LDA   $CE
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D2
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         CLC
         ADC   #$0100
         STA   [$F2]
L032098  LDA   #$0004
         PHA
         LDA   $CE
         LDX   #$0000
         TAY
         BPL   L0320A5
         DEX
L0320A5  STX   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00F0
         SEC
         JSL   L010CD9
         PLA
         SEC
         SBC   $D0
         BEQ   L0320F5
         BVS   L0320D1
         EOR   #$8000
L0320D1  BPL   L0320F5
         LDA   $CE
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D2
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         CLC
         ADC   #$0010
         STA   [$F2]
L0320F5  LDA   $CE
         LDX   #$0000
         TAY
         BPL   L0320FE
         DEX
L0320FE  STX   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$000F
         SEC
         SBC   $D0
         BEQ   L032148
         BVS   L032124
         EOR   #$8000
L032124  BPL   L032148
         LDA   $CE
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D2
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         CLC
         ADC   #$0001
         STA   [$F2]
L032148  INC   $CE
L03214A  LDA   $CE
         SEC
         SBC   #$0010
         BVS   L032155
         EOR   #$8000
L032155  BMI   L03215A
         BRL   L03203B
L03215A  PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$00D2
         PHA
         _SetColorTable
         BCS   L032172
         LDA   #$0000
L032172  STAL  L0B0002
         JSL   L0612B1
L03217A  LDA   #$0002
         PHA
         LDA   #$000E
         SEC
         SBC   $D0
         SEC
         JSL   L01092D
         PLY
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
         BCS   L0321A7
         LDA   #$0000
L0321A7  STAL  L0B0002
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
         BCC   L0321C0
         BRA   L03217A
L0321C0  DEC   $D0
L0321C2  LDA   $D0
         SEC
         SBC   #$0000
         BVS   L0321CD
         EOR   #$8000
L0321CD  BPL   L0321D2
         BRL   L032036
L0321D2  JSL   L03223A
         TSC
         CLC
         ADC   #$002C
         TCS
         PLD
         RTL

L0321DE  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         LDA   [$F9]
         STA   $EC
         LDA   [$FD]
         STA   [$F9]
         LDA   $EC
         STA   [$FD]
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0321FD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EC
         TCS
         LDA   $FB
         STA   $EE
         BRA   L032224
L03220E  PEI   $EE
         PEI   $FF
         _SetSCB
         BCS   L03221E
         LDA   #$0000
L03221E  STAL  L0B0002
         INC   $EE
L032224  LDA   $EE
         SEC
         SBC   $FD
         BEQ   L03220E
         BVS   L032230
         EOR   #$8000
L032230  BPL   L03220E
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L03223A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00AE
         TCS
         PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         _GetColorTable
         BCS   L03225D
         LDA   #$0000
L03225D  STAL  L0B0002
         LDA   $D6
         STA   $B6
         LDA   #$0008
         PHA
         LDA   $D6
         SEC
         JSL   L010CD9
         PLA
         AND   #$000F
         PHA
         LDA   #$0004
         PHA
         LDA   $D6
         SEC
         JSL   L010CD9
         PLA
         AND   #$000F
         PHA
         LDA   $D6
         AND   #$000F
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $B0
         LDA   $B0
         SEC
         SBC   #$0015
         BEQ   L0322AE
         BVS   L0322A5
         EOR   #$8000
L0322A5  BPL   L0322AE
         LDA   #$0000
         STA   $BC
         BRA   L0322B3
L0322AE  LDA   #$0FFF
         STA   $BC
L0322B3  PEA   $000F
         PEA   $000F
         PEA   $000F
         JSL   L03238E
         PLY
         PLY
         PLY
         STA   $BA
         PEA   $0007
         PEA   $0000
         TDC
         CLC
         ADC   #$00B6
         PHA
         _SetColorTable
         BCS   L0322DD
         LDA   #$0000
L0322DD  STAL  L0B0002
         JSL   L0322ED
         TSC
         CLC
         ADC   #$004C
         TCS
         PLD
         RTL

L0322ED  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00D2
         TCS
         PEA   $0007
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         _GetColorTable
         BCS   L032310
         LDA   #$0000
L032310  STAL  L0B0002
         LDA   #$0004
         STA   $D4
         BRA   L03235B
L03231B  LDA   $D4
         SEC
         SBC   #$0004
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   $D4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D6
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         PLA
         STA   [$F6]
         INC   $D4
L03235B  LDA   $D4
         SEC
         SBC   #$000F
         BEQ   L03231B
         BVS   L032368
         EOR   #$8000
L032368  BPL   L03231B
         PEA   $0007
         PEA   $0000
         TDC
         CLC
         ADC   #$00D6
         PHA
         _SetColorTable
         BCS   L032382
         LDA   #$0000
L032382  STAL  L0B0002
         TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL

L03238E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EE
         TCS
         LDA   $FD
         PHA
         LDA   #$0010
         SEC
         JSL   L010AAE
         LDA   $FB
         PHA
         LDA   #$0100
         SEC
         JSL   L010AAE
         PLA
         PLX
         STX   $F4
         CLC
         ADC   $F4
         CLC
         ADC   $FF
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

