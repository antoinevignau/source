
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L0A0000     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDAL  L031DE0
            BEQ   L0A0016
            LDA   #$0000
            BRA   L0A0019
L0A0016     LDA   #$0001
L0A0019     STAL  L031DE0
            LDAL  L031DE0
            PHA
            PEA   $010C
            _CheckMItem
            BCS   L0A0031
            LDA   #$0000
L0A0031     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDAL  L031DE0
            BNE   L0A0058
            LDA   #$0001
            STAL  L031DE0
            STA   L020054
L0A0058     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L020054
            BEQ   L0A007A
            LDA   #$0000
            STAL  L031DE0
            STA   L020054
L0A007A     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0A0082     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E8
            TCS
            STZ   $EA
            LDA   $FF
            STA   $EE
            LDY   #$0004
            LDA   [$FB],Y
            BRL   L0A01A6
L0A009B     LDA   $FF
            STA   $EE
            BRL   L0A01E4
L0A00A2     PEA   ^L032081
            PEA   L032081
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A01E4
L0A00B1     LDA   $EA
            BEQ   L0A00B8
            BRL   L0A0147
L0A00B8     JSL   L0A0E0F
            STA   $EC
            LDA   $EC
            BRL   L0A0136
L0A00C3     PEA   ^L032089
            PEA   L032089
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0144
L0A00D2     PEA   ^L032093
            PEA   L032093
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0144
L0A00E1     PEA   ^L03209E
            PEA   L03209E
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0144
L0A00F0     PEA   ^L0320A8
            PEA   L0320A8
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0144
L0A00FF     PEA   ^L0320B3
            PEA   L0320B3
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0144
L0A010E     PEA   ^L0320BD
            PEA   L0320BD
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0144
L0A011D     LDA   #$0001
            STA   $EA
            BRL   L0A0144
            BRL   L0A0144
L0A0128     DA    L0A00C3
            DA    L0A00D2
            DA    L0A00E1
            DA    L0A00F0
            DA    L0A00FF
            DA    L0A010E
            DA    L0A011D
L0A0136     DEC
            CMP   #$0006
            BCC   L0A013F
            LDA   #$0006
L0A013F     ASL
            TAX
            JMP   (L0A0128,X)

L0A0144     BRL   L0A00B1
L0A0147     BRL   L0A01E4
L0A014A     BRL   L0A01E4
L0A014D     STZ   $EE
            BRL   L0A01E4
L0A0152     LDA   #$001C
            STA   $EE
            BRL   L0A01E4
L0A015A     JSL   L0A0000
            BRL   L0A01E4
L0A0161     LDA   #$0001
            STA   L020052
            BRL   L0A01E4
L0A016A     JSL   L0718EE
            LDA   $FF
            STA   $EE
            BRL   L0A01E4
L0A0175     LDAL  L031DEE
            BEQ   L0A0180
            LDA   #$0000
            BRA   L0A0183
L0A0180     LDA   #$0001
L0A0183     STAL  L031DEE
            LDAL  L031DEE
            PHA
            PEA   $0191
            _CheckMItem
            BCS   L0A019B
            LDA   #$0000
L0A019B     STAL  L020002
            BRL   L0A01E4
L0A01A2     BRA   L0A01E4
            BRA   L0A01E4
L0A01A6     CMP   #$0100
            BNE   L0A01AE
            BRL   L0A00A2
L0A01AE     CMP   #$0101
            BNE   L0A01B6
            BRL   L0A00B1
L0A01B6     CMP   #$0102
            BEQ   L0A014A
            CMP   #$0105
            BEQ   L0A0161
            CMP   #$0108
            BEQ   L0A014D
            CMP   #$010A
            BEQ   L0A0152
            CMP   #$010C
            BEQ   L0A015A
            CMP   #$0190
            BEQ   L0A016A
            CMP   #$0191
            BEQ   L0A0175
            CMP   #$0192
            BNE   L0A01E1
            BRL   L0A009B
L0A01E1     JMP   L0A01A2

L0A01E4     LDA   $EE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L0A01F0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            JSL   L0D0522
            CMP   #$0001
            BEQ   L0A020D
            BCC   L0A020D
            LDA   #$0032
            BRA   L0A0210
            BRA   L0A0210
L0A020D     LDA   #$0028
L0A0210     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0A021A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$001C
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0A02FF
L0A0232     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0A02D7
L0A023D     PEA   $0043
            PEA   $0041
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A024C     PEA   $0046
            PEA   $0044
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A025B     PEA   $004C
            PEA   $0047
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A026A     PEA   $004F
            PEA   $004D
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A0279     PEA   $0052
            PEA   $0050
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A0288     PEA   $0053
            PEA   $0053
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A0297     PEA   $005A
            PEA   $0054
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A02A6     PEA   $0020
            PEA   $0020
            JSL   L060000
            PLY
            PLY
            BRL   L0A02E8
L0A02B5     LDA   L020074
            STA   $F0
            BRL   L0A02E8
L0A02BD     BRL   L0A02E8
            BRL   L0A02E8
L0A02C3     DA    L0A023D
            DA    L0A024C
            DA    L0A025B
            DA    L0A026A
            DA    L0A0279
            DA    L0A0288
            DA    L0A0297
            DA    L0A02A6
            DA    L0A02B5
            DA    L0A02BD
L0A02D7     SEC
            SBC   #$0032
            CMP   #$0009
            BCC   L0A02E3
            LDA   #$0009
L0A02E3     ASL
            TAX
            JMP   (L0A02C3,X)

L0A02E8     BRL   L0A030A
L0A02EB     PEA   $001C
            PEI   $FF
            PEI   $FD
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $F0
            BRA   L0A030A
            BRA   L0A030A
L0A02FF     CMP   #$0103
            BNE   L0A0307
            BRL   L0A0232
L0A0307     JMP   L0A02EB

L0A030A     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0A0316     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$001A
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0A046D
L0A032E     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0A0445
L0A0339     LDA   #$001B
            STA   $F0
            BRL   L0A0456
L0A0341     LDA   #$0019
            STA   $F0
            BRL   L0A0456
L0A0349     LDA   #$0018
            STA   $F0
            BRL   L0A0456
L0A0351     LDA   #$0003
            STA   $F0
            BRL   L0A0456
L0A0359     PEA   $0001
            PEA   ^L033359
            PEA   L033359
            PEA   $0045
            PEA   $0041
            PEA   ^L033B90
            PEA   L033B90
            PEA   ^L033342
            PEA   L033342
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A0456
L0A0383     PEA   $0001
            PEA   ^L033375
            PEA   L033375
            PEA   $004A
            PEA   $0046
            PEA   ^L033B90
            PEA   L033B90
            PEA   ^L03335E
            PEA   L03335E
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A0456
L0A03AD     PEA   $0001
            PEA   ^L033391
            PEA   L033391
            PEA   $0052
            PEA   $004C
            PEA   ^L033B90
            PEA   L033B90
            PEA   ^L03337A
            PEA   L03337A
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A0456
L0A03D7     PEA   $0001
            PEA   ^L0333AD
            PEA   L0333AD
            PEA   $005A
            PEA   $0053
            PEA   ^L033B90
            PEA   L033B90
            PEA   ^L033396
            PEA   L033396
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A0456
L0A0401     PEA   $0001
            PEA   ^L0333C9
            PEA   L0333C9
            PEA   $0020
            PEA   $0020
            PEA   ^L033B90
            PEA   L033B90
            PEA   ^L0333B2
            PEA   L0333B2
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A0456
L0A042B     BRL   L0A0456
            BRL   L0A0456
L0A0431     DA    L0A0339
            DA    L0A0341
            DA    L0A0349
            DA    L0A0351
            DA    L0A0359
            DA    L0A0383
            DA    L0A03AD
            DA    L0A03D7
            DA    L0A0401
            DA    L0A042B
L0A0445     SEC
            SBC   #$0032
            CMP   #$0009
            BCC   L0A0451
            LDA   #$0009
L0A0451     ASL
            TAX
            JMP   (L0A0431,X)

L0A0456     BRL   L0A0478
L0A0459     PEA   $001A
            PEI   $FF
            PEI   $FD
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $F0
            BRA   L0A0478
            BRA   L0A0478
L0A046D     CMP   #$0103
            BNE   L0A0475
            BRL   L0A032E
L0A0475     JMP   L0A0459

L0A0478     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0A0484     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0019
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0A0607
L0A049C     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0A05DF
L0A04A7     LDA   #$001B
            STA   $F0
            BRL   L0A05F0
L0A04AF     LDA   #$001A
            STA   $F0
            BRL   L0A05F0
L0A04B7     LDA   #$0018
            STA   $F0
            BRL   L0A05F0
L0A04BF     LDA   #$0003
            STA   $F0
            BRL   L0A05F0
L0A04C7     PEA   $0001
            PEA   ^L0333D6
            PEA   L0333D6
            PEA   $0044
            PEA   $0041
            PEA   ^L0338EB
            PEA   L0338EB
            PEA   ^L0333CE
            PEA   L0333CE
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A05F0
L0A04F1     PEA   $0001
            PEA   ^L0333E3
            PEA   L0333E3
            PEA   $004D
            PEA   $0045
            PEA   ^L0338EB
            PEA   L0338EB
            PEA   ^L0333DB
            PEA   L0333DB
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A05F0
L0A051B     PEA   $0001
            PEA   ^L0333F0
            PEA   L0333F0
            PEA   $0052
            PEA   $004E
            PEA   ^L0338EB
            PEA   L0338EB
            PEA   ^L0333E8
            PEA   L0333E8
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A05F0
L0A0545     PEA   $0001
            PEA   ^L0333FD
            PEA   L0333FD
            PEA   $0053
            PEA   $0053
            PEA   ^L0338EB
            PEA   L0338EB
            PEA   ^L0333F5
            PEA   L0333F5
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A05F0
L0A056F     PEA   $0001
            PEA   ^L03340A
            PEA   L03340A
            PEA   $005A
            PEA   $0054
            PEA   ^L0338EB
            PEA   L0338EB
            PEA   ^L033402
            PEA   L033402
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A05F0
L0A0599     PEA   $0001
            PEA   ^L033417
            PEA   L033417
            PEA   $0020
            PEA   $0020
            PEA   ^L0338EB
            PEA   L0338EB
            PEA   ^L03340F
            PEA   L03340F
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A05F0
L0A05C3     BRL   L0A05F0
            BRL   L0A05F0
L0A05C9     DA    L0A04A7
            DA    L0A04AF
            DA    L0A04B7
            DA    L0A04BF
            DA    L0A04C7
            DA    L0A04F1
            DA    L0A051B
            DA    L0A0545
            DA    L0A056F
            DA    L0A0599
            DA    L0A05C3
L0A05DF     SEC
            SBC   #$0032
            CMP   #$000A
            BCC   L0A05EB
            LDA   #$000A
L0A05EB     ASL
            TAX
            JMP   (L0A05C9,X)

L0A05F0     BRL   L0A0612
L0A05F3     PEA   $0019
            PEI   $FF
            PEI   $FD
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $F0
            BRA   L0A0612
            BRA   L0A0612
L0A0607     CMP   #$0103
            BNE   L0A060F
            BRL   L0A049C
L0A060F     JMP   L0A05F3

L0A0612     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0A061E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0018
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0A06C5
L0A0636     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0A069D
L0A0641     LDA   #$001B
            STA   $F0
            BRL   L0A06AE
L0A0649     LDA   #$001A
            STA   $F0
            BRL   L0A06AE
L0A0651     LDA   #$0019
            STA   $F0
            BRL   L0A06AE
L0A0659     LDA   #$0003
            STA   $F0
            BRL   L0A06AE
L0A0661     PEA   $0001
            PEA   ^L033427
            PEA   L033427
            PEA   $0020
            PEA   $0020
            PEA   ^L033C86
            PEA   L033C86
            PEA   ^L03341C
            PEA   L03341C
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            BRL   L0A06AE
L0A068B     BRL   L0A06AE
            BRL   L0A06AE
L0A0691     DA    L0A0641
            DA    L0A0649
            DA    L0A0651
            DA    L0A0659
            DA    L0A0661
            DA    L0A068B
L0A069D     SEC
            SBC   #$0032
            CMP   #$0005
            BCC   L0A06A9
            LDA   #$0005
L0A06A9     ASL
            TAX
            JMP   (L0A0691,X)

L0A06AE     BRL   L0A06D0
L0A06B1     PEA   $0018
            PEI   $FF
            PEI   $FD
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $F0
            BRA   L0A06D0
            BRA   L0A06D0
L0A06C5     CMP   #$0103
            BNE   L0A06CD
            BRL   L0A0636
L0A06CD     JMP   L0A06B1

L0A06D0     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0A06DC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0002
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0A0882
L0A06F4     LDA   #$0001
            STA   $F0
            BRL   L0A08C0
L0A06FC     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0A07F2
L0A0707     PEA   ^L03342C
            PEA   L03342C
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0716     PEA   ^L033433
            PEA   L033433
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0725     PEA   ^L03343A
            PEA   L03343A
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0734     PEA   ^L033441
            PEA   L033441
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0743     PEA   ^L033448
            PEA   L033448
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0752     PEA   ^L03344F
            PEA   L03344F
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0761     PEA   ^L033457
            PEA   L033457
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A0770     PEA   ^L03345F
            PEA   L03345F
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A077F     PEA   ^L033466
            PEA   L033466
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A078E     PEA   ^L03346D
            PEA   L03346D
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A079D     PEA   ^L033477
            PEA   L033477
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A07AC     PEA   ^L03347E
            PEA   L03347E
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
L0A07BB     STZ   $F0
            BRL   L0A0803
L0A07C0     PEA   ^L033486
            PEA   L033486
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A0803
            BRL   L0A0803
L0A07D2     DA    L0A0707
            DA    L0A0716
            DA    L0A0725
            DA    L0A0734
            DA    L0A0743
            DA    L0A0752
            DA    L0A0761
            DA    L0A0770
            DA    L0A077F
            DA    L0A078E
            DA    L0A079D
            DA    L0A07AC
            DA    L0A07AC
            DA    L0A07AC
            DA    L0A07BB
            DA    L0A07C0
L0A07F2     SEC
            SBC   #$0032
            CMP   #$000F
            BCC   L0A07FE
            LDA   #$000F
L0A07FE     ASL
            TAX
            JMP   (L0A07D2,X)

L0A0803     BRL   L0A08C0
L0A0806     PEA   ^L03348E
            PEA   L03348E
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A0815     PEA   ^L033496
            PEA   L033496
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A0824     PEA   ^L03349E
            PEA   L03349E
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A0833     PEA   ^L0334A6
            PEA   L0334A6
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A0842     PEA   ^L0334AE
            PEA   L0334AE
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A0851     PEA   ^L0334B6
            PEA   L0334B6
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A0860     PEA   ^L0334BE
            PEA   L0334BE
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A086F     PEA   ^L0334C6
            PEA   L0334C6
            JSL   L0133D4
            PLY
            PLY
            BRL   L0A08C0
L0A087E     BRA   L0A08C0
            BRA   L0A08C0
L0A0882     CMP   #$0100
            BNE   L0A088A
            BRL   L0A0806
L0A088A     CMP   #$0101
            BEQ   L0A0815
            CMP   #$0103
            BNE   L0A0897
            BRL   L0A06FC
L0A0897     CMP   #$0105
            BEQ   L0A0851
            CMP   #$0108
            BEQ   L0A0824
            CMP   #$010A
            BEQ   L0A0833
            CMP   #$010C
            BEQ   L0A0842
            CMP   #$0190
            BEQ   L0A0860
            CMP   #$0191
            BEQ   L0A086F
            CMP   #$0192
            BNE   L0A08BD
            BRL   L0A06F4
L0A08BD     JMP   L0A087E

L0A08C0     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0A08CC     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$001A
            TCS
            LDA   #L0334CE
            LDX   #^L0334CE
            STX   $1E
            STA   $1C
            LDA   #L0334E0
            LDX   #^L0334E0
            STX   $23
            STA   $21
            LDX   #$0000
            TDC
            CLC
            ADC   #$001C
            STA   $F6
            STX   $F8
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F6],Y
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$0021
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F6],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0026
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L0334ED
            LDX   #^L0334ED
            STX   $62
            STA   $60
            LDA   #$0002
            STA   $CA
            LDX   #$0000
            TDC
            CLC
            ADC   #$001C
            STX   $2A
            STA   $28
            LDX   #$0000
            TDC
            CLC
            ADC   #$001C
            STX   $E0
            STA   $DE
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $AC
            STA   $AA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0026
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            JSL   L014C78
            LDA   $F2
            CMP   #$0001
            BNE   L0A098E
            LDA   #$0000
            BRA   L0A0990
L0A098E     LDA   $F4
L0A0990     TAY
            TSC
            CLC
            ADC   #$00E0
            TCS
            TYA
            PLD
            RTL

L0A099A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$0011
            TCS
            LDA   #L0334FD
            LDX   #^L0334FD
            STX   $15
            STA   $13
            LDA   #L033505
            LDX   #^L033505
            STX   $1A
            STA   $18
            LDA   #L033518
            LDX   #^L033518
            STX   $1F
            STA   $1D
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STA   $F2
            STX   $F4
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$001D
            STA   $F2
            STX   $F4
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L033523
            LDX   #^L033523
            STX   $5E
            STA   $5C
            LDA   #$0003
            STA   $C6
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STX   $26
            STA   $24
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STX   $DC
            STA   $DA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $A8
            STA   $A6
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            JSL   L014C78
            LDA   $EE
            CMP   #$0001
            BNE   L0A0A7D
            LDA   #$0000
            BRA   L0A0A7F
L0A0A7D     LDA   $F0
L0A0A7F     TAY
            TSC
            CLC
            ADC   #$00E5
            TCS
            TYA
            PLD
            RTL

L0A0A89     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$0016
            TCS
            PEA   ^L03352E
            PEA   L03352E
            JSL   L0133D4
            PLY
            PLY
            LDA   #L033536
            LDX   #^L033536
            STX   $1A
            STA   $18
            LDA   #L03353F
            LDX   #^L03353F
            STX   $1F
            STA   $1D
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STA   $F2
            STX   $F4
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$001D
            STA   $F2
            STX   $F4
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L033554
            LDX   #^L033554
            STX   $5E
            STA   $5C
            LDA   #$0002
            STA   $C6
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STX   $26
            STA   $24
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STX   $DC
            STA   $DA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $A8
            STA   $A6
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            JSL   L014C78
            LDA   $EE
            CMP   #$0001
            BNE   L0A0B57
            LDA   #$0000
            BRA   L0A0B59
L0A0B57     LDA   $F0
L0A0B59     TAY
            TSC
            CLC
            ADC   #$00E0
            TCS
            TYA
            PLD
            RTL

L0A0B63     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$0011
            TCS
            LDA   #L03355F
            LDX   #^L03355F
            STX   $15
            STA   $13
            LDA   #L03356D
            LDX   #^L03356D
            STX   $1A
            STA   $18
            LDA   #L03357C
            LDX   #^L03357C
            STX   $1F
            STA   $1D
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STA   $F2
            STX   $F4
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$001D
            STA   $F2
            STX   $F4
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L033598
            LDX   #^L033598
            STX   $5E
            STA   $5C
            LDA   #$0003
            STA   $C6
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STX   $26
            STA   $24
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STX   $DC
            STA   $DA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $A8
            STA   $A6
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            JSL   L014C78
            LDA   $EE
            CMP   #$0001
            BNE   L0A0C46
            LDA   #$0000
            BRA   L0A0C48
L0A0C46     LDA   $F0
L0A0C48     TAY
            TSC
            CLC
            ADC   #$00E5
            TCS
            TYA
            PLD
            RTL

L0A0C52     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$0016
            TCS
            LDA   #L0335A5
            LDX   #^L0335A5
            STX   $1A
            STA   $18
            LDA   #L0335B9
            LDX   #^L0335B9
            STX   $1F
            STA   $1D
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STA   $F2
            STX   $F4
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$001D
            STA   $F2
            STX   $F4
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L0335CD
            LDX   #^L0335CD
            STX   $5E
            STA   $5C
            LDA   #$0002
            STA   $C6
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STX   $26
            STA   $24
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STX   $DC
            STA   $DA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $A8
            STA   $A6
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            JSL   L014C78
            LDA   $EE
            CMP   #$0001
            BNE   L0A0D14
            LDA   #$0000
            BRA   L0A0D16
L0A0D14     LDA   $F0
L0A0D16     TAY
            TSC
            CLC
            ADC   #$00E0
            TCS
            TYA
            PLD
            RTL

L0A0D20     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$0011
            TCS
            LDA   #L0335D2
            LDX   #^L0335D2
            STX   $15
            STA   $13
            LDA   #L0335E6
            LDX   #^L0335E6
            STX   $1A
            STA   $18
            LDA   #L0335FD
            LDX   #^L0335FD
            STX   $1F
            STA   $1D
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STA   $F2
            STX   $F4
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$001D
            STA   $F2
            STX   $F4
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0018
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L033611
            LDX   #^L033611
            STX   $5E
            STA   $5C
            LDA   #$0003
            STA   $C6
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STX   $26
            STA   $24
            LDX   #$0000
            TDC
            CLC
            ADC   #$0013
            STX   $DC
            STA   $DA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $A8
            STA   $A6
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            JSL   L014C78
            LDA   $EE
            CMP   #$0001
            BNE   L0A0E03
            LDA   #$0000
            BRA   L0A0E05
L0A0E03     LDA   $F0
L0A0E05     TAY
            TSC
            CLC
            ADC   #$00E5
            TCS
            TYA
            PLD
            RTL

L0A0E0F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$0004
            TCS
            LDA   #L033616
            LDX   #^L033616
            STX   $08
            STA   $06
            LDA   #L033626
            LDX   #^L033626
            STX   $0D
            STA   $0B
            LDA   #L033630
            LDX   #^L033630
            STX   $12
            STA   $10
            LDA   #L033638
            LDX   #^L033638
            STX   $17
            STA   $15
            LDA   #L033647
            LDX   #^L033647
            STX   $1C
            STA   $1A
            LDA   #L033654
            LDX   #^L033654
            STX   $21
            STA   $1F
            STZ   $F0
            BRA   L0A0E8B
L0A0E5A     LDA   $F0
            PHA
            LDA   #$0005
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0006
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            LDY   #$0004
            STA   [$F6],Y
            REP   #$20
            INC   $F0
L0A0E8B     LDA   $F0
            SEC
            SBC   #$0005
            BEQ   L0A0E5A
            BVS   L0A0E98
            EOR   #$8000
L0A0E98     BPL   L0A0E5A
            LDX   #$0000
            TDC
            CLC
            ADC   #$0006
            STA   $F6
            STX   $F8
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F6],Y
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0024
            PHA
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L033663
            LDX   #^L033663
            STX   $60
            STA   $5E
            LDA   #$0006
            STA   $C8
            LDX   #$0000
            TDC
            CLC
            ADC   #$0006
            STX   $28
            STA   $26
            LDX   #$0000
            TDC
            CLC
            ADC   #$0006
            STX   $DE
            STA   $DC
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $AA
            STA   $A8
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0024
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            JSL   L014C78
            LDA   $F2
            CMP   #$0001
            BNE   L0A0F25
            LDA   #$0000
            BRA   L0A0F27
L0A0F25     LDA   $F4
L0A0F27     TAY
            TSC
            CLC
            ADC   #$00F6
            TCS
            TYA
            PLD
            RTL

L0A0F31     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E8
            TCS
            LDY   #$0004
            LDA   [$F9],Y
            CMP   #$0103
            BEQ   L0A0F49
            BRL   L0A0FD9
L0A0F49     LDX   #$0000
            LDA   #$0032
            PHX
            PHA
            LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            JSL   L013333
            BEQ   L0A0F61
            BCS   L0A0F87
L0A0F61     LDA   [$FD]
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            LDA   #$0032
            JSL   L012E77
            LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            JSL   L013333
            BEQ   L0A0F87
            BCC   L0A0F87
            LDA   #$0001
            BRA   L0A0F8A
L0A0F87     LDA   #$0000
L0A0F8A     TAY
            BEQ   L0A0FD3
            LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            SEC
            SBC   #$0032
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            PEA   $0000
            PEA   $000A
            CLC
            JSL   L013048
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L012E77
            LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            PHX
            PHA
            PEI   $F7
            JSL   L0A0FF4
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   $EA
            BRA   L0A0FD7
L0A0FD3     LDA   $F7
            STA   $EA
L0A0FD7     BRA   L0A0FE8
L0A0FD9     PEI   $F7
            PEI   $FB
            PEI   $F9
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $EA
L0A0FE8     LDA   $EA
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0A0FF4     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E0
            TCS
            LDA   [$FD]
            BRL   L0A1150
L0A1004     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            PEA   ^L03883C
            PEA   L03883C
            JSL   L050256
            PLY
            PLY
            PLY
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            BRL   L0A115D
L0A102B     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            PEA   ^L038861
            PEA   L038861
            JSL   L050256
            PLY
            PLY
            PLY
            PLY
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDA   $F7
            BRL   L0A115D
L0A105E     PEA   ^L038885
            PEA   L038885
            JSL   L050256
            PLY
            PLY
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            STX   $EA
            STA   $E8
            LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDA   $E8
            LDX   $EA
            JSL   L014572
            PLY
            PLY
            STA   $E6
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            STX   $E4
            STA   $E2
            PEI   $E6
            PEA   ^L0388A9
            PEA   L0388A9
            JSL   L050256
            PLY
            PLY
            PLY
            LDA   [$FD]
            CMP   #$0002
            BEQ   L0A10B3
            BRL   L0A112F
L0A10B3     LDA   $E6
            CMP   #$0001
            BCC   L0A10D1
            LDA   [$E2]
            PHA
            LDA   #$0001
            PLX
            STX   $F0
            CLC
            ADC   $F0
            CMP   $E6
            BEQ   L0A10D1
            BCC   L0A10D1
            LDA   #$0001
            BRA   L0A10D4
L0A10D1     LDA   #$0000
L0A10D4     TAY
            BEQ   L0A111C
            PEA   ^L0388C2
            PEA   L0388C2
            JSL   L050256
            PLY
            PLY
            LDA   $E6
            SEC
            SBC   #$0001
            LDX   #$0000
            PEA   $0000
            PEA   $000A
            CLC
            JSL   L013048
            LDY   #$0004
            LDA   [$E2],Y
            TAX
            LDY   #$0002
            LDA   [$E2],Y
            JSL   L012E77
            LDX   $FB
            LDA   $F9
            PHX
            PHA
            PEI   $F7
            JSL   L0A0FF4
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L0A115D
            BRA   L0A112D
L0A111C     PEA   ^L0388F4
            PEA   L0388F4
            JSL   L050256
            PLY
            PLY
            LDA   $F7
            BRL   L0A115D
L0A112D     BRA   L0A113B
L0A112F     LDA   [$FD]
            CMP   #$0003
            BNE   L0A113B
            LDA   $E6
            BRL   L0A115D
L0A113B     BRL   L0A115D
L0A113E     LDA   $F7
            BRL   L0A115D
            BRL   L0A115D
L0A1146     DA    L0A1004
            DA    L0A102B
            DA    L0A105E
            DA    L0A105E
            DA    L0A113E
L0A1150     CMP   #$0004
            BCC   L0A1158
            LDA   #$0004
L0A1158     ASL
            TAX
            JMP   (L0A1146,X)

L0A115D     TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            PLD
            RTL


