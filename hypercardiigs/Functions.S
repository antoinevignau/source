*
* HypercardGS
* segment: $13 Functions
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   Functions.l
         lst   off

*---------------------------------------

         use   Functions.E
         use   Functions.X

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

L130000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $15
         BEQ   L130037
         LDA   $17
         LDX   $19
         TXY
         BPL   L13002E
         TAY
         TXA
         EOR   #$FFFF
         TAX
         TYA
         EOR   #$FFFF
         INC
         BNE   L13002E
         INX
L13002E  PHX
         PHA
         JSL   L0E0E79
         BRL   L1300E0
L130037  PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
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
         PEA   ^L0403A0
         PEA   L0403A0
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $000A
         _SANEFP816
         BVS   L130089
         LDA   #$0000
         BRA   L13008C
L130089  LDA   #$0001
L13008C  BEQ   L1300D3
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $000D
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $000A
         JSL   L0313BE
L1300D3  TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0E0C71
L1300E0  TSC
         CLC
         ADC   #$0024
         TCS
         PLD
         RTL

L1300E8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0016
         JSL   L0B80C8
         PLY
         PLY
         PLD
         RTL

L1300FB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0018
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L130111  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   ^L0403AA
         PEA   L0403AA
         PEA   $000A
         JSL   L0313BE
         PHY
         JSL   L0E05E8
         PLA
         STA   $2D
         LDA   $2D
         STA   $15
         LDA   $15
         SEC
         SBC   #$0001
         BVS   L130146
         EOR   #$8000
L130146  BMI   L13014B
         BRL   L130215
L13014B  LDA   #$0001
         STA   $2F
L130150  TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $17
         BEQ   L1301A3
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         LDA   $19
         LDX   $1B
         TXY
         LDX   #$0011
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $000A
         JSL   L0313BE
L1301A3  TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
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
         ADC   #$0019
         PEA   $0000
         PHA
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
         PEA   $000A
         JSL   L0313BE
         LDA   $2F
         CMP   $15
         BEQ   L130215
         INC   $2F
         BRL   L130150
L130215  PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0009
         PHA
         LDA   $2D
         LDX   #$0009
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0406
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$0034
         TCS
         PLD
         RTL

L130266  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         JSL   L031B09
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   #$00FF
         AND   [$01]
         STA   $05
         JSL   L0E0000
         LDA   $05
         AND   #$00FF
         PHA
         JSL   L0E0E11
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L13029D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         LDAL  L052D62
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         JSL   L0E0E11
         PLY
         PLY
         PLD
         RTL

L1302BA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDAL  L052D62
         TAX
         LDAL  L052D60
         STA   $01
         STX   $03
         PHY
         PEI   $03
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
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

L1302F8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L052D60
         PHA
         JSL   L0E0E11
         PLY
         PLY
         PLD
         RTL

L13030D  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0002
         JSL   L0C01FD
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L130334  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0001
         JSL   L0C01FD
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L13035B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L090A90
         JSL   L0E0C20
         PLY
         PLY
         PLD
         RTL

L130370  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0014
         JSL   L0B80C8
         PLY
         PLY
         PLD
         RTL

L130383  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $001C
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L130399  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0011
         TCD
         PHY
         PHY
         PEA   $0006
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $F1
         PEI   $EF
         LDA   L0553B3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B1E76
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0E0EA8
         TSC
         CLC
         ADC   #$0108
         TCS
         PLD
         RTL

L1303F0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L0752E6
         JSL   L0E0E79
         PLY
         PLY
         PLD
         RTL

L13040E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0008
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L130424  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $000C
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L13043A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $000A
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L130450  ENT
         PHD
         TSC
         CLC
         ADC   #$FBE8
         TCS
         ADC   #$0321
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L13047E
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000C
         PEA   $0003
         JSL   L0E0656
         BRA   L13048B
L13047E  TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L0B0D87
L13048B  PHY
         PHY
         JSL   L0E05E8
         PEA   $0000
         PEA   $0009
         JSL   L071A1B
         PLA
         STA   $E5
         LDA   $E5
         BNE   L1304B0
         JSL   L0E0000
         PEA   $006D
         JSL   L0B0B7A
         BRL   L130628
L1304B0  PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCDF
         PHA
         PEA   $001C
         JSL   L0B127A
         PEA   $0100
         JSL   L0313BE
         LDX   #$FFE3
         STZ   $00,X
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L130508
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCDF
         PHA
         PEA   $001D
         JSL   L0B127A
         PEA   $0100
         JSL   L0313BE
         LDA   #$0001
         LDX   #$FFE3
         STA   $00,X
L130508  JSL   L0E0000
         PHY
         PEI   $E5
         PEI   $E9
         PEI   $E7
         PEI   $ED
         PEI   $EB
         LDX   #$FFE3
         LDA   $00,X
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         JSL   L07A71B
         PLA
         LDX   #$FFE1
         STA   $00,X
         LDX   #$FFDF
         LDA   $00,X
         BNE   L13056F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   ^L0403B4
         PEA   L0403B4
         PEA   $0000
         TDC
         CLC
         ADC   #$FDCB
         PHA
         LDA   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L0403B5
         PEA   L0403B5
         JSL   L0B24DB
         PEA   $006F
         JSL   L0B0B7A
         BRL   L130628
L13056F  LDAL  L0403B6
         LDX   #$FEDF
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDX   #$FFE1
         LDA   $00,X
         BNE   L130586
         BRL   L13061B
L130586  PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   ^L0403B7
         PEA   L0403B7
         PEA   $0000
         TDC
         CLC
         ADC   #$FDCB
         PHA
         LDX   #$FFE1
         LDA   $00,X
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDF
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   L055027
         LDX   L055029
         CMP   $E7
         BNE   L1305D9
         CPX   $E9
L1305D9  BEQ   L13061B
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEA   ^L0403C0
         PEA   L0403C0
         PEA   $0000
         TDC
         CLC
         ADC   #$FDCB
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDF
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L13061B  PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         JSL   L0E0EA8
L130628  TSC
         CLC
         ADC   #$0418
         TCS
         PLD
         RTL

L130630  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L1510A7
         JSL   L0E0E79
         PLY
         PLY
         PLD
         RTL

L130646  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         JSL   L071C98
         PLA
         STA   $01
         PLX
         STX   $03
         JSL   L0E0000
         PEI   $03
         PEI   $01
         JSL   L0E0E79
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L130675  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L13068B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0004
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L1306A1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0002
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L1306B7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   ^L0403CD
         PEA   L0403CD
         PEA   $000A
         JSL   L0313BE
         PHY
         JSL   L0E05E8
         PLA
         STA   $2D
         LDA   $2D
         STA   $15
         LDA   $15
         SEC
         SBC   #$0001
         BVS   L1306EC
         EOR   #$8000
L1306EC  BMI   L1306F1
         BRL   L1307C7
L1306F1  LDA   #$0001
         STA   $2F
L1306F6  TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $21
         BEQ   L130749
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         LDA   $23
         LDX   $25
         TXY
         LDX   #$0011
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $000A
         JSL   L0313BE
L130749  PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
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
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $000A
         _SANEFP816
         BMI   L13079E
         LDA   #$0000
         BRA   L1307A1
L13079E  LDA   #$0001
L1307A1  BEQ   L1307BC
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
L1307BC  LDA   $2F
         CMP   $15
         BEQ   L1307C7
         INC   $2F
         BRL   L1306F6
L1307C7  TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$0034
         TCS
         PLD
         RTL

L1307DC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   ^L0403D7
         PEA   L0403D7
         PEA   $000A
         JSL   L0313BE
         PHY
         JSL   L0E05E8
         PLA
         STA   $2D
         LDA   $2D
         STA   $15
         LDA   $15
         SEC
         SBC   #$0001
         BVS   L130811
         EOR   #$8000
L130811  BMI   L130816
         BRL   L1308EC
L130816  LDA   #$0001
         STA   $2F
L13081B  TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $21
         BEQ   L13086E
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         LDA   $23
         LDX   $25
         TXY
         LDX   #$0011
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $000A
         JSL   L0313BE
L13086E  PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
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
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $000A
         _SANEFP816
         BVS   L1308C3
         LDA   #$0000
         BRA   L1308C6
L1308C3  LDA   #$0001
L1308C6  BEQ   L1308E1
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
L1308E1  LDA   $2F
         CMP   $15
         BEQ   L1308EC
         INC   $2F
         BRL   L13081B
L1308EC  TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$0034
         TCS
         PLD
         RTL

L130901  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         STZ   $01
         PHY
         PEA   $0002
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150070
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         ORA   $01,S
         PLX
         PHA
         JSL   L0E0C20
         LDA   $01
         DEC
         BNE   L130949
         LDA   $0B
         LDX   $0D
         STAL  L052D60
         TXA
         STAL  L052D62
         LDA   $07
         LDX   $09
         STA   L05522B
         STX   L05522D
L130949  PHY
         PEA   $0006
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $2F
         TSC
         CLC
         ADC   #$0034
         TCS
         PLD
         RTL

L13095F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCE
         TCS
         TCD
L130967  PHY
         PEA   $0006
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150070
         PLA
         LSR
         BCC   L1309B1
         LDA   $01
         DEC
         BNE   L1309AF
         PEA   $0001
         JSL   L0E0E4B
         LDA   $0B
         LDX   $0D
         STAL  L052D60
         TXA
         STAL  L052D62
         LDA   $07
         LDX   $09
         STA   L05522B
         STX   L05522D
L13099F  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L13099F
         BRA   L1309B8
L1309AF  BRA   L130967
L1309B1  PEA   $0000
         JSL   L0E0E4B
L1309B8  TSC
         CLC
         ADC   #$0032
         TCS
         PLD
         RTL

L1309C0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEI   $03
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         JSL   L0E0E11
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1309F5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEI   $03
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
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

L130A3F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150801
         PEI   $01
         JSL   L0E0E11
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L130A6C  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE4
         TCS
         ADC   #$0025
         TCD
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0001
         BPL   L130A86
         BRL   L130DEB
L130A86  CMP   #$0009
         BMI   L130A8E
         BRL   L130DEB
L130A8E  ASL
         TAX
         LDAL  L130A96,X
         PHA
         RTS

L130A96  DA    L130AA8-1
         DA    L130ABC-1
         DA    L130AD0-1
         DA    L130DEB-1
         DA    L130B79-1
         DA    L130C36-1
         DA    L130CE6-1
         DA    L130D9E-1
         DA    L130DB7-1

L130AA8  LDAL  L053ACB
         TAX
         LDAL  L053AC9
         STA   $EF
         STX   $F1
         JSL   L0E0000
         BRL   L130DEB
L130ABC  LDAL  L053AC3
         TAX
         LDAL  L053AC1
         STA   $EF
         STX   $F1
         JSL   L0E0000
         BRL   L130DEB
L130AD0  PHY
         JSL   L0E05E8
         PLA
         DEC
         BPL   L130ADC
         BRL   L130B76
L130ADC  CMP   #$0004
         BMI   L130AE4
         BRL   L130B76
L130AE4  SEC
         SBC   #$0000
         BEQ   L130AF6
         DEC
         BEQ   L130B16
         DEC
         BEQ   L130B36
         DEC
         BEQ   L130B56
         BRL   L130B76
L130AF6  PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130B10
         DEX
L130B10  STA   $EF
         STX   $F1
         BRA   L130B76
L130B16  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130B30
         DEX
L130B30  STA   $EF
         STX   $F1
         BRA   L130B76
L130B36  PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130B50
         DEX
L130B50  STA   $EF
         STX   $F1
         BRA   L130B76
L130B56  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130B70
         DEX
L130B70  STA   $EF
         STX   $F1
         BRA   L130B76
L130B76  BRL   L130DEB
L130B79  PHY
         PHY
         PEA   $0012
         JSL   L03154C
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $E3
         PLX
         STX   $E5
         LDA   $E3
         LDX   $E5
         STA   $DF
         STX   $E1
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L071BC3
         LDA   $EB
         DEC
         BMI   L130C2B
         CMP   #$0004
         BPL   L130C2B
         SEC
         SBC   #$0000
         BEQ   L130BD3
         DEC
         BEQ   L130BE9
         DEC
         BEQ   L130BFF
         DEC
         BEQ   L130C15
         BRA   L130C2B
L130BD3  PHY
         PHY
         PEI   $E5
         PEI   $E3
         PEI   $E1
         PEI   $DF
         JSL   L0B0B98
         PLA
         STA   $EF
         PLX
         STX   $F1
         BRA   L130C2B
L130BE9  PHY
         PHY
         PEI   $E5
         PEI   $E3
         PEI   $E1
         PEI   $DF
         JSL   L0B0C90
         PLA
         STA   $EF
         PLX
         STX   $F1
         BRA   L130C2B
L130BFF  PHY
         PHY
         PEI   $E5
         PEI   $E3
         PEI   $E1
         PEI   $DF
         JSL   L0B0C30
         PLA
         STA   $EF
         PLX
         STX   $F1
         BRA   L130C2B
L130C15  PHY
         PHY
         PEI   $E5
         PEI   $E3
         PEI   $E1
         PEI   $DF
         JSL   L0B0BC2
         PLA
         STA   $EF
         PLX
         STX   $F1
         BRA   L130C2B
L130C2B  JSL   L0E0000
         JSL   L0E0000
         BRL   L130DEB
L130C36  TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         PHY
         PEI   $C1
         PEI   $BF
         JSL   L0D109F
         PLA
         LSR
         BCS   L130C5C
         BRL   L130CE3
L130C5C  LDA   $BD
         DEC
         BMI   L130CD8
         CMP   #$0003
         BPL   L130CD8
         SEC
         SBC   #$0000
         BEQ   L130C74
         DEC
         BEQ   L130CAA
         DEC
         BEQ   L130CC6
         BRA   L130CD8
L130C74  PHY
         PEI   $CF
         PEI   $CD
         PEI   $CB
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCC   L130CA8
         PHY
         PEI   $CF
         PEI   $CD
         PEI   $CB
         PEA   $0000
         JSL   L07AD84
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130CA4
         DEX
L130CA4  STA   $EF
         STX   $F1
L130CA8  BRA   L130CDF
L130CAA  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $C9
         PEI   $C7
         JSL   L07C5A6
         PLA
         STA   $EF
         PLX
         STX   $F1
         BRA   L130CDF
L130CC6  PHY
         PHY
         PEI   $C5
         PEI   $C3
         JSL   L07A3E8
         PLA
         STA   $EF
         PLX
         STX   $F1
         BRA   L130CDF
L130CD8  PEA   $003B
         JSL   L0B0B7A
L130CDF  JSL   L0B381C
L130CE3  BRL   L130DEB
L130CE6  PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L0940E5
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEA   $0000
         PEA   $002C
         PEA   $0001
         JSL   L0E0656
         LDA   #$0006
         LDX   #$FFDB
         STA   $00,X
         JSL   L0E0000
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCC   L130D82
         STZ   $EF
         STZ   $F1
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDA   $DB
         ORA   $DD
         BEQ   L130D80
         LDY   #$0002
         LDA   [$DB],Y
         TAX
         LDA   [$DB]
         CLC
         ADC   #$0014
         BCC   L130D61
         INX
L130D61  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $EF
         STX   $F1
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L130D80  BRA   L130D8B
L130D82  PEA   $007D
         JSL   L0B0B7A
         BRA   L130DF3
L130D8B  PHY
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $D9
         BRA   L130DEB
L130D9E  PHY
         JSL   L1606BE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130DAD
         DEX
L130DAD  STA   $EF
         STX   $F1
         JSL   L0E0000
         BRA   L130DEB
L130DB7  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $D5
         PLX
         STX   $D7
         LDA   $D5
         ORA   $D7
         BNE   L130DD2
         PEA   $0084
         JSL   L0B0B7A
         BRA   L130DF3
L130DD2  PHY
         PEI   $D7
         PEI   $D5
         JSL   L160758
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L130DE5
         DEX
L130DE5  STA   $EF
         STX   $F1
L130DE9  BRA   L130DEB
L130DEB  PEI   $F1
         PEI   $EF
         JSL   L0E0E79
L130DF3  TSC
         CLC
         ADC   #$011C
         TCS
         PLD
         RTL

L130DFB  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         LDX   #$FFF3
         SEP   #$20
         LDA   #$01
         STA   $00,X
         REP   #$20
         PHY
         JSL   L0E05E8
         PLA
         AND   #$00FF
         LDX   #$FFF4
         SEP   #$20
         STA   $00,X
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0E0EA8
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L130E38  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         PHY
         PEA   $0000
         JSL   L03154C
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $03
         PEI   $01
         PEI   $07
         PEI   $05
         JSL   L071CE4
         PLA
         STA   $09
         PLX
         STX   $0B
         JSL   L0E0000
         JSL   L0E0000
         LDA   $09
         ORA   $0B
         BNE   L130E8C
         PEA   ^L0403E1
         PEA   L0403E1
         JSL   L0E0F0F
         BRA   L130EA2
L130E8C  PEI   $0B
         PEI   $09
         LDA   $05
         LDX   $07
         JSL   L1512A5
         INC
         BNE   L130E9C
         INX
L130E9C  PHX
         PHA
         JSL   L0E0DE2
L130EA2  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L130EAA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L09771E
         JSL   L0E0C20
         PLY
         PLY
         PLD
         RTL

L130EBF  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$000F
         TCD
         PHY
         JSL   L0E05E8
         PLA
         STA   $F1
         LDA   L055205
         BEQ   L130EDE
         JSL   L0E0C52
         BRL   L130F6C
L130EDE  LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L130EEC
         CPX   L0553BB
L130EEC  BEQ   L130EF3
         LDA   #$0000
         BRA   L130EF6
L130EF3  LDA   #$0001
L130EF6  PHA
         PEI   $F1
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$001E
         BCC   L130F06
         INX
L130F06  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         PLA
         LDX   #$0001
         SEC
         SBC   $01,S
         BVS   L130F19
         EOR   #$8000
L130F19  BPL   L130F1C
         DEX
L130F1C  PLA
         TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L130F2A
         JSL   L0E0C52
         BRA   L130F6C
L130F2A  LDA   $F1
         BNE   L130F5E
         LDA   L0553B9
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
         ADC   #$FFF1
         PHA
         JSL   L0B1388
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         JSL   L0E0EA8
         BRA   L130F6C
L130F5E  LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         PEI   $F1
         JSL   L0B3A6A
L130F6C  TSC
         CLC
         ADC   #$0106
         TCS
         PLD
         RTL

L130F74  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L055205
         BEQ   L130F8A
         PEA   $0000
         JSL   L0E0E11
         BRA   L130FA2
L130F8A  LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$001E
         BCC   L130F97
         INX
L130F97  STA   $03
         STX   $05
         LDA   [$03]
         PHA
         JSL   L0E0E11
L130FA2  PLY
         PLY
         PLY
         PLD
         RTL

L130FA7  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0013
         TCD
         LDX   #$FFED
         SEP   #$20
         LDA   #$01
         STA   $00,X
         REP   #$20
         LDA   $FA
         LDX   #$FFEE
         SEP   #$20
         STA   $00,X
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L0E0EA8
         JSL   L100000
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$010C
         TCS
         RTL

L130FEB  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEA   ^L0403E3
         PEA   L0403E3
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L0403E5
         PEA   L0403E5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0003
         JSL   L1509CE
         JSL   L0E0F0F
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L131038  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   L0553B9
         LDX   L0553BB
         STA   $03
         STX   $05
         JSL   L130F74
         PHY
         JSL   L0E05E8
         PLA
         STA   $07
         PEA   $0000
         PEA   $0000
         JSL   L0E0DE2
         JSL   L130EBF
         LDY   #$0038
         LDA   [$03],Y
         BEQ   L131078
         PEA   $0028
         PEA   $0000
         PHD
         JSL   L130FA7
         BRA   L131090
L131078  LDY   #$001E
         LDA   [$03],Y
         SEC
         SBC   #$0000
         BMI   L131090
         BEQ   L131090
         PEA   $0020
         PEA   $0000
         PHD
         JSL   L130FA7
L131090  LDA   $07
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L13109F
         EOR   #$8000
L13109F  BMI   L1310A4
         BRL   L131125
L1310A4  LDA   #$0001
         STA   $0B
L1310A9  PEI   $0B
         JSL   L0E0E11
         JSL   L130EBF
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         STX   $0D
         ORA   $0D
         BEQ   L1310C4
         LDA   #$0001
L1310C4  EOR   #$0001
         PHA
         LDY   #$0050
         LDA   [$03],Y
         EOR   #$0001
         ORA   $01,S
         PLX
         STA   $09
         JSL   L031B09
         LDA   $09
         BEQ   L1310E5
         PEA   $0000
         PHD
         JSL   L130FEB
L1310E5  JSL   L100000
         LDY   #$001E
         LDA   [$03],Y
         STA   $0D
         LDA   $0B
         SEC
         SBC   $0D
         BVS   L1310FA
         EOR   #$8000
L1310FA  BMI   L13111B
         LDY   #$0050
         LDA   [$03],Y
         BEQ   L131110
         PEA   $0020
         PEA   $0000
         PHD
         JSL   L130FA7
         BRA   L13111B
L131110  PEA   $002C
         PEA   $0000
         PHD
         JSL   L130FA7
L13111B  LDA   $0B
         CMP   $01
         BEQ   L131125
         INC   $0B
         BRA   L1310A9
L131125  LDY   #$0038
         LDA   [$03],Y
         BEQ   L131137
         PEA   $0029
         PEA   $0000
         PHD
         JSL   L130FA7
L131137  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L13113F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PEI   $07
         PEI   $05
         JSL   L15057A
         PLA
         BEQ   L131168
         PEA   $0001
         JSL   L0E0E11
         BRA   L131183
L131168  PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L1510CB
         JSL   L0B7E4F
         PLA
         STA   $01
         STZ   $03
         PEI   $03
         PEI   $01
         JSL   L0E0E79
L131183  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L13118B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553A7
         LDX   L0553A9
         PHX
         PHA
         JSL   L0E0CB5
         PLY
         PLY
         PLD
         RTL

L1311A3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         JSL   L150E95
         PLA
         STA   $0B
         PEA   $0000
         JSL   L150DD8
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0E04A7
         PHY
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150082
         JSL   L0E0E79
         PEI   $0B
         JSL   L150DD8
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L1311E8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         STZ   $01
         STZ   $03
         LDA   #$0140
         STA   $07
         LDA   #$00C8
         STA   $05
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

L13121C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         PHY
         PHY
         PEA   $0006
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $15
         PLX
         STX   $17
         STZ   $19
         STZ   $1B
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
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $050E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$0020
         TCS
         PLD
         RTL

L131294  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L099DCE
         JSL   L0E0C20
         PLY
         PLY
         PLD
         RTL

L1312A9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $001A
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L1312BF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0301E4
         PLA
         BNE   L1312DB
         PEA   ^L0403E7
         PEA   L0403E7
         JSL   L0E0F0F
         BRA   L1312E5
L1312DB  PEA   ^L05088E
         PEA   L05088E
         JSL   L0E0EA8
L1312E5  PLY
         PLY
         PLD
         RTL

L1312E9  ENT
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
         JSL   L0E04A7
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $0012
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$0018
         TCS
         PLD
         RTL

L13133F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L1510A7
         JSL   L0E0E79
         PLY
         PLY
         PLD
         RTL

L131355  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $001E
         PEA   $0B0A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L13136B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L05103C
         PEA   L05103C
         PEA   $0004
         JSL   L0B6DE3
         PLY
         PLY
         PLD
         RTL

L131384  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L15035F
         JSL   L0E0E79
         PLY
         PLY
         PLD
         RTL

L13139A  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0011
         TCD
         PHY
         PHY
         PEA   $0006
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $F1
         PEI   $EF
         LDX   #$0000
         LDA   L0553B3
         DEC
         BNE   L1313D5
         INX
L1313D5  PHX
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B21F1
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0E0EA8
         TSC
         CLC
         ADC   #$0108
         TCS
         PLD
         RTL

L1313F8  ENT
         PHD
         TSC
         CLC
         ADC   #$FBFC
         TCS
         ADC   #$030D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDF3
         PHA
         LDA   #$0B22
         CLC
         ADC   L0550BB
         PHA
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FCF3
         PHA
         PEA   $0B22
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF3
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0E0EA8
         TSC
         CLC
         ADC   #$0404
         TCS
         PLD
         RTL

L13145D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0016
         PEA   $090A
         JSL   L0B808C
         PLY
         PLY
         PLD
         RTL

L131473  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0B5955
         PLA
         LSR
         BCS   L13148B
         PEA   $003C
         JSL   L0B0B7A
L13148B  PLY
         PLY
         PLD
         RTL

