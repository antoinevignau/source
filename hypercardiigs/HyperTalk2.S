*
* HypercardGS
* segment: $0D HyperTalk2
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperTalk2.l
         lst   off

*---------------------------------------

         use   HyperTalk2.E
         use   HyperTalk2.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
	use   4/SANE.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L0D0000  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   $2E
         LDX   $30
         STA   $09
         STX   $0B
         LDY   #$001C
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D0028
         EOR   #$8000
L0D0028  BMI   L0D006B
         LDA   #$001A
         CLC
         ADC   $09
         LDX   $0B
         BCC   L0D0035
         INX
L0D0035  STA   $11
         STX   $13
         PHY
         PHY
         LDY   #$001C
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$2A],Y
         PHA
         LDA   [$2A]
         PHA
         LDY   #$0002
         LDA   [$26],Y
         PHA
         LDA   [$26]
         PHA
         JSL   L0B0C30
         JSL   L09603C
         PLA
         STA   [$11]
         PLA
         LDY   #$0002
         STA   [$11],Y
L0D006B  LDY   #$0020
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D0083
         EOR   #$8000
L0D0083  BMI   L0D0099
         LDY   #$001C
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         LDY   #$001E
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
L0D0099  LDY   #$001A
         LDA   [$09],Y
         INY
         INY
         ORA   [$09],Y
         BNE   L0D00B7
         LDY   #$0002
         LDA   [$2A],Y
         TAX
         LDA   [$2A]
         STA   [$26]
         TXA
         LDY   #$0002
         STA   [$26],Y
         BRL   L0D0267
L0D00B7  LDY   #$001C
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDA   #$0002
         LDX   #$0000
         JSL   L033477
         BVS   L0D00D8
         EOR   #$8000
L0D00D8  BMI   L0D00DD
         BRL   L0D01BF
L0D00DD  LDA   #$0002
         LDX   #$0000
         STA   $0D
         STX   $0F
L0D00E7  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         CMP   [$2A]
         BNE   L0D00F9
         LDY   #$0002
         TXA
         CMP   [$2A],Y
L0D00F9  BNE   L0D0136
         LDA   $1E
         LDX   $20
         STA   $11
         STX   $13
         LDY   #$001C
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         INC
         BNE   L0D0111
         INX
L0D0111  PHX
         PHA
         LDA   $0D
         LDX   $0F
         JSL   L1512A5
         STA   [$11]
         TXA
         LDY   #$0002
         STA   [$11],Y
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   [$2A]
         TXA
         LDY   #$0002
         STA   [$2A],Y
         BRL   L0D0267
L0D0136  PEI   $2C
         PEI   $2A
         JSL   L071B83
         LDY   #$0002
         LDA   [$2A],Y
         PHA
         LDA   [$2A]
         PHA
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         JSL   L033477
         BVS   L0D0158
         EOR   #$8000
L0D0158  BMI   L0D0170
         LDY   #$0002
         LDA   [$2A],Y
         TAX
         LDA   [$2A]
         INC
         BNE   L0D0166
         INX
L0D0166  STA   [$2A]
         TXA
         LDY   #$0002
         STA   [$2A],Y
         BRA   L0D01AA
L0D0170  LDA   $1E
         LDX   $20
         STA   $11
         STX   $13
         LDY   #$001C
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         LDA   $0D
         LDX   $0F
         JSL   L1512A5
         INC
         BNE   L0D018F
         INX
L0D018F  STA   [$11]
         TXA
         LDY   #$0002
         STA   [$11],Y
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   [$2A]
         TXA
         LDY   #$0002
         STA   [$2A],Y
         BRL   L0D0267
L0D01AA  LDA   $0D
         LDX   $0F
         CMP   $05
         BNE   L0D01B4
         CPX   $07
L0D01B4  BEQ   L0D01BF
         INC   $0D
         BNE   L0D01BC
         INC   $0F
L0D01BC  BRL   L0D00E7
L0D01BF  LDY   #$0002
         LDA   [$2A],Y
         TAX
         LDA   [$2A]
         STA   [$26]
         TXA
         LDY   #$0002
         STA   [$26],Y
         LDY   #$0020
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         LDY   #$001C
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         JSL   L1512A5
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0D0267
         STZ   $0D
         STZ   $0F
L0D01FE  PEI   $28
         PEI   $26
         JSL   L071B83
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         CMP   [$26]
         BNE   L0D0218
         LDY   #$0002
         TXA
         CMP   [$26],Y
L0D0218  BNE   L0D021C
         BRA   L0D0267
L0D021C  PEI   $0F
         PEI   $0D
         LDY   #$0020
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         LDY   #$001C
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         JSL   L1512A5
         JSL   L033477
         BEQ   L0D0253
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         INC
         BNE   L0D024B
         INX
L0D024B  STA   [$26]
         TXA
         LDY   #$0002
         STA   [$26],Y
L0D0253  LDA   $0D
         LDX   $0F
         CMP   $01
         BNE   L0D025D
         CPX   $03
L0D025D  BEQ   L0D0267
         INC   $0D
         BNE   L0D0265
         INC   $0F
L0D0265  BRA   L0D01FE
L0D0267  LDA   $18
         STA   $30
         LDA   $17
         STA   $2F
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L0D0279  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $10
         PEI   $0E
         JSL   L032589
L0D0289  LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         CMP   L055277
         BNE   L0D02A4
         LDA   #$0000
         BRA   L0D02A7
L0D02A4  LDA   #$0001
L0D02A7  PHA
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         BEQ   L0D02BE
         LDA   #$0001
L0D02BE  AND   $01,S
         PLX
         LSR
         BCC   L0D02DA
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         INC
         BNE   L0D02D0
         INX
L0D02D0  STA   [$0E]
         TXA
         LDY   #$0002
         STA   [$0E],Y
         BRA   L0D0289
L0D02DA  LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L0D02EC  PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         LDA   $34
         LDX   $36
         STA   $05
         STX   $07
         LDY   #$0014
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D0314
         EOR   #$8000
L0D0314  BMI   L0D0357
         LDA   #$0012
         CLC
         ADC   $05
         LDX   $07
         BCC   L0D0321
         INX
L0D0321  STA   $1B
         STX   $1D
         PHY
         PHY
         LDY   #$0014
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$30],Y
         PHA
         LDA   [$30]
         PHA
         LDY   #$0002
         LDA   [$2C],Y
         PHA
         LDA   [$2C]
         PHA
         JSL   L0B0BC2
         JSL   L09603C
         PLA
         STA   [$1B]
         PLA
         LDY   #$0002
         STA   [$1B],Y
L0D0357  LDY   #$0018
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D036F
         EOR   #$8000
L0D036F  BMI   L0D0385
         LDY   #$0014
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         LDY   #$0016
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
L0D0385  LDY   #$0012
         LDA   [$05],Y
         INY
         INY
         ORA   [$05],Y
         BNE   L0D03A3
         LDY   #$0002
         LDA   [$30],Y
         TAX
         LDA   [$30]
         STA   [$2C]
         TXA
         LDY   #$0002
         STA   [$2C],Y
         BRL   L0D058B
L0D03A3  LDY   #$0014
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$30],Y
         TAX
         LDA   [$30]
         STA   $0F
         STX   $11
L0D03BD  PEI   $19
         PEI   $17
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BEQ   L0D03D4
         BVS   L0D03D2
         EOR   #$8000
L0D03D2  BMI   L0D03D9
L0D03D4  LDA   #$0000
         BRA   L0D03DC
L0D03D9  LDA   #$0001
L0D03DC  PHA
         LDY   #$0002
         LDA   [$30],Y
         PHA
         LDA   [$30]
         PHA
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         JSL   L033477
         BVS   L0D03F7
         EOR   #$8000
L0D03F7  BPL   L0D03FE
         LDA   #$0000
         BRA   L0D0401
L0D03FE  LDA   #$0001
L0D0401  AND   $01,S
         PLX
         LSR
         BCC   L0D041D
         LDX   $19
         LDA   $17
         BNE   L0D040E
         DEX
L0D040E  DEC
         STA   $17
         STX   $19
         PEI   $32
         PEI   $30
         JSL   L0325D1
         BRA   L0D03BD
L0D041D  LDY   #$0002
         LDA   [$30],Y
         PHA
         LDA   [$30]
         PHA
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         JSL   L033477
         BVS   L0D0437
         EOR   #$8000
L0D0437  BMI   L0D043C
         BRL   L0D04CA
L0D043C  LDA   $17
         LDX   $19
         STA   [$28]
         TXA
         LDY   #$0002
         STA   [$28],Y
         LDY   #$0002
         LDA   [$30],Y
         PHA
         LDA   [$30]
         PHA
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         JSL   L033477
         BEQ   L0D0476
         BVS   L0D0464
         EOR   #$8000
L0D0464  BPL   L0D0476
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         STA   [$30]
         TXA
         LDY   #$0002
         STA   [$30],Y
L0D0476  LDY   #$0002
         LDA   [$30],Y
         TAX
         LDA   [$30]
         TAY
         BNE   L0D0482
         DEX
L0D0482  DEC
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         CMP   $0F
         BNE   L0D0495
         CPX   $11
L0D0495  BEQ   L0D049C
         LDA   #$0000
         BRA   L0D049F
L0D049C  LDA   #$0001
L0D049F  BNE   L0D04B2
         LDX   #$0000
         LDA   #$00FF
         AND   [$13]
         CMP   L055277
         BNE   L0D04AF
         INX
L0D04AF  TXA
         BEQ   L0D04C7
L0D04B2  LDY   #$0002
         LDA   [$28],Y
         TAX
         LDA   [$28]
         TAY
         BNE   L0D04BE
         DEX
L0D04BE  DEC
         STA   [$28]
         TXA
         LDY   #$0002
         STA   [$28],Y
L0D04C7  BRL   L0D058B
L0D04CA  LDY   #$0002
         LDA   [$30],Y
         TAX
         LDA   [$30]
         STA   $0B
         STX   $0D
         LDY   #$0018
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         LDY   #$0014
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         JSL   L1512A5
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0D0566
         STZ   $17
         STZ   $19
L0D0505  TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L0D0279
         LDX   #$0000
         LDA   #$00FF
         AND   [$0B]
         CMP   L055277
         BNE   L0D0524
         INX
L0D0524  TXA
         STA   $09
         LDA   $09
         BEQ   L0D0537
         LDA   $0B
         LDX   $0D
         INC
         BNE   L0D0533
         INX
L0D0533  STA   $0B
         STX   $0D
L0D0537  PEI   $0D
         PEI   $0B
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         JSL   L033477
         BEQ   L0D0552
         BVS   L0D054E
         EOR   #$8000
L0D054E  BPL   L0D0552
         BRA   L0D058B
L0D0552  LDA   $17
         LDX   $19
         CMP   $01
         BNE   L0D055C
         CPX   $03
L0D055C  BEQ   L0D0566
         INC   $17
         BNE   L0D0564
         INC   $19
L0D0564  BRA   L0D0505
L0D0566  LDA   $0B
         LDX   $0D
         STA   [$2C]
         TXA
         LDY   #$0002
         STA   [$2C],Y
         LDA   $09
         BEQ   L0D058B
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         TAY
         BNE   L0D0582
         DEX
L0D0582  DEC
         STA   [$2C]
         TXA
         LDY   #$0002
         STA   [$2C],Y
L0D058B  LDA   $22
         STA   $36
         LDA   $21
         STA   $35
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0034
         TCS
         RTL

L0D059D  PHD
         TSC
         CLC
         ADC   #$FEE2
         TCS
         ADC   #$0037
         TCD
         LDA   $F8
         LDX   $FA
         TXY
         LDX   #$FFD1
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D05C5
         INX
L0D05C5  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         PHX
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D05E0
         EOR   #$8000
L0D05E0  BMI   L0D0640
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D05F2
         INX
L0D05F2  PHX
         PHA
         PHY
         PHY
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D0606
         INX
L0D0606  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         PHX
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$F4],Y
         PHA
         LDA   [$F4]
         PHA
         LDY   #$0002
         LDA   [$F0],Y
         PHA
         LDA   [$F0]
         PHA
         JSL   L0B0C90
         JSL   L09603C
         PLA
         PLY
         PLX
         STX   $E3
         PLX
         STX   $E5
         STA   [$E3]
         TYA
         LDY   #$0002
         STA   [$E3],Y
L0D0640  LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L0D0650
         INX
L0D0650  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         PHX
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D066B
         EOR   #$8000
L0D066B  BMI   L0D06AD
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L0D067D
         INX
L0D067D  PHX
         PHA
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D068F
         INX
L0D068F  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $E3
         PLX
         STX   $E5
         STA   [$E3]
         TYA
         LDY   #$0002
         STA   [$E3],Y
L0D06AD  LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D06BD
         INX
L0D06BD  STA   $E3
         STX   $E5
         LDA   [$E3]
         LDY   #$0002
         ORA   [$E3],Y
         BNE   L0D06DD
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STA   [$F0]
         TXA
         LDY   #$0002
         STA   [$F0],Y
         BRL   L0D08FF
L0D06DD  PEI   $F6
         PEI   $F4
         JSL   L032589
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D06F5
         INX
L0D06F5  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         TXY
         LDX   #$FFCD
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFCD
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0002
         LDX   #$0000
         JSL   L033477
         BVS   L0D0722
         EOR   #$8000
L0D0722  BPL   L0D077E
         LDA   #$0002
         LDX   #$0000
         STA   $DF
         STX   $E1
L0D072E  PEI   $F6
         PEI   $F4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         JSL   L0B0361
         PEI   $F6
         PEI   $F4
         JSL   L032589
         LDY   #$0002
         LDA   [$F4],Y
         PHA
         LDA   [$F4]
         PHA
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         JSL   L033477
         BVS   L0D0761
         EOR   #$8000
L0D0761  BPL   L0D0765
         BRA   L0D077E
L0D0765  LDX   #$FFCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $DF
         BNE   L0D0774
         CPX   $E1
L0D0774  BEQ   L0D077E
         INC   $DF
         BNE   L0D077C
         INC   $E1
L0D077C  BRA   L0D072E
L0D077E  LDY   #$0002
         LDA   [$F4],Y
         PHA
         LDA   [$F4]
         PHA
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         JSL   L033477
         BEQ   L0D07AC
         BVS   L0D079A
         EOR   #$8000
L0D079A  BPL   L0D07AC
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STA   [$F4]
         TXA
         LDY   #$0002
         STA   [$F4],Y
L0D07AC  LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         STA   $D7
         STX   $D9
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L0D07C8
         INX
L0D07C8  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         PHX
         PHA
         LDX   #$FFD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0D07E6
         INX
L0D07E6  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         JSL   L1512A5
         TXY
         LDX   #$FFC9
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFC9
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0D086B
         STZ   $DF
         STZ   $E1
L0D0816  TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         JSL   L0B0361
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L032589
         PEI   $D9
         PEI   $D7
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         JSL   L033477
         BVS   L0D084E
         EOR   #$8000
L0D084E  BPL   L0D0852
         BRA   L0D086B
L0D0852  LDX   #$FFC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $DF
         BNE   L0D0861
         CPX   $E1
L0D0861  BEQ   L0D086B
         INC   $DF
         BNE   L0D0869
         INC   $E1
L0D0869  BRA   L0D0816
L0D086B  PEI   $D9
         PEI   $D7
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         JSL   L033477
         BVS   L0D0880
         EOR   #$8000
L0D0880  BMI   L0D088E
         LDA   $D7
         LDX   $D9
         STA   [$F0]
         TXA
         LDY   #$0002
         STA   [$F0],Y
L0D088E  LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         TAY
         BNE   L0D089A
         DEX
L0D089A  DEC
         STA   $DB
         STX   $DD
L0D089F  PEI   $DD
         PEI   $DB
         LDY   #$0002
         LDA   [$F4],Y
         TAX
         LDA   [$F4]
         JSL   L033477
         BEQ   L0D08B8
         BVS   L0D08B6
         EOR   #$8000
L0D08B6  BMI   L0D08BD
L0D08B8  LDA   #$0000
         BRA   L0D08C0
L0D08BD  LDA   #$0001
L0D08C0  BEQ   L0D08EF
         LDA   #$00FF
         AND   [$DB]
         AND   #$00FF
         SEC
         SBC   #$0020
         BEQ   L0D08DC
         BVS   L0D08D5
         EOR   #$8000
L0D08D5  BPL   L0D08DC
         LDA   #$0000
         BRA   L0D08DF
L0D08DC  LDA   #$0001
L0D08DF  BEQ   L0D08EF
         LDX   $DD
         LDA   $DB
         BNE   L0D08E8
         DEX
L0D08E8  DEC
         STA   $DB
         STX   $DD
         BRA   L0D089F
L0D08EF  LDA   $DB
         LDX   $DD
         INC
         BNE   L0D08F7
         INX
L0D08F7  STA   [$F0]
         TXA
         LDY   #$0002
         STA   [$F0],Y
L0D08FF  LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$0130
         TCS
         RTL

L0D0911  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   $22
         LDX   $24
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D0939
         EOR   #$8000
L0D0939  BMI   L0D097C
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L0D0946
         INX
L0D0946  STA   $0D
         STX   $0F
         PHY
         PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         LDA   [$1A]
         PHA
         JSL   L0B0B98
         JSL   L09603C
         PLA
         STA   [$0D]
         PLA
         LDY   #$0002
         STA   [$0D],Y
L0D097C  LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D0994
         EOR   #$8000
L0D0994  BMI   L0D09AA
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
L0D09AA  LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0D09C8
         LDY   #$0002
         LDA   [$1E],Y
         TAX
         LDA   [$1E]
         STA   [$1A]
         TXA
         LDY   #$0002
         STA   [$1A],Y
         BRL   L0D0A76
L0D09C8  LDA   $1E
         LDX   $20
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         TAY
         BNE   L0D09EB
         DEX
L0D09EB  DEC
         STA   [$0D]
         TXA
         LDY   #$0002
         STA   [$0D],Y
         LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         JSL   L033477
         BEQ   L0D0A22
         BVS   L0D0A10
         EOR   #$8000
L0D0A10  BPL   L0D0A22
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   [$1E]
         TXA
         LDY   #$0002
         STA   [$1E],Y
L0D0A22  LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         PHX
         PHA
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L1512A5
         INC
         BNE   L0D0A4D
         INX
L0D0A4D  STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         JSL   L033477
         BEQ   L0D0A6A
         BVS   L0D0A68
         EOR   #$8000
L0D0A68  BMI   L0D0A76
L0D0A6A  LDA   $09
         LDX   $0B
         STA   [$1A]
         TXA
         LDY   #$0002
         STA   [$1A],Y
L0D0A76  LDA   $14
         STA   $24
         LDA   $13
         STA   $23
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L0D0A88  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0000
         TAX
         STA   [$12]
         TXA
         LDY   #$0002
         STA   [$12],Y
         LDA   #$0000
         TAX
         STA   [$0E]
         TXA
         LDY   #$0002
         STA   [$0E],Y
         JSL   L031B09
         LDA   $22
         LDX   $24
         STA   $05
         STX   $07
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   [$1E]
         TXA
         LDY   #$0002
         STA   [$1E],Y
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   [$16]
         TXA
         LDY   #$0002
         STA   [$16],Y
         PEI   $18
         PEI   $16
         JSL   L071BC3
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   [$1A]
         TXA
         LDY   #$0002
         STA   [$1A],Y
         LDA   $26
         LDX   $28
         STA   $01
         STX   $03
         LDA   [$01]
         BEQ   L0D0B0D
         BRL   L0D0BCE
L0D0B0D  LDY   #$001C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$FFFF
         BNE   L0D0B1F
         CPX   #$FFFF
L0D0B1F  BEQ   L0D0B49
         PEI   $28
         PEI   $26
         PEI   $20
         PEI   $1E
         PEI   $1C
         PEI   $1A
         PEI   $18
         PEI   $16
         PEI   $14
         PEI   $12
         PEA   $0000
         PHD
         JSL   L0D0000
         LDA   [$12]
         LDY   #$0002
         ORA   [$12],Y
         BEQ   L0D0B49
         BRL   L0D0BCE
L0D0B49  LDY   #$0014
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$FFFF
         BNE   L0D0B5B
         CPX   #$FFFF
L0D0B5B  BEQ   L0D0B7E
         PEI   $28
         PEI   $26
         PEI   $20
         PEI   $1E
         PEI   $1C
         PEI   $1A
         PEI   $10
         PEI   $0E
         PEA   $0000
         PHD
         JSL   L0D02EC
         LDA   [$0E]
         LDY   #$0002
         ORA   [$0E],Y
         BNE   L0D0BCE
L0D0B7E  LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$FFFF
         BNE   L0D0B90
         CPX   #$FFFF
L0D0B90  BEQ   L0D0BA6
         PEI   $28
         PEI   $26
         PEI   $20
         PEI   $1E
         PEI   $1C
         PEI   $1A
         PEA   $0000
         PHD
         JSL   L0D059D
L0D0BA6  LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$FFFF
         BNE   L0D0BB8
         CPX   #$FFFF
L0D0BB8  BEQ   L0D0BCE
         PEI   $28
         PEI   $26
         PEI   $20
         PEI   $1E
         PEI   $1C
         PEI   $1A
         PEA   $0000
         PHD
         JSL   L0D0911
L0D0BCE  LDA   $0C
         STA   $28
         LDA   $0B
         STA   $27
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L0D0BE0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $10
         STZ   $05
L0D0BEC  LDA   $05
         INC
         STA   $05
         LDA   $05
         SEC
         SBC   L055387
         BEQ   L0D0C03
         BVS   L0D0BFE
         EOR   #$8000
L0D0BFE  BPL   L0D0C03
         BRL   L0D0CD1
L0D0C03  LDA   $05
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0D0C19
         INX
L0D0C19  STA   $01
         STX   $03
         LDAL  L051054
         CMP   [$01]
         BNE   L0D0BEC
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMPL  L051056
         BNE   L0D0C3A
         TXA
         CMPL  L051058
L0D0C3A  BNE   L0D0BEC
         LDA   [$01]
         DEC
         BPL   L0D0C44
         BRL   L0D0CCD
L0D0C44  CMP   #$0003
         BMI   L0D0C4C
         BRL   L0D0CCD
L0D0C4C  SEC
         SBC   #$0000
         BEQ   L0D0C5A
         DEC
         BEQ   L0D0C95
         DEC
         BEQ   L0D0CB1
         BRA   L0D0CCD
L0D0C5A  LDY   #$0012
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMPL  L051064
         BNE   L0D0C6F
         TXA
         CMPL  L051066
L0D0C6F  BNE   L0D0C76
         LDA   #$0000
         BRA   L0D0C79
L0D0C76  LDA   #$0001
L0D0C79  BEQ   L0D0C7E
         BRL   L0D0BEC
L0D0C7E  LDX   #$0000
         LDY   #$000E
         LDAL  L051062
         CMP   [$01],Y
         BEQ   L0D0C8D
         INX
L0D0C8D  TXA
         BEQ   L0D0C93
         BRL   L0D0BEC
L0D0C93  BRA   L0D0CCD
L0D0C95  LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMPL  L05105E
         BNE   L0D0CAA
         TXA
         CMPL  L051060
L0D0CAA  BEQ   L0D0CAF
         BRL   L0D0BEC
L0D0CAF  BRA   L0D0CCD
L0D0CB1  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMPL  L05105A
         BNE   L0D0CC6
         TXA
         CMPL  L05105C
L0D0CC6  BEQ   L0D0CCB
         BRL   L0D0BEC
L0D0CCB  BRA   L0D0CCD
L0D0CCD  LDA   $05
         STA   $10
L0D0CD1  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D0CD8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $10
         PEI   $0E
         JSL   L07899F
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         JSL   L0718BF
         PHY
         PEA   $0001
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L150B64
         PLA
         STA   $12
         LDAL  L05565D
         BEQ   L0D0D1A
         STZ   $12
L0D0D1A  PEI   $03
         PEI   $01
         JSL   L07185A
         LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L0D0D34  PHD
         TSC
         CLC
         ADC   #$FE98
         TCS
         ADC   #$0075
         TCD
         LDY   #$0046
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $8B
         STX   $8D
         LDY   #$0004
         LDA   [$8B],Y
         TAX
         DEY
         DEY
         LDA   [$8B],Y
         CMP   L055027
         BNE   L0D0D5F
         CPX   L055029
L0D0D5F  BNE   L0D0D83
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $001C
         JSL   L0B127A
         PEA   $0020
         JSL   L0313BE
         BRA   L0D0DC3
L0D0D83  LDY   #$0004
         LDA   [$8B],Y
         TAX
         DEY
         DEY
         LDA   [$8B],Y
         CMP   L05501F
         BNE   L0D0D95
         CPX   L055021
L0D0D95  BNE   L0D0DB9
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $001D
         JSL   L0B127A
         PEA   $0020
         JSL   L0313BE
         BRA   L0D0DC3
L0D0DB9  LDAL  L04075A
         SEP   #$20
         STA   $CF
         REP   #$20
L0D0DC3  LDA   [$8B]
         DEC
         DEC
         BNE   L0D0DEB
         TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $001B
         JSL   L0B127A
         PEA   $0020
         JSL   L0313BE
         BRA   L0D0E10
L0D0DEB  LDA   [$8B]
         DEC
         BNE   L0D0E10
         TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $001A
         JSL   L0B127A
         PEA   $0020
         JSL   L0313BE
L0D0E10  LDY   #$000E
         LDA   [$8B],Y
         DEC
         DEC
         BEQ   L0D0E1C
         BRL   L0D0EC4
L0D0E1C  LDY   #$0012
         LDA   [$8B],Y
         PHA
         DEY
         DEY
         LDA   [$8B],Y
         PHA
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D0E34
         EOR   #$8000
L0D0E34  BMI   L0D0E92
         LDA   [$8B]
         DEC
         DEC
         BNE   L0D0E5E
         TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $0077
         JSL   L0B127A
         PEA   $0020
         JSL   L0313BE
         BRA   L0D0E7E
L0D0E5E  TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $0076
         JSL   L0B127A
         PEA   $0020
         JSL   L0313BE
L0D0E7E  LDA   #$0075
         LDY   #$0035
         STA   [$F8],Y
         LDAL  L04075B
         SEP   #$20
         STA   $AF
         REP   #$20
         BRA   L0D0EC2
L0D0E92  LDA   #$0014
         LDY   #$0035
         STA   [$F8],Y
         TDC
         CLC
         ADC   #$00AF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0077
         PHA
         LDY   #$0012
         LDA   [$8B],Y
         PHA
         DEY
         DEY
         LDA   [$8B],Y
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
L0D0EC2  BRA   L0D0F2D
L0D0EC4  LDY   #$000E
         LDA   [$8B],Y
         DEC
         BNE   L0D0EF3
         LDA   #$004F
         LDY   #$0035
         STA   [$F8],Y
         TDC
         CLC
         ADC   #$00AF
         PEA   $0000
         PHA
         LDA   #$0010
         CLC
         ADC   $8B
         LDX   $8D
         BCC   L0D0EE8
         INX
L0D0EE8  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
         BRA   L0D0F2D
L0D0EF3  LDY   #$000E
         LDA   #$0003
         CMP   [$8B],Y
         BNE   L0D0F2D
         LDA   #$0019
         LDY   #$0035
         STA   [$F8],Y
         TDC
         CLC
         ADC   #$00AF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0077
         PHA
         LDY   #$0010
         LDA   [$8B],Y
         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
L0D0F2D  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00AF
         PEA   $0000
         PHA
         PEA   ^L04075C
         PEA   L04075C
         JSL   L0B24DB
         LDY   #$0035
         LDA   [$F8],Y
         PHA
         JSL   L0B0B7A
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$016E
         TCS
         RTL

L0D0F6E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC4
         TCS
         TCD
         LDA   $44
         LDX   $46
         STA   $01
         STX   $03
         STZ   $37
         LDY   #$000E
         LDA   [$01],Y
         DEC
         BPL   L0D0F8B
         BRL   L0D1070
L0D0F8B  CMP   #$0003
         BMI   L0D0F93
         BRL   L0D1070
L0D0F93  SEC
         SBC   #$0000
         BNE   L0D0F9C
         BRL   L0D104B
L0D0F9C  DEC
         BEQ   L0D0FE1
         DEC
         BEQ   L0D0FA5
         BRL   L0D1070
L0D0FA5  PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0010
         LDA   [$01],Y
         PHA
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         BEQ   L0D0FDE
         LDX   #$0000
         LDA   #$000F
         AND   $0B
         CMP   [$01]
         BNE   L0D0FD4
         INX
L0D0FD4  TXA
         BEQ   L0D0FDE
         LDY   #$0010
         LDA   [$01],Y
         STA   $37
L0D0FDE  BRL   L0D1077
L0D0FE1  LDY   #$0012
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $31
         STX   $33
         PEI   $33
         PEI   $31
         LDA   #$FFFF
         TAX
         JSL   L033477
         BVS   L0D1000
         EOR   #$8000
L0D1000  BMI   L0D1031
         PHY
         PHY
         PEI   $33
         PEI   $31
         PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0D1025
         DEX
L0D1025  PHX
         PHA
         JSL   L09603C
         PLA
         STA   $31
         PLX
         STX   $33
L0D1031  PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         PEI   $31
         LDA   [$01]
         PHA
         JSL   L07AC17
         PLA
         STA   $37
         BRA   L0D1077
L0D104B  PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L0D1065
         INX
L0D1065  PHX
         PHA
         JSL   L07BF8F
         PLA
         STA   $37
         BRA   L0D1077
L0D1070  PEA   $178E
         JSL   L07272E
L0D1077  LDA   $37
         STA   $48
         LDA   $42
         BEQ   L0D1081
         BRA   L0D108D
L0D1081  LDA   $37
         BNE   L0D108D
         PEA   $0000
         PHD
         JSL   L0D0D34
L0D108D  LDA   $40
         STA   $46
         LDA   $3F
         STA   $45
         LDA   $3D
         TCD
         TSC
         CLC
         ADC   #$0044
         TCS
         RTL

L0D109F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         STZ   L055363
         LDA   #$0001
         STA   $6A
         LDA   L055039
         LDX   L05503B
         CMP   $66
         BNE   L0D10BB
         CPX   $68
L0D10BB  BNE   L0D10BF
         BRA   L0D1109
L0D10BF  PEA   ^L05098E
         PEA   L05098E
         JSL   L0940E5
         LDA   #$0002
         STA   $01
         LDA   #$0001
         LDX   #$0000
         STA   $07
         STX   $09
         LDA   #$0006
         STA   $2D
         LDA   $66
         LDX   $68
         STA   $59
         STX   $5B
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCC   L0D10FF
         LDA   #$0001
         STA   L055363
         BRA   L0D1109
L0D10FF  STZ   $6A
         JSL   L072314
         JSL   L073A49
L0D1109  LDA   $64
         STA   $68
         LDA   $63
         STA   $67
         LDA   $61
         TCD
         TSC
         CLC
         ADC   #$0066
         TCS
         RTL

L0D111B  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0C
         LDA   $0A
         CMPL  L051BDE
         BNE   L0D1144
         LDA   #$0001
         STA   $0C
         LDAL  L051BE0
         JSL   L150488
         PHX
         PHA
         JSL   L0E0DE2
         JSL   L0B0000
L0D1144  LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L0D1154  ENT
         PHD
         TSC
         CLC
         ADC   #$FDF8
         TCS
         ADC   #$0111
         TCD
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCC   L0D1172
         PHY
         JSL   L0E05E8
         PLA
         STA   $F1
         BRA   L0D11C4
L0D1172  PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0E06AC
         STZ   $EF
L0D1181  LDA   $EF
         INC
         STA   $EF
         PHY
         PEA   $0000
         PEI   $EF
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         JSL   L150428
         PLA
         STA   $F1
         LDX   #$0000
         LDA   #$FFFF
         CMP   $F1
         BNE   L0D11A7
         INX
L0D11A7  TXA
         BNE   L0D11C4
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         JSL   L071C56
         PLA
         BEQ   L0D1181
L0D11C4  LDA   $F1
         STA   $FC
         TSC
         CLC
         ADC   #$0208
         TCS
         PLD
         RTL

L0D11D0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $000C
         JSL   L0D111B
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D11E7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0C
         STZ   $01
L0D11F3  PHY
         PEA   $0000
         JSL   L0B5681
         PLA
         LSR
         BCC   L0D1239
         PHY
         JSL   L03198D
         PLA
         LSR
         BCS   L0D120A
         BRA   L0D124A
L0D120A  LDA   $01
         INC
         STA   $01
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0D121C
         INX
L0D121C  TXA
         BEQ   L0D1235
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0D122C
         INX
L0D122C  TXA
         BEQ   L0D1235
         JSL   L0B0000
         BRA   L0D1237
L0D1235  BRA   L0D1239
L0D1237  BRA   L0D11F3
L0D1239  LDA   $01
         BNE   L0D123F
         BRA   L0D124A
L0D123F  LDA   #$0001
         STA   $0C
         PEI   $01
         JSL   L0E0E11
L0D124A  PLY
         PLY
         PLY
         PLD
         RTL

L0D124F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0553B3
         STA   $01
         LDA   #$0003
         STA   L0553B3
         LDA   #$000C
         CMPL  L051BDE
         BNE   L0D1276
         LDAL  L051BE0
         STA   L0553B3
         JSL   L0B0000
L0D1276  PHY
         PEA   $0001
         JSL   L0B5B81
         PLA
         STA   $0C
         LDA   $01
         STA   L0553B3
         PLY
         PLY
         PLY
         PLD
         RTL

L0D128B  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF0
         TCS
         ADC   #$0019
         TCD
         LDA   #$0001
         STA   $FC
         STZ   $EB
         STZ   $ED
         PHY
         JSL   L0314F6
         PLA
         STA   $F1
         LDA   $F1
         SEC
         SBC   #$0004
         BEQ   L0D12BA
         BVS   L0D12B4
         EOR   #$8000
L0D12B4  BPL   L0D12BA
         JSL   L0E0000
L0D12BA  LDA   $F1
         SEC
         SBC   #$0001
         BPL   L0D12C5
         BRL   L0D13F4
L0D12C5  CMP   #$0009
         BMI   L0D12CD
         BRL   L0D13F4
L0D12CD  ASL
         TAX
         LDAL  L0D12D5,X
         PHA
         RTS

L0D12D5  DA    L0D12E5+1
         DA    L0D131E+2
         DA    L0D1332+2
         DA    L0D1397+1
         DA    L0D13B6+1
         DA    L0D13C2+1
         DA    L0D13CE+1
         DA    L0D13DA+1
L0D12E5  DA    L0D13E6+1
         PHY
         PHY
         PHY
         PHY
         PHY
         JSL   L0E05E8
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0D12FA
         DEX
L0D12FA  PHX
         PHA
         PHY
         JSL   L1606BE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0D130B
         DEX
L0D130B  PHX
         PHA
         JSL   L09603C
         PLA
         PLX
         PHA
         JSL   L1606CC
         PLA
         STA   $EB
         PLX
         STX   $ED
L0D131E  BRL   L0D13F4
         PHY
         PHY
         PHY
         JSL   L0E05E8
         JSL   L1606CC
         PLA
         STA   $EB
         PLX
         STX   $ED
L0D1332  BRL   L0D13F4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L0E06AC
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L0A132A
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BNE   L0D1397
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L1606DA
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BEQ   L0D1397
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         CLC
         ADC   #$0004
         BCC   L0D1387
         INX
L0D1387  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $EB
         STX   $ED
L0D1397  BRA   L0D13F4
         PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $EB
         PLX
         STX   $ED
         PHY
         PEI   $ED
         PEI   $EB
         JSL   L1606E8
         PLA
         LSR
         BCS   L0D13B6
         STZ   $EB
         STZ   $ED
L0D13B6  BRA   L0D13F4
         LDA   L0550ED
         LDX   L0550EF
         STA   $EB
         STX   $ED
L0D13C2  BRA   L0D13F4
         LDA   L0550DD
         LDX   L0550DF
         STA   $EB
         STX   $ED
L0D13CE  BRA   L0D13F4
         LDA   L0550E9
         LDX   L0550EB
         STA   $EB
         STX   $ED
L0D13DA  BRA   L0D13F4
         LDA   L0550E5
         LDX   L0550E7
         STA   $EB
         STX   $ED
L0D13E6  BRA   L0D13F4
         LDA   L0550E1
         LDX   L0550E3
         STA   $EB
         STX   $ED
         BRA   L0D13F4
L0D13F4  PEI   $ED
         PEI   $EB
         JSL   L0E0E79
         TSC
         CLC
         ADC   #$0110
         TCS
         PLD
         RTL

L0D1404  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD0
         TCS
         TCD
         LDA   #$0001
         STA   $36
         PHY
         JSL   L0314F6
         PLA
         DEC
         BMI   L0D148D
         CMP   #$0006
         BPL   L0D148D
         SEC
         SBC   #$0000
         BEQ   L0D1434
         DEC
         BEQ   L0D1447
         DEC
         BEQ   L0D145A
         DEC
         BEQ   L0D1467
         DEC
         DEC
         BEQ   L0D147E
         BRA   L0D148D
L0D1434  LDA   #$0001
         STA   $01
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $03
         PLX
         STX   $05
         BRA   L0D148D
L0D1447  LDA   #$0002
         STA   $01
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $07
         PLX
         STX   $09
         BRA   L0D148D
L0D145A  LDA   #$0003
         STA   $01
         STZ   $0B
         JSL   L0E0000
         BRA   L0D148D
L0D1467  LDA   #$0004
         STA   $01
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $001F
         JSL   L0E06F4
         BRA   L0D148D
L0D147E  LDA   #$0003
         STA   $01
         PHY
         JSL   L0E05E8
         PLA
         STA   $0B
         BRA   L0D148D
L0D148D  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $002C
         PEA   $0001
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$0030
         TCS
         PLD
         RTL

L0D14AB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEA   $000A
         JSL   L031415
         PLA
         STA   $01
         PLX
         STX   $03
         LDX   #$0000
         LDA   [$01]
         DEC
         BNE   L0D14CB
         INX
L0D14CB  TXA
         STA   $0E
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D14D4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         LDA   #$0001
         STA   $66
         LDA   #$0006
         STA   $2D
         LDA   L055039
         LDX   L05503B
         STA   $59
         STX   $5B
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0007
         BNE   L0D150C
         LDA   #$0005
         STA   $01
         LDA   #$0001
         STA   $0B
         JSL   L0E0000
         BRL   L0D15C5
L0D150C  PHY
         JSL   L0314F6
         PLA
         CMP   #$0009
         BNE   L0D1528
         LDA   #$0005
         STA   $01
         LDA   #$0002
         STA   $0B
         JSL   L0E0000
         BRL   L0D15C5
L0D1528  PHY
         JSL   L0314F6
         PLA
         CMP   #$0008
         BNE   L0D1549
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $002C
         PEA   $0001
         JSL   L0E0656
L0D1549  PHY
         JSL   L0314F6
         PLA
         DEC
         BMI   L0D15C5
         CMP   #$0006
         BPL   L0D15C5
         SEC
         SBC   #$0000
         BEQ   L0D156C
         DEC
         BEQ   L0D157F
         DEC
         BEQ   L0D1592
         DEC
         BEQ   L0D159F
         DEC
         DEC
         BEQ   L0D15B6
         BRA   L0D15C5
L0D156C  LDA   #$0001
         STA   $01
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $03
         PLX
         STX   $05
         BRA   L0D15C5
L0D157F  LDA   #$0002
         STA   $01
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $07
         PLX
         STX   $09
         BRA   L0D15C5
L0D1592  LDA   #$0003
         STA   $01
         STZ   $0B
         JSL   L0E0000
         BRA   L0D15C5
L0D159F  LDA   #$0004
         STA   $01
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $001F
         JSL   L0E06F4
         BRA   L0D15C5
L0D15B6  LDA   #$0003
         STA   $01
         PHY
         JSL   L0E05E8
         PLA
         STA   $0B
         BRA   L0D15C5
L0D15C5  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$0060
         TCS
         PLD
         RTL

L0D15E3  ENT
         PHD
         TSC
         CLC
         ADC   #$FF36
         TCS
         TCD
         LDA   #$0001
         STA   $D0
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L0940E5
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E0656
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L0D163E
         STZ   $D0
         LDA   L055259
         BEQ   L0D1635
         PEA   $0001
         JSL   L0B0B7A
         BRA   L0D163C
L0D1635  PEA   $0002
         JSL   L0B0B7A
L0D163C  BRA   L0D1672
L0D163E  TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         JSL   L0B0D87
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000C
         PEA   $0003
         JSL   L0E07C5
         PHY
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $B9
L0D1672  TSC
         CLC
         ADC   #$00CA
         TCS
         PLD
         RTL

L0D167A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         STZ   $1E
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCS   L0D168F
         BRA   L0D16D3
L0D168F  PHY
         PHY
         PEA   $0012
         JSL   L031415
         PLA
         PLX
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0D16B9
         LDA   #$0001
         STA   $1E
         BRA   L0D16D3
L0D16B9  PEA   $007A
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PHY
         PHY
         JSL   L0E05AF
         JSL   L07346C
         JSL   L0B0841
L0D16D3  TSC
         CLC
         ADC   #$0018
         TCS
         PLD
         RTL

L0D16DB  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $10
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0D16F2
         INX
L0D16F2  STA   $03
         STX   $05
         LDA   [$03]
         STA   $01
         PHY
         PEA   $0000
         JSL   L0B7A56
         PLA
         LSR
         BCC   L0D1720
         PHY
         JSL   L031630
         PLA
         LSR
         BCC   L0D1716
         LDA   #$0001
         STA   $10
         BRA   L0D1720
L0D1716  JSL   L0E0000
         PEI   $01
         JSL   L0B2BBB
L0D1720  LDA   $0A
         STA   $0E
         LDA   $09
         STA   $0D
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0D1732  ENT
         PHD
         TSC
         CLC
         ADC   #$FEC8
         TCS
         ADC   #$0041
         TCD
         STZ   $FC
         LDX   #$0000
         LDA   #$000D
         CMPL  L051BDE
         BEQ   L0D174C
         INX
L0D174C  TXA
         BEQ   L0D1762
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BDE
         BEQ   L0D175C
         INX
L0D175C  TXA
         BEQ   L0D1762
         BRL   L0D19AF
L0D1762  STZ   $E5
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   ^L0510BC
         PEA   L0510BC
         PEA   $0022
         JSL   L0313BE
L0D177A  LDA   #$000D
         CMPL  L051BDE
         BEQ   L0D1786
         BRL   L0D18D7
L0D1786  LDX   #$0000
         LDAL  L051BE0
         BNE   L0D1790
         INX
L0D1790  TXA
         STA   $E1
         TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         LDAL  L051BE0
         JSL   L150488
         JSL   L150F53
         STA   $EF
         STX   $F1
         JSL   L0B0000
         PHY
         PEA   $0000
         PHD
         JSL   L0D16DB
         PLA
         LSR
         BCS   L0D17D4
         PEA   $0003
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         JSL   L0B369F
         JSL   L0B0841
         BRL   L0D19AF
L0D17D4  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         LDX   $E9
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDA   $EF
         LDX   $F1
         CLC
         ADC   #$0004
         BCC   L0D17F7
         INX
L0D17F7  STA   $EF
         STX   $F1
         LDA   $E7
         LDX   $E9
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BNE   L0D1814
         INX
L0D1814  TXA
         BEQ   L0D1892
         LDX   #$0000
         LDA   #$000D
         CMPL  L051BE0
         BNE   L0D1824
         INX
L0D1824  TXA
         BEQ   L0D1892
         JSL   L0B0000
         PHY
         PEA   $0000
         PHD
         JSL   L0D16DB
         PLA
         LSR
         BCS   L0D184F
         PEA   $0003
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         JSL   L0B369F
         JSL   L0B0841
         BRL   L0D19AF
L0D184F  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $EB
         PLX
         STX   $ED
         PEI   $ED
         PEI   $EB
         LDA   $E7
         LDX   $E9
         JSL   L033477
         BVS   L0D186C
         EOR   #$8000
L0D186C  BMI   L0D1886
         LDA   $E7
         LDX   $E9
         STA   $EB
         STX   $ED
         LDA   $E1
         BEQ   L0D1886
         LDX   $E9
         LDA   $E7
         BNE   L0D1881
         DEX
L0D1881  DEC
         STA   $EB
         STX   $ED
L0D1886  LDA   $EB
         LDX   $ED
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
L0D1892  LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BNE   L0D189F
         INX
L0D189F  TXA
         BEQ   L0D18C0
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BE0
         BNE   L0D18AF
         INX
L0D18AF  TXA
         BEQ   L0D18C0
         LDA   #$0001
         STA   $E5
         JSL   L0B0000
         BRL   L0D177A
         BRA   L0D18D7
L0D18C0  PEA   $0005
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         JSL   L0B369F
         JSL   L0B0841
         BRL   L0D19AF
L0D18D7  LDA   #$000A
         CMPL  L051BDE
         BEQ   L0D18E3
         BRL   L0D1992
L0D18E3  LDAL  L051BE0
         JSL   L150488
         STA   $E7
         STX   $E9
         JSL   L0B0000
         LDA   #$000D
         CMPL  L051BDE
         BEQ   L0D190A
         JSL   L0B28E4
         LDA   $E5
         BEQ   L0D1907
         BRL   L0D1992
L0D1907  BRL   L0D19AF
L0D190A  TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         LDAL  L051BE0
         JSL   L150488
         JSL   L150F53
         STA   $EF
         STX   $F1
         JSL   L0B0000
         LDA   $E7
         LDX   $E9
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDA   $EF
         LDX   $F1
         CLC
         ADC   #$0004
         BCC   L0D193E
         INX
L0D193E  STA   $EF
         STX   $F1
         LDA   $E7
         LDX   $E9
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BNE   L0D195B
         INX
L0D195B  TXA
         BEQ   L0D197C
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BE0
         BNE   L0D196B
         INX
L0D196B  TXA
         BEQ   L0D197C
         LDA   #$0001
         STA   $E5
         JSL   L0B0000
         BRL   L0D177A
         BRA   L0D1992
L0D197C  PEA   $0005
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         JSL   L0B369F
         JSL   L0B0841
         BRA   L0D19AF
L0D1992  LDA   #$0001
         STA   $FC
         STZ   $BF
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0022
         PEA   $0004
         JSL   L0E07C5
L0D19AF  TSC
         CLC
         ADC   #$0138
         TCS
         PLD
         RTL

L0D19B7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         LDA   #$0001
         STA   $20
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0007
         BEQ   L0D19D4
         LDA   #$0000
         BRA   L0D19D7
L0D19D4  LDA   #$0001
L0D19D7  STA   $01
         LDA   $01
         BNE   L0D19DF
         BRA   L0D1A2F
L0D19DF  PHY
         PEA   $0034
         JSL   L151681
         PLA
         DEC
         BMI   L0D1A2F
         CMP   #$0002
         BPL   L0D1A2F
         SEC
         SBC   #$0000
         BEQ   L0D1A15
         DEC
         BEQ   L0D19FB
         BRA   L0D1A2F
L0D19FB  PHY
         JSL   L0E05E8
         PLA
         STA   $0F
         PHY
         JSL   L0E05E8
         PLA
         STA   $0D
         PHY
         JSL   L0E05E8
         PLA
         STA   $0B
         BRA   L0D1A4F
L0D1A15  PHY
         JSL   L0E05E8
         PLA
         STA   $0B
         PHY
         JSL   L0E05E8
         PLA
         STA   $0D
         PHY
         JSL   L0E05E8
         PLA
         STA   $0F
         BRA   L0D1A4F
L0D1A2F  PHY
         JSL   L0E05E8
         PLA
         STA   $0B
         PHY
         JSL   L0E05E8
         PLA
         STA   $0F
         PHY
         JSL   L0E05E8
         PLA
         STA   $0D
         LDA   $01
         BNE   L0D1A4F
         JSL   L0E0000
L0D1A4F  LDA   $0B	; It is for the ProDOS technote about dates
         SEC
         SBC   #100	; AV 202208
         BEQ   L0D1A66
         BVS   L0D1A5C
         EOR   #$8000
L0D1A5C  BPL   L0D1A66
         LDA   $0B
         SEC
         SBC   #1900	; AV 202208
         STA   $0B
L0D1A66  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         JSL   L071EC5
         sep   #$20	; AV 202208
         LDA   $0B
*         SEP   #$20
         STA   $06
*         REP   #$20
         LDA   $0D
*         SEP   #$20
         STA   $08
*         REP   #$20
         LDA   $0F
*         SEP   #$20
         STA   $07
         REP   #$20
         PHY
         PHY
         PEA   $000A	; from seconds to HyperCard IIgs format
         PHY
         PHY
         PEA   $000B
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   #$00FF
         AND   $0A
         STA   $11
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $0005
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L0D1AF4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0001
         STA   $14
         LDA   #$0001
         STA   $01
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $0A
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $03
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $04
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $05
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $07
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $08
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         SEP   #$20
         STA   $06
         REP   #$20
         LDA   #$00FF
         AND   $06
         SEC
         SBC   #$0064
         BEQ   L0D1B7B
         BVS   L0D1B6A
         EOR   #$8000
L0D1B6A  BPL   L0D1B7B
         LDA   #$00FF
         AND   $06
         SEC
         SBC   #$076C	; AV 202208 - 1900
         SEP   #$20
         STA   $06
         REP   #$20
L0D1B7B  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0006
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0D1B99  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $000F
         JSL   L0D111B
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D1BB0  ENT
         PHD
         TSC
         CLC
         ADC   #$FE98
         TCS
         ADC   #$0071
         TCD
         LDA   #$0001
         STA   $FC
         STZ   L055415
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BEQ   L0D1BDA
         LDA   L055039
         LDX   L05503B
         STA   $E7
         STX   $E9
         BRA   L0D1C1D
L0D1BDA  PEA   $0000
         TDC
         CLC
         ADC   #$FF8F
         PHA
         JSL   L0E06AC
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8F
         PHA
         JSL   L0735A8
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   $EF
         ORA   $F1
         BNE   L0D1C05
         BRL   L0D1CC6
L0D1C05  PHY
         PHY
         PEI   $F1
         PEI   $EF
         JSL   L078841
         PLA
         STA   $E7
         PLX
         STX   $E9
         PEI   $F1
         PEI   $EF
         JSL   L07185A
L0D1C1D  LDA   #$0006
         STA   $8F
         LDA   #$0006
         STA   $BB
         PHY
         JSL   L0314F6
         PLA
         BPL   L0D1C32
         BRL   L0D1CC6
L0D1C32  CMP   #$0003
         BMI   L0D1C3A
         BRL   L0D1CC6
L0D1C3A  SEC
         SBC   #$0000
         BEQ   L0D1C48
         DEC
         BEQ   L0D1C79
         DEC
         BEQ   L0D1C98
         BRA   L0D1CC6
L0D1C48  LDA   #$0002
         STA   $8F
         LDA   #$0001
         LDX   #$0000
         STA   $95
         STX   $97
         JSL   L0E0000
         TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E07C5
         LDA   #$0001
         STA   L055415
         BRA   L0D1CC6
L0D1C79  PHY
         PHY
         PEA   $0002
         JSL   L031415
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $E7
         LDX   $E9
         LDY   #$0058
         STA   [$EB],Y
         INY
         INY
         TXA
         STA   [$EB],Y
         BRA   L0D1CC6
L0D1C98  TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $002C
         PEA   $0001
         JSL   L0E0656
         TDC
         CLC
         ADC   #$008F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E07C5
         BRA   L0D1CC6
L0D1CC6  TSC
         CLC
         ADC   #$0168
         TCS
         PLD
         RTL

L0D1CCE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         LDA   #$0001
         STA   $60
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BEQ   L0D1CEB
         LDA   #$0000
         BRA   L0D1CEE
L0D1CEB  LDA   #$0001
L0D1CEE  STA   $55
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         LDA   $55
         BEQ   L0D1D20
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0022
         PEA   $0004
         JSL   L0E0656
L0D1D20  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$005A
         TCS
         PLD
         RTL

L0D1D3E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L0D1D63
         JSL   L0E0000
         PEA   $0001
         JSL   L0E0E4B
         BRA   L0D1D72
L0D1D63  PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L0D1D72
         JSL   L0B26CD
L0D1D72  PLY
         PLY
         PLD
         RTL

L0D1D76  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PEA   $0000
         PEA   $0000
         JSL   L0E0DE2
         PLY
         PLY
         PLD
         RTL

L0D1D91  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0D1DB2
         LDA   #$0001
         STA   $0A
         PEA   $0000
         PEA   $0000
         JSL   L0E0DE2
L0D1DB2  PLY
         PLY
         PLD
         RTL

L0D1DB6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L0B5681
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D1DCD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0D1DE3
         INX
L0D1DE3  PHX
         LDX   #$0000
         LDA   #$0004
         CMPL  L051BDE
         BNE   L0D1DF1
         INX
L0D1DF1  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0D1DFA
         BRA   L0D1E20
L0D1DFA  LDA   #$0001
         STA   $0A
         LDA   L05539D
         DEC
         STA   L05539D
         PHY
         PEA   $0000
         JSL   L0B7A56
         PLA
         LSR
         BCS   L0D1E19
         JSL   L0E10F4
         STZ   L0553A5
L0D1E19  LDA   L05539D
         INC
         STA   L05539D
L0D1E20  PLY
         PLY
         PLD
         RTL

L0D1E24  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L0D1E3E
         BRA   L0D1E6B
L0D1E3E  LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0D1E4A
         INX
L0D1E4A  PHX
         LDX   #$0000
         LDA   #$0004
         CMPL  L051BDE
         BNE   L0D1E58
         INX
L0D1E58  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0D1E63
         STZ   $0A
         BRA   L0D1E6B
L0D1E63  JSL   L0E0000
         JSL   L0E1220
L0D1E6B  PLY
         PLY
         PLD
         RTL

L0D1E6F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0064
         JSL   L0B5681
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D1E86  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L0D1EA0
         BRA   L0D1EB4
L0D1EA0  LDAL  L051BDE
         DEC
         DEC
         BNE   L0D1EAC
         STZ   $0A
         BRA   L0D1EB4
L0D1EAC  JSL   L0E0000
         JSL   L0E1220
L0D1EB4  PLY
         PLY
         PLD
         RTL

L0D1EB8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEA   $000A
         JSL   L031415
         PLA
         STA   $01
         PLX
         STX   $03
         LDX   #$0000
         LDA   [$01]
         DEC
         DEC
         BNE   L0D1ED9
         INX
L0D1ED9  TXA
         STA   $0E
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D1EE2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $0E
         PHY
         JSL   L0E05E8
         PLA
         STA   $03
         LDA   #$0003
         STA   $01
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L0D1F11
         PHY
         JSL   L0E05E8
         PLA
         STA   $01
         BRA   L0D1F15
L0D1F11  JSL   L0E0000
L0D1F15  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0008
         JSL   L0E07C5
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D1F31  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         LDA   L055399
         PHA
         JSL   L0B5681
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D1F49  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDAL  L051BDE
         SEC
         SBC   #$000E
         BEQ   L0D1F80
         BVS   L0D1F62
         EOR   #$8000
L0D1F62  BPL   L0D1F80
         LDA   #$0001
         STA   $0A
         PEA   ^L051BE2
         PEA   L051BE2
         PEA   $0000
         PEA   $0004
         PEA   $0009
         JSL   L0E07C5
         JSL   L0B0000
L0D1F80  PLY
         PLY
         PLD
         RTL

L0D1F84  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0C
         STZ   $01
L0D1F90  LDAL  L051BDE
         SEC
         SBC   #$000E
         BEQ   L0D1FFC
         BVS   L0D1F9F
         EOR   #$8000
L0D1F9F  BPL   L0D1FFC
         LDA   $01
         INC
         STA   $01
         PEA   ^L051BE2
         PEA   L051BE2
         PEA   $0000
         PEA   $0004
         PEA   $0009
         JSL   L0E07C5
         JSL   L0B0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0D1FD2
         LDA   #$0001
         STA   $0C
         PEI   $01
         JSL   L0E0E11
         BRA   L0D1FFC
L0D1FD2  LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0D1FDF
         INX
L0D1FDF  TXA
         BEQ   L0D1FF8
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0D1FEF
         INX
L0D1FEF  TXA
         BEQ   L0D1FF8
         JSL   L0B0000
         BRA   L0D1FFA
L0D1FF8  BRA   L0D1FFC
L0D1FFA  BRA   L0D1F90
L0D1FFC  PLY
         PLY
         PLY
         PLD
         RTL

L0D2001  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF2
         TCS
         ADC   #$0017
         TCD
         STZ   $FC
         TSC
         CLC
         ADC   #$010E
         TCS
         PLD
         RTL

L0D2016  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDA   #$0007
         CMPL  L051BDE
         BNE   L0D2032
         LDA   #$0001
         STA   $0A
         JSL   L0E1220
L0D2032  PLY
         PLY
         PLD
         RTL

L0D2036  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   #$0001
         STA   $0C
         PHY
         JSL   L0314F6
         PLA
         STA   $01
         JSL   L0E0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0013
         JSL   L0E07C5
         PLY
         PLY
         PLY
         PLD
         RTL

L0D206A  ENT
         PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$010D
         TCD
         STZ   $FC
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0D2085
         CPX   L0553BB
L0D2085  BNE   L0D2089
         BRA   L0D20DC
L0D2089  LDA   L0553B9
         LDX   L0553BB
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0B1388
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF3
         PHA
         JSL   L0B369F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L0D20DC
         LDA   #$0001
         STA   $FC
         JSL   L0B0000
         PEA   $0000
         PEA   $0000
         JSL   L0E0DE2
L0D20DC  TSC
         CLC
         ADC   #$0204
         TCS
         PLD
         RTL

L0D20E4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0010
         JSL   L0D111B
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D20FB  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         LDA   #$0001
         STA   $FC
         LDAL  L051BDE
         SEC
         SBC   #$000E
         BVS   L0D2118
         EOR   #$8000
L0D2118  BMI   L0D212D
         LDAL  L051BDE
         DEC
         DEC
         BEQ   L0D2129
         PEA   $0004
         JSL   L0B0B7A
L0D2129  STZ   $FC
         BRA   L0D217F
L0D212D  LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0D213B
         CPX   L0553BB
L0D213B  BNE   L0D2151
         JSL   L0B0000
         LDAL  L051BDE
         DEC
         DEC
         BEQ   L0D214D
         STZ   $FC
         BRA   L0D217F
L0D214D  JSL   L0B28E4
L0D2151  PHY
         LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0B369F
         JSL   L0B2819
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0D2175
         DEX
L0D2175  PHX
         PHA
         JSL   L0E0DE2
         JSL   L0B0000
L0D217F  TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L0D2187  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $000A
         JSL   L0D111B
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D219E  PHD
         TSC
         CLC
         ADC   #$FFCE
         TCS
         TCD
         STZ   $44
         LDA   [$40]
         DEC
         BEQ   L0D21B0
         BRL   L0D2253
L0D21B0  LDY   #$0004
         LDA   [$40],Y
         TAX
         DEY
         DEY
         LDA   [$40],Y
         CMP   L055039
         BNE   L0D21C2
         CPX   L05503B
L0D21C2  BEQ   L0D21CE
         PEA   $0006
         JSL   L0B0B7A
         BRL   L0D2253
L0D21CE  LDA   $3C
         LDX   $3E
         STA   $01
         STX   $03
         LDY   #$0012
         LDA   [$40],Y
         TAX
         DEY
         DEY
         LDA   [$40],Y
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDY   #$0008
         LDA   [$40],Y
         TAX
         DEY
         DEY
         LDA   [$40],Y
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDY   #$000C
         LDA   [$40],Y
         TAX
         DEY
         DEY
         LDA   [$40],Y
         LDY   #$000A
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0003
         LDY   #$000E
         STA   [$01],Y
         LDY   #$000E
         LDA   [$40],Y
         LDY   #$0010
         STA   [$01],Y
         PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0010
         LDA   [$01],Y
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCC   L0D2253
         LDA   #$000F
         AND   $09
         STA   [$01]
         LDA   #$0001
         STA   $44
L0D2253  LDA   $36
         STA   $42
         LDA   $35
         STA   $41
         LDA   $33
         TCD
         TSC
         CLC
         ADC   #$0040
         TCS
         RTL

L0D2265  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB4
         TCS
         TCD
         STZ   $52
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0007
         BNE   L0D22A0
         JSL   L0E0000
         PHY
         PEA   ^L05103C
         PEA   L05103C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L0D219E
         PLA
         LSR
         BCC   L0D229D
         BRL   L0D242C
L0D229D  BRL   L0D2447
L0D22A0  PHY
         JSL   L0314F6
         PLA
         CMP   #$0008
         BNE   L0D22F3
         JSL   L0E0000
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0D22BD
         CPX   L0553BB
L0D22BD  BNE   L0D22C4
         LDA   #$0000
         BRA   L0D22C7
L0D22C4  LDA   #$0001
L0D22C7  BEQ   L0D22F0
         PHY
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0020
         BCC   L0D22D7
         INX
L0D22D7  PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L0D219E
         PLA
         BEQ   L0D22F0
         BRL   L0D242C
L0D22F0  BRL   L0D2447
L0D22F3  PHY
         JSL   L0314F6
         PLA
         CMP   #$0006
         BNE   L0D2316
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000C
         PEA   $0003
         JSL   L0E0656
         BRA   L0D2323
L0D2316  TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L0B0D87
L0D2323  PHY
         JSL   L0314F6
         PLA
         DEC
         DEC
         BPL   L0D2330
         BRL   L0D23DF
L0D2330  CMP   #$0004
         BMI   L0D2338
         BRL   L0D23DF
L0D2338  SEC
         SBC   #$0000
         BEQ   L0D2348
         DEC
         DEC
         BEQ   L0D2371
         DEC
         BEQ   L0D2396
         BRL   L0D23DF
L0D2348  LDA   #$0002
         STA   $0F
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0014
         JSL   L0E0656
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $11
         PLX
         STX   $13
         BRA   L0D23DF
L0D2371  LDA   #$0003
         STA   $0F
         PHY
         JSL   L0E05E8
         PLA
         STA   $11
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0014
         JSL   L0E0656
         BRA   L0D23DF
L0D2396  PHY
         JSL   L031630
         PLA
         LSR
         BCC   L0D23B2
         LDA   #$0002
         STA   $0F
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $11
         PLX
         STX   $13
         BRA   L0D23C7
L0D23B2  LDA   #$0001
         STA   $0F
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $001F
         JSL   L0E06F4
L0D23C7  TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0014
         JSL   L0E0656
         BRA   L0D23DF
L0D23DF  LDA   L055039
         LDX   L05503B
         CMP   $39
         BNE   L0D23EB
         CPX   $3B
L0D23EB  BEQ   L0D23F6
         PEA   $0006
         JSL   L0B0B7A
         BRA   L0D2447
L0D23F6  LDA   $31
         LDX   $33
         STA   $0B
         STX   $0D
         LDA   $35
         LDX   $37
         STA   $07
         STX   $09
         LDA   $45
         BEQ   L0D2414
         LDA   $07
         LDX   $09
         STA   $03
         STX   $05
         BRA   L0D241C
L0D2414  LDA   $0B
         LDX   $0D
         STA   $03
         STX   $05
L0D241C  LDA   $47
         BEQ   L0D2427
         LDA   #$0001
         STA   $01
         BRA   L0D242C
L0D2427  LDA   #$0002
         STA   $01
L0D242C  LDA   #$0001
         STA   $52
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E07C5
L0D2447  TSC
         CLC
         ADC   #$004C
         TCS
         PLD
         RTL

L0D244F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $0E
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BEQ   L0D246C
         LDA   #$0000
         BRA   L0D246F
L0D246C  LDA   #$0001
L0D246F  STA   $01
         JSL   L0E0000
         PHY
         JSL   L0314F6
         PLA
         DEC
         BMI   L0D24A5
         CMP   #$0003
         BPL   L0D24A5
         SEC
         SBC   #$0000
         BEQ   L0D2491
         DEC
         BEQ   L0D2495
         DEC
         BEQ   L0D249C
         BRA   L0D24A5
L0D2491  STZ   $03
         BRA   L0D24A5
L0D2495  LDA   #$0001
         STA   $03
         BRA   L0D24A5
L0D249C  LDA   $01
         EOR   #$0001
         STA   $03
         BRA   L0D24A5
L0D24A5  JSL   L0E0000
         LDA   $01
         BEQ   L0D24C9
         LDA   $03
         BEQ   L0D24BD
         PEA   $0000
         PEA   $0002
         JSL   L0E0DE2
         BRA   L0D24C7
L0D24BD  PEA   $0000
         PEA   $0001
         JSL   L0E0DE2
L0D24C7  BRA   L0D24E3
L0D24C9  LDA   $03
         BEQ   L0D24D9
         PEA   $0000
         PEA   $0004
         JSL   L0E0DE2
         BRA   L0D24E3
L0D24D9  PEA   $0000
         PEA   $0003
         JSL   L0E0DE2
L0D24E3  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D24E9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $0E
         LDA   #$0016
         CMPL  L051BDE
         BEQ   L0D24FF
         BRL   L0D25BA
L0D24FF  LDAL  L051BE0
         DEC
         BPL   L0D2509
         BRL   L0D2599
L0D2509  CMP   #$0005
         BMI   L0D2511
         BRL   L0D2599
L0D2511  SEC
         SBC   #$0000
         BEQ   L0D253C
         DEC
         DEC
         BEQ   L0D2523
         DEC
         BEQ   L0D253C
         DEC
         BEQ   L0D2523
         BRA   L0D2599
L0D2523  LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0D2530
         INX
L0D2530  TXA
         STA   $03
         LDA   $03
         EOR   #$0001
         STA   $01
         BRA   L0D259B
L0D253C  LDX   #$0000
         LDAL  L051BE0
         DEC
         BNE   L0D2547
         INX
L0D2547  TXA
         STA   $01
         JSL   L0B0000
         LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BEQ   L0D255B
         INX
L0D255B  TXA
         BNE   L0D2585
         LDX   #$0000
         LDA   #$0005
         CMPL  L051BE0
         BEQ   L0D256B
         INX
L0D256B  TXA
         BEQ   L0D2580
         PHA
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BEQ   L0D257C
         INX
L0D257C  TXA
         AND   $01,S
         PLX
L0D2580  CMP   #$0000
         BEQ   L0D2587
L0D2585  BRA   L0D25BA
L0D2587  LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0D2594
         INX
L0D2594  TXA
         STA   $03
         BRA   L0D259B
L0D2599  BRA   L0D25BA
L0D259B  JSL   L0B0000
         LDA   #$0001
         STA   $0E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0014
         JSL   L0E07C5
L0D25BA  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D25C0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $0E
         PHY
         JSL   L0E05E8
         PLA
         STA   $01
         PHY
         JSL   L0E05E8
         PLA
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E07C5
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D25F9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $000B
         JSL   L0D111B
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D2610  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0C
         LDA   #$0014
         CMPL  L051BDE
         BNE   L0D2648
         LDA   #$0001
         STA   $0C
         LDAL  L051BE0
         STA   $01
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0015
         JSL   L0E07C5
         JSL   L0B0000
L0D2648  PLY
         PLY
         PLY
         PLD
         RTL

L0D264D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L051BE0
         STA   L055413
         PHY
         JSL   L0D2610
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D2668  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $10
         LDA   L0553D1
         LDX   L0553D3
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $01
         STX   $03
         LDA   L055413
         SEC
         SBC   #$0003
         BPL   L0D2694
         BRL   L0D2797
L0D2694  CMP   #$0048
         BMI   L0D269C
         BRL   L0D2797
L0D269C  ASL
         TAX
         LDAL  L0D26A4,X
         PHA
         RTS

L0D26A4  DA    L0D2732+1
         DA    L0D2732+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D278C+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2795+1
         DA    L0D2771+1
         DA    L0D2768+1
         DA    L0D275F+1
         DA    L0D277A+1
         DA    L0D2732+1
         DA    L0D2744+1
         DA    L0D2783+1
         DA    L0D2744+1
         DA    L0D2732+1
         DA    L0D2756+1
         DA    L0D274D+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2744+1
         DA    L0D2756+1
         DA    L0D2744+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2744+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2744+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2732+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2732+1
         DA    L0D2744+1
         DA    L0D2732+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D273B+1
         DA    L0D273B+1
         DA    L0D273B+1
         DA    L0D273B+1
         DA    L0D275F+1
         DA    L0D275F+1
         DA    L0D273B+1
         DA    L0D273B+1
         DA    L0D2732+1
         DA    L0D2756+1
         DA    L0D2732+1
         DA    L0D2744+1
         DA    L0D2756+1
         DA    L0D2756+1
         DA    L0D2756+1
L0D2732  DA    L0D2732+1
         LDY   #$01B0
         LDA   [$01],Y
         STA   $05
L0D273B  BRA   L0D27A0
         LDY   #$01AC
         LDA   [$01],Y
         STA   $05
L0D2744  BRA   L0D27A0
         LDY   #$01AE
         LDA   [$01],Y
         STA   $05
L0D274D  BRA   L0D27A0
         LDY   #$01C6
         LDA   [$01],Y
         STA   $05
L0D2756  BRA   L0D27A0
         LDY   #$01AA
         LDA   [$01],Y
         STA   $05
L0D275F  BRA   L0D27A0
         LDY   #$01A8
         LDA   [$01],Y
         STA   $05
L0D2768  BRA   L0D27A0
         LDY   #$01A6
         LDA   [$01],Y
         STA   $05
L0D2771  BRA   L0D27A0
         LDY   #$01A4
         LDA   [$01],Y
         STA   $05
L0D277A  BRA   L0D27A0
         LDY   #$01A2
         LDA   [$01],Y
         STA   $05
L0D2783  BRA   L0D27A0
         LDY   #$01B2
         LDA   [$01],Y
         STA   $05
L0D278C  BRA   L0D27A0
         LDY   #$01C8
         LDA   [$01],Y
         STA   $05
L0D2795  BRA   L0D27A0
L0D2797  PEA   $0007
         JSL   L0B0B7A
         BRA   L0D27AA
L0D27A0  PHY
         PEI   $05
         JSL   L0B4D5D
         PLA
         STA   $10
L0D27AA  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D27B1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0001
         STA   $12
         PHY
         JSL   L0E05E8
         PLA
         STA   $05
         PHY
         JSL   L0E05E8
         PLA
         STA   $07
         PHY
         JSL   L0E05E8
         PLA
         STA   $01
         PHY
         JSL   L0E05E8
         PLA
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $000C
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0D27FC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         STZ   $3C
         STZ   $29
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $1D
         BEQ   L0D2824
         LDA   $1F
         LDX   $21
         STA   $2B
         STX   $2D
         BRL   L0D28D8
L0D2824  PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFF6
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $000A
         JSL   L0313BE
         JSL   L03312F
         TAY
         CLC
         TSC
         ADC   #$000A
         TCS
         TYA
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0008
         _SANEFP816
         BNE   L0D289D
         LDA   #$0000
         BRA   L0D28A0
L0D289D  LDA   #$0001
L0D28A0  BEQ   L0D28AB
         PEA   $007B
         JSL   L0B0B7A
         BRA   L0D28F3
L0D28AB  TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0B8121
         LDA   $19
         ORA   $1B
         BEQ   L0D28D0
         PEA   $007C
         JSL   L0B0B7A
         BRA   L0D28F3
L0D28D0  LDA   $15
         LDX   $17
         STA   $2B
         STX   $2D
L0D28D8  TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0006
         JSL   L0E07C5
         LDA   #$0001
         STA   $3C
L0D28F3  TSC
         CLC
         ADC   #$0036
         TCS
         PLD
         RTL

L0D28FB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA8
         TCS
         TCD
         LDA   #$0001
         STA   $5E
         LDA   #$0001
         STA   $01
         PHY
         JSL   L0314F6
         PLA
         DEC
         DEC
         BMI   L0D296C
         CMP   #$0004
         BPL   L0D296C
         SEC
         SBC   #$0000
         BEQ   L0D292D
         DEC
         BEQ   L0D2938
         DEC
         BEQ   L0D2952
         DEC
         BEQ   L0D2961
         BRA   L0D296C
L0D292D  LDA   #$0002
         STA   $23
         JSL   L0E0000
         BRA   L0D296C
L0D2938  STZ   $23
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         BRA   L0D296C
L0D2952  LDA   #$0001
         STA   $23
         PHY
         JSL   L0E05E8
         PLA
         STA   $25
         BRA   L0D296C
L0D2961  LDA   #$0003
         STA   $23
         JSL   L0E0000
         BRA   L0D296C
L0D296C  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$0058
         TCS
         PLD
         RTL

L0D298A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $10
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         JSL   L071EC5
L0D29A7  LDA   #$0013
         CMPL  L051BDE
         BNE   L0D2A2C
         LDAL  L032C56
         CMPL  L051BE0
         BNE   L0D29C1
         LDA   #$0001
         STA   $01
         BRA   L0D29E5
L0D29C1  LDAL  L032C54
         CMPL  L051BE0
         BNE   L0D29D2
         LDA   #$0001
         STA   $03
         BRA   L0D29E5
L0D29D2  LDAL  L032C52
         CMPL  L051BE0
         BNE   L0D29E3
         LDA   #$0001
         STA   $05
         BRA   L0D29E5
L0D29E3  BRA   L0D2A2C
L0D29E5  JSL   L0B0000
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0D29F6
         INX
L0D29F6  PHX
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0D2A04
         INX
L0D2A04  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0D2A11
         JSL   L0B0000
         BRA   L0D29A7
L0D2A11  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $000D
         JSL   L0E07C5
         LDA   #$0001
         STA   $10
L0D2A2C  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0D2A33  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0001
         STA   $12
         PHY
         JSL   L0314F6
         PLA
         BNE   L0D2A88
         JSL   L0E0000
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L072D71
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $07
         PEI   $05
         JSL   L07185A
         PEI   $03
         PEI   $01
         JSL   L0E0CFE
L0D2A88  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0D2A90  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         LDA   #$0001
         STA   $2E
         LDA   #$0001
         STA   $0D
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         JSL   L071EC5
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         JSL   L071EC5
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BNE   L0D2AE9
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $0005
         JSL   L0E0656
L0D2AE9  PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L0D2B0A
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $0010
         JSL   L0E0656
L0D2B0A  PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L0D2B2B
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $0010
         JSL   L0E0656
L0D2B2B  PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L0D2B4C
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $0005
         JSL   L0E0656
L0D2B4C  JSL   L0E0000
         LDX   #$0000
         LDA   $1D
         BNE   L0D2B58
         INX
L0D2B58  PHX
         LDX   #$0000
         LDA   $1F
         BNE   L0D2B61
         INX
L0D2B61  TXA
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   $21
         BNE   L0D2B6E
         INX
L0D2B6E  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0D2BAC
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         JSL   L15014A
         PEA   $0008
         JSL   L0313BE
         LDA   #$00FF
         AND   $14
         INC
         SEP   #$20
         STA   $14
         REP   #$20
         LDA   #$00FF
         AND   $13
         INC
         SEP   #$20
         STA   $13
         REP   #$20
         BRA   L0D2BCC
L0D2BAC  LDA   $1D
         SEP   #$20
         STA   $12
         REP   #$20
         LDA   $1F
         SEP   #$20
         STA   $14
         REP   #$20
         LDA   $21
         SEP   #$20
         STA   $13
         REP   #$20
         LDA   $23
         SEP   #$20
         STA   $16
         REP   #$20
L0D2BCC  LDA   $17
         SEP   #$20
         STA   $11
         REP   #$20
         LDA   $19
         SEP   #$20
         STA   $10
         REP   #$20
         LDA   $1B
         SEP   #$20
         STA   $0F
         REP   #$20
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0006
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL

L0D2C02  ENT
         PHD
         TSC
         CLC
         ADC   #$FEEC
         TCS
         ADC   #$001D
         TCD
         STZ   $FC
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         JSL   L0B0D0A
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0001
         BPL   L0D2C2B
         BRL   L0D2DCB
L0D2C2B  CMP   #$0007
         BMI   L0D2C33
         BRL   L0D2DCB
L0D2C33  ASL
         TAX
         LDAL  L0D2C3B,X
         PHA
         RTS

L0D2C3B  DA    L0D2C49-1
         DA    L0D2C55-1
         DA    L0D2C60-1
         DA    L0D2C96-1
         DA    L0D2CE7-1
         DA    L0D2CE7-1
         DA    L0D2DAF-1

L0D2C49  LDA   #$0005
         STA   $CB
         JSL   L0E0000
         BRL   L0D2DCB
L0D2C55  LDA   #$0001
         STA   $FC
         BRL   L0D2DE6
*         BRL   L0D2DCB
L0D2C60  LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0D2C6E
         CPX   L0553BB
L0D2C6E  BEQ   L0D2C8F
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0020
         BCC   L0D2C86
         INX
L0D2C86  PHX
         PHA
         PEA   $0018
         JSL   L0313BE
L0D2C8F  JSL   L0E0000
         BRL   L0D2DCB
L0D2C96  LDA   #$0001
         STA   $CB
         TDC
         CLC
         ADC   #$009B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         LDA   $9D
         LDX   $9F
         STA   $DB
         STX   $DD
         PHY
         TDC
         CLC
         ADC   #$009B
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   $D9
         LDA   $A5
         LDX   $A7
         STA   $D5
         STX   $D7
         LDA   $A1
         LDX   $A3
         STA   $D1
         STX   $D3
         LDA   $D9
         BNE   L0D2CE4
         BRL   L0D2DE6
L0D2CE4  BRL   L0D2DCB
L0D2CE7  TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         JSL   L0940E5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0940E5
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L0D2D3B
         STZ   $F1
         LDA   #$0001
         LDX   #$FFE3
         STA   $00,X
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000C
         PEA   $0003
         JSL   L0E0656
         LDA   $E3
         LDX   $E5
         TXY
         LDX   #$FFE5
         STA   $00,X
         TYA
         STA   $02,X
         BRA   L0D2D5E
L0D2D3B  LDA   #$0001
         STA   $F1
         PEA   $0000
         TDC
         CLC
         ADC   #$000F
         PHA
         PEA   $0000
         PEA   $002C
         PEA   $0001
         JSL   L0E0656
         LDA   #$0006
         LDX   #$FFE3
         STA   $00,X
L0D2D5E  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L0D2D86
         LDA   $F1
         BEQ   L0D2D7D
         PEA   $007D
         JSL   L0B0B7A
         BRA   L0D2D84
L0D2D7D  PEA   $0002
         JSL   L0B0B7A
L0D2D84  BRA   L0D2DE6
L0D2D86  TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         JSL   L0B0D0A
         LDA   $F1
         BEQ   L0D2D9C
         LDA   #$0003
         STA   $CB
L0D2D9C  PHY
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $EF
         BRA   L0D2DCB
L0D2DAF  TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   ^L05103C
         PEA   L05103C
         PEA   $0018
         JSL   L0313BE
         JSL   L0E0000
         BRA   L0D2DCB
L0D2DCB  LDA   #$0001
         STA   $FC
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E07C5
L0D2DE6  TSC
         CLC
         ADC   #$0114
         TCS
         PLD
         RTL

L0D2DEE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         CMP   #$000F
         BNE   L0D2E06
         CPX   #$0000
L0D2E06  BEQ   L0D2E0D
         LDA   #$0000
         BRA   L0D2E10
L0D2E0D  LDA   #$0001
L0D2E10  STA   $0A
         PLY
         PLY
         PLD
         RTL

L0D2E16  PHD
         TSC
         CLC
         ADC   #$FDE4
         TCS
         ADC   #$0125
         TCD
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0B0D0A
         STZ   $FC
         LDA   #$0004
         STA   $DB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L0E06AC
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         PEA   ^L0402F3
         PEA   L0402F3
         JSL   L071C56
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDB
         PHA
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L072CD4
         JSL   L071C56
         PLA
         ORA   $01,S
         PLX
         LSR
         BCC   L0D2E96
         LDA   L05502B
         LDX   L05502D
         STA   $DD
         STX   $DF
         LDA   L055275
         STA   $EF
         LDA   L055273
         STA   $F1
         BRA   L0D2EB3
L0D2E96  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0B309A
         PLA
         LSR
         BCS   L0D2EB3
         BRA   L0D2ECE
L0D2EB3  TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E07C5
         LDA   #$0001
         STA   $FC
L0D2ECE  TSC
         CLC
         ADC   #$021C
         TCS
         PLD
         RTL

L0D2ED6  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         JSL   L0E0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B0D0A
         LDA   #$0004
         STA   $01
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

L0D2F12  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         CMP   #$000F
         BNE   L0D2F2F
         CPX   #$0000
L0D2F2F  BNE   L0D2F33
         BRA   L0D2F51
L0D2F33  LDA   L055349
         SEC
         SBC   #$0008
         BEQ   L0D2F43
         BVS   L0D2F41
         EOR   #$8000
L0D2F41  BMI   L0D2F4D
L0D2F43  PHY
         JSL   L0D2E16
         PLA
         STA   $0A
         BRA   L0D2F51
L0D2F4D  JSL   L0D2ED6
L0D2F51  PLY
         PLY
         PLD
         RTL

L0D2F55  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         CMP   #$000F
         BNE   L0D2F72
         CPX   #$0000
L0D2F72  BNE   L0D2F76
         BRA   L0D2FB8
L0D2F76  LDA   L055413
         SEC
         SBC   #$0002
         BEQ   L0D2F86
         BVS   L0D2F84
         EOR   #$8000
L0D2F84  BMI   L0D2F8B
L0D2F86  LDA   #$0000
         BRA   L0D2F8E
L0D2F8B  LDA   #$0001
L0D2F8E  BEQ   L0D2FB4
         LDA   L055413
         SEC
         SBC   #$0008
         BEQ   L0D2FA5
         BVS   L0D2F9E
         EOR   #$8000
L0D2F9E  BPL   L0D2FA5
         LDA   #$0000
         BRA   L0D2FA8
L0D2FA5  LDA   #$0001
L0D2FA8  BEQ   L0D2FB4
         PHY
         JSL   L0D2E16
         PLA
         STA   $0A
         BRA   L0D2FB8
L0D2FB4  JSL   L0D2ED6
L0D2FB8  PLY
         PLY
         PLD
         RTL

L0D2FBC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         CMP   #$000F
         BNE   L0D2FD4
         CPX   #$0000
L0D2FD4  BNE   L0D2FDD
         LDA   #$0001
         STA   $0A
         BRA   L0D2FE5
L0D2FDD  PHY
         JSL   L0D2E16
         PLA
         STA   $0A
L0D2FE5  PLY
         PLY
         PLD
         RTL

L0D2FE9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0C
         STZ   $01
L0D2FF5  PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         CLC
         ADC   #$01B4
         BCC   L0D300F
         INX
L0D300F  STA   $03
         STX   $05
         LDA   [$03]
         PHA
         JSL   L0B4D5D
         PLA
         LSR
         BCC   L0D302A
         PHY
         JSL   L0E05E8
         PLA
         ORA   $01
         STA   $01
         BRA   L0D302C
L0D302A  BRA   L0D305F
L0D302C  LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0D3039
         INX
L0D3039  PHX
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0D3047
         INX
L0D3047  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0D3054
         JSL   L0B0000
         BRA   L0D2FF5
L0D3054  LDA   #$0001
         STA   $0C
         PEI   $01
         JSL   L0E0E11
L0D305F  PLY
         PLY
         PLY
         PLD
         RTL

L0D3064  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0001
         STA   $14
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BEQ   L0D3081
         LDA   #$0000
         BRA   L0D3084
L0D3081  LDA   #$0001
L0D3084  STA   $01
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BEQ   L0D3096
         LDA   #$0000
         BRA   L0D3099
L0D3096  LDA   #$0001
L0D3099  STA   $03
         JSL   L0E0000
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L0D30B4
         PHY
         JSL   L0E05E8
         PLA
         STA   $09
         BRA   L0D30B6
L0D30B4  STZ   $09
L0D30B6  PHY
         JSL   L0E05E8
         PLA
         STA   $07
         PHY
         JSL   L0E05E8
         PLA
         STA   $05
         LDA   #$000C
         CMP   $05
         BNE   L0D30D5
         LDA   $03
         BEQ   L0D30D3
         STZ   $05
L0D30D3  BRA   L0D30E1
L0D30D5  LDA   $01
         BEQ   L0D30E1
         LDA   #$000C
         CLC
         ADC   $05
         STA   $05
L0D30E1  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $0010
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0D30FF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L0D3125
         JSL   L0E0000
         PEA   $0000
         PEA   $0000
         JSL   L0E0DE2
L0D3125  PLY
         PLY
         PLD
         RTL

L0D3129  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         STZ   $21
L0D3133  TDC
         CLC
         ADC   #$0001
         STA   $23
         STZ   $25
         LDA   #$000F
         SEC
         SBC   $21
         ASL
         CLC
         ADC   $23
         STA   $23
         BCC   L0D314C
         INC   $25
L0D314C  PHY
         PHY
         JSL   L0E05E8
         PEA   $0000
         PEA   $0FFF
         JSL   L071A1B
         PLA
         STA   [$23]
         LDA   #$000F
         CMP   $21
         BEQ   L0D316A
         INC   $21
         BRA   L0D3133
L0D316A  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E07C5
         LDA   #$0001
         STA   $2C
         TSC
         CLC
         ADC   #$0026
         TCS
         PLD
         RTL

L0D318D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0001
         STA   $12
         STZ   $05
         LDA   #$0001
         STA   $03
         STZ   $07
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L0D31D3
         PHY
         JSL   L0E05E8
         PLA
         STA   $05
         LDA   #$0005
         CMP   $05
         BNE   L0D31D3
         PHY
         PHY
         JSL   L0E05E8
         PLA
         DEC
         PHA
         PEA   $0000
         PEA   $000F
         JSL   L071A1B
         PLA
         STA   $07
L0D31D3  PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L0D31E6
         PHY
         JSL   L0E05E8
         PLA
         STA   $03
L0D31E6  PHY
         JSL   L0E05E8
         PLA
         STA   $01
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $0017
         JSL   L0E07C5
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0D320C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0A
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L0D322E
         PEA   $0000
         PEA   $0005
         JSL   L0E0DE2
L0D322E  PLY
         PLY
         PLD
         RTL

