*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg1C.L
            lst   off

*-----------

            use   Seg1C.X

*-----------

            use   4/Menu.Macs
            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L1C0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            PEA   ^L0329ED
            PEA   L0329ED
            JSL   L1A0E02
            PLY
            PLY
            LDA   L020131
            BEQ   L1C001F
            BRL   L1C01F3
L1C001F     LDA   #$FFFF
            STA   L020131
            PEI   $FB
            PEI   $F9
            JSL   L04039E
            PLY
            PLY
            JSL   L01021D
            PEI   $FF
            PEI   $FD
            PEA   $FFFF
            JSL   L09013B
            PLY
            PLY
            PLY
            PEA   $0000
            _DeleteMenu
* BCS L1C0050
* LDA #$0000
*L1C0050 STAL L0201E7
            PHX
            PHA
            PEA   ^L0327B3
            PEA   L0327B3
            _NewMenu
* BCS L1C0068
* LDA #$0000
*L1C0068 STAL L0201E7
            PLA
            PLX
            STX   L020135
            STA   L020133
            
            PHX
            PHA
            PEA   ^L0327D7
            PEA   L0327D7
            _NewMenu
* BCS L1C0088
* LDA #$0000
*L1C0088 STAL L0201E7
            PLA
            PLX
            STX   L020139
            STA   L020137
            
            PHX
            PHA
            PEA   ^L03281C
            PEA   L03281C
            _NewMenu
* BCS L1C00A8
* LDA #$0000
*L1C00A8 STAL L0201E7
            PLA
            PLX
            STX   L02013D
            STA   L02013B
            
            PHX
            PHA
            PEA   ^L032893
            PEA   L032893
            _NewMenu
* BCS L1C00C8
* LDA #$0000
*L1C00C8 STAL L0201E7
            PLA
            PLX
            STX   L020141
            STA   L02013F
            
            PHX
            PHA
            PEA   ^L0328F8
            PEA   L0328F8
            _NewMenu
* BCS L1C00E8
* LDA #$0000
*L1C00E8 STAL L0201E7
            PLA
            PLX
            STX   L020145
            STA   L020143
            
            PHX
            PHA
            PEA   ^L032973	; Droid menu
            PEA   L032973
            _NewMenu
* BCS L1C0108
* LDA #$0000
*L1C0108 STAL L0201E7
            PLA
            PLX
            STX   L020149
            STA   L020147

*--- New 202504

            LDX   L020149
            LDA   L020147
            PHX
            PHA
            PEA   $0000
            _InsertMenu

*--- end 202504

            LDX   L020145
            LDA   L020143
            PHX
            PHA
            PEA   $0000
            _InsertMenu
* BCS L1C012B
* LDA #$0000
*L1C012B STAL L0201E7

            LDX   L020141
            LDA   L02013F
            PHX
            PHA
            PEA   $0000
            _InsertMenu
* BCS L1C0146
* LDA #$0000
*L1C0146 STAL L0201E7
            LDX   L02013D
            LDA   L02013B
            PHX
            PHA
            PEA   $0000
            _InsertMenu
* BCS L1C0161
* LDA #$0000
*L1C0161 STAL L0201E7
            LDX   L020139
            LDA   L020137
            PHX
            PHA
            PEA   $0000
            _InsertMenu
* BCS L1C017C
* LDA #$0000
*L1C017C STAL L0201E7
            LDX   L020135
            LDA   L020133
            PHX
            PHA
            PEA   $0000
            _InsertMenu
* BCS L1C0197
* LDA #$0000
*L1C0197 STAL L0201E7

            PEA   $0001
            PEA   $0197
            _CheckMItem
* BCS L1C01AD
* LDA #$0000
*L1C01AD STAL L0201E7
            PEA   $0001
            PEA   $01F9
            _CheckMItem
* BCS L1C01C3
* LDA #$0000
*L1C01C3 STAL L0201E7
            PEA   $0001
            PEA   $0259
            _CheckMItem
* BCS L1C01D9
* LDA #$0000
*L1C01D9 STAL L0201E7
            PHA
            _FixMenuBar
* BCS L1C01EA
* LDA #$0000
*L1C01EA STAL L0201E7
            PLA
            JSL   L1A0E95
L1C01F3     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L1C01FD     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            _DrawMenuBar
* BCS L1C0214
* LDA #$0000
*L1C0214 STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0220     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            PEA   ^L0329FA
            PEA   L0329FA
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FB
            STA   $EC
            BRA   L1C0270
L1C023D     PEA   $0000
            LDA   $F9
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0327A5
            LDX   #^L0327A5
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDA   [$EE]
            CLC
            ADC   $EC
            PHA
            _CheckMItem
* BCS L1C026A
* LDA #$0000
*L1C026A STAL L0201E7
            INC   $EC
L1C0270     LDA   $EC
            CMP   $FD
            BEQ   L1C023D
            BCC   L1C023D
            LDA   $FF
            BEQ   L1C02AD
            PEA   $0001
            LDA   $F9
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0327A5
            LDX   #^L0327A5
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDA   [$EE]
            CLC
            ADC   $FF
            PHA
            _CheckMItem
* BCS L1C02A9
* LDA #$0000
*L1C02A9 STAL L0201E7
L1C02AD     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L1C02B9     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L032A07
            PEA   L032A07
            JSL   L1A0E02
            PLY
            PLY
            PEA   $0006
            _DeleteMenu
* BCS L1C02DF
* LDA #$0000
*L1C02DF STAL L0201E7
            PHA
            _FixMenuBar
* BCS L1C02F0
* LDA #$0000
*L1C02F0 STAL L0201E7
            PLA
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0301     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L032A17
            PEA   L032A17
            JSL   L1A0E02
            PLY
            PLY
            LDX   L020149
            LDA   L020147
            PHX
            PHA
            PEA   $0005
            _InsertMenu
* BCS L1C032F
* LDA #$0000
*L1C032F STAL L0201E7
            PHA
            _FixMenuBar
* BCS L1C0340
* LDA #$0000
*L1C0340 STAL L0201E7
            PLA
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0351     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0080
            PEA   $0004
            _SetMenuFlag
* BCS L1C036E
* LDA #$0000
*L1C036E STAL L0201E7
            PEA   $0080
            PEA   $0005
            _SetMenuFlag
* BCS L1C0384
* LDA #$0000
*L1C0384 STAL L0201E7
            PEA   $0191
            _DisableMItem
* BCS L1C0397
* LDA #$0000
*L1C0397 STAL L0201E7
            PEA   $0195
            _EnableMItem
* BCS L1C03AA
* LDA #$0000
*L1C03AA STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C03B6     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $FF7F
            PEA   $0004
            _SetMenuFlag
* BCS L1C03D3
* LDA #$0000
*L1C03D3 STAL L0201E7
            PEA   $FF7F
            PEA   $0005
            _SetMenuFlag
* BCS L1C03E9
* LDA #$0000
*L1C03E9 STAL L0201E7
            PEA   $0191
            _EnableMItem
* BCS L1C03FC
* LDA #$0000
*L1C03FC STAL L0201E7
            PEA   $0195
            _DisableMItem
* BCS L1C040F
* LDA #$0000
*L1C040F STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C041B     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L032A26
            PEA   L032A26
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FF
            BRL   L1C0456
L1C0437     JSL   L140206
            JSL   L1C01FD
            BRL   L1C0467
L1C0442     LDA   #$0001
            STA   L02011E
            BRL   L1C0467
L1C044B     BRL   L1C0467
L1C044E     DA    L1C0437
            DA    L1C044B
            DA    L1C0442
            DA    L1C044B

L1C0456     SEC
            SBC   #$012D
            CMP   #$0003
            BCC   L1C0462
            LDA   #$0003
L1C0462     ASL
            TAX
            JMP   (L1C044E,X)

L1C0467     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0473     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L032A3A
            PEA   L032A3A
            JSL   L1A0E02
            PLY
            PLY
            STZ   L0201BF
            PEA   $0000
            PEA   $0197
            _CheckMItem
* BCS L1C049F
* LDA #$0000
*L1C049F STAL L0201E7
            PEA   $0197
            _DisableMItem
* BCS L1C04B2
* LDA #$0000
*L1C04B2 STAL L0201E7
            JSL   L19003E
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C04C6     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0197
            _EnableMItem
* BCS L1C04E0
* LDA #$0000
*L1C04E0 STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C04EC     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L0201BF
            PEA   $0000
            PEA   $0197
            _CheckMItem
* BCS L1C050C
* LDA #$0000
*L1C050C STAL L0201E7
            JSL   L19003E
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C051C     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0001
            STA   L0201BF
            PEA   $0001
            PEA   $0197
            _CheckMItem
* BCS L1C053F
* LDA #$0000
*L1C053F STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C054B     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L032A46
            PEA   L032A46
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FF
            BRL   L1C05A5
L1C0567     JSL   L0D02F7
            JSL   L130027
            BRL   L1C05B6
L1C0572     JSL   L0D02F7
            JSL   L130040
            BRL   L1C05B6
L1C057D     JSL   L26068A
            BRL   L1C05B6
L1C0584     JSL   L2605E3
            BRL   L1C05B6
L1C058B     JSL   L230B1C
            BRL   L1C05B6
L1C0592     BRL   L1C05B6
L1C0595     DA    L1C0567
            DA    L1C0572
            DA    L1C0592
            DA    L1C057D
            DA    L1C0584
            DA    L1C0592
            DA    L1C058B
            DA    L1C0592
L1C05A5     SEC
            SBC   #$0191
            CMP   #$0007
            BCC   L1C05B1
            LDA   #$0007
L1C05B1     ASL
            TAX
            JMP   (L1C0595,X)

L1C05B6     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C05C2     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0001
            PEA   $01F9
            _CheckMItem
* BCS L1C05DF
* LDA #$0000
*L1C05DF STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C05EB     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0000
            PEA   $01F9
            _CheckMItem
* BCS L1C0608
* LDA #$0000
*L1C0608 STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0614     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L032A5A
            PEA   L032A5A
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FF
            CMP   #$01F5
            BNE   L1C0636
            JSL   L25024D
L1C0636     LDA   $FF
            CMP   #$01F6
            BNE   L1C0641
            JSL   L2502B9
L1C0641     LDA   $FF
            CMP   #$01F7
            BNE   L1C064C
            JSL   L2502E0
L1C064C     LDA   $FF
            CMP   #$01F9
            BNE   L1C0657
            JSL   L210761
L1C0657     JSL   L2107B2
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0667     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            JSL   L250152
            PHA
            PEA   $0005
            PEA   $0001
            PEA   $0005
            JSL   L1C0220
            PLY
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0690     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L032A70
            PEA   L032A70
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FF
            BRL   L1C06DE
L1C06AC     JSL   L2500A9
            BRL   L1C06EF
L1C06B3     JSL   L2500C5
            BRL   L1C06EF
L1C06BA     JSL   L2500F4
            BRL   L1C06EF
L1C06C1     JSL   L250123
            BRL   L1C06EF
L1C06C8     JSL   L2501BB
            BRL   L1C06EF
L1C06CF     BRL   L1C06EF
L1C06D2     DA    L1C06AC
            DA    L1C06B3
            DA    L1C06BA
            DA    L1C06C1
            DA    L1C06C8
            DA    L1C06CF
L1C06DE     SEC
            SBC   #$0259
            CMP   #$0005
            BCC   L1C06EA
            LDA   #$0005
L1C06EA     ASL
            TAX
            JMP   (L1C06D2,X)

L1C06EF     JSL   L1C0667
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C06FF     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L032A85
            PEA   L032A85
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FF
            CMP   #$028B
            BNE   L1C0721
            JSL   L250307
L1C0721     LDA   $FF
            CMP   #$028C
            BNE   L1C072C
            JSL   L250374
L1C072C     LDA   $FF
            CMP   #$028E
            BNE   L1C0737
            JSL   L25039B
L1C0737     LDA   $FF
            CMP   #$028F
            BNE   L1C0742
            JSL   L2505B2
L1C0742     LDA   $FF
            CMP   #$0290
            BNE   L1C074D
            JSL   L25043C
L1C074D     LDA   $FF
            CMP   #$0291
            BNE   L1C0758
            JSL   L2504F7
L1C0758     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1C0764     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            PEA   ^L032A9F
            PEA   L032A9F
            JSL   L1A0E02
            PLY
            PLY
            LDX   $FF
            LDA   $FD
            STX   $F2
            ORA   $F2
            BNE   L1C0788
            BRL   L1C0822
L1C0788     LDX   #$0000
            LDA   #$0010
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            SEC
            JSL   L1A186E
            PLA
            PLX
            STA   $F0
            LDX   $FF
            LDA   $FD
            AND   #$FFFF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   $EE
            LDA   $F0
            BRL   L1C0814
L1C07B2     PEA   ^L032AB8
            PEA   L032AB8
            JSL   L240DF3
            PLY
            PLY
            _ShowCursor
* BCS L1C07CA
* LDA #$0000
*L1C07CA STAL L0201E7
            BRL   L1C0822
L1C07D1     PEI   $EE
            JSL   L1C041B
            PLY
            BRL   L1C0822
L1C07DB     PEI   $EE
            JSL   L1C054B
            PLY
            BRL   L1C0822
L1C07E5     PEI   $EE
            JSL   L1C0614
            PLY
            BRL   L1C0822
L1C07EF     PEI   $EE
            JSL   L1C0690
            PLY
            BRL   L1C0822
L1C07F9     PEI   $EE
            JSL   L1C06FF
            PLY
            BRL   L1C0822
L1C0803     BRL   L1C0822
L1C0806     DA    L1C07B2
            DA    L1C07D1
            DA    L1C07DB
            DA    L1C07E5
            DA    L1C07EF
            DA    L1C07F9
            DA    L1C0803
L1C0814     DEC
            CMP   #$0006
            BCC   L1C081D
            LDA   #$0006
L1C081D     ASL
            TAX
            JMP   (L1C0806,X)

L1C0822     PEA   $0000
            PEI   $F0
            _HiliteMenu
* BCS L1C0833
* LDA #$0000
*L1C0833 STAL L0201E7
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

