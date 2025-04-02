*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg16.L
            lst   off

*-----------

            use   Seg16.E
            use   Seg16.X

*-----------

            use   4/Util.Macs

*-----------

L160000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L0200EE
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L160016     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$00FA
            SEC
            SBC   L0200B8
            PHA
            LDA   #$FF06
            CLC
            ADC   L0200B8
            PHA
            LDX   L0200F6
            LDA   L0200F4
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L160046
            DEX
L160046     STX   L0200F6
            STA   L0200F4
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L160054     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L0200F6
            LDA   L0200F4
            CLC
            ADC   L0200FC
            PHA
            TXA
            ADC   L0200FE
            TAX
            PLA
            STX   L0200F6
            STA   L0200F4
            LDX   L0200FA
            LDA   L0200F8
            CLC
            ADC   L020100
            PHA
            TXA
            ADC   L020102
            TAX
            PLA
            STX   L0200FA
            STA   L0200F8
            SEC
            LDA   L0200F4
            SBC   #$00E2
            BNE   L16009E
            LDA   L0200F6
            SBC   #$0000
            BRA   L1600A6
L16009E     LDA   L0200F6
            SBC   #$0000
            REP   #$02
L1600A6     BEQ   L1600CB
            BVS   L1600AD
            EOR   #$8000
L1600AD     BPL   L1600CB
            LDX   #$0000
            LDA   #$00E2
            STX   L0200F6
            STA   L0200F4
            LDX   L0200FE
            LDA   L0200FC
            JSL   L1A0F0A
            STX   L0200FE
            STA   L0200FC
L1600CB     SEC
            LDA   L0200F4
            SBC   #$FF1E
            BNE   L1600DC
            LDA   L0200F6
            SBC   #$FFFF
            BRA   L1600E4
L1600DC     LDA   L0200F6
            SBC   #$FFFF
            REP   #$02
L1600E4     BVS   L1600E9
            EOR   #$8000
L1600E9     BMI   L160107
            LDX   #$FFFF
            LDA   #$FF1E
            STX   L0200F6
            STA   L0200F4
            LDX   L0200FE
            LDA   L0200FC
            JSL   L1A0F0A
            STX   L0200FE
            STA   L0200FC
L160107     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L16010F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            SEC
            LDA   L0200F8
            SBC   #$041F
            BNE   L16012B
            LDA   L0200FA
            SBC   #$0000
            BRA   L160133
L16012B     LDA   L0200FA
            SBC   #$0000
            REP   #$02
L160133     BVS   L160138
            EOR   #$8000
L160138     BMI   L160140
            JSL   L160054
            BRA   L160144
L160140     JSL   L160016
L160144     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L16014C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L020161
            LDA   L02015F
            STX   L0200F6
            STA   L0200F4
            LDX   L020165
            LDA   L020163
            STX   L0200FA
            STA   L0200F8
            LDX   L020169
            LDA   L020167
            STX   L0200FE
            STA   L0200FC
            LDX   L02016D
            LDA   L02016B
            STX   L020102
            STA   L020100
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L16018F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200CE
            PHA
            LDA   L0200CE
            EOR   #$FFFF
            INC
            PHA
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L1601B3
            DEX
L1601B3     PHX
            PHA
            LDX   L0200F6
            LDA   L0200F4
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200F6
            STA   L0200F4
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1601CF     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   #$0001
            STA   L0200EE
            JSL   L16014C
            JSL   L16018F
            STZ   $F4
            BRA   L1601F2
L1601EC     JSL   L16010F
            INC   $F4
L1601F2     LDA   $F4
            SEC
            SBC   L0200CA
            BVS   L1601FD
            EOR   #$8000
L1601FD     BPL   L1601EC
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L160207     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0001
            PHA
            LDA   L0200BC
            CLC
            ADC   L0200C0
            SEC
            JSL   L1A184A
            PLA
            SEC
            SBC   L02001F
            BVS   L16022C
            EOR   #$8000
L16022C     BMI   L160240
            LDA   L0200C0
            LDX   #$0000
            TAY
            BPL   L160238
            DEX
L160238     STX   L0200F6
            STA   L0200F4
            BRA   L160250
L160240     LDA   L0200BC
            LDX   #$0000
            TAY
            BPL   L16024A
            DEX
L16024A     STX   L0200F6
            STA   L0200F4
L160250     STZ   L0200FC
            STZ   L0200FE
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L16025E     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0002
            PHA
            LDA   L0200C8
            CLC
            ADC   L0200C4
            SEC
            JSL   L1A0F19
            PLY
            PHA
            LDA   #$0578
            PLX
            STX   $FA
            SEC
            SBC   $FA
            SEC
            SBC   L02001D
            BVS   L16028D
            EOR   #$8000
L16028D     BMI   L1602A5
            LDA   #$0578
            SEC
            SBC   L0200C8
            LDX   #$0000
            TAY
            BPL   L16029D
            DEX
L16029D     STX   L0200FA
            STA   L0200F8
            BRA   L1602B9
L1602A5     LDA   #$0578
            SEC
            SBC   L0200C4
            LDX   #$0000
            TAY
            BPL   L1602B3
            DEX
L1602B3     STX   L0200FA
            STA   L0200F8
L1602B9     STZ   L020100
            STZ   L020102
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1602C7     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L0200EE
            JSL   L16025E
            JSL   L160207
            JSL   L16018F
            JSL   L160016
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1602ED     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L020104
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
            LDA   L0200E6
            PHA
            LDA   L0200E2
            PHA
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L160323
            DEX
L160323     PHX
            PHA
            LDX   L0200F6
            LDA   L0200F4
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200F6
            STA   L0200F4
            LDA   L0200E8
            PHA
            LDA   L0200E4
            PHA
            PEA   $0005
            PEA   $0000
            LDA   L020104
            PHA
            JSL   L1B0404
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L160359
            DEX
L160359     PHX
            PHA
            LDX   L0200FA
            LDA   L0200F8
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200FA
            STA   L0200F8
            INC   L020104
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L160378     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0002
            STA   L0200EE
            LDX   L0200F6
            LDA   L0200F4
            STA   L0200F0
            LDX   L0200FA
            LDA   L0200F8
            STA   L0200F2
            LDA   L0200E6
            PHA
            LDA   L0200E2
            PHA
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L1603B0
            DEX
L1603B0     PHX
            PHA
            LDX   L0200F6
            LDA   L0200F4
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200F6
            STA   L0200F4
            LDA   L0200E8
            PHA
            LDA   L0200E4
            PHA
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L1603D9
            DEX
L1603D9     PHX
            PHA
            LDX   L0200FA
            LDA   L0200F8
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200FA
            STA   L0200F8
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1603F5     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200D0
            BNE   L160408
            BRL   L160450
L160408     LDA   L020021
            BEQ   L16042C
            LDA   L0200D0
            PHA
            LDA   L0200D0
            EOR   #$FFFF
            INC
            PHA
            JSL   L1B0242
            PLY
            PLY
            PHA
            LDA   L020021
            PLX
            STX   $FA
            CLC
            ADC   $FA
            STA   L020021
L16042C     LDA   L020023
            BEQ   L160450
            LDA   L0200D0
            PHA
            LDA   L0200D0
            EOR   #$FFFF
            INC
            PHA
            JSL   L1B0242
            PLY
            PLY
            PHA
            LDA   L020023
            PLX
            STX   $FA
            CLC
            ADC   $FA
            STA   L020023
L160450     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L160458     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200BA
            PHA
            LDA   L0200BE
            EOR   #$FFFF
            INC
            PHA
            LDA   L020021
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020021
            LDA   L0200C6
            PHA
            LDA   L0200C2
            EOR   #$FFFF
            INC
            PHA
            LDA   L020023
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020023
            JSL   L1603F5
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1604A3     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200D2
            PHA
            LDA   L0200D4
            EOR   #$FFFF
            INC
            PHA
            LDA   L020021
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020021
            LDA   L0200D8
            PHA
            LDA   L0200D6
            EOR   #$FFFF
            INC
            PHA
            LDA   L020023
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020023
            JSL   L1603F5
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1604EE     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200EA
            PHA
            LDA   L0200EA
            EOR   #$FFFF
            INC
            PHA
            LDA   L020021
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020021
            LDA   L0200EC
            PHA
            PEA   $0000
            LDA   L020023
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020023
            JSL   L1603F5
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L160534     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            SEC
            LDA   L0200F8
            SBC   #$041F
            BNE   L160550
            LDA   L0200FA
            SBC   #$0000
            BRA   L160558
L160550     LDA   L0200FA
            SBC   #$0000
            REP   #$02
L160558     BVS   L16055D
            EOR   #$8000
L16055D     BMI   L160565
            JSL   L160054
            BRA   L160569
L160565     JSL   L160016
L160569     LDA   L02001F
            LDX   #$0000
            TAY
            BPL   L160573
            DEX
L160573     PHX
            PHA
            LDX   L0200F6
            LDA   L0200F4
            JSL   L1A108F
            PLA
            PLX
            STA   L020021
            LDA   L02001D
            LDX   #$0000
            TAY
            BPL   L16058E
            DEX
L16058E     PHX
            PHA
            LDX   L0200FA
            LDA   L0200F8
            JSL   L1A108F
            PLA
            PLX
            STA   L020023
            LDA   L0200EE
            BNE   L1605BD
            JSL   L160458
            LDA   L020023
            BNE   L1605B1
            JSL   L16025E
L1605B1     LDA   L020021
            BNE   L1605BA
            JSL   L160207
L1605BA     BRL   L16063D
L1605BD     LDA   L0200EE
            CMP   #$0001
            BNE   L1605DA
            JSL   L1604A3
            LDA   L020023
            BNE   L1605D7
            LDA   L020021
            BNE   L1605D7
            JSL   L160378
L1605D7     BRL   L16063D
L1605DA     LDA   L0200EE
            SEC
            SBC   #$0002
            BVS   L1605E6
            EOR   #$8000
L1605E6     BMI   L1605EB
            BRL   L16063D
L1605EB     JSL   L1604EE
            LDA   L020023
            BNE   L1605FF
            LDA   L020021
            BNE   L1605FF
            LDA   #$0003
            STA   L0200EE
L1605FF     LDA   L0200F2
            LDX   #$0000
            TAY
            BPL   L160609
            DEX
L160609     PHX
            PHA
            LDX   L020165
            LDA   L020163
            CLC
            ADC   L02016B
            PHA
            TXA
            ADC   L02016D
            TAX
            PLA
            JSL   L1A130B
            BEQ   L160629
            BVS   L160627
            EOR   #$8000
L160627     BMI   L16063D
L160629     LDA   L0200F0
            SEC
            SBC   L02001F
            STA   L020021
            LDA   L0200F2
            SEC
            SBC   L02001D
            STA   L020023
L16063D     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L160645     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            SEC
            LDA   L02016B
            SBC   #$0000
            BNE   L160661
            LDA   L02016D
            SBC   #$0000
            BRA   L160669
L160661     LDA   L02016D
            SBC   #$0000
            REP   #$02
L160669     BEQ   L160672
            BVS   L160670
            EOR   #$8000
L160670     BMI   L16067D
L160672     LDA   L0200EE
            BEQ   L16067B
            JSL   L1602C7
L16067B     BRA   L1606BC
L16067D     LDA   L0200EE
            BNE   L1606BC
            PEA   $01F4
            LDA   #$0578
            SEC
            SBC   L0200CC
            PHA
            JSL   L1B0099
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L16069A
            DEX
L16069A     PHX
            PHA
            LDX   L020165
            LDA   L020163
            SEC
            SBC   #$0018
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            JSL   L1A130B
            BVS   L1606B6
            EOR   #$8000
L1606B6     BMI   L1606BC
            JSL   L1601CF
L1606BC     JSL   L160534
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1606C8     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L0324E7
            PEA   L0324E7
            JSL   L1A0E02
            PLY
            PLY
            STZ   $F4
            JSL   L1602C7
L1606E5     LDA   L02001D
            SEC
            SBC   #$0429
            BEQ   L160705
            BVS   L1606F3
            EOR   #$8000
L1606F3     BPL   L160705
            LDA   $F4
            SEC
            SBC   #$001E
            BVS   L160700
            EOR   #$8000
L160700     BPL   L160705
            BRL   L160755
L160705     LDA   L020106
            BNE   L16070D
            BRL   L160755
L16070D     JSL   L1302A9
            JSL   L160534
            LDA   #$0002
            PHA
            PEA   $0005
            LDA   L0200C6
            PHA
            JSL   L1B0099
            PLY
            PLY
            PHA
            LDA   #$0003
            SEC
            JSL   L1A109A
            PLA
            SEC
            JSL   L1A0F19
            PLY
            STA   L020023
            JSL   L0E0019
            JSL   L0802D6
            JSL   L08034B
            JSL   L21016B
            JSL   L0F11B0
            JSL   L1D0000
            INC   $F4
            BRA   L1606E5
L160755     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L160761     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L020106
            BNE   L160774
            BRL   L1607CC
L160774     LDA   L02001F
            LDX   #$0000
            TAY
            BPL   L16077E
            DEX
L16077E     PHX
            PHA
            LDX   L020161
            LDA   L02015F
            JSL   L1A108F
            PLA
            PLX
            STA   L020021
            LDA   L02001D
            LDX   #$0000
            TAY
            BPL   L160799
            DEX
L160799     PHX
            PHA
            LDX   L020165
            LDA   L020163
            JSL   L1A108F
            PLA
            PLX
            STA   L020023
            LDA   #$0003
            STA   L0200EE
            JSL   L0E0019
            JSL   L0802D6
            JSL   L08034B
            JSL   L21016B
            JSL   L1F025A
            JSL   L0F11B0
            JSL   L1D0000
L1607CC     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1607D4     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PEA   ^L0324F3
            PEA   L0324F3
            JSL   L1A0E02
            PLY
            PLY
            JSL   L0F1515
            JSL   L1F0238
            LDA   L020087
            CMP   #$0007
            BEQ   L1607FF
            JSL   L1606C8
L1607FF     PEA   $0001
            LDA   L0200EA
            PHA
            JSL   L1B0099
            PLY
            PLY
            STA   $F4
            PEA   $0001
            LDA   L0200EC
            PHA
            JSL   L1B0099
            PLY
            PLY
            STA   $F2
            LDA   #$0001
            STA   L0200EE
            LDA   L020087
            BRL   L1608D2
L160829     JSL   L22028A
            BRL   L1608E3
L160830     JSL   L220231
            BRL   L1608E3
L160837     LDA   L0200DE
            PHA
            LDA   L0200E0
            PHA
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L16084C
            DEX
L16084C     PHX
            PHA
            LDX   L020165
            LDA   L020163
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200FA
            STA   L0200F8
            LDA   L0200DA
            PHA
            LDA   L0200DC
            PHA
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L160875
            DEX
L160875     STX   L0200F6
            STA   L0200F4
            LDA   #$00FA
            SEC
            SBC   L0200B8
            PHA
            LDA   #$FF06
            CLC
            ADC   L0200B8
            PHA
            LDX   L0200F6
            LDA   L0200F4
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L1608A0
            DEX
L1608A0     STX   L0200F6
            STA   L0200F4
            PEA   $0578
            PEA   $0384
            LDX   L0200FA
            LDA   L0200F8
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L1608C1
            DEX
L1608C1     STX   L0200FA
            STA   L0200F8
            BRL   L1608E3
L1608CA     DA    L160830
            DA    L160837
            DA    L160829
            DA    L160837
L1608D2     SEC
            SBC   #$0006
            CMP   #$0003
            BCC   L1608DE
            LDA   #$0003
L1608DE     ASL
            TAX
            JMP   (L1608CA,X)

L1608E3     LDA   #$0001
            STA   L020021
L1608E9     LDA   L020021
            BNE   L1608F6
            LDA   L020023
            BNE   L1608F6
            BRL   L160981
L1608F6     LDA   L020106
            BNE   L1608FE
            BRL   L160981
L1608FE     JSL   L1302A9
            LDA   L02001F
            LDX   #$0000
            TAY
            BPL   L16090C
            DEX
L16090C     PHX
            PHA
            LDX   L0200F6
            LDA   L0200F4
            JSL   L1A108F
            PLA
            PLX
            STA   L020021
            PEI   $F4
            LDA   $F4
            EOR   #$FFFF
            INC
            PHA
            LDA   L020021
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020021
            LDA   L02001D
            LDX   #$0000
            TAY
            BPL   L16093E
            DEX
L16093E     PHX
            PHA
            LDX   L0200FA
            LDA   L0200F8
            JSL   L1A108F
            PLA
            PLX
            STA   L020023
            PEI   $F2
            LDA   $F2
            EOR   #$FFFF
            INC
            PHA
            LDA   L020023
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            STA   L020023
            JSL   L0E0019
            JSL   L0802D6
            JSL   L08034B
            JSL   L21016B
            JSL   L0F11B0
            JSL   L1D0000
            BRL   L1608E9
L160981     LDA   L020087
            CMP   #$0009
            BNE   L16098D
            JSL   L2205CC
L16098D     LDA   L020087
            CMP   #$0007
            BNE   L16099B
            JSL   L220448
            BRA   L16099F
L16099B     JSL   L160761
L16099F     JSL   L1A0E95
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

