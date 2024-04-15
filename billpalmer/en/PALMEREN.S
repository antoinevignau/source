
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

            PHK
            PLB
            _TLStartUp
            PHA
            _MMStartUp
            PLA
            STA   L0E72
            TDC
            STA   L0E74
            JSL   GSOS
            DW    $202A            ; GetVersion
            ADRL  L1155
            LDA   L1157
            AND   #$7FFF
            CMP   #$0402
            BCS   L0052
            PHA
            PEA   ^L0E8C
            PEA   L0E8C
            PEA   ^L0EA3
            PEA   L0EA3
            PEA   ^L0EF9
            PEA   L0EF9
            PEA   ^L0EFE
            PEA   L0EFE
            _TLTextMountVolume
            PLA
            BRL   L0D16
L0052       JSR   L0D3F
            BCC   L007B
L0057       PHA
            PEA   ^L0ED1
            PEA   L0ED1
            PEA   ^L0EFE
            PEA   L0EFE
            PEA   ^L0EF9
            PEA   L0EF9
            PEA   ^L0EFE
            PEA   L0EFE
            _TLTextMountVolume
            PLA
            BRL   L0D16
L007B       STY   L0E7A
            STY   L0A0B
            STX   L0E7A+2
            STX   L0A0B+2
            SEP   #$10
            STX   L0E1E+3
            STX   L0E38+3
            REP   #$10
            JSR   L0D3F
            BCS   L0057
            STY   L0E7E
            STX   L0E7E+2
            STX   L0E82+2
            STX   L08A7+2
            PHA
            PHA
            LDA   L0E72
            PHA
            PEA   $0002
            PEA   $0000
            PEA   $0001
            _StartUpTools
            PLA
            STA   L0E76
            PLA
            STA   L0E76+2
            BCC   L00E6
            PHA
            PEA   ^L0EB7
            PEA   L0EB7
            PEA   ^L0EFE
            PEA   L0EFE
            PEA   ^L0EF9
            PEA   L0EF9
            PEA   ^L0EFE
            PEA   L0EFE
            _TLTextMountVolume
            PLA
            BRL   L0D01
L00E6       JSR   L5C6C
            LDA   #L1169
            LDX   L0E7E+2
            LDY   L0E7E
            JSR   L106E
            BCC   L011B
            PHA
            PEA   ^L0EE8
            PEA   L0EE8
            PEA   ^L0EFE
            PEA   L0EFE
            PEA   ^L0EF9
            PEA   L0EF9
            PEA   ^L0EFE
            PEA   L0EFE
            _TLTextMountVolume
            PLA
            BRL   L0D16
L011B       TYA
            JSR   L0D6C
            LDA   L0E7A+2
            PHA
            LDA   L0E7A
            PHA
            LDA   L0E82+2
            PHA
            LDA   L0E82
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            _HideMenuBar
            PEA   $0000
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            _InitCursor
            PEA   $0000
            PEA   $0000
            PEA   $0005
            PEA   $4000
            PEA   $00F0
            _Desktop
            PLA
            PLA
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   ^L029C
            PEA   L029C
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0001
            PEA   $800E
            _NewWindow2
            PLA
            STA   L0E6E
            PLA
            STA   L0E6E+2
            JSR   L0A41
            JSR   L0970
            JSR   L5F0B
L01B1       PEA   $0000
            PEA   $0000
            PEA   $C000
            PEA   $0000
            _HandleDiskInsert
            PLA
            PLA
            JSR   L5F64
            PEA   $0000
            PEA   $FFFF
            PEA   ^L0EFF
            PEA   L0EFF
            _TaskMaster
            PLA
            BEQ   L01B1
            ASL
            TAX
            JSR   (L0F2D,X)
            LDA   L0AB3
            ORA   L0AB5
            ORA   L0AB7
            ORA   L0AB9
            BEQ   L0208
            JSR   L0555
            JSR   L05D7
            JSR   L0455
            LDA   L0AB3
            BEQ   L0208
            LDA   L0AAF
            ASL
            TAX
            JSR   (L4414,X)
L0208       STZ   L0AB9
            STZ   L0AB5
            JSR   L0970
            BRA   L01B1
L0213       LDA   L0F0D
            AND   #$0100
            CMP   #$0100
            BEQ   L0246
            LDA   L0F01
            LDX   #$0015
            CMP   #$000B
            BEQ   L0242
            LDX   #$0016
            CMP   #$000A
            BEQ   L0242
            LDX   #$0017
            CMP   #$0008
            BEQ   L0242
            LDX   #$0018
            CMP   #$0015
            BEQ   L0242
            RTS

L0242       STX   L0AB7
            RTS

L0246       LDX   #$FFFF
            SEP   #$20
L024B       INX
            LDA   L0263,X
            CMP   #$FF
            BEQ   L0260
            CMP   L0F01
            BNE   L024B
            REP   #$20
            TXA
            ASL
            TAX
            JSR   (L0272,X)
L0260       REP   #$20
            RTS

L0263       ASC   'QqLlSs??DdCcZz'
            HEX   FF
L0272       DA    L0CDE
            DA    L0CDE
            DA    L0AD5
            DA    L0AD5
            DA    L0B27
            DA    L0B27
            DA    L0ABB
            DA    L0ABB
            DA    L0C40
            DA    L0C40
            DA    L0C66
            DA    L0C66
            DA    L5EF6
            DA    L5EF6
L028E       JSR   L04BA
            JMP   L04F3

L0294       LDA   L0F25
            ASL
            TAX
            JMP   (L0F73,X)

L029C       LDA   L0E6E+2
            PHA
            LDA   L0E6E
            PHA
            _DrawControls
            PEA   $0001
            PEA   $00A0
            _MoveTo
            PEA   $013D
            PEA   $00A0
            _LineTo
            PEA   $013D
            PEA   $00C6
            _LineTo
            PEA   $0001
            PEA   $00C6
            _LineTo
            PEA   $0001
            PEA   $00A0
            _LineTo
            PEA   $0001
            PEA   $0001
            _MoveTo
            PEA   $0111
            PEA   $0001
            _LineTo
            PEA   $0111
            PEA   $006E
            _LineTo
            PEA   $0001
            PEA   $006E
            _LineTo
            PEA   $0001
            PEA   $0001
            _LineTo
            RTL

L032E       LDA   L0F25
            STA   L0AB7
            RTS

L0335       LDA   L044F
            EOR   #$0001
            STA   L044F
            LDA   L044F
            LDX   #$0019
            STX   L0AB3
            JSR   L041D
            LDA   L044F
            BNE   L0358
            STZ   L0AB3
            LDX   #$0019
            JMP   L0430

L0358       STZ   L0451
            STZ   L0453
            LDA   #$0000
            LDX   #$001A
            JSR   L041D
            LDX   #$001A
            JSR   L0430
            LDA   #$0000
            LDX   #$001B
            JSR   L041D
            LDX   #$001B
            JMP   L0430

L037C       LDA   L0451
            EOR   #$0001
            STA   L0451
            LDA   L0451
            LDX   #$001A
            STX   L0AB3
            JSR   L041D
            LDA   L0451
            BNE   L039F
            STZ   L0AB3
            LDX   #$001A
            JMP   L0430

L039F       STZ   L044F
            STZ   L0453
            LDA   #$0000
            LDX   #$0019
            JSR   L041D
            LDX   #$0019
            JSR   L0430
            LDA   #$0000
            LDX   #$001B
            JSR   L041D
            LDX   #$001B
            JMP   L0430

L03C3       LDA   L0453
            EOR   #$0001
            STA   L0453
            LDX   #$001B
            STX   L0AB3
            JSR   L041D
            LDA   L0453
            BNE   L03E3
            STZ   L0AB3
            LDX   #$001B
            JMP   L0430

L03E3       STZ   L044F
            STZ   L0451
            LDA   #$0000
            LDX   #$0019
            JSR   L041D
            LDX   #$0019
            JSR   L0430
            LDA   #$0000
            LDX   #$001A
            JSR   L041D
            LDX   #$001A
            JMP   L0430

            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHX
            _GetCtlValueByID
            PLA
            RTS

L041D       PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHX
            _SetCtlValueByID
            RTS

L0430       PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHX
            _GetCtlHandleFromID
            _DrawOneCtl
            RTS

L044F       DW    $0000
L0451       DW    $0000
L0453       DW    $0000
L0455       LDA   L0AB3
            CMP   #$001A
            BNE   L047D
            LDA   L0AB5
            BNE   L0463
            RTS

L0463       CMP   #$0014
            BCC   L0469
            RTS

L0469       TAX
            LDA   L12AD+$13,X
            AND   #$00FF
            BNE   L0473
            RTS

L0473       TXA
            DEC
            ASL
            TAX
            LDA   L12D5,X
            JMP   L0945

L047D       LDA   L0AB3
            BEQ   L0483
            RTS

L0483       LDA   L0AB5
            BNE   L0489
            RTS

L0489       CMP   #$0014
            BCC   L048F
            RTS

L048F       TAX
            LDA   L129C+$10,X
            AND   #$00FF
            CMP   #$0063
            BNE   L04A8
            SEP   #$20
            LDA   L0AAF
            STA   L129C+$10,X
            REP   #$20
            JMP   L08D1

L04A8       CMP   L0AAF
            BNE   L04B9
            SEP   #$20
            LDA   #$63
            STA   L129C+$10,X
            REP   #$20
            JMP   L084A
L04B9       RTS

L04BA       STZ   L0AB5
            LDA   #$0000
L04C0       PHA
            ASL
            ASL
            ASL
            TAX
            LDA   L0F0B
            CMP   L118E,X
            BCC   L04EB
            LDA   L1192,X
            CMP   L0F0B
            BCC   L04EB
            LDA   L0F09
            CMP   L1190,X
            BCC   L04EB
            LDA   L1194,X
            CMP   L0F09
            BCC   L04EB
            PLA
            INC
            STA   L0AB5
            RTS

L04EB       PLA
            INC
            CMP   #$0014
            BCC   L04C0
            RTS

L04F3       STZ   L0AB9
            LDA   L0AAF
            DEC
            ASL
            TAX
            LDA   L1666,X
            STA   $14
            LDY   #$0000
            LDA   ($14),Y
            STA   L0553
            LDA   $14
            CLC
            ADC   #$000A
            STA   $14
            LDA   #$0000
L0514       PHA
            LDY   #$0000
            LDA   L0F0B
            CMP   ($14),Y
            BCC   L0543
            LDY   #$0004
            LDA   ($14),Y
            CMP   L0F0B
            BCC   L0543
            LDY   #$0002
            LDA   L0F09
            CMP   ($14),Y
            BCC   L0543
            LDY   #$0006
            LDA   ($14),Y
            CMP   L0F09
            BCC   L0543
            PLA
            INC
            STA   L0AB9
            RTS

L0543       LDA   $14
            CLC
            ADC   #$000E
            STA   $14
            PLA
            INC
            CMP   L0553
            BCC   L0514
            RTS

L0553       DW    $0000
L0555       LDA   L0AB9
            BNE   L055B
            RTS

L055B       LDY   #$0000
            LDA   L0AB3
            CMP   #$0019
            BEQ   L0577
            LDY   #$0002
            CMP   #$001A
            BEQ   L0577
            LDY   #$0004
            CMP   #$001B
            BEQ   L0577
            RTS

L0577       LDA   L0AAF
            DEC
            ASL
            TAX
            LDA   L1666,X
            CLC
            ADC   #$0012
            STA   $14
            LDA   #$0000
            LDX   L0AB9
L058C       DEX
            BEQ   L0595
            CLC
            ADC   #$000E
            BRA   L058C
L0595       CLC
            ADC   $14
            STA   $14
            LDA   ($14),Y
            JMP   L0945

L059F       PHA
            LDA   L12AD+$13,X
            AND   #$00FF
            BNE   L05D5
            SEP   #$20
            LDA   L0AAF
            STA   L129C+$10,X
            LDA   #$FF
            STA   L12AD+$13,X
            REP   #$20
            JSR   L08D1
            BRA   L05D1
L05BC       PHA
            LDA   L12AD+$13,X
            AND   #$00FF
            BEQ   L05D5
            SEP   #$20
            LDA   #$61
            STA   L129C+$10,X
            REP   #$20
            JSR   L0802
L05D1       PLA
            JMP   L0945

L05D5       PLA
            RTS

L05D7       LDA   L0AAF
            CMP   #$0026
            BNE   L05ED
            LDA   L0AB7
            CMP   #$0018
            BNE   L05ED
            LDA   #L071E
            JSR   L0945
L05ED       LDA   L0AAF
            CMP   #$0024
            BNE   L0603
            LDA   L0AB7
            CMP   #$0015
            BNE   L0603
            LDA   #L0744
            JSR   L0945
L0603       LDA   L0AAF
            CMP   #$0016
            BNE   L0619
            LDA   L0AB7
            CMP   #$0017
            BNE   L0619
            LDA   #L0785
            JSR   L0945
L0619       LDA   L0AAF
            CMP   #$0015
            BNE   L062F
            LDA   L0AB7
            CMP   #$0017
            BNE   L062F
            LDA   #L07BF
            JSR   L0945
L062F       LDA   L0AAF
            CMP   #$000B
            BNE   L0645
            LDA   L0AB7
            CMP   #$0018
            BNE   L0645
            LDA   #L07ED
            JSR   L0945
L0645       LDA   L0AB7
            CMP   #$0015
            BCC   L0675
            LDA   #$0018
            CMP   L0AB7
            BCC   L0675
            LDA   L0AAF
            DEC
            ASL
            TAX
            LDA   L1666,X
            INC
            INC
            STA   $14
            LDA   L0AB7
            SEC
            SBC   #$0015
            ASL
            TAY
            LDA   ($14),Y
            BEQ   L0672
            STA   L0AAF
L0672       STZ   L0AB7
L0675       LDA   L0AAF
            CMP   #$0019
            BNE   L0691
            LDX   #$0004
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$00FF
            BNE   L0691
            LDA   #$001A
            STA   L0AAF
L0691       LDA   L0AAF
            CMP   #$001C
            BNE   L06AD
            LDX   #$0007
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$00FF
            BNE   L06AD
            LDA   #$001B
            STA   L0AAF
L06AD       LDA   L0AAF
            CMP   #$001D
            BNE   L06C9
            LDX   #$0007
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$00FF
            BNE   L06C9
            LDA   #$001E
            STA   L0AAF
L06C9       LDA   L0AAF
            CMP   #$0020
            BNE   L06E5
            LDX   #$0007
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$00FF
            BNE   L06E5
            LDA   #$001F
            STA   L0AAF
L06E5       LDA   L0AAF
            CMP   #$0022
            BNE   L0701
            LDX   #$0009
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$00FF
            BNE   L0701
            LDA   #$0023
            STA   L0AAF
L0701       LDA   L0AAF
            CMP   #$0024
            BNE   L071D
            LDX   #$000A
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0000
            BNE   L071D
            LDA   #$0021
            STA   L0AAF
L071D       RTS

L071E       STR   'Better not to follow the Professor...'
L0744       STR   'You just have to push the door... (are you afraid of something?)'
L0785       STR   'Bill easily jumps off the train and waits for it to leave'
L07BF       STR   'This kind of jump only works in the movies...'
L07ED       STR   'Bill flies to Africa'
L0802       CPX   #$0000
            BEQ   L0840
            TXA
            DEC
            ASL
            ASL
            ASL
            TAX
            LDA   L1190,X
            STA   L0841
            LDA   L118E,X
            STA   L0843
            LDA   L1194,X
            STA   L0845
            LDA   L1192,X
            STA   L0847
            _HideCursor
            PEA   ^L0841
            PEA   L0841
            _EraseRect
            _ShowCursor
L0840       RTS

L0841       DW    $0000
L0843       DW    $0000
L0845       DW    $0000
L0847       DW    $0000
            RTS

L084A       CPX   #$0000
            BEQ   L088E
            TXA
            DEC
            ASL
            ASL
            ASL
            TAX
            LDA   L1190,X
            STA   L08C5
            STA   L08CD
            LDA   L118E,X
            STA   L08C7
            STA   L08CF
            LDA   L1194,X
            STA   L08C9
            LDA   L1192,X
            STA   L08CB
            _HideCursor
            PEA   ^L088F
            PEA   L088F
            _PaintPixels
            _ShowCursor
L088E       RTS

L088F       ADRL  L08A5
            ADRL  L08B5
            ADRL  L08C5
            ADRL  L08CD
            DW    $0000
            ADRL  $00000000
L08A5       DW    $0000            ; SCB byte
L08A7       ADRL  $00008000        ; Pointer to pixel image
            DW    $00A0            ; Width
            DW    $0000            ; Bounds rect
            DW    $0000
            DW    $00C7
            DW    $013F
L08B5       DW    $0000            ; SCB byte
            ADRL  $00012000        ; Pointer to pixel image
            DW    $00A0            ; Width
            DW    $0000            ; Bounds rect
            DW    $0000
            DW    $00C7
            DW    $013F
L08C5       DW    $0003
L08C7       DW    $0000
L08C9       DW    $006D
L08CB       DW    $0110
L08CD       DW    $0003
L08CF       DW    $0000
L08D1       CPX   #$0000
            BEQ   L0913
            PHX
            JSR   L084A
            PLA
            DEC
            ASL
            ASL
            ASL
            TAX
            LDA   L1190,X
            STA   L0914
            LDA   L118E,X
            STA   L0916
            LDA   L1194,X
            STA   L0918
            LDA   L1192,X
            STA   L091A
            _HideCursor
            PEA   ^L0914
            PEA   L0914
            _InvertRect
            _ShowCursor
L0913       RTS

L0914       DW    $0000
L0916       DW    $0000
L0918       DW    $0000
L091A       DW    $0000
L091C       LDX   #$0001
L091F       PHX
            JSR   L0802
            PLX
            PHX
            LDA   L129C+$10,X
            AND   #$00FF
            CMP   L0AAF
            BNE   L0935
            JSR   L08D1
            BRA   L093D
L0935       CMP   #$0063
            BNE   L093D
            JSR   L084A
L093D       PLX
            INX
            CPX   #$0014
            BCC   L091F
            RTS

L0945       STA   $00
            LDA   ($00)
            AND   #$00FF
            BNE   L094F
            RTS

L094F       PEA   ^L4413
            LDX   $00
            INX
            PHX
            PHA
            PEA   ^L0968
            PEA   L0968
            PEA   $0000
            _LETextBox2
            RTS

L0968       DW    $00A1
            DW    $0002
            DW    $00C6
            DW    $013D
L0970       LDA   L0AAF
            CMP   L0AB1
            BNE   L0979
            RTS

L0979       STA   L0AB1
            JSR   L0A6D
            JSR   L091C
            JMP   L0985

L0985       LDA   L0AAF
            PHA
            PEA   ^L09A8
            PEA   L09A8
            PEA   $0002
            PEA   $0000
            _Int2Dec
            LDA   L09A8
            ORA   #$3030
            STA   L1159+$A
            JMP   L09AC

L09A8       HEX   00000000
L09AC       LDA   #L1159
            LDX   L0E7E+2
            LDY   L0E7E
            JSR   L106E
            BCS   L09F2
L09BA       TYA
            JSR   L0D6C
            _HideCursor
            PEA   ^L09F3
            PEA   L09F3
            _PaintPixels
            PEA   $0000
            LDA   L0E7A+2
            PHA
            LDA   L0E7A
            CLC
            ADC   #$7E00
            PHA
            _SetColorTable
            JSR   L0C72
            _ShowCursor
L09F2       RTS

L09F3       ADRL  L0A09
            ADRL  L0A19
            ADRL  L0A29
            ADRL  L0A31
            DW    $0000
            ADRL  $00000000
L0A09       DW    $0000            ; SCB byte
L0A0B       ADRL  $00000000        ; Pointer to pixel image
            DW    $00A0            ; Width
            DW    $0000            ; Bounds rect
            DW    $0000
            DW    $00C7
            DW    $013F
L0A19       DW    $0000            ; SCB byte
            ADRL  $00012000        ; Pointer to pixel image
            DW    $00A0            ; Width
            DW    $0000            ; Bounds rect
            DW    $0000
            DW    $00C7
            DW    $013F
L0A29       DW    $0003
            DW    $0000
            DW    $006D
            DW    $0110
L0A31       DW    $0003
            DW    $0000
L0A35       JSR   L0945
            JSR   L0A41
            LDA   #$0005
            JMP   L0E4A

L0A41       SEP   #$20
            LDX   #$0014
            LDA   #$62
L0A48       STA   L129C+$10,X
            DEX
            BNE   L0A48
            LDX   #$0014
            LDA   #$00
L0A53       STA   L12AD+$13,X
            DEX
            BNE   L0A53
            LDX   #$0011
L0A5C       STA   L127E+$1D,X
            DEX
            BNE   L0A5C
            REP   #$20
            LDA   #$0004
            STA   L0AAF
            STZ   L0AB1
L0A6D       STZ   L0AB3
            STZ   L0AB5
            STZ   L0AB7
            STZ   L0AB9
            STZ   L044F
            STZ   L0451
            STZ   L0453
            LDX   #$0019
            LDA   #$0000
            JSR   L041D
            LDX   #$001A
            LDA   #$0000
            JSR   L041D
            LDX   #$001B
            LDA   #$0000
            JSR   L041D
            LDX   #$0019
            JSR   L0430
            LDX   #$001A
            JSR   L0430
            LDX   #$001B
            JMP   L0430

L0AAF       DW    $0000
L0AB1       DW    $0000
L0AB3       DW    $0000
L0AB5       DW    $0000
L0AB7       DW    $0000
L0AB9       DW    $0000
L0ABB       LDA   #$0000
L0ABE       PHA
            ASL
            TAX
            LDA   L421B,X
            JSR   L0945
            LDA   #$0003
            JSR   L0E4A
            PLA
            INC
            CMP   #$000B
            BCC   L0ABE
            RTS

L0AD5       JSR   L5F27
            JSR   L0E10
            PEA   $001E
            PEA   $002B
            PEA   ^L0FB1
            PEA   L0FB1
            PEA   $0000
            PEA   $0000
            PEA   ^L0FD4
            PEA   L0FD4
            PEA   ^L0FD6
            PEA   L0FD6
            _SFGetFile
            JSR   L0E2E
            JSR   L5F0B
            LDA   L0FD6
            BNE   L0B0C
            RTS

L0B0C       JSR   L0B67
            JSR   L0B80
            STZ   L0AB1
            STZ   L0AB3
            STZ   L0AB5
            STZ   L0AB7
            JSR   L0A6D
            LDA   #L4413
            JMP   L0945

L0B27       JSR   L5F27
            JSR   L0E10
            PEA   $0019
            PEA   $0024
            PEA   ^L0FC3
            PEA   L0FC3
            PEA   ^L0FDC
            PEA   L0FDC
            PEA   $000F
            PEA   ^L0FD6
            PEA   L0FD6
            _SFPutFile
            JSR   L0E2E
            JSR   L5F0B
            LDA   L0FD6
            BNE   L0B5B
            RTS

L0B5B       JSR   L0B67
            JSR   L0BD5
            LDA   #L4413
            JMP   L0945

L0B67       SEP   #$20
            LDX   #$000F
L0B6C       LDA   L0FDD,X
            STA   L117B+4,X
            DEX
            BPL   L0B6C
            LDA   L0FDC
            INC
            INC
            STA   L117B
            REP   #$20
            RTS

L0B80       JSL   GSOS
            DW    $2010            ; Open
            ADRL  L10E1
            BCS   L0BA2
            LDA   L10E3
            STA   L10EB
            STA   L114B
            JSR   L0BA3
            JSL   GSOS
            DW    $2014            ; Close
            ADRL  L1149
L0BA2       RTS

L0BA3       LDX   #$0011
            LDY   #L129C
            JSR   L0BC4
            LDX   #$0014
            LDY   #L12AD
            JSR   L0BC4
            LDX   #$0014
            LDY   #L12C1
            JSR   L0BC4
            LDX   #$0001
            LDY   #L0AAF
L0BC4       STX   L10F1
            STY   L10ED
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  L10E9
            RTS

L0BD5       JSL   GSOS
            DW    $2002            ; Destroy
            ADRL  L10DB
            JSL   GSOS
            DW    $2001            ; Create
            ADRL  L10C3
            BCS   L0C0D
            JSL   GSOS
            DW    $2010
            ADRL  L10E1
            BCS   L0C0D
            LDA   L10E3
            STA   L10FB
            STA   L114B
            JSR   L0C0E
            JSL   GSOS
            DW    $2014            ; Close
            ADRL  L1149
L0C0D       RTS

L0C0E       LDX   #$0011
            LDY   #L129C
            JSR   L0C2F
            LDX   #$0014
            LDY   #L12AD
            JSR   L0C2F
            LDX   #$0014
            LDY   #L12C1
            JSR   L0C2F
            LDX   #$0001
            LDY   #L0AAF
L0C2F       STX   L1101
            STY   L10FD
            JSL   GSOS
            DW    $2013            ; Write
            ADRL  L10F9
            RTS

L0C40       JSR   L0E10
            PEA   $0000
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0002
            _AlertWindow
            JSR   L0E2E
            PLA
            BEQ   L0C63
            RTS
L0C63       JMP   L0A41

L0C66       LDA   L0CD4
            EOR   #$0001
            STA   L0CD4
            JMP   L09BA

L0C72       LDA   L0CD4
            BNE   L0C78
            RTS

L0C78       LDA   L0AAF
            DEC
            ASL
            TAX
            LDA   L1666,X
            STA   $14
            LDY   #$0000
            LDA   ($14),Y
            STA   L0553
            LDA   $14
            CLC
            ADC   #$000A
            STA   $14
            LDA   #$0000
L0C96       PHA
            LDY   #$0000
            LDA   ($14),Y
            STA   L0CD8
            LDY   #$0002
            LDA   ($14),Y
            STA   L0CD6
            LDY   #$0004
            LDA   ($14),Y
            STA   L0CDC
            LDY   #$0006
            LDA   ($14),Y
            STA   L0CDA
            PEA   ^L0CD6
            PEA   L0CD6
            _FrameRect
            LDA   $14
            CLC
            ADC   #$000E
            STA   $14
            PLA
            INC
            CMP   L0553
            BCC   L0C96
            RTS

L0CD4       DW    $0000
L0CD6       DW    $0000
L0CD8       DW    $0000
L0CDA       DW    $0000
L0CDC       DW    $0000
L0CDE       JSR   L0E10
            PEA   $0000
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            _AlertWindow
            JSR   L0E2E
            PLA
            BEQ   L0D01
            RTS

L0D01       JSR   L5C47
            PEA   $0001
            LDA   L0E76+2
            PHA
            LDA   L0E76
            PHA
            _ShutDownTools
L0D16       LDA   L0E72
            PHA
            _DisposeAll
            LDA   L0E72
            PHA
            _MMShutDown
            _TLShutDown
            JSL   GSOS
            DW    $2029            ; Quit
            ADRL  L114D
            BRK   $BD
L0D3F       PHA
            PHA
            PEA   $0001
            PEA   $0000
            LDA   L0E72
            PHA
            PEA   $C01C
            PEA   $0000
            PEA   $0000
            _NewHandle
            PHD
            TSC
            TCD
            LDA   [$03]
            TAX
            LDY   #$0002
            LDA   [$03],Y
            TXY
            TAX
            PLD
            PLA
            PLA
            RTS

L0D6C       STA   L0DB8+1
            JSR   L5F44
            SEP   #$20
            LDA   L0E7E+2
            STA   L0DB3+2
            STA   L0D97+3
            STA   L0DBF+3
            STA   L0DEC+3
            LDA   L0E7A+2
            STA   L0DB3+1
            STA   L0DDE+1
            STA   L0DDE+2
            REP   #$20
            LDY   #$0000
            LDX   #$0010
L0D97       LDAL  $AA0000,X
            INX
            STA   L0DC8+1
            AND   #$00F0
            BEQ   L0DB8
            CMP   #$00F0
            BNE   L0DAE
            JSR   L0DE6
            BRA   L0DB2
L0DAE       LSR
            LSR
            LSR
            LSR
L0DB2       DEC
L0DB3       MVN   $AA0000,$BB0000
            PHK
            PLB
L0DB8       CPX   #$AAAA
            BEQ   L0E06
            TYA
            SEC
L0DBF       SBCL  $AA0000,X
            INX
            INX
            STA   L0DDB+1
L0DC8       LDA   #$0000
            AND   #$000F
            CMP   #$000F
            BNE   L0DD6
            JSR   L0DE9
L0DD6       CLC
            ADC   #$0003
            PHX
L0DDB       LDX   #$AAAA
L0DDE       MVN   $BB0000,$BB0000
            PHK
            PLB
            PLX
            BRA   L0D97
L0DE6       LDA   #$000F
L0DE9       STA   L0DFA+1
L0DEC       LDAL  $AA0000,X
            INX
            AND   #$00FF
            CMP   #$00FF
            BNE   L0E02
            CLC
L0DFA       ADC   #$000F
            STA   L0DFA+1
            BRA   L0DEC
L0E02       ADC   L0DFA+1
            RTS

L0E06       STY   L0E0C
            JMP   L5F54

L0E0C       ADRL  $00000000
L0E10       _HideCursor
            LDX   #$7FFE
L0E1A       LDAL  $E12000,X
L0E1E       STAL  $008000,X
            DEX
            DEX
            BPL   L0E1A
L0E26       _ShowCursor
            RTS

L0E2E       _HideCursor
            LDX   #$7FFE
L0E38       LDAL  $008000,X
            STAL  $012000,X
            STAL  $E12000,X
            DEX
            DEX
            BPL   L0E38
            BMI   L0E26
L0E4A       DEC
            TAX
            LDA   #$0000
L0E4F       CLC
            ADC   #$003C
            CPX   #$0000
            BEQ   L0E5B
            DEX
            BRA   L0E4F
L0E5B       PHA
L0E5C       LDAL  $E0C018
            BPL   L0E5C
L0E62       LDAL  $E0C018
            BMI   L0E62
            PLA
            DEC
            BNE   L0E5B
            SEC
            RTS

L0E6E       ADRL  $00000000
L0E72       DW    $0000
L0E74       DW    $0000
L0E76       ADRL  $00000000
L0E7A       ADRL  $00000000
L0E7E       ADRL  $00000000
L0E82       ADRL  $00008000
            DW    $0000
            DW    $0000
            DW    $0000
L0E8C       STR   'System 6.0.1 Required!'
L0EA3       STR   'Press a key to quit'
L0EB7       STR   'Error while loading tools'
L0ED1       STR   'Cannot allocate memory'
L0EE8       STR   'Cannot load file'
L0EF9       STR   'Quit'
L0EFE       DB    $00
L0EFF       DW    $0000            ; event code
L0F01       ADRL  $00000000        ; event message
            ADRL  $00000000        ; tick count
L0F09       DW    $0000            ; mouse location
L0F0B       DW    $0000
L0F0D       DW    $0000            ; modifiers
            ADRL  $00000000        ; task data
            ADRL  $001FFFFF        ; task mask
            ADRL  $00000000
            DW    $0000
            ADRL  $00000000
            ADRL  $00000000
L0F25       ADRL  $00000000
            ADRL  $00000000
L0F2D       DA    L0260
            DA    L0260
            DA    L028E
            DA    L0213
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0294
            DA    L0260
L0F73       DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L0260
            DA    L032E
            DA    L032E
            DA    L032E
            DA    L032E
            DA    L0335
            DA    L037C
            DA    L03C3
            DA    L0ABB
            DA    L0B27
            DA    L0AD5
L0FB1       STR   'Load which party?'
L0FC3       STR   'Save party as...'
L0FD4       HEX   015D
L0FD6       DW    $0000
            DW    $0000
            DW    $0000
L0FDC       HEX   05
L0FDD       ASC   'Party'
            HEX   00000000000000000000
            HEX   00
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00
L106E       STA   L110F
            STY   L113D
            STX   L113D+2
            STZ   L10C1
            JSL   GSOS
            DW    $2010            ; Open
            ADRL  L110B
            BCS   L10B8
            LDA   L110D
            STA   L113B
            STA   L114B
            LDA   L1135
            STA   L1141
            LDA   L1135+2
            STA   L1141+2
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  L1139
            BCS   L10B8
L10A7       JSL   GSOS
            DW    $2014            ; Close
            ADRL  L1149
            LDY   L1145
            LDX   L1145+2
            RTS

L10B8       JSR   L10A7
            LDY   #$0000
            TYX
            SEC
            RTS

L10C1       DW    $0000
L10C3       DW    $0007            ; Parms for Create
            ADRL  L117B            ;  file name
            DW    $00C3            ;  access
            DW    $005D            ;  file type
            ADRL  $0000801B        ;  aux type
            DW    $0000            ;  storage
            ADRL  $00000000        ;  end of file
            ADRL  $00000000        ;  resource eof
L10DB       DW    $0001            ; Parms for Destroy
            ADRL  L117B            ;  file name
L10E1       DW    $0002            ; Parms for Open
L10E3       DW    $0000            ;  ref num
            ADRL  L117B            ;  path name
L10E9       DW    $0004            ; Parms for Read
L10EB       DW    $0000            ;  ref num
L10ED       ADRL  L117B            ;  buffer ptr
L10F1       ADRL  $00000000        ;  request count
            ADRL  $00000000        ;  transfer count
L10F9       DW    $0005            ; Parms for Write
L10FB       DW    $0000            ;  ref num
L10FD       ADRL  L117B            ;  buffer ptr
L1101       ADRL  $00000000        ;  request count
            ADRL  $00000000        ;  transfer count
            DW    $0001            ;  cache priority
L110B       DW    $000C            ; Parms for Open
L110D       DW    $0000            ;  ref num
L110F       ADRL  L1159            ;  path name
            DW    $0000            ;  req access
            DW    $0000            ;  res num
            DW    $0000            ;  access
            DW    $0000            ;  file type
            ADRL  $00000000        ;  aux type
            DW    $0000            ;  storage
            DS    8                ;  creation date
            DS    8                ;  modification date
            ADRL  $00000000        ;  option list
L1135       ADRL  $00000000        ;  end of file
L1139       DW    $0004            ; Parms for Read
L113B       DW    $0000            ;  ref num
L113D       ADRL  $00000000        ;  buffer ptr
L1141       ADRL  $00000000        ;  request count
L1145       ADRL  $00000000        ;  transfer count
L1149       DW    $0001            ; Parms for Close
L114B       DW    $0000            ;  ref num
L114D       DW    $0002            ; Parms for Quit
            ADRL  $00000000        ;  path name
            DW    $0000            ;  flags
L1155       DW    $0001            ; Parms for GetVersion
L1157       DW    $0000            ;  version number
L1159       STRL  '1/data/p00.lz4'
L1169       STRL  '1/data/icons.lz4'
L117B       STRL  '0/               '
L118E       DW    $0004
L1190       DW    $0075
L1192       DW    $0019
L1194       DW    $0089
            DW    $001A
            DW    $0075
            DW    $002F
            DW    $0089
            DW    $0030
            DW    $0075
            DW    $0045
            DW    $0089
            DW    $0046
            DW    $0075
            DW    $005B
            DW    $0089
            DW    $005C
            DW    $0075
            DW    $0071
            DW    $0089
            DW    $0072
            DW    $0075
            DW    $0087
            DW    $0089
            DW    $0088
            DW    $0075
            DW    $009D
            DW    $0089
            DW    $009E
            DW    $0075
            DW    $00B3
            DW    $0089
            DW    $00B4
            DW    $0075
            DW    $00C9
            DW    $0089
            DW    $00CA
            DW    $0075
            DW    $00DF
            DW    $0089
            DW    $0004
            DW    $008A
            DW    $0019
            DW    $009E
            DW    $001A
            DW    $008A
            DW    $002F
            DW    $009E
            DW    $0030
            DW    $008A
            DW    $0045
            DW    $009E
            DW    $0046
            DW    $008A
            DW    $005B
            DW    $009E
            DW    $005C
            DW    $008A
            DW    $0071
            DW    $009E
            DW    $0072
            DW    $008A
            DW    $0087
            DW    $009E
            DW    $0088
            DW    $008A
            DW    $009D
            DW    $009E
            DW    $009E
            DW    $008A
            DW    $00B3
            DW    $009E
            DW    $00B4
            DW    $008A
            DW    $00C9
            DW    $009E
            DW    $00CA
            DW    $008A
            DW    $00DF
            DW    $009E
            DW    $00E6
            DW    $0070
            DW    $00FA
            DW    $0086
            DW    $00FE
            DW    $0070
            DW    $0112
            DW    $0086
            DW    $00E6
            DW    $0089
            DW    $00FA
            DW    $009F
            DW    $00FE
            DW    $0089
            DW    $0112
            DW    $009F
            DW    $0115
            DW    $004A
            DW    $013D
            DW    $0064
            DW    $0115
            DW    $0067
            DW    $013D
            DW    $0081
            DW    $0115
            DW    $0084
            DW    $013D
            DW    $009E
            DW    $0115
            DW    $0002
            DW    $013D
            DW    $000D
            DW    $0115
            DW    $0010
            DW    $013D
            DW    $002A
            DW    $0115
            DW    $002D
            DW    $013D
            DW    $0047
L127E       HEX   00000000000000000000000000000000
            HEX   0000000000000000000000000000
L129C       HEX   00000000000000000000000000000000
            HEX   00
L12AD       HEX   00000000000000000000000000000000
            HEX   00000000
L12C1       HEX   00000000000000000000000000000000
            HEX   00000000
L12D5       DA    L12FD
            DA    L1316
            DA    L1334
            DA    L1371
            DA    L13A3
            DA    L13C9
            DA    L13E0
            DA    L13FF
            DA    L1416
            DA    L143F
            DA    L1471
            DA    L14B0
            DA    L14D3
            DA    L14E0
            DA    L1527
            DA    L1545
            DA    L15D0
            DA    L1603
            DA    L1636
            DA    L1665
L12FD       STR   'A photo of Professor X.!'
L1316       STR   'A plane ticket to N'27'Gwanal'8E'l'8E
L1334       STR   'A credit card. There must be some money left in the account.'
L1371       STR   'Passport. Inseparable companion of the Adventurer'
L13A3       STR   'Twigs. It must be able to burn easily'
L13C9       STR   'A machete (calm down!)'
L13E0       STR   'The famous fetish so coveted!!'
L13FF       STR   'Click click, a lighter'
L1416       STR   'Bill'27's ID card when he takes the subway.'
L143F       STR   'An old salad. Not edible for a civilized being...'
L1471       STR   'A mechanical mouse. It shakes a few seconds after being raised'
L14B0       STR   'A box of paella. No time to eat...'
L14D3       STR   'A can opener'
L14E0       STR   'The Perfect Adventurer'27's Guide. Bill hasn'27't needed it for a long time!'
L1527       STR   'The bomb seems to be disarmed'
L1545       STR   'The Adventurer'27's Gazette. A freelance writer reveals that a fetish was stolen from N'27'Gwanal'8E'l'8E' by Professor X., this scholar of sad renown'
L15D0       STR   'Let'27's keep calm: this submachine gun is loaded ...'
L1603       STR   'A call. It makes a weird noise when you blow in it'
L1636       STR   'This gun should only be used for a good cause!'
L1665       STR   ''
L1666       DA    L16D6
            DA    L18D3
            DA    L1AB9
            DA    L1B64
            DA    L1C33
            DA    L1C8F
            DA    L1D2E
            DA    L1E00
            DA    L1E1B
            DA    L1F6A
            DA    L2144
            DA    L22ED
            DA    L238F
            DA    L2424
            DA    L256A
            DA    L2679
            DA    L2694
            DA    L26AF
            DA    L27BE
            DA    L287A
            DA    L29B3
            DA    L29CE
            DA    L29E9
            DA    L2A2C
            DA    L2A9B
            DA    L2B2B
            DA    L2BA4
            DA    L2C5D
            DA    L2CB2
            DA    L2D72
            DA    L2DFB
            DA    L2E16
            DA    L2E57
            DA    L2EDD
            DA    L2FB7
            DA    L30B3
            DA    L314E
            DA    L3169
            DA    L32BF
            DA    L337B
            DA    L33D2
            DA    L33ED
            DA    L351B
            DA    L3536
            DA    L366E
            DA    L377D
            DA    L3798
            DA    L37B3
            DA    L394F
            DA    L3A09
            DA    L3A7F
            DA    L3CAC
            DA    L3F3D
            DA    L41CA
            DA    L41E5
            DA    L4200
L16D6       DW    $0007
            DW    $0002
            DW    $0004
            DW    $0000
            DW    $0000
            DW    $007B
            DW    $0054
            DW    $008A
            DW    $006A
            DA    L1742
            DA    L1743
            DA    L1756
            DW    $0036
            DW    $0047
            DW    $0044
            DW    $0054
            DA    L1757
            DA    L1758
            DA    L1764
            DW    $004F
            DW    $0044
            DW    $0075
            DW    $006C
            DA    L1765
            DA    L1773
            DA    L177B
            DW    $0013
            DW    $002B
            DW    $0036
            DW    $0062
            DA    L17BE
            DA    L17BF
            DA    L17E8
            DW    $004D
            DW    $0017
            DW    $0096
            DW    $0039
            DA    L17E9
            DA    L1811
            DA    L182F
            DW    $009E
            DW    $0025
            DW    $00F7
            DW    $006C
            DA    L1830
            DA    L183D
            DA    L187D
            DW    $001B
            DW    $0036
            DW    $002A
            DW    $003B
            DA    L187E
            DA    L18A7
            DA    L18D2
L1742       STR   ''
L1743       STR   'An old packing box'
L1756       STR   ''
L1757       STR   ''
L1758       STR   'The mailbox'
L1764       STR   ''
L1765       STR   'Disgusting...'
L1773       STR   'A tramp'
L177B       STR   "RA little politeness! I was an adventurer game developer, me Sir!S"
L17BE       STR   ''
L17BF       STR   'What if Bill was looking out the window?'
L17E8       STR   ''
L17E9       STR   'How about you walk in through the door?'
L1811       STR   'It is inside Bill'27's apartment'
L182F       STR   ''
L1830       STR   'Don'27't touch!'
L183D       STR   'He is Bill Palmer, hero of heroes on the way to a new adventure'
L187D       STR   ''
L187E       STR   'Bill is not going to tear the plate off!'
L18A7       STR   "RBill Palmer. Adventurer. On appointment.S"
L18D2       STR   ''
L18D3       DW    $0007
            DW    $0003
            DW    $0001
            DW    $0000
            DW    $0000
            DW    $004D
            DW    $001A
            DW    $0062
            DW    $0033
            DA    L193F
            DA    L196B
            DA    L196C
            DW    $0052
            DW    $0035
            DW    $0059
            DW    $003D
            DA    L196D
            DA    L196E
            DA    L1979
            DW    $0002
            DW    $0014
            DW    $0037
            DW    $002F
            DA    L197A
            DA    L197B
            DA    L19AC
            DW    $0016
            DW    $003C
            DW    $0054
            DW    $0055
            DA    L19AD
            DA    L19BC
            DA    L19C6
            DW    $00BB
            DW    $0031
            DW    $00CB
            DW    $0048
            DA    L19C7
            DA    L19E2
            DA    L19FC
            DW    $0047
            DW    $0008
            DW    $0061
            DW    $0017
            DA    L19FD
            DA    L1A1C
            DA    L1A47
            DW    $00AC
            DW    $002C
            DW    $00B3
            DW    $0032
            DA    L1A48
            DA    L1AA7
            DA    L1AB8
L193F       STR   'Bill is already sporting his leather jacket'
L196B       STR   ''
L196C       STR   ''
L196D       STR   ''
L196E       STR   'The pocket'
L1979       STR   ''
L197A       STR   ''
L197B       STR   'A shelf full of old books and computer magazines'
L19AC       STR   ''
L19AD       STR   'A little soggy'
L19BC       STR   'The couch'
L19C6       STR   ''
L19C7       STR   'Be careful, it is fragile!'
L19E2       STR   'A worthless old Ming vase'
L19FC       STR   ''
L19FD       STR   'The hole is already big enough'
L1A1C       STR   'Hey Bill! Should see to redo the plasters!'
L1A47       STR   ''
L1A48       STR   'Damn! The blind is stuck. We will have to find another trick to watch the neighbor get dressed'
L1AA7       STR   'The blind zipper'
L1AB8       STR   ''
L1AB9       DW    $0003
            DW    $0002
            DW    $0002
            DW    $0002
            DW    $0002
            DW    $008A
            DW    $0044
            DW    $0099
            DW    $0051
            DA    L1AED
            DA    L1AEE
            DA    L1B08
            DW    $0056
            DW    $005B
            DW    $0068
            DW    $0067
            DA    L1B09
            DA    L1B0A
            DA    L1B0B
            DW    $00CD
            DW    $0000
            DW    $00E3
            DW    $0015
            DA    L1B0C
            DA    L1B32
            DA    L1B63
L1AED       STR   ''
L1AEE       STR   'The lock. Currently open.'
L1B08       STR   ''
L1B09       STR   ''
L1B0A       STR   ''
L1B0B       STR   ''
L1B0C       STR   'Not yet the time to draw the curtains'
L1B32       STR   'Not very clean. Should see to wash it all, Bill!'
L1B63       STR   ''
L1B64       DW    $0003
            DW    $0006
            DW    $0001
            DW    $0000
            DW    $0000
            DW    $00C9
            DW    $0027
            DW    $010E
            DW    $0061
            DA    L1B98
            DA    L1B99
            DA    L1BAE
            DW    $0002
            DW    $0035
            DW    $009D
            DW    $006D
            DA    L1BC9
            DA    L1BE6
            DA    L1C0D
            DW    $00B1
            DW    $003A
            DW    $00BB
            DW    $0043
            DA    L1C1D
            DA    L1C1E
            DA    L1C32
L1B98       STR   ''
L1B99       STR   'It was a nice car...'
L1BAE       STR   'Do you speak car language?'
L1BC9       STR   'It would leave fingerprints!'
L1BE6       STR   'No, no. Not this one. The other one!!!'
L1C0D       STR   'We would eat...'
L1C1D       STR   ''
L1C1E       STR   'The hood open there'
L1C32       STR   ''
L1C33       DW    $0002
            DW    $0004
            DW    $0004
            DW    $0004
            DW    $0004
            DW    $0090
            DW    $0035
            DW    $00BC
            DW    $0049
            DA    L1C59
            DA    L1C6D
            DA    L1C6E
            DW    $002C
            DW    $0050
            DW    $0076
            DW    $006B
            DA    L1C6F
            DA    L1C70
            DA    L1C8E
L1C59       STR   'Fix it? To do what?'
L1C6D       STR   ''
L1C6E       STR   ''
L1C6F       STR   ''
L1C70       STR   'Just for a few extra parts...'
L1C8E       STR   ''
L1C8F       DW    $0004
            DW    $0004
            DW    $0004
            DW    $0004
            DW    $0004
            DW    $00DE
            DW    $0031
            DW    $00E9
            DW    $003E
            DA    L1CD1
            DA    L1CD2
            DA    L1CE3
            DW    $00D1
            DW    $0033
            DW    $00D9
            DW    $003D
            DA    L1CE4
            DA    L1CE5
            DA    L1CF3
            DW    $00EA
            DW    $0038
            DW    $0109
            DW    $004A
            DA    L1CF4
            DA    L1CF5
            DA    L1D03
            DW    $00BC
            DW    $0040
            DW    $00C9
            DW    $004C
            DA    L1D04
            DA    L1D1E
            DA    L1D2D
L1CD1       STR   ''
L1CD2       STR   'The ignition key'
L1CE3       STR   ''
L1CE4       STR   ''
L1CE5       STR   'The altimeter'
L1CF3       STR   ''
L1CF4       STR   ''
L1CF5       STR   'The glove box'
L1D03       STR   ''
L1D04       STR   'It is okay, it is stalled'
L1D1E       STR   'The gear lever'
L1D2D       STR   ''
L1D2E       DW    $0003
            DW    $0009
            DW    $0000
            DW    $0000
            DW    $0004
            DW    $0002
            DW    $0048
            DW    $004D
            DW    $0060
            DA    L1D62
            DA    L1D7F
            DA    L1DA2
            DW    $005F
            DW    $0017
            DW    $0086
            DW    $0024
            DA    L1DA3
            DA    L1DC6
            DA    L1DDC
            DW    $00B1
            DW    $002C
            DW    $010F
            DW    $006D
            DA    L1DDD
            DA    L1DDE
            DA    L1DFF
L1D62       STR   'It cannot be taken like that'
L1D7F       STR   'Quickly, he leaves to N'27'Gwanal'8E'l'8E'!'
L1DA2       STR   ''
L1DA3       STR   'Would take a lot of moment to jump'
L1DC6       STR   'Too late for that one'
L1DDC       STR   ''
L1DDD       STR   ''
L1DDE       STR   'She does not get better with age'
L1DFF       STR   ''
L1E00       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L1E18
            DA    L1E19
            DA    L1E1A
L1E18       STR   ''
L1E19       STR   ''
L1E1A       STR   ''
L1E1B       DW    $0004
            DW    $0000
            DW    $0007
            DW    $0000
            DW    $0000
            DW    $0013
            DW    $000F
            DW    $0046
            DW    $003D
            DA    L1E5D
            DA    L1E7F
            DA    L1E86
            DW    $008F
            DW    $000E
            DW    $00C0
            DW    $003C
            DA    L1E8F
            DA    L1EB4
            DA    L1EE1
            DW    $00B8
            DW    $0032
            DW    $00D2
            DW    $003D
            DA    L1F1B
            DA    L1F41
            DA    L1F4D
            DW    $00C2
            DW    $0010
            DW    $00E2
            DW    $0017
            DA    L1F4E
            DA    L1F4F
            DA    L1F69
L1E5D       STR   'Let'27's see, a little discretion!!!'
L1E7F       STR   'Glup!!'
L1E86       STR   'Schmack!'
L1E8F       STR   'Instead, keep your hand on the mouse'
L1EB4       STR   'Bill should first think about his mission...'
L1EE1       STR   "RWe have special promotions for tickets to South Africa!S"
L1F1B       STR   'Above all, you are not embarrassed...'
L1F41       STR   'A telephone'
L1F4D       STR   ''
L1F4E       STR   ''
L1F4F       STR   'Credit cards are accepted'
L1F69       STR   ''
L1F6A       DW    $0005
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0009
            DW    $00C0
            DW    $001C
            DW    $00E0
            DW    $0062
            DA    L1FBA
            DA    L1FE4
            DA    L2016
            DW    $0079
            DW    $003C
            DW    $0099
            DW    $006C
            DA    L203D
            DA    L2056
            DA    L2084
            DW    $0018
            DW    $0015
            DW    $004A
            DW    $0064
            DA    L2099
            DA    L209A
            DA    L20C1
            DW    $00EF
            DW    $000A
            DW    $010B
            DW    $006A
            DA    L20DD
            DA    L20DE
            DA    L2100
            DW    $0004
            DW    $0010
            DW    $0018
            DW    $0032
            DA    L212F
            DA    L2135
            DA    L213C
L1FBA       STR   "RIt is very nice to help me my good sir!S"
L1FE4       STR   'Too bad he is White. He looked like Stevie Wonder'
L2016       STR   "RSorry, is this the soccer game here?S"
L203D       STR   'Come on!!! At her age!!!'
L2056       STR   'If you are already looking at little girls...'
L2084       STR   "RYou want my photo?S"
L2099       STR   ''
L209A       STR   'Be careful, it is the customs officer!'
L20C1       STR   'Show your passport, please!'
L20DD       STR   ''
L20DE       STR   'It must be a diplomat coming home'
L2100       STR   "RAnothe' one who thinks he is Ha'ison Fowd...S"
L212F       STR   'Stop!'
L2135       STR   "RStopS"
L213C       STR   'Re-stop'
L2144       DW    $0004
            DW    $0000
            DW    $0000
            DW    $000A
            DW    $000C
            DW    $0027
            DW    $004C
            DW    $006B
            DW    $005B
            DA    L2186
            DA    L21A2
            DA    L21E0
            DW    $002F
            DW    $0037
            DW    $0052
            DW    $005B
            DA    L21E1
            DA    L21E2
            DA    L21F6
            DW    $0081
            DW    $0011
            DW    $00BF
            DW    $0057
            DA    L2236
            DA    L2244
            DA    L227F
            DW    $00BE
            DW    $0008
            DW    $0106
            DW    $003F
            DA    L2288
            DA    L229B
            DA    L22BF
L2186       STR   'Bill already has his ticket'
L21A2       STR   'It is a plane ticket to Auckland. A one-way ticket is enough!'
L21E0       STR   ''
L21E1       STR   ''
L21E2       STR   'Is he the pilot?!?!'
L21F6       STR   "RThink that there is only one parachute for the whole plane...S"
L2236       STR   'To push him??'
L2244       STR   'What if Bill did the same before he encountered the worst?'
L227F       STR   "RArgh!!S"
L2288       STR   'Don'27't be afraid...'
L229B       STR   "RPoids weight without load: 213 KgS"
L22BF       STR   "RAren't you gonna get off on our honeymoon!?S"
L22ED       DW    $0004
            DW    $0000
            DW    $000D
            DW    $0000
            DW    $0000
            DW    $0006
            DW    $004F
            DW    $0023
            DW    $005B
            DA    L232F
            DA    L2330
            DA    L2336
            DW    $002B
            DW    $0040
            DW    $0036
            DW    $004F
            DA    L2337
            DA    L2338
            DA    L2348
            DW    $0029
            DW    $0052
            DW    $003D
            DW    $0062
            DA    L2349
            DA    L234A
            DA    L236E
            DW    $0047
            DW    $000E
            DW    $0068
            DW    $0031
            DA    L236F
            DA    L2386
            DA    L238E
L232F       STR   ''
L2330       STR   'Mecca'
L2336       STR   ''
L2337       STR   ''
L2338       STR   'Alaska 13583 km'
L2348       STR   ''
L2349       STR   ''
L234A       STR   'Maubeuge (city center) : first left'
L236E       STR   ''
L236F       STR   'Be careful, it cuts!!!'
L2386       STR   'A helix'
L238E       STR   ''
L238F       DW    $0003
            DW    $000F
            DW    $000C
            DW    $000C
            DW    $000E
            DW    $0096
            DW    $000C
            DW    $00AD
            DW    $0018
            DA    L23C3
            DA    L23C4
            DA    L23D6
            DW    $00B2
            DW    $0019
            DW    $00CE
            DW    $0025
            DA    L23D7
            DA    L23D8
            DA    L23EC
            DW    $001C
            DW    $005B
            DW    $0059
            DW    $0065
            DA    L23ED
            DA    L23EE
            DA    L2423
L23C3       STR   ''
L23C4       STR   "RDromacar dealerS"
L23D6       STR   ''
L23D7       STR   ''
L23D8       STR   "RWalk this way!!!!S"
L23EC       STR   ''
L23ED       STR   ''
L23EE       STR   'Hum! There seems to be something under these stones!'
L2423       STR   ''
L2424       DW    $0003
            DW    $0000
            DW    $000D
            DW    $0000
            DW    $0000
            DW    $00C3
            DW    $0016
            DW    $00E1
            DW    $003C
            DA    L2458
            DA    L2459
            DA    L2479
            DW    $00E7
            DW    $0021
            DW    $00F5
            DW    $003B
            DA    L24CB
            DA    L24FD
            DA    L2506
            DW    $0002
            DW    $003C
            DW    $003C
            DW    $006A
            DA    L2507
            DA    L2508
            DA    L2531
L2458       STR   ''
L2459       STR   'He is the curator of the museum'
L2479       STR   "RIf you bring the Stolen Fetish back to us, you will get a big reward right now!S"
L24CB       STR   'It would be too easy if that was the one to find!'
L24FD       STR   'A fetish'
L2506       STR   ''
L2507       STR   ''
L2508       STR   'It was either that or end up in cat food'
L2531       STR   'Either way, it is not now that he is gonna start talking'
L256A       DW    $0003
            DW    $0010
            DW    $000D
            DW    $0000
            DW    $0000
            DW    $0045
            DW    $003E
            DW    $0079
            DW    $006C
            DA    L259E
            DA    L259F
            DA    L25B7
            DW    $0002
            DW    $000E
            DW    $0044
            DW    $0038
            DA    L25E2
            DA    L2605
            DA    L261F
            DW    $0067
            DW    $000B
            DW    $00C2
            DW    $0039
            DA    L2651
            DA    L265D
            DA    L2678
L259E       STR   ''
L259F       STR   'A seller of dromedaries'
L25B7       STR   "RI only deal with real adventurers there!S"
L25E2       STR   'Did you hope he was going to purr?'
L2605       STR   'Un cam... No, a dromadary'
L261F       STR   'Dromedaries do not speak, even in adventure games'
L2651       STR   'Good boy...'
L265D       STR   'He must be malnourished...'
L2678       STR   ''
L2679       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L2691
            DA    L2692
            DA    L2693
L2691       STR   ''
L2692       STR   ''
L2693       STR   ''
L2694       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L26AC
            DA    L26AD
            DA    L26AE
L26AC       STR   ''
L26AD       STR   ''
L26AE       STR   ''
L26AF       DW    $0004
            DW    $0014
            DW    $0000
            DW    $0000
            DW    $0013
            DW    $0004
            DW    $0034
            DW    $0027
            DW    $004D
            DA    L26F1
            DA    L26F2
            DA    L2714
            DW    $0024
            DW    $0020
            DW    $0075
            DW    $0056
            DA    L2715
            DA    L2716
            DA    L2731
            DW    $0075
            DW    $0024
            DW    $00E2
            DW    $0061
            DA    L2732
            DA    L2733
            DA    L277D
            DW    $00EB
            DW    $0024
            DW    $0108
            DW    $0061
            DA    L277E
            DA    L277F
            DA    L2795
L26F1       STR   ''
L26F2       STR   'It must be the fourth class wagon'
L2714       STR   ''
L2715       STR   ''
L2716       STR   'The adventurer class wagon'
L2731       STR   ''
L2732       STR   ''
L2733       STR   'The reformed model 1865 locomotive 1917 is just waiting for Bill to leave'
L277D       STR   ''
L277E       STR   ''
L277F       STR   'A hitchhiker no doubt'
L2795       STR   "RTchou tchou!! T'wain is going to leav'S"
L27BE       DW    $0002
            DW    $0000
            DW    $0000
            DW    $0012
            DW    $0000
            DW    $00AB
            DW    $0018
            DW    $010E
            DW    $004D
            DA    L27E4
            DA    L2802
            DA    L2830
            DW    $00B5
            DW    $0059
            DW    $00EB
            DW    $006B
            DA    L2848
            DA    L285C
            DA    L2879
L27E4       STR   'Slowly, it might wake him up!'
L2802       STR   'He sells tickets. But the break seems long...'
L2830       STR   "RLater, coco, later...S"
L2848       STR   'Ugh! Human bones...'
L285C       STR   'Well, some people eat rabbit'
L2879       STR   ''
L287A       DW    $0005
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $00A9
            DW    $000F
            DW    $00DB
            DW    $006C
            DA    L28CA
            DA    L28CB
            DA    L28FB
            DW    $00E1
            DW    $000A
            DW    $010F
            DW    $006B
            DA    L2908
            DA    L2909
            DA    L2943
            DW    $00C7
            DW    $0002
            DW    $00D1
            DW    $0008
            DA    L2944
            DA    L2945
            DA    L299C
            DW    $005B
            DW    $0010
            DW    $0068
            DW    $001A
            DA    L299D
            DA    L299E
            DA    L29AF
            DW    $000C
            DW    $000F
            DW    $0052
            DW    $0044
            DA    L29B0
            DA    L29B1
            DA    L29B2
L28CA       STR   ''
L28CB       STR   'Blistering barnacles! Would we be in the Congo?'
L28FB       STR   "RBy crikey!S"
L2908       STR   ''
L2909       STR   'So what? The first class is also allowed to Black people.'
L2943       STR   ''
L2944       STR   ''
L2945       STR   "REat at Joe's. On the menu: missionnary, businessman, freelance writer. Ketchup extraS"
L299C       STR   ''
L299D       STR   ''
L299E       STR   'The alarm signal'
L29AF       STR   ''
L29B0       STR   ''
L29B1       STR   ''
L29B2       STR   ''
L29B3       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0014
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L29CB
            DA    L29CC
            DA    L29CD
L29CB       STR   ''
L29CC       STR   ''
L29CD       STR   ''
L29CE       DW    $0001
            DW    $0000
            DW    $0017
            DW    $0017
            DW    $0014
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L29E6
            DA    L29E7
            DA    L29E8
L29E6       STR   ''
L29E7       STR   ''
L29E8       STR   ''
L29E9       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0018
            DW    $0000
            DW    $0050
            DW    $004F
            DW    $006C
            DW    $005A
            DA    L2A01
            DA    L2A02
            DA    L2A2B
L2A01       STR   ''
L2A02       STR   'What if this stone was hiding something?'
L2A2B       STR   ''
L2A2C       DW    $0002
            DW    $001C
            DW    $0017
            DW    $0019
            DW    $0000
            DW    $003C
            DW    $004B
            DW    $0052
            DW    $0069
            DA    L2A52
            DA    L2A53
            DA    L2A68
            DW    $0075
            DW    $000F
            DW    $009C
            DW    $0030
            DA    L2A69
            DA    L2A6A
            DA    L2A9A
L2A52       STR   ''
L2A53       STR   "RWarning: elephantsS"
L2A68       STR   ''
L2A69       STR   ''
L2A6A       STR   'The top of this mountain is hiding something...'
L2A9A       STR   ''
L2A9B       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $00A2
            DW    $0002
            DW    $0107
            DW    $004B
            DA    L2AB3
            DA    L2AC7
            DA    L2B17
L2AB3       STR   'Is that reasonable?'
L2AC7       STR   'In my opinion, the self control of this pachyderm seems to be seriously damaged'
L2B17       STR   "RSlow down, buddy!S"
L2B2B       DW    $0001
            DW    $0000
            DW    $0018
            DW    $0000
            DW    $0018
            DW    $00EE
            DW    $004A
            DW    $0110
            DW    $006C
            DA    L2B43
            DA    L2B5D
            DA    L2BA3
L2B43       STR   'Cannot pull twigs by hand'
L2B5D       STR   'A rare variety of an African herb renowned for its ease of combustion'
L2BA3       STR   ''
L2BA4       DW    $0003
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0018
            DW    $0001
            DW    $0002
            DW    $0060
            DW    $006E
            DA    L2BD8
            DA    L2BD9
            DA    L2BDA
            DW    $00E1
            DW    $0047
            DW    $0103
            DW    $006D
            DA    L2BDB
            DA    L2BF7
            DA    L2C26
            DW    $0079
            DW    $004D
            DW    $00D4
            DW    $006A
            DA    L2C27
            DA    L2C28
            DA    L2C34
L2BD8       STR   ''
L2BD9       STR   ''
L2BDA       STR   ''
L2BDB       STR   'No need, no one is in sight'
L2BF7       STR   'The stone that comes to knock this wretch down'
L2C26       STR   ''
L2C27       STR   ''
L2C28       STR   'He is dead!'
L2C34       STR   'And you imagined he was going to answer?'
L2C5D       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0018
            DW    $0001
            DW    $0002
            DW    $0060
            DW    $006E
            DA    L2C75
            DA    L2C76
            DA    L2C95
L2C75       STR   ''
L2C76       STR   'We will have to climb all that'
L2C95       STR   'It is not a sacred mountain!'
L2CB2       DW    $0003
            DW    $0020
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0002
            DW    $0011
            DW    $0024
            DW    $0031
            DA    L2CE6
            DA    L2CFB
            DA    L2D22
            DW    $0028
            DW    $002D
            DW    $0038
            DW    $0039
            DA    L2D23
            DA    L2D24
            DA    L2D48
            DW    $005F
            DW    $005D
            DW    $008B
            DW    $006D
            DA    L2D49
            DA    L2D4A
            DA    L2D67
L2CE6       STR   'What about the SPCA?'
L2CFB       STR   'You never know, sometimes Bill dies...'
L2D22       STR   ''
L2D23       STR   ''
L2D24       STR   'It would probably make a nice catch'
L2D48       STR   ''
L2D49       STR   ''
L2D4A       STR   'Warning! It is chasing Bill!'
L2D67       STR   "RUrk Urk!S"
L2D72       DW    $0002
            DW    $001F
            DW    $001B
            DW    $0000
            DW    $001B
            DW    $0002
            DW    $0011
            DW    $0024
            DW    $0031
            DA    L2D98
            DA    L2DAD
            DA    L2DD4
            DW    $0028
            DW    $002D
            DW    $0038
            DW    $0039
            DA    L2DD5
            DA    L2DD6
            DA    L2DFA
L2D98       STR   'What about the SPCA?'
L2DAD       STR   'You never know, sometimes Bill dies...'
L2DD4       STR   ''
L2DD5       STR   ''
L2DD6       STR   'It would probably make a nice catch'
L2DFA       STR   ''
L2DFB       DW    $0001
            DW    $0028
            DW    $001E
            DW    $0021
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L2E13
            DA    L2E14
            DA    L2E15
L2E13       STR   ''
L2E14       STR   ''
L2E15       STR   ''
L2E16       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $00A2
            DW    $002B
            DW    $00BC
            DW    $0046
            DA    L2E2E
            DA    L2E2F
            DA    L2E56
L2E2E       STR   ''
L2E2F       STR   'It seems to be able to be moved easily'
L2E56       STR   ''
L2E57       DW    $0002
            DW    $0024
            DW    $001F
            DW    $0000
            DW    $0000
            DW    $0003
            DW    $0004
            DW    $001B
            DW    $001B
            DA    L2E7D
            DA    L2E9A
            DA    L2EB0
            DW    $00C8
            DW    $0003
            DW    $00E9
            DW    $0015
            DA    L2EC2
            DA    L2ED3
            DA    L2EDC
L2E7D       STR   'Cannot tear off this camera!'
L2E9A       STR   'A surveillance camera'
L2EB0       STR   'To mist the lens?'
L2EC2       STR   'Ouch! It is hot!'
L2ED3       STR   'Dazzling'
L2EDC       STR   ''
L2EDD       DW    $0003
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0024
            DW    $0046
            DW    $003D
            DW    $0070
            DW    $0051
            DA    L2F11
            DA    L2F12
            DA    L2F28
            DW    $0002
            DW    $0042
            DW    $001B
            DW    $0069
            DA    L2F29
            DA    L2F67
            DA    L2F68
            DW    $00B0
            DW    $0018
            DW    $00DA
            DW    $003A
            DA    L2F69
            DA    L2F83
            DA    L2FB6
L2F11       STR   ''
L2F12       STR   'Some embers still hot'
L2F28       STR   ''
L2F29       STR   'Some dressers must not contain anything. It would not be fun!'
L2F67       STR   ''
L2F68       STR   ''
L2F69       STR   'No time to make pancakes!'
L2F83       STR   'Stoves (you really have to tell him everything...)'
L2FB6       STR   ''
L2FB7       DW    $0003
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0024
            DW    $0046
            DW    $003D
            DW    $0070
            DW    $0051
            DA    L2FEB
            DA    L2FEC
            DA    L3024
            DW    $0002
            DW    $0042
            DW    $001B
            DW    $0069
            DA    L3025
            DA    L3063
            DA    L3064
            DW    $00B0
            DW    $0018
            DW    $00DA
            DW    $003A
            DA    L3065
            DA    L307F
            DA    L30B2
L2FEB       STR   ''
L2FEC       STR   'The fire gives off smoke which escapes through the flue'
L3024       STR   ''
L3025       STR   'Some dressers must not contain anything. It would not be fun!'
L3063       STR   ''
L3064       STR   ''
L3065       STR   'No time to make pancakes!'
L307F       STR   'Stoves (you really have to tell him everything...)'
L30B2       STR   ''
L30B3       DW    $0002
            DW    $0000
            DW    $0021
            DW    $0022
            DW    $0027
            DW    $004A
            DW    $000C
            DW    $0088
            DW    $005E
            DA    L30D9
            DA    L30DA
            DA    L30EC
            DW    $00D4
            DW    $0002
            DW    $00EF
            DW    $005D
            DA    L30FD
            DA    L3113
            DA    L314D
L30D9       STR   ''
L30DA       STR   'Shall we open it?'
L30EC       STR   "RSomeone there?S"
L30FD       STR   'Too heavy to be moved'
L3113       STR   "RFernand loves GeorgetteS is engraved with a pocket knife"
L314D       STR   ''
L314E       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L3166
            DA    L3167
            DA    L3168
L3166       STR   ''
L3167       STR   ''
L3168       STR   ''
L3169       DW    $0005
            DW    $0000
            DW    $0000
            DW    $0024
            DW    $0000
            DW    $0092
            DW    $0026
            DW    $00A8
            DW    $002D
            DA    L31B9
            DA    L31BA
            DA    L31DE
            DW    $0092
            DW    $0037
            DW    $00A7
            DW    $003E
            DA    L31DF
            DA    L31E0
            DA    L320D
            DW    $00AC
            DW    $0027
            DW    $00BB
            DW    $003A
            DA    L320E
            DA    L320F
            DA    L3229
            DW    $00DE
            DW    $0028
            DW    $00EC
            DW    $003B
            DA    L322A
            DA    L3256
            DA    L326D
            DW    $00F2
            DW    $002D
            DW    $0110
            DW    $0055
            DA    L3283
            DA    L329A
            DA    L32BE
L31B9       STR   ''
L31BA       STR   'What if I tell you it iss a drawer?'
L31DE       STR   ''
L31DF       STR   ''
L31E0       STR   'However, it is not complicated to open it...'
L320D       STR   ''
L320E       STR   ''
L320F       STR   'We could drink it well...'
L3229       STR   ''
L322A       STR   'It is the fetish that must be brought back!'
L3256       STR   'Maybe a predecessor...'
L326D       STR   'Not very talkative...'
L3283       STR   'Better not to touch it'
L329A       STR   'Barely more complex than an Atari..'
L32BE       STR   ''
L32BF       DW    $0002
            DW    $0024
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $00CB
            DW    $0004
            DW    $00F7
            DW    $005E
            DA    L32E5
            DA    L3306
            DA    L3315
            DW    $00EA
            DW    $0034
            DW    $00F1
            DW    $003C
            DA    L3316
            DA    L3317
            DA    L337A
L32E5       STR   'Nothing to do, it remains closed'
L3306       STR   'We open it up?'
L3315       STR   ''
L3316       STR   ''
L3317       STR   'Bill sees through the keyhole dozens of people bustling around the fetish plugged into electrodes!'
L337A       STR   ''
L337B       DW    $0002
            DW    $0000
            DW    $001F
            DW    $0000
            DW    $0000
            DW    $0015
            DW    $0003
            DW    $0062
            DW    $002F
            DA    L33A1
            DA    L33A2
            DA    L33C4
            DW    $004C
            DW    $004B
            DW    $009A
            DW    $005C
            DA    L33CF
            DA    L33D0
            DA    L33D1
L33A1       STR   ''
L33A2       STR   'It seems to lose interest in Bill'
L33C4       STR   'Chip chip?'
L33CF       STR   ''
L33D0       STR   ''
L33D1       STR   ''
L33D2       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L33EA
            DA    L33EB
            DA    L33EC
L33EA       STR   ''
L33EB       STR   ''
L33EC       STR   ''
L33ED       DW    $0004
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0009
            DW    $000F
            DW    $0034
            DW    $0043
            DA    L342F
            DA    L345B
            DA    L3477
            DW    $0040
            DW    $0019
            DW    $006B
            DW    $004C
            DA    L3493
            DA    L3494
            DA    L34AE
            DW    $00A7
            DW    $0025
            DW    $00D8
            DW    $0042
            DA    L34CE
            DA    L34CF
            DA    L34D0
            DW    $00E3
            DW    $000B
            DW    $0110
            DW    $006B
            DA    L350C
            DA    L350D
            DA    L350E
L342F       STR   'Bill should not attempt hand-to-hand combat'
L345B       STR   'He looks very aggressive...'
L3477       STR   "RSay your prayers, rascal!S"
L3493       STR   ''
L3494       STR   'If you want my opinion...'
L34AE       STR   "RYou are living your last hourS"
L34CE       STR   ''
L34CF       STR   ''
L34D0       STR   "RThe Professor instructed us to come and give you flowers!S"
L350C       STR   ''
L350D       STR   ''
L350E       STR   "RHurk Hurk!S"
L351B       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L3533
            DA    L3534
            DA    L3535
L3533       STR   ''
L3534       STR   ''
L3535       STR   ''
L3536       DW    $0003
            DW    $002D
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0015
            DW    $0008
            DW    $0081
            DW    $006B
            DA    L356A
            DA    L356B
            DA    L3589
            DW    $0057
            DW    $0021
            DW    $0081
            DW    $006B
            DA    L3598
            DA    L3599
            DA    L35C0
            DW    $0085
            DW    $001D
            DW    $00D5
            DW    $005C
            DA    L361A
            DA    L361B
            DA    L361C
L356A       STR   ''
L356B       STR   'That guy is completely bugged'
L3589       STR   "RDo not push!S"
L3598       STR   ''
L3599       STR   'The SOS Adventurers team! It was time!'
L35C0       STR   "RGo north if you want to follow us to the rest of the adventure and meet the Professeur!S"
L361A       STR   ''
L361B       STR   ''
L361C       STR   "RWe are the members of SOS Adventurers. We are here to help keep the game going!S"
L366E       DW    $0003
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0021
            DW    $0008
            DW    $0058
            DW    $0068
            DA    L36A2
            DA    L36BF
            DA    L36DF
            DW    $00C7
            DW    $0001
            DW    $00D7
            DW    $0013
            DA    L36FF
            DA    L3700
            DA    L3722
            DW    $0080
            DW    $003D
            DW    $00B1
            DW    $006B
            DA    L3723
            DA    L374D
            DA    L376F
L36A2       STR   'He does very well on his own'
L36BF       STR   'What the hell is he doing here?'
L36DF       STR   "RIt is not Leader Board here!!S"
L36FF       STR   ''
L3700       STR   'The flag indicating the golf hole'
L3722       STR   ''
L3723       STR   "RPass me the Iron 5 while you are at it!S"
L374D       STR   "RNot very Mediterranean all thatS"
L376F       STR   "RPut put putS"
L377D       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L3795
            DA    L3796
            DA    L3797
L3795       STR   ''
L3796       STR   ''
L3797       STR   ''
L3798       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L37B0
            DA    L37B1
            DA    L37B2
L37B0       STR   ''
L37B1       STR   ''
L37B2       STR   ''
L37B3       DW    $0005
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0060
            DW    $003A
            DW    $0073
            DW    $0047
            DA    L3803
            DA    L3804
            DA    L382E
            DW    $00EB
            DW    $0005
            DW    $010F
            DW    $006D
            DA    L382F
            DA    L3830
            DA    L3864
            DW    $0001
            DW    $0015
            DW    $0053
            DW    $005B
            DA    L38DE
            DA    L38DF
            DA    L38EA
            DW    $00A2
            DW    $0001
            DW    $00CB
            DW    $0062
            DA    L38EB
            DA    L38EC
            DA    L390A
            DW    $0091
            DW    $0019
            DW    $009D
            DW    $0022
            DA    L3915
            DA    L393A
            DA    L394E
L3803       STR   ''
L3804       STR   'Bill has already managed to free his hand'
L382E       STR   ''
L382F       STR   ''
L3830       STR   'The Professor visibly uses the energy of the fetish'
L3864       STR   "RYou are lost, Palmer!! This fetish contains an unkonwn material which will allow me to become the master of the world!!S"
L38DE       STR   ''
L38DF       STR   'Hurry up!!'
L38EA       STR   ''
L38EB       STR   ''
L38EC       STR   'A lieutenant of the Professor'
L390A       STR   "RShut up!S"
L3915       STR   'Cannot reach it while being tied up!'
L393A       STR   'The electric switch'
L394E       STR   ''
L394F       DW    $0003
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0091
            DW    $0019
            DW    $009D
            DW    $0022
            DA    L3983
            DA    L3984
            DA    L3998
            DW    $00EB
            DW    $0005
            DW    $010F
            DW    $006D
            DA    L3999
            DA    L399A
            DA    L39B7
            DW    $00A2
            DW    $0001
            DW    $00CB
            DW    $0062
            DA    L39E3
            DA    L39E4
            DA    L3A08
L3983       STR   ''
L3984       STR   'The electric switch'
L3998       STR   ''
L3999       STR   ''
L399A       STR   'Luckily je did not spot Bill'
L39B7       STR   "REvil will finally triumph! Gniark gniark!S"
L39E3       STR   ''
L39E4       STR   'Luckily the bad guys do not care...'
L3A08       STR   ''
L3A09       DW    $0003
            DW    $0000
            DW    $0000
            DW    $0033
            DW    $0000
            DW    $0085
            DW    $0029
            DW    $009C
            DW    $0034
            DA    L3A3D
            DA    L3A3E
            DA    L3A54
            DW    $0032
            DW    $002C
            DW    $004C
            DW    $0037
            DA    L3A55
            DA    L3A56
            DA    L3A6F
            DW    $00E0
            DW    $003B
            DW    $00F5
            DW    $0045
            DA    L3A70
            DA    L3A71
            DA    L3A7E
L3A3D       STR   ''
L3A3E       STR   'Bill'27's beautiful eyes'
L3A54       STR   ''
L3A55       STR   ''
L3A56       STR   'The Professor'27's henchman'
L3A6F       STR   ''
L3A70       STR   ''
L3A71       STR   'Professor X.'
L3A7E       STR   ''
L3A7F       DW    $0009
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0038
            DW    $003D
            DW    $003D
            DW    $003F
            DA    L3B07
            DA    L3B17
            DA    L3B32
            DW    $003C
            DW    $003D
            DW    $0048
            DW    $003F
            DA    L3B33
            DA    L3B34
            DA    L3B51
            DW    $0040
            DW    $0041
            DW    $0046
            DW    $0043
            DA    L3B52
            DA    L3B84
            DA    L3BA0
            DW    $004A
            DW    $0040
            DW    $004F
            DW    $0043
            DA    L3BA1
            DA    L3BA2
            DA    L3BAD
            DW    $007F
            DW    $002C
            DW    $008F
            DW    $003B
            DA    L3BAE
            DA    L3BAF
            DA    L3BBC
            DW    $0040
            DW    $004A
            DW    $0057
            DW    $005D
            DA    L3BDF
            DA    L3BE0
            DA    L3C11
            DW    $001B
            DW    $0002
            DW    $0072
            DW    $0024
            DA    L3C12
            DA    L3C13
            DA    L3C58
            DW    $0055
            DW    $0038
            DW    $0078
            DW    $0041
            DA    L3C59
            DA    L3C7A
            DA    L3C90
            DW    $0005
            DW    $004A
            DW    $002C
            DW    $0066
            DA    L3C91
            DA    L3C92
            DA    L3CAB
L3B07       STR   'Nothing happens'
L3B17       STR   "RCoffee, (out of service)S"
L3B32       STR   ''
L3B33       STR   ''
L3B34       STR   "RImmediate self-destructionS"
L3B51       STR   ''
L3B52       STR   "RSelf-destruction engagedS says a synthetic voice"
L3B84       STR   "RDeferred self-destructionS"
L3BA0       STR   ''
L3BA1       STR   ''
L3BA2       STR   "REjectingS"
L3BAD       STR   ''
L3BAE       STR   ''
L3BAF       STR   'A microphone'
L3BBC       STR   "ROne, two, one, two, three, four!S"
L3BDF       STR   ''
L3BE0       STR   'Just enough to store your small personal effects'
L3C11       STR   ''
L3C12       STR   ''
L3C13       STR   'And says that Professor X. wants to become the master of all this...'
L3C58       STR   ''
L3C59       STR   'Pfff... Does one know GFA BASIC?'
L3C7A       STR   'Not even from RAtariS'
L3C90       STR   ''
L3C91       STR   ''
L3C92       STR   'The next Atari streamer?'
L3CAB       STR   ''
L3CAC       DW    $000A
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0038
            DW    $003D
            DW    $003D
            DW    $003F
            DA    L3D42
            DA    L3D52
            DA    L3D6D
            DW    $003C
            DW    $003D
            DW    $0048
            DW    $003F
            DA    L3D6E
            DA    L3D6F
            DA    L3D8C
            DW    $0040
            DW    $0041
            DW    $0046
            DW    $0043
            DA    L3D8D
            DA    L3DBF
            DA    L3DDB
            DW    $004A
            DW    $0040
            DW    $004F
            DW    $0043
            DA    L3DDC
            DA    L3DDD
            DA    L3DE8
            DW    $007F
            DW    $002C
            DW    $008F
            DW    $003B
            DA    L3DE9
            DA    L3DEA
            DA    L3DF7
            DW    $0040
            DW    $004A
            DW    $0057
            DW    $005D
            DA    L3E1A
            DA    L3E1B
            DA    L3E4C
            DW    $001B
            DW    $0002
            DW    $0072
            DW    $0024
            DA    L3E4D
            DA    L3E4E
            DA    L3E93
            DW    $00C9
            DW    $0005
            DW    $00F7
            DW    $0057
            DA    L3E94
            DA    L3E95
            DA    L3EB7
            DW    $0055
            DW    $0038
            DW    $0078
            DW    $0041
            DA    L3EEA
            DA    L3F0B
            DA    L3F21
            DW    $0005
            DW    $004A
            DW    $002C
            DW    $0066
            DA    L3F22
            DA    L3F23
            DA    L3F3C
L3D42       STR   'Nothing happens'
L3D52       STR   "RCoffee, (out of service)S"
L3D6D       STR   ''
L3D6E       STR   ''
L3D6F       STR   "RImmediate self-destructionS"
L3D8C       STR   ''
L3D8D       STR   "RSelf-destruction engagedS says a synthetic voice"
L3DBF       STR   "RDeferred self-destructionS"
L3DDB       STR   ''
L3DDC       STR   ''
L3DDD       STR   "REjectingS"
L3DE8       STR   ''
L3DE9       STR   ''
L3DEA       STR   'A microphone'
L3DF7       STR   "ROne, two, one, two, three, four!S"
L3E1A       STR   ''
L3E1B       STR   'Just enough to store your small personal effects'
L3E4C       STR   ''
L3E4D       STR   ''
L3E4E       STR   'And says that Professor X. wants to become the master of all this...'
L3E93       STR   ''
L3E94       STR   ''
L3E95       STR   'Quick! Bill has to do something!!'
L3EB7       STR   "RYou will not espace me this time around, Palmer!S"
L3EEA       STR   'Pfff... Does one know GFA BASIC?'
L3F0B       STR   'Not even from RAtariS'
L3F21       STR   ''
L3F22       STR   ''
L3F23       STR   'The next Atari streamer?'
L3F3C       STR   ''
L3F3D       DW    $000A
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0038
            DW    $003D
            DW    $003D
            DW    $003F
            DA    L3FD3
            DA    L3FE3
            DA    L3FFE
            DW    $003C
            DW    $003D
            DW    $0048
            DW    $003F
            DA    L3FFF
            DA    L4000
            DA    L401D
            DW    $0040
            DW    $0041
            DW    $0046
            DW    $0043
            DA    L401E
            DA    L4050
            DA    L406C
            DW    $004A
            DW    $0040
            DW    $004F
            DW    $0043
            DA    L406D
            DA    L406E
            DA    L4079
            DW    $007F
            DW    $002C
            DW    $008F
            DW    $003B
            DA    L407A
            DA    L407B
            DA    L4088
            DW    $0040
            DW    $004A
            DW    $0057
            DW    $005D
            DA    L40AB
            DA    L40AC
            DA    L40DD
            DW    $001B
            DW    $0002
            DW    $0072
            DW    $0024
            DA    L40DE
            DA    L40DF
            DA    L4124
            DW    $00C9
            DW    $0005
            DW    $00F7
            DW    $0057
            DA    L4125
            DA    L4126
            DA    L414B
            DW    $0055
            DW    $0038
            DW    $0078
            DW    $0041
            DA    L4177
            DA    L4198
            DA    L41AE
            DW    $0005
            DW    $004A
            DW    $002C
            DW    $0066
            DA    L41AF
            DA    L41B0
            DA    L41C9
L3FD3       STR   'Nothing happens'
L3FE3       STR   "RCoffee, (out of service)S"
L3FFE       STR   ''
L3FFF       STR   ''
L4000       STR   "RImmediate self-destructionS"
L401D       STR   ''
L401E       STR   "RSelf-destruction engagedS says a synthetic voice"
L4050       STR   "RDeferred self-destructionS"
L406C       STR   ''
L406D       STR   ''
L406E       STR   "REjectingS"
L4079       STR   ''
L407A       STR   ''
L407B       STR   'A microphone'
L4088       STR   "ROne, two, one, two, three, four!S"
L40AB       STR   ''
L40AC       STR   'Just enough to store your small personal effects'
L40DD       STR   ''
L40DE       STR   ''
L40DF       STR   'And says that Professor X. wants to become the master of all this...'
L4124       STR   ''
L4125       STR   ''
L4126       STR   'Bill has the situation well in hand!'
L414B       STR   "RYou will not get away with this, Palmer!!S"
L4177       STR   'Pfff... Does one know GFA BASIC?'
L4198       STR   'Not even from RAtariS'
L41AE       STR   ''
L41AF       STR   ''
L41B0       STR   'The next Atari streamer?'
L41C9       STR   ''
L41CA       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L41E2
            DA    L41E3
            DA    L41E4
L41E2       STR   ''
L41E3       STR   ''
L41E4       STR   ''
L41E5       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L41FD
            DA    L41FE
            DA    L41FF
L41FD       STR   ''
L41FE       STR   ''
L41FF       STR   ''
L4200       DW    $0001
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L4218
            DA    L4219
            DA    L421A
L4218       STR   ''
L4219       STR   ''
L421A       STR   ''
L421B       DA    L4231
            DA    L4255
            DA    L4270
            DA    L428E
            DA    L42A5
            DA    L42C6
            DA    L42E1
            DA    L4322
            DA    L4363
            DA    L43B3
            DA    L4411
L4231       STR   0D'BILL PALMER. Copyright 1987. ARCAN'
L4255       STR   0D'A game by FRANCOIS COULON'
L4270       STR   0D'Graphics by DOMINIQUE PETTER'
L428E       STR   0D'Music by Alain Krausz'
L42A5       STR   0D'Coproduced by Emmanuel Lasmezas'
L42C6       STR   0D'Used programs and tools..'
L42E1       STR   0D'GFA Basic and GFA Compiler (GfA Systemtechnik/Franck Ostrowski)'
L4322       STR   0D'Degas Elite (Batteries Included/Tom Hudson), CRP graphic tablet'
L4363       STR   'Yamaha and Akai musical hardware, ST Replay digitizer (2 bits System/A. Racine)'
L43B3       STR   'Apple IIgs version written in 2021'0D'by Brutal Deluxe Software'0D'Antoine Vignau & Olivier Zardini'
L4411       STR   ' '
L4413       STR   ''
L4414       DA    L4486
            DA    L4487
            DA    L450C
            DA    L4587
            DA    L4638
            DA    L464F
            DA    L46E9
            DA    L47E5
            DA    L47E6
            DA    L47E7
            DA    L483D
            DA    L4893
            DA    L4894
            DA    L4895
            DA    L48F5
            DA    L48F6
            DA    L4A5B
            DA    L4AB6
            DA    L4AB7
            DA    L4AB8
            DA    L4B73
            DA    L4C1F
            DA    L4C20
            DA    L4C21
            DA    L4C82
            DA    L4C83
            DA    L4D4D
            DA    L4D86
            DA    L4D9D
            DA    L4DD8
            DA    L4E27
            DA    L4E8B
            DA    L4E8C
            DA    L4F62
            DA    L5013
            DA    L50C0
            DA    L50C1
            DA    L5174
            DA    L5175
            DA    L5271
            DA    L52C5
            DA    L5378
            DA    L5416
            DA    L550F
            DA    L5510
            DA    L5511
            DA    L55BD
            DA    L55BE
            DA    L55BF
            DA    L5680
            DA    L573E
            DA    L579A
            DA    L588A
            DA    L5A1E
            DA    L5AD2
            DA    L5C45
            DA    L5C46
L4486       RTS

L4487       LDA   L0AB3
            CMP   #$0019
            BNE   L44B9
            LDA   L0AB9
            CMP   #$0001
            BNE   L44A0
            LDX   #$000A
            LDA   #L44BA
            JMP   L059F

L44A0       CMP   #$0002
            BNE   L44AE
            LDX   #$0010
            LDA   #L44E1
            JMP   L059F

L44AE       CMP   #$0004
            BNE   L44B9
            LDA   #$0002
            STA   L0AAF
L44B9       RTS

L44BA       STR   'Bill collects a not very fresh lettuce'
L44E1       STR   'Here, the newspaper of the day has arrived'
L450C       LDA   L0AB3
            CMP   #$0019
            BNE   L4533
            LDA   L0AB9
            CMP   #$0003
            BNE   L4525
            LDX   #$000E
            LDA   #L4534
            JMP   L059F

L4525       CMP   #$0002
            BNE   L4533
            LDX   #$0003
            LDA   #L454F
            JMP   L059F
L4533       RTS

L4534       STR   'Bill notices an old manual'
L454F       STR   'By crikey! The credit card Bill thought he lost forever'
L4587       LDA   L0AB3
            CMP   #$0019
            BNE   L45D2
            LDA   L0AB9
            CMP   #$0001
            BNE   L45C4
            LDX   #$0006
            LDA   #L4413
            JSR   L059F
            LDX   #$000B
            LDA   #L4413
            JSR   L059F
            LDX   #$0009
            LDA   #L4413
            JSR   L059F
            LDX   #$000C
            LDA   #L4413
            JSR   L059F
            LDX   #$000D
            LDA   #L4413
            JMP   L059F

L45C4       CMP   #$0002
            BNE   L45D2
            LDX   #$0004
            LDA   #L45D3
            JMP   L059F
L45D2       RTS

L45D3       STR   'Damn! The passport that Bill in his heroic disorganization had lost after a stay in South Africa ...'
L4638       LDA   L0AB3
            CMP   #$0019
            BNE   L464E
            LDA   L0AB9
            CMP   #$0003
            BNE   L464E
            LDA   #$0005
            STA   L0AAF
L464E       RTS

L464F       LDA   L0AB3
            CMP   #$001A
            BNE   L4668
            LDA   L0AB9
            CMP   #$0001
            BNE   L4668
            LDX   #$000F
            LDA   #L4669
            JMP   L059F
L4668       RTS

L4669       STR   'Gently exploring the recesses of the vehicle'27's engine, Bill notices a curious device visibly placed there for hostile purposes.'
L46E9       LDA   L0AB3
            CMP   #$0019
            BNE   L4728
            LDA   L0AB9
            CMP   #$0001
            BNE   L471A
            LDX   #$000F
            LDA   L129C+$10,X
            AND   #$00FF
            CMP   #$0062
            BNE   L470D
            LDA   #L4729
            JMP   L0A35

L470D       LDA   #L47B1
            JSR   L0945
            LDA   #$0007
            STA   L0AAF
            RTS

L471A       CMP   #$0003
            BNE   L4728
            LDX   #$0008
            LDA   #L47C3
            JMP   L059F
L4728       RTS

L4729       STR   'Baaaaooooouuuuummmmm!!!!!! Without Bill having had time to react, the car explodes into a thousand pieces. Fail so close to the goal...'
L47B1       STR   'The car starts...'
L47C3       STR   'A brick was lying around there...'
L47E5       RTS
L47E6       RTS

L47E7       LDA   L0AB3
            CMP   #$0019
            BNE   L480B
            LDA   L0AB5
            CMP   #$0003
            BNE   L4800
            LDX   #$0002
            LDA   #L480C
            JMP   L059F

L4800       CMP   #$0002
            BNE   L480B
            LDA   #$000A
            STA   L0AAF
L480B       RTS

L480C       STR   'The hostess gives Bill his ticket to N'27'Gwanal'8E'l'8E
L483D       LDA   L0AB3
            CMP   #$0018
            BNE   L484B
            LDA   #L4865
            JMP   L0945

L484B       CMP   #$0019
            BNE   L4864
            LDA   L0AB5
            CMP   #$0004
            BNE   L4864
            LDA   #$000B
            STA   L0AAF
            LDA   #L4875
            JMP   L0945
L4864       RTS

L4865       STR   'We do not pass!'
L4875       STR   'It is in order, you can pass!'
L4893       RTS
L4894       RTS

L4895       LDA   L0AB3
            CMP   #$0019
            BNE   L48AB
            LDA   L0AB9
            CMP   #$0003
            BNE   L48AB
            LDA   #L48AC
            JMP   L0A35
L48AB       RTS

L48AC       STR   'Stones can hide a lot of animals. And snakes are often very dangerous...'
L48F5       RTS

L48F6       LDA   L0AB3
            CMP   #$0019
            BNE   L494E
            LDA   L0AB5
            CMP   #$0003
            BNE   L490C
            LDA   #L494F
            JMP   L0945

L490C       CMP   #$000E
            BNE   L4926
            LDX   #$000E
            LDA   #L497B
            JSR   L05BC
            SEP   #$20
            LDX   #$0003
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
L4926       LDA   L0AB5
            CMP   #$000A
            BNE   L494E
            LDX   #$0003
            LDA   L127E+$1D,X
            AND   #$00FF
            BEQ   L4948
            LDA   #$0011
            STA   L0AAF
            LDX   #$000A
            LDA   #L49D9
            JMP   L05BC

L4948       LDA   #L4A2A
            JMP   L0945
L494E       RTS

L494F       STR   'What is that? You don'27't pay it like that...'
L497B       STR   'You'27're a real adventurer then !! I keep the book there for you and you go with the dromedary!'
L49D9       STR   'The dromedary swallows the lettuce and bends down so that Bill goes on his back.'
L4A2A       STR   'The man refuses to let Bill feed the dromaderies'
L4A5B       SEP   #$20
            LDX   #$0008
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0004
            BNE   L4A76
            LDA   #L4A77
            JMP   L0A35
L4A76       RTS

L4A77       STR   'Without safe and fast transportation, Bill soon dies exhausted'
L4AB6       RTS
L4AB7       RTS

L4AB8       LDA   L0AB3
            CMP   #$0019
            BNE   L4AD9
            LDA   L0AB5
            CMP   #$0003
            BNE   L4ACE
            LDA   #L4ADA
            JMP   L0945

L4ACE       CMP   #$0006
            BNE   L4AD9
            LDA   #L4B2F
            JMP   L0945
L4AD9       RTS

L4ADA       STR   'Credit cards are not accepted. Bill'27's gonna have to take the train without a ticket.'
L4B2F       STR   'We do not play proudly in my station. The man goes back to sleep...'
L4B73       LDA   L0AB3
            CMP   #$0019
            BNE   L4BD1
            LDA   L0AB9
            CMP   #$0004
            BNE   L4B95
            LDA   #L4BD2
            JSR   L0945
            SEP   #$20
            LDX   #$0001
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
L4B95       LDA   L0AB9
            CMP   #$0005
            BNE   L4BB6
            LDX   #$0001
            LDA   L127E+$1D,X
            AND   #$00FF
            BEQ   L4BB0
            LDA   #$0016
            STA   L0AAF
            BRA   L4BB6
L4BB0       LDA   #$0017
            STA   L0AAF
L4BB6       SEP   #$20
            LDX   #$0002
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0008
            BCC   L4BD1
            LDA   #L4BE7
            JMP   L0A35
L4BD1       RTS

L4BD2       STR   'The train is stopped'
L4BE7       STR   'The controller comes and stops Bill, who has no ticket.'
L4C1F       RTS
L4C20       RTS

L4C21       LDA   L0AB3
            CMP   #$0019
            BNE   L4C37
            LDA   L0AB9
            CMP   #$0001
            BNE   L4C37
            LDA   #L4C38
            JMP   L0A35
L4C37       RTS

L4C38       STR   'The stone hid a scorpion. And scorpions hate to be disturbed... Bad plan.'
L4C82       RTS

L4C83       SEP   #$20
            LDX   #$0005
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0006
            BCC   L4C9E
            LDA   #L4CC7
            JMP   L0A35

L4C9E       LDA   L0AB3
            CMP   #$0019
            BNE   L4CC6
            LDA   L0AB5
            CMP   #$000B
            BNE   L4CC6
            LDA   #L4D02
            JSR   L0945
            SEP   #$20
            LDX   #$0004
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
            LDA   #$001A
            STA   L0AAF
L4CC6       RTS

L4CC7       STR   'Bill is rolled, squashed and atomized by the raving mammal'
L4D02       STR   'Frightened by the machine, the animal takes its legs to its neck and flees'
L4D4D       LDA   L0AB3
            CMP   #$0019
            BNE   L4D66
            LDA   L0AB5
            CMP   #$0006
            BNE   L4D66
            LDX   #$0005
            LDA   #L4D67
            JMP   L059F
L4D66       RTS

L4D67       STR   'Bill manages to cut some twigs'
L4D86       LDA   L0AB3
            CMP   #$0019
            BNE   L4D9C
            LDA   L0AB9
            CMP   #$0001
            BNE   L4D9C
            LDA   #$000A
            STA   L0AAF
L4D9C       RTS

L4D9D       LDA   L0AB3
            CMP   #$0019
            BNE   L4DB9
            LDA   L0AB9
            CMP   #$0001
            BNE   L4DB9
            LDA   #L4DBA
            JSR   L0945
            LDA   #$001D
            STA   L0AAF
L4DB9       RTS

L4DBA       STR   'Bill starts to climb the hill'
L4DD8       SEP   #$20
            LDX   #$0006
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0004
            BCC   L4DF3
            LDA   #L4DF4
            JMP   L0A35
L4DF3       RTS

L4DF4       STR   'The dastardly fellow strangles Bill with his knife'
L4E27       LDA   L0AB3
            CMP   #$0019
            BNE   L4E3D
            LDA   L0AB9
            CMP   #$0002
            BNE   L4E3D
            LDA   #L4E3E
            JMP   L0A35
L4E3D       RTS
L4E3E       STR   'Bad luck, the tuft of grass breaks off the rock and Bill falls into the void'
L4E8B       RTS

L4E8C       SEP   #$20
            LDX   #$0006
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0008
            BCC   L4EA7
            LDA   #L4ED0
            JMP   L0A35

L4EA7       LDA   L0AB3
            CMP   #$0019
            BNE   L4ECF
            LDA   L0AB9
            CMP   #$0001
            BNE   L4ECF
            LDA   #L4F0C
            JSR   L0945
            SEP   #$20
            LDX   #$0007
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
            LDA   #$001F
            STA   L0AAF
L4ECF       RTS

L4ED0       STR   'The Professor'27's henchman catches up with Bill. It'27's over...'
L4F0C       STR   'Bill knocks the stone back into the void. She knocks out the villain who followed him'
L4F62       LDX   #$000A
            LDA   L127E+$1D,X
            AND   #$00FF
            BNE   L4F88
            SEP   #$20
            LDX   #$000B
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0008
            BCC   L4F88
            LDA   #L4FAB
            JMP   L0A35

L4F88       LDA   L0AB3
            CMP   #$0019
            BNE   L4FAA
            LDA   L0AB5
            CMP   #$0001
            BNE   L4FAA
            LDA   #L4FDB
            JSR   L0945
            SEP   #$20
            LDX   #$000A
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
L4FAA       RTS

L4FAB       STR   'Suddenly a ray pulverizes Bill (gniark gniark!)'
L4FDB       STR   'Bill shows the photo to the camera which seems to react'
L5013       LDA   L0AB3
            CMP   #$0019
            BNE   L505E
            LDA   L0AB5
            CMP   #$0008
            BNE   L5053
            LDX   #$0005
            LDA   L129C+$10,X
            AND   #$00FF
            CMP   #$0063
            BNE   L504D
            LDX   #$0005
            LDA   #L5084
            JSR   L05BC
            SEP   #$20
            LDX   #$0009
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
            LDA   #$0023
            STA   L0AAF
            RTS

L504D       LDA   #L5084
            JMP   L0945

L5053       CMP   #$0005
            BNE   L505E
            LDA   #L50A9
            JMP   L0945
L505E       RTS

            STR   'Bill lights a fire with the twigs...'
L5084       STR   'There is nothing to burn in the room'
L50A9       STR   'And why not burn them?'
L50C0       RTS

L50C1       LDA   L0AB3
            CMP   #$0019
            BNE   L50F1
            LDA   L0AB9
            CMP   #$0001
            BNE   L50F1
            LDX   #$000C
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0004
            BCS   L50E5
            LDA   #L50F2
            JMP   L0A35

L50E5       LDA   #$0026
            STA   L0AAF
            LDA   #L50F2
            JMP   L0945
L50F1       RTS

L50F2       STR   'Before Bill can enter Professor X'27's lab, Professor X grabs a submachine gun and turns it into a strainer.'
            STR   'Phew... The door opens!'
L5174       RTS

L5175       LDA   L0AB3
            CMP   #$0019
            BNE   L51A7
            LDA   L0AB9
            CMP   #$0001
            BNE   L518E
            LDX   #$0012
            LDA   #L51BE
            JMP   L059F

L518E       CMP   #$0002
            BNE   L519C
            LDX   #$0011
            LDA   #L51D2
            JMP   L059F

L519C       CMP   #$0003
            BNE   L51A7
            LDA   #L51E8
            JMP   L0A35

L51A7       LDA   L0AB3
            CMP   #$001B
            BNE   L51BD
            LDA   L0AB9
            CMP   #$0003
            BNE   L51BD
            LDA   #L5239
            JMP   L0A35
L51BD       RTS

L51BE       STR   'Bill find a call...'
L51D2       STR   'Wow! A submachine gun'
L51E8       STR   'Bill should have known that it is better to handle toxic products with gloves...'
L5239       STR   'Damn it! It was poison! Bill chokes and dies in minutes'
L5271       LDA   L0AB3
            CMP   #$001A
            BNE   L529C
            LDA   L0AB9
            CMP   #$0002
            BNE   L529C
            SEP   #$20
            LDX   #$000C
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0004
            BCC   L529C
            LDA   #L529D
            JMP   L0945
L529C       RTS

L529D       STR   'The Professor stays to inspect his men!'
L52C5       LDA   L0AB3
            CMP   #$001B
            BNE   L52E1
            LDA   L0AB5
            CMP   #$0012
            BNE   L52E1
            LDA   #$0029
            STA   L0AAF
            LDA   #L5309
            JSR   L0945
L52E1       LDA   L0AB3
            CMP   #$001A
            BNE   L5308
            LDA   L0AB9
            CMP   #$0002
            BNE   L5308
            LDX   #$0009
            LDA   L127E+$1D,X
            AND   #$00FF
            BEQ   L5302
            LDA   #L533A
            JMP   L0945

L5302       LDA   #L5352
            JMP   L0945
L5308       RTS

L5309       STR   'Attracted by the call, the bird comes to rest...'
L533A       STR   'Hot smoke rises from it'
L5352       STR   'It looks like the flue of a fireplace'
L5378       LDX   #$0009
            LDA   L127E+$1D,X
            AND   #$00FF
            BNE   L538F
            LDA   #$0028
            STA   L0AAF
            LDA   #L539C
            JMP   L0945

L538F       LDA   #$002A
            STA   L0AAF
            LDA   #L53B7
            JMP   L0945
            RTS

L539C       STR   'The bird leaves immediatly'
L53B7       STR   'The bird clogs the flue of the chimney, immediately the professor'27's men come out suffocated...'
L5416       SEP   #$20
            LDX   #$0011
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0008
            BCC   L5431
            LDA   #L546F
            JMP   L0A35

L5431       LDA   L0AB3
            CMP   #$0019
            BNE   L546E
            LDA   L0AB5
            CMP   #$0011
            BNE   L5463
            LDA   #$002B
            STA   L0AAF
            LDA   #L5488
            JSR   L0945
            JSR   L0970
            LDA   #L54A9
            JSR   L0945
            LDA   #$0003
            JSR   L0E4A
            LDA   #$002C
            STA   L0AAF
            RTS

L5463       CMP   #$0006
            BNE   L546E
            LDA   #L54C8
            JMP   L0A35
L546E       RTS

L546F       STR   'Professor'27's men gut Bill'
L5488       STR   'Bill draws his submachine gun...'
L54A9       STR   'And massacres his attackers...'
L54C8       STR   'Bill engages in the fight with a machete but he falls under the number'
L550F       RTS
L5510       RTS

L5511       LDA   L0AB3
            CMP   #$0019
            BNE   L5553
            LDA   L0AB9
            CMP   #$0002
            BNE   L5553
            LDA   #$002E
            STA   L0AAF
            LDA   #L5554
            JSR   L0945
            JSR   L0970
            LDA   #L5575
            JSR   L0945
            LDA   #$0030
            STA   L0AAF
            LDA   #$0003
            JSR   L0E4A
            LDX   #$0001
L5545       PHX
            LDA   #L4413
            JSR   L05BC
            PLX
            INX
            CPX   #$0014
            BCC   L5545
L5553       RTS

L5554       STR   'Bill pulls the flag. Suddenly...'
L5575       STR   'A trap door opens under his feet. Bill is captured by Professor X'27's men'
L55BD       RTS
L55BE       RTS

L55BF       SEP   #$20
            LDX   #$000D
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0006
            BCC   L55DA
            LDA   #L55F7
            JMP   L0A35

L55DA       LDA   L0AB3
            CMP   #$0019
            BNE   L55F6
            LDA   L0AB9
            CMP   #$0001
            BNE   L55F6
            LDA   #L5640
            JSR   L0945
            LDA   #$0031
            STA   L0AAF
L55F6       RTS

L55F7       STR   'The cannon cuts Bill to pieces. Professor X. becomes master of the world'
L5640       STR   'Bill manages to free himself discreetly and extinguish the fuse'
L5680       LDA   L0AB3
            CMP   #$0019
            BNE   L56AC
            LDA   L0AB9
            CMP   #$0002
            BEQ   L5695
            CMP   #$0003
            BNE   L569B
L5695       LDA   #L56AD
            JMP   L0A35

L569B       CMP   #$0001
            BNE   L56AC
            LDA   #L56FA
            JSR   L0945
            LDA   #$0032
            STA   L0AAF
L56AC       RTS
L56AD       STR   'Bill makes a mistake and is fatally spotted by the Professor'27's lieutenant...'
L56FA       STR   'Bill switches off the light, plunging the entire room into darkness'
L573E       LDA   L0AB3
            CMP   #$0019
            BNE   L5751
            LDA   L0AB9
            BEQ   L5751
            LDA   #L5752
            JMP   L0A35
L5751       RTS

L5752       STR   'Rather than quietly slipping away, Bill saw fit to show his presence...'
L579A       LDA   L0AB3
            CMP   #$0019
            BNE   L57C1
            LDA   L0AB9
            CMP   #$0002
            BNE   L57B0
            LDA   #L5828
            JMP   L0A35

L57B0       CMP   #$0003
            BNE   L57C1
            SEP   #$20
            LDX   #$000E
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
L57C1       LDX   #$000E
            LDA   L127E+$1D,X
            AND   #$00FF
            BEQ   L57E7
            SEP   #$20
            LDX   #$000F
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0006
            BCC   L57E7
            LDA   #L5828
            JMP   L0A35

L57E7       LDA   L0AB3
            CMP   #$0019
            BNE   L5811
            LDA   L0AB9
            CMP   #$0004
            BNE   L5803
            LDA   #L5863
            JSR   L0945
            LDA   #$0036
            STA   L0AAF
L5803       CMP   #$0006
            BNE   L5811
            LDX   #$0013
            LDA   #L5872
            JMP   L059F

L5811       LDA   L0AB3
            CMP   #$001B
            BNE   L5827
            LDA   L0AB9
            CMP   #$0005
            BNE   L5827
            LDA   #$0034
            STA   L0AAF
L5827       RTS

L5828       STR   'The base and everything in it explodes. Too expeditious...'
L5863       STR   'Bill ejects...'
L5872       STR   'This could be useful...'
L588A       LDA   L0AB3
            CMP   #$0019
            BNE   L58A9
            LDA   L0AB5
            CMP   #$0013
            BNE   L58A9
            LDA   #$0035
            STA   L0AAF
            LDX   #$0007
            LDA   #L593C
            JSR   L059F
L58A9       LDX   #$0010
            SEP   #$20
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0004
            BCC   L58C4
            LDA   #L5995
            JMP   L0A35

L58C4       LDA   L0AB3
            CMP   #$0019
            BNE   L58EB
            LDA   L0AB9
            CMP   #$0002
            BNE   L58DA
            LDA   #L59BC
            JMP   L0A35

L58DA       CMP   #$0003
            BNE   L58EB
            SEP   #$20
            LDX   #$000E
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
L58EB       LDX   #$000E
            LDA   L127E+$1D,X
            AND   #$00FF
            BEQ   L5911
            SEP   #$20
            LDX   #$000F
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0006
            BCC   L5911
            LDA   #L59BC
            JMP   L0A35

L5911       LDA   L0AB3
            CMP   #$0019
            BNE   L593B
            LDA   L0AB9
            CMP   #$0004
            BNE   L592D
            LDA   #L59F7
            JSR   L0945
            LDA   #$0036
            STA   L0AAF
L592D       CMP   #$0006
            BNE   L593B
            LDX   #$0013
            LDA   #L5A06
            JMP   L059F
L593B       RTS

L593C       STR   'Bill draws quickly and takes aim at the two men. The Professor must let go of the fetish'
L5995       STR   'Professor'27's henchman coldly kills Bill'
L59BC       STR   'The base and everything in it explodes. Too expeditious...'
L59F7       STR   'Bill ejects...'
L5A06       STR   'This could be useful...'
L5A1E       LDA   L0AB3
            CMP   #$0019
            BNE   L5A45
            LDA   L0AB9
            CMP   #$0002
            BNE   L5A34
            LDA   #L5A88
            JMP   L0A35

L5A34       CMP   #$0003
            BNE   L5A45
            SEP   #$20
            LDX   #$000E
            LDA   #$FF
            STA   L127E+$1D,X
            REP   #$20
L5A45       LDX   #$000E
            LDA   L127E+$1D,X
            AND   #$00FF
            BEQ   L5A6B
            SEP   #$20
            LDX   #$000F
            INC   L127E+$1D,X
            REP   #$20
            LDA   L127E+$1D,X
            AND   #$00FF
            CMP   #$0006
            BCC   L5A6B
            LDA   #L5A88
            JMP   L0A35

L5A6B       LDA   L0AB3
            CMP   #$0019
            BNE   L5A87
            LDA   L0AB9
            CMP   #$0004
            BNE   L5A87
            LDA   #L5AC3
            JSR   L0945
            LDA   #$0036
            STA   L0AAF
L5A87       RTS

L5A88       STR   'The base and everything in it explodes. Too expeditious...'
L5AC3       STR   'Bill ejects...'
L5AD2       LDA   #$0037
            STA   L0AAF
            JSR   L0970
            LDA   #$0003
            JSR   L0E4A
            LDX   #$000E
            LDA   L127E+$1D,X
            AND   #$00FF
            BNE   L5AF2
            LDA   #L5B1C
            JMP   L0A35

L5AF2       LDX   #$0007
            LDA   L129C+$10,X
            AND   #$00FF
            CMP   #$0063
            BEQ   L5B06
            LDA   #L5B74
            JMP   L0A35

L5B06       LDA   #$0038
            STA   L0AAF
            JSR   L0970
            LDA   #$0003
            JSR   L0E4A
            LDA   #L5BC7
            JMP   L0A35
            RTS

L5B1C       STR   'When he falls, Bill is captured again. He can no longer thwart the professor'27's plans...'
L5B74       STR   'Professor X.'27's base is reduced to rubble. Alas, Bill failed to retrieve the Fetish'
L5BC7       STR   'CONGRATULATIONS!! Bill has recovered the fetish and destroyed Professor X'27's base. We can bet that he will take his revenge...'
L5C45       RTS
L5C46       RTS

L5C47       LDA   L6058
            BNE   L5C6B
            _KillAllNotes
            _MSShutDown
            PEA   $0023
            _UnloadOneTool
            _SoundShutDown
L5C6B       RTS

L5C6C       PHA
            _GetIRQEnable
            PLA
            AND   #$0020
            BEQ   L5C7E
            INC   L6058
            RTS

L5C7E       LDA   L0E74
            CLC
            ADC   #$0100
            PHA
            _SoundStartUp
            PEA   $0023
            PEA   $0000
            _LoadOneTool
            BCC   L5CA0
            INC   L6058
            RTS

L5CA0       _MSStartUp
            BCC   L5CAD
            INC   L6058
            RTS

L5CAD       PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $0000
            LDA   L0E72
            PHA
            PEA   $C01C
            PEA   $0000
            PEA   $0000
            _NewHandle
            PHD
            TSC
            TCD
            LDA   [$03]
            STA   L604C
            LDY   #$0002
            LDA   [$03],Y
            STA   L604C+2
            PLD
            PLA
            PLA
            BCC   L5CE6
            INC   L6058
            RTS

L5CE6       PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $0000
            LDA   L0E72
            PHA
            PEA   $C01C
            PEA   $0000
            PEA   $0000
            _NewHandle
            PHD
            TSC
            TCD
            LDA   [$03]
            STA   L6054
            LDY   #$0002
            LDA   [$03],Y
            STA   L6054+2
            PLD
            PLA
            PLA
            BCC   L5D1F
            INC   L6058
            RTS

L5D1F       PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $0000
            LDA   L0E72
            PHA
            PEA   $C01C
            PEA   $0000
            PEA   $0000
            _NewHandle
            PHD
            TSC
            TCD
            LDA   [$03]
            STA   L6050
            LDY   #$0002
            LDA   [$03],Y
            STA   L6050+2
            PLD
            PLA
            PLA
            BCC   L5D58
            INC   L6058
            RTS

L5D58       LDA   #L6028
            STA   L5FCF
            JSL   GSOS
            DW    $2010            ; Open
            ADRL  L5FCB
            STA   L5FC9
            LDA   L5FCD
            STA   L600F
            STA   L5FFB
            STA   L600B
            JSL   GSOS
            DW    $2016            ; SetMark
            ADRL  L600D
            LDA   L6050
            STA   L5FFD
            LDA   L6050+2
            STA   L5FFD+2
            STZ   L6001
            LDA   #$0001
            STA   L6001+2
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  L5FF9
            STA   L5FC9
            JSL   GSOS
            DW    $2014            ; Close
            ADRL  L6009
            LDA   L5FC9
            BEQ   L5DB6
            INC   L6058
            RTS

L5DB6       LDA   #L603A
            LDX   L6054+2
            LDY   L6054
            JSR   L5F7C
            LDA   L5FC9
            BEQ   L5DCB
            INC   L6058
            RTS

L5DCB       LDA   #L6017
            LDX   L604C+2
            LDY   L604C
            JSR   L5F7C
            LDA   L5FC9
            BEQ   L5DE0
            INC   L6058
            RTS

L5DE0       LDA   L604C
            STA   L5DFD+1
            STA   L5E0D+1
            LDA   L604C+2
            STA   L5E02+1
            STA   L5E16+1
            _KillAllNotes
            LDA   L0E74
            TCD
L5DFD       LDA   #$BDBD
            STA   $F8
L5E02       LDA   #$BDBD
            STA   $FA
            LDY   #$0006
            LDA   [$F8],Y
            CLC
L5E0D       ADC   #$BDBD
            STA   L605E
            LDA   #$0000
L5E16       ADC   #$BDBD
            STA   L605E+2
            LDY   #$018A
            LDA   [$F8],Y
            ASL
            SEC
            SBC   #$000A
            PHA
            _SetTempo
            LDY   #$0190
            LDA   [$F8],Y
            PHA
            _SetBeat
            LDA   L6054
            CLC
            ADC   #$0400
            STA   L605A
            LDA   L6054+2
            ADC   #$0000
            STA   L605A+2
            STZ   L5FC7
L5E51       LDA   L5FC7
            PHA
            PEA   $8000
            _SetPlayTrack
            LDA   L5FC7
            PHA
            PEA   $FFFF
            _TrackToChannel
            LDA   L5FC7
            PHA
            PEA   $0002
            _SetTrackOut
            LDA   L605A+2
            PHA
            LDA   L605A
            PHA
            LDA   L5FC7
            PHA
            _SetInstrument
            LDA   L605A
            CLC
            ADC   #$0120
            STA   L605A
            LDA   L605A+2
            ADC   #$0000
            STA   L605A+2
            INC   L5FC7
            LDA   L5FC7
            CMP   #$0010
            BNE   L5E51
            SEI
            LDA   L6050+2
            PHA
            LDA   L6050
            PHA
            PEA   $0000
            PEA   $0000
            _WriteRamBlock
            PEA   ^L6074
            PEA   L6074
            _SetCallBack
            PEA   $0000
            PEA   $0000
            LDA   L6070+2
            PHA
            LDA   L6070
            PHA
            LDA   L605E+2
            PHA
            LDA   L605E
            PHA
            _Locate
            PLA
            STA   L605E
            PLA
            STA   L605E+2
            CLI
            RTS

L5EF6       LDA   L6058
            BNE   L5F08
            LDA   L5F09
            EOR   #$0001
            STA   L5F09
            BEQ   L5F0B
            BNE   L5F27
L5F08       RTS

L5F09       BRK   $00
L5F0B       LDA   L6058
            BNE   L5F26
            LDA   #$0100
            STA   L606E
            PEA   ^L605E
            PEA   L605E
            _SeqPlayer
            STZ   L5F7A
L5F26       RTS

L5F27       LDA   L6058
            BNE   L5F43
            STZ   L606E
            PEA   ^L605E
            PEA   L605E
            _SeqPlayer
            _KillAllNotes
L5F43       RTS

L5F44       LDA   L6058
            ORA   L5F09
            BNE   L5F53
            _MSSuspend
L5F53       RTS

L5F54       LDA   L6058
            ORA   L5F09
            BNE   L5F63
            _MSResume
L5F63       RTS

L5F64       LDA   L6058
            BNE   L5F71
            LDA   L5F7A
            BEQ   L5F71
            JSR   L5F0B
L5F71       RTS

L5F72       LDA   #$FFFF
            STAL  L5F7A
            RTL

L5F7A       DW    $FFFF
L5F7C       STA   L5FCF
            STY   L5FFD
            STX   L5FFD+2
            STZ   L5FC9
            JSL   GSOS
            DW    $2010            ; Open
            ADRL  L5FCB
            BCS   L5FC0
            LDA   L5FCD
            STA   L5FFB
            STA   L600B
            LDA   L5FF5
            STA   L6001
            LDA   L5FF5+2
            STA   L6001+2
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  L5FF9
            BCS   L5FC0
L5FB5       JSL   GSOS
            DW    $2014            ; Close
            ADRL  L6009
            RTS

L5FC0       JSR   L5FB5
            INC   L6058
            RTS

L5FC7       DW    $0000
L5FC9       DW    $0000
L5FCB       DW    $000C            ; Parms for Open
L5FCD       DW    $0000            ;  ref num
L5FCF       ADRL  L6017            ;  path name
            DW    $0000            ;  req access
            DW    $0000            ;  res num
            DW    $0000            ;  access
            DW    $0000            ;  file type
            ADRL  $00000000        ;  aux type
            DW    $0000            ;  storage
            DS    8                ;  creation date
            DS    8                ;  modification date
            ADRL  $00000000        ;  option list
L5FF5       ADRL  $00000000        ;  end of file
L5FF9       DW    $0004            ; Parms for Read
L5FFB       DW    $0000            ;  ref num
L5FFD       ADRL  $00000000        ;  buffer ptr
L6001       ADRL  $00000000        ;  request count
            ADRL  $00000000        ;  transfer count
L6009       DW    $0001            ; Parms for Close
L600B       DW    $0000            ;  ref num
L600D       DW    $0003            ; Parms for SetMark
L600F       DW    $0000            ;  ref num
            DW    $0000            ;  base
            ADRL  $00000900        ;  displacement
L6017       STRL  '1/data/Sequence'
L6028       STRL  '1/data/Piano.Wav'
L603A       STRL  '1/data/Piano.Bnk'
L604C       ADRL  $00000000
L6050       ADRL  $00000000
L6054       ADRL  $00000000
L6058       DW    $0000
L605A       ADRL  $00000000
L605E       ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
L606E       DW    $0000
L6070       ADRL  $00000000
L6074       ADRL  L5F72
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000

