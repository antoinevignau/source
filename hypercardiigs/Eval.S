*
* HypercardGS
* segment: $10 Eval
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   Eval.l
         lst   off

*---------------------------------------

         use   Eval.E
         use   Eval.X

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

L100000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         JSL   L100026
         PLY
         PLY
         PLD
         RTL

L100013  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0001
         JSL   L100026
         PLY
         PLY
         PLD
         RTL

L100026  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         PHY
         PHY
         JSL   L0B37CF
         PLA
         STA   $15
         PLX
         STX   $17
         PHY
         PHY
         JSL   L0B3727
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   $15
         LDX   $17
         PEI   $13
         PEI   $11
         JSL   L150F53
         STA   $0D
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         LDA   L0553DB
         PHA
         JSL   L0B249C
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L10007A
         PEA   $002D
         JSL   L0B0B7A
         BRL   L100104
L10007A  PHY
         PHY
         PEA   $0000
         JSL   L03154C
         PLA
         STA   $05
         PLX
         STX   $07
         PEI   $07
         PEI   $05
         LDY   #$0002
         LDA   [$09],Y
         PHA
         LDA   [$09]
         PHA
         LDX   $17
         LDA   $15
         BNE   L10009D
         DEX
L10009D  DEC
         PHX
         PHA
         JSL   L070597
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PEI   $17
         PEI   $15
         JSL   L150F53
         TAY
         BNE   L1000B8
         DEX
L1000B8  DEC
         STA   $01
         STX   $03
         LDA   $22
         BEQ   L1000D5
         SEP   #$20
         LDA   #$20
         STA   [$01]
         REP   #$20
         LDA   $01
         LDX   $03
         INC
         BNE   L1000D1
         INX
L1000D1  STA   $01
         STX   $03
L1000D5  PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $05
         PLX
         STX   $07
         PEI   $07
         PEI   $05
         PEI   $03
         PEI   $01
         PEI   $13
         PEI   $11
         JSL   L070597
         JSL   L0E0000
         JSL   L0E0000
         PEI   $0B
         PEI   $09
         JSL   L0E0CFE
L100104  LDA   $20
         STA   $22
         LDA   $1F
         STA   $21
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L100116  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0E0678
         PHY
         JSL   L0E0678
         PLA
         STA   $01
         PLA
         AND   $01
         PHA
         JSL   L0E0E4B
         PLY
         PLY
         PLD
         RTL

L100137  ENT
         PHD
         TSC
         CLC
         ADC   #$FD96
         TCS
         ADC   #$0173
         TCD
         STZ   L05538F
         PHY
         JSL   L03198D
         PLA
         LSR
         BCS   L100151
         BRL   L100672
L100151  TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0E00CC
         PHY
         JSL   L03198D
         PLA
         LSR
         BCS   L10016A
         BRL   L10065A
L10016A  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $CF
         AND   $DB
         BNE   L100180
         BRL   L10026D
L100180  LDA   L0553AB
         SEC
         SBC   #$0007
         BPL   L10018C
         BRL   L10026A
L10018C  CMP   #$000D
         BMI   L100194
         BRL   L10026A
L100194  SEC
         SBC   #$0000
         BEQ   L1001B8
         DEC
         DEC
         BNE   L1001A1
         BRL   L10022A
L1001A1  DEC
         BEQ   L1001EA
         SEC
         SBC   #$0005
         BNE   L1001AD
         BRL   L100249
L1001AD  DEC
         BEQ   L10020B
         DEC
         DEC
         DEC
         BEQ   L1001D1
         BRL   L10026A
L1001B8  LDA   $DD
         LDX   $DF
         CMP   $D1
         BNE   L1001C2
         CPX   $D3
L1001C2  BEQ   L1001C9
         LDA   #$0000
         BRA   L1001CC
L1001C9  LDA   #$0001
L1001CC  STA   $EF
         BRL   L10026A
L1001D1  LDA   $DD
         LDX   $DF
         CMP   $D1
         BNE   L1001DB
         CPX   $D3
L1001DB  BNE   L1001E2
         LDA   #$0000
         BRA   L1001E5
L1001E2  LDA   #$0001
L1001E5  STA   $EF
         BRL   L10026A
L1001EA  PEI   $D3
         PEI   $D1
         LDA   $DD
         LDX   $DF
         JSL   L033477
         BEQ   L1001FF
         BVS   L1001FD
         EOR   #$8000
L1001FD  BMI   L100204
L1001FF  LDA   #$0000
         BRA   L100207
L100204  LDA   #$0001
L100207  STA   $EF
         BRA   L10026A
L10020B  PEI   $D3
         PEI   $D1
         LDA   $DD
         LDX   $DF
         JSL   L033477
         BVS   L10021C
         EOR   #$8000
L10021C  BPL   L100223
         LDA   #$0000
         BRA   L100226
L100223  LDA   #$0001
L100226  STA   $EF
         BRA   L10026A
L10022A  PEI   $D3
         PEI   $D1
         LDA   $DD
         LDX   $DF
         JSL   L033477
         BVS   L10023B
         EOR   #$8000
L10023B  BMI   L100242
         LDA   #$0000
         BRA   L100245
L100242  LDA   #$0001
L100245  STA   $EF
         BRA   L10026A
L100249  PEI   $D3
         PEI   $D1
         LDA   $DD
         LDX   $DF
         JSL   L033477
         BEQ   L100263
         BVS   L10025C
         EOR   #$8000
L10025C  BPL   L100263
         LDA   #$0000
         BRA   L100266
L100263  LDA   #$0001
L100266  STA   $EF
         BRA   L10026A
L10026A  BRL   L100658
L10026D  LDA   $DB
         BEQ   L1002B3
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         LDA   $DD
         LDX   $DF
         TXY
         LDX   #$FEBB
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB1
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB1
         PHA
         PEA   $000A
         JSL   L0313BE
L1002B3  LDA   $CF
         BEQ   L1002F9
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         LDA   $D1
         LDX   $D3
         TXY
         LDX   #$FEBB
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB1
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB1
         PHA
         PEA   $000A
         JSL   L0313BE
L1002F9  LDA   L0553AB
         SEC
         SBC   #$0007
         BPL   L100305
         BRL   L100658
L100305  CMP   #$000D
         BMI   L10030D
         BRL   L100658
L10030D  SEC
         SBC   #$0000
         BEQ   L10033A
         DEC
         DEC
         BNE   L10031A
         BRL   L10059C
L10031A  DEC
         BNE   L100320
         BRL   L1004E2
L100320  SEC
         SBC   #$0005
         BNE   L100329
         BRL   L1005FA
L100329  DEC
         BNE   L10032F
         BRL   L10053F
L10032F  DEC
         DEC
         DEC
         BNE   L100337
         BRL   L10040E
L100337  BRL   L100658
L10033A  PEA   $0000
         TDC
         CLC
         ADC   #$FE97
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $0002
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA1
         PHA
         PEA   $000F
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA1
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FE8D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE8D
         PHA
         PEA   ^L0402F8
         PEA   L0402F8
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FE97
         PHA
         PEA   $000A
         _SANEFP816
         BVS   L100406
         LDA   #$0000
         BRA   L100409
L100406  LDA   #$0001
L100409  STA   $EF
         BRL   L100658
L10040E  PEA   $0000
         TDC
         CLC
         ADC   #$FE97
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $0002
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA1
         PHA
         PEA   $000F
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA1
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FE8D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE8D
         PHA
         PEA   ^L040302
         PEA   L040302
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FE97
         PHA
         PEA   $000A
         _SANEFP816
         BMI   L1004DA
         LDA   #$0000
         BRA   L1004DD
L1004DA  LDA   #$0001
L1004DD  STA   $EF
         BRL   L100658
L1004E2  PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $000A
         _SANEFP816
         BMI   L100537
         LDA   #$0000
         BRA   L10053A
L100537  LDA   #$0001
L10053A  STA   $EF
         BRL   L100658
L10053F  PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $000A
         _SANEFP816
         BVS   L100594
         LDA   #$0000
         BRA   L100597
L100594  LDA   #$0001
L100597  STA   $EF
         BRL   L100658
L10059C  PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $000A
         _SANEFP816
         BEQ   L1005F3
         BMI   L1005F3
         LDA   #$0000
         BRA   L1005F6
L1005F3  LDA   #$0001
L1005F6  STA   $EF
         BRA   L100658
L1005FA  PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAB
         PHA
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB5
         PHA
         PEA   $000A
         _SANEFP816
         BEQ   L100651
         BVS   L100651
         LDA   #$0000
         BRA   L100654
L100651  LDA   #$0001
L100654  STA   $EF
         BRA   L100658
L100658  BRA   L10066D
L10065A  TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0E07F9
         JSL   L031B09
         BRA   L100674
L10066D  BRL   L10078B
         BRA   L100674
L100672  BRA   L100674
L100674  JSL   L031B09
         JSL   L0B32A5
         JSL   L031B09
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $EB
         PLX
         STX   $ED
         PHY
         PHY
         PEA   $0000
         JSL   L03154C
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDX   #$0000
         LDA   #$0007
         CMP   L0553AB
         BNE   L1006AA
         INX
L1006AA  PHX
         LDX   #$0000
         LDA   #$0013
         CMP   L0553AB
         BNE   L1006B7
         INX
L1006B7  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1006D0
         PHY
         PEI   $ED
         PEI   $EB
         PEI   $E9
         PEI   $E7
         JSL   L0B8146
         PLA
         STA   $F1
         BRA   L1006E0
L1006D0  PHY
         PEI   $ED
         PEI   $EB
         PEI   $E9
         PEI   $E7
         JSL   L0B8189
         PLA
         STA   $F1
L1006E0  JSL   L0E0000
         JSL   L0E0000
         LDA   L0553AB
         SEC
         SBC   #$0007
         BPL   L1006F4
         BRL   L10078B
L1006F4  CMP   #$000D
         BMI   L1006FC
         BRL   L10078B
L1006FC  SEC
         SBC   #$0000
         BEQ   L100719
         DEC
         DEC
         BEQ   L10074F
         DEC
         BEQ   L100731
         SEC
         SBC   #$0005
         BEQ   L10076C
         DEC
         BEQ   L10073F
         DEC
         DEC
         DEC
         BEQ   L100726
         BRA   L10078B
L100719  LDX   #$0000
         LDA   $F1
         BNE   L100721
         INX
L100721  TXA
         STA   $EF
         BRA   L10078B
L100726  LDA   $F1
         BEQ   L10072D
         LDA   #$0001
L10072D  STA   $EF
         BRA   L10078B
L100731  LDX   #$0000
         LDA   $F1
         DEC
         BNE   L10073A
         INX
L10073A  TXA
         STA   $EF
         BRA   L10078B
L10073F  LDX   #$0000
         LDA   #$FFFF
         CMP   $F1
         BNE   L10074A
         INX
L10074A  TXA
         STA   $EF
         BRA   L10078B
L10074F  LDX   #$0000
         LDA   $F1
         DEC
         BNE   L100758
         INX
L100758  TXA
         BNE   L100768
         PHA
         LDX   #$0000
         LDA   $F1
         BNE   L100764
         INX
L100764  TXA
         ORA   $01,S
         PLX
L100768  STA   $EF
         BRA   L10078B
L10076C  LDX   #$0000
         LDA   #$FFFF
         CMP   $F1
         BNE   L100777
         INX
L100777  TXA
         BNE   L100787
         PHA
         LDX   #$0000
         LDA   $F1
         BNE   L100783
         INX
L100783  TXA
         ORA   $01,S
         PLX
L100787  STA   $EF
         BRA   L10078B
L10078B  PEI   $EF
         JSL   L0E0E4B
         LDA   #$0001
         STA   L05538F
         TSC
         CLC
         ADC   #$026A
         TCS
         PLD
         RTL

L10079F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         JSL   L0B32A5
         JSL   L1008D4
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1007B5  ENT
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
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $01
         ORA   $03
         BEQ   L1007F3
         PEI   $07
         PEI   $05
         PEI   $03
         PEI   $01
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         JSL   L0E0E79
         BRA   L1007FA
L1007F3  PEA   $0009
         JSL   L0B0B7A
L1007FA  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L100802  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L0E04A7
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0E04A7
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0015
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
         PEA   $0006
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$002C
         TCS
         PLD
         RTL

L100887  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0E04A7
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
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L1504B7
         JSL   L0E0C71
         TSC
         CLC
         ADC   #$0022
         TCS
         PLD
         RTL

L1008D4  ENT
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
         JSL   L03154C
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         JSL   L071CE4
         PLA
         STA   $01
         PLX
         STX   $03
         JSL   L0E0000
         JSL   L0E0000
         LDA   $01
         ORA   $03
         BEQ   L10090B
         LDA   #$0001
L10090B  PHA
         JSL   L0E0E4B
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L100916  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L1008D4
         JSL   L0B26CD
         PLY
         PLY
         PLD
         RTL

L10092A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L100AA7
         JSL   L0B26CD
         PLY
         PLY
         PLD
         RTL

L10093E  PHD
         TSC
         CLC
         ADC   #$FEE0
         TCS
         ADC   #$002F
         TCD
         JSL   L031B09
         LDA   L0553B5
         LDX   L0553B7
         STA   $D3
         STX   $D5
         PHY
         JSL   L0B1C0F
         PLA
         STA   $D1
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PHY
         PHY
         JSL   L0B3727
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L0B7932
         PEI   $D1
         JSL   L0B39C0
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         JSL   L0E06AC
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0B2AF9
         PHY
         PEI   $FA
         JSL   L0B4D5D
         PLA
         LSR
         BCC   L1009B0
         LDA   #$0001
         STA   $FC
         BRA   L1009BF
L1009B0  STZ   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         JSL   L0E0EA8
L1009BF  TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L0B0F05
         PEI   $D5
         PEI   $D3
         PEA   $0000
         JSL   L0B2AF9
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0128
         TCS
         RTL

L1009E9  PHD
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
         CMP   #$000C
         BNE   L100A01
         CPX   #$0000
L100A01  BNE   L100A0A
         LDA   #$0001
         STA   $0E
         BRA   L100A37
L100A0A  PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$01A6
         BCC   L100A24
         INX
L100A24  STA   $01
         STX   $03
         LDA   [$01]
         PHA
         PEA   $0000
         PEI   $0A
         JSL   L10093E
         PLA
         STA   $0E
L100A37  LDA   $08
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

L100A48  PHD
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
         CMP   #$000B
         BNE   L100A60
         CPX   #$0000
L100A60  BNE   L100A69
         LDA   #$0001
         STA   $0E
         BRA   L100A96
L100A69  PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$01A8
         BCC   L100A83
         INX
L100A83  STA   $01
         STX   $03
         LDA   [$01]
         PHA
         PEA   $0000
         PEI   $0A
         JSL   L10093E
         PLA
         STA   $0E
L100A96  LDA   $08
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

L100AA7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         PHY
         PEA   $0000
         PHD
         JSL   L1009E9
         PLA
         LSR
         BCS   L100ACB
         LDA   #$0065
         STA   $01
         JSL   L0B32A5
         JSL   L0E0000
         BRA   L100AF3
L100ACB  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $000C
         JSL   L0E0656
         PHY
         PEA   $0000
         PHD
         JSL   L100A48
         PLA
         LSR
         BCS   L100B12
         LDA   #$0066
         STA   $01
L100AF3  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEI   $01
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0841
         PEA   $0000
         JSL   L0E0E4B
         BRA   L100B43
L100B12  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L1512CB
         JSL   L0E0E4B
L100B43  TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L100B4B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0002
         JSL   L0B7E9D
         PLY
         PLY
         PLD
         RTL

L100B5E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC4
         TCS
         TCD
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L0E00CC
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $2B
         AND   $1F
         BEQ   L100BAE
         LDA   $21
         ORA   $23
         BEQ   L100BA4
         PEI   $2F
         PEI   $2D
         PEI   $23
         PEI   $21
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         JSL   L0E0DE2
         BRA   L100BAB
L100BA4  PEA   $000A
         JSL   L0B0B7A
L100BAB  BRL   L100D6A
L100BAE  LDA   $1F
         BEQ   L100BF4
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         LDA   $21
         LDX   $23
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
L100BF4  LDA   $2B
         BEQ   L100C3A
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         LDA   $2D
         LDX   $2F
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
L100C3A  TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0021
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
         ADC   #$002D
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
         JSL   L0333DF
         TAY
         CLC
         TSC
         ADC   #$0018
         TCS
         TYA
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0015
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
         PEA   ^L04030C
         PEA   L04030C
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $000A
         _SANEFP816
         BVS   L100CF1
         LDA   #$0000
         BRA   L100CF4
L100CF1  LDA   #$0001
L100CF4  BEQ   L100D5D
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         TDC
         CLC
         ADC   #$0015
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
         ADC   #$0021
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
L100D5D  TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0E0C71
L100D6A  TSC
         CLC
         ADC   #$003C
         TCS
         PLD
         RTL

L100D72  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0E0678
         PHY
         JSL   L0E0678
         PLA
         ORA   $01,S
         PLX
         PHA
         JSL   L0E0E4B
         PLY
         PLY
         PLD
         RTL

L100D91  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         JSL   L0B7E9D
         PLY
         PLY
         PLD
         RTL

L100DA4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0004
         JSL   L0B7E9D
         PLY
         PLY
         PLD
         RTL

