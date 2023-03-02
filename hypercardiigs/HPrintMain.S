*
* HypercardGS
* segment: $1F HPrintMain
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintMain.l
         lst   off

*---------------------------------------

         use   HPrintMain.X

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

L1F0000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PHY
         PEI   $14
         PEI   $12
         JSL   L0718FA
         PLA
         STA   $05
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         STA   $01
         STX   $03
         LDA   #$000C
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F002B
         INX
L1F002B  PHX
         PHA
         PHY
         PHY
         PEA   $0849
         JSL   L0711EB
         PEA   $0014
         JSL   L0313BE
         LDA   #$0003
         AND   $10
         CLC
         ADC   #$8000
         LDY   #$0020
         STA   [$01],Y
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         CLC
         ADC   #$0022
         BCC   L1F005A
         INX
L1F005A  PHX
         PHA
         LDY   #$0020
         LDA   [$01],Y
         PHA
         JSL   L1F0099
         LDA   #$01F6
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F0071
         INX
L1F0071  PHX
         PHA
         PEA   $0000
         PEA   $02AA
         JSL   L071EC5
         PEI   $14
         PEI   $12
         PEI   $05
         JSL   L0718DA
         LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1F0099  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PHY
         PEA   $0029
         JSL   L151681
         PLA
         STA   $05
         PEI   $14
         PEI   $12
         PEA   $0000
         PEA   $01D4
         JSL   L071EC5
         PEA   ^L1F015C
         PEA   L1F015C
         PEI   $14
         PEI   $12
         PEA   $0000
         PEA   $0038
         JSL   L070597
         LDA   $12
         LDX   $14
         STA   $01
         STX   $03
         LDA   $05
         SEC
         SBC   #$0001
         BEQ   L1F00E5
         BVS   L1F00E3
         EOR   #$8000
L1F00E3  BMI   L1F00ED
L1F00E5  LDA   #$0006
         LDY   #$0014
         STA   [$01],Y
L1F00ED  LDA   L05501F
         LDX   L055021
         LDY   #$0016
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0003
         AND   $10
         BNE   L1F012F
         LDA   #$0001
         LDY   #$0030
         STA   [$01],Y
         LDA   #$0005
         LDY   #$0026
         STA   [$01],Y
         LDA   #$0032
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F011F
         INX
L1F011F  CLC
         ADC   #$0002
         BCC   L1F0126
         INX
L1F0126  STA   $07
         STX   $09
         LDA   #$0019
         STA   [$07]
L1F012F  LDA   #$0103
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F013A
         INX
L1F013A  CLC
         ADC   #$0002
         BCC   L1F0141
         INX
L1F0141  STA   $07
         STX   $09
         LDA   #$0019
         STA   [$07]
         LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1F015C  DW    $0001
         DW    $0001
         DW    $0001
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0032
         DW    $003F
         DW    $0103
         DW    $000A
         DW    $0014
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0032
         DW    $0001
L1F0194  ADRL  L1F019A
         DW    $0000
L1F019A  DW    $0000
         DW    $A55A
L1F019E  DW    $0000
L1F01A0  DW    $0000
L1F01A2  DW    $0000
         DW    $0000
         DW    $0000
L1F01A8  ADRL  L1F01AE
         DW    $0000
L1F01AE  DW    $0000
         DW    $A55A
L1F01B2  DW    $0000
L1F01B4  DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
	
L1F01D8  ENT	
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $44
         PEI   $42
         PEA   $0008
         JSL   L0313BE
         PHY
         LDA   L055323
         LDX   L055325
         PHX
         PHA
         JSL   L0718A4
         PLA
         STA   $2D
         LDA   L055027
         LDX   L055029
         STA   $29
         STX   $2B
         LDA   L05501F
         LDX   L055021
         STA   $25
         STX   $27
         PHY
         PEI   $40
         PEI   $3E
         JSL   L1F0C9E
         PLA
         LSR
         BCS   L1F0228
         BRL   L1F03CB
L1F0228  PEA   ^L051EF8
         PEA   L051EF8
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L0808E0
         LDAL  L051F02
         TAX
         LDAL  L051F00
         STA   $09
         STX   $0B
         LDA   $0B
         ASL
         STA   $0B
         LDA   $03
         CLC
         ADC   $0B
         STA   $0B
         LDA   $01
         CLC
         ADC   $09
         STA   $09
         PHY
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCC   L1F02C3
         LDA   L055027
         LDX   L055029
         CMP   $29
         BNE   L1F0279
         CPX   $2B
L1F0279  BEQ   L1F027E
         STZ   L055139
L1F027E  LDA   L05501F
         LDX   L055021
         CMP   $25
         BNE   L1F028A
         CPX   $27
L1F028A  BEQ   L1F028F
         STZ   L055135
L1F028F  LDA   L055149
         STA   $33
         STZ   L055149
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L085216
         LDA   $33
         STA   L055149
         PEA   ^L053239
         PEA   L053239
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEI   $0B
         PEI   $09
         PEA   $0000
         JSL   L15025A
L1F02C3  PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $31
         PHY
         PEI   $31
         PEA   $001F
         JSL   L072FD5
         PLA
         STA   $31
         LDA   $31
         BNE   L1F02F2
         BRL   L1F03CB
L1F02F2  LDA   L055323
         LDX   L055325
         PHX
         PHA
         JSL   L0718BF
         STZ   $2F
L1F0300  LDA   $2F
         INC
         STA   $2F
         LDA   L055323
         LDX   L055325
         STA   $35
         STX   $37
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         PHX
         PHA
         LDA   $2F
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L1F0336
         INX
L1F0336  CLC
         ADC   #$0004
         BCC   L1F033D
         INX
L1F033D  PHX
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L0808E0
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEI   $03
         PEI   $01
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCS   L1F0383
         BRA   L1F03BC
L1F0383  LDA   L055323
         LDX   L055325
         STA   $35
         STX   $37
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         PHX
         PHA
         LDA   $2F
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L1F03F9
L1F03BC  LDA   $2F
         SEC
         SBC   $31
         BVS   L1F03C6
         EOR   #$8000
L1F03C6  BMI   L1F03CB
         BRL   L1F0300
L1F03CB  PEA   $0000
         JSL   L1516ED
         PEA   $0000
         JSL   L1511E6
         LDA   L055323
         LDX   L055325
         PHX
         PHA
         PEI   $2D
         JSL   L0718DA
         LDA   $3C
         STA   $44
         LDA   $3B
         STA   $43
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$0042
         TCS
         RTL

L1F03F9  ENT
         PHD
         TSC
         CLC
         ADC   #$FC92
         TCS
         ADC   #$027F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF89
         PHA
         PEI   $F6
         PEI   $F4
         PEA   $0008
         JSL   L0313BE
         LDA   #$0006
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L1F0423
         INX
L1F0423  TXY
         LDX   #$FE85
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE85
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $EB
         STX   $ED
         LDA   [$EB]
         STA   $E3
         LDX   #$FE85
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L1F044F
         INX
L1F044F  STA   $EB
         STX   $ED
         LDA   [$EB]
         STA   $E5
         LDA   #$0080
         AND   $E3
         BNE   L1F0461
         BRL   L1F07DE
L1F0461  LDA   #$0010
         AND   $E3
         BEQ   L1F046B
         LDA   #$0001
L1F046B  STA   $E9
         LDA   $E5
         BNE   L1F0474
         BRL   L1F07DE
L1F0474  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEI   $E5
         TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L1F0493
         BRL   L1F07DE
L1F0493  LDA   $E9
         BNE   L1F049A
         BRL   L1F0546
L1F049A  PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD81
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEI   $E5
         JSL   L07ACF0
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FF91
         AND   $00,X
         BNE   L1F0514
         PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         PHY
         PHY
         PEA   $0840
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FE6D
         PHA
         LDA   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PHY
         PHY
         PEA   $0841
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FE89
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L1F0546
L1F0514  PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         PHY
         PHY
         PEA   $0841
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FE89
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L1F0546  LDA   #$4000
         AND   $95
         BEQ   L1F0550
         LDA   #$0001
L1F0550  STA   $E7
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEI   $E5
         PEI   $E7
         JSL   L07AEBB
         PLA
         STA   $BF
         PLX
         STX   $C1
         LDA   $BF
         ORA   $C1
         BNE   L1F057B
         BRL   L1F07DE
L1F057B  LDA   [$BF]
         LDY   #$0002
         ORA   [$BF],Y
         BNE   L1F058F
         PEI   $C1
         PEI   $BF
         JSL   L07185A
         BRL   L1F07DE
L1F058F  LDY   #$0002
         LDA   [$BF],Y
         TAX
         LDA   [$BF]
         STA   $EB
         STX   $ED
         LDA   #$00FF
         AND   [$EB]
         BEQ   L1F05A5
         LDA   #$0001
L1F05A5  AND   $E9
         BNE   L1F05AC
         BRL   L1F063B
L1F05AC  PHY
         PHY
         PEI   $C1
         PEI   $BF
         JSL   L151301
         PLA
         STA   $D3
         PLX
         STX   $D5
         PEI   $D5
         PEI   $D3
         LDA   #$00FF
         LDX   #$FF91
         AND   $00,X
         JSL   L150488
         JSL   L150F53
         STA   $CF
         STX   $D1
         PHY
         PEI   $C1
         PEI   $BF
         PEI   $D1
         PEI   $CF
         JSL   L078A05
         PLA
         LSR
         BCC   L1F063B
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         LDA   #$00FF
         LDX   #$FF91
         AND   $00,X
         JSL   L150488
         JSL   L150F53
         STA   $C3
         STX   $C5
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         PEI   $C5
         PEI   $C3
         PEI   $D5
         PEI   $D3
         JSL   L1511CE
         PEA   $0000
         TDC
         CLC
         ADC   #$FF92
         PHA
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         LDA   #$00FF
         LDX   #$FF91
         AND   $00,X
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L1F063B  LDA   $AB
         STA   $BB
         LDA   $AF
         SEP   #$20
         STA   $BD
         REP   #$20
         LDA   $AD
         SEP   #$20
         STA   $BE
         REP   #$20
         LDA   $A9
         STA   $E1
         LDA   #$00FF
         AND   $B4
         STA   $DF
         LDY   #$0006
         LDA   #$0008
         AND   [$F8],Y
         CMP   #$0000
         BNE   L1F066A
         BRL   L1F06EB
L1F066A  LDA   #$0006
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L1F0675
         INX
L1F0675  CLC
         ADC   #$000C
         BCC   L1F067C
         INX
L1F067C  TXY
         LDX   #$FE81
         STA   $00,X
         TYA
         STA   $02,X
         PHY
         LDX   #$FE81
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEA   ^L053251
         PEA   L053251
         PEA   $0004
         JSL   L070A10
         PLA
         LSR
         BCS   L1F06EB
         LDX   #$FE81
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $EB
         STX   $ED
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $BB
         STX   $BD
         LDX   #$FE81
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L1F06CB
         INX
L1F06CB  STA   $EB
         STX   $ED
         LDA   [$EB]
         STA   $E1
         LDX   #$FE81
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L1F06E3
         INX
L1F06E3  STA   $EB
         STX   $ED
         LDA   [$EB]
         STA   $DF
L1F06EB  PEI   $BD
         PEI   $BB
         JSL   L1F0EEB
         PHY
         PEI   $DF
         JSL   L081A92
         JSL   L1511E6
         LDA   #$000F
         AND   $9F
         BEQ   L1F070E
         PEA   $0000
         JSL   L1516ED
         BRA   L1F0715
L1F070E  PEA   $0004
         JSL   L1516ED
L1F0715  PEI   $C1
         PEI   $BF
         JSL   L0718BF
         PHY
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEA   $0080
         JSL   L1F0AE1
         PLA
         STA   $DD
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF89
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $CB
         SEC
         SBC   $C7
         STA   $DB
         LDA   $DB
         SEC
         SBC   $DD
         BEQ   L1F0773
         BVS   L1F075D
         EOR   #$8000
L1F075D  BPL   L1F0773
         PEI   $DB
         PEI   $DB
         PEI   $DD
         JSL   L150318
         PLX
         PLX
         STA   $EB
         PLA
         SEC
         SBC   $EB
         STA   $DB
L1F0773  LDA   $DB
         CLC
         ADC   $C7
         STA   $CB
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDY   #$001A
         LDA   [$D7],Y
         TAX
         DEY
         DEY
         LDA   [$D7],Y
         STA   $EB
         STX   $ED
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         CLC
         ADC   #$0002
         BCC   L1F07A3
         INX
L1F07A3  PHX
         PHA
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEI   $E1
         PEI   $DD
         PEA   $0000
         JSL   L08090C
         PLA
         STA   $DB
         PEI   $C1
         PEI   $BF
         JSL   L07185A
L1F07DE  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0378
         TCS
         RTL

L1F07F0  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$0010
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         STA   $05
         STX   $07
         LDA   #$00FF
         AND   [$05]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1F0818
         EOR   #$8000
L1F0818  BPL   L1F086F
         LDA   #$0001
         STA   $03
L1F081F  LDY   #$0010
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         STA   $05
         STX   $07
         LDY   $03
         LDA   #$00FF
         AND   [$05],Y
         CMP   $16
         BNE   L1F0865
         LDY   #$0010
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         PHX
         PHA
         PEI   $03
         PEA   $0001
         JSL   L150A64
         PEI   $14
         PEI   $12
         LDY   #$0010
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         PHX
         PHA
         PEI   $03
         JSL   L150C4C
         BRA   L1F086F
L1F0865  LDA   $03
         CMP   $01
         BEQ   L1F086F
         INC   $03
         BRA   L1F081F
L1F086F  LDA   $0C
         STA   $16
         LDA   $0B
         STA   $15
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1F0881  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $10
         PEI   $0E
         PEI   $14
         PEI   $12
         PEA   $0100
         JSL   L0313BE
         LDA   $16
         LDX   $18
         STA   $01
         STX   $03
         PEA   $0009
         LDA   #$0005
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F08AE
         INX
L1F08AE  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L1F07F0
         PEA   $000D
         LDA   #$000E
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F08C6
         INX
L1F08C6  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L1F07F0
         PEA   $0015
         LDA   #$001B
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F08DE
         INX
L1F08DE  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L1F07F0
         PEA   $0008
         PEI   $03
         PEI   $01
         PEA   $0000
         PHD
         JSL   L1F07F0
         LDA   $0C
         STA   $18
         LDA   $0B
         STA   $17
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1F0909  ENT
         PHD
         TSC
         CLC
         ADC   #$FEDF
         TCS
         ADC   #$002E
         TCD
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L15132B
         SEP   #$20
         LDA   #$14
         STA   $D6
         REP   #$20
         LDA   #$0001
         STA   $EB
L1F092E  TDC
         CLC
         ADC   #$00D6
         STA   $EF
         STZ   $F1
         LDY   $EB
         TYA
         CLC
         ADC   $EF
         TAX
         LDA   $F1
         BCC   L1F0943
         INC
L1F0943  PHA
         PHX
         TDC
         CLC
         ADC   #$00D6
         STA   $EF
         STZ   $F1
         LDY   $EB
         LDA   #$00FF
         AND   [$EF],Y
         AND   #$007F
         PHA
         PLA
         PLX
         STX   $EF
         PLX
         STX   $F1
         SEP   #$20
         STA   [$EF]
         REP   #$20
         LDA   #$0014
         CMP   $EB
         BEQ   L1F0971
         INC   $EB
         BRA   L1F092E
L1F0971  LDA   $F8
         LDX   $FA
         STA   $D2
         STX   $D4
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         LDA   #$0005
         CLC
         ADC   $D2
         LDX   $D4
         BCC   L1F098D
         INX
L1F098D  CLC
         ADC   #$0001
         BCC   L1F0994
         INX
L1F0994  PHX
         PHA
         PEA   $0000
         PEA   $0008
         JSL   L070597
         LDY   #$0005
         SEP   #$20
         LDA   #$08
         STA   [$D2],Y
         REP   #$20
         TDC
         CLC
         ADC   #$00D6
         PEA   $0000
         PHA
         PEA   $0001
         PEA   $0009
         JSL   L150A64
         LDA   #$00FF
         AND   $D6
         STA   $ED
L1F09C5  TDC
         CLC
         ADC   #$00D6
         STA   $EF
         STZ   $F1
         LDY   $ED
         LDA   #$00FF
         AND   [$EF],Y
         CMP   #$0020
         BNE   L1F09F5
         TDC
         CLC
         ADC   #$00D6
         PEA   $0000
         PHA
         PEI   $ED
         PEA   $0001
         JSL   L150A64
         LDA   #$00FF
         AND   $D6
         STA   $ED
         BRA   L1F09C5
L1F09F5  LDA   #$000E
         CLC
         ADC   $D2
         LDX   $D4
         BCC   L1F0A00
         INX
L1F0A00  PHX
         PHA
         TDC
         CLC
         ADC   #$00D6
         PEA   $0000
         PHA
         PEA   $000D
         JSL   L0313BE
         LDA   #$001B
         CLC
         ADC   $D2
         LDX   $D4
         BCC   L1F0A1D
         INX
L1F0A1D  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD2
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0021
         JSL   L0313BE
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0127
         TCS
         RTL

L1F0A4D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0018
         BCC   L1F0A70
         INX
L1F0A70  STA   $01
         STX   $03
         LDA   $05
         DEC
         BMI   L1F0AC3
         CMP   #$0003
         BPL   L1F0AC3
         SEC
         SBC   #$0000
         BEQ   L1F0A8C
         DEC
         BEQ   L1F0A8C
         DEC
         BEQ   L1F0AA6
         BRA   L1F0AC3
L1F0A8C  LDA   [$01]
         STA   $1A
         LDA   $14
         BEQ   L1F0A9D
         LDA   #$FFFB
         AND   [$01]
         STA   [$01]
         BRA   L1F0AA4
L1F0A9D  LDA   #$0004
         ORA   [$01]
         STA   [$01]
L1F0AA4  BRA   L1F0AC3
L1F0AA6  LDY   #$000C
         LDA   [$01],Y
         STA   $1A
         LDA   #$0000
         LDY   #$000C
         STA   [$01],Y
         LDA   $14
         BEQ   L1F0AC1
         LDA   #$0002
         LDY   #$000C
         STA   [$01],Y
L1F0AC1  BRA   L1F0AC3
L1F0AC3  PHY
         PEI   $18
         PEI   $16
         JSL   L1511B6
         PLA
         STA   $09
         LDA   $12
         STA   $18
         LDA   $11
         STA   $17
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1F0AE1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDX   #$0000
         LDA   #$0080
         AND   $1A
         BNE   L1F0AF4
         INX
L1F0AF4  TXA
         STA   $0F
         LDA   $0F
         BEQ   L1F0B14
         PHY
         PHY
         JSL   L150695
         PLA
         STA   $09
         PLX
         STX   $0B
         LDY   #$0002
         LDA   [$1C],Y
         PHA
         LDA   [$1C]
         PHA
         JSL   L1F0EEB
L1F0B14  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150178
         LDA   $03
         CLC
         ADC   $01
         CLC
         ADC   $07
         STA   $0D
         LDA   #$0001
         AND   $1A
         BEQ   L1F0B39
         LDA   $07
         CLC
         ADC   $0D
         STA   $0D
L1F0B39  LDA   $0F
         BEQ   L1F0B45
         PEI   $0B
         PEI   $09
         JSL   L1F0EEB
L1F0B45  LDA   $0D
         STA   $20
         LDA   $18
         STA   $1E
         LDA   $17
         STA   $1D
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L1F0B5B  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9A
         TCS
         TCD
         LDA   #$0000
         TAX
         STA   [$70]
         TXA
         LDY   #$0002
         STA   [$70],Y
         LDA   #$0000
         TAX
         STA   [$6C]
         TXA
         LDY   #$0002
         STA   [$6C],Y
         LDA   $78
         ORA   $7A
         BEQ   L1F0B84
         BRL   L1F0C62
L1F0B84  LDA   $74
         ORA   $76
         BNE   L1F0BAC
         LDA   #$0001
         LDX   #$0000
         STA   [$70]
         TXA
         LDY   #$0002
         STA   [$70],Y
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         STA   [$6C]
         TXA
         LDY   #$0002
         STA   [$6C],Y
         BRL   L1F0C60
L1F0BAC  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         PEI   $76
         PEI   $74
         JSL   L1F0CF8
         PLA
         LSR
         BCS   L1F0BC9
         BRL   L1F0C8C
L1F0BC9  LDA   $70
         LDX   $72
         STA   $63
         STX   $65
         PHY
         PHY
         JSL   L07B114
         PLA
         STA   [$63]
         PLA
         LDY   #$0002
         STA   [$63],Y
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $5D
         PLX
         STX   $5F
         LDA   $5D
         ORA   $5F
         BNE   L1F0BFD
         BRL   L1F0C8C
L1F0BFD  PEI   $6E
         PEI   $6C
         LDY   #$0002
         LDA   [$70],Y
         PHA
         LDA   [$70]
         PHA
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         CLC
         ADC   #$0014
         BCC   L1F0C19
         INX
L1F0C19  STA   $63
         STX   $65
         LDY   #$0002
         LDA   [$63],Y
         TAX
         LDA   [$63]
         JSL   L150F53
         TAY
         BNE   L1F0C2D
         DEX
L1F0C2D  DEC
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $63
         PLX
         STX   $65
         STA   [$63]
         TYA
         LDY   #$0002
         STA   [$63],Y
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $61
L1F0C60  BRA   L1F0C8C
L1F0C62  LDA   #$0001
         LDX   #$0000
         STA   [$70]
         TXA
         LDY   #$0002
         STA   [$70],Y
         LDY   #$0002
         LDA   [$78],Y
         TAX
         LDA   [$78]
         STA   $63
         STX   $65
         LDY   #$0002
         LDA   [$63],Y
         TAX
         LDA   [$63]
         STA   [$6C]
         TXA
         LDY   #$0002
         STA   [$6C],Y
L1F0C8C  LDA   $6A
         STA   $7A
         LDA   $69
         STA   $79
         LDA   $67
         TCD
         TSC
         CLC
         ADC   #$0078
         TCS
         RTL

L1F0C9E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         LDA   #$0001
         STA   $6A
         LDA   L055027
         LDX   L055029
         CMP   $66
         BNE   L1F0CB7
         CPX   $68
L1F0CB7  BEQ   L1F0CE6
         LDA   #$0001
         STA   $01
         LDA   $66
         LDX   $68
         STA   $03
         STX   $05
         LDA   #$0006
         STA   $2D
         LDA   L055039
         LDX   L05503B
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
         STA   $6A
L1F0CE6  LDA   $64
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

L1F0CF8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         LDA   #$0002
         STA   $01
         LDA   #$0001
         LDX   #$0000
         STA   $07
         STX   $09
         LDA   #$0001
         STA   $2D
         LDA   $66
         LDX   $68
         STA   $2F
         STX   $31
         LDA   L055039
         LDX   L05503B
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
         STA   $6A
         LDA   $64
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

L1F0D49  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $01
         PLX
         STX   $03
         LDX   #$0000
         LDA   #$0003
         CMP   $01
         BEQ   L1F0D68
         INX
L1F0D68  TXA
         STA   $0E
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1F0D71  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L05565D
         BEQ   L1F0D88
         LDAL  L05565D
         PHA
         JSL   L1F0E0A
L1F0D88  PLY
         PLY
         PLD
         RTL

L1F0D8C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L1511AA
         PLA
         STA   $01
         LDA   $01
         BEQ   L1F0E00
         LDA   $01
         STA   L05531B
         LDX   #$0000
         LDA   #$0080
         CMP   $01
         BEQ   L1F0DB0
         INX
L1F0DB0  TXA
         AND   L05531D
         BEQ   L1F0E00
         LDA   $01
         SEC
         SBC   #$1301
         BVS   L1F0DC1
         EOR   #$8000
L1F0DC1  BPL   L1F0DC8
         LDA   #$0000
         BRA   L1F0DCB
L1F0DC8  LDA   #$0001
L1F0DCB  PHA
         LDA   $01
         SEC
         SBC   #$130D
         BEQ   L1F0DDB
         BVS   L1F0DD9
         EOR   #$8000
L1F0DD9  BMI   L1F0DE0
L1F0DDB  LDA   #$0000
         BRA   L1F0DE3
L1F0DE0  LDA   #$0001
L1F0DE3  ORA   $01,S
         PLX
         LSR
         BCC   L1F0DEE
         LDA   #$1303
         STA   $01
L1F0DEE  LDA   $01
         SEC
         SBC   #$1301
         CLC
         ADC   #$084A
         PHA
         JSL   L0727E0
         STZ   L05531D
L1F0E00  LDA   L05531B
         STA   $0C
         PLY
         PLY
         PLY
         PLD
         RTL

L1F0E0A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         STA   L05531B
         PEI   $0A
         JSL   L1504B1
         LDA   $0A
         BNE   L1F0E27
         LDA   #$0001
         STA   L05531D
L1F0E27  LDA   $08
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

L1F0E37  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $12
         PEI   $10
         PEA   $0000
         PEI   $0E
         JSL   L1F0E85
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L1F0E6B
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEI   $12
         PEI   $10
         JSL   L071EC5
L1F0E6B  LDA   $01
         LDX   $03
         STA   $14
         STX   $16
         LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1F0E85  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         PEI   $18
         PEI   $16
         LDA   #$0400
         ORA   L054FBF
         PHA
         PEI   $14
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $03
         PLX
         STX   $05
         LDAL  L05565D
         STA   $07
         LDA   $07
         BEQ   L1F0ED1
         STZ   $03
         STZ   $05
         LDA   L054FB3
         STA   $01
         LDA   #$0001
         STA   L054FB3
         PEA   $083E
         JSL   L0727E0
         LDA   $01
         STA   L054FB3
L1F0ED1  LDA   $03
         LDX   $05
         STA   $1A
         STX   $1C
         LDA   $10
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

L1F0EEB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L051EEC
         PHA
         LDAL  L051EEA
         PHA
         PHY
         PHY
         JSL   L150C3A
         PLA
         PLX
         JSL   L033477
         BEQ   L1F0F1E
         LDAL  L051EEC
         PHA
         LDAL  L051EEA
         PHA
         LDAL  L051EEE
         PHA
         JSL   L150BC4
L1F0F1E  PEI   $0C
         PEI   $0A
         PEA   $0000
         PEA   ^L051EEA
         PEA   L051EEA
         JSL   L1510D7
         LDA   #$00FF
         AND   $0C
         PHA
         JSL   L1512E3
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

L1F0F4A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $22
         PEI   $20
         PEA   $0014
         JSL   L0313BE
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0946A2
         PLA
         STA   $15
         LDA   $15
         BNE   L1F0F82
         PEA   $0852
         JSL   L0727E0
L1F0F82  LDA   $15
         STA   $24
         LDA   $1E
         STA   $22
         LDA   $1D
         STA   $21
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L1F0F98  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0018
         BCC   L1F0FBB
         INX
L1F0FBB  STA   $01
         STX   $03
         LDA   $05
         DEC
         BMI   L1F0FF2
         CMP   #$0003
         BPL   L1F0FF2
         SEC
         SBC   #$0000
         BEQ   L1F0FD7
         DEC
         BEQ   L1F0FD7
         DEC
         BEQ   L1F0FE9
         BRA   L1F0FF2
L1F0FD7  LDA   #$0004
         AND   $14
         PHA
         LDA   #$FFFB
         AND   [$01]
         ORA   $01,S
         PLX
         STA   [$01]
         BRA   L1F0FF2
L1F0FE9  LDA   $14
         LDY   #$000C
         STA   [$01],Y
         BRA   L1F0FF2
L1F0FF2  PHY
         PEI   $18
         PEI   $16
         JSL   L1511B6
         PLA
         STA   $09
         LDA   $12
         STA   $18
         LDA   $11
         STA   $17
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1F1010  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $12
         SEC
         SBC   #$0010
         BVS   L1F1023
         EOR   #$8000
L1F1023  BMI   L1F1075
         LDA   $12
         STAL  L1F01B2
         PEA   ^L1F01B4
         PEA   L1F01B4
         JSL   L085F5A
         PEA   $00FB
         PEA   $002A
         PEA   ^L1F01A8
         PEA   L1F01A8
         JSL   L150556
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   [$01]
         STAL  L1F019E
         LDY   #$0004
         LDA   [$01],Y
         STAL  L1F01A0
         LDA   #$0080
         ORA   $12
         STAL  L1F01A2
         PEA   $00FC
         PEA   $000E
         PEA   ^L1F0194
         PEA   L1F0194
         JSL   L150556
L1F1075  LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1F1087  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0000
         STAL  L1F01B2
         PEA   ^L1F01B4
         PEA   L1F01B4
         PEA   ^L041CB3
         PEA   L041CB3
         PEA   $0020
         JSL   L0313BE
         PEA   $00FB
         PEA   $002A
         PEA   ^L1F01A8
         PEA   L1F01A8
         JSL   L150556
         PLY
         PLY
         PLD
         RTL

L1F10BD  ENT
         PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$0111
         TCD
         PEI   $FA
         PEI   $F8
         PHY
         PHY
         PEA   $083B
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PEI   $FA
         PEI   $F8
         JSL   L150562
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$020A
         TCS
         RTL

L1F111B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         STZ   $24
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   #$0008
         AND   $22
         BNE   L1F113B
         BRL   L1F11F9
L1F113B  PHY
         PHY
         PEA   $0000
         PEA   $1CCA
         PEA   $4010
         PEA   $07D4
         JSL   L1F0E85
         PLA
         STA   L05532F
         PLA
         STA   L055331
         LDA   L05532F
         ORA   L055331
         BNE   L1F1165
         LDA   #$0001
         STA   $24
         BRL   L1F11F9
L1F1165  LDA   L05532F
         LDX   L055331
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $11
         STX   $13
         PEI   $13
         PEI   $11
         JSL   L151424
         LDA   L05532F
         LDX   L055331
         STA   $09
         STX   $0B
         LDA   $11
         LDX   $13
         STA   $05
         STX   $07
         LDA   #$0080
         STA   [$05]
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$00AA
         BCC   L1F11A9
         INX
L1F11A9  LDY   #$0002
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0090
         LDY   #$0006
         STA   [$05],Y
         LDA   #$0008
         CLC
         ADC   $05
         LDX   $07
         BCC   L1F11C6
         INX
L1F11C6  PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0240
         PEA   $0032
         JSL   L15100B
         LDA   #$0010
         CLC
         ADC   $05
         LDX   $07
         BCC   L1F11E3
         INX
L1F11E3  PHX
         PHA
         LDA   #$0008
         CLC
         ADC   $05
         LDX   $07
         BCC   L1F11F0
         INX
L1F11F0  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
L1F11F9  LDA   #$0010
         AND   $22
         BNE   L1F1203
         BRL   L1F12C1
L1F1203  PHY
         PHY
         PEA   $0000
         PEA   $1CCA
         PEA   $4010
         PEA   $07D5
         JSL   L1F0E85
         PLA
         STA   L05532B
         PLA
         STA   L05532D
         LDA   L05532B
         ORA   L05532D
         BNE   L1F122D
         LDA   #$0001
         STA   $24
         BRL   L1F12C1
L1F122D  LDA   L05532B
         LDX   L05532D
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $0D
         STX   $0F
         PEI   $0F
         PEI   $0D
         JSL   L151424
         LDA   L05532B
         LDX   L05532D
         STA   $09
         STX   $0B
         LDA   $0D
         LDX   $0F
         STA   $01
         STX   $03
         LDA   #$0080
         STA   [$01]
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$00AA
         BCC   L1F1271
         INX
L1F1271  LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0090
         LDY   #$0006
         STA   [$01],Y
         LDA   #$0008
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F128E
         INX
L1F128E  PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0240
         PEA   $0032
         JSL   L15100B
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F12AB
         INX
L1F12AB  PHX
         PHA
         LDA   #$0008
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F12B8
         INX
L1F12B8  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
L1F12C1  PEI   $17
         PEI   $15
         JSL   L151131
         LDA   $20
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

L1F12DB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDA   L055327
         ORA   L055329
         BNE   L1F1313
         PHY
         PHY
         PEA   $0000
         PEA   $008C
         PEA   $03EB
         JSL   L1F0E37
         PLA
         STA   L055327
         PLA
         STA   L055329
         LDA   L055327
         ORA   L055329
         BNE   L1F1311
         LDA   #$0001
         STA   $0A
L1F1311  BRA   L1F135E
L1F1313  LDA   L055327
         LDX   L055329
         STA   $01
         STX   $03
         LDA   [$01]
         LDY   #$0002
         ORA   [$01],Y
         BNE   L1F1332
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L150689
L1F1332  PEA   $0000
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L150D44
         LDAL  L05565D
         BEQ   L1F135E
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L07185A
         STZ   L055327
         STZ   L055329
         LDA   #$0001
         STA   $0A
L1F135E  PLY
         PLY
         PLD
         RTL

L1F1362  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCE
         TCS
         TCD
         LDA   $38
         LDX   $3A
         STA   $29
         STX   $2B
         PEI   $2B
         PEI   $29
         LDA   L055327
         LDX   L055329
         STA   $2F
         STX   $31
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0002
         BCC   L1F138F
         INX
L1F138F  CLC
         ADC   #$0006
         BCC   L1F1396
         INX
L1F1396  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0008
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F13AA
         INX
L1F13AA  PHX
         PHA
         PEI   $2B
         PEI   $29
         PEA   $0008
         JSL   L0313BE
         LDA   #$0032
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L1F13C2
         INX
L1F13C2  STA   $25
         STX   $27
         LDA   #$0008
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F13D1
         INX
L1F13D1  STA   $21
         STX   $23
         LDA   [$25]
         BEQ   L1F13E8
         LDY   #$0002
         LDA   [$25],Y
         CLC
         ADC   [$21]
         LDY   #$0004
         STA   [$21],Y
         BRA   L1F13EF
L1F13E8  LDA   [$21]
         LDY   #$0004
         STA   [$21],Y
L1F13EF  LDA   #$0010
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F13FA
         INX
L1F13FA  PHX
         PHA
         PEI   $2B
         PEI   $29
         PEA   $0008
         JSL   L0313BE
         LDA   #$0103
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L1F1412
         INX
L1F1412  STA   $1D
         STX   $1F
         LDA   #$0010
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1421
         INX
L1F1421  STA   $19
         STX   $1B
         LDA   [$1D]
         BEQ   L1F1438
         LDY   #$0004
         LDA   [$19],Y
         LDY   #$0002
         SEC
         SBC   [$1D],Y
         STA   [$19]
         BRA   L1F143F
L1F1438  LDY   #$0004
         LDA   [$19],Y
         STA   [$19]
L1F143F  LDA   $29
         LDX   $2B
         STA   $15
         STX   $17
         LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1452
         INX
L1F1452  PHX
         PHA
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   #$0008
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1465
         INX
L1F1465  CLC
         ADC   #$0004
         BCC   L1F146C
         INX
L1F146C  STA   $2F
         STX   $31
         LDA   [$2F]
         PHA
         LDY   #$0006
         LDA   [$15],Y
         PHA
         LDY   #$0010
         LDA   [$29],Y
         PHA
         JSL   L15100B
         LDA   #$0000
         LDY   #$0034
         STA   [$29],Y
         LDY   #$0026
         LDA   [$3C],Y
         DEC
         DEC
         DEC
         BPL   L1F1498
         BRL   L1F1619
L1F1498  CMP   #$0004
         BMI   L1F14A0
         BRL   L1F1619
L1F14A0  SEC
         SBC   #$0000
         BNE   L1F14A9
         BRL   L1F15DC
L1F14A9  DEC
         DEC
         BEQ   L1F14B3
         DEC
         BEQ   L1F14B3
         BRL   L1F1619
L1F14B3  LDA   [$3C]
         DEC
         DEC
         BMI   L1F14ED
         CMP   #$0002
         BPL   L1F14ED
         SEC
         SBC   #$0000
         BEQ   L1F14C9
         DEC
         BEQ   L1F14DB
         BRA   L1F14ED
L1F14C9  LDA   #$0064
         LDY   #$0028
         STA   [$29],Y
         LDA   #$0140
         LDY   #$002A
         STA   [$29],Y
         BRA   L1F14FD
L1F14DB  LDA   #$0032
         LDY   #$0028
         STA   [$29],Y
         LDA   #$00A0
         LDY   #$002A
         STA   [$29],Y
         BRA   L1F14FD
L1F14ED  LDA   #$00C8
         LDY   #$0028
         STA   [$29],Y
         LDA   #$0280
         LDY   #$002A
         STA   [$29],Y
L1F14FD  LDY   #$0002
         LDA   [$3C],Y
         DEC
         BPL   L1F1508
         BRL   L1F15D9
L1F1508  CMP   #$0003
         BMI   L1F1510
         BRL   L1F15D9
L1F1510  SEC
         SBC   #$0000
         BEQ   L1F151F
         DEC
         BEQ   L1F1552
         DEC
         BEQ   L1F1564
         BRL   L1F15D9
L1F151F  LDA   #$000C
         LDY   #$002C
         STA   [$29],Y
         LDY   #$0030
         LDA   [$3C],Y
         BEQ   L1F1531
         LDA   #$0001
L1F1531  LDY   #$0034
         STA   [$29],Y
         LDY   #$0034
         LDA   [$29],Y
         BEQ   L1F1547
         LDA   #$000C
         LDY   #$002E
         STA   [$29],Y
         BRA   L1F154F
L1F1547  LDA   #$000A
         LDY   #$002E
         STA   [$29],Y
L1F154F  BRL   L1F15D9
L1F1552  LDA   #$0000
         LDY   #$002E
         STA   [$29],Y
         LDA   #$0000
         LDY   #$002C
         STA   [$29],Y
         BRA   L1F15D9
L1F1564  LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F156F
         INX
L1F156F  STA   $11
         STX   $13
         LDA   #$002C
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F157E
         INX
L1F157E  STA   $2F
         STX   $31
         PHY
         LDY   #$0006
         LDA   [$11],Y
         LDY   #$0002
         SEC
         SBC   [$11],Y
         LDY   #$002A
         SEC
         SBC   [$29],Y
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   [$2F]
         LDA   #$002E
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F15AA
         INX
L1F15AA  STA   $2F
         STX   $31
         PHY
         LDY   #$0004
         LDA   [$11],Y
         SEC
         SBC   [$11]
         LDY   #$0028
         SEC
         SBC   [$29],Y
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   [$2F]
         LDY   #$0030
         LDA   [$3C],Y
         BEQ   L1F15D2
         LDA   #$0001
L1F15D2  LDY   #$0034
         STA   [$29],Y
         BRA   L1F15D9
L1F15D9  BRL   L1F168B
L1F15DC  LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F15E7
         INX
L1F15E7  STA   $0D
         STX   $0F
         LDY   #$0006
         LDA   [$0D],Y
         LDY   #$0002
         SEC
         SBC   [$0D],Y
         LDY   #$002A
         STA   [$29],Y
         LDA   #$0000
         LDY   #$002C
         STA   [$29],Y
         LDY   #$001E
         LDA   [$3C],Y
         LDY   #$0028
         STA   [$29],Y
         LDY   #$0022
         LDA   [$3C],Y
         LDY   #$002E
         STA   [$29],Y
         BRA   L1F168B
L1F1619  LDY   #$0020
         LDA   [$3C],Y
         LDY   #$002A
         STA   [$29],Y
         LDY   #$0024
         LDA   [$3C],Y
         LDY   #$002C
         STA   [$29],Y
         LDY   #$0018
         LDA   [$29],Y
         LDY   #$001A
         CLC
         ADC   [$3C],Y
         LDY   #$0018
         STA   [$29],Y
         LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1648
         INX
L1F1648  CLC
         ADC   #$0002
         BCC   L1F164F
         INX
L1F164F  PHX
         PHA
         LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F165C
         INX
L1F165C  CLC
         ADC   #$0002
         BCC   L1F1663
         INX
L1F1663  STA   $2F
         STX   $31
         LDY   #$001C
         LDA   [$3C],Y
         CLC
         ADC   [$2F]
         PLX
         STX   $2F
         PLX
         STX   $31
         STA   [$2F]
         LDY   #$001E
         LDA   [$3C],Y
         LDY   #$0028
         STA   [$29],Y
         LDY   #$0022
         LDA   [$3C],Y
         LDY   #$002E
         STA   [$29],Y
L1F168B  LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1696
         INX
L1F1696  STA   $09
         STX   $0B
         LDA   #$0030
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F16A5
         INX
L1F16A5  STA   $2F
         STX   $31
         LDY   #$0006
         LDA   [$09],Y
         LDY   #$0002
         SEC
         SBC   [$09],Y
         LDY   #$002C
         CLC
         ADC   [$29],Y
         PHA
         LDY   #$002A
         LDA   [$29],Y
         LDY   #$002C
         CLC
         ADC   [$29],Y
         PHA
         JSL   L1500F5
         PLX
         PLX
         STA   [$2F]
         LDY   #$0004
         LDA   [$09],Y
         SEC
         SBC   [$09]
         STA   $2D
         LDY   #$0034
         LDA   [$29],Y
         BNE   L1F16EA
         LDY   #$002E
         LDA   [$29],Y
         CLC
         ADC   $2D
         STA   $2D
L1F16EA  LDA   #$0032
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F16F5
         INX
L1F16F5  STA   $2F
         STX   $31
         PEI   $2D
         LDY   #$0028
         LDA   [$29],Y
         LDY   #$002E
         CLC
         ADC   [$29],Y
         PHA
         JSL   L1500F5
         PLX
         PLX
         STA   [$2F]
         LDX   #$0000
         LDY   #$0026
         LDA   #$0005
         CMP   [$3C],Y
         BNE   L1F171D
         INX
L1F171D  PHX
         LDX   #$0000
         LDY   #$0026
         LDA   #$0006
         CMP   [$3C],Y
         BNE   L1F172C
         INX
L1F172C  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L1F1736
         BRL   L1F180D
L1F1736  LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1741
         INX
L1F1741  STA   $05
         STX   $07
         LDY   #$0034
         LDA   [$29],Y
         BEQ   L1F1754
         LDA   #$000C
         LDY   #$002E
         STA   [$29],Y
L1F1754  LDY   #$0032
         LDA   [$29],Y
         PHA
         LDY   #$0028
         LDA   [$29],Y
         LDY   #$002E
         CLC
         ADC   [$29],Y
         JSL   L150BEE
         PLA
         STA   $2D
         LDY   #$0034
         LDA   [$29],Y
         BNE   L1F177D
         LDA   $2D
         LDY   #$002E
         SEC
         SBC   [$29],Y
         STA   $2D
L1F177D  LDY   #$0004
         LDA   [$05],Y
         SEC
         SBC   [$05]
         SEC
         SBC   $2D
         PHA
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $2D
         PHY
         PEA   $0000
         PEI   $2D
         JSL   L072FA6
         PLA
         STA   $2D
         LDA   $2D
         CLC
         ADC   [$05]
         STA   [$05]
         LDY   #$0030
         LDA   [$29],Y
         PHA
         LDY   #$002A
         LDA   [$29],Y
         LDY   #$002C
         CLC
         ADC   [$29],Y
         JSL   L150BEE
         PLA
         STA   $2D
         LDY   #$0006
         LDA   [$05],Y
         LDY   #$0002
         SEC
         SBC   [$05],Y
         PHA
         LDA   $2D
         LDY   #$002C
         SEC
         SBC   [$29],Y
         STA   $2F
         PLA
         SEC
         SBC   $2F
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $2D
         PHY
         PEA   $0000
         PEI   $2D
         JSL   L072FA6
         PLA
         STA   $2D
         LDY   #$0002
         LDA   $2D
         CLC
         ADC   [$05],Y
         LDY   #$0002
         STA   [$05],Y
         LDY   #$0002
         LDA   #$FFFE
         AND   [$05],Y
         LDY   #$0002
         STA   [$05],Y
L1F180D  LDA   #$0018
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1818
         INX
L1F1818  STA   $01
         STX   $03
         LDA   #$0020
         CLC
         ADC   $29
         LDX   $2B
         BCC   L1F1827
         INX
L1F1827  PHX
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDY   #$0002
         LDA   [$01],Y
         LDY   #$002A
         CLC
         ADC   [$29],Y
         PHA
         LDY   #$0028
         LDA   [$29],Y
         CLC
         ADC   [$01]
         PHA
         JSL   L15100B
         LDA   $36
         STA   $3E
         LDA   $35
         STA   $3D
         LDA   $33
         TCD
         TSC
         CLC
         ADC   #$003C
         TCS
         RTL

L1F185D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         STZ   $05
         STZ   $07
         PHY
         PHY
         PEA   $0000
         PEA   $04A0
         PEA   $544E
         PEA   $5250
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $07
         PEI   $05
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L1F18C5
         PEI   $03
         PEI   $01
         PEI   $12
         JSL   L1F0000
         PEI   $07
         PEI   $05
         PEA   $544E
         PEA   $5250
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L074B81
L1F18C5  LDA   $05
         LDX   $07
         STA   $14
         STX   $16
         LDA   $10
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

L1F18DF  ENT
         PHD
         TSC
         CLC
         ADC   #$FF98
         TCS
         TCD
         LDA   #$0001
         STA   $5F
         PEA   $0000
         JSL   L1F0E0A
         STZ   L055335
         STZ   L055333
         LDA   $6E
         ORA   $70
         BNE   L1F197C
         STZ   L055337
         PHY
         PHY
         JSL   L1F1F72
         PLA
         STA   $49
         PLX
         STX   $4B
         LDA   $49
         ORA   $4B
         BEQ   L1F1917
         LDA   #$0001
L1F1917  STA   $61
         LDA   $61
         BEQ   L1F197A
         PHY
         PEI   $4B
         PEI   $49
         JSL   L0718FA
         PLA
         STA   $5D
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         STA   $51
         STX   $53
         LDA   $51
         LDX   $53
         STA   $15
         STX   $17
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         LDA   #$009E
         CLC
         ADC   $15
         LDX   $17
         BCC   L1F1951
         INX
L1F1951  PHX
         PHA
         LDY   #$000E
         LDA   [$15],Y
         JSL   L150488
         TAY
         BNE   L1F1960
         DEX
L1F1960  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
L1F197A  BRA   L1F1992
L1F197C  TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEI   $70
         PEI   $6E
         PEA   $000A
         JSL   L0313BE
         STZ   $61
L1F1992  LDA   #$0001
         AND   $72
         BNE   L1F199C
         BRL   L1F1A44
L1F199C  PHY
         JSL   L1F12DB
         PLA
         LSR
         BCC   L1F19AA
         STZ   $5F
         BRL   L1F1DB6
L1F19AA  LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L0718BF
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L1510B9
         PHY
         PHY
         JSL   L150FF3
         PLA
         STA   $2F
         PLX
         STX   $31
         LDA   #$0001
         AND   $31
         BNE   L1F19F9
         LDA   L055327
         LDX   L055329
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         CLC
         ADC   #$0018
         BCC   L1F19EE
         INX
L1F19EE  STA   $11
         STX   $13
         LDA   #$0020
         ORA   [$11]
         STA   [$11]
L1F19F9  LDA   $61
         BEQ   L1F1A28
         LDA   #$0012
         CLC
         ADC   $51
         LDX   $53
         BCC   L1F1A08
         INX
L1F1A08  PHX
         PHA
         LDA   L055327
         LDX   L055329
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         PHX
         PHA
         PEA   $0000
         PEA   $008C
         JSL   L070597
L1F1A28  LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L07191C
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L1511B6
         PLA
         STA   $63
L1F1A44  LDA   #$0006
         AND   $72
         BNE   L1F1A4E
         BRL   L1F1C7C
L1F1A4E  LDA   $35
         LDX   $37
         STA   $55
         STX   $57
         LDA   $61
         BEQ   L1F1A71
         LDA   $55
         ORA   $57
         BNE   L1F1A71
         STZ   $33
         PHY
         PHY
         PEA   $0000
         JSL   L1F185D
         PLA
         STA   $55
         PLX
         STX   $57
L1F1A71  PHY
         PHY
         PEI   $57
         PEI   $55
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $45
         PLX
         STX   $47
         LDA   $45
         ORA   $47
         BNE   L1F1A93
         BRL   L1F1C3A
L1F1A93  PHY
         PEI   $47
         PEI   $45
         JSL   L0718FA
         PLA
         STA   $5B
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         STA   $4D
         STX   $4F
         LDA   #$0002
         AND   $72
         BEQ   L1F1ACF
         LDA   #$0022
         CLC
         ADC   $4D
         LDX   $4F
         BCC   L1F1ABD
         INX
L1F1ABD  PHX
         PHA
         PEA   ^L051EF0
         PEA   L051EF0
         PEA   $0000
         PEA   $01D4
         JSL   L070597
L1F1ACF  LDA   #$0004
         AND   $72
         BNE   L1F1AD9
         BRL   L1F1C07
L1F1AD9  PHY
         PHY
         PEA   $0000
         PEA   $0380
         PEA   $07D9
         JSL   L1F0E37
         PLA
         STA   L055323
         PLA
         STA   L055325
         LDA   L055323
         ORA   L055325
         BNE   L1F1AFB
         BRL   L1F1C05
L1F1AFB  LDA   L055323
         LDX   L055325
         PHX
         PHA
         JSL   L0718BF
         PHY
         PEA   ^L051EF8
         PEA   L051EF8
         JSL   L1500E3
         PLA
         LSR
         BCC   L1F1B38
         LDA   L055323
         LDX   L055325
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         CLC
         ADC   #$0006
         BCC   L1F1B2F
         INX
L1F1B2F  STA   $65
         STX   $67
         LDA   #$0080
         STA   [$65]
L1F1B38  LDA   #$0001
         STA   $59
L1F1B3D  LDA   L055323
         LDX   L055325
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         PHX
         PHA
         LDA   $59
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDA   #$0006
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L1F1B76
         INX
L1F1B76  PHX
         PHA
         LDA   #$01F6
         CLC
         ADC   $4D
         LDX   $4F
         BCC   L1F1B83
         INX
L1F1B83  PHX
         PHA
         LDA   $59
         JSL   L150488
         TAY
         BNE   L1F1B8F
         DEX
L1F1B8F  DEC
         PEA   $0000
         PEA   $0016
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $0016
         JSL   L0313BE
         PHY
         LDA   #$0006
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L1F1BB5
         INX
L1F1BB5  CLC
         ADC   #$0004
         BCC   L1F1BBC
         INX
L1F1BBC  PHX
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCS   L1F1BEB
         LDA   #$0006
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L1F1BD1
         INX
L1F1BD1  CLC
         ADC   #$0004
         BCC   L1F1BD8
         INX
L1F1BD8  PHX
         PHA
         JSL   L08273B
         LDY   #$0006
         LDA   #$FF7F
         AND   [$0D],Y
         LDY   #$0006
         STA   [$0D],Y
L1F1BEB  LDA   #$001F
         CMP   $59
         BEQ   L1F1BF7
         INC   $59
         BRL   L1F1B3D
L1F1BF7  LDA   L055323
         LDX   L055325
         PHX
         PHA
         JSL   L07191C
         BRA   L1F1C07
L1F1C05  STZ   $5F
L1F1C07  PEI   $47
         PEI   $45
         PEI   $5B
         JSL   L0718DA
         LDA   $55
         LDX   $57
         STA   $35
         STX   $37
         LDY   #$0020
         LDA   [$4D],Y
         STA   $33
         PEI   $57
         PEI   $55
         PEA   $544E
         PEA   $5250
         LDA   L055051
         EOR   #$0001
         AND   L055335
         PHA
         JSL   L074B81
         BRA   L1F1C75
L1F1C3A  LDA   #$0002
         AND   $72
         BEQ   L1F1C4D
         PEA   ^L051EF0
         PEA   L051EF0
         PEI   $33
         JSL   L1F0099
L1F1C4D  LDA   #$0004
         AND   $72
         BEQ   L1F1C75
         PHY
         PHY
         PEA   $0000
         PEA   $0380
         PEA   $03EE
         JSL   L1F0E37
         PLA
         STA   L055323
         PLA
         STA   L055325
         LDA   L055323
         ORA   L055325
         BNE   L1F1C75
         STZ   $5F
L1F1C75  LDA   $5F
         BNE   L1F1C7C
         BRL   L1F1DB6
L1F1C7C  LDA   #$0018
         AND   $72
         BNE   L1F1C86
         BRL   L1F1DB6
L1F1C86  PHY
         PEI   $72
         JSL   L1F111B
         PLA
         LSR
         BCC   L1F1C96
         STZ   $5F
         BRL   L1F1DB6
L1F1C96  TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   $0008
         JSL   L0313BE
         PEI   $3B
         PEI   $39
         PEA   $0000
         PEA   $0000
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L083523
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0240
         PEA   $0032
         JSL   L15100B
         LDA   #L053239
         LDX   #^L053239
         STA   $19
         STX   $1B
         TDC
         CLC
         ADC   #$003D
         STA   $21
         STZ   $23
         STZ   $29
         STZ   $2B
         STZ   $2D
         LDA   #$0008
         AND   $72
         BEQ   L1F1D3E
         LDA   L05532F
         LDX   L055331
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         STA   $09
         STX   $0B
         LDA   $09
         LDX   $0B
         STA   $1D
         STX   $1F
         LDA   #$0010
         CLC
         ADC   $09
         LDX   $0B
         BCC   L1F1D2D
         INX
L1F1D2D  STA   $25
         STX   $27
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150476
L1F1D3E  LDA   #$0010
         AND   $72
         BEQ   L1F1D97
         LDA   #$0032
         STA   $41
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0032
         JSL   L1501AF
         LDA   L05532B
         LDX   L05532D
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         STA   $05
         STX   $07
         LDA   $05
         LDX   $07
         STA   $1D
         STX   $1F
         LDA   #$0010
         CLC
         ADC   $05
         LDX   $07
         BCC   L1F1D86
         INX
L1F1D86  STA   $25
         STX   $27
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150476
L1F1D97  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L053259
         PEA   L053259
         JSL   L085216
L1F1DB6  LDA   $61
         BNE   L1F1DBD
         BRL   L1F1E88
L1F1DBD  LDA   $51
         LDX   $53
         STA   $01
         STX   $03
         PHY
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         LDA   #$009E
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F1DDA
         INX
L1F1DDA  PHX
         PHA
         LDY   #$000E
         LDA   [$01],Y
         JSL   L150488
         TAY
         BNE   L1F1DE9
         DEX
L1F1DE9  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $000A
         JSL   L070A10
         PLA
         LSR
         BCS   L1F1E5B
         LDY   #$0010
         LDA   [$01],Y
         BNE   L1F1E18
         LDY   #$000E
         LDA   [$01],Y
         LDY   #$0010
         STA   [$01],Y
L1F1E18  LDA   #$009E
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F1E23
         INX
L1F1E23  PHX
         PHA
         LDY   #$000E
         LDA   [$01],Y
         JSL   L150488
         TAY
         BNE   L1F1E32
         DEX
L1F1E32  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   #$0001
         STA   L055337
L1F1E5B  PEI   $4B
         PEI   $49
         PEI   $5D
         JSL   L0718DA
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   L055337
         PHA
         JSL   L074B81
         STZ   L055337
         BRA   L1F1E9C
L1F1E88  PEI   $70
         PEI   $6E
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
L1F1E9C  LDA   $5F
         STA   $74
         LDA   $5F
         BNE   L1F1EAA
         PEI   $72
         JSL   L1F1EBC
L1F1EAA  LDA   $6C
         STA   $72
         LDA   $6B
         STA   $71
         LDA   $69
         TCD
         TSC
         CLC
         ADC   #$0070
         TCS
         RTL

L1F1EBC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         AND   $0A
         BEQ   L1F1EE2
         LDA   L055327
         ORA   L055329
         BEQ   L1F1EE2
         PEA   $0002
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L150D44
L1F1EE2  LDA   #$0002
         AND   $0A
         BEQ   L1F1EE9
L1F1EE9  LDA   #$0004
         AND   $0A
         BEQ   L1F1EFC
         LDA   L055323
         LDX   L055325
         PHX
         PHA
         JSL   L07185A
L1F1EFC  LDA   #$0008
         AND   $0A
         BEQ   L1F1F2F
         LDA   L05532F
         ORA   L055331
         BEQ   L1F1F2F
         LDA   L05532F
         LDX   L055331
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L150260
         LDA   L05532F
         LDX   L055331
         PHX
         PHA
         JSL   L07185A
L1F1F2F  LDA   #$0010
         AND   $0A
         BEQ   L1F1F62
         LDA   L05532B
         ORA   L05532D
         BEQ   L1F1F62
         LDA   L05532B
         LDX   L05532D
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L150260
         LDA   L05532B
         LDX   L05532D
         PHX
         PHA
         JSL   L07185A
L1F1F62  LDA   $08
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

L1F1F72  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         STZ   $1C
         STZ   $1E
         PHY
         PHY
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L077624
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L1F1FA6
         BRL   L1F205B
L1F1FA6  LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
         LDX   #$0000
         LDY   #$000C
         LDA   [$05],Y
         DEC
         DEC
         BEQ   L1F1FBF
         INX
L1F1FBF  PHX
         LDA   #$01E0
         LDX   #$0000
         CMP   [$05]
         BNE   L1F1FD0
         LDY   #$0002
         TXA
         CMP   [$05],Y
L1F1FD0  BNE   L1F1FD7
         LDA   #$0000
         BRA   L1F1FDA
L1F1FD7  LDA   #$0001
L1F1FDA  ORA   $01,S
         PLX
         PHA
         LDY   #$000E
         LDA   [$05],Y
         PHA
         LDY   #$0010
         LDA   [$05],Y
         STA   $13
         PLA
         SEC
         SBC   $13
         BEQ   L1F1FF8
         BVS   L1F1FF6
         EOR   #$8000
L1F1FF6  BMI   L1F1FFD
L1F1FF8  LDA   #$0000
         BRA   L1F2000
L1F1FFD  LDA   #$0001
L1F2000  ORA   $01,S
         PLX
         PHA
         LDY   #$000E
         LDA   [$05],Y
         SEC
         SBC   #$0001
         BVS   L1F2012
         EOR   #$8000
L1F2012  BPL   L1F2019
         LDA   #$0000
         BRA   L1F201C
L1F2019  LDA   #$0001
L1F201C  ORA   $01,S
         PLX
         PHA
         LDY   #$000E
         LDA   [$05],Y
         SEC
         SBC   #$0020
         BEQ   L1F2032
         BVS   L1F2030
         EOR   #$8000
L1F2030  BMI   L1F2037
L1F2032  LDA   #$0000
         BRA   L1F203A
L1F2037  LDA   #$0001
L1F203A  ORA   $01,S
         PLX
         LSR
         BCC   L1F205B
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L074B81
         STZ   $09
         STZ   $0B
L1F205B  LDA   $09
         ORA   $0B
         BEQ   L1F2064
         BRL   L1F20ED
L1F2064  PHY
         PHY
         PEA   $0000
         PEA   $01DE
         PEA   $5452
         PEA   $504D
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L077624
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L1F20A3
         BRA   L1F20F5
L1F20A3  LDA   $0D
         LDX   $0F
         STAL  L053AD9
         TXA
         STAL  L053ADB
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$000C
         BCC   L1F20BF
         INX
L1F20BF  PHX
         PHA
         PEA   $0000
         PEA   $01D2
         JSL   L071EC5
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $01
         STX   $03
         LDA   #$0002
         LDY   #$000C
         STA   [$01],Y
         LDA   #$0001
         LDY   #$000E
         STA   [$01],Y
         LDA   #$0001
         STA   L055337
L1F20ED  LDA   $09
         LDX   $0B
         STA   $1C
         STX   $1E
L1F20F5  TSC
         CLC
         ADC   #$0016
         TCS
         PLD
         RTL

L1F20FD  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   $68
         ORA   $6A
         BNE   L1F2185
         PHY
         PHY
         JSL   L1F1F72
         PLA
         STA   $49
         PLX
         STX   $4B
         LDA   $49
         ORA   $4B
         BEQ   L1F2120
         LDA   #$0001
L1F2120  STA   $5D
         LDA   $5D
         BEQ   L1F2183
         PHY
         PEI   $4B
         PEI   $49
         JSL   L0718FA
         PLA
         STA   $59
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         STA   $4D
         STX   $4F
         LDA   $4D
         LDX   $4F
         STA   $15
         STX   $17
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         LDA   #$009E
         CLC
         ADC   $15
         LDX   $17
         BCC   L1F215A
         INX
L1F215A  PHX
         PHA
         LDY   #$000E
         LDA   [$15],Y
         JSL   L150488
         TAY
         BNE   L1F2169
         DEX
L1F2169  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
L1F2183  BRA   L1F219B
L1F2185  TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEI   $6A
         PEI   $68
         PEA   $000A
         JSL   L0313BE
         STZ   $5D
L1F219B  LDA   #$0001
         AND   $6C
         BEQ   L1F21E2
         LDA   L055337
         BEQ   L1F21E2
         LDA   $5D
         BEQ   L1F21E2
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         STA   $11
         STX   $13
         LDA   L055327
         LDX   L055329
         STA   $5F
         STX   $61
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         PHX
         PHA
         LDA   #$0012
         CLC
         ADC   $11
         LDX   $13
         BCC   L1F21D6
         INX
L1F21D6  PHX
         PHA
         PEA   $0000
         PEA   $008C
         JSL   L070597
L1F21E2  LDA   #$0006
         AND   $6C
         BNE   L1F21EC
         BRL   L1F235D
L1F21EC  LDA   L055335
         BNE   L1F21F4
         BRL   L1F235D
L1F21F4  LDA   $31
         LDX   $33
         STA   $55
         STX   $57
         LDA   $5D
         BEQ   L1F221F
         LDA   $55
         ORA   $57
         BNE   L1F221F
         STZ   $2F
         PHY
         PHY
         PEA   $0000
         JSL   L1F185D
         PLA
         STA   $55
         PLX
         STX   $57
         LDA   $55
         LDX   $57
         STA   $31
         STX   $33
L1F221F  PHY
         PHY
         PEI   $57
         PEI   $55
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $45
         PLX
         STX   $47
         LDA   $45
         ORA   $47
         BNE   L1F2241
         BRL   L1F235D
L1F2241  LDA   #$0002
         AND   $6C
         BEQ   L1F2269
         PEA   ^L051EF0
         PEA   L051EF0
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         CLC
         ADC   #$0022
         BCC   L1F225D
         INX
L1F225D  PHX
         PHA
         PEA   $0000
         PEA   $01D4
         JSL   L070597
L1F2269  LDA   #$0004
         AND   $6C
         BEQ   L1F22E8
         LDA   #$0001
         STA   $5B
L1F2275  LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         CLC
         ADC   #$01F6
         BCC   L1F2284
         INX
L1F2284  PHX
         PHA
         LDA   $5B
         JSL   L150488
         TAY
         BNE   L1F2290
         DEX
L1F2290  DEC
         PEA   $0000
         PEA   $0016
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   L055323
         LDX   L055325
         STA   $5F
         STX   $61
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         PHX
         PHA
         LDA   $5B
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L1F22D4
         INX
L1F22D4  PHX
         PHA
         PEA   $0016
         JSL   L0313BE
         LDA   #$001F
         CMP   $5B
         BEQ   L1F22E8
         INC   $5B
         BRA   L1F2275
L1F22E8  LDA   $5D
         BEQ   L1F2345
         LDA   $4D
         LDX   $4F
         STA   $0D
         STX   $0F
         LDY   #$0010
         LDA   [$0D],Y
         BNE   L1F2345
         LDA   #$0001
         LDY   #$0010
         STA   [$0D],Y
         LDA   #$009E
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L1F230E
         INX
L1F230E  CLC
         ADC   #$0002
         BCC   L1F2315
         INX
L1F2315  STA   $5F
         STX   $61
         LDA   $55
         LDX   $57
         STA   [$5F]
         TXA
         LDY   #$0002
         STA   [$5F],Y
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         CLC
         ADC   #$0020
         BCC   L1F2334
         INX
L1F2334  STA   $5F
         STX   $61
         LDA   [$5F]
         LDY   #$009E
         STA   [$0D],Y
         LDA   #$0001
         STA   L055337
L1F2345  PEI   $57
         PEI   $55
         PEA   $544E
         PEA   $5250
         LDA   L055051
         EOR   #$0001
         AND   L055335
         PHA
         JSL   L074B81
L1F235D  LDA   #$0018
         AND   $6C
         BNE   L1F2367
         BRL   L1F24B3
L1F2367  LDA   L055051
         EOR   #$0001
         AND   L055333
         BNE   L1F2375
         BRL   L1F24B3
L1F2375  TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   $0008
         JSL   L0313BE
         PEI   $37
         PEI   $35
         PEA   $0000
         PEA   $0000
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L083523
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L151355
         LDA   #L053239
         LDX   #^L053239
         STA   $1D
         STX   $1F
         TDC
         CLC
         ADC   #$0041
         STA   $25
         STZ   $27
         STZ   $29
         STZ   $2B
         STZ   $2D
         LDA   #$0008
         AND   $6C
         BEQ   L1F2417
         LDA   L05532F
         LDX   L055331
         STA   $5F
         STX   $61
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         STA   $09
         STX   $0B
         LDA   $09
         LDX   $0B
         STA   $19
         STX   $1B
         LDA   #$0010
         CLC
         ADC   $09
         LDX   $0B
         BCC   L1F2406
         INX
L1F2406  STA   $21
         STX   $23
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150476
L1F2417  LDA   #$0010
         AND   $6C
         BEQ   L1F245D
         LDA   #$0032
         STA   $41
         LDA   L05532B
         LDX   L05532D
         STA   $5F
         STX   $61
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         STA   $05
         STX   $07
         LDA   $05
         LDX   $07
         STA   $19
         STX   $1B
         LDA   #$0010
         CLC
         ADC   $05
         LDX   $07
         BCC   L1F244C
         INX
L1F244C  STA   $21
         STX   $23
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150476
L1F245D  LDA   $35
         LDX   $37
         STA   $51
         STX   $53
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $53
         PEI   $51
         JSL   L08337F
         PLA
         STA   $35
         PLX
         STX   $37
         LDA   $35
         ORA   $37
         BEQ   L1F2491
         LDA   #$0004
         CLC
         ADC   $2F
         STA   $2F
L1F2491  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L053259
         PEA   L053259
         JSL   L085216
         STZ   L055333
L1F24B3  LDA   $5D
         BNE   L1F24BA
         BRL   L1F2574
L1F24BA  LDA   $4D
         LDX   $4F
         STA   $01
         STX   $03
         PHY
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         LDA   #$009E
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F24D7
         INX
L1F24D7  PHX
         PHA
         LDY   #$000E
         LDA   [$01],Y
         JSL   L150488
         TAY
         BNE   L1F24E6
         DEX
L1F24E6  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $000A
         JSL   L070A10
         PLA
         LSR
         BCS   L1F2547
         LDA   #$009E
         CLC
         ADC   $01
         LDX   $03
         BCC   L1F250F
         INX
L1F250F  PHX
         PHA
         LDY   #$000E
         LDA   [$01],Y
         JSL   L150488
         TAY
         BNE   L1F251E
         DEX
L1F251E  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   #$0001
         STA   L055337
L1F2547  PEI   $4B
         PEI   $49
         PEI   $59
         JSL   L0718DA
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   L055337
         PHA
         JSL   L074B81
         STZ   L055337
         BRA   L1F2588
L1F2574  PEI   $6A
         PEI   $68
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
L1F2588  PEI   $6C
         JSL   L1F1EBC
         LDA   $66
         STA   $6C
         LDA   $65
         STA   $6B
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$006A
         TCS
         RTL

L1F25A0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L073CDF
         PLA
         STA   $01
         STZ   $10
         PHY
         PEA   ^L040827
         PEA   L040827
         JSL   L1F0F4A
         PLA
         LSR
         BCS   L1F25C3
         BRA   L1F25E8
L1F25C3  PHY
         JSL   L1F27B5
         PLA
         LSR
         BCS   L1F25CE
         BRA   L1F25E8
L1F25CE  PHY
         PEI   $0E
         PEI   $0C
         JSL   L16095E
         PLA
         STA   $10
         PEA   ^L16095E
         PEA   L16095E
         JSL   L07187A
         JSL   L1F2B4D
L1F25E8  PEI   $01
         JSL   L0724F7
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

L1F2600  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PHY
         PHY
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         PEA   $0004
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15123D
         TDC
         CLC
         ADC   #$0001
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
         PEI   $03
         PEI   $05
         JSL   L1510C5
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15123D
         PHY
         PHY
         PEA   $0858
         JSL   L0711EB
         JSL   L150592
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

L1F268B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $11
         JSL   L072328
         LDA   L055341
         ORA   L055343
         BEQ   L1F26AA
         LDA   #$0001
L1F26AA  STA   $15
         LDA   $15
         BEQ   L1F26C8
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L151131
L1F26C8  LDA   $15
         BNE   L1F26CF
         BRL   L1F279B
L1F26CF  PHY
         PEA   $0002
         PEA   ^L052D64
         PEA   L052D64
         JSL   L150070
         PLA
         LSR
         BCS   L1F26E4
         BRL   L1F279B
L1F26E4  LDAL  L052D70
         TAX
         LDAL  L052D6E
         STA   $0D
         STX   $0F
L1F26F1  PHY
         PEA   $0004
         PEA   ^L052D64
         PEA   L052D64
         JSL   L151017
         PLA
         LSR
         BCC   L1F2716
         PHY
         PEA   $0006
         PEA   ^L052D64
         PEA   L052D64
         JSL   L150070
         PLA
         STA   $15
         BRA   L1F26F1
L1F2716  PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $0F
         PEI   $0D
         JSL   L150B9A
         PLA
         CMP   #$0013
         BNE   L1F279B
         LDA   L055341
         LDX   L055343
         CMP   $09
         BNE   L1F273A
         CPX   $0B
L1F273A  BNE   L1F279B
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $0F
         PEI   $0D
         LDA   L055341
         LDX   L055343
         PHX
         PHA
         JSL   L150482
         PLA
         CMP   #$0002
         BNE   L1F279B
         PEA   $0004
         JSL   L0724F7
         PHY
         PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0000
         PEI   $03
         PEI   $01
         JSL   L150B0A
         PLA
         CMP   #$0002
         BNE   L1F2797
         PEA   $0080
         JSL   L1F0E0A
         PEA   $0000
         PHD
         JSL   L1F2600
         PEA   ^L040831
         PEA   L040831
         JSL   L0B2D94
         BRA   L1F279B
L1F2797  JSL   L072328
L1F279B  LDA   $15
         BEQ   L1F27A7
         PEI   $07
         PEI   $05
         JSL   L151131
L1F27A7  PEI   $11
         JSL   L071AA4
         TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L1F27B5  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDA   L055345
         BEQ   L1F27CB
         LDA   #$0001
         STA   $0A
         BRA   L1F2801
L1F27CB  PEA   $0013
         PEA   $0000
         JSL   L151337
         LDAL  L05565D
         BNE   L1F27E7
         LDA   L0551B7
         PHA
         LDA   L055347
         PHA
         JSL   L15066B
L1F27E7  LDAL  L05565D
         BEQ   L1F27F6
         PEA   $0852
         JSL   L0727E0
         BRA   L1F2801
L1F27F6  LDA   #$0001
         STA   L055345
         LDA   #$0001
         STA   $0A
L1F2801  PLY
         PLY
         PLD
         RTL

L1F2805  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L073CDF
         PLA
         STA   $01
         STZ   $0E
         PHY
         PEA   ^L040838
         PEA   L040838
         JSL   L1F0F4A
         PLA
         LSR
         BCS   L1F2828
         BRA   L1F284B
L1F2828  PHY
         JSL   L1F27B5
         PLA
         LSR
         BCS   L1F2833
         BRA   L1F284B
L1F2833  PHY
         PEI   $0C
         JSL   L16096C
         PLA
         STA   $0E
         PEA   ^L16096C
         PEA   L16096C
         JSL   L07187A
         JSL   L1F2B4D
L1F284B  PEI   $01
         JSL   L0724F7
         LDA   $0A
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

L1F2862  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         PEA   ^L040842
         PEA   L040842
         JSL   L1F0F4A
         PLA
         LSR
         BCC   L1F28BB
         LDX   #$0000
         LDY   #$0010
         LDA   #$0002
         AND   [$0C],Y
         CMP   #$0000
         BEQ   L1F288A
         INX
L1F288A  TXA
         STA   $01
         LDA   #$0012
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L1F2898
         INX
L1F2898  STA   $03
         STX   $05
         PHY
         LDY   #$000E
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEI   $01
         JSL   L16097A
         PLA
         STA   [$03]
         PEA   ^L16097A
         PEA   L16097A
         JSL   L07187A
L1F28BB  LDA   $0A
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

L1F28CD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L073CDF
         PLA
         STA   $01
         STZ   $12
         PHY
         JSL   L1F27B5
         PLA
         LSR
         BCS   L1F28EB
         BRL   L1F2969
L1F28EB  LDA   $10
         DEC
         DEC
         BMI   L1F2969
         CMP   #$00C1
         BPL   L1F2969
         SEC
         SBC   #$0000
         BEQ   L1F2910
         SEC
         SBC   #$003F
         BEQ   L1F295F
         DEC
         BEQ   L1F295F
         SEC
         SBC   #$007F
         BEQ   L1F2933
         DEC
         BEQ   L1F2933
         BRA   L1F2969
L1F2910  PHY
         PEA   ^L04084C
         PEA   L04084C
         JSL   L1F0F4A
         PLA
         LSR
         BCC   L1F2931
         PHY
         JSL   L160988
         PLA
         STA   $12
         PEA   ^L160988
         PEA   L160988
         JSL   L07187A
L1F2931  BRA   L1F2969
L1F2933  PHY
         PEA   ^L040856
         PEA   L040856
         JSL   L1F0F4A
         PLA
         LSR
         BCC   L1F295D
         PHY
         JSL   L160996
         PLA
         LSR
         BCC   L1F2953
         PEA   $0000
         PHD
         JSL   L1F2862
L1F2953  PEA   ^L160996
         PEA   L160996
         JSL   L07187A
L1F295D  BRA   L1F2969
L1F295F  PEA   $0000
         PHD
         JSL   L1F2862
         BRA   L1F2969
L1F2969  JSL   L1F2B4D
         PEI   $01
         JSL   L0724F7
         LDA   $0A
         STA   $10
         LDA   $09
         STA   $0F
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L1F2985  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         JSL   L0727BF
         PLA
         STA   $03
         STZ   $10
         PHY
         JSL   L1F27B5
         PLA
         LSR
         BCC   L1F2A01
         LDA   $0E
         SEC
         SBC   #$0081
         BMI   L1F2A01
         CMP   #$0042
         BPL   L1F2A01
         SEC
         SBC   #$0000
         BEQ   L1F29BB
         SEC
         SBC   #$0041
         BEQ   L1F29DE
         BRA   L1F2A01
L1F29BB  PHY
         PEA   ^L040861
         PEA   L040861
         JSL   L1F0F4A
         PLA
         LSR
         BCC   L1F29DC
         PHY
         JSL   L1609A4
         PLA
         STA   $10
         PEA   ^L1609A4
         PEA   L1609A4
         JSL   L07187A
L1F29DC  BRA   L1F2A01
L1F29DE  PHY
         PEA   ^L04086B
         PEA   L04086B
         JSL   L1F0F4A
         PLA
         LSR
         BCC   L1F29FF
         PHY
         JSL   L160996
         PLA
         STA   $10
         PEA   ^L160996
         PEA   L160996
         JSL   L07187A
L1F29FF  BRA   L1F2A01
L1F2A01  JSL   L1F2B4D
         PEI   $03
         JSL   L0724F7
         LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L1F2A1D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L073CDF
         PLA
         STA   $01
         STZ   $1A
         PHY
         PEA   ^L040876
         PEA   L040876
         JSL   L1F0F4A
         PLA
         LSR
         BCS   L1F2A40
         BRA   L1F2ABC
L1F2A40  PHY
         JSL   L1F27B5
         PLA
         LSR
         BCS   L1F2A4B
         BRA   L1F2ABC
L1F2A4B  PHY
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L1F18DF
         PLA
         LSR
         BCC   L1F2AA7
         LDA   $18
         SEC
         SBC   #$0022
         BMI   L1F2AA7
         CMP   #$0002
         BPL   L1F2AA7
         SEC
         SBC   #$0000
         BEQ   L1F2A75
         DEC
         BEQ   L1F2A8E
         BRA   L1F2AA7
L1F2A75  PHY
         PEI   $16
         PEI   $14
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         PEA   $0000
         JSL   L1609B2
         PLA
         STA   $1A
         BRA   L1F2AA7
L1F2A8E  PHY
         PEI   $16
         PEI   $14
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         PEA   $0001
         JSL   L1609B2
         PLA
         STA   $1A
         BRA   L1F2AA7
L1F2AA7  PEA   $0001
         JSL   L1F1EBC
         PEA   ^L1609B2
         PEA   L1609B2
         JSL   L07187A
         JSL   L1F2B4D
L1F2ABC  PEI   $01
         JSL   L0724F7
         LDA   $0A
         STA   $18
         LDA   $09
         STA   $17
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1F2AD4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $22
         PEI   $20
         PEA   $0014
         JSL   L0313BE
         PHY
         JSL   L073CDF
         PLA
         STA   $15
         STZ   $24
         PHY
         PEA   ^L040880
         PEA   L040880
         JSL   L1F0F4A
         PLA
         LSR
         BCS   L1F2B0B
         BRA   L1F2B35
L1F2B0B  PHY
         JSL   L1F27B5
         PLA
         LSR
         BCS   L1F2B16
         BRA   L1F2B35
L1F2B16  PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1609C0
         PLA
         STA   $24
         PEA   ^L1609C0
         PEA   L1609C0
         JSL   L07187A
         JSL   L1F2B4D
L1F2B35  PEI   $15
         JSL   L0724F7
         LDA   $1E
         STA   $22
         LDA   $1D
         STA   $21
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L1F2B4D  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L055345
         AND   L05510D
         BNE   L1F2B5F
         BRA   L1F2B78
L1F2B5F  JSL   L1506E7
         PEA   $0013
         JSL   L151331
         PEA   $4013
         JSL   L15000C
         JSL   L15059E
         STZ   L055345
L1F2B78  PLY
         PLY
         PLY
         PLD
         RTL

