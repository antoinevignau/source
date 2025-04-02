*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg15.L
         lst   off

*-----------

         use   Seg15.E
         use   Seg15.X

*-----------

         use   4/Util.Macs

*-----------

L150000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         LDA   $FF
         SEC
         SBC   #$0009
         BEQ   L15001D
         BVS   L150018
         EOR   #$8000
L150018  BPL   L15001D
         BRL   L150156
L15001D  LDA   $FF
         SEC
         SBC   #$0001
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L03241F
         LDX   #^L03241F
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
         LDY   #$000A
         LDA   [$F0],Y
         STA   L0200A8
         LDY   #$000C
         LDA   [$F0],Y
         STA   L0200AA
         LDY   #$000E
         LDA   [$F0],Y
         STA   L0200AC
         LDY   #$0010
         LDA   [$F0],Y
         STA   L0200AE
         LDY   #$0012
         LDA   [$F0],Y
         STA   L0200B0
         LDY   #$0014
         LDA   [$F0],Y
         STA   L0200B2
         LDY   #$0016
         LDA   [$F0],Y
         STA   L0200B4
         LDY   #$0018
         LDA   [$F0],Y
         STA   L0200B6
         LDY   #$0026
         LDA   [$F0],Y
         STA   L0200BA
         LDY   #$001E
         LDA   [$F0],Y
         STA   L0200BC
         LDY   #$0028
         LDA   [$F0],Y
         STA   L0200BE
         LDY   #$0020
         LDA   [$F0],Y
         STA   L0200C0
         LDY   #$002C
         LDA   [$F0],Y
         STA   L0200C2
         LDY   #$0024
         LDA   [$F0],Y
         STA   L0200C4
         LDY   #$002A
         LDA   [$F0],Y
         STA   L0200C6
         LDY   #$0022
         LDA   [$F0],Y
         STA   L0200C8
         LDY   #$002E
         LDA   [$F0],Y
         STA   L0200D2
         LDY   #$0030
         LDA   [$F0],Y
         STA   L0200D4
         LDY   #$0034
         LDA   [$F0],Y
         STA   L0200D6
         LDY   #$0032
         LDA   [$F0],Y
         STA   L0200D8
         LDY   #$0044
         LDA   [$F0],Y
         STA   L0200DA
         LDY   #$0042
         LDA   [$F0],Y
         STA   L0200DC
         LDY   #$0048
         LDA   [$F0],Y
         STA   L0200DE
         LDY   #$0046
         LDA   [$F0],Y
         STA   L0200E0
         LDY   #$003A
         LDA   [$F0],Y
         STA   L0200E2
         LDY   #$003E
         LDA   [$F0],Y
         STA   L0200E4
         LDY   #$003C
         LDA   [$F0],Y
         STA   L0200E6
         LDY   #$0040
         LDA   [$F0],Y
         STA   L0200E8
         LDY   #$0036
         LDA   [$F0],Y
         STA   L0200EA
         LDY   #$0038
         LDA   [$F0],Y
         STA   L0200EC
         LDY   #$0050
         LDA   [$F0],Y
         STA   L0200CA
         LDY   #$004E
         LDA   [$F0],Y
         STA   L0200CC
         LDY   #$004A
         LDA   [$F0],Y
         STA   L0200CE
         LDY   #$004C
         LDA   [$F0],Y
         STA   L0200D0
L150156  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL
