*
* HypercardGS
* segment: $15 PLib
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   PLib.l
         lst   off

*---------------------------------------

         use   PLib.E
         use   PLib.X

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

L150000  ENT
         LDX   #$1C22
         JMP   L1506D8

L150006  ENT
         LDX   #$1D22
         JMP   L1506D8

L15000C  ENT
         LDX   #$1302
         JMP   L1506D8

L150012  ENT
         LDX   #$191E
         JMP   L1506D8

L150018  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $18
         PEI   $16
         PEA   $000A
         JSL   L0313BE
         PHY
         JSL   L150E95
         PLA
         STA   $0B
         PEA   $0003
         JSL   L150DD8
         PHY
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150082
         PLA
         STA   $1A
         PLX
         STX   $1C
         PEI   $0B
         JSL   L150DD8
         LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L150070  ENT
         LDX   #$0A06
         JMP   L151442

L150076  ENT
         LDX   #$0C14
         JMP   L1506D8

L15007C  ENT
         LDX   #$110B
         JMP   L1506D8

L150082  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $1A
         PEI   $18
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0310
         _SANEFP816
         BCS   L1500BF
         LDA   #$0000
L1500BF  STAL  L05565D
         LDA   $0B
         LDX   $0D
         STA   $1C
         STX   $1E
         LDA   $16
         STA   $1A
         LDA   $15
         STA   $19
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L1500DD  ENT
         LDX   #$130B
         JMP   L1506D8

L1500E3  ENT
         LDX   #$5204
         JMP   L151442

L1500E9  ENT
         LDX   #$091C
         JMP   L1506D8

L1500EF  ENT
         LDX   #$101C
         JMP   L1506D8

L1500F5  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEI   $FD
         LDA   $FF
         SEC
         JSL   L032F1F
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L150114  ENT
         LDX   #$2422
         JMP   L1506D8

L15011A  ENT
         LDX   #$2322
         JMP   L1506D8

L150120  ENT
         LDX   #$2802
         JMP   L1506D8

L150126  ENT
         LDX   #$6C04
         JMP   L1506D8

L15012C  ENT
         LDX   #$160B
         JMP   L1506D8

L150132  ENT
         LDX   #$2A10
         JMP   L1506D8

L150138  ENT
         LDX   #$2B10
         JMP   L1506D8

L15013E  ENT
         LDX   #$1922
         JMP   L1506D8

L150144  ENT
         LDX   #$270F
         JMP   L1506D8

L15014A  ENT
         PHD
         TSC
         TCD
         PHA
         PHA
         PHA
         PHA
         _ReadTimeHex
         BCS   L15015D
         LDA   #$0000
L15015D  STAL  L05565D
         PLA
         STA   [$06]
         PLA
         LDY   #$0002
         STA   [$06],Y
         PLA
         LDY   #$0004
         STA   [$06],Y
         PLA
         LDY   #$0006
         STA   [$06],Y
         PLD
         RTL

L150178  ENT
         LDX   #$9604
         JMP   L1506D8

L15017E  ENT
         LDA   $04,S
         AND   $08,S
         STA   $0C,S
         LDA   $06,S
         AND   $0A,S
         STA   $0E,S
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         PLA
         PLA
         PLA
         PLA
         RTL

L150197  ENT
         LDX   #$A404
         JMP   L1506D8

L15019D  ENT
         LDX   #$1314
         JMP   L1506D8

L1501A3  ENT
         LDX   #$C204
         JMP   L1506D8

L1501A9  ENT
         LDX   #$5104
         JMP   L151442

L1501AF  ENT
         LDX   #$4B04
         JMP   L1506D8

L1501B5  ENT
         LDX   #$0C12
         JMP   L1506D8

L1501BB  ENT
         LDX   #$5C04
         JMP   L1506D8

L1501C1  ENT
         PHD
         TSC
         CLC
         ADC   #$FED7
         TCS
         ADC   #$0036
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCA
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDA   #$0001
         STA   $ED
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCA
         PHA
         TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00CC
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00CA
         PEA   $0000
         PHA
         JSL   L1515CE
         PEI   $FE
         PEI   $FC
         TDC
         CLC
         ADC   #$00CC
         PEA   $0000
         PHA
         JSL   L033095
         TAY
         CLC
         TSC
         ADC   #$0004
         TCS
         TYA
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$012F
         TCS
         RTL

L150241  ENT
         LDA   $04,S
         ORA   $08,S
         STA   $0C,S
         LDA   $06,S
         ORA   $0A,S
         STA   $0E,S
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         PLA
         PLA
         PLA
         PLA
         RTL

L15025A  ENT
         LDX   #$D604
         JMP   L1506D8

L150260  ENT
         LDX   #$1A04
         JMP   L1506D8

L150266  ENT
         LDX   #$1A0E
         JMP   L1506D8

L15026C  ENT
         LDX   #$0D14
         JMP   L1506D8

L150272  ENT
         LDX   #$1122
         JMP   L1506D8

L150278  ENT
         LDX   #$120E
         JMP   L1506D8

L15027E  ENT
         LDX   #$090E
         JMP   L1506D8

L150284  ENT
         LDX   #$9804
         JMP   L1506D8

L15028A  ENT
         LDX   #$9904
         JMP   L1506D8

L150290  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $FB
         PEI   $F9
         LDX   $FF
         LDA   $FD
         SEC
         JSL   L032FA4
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L1502B4  ENT
         PHD
         TSC
         TCD
         LDA   $06
         AND   #$003F
         TAY
         LDA   $08
         BRA   L1502C4
L1502C1  ASL
         ROL   $0A
L1502C4  DEY
         BPL   L1502C1
         STA   $0C
         LDA   $0A
         STA   $0E
         LDA   $04
         STA   $0A
         LDA   $03
         STA   $09
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         RTL

L1502DC  ENT
         LDX   #$211E
         JMP   L1506D8

L1502E2  ENT
         LDX   #$0217
         JMP   L1506D8

L1502E8  ENT
         LDX   #$3E0F
         JMP   L1506D8

L1502EE  ENT
         LDX   #$1E1E
         JMP   L1506D8

L1502F4  ENT
         LDX   #$BB04
         JMP   L1506D8

L1502FA  ENT
         LDX   #$B704
         JMP   L1506D8

L150300  ENT
         LDX   #$0F04
         JMP   L1506D8

L150306  ENT
         LDX   #$0E04
         JMP   L1506D8

L15030C  ENT
         LDX   #$C004
         JMP   L1506D8

L150312  ENT
         LDX   #$0D04
         JMP   L1506D8

L150318  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEI   $FD
         LDA   $FF
         SEC
         JSL   L032F1F
         PLA
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L150337  ENT
         PHD
         TSC
         TCD
         LDA   $06
         AND   #$003F
         TAY
         LDA   $0A
         BRA   L150347
L150344  LSR
         ROR   $08
L150347  DEY
         BPL   L150344
         STA   $0E
         LDA   $08
         STA   $0C
         LDA   $04
         STA   $0A
         LDA   $03
         STA   $09
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         RTL

L15035F  ENT
         LDX   #$2503
         JMP   L1506D8

L150365  ENT
         LDX   #$2910
         JMP   L151442

L15036B  ENT
         LDX   #$0F0B
         JMP   L1506D8

L150371  ENT
         LDX   #$0B1C
         JMP   L1506D8

L150377  ENT
         LDX   #$2B0F
         JMP   L1506D8

L15037D  ENT
         LDX   #$5404
         JMP   L1506D8

L150383  ENT
         LDX   #$5604
         JMP   L1506D8

L150389  ENT
         LDX   #$3C0F
         JMP   L1506D8

L15038F  ENT
         LDX   #$3813
         JMP   L1506D8

L150395  ENT
         LDX   #$0B16
         JMP   L1506D8

L15039B  ENT
         LDX   #$3A0F
         JMP   L1506D8

L1503A1  ENT
         LDX   #$1B02
         JMP   L1506D8

L1503A7  ENT
         LDX   #$130F
         JMP   L1506D8

L1503AD  ENT
         LDX   #$0A0F
         JMP   L1506D8

L1503B3  ENT
         LDX   #$1B05
         JMP   L1506D8

L1503B9  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $FB
         PEI   $F9
         LDX   $FF
         LDA   $FD
         SEC
         JSL   L032FA4
         PLA
         PLX
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L1503DD  ENT
         PHD
         TSC
         TCD
         STZ   $0E
         LDY   #$0000
         TYA
         SEP   #$20
         LDA   [$0A]
         CMP   [$06]
         BNE   L1503FC
         TAY
         BEQ   L1503FA
L1503F1  LDA   [$0A],Y
         CMP   [$06],Y
         BNE   L1503FC
         DEY
         BNE   L1503F1
L1503FA  INC   $0E
L1503FC  REP   #$20
         LDA   $03
         STA   $0B
         LDA   $04
         STA   $0C
         LDA   $01
         STA   $09
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L150410  ENT
         LDX   #$181E
         JMP   L1506D8

L150416  ENT
         LDX   #$231E
         JMP   L1506D8

L15041C  ENT
         LDX   #$0E1E
         JMP   L1506D8

L150422  ENT
         LDX   #$0C1E
         JMP   L1506D8

L150428  ENT
         LDX   #$0A1B
         JMP   L1506D8

L15042E  ENT
         LDX   #$1C02
         JMP   L1506D8

L150434  ENT
         PHD
         TSC
         TCD
         LDA   #$0001
         STA   $0E
         LDY   #$0000
         TYA
         SEP   #$20
         LDA   [$0A]
         CMP   [$06]
         BNE   L150456
         TAY
         BEQ   L150454
L15044B  LDA   [$0A],Y
         CMP   [$06],Y
         BNE   L150456
         DEY
         BNE   L15044B
L150454  DEC   $0E
L150456  REP   #$20
         LDA   $03
         STA   $0B
         LDA   $04
         STA   $0C
         LDA   $01
         STA   $09
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L15046A  ENT
         LDX   #$C404
         JMP   L1506D8

L150470  ENT
         LDX   #$0B04
         JMP   L1506D8

L150476  ENT
         LDX   #$7F04
         JMP   L1506D8

L15047C  ENT
         LDX   #$0B12
         JMP   L1506D8

L150482  ENT
         LDX   #$1310
         JMP   L1506D8

L150488  ENT
         TAX
         BMI   L15048F
         LDX   #$0000
         RTL

L15048F  LDX   #$FFFF
         RTL

L150493  ENT
         LDX   #$1C04
         JMP   L1506D8

L150499  ENT
         LDX   #$7104
         JMP   L1506D8

L15049F  ENT
         LDX   #$0F17
         JMP   L1506D8

L1504A5  ENT
         LDX   #$1117
         JMP   L1506D8

L1504AB  ENT
         LDX   #$430E
         JMP   L1506D8

L1504B1  ENT
         LDX   #$1513
         JMP   L1506D8

L1504B7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEI   $24
         PEI   $22
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $20
         PEI   $1E
         PEA   $000A
         JSL   L0313BE
         PEI   $28
         PEI   $26
         TDC
         CLC
         ADC   #$0001
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
         TDC
         CLC
         ADC   #$000B
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
         JSL   L0337F3
         TAY
         CLC
         TSC
         ADC   #$0014
         TCS
         TYA
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   $1C
         STA   $24
         LDA   $1B
         STA   $23
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L150550  ENT
         LDX   #$2122
         JMP   L1506D8

L150556  ENT
         LDX   #$B804
         JMP   L1506D8

L15055C  ENT
         LDX   #$5904
         JMP   L1506D8

L150562  ENT
         LDX   #$3713
         JMP   L1506D8

L150568  ENT
         LDX   #$1705
         JMP   L1506D8

L15056E  ENT
         LDX   #$3D04
         JMP   L1506D8

L150574  ENT
         LDX   #$520E
         JMP   L1506D8

L15057A  ENT
         LDX   #$180B
         JMP   L1506D8

L150580  ENT
         LDX   #$0D06
         JMP   L151442

L150586  ENT
         LDX   #$1A02
         JMP   L1506D8

L15058C  ENT
         LDX   #$1514
         JMP   L1506D8

L150592  ENT
         LDX   #$A504
         JMP   L1506D8

L150598  ENT
         LDX   #$2003
         JMP   L1506D8

L15059E  ENT
         LDX   #$1F02
         JMP   L1506D8

L1505A4  ENT
         LDX   #$0C1C
         JMP   L1506D8

L1505AA  ENT
         LDX   #$1A15
         JMP   L1506D8

L1505B0  ENT
         LDX   #$2C0F
         JMP   L1506D8

L1505B6  ENT
         LDX   #$210E
         JMP   L1506D8

L1505BC  ENT
         LDX   #$250F
         JMP   L1506D8

L1505C2  ENT
         LDX   #$2522
         JMP   L1506D8

L1505C8  ENT
         LDX   #$1505
         JMP   L1506D8

L1505CE  ENT
         LDX   #$1213
         JMP   L1506D8

L1505D4  ENT
         LDX   #$1C0F
         JMP   L1506D8

L1505DA  ENT
         LDX   #$3C04
         JMP   L1506D8

L1505E0  ENT
         LDX   #$101B
         JMP   L1506D8

L1505E6  ENT
         LDX   #$0912
         JMP   L1506D8

L1505EC  ENT
         LDX   #$1B10
         JMP   L1506D8

L1505F2  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         LDX   #$0000
         TDC
         CLC
         ADC   #$0101
         STX   $F2
         STA   $F0
         PEI   $FF
         LDA   [$F0]
         SEC
         JSL   L033467
         PLA
         STA   [$F0]
         TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         TSC
         CLC
         ADC   #$0002
         TCS
         TYA
         STA   $04,S
         RTL

L15062F  ENT
         LDX   #$2A02
         JMP   L1506D8

L150635  ENT
         LDX   #$3B04
         JMP   L1506D8

L15063B  ENT
         LDX   #$A904
         JMP   L1506D8

L150641  ENT
         LDX   #$7B04
         JMP   L1506D8

L150647  ENT
         LDX   #$6104
         JMP   L1506D8

L15064D  ENT
         LDX   #$0D16
         JMP   L1506D8

L150653  ENT
         LDX   #$7204
         JMP   L1506D8

L150659  ENT
         LDX   #$6D04
         JMP   L1506D8

L15065F  ENT
         LDX   #$1B15
         JMP   L1506D8

L150665  ENT
         LDX   #$0222
         JMP   L1506D8

L15066B  ENT
         LDX   #$0213
         JMP   L1506D8

L150671  ENT
         LDX   #$0D0F
         JMP   L1506D8

L150677  ENT
         LDX   #$C804
         JMP   L1506D8

L15067D  ENT
         LDX   #$C904
         JMP   L1506D8

L150683  ENT
         LDX   #$BA04
         JMP   L1506D8

L150689  ENT
         LDX   #$0B02
         JMP   L1506D8

L15068F  ENT
         LDX   #$C304
         JMP   L1506D8

L150695  ENT
         LDX   #$1A1B
         JMP   L1506D8

L15069B  ENT
         LDX   #$2014
         JMP   L1506D8

L1506A1  ENT
         LDX   #$1E04
         JMP   L1506D8

L1506A7  ENT
         LDX   #$1D04
         JMP   L1506D8

L1506AD  ENT
         LDX   #$1F0E
         JMP   L1506D8

L1506B3  ENT
         LDX   #$1E0E
         JMP   L1506D8

L1506B9  ENT
         LDA   $04,S
         AND   #$000F
         BEQ   L1506CE
         TAX
         LDA   $06,S
L1506C3  LSR
         BCC   L1506C9
         ORA   #$8000
L1506C9  DEX
         BNE   L1506C3
         STA   $06,S
L1506CE  LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLY
         RTL

L1506D8  JSL   DISPATCH2
         STAL  L05565D
         RTL

L1506E1  ENT
         LDX   #$251E
         JMP   L1506D8

L1506E7  ENT
         LDX   #$0313
         JMP   L1506D8

L1506ED  ENT
         LDX   #$0322
         JMP   L1506D8

L1506F3  ENT
         LDX   #$AB04
         JMP   L1506D8

L1506F9  ENT
         LDX   #$2310
         JMP   L1506D8

L1506FF  ENT
         LDX   #$2210
         JMP   L1506D8

L150705  ENT
         LDX   #$8604
         JMP   L1506D8

L15070B  ENT
         LDX   #$1D02
         JMP   L1506D8

L150711  ENT
         LDX   #$9004
         JMP   L1506D8

L150717  ENT
         LDX   #$2A04
         JMP   L1506D8

L15071D  ENT
         LDX   #$2B04
         JMP   L1506D8

L150723  ENT
         LDX   #$1A14
         JMP   L1506D8

L150729  ENT
         LDX   #$170B
         JMP   L1506D8

L15072F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCD
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $3F
         PEI   $3D
         PEA   $000A
         JSL   L0313BE
         LDA   $41
         STA   $0B
         LDA   $43
         STA   $0D
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $000B
         _SANEFP816
         BCS   L15077D
         LDA   #$0000
L15077D  STAL  L05565D
         PHA
         TDC
         CLC
         ADC   #$0013
         PEA   $0000
         PHA
         PEA   ^L055661
         PEA   L055661
         JSL   L1503DD
         PLA
         LSR
         BCC   L1507CE
         LDA   #$0013
         STA   $0D
         STZ   $0B
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $000B
         _SANEFP816
         BCS   L1507CA
         LDA   #$0000
L1507CA  STAL  L05565D
L1507CE  PEI   $0D
         PEI   $0B
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEI   $3B
         PEI   $39
         JSL   L151391
         LDA   $37
         STA   $43
         LDA   $36
         STA   $42
         LDA   $34
         TCD
         TSC
         CLC
         ADC   #$0041
         TCS
         RTL

L1507F5  ENT
         LDX   #$D004
         JMP   L1506D8

L1507FB  ENT
         LDX   #$D104
         JMP   L1506D8

L150801  ENT
         LDX   #$0C06
         JMP   L1506D8

L150807  ENT
         LDX   #$2314
         JMP   L1506D8

L15080D  ENT
         PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00D4
         TCS
         LDA   $F7
         LDX   #$0000
         TAY
         BPL   L150821
         DEX
L150821  PHX
         PHA
         LDX   $FB
         LDA   $F9
         CLC
         ADC   #$0001
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         SEC
         JSL   L033930
         PLA
         PLX
         SEC
         SBC   #$0001
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STA   $D8
         LDA   #$0008
         PHA
         LDA   $D8
         SEC
         JSL   L032F1F
         PLY
         STA   $E0
         LDA   #$0008
         PHA
         LDA   $D8
         SEC
         JSL   L032F1F
         PLA
         STA   $DE
         LDA   $E0
         LDX   #$0000
         TAY
         BPL   L15086B
         DEX
L15086B  PHX
         PHA
         LDX   $FF
         LDA   $FD
         JSL   L0338DC
         PLA
         PLX
         STX   $FF
         STA   $FD
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $F7
         LDX   #$0000
         TAY
         BPL   L15088C
         DEX
L15088C  SEC
         JSL   L0337CC
         LDA   #L0555BB
         LDX   #^L0555BB
         JSL   L0338DC
         PLA
         PLX
         SEC
         SBC   #$0002
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STX   $E8
         STA   $E6
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $DE
         LDX   #$0000
         TAY
         BPL   L1508BD
         DEX
L1508BD  SEC
         JSL   L0337CC
         LDA   #L0555BB
         LDX   #^L0555BB
         JSL   L0338DC
         PLA
         PLX
         STX   $E4
         STA   $E2
         LDA   $F7
         STA   $DC
         BRL   L1509AE
L1508D9  LDX   $E8
         LDA   $E6
         PHX
         PHA
         SEC
         SBC   #$0002
         STA   $E6
         LDA   $E8
         SBC   #$0000
         STA   $E8
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         PHA
         LDA   $F5
         PLX
         STX   $EE
         AND   $EE
         STA   $D6
         LDA   $D6
         BEQ   L150930
         LDX   $E4
         LDA   $E2
         PHX
         PHA
         SEC
         SBC   #$0002
         STA   $E2
         LDA   $E4
         SBC   #$0000
         STA   $E4
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         PHA
         LDA   [$FD]
         AND   #$00FF
         PLX
         STX   $EE
         ORA   $EE
         SEP   #$20
         STA   [$FD]
         REP   #$20
         BRA   L15095F
L150930  LDX   $E4
         LDA   $E2
         PHX
         PHA
         SEC
         SBC   #$0002
         STA   $E2
         LDA   $E4
         SBC   #$0000
         STA   $E4
         PLA
         PLX
         STA   $EA
         STX   $EC
         LDA   [$EA]
         EOR   #$FFFF
         PHA
         LDA   [$FD]
         AND   #$00FF
         PLX
         STX   $EE
         AND   $EE
         SEP   #$20
         STA   [$FD]
         REP   #$20
L15095F  DEC   $DE
         LDA   $DE
         SEC
         SBC   #$0000
         BVS   L15096C
         EOR   #$8000
L15096C  BMI   L1509AC
         LDA   #$0007
         STA   $DE
         LDX   #$0000
         LDA   #$0001
         PHX
         PHA
         LDA   $DE
         LDX   #$0000
         TAY
         BPL   L150984
         DEX
L150984  SEC
         JSL   L0337CC
         LDA   #L0555BB
         LDX   #^L0555BB
         JSL   L0338DC
         PLA
         PLX
         STX   $E4
         STA   $E2
         LDX   $FF
         LDA   $FD
         SEC
         SBC   #$0001
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         STX   $FF
         STA   $FD
L1509AC  DEC   $DC
L1509AE  LDA   $DC
         CMP   #$0000
         BEQ   L1509B8
         BRL   L1508D9
L1509B8  TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         LDA   $02,S
         STA   $0E,S
         LDA   $01,S
         STA   $0D,S
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L1509CE  ENT
         PHD
         TSC
         SEC
         SBC   #$000A
         TCD
         SEC
         SBC   #$0100
         TCS
         LDX   #$FF01
         STX   $01
         LDA   $10
         STA   $09
L1509E3  LDA   $10
         BEQ   L150A18
         DEC   $10
         ASL
         ASL
         TAX
         LDA   $12,X
         STA   $03
         LDA   $14,X
         STA   $05
         LDA   [$03]
         AND   #$00FF
         BEQ   L1509E3
         STA   $07
         LDY   #$0001
         LDX   $01
         SEP   #$20
L150A04  LDA   [$03],Y
         STA   $01,X
         INX
         BEQ   L150A16
         INY
         DEC   $07
         BNE   L150A04
         REP   #$20
         STX   $01
         BRA   L1509E3
L150A16  STX   $01
L150A18  REP   #$20
         LDA   #$00FF
         CLC
         ADC   $01
         SEP   #$20
         LDX   #$FF00
         STA   $01,X
         REP   #$20
         TAY
         LDX   $01
         SEP   #$20
L150A2E  LDA   $00,X
         STA   [$12],Y
         DEX
         DEY
         BPL   L150A2E
         REP   #$20
         LDA   $09
         ASL
         ASL
         TAX
         LDA   $12
         STA   $12,X
         LDA   $14
         STA   $14,X
         LDA   $0D
         STA   $0F,X
         LDA   $0E
         STA   $10,X
         LDA   $0B
         STA   $0D,X
         STX   $07
         TSC
         CLC
         ADC   #$010C
         CLC
         ADC   $07
         TCS
         PLD
         RTL

L150A5E  ENT
         LDX   #$2404
         JMP   L1506D8

L150A64  ENT
         PHD
         TSC
         SEC
         SBC   #$000E
         TCS
         TCD
         LDA   [$18]
         AND   #$00FF
         STA   $0B
         SEC
         SBC   $16
         INC
         STA   $0D
         BEQ   L150AD9
         BMI   L150AD9
         LDA   $16
         BEQ   L150AD9
         BMI   L150AD9
         CMP   #$0100
         BCS   L150AD9
         LDA   $14
         BEQ   L150AD9
         BMI   L150AD9
         CMP   #$0100
         BCS   L150AD9
         LDA   $0D
         SEC
         SBC   $14
         BPL   L150A9D
         LDA   #$0000
L150A9D  STA   $09
         LDA   $16
         CLC
         ADC   $09
         DEC
         SEP   #$20
         STA   [$18]
         REP   #$20
         LDA   $09
         BEQ   L150AD9
         LDA   $18
         LDX   $1A
         CLC
         ADC   $16
         BCC   L150AB9
         INX
L150AB9  STA   $05
         STX   $07
         CLC
         ADC   $14
         BCC   L150AC3
         INX
L150AC3  STA   $01
         STX   $03
         LDX   $09
         DEX
         LDY   #$0000
         SEP   #$20
L150ACF  LDA   [$01],Y
         STA   [$05],Y
         INY
         DEX
         BPL   L150ACF
         REP   #$20
L150AD9  LDA   $12
         STA   $1A
         LDA   $11
         STA   $19
         LDX   $0F
         TDC
         CLC
         ADC   #$0018
         TCS
         TXA
         TCD
         RTL

L150AEC  ENT
         LDX   #$1B22
         JMP   L1506D8

L150AF2  ENT
         LDX   #$2610
         JMP   L1506D8

L150AF8  ENT
         LDX   #$0F10
         JMP   L1506D8

L150AFE  ENT
         LDX   #$0E10
         JMP   L1506D8

L150B04  ENT
         LDX   #$1610
         JMP   L1506D8

L150B0A  ENT
         LDX   #$1510
         JMP   L1506D8

L150B10  ENT
         LDX   #$1110
         JMP   L1506D8

L150B16  ENT
         LDX   #$1810
         JMP   L1506D8

L150B1C  ENT
         LDX   #$0F16
         JMP   L1506D8

L150B22  ENT
         LDX   #$0C22
         JMP   L1506D8

L150B28  ENT
         LDX   #$1506
         JMP   L1506D8

L150B2E  ENT
         LDX   #$8304
         JMP   L151442

L150B34  ENT
         LDX   #$3A0E
         JMP   L1506D8

L150B3A  ENT
         LDX   #$4D04
         JMP   L151442

L150B40  ENT
         LDX   #$8B04
         JMP   L1506D8

L150B46  ENT
         LDX   #$1901
         JMP   L1506D8

L150B4C  ENT
         LDX   #$310F
         JMP   L1506D8

L150B52  ENT
         LDX   #$300F
         JMP   L1506D8

L150B58  ENT
         LDX   #$1822
         JMP   L1506D8

L150B5E  ENT
         LDX   #$0B1E
         JMP   L1506D8

L150B64  ENT
         LDX   #$0A1E
         JMP   L1506D8

L150B6A  ENT
         LDX   #$121E
         JMP   L1506D8

L150B70  ENT
         LDX   #$111E
         JMP   L1506D8

L150B76  ENT
         LDX   #$1414
         JMP   L1506D8

L150B7C  ENT
         LDX   #$0D1E
         JMP   L1506D8

L150B82  ENT
         LDX   #$091E
         JMP   L1506D8

L150B88  ENT
         LDX   #$151E
         JMP   L1506D8

L150B8E  ENT
         LDX   #$110F
         JMP   L1506D8

L150B94  ENT
         LDX   #$590E
         JMP   L1506D8

L150B9A  ENT
         LDX   #$170E
         JMP   L1506D8

L150BA0  ENT
         LDX   #$150E
         JMP   L1506D8

L150BA6  ENT
         LDX   #$0404
         JMP   L1506D8

L150BAC  ENT
         LDX   #$221E
         JMP   L1506D8

L150BB2  ENT
         LDX   #$6704
         JMP   L1506D8

L150BB8  ENT
         LDX   #$2002
         JMP   L1506D8

L150BBE  ENT
         LDX   #$261E
         JMP   L1506D8

L150BC4  ENT
         LDX   #$0F1B
         JMP   L1506D8

L150BCA  ENT
         LDX   #$1222
         JMP   L1506D8

L150BD0  ENT
         LDX   #$1714
         JMP   L1506D8

L150BD6  ENT
         LDX   #$2E04
         JMP   L1506D8

L150BDC  ENT
         LDX   #$2F04
         JMP   L1506D8

L150BE2  ENT
         LDX   #$0B0B
         JMP   L1506D8

L150BE8  ENT
         LDX   #$8504
         JMP   L1506D8

L150BEE  ENT
         SEC
         PHD
         PHA
         TSC
         TCD
         LDX   #$0000
         BCC   L150C14
         LDA   $08
         BIT   #$8000
         BEQ   L150C06
         EOR   #$FFFF
         INC
         STA   $08
         INX
L150C06  LDA   $01
         BIT   #$8000
         BEQ   L150C14
         EOR   #$FFFF
         INC
         STA   $01
         DEX
L150C14  LDA   #$0000
         BRA   L150C22
L150C19  LSR   $01
         BCC   L150C20
         CLC
         ADC   $08
L150C20  ASL   $08
L150C22  LDY   $01
         BNE   L150C19
         CPX   #$0000
         BEQ   L150C2F
         EOR   #$FFFF
         INC
L150C2F  STA   $08
         PLY
         PLD
         RTL

L150C34  ENT
         LDX   #$1214
         JMP   L1506D8

L150C3A  ENT
         LDX   #$191B
         JMP   L1506D8

L150C40  ENT
         LDX   #$1114
         JMP   L1506D8

L150C46  ENT
         LDX   #$090B
         JMP   L1506D8

L150C4C  ENT
         PHD
         TSC
         SEC
         SBC   #$000E
         TCS
         TCD
         LDA   [$1A]
         AND   #$00FF
         STA   $0B
         INC   $1A
         BNE   L150C61
         INC   $1C
L150C61  LDA   [$16]
         AND   #$00FF
         STA   $0D
         LDA   $14
         BEQ   L150C75
         BMI   L150C75
         DEC
         CMP   $0D
         BEQ   L150C78
         BCC   L150C78
L150C75  BRL   L150D0D
L150C78  LDA   $14
         CLC
         ADC   $0B
         CMP   #$0101
         BCC   L150C95
         LDA   #$0100
         SEC
         SBC   $14
         STA   $0B
         LDA   #$00FF
L150C8D  SEP   #$20
         STA   [$16]
         REP   #$20
         BRA   L150CF0
L150C95  LDA   $0D
         BNE   L150C9D
         LDA   $0B
         BRA   L150C8D
L150C9D  LDA   $0D
         SEC
         SBC   $14
         INC
         STA   $09
         LDA   $0D
         CLC
         ADC   $0B
         CMP   #$0100
         BCC   L150CBF
         SEC
         SBC   #$00FF
         SEC
         SBC   $09
         EOR   #$FFFF
         INC
         STA   $09
         LDA   #$00FF
L150CBF  SEP   #$20
         STA   [$16]
         REP   #$20
         LDA   $09
         BEQ   L150CF0
         LDA   $16
         LDX   $18
         CLC
         ADC   $14
         BCC   L150CD3
         INX
L150CD3  STA   $01
         STX   $03
         CLC
         ADC   $0B
         BCC   L150CDD
         INX
L150CDD  STA   $05
         STX   $07
         SEP   #$20
         LDY   $09
         BRA   L150CEB
L150CE7  LDA   [$01],Y
         STA   [$05],Y
L150CEB  DEY
         BPL   L150CE7
         REP   #$20
L150CF0  LDA   $16
         LDX   $18
         CLC
         ADC   $14
         BCC   L150CFA
         INX
L150CFA  STA   $05
         STX   $07
         SEP   #$20
         LDY   $0B
         BRA   L150D08
L150D04  LDA   [$1A],Y
         STA   [$05],Y
L150D08  DEY
         BPL   L150D04
         REP   #$20
L150D0D  LDA   $12
         STA   $1C
         LDA   $11
         STA   $1B
         LDX   $0F
         TDC
         CLC
         ADC   #$001A
         TCS
         TXA
         TCD
         RTL

L150D20  ENT
         LDX   #$9404
         JMP   L1506D8

L150D26  ENT
         LDX   #$8E04
         JMP   L1506D8

L150D2C  ENT
         LDX   #$0A12
         JMP   L1506D8

L150D32  ENT
         LDX   #$2010
         JMP   L1506D8

L150D38  ENT
         LDX   #$0914
         JMP   L1506D8

L150D3E  ENT
         LDX   #$1B1E
         JMP   L1506D8

L150D44  ENT
         LDX   #$2402
         JMP   L1506D8

L150D4A  ENT
         LDX   #$0E22
         JMP   L1506D8

L150D50  ENT
         SEC
         PHD
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         TSC
         TCD
         LDX   #$0000
         BCC   L150DAC
         LDA   $10
         BIT   #$8000
         BEQ   L150D7A
         EOR   #$FFFF
         STA   $10
         LDA   $0E
         EOR   #$FFFF
         INC
         BNE   L150D77
         INC   $10
L150D77  STA   $0E
         INX
L150D7A  LDA   $07
         BIT   #$8000
         BEQ   L150DAC
         EOR   #$FFFF
         STA   $07
         LDA   $05
         EOR   #$FFFF
         INC
         BNE   L150D90
         INC   $07
L150D90  STA   $05
         DEX
         BRA   L150DAC
L150D95  LSR   $07
         ROR   $05
         BCC   L150DA8
         LDA   $01
         CLC
         ADC   $0E
         STA   $01
         LDA   $03
         ADC   $10
         STA   $03
L150DA8  ASL   $0E
         ROL   $10
L150DAC  LDA   $05
         ORA   $07
         BNE   L150D95
         CPX   #$0000
         BEQ   L150DCA
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L150DC8
         INC
L150DC8  STA   $03
L150DCA  LDA   $01
         STA   $0E
         LDA   $03
         STA   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L150DD8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0338B0
         TAY
         CLC
         TSC
         ADC   #$0004
         TCS
         TYA
         LDA   $05
         BMI   L150E07
         BEQ   L150E07
         LDA   $05
         JSL   L150488
         STA   $01
         STX   $03
         BRA   L150E1B
L150E07  LDA   $05
         JSL   L150488
         PEA   $0001
         PEA   $0000
         JSL   L150F53
         STA   $01
         STX   $03
L150E1B  PEI   $03
         PEI   $01
         PEA   $0000
         PEA   $4000
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         LDA   $10
         PEA   $4000
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L150E42
         DEX
L150E42  JSL   L150F53
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$8000
         LDX   #$0000
         JSL   L033477
         BVS   L150E5D
         EOR   #$8000
L150E5D  BMI   L150E65
         LDA   $01
         STA   $05
         BRA   L150E75
L150E65  PEA   $0001
         PEA   $0000
         LDA   $01
         LDX   $03
         JSL   L1512A5
         STA   $05
L150E75  PEI   $05
         JSL   L033888
         TAY
         CLC
         TSC
         ADC   #$0002
         TCS
         TYA
         LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L150E95  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L0338B0
         TAY
         CLC
         TSC
         ADC   #$0004
         TCS
         TYA
         LDA   $07
         BMI   L150EC4
         BEQ   L150EC4
         LDA   $07
         JSL   L150488
         STA   $03
         STX   $05
         BRA   L150ED8
L150EC4  LDA   $07
         JSL   L150488
         PEA   $0001
         PEA   $0000
         JSL   L150F53
         STA   $03
         STX   $05
L150ED8  PEI   $05
         PEI   $03
         PEA   $0000
         PEA   $4000
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         SEC
         SBC   #$0000
         BMI   L150F2F
         CMP   #$0004
         BPL   L150F2F
         SEC
         SBC   #$0000
         BEQ   L150F16
         DEC
         BEQ   L150F1A
         DEC
         BEQ   L150F21
         DEC
         BEQ   L150F28
         BRA   L150F2F
L150F16  STZ   $01
         BRA   L150F2F
L150F1A  LDA   #$0001
         STA   $01
         BRA   L150F2F
L150F21  LDA   #$0002
         STA   $01
         BRA   L150F2F
L150F28  LDA   #$0003
         STA   $01
         BRA   L150F2F
L150F2F  LDA   $01
         STA   $12
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L150F3B  ENT
         LDX   #$1501
         JMP   L1506D8

L150F41  ENT
         LDX   #$8A04
         JMP   L1506D8

L150F47  ENT
         LDX   #$1805
         JMP   L151442

L150F4D  ENT
         LDX   #$2C03
         JMP   L1506D8

L150F53  ENT
         CLC
         ADC   $04,S
         TAY
         TXA
         ADC   $06,S
         TAX
         LDA   $01,S
         STA   $05,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         TYA
         RTL

L150F67  ENT
         LDX   #$0D0E
         JMP   L1506D8

L150F6D  ENT
         LDX   #$1C14
         JMP   L1506D8

L150F73  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         STZ   $14
         LDA   #$0000
         SEP   #$20
         LDA   [$0C]
         BEQ   L150FCC
         SEC
         SBC   [$10]
         BMI   L150FCC
         TAX
         LDY   #$0001
         LDA   [$10],Y
         STA   $05
L150F91  CMP   [$0C],Y
         BEQ   L150F9B
L150F95  INY
         DEX
         BPL   L150F91
         BRA   L150FCC
L150F9B  REP   #$20
         TYA
         DEC
         CLC
         ADC   $0C
         STA   $03
         LDA   $0E
         ADC   #$0000
         STA   $05
         STY   $01
         LDA   #$0000
         SEP   #$20
         LDA   [$10]
         TAY
L150FB5  LDA   [$10],Y
         CMP   [$03],Y
         BNE   L150FC6
         DEY
         BNE   L150FB5
         REP   #$20
         LDA   $01
         STA   $14
         BRA   L150FCC
L150FC6  LDY   $01
         LDA   $05
         BRA   L150F95
L150FCC  REP   #$20
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDX   $07
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         RTL

L150FE1  ENT
         LDX   #$2810
         JMP   L1506D8

L150FE7  ENT
         LDX   #$2710
         JMP   L1506D8

L150FED  ENT
         LDX   #$1722
         JMP   L1506D8

L150FF3  ENT
         LDX   #$1813
         JMP   L1506D8

L150FF9  ENT
         LDX   #$2604
         JMP   L1506D8

L150FFF  ENT
         LDX   #$5E04
         JMP   L1506D8

L151005  ENT
         LDX   #$4C04
         JMP   L1506D8

L15100B  ENT
         LDX   #$4A04
         JMP   L1506D8

L151011  ENT
         LDX   #$1801
         JMP   L1506D8

L151017  ENT
         LDX   #$0B06
         JMP   L151442

L15101D  ENT
         LDX   #$0C16
         JMP   L1506D8

L151023  ENT
         LDX   #$1503
         JMP   L1506D8

L151029  ENT
         LDX   #$190E
         JMP   L1506D8

L15102F  ENT
         LDX   #$130E
         JMP   L1506D8

L151035  ENT
         LDX   #$1C0E
         JMP   L1506D8

L15103B  ENT
         LDX   #$1B0E
         JMP   L1506D8

L151041  ENT
         LDX   #$2510
         JMP   L1506D8

L151047  ENT
         LDX   #$0F0E
         JMP   L1506D8

L15104D  ENT
         LDX   #$1216
         JMP   L1506D8

L151053  ENT
         LDX   #$1002
         JMP   L1506D8

L151059  ENT
         LDX   #$0B13
         JMP   L151442

L15105F  ENT
         LDX   #$0C13
         JMP   L151442

L151065  ENT
         LDX   #$1F1E
         JMP   L1506D8

L15106B  ENT
         LDX   #$0A22
         JMP   L1506D8

L151071  ENT
         LDX   #$3410
         JMP   L1506D8

L151077  ENT
         LDX   #$1F22
         JMP   L1506D8

L15107D  ENT
         LDX   #$2D04
         JMP   L1506D8

L151083  ENT
         LDX   #$2C04
         JMP   L1506D8

L151089  ENT
         LDX   #$A804
         JMP   L1506D8

L15108F  ENT
         LDX   #$1815
         JMP   L1506D8

L151095  ENT
         LDX   #$1E05
         JMP   L1506D8

L15109B  ENT
         LDX   #$0A1C
         JMP   L1506D8

L1510A1  ENT
         LDX   #$3604
         JMP   L1506D8

L1510A7  ENT
         LDX   #$2F02
         JMP   L1506D8

L1510AD  ENT
         LDX   #$0D08
         JMP   L1506D8

L1510B3  ENT
         LDX   #$0C08
         JMP   L1506D8

L1510B9  ENT
         LDX   #$0913
         JMP   L1506D8

L1510BF  ENT
         LDX   #$171E
         JMP   L1506D8

L1510C5  ENT
         LDX   #$3A04
         JMP   L1506D8

L1510CB  ENT
         LDX   #$190B
         JMP   L1506D8

L1510D1  ENT
         LDX   #$180E
         JMP   L151442

L1510D7  ENT
         LDX   #$1C1B
         JMP   L1506D8

L1510DD  ENT
         LDX   #$111B
         JMP   L1506D8

L1510E3  ENT
         LDX   #$0A01
         JMP   L1506D8

L1510E9  ENT
         LDX   #$0901
         JMP   L1506D8

L1510EF  ENT
         LDA   $06,S
         BMI   L15110E
         LDA   $04,S
         CMP   #$0010
         BCS   L151107
         TAX
         LDA   $06,S
         BRA   L151100
L1510FF  LSR
L151100  DEX
         BPL   L1510FF
         STA   $06,S
         BRA   L151127
L151107  LDA   #$0000
         STA   $06,S
         BRA   L151127
L15110E  LDA   $04,S
         CMP   #$0010
         BCS   L151122
         TAX
         LDA   $06,S
         BRA   L15111B
L15111A  LSR
L15111B  DEX
         BPL   L15111A
         STA   $06,S
         BRA   L151127
L151122  LDA   #$FFFF
         STA   $06,S
L151127  LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLY
         RTL

L151131  ENT
         LDX   #$1B04
         JMP   L1506D8

L151137  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         LDX   $FF
         LDA   $FD
         AND   #$003F
         STA   $F0
         LDX   #$0000
         TDC
         CLC
         ADC   #$0101
         STX   $EE
         STA   $EC
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L151160
         DEX
L151160  PHX
         PHA
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         SEC
         JSL   L0337CC
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$EC],Y
         PLA
         STA   [$EC]
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         LDA   $02,S
         STA   $06,S
         LDA   $01,S
         STA   $05,S
         TSC
         CLC
         ADC   #$0004
         TCS
         TYA
         STA   $04,S
         TXA
         STA   $06,S
         RTL

L151198  ENT
         LDX   #$3004
         JMP   L1506D8

L15119E  ENT
         LDX   #$3104
         JMP   L1506D8

L1511A4  ENT
         LDX   #$1013
         JMP   L1506D8

L1511AA  ENT
         LDX   #$1413
         JMP   L1506D8

L1511B0  ENT
         LDX   #$3C0E
         JMP   L1506D8

L1511B6  ENT
         LDX   #$0A13
         JMP   L151442

L1511BC  ENT
         LDX   #$1D0B
         JMP   L1506D8

L1511C2  ENT
         LDX   #$1204
         JMP   L1506D8

L1511C8  ENT
         LDX   #$110E
         JMP   L1506D8

L1511CE  ENT
         LDX   #$2B02
         JMP   L1506D8

L1511D4  ENT
         LDX   #$2F15
         JMP   L1506D8

L1511DA  ENT
         LDX   #$2E15
         JMP   L1506D8

L1511E0  ENT
         LDX   #$A204
         JMP   L1506D8

L1511E6  ENT
         LDX   #$A004
         JMP   L1506D8

L1511EC  ENT
         LDX   #$2022
         JMP   L1506D8

L1511F2  ENT
         PHD
         TSC
         SEC
         SBC   #$0004
         TCD
         TCS
         STZ   $03
         LDX   $0A
         LDA   $0C,X
         STA   $01
         BMI   L151220
         LSR
         LSR
         LSR
         CMP   $0A
         BCS   L151220
         TAY
         LDA   $01
         AND   #$0007
         TAX
         LDAL  L0555A3,X
         AND   #$00FF
         TYX
         AND   $0C,X
         BEQ   L151220
         INC   $03
L151220  LDX   $0A
         LDA   $03
         STA   $0C,X
         LDA   $08
         STA   $0A,X
         LDA   $07
         STA   $09,X
         LDA   $05
         STA   $07,X
         TSC
         CLC
         PHX
         ADC   $01,S
         ADC   #$0006
         TCS
         PLD
         RTL

L15123D  ENT
         LDX   #$5504
         JMP   L1506D8

L151243  ENT
         PHD
         TSC
         TCD
         PHA
         PHA
         PHA
         PHA
         PEI   $0C
         PEI   $0A
         PEI   $08
         PEI   $06
         _LongDivide
         BCS   L15125E
         LDA   #$0000
L15125E  STAL  L05565D
         PLA
         STA   [$0E]
         LDY   #$0002
         PLA
         STA   [$0E],Y
         PLA
         LDY   #$0004
         STA   [$0E],Y
         PLA
         LDY   #$0006
         STA   [$0E],Y
         PLD
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         TSC
         CLC
         ADC   #$0008
         TCS
         RTL

L151287  ENT
         LDX   #$0E13
         JMP   L1506D8

L15128D  ENT
         LDX   #$1622
         JMP   L1506D8

L151293  ENT
         LDX   #$200E
         JMP   L1506D8

L151299  ENT
         LDX   #$1422
         JMP   L1506D8

L15129F  ENT
         LDX   #$090F
         JMP   L1506D8

L1512A5  ENT
         EOR   #$FFFF
         SEC
         ADC   $04,S
         TAY
         TXA
         EOR   #$FFFF
         ADC   $06,S
         TAX
         LDA   $01,S
         STA   $05,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         TYA
         RTL

L1512BF  ENT
         LDX   #$240E
         JMP   L1506D8

L1512C5  ENT
         LDX   #$0E0F
         JMP   L1506D8

L1512CB  ENT
         LDX   #$4F04
         JMP   L151442

L1512D1  ENT
         LDX   #$0E14
         JMP   L1506D8

L1512D7  ENT
         LDX   #$4E04
         JMP   L1506D8

L1512DD  ENT
         LDX   #$5F04
         JMP   L1506D8

L1512E3  ENT
         LDX   #$9A04
         JMP   L1506D8

L1512E9  ENT
         LDX   #$9B04
         JMP   L1506D8

L1512EF  ENT
         LDX   #$0922
         JMP   L1506D8

L1512F5  ENT
         LDX   #$1A0B
         JMP   L1506D8

L1512FB  ENT
         LDX   #$1902
         JMP   L1506D8

L151301  ENT
         LDX   #$1802
         JMP   L1506D8

L151307  ENT
         LDX   #$1905
         JMP   L1506D8

L15130D  ENT
         LDX   #$1910
         JMP   L1506D8

L151313  ENT
         LDX   #$1A10
         JMP   L1506D8

L151319  ENT
         LDX   #$1006
         JMP   L1506D8

L15131F  ENT
         LDX   #$5A04
         JMP   L1506D8

L151325  ENT
         LDX   #$1603
         JMP   L1506D8

L15132B  ENT
         LDX   #$0F03
         JMP   L1506D8

L151331  ENT
         LDX   #$1001
         JMP   L1506D8

L151337  ENT
         LDX   #$0F01
         JMP   L1506D8

L15133D  ENT
         LDX   #$0E0B
         JMP   L1506D8

L151343  ENT
         LDX   #$2103
         JMP   L1506D8

L151349  ENT
         LDX   #$0D02
         JMP   L1506D8

L15134F  ENT
         LDX   #$0C02
         JMP   L1506D8

L151355  ENT
         LDX   #$8204
         JMP   L1506D8

L15135B  ENT
         LDX   #$BE04
         JMP   L1506D8

L151361  ENT
         LDX   #$1102
         JMP   L1506D8

L151367  ENT
         LDX   #$3010
         JMP   L1506D8

L15136D  ENT
         LDX   #$0A16
         JMP   L1506D8

L151373  ENT
         LDX   #$0916
         JMP   L1506D8

L151379  ENT
         LDX   #$2214
         JMP   L1506D8

L15137F  ENT
         LDX   #$7504
         JMP   L151442

L151385  ENT
         LDX   #$0B0E
         JMP   L1506D8

L15138B  ENT
         LDX   #$201E
         JMP   L1506D8

L151391  PHD
         TSC
         CLC
         ADC   #$FFDB
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $31
         PEI   $2F
         PEA   $0021
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2D
         PEI   $2B
         PEA   $0001
         _SANEDecStr816
         BCS   L1513D2
         LDA   #$0000
L1513D2  STAL  L05565D
         LDA   $29
         STA   $35
         LDA   $28
         STA   $34
         LDA   $26
         TCD
         TSC
         CLC
         ADC   #$0033
         TCS
         RTL

L1513E8  ENT
         LDX   #$0F13
         JMP   L1506D8

L1513EE  ENT
         LDX   #$141C
         JMP   L1506D8

L1513F4  ENT
         LDX   #$0902
         JMP   L1506D8

L1513FA  ENT
         LDX   #$160F
         JMP   L1506D8

L151400  ENT
         LDX   #$B904
         JMP   L1506D8

L151406  ENT
         LDX   #$0A02
         JMP   L1506D8

L15140C  ENT
         LDX   #$C104
         JMP   L1506D8

L151412  ENT
         LDX   #$8404
         JMP   L1506D8

L151418  ENT
         LDX   #$5304
         JMP   L1506D8

L15141E  ENT
         LDX   #$1D0E
         JMP   L1506D8

L151424  ENT
         LDX   #$1804
         JMP   L1506D8

L15142A  ENT
         LDX   #$2603
         JMP   L1506D8

L151430  ENT
         LDX   #$0D10
         JMP   L1506D8

L151436  ENT
         LDX   #$0C10
         JMP   L1506D8

L15143C  ENT
         LDX   #$2703
         JMP   L1506D8

L151442  JSL   DISPATCH2
         STAL  L05565D
         LDA   $04,S
         BEQ   L151453
         LDA   #$0001
         STA   $04,S
L151453  RTL

L151454  ENT
         LDX   #$0317
         JMP   L1506D8

L15145A  ENT
         LDX   #$4C0E
         JMP   L151442

L151460  ENT
         LDX   #$8704
         JMP   L1506D8

L151466  ENT
         LDX   #$9104
         JMP   L1506D8

L15146C  ENT
         LDX   #$0D1C
         JMP   L1506D8

L151472  ENT
         LDX   #$9204
         JMP   L1506D8

L151478  ENT
         LDX   #$1914
         JMP   L1506D8

L15147E  ENT
         LDX   #$460F
         JMP   L1506D8

L151484  ENT
         LDX   #$450F
         JMP   L1506D8

L15148A  ENT
         LDX   #$2A0F
         JMP   L1506D8

L151490  ENT
         LDX   #$2304
         JMP   L1506D8

L151496  ENT
         LDX   #$1406
         JMP   L1506D8

L15149C  ENT
         LDX   #$1113
         JMP   L1506D8

L1514A2  ENT
         LDX   #$600E
         JMP   L1506D8

L1514A8  ENT
         LDX   #$2504
         JMP   L1506D8

L1514AE  ENT
         LDX   #$0B1B
         JMP   L1506D8

L1514B4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEI   $40
         PEI   $3E
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L15184D
         PHY
         PHY
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         JSL   L150082
         PLA
         STA   $42
         PLX
         STX   $44
         PHY
         PEA   $0010
         JSL   L1517F7
         PLA
         LSR
         BCS   L151501
         BRL   L1515AA
L151501  PEA   $0003
         JSL   L150DD8
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$001F
         PHA
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
         PHA
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
         PHA
         PEA   $000F
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
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
         PEA   ^L0556D2
         PEA   L0556D2
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0000
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L1518AA
         JSL   L150082
         PLA
         STA   $42
         PLX
         STX   $44
L1515AA  PEI   $33
         JSL   L15187D
         LDA   $3C
         STA   $40
         LDA   $3B
         STA   $3F
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L1515C2  ENT
         LDX   #$3403
         JMP   L1506D8

L1515C8  ENT
         LDX   #$281E
         JMP   L1506D8

L1515CE  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$001D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEI   $F6
         PEI   $F4
         PEI   $F2
         PEI   $F0
         PEI   $EE
         PEI   $EC
         PEA   $0000
         _SANEDecStr816
         BCS   L151611
         LDA   #$0000
L151611  STAL  L05565D
         LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$0116
         TCS
         RTL

L151627  ENT
         LDX   #$0E12
         JMP   L1506D8

L15162D  ENT
         LDX   #$5804
         JMP   L1506D8

L151633  ENT
         LDX   #$091B
         JMP   L1506D8

L151639  ENT
         LDX   #$0E17
         JMP   L1506D8

L15163F  ENT
         LDX   #$3110
         JMP   L1506D8

L151645  ENT
         LDX   #$0B22
         JMP   L1506D8

L15164B  ENT
         LDX   #$0E06
         JMP   L151442

L151651  ENT
         LDX   #$0B14
         JMP   L1506D8

L151657  ENT
         LDX   #$0D12
         JMP   L1506D8

L15165D  ENT
         LDX   #$0D22
         JMP   L1506D8

L151663  ENT
         LDX   #$0E1B
         JMP   L1506D8

L151669  ENT
         LDX   #$6804
         JMP   L1506D8

L15166F  ENT
         LDX   #$6E04
         JMP   L1506D8

L151675  ENT
         LDX   #$BC04
         JMP   L1506D8

L15167B  ENT
         LDX   #$320F
         JMP   L1506D8

L151681  ENT
         LDX   #$0C03
         JMP   L1506D8

L151687  ENT
         LDX   #$1B0B
         JMP   L1506D8

L15168D  ENT
         LDX   #$1614
         JMP   L1506D8

L151693  ENT
         LDX   #$1304
         JMP   L1506D8

L151699  ENT
         LDX   #$2A0E
         JMP   L1506D8

L15169F  ENT
         LDX   #$150B
         JMP   L1506D8

L1516A5  ENT
         LDX   #$2904
         JMP   L1506D8

L1516AB  ENT
         LDX   #$7804
         JMP   L151442

L1516B1  ENT
         LDX   #$6A04
         JMP   L1506D8

L1516B7  ENT
         LDX   #$2202
         JMP   L1506D8

L1516BD  ENT
         LDX   #$0E16
         JMP   L1506D8

L1516C3  ENT
         LDX   #$1B14
         JMP   L1506D8

L1516C9  ENT
         LDX   #$C604
         JMP   L1506D8

L1516CF  ENT
         LDX   #$C704
         JMP   L1506D8

L1516D5  ENT
         LDX   #$0F14
         JMP   L1506D8

L1516DB  ENT
         LDX   #$1022
         JMP   L1506D8

L1516E1  ENT
         LDX   #$0F22
         JMP   L1506D8

L1516E7  ENT
         LDX   #$1014
         JMP   L1506D8

L1516ED  ENT
         LDX   #$9C04
         JMP   L1506D8

L1516F3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00E2
         TCS
         LDX   #$0101
         LDA   $00,X
         TAX
         PHX
         LDA   $FF
         PLX
         STX   $EC
         STA   $EA
         LDX   #$0000
         LDA   #$0008
         PHX
         PHA
         LDA   $F9
         LDX   #$0000
         TAY
         BPL   L15171D
         DEX
L15171D  PHX
         PHA
         LDX   $FD
         LDA   $FB
         SEC
         JSL   L033930
         PLA
         PLX
         SEC
         JSL   L032FA4
         PLY
         PLY
         STA   $E8
         LDX   #$0000
         LDA   #$0008
         PHX
         PHA
         LDA   $F9
         LDX   #$0000
         TAY
         BPL   L151744
         DEX
L151744  PHX
         PHA
         LDX   $FD
         LDA   $FB
         SEC
         JSL   L033930
         PLA
         PLX
         SEC
         JSL   L032FA4
         PLA
         PLX
         STA   $E6
         LDA   $E8
         LDX   #$0000
         TAY
         BPL   L151763
         DEX
L151763  PHX
         PHA
         LDX   $EC
         LDA   $EA
         JSL   L0338DC
         PLA
         PLX
         STX   $EC
         STA   $EA
         LDA   [$EA]
         STA   $E4
         PEI   $E6
         LDA   $E4
         SEC
         JSL   L0339B7
         PLA
         STA   $E4
         LDA   $F9
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L151790
         DEX
L151790  STX   $F2
         ASL
         ROL   $F2
         LDX   $F2
         PHX
         PHA
         LDA   #L0555AB
         LDX   #^L0555AB
         JSL   L0338DC
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDA   [$EE]
         PHA
         LDA   $E4
         PLX
         STX   $F2
         AND   $F2
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         STA   $04,S
         RTL

L1517CD  ENT
         LDX   #$1010
         JMP   L1506D8

L1517D3  ENT
         LDX   #$CA04
         JMP   L1506D8

L1517D9  ENT
         LDX   #$9504
         JMP   L1506D8

L1517DF  ENT
         LDX   #$2D0F
         JMP   L1506D8

L1517E5  ENT
         LDX   #$0C01
         JMP   L1506D8

L1517EB  ENT
         LDX   #$5704
         JMP   L1506D8

L1517F1  ENT
         LDX   #$5D04
         JMP   L1506D8

L1517F7  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0338B0
         TAY
         CLC
         TSC
         ADC   #$0004
         TCS
         TYA
         PEI   $01
         PEA   $0100
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0020
         JSL   L150318
         PLX
         PLX
         STA   $01
         LDA   #$0001
         STA   $0E
         LDA   $0C
         AND   $01
         STA   $01
         LDA   $01
         BNE   L15183C
         STZ   $0E
L15183C  LDA   $0A
         STA   $0C
         LDA   $09
         STA   $0B
         LDA   $07
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L15184D  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEA   $0017
         _SANEFP816
         BCS   L151868
         LDA   #$0000
L151868  STAL  L05565D
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

L15187D  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0A
         PEA   $0019
         _SANEFP816
         BCS   L151896
         LDA   #$0000
L151896  STAL  L05565D
         LDA   $08
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

L1518AA  PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEI   $2E
         PEI   $2C
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2A
         PEI   $28
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0011
         _SANEFP816
         BCS   L151914
         LDA   #$0000
L151914  STAL  L05565D
         PEI   $32
         PEI   $30
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   $26
         STA   $2E
         LDA   $25
         STA   $2D
         LDA   $23
         TCD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

