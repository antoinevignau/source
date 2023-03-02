*
* HypercardGS
* segment: $14 BrowseOnly
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   BrowseOnly.l
         lst   off

*---------------------------------------

         use   BrowseOnly.E
         use   BrowseOnly.X

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

L140000  PHD
         TSC
         CLC
         ADC   #$FF38
         TCS
         TCD
         PHY
         JSL   L095FB4
         PLA
         LSR
         BCS   L14001B
         PEA   $0041
         JSL   L0727E0
         BRL   L1406B3
L14001B  LDA   L0550F3
         BEQ   L14002D
         PEA   ^L04022A
         PEA   L04022A
         JSL   L07010A
         BRL   L1406B3
L14002D  LDA   L055121
         ORA   L055123
         BEQ   L140047
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15106B
         STZ   L055121
         STZ   L055123
L140047  PHY
         PEI   $D2
         PEI   $D0
         PEI   $CE
         PEA   ^L05328B
         PEA   L05328B
         JSL   L07ABAE
         PLA
         LSR
         BCS   L140068
         STZ   L055121
         STZ   L055123
         STZ   L05511F
         BRL   L1406B3
L140068  LDA   $D0
         LDX   $D2
         STA   L055129
         STX   L05512B
         LDA   L055027
         LDX   L055029
         STA   L055125
         STX   L055127
         LDA   L05501F
         LDX   L055021
         CMP   $D0
         BNE   L14008A
         CPX   $D2
L14008A  BEQ   L140091
         LDA   #$0000
         BRA   L140094
L140091  LDA   #$0001
L140094  STA   $C1
         PEA   ^L05328B
         PEA   L05328B
         PEI   $C1
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         JSL   L083B58
         LDX   #$0000
         LDA   #$000F
         ANDL  L053299
         CMP   #$0007
         BNE   L1400BB
         INX
L1400BB  TXA
         STA   $C3
         LDAL  L05328D
         STA   $AF
         LDA   $C1
         BNE   L1400D0
         LDA   $AF
         EOR   #$FFFF
         INC
         STA   $AF
L1400D0  LDA   #$4000
         ANDL  L05328F
         BEQ   L1400DC
         LDA   #$0001
L1400DC  AND   $C1
         STA   $AD
         STZ   $9D
         STZ   $9F
         STZ   $A5
         STZ   $A7
         STZ   $A1
         STZ   $A3
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $A5
         PLX
         STX   $A7
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $A1
         PLX
         STX   $A3
         LDA   $A5
         ORA   $A7
         BEQ   L140138
         LDA   $A1
         ORA   $A3
         BEQ   L140138
         PHY
         PHY
         PEI   $A7
         PEI   $A5
         PEI   $A3
         PEI   $A1
         PEI   $AF
         PEI   $AD
         JSL   L07B038
         PLA
         STA   $9D
         PLX
         STX   $9F
L140138  LDA   $9D
         ORA   $9F
         BNE   L140148
         LDA   #L053251
         LDX   #^L053251
         STA   $9D
         STX   $9F
L140148  LDA   L0550F5
         LDX   L0550F7
         STA   $A9
         STX   $AB
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         JSL   L070669
         LDA   #$0001
         STA   L0550F1
         LDA   $A1
         ORA   $A3
         BEQ   L140183
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L140183  LDA   $A5
         ORA   $A7
         BEQ   L140198
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L140198  PEA   ^L053291
         PEA   L053291
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         JSL   L0808E0
         LDA   #$000F
         ANDL  L053299
         CMP   #$0004
         BNE   L1401C2
         LDA   $B7
         DEC
         DEC
         STA   $B7
         LDA   $B5
         DEC
         STA   $B5
L1401C2  TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         STZ   L055425
         LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L140212
         LDA   #$00FA
         SEC
         SBC   $B1
         STA   L055425
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0000
         LDA   L055425
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         PEA   $0000
         LDA   L055425
         PHA
         JSL   L1501AF
L140212  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0056
         JSL   L071EC5
         LDA   #$0017
         STA   $1D
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0000
         LDX   #$8500
         STA   $2B
         STX   $2D
         LDA   #$0080
         STA   $2F
         LDA   #$1400
         STA   $31
         LDA   #$0000
         LDX   #$E000
         STA   $37
         STX   $39
         LDA   $B9
         SEC
         SBC   $B1
         STA   $3B
         LDA   $B5
         SEC
         SBC   $BD
         STA   $3F
         LDAL  L0532AB
         STA   $47
         LDA   #$0001
         STA   $53
         LDA   #L053251
         LDX   #^L053251
         STA   $55
         STX   $57
         LDA   #$7530
         LDX   #$0000
         STA   $5D
         STX   $5F
         LDA   #L053271
         LDX   #^L053271
         STA   $69
         STX   $6B
         LDA   #$0004
         STA   $6D
         LDA   $C3
         BEQ   L1402AB
         LDA   #$FFFF
         TAX
         STA   $43
         STX   $45
         BRA   L1402C1
L1402AB  PHY
         PHY
         PEI   $39
         PEI   $37
         PEA   $0800
         PEA   $0000
         JSL   L150241
         PLA
         STA   $37
         PLX
         STX   $39
L1402C1  LDA   #$00FF
         ANDL  L0532AD
         STA   $8F
         PEA   $000F
         LDA   #$00FF
         ANDL  L05329F
         STA   $C5
         PLA
         SEC
         SBC   $C5
         STA   $8D
         PEA   ^L053271
         PEA   L053271
         PEA   $0000
         PEA   $001A
         JSL   L071EC5
         PHY
         PEI   $8D
         JSL   L081A92
         PLA
         STAL  L053271
         PHY
         PEI   $8F
         JSL   L081A92
         PLA
         STAL  L053273
         LDA   $8F
         ASL
         ASL
         ASL
         ASL
         STAL  L053261
         LDA   $8D
         ASL
         ASL
         ASL
         ASL
         STAL  L053267
         LDA   $8F
         ORAL  L053267
         STAL  L053263
         LDAL  L053263
         STAL  L053265
         LDAL  L053267
         STAL  L053269
         LDA   #$0100
         ORAL  L053263
         STAL  L05326D
         LDAL  L053267
         STAL  L05326F
         LDA   $C3
         BEQ   L1403A0
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$0018
         BCC   L140356
         INX
L140356  STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $19
         STX   $1B
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         LDA   #$0002
         CLC
         ADC   $19
         LDX   $1B
         BCC   L140386
         INX
L140386  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0002
         CLC
         ADC   $19
         LDX   $1B
         BCC   L14039A
         INX
L14039A  PHX
         PHA
         JSL   L08273B
L1403A0  PHY
         PHY
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L1512EF
         PLA
         STA   L055121
         PLA
         STA   L055123
         LDAL  L05565D
         BEQ   L140413
         STZ   L055121
         STZ   L055123
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$0018
         BCC   L1403D0
         INX
L1403D0  STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $15
         STX   $17
         LDA   #$0002
         CLC
         ADC   $15
         LDX   $17
         BCC   L1403F7
         INX
L1403F7  PHX
         PHA
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEA   $0035
         JSL   L0727E0
         BRL   L1406B3
L140413  LDA   $C3
         BEQ   L140461
         LDA   L055121
         LDX   L055123
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         CLC
         ADC   #$0092
         BCC   L140430
         INX
L140430  STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         CLC
         ADC   #$0024
         BCC   L14044F
         INX
L14044F  STA   $C5
         STX   $C7
         LDA   #L053261
         LDX   #^L053261
         STA   [$C5]
         TXA
         LDY   #$0002
         STA   [$C5],Y
L140461  LDAL  L0532A5
         STA   $73
         LDAL  L0532A9
         SEP   #$20
         STA   $75
         REP   #$20
         LDAL  L0532A7
         SEP   #$20
         STA   $76
         REP   #$20
         PHY
         LDA   #$00FF
         ANDL  L0532AE
         PHA
         JSL   L081A92
         PLA
         STA   $77
         PEA   $0072
         TDC
         CLC
         ADC   #$0073
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L151077
         PEA   $0003
         TDC
         CLC
         ADC   #$0087
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15011A
         LDAL  L05565D
         BEQ   L1404C4
         BRL   L140556
L1404C4  LDY   #$0002
         LDA   [$87],Y
         TAX
         LDA   [$87]
         STA   $11
         STX   $13
         LDAL  L0532A3
         LDY   #$0006
         STA   [$11],Y
         LDA   $BB
         SEC
         SBC   $B3
         STA   $8B
         LDA   $8B
         STA   [$11]
         LDA   $8B
         LDY   #$0002
         STA   [$11],Y
         LDA   $BF
         SEC
         SBC   $B3
         STA   $8B
         LDA   $C3
         BEQ   L1404FE
         LDA   $8B
         SEC
         SBC   #$001A
         STA   $8B
L1404FE  LDA   $8B
         LDY   #$0004
         STA   [$11],Y
         PEI   $75
         PEI   $73
         PEA   $0000
         JSL   L151663
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         JSL   L150178
         LDA   $81
         CLC
         ADC   $7F
         CLC
         ADC   $85
         STA   $C5
         LDAL  L0532AB
         SEC
         SBC   $C5
         LDY   #$0008
         STA   [$11],Y
         LDA   #$0000
         LDY   #$0010
         STA   [$11],Y
         PEA   $0001
         PEI   $89
         PEI   $87
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150114
         PEI   $89
         PEI   $87
         JSL   L07185A
L140556  PEA   $0001
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L151645
         LDA   $C3
         BNE   L140583
         BRL   L1406B3
L140583  LDA   L055121
         LDX   L055123
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         CLC
         ADC   #$0092
         BCC   L14059C
         INX
L14059C  STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $0D
         STX   $0F
         LDA   #$0008
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L1405C3
         INX
L1405C3  STA   $09
         STX   $0B
         LDA   [$09]
         DEC
         STA   [$09]
         LDY   #$0002
         LDA   [$09],Y
         INC
         INC
         LDY   #$0002
         STA   [$09],Y
         LDY   #$0004
         LDA   [$09],Y
         INC
         LDY   #$0004
         STA   [$09],Y
         LDY   #$0006
         LDA   [$09],Y
         INC
         INC
         LDY   #$0006
         STA   [$09],Y
         LDA   #$0028
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L1405FA
         INX
L1405FA  PHX
         PHA
         PEA   $0002
         PEA   $FFFF
         JSL   L1501AF
         LDA   #$0030
         CLC
         ADC   $0D
         LDX   $0F
         BCC   L140611
         INX
L140611  STA   $05
         STX   $07
         LDA   [$05]
         DEC
         STA   [$05]
         LDY   #$0002
         LDA   [$05],Y
         INC
         INC
         LDY   #$0002
         STA   [$05],Y
         LDY   #$0004
         LDA   [$05],Y
         INC
         LDY   #$0004
         STA   [$05],Y
         LDY   #$0006
         LDA   [$05],Y
         INC
         INC
         LDY   #$0006
         STA   [$05],Y
         PHY
         PHY
         PEA   $0004
         PHY
         PEI   $AF
         JSL   L086029
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L140653
         DEX
L140653  PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L1505C2
         PLA
         STA   $91
         PLX
         STX   $93
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$0018
         BCC   L14067A
         INX
L14067A  STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $C5
         STX   $C7
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         STA   $01
         STX   $03
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L1406A1
         INX
L1406A1  PHX
         PHA
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L1406B3  LDA   $CC
         STA   $D2
         LDA   $CB
         STA   $D1
         LDA   $C9
         TCD
         TSC
         CLC
         ADC   #$00D0
         TCS
         RTL

L1406C5  PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         LDA   L05543B
         LDX   L05543D
         CMP   L055039
         BNE   L1406DB
         CPX   L05503B
L1406DB  BEQ   L14070B
         PEA   ^L050060
         PEA   L050060
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055447
         STZ   L055449
         STZ   L055443
         STZ   L055445
         STZ   L05543F
         STZ   L055441
         LDA   L055039
         LDX   L05503B
         STA   L05543B
         STX   L05543D
L14070B  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   ^L050060
         PEA   L050060
         PEA   $002A
         JSL   L0313BE
         LDA   L055447
         LDX   L055449
         STA   $0D
         STX   $0F
         LDA   L055443
         LDX   L055445
         STA   $09
         STX   $0B
         LDA   L05543F
         LDX   L055441
         STA   $05
         STX   $07
         PHY
         LDAL  L05008C
         PHA
         LDAL  L05008A
         PHA
         PEA   $0000
         PEA   ^L055447
         PEA   L055447
         PEA   ^L050060
         PEA   L050060
         JSL   L0A2034
         PLA
         STA   $03
         LDA   L055027
         LDX   L055029
         STA   L055443
         STX   L055445
         LDA   L05501F
         LDX   L055021
         STA   L05543F
         STX   L055441
         STZ   L055211
         STZ   L05520F
         LDX   #$0000
         LDA   #$000F
         ANDL  L050064
         DEC
         DEC
         BNE   L14078D
         INX
L14078D  PHX
         LDA   L055153
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCS   L14079D
         BRL   L140828
L14079D  LDAL  L05006E
         AND   #$000F
         STA   $01
         LDX   #$0000
         LDA   #$0007
         CMP   $01
         BNE   L1407B1
         INX
L1407B1  PHX
         LDAL  L05008C
         PHA
         LDAL  L05006C
         SEC
         SBC   #$000D
         ASL
         PHA
         PLA
         LDX   #$0001
         SEC
         SBC   $01,S
         BVS   L1407CD
         EOR   #$8000
L1407CD  BPL   L1407D0
         DEX
L1407D0  PLA
         TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1407E0
         LDA   #$0001
         STA   L05520F
         BRA   L140828
L1407E0  LDX   #$0000
         LDA   L0550BB
         DEC
         BNE   L1407EA
         INX
L1407EA  PHX
         LDA   L0551FB
         SEC
         SBC   #$0001
         BEQ   L1407FB
         BVS   L1407F9
         EOR   #$8000
L1407F9  BMI   L140800
L1407FB  LDA   #$0000
         BRA   L140803
L140800  LDA   #$0001
L140803  AND   $01,S
         PLX
         PHA
         PHY
         JSL   L090A90
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDAL  L05006E
         AND   #$1000
         BNE   L140821
         INX
L140821  TXA
         AND   $01,S
         PLX
         STA   L055211
L140828  LDA   $44
         EOR   #$0001
         ORA   L055153
         BEQ   L140835
         BRL   L14091B
L140835  PHY
         PHY
         JSL   L15035F
         LDA   L054FA9
         LDX   L054FAB
         CLC
         ADC   #$012C
         BCC   L140848
         INX
L140848  JSL   L033477
         BVS   L140851
         EOR   #$8000
L140851  BMI   L14088B
         LDA   L054FA7
         BNE   L14085B
         BRL   L14091B
L14085B  LDA   L054FA3
         ORA   L054FA5
         BNE   L140866
         BRL   L14091B
L140866  PHY
         PHY
         LDA   L054FA3
         LDX   L054FA5
         STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         PHX
         PHA
         JSL   L071C98
         PLA
         PLX
         STX   $3B
         ORA   $3B
         BNE   L14088B
         BRL   L14091B
L14088B  LDA   $0D
         LDX   $0F
         CMP   L055447
         BNE   L140897
         CPX   L055449
L140897  BEQ   L14089E
         LDA   #$0000
         BRA   L1408A1
L14089E  LDA   #$0001
L1408A1  PHA
         LDX   #$0000
         LDA   $13
         CMPL  L050062
         BNE   L1408AE
         INX
L1408AE  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1408DB
         PEA   $0018
         LDA   L055447
         LDX   L055449
         PHX
         PHA
         LDAL  L050062
         PHA
         LDA   L055443
         LDX   L055445
         PHX
         PHA
         LDA   L05543F
         LDX   L055441
         PHX
         PHA
         JSL   L0998E6
         BRA   L140914
L1408DB  PEA   $0019
         PEI   $0F
         PEI   $0D
         PEI   $13
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         JSL   L0998E6
         PEA   $0017
         LDA   L055447
         LDX   L055449
         PHX
         PHA
         LDAL  L050062
         PHA
         LDA   L055443
         LDX   L055445
         PHX
         PHA
         LDA   L05543F
         LDX   L055441
         PHX
         PHA
         JSL   L0998E6
L140914  PEA   $0016
         JSL   L0998B0
L14091B  LDA   $42
         STA   $44
         LDA   $41
         STA   $43
         LDA   $3F
         TCD
         TSC
         CLC
         ADC   #$0042
         TCS
         RTL

L14092D  ENT
         PHD
         TSC
         CLC
         ADC   #$FDB6
         TCS
         ADC   #$0153
         TCD
         JSL   L093F21
         LDA   L0551FB
         SEC
         SBC   #$0001
         BEQ   L14094C
         BVS   L14094A
         EOR   #$8000
L14094A  BMI   L140951
L14094C  LDA   #$0000
         BRA   L140954
L140951  LDA   #$0001
L140954  PHA
         LDA   L055051
         EOR   #$0001
         AND   $01,S
         PLX
         STA   $F1
         LDA   L0551FB
         SEC
         SBC   #$0001
         BEQ   L140970
         BVS   L14096E
         EOR   #$8000
L14096E  BMI   L140975
L140970  LDA   #$0000
         BRA   L140978
L140975  LDA   #$0001
L140978  PHA
         LDA   L055243
         ORA   $F1
         AND   $01,S
         PLX
         STA   $EF
         LDA   L054FB5
         EOR   #$0001
         ORA   $EF
         ORA   L0551F3
         STA   $ED
         STZ   $EB
         LDA   L0551FB
         SEC
         SBC   #$0002
         BEQ   L1409A2
         BVS   L1409A0
         EOR   #$8000
L1409A0  BMI   L1409A7
L1409A2  LDA   #$0000
         BRA   L1409AA
L1409A7  LDA   #$0001
L1409AA  AND   $ED
         PHA
         LDA   L0551FB
         SEC
         SBC   #$0002
         BEQ   L1409C2
         BVS   L1409BB
         EOR   #$8000
L1409BB  BPL   L1409C2
         LDA   #$0000
         BRA   L1409C5
L1409C2  LDA   #$0001
L1409C5  AND   $ED
         PHA
         LDX   #$0000
         LDA   L0551E9
         BNE   L1409D1
         INX
L1409D1  PHX
         LDX   #$0000
         LDA   #$1601
         CMP   L0551E9
         BNE   L1409DE
         INX
L1409DE  TXA
         ORA   $01,S
         PLX
         AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L1409F0
         LDA   #$0001
         STA   $EB
L1409F0  PEI   $EB
         PEA   $00FD
         JSL   L073077
         PEA   ^L05259E
         PEA   L05259E
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0007
         JSL   L073002
         PEA   ^L052CCE
         PEA   L052CCE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05254E
         PEA   L05254E
         PEA   ^L040265
         PEA   L040265
         PEA   ^L052CBA
         PEA   L052CBA
         TDC
         CLC
         ADC   #$0097
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05259E
         PEA   L05259E
         PEA   $00FD
         JSL   L15039B
         LDA   L054FB5
         EOR   #$0001
         STA   $E9
         LDAL  L04026C
         SEP   #$20
         STA   $C5
         REP   #$20
         LDAL  L04026D
         SEP   #$20
         STA   $B1
         REP   #$20
         LDA   L054FB5
         BNE   L140A86
         BRL   L140BF7
L140A86  STZ   $E7
         LDA   L0551F3
         BEQ   L140AE2
         LDA   L055111
         LDX   L055113
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         TXY
         LDX   #$FFAD
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFAD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L140AB8
         INX
L140AB8  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         LDX   #$FFAD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0022
         BCC   L140ACF
         INX
L140ACF  STA   $F3
         STX   $F5
         PLA
         CMP   [$F3]
         BNE   L140ADD
         LDA   #$0000
         BRA   L140AE0
L140ADD  LDA   #$0001
L140AE0  STA   $E7
L140AE2  LDA   L05511F
         BEQ   L140B27
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150000
         PEI   $E7
         PEI   $DF
         PEI   $DD
         LDA   $D9
         LDX   $DB
         JSL   L033477
         BVS   L140B18
         EOR   #$8000
L140B18  BPL   L140B1F
         LDA   #$0000
         BRA   L140B22
L140B1F  LDA   #$0001
L140B22  ORA   $01,S
         PLX
         STA   $E7
L140B27  LDA   $E7
         BEQ   L140B66
         LDA   #$0001
         STA   $E9
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0008
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   ^L04026E
         PEA   L04026E
         PEA   $0005
         JSL   L0313BE
L140B66  LDAL  L052D34
         BNE   L140B6F
         BRL   L140BF7
L140B6F  LDA   #$0001
         STA   $E9
         LDA   #$000F
         ANDL  L052D36
         DEC
         BNE   L140BB6
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $000B
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   ^L040273
         PEA   L040273
         PEA   $0007
         JSL   L0313BE
         BRA   L140BF7
L140BB6  LDA   #$000F
         ANDL  L052D36
         DEC
         DEC
         BNE   L140BF7
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $000C
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   ^L04027A
         PEA   L04027A
         PEA   $0006
         JSL   L0313BE
L140BF7  PEA   ^L0525C6
         PEA   L0525C6
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0004
         JSL   L073002
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L052576
         PEA   L052576
         PEA   ^L040280
         PEA   L040280
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0099
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L0525B2
         PEA   L0525B2
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0005
         JSL   L073002
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L052562
         PEA   L052562
         PEA   ^L040285
         PEA   L040285
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0097
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05258A
         PEA   L05258A
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAD
         PHA
         PEA   $0006
         JSL   L073002
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05253A
         PEA   L05253A
         PEA   ^L04028B
         PEA   L04028B
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0097
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L0525C6
         PEA   L0525C6
         PEA   $00FB
         JSL   L15039B
         PEA   ^L0525B2
         PEA   L0525B2
         PEA   $00FC
         JSL   L15039B
         PEA   ^L05258A
         PEA   L05258A
         PEA   $00FE
         JSL   L15039B
         LDA   L054FB5
         BEQ   L140D66
         LDA   L0551CB
         ORA   L0551CD
         BEQ   L140D54
         LDA   #$0001
L140D54  ORA   L05511F
         PHA
         LDAL  L05000A
         BEQ   L140D61
         LDA   #$0001
L140D61  ORA   $01,S
         PLX
         STA   $E3
L140D66  PEI   $E9
         PEA   $00FC
         JSL   L073077
         LDA   $ED
         AND   $E9
         PHA
         PEA   $00FB
         JSL   L073077
         LDA   $ED
         AND   $E9
         PHA
         PEA   $00FE
         JSL   L073077
         PEI   $E3
         PEA   $00FA
         JSL   L073077
         PEI   $F1
         PEA   $01FC
         JSL   L073077
         PEI   $F1
         PEA   $051C
         JSL   L073077
         PEI   $F1
         PEA   $01FD
         JSL   L073077
         PEI   $F1
         PEA   $051D
         JSL   L073077
         PEI   $F1
         PEA   $01FE
         JSL   L073077
         PEI   $F1
         PEA   $032C
         JSL   L073077
         PEI   $F1
         PEA   $0195
         JSL   L073077
         LDX   #$0000
         LDA   #$4000
         ANDL  L053AE9
         BNE   L140DDC
         INX
L140DDC  PHX
         LDA   L05504F
         EOR   #$0001
         AND   $01,S
         PLX
         STA   $E1
         PEI   $E1
         PEA   $0197
         JSL   L073077
         LDAL  L052D34
         BEQ   L140DFA
         LDA   #$0001
L140DFA  ORA   L05511F
         AND   $EF
         PHA
         PEA   $0201
         JSL   L073077
         LDA   L055153
         PHA
         PEA   $0202
         JSL   L15167B
         LDAL  L052D34
         BEQ   L140E1B
         LDA   #$0001
L140E1B  AND   $EF
         STA   $E5
         PEI   $E5
         PEA   $0327
         JSL   L073077
         PEI   $E5
         PEA   $0328
         JSL   L073077
         LDX   #$0000
         LDA   #$000F
         ANDL  L052D36
         DEC
         BNE   L140E3F
         INX
L140E3F  PHX
         PEA   $0321
         JSL   L073077
         LDX   #$0000
         LDA   #$000F
         ANDL  L052D36
         DEC
         DEC
         BNE   L140E56
         INX
L140E56  TXA
         ORA   L05511F
         PHA
         PEA   $0322
         JSL   L073077
         PEI   $EF
         PEA   $032A
         JSL   L073077
         PEI   $EF
         PEA   $032B
         JSL   L073077
         PEA   $0000
         PEA   $0000
         PEA   $01F4
         JSL   L1505D4
         PEA   $0000
         PEA   $0000
         PEA   $0514
         JSL   L1505D4
         TSC
         CLC
         ADC   #$024A
         TCS
         PLD
         RTL

L140E96  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         JSL   L0A3283
         JSL   L0903F2
         PEA   $0000
         PEA   $0000
         JSL   L090000
         LDA   L055153
         EOR   #$0001
         STA   L055153
         PEA   ^L053259
         PEA   L053259
         JSL   L085216
         PEA   ^L053259
         PEA   L053259
         JSL   L087BAE
         JSL   L083E9E
         JSL   L087268
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L140EDD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         LDA   L055235
         STA   $0D
         LDA   L055237
         STA   $0B
         LDA   L055239
         STA   $09
         LDA   L05523B
         STA   $07
         LDA   L055211
         STA   $17
         LDA   L05520F
         STA   $15
         PHY
         JSL   L099DCE
         PLA
         STA   L055235
         PHY
         JSL   L09771E
         PLA
         STA   L055237
         PHY
         JSL   L090A90
         PLA
         STA   L055239
         PHY
         JSL   L0903C7
         PLA
         STA   L05523B
         LDA   $2A
         LDX   $2C
         STAL  L05008A
         TXA
         STAL  L05008C
         PEI   $28
         JSL   L1406C5
         LDA   $0D
         CMP   L055235
         BEQ   L140F47
         LDA   #$0001
         STA   L0551EB
L140F47  LDA   L05520D
         STA   $13
         LDA   L055209
         STA   $11
         LDA   L05524B
         BEQ   L140F67
         LDA   #$0013
         STA   $19
         LDA   L0550ED
         LDX   L0550EF
         STA   $1B
         STX   $1D
         BRA   L140F7C
L140F67  PHY
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         PEI   $2C
         PEI   $2A
         JSL   L150B9A
         PLA
         STA   $19
L140F7C  PHY
         PEI   $1D
         PEI   $1B
         JSL   L0A12DB
         PLA
         LSR
         BCC   L140F92
         LDA   #$0001
         STA   L054F9F
         BRL   L14110C
L140F92  STZ   L05520D
         STZ   L055209
         LDA   #$0013
         CMP   $19
         BNE   L140FD1
         LDA   L0550E1
         LDX   L0550E3
         CMP   $1B
         BNE   L140FAB
         CPX   $1D
L140FAB  BEQ   L140FB2
         LDA   #$0000
         BRA   L140FB5
L140FB2  LDA   #$0001
L140FB5  STA   L05520D
         LDA   L0550ED
         LDX   L0550EF
         CMP   $1B
         BNE   L140FC4
         CPX   $1D
L140FC4  BEQ   L140FCB
         LDA   #$0000
         BRA   L140FCE
L140FCB  LDA   #$0001
L140FCE  STA   L055209
L140FD1  LDA   L05520B
         STA   $0F
         LDA   L05520D
         STA   L05520B
         LDA   L05520D
         BEQ   L14101A
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L151131
         LDA   $2A
         LDX   $2C
         STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150BE8
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L053249
         PEA   L053249
         JSL   L1512CB
         PLA
         STA   L05520B
L14101A  LDA   L054F9F
         BNE   L14102F
         PHA
         LDX   #$0000
         LDA   $0D
         CMP   L055235
         BEQ   L14102B
         INX
L14102B  TXA
         ORA   $01,S
         PLX
L14102F  PHA
         PLA
         BNE   L141043
         PHA
         LDX   #$0000
         LDA   $0B
         CMP   L055237
         BEQ   L14103F
         INX
L14103F  TXA
         ORA   $01,S
         PLX
L141043  PHA
         PLA
         BNE   L141057
         PHA
         LDX   #$0000
         LDA   $09
         CMP   L055239
         BEQ   L141053
         INX
L141053  TXA
         ORA   $01,S
         PLX
L141057  PHA
         PLA
         BNE   L14106B
         PHA
         LDX   #$0000
         LDA   $17
         CMP   L055211
         BEQ   L141067
         INX
L141067  TXA
         ORA   $01,S
         PLX
L14106B  PHA
         PLA
         BNE   L14107F
         PHA
         LDX   #$0000
         LDA   $11
         CMP   L055209
         BEQ   L14107B
         INX
L14107B  TXA
         ORA   $01,S
         PLX
L14107F  PHA
         PLA
         BNE   L141093
         PHA
         LDX   #$0000
         LDA   $0F
         CMP   L05520B
         BEQ   L14108F
         INX
L14108F  TXA
         ORA   $01,S
         PLX
L141093  CMP   #$0000
         BNE   L1410A6
         LDX   #$0000
         LDA   $15
         CMP   L05520F
         BEQ   L1410A3
         INX
L1410A3  TXA
         BEQ   L14110C
L1410A6  LDA   #$0004
         STA   $05
         LDA   L05520B
         BEQ   L1410B5
         LDA   #$0008
         STA   $05
L1410B5  LDA   L055209
         BEQ   L1410EF
         LDA   L0550BB
         DEC
         BNE   L1410DF
         LDA   L055211
         BEQ   L1410CC
         LDA   #$0008
         STA   $05
         BRA   L1410DD
L1410CC  LDA   L05520F
         BEQ   L1410D8
         LDA   #$0004
         STA   $05
         BRA   L1410DD
L1410D8  LDA   #$0005
         STA   $05
L1410DD  BRA   L1410EF
L1410DF  LDA   L055237
         EOR   #$0001
         AND   L055239
         BEQ   L1410EF
         LDA   #$0007
         STA   $05
L1410EF  LDA   L054F9F
         BEQ   L141103
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L141103
         LDA   #$FFFF
         STA   L054FA1
L141103  STZ   L054F9F
         PEI   $05
         JSL   L0724F7
L14110C  LDA   $26
         STA   $2C
         LDA   $25
         STA   $2B
         LDA   $23
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L14111E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         LDA   L055423
         STA   $15
         LDA   L054FB7
         LDX   L054FB9
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         AND   #$000F
         STA   L055423
         LDA   $15
         CMP   L055423
         BNE   L14115D
         BRL   L1412E6
L14115D  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L082570
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         PEA   ^L052D38
         PEA   L052D38
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0808E0
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L151418
         JSL   L1510A1
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0002
         BCC   L1411DC
         INX
L1411DC  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0002
         BCC   L141201
         INX
L141201  PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L141221
         CPX   L0551F7
L141221  BNE   L141299
         LDAL  L052D34
         PHA
         PEA   $0004
         PEA   $0000
         JSL   L084F9B
         LDA   L055153
         BNE   L141297
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L084FD4
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0002
         BCC   L141265
         INX
L141265  STA   $01
         STX   $03
         LDY   #$0002
         LDA   #$FFF8
         AND   [$01],Y
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0006
         LDA   #$0007
         CLC
         ADC   [$01],Y
         AND   #$FFF8
         LDY   #$0006
         STA   [$01],Y
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         JSL   L081517
L141297  BRA   L1412AB
L141299  LDAL  L052D34
         PHA
         PEA   $0004
         PEA   $0000
         PEA   $0000
         JSL   L081517
L1412AB  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L087BAE
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0002
         BCC   L1412D4
         INX
L1412D4  PHX
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L1412E6  TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L1412EE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDAL  L05328D
         CMP   $0C
         BEQ   L141302
         INX
L141302  PHX
         LDA   L055129
         LDX   L05512B
         CMP   $0E
         BNE   L14130F
         CPX   $10
L14130F  BNE   L141316
         LDA   #$0000
         BRA   L141319
L141316  LDA   #$0001
L141319  ORA   $01,S
         PLX
         PHA
         LDA   L055125
         LDX   L055127
         CMP   L055027
         BNE   L14132B
         CPX   L055029
L14132B  BNE   L141332
         LDA   #$0000
         BRA   L141335
L141332  LDA   #$0001
L141335  ORA   $01,S
         PLX
         LSR
         BCC   L14135B
         PEA   $0001
         JSL   L09091E
         LDA   L055121
         ORA   L055123
         BEQ   L141351
         PEA   $0000
         JSL   L09091E
L141351  PEI   $10
         PEI   $0E
         PEI   $0C
         JSL   L140000
L14135B  LDA   L055121
         ORA   L055123
         BEQ   L141366
         LDA   #$0001
L141366  AND   $0A
         BEQ   L14137C
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L096D12
         LDA   #$0001
         STA   L05511F
L14137C  LDA   $08
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

L14138E  ENT
         PHD
         TSC
         CLC
         ADC   #$FF80
         TCS
         TCD
         LDX   #$0000
         LDA   L0550BB
         DEC
         BEQ   L1413A0
         INX
L1413A0  TXA
         STA   $69
         PHY
         JSL   L099DCE
         PLA
         STA   $61
L1413AB  LDA   $61
         STA   $5F
         LDA   #$0001
         STA   $6B
         LDX   #$0000
         LDA   L0550BB
         DEC
         BNE   L1413BE
         INX
L1413BE  TXA
         AND   $61
         BEQ   L1413C5
         STZ   $6B
L1413C5  LDA   #$0003
         CMP   L0550BB
         BNE   L1413D9
         LDA   $61
         BEQ   L1413D4
         BRL   L1415A2
L1413D4  LDA   #$0002
         STA   $6B
L1413D9  PEA   $0001
         JSL   L09091E
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $75
         PLX
         STX   $77
         LDA   $75
         ORA   $77
         BNE   L141411
         BRL   L14149A
L141411  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $79
         PLX
         STX   $7B
         LDA   $79
         ORA   $7B
         BEQ   L14148B
         PEI   $7B
         PEI   $79
         PEI   $77
         PEI   $75
         PEI   $69
         PEI   $6B
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L083245
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L083985
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEI   $7B
         PEI   $79
         PEI   $77
         PEI   $75
         PEI   $69
         PEI   $6B
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L083245
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L14148B  LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L14149A  PHY
         JSL   L099DCE
         PLA
         STA   $61
         PHY
         JSL   L09771E
         PHY
         JSL   L090A90
         PLA
         STA   $7D
         PLA
         AND   $7D
         STA   $5D
         PHY
         PEA   $000A
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L096BB1
         PLA
         STA   $67
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L1414D4
         EOR   #$8000
L1414D4  BPL   L1414DB
         LDA   #$0000
         BRA   L1414DE
L1414DB  LDA   #$0001
L1414DE  AND   $67
         BEQ   L1414E8
         JSL   L072314
         STZ   $67
L1414E8  LDX   #$0000
         LDA   $5F
         CMP   $61
         BEQ   L1414F2
         INX
L1414F2  TXA
         ORA   $67
         PHA
         LDA   $5D
         EOR   #$0001
         ORA   $01,S
         PLX
         LSR
         BCC   L14149A
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L083985
         LDX   #$0000
         LDA   $5F
         CMP   $61
         BEQ   L141520
         INX
L141520  TXA
         AND   $5D
         BEQ   L141528
         BRL   L1413AB
L141528  LDA   $67
         BEQ   L1415A2
         JSL   L0A3283
         LDA   $2B
         DEC
         BNE   L141588
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L150BE8
         PHY
         PEI   $37
         PEI   $35
         PEI   $6B
         TDC
         CLC
         ADC   #$0063
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0A2034
         PLA
         LSR
         BCC   L141586
         PEI   $65
         PEI   $63
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B838F
         LDA   #$0001
         STA   L055249
L141586  BRA   L1415A2
L141588  LDA   #$0003
         CMP   $2B
         BNE   L1415A2
         PHY
         LDA   $2D
         AND   #$00FF
         PHA
         JSL   L09AB66
         PLA
         LSR
         BCS   L1415A2
         JSL   L072314
L1415A2  TSC
         CLC
         ADC   #$0080
         TCS
         PLD
         RTL

L1415AA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0550BB
         CMP   $0E
         BEQ   L1415C3
         PEA   ^L053259
         PEA   L053259
         JSL   L086C8B
L1415C3  LDA   L05514B
         STA   $03
         LDA   L05514D
         STA   $01
         LDX   #$0000
         LDA   #$0003
         CMP   $0E
         BNE   L1415D8
         INX
L1415D8  PHX
         LDA   L0551FB
         SEC
         SBC   #$0003
         BEQ   L1415E9
         BVS   L1415E7
         EOR   #$8000
L1415E7  BMI   L1415EE
L1415E9  LDA   #$0000
         BRA   L1415F1
L1415EE  LDA   #$0001
L1415F1  AND   $01,S
         PLX
         STA   L05514B
         LDX   #$0000
         LDA   $0E
         DEC
         DEC
         BNE   L141601
         INX
L141601  PHX
         LDA   L0551FB
         SEC
         SBC   #$0003
         BEQ   L141612
         BVS   L141610
         EOR   #$8000
L141610  BMI   L141617
L141612  LDA   #$0000
         BRA   L14161A
L141617  LDA   #$0001
L14161A  AND   $01,S
         PLX
         STA   L05514D
         PEI   $0E
         JSL   L099B9B
         LDX   #$0000
         LDA   $01
         CMP   L05514D
         BEQ   L141631
         INX
L141631  PHX
         LDX   #$0000
         LDA   $03
         CMP   L05514B
         BEQ   L14163D
         INX
L14163D  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L141648
         JSL   L0875FA
L141648  LDA   $0C
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

L14165A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         PHY
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         PEA   ^L05328B
         PEA   L05328B
         JSL   L07D585
         PLA
         LSR
         BCS   L141683
         PEA   $000E
         JSL   L0727E0
         BRL   L141735
L141683  LDAL  L0532A5
         STA   $11
         LDAL  L0532A9
         SEP   #$20
         STA   $13
         REP   #$20
         LDAL  L0532A7
         SEP   #$20
         STA   $14
         REP   #$20
         PEA   $0062
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L151077
         PEA   $0003
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15011A
         LDAL  L05565D
         BNE   L141731
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDAL  L0532A3
         LDY   #$0006
         STA   [$01],Y
         PEI   $13
         PEI   $11
         PEA   $0000
         JSL   L151663
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150178
         LDA   $0B
         CLC
         ADC   $09
         CLC
         ADC   $0F
         STA   $1D
         LDAL  L0532AB
         SEC
         SBC   $1D
         LDY   #$0008
         STA   [$01],Y
         PEA   $0001
         PEI   $07
         PEI   $05
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150114
         PEI   $07
         PEI   $05
         JSL   L07185A
L141731  JSL   L0879C5
L141735  PEA   ^L053291
         PEA   L053291
         JSL   L086CDB
         JSL   L0875FA
         TSC
         CLC
         ADC   #$0020
         TCS
         PLD
         RTL

L14174B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         JSL   L0875FA
         PLY
         PLY
         PLD
         RTL

