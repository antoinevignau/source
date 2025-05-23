*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg09.L
         lst   off

*-----------

         use   Seg09.E
         use   Seg09.X

*-----------

         use   4/Util.Macs

*-----------

L090000  ENT
         STX   $00
         LDY   #$0000
         LDX   #$0000
L090008  STA   $02,X
         CMP   $00
         BEQ   L090031
         BPL   L090015
         INX
         INX
         ASL
         BRA   L090008
L090015  DEX
         DEX
         BMI   L09002F
         LDA   $00
         SEC
         SBC   $02,X
         BCC   L09002A
         STA   $00
         TYA
         ORAL  L0302BF,X
         TAY
         BRA   L090015
L09002A  CLC
         ADC   $02,X
         BRA   L090015
L09002F  TYA
         RTL

L090031  LDAL  L0302BF,X
         RTL

L090036  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         STZ   $F2
         STZ   $F4
         BRA   L09006D
L090047  LDA   $F4
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L0303EB
         LDX   #^L0303EB
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F6
         STX   $F8
         LDA   $F2
         STA   [$F6]
         LDA   $F2
         CLC
         ADC   #$00A0
         STA   $F2
         INC   $F4
L09006D  LDA   $F4
         CMP   #$00C9
         BNE   L090047
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L09007C  ENT
         LDA   L020043
         INC
         STA   L020043
         TAX
         LDAL  $FE0F00,X
         ADCL  $FE7F00,X
         ADCL  $FEF000,X
         RTL

L090091  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F0
         TCS
         LDA   $FF
         STA   L020033
         LDA   $FF
         ASL
         ASL
         ASL
         ASL
         STA   L020035
         LDA   $FF
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   L020037
         LDA   #$000C
         PHA
         LDA   $FF
         CLC
         JSL   L1A1813
         PLA
         STA   L020039
         STZ   $F2
         BRL   L09012C
L0900CB  LDA   $F2
         AND   #$000F
         CMP   $FF
         BNE   L0900D9
         LDA   #$000F
         BRA   L0900DC
L0900D9  LDA   #$0000
L0900DC  PHA
         LDA   $F2
         LDX   #$0000
         PHX
         PHA
         LDA   #L0302EB
         LDX   #^L0302EB
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         PLA
         SEP   #$20
         STA   [$F4]
         REP   #$20
         LDA   $F2
         AND   #$00F0
         CMP   L020035
         BNE   L09012A
         LDA   $F2
         LDX   #$0000
         PHX
         PHA
         LDA   #L0302EB
         LDX   #^L0302EB
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   [$F4]
         AND   #$00FF
         ORA   #$00F0
         SEP   #$20
         STA   [$F4]
         REP   #$20
L09012A  INC   $F2
L09012C  LDA   $F2
         CMP   #$0100
         BNE   L0900CB
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L09013B  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E8
         TCS
         LDA   $FB
         CMP   #$FFFF
         BNE   L090169
         STZ   $EA
         BRA   L090160
L090151  PEI   $FF
         PEI   $FD
         PEI   $EA
         JSL   L09013B
         PLY
         PLY
         PLY
         INC   $EA
L090160  LDA   $EA
         CMP   #$0010
         BNE   L090151
         BRA   L090190
L090169  LDA   $FB
         ASL
         ASL
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDX   #$00E1
         LDA   #$9E00
         JSL   L1A0EFF
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDY   #$001E
L090188  LDA   [$FD],Y
         STA   [$EC],Y
         DEY
         DEY
         BPL   L090188
L090190  TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PLD
         RTL

L09019A  ENT
         STA   $00
         STX   $02
         XBA
         SEP   #$30
         TAX
         LDAL  L0302EB,X
         XBA
         LDX   $00
         LDAL  L0302EB,X
         REP   #$30
         TAX
         AND   $02
         STA   $02
         TXA
         EOR   #$FFFF
         AND   $00
         ORA   $02
         RTL

L0901BD  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E8
         TCS
         LDA   $FF
         ASL
         TAX
         LDAL  L0303EB,X
         STA   $FF
         PHB
         PHK
         PLB
         PER   L0901ED+1
         PLA
         STA   $EA
         SEP   #$20
         LDA   $F9
         XBA
         LDA   $FD
         REP   #$20
         STA   ($EA)
         LDX   $F7
         LDY   $FB
         LDA   $FF
         DEC
L0901ED  MVN   $010000,$000000
         PLB
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L0901F9  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E8
         TCS
         PHB
         PHK
         PLB
         PER   L09021F+1
         PLA
         STA   $EA
         SEP   #$20
         LDA   $F9
         XBA
         LDA   $FD
         REP   #$20
         STA   ($EA)
         LDX   $F7
         LDY   $FB
         LDA   $FF
         DEC
L09021F  MVN   $010000,$000000
         PLB
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L09022B  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         LDX   $FD
L090238  SEP   #$20
         LDA   $FF
         LDY   $FB
         DEY
L09023F  STA   [$F7],Y
         DEY
         BPL   L09023F
         CLC
         REP   #$20
         LDA   $F7
         ADC   #$00A0
         STA   $F7
         DEX
         BNE   L090238
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E8
         TCS
         PEI   $FF
         PEA   ^L0302DF
         PEA   L0302DF
         JSL   L1A0DAA
         PLY
         PLY
         PLY
         STZ   $EA
         BRA   L0902B9
L090277  LDX   $F9
         LDA   $F7
         INC   $F7
         BNE   L090281
         INC   $F9
L090281  STA   $EC
         STX   $EE
         LDA   [$EC]
         AND   #$00FF
         LDX   #$0000
         PHX
         PHA
         LDA   #L0302EB
         LDX   #^L0302EB
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   [$EC]
         PHA
         LDX   $FD
         LDA   $FB
         INC   $FB
         BNE   L0902AC
         INC   $FD
L0902AC  STA   $EC
         STX   $EE
         PLA
         SEP   #$20
         STA   [$EC]
         REP   #$20
         INC   $EA
L0902B9  LDA   $EA
         CMP   $FF
         BNE   L090277
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL
