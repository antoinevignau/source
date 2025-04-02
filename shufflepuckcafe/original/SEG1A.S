*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg1A.L
         lst   off

*-----------

         use   Seg1A.E
         use   Seg1A.X

*-----------

         use   4/Event.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/Misc.Macs
         use   4/SANE.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*-----------

L1A0000  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         PEA   ^L032525
         PEA   L032525
         JSL   L1A0E02
         PLY
         PLY
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         LDAL  L032546
         PHA
         LDAL  L032544
         PHA
         _FindWindow
         BCS   L1A0037
         LDA   #$0000
L1A0037  STAL  L0201E7
         PLA
         STA   $F4
         LDA   $F4
         CMP   #$0011
         BNE   L1A0074
         PEA   ^L03253A
         PEA   L03253A
         PEA   $0000
         PEA   $0000
         _MenuSelect
         BCS   L1A005D
         LDA   #$0000
L1A005D  STAL  L0201E7
         LDAL  L03254C
         TAX
         LDAL  L03254A
         PHX
         PHA
         JSL   L1C0764
         PLY
         PLY
         BRA   L1A0078
L1A0074  JSL   L130027
L1A0078  JSL   L1A0E95
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L1A0084  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDAL  L032548
         AND   #$0100
         TAY
         BEQ   L1A00C8
         PEA   ^L03253A
         PEA   L03253A
         PEA   $0000
         PEA   $0000
         _MenuKey
         BCS   L1A00B1
         LDA   #$0000
L1A00B1  STAL  L0201E7
         LDAL  L03254C
         TAX
         LDAL  L03254A
         PHX
         PHA
         JSL   L1C0764
         PLY
         PLY
         BRA   L1A00CC
L1A00C8  JSL   L130027
L1A00CC  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1A00D4  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020128
         PEA   ^L032533
         PEA   L032533
         JSL   L1A0E02
         PLY
         PLY
         STZ   L02011E
         JSL   L0F19F5
         JSL   L130185
         JSL   L260000
         PHA
         PEA   $FFFF
         PEA   $0000
         _FlushEvents
         BCS   L1A0110
         LDA   #$0000
L1A0110  STAL  L0201E7
         PLA
L1A0115  LDA   L02011E
         BEQ   L1A011D
         BRL   L1A0178
L1A011D  JSL   L1300A8
         TAY
         BEQ   L1A0127
         BRL   L1A0176
L1A0127  PHA
         PEA   $000A
         PEA   ^L03253A
         PEA   L03253A
         _GetNextEvent
         BCS   L1A013D
         LDA   #$0000
L1A013D  STAL  L0201E7
         PLA
         TAY
         BNE   L1A0148
         BRL   L1A0176
L1A0148  LDAL  L03253A
         BRL   L1A0168
L1A014F  JSL   L1A0000
         BRL   L1A0176
L1A0156  JSL   L1A0084
         BRL   L1A0176
L1A015D  BRL   L1A0176
L1A0160  DA    L1A014F
         DA    L1A015D
         DA    L1A0156
         DA    L1A015D
L1A0168  DEC
         CMP   #$0003
         BCC   L1A0171
         LDA   #$0003
L1A0171  ASL
         TAX
         JMP   (L1A0160,X)

L1A0176  BRA   L1A0115
L1A0178  JSL   L0F19B6
         JSL   L060000
         JSL   L19003E
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1A0190  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDX   #$0000
         LDA   #$C20D
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         PHA
         LDA   #$C200
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $F4
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $00C2
         PEA   $0020
         PEI   $F4
         _FWEntry
         PLA
         PLA
         STA   L02012A
         PLA
         PLA
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L1A01E3  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F0
         TCS
         LDX   #$0000
         LDA   #$C20F
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         PHA
         LDA   #$C200
         PLX
         STX   $F8
         CLC
         ADC   $F8
         STA   $F2
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $FF
         PEA   $00C2
         PEA   $0020
         PEI   $F2
         _FWEntry
         PLA
         PLA
         STA   L02012A
         PLA
         PLA
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDX   #$0000
         LDA   #$C20E
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         PHA
         LDA   #$C200
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $F4
         LDA   #$0000
         BEQ   L1A0265
         LDA   #$0000
         BRA   L1A028A
L1A0265  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $00C2
         PEA   $0020
         PEI   $F4
         _FWEntry
         PLA
         PLA
         STA   L02012A
         PLA
         PLX
L1A028A  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDX   #$0000
         LDA   #$C210
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         PHA
         LDA   #$C200
         PLX
         STX   $FA
         CLC
         ADC   $FA
         STA   $F4
         LDA   #$0000
         BEQ   L1A02C4
         LDA   #$0000
         BRA   L1A02F6
L1A02C4  PHP
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $00C2
         PEA   $0020
         PEI   $F4
         _FWEntry
         PLA
         PLA
         STA   L02012A
         PLA
         PLP
         PLP
         BCC   L1A02F2
         LDA   #$0001
         BRA   L1A02F5
L1A02F2  LDA   #$0000
L1A02F5  PLP
L1A02F6  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L1A0300  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
L1A030B  LDA   [$FD]
         AND   #$00FF
         CMP   #$0000
         BEQ   L1A0330
         LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L1A031F
         INC   $FF
L1A031F  STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         PHA
         JSL   L1A01E3
         PLY
         BRA   L1A030B
L1A0330  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1A0338  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00BC
         TCS
         STZ   $C0
         LDA   $F5
         BRL   L1A0369
L1A034A  LDA   #$000A
         STA   $BE
         BRL   L1A037D
L1A0352  LDA   #$000A
         STA   $BE
         BRL   L1A037D
L1A035A  LDA   #$0008
         STA   $BE
         BRL   L1A037D
L1A0362  LDA   #$0010
         STA   $BE
         BRA   L1A037D
L1A0369  CMP   #$0064
         BEQ   L1A034A
         CMP   #$006F
         BEQ   L1A035A
         CMP   #$0075
         BEQ   L1A0352
         CMP   #$0078
         BEQ   L1A0362
L1A037D  SEC
         LDA   $FD
         SBC   #$0000
         BNE   L1A038C
         LDA   $FF
         SBC   #$0000
         BRA   L1A0393
L1A038C  LDA   $FF
         SBC   #$0000
         REP   #$02
L1A0393  BVS   L1A0398
         EOR   #$8000
L1A0398  BMI   L1A03F1
         LDA   $F5
         CMP   #$0064
         BNE   L1A03DB
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F9]
         LDY   #$0002
         LDA   [$F9],Y
         BCC   L1A03B9
         INC
L1A03B9  LDY   #$0002
         STA   [$F9],Y
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   #$002D
         SEP   #$20
         STA   [$EA]
         REP   #$20
         LDX   $FF
         LDA   $FD
         JSL   L1A0F0A
         STX   $FF
         STA   $FD
         BRA   L1A03F1
L1A03DB  LDA   $F7
         BNE   L1A03F1
         LDX   $FF
         LDA   $FD
         AND   #$FFFF
         PHA
         TXA
         AND   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
L1A03F1  LDA   $BE
         CMP   #$0008
         BNE   L1A0408
         LDX   $FF
         LDA   $FD
         AND   #$0007
         PHA
         TXA
         AND   #$0000
         TAX
         PLA
         BRA   L1A0435
L1A0408  LDA   $BE
         CMP   #$0010
         BNE   L1A041F
         LDX   $FF
         LDA   $FD
         AND   #$000F
         PHA
         TXA
         AND   #$0000
         TAX
         PLA
         BRA   L1A0435
L1A041F  LDA   $BE
         LDX   #$0000
         TAY
         BPL   L1A0428
         DEX
L1A0428  PHX
         PHA
         LDX   $FF
         LDA   $FD
         SEC
         JSL   L1A0F9E
         PLA
         PLX
L1A0435  PHA
         LDA   $C0
         INC   $C0
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EA
         STX   $EC
         PLA
         STA   [$EA]
         LDA   $BE
         CMP   #$0008
         BNE   L1A047B
         LDX   #$0000
         LDA   #$0003
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         SEC
         JSL   L1A186E
         PLA
         PLX
         AND   #$FFFF
         PHA
         TXA
         AND   #$1FFF
         TAX
         PLA
         BRA   L1A04B7
L1A047B  LDA   $BE
         CMP   #$0010
         BNE   L1A04A1
         LDX   #$0000
         LDA   #$0004
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         SEC
         JSL   L1A186E
         PLA
         PLX
         AND   #$FFFF
         PHA
         TXA
         AND   #$0FFF
         TAX
         PLA
         BRA   L1A04B7
L1A04A1  LDA   $BE
         LDX   #$0000
         TAY
         BPL   L1A04AA
         DEX
L1A04AA  PHX
         PHA
         LDX   $FF
         LDA   $FD
         SEC
         JSL   L1A0F9E
         PLY
         PLY
L1A04B7  STX   $FF
         STA   $FD
         LDX   $FF
         LDA   $FD
         STX   $EA
         ORA   $EA
         BEQ   L1A04C8
         BRL   L1A03F1
L1A04C8  LDA   $C0
         BNE   L1A04CF
         BRL   L1A056C
L1A04CF  DEC   $C0
         LDA   $C0
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         SEC
         SBC   #$000A
         BVS   L1A04F6
         EOR   #$8000
L1A04F6  BPL   L1A051E
         LDA   $C0
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         SEC
         SBC   #$000A
         CLC
         ADC   #$0041
         BRA   L1A053E
L1A051E  LDA   $C0
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00C2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         CLC
         ADC   #$0030
L1A053E  PHA
         LDY   #$0002
         LDA   [$F9],Y
         TAX
         LDA   [$F9]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F9]
         LDY   #$0002
         LDA   [$F9],Y
         BCC   L1A0557
         INC
L1A0557  LDY   #$0002
         STA   [$F9],Y
         PLA
         PLX
         STA   $EA
         STX   $EC
         PLA
         SEP   #$20
         STA   [$EA]
         REP   #$20
         BRL   L1A04C8
L1A056C  TSC
         CLC
         ADC   #$0032
         TCS
         PLD
         RTL

L1A0574  PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$00DA
         TCS
         LDX   #$0000
         TDC
         CLC
         ADC   #$00F7
         STX   $DE
         STA   $DC
         LDA   $F1
         CMP   #$0100
         BNE   L1A0597
         LDA   #$0006
         STA   $F1
L1A0597  LDA   $F1
         STAL  L032656
         LDA   $EF
         CMP   #$0066
         BNE   L1A05B1
         LDA   #$0001
         SEP   #$20
         STAL  L032654
         REP   #$20
         BRA   L1A05D5
L1A05B1  LDA   $EF
         CMP   #$0065
         BEQ   L1A05BF
         LDA   $EF
         CMP   #$0067
         BNE   L1A05D5
L1A05BF  LDA   #$0000
         SEP   #$20
         STAL  L032654
         REP   #$20
         LDAL  L032656
         PHA
         INC
         STAL  L032656
         PLA
L1A05D5  PEA   ^L032654
         PEA   L032654
         PEI   $DE
         PEI   $DC
         PEA   ^L032658
         PEA   L032658
         PEA   $000B
         _SANEFP816
         PEA   ^L03265C
         PEA   L03265C
         JSL   L1A172B
         PLY
         PLY
         LDAL  L032658
         AND   #$00FF
         BEQ   L1A0630
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A061C
         INC
L1A061C  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   #$002D
         SEP   #$20
         STA   [$E4]
         REP   #$20
L1A0630  LDAL  L03265C
         AND   #$00FF
         SEC
         SBC   #$0030
         BVS   L1A0640
         EOR   #$8000
L1A0640  BPL   L1A0662
         LDAL  L03265C
         AND   #$00FF
         SEC
         SBC   #$0039
         BEQ   L1A0656
         BVS   L1A0654
         EOR   #$8000
L1A0654  BMI   L1A0662
L1A0656  LDAL  L03265C
         AND   #$00FF
         CMP   #$0030
         BNE   L1A069B
L1A0662  LDAL  L03265D
         AND   #$00FF
         BNE   L1A069B
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A0683
         INC
L1A0683  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDAL  L03265C
         SEP   #$20
         STA   [$E4]
         REP   #$20
         BRL   L1A08DD
L1A069B  LDA   $EF
         CMP   #$0066
         BEQ   L1A06A5
         BRL   L1A07D2
L1A06A5  PEA   ^L03265C
         PEA   L03265C
         JSL   L1A18B7
         PLY
         PLY
         SEC
         SBC   $F1
         STA   $E2
         STZ   $E0
L1A06B8  LDA   $E2
         SEC
         SBC   #$0000
         BEQ   L1A0711
         BVS   L1A06C5
         EOR   #$8000
L1A06C5  BPL   L1A0711
         LDA   $E0
         INC   $E0
         LDX   #$0000
         PHX
         PHA
         LDA   #L03265C
         LDX   #^L03265C
         JSL   L1A0EFF
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         PHA
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A06FB
         INC
L1A06FB  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         PLA
         SEP   #$20
         STA   [$E4]
         REP   #$20
         DEC   $E2
         BRA   L1A06B8
L1A0711  LDA   $F1
         BEQ   L1A0741
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A072D
         INC
L1A072D  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   #$002E
         SEP   #$20
         STA   [$E4]
         REP   #$20
L1A0741  LDA   $E2
         INC   $E2
         SEC
         SBC   #$0000
         BVS   L1A074E
         EOR   #$8000
L1A074E  BMI   L1A0780
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A0768
         INC
L1A0768  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   #$0030
         SEP   #$20
         STA   [$E4]
         REP   #$20
         DEC   $F1
         BRA   L1A0741
L1A0780  LDA   $F1
         DEC   $F1
         TAY
         BEQ   L1A07CF
         LDA   $E0
         INC   $E0
         LDX   #$0000
         PHX
         PHA
         LDA   #L03265C
         LDX   #^L03265C
         JSL   L1A0EFF
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         PHA
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A07BB
         INC
L1A07BB  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         PLA
         SEP   #$20
         STA   [$E4]
         REP   #$20
         BRA   L1A0780
L1A07CF  BRL   L1A08DD
L1A07D2  LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A07EA
         INC
L1A07EA  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDAL  L03265C
         SEP   #$20
         STA   [$E4]
         REP   #$20
         LDA   $F1
         BEQ   L1A082F
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A081B
         INC
L1A081B  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   #$002E
         SEP   #$20
         STA   [$E4]
         REP   #$20
L1A082F  LDA   #$0001
         STA   $E2
         LDAL  L03265A
         CLC
         ADC   $F1
         STAL  L03265A
L1A083F  LDA   $F1
         DEC   $F1
         TAY
         BEQ   L1A088E
         LDA   $E2
         INC   $E2
         LDX   #$0000
         PHX
         PHA
         LDA   #L03265C
         LDX   #^L03265C
         JSL   L1A0EFF
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   [$E4]
         PHA
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A087A
         INC
L1A087A  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         PLA
         SEP   #$20
         STA   [$E4]
         REP   #$20
         BRA   L1A083F
L1A088E  LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$F3]
         LDY   #$0002
         LDA   [$F3],Y
         BCC   L1A08A6
         INC
L1A08A6  LDY   #$0002
         STA   [$F3],Y
         PLA
         PLX
         STA   $E4
         STX   $E6
         LDA   #$0045
         SEP   #$20
         STA   [$E4]
         REP   #$20
         LDAL  L03265A
         LDX   #$0000
         TAY
         BPL   L1A08C5
         DEX
L1A08C5  PHX
         PHA
         PEI   $F5
         PEI   $F3
         PEA   $0000
         PEA   $0064
         JSL   L1A0338
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
L1A08DD  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L1A08E5  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         STZ   $F0
L1A08F2  LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         SEC
         SBC   #$0030
         BVS   L1A090C
         EOR   #$8000
L1A090C  BPL   L1A0978
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         SEC
         SBC   #$0039
         BEQ   L1A092C
         BVS   L1A092A
         EOR   #$8000
L1A092A  BMI   L1A0978
L1A092C  LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         PHA
         LDA   $F0
         PHA
         LDA   #$000A
         SEC
         JSL   L1A109A
         PLA
         PLX
         STX   $F6
         CLC
         ADC   $F6
         SEC
         SBC   #$0030
         STA   $F0
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         PHX
         PHA
         CLC
         ADC   #$0001
         STA   [$FD]
         LDY   #$0002
         LDA   [$FD],Y
         BCC   L1A096E
         INC
L1A096E  LDY   #$0002
         STA   [$FD],Y
         PLA
         PLX
         BRL   L1A08F2
L1A0978  LDA   $F0
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L1A0984  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00CB
         TCS
         LDX   $FB
         LDA   $F9
         STX   $E8
         STA   $E6
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STX   $EC
         STA   $EA
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0004
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
L1A09B6  LDA   [$EA]
         AND   #$00FF
         BNE   L1A09C0
         BRL   L1A0D70
L1A09C0  LDA   [$EA]
         AND   #$00FF
         BEQ   L1A09F9
         LDA   [$EA]
         AND   #$00FF
         CMP   #$0025
         BEQ   L1A09F9
         LDX   $EC
         LDA   $EA
         INC   $EA
         BNE   L1A09DB
         INC   $EC
L1A09DB  STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L1A09EC
         INC   $FB
L1A09EC  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         BRA   L1A09C0
L1A09F9  LDA   [$EA]
         AND   #$00FF
         CMP   #$0025
         BEQ   L1A0A06
         BRL   L1A0D6D
L1A0A06  INC   $EA
         BNE   L1A0A0C
         INC   $EC
L1A0A0C  STZ   $D5
         LDA   #$0100
         STA   $D1
         STZ   $CF
         LDA   #$0020
         SEP   #$20
         STA   $D9
         REP   #$20
         LDA   [$EA]
         AND   #$00FF
         CMP   #$002D
         BNE   L1A0A33
         LDA   #$0001
         STA   $D5
         INC   $EA
         BNE   L1A0A33
         INC   $EC
L1A0A33  LDA   [$EA]
         AND   #$00FF
         CMP   #$0030
         BNE   L1A0A4C
         LDA   #$0030
         SEP   #$20
         STA   $D9
         REP   #$20
         INC   $EA
         BNE   L1A0A4C
         INC   $EC
L1A0A4C  LDX   $EC
         LDA   $EA
         STX   $DC
         STA   $DA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         JSL   L1A08E5
         PLY
         PLY
         STA   $D3
         LDX   $DC
         LDA   $DA
         STX   $EC
         STA   $EA
         LDA   [$EA]
         AND   #$00FF
         CMP   #$002E
         BNE   L1A0A9E
         INC   $EA
         BNE   L1A0A7D
         INC   $EC
L1A0A7D  LDX   $EC
         LDA   $EA
         STX   $DC
         STA   $DA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         JSL   L1A08E5
         PLY
         PLY
         STA   $D1
         LDX   $DC
         LDA   $DA
         STX   $EC
         STA   $EA
L1A0A9E  LDA   [$EA]
         AND   #$00FF
         CMP   #$006C
         BNE   L1A0AB3
         LDA   #$0001
         STA   $CF
         INC   $EA
         BNE   L1A0AB3
         INC   $EC
L1A0AB3  LDA   [$EA]
         AND   #$00FF
         BEQ   L1A0ACF
         LDX   $EC
         LDA   $EA
         INC   $EA
         BNE   L1A0AC4
         INC   $EC
L1A0AC4  STA   $EE
         STX   $F0
         LDA   [$EE]
         AND   #$00FF
         STA   $D7
L1A0ACF  LDX   $FB
         LDA   $F9
         STX   $E4
         STA   $E2
         LDA   $D7
         CMP   #$0064
         BEQ   L1A0AF3
         LDA   $D7
         CMP   #$006F
         BEQ   L1A0AF3
         LDA   $D7
         CMP   #$0078
         BEQ   L1A0AF3
         LDA   $D7
         CMP   #$0075
         BNE   L1A0B4B
L1A0AF3  LDA   $CF
         BEQ   L1A0B01
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         BRA   L1A0B0A
L1A0B01  LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L1A0B0A
         DEX
L1A0B0A  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         PEI   $CF
         PEI   $D7
         JSL   L1A0338
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   $CF
         BEQ   L1A0B2E
         LDA   #$0004
         BRA   L1A0B31
L1A0B2E  LDA   #$0002
L1A0B31  LDX   #$0000
         TAY
         BPL   L1A0B38
         DEX
L1A0B38  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L1A0EFF
         PLA
         PLX
         STX   $FF
         STA   $FD
         BRL   L1A0C57
L1A0B4B  LDA   $D7
         CMP   #$0063
         BNE   L1A0B80
         LDA   [$FD]
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L1A0B5F
         INC   $FB
L1A0B5F  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0002
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
         BRL   L1A0C57
L1A0B80  LDA   $D7
         CMP   #$0073
         BNE   L1A0BE1
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STX   $E0
         STA   $DE
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0004
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
         LDA   $D1
         STA   $CD
         BRA   L1A0BD4
L1A0BAC  LDX   $E0
         LDA   $DE
         INC   $DE
         BNE   L1A0BB6
         INC   $E0
L1A0BB6  STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L1A0BC7
         INC   $FB
L1A0BC7  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         DEC   $CD
L1A0BD4  LDA   $CD
         BEQ   L1A0BDF
         LDA   [$DE]
         AND   #$00FF
         BNE   L1A0BAC
L1A0BDF  BRA   L1A0C57
L1A0BE1  LDA   $D7
         CMP   #$0065
         BEQ   L1A0BF6
         LDA   $D7
         CMP   #$0066
         BEQ   L1A0BF6
         LDA   $D7
         CMP   #$0067
         BNE   L1A0C3F
L1A0BF6  LDY   #$0008
         LDA   [$FD],Y
         PHA
         LDY   #$0006
         LDA   [$FD],Y
         PHA
         LDY   #$0004
         LDA   [$FD],Y
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         PHA
         LDA   [$FD]
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         PEI   $D1
         PEI   $D7
         JSL   L1A0574
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$000A
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
         BRA   L1A0C57
L1A0C3F  LDA   $D7
         PHA
         LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L1A0C4C
         INC   $FB
L1A0C4C  STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
L1A0C57  LDX   $E4
         LDA   $E2
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L1A108F
         PLA
         PLX
         SEC
         SBC   $D3
         BVS   L1A0C6F
         EOR   #$8000
L1A0C6F  BPL   L1A0C74
         BRL   L1A0D6D
L1A0C74  LDA   $D5
         BEQ   L1A0CB4
         LDX   $E4
         LDA   $E2
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L1A108F
         PLA
         PLX
         PHA
         LDA   $D3
         PLX
         STX   $F2
         SEC
         SBC   $F2
         STA   $CD
         BRA   L1A0CAD
L1A0C95  LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L1A0C9F
         INC   $FB
L1A0C9F  STA   $EE
         STX   $F0
         LDA   $D9
         SEP   #$20
         STA   [$EE]
         REP   #$20
         DEC   $CD
L1A0CAD  LDA   $CD
         BNE   L1A0C95
         BRL   L1A0D6D
L1A0CB4  LDA   $D3
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L1A0CC1
         DEX
L1A0CC1  PHX
         PHA
         LDX   $E4
         LDA   $E2
         JSL   L1A0EFF
         PLA
         PLX
         STX   $E0
         STA   $DE
         STX   $DC
         STA   $DA
         LDX   $E4
         LDA   $E2
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L1A108F
         PLA
         PLX
         STA   $CD
         BRA   L1A0D22
L1A0CE9  LDA   $CD
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L1A0CF6
         DEX
L1A0CF6  PHX
         PHA
         LDX   $E4
         LDA   $E2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDX   $E0
         LDA   $DE
         LDA   $DE
         BNE   L1A0D13
         DEC   $E0
L1A0D13  DEC   $DE
         STA   $EE
         STX   $F0
         PLA
         SEP   #$20
         STA   [$EE]
         REP   #$20
         DEC   $CD
L1A0D22  LDA   $CD
         BNE   L1A0CE9
L1A0D26  SEC
         LDA   $E2
         SBC   $DE
         BNE   L1A0D33
         LDA   $E4
         SBC   $E0
         BRA   L1A0D39
L1A0D33  LDA   $E4
         SBC   $E0
         REP   #$02
L1A0D39  BEQ   L1A0D42
         BVS   L1A0D40
         EOR   #$8000
L1A0D40  BMI   L1A0D5A
L1A0D42  LDX   $E4
         LDA   $E2
         INC   $E2
         BNE   L1A0D4C
         INC   $E4
L1A0D4C  STA   $EE
         STX   $F0
         LDA   $D9
         SEP   #$20
         STA   [$EE]
         REP   #$20
         BRA   L1A0D26
L1A0D5A  LDX   $DC
         LDA   $DA
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FB
         STA   $F9
L1A0D6D  BRL   L1A09B6
L1A0D70  LDX   $FB
         LDA   $F9
         INC   $F9
         BNE   L1A0D7A
         INC   $FB
L1A0D7A  STA   $EE
         STX   $F0
         LDA   #$000D
         SEP   #$20
         STA   [$EE]
         REP   #$20
         LDA   #$0000
         SEP   #$20
         STA   [$F9]
         REP   #$20
         LDX   $E8
         LDA   $E6
         PHX
         PHA
         LDX   $FB
         LDA   $F9
         JSL   L1A108F
         PLA
         PLX
         TAY
         TSC
         CLC
         ADC   #$0027
         TCS
         TYA
         PLD
         RTL

L1A0DAA  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   L020128
         BNE   L1A0DBD
         BRL   L1A0DF8
L1A0DBD  LDA   L020120
         BEQ   L1A0DC9
         JSL   L1A0190
         STZ   L020120
L1A0DC9  PEA   ^L032552
         PEA   L032552
         JSL   L1A0300
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00FD
         PHA
         PEA   ^L032679
         PEA   L032679
         JSL   L1A0984
         PLY
         PLY
         PLY
         PLY
         PEA   ^L032679
         PEA   L032679
         JSL   L1A0300
         PLY
         PLY
L1A0DF8  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L1A0E02  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         LDA   L020128
         BNE   L1A0E15
         BRL   L1A0E8B
L1A0E15  LDA   L020120
         BEQ   L1A0E21
         JSL   L1A0190
         STZ   L020120
L1A0E21  STZ   $F0
         BRA   L1A0E47
L1A0E25  LDA   $F0
         LDX   #$0000
         PHX
         PHA
         LDA   #L032552
         LDX   #^L032552
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0020
         SEP   #$20
         STA   [$F2]
         REP   #$20
         INC   $F0
L1A0E47  LDA   $F0
         CMP   L020122
         BNE   L1A0E25
         LDA   L020122
         LDX   #$0000
         PHX
         PHA
         LDA   #L032552
         LDX   #^L032552
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         SEP   #$20
         STA   [$F2]
         REP   #$20
         PEI   $FF
         PEI   $FD
         PEA   ^L03264C
         PEA   L03264C
         JSL   L1A0DAA
         PLY
         PLY
         PLY
         PLY
         LDA   L020122
         CLC
         ADC   #$0002
         STA   L020122
L1A0E8B  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L1A0E95  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020128
         BNE   L1A0EA8
         BRL   L1A0EF5
L1A0EA8  LDA   L020120
         BEQ   L1A0EB4
         JSL   L1A0190
         STZ   L020120
L1A0EB4  LDA   L020122
         CMP   #$0001
         BEQ   L1A0EC8
         BCC   L1A0EC8
         LDA   L020122
         SEC
         SBC   #$0002
         STA   L020122
L1A0EC8  LDA   L020122
         LDX   #$0000
         PHX
         PHA
         LDA   #L032552
         LDX   #^L032552
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   #$0000
         SEP   #$20
         STA   [$F6]
         REP   #$20
         PEA   ^L032651
         PEA   L032651
         JSL   L1A0DAA
         PLY
         PLY
L1A0EF5  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L1A0EFF  ENT
         CLC
         ADC   $04,S
         STA   $04,S
         TXA
         ADC   $06,S
         STA   $06,S
         RTL

L1A0F0A  ENT
         PHA
         TXA
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         INC
         BNE   L1A0F18
         INX
L1A0F18  RTL

L1A0F19  ENT
         PHD
         PHA
         PEA   $0001
         TSC
         TCD
         LDA   $0A
         BEQ   L1A0F8E
         LDX   #$0000
         BCC   L1A0F44
         BIT   #$8000
         BEQ   L1A0F35
         EOR   #$FFFF
         INC
         STA   $0A
         INX
L1A0F35  LDA   $03
         BIT   #$8000
         BEQ   L1A0F44
         EOR   #$FFFF
         INC
         STA   $03
         INX
         INX
L1A0F44  LDY   #$0000
         BRA   L1A0F4B
L1A0F49  ASL   $01
L1A0F4B  ASL   $0A
         BCC   L1A0F49
         ROR   $0A
L1A0F51  LDA   $03
         CMP   $0A
         BCC   L1A0F62
         LDA   $03
         SEC
         SBC   $0A
         STA   $03
         TYA
         ORA   $01
         TAY
L1A0F62  LSR   $0A
         LSR   $01
         BCC   L1A0F51
         LDA   $03
         STA   $0A
         TYA
         CPX   #$0000
         BEQ   L1A0F8A
         CPX   #$0003
         BEQ   L1A0F80
         EOR   #$FFFF
         INC
         CPX   #$0001
         BEQ   L1A0F8A
L1A0F80  TAY
         LDA   $0A
         EOR   #$FFFF
         INC
         STA   $0A
         TYA
L1A0F8A  PLY
         PLY
         PLD
         RTL

L1A0F8E  PEA   $0004
         PEA   $0000
         PEA   $0000
         _SysFailMgr
L1A0F9E  ENT
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
         BNE   L1A0FBB
         LDX   #$0000
         BRL   L1A107F
L1A0FBB  LDX   #$0000
         BCC   L1A0FF3
         LDA   $14
         BIT   #$8000
         BEQ   L1A0FD9
         EOR   #$FFFF
         STA   $14
         LDA   $12
         EOR   #$FFFF
         INC
         BNE   L1A0FD6
         INC   $14
L1A0FD6  STA   $12
         INX
L1A0FD9  LDA   $0B
         BIT   #$8000
         BEQ   L1A0FF3
         EOR   #$FFFF
         STA   $0B
         LDA   $09
         EOR   #$FFFF
         INC
         BNE   L1A0FEF
         INC   $0B
L1A0FEF  STA   $09
         INX
         INX
L1A0FF3  BRA   L1A0FF9
L1A0FF5  ASL   $05
         ROL   $07
L1A0FF9  ASL   $12
         ROL   $14
         BCC   L1A0FF5
         ROR   $14
         ROR   $12
L1A1003  LDA   $0B
         CMP   $14
         BEQ   L1A100D
         BCC   L1A102C
         BRA   L1A1013
L1A100D  LDA   $09
         CMP   $12
         BCC   L1A102C
L1A1013  LDA   $09
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
L1A102C  LSR   $14
         ROR   $12
         LSR   $07
         ROR   $05
         BCC   L1A1003
         CPX   #$0000
         BEQ   L1A106B
         CPX   #$0003
         BEQ   L1A1058
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L1A1051
         INC
L1A1051  STA   $03
         CPX   #$0001
         BEQ   L1A106B
L1A1058  LDA   $09
         EOR   #$FFFF
         STA   $09
         LDA   $0B
         EOR   #$FFFF
         INC   $09
         BNE   L1A1069
         INC
L1A1069  STA   $0B
L1A106B  LDA   $09
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

L1A107F  PEA   $0004
         PEA   $0000
         PEA   $0000
         _SysFailMgr
L1A108F  ENT
         SEC
         SBC   $04,S
         STA   $04,S
         TXA
         SBC   $06,S
         STA   $06,S
         RTL

L1A109A  ENT
         PHD
         PHA
         TSC
         TCD
         LDX   #$0000
         BCC   L1A10BF
         LDA   $08
         BIT   #$8000
         BEQ   L1A10B1
         EOR   #$FFFF
         INC
         STA   $08
         INX
L1A10B1  LDA   $01
         BIT   #$8000
         BEQ   L1A10BF
         EOR   #$FFFF
         INC
         STA   $01
         DEX
L1A10BF  LDA   #$0000
         BRA   L1A10CD
L1A10C4  LSR   $01
         BCC   L1A10CB
         CLC
         ADC   $08
L1A10CB  ASL   $08
L1A10CD  LDY   $01
         BNE   L1A10C4
         CPX   #$0000
         BEQ   L1A10DA
         EOR   #$FFFF
         INC
L1A10DA  STA   $08
         PLY
         PLD
         RTL

L1A10DF  ENT
         PHD
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         TSC
         TCD
         LDX   #$0000
         BCC   L1A1121
         LDA   $10
         BIT   #$8000
         BEQ   L1A1108
         EOR   #$FFFF
         STA   $10
         LDA   $0E
         EOR   #$FFFF
         INC
         BNE   L1A1105
         INC   $10
L1A1105  STA   $0E
         INX
L1A1108  LDA   $07
         BIT   #$8000
         BEQ   L1A1121
         EOR   #$FFFF
         STA   $07
         LDA   $05
         EOR   #$FFFF
         INC
         BNE   L1A111E
         INC   $07
L1A111E  STA   $05
         DEX
L1A1121  BRA   L1A113A
L1A1123  LSR   $07
         ROR   $05
         BCC   L1A1136
         LDA   $01
         CLC
         ADC   $0E
         STA   $01
         LDA   $03
         ADC   $10
         STA   $03
L1A1136  ASL   $0E
         ROL   $10
L1A113A  LDA   $05
         ORA   $07
         BNE   L1A1123
         CPX   #$0000
         BEQ   L1A1158
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L1A1156
         INC
L1A1156  STA   $03
L1A1158  LDA   $01
         STA   $0E
         LDA   $03
         STA   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1A1166  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         LDA   $F9
         SEC
         SBC   #$0000
         BVS   L1A117C
         EOR   #$8000
L1A117C  BMI   L1A1190
         PEA   $0000
         PEA   $0016
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRL   L1A123E
L1A1190  PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $EC
         STA   $EA
         LDA   $EA
         CMP   #$0000
         BNE   L1A11B7
         LDA   $EC
         CMP   #$0000
         BNE   L1A11B7
         LDA   #$FFFF
         BRL   L1A123E
L1A11B7  LDA   [$EA]
         AND   #$0001
         TAY
         BNE   L1A11D0
         PEA   $0000
         PEA   $0009
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A123E
L1A11D0  LDA   $FF
         LDY   #$000C
         STA   [$EA],Y
         LDX   $FD
         LDA   $FB
         LDY   #$0010
         PHA
         TXA
         STA   [$EA],Y
         PLA
         LDY   #$000E
         STA   [$EA],Y
         PEI   $EC
         PEI   $EA
         LDY   #$0006
         LDA   [$EA],Y
         TAX
         LDY   #$0004
         LDA   [$EA],Y
         STA   $EE
         STX   $F0
         LDY   #$000E
         LDA   [$EE],Y
         TAX
         LDY   #$000C
         LDA   [$EE],Y
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         JSL   L1A1947
         PLY
         PLY
         STA   $E8
         LDA   $E8
         CMP   #$0000
         BEQ   L1A1230
         LDY   #$0002
         LDA   [$EA],Y
         PHA
         PEI   $E8
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A123E
L1A1230  LDY   #$000C
         LDA   [$EA],Y
         PHA
         LDA   $FF
         PLX
         STX   $F2
         SEC
         SBC   $F2
L1A123E  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L1A1248  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E2
         TCS
         LDA   #$FFFF
         STA   $E6
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $EA
         STA   $E8
         LDA   $E8
         CMP   #$0000
         BNE   L1A127F
         LDA   $EA
         CMP   #$0000
         BNE   L1A127F
         LDA   #$FFFF
         BRL   L1A1301
L1A127F  LDA   $FF
         CLC
         ADC   #$0001
         STA   [$E8]
         LDA   #$0000
         LDY   #$0002
         STA   [$E8],Y
         LDX   #$0000
         LDA   #$0000
         LDY   #$0006
         PHA
         TXA
         STA   [$E8],Y
         PLA
         LDY   #$0004
         STA   [$E8],Y
         PEI   $EA
         PEI   $E8
         PEA   $6400
         PEI   $FD
         PEI   $FB
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L1A1979
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         STA   $E4
         LDA   $E4
         CMP   #$0000
         BEQ   L1A12D5
         LDA   #$0000
         STA   [$E8]
         LDA   #$FFFF
         BRA   L1A1301
L1A12D5  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0006
         LDA   [$E8],Y
         TAX
         LDY   #$0004
         LDA   [$E8],Y
         JSL   L1A130B
         BNE   L1A12FF
         LDX   $EE
         LDA   $EC
         LDY   #$0006
         PHA
         TXA
         STA   [$E8],Y
         PLA
         LDY   #$0004
         STA   [$E8],Y
L1A12FF  LDA   $E6
L1A1301  TAY
         TDC
         CLC
         ADC   #$00F5
         TCS
         TYA
         PLD
         RTL

L1A130B  ENT
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
         BNE   L1A1326
         TYA
         SBC   $03,S
         BRA   L1A132B
L1A1326  TYA
         SBC   $03,S
         REP   #$02
L1A132B  PHP
         LDA   $00,S
         STA   $08,S
         PLY
         PLY
         PLY
         PLY
         PLP
         RTL

L1A1336  ENT
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
L1A1349  LDA   $F7
         CMP   #$0001
         BEQ   L1A1374
         BCC   L1A1374
         LDA   [$FD]
         STA   [$F9]
         LDA   $F9
         CLC
         ADC   #$0002
         STA   $F9
         BCC   L1A1362
         INC   $FB
L1A1362  LDA   $FD
         CLC
         ADC   #$0002
         STA   $FD
         BCC   L1A136E
         INC   $FF
L1A136E  DEC   $F7
         DEC   $F7
         BRA   L1A1349
L1A1374  LDA   $F7
         BEQ   L1A1380
         SEP   #$20
         LDA   [$FD]
         STA   [$F9]
         REP   #$20
L1A1380  LDX   $EA
         LDA   $E8
         STX   $FF
         STA   $FD
         TDC
         CLC
         ADC   #$00F1
         TCS
         PLD
         RTL

L1A1390  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EE
         TCS
         PEA   $0301
         PEI   $FD
         PEI   $FB
         JSL   L1A1248
         PLY
         PLY
         PLY
         TAY
         TDC
         CLC
         ADC   #$00F5
         TCS
         TYA
         PLD
         RTL

L1A13B3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E4
         TCS
         LDA   $FF
         STA   $E8
         LDX   $FD
         LDA   $FB
         STX   $EC
         STA   $EA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $6600
         PEI   $F9
         JSL   L1A14A8
         PLY
         PLY
         PLY
         PLY
         STA   $E6
         LDA   $E6
         CMP   #$0000
         BNE   L1A13EF
         LDX   $EC
         LDA   $EA
         BRA   L1A13F5
L1A13EF  LDX   #$FFFF
         LDA   #$FFFF
L1A13F5  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L1A13FF  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EC
         TCS
         LDA   $FF
         SEC
         SBC   #$0000
         BVS   L1A1415
         EOR   #$8000
L1A1415  BMI   L1A1428
         PEA   $0000
         PEA   $0016
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A149E
L1A1428  PEA   $0000
         TDC
         CLC
         ADC   #$00FF
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $F2
         STA   $F0
         LDA   $F0
         CMP   #$0000
         BNE   L1A144E
         LDA   $F2
         CMP   #$0000
         BNE   L1A144E
         LDA   #$FFFF
         BRA   L1A149E
L1A144E  PEI   $F2
         PEI   $F0
         LDY   #$0006
         LDA   [$F0],Y
         TAX
         LDY   #$0004
         LDA   [$F0],Y
         STA   $F4
         STX   $F6
         LDY   #$000A
         LDA   [$F4],Y
         TAX
         LDY   #$0008
         LDA   [$F4],Y
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         JSL   L1A1947
         PLY
         PLY
         STA   $EE
         LDA   #$0000
         STA   [$F0]
         LDA   $EE
         CMP   #$0000
         BEQ   L1A149B
         LDY   #$0002
         LDA   [$F0],Y
         PHA
         PEI   $EE
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A149E
L1A149B  LDA   #$0000
L1A149E  TAY
         TDC
         CLC
         ADC   #$00F9
         TCS
         TYA
         PLD
         RTL

L1A14A8  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00DE
         TCS
         LDA   $F9
         SEC
         SBC   #$0000
         BVS   L1A14BE
         EOR   #$8000
L1A14BE  BMI   L1A14D2
         PEA   $0000
         PEA   $0016
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRL   L1A163F
L1A14D2  PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $EC
         STA   $EA
         LDA   $EA
         CMP   #$0000
         BNE   L1A14F9
         LDA   $EC
         CMP   #$0000
         BNE   L1A14F9
         LDA   #$FFFF
         BRL   L1A163F
L1A14F9  LDA   $FB
         BRL   L1A1634
L1A14FE  PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $EC
         PEI   $EA
         LDY   #$0006
         LDA   [$EA],Y
         TAX
         LDY   #$0004
         LDA   [$EA],Y
         STA   $EE
         STX   $F0
         LDY   #$0016
         LDA   [$EE],Y
         TAX
         LDY   #$0014
         LDA   [$EE],Y
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         JSL   L1A1947
         PLY
         PLY
         PLY
         PLY
         PLY
         STA   $E2
         LDA   $E2
         CMP   #$0000
         BNE   L1A1542
         LDA   #$0000
         BRL   L1A163F
L1A1542  LDY   #$0002
         LDA   [$EA],Y
         PHA
         PEI   $E2
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRL   L1A163F
L1A1556  LDX   $FF
         LDA   $FD
         SEC
         SBC   #$0000
         BVS   L1A1563
         EOR   #$8000
L1A1563  BMI   L1A1577
         PEA   $0000
         PEA   $0009
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRL   L1A163F
L1A1577  LDX   $FF
         LDA   $FD
         PHA
         LDA   #$FFFF
         PLX
         STX   $F2
         SEC
         SBC   $F2
         STA   $E4
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $E8
         STA   $E6
         LDA   $E6
         CMP   #$0000
         BNE   L1A15AE
         LDA   $E8
         CMP   #$0000
         BNE   L1A15AE
         LDA   #$FFFF
         BRL   L1A163F
L1A15AE  PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $EC
         STA   $EA
         LDA   $EA
         LDX   $EC
         PHX
         PHA
         LDA   $E8
         PHA
         LDA   $E6
         PHA
         PEA   $0012
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         PEA   $0000
         PEA   $6601
         PEI   $EC
         PEI   $EA
         LDY   #$0006
         LDA   [$EA],Y
         TAX
         LDY   #$0004
         LDA   [$EA],Y
         STA   $EE
         STX   $F0
         LDY   #$0016
         LDA   [$EE],Y
         TAX
         LDY   #$0014
         LDA   [$EE],Y
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         JSL   L1A1947
         PLY
         PLY
         PLY
         PLY
         STA   $E2
         LDA   $E2
         CMP   #$0000
         BEQ   L1A162E
         LDA   #$0000
         STA   [$E6]
         LDY   #$0002
         LDA   [$EA],Y
         PHA
         PEI   $E2
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A163F
L1A162E  LDA   $E4
         BRA   L1A163F
         BRA   L1A163F
L1A1634  CMP   #$6601
         BNE   L1A163C
         BRL   L1A1556
L1A163C  JMP   L1A14FE

L1A163F  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L1A1649  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E6
         TCS
         LDA   $F9
         SEC
         SBC   #$0000
         BVS   L1A165F
         EOR   #$8000
L1A165F  BMI   L1A1673
         PEA   $0000
         PEA   $0016
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRL   L1A1721
L1A1673  PEA   $0000
         TDC
         CLC
         ADC   #$00F9
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $EC
         STA   $EA
         LDA   $EA
         CMP   #$0000
         BNE   L1A169A
         LDA   $EC
         CMP   #$0000
         BNE   L1A169A
         LDA   #$FFFF
         BRL   L1A1721
L1A169A  LDA   [$EA]
         AND   #$0002
         TAY
         BNE   L1A16B3
         PEA   $0000
         PEA   $0009
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A1721
L1A16B3  LDA   $FF
         LDY   #$000C
         STA   [$EA],Y
         LDX   $FD
         LDA   $FB
         LDY   #$0010
         PHA
         TXA
         STA   [$EA],Y
         PLA
         LDY   #$000E
         STA   [$EA],Y
         PEI   $EC
         PEI   $EA
         LDY   #$0006
         LDA   [$EA],Y
         TAX
         LDY   #$0004
         LDA   [$EA],Y
         STA   $EE
         STX   $F0
         LDY   #$0012
         LDA   [$EE],Y
         TAX
         LDY   #$0010
         LDA   [$EE],Y
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         JSL   L1A1947
         PLY
         PLY
         STA   $E8
         LDA   $E8
         CMP   #$0000
         BEQ   L1A1713
         LDY   #$0002
         LDA   [$EA],Y
         PHA
         PEI   $E8
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRA   L1A1721
L1A1713  LDY   #$000C
         LDA   [$EA],Y
         PHA
         LDA   $FF
         PLX
         STX   $F2
         SEC
         SBC   $F2
L1A1721  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L1A172B  PHD
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
         BEQ   L1A1799
         LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L1A1752
         INC   $FF
L1A1752  STX   $EE
         STA   $EC
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         STA   $F0
         BRA   L1A1789
L1A1763  LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L1A176D
         INC   $FF
L1A176D  STA   $F2
         STX   $F4
         LDA   [$F2]
         PHA
         LDX   $EE
         LDA   $EC
         INC   $EC
         BNE   L1A177E
         INC   $EE
L1A177E  STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
L1A1789  LDA   $F0
         DEC   $F0
         TAY
         BNE   L1A1763
         LDA   #$0000
         SEP   #$20
         STA   [$EC]
         REP   #$20
L1A1799  LDX   $EA
         LDA   $E8
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A17A7  ENT
         PHD
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
         BEQ   L1A1805
L1A17C4  LDA   [$FD]
         AND   #$00FF
         STA   $EC
         LDA   $EE
         PHA
         LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L1A17D8
         INC   $FF
L1A17D8  STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDA   $EC
         STA   $EE
         LDA   $EC
         BNE   L1A17C4
         LDX   $EA
         LDA   $E8
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L1A108F
         PLA
         PLX
         SEC
         SBC   #$0001
         SEP   #$20
         STA   [$E8]
         REP   #$20
L1A1805  LDX   $EA
         LDA   $E8
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A1813  ENT
         TAY
         LDA   $04,S
         TAX
         BEQ   L1A181F
         TYA
L1A181A  ASL
         DEX
         BNE   L1A181A
         TAY
L1A181F  TYA
         STA   $04,S
         RTL

L1A1823  ENT
         PHD
         PHX
         PHA
         TSC
         TCD
         LDX   $0A
         LDA   $0C
         BEQ   L1A1831
         LDX   #$0021
L1A1831  TXY
         BEQ   L1A183E
         LDA   $01
L1A1836  ASL
         ROL   $03
         DEX
         BNE   L1A1836
         STA   $01
L1A183E  LDA   $01
         STA   $0A
         LDA   $03
         STA   $0C
         PLY
         PLY
         PLD
         RTL

L1A184A  ENT
         BCC   L1A185E
         TAY
         LDA   $04,S
         TAX
         BEQ   L1A186A
         TYA
         BEQ   L1A186B
         BPL   L1A1865
L1A1857  SEC
         ROR
         DEX
         BNE   L1A1857
         BRA   L1A186B
L1A185E  TAY
         LDA   $04,S
         TAX
         BEQ   L1A186A
         TYA
L1A1865  LSR
         DEX
         BNE   L1A1865
         TAY
L1A186A  TYA
L1A186B  STA   $04,S
         RTL

L1A186E  ENT
         BCC   L1A1890
         PHD
         PHX
         PHA
         TSC
         TCD
         LDX   $0A
         LDA   $0C
         BEQ   L1A187E
         LDX   #$0021
L1A187E  TXY
         BEQ   L1A18AB
         LDA   $03
         BPL   L1A18A1
L1A1885  SEC
         ROR
         ROR   $01
         DEX
         BNE   L1A1885
         STA   $03
         BRA   L1A18AB
L1A1890  PHD
         PHX
         PHA
         TSC
         TCD
         LDX   $0A
         LDA   $0C
         BEQ   L1A189E
         LDX   #$0021
L1A189E  TXY
         BEQ   L1A18AB
L1A18A1  LDA   $03
L1A18A3  LSR
         ROR   $01
         DEX
         BNE   L1A18A3
         STA   $03
L1A18AB  LDA   $03
         STA   $0C
         LDA   $01
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L1A18B7  PHD
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
L1A18D5  LDX   $FF
         LDA   $FD
         INC   $FD
         BNE   L1A18DF
         INC   $FF
L1A18DF  STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         CMP   #$0000
         BEQ   L1A18EF
         BRA   L1A18D5
L1A18EF  LDX   $F0
         LDA   $EE
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L1A108F
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

L1A1909  ENT
         PHB
         PLA
         XBA
         STAL  L1A1944
         PLA
         STAL  L1A1945
         PLA
         STAL  L1A192A
         PLA
         STAL  L1A192A+2
         PLA
         STAL  L1A1928
         JSL   GSOS
L1A1928  DW    $0000
L1A192A  ADRL  $00000000
         BCS   L1A1933
         LDA   #$0000
L1A1933  STAL  L0201E7
         LDAL  L1A1945
         PHA
         PHB
         LDAL  L1A1944
         STA   $01,S
         RTL

L1A1944  DB    $00
L1A1945  DB    $00
         DB    $00
L1A1947  ENT
         SEP   #$10
         PHX
         REP   #$10
         DEC
         PHA
         RTL

L1A194F  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   $FF
         CMP   #$0000
         BNE   L1A1965
         LDA   $FD
         BRA   L1A196C
L1A1965  PEI   $FF
         JSL   L1A1B4B
         PLY
L1A196C  STA   L0201E9
         TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A1979  PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$00DE
         TCS
         LDA   [$F7]
         AND   #$00FF
         CMP   #$0000
         BEQ   L1A1993
         LDA   #$0000
         BRA   L1A1996
L1A1993  LDA   #$0001
L1A1996  PHA
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDX   $F9
         LDA   $F7
         JSL   L1A130B
         BEQ   L1A19AE
         LDA   #$0000
         BRA   L1A19B1
L1A19AE  LDA   #$0001
L1A19B1  PLX
         STX   $EC
         ORA   $EC
         TAY
         BEQ   L1A19CB
         PEA   $0000
         PEA   $0016
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
         BRL   L1A1B41
L1A19CB  LDAL  L033471
         CMP   #$0000
         BNE   L1A19EE
         LDAL  L033473
         CMP   #$0000
         BNE   L1A19EE
         LDA   #L0334D2
         LDX   #^L0334D2
         PHA
         TXA
         STAL  L033473
         PLA
         STAL  L033471
L1A19EE  LDAL  L033473
         TAX
         LDAL  L033471
         STX   $E2
         STA   $E0
         BRA   L1A1A24
L1A19FD  LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0006
         LDA   [$E0],Y
         TAX
         LDY   #$0004
         LDA   [$E0],Y
         JSL   L1A130B
         BNE   L1A1A18
         BRA   L1A1A4F
L1A1A18  LDA   $E0
         CLC
         ADC   #$0018
         STA   $E0
         BCC   L1A1A24
         INC   $E2
L1A1A24  LDAL  L033473
         TAX
         LDAL  L033471
         STA   $E8
         STX   $EA
         LDX   $EA
         LDA   #$0078
         CLC
         ADC   $E8
         BCC   L1A1A3C
         INX
L1A1A3C  PHX
         PHA
         LDX   $E2
         LDA   $E0
         JSL   L1A130B
         BEQ   L1A1A4F
         BVS   L1A1A4D
         EOR   #$8000
L1A1A4D  BMI   L1A19FD
L1A1A4F  LDA   #$4006
         STA   $E6
L1A1A54  LDAL  L033473
         TAX
         LDAL  L033471
         PHX
         PHA
         LDX   $E2
         LDA   $E0
         SEC
         SBC   #$0018
         STA   $E0
         PHA
         LDA   $E2
         SBC   #$0000
         TAX
         STA   $E2
         PLA
         JSL   L1A130B
         BEQ   L1A1A80
         BVS   L1A1A7E
         EOR   #$8000
L1A1A7E  BMI   L1A1AB9
L1A1A80  PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         LDY   #$0006
         LDA   [$E0],Y
         TAX
         LDY   #$0004
         LDA   [$E0],Y
         STA   $E8
         STX   $EA
         LDA   $E8
         LDX   $EA
         JSL   L1A1947
         PLY
         PLY
         PLY
         PLY
         PLY
         STA   $E6
         LDA   $E6
         SEC
         SBC   #$0000
         BVS   L1A1AB3
         EOR   #$8000
L1A1AB3  BPL   L1A1AB7
         BRA   L1A1AB9
L1A1AB7  BRA   L1A1A54
L1A1AB9  SEC
         LDA   $F3
         SBC   #$0000
         BNE   L1A1AC8
         LDA   $F5
         SBC   #$0000
         BRA   L1A1ACF
L1A1AC8  LDA   $F5
         SBC   #$0000
         REP   #$02
L1A1ACF  BEQ   L1A1AFF
         SEC
         LDA   $E0
         SBCL  L033471
         BNE   L1A1AE2
         LDA   $E2
         SBCL  L033473
         BRA   L1A1AEA
L1A1AE2  LDA   $E2
         SBCL  L033473
         REP   #$02
L1A1AEA  BVS   L1A1AEF
         EOR   #$8000
L1A1AEF  BPL   L1A1AFF
         LDX   $E2
         LDA   $E0
         LDY   #$0002
         PHA
         TXA
         STA   [$F3],Y
         PLA
         STA   [$F3]
L1A1AFF  LDA   $E6
         AND   #$4000
         CMP   #$0000
         BNE   L1A1B0D
         LDA   $E6
         BRA   L1A1B41
L1A1B0D  LDA   $E6
         STA   $E4
         LDA   $E4
         AND   #$8000
         TAY
         BEQ   L1A1B2B
         LDA   $E4
         AND   #$BFFF
         STA   $E4
         LDA   $E4
         AND   #$7FFF
         STA   $E4
         STZ   $E6
         BRA   L1A1B34
L1A1B2B  LDA   $E6
         AND   #$BFFF
         STA   $E6
         STZ   $E4
L1A1B34  PEI   $E4
         PEI   $E6
         JSL   L1A194F
         PLY
         PLY
         LDA   #$FFFF
L1A1B41  TAY
         TDC
         CLC
         ADC   #$00ED
         TCS
         TYA
         PLD
         RTL

L1A1B4B  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F0
         TCS
         STZ   $F2
         LDA   $FF
         BRL   L1A1C41
L1A1B5D  BRL   L1A1C54
L1A1B60  LDA   #$0014
         STA   $F2
         BRL   L1A1C54
L1A1B68  LDA   #$000E
         STA   $F2
         BRL   L1A1C54
L1A1B70  LDA   #$001C
         STA   $F2
         BRL   L1A1C54
L1A1B78  LDA   #$0011
         STA   $F2
         BRL   L1A1C54
L1A1B80  LDA   #$0006
         STA   $F2
         BRL   L1A1C54
L1A1B88  LDA   #$0006
         STA   $F2
         BRL   L1A1C54
L1A1B90  LDA   #$0010
         STA   $F2
         BRL   L1A1C54
L1A1B98  LDA   #$0002
         STA   $F2
         BRL   L1A1C54
L1A1BA0  LDA   #$0009
         STA   $F2
         BRL   L1A1C54
L1A1BA8  LDA   #$0005
         STA   $F2
         BRL   L1A1C54
L1A1BB0  LDA   #$0017
         STA   $F2
         BRL   L1A1C54
L1A1BB8  LDA   #$000C
         STA   $F2
         BRL   L1A1C54
L1A1BC0  LDA   #$001A
         STA   $F2
         BRL   L1A1C54
L1A1BC8  LDA   #$0016
         STA   $F2
         BRL   L1A1C54
L1A1BD0  LDA   #$000D
         STA   $F2
         BRL   L1A1C54
L1A1BD8  LDA   #$001E
         STA   $F2
         BRL   L1A1C54
         BRL   L1A1C54
L1A1BE3  DA    L1A1B5D
         DA    L1A1BA8
         DA    L1A1BD8
         DA    L1A1B68
         DA    L1A1BB0
         DA    L1A1BA0
         DA    L1A1B98
         DA    L1A1B88
         DA    L1A1B98
         DA    L1A1B78
         DA    L1A1B70
         DA    L1A1B70
         DA    L1A1B60
         DA    L1A1B80
         DA    L1A1B88
         DA    L1A1BD0
         DA    L1A1BC0
         DA    L1A1B60
         DA    L1A1BC8
         DA    L1A1BB8
         DA    L1A1B90
         DA    L1A1B88
         DA    L1A1B88
         DA    L1A1B5D
L1A1C13  DW    $0000
         DW    $0027
         DW    $002B
         DW    $0040
         DW    $0042
         DW    $0043
         DW    $0044
         DW    $0045
         DW    $0046
         DW    $0047
         DW    $0048
         DW    $0049
         DW    $004B
         DW    $004C
         DW    $004D
         DW    $004E
         DW    $0050
         DW    $0052
         DW    $0053
         DW    $0054
         DW    $0057
         DW    $0058
         DW    $005A
L1A1C41  TAX
         PEA   ^L1A1C13
         PEA   L1A1C13
         LDA   #$002C
         JSL   L1A239A
         PLA
         PLA
         JMP   (L1A1BE3,X)

L1A1C54  LDA   $F2
         TAY
         TDC
         CLC
         ADC   #$00F9
         TCS
         TYA
         PLD
         RTL

L1A1C60  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E6
         TCS
         LDAL  L03346B
         CMP   #$0000
         BNE   L1A1C78
         JSL   L1A1E83
L1A1C78  LDA   #$0012
         PHA
         LDAL  L03346B
         SEC
         JSL   L1A0F19
         PLY
         SEC
         SBC   #$0001
         STA   $F0
         LDA   [$FD]
         SEC
         SBC   #$0000
         BVS   L1A1C97
         EOR   #$8000
L1A1C97  BPL   L1A1C9D
         LDA   [$FD]
         BRA   L1A1CA9
L1A1C9D  LDA   [$FD]
         PHA
         LDA   #$FFFF
         PLX
         STX   $F6
         SEC
         SBC   $F6
L1A1CA9  SEC
         SBC   $F0
         BEQ   L1A1CCA
         BVS   L1A1CB3
         EOR   #$8000
L1A1CB3  BPL   L1A1CCA
         PEA   $0000
         PEA   $0016
         JSL   L1A194F
         PLY
         PLY
         LDX   #$0000
         LDA   #$0000
         BRL   L1A1E79
L1A1CCA  LDA   [$FD]
         SEC
         SBC   #$0000
         BVS   L1A1CD5
         EOR   #$8000
L1A1CD5  BPL   L1A1D18
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L1A1CE0
         DEX
L1A1CE0  PEA   $0000
         PEA   $0012
         CLC
         JSL   L1A10DF
         LDAL  L03346F
         TAX
         LDAL  L03346D
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDA   [$EC]
         CMP   #$0000
         BNE   L1A1D15
         PEA   $0000
         PEA   $0009
         JSL   L1A194F
         PLY
         PLY
         STZ   $EC
         STZ   $EE
L1A1D15  BRL   L1A1E75
L1A1D18  LDA   [$FD]
         PHA
         LDA   #$FFFF
         PLX
         STX   $F6
         SEC
         SBC   $F6
         LDX   #$0000
         TAY
         BPL   L1A1D2B
         DEX
L1A1D2B  PEA   $0000
         PEA   $0012
         CLC
         JSL   L1A10DF
         LDAL  L03346F
         TAX
         LDAL  L03346D
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         BRA   L1A1D60
L1A1D4B  LDA   [$EC]
         CMP   #$0000
         BNE   L1A1D54
         BRA   L1A1D90
L1A1D54  LDA   $EC
         CLC
         ADC   #$0012
         STA   $EC
         BCC   L1A1D60
         INC   $EE
L1A1D60  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L1A1D69
         DEX
L1A1D69  PEA   $0000
         PEA   $0012
         CLC
         JSL   L1A10DF
         LDAL  L03346F
         TAX
         LDAL  L03346D
         JSL   L1A0EFF
         LDX   $EE
         LDA   $EC
         JSL   L1A130B
         BVS   L1A1D8E
         EOR   #$8000
L1A1D8E  BMI   L1A1D4B
L1A1D90  LDA   $F0
         LDX   #$0000
         TAY
         BPL   L1A1D99
         DEX
L1A1D99  PEA   $0000
         PEA   $0012
         CLC
         JSL   L1A10DF
         LDAL  L03346F
         TAX
         LDAL  L03346D
         JSL   L1A0EFF
         LDX   $EE
         LDA   $EC
         JSL   L1A130B
         BVS   L1A1DBE
         EOR   #$8000
L1A1DBE  BPL   L1A1DC3
         BRL   L1A1E4F
L1A1DC3  LDAL  L03346B
         CLC
         ADC   #$00B4
         LDX   #$0000
         TAY
         BPL   L1A1DD2
         DEX
L1A1DD2  PHX
         PHA
         LDAL  L03346F
         TAX
         LDAL  L03346D
         PHX
         PHA
         JSL   L1A219D
         PLY
         PLY
         PLY
         PLY
         STX   $EA
         STA   $E8
         LDA   $E8
         CMP   #$0000
         BNE   L1A1E0E
         LDA   $EA
         CMP   #$0000
         BNE   L1A1E0E
         PEA   $0000
         PEA   $0018
         JSL   L1A194F
         PLY
         PLY
         LDX   #$0000
         LDA   #$0000
         BRL   L1A1E79
L1A1E0E  LDA   $F0
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L1A1E1B
         DEX
L1A1E1B  PEA   $0000
         PEA   $0012
         CLC
         JSL   L1A10DF
         LDX   $EA
         LDA   $E8
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDAL  L03346B
         CLC
         ADC   #$00B4
         STAL  L03346B
         LDX   $EA
         LDA   $E8
         PHA
         TXA
         STAL  L03346F
         PLA
         STAL  L03346D
L1A1E4F  LDX   #$0000
         LDA   #$0012
         PHX
         PHA
         LDAL  L03346F
         TAX
         LDAL  L03346D
         PHX
         PHA
         LDX   $EE
         LDA   $EC
         JSL   L1A108F
         PLA
         PLX
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         STA   [$FD]
L1A1E75  LDX   $EE
         LDA   $EC
L1A1E79  TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A1E83  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         LDA   #$00B4
         STAL  L03346B
         PEA   $0000
         PEA   $00B4
         PEA   $0000
         PEA   $0000
         JSL   L1A219D
         PLY
         PLY
         PLY
         PLY
         PHA
         TXA
         STAL  L03346F
         PLA
         STAL  L03346D
         SEC
         LDAL  L033475
         SBC   #$0000
         BNE   L1A1EC7
         LDAL  L033477
         SBC   #$0000
         BRA   L1A1ED0
L1A1EC7  LDAL  L033477
         SBC   #$0000
         REP   #$02
L1A1ED0  BNE   L1A1ED5
         BRL   L1A1F92
L1A1ED5  LDAL  L033477
         TAX
         LDAL  L033475
         STA   $F6
         STX   $F8
         LDY   #$001A
         LDA   [$F6],Y
         TAX
         LDY   #$0018
         LDA   [$F6],Y
         PHX
         PHA
         LDAL  L03346F
         TAX
         LDAL  L03346D
         PHX
         PHA
         PEA   $0000
         PEA   $0036
         _BlockMove
         BCS   L1A1F0C
         LDA   #$0000
L1A1F0C  STAL  L0201E7
         LDAL  L03346F
         TAX
         LDAL  L03346D
         STX   $F4
         STA   $F2
         BRA   L1A1F66
L1A1F1F  LDA   [$F2]
         CMP   #$0000
         BEQ   L1A1F5A
         PEA   $0000
         PEA   $6601
         PEI   $F4
         PEI   $F2
         LDY   #$0006
         LDA   [$F2],Y
         TAX
         LDY   #$0004
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0016
         LDA   [$F6],Y
         TAX
         LDY   #$0014
         LDA   [$F6],Y
         STA   $F6
         STX   $F8
         LDA   $F6
         LDX   $F8
         JSL   L1A1947
         PLY
         PLY
         PLY
         PLY
L1A1F5A  LDA   $F2
         CLC
         ADC   #$0012
         STA   $F2
         BCC   L1A1F66
         INC   $F4
L1A1F66  LDAL  L03346F
         TAX
         LDAL  L03346D
         STA   $F6
         STX   $F8
         LDX   $F8
         LDA   #$0024
         CLC
         ADC   $F6
         BCC   L1A1F7E
         INX
L1A1F7E  PHX
         PHA
         LDX   $F4
         LDA   $F2
         JSL   L1A130B
         BVS   L1A1F8D
         EOR   #$8000
L1A1F8D  BMI   L1A1F1F
         BRL   L1A216F
L1A1F92  PEA   $0000
         PEA   ^L03354A
         PEA   L03354A
         JSL   L1A1248
         PLY
         PLY
         PLY
         STA   $F0
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $F4
         STA   $F2
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         LDA   L0201E5
         ORA   #$0F00
         PHA
         PEA   $8300
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L1A1FDB
         LDA   #$0000
L1A1FDB  STAL  L0201E7
         PLA
         PLX
         LDY   #$000A
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0008
         STA   [$F2],Y
         LDY   #$000A
         LDA   [$F2],Y
         TAX
         LDY   #$0008
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         LDY   #$000A
         LDA   [$F2],Y
         TAX
         LDY   #$0008
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         PEA   $0001
         PEA   ^L033553
         PEA   L033553
         JSL   L1A1248
         PLY
         PLY
         PLY
         STA   $F0
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $F4
         STA   $F2
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         LDA   L0201E5
         ORA   #$0F00
         PHA
         PEA   $8300
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L1A207A
         LDA   #$0000
L1A207A  STAL  L0201E7
         PLA
         PLX
         LDY   #$000A
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0008
         STA   [$F2],Y
         LDY   #$000A
         LDA   [$F2],Y
         TAX
         LDY   #$0008
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         LDY   #$000A
         LDA   [$F2],Y
         TAX
         LDY   #$0008
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0001
         LDY   #$0002
         STA   [$F6],Y
         PEA   $0001
         PEA   ^L03355C
         PEA   L03355C
         JSL   L1A1248
         PLY
         PLY
         PLY
         STA   $F0
         PEA   $0000
         TDC
         CLC
         ADC   #$00F0
         PHA
         JSL   L1A1C60
         PLY
         PLY
         STX   $F4
         STA   $F2
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         LDA   L0201E5
         ORA   #$0F00
         PHA
         PEA   $8300
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L1A2119
         LDA   #$0000
L1A2119  STAL  L0201E7
         PLA
         PLX
         LDY   #$000A
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$0008
         STA   [$F2],Y
         LDY   #$000A
         LDA   [$F2],Y
         TAX
         LDY   #$0008
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0000
         STA   [$F6]
         LDY   #$000A
         LDA   [$F2],Y
         TAX
         LDY   #$0008
         LDA   [$F2],Y
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         STA   $F6
         STX   $F8
         LDA   #$0002
         LDY   #$0002
         STA   [$F6],Y
L1A216F  LDA   #L1A2F96
         LDX   #^L1A2F96
         PHX
         PHA
         LDAL  L033467+2  ; L033469
         TAX
         LDAL  L033467
         STA   $F6
         STX   $F8
         PLA
         PLX
         LDY   #$000A
         PHA
         TXA
         STA   [$F6],Y
         PLA
         LDY   #$0008
         STA   [$F6],Y
         TAY
         TDC
         CLC
         ADC   #$00FB
         TCS
         TYA
         PLD
         RTL

L1A219D  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00DC
         TCS
         STZ   $EA
         STZ   $EC
         STZ   $E6
         STZ   $E8
         SEC
         LDA   $F9
         SBC   #$0000
         BNE   L1A21BF
         LDA   $FB
         SBC   #$0000
         BRA   L1A21C6
L1A21BF  LDA   $FB
         SBC   #$0000
         REP   #$02
L1A21C6  BNE   L1A21CB
         BRL   L1A225E
L1A21CB  PHX
         PHA
         PEI   $FB
         PEI   $F9
         _FindHandle
         BCS   L1A21DD
         LDA   #$0000
L1A21DD  STAL  L0201E7
         PLA
         PLX
         STX   $EC
         STA   $EA
         PHX
         PHA
         PEI   $EC
         PEI   $EA
         _GetHandleSize
         BCS   L1A21F9
         LDA   #$0000
L1A21F9  STAL  L0201E7
         PLA
         PLX
         STX   $E8
         STA   $E6
         SEC
         LDA   $FD
         SBC   $E6
         BNE   L1A2210
         LDA   $FF
         SBC   $E8
         BRA   L1A2216
L1A2210  LDA   $FF
         SBC   $E8
         REP   #$02
L1A2216  BVS   L1A221B
         EOR   #$8000
L1A221B  BMI   L1A224A
         PEI   $EC
         PEI   $EA
         PEI   $FF
         PEI   $FD
         _SetHandleSize
         BCS   L1A2231
         LDA   #$0000
L1A2231  STAL  L0201E7
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         AND   #$FFFF
         PHA
         TXA
         AND   #$00FF
         TAX
         PLA
         BRL   L1A2390
L1A224A  PEI   $EC
         PEI   $EA
         _HUnlock
         BCS   L1A225A
         LDA   #$0000
L1A225A  STAL  L0201E7
L1A225E  PHX
         PHA
         PEI   $FF
         PEI   $FD
         LDA   L0201E5
         ORA   #$0F00
         PHA
         PEA   $8300
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L1A2280
         LDA   #$0000
L1A2280  STAL  L0201E7
         PLA
         PLX
         STX   $E4
         STA   $E2
         LDA   L0201E7
         BEQ   L1A22C4
         SEC
         LDA   $EA
         SBC   #$0000
         BNE   L1A229E
         LDA   $EC
         SBC   #$0000
         BRA   L1A22A5
L1A229E  LDA   $EC
         SBC   #$0000
         REP   #$02
L1A22A5  BEQ   L1A22BB
         PEI   $EC
         PEI   $EA
         _HLock
         BCS   L1A22B7
         LDA   #$0000
L1A22B7  STAL  L0201E7
L1A22BB  LDX   #$0000
         LDA   #$0000
         BRL   L1A2390
L1A22C4  PEI   $E4
         PEI   $E2
         _HLock
         BCS   L1A22D4
         LDA   #$0000
L1A22D4  STAL  L0201E7
         SEC
         LDA   $F9
         SBC   #$0000
         BNE   L1A22E7
         LDA   $FB
         SBC   #$0000
         BRA   L1A22EE
L1A22E7  LDA   $FB
         SBC   #$0000
         REP   #$02
L1A22EE  BEQ   L1A232C
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         PHX
         PHA
         LDY   #$0002
         LDA   [$E2],Y
         TAX
         LDA   [$E2]
         PHX
         PHA
         PEI   $E8
         PEI   $E6
         _BlockMove
         BCS   L1A2314
         LDA   #$0000
L1A2314  STAL  L0201E7
         PEI   $EC
         PEI   $EA
         _DisposeHandle
         BCS   L1A2328
         LDA   #$0000
L1A2328  STAL  L0201E7
L1A232C  LDY   #$0002
         LDA   [$E2],Y
         TAX
         LDA   [$E2]
         CLC
         ADC   $E6
         PHA
         TXA
         ADC   $E8
         TAX
         PLA
         STX   $E0
         STA   $DE
L1A2341  LDY   #$0002
         LDA   [$E2],Y
         TAX
         LDA   [$E2]
         CLC
         ADC   $FD
         PHA
         TXA
         ADC   $FF
         TAX
         PLA
         PHX
         PHA
         LDX   $E0
         LDA   $DE
         JSL   L1A130B
         BEQ   L1A237E
         BVS   L1A2363
         EOR   #$8000
L1A2363  BPL   L1A237E
         LDX   $E0
         LDA   $DE
         INC   $DE
         BNE   L1A236F
         INC   $E0
L1A236F  STA   $EE
         STX   $F0
         LDA   #$0000
         SEP   #$20
         STA   [$EE]
         REP   #$20
         BRA   L1A2341
L1A237E  LDY   #$0002
         LDA   [$E2],Y
         TAX
         LDA   [$E2]
         AND   #$FFFF
         PHA
         TXA
         AND   #$00FF
         TAX
         PLA
L1A2390  TAY
         TDC
         CLC
         ADC   #$00F3
         TCS
         TYA
         PLD
         RTL

L1A239A  TAY
         PHB
         LDA   $06,S
         PHA
         PLB
         PLB
         PHY
         PHY
         PEA   $0000
         TXA
         CMP   ($0B,S),Y
         BEQ   L1A23DA
         LDY   #$0000
         CMP   ($0B,S),Y
         BEQ   L1A23DA
         BRA   L1A23B7
L1A23B4  TYA
         STA   $03,S
L1A23B7  LDA   $03,S
         CMP   $01,S
         BEQ   L1A23D5
         CLC
         ADC   $01,S
         LSR
         AND   #$00FE
         CMP   $01,S
         BEQ   L1A23D5
         TAY
         TXA
         CMP   ($0B,S),Y
         BEQ   L1A23DA
         BCC   L1A23B4
         TYA
         STA   $01,S
         BRA   L1A23B7
L1A23D5  LDA   $05,S
         INC
         INC
         TAY
L1A23DA  TYX
         PLA
         PLA
         PLA
         PLB
         RTL

L1A23E0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00FB
         TCS
         TYA
         PLD
         RTL

L1A23F8  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         LDA   #$0000
         TAY
         TDC
         CLC
         ADC   #$00F1
         TCS
         TYA
         PLD
         RTL

L1A2410  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
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
         LDA   [$F2]
         DEC
         STA   [$F2]
         SEC
         SBC   #$0000
         BEQ   L1A244B
         BVS   L1A2446
         EOR   #$8000
L1A2446  BPL   L1A244B
         BRL   L1A24B3
L1A244B  LDY   #$000A
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
         PEA   $0014
         PEA   ^L03369E
         PEA   L03369E
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A248C
         LDA   L0201E7
         LDY   #$0002
         STA   [$FD],Y
L1A248C  LDA   L0201E7
         STA   $F0
         LDY   #$000A
         LDA   [$FD],Y
         TAX
         LDY   #$0008
         LDA   [$FD],Y
         PHX
         PHA
         _DisposeHandle
         BCS   L1A24AA
         LDA   #$0000
L1A24AA  STAL  L0201E7
         LDA   $F0
         STA   L0201E7
L1A24B3  LDA   L0201E7
         CMP   #$0000
         BNE   L1A24C0
         LDA   #$0000
         BRA   L1A24C3
L1A24C0  LDA   #$0009
L1A24C3  TAY
         TDC
         CLC
         ADC   #$00F7
         TCS
         TYA
         PLD
         RTL

L1A24CD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E6
         TCS
         LDA   $FB
         BRL   L1A283A
L1A24DD  LDA   #$0000
         LDY   #$0002
         STA   [$F7],Y
         LDA   #$0016
         BRL   L1A286B
L1A24EB  LDY   #$000A
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
         STA   $EA
         LDA   $EA
         STAL  L0336B2
         PEA   $0019
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A252E
         LDA   #$001D
         BRL   L1A286B
L1A252E  LDA   $EA
         STAL  L0336AC
         LDA   [$FD]
         BRL   L1A25D7
L1A2539  LDY   #$0004
         LDA   [$FD],Y
         TAX
         LDY   #$0002
         LDA   [$FD],Y
         PHA
         TXA
         STAL  L0336B0
         PLA
         STAL  L0336AE
         BRL   L1A25E4
L1A2552  PEA   $0017
         PEA   ^L0336AC
         PEA   L0336AC
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A256A
         BRL   L1A25E4
L1A256A  LDY   #$0004
         LDA   [$FD],Y
         TAX
         LDY   #$0002
         LDA   [$FD],Y
         PHX
         PHA
         LDAL  L0336B0
         TAX
         LDAL  L0336AE
         JSL   L1A0EFF
         PLA
         PLX
         PHA
         TXA
         STAL  L0336B0
         PLA
         STAL  L0336AE
         BRL   L1A25E4
L1A2594  LDY   #$0004
         LDA   [$FD],Y
         TAX
         LDY   #$0002
         LDA   [$FD],Y
         PHX
         PHA
         LDAL  L0336B6
         TAX
         LDAL  L0336B4
         JSL   L1A0EFF
         PLA
         PLX
         PHA
         TXA
         STAL  L0336B0
         PLA
         STAL  L0336AE
         BRL   L1A25E4
L1A25BE  LDA   #$0000
         LDY   #$0002
         STA   [$F7],Y
         LDA   #$0016
         BRL   L1A286B
         BRL   L1A25E4
L1A25CF  DA    L1A2539
         DA    L1A2552
         DA    L1A2594
         DA    L1A25BE
L1A25D7  CMP   #$0003
         BCC   L1A25DF
         LDA   #$0003
L1A25DF  ASL
         TAX
         JMP   (L1A25CF,X)

L1A25E4  LDA   L0201E7
         CMP   #$0000
         BEQ   L1A25F6
         LDA   [$FD]
         CMP   #$0000
         BEQ   L1A25F6
         BRL   L1A2688
L1A25F6  SEC
         LDAL  L0336AE
         SBCL  L0336B4
         BNE   L1A260B
         LDAL  L0336B0
         SBCL  L0336B6
         BRA   L1A2615
L1A260B  LDAL  L0336B0
         SBCL  L0336B6
         REP   #$02
L1A2615  BNE   L1A261A
         BRL   L1A267B
L1A261A  BVS   L1A261F
         EOR   #$8000
L1A261F  BMI   L1A2624
         BRL   L1A267B
L1A2624  LDA   [$FD]
         CMP   #$0002
         BEQ   L1A264C
         LDA   $EA
         STAL  L0336B2
         PEA   $0019
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A264C
         LDA   #$001D
         BRL   L1A286B
L1A264C  LDAL  L0336B0
         TAX
         LDAL  L0336AE
         PHA
         TXA
         STAL  L0336B6
         PLA
         STAL  L0336B4
         PEA   $0018
         PEA   ^L0336B2
         PEA   L0336B2
         JSL   L1A1909
         LDA   L0201E7
         CMP   #$0000
         BEQ   L1A267B
         LDA   #$001D
         BRL   L1A286B
L1A267B  PEA   $0016
         PEA   ^L0336AC
         PEA   L0336AC
         JSL   L1A1909
L1A2688  LDA   L0201E7
         CMP   #$0000
         BEQ   L1A269E
         LDA   L0201E7
         LDY   #$0002
         STA   [$F7],Y
         LDA   #$001D
         BRL   L1A286B
L1A269E  LDAL  L0336B0
         TAX
         LDAL  L0336AE
         LDY   #$0004
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0002
         STA   [$FD],Y
         BRL   L1A284B
L1A26B7  LDY   #$000A
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
         LDA   [$EC]
         INC
         STA   [$EC]
         BRL   L1A284B
L1A26DA  LDA   #$0000
         LDY   #$0002
         STA   [$F7],Y
         LDA   #$0016
         BRL   L1A286B

         PUT   SEG1A.2
