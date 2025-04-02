*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg1B.L
            lst   off

*-----------

            use   Seg1B.X

*-----------

            use   4/Event.Macs
            use   4/Misc.Macs
            use   4/Util.Macs

*-----------

L1B0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L1B0016
            EOR   #$8000
L1B0016     BMI   L1B0022
            LDA   $FF
            EOR   #$FFFF
            INC
            BRA   L1B0024
            BRA   L1B0024
L1B0022     LDA   $FF
L1B0024     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B002E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            SEC
            LDA   $FD
            SBC   #$0000
            BNE   L1B0048
            LDA   $FF
            SBC   #$0000
            BRA   L1B004F
L1B0048     LDA   $FF
            SBC   #$0000
            REP   #$02
L1B004F     BVS   L1B0054
            EOR   #$8000
L1B0054     BMI   L1B0062
            LDX   $FF
            LDA   $FD
            JSL   L1A0F0A
            BRA   L1B0066
            BRA   L1B0066
L1B0062     LDX   $FF
            LDA   $FD
L1B0066     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B0070     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            SEC
            SBC   $FF
            BVS   L1B0085
            EOR   #$8000
L1B0085     BMI   L1B008D
            LDA   $FD
            BRA   L1B008F
            BRA   L1B008F
L1B008D     LDA   $FF
L1B008F     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B0099     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            SEC
            SBC   $FF
            BEQ   L1B00B8
            BVS   L1B00B0
            EOR   #$8000
L1B00B0     BPL   L1B00B8
            LDA   $FD
            BRA   L1B00BA
            BRA   L1B00BA
L1B00B8     LDA   $FF
L1B00BA     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B00C4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FD
            CMP   $FF
            BMI   L1B00DC
            LDX   $FF
            STX   $FD
            STA   $FF
            TXA
L1B00DC     CMP   $FB
            BMI   L1B00E2
            STA   $FB
L1B00E2     LDA   $FF
            CMP   $FB
            BPL   L1B00EA
            STA   $FB
L1B00EA     LDA   $FB
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            SEC
            SBC   #$0000
            BVS   L1B010C
            EOR   #$8000
L1B010C     BMI   L1B0121
            LDA   $FF
            EOR   #$FFFF
            INC
            PHA
            PEI   $FD
            JSL   L1B0099
            PLY
            PLY
            BRA   L1B012B
            BRA   L1B012B
L1B0121     PEI   $FF
            PEI   $FD
            JSL   L1B0070
            PLY
            PLY
L1B012B     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B0135     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            SEC
            LDA   $F9
            SBC   $FD
            BNE   L1B014D
            LDA   $FB
            SBC   $FF
            BRA   L1B0153
L1B014D     LDA   $FB
            SBC   $FF
            REP   #$02
L1B0153     BVS   L1B0158
            EOR   #$8000
L1B0158     BMI   L1B0162
            LDX   $FB
            LDA   $F9
            BRA   L1B0166
            BRA   L1B0166
L1B0162     LDX   $FF
            LDA   $FD
L1B0166     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B0170     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            SEC
            LDA   $F9
            SBC   $FD
            BNE   L1B0188
            LDA   $FB
            SBC   $FF
            BRA   L1B018E
L1B0188     LDA   $FB
            SBC   $FF
            REP   #$02
L1B018E     BEQ   L1B019F
            BVS   L1B0195
            EOR   #$8000
L1B0195     BPL   L1B019F
            LDX   $FB
            LDA   $F9
            BRA   L1B01A3
            BRA   L1B01A3
L1B019F     LDX   $FF
            LDA   $FD
L1B01A3     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEI   $F5
            JSL   L1B0170
            PLY
            PLY
            PLY
            PLY
            STX   $F7
            STA   $F5
            PEI   $FF
            PEI   $FD
            PEI   $F7
            PEI   $F5
            JSL   L1B0135
            PLY
            PLY
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            SEC
            LDA   $F9
            SBC   #$0000
            BNE   L1B0200
            LDA   $FB
            SBC   #$0000
            BRA   L1B0207
L1B0200     LDA   $FB
            SBC   #$0000
            REP   #$02
L1B0207     BVS   L1B020C
            EOR   #$8000
L1B020C     BMI   L1B0228
            LDX   $FF
            LDA   $FD
            JSL   L1A0F0A
            PHX
            PHA
            PEI   $FB
            PEI   $F9
            JSL   L1B0170
            PLY
            PLY
            PLY
            PLY
            BRA   L1B0238
            BRA   L1B0238
L1B0228     PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            JSL   L1B0135
            PLY
            PLY
            PLY
            PLY
L1B0238     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B0242     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDA   $FD
            CMP   $FF
            BMI   L1B0259
            LDX   $FF
            STX   $FD
            STA   $FF
L1B0259     INC   $FF
            JSL   L09007C
            LDX   #$0000
            STX   $F0
            STA   $EE
            LDA   $FF
            SEC
            SBC   $FD
            LDX   #$0000
            TAY
            BPL   L1B0272
            DEX
L1B0272     PHX
            PHA
            LDX   $F0
            LDA   $EE
            SEC
            JSL   L1A10DF
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   $F0
            STA   $EC
            LDA   $EC
            CLC
            ADC   $FD
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L1B0296     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHX
            PHA
            _GetTick
* BCS L1B02AF
* LDA #$0000
*L1B02AF STAL L0201E7
            PLA
            PLX
            STA   L020043

            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L1B02C0     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   $FD
            SEC
            SBC   #$0000
            BVS   L1B02D6
            EOR   #$8000
L1B02D6     BMI   L1B02E2
            LDA   $FD
            EOR   #$FFFF
            INC
            STA   $F0
            BRA   L1B02E6
L1B02E2     LDA   $FD
            STA   $F0
L1B02E6     LDA   $F0
            CLC
            ADC   $FF
            STA   $F0
            LDA   $FD
            SEC
            SBC   #$0000
            BVS   L1B02F8
            EOR   #$8000
L1B02F8     BMI   L1B0304
            LDA   $F0
            EOR   #$FFFF
            INC
            BRA   L1B0306
            BRA   L1B0306
L1B0304     LDA   $F0
L1B0306     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E8
            TCS
            SEC
            LDA   $F9
            SBC   #$0000
            BNE   L1B032A
            LDA   $FB
            SBC   #$0000
            BRA   L1B0331
L1B032A     LDA   $FB
            SBC   #$0000
            REP   #$02
L1B0331     BVS   L1B0336
            EOR   #$8000
L1B0336     BMI   L1B0346
            LDX   $FB
            LDA   $F9
            JSL   L1A0F0A
            STX   $EC
            STA   $EA
            BRA   L1B034E
L1B0346     LDX   $FB
            LDA   $F9
            STX   $EC
            STA   $EA
L1B034E     LDX   $EC
            LDA   $EA
            CLC
            ADC   $FD
            PHA
            TXA
            ADC   $FF
            TAX
            PLA
            STX   $EC
            STA   $EA
            SEC
            LDA   $F9
            SBC   #$0000
            BNE   L1B036E
            LDA   $FB
            SBC   #$0000
            BRA   L1B0375
L1B036E     LDA   $FB
            SBC   #$0000
            REP   #$02
L1B0375     BVS   L1B037A
            EOR   #$8000
L1B037A     BMI   L1B0388
            LDX   $EC
            LDA   $EA
            JSL   L1A0F0A
            BRA   L1B038C
            BRA   L1B038C
L1B0388     LDX   $EC
            LDA   $EA
L1B038C     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            SEC
            JSL   L1A186E
            LDX   $FB
            LDA   $F9
            JSL   L1A0EFF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B03D3     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FF
            PHA
            LDA   #$0001
            PHA
            LDA   $FF
            SEC
            JSL   L1A184A
            LDA   $FD
            PLX
            STX   $F6
            CLC
            ADC   $F6
            SEC
            JSL   L1A0F19
            PLY
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1B0404     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E6
            TCS
            LDA   $F7
            LDX   #$0000
            TAY
            BPL   L1B0418
            DEX
L1B0418     STX   $EA
            STA   $E8
            LDA   $F9
            LDX   #$0000
            TAY
            BPL   L1B0425
            DEX
L1B0425     PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L1A108F
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDA   $FF
            SEC
            SBC   $FD
            LDX   #$0000
            TAY
            BPL   L1B0441
            DEX
L1B0441     PHX
            PHA
            LDX   $EA
            LDA   $E8
            SEC
            JSL   L1A10DF
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDA   $FB
            SEC
            SBC   $F9
            LDX   #$0000
            TAY
            BPL   L1B045E
            DEX
L1B045E     PHX
            PHA
            LDX   $EA
            LDA   $E8
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STX   $EA
            STA   $E8
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L1B0478
            DEX
L1B0478     PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L1A0EFF
            PLA
            PLX
            TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

