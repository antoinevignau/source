*
* HypercardGS
* segment: $1D LowMemCmds
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   LowMemCmds.l
         lst   off

*---------------------------------------

         use   LowMemCmds.E
         use   LowMemCmds.X

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

L1D0000  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$002F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEI   $F6
         JSL   L07BCB8
         LDA   L055079
         BNE   L1D0036
         BRL   L1D0145
L1D0036  LDA   [$EE]
         STA   L055073
         LDY   #$0002
         LDA   [$EA],Y
         TAX
         LDA   [$EA]
         STA   L05506F
         STX   L055071
         LDY   #$0002
         LDA   [$E6],Y
         TAX
         LDA   [$E6]
         STA   L05506B
         STX   L05506D
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDY   #$0002
         LDA   [$F2],Y
         PHA
         LDA   [$F2]
         PHA
         JSL   L07B8EA
         PLA
         STA   $D5
         PLX
         STX   $D7
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STA   $D1
         STX   $D3
         LDA   $D5
         LDX   $D7
         STA   L05505D
         STX   L05505F
         LDA   $D5
         ORA   $D7
         BNE   L1D0095
         BRL   L1D0145
L1D0095  PEA   $0000
         JSL   L09091E
         STZ   L055087
         STZ   L055089
         JSL   L072328
         LDA   $F2
         LDX   $F4
         STA   $D9
         STX   $DB
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         TAY
         BNE   L1D00C6
         DEX
L1D00C6  DEC
         PHX
         PHA
         PEA   ^L0536E5
         PEA   L0536E5
         PEA   ^L07E5A5
         PEA   L07E5A5
         PEA   $0001
         JSL   L07C7B5
         PLA
         STA   [$D9]
         PLA
         LDY   #$0002
         STA   [$D9],Y
         LDA   [$F2]
         LDY   #$0002
         ORA   [$F2],Y
         BNE   L1D0114
         STZ   L05505D
         STZ   L05505F
         LDA   $D1
         LDX   $D3
         STA   [$F2]
         TXA
         LDY   #$0002
         STA   [$F2],Y
         PHY
         TDC
         CLC
         ADC   #$00D5
         PEA   $0000
         PHA
         JSL   L07E5A5
         PLA
         LSR
         BCS   L1D0114
         BRA   L1D0145
L1D0114  LDA   L055073
         STA   [$EE]
         LDA   L05506F
         LDX   L055071
         STA   [$EA]
         TXA
         LDY   #$0002
         STA   [$EA],Y
         LDA   L05506B
         LDX   L05506D
         STA   [$E6]
         TXA
         LDY   #$0002
         STA   [$E6],Y
         LDA   L055067
         LDX   L055069
         STA   [$E2]
         TXA
         LDY   #$0002
         STA   [$E2],Y
         BRA   L1D017A
L1D0145  LDA   #$0000
         TAX
         STA   [$F2]
         TXA
         LDY   #$0002
         STA   [$F2],Y
         LDA   #$0000
         STA   [$EE]
         LDA   #$0000
         TAX
         STA   [$EA]
         TXA
         LDY   #$0002
         STA   [$EA],Y
         LDA   #$0000
         TAX
         STA   [$E6]
         TXA
         LDY   #$0002
         STA   [$E6],Y
         LDA   #$0000
         TAX
         STA   [$E2]
         TXA
         LDY   #$0002
         STA   [$E2],Y
L1D017A  LDA   $E0
         STA   $FA
         LDA   $DF
         STA   $F9
         LDA   $DD
         TCD
         TSC
         CLC
         ADC   #$0128
         TCS
         RTL

L1D018C  PHD
         TSC
         CLC
         ADC   #$FEEC
         TCS
         ADC   #$001D
         TCD
         LDA   #$0001
         STA   $F1
         PHY
         JSL   L0314F6
         PLA
         STA   $EB
         PHY
         JSL   L0727BF
         PLA
         STA   $EF
         LDA   $EB
         SEC
         SBC   #$0004
         BPL   L1D01B7
         BRL   L1D0237
L1D01B7  CMP   #$0006
         BPL   L1D0237
         ASL
         TAX
         LDAL  L1D01C4,X
         PHA
         RTS

L1D01C4  DA    L1D01D0-1
         DA    L1D01D7-1
         DA    L1D01E8-1
         DA    L1D01F4-1
         DA    L1D0205-1
         DA    L1D0216-1

L1D01D0  LDA   #$C000
         STA   $F1
         BRA   L1D0237
L1D01D7  LDA   #$0055
         STA   $ED
         LDA   #$0001
         LDX   #$0000
         STA   $E7
         STX   $E9
         BRA   L1D0237
L1D01E8  LDA   #$0004
         STA   $ED
         LDA   #$8000
         STA   $F1
         BRA   L1D0237
L1D01F4  LDA   #$00B3
         STA   $ED
         LDA   #$00FF
         LDX   #$0000
         STA   $E7
         STX   $E9
         BRA   L1D0237
L1D0205  LDA   #$00C1
         STA   $ED
         LDA   #$00C0
         LDX   #$0000
         STA   $E7
         STX   $E9
         BRA   L1D0237
L1D0216  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PHY
         PHY
         PEA   ^L050C32
         PEA   L050C32
         JSL   L071DE3
         PLA
         PLX
         STA   $ED
         LDA   #$8000
         STA   $F1
         BRA   L1D0237
L1D0237  LDX   #$0000
         LDA   #$0004
         CMP   $EB
         BEQ   L1D0242
         INX
L1D0242  PHX
         LDX   #$0000
         LDA   #$0009
         CMP   $EB
         BEQ   L1D024E
         INX
L1D024E  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1D0265
         JSL   L0E0000
         LDAL  L040648
         SEP   #$20
         STAL  L050C32
         REP   #$20
L1D0265  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PHY
         PEI   $F1
         PEI   $ED
         PEI   $E9
         PEI   $E7
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCC   L1D02AE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEI   $E5
         PEI   $E3
         JSL   L072CD4
         JSL   L0E0EA8
         PEI   $E5
         PEI   $E3
         JSL   L07185A
         BRA   L1D02B2
L1D02AE  JSL   L0E0C52
L1D02B2  JSL   L0E0074
         PEI   $EF
         JSL   L0724F7
         TSC
         CLC
         ADC   #$0114
         TCS
         PLD
         RTL

L1D02C4  PHD
         TSC
         TCD
         SEP   #$20
         LDY   $08
         BEQ   L1D02E1
         LDY   #$0000
L1D02D0  LDA   [$0A],Y
         BNE   L1D02D8
         LDA   #$20
         STA   [$0A],Y
L1D02D8  INY
         BNE   L1D02D0
         INC   $0C
         DEC   $08
         BNE   L1D02D0
L1D02E1  LDY   $06
         BEQ   L1D02FB
         DEY
         BEQ   L1D02F3
L1D02E8  LDA   [$0A],Y
         BNE   L1D02F0
         LDA   #$20
         STA   [$0A],Y
L1D02F0  DEY
         BNE   L1D02E8
L1D02F3  LDA   [$0A]
         BNE   L1D02FB
         LDA   #$20
         STA   [$0A]
L1D02FB  LDY   $06
         LDA   [$0A],Y
         LDA   #$00
         STA   [$0A],Y
         REP   #$20
         LDA   $04
         STA   $0C
         LDA   $03
         STA   $0B
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L1D0315  PHD
         TSC
         SEC
         SBC   #$0026
         TCD
         TCS
         LDA   $34
         LDX   $36
         STA   $15
         STX   $17
         LDX   $32
         LDA   $30
         BNE   L1D032C
         DEX
L1D032C  DEC
         STX   $1B
         ASL
         ROL   $1B
         ASL
         ROL   $1B
         ASL
         ROL   $1B
         CLC
         ADC   $15
         STA   $19
         LDA   $1B
         ADC   $17
         STA   $1B
         LDA   $2C
         STAL  L1D03D8+1
         STAL  L1D041C+1
         LDA   $2D
         STAL  L1D03D8+2
         STAL  L1D041C+2
         TSX
         STX   $1D
         PEI   $17
         PEI   $15
         PEI   $1B
         PEI   $19
L1D0362  PLA
         PLX
         STA   $19
         STX   $1B
         PLA
         PLX
         STA   $15
         STX   $17
L1D036E  LDA   $15
         LDX   $17
         STA   $0D
         STX   $0F
         LDA   $19
         LDX   $1B
         STA   $11
         STX   $13
         SEC
         LDA   $11
         SBC   $0D
         TAY
         LDA   $13
         SBC   $0F
         LSR
         TAX
         TYA
         ROR
         AND   #$FFF8
         CLC
         ADC   $0D
         STA   $09
         TXA
         ADC   $0F
         STA   $0B
         LDY   #$0002
         LDA   [$09]
         STA   $01
         LDA   [$09],Y
         STA   $03
         INY
         INY
         LDA   [$09],Y
         STA   $05
         INY
         INY
         LDA   [$09],Y
         STA   $07
         BRA   L1D03BE
L1D03B2  LDA   $0D
         CLC
         ADC   #$0008
         STA   $0D
         BCC   L1D03BE
         INC   $0F
L1D03BE  LDY   #$0002
         LDA   [$0D]
         CMP   $01
         BNE   L1D03CD
         LDA   [$0D],Y
         CMP   $03
         BEQ   L1D03E1
L1D03CD  PHY
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         PHA
         PEI   $03
         PEI   $01
L1D03D8  JSL   $000000
         PLA
         BMI   L1D03B2
         BNE   L1D0402
L1D03E1  LDY   #$0006
         LDA   [$0D],Y
         CMP   $07
         BCC   L1D03B2
         BNE   L1D0402
         DEY
         DEY
         LDA   [$0D],Y
         CMP   $05
         BCC   L1D03B2
         BRA   L1D0402
L1D03F6  LDA   $11
         SEC
         SBC   #$0008
         STA   $11
         BCS   L1D0402
         DEC   $13
L1D0402  LDY   #$0002
         LDA   [$11]
         CMP   $01
         BNE   L1D0411
         LDA   [$11],Y
         CMP   $03
         BEQ   L1D0425
L1D0411  PHY
         LDA   [$11],Y
         PHA
         LDA   [$11]
         PHA
         PEI   $03
         PEI   $01
L1D041C  JSL   $000000
         PLA
         BMI   L1D0438
         BNE   L1D03F6
L1D0425  LDY   #$0006
         LDA   $07
         CMP   [$11],Y
         BCC   L1D03F6
         BNE   L1D0438
         DEY
         DEY
         LDA   $05
         CMP   [$11],Y
         BCC   L1D03F6
L1D0438  LDA   $13
         CMP   $0F
         BCC   L1D0481
         BNE   L1D0446
         LDA   $11
         CMP   $0D
         BCC   L1D0481
L1D0446  LDY   #$0006
L1D0449  TYX
         LDA   [$0D],Y
         STA   $1F,X
         DEY
         DEY
         BPL   L1D0449
         LDY   #$0006
L1D0455  LDA   [$11],Y
         STA   [$0D],Y
         DEY
         DEY
         BPL   L1D0455
         LDY   #$0006
L1D0460  TYX
         LDA   $1F,X
         STA   [$11],Y
         DEY
         DEY
         BPL   L1D0460
         LDA   $0D
         CLC
         ADC   #$0008
         STA   $0D
         BCC   L1D0475
         INC   $0F
L1D0475  LDA   $11
         SEC
         SBC   #$0008
         STA   $11
         BCS   L1D0481
         DEC   $13
L1D0481  LDA   $13
         CMP   $0F
         BCC   L1D0492
         BNE   L1D048F
         LDA   $11
         CMP   $0D
         BCC   L1D0492
L1D048F  BRL   L1D03BE
L1D0492  LDA   $0F
         CMP   $1B
         BCC   L1D04A0
         BNE   L1D04A8
         LDA   $0D
         CMP   $19
         BCS   L1D04A8
L1D04A0  PEI   $0F
         PEI   $0D
         PEI   $1B
         PEI   $19
L1D04A8  LDA   $11
         LDX   $13
         STA   $19
         STX   $1B
         LDA   $17
         CMP   $1B
         BCC   L1D04BE
         BNE   L1D04C1
         LDA   $15
         CMP   $19
         BCS   L1D04C1
L1D04BE  BRL   L1D036E
L1D04C1  TSX
         CPX   $1D
         BEQ   L1D04C9
         BRL   L1D0362
L1D04C9  LDA   $2A
         STA   $36
         LDA   $29
         STA   $35
         LDX   $27
         TDC
         CLC
         ADC   #$0034
         TCS
         TXA
         TCD
         RTL

L1D04DC  PHD
         TSC
         TCD
         PHP
         SEI
         PEA   ^L1D0617
         PEA   L1D0617
         PEA   $0000
         PEA   $0100
         _WriteRamBlock
         LDA   $06
         BPL   L1D04FE
         JSR   L1D0588
         BRL   L1D057A
L1D04FE  ASL
         TAX
         SEP   #$20
         LDAL  $E100CA
         ORA   #$20
         STAL  $E1C03C
         LDA   #$80
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   #$00
         STAL  $E1C03E
         LDAL  L1D05D7,X
         STAL  $E1C03D
         LDAL  L1D05D7+1,X
         STAL  $E1C03D
         LDA   #$20
         STAL  $E1C03E
         LDAL  L1D05F7,X
         STAL  $E1C03D
         LDAL  L1D05F7+1,X
         STAL  $E1C03D
         LDA   #$40
         STAL  $E1C03E
         LDA   #$80
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   #$C0
         STAL  $E1C03E
         LDA   #$02
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   #$A0
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         STAL  $E1C03D
         REP   #$20
L1D057A  PLP
         LDA   $04
         STA   $06
         LDA   $03
         STA   $05
         TDC
         TCS
         PLD
         PLY
         RTL

L1D0588  SEP   #$20
         LDAL  $E100CA
         ORA   #$20
         STAL  $E1C03C
         LDA   #$C0
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   #$20
         STAL  $E1C03E
         LDA   #$FF
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   #$A0
         STAL  $E1C03E
         LDA   #$02
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   #$40
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         STAL  $E1C03D
         REP   #$20
         RTS

L1D05D7  DW    $7619
         DW    $0E1B
         DW    $761B
         DW    $031B
         DW    $0E16
         DW    $7616
         DW    $0316
         DW    $0ECE
         DW    $76CE
         DW    $03CE
         DW    $0E19
         DW    $0319
         DW    $CB1B
         DW    $CB16
         DW    $CBCE
         DW    $CB19
L1D05F7  DW    $6D4D
         DW    $6339
         DW    $6D39
         DW    $7939
         DW    $633F
         DW    $6D3F
         DW    $793F
         DW    $6345
         DW    $6D45
         DW    $7945
         DW    $634D
         DW    $794D
         DW    $8539
         DW    $853F
         DW    $8545
         DW    $854D
L1D0617  HEX   7F8386898C8F9295989B9EA1A4A7AAAD
         HEX   B0B3B6B8BBBEC1C3C6C8CBCDD0D2D4D7
         HEX   D9DBDDDFE1E3E5E7E9EAECEEEFF0F2F3
         HEX   F4F5F7F8F9F9FAFBFCFCFDFDFDFEFEFE
         HEX   FEFEFEFEFDFDFDFCFCFBFAF9F8F8F7F5
         HEX   F4F3F2F0EFEEECEAE9E7E5E3E1DFDDDB
         HEX   D9D7D4D2D0CDCBC8C6C3C0BEBBB8B6B3
         HEX   B0ADAAA7A4A19E9B9895928F8C898683
         HEX   7F7C797673706D6A6764615E5B585552
         HEX   4F4C494744413E3C393734322F2D2B28
         HEX   262422201E1C1A1816151311100F0D0C
         HEX   0B0A0807060605040303020202010101
         HEX   0101010102020203030405060707080A
         HEX   0B0C0D0F1011131516181A1C1E202224
         HEX   26282B2D2F323437393C3F414447494C
         HEX   4F5255585B5E6164676A6D707376797C
	
L1D0717  ENT
         PHD
         TSC
         CLC
         ADC   #$FD86
         TCS
         ADC   #$0183
         TCD
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0004
         BVS   L1D0739
         EOR   #$8000
L1D0739  BPL   L1D0742
         JSL   L1D018C
         BRL   L1D0923
L1D0742  PHY
         PHY
         PEA   $0C1C
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         PHY
         JSL   L0314F6
         PLA
         STA   $EB
         LDA   $EB
         BNE   L1D07A1
         LDA   #$0001
         STA   $EB
         PEA   $0000
         TDC
         CLC
         ADC   #$0081
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7D
         PHA
         PEA   $083C
         JSL   L073002
         PEA   $0020
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0081
         PHA
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $0001
         JSL   L151367
         JSL   L151436
         BRA   L1D0812
L1D07A1  LDA   $EB
         LDX   #$FF7F
         STA   $00,X
         LDX   #$FF7F
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1D07B6
         EOR   #$8000
L1D07B6  BPL   L1D0812
         LDA   #$0001
         STA   $E9
L1D07BD  LDA   $E9
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0061
         TAX
         STX   $F3
         TDC
         CLC
         ADC   $F3
         LDX   #$0000
         PHX
         PHA
         JSL   L0E06D0
         LDA   $E9
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0061
         TAX
         STX   $F3
         TDC
         CLC
         ADC   $F3
         LDX   #$0000
         PHX
         PHA
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         LDA   $E9
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L151436
         LDA   $E9
         LDX   #$FF7F
         CMP   $00,X
         BEQ   L1D0812
         INC   $E9
         BRA   L1D07BD
L1D0812  LDA   $EB
         INC
         LDX   #$FF7D
         STA   $00,X
         LDX   #$FF7D
         LDA   $00,X
         SEC
         SBC   #$0003
         BEQ   L1D082C
         BVS   L1D082A
         EOR   #$8000
L1D082A  BMI   L1D0848
L1D082C  LDA   #$0003
         STA   $E9
L1D0831  PEI   $F1
         PEI   $EF
         PEI   $E9
         JSL   L072E4C
         LDA   $E9
         LDX   #$FF7D
         CMP   $00,X
         BEQ   L1D0848
         DEC   $E9
         BRA   L1D0831
L1D0848  PEA   $0000
         TDC
         CLC
         ADC   #$FF81
         PHA
         JSL   L0E06AC
         PEA   $0000
         TDC
         CLC
         ADC   #$FF81
         PHA
         PEA   ^L040316
         PEA   L040316
         PEA   ^L040317
         PEA   L040317
         PEA   ^L040318
         PEA   L040318
         JSL   L073C22
         PEI   $F1
         PEI   $EF
         PEA   $0004
         JSL   L073D2E
         PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $E7
         PEI   $F1
         PEI   $EF
         JSL   L15102F
         PEI   $F1
         PEI   $EF
         JSL   L151131
L1D089D  PHY
         PEA   $0000
         JSL   L0736C8
         PLA
         STA   $E5
         LDA   #$FFFF
         CMP   $E5
         BNE   L1D08B8
         JSL   L073A49
         LDA   #$0001
         STA   $E5
L1D08B8  LDX   #$0000
         LDA   $E5
         DEC
         BNE   L1D08C1
         INX
L1D08C1  PHX
         LDX   #$0000
         LDA   $E5
         DEC
         DEC
         BNE   L1D08CC
         INX
L1D08CC  TXA
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0003
         CMP   $E5
         BNE   L1D08DC
         INX
L1D08DC  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1D089D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF81
         PHA
         LDA   $E5
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0061
         TAX
         STX   $F3
         TDC
         CLC
         ADC   $F3
         LDX   #$0000
         PHX
         PHA
         PEA   $0020
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FF81
         PHA
         JSL   L0E0EA8
         JSL   L0E0074
         PEI   $F1
         PEI   $EF
         JSL   L072634
L1D0923  PEI   $ED
         JSL   L0724F7
         JSL   L09AFB1
         TSC
         CLC
         ADC   #$027A
         TCS
         PLD
         RTL

L1D0935  ENT
         PHD
         TSC
         CLC
         ADC   #$FCE0
         TCS
         ADC   #$0229
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L1D095A
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDB
         PHA
         JSL   L0E06AC
         BRA   L1D0967
L1D095A  LDAL  L040319
         LDX   #$FEDB
         SEP   #$20
         STA   $00,X
         REP   #$20
L1D0967  PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L0E06AC
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L1D09C4
         JSL   L0E0000
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDB
         PHA
         PEA   $0000
         JSL   L093CCE
         PLA
         STA   $DB
         PLX
         STX   $DD
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD7
         PHA
         PEI   $DD
         PEI   $DB
         JSL   L072CD4
         JSL   L0E0EA8
         PEI   $DD
         PEI   $DB
         JSL   L07185A
         BRL   L1D0B51
L1D09C4  PHY
         JSL   L0314F6
         PLA
         STA   $EF
         JSL   L0E0000
         PHY
         JSL   L0727BF
         PLA
         STA   $F1
         PHY
         PHY
         PEA   $0BB8
         JSL   L072834
         PLA
         STA   $EB
         PLX
         STX   $ED
         PEI   $ED
         PEI   $EB
         PEA   $0003
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDB
         PHA
         JSL   L073A7B
         PEI   $ED
         PEI   $EB
         PEA   $0003
         PEA   $0000
         PEA   $7FFF
         JSL   L0739E4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         PEA   ^L04031A
         PEA   L04031A
         PEA   ^L04031B
         PEA   L04031B
         PEA   ^L04031C
         PEA   L04031C
         JSL   L073C22
         PEI   $ED
         PEI   $EB
         PEA   $0004
         JSL   L073D2E
         LDA   $EF
         BEQ   L1D0A88
         PHY
         PHY
         PHY
         PHY
         PEI   $ED
         PEI   $EB
         PEA   $0000
         PEA   $0003
         JSL   L151367
         JSL   L151430
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $E7
         STX   $E9
         LDA   $E7
         LDX   $E9
         TXY
         LDX   #$FED7
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FED7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0038
         BCC   L1D0A7F
         INX
L1D0A7F  STA   $F3
         STX   $F5
         LDA   #$002A
         STA   [$F3]
L1D0A88  PEI   $ED
         PEI   $EB
         JSL   L15102F
         PEI   $ED
         PEI   $EB
         JSL   L151131
L1D0A98  PHY
         PEA   $0000
         JSL   L0736C8
         PLA
         STA   $DF
         LDA   #$FFFF
         CMP   $DF
         BNE   L1D0AB3
         JSL   L073A49
         LDA   #$0001
         STA   $DF
L1D0AB3  LDX   #$0000
         LDA   $DF
         DEC
         BNE   L1D0ABC
         INX
L1D0ABC  PHX
         LDX   #$0000
         LDA   $DF
         DEC
         DEC
         BNE   L1D0AC7
         INX
L1D0AC7  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1D0A98
         LDA   $DF
         DEC
         DEC
         BNE   L1D0AEC
         LDAL  L04031D
         SEP   #$20
         STAL  L050C32
         REP   #$20
         PEA   ^L04031E
         PEA   L04031E
         JSL   L0B2D94
         BRA   L1D0B39
L1D0AEC  PEI   $ED
         PEI   $EB
         PEA   $0003
         PEA   ^L050C32
         PEA   L050C32
         JSL   L071169
         LDA   $EF
         BEQ   L1D0B39
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0714B3
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC3
         PHA
         PHY
         PHY
         PEA   ^L050C33
         PEA   L050C33
         LDA   #$00FF
         ANDL  L050C32
         PHA
         JSL   L073FDF
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
L1D0B39  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E0EA8
         PEI   $ED
         PEI   $EB
         JSL   L072634
         PEI   $F1
         JSL   L0724F7
L1D0B51  JSL   L0E0074
         JSL   L09AFB1
         TSC
         CLC
         ADC   #$0320
         TCS
         PLD
         RTL

L1D0B61  ENT
         PHD
         TSC
         CLC
         ADC   #$FDF4
         TCS
         ADC   #$0115
         TCD
         PHY
         JSL   L0314F6
         PLA
         DEC
         BPL   L1D0B78
         BRL   L1D0CA7
L1D0B78  CMP   #$0003
         BMI   L1D0B80
         BRL   L1D0CA7
L1D0B80  SEC
         SBC   #$0000
         BEQ   L1D0B92
         DEC
         BEQ   L1D0BD5
         DEC
         BNE   L1D0B8F
         BRL   L1D0C6C
L1D0B8F  BRL   L1D0CA7
L1D0B92  PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L0E06AC
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L0B16ED
         PLA
         STA   $EF
         LDA   $EF
         BEQ   L1D0BC2
         PEI   $EF
         JSL   L0B06F1
         BRA   L1D0BD2
L1D0BC2  PEA   $000C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L0B0841
L1D0BD2  BRL   L1D0CA7
L1D0BD5  JSL   L0E0000
         LDA   L055389
         BNE   L1D0BE1
         BRL   L1D0C66
L1D0BE1  LDA   L05538B
         LDX   L05538D
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $F3
         STX   $F5
         LDA   [$F3]
         LDY   #$0002
         ORA   [$F3],Y
         BNE   L1D0C25
         LDA   #$0080
         AND   L055389
         BEQ   L1D0C0F
         PEA   $0853
         JSL   L0727E0
L1D0C0F  PEA   $0000
         TDC
         CLC
         ADC   #$FEEB
         PHA
         PEA   $0853
         JSL   L072809
         JSL   L0B2D94
         BRA   L1D0C4F
L1D0C25  PHY
         JSL   L1D3C47
         PLA
         LSR
         BCC   L1D0C4F
         PHY
         LDA   #$FF7F
         AND   L055389
         PHA
         LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L1604F0
         PLA
         STA   $F1
         PEA   ^L1604F0
         PEA   L1604F0
         JSL   L07187A
L1D0C4F  LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L07185A
         STZ   L05538B
         STZ   L05538D
         STZ   L055389
         BRA   L1D0C6A
L1D0C66  JSL   L072314
L1D0C6A  BRA   L1D0CA7
L1D0C6C  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BNE   L1D0C87
         PEA   $0084
         JSL   L0B0B7A
         BRA   L1D0CA7
L1D0C87  PHY
         PEI   $ED
         PEI   $EB
         JSL   L0B0653
         PLA
         LSR
         BCC   L1D0C9D
         PEA   $0085
         JSL   L0B0B7A
         BRA   L1D0CA5
L1D0C9D  PEI   $ED
         PEI   $EB
         JSL   L16049C
L1D0CA5  BRA   L1D0CA7
L1D0CA7  TSC
         CLC
         ADC   #$020C
         TCS
         PLD
         RTL

L1D0CAF  PHD
         TSC
         CLC
         ADC   #$FED0
         TCS
         ADC   #$0049
         TCD
         LDY   #$0002
         LDA   [$F4],Y
         DEC
         DEC
         BEQ   L1D0D08
         LDA   $F8
         LDX   $FA
         STA   $47
         STX   $49
         LDA   [$47]
         BEQ   L1D0CFA
         PHY
         PHY
         PEA   $000B
         PEA   $0000
         PEA   $0000
         LDA   #$0002
         CLC
         ADC   $47
         LDX   $49
         BCC   L1D0CE5
         INX
L1D0CE5  PHX
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $DF
         PLX
         STX   $E1
         BRA   L1D0D08
L1D0CFA  LDY   #$0004
         LDA   [$47],Y
         TAX
         DEY
         DEY
         LDA   [$47],Y
         STA   $DF
         STX   $E1
L1D0D08  LDY   #$0002
         LDA   [$F4],Y
         DEC
         BPL   L1D0D13
         BRL   L1D0EBD
L1D0D13  CMP   #$0004
         BMI   L1D0D1B
         BRL   L1D0EBD
L1D0D1B  SEC
         SBC   #$0000
         BEQ   L1D0D33
         DEC
         BEQ   L1D0D52
         DEC
         BNE   L1D0D2A
         BRL   L1D0E94
L1D0D2A  DEC
         BNE   L1D0D30
         BRL   L1D0EA5
L1D0D30  BRL   L1D0EBD
L1D0D33  PEI   $F2
         PEI   $F0
         PEA   $0000
         TDC
         CLC
         ADC   #$002F
         PHA
         PEI   $E1
         PEI   $DF
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
         BRL   L1D0EBD
L1D0D52  LDA   $F8
         LDX   $FA
         STA   $43
         STX   $45
         LDA   [$43]
         BEQ   L1D0D7D
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         LDA   #$0002
         CLC
         ADC   $43
         LDX   $45
         BCC   L1D0D72
         INX
L1D0D72  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         BRA   L1D0DA7
L1D0D7D  PHY
         PHY
         PEA   $000A	; from seconds to HyperCard IIgs format
         LDY   #$0004
         LDA   [$43],Y
         PHA
         DEY
         DEY
         LDA   [$43],Y
         PHA
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $DF
         PLX
         STX   $E1
L1D0DA7  PEI   $F2
         PEI   $F0
         PEA   $0000
         TDC
         CLC
         ADC   #$002F
         PHA

* AV 202208 - Y2K fix
* There was no check of the year as described in the ProDOS technotes

	lda	$da
	and	#$ff
	cmp	#40
	bcs	do1900
	adc	#2000	; AV 202208 - 1900
	bra	doY2K

do1900	clc
	adc	#1900

*         LDA   #$00FF
*         AND   $DA
*         CLC
*         ADC   #1900

doY2K    JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   ^L040325	; ,
         PEA   L040325
         PEA   $0000
         TDC
         CLC
         ADC   #$001B
         PHA
         LDA   #$00FF
         AND   $DC
         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   ^L040327	; ,
         PEA   L040327
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         LDA   #$00FF
         AND   $DB
         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   ^L040329	; ,
         PEA   L040329
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         LDA   #$00FF
         AND   $D9
         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   ^L04032B	; ,
         PEA   L04032B
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         LDA   #$00FF
         AND   $D8
         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   ^L04032D	; ,
         PEA   L04032D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         LDA   #$00FF
         AND   $D7
         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         PEA   ^L04032F	; ,
         PEA   L04032F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB7
         PHA

* AV 202208 - Y2K fix
* Day of the week was +1

	lda	$de	; year 1900
	and	#$ff
	tay
	
	lda	$da	; theYEAR
	and	#$ff
	cmp	#40
	bcs	yr1900

	dey		; year 2000

yr1900	tya

         JSL   L150488
         PHX
         PHA
         JSL   L0715D9
         TDC
         CLC
         ADC   #$004B
         PEA   $0000
         PHA
         PEA   $000D
         JSL   L1509CE
         PEA   $008C
         JSL   L0313BE
         BRA   L1D0EBD
L1D0E94  PEI   $E1
         PEI   $DF
         LDA   [$F4]
         PHA
         PEI   $F2
         PEI   $F0
         JSL   L0B1E76
         BRA   L1D0EBD
L1D0EA5  PEI   $E1
         PEI   $DF
         LDX   #$0000
         LDA   [$F4]
         DEC
         BNE   L1D0EB2
         INX
L1D0EB2  PHX
         PEI   $F2
         PEI   $F0
         JSL   L0B21F1
         BRA   L1D0EBD
L1D0EBD  LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$0142
         TCS
         RTL

L1D0ECF  ENT
         PHD
         TSC
         CLC
         ADC   #$FC94
         TCS
         ADC   #$0275
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BNE   L1D0EFD
         TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0008
         JSL   L0E0656
         BRA   L1D0EFF
L1D0EFD  STZ   $EF
L1D0EFF  TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0008
         JSL   L0E0656
         STZ   $F1
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L1D0F4A
         LDA   #$0001
         STA   $F1
         TDC
         CLC
         ADC   #$008B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         TDC
         CLC
         ADC   #$008B
         PEA   $0000
         PHA
         JSL   L0E0BFC
L1D0F4A  PHY
         JSL   L0B7725
         PLA
         LSR
         BCS   L1D0F60
         PEA   ^L040331
         PEA   L040331
         JSL   L0B2D94
         BRL   L1D101F
L1D0F60  TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0006
         JSL   L0E0656
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $0000
         PHD
         JSL   L1D0CAF
         LDA   $EF
         BEQ   L1D0FF8
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE8B
         PHA
         PEA   $0000
         PHD
         JSL   L1D0CAF
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         PEA   ^L050D32
         PEA   L050D32
         PEA   $0000
         TDC
         CLC
         ADC   #$FE8B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD8B
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L1D0FF8  PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         JSL   L0E0EA8
         LDA   $F1
         BEQ   L1D101B
         TDC
         CLC
         ADC   #$008B
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         BRA   L1D101F
L1D101B  JSL   L0E0074
L1D101F  TSC
         CLC
         ADC   #$036C
         TCS
         PLD
         RTL

L1D1027  ENT
         PHD
         TSC
         CLC
         ADC   #$FD0E
         TCS
         ADC   #$01FB
         TCD
         JSL   L0B2AC6
         LDA   #$0001
         STA   $F1
         LDA   L055039
         LDX   L05503B
         STA   $5D
         STX   $5F
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L1D10A2
         PEA   $0000
         TDC
         CLC
         ADC   #$FF05
         PHA
         JSL   L0E06AC
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF05
         PHA
         JSL   L0735A8
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDA   $E9
         ORA   $EB
         BNE   L1D108A
         PEA   $002D
         JSL   L0B0B7A
         JSL   L0E0000
         JSL   L0E0000
         BRL   L1D119A
L1D108A  PHY
         PHY
         PEI   $EB
         PEI   $E9
         JSL   L078841
         PLA
         STA   $5D
         PLX
         STX   $5F
         PEI   $EB
         PEI   $E9
         JSL   L07185A
L1D10A2  PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L1D10C5
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $002C
         PEA   $0001
         JSL   L0E0656
         BRA   L1D10C7
L1D10C5  STZ   $F1
L1D10C7  PEA   $0000
         TDC
         CLC
         ADC   #$FF05
         PHA
         JSL   L0E06AC
         LDA   $F1
         BEQ   L1D1128
         LDA   #$0002
         STA   $05
         LDA   #$0001
         LDX   #$0000
         STA   $0B
         STX   $0D
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   $002C
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L1D1128
         PEA   $007D
         JSL   L0B0B7A
         BRA   L1D119A
L1D1128  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF05
         PHA
         PEI   $F1
         JSL   L091037
         PLA
         STA   $ED
         LDA   $F1
         BEQ   L1D1150
         PHY
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $EF
L1D1150  LDA   $ED
         BEQ   L1D116C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE05
         PHA
         PEA   $0002
         JSL   L072809
         PEI   $ED
         JSL   L121FDB
         BRA   L1D119A
L1D116C  PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF05
         PHA
         JSL   L0735A8
         PLA
         STA   $E9
         PLX
         STX   $EB
         PEA   $0000
         PEA   $0001
         PEI   $EB
         PEI   $E9
         PEA   $0001
         JSL   L0968FC
         PEI   $EB
         PEI   $E9
         JSL   L07185A
L1D119A  TSC
         CLC
         ADC   #$02F2
         TCS
         PLD
         RTL

L1D11A2  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         JSL   L0B2AC6
         LDA   L05502B
         LDX   L05502D
         CMP   L055039
         BNE   L1D11BC
         CPX   L05503B
L1D11BC  BNE   L1D11C8
         PEA   $0007
         JSL   L1220DB
         BRL   L1D1261
L1D11C8  LDA   #$4000
         ANDL  L053AE9
         BEQ   L1D11D4
         LDA   #$0001
L1D11D4  STA   $09
         LDA   L05504F
         ORA   $09
         BEQ   L1D11E6
         PEA   $0008
         JSL   L1220DB
         BRA   L1D1261
L1D11E6  PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   L055039
         LDX   L05503B
         STA   $05
         STX   $07
         PEA   $0004
         JSL   L098852
         LDA   $05
         LDX   $07
         CMP   L055039
         BNE   L1D121F
         CPX   L05503B
L1D121F  BEQ   L1D1252
         PEI   $07
         PEI   $05
         PEA   $0001
         JSL   L0B883D
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L075B09
         LDAL  L05565D
         BNE   L1D1249
         PEI   $07
         PEI   $05
         JSL   L09538D
         BRA   L1D1250
L1D1249  PEA   $0009
         JSL   L1220DB
L1D1250  BRA   L1D1259
L1D1252  PEA   $0009
         JSL   L1220DB
L1D1259  PEI   $03
         PEI   $01
         JSL   L07185A
L1D1261  LDA   $12
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

L1D1273  ENT
         PHD
         TSC
         CLC
         ADC   #$FD10
         TCS
         ADC   #$01F9
         TCD
         JSL   L0B2AC6
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BEQ   L1D1292
         LDA   #$0000
         BRA   L1D1295
L1D1292  LDA   #$0001
L1D1295  PHA
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BEQ   L1D12A6
         LDA   #$0000
         BRA   L1D12A9
L1D12A6  LDA   #$0001
L1D12A9  ORA   $01,S
         PLX
         LSR
         BCS   L1D12B2
         BRL   L1D13B1
L1D12B2  PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BEQ   L1D12C2
         LDA   #$0000
         BRA   L1D12C5
L1D12C2  LDA   #$0001
L1D12C5  STA   $07
         PEA   $0000
         TDC
         CLC
         ADC   #$FF07
         PHA
         JSL   L0E06AC
         JSL   L09999B
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF07
         PHA
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDA   $07
         BEQ   L1D135B
         LDA   #$0004
         STA   $09
         LDY   #$0002
         LDA   [$D7],Y
         TAX
         LDA   [$D7]
         STA   $0B
         STX   $0D
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L1D1352
         LDX   #$0000
         LDA   #$0055
         CMP   $11
         BEQ   L1D132A
         INX
L1D132A  PHX
         LDA   #$0001
         LDX   #$0000
         CMP   $13
         BNE   L1D1337
         CPX   $15
L1D1337  BNE   L1D133E
         LDA   #$0000
         BRA   L1D1341
L1D133E  LDA   #$0001
L1D1341  AND   $01,S
         PLX
         LSR
         BCC   L1D1350
         PEA   $0044
         JSL   L1220DB
         BRA   L1D13A6
L1D1350  BRA   L1D135B
L1D1352  PEA   $0009
         JSL   L1220DB
         BRA   L1D13A6
L1D135B  PHY
         PEI   $D9
         PEI   $D7
         JSL   L0988BB
         PLA
         LSR
         BCC   L1D1372
         PEA   $0000
         PHD
         JSL   L1D11A2
         BRA   L1D13A6
L1D1372  PEI   $D9
         PEI   $D7
         JSL   L0718BF
         LDY   #$0002
         LDA   [$D7],Y
         PHA
         LDA   [$D7]
         PHA
         JSL   L075B09
         LDAL  L05565D
         BEQ   L1D13A6
         PEA   $0000
         TDC
         CLC
         ADC   #$FE07
         PHA
         PEA   $0044
         JSL   L072809
         LDAL  L05565D
         PHA
         JSL   L121FDB
L1D13A6  PEI   $D9
         PEI   $D7
         JSL   L07185A
         BRL   L1D16B7
L1D13B1  TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0022
         PEA   $0004
         JSL   L0E0656
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         PHY
         JSL   L0B3727
         PLA
         STA   $D3
         PLX
         STX   $D5
         TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0D0A88
         LDX   #$0000
         LDA   $E1
         BMI   L1D1445
         ORA   $DF
         BEQ   L1D1445
         INX
L1D1445  TXA
         BNE   L1D1457
         LDX   #$0000
         LDA   $DD
         BMI   L1D1454
         ORA   $DB
         BEQ   L1D1454
         INX
L1D1454  TXA
         BEQ   L1D145E
L1D1457  JSL   L0E0000
         BRL   L1D16B7
L1D145E  LDA   #$FFFF
         TAX
         CMP   $93
         BNE   L1D1468
         CPX   $95
L1D1468  BEQ   L1D146D
         BRL   L1D1555
L1D146D  LDA   #$FFFF
         TAX
         CMP   $9B
         BNE   L1D1477
         CPX   $9D
L1D1477  BEQ   L1D14F8
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         JSL   L071C12
         LDX   #$0000
         LDA   #$00FF
         AND   [$EB]
         BNE   L1D1491
         INX
L1D1491  TXA
         BEQ   L1D14F6
         LDA   $E3
         LDX   $E5
         CMP   $EF
         BNE   L1D149E
         CPX   $F1
L1D149E  BNE   L1D14A5
         LDA   #$0000
         BRA   L1D14A8
L1D14A5  LDA   #$0001
L1D14A8  BEQ   L1D14F6
L1D14AA  LDX   $F1
         LDA   $EF
         BNE   L1D14B1
         DEX
L1D14B1  DEC
         STA   $EF
         STX   $F1
         LDA   $E3
         LDX   $E5
         CMP   $EF
         BNE   L1D14C0
         CPX   $F1
L1D14C0  BEQ   L1D14C7
         LDA   #$0000
         BRA   L1D14CA
L1D14C7  LDA   #$0001
L1D14CA  PHA
         LDX   #$0000
         LDA   #$00FF
         AND   [$EF]
         CMP   #$0020
         BEQ   L1D14D9
         INX
L1D14D9  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1D14AA
         LDA   #$00FF
         AND   [$EF]
         CMP   #$0020
         BEQ   L1D14F6
         LDA   $EF
         LDX   $F1
         INC
         BNE   L1D14F2
         INX
L1D14F2  STA   $EF
         STX   $F1
L1D14F6  BRA   L1D1555
L1D14F8  LDA   #$FFFF
         TAX
         CMP   $A3
         BNE   L1D1502
         CPX   $A5
L1D1502  BEQ   L1D1536
         LDA   #$00FF
         AND   [$EB]
         CMP   L055277
         BNE   L1D151C
         LDA   $EB
         LDX   $ED
         INC
         BNE   L1D1516
         INX
L1D1516  STA   $EB
         STX   $ED
         BRA   L1D1534
L1D151C  LDA   $E3
         LDX   $E5
         CMP   $EF
         BNE   L1D1526
         CPX   $F1
L1D1526  BEQ   L1D1534
         LDX   $F1
         LDA   $EF
         BNE   L1D152F
         DEX
L1D152F  DEC
         STA   $EF
         STX   $F1
L1D1534  BRA   L1D1555
L1D1536  LDA   #$FFFF
         TAX
         CMP   $AB
         BNE   L1D1540
         CPX   $AD
L1D1540  BEQ   L1D1555
         LDA   #$00FF
         AND   [$EB]
         BEQ   L1D1555
         LDA   $EB
         LDX   $ED
         INC
         BNE   L1D1551
         INX
L1D1551  STA   $EB
         STX   $ED
L1D1555  TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         JSL   L070669
         PHY
         PHY
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L1D1580
         INX
L1D1580  STA   $CF
         STX   $D1
         LDA   L0553C5
         LDX   L0553C7
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L1D15A3
         DEX
L1D15A3  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $F3
         STX   $F5
         LDA   $CF
         LDX   $D1
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         PEI   $D1
         PEI   $CF
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L1D15E0
         BVS   L1D15D9
         EOR   #$8000
L1D15D9  BPL   L1D15E0
         LDA   #$0000
         BRA   L1D15E3
L1D15E0  LDA   #$0001
L1D15E3  BNE   L1D15E8
         BRL   L1D16A5
L1D15E8  PEI   $D5
         PEI   $D3
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L1D15FF
         BVS   L1D15FD
         EOR   #$8000
L1D15FD  BMI   L1D1604
L1D15FF  LDA   #$0000
         BRA   L1D1607
L1D1604  LDA   #$0001
L1D1607  BNE   L1D160C
         BRL   L1D16A5
L1D160C  LDA   L0553C5
         LDX   L0553C7
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L1D162B
         DEX
L1D162B  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L1D1643
         INX
L1D1643  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $CB
         STX   $CD
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         LDA   L0553C5
         LDX   L0553C7
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L1D167B
         DEX
L1D167B  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L1D1693
         INX
L1D1693  PHX
         PHA
         PEI   $D1
         PEI   $CF
         JSL   L070597
         PEI   $CD
         PEI   $CB
         JSL   L07185A
L1D16A5  TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         BRA   L1D16B7
L1D16B7  TSC
         CLC
         ADC   #$02F0
         TCS
         PLD
         RTL

L1D16BF  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L072314
         PHD
         LDA   $0A
         TCD
         CLC
         ADC   #$FDCE
         TCS
         JMPL  L1D1AFA

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

L1D16E9  PHD
         TSC
         CLC
         ADC   #$FF38
         TCS
         TCD
         STZ   $D2
         LDA   #$0009
         STA   $A7
         STZ   $A9
         STZ   $25
         STZ   $01
L1D16FE  LDA   $A9
         INC
         STA   $A9
         LDA   #$0024
         STA   $49
         TDC
         CLC
         ADC   #$0049
         STA   $AB
         STZ   $AD
         STZ   $BB
         TDC
         CLC
         ADC   #$00A7
         PEA   $0000
         PHA
         PEA   $202C
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0016
         CMP   $BB
         BNE   L1D176B
         LDA   #$0007
         AND   $B5
         DEC
         DEC
         BNE   L1D1752
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $0024
         JSL   L0313BE
         BRA   L1D176B
L1D1752  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $0024
         JSL   L0313BE
L1D176B  LDX   #$0000
         LDA   #$0009
         CMP   $BB
         BNE   L1D1776
         INX
L1D1776  PHX
         LDAL  L05565D
         BEQ   L1D1780
         LDA   #$0001
L1D1780  ORA   $01,S
         PLX
         LSR
         BCS   L1D1789
         BRL   L1D16FE
L1D1789  LDAL  L05565D
         BNE   L1D179A
         TDC
         CLC
         ADC   #$004B
         STA   $71
         STZ   $73
         BRA   L1D17BE
L1D179A  LDA   $25
         BMI   L1D17AB
         BEQ   L1D17AB
         TDC
         CLC
         ADC   #$0027
         STA   $71
         STZ   $73
         BRA   L1D17BE
L1D17AB  LDA   $01
         BMI   L1D17BC
         BEQ   L1D17BC
         TDC
         CLC
         ADC   #$0003
         STA   $71
         STZ   $73
         BRA   L1D17BE
L1D17BC  BRA   L1D17EE
L1D17BE  LDA   #$0002
         STA   $6D
         LDA   #$0003
         STA   $75
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L1D17EE
         LDA   $6F
         LDY   #$00E5
         STA   [$CE],Y
         LDA   #$0001
         STA   $D2
L1D17EE  LDA   $CC
         STA   $D0
         LDA   $CB
         STA   $CF
         LDA   $C9
         TCD
         TSC
         CLC
         ADC   #$00CE
         TCS
         RTL

L1D1800  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $01
         LDY   #$00E5
         LDA   [$0E],Y
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2014
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L1D1837
         PEA   $0000
         PEI   $0E
         JSL   L1D16BF
L1D1837  LDA   $0C
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

L1D1849  PHD
         TSC
         CLC
         ADC   #$FED6
         TCS
         ADC   #$003B
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDA   #$0004
         STA   $D9
         LDY   #$00E5
         LDA   [$F4],Y
         STA   $DB
         TDC
         CLC
         ADC   #$FFDA
         STA   $DD
         STZ   $DF
         LDA   #$00FF
         LDX   #$FFD9
         AND   $00,X
         JSL   L150488
         STA   $E1
         STX   $E3
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         PEA   $2013
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L1D18CE
         PEA   $0081
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L0B0841
         PEA   $0000
         PEI   $F4
         JSL   L1D16BF
L1D18CE  PEA   $00B4
         JSL   L0706CF
         LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0134
         TCS
         RTL

L1D18E7  ENT
         PHD
         TSC
         CLC
         ADC   #$FCD8
         TCS
         ADC   #$0231
         TCD
         STZ   $F1
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BEQ   L1D1904
         LDA   #$0000
         BRA   L1D1907
L1D1904  LDA   #$0001
L1D1907  PHA
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BEQ   L1D1918
         LDA   #$0000
         BRA   L1D191B
L1D1918  LDA   #$0001
L1D191B  ORA   $01,S
         PLX
         LSR
         BCC   L1D195A
         LDA   #$0001
         STA   $F1
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L1D1940
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         JSL   L0E06AC
         BRA   L1D1956
L1D1940  PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   ^L04033E
         PEA   L04033E
         PEA   $000D
         JSL   L0313BE
L1D1956  JSL   L0E0000
L1D195A  PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         JSL   L0E06AC
         LDA   $F1
         BEQ   L1D19D1
         PHY
         PEA   $0000
         PHD
         JSL   L1D16E9
         PLA
         LSR
         BCS   L1D1996
         PEA   $0081
         PEA   $0000
         TDC
         CLC
         ADC   #$FDCF
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L0B0841
L1D1996  PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   ^L032E6A
         PEA   L032E6A
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE5
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0000
         PHD
         JSL   L1D1849
         PEA   $0000
         PHD
         JSL   L1D1800
         BRL   L1D1AFA
L1D19D1  LDA   L05535F
         BNE   L1D19D9
         BRL   L1D1AFA
L1D19D9  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1D19E5
         BRL   L1D1AFA
L1D19E5  PHY
         JSL   L0301E4
         PLA
         BNE   L1D19D9
         PHY
         PEA   $00FF
         JSL   L1510B3
         PLA
         STA   $EB
         PEA   $00FF
         PEA   $00FF
         JSL   L1510AD
         PEA   $0002
         JSL   L0706CF
         LDA   #$00FF
         LDX   #$FFE5
         AND   $00,X
         LDX   #$FDE3
         STA   $00,X
         LDX   #$FDE3
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1D1A24
         EOR   #$8000
L1D1A24  BMI   L1D1A29
         BRL   L1D1AF1
L1D1A29  LDA   #$0001
         STA   $ED
L1D1A2E  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1D1A41
         PEA   $8000
         JSL   L1D04DC
         BRL   L1D1AF1
L1D1A41  LDA   $ED
         CLC
         ADC   #$FFE5
         TAX
         LDA   #$00FF
         AND   $00,X
         STA   $EF
         LDA   $EF
         SEC
         SBC   #$0023
         BMI   L1D1ACC
         CMP   #$0022
         BPL   L1D1ACC
         SEC
         SBC   #$0000
         BEQ   L1D1AB2
         SEC
         SBC   #$0007
         BEQ   L1D1AA9
         DEC
         DEC
         BEQ   L1D1A8A
         SEC
         SBC   #$0004
         BMI   L1D1ACC
         CMP   #$000A
         BCC   L1D1A9C
         SEC
         SBC   #$000B
         BEQ   L1D1A93
         SEC
         SBC   #$0006
         BMI   L1D1ACC
         CMP   #$0004
         BCC   L1D1ABB
         BRA   L1D1ACC
L1D1A8A  PEA   $002E
         JSL   L0706CF
         BRA   L1D1ACE
L1D1A93  PEA   $024A
         JSL   L0706CF
         BRA   L1D1ACE
L1D1A9C  LDA   $EF
         SEC
         SBC   #$0030
         PHA
         JSL   L1D04DC
         BRA   L1D1ACE
L1D1AA9  PEA   $000A
         JSL   L1D04DC
         BRA   L1D1ACE
L1D1AB2  PEA   $000B
         JSL   L1D04DC
         BRA   L1D1ACE
L1D1ABB  LDA   #$000C
         CLC
         ADC   $EF
         SEC
         SBC   #$0041
         PHA
         JSL   L1D04DC
         BRA   L1D1ACE
L1D1ACC  BRA   L1D1AE3
L1D1ACE  PEA   $000A
         JSL   L0706CF
         PEA   $8000
         JSL   L1D04DC
         PEA   $0004
         JSL   L0706CF
L1D1AE3  LDA   $ED
         LDX   #$FDE3
         CMP   $00,X
         BEQ   L1D1AF1
         INC   $ED
         BRL   L1D1A2E
L1D1AF1  PEI   $EB
         PEA   $00FF
         JSL   L1510AD
L1D1AFA  TSC
         CLC
         ADC   #$0328
         TCS
         PLD
         RTL

L1D1B02  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         LDA   #$0005
         CMP   L0551FB
         BEQ   L1D1B31
         PEA   $0062
         JSL   L0B0B7A
         BRA   L1D1B6C
L1D1B31  LDA   #$0005
         CMP   $01
         BNE   L1D1B41
         PEA   $0063
         JSL   L0B0B7A
         BRA   L1D1B6C
L1D1B41  LDA   L0550B9
         DEC
         BNE   L1D1B50
         PEA   $0079
         JSL   L0B0B7A
         BRA   L1D1B6C
L1D1B50  PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L0F0635
         PLA
         LSR
         BCS   L1D1B6C
         PEA   $0064
         JSL   L0B0B7A
L1D1B6C  TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

L1D1B74  ENT
         PHD
         TSC
         CLC
         ADC   #$FDE0
         TCS
         ADC   #$0129
         TCD
         LDA   L054FA1
         STA   $F1
         PHY
         PHY
         JSL   L07B114
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   L0550B3
         STA   $EF
         LDA   L0550AF
         LDX   L0550B1
         STA   $D7
         STX   $D9
         LDA   L0550AB
         JSL   L150488
         STA   $DF
         STX   $E1
         LDA   #$0000
         STAL  L0538C7
         STZ   L05507B
         STZ   L05507D
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BEQ   L1D1BC5
         BRL   L1D1C7C
L1D1BC5  PEA   ^L0538B9
         PEA   L0538B9
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         LDAL  L0538C1
         TAX
         LDAL  L0538BF
         CMPL  L0538BB
         BNE   L1D1BEC
         TXA
         CMPL  L0538BD
L1D1BEC  BEQ   L1D1C00
         JSL   L0E0000
         JSL   L0E0000
         PEA   $007E
         JSL   L0B0B7A
         BRL   L1D1D7A
L1D1C00  LDAL  L0538C1
         TAX
         LDAL  L0538BF
         STA   L05507B
         STX   L05507D
         LDAL  L0538C7
         DEC
         BMI   L1D1C7C
         CMP   #$0003
         BPL   L1D1C7C
         SEC
         SBC   #$0000
         BEQ   L1D1C4D
         DEC
         BEQ   L1D1C29
         DEC
         BEQ   L1D1C31
         BRA   L1D1C7C
L1D1C29  LDAL  L0538C9
         STA   $EF
         BRA   L1D1C7C
L1D1C31  PHY
         LDAL  L0538BD
         PHA
         LDAL  L0538BB
         PHA
         LDAL  L0538C9
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         STA   $EF
         BRA   L1D1C7C
L1D1C4D  PHY
         LDAL  L0538BD
         PHA
         LDAL  L0538BB
         PHA
         PHY
         LDAL  L0538BD
         PHA
         LDAL  L0538BB
         PHA
         PEA   $0002
         PEA   ^L0538C9
         PEA   L0538C9
         JSL   L07BF8F
         PEA   $0000
         JSL   L07AD84
         PLA
         STA   $EF
         BRA   L1D1C7C
L1D1C7C  PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L0E06AC
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0013
         JSL   L0E0656
         LDA   #$00FF
         LDX   #$FFD7
         AND   $00,X
         BEQ   L1D1D27
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEI   $EB
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L1D0000
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1D1CF1
         BRL   L1D1D74
L1D1CF1  LDA   $E7
         ORA   $E9
         BEQ   L1D1D27
         PEI   $E9
         PEI   $E7
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968FC
         LDA   $EF
         STA   L0550B3
         LDA   $D7
         LDX   $D9
         STA   L0550AF
         STX   L0550B1
         LDA   $DF
         STA   L0550AD
         LDA   $DB
         STA   L0550AB
         JSL   L086149
         BRA   L1D1D74
L1D1D27  STZ   L0550B3
         STZ   L0550AF
         STZ   L0550B1
         STZ   L0550AD
         STZ   L0550AB
         PEA   ^L04034B
         PEA   L04034B
         JSL   L0B2D94
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L1D1D4E
         CPX   L0553BB
L1D1D4E  BNE   L1D1D74
         LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L1D1D5C
         EOR   #$8000
L1D1D5C  BMI   L1D1D70
         PEA   $000F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L0B0841
         BRA   L1D1D74
L1D1D70  JSL   L072314
L1D1D74  PEI   $F1
         JSL   L0724F7
L1D1D7A  TSC
         CLC
         ADC   #$0220
         TCS
         PLD
         RTL

L1D1D82  PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         LDA   #$0001
         STA   $1F
L1D1D8F  LDA   $1F
         DEC
         PEA   $000A
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L05106C
         LDX   #^L05106C
         BCC   L1D1DA5
         INX
L1D1DA5  CLC
         ADC   #$0004
         BCC   L1D1DAC
         INX
L1D1DAC  STA   $21
         STX   $23
         LDA   [$21]
         BEQ   L1D1DC9
         LDA   #$0008
         CMP   $1F
         BEQ   L1D1DBF
         INC   $1F
         BRA   L1D1D8F
L1D1DBF  PEA   $0011
         JSL   L0B0B7A
         BRL   L1D1EE9
L1D1DC9  LDA   $1F
         DEC
         PEA   $000A
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L05106C
         LDX   #^L05106C
         BCC   L1D1DDF
         INX
L1D1DDF  STA   $15
         STX   $17
         LDA   #$0000
         LDY   #$0006
         STA   [$15],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$15],Y
         LDA   #$0000
         TAX
         STA   [$15]
         TXA
         LDY   #$0002
         STA   [$15],Y
         LDA   #$0001
         LDY   #$0008
         STA   [$15],Y
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PHY
         PHY
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0735A8
         PLA
         STA   $19
         PLX
         STX   $1B
         JSL   L09999B
         PEI   $1B
         PEI   $19
         JSL   L0718BF
         LDY   #$0002
         LDA   [$19],Y
         PHA
         LDA   [$19]
         PHA
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L075A86
         LDX   #$0000
         LDAL  L05565D
         BNE   L1D1E5E
         INX
L1D1E5E  TXA
         BNE   L1D1E71
         LDX   #$0000
         LDA   #$0047
         CMPL  L05565D
         BNE   L1D1E6E
         INX
L1D1E6E  TXA
         BEQ   L1D1E87
L1D1E71  PHY
         LDY   #$0002
         LDA   [$19],Y
         PHA
         LDA   [$19]
         PHA
         PEA   $0000
         JSL   L075D3B
         PLA
         STA   $1D
         BRA   L1D1E96
L1D1E87  PEA   $0012
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0841
         BRA   L1D1EE1
L1D1E96  LDAL  L05565D
         BEQ   L1D1EC4
         PEA   $0013
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0897
         STZ   $1D
         BRA   L1D1EE1
L1D1EC4  LDA   $1D
         LDY   #$0004
         STA   [$15],Y
         LDA   $19
         LDX   $1B
         STA   [$15]
         TXA
         LDY   #$0002
         STA   [$15],Y
         PEI   $1B
         PEI   $19
         JSL   L07191C
         BRA   L1D1EE9
L1D1EE1  PEI   $1B
         PEI   $19
         JSL   L07185A
L1D1EE9  LDA   $28
         STA   $2C
         LDA   $27
         STA   $2B
         LDA   $25
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L1D1EFB  PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0013
         TCD
         LDA   L055389
         BEQ   L1D1F0E
         BRL   L1D1FBA
L1D1F0E  LDA   #$0041
         STA   L055389
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L1D1F59
         LDA   #$00C2
         STA   L055389
         PHY
         JSL   L1D3C47
         PLA
         LSR
         BCC   L1D1F44
         PHY
         LDA   L055389
         PHA
         JSL   L1604E2
         PLA
         STA   $ED
         PEA   ^L1604E2
         PEA   L1604E2
         JSL   L07187A
L1D1F44  LDA   $ED
         BNE   L1D1F55
         STZ   L055389
         PEA   ^L04035C
         PEA   L04035C
         JSL   L0B2D94
L1D1F55  JSL   L0E0000
L1D1F59  JSL   L0E0000
         LDA   L055389
         BEQ   L1D1FB8
         PHY
         PHY
         PEA   $0000
         PEA   $0084
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05538B
         PLA
         STA   L05538D
         LDAL  L05565D
         BEQ   L1D1F96
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0BE5
         JSL   L072809
         JSL   L0B2D94
         BRA   L1D1FB8
L1D1F96  LDA   L05538B
         LDX   L05538D
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EF
         STX   $F1
         LDA   #$0000
         TAX
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
L1D1FB8  BRA   L1D1FBE
L1D1FBA  JSL   L072314
L1D1FBE  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010C
         TCS
         RTL

L1D1FD0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         DEC
         BMI   L1D2017
         CMP   #$0005
         BPL   L1D2017
         SEC
         SBC   #$0000
         BEQ   L1D1FFA
         DEC
         BEQ   L1D1FFA
         DEC
         BEQ   L1D2003
         DEC
         BEQ   L1D200D
         DEC
         BEQ   L1D200D
         BRA   L1D2017
L1D1FFA  PEA   $0000
         JSL   L0C1032
         BRA   L1D2017
L1D2003  PEA   $0000
         PHD
         JSL   L1D1D82
         BRA   L1D2017
L1D200D  PEA   $0000
         PHD
         JSL   L1D1EFB
         BRA   L1D2017
L1D2017  PLY
         PLY
         PLD
         RTL

L1D201B  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   L05538B
         ORA   L05538D
         BNE   L1D202E
         BRL   L1D20C5
L1D202E  PHY
         PHY
         LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L151301
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   L05538B
         LDX   L05538D
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         INC
         BNE   L1D2064
         INX
L1D2064  STA   $05
         STX   $07
         LDA   $05
         LDX   $07
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0004
         BCC   L1D207F
         INX
L1D207F  STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   $0D
         LDX   $0F
         JSL   L033477
         BEQ   L1D20C3
         BVS   L1D2096
         EOR   #$8000
L1D2096  BPL   L1D20C3
         LDA   $09
         LDX   $0B
         CLC
         ADC   #$0080
         BCC   L1D20A3
         INX
L1D20A3  STA   $0D
         STX   $0F
         PHY
         LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         PEI   $0F
         PEI   $0D
         JSL   L078A05
         PLA
         LSR
         BCS   L1D20C3
         JSL   L072314
         BRL   L1D2145
L1D20C3  BRA   L1D20E7
L1D20C5  LDA   #$0001
         LDX   #$0000
         STA   $05
         STX   $07
         PHY
         PHY
         PEA   $0000
         PEA   $0008
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05538B
         PLA
         STA   L05538D
L1D20E7  LDA   L05538B
         LDX   L05538D
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $01
         STX   $03
         LDA   $05
         LDX   $07
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L1D2114
         INX
L1D2114  PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L1D2120
         DEX
L1D2120  DEC
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
         LDA   L055027
         LDX   L055029
         STA   [$13]
         TXA
         LDY   #$0002
         STA   [$13],Y
L1D2145  LDA   $1A
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

L1D2157  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05538B
         ORA   L05538D
         BNE   L1D2169
         BRA   L1D21B5
L1D2169  LDA   L055389
         BNE   L1D21B5
         PHY
         JSL   L1D3C47
         PLA
         LSR
         BCC   L1D21A3
         LDA   #$00F1
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2182
         INX
L1D2182  STA   $01
         STX   $03
         PHY
         PEA   $0041
         LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L1604F0
         PLA
         STA   [$01]
         PEA   ^L1604F0
         PEA   L1604F0
         JSL   L07187A
L1D21A3  LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L07185A
         STZ   L05538B
         STZ   L05538D
L1D21B5  LDA   $08
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

L1D21C6  ENT
         PHD
         TSC
         CLC
         ADC   #$FE90
         TCS
         ADC   #$0079
         TCD
         LDX   #$FFFF
         STZ   $00,X
         STZ   $02,X
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0004
         BPL   L1D21E7
         BRL   L1D2591
L1D21E7  CMP   #$0006
         BMI   L1D21EF
         BRL   L1D2591
L1D21EF  SEC
         SBC   #$0000
         BNE   L1D21F8
         BRL   L1D2307
L1D21F8  DEC
         BNE   L1D21FE
         BRL   L1D2337
L1D21FE  DEC
         BNE   L1D2204
         BRL   L1D23A2
L1D2204  DEC
         DEC
         BNE   L1D220B
         BRL   L1D2512
L1D220B  DEC
         BEQ   L1D2211
         BRL   L1D2591
L1D2211  JSL   L0E0000
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $ED
         PLX
         STX   $EF
         LDA   $ED
         ORA   $EF
         BNE   L1D222A
         BRL   L1D2598
L1D222A  PEI   $EF
         PEI   $ED
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L1D2253
         PEA   $0003
         PEA   $0000
         TDC
         CLC
         ADC   #$FF87
         PHA
         PEI   $EF
         PEI   $ED
         JSL   L07346C
         JSL   L0B0841
         BRL   L1D2598
L1D2253  LDX   $EF
         LDA   $ED
         BNE   L1D225A
         DEX
L1D225A  DEC
         STA   $ED
         STX   $EF
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L0940E5
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         PEA   $005C
         JSL   L0313BE
         PEA   $0000
         PHD
         JSL   L1D201B
L1D228D  LDX   #$0000
         LDA   $EF
         BMI   L1D2299
         ORA   $ED
         BEQ   L1D2299
         INX
L1D2299  TXA
         PHA
         PHY
         JSL   L07005C
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1D22EB
         LDA   #$0003
         STA   $77
         LDA   #$0002
         STA   $81
         LDA   #$0006
         STA   $A3
         LDA   $73
         LDX   $75
         STA   $CF
         STX   $D1
         PHY
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L1D22D5
         BRA   L1D22EB
L1D22D5  LDX   $EF
         LDA   $ED
         BNE   L1D22DC
         DEX
L1D22DC  DEC
         STA   $ED
         STX   $EF
         PEA   $0000
         PHD
         JSL   L1D201B
         BRA   L1D228D
L1D22EB  PHY
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L0933AB
         PLA
         STA   $F1
         PEA   $0000
         PHD
         JSL   L1D2157
         BRL   L1D2598
L1D2307  JSL   L0E0000
         LDA   L055389
         BNE   L1D2334
         PHY
         JSL   L1D3C47
         PLA
         LSR
         BCC   L1D2334
         PHY
         PEA   $0041
         PEA   $0000
         PEA   $0000
         JSL   L1604F0
         PLA
         STA   $E9
         PEA   ^L1604F0
         PEA   L1604F0
         JSL   L07187A
L1D2334  BRL   L1D2598
L1D2337  TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L0940E5
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E0656
         LDA   $CF
         LDX   $D1
         CMP   $73
         BNE   L1D2364
         CPX   $75
L1D2364  BNE   L1D239B
         PHY
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCC   L1D2399
         PEA   $0000
         PHD
         JSL   L1D201B
         PHY
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L0933AB
         PLA
         STA   $F1
         PEA   $0000
         PHD
         JSL   L1D2157
L1D2399  BRA   L1D239F
L1D239B  JSL   L072314
L1D239F  BRL   L1D2598
L1D23A2  LDA   L054FA1
         STA   $D3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA5
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA5
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   $EB
         LDX   #$FFA7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $DD
         STX   $DF
         LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $D9
         STX   $DB
         LDX   #$FFAB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $D5
         STX   $D7
         PHY
         PEI   $DF
         PEI   $DD
         PEI   $EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L1D2413
         BRL   L1D2509
L1D2413  LDX   #$FFAB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $DD
         BNE   L1D2422
         CPX   $DF
L1D2422  BEQ   L1D2429
         LDA   #$0000
         BRA   L1D242C
L1D2429  LDA   #$0001
L1D242C  STA   $E7
         LDA   #$4000
         LDX   #$FFD9
         AND   $00,X
         BEQ   L1D243B
         LDA   #$0001
L1D243B  AND   $E7
         STA   $E5
         LDA   $D9
         LDX   $DB
         CMP   $DD
         BNE   L1D2449
         CPX   $DF
L1D2449  BNE   L1D2453
         LDA   $EB
         EOR   #$FFFF
         INC
         STA   $EB
L1D2453  PHY
         PHY
         PEI   $DB
         PEI   $D9
         PEI   $D7
         PEI   $D5
         PEI   $EB
         PEI   $E5
         JSL   L07AEBB
         PLA
         STA   $E1
         PLX
         STX   $E3
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9B
         PHA
         PEA   $0000
         PEA   $000A
         JSL   L071EC5
         LDX   #$FFEF
         LDA   $00,X
         LDX   #$FF9B
         STA   $00,X
         LDX   #$FFF3
         LDA   $00,X
         LDX   #$FF9D
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDX   #$FFF1
         LDA   $00,X
         LDX   #$FF9E
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDX   #$FFF5
         LDA   $00,X
         LDX   #$FFA1
         STA   $00,X
         LDX   #$FFED
         LDA   $00,X
         LDX   #$FF9F
         STA   $00,X
         LDA   #$00FF
         LDX   #$FFF8
         AND   $00,X
         LDX   #$FFA3
         STA   $00,X
         PEI   $E3
         PEI   $E1
         JSL   L0718BF
         PHY
         JSL   L1D3C47
         PLA
         LSR
         BCC   L1D2501
         PHY
         PEA   $0022
         PEI   $E3
         PEI   $E1
         LDX   #$FFFF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9B
         PHA
         JSL   L160720
         PLA
         STA   $E9
         PEA   ^L160720
         PEA   L160720
         JSL   L07187A
L1D2501  PEI   $E3
         PEI   $E1
         JSL   L07185A
L1D2509  PEI   $D3
         JSL   L0724F7
         BRL   L1D2598
L1D2512  JSL   L031B09
         PHY
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         TDC
         CLC
         ADC   #$00E1
         PEA   $0000
         PHA
         PHY
         PHY
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L1D253E
         INX
L1D253E  PHX
         PHA
         JSL   L0B25F8
         PLA
         STA   $E9
         PEI   $E3
         PEI   $E1
         JSL   L0718BF
         PHY
         JSL   L1D3C47
         PLA
         LSR
         BCC   L1D2583
         PHY
         PEA   $0023
         PEI   $E3
         PEI   $E1
         LDX   #$FFFF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9B
         PHA
         JSL   L160720
         PLA
         STA   $E9
         PEA   ^L160720
         PEA   L160720
         JSL   L07187A
L1D2583  PEI   $E3
         PEI   $E1
         JSL   L07185A
         JSL   L0E0000
         BRA   L1D2598
L1D2591  PEA   $0001
         JSL   L0C1032
L1D2598  TSC
         CLC
         ADC   #$0170
         TCS
         PLD
         RTL

L1D25A0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFAC
         TCS
         TCD
         JSL   L0B2AC6
         STZ   $2D
         STZ   $2F
         STZ   $4D
         STZ   $49
         LDA   #$0001
         STA   $47
         STZ   $45
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L1D25D4
         PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $41
         PLX
         STX   $43
         BRA   L1D2616
L1D25D4  PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L1D25E9
         STZ   $47
         STZ   $4D
         JSL   L0E0000
         BRA   L1D2616
L1D25E9  STZ   $47
         LDA   #$0001
         STA   $45
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         LDA   #$00FF
         ANDL  L050C32
         SEC
         SBC   #$0000
         BMI   L1D2614
         BEQ   L1D2614
         LDA   #$00FF
         ANDL  L050C33
         STA   $4D
         BRA   L1D2616
L1D2614  STZ   $4D
L1D2616  PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BNE   L1D2654
         PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $2D
         PLX
         STX   $2F
         PEI   $2F
         PEI   $2D
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L1D2650
         BEQ   L1D2650
         LDX   $2F
         LDA   $2D
         BNE   L1D2644
         DEX
L1D2644  DEC
         STA   $2D
         STX   $2F
         LDA   #$0001
         STA   $49
         BRA   L1D2654
L1D2650  STZ   $2D
         STZ   $2F
L1D2654  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PHY
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         PEA   $0000
         JSL   L0B16ED
         PLA
         STA   $4F
         LDA   $4F
         BNE   L1D269C
         PEA   $0016
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         LDAL  L05565D
         PHA
         JSL   L12205A
         BRL   L1D29CD
L1D269C  LDA   #$0004
         STA   $15
         LDA   $4F
         STA   $17
         LDA   $4D
         BNE   L1D26AD
         STZ   $19
         BRA   L1D26B2
L1D26AD  LDA   #$00FF
         STA   $19
L1D26B2  LDA   #$0001
         STA   $1B
         TDC
         CLC
         ADC   #$004D
         STA   $1D
         STZ   $1F
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $2011
         JSL   GSOS2
         STAL  L05565D
         LDA   $49
         BEQ   L1D26F9
         PEI   $4F
         PEI   $2F
         PEI   $2D
         JSL   L075E14
         LDA   #$004D
         CMPL  L05565D
         BNE   L1D26F9
         PEI   $4F
         PHY
         PHY
         PEI   $4F
         JSL   L075B7B
         JSL   L075E14
L1D26F9  PHY
         PHY
         PEI   $4F
         JSL   L075B7B
         PLA
         STA   $39
         PLX
         STX   $3B
         LDA   $47
         BEQ   L1D2728
         PEI   $3B
         PEI   $39
         LDA   $41
         LDX   $43
         JSL   L033477
         BVS   L1D271C
         EOR   #$8000
L1D271C  BMI   L1D2726
         LDA   $39
         LDX   $3B
         STA   $41
         STX   $43
L1D2726  BRA   L1D2730
L1D2728  LDA   $39
         LDX   $3B
         STA   $41
         STX   $43
L1D2730  LDA   $45
         BNE   L1D2737
         BRL   L1D288E
L1D2737  PHY
         PHY
         PEA   $0000
         PEA   $1001
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $21
         PLX
         STX   $23
         LDA   $21
         ORA   $23
         BNE   L1D275D
         PEA   $0015
         JSL   L122130
         BRL   L1D29CD
L1D275D  PEI   $23
         PEI   $21
         JSL   L0718BF
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $29
         STX   $2B
         STZ   $31
         STZ   $33
         LDA   $41
         LDX   $43
         STA   $3D
         STX   $3F
L1D277D  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1D2789
         BRL   L1D2878
L1D2789  PHY
         PHY
         PEI   $4F
         PEI   $2B
         PEI   $29
         PEA   $0000
         PEA   $1000
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $35
         PLX
         STX   $37
         LDAL  L05565D
         STA   $4B
         LDA   $4B
         BEQ   L1D27B1
         LDA   #$0001
L1D27B1  PHA
         LDX   #$0000
         LDA   #$004C
         CMP   $4B
         BEQ   L1D27BD
         INX
L1D27BD  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1D27E5
         PEA   $0016
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   $4B
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEI   $4B
         JSL   L12205A
         BRL   L1D2878
L1D27E5  LDA   $31
         LDX   $33
         PEI   $37
         PEI   $35
         JSL   L150F53
         STA   $31
         STX   $33
         LDA   $29
         LDX   $2B
         PEI   $37
         PEI   $35
         JSL   L150F53
         TAY
         BNE   L1D2805
         DEX
L1D2805  DEC
         STA   $25
         STX   $27
         LDA   #$00FF
         AND   [$25]
         CMP   $4D
         BNE   L1D2815
         BRA   L1D286D
L1D2815  PEI   $23
         PEI   $21
         JSL   L1516B7
         PHY
         PEI   $23
         PEI   $21
         LDA   $31
         LDX   $33
         CLC
         ADC   #$1000
         BCC   L1D282D
         INX
L1D282D  CLC
         ADC   #$0002
         BCC   L1D2834
         INX
L1D2834  PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L1D2847
         PEA   $0015
         JSL   L122130
         BRA   L1D2878
L1D2847  PEI   $23
         PEI   $21
         JSL   L150BB8
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         PEI   $33
         PEI   $31
         JSL   L150F53
         STA   $29
         STX   $2B
         LDA   #$004C
         CMP   $4B
         BEQ   L1D286D
         BRL   L1D277D
L1D286D  LDA   $31
         LDX   $33
         STA   $35
         STX   $37
         BRL   L1D29B0
L1D2878  PEI   $23
         PEI   $21
         JSL   L07185A
         JSL   L0E0C52
         JSL   L0E0074
         BRL   L1D29CD
         BRL   L1D29CD
L1D288E  PHY
         PHY
         LDA   $41
         LDX   $43
         INC
         BNE   L1D2898
         INX
L1D2898  PHX
         PHA
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $21
         PLX
         STX   $23
         LDA   $21
         ORA   $23
         BNE   L1D28B8
         PEA   $0015
         JSL   L122130
         BRL   L1D29CD
L1D28B8  PEI   $23
         PEI   $21
         JSL   L0718BF
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $29
         STX   $2B
         STZ   $31
         STZ   $33
         LDA   $41
         LDX   $43
         STA   $3D
         STX   $3F
L1D28D8  PHY
         PHY
         PEI   $4F
         PEI   $2B
         PEI   $29
         PEI   $43
         PEI   $41
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $35
         PLX
         STX   $37
         LDAL  L05565D
         STA   $4B
         LDA   $4B
         BEQ   L1D28FE
         LDA   #$0001
L1D28FE  PHA
         LDX   #$0000
         LDA   #$004C
         CMP   $4B
         BEQ   L1D290A
         INX
L1D290A  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1D2932
         PEA   $0016
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   $4B
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEI   $4B
         JSL   L12205A
         BRL   L1D2878
L1D2932  LDA   $31
         LDX   $33
         PEI   $37
         PEI   $35
         JSL   L150F53
         STA   $31
         STX   $33
         PEI   $43
         PEI   $41
         LDA   $35
         LDX   $37
         JSL   L1512A5
         STA   $41
         STX   $43
         LDA   $29
         LDX   $2B
         PEI   $37
         PEI   $35
         JSL   L150F53
         STA   $29
         STX   $2B
         PHY
         PHY
         PEI   $4F
         JSL   L075B7B
         PHY
         PHY
         PEI   $4F
         JSL   L075BBA
         PLA
         PLX
         JSL   L033477
         BNE   L1D297C
         BRA   L1D29B0
L1D297C  LDA   $3D
         LDX   $3F
         CMP   $31
         BNE   L1D2986
         CPX   $33
L1D2986  BEQ   L1D298D
         LDA   #$0000
         BRA   L1D2990
L1D298D  LDA   #$0001
L1D2990  PHA
         LDX   #$0000
         LDA   #$004C
         CMP   $4B
         BNE   L1D299C
         INX
L1D299C  TXA
         ORA   $01,S
         PLX
         PHA
         PHY
         JSL   L07005C
         PLA
         ORA   $01,S
         PLX
         LSR
         BCS   L1D29B0
         BRL   L1D28D8
L1D29B0  LDY   #$0002
         LDA   [$21],Y
         PHA
         LDA   [$21]
         PHA
         PEI   $37
         PEI   $35
         JSL   L1D02C4
         PEI   $23
         PEI   $21
         JSL   L0E0CFE
         JSL   L0E0074
L1D29CD  TSC
         CLC
         ADC   #$0054
         TCS
         PLD
         RTL

L1D29D5  ENT
         PHD
         TSC
         CLC
         ADC   #$FCF8
         TCS
         ADC   #$0211
         TCD
         JSL   L0B2AC6
         STZ   $1D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1D
         PHA
         JSL   L0E06AC
         PEA   $0000
         TDC
         CLC
         ADC   #$FE1D
         PHA
         JSL   L0E06AC
         TDC
         CLC
         ADC   #$007B
         PEA   $0000
         PHA
         JSL   L0940E5
         JSL   L09999B
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FE1D
         PHA
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDA   $D7
         ORA   $D9
         BNE   L1D2A3E
         PEA   $0001
         JSL   L0B0B7A
         LDA   #$0040
         STA   $1D
         BRL   L1D2AD6
L1D2A3E  JSL   L0903F2
         PEA   $0001
         PEA   $0001
         JSL   L090000
         PHY
         PHY
         PEI   $D9
         PEI   $D7
         JSL   L078841
         PLA
         STA   $77
         PLX
         STX   $79
         LDA   #$0002
         STA   $1F
         LDA   #$0001
         LDX   #$0000
         STA   $25
         STX   $27
         LDA   #$0006
         STA   $4B
         PHY
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L1D2A84
         BRA   L1D2AD6
L1D2A84  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF1D
         PHA
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L1D2A9C
         CPX   L0553BB
L1D2A9C  BEQ   L1D2AA3
         LDA   #$0000
         BRA   L1D2AA6
L1D2AA3  LDA   #$0001
L1D2AA6  PHA
         JSL   L098B31
         PLA
         STA   $1D
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0B0D0A
         LDA   #$0004
         STA   $DB
         PHY
         TDC
         CLC
         ADC   #$007B
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L1D2AD6
         JSL   L072314
L1D2AD6  PEI   $D9
         PEI   $D7
         JSL   L07185A
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L1D2AEC
         CPX   L0553BB
L1D2AEC  BEQ   L1D2B21
         LDA   $1D
         BEQ   L1D2B21
         PEA   ^L04037A
         PEA   L04037A
         PEA   $0000
         TDC
         CLC
         ADC   #$FDEF
         PHA
         LDA   $1D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE03
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L0B2D94
L1D2B21  TSC
         CLC
         ADC   #$0308
         TCS
         PLD
         RTL

L1D2B29  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$005D
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2B3C
         INX
L1D2B3C  PHX
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         LDA   #$00F1
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2B56
         INX
L1D2B56  STA   $01
         STX   $03
         PHY
         LDA   #$005D
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2B66
         INX
L1D2B66  PHX
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   [$01]
         LDA   #$005D
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2B7D
         INX
L1D2B7D  CLC
         ADC   #$0002
         BCC   L1D2B84
         INX
L1D2B84  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         LDY   #$00ED
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
         LDA   #$005D
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2BA5
         INX
L1D2BA5  CLC
         ADC   #$000A
         BCC   L1D2BAC
         INX
L1D2BAC  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         LDY   #$00E9
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
         LDA   #$005D
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1D2BCD
         INX
L1D2BCD  CLC
         ADC   #$0006
         BCC   L1D2BD4
         INX
L1D2BD4  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         LDY   #$00E5
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
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

L1D2BFB  ENT
         PHD
         TSC
         CLC
         ADC   #$FD0C
         TCS
         ADC   #$01FD
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0009
         BNE   L1D2C54
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         LDA   #$00FF
         ANDL  L050C32
         BNE   L1D2C2A
         JSL   L0952F7
         BRA   L1D2C51
L1D2C2A  PEA   $0040
         PEA   $0000
         TDC
         CLC
         ADC   #$FF03
         PHA
         PEA   $0073
         JSL   L0B127A
         PEA   $0000
         TDC
         CLC
         ADC   #$FE03
         PHA
         PEA   $0074
         JSL   L0B127A
         JSL   L0B0897
L1D2C51  BRL   L1D2FB1
L1D2C54  PHY
         JSL   L0314F6
         PLA
         CMP   #$0008
         BNE   L1D2C82
         PEA   $0000
         PHD
         JSL   L1D2B29
         LDA   L055027
         LDX   L055029
         CMP   $E9
         BNE   L1D2C73
         CPX   $EB
L1D2C73  BNE   L1D2C7F
         PEI   $EF
         PEI   $ED
         PEI   $F1
         JSL   L099243
L1D2C7F  BRL   L1D2FB1
L1D2C82  PHY
         JSL   L0314F6
         PLA
         CMP   #$0006
         BEQ   L1D2C92
         LDA   #$0000
         BRA   L1D2C95
L1D2C92  LDA   #$0001
L1D2C95  STA   $E3
         LDA   $E3
         BEQ   L1D2CA5
         PEA   $0000
         PHD
         JSL   L1D2B29
         BRA   L1D2CA9
L1D2CA5  JSL   L0E0000
L1D2CA9  LDA   #$0001
         STA   $8D
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L1D2CD1
         TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0022
         PEA   $0004
         JSL   L0E0656
         BRA   L1D2CD5
L1D2CD1  JSL   L0E0000
L1D2CD5  PHY
         JSL   L0314F6
         PLA
         STA   $C1
         JSL   L0E0000
         LDA   $E3
         BEQ   L1D2D12
         STZ   $2B
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         PEA   $0030
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L0E087F
         BRA   L1D2D23
L1D2D12  PEA   $0000
         TDC
         CLC
         ADC   #$FF03
         PHA
         JSL   L094153
         JSL   L0E0F0F
L1D2D23  TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         JSL   L0D0A88
         JSL   L0E0000
         PEI   $D9
         PEI   $D7
         LDA   $DF
         LDX   $E1
         JSL   L1512A5
         STA   $C3
         STX   $C5
         PEI   $DD
         PEI   $DB
         LDA   $DF
         LDX   $E1
         JSL   L1512A5
         STA   $C7
         STX   $C9
         LDX   #$0000
         LDA   $D1
         BMI   L1D2D96
         ORA   $CF
         BEQ   L1D2D96
         INX
L1D2D96  TXA
         AND   $E3
         BNE   L1D2D9E
         BRL   L1D2F19
L1D2D9E  LDA   L055129
         LDX   L05512B
         CMP   $ED
         BNE   L1D2DAA
         CPX   $EF
L1D2DAA  BNE   L1D2DCB
         LDAL  L05328D
         CMP   $F1
         BNE   L1D2DCB
         LDA   L055125
         LDX   L055127
         CMP   L055027
         BNE   L1D2DC2
         CPX   L055029
L1D2DC2  BNE   L1D2DCB
         PEA   $0000
         JSL   L09091E
L1D2DCB  LDA   $F1
         STA   $BF
         LDA   $E9
         LDX   $EB
         CMP   $ED
         BNE   L1D2DD9
         CPX   $EF
L1D2DD9  BNE   L1D2DE3
         LDA   $BF
         EOR   #$FFFF
         INC
         STA   $BF
L1D2DE3  LDA   L05501F
         LDX   L055021
         CMP   L055129
         BNE   L1D2DF1
         CPX   L05512B
L1D2DF1  BEQ   L1D2DF8
         LDA   #$0000
         BRA   L1D2DFB
L1D2DF8  LDA   #$0001
L1D2DFB  BEQ   L1D2E0D
         PHA
         LDA   #$4000
         ANDL  L05328F
         BEQ   L1D2E0A
         LDA   #$0001
L1D2E0A  AND   $01,S
         PLX
L1D2E0D  STA   $AF
         PHY
         PHY
         PEI   $EB
         PEI   $E9
         PEI   $E7
         PEI   $E5
         PEI   $BF
         PEI   $AF
         JSL   L07AEBB
         PLA
         STA   $BB
         PLX
         STX   $BD
         LDA   $BB
         ORA   $BD
         BNE   L1D2E37
         PEA   $007F
         JSL   L0B0B7A
         BRL   L1D2F19
L1D2E37  PHY
         PHY
         LDY   #$0002
         LDA   [$BB],Y
         PHA
         LDA   [$BB]
         PHA
         JSL   L071C98
         PLA
         STA   $B7
         PLX
         STX   $B9
         PHY
         PEI   $BD
         PEI   $BB
         LDA   $B7
         LDX   $B9
         PEI   $D1
         PEI   $CF
         JSL   L150F53
         INC
         BNE   L1D2E61
         INX
L1D2E61  PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L1D2E6E
         BRL   L1D2F0A
L1D2E6E  LDY   #$0002
         LDA   [$BB],Y
         TAX
         LDA   [$BB]
         PEI   $B9
         PEI   $B7
         JSL   L150F53
         STA   $B3
         STX   $B5
         LDA   $CF
         STA   $07
         LDA   $07
         SEC
         SBC   #$0001
         BVS   L1D2E91
         EOR   #$8000
L1D2E91  BPL   L1D2EAE
         LDA   #$0001
         STA   $B1
L1D2E98  LDA   $B1
         DEC
         TAY
         SEP   #$20
         LDA   #$0D
         STA   [$B3],Y
         REP   #$20
         LDA   $B1
         CMP   $07
         BEQ   L1D2EAE
         INC   $B1
         BRA   L1D2E98
L1D2EAE  LDA   $B3
         LDX   $B5
         PEI   $D1
         PEI   $CF
         JSL   L150F53
         STA   $B3
         STX   $B5
         SEP   #$20
         LDA   #$00
         STA   [$B3]
         REP   #$20
         PHY
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         PEI   $BD
         PEI   $BB
         JSL   L0B2E1F
         PLA
         LSR
         BCC   L1D2F08
         LDA   $B7
         LDX   $B9
         CMP   $C3
         BNE   L1D2EE6
         CPX   $C5
L1D2EE6  BNE   L1D2EF8
         LDA   $C3
         LDX   $C5
         PEI   $D1
         PEI   $CF
         JSL   L150F53
         STA   $C3
         STX   $C5
L1D2EF8  LDA   $C7
         LDX   $C9
         PEI   $D1
         PEI   $CF
         JSL   L150F53
         STA   $C7
         STX   $C9
L1D2F08  BRA   L1D2F11
L1D2F0A  PEA   $002D
         JSL   L0B0B7A
L1D2F11  PEI   $BD
         PEI   $BB
         JSL   L07185A
L1D2F19  LDA   $C1
         DEC
         BNE   L1D2F26
         LDA   $C3
         LDX   $C5
         STA   $C7
         STX   $C9
L1D2F26  LDA   $C1
         DEC
         DEC
         BNE   L1D2F34
         LDA   $C7
         LDX   $C9
         STA   $C3
         STX   $C5
L1D2F34  LDA   L05511F
         AND   $E3
         BEQ   L1D2F8D
         LDA   L055129
         LDX   L05512B
         CMP   $ED
         BNE   L1D2F47
         CPX   $EF
L1D2F47  BNE   L1D2F8D
         LDAL  L05328D
         CMP   $F1
         BNE   L1D2F8D
         LDA   L055121
         LDX   L055123
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $03
         STX   $05
         LDY   #$0070
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         CMP   $C3
         BNE   L1D2F77
         CPX   $C5
L1D2F77  BNE   L1D2F8D
         LDY   #$0074
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         CMP   $C7
         BNE   L1D2F89
         CPX   $C9
L1D2F89  BNE   L1D2F8D
         BRA   L1D2FB1
L1D2F8D  LDA   $E3
         BEQ   L1D2FA5
         PEI   $EF
         PEI   $ED
         PEI   $F1
         PEI   $C5
         PEI   $C3
         PEI   $C9
         PEI   $C7
         JSL   L09934D
         BRA   L1D2FB1
L1D2FA5  PEI   $C5
         PEI   $C3
         PEI   $C9
         PEI   $C7
         JSL   L0991A9
L1D2FB1  TSC
         CLC
         ADC   #$02F4
         TCS
         PLD
         RTL

L1D2FB9  ENT
         PHD
         TSC
         CLC
         ADC   #$FD38
         TCS
         ADC   #$01D1
         TCD
         PEA   $0001
         JSL   L09091E
         STZ   $EF
         STZ   $F1
         STZ   $E7
         STZ   $E9
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0007
         BNE   L1D2FEE
         JSL   L0E0000
         BRA   L1D3000
L1D2FEE  JSL   L0E0000
         JSL   L0E0000
         PEA   $0023
         JSL   L0B0B7A
         BRL   L1D387A
L1D3000  LDA   L055051
         BEQ   L1D3014
         JSL   L0E0000
         JSL   L0E0000
         JSL   L0903A6
         BRL   L1D387A
L1D3014  STZ   $BD
         STZ   $BB
         STZ   $B9
         STZ   $AB
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0004
         BMI   L1D3050
         CMP   #$0003
         BPL   L1D3050
         SEC
         SBC   #$0000
         BEQ   L1D303B
         DEC
         BEQ   L1D3042
         DEC
         BEQ   L1D3049
         BRA   L1D3050
L1D303B  LDA   #$0001
         STA   $BB
         BRA   L1D3050
L1D3042  LDA   #$0001
         STA   $BD
         BRA   L1D3050
L1D3049  LDA   #$0001
         STA   $B9
         BRA   L1D3050
L1D3050  LDA   $B9
         ORA   $BB
         EOR   #$0001
         STA   $BF
         JSL   L0E0000
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BEQ   L1D306D
         LDA   #$0000
         BRA   L1D3070
L1D306D  LDA   #$0001
L1D3070  STA   $C1
         JSL   L0E0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FF43
         PHA
         JSL   L0B2A02
         JSL   L15059E
         PHY
         PHY
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0008
         BCC   L1D30A5
         INX
L1D30A5  PHX
         PHA
         LDA   L055019
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDAL  L05565D
         BEQ   L1D30D2
         STZ   $EF
         STZ   $F1
         PEA   $0024
         JSL   L0B0B7A
         BRL   L1D387A
L1D30D2  LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EB
         STX   $ED
         LDA   $EB
         LDX   $ED
         STA   $DB
         STX   $DD
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FE3F
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE3F
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1D3110
         EOR   #$8000
L1D3110  BMI   L1D3115
         BRL   L1D31DC
L1D3115  LDA   #$0001
         LDX   #$0000
         STA   $D7
         STX   $D9
L1D311F  LDA   $AB
         INC
         AND   #$0003
         STA   $AB
         LDA   $AB
         BNE   L1D312F
         JSL   L072328
L1D312F  PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $D9
         PEI   $D7
         PEA   $0000
         TDC
         CLC
         ADC   #$FF47
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCS   L1D3156
         PEA   $8759
         JSL   L07272E
L1D3156  LDA   $DB
         LDX   $DD
         STA   $F3
         STX   $F5
         PHY
         PHY
         LDX   #$FF47
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L0742B3
         PLA
         STA   [$F3]
         PLA
         LDY   #$0002
         STA   [$F3],Y
         LDA   $C1
         BEQ   L1D31A5
         LDA   #$0004
         CLC
         ADC   $DB
         LDX   $DD
         BCC   L1D3185
         INX
L1D3185  STA   $F3
         STX   $F5
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDA   $D7
         LDX   $D9
         JSL   L1512A5
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         BRA   L1D31B3
L1D31A5  LDA   $D7
         LDX   $D9
         LDY   #$0004
         STA   [$DB],Y
         INY
         INY
         TXA
         STA   [$DB],Y
L1D31B3  LDA   $DB
         LDX   $DD
         CLC
         ADC   #$0008
         BCC   L1D31BE
         INX
L1D31BE  STA   $DB
         STX   $DD
         LDX   #$FE3F
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $D7
         BNE   L1D31D1
         CPX   $D9
L1D31D1  BEQ   L1D31DC
         INC   $D7
         BNE   L1D31D9
         INC   $D9
L1D31D9  BRL   L1D311F
L1D31DC  PEI   $ED
         PEI   $EB
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         PEA   ^L0B8060
         PEA   L0B8060
         JSL   L1D0315
         LDA   $BB
         ORA   $BF
         BEQ   L1D323B
         LDA   #$2800
         LDX   #$0000
         STA   $CF
         STX   $D1
         PHY
         PHY
         PEI   $D1
         PEI   $CF
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L1D3228
         PEA   $0024
         JSL   L0B0B7A
         BRL   L1D387A
L1D3228  STZ   $DF
         STZ   $E1
         LDA   $CF
         LDX   $D1
         SEC
         SBC   #$0100
         BCS   L1D3237
         DEX
L1D3237  STA   $E3
         STX   $E5
L1D323B  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0940E5
         LDAL  L053AD3
         TAX
         LDAL  L053AD1
         STA   $C7
         STX   $C9
         LDA   $EB
         LDX   $ED
         STA   $DB
         STX   $DD
         LDA   #$0002
         STA   $27
         LDA   #$0006
         STA   $53
         LDA   L055039
         LDX   L05503B
         STA   $7F
         STX   $81
         LDA   #$0001
         STA   $AD
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FE3B
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE3B
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1D32A0
         EOR   #$8000
L1D32A0  BMI   L1D32A5
         BRL   L1D34B7
L1D32A5  LDA   #$0001
         LDX   #$0000
         STA   $D7
         STX   $D9
L1D32AF  LDY   #$0006
         LDA   [$DB],Y
         TAX
         DEY
         DEY
         LDA   [$DB],Y
         STA   $2D
         STX   $2F
         LDA   $C1
         BEQ   L1D32D7
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDA   $2D
         LDX   $2F
         JSL   L1512A5
         STA   $2D
         STX   $2F
L1D32D7  PHY
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $B3
         LDA   $AB
         INC
         AND   #$0003
         STA   $AB
         LDA   $AB
         BNE   L1D32F8
         JSL   L072328
L1D32F8  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1D3304
         BRL   L1D387A
L1D3304  LDA   L05539D
         DEC
         STA   L05539D
         STZ   L0553A5
         PEA   $0000
         TDC
         CLC
         ADC   #$FF43
         PHA
         JSL   L0B2965
         PHY
         PEA   $0000
         JSL   L0B7A56
         PLA
         LSR
         BCC   L1D332B
         STZ   $AD
         BRA   L1D332F
L1D332B  JSL   L0E0C52
L1D332F  STZ   L0553A5
         LDA   L05539D
         INC
         STA   L05539D
         LDA   $B9
         BEQ   L1D336A
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         JSL   L0E06AC
         LDA   $DB
         LDX   $DD
         STA   $F3
         STX   $F5
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         JSL   L0B5161
         PLA
         STA   [$F3]
         PLA
         LDY   #$0002
         STA   [$F3],Y
L1D336A  LDA   $BB
         ORA   $BF
         BNE   L1D3373
         BRL   L1D347C
L1D3373  PEI   $E1
         PEI   $DF
         LDA   $E3
         LDX   $E5
         JSL   L033477
         BEQ   L1D33C1
         BVS   L1D3386
         EOR   #$8000
L1D3386  BPL   L1D33C1
         LDA   $CF
         LDX   $D1
         CLC
         ADC   #$2800
         BCC   L1D3393
         INX
L1D3393  STA   $CF
         STX   $D1
         LDA   $CF
         LDX   $D1
         SEC
         SBC   #$0100
         BCS   L1D33A2
         DEX
L1D33A2  STA   $E3
         STX   $E5
         PHY
         PEI   $E9
         PEI   $E7
         PEI   $D1
         PEI   $CF
         JSL   L078A05
         PLA
         LSR
         BCS   L1D33C1
         PEA   $0024
         JSL   L0B0B7A
         BRL   L1D387A
L1D33C1  LDA   $DF
         LDX   $E1
         STA   [$DB]
         TXA
         LDY   #$0002
         STA   [$DB],Y
         LDA   $BB
         BEQ   L1D3427
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         PEI   $E1
         PEI   $DF
         JSL   L150F53
         STA   $AF
         STX   $B1
         PHY
         JSL   L0319D4
         PLA
         LSR
         BCC   L1D3401
         PEI   $B1
         PEI   $AF
         PEA   $0000
         PEA   $000A
         PEA   $0011
         JSL   L0E0656
         BRA   L1D3416
L1D3401  JSL   L0E0000
         PEI   $B1
         PEI   $AF
         PEA   ^L040396
         PEA   L040396
         PEA   $000A
         JSL   L0313BE
L1D3416  LDA   $DF
         LDX   $E1
         CLC
         ADC   #$000A
         BCC   L1D3421
         INX
L1D3421  STA   $DF
         STX   $E1
         BRA   L1D347C
L1D3427  PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         JSL   L0E06AC
         LDA   #$00FF
         LDX   #$FE43
         AND   $00,X
         STA   $D5
         PEA   $0000
         TDC
         CLC
         ADC   #$FE43
         PHA
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         PEI   $E1
         PEI   $DF
         JSL   L150F53
         PHX
         PHA
         LDA   $D5
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEI   $E1
         PEI   $DF
         LDA   $D5
         JSL   L150488
         JSL   L150F53
         INC
         BNE   L1D3478
         INX
L1D3478  STA   $DF
         STX   $E1
L1D347C  PHY
         PHY
         PEI   $C9
         PEI   $C7
         PEI   $D9
         PEI   $D7
         JSL   L07B8EA
         JSL   L077B28
         LDA   $DB
         LDX   $DD
         CLC
         ADC   #$0008
         BCC   L1D3499
         INX
L1D3499  STA   $DB
         STX   $DD
         LDX   #$FE3B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $D7
         BNE   L1D34AC
         CPX   $D9
L1D34AC  BEQ   L1D34B7
         INC   $D7
         BNE   L1D34B4
         INC   $D9
L1D34B4  BRL   L1D32AF
L1D34B7  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         JSL   L0953DD
         PLA
         STA   $B3
         LDA   $AD
         BEQ   L1D34F7
         PEA   $0000
         TDC
         CLC
         ADC   #$FF43
         PHA
         JSL   L0B2965
         JSL   L0E10F4
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEA   $0068
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0841
         BRL   L1D387A
L1D34F7  LDA   $BB
         ORA   $BF
         BNE   L1D3500
         BRL   L1D3593
L1D3500  PEI   $E9
         PEI   $E7
         JSL   L0718BF
         LDA   $EB
         LDX   $ED
         STA   $DB
         STX   $DD
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FE37
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE37
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1D353A
         EOR   #$8000
L1D353A  BPL   L1D3593
         LDA   #$0001
         LDX   #$0000
         STA   $D7
         STX   $D9
L1D3546  LDA   $DB
         LDX   $DD
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$DB],Y
         PHA
         LDA   [$DB]
         PHA
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         JSL   L150F53
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         LDA   $DB
         LDX   $DD
         CLC
         ADC   #$0008
         BCC   L1D3576
         INX
L1D3576  STA   $DB
         STX   $DD
         LDX   #$FE37
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $D7
         BNE   L1D3589
         CPX   $D9
L1D3589  BEQ   L1D3593
         INC   $D7
         BNE   L1D3591
         INC   $D9
L1D3591  BRA   L1D3546
L1D3593  LDA   $BB
         BEQ   L1D35B1
         PEI   $ED
         PEI   $EB
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         PEA   ^L0B802D
         PEA   L0B802D
         JSL   L1D0315
         BRA   L1D35F3
L1D35B1  LDA   $B9
         BEQ   L1D35CF
         PEI   $ED
         PEI   $EB
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         PEA   ^L0B8060
         PEA   L0B8060
         JSL   L1D0315
         BRA   L1D35F3
L1D35CF  PEI   $ED
         PEI   $EB
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         PEA   ^L0B7FC4
         PEA   L0B7FC4
         JSL   L1D0315
         PEI   $E9
         PEI   $E7
         JSL   L07185A
         STZ   $E7
         STZ   $E9
L1D35F3  PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         TDC
         CLC
         ADC   #$0083
         PEA   $0000
         PHA
         JSL   L07A852
         PLA
         LSR
         BCS   L1D3616
         PEA   $976F
         JSL   L07272E
L1D3616  PHY
         PHY
         PEI   $93
         PEI   $9B
         PEI   $9F
         PEI   $A1
         JSL   L079BEC
         PLA
         STA   $C3
         PLX
         STX   $C5
         LDA   $C1
         BNE   L1D3631
         BRL   L1D372A
L1D3631  PEI   $ED
         PEI   $EB
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $DB
         STX   $DD
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FE33
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE33
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1D367C
         EOR   #$8000
L1D367C  BMI   L1D3681
         BRL   L1D3727
L1D3681  LDA   #$0001
         LDX   #$0000
         STA   $D7
         STX   $D9
L1D368B  LDA   $AB
         INC
         AND   #$0003
         STA   $AB
         LDA   $AB
         BNE   L1D369B
         JSL   L072328
L1D369B  LDA   $DB
         LDX   $DD
         SEC
         SBC   #$0008
         BCS   L1D36A6
         DEX
L1D36A6  STA   $DB
         STX   $DD
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDY   #$0006
         LDA   [$DB],Y
         TAX
         DEY
         DEY
         LDA   [$DB],Y
         JSL   L1512A5
         STA   $B5
         STX   $B7
         PHY
         PEI   $C9
         PEI   $C7
         PEI   $B7
         PEI   $B5
         PEA   $0000
         TDC
         CLC
         ADC   #$FF47
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCS   L1D36E7
         PEA   $60A2
         JSL   L07272E
L1D36E7  PHY
         PEI   $C5
         PEI   $C3
         PEA   $7FFF
         PEA   $FFFF
         PEA   $0000
         TDC
         CLC
         ADC   #$FF47
         PHA
         JSL   L07B2EC
         PLA
         LSR
         BCS   L1D370D
         PEA   $0061
         JSL   L0B0B7A
         BRL   L1D387A
L1D370D  LDX   #$FE33
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $D7
         BNE   L1D371C
         CPX   $D9
L1D371C  BEQ   L1D3727
         INC   $D7
         BNE   L1D3724
         INC   $D9
L1D3724  BRL   L1D368B
L1D3727  BRL   L1D37F2
L1D372A  LDA   $EB
         LDX   $ED
         STA   $DB
         STX   $DD
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FE2F
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FE2F
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1D375C
         EOR   #$8000
L1D375C  BMI   L1D3761
         BRL   L1D37F2
L1D3761  LDA   #$0001
         LDX   #$0000
         STA   $D7
         STX   $D9
L1D376B  LDA   $AB
         INC
         AND   #$0003
         STA   $AB
         LDA   $AB
         BNE   L1D377B
         JSL   L072328
L1D377B  PHY
         PEI   $C9
         PEI   $C7
         LDY   #$0006
         LDA   [$DB],Y
         PHA
         DEY
         DEY
         LDA   [$DB],Y
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF47
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCS   L1D37A3
         PEA   $5BBA
         JSL   L07272E
L1D37A3  PHY
         PEI   $C5
         PEI   $C3
         PEA   $7FFF
         PEA   $FFFF
         PEA   $0000
         TDC
         CLC
         ADC   #$FF47
         PHA
         JSL   L07B2EC
         PLA
         LSR
         BCS   L1D37C9
         PEA   $0061
         JSL   L0B0B7A
         BRL   L1D387A
L1D37C9  LDA   $DB
         LDX   $DD
         CLC
         ADC   #$0008
         BCC   L1D37D4
         INX
L1D37D4  STA   $DB
         STX   $DD
         LDX   #$FE2F
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $D7
         BNE   L1D37E7
         CPX   $D9
L1D37E7  BEQ   L1D37F2
         INC   $D7
         BNE   L1D37EF
         INC   $D9
L1D37EF  BRL   L1D376B
L1D37F2  LDAL  L053AC3
         PHA
         LDAL  L053AC1
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BEQ   L1D381A
         BVS   L1D380D
         EOR   #$8000
L1D380D  BPL   L1D381A
         LDA   #$FBFF
         ANDL  L053AE9
         STAL  L053AE9
L1D381A  PHY
         PEI   $C5
         PEI   $C3
         PEA   $0000
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$FF47
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCS   L1D383D
         PEA   $931B
         JSL   L07272E
L1D383D  LDA   $C3
         LDX   $C5
         STAL  L053AD1
         TXA
         STAL  L053AD3
         LDX   #$FF47
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STAL  L053ACD
         TXA
         STAL  L053ACF
         JSL   L078CA4
         STZ   L055023
         STZ   L055025
         PHY
         PEI   $C9
         PEI   $C7
         JSL   L07A1F7
         PLA
         LSR
         BCS   L1D387A
         PEA   $1D7B
         JSL   L07272E
L1D387A  PEI   $F1
         PEI   $EF
         PEI   $E9
         PEI   $E7
         JSL   L071825
L1D3886  LDAL  L051BDE
         DEC
         DEC
         BEQ   L1D3894
         JSL   L0B0000
         BRA   L1D3886
L1D3894  PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968FC
         TSC
         CLC
         ADC   #$02C8
         TCS
         PLD
         RTL

L1D38AF  ENT
         PHD
         TSC
         CLC
         ADC   #$FECA
         TCS
         ADC   #$003F
         TCD
         JSL   L0B2AC6
         STZ   $E1
         STZ   $E3
         STZ   $D3
         STZ   $D5
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BEQ   L1D38D6
         LDA   #$0000
         BRA   L1D38D9
L1D38D6  LDA   #$0001
L1D38D9  STA   $D7
         LDA   $D7
         BEQ   L1D3914
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $E1
         PLX
         STX   $E3
         PEI   $E3
         PEI   $E1
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BEQ   L1D3910
         BVS   L1D3900
         EOR   #$8000
L1D3900  BPL   L1D3910
         LDX   $E3
         LDA   $E1
         BNE   L1D3909
         DEX
L1D3909  DEC
         STA   $E1
         STX   $E3
         BRA   L1D3914
L1D3910  STZ   $E1
         STZ   $E3
L1D3914  PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         JSL   L0E06AC
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         PEA   $0001
         PEA   $0000
         JSL   L0B16ED
         PLA
         STA   $F1
         LDA   $F1
         BNE   L1D3943
         JSL   L0E0000
         BRL   L1D3B11
L1D3943  JSL   L031B09
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $CF
         PLX
         STX   $D1
         PEI   $D1
         PEI   $CF
         JSL   L0718BF
         PHY
         PHY
         LDY   #$0002
         LDA   [$CF],Y
         PHA
         LDA   [$CF]
         PHA
         JSL   L071C98
         PLA
         STA   $E9
         PLX
         STX   $EB
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L0B16ED
         PLA
         STA   $EF
         LDA   $EF
         DEC
         PEA   $000A
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L05106C
         LDX   #^L05106C
         BCC   L1D399D
         INX
L1D399D  CLC
         ADC   #$0008
         BCC   L1D39A4
         INX
L1D39A4  STA   $F3
         STX   $F5
         LDA   $D7
         EOR   #$0001
         STA   [$F3]
         LDA   $D7
         BNE   L1D39B6
         BRL   L1D3AC2
L1D39B6  PEI   $F1
         PEI   $E3
         PEI   $E1
         JSL   L075E14
         LDA   #$004D
         CMPL  L05565D
         BEQ   L1D39CC
         BRL   L1D3AC2
L1D39CC  PHY
         PHY
         PEI   $F1
         JSL   L075B7B
         PLA
         STA   $DD
         PLX
         STX   $DF
         PEI   $F1
         PEI   $E3
         PEI   $E1
         JSL   L075DD3
         PEI   $F1
         PEI   $DF
         PEI   $DD
         JSL   L075E14
         PEI   $E3
         PEI   $E1
         LDA   $DD
         LDX   $DF
         JSL   L1512A5
         STA   $D9
         STX   $DB
         PHY
         PHY
         PEA   $0000
         PEA   $0200
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $D3
         PLX
         STX   $D5
         PEI   $D5
         PEI   $D3
         JSL   L150BB8
         LDY   #$0002
         LDA   [$D3],Y
         PHA
         LDA   [$D3]
         PHA
         PEA   $0000
         PEA   $0200
         JSL   L071EC5
         PEI   $DB
         PEI   $D9
         PEA   $0000
         PEA   $0200
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         LDX   #$FFC1
         STA   $00,X
         LDX   #$FFC1
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1D3A54
         EOR   #$8000
L1D3A54  BPL   L1D3A8E
         LDA   #$0001
         STA   $ED
L1D3A5B  PHY
         PHY
         PEI   $F1
         LDY   #$0002
         LDA   [$D3],Y
         PHA
         LDA   [$D3]
         PHA
         PEA   $0000
         PEA   $0200
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDAL  L05565D
         BNE   L1D3AE0
         LDA   $ED
         LDX   #$FFC1
         CMP   $00,X
         BEQ   L1D3A8E
         INC   $ED
         BRA   L1D3A5B
L1D3A8E  PHY
         PHY
         PEI   $F1
         LDY   #$0002
         LDA   [$D3],Y
         PHA
         LDA   [$D3]
         PHA
         PEI   $DB
         PEI   $D9
         PEA   $0000
         PEA   $0200
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         PHX
         PHA
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDAL  L05565D
         BNE   L1D3AE0
L1D3AC2  PHY
         PHY
         PEI   $F1
         LDY   #$0002
         LDA   [$CF],Y
         PHA
         LDA   [$CF]
         PHA
         PEI   $EB
         PEI   $E9
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $E5
         PLX
         STX   $E7
L1D3AE0  LDAL  L05565D
         BEQ   L1D3AFD
         PEA   $0016
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         LDAL  L05565D
         PHA
         JSL   L12205A
         BRA   L1D3B01
L1D3AFD  JSL   L0B2AC6
L1D3B01  PEI   $D1
         PEI   $CF
         JSL   L07185A
         PEI   $D5
         PEI   $D3
         JSL   L07185A
L1D3B11  TSC
         CLC
         ADC   #$0136
         TCS
         PLD
         RTL

L1D3B19  ENT
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
         JSL   L0C060F
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L1D3B40  ENT
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
         PEA   $0003
         JSL   L0C060F
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L1D3B67  ENT
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
         JSL   L0C060F
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L1D3B8E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L0C0881
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         JSL   L0E0CFE
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1D3BB0  ENT
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
         JSL   L0C09DB
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L1D3BD7  ENT
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
         PEA   $0003
         JSL   L0C09DB
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L1D3BFE  ENT
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
         JSL   L0C09DB
         JSL   L0E0F0F
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L1D3C25  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L0C0CE9
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         JSL   L0E0CFE
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1D3C47  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         PHY
         PEA   ^L0403EC
         PEA   L0403EC
         JSL   L0946A2
         PLA
         LSR
         BCC   L1D3C67
         LDA   #$0001
         STA   $0A
         BRA   L1D3C6E
L1D3C67  PEA   $002D
         JSL   L0B0B7A
L1D3C6E  PLY
         PLY
         PLD
         RTL

L1D3C72  ENT
         PHD
         TSC
         CLC
         ADC   #$FED8
         TCS
         ADC   #$0031
         TCD
         PHY
         PHY
         JSL   L150574
         LDX   #$FFEF
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         JSL   L0E0C52
L1D3C90  LDX   #$FFEF
         LDA   $00,X
         ORA   $02,X
         BNE   L1D3C9C
         BRL   L1D3D27
L1D3C9C  PHY
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L1606E8
         PLA
         LSR
         BCS   L1D3CB0
         BRA   L1D3D0C
L1D3CB0  PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCF
         PHA
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L160678
         PEA   $0020
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0E0EA8
         JSL   L100000
         PHY
         PHY
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L151699
         PLA
         PLX
         STX   $F3
         ORA   $F3
         BEQ   L1D3D0C
         PEA   ^L032E6A
         PEA   L032E6A
         JSL   L0E0F0F
         JSL   L100000
L1D3D0C  PHY
         PHY
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L151699
         LDX   #$FFEF
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         BRL   L1D3C90
L1D3D27  TSC
         CLC
         ADC   #$0128
         TCS
         PLD
         RTL

