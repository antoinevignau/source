*
* HypercardGS
* segment: $0F TalkEdit
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   TalkEdit.l
         lst   off

*---------------------------------------

         use   TalkEdit.E
         use   TalkEdit.X

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

L0F0000  ENT
         PHD
         TSC
         CLC
         ADC   #$FE92
         TCS
         ADC   #$008B
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L073CDF
         PLA
         STA   $D9
         LDA   L05510D
         BEQ   L0F0037
         PEA   $0000
         JSL   L15000C
         JSL   L15059E
L0F0037  PHY
         JSL   L095FB4
         PLA
         LSR
         BCS   L0F004B
         PEI   $F6
         PEI   $F4
         JSL   L07185A
         BRL   L0F061D
L0F004B  LDA   L0550F3
         BEQ   L0F0065
         PEA   ^L04050F
         PEA   L04050F
         JSL   L07010A
         PEI   $F6
         PEI   $F4
         JSL   L07185A
         BRL   L0F061D
L0F0065  LDA   #$0001
         STA   L0550F1
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $DB
         PLX
         STX   $DD
         PHY
         PHY
         PEA   $1450
         JSL   L072834
         PLA
         STA   $D5
         PLX
         STX   $D7
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   ^L040528
         PEA   L040528
         PEA   ^L040529
         PEA   L040529
         PEA   ^L04052A
         PEA   L04052A
         JSL   L073C22
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         PEA   $0000
         PEA   $0005
         JSL   L151367
         PLA
         STA   $D1
         PLX
         STX   $D3
         LDA   $E8
         BPL   L0F00C1
         STZ   $E8
L0F00C1  PHY
         PHY
         PEI   $F6
         PEI   $F4
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         TDC
         CLC
         ADC   #$00E8
         PEA   $0000
         PHA
         JSL   L0F12F1
         PLA
         STA   $AB
         PLX
         STX   $AD
         PEI   $F6
         PEI   $F4
         JSL   L07185A
         STZ   $F4
         STZ   $F6
         PEA   $0001
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $D3
         PEI   $D1
         JSL   L151645
         LDA   $E8
         JSL   L150488
         PHX
         PHA
         LDA   $E8
         JSL   L150488
         PHX
         PHA
         PEI   $D3
         PEI   $D1
         JSL   L150006
         LDA   L055051
         BEQ   L0F0190
         LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         TXY
         LDX   #$FF79
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF79
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0028
         BCC   L0F0154
         INX
L0F0154  PHX
         PHA
         PHY
         PHY
         LDX   #$FF79
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0028
         BCC   L0F0168
         INX
L0F0168  STA   $DF
         STX   $E1
         LDY   #$0002
         LDA   [$DF],Y
         TAX
         LDA   [$DF]
         PHX
         PHA
         PEA   $0400
         PEA   $0000
         JSL   L150241
         PLA
         PLY
         PLX
         STX   $DF
         PLX
         STX   $E1
         STA   [$DF]
         TYA
         LDY   #$0002
         STA   [$DF],Y
L0F0190  JSL   L151484
         PEI   $D7
         PEI   $D5
         JSL   L15102F
         PEI   $D7
         PEI   $D5
         JSL   L151131
         PEA   $0004
         JSL   L0724F7
L0F01AB  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $CF
         LDAL  L0540AD
         STA   $C5
         LDA   #$0800
         AND   $C5
         BEQ   L0F01C6
         LDA   #$0001
L0F01C6  STA   $C3
         LDA   #$0100
         AND   $C5
         BEQ   L0F01D2
         LDA   #$0001
L0F01D2  STA   $C1
L0F01D4  PHY
         JSL   L09771E
         PHY
         JSL   L090A90
         PLA
         STA   $DF
         PLA
         AND   $DF
         BEQ   L0F0224
         PEA   $0004
         JSL   L0724F7
         STZ   $CF
         PHY
         PEA   $000A
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150070
         PLA
         LSR
         BCC   L0F0204
         BRL   L0F0309
L0F0204  LDAL  L0540AD
         STA   $C5
         LDA   #$0800
         AND   $C5
         BEQ   L0F0214
         LDA   #$0001
L0F0214  STA   $C3
         LDA   #$0100
         AND   $C5
         BEQ   L0F0220
         LDA   #$0001
L0F0220  STA   $C1
         BRA   L0F01D4
L0F0224  LDA   $CF
         BEQ   L0F022B
         BRL   L0F02E8
L0F022B  LDA   #$0000
         STAL  L05409F
         PHY
         PEA   $0001
         PEI   $D7
         PEI   $D5
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150365
         PLA
         STA   $C9
         PHY
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEI   $D7
         PEI   $D5
         JSL   L150482
         PLA
         STA   $BF
         LDA   $BF
         BEQ   L0F02E1
         LDY   #$0002
         LDA   [$BB],Y
         TAX
         LDA   [$BB]
         TXY
         LDX   #$FF75
         STA   $00,X
         TYA
         STA   $02,X
         PEA   ^L0540A9
         PEA   L0540A9
         JSL   L150BE8
         LDX   #$FF75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0014
         BCC   L0F0295
         INX
L0F0295  STA   $DF
         STX   $E1
         LDA   #$0000
         LDX   #$8500
         CMP   [$DF]
         BNE   L0F02A9
         LDY   #$0002
         TXA
         CMP   [$DF],Y
L0F02A9  BEQ   L0F02B0
         LDA   #$0000
         BRA   L0F02B3
L0F02B0  LDA   #$0001
L0F02B3  PHA
         PHY
         PEA   ^L0540A9
         PEA   L0540A9
         LDY   #$0002
         LDA   [$BB],Y
         TAX
         LDA   [$BB]
         CLC
         ADC   #$0040
         BCC   L0F02CA
         INX
L0F02CA  PHX
         PHA
         JSL   L1512CB
         PLA
         STA   $DF
         PLA
         AND   $DF
         BEQ   L0F02E1
         PEA   $0008
         JSL   L0724F7
         BRA   L0F02E8
L0F02E1  PEA   $0004
         JSL   L0724F7
L0F02E8  LDA   #$FFFD
         CMP   $CF
         BEQ   L0F02F2
         BRL   L0F04D1
L0F02F2  LDA   #$00FF
         ANDL  L0540A1
         STA   $C7
         LDA   #$000D
         CMP   $C7
         BNE   L0F0373
         LDA   #$2000
         AND   $C5
         BEQ   L0F0328
L0F0309  PEA   $0001
         PEI   $D7
         PEI   $D5
         PEA   $0001
         JSL   L072E7C
         PEA   $0000
         PEI   $D7
         PEI   $D5
         PEA   $0001
         JSL   L072E7C
         BRL   L0F04D9
L0F0328  LDA   L055051
         BEQ   L0F0330
         BRL   L0F05EF
L0F0330  LDA   $C3
         BEQ   L0F0356
         LDA   #$0003
         STA   $7D
         LDA   #$00C2
         LDX   #$0000
         STA   $7F
         STX   $81
         STZ   $8B
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $D1
         JSL   L151299
L0F0356  PEA   ^L05409F
         PEA   L05409F
         PEI   $D3
         PEI   $D1
         JSL   L151299
         PEI   $D7
         PEI   $D5
         PEI   $D3
         PEI   $D1
         JSL   L0F1566
         BRL   L0F04D1
L0F0373  LDA   #$0009
         CMP   $C7
         BNE   L0F03B3
         PEI   $D7
         PEI   $D5
         PEI   $D3
         PEI   $D1
         JSL   L0F1566
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00AF
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $D1
         JSL   L150000
         PEI   $B5
         PEI   $B3
         PEI   $B1
         PEI   $AF
         PEI   $D3
         PEI   $D1
         JSL   L150006
         BRL   L0F04D1
L0F03B3  LDA   $C1
         BNE   L0F03BA
         BRL   L0F048C
L0F03BA  LDA   $C3
         BEQ   L0F03DE
         STZ   $B9
L0F03C0  LDX   $B9
         LDA   #$00FF
         ANDL  L041573,X
         CMP   $C7
         BNE   L0F03D0
         BRL   L0F0309
L0F03D0  LDA   #$000B
         CMP   $B9
         BEQ   L0F03DB
         INC   $B9
         BRA   L0F03C0
L0F03DB  BRL   L0F048A
L0F03DE  PHY
         PEI   $C7
         JSL   L071498
         PLA
         SEC
         SBC   #$0061
         BMI   L0F0468
         CMP   #$0018
         BPL   L0F0468
         SEC
         SBC   #$0000
         BEQ   L0F0410
         DEC
         DEC
         BEQ   L0F0426
         SEC
         SBC   #$0004
         BEQ   L0F0430
         DEC
         BEQ   L0F043A
         SEC
         SBC   #$000E
         BEQ   L0F0444
         DEC
         DEC
         BEQ   L0F0456
         BRA   L0F0468
L0F0410  PEA   $0000
         PEA   $0000
         PEA   $7FFF
         PEA   $FFFF
         PEI   $D3
         PEI   $D1
         JSL   L150006
         BRA   L0F048A
L0F0426  PEI   $D3
         PEI   $D1
         JSL   L150FED
         BRA   L0F048A
L0F0430  PEI   $D3
         PEI   $D1
         JSL   L0F0AD1
         BRA   L0F048A
L0F043A  PEI   $D3
         PEI   $D1
         JSL   L0F0CFF
         BRA   L0F048A
L0F0444  LDA   L055051
         BEQ   L0F044C
         BRL   L0F05EF
L0F044C  PEI   $D3
         PEI   $D1
         JSL   L150B58
         BRA   L0F048A
L0F0456  LDA   L055051
         BEQ   L0F045E
         BRL   L0F05EF
L0F045E  PEI   $D3
         PEI   $D1
         JSL   L15128D
         BRA   L0F048A
L0F0468  PHY
         PEA   $0000
         PEI   $D7
         PEI   $D5
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150365
         PLA
         LSR
         BCC   L0F0486
         LDAL  L0540C5
         STA   $CF
         BRA   L0F048A
L0F0486  JSL   L072314
L0F048A  BRA   L0F04D1
L0F048C  LDA   #$001B
         CMP   $C7
         BNE   L0F04B4
         PEA   $0001
         PEI   $D7
         PEI   $D5
         PEA   $0002
         JSL   L072E7C
         PEA   $0000
         PEI   $D7
         PEI   $D5
         PEA   $0002
         JSL   L072E7C
         BRL   L0F0604
         BRA   L0F04D1
L0F04B4  LDA   L055051
         BEQ   L0F04BC
         BRL   L0F05EF
L0F04BC  PHY
         PEA   $0000
         PEI   $D7
         PEI   $D5
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150365
         PLA
         STA   $C9
L0F04D1  LDA   $CF
         DEC
         BEQ   L0F04D9
         BRL   L0F05C0
L0F04D9  LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         CLC
         ADC   #$0010
         BCC   L0F04E8
         INX
L0F04E8  STA   $DF
         STX   $E1
         LDA   #$00FF
         AND   [$DF]
         AND   #$0040
         BEQ   L0F04F9
         LDA   #$0001
L0F04F9  PHA
         LDA   L055051
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCS   L0F0509
         BRL   L0F05BE
L0F0509  PHY
         PHY
         PEA   $0001
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $D3
         PEI   $D1
         JSL   L150B22
         PLA
         STA   $CB
         PLX
         STX   $CD
         STZ   $C9
         LDAL  L05565D
         BNE   L0F05B3
         PEI   $CD
         PEI   $CB
         LDA   #$1388
         LDX   #$0000
         JSL   L033477
         BEQ   L0F0559
         BVS   L0F0550
         EOR   #$8000
L0F0550  BPL   L0F0559
         PEA   $0006
         JSL   L0724F7
L0F0559  PHY
         PHY
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         JSL   L0B41C8
         PLA
         STA   $CB
         PLX
         STX   $CD
         LDA   #L0550F5
         LDX   #^L0550F5
         STA   $AB
         STX   $AD
         LDA   $F0
         ORA   $F2
         BNE   L0F058B
         PHY
         PEI   $AD
         PEI   $AB
         JSL   L0785BE
         PLA
         STA   $C9
         BRA   L0F05B3
L0F058B  LDA   $EA
         BNE   L0F05A1
         PHY
         PEI   $F2
         PEI   $F0
         PEI   $AD
         PEI   $AB
         JSL   L07D3A2
         PLA
         STA   $C9
         BRA   L0F05B3
L0F05A1  PHY
         PEI   $F2
         PEI   $F0
         PEI   $EA
         PEI   $AD
         PEI   $AB
         JSL   L07D712
         PLA
         STA   $C9
L0F05B3  LDA   $C9
         BNE   L0F0604
         PEA   $003E
         JSL   L0727E0
L0F05BE  BRA   L0F0604
L0F05C0  LDA   $CF
         DEC
         DEC
         BEQ   L0F0604
         LDA   #$0003
         CMP   $CF
         BNE   L0F05D5
         PEI   $D3
         PEI   $D1
         JSL   L0F0BD7
L0F05D5  LDA   #$0004
         CMP   $CF
         BNE   L0F05ED
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEI   $D3
         PEI   $D1
         JSL   L0F1459
L0F05ED  BRA   L0F0601
L0F05EF  LDA   L054FB3
         STA   $B7
         LDA   #$0001
         STA   L054FB3
         JSL   L0903A6
         STZ   L054FB3
L0F0601  BRL   L0F01AB
L0F0604  PEI   $D7
         PEI   $D5
         JSL   L072634
         PEI   $DD
         PEI   $DB
         JSL   L151131
         LDA   L055145
         BEQ   L0F061D
         JSL   L15147E
L0F061D  PEI   $D9
         JSL   L0724F7
         LDA   $E6
         STA   $FA
         LDA   $E5
         STA   $F9
         LDA   $E3
         TCD
         TSC
         CLC
         ADC   #$0184
         TCS
         RTL

L0F0635  ENT
         PHD
         TSC
         CLC
         ADC   #$F9B8
         TCS
         ADC   #$0557
         TCD
         STZ   $FC
         LDA   #$0003
         STA   L0553B3
         STZ   $E7
         STZ   $B3
         STZ   $B5
         STZ   $B7
         PHY
         LDY   #$0004
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L0D109F
         PLA
         LSR
         BCS   L0F0667
         BRL   L0F094B
L0F0667  LDA   [$F8]
         DEC
         BPL   L0F066F
         BRL   L0F0948
L0F066F  CMP   #$0004
         BMI   L0F0677
         BRL   L0F0948
L0F0677  SEC
         SBC   #$0000
         BEQ   L0F0692
         DEC
         BNE   L0F0683
         BRL   L0F07A4
L0F0683  DEC
         BNE   L0F0689
         BRL   L0F083C
L0F0689  DEC
         BNE   L0F068F
         BRL   L0F08D3
L0F068F  BRL   L0F0948
L0F0692  PHY
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$000E
         LDA   [$F8],Y
         PHA
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L0F06B8
         BRL   L0F0ABF
L0F06B8  LDA   #$0013
         STA   $E5
         LDA   #$000F
         AND   $BD
         DEC
         DEC
         BNE   L0F06CB
         LDA   #$0012
         STA   $E5
L0F06CB  LDA   #$001C
         STA   $E3
         PHY
         PHY
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L075EA8
         PLA
         PLX
         CMP   #$4B42
         BNE   L0F06EB
         CPX   #$4447
L0F06EB  BNE   L0F06F2
         LDA   #$001D
         STA   $E3
L0F06F2  PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEI   $BB
         JSL   L07ACF0
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         PEI   $E3
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FBA9
         PHA
         PEI   $E5
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FB95
         PHA
         LDA   $BB
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FDAD
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$000E
         LDA   [$F8],Y
         PHA
         JSL   L07AE68
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDY   #$0012
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $B5
         STX   $B7
         LDY   #$000E
         LDA   [$F8],Y
         STA   $B3
         BRL   L0F094B
L0F07A4  PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         LDY   #$000C
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         PEA   $0010
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FC95
         PHA
         LDY   #$000C
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FDAD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         LDY   #$000C
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07AACB
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDY   #$000C
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $B5
         STX   $B7
         BRL   L0F094B
L0F083C  PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         LDY   #$0008
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         PEA   $000F
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FC95
         PHA
         LDY   #$0008
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FDAD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         LDY   #$0008
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07AACB
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDY   #$0008
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $B5
         STX   $B7
         BRA   L0F094B
L0F08D3  LDAL  L04052B
         LDX   #$FFAD
         SEP   #$20
         STA   $00,X
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         PEA   $000E
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FBA9
         PHA
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FAA9
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FDAD
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         JSL   L076220
         PLA
         STA   $E9
         PLX
         STX   $EB
         BRA   L0F094B
L0F0948  BRL   L0F0ABF
L0F094B  LDA   #$00FF
         LDX   #$FFAD
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L0F0990
         BEQ   L0F0990
         PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEA   ^L04052C
         PEA   L04052C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEA   ^L040531
         PEA   L040531
         PEA   $0000
         TDC
         CLC
         ADC   #$FDAD
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0F0990  PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA9
         PHA
         PEA   $0011
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDAD
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   $E9
         ORA   $EB
         BNE   L0F09DB
         BRL   L0F0AAF
L0F09DB  LDA   #$FFFF
         STA   $B1
         LDA   $F6
         BNE   L0F09E7
         BRL   L0F0A89
L0F09E7  LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0F09F5
         CPX   L0553BB
L0F09F5  BNE   L0F09FA
         BRL   L0F0A89
L0F09FA  LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$003A
         BCC   L0F0A07
         INX
L0F0A07  TXY
         LDX   #$FDA9
         STA   $00,X
         TYA
         STA   $02,X
         LDA   L0553B5
         LDX   L0553B7
         STA   $AD
         STX   $AF
         LDX   #$FDA9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0F0A2A
         INX
L0F0A2A  STA   $ED
         STX   $EF
         LDA   [$ED]
         BEQ   L0F0A62
         LDX   #$FDA9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L0F0A42
         INX
L0F0A42  PHX
         PHA
         LDX   #$FDA9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000A
         BCC   L0F0A54
         INX
L0F0A54  STA   $ED
         STX   $EF
         LDA   [$ED]
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
L0F0A62  LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$003A
         BCC   L0F0A6F
         INX
L0F0A6F  PHX
         PHA
         PEA   $0000
         JSL   L0B2AF9
         LDAL  L051BE2
         STA   $B1
         PEI   $AF
         PEI   $AD
         PEA   $0000
         JSL   L0B2AF9
L0F0A89  PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEI   $EB
         PEI   $E9
         PEI   $B7
         PEI   $B5
         LDA   L055039
         LDX   L05503B
         PHX
         PHA
         PEI   $B3
         PEI   $B1
         JSL   L0F0000
         LDA   #$0001
         STA   $FC
L0F0AAF  LDA   $E7
         BEQ   L0F0ABB
         PEI   $FA
         PEI   $F8
         JSL   L0B1A77
L0F0ABB  JSL   L0B381C
L0F0ABF  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0650
         TCS
         RTL

L0F0AD1  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   L05540F
         ORA   L055411
         BNE   L0F0AE4
         BRL   L0F0BC5
L0F0AE4  PHY
         PHY
         PEA   $0019
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $24
         PEI   $22
         JSL   L150B22
         PLA
         STA   $11
         PLX
         STX   $13
         LDAL  L05565D
         BEQ   L0F0B1F
         PEA   $003D
         JSL   L0727E0
         BRL   L0F0BC5
L0F0B1F  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $24
         PEI   $22
         JSL   L150000
         PHY
         PHY
         LDA   L05540F
         LDX   L055411
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PHX
         PHA
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PEI   $0B
         PEI   $09
         JSL   L150F53
         PHX
         PHA
         JSL   L071CE4
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L0F0B77
         JSL   L072314
         BRA   L0F0BBD
L0F0B77  PEI   $07
         PEI   $05
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         JSL   L1512A5
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         PEI   $03
         PEI   $01
         PHY
         PHY
         LDA   L05540F
         LDX   L055411
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PHX
         PHA
         JSL   L071C98
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEI   $24
         PEI   $22
         JSL   L150006
L0F0BBD  PEI   $17
         PEI   $15
         JSL   L07185A
L0F0BC5  LDA   $20
         STA   $24
         LDA   $1F
         STA   $23
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L0F0BD7  PHD
         TSC
         CLC
         ADC   #$FEF0
         TCS
         ADC   #$001D
         TCD
         PHY
         JSL   L0727BF
         PLA
         STA   $E9
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $EB
         PLX
         STX   $ED
         PHY
         PHY
         PEA   $1388
         JSL   L072834
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   L05540F
         ORA   L055411
         BEQ   L0F0C30
         LDA   L05540F
         LDX   L055411
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L071FF8
         BRA   L0F0C3D
L0F0C30  LDAL  L040533
         LDX   #$FFE3
         SEP   #$20
         STA   $00,X
         REP   #$20
L0F0C3D  PEI   $E7
         PEI   $E5
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L073A7B
         PEI   $E7
         PEI   $E5
         PEA   $0004
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $E7
         PEI   $E5
         JSL   L15102F
L0F0C6A  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $E3
         LDX   #$0000
         LDA   $E3
         DEC
         BNE   L0F0C7E
         INX
L0F0C7E  PHX
         LDX   #$0000
         LDA   $E3
         DEC
         DEC
         BNE   L0F0C89
         INX
L0F0C89  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0F0C6A
         PEI   $E7
         PEI   $E5
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L071169
         PEI   $E7
         PEI   $E5
         JSL   L072634
         PEI   $E9
         JSL   L0724F7
         PEI   $ED
         PEI   $EB
         JSL   L151131
         LDA   $E3
         DEC
         DEC
         BNE   L0F0CC2
         BRA   L0F0CED
L0F0CC2  LDA   L05540F
         LDX   L055411
         PHX
         PHA
         JSL   L07185A
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0734F5
         PLA
         STA   L05540F
         PLA
         STA   L055411
         PEI   $FA
         PEI   $F8
         JSL   L0F0AD1
L0F0CED  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0116
         TCS
         RTL

L0F0CFF  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEI   $20
         PEI   $1E
         JSL   L150000
         LDAL  L05565D
         BNE   L0F0D75
         PEI   $0F
         PEI   $0D
         LDA   $11
         LDX   $13
         JSL   L1512A5
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L0F0D47
         BPL   L0F0D4A
L0F0D47  BRL   L0F0E2B
L0F0D4A  PHY
         PHY
         PEA   $0019
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $20
         PEI   $1E
         JSL   L150B22
         PLA
         STA   $05
         PLX
         STX   $07
L0F0D75  LDAL  L05565D
         BEQ   L0F0D85
         PEA   $003D
         JSL   L0727E0
         BRL   L0F0E2B
L0F0D85  LDA   L05540F
         LDX   L055411
         PHX
         PHA
         JSL   L07185A
         PHY
         PHY
         LDA   $09
         LDX   $0B
         INC
         BNE   L0F0D9B
         INX
L0F0D9B  PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L05540F
         PLA
         STA   L055411
         LDAL  L05565D
         BEQ   L0F0DC4
         STZ   L05540F
         STZ   L055411
         BRA   L0F0E1B
L0F0DC4  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PEI   $13
         PEI   $11
         JSL   L150F53
         PHX
         PHA
         LDA   L05540F
         LDX   L055411
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         PEI   $0B
         PEI   $09
         JSL   L1511CE
         LDA   L05540F
         LDX   L055411
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $15
         STX   $17
         LDA   $09
         LDX   $0B
         INC
         BNE   L0F0E10
         INX
L0F0E10  DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$15],Y
         REP   #$20
L0F0E1B  PEI   $03
         PEI   $01
         JSL   L07185A
         PEI   $20
         PEI   $1E
         JSL   L0F0AD1
L0F0E2B  LDA   $1C
         STA   $20
         LDA   $1B
         STA   $1F
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L0F0E3D  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   L0553EB
         BEQ   L0F0E4D
         BRL   L0F0F65
L0F0E4D  LDA   L055403
         LDX   L055405
         STA   $11
         STX   $13
         LDA   #$00FF
         AND   [$11]
         BEQ   L0F0E61
         LDA   #$0001
L0F0E61  EOR   #$0001
         BEQ   L0F0EE4
         LDA   L055403
         LDX   L055405
         PHX
         PHA
         LDA   L0553FB
         LDX   L0553FD
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         JSL   L033477
         BEQ   L0F0E8D
         BVS   L0F0E8B
         EOR   #$8000
L0F0E8B  BMI   L0F0E92
L0F0E8D  LDA   #$0000
         BRA   L0F0E95
L0F0E92  LDA   #$0001
L0F0E95  BEQ   L0F0EE4
         LDA   L055403
         LDX   L055405
         TAY
         BNE   L0F0EA1
         DEX
L0F0EA1  DEC
         STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         CMP   #$000D
         BNE   L0F0EC6
         JSL   L0B4194
         LDA   L0553F3
         LDX   L0553F5
         STA   $11
         STX   $13
         SEP   #$20
         LDA   #$00
         STA   [$11]
         REP   #$20
L0F0EC6  LDA   #$0001
         STA   L0553EB
         LDA   L0553F3
         LDX   L0553F5
         PHX
         PHA
         LDA   L0553F7
         LDX   L0553F9
         JSL   L1512A5
         STA   L0553E9
         BRL   L0F0F65
L0F0EE4  LDA   L055403
         LDX   L055405
         PHX
         PHA
         LDA   L0553FB
         LDX   L0553FD
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         JSL   L1512A5
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   L0553E9
         JSL   L150488
         JSL   L033477
         BVS   L0F0F1A
         EOR   #$8000
L0F0F1A  BPL   L0F0F65
         LDA   #$0001
         STA   L0553EB
         LDA   L0553F3
         LDX   L0553F5
         PHX
         PHA
         LDA   L0553F7
         LDX   L0553F9
         JSL   L1512A5
         STA   $0D
         STX   $0F
         LDA   $1A
         BEQ   L0F0F43
         LDA   $0D
         STA   L0553E9
         BRA   L0F0F65
L0F0F43  PEI   $0F
         PEI   $0D
         LDA   $09
         LDX   $0B
         JSL   L1512A5
         STA   $05
         STX   $07
         LDA   L0553E9
         JSL   L150488
         PEI   $07
         PEI   $05
         JSL   L150F53
         STA   L0553E9
L0F0F65  LDA   $18
         STA   $1A
         LDA   $17
         STA   $19
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L0F0F77  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L055403
         PEA   L055403
         JSL   L071C12
         JSL   L0B4194
         PEA   $0001
         JSL   L0F0E3D
         PEA   ^L055403
         PEA   L055403
         PEA   ^L0553F3
         PEA   L0553F3
         JSL   L0705FF
         PEA   $0000
         JSL   L0F0E3D
         LDA   L055403
         LDX   L055405
         STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         BEQ   L0F0FDC
         LDA   L055403
         LDX   L055405
         INC
         BNE   L0F0FC6
         INX
L0F0FC6  STA   L055403
         STX   L055405
         LDA   L0553F3
         LDX   L0553F5
         INC
         BNE   L0F0FD6
         INX
L0F0FD6  STA   L0553F3
         STX   L0553F5
L0F0FDC  LDA   L055403
         LDX   L055405
         STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         BNE   L0F0FF4
         PEA   $0001
         JSL   L0F0E3D
L0F0FF4  PLY
         PLY
         PLD
         RTL

L0F0FF8  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0001
         STA   $1A
         LDA   L0553F3
         LDX   L0553F5
         PHX
         PHA
         LDA   L0553F7
         LDX   L0553F9
         JSL   L1512A5
         STA   $01
         STX   $03
         LDA   L0553EF
         LDX   L0553F1
         PHX
         PHA
         LDA   $01
         LDX   $03
         JSL   L1512A5
         PHX
         PHA
         LDA   $16
         LDX   $18
         JSL   L033477
         BVS   L0F103A
         EOR   #$8000
L0F103A  BPL   L0F103F
         BRL   L0F111A
L0F103F  LDA   L0553FF
         ORA   L055401
         BNE   L0F104A
         BRL   L0F1118
L0F104A  LDA   L055403
         LDX   L055405
         PHX
         PHA
         LDA   L0553FB
         LDX   L0553FD
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         JSL   L1512A5
         STA   $05
         STX   $07
         LDA   L0553EF
         LDX   L0553F1
         PEI   $14
         PEI   $12
         JSL   L150F53
         STA   L0553EF
         STX   L0553F1
         PHY
         LDA   L0553FF
         LDX   L055401
         PHX
         PHA
         LDA   L0553EF
         LDX   L0553F1
         PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L0F10CA
         PEA   $002D
         JSL   L0B0B7A
         LDA   L0553FF
         LDX   L055401
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $09
         STX   $0B
         SEP   #$20
         LDA   #$00
         STA   [$09]
         REP   #$20
         LDA   L0553E7
         PHA
         JSL   L0B2A91
         STZ   $1A
         BRA   L0F111A
L0F10CA  LDA   L0553FF
         LDX   L055401
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   L0553F7
         STX   L0553F9
         LDA   L0553F7
         LDX   L0553F9
         PEI   $03
         PEI   $01
         JSL   L150F53
         STA   L0553F3
         STX   L0553F5
         LDA   L0553FB
         LDX   L0553FD
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PEI   $07
         PEI   $05
         JSL   L150F53
         STA   L055403
         STX   L055405
         BRA   L0F111A
L0F1118  STZ   $1A
L0F111A  LDA   $10
         STA   $18
         LDA   $0F
         STA   $17
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L0F112C  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0001
         STA   $14
         STZ   $09
L0F113B  LDA   L055403
         LDX   L055405
         STA   $0B
         STX   $0D
         LDA   #$00FF
         AND   [$0B]
         BNE   L0F114F
         BRL   L0F1275
L0F114F  PHY
         PEA   $0000
         PEA   $0400
         PEA   $0000
         PEA   $0800
         JSL   L0F0FF8
         PLA
         LSR
         BCS   L0F1169
         STZ   $14
         BRL   L0F12E9
L0F1169  LDA   L055403
         LDX   L055405
         STA   L055407
         STX   L055409
         PEA   ^L055407
         PEA   L055407
         LDA   L0553E3
         LDX   L0553E5
         PHX
         PHA
         JSL   L0B0361
         PHY
         LDA   L0553E3
         LDX   L0553E5
         PHX
         PHA
         PEA   ^L041593
         PEA   L041593
         JSL   L071C56
         PLA
         LSR
         BCS   L0F11AC
L0F119E  LDA   #$0005
         CMP   L05536F
         BNE   L0F11AC
         JSL   L0E0154
         BRA   L0F119E
L0F11AC  PHY
         JSL   L0B3EC4
         PLA
         STA   $01
         JSL   L0F0F77
         LDA   $01
         EOR   #$0001
         ORA   $09
         BNE   L0F11C4
         BRL   L0F1272
L0F11C4  STZ   $09
L0F11C6  PEA   ^L055407
         PEA   L055407
         JSL   L071C12
         LDA   L055407
         LDX   L055409
         STA   $0B
         STX   $0D
         LDA   #$00FF
         AND   [$0B]
         CMP   #$0022
         BEQ   L0F11E9
         LDA   #$0000
         BRA   L0F11EC
L0F11E9  LDA   #$0001
L0F11EC  STA   $07
         PEA   ^L055407
         PEA   L055407
         LDA   L0553E3
         LDX   L0553E5
         PHX
         PHA
         JSL   L0B0361
         LDA   $07
         BNE   L0F1227
         PHY
         PEA   ^L040534
         PEA   L040534
         LDA   L0553E3
         LDX   L0553E5
         PHX
         PHA
         JSL   L150F73
         PLA
         BEQ   L0F121F
         LDA   #$0001
         STA   $09
L0F121F  PHY
         JSL   L0B3EC4
         PLA
         STA   $01
L0F1227  LDA   $07
         EOR   #$0001
         PHA
         LDA   L0553E3
         LDX   L0553E5
         STA   $0B
         STX   $0D
         LDA   #$00FF
         AND   [$0B]
         BEQ   L0F1241
         LDA   #$0001
L0F1241  EOR   #$0001
         AND   $01,S
         PLX
         PHA
         PHY
         PEA   ^L040536
         PEA   L040536
         LDA   L0553E3
         LDX   L0553E5
         PHX
         PHA
         JSL   L150F73
         PLA
         CMP   #$0001
         BEQ   L0F1266
         LDA   #$0000
         BRA   L0F1269
L0F1266  LDA   #$0001
L0F1269  ORA   $01,S
         PLX
         LSR
         BCS   L0F1272
         BRL   L0F11C6
L0F1272  BRL   L0F113B
L0F1275  LDA   L0553F3
         LDX   L0553F5
         TAY
         BNE   L0F127F
         DEX
L0F127F  DEC
         STA   $03
         STX   $05
         PEI   $05
         PEI   $03
         LDA   L0553F7
         LDX   L0553F9
         JSL   L033477
         BEQ   L0F12E9
         BVS   L0F1299
         EOR   #$8000
L0F1299  BPL   L0F12E9
         LDA   #$00FF
         AND   [$03]
         CMP   #$000D
         BNE   L0F12E9
         LDA   L0553E9
         JSL   L150488
         STA   $0B
         STX   $0D
         LDA   L0553F3
         LDX   L0553F5
         PHX
         PHA
         LDA   L0553F7
         LDX   L0553F9
         JSL   L1512A5
         CMP   $0B
         BNE   L0F12C8
         CPX   $0D
L0F12C8  BNE   L0F12E9
         LDA   L05540D
         STA   L05540B
         JSL   L0B4194
         LDA   L0553F3
         LDX   L0553F5
         PHX
         PHA
         LDA   L0553F7
         LDX   L0553F9
         JSL   L1512A5
         STA   L0553E9
L0F12E9  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0F12F1  ENT
         PHD
         TSC
         CLC
         ADC   #$FDF8
         TCS
         ADC   #$0121
         TCD
         LDA   L055371
         STA   L0553E7
         PEA   $0001
         JSL   L0E0838
         STZ   L05540B
         STZ   L05540D
         STZ   L0553EB
         LDA   #$0001
         STA   L0553ED
         LDA   [$EC]
         STA   L0553E9
         TDC
         CLC
         ADC   #$FFDF
         STA   L0553DF
         STZ   L0553E1
         TDC
         CLC
         ADC   #$FEDF
         STA   L0553E3
         STZ   L0553E5
         LDA   $F4
         ORA   $F6
         BNE   L0F13AC
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L151301
         PLA
         STA   L0553EF
         PLA
         STA   L0553F1
         PHY
         PHY
         LDA   L0553EF
         LDX   L0553F1
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L0553FF
         PLA
         STA   L055401
         LDAL  L05565D
         BEQ   L0F1392
         PEA   $002D
         JSL   L0B0B7A
         PHY
         PHY
         PEA   ^L040539
         PEA   L040539
         JSL   L0734F5
         PLA
         STA   L0553FF
         PLA
         STA   L055401
         BRL   L0F1430
L0F1392  LDA   L0553FF
         LDX   L055401
         STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         STA   L0553F3
         STX   L0553F5
         BRA   L0F13C6
L0F13AC  STZ   L0553FF
         STZ   L055401
         LDA   $F0
         LDX   $F2
         STA   L0553EF
         STX   L0553F1
         LDA   $F4
         LDX   $F6
         STA   L0553F3
         STX   L0553F5
L0F13C6  LDA   L0553F3
         LDX   L0553F5
         STA   L0553F7
         STX   L0553F9
         LDA   $F8
         LDX   $FA
         STA   L0553FB
         STX   L0553FD
         LDY   #$0002
         LDA   [$F8],Y
         TAX
         LDA   [$F8]
         STA   L055403
         STX   L055405
         PHY
         JSL   L0F112C
         PLA
         LSR
         BCS   L0F13F5
         BRA   L0F1430
L0F13F5  PHY
         PHY
         LDA   L055403
         LDX   L055405
         PHX
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L0F1409
         INX
L0F1409  STA   $DF
         STX   $E1
         PHY
         PEI   $E1
         PEI   $DF
         PEI   $E1
         PEI   $DF
         JSL   L0F0FF8
         PLA
         LSR
         BCS   L0F1420
         BRA   L0F1430
L0F1420  PEA   ^L055403
         PEA   L055403
         PEA   ^L0553F3
         PEA   L0553F3
         JSL   L070669
L0F1430  LDA   L0553E7
         PHA
         JSL   L0B2A91
         LDA   L0553E9
         STA   [$EC]
         LDA   L0553FF
         LDX   L055401
         STA   $FC
         STX   $FE
         LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$021A
         TCS
         RTL

L0F1459  PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         PHY
         PHY
         PEA   $0019
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $2A
         PEI   $28
         JSL   L150B22
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDAL  L05565D
         BEQ   L0F1495
         BRL   L0F1554
L0F1495  TDC
         CLC
         ADC   #$0013
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEI   $2A
         PEI   $28
         JSL   L150000
         LDAL  L05565D
         BEQ   L0F14B8
         BRL   L0F154C
L0F14B8  LDA   $0F
         LDX   $11
         CMP   $13
         BNE   L0F14C2
         CPX   $15
L0F14C2  BEQ   L0F1518
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         PEI   $15
         PEI   $13
         JSL   L150F53
         PHX
         PHA
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         PEI   $11
         PEI   $0F
         LDA   $13
         LDX   $15
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $1F
         STX   $21
         PEI   $11
         PEI   $0F
         LDA   $13
         LDX   $15
         JSL   L1512A5
         INC
         BNE   L0F150D
         INX
L0F150D  DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$1F],Y
         REP   #$20
L0F1518  PHY
         PEA   $0023
         PEI   $19
         PEI   $17
         PEI   $2E
         PEI   $2C
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L160720
         PLA
         STA   $0D
         PEA   ^L160720
         PEA   L160720
         JSL   L07187A
         PHY
         PEA   $1000
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $01
L0F154C  PEI   $19
         PEI   $17
         JSL   L07185A
L0F1554  LDA   $26
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

L0F1566  PHD
         TSC
         CLC
         ADC   #$FFBC
         TCS
         TCD
         LDA   L0550F3
         BEQ   L0F1580
         PEA   ^L04053A
         PEA   L04053A
         JSL   L07010A
         BRL   L0F17D2
L0F1580  LDA   #$0001
         STA   L0550F1
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         PEI   $4C
         PEI   $4A
         JSL   L150000
         LDAL  L05565D
         BNE   L0F15D0
         PHY
         PHY
         PEA   $0001
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $4C
         PEI   $4A
         JSL   L150B22
         PLA
         STA   $25
         PLX
         STX   $27
L0F15D0  LDAL  L05565D
         BEQ   L0F15E0
         PEA   $003D
         JSL   L0727E0
         BRL   L0F17D2
L0F15E0  LDA   $3B
         STA   $35
         LDA   #L0550F5
         LDX   #^L0550F5
         STA   $31
         STX   $33
         LDA   L0550F5
         LDX   L0550F7
         PEI   $27
         PEI   $25
         JSL   L150F53
         CLC
         ADC   #$0002
         BCC   L0F1603
         INX
L0F1603  STA   $2D
         STX   $2F
         LDA   L0550F5
         LDX   L0550F7
         CLC
         ADC   #$FFFF
         BCC   L0F1614
         INX
L0F1614  PHX
         PHA
         LDA   $2D
         LDX   $2F
         JSL   L1512A5
         STA   $29
         STX   $2B
         PHY
         PHY
         PEI   $33
         PEI   $31
         PEI   $2F
         PEI   $2D
         PEI   $2B
         PEI   $29
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L0F12F1
         PLA
         STA   $31
         PLX
         STX   $33
         LDY   #$0002
         LDA   [$4A],Y
         TAX
         LDA   [$4A]
         STA   $09
         STX   $0B
         LDY   #$0010
         LDA   #$00FF
         AND   [$09],Y
         AND   #$0040
         STA   $3F
         LDA   #$0010
         CLC
         ADC   $09
         LDX   $0B
         BCC   L0F1667
         INX
L0F1667  STA   $41
         STX   $43
         LDY   #$0010
         LDA   #$00FF
         AND   [$09],Y
         ORA   #$0080
         SEP   #$20
         STA   [$41]
         REP   #$20
         LDY   #$0098
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         STA   $19
         STX   $1B
         LDY   #$0006
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         CLC
         ADC   #$0018
         BCC   L0F169B
         INX
L0F169B  STA   $41
         STX   $43
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $41
         STX   $43
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   #$0002
         CLC
         ADC   $05
         LDX   $07
         BCC   L0F16CB
         INX
L0F16CB  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0002
         CLC
         ADC   $05
         LDX   $07
         BCC   L0F16DF
         INX
L0F16DF  PHX
         PHA
         JSL   L08273B
         PEA   $0001
         PEI   $2F
         PEI   $2D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $4C
         PEI   $4A
         JSL   L151645
         LDA   $35
         JSL   L150488
         PHX
         PHA
         LDA   $35
         JSL   L150488
         PHX
         PHA
         PEI   $4C
         PEI   $4A
         JSL   L150006
         PHY
         PHY
         PEA   $0004
         PEI   $1B
         PEI   $19
         PEA   $0000
         PEA   $0000
         PEI   $4C
         PEI   $4A
         JSL   L1505C2
         PLA
         STA   $15
         PLX
         STX   $17
         LDY   #$0002
         LDA   [$4A],Y
         TAX
         LDA   [$4A]
         STA   $01
         STX   $03
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L0F174F
         INX
L0F174F  STA   $41
         STX   $43
         LDY   #$0010
         LDA   #$00FF
         AND   [$01],Y
         AND   #$003F
         ORA   $3F
         SEP   #$20
         STA   [$41]
         REP   #$20
         LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CLC
         ADC   #$0018
         BCC   L0F1777
         INX
L0F1777  STA   $41
         STX   $43
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $41
         STX   $43
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         CLC
         ADC   #$0002
         BCC   L0F1796
         INX
L0F1796  PHX
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   #$0040
         CLC
         ADC   $01
         LDX   $03
         BCC   L0F17BC
         INX
L0F17BC  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L150B34
L0F17D2  LDA   $48
         STA   $50
         LDA   $47
         STA   $4F
         LDA   $45
         TCD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

