*
* HypercardGS
* segment: $0E HyperTalk3
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperTalk3.l
         lst   off

*---------------------------------------

         use   HyperTalk3.E
         use   HyperTalk3.X

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

L0E0000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0E0027
         DEX
L0E0027  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L0E0067
         BVS   L0E0056
         EOR   #$8000
L0E0056  BPL   L0E0067
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07185A
L0E0067  LDA   L0553C3
         DEC
         STA   L0553C3
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0E0074  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0553BD
         LDX   L0553BF
         CLC
         ADC   #$0004
         BCC   L0E0089
         INX
L0E0089  STA   $03
         STX   $05
         LDA   [$03]
         BNE   L0E00A7
         PHY
         LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         PEA   ^L04075D
         PEA   L04075D
         JSL   L0B2819
         PLA
         STA   $01
L0E00A7  LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         LDA   L0553BD
         LDX   L0553BF
         CLC
         ADC   #$0004
         BCC   L0E00BC
         INX
L0E00BC  STA   $03
         STX   $05
         LDA   [$03]
         PHA
         JSL   L0B3CD4
         PLY
         PLY
         PLY
         PLD
         RTL

L0E00CC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L03198D
         PLA
         LSR
         BCS   L0E00E1
         JSL   L031619
L0E00E1  PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         SEC
         SBC   #$0011
         BMI   L0E013C
         CMP   #$0002
         BPL   L0E013C
         SEC
         SBC   #$0000
         BEQ   L0E0124
         DEC
         BEQ   L0E00FF
         BRA   L0E013C
L0E00FF  LDA   #$0001
         STA   [$0A]
         LDA   #$0002
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0E010F
         INX
L0E010F  STA   $01
         STX   $03
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         BRA   L0E0143
L0E0124  LDA   #$0000
         STA   [$0A]
         LDA   #$0002
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0E0134
         INX
L0E0134  PHX
         PHA
         JSL   L0E04A7
         BRA   L0E0143
L0E013C  PEA   $7B41
         JSL   L07272E
L0E0143  LDA   $08
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

L0E0154  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055371
         DEC
         STA   L055371
         LDA   L055371
         SEC
         SBC   #$0000
         BMI   L0E017D
         BEQ   L0E017D
         LDA   L055371
         DEC
         ASL
         TAX
         LDAL  L050AEA,X
         STA   L05536F
         BRA   L0E0180
L0E017D  STZ   L05536F
L0E0180  PLY
         PLY
         PLD
         RTL

L0E0184  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB6
         TCS
         TCD
         LDA   [$52]
         EOR   #$0001
         CMP   #$0000
         BNE   L0E01A6
         LDX   #$0000
         LDA   $50
         DEC
         DEC
         BEQ   L0E01A0
         INX
L0E01A0  TXA
         BNE   L0E01A6
         BRL   L0E03DF
L0E01A6  JSL   L031B09
         PEI   $54
         PEI   $52
         PEA   $0000
         JSL   L0E087F
         PEI   $54
         PEI   $52
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L0D0A88
         PHY
         PHY
         PEA   $0000
         JSL   L03154C
         PLA
         STA   $33
         PLX
         STX   $35
         PHY
         PHY
         JSL   L0B3727
         PHY
         PHY
         JSL   L0B37CF
         PLA
         PLX
         JSL   L150F53
         PEI   $25
         PEI   $23
         JSL   L150F53
         PEI   $1D
         PEI   $1B
         JSL   L150F53
         CLC
         ADC   #$000A
         BCC   L0E022B
         INX
L0E022B  STA   $13
         STX   $15
         PHY
         JSL   L0B1C0F
         PLA
         STA   $0D
         PHY
         PHY
         PEI   $15
         PEI   $13
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $2B
         PLX
         STX   $2D
         LDA   $2B
         ORA   $2D
         BNE   L0E0269
         PEA   $002D
         JSL   L0B0B7A
         PEI   $0D
         JSL   L0B39C0
         JSL   L0E0000
         JSL   L0E0000
         BRL   L0E0495
L0E0269  LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   $2F
         STX   $31
         PEI   $3D
         PEI   $3B
         LDA   $43
         LDX   $45
         JSL   L1512A5
         STA   $17
         STX   $19
         PEI   $45
         PEI   $43
         PEI   $31
         PEI   $2F
         PEI   $19
         PEI   $17
         JSL   L070597
         LDA   $2F
         LDX   $31
         PEI   $19
         PEI   $17
         JSL   L150F53
         STA   $2F
         STX   $31
         LDA   $23
         LDX   $25
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L0E02C0
         EOR   #$8000
L0E02C0  BPL   L0E02F4
         LDA   #$0001
         LDX   #$0000
         STA   $27
         STX   $29
L0E02CC  SEP   #$20
         LDA   #$0D
         STA   [$2F]
         REP   #$20
         LDA   $2F
         LDX   $31
         INC
         BNE   L0E02DC
         INX
L0E02DC  STA   $2F
         STX   $31
         LDA   $27
         LDX   $29
         CMP   $09
         BNE   L0E02EA
         CPX   $0B
L0E02EA  BEQ   L0E02F4
         INC   $27
         BNE   L0E02F2
         INC   $29
L0E02F2  BRA   L0E02CC
L0E02F4  LDA   $1B
         LDX   $1D
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L0E030F
         EOR   #$8000
L0E030F  BPL   L0E0344
         LDA   #$0001
         LDX   #$0000
         STA   $1F
         STX   $21
L0E031B  LDA   L055277
         SEP   #$20
         STA   [$2F]
         REP   #$20
         LDA   $2F
         LDX   $31
         INC
         BNE   L0E032C
         INX
L0E032C  STA   $2F
         STX   $31
         LDA   $1F
         LDX   $21
         CMP   $05
         BNE   L0E033A
         CPX   $07
L0E033A  BEQ   L0E0344
         INC   $1F
         BNE   L0E0342
         INC   $21
L0E0342  BRA   L0E031B
L0E0344  PEI   $41
         PEI   $3F
         LDA   $3B
         LDX   $3D
         JSL   L1512A5
         STA   $17
         STX   $19
         LDA   $50
         DEC
         BNE   L0E0379
         PEI   $3D
         PEI   $3B
         PEI   $31
         PEI   $2F
         PEI   $19
         PEI   $17
         JSL   L070597
         LDA   $2F
         LDX   $31
         PEI   $19
         PEI   $17
         JSL   L150F53
         STA   $2F
         STX   $31
L0E0379  TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L070669
         LDA   $50
         BNE   L0E03B3
         PEI   $3D
         PEI   $3B
         PEI   $31
         PEI   $2F
         PEI   $19
         PEI   $17
         JSL   L070597
         LDA   $2F
         LDX   $31
         PEI   $19
         PEI   $17
         JSL   L150F53
         STA   $2F
         STX   $31
L0E03B3  TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L070669
         PEI   $0D
         JSL   L0B39C0
         JSL   L0E0000
         JSL   L0E0000
         PEI   $2D
         PEI   $2B
         JSL   L0E0CFE
L0E03DF  LDA   L0553A5
         BEQ   L0E03EB
         JSL   L0E0000
         BRL   L0E0495
L0E03EB  LDA   $52
         LDX   $54
         STA   $01
         STX   $03
         LDY   #$0022
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L0E0401
         BRL   L0E0495
L0E0401  CMP   #$0004
         BMI   L0E0409
         BRL   L0E0495
L0E0409  SEC
         SBC   #$0000
         BEQ   L0E042E
         DEC
         BEQ   L0E041A
         DEC
         BEQ   L0E0465
         DEC
         BEQ   L0E046B
         BRA   L0E0495
L0E041A  LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         LDY   #$0024
         LDA   [$01],Y
         PHA
         JSL   L0B3CD4
         BRA   L0E0495
L0E042E  PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $0F
         PLX
         STX   $11
         PHY
         LDA   #$0024
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E0446
         INX
L0E0446  PHX
         PHA
         PEI   $11
         PEI   $0F
         JSL   L0B2E1F
         PLA
         LSR
         BCS   L0E045B
         PEA   $0029
         JSL   L0B0B7A
L0E045B  PEI   $11
         PEI   $0F
         JSL   L07185A
         BRA   L0E0495
L0E0465  JSL   L0B2F70
         BRA   L0E0495
L0E046B  PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $0F
         PLX
         STX   $11
         PHY
         PEI   $11
         PEI   $0F
         JSL   L0B2CDB
         PLA
         LSR
         BCS   L0E048B
         PEA   $0050
         JSL   L0B0B7A
L0E048B  PEI   $11
         PEI   $0F
         JSL   L07185A
         BRA   L0E0495
L0E0495  LDA   $4E
         STA   $54
         LDA   $4D
         STA   $53
         LDA   $4B
         TCD
         TSC
         CLC
         ADC   #$0052
         TCS
         RTL

L0E04A7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0319D4
         PLA
         LSR
         BCS   L0E04BC
         JSL   L031619
L0E04BC  PEI   $0C
         PEI   $0A
         PEA   $0000
         PEA   $000A
         PEA   $0011
         JSL   L0E0656
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

L0E04DE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L0553C3
         SEC
         SBC   #$0000
         BEQ   L0E04F1
         BPL   L0E04F8
L0E04F1  STZ   $12
         STZ   $14
         BRL   L0E05A7
L0E04F8  JSL   L031B09
         PHY
         PHY
         JSL   L0B3727
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L0E051F
         BVS   L0E051D
         EOR   #$8000
L0E051D  BMI   L0E0549
L0E051F  PHY
         PHY
         PEI   $03
         PEI   $01
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         PEI   $03
         PEI   $01
         PEA   $0000
         JSL   L0E0656
         BRA   L0E059F
L0E0549  LDA   L0553C5
         LDX   L0553C7
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0E0568
         DEX
L0E0568  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L0E0580
         INX
L0E0580  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         JSL   L07191C
         LDA   L0553C3
         DEC
         STA   L0553C3
L0E059F  LDA   $05
         LDX   $07
         STA   $12
         STX   $14
L0E05A7  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0E05AF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCS   L0E05C4
         JSL   L031619
L0E05C4  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0012
         JSL   L0E0656
         LDA   $01
         LDX   $03
         STA   $0E
         STX   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0E05E8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCS   L0E05FD
         JSL   L031619
L0E05FD  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0012
         JSL   L0E0656
         LDA   $01
         STA   $0E
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0E061D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCS   L0E0632
         JSL   L031619
L0E0632  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0012
         JSL   L0E0656
         LDA   $01
         LDX   $03
         STA   $0E
         STX   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0E0656  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $12
         PEI   $10
         JSL   L0B03FF
         LDA   $08
         STA   $12
         LDA   $07
         STA   $11
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0E0678  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L031A72
         PLA
         LSR
         BCS   L0E068D
         JSL   L031619
L0E068D  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $000E
         JSL   L0E0656
         LDA   $01
         STA   $0C
         PLY
         PLY
         PLY
         PLD
         RTL

L0E06AC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEA   $00FD
         JSL   L0E06F4
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

L0E06D0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEA   $001D
         JSL   L0E06F4
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

L0E06F4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         JSL   L031B09
         PHY
         PHY
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         JSL   L071C98
         PLA
         STA   $09
         PLX
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   $16
         JSL   L150488
         JSL   L033477
         BEQ   L0E0736
         BVS   L0E072A
         EOR   #$8000
L0E072A  BPL   L0E0736
         LDA   $16
         JSL   L150488
         STA   $09
         STX   $0B
L0E0736  PHY
         PHY
         PEA   $0000
         JSL   L031415
         LDA   $18
         LDX   $1A
         INC
         BNE   L0E0747
         INX
L0E0747  PHX
         PHA
         PEI   $0B
         PEI   $09
         JSL   L070597
         LDA   $09
         SEP   #$20
         STA   [$18]
         REP   #$20
         JSL   L0E0000
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

         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDY   #$0004
         LDA   #$0300
         AND   [$0A],Y
         CMP   #$0000
         BEQ   L0E0788
         INX
L0E0788  TXA
         STA   $0E
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

L0E079C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDA   [$0A]
         LDY   #$0002
         ORA   [$0A],Y
         BNE   L0E07B1
         INX
L0E07B1  TXA
         STA   $0E
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

L0E07C5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         PEI   $0A
         JSL   L0B04B4
         PLA
         LSR
         BCS   L0E07E7
         PEA   $002D
         JSL   L0B0B7A
L0E07E7  LDA   $08
         STA   $12
         LDA   $07
         STA   $11
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0E07F9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   [$0A]
         BEQ   L0E0816
         LDY   #$0004
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L0E0DE2
         BRA   L0E0827
L0E0816  LDA   #$0002
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0E0821
         INX
L0E0821  PHX
         PHA
         JSL   L0E0C71
L0E0827  LDA   $08
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

L0E0838  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055371
         SEC
         SBC   #$0080
         BVS   L0E084C
         EOR   #$8000
L0E084C  BPL   L0E0857
         PEA   $0052
         JSL   L0B0B7A
         BRA   L0E086F
L0E0857  LDA   L055371
         INC
         STA   L055371
         LDA   L055371
         DEC
         ASL
         TAX
         LDA   $0A
         STAL  L050AEA,X
         LDA   $0A
         STA   L05536F
L0E086F  LDA   $08
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

L0E087F  ENT
         PHD
         TSC
         CLC
         ADC   #$FED2
         TCS
         ADC   #$003D
         TCD
         LDA   $F8
         LDX   $FA
         STA   $C3
         STX   $C5
         LDY   #$0022
         LDA   [$C3],Y
         SEC
         SBC   #$0000
         BPL   L0E08A0
         BRL   L0E0BD7
L0E08A0  CMP   #$0004
         BMI   L0E08A8
         BRL   L0E0BD7
L0E08A8  SEC
         SBC   #$0000
         BEQ   L0E08EA
         DEC
         BEQ   L0E08BA
         DEC
         BEQ   L0E08CF
         DEC
         BEQ   L0E08E3
         BRL   L0E0BD7
L0E08BA  LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         LDY   #$0024
         LDA   [$C3],Y
         PHA
         JSL   L0B3A6A
         BRL   L0E0BDE
L0E08CF  PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         JSL   L094153
         JSL   L0E0F0F
         BRL   L0E0BDE
L0E08E3  JSL   L0E11FE
         BRL   L0E0BDE
L0E08EA  PHY
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E08F6
         INX
L0E08F6  PHX
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   $EB
         LDA   $EB
         BNE   L0E090D
         JSL   L0E0C52
         BRL   L0E0BD5
L0E090D  LDX   #$0000
         LDAL  L05328D
         CMP   $EB
         BNE   L0E0919
         INX
L0E0919  PHX
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0925
         INX
L0E0925  CLC
         ADC   #$0002
         BCC   L0E092C
         INX
L0E092C  STA   $ED
         STX   $EF
         LDA   L055129
         LDX   L05512B
         CMP   [$ED]
         BNE   L0E0940
         LDY   #$0002
         TXA
         CMP   [$ED],Y
L0E0940  BEQ   L0E0947
         LDA   #$0000
         BRA   L0E094A
L0E0947  LDA   #$0001
L0E094A  AND   $01,S
         PLX
         LSR
         BCC   L0E099B
         PHY
         PHY
         PEA   $0019
         TDC
         CLC
         ADC   #$00D3
         PEA   $0000
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
         JSL   L150B22
         PLA
         PLX
         STA   $CD
         LDAL  L05565D
         BEQ   L0E0990
         PEA   $002D
         JSL   L0B0B7A
         JSL   L0E0C52
         BRA   L0E0998
L0E0990  PEI   $D5
         PEI   $D3
         JSL   L0E0CFE
L0E0998  BRL   L0E0BD5
L0E099B  LDA   #$0001
         STA   $C7
         LDA   $EB
         STA   $E9
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E09AF
         INX
L0E09AF  CLC
         ADC   #$0002
         BCC   L0E09B6
         INX
L0E09B6  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E09CF
         INX
L0E09CF  CLC
         ADC   #$000A
         BCC   L0E09D6
         INX
L0E09D6  STA   $ED
         STX   $EF
         PLA
         PLX
         CMP   [$ED]
         BNE   L0E09E6
         LDY   #$0002
         TXA
         CMP   [$ED],Y
L0E09E6  BNE   L0E09F0
         LDA   $E9
         EOR   #$FFFF
         INC
         STA   $E9
L0E09F0  STZ   $E1
         STZ   $E3
         PHY
         PHY
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0A01
         INX
L0E0A01  CLC
         ADC   #$000A
         BCC   L0E0A08
         INX
L0E0A08  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L0E0A29
         BRL   L0E0B7F
L0E0A29  PHY
         PHY
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0A36
         INX
L0E0A36  CLC
         ADC   #$0006
         BCC   L0E0A3D
         INX
L0E0A3D  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $E1
         PLX
         STX   $E3
         LDA   $E1
         ORA   $E3
         BNE   L0E0A5E
         BRL   L0E0B7F
L0E0A5E  LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0A69
         INX
L0E0A69  CLC
         ADC   #$0002
         BCC   L0E0A70
         INX
L0E0A70  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0A89
         INX
L0E0A89  CLC
         ADC   #$000A
         BCC   L0E0A90
         INX
L0E0A90  STA   $ED
         STX   $EF
         PLA
         PLX
         CMP   [$ED]
         BNE   L0E0AA0
         LDY   #$0002
         TXA
         CMP   [$ED],Y
L0E0AA0  BNE   L0E0AAC
         LDA   $E5
         LDX   $E7
         STA   $DB
         STX   $DD
         BRA   L0E0AB4
L0E0AAC  LDA   $E1
         LDX   $E3
         STA   $DB
         STX   $DD
L0E0AB4  PHY
         PHY
         PEI   $DD
         PEI   $DB
         PEI   $EB
         JSL   L0791A7
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDA   $D7
         ORA   $D9
         BNE   L0E0ACF
         BRL   L0E0B7F
L0E0ACF  LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0ADA
         INX
L0E0ADA  CLC
         ADC   #$0002
         BCC   L0E0AE1
         INX
L0E0AE1  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0AFA
         INX
L0E0AFA  CLC
         ADC   #$000A
         BCC   L0E0B01
         INX
L0E0B01  STA   $ED
         STX   $EF
         PLA
         PLX
         CMP   [$ED]
         BNE   L0E0B11
         LDY   #$0002
         TXA
         CMP   [$ED],Y
L0E0B11  BNE   L0E0B17
         STZ   $DF
         BRA   L0E0B2B
L0E0B17  LDX   #$0000
         LDY   #$0004
         LDA   #$4000
         AND   [$D7],Y
         CMP   #$0000
         BEQ   L0E0B28
         INX
L0E0B28  TXA
         STA   $DF
L0E0B2B  PHY
         PEI   $E7
         PEI   $E5
         JSL   L0718FA
         PLA
         STA   $CB
         PHY
         PEI   $E3
         PEI   $E1
         JSL   L0718FA
         PLA
         STA   $C9
         PHY
         PHY
         PEI   $E3
         PEI   $E1
         PEI   $E7
         PEI   $E5
         PEI   $E9
         PEI   $DF
         JSL   L07B038
         PLA
         STA   $CF
         PLX
         STX   $D1
         LDA   $CF
         ORA   $D1
         BEQ   L0E0B6B
         PEI   $D1
         PEI   $CF
         JSL   L0E10BE
         STZ   $C7
L0E0B6B  PEI   $E7
         PEI   $E5
         PEI   $CB
         JSL   L0718DA
         PEI   $E3
         PEI   $E1
         PEI   $C9
         JSL   L0718DA
L0E0B7F  LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0B8A
         INX
L0E0B8A  CLC
         ADC   #$0006
         BCC   L0E0B91
         INX
L0E0B91  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         LDA   #$0024
         CLC
         ADC   $C3
         LDX   $C5
         BCC   L0E0BB1
         INX
L0E0BB1  CLC
         ADC   #$000A
         BCC   L0E0BB8
         INX
L0E0BB8  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
         LDA   $C7
         BEQ   L0E0BD5
         JSL   L0E0C52
L0E0BD5  BRA   L0E0BDE
L0E0BD7  PEA   $1798
         JSL   L07272E
L0E0BDE  LDA   $F6
         BEQ   L0E0BEA
         PEI   $FA
         PEI   $F8
         JSL   L0B12AA
L0E0BEA  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0136
         TCS
         RTL

L0E0BFC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEA   $0001
         JSL   L0E087F
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

L0E0C20  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         BEQ   L0E0C38
         PEA   ^L032E02
         PEA   L032E02
         JSL   L0E0F0F
         BRA   L0E0C42
L0E0C38  PEA   ^L032E3E
         PEA   L032E3E
         JSL   L0E0F0F
L0E0C42  LDA   $08
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

L0E0C52  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L053251
         PEA   L053251
         PEA   $0000
         PEA   $0001
         PEA   $0000
         JSL   L0E07C5
         PLY
         PLY
         PLD
         RTL

L0E0C71  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $16
         PEI   $14
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0011
         JSL   L0E07C5
         LDA   $12
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

L0E0CB5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   $0C
         ORA   $0E
         BNE   L0E0CC9
         JSL   L0E0C52
         BRA   L0E0CEC
L0E0CC9  PHY
         PEI   $0E
         PEI   $0C
         JSL   L0718FA
         PLA
         STA   $01
         LDY   #$0002
         LDA   [$0C],Y
         PHA
         LDA   [$0C]
         PHA
         JSL   L0E10BE
         PEI   $0E
         PEI   $0C
         PEI   $01
         JSL   L0718DA
L0E0CEC  LDA   $0A
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

L0E0CFE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         ORA   $14
         BNE   L0E0D13
         JSL   L0E0C52
         BRL   L0E0DD0
L0E0D13  PEI   $14
         PEI   $12
         JSL   L0718BF
         PHY
         PHY
         LDY   #$0002
         LDA   [$12],Y
         PHA
         LDA   [$12]
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L0E0D30
         INX
L0E0D30  STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L0E0D4B
         BVS   L0E0D49
         EOR   #$8000
L0E0D49  BMI   L0E0D62
L0E0D4B  LDY   #$0002
         LDA   [$12],Y
         PHA
         LDA   [$12]
         PHA
         JSL   L0E10BE
         PEI   $14
         PEI   $12
         JSL   L07185A
         BRA   L0E0DD0
L0E0D62  PEA   $0000
         PEA   $0000
         JSL   L0E0E79
         LDA   L0553C5
         LDX   L0553C7
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0E0D8B
         DEX
L0E0D8B  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDA   $05
         LDX   $07
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0004
         SEP   #$20
         LDA   #$00
         STA   [$01],Y
         REP   #$20
         LDY   #$0005
         SEP   #$20
         LDA   #$00
         STA   [$01],Y
         REP   #$20
         LDA   $12
         LDX   $14
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
L0E0DD0  LDA   $10
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

L0E0DE2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         TDC
         CLC
         ADC   #$000A
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0012
         JSL   L0E07C5
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

L0E0E11  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         JSL   L150488
         STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0012
         JSL   L0E07C5
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

L0E0E4B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         TDC
         CLC
         ADC   #$000A
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $000E
         JSL   L0E07C5
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

L0E0E79  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         TDC
         CLC
         ADC   #$000A
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0012
         JSL   L0E07C5
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

L0E0EA8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PEI   $12
         PEI   $10
         LDA   #$00FF
         AND   [$10]
         JSL   L150488
         JSL   L150F53
         INC
         BNE   L0E0EC5
         INX
L0E0EC5  STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         STA   $05
         SEP   #$20
         LDA   #$00
         STA   [$01]
         REP   #$20
         LDA   $10
         LDX   $12
         INC
         BNE   L0E0EE0
         INX
L0E0EE0  PHX
         PHA
         LDA   #$00FF
         AND   [$10]
         INC
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         JSL   L0E07C5
         LDA   $05
         SEP   #$20
         STA   [$01]
         REP   #$20
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

L0E0F0F  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L071F3F
         LDA   #$00FF
         LDX   #$FFEF
         AND   $00,X
         INC
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         JSL   L0E07C5
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

L0E0F65  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $1C
         PEI   $1A
         PEA   $0008
         JSL   L0313BE
         LDA   $18
         SEC
         SBC   #$0011
         BPL   L0E0F8C
         BRL   L0E10AC
L0E0F8C  CMP   #$0032
         BMI   L0E0F94
         BRL   L0E10AC
L0E0F94  SEC
         SBC   #$0000
         BEQ   L0E0FD3
         DEC
         BEQ   L0E0FEC
         SEC
         SBC   #$0029
         BNE   L0E0FA6
         BRL   L0E1034
L0E0FA6  DEC
         BNE   L0E0FAC
         BRL   L0E103C
L0E0FAC  DEC
         BNE   L0E0FB2
         BRL   L0E1044
L0E0FB2  DEC
         BNE   L0E0FB8
         BRL   L0E104C
L0E0FB8  DEC
         BNE   L0E0FBE
         BRL   L0E107C
L0E0FBE  DEC
         BNE   L0E0FC4
         BRL   L0E1094
L0E0FC4  DEC
         BNE   L0E0FCA
         BRL   L0E1054
L0E0FCA  DEC
         BNE   L0E0FD0
         BRL   L0E1068
L0E0FD0  BRL   L0E10AC
L0E0FD3  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $000C
         JSL   L0E07C5
         BRL   L0E10AC
L0E0FEC  LDA   $16
         BEQ   L0E0FFA
         LDA   $01
         LDX   $03
         STA   $09
         STX   $0B
         BRA   L0E101C
L0E0FFA  PHY
         LDA   $07
         CLC
         ADC   $03
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $0B
         PHY
         LDA   $05
         CLC
         ADC   $01
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $09
L0E101C  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E07C5
         BRA   L0E10AC
L0E1034  PEI   $01
         JSL   L0E0E11
         BRA   L0E10AC
L0E103C  PEI   $03
         JSL   L0E0E11
         BRA   L0E10AC
L0E1044  PEI   $05
         JSL   L0E0E11
         BRA   L0E10AC
L0E104C  PEI   $07
         JSL   L0E0E11
         BRA   L0E10AC
L0E1054  PHY
         PEA   $0000
         LDA   $07
         SEC
         SBC   $03
         PHA
         JSL   L072FA6
         JSL   L0E0E11
         BRA   L0E10AC
L0E1068  PHY
         PEA   $0000
         LDA   $05
         SEC
         SBC   $01
         PHA
         JSL   L072FA6
         JSL   L0E0E11
         BRA   L0E10AC
L0E107C  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E07C5
         BRA   L0E10AC
L0E1094  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E07C5
         BRA   L0E10AC
L0E10AC  LDA   $14
         STA   $1C
         LDA   $13
         STA   $1B
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0E10BE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L0E10DA
         INX
L0E10DA  PHX
         PHA
         PEA   $0000
         JSL   L0E07C5
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

L0E10F4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0010
         BCC   L0E1109
         INX
L0E1109  STA   $11
         STX   $13
         LDA   [$11]
         BEQ   L0E1129
         LDA   L0553B5
         LDX   L0553B7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         JSL   L0718BF
L0E1129  PHY
         PHY
         LDAL  L051BE2
         PHA
         JSL   L0B289E
         PLA
         STA   $05
         PLX
         STX   $07
L0E113A  LDAL  L051BDE
         DEC
         DEC
         BEQ   L0E1194
         LDAL  L051BE4
         STA   $03
         LDA   $03
         BPL   L0E1175
         LDA   L0553CD
         LDX   L0553CF
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   $03
         JSL   L150488
         JSL   L1512A5
         STA   $0D
         STX   $0F
         LDA   #$00FF
         AND   [$0D]
         STA   $03
L0E1175  PHY
         PHY
         LDAL  L051BE2
         PHA
         JSL   L0B289E
         LDA   $03
         JSL   L150488
         JSL   L150F53
         STA   $09
         STX   $0B
         JSL   L0B0000
         BRA   L0E113A
L0E1194  LDA   #$00FF
         AND   [$09]
         CMP   #$0022
         BNE   L0E11AA
         LDA   $09
         LDX   $0B
         INC
         BNE   L0E11A6
         INX
L0E11A6  STA   $09
         STX   $0B
L0E11AA  LDA   #$00FF
         AND   [$09]
         STA   $01
         SEP   #$20
         LDA   #$00
         STA   [$09]
         REP   #$20
         PEI   $07
         PEI   $05
         JSL   L0E10BE
         LDA   $01
         SEP   #$20
         STA   [$09]
         REP   #$20
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0010
         BCC   L0E11D6
         INX
L0E11D6  STA   $11
         STX   $13
         LDA   [$11]
         BEQ   L0E11F6
         LDA   L0553B5
         LDX   L0553B7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         JSL   L1516B7
L0E11F6  TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L0E11FE  PHD
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

L0E1220  ENT
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
         JSL   L0B369F
         JSL   L0E0F0F
         JSL   L0B0000
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L0E1248  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   #$FFFF
         STA   $1E
         STZ   $0F
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$000A
         BCC   L0E1264
         INX
L0E1264  STA   $11
         STX   $13
         LDA   #$0000
         STA   [$11]
         LDX   #$0000
         LDA   #$0012
         CMPL  L051BDE
         BNE   L0E127A
         INX
L0E127A  TXA
         STA   $0B
         LDX   #$0000
         LDA   #$0013
         CMPL  L051BDE
         BNE   L0E128A
         INX
L0E128A  TXA
         STA   $09
         LDAL  L051BE0
         STA   $05
         JSL   L0B0000
         LDY   #$00FA
         LDA   [$1A],Y
         BEQ   L0E12CC
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BEQ   L0E12AB
         INX
L0E12AB  TXA
         BNE   L0E12BE
         LDX   #$0000
         LDA   #$0007
         CMPL  L051BE0
         BEQ   L0E12BB
         INX
L0E12BB  TXA
         BEQ   L0E12C8
L0E12BE  PEA   $0053
         JSL   L0B0B7A
         BRL   L0E15F3
L0E12C8  JSL   L0B0000
L0E12CC  LDA   #$0077
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L0E12D7
         INX
L0E12D7  CLC
         ADC   #$0050
         BCC   L0E12DE
         INX
L0E12DE  STA   $11
         STX   $13
         LDA   #$0000
         STA   [$11]
         LDA   $0B
         BEQ   L0E12F7
         PHA
         LDY   #$00FA
         LDA   [$1A],Y
         EOR   #$0001
         AND   $01,S
         PLX
L0E12F7  CMP   #$0000
         BNE   L0E130F
         LDA   $09
         BEQ   L0E1307
         PHA
         LDY   #$00FA
         PLA
         AND   [$1A],Y
L0E1307  CMP   #$0000
         BNE   L0E130F
         BRL   L0E14A8
L0E130F  LDA   L0553C3
         STA   $0D
         LDA   L05539B
         STA   $07
         LDA   #$0001
         STA   L05539B
         LDA   L05539D
         DEC
         STA   L05539D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2A02
         LDY   #$00FA
         LDA   [$1A],Y
         BNE   L0E133D
         BRL   L0E13CB
L0E133D  LDA   #$0077
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L0E1348
         INX
L0E1348  CLC
         ADC   #$0050
         BCC   L0E134F
         INX
L0E134F  PHX
         PHA
         PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0080
         BCC   L0E136B
         INX
L0E136B  PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L0E1377
         DEX
L0E1377  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $11
         STX   $13
         LDA   [$11]
         PHA
         JSL   L0B4D5D
         PLA
         BEQ   L0E13AA
         PHA
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0E13A6
         INX
L0E13A6  TXA
         AND   $01,S
         PLX
L0E13AA  PHA
         PLA
         BEQ   L0E13C0
         PHA
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BNE   L0E13BC
         INX
L0E13BC  TXA
         AND   $01,S
         PLX
L0E13C0  PLX
         STX   $11
         PLX
         STX   $13
         STA   [$11]
         BRL   L0E1467
L0E13CB  LDA   #$0077
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L0E13D6
         INX
L0E13D6  CLC
         ADC   #$0050
         BCC   L0E13DD
         INX
L0E13DD  PHX
         PHA
         PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0018
         BCC   L0E13F9
         INX
L0E13F9  PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L0E1405
         DEX
L0E1405  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $11
         STX   $13
         LDA   [$11]
         PHA
         JSL   L0B4D5D
         PLA
         BEQ   L0E145F
         PHA
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0E1433
         INX
L0E1433  TXA
         BNE   L0E1447
         PHA
         LDX   #$0000
         LDAL  L032B4C
         CMP   $05
         BNE   L0E1443
         INX
L0E1443  TXA
         ORA   $01,S
         PLX
L0E1447  PHA
         PLA
         BNE   L0E145C
         PHA
         LDX   #$0000
         LDAL  L032B4E
         CMP   $05
         BNE   L0E1458
         INX
L0E1458  TXA
         ORA   $01,S
         PLX
L0E145C  AND   $01,S
         PLX
L0E145F  PLX
         STX   $11
         PLX
         STX   $13
         STA   [$11]
L0E1467  LDA   L05539D
         INC
         STA   L05539D
         LDA   $07
         STA   L05539B
         STZ   L0553A5
         LDA   #$0077
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L0E1481
         INX
L0E1481  CLC
         ADC   #$0050
         BCC   L0E1488
         INX
L0E1488  STA   $11
         STX   $13
         LDA   [$11]
         BEQ   L0E149B
         LDA   L0553C3
         SEC
         SBC   $0D
         STA   $0F
         BRL   L0E15B9
L0E149B  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2965
L0E14A8  LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BEQ   L0E14B4
         INX
L0E14B4  TXA
         BNE   L0E14BA
         BRL   L0E15B9
L0E14BA  LDY   #$00FA
         LDA   [$1A],Y
         BEQ   L0E14D3
         PHA
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0E14CF
         INX
L0E14CF  TXA
         AND   $01,S
         PLX
L0E14D3  PHA
         PLA
         BEQ   L0E14E9
         PHA
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BNE   L0E14E5
         INX
L0E14E5  TXA
         AND   $01,S
         PLX
L0E14E9  EOR   #$0001
         CMP   #$0000
         BNE   L0E14F4
         BRL   L0E15B9
L0E14F4  PHY
         PEA   $0000
         JSL   L0B7A56
         PLA
         LSR
         BCS   L0E152D
         LDAL  L051BDE
         SEC
         SBC   #$000E
         BEQ   L0E1517
         BVS   L0E150F
         EOR   #$8000
L0E150F  BPL   L0E1517
         JSL   L0E1220
         BRA   L0E152D
L0E1517  PEA   $0040
         PEA   ^L04050E
         PEA   L04050E
         PEA   ^L0509EA
         PEA   L0509EA
         JSL   L0B0897
         BRL   L0E15F3
L0E152D  LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0E153A
         INX
L0E153A  TXA
         BEQ   L0E1565
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0E154A
         INX
L0E154A  TXA
         BEQ   L0E1565
         JSL   L0B0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0E1563
         PEA   $0054
         JSL   L0B0B7A
         BRL   L0E15F3
L0E1563  BRA   L0E15B1
L0E1565  LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0E1571
         INX
L0E1571  TXA
         BNE   L0E15B1
         LDY   #$00FA
         LDA   [$1A],Y
         BEQ   L0E158D
         PHA
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0E1589
         INX
L0E1589  TXA
         AND   $01,S
         PLX
L0E158D  PHA
         PLA
         BEQ   L0E15A3
         PHA
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BNE   L0E159F
         INX
L0E159F  TXA
         AND   $01,S
         PLX
L0E15A3  CMP   #$0000
         BNE   L0E15B1
         PEA   $0055
         JSL   L0B0B7A
         BRA   L0E15F3
L0E15B1  LDA   $0F
         INC
         STA   $0F
         BRL   L0E14A8
L0E15B9  LDY   #$00FA
         LDA   [$1A],Y
         BEQ   L0E15EF
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BEQ   L0E15CD
         INX
L0E15CD  PHX
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BEQ   L0E15DB
         INX
L0E15DB  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0E15EB
         PEA   $0033
         JSL   L0B0B7A
         BRA   L0E15F3
L0E15EB  JSL   L0B0000
L0E15EF  LDA   $0F
         STA   $1E
L0E15F3  LDA   $18
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

L0E1605  PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0015
         TCD
         STZ   $FC
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E161D
         INX
L0E161D  CLC
         ADC   #$001E
         BCC   L0E1624
         INX
L0E1624  STA   $EF
         STX   $F1
         PHY
         PEA   $0000
         PEI   $F8
         JSL   L0E1248
         PLA
         STA   [$EF]
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1640
         INX
L0E1640  CLC
         ADC   #$001E
         BCC   L0E1647
         INX
L0E1647  STA   $EF
         STX   $F1
         LDA   [$EF]
         SEC
         SBC   #$0000
         BPL   L0E1656
         BRL   L0E183F
L0E1656  LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1661
         INX
L0E1661  STA   L0553B9
         STX   L0553BB
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1672
         INX
L0E1672  CLC
         ADC   #$003A
         BCC   L0E1679
         INX
L0E1679  PHX
         PHA
         PEA   $0001
         JSL   L0B2AF9
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$000A
         BCC   L0E168F
         INX
L0E168F  STA   $EF
         STX   $F1
         LDA   #$0000
         STA   [$EF]
         JSL   L0B0000
         LDAL  L051BE4
         TAX
         LDAL  L051BE2
         LDY   #$0077
         STA   [$F8],Y
         INY
         INY
         TXA
         STA   [$F8],Y
         JSL   L0B0000
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E16BE
         INX
L0E16BE  CLC
         ADC   #$0010
         BCC   L0E16C5
         INX
L0E16C5  PHX
         PHA
         JSL   L0B199C
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E16D6
         INX
L0E16D6  CLC
         ADC   #$001E
         BCC   L0E16DD
         INX
L0E16DD  STA   $EF
         STX   $F1
         LDA   [$EF]
         BNE   L0E16E8
         BRL   L0E1769
L0E16E8  LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E16F3
         INX
L0E16F3  CLC
         ADC   #$0010
         BCC   L0E16FA
         INX
L0E16FA  PHX
         PHA
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1707
         INX
L0E1707  CLC
         ADC   #$001E
         BCC   L0E170E
         INX
L0E170E  STA   $EF
         STX   $F1
         LDA   [$EF]
         PHA
         JSL   L0B1C2B
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1724
         INX
L0E1724  CLC
         ADC   #$001E
         BCC   L0E172B
         INX
L0E172B  STA   $EF
         STX   $F1
         LDA   [$EF]
         STA   $EB
         LDA   #$0001
         SEC
         SBC   $EB
         BEQ   L0E1742
         BVS   L0E1740
         EOR   #$8000
L0E1740  BMI   L0E1769
L0E1742  LDA   $EB
         STA   $ED
L0E1746  LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1751
         INX
L0E1751  CLC
         ADC   #$0010
         BCC   L0E1758
         INX
L0E1758  PHX
         PHA
         PEI   $ED
         JSL   L0B3CD4
         LDA   $ED
         DEC
         BEQ   L0E1769
         DEC   $ED
         BRA   L0E1746
L0E1769  STZ   $ED
L0E176B  LDAL  L051BDE
         DEC
         DEC
         BNE   L0E1776
         BRL   L0E183A
L0E1776  LDA   $ED
         INC
         STA   $ED
         PEI   $ED
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E1788
         INX
L0E1788  CLC
         ADC   #$001E
         BCC   L0E178F
         INX
L0E178F  STA   $EF
         STX   $F1
         PLA
         SEC
         SBC   [$EF]
         BEQ   L0E17BB
         BVS   L0E179E
         EOR   #$8000
L0E179E  BPL   L0E17BB
         LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E17AB
         INX
L0E17AB  CLC
         ADC   #$0010
         BCC   L0E17B2
         INX
L0E17B2  PHX
         PHA
         PEA   $0001
         JSL   L0B1C2B
L0E17BB  LDAL  L051BDE
         SEC
         SBC   #$000E
         BVS   L0E17C8
         EOR   #$8000
L0E17C8  BMI   L0E17D3
         PEA   $0004
         JSL   L0B0B7A
         BRA   L0E183F
L0E17D3  LDA   #$0077
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0E17DE
         INX
L0E17DE  CLC
         ADC   #$0010
         BCC   L0E17E5
         INX
L0E17E5  PHX
         PHA
         PEI   $ED
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L0B369F
         JSL   L0B3DB3
         JSL   L0B0000
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0E180B
         INX
L0E180B  PHX
         LDX   #$0000
         LDA   #$0003
         CMPL  L051BE0
         BNE   L0E1819
         INX
L0E1819  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0E1826
         JSL   L0B0000
         BRA   L0E1837
L0E1826  LDAL  L051BDE
         DEC
         DEC
         BEQ   L0E1837
         PEA   $0055
         JSL   L0B0B7A
         BRA   L0E183F
L0E1837  BRL   L0E176B
L0E183A  LDA   #$0001
         STA   $FC
L0E183F  LDA   $F6
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

L0E1851  PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         STZ   $1C
         LDAL  L051BE0
         STA   $07
         LDAL  L051BE4
         TAX
         LDAL  L051BE2
         STA   $09
         STX   $0B
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$000A
         BCC   L0E187B
         INX
L0E187B  STA   $0F
         STX   $11
         LDA   #$0000
         STA   [$0F]
         JSL   L0B0000
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0E1895
         INX
L0E1895  PHX
         LDX   #$0000
         LDA   #$0007
         CMPL  L051BE0
         BNE   L0E18A3
         INX
L0E18A3  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0E18B4
         PEA   $0053
         JSL   L0B0B7A
         BRL   L0E1971
L0E18B4  JSL   L0B0000
         LDA   L0553D1
         LDX   L0553D3
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0080
         BCC   L0E18D1
         INX
L0E18D1  PHX
         PHA
         LDA   $07
         JSL   L150488
         TAY
         BNE   L0E18DD
         DEX
L0E18DD  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $0F
         STX   $11
         LDA   [$0F]
         STA   $05
         LDA   $07
         DEC
         ASL
         ASL
         TAX
         LDAL  L032B52+2,X
*         PHA
         sta   $03
         LDAL  L032B52,X
*         PLX
         STA   $01
*         STX   $03
         LDA   #$FFFF
         CMP   $05
         BEQ   L0E1935
         LDA   L055399
         STA   $0D
         STZ   L055399
         PHY
         PEI   $05
         JSL   L0B4D5D
         PLA
         LSR
         BCS   L0E1930
         PEI   $0B
         PEI   $09
         JSL   L0B4FA3
         BRA   L0E1971
L0E1930  LDA   $0D
         STA   L055399
L0E1935  LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BEQ   L0E1942
         INX
L0E1942  PHX
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BEQ   L0E1950
         INX
L0E1950  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0E1960
         PEA   $0033
         JSL   L0B0B7A
         BRA   L0E1971
L0E1960  JSL   L0B0000
         LDA   #$0001
         STA   $1C
         PEI   $03
         PEI   $01
         JSL   L0B510B
L0E1971  LDA   $16
         STA   $1A
         LDA   $15
         STA   $19
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L0E1983  PHD
         TSC
         CLC
         ADC   #$FEEC
         TCS
         ADC   #$0021
         TCD
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$000A
         BCC   L0E199B
         INX
L0E199B  STA   $EF
         STX   $F1
         LDA   #$0000
         STA   [$EF]
         LDA   L0553D1
         LDX   L0553D3
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         CLC
         ADC   #$0018
         BCC   L0E19BD
         INX
L0E19BD  PHX
         PHA
         LDAL  L051BE0
         JSL   L150488
         TAY
         BNE   L0E19CB
         DEX
L0E19CB  DEC
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
         LDA   [$EF]
         STA   $E7
         LDAL  L051BE0
         DEC
         ASL
         ASL
         TAX
         LDAL  L032A78+2,X
         PHA
         LDAL  L032A78,X
         PLX
         STA   $E3
         STX   $E5
         LDAL  L051BE0
         STA   $E1
         LDAL  L051BE4
         TAX
         LDAL  L051BE2
         STA   $E9
         STX   $EB
         JSL   L0B0000
         PHY
         PEI   $E7
         JSL   L0B4D5D
         PLA
         BEQ   L0E1A54
         PHA
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0E1A2A
         INX
L0E1A2A  TXA
         BNE   L0E1A51
         PHA
         LDX   #$0000
         LDAL  L032B4C
         CMP   $E1
         BNE   L0E1A3A
         INX
L0E1A3A  TXA
         BNE   L0E1A4E
         PHA
         LDX   #$0000
         LDAL  L032B4E
         CMP   $E1
         BNE   L0E1A4A
         INX
L0E1A4A  TXA
         ORA   $01,S
         PLX
L0E1A4E  ORA   $01,S
         PLX
L0E1A51  AND   $01,S
         PLX
L0E1A54  STA   $DF
         LDA   $DF
         BEQ   L0E1A9A
         LDX   #$0000
         LDAL  L032B48
         CMP   $E1
         BEQ   L0E1A66
         INX
L0E1A66  PHX
         LDX   #$0000
         LDAL  L032B4A
         CMP   $E1
         BEQ   L0E1A73
         INX
L0E1A73  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0E1A7E
         JSL   L0B2AC6
L0E1A7E  PEI   $E5
         PEI   $E3
         JSL   L0B510B
         LDY   #$00E9
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0000
         JSL   L0B2AF9
         BRA   L0E1AC5
L0E1A9A  PEI   $EB
         PEI   $E9
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B1388
         PEA   $0040
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEA   $0073
         JSL   L0B127A
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0897
L0E1AC5  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$011A
         TCS
         RTL

L0E1AD7  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0077
         CLC
         ADC   $0E
         LDX   $10
         BCC   L0E1AEA
         INX
L0E1AEA  STA   $01
         STX   $03
         LDA   L0553B9
         LDX   L0553BB
         LDY   #$0008
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   L055391
         LDY   #$0004
         STA   [$01],Y
         LDA   L055371
         LDY   #$0006
         STA   [$01],Y
         LDA   #$0020
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E1B19
         INX
L0E1B19  PHX
         PHA
         PEA   ^L051054
         PEA   L051054
         PEA   $0018
         JSL   L0313BE
         STZ   L055393
         STZ   L055397
         LDA   #$8001
         STA   L055395
         LDA   L0553BD
         LDX   L0553BF
         LDY   #$000C
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0000
         LDY   #$0050
         STA   [$01],Y
         LDA   $0C
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

L0E1B5E  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   ^L0509EA
         PEA   L0509EA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B369F
         PEA   $0100
         JSL   L0313BE
         PHY
         PEA   ^L0509EA
         PEA   L0509EA
         JSL   L032E6D
         PLA
         STA   L055365
         LDY   #$00FA
         LDA   [$F8],Y
         BEQ   L0E1BA3
         LDA   L055365
         EOR   #$FFFF
         INC
         STA   L055365
L0E1BA3  LDA   $F6
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

L0E1BB5  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$00ED
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   L0553B9
         STX   L0553BB
         LDY   #$00E9
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0000
         JSL   L0B2AF9
         LDY   #$00EF
         LDA   [$0A],Y
         PHA
         JSL   L0B2BBB
         PEA   $0000
         PEI   $0A
         JSL   L0E1B5E
         LDA   #$0000
         LDY   #$00E3
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

L0E1C0B  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         JSL   L0B26E7
         PLA
         STA   $0B
         LDA   $0B
         STA   $1A
         LDA   $0B
         BNE   L0E1C26
         BRL   L0E1E32
L0E1C26  LDA   $0B
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E1C3C
         INX
L0E1C3C  STA   $01
         STX   $03
         LDA   #$0018
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E1C4B
         INX
L0E1C4B  STA   $0D
         STX   $0F
         PHY
         PHY
         JSL   L0B1792
         PLA
         STA   [$0D]
         PLA
         LDY   #$0002
         STA   [$0D],Y
         LDY   #$0018
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0E1C75
         PEA   $002D
         JSL   L0B0B7A
         STZ   $1A
         BRL   L0E1E32
L0E1C75  PHY
         LDY   #$001A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718FA
         PLA
         STA   $05
         LDY   #$001A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDA   #$001E
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E1CAB
         INX
L0E1CAB  PHX
         PHA
         JSL   L0B49A2
         LDY   #$001A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         PEI   $05
         JSL   L0718DA
         PHY
         PEI   $03
         PEI   $01
         JSL   L0B33DE
         PLA
         LSR
         BCS   L0E1CE1
         PEA   $0002
         LDY   #$001A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L150D44
L0E1CE1  PEI   $03
         PEI   $01
         PEA   ^L051054
         PEA   L051054
         PEA   $0018
         JSL   L0313BE
         LDA   #$0000
         LDY   #$001C
         STA   [$01],Y
         LDA   #$0000
         LDY   #$0022
         STA   [$01],Y
         LDA   #$0000
         TAX
         LDY   #$0024
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0000
         TAX
         LDY   #$0028
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDX   #$0000
         LDA   #$0004
         CMP   [$01]
         BNE   L0E1D29
         INX
L0E1D29  PHX
         LDY   #$0014
         LDA   [$01],Y
         BEQ   L0E1D34
         LDA   #$0001
L0E1D34  PHA
         LDY   #$0016
         LDA   [$01],Y
         BEQ   L0E1D3F
         LDA   #$0001
L0E1D3F  ORA   $01,S
         PLX
         AND   $01,S
         PLX
         LSR
         BCS   L0E1D4B
         BRL   L0E1E32
L0E1D4B  LDA   #$00D3
         CLC
         ADC   $16
         LDX   $18
         BCC   L0E1D56
         INX
L0E1D56  STA   $0D
         STX   $0F
         PHY
         JSL   L150B6A
         PLA
         STA   [$0D]
         STZ   $07
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L0E1D76
         CPX   L05503B
L0E1D76  BNE   L0E1D7F
         LDA   L05503D
         STA   $09
         BRA   L0E1DB8
L0E1D7F  LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L05502B
         BNE   L0E1D91
         CPX   L05502D
L0E1D91  BNE   L0E1D9A
         LDA   L05502F
         STA   $09
         BRA   L0E1DB8
L0E1D9A  PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0D0CD8
         PLA
         STA   $09
         LDA   $09
         BNE   L0E1DB3
         BRA   L0E1E32
L0E1DB3  LDA   #$0001
         STA   $07
L0E1DB8  LDY   #$0014
         LDA   [$01],Y
         BEQ   L0E1DEB
         LDA   #$0024
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E1DCA
         INX
L0E1DCA  STA   $0D
         STX   $0F
         PHY
         PHY
         PEA   $801E
         LDY   #$0014
         LDA   [$01],Y
         PHA
         PEI   $09
         PEA   $0001
         JSL   L0B4FF1
         PLA
         STA   [$0D]
         PLA
         LDY   #$0002
         STA   [$0D],Y
L0E1DEB  LDY   #$0016
         LDA   [$01],Y
         BEQ   L0E1E1E
         LDA   #$0028
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E1DFD
         INX
L0E1DFD  STA   $0D
         STX   $0F
         PHY
         PHY
         PEA   $801F
         LDY   #$0016
         LDA   [$01],Y
         PHA
         PEI   $09
         PEA   $0001
         JSL   L0B4FF1
         PLA
         STA   [$0D]
         PLA
         LDY   #$0002
         STA   [$0D],Y
L0E1E1E  LDA   $07
         BEQ   L0E1E28
         PEI   $09
         JSL   L150B5E
L0E1E28  LDY   #$00D3
         LDA   [$16],Y
         PHA
         JSL   L150B70
L0E1E32  LDA   $14
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

L0E1E44  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         STZ   $2A
         LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E1E59
         INX
L0E1E59  CLC
         ADC   #$003A
         BCC   L0E1E60
         INX
L0E1E60  STA   $15
         STX   $17
         LDA   #$000C
         CLC
         ADC   $15
         LDX   $17
         BCC   L0E1E6F
         INX
L0E1E6F  STA   $1D
         STX   $1F
         PHY
         JSL   L0D0BE0
         PLA
         STA   [$1D]
         LDY   #$000C
         LDA   [$15],Y
         BNE   L0E1E9E
         LDA   #$000C
         CLC
         ADC   $15
         LDX   $17
         BCC   L0E1E8D
         INX
L0E1E8D  STA   $1D
         STX   $1F
         PHY
         PEA   $0000
         PEI   $26
         JSL   L0E1C0B
         PLA
         STA   [$1D]
L0E1E9E  LDY   #$000C
         LDA   [$15],Y
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E1EB7
         INX
L0E1EB7  PHX
         PHA
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         LDA   #$000E
         CLC
         ADC   $15
         LDX   $17
         BCC   L0E1ECD
         INX
L0E1ECD  PHX
         PHA
         JSL   L0B4275
         LDY   #$000E
         LDA   [$15],Y
         BNE   L0E1EDD
         BRL   L0E21BD
L0E1EDD  LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E1EE8
         INX
L0E1EE8  CLC
         ADC   #$003A
         BCC   L0E1EEF
         INX
L0E1EEF  STA   $11
         STX   $13
         LDA   #$0001
         LDY   #$0008
         STA   [$11],Y
         LDA   #$0000
         LDY   #$000A
         STA   [$11],Y
         LDA   #$0001
         LDY   #$0010
         STA   [$11],Y
         LDY   #$000C
         LDA   [$11],Y
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E1F24
         INX
L0E1F24  STA   $0D
         STX   $0F
         LDY   #$001A
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         STA   [$11]
         TXA
         LDY   #$0002
         STA   [$11],Y
         LDY   #$001C
         LDA   [$0D],Y
         INC
         LDY   #$001C
         STA   [$0D],Y
         LDA   $19
         LDX   $1B
         STA   $09
         STX   $0B
         LDY   #$000A
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         LDY   #$0004
         STA   [$11],Y
         INY
         INY
         TXA
         STA   [$11],Y
         LDY   #$000C
         LDA   [$09],Y
         INC
         LDY   #$000C
         STA   [$09],Y
         PEA   $0000
         PEI   $26
         JSL   L0E1AD7
         PHY
         PEA   $0000
         PEI   $26
         JSL   L0E1605
         PLA
         LSR
         BCS   L0E1F8B
         LDA   #$0001
         STA   $2A
         BRL   L0E21A2
L0E1F8B  PEA   $0002
         JSL   L0E0838
         LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E1F9D
         INX
L0E1F9D  CLC
         ADC   #$0010
         BCC   L0E1FA4
         INX
L0E1FA4  STA   L0553BD
         STX   L0553BF
         JSL   L0B2AC6
L0E1FAE  LDX   #$0000
         LDA   L055397
         BNE   L0E1FB7
         INX
L0E1FB7  PHX
         PHY
         JSL   L07005C
         PLA
         ORA   L0553A5
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCS   L0E1FCD
         BRL   L0E20CE
L0E1FCD  LDA   L055393
         BNE   L0E2035
L0E1FD2  LDAL  L051BDE
         DEC
         DEC
         BEQ   L0E1FE0
         JSL   L0B0000
         BRA   L0E1FD2
L0E1FE0  JSL   L0B0000
L0E1FE4  LDX   #$0000
         LDA   #$0007
         CMP   L05536F
         BNE   L0E1FF0
         INX
L0E1FF0  TXA
         BNE   L0E202F
         LDX   #$0000
         LDA   #$0005
         CMP   L05536F
         BNE   L0E1FFF
         INX
L0E1FFF  TXA
         BEQ   L0E202A
         PHA
         LDX   #$0000
         LDA   #$0009
         CMPL  L051BDE
         BNE   L0E2010
         INX
L0E2010  TXA
         BEQ   L0E2024
         PHA
         LDX   #$0000
         LDAL  L051BE0
         DEC
         DEC
         BNE   L0E2020
         INX
L0E2020  TXA
         AND   $01,S
         PLX
L0E2024  EOR   #$0001
         AND   $01,S
         PLX
L0E202A  CMP   #$0000
         BEQ   L0E2035
L0E202F  JSL   L0E0154
         BRA   L0E1FE4
L0E2035  LDAL  L051BDE
         DEC
         DEC
         BNE   L0E2047
         PEA   $0054
         JSL   L0B0B7A
         BRL   L0E20CE
L0E2047  LDA   L055395
         SEC
         SBC   L055371
         BVS   L0E2053
         EOR   #$8000
L0E2053  BPL   L0E205B
         LDA   #$8001
         STA   L055395
L0E205B  STZ   L055393
         LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E2069
         INX
L0E2069  STA   L0553B9
         STX   L0553BB
         LDA   #$0009
         CMPL  L051BDE
         BNE   L0E2090
         LDAL  L051BE0
         DEC
         ASL
         ASL
         TAX
         LDAL  L032A48+2,X
         PHA
         LDAL  L032A48,X
         PHA
         JSL   L0B422F
         BRA   L0E20CB
L0E2090  LDA   #$8001
         CMP   L055395
         BNE   L0E20CB
         PHY
         PEA   $0000
         JSL   L0E2DD3
         PLA
         LSR
         BCS   L0E20AA
         LDA   #$0001
         STA   L055397
L0E20AA  PEA   ^L051054
         PEA   L051054
         LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E20BB
         INX
L0E20BB  CLC
         ADC   #$0020
         BCC   L0E20C2
         INX
L0E20C2  PHX
         PHA
         PEA   $0018
         JSL   L0313BE
L0E20CB  BRL   L0E1FAE
L0E20CE  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L0E20DD
         JSL   L0B292B
         BRA   L0E211E
L0E20DD  LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E20E8
         INX
L0E20E8  STA   $05
         STX   $07
         LDY   #$0004
         LDA   [$05],Y
         CMP   L055391
         BEQ   L0E20FE
         LDY   #$0004
         LDA   [$05],Y
         STA   L055391
L0E20FE  LDY   #$0006
         LDA   [$05],Y
         CMP   L055371
         BEQ   L0E2110
         LDY   #$0006
         LDA   [$05],Y
         STA   L055371
L0E2110  LDA   #$8001
         CMP   L055395
         BEQ   L0E211E
         LDA   #$8001
         STA   L055395
L0E211E  LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E2129
         INX
L0E2129  STA   $01
         STX   $03
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E2138
         INX
L0E2138  CMP   L0553BD
         BNE   L0E2140
         CPX   L0553BF
L0E2140  BEQ   L0E2149
         PEA   $18A4
         JSL   L07272E
L0E2149  LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L0E2154
         INX
L0E2154  PHX
         PHA
         JSL   L0B0E1B
         LDY   #$000E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   L0553BD
         STX   L0553BF
         LDX   #$0000
         LDA   L055397
         DEC
         BNE   L0E2174
         INX
L0E2174  TXA
         BNE   L0E217F
         PHY
         JSL   L07005C
         PLA
         BEQ   L0E2199
L0E217F  LDA   #$0001
         STA   $2A
         LDY   #$00FA
         LDA   [$26],Y
         BEQ   L0E2197
         LDA   L0553A7
         LDX   L0553A9
         PHX
         PHA
         JSL   L0E0CB5
L0E2197  BRA   L0E21A2
L0E2199  PEA   $0000
         PEI   $26
         JSL   L0E1BB5
L0E21A2  LDA   #$0077
         CLC
         ADC   $26
         LDX   $28
         BCC   L0E21AD
         INX
L0E21AD  CLC
         ADC   #$003A
         BCC   L0E21B4
         INX
L0E21B4  PHX
         PHA
         JSL   L0B0F05
         STZ   L055397
L0E21BD  LDA   $24
         STA   $28
         LDA   $23
         STA   $27
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L0E21CF  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $14
         STZ   $16
         LDA   #$0000
         LDY   #$00D1
         STA   [$10],Y
         LDA   #$0000
         LDY   #$00D7
         STA   [$10],Y
         STZ   $03
         STZ   $05
         LDA   #$00D3
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E21FA
         INX
L0E21FA  STA   $07
         STX   $09
         PHY
         JSL   L150B6A
         PLA
         STA   [$07]
         LDY   #$00FA
         LDA   [$10],Y
         BEQ   L0E2217
         LDA   #$801F
         LDY   #$00E1
         STA   [$10],Y
         BRA   L0E221F
L0E2217  LDA   #$801E
         LDY   #$00E1
         STA   [$10],Y
L0E221F  LDA   #$0005
         CMPL  L051054
         BNE   L0E22A2
         LDA   L055271
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E223B
         INX
L0E223B  STA   $07
         STX   $09
         PHY
         PEA   $FFFF
         JSL   L1506E1
         PLA
         STA   [$07]
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         PEA   ^L0509EA
         PEA   L0509EA
         PEA   ^L055271
         PEA   L055271
         LDA   #$00DB
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E2268
         INX
L0E2268  PHX
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L0E228F
         PHY
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         LDY   #$00DD
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L15041C
         PLA
         STA   $03
         PLX
         STX   $05
L0E228F  LDA   #$FFFF
         LDY   #$00D9
         STA   [$10],Y
         LDA   L055271
         LDY   #$00DF
         STA   [$10],Y
         BRL   L0E24CC
L0E22A2  LDA   L055039
         LDX   L05503B
         CMPL  L051056
         BNE   L0E22B3
         TXA
         CMPL  L051058
L0E22B3  BEQ   L0E22B8
         BRL   L0E2358
L0E22B8  LDA   L05503D
         BNE   L0E22C0
         BRL   L0E24CC
L0E22C0  LDA   L05503D
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E22D3
         INX
L0E22D3  STA   $07
         STX   $09
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   [$07]
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         PEA   ^L0509EA
         PEA   L0509EA
         PEA   ^L05503D
         PEA   L05503D
         LDA   #$00DB
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E2300
         INX
L0E2300  PHX
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L0E2327
         PHY
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         LDY   #$00DD
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L15041C
         PLA
         STA   $03
         PLX
         STX   $05
L0E2327  LDY   #$00DD
         LDA   [$10],Y
         TAX
         DEY
         DEY
         LDA   [$10],Y
         LDY   #$00C9
         STA   [$10],Y
         INY
         INY
         TXA
         STA   [$10],Y
         LDY   #$00E1
         LDA   [$10],Y
         LDY   #$00CD
         STA   [$10],Y
         LDA   #$0001
         LDY   #$00D9
         STA   [$10],Y
         LDA   L05503D
         LDY   #$00DF
         STA   [$10],Y
         BRL   L0E24CC
L0E2358  LDA   L05502B
         LDX   L05502D
         CMPL  L051056
         BNE   L0E2369
         TXA
         CMPL  L051058
L0E2369  BEQ   L0E236E
         BRL   L0E23F0
L0E236E  LDA   L05502F
         BNE   L0E2376
         BRL   L0E24CC
L0E2376  LDA   L05502F
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E2389
         INX
L0E2389  STA   $07
         STX   $09
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   [$07]
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         PEA   ^L0509EA
         PEA   L0509EA
         PEA   ^L05502F
         PEA   L05502F
         LDA   #$00DB
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E23B6
         INX
L0E23B6  PHX
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L0E23DD
         PHY
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         LDY   #$00DD
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L15041C
         PLA
         STA   $03
         PLX
         STX   $05
L0E23DD  LDA   #$0001
         LDY   #$00D9
         STA   [$10],Y
         LDA   L05502F
         LDY   #$00DF
         STA   [$10],Y
         BRL   L0E24CC
L0E23F0  LDA   #$00D5
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E23FB
         INX
L0E23FB  STA   $07
         STX   $09
         PHY
         LDAL  L051058
         PHA
         LDAL  L051056
         PHA
         JSL   L0D0CD8
         PLA
         STA   [$07]
         LDY   #$00D5
         LDA   [$10],Y
         BNE   L0E241F
         JSL   L072314
         BRL   L0E24C4
L0E241F  LDY   #$00D5
         LDA   [$10],Y
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E2434
         INX
L0E2434  STA   $07
         STX   $09
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   [$07]
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         PEA   ^L0509EA
         PEA   L0509EA
         LDA   #$00DF
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E245B
         INX
L0E245B  PHX
         PHA
         LDA   #$00DB
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E2468
         INX
L0E2468  PHX
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L0E24B8
         PHY
         PHY
         LDY   #$00E1
         LDA   [$10],Y
         PHA
         LDY   #$00DD
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L15041C
         PLA
         STA   $03
         PLX
         STX   $05
         LDAL  L05565D
         BEQ   L0E249B
         STZ   $03
         STZ   $05
         BRA   L0E24B8
L0E249B  LDY   #$00E1
         LDA   [$10],Y
         PHA
         LDY   #$00DD
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L150410
         LDA   #$0001
         LDY   #$00D1
         STA   [$10],Y
L0E24B8  LDY   #$00D5
         LDA   [$10],Y
         PHA
         JSL   L150B5E
         BRA   L0E24CC
L0E24C4  LDA   #$FFFF
         TAX
         STA   $03
         STX   $05
L0E24CC  LDY   #$00D3
         LDA   [$10],Y
         PHA
         JSL   L150B70
         LDY   #$00D7
         LDA   [$10],Y
         BEQ   L0E24FA
         LDA   #$00D7
         CLC
         ADC   $10
         LDX   $12
         BCC   L0E24E8
         INX
L0E24E8  STA   $07
         STX   $09
         PHY
         LDY   #$00D7
         LDA   [$10],Y
         PHA
         JSL   L1506E1
         PLA
         STA   [$07]
L0E24FA  LDA   $03
         ORA   $05
         BNE   L0E2507
         PEA   $002A
         JSL   L0B0B7A
L0E2507  LDA   #$FFFF
         TAX
         CMP   $03
         BNE   L0E2511
         CPX   $05
L0E2511  BNE   L0E2517
         STZ   $03
         STZ   $05
L0E2517  LDA   $03
         LDX   $05
         STA   $14
         STX   $16
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

L0E2531  PHD
         TSC
         CLC
         ADC   #$FF6C
         TCS
         TCD
         STZ   $9E
         LDX   #$0000
         LDA   #$0004
         CMPL  L051054
         BEQ   L0E2548
         INX
L0E2548  TXA
         BEQ   L0E255E
         LDX   #$0000
         LDA   #$0005
         CMPL  L051054
         BEQ   L0E2558
         INX
L0E2558  TXA
         BEQ   L0E255E
         BRL   L0E2C35
L0E255E  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L0E256A
         BRL   L0E2C35
L0E256A  PHY
         PHY
         PEA   ^L0509EA
         PEA   L0509EA
         TDC
         CLC
         ADC   #$0081
         PEA   $0000
         PHA
         JSL   L1606F6
         PLA
         STA   $87
         PLX
         STX   $89
         LDA   $87
         ORA   $89
         BEQ   L0E258E
         LDA   #$0001
L0E258E  STA   $79
         LDA   $79
         LDY   #$00D1
         STA   [$9A],Y
         LDA   $79
         BEQ   L0E259E
         BRL   L0E2799
L0E259E  LDA   #$0004
         CMPL  L051054
         BEQ   L0E25AA
         BRL   L0E270F
L0E25AA  LDY   #$00FA
         LDA   [$9A],Y
         BNE   L0E25B4
         BRL   L0E2663
L0E25B4  LDAL  L05106A
         BNE   L0E25BD
         BRL   L0E2C35
L0E25BD  LDA   #$0077
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E25C8
         INX
L0E25C8  CLC
         ADC   #$003A
         BCC   L0E25CF
         INX
L0E25CF  CLC
         ADC   #$000C
         BCC   L0E25D6
         INX
L0E25D6  STA   $91
         STX   $93
         LDA   [$91]
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E25F0
         INX
L0E25F0  CLC
         ADC   #$0028
         BCC   L0E25F7
         INX
L0E25F7  STA   $91
         STX   $93
         LDA   [$91]
         LDY   #$0002
         ORA   [$91],Y
         BNE   L0E2607
         BRL   L0E2C35
L0E2607  PHY
         PEA   ^L0509EA
         PEA   L0509EA
         LDA   #$0077
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E2619
         INX
L0E2619  CLC
         ADC   #$003A
         BCC   L0E2620
         INX
L0E2620  CLC
         ADC   #$000C
         BCC   L0E2627
         INX
L0E2627  STA   $91
         STX   $93
         LDA   [$91]
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E2641
         INX
L0E2641  CLC
         ADC   #$0028
         BCC   L0E2648
         INX
L0E2648  STA   $91
         STX   $93
         LDY   #$0002
         LDA   [$91],Y
         TAX
         LDA   [$91]
         PHX
         PHA
         JSL   L03261F
         PLA
         BNE   L0E2660
         BRL   L0E2C35
L0E2660  BRL   L0E270F
L0E2663  LDAL  L051068
         BNE   L0E266C
         BRL   L0E2C35
L0E266C  LDA   #$0077
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E2677
         INX
L0E2677  CLC
         ADC   #$003A
         BCC   L0E267E
         INX
L0E267E  CLC
         ADC   #$000C
         BCC   L0E2685
         INX
L0E2685  STA   $91
         STX   $93
         LDA   [$91]
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E269F
         INX
L0E269F  CLC
         ADC   #$0024
         BCC   L0E26A6
         INX
L0E26A6  STA   $91
         STX   $93
         LDA   [$91]
         LDY   #$0002
         ORA   [$91],Y
         BNE   L0E26B6
         BRL   L0E2C35
L0E26B6  PHY
         PEA   ^L0509EA
         PEA   L0509EA
         LDA   #$0077
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E26C8
         INX
L0E26C8  CLC
         ADC   #$003A
         BCC   L0E26CF
         INX
L0E26CF  CLC
         ADC   #$000C
         BCC   L0E26D6

*

         INX
L0E26D6  STA   $91
         STX   $93
         LDA   [$91]
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0E26F0
         INX
L0E26F0  CLC
         ADC   #$0024
         BCC   L0E26F7
         INX
L0E26F7  STA   $91
         STX   $93
         LDY   #$0002
         LDA   [$91],Y
         TAX
         LDA   [$91]
         PHX
         PHA
         JSL   L03261F
         PLA
         BNE   L0E270F
         BRL   L0E2C35
L0E270F  LDA   #$0005
         CMPL  L051054
         BNE   L0E277F
         LDY   #$00FA
         LDA   [$9A],Y
         BEQ   L0E2750
         LDA   L055269
         ORA   L05526B
         BNE   L0E272A
         BRL   L0E2C35
L0E272A  LDA   L055377
         ORA   L055379
         BNE   L0E2735
         BRL   L0E2C35
L0E2735  PHY
         PEA   ^L0509EA
         PEA   L0509EA
         LDA   L055377
         LDX   L055379
         PHX
         PHA
         JSL   L03261F
         PLA
         BNE   L0E274E
         BRL   L0E2C35
L0E274E  BRA   L0E277F
L0E2750  LDA   L05526D
         ORA   L05526F
         BNE   L0E275B
         BRL   L0E2C35
L0E275B  LDA   L055373
         ORA   L055375
         BNE   L0E2766
         BRL   L0E2C35
L0E2766  PHY
         PEA   ^L0509EA
         PEA   L0509EA
         LDA   L055373
         LDX   L055375
         PHX
         PHA
         JSL   L03261F
         PLA
         BNE   L0E277F
         BRL   L0E2C35
L0E277F  PHY
         PHY
         PEA   $0000
         PEI   $9A
         JSL   L0E21CF
         PLA
         STA   $87
         PLX
         STX   $89
         LDA   $87
         ORA   $89
         BNE   L0E2799
         BRL   L0E2C35
L0E2799  PHY
         PEI   $89
         PEI   $87
         JSL   L0718FA
         PLA
         STA   $85
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $004C
         JSL   L071EC5
         PHY
         PEA   $0000
         PEI   $9A
         JSL   L0E1248
         PLA
         STA   $29
         LDA   $29
         BPL   L0E27D1
         LDA   #$0001
         STA   $9E
         BRL   L0E2BAE
L0E27D1  LDA   $29
         SEC
         SBC   #$0010
         BEQ   L0E2813
         BVS   L0E27DE
         EOR   #$8000
L0E27DE  BPL   L0E2813
         PEA   $0069
         JSL   L0B0B7A
         LDA   $29
         STA   $07
         LDA   $07
         SEC
         SBC   #$0001
         BVS   L0E27F6
         EOR   #$8000
L0E27F6  BPL   L0E280B
         LDA   #$0001
         STA   $8B
L0E27FD  JSL   L0E0000
         LDA   $8B
         CMP   $07
         BEQ   L0E280B
         INC   $8B
         BRA   L0E27FD
L0E280B  LDA   #$0001
         STA   $9E
         BRL   L0E2BAE
L0E2813  LDA   $29
         STA   $05
         LDA   #$0001
         SEC
         SBC   $05
         BEQ   L0E2826
         BVS   L0E2824
         EOR   #$8000
L0E2824  BMI   L0E2855
L0E2826  LDA   $05
         STA   $8B
L0E282A  LDA   $8B
         ASL
         ASL
         CLC
         ADC   #$0027
         TAX
         STX   $91
         TDC
         CLC
         ADC   $91
         STA   $91
         STZ   $93
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   [$91]
         PLA
         LDY   #$0002
         STA   [$91],Y
         LDA   $8B
         DEC
         BEQ   L0E2855
         DEC   $8B
         BRA   L0E282A
L0E2855  LDX   #$0000
         LDA   [$87]
         LDY   #$0002
         ORA   [$87],Y
         BNE   L0E2862
         INX
L0E2862  PHX
         LDA   $79
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCS   L0E2871
         BRL   L0E2936
L0E2871  LDA   #$00D3
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E287C
         INX
L0E287C  STA   $91
         STX   $93
         PHY
         JSL   L150B6A
         PLA
         STA   [$91]
         LDA   L05503D
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E289B
         INX
L0E289B  STA   $91
         STX   $93
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   [$91]
         PHY
         PHY
         LDY   #$00CD
         LDA   [$9A],Y
         PHA
         LDY   #$00CB
         LDA   [$9A],Y
         PHA
         DEY
         DEY
         LDA   [$9A],Y
         PHA
         JSL   L15041C
         PLA
         STA   $87
         PLX
         STX   $89
         LDY   #$00D3
         LDA   [$9A],Y
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E28DC
         INX
L0E28DC  STA   $91
         STX   $93
         PHY
         LDY   #$00D7
         LDA   [$9A],Y
         PHA
         JSL   L1506E1
         PLA
         STA   [$91]
         LDA   $87
         ORA   $89
         BNE   L0E292A
         LDA   $29
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L0E2903
         EOR   #$8000
L0E2903  BPL   L0E2927
         LDA   #$0001
         STA   $8B
L0E290A  LDA   $8B
         ASL
         ASL
         CLC
         ADC   #$0027
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L07185A
         LDA   $8B
         CMP   $03
         BEQ   L0E2927
         INC   $8B
         BRA   L0E290A
L0E2927  BRL   L0E2C35
L0E292A  PHY
         PEI   $89
         PEI   $87
         JSL   L0718FA
         PLA
         STA   $85
L0E2936  PEA   $0000
         PEI   $9A
         JSL   L0E1AD7
         LDA   #$0077
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E294A
         INX
L0E294A  CLC
         ADC   #$003A
         BCC   L0E2951
         INX
L0E2951  PHX
         PHA
         PEA   $0000
         PEA   $0016
         JSL   L071EC5
         LDA   #$0077
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E2968
         INX
L0E2968  STA   L0553B9
         STX   L0553BB
         JSL   L0B2AC6
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $8D
         PLX
         STX   $8F
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   L0551D7
         STA   $83
         LDA   $79
         BEQ   L0E2999
         LDA   $81
         STA   $71
         BRA   L0E29D6
L0E2999  LDA   #$C000
         STA   L0551D7
L0E299F  PHY
         LDA   L0551D7
         PHA
         JSL   L150598
         PLA
         STA   $71
         LDA   #$030B
         CMPL  L05565D
         BNE   L0E29C0
         LDA   #$0100
         CLC
         ADC   L0551D7
         STA   L0551D7
         BRA   L0E29D0
L0E29C0  LDAL  L05565D
         BEQ   L0E29D0
         PEA   $002A
         JSL   L0B0B7A
         BRL   L0E2BAE
L0E29D0  LDAL  L05565D
         BNE   L0E299F
L0E29D6  LDA   $71
         STA   L0551D7
         LDA   L055205
         STA   $7D
         LDA   #$0001
         STA   L055205
         LDA   L0551D9
         STA   $7B
         LDA   $79
         STA   L0551D9
         LDA   L0551D3
         LDX   L0551D5
         STA   $75
         STX   $77
         LDA   $87
         LDX   $89
         STA   L0551D3
         STX   L0551D5
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   ^L052506
         PEA   L052506
         PEA   $0020
         JSL   L0313BE
         PEA   ^L052506
         PEA   L052506
         PEA   ^L0509EA
         PEA   L0509EA
         PEA   $0020
         JSL   L0313BE
         LDA   L0551DB
         STA   $7F
         LDY   #$0002
         LDA   [$87],Y
         PHA
         LDA   [$87]
         PHA
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         JSL   L0B4245
         LDA   $7D
         STA   L055205
         LDA   L0551D9
         BEQ   L0E2A71
         LDY   #$00D1
         LDA   [$9A],Y
         BNE   L0E2A6E
         LDY   #$00E1
         LDA   [$9A],Y
         PHA
         LDY   #$00DD
         LDA   [$9A],Y
         PHA
         DEY
         DEY
         LDA   [$9A],Y
         PHA
         JSL   L150410
L0E2A6E  BRL   L0E2AFF
L0E2A71  LDY   #$00D1
         LDA   [$9A],Y
         BEQ   L0E2A82
         PEI   $89
         PEI   $87
         JSL   L151053
         BRA   L0E2AFF
L0E2A82  LDA   #$00D3
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E2A8D
         INX
L0E2A8D  STA   $91
         STX   $93
         PHY
         JSL   L150B6A
         PLA
         STA   [$91]
         LDY   #$00DF
         LDA   [$9A],Y
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E2AAE
         INX
L0E2AAE  STA   $91
         STX   $93
         PHY
         LDY   #$00D9
         LDA   [$9A],Y
         PHA
         JSL   L1506E1
         PLA
         STA   [$91]
         PEA   $0002
         LDY   #$00E1
         LDA   [$9A],Y
         PHA
         LDY   #$00DD
         LDA   [$9A],Y
         PHA
         DEY
         DEY
         LDA   [$9A],Y
         PHA
         JSL   L1510BF
         LDY   #$00D3
         LDA   [$9A],Y
         PHA
         JSL   L150B70
         LDA   #$00D7
         CLC
         ADC   $9A
         LDX   $9C
         BCC   L0E2AED
         INX
L0E2AED  STA   $91
         STX   $93
         PHY
         LDY   #$00D7
         LDA   [$9A],Y
         PHA
         JSL   L1506E1
         PLA
         STA   [$91]
L0E2AFF  LDA   $75
         LDX   $77
         STA   L0551D3
         STX   L0551D5
         PEA   ^L052506
         PEA   L052506
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         PEI   $8F
         PEI   $8D
         JSL   L151131
         LDA   $6F
         BEQ   L0E2B36
         PEA   $0000
         PEI   $9A
         JSL   L0E1BB5
         BRA   L0E2BA1
L0E2B36  LDA   #$0001
         STA   $9E
         LDX   #$0000
         LDA   $73
         DEC
         BNE   L0E2B44
         INX
L0E2B44  TXA
         LDY   #$00CF
         STA   [$9A],Y
         LDA   $6B
         ORA   $6D
         BNE   L0E2B56
         JSL   L0E0C52
         BRA   L0E2B73
L0E2B56  PEI   $6D
         PEI   $6B
         JSL   L150BB8
         LDY   #$0002
         LDA   [$6B],Y
         PHA
         LDA   [$6B]
         PHA
         JSL   L0E10BE
         PEI   $6D
         PEI   $6B
         JSL   L07185A
L0E2B73  LDY   #$00FA
         LDA   [$9A],Y
         EOR   #$0001
         CMP   #$0000
         BNE   L0E2B87
         LDY   #$00CF
         LDA   [$9A],Y
         BEQ   L0E2BA1
L0E2B87  LDA   L0553A7
         LDX   L0553A9
         PHX
         PHA
         JSL   L07185A
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   L0553A7
         PLA
         STA   L0553A9
L0E2BA1  LDA   L0551D9
         BNE   L0E2BAE
         LDA   L0551D7
         PHA
         JSL   L151343
L0E2BAE  LDA   $29
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0E2BBD
         EOR   #$8000
L0E2BBD  BPL   L0E2BE1
         LDA   #$0001
         STA   $8B
L0E2BC4  LDA   $8B
         ASL
         ASL
         CLC
         ADC   #$0027
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L07185A
         LDA   $8B
         CMP   $01
         BEQ   L0E2BE1
         INC   $8B
         BRA   L0E2BC4
L0E2BE1  LDA   L0551D9
         BEQ   L0E2BF3
         PEI   $89
         PEI   $87
         PEA   $C000
         JSL   L0718DA
         BRA   L0E2C0F
L0E2BF3  PEI   $89
         PEI   $87
         PEI   $85
         JSL   L0718DA
         LDA   #$8000
         AND   $85
         BNE   L0E2C0F
         PEA   $0001
         PEI   $89
         PEI   $87
         JSL   L150D44
L0E2C0F  LDA   $7B
         STA   L0551D9
         LDA   $83
         STA   L0551D7
         JSL   L160704
         LDA   L0551DB
         SEC
         SBC   $7F
         BEQ   L0E2C30
         BVS   L0E2C2A
         EOR   #$8000
L0E2C2A  BPL   L0E2C30
         JSL   L160712
L0E2C30  LDA   $7F
         STA   L0551DB
L0E2C35  LDA   $98
         STA   $9C
         LDA   $97
         STA   $9B
         LDA   $95
         TCD
         TSC
         CLC
         ADC   #$009A
         TCS
         RTL

L0E2C47  PHD
         TSC
         CLC
         ADC   #$FEE8
         TCS
         ADC   #$0025
         TCD
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L0718BF
         LDA   L05539F
         LDX   L0553A1
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         CLC
         ADC   #$0002
         BCC   L0E2C77
         INX
L0E2C77  STA   $DB
         STX   $DD
         PEI   $DD
         PEI   $DB
         LDA   #$00FF
         AND   [$DB]
         JSL   L150488
         JSL   L150F53
         INC
         BNE   L0E2C90
         INX
L0E2C90  STA   $DF
         STX   $E1
         PEI   $E1
         PEI   $DF
         LDA   #$00FF
         AND   [$DF]
         JSL   L150488
         JSL   L150F53
         INC
         BNE   L0E2CA9
         INX
L0E2CA9  STA   $E3
         STX   $E5
         PEI   $E5
         PEI   $E3
         LDA   #$00FF
         AND   [$E3]
         JSL   L150488
         JSL   L150F53
         INC
         BNE   L0E2CC2
         INX
L0E2CC2  STA   $E7
         STX   $E9
         PEI   $E9
         PEI   $E7
         LDA   #$00FF
         AND   [$E7]
         JSL   L150488
         JSL   L150F53
         INC
         BNE   L0E2CDB
         INX
L0E2CDB  STA   $EB
         STX   $ED
         PEI   $DD
         PEI   $DB
         PEI   $E1
         PEI   $DF
         PEI   $E5
         PEI   $E3
         PEI   $E9
         PEI   $E7
         JSL   L15065F
         PEI   $ED
         PEI   $EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         LDA   #$00FF
         AND   [$EB]
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L07191C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L0B07EA
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$011E
         TCS
         RTL

L0E2D3B  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $005E
         JSL   L0B0B7A
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

L0E2D5B  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0E
L0E2D65  LDAL  L051054
         SEC
         SBC   #$0005
         BVS   L0E2D72
         EOR   #$8000
L0E2D72  BMI   L0E2DC2
         PHY
         PEA   $0000
         PEI   $0A
         JSL   L0E1E44
         PLA
         BNE   L0E2D8E
         PHY
         PEA   $0000
         PEI   $0A
         JSL   L0E2531
         PLA
         BEQ   L0E2DA7
L0E2D8E  LDA   #$0001
         STA   $0E
         LDY   #$00E9
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0000
         JSL   L0B2AF9
         BRA   L0E2DC2
L0E2DA7  LDY   #$00ED
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   L0553B9
         STX   L0553BB
         LDAL  L051054
         INC
         STAL  L051054
         BRA   L0E2D65
L0E2DC2  LDA   $08
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

L0E2DD3  ENT
         PHD
         TSC
         CLC
         ADC   #$FE6A
         TCS
         ADC   #$00A1
         TCD
         LDA   #$0001
         STA   $FC
         STZ   L0553A5
         STZ   $CF
         PHY
         JSL   L0B4B2B
         PLA
         LSR
         BCC   L0E2E01
         LDA   #$0001
         STA   L05539D
         PEA   $002B
         JSL   L0B0B7A
         BRL   L0E303C
L0E2E01  LDA   $FA
         STA   $AF
         LDA   L0553B5
         LDX   L0553B7
         STA   $E7
         STX   $E9
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0E2E1C
         INX
L0E2E1C  STA   $F1
         STX   $F3
         LDA   [$F1]
         STA   $EF
         LDA   L0553B9
         LDX   L0553BB
         STA   $EB
         STX   $ED
         TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         PEA   ^L051054
         PEA   L051054
         PEA   $0018
         JSL   L0313BE
         PEA   $0000
         PHD
         JSL   L0E1B5E
         LDA   #$0001
         STA   $E3
         LDA   #$0005
         CMPL  L051054
         BNE   L0E2E5D
         BRL   L0E2F3F
L0E2E5D  PHY
         PEA   $0000
         PHD
         JSL   L0E2D5B
         PLA
         LSR
         BCC   L0E2E6D
         BRL   L0E3006
L0E2E6D  LDA   L05502B
         LDX   L05502D
         CMPL  L051056
         BNE   L0E2E7E
         TXA
         CMPL  L051058
L0E2E7E  BEQ   L0E2E85
         LDA   #$0000
         BRA   L0E2E88
L0E2E85  LDA   #$0001
L0E2E88  STA   $E5
         LDA   L055039
         LDX   L05503B
         CMPL  L051056
         BNE   L0E2E9B
         TXA
         CMPL  L051058
L0E2E9B  BNE   L0E2EA2
         LDA   #$0000
         BRA   L0E2EA5
L0E2EA2  LDA   #$0001
L0E2EA5  BNE   L0E2ECA
         LDA   L055027
         LDX   L055029
         CMPL  L05105E
         BNE   L0E2EB8
         TXA
         CMPL  L051060
L0E2EB8  BNE   L0E2EBF
         LDA   #$0000
         BRA   L0E2EC2
L0E2EBF  LDA   #$0001
L0E2EC2  BEQ   L0E2EC8
         PHA
         PLA
         AND   $E3
L0E2EC8  BEQ   L0E2EE4
L0E2ECA  PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
         PHY
         PEA   $0000
         PHD
         JSL   L0E2D5B
         PLA
         LSR
         BCC   L0E2EE4
         BRL   L0E3006
L0E2EE4  LDA   L05502B
         LDX   L05502D
         CMPL  L051056
         BNE   L0E2EF5
         TXA
         CMPL  L051058
L0E2EF5  BNE   L0E2EFC
         LDA   #$0000
         BRA   L0E2EFF
L0E2EFC  LDA   #$0001
L0E2EFF  PHA
         LDA   $E5
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L0E2F3F
         LDA   #$0004
         STAL  L051054
         LDA   L05502B
         LDX   L05502D
         STAL  L051056
         TXA
         STAL  L051058
         LDA   L055275
         STAL  L051068
         LDA   L055273
         STAL  L05106A
         PHY
         PEA   $0000
         PHD
         JSL   L0E2D5B
         PLA
         LSR
         BCC   L0E2F3F
         BRL   L0E3006
L0E2F3F  LDA   #$0005
         STAL  L051054
         PHY
         PEA   $0000
         PHD
         JSL   L0E2531
         PLA
         LSR
         BCC   L0E2F56
         BRL   L0E3006
L0E2F56  LDA   $FA
         BEQ   L0E2F76
         LDA   #$0013
         CMPL  L051BDE
         BNE   L0E2F71
         PHY
         PEA   $0000
         PHD
         JSL   L0E1851
         PLA
         STA   $FC
         BRA   L0E2F73
L0E2F71  STZ   $FC
L0E2F73  BRL   L0E3006
L0E2F76  LDA   #$0009
         CMPL  L051BDE
         BNE   L0E2F98
         LDA   #$000B
         CMPL  L051BE0
         BNE   L0E2F8E
         JSL   L0B7642
         BRA   L0E2F96
L0E2F8E  PEA   $0000
         PHD
         JSL   L0E2D3B
L0E2F96  BRA   L0E3006
L0E2F98  LDA   #$0012
         CMPL  L051BDE
         BNE   L0E2FAB
         PEA   $0000
         PHD
         JSL   L0E1983
         BRA   L0E3006
L0E2FAB  LDA   #$0011
         CMPL  L051BDE
         BNE   L0E2FC4
L0E2FB4  LDAL  L051BDE
         DEC
         DEC
         BEQ   L0E2FC2
         JSL   L0B0000
         BRA   L0E2FB4
L0E2FC2  BRA   L0E3006
L0E2FC4  LDAL  L051BDE
         DEC
         DEC
         BEQ   L0E3006
         LDA   L05539F
         LDX   L0553A1
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         STA   $F1
         STX   $F3
         LDA   [$F1]
         BNE   L0E2FFC
         PEA   $005F
         PEA   $0000
         TDC
         CLC
         ADC   #$FF5F
         PHA
         JSL   L0B369F
         JSL   L0B0841
         BRA   L0E3004
L0E2FFC  PEA   $0000
         PHD
         JSL   L0E2C47
L0E3004  STZ   $FC
L0E3006  LDA   $EB
         LDX   $ED
         STA   L0553B9
         STX   L0553BB
         LDA   $CF
         BEQ   L0E303C
         LDA   L0553A7
         LDX   L0553A9
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         PHX
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L071FF8
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B07EA
L0E303C  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L0E3063
         LDA   #$0001
         STA   L054FB1
         JSL   L0B06CE
         LDA   L055389
         BEQ   L0E3063
         LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L07185A
         STZ   L055389
L0E3063  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$019A
         TCS
         RTL

