*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg23.L
         lst   off

*-----------

         use   Seg23.X

*-----------

         use   4/Sound.Macs
         use   4/Util.Macs

*-----------

L230000  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PHA
         PEA   $0000
         _FFSoundDoneStatus
         BCS   L23001B
         LDA   #$0000
L23001B  STAL  L0201E7
         PLA
         TAY
         BEQ   L230028
         LDA   #$0000
         BRA   L23002B
L230028  LDA   #$0001
L23002B  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230035  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00D4
         TCS
         STZ   $EA
         LDA   $FD
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L23004F
         DEX
L23004F  STX   $F6
         ASL
         ROL   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   L0201C3
         LDA   L0201C1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         JSL   L0C0000
         PLY
         PLY
         PHX
         PHA
         LDX   L0201C3
         LDA   L0201C1
         JSL   L1A0EFF
         PLA
         PLX
         STX   $D8
         STA   $D6
L23008D  LDX   $D8
         LDA   $D6
         INC   $D6
         BNE   L230097
         INC   $D8
L230097  STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         AND   #$00FF
         STA   $F0
         LDX   $D8
         LDA   $D6
         INC   $D6
         BNE   L2300AF
         INC   $D8
L2300AF  STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         PHA
         LDA   #$00FF
         PLX
         STX   $F6
         SEC
         SBC   $F6
         STA   $EE
         LDA   #$0080
         STA   $EE
         LDA   $F0
         CMP   #$00FF
         BEQ   L2300DA
         LDA   $EA
         CMP   #$0014
         BEQ   L2300DA
         BRL   L230187
L2300DA  LDA   $FF
         AND   #$0020
         TAY
         BEQ   L230120
         LDA   #L032B33
         LDX   #^L032B33
         PHX
         PHA
         LDA   $EA
         SEC
         SBC   #$0001
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         PLX
         LDY   #$000E
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$000C
         STA   [$F2],Y
         BRA   L230158
L230120  LDA   $EA
         SEC
         SBC   #$0001
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDX   #$0000
         LDA   #$0000
         LDY   #$000E
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$000C
         STA   [$F2],Y
L230158  PEA   $0001
         _FFStopSound
         BCS   L230167
         LDA   #$0000
L230167  STAL  L0201E7
         PEA   $0001
         PEA   ^L032B33
         PEA   L032B33
         _FFStartSound
         BCS   L230180
         LDA   #$0000
L230180  STAL  L0201E7
         BRL   L2303DC
L230187  LDA   $EA
         BEQ   L2301DA
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         LDA   $EA
         SEC
         SBC   #$0001
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         PLX
         LDY   #$000E
         PHA
         TXA
         STA   [$F2],Y
         PLA
         LDY   #$000C
         STA   [$F2],Y
L2301DA  LDX   #$0000
         LDA   #$0003
         PHX
         PHA
         LDA   $F0
         CLC
         ADC   L0201C5
         CLC
         ADC   #$0002
         LDX   #$0000
         STX   $F6
         ASL
         ROL   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   L0201C3
         LDA   L0201C1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         JSL   L0C0000
         PLY
         PLY
         PHX
         PHA
         LDX   #$0000
         LDA   #$0002
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         PHX
         PHA
         LDX   L0201C3
         LDA   L0201C1
         JSL   L1A0EFF
         PLA
         PLX
         STX   $E0
         STA   $DE
         LDX   #$0000
         LDA   #$0003
         PHX
         PHA
         LDA   $F0
         CLC
         ADC   L0201C5
         CLC
         ADC   #$0003
         LDX   #$0000
         STX   $F6
         ASL
         ROL   $F6
         ASL
         ROL   $F6
         LDX   $F6
         PHX
         PHA
         LDX   L0201C3
         LDA   L0201C1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         PHX
         PHA
         JSL   L0C0000
         PLY
         PLY
         PHX
         PHA
         LDX   #$0000
         LDA   #$0002
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         PHX
         PHA
         LDX   L0201C3
         LDA   L0201C1
         JSL   L1A0EFF
         PLA
         PLX
         STX   $DC
         STA   $DA
         LDX   $DC
         LDA   $DA
         SEC
         SBC   $DE
         PHA
         TXA
         SBC   $E0
         TAX
         PLA
         STX   $E8
         STA   $E6
         LDX   #$0000
         LDA   #$0100
         PHX
         PHA
         LDX   $E8
         LDA   $E6
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         STX   $E8
         STA   $E6
         LDX   $E8
         LDA   $E6
         CLC
         ADC   #$0001
         STA   $EC
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDX   $E0
         LDA   $DE
         LDY   #$0002
         PHA
         TXA
         STA   [$F2],Y
         PLA
         STA   [$F2]
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $EC
         LDY   #$0004
         STA   [$F2],Y
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $EE
         LDY   #$0006
         STA   [$F2],Y
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   $EA
         LDY   #$0008
         STA   [$F2],Y
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$0000
         LDY   #$000A
         STA   [$F2],Y
         LDA   $EA
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032B33
         LDX   #^L032B33
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         LDA   #$007F
         LDY   #$0010
         STA   [$F2],Y
         INC   $EA
         BRL   L23008D
L2303DC  TAY
         TSC
         CLC
         ADC   #$0022
         TCS
         TYA
         PLD
         RTL

L2303E6  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0001
         _FFStopSound
         BCS   L230400
         LDA   #$0000
L230400  STAL  L0201E7
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
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L23041F  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         LDX   $FF
         LDA   $FD
         STX   L0201C3
         STA   L0201C1
         LDX   $FF
         LDA   $FD
         STX   $F0
         STA   $EE
         LDA   [$EE]
         PHA
         JSL   L0C0023
         PLY
         STA   L0201C7
         LDY   #$0002
         LDA   [$EE],Y
         PHA
         JSL   L0C0023
         PLY
         STA   L0201C5
         LDA   L0201C5
         PHA
         PEA   ^L032B24
         PEA   L032B24
         JSL   L1A0DAA
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$000A
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
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230481  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         LDA   $FD
         AND   #$00FF
         STA   $F0
         LDA   $FD
         AND   #$0300
         STA   $EE
         LDA   $EE
         BRL   L2304D3
L23049F  LDX   L0201B1
         LDA   L0201AF
         PHX
         PHA
         JSL   L23041F
         PLY
         PLY
         BRL   L2304E2
L2304B0  LDX   L0201B5
         LDA   L0201B3
         PHX
         PHA
         JSL   L23041F
         PLY
         PLY
         BRL   L2304E2
L2304C1  LDX   L0201B9
         LDA   L0201B7
         PHX
         PHA
         JSL   L23041F
         PLY
         PLY
         BRA   L2304E2
         BRA   L2304E2
L2304D3  CMP   #$0000
         BEQ   L23049F
         CMP   #$0100
         BEQ   L2304B0
         CMP   #$0200
         BEQ   L2304C1
L2304E2  PEI   $FF
         PEI   $F0
         JSL   L230035
         PLY
         PLY
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L2304F4  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $00A0
         PEA   $0002
         JSL   L230481
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230513  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $4080
         PEA   $0000
         JSL   L230481
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230532  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $4080
         PEA   $0001
         JSL   L230481
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230551  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $4080
         PEA   $0003
         JSL   L230481
         PLY
         PLY
L230568  JSL   L230000
         TAY
         BEQ   L230575
         JSL   L0F144E
         BRA   L230568
L230575  JSL   L2304F4
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230586  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDX   #$0000
         LDA   #$0044
         PHX
         PHA
         LDX   L020165
         LDA   L020163
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         PHX
         PHA
         LDX   #$0000
         LDA   #$0004
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         LDA   $F4
         SEC
         SBC   #$0004
         BVS   L2305C1
         EOR   #$8000
L2305C1  BMI   L2305CA
         LDA   #$0004
         STA   $F4
         BRA   L2305DE
L2305CA  LDA   $F4
         SEC
         SBC   #$0019
         BEQ   L2305DE
         BVS   L2305D7
         EOR   #$8000
L2305D7  BPL   L2305DE
         LDA   #$0019
         STA   $F4
L2305DE  PEA   $0080
         PEA   $0104
         JSL   L230481
         PLY
         PLY
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L2305F2  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $011A
         JSL   L230481
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
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230624  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         SEC
         LDA   L020163
         SBC   #$02EE
         BNE   L230640
         LDA   L020165
         SBC   #$0000
         BRA   L230648
L230640  LDA   L020165
         SBC   #$0000
         REP   #$02
L230648  BEQ   L23065F
         BVS   L23064F
         EOR   #$8000
L23064F  BPL   L23065F
         PEA   $0080
         PEA   $0101
         JSL   L230481
         PLY
         PLY
         BRA   L23066B
L23065F  PEA   $0080
         PEA   $0100
         JSL   L230481
         PLY
         PLY
L23066B  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230673  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         SEC
         LDA   L02016B
         SBC   #$0096
         BNE   L23068F
         LDA   L02016D
         SBC   #$0000
         BRA   L230697
L23068F  LDA   L02016D
         SBC   #$0000
         REP   #$02
L230697  BEQ   L2306A0
         BVS   L23069E
         EOR   #$8000
L23069E  BMI   L2306C0
L2306A0  SEC
         LDA   L02016B
         SBC   #$FF6A
         BNE   L2306B1
         LDA   L02016D
         SBC   #$FFFF
         BRA   L2306B9
L2306B1  LDA   L02016D
         SBC   #$FFFF
         REP   #$02
L2306B9  BVS   L2306BE
         EOR   #$8000
L2306BE  BMI   L2306CE
L2306C0  PEA   $0080
         PEA   $0102
         JSL   L230481
         PLY
         PLY
         BRA   L2306DA
L2306CE  PEA   $0080
         PEA   $0103
         JSL   L230481
         PLY
         PLY
L2306DA  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2306E7  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   $FF
         CMP   #$0000
         BNE   L230707
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         BRA   L230713
L230707  PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
L230713  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L23071B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L23073F  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230763  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230787  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0003
         PHA
         JSL   L09007C
         SEC
         JSL   L1A0F19
         PLA
         BRL   L2307DB
L2307A3  PEA   $0080
         PEA   $0205
         JSL   L230481
         PLY
         PLY
         BRL   L2307E8
L2307B2  PEA   $0080
         PEA   $0206
         JSL   L230481
         PLY
         PLY
         BRL   L2307E8
L2307C1  PEA   $0080
         PEA   $0207
         JSL   L230481
         PLY
         PLY
         BRL   L2307E8
L2307D0  BRL   L2307E8
L2307D3  DA    L2307A3
         DA    L2307B2
         DA    L2307C1
         DA    L2307D0
L2307DB  CMP   #$0003
         BCC   L2307E3
         LDA   #$0003
L2307E3  ASL
         TAX
         JMP   (L2307D3,X)

L2307E8  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2307F5  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0003
         PHA
         JSL   L09007C
         SEC
         JSL   L1A0F19
         PLA
         BRL   L230849
L230811  PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         BRL   L230856
L230820  PEA   $0080
         PEA   $0202
         JSL   L230481
         PLY
         PLY
         BRL   L230856
L23082F  PEA   $0080
         PEA   $0203
         JSL   L230481
         PLY
         PLY
         BRL   L230856
L23083E  BRL   L230856
L230841  DA    L230811
         DA    L230820
         DA    L23082F
         DA    L23083E
L230849  CMP   #$0003
         BCC   L230851
         LDA   #$0003
L230851  ASL
         TAX
         JMP   (L230841,X)

L230856  LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230863  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230887  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2308AB  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2308CF  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0202
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2308F3  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230917  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L23093B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         PEA   $0080
         PEA   $0102
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L23096B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L23098F  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0203
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2309B3  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0202
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2309D7  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L2309FB  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0202
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230A1F  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230A43  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230A67  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230A8B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0202
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230AAF  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0201
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L230AD3  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $0080
         PEA   $0200
         JSL   L230481
         PLY
         PLY
         LDA   #$0000
         TAY
         TSC
         CLC
         ADC   #$0006
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
         LDA   L0201BD
         CMP   #$0000
         BNE   L230B10
         JSL   L1C0473
         BRA   L230B14
L230B10  JSL   L1C04C6
L230B14  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230B1C  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0201BD
         CMP   #$0000
         BEQ   L230B41
         LDA   L0201BF
         CMP   #$0001
         BNE   L230B3D
         JSL   L1C04EC
         BRA   L230B41
L230B3D  JSL   L1C051C
L230B41  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230B49  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L230586
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230B60  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L2305F2
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
         JSL   L230673
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
         JSL   L230673
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
         JSL   L230673
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230BBC  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L230624
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L230BD3  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L230624
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
         JSL   L230673
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
