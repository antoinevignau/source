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

	use	ONE.X
	
	use	4/Event.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $000D
         _WriteChar
         BCS   L02001A
         LDA   #$0000
L02001A  STAL  L0B0002
         PEA   $000A
         _WriteChar
         BCS   L02002D
         LDA   #$0000
L02002D  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02004C  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         STZ   $F0
         BRA   L020071
L02005B  LDA   [$FD]
         AND   #$00FF
         PHA
         LDA   $F0
         PLX
         STX   $F6
         CLC
         ADC   $F6
         STA   $F0
         INC   $FD
         BNE   L020071
         INC   $FF
L020071  LDA   [$FD]
         AND   #$00FF
         BNE   L02005B
         LDA   #$003F
         PHA
         LDA   $F0
         SEC
         JSL   L01092D
         PLA
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L02008E  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E4
         TCS
         PEI   $FB
         PEI   $F9
         JSL   L02004C
         PLY
         PLY
         STA   $EC
         LDA   $EC
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$0002
         LDX   $FF
         BCC   L0200B9
         INX
L0200B9  JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STX   $E8
         STA   $E6
         BRA   L020116
L0200D1  LDA   [$E6]
         LDX   #$0000
         TAY
         BPL   L0200DA
         DEX
L0200DA  PHX
         PHA
         LDX   L0B001C
         LDA   L0B001A
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         JSL   L010922
         PEI   $FB
         PEI   $F9
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L020107
         LDX   $E8
         LDA   $E6
         BRA   L02012A
L020107  LDY   #$0008
         LDA   [$E6],Y
         TAX
         LDY   #$0006
         LDA   [$E6],Y
         STX   $E8
         STA   $E6
L020116  LDA   $E6
         CMP   #$0000
         BNE   L0200D1
         LDA   $E8
         CMP   #$0000
         BNE   L0200D1
         LDX   #$0000
         LDA   #$0000
L02012A  TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         PLD
         RTL

L020134  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
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
         BCS   L020160
         LDA   #$0000
L020160  STAL  L0B0002
         PLA
         PLX
         STX   L0B001C
         STA   L0B001A
         PEA   $00A0
         JSL   L021DFD
         PLY
         LDA   #$0000
         STA   [$FD]
         STZ   $F0
         BRA   L0201AD
L02017D  LDA   $F0
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$0002
         LDX   $FF
         BCC   L020191
         INX
L020191  JSL   L010922
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
         INC   $F0
L0201AD  LDA   $F0
         SEC
         SBC   #$003F
         BVS   L0201B8
         EOR   #$8000
L0201B8  BPL   L02017D
         STZ   $F0
         BRL   L02025E
L0201BF  LDA   $F0
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$00FE
         LDX   $FF
         BCC   L0201DB
         INX
L0201DB  JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         STA   [$F2]
         LDA   $F0
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$00FE
         LDX   $FF
         BCC   L020206
         INX
L020206  JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDX   #$0000
         LDA   #$0000
         LDY   #$0004
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0002
         STA   [$F2],Y
         LDA   $F0
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$00FE
         LDX   $FF
         BCC   L02023F
         INX
L02023F  JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDX   #$0000
         LDA   #$0000
         LDY   #$0008
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0006
         STA   [$F2],Y
         INC   $F0
L02025E  LDA   $F0
         SEC
         SBC   #$003F
         BVS   L020269
         EOR   #$8000
L020269  BMI   L02026E
         BRL   L0201BF
L02026E  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L020276  ENT
         PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E0
         TCS
         LDA   [$F5]
         PHA
         INC
         STA   [$F5]
         PLA
         STA   $E8
         PHX
         PHA
         LDX   L0B001C
         LDA   L0B001A
         PHX
         PHA
         _GetHandleSize
         BCS   L0202A0
         LDA   #$0000
L0202A0  STAL  L0B0002
         PLA
         PLX
         PHA
         LDA   $E8
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $F5
         CLC
         ADC   #$00FE
         LDX   $F7
         BCC   L0202C3
         INX
L0202C3  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         PLA
         STA   [$EA]
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         LDX   #$0000
         TAY
         BPL   L0202E1
         DEX
L0202E1  PHX
         PHA
         PHX
         PHA
         LDX   L0B001C
         LDA   L0B001A
         PHX
         PHA
         _GetHandleSize
         BCS   L0202F9
         LDA   #$0000
L0202F9  STAL  L0B0002
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   L0B001C
         LDA   L0B001A
         PHX
         PHA
         _SetHandleSize
         BCS   L020326
         LDA   #$0000
L020326  STAL  L0B0002
         PEA   $00A1
         JSL   L021DFD
         PLY
         PEI   $FB
         PEI   $F9
         LDA   $E8
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $F5
         CLC
         ADC   #$00FE
         LDX   $F7
         BCC   L020352
         INX
L020352  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         LDX   #$0000
         TAY
         BPL   L020365
         DEX
L020365  PHX
         PHA
         LDX   L0B001C
         LDA   L0B001A
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         JSL   L010922
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $E8
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $F5
         CLC
         ADC   #$00FE
         LDX   $F7
         BCC   L0203A1
         INX
L0203A1  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDX   $FF
         LDA   $FD
         LDY   #$0004
         PHA
         TXA
         STA   [$EA],Y
         PLA
         LDY   #$0002
         STA   [$EA],Y
         PEI   $FB
         PEI   $F9
         JSL   L02004C
         PLY
         PLY
         STA   $E6
         LDA   $E6
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $F5
         CLC
         ADC   #$0002
         LDX   $F7
         BCC   L0203DC
         INX
L0203DC  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         PHX
         PHA
         LDA   $E8
         PHA
         LDA   #$000A
         CLC
         JSL   L010AAE
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   $F5
         CLC
         ADC   #$00FE
         LDX   $F7
         BCC   L02040C
         INX
L02040C  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         PLA
         PLX
         LDY   #$0008
         PHA
         TXA
         STA   [$EA],Y
         PLA
         LDY   #$0006
         STA   [$EA],Y
         LDA   $E8
         LDX   #$0000
         TAY
         BPL   L02042E
         DEX
L02042E  PEA   $0000
         PEA   $000A
         CLC
         JSL   L010AF3
         LDA   $F5
         CLC
         ADC   #$00FE
         LDX   $F7
         BCC   L020444
         INX
L020444  JSL   L010922
         LDA   $E6
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   $F5
         CLC
         ADC   #$0002
         LDX   $F7
         BCC   L02045C
         INX
L02045C  JSL   L010922
         PLA
         PLX
         STA   $EA
         STX   $EC
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$EA],Y
         PLA
         STA   [$EA]
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L02047A  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$FBDC
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$FBDE
         PHA
         JSL   L0204EF
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$FBDE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBE4
         PHA
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L0211D5
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBDE
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBE4
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
         LDX   #$0000
         TDC
         CLC
         ADC   #$FBE4
         STA   $EE
         STX   $F0
         LDY   #$000F
         LDA   [$EE],Y
         TAY
         TSC
         CLC
         ADC   #$0516
         TCS
         TYA
         PLD
         RTL

L0204EF  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         LDA   #$0001
         LDY   #$0004
         STA   [$FD],Y
         LDA   $FD
         CLC
         ADC   #$0006
         LDX   $FF
         BCC   L02050D
         INX
L02050D  CLC
         ADC   #$0011
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
         STA   $F2
         STX   $F4
         LDX   #$0000
         LDA   #$0000
         LDY   #$0006
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0004
         STA   [$F2],Y
         LDA   #$0000
         LDY   #$0358
         STA   [$FD],Y
         STZ   $F0
         BRA   L020574
L02054D  LDA   $F0
         LDX   #$0000
         PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$035A
         LDX   $FF
         BCC   L02055F
         INX
L02055F  JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         SEP   #$20
         STA   [$F2]
         REP   #$20
         INC   $F0
L020574  LDA   $F0
         SEC
         SBC   #$00C8
         BVS   L02057F
         EOR   #$8000
L02057F  BPL   L02054D
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L020589  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E8
         TCS
         LDY   #$0358
         LDA   [$FD],Y
         LDX   #$0000
         TAY
         BPL   L0205A0
         DEX
L0205A0  PHX
         PHA
         LDA   $FD
         CLC
         ADC   #$035A
         LDX   $FF
         BCC   L0205AD
         INX
L0205AD  JSL   L010922
         PLA
         PLX
         LDY   #$000B
         PHA
         TXA
         STA   [$F5],Y
         PLA
         LDY   #$0009
         STA   [$F5],Y
         PEI   $FB
         PEI   $F9
         LDY   #$000B
         LDA   [$F5],Y
         TAX
         LDY   #$0009
         LDA   [$F5],Y
         PHX
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         CLC
         ADC   #$0001
         PHA
         LDY   #$0358
         LDA   [$FD],Y
         PLX
         STX   $EE
         CLC
         ADC   $EE
         LDY   #$0358
         STA   [$FD],Y
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L020600  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STX   $F0
         STA   $EE
         LDY   #$0004
         LDA   [$FD],Y
         INC
         LDY   #$0004
         STA   [$FD],Y
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STA   $F2
         STX   $F4
         LDY   #$0006
         LDA   [$F2],Y
         TAX
         LDY   #$0004
         LDA   [$F2],Y
         JSL   L010B98
         BEQ   L02066A
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STA   $F2
         STX   $F4
         LDY   #$0006
         LDA   [$F2],Y
         TAX
         LDY   #$0004
         LDA   [$F2],Y
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         BRA   L0206BB
L02066A  LDY   #$0004
         LDA   [$FD],Y
         LDX   #$0000
         TAY
         BPL   L020676
         DEX
L020676  PEA   $0000
         PEA   $0011
         CLC
         JSL   L010AF3
         LDA   $FD
         CLC
         ADC   #$0006
         LDX   $FF
         BCC   L02068C
         INX
L02068C  JSL   L010922
         PLA
         PLX
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
         STA   $F2
         STX   $F4
         LDX   #$0000
         LDA   #$0000
         LDY   #$0006
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0004
         STA   [$F2],Y
L0206BB  LDX   $F0
         LDA   $EE
         TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L0206C9  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDA   #$0000
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDX   #$0000
         LDA   #$0000
         LDY   #$000B
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0009
         STA   [$F9],Y
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDX   $FB
         LDA   $F9
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         LDY   #$0004
         LDA   [$FD],Y
         DEC
         LDY   #$0004
         STA   [$FD],Y
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L020739  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E9
         TCS
         LDY   #$0008
         LDA   [$F9],Y
         SEP   #$20
         STA   $ED
         REP   #$20
         LDA   $ED
         AND   #$00FF
         CMP   #$0000
         BNE   L02075C
         BRL   L020EEE
L02075C  LDA   $ED
         AND   #$00FF
         SEC
         SBC   #$0001
         BVS   L02076A
         EOR   #$8000
L02076A  BMI   L02076F
         BRL   L02099C
L02076F  LDA   $ED
         AND   #$00FF
         SEC
         SBC   #$0006
         BEQ   L020784
         BVS   L02077F
         EOR   #$8000
L02077F  BPL   L020784
         BRL   L02099C
L020784  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L0207B3
         PEI   $FF
         PEI   $FD
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L0207B3  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L0207E8
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L0207E8  LDA   $ED
         AND   #$00FF
         BRL   L02098B
L0207F0  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $EE
         CMP   $EE
         BEQ   L020822
         LDA   #$0000
         BRA   L020825
L020822  LDA   #$0001
L020825  LDY   #$000F
         STA   [$F9],Y
         BRL   L020999
L02082D  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $EE
         CMP   $EE
         BNE   L02085F
         LDA   #$0000
         BRA   L020862
L02085F  LDA   #$0001
L020862  LDY   #$000F
         STA   [$F9],Y
         BRL   L020999
L02086A  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $EE
         SEC
         SBC   $EE
         BEQ   L02089F
         BVS   L02089D
         EOR   #$8000
L02089D  BMI   L0208A4
L02089F  LDA   #$0000
         BRA   L0208A7
L0208A4  LDA   #$0001
L0208A7  LDY   #$000F
         STA   [$F9],Y
         BRL   L020999
L0208AF  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $EE
         SEC
         SBC   $EE
         BVS   L0208E0
         EOR   #$8000
L0208E0  BPL   L0208E7
         LDA   #$0000
         BRA   L0208EA
L0208E7  LDA   #$0001
L0208EA  LDY   #$000F
         STA   [$F9],Y
         BRL   L020999
L0208F2  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $EE
         SEC
         SBC   $EE
         BVS   L020923
         EOR   #$8000
L020923  BMI   L02092A
         LDA   #$0000
         BRA   L02092D
L02092A  LDA   #$0001
L02092D  LDY   #$000F
         STA   [$F9],Y
         BRL   L020999
L020935  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $EE
         SEC
         SBC   $EE
         BEQ   L02096F
         BVS   L020968
         EOR   #$8000
L020968  BPL   L02096F
         LDA   #$0000
         BRA   L020972
L02096F  LDA   #$0001
L020972  LDY   #$000F
         STA   [$F9],Y
         BRL   L020999
L02097A  BRL   L020999
L02097D  DA    L0207F0
         DA    L02082D
         DA    L02086A
         DA    L0208AF
         DA    L0208F2
         DA    L020935
         DA    L02097A
L02098B  DEC
         CMP   #$0006
         BCC   L020994
         LDA   #$0006
L020994  ASL
         TAX
         JMP   (L02097D,X)

L020999  BRL   L020EEE
L02099C  LDA   $ED
         AND   #$00FF
         CMP   #$0007
         BNE   L020A01
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L0209DB
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L0209DB  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000F
         LDA   [$EE],Y
         BEQ   L0209F6
         LDA   #$0000
         BRA   L0209F9
L0209F6  LDA   #$0001
L0209F9  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020A01  LDA   $ED
         AND   #$00FF
         CMP   #$0008
         BEQ   L020A18
         LDA   $ED
         AND   #$00FF
         CMP   #$0009
         BEQ   L020A18
         BRL   L020B13
L020A18  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L020A47
         PEI   $FF
         PEI   $FD
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L020A47  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L020A7C
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L020A7C  LDA   $ED
         AND   #$00FF
         BRL   L020AFF
L020A84  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000F
         LDA   [$EE],Y
         BNE   L020AB2
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000F
         LDA   [$EE],Y
         BNE   L020AB2
         LDA   #$0000
         BRA   L020AB5
L020AB2  LDA   #$0001
L020AB5  LDY   #$000F
         STA   [$F9],Y
         BRL   L020B10
L020ABD  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000F
         LDA   [$EE],Y
         BEQ   L020AE6
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000F
         LDA   [$EE],Y
         BNE   L020AEB
L020AE6  LDA   #$0000
         BRA   L020AEE
L020AEB  LDA   #$0001
L020AEE  LDY   #$000F
         STA   [$F9],Y
         BRL   L020B10
L020AF6  BRL   L020B10
L020AF9  DA    L020A84
         DA    L020ABD
         DA    L020AF6
L020AFF  SEC
         SBC   #$0008
         CMP   #$0002
         BCC   L020B0B
         LDA   #$0002
L020B0B  ASL
         TAX
         JMP   (L020AF9,X)

L020B10  BRL   L020EEE
L020B13  LDA   $ED
         AND   #$00FF
         SEC
         SBC   #$000A
         BVS   L020B21
         EOR   #$8000
L020B21  BMI   L020B26
         BRL   L020CCC
L020B26  LDA   $ED
         AND   #$00FF
         SEC
         SBC   #$000D
         BEQ   L020B3B
         BVS   L020B36
         EOR   #$8000
L020B36  BPL   L020B3B
         BRL   L020CCC
L020B3B  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010B98
         BEQ   L020B80
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L020B80
         PEI   $FF
         PEI   $FD
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L020B80  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L020BB5
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L020BB5  LDA   $ED
         AND   #$00FF
         BRL   L020CB8
L020BBD  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PLX
         STX   $F2
         CLC
         ADC   $F2
         LDY   #$000D
         STA   [$F9],Y
         BRL   L020CC9
L020BF1  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010B98
         BEQ   L020C1C
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         STA   $EB
         BRA   L020C1E
L020C1C  STZ   $EB
L020C1E  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDA   $EB
         PLX
         STX   $F2
         SEC
         SBC   $F2
         LDY   #$000D
         STA   [$F9],Y
         BRL   L020CC9
L020C43  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         SEC
         JSL   L010AAE
         PLA
         LDY   #$000D
         STA   [$F9],Y
         BRL   L020CC9
L020C77  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000D
         LDA   [$EE],Y
         SEC
         JSL   L01092D
         PLY
         LDY   #$000D
         STA   [$F9],Y
         BRL   L020CC9
L020CAB  BRL   L020CC9
L020CAE  DA    L020BBD
         DA    L020BF1
         DA    L020C43
         DA    L020C77
         DA    L020CAB
L020CB8  SEC
         SBC   #$000A
         CMP   #$0004
         BCC   L020CC4
         LDA   #$0004
L020CC4  ASL
         TAX
         JMP   (L020CAE,X)

L020CC9  BRL   L020EEE
L020CCC  LDA   $ED
         AND   #$00FF
         SEC
         SBC   #$000E
         BVS   L020CDA
         EOR   #$8000
L020CDA  BMI   L020CDF
         BRL   L020EEE
L020CDF  LDA   $ED
         AND   #$00FF
         SEC
         SBC   #$0013
         BEQ   L020CF4
         BVS   L020CEF
         EOR   #$8000
L020CEF  BPL   L020CF4
         BRL   L020EEE
L020CF4  LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L020D23
         PEI   $FF
         PEI   $FD
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L020D23  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0008
         LDA   [$EE],Y
         AND   #$00FF
         CMP   #$0000
         BEQ   L020D58
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         JSL   L020739
         PLY
         PLY
         PLY
         PLY
L020D58  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000B
         LDA   [$EE],Y
         TAX
         LDY   #$0009
         LDA   [$EE],Y
         JSL   L010B98
         BNE   L020DB0
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000B
         LDA   [$EE],Y
         TAX
         LDY   #$0009
         LDA   [$EE],Y
         JSL   L010B98
         BNE   L020DA9
         STZ   $EB
         BRA   L020DAE
L020DA9  LDA   #$FFFF
         STA   $EB
L020DAE  BRA   L020E1E
L020DB0  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000B
         LDA   [$EE],Y
         TAX
         LDY   #$0009
         LDA   [$EE],Y
         JSL   L010B98
         BNE   L020DDF
         LDA   #$0001
         STA   $EB
         BRA   L020E1E
L020DDF  LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$000B
         LDA   [$EE],Y
         TAX
         LDY   #$0009
         LDA   [$EE],Y
         PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         STA   $EE
         STX   $F0
         LDY   #$000B
         LDA   [$EE],Y
         TAX
         LDY   #$0009
         LDA   [$EE],Y
         PHX
         PHA
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         STA   $EB
L020E1E  LDA   $ED
         AND   #$00FF
         BRL   L020EDD
L020E26  LDA   $EB
         CMP   #$0000
         BEQ   L020E32
         LDA   #$0000
         BRA   L020E35
L020E32  LDA   #$0001
L020E35  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020E3D  LDA   $EB
         CMP   #$0000
         BNE   L020E49
         LDA   #$0000
         BRA   L020E4C
L020E49  LDA   #$0001
L020E4C  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020E54  LDA   $EB
         SEC
         SBC   #$0000
         BVS   L020E5F
         EOR   #$8000
L020E5F  BPL   L020E66
         LDA   #$0000
         BRA   L020E69
L020E66  LDA   #$0001
L020E69  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020E71  LDA   $EB
         SEC
         SBC   #$0000
         BEQ   L020E80
         BVS   L020E7E
         EOR   #$8000
L020E7E  BMI   L020E85
L020E80  LDA   #$0000
         BRA   L020E88
L020E85  LDA   #$0001
L020E88  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020E90  LDA   $EB
         SEC
         SBC   #$0000
         BEQ   L020EA4
         BVS   L020E9D
         EOR   #$8000
L020E9D  BPL   L020EA4
         LDA   #$0000
         BRA   L020EA7
L020EA4  LDA   #$0001
L020EA7  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020EAF  LDA   $EB
         SEC
         SBC   #$0000
         BVS   L020EBA
         EOR   #$8000
L020EBA  BMI   L020EC1
         LDA   #$0000
         BRA   L020EC4
L020EC1  LDA   #$0001
L020EC4  LDY   #$000F
         STA   [$F9],Y
         BRL   L020EEE
L020ECC  BRL   L020EEE
L020ECF  DA    L020E26
         DA    L020E3D
         DA    L020E54
         DA    L020E71
         DA    L020E90
         DA    L020EAF
         DA    L020ECC
L020EDD  SEC
         SBC   #$000E
         CMP   #$0006
         BCC   L020EE9
         LDA   #$0006
L020EE9  ASL
         TAX
         JMP   (L020ECF,X)

L020EEE  LDA   #$0000
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         JSL   L010B98
         BEQ   L020F26
         PEI   $FF
         PEI   $FD
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         JSL   L0206C9
         PLY
         PLY
         PLY
         PLY
L020F26  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         JSL   L010B98
         BEQ   L020F58
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         JSL   L0206C9
         PLY
         PLY
         PLY
         PLY
L020F58  LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDX   #$0000
         LDA   #$0000
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         TSC
         CLC
         ADC   #$0009
         TCS
         PLD
         RTL

L020F83  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00E1
         TCS
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDX   #$0000
         LDA   #$0000
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDA   #$0000
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         LDY   #$000B
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0009
         STA   [$F9],Y
         LDA   #$0000
         LDY   #$000D
         STA   [$F9],Y
         LDA   #$0000
         LDY   #$000F
         STA   [$F9],Y
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E3
         LDA   $E3
         LDX   #$0000
         TAY
         BPL   L020FFD
         DEX
L020FFD  PHX
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
         CMP   #$007E
         BNE   L02106F
         LDA   #$0007
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDA   [$F5]
         INC
         STA   [$F5]
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L020F83
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         BRL   L0211CD
L02106F  LDA   $E5
         AND   #$00FF
         CMP   #$0028
         BNE   L0210D9
         LDA   [$F5]
         INC
         STA   [$F5]
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L0211D5
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E3
         LDA   $E3
         LDX   #$0000
         TAY
         BPL   L0210B7
         DEX
L0210B7  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0029
         BNE   L0210D6
         LDA   [$F5]
         INC
         STA   [$F5]
L0210D6  BRL   L0211CD
L0210D9  LDA   $E5
         AND   #$00FF
         CMP   #$0029
         BEQ   L021101
         LDA   $E5
         AND   #$00FF
         CMP   #$003D
         BEQ   L021101
         LDA   $E5
         AND   #$00FF
         CMP   #$003C
         BEQ   L021101
         LDA   $E5
         AND   #$00FF
         CMP   #$003E
         BNE   L021104
L021101  BRL   L0211CD
L021104  PEA   ^L0C253E
         PEA   L0C253E
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L024912
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0246BF
         PLY
         PLY
         LDY   #$000D
         STA   [$F9],Y
         LDY   #$000D
         LDA   [$F9],Y
         LDY   #$000F
         STA   [$F9],Y
         LDA   L0B0084
         BNE   L021147
         BRL   L0211CD
L021147  LDAL  L0C10BE
         AND   #$00FF
         CMP   #$0022
         BEQ   L02115F
         LDAL  L0C10BE
         AND   #$00FF
         CMP   #$0027
         BNE   L021195
L02115F  PEA   $0001
         PEA   $0000
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEA   $0001
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0001
         PHA
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
L021195  PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L024A4A
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEI   $FB
         PEI   $F9
         JSL   L020589
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   L0B0082
         LDY   #$000D
         STA   [$F9],Y
         LDY   #$000D
         LDA   [$F9],Y
         LDY   #$000F
         STA   [$F9],Y
L0211CD  TSC
         CLC
         ADC   #$0009
         TCS
         PLD
         RTL

L0211D5  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00D7
         TCS
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L0215A2
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         SEP   #$20
         STZ   $DD
         REP   #$20
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $D9
         LDA   $D9
         LDX   #$0000
         TAY
         BPL   L02122F
         DEX
L02122F  PHX
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
         STA   $DC
         REP   #$20
         LDA   $D9
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L021254
         DEX
L021254  PHX
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
         STA   $DB
         REP   #$20
         LDA   $DC
         AND   #$00FF
         CMP   #$003D
         BEQ   L0212C2
         LDA   $DC
         AND   #$00FF
         CMP   #$003E
         BEQ   L0212C2
         LDA   $DC
         AND   #$00FF
         CMP   #$003C
         BEQ   L0212C2
         LDA   $DC
         AND   #$00FF
         CMP   #$0053
         BEQ   L0212A1
         LDA   $DC
         AND   #$00FF
         CMP   #$0073
         BEQ   L0212A1
         BRL   L02159A
L0212A1  LDA   $DB
         AND   #$00FF
         CMP   #$003C
         BEQ   L0212C2
         LDA   $DB
         AND   #$00FF
         CMP   #$003E
         BEQ   L0212C2
         LDA   $DB
         AND   #$00FF
         CMP   #$003D
         BEQ   L0212C2
         BRL   L02159A
L0212C2  LDA   [$F5]
         INC
         STA   [$F5]
         LDA   [$F5]
         STA   $D9
         LDA   $DC
         AND   #$00FF
         CMP   #$003D
         BNE   L0212E1
         LDA   #$0001
         SEP   #$20
         STA   $DD
         REP   #$20
         BRL   L0214A1
L0212E1  LDA   $DC
         AND   #$00FF
         CMP   #$003C
         BNE   L02134C
         LDA   $D9
         LDX   #$0000
         TAY
         BPL   L0212F4
         DEX
L0212F4  PHX
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
         STA   $DC
         REP   #$20
         LDA   $DC
         AND   #$00FF
         CMP   #$003E
         BNE   L021326
         LDA   #$0002
         SEP   #$20
         STA   $DD
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L021349
L021326  LDA   $DC
         AND   #$00FF
         CMP   #$003D
         BNE   L021340
         LDA   #$0005
         SEP   #$20
         STA   $DD
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L021349
L021340  LDA   #$0003
         SEP   #$20
         STA   $DD
         REP   #$20
L021349  BRL   L0214A1
L02134C  LDA   $DC
         AND   #$00FF
         CMP   #$003E
         BNE   L021395
         LDA   $D9
         LDX   #$0000
         TAY
         BPL   L02135F
         DEX
L02135F  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$003D
         BNE   L021389
         LDA   #$0006
         SEP   #$20
         STA   $DD
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L021392
L021389  LDA   #$0004
         SEP   #$20
         STA   $DD
         REP   #$20
L021392  BRL   L0214A1
L021395  LDA   $DC
         AND   #$00FF
         CMP   #$0053
         BEQ   L0213AC
         LDA   $DC
         AND   #$00FF
         CMP   #$0073
         BEQ   L0213AC
         BRL   L0214A1
L0213AC  LDA   $D9
         LDX   #$0000
         TAY
         BPL   L0213B5
         DEX
L0213B5  PHX
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
         STA   $DC
         REP   #$20
         LDA   $DC
         AND   #$00FF
         CMP   #$003D
         BNE   L0213E8
         LDA   [$F5]
         INC
         STA   [$F5]
         LDA   #$000E
         SEP   #$20
         STA   $DD
         REP   #$20
         BRL   L0214A1
L0213E8  LDA   $DC
         AND   #$00FF
         CMP   #$003C
         BNE   L02145B
         LDA   [$F5]
         INC
         STA   [$F5]
         LDA   [$F5]
         STA   $D9
         LDA   $D9
         LDX   #$0000
         TAY
         BPL   L021404
         DEX
L021404  PHX
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
         STA   $DC
         REP   #$20
         LDA   $DC
         AND   #$00FF
         CMP   #$003E
         BNE   L021436
         LDA   #$000F
         SEP   #$20
         STA   $DD
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L021459
L021436  LDA   $DC
         AND   #$00FF
         CMP   #$003D
         BNE   L021450
         LDA   #$0012
         SEP   #$20
         STA   $DD
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L021459
L021450  LDA   #$0010
         SEP   #$20
         STA   $DD
         REP   #$20
L021459  BRA   L0214A1
L02145B  LDA   $DC
         AND   #$00FF
         CMP   #$003E
         BNE   L0214A1
         LDA   $D9
         LDX   #$0000
         TAY
         BPL   L02146E
         DEX
L02146E  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$003D
         BNE   L021498
         LDA   #$0013
         SEP   #$20
         STA   $DD
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRA   L0214A1
L021498  LDA   #$0011
         SEP   #$20
         STA   $DD
         REP   #$20
L0214A1  PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $E0
         STA   $DE
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $E4
         STA   $E2
         PEI   $FF
         PEI   $FD
         PEI   $E4
         PEI   $E2
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L0215A2
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         LDY   #$0002
         PHA
         TXA
         STA   [$DE],Y
         PLA
         STA   [$DE]
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         LDY   #$0006
         PHA
         TXA
         STA   [$DE],Y
         PLA
         LDY   #$0004
         STA   [$DE],Y
         LDY   #$0008
         LDA   [$F9],Y
         SEP   #$20
         LDY   #$0008
         STA   [$DE],Y
         REP   #$20
         LDY   #$000B
         LDA   [$F9],Y
         TAX
         LDY   #$0009
         LDA   [$F9],Y
         LDY   #$000B
         PHA
         TXA
         STA   [$DE],Y
         PLA
         LDY   #$0009
         STA   [$DE],Y
         LDY   #$000D
         LDA   [$F9],Y
         LDY   #$000D
         STA   [$DE],Y
         LDY   #$000F
         LDA   [$F9],Y
         LDY   #$000F
         STA   [$DE],Y
         LDX   $E0
         LDA   $DE
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDX   $E4
         LDA   $E2
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDA   $DD
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         LDY   #$000B
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0009
         STA   [$F9],Y
         LDA   #$0000
         LDY   #$000D
         STA   [$F9],Y
         LDA   #$0000
         LDY   #$000F
         STA   [$F9],Y
L02159A  TSC
         CLC
         ADC   #$0013
         TCS
         PLD
         RTL

L0215A2  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00D2
         TCS
         SEP   #$20
         STZ   $E3
         REP   #$20
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E0
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L0215D0
         DEX
L0215D0  PHX
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
         CMP   #$002B
         BNE   L0215F7
         LDA   [$F5]
         INC
         STA   [$F5]
L0215F7  LDA   $E5
         AND   #$00FF
         CMP   #$002D
         BEQ   L021604
         BRL   L021690
L021604  LDA   #$0001
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDA   #$000B
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         LDY   #$000B
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0009
         STA   [$F9],Y
         LDA   #$0000
         LDY   #$000D
         STA   [$F9],Y
         LDA   #$0000
         LDY   #$000F
         STA   [$F9],Y
         PEI   $FF
         PEI   $FD
         LDY   #$0006
         LDA   [$F9],Y
         TAX
         LDY   #$0004
         LDA   [$F9],Y
         PHX
         PHA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L0215A2
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         BRL   L0219DE
L021690  PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $DE
         STA   $DC
         PEI   $FF
         PEI   $FD
         PEI   $DE
         PEI   $DC
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L0219E6
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E0
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L0216D7
         DEX
L0216D7  PHX
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
         CMP   #$002B
         BNE   L021713
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000A
         SEP   #$20
         STA   $E2
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L0217C5
L021713  LDA   $E5
         AND   #$00FF
         CMP   #$002D
         BNE   L021737
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000B
         SEP   #$20
         STA   $E2
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L0217C5
L021737  LDA   $E5
         AND   #$00FF
         CMP   #$004F
         BEQ   L02174B
         LDA   $E5
         AND   #$00FF
         CMP   #$006F
         BNE   L0217BF
L02174B  LDA   [$F5]
         CLC
         ADC   #$0001
         STA   $E0
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L02175C
         DEX
L02175C  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0052
         BEQ   L02179E
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L02177F
         DEX
L02177F  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0072
         BEQ   L02179E
         LDA   #$0000
         BRA   L0217A1
L02179E  LDA   #$0001
L0217A1  BEQ   L0217BF
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$0008
         SEP   #$20
         STA   $E2
         REP   #$20
         LDA   [$F5]
         CLC
         ADC   #$0002
         STA   [$F5]
         BRA   L0217C5
L0217BF  SEP   #$20
         STZ   $E4
         REP   #$20
L0217C5  LDA   $E4
         AND   #$00FF
         BNE   L0217CF
         BRL   L02196A
L0217CF  LDX   $DE
         LDA   $DC
         STX   $DA
         STA   $D8
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $DE
         STA   $DC
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $D6
         STA   $D4
         LDX   $DA
         LDA   $D8
         LDY   #$0002
         PHA
         TXA
         STA   [$DC],Y
         PLA
         STA   [$DC]
         LDX   $D6
         LDA   $D4
         LDY   #$0006
         PHA
         TXA
         STA   [$DC],Y
         PLA
         LDY   #$0004
         STA   [$DC],Y
         LDA   $E2
         SEP   #$20
         LDY   #$0008
         STA   [$DC],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         LDY   #$000B
         PHA
         TXA
         STA   [$DC],Y
         PLA
         LDY   #$0009
         STA   [$DC],Y
         LDA   #$0000
         LDY   #$000D
         STA   [$DC],Y
         LDA   #$0000
         LDY   #$000F
         STA   [$DC],Y
         PEI   $FF
         PEI   $FD
         PEI   $D6
         PEI   $D4
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L0219E6
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E0
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L021879
         DEX
L021879  PHX
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
         CMP   #$002B
         BNE   L0218B5
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000A
         SEP   #$20
         STA   $E2
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L021967
L0218B5  LDA   $E5
         AND   #$00FF
         CMP   #$002D
         BNE   L0218D9
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000B
         SEP   #$20
         STA   $E2
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L021967
L0218D9  LDA   $E5
         AND   #$00FF
         CMP   #$004F
         BEQ   L0218ED
         LDA   $E5
         AND   #$00FF
         CMP   #$006F
         BNE   L021961
L0218ED  LDA   [$F5]
         CLC
         ADC   #$0001
         STA   $E0
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L0218FE
         DEX
L0218FE  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0052
         BEQ   L021940
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L021921
         DEX
L021921  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0072
         BEQ   L021940
         LDA   #$0000
         BRA   L021943
L021940  LDA   #$0001
L021943  BEQ   L021961
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$0008
         SEP   #$20
         STA   $E2
         REP   #$20
         LDA   [$F5]
         CLC
         ADC   #$0002
         STA   [$F5]
         BRA   L021967
L021961  SEP   #$20
         STZ   $E4
         REP   #$20
L021967  BRL   L0217C5
L02196A  LDY   #$0002
         LDA   [$DC],Y
         TAX
         LDA   [$DC]
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDY   #$0006
         LDA   [$DC],Y
         TAX
         LDY   #$0004
         LDA   [$DC],Y
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDY   #$0008
         LDA   [$DC],Y
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDY   #$000B
         LDA   [$DC],Y
         TAX
         LDY   #$0009
         LDA   [$DC],Y
         LDY   #$000B
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0009
         STA   [$F9],Y
         LDY   #$000D
         LDA   [$DC],Y
         LDY   #$000D
         STA   [$F9],Y
         LDY   #$000F
         LDA   [$DC],Y
         LDY   #$000F
         STA   [$F9],Y
         PEI   $FF
         PEI   $FD
         PEI   $DE
         PEI   $DC
         JSL   L0206C9
         PLY
         PLY
         PLY
         PLY
L0219DE  TSC
         CLC
         ADC   #$0018
         TCS
         PLD
         RTL

L0219E6  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00D3
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $DF
         STA   $DD
         PEI   $FF
         PEI   $FD
         PEI   $DF
         PEI   $DD
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L020F83
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E1
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021A38
         DEX
L021A38  PHX
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
         CMP   #$002A
         BNE   L021A74
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000C
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L021B81
L021A74  LDA   $E5
         AND   #$00FF
         CMP   #$002F
         BNE   L021A98
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000D
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L021B81
L021A98  LDA   $E5
         AND   #$00FF
         CMP   #$0041
         BEQ   L021AAF
         LDA   $E5
         AND   #$00FF
         CMP   #$0061
         BEQ   L021AAF
         BRL   L021B7B
L021AAF  LDA   [$F5]
         CLC
         ADC   #$0001
         STA   $E1
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021AC0
         DEX
L021AC0  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$004E
         BEQ   L021B02
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021AE3
         DEX
L021AE3  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$006E
         BEQ   L021B02
         LDA   #$0000
         BRA   L021B05
L021B02  LDA   #$0001
L021B05  BEQ   L021B7B
         LDA   [$F5]
         CLC
         ADC   #$0002
         STA   $E1
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021B18
         DEX
L021B18  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0044
         BEQ   L021B5A
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021B3B
         DEX
L021B3B  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0064
         BEQ   L021B5A
         LDA   #$0000
         BRA   L021B5D
L021B5A  LDA   #$0001
L021B5D  BEQ   L021B7B
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$0009
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         CLC
         ADC   #$0003
         STA   [$F5]
         BRA   L021B81
L021B7B  SEP   #$20
         STZ   $E4
         REP   #$20
L021B81  LDA   $E4
         AND   #$00FF
         BNE   L021B8B
         BRL   L021D81
L021B8B  LDX   $DF
         LDA   $DD
         STX   $DB
         STA   $D9
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $DF
         STA   $DD
         PEI   $FF
         PEI   $FD
         JSL   L020600
         PLY
         PLY
         STX   $D7
         STA   $D5
         LDX   $DB
         LDA   $D9
         LDY   #$0002
         PHA
         TXA
         STA   [$DD],Y
         PLA
         STA   [$DD]
         LDX   $D7
         LDA   $D5
         LDY   #$0006
         PHA
         TXA
         STA   [$DD],Y
         PLA
         LDY   #$0004
         STA   [$DD],Y
         LDA   $E3
         SEP   #$20
         LDY   #$0008
         STA   [$DD],Y
         REP   #$20
         LDX   #$0000
         LDA   #$0000
         LDY   #$000B
         PHA
         TXA
         STA   [$DD],Y
         PLA
         LDY   #$0009
         STA   [$DD],Y
         LDA   #$0000
         LDY   #$000D
         STA   [$DD],Y
         LDA   #$0000
         LDY   #$000F
         STA   [$DD],Y
         PEI   $FF
         PEI   $FD
         PEI   $D7
         PEI   $D5
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L020F83
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $F7
         PEI   $F5
         PEI   $F3
         PEI   $F1
         JSL   L02424A
         PLY
         PLY
         PLY
         PLY
         LDA   [$F5]
         STA   $E1
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021C35
         DEX
L021C35  PHX
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
         CMP   #$002A
         BNE   L021C71
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000C
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L021D7E
L021C71  LDA   $E5
         AND   #$00FF
         CMP   #$002F
         BNE   L021C95
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$000D
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         INC
         STA   [$F5]
         BRL   L021D7E
L021C95  LDA   $E5
         AND   #$00FF
         CMP   #$0041
         BEQ   L021CAC
         LDA   $E5
         AND   #$00FF
         CMP   #$0061
         BEQ   L021CAC
         BRL   L021D78
L021CAC  LDA   [$F5]
         CLC
         ADC   #$0001
         STA   $E1
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021CBD
         DEX
L021CBD  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$004E
         BEQ   L021CFF
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021CE0
         DEX
L021CE0  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$006E
         BEQ   L021CFF
         LDA   #$0000
         BRA   L021D02
L021CFF  LDA   #$0001
L021D02  BEQ   L021D78
         LDA   [$F5]
         CLC
         ADC   #$0002
         STA   $E1
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021D15
         DEX
L021D15  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0044
         BEQ   L021D57
         LDA   $E1
         LDX   #$0000
         TAY
         BPL   L021D38
         DEX
L021D38  PHX
         PHA
         LDX   $F3
         LDA   $F1
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         CMP   #$0064
         BEQ   L021D57
         LDA   #$0000
         BRA   L021D5A
L021D57  LDA   #$0001
L021D5A  BEQ   L021D78
         LDA   #$0001
         SEP   #$20
         STA   $E4
         REP   #$20
         LDA   #$0009
         SEP   #$20
         STA   $E3
         REP   #$20
         LDA   [$F5]
         CLC
         ADC   #$0003
         STA   [$F5]
         BRA   L021D7E
L021D78  SEP   #$20
         STZ   $E4
         REP   #$20
L021D7E  BRL   L021B81
L021D81  LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDY   #$0006
         LDA   [$DD],Y
         TAX
         LDY   #$0004
         LDA   [$DD],Y
         LDY   #$0006
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0004
         STA   [$F9],Y
         LDY   #$0008
         LDA   [$DD],Y
         SEP   #$20
         LDY   #$0008
         STA   [$F9],Y
         REP   #$20
         LDY   #$000B
         LDA   [$DD],Y
         TAX
         LDY   #$0009
         LDA   [$DD],Y
         LDY   #$000B
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0009
         STA   [$F9],Y
         LDY   #$000D
         LDA   [$DD],Y
         LDY   #$000D
         STA   [$F9],Y
         LDY   #$000F
         LDA   [$DD],Y
         LDY   #$000F
         STA   [$F9],Y
         PEI   $FF
         PEI   $FD
         PEI   $DF
         PEI   $DD
         JSL   L0206C9
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0017
         TCS
         PLD
         RTL

L021DFD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L021E10  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E2
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $EC
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
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
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $E8
         LDA   $E8
         BRL   L021EF8
L021E5F  LDA   $EC
         LDX   #$0000
         TAY
         BPL   L021E68
         DEX
L021E68  STX   $E6
         STA   $E4
         PHA
         PEI   $E8
         PEI   $E6
         PEI   $E4
         _PostEvent
         BCS   L021E7F
         LDA   #$0000
L021E7F  STAL  L0B0002
         PLA
         BRL   L021F05
L021E87  JSL   L03117F
         LDA   #$0002
         PHA
         LDA   $EC
         SEC
         JSL   L01092D
         PLY
         STA   $EC
         PEI   $EC
         PEI   $EA
         _PosMouse
         BCS   L021EA9
         LDA   #$0000
L021EA9  STAL  L0B0002
         PEA   $0001
         PEA   $0000
         PEI   $EC
         PEI   $EA
         PEA   $8000
         _FakeMouse
         BCS   L021EC6
         LDA   #$0000
L021EC6  STAL  L0B0002
         PHA
         PEI   $E8
         PEA   $0000
         PEA   $0000
         _PostEvent
         BCS   L021EDF
         LDA   #$0000
L021EDF  STAL  L0B0002
         PLA
         JSL   L0311AA
         BRL   L021F05
L021EEB  BRL   L021F05
L021EEE  DA    L021E87
         DA    L021E87
         DA    L021E87
         DA    L021E5F
         DA    L021EEB
L021EF8  CMP   #$0004
         BCC   L021F00
         LDA   #$0004
L021F00  ASL
         TAX
         JMP   (L021EEE,X)

L021F05  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L021F0D  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
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
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         PHA
         LDA   L0B006A
         PLX
         STX   $F2
         SEC
         SBC   $F2
         SEC
         SBC   #$0001
         STA   $EC
         LDA   $EC
         SEC
         SBC   #$0000
         BVS   L021F4D
         EOR   #$8000
L021F4D  BMI   L021F76
         LDA   L0B006C
         SEC
         SBC   #$0004
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADC   #$0800
         CLC
         ADC   $EC
         LDX   #$0000
         TAY
         BPL   L021F6E
         DEX
L021F6E  STX   L0B005C
         STA   L0B005A
         BRA   L021F93
L021F76  LDA   L0B006C
         PHA
         LDA   #$0200
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADC   $EC
         LDX   #$0000
         TAY
         BPL   L021F8D
         DEX
L021F8D  STX   L0B005C
         STA   L0B005A
L021F93  LDA   #L0C1A7A
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
         STZ   L0B0078
         JSL   L0311AA
         PHA
         PEA   $0046
         PEA   $0000
         _FlushEvents
         BCS   L021FD9
         LDA   #$0000
L021FD9  STAL  L0B0002
         PLA
         PEA   ^L0C2548
         PEA   L0C2548
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022000
         PEA   $0004
         JSL   L060851
         PLY
         BRL   L02213A
L022000  PEA   ^L0C254C
         PEA   L0C254C
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022022
         PEA   $0003
         JSL   L060851
         PLY
         BRL   L02213A
L022022  PEA   ^L0C2550
         PEA   L0C2550
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022044
         PEA   $0002
         JSL   L060851
         PLY
         BRL   L02213A
L022044  PEA   ^L0C2556
         PEA   L0C2556
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022066
         PEA   $0001
         JSL   L060851
         PLY
         BRL   L02213A
L022066  PEA   ^L0C255A
         PEA   L0C255A
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0220B2
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
         STA   L0B0076
         PHA
         PEA   $0028
         PEA   $0000
         _FlushEvents
         BCS   L0220A6
         LDA   #$0000
L0220A6  STAL  L0B0002
         PLA
         JSL   L061544
         BRL   L02213A
L0220B2  PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   ^L0C11BB
         PEA   L0C11BB
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
         LDAL  L0C1AB0
         STA   $EC
         LDAL  L0C1AB0
         BNE   L0220EF
         LDA   L0B0082
         CMP   #$0001
         BEQ   L0220EF
         LDA   #$0000
         BRA   L0220F2
L0220EF  LDA   #$0001
L0220F2  STAL  L0C1AB0
         LDA   L0B0082
         CMP   #$0000
         BEQ   L022103
         LDA   #$0000
         BRA   L022106
L022103  LDA   #$0001
L022106  STAL  L0C1AA6
         LDA   #$0001
         STAL  L0C1A9E
         LDA   L0B0082
         STAL  L0C1A9A
         PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L02212B
         LDA   #$0000
L02212B  STAL  L0B0002
         PLA
         JSL   L0618EB
         LDA   $EC
         STAL  L0C1AB0
L02213A  PEA   $0000
         JSL   L06152C
         PLY
         STZ   L0B00C7
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L02214D  PHD
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
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C255F
         PEA   L0C255F
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0221A4
         PEA   ^L0C0F7A
         PEA   L0C0F7A
         PEA   $0000
         PEA   $0000
         PEA   $0280
         PEA   $00C8
         _SetRect
         BCS   L02219D
         LDA   #$0000
L02219D  STAL  L0B0002
         BRL   L02220B
L0221A4  PEA   ^L0C2563
         PEA   L0C2563
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0221D7
         LDA   #L0C0EDA
         LDX   #^L0C0EDA
         PHX
         PHA
         PEA   ^L0C0F7A
         PEA   L0C0F7A
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         BRA   L02220B
L0221D7  PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   ^L0C0F7A
         PEA   L0C0F7A
         JSL   L02502B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
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
L02220B  PEA   $0087
         LDAL  L0C0F7E
         PHA
         LDAL  L0C0F7A
         PHA
         JSL   L0321FD
         PLY
         PLY
         PLY
         LDAL  L0C0F7C
         PHA
         LDAL  L0C0F7A
         CLC
         ADC   L0B0070
         SEC
         SBC   #$0001
         PHA
         _MoveTo
         BCS   L02223D
         LDA   #$0000
L02223D  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022249  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00DE
         TCS
         STZ   $E0
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $EC
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
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
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $E8
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
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
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $E4
         PEI   $E4
         PEI   $E6
         PEI   $E8
         JSL   L03238E
         PLY
         PLY
         PLY
         STA   $E2
         LDA   $EC
         BRL   L022331
L0222D3  LDA   #$0008
         STA   $EC
         PEI   $EC
         PEI   $EA
         PEI   $E2
         _SetColorEntry
         BCS   L0222EA
         LDA   #$0000
L0222EA  STAL  L0B0002
         JSL   L03223A
         BRL   L02233E
L0222F5  LDA   #$0007
         STA   $EC
         PEI   $EC
         PEI   $EA
         PEI   $E2
         _SetColorEntry
         BCS   L02230C
         LDA   #$0000
L02230C  STAL  L0B0002
         JSL   L0322ED
         BRL   L02233E
L022317  PEI   $EC
         PEI   $EA
         PEI   $E2
         _SetColorEntry
         BCS   L022329
         LDA   #$0000
L022329  STAL  L0B0002
         BRA   L02233E
         BRA   L02233E
L022331  CMP   #$0140
         BEQ   L0222D3
         CMP   #$0280
         BEQ   L0222F5
         JMP   L022317

L02233E  TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L022346  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2566
         PEA   L0C2566
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0223A7
         PEA   ^L0C256A
         PEA   L0C256A
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0B005A
         PEA   L0B005A
         JSL   L040655
         PLY
         PLY
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         STA   [$FD]
         BRL   L0224D7
L0223A7  PEA   ^L0C256B
         PEA   L0C256B
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0223D9
         PEA   ^L0B005E
         PEA   L0B005E
         JSL   L040655
         PLY
         PLY
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         STA   [$FD]
         BRL   L0224D7
L0223D9  PEA   ^L0C2571
         PEA   L0C2571
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0223F7
         JSL   L04158E
         BRL   L0224D7
L0223F7  LDAL  L0C10BE
         AND   #$00FF
         CMP   #$002B
         BNE   L022426
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   L0B006E
         CLC
         ADC   L0B0082
         STA   $EC
         PEI   $EC
         JSL   L041610
         PLY
         BRL   L0224D7
L022426  LDAL  L0C10BE
         AND   #$00FF
         CMP   #$002D
         BNE   L02246B
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   L0B006E
         SEC
         SBC   L0B0082
         STA   $EC
L02244B  LDA   L0B006E
         SEC
         SBC   #$0000
         BEQ   L022468
         BVS   L022459
         EOR   #$8000
L022459  BPL   L022468
         LDA   L0B006E
         CMP   $EC
         BEQ   L022468
         JSL   L04158E
         BRA   L02244B
L022468  BRL   L0224D7
L02246B  LDA   L0B0082
         SEC
         SBC   #$0000
         BVS   L022477
         EOR   #$8000
L022477  BMI   L02247C
         BRL   L0224D7
L02247C  LDA   L0B0082
         SEC
         SBC   #$0037
         BVS   L022488
         EOR   #$8000
L022488  BPL   L02248D
         BRL   L0224D7
L02248D  LDA   L0B0082
         SEC
         SBC   L0B006E
         BEQ   L02249D
         BVS   L02249B
         EOR   #$8000
L02249B  BMI   L0224CB
L02249D  LDA   L0B0082
         STA   L0B006E
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
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         STA   [$FD]
         BRA   L0224D7
L0224CB  LDA   L0B0082
         STA   $EC
         PEI   $EC
         JSL   L041610
         PLY
L0224D7  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0224DF  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$FDFE
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
         PEA   ^L0C10BE
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
         JSL   L040E53
         PLY
         PLY
         STA   $CC
         LDA   $CC
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
         STA   $CE
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2576
         PEA   L0C2576
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022596
         LDA   #$0004
         STA   $CA
         BRL   L0225F6
L022596  PEA   ^L0C257A
         PEA   L0C257A
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0225B5
         LDA   #$0003
         STA   $CA
         BRL   L0225F6
L0225B5  PEA   ^L0C257E
         PEA   L0C257E
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0225D3
         LDA   #$0002
         STA   $CA
         BRA   L0225F6
L0225D3  PEA   ^L0C2584
         PEA   L0C2584
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0225F1
         LDA   #$0001
         STA   $CA
         BRA   L0225F6
L0225F1  LDA   L0B0082
         STA   $CA
L0225F6  PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $C8
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00C6
         PHA
         JSL   L024F91
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
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
         STA   $C4
         STZ   $C2
         BRL   L0226FC
L022642  JSL   L040619
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         LDA   $C2
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE80
         JSL   L010922
         LDA   $C2
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE80
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         CLC
         ADC   #$0002
         BCC   L022689
         INX
L022689  PHX
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         LDA   $C2
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
         JSL   L02508B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
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
         LDA   $C2
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$FE00
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
         INC   $C2
L0226FC  LDA   $C2
         SEC
         SBC   $C4
         BVS   L022706
         EOR   #$8000
L022706  BMI   L02270B
         BRL   L022642
L02270B  LDA   $CC
         SEC
         SBC   #$0000
         BVS   L022716
         EOR   #$8000
L022716  BPL   L02274D
         PEA   $0000
         TDC
         CLC
         ADC   #$FE00
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE80
         PHA
         PEI   $C6
         PEA   $0000
         TDC
         CLC
         ADC   #$FF00
         PHA
         PEI   $C4
         PEI   $C8
         PEI   $CA
         PEI   $CE
         PEI   $C0
         PEI   $BE
         JSL   L070581
         TAY
         TSC
         CLC
         ADC   #$001A
         TCS
         TYA
L02274D  TSC
         CLC
         ADC   #$02F4
         TCS
         PLD
         RTL

L022755  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022768  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02277B  ENT
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
         JSL   L0224DF
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

L02279E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         LDA   #$0200
         PHA
         LDA   L0B006A
         SEC
         JSL   L01092D
         PLA
         STA   $EC
         PEA   ^L0B006A
         PEA   L0B006A
         PEA   ^L0C1252
         PEA   L0C1252
         LDA   #$0200
         PHA
         LDA   L0B006A
         SEC
         JSL   L01092D
         PLY
         PHA
         LDA   L0B006C
         PLX
         STX   $F2
         CLC
         ADC   $F2
         PHA
         JSL   L0402DB
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $EC
         STA   L0B006A
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0227F2  ENT
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
         JSL   L022346
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

L022815  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$0084
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
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0086
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         STZ   $EC
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0086
         PHA
         JSL   L023C7E
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$006E
         TCS
         PLD
         RTL

L02286B  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010D87
         PLY
         PLY
         CMP   #$0001
         BEQ   L02289A
         BRL   L022940
L02289A  LDAL  L0C10BE
         AND   #$00FF
         SEC
         SBC   #$0030
         STA   $EC
         LDA   $EC
         SEC
         SBC   #$0009
         BEQ   L0228C6
         BVS   L0228B4
         EOR   #$8000
L0228B4  BPL   L0228C6
         LDA   $EC
         CLC
         ADC   #$0030
         SEC
         SBC   #$0061
         CLC
         ADC   #$000A
         STA   $EC
L0228C6  PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   $EC
         SEC
         SBC   #$0000
         BVS   L0228E1
         EOR   #$8000
L0228E1  BMI   L0228E6
         BRL   L02293D
L0228E6  LDA   $EC
         SEC
         SBC   #$0015
         BVS   L0228F1
         EOR   #$8000
L0228F1  BMI   L02293D
         PEA   $0033
         PEA   ^L0C10BE
         PEA   L0C10BE
         LDA   $EC
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
         JSL   L0111A4
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $EC
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C072F
         LDX   #^L0C072F
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDA   L0B0082
         STA   [$EE]
L02293D  BRL   L022997
L022940  PEI   $FF
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
         BVS   L02295C
         EOR   #$8000
L02295C  BPL   L022997
         LDA   L0B0082
         SEC
         SBC   #$0010
         BEQ   L02296E
         BVS   L02296C
         EOR   #$8000
L02296C  BMI   L022997
L02296E  PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         LDA   L0B0082
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         JSL   L02508B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
L022997  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L02299F  ENT
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
         JSL   L041503
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

L0229C2  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   $0000
         JSL   L030F81
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0229DD  ENT
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
         PEA   ^L0B009C
         PEA   L0B009C
         JSL   L024F91
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

L022A0A  ENT
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
         JSL   L02047A
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022A34
         PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         STA   [$FD]
L022A34  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022A3C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E4
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L02508B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L030A13
         PLY
         PLY
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L022A7B  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         JSL   L03096B
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022A92  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E4
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L02508B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
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
         PHA
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
         JSL   L0613E4
         PLY
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L022B01  ENT
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
         JSL   L02214D
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

L022B24  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         LDA   L0B008E
         STA   $EC
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2588
         PEA   L0C2588
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L022B68
         LDA   $EC
         BEQ   L022B63
         JSL   L030EB7
L022B63  STZ   L0B008E
         BRA   L022B9A
L022B68  LDA   L0B0082
         STA   $EA
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         STA   $E8
         LDA   $EC
         BEQ   L022B8A
         JSL   L030EB7
L022B8A  PEI   $E8
         PEI   $EA
         JSL   L030D77
         PLY
         PLY
         LDA   #$0001
         STA   L0B008E
L022B9A  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L022BA2  ENT
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
         PEA   ^L0B009E
         PEA   L0B009E
         JSL   L024F91
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

L022BCF  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         LDA   L0B0098
         STA   $EC
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   ^L0B0098
         PEA   L0B0098
         JSL   L024F91
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   L0B0098
         CMP   $EC
         BEQ   L022C3B
         PHA
         _GetTextFace
         BCS   L022C0D
         LDA   #$0000
L022C0D  STAL  L0B0002
         PLA
         STA   $EA
         LDA   L0B0098
         BEQ   L022C22
         LDA   $EA
         ORA   #$0001
         STA   $EA
         BRA   L022C29
L022C22  LDA   $EA
         AND   #$00FE
         STA   $EA
L022C29  PEI   $EA
         _SetTextFace
         BCS   L022C37
         LDA   #$0000
L022C37  STAL  L0B0002
L022C3B  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L022C43  ENT
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
         PEA   ^L0B0096
         PEA   L0B0096
         JSL   L024F91
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

L022C70  ENT
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
         PEA   ^L0B00A0
         PEA   L0B00A0
         JSL   L024F91
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

L022C9D  ENT
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
         PEA   ^L0C1AB0
         PEA   L0C1AB0
         JSL   L024F91
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

L022CCA  ENT
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
         PEA   ^L0B009A
         PEA   L0B009A
         JSL   L024F91
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

L022CF7  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
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
         BPL   L022D1A
         DEX
L022D1A  STX   L0B0060
         STA   L0B005E
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022D28  ENT
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
         PHA
         JSL   L041445
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022D54  ENT
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
         PEA   ^L0C1AA4
         PEA   L0C1AA4
         JSL   L024F91
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

L022D81  ENT
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
         PHA
         JSL   L06152C
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022DAD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   $0001
         JSL   L030F81
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022DC8  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
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
         PHA
         JSL   L06135C
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L022DF4  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
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
         STA   $EC
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   $EC
         SEC
         SBC   #$0000
         BVS   L022E45
         EOR   #$8000
L022E45  BMI   L022E4A
         BRL   L022EFE
L022E4A  LDA   $EC
         SEC
         SBC   #$0010
         BVS   L022E55
         EOR   #$8000
L022E55  BPL   L022E5A
         BRL   L022EFE
L022E5A  LDA   $EC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         PEI   $EA
         PEI   $E8
         LDA   $EA
         CLC
         ADC   #$0010
         PHA
         LDA   $E8
         CLC
         ADC   #$0008
         PHA
         _SetRect
         BCS   L022E8C
         LDA   #$0000
L022E8C  STAL  L0B0002
         PEA   $0002
         PEA   $0001
         _SetPenSize
         BCS   L022EA2
         LDA   #$0000
L022EA2  STAL  L0B0002
         LDA   $EC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         _FrameRect
         BCS   L022EC6
         LDA   #$0000
L022EC6  STAL  L0B0002
         PEA   $0001
         PEA   $0001
         _SetPenSize
         BCS   L022EDC
         LDA   #$0000
L022EDC  STAL  L0B0002
         LDA   $EA
         CLC
         ADC   #$001A
         PHA
         LDA   $E8
         CLC
         ADC   #$0008
         PHA
         _MoveTo
         BCS   L022EFA
         LDA   #$0000
L022EFA  STAL  L0B0002
L022EFE  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L022F06  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         JSL   L060614
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L022F1D  ENT
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
         JSL   L021E10
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

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L022F5D
         LDA   #$0000
L022F5D  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDAL  L0C0F7C
         CLC
         ADC   $EC
         PHA
         LDAL  L0C0F7A
         CLC
         ADC   $EA
         PHA
         _MoveTo
         BCS   L022FA3
         LDA   #$0000
L022FA3  STAL  L0B0002
         LDA   #$0001
         STA   L0B00A2
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L022FB5  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L022FD2
         LDA   #$0000
L022FD2  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   L0B0072
         PHA
         LDA   $EC
         SEC
         JSL   L010AAE
         LDAL  L0C0F7C
         PLX
         STX   $F2
         CLC
         ADC   $F2
         PHA
         LDA   L0B0070
         PHA
         LDA   $EA
         CLC
         ADC   #$0001
         SEC
         JSL   L010AAE
         LDAL  L0C0F7A
         PLX
         STX   $F2
         CLC
         ADC   $F2
         SEC
         SBC   #$0001
         PHA
         _MoveTo
         BCS   L02303C
         LDA   #$0000
L02303C  STAL  L0B0002
         TSC
         CLC
         ADC   #$000A
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
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L023065
         LDA   #$0000
L023065  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   L0B0072
         PHA
         LDA   $EC
         SEC
         JSL   L010AAE
         LDA   L0B0070
         PHA
         LDA   $EA
         SEC
         JSL   L010AAE
         PLA
         SEC
         SBC   #$0001
         PHA
         _MoveTo
         BCS   L0230B7
         LDA   #$0000
L0230B7  STAL  L0B0002
         LDA   #$0001
         STA   L0B00A2
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L0230C9  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E4
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   $EC
         BRL   L023239
L0230FF  PEI   $EA
         JSL   L023D2A
         PLY
         BRL   L023246
L023109  LDA   L0B00A8
         BNE   L023175
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
         BCS   L02312F
         LDA   #$0000
L02312F  STAL  L0B0002
         PLA
         PLX
         STX   $E8
         STA   $E6
         PEA   $4556
         JSL   L021DFD
         PLY
         PEA   $0100
         PEA   $0000
         PEA   $6200
         PEI   $E8
         PEI   $E6
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $E8
         PEI   $E6
         JSL   L04023C
         PLY
         PLY
         PEI   $E8
         PEI   $E6
         _DisposeHandle
         BCS   L023171
         LDA   #$0000
L023171  STAL  L0B0002
L023175  LDA   $EC
         BRL   L0231A3
L02317A  PEI   $EA
         JSL   L0E004A
         PLY
         BRL   L0231B1
L023184  PEI   $EA
         JSL   L0E0058
         PLY
         BRL   L0231B1
L02318E  PEI   $EA
         JSL   L0E0066
         PLY
         BRL   L0231B1
L023198  BRL   L0231B1
L02319B  DA    L02317A
         DA    L023184
         DA    L02318E
         DA    L023198
L0231A3  DEC
         CMP   #$0003
         BCC   L0231AC
         LDA   #$0003
L0231AC  ASL
         TAX
         JMP   (L02319B,X)

L0231B1  BRL   L023246
L0231B4  LDA   L0B00AA
         BNE   L023220
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
         BCS   L0231DA
         LDA   #$0000
L0231DA  STAL  L0B0002
         PLA
         PLX
         STX   $E8
         STA   $E6
         PEA   $4556
         JSL   L021DFD
         PLY
         PEA   $0100
         PEA   $0000
         PEA   $4200
         PEI   $E8
         PEI   $E6
         JSL   L040000
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $E8
         PEI   $E6
         JSL   L04023C
         PLY
         PLY
         PEI   $E8
         PEI   $E6
         _DisposeHandle
         BCS   L02321C
         LDA   #$0000
L02321C  STAL  L0B0002
L023220  PEI   $EA
         JSL   L0E0074
         PLY
         BRL   L023246
L02322A  BRL   L023246
L02322D  DA    L0230FF
         DA    L023109
         DA    L023109
         DA    L023109
         DA    L0231B4
         DA    L02322A
L023239  CMP   #$0005
         BCC   L023241
         LDA   #$0005
L023241  ASL
         TAX
         JMP   (L02322D,X)

L023246  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L02324E  ENT
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
         JSL   L021F0D
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

L023271  ENT
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
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C258C
         PEA   L0C258C
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0232AE
         PEA   $0001
         JSL   L06145F
         PLY
         BRL   L023332
L0232AE  PEA   ^L0C2590
         PEA   L0C2590
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0232D0
         PEA   $0003
         JSL   L06145F
         PLY
         BRL   L023332
L0232D0  PEA   ^L0C2594
         PEA   L0C2594
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L0232F2
         PEA   $0002
         JSL   L06145F
         PLY
         BRL   L023332
L0232F2  PEA   ^L0C259A
         PEA   L0C259A
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L023313
         PEA   $0006
         JSL   L06145F
         PLY
         BRA   L023332
L023313  PEA   ^L0C259F
         PEA   L0C259F
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L023332
         PEA   $0005
         JSL   L06145F
         PLY
L023332  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02333A  ENT
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
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L040728
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L023369  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02337C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00AB
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
         STA   $B5
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
         ADC   #$00BB
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BB
         PHA
         PEA   ^L0C25A3
         PEA   L0C25A3
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BB
         PHA
         JSL   L0244F2
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00B7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00B9
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         JSL   L02508B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0001
         PEI   $B5
         PEI   $B7
         PEI   $B9
         PEA   $0000
         TDC
         CLC
         ADC   #$00BB
         PHA
         JSL   L031F08
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         TSC
         CLC
         ADC   #$0047
         TCS
         PLD
         RTL

L02345E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00AB
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _SetRect
         BCS   L02348A
         LDA   #$0000
L02348A  STAL  L0B0002
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
         STA   $B5
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
         ADC   #$00BB
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BB
         PHA
         PEA   ^L0C25A8
         PEA   L0C25A8
         JSL   L025330
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BB
         PHA
         JSL   L0244F2
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00B7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00B9
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$00AD
         PHA
         PEA   $0000
         PEI   $B5
         PEI   $B7
         PEI   $B9
         PEA   $0000
         TDC
         CLC
         ADC   #$00BB
         PHA
         JSL   L031F08
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         TSC
         CLC
         ADC   #$0047
         TCS
         PLD
         RTL

L023548  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00BA
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
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L070000
         PLY
         PLY
         TSC
         CLC
         ADC   #$0038
         TCS
         PLD
         RTL

L023591  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00BA
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L0703A1
         PLY
         PLY
         TSC
         CLC
         ADC   #$0038
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
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L024F91
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PHA
         _GetTextFace
         BCS   L02360F
         LDA   #$0000
L02360F  STAL  L0B0002
         PLA
         STA   $EA
         LDA   $EC
         BEQ   L023623
         LDA   $EA
         ORA   #$0001
         STA   $EA
         BRA   L02362A
L023623  LDA   $EA
         AND   #$FFFE
         STA   $EA
L02362A  PEI   $EA
         _SetTextFace
         BCS   L023638
         LDA   #$0000
L023638  STAL  L0B0002
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L023644  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L023661
         LDA   #$0000
L023661  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         PHA
         _SetForeColor
         BCS   L023685
         LDA   #$0000
L023685  STAL  L0B0002
         LDA   L0B0082
         PHA
         _SetSolidPenPat
         BCS   L023699
         LDA   #$0000
L023699  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0236A5  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L0236C2
         LDA   #$0000
L0236C2  STAL  L0B0002
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0082
         PHA
         _SetBackColor
         BCS   L0236E6
         LDA   #$0000
L0236E6  STAL  L0B0002
         LDA   L0B0082
         PHA
         _SetSolidBackPat
         BCS   L0236FA
         LDA   #$0000
L0236FA  STAL  L0B0002
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L023706  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00BA
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L040E53
         PLY
         PLY
         TSC
         CLC
         ADC   #$0038
         TCS
         PLD
         RTL

L02374F  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00B8
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00BC
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00BA
         PHA
         JSL   L040ADF
         PLY
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0237C8
         LDA   $BA
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
         LDA   #$0032
         STA   [$EE]
L0237C8  TSC
         CLC
         ADC   #$003A
         TCS
         PLD
         RTL

L0237D0  ENT
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
         JSL   L022249
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

L0237F3  ENT
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
         PEA   $0001
         JSL   L0238B6
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

L02381A  ENT
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
         PEA   $0002
         JSL   L0238B6
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

L023841  ENT
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
         PEA   $0003
         JSL   L0238B6
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

L023868  ENT
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
         PEA   $0004
         JSL   L0238B6
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

L02388F  ENT
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
         PEA   $0000
         JSL   L0238B6
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

L0238B6  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00DE
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         JSL   L024FEE
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L0238F9
         LDA   #$0000
L0238F9  STAL  L0B0002
         LDA   $F7
         BRL   L023984
L023902  PEI   $EA
         PEI   $E8
         _SetPenSize
         BCS   L023912
         LDA   #$0000
L023912  STAL  L0B0002
         BRL   L023991
L023919  PEI   $EA
         PEI   $E8
         _Line
         BCS   L023929
         LDA   #$0000
L023929  STAL  L0B0002
         BRL   L023991
L023930  PEI   $EA
         PEI   $E8
         _LineTo
         BCS   L023940
         LDA   #$0000
L023940  STAL  L0B0002
         BRL   L023991
L023947  PEI   $EA
         PEI   $E8
         _Move
         BCS   L023957
         LDA   #$0000
L023957  STAL  L0B0002
         BRL   L023991
L02395E  PEI   $EA
         PEI   $E8
         _MoveTo
         BCS   L02396E
         LDA   #$0000
L02396E  STAL  L0B0002
         BRL   L023991
L023975  BRL   L023991
L023978  DA    L023902
         DA    L023919
         DA    L023930
         DA    L023947
         DA    L02395E
         DA    L023975
L023984  CMP   #$0005
         BCC   L02398C
         LDA   #$0005
L02398C  ASL
         TAX
         JMP   (L023978,X)

L023991  LDA   #$0001
         STA   L0B00A2
         TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L02399F  ENT
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
         PEA   $0001
         JSL   L023A3B
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

L0239C6  ENT
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
         PEA   $0002
         JSL   L023A3B
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

L0239ED  ENT
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
         PEA   $0003
         JSL   L023A3B
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

L023A14  ENT
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
         PEA   $0004
         JSL   L023A3B
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

L023A3B  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E2
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         JSL   L02508B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0C0CDC
         PEA   L0C0CDC
         _SetPort
         BCS   L023A75
         LDA   #$0000
L023A75  STAL  L0B0002
         LDA   $F7
         BRL   L023B01
L023A7E  PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _FrameRect
         BCS   L023A93
         LDA   #$0000
L023A93  STAL  L0B0002
         BRL   L023B0F
L023A9A  PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _PaintRect
         BCS   L023AAF
         LDA   #$0000
L023AAF  STAL  L0B0002
         BRL   L023B0F
L023AB6  PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         _EraseRect
         BCS   L023ACB
         LDA   #$0000
L023ACB  STAL  L0B0002
         BRL   L023B0F
L023AD2  PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   $0016
         PEA   $0008
         _FrameRRect
         BCS   L023AED
         LDA   #$0000
L023AED  STAL  L0B0002
         BRL   L023B0F
L023AF4  BRL   L023B0F
L023AF7  DA    L023A7E
         DA    L023A9A
         DA    L023AB6
         DA    L023AD2
         DA    L023AF4
L023B01  DEC
         CMP   #$0004
         BCC   L023B0A
         LDA   #$0004
L023B0A  ASL
         TAX
         JMP   (L023AF7,X)

L023B0F  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L023B17  ENT
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
         JSL   L0509EE
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

L023B3A  ENT
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
         JSL   L050000
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

L023B5D  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         LDX   #$0000
         LDA   #$C034
         STX   $EA
         STA   $E8
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
         AND   #$000F
         SEP   #$20
         STA   $EC
         REP   #$20
         LDA   [$E8]
         AND   #$00FF
         AND   #$00F0
         SEP   #$20
         STA   $ED
         REP   #$20
         LDA   $EC
         AND   #$00FF
         PHA
         LDA   $ED
         AND   #$00FF
         PLX
         STX   $F2
         ORA   $F2
         SEP   #$20
         STA   [$E8]
         REP   #$20
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L023BBA  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDA   L0B0066
         CMP   #$1001
         BNE   L023BD2
         LDA   #$0000
         BRA   L023BD6
L023BD2  JSL   L0E002E
L023BD6  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L023BE0  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   [$FD]
         AND   #$00FF
         CMP   #$0025
         BNE   L023BFC
         LDA   #$0001
         BRA   L023BFF
         BRA   L023BFF
L023BFC  LDA   #$0000
L023BFF  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L023C09  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   [$FD]
         AND   #$00FF
         CMP   #$005B
         BNE   L023C25
         LDA   #$0001
         BRA   L023C28
         BRA   L023C28
L023C25  LDA   #$0000
L023C28  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L023C32  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L02008E
         PLY
         PLY
         PLY
         PLY
         STX   $EC
         STA   $EA
         LDA   $EA
         CMP   #$0000
         BNE   L023C69
         LDA   $EC
         CMP   #$0000
         BNE   L023C69
         LDA   #L022755
         LDX   #^L022755
         BRA   L023C74
         BRA   L023C74
L023C69  LDY   #$0004
         LDA   [$EA],Y
         TAX
         LDY   #$0002
         LDA   [$EA],Y
L023C74  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L023C7E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         PEI   $FB
         PEI   $F9
         JSL   L023BE0
         PLY
         PLY
         TAY
         BNE   L023C99
         BRL   L023CF7
L023C99  LDA   #$0001
         STA   [$FD]
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
L023CAE  LDAL  L0C10BE
         AND   #$00FF
         BEQ   L023CF5
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   ^L0C03BB
         PEA   L0C03BB
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L023C32
         PLY
         PLY
         PLY
         PLY
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         JSL   L011145
         PLY
         PLY
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         BRA   L023CAE
L023CF5  BRA   L023D22
L023CF7  PEI   $FB
         PEI   $F9
         JSL   L023C09
         PLY
         PLY
         TAY
         BNE   L023D22
         PEI   $FB
         PEI   $F9
         JSL   L024E6B
         PLY
         PLY
         PEI   $FB
         PEI   $F9
         JSL   L0244F2
         PLY
         PLY
         PEI   $FB
         PEI   $F9
         JSL   L0601C6
         PLY
         PLY
L023D22  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L023D2A  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EC
         TCS
         LDA   $FF
         BRL   L024061
L023D3A  LDA   #$0001
         STA   L0B0092
         JSL   L0311AA
         BRL   L024070
L023D47  STZ   L0B0092
         JSL   L03117F
         BRL   L024070
L023D51  STZ   $F2
         BRA   L023D79
L023D55  PEA   $0000
         PEA   $0008
         LDA   $F2
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C0EF2
         LDX   #^L0C0EF2
         JSL   L010922
         JSL   L025194
         PLY
         PLY
         PLY
         PLY
         INC   $F2
L023D79  LDA   $F2
         SEC
         SBC   #$0010
         BEQ   L023D55
         BVS   L023D86
         EOR   #$8000
L023D86  BPL   L023D55
         JSL   L031208
         BRL   L024070
L023D8F  PEA   $0001
         PEA   $0000
         JSL   L031233
         PLY
         PLY
         BRL   L024070
L023D9E  PEA   ^L0C1188
         PEA   L0C1188
         PEA   ^L0C11BB
         PEA   L0C11BB
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         BRL   L024070
L023DB5  BRL   L024070
L023DB8  JSL   L0E0082
         BRL   L024070
L023DBF  LDAL  L0C0755
         STA   $F0
         LDA   $F0
         SEC
         SBC   #$03E8
         BEQ   L023E1F
         BVS   L023DD2
         EOR   #$8000
L023DD2  BPL   L023E1F
         LDA   #$03E8
         PHA
         LDA   $F0
         SEC
         JSL   L01092D
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #$03E8
         PHA
         LDA   $F0
         SEC
         JSL   L01092D
         PLY
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
         STA   $F4
         STX   $F6
         LDA   #$0001
         SEP   #$20
         STA   [$F4]
         REP   #$20
L023E1F  BRL   L024070
L023E22  LDA   #$0001
         STA   $F2
         BRL   L023E9A
L023E2A  LDA   #$0001
         STA   $F0
         BRA   L023E8B
L023E31  LDA   $F0
         LDX   #$0000
         PHX
         PHA
         LDA   $F2
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
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         BEQ   L023E89
         PEA   $0001
         LDA   $F2
         PHA
         LDA   #$03E8
         SEC
         JSL   L010AAE
         PLA
         CLC
         ADC   $F0
         PHA
         _CheckMItem
         BCS   L023E85
         LDA   #$0000
L023E85  STAL  L0B0002
L023E89  INC   $F0
L023E8B  LDA   $F0
         SEC
         SBC   #$0006
         BVS   L023E96
         EOR   #$8000
L023E96  BPL   L023E31
         INC   $F2
L023E9A  LDA   $F2
         SEC
         SBC   #$0005
         BVS   L023EA5
         EOR   #$8000
L023EA5  BPL   L023E2A
         BRL   L024070
L023EAA  STZ   L0B008A
         BRL   L024070
L023EB0  LDAL  L0C1A86
         PHA
         PEA   $0001
         JSL   L0251CD
         PLY
         PLY
         LDAL  L0C1A84
         PHA
         PEA   $0002
         JSL   L0251CD
         PLY
         PLY
         BRL   L024070
L023ECF  PEA   $0001
         PEA   $0001
         JSL   L031233
         PLY
         PLY
         BRL   L024070
L023EDE  LDA   #$0001
         STAL  L0C1AA2
         BRL   L024070
L023EE8  LDA   #$0001
         STA   L0B00C7
         BRL   L024070
L023EF1  PEA   ^L0C25AD
         PEA   L0C25AD
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   L0B0076
         SEC
         SBC   #$03E8
         BNE   L023F11
         BRL   L023F7A
L023F11  BVS   L023F16
         EOR   #$8000
L023F16  BMI   L023F1B
         BRL   L023F7A
L023F1B  LDA   #$03E8
         PHA
         LDA   L0B0076
         SEC
         JSL   L01092D
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #$03E8
         PHA
         LDA   L0B0076
         SEC
         JSL   L01092D
         PLY
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
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         BEQ   L023F7A
         PEA   ^L0C25AF
         PEA   L0C25AF
         PEA   ^L0C1188
         PEA   L0C1188
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
L023F7A  BRL   L024070
L023F7D  STZ   $EE
         LDA   #$0001
         STA   $F2
         BRA   L023FD5
L023F86  LDA   #$0001
         STA   $F0
         BRA   L023FC6
L023F8D  LDA   $F0
         LDX   #$0000
         PHX
         PHA
         LDA   $F2
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
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         BEQ   L023FC4
         INC   $EE
L023FC4  INC   $F0
L023FC6  LDA   $F0
         SEC
         SBC   #$0006
         BVS   L023FD1
         EOR   #$8000
L023FD1  BPL   L023F8D
         INC   $F2
L023FD5  LDA   $F2
         SEC
         SBC   #$0005
         BVS   L023FE0
         EOR   #$8000
L023FE0  BPL   L023F86
         PEI   $EE
         PEA   $0000
         JSL   L0251CD
         PLY
         PLY
         BRL   L024070
L023FF0  PEA   ^L0C09F0
         PEA   L0C09F0
         JSL   L024E6B
         PLY
         PLY
         BRL   L024070
L023FFF  PHA
         PEA   $046E
         PEA   $0000
         _FlushEvents
         BCS   L024012
         LDA   #$0000
L024012  STAL  L0B0002
         PLA
         BRL   L024070
L02401A  LDA   #$0001
         STAL  L0C1A9C
         BRL   L024070
L024024  LDA   #$0000
         STAL  L0C1A9C
         BRL   L024070
L02402E  BRL   L024070
L024031  DA    L023D3A
         DA    L023D47
         DA    L02402E
         DA    L023D51
         DA    L023D8F
         DA    L023D9E
         DA    L023DB5
         DA    L023DB8
         DA    L023DBF
         DA    L023E22
         DA    L023EAA
         DA    L023EB0
         DA    L023ECF
         DA    L02402E
         DA    L023EDE
         DA    L023EE8
         DA    L02402E
         DA    L023EF1
         DA    L023F7D
         DA    L023FF0
         DA    L023FFF
         DA    L02401A
         DA    L024024
         DA    L02402E
L024061  DEC
         DEC
         CMP   #$0017
         BCC   L02406B
         LDA   #$0017
L02406B  ASL
         TAX
         JMP   (L024031,X)

L024070  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L024078  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E7
         TCS
         LDA   $FD
         SEC
         SBC   #$0000
         BVS   L02408E
         EOR   #$8000
L02408E  BPL   L0240B1
         SEP   #$20
         STZ   $E9
         REP   #$20
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L02409F
         DEX
L02409F  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $EC
         STA   $EA
         BRA   L0240DB
L0240B1  LDA   #$0001
         SEP   #$20
         STA   $E9
         REP   #$20
         LDA   $FD
         EOR   #$FFFF
         INC
         STA   $FD
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L0240CB
         DEX
L0240CB  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $EC
         STA   $EA
L0240DB  LDA   [$EA]
         AND   #$00FF
         PHA
         LDA   $FF
         AND   #$00FF
         PLX
         STX   $EE
         CMP   $EE
         BNE   L0240F0
         BRL   L024147
L0240F0  LDA   $E9
         AND   #$00FF
         BNE   L02411A
         LDA   [$EA]
         AND   #$00FF
         BEQ   L024106
         INC   $EA
         BNE   L024104
         INC   $EC
L024104  BRA   L024118
L024106  LDX   $EC
         LDA   $EA
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010AA3
         PLA
         PLX
         BRA   L024157
L024118  BRA   L024145
L02411A  SEC
         LDA   $EA
         SBC   $F9
         BNE   L024127
         LDA   $EC
         SBC   $FB
         BRA   L02412D
L024127  LDA   $EC
         SBC   $FB
         REP   #$02
L02412D  BEQ   L024140
         BVS   L024134
         EOR   #$8000
L024134  BPL   L024140
         LDA   $EA
         BNE   L02413C
         DEC   $EC
L02413C  DEC   $EA
         BRA   L024145
L024140  LDA   #$FFFF
         BRA   L024157
L024145  BRA   L0240DB
L024147  LDX   $FB
         LDA   $F9
         PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010AA3
         PLA
         PLX
L024157  TAY
         TSC
         CLC
         ADC   #$000B
         TCS
         TYA
         PLD
         RTL

L024161  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E7
         TCS
         LDA   $FD
         SEC
         SBC   #$0000
         BVS   L024177
         EOR   #$8000
L024177  BPL   L02419A
         SEP   #$20
         STZ   $E9
         REP   #$20
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L024188
         DEX
L024188  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $EC
         STA   $EA
         BRA   L0241C4
L02419A  LDA   #$0001
         SEP   #$20
         STA   $E9
         REP   #$20
         LDA   $FD
         EOR   #$FFFF
         INC
         STA   $FD
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L0241B4
         DEX
L0241B4  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $EC
         STA   $EA
L0241C4  LDA   [$EA]
         AND   #$00FF
         PHA
         LDA   $FF
         AND   #$00FF
         PLX
         STX   $EE
         CMP   $EE
         BEQ   L0241D9
         BRL   L024230
L0241D9  LDA   $E9
         AND   #$00FF
         BNE   L024203
         LDA   [$EA]
         AND   #$00FF
         BEQ   L0241EF
         INC   $EA
         BNE   L0241ED
         INC   $EC
L0241ED  BRA   L024201
L0241EF  LDX   $EC
         LDA   $EA
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010AA3
         PLA
         PLX
         BRA   L024240
L024201  BRA   L02422E
L024203  SEC
         LDA   $EA
         SBC   $F9
         BNE   L024210
         LDA   $EC
         SBC   $FB
         BRA   L024216
L024210  LDA   $EC
         SBC   $FB
         REP   #$02
L024216  BEQ   L024229
         BVS   L02421D
         EOR   #$8000
L02421D  BPL   L024229
         LDA   $EA
         BNE   L024225
         DEC   $EC
L024225  DEC   $EA
         BRA   L02422E
L024229  LDA   #$FFFF
         BRA   L024240
L02422E  BRA   L0241C4
L024230  LDX   $FB
         LDA   $F9
         PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L010AA3
         PLA
         PLX
L024240  TAY
         TSC
         CLC
         ADC   #$000B
         TCS
         TYA
         PLD
         RTL

L02424A  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L02425E
         DEX
L02425E  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $FB
         STA   $F9
L02426E  LDA   [$F9]
         AND   #$00FF
         BEQ   L02428C
         LDA   [$F9]
         AND   #$00FF
         CMP   #$0020
         BNE   L02428C
         LDA   [$FD]
         INC
         STA   [$FD]
         INC   $F9
         BNE   L02428A
         INC   $FB
L02428A  BRA   L02426E
L02428C  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   $FD
         BNE   L0242A5
         DEC   $FF
L0242A5  DEC   $FD
L0242A7  INC   $FD
         BNE   L0242AD
         INC   $FF
L0242AD  LDX   $FF
         LDA   $FD
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         BEQ   L0242EF
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0061
         BVS   L0242CA
         EOR   #$8000
L0242CA  BPL   L0242ED
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$007A
         BEQ   L0242DE
         BVS   L0242DC
         EOR   #$8000
L0242DC  BMI   L0242ED
L0242DE  LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0020
         SEP   #$20
         STA   [$FD]
         REP   #$20
L0242ED  BRA   L0242A7
L0242EF  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0242F7  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   $FD
         BNE   L024308
         DEC   $FF
L024308  DEC   $FD
L02430A  INC   $FD
         BNE   L024310
         INC   $FF
L024310  LDX   $FF
         LDA   $FD
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         BEQ   L024352
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0041
         BVS   L02432D
         EOR   #$8000
L02432D  BPL   L024350
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$005A
         BEQ   L024341
         BVS   L02433F
         EOR   #$8000
L02433F  BMI   L024350
L024341  LDA   [$FD]
         AND   #$00FF
         CLC
         ADC   #$0020
         SEP   #$20
         STA   [$FD]
         REP   #$20
L024350  BRA   L02430A
L024352  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02435A  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         LDA   #$0000
         STA   $EE
         PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0001
         STA   $EC
         BRL   L024404
L02437D  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L024386
         DEX
L024386  PHX
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
         STA   $F0
         LDA   $EC
         LDX   #$0000
         TAY
         BPL   L0243A6
         DEX
L0243A6  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDA   $EE
         LDX   #$0000
         TAY
         BPL   L0243C2
         DEX
L0243C2  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDA   $F0
         PHA
         LDA   $EC
         LDX   #$0000
         TAY
         BPL   L0243E5
         DEX
L0243E5  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDA   $EE
         INC   $EE
         LDA   $EC
         DEC   $EC
L024404  LDA   $EE
         SEC
         SBC   $EC
         BVS   L02440E
         EOR   #$8000
L02440E  BMI   L024413
         BRL   L02437D
L024413  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L02441B  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EA
         TCS
         LDA   $FB
         STA   $EC
         SEC
         SBC   #$0000
         BVS   L024433
         EOR   #$8000
L024433  BMI   L02443D
         LDA   $FB
         EOR   #$FFFF
         INC
         STA   $FB
L02443D  STZ   $EE
L02443F  LDA   #$000A
         PHA
         LDA   $FB
         SEC
         JSL   L01092D
         PLA
         CLC
         ADC   #$0030
         PHA
         LDA   $EE
         INC   $EE
         LDX   #$0000
         TAY
         BPL   L02445B
         DEX
L02445B  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         PLA
         SEP   #$20
         STA   [$F0]
         REP   #$20
         LDA   #$000A
         PHA
         LDA   $FB
         SEC
         JSL   L01092D
         PLY
         STA   $FB
         SEC
         SBC   #$0000
         BEQ   L02448D
         BVS   L02448B
         EOR   #$8000
L02448B  BMI   L02443F
L02448D  LDA   $EC
         SEC
         SBC   #$0000
         BVS   L024498
         EOR   #$8000
L024498  BMI   L0244BE
         LDA   $EE
         INC   $EE
         LDX   #$0000
         TAY
         BPL   L0244A5
         DEX
L0244A5  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   #$002D
         SEP   #$20
         STA   [$F0]
         REP   #$20
L0244BE  LDA   $EE
         LDX   #$0000
         TAY
         BPL   L0244C7
         DEX
L0244C7  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   #$0000
         SEP   #$20
         STA   [$F0]
         REP   #$20
         PEI   $FF
         PEI   $FD
         JSL   L02435A
         PLY
         PLY
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L0244F2  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         STA   $EE
         LDA   $EE
         STA   $F0
         BRA   L024551
L02450F  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L024518
         DEX
L024518  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDA   $F0
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L024538
         DEX
L024538  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         DEC   $F0
L024551  LDA   $F0
         SEC
         SBC   #$0000
         BVS   L02455C
         EOR   #$8000
L02455C  BMI   L02450F
         LDA   $EE
         SEP   #$20
         STA   [$FD]
         REP   #$20
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L02456E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L024582
         DEX
L024582  PHX
         PHA
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L02458D
         DEX
L02458D  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         JSL   L010922
         PLA
         PLX
         STX   $EC
         STA   $EA
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L0245AC
         DEX
L0245AC  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $FB
         STA   $F9
L0245BC  LDX   $EC
         LDA   $EA
         INC   $EA
         BNE   L0245C6
         INC   $EC
L0245C6  STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L0245D7
         INC   $FB
L0245D7  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         AND   #$00FF
         BEQ   L0245E9
         BRA   L0245BC
L0245E9  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0245F1  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E4
         TCS
         PEI   $F9
         PEI   $F7
         JSL   L010D87
         PLY
         PLY
         STA   $EA
         PEI   $FD
         PEI   $FB
         JSL   L010D87
         PLY
         PLY
         STA   $E8
         LDA   $E8
         STA   $E6
         BRA   L02465B
L02461A  LDA   $E6
         LDX   #$0000
         TAY
         BPL   L024623
         DEX
L024623  PHX
         PHA
         LDX   $FD
         LDA   $FB
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   [$EC]
         PHA
         LDA   $E6
         CLC
         ADC   $EA
         LDX   #$0000
         TAY
         BPL   L024642
         DEX
L024642  PHX
         PHA
         LDX   $FD
         LDA   $FB
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         PLA
         SEP   #$20
         STA   [$EC]
         REP   #$20
         DEC   $E6
L02465B  LDA   $E6
         SEC
         SBC   $FF
         BVS   L024665
         EOR   #$8000
L024665  BMI   L02461A
         STZ   $E6
         BRA   L0246AB
L02466B  LDA   $E6
         LDX   #$0000
         TAY
         BPL   L024674
         DEX
L024674  PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   [$EC]
         PHA
         LDA   $FF
         INC   $FF
         LDX   #$0000
         TAY
         BPL   L024692
         DEX
L024692  PHX
         PHA
         LDX   $FD
         LDA   $FB
         JSL   L010922
         PLA
         PLX
         STA   $EC
         STX   $EE
         PLA
         SEP   #$20
         STA   [$EC]
         REP   #$20
         INC   $E6
L0246AB  LDA   $E6
         SEC
         SBC   $EA
         BVS   L0246B5
         EOR   #$8000
L0246B5  BPL   L02466B
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0246BF  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         STZ   $EE
         STZ   $F0
         STZ   L0B0084
         LDA   [$FD]
         AND   #$00FF
         CMP   #$0000
         BNE   L0246E4
         LDA   #$0001
         STA   L0B0084
         BRL   L02478C
L0246E4  LDA   [$FD]
         AND   #$00FF
         BEQ   L024735
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0030
         BVS   L0246F9
         EOR   #$8000
L0246F9  BPL   L02470D
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0039
         BEQ   L024735
         BVS   L02470B
         EOR   #$8000
L02470B  BPL   L024735
L02470D  LDA   [$FD]
         AND   #$00FF
         CMP   #$002D
         BNE   L024727
         LDA   $EE
         BEQ   L024720
         LDA   #$0000
         BRA   L024723
L024720  LDA   #$0001
L024723  STA   $EE
         BRA   L02472D
L024727  LDA   #$0001
         STA   L0B0084
L02472D  INC   $FD
         BNE   L024733
         INC   $FF
L024733  BRA   L0246E4
L024735  LDA   [$FD]
         AND   #$00FF
         BEQ   L02478C
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0030
         BVS   L02474A
         EOR   #$8000
L02474A  BPL   L02477E
         LDA   [$FD]
         AND   #$00FF
         SEC
         SBC   #$0039
         BEQ   L02475E
         BVS   L02475C
         EOR   #$8000
L02475C  BMI   L02477E
L02475E  LDA   [$FD]
         AND   #$00FF
         PHA
         LDA   $F0
         PHA
         LDA   #$000A
         SEC
         JSL   L010AAE
         PLA
         PLX
         STX   $F6
         CLC
         ADC   $F6
         SEC
         SBC   #$0030
         STA   $F0
         BRA   L024784
L02477E  LDA   #$0001
         STA   L0B0084
L024784  INC   $FD
         BNE   L02478A
         INC   $FF
L02478A  BRA   L024735
L02478C  LDA   $EE
         BEQ   L02479A
         LDA   $F0
         EOR   #$FFFF
         INC
         BRA   L02479C
         BRA   L02479C
L02479A  LDA   $F0
L02479C  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L0247A6  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E2
         TCS
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L0247BA
         DEX
L0247BA  PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L010922
         PLA
         PLX
         STX   $E8
         STA   $E6
L0247CA  LDA   [$E6]
         AND   #$00FF
         CMP   #$0020
         BEQ   L0247DE
         LDA   [$E6]
         AND   #$00FF
         CMP   #$002C
         BNE   L0247E6
L0247DE  INC   $E6
         BNE   L0247E4
         INC   $E8
L0247E4  BRA   L0247CA
L0247E6  LDA   [$E6]
         SEP   #$20
         STA   $E5
         REP   #$20
         AND   #$00FF
         CMP   #$0027
         BEQ   L024803
         LDA   $E5
         AND   #$00FF
         CMP   #$0022
         BEQ   L024803
         BRL   L024889
L024803  INC   $E6
         BNE   L024809
         INC   $E8
L024809  LDA   [$E6]
         AND   #$00FF
         PHA
         LDA   $E5
         AND   #$00FF
         PLX
         STX   $EA
         CMP   $EA
         BEQ   L024848
         LDX   $E8
         LDA   $E6
         INC   $E6
         BNE   L024825
         INC   $E8
L024825  STA   $EA
         STX   $EC
         LDA   [$EA]
         PHA
         LDX   $F7
         LDA   $F5
         INC   $F5
         BNE   L024836
         INC   $F7
L024836  STA   $EA
         STX   $EC
         PLA
         SEP   #$20
         STA   [$EA]
         REP   #$20
         AND   #$00FF
         BEQ   L024848
         BRA   L024809
L024848  LDA   [$E6]
         AND   #$00FF
         PHA
         LDA   $E5
         AND   #$00FF
         PLX
         STX   $EA
         CMP   $EA
         BNE   L024862
         INC   $E6
         BNE   L024860
         INC   $E8
L024860  BRA   L024887
L024862  LDX   $E8
         LDA   $E6
         SEC
         SBC   #$0001
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STA   $EA
         STX   $EC
         LDA   [$EA]
         AND   #$00FF
         CMP   #$0000
         BNE   L024887
         LDA   $E6
         BNE   L024885
         DEC   $E8
L024885  DEC   $E6
L024887  BRA   L0248EF
L024889  LDA   [$E6]
         AND   #$00FF
         CMP   #$0020
         BEQ   L0248CA
         LDA   [$E6]
         AND   #$00FF
         CMP   #$002C
         BEQ   L0248CA
         LDX   $E8
         LDA   $E6
         INC   $E6
         BNE   L0248A7
         INC   $E8
L0248A7  STA   $EA
         STX   $EC
         LDA   [$EA]
         PHA
         LDX   $F7
         LDA   $F5
         INC   $F5
         BNE   L0248B8
         INC   $F7
L0248B8  STA   $EA
         STX   $EC
         PLA
         SEP   #$20
         STA   [$EA]
         REP   #$20
         AND   #$00FF
         BEQ   L0248CA
         BRA   L024889
L0248CA  LDX   $E8
         LDA   $E6
         SEC
         SBC   #$0001
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STA   $EA
         STX   $EC
         LDA   [$EA]
         AND   #$00FF
         CMP   #$0000
         BNE   L0248EF
         LDA   $E6
         BNE   L0248ED
         DEC   $E8
L0248ED  DEC   $E6
L0248EF  LDA   #$0000
         SEP   #$20
         STA   [$F5]
         REP   #$20
         LDX   $FB
         LDA   $F9
         PHX
         PHA
         LDX   $E8
         LDA   $E6
         JSL   L010AA3
         PLA
         PLX
         STA   [$FD]
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L024912  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00D9
         TCS
         LDA   [$F9]
         LDX   #$0000
         TAY
         BPL   L024926
         DEX
L024926  PHX
         PHA
         LDX   $F7
         LDA   $F5
         JSL   L010922
         PLA
         PLX
         STX   $E4
         STA   $E2
L024936  LDA   [$E2]
         AND   #$00FF
         CMP   #$0020
         BNE   L024948
         INC   $E2
         BNE   L024946
         INC   $E4
L024946  BRA   L024936
L024948  LDA   #$0001
         SEP   #$20
         STA   $DB
         REP   #$20
         PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         STA   $DC
         STZ   $DE
         BRA   L024994
L024961  LDA   [$E2]
         AND   #$00FF
         PHA
         LDA   $DE
         LDX   #$0000
         TAY
         BPL   L024970
         DEX
L024970  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         PLX
         STX   $E6
         CMP   $E6
         BNE   L024992
         SEP   #$20
         STZ   $DB
         REP   #$20
L024992  INC   $DE
L024994  LDA   $DE
         SEC
         SBC   $DC
         BEQ   L0249A2
         BVS   L0249A0
         EOR   #$8000
L0249A0  BMI   L0249A9
L0249A2  LDA   $DB
         AND   #$00FF
         BNE   L024961
L0249A9  LDA   $DB
         AND   #$00FF
         BNE   L0249B3
         BRL   L024A27
L0249B3  LDX   $E4
         LDA   $E2
         INC   $E2
         BNE   L0249BD
         INC   $E4
L0249BD  STA   $E6
         STX   $E8
         LDA   [$E6]
         PHA
         LDX   $F3
         LDA   $F1
         INC   $F1
         BNE   L0249CE
         INC   $F3
L0249CE  STA   $E6
         STX   $E8
         PLA
         SEP   #$20
         STA   [$E6]
         REP   #$20
         STZ   $DE
         BRA   L024A10
L0249DD  LDA   [$E2]
         AND   #$00FF
         PHA
         LDA   $DE
         LDX   #$0000
         TAY
         BPL   L0249EC
         DEX
L0249EC  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $E6
         STX   $E8
         LDA   [$E6]
         AND   #$00FF
         PLX
         STX   $E6
         CMP   $E6
         BNE   L024A0E
         SEP   #$20
         STZ   $DB
         REP   #$20
L024A0E  INC   $DE
L024A10  LDA   $DE
         SEC
         SBC   $DC
         BEQ   L024A1E
         BVS   L024A1C
         EOR   #$8000
L024A1C  BMI   L024A25
L024A1E  LDA   $DB
         AND   #$00FF
         BNE   L0249DD
L024A25  BRA   L0249A9
L024A27  LDA   #$0000
         SEP   #$20
         STA   [$F1]
         REP   #$20
         LDX   $F7
         LDA   $F5
         PHX
         PHA
         LDX   $E4
         LDA   $E2
         JSL   L010AA3
         PLA
         PLX
         STA   [$F9]
         TSC
         CLC
         ADC   #$0011
         TCS
         PLD
         RTL

L024A4A  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         STA   $F0
         SEC
         SBC   #$0001
         BNE   L024A6A
         BRL   L024DD8
L024A6A  BVS   L024A6F
         EOR   #$8000
L024A6F  BMI   L024A74
         BRL   L024DD8
L024A74  LDA   [$FD]
         AND   #$00FF
         CMP   #$0026
         BEQ   L024A81
         BRL   L024DD8
L024A81  PEI   $FF
         PEI   $FD
         JSL   L0242F7
         PLY
         PLY
         LDA   $F0
         CMP   #$0002
         BEQ   L024A95
         BRL   L024BAF
L024A95  LDY   #$0001
         LDA   [$FD],Y
         AND   #$00FF
         CMP   #$006E
         BNE   L024ADC
         LDA   #$0049
         SEP   #$20
         STAL  L0C10BE
         REP   #$20
         LDA   #$0049
         SEP   #$20
         STAL  L0C10BF
         REP   #$20
         LDA   #$0047
         SEP   #$20
         STAL  L0C10C0
         REP   #$20
         LDA   #$0053
         SEP   #$20
         STAL  L0C10C1
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STAL  L0C10C2
         REP   #$20
         BRL   L024BAC
L024ADC  LDY   #$0001
         LDA   [$FD],Y
         AND   #$00FF
         CMP   #$0070
         BNE   L024B02
         LDA   #$00A5
         SEP   #$20
         STAL  L0C10BE
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STAL  L0C10BF
         REP   #$20
         BRL   L024BAC
L024B02  LDY   #$0001
         LDA   [$FD],Y
         AND   #$00FF
         STA   $EE
         SEC
         SBC   #$0030
         BVS   L024B15
         EOR   #$8000
L024B15  BPL   L024B30
         LDA   $EE
         SEC
         SBC   #$0039
         BEQ   L024B26
         BVS   L024B24
         EOR   #$8000
L024B24  BMI   L024B30
L024B26  LDA   $EE
         SEC
         SBC   #$0030
         STA   $EE
         BRA   L024B49
L024B30  LDA   $EE
         SEC
         SBC   #$0061
         BVS   L024B3B
         EOR   #$8000
L024B3B  BPL   L024B49
         LDA   $EE
         SEC
         SBC   #$0061
         CLC
         ADC   #$000A
         STA   $EE
L024B49  LDA   $EE
         SEC
         SBC   #$0000
         BVS   L024B54
         EOR   #$8000
L024B54  BMI   L024B59
         BRL   L024BAC
L024B59  LDA   $EE
         SEC
         SBC   #$0015
         BVS   L024B64
         EOR   #$8000
L024B64  BMI   L024BAC
         LDA   $EE
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
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         LDA   $EE
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C072F
         LDX   #^L0C072F
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         STA   L0B0082
L024BAC  BRL   L024DD8
L024BAF  PEA   ^L0C25F1
         PEA   L0C25F1
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024BEB
         LDA   L0B008C
         STA   L0B0082
         PEA   ^L0C10BE
         PEA   L0C10BE
         LDA   L0B0082
         PHA
         JSL   L02441B
         PLY
         PLY
         PLY
         BRL   L024DD8
L024BEB  PEA   ^L0C25F6
         PEA   L0C25F6
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024C33
         PEA   ^L0C1188
         PEA   L0C1188
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0246BF
         PLY
         PLY
         STA   L0B0082
         BRL   L024DD8
L024C33  PEA   ^L0C25FA
         PEA   L0C25FA
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024CA4
         LDA   L0B00B2
         AND   #$00FF
         STA   L0B0082
         LDA   L0B00B2
         SEP   #$20
         STAL  L0C10BE
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STAL  L0C10BF
         REP   #$20
         LDA   L0B00B2
         AND   #$00FF
         SEC
         SBC   #$0020
         BVS   L024C83
         EOR   #$8000
L024C83  BPL   L024C9E
         LDA   L0B00B2
         AND   #$00FF
         SEC
         SBC   #$007F
         BVS   L024C94
         EOR   #$8000
L024C94  BMI   L024C9E
         LDA   #$0001
         STA   L0B0084
         BRA   L024CA1
L024C9E  STZ   L0B0084
L024CA1  BRL   L024DD8
L024CA4  PEA   ^L0C25FE
         PEA   L0C25FE
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024CE0
         LDA   L0B0078
         STA   L0B0082
         PEA   ^L0C10BE
         PEA   L0C10BE
         LDA   L0B0082
         PHA
         JSL   L02441B
         PLY
         PLY
         PLY
         BRL   L024DD8
L024CE0  PEA   ^L0C2602
         PEA   L0C2602
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024D28
         PEA   ^L0C11BB
         PEA   L0C11BB
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0246BF
         PLY
         PLY
         STA   L0B0082
         BRL   L024DD8
L024D28  PEA   ^L0C2606
         PEA   L0C2606
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024D64
         LDA   L0B0074
         STA   L0B0082
         PEA   ^L0C10BE
         PEA   L0C10BE
         LDA   L0B0082
         PHA
         JSL   L02441B
         PLY
         PLY
         PLY
         BRL   L024DD8
L024D64  PEA   ^L0C260A
         PEA   L0C260A
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024D9F
         LDA   L0B0076
         STA   L0B0082
         PEA   ^L0C10BE
         PEA   L0C10BE
         LDA   L0B0082
         PHA
         JSL   L02441B
         PLY
         PLY
         PLY
         BRA   L024DD8
L024D9F  PEA   ^L0C260E
         PEA   L0C260E
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
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024DD8
         LDA   L0B007C
         STA   L0B0082
         PEA   ^L0C10BE
         PEA   L0C10BE
         LDA   L0B0082
         PHA
         JSL   L02441B
         PLY
         PLY
         PLY
L024DD8  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L024DE0  ENT
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
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0247A6
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L0C10BE
         PEA   L0C10BE
         PEA   ^L0C10F1
         PEA   L0C10F1
         JSL   L0110F7
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C10F1
         PEA   L0C10F1
         JSL   L0246BF
         PLY
         PLY
         STA   L0B0082
         PEA   ^L0C10F1
         PEA   L0C10F1
         JSL   L024A4A
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L024E3C  ENT
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
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0242F7
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L024E6B  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         STZ   $EE
L024E78  PEA   $0026
         PEI   $EE
         PEI   $FF
         PEI   $FD
         JSL   L024078
         PLY
         PLY
         PLY
         PLY
         STA   $F0
         SEC
         SBC   #$0000
         BVS   L024E94
         EOR   #$8000
L024E94  BMI   L024E99
         BRL   L024F3E
L024E99  LDA   [$FD]
         AND   #$00FF
         BNE   L024EA3
         BRL   L024F3E
L024EA3  LDA   $F0
         SEC
         SBC   #$0001
         STA   $EC
         LDA   $F0
         BEQ   L024EF7
         LDA   $EC
         LDX   #$0000
         TAY
         BPL   L024EB8
         DEX
L024EB8  PHX
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
         CMP   #$0022
         BEQ   L024EF5
         LDA   $EC
         LDX   #$0000
         TAY
         BPL   L024EDB
         DEX
L024EDB  PHX
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
         CMP   #$0027
         BNE   L024EF7
L024EF5  DEC   $F0
L024EF7  LDA   $F0
         STA   $EE
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         PEI   $FF
         PEI   $FD
         JSL   L024DE0
         PLY
         PLY
         PLY
         PLY
         LDA   $F0
         SEC
         SBC   $EE
         PHA
         PEI   $EE
         PEI   $FF
         PEI   $FD
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEI   $EE
         PEI   $FF
         PEI   $FD
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L0245F1
         PLY
         PLY
         PLY
         PLY
         PLY
         INC   $EE
         BRL   L024E78
L024F3E  STZ   $EE
L024F40  PEA   $0027
         PEI   $EE
         PEI   $FF
         PEI   $FD
         JSL   L024078
         PLY
         PLY
         PLY
         PLY
         STA   $F0
         SEC
         SBC   #$0000
         BVS   L024F5C
         EOR   #$8000
L024F5C  BPL   L024F89
         LDA   [$FD]
         AND   #$00FF
         BEQ   L024F89
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L024F6E
         DEX
L024F6E  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$00D5
         SEP   #$20
         STA   [$F2]
         REP   #$20
         BRA   L024F40
L024F89  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L024F91  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E8
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C2613
         PEA   L0C2613
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024FCA
         LDA   #$0001
         STA   [$F5]
         BRA   L024FE6
L024FCA  PEA   ^L0C2616
         PEA   L0C2616
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BNE   L024FE6
         LDA   #$0000
         STA   [$F5]
L024FE6  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L024FEE  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00E4
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
         STA   [$F1]
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
         STA   [$F5]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02502B  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E8
         TCS
         LDA   L0B0082
         LDY   #$0002
         STA   [$F5],Y
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
         STA   [$F5]
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
         LDY   #$0006
         STA   [$F5],Y
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
         LDY   #$0004
         STA   [$F5],Y
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L02508B  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E8
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L024E3C
         PLY
         PLY
         PLY
         PLY
         PEA   ^L0C261A
         PEA   L0C261A
         PEA   ^L0C10BE
         PEA   L0C10BE
         JSL   L010DD9
         PLY
         PLY
         PLY
         PLY
         TAY
         BEQ   L0250D8
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         PEI   $F5
         JSL   L02502B
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         BRL   L02518C
L0250D8  PEI   $FF
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
         BVS   L0250F4
         EOR   #$8000
L0250F4  BPL   L025139
         LDA   L0B0082
         SEC
         SBC   #$0010
         BVS   L025102
         EOR   #$8000
L025102  BMI   L025139
         LDA   L0B0082
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
         STA   $EA
         STX   $EC
         LDA   $EA
         LDX   $EC
         PHX
         PHA
         LDA   $F7
         PHA
         LDA   $F5
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
         BRA   L02518C
L025139  LDA   L0B0082
         SEC
         SBC   #$FFFD
         BVS   L025145
         EOR   #$8000
L025145  BPL   L02518C
         LDA   L0B0082
         SEC
         SBC   #$0000
         BVS   L025153
         EOR   #$8000
L025153  BMI   L02518C
         LDA   L0B0082
         EOR   #$FFFF
         INC
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
         STA   $EA
         STX   $EC
         LDA   $EA
         LDX   $EC
         PHX
         PHA
         LDA   $F7
         PHA
         LDA   $F5
         PHA
         PEA   $0008
         JSL   L010BC3
         PLA
         PLA
         PLA
         PLA
         PLX
L02518C  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L025194  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         STZ   $EC
         BRA   L0251B9
L0251A3  LDA   $FF
         SEP   #$20
         STA   [$F9]
         REP   #$20
         INC   $EC
         LDA   $EC
         INC   $F9
         BNE   L0251B5
         INC   $FB
L0251B5  LDX   $FB
         LDA   $F9
L0251B9  LDA   $EC
         SEC
         SBC   $FD
         BVS   L0251C3
         EOR   #$8000
L0251C3  BPL   L0251A3
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0251CD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   $FD
         SEC
         SBC   #$0015
         BVS   L0251E3
         EOR   #$8000
L0251E3  BMI   L025225
         LDA   $FD
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0C072F
         LDX   #^L0C072F
         JSL   L010922
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $FF
         STA   [$F2]
         LDA   $FD
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
         PEI   $FF
         JSL   L02441B
         PLY
         PLY
         PLY
L025225  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         PEA   $0020
         PEA   $0000
         PEI   $FF
         PEI   $FD
         JSL   L024161
         PLY
         PLY
         PLY
         PLY
         STA   $F0
         PEI   $F0
         PEA   $0000
         PEI   $FF
         PEI   $FD
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         PEA   $0020
         PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   #$0001
         EOR   #$FFFF
         INC
         PHA
         PEI   $FF
         PEI   $FD
         JSL   L024161
         PLY
         PLY
         PLY
         PLY
         STA   $F0
         LDA   $F0
         CLC
         ADC   #$0001
         STA   $F0
         PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   $F0
         PHA
         PEI   $F0
         PEI   $FF
         PEI   $FD
         JSL   L02456E
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0252AD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         STZ   $EA
         STZ   $EC
         BRA   L0252E8
L0252BE  LDA   $EC
         LDX   #$0000
         TAY
         BPL   L0252C7
         DEX
L0252C7  PHX
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
         CMP   #$002E
         BNE   L0252E6
         LDA   #$0001
         STA   $EA
L0252E6  INC   $EC
L0252E8  PEI   $FB
         PEI   $F9
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   $EC
         BVS   L0252FA
         EOR   #$8000
L0252FA  BMI   L0252BE
         LDA   $EA
         BNE   L02531A
         PEI   $FF
         PEI   $FD
         JSL   L0242F7
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L010CFD
         PLY
         PLY
         PLY
         PLY
L02531A  LDA   $EA
         BEQ   L025323
         LDA   #$0000
         BRA   L025326
L025323  LDA   #$0001
L025326  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L025330  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E8
         TCS
         STZ   $EA
         STZ   $EC
         BRA   L02536B
L025341  LDA   $EC
         LDX   #$0000
         TAY
         BPL   L02534A
         DEX
L02534A  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L010922
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         CMP   #$002F
         BNE   L025369
         LDA   #$0001
         STA   $EA
L025369  INC   $EC
L02536B  PEI   $FF
         PEI   $FD
         JSL   L010D87
         PLY
         PLY
         SEC
         SBC   $EC
         BVS   L02537D
         EOR   #$8000
L02537D  BMI   L025341
         LDA   $EA
         BNE   L0253A1
         PEI   $FB
         PEI   $F9
         JSL   L0242F7
         PLY
         PLY
         PEA   $0000
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L0245F1
         PLY
         PLY
         PLY
         PLY
         PLY
L0253A1  LDA   $EA
         BEQ   L0253AA
         LDA   #$0000
         BRA   L0253AD
L0253AA  LDA   #$0001
L0253AD  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

