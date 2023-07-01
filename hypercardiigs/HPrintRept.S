*
* HypercardGS
* segment: $23 HPrintRept
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintRept.l
         lst   off

*---------------------------------------

         use   HPrintRept.X

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

L230000  ENT
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
L230020  DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
         DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
         DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
         DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
L230030  DB    $33
         DB    $33
         DB    $CC
         DB    $CC
         DB    $33
         DB    $33
         DB    $CC
         DB    $CC
         DB    $33
         DB    $33
         DB    $CC
         DB    $CC
         DB    $33
         DB    $33
         DB    $CC
         DB    $CC
L230040  DB    $FF
         DB    $F0
         DB    $FF
         DB    $0F
         DB    $F0
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $0F
         DB    $F0
         DB    $FF
         DB    $0F
         DB    $FF
L230050  DB    $FF
         DB    $F3
         DB    $FF
         DB    $3F
         DB    $F3
         DB    $FF
         DB    $3F
         DB    $FF
         DB    $FF
         DB    $F3
         DB    $FF
         DB    $3F
         DB    $F3
         DB    $FF
         DB    $3F
         DB    $FF
L230060  DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
L230070  DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
         DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
         DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
         DB    $3F
         DB    $3F
         DB    $F3
         DB    $F3
L230080  DB    $3F
         DB    $FF
         DB    $FF
         DB    $3F
         DB    $3F
         DB    $FF
         DB    $FF
         DB    $3F
         DB    $3F
         DB    $FF
         DB    $FF
         DB    $3F
         DB    $3F
         DB    $FF
         DB    $FF
         DB    $3F
L230090  DW    $0000
         DW    $045B
         DW    $0000
         ADRL  L2300A2
         ADRL  L2300A6
         ADRL  L2300B4
L2300A2  DW    $0000
         DW    $0000
L2300A6  DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L2300C2
L2300B4  DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L2300CD
L2300C2  STR   'Field Font'
L2300CD  STR   'Other...'
L2300D6  HEX   08000C00FFFFFFFCFFBFF0007FFCFA7F
         HEX   FCEE7FFCBE7FFC001FFFFE7F
L2300F2  HEX   08000C00FFFFFFFCFFBFF0007FFCAA7F
         HEX   FC447FFCAA7FFC001FFFFE7F
L23010E  HEX   08000C00FFFFFF800007AAAAA7924927
         HEX   AAAAA7924927AAAAA7800007
	 
L23012A  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDA   $0A
         ORA   $0C
         BNE   L23013C
         INX
L23013C  PHX
         LDX   #$0000
         LDA   L055323
         ORA   L055325
         BNE   L230149
         INX
L230149  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L230154
         STZ   $0E
         BRA   L23017F
L230154  PHY
         LDY   #$0002
         LDA   [$0A],Y
         PHA
         LDA   [$0A]
         PHA
         LDA   L055323
         LDX   L055325
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         PEA   $0380
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $0E
L23017F  LDA   $08
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

L230190  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $28
         PEI   $26
         PEA   $0008
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $11
         LDA   $22
         LDX   $24
         STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15123D
         LDA   L055323
         LDX   L055325
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CMP   $22
         BNE   L2301E1
         CPX   $24
L2301E1  BEQ   L2301E8
         LDA   #$0000
         BRA   L2301EB
L2301E8  LDA   #$0001
L2301EB  STA   $13
         LDY   #$0006
         LDA   #$0080
         AND   [$01],Y
         CMP   #$0000
         BEQ   L230216
         LDA   $13
         BEQ   L23020A
         LDA   #L2300F2
         LDX   #^L2300F2
         STA   $0D
         STX   $0F
         BRA   L230214
L23020A  LDA   #L23010E
         LDX   #^L23010E
         STA   $0D
         STX   $0F
L230214  BRA   L230235
L230216  LDA   $13
         BEQ   L230226
         LDA   #L2300D6
         LDX   #^L2300D6
         STA   $0D
         STX   $0F
         BRA   L230235
L230226  PHY
         PHY
         PEA   $0002
         JSL   L085FE9
         PLA
         STA   $0D
         PLX
         STX   $0F
L230235  PEI   $0F
         PEI   $0D
         LDA   $07
         INC
         INC
         INC
         PHA
         PEI   $05
         JSL   L087218
         LDA   #$001C
         CLC
         ADC   $07
         PHA
         LDA   #$0008
         CLC
         ADC   $05
         PHA
         JSL   L1510C5
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L150592
         LDY   #$0004
         LDA   #$00FF
         AND   [$01],Y
         AND   #$0040
         BEQ   L2302A0
         PEA   ^L230030
         PEA   L230030
         JSL   L151198
         PEA   $8001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $0000
         JSL   L081DD8
         PEA   $0000
         JSL   L150BD6
         BRA   L2302BA
L2302A0  LDY   #$0004
         LDA   #$00FF
         AND   [$01],Y
         AND   #$0080
         BEQ   L2302BA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150383
L2302BA  PEI   $11
         JSL   L071AA4
         LDA   $1C
         STA   $28
         LDA   $1B
         STA   $27
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L2302D2  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEA   $0000
         PEA   $0380
         PEA   $0000
         PEA   $07D6
         JSL   L160A30
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L23031F
         LDA   L055323
         LDX   L055325
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEA   $0000
         PEA   $0380
         JSL   L070597
L23031F  LDA   $01
         LDX   $03
         STA   $0E
         STX   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L23032D  PHD
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
         BEQ   L230348
         LDA   #$0008
         STA   $09
         BRA   L23034D
L230348  LDA   #$0010
         STA   $09
L23034D  PHY
         PEI   $09
         LDY   #$0070
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L160A5A
         PLA
         LSR
         BCC   L2303BF
         PHY
         PEA   ^L0408C6
         PEA   L0408C6
         JSL   L160B56
         PLA
         LSR
         BCC   L2303BF
         PEI   $1A
         JSL   L160BAA
*         PEA   ^L160BAA
*         PEA   L160BAA
*         JSL   L07187A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$002D
         CLC
         ADC   $16
         LDX   $18
         BCC   L230396
         INX
L230396  PHX
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
L2303BF  PEI   $09
         LDY   #$0070
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

L2303E8  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         JSL   L233916
         PHY
         LDY   #$003B
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         JSL   L23012A
         PHY
         LDY   #$003F
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         JSL   L160BB8
         PLA
         ORA   $01,S
         PLX
         LSR
         BCC   L230458
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$002D
         CLC
         ADC   $12
         LDX   $14
         BCC   L23042F
         INX
L23042F  PHX
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
L230458  LDA   $10
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

L23046A  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$0063
         LDA   [$0A],Y
         BEQ   L230496
         PEA   $0001
         LDY   #$004F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0007
         JSL   L073B05
         LDA   #$0000
         LDY   #$0063
         STA   [$0A],Y
L230496  LDA   $08
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

L2304A7  PHD
         TSC
         CLC
         ADC   #$FDC8
         TCS
         ADC   #$0145
         TCD
         LDA   #$0001
         STA   $FC
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         PEA   $0000
         PEA   $001D
         JSL   L150D50
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   #$0035
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L2304DB
         INX
L2304DB  STA   $EF
         STX   $F1
         PHY
         PHY
         PEI   $ED
         PEI   $EB
         PEA   $03EA
         JSL   L160B9C
         PLA
         STA   [$EF]
         PLA
         LDY   #$0002
         STA   [$EF],Y
         LDY   #$0035
         LDA   [$F8],Y
         INY
         INY
         ORA   [$F8],Y
         BNE   L230503
         BRL   L2306D7
L230503  LDY   #$0037
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L0718BF
         LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   $DF
         STX   $E1
         LDY   #$0037
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
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         PEA   $0000
         PEA   $0009
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $E3
         STX   $E5
         LDA   #$0001
         LDX   #$0000
         STA   $E7
         STX   $E9
L23055E  PEI   $E9
         PEI   $E7
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         JSL   L033477
         BEQ   L23057B
         BVS   L230576
         EOR   #$8000
L230576  BPL   L23057B
         BRL   L2306D5
L23057B  TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         PEI   $E1
         PEI   $DF
         JSL   L07AA4B
         PEA   $0014
         JSL   L0313BE
         LDA   #$00FF
         AND   $BB
         BNE   L2305DD
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PHY
         PHY
         PEA   $083F
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA7
         PHA
         PEI   $E1
         PEI   $DF
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBB
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
L2305DD  LDA   #$00FF
         AND   $BB
         SEC
         SBC   #$0013
         BEQ   L2305F7
         BVS   L2305ED
         EOR   #$8000
L2305ED  BPL   L2305F7
         SEP   #$20
         LDA   #$13
         STA   $BB
         REP   #$20
L2305F7  PEI   $E5
         PEI   $E3
         LDX   $E9
         LDA   $E7
         BNE   L230602
         DEX
L230602  DEC
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $D7
         STX   $D9
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEI   $D9
         PEI   $D7
         PEA   $0000
         PEA   $0014
         JSL   L1511CE
         LDY   #$0037
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
         LDX   $E9
         LDA   $E7
         BNE   L23064D
         DEX
L23064D  DEC
         PEA   $0000
         PEA   $0009
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $D3
         STX   $D5
         LDA   $DF
         LDX   $E1
         LDY   #$0005
         STA   [$D3],Y
         INY
         INY
         TXA
         STA   [$D3],Y
         LDA   $D7
         LDX   $D9
         STA   [$D3]
         TXA
         LDY   #$0002
         STA   [$D3],Y
         PHY
         PHY
         PEI   $E1
         PEI   $DF
         JSL   L07721A
         PLA
         STA   $CF
         PLX
         STX   $D1
         LDA   $CF
         ORA   $D1
         BNE   L230694
         BRA   L2306D5
L230694  LDY   #$0002
         LDA   [$CF],Y
         TAX
         LDA   [$CF]
         CLC
         ADC   #$0018
         BCC   L2306A3
         INX
L2306A3  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $DB
         STX   $DD
         PEI   $E1
         PEI   $DF
         PEA   $0000
         JSL   L074A24
         LDA   $DB
         LDX   $DD
         STA   $DF
         STX   $E1
         LDA   $E7
         LDX   $E9
         INC
         BNE   L2306CE
         INX
L2306CE  STA   $E7
         STX   $E9
         BRL   L23055E
L2306D5  STZ   $FC
L2306D7  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$023E
         TCS
         RTL

L2306E9  PHD
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
         LDA   #$002D
         CLC
         ADC   $40
         LDX   $42
         BCC   L230718
         INX
L230718  PHX
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

L230730  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0001
         LDY   #$004F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0004
         JSL   L072E7C
         PEA   $0000
         PEI   $0A
         JSL   L2303E8
         PEA   $0000
         LDY   #$004F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0004
         JSL   L072E7C
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

L23077C  ENT
         PHD
         TSC
         CLC
         ADC   #$FF98
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $53
         PLX
         STX   $55
         PEI   $74
         PEI   $72
         PHY
         PHY
         PEA   $0836
         JSL   L0711EB
         PEA   ^L0408CF
         PEA   L0408CF
         PEA   ^L0408D0
         PEA   L0408D0
         JSL   L073C22
         PHY
         PHY
         PEA   $4204
         JSL   L072834
         PLA
         STA   $4D
         PLX
         STX   $4F
         PHY
         PEA   $0000
         PHD
         JSL   L2304A7
         PLA
         LSR
         BCC   L2307CC
         BRL   L230D6B
L2307CC  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $015B
         PEA   $003F
         PEA   $01D8
         PEA   $0069
         JSL   L15100B
         LDAL  L053AC1
         STA   $0D
         LDA   #$000A
         STA   $1D
         LDA   #$0004
         STA   $0F
         LDA   #$0002
         STA   $11
         LDA   #$0001
         STA   $13
         STZ   $19
         STZ   $1B
         LDA   #$0009
         STA   $1F
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $21
         STX   $23
         STZ   $25
         STZ   $27
         STZ   $29
         STZ   $2B
         PHY
         PHY
         PEI   $4F
         PEI   $4D
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L1500E9
         PLA
         STA   $41
         PLX
         STX   $43
         PHY
         PHY
         JSL   L160BD4
         PLA
         STA   $3D
         PLX
         STX   $3F
         LDA   $3D
         ORA   $3F
         BNE   L23084A
         BRL   L230D63
L23084A  PHY
         PHY
         JSL   L2302D2
         PLA
         STA   $39
         PLX
         STX   $3B
         LDA   $39
         ORA   $3B
         BNE   L23085F
         BRL   L230D5B
L23085F  LDA   #$0001
         STA   $61
         LDA   $0D
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L230873
         EOR   #$8000
L230873  BPL   L2308CD
         LDA   #$0001
         STA   $5F
L23087A  LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         PHX
         PHA
         LDA   $5F
         JSL   L150488
         TAY
         BNE   L23088E
         DEX
L23088E  DEC
         PEA   $0000
         PEA   $0009
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0005
         BCC   L2308A6
         INX
L2308A6  STA   $65
         STX   $67
         LDAL  L051F08
         TAX
         LDAL  L051F06
         CMP   [$65]
         BNE   L2308BD
         LDY   #$0002
         TXA
         CMP   [$65],Y
L2308BD  BNE   L2308C3
         STZ   $61
         BRA   L2308CD
L2308C3  LDA   $5F
         CMP   $03
         BEQ   L2308CD
         INC   $5F
         BRA   L23087A
L2308CD  LDA   $61
         BEQ   L230944
         LDA   $0D
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L2308E0
         EOR   #$8000
L2308E0  BPL   L230935
         LDA   #$0001
         STA   $5F
L2308E7  LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         PHX
         PHA
         LDA   $5F
         JSL   L150488
         TAY
         BNE   L2308FB
         DEX
L2308FB  DEC
         PEA   $0000
         PEA   $0009
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0005
         BCC   L230913
         INX
L230913  STA   $65
         STX   $67
         LDA   L05501F
         LDX   L055021
         CMP   [$65]
         BNE   L230927
         LDY   #$0002
         TXA
         CMP   [$65],Y
L230927  BNE   L23092B
         BRA   L230935
L23092B  LDA   $5F
         CMP   $01
         BEQ   L230935
         INC   $5F
         BRA   L2308E7
L230935  LDA   L05501F
         LDX   L055021
         STAL  L051F06
         TXA
         STAL  L051F08
L230944  LDA   $5F
         STA   $57
         PHY
         PEI   $4F
         PEI   $4D
         JSL   L160BE2
         PLA
         STA   $63
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L15038F
         PLA
         BNE   L23096B
         LDA   #$000A
         STA   $59
         BRA   L230970
L23096B  LDA   #$000B
         STA   $59
L230970  PEI   $4F
         PEI   $4D
         PEI   $59
         JSL   L073CFE
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PHY
         PHY
         PEI   $4F
         PEI   $4D
         PEI   $59
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0008
         PEA   $0004
         JSL   L151005
         PEI   $4F
         PEI   $4D
         JSL   L15102F
         PEI   $4F
         PEI   $4D
         JSL   L1511C8
         PEI   $4F
         PEI   $4D
         JSL   L151131
         PHY
         JSL   L0727BF
         PLA
         STA   $51
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         PHX
         PHA
         LDA   $57
         JSL   L150488
         TAY
         BNE   L2309DD
         DEX
L2309DD  DEC
         PEA   $0000
         PEA   $0009
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15146C
         STZ   L05533F
         STZ   L05533D
L230A03  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $5B
         PHY
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEI   $4F
         PEI   $4D
         JSL   L150482
         PLA
         STA   $5D
         LDA   #$FFFD
         CMP   $5B
         BEQ   L230A37
         BRL   L230BE5
L230A37  LDA   #$007F
         ANDL  L0540A1
         STA   $5D
         LDA   $5D
         SEC
         SBC   #$0008
         BPL   L230A4B
         BRL   L230B8E
L230A4B  CMP   #$0078
         BMI   L230A53
         BRL   L230B8E
L230A53  SEC
         SBC   #$0000
         BNE   L230A5C
         BRL   L230B80
L230A5C  DEC
         BEQ   L230AC3
         DEC
         BEQ   L230AD2
         DEC
         BEQ   L230AD2
         DEC
         DEC
         BNE   L230A6C
         BRL   L230B21
L230A6C  SEC
         SBC   #$0008
         BNE   L230A75
         BRL   L230B80
L230A75  DEC
         DEC
         DEC
         BNE   L230A7D
         BRL   L230B80
L230A7D  DEC
         DEC
         DEC
         BNE   L230A85
         BRL   L230B80
L230A85  SEC
         SBC   #$0028
         BNE   L230A8E
         BRL   L230B43
L230A8E  SEC
         SBC   #$0013
         BNE   L230A97
         BRL   L230B43
L230A97  DEC
         DEC
         BNE   L230A9E
         BRL   L230B43
L230A9E  SEC
         SBC   #$000B
         BNE   L230AA7
         BRL   L230B43
L230AA7  SEC
         SBC   #$0013
         BNE   L230AB0
         BRL   L230B43
L230AB0  DEC
         DEC
         BNE   L230AB7
         BRL   L230B43
L230AB7  SEC
         SBC   #$0007
         BNE   L230AC0
         BRL   L230B80
L230AC0  BRL   L230B8E
L230AC3  PHY
         PHY
         JSL   L150FE7
         PLA
         STA   $45
         PLX
         STX   $47
         BRL   L230BE5
L230AD2  PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         LDX   #$0000
         LDA   #$000B
         CMP   $5D
         BNE   L230AE7
         INX
L230AE7  PHX
         JSL   L072227
         PLA
         LSR
         BCC   L230B1E
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150371
         PLA
         STA   $49
         PLX
         STX   $4B
         LDY   #$0007
         LDA   [$49],Y
         TAX
         DEY
         DEY
         LDA   [$49],Y
         STAL  L051F06
         TXA
         STAL  L051F08
L230B1E  BRL   L230BE5
L230B21  LDA   #$2100
         ANDL  L0540AD
         BNE   L230B38
         PHY
         PEI   $4F
         PEI   $4D
         JSL   L072354
         PLA
         STA   $5B
         BRA   L230B40
L230B38  PEA   $0000
         PHD
         JSL   L230730
L230B40  BRL   L230BE5
L230B43  LDA   #$0100
         ANDL  L0540AD
         BEQ   L230B7E
         PEI   $5D
         PHY
         PHY
         JSL   L150AF2
         PLA
         PLX
         STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         CLC
         ADC   #$001C
         BCC   L230B69
         INX
L230B69  STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$65],Y
         TAX
         LDA   [$65]
         PHX
         PHA
         PEA   $0002
         JSL   L160B3A
L230B7E  BRA   L230BE5
L230B80  PHY
         PEI   $4F
         PEI   $4D
         JSL   L072354
         PLA
         STA   $5B
         BRA   L230BE5
L230B8E  LDA   $5D
         SEC
         SBC   #$0030
         BVS   L230B99
         EOR   #$8000
L230B99  BMI   L230BA0
         LDA   #$0000
         BRA   L230BA3
L230BA0  LDA   #$0001
L230BA3  PHA
         LDA   $5D
         SEC
         SBC   #$003A
         BVS   L230BAF
         EOR   #$8000
L230BAF  BPL   L230BB6
         LDA   #$0000
         BRA   L230BB9
L230BB6  LDA   #$0001
L230BB9  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$1000
         ANDL  L0540AD
         BNE   L230BCA
         INX
L230BCA  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L230BE5
         PHY
         PEI   $4F
         PEI   $4D
         JSL   L072354
         PLA
         STA   $5B
         PEA   $0000
         PHD
         JSL   L23046A
L230BE5  LDA   #$FFFE
         CMP   $5B
         BNE   L230BF1
         LDA   #$0063
         STA   $5B
L230BF1  LDA   $5B
         DEC
         BPL   L230BF9
         BRL   L230CC7
L230BF9  CMP   #$0063
         BMI   L230C01
         BRL   L230CC7
L230C01  SEC
         SBC   #$0000
         BEQ   L230C66
         DEC
         BEQ   L230C75
         DEC
         BEQ   L230C7E
         DEC
         BNE   L230C13
         BRL   L230C9A
L230C13  DEC
         BEQ   L230C8C
         DEC
         BNE   L230C1C
         BRL   L230CA4
L230C1C  DEC
         BNE   L230C22
         BRL   L230CBD
L230C22  DEC
         BNE   L230C28
         BRL   L230CBD
L230C28  DEC
         BNE   L230C2E
         BRL   L230CBD
L230C2E  SEC
         SBC   #$005A
         BEQ   L230C37
         BRL   L230CC7
L230C37  PEI   $4F
         PEI   $4D
         JSL   L1506B3
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
         PEI   $4F
         PEI   $4D
         JSL   L1517CD
         PEA   $0000
         PHD
         JSL   L2306E9
         PEI   $4F
         PEI   $4D
         JSL   L1506AD
         BRL   L230D1A
L230C66  LDA   #$0001
         STA   L05533F
         LDA   #$0001
         STA   L05533D
         BRL   L230D1A
L230C75  LDA   #$0001
         STA   L05533F
         BRL   L230D1A
L230C7E  PEA   $0001
         PEA   $0000
         PHD
         JSL   L23032D
         BRL   L230D1A
L230C8C  PEA   $0000
         PEA   $0000
         PHD
         JSL   L23032D
         BRL   L230D1A
L230C9A  PEA   $0000
         PHD
         JSL   L2303E8
         BRA   L230D1A
L230CA4  LDA   $63
         BNE   L230CBB
         PEA   $0001
         PEI   $4F
         PEI   $4D
         PEA   $0006
         JSL   L073B05
         LDA   #$0001
         STA   $63
L230CBB  BRA   L230D1A
L230CBD  PEA   $0000
         PHD
         JSL   L23046A
         BRA   L230D1A
L230CC7  LDA   $41
         LDX   $43
         CMP   $45
         BNE   L230CD1
         CPX   $47
L230CD1  BNE   L230D1A
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150371
         PLA
         STA   $49
         PLX
         STX   $4B
         LDAL  L0540BB
         SEC
         SBC   #$0002
         BVS   L230CFB
         EOR   #$8000
L230CFB  BPL   L230D07
         PEA   $0000
         PHD
         JSL   L230730
         BRA   L230D1A
L230D07  LDY   #$0007
         LDA   [$49],Y
         TAX
         DEY
         DEY
         LDA   [$49],Y
         STAL  L051F06
         TXA
         STAL  L051F08
L230D1A  LDA   L05533F
         BNE   L230D22
         BRL   L230A03
L230D22  LDA   L05533D
         BEQ   L230D53
         PEI   $4F
         PEI   $4D
         PEI   $63
         JSL   L160BF0
         LDA   L055335
         PHA
         PHY
         PEI   $3B
         PEI   $39
         JSL   L23012A
         PLA
         ORA   $01,S
         PLX
         PHA
         PHY
         PEI   $3F
         PEI   $3D
         JSL   L160BB8
         PLA
         ORA   $01,S
         PLX
         STA   L055335
L230D53  PEI   $3B
         PEI   $39
         JSL   L07185A
L230D5B  PEI   $3F
         PEI   $3D
         JSL   L07185A
L230D63  PEI   $37
         PEI   $35
         JSL   L07185A
L230D6B  PEI   $4F
         PEI   $4D
         JSL   L072634
         PEI   $51
         JSL   L0724F7
         PEI   $55
         PEI   $53
         JSL   L151131
         JSL   L09AFB1
         LDA   $6C
         STA   $74
         LDA   $6B
         STA   $73
         LDA   $69
         TCD
         TSC
         CLC
         ADC   #$0072
         TCS
         RTL

L230D97  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         LDA   #$0003
         CMPL  L051F16
         BNE   L230DAF
         LDA   #$00FF
         STA   $01
L230DAF  PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0010
         JSL   L072E7C
         PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $000F
         JSL   L072E7C
         PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $000E
         JSL   L072E7C
         PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $000C
         JSL   L072E7C
         PEA   $0000
         PEI   $0C
         JSL   L232ED1
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

L230E1A  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDY   #$0097
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0000
         JSL   L150671
         LDY   #$00AF
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         CLC
         ADC   #$0006
         BCC   L230E45
         INX
L230E45  STA   $03
         STX   $05
         LDA   #$0008
         AND   [$03]
         BEQ   L230E53
         LDA   #$0001
L230E53  STA   $01
         PEI   $01
         PEA   $0002
         JSL   L15167B
         LDA   $01
         EOR   #$0001
         PHA
         PEA   $0001
         JSL   L15167B
         PEA   $045B
         JSL   L1512C5
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

L230E84  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         LDY   #$00AF
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CLC
         ADC   #$0006
         BCC   L230EA6
         INX
L230EA6  CLC
         ADC   #$000C
         BCC   L230EAD
         INX
L230EAD  PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L160BFE
         PLA
         STA   $0F
         LDA   $0F
         BEQ   L230F0D
         LDY   #$00AF
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CLC
         ADC   #$0006
         BCC   L230EE5
         INX
L230EE5  STA   $01
         STX   $03
         LDA   #$000C
         CLC
         ADC   $01
         LDX   $03
         BCC   L230EF4
         INX
L230EF4  PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   #$0008
         ORA   [$01]
         STA   [$01]
L230F0D  LDA   $18
         STA   $1C
         LDA   $17
         STA   $1B
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L230F1F  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDY   #$00EB
         LDA   [$12],Y
         BEQ   L230F74
         LDY   #$00AF
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         CLC
         ADC   #$0006
         BCC   L230F3F
         INX
L230F3F  STA   $05
         STX   $07
         LDA   #$0080
         AND   [$05]
         BEQ   L230F72
         LDA   #$0004
         CLC
         ADC   $05
         LDX   $07
         BCC   L230F55
         INX
L230F55  PHX
         PHA
         JSL   L08273B
         LDA   #$000C
         CLC
         ADC   $05
         LDX   $07
         BCC   L230F66
         INX
L230F66  PHX
         PHA
         PEA   $0000
         PEA   $000A
         JSL   L071EC5
L230F72  BRA   L230F7E
L230F74  PEA   ^L051EF8
         PEA   L051EF8
         JSL   L08273B
L230F7E  LDY   #$00AF
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         CLC
         ADC   #$0006
         BCC   L230F8F
         INX
L230F8F  STA   $01
         STX   $03
         LDA   #$0080
         AND   [$01]
         BEQ   L230FC0
         LDA   #$FF77
         AND   [$01]
         STA   [$01]
         LDY   #$00AF
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         LDA   $12
         LDX   $14
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         PHX
         PHA
         JSL   L1505A4
L230FC0  LDA   $10
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

L230FD2  PHD
         TSC
         CLC
         ADC   #$FDCA
         TCS
         ADC   #$0143
         TCD
         LDA   #$0001
         STA   $FC
         LDA   #$026D
         LDX   #$0000
         STA   $E3
         STX   $E5
         LDA   #$0099
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L230FF7
         INX
L230FF7  STA   $EF
         STX   $F1
         PHY
         PHY
         PEI   $E5
         PEI   $E3
         PEA   $4010
         PEA   $07D1
         JSL   L160A30
         PLA
         STA   [$EF]
         PLA
         LDY   #$0002
         STA   [$EF],Y
         LDY   #$0099
         LDA   [$F8],Y
         INY
         INY
         ORA   [$F8],Y
         BNE   L231022
         BRL   L231368
L231022  PHY
         PHY
         PEA   $0000
         PEA   $0380
         PEA   $083D
         JSL   L160B9C
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDA   $DB
         ORA   $DD
         BNE   L231040
         BRL   L231368
L231040  PEI   $DD
         PEI   $DB
         JSL   L0718BF
         LDY   #$0002
         LDA   [$DB],Y
         TAX
         LDA   [$DB]
         STA   $D7
         STX   $D9
         LDA   #$00D3
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L23105F
         INX
L23105F  STA   $EF
         STX   $F1
         PHY
         PHY
         LDAL  L051F08
         PHA
         LDAL  L051F06
         PHA
         PEA   $0002
         JSL   L07977D
         PEA   $0000
         PEA   $001F
         JSL   L071A1B
         PLA
         STA   [$EF]
         LDY   #$00D3
         LDA   [$F8],Y
         BNE   L23108D
         BRL   L231294
L23108D  LDY   #$00D3
         LDA   [$F8],Y
         LDX   #$FFC1
         STA   $00,X
         LDX   #$FFC1
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L2310A5
         EOR   #$8000
L2310A5  BMI   L2310AA
         BRL   L231294
L2310AA  LDA   #$0001
         STA   $E9
L2310AF  PHY
         LDAL  L051F08
         PHA
         LDAL  L051F06
         PHA
         PEI   $E9
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $E7
         STZ   $ED
         LDA   #$0001
         STA   $EB
L2310CD  LDY   #$00A7
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         PHX
         PHA
         LDA   $EB
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L2310F6
         INX
L2310F6  CLC
         ADC   #$0002
         BCC   L2310FD
         INX
L2310FD  STA   $EF
         STX   $F1
         LDA   $E7
         CMP   [$EF]
         BNE   L23110E
         LDA   #$0001
         STA   $ED
         BRA   L231119
L23110E  LDA   #$001F
         CMP   $EB
         BEQ   L231119
         INC   $EB
         BRA   L2310CD
L231119  LDA   $ED
         BEQ   L231168
         LDA   $D7
         LDX   $D9
         STA   $EF
         STX   $F1
         LDA   $E9
         PEA   $001C
         JSL   L150BEE
         PLY
         TYA
         CLC
         ADC   $EF
         TAX
         LDA   $F1
         BCC   L231139
         INC
L231139  PHA
         PHX
         LDY   #$00A7
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         PHX
         PHA
         LDA   $EB
         JSL   L150488
         PEA   $0000
         PEA   $001C
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $001C
         JSL   L0313BE
         BRA   L231198
L231168  LDA   $D7
         LDX   $D9
         STA   $EF
         STX   $F1
         LDA   $E9
         PEA   $001C
         JSL   L150BEE
         PLY
         TYA
         CLC
         ADC   $EF
         STA   $EF
         BCC   L231184
         INC   $F1
L231184  LDY   #$0006
         TYA
         CLC
         ADC   $EF
         STA   $EF
         BCC   L231191
         INC   $F1
L231191  LDY   #$0002
         LDA   $E7
         STA   [$EF],Y
L231198  TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBD
         PHA
         LDAL  L051F08
         PHA
         LDAL  L051F06
         PHA
         PEI   $E7
         JSL   L07ACF0
         PEA   $0014
         JSL   L0313BE
         LDA   #$00FF
         AND   $C3
         BNE   L231206
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         PHY
         PHY
         PEA   $0840
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA9
         PHA
         LDA   $E7
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
L231206  LDA   #$00FF
         AND   $C3
         SEC
         SBC   #$0013
         BEQ   L231220
         BVS   L231216
         EOR   #$8000
L231216  BPL   L231220
         SEP   #$20
         LDA   #$13
         STA   $C3
         REP   #$20
L231220  LDY   #$009B
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
         LDA   $E9
         JSL   L150488
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $DF
         STX   $E1
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         PEI   $E1
         PEI   $DF
         PEA   $0000
         PEA   $0014
         JSL   L1511CE
         LDA   $D7
         LDX   $D9
         STA   $EF
         STX   $F1
         LDA   $E9
         PEA   $001C
         JSL   L150BEE
         PLY
         LDA   $DF
         LDX   $E1
         STA   [$EF],Y
         TXA
         INY
         INY
         STA   [$EF],Y
         LDA   $E9
         LDX   #$FFC1
         CMP   $00,X
         BEQ   L231294
         INC   $E9
         BRL   L2310AF
L231294  PEI   $D9
         PEI   $D7
         LDY   #$00A7
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0000
         PEA   $0380
         JSL   L070597
         PEI   $DD
         PEI   $DB
         JSL   L07185A
         PHY
         PHY
         PEA   $0843
         JSL   L0711EB
         LDY   #$009B
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
         PEA   $0000
         PEA   $0014
         JSL   L1511CE
         LDY   #$00A7
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         TXY
         LDX   #$FFBD
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFBD
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDY   #$009B
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
         PHY
         PEA   ^L051EF8
         PEA   L051EF8
         JSL   L1500E3
         PLA
         LSR
         BCC   L231366
         LDX   #$FFBD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L231343
         INX
L231343  PHX
         PHA
         LDX   #$FFBD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L231355
         INX
L231355  STA   $EF
         STX   $F1
         LDA   #$0080
         ORA   [$EF]
         PLX
         STX   $EF
         PLX
         STX   $F1
         STA   [$EF]
L231366  STZ   $FC
L231368  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$023C
         TCS
         RTL

L23137A  PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         PHY
         PHY
         JSL   L1516CF
         PLA
         STA   $25
         PLX
         STX   $27
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $29
         PLX
         STX   $2B
         LDA   $40
         BNE   L2313A1
         BRL   L2314E8
L2313A1  LDA   #$0055
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L2313AC
         INX
L2313AC  STA   $19
         STX   $1B
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$19],Y
         PHA
         LDA   [$19]
         PHA
         LDY   #$0006
         LDA   [$19],Y
         PHA
         LDY   #$0004
         LDA   [$19],Y
         DEC
         PHA
         JSL   L15100B
         PEI   $2B
         PEI   $29
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L150126
         PEI   $2B
         PEI   $29
         JSL   L1516C9
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   #$004D
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L231400
         INX
L231400  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $FFFF
         JSL   L081DD8
         LDA   #$0003
         CMPL  L051F16
         BEQ   L231442
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L150FFF
         BRL   L2314D9
L231442  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L15037D
         LDA   L055327
         LDX   L055329
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0002
         BCC   L231468
         INX
L231468  CLC
         ADC   #$0006
         BCC   L23146F
         INX
L23146F  STA   $15
         STX   $17
         LDY   #$0006
         LDA   [$15],Y
         LDY   #$0002
         SEC
         SBC   [$15],Y
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $31
         LDA   #$004D
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L231495
         INX
L231495  STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         CLC
         ADC   $31
         DEC
         DEC
         STA   $31
         LDY   #$0006
         LDA   [$11],Y
         STA   $33
         LDA   $31
         SEC
         SBC   $33
         BVS   L2314B6
         EOR   #$8000
L2314B6  BMI   L2314D9
         PEI   $31
         LDA   [$11]
         PHA
         JSL   L1510C5
         PEA   ^L230030
         PEA   L230030
         JSL   L151198
         PEI   $31
         LDY   #$0004
         LDA   [$11],Y
         DEC
         DEC
         PHA
         JSL   L1505DA
L2314D9  PEA   $0000
         JSL   L081DD8
         PEI   $2B
         PEI   $29
         JSL   L1516B1
L2314E8  JSL   L150659
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   #$004D
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L231500
         INX
L231500  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         LDA   #$0003
         CMPL  L051F16
         BEQ   L23153A
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         BRA   L231547
L23153A  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L151418
L231547  PEI   $2B
         PEI   $29
         JSL   L15166F
         PEI   $2B
         PEI   $29
         JSL   L1516C9
         PHY
         PEA   ^L051EF8
         PEA   L051EF8
         JSL   L1500E3
         PLA
         LSR
         BCS   L231569
         BRL   L2316FF
L231569  LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $0035
         JSL   L150F53
         PHX
         PHA
         PEA   ^L051EF8
         PEA   L051EF8
         PEA   $0008
         JSL   L0313BE
         LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $0035
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDA   #$0004
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L2315A3
         INX
L2315A3  STA   $33
         STX   $35
         LDY   #$0004
         LDA   [$0D],Y
         SEC
         SBC   [$0D]
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   [$33]
         LDA   #$0000
         STA   [$0D]
         LDY   #$0006
         LDA   [$0D],Y
         LDY   #$0002
         SEC
         SBC   [$0D],Y
         LDY   #$0006
         STA   [$0D],Y
         LDA   #$0000
         LDY   #$0002
         STA   [$0D],Y
         LDA   #$004D
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L2315E3
         INX
L2315E3  STA   $09
         STX   $0B
         LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $0035
         JSL   L150F53
         PHX
         PHA
         LDY   #$0002
         LDA   [$09],Y
         CLC
         ADCL  L051F02
         PHA
         LDAL  L051F00
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         CLC
         ADC   [$09]
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $0035
         JSL   L150F53
         PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $21
         DEC
         DEC
         DEC
         STA   $1D
         LDA   $23
         SEC
         SBC   #$0006
         STA   $1F
         LDA   $21
         DEC
         STA   $21
         LDA   $23
         DEC
         DEC
         STA   $23
         LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $0035
         JSL   L150F53
         PHX
         PHA
         JSL   L151418
         LDY   #$00AF
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         LDY   #$00A7
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         JSL   L033477
         BNE   L23168D
         PEA   ^L230040
         PEA   L230040
         JSL   L151198
         BRA   L231697
L23168D  PEA   ^L230050
         PEA   L230050
         JSL   L151198
L231697  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $0035
         JSL   L150F53
         PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $0000
         JSL   L081DD8
         LDA   $21
         DEC
         DEC
         STA   $1D
         LDA   $23
         SEC
         SBC   #$0004
         STA   $1F
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L1501B5
L2316FF  LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         CLC
         ADC   #$0008
         BCC   L231714
         INX
L231714  STA   $33
         STX   $35
         LDA   [$33]
         SEC
         SBC   #$0002
         BVS   L231723
         EOR   #$8000
L231723  BMI   L231728
         BRL   L231879
L231728  LDA   #$0001
         STA   $31
L23172D  LDY   #$00A7
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         LDA   $31
         PEA   $001C
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L23174B
         DEX
L23174B  JSL   L150F53
         STA   $2D
         STX   $2F
         LDY   #$0006
         LDA   #$0080
         AND   [$2D],Y
         CMP   #$0000
         BNE   L231763
         BRL   L231851
L231763  LDA   #$0006
         CLC
         ADC   $2D
         LDX   $2F
         BCC   L23176E
         INX
L23176E  CLC
         ADC   #$0004
         BCC   L231775
         INX
L231775  STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         LDY   #$0006
         LDA   [$05],Y
         PHA
         LDY   #$0004
         LDA   [$05],Y
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L15100B
         LDA   #$004D
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L2317BA
         INX
L2317BA  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L151418
         LDY   #$00AF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         CMP   $2D
         BNE   L2317F1
         CPX   $2F
L2317F1  BNE   L2317FF
         PEA   ^L230060
         PEA   L230060
         JSL   L151198
         BRA   L231809
L2317FF  PEA   ^L230070
         PEA   L230070
         JSL   L151198
L231809  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $0000
         JSL   L081DD8
         LDA   $21
         DEC
         DEC
         STA   $1D
         LDA   $23
         SEC
         SBC   #$0004
         STA   $1F
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L1501B5
L231851  LDA   $31
         INC
         STA   $31
         PEI   $31
         LDA   $3C
         LDX   $3E
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         CLC
         ADC   #$0008
         BCC   L23186D
         INX
L23186D  STA   $33
         STX   $35
         PLA
         CMP   [$33]
         BEQ   L231879
         BRL   L23172D
L231879  PEI   $27
         PEI   $25
         JSL   L1516C9
         PEI   $2B
         PEI   $29
         JSL   L151669
         LDA   $3A
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

L23189B  PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         PEA   ^L230080
         PEA   L230080
         JSL   L151198
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDA   #$0055
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L2318C1
         INX
L2318C1  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $0000
         JSL   L081DD8
         LDA   #$0055
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L2318FC
         INX
L2318FC  PHX
         PHA
         JSL   L151418
         PHY
         PHY
         JSL   L1516CF
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   #$0055
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231919
         INX
L231919  STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         LDY   #$0006
         LDA   [$05],Y
         DEC
         DEC
         PHA
         LDY   #$0004
         LDA   [$05],Y
         DEC
         PHA
         JSL   L15100B
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $1D
         PLX
         STX   $1F
         PEI   $1F
         PEI   $1D
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L150126
         PEI   $1F
         PEI   $1D
         JSL   L1516C9
         LDX   #$0000
         LDA   #$0003
         CMPL  L051F16
         BEQ   L231974
         INX
L231974  TXA
         STA   $21
         PEA   $3333
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDA   #$004D
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231992
         INX
L231992  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $21
         BNE   L2319A2
         BRL   L231A47
L2319A2  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         LDY   #$00BB
         LDA   [$2C],Y
         LDY   #$004D
         SEC
         SBC   [$2C],Y
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDA   #$004D
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L2319E5
         INX
L2319E5  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDA   #$00BB
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231A02
         INX
L231A02  CLC
         ADC   #$0002
         BCC   L231A09
         INX
L231A09  STA   $23
         STX   $25
         LDA   [$23]
         PHA
         LDA   #$004D
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231A1B
         INX
L231A1B  CLC
         ADC   #$0002
         BCC   L231A22
         INX
L231A22  STA   $23
         STX   $25
         PLA
         SEC
         SBC   [$23]
         PHA
         PEA   $0000
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         BRA   L231A84
L231A47  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         LDY   #$00BB
         LDA   [$2C],Y
         LDY   #$004D
         SEC
         SBC   [$2C],Y
         INC
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
L231A84  PEA   $0000
         JSL   L081DD8
         LDA   #$0055
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231A96
         INX
L231A96  STA   $01
         STX   $03
         LDA   $21
         BEQ   L231AFB
         LDA   #$004D
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231AA9
         INX
L231AA9  PHX
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         LDA   #$00BB
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231AC0
         INX
L231AC0  CLC
         ADC   #$0002
         BCC   L231AC7
         INX
L231AC7  STA   $23
         STX   $25
         LDA   [$23]
         PHA
         LDA   [$01]
         INC
         PHA
         JSL   L1510C5
         LDA   #$00BB
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231AE1
         INX
L231AE1  CLC
         ADC   #$0002
         BCC   L231AE8
         INX
L231AE8  STA   $23
         STX   $25
         LDA   [$23]
         PHA
         LDY   #$0004
         LDA   [$01],Y
         PHA
         JSL   L1505DA
         BRA   L231B0C
L231AFB  LDA   #$004D
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L231B06
         INX
L231B06  PHX
         PHA
         JSL   L151418
L231B0C  LDY   #$0002
         LDA   [$01],Y
         INC
         INC
         PHA
         LDY   #$00BB
         LDA   [$2C],Y
         PHA
         JSL   L1510C5
         LDY   #$0006
         LDA   [$01],Y
         PHA
         LDY   #$00BB
         LDA   [$2C],Y
         PHA
         JSL   L1505DA
         PEI   $1B
         PEI   $19
         JSL   L1516C9
         PEI   $1F
         PEI   $1D
         JSL   L151669
         LDA   $2A
         STA   $2E
         LDA   $29
         STA   $2D
         LDA   $27
         TCD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L231B50  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   #$0055
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L231B63
         INX
L231B63  STA   $01
         STX   $03
         LDAL  L051F10
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         DEC
         DEC
         STA   $11
         LDA   #$0003
         CMPL  L051F16
         BNE   L231B8F
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         STA   $11
L231B8F  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $11
         LDAL  L051F0E
         DEC
         DEC
         PHA
         JSL   L15100B
         LDA   $1C
         LDX   $1E
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         CLC
         ADC   #$0008
         BCC   L231BC0
         INX
L231BC0  STA   $13
         STX   $15
         LDA   [$13]
         STA   $11
L231BC8  PEI   $11
         PEA   $0000
         PEI   $1C
         JSL   L232D9C
         LDA   $11
         BNE   L231BE6
         LDAL  L051F02
         TAX
         LDAL  L051F00
         STA   $0D
         STX   $0F
         BRA   L231C0E
L231BE6  LDY   #$00AF
         LDA   [$1C],Y
         TAX
         DEY
         DEY
         LDA   [$1C],Y
         CLC
         ADC   #$0006
         BCC   L231BF7
         INX
L231BF7  CLC
         ADC   #$0004
         BCC   L231BFE
         INX
L231BFE  STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $0D
         STX   $0F
L231C0E  PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L231C32
         PEA   $0000
         PEI   $1C
         JSL   L230F1F
L231C32  LDA   $11
         DEC
         STA   $11
         LDA   $11
         BPL   L231BC8
         PEA   $FFFF
         PEA   $0000
         PEI   $1C
         JSL   L232D9C
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

L231C59  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDY   #$00FA
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$00EB
         BCC   L231C72
         INX
L231C72  STA   $0D
         STX   $0F
         LDA   [$0D]
         BNE   L231C7D
         BRL   L231D3D
L231C7D  LDY   #$00D9
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$00BE
         BCC   L231C8E
         INX
L231C8E  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         CLC
         ADC   #$0002
         BCC   L231CAD
         INX
L231CAD  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         PHA
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   [$01]
         PHA
         JSL   L15100B
         LDA   $1A
         BEQ   L231CEC
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15123D
         BRA   L231D0F
L231CEC  LDY   #$00CF
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         CLC
         ADC   #$0008
         BCC   L231D09
         INX
L231D09  PHX
         PHA
         JSL   L15123D
L231D0F  LDY   #$00FA
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$00AD
         BCC   L231D20
         INX
L231D20  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L160C0C
         BRA   L231D73
L231D3D  LDA   #$00A9
         CLC
         ADC   $16
         LDX   $18
         BCC   L231D48
         INX
L231D48  PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0808E0
         PEA   ^L053239
         PEA   L053239
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L15025A
L231D73  LDA   $14
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

L231D85  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         LDY   #$00ED
         STA   [$0A],Y
         LDA   $0A
         LDX   $0C
         PEA   $0000
         PEA   $0017
         JSL   L150F53
         CLC
         ADC   #$000E
         BCC   L231DAA
         INX
L231DAA  STA   $01
         STX   $03
         LDA   #$0800
         AND   [$01]
         BEQ   L231DD1
         LDA   $0E
         BEQ   L231DC5
         LDA   #$0001
         STA   L05533B
         LDA   #$0001
         STA   L055339
L231DC5  LDA   #$0001
         STA   L05533F
         LDA   #$0001
         STA   L05533D
L231DD1  LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L231DE3  PHD
         TSC
         CLC
         ADC   #$FE0E
         TCS
         ADC   #$00FF
         TCD
         LDY   #$00EB
         LDA   [$F8],Y
         BNE   L231E1C
         LDY   #$00AF
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0006
         BCC   L231E06
         INX
L231E06  CLC
         ADC   #$0004
         BCC   L231E0D
         INX
L231E0D  PHX
         PHA
         PEA   ^L051EF8
         PEA   L051EF8
         PEA   $0008
         JSL   L0313BE
L231E1C  TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         LDY   #$00AF
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0006
         BCC   L231E36
         INX
L231E36  CLC
         ADC   #$0004
         BCC   L231E3D
         INX
L231E3D  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         JSL   L0808E0
         PHY
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCS   L231E71
         BRL   L2325AA
L231E71  PHY
         JSL   L073CDF
         PLA
         STA   $D5
         PHY
         PHY
         PEA   $8010
         PEA   $0000
         PEA   $41A0
         JSL   L15041C
         PLA
         STA   $C9
         PLX
         STX   $CB
         PEI   $CB
         PEI   $C9
         JSL   L0718BF
         LDA   $B7
         SEC
         SBC   $B3
         STA   $E7
         LDA   $B5
         SEC
         SBC   $B1
         STA   $E9
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L0408D1
         PEA   L0408D1
         LDY   #$00AF
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
         PEA   ^L0408D3
         PEA   L0408D3
         PEA   $0000
         TDC
         CLC
         ADC   #$FF01
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0016
         JSL   L0313BE
         PHY
         PHY
         PEA   $41A0
         JSL   L072834
         PLA
         STA   $D7
         PLX
         STX   $D9
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $D9
         PEI   $D7
         JSL   L150F67
         LDY   #$0002
         LDA   [$C9],Y
         PHA
         LDA   [$C9]
         PHA
         PEI   $D9
         PEI   $D7
         JSL   L151047
         PEI   $E7
         PEI   $E9
         PEI   $D9
         PEI   $D7
         JSL   L151035
         LDA   #$0280
         SEC
         SBC   $E7
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         AND   #$FFFE
         PHA
         PEA   $0046
         PEI   $D9
         PEI   $D7
         JSL   L151029
         PEA   $0249
         PEA   $0096
         PEI   $D9
         PEI   $D7
         JSL   L1504AB
         PHY
         PHY
         PEI   $D9
         PEI   $D7
         PEA   $0000
         PEA   $0002
         JSL   L151367
         PLA
         STA   $CD
         PLX
         STX   $CF
         LDA   $E7
         SEC
         SBC   #$0016
         PHA
         LDA   $E9
         SEC
         SBC   #$000B
         PHA
         PEI   $CF
         PEI   $CD
         JSL   L150B04
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         LDAL  L051F08
         PHA
         LDAL  L051F06
         PHA
         JSL   L160C1A
         PLA
         STA   $EB
         LDY   #$00EB
         LDA   [$F8],Y
         BNE   L231FC1
         STZ   L055135
         STZ   L055139
         LDA   L055149
         STA   $EB
         STZ   L055149
         PEA   ^L053259
         PEA   L053259
         JSL   L085216
         LDA   $EB
         STA   L055149
L231FC1  PEI   $D9
         PEI   $D7
         JSL   L15102F
         PEI   $D9
         PEI   $D7
         JSL   L1511C8
         LDY   #$00B3
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L1517CD
         PEI   $D9
         PEI   $D7
         JSL   L151131
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
         PEA   $0004
         JSL   L0724F7
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   #$0144
         LDX   #$0000
         STA   $2B
         STX   $2D
         STZ   $ED
L232013  PHY
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L15141E
         PLA
         STA   $E9
         LDA   $21
         LDX   $23
         STA   $C1
         STX   $C3
         LDA   $E9
         BPL   L232036
         BRL   L23252C
L232036  CMP   #$0017
         BMI   L23203E
         BRL   L23252C
L23203E  SEC
         SBC   #$0000
         BNE   L232047
         BRL   L23245E
L232047  DEC
         DEC
         DEC
         BEQ   L232071
         DEC
         DEC
         BEQ   L232071
         DEC
         BNE   L232056
         BRL   L23245E
L232056  SEC
         SBC   #$0006
         BEQ   L2320A8
         SEC
         SBC   #$0004
         BEQ   L2320A0
         DEC
         BEQ   L232099
         DEC
         DEC
         BEQ   L2320BA
         DEC
         DEC
         DEC
         BEQ   L23208B
         BRL   L23252C
L232071  LDX   #$0000
         LDA   #$007F
         AND   $19
         CMP   #$000D
         BNE   L23207F
         INX
L23207F  PHX
         PEA   $0000
         PHD
         JSL   L231D85
         BRL   L23252C
L23208B  PEA   $0001
         PEA   $0000
         PHD
         JSL   L231D85
         BRL   L23252C
L232099  JSL   L072314
         BRL   L23252C
L2320A0  LDA   #$0001
         STA   $ED
         BRL   L23252C
L2320A8  JSL   L073A49
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L231D85
         BRL   L23252C
L2320BA  PHY
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEI   $23
         PEI   $21
         PEI   $D9
         PEI   $D7
         JSL   L150482
         PLA
         STA   $DF
         LDA   $D7
         LDX   $D9
         CMP   $27
         BNE   L2320DD
         CPX   $29
L2320DD  BEQ   L2320E4
         LDA   #$0001
         STA   $ED
L2320E4  LDA   #$000A
         CMP   $DF
         BEQ   L2320EE
         BRL   L232293
L2320EE  PHY
         PHY
         PEA   $001F
         PEA   $0009
         PEI   $23
         PEI   $21
         PEI   $D9
         PEI   $D7
         JSL   L15103B
         PLA
         STA   $DB
         PLX
         STX   $DD
         PHY
         PEI   $DD
         PEI   $DB
         JSL   L15057A
         PLA
         AND   #$FFFE
         STA   $E3
         PHY
         PEI   $DD
         PEI   $DB
         JSL   L1510CB
         PLA
         STA   $E1
         PEI   $E3
         PEI   $E1
         PEI   $D9
         PEI   $D7
         JSL   L151035
         LDA   $E3
         BEQ   L232136
         LDA   #$0001
L232136  PHA
         LDA   $E1
         BEQ   L23213E
         LDA   #$0001
L23213E  ORA   $01,S
         PLX
         LSR
         BCS   L232147
         BRL   L232290
L232147  LDA   $E3
         CLC
         ADC   $B3
         STA   $B7
         LDA   $E1
         CLC
         ADC   $B1
         STA   $B5
         PHY
         LDA   $B7
         SEC
         SBC   #$0280
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $E7
         LDA   $E7
         INC
         AND   #$FFFE
         STA   $E7
         PHY
         LDA   $B5
         SEC
         SBC   #$00C8
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $E5
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         LDA   $E7
         EOR   #$FFFF
         INC
         PHA
         LDA   $E5
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         PEA   $0000
         LDA   $E1
         SEC
         SBC   #$000B
         PHA
         PEI   $E3
         PEI   $E1
         JSL   L15100B
         LDA   $BF
         SEC
         SBC   #$0016
         PHA
         PEI   $B9
         PEI   $CF
         PEI   $CD
         JSL   L150B04
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $E3
         PEI   $E1
         JSL   L15100B
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         JSL   L150B34
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $AB
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $AB
         PEI   $AF
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $AF
         LDY   #$00EB
         LDA   [$F8],Y
         BEQ   L232252
         LDY   #$00AF
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0006
         BCC   L232237
         INX
L232237  CLC
         ADC   #$0004
         BCC   L23223E
         INX
L23223E  PHX
         PHA
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         BRA   L232268
L232252  PEA   ^L051EF8
         PEA   L051EF8
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L232268  LDY   #$00B3
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L151131
         LDA   #$004D
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L232282
         INX
L232282  PHX
         PHA
         JSL   L150B34
         PEI   $D9
         PEI   $D7
         JSL   L151131
L232290  BRL   L23245B
L232293  TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         LDY   #$00C0
         LDA   [$D7],Y
         TAX
         DEY
         DEY
         LDA   [$D7],Y
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         CLC
         ADC   #$0002
         BCC   L2322B9
         INX
L2322B9  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L2322E0
         BRL   L23245B
L2322E0  TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         JSL   L150BE8
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $C1
         LDX   $C3
         STA   $C5
         STX   $C7
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L231C59
L232319  LDY   #$00EB
         LDA   [$F8],Y
         BEQ   L232323
         BRL   L232442
L232323  LDA   $C7
         SEC
         SBC   $C3
         STA   $E7
         LDA   $E7
         BMI   L232345
         BEQ   L232345
         PHY
         LDA   $E7
         INC
         PHA
         LDA   #$0280
         SEC
         SBC   $B7
         PHA
         JSL   L072FD5
         PLA
         STA   $E7
         BRA   L23235C
L232345  LDA   $E7
         BPL   L23235C
         PHY
         LDA   $E7
         DEC
         PHA
         LDA   $B3
         EOR   #$FFFF
         INC
         PHA
         JSL   L072FA6
         PLA
         STA   $E7
L23235C  LDA   #$FFFE
         AND   $E7
         STA   $E7
         LDA   $C5
         SEC
         SBC   $C1
         STA   $E5
         LDA   $E5
         BMI   L232383
         BEQ   L232383
         PHY
         PEI   $E5
         LDA   #$00C8
         SEC
         SBC   $B5
         PHA
         JSL   L072FD5
         PLA
         STA   $E5
         BRA   L232394
L232383  PHY
         PEI   $E5
         LDA   $B1
         EOR   #$FFFF
         INC
         PHA
         JSL   L072FA6
         PLA
         STA   $E5
L232394  TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L232435
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $C1
         LDX   $C3
         STA   $C5
         STX   $C7
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $AB
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $AB
         PEI   $AF
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $AF
         PEA   ^L051EF8
         PEA   L051EF8
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L231C59
L232435  TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         JSL   L150801
L232442  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L232453
         BRL   L232319
L232453  PEI   $D9
         PEI   $D7
         JSL   L1517CD
L23245B  BRL   L23252C
L23245E  LDA   #$0006
         CMP   $E9
         BNE   L2324A3
         LDA   $D7
         LDX   $D9
         CMP   $19
         BNE   L23246F
         CPX   $1B
L23246F  BNE   L232496
         PEI   $D9
         PEI   $D7
         JSL   L1506B3
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L231C59
         PEI   $D9
         PEI   $D7
         JSL   L1517CD
         PEI   $D9
         PEI   $D7
         JSL   L1506AD
         BRA   L2324A3
L232496  PEI   $1B
         PEI   $19
         PEA   $0000
         PEI   $F8
         JSL   L23389C
L2324A3  LDA   $C1
         LDX   $C3
         STA   $C5
         STX   $C7
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         JSL   L150BE8
         PHY
         TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         LDY   #$00C0
         LDA   [$D7],Y
         TAX
         DEY
         DEY
         LDA   [$D7],Y
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         CLC
         ADC   #$0002
         BCC   L2324DF
         INX
L2324DF  PHX
         PHA
         JSL   L1512CB
         LDY   #$00EB
         LDA   [$F8],Y
         EOR   #$0001
         AND   $01,S
         PLX
         PHA
         PHY
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$CD],Y
         TAX
         LDA   [$CD]
         CLC
         ADC   #$0008
         BCC   L23250A
         INX
L23250A  PHX
         PHA
         JSL   L1512CB
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L232523
         PEA   $000C
         JSL   L0724F7
         BRA   L23252A
L232523  PEA   $0004
         JSL   L0724F7
L23252A  BRA   L23252C
L23252C  LDA   $ED
         BNE   L232533
         BRL   L232013
L232533  PEI   $D9
         PEI   $D7
         JSL   L072634
         PEI   $CB
         PEI   $C9
         JSL   L07191C
         PEA   $0200
         PEA   $8010
         PEA   $0000
         PEA   $41A0
         JSL   L1510BF
         PEA   $0006
         JSL   L0724F7
         PHY
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $EB
         LDY   #$00EB
         LDA   [$F8],Y
         BNE   L232582
         STZ   L055135
         STZ   L055139
         PEA   ^L053259
         PEA   L053259
         JSL   L085216
L232582  JSL   L09AFB1
         LDY   #$00B3
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L151131
         LDY   #$00B3
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L1517CD
         PEI   $D5
         JSL   L0724F7
L2325AA  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$01F8
         TCS
         RTL

L2325BC  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$00E9
         LDA   [$0A],Y
         DEC
         DEC
         BNE   L232613
         LDA   #$0055
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L2325D8
         INX
L2325D8  CLC
         ADC   #$0002
         BCC   L2325DF
         INX
L2325DF  STA   $01
         STX   $03
         LDA   [$01]
         INC
         INC
         PHA
         PEI   $0E
         JSL   L1510C5
         LDA   #$0055
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L2325F9
         INX
L2325F9  CLC
         ADC   #$0006
         BCC   L232600
         INX
L232600  STA   $01
         STX   $03
         LDA   [$01]
         SEC
         SBC   #$0004
         PHA
         PEI   $0E
         JSL   L1505DA
         BRA   L232641
L232613  PEI   $10
         LDY   #$0055
         LDA   [$0A],Y
         INC
         PHA
         JSL   L1510C5
         PEI   $10
         LDA   #$0055
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L23262D
         INX
L23262D  CLC
         ADC   #$0004
         BCC   L232634
         INX
L232634  STA   $01
         STX   $03
         LDA   [$01]
         DEC
         DEC
         PHA
         JSL   L1505DA
L232641  LDA   $08
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

L232653  PHD
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
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         LDY   #$00ED
         LDA   [$12],Y
         BEQ   L23268B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         BRA   L232698
L23268B  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151418
L232698  LDA   $10
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

L2326AA  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000B
         JSL   L072B6B
         PLA
         STAL  L051F12
         PHY
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000C
         JSL   L072B6B
         PLA
         STAL  L051F14
         PHY
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000D
         JSL   L072B6B
         PLA
         STAL  L051F0E
         PHY
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000E
         JSL   L072B6B
         PLA
         STAL  L051F10
         PHY
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000F
         JSL   L072B6B
         PLA
         SEC
         SBC   #$000B
         STAL  L051F0A
         PHY
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0010
         JSL   L072B6B
         PLA
         SEC
         SBC   #$001A
         STAL  L051F0C
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

L23275B  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         LDY   #$00A1
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         LDY   #$00A5
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         JSL   L033477
         BVS   L232783
         EOR   #$8000
L232783  BPL   L23278A
         LDA   #$00FF
         STA   $01
L23278A  PEI   $01
         LDY   #$0099
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0003
         JSL   L072E7C
         STZ   $01
         LDY   #$00A1
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         LDY   #$00A9
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         JSL   L033477
         BEQ   L2327C2
         BVS   L2327C0
         EOR   #$8000
L2327C0  BMI   L2327C7
L2327C2  LDA   #$00FF
         STA   $01
L2327C7  PEI   $01
         LDY   #$0099
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0004
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

L2327ED  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         LDY   #$00B1
         LDA   [$0C],Y
         DEC
         DEC
         DEC
         BPL   L232804
         BRL   L232899
L232804  CMP   #$0002
         BMI   L23280C
         BRL   L232899
L23280C  SEC
         SBC   #$0000
         BEQ   L23285A
         DEC
         BEQ   L232818
         BRL   L232899
L232818  LDY   #$00A1
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         LDY   #$00A9
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         JSL   L033477
         BEQ   L232858
         BVS   L232838
         EOR   #$8000
L232838  BPL   L232858
         LDY   #$00A1
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         TAY
         BNE   L232848
         DEX
L232848  DEC
         LDY   #$009F
         STA   [$0C],Y
         INY
         INY
         TXA
         STA   [$0C],Y
         LDA   #$0001
         STA   $01
L232858  BRA   L232899
L23285A  LDY   #$00A1
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         LDY   #$00A5
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         JSL   L033477
         BVS   L232878
         EOR   #$8000
L232878  BMI   L232897
         LDY   #$00A1
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         INC
         BNE   L232888
         INX
L232888  LDY   #$009F
         STA   [$0C],Y
         INY
         INY
         TXA
         STA   [$0C],Y
         LDA   #$0001
         STA   $01
L232897  BRA   L232899
L232899  LDA   $01
         BEQ   L2328E1

*

         LDA   #$009B
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L2328A8
         INX
L2328A8  STA   $03
         STX   $05
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDY   #$00A1
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         JSL   L07B8EA
         PLA
         STA   [$03]
         PLA
         LDY   #$0002
         STA   [$03],Y
         LDA   #$006D
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L2328DB
         INX
L2328DB  PHX
         PHA
         JSL   L150B34
L2328E1  LDA   $0A
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

L2328F3  PHD
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
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         LDY   #$00B3
         LDA   [$12],Y
         BEQ   L23292B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0021
         PEA   $000C
         JSL   L1517F1
         BRA   L232938
L23292B  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151418
L232938  LDA   $10
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

L23294A  PHD
         TSC
         CLC
         ADC   #$FF46
         TCS
         TCD
         LDX   #$0000
         LDA   #$0003
         CMPL  L051F16
         BEQ   L23295F
         INX
L23295F  TXA
         STA   $B3
         LDA   $B3
         BEQ   L23296E
         LDAL  L051F10
         STA   $AF
         BRA   L232973
L23296E  LDA   #$0258
         STA   $AF
L232973  TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $AF
         LDAL  L051F0E
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PEI   $83
         PEA   $0145
         JSL   L072FA6
         PLA
         CLC
         ADC   #$000E
         STA   $83
         PHY
         PEI   $81
         PEA   $0028
         JSL   L072FA6
         PLA
         CLC
         ADC   #$002F
         STA   $81
         LDA   #$0016
         CLC
         ADC   $7D
         STA   $7D
         LDA   $83
         SEC
         SBC   $7F
         STA   $AB
         LDA   $81
         SEC
         SBC   $7D
         STA   $AD
         LDA   #$0280
         SEC
         SBC   $AB
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         AND   #$FFFE
         STA   $7F
         PHY
         PHY
         PEA   $413C
         JSL   L072834
         PLA
         STA   $97
         PLX
         STX   $99
         PEI   $AB
         PEI   $AD
         PEI   $99
         PEI   $97
         JSL   L151035
         PEI   $7F
         PEI   $7D
         PEI   $99
         PEI   $97
         JSL   L151029
         LDA   $AB
         SEC
         SBC   #$0153
         STA   $B1
         LDA   #$0001
         STA   $AF
L232A27  LDA   $AF
         DEC
         DEC
         BNE   L232A2F
         BRA   L232A6E
L232A2F  PHY
         PHY
         PEI   $99
         PEI   $97
         LDA   $AF
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $91
         PLX
         STX   $93
         LDY   #$0002
         LDA   [$91],Y
         TAX
         LDA   [$91]
         CLC
         ADC   #$0008
         BCC   L232A56
         INX
L232A56  STA   $01
         STX   $03
         LDY   #$0002
         LDA   $B1
         CLC
         ADC   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEI   $93
         PEI   $91
         JSL   L150B04
L232A6E  LDA   #$0004
         CMP   $AF
         BEQ   L232A79
         INC   $AF
         BRA   L232A27
L232A79  LDA   $B3
         BNE   L232A82
         LDA   #$0278
         STA   $AB
L232A82  TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         LDA   $AB
         SEC
         SBC   $73
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         AND   #$FFFE
         PHA
         LDA   #$0014
         CLC
         ADC   $AD
         SEC
         SBC   $71
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L1501AF
         PEA   $0000
         PEA   $0000
         LDAL  L051F08
         PHA
         LDAL  L051F06
         PHA
         TDC
         CLC
         ADC   #$00A7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         JSL   L160ABC
         LDA   $A7
         LDX   $A9
         STA   $9F
         STX   $A1
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $A1
         PEI   $9F
         JSL   L07B8EA
         PLA
         STA   $9B
         PLX
         STX   $9D
         PEA   $0000
         PHD
         JSL   L23275B
         PEI   $99
         PEI   $97
         JSL   L15102F
         PEI   $99
         PEI   $97
         JSL   L1511C8
         PEI   $99
         PEI   $97
         JSL   L151131
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
         PEA   $0004
         JSL   L1516ED
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0940E5
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PHY
         JSL   L0727BF
         PLA
         STA   $95
L232B52  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $B1
         LDA   $B1
         SEC
         SBC   #$FFFE
         BVS   L232B6C
         BPL   L232B6A
         BRL   L232D14
L232B6A  BRA   L232B71
L232B6C  BMI   L232B71
         BRL   L232D14
L232B71  CMP   #$0007
         BMI   L232B79
         BRL   L232D14
L232B79  SEC
         SBC   #$0000
         BEQ   L232B9D
         SEC
         SBC   #$0003
         BNE   L232B88
         BRL   L232CDA
L232B88  DEC
         BNE   L232B8E
         BRL   L232CDA
L232B8E  DEC
         BNE   L232B94
         BRL   L232D02
L232B94  DEC
         BNE   L232B9A
         BRL   L232D02
L232B9A  BRL   L232D14
L232B9D  PEI   $99
         PEI   $97
         JSL   L1506B3
         PHY
         PHY
         JSL   L1516CF
         PLA
         STA   $89
         PLX
         STX   $8B
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $8D
         PLX
         STX   $8F
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $AB
         PEI   $AD
         JSL   L15100B
         JSL   L150659
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L2328F3
         PEI   $8F
         PEI   $8D
         JSL   L15166F
         PEI   $8F
         PEI   $8D
         JSL   L1516C9
         PEA   ^L230020
         PEA   L230020
         JSL   L151198
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   $0000
         JSL   L081DD8
         PHY
         PHY
         JSL   L150695
         PLA
         STA   $61
         PLX
         STX   $63
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEI   $8F
         PEI   $8D
         JSL   L1516B1
         JSL   L150659
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L2328F3
         PEI   $8F
         PEI   $8D
         JSL   L15166F
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L15123D
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEI   $9D
         PEI   $9B
         JSL   L160A68
         PEI   $8B
         PEI   $89
         JSL   L1516C9
         PEI   $8F
         PEI   $8D
         JSL   L151669
         PEI   $63
         PEI   $61
         JSL   L1609CE
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L2328F3
         PEI   $99
         PEI   $97
         JSL   L1517CD
         PEI   $99
         PEI   $97
         JSL   L1506AD
         BRA   L232D14
L232CDA  LDA   #$0800
         ANDL  L0540AD
         BEQ   L232D00
         LDA   #$0001
         STA   L05533B
         LDA   #$0001
         STA   L05533F
         LDA   $B1
         DEC
         BNE   L232D00
         LDA   #$0001
         STA   L055339
         LDA   #$0001
         STA   L05533D
L232D00  BRA   L232D14
L232D02  PEA   $0000
         PHD
         JSL   L2327ED
         PEA   $0000
         PHD
         JSL   L23275B
         BRA   L232D14
L232D14  LDX   #$0000
         LDA   $B1
         DEC
         BNE   L232D1D
         INX
L232D1D  PHX
         LDX   #$0000
         LDA   $B1
         DEC
         DEC
         BNE   L232D28
         INX
L232D28  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L232D32
         BRL   L232B52
L232D32  PEI   $99
         PEI   $97
         JSL   L072634
         PEI   $95
         JSL   L0724F7
         PEA   ^L051EF8
         PEA   L051EF8
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L0808E0
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $B5
         STZ   L055139
         STZ   L055135
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L085216
         LDY   #$00B3
         LDA   [$C0],Y
         PHA
         DEY
         DEY
         LDA   [$C0],Y
         PHA
         JSL   L151131
         JSL   L09AFB1
         LDA   $BE
         STA   $C2
         LDA   $BD
         STA   $C1
         LDA   $BB
         TCD
         TSC
         CLC
         ADC   #$00C0
         TCS
         RTL

L232D9C  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$FFFF
         CMP   $0E
         BNE   L232DE1
         LDA   #$00AD
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L232DB6
         INX
L232DB6  STA   $01
         STX   $03
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   $0A
         LDX   $0C
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         PHX
         PHA
         JSL   L150371
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         BRA   L232E1A
L232DE1  LDA   #$00AD
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L232DEC
         INX
L232DEC  STA   $01
         STX   $03
         LDY   #$00A7
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDA   $0E
         PEA   $001C
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L232E0E
         DEX
L232E0E  JSL   L150F53
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
L232E1A  LDA   #$00EB
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L232E25
         INX
L232E25  STA   $01
         STX   $03
         LDY   #$00AF
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDY   #$00A7
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L033477
         BNE   L232E49
         LDA   #$0000
         BRA   L232E4C
L232E49  LDA   #$0001
L232E4C  STA   [$01]
         LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L232E60  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$00A7
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDA   $12
         PEA   $001C
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L232E86
         DEX
L232E86  JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$00AF
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         CMP   $01
         BNE   L232E9E
         CPX   $03
L232E9E  BEQ   L232EBF
         LDA   $12
         INC
         PHA
         LDY   #$009F
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         JSL   L1513EE
         PEA   $FFFF
         PEA   $0000
         PEI   $0E
         JSL   L232D9C
L232EBF  LDA   $0C
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

L232ED1  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L051F12
         PHA
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000B
         JSL   L073B05
         LDAL  L051F14
         PHA
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000C
         JSL   L073B05
         LDAL  L051F0E
         PHA
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000D
         JSL   L073B05
         LDAL  L051F10
         PHA
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000E
         JSL   L073B05
         LDA   #$000B
         CLC
         ADCL  L051F0A
         PHA
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $000F
         JSL   L073B05
         LDA   #$001A
         CLC
         ADCL  L051F0C
         PHA
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0010
         JSL   L073B05
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

L232F7C  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         LDY   #$001E
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         CLC
         ADC   #$00B1
         BCC   L232F97
         INX
L232F97  STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDA   $12
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$000B
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         PEI   $03
         PEI   $01
         JSL   L1506FF
         PEI   $16
         PEI   $14
         PEI   $03
         PEI   $01
         JSL   L1505EC
         LDA   $0C
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

L232FE8  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   #$0006
         ANDL  L051F04
         JSL   L150488
         PEA   $8000
         PEA   $0000
         JSL   L150F53
         STA   $09
         STX   $0B
         LDA   #$0055
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L233014
         INX
L233014  STA   $05
         STX   $07
         LDY   #$0006
         LDA   [$05],Y
         LDY   #$0002
         SEC
         SBC   [$05],Y
         STA   $11
         LDY   #$0004
         LDA   [$05],Y
         SEC
         SBC   [$05]
         STA   $0F
         LDA   #$004D
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L23303A
         INX
L23303A  STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         STA   $13
         LDA   $11
         SEC
         SBC   $13
         STA   $11
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   [$01]
         STA   $13
         LDA   $0F
         SEC
         SBC   $13
         STA   $0F
         PEA   $0068
         PEA   $0000
         PEA   $000B
         PEA   $0000
         PHD
         JSL   L232F7C
         PEA   $00F0
         PEA   $0000
         PEA   $000C
         PEA   $0000
         PHD
         JSL   L232F7C
         PHY
         LDA   #$0055
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L233091
         INX
L233091  CLC
         ADC   #$0004
         BCC   L233098
         INX
L233098  STA   $13
         STX   $15
         LDA   [$13]
         LDY   #$004D
         SEC
         SBC   [$1C],Y
         ASL
         PHA
         PEA   $0096
         JSL   L072FD5
         PEA   $000A
         PEA   $000D
         PEA   $0000
         PHD
         JSL   L232F7C
         PHY
         LDA   #$0055
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L2330C7
         INX
L2330C7  CLC
         ADC   #$0006
         BCC   L2330CE
         INX
L2330CE  STA   $13
         STX   $15
         LDA   [$13]
         PHA
         LDA   #$004D
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L2330E0
         INX
L2330E0  CLC
         ADC   #$0002
         BCC   L2330E7
         INX
L2330E7  STA   $13
         STX   $15
         PLA
         SEC
         SBC   [$13]
         ASL
         PHA
         PEA   $0248
         JSL   L072FD5
         PEA   $0060
         PEA   $000E
         PEA   $0000
         PHD
         JSL   L232F7C
         LDA   $0F
         ASL
         CLC
         ADC   #$000B
         PHA
         PEA   $000B
         PEA   $000F
         PEA   $0000
         PHD
         JSL   L232F7C
         LDA   $11
         ASL
         CLC
         ADC   #$001A
         PHA
         PEA   $001A
         PEA   $0010
         PEA   $0000
         PHD
         JSL   L232F7C
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

L233144  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PEA   $FFFF
         PEA   $0000
         PEI   $0C
         JSL   L232D9C
         LDA   #$00E5
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L233163
         INX
L233163  STA   $03
         STX   $05
         LDY   #$00AF
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         LDY   #$00A7
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         JSL   L1512A5
         PHX
         PHA
         PEA   $0000
         PEA   $001C
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   [$03]
         STZ   $01
         LDY   #$00AF
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         CLC
         ADC   #$0006
         BCC   L2331A5
         INX
L2331A5  STA   $03
         STX   $05
         LDA   #$0080
         AND   [$03]
         BNE   L2331B5
         LDA   #$00FF
         STA   $01
L2331B5  PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0004
         JSL   L072E7C
         STZ   $01
         LDY   #$00EB
         LDA   [$0C],Y
         BEQ   L233201
         LDY   #$00AF
         LDA   [$0C],Y
         TAX
         DEY
         DEY
         LDA   [$0C],Y
         CLC
         ADC   #$0006
         BCC   L2331E3
         INX
L2331E3  STA   $03
         STX   $05
         LDA   #$0010
         AND   [$03]
         PHA
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0008
         JSL   L073B05
         BRA   L233206
L233201  LDA   #$00FF
         STA   $01
L233206  PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0011
         JSL   L072E7C
         PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0005
         JSL   L072E7C
         PEI   $01
         LDY   #$00B3
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0008
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

L233254  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$004D
         CLC
         ADC   $12
         LDX   $14
         BCC   L233267
         INX
L233267  PHX
         PHA
         JSL   L08273B
         LDA   #$004D
         CLC
         ADC   $12
         LDX   $14
         BCC   L233278
         INX
L233278  PHX
         PHA
         LDA   #$0055
         CLC
         ADC   $12
         LDX   $14
         BCC   L233285
         INX
L233285  CLC
         ADC   #$0002
         BCC   L23328C
         INX
L23328C  STA   $09
         STX   $0B
         LDA   [$09]
         PHA
         LDY   #$0055
         LDA   [$12],Y
         PHA
         JSL   L1501AF
         LDAL  L051F16
         DEC
         BPL   L2332A7
         BRL   L233436
L2332A7  CMP   #$0003
         BMI   L2332AF
         BRL   L233436
L2332AF  SEC
         SBC   #$0000
         BEQ   L2332C1
         DEC
         BEQ   L2332C1
         DEC
         BNE   L2332BE
         BRL   L2333A7
L2332BE  BRL   L233436
L2332C1  LDA   #$004D
         CLC
         ADC   $12
         LDX   $14
         BCC   L2332CC
         INX
L2332CC  STA   $05
         STX   $07
         LDA   #$0006
         CLC
         ADC   $05
         LDX   $07
         BCC   L2332DB
         INX
L2332DB  PHX
         PHA
         LDY   #$0006
         LDA   [$05],Y
         PHA
         LDAL  L051F10
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         PLA
         CLC
         ADC   $09
         PLX
         STX   $09
         PLX
         STX   $0B
         STA   [$09]
         LDA   #$0004
         CLC
         ADC   $05
         LDX   $07
         BCC   L23330A
         INX
L23330A  PHX
         PHA
         LDY   #$0004
         LDA   [$05],Y
         PHA
         LDAL  L051F0E
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         PLA
         CLC
         ADC   $09
         PLX
         STX   $09
         PLX
         STX   $0B
         STA   [$09]
         LDA   #$004D
         CLC
         ADC   $12
         LDX   $14
         BCC   L233339
         INX
L233339  PHX
         PHA
         LDAL  L051F0C
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         LDAL  L051F0A
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L1501AF
         LDA   #$00BB
         CLC
         ADC   $12
         LDX   $14
         BCC   L233368
         INX
L233368  PHX
         PHA
         LDY   #$0006
         LDA   [$05],Y
         PHA
         LDAL  L051F14
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         PLA
         CLC
         ADC   $09
         PHA
         LDY   #$0004
         LDA   [$05],Y
         PHA
         LDAL  L051F12
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         PLA
         CLC
         ADC   $09
         PHA
         JSL   L151355
         BRL   L233436
L2333A7  LDA   #$004D
         CLC
         ADC   $12
         LDX   $14
         BCC   L2333B2
         INX
L2333B2  STA   $01
         STX   $03
         LDA   #$0055
         CLC
         ADC   $12
         LDX   $14
         BCC   L2333C1
         INX
L2333C1  CLC
         ADC   #$0006
         BCC   L2333C8
         INX
L2333C8  STA   $09
         STX   $0B
         LDA   [$09]
         LDY   #$0006
         STA   [$01],Y
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L2333DE
         INX
L2333DE  PHX
         PHA
         LDY   #$0004
         LDA   [$01],Y
         PHA
         LDAL  L051F0E
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         PLA
         CLC
         ADC   $09
         PLX
         STX   $09
         PLX
         STX   $0B
         STA   [$09]
         LDA   #$00BB
         CLC
         ADC   $12
         LDX   $14
         BCC   L23340D
         INX
L23340D  PHX
         PHA
         LDY   #$0006
         LDA   [$01],Y
         PHA
         LDY   #$0004
         LDA   [$01],Y
         PHA
         LDAL  L051F12
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         PLA
         CLC
         ADC   $09
         PHA
         JSL   L151355
         BRA   L233436
L233436  LDA   $10
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

L233448  PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         STZ   $4C
         LDA   $44
         LDX   $46
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         CLC
         ADC   #$0008
         BCC   L233467
         INX
L233467  STA   $3B
         STX   $3D
         LDA   [$3B]
         BNE   L233472
         BRL   L23388A
L233472  PEA   $000C
         JSL   L0724F7
         LDY   #$00B3
         LDA   [$44],Y
         TAX
         DEY
         DEY
         LDA   [$44],Y
         CLC
         ADC   #$00BE
         BCC   L23348A
         INX
L23348A  STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0002
         BCC   L2334A9
         INX
L2334A9  STA   $19
         STX   $1B
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   #$004D
         CLC
         ADC   $44
         LDX   $46
         BCC   L2334C1
         INX
L2334C1  CLC
         ADC   #$0002
         BCC   L2334C8
         INX
L2334C8  STA   $3B
         STX   $3D
         LDA   [$3B]
         PHA
         LDY   #$004D
         LDA   [$44],Y
         PHA
         LDY   #$0006
         LDA   [$19],Y
         LDY   #$0002
         SEC
         SBC   [$19],Y
         PHA
         LDY   #$0004
         LDA   [$19],Y
         SEC
         SBC   [$19]
         PHA
         JSL   L15100B
         LDA   #$0200
         ANDL  L0540AD
         BNE   L233500
         STZ   $35
         STZ   $33
         STZ   $31
         BRL   L2335CC
L233500  LDA   #$0008
         STA   $35
         LDA   #$004D
         CLC
         ADC   $44
         LDX   $46
         BCC   L233510
         INX
L233510  CLC
         ADC   #$0002
         BCC   L233517
         INX
L233517  STA   $3B
         STX   $3D
         LDA   [$3B]
         PHA
         PEA   $0008
         JSL   L150318
         PLX
         PLX
         STA   $33
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L233534
         INX
L233534  CLC
         ADC   #$0002
         BCC   L23353B
         INX
L23353B  STA   $3B
         STX   $3D
         LDA   [$3B]
         SEC
         SBC   $33
         PHA
         PEA   $0008
         JSL   L150318
         PLX
         PLX
         STA   $33
         LDA   $33
         SEC
         SBC   #$0004
         BEQ   L233569
         BVS   L23355D
         EOR   #$8000
L23355D  BPL   L233569
         LDA   #$0008
         SEC
         SBC   $33
         STA   $33
         BRA   L233571
L233569  LDA   $33
         EOR   #$FFFF
         INC
         STA   $33
L233571  LDY   #$004D
         LDA   [$44],Y
         PHA
         PEA   $0004
         JSL   L150318
         PLX
         PLX
         STA   $31
         LDY   #$0045
         LDA   [$44],Y
         SEC
         SBC   $31
         PHA
         PEA   $0004
         JSL   L150318
         PLX
         PLX
         STA   $31
         LDA   $31
         SEC
         SBC   #$0002
         BEQ   L2335AF
         BVS   L2335A3
         EOR   #$8000
L2335A3  BPL   L2335AF
         LDA   #$0004
         SEC
         SBC   $31
         STA   $31
         BRA   L2335B7
L2335AF  LDA   $31
         EOR   #$FFFF
         INC
         STA   $31
L2335B7  LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L2335C2
         INX
L2335C2  PHX
         PHA
         PEI   $33
         PEI   $31
         JSL   L1501AF
L2335CC  PHY
         PHY
         PEA   ^L230000
         PEA   L230000
         PEI   $4A
         PEI   $48
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L2335E3
         INX
L2335E3  PHX
         PHA
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEI   $35
         JSL   L160C28
         PLA
         STA   $2D
         PLX
         STX   $2F
         LDA   $2F
         BEQ   L233601
         LDA   #$0001
L233601  PHA
         LDA   $2D
         BEQ   L233609
         LDA   #$0001
L233609  ORA   $01,S
         PLX
         PHA
         LDA   $33
         BEQ   L233614
         LDA   #$0001
L233614  ORA   $01,S
         PLX
         PHA
         LDA   $31
         BEQ   L23361F
         LDA   #$0001
L23361F  ORA   $01,S
         PLX
         LSR
         BCS   L233628
         BRL   L233883
L233628  TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L23363C
         INX
L23363C  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEI   $2F
         PEI   $2D
         JSL   L1501AF
         LDA   $27
         STA   $4A
         LDA   $25
         STA   $48
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         LDA   #$004D
         CLC
         ADC   $44
         LDX   $46
         BCC   L233672
         INX
L233672  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $29
         SEC
         SBC   #$0004
         STA   $29
         LDA   $2B
         SEC
         SBC   #$0005
         STA   $2B
         PHY
         TDC
         CLC
         ADC   #$0048
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L2336A9
         BRL   L233875
L2336A9  LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L2336B4
         INX
L2336B4  PHX
         PHA
         PEI   $2F
         PEI   $2D
         JSL   L1501AF
         LDY   #$00EB
         LDA   [$44],Y
         BNE   L2336C8
         BRL   L2337B4
L2336C8  LDY   #$00AF
         LDA   [$44],Y
         TAX
         DEY
         DEY
         LDA   [$44],Y
         CLC
         ADC   #$0006
         BCC   L2336D9
         INX
L2336D9  STA   $15
         STX   $17
         PHY
         LDA   #$0004
         CLC
         ADC   $15
         LDX   $17
         BCC   L2336E9
         INX
L2336E9  PHX
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCC   L23372D
         LDA   #$0004
         CLC
         ADC   $15
         LDX   $17
         BCC   L2336FE
         INX
L2336FE  PHX
         PHA
         LDA   #$0004
         CLC
         ADC   $15
         LDX   $17
         BCC   L23370B
         INX
L23370B  CLC
         ADC   #$0002
         BCC   L233712
         INX
L233712  STA   $3B
         STX   $3D
         LDA   [$3B]
         EOR   #$FFFF
         INC
         PHA
         LDY   #$0004
         LDA   [$15],Y
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         BRA   L23374A
L23372D  LDA   #$0004
         CLC
         ADC   $15
         LDX   $17
         BCC   L233738
         INX
L233738  PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0060
         PEA   $000A
         JSL   L15100B
L23374A  LDA   #$004D
         CLC
         ADC   $44
         LDX   $46
         BCC   L233755
         INX
L233755  STA   $11
         STX   $13
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L233764
         INX
L233764  PHX
         PHA
         LDY   #$0002
         LDA   [$11],Y
         EOR   #$FFFF
         INC
         PHA
         LDA   [$11]
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L233786
         INX
L233786  STA   $0D
         STX   $0F
         LDY   #$00AF
         LDA   [$44],Y
         TAX
         DEY
         DEY
         LDA   [$44],Y
         CLC
         ADC   #$0006
         BCC   L23379B
         INX
L23379B  CLC
         ADC   #$0004
         BCC   L2337A2
         INX
L2337A2  PHX
         PHA
         LDY   #$0002
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         ASL
         PHA
         JSL   L1501AF
         BRA   L23382D
L2337B4  PHY
         PEA   ^L051EF8
         PEA   L051EF8
         JSL   L1500E3
         PLA
         LSR
         BCS   L2337D9
         PEA   ^L051EF8
         PEA   L051EF8
         PEA   $0000
         PEA   $0000
         PEA   $001E
         PEA   $000C
         JSL   L15100B
L2337D9  LDA   #$004D
         CLC
         ADC   $44
         LDX   $46
         BCC   L2337E4
         INX
L2337E4  STA   $09
         STX   $0B
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L2337F3
         INX
L2337F3  PHX
         PHA
         LDY   #$0002
         LDA   [$09],Y
         EOR   #$FFFF
         INC
         PHA
         LDA   [$09]
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         LDA   #$0045
         CLC
         ADC   $44
         LDX   $46
         BCC   L233815
         INX
L233815  STA   $05
         STX   $07
         PEA   ^L051F00
         PEA   L051F00
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         ASL
         PHA
         JSL   L151355
L23382D  LDY   #$00AF
         LDA   [$44],Y
         TAX
         DEY
         DEY
         LDA   [$44],Y
         CLC
         ADC   #$0006
         BCC   L23383E
         INX
L23383E  STA   $01
         STX   $03
         LDA   [$01]
         STA   $37
         LDA   #$0080
         ORA   [$01]
         STA   [$01]
         LDA   #$0080
         AND   $37
         BNE   L233873
         LDY   #$00AF
         LDA   [$44],Y
         PHA
         DEY
         DEY
         LDA   [$44],Y
         PHA
         LDA   $44
         LDX   $46
         PEA   $0000
         PEA   $000D
         JSL   L150F53
         PHX
         PHA
         JSL   L1505A4
L233873  BRA   L23387E
L233875  PEA   $0000
         PEI   $44
         JSL   L230F1F
L23387E  LDA   #$0001
         STA   $4C
L233883  PEA   $0004
         JSL   L0724F7
L23388A  LDA   $42
         STA   $4A
         LDA   $41
         STA   $49
         LDA   $3F
         TCD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L23389C  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$00B3
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         CMP   $0E
         BNE   L2338B4
         CPX   $10
L2338B4  BNE   L233904
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L1506B3
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L1517CD
         PEA   $0000
         PEI   $0A
         JSL   L23189B
         PEA   $0001
         PEA   $0000
         PEI   $0A
         JSL   L23137A
         LDY   #$00B3
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L1506AD
L233904  LDA   $08
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

L233916  PHD
         TSC
         CLC
         ADC   #$FEFE
         TCS
         ADC   #$000B
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $B7
         PLX
         STX   $B9
         PHY
         LDA   L055323
         LDX   L055325
         PHX
         PHA
         JSL   L0718FA
         PLA
         STA   $D5
         LDA   L055323
         LDX   L055325
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $A5
         STX   $A7
         PHY
         PHY
         PEA   $4268
         JSL   L072834
         PLA
         STA   $B1
         PLX
         STX   $B3
         PHY
         PHY
         JSL   L2302D2
         PLA
         STA   $91
         PLX
         STX   $93
         LDA   $91
         ORA   $93
         BNE   L233977
         BRL   L234FA4
L233977  PHY
         PHY
         JSL   L160BD4
         PLA
         STA   $8D
         PLX
         STX   $8F
         LDA   $8D
         ORA   $8F
         BNE   L23398C
         BRL   L234F9C
L23398C  PHY
         PEA   $0000
         PHD
         JSL   L230FD2
         PLA
         LSR
         BCC   L23399C
         BRL   L234F94
L23399C  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0189
         PEA   $0037
         PEA   $0231
         PEA   $0061
         JSL   L15100B
         LDA   $D3
         INC
         STA   $15
         LDA   #$000A
         STA   $25
         LDA   #$0004
         STA   $17
         LDA   #$0002
         STA   $19
         LDA   #$0001
         STA   $1B
         LDA   #L230190
         LDX   #^L230190
         STA   $21
         STX   $23
         LDA   #$001C
         STA   $27
         LDA   $A5
         LDX   $A7
         STA   $29
         STX   $2B
         LDA   #$0000
         LDX   #$8000
         STA   $2D
         STX   $2F
         STZ   $31
         STZ   $33
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $3D
         INC
         STA   $3D
         LDA   $3F
         INC
         INC
         STA   $3F
         LDA   $41
         DEC
         DEC
         STA   $41
         PHY
         PHY
         PEI   $B3
         PEI   $B1
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L1500E9
         PLA
         STA   $9D
         PLX
         STX   $9F
         PHY
         PHY
         PEA   $0000
         PEA   ^L230090
         PEA   L230090
         JSL   L1502E8
         PLA
         STA   $95
         PLX
         STX   $97
         LDAL  L051F04
         PHA
         PEI   $B3
         PEI   $B1
         PEA   $0007
         JSL   L073B05
         LDAL  L051F16
         PHA
         PEI   $B3
         PEI   $B1
         PEA   $0006
         JSL   L073B05
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PHY
         PHY
         PEI   $B3
         PEI   $B1
         PEA   $000A
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         PEA   $0000
         PHD
         JSL   L232FE8
         PEA   $0000
         PHD
         JSL   L232ED1
         PEI   $B3
         PEI   $B1
         JSL   L15102F
         PEI   $B3
         PEI   $B1
         JSL   L1511C8
         PEI   $B3
         PEI   $B1
         JSL   L151131
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEI   $A7
         PEI   $A5
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L15146C
         PEA   $0000
         PHD
         JSL   L233144
         PEA   $0000
         PHD
         JSL   L230D97
         PEA   $0000
         PHD
         JSL   L233254
         PHY
         JSL   L0727BF
         PLA
         STA   $B5
         STZ   L05533B
         STZ   L055339
L233AF1  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $DD
         LDAL  L05409F
         DEC
         BNE   L233B2A
         PHY
         TDC
         CLC
         ADC   #$00A1
         PEA   $0000
         PHA
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEI   $B3
         PEI   $B1
         JSL   L150482
         PLA
         CMP   #$0088
         BNE   L233B2A
         LDA   #$0088
         STA   $DD
L233B2A  LDAL  L0540AB
         TAX
         LDAL  L0540A9
         STA   $CF
         STX   $D1
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L150BE8
         LDA   #$FFFD
         CMP   $DD
         BEQ   L233B4E
         BRL   L233C91
L233B4E  LDA   #$007F
         ANDL  L0540A1
         STA   $E1
         LDA   $E1
         SEC
         SBC   #$000A
         BPL   L233B62
         BRL   L233C85
L233B62  CMP   #$0076
         BMI   L233B6A
         BRL   L233C85
L233B6A  SEC
         SBC   #$0000
         BEQ   L233B89
         DEC
         BEQ   L233B89
         DEC
         DEC
         BNE   L233B7A
         BRL   L233C3B
L233B7A  SEC
         SBC   #$000B
         BEQ   L233BC0
         SEC
         SBC   #$0067
         BEQ   L233BC0
         BRL   L233C85
L233B89  PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDX   #$0000
         LDA   #$000B
         CMP   $E1
         BNE   L233B9E
         INX
L233B9E  PHX
         JSL   L072227
         PLA
         STA   $EF
         PEA   $0000
         PHD
         JSL   L233144
         LDA   $EF
         BEQ   L233BBD
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L23137A
L233BBD  BRL   L233C91
L233BC0  LDA   #$0006
         CLC
         ADC   $AD
         LDX   $AF
         BCC   L233BCB
         INX
L233BCB  STA   $09
         STX   $0B
         LDA   #$0080
         AND   [$09]
         BEQ   L233C39
         LDA   #$FF77
         AND   [$09]
         STA   [$09]
         PEI   $AF
         PEI   $AD
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L1505A4
         PEA   $0000
         PHD
         JSL   L233144
         LDA   $EB
         BEQ   L233C24
         LDA   #$0004
         CLC
         ADC   $09
         LDX   $0B
         BCC   L233C05
         INX
L233C05  PHX
         PHA
         JSL   L08273B
         LDA   #$000C
         CLC
         ADC   $09
         LDX   $0B
         BCC   L233C16
         INX
L233C16  PHX
         PHA
         PEA   $0000
         PEA   $000A
         JSL   L071EC5
         BRA   L233C2E
L233C24  PEA   ^L051EF8
         PEA   L051EF8
         JSL   L08273B
L233C2E  PEA   $0001
         PEA   $0000
         PHD
         JSL   L23137A
L233C39  BRA   L233C91
L233C3B  LDA   #$2100
         ANDL  L0540AD
         BNE   L233C52
         PHY
         PEI   $B3
         PEI   $B1
         JSL   L072354
         PLA
         STA   $DD
         BRA   L233C83
L233C52  LDY   #$0006
         LDA   #$0080
         AND   [$AD],Y
         CMP   #$0000
         BEQ   L233C83
         PEA   $0001
         PEI   $B3
         PEI   $B1
         PEA   $0004
         JSL   L072E7C
         PEA   $0000
         PEI   $B3
         PEI   $B1
         PEA   $0004
         JSL   L072E7C
         PEA   $0000
         PHD
         JSL   L231DE3
L233C83  BRA   L233C91
L233C85  PHY
         PEI   $B3
         PEI   $B1
         JSL   L072354
         PLA
         STA   $DD
L233C91  LDA   #$FFFE
         CMP   $DD
         BNE   L233C9D
         LDA   #$0063
         STA   $DD
L233C9D  LDA   $DD
         BPL   L233CA4
         BRL   L234F58
L233CA4  CMP   #$0089
         BMI   L233CAC
         BRL   L234F58
L233CAC  SEC
         SBC   #$0000
         BEQ   L233D09
         DEC
         BNE   L233CB8
         BRL   L233F20
L233CB8  DEC
         BNE   L233CBE
         BRL   L233F44
L233CBE  DEC
         BNE   L233CC4
         BRL   L23400A
L233CC4  DEC
         BNE   L233CCA
         BRL   L234015
L233CCA  DEC
         BNE   L233CD0
         BRL   L233F5C
L233CD0  DEC
         BNE   L233CD6
         BRL   L234081
L233CD6  DEC
         BNE   L233CDC
         BRL   L234101
L233CDC  DEC
         BNE   L233CE2
         BRL   L234020
L233CE2  DEC
         DEC
         BNE   L233CE9
         BRL   L2342AE
L233CE9  DEC
         BPL   L233CEF
         BRL   L234F58
L233CEF  CMP   #$0006
         BCS   L233CF7
         BRL   L23415D
L233CF7  SEC
         SBC   #$0058
         BEQ   L233D09
         SEC
         SBC   #$0025
         BNE   L233D06
         BRL   L2341AF
L233D06  BRL   L234F58
L233D09  LDA   $DD
         BEQ   L233D1F
         LDAL  L0540A3
         PHA
         LDAL  L0540A1
         PHA
         PEA   $0000
         PHD
         JSL   L23389C
L233D1F  LDA   #$0004
         STA   $E1
         LDX   #$0000
         LDA   #$0003
         CMPL  L051F16
         BEQ   L233D31
         INX
L233D31  TXA
         STA   $ED
         LDX   #$0000
         LDA   #$0100
         ANDL  L0540AD
         BNE   L233D41
         INX
L233D41  TXA
         STA   $EF
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L233D62
         BRL   L233DE7
L233D62  LDA   $BB
         DEC
         STA   $F3
         LDA   $CF
         SEC
         SBC   $F3
         BVS   L233D71
         EOR   #$8000
L233D71  BMI   L233D78
         LDA   #$0000
         BRA   L233D7B
L233D78  LDA   #$0001
L233D7B  PHA
         LDA   $BB
         INC
         INC
         INC
         STA   $F3
         LDA   $CF
         SEC
         SBC   $F3
         BVS   L233D8D
         EOR   #$8000
L233D8D  BPL   L233D94
         LDA   #$0000
         BRA   L233D97
L233D94  LDA   #$0001
L233D97  AND   $01,S
         PLX
         LSR
         BCC   L233DA2
         LDA   #$0011
         STA   $E1
L233DA2  LDA   $BD
         SEC
         SBC   #$0004
         STA   $F3
         LDA   $D1
         SEC
         SBC   $F3
         BVS   L233DB4
         EOR   #$8000
L233DB4  BMI   L233DBB
         LDA   #$0000
         BRA   L233DBE
L233DBB  LDA   #$0001
L233DBE  PHA
         LDA   #$0006
         CLC
         ADC   $BD
         STA   $F3
         LDA   $D1
         SEC
         SBC   $F3
         BVS   L233DD1
         EOR   #$8000
L233DD1  BPL   L233DD8
         LDA   #$0000
         BRA   L233DDB
L233DD8  LDA   #$0001
L233DDB  AND   $01,S
         PLX
         AND   $ED
         BEQ   L233DE7
         LDA   #$0012
         STA   $E1
L233DE7  LDA   $EF
         BNE   L233DEE
         BRL   L233EF7
L233DEE  TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         LDA   #$0007
         CLC
         ADC   $4F
         PHA
         LDA   $4D
         DEC
         PHA
         LDA   $53
         SEC
         SBC   #$0007
         PHA
         LDA   $4D
         INC
         INC
         INC
         PHA
         JSL   L15100B
         PEI   $ED
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $F3
         PLA
         AND   $F3
         BEQ   L233E39
         LDA   #$0014
         STA   $E1
L233E39  STZ   $E7
         LDA   $ED
         BEQ   L233E83
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         LDA   $53
         SEC
         SBC   #$0007
         PHA
         PEI   $4D
         LDA   #$0005
         CLC
         ADC   $53
         PHA
         LDA   #$0004
         CLC
         ADC   $51
         PHA
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L233E83
         LDA   #$0001
         STA   $E7
L233E83  TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEI   $4F
         LDA   $51
         DEC
         DEC
         DEC
         PHA
         LDA   #$0008
         CLC
         ADC   $53
         PHA
         LDA   $51
         INC
         INC
         INC
         PHA
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L233EC6
         LDA   $E7
         INC
         INC
         STA   $E7
L233EC6  LDA   $E7
         BMI   L233EF7
         CMP   #$0004
         BPL   L233EF7
         SEC
         SBC   #$0000
         BEQ   L233EE0
         DEC
         BEQ   L233EE2
         DEC
         BEQ   L233EE9
         DEC
         BEQ   L233EF0
         BRA   L233EF7
L233EE0  BRA   L233EF7
L233EE2  LDA   #$0012
         STA   $E1
         BRA   L233EF7
L233EE9  LDA   #$0011
         STA   $E1
         BRA   L233EF7
L233EF0  LDA   #$0013
         STA   $E1
         BRA   L233EF7
L233EF7  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L233F17
         LDA   #$000C
         STA   $E1
L233F17  PEI   $E1
         JSL   L0724F7
         BRL   L234F58
L233F20  LDA   #$0800
         ANDL  L0540AD
         BEQ   L233F35
         LDA   #$0001
         STA   L05533F
         LDA   #$0001
         STA   L05533D
L233F35  LDA   #$0001
         STA   L05533B
         LDA   #$0001
         STA   L055339
         BRL   L234F58
L233F44  LDA   #$0800
         ANDL  L0540AD
         BEQ   L233F53
         LDA   #$0001
         STA   L05533F
L233F53  LDA   #$0001
         STA   L05533B
         BRL   L234F58
L233F5C  PEA   $0001
         PEI   $A3
         PEI   $A1
         JSL   L150B10
         PHY
         PHY
         PEI   $B3
         PEI   $B1
         PEA   $0005
         JSL   L073032
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0004
         LDA   [$05],Y
         STA   $CF
         LDY   #$0002
         LDA   [$05],Y
         STA   $D1
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L151412
         PEA   $0000
         PHD
         JSL   L230E1A
         PHY
         PHY
         JSL   L151293
         JSL   L151131
         PHY
         PEA   $0001
         PEI   $D1
         PEI   $CF
         PEA   $0000
         PEI   $97
         PEI   $95
         JSL   L150389
         PLA
         STA   $E1
         PEI   $B3
         PEI   $B1
         JSL   L151131
         LDA   #$0006
         CLC
         ADC   $AD
         LDX   $AF
         BCC   L233FD0
         INX
L233FD0  STA   $01
         STX   $03
         LDA   $E1
         DEC
         BMI   L233FFC
         CMP   #$0002
         BPL   L233FFC
         SEC
         SBC   #$0000
         BEQ   L233FE9
         DEC
         BEQ   L233FF2
         BRA   L233FFC
L233FE9  LDA   #$FFF7
         AND   [$01]
         STA   [$01]
         BRA   L233FFC
L233FF2  PEA   $0000
         PHD
         JSL   L230E84
         BRA   L233FFC
L233FFC  PEA   $0000
         PEI   $A3
         PEI   $A1
         JSL   L150B10
         BRL   L234F58
L23400A  PEA   $0000
         PHD
         JSL   L23294A
         BRL   L234F58
L234015  PEA   $0000
         PHD
         JSL   L231DE3
         BRL   L234F58
L234020  LDA   #$0006
         CLC
         ADC   $AD
         LDX   $AF
         BCC   L23402B
         INX
L23402B  TXY
         LDX   #$FFFD
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFFD
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDX   #$FFFD
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDA   #$0010
         EOR   [$F3]
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         LDX   #$FFFD
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDA   #$0010
         AND   [$F3]
         BEQ   L234072
         LDA   #$0001
L234072  PHA
         PEI   $B3
         PEI   $B1
         PEA   $0008
         JSL   L073B05
         BRL   L234F58
L234081  PHY
         PEI   $B3
         PEI   $B1
         PEA   $0006
         JSL   L072B6B
         PLA
         STA   $E1
         LDAL  L051F16
         CMP   $E1
         BEQ   L2340FE
         LDA   $E1
         STAL  L051F16
         PEA   $0000
         PHD
         JSL   L233254
         LDA   #$0003
         CMP   $E1
         BEQ   L2340DB
         LDA   $51
         SEC
         SBC   $59
         STA   $E1
         LDA   $E1
         BMI   L2340DB
         BEQ   L2340DB
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0000
         LDA   $E1
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         LDA   $4D
         SEC
         SBC   $55
         ASL
         STAL  L051F0A
L2340DB  PEA   $0000
         PHD
         JSL   L230D97
         PEA   $0000
         PHD
         JSL   L23189B
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L23137A
         PEA   $0000
         PHD
         JSL   L231B50
L2340FE  BRL   L234F58
L234101  PHY
         PEI   $B3
         PEI   $B1
         PEA   $0007
         JSL   L072B6B
         PLA
         STA   $E1
         LDAL  L051F04
         CMP   $E1
         BEQ   L23415A
         LDA   $E1
         STAL  L051F04
         PEA   $0000
         PHD
         JSL   L232FE8
         PHY
         PHY
         PEI   $B3
         PEI   $B1
         PEA   $0010
         JSL   L073032
         PHY
         PHY
         PEI   $B3
         PEI   $B1
         PEA   $000B
         JSL   L073032
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1512D7
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L150B34
L23415A  BRL   L234F58
L23415D  PEA   $0000
         PHD
         JSL   L232FE8
         PHY
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEA   $FFFF
         PEA   $FFFF
         PEI   $A3
         PEI   $A1
         JSL   L150B0A
         PLA
         STA   $E1
         PEA   $0000
         PHD
         JSL   L2326AA
         PEA   $0000
         PHD
         JSL   L233254
         PEA   $0000
         PHD
         JSL   L23189B
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L23137A
         PEA   $0000
         PHD
         JSL   L231B50
         BRL   L234F58
L2341AF  LDAL  L0540BB
         SEC
         SBC   #$0002
         BVS   L2341BC
         EOR   #$8000
L2341BC  BPL   L2341C9
         PEA   $0000
         PHD
         JSL   L231DE3
         BRL   L2342AB
L2341C9  STZ   $F1
         LDA   $CF
         SEC
         SBC   $3D
         STA   $E3
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L2341F0
         BRL   L234299
L2341F0  PHY
         PEI   $A3
         PEI   $A1
         JSL   L151313
         PLA
         STA   $E5
         LDA   $E3
         DEC
         PHA
         PEA   $000A
         JSL   L1500F5
         PLX
         PLX
         STA   $E3
         PHY
         PEI   $E3
         LDA   $15
         DEC
         PHA
         JSL   L072FD5
         PLA
         STA   $E3
         LDA   $E3
         CLC
         ADC   $E5
         DEC
         STA   $E5
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L232E60
         PHY
         PEA   $0000
         JSL   L15164B
         LDX   #$0000
         LDY   #$0006
         LDA   #$0080
         AND   [$AD],Y
         CMP   #$0000
         BNE   L234244
         INX
L234244  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L234299
         LDA   $E3
         PEA   $000A
         JSL   L150BEE
         PLA
         CLC
         ADC   $3D
         INC
         STA   $45
         LDA   #$0004
         CLC
         ADC   $3F
         STA   $47
         LDA   $EB
         BEQ   L234279
         LDA   #$0005
         CLC
         ADC   $45
         STA   $49
         LDA   #$0060
         CLC
         ADC   $47
         STA   $4B
         BRA   L234289
L234279  LDA   #$0006
         CLC
         ADC   $45
         STA   $49
         LDA   #$001E
         CLC
         ADC   $47
         STA   $4B
L234289  PHY
         PEI   $D1
         PEI   $CF
         PEA   $0000
         PHD
         JSL   L233448
         PLA
         STA   $F1
L234299  PEA   $0000
         PHD
         JSL   L233144
         PEI   $F1
         PEA   $0000
         PHD
         JSL   L23137A
L2342AB  BRL   L234F58
L2342AE  LDX   #$0000
         LDA   #$0003
         CMPL  L051F16
         BEQ   L2342BB
         INX
L2342BB  TXA
         STA   $ED
         STZ   $E9
         LDA   $BB
         DEC
         STA   $F3
         LDA   $CF
         SEC
         SBC   $F3
         BVS   L2342CF
         EOR   #$8000
L2342CF  BMI   L2342D6
         LDA   #$0000
         BRA   L2342D9
L2342D6  LDA   #$0001
L2342D9  PHA
         LDA   $BB
         INC
         INC
         INC
         STA   $F3
         LDA   $CF
         SEC
         SBC   $F3
         BVS   L2342EB
         EOR   #$8000
L2342EB  BPL   L2342F2
         LDA   #$0000
         BRA   L2342F5
L2342F2  LDA   #$0001
L2342F5  AND   $01,S
         PLX
         LSR
         BCC   L234300
         LDA   #$0002
         STA   $E9
L234300  LDA   $BD
         SEC
         SBC   #$0004
         STA   $F3
         LDA   $D1
         SEC
         SBC   $F3
         BVS   L234312
         EOR   #$8000
L234312  BMI   L234319
         LDA   #$0000
         BRA   L23431C
L234319  LDA   #$0001
L23431C  PHA
         LDA   #$0006
         CLC
         ADC   $BD
         STA   $F3
         LDA   $D1
         SEC
         SBC   $F3
         BVS   L23432F
         EOR   #$8000
L23432F  BPL   L234336
         LDA   #$0000
         BRA   L234339
L234336  LDA   #$0001
L234339  AND   $01,S
         PLX
         AND   $ED
         BEQ   L234345
         LDA   #$0001
         STA   $E9
L234345  TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         LDA   #$0007
         CLC
         ADC   $4F
         PHA
         LDA   $4D
         DEC
         PHA
         LDA   $53
         SEC
         SBC   #$0007
         PHA
         LDA   $4D
         INC
         INC
         INC
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0000
         JSL   L151005
         STZ   $E7
         LDA   $ED
         BEQ   L2343E0
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         LDA   $53
         SEC
         SBC   #$0007
         PHA
         PEI   $4D
         LDA   #$0005
         CLC
         ADC   $53
         PHA
         LDA   #$0004
         CLC
         ADC   $51
         PHA
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L2343E0
         LDA   #$0001
         STA   $E7
L2343E0  TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEI   $4F
         LDA   $51
         DEC
         DEC
         DEC
         PHA
         LDA   #$0008
         CLC
         ADC   $53
         PHA
         LDA   $51
         INC
         INC
         INC
         PHA
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L234423
         LDA   $E7
         INC
         INC
         STA   $E7
L234423  LDA   #$0100
         ANDL  L0540AD
         BEQ   L234448
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L08273B
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L08273B
         STZ   $E7
L234448  LDA   $E7
         BNE   L23444F
         BRL   L2346E4
L23444F  LDA   $CF
         LDX   $D1
         STA   $C7
         STX   $C9
         LDX   #$0000
         LDA   $E7
         DEC
         BNE   L234460
         INX
L234460  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   $E7
         BNE   L23446C
         INX
L23446C  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L23447A
         LDA   $53
         SEC
         SBC   $C9
         STA   $C9
L23447A  LDX   #$0000
         LDA   $E7
         DEC
         DEC
         BNE   L234484
         INX
L234484  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   $E7
         BNE   L234490
         INX
L234490  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L23449E
         LDA   $51
         SEC
         SBC   $C7
         STA   $C7
L23449E  PEA   $0002
         JSL   L150BD6
         PEA   $3333
         JSL   L081DD8
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L232653
         TDC
         CLC
         ADC   #$0075
         PEA   $0000
         PHA
         LDA   #$0030
         CLC
         ADC   $4F
         PHA
         LDA   #$0005
         CLC
         ADC   $4D
         PHA
         PHY
         PEI   $5B
         LDA   #$0124
         CLC
         ADC   $4F
         PHA
         JSL   L072FD5
         PHY
         PEI   $59
         LDA   #$004B
         CLC
         ADC   $4D
         PHA
         JSL   L072FD5
         JSL   L15100B
L23450D  PHY
         LDA   $C9
         CLC
         ADC   $D1
         PHA
         PEI   $77
         PEI   $7B
         JSL   L071A1B
         PLA
         STA   $D1
         PHY
         LDA   $C7
         CLC
         ADC   $CF
         PHA
         PEI   $75
         PEI   $79
         JSL   L071A1B
         PLA
         STA   $CF
         LDA   $E7
         DEC
         BMI   L234557
         CMP   #$0003
         BPL   L234557
         SEC
         SBC   #$0000
         BEQ   L234549
         DEC
         BEQ   L23454F
         DEC
         BEQ   L234555
         BRA   L234557
L234549  LDA   $51
         STA   $CF
         BRA   L234557
L23454F  LDA   $53
         STA   $D1
         BRA   L234557
L234555  BRA   L234557
L234557  TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEI   $4F
         PEI   $4D
         PEI   $D1
         PEI   $CF
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L2345C2
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L232653
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L232653
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L2345C2  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L2345E0
         BRL   L23450D
L2345E0  TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L232653
         PEA   $0000
         JSL   L150BD6
         PEA   $0000
         JSL   L081DD8
         PHY
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCC   L23461D
         BRL   L2346E1
L23461D  TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEI   $8B
         LDAL  L051F14
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $F3
         PLA
         CLC
         ADC   $F3
         PHA
         PEI   $89
         LDAL  L051F12
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $F3
         PLA
         CLC
         ADC   $F3
         PHA
         JSL   L151355
         PEA   $0000
         PHD
         JSL   L23189B
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L23137A
         LDX   #$0000
         LDA   $E7
         DEC
         BNE   L23468D
         INX
L23468D  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   $E7
         BNE   L234699
         INX
L234699  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L2346AA
         LDA   $53
         SEC
         SBC   $4F
         ASL
         STAL  L051F10
L2346AA  LDX   #$0000
         LDA   $E7
         DEC
         DEC
         BNE   L2346B4
         INX
L2346B4  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   $E7
         BNE   L2346C0
         INX
L2346C0  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L2346D1
         LDA   $51
         SEC
         SBC   $4D
         ASL
         STAL  L051F0E
L2346D1  PEA   $0000
         PHD
         JSL   L231B50
         PEA   $0000
         PHD
         JSL   L232ED1
L2346E1  BRL   L234F56
L2346E4  PEI   $ED
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $F3
         PLA
         AND   $F3
         BNE   L234708
         BRL   L23491F
L234708  LDA   $CF
         LDX   $D1
         STA   $C7
         STX   $C9
         LDA   $4F
         SEC
         SBC   $C9
         STA   $C9
         LDA   $4D
         SEC
         SBC   $C7
         STA   $C7
         PEA   $0002
         JSL   L150BD6
         PEA   $3333
         JSL   L081DD8
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEI   $57
         PEI   $55
         LDA   $83
         SEC
         SBC   $7F
         STA   $F3
         LDA   $5B
         SEC
         SBC   $F3
         PHA
         LDA   $81
         SEC
         SBC   $7D
         STA   $F3
         LDA   $59
         SEC
         SBC   $F3
         PHA
         JSL   L15100B
L234783  PHY
         LDA   $C9
         CLC
         ADC   $D1
         PHA
         PEI   $6F
         PEI   $73
         JSL   L071A1B
         PLA
         STA   $D1
         PHY
         LDA   $C7
         CLC
         ADC   $CF
         PHA
         PEI   $6D
         PEI   $71
         JSL   L071A1B
         PLA
         STA   $CF
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         LDAL  L051F10
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         LDAL  L051F0E
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEI   $D1
         PEI   $CF
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L234843
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L234843  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L234861
         BRL   L234783
L234861  TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $0016
         PEA   $0008
         JSL   L1517F1
         PEA   $0000
         JSL   L150BD6
         PHY
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCC   L234899
         BRL   L23491C
L234899  TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         PEI   $8B
         LDAL  L051F14
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $F3
         PLA
         CLC
         ADC   $F3
         PHA
         PEI   $89
         LDAL  L051F12
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $F3
         PLA
         CLC
         ADC   $F3
         PHA
         JSL   L151355
         PEA   $0000
         PHD
         JSL   L23189B
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L23137A
         LDA   $4F
         SEC
         SBC   $57
         ASL
         STAL  L051F0C
         LDA   $4D
         SEC
         SBC   $55
         ASL
         STAL  L051F0A
         PEA   $0000
         PHD
         JSL   L232ED1
L23491C  BRL   L234F56
L23491F  LDA   $E9
         BNE   L234926
         BRL   L234AAA
L234926  LDA   $CF
         LDX   $D1
         STA   $C7
         STX   $C9
         LDA   $E9
         DEC
         DEC
         BNE   L23493D
         LDA   $BB
         SEC
         SBC   $C7
         STA   $C7
         BRA   L234944
L23493D  LDA   $BD
         SEC
         SBC   $C9
         STA   $C9
L234944  PEA   $0002
         JSL   L150BD6
         PEA   $3333
         JSL   L081DD8
         LDA   $BB
         LDX   $BD
         STA   $BF
         STX   $C1
         PEI   $C1
         PEI   $BF
         PEA   $0000
         PHD
         JSL   L2325BC
         LDA   $BF
         LDX   $C1
         STA   $C3
         STX   $C5
         TDC
         CLC
         ADC   #$0075
         PEA   $0000
         PHA
         PEI   $53
         PEI   $51
         PHY
         LDA   $5B
         DEC
         DEC
         PHA
         LDA   #$0078
         CLC
         ADC   $53
         PHA
         JSL   L072FD5
         PHY
         LDA   $59
         DEC
         PHA
         LDA   #$0034
         CLC
         ADC   $51
         PHA
         JSL   L072FD5
         JSL   L15100B
L2349A0  LDA   $E9
         DEC
         BNE   L2349BD
         PHY
         LDA   $C9
         CLC
         ADC   $D1
         PHA
         PEI   $77
         PEI   $7B
         JSL   L071A1B
         PLA
         STA   $D1
         LDA   $D1
         STA   $C5
         BRA   L2349D3
L2349BD  PHY
         LDA   $C7
         CLC
         ADC   $CF
         PHA
         PEI   $75
         PEI   $79
         JSL   L071A1B
         PLA
         STA   $CF
         LDA   $CF
         STA   $C3
L2349D3  PHY
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCS   L234A0E
         PEI   $C1
         PEI   $BF
         PEA   $0000
         PHD
         JSL   L2325BC
         PEI   $C5
         PEI   $C3
         PEA   $0000
         PHD
         JSL   L2325BC
         LDA   $C3
         LDX   $C5
         STA   $BF
         STX   $C1
L234A0E  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L234A2C
         BRL   L2349A0
L234A2C  PEI   $C1
         PEI   $BF
         PEA   $0000
         PHD
         JSL   L2325BC
         PEA   $0000
         JSL   L150BD6
         PEA   $0000
         JSL   L081DD8
         PHY
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCS   L234AA7
         LDA   $C3
         LDX   $C5
         STA   $BB
         STX   $BD
         PEA   $0000
         PHD
         JSL   L23189B
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L23137A
         LDA   $E9
         DEC
         BNE   L234A95
         LDA   $BD
         SEC
         SBC   $53
         ASL
         STAL  L051F14
         PEA   $0000
         PHD
         JSL   L232ED1
         BRA   L234AA7
L234A95  LDA   $BB
         SEC
         SBC   $51
         ASL
         STAL  L051F12
         PEA   $0000
         PHD
         JSL   L232ED1
L234AA7  BRL   L234F56
L234AAA  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L234AC8
         BRL   L234F56
L234AC8  LDA   $15
         STA   $E5
         STZ   $EF
         LDA   $E5
         SEC
         SBC   #$0001
         BNE   L234AD9
         BRL   L234BE3
L234AD9  BVS   L234ADE
         EOR   #$8000
L234ADE  BMI   L234AE3
         BRL   L234BE3
L234AE3  LDA   $E5
         DEC
         STA   $E5
         PEI   $A7
         PEI   $A5
         LDA   $E5
         PEA   $001C
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L234AFF
         DEX
L234AFF  JSL   L150F53
         STA   $A9
         STX   $AB
         LDY   #$0006
         LDA   #$0080
         AND   [$A9],Y
         CMP   #$0000
         BNE   L234B17
         BRL   L234BD5
L234B17  LDA   #$0006
         CLC
         ADC   $A9
         LDX   $AB
         BCC   L234B22
         INX
L234B22  CLC
         ADC   #$0004
         BCC   L234B29
         INX
L234B29  TXY
         LDX   #$FFF9
         STA   $00,X
         TYA
         STA   $02,X
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         LDX   #$FFF9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L234B4B
         INX
L234B4B  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         LDX   #$FFF9
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         LDX   #$FFF9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L234B7E
         INX
L234B7E  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         LDX   #$FFF9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L234B95
         INX
L234B95  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEI   $4F
         PEI   $4D
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $EF
L234BD5  LDA   $EF
         BEQ   L234BDB
         BRA   L234BE3
L234BDB  LDA   $E5
         DEC
         BEQ   L234BE3
         BRL   L234AE3
L234BE3  LDA   $EF
         EOR   #$0001
         PHA
         PHY
         PEA   ^L051EF8
         PEA   L051EF8
         JSL   L1500E3
         PLA
         STA   $F3
         PLA
         AND   $F3
         BEQ   L234C37
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L234C37
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         STZ   $E5
         LDA   #$0001
         STA   $EF
L234C37  LDA   $EF
         BNE   L234C3E
         BRL   L234F56
L234C3E  PEI   $E5
         PEA   $0000
         PHD
         JSL   L232E60
         STZ   $F1
         LDA   $4B
         SEC
         SBC   $47
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $E1
         LDA   $49
         SEC
         SBC   $45
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $DF
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEI   $4B
         PHY
         PEI   $E1
         PEA   $000C
         JSL   L072FD5
         PLA
         STA   $F3
         PLA
         SEC
         SBC   $F3
         PHA
         PEI   $49
         PHY
         PEI   $DF
         PEA   $0005
         JSL   L072FD5
         PLA
         STA   $F3
         PLA
         SEC
         SBC   $F3
         PHA
         PEI   $4B
         PEI   $49
         JSL   L15100B
         LDAL  L0540BB
         SEC
         SBC   #$0002
         BVS   L234CB2
         EOR   #$8000
L234CB2  BPL   L234CBF
         PEA   $0000
         PHD
         JSL   L231DE3
         BRL   L234F44
L234CBF  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L234CDD
         BRL   L234F34
L234CDD  LDA   $CF
         LDX   $D1
         STA   $C7
         STX   $C9
         LDA   $4B
         SEC
         SBC   $C9
         STA   $C9
         LDA   $49
         SEC
         SBC   $C7
         STA   $C7
         PEA   $0002
         JSL   L150BD6
         PEA   $3333
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         LDA   #$000F
         CLC
         ADC   $47
         PHA
         LDA   #$0004
         CLC
         ADC   $45
         PHA
         PHY
         PEI   $53
         LDA   #$0124
         CLC
         ADC   $47
         PHA
         JSL   L072FD5
         PHY
         PEI   $51
         LDA   #$004B
         CLC
         ADC   $45
         PHA
         JSL   L072FD5
         JSL   L15100B
L234D5E  PHY
         LDA   $C9
         CLC
         ADC   $D1
         PHA
         PEI   $5F
         PEI   $63
         JSL   L071A1B
         PLA
         STA   $D1
         PHY
         LDA   $C7
         CLC
         ADC   $CF
         PHA
         PEI   $5D
         PEI   $61
         JSL   L071A1B
         PLA
         STA   $CF
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEI   $47
         PEI   $45
         PEI   $D1
         PEI   $CF
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L234DE5
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L234DE5  TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L234E03
         BRL   L234D5E
L234E03  TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         JSL   L151418
         PEA   $0000
         JSL   L150BD6
         PEA   $0000
         JSL   L081DD8
         PHY
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCC   L234E3C
         BRL   L234F32
L234E3C  LDA   $EB
         BNE   L234E43
         BRL   L234EC8
L234E43  LDA   #$0006
         CLC
         ADC   $AD
         LDX   $AF
         BCC   L234E4E
         INX
L234E4E  CLC
         ADC   #$0004
         BCC   L234E55
         INX
L234E55  TXY
         LDX   #$FFF5
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFF5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L234E6E
         INX
L234E6E  PHX
         PHA
         LDX   #$FFF5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L234E80
         INX
L234E80  STA   $F3
         STX   $F5
         LDA   $8B
         SEC
         SBC   $87
         CLC
         ADC   [$F3]
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         LDX   #$FFF5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L234EA4
         INX
L234EA4  PHX
         PHA
         LDX   #$FFF5
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDA   $89
         SEC
         SBC   $85
         ASL
         CLC
         ADC   [$F3]
         PLX
         STX   $F3
         PLX
         STX   $F5
         STA   [$F3]
         BRA   L234F2D
L234EC8  LDA   $8B
         SEC
         SBC   $87
         CLC
         ADCL  L051EFA
         STAL  L051EFE
         LDA   $89
         SEC
         SBC   $85
         ASL
         CLC
         ADCL  L051EF8
         STAL  L051EFC
         PHY
         LDAL  L051EFE
         SEC
         SBC   #$0140
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $E1
         LDA   $E1
         INC
         AND   #$FFFE
         STA   $E1
         PHY
         LDAL  L051EFC
         SEC
         SBC   #$00C8
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $DF
         PEA   ^L051EF8
         PEA   L051EF8
         LDA   $E1
         EOR   #$FFFF
         INC
         PHA
         LDA   $DF
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
L234F2D  LDA   #$0001
         STA   $F1
L234F32  BRA   L234F44
L234F34  PHY
         PEI   $D1
         PEI   $CF
         PEA   $0000
         PHD
         JSL   L233448
         PLA
         STA   $F1
L234F44  PEA   $0000
         PHD
         JSL   L233144
         PEI   $F1
         PEA   $0000
         PHD
         JSL   L23137A
L234F56  BRA   L234F58
L234F58  LDA   L05533B
         BNE   L234F60
         BRL   L233AF1
L234F60  LDA   L055339
         BNE   L234F94
         PEI   $93
         PEI   $91
         LDA   L055323
         LDX   L055325
         PHX
         PHA
         PEA   $0000
         PEA   $0380
         JSL   L15062F
         LDY   #$0002
         LDA   [$8D],Y
         PHA
         LDA   [$8D]
         PHA
         PEA   ^L051EF0
         PEA   L051EF0
         PEA   $0000
         PEA   $01D4
         JSL   L070597
L234F94  PEI   $8F
         PEI   $8D
         JSL   L07185A
L234F9C  PEI   $93
         PEI   $91
         JSL   L07185A
L234FA4  PEI   $B3
         PEI   $B1
         JSL   L072634
         PEI   $B5
         JSL   L0724F7
         PEI   $B9
         PEI   $B7
         JSL   L151131
         JSL   L09AFB1
         PEI   $97
         PEI   $95
         PEI   $9B
         PEI   $99
         JSL   L071825
         LDA   L055323
         LDX   L055325
         PHX
         PHA
         PEI   $D5
         JSL   L0718DA
         TSC
         CLC
         ADC   #$0102
         TCS
         PLD
         RTL

