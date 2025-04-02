*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg0B.L
         lst   off

*-----------

         use   Seg0B.E

*-----------

         use   4/Util.Macs

*-----------

L0B0000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E7
         TCS
         LDY   #$0000
         STY   $EA
         LDX   #$0000
         SEP   #$20
L0B0015  CPX   $FF
         BCS   L0B004A
         LDY   $EA
         LDA   [$F7],Y
         BEQ   L0B004A
         BPL   L0B0037
         STA   $E9
         INY
         STY   $EA
L0B0026  LDY   $EA
         LDA   [$F7],Y
         INY
         STY   $EA
         TXY
         STA   [$FB],Y
         INX
         INC   $E9
         BNE   L0B0026
         BRA   L0B0015
L0B0037  INY
         STA   $E9
         LDA   [$F7],Y
         INY
         STY   $EA
         TXY
L0B0040  STA   [$FB],Y
         INY
         DEC   $E9
         BNE   L0B0040
         TYX
         BRA   L0B0015
L0B004A  REP   #$20
         TSC
         CLC
         ADC   #$0009
         TCS
         PLD
         RTL

L0B0054  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   $7D00
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L0B0000
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
