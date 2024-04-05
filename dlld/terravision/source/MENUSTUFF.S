
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L040000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHX
            PHA
            LDX   L02002C
            LDA   L02002A
            PHX
            PHA
            _NewMenu
            BCS   L040021
            LDA   #$0000
L040021     STAL  L020002
            PEA   $0000
            _InsertMenu
            BCS   L040034
            LDA   #$0000
L040034     STAL  L020002
            PHX
            PHA
            LDX   L020028
            LDA   L020026
            PHX
            PHA
            _NewMenu
            BCS   L04004E
            LDA   #$0000
L04004E     STAL  L020002
            PEA   $0000
            _InsertMenu
            BCS   L040061
            LDA   #$0000
L040061     STAL  L020002
            PHX
            PHA
            LDX   L020024
            LDA   L020022
            PHX
            PHA
            _NewMenu
            BCS   L04007B
            LDA   #$0000
L04007B     STAL  L020002
            PEA   $0000
            _InsertMenu
            BCS   L04008E
            LDA   #$0000
L04008E     STAL  L020002
            PHX
            PHA
            LDX   L020020
            LDA   L02001E
            PHX
            PHA
            _NewMenu
            BCS   L0400A8
            LDA   #$0000
L0400A8     STAL  L020002
            PEA   $0000
            _InsertMenu
            BCS   L0400BB
            LDA   #$0000
L0400BB     STAL  L020002
            PHX
            PHA
            LDX   L02001C
            LDA   L02001A
            PHX
            PHA
            _NewMenu
            BCS   L0400D5
            LDA   #$0000
L0400D5     STAL  L020002
            PEA   $0000
            _InsertMenu
            BCS   L0400E8
            LDA   #$0000
L0400E8     STAL  L020002
            PEA   $000F
            PEA   $0000
            PEA   $00F0
            _SetBarColors
            BCS   L040101
            LDA   #$0000
L040101     STAL  L020002
            PEA   $0001
            _FixAppleMenu
            BCS   L040114
            LDA   #$0000
L040114     STAL  L020002
            PHA
            _FixMenuBar
            BCS   L040125
            LDA   #$0000
L040125     STAL  L020002
            PLA
            PEA   $0001
            PEA   $010C
            _CheckMItem
            BCS   L04013C
            LDA   #$0000
L04013C     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL


