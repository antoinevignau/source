*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg1F.L
         lst   off

*-----------

         use   Seg1F.X

*-----------

         use   4/Util.Macs

*-----------

L1F0000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   #$0014
         PHA
         PEA   $0015
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L1F001B
         DEX
L1F001B  SEC
         SBC   L02015F
         PHA
         TXA
         SBC   L020161
         TAX
         JSL   L1B02C0
         PLY
         PLY
         SEC
         JSL   L1A0F19
         PLY
         STA   L02016F
         LDA   #$0014
         PHA
         PEA   $0015
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L1F0044
         DEX
L1F0044  SEC
         SBC   L020163
         PHA
         TXA
         SBC   L020165
         TAX
         JSL   L1B02C0
         PLY
         PLY
         SEC
         JSL   L1A0F19
         PLY
         STA   L020171
         LDA   $FD
         STA   L020173
         LDA   $FF
         STA   L020175
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1F006F  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020173
         LDX   #$0000
         TAY
         BPL   L1F0084
         DEX
L1F0084  SEC
         SBC   L02015F
         PHA
         TXA
         SBC   L020161
         TAX
         JSL   L1B0000
         PLY
         PHA
         LDA   L02016F
         PHA
         JSL   L1B0000
         PLY
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BVS   L1F00A8
         EOR   #$8000
L1F00A8  BMI   L1F00AF
         LDA   L020106
         BNE   L1F00C1
L1F00AF  LDA   L020173
         LDX   #$0000
         TAY
         BPL   L1F00B9
         DEX
L1F00B9  STX   L020161
         STA   L02015F
         BRA   L1F00DF
L1F00C1  LDA   L02016F
         LDX   #$0000
         TAY
         BPL   L1F00CB
         DEX
L1F00CB  PHX
         PHA
         LDX   L020161
         LDA   L02015F
         JSL   L1A0EFF
         PLA
         PLX
         STX   L020161
         STA   L02015F
L1F00DF  LDA   L020175
         LDX   #$0000
         TAY
         BPL   L1F00E9
         DEX
L1F00E9  SEC
         SBC   L020163
         PHA
         TXA
         SBC   L020165
         TAX
         JSL   L1B0000
         PLY
         PHA
         LDA   L020171
         PHA
         JSL   L1B0000
         PLY
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BVS   L1F010D
         EOR   #$8000
L1F010D  BMI   L1F0114
         LDA   L020106
         BNE   L1F0126
L1F0114  LDA   L020175
         LDX   #$0000
         TAY
         BPL   L1F011E
         DEX
L1F011E  STX   L020165
         STA   L020163
         BRA   L1F0144
L1F0126  LDA   L020171
         LDX   #$0000
         TAY
         BPL   L1F0130
         DEX
L1F0130  PHX
         PHA
         LDX   L020165
         LDA   L020163
         JSL   L1A0EFF
         PLA
         PLX
         STX   L020165
         STA   L020163
L1F0144  LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L04039E
         PLY
         PLY
         JSL   L120143
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1F015E  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         LDA   L020173
         STA   $F4
         LDA   L020175
         STA   $F2
L1F0173  LDA   $F4
         LDX   #$0000
         TAY
         BPL   L1F017C
         DEX
L1F017C  PHX
         PHA
         LDX   L020161
         LDA   L02015F
         JSL   L1A130B
         BNE   L1F01A1
         LDA   $F2
         LDX   #$0000
         TAY
         BPL   L1F0193
         DEX
L1F0193  PHX
         PHA
         LDX   L020165
         LDA   L020163
         JSL   L1A130B
         BEQ   L1F01B3
L1F01A1  JSL   L120231
         JSL   L1F006F
         JSL   L12019F
         JSL   L180000
         BRA   L1F0173
L1F01B3  STZ   L020167
         STZ   L020169
         STZ   L02016B
         STZ   L02016D
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L1F01C7  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         PEI   $FF
         PEI   $FD
         JSL   L1F0000
         PLY
         PLY
         JSL   L1F015E
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L1F01E8  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L02015F
         STZ   L020161
         LDX   #$0000
         LDA   #$00C3
         STX   L020165
         STA   L020163
         STZ   L020167
         STZ   L020169
         STZ   L02016B
         STZ   L02016D
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1F0219  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $00C3
         PEA   $0000
         JSL   L1F01C7
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1F0238  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $041F
         PEA   $0000
         JSL   L1F01C7
         PLY
         PLY
         STZ   L02002D
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1F025A  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L020161
         LDA   L02015F
         CLC
         ADC   L020167
         PHA
         TXA
         ADC   L020169
         TAX
         PLA
         STX   L020161
         STA   L02015F
         LDX   L020165
         LDA   L020163
         CLC
         ADC   L02016B
         PHA
         TXA
         ADC   L02016D
         TAX
         PLA
         STX   L020165
         STA   L020163
         SEC
         LDA   L02015F
         SBC   #$FF1E
         BNE   L1F02A4
         LDA   L020161
         SBC   #$FFFF
         BRA   L1F02AC
L1F02A4  LDA   L020161
         SBC   #$FFFF
         REP   #$02
L1F02AC  BVS   L1F02B1
         EOR   #$8000
L1F02B1  BMI   L1F02D3
         JSL   L230B49
         LDX   L020169
         LDA   L020167
         JSL   L1A0F0A
         STX   L020169
         STA   L020167
         LDX   #$FFFF
         LDA   #$FF1E
         STX   L020161
         STA   L02015F
L1F02D3  SEC
         LDA   L02015F
         SBC   #$00E2
         BNE   L1F02E4
         LDA   L020161
         SBC   #$0000
         BRA   L1F02EC
L1F02E4  LDA   L020161
         SBC   #$0000
         REP   #$02
L1F02EC  BEQ   L1F0315
         BVS   L1F02F3
         EOR   #$8000
L1F02F3  BPL   L1F0315
         JSL   L230B49
         LDX   L020169
         LDA   L020167
         JSL   L1A0F0A
         STX   L020169
         STA   L020167
         LDX   #$0000
         LDA   #$00E2
         STX   L020161
         STA   L02015F
L1F0315  JSL   L2106B8
         JSL   L0E0206
         JSL   L0801D1
         SEC
         LDA   L020163
         SBC   #$FFEE
         BNE   L1F0332
         LDA   L020165
         SBC   #$FFFF
         BRA   L1F033A
L1F0332  LDA   L020165
         SBC   #$FFFF
         REP   #$02
L1F033A  BVS   L1F033F
         EOR   #$8000
L1F033F  BMI   L1F034D
         LDX   #$FFFF
         LDA   #$FFEF
         STX   L020165
         STA   L020163
L1F034D  SEC
         LDA   L020163
         SBC   #$0578
         BNE   L1F035E
         LDA   L020165
         SBC   #$0000
         BRA   L1F0366
L1F035E  LDA   L020165
         SBC   #$0000
         REP   #$02
L1F0366  BEQ   L1F037B
         BVS   L1F036D
         EOR   #$8000
L1F036D  BPL   L1F037B
         LDX   #$0000
         LDA   #$0578
         STX   L020165
         STA   L020163
L1F037B  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
