*
* HypercardGS
* segment: $24 HPrintCard
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintCard.l
         lst   off

*---------------------------------------

         use   HPrintCard.X

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
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L240000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         JSL   L073CDF
         PLA
         STA   $0B
         LDA   $1A
         BEQ   L24001B
         LDA   #$0008
         STA   $09
         BRA   L240020
L24001B  LDA   #$0010
         STA   $09
L240020  PHY
         PEI   $09
         LDY   #$0038
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L160A5A
         PLA
         LSR
         BCC   L240092
         PHY
         PEA   ^L0408D5
         PEA   L0408D5
         JSL   L160B56
         PLA
         LSR
         BCC   L240092
         PEI   $1A
         JSL   L160BAA
         PEA   ^L160BAA
         PEA   L160BAA
         JSL   L07187A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$0001
         CLC
         ADC   $16
         LDX   $18
         BCC   L240069
         INX
L240069  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B34
L240092  PEI   $09
         LDY   #$0038
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L160B80
         PEI   $0B
         JSL   L0724F7
         LDA   $14
         STA   $1A
         LDA   $13
         STA   $19
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L2400BB  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         LDAL  L051EF0
         DEC
         BEQ   L2400D1
         LDA   #$00FF
         STA   $01
L2400D1  PEI   $01
         LDY   #$0017
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $000B
         JSL   L072E7C
         LDA   $0A
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

L2400F7  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         LDAL  L051EF2
         DEC
         DEC
         BNE   L24010E
         LDA   #$00FF
         STA   $01
L24010E  PEI   $01
         LDY   #$0017
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $000D
         JSL   L072E7C
         LDA   $0A
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

L240134  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$002B
         LDA   [$0A],Y
         BEQ   L240160
         PEA   $0001
         LDY   #$0017
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0007
         JSL   L073B05
         LDA   #$0000
         LDY   #$002B
         STA   [$0A],Y
L240160  LDA   $08
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

L240171  PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         PEA   ^L051EF0
         PEA   L051EF0
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L160A3E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$0001
         CLC
         ADC   $40
         LDX   $42
         BCC   L2401A0
         INX
L2401A0  PHX
         PHA
         JSL   L160BC6
         LDA   $3E
         STA   $42
         LDA   $3D
         STA   $41
         LDA   $3B
         TCD
         TSC
         CLC
         ADC   #$0040
         TCS
         RTL

L2401B8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD0
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $1B
         PLX
         STX   $1D
         PEI   $3C
         PEI   $3A
         PHY
         PHY
         PEA   $0835
         JSL   L0711EB
         PEA   ^L0408DE
         PEA   L0408DE
         PEA   ^L0408DF
         PEA   L0408DF
         JSL   L073C22
         PHY
         PHY
         PEA   $3FAC
         JSL   L072834
         PLA
         STA   $15
         PLX
         STX   $17
         PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $09
         PLX
         STX   $0B
         LDX   #$0000
         LDA   #$0001
         AND   $0B
         BNE   L24020F
         INX
L24020F  TXA
         STA   $29
         LDAL  L051EF4
         PHA
         PEI   $17
         PEI   $15
         PEA   $000B
         JSL   L073B05
         LDAL  L051EF6
         PHA
         PEI   $17
         PEI   $15
         PEA   $000A
         JSL   L073B05
         LDAL  L051F20
         PHA
         PEI   $17
         PEI   $15
         PEA   $000D
         JSL   L073B05
         LDA   L055327
         LDX   L055329
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0018
         BCC   L24025B
         INX
L24025B  STA   $2D
         STX   $2F
         LDA   #$0020
         AND   [$2D]
         BEQ   L240269
         LDA   #$0001
L240269  AND   $29
         BEQ   L240274
         LDA   #$0012
         STA   $21
         BRA   L240279
L240274  LDA   #$0013
         STA   $21
L240279  PEI   $17
         PEI   $15
         PEI   $21
         JSL   L073CFE
         PHY
         PEI   $17
         PEI   $15
         JSL   L160BE2
         PLA
         STA   $2B
         PEA   $0000
         PHD
         JSL   L2400F7
         PEA   $0000
         PHD
         JSL   L2400BB
         LDAL  L051F16
         PHA
         PEI   $17
         PEI   $15
         PEA   $000C
         JSL   L073B05
         LDAL  L051EF0
         PHA
         PEI   $17
         PEI   $15
         PEA   $000E
         JSL   L073B05
         LDAL  L051EF2
         PHA
         PEI   $17
         PEI   $15
         PEA   $0005
         JSL   L073B05
         PHY
         PHY
         JSL   L160BD4
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         ORA   $0F
         BNE   L2402E4
         BRL   L2406AC
L2402E4  PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L15038F
         PLA
         BNE   L2402FB
         LDA   #$000F
         STA   $1F
         BRA   L240300
L2402FB  LDA   #$0010
         STA   $1F
L240300  PEI   $17
         PEI   $15
         PEI   $1F
         JSL   L073CFE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PHY
         PHY
         PEI   $17
         PEI   $15
         PEI   $1F
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         PEA   $0004
         JSL   L151005
         PEI   $17
         PEI   $15
         JSL   L15102F
         PEI   $17
         PEI   $15
         JSL   L1511C8
         PEI   $17
         PEI   $15
         JSL   L151131
         PHY
         JSL   L0727BF
         PLA
         STA   $19
         STZ   L05533F
         STZ   L05533D
L24035F  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $23
         PHY
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEI   $17
         PEI   $15
         JSL   L150482
         PLA
         STA   $21
         LDA   #$FFFD
         CMP   $23
         BEQ   L240393
         BRL   L2404A8
L240393  LDA   #$007F
         ANDL  L0540A1
         STA   $21
         LDA   $21
         SEC
         SBC   #$0008
         BPL   L2403A7
         BRL   L240451
L2403A7  CMP   #$0078
         BMI   L2403AF
         BRL   L240451
L2403AF  SEC
         SBC   #$0000
         BEQ   L240405
         DEC
         BEQ   L2403F6
         SEC
         SBC   #$0004
         BEQ   L240405
         SEC
         SBC   #$0008
         BEQ   L240405
         DEC
         DEC
         DEC
         BEQ   L240405
         DEC
         DEC
         DEC
         BEQ   L240405
         SEC
         SBC   #$0028
         BEQ   L240414
         SEC
         SBC   #$0013
         BEQ   L240414
         DEC
         DEC
         BEQ   L240414
         SEC
         SBC   #$000B
         BEQ   L240414
         SEC
         SBC   #$0013
         BEQ   L240414
         DEC
         DEC
         BEQ   L240414
         SEC
         SBC   #$0007
         BEQ   L240405
         BRA   L240451
L2403F6  PHY
         PHY
         JSL   L150FE7
         PLA
         STA   $11
         PLX
         STX   $13
         BRL   L2404A8
L240405  PHY
         PEI   $17
         PEI   $15
         JSL   L072354
         PLA
         STA   $23
         BRL   L2404A8
L240414  LDA   #$0100
         ANDL  L0540AD
         BEQ   L24044F
         PEI   $21
         PHY
         PHY
         JSL   L150AF2
         PLA
         PLX
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$001C
         BCC   L24043A
         INX
L24043A  STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         PHX
         PHA
         PEA   $0002
         JSL   L160B3A
L24044F  BRA   L2404A8
L240451  LDA   $21
         SEC
         SBC   #$0030
         BVS   L24045C
         EOR   #$8000
L24045C  BMI   L240463
         LDA   #$0000
         BRA   L240466
L240463  LDA   #$0001
L240466  PHA
         LDA   $21
         SEC
         SBC   #$003A
         BVS   L240472
         EOR   #$8000
L240472  BPL   L240479
         LDA   #$0000
         BRA   L24047C
L240479  LDA   #$0001
L24047C  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$1000
         ANDL  L0540AD
         BNE   L24048D
         INX
L24048D  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L2404A8
         PHY
         PEI   $17
         PEI   $15
         JSL   L072354
         PLA
         STA   $23
         PEA   $0000
         PHD
         JSL   L240134
L2404A8  LDA   #$FFFE
         CMP   $23
         BNE   L2404B4
         LDA   #$0063
         STA   $23
L2404B4  LDA   $23
         DEC
         BPL   L2404BC
         BRL   L240681
L2404BC  CMP   #$0063
         BMI   L2404C4
         BRL   L240681
L2404C4  SEC
         SBC   #$0000
         BNE   L2404CD
         BRL   L240553
L2404CD  DEC
         BNE   L2404D3
         BRL   L240562
L2404D3  DEC
         BNE   L2404D9
         BRL   L24056B
L2404D9  DEC
         BNE   L2404DF
         BRL   L240579
L2404DF  DEC
         BNE   L2404E5
         BRL   L240652
L2404E5  DEC
         BNE   L2404EB
         BRL   L240587
L2404EB  DEC
         BNE   L2404F1
         BRL   L2405A1
L2404F1  DEC
         BNE   L2404F7
         BRL   L2405A1
L2404F7  DEC
         BNE   L2404FD
         BRL   L2405A1
L2404FD  DEC
         BNE   L240503
         BRL   L2405F2
L240503  DEC
         BNE   L240509
         BRL   L2405D3
L240509  DEC
         BNE   L24050F
         BRL   L24063F
L24050F  DEC
         BNE   L240515
         BRL   L2405AC
L240515  DEC
         BNE   L24051B
         BRL   L240610
L24051B  SEC
         SBC   #$0055
         BEQ   L240524
         BRL   L240681
L240524  PEI   $17
         PEI   $15
         JSL   L1506B3
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
         PEI   $17
         PEI   $15
         JSL   L1517CD
         PEA   $0000
         PHD
         JSL   L240171
         PEI   $17
         PEI   $15
         JSL   L1506AD
         BRL   L240681
L240553  LDA   #$0001
         STA   L05533F
         LDA   #$0001
         STA   L05533D
         BRL   L240681
L240562  LDA   #$0001
         STA   L05533F
         BRL   L240681
L24056B  PEA   $0001
         PEA   $0000
         PHD
         JSL   L240000
         BRL   L240681
L240579  PEA   $0000
         PEA   $0000
         PHD
         JSL   L240000
         BRL   L240681
L240587  LDA   $2B
         BNE   L24059E
         PEA   $0001
         PEI   $17
         PEI   $15
         PEA   $0006
         JSL   L073B05
         LDA   #$0001
         STA   $2B
L24059E  BRL   L240681
L2405A1  PEA   $0000
         PHD
         JSL   L240134
         BRL   L240681
L2405AC  LDA   #$0001
         SEC
         SBCL  L051F20
         STAL  L051F20
         LDAL  L051F20
         PHA
         PEI   $17
         PEI   $15
         PEA   $000D
         JSL   L073B05
         PEA   $0000
         PHD
         JSL   L240171
         BRL   L240681
L2405D3  LDA   #$0001
         SEC
         SBCL  L051EF4
         STAL  L051EF4
         LDAL  L051EF4
         PHA
         PEI   $17
         PEI   $15
         PEA   $000B
         JSL   L073B05
         BRL   L240681
L2405F2  LDA   #$0001
         SEC
         SBCL  L051EF6
         STAL  L051EF6
         LDAL  L051EF6
         PHA
         PEI   $17
         PEI   $15
         PEA   $000A
         JSL   L073B05
         BRA   L240681
L240610  PHY
         PEI   $17
         PEI   $15
         PEA   $000E
         JSL   L072B6B
         PLA
         STA   $21
         LDAL  L051EF0
         CMP   $21
         BEQ   L24063D
         LDA   $21
         STAL  L051EF0
         PEA   $0000
         PHD
         JSL   L2400BB
         PEA   $0000
         PHD
         JSL   L240171
L24063D  BRA   L240681
L24063F  PHY
         PEI   $17
         PEI   $15
         PEA   $000C
         JSL   L072B6B
         PLA
         STAL  L051F16
         BRA   L240681
L240652  PHY
         PEI   $17
         PEI   $15
         PEA   $0005
         JSL   L072B6B
         PLA
         STA   $21
         LDAL  L051EF2
         CMP   $21
         BEQ   L24067F
         LDA   $21
         STAL  L051EF2
         PEA   $0000
         PHD
         JSL   L2400F7
         PEA   $0000
         PHD
         JSL   L240171
L24067F  BRA   L240681
L240681  LDA   L05533F
         BNE   L240689
         BRL   L24035F
L240689  LDA   L05533D
         BEQ   L2406AC
         PEI   $17
         PEI   $15
         PEI   $2B
         JSL   L160BF0
         LDA   L055335
         PHA
         PHY
         PEI   $0F
         PEI   $0D
         JSL   L160BB8
         PLA
         ORA   $01,S
         PLX
         STA   L055335
L2406AC  PEI   $17
         PEI   $15
         JSL   L072634
         PEI   $19
         JSL   L0724F7
         PEI   $1D
         PEI   $1B
         JSL   L151131
         JSL   L09AFB1
         PEI   $0F
         PEI   $0D
         JSL   L07185A
         LDA   $34
         STA   $3C
         LDA   $33
         STA   $3B
         LDA   $31
         TCD
         TSC
         CLC
         ADC   #$003A
         TCS
         RTL

