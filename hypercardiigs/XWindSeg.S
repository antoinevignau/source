*
* HypercardGS
* segment: $1E XWindSeg
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   XWindSeg.l
         lst   off

*---------------------------------------

         use   XWindSeg.X

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

L1E0000  ENT
	PHD
         TSC
         CLC
         ADC   #$FF52
         TCS
         TCD
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEI   $C2
         PEI   $C0
         PEA   $002E
         JSL   L0313BE
         LDY   #$0002
         LDA   [$C4],Y
         TAX
         LDA   [$C4]
         STA   $0D
         STX   $0F
         LDY   #$0038
         LDA   [$0D],Y
         BEQ   L1E0032
         BRL   L1E01AC
L1E0032  LDY   #$0036
         LDA   [$0D],Y
         SEC
         SBC   #$0000
         BMI   L1E0064
         BEQ   L1E0064
         LDA   $11
         SEC
         SBC   #$000F
         BEQ   L1E004E
         BVS   L1E004C
         EOR   #$8000
L1E004C  BMI   L1E005A
L1E004E  LDY   #$003A
         LDA   [$0D],Y
         BNE   L1E0058
         BRL   L1E01AC
L1E0058  BRA   L1E0064
L1E005A  LDY   #$003C
         LDA   [$0D],Y
         BNE   L1E0064
         BRL   L1E01AC
L1E0064  TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $004C
         JSL   L071EC5
         LDA   #$FFFF
         STA   $5F
         LDY   #$0002
         LDA   [$C4],Y
         TAX
         LDA   [$C4]
         CLC
         ADC   #$0008
         BCC   L1E008B
         INX
L1E008B  STA   $AB
         STX   $AD
         LDA   [$AB]
         STA   $A7
         TDC
         CLC
         ADC   #$0065
         LDX   #$0061
         STA   $00,X
         STZ   $02,X
         LDX   #$0061
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $09
         STX   $0B
         LDA   #$0004
         CLC
         ADC   $09
         LDX   $0B
         BCC   L1E00B7
         INX
L1E00B7  PHX
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $002E
         JSL   L0313BE
         LDY   #$0002
         LDA   [$C4],Y
         TAX
         LDA   [$C4]
         CLC
         ADC   #$0004
         BCC   L1E00D8
         INX
L1E00D8  STA   $AB
         STX   $AD
         LDY   #$0002
         LDA   [$AB],Y
         TAX
         LDA   [$AB]
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
         LDA   $BC
         LDX   $BE
         LDY   #$0032
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         LDA   #$0032
         CLC
         ADC   $09
         LDX   $0B
         BCC   L1E0105
         INX
L1E0105  CLC
         ADC   #$0004
         BCC   L1E010C
         INX
L1E010C  STA   $AB
         STX   $AD
         LDA   $B8
         LDX   $BA
         STA   [$AB]
         TXA
         LDY   #$0002
         STA   [$AB],Y
         LDY   #$0002
         LDA   [$C4],Y
         TAX
         LDA   [$C4]
         STA   $05
         STX   $07
         LDY   #$0036
         LDA   [$05],Y
         INC
         LDY   #$0036
         STA   [$05],Y
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         PEA   ^L052506
         PEA   L052506
         PEA   $0020
         JSL   L0313BE
         PEA   ^L052506
         PEA   L052506
         LDA   #$0008
         CLC
         ADC   $05
         LDX   $07
         BCC   L1E015A
         INX
L1E015A  CLC
         ADC   #$0006
         BCC   L1E0161
         INX
L1E0161  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
         PEI   $C6
         PEI   $C4
         TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         JSL   L1E104A
         LDY   #$0002
         LDA   [$C4],Y
         TAX
         LDA   [$C4]
         STA   $01
         STX   $03
         LDY   #$0036
         LDA   [$01],Y
         DEC
         LDY   #$0036
         STA   [$01],Y
         PEA   ^L052506
         PEA   L052506
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   $A5
         STA   [$B4]
L1E01AC  LDA   $B2
         STA   $C6
         LDA   $B1
         STA   $C5
         LDA   $AF
         TCD
         TSC
         CLC
         ADC   #$00C4
         TCS
         RTL

L1E01BE	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $07
         PHY
         PHY
         PEI   $14
         PEI   $12
         JSL   L0A1421
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L1E01E6
         BRA   L1E0226
L1E01E6  PEI   $03
         PEI   $01
         PEA   $03E9
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L1E11EA
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1E0DC0
         PLA
         LSR
         BCC   L1E0220
         PEI   $14
         PEI   $12
         JSL   L0732B7
         PEI   $14
         PEI   $12
         JSL   L151385
         JSL   L09AFB1
L1E0220  PEI   $07
         JSL   L071AA4
L1E0226  LDA   $10
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

L1E0238	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $05
         PHY
         PHY
         JSL   L1E09E4
         PLA
         STA   $01
         PLX
         STX   $03
L1E024E  LDA   $01
         ORA   $03
         BEQ   L1E026B
         LDA   $05
         INC
         STA   $05
         PHY
         PHY
         PEI   $03
         PEI   $01
         JSL   L1E0A35
         PLA
         STA   $01
         PLX
         STX   $03
         BRA   L1E024E
L1E026B  LDA   $05
         STA   $10
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1E0276  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L0551D3
         ORA   L0551D5
         BEQ   L1E0289
         BRL   L1E03B3
L1E0289  LDA   L0551CF
         ORA   L0551D1
         BNE   L1E0294
         BRL   L1E03B3
L1E0294  PHY
         PHY
         LDA   L0551CF
         LDX   L0551D1
         PHX
         PHA
         JSL   L151301
         PEA   $0000
         PEA   $0006
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $03
         LDA   $03
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1E02C1
         EOR   #$8000
L1E02C1  BMI   L1E02C6
         BRL   L1E03A1
L1E02C6  LDA   #$0001
         STA   $05
L1E02CB  PHY
         LDA   L0551CF
         LDX   L0551D1
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L1E02EA
         DEX
L1E02EA  DEC
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         JSL   L1E0965
         PLA
         LSR
         BCS   L1E0314
         BRL   L1E0396
L1E0314  LDA   L0551CF
         LDX   L0551D1
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L1E0332
         DEX
L1E0332  DEC
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L1E034A
         INX
L1E034A  STA   $07
         STX   $09
         LDA   [$07]
         PHA
         JSL   L151343
         LDA   L0551CF
         LDX   L0551D1
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L1E0373
         DEX
L1E0373  DEC
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         JSL   L07185A
L1E0396  LDA   $05
         CMP   $01
         BEQ   L1E03A1
         INC   $05
         BRL   L1E02CB
L1E03A1  LDA   L0551CF
         LDX   L0551D1
         PHX
         PHA
         JSL   L07185A
         STZ   L0551CF
         STZ   L0551D1
L1E03B3  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1E03BA	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         STZ   $14
         STZ   $16
         LDA   $12
         SEC
         SBC   #$0001
         BVS   L1E03D1
         EOR   #$8000
L1E03D1  BMI   L1E03D5
         BRA   L1E0422
L1E03D5  PHY
         PHY
         JSL   L1E09E4
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $12
         DEC
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1E03F1
         EOR   #$8000
L1E03F1  BPL   L1E041A
         LDA   #$0001
         STA   $07
L1E03F8  PHY
         PHY
         PEI   $05
         PEI   $03
         JSL   L1E0A35
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $03
         ORA   $05
         BNE   L1E0410
         BRA   L1E0422
L1E0410  LDA   $07
         CMP   $01
         BEQ   L1E041A
         INC   $07
         BRA   L1E03F8
L1E041A  LDA   $03
         LDX   $05
         STA   $14
         STX   $16
L1E0422  LDA   $10
         STA   $12
         LDA   $0F
         STA   $11
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1E0434	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $05
         PHY
         PHY
         JSL   L1E09E4
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $10
         LDX   $12
         CMP   $01
         BNE   L1E0457
         CPX   $03
L1E0457  BEQ   L1E0482
L1E0459  LDA   $05
         INC
         STA   $05
         PHY
         PHY
         PEI   $03
         PEI   $01
         JSL   L1E0A35
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $10
         LDX   $12
         CMP   $01
         BNE   L1E0478
         CPX   $03
L1E0478  BEQ   L1E0482
         LDA   $01
         ORA   $03
         BNE   L1E0459
         STZ   $05
L1E0482  LDA   $05
         STA   $14
         LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1E0498	ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$001D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         STZ   $FE
         LDX   #$0000
         LDA   L0551B1
         ORA   L0551B3
         BNE   L1E04C7
         INX
L1E04C7  TXA
         BNE   L1E04E1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEA   ^L040AC2
         PEA   L040AC2
         JSL   L1503DD
         PLA
         BEQ   L1E04E4
L1E04E1  BRL   L1E0586
L1E04E4  LDA   L0551B1
         LDX   L0551B3
         STA   $E7
         STX   $E9
L1E04EE  PHY
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         CLC
         ADC   #$0008
         BCC   L1E04FE
         INX
L1E04FE  CLC
         ADC   #$0006
         BCC   L1E0505
         INX
L1E0505  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L1E0565
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         CLC
         ADC   #$0008
         BCC   L1E0527
         INX
L1E0527  TXY
         LDX   #$FFE3
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L1E0540
         INX
L1E0540  STA   $EB
         STX   $ED
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $FC
         STX   $FE
         LDX   #$FFE3
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $EB
         STX   $ED
         LDA   [$EB]
         STA   [$F4]
         BRA   L1E0586
L1E0565  LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         STA   $EB
         STX   $ED
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $E7
         STX   $E9
         LDA   $E7
         ORA   $E9
         BEQ   L1E0586
         BRL   L1E04EE
L1E0586  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0116
         TCS
         RTL

L1E0598	ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $30
         PEI   $2E
         PEA   $0020
         JSL   L0313BE
         STZ   $32
         STZ   $34
         LDX   #$0000
         LDA   L0551B1
         ORA   L0551B3
         BNE   L1E05C4
         INX
L1E05C4  TXA
         BNE   L1E05DE
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L040AC3
         PEA   L040AC3
         JSL   L1503DD
         PLA
         BEQ   L1E05E0
L1E05DE  BRA   L1E0635
L1E05E0  LDA   L0551B1
         LDX   L0551B3
         STA   $21
         STX   $23
L1E05EA  PHY
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         CLC
         ADC   #$0042
         BCC   L1E05FA
         INX
L1E05FA  PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L1E0617
         LDA   $21
         LDX   $23
         STA   $32
         STX   $34
         BRA   L1E0635
L1E0617  LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $21
         STX   $23
         LDA   $21
         ORA   $23
         BNE   L1E05EA
L1E0635  LDA   $2C
         STA   $30
         LDA   $2B
         STA   $2F
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L1E0647	ENT
         PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0015
         TCD
         LDA   L0550E9
         LDX   L0550EB
         CMP   $F8
         BNE   L1E065E
         CPX   $FA
L1E065E  BNE   L1E0674
         PEI   $FE
         PEI   $FC
         PEA   ^L040AC4
         PEA   L040AC4
         PEA   $0005
         JSL   L0313BE
         BRL   L1E0745
L1E0674  LDA   L0550E5
         LDX   L0550E7
         CMP   $F8
         BNE   L1E0680
         CPX   $FA
L1E0680  BNE   L1E0696
         PEI   $FE
         PEI   $FC
         PEA   ^L040AC9
         PEA   L040AC9
         PEA   $0003
         JSL   L0313BE
         BRL   L1E0745
L1E0696  LDA   L0550DD
         LDX   L0550DF
         CMP   $F8
         BNE   L1E06A2
         CPX   $FA
L1E06A2  BNE   L1E06B8
         PEI   $FE
         PEI   $FC
         PEA   ^L040ACC
         PEA   L040ACC
         PEA   $0008
         JSL   L0313BE
         BRL   L1E0745
L1E06B8  LDA   L0550E1
         LDX   L0550E3
         CMP   $F8
         BNE   L1E06C4
         CPX   $FA
L1E06C4  BNE   L1E06D9
         PEI   $FE
         PEI   $FC
         PEA   ^L040AD4
         PEA   L040AD4
         PEA   $0008
         JSL   L0313BE
         BRA   L1E0745
L1E06D9  LDA   L0550ED
         LDX   L0550EF
         CMP   $F8
         BNE   L1E06E5
         CPX   $FA
L1E06E5  BNE   L1E0709
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0020
         JSL   L0313BE
         BRA   L1E0745
L1E0709  LDAL  L040ADC
         SEP   #$20
         STA   [$FC]
         REP   #$20
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L0A1421
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BEQ   L1E0745
         PEI   $FE
         PEI   $FC
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         CLC
         ADC   #$0042
         BCC   L1E073C
         INX
L1E073C  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
L1E0745  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010E
         TCS
         RTL

L1E0757	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $05
         PHY
         PHY
         PEI   $12
         PEI   $10
         JSL   L0A1421
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L1E077F
         BRA   L1E07A4
L1E077F  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$003E
         BCC   L1E078E
         INX
L1E078E  STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $14
         STX   $16
         PEI   $05
         JSL   L071AA4
L1E07A4  LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1E07B6	ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         JSL   L1E07C9
         PLY
         PLY
         PLD
         RTL

L1E07C9  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $09
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         PEI   $14
         JSL   L1E087E
         LDA   L0550E5
         LDX   L0550E7
         PHX
         PHA
         PEI   $14
         JSL   L1E087E
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         PEI   $14
         JSL   L1E087E
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         PEI   $14
         JSL   L1E087E
         LDA   L0551B1
         LDX   L0551B3
         STA   $01
         STX   $03
L1E081B  LDA   $01
         ORA   $03
         BEQ   L1E0866
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0004
         BCC   L1E0848
         INX
L1E0848  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PHX
         PHA
         PEI   $14
         JSL   L1E087E
         LDA   $05
         LDX   $07
         STA   $01
         STX   $03
         BRA   L1E081B
L1E0866  PEI   $09
         JSL   L071AA4
         LDA   $12
         STA   $14
         LDA   $11
         STA   $13
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1E087E  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         BEQ   L1E08AE
         LDY   #$00AE
         LDA   #$0010
         AND   [$14],Y
         CMP   #$0000
         BEQ   L1E08AC
         LDY   #$00CE
         LDA   #$0020
         AND   [$14],Y
         CMP   #$0000
         BNE   L1E08AC
         PEI   $16
         PEI   $14
         JSL   L09A5A7
L1E08AC  BRA   L1E090B
L1E08AE  LDY   #$00CE
         LDA   #$0020
         AND   [$14],Y
         CMP   #$0000
         BEQ   L1E08E8
         LDA   #$00AE
         CLC
         ADC   $14
         LDX   $16
         BCC   L1E08C6
         INX
L1E08C6  STA   $09
         STX   $0B
         LDY   #$00AE
         LDA   #$0010
         ORA   [$14],Y
         JSL   L150488
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
         PEI   $16
         PEI   $14
         JSL   L09A5A7
         BRA   L1E090B
L1E08E8  LDA   #$00AE
         CLC
         ADC   $14
         LDX   $16
         BCC   L1E08F3
         INX
L1E08F3  STA   $09
         STX   $0B
         LDY   #$00AE
         LDA   [$14],Y
         AND   #$FFEF
         JSL   L150488
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
L1E090B  PHY
         PEI   $16
         PEI   $14
         JSL   L0B0653
         PLA
         LSR
         BCC   L1E091A
         BRA   L1E0953
L1E091A  LDA   $12
         BEQ   L1E0925
         LDA   #$03ED
         STA   $05
         BRA   L1E092A
L1E0925  LDA   #$03EC
         STA   $05
L1E092A  PHY
         PHY
         PEI   $16
         PEI   $14
         JSL   L0A1421
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L1E0953
         PEI   $03
         PEI   $01
         PEI   $05
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L1E11EA
L1E0953  LDA   $10
         STA   $16
         LDA   $0F
         STA   $15
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1E0965  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $12
         LDA   L0551B1
         ORA   L0551B3
         BNE   L1E097C
         BRA   L1E09D2
L1E097C  LDA   L0551B1
         LDX   L0551B3
         STA   $01
         STX   $03
L1E0986  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0008
         BCC   L1E0995
         INX
L1E0995  CLC
         ADC   #$0002
         BCC   L1E099C
         INX
L1E099C  STA   $05
         STX   $07
         LDA   $0E
         LDX   $10
         CMP   [$05]
         BNE   L1E09AE
         LDY   #$0002
         TXA
         CMP   [$05],Y
L1E09AE  BNE   L1E09B4
         STZ   $12
         BRA   L1E09D2
L1E09B4  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L1E0986
L1E09D2  LDA   $0C
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

L1E09E4  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L150574
         PLA
         STA   $01
         PLX
         STX   $03
L1E09F8  LDA   $01
         ORA   $03
         BEQ   L1E0A01
         LDA   #$0001
L1E0A01  BEQ   L1E0A27
         PHY
         PEI   $03
         PEI   $01
         JSL   L1E1305
         PLA
         EOR   #$0001
         CMP   #$0000
         BEQ   L1E0A27
         PHY
         PHY
         PEI   $03
         PEI   $01
         JSL   L151699
         PLA
         STA   $01
         PLX
         STX   $03
         BRA   L1E09F8
L1E0A27  LDA   $01
         LDX   $03
         STA   $0E
         STX   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1E0A35  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
L1E0A3D  PHY
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L151699
         PLA
         STA   $0A
         PLX
         STX   $0C
         LDX   #$0000
         LDA   $0A
         ORA   $0C
         BNE   L1E0A57
         INX
L1E0A57  PHX
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L1E1305
         PLA
         ORA   $01,S
         PLX
         LSR
         BCC   L1E0A3D
         LDA   $0A
         LDX   $0C
         STA   $0E
         STX   $10
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

L1E0A81	ENT
         PHD
         TSC
         CLC
         ADC   #$FF9A
         TCS
         TCD
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEI   $76
         PEI   $74
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $72
         PEI   $70
         PEA   $0020
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $61
         STZ   $78
         STZ   $7A
         PHY
         PHY
         PEA   $0000
         PEA   $0062
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $55
         PLX
         STX   $57
         LDA   $55
         ORA   $57
         BNE   L1E0AE5
         BRL   L1E0C9B
L1E0AE5  LDY   #$0002
         LDA   [$55],Y
         PHA
         LDA   [$55]
         PHA
         PEA   $0000
         PEA   $0062
         JSL   L071EC5
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0024
         JSL   L071EC5
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #L086734
         LDX   #^L086734
         STA   $33
         STX   $35
         LDA   #$FFFF
         TAX
         STA   $4D
         STX   $4F
         LDA   $6C
         JSL   L150488
         STA   $39
         STX   $3B
         PHY
         PHY
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   $5D
         PLX
         STX   $5F
         LDX   #$0000
         LDA   $5D
         ORA   $5F
         BNE   L1E0B5F
         INX
L1E0B5F  PHX
         LDAL  L05565D
         BEQ   L1E0B69
         LDA   #$0001
L1E0B69  ORA   $01,S
         PLX
         LSR
         BCC   L1E0B7A
         PEI   $57
         PEI   $55
         JSL   L07185A
         BRL   L1E0C9B
L1E0B7A  LDA   $6E
         BEQ   L1E0B86
         PEI   $5F
         PEI   $5D
         JSL   L15102F
L1E0B86  LDY   #$0002
         LDA   [$55],Y
         TAX
         LDA   [$55]
         STA   $05
         STX   $07
         LDA   #$0042
         CLC
         ADC   $05
         LDX   $07
         BCC   L1E0B9D
         INX
L1E0B9D  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   $5D
         LDX   $5F
         LDY   #$0004
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0032
         CLC
         ADC   $05
         LDX   $07
         BCC   L1E0BC8
         INX
L1E0BC8  STA   $63
         STX   $65
         PHY
         PHY
         JSL   L151319
         PLA
         STA   [$63]
         PLA
         LDY   #$0002
         STA   [$63],Y
         LDA   #$0001
         LDY   #$0038
         STA   [$05],Y
         LDA   #$0008
         CLC
         ADC   $05
         LDX   $07
         BCC   L1E0BEE
         INX
L1E0BEE  STA   $01
         STX   $03
         LDA   L0551D7
         STA   [$01]
         LDA   L0551D3
         LDX   L0551D5
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L1E0C12
         INX
L1E0C12  PHX
         PHA
         PEA   ^L052506
         PEA   L052506
         PEA   $0020
         JSL   L0313BE
         LDA   L0551B1
         ORA   L0551B3
         BNE   L1E0C35
         LDA   $55
         LDX   $57
         STA   L0551B1
         STX   L0551B3
         BRA   L1E0C86
L1E0C35  LDA   L0551B1
         LDX   L0551B3
         STA   $59
         STX   $5B
L1E0C3F  LDY   #$0002
         LDA   [$59],Y
         TAX
         LDA   [$59]
         STA   $63
         STX   $65
         LDA   [$63]
         LDY   #$0002
         ORA   [$63],Y
         BEQ   L1E0C6E
         LDY   #$0002
         LDA   [$59],Y
         TAX
         LDA   [$59]
         STA   $63
         STX   $65
         LDY   #$0002
         LDA   [$63],Y
         TAX
         LDA   [$63]
         STA   $59
         STX   $5B
         BRA   L1E0C3F
L1E0C6E  LDY   #$0002
         LDA   [$59],Y
         TAX
         LDA   [$59]
         STA   $63
         STX   $65
         LDA   $55
         LDX   $57
         STA   [$63]
         TXA
         LDY   #$0002
         STA   [$63],Y
L1E0C86  LDA   #$0001
         STA   L0551D9
         LDA   $5D
         LDX   $5F
         STA   $78
         STX   $7A
         LDA   L0551DB
         INC
         STA   L0551DB
L1E0C9B  PEI   $61
         JSL   L071AA4
         LDA   $6A
         STA   $76
         LDA   $69
         STA   $75
         LDA   $67
         TCD
         TSC
         CLC
         ADC   #$0074
         TCS
         RTL

L1E0CB3  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   #$0000
         TAX
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L1E0CDC
         INX
L1E0CDC  STA   $05
         STX   $07
         PHY
         PHY
         JSL   L151319
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L1E0CFA
         INX
L1E0CFA  PHX
         PHA
         JSL   L150801
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L1E0D0B
         INX
L1E0D0B  PHX
         PHA
         JSL   L151412
         LDA   #$0000
         LDY   #$000E
         STA   [$01],Y
         PHY
         JSL   L090A90
         PLA
         LSR
         BCC   L1E0D30
         LDY   #$000E
         LDA   #$0100
         CLC
         ADC   [$01],Y
         LDY   #$000E
         STA   [$01],Y
L1E0D30  PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L1E0D47
         LDY   #$000E
         LDA   #$0200
         CLC
         ADC   [$01],Y
         LDY   #$000E
         STA   [$01],Y
L1E0D47  PHY
         JSL   L0903C7
         PLA
         LSR
         BCC   L1E0D5E
         LDY   #$000E
         LDA   #$0400
         CLC
         ADC   [$01],Y
         LDY   #$000E
         STA   [$01],Y
L1E0D5E  PHY
         JSL   L09771E
         PLA
         LSR
         BCC   L1E0D75
         LDY   #$000E
         LDA   #$0800
         CLC
         ADC   [$01],Y
         LDY   #$000E
         STA   [$01],Y
L1E0D75
*         PHY
*         PEA   $0000
*         PEA   $C025
*         JSL   L071A89
*         PLA
         ldal  $c025	; AV 202208
         AND   #$0002
         BEQ   L1E0D94
         LDY   #$000E
         LDA   #$1000
         CLC
         ADC   [$01],Y
         LDY   #$000E
         STA   [$01],Y
L1E0D94  PHY
         PEA   $0000
         JSL   L150580
         PLA
         LSR
         BCC   L1E0DAE
         LDY   #$000E
         LDA   #$0080
         CLC
         ADC   [$01],Y
         LDY   #$000E
         STA   [$01],Y
L1E0DAE  LDA   $0C
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

L1E0DC0  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         STZ   $18
         LDA   [$14]
         LDY   #$0002
         ORA   [$14],Y
         BNE   L1E0DD6
         BRL   L1E1038
L1E0DD6  LDA   L0551B1
         LDX   L0551B3
         CMP   [$14]
         BNE   L1E0DE6
         LDY   #$0002
         TXA
         CMP   [$14],Y
L1E0DE6  BNE   L1E0E11
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   L0551B1
         STX   L0551B3
         BRL   L1E0E91
L1E0E11  LDA   L0551B1
         LDX   L0551B3
         STA   $07
         STX   $09
L1E0E1B  LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         CMP   [$0B]
         BNE   L1E0E39
         LDY   #$0002
         TXA
         CMP   [$0B],Y
L1E0E39  BEQ   L1E0E55
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $07
         STX   $09
         BRA   L1E0E1B
L1E0E55  LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $0B
         PLX
         STX   $0D
         STA   [$0B]
         TYA
         LDY   #$0002
         STA   [$0B],Y
L1E0E91  LDA   L0551D3
         ORA   L0551D5
         BEQ   L1E0E9C
         BRL   L1E0F32
L1E0E9C  PHY
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0008
         BCC   L1E0EB8
         INX
L1E0EB8  CLC
         ADC   #$0002
         BCC   L1E0EBF
         INX
L1E0EBF  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PHX
         PHA
         JSL   L1E0965
         PLA
         LSR
         BCC   L1E0F2F
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0008
         BCC   L1E0EF0
         INX
L1E0EF0  STA   $0B
         STX   $0D
         LDA   [$0B]
         PHA
         JSL   L151343
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0008
         BCC   L1E0F16
         INX
L1E0F16  CLC
         ADC   #$0002
         BCC   L1E0F1D
         INX
L1E0F1D  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PHX
         PHA
         JSL   L07185A
L1E0F2F  BRL   L1E1026
L1E0F32  LDA   L0551CF
         ORA   L0551D1
         BNE   L1E0F54
         PHY
         PHY
         PEA   $0000
         PEA   $0006
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L0551CF
         PLA
         STA   L0551D1
         BRA   L1E0F79
L1E0F54  PHY
         PHY
         LDA   L0551CF
         LDX   L0551D1
         PHX
         PHA
         JSL   L151301
         PLA
         PLX
         CLC
         ADC   #$0006
         BCC   L1E0F6B
         INX
L1E0F6B  PHX
         PHA
         LDA   L0551CF
         LDX   L0551D1
         PHX
         PHA
         JSL   L1512FB
L1E0F79  PHY
         PHY
         LDA   L0551CF
         LDX   L0551D1
         PHX
         PHA
         JSL   L151301
         PEA   $0000
         PEA   $0006
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $05
         LDA   L0551CF
         LDX   L0551D1
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L1E0FB5
         DEX
L1E0FB5  DEC
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0008
         BCC   L1E0FE5
         INX
L1E0FE5  CLC
         ADC   #$0002
         BCC   L1E0FEC
         INX
L1E0FEC  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0002
         LDA   [$14],Y
         TAX
         LDA   [$14]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0008
         BCC   L1E101B
         INX
L1E101B  STA   $0B
         STX   $0D
         LDA   [$0B]
         LDY   #$0004
         STA   [$01],Y
L1E1026  LDY   #$0002
         LDA   [$14],Y
         PHA
         LDA   [$14]
         PHA
         JSL   L07185A
         LDA   #$0001
         STA   $18
L1E1038  LDA   $12
         STA   $16
         LDA   $11
         STA   $15
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1E104A  PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $01
         STX   $03
         LDA   #$0008
         CLC
         ADC   $01
         LDX   $03
         BCC   L1E1069
         INX
L1E1069  CLC
         ADC   #$0002
         BCC   L1E1070
         INX
L1E1070  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $0D
         STX   $0F
         LDA   $0D
         ORA   $0F
         BNE   L1E1089
         BRL   L1E112A
L1E1089  LDA   [$0D]
         LDY   #$0002
         ORA   [$0D],Y
         BNE   L1E1095
         BRL   L1E112A
L1E1095  PHY
         PHY
         JSL   L150493
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0006
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L151131
         LDA   L055205
         STA   $11
         LDA   #$0001
         STA   L055205
         LDA   L0551D3
         LDX   L0551D5
         STA   $09
         STX   $0B
         LDA   $0D
         LDX   $0F
         STA   L0551D3
         STX   L0551D5
         LDA   L0551D7
         STA   $15
         LDY   #$0008
         LDA   [$01],Y
         STA   L0551D7
         LDA   L0551DB
         STA   $13
         LDY   #$0002
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         PHA
         PEI   $22
         PEI   $20
         JSL   L0B4245
         LDA   $11
         STA   L055205
         LDA   $15
         STA   L0551D7
         LDA   $09
         LDX   $0B
         STA   L0551D3
         STX   L0551D5
         PEI   $07
         PEI   $05
         JSL   L151131
         LDA   L0551DB
         SEC
         SBC   $13
         BEQ   L1E1121
         BVS   L1E111B
         EOR   #$8000
L1E111B  BPL   L1E1121
         JSL   L1E113C
L1E1121  LDA   $13
         STA   L0551DB
         JSL   L1E0276
L1E112A  LDA   $1E
         STA   $26
         LDA   $1D
         STA   $25
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L1E113C  ENT
	PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   L0551B1
         LDX   L0551B3
         STA   $0B
         STX   $0D
L1E114E  LDA   $0B
         ORA   $0D
         BNE   L1E1157
         BRL   L1E11E2
L1E1157  LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $01
         STX   $03
         LDY   #$0038
         LDA   [$01],Y
         BEQ   L1E11D7
         LDA   #$0000
         LDY   #$0038
         STA   [$01],Y
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0004
         BCC   L1E1199
         INX
L1E1199  STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $05
         STX   $07
         PEI   $0D
         PEI   $0B
         PEA   $03E8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1E11EA
         PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L0A1421
         PLA
         PLX
         STX   $13
         ORA   $13
         BEQ   L1E11D7
         PEI   $07
         PEI   $05
         JSL   L09B242
L1E11D7  LDA   $0F
         LDX   $11
         STA   $0B
         STX   $0D
         BRL   L1E114E
L1E11E2  TSC
         CLC
         ADC   #$0016
         TCS
         PLD
         RTL

L1E11EA  ENT
	PHD
         TSC
         CLC
         ADC   #$FFCE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1E0CB3
         LDA   $3C
         STA   $01
         PEI   $40
         PEI   $3E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $3A
         PEI   $38
         JSL   L1E0000
         LDA   $36
         STA   $40
         LDA   $35
         STA   $3F
         LDA   $33
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L1E1236	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $05
         PHY
         PHY
         PEI   $16
         PEI   $14
         JSL   L0A1421
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L1E127B
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$002E
         BCC   L1E126B
         INX
L1E126B  STA   $07
         STX   $09
         LDA   $10
         LDX   $12
         STA   [$07]
         TXA
         LDY   #$0002
         STA   [$07],Y
L1E127B  PEI   $05
         JSL   L071AA4
         LDA   $0E
         STA   $16
         LDA   $0D
         STA   $15
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1E1293	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $05
         PHY
         PHY
         PEI   $16
         PEI   $14
         JSL   L0A1421
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L1E12BB
         BRA   L1E12E0
L1E12BB  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$003E
         BCC   L1E12CA
         INX
L1E12CA  STA   $07
         STX   $09
         LDA   $10
         LDX   $12
         STA   [$07]
         TXA
         LDY   #$0002
         STA   [$07],Y
         PEI   $05
         JSL   L071AA4
L1E12E0  LDA   $0E
         STA   $16
         LDA   $0D
         STA   $15
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1E12F2	ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0001
         JSL   L1E07C9
         PLY
         PLY
         PLD
         RTL

L1E1305  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L0B0653
         PLA
         BNE   L1E1332
         PHA
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L0A1421
         PLA
         PLX
         STX   $01
         ORA   $01
         BEQ   L1E132F
         LDA   #$0001
L1E132F  ORA   $01,S
         PLX
L1E1332  STA   $0E
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

L1E1345	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $09
         PHY
         PHY
         PEI   $1A
         PEI   $18
         JSL   L0A1421
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L1E1385
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDA   $16
         LDY   #$003A
         STA   [$01],Y
         LDA   $14
         LDY   #$003C
         STA   [$01],Y
L1E1385  PEI   $09
         JSL   L071AA4
         LDA   $12
         STA   $1A
         LDA   $11
         STA   $19
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

