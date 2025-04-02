*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg0F.L
         lst   off

*-----------

         use   Seg0F.E
         use   Seg0F.X

*-----------

         use   4/Qd.Macs
         use   4/Misc.Macs
         use   4/Util.Macs

*-----------

L0F0000  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020087
         CMP   #$0006
         BEQ   L0F0023
         LDA   L020087
         CMP   #$0002
         BEQ   L0F0023
         LDA   L020087
         CMP   #$0004
         BNE   L0F0033
L0F0023  PEA   $0514
         LDX   L020161
         LDA   L02015F
         PHA
         JSL   L1F01C7
         PLY
         PLY
L0F0033  TSC
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
         STZ   L02006B
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
         STZ   L02006D
         STZ   L02006F
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F006A  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$004C
         TCS
         JSL   L2309FB
         LDX   #$0000
         TDC
         CLC
         ADC   #$005E
         STX   $5C
         STA   $5A
         LDA   #$0044
         STA   $58
         BRA   L0F00B7
L0F008C  PEA   $00CC
         PEA   $0074
         JSL   L1B0242
         PLY
         PLY
         PHA
         LDX   $5C
         LDA   $5A
         PHX
         PHA
         CLC
         ADC   #$0002
         STA   $5A
         LDA   $5C
         BCC   L0F00AA
         INC
L0F00AA  STA   $5C
         PLA
         PLX
         STA   $EE
         STX   $F0
         PLA
         STA   [$EE]
         DEC   $58
L0F00B7  LDA   $58
         SEC
         SBC   #$0000
         BVS   L0F00C2
         EOR   #$8000
L0F00C2  BMI   L0F008C
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0000
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FB
         STA   $F9
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0000
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
         LDA   #$00CB
         STA   $58
         BRA   L0F016B
L0F00F1  LDX   #$0000
         TDC
         CLC
         ADC   #$005E
         STX   $5C
         STA   $5A
         LDX   $FB
         LDA   $F9
         STX   $50
         STA   $4E
         LDX   $FF
         LDA   $FD
         STX   $54
         STA   $52
         LDA   #$0043
         STA   $EA
         BRA   L0F0154
L0F0114  LDA   [$5A]
         LSR
         TAY
         LDA   [$4E],Y
         STA   [$52],Y
         LDA   [$5A]
         CLC
         ADC   #$0011
         STA   $EC
         LDA   $EC
         SEC
         SBC   #$00CB
         BEQ   L0F013B
         BVS   L0F0131
         EOR   #$8000
L0F0131  BPL   L0F013B
         LDA   $EC
         SEC
         SBC   #$0058
         STA   $EC
L0F013B  LDA   $EC
         STA   [$5A]
         INC   $5A
         INC   $5A
         LDA   $52
         CLC
         ADC   #$00A0
         STA   $52
         LDA   $4E
         ADC   #$00A0
         STA   $4E
         DEC   $EA
L0F0154  LDA   $EA
         SEC
         SBC   #$0000
         BEQ   L0F0163
         BVS   L0F0161
         EOR   #$8000
L0F0161  BMI   L0F0114
L0F0163  LDA   $58
         SEC
         SBC   #$0002
         STA   $58
L0F016B  LDA   $58
         SEC
         SBC   #$0072
         BVS   L0F0176
         EOR   #$8000
L0F0176  BPL   L0F017B
         BRL   L0F00F1
L0F017B  TSC
         CLC
         ADC   #$00A6
         TCS
         PLD
         RTL

L0F0183  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L0F006A
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

L0F01B9  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020087
         CMP   #$0006
         BNE   L0F01EF
         PEA   $0000
         PEA   $0044
         PEA   $00CB
         PEA   $0000
         PEA   $0074
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L0706DB
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
L0F01EF  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F01F7  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020087
         CMP   #$0006
         BNE   L0F0241
         JSL   L0F0183
         PEA   $0046
         PEA   $00CD
         PEA   $FFFE
         PEA   $0072
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
L0F0241  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F0249  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0000
         PEA   $0044
         PEA   $00CB
         PEA   $0000
         PEA   $0074
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L0706DB
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         PEA   $0000
         PEA   $0044
         PEA   $00CB
         PEA   $0000
         PEA   $0074
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L0706DB
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L0F006A
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

L0F02C5  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   L020106
         BNE   L0F02D8
         BRL   L0F0360
L0F02D8  LDA   L0200EE
         BRL   L0F0351
L0F02DE  LDA   #$0009
         STA   $F4
         BRL   L0F035E
L0F02E6  SEC
         LDA   L02015F
         SBC   #$FFAD
         BNE   L0F02F7
         LDA   L020161
         SBC   #$FFFF
         BRA   L0F02FF
L0F02F7  LDA   L020161
         SBC   #$FFFF
         REP   #$02
L0F02FF  BVS   L0F0304
         EOR   #$8000
L0F0304  BMI   L0F030D
         LDA   #$0005
         STA   $F4
         BRA   L0F0339
L0F030D  SEC
         LDA   L02015F
         SBC   #$0053
         BNE   L0F031E
         LDA   L020161
         SBC   #$0000
         BRA   L0F0326
L0F031E  LDA   L020161
         SBC   #$0000
         REP   #$02
L0F0326  BVS   L0F032B
         EOR   #$8000
L0F032B  BMI   L0F0334
         LDA   #$0006
         STA   $F4
         BRA   L0F0339
L0F0334  LDA   #$0007
         STA   $F4
L0F0339  BRL   L0F035E
L0F033C  LDA   #$0008
         STA   $F4
         BRL   L0F035E
         BRL   L0F035E
L0F0347  DA    L0F02DE
         DA    L0F02E6
         DA    L0F02E6
         DA    L0F02DE
         DA    L0F033C
L0F0351  CMP   #$0004
         BCC   L0F0359
         LDA   #$0004
L0F0359  ASL
         TAX
         JMP   (L0F0347,X)

L0F035E  BRA   L0F0365
L0F0360  LDA   #$FFFF
         STA   $F4
L0F0365  LDA   $F4
         STAL  L030964
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L0F0378  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020047
         CMP   #$000F
         BNE   L0F0394
         LDA   L0201E1
         BNE   L0F0394
         JSL   L23073F
L0F0394  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F03A1  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020045
         CMP   #$000F
         BNE   L0F03BF
         LDA   L0201E1
         BNE   L0F03BF
         JSL   L23073F
         BRA   L0F03C3
L0F03BF  JSL   L23071B
L0F03C3  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F03D0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0096
         PEA   $001E
         JSL   L1B0242
         PLY
         PLY
         PHA
         LDA   #L030A36
         LDX   #^L030A36
         STA   $F6
         STX   $F8
         PLA
         LDY   #$0002
         STA   [$F6],Y
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F0405  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0096
         PEA   $001E
         JSL   L1B0242
         PLY
         PLY
         PHA
         LDA   #L030BB6
         LDX   #^L030BB6
         STA   $F6
         STX   $F8
         PLA
         LDY   #$0002
         STA   [$F6],Y
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F043A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   L020106
         BNE   L0F044D
         BRL   L0F04D5
L0F044D  LDA   L0200EE
         BRL   L0F04C6
L0F0453  LDA   #$FFFF
         STA   $F4
         BRL   L0F04D3
L0F045B  SEC
         LDA   L02015F
         SBC   #$FFAD
         BNE   L0F046C
         LDA   L020161
         SBC   #$FFFF
         BRA   L0F0474
L0F046C  LDA   L020161
         SBC   #$FFFF
         REP   #$02
L0F0474  BVS   L0F0479
         EOR   #$8000
L0F0479  BMI   L0F0482
         LDA   #$0008
         STA   $F4
         BRA   L0F04AE
L0F0482  SEC
         LDA   L02015F
         SBC   #$0053
         BNE   L0F0493
         LDA   L020161
         SBC   #$0000
         BRA   L0F049B
L0F0493  LDA   L020161
         SBC   #$0000
         REP   #$02
L0F049B  BVS   L0F04A0
         EOR   #$8000
L0F04A0  BMI   L0F04A9
         LDA   #$000A
         STA   $F4
         BRA   L0F04AE
L0F04A9  LDA   #$0009
         STA   $F4
L0F04AE  BRL   L0F04D3
L0F04B1  LDA   #$0005
         STA   $F4
         BRL   L0F04D3
         BRL   L0F04D3
L0F04BC  DA    L0F0453
         DA    L0F045B
         DA    L0F045B
         DA    L0F0453
         DA    L0F04B1
L0F04C6  CMP   #$0004
         BCC   L0F04CE
         LDA   #$0004
L0F04CE  ASL
         TAX
         JMP   (L0F04BC,X)

L0F04D3  BRA   L0F04DA
L0F04D5  LDA   #$FFFF
         STA   $F4
L0F04DA  LDA   $F4
         STAL  L030BE8
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L0F04ED  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020061
         BEQ   L0F0506
         LDA   #$FFFF
         STAL  L030E6C
         BRA   L0F0516
L0F0506  PEA   $0010
         PEA   $0007
         JSL   L1B0242
         PLY
         PLY
         STAL  L030E6C
L0F0516  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F0523  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         JSL   L09007C
         AND   #$0001
         CMP   #$0000
         BNE   L0F0542
         LDA   #L030E80
         LDX   #^L030E80
         BRA   L0F0548
L0F0542  LDA   #L030EB2
         LDX   #^L030EB2
L0F0548  STX   $F0
         STA   $EE
         LDX   $F0
         LDA   $EE
         LDY   #$0006
         PHA
         TXA
         STA   [$FD],Y
         PLA
         LDY   #$0004
         STA   [$FD],Y
         PEA   $0096
         PEA   $001E
         JSL   L1B0242
         PLY
         PLY
         LDY   #$0002
         STA   [$EE],Y
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         LDA   #L0310C4
         LDX   #^L0310C4
         STA   $F6
         STX   $F8
         LDA   #$0000
         LDY   #$0002
         STA   [$F6],Y
         LDA   #$0000
         BRA   L0F05D4
         LDA   #L0310C4
         LDX   #^L0310C4
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         CMP   #$0000
         BNE   L0F05B6
         LDA   #$0000
         BRA   L0F05D4
L0F05B6  DEC   L020065
         LDA   #L0310C4
         LDX   #^L0310C4
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         SEC
         SBC   L020065
         LDY   #$0002
         STA   [$F6],Y
         LDA   #$0001
L0F05D4  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         LDA   #$0000
         BRL   L0F063E
         LDA   #L0310C4
         LDX   #^L0310C4
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #L0310C4
         LDX   #^L0310C4
         STA   $F6
         STX   $F8
         LDY   #$0006
         LDA   [$F6],Y
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BVS   L0F0619
         EOR   #$8000
L0F0619  BMI   L0F0620
         LDA   #$0000
         BRA   L0F063E
L0F0620  LDA   #L0310C4
         LDX   #^L0310C4
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         CLC
         ADC   L020065
         LDY   #$0002
         STA   [$F6],Y
         INC   L020065
         LDA   #$0001
L0F063E  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L0F0648  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0096
         PEA   $003C
         JSL   L1B0242
         PLY
         PLY
         PHA
         LDA   #L03118C
         LDX   #^L03118C
         STA   $F6
         STX   $F8
         PLA
         LDY   #$0002
         STA   [$F6],Y
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F067D  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   L020106
         BNE   L0F0690
         BRL   L0F0718
L0F0690  LDA   L0200EE
         BRL   L0F0709
L0F0696  LDA   #$FFFF
         STA   $F4
         BRL   L0F0716
L0F069E  SEC
         LDA   L02015F
         SBC   #$FFAD
         BNE   L0F06AF
         LDA   L020161
         SBC   #$FFFF
         BRA   L0F06B7
L0F06AF  LDA   L020161
         SBC   #$FFFF
         REP   #$02
L0F06B7  BVS   L0F06BC
         EOR   #$8000
L0F06BC  BMI   L0F06C5
         LDA   #$000A
         STA   $F4
         BRA   L0F06F1
L0F06C5  SEC
         LDA   L02015F
         SBC   #$0053
         BNE   L0F06D6
         LDA   L020161
         SBC   #$0000
         BRA   L0F06DE
L0F06D6  LDA   L020161
         SBC   #$0000
         REP   #$02
L0F06DE  BVS   L0F06E3
         EOR   #$8000
L0F06E3  BMI   L0F06EC
         LDA   #$000B
         STA   $F4
         BRA   L0F06F1
L0F06EC  LDA   #$000C
         STA   $F4
L0F06F1  BRL   L0F0716
L0F06F4  LDA   #$000D
         STA   $F4
         BRL   L0F0716
         BRL   L0F0716
L0F06FF  DA    L0F0696
         DA    L0F069E
         DA    L0F069E
         DA    L0F0696
         DA    L0F06F4
L0F0709  CMP   #$0004
         BCC   L0F0711
         LDA   #$0004
L0F0711  ASL
         TAX
         JMP   (L0F06FF,X)

L0F0716  BRA   L0F071D
L0F0718  LDA   #$FFFF
         STA   $F4
L0F071D  LDA   $F4
         STAL  L0311BE
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L0F0730  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0096
         PEA   $001E
         JSL   L1B0242
         PLY
         PLY
         PHA
         LDA   #L03165A
         LDX   #^L03165A
         STA   $F6
         STX   $F8
         PLA
         LDY   #$0002
         STA   [$F6],Y
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F0765  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F077D  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00DE
         TCS
         LDY   #$0002
         LDA   [$F7],Y
         TAX
         LDA   [$F7]
         STX   $EA
         STA   $E8
L0F0794  LDY   #$0001
         LDA   [$E8],Y
         AND   #$00FF
         CMP   #$0000
         BNE   L0F07A4
         BRL   L0F08BE
L0F07A4  LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   [$E8]
         AND   #$00FF
         LDX   #$0000
         SEC
         JSL   L1A1823
         LDA   #L031C96
         LDX   #^L031C96
         JSL   L1A0EFF
         PLA
         PLX
         STX   $E6
         STA   $E4
         LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDY   #$0001
         LDA   [$E8],Y
         AND   #$00FF
         LDX   #$0000
         SEC
         JSL   L1A1823
         LDA   #L031C96
         LDX   #^L031C96
         JSL   L1A0EFF
         PLA
         PLX
         STX   $E2
         STA   $E0
         PEA   $0002
         LDA   #$0064
         PHA
         LDA   $FF
         PHA
         LDY   #$0002
         LDA   [$E0],Y
         PHA
         LDY   #$000A
         LDA   [$F7],Y
         PLX
         STX   $F0
         CLC
         ADC   $F0
         SEC
         JSL   L1A109A
         PLA
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   $FD
         PLX
         STX   $F0
         CLC
         ADC   $F0
         PHA
         LDA   #$0064
         PHA
         LDA   $FF
         PHA
         LDA   [$E0]
         PHA
         LDY   #$0008
         LDA   [$F7],Y
         PLX
         STX   $F0
         CLC
         ADC   $F0
         SEC
         JSL   L1A109A
         PLA
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   $FB
         PLX
         STX   $F0
         CLC
         ADC   $F0
         PHA
         LDA   #$0064
         PHA
         LDA   $FF
         PHA
         LDY   #$0002
         LDA   [$E4],Y
         PHA
         LDY   #$000A
         LDA   [$F7],Y
         PLX
         STX   $F0
         CLC
         ADC   $F0
         SEC
         JSL   L1A109A
         PLA
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   $FD
         PLX
         STX   $F0
         CLC
         ADC   $F0
         PHA
         LDA   #$0064
         PHA
         LDA   $FF
         PHA
         LDA   [$E4]
         PHA
         LDY   #$0008
         LDA   [$F7],Y
         PLX
         STX   $F0
         CLC
         ADC   $F0
         SEC
         JSL   L1A109A
         PLA
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   $FB
         PLX
         STX   $F0
         CLC
         ADC   $F0
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $E8
         CLC
         ADC   #$0002
         STA   $E8
         BCC   L0F08BB
         INC   $EA
L0F08BB  BRL   L0F0794
L0F08BE  TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PLD
         RTL

L0F08C8  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         JSL   L230673
         LDA   #L031BE0
         LDX   #^L031BE0
         STX   $F2
         STA   $F0
         LDA   #$0001
         STA   $F4
         BRA   L0F0910
L0F08E8  LDA   #$0000
         LDY   #$0008
         STA   [$F0],Y
         LDA   #$0000
         LDY   #$000A
         STA   [$F0],Y
         LDY   #$0006
         LDA   [$F0],Y
         LDY   #$000C
         STA   [$F0],Y
         LDA   $F0
         CLC
         ADC   #$000E
         STA   $F0
         BCC   L0F090E
         INC   $F2
L0F090E  INC   $F4
L0F0910  LDA   $F4
         SEC
         SBC   #$000E
         BVS   L0F091B
         EOR   #$8000
L0F091B  BPL   L0F08E8
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PLD
         RTL

L0F092A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E4
         TCS
         JSL   L0F08C8
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         JSL   L04039E
         PLY
         PLY
         STZ   $EC
         LDX   #$0000
         LDA   #$0096
         SEC
         SBC   L02016B
         PHA
         TXA
         SBC   L02016D
         TAX
         PLA
         STA   $EA
         LDA   $EA
         SEC
         SBC   #$0000
         BVS   L0F0967
         EOR   #$8000
L0F0967  BMI   L0F096B
         STZ   $EA
L0F096B  LDA   #$0008
         PHA
         LDA   $EA
         SEC
         JSL   L1A0F19
         PLY
         STA   $EA
         LDX   L020165
         LDA   L020163
         PHA
         LDX   L020161
         LDA   L02015F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L270168
         PLY
         PLY
         PLY
         PLY
         LDA   $E8
         STA   $EE
         PEI   $EA
         PEA   $00C2
         PEI   $EE
         PEA   ^L031BD2
         PEA   L031BD2
         JSL   L0F077D
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #L031BE0
         LDX   #^L031BE0
         STX   $F2
         STA   $F0
         LDA   #$0001
         STA   $F4
         BRA   L0F0A2F
L0F09C3  PEI   $EA
         PEA   $00C2
         PEI   $EE
         PEI   $F2
         PEI   $F0
         JSL   L0F077D
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #$0003
         PHA
         LDY   #$0004
         LDA   [$F0],Y
         SEC
         JSL   L1A184A
         LDY   #$0008
         LDA   [$F0],Y
         PLX
         STX   $FA
         CLC
         ADC   $FA
         LDY   #$0008
         STA   [$F0],Y
         LDA   #$0003
         PHA
         LDY   #$000C
         LDA   [$F0],Y
         SEC
         JSL   L1A184A
         LDY   #$000A
         LDA   [$F0],Y
         PLX
         STX   $FA
         CLC
         ADC   $FA
         LDY   #$000A
         STA   [$F0],Y
         LDY   #$000C
         LDA   [$F0],Y
         CLC
         ADC   #$000C
         LDY   #$000C
         STA   [$F0],Y
         LDA   $F0
         CLC
         ADC   #$000E
         STA   $F0
         BCC   L0F0A2D
         INC   $F2
L0F0A2D  INC   $F4
L0F0A2F  LDA   $F4
         SEC
         SBC   #$000E
         BVS   L0F0A3A
         EOR   #$8000
L0F0A3A  BPL   L0F09C3
         LDA   L020083
         BEQ   L0F0A69
         PEA   $00C8
         PEA   $0140
         PEA   $006E
         PEA   $0000
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
L0F0A69  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         PLD
         RTL

L0F0A76  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E4
         TCS
         JSL   L0F08C8
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         JSL   L04039E
         PLY
         PLY
         STZ   $EC
         LDX   #$0000
         LDA   #$0011
         PHX
         PHA
         LDX   L02016D
         LDA   L02016B
         CLC
         ADC   #$0096
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         STA   $EA
         LDX   L020165
         LDA   L020163
         PHA
         LDX   L020161
         LDA   L02015F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E6
         PHA
         JSL   L270168
         PLY
         PLY
         PLY
         PLY
         LDA   $E8
         STA   $EE
         PEI   $EA
         PEA   $0040
         PEI   $EE
         PEA   ^L031BD2
         PEA   L031BD2
         JSL   L0F077D
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #L031BE0
         LDX   #^L031BE0
         STX   $F2
         STA   $F0
         LDA   #$0001
         STA   $F4
         BRA   L0F0B6D
L0F0B01  PEI   $EA
         PEA   $0040
         PEI   $EE
         PEI   $F2
         PEI   $F0
         JSL   L0F077D
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #$0003
         PHA
         LDY   #$0004
         LDA   [$F0],Y
         SEC
         JSL   L1A184A
         LDY   #$0008
         LDA   [$F0],Y
         PLX
         STX   $FA
         CLC
         ADC   $FA
         LDY   #$0008
         STA   [$F0],Y
         LDA   #$0003
         PHA
         LDY   #$000C
         LDA   [$F0],Y
         SEC
         JSL   L1A184A
         LDY   #$000A
         LDA   [$F0],Y
         PLX
         STX   $FA
         CLC
         ADC   $FA
         LDY   #$000A
         STA   [$F0],Y
         LDY   #$000C
         LDA   [$F0],Y
         CLC
         ADC   #$000C
         LDY   #$000C
         STA   [$F0],Y
         LDA   $F0
         CLC
         ADC   #$000E
         STA   $F0
         BCC   L0F0B6B
         INC   $F2
L0F0B6B  INC   $F4
L0F0B6D  LDA   $F4
         SEC
         SBC   #$000E
         BVS   L0F0B78
         EOR   #$8000
L0F0B78  BPL   L0F0B01
         PEA   $0054
         PEA   $0104
         PEA   $0022
         PEA   $003C
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         PLD
         RTL

L0F0BAF  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         LDX   $FF
         LDA   $FD
         LDY   #$0002
         PHA
         TXA
         STA   [$F9],Y
         PLA
         STA   [$F9]
         LDY   #$0002
         LDA   [$FD],Y
         ASL
         LDY   #$0008
         STA   [$F9],Y
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDY   #$0006
         LDA   [$FD],Y
         TAX
         LDY   #$0004
         LDA   [$FD],Y
         JSL   L1A130B
         BEQ   L0F0C09
         PEI   $FB
         PEI   $F9
         LDY   #$0006
         LDA   [$FD],Y
         TAX
         LDY   #$0004
         LDA   [$FD],Y
         STA   $EE
         STX   $F0
         LDA   $EE
         LDX   $F0
         JSL   L1A1947
         PLY
         PLY
L0F0C09  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F0C11  PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E8
         TCS
         STZ   $EA
         LDA   $FF
         BRL   L0F0CB6
L0F0C23  LDA   L020061
         LDX   #$0000
         TAY
         BPL   L0F0C2D
         DEX
L0F0C2D  PEA   $0000
         PEA   $000E
         CLC
         JSL   L1A10DF
         LDA   #L031F0A
         LDX   #^L031F0A
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         INC   L020061
         BRL   L0F0CC3
L0F0C4E  LDA   L020063
         LDX   #$0000
         TAY
         BPL   L0F0C58
         DEX
L0F0C58  PEA   $0000
         PEA   $000E
         CLC
         JSL   L1A10DF
         LDA   #L031F7A
         LDX   #^L031F7A
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         INC   L020063
         BRL   L0F0CC3
L0F0C79  LDA   L020061
         LDX   #$0000
         TAY
         BPL   L0F0C83
         DEX
L0F0C83  PEA   $0000
         PEA   $000E
         CLC
         JSL   L1A10DF
         LDA   #L031F0A
         LDX   #^L031F0A
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         INC   L020061
         LDA   #$0001
         STA   $EA
         STZ   $FF
         BRL   L0F0CC3
L0F0CAB  BRL   L0F0CC3
L0F0CAE  DA    L0F0C23
         DA    L0F0C4E
         DA    L0F0C79
         DA    L0F0CAB
L0F0CB6  CMP   #$0003
         BCC   L0F0CBE
         LDA   #$0003
L0F0CBE  ASL
         TAX
         JMP   (L0F0CAE,X)

L0F0CC3  PEI   $FD
         PEI   $FB
         PEI   $EE
         PEI   $EC
         JSL   L0F0BAF
         PLY
         PLY
         PLY
         PLY
         LDX   $FD
         LDA   $FB
         LDY   #$0006
         PHA
         TXA
         STA   [$EC],Y
         PLA
         LDY   #$0004
         STA   [$EC],Y
         LDA   $FF
         LDY   #$000A
         STA   [$EC],Y
         LDA   $EA
         LDY   #$000C
         STA   [$EC],Y
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0F0CFA  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020063
         STZ   L020061
         LDX   L0200A2
         LDA   L0200A0
         STX   L020073
         STA   L020071
         LDA   #$0034
         STA   L020075
         LDA   L020087
         BRL   L0F0E15
L0F0D23  PEA   $0001
         PEA   ^L030964
         PEA   L030964
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0D36  PEA   $0001
         PEA   ^L030A36
         PEA   L030A36
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0D49  PEA   $0001
         PEA   ^L030BE8
         PEA   L030BE8
         JSL   L0F0C11
         PLY
         PLY
         PLY
         PEA   $0001
         PEA   ^L030BB6
         PEA   L030BB6
         JSL   L0F0C11
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   ^L030BFC
         PEA   L030BFC
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0D7C  PEA   $0001
         PEA   ^L030E6C
         PEA   L030E6C
         JSL   L0F0C11
         PLY
         PLY
         PLY
         PEA   $0001
         PEA   ^L030E80
         PEA   L030E80
         JSL   L0F0C11
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   ^L030EE4
         PEA   L030EE4
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0DAF  BRL   L0F0E23
L0F0DB2  PEA   $0001
         PEA   ^L0311BE
         PEA   L0311BE
         JSL   L0F0C11
         PLY
         PLY
         PLY
         PEA   $0001
         PEA   ^L03118C
         PEA   L03118C
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0DD5  PEA   $0001
         PEA   ^L03165A
         PEA   L03165A
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0DE8  BRL   L0F0E23
L0F0DEB  PEA   $0001
         PEA   ^L0319C6
         PEA   L0319C6
         JSL   L0F0C11
         PLY
         PLY
         PLY
         BRL   L0F0E23
L0F0DFE  BRL   L0F0E23
L0F0E01  DA    L0F0D23
         DA    L0F0D36
         DA    L0F0D49
         DA    L0F0D7C
         DA    L0F0DB2
         DA    L0F0DAF
         DA    L0F0DD5
         DA    L0F0DE8
         DA    L0F0DEB
         DA    L0F0DFE
L0F0E15  DEC
         CMP   #$0009
         BCC   L0F0E1E
         LDA   #$0009
L0F0E1E  ASL
         TAX
         JMP   (L0F0E01,X)

L0F0E23  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F0E2B  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EA
         TCS
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L0F0E3F
         DEX
L0F0E3F  PEA   $0000
         PEA   $000E
         CLC
         JSL   L1A10DF
         LDA   #L031F0A
         LDX   #^L031F0A
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDX   $EE
         LDA   $EC
         CLC
         ADC   #$000E
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   $F2
         STA   $F0
         DEC   L020061
         BRA   L0F0EBC
L0F0E72  LDX   $F2
         LDA   $F0
         PHX
         PHA
         CLC
         ADC   #$000E
         STA   $F0
         LDA   $F2
         BCC   L0F0E83
         INC
L0F0E83  STA   $F2
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         PHX
         PHA
         LDX   $EE
         LDA   $EC
         PHX
         PHA
         CLC
         ADC   #$000E
         STA   $EC
         LDA   $EE
         BCC   L0F0EA2
         INC
L0F0EA2  STA   $EE
         PLA
         PLX
         STA   $F4
         STX   $F6
         PEI   $F6
         PEI   $F4
         PEA   $000E
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         INC   $FF
L0F0EBC  LDA   $FF
         SEC
         SBC   L020061
         BVS   L0F0EC7
         EOR   #$8000
L0F0EC7  BPL   L0F0E72
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0F0ED1  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00D6
         TCS
         LDA   $FD
         SEC
         SBC   #$0000
         BVS   L0F0EE7
         EOR   #$8000
L0F0EE7  BMI   L0F0EEC
         BRL   L0F1052
L0F0EEC  LDX   $FB
         LDA   $F9
         STX   $E8
         STA   $E6
         LDX   #$0000
         LDA   #$0003
         PHX
         PHA
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L0F0F05
         DEX
L0F0F05  SEC
         JSL   L1A1823
         LDX   $E8
         LDA   $E6
         JSL   L1A0EFF
         PLA
         PLX
         STX   $E8
         STA   $E6
         LDY   #$0006
         LDA   [$E6],Y
         STA   $DE
         LDA   $FF
         BEQ   L0F0F75
         LDA   $FD
         CMP   #$0000
         BNE   L0F0F41
         LDA   [$E6]
         PHA
         LDA   #$0074
         PLX
         STX   $EE
         CLC
         ADC   $EE
         STA   $E4
         LDY   #$0002
         LDA   [$E6],Y
         STA   $E0
         BRA   L0F0F6B
L0F0F41  LDA   [$E6]
         PHA
         LDA   [$F9]
         PHA
         LDA   #$0074
         PLX
         STX   $EE
         CLC
         ADC   $EE
         PLX
         STX   $EE
         CLC
         ADC   $EE
         STA   $E4
         LDY   #$0002
         LDA   [$E6],Y
         PHA
         LDY   #$0002
         LDA   [$F9],Y
         PLX
         STX   $EE
         CLC
         ADC   $EE
         STA   $E0
L0F0F6B  LDA   $E0
         CLC
         ADC   #$0044
         STA   $E2
         BRA   L0F0F80
L0F0F75  LDA   [$E6]
         STA   $E4
         LDY   #$0002
         LDA   [$E6],Y
         STA   $E2
L0F0F80  STZ   $DC
         LDA   L020075
         CMP   #$FFFF
         BNE   L0F0FE3
         JSL   L040000
         LDY   #$0004
         LDA   [$E6],Y
         PHA
         LDA   $E4
         PLX
         STX   $EE
         CLC
         ADC   $EE
         STA   $DA
         LDY   #$0006
         LDA   [$E6],Y
         PHA
         LDA   $E2
         PLX
         STX   $EE
         SEC
         SBC   $EE
         STA   $D8
         LDA   $E4
         CMP   L020011
         BCS   L0F0FE3
         LDA   $DA
         CMP   L020011
         BEQ   L0F0FE3
         BCC   L0F0FE3
         LDA   $D8
         CMP   L020013
         BCS   L0F0FE3
         LDA   $E2
         CMP   L020013
         BEQ   L0F0FE3
         BCC   L0F0FE3
         LDA   #$FFFF
         STA   $DC
         _HideCursor
         BCS   L0F0FDF
         LDA   #$0000
L0F0FDF  STAL  L0201E7
L0F0FE3  PEI   $FD
         PEA   ^L031D8E
         PEA   L031D8E
         JSL   L1A0DAA
         PLY
         PLY
         PLY
         LDY   #$0006
         LDA   [$E6],Y
         PHA
         LDY   #$0004
         LDA   [$E6],Y
         PHA
         PEI   $E2
         PEI   $E4
         PEA   ^L031DA0
         PEA   L031DA0
         JSL   L1A0DAA
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEI   $F7
         PEI   $F5
         LDX   L020073
         LDA   L020071
         PHX
         PHA
         LDY   #$0006
         LDA   [$E6],Y
         PHA
         LDY   #$0004
         LDA   [$E6],Y
         PHA
         PEI   $E2
         PEI   $E4
         PEI   $FD
         JSL   L07018A
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   $DC
         BEQ   L0F1052
         _ShowCursor
         BCS   L0F104E
         LDA   #$0000
L0F104E  STAL  L0201E7
L0F1052  TSC
         CLC
         ADC   #$0018
         TCS
         PLD
         RTL

L0F105A  PHD
         TSC
         SEC
         SBC   #$00EB
         TCD
         ADC   #$00E0
         TCS
         LDY   #$0002
         LDA   [$FB],Y
         TAX
         LDA   [$FB]
         STX   $E4
         STA   $E2
         PEI   $FF
         LDA   [$E2]
         PHA
         PEI   $F9
         PEI   $F7
         PEI   $F5
         PEI   $F3
         JSL   L0F0ED1
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEI   $FF
         LDY   #$0008
         LDA   [$E2],Y
         PHA
         PEI   $F9
         PEI   $F7
         PEI   $F5
         PEI   $F3
         JSL   L0F0ED1
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDY   #$0008
         LDA   [$FB],Y
         CMP   #$0000
         BEQ   L0F10B3
         BRL   L0F114B
L0F10B3  LDA   $E2
         CLC
         ADC   #$000A
         STA   $E2
         BCC   L0F10BF
         INC   $E4
L0F10BF  LDA   [$E2]
         CMP   #$FFFE
         BNE   L0F10F8
         PEI   $FD
         PEI   $FB
         LDY   #$0006
         LDA   [$E2],Y
         TAX
         LDY   #$0004
         LDA   [$E2],Y
         STA   $E6
         STX   $E8
         LDA   $E6
         LDX   $E8
         JSL   L1A1947
         PLY
         PLY
         TAY
         BEQ   L0F10EC
         LDA   #$0001
         BRL   L0F115B
L0F10EC  LDA   $E2
         CLC
         ADC   #$000A
         STA   $E2
         BCC   L0F10F8
         INC   $E4
L0F10F8  LDA   [$E2]
         SEC
         SBC   #$FFFF
         BVS   L0F1103
         EOR   #$8000
L0F1103  BPL   L0F111A
         PEI   $E4
         PEI   $E2
         PEI   $FD
         PEI   $FB
         JSL   L0F0BAF
         PLY
         PLY
         PLY
         PLY
         LDA   #$0001
         BRA   L0F115B
L0F111A  LDY   #$000A
         LDA   [$FB],Y
         BEQ   L0F113F
         LDY   #$0006
         LDA   [$FB],Y
         TAX
         LDY   #$0004
         LDA   [$FB],Y
         PHX
         PHA
         PEI   $FD
         PEI   $FB
         JSL   L0F0BAF
         PLY
         PLY
         PLY
         PLY
         LDA   #$0001
         BRA   L0F115B
L0F113F  PEI   $F1
         JSL   L0F0E2B
         PLY
         LDA   #$0000
         BRA   L0F115B
L0F114B  LDY   #$0008
         LDA   [$FB],Y
         PHA
         DEC
         LDY   #$0008
         STA   [$FB],Y
         PLA
         LDA   #$0001
L0F115B  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020061
         SEC
         SBC   #$0000
         BEQ   L0F11A8
         BVS   L0F117E
         EOR   #$8000
L0F117E  BPL   L0F11A8
         PEA   $0001
         PEA   ^L031F0A
         PEA   L031F0A
         LDX   L020079
         LDA   L020077
         PHX
         PHA
         LDX   L02005B
         LDA   L020059
         PHX
         PHA
         PEA   $0000
         JSL   L0F105A
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
L0F11A8  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F11B0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EA
         TCS
         PEA   $0044
         PEA   $0000
         JSL   L0705C4
         PLY
         PLY
         LDA   L020061
         BNE   L0F11CF
         BRL   L0F122A
L0F11CF  LDA   #L031F0A
         LDX   #^L031F0A
         STX   $F2
         STA   $F0
         STZ   $F4
         BRA   L0F121A
L0F11DD  LDY   #$000C
         LDA   [$F0],Y
         BNE   L0F120C
         PEA   $0001
         PEI   $F2
         PEI   $F0
         LDX   L020079
         LDA   L020077
         PHX
         PHA
         LDX   L02005B
         LDA   L020059
         PHX
         PHA
         PEI   $F4
         JSL   L0F105A
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         TAY
         BEQ   L0F121A
L0F120C  INC   $F4
         LDA   $F0
         CLC
         ADC   #$000E
         STA   $F0
         BCC   L0F121A
         INC   $F2
L0F121A  LDA   $F4
         SEC
         SBC   L020061
         BVS   L0F1225
         EOR   #$8000
L0F1225  BPL   L0F11DD
         BRL   L0F1278
L0F122A  LDA   #L031F7A
         LDX   #^L031F7A
         STX   $F2
         STA   $F0
         STZ   $F4
         BRA   L0F126B
L0F1238  PEA   $0001
         PEI   $F2
         PEI   $F0
         LDX   L020079
         LDA   L020077
         PHX
         PHA
         LDX   L02005B
         LDA   L020059
         PHX
         PHA
         PEI   $F4
         JSL   L0F105A
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         INC   $F4
         LDA   $F0
         CLC
         ADC   #$000E
         STA   $F0
         BCC   L0F126B
         INC   $F2
L0F126B  LDA   $F4
         SEC
         SBC   L020063
         BVS   L0F1276
         EOR   #$8000
L0F1276  BPL   L0F1238
L0F1278  PEA   $00C7
         PEA   $0000
         JSL   L0705C4
         PLY
         PLY
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L0F128C  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         STZ   $F0
         STZ   $F2
         LDA   L020087
         BRL   L0F1420
L0F12A1  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0309D2
         LDX   #^L0309D2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F12C9  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L030B62
         LDX   #^L030B62
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F12F1  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L030DC8
         LDX   #^L030DC8
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F1319  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0310B0
         LDX   #^L0310B0
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F1341  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0315D6
         LDX   #^L0315D6
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F1369  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L031344
         LDX   #^L031344
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F1391  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0317C2
         LDX   #^L0317C2
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F13B9  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L03196A
         LDX   #^L03196A
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F13E1  LDA   $FF
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L031AB6
         LDX   #^L031AB6
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STX   $F2
         STA   $F0
         BRL   L0F142E
L0F1409  BRL   L0F142E
L0F140C  DA    L0F12A1
         DA    L0F12C9
         DA    L0F12F1
         DA    L0F1319
         DA    L0F1369
         DA    L0F1341
         DA    L0F1391
         DA    L0F13B9
         DA    L0F13E1
         DA    L0F1409
L0F1420  DEC
         CMP   #$0009
         BCC   L0F1429
         LDA   #$0009
L0F1429  ASL
         TAX
         JMP   (L0F140C,X)

L0F142E  LDX   $F2
         LDA   $F0
         STX   $F4
         ORA   $F4
         BEQ   L0F1446
         PEA   $0000
         PEI   $F2
         PEI   $F0
         JSL   L0F0C11
         PLY
         PLY
         PLY
L0F1446  TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L0F144E  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         LDX   L020069
         LDA   L020067
         CLC
         ADC   #$0004
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PHX
         PHA
         _GetTick
         BCS   L0F147A
         LDA   #$0000
L0F147A  STAL  L0201E7
         PLA
         PLX
         JSL   L1A130B
         BEQ   L0F1493
         BVS   L0F148B
         EOR   #$8000
L0F148B  BPL   L0F1493
         BRL   L0F150B
         BRL   L0F150B
L0F1493  PHX
         PHA
         _GetTick
         BCS   L0F14A1
         LDA   #$0000
L0F14A1  STAL  L0201E7
         PLA
         PLX
         STX   L020069
         STA   L020067
         LDX   L0200A2
         LDA   L0200A0
         STX   L020073
         STA   L020071
         LDA   #$FFFF
         STA   L020075
         LDA   #L031F7A
         LDX   #^L031F7A
         STX   $F2
         STA   $F0
         STZ   $F4
         BRA   L0F14FE
L0F14CD  PEA   $0000
         PEI   $F2
         PEI   $F0
         PEA   ^L0305B4
         PEA   L0305B4
         LDX   L02011C
         LDA   L02011A
         PHX
         PHA
         PEI   $F4
         JSL   L0F105A
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         INC   $F4
         LDA   $F0
         CLC
         ADC   #$000E
         STA   $F0
         BCC   L0F14FE
         INC   $F2
L0F14FE  LDA   $F4
         SEC
         SBC   L020063
         BVS   L0F1509
         EOR   #$8000
L0F1509  BPL   L0F14CD
L0F150B  TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PLD
         RTL

L0F1515  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020087
         CMP   #$0009
         BNE   L0F1542
         STZ   L020061
         LDA   #$0006
         STAL  L031A8E
         PEA   $0000
         PEA   ^L031A70
         PEA   L031A70
         JSL   L0F0C11
         PLY
         PLY
         PLY
L0F1542  LDA   L020087
         CMP   #$0007
         BNE   L0F155D
         STZ   L020061
         PEA   $0000
         PEA   ^L03168C
         PEA   L03168C
         JSL   L0F0C11
         PLY
         PLY
         PLY
L0F155D  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1565  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020047
         SEC
         SBC   #$000F
         BVS   L0F157C
         EOR   #$8000
L0F157C  BPL   L0F1588
         PEA   $0004
         JSL   L0F128C
         PLY
         BRA   L0F1590
L0F1588  PEA   $0003
         JSL   L0F128C
         PLY
L0F1590  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1598  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020045
         SEC
         SBC   #$000F
         BVS   L0F15AF
         EOR   #$8000
L0F15AF  BPL   L0F15BB
         PEA   $0001
         JSL   L0F128C
         PLY
         BRA   L0F15C3
L0F15BB  PEA   $0002
         JSL   L0F128C
         PLY
L0F15C3  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F15CB  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020063
         STZ   L020061
         LDA   L020087
         CMP   #$0006
         BNE   L0F15E8
         JSL   L0F0249
L0F15E8  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F15F0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020061
         BNE   L0F160C
         JSL   L230000
         TAY
         BNE   L0F160C
         LDA   #$0000
         BRA   L0F160F
L0F160C  LDA   #$0001
L0F160F  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0F1619  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$FFFF
         STA   L02005D
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1632  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L02005D
         CMP   L020087
         BNE   L0F1648
         BRL   L0F185C
L0F1648  PEA   ^L020059
         PEA   L020059
         JSL   L0405BC
         PLY
         PLY
         PEA   ^L0201B7
         PEA   L0201B7
         JSL   L0405BC
         PLY
         PLY
         LDA   L020087
         BRL   L0F1848
L0F1666  PEA   ^L031DC2
         PEA   L031DC2
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031DD1
         PEA   L031DD1
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L0309E6
         LDX   #^L0309E6
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F1699  PEA   ^L031DE1
         PEA   L031DE1
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031DF2
         PEA   L031DF2
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L030B76
         LDX   #^L030B76
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F16CC  PEA   ^L031E04
         PEA   L031E04
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031E15
         PEA   L031E15
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L030DDC
         LDX   #^L030DDC
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F16FF  PEA   ^L031E27
         PEA   L031E27
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031E37
         PEA   L031E37
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L0310C4
         LDX   #^L0310C4
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F1732  PEA   ^L031E48
         PEA   L031E48
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031E59
         PEA   L031E59
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L0315EA
         LDX   #^L0315EA
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F1765  PEA   ^L031E6B
         PEA   L031E6B
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031E7D
         PEA   L031E7D
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L031358
         LDX   #^L031358
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F1798  PEA   ^L031E90
         PEA   L031E90
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031EA0
         PEA   L031EA0
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L0317D6
         LDX   #^L0317D6
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F17CB  PEA   ^L031EB1
         PEA   L031EB1
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031EC0
         PEA   L031EC0
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L03197E
         LDX   #^L03197E
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F17FE  PEA   ^L031ED0
         PEA   L031ED0
         JSL   L05051F
         PLY
         PLY
         STX   L02005B
         STA   L020059
         PEA   ^L031EE0
         PEA   L031EE0
         JSL   L050542
         PLY
         PLY
         STX   L0201B9
         STA   L0201B7
         LDA   #L031ACA
         LDX   #^L031ACA
         STX   L020079
         STA   L020077
         BRL   L0F1856
L0F1831  BRL   L0F1856
L0F1834  DA    L0F1666
         DA    L0F1699
         DA    L0F16CC
         DA    L0F16FF
         DA    L0F1765
         DA    L0F1732
         DA    L0F1798
         DA    L0F17CB
         DA    L0F17FE
         DA    L0F1831
L0F1848  DEC
         CMP   #$0009
         BCC   L0F1851
         LDA   #$0009
L0F1851  ASL
         TAX
         JMP   (L0F1834,X)

L0F1856  LDA   L020087
         STA   L02005D
L0F185C  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1864  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0042
         PEA   $0000
         JSL   L0705C4
         PLY
         PLY
         LDX   L02005B
         LDA   L020059
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   L020079
         LDA   L020077
         STA   $F6
         STX   $F8
         LDY   #$0006
         LDA   [$F6],Y
         PHA
         LDX   L020079
         LDA   L020077
         STA   $F6
         STX   $F8
         LDY   #$0004
         LDA   [$F6],Y
         PHA
         LDX   L020079
         LDA   L020077
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         PHA
         LDA   #$0044
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         LDX   L020079
         LDA   L020077
         STA   $F6
         STX   $F8
         LDA   [$F6]
         PHA
         LDA   #$0074
         PLX
         STX   $FA
         CLC
         ADC   $FA
         PHA
         PEA   $0000
         JSL   L07018A
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $00C7
         PEA   $0000
         JSL   L0705C4
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F190A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$FFFF
         STA   L020083
         PEA   $0000
         PEA   ^L031D66
         PEA   L031D66
         JSL   L0F0C11
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1933  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0000
         PEA   ^L031D7A
         PEA   L031D7A
         JSL   L0F0C11
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1956  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0001
         PEA   ^L0306E4
         PEA   L0306E4
         JSL   L0F0C11
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1979  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020063
         PEA   $0001
         PEA   ^L0308EC
         PEA   L0308EC
         JSL   L0F0C11
         PLY
         PLY
         PLY
         JSL   L230551
         STZ   L020063
         PEA   $0001
         PEA   ^L0306E4
         PEA   L0306E4
         JSL   L0F0C11
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F19B6  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020083
         LDX   #$FFFF
         LDA   #$FED4
         STX   L02016D
         STA   L02016B
         PEA   $0000
         PEA   ^L031D66
         PEA   L031D66
         JSL   L0F0C11
         PLY
         PLY
         PLY
L0F19E0  JSL   L0F15F0
         TAY
         BEQ   L0F19ED
         JSL   L0F11B0
         BRA   L0F19E0
L0F19ED  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F19F5  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0000
         PEA   $AFC8
         JSL   L040514
         PLY
         PLY
         STX   L02005B
         STA   L020059
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0F1A1A  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEA   ^L031EF1
         PEA   L031EF1
         JSL   L1A0E02
         PLY
         PLY
         JSL   L1A0E95
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
         PEA   ^L031EFD
         PEA   L031EFD
         JSL   L1A0E02
         PLY
         PLY
         PEA   $0003
         PEA   $0000
         JSL   L1B0242
         PLY
         PLY
         PHA
         JSL   L0F1A1A
         PLY
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
