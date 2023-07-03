*
* HypercardGS
* segment: $12 Commands2
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   Commands2.l
         lst   off

*---------------------------------------

         use   Commands2.E
         use   Commands2.X

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

L120000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   L055313
         PEA   $0001
         JSL   L0A1225
         LDA   L0550B7
         BEQ   L12001B
         JSL   L09A560
L12001B  STZ   L05530B
         STZ   L055311
         STZ   L055309
         LDA   #$0001
         STA   L05530F
         PEA   $0001
         PEA   $0001
         JSL   L090541
         LDA   #$0007
         STA   L055305
         LDA   #$0004
         STA   L055307
         LDA   #$0000
         STAL  L051ED6
         LDA   #$FFFE
         STAL  L051ED8
         LDA   #$0008
         STAL  L051EDA
         LDA   #$0000
         STAL  L051EDC
         LDA   #$0009
         STAL  L051EDE
         JSL   L160226
         PEA   $0001
         JSL   L1601D2
         LDA   #$0001
         STA   L054F9F
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L12008E
         LDA   L054FA1
         STA   $01
         LDA   #$FFFF
         STA   L054FA1
         PEI   $01
         JSL   L0724F7
L12008E  PLY
         PLY
         PLY
         PLD
         RTL

L120093  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0A3E52
         PLY
         PLY
         PLD
         RTL

L1200A3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L11036F
         PLY
         PLY
         PLD
         RTL

L1200B3  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         STZ   $0D
         STZ   $0F
         LDA   $24
         LDX   $26
         STA   $01
         STX   $03
         LDA   $22
         SEC
         SBC   #$0011
         BPL   L1200D2
         BRL   L1202FB
L1200D2  CMP   #$0032
         BMI   L1200DA
         BRL   L1202FB
L1200DA  SEC
         SBC   #$0000
         BEQ   L12010D
         DEC
         BNE   L1200E6
         BRL   L12026E
L1200E6  SEC
         SBC   #$0029
         BEQ   L120121
         DEC
         BEQ   L120132
         DEC
         BEQ   L120145
         DEC
         BEQ   L120158
         DEC
         BEQ   L12016B
         DEC
         BNE   L1200FE
         BRL   L120197
L1200FE  DEC
         BNE   L120104
         BRL   L1201D0
L120104  DEC
         BNE   L12010A
         BRL   L120225
L12010A  BRL   L1202FB
L12010D  PEI   $26
         PEI   $24
         PEA   $0000
         PEA   $0008
         PEA   $000C
         JSL   L0E0656
         BRL   L1202FB
L120121  PHY
         JSL   L0E05E8
         PLA
         SEC
         SBC   [$01]
         STA   $0F
         BRL   L1201C1
         BRL   L1202FB
L120132  PHY
         JSL   L0E05E8
         LDY   #$0002
         PLA
         SEC
         SBC   [$01],Y
         STA   $0D
         BRA   L1201C1
         BRL   L1202FB
L120145  PHY
         JSL   L0E05E8
         LDY   #$0004
         PLA
         SEC
         SBC   [$01],Y
         STA   $0F
         BRA   L1201C1
         BRL   L1202FB
L120158  PHY
         JSL   L0E05E8
         LDY   #$0006
         PLA
         SEC
         SBC   [$01],Y
         STA   $0D
         BRA   L1201C1
         BRL   L1202FB
L12016B  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         LDA   $0B
         LDY   #$0002
         SEC
         SBC   [$01],Y
         STA   $0D
         LDA   $09
         SEC
         SBC   [$01]
         STA   $0F
         BRA   L1201C1
         BRL   L1202FB
L120197  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         LDA   $0B
         LDY   #$0006
         SEC
         SBC   [$01],Y
         STA   $0D
         LDA   $09
         LDY   #$0004
         SEC
         SBC   [$01],Y
         STA   $0F
L1201C1  PEI   $26
         PEI   $24
         PEI   $0D
         PEI   $0F
         JSL   L1501AF
         BRL   L1202FB
L1201D0  PHY
         PEA   $0000
         PHY
         JSL   L0E05E8
         JSL   L072FA6
         PLA
         STA   $11
         PHY
         PEA   $0000
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         PHA
         JSL   L072FA6
         PLA
         STA   $15
         PHY
         LDA   $11
         SEC
         SBC   $15
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $0D
         LDY   #$0002
         LDA   [$01],Y
         SEC
         SBC   $0D
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0002
         LDA   $11
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         BRL   L1202FB
L120225  PHY
         PEA   $0000
         PHY
         JSL   L0E05E8
         JSL   L072FA6
         PLA
         STA   $13
         PHY
         PEA   $0000
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   [$01]
         PHA
         JSL   L072FA6
         PLA
         STA   $17
         PHY
         LDA   $13
         SEC
         SBC   $17
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $0F
         LDA   [$01]
         SEC
         SBC   $0F
         STA   [$01]
         LDA   $13
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         BRL   L1202FB
L12026E  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         STA   $15
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   [$01]
         STA   $17
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L1202A6
         INX
L1202A6  PHX
         PHA
         PEI   $07
         PHY
         PEI   $15
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $19
         PLA
         SEC
         SBC   $19
         PLX
         STX   $19
         PLX
         STX   $1B
         STA   [$19]
         PEI   $03
         PEI   $01
         PEI   $05
         PHY
         PEI   $17
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $19
         PLA
         SEC
         SBC   $19
         PLX
         STX   $19
         PLX
         STX   $1B
         STA   [$19]
         LDY   #$0002
         LDA   $15
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   $17
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         BRA   L1202FB
L1202FB  PEI   $26
         PEI   $24
         JSL   L121EEF
         LDA   $20
         STA   $26
         LDA   $1F
         STA   $25
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L120315  PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0015
         TCD
         LDA   $FA
         BEQ   L120370
         LDA   #$001A
         STA   $EB
         LDA   #$0043
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L120334
         INX
L120334  CLC
         ADC   #$0004
         BCC   L12033B
         INX
L12033B  STA   $ED
         STX   $EF
         LDA   #$000F
         AND   [$ED]
         DEC
         DEC
         BNE   L12034D
         LDA   #$001B
         STA   $EB
L12034D  PEA   $0018
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEI   $EB
         JSL   L0B127A
         JSL   L0B0841
         PHD
         LDA   $F6
         TCD
         CLC
         ADC   #$0000
         TCS
         JMPL  L120B98

L120370  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$010E
         TCS
         RTL

L120382  PHD
         TSC
         CLC
         ADC   #$FF62
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $AC
         PEI   $AA
         PEA   $0018
         JSL   L0313BE
         PHY
         PEI   $13
         PEI   $11
         PEI   $0F
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L1203C4
         PEA   $0017
         JSL   L0B0B7A
         JSL   L0E0000
         BRL   L120B98
L1203C4  TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         LDA   #$0001
         STA   $8F
         STZ   $8D
         STZ   $91
         LDX   #$0000
         LDA   #$8000
         AND   $47
         BNE   L1203F1
         INX
L1203F1  TXA
         STA   $8B
         LDA   $A8
         SEC
         SBC   #$0003
         BPL   L1203FF
         BRL   L120AAF
L1203FF  CMP   #$0046
         BMI   L120407
         BRL   L120AAF
L120407  ASL
         TAX
         LDAL  L12040F,X
         PHA
         RTS

L12040F  DA    L120499+1
         DA    L1204BE+2
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L1209BF+2
         DA    L1209BF+2
         DA    L1209BF+2
         DA    L1209BF+2
         DA    L120A1A+2
         DA    L120AAD+1
         DA    L12050B+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L12094A+2
         DA    L120955+2
         DA    L12096B+2
         DA    L1209A2+2
         DA    L1209AD+2
         DA    L120674+2
         DA    L1206E9+2
         DA    L120767+2
         DA    L1207EF+2
         DA    L1207EF+2
         DA    L1207EF+2
         DA    L1207EF+2
         DA    L1207EF+2
         DA    L120A40+1
         DA    L120842+2
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120863+2
         DA    L120917+2
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L1205B9+2
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L120AAD+1
         DA    L12071B+2
L120499  DA    L1207A4+2
         STZ   $8F
         PHY
         PEI   $13
         PEI   $11
         PEI   $0F
         LDY   #$0002
         LDA   [$A4],Y
         PHA
         LDA   [$A4]
         PHA
         JSL   L07D712
         PLA
         EOR   #$0001
         PHA
         PEA   $0000
         PHD
         JSL   L120315
L1204BE  BRL   L120ABA
         PEA   ^L050C32
         PEA   L050C32
         PEA   $001F
         JSL   L0E06F4
         PHY
         PEI   $13
         PEI   $11
         PEI   $0F
         PEA   ^L050C32
         PEA   L050C32
         JSL   L07D64A
         PLA
         EOR   #$0001
         PHA
         PEA   $0000
         PHD
         JSL   L120315
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         BNE   L1204F8
         INX
L1204F8  TXA
         BEQ   L120509
         PHA
         LDA   #$8000
         AND   $51
         BEQ   L120506
         LDA   #$0001
L120506  AND   $01,S
         PLX
L120509  STA   $91
L12050B  BRL   L120ABA
         PHY
         JSL   L0E05E8
         PLA
         STA   $79
         LDX   #$0000
         LDA   #$0003
         CMP   $79
         BNE   L120521
         INX
L120521  TXA
         BNE   L120534
         PHA
         LDX   #$0000
         LDA   #$0005
         CMP   $79
         BNE   L120530
         INX
L120530  TXA
         ORA   $01,S
         PLX
L120534  PHA
         PLA
         BNE   L120548
         PHA
         LDX   #$0000
         LDA   #$0006
         CMP   $79
         BNE   L120544
         INX
L120544  TXA
         ORA   $01,S
         PLX
L120548  CMP   #$0000
         BEQ   L12056A
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L12055A
         INX
L12055A  TXA
         BEQ   L12056A
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L120315
         BRA   L1205B9
L12056A  LDX   #$0000
         LDA   #$0007
         CMP   $79
         BNE   L120575
         INX
L120575  TXA
         BEQ   L120594
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         BNE   L120584
         INX
L120584  TXA
         BEQ   L120594
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L120315
         BRA   L1205B9
L120594  LDA   $51
         AND   #$FFF0
         CLC
         ADC   $79
         STA   $51
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         BRA   L1205E4
L1205B9  BRL   L120ABA
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEI   $A8
         JSL   L1200B3
L1205E4  LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L120600
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         LDA   #$000F
         AND   $51
         PHA
         JSL   L08567B
L120600  PHY
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L120674
         LDA   $8B
         BEQ   L12065B
         LDA   #$8000
         ORA   $1D
         STA   $1D
         PHY
         PEI   $13
         PEI   $11
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         STA   $83
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PEI   $13
         PEI   $11
         PEI   $0F
         PEA   $0000
         JSL   L0876F4
L12065B  TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L120674  BRL   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L120684
         INX
L120684  PHX
         PEA   $0000
         PHD
         JSL   L120315
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCC   L1206A4
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $53
         PLX
         STX   $55
         BRA   L1206E9
L1206A4  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PHY
         PEA   $8001
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$0099
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L1206DC
         LDA   $93
         LDX   $95
         STA   $53
         STX   $55
         BRA   L1206E9
L1206DC  PEA   $002F
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0841
L1206E9  BRL   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L1206F9
         INX
L1206F9  PHX
         PEA   $0000
         PHD
         JSL   L120315
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L120714
         LDA   #$8000
         ORA   $51
         STA   $51
         BRA   L12071B
L120714  LDA   $51
         AND   #$7FFF
         STA   $51
L12071B  BRL   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L12072B
         INX
L12072B  PHX
         PEA   $0000
         PHD
         JSL   L120315
         LDA   $0B
         LDX   $0D
         CMP   $11
         BNE   L12073E
         CPX   $13
L12073E  BNE   L12074E
         PEA   $0082
         JSL   L0B0B7A
         JSL   L0E0000
         BRL   L120B98
L12074E  PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L120760
         LDA   #$4000
         ORA   $47
         STA   $47
         BRA   L120767
L120760  LDA   $47
         AND   #$BFFF
         STA   $47
L120767  BRL   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L120777
         INX
L120777  PHX
         PEA   $0000
         PHD
         JSL   L120315
         PHY
         PHY
         JSL   L0E05E8
         PEA   $0000
         PEA   $0009
         JSL   L071A1B
         PLA
         STA   $81
         LDA   #$FF0F
         AND   $47
         PHA
         LDA   $81
         ASL
         ASL
         ASL
         ASL
         ORA   $01,S
         PLX
         STA   $47
L1207A4  BRL   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         BNE   L1207B3
         INX
L1207B3  PHX
         PEA   $0000
         PHD
         JSL   L120315
         LDA   $0B
         LDX   $0D
         CMP   $11
         BNE   L1207C6
         CPX   $13
L1207C6  BNE   L1207D6
         PEA   $0082
         JSL   L0B0B7A
         JSL   L0E0000
         BRL   L120B98
L1207D6  PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L1207E8
         LDA   #$4000
         ORA   $47
         STA   $47
         BRA   L1207EF
L1207E8  LDA   $47
         AND   #$BFFF
         STA   $47
L1207EF  BRL   L120ABA
         PEA   $0800
         LDA   $A8
         SEC
         SBC   #$001B
         PHA
         JSL   L1505F2
         PLA
         STA   $7B
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         BNE   L12080F
         INX
L12080F  PHX
         PEA   $0000
         PHD
         JSL   L120315
         LDA   #$001D
         CMP   $A8
         BEQ   L120828
         LDA   #$001E
         CMP   $A8
         BEQ   L120828
         STZ   $8F
L120828  PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L120839
         LDA   $51
         ORA   $7B
         STA   $51
         BRA   L120842
L120839  LDA   #$FFFF
         EOR   $7B
         AND   $51
         STA   $51
L120842  BRL   L120ABA
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L12085C
         LDA   $47
         AND   #$7FFF
         STA   $47
         LDA   #$0001
         STA   $8D
         BRA   L120863
L12085C  LDA   #$8000
         ORA   $47
         STA   $47
L120863  BRL   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         BEQ   L120872
         INX
L120872  PHX
         PEA   $0000
         PHD
         JSL   L120315
         LDA   $51
         AND   #$000F
         BEQ   L120885
         LDA   #$0001
L120885  PHA
         LDA   $53
         ORA   $55
         BEQ   L12088F
         LDA   #$0001
L12088F  ORA   $01,S
         PLX
         STA   $8D
         LDA   $45
         STA   $87
         LDA   $0B
         LDX   $0D
         CMP   $11
         BNE   L1208A2
         CPX   $13
L1208A2  BNE   L1208AC
         LDA   $87
         EOR   #$FFFF
         INC
         STA   $87
L1208AC  PHY
         PEI   $09
         PEI   $07
         PEI   $0D
         PEI   $0B
         PEI   $87
         PHY
         JSL   L0E0678
         PEA   $0001
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L07D08A
         PLA
         STA   $83
         LDA   $85
         BEQ   L1208EF
         LDA   #$0001
         STA   $91
         PHY
         PEI   $13
         PEI   $11
         PEI   $0F
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         STA   $83
L1208EF  LDA   #$00F0
         AND   $47
         PHA
         PEA   $0004
         JSL   L1510EF
         PLA
         STA   $81
         LDA   $81
         BEQ   L120917
         PEI   $0D
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $13
         PEI   $11
         PEI   $81
         PEI   $45
         JSL   L095059
L120917  BRL   L120ABA
         STZ   $8F
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         BEQ   L120928
         INX
L120928  PHX
         PEA   $0000
         PHD
         JSL   L120315
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L120943
         LDA   #$2000
         ORA   $51
         STA   $51
         BRA   L12094A
L120943  LDA   $51
         AND   #$DFFF
         STA   $51
L12094A  BRL   L120ABA
         PHY
         JSL   L0E05E8
         PLA
         STA   $5B
L120955  BRL   L120ABA
         PHY
         JSL   L0D1154
         PLA
         STA   $97
         LDA   #$FFFF
         CMP   $97
         BEQ   L12096B
         LDA   $97
         STA   $5D
L12096B  BRL   L120ABA
         PHY
         JSL   L0E05E8
         PLA
         STA   $77
         LDA   $77
         SEC
         SBC   #$0050
         BEQ   L120985
         BVS   L120983
         EOR   #$8000
L120983  BMI   L12099B
L120985  LDA   $77
         STA   $5F
         LDA   $5F
         ASL
         ASL
         PHA
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $63
         BRA   L1209A2
L12099B  PEA   $0080
         JSL   L0B0B7A
L1209A2  BRL   L120ABA
         PHY
         JSL   L0E05E8
         PLA
         STA   $61
L1209AD  BRL   L120ABA
         PHY
         PHY
         JSL   L0E05E8
         PEI   $5F
         JSL   L072FA6
         PLA
         STA   $63
L1209BF  BRL   L120ABA
         LDA   $A8
         SEC
         SBC   #$000B
         BEQ   L1209E7
         BVS   L1209CF
         EOR   #$8000
L1209CF  BPL   L1209E7
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BNE   L1209DE
         INX
L1209DE  PHX
         PEA   $0000
         PHD
         JSL   L120315
L1209E7  TDC
         CLC
         ADC   #$0065
         STA   $9B
         STZ   $9D
         LDA   $A8
         SEC
         SBC   #$0009
         DEC
         CLC
         ADC   $9B
         STA   $9B
         BCC   L120A00
         INC   $9D
L120A00  PHY
         PHY
         JSL   L0E05E8
         PLA
         DEC
         PHA
         PEA   $0000
         PEA   $000F
         JSL   L071A1B
         PLA
         SEP   #$20
         STA   [$9B]
         REP   #$20
L120A1A  BRL   L120ABA
         PEA   $000F
         PHY
         PHY
         JSL   L0E05E8
         PLA
         DEC
         PHA
         PEA   $0000
         PEA   $000F
         JSL   L071A1B
         PLA
         STA   $9B
         PLA
         SEC
         SBC   $9B
         SEP   #$20
         STA   $57
         REP   #$20
L120A40  BRA   L120ABA
         LDX   #$0000
         LDA   #$000F
         AND   $51
         CMP   #$0007
         BEQ   L120A50
         INX
L120A50  PHX
         LDX   #$0000
         LDA   #$000F
         AND   $47
         DEC
         DEC
         BEQ   L120A5E
         INX
L120A5E  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L120A6E
         PEA   $0021
         JSL   L0B0B7A
         BRA   L120AAD
L120A6E  PHY
         JSL   L0E05E8
         PLA
         STA   $7F
         LDA   $45
         STA   $7D
         LDA   $0B
         LDX   $0D
         CMP   $11
         BNE   L120A84
         CPX   $13
L120A84  BNE   L120A8E
         LDA   $7D
         EOR   #$FFFF
         INC
         STA   $7D
L120A8E  PEI   $7F
         PHY
         PEI   $7D
         JSL   L086029
         PLA
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BEQ   L120AAD
         PEI   $7D
         PEI   $7F
         JSL   L0873D7
         LDA   #$0001
         STA   $91
L120AAD  BRA   L120ABA
L120AAF  PEA   $0001
         PEA   $0000
         PHD
         JSL   L120315
L120ABA  LDA   $91
         BNE   L120ADF
         PHY
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L070A10
         PLA
         LSR
         BCC   L120ADF
         BRL   L120B98
L120ADF  PHY
         PEI   $13
         PEI   $11
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         EOR   #$0001
         PHA
         PEA   $0000
         PHD
         JSL   L120315
         LDA   L0551F5
         LDX   L0551F7
         CMP   $11
         BNE   L120B0A
         CPX   $13
L120B0A  BEQ   L120B11
         LDA   #$0000
         BRA   L120B14
L120B11  LDA   #$0001
L120B14  PHA
         LDX   #$0000
         LDAL  L052D34
         CMP   $45
         BNE   L120B21
         INX
L120B21  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L120B3E
         PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
L120B3E  LDA   L055129
         LDX   L05512B
         CMP   $11
         BNE   L120B4A
         CPX   $13
L120B4A  BEQ   L120B51
         LDA   #$0000
         BRA   L120B54
L120B51  LDA   #$0001
L120B54  PHA
         LDX   #$0000
         LDAL  L05328D
         CMP   $45
         BNE   L120B61
         INX
L120B61  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L120B7E
         PEA   ^L05328B
         PEA   L05328B
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
L120B7E  LDX   #$0000
         LDA   #$8000
         AND   $47
         BNE   L120B89
         INX
L120B89  TXA
         STA   $89
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $8D
         JSL   L0876F4
L120B98  LDA   $A2
         STA   $AC
         LDA   $A1
         STA   $AB
         LDA   $9F
         TCD
         TSC
         CLC
         ADC   #$00AA
         TCS
         RTL

L120BAA  PHD
         TSC
         CLC
         ADC   #$FEC0
         TCS
         ADC   #$0055
         TCD
         STZ   $DF
         STZ   $E5
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L077A5B
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDA   $D9
         ORA   $DB
         BNE   L120BD2
         BRL   L120DB4
L120BD2  LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         CLC
         ADC   #$0004
         BCC   L120BE1
         INX
L120BE1  STA   $E7
         STX   $E9
         LDA   #$4143
         LDX   #$4452
         CMP   [$E7]
         BNE   L120BF5
         LDY   #$0002
         TXA
         CMP   [$E7],Y
L120BF5  BEQ   L120BFC
         LDA   #$0000
         BRA   L120BFF
L120BFC  LDA   #$0001
L120BFF  STA   $E3
         LDA   $E3
         BEQ   L120C0C
         LDA   #$001C
         STA   $DD
         BRA   L120C11
L120C0C  LDA   #$001D
         STA   $DD
L120C11  LDA   $F6
         CMP   $DD
         BEQ   L120C1A
         BRL   L120D2B
L120C1A  LDA   $F4
         DEC
         DEC
         DEC
         BPL   L120C24
         BRL   L120D2B
L120C24  CMP   #$0037
         BMI   L120C2C
         BRL   L120D2B
L120C2C  SEC
         SBC   #$0000
         BEQ   L120C5C
         DEC
         BEQ   L120C74
         DEC
         BNE   L120C3B
         BRL   L120D0F
L120C3B  DEC
         BNE   L120C41
         BRL   L120D16
L120C41  DEC
         BNE   L120C47
         BRL   L120D24
L120C47  DEC
         BEQ   L120CBD
         SEC
         SBC   #$0013
         BNE   L120C53
         BRL   L120D1D
L120C53  SEC
         SBC   #$001E
         BEQ   L120C96
         BRL   L120D2B
L120C5C  PHY
         PEI   $FA
         PEI   $F8
         LDY   #$0002
         LDA   [$F0],Y
         PHA
         LDA   [$F0]
         PHA
         JSL   L07D3A2
         PLA
         STA   $E5
         BRL   L120D2B
L120C74  PEA   ^L050C32
         PEA   L050C32
         PEA   $001F
         JSL   L0E06F4
         PHY
         PEI   $FA
         PEI   $F8
         PEA   ^L050C32
         PEA   L050C32
         JSL   L07D20B
         PLA
         STA   $E5
         BRL   L120D2B
L120C96  LDA   #$0001
         STA   $E5
         LDA   $E3
         BEQ   L120CAE
         PEI   $FA
         PEI   $F8
         PHY
         JSL   L0E0678
         JSL   L099F77
         BRA   L120CBB
L120CAE  PEI   $FA
         PEI   $F8
         PHY
         JSL   L0E0678
         JSL   L099EA4
L120CBB  BRA   L120D2B
L120CBD  TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E0656
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         CLC
         ADC   #$0010
         BCC   L120CE2
         INX
L120CE2  STA   $E7
         STX   $E9
         LDA   #$1000
         AND   [$E7]
         BEQ   L120CF0
         LDA   #$0001
L120CF0  STA   $E1
         PHY
         PEI   $FA
         PEI   $F8
         PEI   $E1
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         JSL   L07CD77
         PLA
         STA   $E5
         JSL   L083E9E
         BRA   L120D2B
L120D0F  LDA   #$8000
         STA   $DF
         BRA   L120D2B
L120D16  LDA   #$4000
         STA   $DF
         BRA   L120D2B
L120D1D  LDA   #$0800
         STA   $DF
         BRA   L120D2B
L120D24  LDA   #$1000
         STA   $DF
         BRA   L120D2B
L120D2B  LDA   $DF
         BEQ   L120DA9
         LDA   #$0001
         STA   $E5
         PHY
         JSL   L0E0678
         PLA
         STA   $D3
         LDA   $E3
         BEQ   L120D70
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         STA   $AF
         STX   $B1
         LDA   $D3
         BEQ   L120D5E
         LDY   #$0010
         LDA   $DF
         ORA   [$AF],Y
         LDY   #$0010
         STA   [$AF],Y
         BRA   L120D6E
L120D5E  LDY   #$0010
         LDA   #$FFFF
         SEC
         SBC   $DF
         AND   [$AF],Y
         LDY   #$0010
         STA   [$AF],Y
L120D6E  BRA   L120D9E
L120D70  LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         STA   $AB
         STX   $AD
         LDA   $D3
         BEQ   L120D8E
         LDY   #$0010
         LDA   $DF
         ORA   [$AB],Y
         LDY   #$0010
         STA   [$AB],Y
         BRA   L120D9E
L120D8E  LDY   #$0010
         LDA   #$FFFF
         SEC
         SBC   $DF
         AND   [$AB],Y
         LDY   #$0010
         STA   [$AB],Y
L120D9E  LDA   #$1000
         CMP   $DF
         BNE   L120DA9
         JSL   L083E9E
L120DA9  PEI   $FA
         PEI   $F8
         PEA   $0001
         JSL   L074E4D
L120DB4  LDA   $E5
         BNE   L120DCE
         PEA   $0018
         PEA   $0000
         TDC
         CLC
         ADC   #$FFAB
         PHA
         PEI   $F6
         JSL   L0B127A
         JSL   L0B0841
L120DCE  LDA   $EE
         STA   $FA
         LDA   $ED
         STA   $F9
         LDA   $EB
         TCD
         TSC
         CLC
         ADC   #$014E
         TCS
         RTL

L120DE0  PHD
         TSC
         CLC
         ADC   #$FDC0
         TCS
         ADC   #$0153
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFAD
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0018
         JSL   L0313BE
         STZ   $E7
         LDA   $F6
         SEC
         SBC   #$0003
         BPL   L120E0C
         BRL   L120EFF
L120E0C  CMP   #$0006
         BMI   L120E14
         BRL   L120EFF
L120E14  ASL
         TAX
         LDAL  L120E1C,X
         PHA
         RTS

L120E1C  DA    L120E26+1
         DA    L120E39+2
         DA    L120E5A+2
         DA    L120E6B+2
         DA    L120E75+2
L120E26  DA    L120EBB+1
         PHY
         LDY   #$0002
         LDA   [$F2],Y
         PHA
         LDA   [$F2]
         PHA
         JSL   L0785BE
         PLA
         STA   $E7
L120E39  BRL   L120EFF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         JSL   L0E06AC
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         JSL   L0782F1
         PLA
         STA   $E7
L120E5A  BRL   L120EFF
         LDA   #$0001
         STA   $E7
         PHY
         JSL   L0E0678
         JSL   L09992C
L120E6B  BRL   L120EFF
         LDA   #$4000
         STA   $E5
         BRA   L120E7D
L120E75  BRL   L120EFF
         LDA   #$1000
         STA   $E5
L120E7D  LDA   #$0001
         STA   $E7
         LDA   L05504F
         BNE   L120EAA
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L120E9C
         LDAL  L053AE9
         ORA   $E5
         STAL  L053AE9
         BRA   L120EAA
L120E9C  LDA   #$FFFF
         SEC
         SBC   $E5
         ANDL  L053AE9
         STAL  L053AE9
L120EAA  LDA   #$1000
         CMP   $E5
         BNE   L120EB5
         JSL   L083E9E
L120EB5  LDA   #$0001
         STA   L05504D
L120EBB  BRA   L120EFF
         LDA   #$0001
         STA   $E7
         LDA   L05504F
         BNE   L120EFD
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E0656
         PEA   ^L053AFD
         PEA   L053AFD
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   #$0001
         STA   L05504D
         JSL   L083E9E
L120EFD  BRA   L120EFF
L120EFF  LDA   $E7
         BNE   L120F1A
         PEA   $0018
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $001E
         JSL   L0B127A
         JSL   L0B0841
L120F1A  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$024C
         TCS
         RTL

L120F2C  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $05
         LDA   $10
         SEC
         SBC   #$0013
         BPL   L120F41
         BRL   L1210DB
L120F41  CMP   #$001A
         BMI   L120F49
         BRL   L1210DB
L120F49  ASL
         TAX
         LDAL  L120F51,X
         PHA
         RTS

L120F51  DA    L12103D+2
         DA    L12104F+2
         DA    L12106C+1
         DA    L1210AD+1
         DA    L1210BE+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L1210D9+1
         DA    L120F83+1
         DA    L120FA0+2
         DA    L120FAC+2
         DA    L120FC5+2
         DA    L120FD1+2
         DA    L120FDD+2
         DA    L120FE9+2
         DA    L120FF8+2
L120F83  DA    L121019+2
         PHY
         JSL   L0E0678
         PLA
         CMP   L055313
         BEQ   L120FA0
         LDA   L055313
         EOR   #$0001
         STA   L055313
         PEA   $0001
         JSL   L1601D2
L120FA0  BRL   L1210DB
         PHY
         JSL   L0E05E8
         JSL   L0A1225
L120FAC  BRL   L1210DB
         LDA   L0550B7
         PHA
         PHY
         JSL   L0E0678
         PLA
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BEQ   L120FC5
         JSL   L09A560
L120FC5  BRL   L1210DB
         PHY
         JSL   L0E0678
         PLA
         STA   L05530B
L120FD1  BRL   L1210DB
         PHY
         JSL   L0E0678
         PLA
         STA   L055311
L120FDD  BRL   L1210DB
         PHY
         JSL   L0E05E8
         PLA
         STA   L05530F
L120FE9  BRL   L1210DB
         PHY
         JSL   L0E05E8
         PEA   $0001
         JSL   L090541
L120FF8  BRL   L1210DB
         PHY
         PHY
         JSL   L0E05E8
         PEA   $0001
         PEA   $0020
         JSL   L071A1B
         PLA
         STA   L055305
         LDA   #$0001
         STA   L054F9F
         JSL   L160226
L121019  BRL   L1210DB
         PHY
         JSL   L0E05E8
         PLA
         STA   L055307
         LDA   L055307
         BEQ   L12103D
         PHY
         LDA   L055307
         PHA
         PEA   $0003
         PEA   $0032
         JSL   L071A1B
         PLA
         STA   L055307
L12103D  BRL   L1210DB
         PHY
         JSL   L0E05E8
         PLA
         STAL  L051ED6
         LDA   #$0001
         STA   $05
L12104F  BRL   L1210DB
         LDA   #$0001
         STA   $05
         PHY
         JSL   L0D1154
         PLA
         STA   $03
         LDA   #$FFFF
         CMP   $03
         BEQ   L12106C
         LDA   $03
         STAL  L051ED8
L12106C  BRA   L1210DB
         PHY
         JSL   L0E05E8
         PLA
         STA   $01
         LDA   $01
         SEC
         SBC   #$0050
         BEQ   L121085
         BVS   L121083
         EOR   #$8000
L121083  BMI   L1210A6
L121085  LDA   #$0001
         STA   $05
         LDA   $01
         STAL  L051EDA
         LDAL  L051EDA
         ASL
         ASL
         PHA
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STAL  L051EDE
         BRA   L1210AD
L1210A6  PEA   $0080
         JSL   L0B0B7A
L1210AD  BRA   L1210DB
         LDA   #$0001
         STA   $05
         PHY
         JSL   L0E05E8
         PLA
         STAL  L051EDC
L1210BE  BRA   L1210DB
         LDA   #$0001
         STA   $05
         PHY
         PHY
         JSL   L0E05E8
         LDAL  L051EDA
         PHA
         JSL   L072FA6
         PLA
         STAL  L051EDE
L1210D9  BRA   L1210DB
L1210DB  LDA   $05
         BEQ   L1210E6
         PEA   $0001
         JSL   L1601D2
L1210E6  LDA   $0E
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

L1210F8  PHD
         TSC
         CLC
         ADC   #$FDC6
         TCS
         ADC   #$014D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB3
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0018
         JSL   L0313BE
         LDA   $F6
         SEC
         SBC   #$0009
         BPL   L121122
         BRL   L12148C
L121122  CMP   #$0042
         BMI   L12112A
         BRL   L12148C
L12112A  ASL
         TAX
         LDAL  L121132,X
         PHA
         RTS

L121132  DA    L12147A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L1211B4+1
         DA    L1211D7+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L1213DC+2
         DA    L121207+2
         DA    L12148A+1
         DA    L12148A+1
         DA    L121220+2
         DA    L1213BA+2
         DA    L1213D0+2
         DA    L121274+2
         DA    L1211CB+2
         DA    L121237+2
         DA    L1211E3+2
         DA    L1211EF+2
         DA    L1211FB+2
         DA    L12148A+1
         DA    L1211BF+2
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L1213E5+2
         DA    L121402+2
         DA    L12140E+2
         DA    L121456+1
         DA    L12148A+1
         DA    L12148A+1
         DA    L12146F+1
L1211B4  DA    L12138F+2
         PHY
         JSL   L0E05E8
         JSL   L099CDB
L1211BF  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L055243
L1211CB  BRL   L1214A3
         PHY
         JSL   L0E05E8
         PLA
         STA   L055215
L1211D7  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L055219
L1211E3  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L05521B
L1211EF  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L05524D
L1211FB  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L055217
L121207  BRL   L1214A3
         LDA   L055153
         PHA
         PHY
         JSL   L0E0678
         PLA
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BEQ   L121220
         JSL   L09A544
L121220  BRL   L1214A3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0E06AC
         PEA   $005B
         JSL   L0B0B7A
L121237  BRL   L1214A3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0E06AC
         LDA   #$00FF
         LDX   #$FFCB
         AND   $00,X
         SEC
         SBC   #$001F
         BEQ   L121267
         BVS   L12125A
         EOR   #$8000
L12125A  BPL   L121267
         LDX   #$FFCB
         SEP   #$20
         LDA   #$1F
         STA   $00,X
         REP   #$20
L121267  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0B2C0A
L121274  BRL   L1214A3
         STZ   $E5
         LDA   L054FBB
         STA   $E7
         STZ   L054FBB
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCC   L1212B2
         PHY
         PHY
         JSL   L0E05E8
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L12129A
         DEX
L12129A  PHX
         PHA
         JSL   L072F5C
         PLA
         LSR
         BCC   L1212AF
         LDA   #$0002
         STA   $E5
         LDA   #$FFFF
         STA   L054FA1
L1212AF  BRL   L12137A
L1212B2  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0E06AC
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L040381
         PEA   L040381
         JSL   L071C56
         PLA
         LSR
         BCC   L1212DF
         LDA   #$0005
         STA   $E5
         BRL   L12137A
L1212DF  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L040386
         PEA   L040386
         JSL   L071C56
         PLA
         LSR
         BCC   L1212FD
         JSL   L072328
         BRA   L12137A
L1212FD  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L04038B
         PEA   L04038B
         JSL   L071C56
         PLA
         LSR
         BCC   L12131C
         LDA   #$0004
         STA   $E5
         BRA   L12137A
L12131C  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L040391
         PEA   L040391
         JSL   L071C56
         PLA
         LSR
         BCC   L12133B
         LDA   #$0010
         STA   $E5
         BRA   L12137A
L12133B  PHY
         PEA   $8027
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L12137A
         PHY
         PEI   $E1
         PEI   $DF
         JSL   L072F5C
         PLA
         LSR
         BCC   L12137A
         LDA   #$0002
         STA   $E5
         LDA   #$FFFF
         STA   L054FA1
L12137A  LDA   $E5
         BEQ   L12138A
         PEI   $E5
         JSL   L0724F7
         LDA   #$0001
         STA   L054F9F
L12138A  LDA   $E7
         STA   L054FBB
L12138F  BRL   L1214A3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0E06AC
         LDA   #$00FF
         LDX   #$FFCB
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L1213BA
         BEQ   L1213BA
         LDA   #$00FF
         LDX   #$FFCC
         AND   $00,X
         STA   L055277
L1213BA  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L1213CC
         JSL   L096029
         BRA   L1213D0
L1213CC  JSL   L09AED3
L1213D0  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L0551DD
L1213DC  BRL   L1214A3
         PEI   $F6
         JSL   L120F2C
L1213E5  BRL   L1214A3
         LDA   L054FA3
         LDX   L054FA5
         PHX
         PHA
         JSL   L07185A
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   L054FA3
         PLA
         STA   L054FA5
L121402  BRL   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L054FA7
L12140E  BRL   L1214A3
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $0013
         JSL   L0E06F4
         PHY
         JSL   L16072E
         PLA
         LSR
         BCC   L121456
         PHY
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         JSL   L16074A
         PLA
         LSR
         BCS   L12144C
         PEA   $0083
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         JSL   L0B0841
L12144C
*         PEA   ^L16074A
*         PEA   L16074A
*         JSL   L07187A
L121456  BRA   L1214A3
         PHY
         PHY
         JSL   L0E05E8
         PEA   $0001
         PEA   $0010
         JSL   L071A1B
         PLA
         DEC
         PHA
         JSL   L0B81C9
L12146F  BRA   L1214A3
         PHY
         JSL   L0E0678
         PLA
         STA   L055309
L12147A  BRA   L1214A3
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   L055279
         PLA
         STA   L05527B
L12148A  BRA   L1214A3
L12148C  PEA   $0018
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB3
         PHA
         PEA   $001F
         JSL   L0B127A
         JSL   L0B0841
L1214A3  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0246
         TCS
         RTL

L1214B5  PHD
         TSC
         CLC
         ADC   #$FEE8
         TCS
         ADC   #$0027
         TCD
         LDA   $FA
         SEC
         SBC   #$0012
         BPL   L1214CB
         BRL   L12164A
L1214CB  CMP   #$002F
         BMI   L1214D3
         BRL   L12164A
L1214D3  SEC
         SBC   #$0000
         BEQ   L1214FA
         SEC
         SBC   #$000F
         BNE   L1214E2
         BRL   L121620
L1214E2  SEC
         SBC   #$001A
         BEQ   L121543
         DEC
         BEQ   L121543
         DEC
         BEQ   L121543
         DEC
         BEQ   L121543
         DEC
         BEQ   L1214FA
         DEC
         BEQ   L121543
         BRL   L12164A
L1214FA  TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         LDA   $EB
         ASL
         STA   $EB
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L121E9A
         LDA   L0550ED
         LDX   L0550EF
         CMP   $F6
         BNE   L12152E
         CPX   $F8
L12152E  BEQ   L12153C
         PEI   $EB
         PEI   $E9
         PEI   $F8
         PEI   $F6
         JSL   L151029
L12153C  JSL   L09AFB1
         BRL   L121661
L121543  PEI   $F8
         PEI   $F6
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         JSL   L0B1831
         STZ   $E3
         STZ   $E1
         LDA   $FA
         SEC
         SBC   #$003B
         BPL   L121563
         BRL   L1215E6
L121563  CMP   #$0006
         BPL   L1215E6
         SEC
         SBC   #$0000
         BEQ   L1215A4
         DEC
         BEQ   L1215BE
         DEC
         BEQ   L1215B1
         DEC
         BEQ   L1215D2
         DEC
         DEC
         BEQ   L12157D
         BRA   L1215E6
L12157D  TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         LDA   $EB
         ASL
         SEC
         SBC   $DF
         STA   $E3
         LDA   $E9
         SEC
         SBC   $DD
         STA   $E1
         BRA   L1215E6
L1215A4  PHY
         JSL   L0E05E8
         PLA
         SEC
         SBC   $D9
         STA   $E1
         BRA   L1215E6
L1215B1  PHY
         JSL   L0E05E8
         PLA
         SEC
         SBC   $DD
         STA   $E1
         BRA   L1215E6
L1215BE  PHY
         JSL   L0E05E8
         LDA   #$0002
         JSL   L150BEE
         PLA
         SEC
         SBC   $DB
         STA   $E3
         BRA   L1215E6
L1215D2  PHY
         JSL   L0E05E8
         LDA   #$0002
         JSL   L150BEE
         PLA
         SEC
         SBC   $DF
         STA   $E3
         BRA   L1215E6
L1215E6  LDA   L0550ED
         LDX   L0550EF
         CMP   $F6
         BNE   L1215F2
         CPX   $F8
L1215F2  BEQ   L12161E
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         PEI   $E3
         PEI   $E1
         JSL   L1501AF
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         JSL   L121EEF
         PEI   $DB
         PEI   $D9
         PEI   $F8
         PEI   $F6
         JSL   L151029
L12161E  BRA   L121661
L121620  LDX   #$0000
         LDY   #$00CE
         LDA   #$0020
         AND   [$F6],Y
         CMP   #$0000
         BEQ   L121631
         INX
L121631  PHX
         PHY
         JSL   L0E0678
         PLA
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BEQ   L121648
         PEI   $F8
         PEI   $F6
         JSL   L09A5A7
L121648  BRA   L121661
L12164A  PEA   $0018
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0020
         JSL   L0B127A
         JSL   L0B0841
L121661  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0120
         TCS
         RTL

L121673  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         STZ   $2B
         STZ   $2D
         LDA   L0553C5
         LDX   L0553C7
         STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         PHX
         PHA
         LDA   L0553C3
         DEC
         JSL   L150488
         TAY
         BNE   L12169F
         DEX
L12169F  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0005
         BCC   L1216B7
         INX
L1216B7  STA   $31
         STX   $33
         LDA   #$00FF
         AND   [$31]
         BIT   #$0080
         BEQ   L1216C8
         ORA   #$FF80
L1216C8  DEC
         DEC
         BMI   L121719
         CMP   #$0002
         BPL   L121719
         SEC
         SBC   #$0000
         BEQ   L1216DC
         DEC
         BEQ   L1216F7
         BRA   L121719
L1216DC  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         PEA   $0002
         JSL   L0B3145
         BRA   L121728
L1216F7  JSL   L0B32A5
         PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $2B
         PLX
         STX   $2D
         LDA   $2B
         ORA   $2D
         BNE   L121717
         PEA   $0084
         JSL   L0B0B7A
         BRL   L121895
L121717  BRA   L121728
L121719  LDA   L055039
         LDX   L05503B
         STA   $03
         STX   $05
         LDA   #$0005
         STA   $01
L121728  TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0015
         PEA   $0004
         JSL   L0B3145
         LDA   #$0003
         CMP   $2F
         BNE   L1217A9
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $27
         PLX
         STX   $29
         PHY
         PHY
         LDY   #$0002
         LDA   [$27],Y
         PHA
         LDA   [$27]
         PHA
         JSL   L071C98
         LDA   #$7530
         LDX   #$0000
         JSL   L033477
         BEQ   L121788
         BVS   L121774
         EOR   #$8000
L121774  BPL   L121788
         PEI   $29
         PEI   $27
         JSL   L07185A
         PEA   $0072
         JSL   L0B0B7A
         BRL   L121895
L121788  PHY
         PHY
         LDY   #$0002
         LDA   [$27],Y
         PHA
         LDA   [$27]
         PHA
         JSL   L0B41C8
         PLA
         STA   $23
         PLX
         STX   $25
         PEI   $25
         PEI   $23
         PEI   $29
         PEI   $27
         JSL   L1512FB
L1217A9  LDA   $2B
         ORA   $2D
         BEQ   L1217BC
         PEI   $2F
         PEI   $2D
         PEI   $2B
         JSL   L1214B5
         BRL   L121879
L1217BC  PHY
         PEI   $05
         PEI   $03
         JSL   L0D109F
         PLA
         LSR
         BCS   L1217CC
         BRL   L121879
L1217CC  LDA   $01
         DEC
         BPL   L1217D4
         BRL   L12186E
L1217D4  CMP   #$0005
         BMI   L1217DC
         BRL   L12186E
L1217DC  SEC
         SBC   #$0000
         BEQ   L1217F0
         DEC
         BEQ   L12180A
         DEC
         BEQ   L121822
         DEC
         BEQ   L12183A
         DEC
         BEQ   L121854
         BRA   L12186E
L1217F0  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2F
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L120382
         BRA   L121875
L12180A  PEI   $0D
         PEI   $0B
         PEA   $001C
         PEI   $2F
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L120BAA
         BRA   L121875
L121822  PEI   $09
         PEI   $07
         PEA   $001D
         PEI   $2F
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L120BAA
         BRA   L121875
L12183A  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2F
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L120DE0
         BRA   L121875
L121854  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2F
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L1210F8
         BRA   L121875
L12186E  PEA   $0022
         JSL   L0B0B7A
L121875  JSL   L0B381C
L121879  LDA   #$0003
         CMP   $2F
         BNE   L121895
         PEI   $29
         PEI   $27
         JSL   L07185A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B1A77
L121895  TSC
         CLC
         ADC   #$0034
         TCS
         PLD
         RTL

L12189D  ENT
         PHD
         TSC
         CLC
         ADC   #$FE6A
         TCS
         ADC   #$009F
         TCD
         STZ   $E3
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BNE   L1218D0
         LDA   #$0001
         STA   $E3
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
L1218D0  PHY
         JSL   L0314F6
         PLA
         DEC
         BPL   L1218DC
         BRL   L121BCF
L1218DC  CMP   #$000B
         BMI   L1218E4
         BRL   L121BCF
L1218E4  SEC
         SBC   #$0000
         BEQ   L121912
         DEC
         BEQ   L121934
         DEC
         BNE   L1218F3
         BRL   L1219B1
L1218F3  DEC
         DEC
         BNE   L1218FA
         BRL   L121B03
L1218FA  SEC
         SBC   #$0004
         BNE   L121903
         BRL   L121B5F
L121903  DEC
         BNE   L121909
         BRL   L121BA5
L121909  DEC
         BNE   L12190F
         BRL   L121BBA
L12190F  BRL   L121BCF
L121912  LDA   #$0001
         STA   L055145
         JSL   L15147E
         PEA   $0000
         PEA   $000C
         PEA   $FFFF
         JSL   L08736A
         JSL   L09AFB1
         JSL   L0E0000
         BRL   L121BCF
L121934  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L121950
         PEA   $0084
         JSL   L0B0B7A
         BRL   L121BCF
L121950  LDA   $E3
         BEQ   L12197D
         LDA   L0550ED
         LDX   L0550EF
         CMP   $E5
         BNE   L121960
         CPX   $E7
L121960  BEQ   L12197D
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L121E9A
         LDA   $EB
         ASL
         PHA
         PEI   $E9
         PEI   $E7
         PEI   $E5
         JSL   L151029
L12197D  LDY   #$00CE
         LDA   #$0020
         AND   [$E5],Y
         CMP   #$0000
         BNE   L121994
         PEI   $E7
         PEI   $E5
         JSL   L09A5A7
         BRA   L1219AA
L121994  LDA   L0550ED
         LDX   L0550EF
         CMP   $E5
         BNE   L1219A0
         CPX   $E7
L1219A0  BEQ   L1219AA
         PEI   $E7
         PEI   $E5
         JSL   L1511C8
L1219AA  JSL   L09AFB1
         BRL   L121BCF
L1219B1  TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         PHY
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   $ED
         LDA   $A5
         LDX   $A7
         STA   $EF
         STX   $F1
         PHY
         PEI   $F1
         PEI   $EF
         PEI   $ED
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L1219FE
         BRL   L121B00
L1219FE  TDC
         CLC
         ADC   #$00D3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0067
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $E3
         BEQ   L121A61
         LDA   $D9
         SEC
         SBC   $D5
         STA   $DB
         LDA   $D7
         SEC
         SBC   $D3
         STA   $DD
         PEI   $EB
         PHY
         PEI   $DB
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $F3
         PLA
         SEC
         SBC   $F3
         STA   $D5
         PEI   $E9
         PHY
         PEI   $DD
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $F3
         PLA
         SEC
         SBC   $F3
         STA   $D3
         LDA   $DB
         CLC
         ADC   $D5
         STA   $D9
         LDA   $DD
         CLC
         ADC   $D3
         STA   $D7
L121A61  TDC
         CLC
         ADC   #$00D3
         PEA   $0000
         PHA
         JSL   L121EEF
         LDA   #$8000
         AND   $65
         BNE   L121ABD
         PHY
         TDC
         CLC
         ADC   #$00D3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0067
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCC   L121A93
         BRL   L121BCF
L121A93  LDA   #$8000
         ORA   $65
         STA   $65
         PHY
         PEI   $F1
         PEI   $EF
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCC   L121ABD
         PEI   $F1
         PEI   $EF
         PEI   $ED
         PEA   $0000
         JSL   L0876F4
L121ABD  TDC
         CLC
         ADC   #$0067
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D3
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$7FFF
         AND   $65
         STA   $65
         PHY
         PEI   $F1
         PEI   $EF
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCC   L121B00
         PEI   $F1
         PEI   $EF
         PEI   $ED
         PEA   $0001
         JSL   L0876F4
L121B00  BRL   L121BCF
L121B03  JSL   L0E0000
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0006
         BMI   L121B55
         CMP   #$0003
         BPL   L121B55
         SEC
         SBC   #$0000
         BEQ   L121B26
         DEC
         BEQ   L121B39
         DEC
         BEQ   L121B47
         BRA   L121B55
L121B26  LDAL  L053ACB
         TAX
         LDAL  L053AC9
         STA   $DF
         STX   $E1
         JSL   L0E0000
         BRA   L121B55
L121B39  PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $DF
         PLX
         STX   $E1
         BRA   L121B55
L121B47  LDA   #$FFFF
         TAX
         STA   $DF
         STX   $E1
         JSL   L0E0000
         BRA   L121B55
L121B55  PEI   $E1
         PEI   $DF
         JSL   L099DFC
         BRA   L121BCF
L121B5F  TDC
         CLC
         ADC   #$008B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         LDA   $8B
         DEC
         DEC
         BNE   L121B88
         PEI   $97
         PEI   $95
         PEA   $0001
         JSL   L099F77
         BRA   L121BA3
L121B88  LDA   #$0003
         CMP   $8B
         BNE   L121B9C
         PEI   $93
         PEI   $91
         PEA   $0001
         JSL   L099EA4
         BRA   L121BA3
L121B9C  PEA   $0067
         JSL   L0B0B7A
L121BA3  BRA   L121BCF
L121BA5  LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L099F77
         JSL   L0E0000
         BRA   L121BCF
L121BBA  LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         JSL   L099EA4
         JSL   L0E0000
         BRA   L121BCF
L121BCF  TSC
         CLC
         ADC   #$0196
         TCS
         PLD
         RTL

L121BD7  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9C
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L0E00CC
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         JSL   L03198D
         PLA
         LSR
         BCC   L121C2B
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L0E07F9
         JSL   L100B4B
         BRA   L121C32
L121C2B  PEA   $000B
         JSL   L0B0B7A
L121C32  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         TSC
         CLC
         ADC   #$0064
         TCS
         PLD
         RTL

L121C4A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0A405F
         PLY
         PLY
         PLD
         RTL

L121C5A  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF6
         TCS
         ADC   #$0013
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L121C88
         TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $000D
         JSL   L0E0656
         BRA   L121C9B
L121C88  TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         JSL   L071EC5
L121C9B  PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L0E06AC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEI   $ED
         PEI   $EF
         PEI   $F1
         JSL   L0B104C
         TSC
         CLC
         ADC   #$010A
         TCS
         PLD
         RTL

L121CC3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L121CFA
         PHY
         JSL   L16072E
         PLA
         LSR
         BCC   L121CF4
         PHY
         PEA   $0000
         JSL   L16073C
         PLA
         STA   $01
*         PEA   ^L16073C
*         PEA   L16073C
*         JSL   L07187A
L121CF4  JSL   L0E0000
         BRA   L121D33
L121CFA  PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BEQ   L121D0A
         LDA   #$0000
         BRA   L121D0D
L121D0A  LDA   #$0001
L121D0D  STA   L0550BD
         LDA   L0550BD
         BEQ   L121D28
         PEA   ^L0530AF
         PEA   L0530AF
         PEA   $0000
         PEA   $0008
         PEA   $0017
         JSL   L0E0656
L121D28  JSL   L0E0000
         JSL   L09AED3
         STZ   L0550BD
L121D33  PLY
         PLY
         PLY
         PLD
         RTL

L121D38  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550BF
         SEC
         SBC   #$000A
         BVS   L121D4C
         EOR   #$8000
L121D4C  BPL   L121D54
         JSL   L0E0000
         BRA   L121D7D
L121D54  LDA   L0550BF
         INC
         STA   L0550BF
         LDA   L0550BF
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L0530B7
         LDX   #^L0530B7
         BCC   L121D6E
         INX
L121D6E  PHX
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $0017
         JSL   L0E0656
L121D7D  PLY
         PLY
         PLD
         RTL

L121D81  ENT
         PHD
         TSC
         CLC
         ADC   #$FDF0
         TCS
         ADC   #$0119
         TCD
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L0B2A02
L121D99  PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         CLC
         ADC   #$01BA
         BCC   L121DB3
         INX
L121DB3  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         JSL   L0B4D5D
         PLA
         BEQ   L121DD0
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L121DCD
         INX
L121DCD  TXA
         BNE   L121DFA
L121DD0  PEA   $0040
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEA   $0073
         JSL   L0B127A
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE7
         PHA
         PEA   $0025
         JSL   L0B127A
         JSL   L0B0897
         BRL   L121E92
L121DFA  PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L121E29
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L121E27
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L0B2965
         PHY
         JSL   L07005C
         PLA
         LSR
         BCS   L121E27
         BRL   L121D99
L121E27  BRA   L121E92
L121E29  LDA   #$0001
         LDX   #$0000
         STA   $EB
         STX   $ED
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L121E4A
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $EB
         PLX
         STX   $ED
L121E4A  PHY
         PHY
         JSL   L151319
         PEI   $ED
         PEI   $EB
         PHY
         PHY
         JSL   L0E05AF
         PLA
         PLX
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $EF
         STX   $F1
L121E6A  PHY
         JSL   L07005C
         PHY
         PHY
         JSL   L151319
         LDA   $EF
         LDX   $F1
         JSL   L033477
         BVS   L121E82
         EOR   #$8000
L121E82  BMI   L121E89
         LDA   #$0000
         BRA   L121E8C
L121E89  LDA   #$0001
L121E8C  ORA   $01,S
         PLX
         LSR
         BCC   L121E6A
L121E92  TSC
         CLC
         ADC   #$0210
         TCS
         PLD
         RTL

L121E9A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         LDX   $0C
         STA   $01
         STX   $03
         PHY
         LDA   [$0A]
         PHA
         PEA   $E0C0
         PEA   $1F40
         JSL   L071A1B
         PLA
         STA   [$01]
         LDA   #$0002
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L121EC6
         INX
L121EC6  STA   $01
         STX   $03
         PHY
         LDY   #$0002
         LDA   [$0A],Y
         PHA
         PEA   $E0C0
         PEA   $1F40
         JSL   L071A1B
         PLA
         STA   [$01]
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

L121EEF  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $01
         STZ   $03
         LDY   #$0004
         LDA   [$0E],Y
         SEC
         SBC   [$0E]
         SEC
         SBC   #$3E80
         BEQ   L121F1F
         BVS   L121F0E
         EOR   #$8000
L121F0E  BPL   L121F1F
         LDA   #$E0C0
         STA   [$0E]
         LDA   #$1F40
         LDY   #$0004
         STA   [$0E],Y
         BRA   L121F53
L121F1F  LDY   #$0004
         LDA   [$0E],Y
         SEC
         SBC   #$1F40
         BEQ   L121F3E
         BVS   L121F2F
         EOR   #$8000
L121F2F  BPL   L121F3E
         LDA   #$1F40
         LDY   #$0004
         SEC
         SBC   [$0E],Y
         STA   $03
         BRA   L121F53
L121F3E  LDA   [$0E]
         SEC
         SBC   #$E0C0
         BVS   L121F49
         EOR   #$8000
L121F49  BMI   L121F53
         LDA   #$E0C0
         SEC
         SBC   [$0E]
         STA   $03
L121F53  LDY   #$0006
         LDA   [$0E],Y
         LDY   #$0002
         SEC
         SBC   [$0E],Y
         SEC
         SBC   #$3E80
         BEQ   L121F7D
         BVS   L121F69
         EOR   #$8000
L121F69  BPL   L121F7D
         LDA   #$E0C0
         LDY   #$0002
         STA   [$0E],Y
         LDA   #$1F40
         LDY   #$0006
         STA   [$0E],Y
         BRA   L121FB7
L121F7D  LDY   #$0006
         LDA   [$0E],Y
         SEC
         SBC   #$1F40
         BEQ   L121F9C
         BVS   L121F8D
         EOR   #$8000
L121F8D  BPL   L121F9C
         LDA   #$1F40
         LDY   #$0006
         SEC
         SBC   [$0E],Y
         STA   $01
         BRA   L121FB7
L121F9C  LDY   #$0002
         LDA   [$0E],Y
         SEC
         SBC   #$E0C0
         BVS   L121FAA
         EOR   #$8000
L121FAA  BMI   L121FB7
         LDA   #$E0C0
         LDY   #$0002
         SEC
         SBC   [$0E],Y
         STA   $01
L121FB7  LDA   $03
         ORA   $01
         BEQ   L121FC9
         PEI   $10
         PEI   $0E
         PEI   $01
         PEI   $03
         JSL   L1501AF
L121FC9  LDA   $0C
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

L121FDB  ENT
         PHD
         TSC
         CLC
         ADC   #$FECE
         TCS
         ADC   #$0041
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L122008
         CPX   L0553BB
L122008  BNE   L122019
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L0B07EA
         BRA   L122048
L122019  PEA   ^L0403F7
         PEA   L0403F7
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         LDA   $F6
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L0B2D94
L122048  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$013A
         TCS
         RTL

L12205A  ENT
         PHD
         TSC
         CLC
         ADC   #$FECE
         TCS
         ADC   #$0043
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEI   $F8
         PEI   $F6
         PEA   $0100
         JSL   L0313BE
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L122087
         CPX   L0553BB
L122087  BNE   L12209A
         PEI   $FA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L0B0841
         BRA   L1220C9
L12209A  PEA   ^L0403FE
         PEA   L0403FE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         LDA   $F4
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L0B2D94
L1220C9  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$013C
         TCS
         RTL

L1220DB  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000F
         TCD
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L1220F4
         CPX   L0553BB
L1220F4  BNE   L12210B
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEI   $FA
         JSL   L072809
         JSL   L0B07EA
         BRA   L12211E
L12210B  PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEI   $FA
         JSL   L072809
         JSL   L0B2D94
L12211E  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0108
         TCS
         RTL

L122130  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0BB8
         CLC
         ADC   $0A
         PHA
         JSL   L1220DB
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

