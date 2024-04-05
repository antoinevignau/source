
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L090000     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D2
            TCS
            LDA   #$004B
            PHA
            LDA   L020056
            PHA
            INC
            STA   L020056
            PLA
            CLC
            JSL   L012E82
            PLA
            TAY
            BNE   L090065
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _GetColorTable
            BCS   L090039
            LDA   #$0000
L090039     STAL  L020002
            LDA   $EE
            STA   $D4
            LDA   $EC
            STA   $EE
            LDA   $D4
            STA   $EC
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _SetColorTable
            BCS   L090061
            LDA   #$0000
L090061     STAL  L020002
L090065     LDA   #$0000
            TAY
            TSC
            CLC
            ADC   #$0028
            TCS
            TYA
            PLD
            RTL

L090072     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            STZ   L020072
            PEA   ^L031DFE
            PEA   L031DFE
            JSL   L0133D4
            PLY
            PLY
L09008C     LDA   L020052
            BEQ   L090094
            BRL   L0912EF
L090094     LDA   L020072
            CMP   #$001C
            BEQ   L0900A2
            LDA   L020072
            STA   L020074
L0900A2     LDA   L020072
            BRL   L0912D3
L0900A8     JSL   L0117E0
            LDA   L020058
            BEQ   L0900B8
            JSL   L012D95
            STZ   L020058
L0900B8     PEA   $0108
            _DisableMItem
            BCS   L0900C7
            LDA   #$0000
L0900C7     STAL  L020002
            PEA   ^L031E0A
            PEA   L031E0A
            JSL   L0133D4
            PLY
            PLY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L090000
            PEA   L090000
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0804DD
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            PEA   ^L0321A8
            PEA   L0321A8
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0000
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            PEA   $0108
            _EnableMItem
            BCS   L090136
            LDA   #$0000
L090136     STAL  L020002
            LDA   L020072
            CMP   #$0000
            BEQ   L090148
            LDA   #$0001
            STA   L020058
L090148     BRL   L0912E0
L09014B     PEA   ^L031E10
            PEA   L031E10
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0A06DC
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090188     PEA   ^L031E17
            PEA   L031E17
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0A06DC
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0901C5     PEA   ^L031E21
            PEA   L031E21
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0322E7
            PEA   L0322E7
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0003
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09020E     PEA   ^L031E27
            PEA   L031E27
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03245E
            PEA   L03245E
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0004
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090257     PEA   ^L031E2F
            PEA   L031E2F
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0324BE
            PEA   L0324BE
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0005
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0902A0     PEA   ^L031E37
            PEA   L031E37
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03251E
            PEA   L03251E
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0006
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0902E9     PEA   ^L031E3F
            PEA   L031E3F
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03257E
            PEA   L03257E
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0007
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090332     PEA   ^L031E47
            PEA   L031E47
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0329BD
            PEA   L0329BD
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0008
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09037B     PEA   ^L031E4F
            PEA   L031E4F
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0325D4
            PEA   L0325D4
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0009
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0903C4     PEA   ^L031E58
            PEA   L031E58
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03262A
            PEA   L03262A
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $000A
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09040D     PEA   ^L031E61
            PEA   L031E61
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032680
            PEA   L032680
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $000B
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090456     PEA   ^L031E6A
            PEA   L031E6A
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0326D6
            PEA   L0326D6
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $000C
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09049F     PEA   ^L031E73
            PEA   L031E73
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03272C
            PEA   L03272C
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $000D
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0904E8     PEA   ^L031E7C
            PEA   L031E7C
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032782
            PEA   L032782
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $000E
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090531     PEA   ^L031E85
            PEA   L031E85
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0327D8
            PEA   L0327D8
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $000F
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09057A     PEA   ^L031E8E
            PEA   L031E8E
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03282E
            PEA   L03282E
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0010
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0905C3     PEA   ^L031E97
            PEA   L031E97
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032884
            PEA   L032884
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0011
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09060C     PEA   ^L031EA0
            PEA   L031EA0
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032A09
            PEA   L032A09
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0012
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090655     PEA   ^L031EA8
            PEA   L031EA8
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032A61
            PEA   L032A61
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0013
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09069E     PEA   ^L031EB1
            PEA   L031EB1
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032AB9
            PEA   L032AB9
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0014
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0906E7     PEA   ^L031EBA
            PEA   L031EBA
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032AFC
            PEA   L032AFC
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0015
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090730     PEA   ^L031EC3
            PEA   L031EC3
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032B54
            PEA   L032B54
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0016
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090779     PEA   ^L031ECC
            PEA   L031ECC
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032409
            PEA   L032409
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0017
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0907C2     PEA   ^L031ED5
            PEA   L031ED5
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0A061E
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0907FF     PEA   ^L031EDA
            PEA   L031EDA
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0A0484
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09083C     PEA   ^L031EDF
            PEA   L031EDF
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0A0316
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090879     PEA   ^L031EE4
            PEA   L031EE4
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032BC8
            PEA   L032BC8
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $001B
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0908C2     PEA   ^L031EE9
            PEA   L031EE9
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032C24
            PEA   L032C24
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0021
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09090B     PEA   ^L031EEF
            PEA   L031EEF
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032C80
            PEA   L032C80
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0022
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090954     PEA   ^L031EF5
            PEA   L031EF5
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032CDC
            PEA   L032CDC
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0023
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09099D     PEA   ^L031EFB
            PEA   L031EFB
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032D38
            PEA   L032D38
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0024
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0909E6     PEA   ^L031F01
            PEA   L031F01
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032D98
            PEA   L032D98
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0025
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090A2F     PEA   ^L031F08
            PEA   L031F08
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032DF8
            PEA   L032DF8
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0026
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090A78     PEA   ^L031F0F
            PEA   L031F0F
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032E58
            PEA   L032E58
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0027
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090AC1     PEA   $010A
            _DisableMItem
            BCS   L090AD0
            LDA   #$0000
L090AD0     STAL  L020002
            PEA   ^L031F16
            PEA   L031F16
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0A021A
            PLY
            PLY
            STA   L020072
            PEA   $010A
            _EnableMItem
            BCS   L090B1D
            LDA   #$0000
L090B1D     STAL  L020002
            BRL   L0912E0
L090B24     PEA   ^L031F1B
            PEA   L031F1B
            JSL   L0133D4
            PLY
            PLY
            JSL   L01160B
            PEA   ^L031F25
            PEA   L031F25
            JSL   L0133D4
            PLY
            PLY
            JSL   L01151A
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L011647
            PEA   L011647
            PEA   $0000
            PEA   $0000
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0800C0
            TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            PEA   ^L032E8D
            PEA   L032E8D
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $001D
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090BA3     PEA   ^L031F2F
            PEA   L031F2F
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032320
            PEA   L032320
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $001E
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090BEC     JSL   L0D0522
            CMP   #$0000
            BNE   L090BF8
            BRL   L090C33
L090BF8     PEA   ^L031F38
            PEA   L031F38
            JSL   L0133D4
            PLY
            PLY
            JSL   L0D0000
            TAY
            BEQ   L090C25
            PEA   ^L031F48
            PEA   L031F48
            JSL   L0133D4
            PLY
            PLY
            PEA   ^L031F53
            PEA   L031F53
            JSL   L0133D4
            PLY
            PLY
            BRA   L090C31
L090C25     PEA   ^L031F63
            PEA   L031F63
            JSL   L0133D4
            PLY
            PLY
L090C31     BRA   L090C3F
L090C33     PEA   ^L031F73
            PEA   L031F73
            JSL   L0133D4
            PLY
            PLY
L090C3F     JSL   L0D0DEE
            PEA   ^L031F7E
            PEA   L031F7E
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0323AD
            PEA   L0323AD
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0028
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090C8C     LDX   L0200D4
            LDA   L0200D2
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            TAX
            LDY   #$0008
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            PEA   $0000
            PEA   $0000
            LDX   L0200D4
            LDA   L0200D2
            PHX
            PHA
            JSL   L0D097D
            PLY
            PLY
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0D1184
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090CF0     LDX   L0200D8
            LDA   L0200D6
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            TAX
            LDY   #$0004
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDX   L0200D8
            LDA   L0200D6
            PHX
            PHA
            LDX   L0200D4
            LDA   L0200D2
            PHX
            PHA
            JSL   L0D097D
            PLY
            PLY
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0D127E
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090D56     JSL   L0D0522
            CMP   #$0001
            BNE   L090D72
            JSL   L0D0637
            STX   L0200E2
            STA   L0200E0
            LDA   #$0033
            STA   L020072
            BRL   L0912E0
L090D72     PEA   ^L031F8F
            PEA   L031F8F
            JSL   L0133D4
            PLY
            PLY
            JSL   L0D002A
            PEA   ^L031FA1
            PEA   L031FA1
            JSL   L0133D4
            PLY
            PLY
            JSL   L0D0198
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0D03D5
            PEA   L0D03D5
            PEA   $0000
            PEA   $0000
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0800C0
            TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            PEA   ^L033259
            PEA   L033259
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0032
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090DF1     STZ   $EE
            JSL   L01200B
            JSL   L011BFE
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            TAX
            LDY   #$000A
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            JSL   L011A39
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            TAX
            LDY   #$000E
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            JSL   L011C23
            TAY
            BEQ   L090E5D
            JSL   L0121F5
            JSL   L0122B0
            PEA   ^L031FB3
            PEA   L031FB3
            JSL   L0133D4
            PLY
            PLY
            LDA   #$0034
            STA   L020072
            BRL   L0912E0
L090E5D     LDA   $EE
            BEQ   L090E64
            BRL   L090F14
L090E64     PEA   $0000
            PEA   $0034
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0800C0
            TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            PEA   ^L03332C
            PEA   L03332C
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0033
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            LDA   L020072
            CMP   #$0035
            BNE   L090EE1
            PEI   $F2
            PEI   $F0
            JSL   L011E16
            PLY
            PLY
            PEI   $F2
            PEI   $F0
            JSL   L011C91
            PLY
            PLY
            BRL   L090E5D
            BRA   L090F08
L090EE1     LDA   L020072
            CMP   #$0036
            BNE   L090F08
            PEI   $F2
            PEI   $F0
            JSL   L011E16
            PLY
            PLY
            PEI   $F2
            PEI   $F0
            JSL   L011CAE
            PLY
            PLY
            LDA   #$0033
            STA   L020072
            LDA   #$0001
            STA   $EE
L090F08     JSL   L011BFE
            LDA   #$0001
            STA   $EE
            BRL   L090E5D
L090F14     LDA   L020072
            CMP   #$0033
            BEQ   L090F20
            JSL   L0121F5
L090F20     BRL   L0912E0
L090F23     PEA   ^L031FBF
            PEA   L031FBF
            JSL   L0133D4
            PLY
            PLY
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0014
            LDA   [$F6],Y
            TAX
            LDY   #$0012
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            PEA   ^L031FD0
            PEA   L031FD0
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L03333C
            PEA   L03333C
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0034
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090F95     PEA   ^L031FE1
            PEA   L031FE1
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032EC6
            PEA   L032EC6
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0020
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L090FDE     PEA   ^L031FEA
            PEA   L031FEA
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032FE6
            PEA   L032FE6
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $002E
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L091027     PEA   ^L031FF5
            PEA   L031FF5
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032FE6
            PEA   L032FE6
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $002E
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L091070     PEA   ^L032003
            PEA   L032003
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0330CC
            PEA   L0330CC
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $002F
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0910B9     PEA   ^L03200E
            PEA   L03200E
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0330CC
            PEA   L0330CC
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $002F
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L091102     PEA   ^L03201C
            PEA   L03201C
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L032FF6
            PEA   L032FF6
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $002C
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L09114B     PEA   ^L032028
            PEA   L032028
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0323D1
            PEA   L0323D1
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $001F
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L091194     JSL   L01194F
            TAY
            BEQ   L0911A4
            LDA   #$0037
            STA   L020072
            BRL   L0912E0
L0911A4     PEA   ^L032031
            PEA   L032031
            JSL   L0133D4
            PLY
            PLY
            JSL   L011976
            PEA   ^L032040
            PEA   L032040
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0331F8
            PEA   L0331F8
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0030
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L0911FD     PEA   ^L03204F
            PEA   L03204F
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            PEA   ^L033249
            PEA   L033249
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0037
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   L020072
            BRL   L0912E0
L091246     PEA   ^L03205E
            PEA   L03205E
            JSL   L0133D4
            PLY
            PLY
            LDA   #$0037
            STA   L020072
            BRL   L0912E0
L09125B     BRL   L0912E0
            BRL   L0912E0
L091261     DA    L0900A8
            DA    L09014B
            DA    L090188
            DA    L0901C5
            DA    L09020E
            DA    L090257
            DA    L0902A0
            DA    L0902E9
            DA    L090332
            DA    L09037B
            DA    L0903C4
            DA    L09040D
            DA    L090456
            DA    L09049F
            DA    L0904E8
            DA    L090531
            DA    L09057A
            DA    L0905C3
            DA    L09060C
            DA    L090655
            DA    L09069E
            DA    L0906E7
            DA    L090730
            DA    L090779
            DA    L0907C2
            DA    L0907FF
            DA    L09083C
            DA    L090879
            DA    L090AC1
            DA    L090B24
            DA    L090BA3
            DA    L09114B
            DA    L090F95
            DA    L0908C2
            DA    L09090B
            DA    L090954
            DA    L09099D
            DA    L0909E6
            DA    L090A2F
            DA    L090A78
            DA    L090BEC
            DA    L090C8C
            DA    L090CF0
            DA    L090FDE
            DA    L091102
            DA    L091070
            DA    L091027
            DA    L0910B9
            DA    L091194
            DA    L091246
            DA    L090D56
            DA    L090DF1
            DA    L090F23
            DA    L09125B
            DA    L09125B
            DA    L0911FD
            DA    L09125B
L0912D3     CMP   #$0038
            BCC   L0912DB
            LDA   #$0038
L0912DB     ASL
            TAX
            JMP   (L091261,X)

L0912E0     PEA   $0000
            PEA   $0000
            JSL   L012E43
            PLY
            PLY
            BRL   L09008C
L0912EF     TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL


