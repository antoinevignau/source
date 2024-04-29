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

	use	INIT.E
	use	INIT.X
	
	use	4/Event.Macs
	use	4/Line.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/NoteSeq.Macs
	use	4/NoteSyn.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------

L0A0000  ENT
L0E003C  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00D1
         TCS
         LDA   #$0006
         STA   $DC
         LDA   #$0004
         STA   $DE
         LDA   #$0100
         STA   $E0
         LDA   #$0006
         STA   $E2
         LDA   #$0100
         STA   $E4
         LDA   #$000F
         STA   $E6
         LDA   #$0100
         STA   $E8
         LDA   #$0014
         STA   $EA
         LDA   #$0100
         STA   $EC
         LDA   #$0019
         STA   $EE
         LDA   #$0100
         STA   $F0
         LDA   #$001A
         STA   $F2
         LDA   #$0001
         STA   $F4
         _TLStartUp
         BCS   L0A0058
         LDA   #$0000
L0A0058  STAL  L0B0002
         LDA   L0B0004
         STA   L0B0066
         _MTStartUp
         BCS   L0A006E
         LDA   #$0000
L0A006E  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         _LoadTools
         BCS   L0A0087
         LDA   #$0000
L0A0087  STAL  L0B0002
         PHX
         PHA
         PEA   $0000
         PEA   $0900
         LDA   L0B0066
         PHA
         PEA   $C005
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A00AC
         LDA   #$0000
L0A00AC  STAL  L0B0002
         PLA
         PLX
         STX   $DA
         STA   $D8
         LDY   #$0002
         LDA   [$D8],Y
         TAX
         LDA   [$D8]
         STX   $D6
         STA   $D4
         LDX   $D6
         LDA   $D4
         STX   L0B00CF
         STA   L0B00CD
         LDX   $D6
         LDA   $D4
         PHA
         PEA   $0087
         PEA   $0000
         LDA   L0B0066
         PHA
         _QDStartUp
         BCS   L0A00E7
         LDA   #$0000
L0A00E7  STAL  L0B0002
         _GrafOff
         BCS   L0A00F7
         LDA   #$0000
L0A00F7  STAL  L0B0002
         LDX   $D6
         LDA   $D4
         CLC
         ADC   #$0300
         PHA
         TXA
         ADC   #$0000
         TAX
         PEA   $0000
         PEA   $0000
         PEA   $0140
         PEA   $0000
         PEA   $00C8
         LDA   L0B0066
         PHA
         _EMStartUp
         BCS   L0A0128
         LDA   #$0000
L0A0128  STAL  L0B0002
         LDA   L0B0066
         PHA
         LDX   $D6
         LDA   $D4
         CLC
         ADC   #$0400
         PHA
         TXA
         ADC   #$0000
         TAX
         _MenuStartUp
         BCS   L0A014A
         LDA   #$0000
L0A014A  STAL  L0B0002
         LDA   L0B0066
         PHA
         LDX   $D6
         LDA   $D4
         CLC
         ADC   #$0500
         PHA
         _LEStartUp
         BCS   L0A0167
         LDA   #$0000
L0A0167  STAL  L0B0002
         LDX   $D6
         LDA   $D4
         CLC
         ADC   #$0600
         PHA
         PEA   $0000
         PEA   $0096
         PEA   $0001
         _SeqStartUp
         BCS   L0A0189
         LDA   #$0000
L0A0189  STAL  L0B0002
         PEA   $006E
         JSL   L021DFD
         PLY
         LDX   $D6
         LDA   $D4
         CLC
         ADC   #$0700
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   L0B00BF
         STA   L0B00BD
         _StopInts
         BCS   L0A01B6
         LDA   #$0000
L0A01B6  STAL  L0B0002
         PEA   $006F
         JSL   L021DFD
         PLY
         TSC
         CLC
         ADC   #$0029
         TCS
         PLD
         RTL

L0A01CA  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         _SeqShutDown
         BCS   L0A01E1
         LDA   #$0000
L0A01E1  STAL  L0B0002
         _LEShutDown
         BCS   L0A01F1
         LDA   #$0000
L0A01F1  STAL  L0B0002
         _MenuShutDown
         BCS   L0A0201
         LDA   #$0000
L0A0201  STAL  L0B0002
         _EMShutDown
         BCS   L0A0211
         LDA   #$0000
L0A0211  STAL  L0B0002
         _QDShutDown
         BCS   L0A0221
         LDA   #$0000
L0A0221  STAL  L0B0002
         _MTShutDown
         BCS   L0A0231
         LDA   #$0000
L0A0231  STAL  L0B0002
         _TLShutDown
         BCS   L0A0241
         LDA   #$0000
L0A0241  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0A024D  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         STZ   $F4
         BRL   L0A031D
L0A025D  LDA   $F4
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
         LDA   $F4
         STA   [$F6]
         PEA   ^L0C2993
         PEA   L0C2993
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
         LDA   $F6
         LDX   $F8
         CLC
         ADC   #$0006
         BCC   L0A02B4
         INX
L0A02B4  PHX
         PHA
         JSL   L0110F7
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
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A02DF
         LDA   #$0000
L0A02DF  STAL  L0B0002
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
         PLA
         PLX
         LDY   #$0004
         PHA
         TXA
         STA   [$F6],Y
         PLA
         LDY   #$0002
         STA   [$F6],Y
         PEA   $0078
         JSL   L021DFD
         PLY
         INC   $F4
L0A031D  LDA   $F4
         SEC
         SBC   #$0032
         BVS   L0A0328
         EOR   #$8000
L0A0328  BMI   L0A032D
         BRL   L0A025D
L0A032D  PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A034E
         LDA   #$0000
L0A034E  STAL  L0B0002
         PLA
         PLX
         STX   L0B002C
         STA   L0B002A
         PEA   $0079
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A0383
         LDA   #$0000
L0A0383  STAL  L0B0002
         PLA
         PLX
         STX   L0B0030
         STA   L0B002E
         PEA   $007A
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A03B8
         LDA   #$0000
L0A03B8  STAL  L0B0002
         PLA
         PLX
         STX   L0B0034
         STA   L0B0032
         PEA   $007B
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A03ED
         LDA   #$0000
L0A03ED  STAL  L0B0002
         PLA
         PLX
         STX   L0B0038
         STA   L0B0036
         PEA   $007C
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A0422
         LDA   #$0000
L0A0422  STAL  L0B0002
         PLA
         PLX
         STX   L0B003C
         STA   L0B003A
         PEA   $007D
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A0457
         LDA   #$0000
L0A0457  STAL  L0B0002
         PLA
         PLX
         STX   L0B0040
         STA   L0B003E
         PEA   $007E
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A048C
         LDA   #$0000
L0A048C  STAL  L0B0002
         PLA
         PLX
         STX   L0B0044
         STA   L0B0042
         PEA   $007F
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A04C1
         LDA   #$0000
L0A04C1  STAL  L0B0002
         PLA
         PLX
         STX   L0B0048
         STA   L0B0046
         PEA   $0080
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A04F6
         LDA   #$0000
L0A04F6  STAL  L0B0002
         PLA
         PLX
         STX   L0B004C
         STA   L0B004A
         PEA   $0081
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A052B
         LDA   #$0000
L0A052B  STAL  L0B0002
         PLA
         PLX
         STX   L0B0050
         STA   L0B004E
         PEA   $0082
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A0560
         LDA   #$0000
L0A0560  STAL  L0B0002
         PLA
         PLX
         STX   L0B0054
         STA   L0B0052
         PEA   $0083
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $000C
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A0595
         LDA   #$0000
L0A0595  STAL  L0B0002
         PLA
         PLX
         STX   L0B0058
         STA   L0B0056
         PEA   $0084
         JSL   L021DFD
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A05CA
         LDA   #$0000
L0A05CA  STAL  L0B0002
         PLA
         PLX
         STX   L0B00F1
         STA   L0B00EF
         PEA   $0085
         JSL   L021DFD
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0A05E6  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E7
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0280
         PEA   $00C8
         _SetRect
         BCS   L0A0612
         LDA   #$0000
L0A0612  STAL  L0B0002
         PEA   ^L0C03BB
         PEA   L0C03BB
         JSL   L0A11C3
         PLY
         PLY
         LDX   #$0000
         LDA   #$C030
         STX   L0B00B5
         STA   L0B00B3
         STZ   L0B006A
         STZ   L0B006C
         STZ   L0B0078
         STZ   L0B007A
         PEA   ^L0B0070
         PEA   L0B0070
         PEA   ^L0B0072
         PEA   L0B0072
         JSL   L070547
         PLY
         PLY
         PLY
         PLY
         LDX   #$0009
         LDA   #$EB10
         PHX
         PHA
         PHX
         PHA
         _TotalMem
         BCS   L0A0664
         LDA   #$0000
L0A0664  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BEQ   L0A0672
         BCS   L0A0677
L0A0672  LDA   #$0000
         BRA   L0A067A
L0A0677  LDA   #$0001
L0A067A  STA   L0B00A6
         STZ   L0B00A8
         STZ   L0B00AA
         STZ   L0B007C
         STZ   L0B007E
         STZ   L0B0084
         STZ   L0B008C
         STZ   L0B0088
         LDA   #$0001
         STA   L0B009A
         STZ   L0B00A0
         STZ   L0B00A2
         LDA   #$0000
         STAL  L0C1AA4
         LDA   #$0001
         STAL  L0C1AA2
         LDA   #$0001
         STAL  L0C1A9C
         STZ   L0B008E
         LDA   #$0001
         STA   L0B0096
         LDA   #$0001
         STA   L0B009C
         STZ   L0B008A
         LDA   #$0000
         STAL  L0C1AB0
         STZ   L0B00B7
         PEA   ^L0C2994
         PEA   L0C2994
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         STZ   L0B0082
         STZ   L0B00AE
         PEA   ^L0C2995
         PEA   L0C2995
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         STZ   $F4
         BRA   L0A0749
L0A0701  LDA   $F4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C072F
         LDX   #^L0C072F
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         PEA   ^L0C2996
         PEA   L0C2996
         LDA   $F4
         PHA
         LDA   #$0033
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0759
         LDX   #^L0C0759
         JSL   L010922
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         INC   $F4
L0A0749  LDA   $F4
         CMP   #$0015
         BCC   L0A0701
         STZ   $F4
         BRA   L0A079A
L0A0754  STZ   $F2
         BRA   L0A0791
L0A0758  LDA   $F2
         LDX   #$0000
         PHX
         PHA
         LDA   $F4
         PHA
         LDA   #$0006
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0FA2
         LDX   #^L0C0FA2
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         SEP   #$20
         STA   [$F6]
         REP   #$20
         INC   $F2
L0A0791  LDA   $F2
         CMP   #$0006
         BCC   L0A0758
         INC   $F4
L0A079A  LDA   $F4
         CMP   #$0005
         BCC   L0A0754
         PEA   ^L0C0F7A
         PEA   L0C0F7A
         PEA   $0000
         PEA   $0000
         PEA   $0280
         PEA   $00C8
         _SetRect
         BCS   L0A07BF
         LDA   #$0000
L0A07BF  STAL  L0B0002
         LDA   #$0000
         STAL  L0C0FEE
         PEA   $0087
         _SetMasterSCB
         BCS   L0A07D9
         LDA   #$0000
L0A07D9  STAL  L0B0002
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _OpenPort
         BCS   L0A07EF
         LDA   #$0000
L0A07EF  STAL  L0B0002
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _GetPortLoc
         BCS   L0A0805
         LDA   #$0000
L0A0805  STAL  L0B0002
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L0A081B
         LDA   #$0000
L0A081B  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         _ClipRect
         BCS   L0A0834
         LDA   #$0000
L0A0834  STAL  L0B0002
         PEA   ^L0C0C32
         PEA   L0C0C32
         _OpenPort
         BCS   L0A084A
         LDA   #$0000
L0A084A  STAL  L0B0002
         PEA   ^L0C0C32
         PEA   L0C0C32
         _GetPortLoc
         BCS   L0A0860
         LDA   #$0000
L0A0860  STAL  L0B0002
         PEA   ^L0C0C32
         PEA   L0C0C32
         _SetPort
         BCS   L0A0876
         LDA   #$0000
L0A0876  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         _ClipRect
         BCS   L0A088F
         LDA   #$0000
L0A088F  STAL  L0B0002
         PEA   ^L0C0B88
         PEA   L0C0B88
         _OpenPort
         BCS   L0A08A5
         LDA   #$0000
L0A08A5  STAL  L0B0002
         PEA   ^L0C0B88
         PEA   L0C0B88
         _GetPortLoc
         BCS   L0A08BB
         LDA   #$0000
L0A08BB  STAL  L0B0002
         PEA   ^L0C0B88
         PEA   L0C0B88
         _SetPort
         BCS   L0A08D1
         LDA   #$0000
L0A08D1  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         _ClipRect
         BCS   L0A08EA
         LDA   #$0000
L0A08EA  STAL  L0B0002
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L0A0900
         LDA   #$0000
L0A0900  STAL  L0B0002
         PEA   $0003
         _SetForeColor
         BCS   L0A0913
         LDA   #$0000
L0A0913  STAL  L0B0002
         PEA   $0000
         _SetBackColor
         BCS   L0A0926
         LDA   #$0000
L0A0926  STAL  L0B0002
         PEA   $0004
         _SetTextMode
         BCS   L0A0939
         LDA   #$0000
L0A0939  STAL  L0B0002
         PEA   $0003
         _SetSolidPenPat
         BCS   L0A094C
         LDA   #$0000
L0A094C  STAL  L0B0002
         PEA   $0000
         _SetSolidBackPat
         BCS   L0A095F
         LDA   #$0000
L0A095F  STAL  L0B0002
         STZ   L0B00FB
         STZ   L0B00FD
         LDA   #$000C
         STA   L0B0101
         LDA   #$1000
         STA   L0B0105
         STZ   L0B0107
         LDA   #$0080
         STA   L0B0109
         STZ   L0B010B
         LDA   #L0C24F4
         LDX   #^L0C24F4
         STX   L0B0117
         STA   L0B0115
         LDA   #L0C03B2
         LDX   #^L0C03B2
         STX   L0B011B
         STA   L0B0119
         STZ   $F4
         BRA   L0A09CF
L0A099D  PEA   $0008
         PEI   $F4
         PEA   $0000
         _SetColorEntry
         BCS   L0A09B1
         LDA   #$0000
L0A09B1  STAL  L0B0002
         PEA   $0007
         PEI   $F4
         PEA   $0000
         _SetColorEntry
         BCS   L0A09C9
         LDA   #$0000
L0A09C9  STAL  L0B0002
         INC   $F4
L0A09CF  LDA   $F4
         CMP   #$000F
         BEQ   L0A099D
         BCC   L0A099D
         TSC
         CLC
         ADC   #$0013
         TCS
         PLD
         RTL

L0A09E0  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F3
         TCS
         LDA   #L0C002E
         LDX   #^L0C002E
         STX   L0B00DB
         STA   L0B00D9
         LDA   #L0C00E6
         LDX   #^L0C00E6
         STX   L0B00DF
         STA   L0B00DD
         PEA   $0008
         _SetMasterSCB
         BCS   L0A0A12
         LDA   #$0000
L0A0A12  STAL  L0B0002
         JSL   L03117F
         _InitCursor
         BCS   L0A0A26
         LDA   #$0000
L0A0A26  STAL  L0B0002
         LDA   #$0001
         STA   L0B0092
         LDA   #$0001
         STA   L0B0094
         JSL   L031208
         PEA   $0087
         _SetMasterSCB
         BCS   L0A0A49
         LDA   #$0000
L0A0A49  STAL  L0B0002
         LDX   #$00E0
         LDA   #$1E98
         STX   L0B00D7
         STA   L0B00D5
         JSL   L06204F
         TSC
         CLC
         ADC   #$0007
         TCS
         PLD
         RTL

L0A0A65  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         LDX   #$0000
         LDA   #$0026
         STX   $F2
         STA   $F0
         PHX
         PHA
         PEI   $F2
         PEI   $F0
         LDA   L0B0066
         PHA
         PEA   $0200
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A0A99
         LDA   #$0000
L0A0A99  STAL  L0B0002
         PLA
         PLX
         STX   L0B00E7
         STA   L0B00E5
         LDX   L0B00E7
         LDA   L0B00E5
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0008
         STA   [$F6]
         STZ   $F4
         BRL   L0A0B4B
L0A0AC5  PEA   ^L0C2997
         PEA   L0C2997
         LDA   $F4
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
         LDA   $F4
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
         LDA   $F4
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   L0B00E7
         LDA   L0B00E5
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDX   $F8
         LDA   #$0002
         CLC
         ADC   $F6
         BCC   L0A0B33
         INX
L0A0B33  JSL   L010922
         PLA
         PLX
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
         INC   $F4
L0A0B4B  LDA   $F4
         SEC
         SBC   #$0008
         BVS   L0A0B56
         EOR   #$8000
L0A0B56  BMI   L0A0B5B
         BRL   L0A0AC5
L0A0B5B  LDX   L0B00E7
         LDA   L0B00E5
         PHX
         PHA
         _SetInstTable
         BCS   L0A0B6F
         LDA   #$0000
L0A0B6F  STAL  L0B0002
         STZ   $F4
         BRA   L0A0B90
L0A0B77  PEA   $0064
         PEI   $F4
         PEI   $F4
         _SetTrkInfo
         BCS   L0A0B8A
         LDA   #$0000
L0A0B8A  STAL  L0B0002
         INC   $F4
L0A0B90  LDA   $F4
         SEC
         SBC   #$0008
         BVS   L0A0B9B
         EOR   #$8000
L0A0B9B  BPL   L0A0B77
         STZ   $F4
         BRA   L0A0BDF
L0A0BA1  PEA   ^L0C2998
         PEA   L0C2998
         LDA   $F4
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
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         CLC
         ADC   #$0002
         BCC   L0A0BD3
         INX
L0A0BD3  PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         INC   $F4
L0A0BDF  LDA   $F4
         SEC
         SBC   #$000C
         BVS   L0A0BEA
         EOR   #$8000
L0A0BEA  BPL   L0A0BA1
         STZ   L0B00E1
         STZ   L0B00E3
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0A0BFA  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00D5
         TCS
         PEA   ^L0C2999
         PEA   L0C2999
         JSL   L040E53
         PLY
         PLY
         SEC
         SBC   #$0000
         BVS   L0A0C1A
         EOR   #$8000
L0A0C1A  BPL   L0A0C1F
         BRL   L0A0CD0
L0A0C1F  PEA   ^L0C29A6
         PEA   L0C29A6
         PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   #$0002
         SEP   #$20
         STA   $D7
         REP   #$20
         LDA   #$0000
         STA   $F0
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D7
         STX   $F4
         STA   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEA   $0009
         LDX   #$0000
         JSL   GSOS2
         BCS   L0A0C68
         LDA   #$0000
L0A0C68  STAL  L0B0002
         PEA   ^L0C29A9
         PEA   L0C29A9
         JSL   L040E53
         PLY
         PLY
         SEC
         SBC   #$0000
         BVS   L0A0C81
         EOR   #$8000
L0A0C81  BMI   L0A0CD0
         PEA   ^L0C29B6
         PEA   L0C29B6
         PEA   $0000
         TDC
         CLC
         ADC   #$00D8
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   #$0002
         SEP   #$20
         STA   $D7
         REP   #$20
         LDA   #$0000
         STA   $F0
         LDX   #$0000
         TDC
         CLC
         ADC   #$00D7
         STX   $F4
         STA   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEA   $0009
         LDX   #$0000
         JSL   GSOS2
         BCS   L0A0CCC
         LDA   #$0000
L0A0CCC  STAL  L0B0002
L0A0CD0  PEA   ^L0C29B9
         PEA   L0C29B9
         JSL   L0A0F0C
         PLY
         PLY
         TSC
         CLC
         ADC   #$0025
         TCS
         PLD
         RTL

L0A0CE4  ENT
L0E0020  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L0A09E0
         JSL   L0A024D
         JSL   L0A05E6
         JSL   L0A0A65
         JSL   L0A0BFA
         PEA   ^L0C29BE
         PEA   L0C29BE
         PEA   ^L0C1220
         PEA   L0C1220
         JSL   L0110F7
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

L0A0D1F  ENT
L0E0012  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         PEA   $0006
         _WriteChar
         BCS   L0A0D39
         LDA   #$0000
L0A0D39  STAL  L0B0002
         PEA   ^L0C29C3
         PEA   L0C29C3
         _WriteCString
         BCS   L0A0D4F
         LDA   #$0000
L0A0D4F  STAL  L0B0002
         PEA   ^L0C29CE
         PEA   L0C29CE
         _WriteCString
         BCS   L0A0D65
         LDA   #$0000
L0A0D65  STAL  L0B0002
         LDX   #$0007
         LDA   #$D000
         PHX
         PHA
         PHX
         PHA
         _TotalMem
         BCS   L0A0D7F
         LDA   #$0000
L0A0D7F  STAL  L0B0002
         PLA
         PLX
         JSL   L010B98
         BNE   L0A0D8E
         BRL   L0A0E7D
L0A0D8E  BCS   L0A0D93
         BRL   L0A0E7D
L0A0D93  PEA   ^L0C2A0D
         PEA   L0C2A0D
         _WriteCString
         BCS   L0A0DA5
         LDA   #$0000
L0A0DA5  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0DB8
         LDA   #$0000
L0A0DB8  STAL  L0B0002
         PEA   ^L0C2A16
         PEA   L0C2A16
         _WriteCString
         BCS   L0A0DCE
         LDA   #$0000
L0A0DCE  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0DE1
         LDA   #$0000
L0A0DE1  STAL  L0B0002
         PEA   ^L0C2A5E
         PEA   L0C2A5E
         _WriteCString
         BCS   L0A0DF7
         LDA   #$0000
L0A0DF7  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0E0A
         LDA   #$0000
L0A0E0A  STAL  L0B0002
         PEA   ^L0C2AA8
         PEA   L0C2AA8
         _WriteCString
         BCS   L0A0E20
         LDA   #$0000
L0A0E20  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0E33
         LDA   #$0000
L0A0E33  STAL  L0B0002
         PEA   ^L0C2AF3
         PEA   L0C2AF3
         _WriteCString
         BCS   L0A0E49
         LDA   #$0000
L0A0E49  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0E5C
         LDA   #$0000
L0A0E5C  STAL  L0B0002
         PEA   ^L0C2B3A
         PEA   L0C2B3A
         _WriteCString
         BCS   L0A0E72
         LDA   #$0000
L0A0E72  STAL  L0B0002
L0A0E76  LDA   #$0001
         BEQ   L0A0E7D
         BRA   L0A0E76
L0A0E7D  JSL   L0A0000
         STZ   $F4
         BRA   L0A0EB7
L0A0E85  PEA   $0008
         PEI   $F4
         PEA   $0000
         _SetColorEntry
         BCS   L0A0E99
         LDA   #$0000
L0A0E99  STAL  L0B0002
         PEA   $0007
         PEI   $F4
         PEA   $0000
         _SetColorEntry
         BCS   L0A0EB1
         LDA   #$0000
L0A0EB1  STAL  L0B0002
         INC   $F4
L0A0EB7  LDA   $F4
         SEC
         SBC   #$000F
         BEQ   L0A0E85
         BVS   L0A0EC4
         EOR   #$8000
L0A0EC4  BPL   L0A0E85
         PEA   $0001
         JSL   L030F81
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0A0ED6  ENT
L0E002E  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         _GrafOff
         BCS   L0A0EED
         LDA   #$0000
L0A0EED  STAL  L0B0002
         JSL   L0620B1
         JSL   L0A01CA
         STZ   L0B0000
         PEA   $0000
         JSL   L010B7A
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0A0F0C  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00B2
         TCS
         STZ   $BE
         STZ   $BC
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
         BEQ   L0A0F36
         BRL   L0A0FD8
L0A0F36  _GrafOff
         BCS   L0A0F42
         LDA   #$0000
L0A0F42  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0F55
         LDA   #$0000
L0A0F55  STAL  L0B0002
         PEA   $000A
         _WriteChar
         BCS   L0A0F68
         LDA   #$0000
L0A0F68  STAL  L0B0002
         PEA   $000A
         _WriteChar
         BCS   L0A0F7B
         LDA   #$0000
L0A0F7B  STAL  L0B0002
         PEA   ^L0C2B68
         PEA   L0C2B68
         _WriteCString
         BCS   L0A0F91
         LDA   #$0000
L0A0F91  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         _WriteCString
         BCS   L0A0FA5
         LDA   #$0000
L0A0FA5  STAL  L0B0002
         PEA   $000D
         _WriteChar
         BCS   L0A0FB8
         LDA   #$0000
L0A0FB8  STAL  L0B0002
         PEA   $000A
         _WriteChar
         BCS   L0A0FCB
         LDA   #$0000
L0A0FCB  STAL  L0B0002
         LDA   #$0000
         BRL   L0A10E8
         BRL   L0A10E8
L0A0FD8  LDAL  L0C0FEE
         STA   $B4
         PEA   $0000
         TDC
         CLC
         ADC   #$00B4
         PHA
         PEA   $0019
         LDX   #$0000
         JSL   GSOS2
         BCS   L0A0FF6
         LDA   #$0000
L0A0FF6  STAL  L0B0002
         PHX
         PHA
         PEA   $0000
         PEA   $0800
         LDA   L0B0066
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L0A101B
         LDA   #$0000
L0A101B  STAL  L0B0002
         PLA
         PLX
         STX   L0B0028
         STA   L0B0026
         PEA   $0028
         JSL   L021DFD
         PLY
         LDX   L0B0028
         LDA   L0B0026
         PHX
         PHA
         _HLock
         BCS   L0A1043
         LDA   #$0000
L0A1043  STAL  L0B0002
         PEA   $0000
         TDC
         CLC
         ADC   #$00BE
         PHA
         LDX   L0B0028
         LDA   L0B0026
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         PEA   $0000
         JSL   L0402DB
         PLY
         PLY
         PLY
         PLY
         PLY
         LDX   $B8
         LDA   $B6
         PHA
         LDX   L0B0028
         LDA   L0B0026
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         JSL   L0A10F2
         PLY
         PLY
         PLY
         LDX   L0B0028
         LDA   L0B0026
         PHX
         PHA
         _HUnlock
         BCS   L0A10A4
         LDA   #$0000
L0A10A4  STAL  L0B0002
         PEA   $0032
         JSL   L021DFD
         PLY
         PEI   $B8
         PEI   $B6
         LDX   L0B0028
         LDA   L0B0026
         PHX
         PHA
         _SetHandleSize
         BCS   L0A10C8
         LDA   #$0000
L0A10C8  STAL  L0B0002
         PEA   ^L0C0FEE
         PEA   L0C0FEE
         PEA   $0014
         LDX   #$0000
         JSL   GSOS2
         BCS   L0A10E1
         LDA   #$0000
L0A10E1  STAL  L0B0002
         LDA   #$0001
L0A10E8  TAY
         TSC
         CLC
         ADC   #$0044
         TCS
         TYA
         PLD
         RTL

L0A10F2  PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E8
         TCS
         STZ   $EC
         LDA   #$0001
         STA   $EE
L0A1104  LDA   $FF
         SEC
         SBC   #$0002
         SEC
         SBC   $EC
         BNE   L0A1112
         BRL   L0A11BB
L0A1112  BVS   L0A1117
         EOR   #$8000
L0A1117  BMI   L0A111C
         BRL   L0A11BB
L0A111C  LDA   $EE
         SEC
         SBC   #$0006
         BEQ   L0A112E
         BVS   L0A1129
         EOR   #$8000
L0A1129  BPL   L0A112E
         BRL   L0A11BB
L0A112E  LDA   $EE
         INC   $EE
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C1A8A
         LDX   #^L0C1A8A
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   $EC
         STA   [$F0]
         LDA   $EC
         CLC
         ADC   #$0002
         STA   $EC
L0A1154  LDA   $EC
         SEC
         SBC   #$0003
         LDX   #$0000
         TAY
         BPL   L0A1161
         DEX
L0A1161  PHX
         PHA
         LDX   $FD
         LDA   $FB
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         CMP   #$0025
         BNE   L0A11A2
         LDA   $EC
         SEC
         SBC   #$0002
         LDX   #$0000
         TAY
         BPL   L0A1188
         DEX
L0A1188  PHX
         PHA
         LDX   $FD
         LDA   $FB
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         CMP   #$0077
         BEQ   L0A11B8
L0A11A2  LDA   $FF
         SEC
         SBC   #$0002
         SEC
         SBC   $EC
         BEQ   L0A11B8
         BVS   L0A11B2
         EOR   #$8000
L0A11B2  BPL   L0A11B8
         INC   $EC
         BRA   L0A1154
L0A11B8  BRL   L0A1104
L0A11BB  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0A11C3  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L020134
         PLY
         PLY
         PEA   ^L02277B
         PEA   L02277B
         PEA   ^L0C2B84
         PEA   L0C2B84
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02279E
         PEA   L02279E
         PEA   ^L0C2B8C
         PEA   L0C2B8C
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0227F2
         PEA   L0227F2
         PEA   ^L0C2B93
         PEA   L0C2B93
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022815
         PEA   L022815
         PEA   ^L0C2B95
         PEA   L0C2B95
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02286B
         PEA   L02286B
         PEA   ^L0C2B97
         PEA   L0C2B97
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02299F
         PEA   L02299F
         PEA   ^L0C2B99
         PEA   L0C2B99
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0229C2
         PEA   L0229C2
         PEA   ^L0C2B9B
         PEA   L0C2B9B
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0229DD
         PEA   L0229DD
         PEA   ^L0C2B9D
         PEA   L0C2B9D
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022A0A
         PEA   L022A0A
         PEA   ^L0C2BA0
         PEA   L0C2BA0
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022A3C
         PEA   L022A3C
         PEA   ^L0C2BA3
         PEA   L0C2BA3
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022A7B
         PEA   L022A7B
         PEA   ^L0C2BA7
         PEA   L0C2BA7
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022A92
         PEA   L022A92
         PEA   ^L0C2BAD
         PEA   L0C2BAD
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022B01
         PEA   L022B01
         PEA   ^L0C2BB4
         PEA   L0C2BB4
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022B24
         PEA   L022B24
         PEA   ^L0C2BBB
         PEA   L0C2BBB
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022BA2
         PEA   L022BA2
         PEA   ^L0C2BC0
         PEA   L0C2BC0
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022BCF
         PEA   L022BCF
         PEA   ^L0C2BC4
         PEA   L0C2BC4
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022C43
         PEA   L022C43
         PEA   ^L0C2BC9
         PEA   L0C2BC9
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022C70
         PEA   L022C70
         PEA   ^L0C2BCE
         PEA   L0C2BCE
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022C9D
         PEA   L022C9D
         PEA   ^L0C2BD3
         PEA   L0C2BD3
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022CCA
         PEA   L022CCA
         PEA   ^L0C2BDC
         PEA   L0C2BDC
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022CF7
         PEA   L022CF7
         PEA   ^L0C2BE3
         PEA   L0C2BE3
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022D28
         PEA   L022D28
         PEA   ^L0C2BE9
         PEA   L0C2BE9
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022D54
         PEA   L022D54
         PEA   ^L0C2BEE
         PEA   L0C2BEE
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022D81
         PEA   L022D81
         PEA   ^L0C2BF4
         PEA   L0C2BF4
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022DAD
         PEA   L022DAD
         PEA   ^L0C2BF9
         PEA   L0C2BF9
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022DC8
         PEA   L022DC8
         PEA   ^L0C2C01
         PEA   L0C2C01
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022DF4
         PEA   L022DF4
         PEA   ^L0C2C06
         PEA   L0C2C06
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022F06
         PEA   L022F06
         PEA   ^L0C2C0A
         PEA   L0C2C0A
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022F1D
         PEA   L022F1D
         PEA   ^L0C2C0F
         PEA   L0C2C0F
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023868
         PEA   L023868
         PEA   ^L0C2C14
         PEA   L0C2C14
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022FB5
         PEA   L022FB5
         PEA   ^L0C2C17
         PEA   L0C2C17
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0230C9
         PEA   L0230C9
         PEA   ^L0C2C1B
         PEA   L0C2C1B
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02324E
         PEA   L02324E
         PEA   ^L0C2C20
         PEA   L0C2C20
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023271
         PEA   L023271
         PEA   ^L0C2C24
         PEA   L0C2C24
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02333A
         PEA   L02333A
         PEA   ^L0C2C28
         PEA   L0C2C28
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023369
         PEA   L023369
         PEA   ^L0C2C2D
         PEA   L0C2C2D
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02345E
         PEA   L02345E
         PEA   ^L0C2C2F
         PEA   L0C2C2F
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023548
         PEA   L023548
         PEA   ^L0C2C33
         PEA   L0C2C33
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023591
         PEA   L023591
         PEA   ^L0C2C3B
         PEA   L0C2C3B
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023B3A
         PEA   L023B3A
         PEA   ^L0C2C40
         PEA   L0C2C40
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L022768
         PEA   L022768
         PEA   ^L0C2C44
         PEA   L0C2C44
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0236A5
         PEA   L0236A5
         PEA   ^L0C2C4A
         PEA   L0C2C4A
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023644
         PEA   L023644
         PEA   ^L0C2C51
         PEA   L0C2C51
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023706
         PEA   L023706
         PEA   ^L0C2C58
         PEA   L0C2C58
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02374F
         PEA   L02374F
         PEA   ^L0C2C60
         PEA   L0C2C60
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0237D0
         PEA   L0237D0
         PEA   ^L0C2C67
         PEA   L0C2C67
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02337C
         PEA   L02337C
         PEA   ^L0C2C6F
         PEA   L0C2C6F
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023841
         PEA   L023841
         PEA   ^L0C2C77
         PEA   L0C2C77
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023868
         PEA   L023868
         PEA   ^L0C2C7C
         PEA   L0C2C7C
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0237F3
         PEA   L0237F3
         PEA   ^L0C2C83
         PEA   L0C2C83
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02381A
         PEA   L02381A
         PEA   ^L0C2C88
         PEA   L0C2C88
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02388F
         PEA   L02388F
         PEA   ^L0C2C8F
         PEA   L0C2C8F
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L02399F
         PEA   L02399F
         PEA   ^L0C2C9A
         PEA   L0C2C9A
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0239C6
         PEA   L0239C6
         PEA   ^L0C2CA4
         PEA   L0C2CA4
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0239ED
         PEA   L0239ED
         PEA   ^L0C2CAE
         PEA   L0C2CAE
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023A14
         PEA   L023A14
         PEA   ^L0C2CB8
         PEA   L0C2CB8
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023B17
         PEA   L023B17
         PEA   ^L0C2CC3
         PEA   L0C2CC3
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023B5D
         PEA   L023B5D
         PEA   ^L0C2CCC
         PEA   L0C2CCC
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L023BBA
         PEA   L023BBA
         PEA   ^L0C2CD3
         PEA   L0C2CD3
         PEI   $FF
         PEI   $FD
         JSL   L020276
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

