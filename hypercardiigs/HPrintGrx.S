*
* HypercardGS
* segment: $20 HPrintGrx
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintGrx.l
         lst   off

*---------------------------------------

         use   HPrintGrx.X

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

L200000  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDY   #$0006
         LDA   [$0E],Y
         STA   $07
         LDY   #$000C
         LDA   [$0E],Y
         STA   $05
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         INY
         INY
         LDA   [$0E],Y
         STX   $0E
         STA   $10
         STZ   $01
L200025  LDY   #$0000
L200028  LDA   [$0E],Y
         TAX
         ASL
         AND   #$AAAA
         STA   $03
         TXA
         LSR
         AND   #$5555
         ORA   $03
         ORA   [$0E],Y
         STA   [$0E],Y
         INY
         INY
         CPY   $07
         BCC   L200028
         LDA   $01
         CMP   $05
         BEQ   L20005B
         INC
         STA   $01
         CLC
         LDA   $0E
         ADC   $07
         STA   $0E
         LDA   $10
         ADC   #$0000
         STA   $10
         BRA   L200025
L20005B  LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         TDC
         TCS
         PLY
         PLY
         PLY
         PLY
         PLD
         PLY
         PLY
         RTL

L20006D  DW    $0015
L20006F  DW    $0900
L200071  PHD
         TSC
         CLC
         ADC   #$FFB4
         TCS
         TCD
         PHY
         PHY
         PEI   $5A
         PEI   $58
         PEA   $0002
         JSL   L07977D
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $41
         LDA   $41
         BNE   L200097
         BRL   L20029D
L200097  STZ   $43
L200099  LDA   $43
         INC
         STA   $43
         PHY
         PEI   $5A
         PEI   $58
         PEI   $43
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $47
         LDA   $47
         BNE   L2000B6
         BRL   L20029D
L2000B6  PHY
         PEI   $5A
         PEI   $58
         PEI   $47
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L2000D1
         BRL   L20029D
L2000D1  LDA   #$8000
         AND   $09
         BEQ   L2000DB
         BRL   L200286
L2000DB  PHY
         PEI   $5A
         PEI   $58
         PEI   $47
         JSL   L085819
         PLA
         LSR
         BCC   L2000ED
         BRL   L200286
L2000ED  LDA   $56
         BNE   L2000F9
         LDA   $47
         EOR   #$FFFF
         INC
         STA   $47
L2000F9  LDA   #$4000
         AND   $09
         BEQ   L200103
         LDA   #$0001
L200103  AND   $56
         BEQ   L200128
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEI   $47
         PEA   $0001
         JSL   L07AEBB
         PLA
         STA   $3B
         PLX
         STX   $3D
         BRA   L200147
L200128  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $47
         PEA   $0000
         JSL   L07AEBB
         PLA
         STA   $3B
         PLX
         STX   $3D
L200147  LDA   $3B
         ORA   $3D
         BNE   L200150
         BRL   L20029D
L200150  LDA   [$3B]
         LDY   #$0002
         ORA   [$3B],Y
         BNE   L200164
         PEI   $3D
         PEI   $3B
         JSL   L07185A
         BRL   L20028E
L200164  LDA   $1F
         STA   $2F
         LDA   $23
         SEP   #$20
         STA   $31
         REP   #$20
         LDA   $21
         SEP   #$20
         STA   $32
         REP   #$20
         LDA   $25
         STA   $3F
         PEI   $31
         PEI   $2F
         JSL   L1609CE
         PHY
         PHY
         JSL   L150695
         PLA
         STA   $2F
         PLX
         STX   $31
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $56
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L083B58
         LDA   #$0001
         CLC
         ADC   $52
         LDX   $54
         BCC   L2001B3
         INX
L2001B3  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L1501AF
         LDA   #$000F
         AND   $13
         BEQ   L2001DD
         PEA   $0000
         JSL   L1516ED
         BRA   L2001E4
L2001DD  PEA   $0004
         JSL   L1516ED
L2001E4  LDAL  L051EF4
         BEQ   L2001F9
         PHY
         LDA   #$00FF
         AND   $28
         PHA
         JSL   L081A92
         JSL   L1511E6
L2001F9  LDA   #$000F
         AND   $13
         STA   $45
         LDA   #$0007
         CMP   $45
         BNE   L20020F
         LDA   $39
         SEC
         SBC   #$001A
         STA   $39
L20020F  PEI   $3D
         PEI   $3B
         JSL   L0718BF
         LDY   #$000F
         LDA   [$52],Y
         TAX
         DEY
         DEY
         LDA   [$52],Y
         CLC
         ADC   #$0018
         BCC   L200228
         INX
L200228  STA   $49
         STX   $4B
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         STA   $49
         STX   $4B
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         CLC
         ADC   #$0002
         BCC   L200247
         INX
L200247  PHX
         PHA
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         LDY   #$0002
         LDA   [$3B],Y
         PHA
         LDA   [$3B]
         PHA
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEI   $1D
         PEI   $3F
         PHY
         PEI   $47
         JSL   L086029
         JSL   L08090C
         PLA
         STA   $45
         PEI   $3D
         PEI   $3B
         JSL   L07185A
L200286  PEI   $3D
         PEI   $3B
         JSL   L07185A
L20028E  LDA   $43
         SEC
         SBC   $41
         BVS   L200298
         EOR   #$8000
L200298  BMI   L20029D
         BRL   L200099
L20029D  LDA   $50
         STA   $5A
         LDA   $4F
         STA   $59
         LDA   $4D
         TCD
         TSC
         CLC
         ADC   #$0058
         TCS
         RTL

L2002AF  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2C
         PEI   $2A
         PEA   $0008
         JSL   L0313BE
         LDA   L055027
         LDX   L055029
         STA   $15
         STX   $17
         LDA   L05501F
         LDX   L055021
         STA   $11
         STX   $13
         PHY
         PEI   $28
         PEI   $26
         JSL   L1609DC
         PLA
         LSR
         BCS   L2002EF
         BRL   L2003D0
L2002EF  LDA   L055027
         LDX   L055029
         CMP   $15
         BNE   L2002FB
         CPX   $17
L2002FB  BEQ   L200300
         STZ   L055139
L200300  LDA   L05501F
         LDX   L055021
         CMP   $11
         BNE   L20030C
         CPX   $13
L20030C  BEQ   L200311
         STZ   L055135
L200311  LDAL  L051EF0
         DEC
         BNE   L20032B
         LDA   L055149
         STA   $1B
         LDA   L055147
         STA   $19
         STZ   L055149
         LDA   #$0001
         STA   L055147
L20032B  PEA   ^L053259
         PEA   L053259
         JSL   L085216
         LDAL  L051EF6
         BNE   L200345
         PEA   ^L053239
         PEA   L053239
         JSL   L200000
L200345  PHY
         PHY
         JSL   L150493
         PLA
         STA   $0D
         PLX
         STX   $0F
         PEA   ^L053239
         PEA   L053239
         PEI   $0F
         PEI   $0D
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PHY
         JSL   L1516CF
         JSL   L1505E6
         LDAL  L051EF0
         DEC
         BNE   L2003C2
         LDA   $1B
         STA   L055149
         LDA   $19
         STA   L055147
         PHY
         PHY
         JSL   L150695
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L200071
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L200071
         PEI   $0B
         PEI   $09
         JSL   L1609CE
L2003C2  PEA   $0000
         JSL   L1516ED
         PEA   $0000
         JSL   L1511E6
L2003D0  LDA   $24
         STA   $2C
         LDA   $23
         STA   $2B
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L2003E2  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $1A
         ORA   $1C
         BNE   L20042B
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $14
         PEI   $12
         JSL   L07B8EA
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $16
         ORA   $18
         BEQ   L200428
         PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L0745B2
         PLA
         PLX
         CMP   $16
         BNE   L200422
         CPX   $18
L200422  BEQ   L200428
         STZ   $05
         STZ   $07
L200428  BRL   L2004AC
L20042B  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $01
         STX   $03
         LDX   #$0000
         LDA   [$01]
         LDY   #$0002
         ORA   [$01],Y
         BNE   L200444
         INX
L200444  PHX
         PEI   $14
         PEI   $12
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         JSL   L033477
         BEQ   L20045E
         BVS   L20045C
         EOR   #$8000
L20045C  BMI   L200463
L20045E  LDA   #$0000
         BRA   L200466
L200463  LDA   #$0001
L200466  ORA   $01,S
         PLX
         LSR
         BCC   L200472
         STZ   $05
         STZ   $07
         BRA   L2004AC
L200472  LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L20047D
         INX
L20047D  PHX
         PHA
         LDA   $12
         JSL   L150488
         TAY
         BNE   L200489
         DEX
L200489  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
L2004AC  LDA   $05
         LDX   $07
         STA   $1E
         STX   $20
         LDA   $10
         STA   $1C
         LDA   $0F
         STA   $1B
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L2004C6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDAL  L0408E0
         STA   $01
         PLY
         PLY
         PLY
         PLD
         RTL

L2004D9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA4
         TCS
         TCD
         STZ   $62
         PHY
         JSL   L1609EA
         PLA
         LSR
         BCC   L2004F6
         PEA   $083E
         JSL   L0727E0
         BRL   L20067F
L2004F6  PEA   $0000
         JSL   L1609F8
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L1510B9
         PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $43
         PLX
         STX   $45
         PHY
         JSL   L160A06
         PLA
         BEQ   L200520
         BRL   L20067F
L200520  LDX   #$0000
         LDA   #$0001
         AND   $45
         BNE   L20052B
         INX
L20052B  TXA
         STA   $55
         LDA   $55
         BEQ   L20056A
         LDA   L055327
         LDX   L055329
         STA   $59
         STX   $5B
         LDY   #$0002
         LDA   [$59],Y
         TAX
         LDA   [$59]
         CLC
         ADC   #$0018
         BCC   L20054B
         INX
L20054B  STA   $09
         STX   $0B
         LDA   [$09]
         STA   $53
         LDA   #$0020
         ORA   [$09]
         STA   [$09]
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L1511B6
         PLA
         STA   $57
L20056A  PEA   ^L051EF0
         PEA   L051EF0
         PEA   $0000
         JSL   L160A14
         PEA   ^L051F32
         PEA   L051F32
         PHY
         PHY
         PEA   $0837
         JSL   L0711EB
         PEA   $00C1
         JSL   L0313BE
         PHY
         PEA   $0008
         JSL   L160A22
         PLA
         LSR
         BCC   L20059C
         BRL   L20065A
L20059C  PHY
         PHY
         JSL   L150493
         PLA
         STA   $4F
         PLX
         STX   $51
         LDA   L05532F
         LDX   L055331
         STA   $59
         STX   $5B
         LDY   #$0002
         LDA   [$59],Y
         TAX
         LDA   [$59]
         STA   $4B
         STX   $4D
         PEI   $4D
         PEI   $4B
         JSL   L151131
         LDA   #$0008
         CLC
         ADC   $4B
         LDX   $4D
         BCC   L2005D1
         INX
L2005D1  PHX
         PHA
         JSL   L15123D
         PEI   $51
         PEI   $4F
         JSL   L151131
         PHY
         PHY
         PEA   $0000
         PEA   $0008
         PEA   $0010
         PEA   $07D3
         JSL   L160A30
         PLA
         STA   $47
         PLX
         STX   $49
         LDA   $47
         ORA   $49
         BEQ   L20065A
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $05
         STX   $07
         LDA   #$0001
         LDX   #$0000
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
         LDA   L055027
         LDX   L055029
         LDY   #$0004
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         PEA   ^L051EF0
         PEA   L051EF0
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L160A3E
         PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEI   $49
         PEI   $47
         PEA   $0000
         JSL   L200EF9
         PLA
         STA   $62
         PEI   $49
         PEI   $47
         JSL   L07185A
L20065A  LDA   $55
         BEQ   L20067F
         LDA   L055327
         LDX   L055329
         STA   $59
         STX   $5B
         LDY   #$0002
         LDA   [$59],Y
         TAX
         LDA   [$59]
         CLC
         ADC   #$0018
         BCC   L200677
         INX
L200677  STA   $01
         STX   $03
         LDA   $53
         STA   [$01]
L20067F  PEA   $000B
         JSL   L160A4C
         TSC
         CLC
         ADC   #$005C
         TCS
         PLD
         RTL

L20068E	ENT
         PHD
         TSC
         CLC
         ADC   #$FFBE
         TCS
         TCD
         JSL   L09AFB1
         LDA   #$0003
         STA   $3D
         STZ   $3B
         STZ   $4E
         PHY
         PEI   $3D
         PEA   $0000
         PEA   $0000
         JSL   L160A5A
         PLA
         LSR
         BCS   L2006B7
         BRL   L20075C
L2006B7  PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         JSL   L160A06
         PLA
         BEQ   L2006CE
         BRL   L20075C
L2006CE  LDAL  L051F16
         PHA
         PEA   ^L040823
         PEA   L040823
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFFF
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $0001
         JSL   L0313BE
         PEA   $0001
         JSL   L1511F2
         PLA
         LSR
         BCS   L2006FF
         LDA   #$0004
         STA   $3B
L2006FF  LDAL  L051F22
         BEQ   L20070D
         LDA   #$0008
         CLC
         ADC   $3B
         STA   $3B
L20070D  LDAL  L051FF3
         BEQ   L20071B
         LDA   #$0010
         CLC
         ADC   $3B
         STA   $3B
L20071B  LDA   $3B
         BEQ   L200732
         PHY
         PEI   $3B
         PEA   $0000
         PEA   $0000
         JSL   L160A5A
         PLA
         LSR
         BCS   L200732
         BRA   L20075C
L200732  PEA   ^L051EF0
         PEA   L051EF0
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L160A3E
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $4C
         PEI   $4A
         PEI   $48
         JSL   L200EF9
         PLA
         STA   $4E
L20075C  LDA   $3B
         CLC
         ADC   $3D
         PHA
         JSL   L160A4C
         LDA   $46
         STA   $4C
         LDA   $45
         STA   $4B
         LDA   $43
         TCD
         TSC
         CLC
         ADC   #$004A
         TCS
         RTL

L200778  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$00A3
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L20078B
         INX
L20078B  PHX
         PHA
         JSL   L150FF9
         LDA   #$00A3
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L20079C
         INX
L20079C  PHX
         PHA
         LDY   #$00B1
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L160A68
         LDY   #$00CB
         LDA   [$0A],Y
         PHA
         LDA   #$00A3
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L2007BE
         INX
L2007BE  PHX
         PHA
         JSL   L160A76
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L2007D5  PHD
         TSC
         CLC
         ADC   #$FCEC
         TCS
         ADC   #$0221
         TCD
         LDA   #$00A3
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L2007EB
         INX
L2007EB  PHX
         PHA
         JSL   L150FF9
         LDA   #$00A3
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L2007FC
         INX
L2007FC  PHX
         PHA
         LDY   #$00B1
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L2002AF
         LDY   #$00CB
         LDA   [$F8],Y
         PHA
         LDA   #$00A3
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L20081E
         INX
L20081E  PHX
         PHA
         JSL   L160A76
         LDY   #$00FA
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0034
         BCC   L200835
         INX
L200835  STA   $EF
         STX   $F1
         LDA   [$EF]
         BNE   L200840
         BRL   L200924
L200840  LDAL  L20006F
         PHA
         LDAL  L20006D
         PHA
         JSL   L1609CE
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L150178
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         LDA   #$00A3
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L20086F
         INX
L20086F  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $EB
         STA   $E7
         LDA   $DF
         CLC
         ADC   $EB
         CLC
         ADC   $E1
         CLC
         ADC   $E5
         INC
         STA   $EB
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L150FF9
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDF
         PHA
         LDY   #$00B1
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFDF
         AND   $00,X
         BNE   L20090A
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PHY
         PHY
         PEA   $083A
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FECB
         PHA
         LDY   #$00B1
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L20090A  PEI   $E9
         LDA   $DF
         CLC
         ADC   $E7
         INC
         PHA
         JSL   L1510C5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         JSL   L150592
L200924  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$031A
         TCS
         RTL

L200936  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDY   #$00FA
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         STA   $01
         STX   $03
         LDY   #$00D5
         LDA   [$12],Y
         JSL   L150488
         PHX
         PHA
         LDY   #$00C9
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         JSL   L1512A5
         PHX
         PHA
         LDY   #$00D3
         LDA   [$12],Y
         JSL   L150488
         PHX
         PHA
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         STX   $09
         ORA   $09
         BNE   L2009CD
         LDA   #$0093
         CLC
         ADC   $12
         LDX   $14
         BCC   L20098B
         INX
L20098B  PHX
         PHA
         LDA   #$0020
         CLC
         ADC   $01
         LDX   $03
         BCC   L200998
         INX
L200998  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$009B
         CLC
         ADC   $12
         LDX   $14
         BCC   L2009AC
         INX
L2009AC  PHX
         PHA
         LDA   #$0093
         CLC
         ADC   $12
         LDX   $14
         BCC   L2009B9
         INX
L2009B9  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         LDY   #$00CB
         STA   [$12],Y
         BRL   L200B53
L2009CD  LDY   #$00D5
         LDA   [$12],Y
         JSL   L150488
         PHX
         PHA
         LDY   #$00C9
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         JSL   L1512A5
         INC
         BNE   L2009EA
         INX
L2009EA  PHX
         PHA
         LDY   #$00D3
         LDA   [$12],Y
         JSL   L150488
         PHX
         PHA
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         STA   $07
         LDAL  L051F16
         SEC
         SBC   #$0001
         BPL   L200A0E
         BRL   L200B53
L200A0E  CMP   #$0006
         BMI   L200A16
         BRL   L200B53
L200A16  ASL
         TAX
         LDAL  L200A1E,X
         PHA
         RTS

L200A1E  DA    L200A2A-1
         DA    L200ABB-1
         DA    L200A2A-1
         DA    L200ABB-1
         DA    L200A2A-1
         DA    L200ABB-1

L200A2A  PEI   $07
         LDY   #$0030
         LDA   [$01],Y
         PHA
         JSL   L150318
         PLX
         PLX
         STA   $05
         LDA   $05
         BNE   L200A45
         LDY   #$0030
         LDA   [$01],Y
         STA   $05
L200A45  LDA   $05
         DEC
         BEQ   L200A6C
         LDA   #$009B
         CLC
         ADC   $12
         LDX   $14
         BCC   L200A55
         INX
L200A55  PHX
         PHA
         LDY   #$002A
         LDA   [$01],Y
         LDY   #$002C
         CLC
         ADC   [$01],Y
         PHA
         PEA   $0000
         JSL   L1501AF
         BRA   L200AB8
L200A6C  LDA   #$0093
         CLC
         ADC   $12
         LDX   $14
         BCC   L200A77
         INX
L200A77  PHX
         PHA
         PEA   $0000
         LDY   #$0028
         LDA   [$01],Y
         LDY   #$002E
         CLC
         ADC   [$01],Y
         PHA
         JSL   L1501AF
         LDA   #$009B
         CLC
         ADC   $12
         LDX   $14
         BCC   L200A97
         INX
L200A97  PHX
         PHA
         LDA   #$0093
         CLC
         ADC   $12
         LDX   $14
         BCC   L200AA4
         INX
L200AA4  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDY   #$00CB
         LDA   [$12],Y
         INC
         LDY   #$00CB
         STA   [$12],Y
L200AB8  BRL   L200B53
L200ABB  PEI   $07
         LDY   #$0032
         LDA   [$01],Y
         PHA
         JSL   L150318
         PLX
         PLX
         STA   $05
         LDA   $05
         BNE   L200AD6
         LDY   #$0032
         LDA   [$01],Y
         STA   $05
L200AD6  LDA   $05
         DEC
         BEQ   L200B08
         LDA   #$009B
         CLC
         ADC   $12
         LDX   $14
         BCC   L200AE6
         INX
L200AE6  PHX
         PHA
         PEA   $0000
         LDY   #$0028
         LDA   [$01],Y
         LDY   #$002E
         CLC
         ADC   [$01],Y
         PHA
         JSL   L1501AF
         LDY   #$00CB
         LDA   [$12],Y
         INC
         LDY   #$00CB
         STA   [$12],Y
         BRA   L200B51
L200B08  LDA   #$0093
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B13
         INX
L200B13  PHX
         PHA
         LDY   #$002A
         LDA   [$01],Y
         LDY   #$002C
         CLC
         ADC   [$01],Y
         PHA
         PEA   $0000
         JSL   L1501AF
         LDA   #$009B
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B33
         INX
L200B33  PHX
         PHA
         LDA   #$0093
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B40
         INX
L200B40  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         LDY   #$00CB
         STA   [$12],Y
L200B51  BRA   L200B53
L200B53  LDA   #$00A3
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B5E
         INX
L200B5E  PHX
         PHA
         LDA   #$009B
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B6B
         INX
L200B6B  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$00A3
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B7F
         INX
L200B7F  PHX
         PHA
         LDA   #$00A3
         CLC
         ADC   $12
         LDX   $14
         BCC   L200B8C
         INX
L200B8C  CLC
         ADC   #$0002
         BCC   L200B93
         INX
L200B93  STA   $09
         STX   $0B
         LDA   #$0001
         AND   [$09]
         EOR   #$FFFF
         INC
         PHA
         PEA   $0000
         JSL   L1501AF
         LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L200BBA  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0001
         STA   $26
         LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         JSL   L1512A5
         INC
         BNE   L200BE0
         INX
L200BE0  STA   $01
         STX   $03
         LDA   $16
         ORA   $18
         BNE   L200BF2
         LDA   $01
         LDX   $03
         STA   $16
         STX   $18
L200BF2  LDA   $1A
         ORA   $1C
         BNE   L200C02
         LDA   #$0001
         LDX   #$0000
         STA   $1A
         STX   $1C
L200C02  PEI   $18
         PEI   $16
         LDA   $1A
         LDX   $1C
         JSL   L033477
         BVS   L200C13
         EOR   #$8000
L200C13  BMI   L200C2D
         LDA   $16
         LDX   $18
         STA   $05
         STX   $07
         LDA   $1A
         LDX   $1C
         STA   $16
         STX   $18
         LDA   $05
         LDX   $07
         STA   $1A
         STX   $1C
L200C2D  PEI   $1C
         PEI   $1A
         LDA   $01
         LDX   $03
         JSL   L033477
         BEQ   L200C42
         BVS   L200C40
         EOR   #$8000
L200C40  BMI   L200CB0
L200C42  PEI   $18
         PEI   $16
         LDA   $01
         LDX   $03
         JSL   L033477
         BEQ   L200C5F
         BVS   L200C55
         EOR   #$8000
L200C55  BPL   L200C5F
         LDA   $01
         LDX   $03
         STA   $16
         STX   $18
L200C5F  LDA   $22
         LDX   $24
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         PEI   $1C
         PEI   $1A
         JSL   L150F53
         TAY
         BNE   L200C7B
         DEX
L200C7B  DEC
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
         LDA   $1E
         LDX   $20
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         PEI   $18
         PEI   $16
         JSL   L150F53
         PHX
         PHA
         LDA   $1A
         LDX   $1C
         JSL   L1512A5
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
         STZ   $26
L200CB0  LDA   $10
         STA   $24
         LDA   $0F
         STA   $23
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L200CC2  PHD
         TSC
         CLC
         ADC   #$FEDC
         TCS
         ADC   #$003D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCF
         PHA
         PEI   $F2
         PEI   $F0
         PEA   $0008
         JSL   L0313BE
         LDX   #$FFD5
         LDA   $00,X
         LDX   #$FFD1
         SEC
         SBC   $00,X
         SEC
         SBC   #$0240
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $E1
         LDA   #$FFFE
         AND   $E1
         LDX   #$FFD1
         STA   $00,X
         LDA   #$0240
         LDX   #$FFD1
         CLC
         ADC   $00,X
         LDX   #$FFD5
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCF
         PHA
         JSL   L150FF9
         STZ   $DF
         LDX   #$FFCF
         LDA   $00,X
         STA   $E1
         LDA   $F8
         LDX   $FA
         TXY
         LDX   #$FFCB
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFCB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L200D47
         INX
L200D47  STA   $E3
         STX   $E5
         LDA   #$00FF
         AND   [$E3]
         SEC
         SBC   #$0000
         BPL   L200D59
         BRL   L200DEB
L200D59  BNE   L200D5E
         BRL   L200DEB
L200D5E  LDA   $EC
         LDX   $EE
         PEA   $FFFF
         PEA   $FFFB
         JSL   L150F53
         PHX
         PHA
         LDX   #$FFCB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L200D7E
         INX
L200D7E  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L160A84
         LDX   #$FFCB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L200D9D
         INX
L200D9D  STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         PHX
         PHA
         JSL   L1609CE
         PHY
         LDX   #$FFCB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L200DC0
         INX
L200DC0  PHX
         PHA
         PEA   $0081
         JSL   L160A92
         PLA
         STA   $DF
         LDX   #$FFCB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L200DDC
         INX
L200DDC  STA   $E3
         STX   $E5
         LDA   [$E3]
         BEQ   L200DEB
         LDA   $DF
         CLC
         ADC   $E1
         STA   $E1
L200DEB  LDA   #$0010
         CLC
         ADC   $F4
         LDX   $F6
         BCC   L200DF6
         INX
L200DF6  TXY
         LDX   #$FFC7
         STA   $00,X
         TYA
         STA   $02,X
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         LDX   #$FFC7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L200E18
         INX
L200E18  STA   $E3
         STX   $E5
         LDA   [$E3]
         PHA
         LDX   #$FFC7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $E3
         STX   $E5
         LDA   [$E3]
         PHA
         LDX   #$FFC7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L200E41
         INX
L200E41  STA   $E3
         STX   $E5
         LDA   [$E3]
         PHA
         LDX   #$FFC7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$F8],Y
         CLC
         ADC   [$E3]
         SEC
         SBC   $DF
         PHA
         JSL   L15100B
         PEI   $F6
         PEI   $F4
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         LDX   #$FFD1
         LDA   $00,X
         PHA
         PEI   $E1
         PEA   $0000
         JSL   L15025A
         LDA   $DF
         BMI   L200EE7
         BEQ   L200EE7
         LDA   $F8
         LDX   $FA
         TXY
         LDX   #$FFC3
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFC3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L200EA6
         INX
L200EA6  STA   $E3
         STX   $E5
         LDA   [$E3]
         BNE   L200EBD
         LDX   #$FFD3
         LDA   $00,X
         SEC
         SBC   $DF
         LDX   #$FFCF
         STA   $00,X
         BRA   L200ECA
L200EBD  LDA   $DF
         LDX   #$FFCF
         CLC
         ADC   $00,X
         LDX   #$FFD3
         STA   $00,X
L200ECA  LDX   #$FFD1
         LDA   $00,X
         PHA
         LDX   #$FFD3
         LDA   $00,X
         PHA
         JSL   L1510C5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L150592
L200EE7  LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$0136
         TCS
         RTL

L200EF9  PHD
         TSC
         CLC
         ADC   #$FDF6
         TCS
         ADC   #$011D
         TCD
         PHY
         JSL   L160AA0
         PLA
         LSR
         BCC   L200F39
         LDA   L055327
         LDX   L055329
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         CLC
         ADC   #$0050
         BCC   L200F26
         INX
L200F26  CLC
         ADC   #$0006
         BCC   L200F2D
         INX
L200F2D  STA   $E9
         STX   $EB
         SEP   #$20
         LDA   #$80
         STA   [$E9]
         REP   #$20
L200F39  LDA   L055327
         LDX   L055329
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         CLC
         ADC   #$0050
         BCC   L200F52
         INX
L200F52  CLC
         ADC   #$0006
         BCC   L200F59
         INX
L200F59  STA   $E9
         STX   $EB
         LDA   #$00FF
         AND   [$E9]
         AND   #$00FF
         CMP   #$0080
         BEQ   L200F6F
         LDA   #$0000
         BRA   L200F72
L200F6F  LDA   #$0001
L200F72  STA   $E3
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         JSL   L160AAE
         PLA
         STA   $E1
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $B7
         PLX
         STX   $B9
         LDAL  L051F16
         PHA
         PEA   ^L040825
         PEA   L040825
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFFF
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $0001
         JSL   L0313BE
         PEA   $0001
         JSL   L1511F2
         PLA
         EOR   #$0001
         STA   $E7
         LDA   #$0001
         STA   L054FB3
         LDA   $E7
         BNE   L200FDB
         BRL   L20109A
L200FDB  STZ   $E5
         LDA   #$0001
         STA   $D5
L200FE2  PEI   $E5
         PHY
         LDA   L055323
         LDX   L055325
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         PHX
         PHA
         LDA   $D5
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L201016
         INX
L201016  CLC
         ADC   #$0004
         BCC   L20101D
         INX
L20101D  PHX
         PHA
         JSL   L1500E3
         PLA
         ORA   $01,S
         PLX
         STA   $E5
         LDA   #$001F
         CMP   $D5
         BEQ   L201034
         INC   $D5
         BRA   L200FE2
L201034  PEI   $E5
         PHY
         PEA   ^L051EF8
         PEA   L051EF8
         JSL   L1500E3
         PLA
         ORA   $01,S
         PLX
         LSR
         BCS   L201052
         PEA   $130B
         JSL   L1609F8
         BRL   L20166B
L201052  LDAL  L051F08
         TAX
         LDAL  L051F06
         STA   $AB
         STX   $AD
         PHY
         PHY
         PEI   $AD
         PEI   $AB
         JSL   L0742B3
         PLA
         PLX
         CMP   #$FFFF
         BNE   L201073
         CPX   #$FFFF
L201073  BNE   L201098
         LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   $AB
         STX   $AD
         PHY
         PEA   $0857
         JSL   L0726F9
         PLA
         LSR
         BCS   L201098
         PEA   $0080
         JSL   L1609F8
         BRL   L20166B
L201098  BRA   L20109E
L20109A  STZ   $AB
         STZ   $AD
L20109E  PEI   $F6
         PEI   $F4
         PEI   $AD
         PEI   $AB
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         JSL   L160ABC
         LDA   $C3
         ORA   $C5
         BNE   L2010CC
         PEA   $130A
         JSL   L1609F8
         BRL   L20166B
L2010CC  LDA   $F2
         BEQ   L201139
         PHY
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         LDAL  L051F1A
         PHA
         LDAL  L051F18
         PHA
         LDAL  L051F1E
         PHA
         LDAL  L051F1C
         PHA
         PEA   $0000
         PHD
         JSL   L200BBA
         PLA
         LSR
         BCC   L201139
         PHY
         PEA   $0859
         JSL   L0726F9
         PLA
         LSR
         BCC   L20112F
         PEI   $F6
         PEI   $F4
         PEI   $AD
         PEI   $AB
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         JSL   L160ABC
         BRA   L201139
L20112F  PEA   $0080
         JSL   L1609F8
         BRL   L20166B
L201139  LDY   #$0030
         LDA   [$F8],Y
         PHA
         LDY   #$0032
         LDA   [$F8],Y
         JSL   L150BEE
         PLA
         STA   $D3
         LDA   $D3
         BNE   L201159
         PEA   $130C
         JSL   L1609F8
         BRL   L20166B
L201159  PEI   $C5
         PEI   $C3
         LDA   $C7
         LDX   $C9
         JSL   L1512A5
         INC
         BNE   L201169
         INX
L201169  STA   $CD
         LDA   $D3
         SEC
         SBC   #$0001
         BEQ   L201198
         BVS   L201178
         EOR   #$8000
L201178  BPL   L201198
         PHY
         PEA   $0001
         LDA   $CD
         DEC
         PHA
         JSL   L072FA6
         PLA
         STA   $DB
         PEI   $DB
         PEI   $D3
         JSL   L1500F5
         PLX
         PLX
         INC
         STA   $DB
         BRA   L20119C
L201198  LDA   $CD
         STA   $DB
L20119C  LDA   $DB
         STA   $D9
         LDA   #$0001
         STA   $DD
         LDA   $DD
         JSL   L150488
         STA   $BF
         STX   $C1
         LDA   $DB
         JSL   L150488
         STA   $BB
         STX   $BD
         LDA   L055327
         LDX   L055329
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         CLC
         ADC   #$0050
         BCC   L2011D2
         INX
L2011D2  TXY
         LDX   #$FEF7
         STA   $00,X
         TYA
         STA   $02,X
         PHY
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         LDX   #$FEF7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $E9
         STX   $EB
         LDA   [$E9]
         JSL   L150488
         PHX
         PHA
         LDX   #$FEF7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L201215
         INX
L201215  STA   $E9
         STX   $EB
         LDA   [$E9]
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PHD
         JSL   L200BBA
         PLA
         LSR
         BCC   L201237
         PEA   $130D
         JSL   L1609F8
         BRL   L20166B
L201237  LDX   #$FEF7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $E9
         STX   $EB
         LDA   #$0001
         STA   [$E9]
         LDX   #$FEF7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L201259
         INX
L201259  STA   $E9
         STX   $EB
         LDA   #$03E7
         STA   [$E9]
         LDX   #$FEF7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L201272
         INX
L201272  STA   $E9
         STX   $EB
         LDA   #L160ACA
         LDX   #^L160ACA
         STA   [$E9]
         TXA
         LDY   #$0002
         STA   [$E9],Y
         STZ   L055341
         STZ   L055343
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L1511B6
         PLA
         STA   $E5
         LDA   $BF
         STA   $DD
         LDA   $BB
         STA   $DB
         LDA   $DD
         STA   $DF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFFB
         PHA
         JSL   L160AD8
         PEA   $0000
         JSL   L1609F8
         PEA   $0000
         TDC
         CLC
         ADC   #$FEFB
         PHA
         JSL   L160AE6
         LDA   $E3
         BNE   L2012EC
         LDA   #$0000
         STAL  L0551AD
         PHY
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L151287
         PLA
         STA   $B3
         PLX
         STX   $B5
L2012EC  JSL   L160AF4
         JSL   L201997
         PHY
         JSL   L160A06
         PLA
         BEQ   L2012FF
         BRL   L2015E3
L2012FF  PEA   $0000
         PEA   $0001
         PEI   $DF
         JSL   L2016A8
         LDA   $D9
         CMP   $DF
         BNE   L201331
         PEI   $CD
         PEI   $D3
         JSL   L150318
         PLX
         PLX
         STA   $D7
         LDA   $D7
         BEQ   L201329
         LDA   $D7
         ASL
         ASL
         STA   $D7
         BRA   L20132F
L201329  LDA   $D3
         ASL
         ASL
         STA   $D7
L20132F  BRA   L201337
L201331  LDA   $D3
         ASL
         ASL
         STA   $D7
L201337  LDA   $DF
         DEC
         PEI   $D3
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L20134A
         DEX
L20134A  PHX
         PHA
         LDX   $C9
         LDA   $C7
         BNE   L201353
         DEX
L201353  DEC
         JSL   L150F53
         STA   $D1
         STZ   $CF
         LDA   $E3
         BEQ   L201381
         LDA   #$0000
         STAL  L0551AD
         PHY
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L151287
         PLA
         STA   $B3
         PLX
         STX   $B5
L201381  PEI   $B5
         PEI   $B3
         PEA   $0000
         PEA   $0000
         JSL   L1511A4
         JSL   L160AF4
         JSL   L160ACA
         PHY
         JSL   L160A06
         PLA
         BEQ   L2013A2
         BRL   L201530
L2013A2  PEI   $B5
         PEI   $B3
         JSL   L151131
         JSL   L160B02
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
         PEA   $0000
         TDC
         CLC
         ADC   #$FFFB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         LDA   $DF
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0005
         JSL   L0313BE
         LDAL  L051F22
         BEQ   L201416
         PEA   ^L051F22
         PEA   L051F22
         LDA   L05532F
         LDX   L055331
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         PHX
         PHA
         LDA   #$0008
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L20140C
         INX
L20140C  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L200CC2
L201416  LDA   $CF
         INC
         STA   $CF
         JSL   L160ACA
         PHY
         JSL   L160A06
         PLA
         BEQ   L20142A
         BRL   L201530
L20142A  LDA   $CF
         DEC
         ASL
         ASL
         INC
         PHA
         PEI   $D7
         PEA   $0000
         JSL   L2016A8
         LDA   $CF
         CLC
         ADC   $D1
         STA   $D5
         PEA   $0000
         PHD
         JSL   L200936
         JSL   L160ACA
         PHY
         JSL   L160A06
         PLA
         BEQ   L201458
         BRL   L201530
L201458  LDA   $CF
         DEC
         ASL
         ASL
         INC
         INC
         PHA
         PEI   $D7
         PEA   $0000
         JSL   L2016A8
         PHY
         PHY
         PEI   $F6
         PEI   $F4
         PEI   $AD
         PEI   $AB
         LDA   $D5
         JSL   L150488
         PHX
         PHA
         JSL   L2003E2
         PLA
         STA   $AF
         PLX
         STX   $B1
         LDA   $E7
         BEQ   L201493
         PEA   $0000
         PHD
         JSL   L200778
         BRA   L20149B
L201493  PEA   $0000
         PHD
         JSL   L2007D5
L20149B  PEI   $C5
         PEI   $C3
         LDA   $D5
         JSL   L150488
         JSL   L033477
         BNE   L2014BA
         PEA   $0001
         PEA   $0001
         PEA   $0000
         JSL   L2016A8
         BRA   L2014E1
L2014BA  JSL   L160ACA
         PHY
         JSL   L160A06
         PLA
         BNE   L201530
         LDA   $CF
         DEC
         ASL
         ASL
         INC
         INC
         INC
         PHA
         PEI   $D7
         PEA   $0000
         JSL   L2016A8
         LDA   $D3
         CMP   $CF
         BEQ   L2014E1
         BRL   L201416
L2014E1  LDAL  L051FF3
         BEQ   L201516
         PEA   ^L051FF3
         PEA   L051FF3
         LDA   L05532B
         LDX   L05532D
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         PHX
         PHA
         LDA   #$0010
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L20150C
         INX
L20150C  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L200CC2
L201516  JSL   L160ACA
         PHY
         JSL   L160A06
         PLA
         BNE   L201530
         LDA   $CF
         ASL
         ASL
         PHA
         PEI   $D7
         PEA   $0000
         JSL   L2016A8
L201530  PEI   $B5
         PEI   $B3
         JSL   L15149C
         LDA   $E3
         BEQ   L2015AA
         PEI   $B5
         PEI   $B3
         JSL   L1513E8
         PHY
         JSL   L160A06
         PLA
         BNE   L2015A3
         PHY
         PHY
         JSL   L15042E
         LDA   #$2800
         LDX   #$0000
         JSL   L033477
         BEQ   L201565
         BVS   L201563
         EOR   #$8000
L201563  BMI   L201569
L201565  JSL   L15059E
L201569  PHY
         PHY
         JSL   L15042E
         LDA   #$2800
         LDX   #$0000
         JSL   L033477
         BEQ   L20159C
         BVS   L201580
         EOR   #$8000
L201580  BPL   L20159C
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505CE
         BRA   L2015A3
L20159C  PEA   $1309
         JSL   L1609F8
L2015A3  LDA   #$0001
         STAL  L0551AD
L2015AA  JSL   L160AF4
         LDA   $DF
         INC
         STA   $DF
         LDA   $DF
         SEC
         SBC   $DB
         BEQ   L2015C1
         BVS   L2015BF
         EOR   #$8000
L2015BF  BMI   L2015C6
L2015C1  LDA   #$0000
         BRA   L2015C9
L2015C6  LDA   #$0001
L2015C9  PHA
         PHY
         JSL   L160A06
         PLA
         BNE   L2015D7
         LDA   #$0000
         BRA   L2015DA
L2015D7  LDA   #$0001
L2015DA  ORA   $01,S
         PLX
         LSR
         BCS   L2015E3
         BRL   L2012FF
L2015E3  LDA   $E3
         BNE   L2015F6
         PEI   $B5
         PEI   $B3
         JSL   L1513E8
         LDA   #$0001
         STAL  L0551AD
L2015F6  JSL   L160AF4
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L072634
         STZ   L055341
         STZ   L055343
         LDA   L055027
         LDX   L055029
         STA   $AF
         STX   $B1
         LDA   L05501F
         LDX   L055021
         STA   $AB
         STX   $AD
         LDA   L055027
         LDX   L055029
         CMP   $39
         BNE   L20162C
         CPX   $3B
L20162C  BEQ   L20163F
         PHY
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $E5
L20163F  LDA   L055027
         LDX   L055029
         CMP   $AF
         BNE   L20164B
         CPX   $B1
L20164B  BEQ   L201650
         STZ   L055139
L201650  LDA   L05501F
         LDX   L055021
         CMP   $AB
         BNE   L20165C
         CPX   $AD
L20165C  BEQ   L201661
         STZ   L055135
L201661  PEA   ^L053259
         PEA   L053259
         JSL   L085216
L20166B  STZ   L054FB3
         PHY
         JSL   L160A06
         PLA
         BEQ   L20167B
         LDA   #$0000
         BRA   L20167E
L20167B  LDA   #$0001
L20167E  STA   $FC
         PEI   $B9
         PEI   $B7
         JSL   L151131
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEI   $E1
         JSL   L160B10
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0216
         TCS
         RTL

L2016A8  PHD
         TSC
         CLC
         ADC   #$FDB9
         TCS
         ADC   #$0156
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L151131
         LDA   $F6
         BNE   L2016D2
         BRL   L201775
L2016D2  TDC
         CLC
         ADC   #$00D2
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBA
         PHA
         LDA   $F6
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0005
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD2
         PHA
         PHY
         PHY
         PEA   $083C
         JSL   L0711EB
         TDC
         CLC
         ADC   #$00D2
         PEA   $0000
         PHA
         PHY
         PHY
         PEA   $083D
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FED2
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         PHY
         PHY
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         PEA   $0003
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         PEI   $E1
         PEI   $E3
         JSL   L1510C5
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L15123D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD2
         PHA
         JSL   L150592
L201775  PHY
         PHY
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         PEA   $0001
         JSL   L073032
         LDX   #$FECE
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDA   $FA
         BNE   L201796
         BRL   L201873
L201796  PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAC
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB8
         PHA
         LDA   $FA
         LDX   #$FECC
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FECC
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC2
         PHA
         PEA   $040E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC2
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB6
         PHA
         LDA   $F8
         LDX   #$FEB6
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB8
         PHA
         PEA   $0406
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB8
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAA
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L201829
         INX
L201829  STA   $ED
         STX   $EF
         LDA   [$ED]
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L201840
         INX
L201840  STA   $ED
         STX   $EF
         PLA
         SEC
         SBC   [$ED]
         LDX   #$FEAA
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAC
         PHA
         PEA   $0404
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAC
         PHA
         JSL   L150018
         PLA
         PLX
         STA   $EB
         BRA   L201875
L201873  STZ   $EB
L201875  TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L20188E
         INX
L20188E  STA   $ED
         STX   $EF
         LDA   [$ED]
         INC
         INC
         PHA
         LDX   #$FECE
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDA   [$ED]
         INC
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2018BA
         INX
L2018BA  STA   $ED
         STX   $EF
         LDA   $EB
         CLC
         ADC   [$ED]
         DEC
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L2018D5
         INX
L2018D5  STA   $ED
         STX   $EF
         LDA   [$ED]
         DEC
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2018FA
         INX
L2018FA  STA   $ED
         STX   $EF
         LDA   $EB
         CLC
         ADC   [$ED]
         INC
         INC
         PHA
         LDX   #$FECE
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDA   [$ED]
         INC
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L201929
         INX
L201929  STA   $ED
         STX   $EF
         LDA   [$ED]
         DEC
         DEC
         PHA
         LDX   #$FECE
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L201942
         INX
L201942  STA   $ED
         STX   $EF
         LDA   [$ED]
         DEC
         PHA
         JSL   L15100B
         PEA   $4444
         JSL   L081DD8
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $0000
         JSL   L081DD8
         PEI   $E9
         PEI   $E7
         JSL   L151131
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$024F
         TCS
         RTL

L201997  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         PEA   $40D8
         JSL   L072834
         PLA
         STA   L055341
         PLA
         STA   L055343
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L15102F
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L1511C8
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L151131
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L1506B3
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L1517CD
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L1506AD
         JSL   L160ACA
         PEI   $03
         PEI   $01
         JSL   L151131
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

