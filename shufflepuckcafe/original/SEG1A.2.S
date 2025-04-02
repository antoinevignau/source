L1A26E8  LDY   #$000A
         LDA   [$F7],Y
         TAX
         LDY   #$0008
         LDA   [$F7],Y
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         STA   [$FD]
         BRL   L1A284B
L1A270D  LDY   #$000A
         LDA   [$F7],Y
         TAX
         LDY   #$0008
         LDA   [$F7],Y
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         STAL  L0336B2
         PEA   $0019
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         LDAL  L0336B6
         TAX
         LDAL  L0336B4
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         BRL   L1A284B
L1A2754  LDY   #$000A
         LDA   [$F7],Y
         TAX
         LDY   #$0008
         LDA   [$F7],Y
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         STAL  L0336B2
         LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L0336B6
         PLA
         STAL  L0336B4
         PEA   $0018
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         BRL   L1A284B
L1A2797  LDY   #$000A
         LDA   [$F7],Y
         TAX
         LDY   #$0008
         LDA   [$F7],Y
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         STAL  L0336AC
         PEA   $0017
         PEA   ^L0336AC
         PEA   L0336AC
         JSL   L1A1909
         LDAL  L0336B0
         TAX
         LDAL  L0336AE
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         BRL   L1A284B
L1A27DE  LDY   #$000A
         LDA   [$F7],Y
         TAX
         LDY   #$0008
         LDA   [$F7],Y
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         STA   $EC
         STX   $EE
         LDY   #$0002
         LDA   [$EC],Y
         STAL  L0336AC
         LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L0336B0
         PLA
         STAL  L0336AE
         PEA   $0016
         PEA   ^L0336AC
         PEA   L0336AC
         JSL   L1A1909
         BRL   L1A284B
         BRL   L1A284B
L1A2824  DA    L1A24EB
         DA    L1A26B7
         DA    L1A24DD
         DA    L1A26DA
         DA    L1A24DD
         DA    L1A26E8
         DA    L1A2754
         DA    L1A270D
         DA    L1A27DE
         DA    L1A2797
         DA    L1A24DD
L1A283A  SEC
         SBC   #$6600
         CMP   #$000A
         BCC   L1A2846
         LDA   #$000A
L1A2846  ASL
         TAX
         JMP   (L1A2824,X)

L1A284B  LDA   L0201E7
         CMP   #$0000
         BEQ   L1A285B
         LDA   L0201E7
         LDY   #$0002
         STA   [$F7],Y
L1A285B  LDA   L0201E7
         CMP   #$0000
         BNE   L1A2868
         LDA   #$0000
         BRA   L1A286B
L1A2868  LDA   #$0016
L1A286B  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A2875  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDY   #$000A
         LDA   [$FD],Y
         TAX
         LDY   #$0008
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         CMP   #$0002
         BNE   L1A2916
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         PHX
         PHA
         PEA   $0000
         LDY   #$000C
         LDA   [$FD],Y
         PHA
         _ErrWriteBlock
         BCS   L1A28C7
         LDA   #$0000
L1A28C7  STAL  L0201E7
         LDY   #$000C
         LDA   [$FD],Y
         SEC
         SBC   #$0001
         LDX   #$0000
         PHX
         PHA
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$000A
         BNE   L1A2914
         PEA   ^L03356E
         PEA   L03356E
         PEA   $0000
         PEA   $0001
         _ErrWriteBlock
         BCS   L1A2910
         LDA   #$0000
L1A2910  STAL  L0201E7
L1A2914  BRA   L1A2985
L1A2916  LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         PHX
         PHA
         PEA   $0000
         LDY   #$000C
         LDA   [$FD],Y
         PHA
         _TextWriteBlock
         BCS   L1A2938
         LDA   #$0000
L1A2938  STAL  L0201E7
         LDY   #$000C
         LDA   [$FD],Y
         SEC
         SBC   #$0001
         LDX   #$0000
         PHX
         PHA
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$000A
         BNE   L1A2985
         PEA   ^L033570
         PEA   L033570
         PEA   $0000
         PEA   $0001
         _TextWriteBlock
         BCS   L1A2981
         LDA   #$0000
L1A2981  STAL  L0201E7
L1A2985  LDY   #$000C
         LDA   [$FD],Y
         LDX   #$0000
         PHX
         PHA
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         JSL   L1A0EFF
         PLA
         PLX
         LDY   #$0010
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000E
         STA   [$FD],Y
         LDA   #$0000
         LDY   #$000C
         STA   [$FD],Y
         LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A29C2  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A29DA  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         LDA   [$FD]
         AND   #$0008
         TAY
         BNE   L1A29F0
         BRL   L1A2A87
L1A29F0  LDY   #$000A
         LDA   [$FD],Y
         TAX
         LDY   #$0008
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         STAL  L0336B2
         PEA   $0019
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A2A2C
         BRL   L1A2A87
L1A2A2C  LDY   #$000A
         LDA   [$FD],Y
         TAX
         LDY   #$0008
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         STAL  L0336AC
         LDAL  L0336B6
         TAX
         LDAL  L0336B4
         PHA
         TXA
         STAL  L0336B0
         PLA
         STAL  L0336AE
         PEA   $0016
         PEA   ^L0336AC
         PEA   L0336AC
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A2A87
         LDA   L0201E7
         LDY   #$0002
         STA   [$FD],Y
         LDA   #$001D
         BRL   L1A2B92
L1A2A87  LDA   [$FD]
         AND   #$0020
         TAY
         BNE   L1A2AD7
         LDY   #$000C
         LDA   [$FD],Y
         STA   $F0
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         STX   $EE
         STA   $EC
         BRA   L1A2AC8
L1A2AA7  LDA   [$EC]
         AND   #$00FF
         CMP   #$000A
         BNE   L1A2ABA
         LDA   #$000D
         SEP   #$20
         STA   [$EC]
         REP   #$20
L1A2ABA  LDA   $F0
         DEC   $F0
         LDX   $EE
         LDA   $EC
         INC   $EC
         BNE   L1A2AC8
         INC   $EE
L1A2AC8  LDA   $F0
         SEC
         SBC   #$0000
         BEQ   L1A2AD7
         BVS   L1A2AD5
         EOR   #$8000
L1A2AD5  BMI   L1A2AA7
L1A2AD7  LDY   #$000A
         LDA   [$FD],Y
         TAX
         LDY   #$0008
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         STAL  L03369E
         LDY   #$000C
         LDA   [$FD],Y
         LDX   #$0000
         PHA
         TXA
         STAL  L0336A6
         PLA
         STAL  L0336A4
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         PHA
         TXA
         STAL  L0336A2
         PLA
         STAL  L0336A0
         PEA   $0013
         PEA   ^L03369E
         PEA   L03369E
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BNE   L1A2B7A
         LDY   #$000C
         LDA   [$FD],Y
         LDX   #$0000
         SEC
         SBCL  L0336A8
         PHA
         TXA
         SBCL  L0336AA
         TAX
         PLA
         LDY   #$000C
         STA   [$FD],Y
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         CLC
         ADCL  L0336A8
         PHA
         TXA
         ADCL  L0336AA
         TAX
         PLA
         LDY   #$0010
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000E
         STA   [$FD],Y
         BRA   L1A2B82
L1A2B7A  LDA   L0201E7
         LDY   #$0002
         STA   [$FD],Y
L1A2B82  LDA   L0201E7
         CMP   #$0000
         BNE   L1A2B8F
         LDA   #$0000
         BRA   L1A2B92
L1A2B8F  LDA   #$0005
L1A2B92  TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A2B9C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         LDA   $FB
         BRL   L1A2BDF
L1A2BAC  LDA   #$0000
         STA   [$FD]
         LDX   #$0000
         LDA   #$0000
         LDY   #$0004
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0002
         STA   [$FD],Y
         LDA   #$0000
         BRL   L1A2BF0
L1A2BCA  LDA   #$0000
         BRL   L1A2BF0
L1A2BD0  LDA   #$0016
         BRL   L1A2BF0
         BRL   L1A2BF0
L1A2BD9  DA    L1A2BAC
         DA    L1A2BCA
         DA    L1A2BD0
L1A2BDF  SEC
         SBC   #$6600
         CMP   #$0002
         BCC   L1A2BEB
         LDA   #$0002
L1A2BEB  ASL
         TAX
         JMP   (L1A2BD9,X)

L1A2BF0  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A2BFA  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDY   #$000C
         LDA   [$FD],Y
         LDX   #$0000
         PHX
         PHA
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         JSL   L1A0EFF
         PLA
         PLX
         LDY   #$0010
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000E
         STA   [$FD],Y
         LDA   #$0000
         LDY   #$000C
         STA   [$FD],Y
         LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A2C42  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         PEA   $0001
         PEA   $0000
         PEA   ^L033565
         PEA   L033565
         PEI   $F9
         PEI   $F7
         JSL   L1A2FDA
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BNE   L1A2C72
         LDA   #$FFFF
         BRL   L1A2C8C
L1A2C72  LDA   $FB
         BRL   L1A2C84
L1A2C77  LDA   #$4016
         BRL   L1A2C8C
L1A2C7D  LDA   #$0000
         BRA   L1A2C8C
         BRA   L1A2C8C
L1A2C84  CMP   #$6400
         BEQ   L1A2C7D
         JMP   L1A2C77

L1A2C8C  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A2C96  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         SEC
         LDA   $F7
         SBC   #$0000
         BNE   L1A2CB0
         LDA   $F9
         SBC   #$0000
         BRA   L1A2CB7
L1A2CB0  LDA   $F9
         SBC   #$0000
         REP   #$02
L1A2CB7  BEQ   L1A2CC3
         LDA   [$F7]
         AND   #$00FF
         CMP   #$0000
         BNE   L1A2CC9
L1A2CC3  LDA   #$4016
         BRL   L1A2E12
L1A2CC9  LDA   $FB
         BRL   L1A2DDF
L1A2CCE  LDA   #$4016
         BRL   L1A2E12
L1A2CD4  PEI   $F9
         PEI   $F7
         PEI   $FF
         PEI   $FD
         JSL   L1A3302
         PLY
         PLY
         PLY
         PLY
         BRL   L1A2E12
L1A2CE7  PEI   $F9
         PEI   $F7
         JSL   L1A17A7
         PLY
         PLY
         LDX   $F9
         LDA   $F7
         PHA
         TXA
         STAL  L033674
         PLA
         STAL  L033672
         PEA   $0002
         PEA   ^L033672
         PEA   L033672
         JSL   L1A1909
         PEI   $F9
         PEI   $F7
         JSL   L1A172B
         PLY
         PLY
         BRL   L1A2DF0
L1A2D1A  PEI   $F9
         PEI   $F7
         JSL   L1A17A7
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L1A17A7
         PLY
         PLY
         LDX   $F9
         LDA   $F7
         PHA
         TXA
         STAL  L033674
         PLA
         STAL  L033672
         LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L033678
         PLA
         STAL  L033676
         PEA   $0004
         PEA   ^L033672
         PEA   L033672
         JSL   L1A1909
         PEI   $F9
         PEI   $F7
         JSL   L1A172B
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L1A172B
         PLY
         PLY
         BRL   L1A2DF0
L1A2D70  PEI   $F9
         PEI   $F7
         JSL   L1A17A7
         PLY
         PLY
         LDX   $F9
         LDA   $F7
         PHA
         TXA
         STAL  L03367C
         PLA
         STAL  L03367A
         PEA   $0006
         PEA   ^L03367A
         PEA   L03367A
         JSL   L1A1909
         LDA   $FB
         CMP   #$6403
         BNE   L1A2DA7
         LDX   $FF
         LDA   $FD
         STAL  L033680
         BRA   L1A2DB6
L1A2DA7  LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L033684
         PLA
         STAL  L033682
L1A2DB6  PEA   $0005
         PEA   ^L03367A
         PEA   L03367A
         JSL   L1A1909
         PEI   $F9
         PEI   $F7
         JSL   L1A172B
         PLY
         PLY
         BRL   L1A2DF0
         BRL   L1A2DF0
L1A2DD3  DA    L1A2CD4
         DA    L1A2CE7
         DA    L1A2D1A
         DA    L1A2D70
         DA    L1A2D70
         DA    L1A2CCE
L1A2DDF  SEC
         SBC   #$6400
         CMP   #$0005
         BCC   L1A2DEB
         LDA   #$0005
L1A2DEB  ASL
         TAX
         JMP   (L1A2DD3,X)

L1A2DF0  LDA   L0201E7
         CMP   #$0000
         BNE   L1A2DFD
         LDA   #$0000
         BRA   L1A2E12
L1A2DFD  LDA   L0201E7
         PHA
         LDA   #$8000
         PLX
         STX   $F0
         ORA   $F0
         PHA
         LDA   #$4000
         PLX
         STX   $F0
         ORA   $F0
L1A2E12  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A2E1C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E4
         TCS
         PEA   $0001
         PEA   $0000
         PEA   ^L0336B8
         PEA   L0336B8
         PEI   $F9
         PEI   $F7
         JSL   L1A2FDA
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BEQ   L1A2E4C
         LDA   #$0000
         BRL   L1A2F8C
L1A2E4C  PEA   $0001
         PEA   $0000
         PEA   ^L0336BE
         PEA   L0336BE
         PEI   $F9
         PEI   $F7
         JSL   L1A2FDA
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BEQ   L1A2E70
         STZ   $EA
         BRL   L1A2EC2
L1A2E70  PEA   $0001
         PEA   $0000
         PEA   ^L0336C5
         PEA   L0336C5
         PEI   $F9
         PEI   $F7
         JSL   L1A2FDA
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BEQ   L1A2E96
         LDA   #$0001
         STA   $EA
         BRA   L1A2EC2
L1A2E96  PEA   $0001
         PEA   $0000
         PEA   ^L0336CD
         PEA   L0336CD
         PEI   $F9
         PEI   $F7
         JSL   L1A2FDA
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BEQ   L1A2EBC
         LDA   #$0002
         STA   $EA
         BRA   L1A2EC2
L1A2EBC  LDA   #$FFFF
         BRL   L1A2F8C
L1A2EC2  LDA   $FB
         CMP   #$6400
         BEQ   L1A2ECF
         LDA   #$4016
         BRL   L1A2F8C
L1A2ECF  LDA   [$FD]
         AND   #$0500
         CMP   #$0500
         BNE   L1A2EDF
         LDA   #$4011
         BRL   L1A2F8C
L1A2EDF  PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $E8
         STA   $E6
         LDA   $E6
         CMP   #$0000
         BNE   L1A2F06
         LDA   $E8
         CMP   #$0000
         BNE   L1A2F06
         LDA   #$4009
         BRL   L1A2F8C
L1A2F06  LDA   [$FD]
         PHA
         LDA   [$E6]
         PLX
         STX   $F0
         AND   $F0
         AND   #$0003
         PHA
         LDA   [$FD]
         AND   #$0003
         PLX
         STX   $EC
         CMP   $EC
         BEQ   L1A2F25
         LDA   #$400D
         BRA   L1A2F8C
L1A2F25  PEA   $0000
         PEA   $6601
         PEI   $E8
         PEI   $E6
         LDY   #$0006
         LDA   [$E6],Y
         TAX
         LDY   #$0004
         LDA   [$E6],Y
         STA   $EC
         STX   $EE
         LDY   #$0016
         LDA   [$EC],Y
         TAX
         LDY   #$0014
         LDA   [$EC],Y
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
         JSL   L1A1947
         PLY
         PLY
         PLY
         PLY
         LDY   #$0006
         LDA   [$E6],Y
         TAX
         LDY   #$0004
         LDA   [$E6],Y
         LDY   #$0006
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0004
         STA   [$FD],Y
         LDY   #$000A
         LDA   [$E6],Y
         TAX
         LDY   #$0008
         LDA   [$E6],Y
         LDY   #$000A
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0008
         STA   [$FD],Y
         LDA   #$0000
L1A2F8C  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A2F96  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         LDA   #$0012
         PHA
         LDAL  L03346B
         SEC
         JSL   L1A0F19
         PLY
         SEC
         SBC   #$0001
         STA   $F0
         STZ   $F2
         BRA   L1A2FC2
L1A2FB9  PEI   $F2
         JSL   L1A13FF
         PLY
         INC   $F2
L1A2FC2  LDA   $F2
         SEC
         SBC   $F0
         BEQ   L1A2FB9
         BVS   L1A2FCE
         EOR   #$8000
L1A2FCE  BPL   L1A2FB9
         TAY
         TDC
         CLC
         ADC   #$00F9
         TCS
         TYA
         PLD
         RTL

L1A2FDA  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         BRL   L1A30AB
L1A2FE8  LDA   [$F7]
         AND   #$00FF
         PHA
         LDA   [$FB]
         AND   #$00FF
         PLX
         STX   $EC
         CMP   $EC
         BNE   L1A3000
         LDA   #$0001
         BRL   L1A3085
L1A3000  LDA   $FF
         BEQ   L1A3009
         LDA   #$0000
         BRA   L1A3085
L1A3009  LDA   [$F7]
         AND   #$00FF
         SEC
         SBC   #$0061
         BVS   L1A3017
         EOR   #$8000
L1A3017  BPL   L1A302B
         LDA   [$F7]
         AND   #$00FF
         SEC
         SBC   #$007A
         BEQ   L1A3032
         BVS   L1A3029
         EOR   #$8000
L1A3029  BPL   L1A3032
L1A302B  LDA   [$F7]
         AND   #$00FF
         BRA   L1A303F
L1A3032  LDA   [$F7]
         AND   #$00FF
         CLC
         ADC   #$0041
         SEC
         SBC   #$0061
L1A303F  PHA
         LDA   [$FB]
         AND   #$00FF
         SEC
         SBC   #$0061
         BVS   L1A304E
         EOR   #$8000
L1A304E  BPL   L1A3062
         LDA   [$FB]
         AND   #$00FF
         SEC
         SBC   #$007A
         BEQ   L1A3069
         BVS   L1A3060
         EOR   #$8000
L1A3060  BPL   L1A3069
L1A3062  LDA   [$FB]
         AND   #$00FF
         BRA   L1A3076
L1A3069  LDA   [$FB]
         AND   #$00FF
         CLC
         ADC   #$0041
         SEC
         SBC   #$0061
L1A3076  PLX
         STX   $EC
         CMP   $EC
         BEQ   L1A3082
         LDA   #$0000
         BRA   L1A3085
L1A3082  LDA   #$0001
L1A3085  TAY
         BNE   L1A308D
         LDA   #$0000
         BRA   L1A30C2
L1A308D  LDX   $F9
         LDA   $F7
         INC   $F7
         BNE   L1A3097
         INC   $F9
L1A3097  STA   $EC
         STX   $EE
         LDX   $FD
         LDA   $FB
         INC   $FB
         BNE   L1A30A5
         INC   $FD
L1A30A5  STA   $EC
         STX   $EE
         LDA   [$EC]
L1A30AB  LDA   [$F7]
         AND   #$00FF
         BEQ   L1A30B5
         BRL   L1A2FE8
L1A30B5  LDA   [$FB]
         AND   #$00FF
         BEQ   L1A30BF
         BRL   L1A2FE8
L1A30BF  LDA   #$0001
L1A30C2  TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A30CC  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   L0201EB
         SEC
         SBC   #$0000
         BEQ   L1A30E7
         BVS   L1A30E5
         EOR   #$8000
L1A30E5  BMI   L1A3106
L1A30E7  PEA   $0100
         PEA   ^L033572
         PEA   L033572
         JSL   L1A357C
         PLY
         PLY
         PLY
         STA   L0201EB
         LDA   #L033572
         LDX   #^L033572
         STX   L0201EF
         STA   L0201ED
L1A3106  LDY   #$000C
         LDA   [$FD],Y
         CMP   #$0000
         BNE   L1A3113
         BRL   L1A31AB
L1A3113  BCS   L1A3118
         BRL   L1A31AB
L1A3118  LDA   L0201EB
         SEC
         SBC   #$0000
         BNE   L1A3124
         BRL   L1A31AB
L1A3124  BVS   L1A3129
         EOR   #$8000
L1A3129  BMI   L1A312E
         BRL   L1A31AB
L1A312E  LDX   L0201EF
         LDA   L0201ED
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$0000
         BNE   L1A3145
         BRL   L1A31AB
L1A3145  LDX   L0201EF
         LDA   L0201ED
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   L0201ED
         LDA   L0201EF
         BCC   L1A315A
         INC
L1A315A  STA   L0201EF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         PHX
         PHA
         CLC
         ADC   #$0001
         LDY   #$000E
         STA   [$FD],Y
         LDY   #$0010
         LDA   [$FD],Y
         BCC   L1A3184
         INC
L1A3184  LDY   #$0010
         STA   [$FD],Y
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDY   #$000C
         LDA   [$FD],Y
         DEC
         LDY   #$000C
         STA   [$FD],Y
         LDA   L0201EB
         DEC
         STA   L0201EB
         BRL   L1A3106
L1A31AB  LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A31B8  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E8
         TCS
         LDY   #$000A
         LDA   [$FD],Y
         TAX
         LDY   #$0008
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         STAL  L03369E
         LDY   #$000C
         LDA   [$FD],Y
         LDX   #$0000
         PHA
         TXA
         STAL  L0336A6
         PLA
         STAL  L0336A4
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         PHA
         TXA
         STAL  L0336A2
         PLA
         STAL  L0336A0
         PEA   $0012
         PEA   ^L03369E
         PEA   L03369E
         JSL   L1A1909
         LDA   [$FD]
         AND   #$0020
         TAY
         BNE   L1A3271
         LDAL  L0336AA
         TAX
         LDAL  L0336A8
         STA   $EE
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         STX   $EC
         STA   $EA
         BRA   L1A3262
L1A3241  LDA   [$EA]
         AND   #$00FF
         CMP   #$000D
         BNE   L1A3254
         LDA   #$000A
         SEP   #$20
         STA   [$EA]
         REP   #$20
L1A3254  LDA   $EE
         DEC   $EE
         LDX   $EC
         LDA   $EA
         INC   $EA
         BNE   L1A3262
         INC   $EC
L1A3262  LDA   $EE
         SEC
         SBC   #$0000
         BEQ   L1A3271
         BVS   L1A326F
         EOR   #$8000
L1A326F  BMI   L1A3241
L1A3271  LDA   L0201E7
         CMP   #$004C
         BNE   L1A327D
         STZ   $F0
         BRA   L1A3282
L1A327D  LDA   L0201E7
         STA   $F0
L1A3282  LDA   $F0
         CMP   #$0000
         BNE   L1A32CA
         LDY   #$000C
         LDA   [$FD],Y
         LDX   #$0000
         SEC
         SBCL  L0336A8
         PHA
         TXA
         SBCL  L0336AA
         TAX
         PLA
         LDY   #$000C
         STA   [$FD],Y
         LDY   #$0010
         LDA   [$FD],Y
         TAX
         LDY   #$000E
         LDA   [$FD],Y
         CLC
         ADCL  L0336A8
         PHA
         TXA
         ADCL  L0336AA
         TAX
         PLA
         LDY   #$0010
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$000E
         STA   [$FD],Y
         BRA   L1A32D1
L1A32CA  LDA   $F0
         LDY   #$0002
         STA   [$FD],Y
L1A32D1  LDA   $F0
         CMP   #$0000
         BNE   L1A32DD
         LDA   #$0000
         BRA   L1A32E0
L1A32DD  LDA   #$0005
L1A32E0  TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A32EA  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A3302  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         STZ   $EA
         PEI   $FF
         PEI   $FD
         JSL   L1A17A7
         PLY
         PLY
         LDA   [$F9]
         STA   $EC
         LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L03367C
         PLA
         STAL  L03367A
         PEA   $0006
         PEA   ^L03367A
         PEA   L03367A
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A3344
         BRL   L1A33FA
L1A3344  LDA   $EC
         AND   #$0500
         CMP   #$0500
         BNE   L1A3356
         LDA   #$0011
         STA   $EA
         BRL   L1A33F7
L1A3356  LDA   $EC
         AND   #$0001
         TAY
         BEQ   L1A3368
         LDAL  L03367E
         AND   #$0001
         TAY
         BEQ   L1A337A
L1A3368  LDA   $EC
         AND   #$0002
         TAY
         BEQ   L1A3382
         LDAL  L03367E
         AND   #$0002
         TAY
         BNE   L1A3382
L1A337A  LDA   #$000D
         STA   $EA
         BRL   L1A33F7
L1A3382  LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L033698
         PLA
         STAL  L033696
         PEA   $0010
         PEA   ^L033694
         PEA   L033694
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A33A9
         BRL   L1A33F7
L1A33A9  LDA   $EC
         AND   #$0200
         TAY
         BNE   L1A33B4
         BRL   L1A33F7
L1A33B4  LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L0336B6
         PLA
         STAL  L0336B4
         LDAL  L033694
         STAL  L0336B2
         PEA   $0018
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A33F7
         LDAL  L033694
         STAL  L03369E
         PEA   $0014
         PEA   ^L03369E
         PEA   L03369E
         JSL   L1A1909
L1A33F7  BRL   L1A34A0
L1A33FA  LDA   L0201E7
         CMP   #$0046
         BEQ   L1A3405
         BRL   L1A34A0
L1A3405  LDA   $EC
         AND   #$0100
         TAY
         BNE   L1A3410
         BRL   L1A34A0
L1A3410  LDAL  L03367E
         ORA   #$00C3
         STAL  L03367E
         LDA   $EC
         AND   #$0020
         TAY
         BEQ   L1A342C
         LDA   #$0000
         STAL  L033680
         BRA   L1A3433
L1A342C  LDA   #$0004
         STAL  L033680
L1A3433  LDA   #$0000
         STAL  L03368A
         STAL  L033688
         PEA   $0001
         PEA   ^L03367A
         PEA   L03367A
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A3456
         BRL   L1A34A0
L1A3456  LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L033698
         PLA
         STAL  L033696
         PEA   $0010
         PEA   ^L033694
         PEA   L033694
         JSL   L1A1909
         LDA   L0201E7
         STA   $E8
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A34A0
         LDX   $FF
         LDA   $FD
         PHA
         TXA
         STAL  L033674
         PLA
         STAL  L033672
         PEA   $0002
         PEA   ^L033672
         PEA   L033672
         JSL   L1A1909
         LDA   $E8
         STA   L0201E7
L1A34A0  PEI   $FF
         PEI   $FD
         JSL   L1A172B
         PLY
         PLY
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A34CA
         LDA   L0201E7
         PHA
         LDA   #$8000
         PLX
         STX   $F2
         ORA   $F2
         STA   $EA
         LDA   L0201E7
         LDY   #$0002
         STA   [$F9],Y
         BRA   L1A34D9
L1A34CA  LDA   $EA
         CMP   #$0000
         BEQ   L1A34D9
         LDA   #$0000
         LDY   #$0002
         STA   [$F9],Y
L1A34D9  LDA   $EA
         CMP   #$0000
         BNE   L1A355B
         PHX
         PHA
         PEA   $0000
         PEA   $000E
         LDA   L0201E5
         ORA   #$0F00
         PHA
         PEA   $8300
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L1A3504
         LDA   #$0000
L1A3504  STAL  L0201E7
         PLA
         PLX
         LDY   #$000A
         PHA
         TXA
         STA   [$F9],Y
         PLA
         LDY   #$0008
         STA   [$F9],Y
         LDY   #$000A
         LDA   [$F9],Y
         TAX
         LDY   #$0008
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STA   $EE
         STX   $F0
         LDAL  L033694
         LDY   #$0002
         STA   [$EE],Y
         LDY   #$000A
         LDA   [$F9],Y
         TAX
         LDY   #$0008
         LDA   [$F9],Y
         STA   $EE
         STX   $F0
         LDY   #$0002
         LDA   [$EE],Y
         TAX
         LDA   [$EE]
         STA   $EE
         STX   $F0
         LDA   #$0001
         STA   [$EE]
L1A355B  LDA   $EA
         CMP   #$0000
         BNE   L1A3567
         LDA   #$0000
         BRA   L1A3572
L1A3567  LDA   $EA
         PHA
         LDA   #$4000
         PLX
         STX   $F2
         ORA   $F2
L1A3572  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L1A357C  PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EB
         TCS
         STZ   $EE
L1A3589  LDA   $EE
         SEC
         SBC   $FF
         BVS   L1A3593
         EOR   #$8000
L1A3593  BPL   L1A3598
         BRL   L1A36DF
L1A3598  PHA
         PEA   $0001
         _ReadChar
         BCS   L1A35A8
         LDA   #$0000
L1A35A8  STAL  L0201E7
         PLA
         SEP   #$20
         STA   $ED
         REP   #$20
         PHA
         LDX   $FD
         LDA   $FB
         INC   $FB
         BNE   L1A35BE
         INC   $FD
L1A35BE  STA   $F0
         STX   $F2
         PLA
         SEP   #$20
         STA   [$F0]
         REP   #$20
         INC   $EE
         LDA   $ED
         AND   #$00FF
         CMP   #$000D
         BNE   L1A3607
         LDX   $FD
         LDA   $FB
         SEC
         SBC   #$0001
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STA   $F0
         STX   $F2
         LDA   #$000A
         SEP   #$20
         STA   [$F0]
         REP   #$20
         PEA   $000A
         _WriteChar
         BCS   L1A3600
         LDA   #$0000
L1A3600  STAL  L0201E7
         BRL   L1A36DF
L1A3607  LDA   $ED
         AND   #$00FF
         CMP   #$0000
         BNE   L1A363A
         PEA   $000D
         _WriteChar
         BCS   L1A3620
         LDA   #$0000
L1A3620  STAL  L0201E7
         PEA   $000A
         _WriteChar
         BCS   L1A3633
         LDA   #$0000
L1A3633  STAL  L0201E7
         BRL   L1A36DF
L1A363A  LDA   $ED
         AND   #$00FF
         CMP   #$007F
         BEQ   L1A3647
         BRL   L1A36DC
L1A3647  LDA   $FB
         BNE   L1A364D
         DEC   $FD
L1A364D  DEC   $FB
         DEC   $EE
         PEA   $0008
         _WriteChar
         BCS   L1A3660
         LDA   #$0000
L1A3660  STAL  L0201E7
         PEA   $0020
         _WriteChar
         BCS   L1A3673
         LDA   #$0000
L1A3673  STAL  L0201E7
         PEA   $0008
         _WriteChar
         BCS   L1A3686
         LDA   #$0000
L1A3686  STAL  L0201E7
         LDA   $EE
         SEC
         SBC   #$0000
         BEQ   L1A36DC
         BVS   L1A3697
         EOR   #$8000
L1A3697  BPL   L1A36DC
         LDA   $FB
         BNE   L1A369F
         DEC   $FD
L1A369F  DEC   $FB
         DEC   $EE
         PEA   $0008
         _WriteChar
         BCS   L1A36B2
         LDA   #$0000
L1A36B2  STAL  L0201E7
         PEA   $0020
         _WriteChar
         BCS   L1A36C5
         LDA   #$0000
L1A36C5  STAL  L0201E7
         PEA   $0008
         _WriteChar
         BCS   L1A36D8
         LDA   #$0000
L1A36D8  STAL  L0201E7
L1A36DC  BRL   L1A3589
L1A36DF  LDA   $EE
         TAY
         TDC
         CLC
         ADC   #$00F5
         TCS
         TYA
         PLD
         RTL

