*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg18.L
            lst   off

*-----------

            use   Seg18.E
            use   Seg18.X

*-----------

            use   4/Misc.Macs
            use   4/Util.Macs

*-----------

L180000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PHX
            PHA
            _GetTick
* BCS L180019
* LDA #$0000
*L180019 STAL L0201E7
            PLA
            PLX
            STX   $F4
            STA   $F2
L180023     PHX
            PHA
            _GetTick
* BCS L180031
* LDA #$0000
*L180031 STAL L0201E7
            LDX   $F4
            LDA   $F2
            JSL   L1A130B
            BNE   L180041
            BRA   L180023
L180041     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
L180054     LDA   $FF
            SEC
            SBC   #$0000
            BEQ   L18006B
            BVS   L180061
            EOR   #$8000
L180061     BPL   L18006B
            DEC   $FF
            JSL   L180000
            BRA   L180054
L18006B     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L180073     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            PHX
            PHA
            _GetTick
* BCS L18008C
* LDA #$0000
*L18008C STAL L0201E7
            PLA
            PLX
            STX   $F2
            STA   $F0
L180096     LDA   $FF
            LDX   #$0000
            TAY
            BPL   L18009F
            DEX
L18009F     PHX
            PHA
            LDX   $F2
            LDA   $F0
            SEC
            SBC   L02010E
            PHA
            TXA
            SBC   L020110
            TAX
            PLA
            JSL   L1A130B
            BEQ   L1800D7
            BVS   L1800BB
            EOR   #$8000
L1800BB     BPL   L1800D7
            PHX
            PHA
            _GetTick
* BCS L1800CB
* LDA #$0000
*L1800CB STAL L0201E7
            PLA
            PLX
            STX   $F2
            STA   $F0
            BRA   L180096
L1800D7     LDX   $F2
            LDA   $F0
            STX   L020110
            STA   L02010E
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00E2
            TCS
            STZ   $E4
            LDA   $F3
            SEC
            SBC   $FF
            BVS   L180100
            EOR   #$8000
L180100     BMI   L18012F
            LDA   $F7
            SEC
            SBC   $FB
            BEQ   L18012F
            BVS   L18010E
            EOR   #$8000
L18010E     BPL   L18012F
            LDA   $F5
            SEC
            SBC   $F9
            BEQ   L18012F
            BVS   L18011C
            EOR   #$8000
L18011C     BPL   L18012F
            LDA   $F1
            SEC
            SBC   $FD
            BVS   L180128
            EOR   #$8000
L180128     BMI   L18012F
            LDA   #$0001
            STA   $E4
L18012F     LDA   $E4
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

