*
* HypercardGS
* segment: $19 InfoDialog
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   InfoDialog.l
         lst   off

*---------------------------------------

         use   InfoDialog.E
         use   InfoDialog.X

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

L190000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDY   #$00E3
         LDA   [$14],Y
         PHA
         DEY
         DEY
         LDA   [$14],Y
         PHA
         LDA   #$0013
         CLC
         ADC   $18
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L072B17
         STZ   $01
L190029  LDA   #$0017
         CLC
         ADC   $05
         STA   $09
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEI   $01
         JSL   L081A92
         JSL   L1501B5
         LDA   $09
         DEC
         DEC
         STA   $05
         LDA   #$000F
         CMP   $01
         BEQ   L190059
         INC   $01
         BRA   L190029
L190059  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L151412
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L151412
         PEI   $03
         PEI   $07
         LDA   #$0007
         CLC
         ADC   $18
         PHA
         JSL   L08736A
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

L190094  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   #$0001
         STA   $09
L1900AB  LDY   #$00E3
         LDA   [$14],Y
         PHA
         DEY
         DEY
         LDA   [$14],Y
         PHA
         LDA   #$0013
         CLC
         ADC   $09
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L072B17
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFFA
         PEA   $FFFE
         JSL   L151005
         LDY   #$00D5
         LDA   [$14],Y
         CMP   $09
         BNE   L1900EF
         PEA   $0000
         JSL   L081DD8
         BRA   L1900F6
L1900EF  PEA   $FFFF
         JSL   L081DD8
L1900F6  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151418
         LDA   #$0006
         CMP   $09
         BEQ   L19010E
         INC   $09
         BRA   L1900AB
L19010E  LDA   $12
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

L190120  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$00E7
         LDA   [$0A],Y
         BEQ   L190151
         PEA   $0000
         LDY   #$00D5
         LDA   [$0A],Y
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L041CB3
         LDX   #^L041CB3
         BCC   L190149
         INX
L190149  PHX
         PHA
         JSL   L150306
         BRA   L190165
L190151  PEA   $0000
         LDA   #$007D
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L19015F
         INX
L19015F  PHX
         PHA
         JSL   L150306
L190165  LDA   $08
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

L190176  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         PEI   $1E
         PEI   $1C
         LDA   $1A
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $05
         PLX
         STX   $07
         LDAL  L05565D
         BNE   L1901C6
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$0008
         BCC   L1901AB
         INX
L1901AB  STA   $01
         STX   $03
         LDY   #$0002
         LDA   $18
         CLC
         ADC   [$01],Y
         PHA
         LDA   $16
         CLC
         ADC   [$01]
         PHA
         PEI   $07
         PEI   $05
         JSL   L150B04
L1901C6  LDA   $10
         STA   $1E
         LDA   $0F
         STA   $1D
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L1901D8  ENT
         PHD
         TSC
         CLC
         ADC   #$FB80
         TCS
         ADC   #$038D
         TCD
         JSL   L0903F2
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $EB
         PLX
         STX   $ED
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L150312
         LDA   #$1000
         ANDL  L053AE9
         BEQ   L19020C
         LDA   #$0001
L19020C  STA   $E5
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   ^L053AFD
         PEA   L053AFD
         PEA   $0020
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD73
         PHA
         PEA   $000E
         JSL   L073002
         PEA   ^L0408E7
         PEA   L0408E7
         PEA   $0000
         TDC
         CLC
         ADC   #$FC73
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   ^L0408E9
         PEA   L0408E9
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7D
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   $FA
         SEC
         SBC   #$0002
         BEQ   L190287
         BVS   L190282
         EOR   #$8000
L190282  BPL   L190287
         BRL   L190376
L190287  TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L07A972
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD73
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FF7D
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L190328
         BEQ   L190328
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   ^L0408EB
         PEA   L0408EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   ^L0408F0
         PEA   L0408F0
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7D
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L190328  PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD73
         PHA
         PEA   $000F
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FD5F
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7D
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L190376  LDA   $FA
         DEC
         BEQ   L19037E
         BRL   L190471
L19037E  LDA   $E5
         BEQ   L19039B
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
L19039B  LDA   L055027
         LDX   L055029
         PHX
         PHA
         TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L07A972
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD73
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FF7D
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L190423
         BEQ   L190423
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   ^L0408F2
         PEA   L0408F2
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   ^L0408F7
         PEA   L0408F7
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7D
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L190423  PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD73
         PHA
         PEA   $0010
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FD5F
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7D
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L190471  LDA   #$0006
         STA   $DD
         LDA   #$0006
         STA   $D7
         LDA   #$0006
         STA   $D5
         PEA   ^L041D53
         PEA   L041D53
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   #$0001
         STA   $D7
L19049B  PHY
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         LDA   $D7
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L041CB3
         LDX   #^L041CB3
         BCC   L1904B9
         INX
L1904B9  PHX
         PHA
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCC   L1904D1
         LDA   $D7
         STA   $D5
         LDA   #$0005
         STA   $DD
         BRA   L1904DC
L1904D1  LDA   #$0005
         CMP   $D7
         BEQ   L1904DC
         INC   $D7
         BRA   L19049B
L1904DC  PHY
         JSL   L0727BF
         PLA
         STA   $E9
         PHY
         PHY
         PEA   $0514
         JSL   L072834
         PLA
         STA   $E1
         PLX
         STX   $E3
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7D
         PHA
         PHY
         PHY
         LDA   #$0BD3
         CLC
         ADC   $FA
         PHA
         JSL   L0711EB
         PEA   ^L0408F9
         PEA   L0408F9
         PEA   ^L0408FA
         PEA   L0408FA
         JSL   L073C22
         LDA   $E5
         STA   $E7
         PEA   $0000
         PEA   $000B
         PHY
         PHY
         PEI   $E3
         PEI   $E1
         LDA   #$000A
         CLC
         ADC   $FA
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L150138
         PEI   $E3
         PEI   $E1
         PEA   $000B
         JSL   L073CFE
         LDA   $F8
         BNE   L1905BF
         PHY
         PHY
         PEI   $E3
         PEI   $E1
         PEA   $0000
         PEA   $000B
         JSL   L151367
         PLA
         PLX
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         TXY
         LDX   #$FE79
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE79
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L190583
         INX
L190583  PHX
         PHA
         PHY
         PHY
         LDX   #$FE79
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L190597
         INX
L190597  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   $8000
         PEA   $0000
         JSL   L150241
         PLA
         PLY
         PLX
         STX   $EF
         PLX
         STX   $F1
         STA   [$EF]
         TYA
         LDY   #$0002
         STA   [$EF],Y
L1905BF  LDA   $E7
         INC
         PHA
         PEI   $E3
         PEI   $E1
         PEA   $000B
         JSL   L073B05
         LDA   #$0005
         CMP   $DD
         BEQ   L1905D8
         BRL   L1906BD
L1905D8  PEI   $E3
         PEI   $E1
         PEA   $0009
         JSL   L072E4C
         PEI   $E3
         PEI   $E1
         PEA   $0019
         JSL   L072E4C
         PEI   $E3
         PEI   $E1
         PEA   $0001
         PEA   $0000
         PEA   $FFF1
         PEA   $0000
         PHD
         JSL   L190176
         PEI   $E3
         PEI   $E1
         PEA   $0002
         PEA   $0000
         PEA   $FFF1
         PEA   $0000
         PHD
         JSL   L190176
         LDA   #$000A
         STA   $DB
L19061D  PEI   $E3
         PEI   $E1
         PEI   $DB
         PEA   $0000
         PEA   $FFF1
         PEA   $0000
         PHD
         JSL   L190176
         LDA   #$000D
         CMP   $DB
         BEQ   L19063C
         INC   $DB
         BRA   L19061D
L19063C  LDA   #$0010
         CLC
         ADC   $E1
         LDX   $E3
         BCC   L190647
         INX
L190647  TXY
         LDX   #$FE75
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L190660
         INX
L190660  STA   $EF
         STX   $F1
         LDA   [$EF]
         PHA
         LDX   #$FE75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L190677
         INX
L190677  STA   $EF
         STX   $F1
         PLA
         SEC
         SBC   [$EF]
         STA   $C1
         LDX   #$FE75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L190691
         INX
L190691  STA   $EF
         STX   $F1
         LDA   [$EF]
         PHA
         LDX   #$FE75
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $EF
         STX   $F1
         PLA
         SEC
         SBC   [$EF]
         SEC
         SBC   #$000F
         STA   $BF
         PEI   $C1
         PEI   $BF
         PEI   $E3
         PEI   $E1
         JSL   L151035
L1906BD  PEI   $E3
         PEI   $E1
         JSL   L15102F
         PEI   $E3
         PEI   $E1
         JSL   L151131
         PEA   $0000
         PHD
         JSL   L190120
L1906D5  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $DB
         LDA   $DB
         SEC
         SBC   #$FFFE
         BVS   L1906EF
         BPL   L1906ED
         BRL   L1907F1
L1906ED  BRA   L1906F4
L1906EF  BMI   L1906F4
         BRL   L1907F1
L1906F4  CMP   #$001C
         BMI   L1906FC
         BRL   L1907F1
L1906FC  SEC
         SBC   #$0000
         BEQ   L190728
         SEC
         SBC   #$000D
         BNE   L19070B
         BRL   L19079E
L19070B  SEC
         SBC   #$0009
         BVS   L190718
         BPL   L190716
         BRL   L1907F1
L190716  BRA   L19071D
L190718  BMI   L19071D
         BRL   L1907F1
L19071D  CMP   #$0006
         BCS   L190725
         BRL   L1907BC
L190725  BRL   L1907F1
L190728  PEI   $E3
         PEI   $E1
         JSL   L1506B3
         PEI   $E3
         PEI   $E1
         JSL   L1517CD
         LDA   $DD
         LDX   #$FE73
         STA   $00,X
         LDX   #$FE73
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L19074D
         EOR   #$8000
L19074D  BPL   L19078C
         LDA   #$0001
         STA   $DB
L190754  PEI   $DB
         PEA   $0000
         PHD
         JSL   L190000
         LDA   #$0007
         CLC
         ADC   $DB
         PHA
         LDA   $DB
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L041CB3
         LDX   #^L041CB3
         BCC   L190779
         INX
L190779  PHX
         PHA
         JSL   L150306
         LDA   $DB
         LDX   #$FE73
         CMP   $00,X
         BEQ   L19078C
         INC   $DB
         BRA   L190754
L19078C  PEA   $0000
         PHD
         JSL   L190094
         PEI   $E3
         PEI   $E1
         JSL   L1506AD
         BRA   L1907F1
L19079E  LDA   $F8
         BEQ   L1907BA
         PHY
         PEI   $E3
         PEI   $E1
         PEA   $000B
         JSL   L072B6B
         PLA
         DEC
         STA   $E7
         PEA   $0000
         PHD
         JSL   L190120
L1907BA  BRA   L1907F1
L1907BC  LDA   $F8
         BEQ   L1907EF
         LDA   $DB
         SEC
         SBC   #$0013
         STA   $D5
         PEA   $0000
         PHD
         JSL   L190094
         LDA   $E7
         BNE   L1907E7
         LDA   #$0001
         STA   $E7
         PEA   $0002
         PEI   $E3
         PEI   $E1
         PEA   $000B
         JSL   L073B05
L1907E7  PEA   $0000
         PHD
         JSL   L190120
L1907EF  BRA   L1907F1
L1907F1  LDX   #$0000
         LDA   $DB
         DEC
         BNE   L1907FA
         INX
L1907FA  PHX
         LDX   #$0000
         LDA   $DB
         DEC
         DEC
         BNE   L190805
         INX
L190805  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L19080F
         BRL   L1906D5
L19080F  LDX   #$0000
         LDA   $DB
         DEC
         BNE   L190818
         INX
L190818  TXA
         AND   $F8
         BNE   L190820
         BRL   L1908E8
L190820  LDX   #$0000
         LDA   $E7
         CMP   $E5
         BEQ   L19082A
         INX
L19082A  PHX
         LDX   #$0000
         LDA   $D5
         CMP   $D7
         BEQ   L190835
         INX
L190835  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L19083F
         BRL   L1908E8
L19083F  LDA   $FA
         DEC
         BPL   L190847
         BRL   L1908E8
L190847  CMP   #$0003
         BMI   L19084F
         BRL   L1908E8
L19084F  SEC
         SBC   #$0000
         BEQ   L19085E
         DEC
         BEQ   L190888
         DEC
         BEQ   L1908B2
         BRL   L1908E8
L19085E  PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEI   $E7
         LDA   $D5
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L041CB3
         LDX   #^L041CB3
         BCC   L19087D
         INX
L19087D  PHX
         PHA
         JSL   L07CD77
         PLA
         STA   $BD
         BRA   L1908E8
L190888  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEI   $E7
         LDA   $D5
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L041CB3
         LDX   #^L041CB3
         BCC   L1908A7
         INX
L1908A7  PHX
         PHA
         JSL   L07CD77
         PLA
         STA   $BD
         BRA   L1908E8
L1908B2  LDA   $E5
         CMP   $E7
         BEQ   L1908C3
         LDA   #$1000
         EORL  L053AE9
         STAL  L053AE9
L1908C3  PEA   ^L053AFD
         PEA   L053AFD
         LDA   $D5
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L041CB3
         LDX   #^L041CB3
         BCC   L1908DD
         INX
L1908DD  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
         BRA   L1908E8
L1908E8  JSL   L083E9E
         PEA   $000D
         PEA   $00BE
         PEA   $0000
         JSL   L08736A
         PEI   $E3
         PEI   $E1
         JSL   L072634
         PEI   $E9
         JSL   L0724F7
         PEI   $ED
         PEI   $EB
         JSL   L151131
         JSL   L09AFB1
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0486
         TCS
         RTL

L190925  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $14
         PEI   $12
         JSL   L150801
         LDA   #$002D
         CLC
         ADC   $0E
         LDX   $10
         BCC   L190940
         INX
L190940  STA   $01
         STX   $03
         LDA   #$0002
         CLC
         ADC   $12
         LDX   $14
         BCC   L19094F
         INX
L19094F  STA   $05
         STX   $07
         PHY
         LDY   #$0002
         LDA   [$12],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         PHA
         LDY   #$0039
         LDA   [$0E],Y
         PHA
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PEA   $0007
         JSL   L071A1B
         PLA
         STA   [$05]
         LDA   $12
         LDX   $14
         STA   $05
         STX   $07
         PHY
         LDA   [$12]
         SEC
         SBC   [$01]
         PHA
         LDY   #$003B
         LDA   [$0E],Y
         PHA
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PEA   $0007
         JSL   L071A1B
         PLA
         STA   [$05]
         LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1909B5  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   #$0005
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L1909C8
         INX
L1909C8  PHX
         PHA
         LDA   $10
         ASL
         PHA
         LDA   $12
         LSR
         LSR
         STA   $03
         PLA
         CLC
         ADC   $03
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $03
         STX   $05
         LDA   [$03]
         STA   $01
         PEI   $01
         PEA   $0008
         JSL   L1506B9
         PLA
         STA   $01
         PEI   $01
         PEA   $0003
         LDA   #$0003
         AND   $12
         STA   $03
         PLA
         SEC
         SBC   $03
         ASL
         ASL
         PHA
         JSL   L1510EF
         PLA
         STA   $01
         LDA   #$000F
         AND   $01
         STA   $14
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L190A35  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $18
         ASL
         PHA
         LDA   $1A
         LSR
         LSR
         STA   $09
         PLA
         CLC
         ADC   $09
         STA   $05
         LDA   #$0FFF
         STA   $07
         PEI   $16
         PEA   $000C
         JSL   L1505F2
         PLA
         STA   $16
         LDA   #$0003
         AND   $1A
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L190A70
         EOR   #$8000
L190A70  BPL   L190A9C
         LDA   #$0001
         STA   $03
L190A77  PEI   $07
         PEA   $0004
         JSL   L1510EF
         PLA
         ORA   #$F000
         STA   $07
         PEI   $16
         PEA   $0004
         JSL   L1510EF
         PLA
         STA   $16
         LDA   $03
         CMP   $01
         BEQ   L190A9C
         INC   $03
         BRA   L190A77
L190A9C  PEI   $07
         PEA   $0008
         JSL   L1506B9
         PLA
         STA   $07
         PEI   $16
         PEA   $0008
         JSL   L1506B9
         PLA
         STA   $16
         LDA   #$0005
         CLC
         ADC   $12
         LDX   $14
         BCC   L190ABF
         INX
L190ABF  PHX
         PHA
         LDA   $05
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   #$0005
         CLC
         ADC   $12
         LDX   $14
         BCC   L190AE6
         INX
L190AE6  PHX
         PHA
         LDA   $05
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $09
         STX   $0B
         LDA   $07
         AND   [$09]
         ORA   $16
         PLX
         STX   $09
         PLX
         STX   $0B
         STA   [$09]
         LDA   $10
         STA   $1A
         LDA   $0F
         STA   $19
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L190B24  PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         PHY
         PEI   $1E
         PEI   $1C
         PEA   $0000
         PEI   $18
         JSL   L1909B5
         PLA
         STA   $0D
         LDA   #$002D
         CLC
         ADC   $18
         LDX   $1A
         BCC   L190B48
         INX
L190B48  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDY   #$0039
         LDA   [$18],Y
         PEI   $1E
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         PHA
         LDA   [$01]
         PHA
         LDY   #$003B
         LDA   [$18],Y
         PEI   $1C
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         PHA
         LDY   #$0002
         LDA   [$01],Y
         INC
         INC
         PHA
         LDY   #$0039
         LDA   [$18],Y
         PHA
         LDA   $1E
         INC
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         PHA
         LDA   [$01]
         INC
         PHA
         LDY   #$003B
         LDA   [$18],Y
         PHA
         LDA   $1C
         INC
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $FFFF
         PHY
         PEI   $0D
         JSL   L081A92
         JSL   L1501B5
         LDA   #$0025
         CLC
         ADC   $18
         LDX   $1A
         BCC   L190BD8
         INX
L190BD8  PHX
         PHA
         LDA   #$0005
         CLC
         ADC   $18
         LDX   $1A
         BCC   L190BE5
         INX
L190BE5  PHX
         PHA
         JSL   L1517EB
         LDA   $16
         STA   $1E
         LDA   $15
         STA   $1D
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L190BFD  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDA   #$002D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L190C10
         INX
L190C10  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         STA   $09
         LDA   [$01]
         STA   $07
         LDY   #$0002
         LDA   [$01],Y
         LDY   #$0039
         CLC
         ADC   [$1E],Y
         INC
         INC
         STA   $0D
         LDY   #$003B
         LDA   [$1E],Y
         CLC
         ADC   [$01]
         INC
         STA   $0B
         STZ   $0F
L190C3B  STZ   $11
L190C3D  PHY
         PEI   $0F
         PEI   $11
         PEA   $0000
         PEI   $1E
         JSL   L1909B5
         PLA
         STA   $05
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $FFFF
         PHY
         PEI   $05
         JSL   L081A92
         JSL   L1501B5
         LDY   #$003B
         LDA   [$1E],Y
         CLC
         ADC   $07
         STA   $07
         LDY   #$003B
         LDA   [$1E],Y
         CLC
         ADC   $0B
         STA   $0B
         LDA   #$0007
         CMP   $11
         BEQ   L190C84
         INC   $11
         BRA   L190C3D
L190C84  LDY   #$002D
         LDA   [$1E],Y
         STA   $07
         LDY   #$003B
         LDA   [$1E],Y
         CLC
         ADC   $07
         INC
         STA   $0B
         LDY   #$0039
         LDA   [$1E],Y
         CLC
         ADC   $09
         STA   $09
         LDY   #$0039
         LDA   [$1E],Y
         CLC
         ADC   $0D
         STA   $0D
         LDA   #$0007
         CMP   $0F
         BEQ   L190CB5
         INC   $0F
         BRA   L190C3B
L190CB5  LDA   #$0025
         CLC
         ADC   $1E
         LDX   $20
         BCC   L190CC0
         INX
L190CC0  PHX
         PHA
         LDA   #$0005
         CLC
         ADC   $1E
         LDX   $20
         BCC   L190CCD
         INX
L190CCD  PHX
         PHA
         JSL   L1517EB
         LDA   $1C
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

L190CE5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA8
         TCS
         TCD
         LDA   L0550B5
         SEC
         SBC   #$0010
         BEQ   L190CFD
         BVS   L190CFB
         EOR   #$8000
L190CFB  BMI   L190D10
L190CFD  LDA   L055153
         INC
         PHA
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L1901D8
         BRL   L191032
L190D10  LDA   L055051
         BEQ   L190D1C
         JSL   L0903A6
         BRL   L191032
L190D1C  PHY
         PHY
         JSL   L150493
         PLA
         STA   $51
         PLX
         STX   $53
         PHY
         JSL   L0727BF
         PLA
         STA   $4F
         PHY
         PHY
         PEA   $044C
         JSL   L072834
         PLA
         STA   $4B
         PLX
         STX   $4D
         LDA   $4B
         LDX   $4D
         STA   $01
         STX   $03
         LDY   #$00A0
         LDA   #$8000
         ORA   [$01],Y
         LDY   #$00A0
         STA   [$01],Y
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         LDA   L0550B5
         SEC
         SBC   #$0010
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L053C9D
         LDX   #^L053C9D
         BCC   L190D76
         INX
L190D76  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
         STZ   $37
         PEI   $37
         PEI   $4D
         PEI   $4B
         PEA   $0005
         JSL   L073B05
         PEI   $4D
         PEI   $4B
         PEA   $0006
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L072B17
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         LDA   $33
         SEC
         SBC   $2F
         DEC
         DEC
         PHA
         PEA   $0008
         JSL   L1500F5
         PLX
         PLX
         STA   $39
         LDA   $31
         SEC
         SBC   $2D
         DEC
         PHA
         PEA   $0008
         JSL   L1500F5
         PLX
         PLX
         STA   $3B
         PEI   $4D
         PEI   $4B
         PEA   $0007
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         JSL   L072B17
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0004
         PEA   $0002
         JSL   L151005
         PEI   $4D
         PEI   $4B
         JSL   L15102F
         PEI   $4D
         PEI   $4B
         JSL   L151131
L190E11  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $49
         LDA   $49
         SEC
         SBC   #$FFFE
         BVS   L190E2B
         BPL   L190E29
         BRL   L190FAF
L190E29  BRA   L190E30
L190E2B  BMI   L190E30
         BRL   L190FAF
L190E30  CMP   #$0009
         BMI   L190E38
         BRL   L190FAF
L190E38  SEC
         SBC   #$0000
         BEQ   L190E56
         SEC
         SBC   #$0005
         BEQ   L190E84
         DEC
         BEQ   L190EBA
         DEC
         BNE   L190E4D
         BRL   L190EF7
L190E4D  DEC
         BNE   L190E53
         BRL   L190F09
L190E53  BRL   L190FAF
L190E56  PEI   $4D
         PEI   $4B
         JSL   L1506B3
         PEI   $4D
         PEI   $4B
         JSL   L1517CD
         PEI   $4D
         PEI   $4B
         PEA   $0005
         JSL   L070834
         PEA   $0000
         PHD
         JSL   L190BFD
         PEI   $4D
         PEI   $4B
         JSL   L1506AD
         BRL   L190FAF
L190E84  PHY
         PEI   $37
         JSL   L081A92
         PLA
         STA   $05
         LDA   #$0001
         STA   $45
L190E93  TDC
         CLC
         ADC   #$0005
         STA   $55
         STZ   $57
         LDA   $45
         ASL
         TAY
         LDA   $05
         STA   [$55],Y
         LDA   #$000F
         CMP   $45
         BEQ   L190EAF
         INC   $45
         BRA   L190E93
L190EAF  PEA   $0000
         PHD
         JSL   L190BFD
         BRL   L190FAF
L190EBA  STZ   $45
L190EBC  STZ   $47
L190EBE  LDA   $47
         CLC
         ADC   $45
         AND   #$0001
         BEQ   L190ED6
         PEI   $45
         PEI   $47
         PEI   $37
         PEA   $0000
         PHD
         JSL   L190A35
L190ED6  LDA   #$0007
         CMP   $47
         BEQ   L190EE1
         INC   $47
         BRA   L190EBE
L190EE1  LDA   #$0007
         CMP   $45
         BEQ   L190EEC
         INC   $45
         BRA   L190EBC
L190EEC  PEA   $0000
         PHD
         JSL   L190BFD
         BRL   L190FAF
L190EF7  PHY
         PEI   $4D
         PEI   $4B
         PEA   $0005
         JSL   L090696
         PLA
         STA   $37
         BRL   L190FAF
L190F09  TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L190925
         PHY
         PEI   $3F
         PEI   $3D
         PEA   $0000
         PHD
         JSL   L1909B5
         PLA
         CMP   $37
         BNE   L190F33
         LDA   #$000F
         STA   $35
         BRA   L190F37
L190F33  LDA   $37
         STA   $35
L190F37  PEI   $3F
         PEI   $3D
         PEI   $35
         PEA   $0000
         PHD
         JSL   L190A35
         PEI   $3F
         PEI   $3D
         PEA   $0000
         PHD
         JSL   L190B24
L190F51  TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L190925
         PHY
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCS   L190F9F
         PEI   $43
         PEI   $41
         PEI   $35
         PEA   $0000
         PHD
         JSL   L190A35
         PEI   $43
         PEI   $41
         PEA   $0000
         PHD
         JSL   L190B24
         LDA   $41
         LDX   $43
         STA   $3D
         STX   $3F
L190F9F  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L190F51
         BRA   L190FAF
L190FAF  LDX   #$0000
         LDA   $49
         DEC
         BNE   L190FB8
         INX
L190FB8  PHX
         LDX   #$0000
         LDA   $49
         DEC
         DEC
         BNE   L190FC3
         INX
L190FC3  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L190FCD
         BRL   L190E11
L190FCD  PEI   $4D
         PEI   $4B
         JSL   L072634
         PEI   $4F
         JSL   L0724F7
         PEI   $53
         PEI   $51
         JSL   L151131
         LDA   $49
         DEC
         BNE   L191032
         PEA   ^L052D12
         PEA   L052D12
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   L0550B5
         SEC
         SBC   #$0010
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L053C9D
         LDX   #^L053C9D
         BCC   L191017
         INX
L191017  PHX
         PHA
         PEA   ^L052D12
         PEA   L052D12
         PEA   $0020
         JSL   L0313BE
         LDA   #$0001
         STA   L05504D
         LDA   #$0001
         STA   L05512F
L191032  TSC
         CLC
         ADC   #$0058
         TCS
         PLD
         RTL

L19103A  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   #$004D
         CLC
         ADC   $12
         LDX   $14
         BCC   L191055
         INX
L191055  PHX
         PHA
         JSL   L150371
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         LDY   #$0089
         CMP   [$12],Y
         BNE   L191070
         BRL   L1910F1
L191070  LDY   #$0005
         LDA   [$01],Y
         LDY   #$0089
         STA   [$12],Y
         PEA   $0000
         PEI   $12
         JSL   L191725
         LDY   #$00B7
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         LDA   $12
         LDX   $14
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         PHX
         PHA
         JSL   L1500EF
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   $12
         LDX   $14
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         PHX
         PHA
         JSL   L150371
         PLA
         STA   $05
         PLX
         STX   $07
         PEI   $07
         PEI   $05
         LDA   $12
         LDX   $14
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         PHX
         PHA
         JSL   L15146C
         PEA   $0000
         PEI   $12
         JSL   L191AD7
         PEA   $0001
         PEA   $0000
         PEI   $12
         JSL   L191439
L1910F1  LDA   $10
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

L191103  PHD
         TSC
         CLC
         ADC   #$FEEE
         TCS
         ADC   #$001F
         TCD
         LDY   #$00C3
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$00D3
         LDA   [$F8],Y
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L071169
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L071DE3
         PLA
         PLX
         STA   $EB
         LDA   #$0089
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L19114A
         INX
L19114A  CLC
         ADC   #$0003
         BCC   L191151
         INX
L191151  STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         CMP   $EB
         BNE   L191161
         BRL   L1912E1
L191161  LDA   $EB
         BEQ   L191168
         LDA   #$0001
L191168  PHA
         LDA   $EB
         SEC
         SBC   #$0050
         BEQ   L19117D
         BVS   L191176
         EOR   #$8000
L191176  BPL   L19117D
         LDA   #$0000
         BRA   L191180
L19117D  LDA   #$0001
L191180  AND   $01,S
         PLX
         LSR
         BCS   L191189
         BRL   L1912E1
L191189  LDA   #$0089
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L191194
         INX
L191194  CLC
         ADC   #$0003
         BCC   L19119B
         INX
L19119B  STA   $EF
         STX   $F1
         LDA   $EB
         SEP   #$20
         STA   [$EF]
         REP   #$20
         LDY   #$008B
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0000
         PEI   $F8
         JSL   L19162A
         LDA   #$0089
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L1911C6
         INX
L1911C6  CLC
         ADC   #$0003
         BCC   L1911CD
         INX
L1911CD  STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         STA   $EB
         LDY   #$0087
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0000
         PEI   $F8
         JSL   L19162A
         LDA   $F8
         LDX   $FA
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         CLC
         ADC   #$0008
         BCC   L191201
         INX
L191201  STA   $EF
         STX   $F1
         LDA   [$EF]
         LDX   #$FFE1
         STA   $00,X
         LDX   #$FFE1
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L19121A
         EOR   #$8000
L19121A  BMI   L19121F
         BRL   L1912C7
L19121F  LDA   #$0001
         STA   $ED
L191224  LDY   #$009F
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         LDA   $ED
         DEC
         PEA   $0007
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191250
         DEX
L191250  JSL   L150F53
         STA   $E7
         STX   $E9
         LDA   $E7
         LDX   $E9
         TXY
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
         ADC   #$0005
         BCC   L191275
         INX
L191275  STA   $EF
         STX   $F1
         LDA   $EB
         CMP   [$EF]
         BNE   L19129D
         LDX   #$FFE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L19128F
         INX
L19128F  STA   $EF
         STX   $F1
         SEP   #$20
         LDA   #$80
         STA   [$EF]
         REP   #$20
         BRA   L1912B9
L19129D  LDX   #$FFE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L1912AD
         INX
L1912AD  STA   $EF
         STX   $F1
         SEP   #$20
         LDA   #$00
         STA   [$EF]
         REP   #$20
L1912B9  LDA   $ED
         LDX   #$FFE1
         CMP   $00,X
         BEQ   L1912C7
         INC   $ED
         BRL   L191224
L1912C7  PEA   $0000
         PEA   $0000
         LDA   $F8
         LDX   $FA
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         PHX
         PHA
         JSL   L1505A4
L1912E1  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0118
         TCS
         RTL

L1912F3  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDA   #$008D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L191316
         INX
L191316  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         LDA   #$0014
         CLC
         ADC   $0B
         STA   $0F
         STZ   $13
L19135C  LDY   #$00DD
         LDA   [$1E],Y
         CMP   $13
         BNE   L191382
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $13
         STA   $11
L191382  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEI   $13
         JSL   L081A92
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0012
         PEA   $0000
         JSL   L1501AF
         LDA   #$000F
         CMP   $13
         BEQ   L1913B7
         INC   $13
         BRA   L19135C
L1913B7  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $FFFF
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEI   $11
         JSL   L081A92
         JSL   L1501B5
         PEA   $0000
         JSL   L081DD8
         LDA   $1C
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

L191439  PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         LDY   #$008B
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $15
         STX   $17
         SEP   #$20
         STZ   $17
         REP   #$20
         PEI   $17
         PEI   $15
         PEA   $0000
         PEI   $3C
         JSL   L19162A
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150178
         STZ   $2D
         LDA   $1B
         SEC
         SBC   #$0002
         BVS   L19147C
         EOR   #$8000
L19147C  BMI   L1914B4
         LDY   #$00E7
         LDA   #$FFFB
         AND   [$3C],Y
         LDY   #$00E7
         STA   [$3C],Y
         LDA   #$0089
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L191496
         INX
L191496  CLC
         ADC   #$0002
         BCC   L19149D
         INX
L19149D  STA   $33
         STX   $35
         LDY   #$00E7
         LDA   [$3C],Y
         AND   #$00FF
         SEP   #$20
         STA   [$33]
         REP   #$20
         LDA   #$00FF
         STA   $2D
L1914B4  LDY   #$008B
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0000
         PEI   $3C
         JSL   L19162A
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150178
         LDA   $1B
         CLC
         ADC   $19
         CLC
         ADC   $1F
         STA   $2F
         LDA   $40
         BEQ   L1914EA
         LDA   $2F
         LDY   #$00D9
         STA   [$3C],Y
L1914EA  LDY   #$00F4
         LDA   [$3C],Y
         BEQ   L191500
         PHY
         LDY   #$00DD
         LDA   [$3C],Y
         PHA
         JSL   L081A92
         JSL   L1511E6
L191500  TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PHY
         PHY
         LDY   #$00C3
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0010
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L15123D
         LDA   $2F
         CLC
         ADC   $21
         STA   $33
         LDA   $25
         SEC
         SBC   $33
         STA   $31
         LDA   $31
         BMI   L191566
         BEQ   L191566
         LDA   $25
         SEC
         SBC   $31
         STA   $25
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEI   $31
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         JSL   L1501AF
L191566  PHY
         PHY
         PEA   $040F
         JSL   L0711EB
         PLA
         STA   $29
         PLX
         STX   $2B
         LDA   $29
         LDX   $2B
         INC
         BNE   L19157D
         INX
L19157D  PHX
         PHA
         LDA   #$00FF
         AND   [$29]
         PHA
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         LDY   #$00DB
         LDA   [$3C],Y
         PHA
         JSL   L15069B
         LDY   #$0087
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0000
         PEI   $3C
         JSL   L19162A
         PEA   $0000
         JSL   L1511E6
         PEI   $2D
         LDY   #$00C3
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0005
         JSL   L072E7C
         LDA   #$00FF
         CMP   $2D
         BNE   L1915E3
         PEA   $0000
         LDY   #$00C3
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0005
         JSL   L073B05
L1915E3  LDA   $40
         BEQ   L191618
         LDY   #$00F4
         LDA   [$3C],Y
         BNE   L191618
         LDY   #$00C3
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDY   #$00D9
         LDA   [$3C],Y
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L073A7B
L191618  LDA   $3A
         STA   $40
         LDA   $39
         STA   $3F
         LDA   $37
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L19162A  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$007F
         CLC
         ADC   $10
         LDX   $12
         BCC   L19163D
         INX
L19163D  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PHY
         PHY
         JSL   L150C3A
         PLA
         PLX
         JSL   L033477
         BEQ   L19166B
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDY   #$0004
         LDA   [$01],Y
         PHA
         JSL   L150BC4
L19166B  JSL   L151466
         PHY
         JSL   L073CDF
         PLA
         STA   $05
         PEI   $16
         PEI   $14
         PEA   $0000
         LDA   #$007F
         CLC
         ADC   $10
         LDX   $12
         BCC   L191689
         INX
L191689  PHX
         PHA
         JSL   L1510D7
         PEI   $05
         JSL   L0724F7
         LDA   #$007F
         CLC
         ADC   $10
         LDX   $12
         BCC   L1916A0
         INX
L1916A0  CLC
         ADC   #$0003
         BCC   L1916A7
         INX
L1916A7  STA   $07
         STX   $09
         LDA   #$00FF
         AND   [$07]
         PHA
         LDA   #$00FF
         AND   $17
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BEQ   L1916E2
         PEA   $0000
         PEI   $10
         JSL   L1916F4
         LDY   #$0087
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         PEA   $0000
         JSL   L151663
         PEA   $0000
         PEI   $10
         JSL   L191AD7
L1916E2  LDA   $0E
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

L1916F4  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L054FB3
         STA   $01
         LDA   #$0001
         STA   L054FB3
         PEA   $0035
         JSL   L0727E0
         LDA   $01
         STA   L054FB3
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

L191725  PHD
         TSC
         CLC
         ADC   #$FFB7
         TCS
         TCD
         LDY   #$008B
         LDA   [$4F],Y
         TAX
         DEY
         DEY
         LDA   [$4F],Y
         STA   $3E
         STX   $40
         SEP   #$20
         STZ   $40
         REP   #$20
         LDA   #$00DF
         CLC
         ADC   $4F
         LDX   $51
         BCC   L19174C
         INX
L19174C  STA   $46
         STX   $48
         PHY
         PEI   $40
         PEI   $3E
         PEA   $0012
         JSL   L1505E0
         PLA
         STA   [$46]
         LDA   #$00DF
         CLC
         ADC   $4F
         LDX   $51
         BCC   L19176A
         INX
L19176A  STA   $46
         STX   $48
         PHY
         LDY   #$00DF
         LDA   [$4F],Y
         PHA
         PEA   $0080
         JSL   L072FD5
         PLA
         STA   [$46]
         LDY   #$00DF
         LDA   [$4F],Y
         STA   $1F
         LDA   $1F
         SEC
         SBC   #$0001
         BVS   L191791
         EOR   #$8000
L191791  BMI   L191796
         BRL   L1918B9
L191796  LDA   #$0001
         STA   $44
L19179B  LDY   #$009F
         LDA   [$4F],Y
         TAX
         DEY
         DEY
         LDA   [$4F],Y
         STA   $46
         STX   $48
         LDY   #$0002
         LDA   [$46],Y
         TAX
         LDA   [$46]
         PHX
         PHA
         LDA   $44
         DEC
         PEA   $0007
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1917C7
         DEX
L1917C7  JSL   L150F53
         STA   $30
         STX   $32
         LDY   #$009F
         LDA   [$4F],Y
         TAX
         DEY
         DEY
         LDA   [$4F],Y
         STA   $46
         STX   $48
         LDY   #$0002
         LDA   [$46],Y
         TAX
         LDA   [$46]
         PHX
         PHA
         LDY   #$00DF
         LDA   [$4F],Y
         PEA   $0007
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1917FD
         DEX
L1917FD  JSL   L150F53
         PHX
         PHA
         LDA   $44
         DEC
         PEA   $0014
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191817
         DEX
L191817  JSL   L150F53
         STA   $34
         STX   $36
         PEI   $40
         PEI   $3E
         PEA   $0012
         PEI   $44
         TDC
         CLC
         ADC   #$0038
         PEA   $0000
         PHA
         JSL   L1510DD
         LDA   $30
         LDX   $32
         STA   $21
         STX   $23
         LDA   #$00FF
         AND   $3B
         LDY   #$0005
         STA   [$21],Y
         LDA   $34
         LDX   $36
         STA   [$21]
         TXA
         LDY   #$0002
         STA   [$21],Y
         PEI   $36
         PEI   $34
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDY   #$0005
         LDA   [$21],Y
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         LDY   #$0004
         SEP   #$20
         LDA   #$00
         STA   [$21],Y
         REP   #$20
         LDY   #$0005
         LDA   #$0089
         CLC
         ADC   $4F
         LDX   $51
         BCC   L19188F
         INX
L19188F  CLC
         ADC   #$0003
         BCC   L191896
         INX
L191896  STA   $46
         STX   $48
         LDA   #$00FF
         AND   [$46]
         CMP   [$21],Y
         BNE   L1918AE
         LDY   #$0004
         SEP   #$20
         LDA   #$80
         STA   [$21],Y
         REP   #$20
L1918AE  LDA   $44
         CMP   $1F
         BEQ   L1918B9
         INC   $44
         BRL   L19179B
L1918B9  LDA   $4F
         LDX   $51
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         STA   $1B
         STX   $1D
         LDY   #$00DF
         LDA   [$4F],Y
         LDY   #$0008
         STA   [$1B],Y
         LDY   #$009F
         LDA   [$4F],Y
         TAX
         DEY
         DEY
         LDA   [$4F],Y
         STA   $46
         STX   $48
         LDY   #$0002
         LDA   [$46],Y
         TAX
         LDA   [$46]
         LDY   #$001C
         STA   [$1B],Y
         INY
         INY
         TXA
         STA   [$1B],Y
         LDA   #$0000
         TAX
         LDY   #$00B5
         STA   [$4F],Y
         INY
         INY
         TXA
         STA   [$4F],Y
         LDY   #$00DF
         LDA   [$4F],Y
         SEC
         SBC   #$0001
         BNE   L191911
         BRL   L191A41
L191911  BVS   L191916
         EOR   #$8000
L191916  BMI   L19191B
         BRL   L191A41
L19191B  LDY   #$00DF
         LDA   [$4F],Y
         DEC
         STA   $15
         LDA   $15
         SEC
         SBC   #$0001
         BVS   L19192E
         EOR   #$8000
L19192E  BMI   L191933
         BRL   L191A41
L191933  LDA   #$0001
         STA   $44
L191938  LDA   $44
         INC
         STA   $19
         LDY   #$00DF
         LDA   [$4F],Y
         STA   $17
         LDA   $17
         SEC
         SBC   $19
         BVS   L19194E
         EOR   #$8000
L19194E  BMI   L191953
         BRL   L191A36
L191953  LDA   $19
         STA   $42
L191957  LDY   #$009F
         LDA   [$4F],Y
         TAX
         DEY
         DEY
         LDA   [$4F],Y
         STA   $46
         STX   $48
         LDY   #$0002
         LDA   [$46],Y
         TAX
         LDA   [$46]
         PHX
         PHA
         LDA   $44
         DEC
         PEA   $0007
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191983
         DEX
L191983  JSL   L150F53
         STA   $30
         STX   $32
         LDY   #$009F
         LDA   [$4F],Y
         TAX
         DEY
         DEY
         LDA   [$4F],Y
         STA   $46
         STX   $48
         LDY   #$0002
         LDA   [$46],Y
         TAX
         LDA   [$46]
         PHX
         PHA
         LDA   $42
         DEC
         PEA   $0007
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1919B7
         DEX
L1919B7  JSL   L150F53
         STA   $2C
         STX   $2E
         LDY   #$0005
         LDA   [$30],Y
         PHA
         LDY   #$0005
         LDA   [$2C],Y
         STA   $46
         PLA
         SEC
         SBC   $46
         BEQ   L191A2B
         BVS   L1919D7
         EOR   #$8000
L1919D7  BPL   L191A2B
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEI   $32
         PEI   $30
         PEA   $0007
         JSL   L0313BE
         PEI   $32
         PEI   $30
         PEI   $2E
         PEI   $2C
         PEA   $0007
         JSL   L0313BE
         PEI   $2E
         PEI   $2C
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0007
         JSL   L0313BE
         LDY   #$0004
         LDA   #$00FF
         AND   [$30],Y
         CMP   #$0080
         BNE   L191A2B
         LDA   $30
         LDX   $32
         LDY   #$00B5
         STA   [$4F],Y
         INY
         INY
         TXA
         STA   [$4F],Y
L191A2B  LDA   $42
         CMP   $17
         BEQ   L191A36
         INC   $42
         BRL   L191957
L191A36  LDA   $44
         CMP   $15
         BEQ   L191A41
         INC   $44
         BRL   L191938
L191A41  LDA   $4D
         STA   $51
         LDA   $4C
         STA   $50
         LDA   $4A
         TCD
         TSC
         CLC
         ADC   #$004F
         TCS
         RTL

L191A53  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDY   #$00E7
         LDA   $10
         EOR   [$0C],Y
         LDY   #$00E7
         STA   [$0C],Y
         LDA   #$0089
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L191A72
         INX
L191A72  CLC
         ADC   #$0002
         BCC   L191A79
         INX
L191A79  STA   $03
         STX   $05
         LDY   #$00E7
         LDA   [$0C],Y
         AND   #$00FF
         SEP   #$20
         STA   [$03]
         REP   #$20
         PHY
         LDY   #$00A7
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         JSL   L151313
         PLA
         BEQ   L191AA3
         LDA   #$0000
         BRA   L191AA6
L191AA3  LDA   #$0001
L191AA6  STA   $01
         PEI   $01
         LDY   #$00A7
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         JSL   L15130D
         PEA   $0001
         PEA   $0000
         PEI   $0C
         JSL   L191439
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

L191AD7  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   $12
         LDX   $14
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         PHX
         PHA
         JSL   L150371
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L191B4D
         LDY   #$009F
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDA   $12
         LDX   $14
         PEA   $0000
         PEA   $0025
         JSL   L150F53
         PHX
         PHA
         JSL   L15146C
         LDY   #$009F
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
L191B4D  LDA   $05
         LDX   $07
         STA   $01
         STX   $03
         LDA   #$0089
         CLC
         ADC   $12
         LDX   $14
         BCC   L191B60
         INX
L191B60  CLC
         ADC   #$0003
         BCC   L191B67
         INX
L191B67  STA   $09
         STX   $0B
         LDY   #$0005
         LDA   [$01],Y
         AND   #$00FF
         SEP   #$20
         STA   [$09]
         REP   #$20
         LDY   #$00C3
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         LDY   #$00D3
         LDA   [$12],Y
         PHA
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L073A7B
         LDY   #$00C3
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         LDY   #$00D3
         LDA   [$12],Y
         PHA
         PEA   $0000
         PEA   $0003
         JSL   L0739E4
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

L191BC5  ENT
         PHD
         TSC
         CLC
         ADC   #$FE14
         TCS
         ADC   #$00FF
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $C7
         PLX
         STX   $C9
         PHY
         PHY
         PEA   $2008
         JSL   L072834
         PLA
         STA   $C1
         PLX
         STX   $C3
         PHY
         JSL   L0727BF
         PLA
         STA   $C5
         PHY
         PHY
         JSL   L150C3A
         PLA
         STA   $85
         PLX
         STX   $87
         LDY   #$0002
         LDA   [$F8],Y
         TAX
         LDA   [$F8]
         STA   $89
         STX   $8B
         LDA   $89
         BNE   L191C13
         LDA   $85
         STA   $89
L191C13  LDA   #$00FF
         AND   $8C
         BNE   L191C30
         LDA   #$00FF
         AND   $88
         SEP   #$20
         STA   $8C
         REP   #$20
         LDA   #$00FF
         AND   $87
         SEP   #$20
         STA   $8B
         REP   #$20
L191C30  LDA   $F4
         BEQ   L191C3D
         LDY   #$0008
         LDA   [$F8],Y
         STA   $DD
         BRA   L191C3F
L191C3D  STZ   $DD
L191C3F  LDY   #$0004
         LDA   [$F8],Y
         STA   $DB
         LDA   #$00FF
         AND   $8B
         STA   $E7
         LDY   #$0006
         LDA   [$F8],Y
         STA   $D9
         LDA   $F4
         BEQ   L191C5F
         LDA   #$000A
         STA   $D3
         BRA   L191C64
L191C5F  LDA   #$0008
         STA   $D3
L191C64  PHY
         PEI   $F6
         JSL   L151633
         PLA
         STA   $E1
         LDA   $E1
         PEA   $0023
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191C81
         DEX
L191C81  STA   $CB
         STX   $CD
         PHY
         PHY
         PEI   $CD
         PEI   $CB
         LDA   L054FBD
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $A1
         PLX
         STX   $A3
         LDAL  L05565D
         BEQ   L191CB8
         PEA   $0000
         PHD
         JSL   L1916F4
         LDA   #$0002
         STA   $D7
         BRL   L1924F6
L191CB8  LDA   $E1
         LDX   #$FF15
         STA   $00,X
         LDX   #$FF15
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L191CCD
         EOR   #$8000
L191CCD  BMI   L191CD2
         BRL   L191DE6
L191CD2  LDA   #$0001
         STA   $E3
L191CD7  LDY   #$0002
         LDA   [$A1],Y
         PHA
         LDA   [$A1]
         PHA
         LDA   $E3
         DEC
         PEA   $0009
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191CF4
         DEX
L191CF4  JSL   L150F53
         STA   $BD
         STX   $BF
         LDY   #$0002
         LDA   [$A1],Y
         PHA
         LDA   [$A1]
         PHA
         LDA   $E1
         PEA   $0009
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191D18
         DEX
L191D18  JSL   L150F53
         PHX
         PHA
         LDA   $E3
         DEC
         PEA   $001A
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L191D32
         DEX
L191D32  JSL   L150F53
         STA   $B1
         STX   $B3
         LDA   $BD
         LDX   $BF
         TXY
         LDX   #$FF17
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF17
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0005
         BCC   L191D57
         INX
L191D57  STA   $E9
         STX   $EB
         PHY
         PEI   $F6
         PEI   $E3
         PEI   $B3
         PEI   $B1
         JSL   L150428
         PLA
         STA   [$E9]
         LDX   #$FF17
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $E9
         STX   $EB
         LDA   $B1
         LDX   $B3
         STA   [$E9]
         TXA
         LDY   #$0002
         STA   [$E9],Y
         LDX   #$FF17
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0005
         BCC   L191D94
         INX
L191D94  STA   $E9
         STX   $EB
         LDA   $89
         CMP   [$E9]
         BNE   L191DBC
         LDX   #$FF17
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L191DAE
         INX
L191DAE  STA   $E9
         STX   $EB
         SEP   #$20
         LDA   #$80
         STA   [$E9]
         REP   #$20
         BRA   L191DD8
L191DBC  LDX   #$FF17
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L191DCC
         INX
L191DCC  STA   $E9
         STX   $EB
         SEP   #$20
         LDA   #$00
         STA   [$E9]
         REP   #$20
L191DD8  LDA   $E3
         LDX   #$FF15
         CMP   $00,X
         BEQ   L191DE6
         INC   $E3
         BRL   L191CD7
L191DE6  TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0087
         PEA   $0007
         PEA   $0109
         PEA   $0045
         JSL   L15100B
         LDA   $E1
         STA   $55
         LDA   #$0006
         STA   $57
         LDA   #$0001
         STA   $5B
         LDA   #$0002
         STA   $59
         STZ   $61
         STZ   $63
         LDA   #$000A
         STA   $65
         LDA   #$0009
         STA   $67
         LDY   #$0002
         LDA   [$A1],Y
         TAX
         LDA   [$A1]
         STA   $69
         STX   $6B
         STZ   $6D
         STZ   $6F
         STZ   $71
         STZ   $73
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L15109B
         PHY
         PHY
         PEI   $C3
         PEI   $C1
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L1500E9
         PLA
         STA   $A9
         PLX
         STX   $AB
         LDA   #$0D80
         LDX   #$0000
         STA   $CB
         STX   $CD
         PHY
         PHY
         PEI   $CD
         PEI   $CB
         LDA   L054FBD
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $9D
         PLX
         STX   $9F
         LDAL  L05565D
         BEQ   L191E9D
         PEA   $0000
         PHD
         JSL   L1916F4
         LDA   #$0002
         STA   $D7
         BRL   L1924F6
L191E9D  TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0028
         JSL   L071EC5
         LDA   #$0007
         STA   $25
         LDA   #$012D
         STA   $27
         LDA   #$0045
         STA   $29
         LDA   #$0158
         STA   $2B
         LDA   #$0006
         STA   $2F
         LDA   $F4
         BEQ   L191ED7
         LDA   #$003B
         STA   $29
         LDA   #$0005
         STA   $2F
L191ED7  LDA   #$0002
         STA   $31
         LDA   #$0001
         STA   $33
         LDA   #$000A
         STA   $3D
         LDA   #$0007
         STA   $3F
         PEA   $0000
         PHD
         JSL   L191725
         PHY
         PHY
         PEI   $C3
         PEI   $C1
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         JSL   L1500E9
         PLA
         STA   $AD
         PLX
         STX   $AF
         LDA   $F4
         BMI   L191F5B
         CMP   #$0002
         BPL   L191F5B
         SEC
         SBC   #$0000
         BEQ   L191F20
         DEC
         BEQ   L191F43
         BRA   L191F5B
L191F20  PEI   $C3
         PEI   $C1
         PEA   $000C
         JSL   L073CFE
         PEI   $C3
         PEI   $C1
         PEA   $000D
         JSL   L073CFE
         PEI   $C3
         PEI   $C1
         PEA   $0009
         JSL   L073CFE
         BRA   L191F5B
L191F43  PEI   $C3
         PEI   $C1
         PEA   $000B
         JSL   L073CFE
         PEI   $C3
         PEI   $C1
         PEA   $000F
         JSL   L073CFE
         BRA   L191F5B
L191F5B  PEI   $C3
         PEI   $C1
         PEI   $D3
         JSL   L073CFE
         LDA   $DB
         INC
         INC
         PHA
         PEI   $C3
         PEI   $C1
         PEA   $000E
         JSL   L073B05
         LDA   #$0001
         AND   $E7
         PHA
         PEI   $C3
         PEI   $C1
         PEA   $0003
         JSL   L073B05
         LDA   #$0002
         AND   $E7
         PHA
         PEI   $C3
         PEI   $C1
         PEA   $0004
         JSL   L073B05
         LDA   #$0004
         AND   $E7
         PHA
         PEI   $C3
         PEI   $C1
         PEA   $0005
         JSL   L073B05
         LDA   #$0008
         AND   $E7
         PHA
         PEI   $C3
         PEI   $C1
         PEA   $0006
         JSL   L073B05
         LDA   #$0010
         AND   $E7
         PHA
         PEI   $C3
         PEI   $C1
         PEA   $0007
         JSL   L073B05
         LDA   $F2
         BNE   L191FDC
         PEA   $00FF
         PEI   $C3
         PEI   $C1
         PEA   $0001
         JSL   L072E7C
L191FDC  TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         PHY
         PHY
         PEI   $C3
         PEI   $C1
         PEA   $000F
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         PEI   $C3
         PEI   $C1
         JSL   L15102F
         PEI   $C3
         PEI   $C1
         JSL   L1511C8
         PEI   $C3
         PEI   $C1
         JSL   L151131
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   $85
         LDX   $87
         STA   $7F
         STX   $81
         PEI   $C3
         PEI   $C1
         PEI   $D3
         PEA   $0000
         TDC
         CLC
         ADC   #$FF01
         PHA
         LDA   #$00FF
         AND   $8C
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L073A7B
         PEI   $C3
         PEI   $C1
         PEI   $D3
         PEA   $0000
         PEA   $0003
         JSL   L0739E4
         PEI   $C3
         PEI   $C1
         PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF01
         PHA
         LDA   $D9
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L073A7B
         PEA   $0000
         PHD
         JSL   L191103
L19208B  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $D7
         LDAL  L0540AB
         TAX
         LDAL  L0540A9
         STA   $CF
         STX   $D1
         PHY
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEI   $D1
         PEI   $CF
         PEI   $C3
         PEI   $C1
         JSL   L150482
         PLA
         STA   $D5
         LDA   #$FFFD
         CMP   $D7
         BEQ   L1920C6
         BRL   L1921D1
L1920C6  LDA   #$007F
         ANDL  L0540A1
         STA   $D5
         LDA   $D5
         SEC
         SBC   #$0008
         BPL   L1920DA
         BRL   L192182
L1920DA  CMP   #$0078
         BMI   L1920E2
         BRL   L192182
L1920E2  SEC
         SBC   #$0000
         BNE   L1920EB
         BRL   L192174
L1920EB  DEC
         BEQ   L192110
         DEC
         BEQ   L19211F
         DEC
         BEQ   L19211F
         DEC
         DEC
         BEQ   L192148
         SEC
         SBC   #$0008
         BEQ   L192174
         DEC
         DEC
         DEC
         BEQ   L192174
         DEC
         DEC
         DEC
         BEQ   L192174
         SEC
         SBC   #$0064
         BEQ   L192174
         BRA   L192182
L192110  PHY
         PHY
         JSL   L150FE7
         PLA
         STA   $A5
         PLX
         STX   $A7
         BRL   L1921D1
L19211F  PHY
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         LDX   #$0000
         LDA   #$000B
         CMP   $D5
         BNE   L192134
         INX
L192134  PHX
         JSL   L072227
         PLA
         LSR
         BCC   L192145
         PEA   $0000
         PHD
         JSL   L19103A
L192145  BRL   L1921D1
L192148  LDA   #$2100
         ANDL  L0540AD
         BNE   L19215F
         PHY
         PEI   $C3
         PEI   $C1
         JSL   L072354
         PLA
         STA   $D7
         BRA   L192172
L19215F  PEA   $0000
         PHD
         JSL   L191103
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L191439
L192172  BRA   L1921D1
L192174  PHY
         PEI   $C3
         PEI   $C1
         JSL   L072354
         PLA
         STA   $D7
         BRA   L1921D1
L192182  LDA   $D5
         SEC
         SBC   #$0030
         BVS   L19218D
         EOR   #$8000
L19218D  BMI   L192194
         LDA   #$0000
         BRA   L192197
L192194  LDA   #$0001
L192197  PHA
         LDA   $D5
         SEC
         SBC   #$003A
         BVS   L1921A3
         EOR   #$8000
L1921A3  BPL   L1921AA
         LDA   #$0000
         BRA   L1921AD
L1921AA  LDA   #$0001
L1921AD  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$1000
         ANDL  L0540AD
         BNE   L1921BE
         INX
L1921BE  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1921D1
         PHY
         PEI   $C3
         PEI   $C1
         JSL   L072354
         PLA
         STA   $D7
L1921D1  LDA   $D7
         SEC
         SBC   #$FFFE
         BVS   L1921E0
         BPL   L1921DE
         BRL   L192472
L1921DE  BRA   L1921E5
L1921E0  BMI   L1921E5
         BRL   L192472
L1921E5  CMP   #$0012
         BMI   L1921ED
         BRL   L192472
L1921ED  SEC
         SBC   #$0000
         BEQ   L19222A
         SEC
         SBC   #$0003
         BEQ   L19225C
         DEC
         DEC
         BNE   L192200
         BRL   L192380
L192200  DEC
         BNE   L192206
         BRL   L19238E
L192206  DEC
         BNE   L19220C
         BRL   L19239C
L19220C  DEC
         BNE   L192212
         BRL   L1923AA
L192212  DEC
         BNE   L192218
         BRL   L1923B8
L192218  SEC
         SBC   #$0007
         BNE   L192221
         BRL   L1923C6
L192221  DEC
         BNE   L192227
         BRL   L1923E5
L192227  BRL   L192472
L19222A  PEI   $C3
         PEI   $C1
         JSL   L1506B3
         PEI   $C3
         PEI   $C1
         JSL   L1517CD
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L191439
         LDA   $F4
         BEQ   L192251
         PEA   $0000
         PHD
         JSL   L1912F3
L192251  PEI   $C3
         PEI   $C1
         JSL   L1506AD
         BRL   L1924CC
L19225C  LDA   $F2
         BNE   L192263
         BRL   L19237D
L192263  PEA   $0000
         PHD
         JSL   L191103
         PEI   $C3
         PEI   $C1
         PEI   $D3
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1B
         PHA
         JSL   L071169
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1B
         PHA
         JSL   L071DE3
         PLA
         PLX
         STA   $D5
         LDA   $D5
         SEC
         SBC   #$0050
         BEQ   L1922EB
         BVS   L19229E
         EOR   #$8000
L19229E  BPL   L1922EB
         PEA   $0C38
         JSL   L0727E0
         PEI   $C3
         PEI   $C1
         PEI   $D3
         PEA   $0000
         TDC
         CLC
         ADC   #$FF01
         PHA
         LDA   #$00FF
         AND   $8C
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L073A7B
         PEI   $C3
         PEI   $C1
         PEI   $D3
         PEA   $0000
         PEA   $0003
         JSL   L0739E4
         PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $23
         STZ   $D7
         BRA   L19230E
L1922EB  LDX   #$0000
         LDA   #$00FF
         AND   $8C
         CMP   $D5
         BEQ   L1922F8
         INX
L1922F8  PHX
         LDA   $D5
         BEQ   L192300
         LDA   #$0001
L192300  AND   $01,S
         PLX
         LSR
         BCC   L19230E
         LDA   $D5
         SEP   #$20
         STA   $8C
         REP   #$20
L19230E  LDA   $F4
         BNE   L192355
         PEI   $C3
         PEI   $C1
         PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1B
         PHA
         JSL   L071169
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1B
         PHA
         JSL   L071DE3
         PLA
         PLX
         STA   $D5
         LDX   #$0000
         LDA   $D9
         CMP   $D5
         BEQ   L192343
         INX
L192343  PHX
         LDA   $D5
         BEQ   L19234B
         LDA   #$0001
L19234B  AND   $01,S
         PLX
         LSR
         BCC   L192355
         LDA   $D5
         STA   $D9
L192355  LDA   $89
         LDX   $8B
         STA   $75
         STX   $77
         LDA   $DB
         STA   $79
         LDA   $D9
         STA   $7B
         LDA   $DD
         STA   $7D
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$0075
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
L19237D  BRL   L1924CC
L192380  PEA   $0001
         PEA   $0000
         PHD
         JSL   L191A53
         BRL   L1924CC
L19238E  PEA   $0002
         PEA   $0000
         PHD
         JSL   L191A53
         BRL   L1924CC
L19239C  PEA   $0004
         PEA   $0000
         PHD
         JSL   L191A53
         BRL   L1924CC
L1923AA  PEA   $0008
         PEA   $0000
         PHD
         JSL   L191A53
         BRL   L1924CC
L1923B8  PEA   $0010
         PEA   $0000
         PHD
         JSL   L191A53
         BRL   L1924CC
L1923C6  PHY
         PEI   $C3
         PEI   $C1
         PEA   $000E
         JSL   L072B6B
         PLA
         DEC
         DEC
         STA   $DB
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L191439
         BRL   L1924CC
L1923E5  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L150BE8
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $9B
         SEC
         SBC   #$0005
         STA   $9B
         LDA   $F4
         BEQ   L19241A
         LDA   #$0001
L19241A  PHA
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $E9
         PLA
         AND   $E9
         BEQ   L192470
         LDA   #$0005
         CLC
         ADC   $8F
         STA   $E9
         LDA   $D1
         SEC
         SBC   $E9
         PHA
         PEA   $0012
         JSL   L1500F5
         PLX
         PLX
         STA   $E3
         LDA   $DD
         CMP   $E3
         BEQ   L192470
         LDA   $E3
         STA   $DD
         PEA   $0000
         PHD
         JSL   L1912F3
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L191439
L192470  BRA   L1924CC
L192472  LDA   $A9
         LDX   $AB
         CMP   $A5
         BNE   L19247C
         CPX   $A7
L19247C  BNE   L192486
         PEA   $0000
         PHD
         JSL   L19103A
L192486  LDA   $AD
         LDX   $AF
         CMP   $A5
         BNE   L192490
         CPX   $A7
L192490  BNE   L1924CC
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         JSL   L150371
         PLA
         STA   $B9
         PLX
         STX   $BB
         LDY   #$0005
         LDA   #$00FF
         AND   $8C
         CMP   [$B9],Y
         BEQ   L1924CC
         PEA   $0000
         PHD
         JSL   L191AD7
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L191439
L1924CC  LDX   #$0000
         LDA   $D7
         DEC
         BNE   L1924D5
         INX
L1924D5  PHX
         LDX   #$0000
         LDA   $D7
         DEC
         DEC
         BNE   L1924E0
         INX
L1924E0  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L1924EA
         BRL   L19208B
L1924EA  PEI   $87
         PEI   $85
         PEA   $0000
         PHD
         JSL   L19162A
L1924F6  PEI   $C3
         PEI   $C1
         JSL   L072634
         PEI   $C5
         JSL   L0724F7
         PEI   $A3
         PEI   $A1
         JSL   L151053
         PEI   $9F
         PEI   $9D
         JSL   L151053
         PEI   $C9
         PEI   $C7
         JSL   L151131
         LDX   #$0000
         LDA   $D7
         DEC
         BNE   L192525
         INX
L192525  TXA
         AND   $F2
         STA   $FC
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$01F8
         TCS
         RTL

L19253C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         STZ   $4A
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEI   $48
         PEI   $46
         PEA   $002A
         JSL   L0313BE
         LDA   $2B
         STA   $07
         LDA   $2F
         SEP   #$20
         STA   $09
         REP   #$20
         LDA   $2D
         SEP   #$20
         STA   $0A
         REP   #$20
         LDA   $31
         STA   $0D
         LDA   $29
         STA   $0B
         PHY
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $44
         JSL   L191BC5
         PLA
         STA   $05
         LDA   $44
         AND   $05
         BEQ   L1925CB
         LDA   $46
         LDX   $48
         STA   $01
         STX   $03
         LDA   $07
         LDY   #$001A
         STA   [$01],Y
         LDA   #$00FF
         AND   $09
         LDY   #$001E
         STA   [$01],Y
         LDA   #$00FF
         AND   $0A
         LDY   #$001C
         STA   [$01],Y
         LDA   $0D
         LDY   #$0020
         STA   [$01],Y
         LDA   $0B
         LDY   #$0018
         STA   [$01],Y
         LDA   #$0001
         STA   $4A
L1925CB  LDA   $42
         STA   $48
         LDA   $41
         STA   $47
         LDA   $3F
         TCD
         TSC
         CLC
         ADC   #$0046
         TCS
         RTL

L1925DD  PHD
         TSC
         CLC
         ADC   #$FAE2
         TCS
         ADC   #$042B
         TCD
         LDY   #$00E5
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0007
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L072B17
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD5
         PHA
         PEA   $002C
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         STA   $E5
         LDY   #$00DD
         LDA   [$F8],Y
         INY
         INY
         ORA   [$F8],Y
         BNE   L19266F
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD5
         PHA
         PEA   $002D
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD5
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRL   L19280A
L19266F  PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD5
         PHA
         PEA   $8001
         LDY   #$00DF
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L070F7D
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFD5
         AND   $00,X
         BEQ   L1926D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         PEA   ^L040000
         PEA   L040000
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         PEA   ^L040003
         PEA   L040003
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD5
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L1926D9  PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDC1
         PHA
         LDY   #$00DF
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
         ADC   #$FFD5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD5
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PHY
         PEA   $8001
         LDY   #$00DF
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L150B88
         PLA
         STA   $E3
         LDAL  L05565D
         BEQ   L192742
         BRL   L19280A
L192742  PHY
         PEI   $E3
         JSL   L151065
         PLA
         STA   $E1
         LDAL  L05565D
         BEQ   L192755
         BRL   L19280A
L192755  PHY
         PHY
         PEI   $E1
         JSL   L075BF9
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDA   $DD
         ORA   $DF
         BNE   L19276C
         BRL   L19280A
L19276C  PEI   $DF
         PEI   $DD
         TDC
         CLC
         ADC   #$00D5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         JSL   L07869F
         LDA   $D9
         ORA   $DB
         BEQ   L1927DC
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD5
         PHA
         PEA   $002F
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FBD5
         PHA
         PEI   $DB
         PEI   $D9
         JSL   L072CD4
         PEA   ^L040005
         PEA   L040005
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD5
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L1927DC  PEI   $DF
         PEI   $DD
         JSL   L07185A
         PEI   $D7
         PEI   $D5
         JSL   L07185A
         PEI   $DB
         PEI   $D9
         JSL   L07185A
         LDX   #$0000
         LDA   L05503D
         CMP   $E3
         BEQ   L1927FF
         INX
L1927FF  TXA
         LDY   #$00F6
         AND   [$F8],Y
         LSR
         BCC   L19280A
         STZ   $E5
L19280A  PEA   $0000
         TDC
         CLC
         ADC   #$FED6
         PHA
         LDA   #$00FF
         LDX   #$FED5
         AND   $00,X
         PHA
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L15069B
         PEI   $E5
         LDY   #$00E5
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0008
         JSL   L072E7C
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0524
         TCS
         RTL

L192852  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDY   #$00DD
         LDA   [$16],Y
         INY
         INY
         ORA   [$16],Y
         BNE   L192868
         BRL   L192960
L192868  PEA   $0001
         LDY   #$00E5
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         PEA   $0004
         JSL   L072E7C
         PEA   ^L050000
         PEA   L050000
         JSL   L15123D
         PEA   ^L050000
         PEA   L050000
         JSL   L150FF9
         PHY
         PHY
         PEA   $8001
         LDY   #$00DF
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L15041C
         PLA
         STA   $09
         PLX
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $01
         STX   $03
         LDAL  L050006
         SEC
         SBCL  L050002
         PHA
         LDY   #$0006
         LDA   [$01],Y
         ASL
         STA   $0D
         PLA
         SEC
         SBC   $0D
         STA   $07
         LDAL  L050002
         PHA
         PHY
         PEI   $07
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         CLC
         ADC   $01,S
         PLX
         INC
         AND   #$FFFE
         INC
         STA   $07
         LDAL  L050004
         SEC
         SBCL  L050000
         LDY   #$0004
         SEC
         SBC   [$01],Y
         STA   $05
         LDAL  L050000
         PHA
         PHY
         PEI   $05
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $05
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         PEA   $F000
         PEI   $07
         PEI   $05
         JSL   L15047C
         PEA   $0002
         PEA   $8001
         LDY   #$00DF
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L1510BF
         LDY   #$00E5
         LDA   [$16],Y

*

         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0010
         BCC   L19294C
         INX
L19294C  PHX
         PHA
         JSL   L150FF9
L192952  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L192952
L192960  PEA   $0000
         LDY   #$00E5
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         PEA   $0004
         JSL   L072E7C
         JSL   L194742
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

L19298B  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDY   #$00F6
         LDA   [$1C],Y
         BNE   L19299D
         BRL   L192B72
L19299D  LDAL  L0540BB
         DEC
         DEC
         BNE   L1929FA
         PEA   $0001
         LDY   #$00E5
         LDA   [$1C],Y
         PHA
         DEY
         DEY
         LDA   [$1C],Y
         PHA
         PEA   $0001
         JSL   L072E7C
         PEA   $0000
         LDY   #$00E5
         LDA   [$1C],Y
         PHA
         DEY
         DEY
         LDA   [$1C],Y
         PHA
         PEA   $0001
         JSL   L072E7C
         LDA   #$0001
         LDY   #$00DB
         STA   [$1C],Y
         LDY   #$00FA
         LDA   [$1C],Y
         TAX
         DEY
         DEY
         LDA   [$1C],Y
         STA   $13
         STX   $15
         LDY   #$00DF
         LDA   [$1C],Y
         TAX
         DEY
         DEY
         LDA   [$1C],Y
         STA   [$13]
         TXA
         LDY   #$0002
         STA   [$13],Y
         BRL   L192B72
L1929FA  PHY
         PHY
         LDY   #$00E5
         LDA   [$1C],Y
         PHA
         DEY
         DEY
         LDA   [$1C],Y
         PHA
         PEA   $0000
         PEA   $0005
         JSL   L151367
         PLA
         STA   $01
         PLX
         STX   $03
L192A17  TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L150801
         LDA   $0F
         SEC
         SBCL  L050000
         BVS   L192A30
         EOR   #$8000
L192A30  BMI   L192A3F
         PEA   $0005
         PEI   $03
         PEI   $01
         JSL   L1947B2
         BRA   L192A5A
L192A3F  LDA   $0F
         SEC
         SBCL  L050004
         BEQ   L192A5A
         BVS   L192A4D
         EOR   #$8000
L192A4D  BPL   L192A5A
         PEA   $0006
         PEI   $03
         PEI   $01
         JSL   L1947B2
L192A5A  PHY
         PHY
         PEI   $11
         PEI   $0F
         PEA   ^L050000
         PEA   L050000
         JSL   L1505B6
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   $11
         SEC
         SBCL  L050002
         PHA
         PEA   $0044
         JSL   L1500F5
         PLX
         PLX
         STA   $0D
         LDA   $0F
         SEC
         SBCL  L050000
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         STA   $0B
         LDA   L05541D
         CLC
         ADC   $0B
         DEC
         STA   $0B
         LDA   $0B
         PEA   $0007
         JSL   L150BEE
         PLA
         CLC
         ADC   $0D
         INC
         STA   $09
         LDY   #$00E1
         LDA   [$1C],Y
         STA   $13
         LDA   $09
         SEC
         SBC   $13
         BEQ   L192AC6
         BVS   L192AC2
         EOR   #$8000
L192AC2  BPL   L192AC6
         STZ   $09
L192AC6  LDA   $09
         BEQ   L192B41
         LDY   #$00CD
         LDA   [$1C],Y
         TAX
         DEY
         DEY
         LDA   [$1C],Y
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         PHX
         PHA
         LDA   $09
         JSL   L150488
         TAY
         BNE   L192AEC
         DEX
L192AEC  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $05
         STX   $07
         LDY   #$00DF
         LDA   [$1C],Y
         TAX
         DEY
         DEY
         LDA   [$1C],Y
         CMP   $05
         BNE   L192B1F
         CPX   $07
L192B1F  BEQ   L192B41
         LDA   $05
         LDX   $07
         LDY   #$00DD
         STA   [$1C],Y
         INY
         INY
         TXA
         STA   [$1C],Y
         LDA   $09
         STA   L055417
         PEA   $0000
         PEI   $1C
         JSL   L1925DD
         JSL   L196454
L192B41  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L192B52
         BRL   L192A17
L192B52  LDY   #$00DD
         LDA   [$1C],Y
         INY
         INY
         ORA   [$1C],Y
         BEQ   L192B72
         PEA   $0000
         LDY   #$00E5
         LDA   [$1C],Y
         PHA
         DEY
         DEY
         LDA   [$1C],Y
         PHA
         PEA   $0004
         JSL   L072E7C
L192B72  LDA   $1A
         STA   $1E
         LDA   $19
         STA   $1D
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L192B84  PHD
         TSC
         CLC
         ADC   #$FD1E
         TCS
         ADC   #$01F1
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $E9
         PLX
         STX   $EB
         PHY
         PHY
         PEA   $1FA4
         JSL   L072834
         PLA
         STA   $E3
         PLX
         STX   $E5
         LDY   #$0002
         LDA   [$F8],Y
         TAX
         LDA   [$F8]
         STA   $DD
         STX   $DF
         LDA   L054FA1
         STA   $E7
L192BBB  PEA   $0006
         JSL   L0724F7
         PHY
         PHY
         PEA   $8001
         JSL   L150BAC
         PLA
         PLX
         STA   $E1
         PHY
         PHY
         LDA   $E1
         ASL
         ASL
         JSL   L150488
         PHX
         PHA
         LDA   L054FBF
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $CB
         PLX
         STX   $CD
         LDAL  L05565D
         BEQ   L192C07
         PEA   $0035
         JSL   L0727E0
         LDA   #$0002
         STA   $DB
         BRL   L1930F7
L192C07  PHY
         PEI   $E1
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         JSL   L07178B
         PLA
         STA   $E1
         LDA   $E1
         DEC
         PHA
         PEA   $0007
         JSL   L1500F5
         PLX
         PLX
         INC
         STA   L05541B
         LDA   L05541B
         PEA   $001C
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L192C3F
         DEX
L192C3F  STA   $D3
         STX   $D5
         PHY
         PHY
         LDA   $D3
         LDX   $D5
         PEA   $0000
         PEA   $0078
         JSL   L150D50
         LDA   L054FBF
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $CF
         PLX
         STX   $D1
         LDAL  L05565D
         BEQ   L192C87
         PEI   $CD
         PEI   $CB
         JSL   L07185A
         PEA   $0035
         JSL   L0727E0
         LDA   #$0002
         STA   $DB
         BRL   L1930F7
L192C87  TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L151424
         TDC
         CLC
         ADC   #$000F
         STA   L05541F
         STZ   L055421
         LDA   #$0080
         STA   $0F
         LDY   #$0002
         LDA   [$CF],Y
         TAX
         LDA   [$CF]
         STA   $11
         STX   $13
         LDA   #$0078
         STA   $15
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $01E0
         PEI   $D3
         JSL   L15100B
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $2D
         PEI   $2B
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L150126
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L15123D
         PEI   $E1
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         PEI   $DF
         PEI   $DD
         JSL   L070722
         PEA   $0002
         JSL   L150BD6
         PEA   $0004
         PEA   $0002
         JSL   L151083
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L150FF9
         PHY
         LDA   #$0007
         CLC
         ADC   L055417
         DEC
         PHA
         PEA   $0007
         JSL   L1500F5
         PLX
         PLX
         PHA
         LDA   L05541B
         DEC
         DEC
         DEC
         PHA
         JSL   L072FD5
         PLA
         STA   L05541D
         PHY
         LDA   L05541D
         PHA
         PEA   $0001
         JSL   L072FA6
         PLA
         STA   L05541D
         PHY
         PHY
         PEI   $E5
         PEI   $E3
         PEA   $0000
         PEA   $0005
         JSL   L151367
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDA   L05541B
         PHA
         PEA   $0004
         PEI   $D9
         PEI   $D7
         JSL   L1505EC
         LDA   L05541D
         DEC
         PHA
         PEI   $D9
         PEI   $D7
         JSL   L15130D
         PEA   ^L1947B2
         PEA   L1947B2
         PEI   $D9
         PEI   $D7
         JSL   L150D32
         PEI   $E5
         PEI   $E3
         PEA   $0006
         PEA   ^L050000
         PEA   L050000
         JSL   L072B17
         LDAL  L050000
         INC
         STAL  L050000
         LDA   #$0006
         CLC
         ADCL  L050002
         STAL  L050002
         LDA   #$0070
         CLC
         ADCL  L050000
         STAL  L050004
         LDA   #$01DC
         CLC
         ADCL  L050002
         STAL  L050006
         LDA   $DD
         ORA   $DF
         BNE   L192E01
         PEA   $00FF
         PEI   $E5
         PEI   $E3
         PEA   $0004
         JSL   L072E7C
L192E01  LDA   $F6
         BNE   L192E13
         PEA   $00FF
         PEI   $E5
         PEI   $E3
         PEA   $0003
         JSL   L072E7C
L192E13  PEI   $E5
         PEI   $E3
         JSL   L15102F
         PEA   $0004
         JSL   L0724F7
         PEI   $E5
         PEI   $E3
         JSL   L1511C8
         PEI   $E5
         PEI   $E3
         JSL   L151131
         LDA   #$FFFF
         STA   L055419
L192E38  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $DB
         LDA   $DB
         SEC
         SBC   #$FFFE
         BVS   L192E52
         BPL   L192E50
         BRL   L192F0A
L192E50  BRA   L192E57
L192E52  BMI   L192E57
         BRL   L192F0A
L192E57  CMP   #$0009
         BMI   L192E5F
         BRL   L192F0A
L192E5F  SEC
         SBC   #$0000
         BEQ   L192E7E
         SEC
         SBC   #$0003
         BEQ   L192EA4
         DEC
         DEC
         BEQ   L192EB6
         DEC
         BEQ   L192EC4
         DEC
         BEQ   L192ECE
         DEC
         BNE   L192E7B
         BRL   L192F00
L192E7B  BRL   L192F0A
L192E7E  PEI   $E5
         PEI   $E3
         JSL   L1506B3
         PEA   $0000
         PHD
         JSL   L1925DD
         PEI   $E5
         PEI   $E3
         JSL   L1517CD
         JSL   L194742
         PEI   $E5
         PEI   $E3
         JSL   L1506AD
         BRA   L192F0A
L192EA4  LDA   $F6
         BEQ   L192EB4
         LDA   $DD
         LDX   $DF
         STA   [$F8]
         TXA
         LDY   #$0002
         STA   [$F8],Y
L192EB4  BRA   L192F0A
L192EB6  LDA   #$0000
         TAX
         STA   [$F8]
         TXA
         LDY   #$0002
         STA   [$F8],Y
         BRA   L192F0A
L192EC4  PEA   $0000
         PHD
         JSL   L192852
         BRA   L192F0A
L192ECE  PHY
         PEI   $E5
         PEI   $E3
         PEA   $0005
         JSL   L072B6B
         PLA
         INC
         JSL   L150488
         STA   $D3
         STX   $D5
         PEI   $D5
         PEI   $D3
         LDA   L05541D
         JSL   L150488
         JSL   L033477
         BEQ   L192EFE
         LDA   $D3
         STA   L05541D
         JSL   L194742
L192EFE  BRA   L192F0A
L192F00  PEA   $0000
         PHD
         JSL   L19298B
         BRA   L192F0A
L192F0A  PEI   $DB
         PEA   ^L040007
         PEA   L040007
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFFE
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $0002
         JSL   L0313BE
         PEA   $0002
         JSL   L1511F2
         PLA
         LSR
         BCS   L192F36
         BRL   L192E38
L192F36  TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L150260
         PEI   $D1
         PEI   $CF
         JSL   L151053
         PEI   $CD
         PEI   $CB
         JSL   L151053
         LDA   #$0008
         CMP   $DB
         BEQ   L192F5D
         BRL   L1930E7
L192F5D  STZ   $B9
         STZ   $BB
         LDA   L05503D
         BNE   L192FE0
         PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L150BB8
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055043
         LDX   L055045
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         JSL   L150B82
         LDAL  L05565D
         BEQ   L192FAE
         BRL   L1930C9
L192FAE  PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         LDA   L055043
         LDX   L055045
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         JSL   L150B64
         PLA
         STA   L05503D
         LDAL  L05565D
         BEQ   L192FE0
         STZ   L05503D
         BRL   L1930C9
L192FE0  LDA   L05503D
         PHA
         JSL   L150B70
         PHY
         PHY
         PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L15041C
         PLA
         STA   $B9
         PLX
         STX   $BB
         LDAL  L05565D
         BEQ   L193008
         STZ   $B9
         STZ   $BB
         BRL   L1930C9
L193008  PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L150410
         LDAL  L05565D
         BEQ   L19301C
         BRL   L1930C9
L19301C  PHY
         PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L150D3E
         PLA
         STA   $BD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF0F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE0F
         PHA
         PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L070F7D
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         PEA   $FFFF
         PEA   $8001
         JSL   L150012
         PLA
         STA   $BF
         PLX
         STX   $C1
         PEI   $BB
         PEI   $B9
         PEI   $BD
         PEA   $8001
         PEI   $C1
         PEI   $BF
         JSL   L150422
         LDAL  L05565D
         BNE   L1930C9
         LDA   L05503D
         PHA
         JSL   L150B7C
         PEA   $8001
         PEI   $C1
         PEI   $BF
         PEA   $0000
         TDC
         CLC
         ADC   #$FF0F
         PHA
         JSL   L070BA8
         LDA   $BF
         LDX   $C1
         STA   $DD
         STX   $DF
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         LDA   #$0010
         CLC
         ADC   $E3
         LDX   $E5
         BCC   L1930B0
         INX
L1930B0  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         JSL   L150B34
         BRL   L192BBB
L1930C9  LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L07191C
         PEI   $BB
         PEI   $B9
         JSL   L07185A
         PEA   $003F
         JSL   L0727E0
         BRL   L192BBB
L1930E7  PEI   $E5
         PEI   $E3
         JSL   L072634
         PEI   $EB
         PEI   $E9
         JSL   L151131
L1930F7  PEI   $E7
         JSL   L0724F7
         JSL   L09AFB1
         LDX   #$0000
         LDA   $DB
         DEC
         DEC
         BEQ   L19310B
         INX
L19310B  TXA
         AND   $F6
         STA   $FC
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$02EA
         TCS
         RTL

L193122  PHD
         TSC
         CLC
         ADC   #$FFA2
         TCS
         TCD
         LDA   #$000D
         STA   $49
         LDY   #$004A
         LDA   [$64],Y
         SEC
         SBC   #$0005
         BVS   L19313D
         EOR   #$8000
L19313D  BPL   L193144
         LDA   #$000E
         STA   $49
L193144  LDY   #$003D
         LDA   [$64],Y
         PHA
         DEY
         DEY
         LDA   [$64],Y
         PHA
         PEI   $49
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         JSL   L072B17
         PHY
         LDA   $57
         CLC
         ADC   $53
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $51
         PHY
         LDA   $59
         CLC
         ADC   $55
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $4F
         PHY
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L19318C
         INX
L19318C  CLC
         ADC   #$0022
         BCC   L193193
         INX
L193193  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         PHA
         JSL   L081A92
         PLA
         STA   $45
         LDY   #$0033
         LDA   [$64],Y
         BEQ   L1931D8
         PHY
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1931B7
         INX
L1931B7  CLC
         ADC   #$0022
         BCC   L1931BE
         INX
L1931BE  CLC
         ADC   #$0001
         BCC   L1931C5
         INX
L1931C5  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         PHA
         JSL   L081A92
         PLA
         STA   $43
         BRA   L193205
L1931D8  PHY
         PEA   $000F
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1931E7
         INX
L1931E7  CLC
         ADC   #$0014
         BCC   L1931EE
         INX
L1931EE  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $5B
         PLA
         SEC
         SBC   $5B
         PHA
         JSL   L081A92
         PLA
         STA   $43
L193205  PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $3F
         PLX
         STX   $41
         PEI   $41
         PEI   $3F
         JSL   L1514A8
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L19324B
         INX
L19324B  CLC
         ADC   #$0010
         BCC   L193252
         INX
L193252  STA   $5B
         STX   $5D
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         STA   $4B
         STX   $4D
         LDY   #$0033
         LDA   [$64],Y
         STA   $47
         LDY   #$004A
         LDA   [$64],Y
         SEC
         SBC   #$0000
         BPL   L193277
         BRL   L193544
L193277  CMP   #$0007
         BMI   L19327F
         BRL   L193544
L19327F  ASL
         TAX
         LDAL  L193287,X
         PHA
         RTS

L193287  DA    L193295-1
         DA    L19332A-1
         DA    L19334D-1
         DA    L193374-1
         DA    L1933BC-1
         DA    L193435-1
         DA    L1934B1-1
         
L193295  LDA   $47
         BEQ   L1932BD
         PHY
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1932A5
         INX
L1932A5  CLC
         ADC   #$0014
         BCC   L1932AC
         INX
L1932AC  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         PHA
         JSL   L081A92
         PLA
         STA   $43
L1932BD  LDX   #$0000
         LDA   $4B
         ORA   $4D
         BNE   L1932C7
         INX
L1932C7  PHX
         LDA   $47
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1932DA
         LDA   #$3333
         STA   $45
         BRA   L1932DE
L1932DA  LDA   $43
         STA   $45
L1932DE  LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1932E9
         INX
L1932E9  CLC
         ADC   #$0014
         BCC   L1932F0
         INX
L1932F0  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         SEC
         SBC   #$0000
         BMI   L193314
         BEQ   L193314
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEI   $45
         PEI   $43
         JSL   L1501B5
         BRA   L193327
L193314  TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEA   $FFFF
         PEA   $FFFF
         JSL   L1501B5
L193327  BRL   L193544
L19332A  LDA   $47
         BEQ   L193334
         LDA   $43
         STA   $45
         BRA   L193339
L193334  LDA   #$3333
         STA   $45
L193339  TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEI   $45
         PEI   $43
         JSL   L1501B5
         BRL   L193544
L19334D  TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEI   $45
         PEI   $43
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         BRL   L193544
L193374  PEI   $43
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEA   $000F
         PEA   $0007
         JSL   L150FFF
         PEI   $45
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEA   $000F
         PEA   $0007
         JSL   L1517F1
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         BRL   L193544
L1933BC  PEI   $45
         JSL   L081DD8
         LDA   $53
         LDX   $55
         STA   $21
         STX   $23
         LDA   $59
         DEC
         DEC
         STA   $27
         LDA   $57
         DEC
         STA   $25
         LDA   #$0004
         CLC
         ADC   $23
         PHA
         PEI   $25
         JSL   L1510C5
         PEI   $27
         PEI   $25
         JSL   L1505DA
         PEI   $27
         LDA   $21
         INC
         INC
         PHA
         JSL   L1505DA
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEI   $45
         PEI   $43
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         BRL   L193544
L193435  LDA   $51
         SEC
         SBC   #$0004
         STA   $21
         LDA   #$0009
         CLC
         ADC   $21
         STA   $25
         LDA   $55
         INC
         INC
         INC
         STA   $23
         LDA   #$0018
         CLC
         ADC   $23
         STA   $27
         JSL   L150711
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEI   $45
         PEA   $FFFF
         JSL   L1501B5
         LDA   $47
         BEQ   L1934A4
         PEA   $0001
         PEA   $0001
         JSL   L151083
         PEI   $45
         JSL   L081DD8
         PEI   $23
         PEI   $21
         JSL   L1510C5
         PEA   $0017
         PEA   $0008
         JSL   L15056E
         PEA   $0000
         PEA   $FFF8
         JSL   L150635
         PEA   $FFE9
         PEA   $0008
         JSL   L15056E
L1934A4  JSL   L151466
         STZ   $47
         STZ   $4B
         STZ   $4D
         BRL   L193544
L1934B1  LDA   $51
         SEC
         SBC   #$0004
         STA   $21
         LDA   #$0009
         CLC
         ADC   $21
         STA   $25
         LDA   $55
         INC
         INC
         INC
         STA   $23
         LDA   #$0014
         CLC
         ADC   $23
         STA   $27
         JSL   L150711
         PEI   $45
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L15162D
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L15055C
         LDA   $47
         BEQ   L193538
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEI   $45
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L15055C
L193538  JSL   L151466
         STZ   $47
         STZ   $4B
         STZ   $4D
         BRA   L193544
L193544  TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         JSL   L150FF9
         STZ   $3B
         STZ   $3D
         LDA   $4B
         ORA   $4D
         BNE   L19355E
         BRL   L1936E3
L19355E  PHY
         PHY
         PEA   $8001
         PEI   $4D
         PEI   $4B
         JSL   L15041C
         PLA
         STA   $37
         PLX
         STX   $39
         LDA   $37
         ORA   $39
         BEQ   L193585
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         STA   $3B
         STX   $3D
         BRA   L1935A8
L193585  PHY
         PHY
         PEA   $001C
         JSL   L085FE9
         JSL   L081C53
         LDA   L0550A7
         LDX   L0550A9
         STA   $5B
         STX   $5D
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         STA   $3B
         STX   $3D
L1935A8  LDA   #$7FFF
         AND   [$3B]
         STA   [$3B]
         PEI   $51
         PHY
         LDY   #$0004
         LDA   [$3B],Y
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $5B
         PLA
         SEC
         SBC   $5B
         SEC
         SBC   #$0006
         STA   $35
         LDA   $4F
         LDY   #$0006
         SEC
         SBC   [$3B],Y
         AND   #$FFFE
         STA   $33
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1935E4
         INX
L1935E4  STA   $01
         STX   $03
         LDA   $47
         BEQ   L193669
         LDY   #$004A
         LDA   [$64],Y
         BEQ   L19361E
         LDA   #$0022
         CLC
         ADC   $01
         LDX   $03
         BCC   L1935FE
         INX
L1935FE  CLC
         ADC   #$0001
         BCC   L193605
         INX
L193605  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         PEA   $1000
         JSL   L150BEE
         PLA
         CLC
         ADC   #$0F00
         STA   $31
         BRA   L193667
L19361E  LDA   #$0022
         CLC
         ADC   $01
         LDX   $03
         BCC   L193629
         INX
L193629  CLC
         ADC   #$0002
         BCC   L193630
         INX
L193630  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         PEA   $1000
         JSL   L150BEE
         LDA   #$0022
         CLC
         ADC   $01
         LDX   $03
         BCC   L19364B
         INX
L19364B  CLC
         ADC   #$0003
         BCC   L193652
         INX
L193652  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         XBA
         AND   #$FF00
         STA   $5B
         PLA
         CLC
         ADC   $5B
         STA   $31
L193667  BRA   L1936B2
L193669  LDA   #$0022
         CLC
         ADC   $01
         LDX   $03
         BCC   L193674
         INX
L193674  CLC
         ADC   #$0003
         BCC   L19367B
         INX
L19367B  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         PEA   $1000
         JSL   L150BEE
         LDA   #$0022
         CLC
         ADC   $01
         LDX   $03
         BCC   L193696
         INX
L193696  CLC
         ADC   #$0002
         BCC   L19369D
         INX
L19369D  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         XBA
         AND   #$FF00
         STA   $5B
         PLA
         CLC
         ADC   $5B
         STA   $31
L1936B2  LDA   #$FF00
         AND   $31
         BNE   L1936C0
         LDA   #$0003
         ORA   $31
         STA   $31
L1936C0  PEI   $3D
         PEI   $3B
         PEI   $31
         PEI   $33
         PEI   $35
         JSL   L15047C
         LDA   $37
         ORA   $39
         BNE   L1936E3
         PEA   $0200
         LDA   L0550A7
         LDX   L0550A9
         PHX
         PHA
         JSL   L150D44
L1936E3  LDY   #$004A
         LDA   [$64],Y
         SEC
         SBC   #$0005
         BVS   L1936F1
         EOR   #$8000
L1936F1  BPL   L193713
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L0401BF
         PEA   L0401BF
         PEA   $000E
         JSL   L0313BE
         LDA   #$001E
         CLC
         ADC   $55
         STA   $1F
         BRA   L19374A
L193713  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L0401CD
         PEA   L0401CD
         PEA   $0007
         JSL   L0313BE
         PEI   $4F
         PHY
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15063B
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $5B
         PLA
         SEC
         SBC   $5B
         STA   $1F
L19374A  LDA   $3B
         ORA   $3D
         BEQ   L193760
         LDY   #$0004
         LDA   [$3B],Y
         CLC
         ADC   $35
         CLC
         ADC   #$0009
         STA   $1D
         BRA   L193768
L193760  LDA   #$0004
         CLC
         ADC   $51
         STA   $1D
L193768  LDY   #$004A
         LDA   [$64],Y
         SEC
         SBC   #$0004
         BEQ   L1937A6
         BVS   L193778
         EOR   #$8000
L193778  BPL   L1937A6
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L193785
         INX
L193785  CLC
         ADC   #$0022
         BCC   L19378C
         INX
L19378C  CLC
         ADC   #$0001
         BCC   L193793
         INX
L193793  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $1B
         LDA   #$000F
         STA   $19
         BRL   L193874
L1937A6  LDA   $47
         BNE   L1937AD
         BRL   L19384C
L1937AD  LDY   #$004A
         LDA   [$64],Y
         BNE   L193800
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1937BF
         INX
L1937BF  CLC
         ADC   #$0014
         BCC   L1937C6
         INX
L1937C6  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $19
         PEA   $000F
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L1937DF
         INX
L1937DF  CLC
         ADC   #$0022
         BCC   L1937E6
         INX
L1937E6  CLC
         ADC   #$0001
         BCC   L1937ED
         INX
L1937ED  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $5B
         PLA
         SEC
         SBC   $5B
         STA   $1B
         BRA   L19384A
L193800  LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L19380B
         INX
L19380B  CLC
         ADC   #$0022
         BCC   L193812
         INX
L193812  CLC
         ADC   #$0001
         BCC   L193819
         INX
L193819  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $19
         PEA   $000F
         LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L193832
         INX
L193832  CLC
         ADC   #$0014
         BCC   L193839
         INX
L193839  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $5B
         PLA
         SEC
         SBC   $5B
         STA   $1B
L19384A  BRA   L193874
L19384C  LDA   #$0005
         CLC
         ADC   $64
         LDX   $66
         BCC   L193857
         INX
L193857  CLC
         ADC   #$0022
         BCC   L19385E
         INX
L19385E  CLC
         ADC   #$0001
         BCC   L193865
         INX
L193865  STA   $5B
         STX   $5D
         LDA   #$00FF
         AND   [$5B]
         STA   $1B
         LDA   $43
         STA   $19
L193874  PHY
         PEI   $1B
         JSL   L081A92
         JSL   L1511E6
         PHY
         PEI   $19
         JSL   L081A92
         JSL   L1511E0
         PEI   $1F
         PEI   $1D
         JSL   L1510C5
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150592
         PEI   $41
         PEI   $3F
         JSL   L150A5E
         PEI   $41
         PEI   $3F
         JSL   L151669
         LDA   $62
         STA   $66
         LDA   $61
         STA   $65
         LDA   $5F
         TCD
         TSC
         CLC
         ADC   #$0064
         TCS
         RTL

L1938C1  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDY   #$003D
         LDA   [$1C],Y
         PHA
         DEY
         DEY
         LDA   [$1C],Y
         PHA
         PEA   $000D
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L072B17
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L150801
         LDA   #$0001
         LDY   #$0033
         STA   [$1C],Y
         PEA   $0000
         PEI   $1C
         JSL   L193122
L193902  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         LSR
         BCC   L193973
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCS   L193971
         PHY
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $01
         LDY   #$0033
         LDA   [$1C],Y
         CMP   $01
         BEQ   L193969
         LDA   $01
         LDY   #$0033
         STA   [$1C],Y
         PEA   $0000
         PEI   $1C
         JSL   L193122
L193969  LDA   $0F
         LDX   $11
         STA   $0B
         STX   $0D
L193971  BRA   L193902
L193973  LDA   #$0000
         LDY   #$0033
         STA   [$1C],Y
         PEA   $0000
         PEI   $1C
         JSL   L193122
         LDA   $1A
         STA   $1E
         LDA   $19
         STA   $1D
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L193996  PHD
         TSC
         CLC
         ADC   #$FFBE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $37
         PLX
         STX   $39
         PHY
         JSL   L0727BF
         PLA
         STA   $35
         PHY
         PHY
         PEA   $0FA0
         JSL   L072834
         PLA
         STA   $3B
         PLX
         STX   $3D
         LDA   $4A
         SEC
         SBC   #$0001
         BEQ   L1939E6
         BVS   L1939E4
         EOR   #$8000
L1939E4  BMI   L1939F4
L1939E6  PEA   $00FF
         PEI   $3D
         PEI   $3B
         PEA   $0005
         JSL   L072E7C
L1939F4  LDA   $4A
         SEC
         SBC   #$0005
         BVS   L1939FF
         EOR   #$8000
L1939FF  BMI   L193A36
         LDAL  L052D42
         ORAL  L052D44
         BNE   L193A27
         PEA   $00FF
         PEI   $3D
         PEI   $3B
         PEA   $0003
         JSL   L072E7C
         PEA   $00FF
         PEI   $3D
         PEI   $3B
         PEA   $0004
         JSL   L072E7C
L193A27  PEI   $3D
         PEI   $3B
         PEA   $000E
         JSL   L072E4C
         STZ   $33
         BRA   L193A80
L193A36  PEI   $3D
         PEI   $3B
         PEA   $0003
         JSL   L072E4C
         PEI   $3D
         PEI   $3B
         PEA   $0004
         JSL   L072E4C
         PEI   $3D
         PEI   $3B
         PEA   $0008
         JSL   L072E4C
         PEI   $3D
         PEI   $3B
         PEA   $0009
         JSL   L072E4C
         PEA   $00FF
         PEI   $3D
         PEI   $3B
         PEA   $0006
         JSL   L072E7C
         PEI   $3D
         PEI   $3B
         PEA   $000D
         JSL   L072E4C
         LDA   #$0001
         STA   $33
L193A80  LDA   #$00FF
         AND   $29
         PHA
         PEI   $3D
         PEI   $3B
         PEA   $0003
         JSL   L073B05
         LDA   #$00FF
         AND   $2A
         PHA
         PEI   $3D
         PEI   $3B
         PEA   $0004
         JSL   L073B05
         LDA   #$00FF
         AND   $27
         PHA
         PEI   $3D
         PEI   $3B
         PEA   $0005
         JSL   L073B05
         PEA   $000F
         LDA   #$00FF
         AND   $19
         STA   $3F
         PLA
         SEC
         SBC   $3F
         PHA
         PEI   $3D
         PEI   $3B
         PEA   $0006
         JSL   L073B05
         LDA   #$00FF
         AND   $28
         PHA
         PEI   $3D
         PEI   $3B
         PEA   $0007
         JSL   L073B05
         PEI   $3D
         PEI   $3B
         JSL   L15102F
         PEI   $3D
         PEI   $3B
         JSL   L151131
         LDA   $3B
         LDX   $3D
         STA   $01
         STX   $03
         LDY   #$00A0
         LDA   #$8000
         ORA   [$01],Y
         LDY   #$00A0
         STA   [$01],Y
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
L193B11  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $2F
         LDA   $2F
         SEC
         SBC   #$FFFE
         BVS   L193B2B
         BPL   L193B29
         BRL   L193C61
L193B29  BRA   L193B30
L193B2B  BMI   L193B30
         BRL   L193C61
L193B30  CMP   #$0011
         BMI   L193B38
         BRL   L193C61
L193B38  SEC
         SBC   #$0000
         BEQ   L193B6B
         SEC
         SBC   #$0005
         BEQ   L193BA8
         DEC
         BEQ   L193BA8
         DEC
         BNE   L193B4D
         BRL   L193BDE
L193B4D  DEC
         BNE   L193B53
         BRL   L193C1D
L193B53  DEC
         BNE   L193B59
         BRL   L193BDE
L193B59  SEC
         SBC   #$0006
         BNE   L193B62
         BRL   L193C46
L193B62  DEC
         BNE   L193B68
         BRL   L193C50
L193B68  BRL   L193C61
L193B6B  PEI   $3D
         PEI   $3B
         JSL   L1506B3
         PEI   $3D
         PEI   $3B
         JSL   L1517CD
         LDA   #$0003
         STA   $31
L193B80  PEI   $3D
         PEI   $3B
         PEI   $31
         JSL   L193FCE
         LDA   #$0007
         CMP   $31
         BEQ   L193B95
         INC   $31
         BRA   L193B80
L193B95  PEA   $0000
         PHD
         JSL   L193122
         PEI   $3D
         PEI   $3B
         JSL   L1506AD
         BRL   L193C61
L193BA8  LDA   $48
         BEQ   L193BDB
         TDC
         CLC
         ADC   #$0027
         STA   $3F
         STZ   $41
         LDA   $2F
         DEC
         CLC
         ADC   $3F
         STA   $3F
         BCC   L193BC1
         INC   $41
L193BC1  PHY
         PEI   $3D
         PEI   $3B
         PEI   $2F
         JSL   L193EC2
         PLA
         SEP   #$20
         STA   [$3F]
         REP   #$20
         PEA   $0000
         PHD
         JSL   L193122
L193BDB  BRL   L193C61
L193BDE  LDA   $48
         BEQ   L193C1B
         TDC
         CLC
         ADC   #$0027
         STA   $3F
         STZ   $41
         PEI   $2F
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         DEC
         DEC
         CLC
         ADC   $3F
         STA   $3F
         BCC   L193C01
         INC   $41
L193C01  PHY
         PEI   $3D
         PEI   $3B
         PEI   $2F
         JSL   L193EC2
         PLA
         SEP   #$20
         STA   [$3F]
         REP   #$20
         PEA   $0000
         PHD
         JSL   L193122
L193C1B  BRA   L193C61
L193C1D  LDA   $48
         BEQ   L193C44
         PEA   $000F
         PHY
         PEI   $3D
         PEI   $3B
         PEI   $2F
         JSL   L193EC2
         PLA
         STA   $3F
         PLA
         SEC
         SBC   $3F
         SEP   #$20
         STA   $19
         REP   #$20
         PEA   $0000
         PHD
         JSL   L193122
L193C44  BRA   L193C61
L193C46  PEA   $0000
         PHD
         JSL   L1938C1
         BRA   L193C61
L193C50  LDA   $33
         EOR   #$0001
         STA   $33
         PEA   $0000
         PHD
         JSL   L193122
         BRA   L193C61
L193C61  LDX   #$0000
         LDA   $2F
         DEC
         BNE   L193C6A
         INX
L193C6A  PHX
         LDX   #$0000
         LDA   $2F
         DEC
         DEC
         BNE   L193C75
         INX
L193C75  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L193C7F
         BRL   L193B11
L193C7F  PEI   $3D
         PEI   $3B
         JSL   L072634
         PEI   $39
         PEI   $37
         JSL   L151131
         PEI   $35
         JSL   L0724F7
         LDX   #$0000
         LDA   $2F
         DEC
         BNE   L193C9E
         INX
L193C9E  TXA
         AND   $48
         BEQ   L193D01
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L070A10
         PLA
         LSR
         BCS   L193CF7
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCC   L193CF0
         PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         BRA   L193CF7
L193CF0  PEA   $000E
         JSL   L0727E0
L193CF7  PEA   ^L052D38
         PEA   L052D38
         JSL   L086CDB
L193D01  JSL   L14174B
         LDA   $46
         STA   $4A
         LDA   $45
         STA   $49
         LDA   $43
         TCD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L193D17  PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         PEI   $2A
         LDA   $26
         PEA   $0012
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $13
         LDA   $28
         STA   $11
         LDA   #$0018
         CLC
         ADC   $13
         STA   $17
         LDA   #$000B
         CLC
         ADC   $11
         STA   $15
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   $26
         CMP   $24
         BNE   L193D58
         BRL   L193E55
L193D58  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $2A
         PEI   $28
         LDA   #$0126
         CLC
         ADC   $2A
         PHA
         LDA   #$000B
         CLC
         ADC   $28
         PHA
         JSL   L15100B
         PEA   $FFFF
         JSL   L081DD8
         PEI   $2A
         LDA   $24
         PEA   $0012
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         INC
         INC
         STA   $03
         LDA   $28
         INC
         STA   $01
         LDA   #$0018
         CLC
         ADC   $03
         SEC
         SBC   #$0004
         STA   $07
         LDA   #$000B
         CLC
         ADC   $01
         DEC
         DEC
         STA   $05
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEI   $24
         JSL   L081A92
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $24
         BMI   L193E1C
         BEQ   L193E1C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFEE
         PEA   $0000
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         LDA   $24
         DEC
         PHA
         JSL   L081A92
         JSL   L1501B5
L193E1C  LDA   $24
         SEC
         SBC   #$000F
         BVS   L193E27
         EOR   #$8000
L193E27  BMI   L193E55
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0012
         PEA   $0000
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         LDA   $24
         INC
         PHA
         JSL   L081A92
         JSL   L1501B5
L193E55  PEA   $0000
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0004
         PEA   $0002
         JSL   L151005
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L151418
         LDA   $22
         STA   $2A
         LDA   $21
         STA   $29
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L193EC2  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L150801
         PEI   $2A
         PEI   $28
         PEI   $26
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L072B17
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFEC
         PEA   $FFF6
         JSL   L151005
         PHY
         PHY
         PEI   $2A
         PEI   $28
         LDA   $26
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $11
         PLX
         STX   $13
         PHY
         PEI   $13
         PEI   $11
         JSL   L151313
         PLA
         STA   $19
L193F3A  PHY
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
         JSL   L1512CB
         PLA
         LSR
         BCC   L193F93
         PHY
         PEI   $17
         LDA   $0B
         INC
         INC
         PHA
         LDA   $0F
         DEC
         DEC
         DEC
         PHA
         JSL   L071A1B
         LDA   $0B
         INC
         INC
         STA   $1D
         PLA
         SEC
         SBC   $1D
         PHA
         PEA   $0012
         JSL   L1500F5
         PLX
         PLX
         STA   $1B
         LDA   $19
         CMP   $1B
         BEQ   L193F93
         PEI   $0B
         PEI   $09
         PEI   $1B
         PEI   $19
         JSL   L193D17
         LDA   $1B
         STA   $19
L193F93  TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L193F3A
         PEI   $1B
         PEI   $13
         PEI   $11
         JSL   L15130D
         LDA   $1B
         STA   $2C
         LDA   $24
         STA   $2A
         LDA   $23
         STA   $29
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L193FCE  PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         PHY
         PHY
         PEI   $28
         PEI   $26
         LDA   $24
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $11
         PLX
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0010
         BCC   L193FFD
         INX
L193FFD  STA   $1B
         STX   $1D
         LDA   #$00FF
         AND   [$1B]
         AND   #$0080
         SEC
         SBC   #$0000
         BMI   L194014
         BEQ   L194014
         BRL   L1940DF
L194014  LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0011
         BCC   L194023
         INX
L194023  STA   $1B
         STX   $1D
         LDA   #$00FF
         AND   [$1B]
         PHA
         LDX   #$0000
         PLA
         BMI   L194036
         BEQ   L194036
         INX
L194036  TXA
         STA   $15
         PHY
         PEI   $13
         PEI   $11
         JSL   L151313
         PLA
         STA   $17
         PEI   $28
         PEI   $26
         PEI   $24
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L072B17
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         STZ   $19
L194086  LDA   #$0014
         CLC
         ADC   $0B
         STA   $0F
         LDA   $15
         BEQ   L1940A7
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $3333
         PEA   $FFFF
         JSL   L1501B5
         BRA   L1940BE
L1940A7  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEI   $19
         JSL   L081A92
         JSL   L1501B5
L1940BE  LDA   $0F
         DEC
         DEC
         STA   $0B
         LDA   #$000F
         CMP   $19
         BEQ   L1940CF
         INC   $19
         BRA   L194086
L1940CF  LDA   $15
         BNE   L1940DF
         PEI   $03
         PEI   $01
         PEI   $17
         PEI   $17
         JSL   L193D17
L1940DF  LDA   $22
         STA   $28
         LDA   $21
         STA   $27
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L1940F1  PHD
         TSC
         CLC
         ADC   #$FE7B
         TCS
         ADC   #$0092
         TCD
         LDY   #$003B
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0003
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L072B17
         PHY
         LDA   #$0005
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L194123
         INX
L194123  CLC
         ADC   #$0022
         BCC   L19412A
         INX
L19412A  STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         PHA
         JSL   L081A92
         PLA
         STA   $D3
         PHY
         LDA   #$0005
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L194147
         INX
L194147  CLC
         ADC   #$0022
         BCC   L19414E
         INX
L19414E  CLC
         ADC   #$0001
         BCC   L194155
         INX
L194155  STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         PHA
         JSL   L081A92
         PLA
         STA   $D1
         PHY
         PEA   $000F
         LDA   #$0005
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L194175
         INX
L194175  CLC
         ADC   #$0014
         BCC   L19417C
         INX
L19417C  STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         STA   $EF
         PLA
         SEC
         SBC   $EF
         PHA
         JSL   L081A92
         PLA
         STA   $CF
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $D3
         JSL   L081DD8
         LDY   #$0048
         LDA   [$F8],Y
         SEC
         SBC   #$0000
         BPL   L1941CE
         BRL   L1942A3
L1941CE  CMP   #$0008
         BMI   L1941D6
         BRL   L1942A3
L1941D6  SEC
         SBC   #$0000
         BEQ   L1941EE
         DEC
         BEQ   L1941EE
         DEC
         BEQ   L194203
         DEC
         DEC
         BEQ   L194217
         DEC
         DEC
         DEC
         BEQ   L19425D
         BRL   L1942A3
L1941EE  TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $3333
         PEI   $CF
         JSL   L1501B5
         BRL   L1942A3
L194203  TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $CF
         JSL   L1501B5
         BRL   L1942A3
L194217  LDA   $E7
         LDX   $E9
         STA   $DF
         STX   $E1
         LDA   $ED
         DEC
         DEC
         STA   $E3
         LDA   $EB
         DEC
         STA   $E3
         LDA   #$0004
         CLC
         ADC   $E1
         PHA
         PEI   $E3
         JSL   L1510C5
         PEI   $E5
         PEI   $E3
         JSL   L1505DA
         PEI   $E5
         LDA   $DF
         INC
         INC
         PHA
         JSL   L1505DA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $CF
         JSL   L1501B5
         BRA   L1942A3
L19425D  TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $CF
         JSL   L1501B5
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $CF
         JSL   L08510A
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0064
         PEA   $000A
         PEI   $D3
         PEI   $CF
         JSL   L081904
         LDA   $E5
         SEC
         SBC   #$001A
         STA   $E5
         BRA   L1942A3
L1942A3  TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEI   $D1
         JSL   L1511E6
         PEI   $CF
         JSL   L1511E0
         PEA   $0000
         JSL   L1516ED
         SEP   #$20
         LDA   #$02
         STA   $BE
         REP   #$20
         SEP   #$20
         LDA   #$02
         STA   $C1
         REP   #$20
         SEP   #$20
         LDA   #$02
         STA   $C4
         REP   #$20
         SEP   #$20
         LDA   #$02
         STA   $C7
         REP   #$20
         LDA   $D1
         SEP   #$20
         STA   $BF
         REP   #$20
         LDA   $D1
         SEP   #$20
         STA   $C0
         REP   #$20
         LDA   $CF
         SEP   #$20
         STA   $C2
         REP   #$20
         LDA   $CF
         SEP   #$20
         STA   $C3
         REP   #$20
         LDA   #$7FFF
         SEC
         SBC   $D1
         SEP   #$20
         STA   $C5
         REP   #$20
         LDA   #$7FFF
         SEC
         SBC   $D1
         SEP   #$20
         STA   $C6
         REP   #$20
         LDA   #$7FFF
         SEC
         SBC   $CF
         SEP   #$20
         STA   $C8
         REP   #$20
         LDA   #$7FFF
         SEC
         SBC   $CF
         SEP   #$20
         STA   $C9
         REP   #$20
         SEP   #$20
         LDA   #$01
         STA   $CA
         REP   #$20
         SEP   #$20
         LDA   #$01
         STA   $CB
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBE
         PHA
         PEA   ^L0401D4
         PEA   L0401D4
         TDC
         CLC
         ADC   #$00CA
         PEA   $0000
         PHA
         PEA   ^L0401DF
         PEA   L0401DF
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00CA
         PEA   $0000
         PHA
         PEA   ^L0401E1
         PEA   L0401E1
         TDC
         CLC
         ADC   #$00C4
         PEA   $0000
         PHA
         PEA   ^L0401E3
         PEA   L0401E3
         TDC
         CLC
         ADC   #$00CA
         PEA   $0000
         PHA
         PEA   ^L0401ED
         PEA   L0401ED
         TDC
         CLC
         ADC   #$00BE
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00CA
         PEA   $0000
         PHA
         PEA   ^L0401EF
         PEA   L0401EF
         TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         PEA   ^L0401F1
         PEA   L0401F1
         PEA   $0000
         TDC
         CLC
         ADC   #$FF6E
         PHA
         PEA   $000F
         JSL   L1509CE
         PEA   $0050
         JSL   L0313BE
         STZ   $D5
L1943DD  LDY   #$003B
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0020
         BCC   L1943EE
         INX
L1943EE  PHX
         PHA
         LDA   $D5
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $EF
         STX   $F1
         LDA   $CF
         STA   [$EF]
         LDA   #$000F
         CMP   $D5
         BEQ   L19441B
         INC   $D5
         BRA   L1943DD
L19441B  PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         LDA   #$00FF
         LDX   #$FFBE
         AND   $00,X
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L15069B
         STZ   $D5
L19443F  LDY   #$003B
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0020
         BCC   L194450
         INX
L194450  PHX
         PHA
         LDA   $D5
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $EF
         STX   $F1
         LDA   #$FFFF
         STA   [$EF]
         LDA   #$000F
         CMP   $D5
         BEQ   L19447E
         INC   $D5
         BRA   L19443F
L19447E  TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0009
         CLC
         ADC   $D7
         STA   $D7
         LDA   #$0F0F
         AND   $D3
         PHA
         LDA   #$F0F0
         AND   $CF
         ORA   $01,S
         PLX
         STA   $CD
L1944AF  LDA   $D7
         INC
         STA   $DB
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         PEI   $CD
         PEI   $CD
         JSL   L1501B5
         LDA   #$0009
         CLC
         ADC   $D7
         STA   $D7
         LDA   $D7
         SEC
         SBC   $E3
         BVS   L1944D7
         EOR   #$8000
L1944D7  BPL   L1944AF
         PEA   $0000
         JSL   L1511E6
         PEA   $FFFF
         JSL   L1511E0
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$018B
         TCS
         RTL

L1944F9  PHD
         TSC
         CLC
         ADC   #$FFC0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $35
         PLX
         STX   $37
         PHY
         JSL   L0727BF
         PLA
         STA   $33
         PHY
         PHY
         PEA   $1004
         JSL   L072834
         PLA
         STA   $39
         PLX
         STX   $3B
         LDA   #$00FF
         AND   $27
         PHA
         PEI   $3B
         PEI   $39
         PEA   $0005
         JSL   L073B05
         PEA   $000F
         LDA   #$00FF
         AND   $19
         STA   $3D
         PLA
         SEC
         SBC   $3D
         PHA
         PEI   $3B
         PEI   $39
         PEA   $0006
         JSL   L073B05
         LDA   #$00FF
         AND   $28
         PHA
         PEI   $3B
         PEI   $39
         PEA   $0007
         JSL   L073B05
         PEI   $3B
         PEI   $39
         JSL   L15102F
         PEI   $3B
         PEI   $39
         JSL   L151131
         LDA   $39
         LDX   $3B
         STA   $01
         STX   $03
         LDY   #$00A0
         LDA   #$8000
         ORA   [$01],Y
         LDY   #$00A0
         STA   [$01],Y
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
L1945A9  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $2F
         LDA   $2F
         SEC
         SBC   #$FFFE
         BVS   L1945C3
         BPL   L1945C1
         BRL   L19468C
L1945C1  BRA   L1945C8
L1945C3  BMI   L1945C8
         BRL   L19468C
L1945C8  CMP   #$000A
         BMI   L1945D0
         BRL   L19468C
L1945D0  SEC
         SBC   #$0000
         BEQ   L1945E8
         SEC
         SBC   #$0007
         BEQ   L194624
         DEC
         BNE   L1945E2
         BRL   L194663
L1945E2  DEC
         BEQ   L194624
         BRL   L19468C
L1945E8  PEI   $3B
         PEI   $39
         JSL   L1506B3
         PEA   $0000
         PHD
         JSL   L1940F1
         PEI   $3B
         PEI   $39
         JSL   L1517CD
         LDA   #$0005
         STA   $31
L194605  PEI   $3B
         PEI   $39
         PEI   $31
         JSL   L193FCE
         LDA   #$0007
         CMP   $31
         BEQ   L19461A
         INC   $31
         BRA   L194605
L19461A  PEI   $3B
         PEI   $39
         JSL   L1506AD
         BRA   L19468C
L194624  LDA   $46
         BEQ   L194661
         TDC
         CLC
         ADC   #$0027
         STA   $3D
         STZ   $3F
         PEI   $2F
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         DEC
         DEC
         CLC
         ADC   $3D
         STA   $3D
         BCC   L194647
         INC   $3F
L194647  PHY
         PEI   $3B
         PEI   $39
         PEI   $2F
         JSL   L193EC2
         PLA
         SEP   #$20
         STA   [$3D]
         REP   #$20
         PEA   $0000
         PHD
         JSL   L1940F1
L194661  BRA   L19468C
L194663  LDA   $46
         BEQ   L19468A
         PEA   $000F
         PHY
         PEI   $3B
         PEI   $39
         PEI   $2F
         JSL   L193EC2
         PLA
         STA   $3D
         PLA
         SEC
         SBC   $3D
         SEP   #$20
         STA   $19
         REP   #$20
         PEA   $0000
         PHD
         JSL   L1940F1
L19468A  BRA   L19468C
L19468C  LDX   #$0000
         LDA   $2F
         DEC
         BNE   L194695
         INX
L194695  PHX
         LDX   #$0000
         LDA   $2F
         DEC
         DEC
         BNE   L1946A0
         INX
L1946A0  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L1946AA
         BRL   L1945A9
L1946AA  PEI   $3B
         PEI   $39
         JSL   L072634
         PEI   $37
         PEI   $35
         JSL   L151131
         PEI   $33
         JSL   L0724F7
         LDX   #$0000
         LDA   $2F
         DEC
         BNE   L1946C9
         INX
L1946C9  TXA
         AND   $46
         BEQ   L19472C
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L070A10
         PLA
         LSR
         BCS   L194722
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCC   L19471B
         PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         BRA   L194722
L19471B  PEA   $000E
         JSL   L0727E0
L194722  PEA   ^L052D38
         PEA   L052D38
         JSL   L086CDB
L19472C  JSL   L14174B
         LDA   $44
         STA   $48
         LDA   $43
         STA   $47
         LDA   $41
         TCD
         TSC
         CLC
         ADC   #$0046
         TCS
         RTL

L194742  PHD
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
         PEA   $0000
         PEA   $0000
         PEA   $01E0
         PEA   $0070
         JSL   L15100B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         LDA   L05541D
         DEC
         PEA   $001C
         JSL   L150BEE
         JSL   L1501AF
         LDA   L05541F
         LDX   L055421
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDAL  L050002
         PHA
         LDAL  L050000
         PHA
         PEA   $0000
         JSL   L15025A
         LDA   #$FFFF
         STA   L055419
         JSL   L196454
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L1947B2  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         LDA   $10
         SEC
         SBC   #$0005
         BPL   L1947CD
         BRL   L1948ED
L1947CD  CMP   #$0004
         BMI   L1947D5
         BRL   L1948ED
L1947D5  SEC
         SBC   #$0000
         BNE   L1947DE
         BRL   L194881
L1947DE  DEC
         BNE   L1947E4
         BRL   L1948B1
L1947E4  DEC
         BEQ   L1947ED
         DEC
         BEQ   L19482F
         BRL   L1948ED
L1947ED  LDA   L05541D
         SEC
         SBC   #$0001
         BEQ   L19482C
         BVS   L1947FB
         EOR   #$8000
L1947FB  BPL   L19482C
         LDA   L05541D
         SEC
         SBC   #$0004
         STA   L05541D
         LDA   L05541D
         SEC
         SBC   #$0001
         BVS   L194813
         EOR   #$8000
L194813  BMI   L19481B
         LDA   #$0001
         STA   L05541D
L19481B  JSL   L194742
         LDA   L05541D
         DEC
         PHA
         PEI   $0E
         PEI   $0C
         JSL   L15130D
L19482C  BRL   L1948ED
L19482F  LDA   L05541B
         DEC
         DEC
         DEC
         STA   $03
         LDA   L05541D
         SEC
         SBC   $03
         BVS   L194842
         EOR   #$8000
L194842  BMI   L19487F
         LDA   #$0004
         CLC
         ADC   L05541D
         STA   L05541D
         LDA   L05541B
         DEC
         DEC
         DEC
         STA   $03
         LDA   L05541D
         SEC
         SBC   $03
         BEQ   L19486E
         BVS   L194863
         EOR   #$8000
L194863  BPL   L19486E
         LDA   L05541B
         DEC
         DEC
         DEC
         STA   L05541D
L19486E  JSL   L194742
         LDA   L05541D
         DEC
         PHA
         PEI   $0E
         PEI   $0C
         JSL   L15130D
L19487F  BRA   L1948ED
L194881  LDA   L05541D
         DEC
         STA   L05541D
         LDA   L05541D
         SEC
         SBC   #$0001
         BVS   L194894
         EOR   #$8000
L194894  BMI   L19489E
         LDA   #$0001
         STA   L05541D
         BRA   L1948AF
L19489E  JSL   L194742
         LDA   L05541D
         DEC
         PHA
         PEI   $0E
         PEI   $0C
         JSL   L15130D
L1948AF  BRA   L1948ED
L1948B1  LDA   L05541D
         INC
         STA   L05541D
         LDA   L05541B
         DEC
         DEC
         DEC
         STA   $03
         LDA   L05541D
         SEC
         SBC   $03
         BEQ   L1948DA
         BVS   L1948CD
         EOR   #$8000
L1948CD  BPL   L1948DA
         LDA   L05541B
         DEC
         DEC
         DEC
         STA   L05541D
         BRA   L1948EB
L1948DA  JSL   L194742
         LDA   L05541D
         DEC
         PHA
         PEI   $0E
         PEI   $0C
         JSL   L15130D
L1948EB  BRA   L1948ED
L1948ED  PEI   $01
         JSL   L071AA4
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

L194905  ENT
         PHD
         TSC
         CLC
         ADC   #$FC60
         TCS
         ADC   #$02A9
         TCD
         LDA   L05522F
         PHA
         PHY
         JSL   L099DCE
         PLA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L19492A
         INX
L19492A  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L194946
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L0B8207
         BRL   L194DE0
         BRL   L194DB2
L194946  PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L194963
         BRL   L194DE0
L194963  LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         TXY
         LDX   #$FE5B
         STA   $00,X
         TYA
         STA   $02,X
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         LDX   #$FE5B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0014
         BCC   L194996
         INX
L194996  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         LDX   #$FE5B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L1949BF
         INX
L1949BF  STA   $F3
         STX   $F5
         LDA   #$4000
         AND   [$F3]
         BEQ   L1949CD
         LDA   #$0001
L1949CD  STA   $E3
         LDX   #$FE5B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L1949DF
         INX
L1949DF  STA   $F3
         STX   $F5
         LDA   #$0800
         AND   [$F3]
         BEQ   L1949ED
         LDA   #$0001
L1949ED  STA   $E1
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         LDA   L055051
         EOR   #$0001
         ORA   L055243
         STA   $E5
         PEA   $0000
         TDC
         CLC
         ADC   #$FF5F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD57
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L194A7F
         DEX
L194A7F  PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L194AB8
         DEX
L194AB8  PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         JSL   L073C22
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         PHY
         PEA   $0190
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L194B10
         EOR   #$8000
L194B10  BMI   L194B29
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000A
         JSL   L151367
         JSL   L150B10
L194B29  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L194B35
         EOR   #$8000
L194B35  BMI   L194B4E
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000B
         JSL   L151367
         JSL   L150B10
L194B4E  PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
         PEI   $E1
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
L194B68  PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FF5F
         PHA
         JSL   L073A7B
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $F1
         PEI   $EF
         JSL   L15102F
L194B95  LDA   $EB
         STA   $EB
         PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $EB
         LDA   $E5
         BEQ   L194BDE
         LDA   #$0008
         CMP   $EB
         BNE   L194BC3
         LDA   $E3
         EOR   #$0001
         STA   $E3
         PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
L194BC3  LDA   #$0009
         CMP   $EB
         BNE   L194BDE
         LDA   $E1
         EOR   #$0001
         STA   $E1
         PEI   $E1
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
L194BDE  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L194BEA
         EOR   #$8000
L194BEA  BMI   L194BF1
         LDA   #$0000
         BRA   L194BF4
L194BF1  LDA   #$0001
L194BF4  PHA
         LDX   #$0000
         LDA   #$000B
         CMP   $EB
         BNE   L194C00
         INX
L194C00  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L194C38
         PEA   $0002
         PEI   $E5
         JSL   L1901D8
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         JSL   L073C22
L194C38  LDX   #$0000
         LDA   $EB
         DEC
         BNE   L194C41
         INX
L194C41  PHX
         LDX   #$0000
         LDA   $EB
         DEC
         DEC
         BNE   L194C4C
         INX
L194C4C  TXA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$000A
         CMP   $EB
         BNE   L194C5C
         INX
L194C5C  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L194C66
         BRL   L194B95
L194C66  LDA   $EB
         DEC
         DEC
         BNE   L194C6F
         BRL   L194DA4
L194C6F  PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L194C93
         PEA   $0043
         JSL   L0727E0
         BRL   L194DA4
L194C93  STZ   $DF
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         TXY
         LDX   #$FE57
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE57
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L194CB6
         INX
L194CB6  STA   $F3
         STX   $F5
         LDA   #$4000
         AND   [$F3]
         BEQ   L194CC4
         LDA   #$0001
L194CC4  CMP   $E3
         BEQ   L194CCF
         LDA   #$4000
         ORA   $DF
         STA   $DF
L194CCF  LDX   #$FE57
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L194CDF
         INX
L194CDF  STA   $F3
         STX   $F5
         LDA   #$0800
         AND   [$F3]
         BEQ   L194CED
         LDA   #$0001
L194CED  CMP   $E1
         BEQ   L194CF8
         LDA   #$0800
         ORA   $DF
         STA   $DF
L194CF8  LDX   #$FE57
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L194D08
         INX
L194D08  PHX
         PHA
         LDX   #$FE57
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L194D1A
         INX
L194D1A  STA   $F3
         STX   $F5
         LDA   $DF
         EOR   [$F3]
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         LDA   $DF
         BEQ   L194D39
         LDA   #$0001
L194D39  PHA
         JSL   L074A24
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FE5F
         PHA
         JSL   L071169
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE5F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF5F
         PHA
         JSL   L150434
         PLA
         LSR
         BCC   L194DA4
         LDA   $E5
         BEQ   L194D94
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE5F
         PHA
         JSL   L07D20B
         PLA
         LSR
         BCS   L194D92
         PEA   $0043
         JSL   L0727E0
L194D92  BRA   L194DA4
L194D94  LDA   #$0001
         STA   L054FB3
         JSL   L0903A6
         STZ   L054FB3
         BRL   L194B68
L194DA4  PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $ED
         JSL   L0724F7
L194DB2  LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L194DBE
         INX
L194DBE  PHX
         LDX   #$0000
         LDA   #$000A
         CMP   $EB
         BNE   L194DCA
         INX
L194DCA  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L194DE0
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L0B8207
L194DE0  TSC
         CLC
         ADC   #$03A0
         TCS
         PLD
         RTL

L194DE8  ENT
         PHD
         TSC
         CLC
         ADC   #$FC78
         TCS
         ADC   #$0291
         TCD
         LDX   #$0000
         LDAL  L052D34
         BNE   L194DFD
         INX
L194DFD  PHX
         LDX   #$0000
         LDAL  L052D36
         AND   #$000F
         DEC
         BEQ   L194E0C
         INX
L194E0C  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L194E1D
         PEA   $002B
         JSL   L0727E0
         BRL   L195435
L194E1D  LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L194E2B
         CPX   L0551F7
L194E2B  BNE   L194E4F
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD6F
         PHA
         PEA   $001D
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         BRA   L194E6F
L194E4F  TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD6F
         PHA
         PEA   $001C
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
L194E6F  LDA   L05522F
         PHA
         PHY
         JSL   L099DCE
         PLA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L194E89
         INX
L194E89  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L194EA5
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L0B838F
         BRL   L195435
L194EA5  LDA   L055051
         EOR   #$0001
         ORA   L055243
         STA   $EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FF77
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD6F
         PHA
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L07ACF0
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$008B
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE5B
         PHA
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L194F0B
         DEX
L194F0B  PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE5B
         PHA
         LDAL  L052D34
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$008B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         PEA   ^L04021C
         PEA   L04021C
         JSL   L073C22
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         PHY
         PEA   $0064
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L194F87
         EOR   #$8000
L194F87  BMI   L194FA0
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $0003
         JSL   L151367
         JSL   L150B10
L194FA0  LDA   $EB
         BEQ   L194FA7
         BRL   L1950A4
L194FA7  PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $0004
         JSL   L151367
         JSL   L150B10
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000D
         JSL   L151367
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         TXY
         LDX   #$FE73
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE73
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L194FF5
         INX
L194FF5  PHX
         PHA
         PHY
         PHY
         LDX   #$FE73
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L195009
         INX
L195009  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         PEA   $8000
         PEA   $0000
         JSL   L150241
         PLA
         PLY
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         TYA
         LDY   #$0002
         STA   [$F3],Y
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000E
         JSL   L151367
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         TXY
         LDX   #$FE6F
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE6F
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L195068
         INX
L195068  PHX
         PHA
         PHY
         PHY
         LDX   #$FE6F
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L19507C
         INX
L19507C  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         PEA   $8000
         PEA   $0000
         JSL   L150241
         PLA
         PLY
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         TYA
         LDY   #$0002
         STA   [$F3],Y
L1950A4  LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L1950B2
         CPX   L0551F7
L1950B2  BEQ   L1950CF
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $0009
         JSL   L151367
         JSL   L150B10
         STZ   $E5
         BRA   L1950DD
L1950CF  LDAL  L052D36
         AND   #$4000
         BEQ   L1950DB
         LDA   #$0001
L1950DB  STA   $E5
L1950DD  PEI   $E5
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
         LDAL  L052D40
         AND   #$8000
         BEQ   L1950F6
         LDA   #$0001
L1950F6  STA   $E9
         PEI   $E9
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
         LDAL  L052D40
         AND   #$2000
         BEQ   L195111
         LDA   #$0001
L195111  STA   $E7
         PEI   $E7
         PEI   $F1
         PEI   $EF
         PEA   $0007
         JSL   L073B05
         LDAL  L052D40
         AND   #$000F
         STA   $DF
         LDA   #$0514
         CLC
         ADC   $DF
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $000D
         JSL   L073B05
         LDAL  L052D36
         AND   #$00F0
         PHA
         PEA   $0004
         JSL   L1510EF
         PLA
         STA   $E1
         LDA   $E1
         SEC
         SBC   #$0009
         BEQ   L195161
         BVS   L19515A
         EOR   #$8000
L19515A  BPL   L195161
         LDA   #$0009
         STA   $E1
L195161  LDA   #$0578
         CLC
         ADC   $E1
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $000E
         JSL   L073B05
         LDAL  L052D40
         AND   #$4000
         STA   $E3
L19517C  PEI   $F1
         PEI   $EF
         PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF77
         PHA
         JSL   L073A7B
         PEI   $F1
         PEI   $EF
         PEA   $000C
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $F1
         PEI   $EF
         JSL   L15102F
         PEI   $F1
         PEI   $EF
         JSL   L151131
L1951B1  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $DD
         LDA   $DD
         SEC
         SBC   #$0005
         BPL   L1951C7
         BRL   L1952AE
L1951C7  CMP   #$000B
         BMI   L1951CF
         BRL   L1952AE
L1951CF  ASL
         TAX
         LDAL  L1951D7,X
         PHA
         RTS

L1951D7  DA    L1951ED-1
         DA    L195223-1
         DA    L19522E-1
         DA    L195248-1
         DA    L195262-1
         DA    L1952AE-1
         DA    L1952AE-1
         DA    L1952AE-1
         DA    L19527C-1
         DA    L195291-1
         DA    L1952A6-1

L1951ED  PHY
         PEA   ^L052D42
         PEA   L052D42
         PEI   $EB
         JSL   L192B84
         PLA
         LSR
         BCC   L195220
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L07D585
         PLA
         LSR
         BCS   L19521C
         PEA   $000E
         JSL   L0727E0
L19521C  JSL   L14174B
L195220  BRL   L1952AE
L195223  PEI   $DF
         PEI   $EB
         JSL   L193996
         BRL   L1952AE
L19522E  LDA   $EB
         BEQ   L195246
         LDA   $E7
         EOR   #$0001
         STA   $E7
         PEI   $E7
         PEI   $F1
         PEI   $EF
         PEA   $0007
         JSL   L073B05
L195246  BRA   L1952AE
L195248  LDA   $EB
         BEQ   L195260
         LDA   $E9
         EOR   #$0001
         STA   $E9
         PEI   $E9
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
L195260  BRA   L1952AE
L195262  LDA   $EB
         BEQ   L19527A
         LDA   $E5
         EOR   #$0001
         STA   $E5
         PEI   $E5
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
L19527A  BRA   L1952AE
L19527C  PHY
         PEI   $F1
         PEI   $EF
         PEA   $000D
         JSL   L072B6B
         PLA
         SEC
         SBC   #$0514
         STA   $DF
         BRA   L1952AE
L195291  PHY
         PEI   $F1
         PEI   $EF
         PEA   $000E
         JSL   L072B6B
         PLA
         SEC
         SBC   #$0578
         STA   $E1
         BRA   L1952AE
L1952A6  PEI   $EB
         JSL   L0A1639
L1952AC
*  BRA   L1952AE
L1952AE  LDA   $DD
         SEC
         SBC   #$0001
         BVS   L1952B9
         EOR   #$8000
L1952B9  BMI   L1952C0
         LDA   #$0000
         BRA   L1952C3
L1952C0  LDA   #$0001
L1952C3  PHA
         LDA   $DD
         SEC
         SBC   #$0004
         BEQ   L1952D8
         BVS   L1952D1
         EOR   #$8000
L1952D1  BPL   L1952D8
         LDA   #$0000
         BRA   L1952DB
L1952D8  LDA   #$0001
L1952DB  AND   $01,S
         PLX
         LSR
         BCS   L1952E4
         BRL   L1951B1
L1952E4  LDA   $DD
         DEC
         DEC
         BNE   L1952ED
         BRL   L1953F9
L1952ED  TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L0313BE
         LDA   $DF
         ORA   $E3
         STA   $C1
         LDA   $E7
         BEQ   L195314
         LDA   #$2000
         ORA   $C1
         STA   $C1
L195314  LDA   $E9
         BEQ   L19531F
         LDA   #$8000
         ORA   $C1
         STA   $C1
L19531F  LDA   #$0001
         STA   $B7
         LDA   $E5
         BEQ   L19532F
         LDA   #$4000
         ORA   $B7
         STA   $B7
L19532F  LDA   $E1
         ASL
         ASL
         ASL
         ASL
         ORA   $B7
         STA   $B7
         PHY
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L070A10
         PLA
         LSR
         BCS   L195378
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCS   L195378
         PEA   $000E
         JSL   L0727E0
         BRL   L1953F9
L195378  PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         PEI   $F1
         PEI   $EF
         PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE77
         PHA
         JSL   L071169
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF77
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE77
         PHA
         JSL   L150434
         PLA
         LSR
         BCC   L1953F9
         LDA   $EB
         BEQ   L1953E9
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE77
         PHA
         JSL   L07D64A
         PLA
         LSR
         BCS   L1953E7
         PEA   $000E
         JSL   L0727E0
L1953E7  BRA   L1953F9
L1953E9  LDA   #$0001
         STA   L054FB3
         JSL   L0903A6
         STZ   L054FB3
         BRL   L19517C
L1953F9  PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $ED
         JSL   L0724F7
         PEA   ^L052D38
         PEA   L052D38
         JSL   L086CDB
         LDA   #$0003
         CMP   $DD
         BNE   L19542A
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L0B838F
L19542A  LDA   #$0004
         CMP   $DD
         BNE   L195435
         JSL   L19693F
L195435  TSC
         CLC
         ADC   #$0388
         TCS
         PLD
         RTL

L19543D  ENT
         PHD
         TSC
         CLC
         ADC   #$FA58
         TCS
         ADC   #$04B1
         TCD
         LDA   L05522F
         PHA
         PHY
         JSL   L099DCE
         PLA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L195462
         INX
L195462  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L19547E
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L0B8207
         BRL   L19595C
         BRL   L19592E
L19547E  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L19549B
         BRL   L19595C
L19549B  LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         TXY
         LDX   #$FC7B
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FC7B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L1954BC
         INX
L1954BC  STA   $F3
         STX   $F5
         LDA   #$4000
         AND   [$F3]
         BEQ   L1954CA
         LDA   #$0001
L1954CA  STA   $E3
         LDX   #$FC7B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L1954DC
         INX
L1954DC  STA   $F3
         STX   $F5
         LDA   #$0800
         AND   [$F3]
         BEQ   L1954EA
         LDA   #$0001
L1954EA  STA   $E1
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
         LDA   L055051
         EOR   #$0001
         ORA   L055243
         STA   $E5
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FB77
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FC63
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FC63
         PHA
         PHY
         PHY
         JSL   L07B114
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FB63
         PHA
         PEA   $0014
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FB4F
         PHA
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FC7F
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FC63
         PHA
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1955D6
         DEX
L1955D6  PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FC63
         PHA
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L19560F
         DEX
L19560F  PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7F
         PHA
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         JSL   L073C22
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         PHY
         PEA   $012C
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7F
         PHA
         JSL   L073A7B
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L19568C
         EOR   #$8000
L19568C  BMI   L1956A5
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000A
         JSL   L151367
         JSL   L150B10
L1956A5  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L1956B1
         EOR   #$8000
L1956B1  BMI   L1956CA
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000B
         JSL   L151367
         JSL   L150B10
L1956CA  PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
         PEI   $E1
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
L1956E4  PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7F
         PHA
         JSL   L073A7B
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $F1
         PEI   $EF
         JSL   L15102F
L195711  LDA   $EB
         STA   $EB
         PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $EB
         LDA   $E5
         BEQ   L19575A
         LDA   #$0008
         CMP   $EB
         BNE   L19573F
         LDA   $E3
         EOR   #$0001
         STA   $E3
         PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
L19573F  LDA   #$0009
         CMP   $EB
         BNE   L19575A
         LDA   $E1
         EOR   #$0001
         STA   $E1
         PEI   $E1
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
L19575A  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L195766
         EOR   #$8000
L195766  BMI   L19576D
         LDA   #$0000
         BRA   L195770
L19576D  LDA   #$0001
L195770  PHA
         LDX   #$0000
         LDA   #$000B
         CMP   $EB
         BNE   L19577C
         INX
L19577C  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1957B4
         PEA   $0001
         PEI   $E5
         JSL   L1901D8
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7F
         PHA
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         JSL   L073C22
L1957B4  LDX   #$0000
         LDA   $EB
         DEC
         BNE   L1957BD
         INX
L1957BD  PHX
         LDX   #$0000
         LDA   $EB
         DEC
         DEC
         BNE   L1957C8
         INX
L1957C8  TXA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$000A
         CMP   $EB
         BNE   L1957D8
         INX
L1957D8  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L1957E2
         BRL   L195711
L1957E2  LDA   $EB
         DEC
         DEC
         BNE   L1957EB
         BRL   L195920
L1957EB  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L19580F
         PEA   $0042
         JSL   L0727E0
         BRL   L195920
L19580F  STZ   $DF
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         TXY
         LDX   #$FC77
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FC77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L195832
         INX
L195832  STA   $F3
         STX   $F5
         LDA   #$4000
         AND   [$F3]
         BEQ   L195840
         LDA   #$0001
L195840  CMP   $E3
         BEQ   L19584B
         LDA   #$4000
         ORA   $DF
         STA   $DF
L19584B  LDX   #$FC77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L19585B
         INX
L19585B  STA   $F3
         STX   $F5
         LDA   #$0800
         AND   [$F3]
         BEQ   L195869
         LDA   #$0001
L195869  CMP   $E1
         BEQ   L195874
         LDA   #$0800
         ORA   $DF
         STA   $DF
L195874  LDX   #$FC77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L195884
         INX
L195884  PHX
         PHA
         LDX   #$FC77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L195896
         INX
L195896  STA   $F3
         STX   $F5
         LDA   $DF
         EOR   [$F3]
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   $DF
         BEQ   L1958B5
         LDA   #$0001
L1958B5  PHA
         JSL   L074A90
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FD7F
         PHA
         JSL   L071169
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD7F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7F
         PHA
         JSL   L150434
         PLA
         LSR
         BCC   L195920
         LDA   $E5
         BEQ   L195910
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD7F
         PHA
         JSL   L07D20B
         PLA
         LSR
         BCS   L19590E
         PEA   $0042
         JSL   L0727E0
L19590E  BRA   L195920
L195910  LDA   #$0001
         STA   L054FB3
         JSL   L0903A6
         STZ   L054FB3
         BRL   L1956E4
L195920  PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $ED
         JSL   L0724F7
L19592E  LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L19593A
         INX
L19593A  PHX
         LDX   #$0000
         LDA   #$000A
         CMP   $EB
         BNE   L195946
         INX
L195946  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L19595C
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L0B8207
L19595C  TSC
         CLC
         ADC   #$05A8
         TCS
         PLD
         RTL

L195964  ENT
         PHD
         TSC
         CLC
         ADC   #$FC96
         TCS
         ADC   #$0273
         TCD
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L08273B
         LDA   L05511F
         BEQ   L1959CF
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   ^L05328B
         PEA   L05328B
         PEA   $002A
         JSL   L0313BE
         LDA   L055129
         LDX   L05512B
         STA   $D7
         STX   $D9
         PEA   $0001
         JSL   L09091E
         PEA   $0003
         JSL   L090635
         PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         LDA   $D7
         LDX   $D9
         STA   L0551F5
         STX   L0551F7
L1959CF  LDX   #$0000
         LDAL  L052D34
         BNE   L1959D9
         INX
L1959D9  PHX
         LDX   #$0000
         LDAL  L052D36
         AND   #$000F
         DEC
         DEC
         BEQ   L1959E9
         INX
L1959E9  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1959FA
         PEA   $002A
         JSL   L0727E0
         BRL   L195FC5
L1959FA  LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L195A08
         CPX   L0551F7
L195A08  BNE   L195A2C
         TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD8D
         PHA
         PEA   $001D
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         BRA   L195A4C
L195A2C  TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD8D
         PHA
         PEA   $001C
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
L195A4C  LDA   L05522F
         PHA
         PHY
         JSL   L099DCE
         PLA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L195A66
         INX
L195A66  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L195A82
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L0B838F
         BRL   L195FC5
L195A82  LDA   L055051
         EOR   #$0001
         ORA   L055243
         STA   $EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD8D
         PHA
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L07ACF0
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE79
         PHA
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L195AE8
         DEX
L195AE8  PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE65
         PHA
         LDAL  L052D34
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04021D
         PEA   L04021D
         JSL   L073C22
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         PHY
         PEA   $00C8
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L195B32
         EOR   #$8000
L195B32  BMI   L195B4B
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $0003
         JSL   L151367
         JSL   L150B10
L195B4B  LDA   $EB
         BNE   L195BC2
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000E
         JSL   L151367
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         TXY
         LDX   #$FE8D
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE8D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L195B86
         INX
L195B86  PHX
         PHA
         PHY
         PHY
         LDX   #$FE8D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L195B9A
         INX
L195B9A  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         PEA   $8000
         PEA   $0000
         JSL   L150241
         PLA
         PLY
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         TYA
         LDY   #$0002
         STA   [$F3],Y
L195BC2  LDAL  L052D40
         AND   #$1000
         BEQ   L195BCE
         LDA   #$0001
L195BCE  STA   $E9
         PEI   $E9
         PEI   $F1
         PEI   $EF
         PEA   $0006
         JSL   L073B05
         LDAL  L052D40
         AND   #$4000
         BEQ   L195BE9
         LDA   #$0001
L195BE9  STA   $E7
         PEI   $E7
         PEI   $F1
         PEI   $EF
         PEA   $0007
         JSL   L073B05
         LDAL  L052D40
         AND   #$2000
         BEQ   L195C04
         LDA   #$0001
L195C04  STA   $E5
         PEI   $E5
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
         LDAL  L052D40
         AND   #$8000
         BEQ   L195C1F
         LDA   #$0001
L195C1F  STA   $E3
         PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
         LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L195C3C
         CPX   L0551F7
L195C3C  BEQ   L195C59
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000F
         JSL   L151367
         JSL   L150B10
         STZ   $DF
         BRA   L195C67
L195C59  LDAL  L052D36
         AND   #$4000
         BEQ   L195C65
         LDA   #$0001
L195C65  STA   $DF
L195C67  PEI   $DF
         PEI   $F1
         PEI   $EF
         PEA   $000F
         JSL   L073B05
         LDAL  L052D40
         AND   #$0800
         BEQ   L195C80
         LDA   #$0001
L195C80  STA   $E1
         LDA   $DF
         ORA   $E1
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $000A
         JSL   L073B05
         LDAL  L052D40
         AND   #$000F
         STA   $DD
         LDA   #$0578
         CLC
         ADC   $DD
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $000E
         JSL   L073B05
L195CAD  PEI   $F1
         PEI   $EF
         PEA   $000D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         JSL   L073A7B
         PEI   $F1
         PEI   $EF
         PEA   $000D
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $F1
         PEI   $EF
         JSL   L15102F
         PEI   $F1
         PEI   $EF
         JSL   L151131
L195CE2  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $DB
         LDA   $DB
         SEC
         SBC   #$0005
         BEQ   L195D01
         BVS   L195CFA
         EOR   #$8000
L195CFA  BPL   L195D01
         LDA   #$0000
         BRA   L195D04
L195D01  LDA   #$0001
L195D04  ORA   $EB
         BNE   L195D0B
         BRL   L195E04
L195D0B  LDA   $DB
         SEC
         SBC   #$0004
         BPL   L195D16
         BRL   L195E04
L195D16  CMP   #$000C
         BMI   L195D1E
         BRL   L195E04
L195D1E  ASL
         TAX
         LDAL  L195D26,X
         PHA
         RTS

L195D26  DA    L195D3E-1
         DA    L195D47-1
         DA    L195D52-1
         DA    L195D69-1
         DA    L195D80-1
         DA    L195D96-1
         DA    L195DAC-1
         DA    L195E04-1
         DA    L195E04-1
         DA    L195E04-1
         DA    L195DC9-1
         DA    L195DDE-1

L195D3E  PEI   $EB
         JSL   L0A1639
         BRL   L195E04
L195D47  PEI   $DD
         PEI   $EB
         JSL   L1944F9
         BRL   L195E04
L195D52  LDA   $E9
         EOR   #$0001
         STA   $E9
         PEI   $E9
         PEI   $F1
         PEI   $EF
         PEA   $0006
         JSL   L073B05
         BRL   L195E04
L195D69  LDA   $E7
         EOR   #$0001
         STA   $E7
         PEI   $E7
         PEI   $F1
         PEI   $EF
         PEA   $0007
         JSL   L073B05
         BRL   L195E04
L195D80  LDA   $E5
         EOR   #$0001
         STA   $E5
         PEI   $E5
         PEI   $F1
         PEI   $EF
         PEA   $0008
         JSL   L073B05
         BRA   L195E04
L195D96  LDA   $E3
         EOR   #$0001
         STA   $E3
         PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0009
         JSL   L073B05
         BRA   L195E04
L195DAC  LDA   $DF
         BNE   L195DC7
         LDA   $E1
         EOR   #$0001
         STA   $E1
         LDA   $DF
         ORA   $E1
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $000A
         JSL   L073B05
L195DC7  BRA   L195E04
L195DC9  PHY
         PEI   $F1
         PEI   $EF
         PEA   $000E
         JSL   L072B6B
         PLA
         SEC
         SBC   #$0578
         STA   $DD
         BRA   L195E04
L195DDE  LDA   $DF
         EOR   #$0001
         STA   $DF
         PEI   $DF
         PEI   $F1
         PEI   $EF
         PEA   $000F
         JSL   L073B05
         LDA   $DF
         ORA   $E1
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $000A
         JSL   L073B05
L195E02  BRA   L195E04
L195E04  LDA   $DB
         SEC
         SBC   #$0001
         BVS   L195E0F
         EOR   #$8000
L195E0F  BMI   L195E16
         LDA   #$0000
         BRA   L195E19
L195E16  LDA   #$0001
L195E19  PHA
         LDA   $DB
         SEC
         SBC   #$0003
         BEQ   L195E2E
         BVS   L195E27
         EOR   #$8000
L195E27  BPL   L195E2E
         LDA   #$0000
         BRA   L195E31
L195E2E  LDA   #$0001
L195E31  AND   $01,S
         PLX
         LSR
         BCS   L195E3A
         BRL   L195CE2
L195E3A  LDA   $DB
         DEC
         DEC
         BNE   L195E43
         BRL   L195F91
L195E43  TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L0313BE
         LDA   $DD
         STA   $B3
         TDC
         CLC
         ADC   #$00AB
         PEA   $0000
         PHA
         PEI   $DD
         JSL   L08567B
         TDC
         CLC
         ADC   #$00AB
         PEA   $0000
         PHA
         PEA   ^L052D38
         PEA   L052D38
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L081E5F
         LDA   $E9
         BEQ   L195E93
         LDA   #$1000
         ORA   $B3
         STA   $B3
L195E93  LDA   $E7
         BEQ   L195E9E
         LDA   #$4000
         ORA   $B3
         STA   $B3
L195E9E  LDA   $E5
         BEQ   L195EA9
         LDA   #$2000
         ORA   $B3
         STA   $B3
L195EA9  LDA   $E3
         BEQ   L195EB4
         LDA   #$8000
         ORA   $B3
         STA   $B3
L195EB4  LDA   $E1
         BEQ   L195EBF
         LDA   #$0800
         ORA   $B3
         STA   $B3
L195EBF  LDA   #$BFFF
         AND   $A9
         STA   $A9
         LDA   $DF
         BEQ   L195ED1
         LDA   #$4000
         ORA   $A9
         STA   $A9
L195ED1  PHY
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L070A10
         PLA
         LSR
         BCS   L195F10
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCS   L195F10
         PEA   $000E
         JSL   L0727E0
         BRL   L195F91
L195F10  PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         PEI   $F1
         PEI   $EF
         PEA   $000D
         PEA   $0000
         TDC
         CLC
         ADC   #$FE91
         PHA
         JSL   L071169
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF91
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE91
         PHA
         JSL   L150434
         PLA
         LSR
         BCC   L195F91
         LDA   $EB
         BEQ   L195F81
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE91
         PHA
         JSL   L07D64A
         PLA
         LSR
         BCS   L195F7F
         PEA   $000E
         JSL   L0727E0
L195F7F  BRA   L195F91
L195F81  LDA   #$0001
         STA   L054FB3
         JSL   L0903A6
         STZ   L054FB3
         BRL   L195CAD
L195F91  PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $ED
         JSL   L0724F7
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L086CDB
         LDA   #$0003
         CMP   $DB
         BNE   L195FC5
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L0B838F
L195FC5  TSC
         CLC
         ADC   #$036A
         TCS
         PLD
         RTL

L195FCD  ENT
         PHD
         TSC
         CLC
         ADC   #$FB6C
         TCS
         ADC   #$039D
         TCD
         LDA   L05522F
         PHA
         PHY
         JSL   L099DCE
         PLA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L195FF2
         INX
L195FF2  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L196003
         JSL   L0B8549
         BRL   L196375
         BRL   L196352
L196003  STZ   $E7
         STZ   $E9
         LDA   L05503D
         BEQ   L19602B
         PHY
         PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         JSL   L075B7B
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDAL  L05565D
         BEQ   L19602B
         STZ   $E7
         STZ   $E9
L19602B  TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4F
         PHA
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4F
         PHA
         LDAL  L053AC3
         PHA
         LDAL  L053AC1
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0083
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4F
         PHA
         PEI   $E9
         PEI   $E7
         LDAL  L053AB3
         TAX
         LDAL  L053AB1
         JSL   L150F53
         CLC
         ADC   #$03FF
         BCC   L1960A3
         INX
L1960A3  PHX
         PHA
         PEA   $0000
         PEA   $0400
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0063
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4F
         PHA
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         CLC
         ADC   #$03FF
         BCC   L1960E2
         INX
L1960E2  PHX
         PHA
         PEA   $0000
         PEA   $0400
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0083
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0063
         PEA   $0000
         PHA
         JSL   L073C22
         PEA   $0000
         TDC
         CLC
         ADC   #$FF63
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FC63
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FD63
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FC63
         PHA
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         LDAL  L0540DF
         TAX
         LDAL  L0540DD
         STA   $E3
         STX   $E5
         LDX   #$0000
         TDC
         CLC
         ADC   #$FD63
         STAL  L0540DD
         TXA
         STAL  L0540DF
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         PHY
         PEA   $01F4
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $F1
         PEI   $EF
         PEA   $0005
         JSL   L073D2E
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L1961BD
         EOR   #$8000
L1961BD  BMI   L1961D6
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000A
         JSL   L151367
         JSL   L150B10
L1961D6  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L1961E2
         EOR   #$8000
L1961E2  BMI   L1961FB
         PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $000C
         JSL   L151367
         JSL   L150B10
L1961FB  PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FF63
         PHA
         JSL   L073A7B
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $F1
         PEI   $EF
         JSL   L15102F
         PEI   $F1
         PEI   $EF
         JSL   L151131
L196230  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $EB
         LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L196247
         EOR   #$8000
L196247  BMI   L19624E
         LDA   #$0000
         BRA   L196251
L19624E  LDA   #$0001
L196251  PHA
         LDX   #$0000
         LDA   #$000C
         CMP   $EB
         BNE   L19625D
         INX
L19625D  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L19629A
         PEA   $0003
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L1901D8
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0083
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0063
         PEA   $0000
         PHA
         JSL   L073C22
L19629A  LDX   #$0000
         LDA   $EB
         DEC
         BNE   L1962A3
         INX
L1962A3  PHX
         LDX   #$0000
         LDA   $EB
         DEC
         DEC
         BNE   L1962AE
         INX
L1962AE  TXA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$000A
         CMP   $EB
         BNE   L1962BE
         INX
L1962BE  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L1962C8
         BRL   L196230
L1962C8  LDA   $EB
         DEC
         DEC
         BEQ   L196337
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FE63
         PHA
         JSL   L071169
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE63
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF63
         PHA
         JSL   L150434
         PLA
         LSR
         BCC   L196337
         LDA   L055051
         BEQ   L196314
         LDA   #$0001
         STA   L054FB3
         JSL   L0903A6
         STZ   L054FB3
         BRL   L1961FB
         BRA   L196337
L196314  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FE63
         PHA
         JSL   L0782F1
         PLA
         LSR
         BCS   L196337
         PHY
         PEA   $1000
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $EB
         BRL   L1961FB
L196337  PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $ED
         JSL   L0724F7
         LDA   $E3
         LDX   $E5
         STAL  L0540DD
         TXA
         STAL  L0540DF
L196352  LDX   #$0000
         LDA   #$0005
         CMP   L0551FB
         BNE   L19635E
         INX
L19635E  PHX
         LDX   #$0000
         LDA   #$000A
         CMP   $EB
         BNE   L19636A
         INX
L19636A  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L196375
         JSL   L0B8549
L196375  TSC
         CLC
         ADC   #$0494
         TCS
         PLD
         RTL

L19637D  PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         LDA   $1C
         BPL   L19638C
         BRL   L196442
L19638C  BNE   L196391
         BRL   L196442
L196391  LDA   $1C
         DEC
         PHA
         PEA   $0007
         JSL   L1500F5
         PLX
         PLX
         STA   $01
         LDA   $01
         SEC
         SBC   L05541D
         INC
         STA   $01
         LDA   $01
         SEC
         SBC   #$FFFF
         BEQ   L1963B8
         BVS   L1963B6
         EOR   #$8000
L1963B6  BMI   L1963BD
L1963B8  LDA   #$0000
         BRA   L1963C0
L1963BD  LDA   #$0001
L1963C0  PHA
         LDA   $01
         SEC
         SBC   #$0004
         BVS   L1963CC
         EOR   #$8000
L1963CC  BPL   L1963D3
         LDA   #$0000
         BRA   L1963D6
L1963D3  LDA   #$0001
L1963D6  AND   $01,S
         PLX
         LSR
         BCC   L196442
         LDA   $01
         PEA   $001C
         JSL   L150BEE
         PLA
         STA   $03
         LDA   $1C
         DEC
         PHA
         PEA   $0007
         JSL   L150318
         PLX
         PLX
         PEA   $0044
         JSL   L150BEE
         PLA
         STA   $05
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEI   $05
         PEI   $03
         LDA   #$0044
         CLC
         ADC   $05
         PHA
         LDA   #$001C
         CLC
         ADC   $03
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         LDAL  L050002
         PHA
         LDAL  L050000
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L151418
L196442  LDA   $16
         STA   $1C
         LDA   $15
         STA   $1B
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L196454  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0002
         JSL   L150BD6
         PEA   $0004
         PEA   $0002
         JSL   L151083
         PEA   $FFFF
         JSL   L081DD8
         LDA   L055419
         PHA
         PEA   $0000
         PHD
         JSL   L19637D
         LDA   L055417
         PHA
         PEA   $0000
         PHD
         JSL   L19637D
         LDA   L055417
         STA   L055419
         PEA   $0000
         JSL   L150BD6
         PEA   $0001
         PEA   $0001
         JSL   L151083
         PEA   $0000
         JSL   L081DD8
         PLY
         PLY
         PLD
         RTL

L1964AE  PHD
         TSC
         CLC
         ADC   #$FDF2
         TCS
         ADC   #$011B
         TCD
         PHY
         PHY
         PEA   $189C
         JSL   L072834
         PLA
         STA   $EB
         PLX
         STX   $ED
         PEI   $ED
         PEI   $EB
         PEA   $0004
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEI   $ED
         PEI   $EB
         JSL   L15102F
L1964E1  STZ   $E7
         PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $E9
         LDA   $E9
         DEC
         BEQ   L1964F6
         BRL   L19658F
L1964F6  PEI   $ED
         PEI   $EB
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         JSL   L071169
         PEI   $ED
         PEI   $EB
         PEA   $0006
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         JSL   L071169
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L19657D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         JSL   L0714B3
         LDA   #$00E9
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L196551
         INX
L196551  STA   $EF
         STX   $F1
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE6
         PHA
         LDA   #$00FF
         LDX   #$FFE5
         AND   $00,X
         PHA
         JSL   L073FDF
         PLA
         STA   [$EF]
         PLA
         LDY   #$0002
         STA   [$EF],Y
         LDA   #$0001
         STA   $E7
         BRA   L19658D
L19657D  LDA   #$0001
         STA   L054FB3
         PEA   $000B
         JSL   L0727E0
         STZ   L054FB3
L19658D  BRA   L1965A9
L19658F  LDA   #$0007
         CMP   $E9
         BNE   L1965A9
         LDA   #$0000
         TAX
         LDY   #$00E9
         STA   [$F8],Y
         INY
         INY
         TXA
         STA   [$F8],Y
         LDA   #$0001
         STA   $E7
L1965A9  LDX   #$0000
         LDA   $E9
         DEC
         DEC
         BNE   L1965B3
         INX
L1965B3  TXA
         ORA   $E7
         BNE   L1965BB
         BRL   L1964E1
L1965BB  PEI   $ED
         PEI   $EB
         JSL   L072634
         JSL   L09AFB1
         LDA   $E7
         BEQ   L1965FB
         LDY   #$00EB
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   L055049
         STX   L05504B
         PHY
         PHY
         LDA   #$00E9
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L1965E8
         INX
L1965E8  PHX
         PHA
         PEA   $0004
         JSL   L073FDF
         PLA
         STAL  L053AE1
         PLA
         STAL  L053AE3
L1965FB  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0214
         TCS
         RTL

L19660D  ENT
         PHD
         TSC
         CLC
         ADC   #$F8E6
         TCS
         ADC   #$0623
         TCD
         PHY
         JSL   L0727BF
         PLA
         STA   $DD
         PEA   $0000
         TDC
         CLC
         ADC   #$F9DD
         PHA
         PEA   ^L053A9D
         PEA   L053A9D
         PEA   $0600
         JSL   L0313BE
         LDAL  L053AE1
         ORAL  L053AE3
         BNE   L196643
         BRL   L1966FC
L196643  PHY
         PHY
         PEA   $1838
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $F1
         PEI   $EF
         JSL   L15102F
L19665A  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $ED
         LDX   #$0000
         LDA   $ED
         DEC
         BNE   L19666E
         INX
L19666E  PHX
         LDX   #$0000
         LDA   $ED
         DEC
         DEC
         BNE   L196679
         INX
L196679  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L19665A
         PEI   $F1
         PEI   $EF
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDD
         PHA
         JSL   L071169
         PEI   $F1
         PEI   $EF
         JSL   L072634
         LDA   $ED
         DEC
         BNE   L1966CE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDD
         PHA
         JSL   L0714B3
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDE
         PHA
         LDA   #$00FF
         LDX   #$FFDD
         AND   $00,X
         PHA
         JSL   L073FDF
         PLA
         STA   $E9
         PLX
         STX   $EB
         BRA   L1966D1
L1966CE  BRL   L196937
L1966D1  PHY
         PHY
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0004
         JSL   L073FDF
         PLA
         PLX
         CMPL  L053AE1
         BNE   L1966F0
         TXA
         CMPL  L053AE3
L1966F0  BEQ   L1966FC
         PEA   $0037
         JSL   L0727E0
         BRL   L196937
L1966FC  LDA   L055051
         STA   $E7
         LDA   #$4000
         ANDL  L053AE9
         BEQ   L19670D
         LDA   #$0001
L19670D  STA   $E5
         LDA   #$2000
         ANDL  L053AE9
         BEQ   L19671B
         LDA   #$0001
L19671B  STA   $E3
         LDAL  L053AE5
         STA   $E1
         PHY
         PHY
         PEA   $17D4
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $E7
         PEI   $F1
         PEI   $EF
         PEA   $0005
         JSL   L073B05
         PEI   $E5
         PEI   $F1
         PEI   $EF
         PEA   $0006
         JSL   L073B05
         PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0007
         JSL   L073B05
         PEA   $0001
         PEI   $F1
         PEI   $EF
         LDA   #$0007
         CLC
         ADC   $E1
         PHA
         JSL   L073B05
         LDA   L05504F
         BEQ   L196799
         LDA   #$0005
         STA   $ED
L196775  PEA   $00FF
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         LDA   $ED
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L150B10
         LDA   #$000D
         CMP   $ED
         BEQ   L196799
         INC   $ED
         BRA   L196775
L196799  PEI   $F1
         PEI   $EF
         JSL   L15102F
L1967A1  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $ED
         LDA   L05504F
         BNE   L19682F
         LDA   $ED
         SEC
         SBC   #$0005
         BMI   L19682F
         CMP   #$0008
         BPL   L19682F
         ASL
         TAX
         LDAL  L1967C6,X
         PHA
         RTS

L1967C6  DA    L1967ED-1
         DA    L196803-1
         DA    L196819-1
         DA    L1967D6-1
         DA    L1967D6-1
         DA    L1967D6-1
         DA    L1967D6-1
         DA    L1967D6-1

L1967D6  LDA   $ED
         SEC
         SBC   #$0007
         STA   $E1
         PEA   $0001
         PEI   $F1
         PEI   $EF
         PEI   $ED
         JSL   L073B05
         BRA   L19682F
L1967ED  LDA   $E7
         EOR   #$0001
         STA   $E7
         PEI   $E7
         PEI   $F1
         PEI   $EF
         PEA   $0005
         JSL   L073B05
         BRA   L19682F
L196803  LDA   $E5
         EOR   #$0001
         STA   $E5
         PEI   $E5
         PEI   $F1
         PEI   $EF
         PEA   $0006
         JSL   L073B05
         BRA   L19682F
L196819  LDA   $E3
         EOR   #$0001
         STA   $E3
         PEI   $E3
         PEI   $F1
         PEI   $EF
         PEA   $0007
         JSL   L073B05
         BRA   L19682F
L19682F  LDX   #$0000
         LDA   $ED
         DEC
         BNE   L196838
         INX
L196838  PHX
         LDX   #$0000
         LDA   $ED
         DEC
         DEC
         BNE   L196843
         INX
L196843  TXA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$000D
         CMP   $ED
         BNE   L196853
         INX
L196853  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L19685D
         BRL   L1967A1
L19685D  PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $DD
         JSL   L0724F7
         JSL   L09AFB1
         LDX   #$0000
         LDA   $ED
         DEC
         DEC
         BNE   L196879
         INX
L196879  TXA
         ORA   L05504F
         BEQ   L196882
         BRL   L196937
L196882  LDX   #$0000
         LDA   #$000D
         CMP   $ED
         BNE   L19688D
         INX
L19688D  PHX
         LDX   #$0000
         LDAL  L053AE1
         ORAL  L053AE3
         BNE   L19689C
         INX
L19689C  TXA
         AND   $E3
         ORA   $01,S
         PLX
         LSR
         BCC   L1968AD
         PEA   $0000
         PHD
         JSL   L1964AE
L1968AD  LDAL  L053AE1
         ORAL  L053AE3
         BNE   L1968B9
         STZ   $E3
L1968B9  LDA   #$1FFF
         ANDL  L053AE9
         STAL  L053AE9
         LDA   $E7
         BEQ   L1968D3
         LDA   #$8000
         ORAL  L053AE9
         STAL  L053AE9
L1968D3  LDA   $E5
         BEQ   L1968E2
         LDA   #$4000
         ORAL  L053AE9
         STAL  L053AE9
L1968E2  LDA   $E3
         BEQ   L1968F1
         LDA   #$2000
         ORAL  L053AE9
         STAL  L053AE9
L1968F1  LDA   $E1
         STAL  L053AE5
         PHY
         PEA   ^L053A9D
         PEA   L053A9D
         PEA   $0000
         TDC
         CLC
         ADC   #$F9DD
         PHA
         PEA   $0600
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $DF
         LDA   $E9
         LDX   $EB
         STAL  L053AA9
         TXA
         STAL  L053AAB
         LDA   $DF
         BEQ   L196929
         JSL   L078CA4
L196929  PEI   $E7
         JSL   L09992C
         LDA   L0551F9
         PHA
         JSL   L099CDB
L196937  TSC
         CLC
         ADC   #$071A
         TCS
         PLD
         RTL

L19693F  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L055051
         BEQ   L19694F
         BRL   L1969DE
L19694F  LDAL  L052D34
         BNE   L196958
         BRL   L1969DE
L196958  PHY
         JSL   L0A2112
         PLA
         LSR
         BCS   L196963
         BRA   L1969DE
L196963  PEA   ^L050036
         PEA   L050036
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L0313BE
         LDA   L0551F5
         LDX   L0551F7
         STA   L055437
         STX   L055439
         LDA   L055027
         LDX   L055029
         STA   L055433
         STX   L055435
         LDA   L055039
         LDX   L05503B
         STA   L05542F
         STX   L055431
         PHY
         PHY
         PEA   ^L040D42
         PEA   L040D42
         JSL   L15027E
         PLA
         STA   L05542B
         PLA
         STA   L05542D
         PHY
         PHY
         LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         PEA   $0003
         PEA   ^L040D66
         PEA   L040D66
         JSL   L15163F
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         JSL   L15102F
         PEA   $0001
         JSL   L090635
L1969DE  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

