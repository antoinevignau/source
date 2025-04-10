*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg10.L
            lst   off

*-----------

            use   Seg10.E
            use   Seg10.X

*-----------

            use   4/Event.Macs
            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L100000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L020087
            PHA
            JSL   L150000
            PLY
            LDA   L020087
            CMP   #$0009
            BNE   L100020
            JSL   L1C0301
L100020     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L100028     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E0
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            PEI   $F9
            PEI   $FB
            PEI   $FD
            PEI   $FF
            _SetRect
* BCS L100050
* LDA #$0000
*L100050 STAL L0201E7
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            _PtInRect
* BCS L100073
* LDA #$0000
*L100073 STAL L0201E7
            PLA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L100082     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $00C7
            PEA   $0137
            PEA   $0080
            PEA   $0105
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L1000D1
            JSL   L0F1979
            BRL   L1003B6
L1000D1     PEA   $00AF
            PEA   $00D4
            PEA   $0082
            PEA   $00AE
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L100114
            LDA   #$0001
            STA   L020087
L100114     PEA   $0057
            PEA   $00C2
            PEA   $0027
            PEA   $0079
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L100157
            LDA   #$0007
            STA   L020087
L100157     PEA   $007F
            PEA   $00E8
            PEA   $0067
            PEA   $00C9
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L10019A
            LDA   #$0002
            STA   L020087
L10019A     PEA   $00C7
            PEA   $010A
            PEA   $008B
            PEA   $00D2
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L1001DD
            LDA   #$0006
            STA   L020087
L1001DD     PEA   $00C7
            PEA   $003B
            PEA   $005B
            PEA   $0009
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L100220
            LDA   #$0004
            STA   L020087
L100220     PEA   $008C
            PEA   $008D
            PEA   $0049
            PEA   $003C
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L100263
            LDA   #$0005
            STA   L020087
L100263     PEA   $005D
            PEA   $0106
            PEA   $002E
            PEA   $00CD
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L1002A6
            LDA   #$0003
            STA   L020087
L1002A6     PEA   $0087
            PEA   $0138
            PEA   $003F
            PEA   $00F5
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L1002E9
            LDA   #$0008
            STA   L020087
L1002E9     PEA   $0028
            PEA   $0138
            PEA   $0000
            PEA   $00EA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L10032C
            LDA   #$0001
            STA   L02011E
L10032C     PEA   $0061
            PEA   $0039
            PEA   $002D
            PEA   $0008
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L10036F
            LDA   #$0009
            STA   L020087
L10036F     PEA   $002D
            PEA   $0095
            PEA   $0004
            PEA   $000B
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FD
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100028
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L1003B6
            JSL   L260415
            LDA   #$0001
            STA   L020087
L1003B6     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1003C0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0001
            STA   L020085
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1003D9     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0002
            STA   L020085
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1003F2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L020085
            CMP   #$0001
            BNE   L100409
            JSL   L230532
L100409     LDA   L020085
            CMP   #$0002
            BNE   L100415
            JSL   L230513
L100415     STZ   L020085
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L100420     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00DC
            TCS
            LDA   L020087
            CMP   #$0009
            BNE   L100437
            JSL   L1C02B9
L100437     STZ   L020087
            JSL   L26043E
            JSL   L1003F2
            LDX   L0200A2
            LDA   L0200A0
            PHX
            PHA
            JSL   L04039E
            PLY
            PLY
            JSL   L0F1956
L100454     LDA   L020087
            BEQ   L10045C
            BRL   L1004C2
L10045C     LDA   L02011E
            BEQ   L100464
            BRL   L1004C2
L100464     JSL   L130330
            PHA
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            _GetNextEvent
* BCS L100481
* LDA #$0000
*L100481 STAL L0201E7
            PLA
            TAY
            BEQ   L1004B1
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E8
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L100082
            PLY
            PLY
L1004B1     JSL   L0F144E
            JSL   L230000
            TAY
            BNE   L1004C0
            JSL   L2304F4
L1004C0     BRA   L100454
L1004C2     LDA   L02011E
            BNE   L1004E7
            JSL   L100000
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
* BCS L1004DE
* LDA #$0000
*L1004DE STAL L0201E7
            PLA
            JSL   L130027
L1004E7     JSL   L2303E6
            TSC
            CLC
            ADC   #$001E
            TCS
            PLD
            RTL

L1004F3     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L020116
            PEA   L020116
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L020153
            PEA   L020153
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L020059
            PEA   L020059
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L0201B7
            PEA   L0201B7
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L0201B3
            PEA   L0201B3
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L02014F
            PEA   L02014F
            JSL   L0405BC
            PLY
            PLY
            JSL   L0F1619
            _HideCursor
* BCS L100556
* LDA #$0000
*L100556 STAL L0201E7
            LDX   L0201B1
            LDA   L0201AF
            STX   $F6
            ORA   $F6
            BNE   L100578
            PEA   ^L031FEA
            PEA   L031FEA
            JSL   L050542
            PLY
            PLY
            STX   L0201B1
            STA   L0201AF
L100578     LDX   L02011C
            LDA   L02011A
            STX   $F6
            ORA   $F6
            BNE   L100596
            PEA   ^L031FFD
            PEA   L031FFD
            JSL   L050542
            PLY
            PLY
            STX   L02011C
            STA   L02011A
L100596     LDX   L020114
            LDA   L020112
            STX   $F6
            ORA   $F6
            BNE   L1005B4
            PEA   ^L032010
            PEA   L032010
            JSL   L050542
            PLY
            PLY
            STX   L020114
            STA   L020112
L1005B4     PEA   $0000
            PEA   $1F40
            JSL   L040514
            PLY
            PLY
            STX   L02001B
            STA   L020019
            JSL   L060000
            PEA   $0000
            JSL   L050565
            PLY
            LDX   L020114
            LDA   L020112
            PHX
            PHA
            LDX   L02014D
            LDA   L02014B
            PHX
            PHA
            JSL   L1C0000
            PLY
            PLY
            PLY
            PLY
            JSL   L140171
            _InitCursor
* BCS L1005FA
* LDA #$0000
*L1005FA STAL L0201E7
            JSL   L100420
            _HideCursor
* BCS L10060E
* LDA #$0000
*L10060E STAL L0201E7
            PEA   ^L02011A
            PEA   L02011A
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L020112
            PEA   L020112
            JSL   L0405BC
            PLY
            PLY
            PEA   ^L0201AF
            PEA   L0201AF
            JSL   L0405BC
            PLY
            PLY
            LDX   L02001B
            LDA   L020019
            PHX
            PHA
            JSL   L040537
            PLY
            PLY
            LDX   L0201B5
            LDA   L0201B3
            STX   $F6
            ORA   $F6
            BNE   L100662
            PEA   ^L032021
            PEA   L032021
            JSL   L050542
            PLY
            PLY
            STX   L0201B5
            STA   L0201B3
L100662     LDA   L02011E
            BEQ   L10066A
            BRL   L1006C4
L10066A     LDX   L020118
            LDA   L020116
            STX   $F6
            ORA   $F6
            BNE   L100688
            PEA   ^L032034
            PEA   L032034
            JSL   L05051F
            PLY
            PLY
            STX   L020118
            STA   L020116
L100688     LDX   L020155
            LDA   L020153
            STX   $F6
            ORA   $F6
            BNE   L1006A6
            PEA   ^L032046
            PEA   L032046
            JSL   L050542
            PLY
            PLY
            STX   L020155
            STA   L020153
L1006A6     LDX   L020151
            LDA   L02014F
            STX   $F6
            ORA   $F6
            BNE   L1006C4
            PEA   $0000
            PEA   $7D00
            JSL   L040514
            PLY
            PLY
            STX   L020151
            STA   L02014F
L1006C4     LDA   #$FFFF
            STA   L02010C
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

