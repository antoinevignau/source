*
* Genesys v1.2.4
* Window editor
*

         mx    %00
         rel
         lst   off

*----------------------------

         use	4/Ctl.Macs
         use	4/Int.Macs
	 use	4/Line.Macs
         use	4/Mem.Macs
         use	4/QD.Macs
         use	4/Resource.Macs
         use	4/Text.Macs
         use	4/Util.Macs
         use	4/Window.Macs

*----------------------------

GSOS     EQU   $E100A8

         EXT   L0271F5
         EXT   L024B85
         EXT   L020000
         EXT   L020E29

*----------------------------

         LDA   $04,S
         STA   L0106A0
         LDA   $06,S
         STA   L0106A0+2
         JMPL  L0271F5

L01000E  ENT
         PEA   ^L01001C
         PEA   L01001C
         _SetCtlParamPtr
         RTL

L01001C  ADRL  L010044	; Pointer to substitution strings
         ADRL  L010045
         ADRL  L010046
         ADRL  L010047
         ADRL  L010048
         ADRL  L010049
         ADRL  L01004A
         ADRL  L01004B
         ADRL  L01004C
         ADRL  L01004D
L010044  DB    $00
L010045  DB    $00
L010046  DB    $00
L010047  DB    $00
L010048  DB    $00
L010049  DB    $00
L01004A  DB    $00
L01004B  DB    $00
L01004C  DB    $00
L01004D  DB    $00

L01004E  ENT
         LDA   #L010055
         LDX   #^L010055
         RTL

L010055  DW    $0000
         DW    $0006
         DW    $0008
         ADRL  L010097
         ADRL  L0100A3
         ADRL  L0100C0
         ADRL  L0100DD
         ADRL  L0100F7
         ADRL  L010113
         ADRL  L010131
         ADRL  L010149
         ADRL  L010161
         ADRL  L010178
         ADRL  L01018F
         ADRL  L0101AE
         ADRL  L0101CE
         ADRL  L0101E5
         ADRL  $00000000
L010097  STR   '  Options  '
L0100A3  DW    $0000
         DW    $0802
         ASC   'Ee'
         DW    $0000
         DW    $0000
         ADRL  L0100B1
L0100B1  STR   'Edit colors...'
L0100C0  DW    $0000
         DW    $0803
         ASC   'Aa'
         DW    $0000
         DW    $0040
         ADRL  L0100CE
L0100CE  STR   'Add control...'
L0100DD  DW    $0000
         DW    $0804
         ASC   0000
         DW    $0000
         DW    $0000
         ADRL  L0100EB
L0100EB  STR   'Zoom window'
L0100F7  DW    $0000
         DW    $0805
         ASC   0000
         DW    $0000
         DW    $0000
         ADRL  L010105
L010105  STR   'Set zoom rect'
L010113  DW    $0000
         DW    $0806
         ASC   0000
         DW    $0000
         DW    $00C0
         ADRL  L010121
L010121  STR   'Clear zoom rect'
L010131  DW    $0000
         DW    $0807
         ASC   '1!'
         DW    $0000
         DW    $0000
         ADRL  L01013F
L01013F  STR   'Title bar'
L010149  DW    $0000
         DW    $0808
         ASC   '2@'
         DW    $0000
         DW    $0080
         ADRL  L010157
L010157  STR   'Close box'
L010161  DW    $0000
         DW    $0809
         ASC   '3#'
         DW    $0000
         DW    $0080
         ADRL  L01016F
L01016F  STR   'Zoom box'
L010178  DW    $0000
         DW    $080A
         ASC   '4$'
         DW    $0000
         DW    $0000
         ADRL  L010186
L010186  STR   'Info bar'
L01018F  DW    $0000
         DW    $080B
         ASC   '5%'
         DW    $0000
         DW    $0000
         ADRL  L01019D
L01019D  STR   'Right scroll bar'
L0101AE  DW    $0000
         DW    $080C
         ASC   '6^'
         DW    $0000
         DW    $0000
         ADRL  L0101BC
L0101BC  STR   'Bottom scroll bar'
L0101CE  DW    $0000
         DW    $080D
         ASC   '7&'
         DW    $0000
         DW    $0040
         ADRL  L0101DC
L0101DC  STR   'Size box'
L0101E5  DW    $0000
         DW    $080E
         ASC   'Tt'
         DW    $0000
         DW    $0000
         ADRL  L0101F3
L0101F3  STR   'Test window...'

L010202  ENT
         PEA   ^L0102B4
         PEA   L0102B4
         _SetCursor
         RTL

L010210  ENT
         PEA   ^L01022C
         PEA   L01022C
         _SetCursor
         RTL

L01021E  ENT
         PEA   ^L01033C
         PEA   L01033C
         _SetCursor
         RTL

L01022C  DW    $0008      ; cursor height
         DW    $0004      ; cursor width
         HEX   FFFF000000000000 ; cursor image
         HEX   F00F000000000000
         HEX   F00FFF0000000000
         HEX   FFFF0F0000000000
         HEX   0F000F0000000000
         HEX   0F000F0000000000
         HEX   0FFFFF0000000000
         HEX   0000000000000000
         HEX   FFFF000000000000 ; cursor mask
         HEX   FFFF000000000000
         HEX   FFFFFF0000000000
         HEX   FFFFFF0000000000
         HEX   0FFFFF0000000000
         HEX   0FFFFF0000000000
         HEX   0FFFFF0000000000
         HEX   0000000000000000
         DW    $0004      ; hot spot
         DW    $0008
L0102B4  DW    $0008      ; cursor height
         DW    $0004      ; cursor width
         HEX   FFF0FFF000000000 ; cursor image
         HEX   FF000FF000000000
         HEX   F0FFF0F000000000
         HEX   00F0F00000000000
         HEX   F0FFF0F000000000
         HEX   FF000FF000000000
         HEX   FFF0FFF000000000
         HEX   0000000000000000
         HEX   FFF0FFF000000000 ; cursor mask
         HEX   FF000FF000000000
         HEX   F0FFF0F000000000
         HEX   00FFF00000000000
         HEX   F0FFF0F000000000
         HEX   FF000FF000000000
         HEX   FFF0FFF000000000
         HEX   0000000000000000
         DW    $0004      ; hot spot
         DW    $0008
L01033C  DW    $0009      ; cursor height
         DW    $0004      ; cursor width
         HEX   00F0000000000000 ; cursor image
         HEX   0FFF000000000000
         HEX   FFFFF00000000000
         HEX   00F0000000000000
         HEX   00F0000000000000
         HEX   00F0000000000000
         HEX   FFFFF00000000000
         HEX   0FFF000000000000
         HEX   00F0000000000000
         HEX   00F0000000000000 ; cursor mask
         HEX   0FFF000000000000
         HEX   FFFFF00000000000
         HEX   00F0000000000000
         HEX   00F0000000000000
         HEX   00F0000000000000
         HEX   FFFFF00000000000
         HEX   0FFF000000000000
         HEX   00F0000000000000
         DW    $0004      ; hot spot
         DW    $0006

L0103D4  ENT
         PLA
         STA   L010416
         SEP   #$20
         PLA
         STA   L010418
         REP   #$20
         PLA
         STA   L010412
         PLA
         STA   L010414
         PLA
         PLX
         PHB
         PHX
         PHA
         PHK
         PEA   L010403
         SEP   #$20
         LDA   L010414
         PHA
         PHA
         REP   #$20
         SEC
         LDA   L010412
         SBC   #$0001
         PLB
         PHA
L010403  RTL

         PLB
         SEP   #$20
         LDA   L010418
         PHA
         REP   #$20
         LDA   L010416
         PHA
         RTL

L010412  DW    $0000
L010414  DW    $0000
L010416  DW    $0000
L010418  DB    $00
L010419  ENT
         PLA
         STA   L01049D
         SEP   #$20
         PLA
         STA   L01049F
         REP   #$20
         PLA
         STA   L01048B
         PLA
         STA   L01048D
         PLA
         STA   L010499
         PLA
         STA   L01049B
         PLA
         STA   L010495
         PLA
         STA   L010497
         PLA
         STA   L010493
         PLA
         STA   L01048F
         PLA
         STA   L010491
         PHB
         LDA   L010491
         PHA
         LDA   L01048F
         PHA
         LDA   L010493
         PHA
         LDA   L010497
         PHA
         LDA   L010495
         PHA
         LDA   L01049B
         PHA
         LDA   L010499
         PHA
         PHK
         PEA   L01047C
         SEP   #$20
         LDA   L01048D
         PHA
         PHA
         REP   #$20
         SEC
         LDA   L01048B
         SBC   #$0001
         PLB
         PHA
L01047C  RTL

         PLB
         SEP   #$20
         LDA   L01049F
         PHA
         REP   #$20
         LDA   L01049D
         PHA
         RTL

L01048B  DW    $0000
L01048D  DW    $0000
L01048F  DW    $0000
L010491  DW    $0000
L010493  DW    $0000
L010495  DW    $0000
L010497  DW    $0000
L010499  DW    $0000
L01049B  DW    $0000
L01049D  DW    $0000
L01049F  DB    $00
L0104A0  ENT
         PLA
         STA   L0104D2
         SEP   #$20
         PLA
         STA   L0104D4
         REP   #$20
         PLA
         SEP   #$20
         PHA
         XBA
         PLA
         ASL
         ASL
         ASL
         ASL
         REP   #$20
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         TAX
         SEP   #$20
         LDA   L0104D4
         PHA
         REP   #$20
         LDA   L0104D2
         PHA
         TXA
         RTL

L0104D2  DW    $0000
L0104D4  DB    $00
L0104D5  ENT
         PLA
         STA   L010507
         SEP   #$20
         PLA
         STA   L010509
         REP   #$20
         PLA
         SEP   #$20
         PHA
         LSR
         LSR
         LSR
         LSR
         XBA
         PLA
         REP   #$20
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         TAX
         SEP   #$20
         LDA   L010509
         PHA
         REP   #$20
         LDA   L010507
         PHA
         TXA
         RTL

L010507  DW    $0000
L010509  DB    $00
L01050A  ENT
         PLA
         STA   L01053D
         SEP   #$20
         PLA
         STA   L01053F
         REP   #$20
         PLA
         SEP   #$20
         XBA
         PHA
         XBA
         PLA
         ASL
         ASL
         ASL
         ASL
         REP   #$20
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         TAX
         SEP   #$20
         LDA   L01053F
         PHA
         REP   #$20
         LDA   L01053D
         PHA
         TXA
         RTL

L01053D  DW    $0000
L01053F  DB    $00
         PLA
         STA   L010573
         SEP   #$20
         PLA
         STA   L010575
         REP   #$20
         PLA
         SEP   #$20
         XBA
         PHA
         LSR
         LSR
         LSR
         LSR
         XBA
         PLA
         REP   #$20
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         TAX
         SEP   #$20
         LDA   L010575
         PHA
         REP   #$20
         LDA   L010573
         PHA
         TXA
         RTL

L010573  DW    $0000
L010575  DB    $00
         LDA   $06,S
         AND   #$FFF0
         ORA   $04,S
         BRA   L0105AE
         LDA   $04,S
         ASL
         ASL
         ASL
         ASL
         STA   $04,S
         LDA   $06,S
         AND   #$FF0F
         ORA   $04,S
         BRA   L0105AE
         LDA   $04,S
         XBA
         STA   $04,S
         LDA   $06,S
         AND   #$F0FF
         ORA   $04,S
         BRA   L0105AE
         LDA   $04,S
         XBA
         ASL
         ASL
         ASL
         ASL
         STA   $04,S
         LDA   $06,S
         AND   #$0FFF
         ORA   $04,S
L0105AE  TAY
         LDA   $01,S
         STA   $05,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         TYA
         RTL

L0105BB  ENT
         PHD
         TSX
         PHX
         PLD
         LDA   $0C,S
         ASL
         ASL
         ASL
         ASL
         ORA   $0A,S
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         STA   $0A,S
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         STA   $0C,S
         LDY   #$0020
L0105E0  DEY
         DEY
         LDA   $0C,S
         STA   [$06],Y
         DEY
         DEY
         STA   [$06],Y
         DEY
         DEY
         LDA   $0A,S
         STA   [$06],Y
         DEY
         DEY
         STA   [$06],Y
         CPY   #$0000
         BNE   L0105E0
         PLD
         LDA   $01,S
         STA   $09,S
         LDA   $02,S
         STA   $0A,S
         LDA   $06,S
         TAX
         LDA   $04,S
         PLY
         PLY
         PLY
         PLY
         RTL

L01060C  ENT
         PEA   ^L01061A
         PEA   L01061A
         _SetPenPat
         RTL

L01061A  HEX   CCCCCCCC33333333CCCCCCCC33333333
         HEX   CCCCCCCC33333333CCCCCCCC33333333

         BRK   $69
         RTL

L01063D  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0912
         PEA   $8734
         PEA   ^L024B85
         PEA   L024B85
         PEA   $0000
         PEA   $0000
         PEA   $0001
         LDA   L010698+2
         PHA
         LDA   L010698
         PHA
         PEA   $800E
         _NewWindow2
         lda   1,s
         STA   L01069C
         lda   3,s
         STA   L01069C+2
         _SetPort
         PLB
         PLD
         RTL

L01068E  ENT
         DW    $0000
L010690  ENT
         DW    $0000
L010692  ENT
         DW    $0000
L010694  ENT
         DW    $0000
L010696  ENT
         DW    $0000
L010698  ENT
         ADRL  $00000000
L01069C  ENT
         ADRL  $00000000
L0106A0  ENT
         ADRL  $00000000
L0106A4  ENT
         DB    $00
         DB    $00
L0106A6  ENT
         DB    $00
         DB    $00
L0106A8  ENT
         DB    $00
         DB    $00
L0106AA  ENT
         DB    $00
         DB    $00
L0106AC  ENT
         DB    $00
         DB    $00
L0106AE  ENT
         DB    $00
         DB    $00
L0106B0  ENT
         DB    $00
         DB    $00
L0106B2  ENT
         DB    $00
         DB    $00
L0106B4  ENT
         DB    $00
         DB    $00
L0106B6  ENT
         DB    $00
         DB    $00
L0106B8  ENT
         DB    $00
         DB    $00
L0106BA  ENT
         DB    $00
         DB    $00
L0106BC  ENT
         DB    $00
         DB    $00
L0106BE  ENT
         DB    $00
         DB    $00
L0106C0  ENT
         DB    $00
         DB    $00
L0106C2  ENT
         DB    $00
         DB    $00
L0106C4  ENT
         DB    $00
         DB    $00
L0106C6  ENT
         DB    $00
         DB    $00
L0106C8  ENT
         DB    $00
         DB    $00
L0106CA  ENT
         DB    $00
         DB    $00
L0106CC  ENT
         DB    $00
         DB    $00
L0106CE  ENT
         DB    $00
         DB    $00
L0106D0  ENT
         DB    $00
         DB    $00
L0106D2  ENT
         DB    $00
         DB    $00
L0106D4  ENT
         DB    $00
         DB    $00
L0106D6  ENT
         DB    $00
         DB    $00
L0106D8  ENT
         DB    $00
         DB    $00
L0106DA  ENT
         DB    $00
         DB    $00
L0106DC  ENT
         DB    $00
         DB    $00
L0106DE  ENT
         DB    $00
         DB    $00
L0106E0  ENT
         DB    $00
         DB    $00
L0106E2  ENT
         DB    $00
         DB    $00
L0106E4  ENT
         DB    $00
         DB    $00
L0106E6  ENT
         DB    $00
         DB    $00
L0106E8  ENT
         DB    $00
         DB    $00
L0106EA  ENT
         DB    $00
         DB    $00
L0106EC  ENT
         DB    $00
         DB    $00
L0106EE  ENT
         DB    $00
         DB    $00
L0106F0  ENT
         DB    $00
         DB    $00
L0106F2  ENT
         DB    $00
         DB    $00
L0106F4  ENT
         DB    $00
         DB    $00
L0106F6  ENT
         DB    $00
         DB    $00
L0106F8  ENT
         DB    $00
         DB    $00
L0106FA  ENT
         DB    $00
         DB    $00
L0106FC  ENT
         DB    $00
         DB    $00
L0106FE  ENT
         DB    $00
         DB    $00
L010700  ENT
         DB    $00
         DB    $00
L010702  ENT
         ADRL  $00000000
L010706  ENT
         ADRL  $00000000
L01070A  ENT
         ADRL  $00000000	; Current window
L01070E  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L01080E  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L01090E  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L010A0E  ENT
         TSC
         SEC
         SBC   #$011E
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDX   #$0123
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEA   $0100
         JSL   L014B1E
         PHA
         PHA
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L010A3C
         DEX
L010A3C  PHX
         PHA
         LDX   #$0121
         LDA   $00,X
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L010A52
         DEX
L010A52  PHX
         PHA
         _NewHandle
         STA   L014E87
         LDX   #$011A
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDA   L014E87
         PHA
         LDA   #$0042
         PHA
         JSL   L020000
         LDX   #$011A
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0043
         PHA
         JSL   L020000
         LDX   #$011A
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDX   #$0116
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDA   #$0000
         TAX
         PEA   $0000
         PHX
         TDC
         CLC
         ADC   $01,S
         ADC   #$0016
         STA   $01,S
         LDX   #$0116
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L010AD7
         DEX
L010AD7  PHX
         PHA
         _BlockMove
         STA   L014E87
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$8006
         PHA
         _UniqueResourceID
         STA   L014E87
         LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0010
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$0045
         PHA
         JSL   L020000
         LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0200
         BEQ   L010B58
         BRL   L010BA1
L010B58  LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L010BA1  LDX   #$011A
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0000
         PHA
         LDA   #$8006
         PHA
         LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _AddResource
         PHA
         LDA   #$0046
         PHA
         JSL   L020000
         LDA   #$8006
         PHA
         LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         PHA
         LDA   #$0047
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDX   #$0127
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         PHA
         LDA   #$0048
         PHA
         JSL   L020000
         LDX   #$011E
         LDA   $00,X
         LDY   $01,X
         LDX   #$0128
         STA   $00,X
         STY   $01,X
         PLD
         TSC
         CLC
         ADC   #$0128
         TCS
         RTL

L010C92  ENT
         TSC
         SEC
         SBC   #$003C
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDA   #$0000
         STA   $3A
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L010CD4
         DEX
L010CD4  LDY   #$0001
         CMP   $01,S
         BEQ   L010CDC
         DEY
L010CDC  TXA
         CMP   $03,S
         BEQ   L010CE4
         LDY   #$0000
L010CE4  PLA
         PLA
         TYA
         BEQ   L010CEC
         BRL   L010DA4
L010CEC  PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $36
         PLA
         STA   $38
         LDA   L014E87
         BNE   L010D23
         BRL   L010D40
L010D23  LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L0114DC
         PEA   L0114DC
         LDA   #$0013
         PHA
         JSL   L014B68
         BRL   L010DA1
L010D40  LDX   $38
         LDA   $36
         PHX
         PHA
         _HLock
         STA   L014E87
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$36],Y
         PHA
         LDA   [$36]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   #$0001
         STA   $3A
L010DA1  BRL   L010DBE
L010DA4  LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L0114EF
         PEA   L0114EF
         LDA   #$0000
         PHA
         JSL   L014B68
L010DBE  JSL   L013CFB
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _SetPort
         STA   L014E87
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$4000
         BNE   L010DF1
         BRL   L010E23
L010DF1  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$4000
         LDX   #$0000
         TAY
         BPL   L010E0D
         DEX
L010E0D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L010E23  LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0100
         BNE   L010E3C
         BRL   L010E6E
L010E3C  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0100
         LDX   #$0000
         TAY
         BPL   L010E58
         DEX
L010E58  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L010E6E  LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0080
         BNE   L010E87
         BRL   L010EB9
L010E87  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0080
         LDX   #$0000
         TAY
         BPL   L010EA3
         DEX
L010EA3  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L010EB9  LDA   #$001B
         STA   L01358E
         LDA   #$2006
         STA   L01358C
L010EC5  LDA   #$0000
         STA   L0135A6
         PHA
         pea   $FFFF
         LDX   #^L013578
         LDA   #L013578
         PHX
         PHA
         _TaskMaster
         STA   L014E87
         PLA
         STA   L01356C
         CMP   #$0021
         BEQ   L010EF1
         BRL   L011040
L010EF1  PHA
         LDX   L0135A0
         LDA   L01359E
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $20
         LDA   $20
         CMP   #$0001
         BEQ   L010F11
         BRL   L01102D
L010F11  PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L010F29
         DEX
L010F29  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L010FCC
         DEX
L010FCC  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L010FEC
         EOR   #$8000
L010FEC  BMI   L010FF1
         BRL   L011024
L010FF1  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L01101F
         BRL   L011024
L01101F  INC   $26
         BRL   L010FF1
L011024  LDA   #$0001
         STA   L0135A6
         BRL   L011040
L01102D  LDA   $20
         CMP   #$0002
         BEQ   L011037
         BRL   L011040
L011037  LDA   #$0001
         STA   L0135A6
         BRL   L011040
L011040  LDA   L01356C
         CMP   #$0014
         BEQ   L01104B
         BRL   L011099
L01104B  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   L013584
         PHA
         LDA   L013582
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDX   L01358A
         LDA   L013588
         PHX
         PHA
         _DragWindow
         STA   L014E87
L011099  LDA   L0135A6
         BNE   L0110A1
         BRL   L010EC5
L0110A1  PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$4000
         LDX   #$0000
         TAY
         BPL   L0110BA
         DEX
L0110BA  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $34
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0100
         LDX   #$0000
         TAY
         BPL   L0110EC
         DEX
L0110EC  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $32
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0080
         LDX   #$0000
         TAY
         BPL   L01111E
         DEX
L01111E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $30
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _CloseWindow
         STA   L014E87
         LDX   $24
         LDA   $22
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   $20
         CMP   #$0001
         BEQ   L011167
         BRL   L0114C4
L011167  LDA   $34
         BNE   L01116E
         BRL   L01119C
L01116E  LDY   #$0002
         LDA   [$41],Y
         PHA
         LDA   [$41]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$4000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L0111CF
L01119C  LDY   #$0002
         LDA   [$41],Y
         PHA
         LDA   [$41]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$4000
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0111CF  LDA   $32
         BNE   L0111D6
         BRL   L011204
L0111D6  LDY   #$0002
         LDA   [$41],Y
         PHA
         LDA   [$41]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L011237
L011204  LDY   #$0002
         LDA   [$41],Y
         PHA
         LDA   [$41]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0100
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L011237  LDA   $30
         BNE   L01123E
         BRL   L01126C
L01123E  LDY   #$0002
         LDA   [$41],Y
         PHA
         LDA   [$41]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L01129F
L01126C  LDY   #$0002
         LDA   [$41],Y
         PHA
         LDA   [$41]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L01129F  LDA   $3A
         BNE   L0112A6
         BRL   L011494
L0112A6  PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         tax
         PLA
         STA   L013570
         PLA
         STA   L013572
         phx
         LDA   #$2012
         PHA
         JSL   L020000
         LDX   L013572
         LDA   L013570
         PHX
         PHA
         _HUnlock
         PHA
         LDA   #$2013
         PHA
         JSL   L020000
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014ADD
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L01131C
         DEX
L01131C  PHX
         PHA
         LDX   L013572
         LDA   L013570
         PHX
         PHA
         _SetHandleSize
         PHA
         LDA   #$2014
         PHA
         JSL   L020000
         LDX   L013572
         LDA   L013570
         PHX
         PHA
         _HLock
         PHA
         LDA   #$2015
         PHA
         JSL   L020000
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014ADD
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L011390
         DEX
L011390  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   #$0001
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _MarkResourceChange
         PHA
         LDA   #$2017
         PHA
         JSL   L020000
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         PHA
         LDA   #$2018
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         PHA
         LDA   #$2019
         PHA
         JSL   L020000
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L020E29
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   #$0001
         PHA
         LDA   $28
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $2C
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _InvalRect
         STA   L014E87
         LDA   #$0001
         STA   $16
         BRL   L0114C1
L011494  LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014ADD
         BMI   L0114A9
         DEC
         BPL   L0114AC
L0114A9  BRL   L0114C1
L0114AC  LDX   $43
         LDA   $41
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   $3F
         PHA
         JSL   L010A0E
L0114C1  BRL   L0114C9
L0114C4  LDA   #$0000
         STA   $16
L0114C9  LDA   $3D
         STA   $43
         LDA   $3C
         STA   $42
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0042
         TCS
         TXA
         RTL

L0114DC  ASC   'Error loading title'
L0114EF  ENT
         TSC
         SEC
         SBC   #$0032
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L0117CC
         PEA   L0117CC
         LDA   #$0008
         PHA
         JSL   L014B68
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$08
         STA   L0138A8,X
         REP   #$20
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   #$0008
         PHA
         _Long2Hex
         PHA
         LDA   #$2020
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L011595
         DEX
L011595  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         JSL   L013EEF
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _SetPort
         STA   L014E87
         LDA   #$001B
         STA   L01358E
         LDA   #$2006
         STA   L01358C
L0115C9  LDA   #$0000
         STA   L0135A6
         PHA
         pea   $FFFF
         LDX   #^L013578
         LDA   #L013578
         PHX
         PHA
         _TaskMaster
         STA   L014E87
         PLA
         STA   L01356C
         CMP   #$0021
         BEQ   L0115F5
         BRL   L011726
L0115F5  PHA
         LDX   L0135A0
         LDA   L01359E
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $20
         LDA   $20
         CMP   #$0001
         BEQ   L011615
         BRL   L01170E
L011615  PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L01162D
         DEX
L01162D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2021
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         tax
         PLA
         STA   L013570
         PLA
         STA   L013572
         phx
         LDA   #$2022
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         tax
         PLA
         STA   L01356E
         phx
         LDA   #$2023
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   L01356E
         PHA
         _Hex2Long
         tax
         LDY   #$0002
         LDA   [$35],Y
         PHA
         LDA   [$35]
         PHA
         PLA
         CLC
         ADC   #$0038
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         phx
         LDA   #$2024
         PHA
         JSL   L020000
         LDA   #$0001
         STA   L0135A6
         LDA   #$0001
         STA   $16
         BRL   L011726
L01170E  LDA   $20
         CMP   #$0002
         BEQ   L011718
         BRL   L011726
L011718  LDA   #$0001
         STA   L0135A6
         LDA   #$0000
         STA   $16
         BRL   L011726
L011726  LDA   L01356C
         CMP   #$0014
         BEQ   L011731
         BRL   L01177F
L011731  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   L013584
         PHA
         LDA   L013582
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDX   L01358A
         LDA   L013588
         PHX
         PHA
         _DragWindow
         STA   L014E87
L01177F  LDA   L0135A6
         BNE   L011787
         BRL   L0115C9
L011787  PHA
         PHA
         _FrontWindow
         STA   L014E87
         _CloseWindow
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$2025
         PHA
         JSL   L020000
         LDX   $24
         LDA   $22
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   $33
         STA   $37
         LDA   $32
         STA   $36
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0036
         TCS
         TXA
         RTL

L0117CC  BMI   L0117FE
         BMI   L0117FE+2
         BMI   L011801+1
         BMI   L011804
L0117D4  ENT
         TSC
         SEC
         SBC   #$003C
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L012406
L0117FE  PEA   L012406
L011801  LDA   #$0008
L011804  PHA
         JSL   L014B68
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$08
         STA   L0138A8,X
         REP   #$20
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   #$0008
         PHA
         _Long2Hex
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$2026
         PHA
         JSL   L020000
         LDX   #^L0136A8
         LDA   #L0136A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L01187A
         DEX
L01187A  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         LDX   #^L0135A8
         LDA   #L0135A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$0024
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L0118AC
         DEX
L0118AC  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         JSL   L0139A8
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _SetPort
         STA   L014E87
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0020
         BNE   L0118ED
         BRL   L01191F
L0118ED  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L011909
         DEX
L011909  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L01191F  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$0054
         LDA   [$00],Y
         PHA
         LDY   #$0052
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L011941
         DEX
L011941  LDY   #$0001
         CMP   $01,S
         BEQ   L011949
         DEY
L011949  TXA
         CMP   $03,S
         BEQ   L011951
         LDY   #$0000
L011951  PLA
         PLA
         TYA
         BNE   L011959
         BRL   L01198B
L011959  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L011975
         DEX
L011975  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L01198B  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0002
         BNE   L0119A4
         BRL   L0119D6
L0119A4  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L0119C0
         DEX
L0119C0  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L0119D6  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0008
         BNE   L0119EF
         BRL   L011A21
L0119EF  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L011A0B
         DEX
L011A0B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L011A21  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0040
         BNE   L011A3A
         BRL   L011A6C
L011A3A  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L011A56
         DEX
L011A56  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L011A6C  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L011A85
         BRL   L011AB7
L011A85  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L011AA1
         DEX
L011AA1  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _SetCtlValue
         STA   L014E87
L011AB7  LDA   #$001B
         STA   L01358E
         LDA   #$2006
         STA   L01358C
L011AC3  LDA   #$0000
         STA   L0135A6
         PHA
         pea   $FFFF
         LDX   #^L013578
         LDA   #L013578
         PHX
         PHA
         _TaskMaster
         STA   L014E87
         PLA
         STA   L01356C
         CMP   #$0021
         BEQ   L011AEF
         BRL   L011EC8
L011AEF  PHA
         LDX   L0135A0
         LDA   L01359E
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $20
         LDA   $20
         CMP   #$0001
         BEQ   L011B0F
         BRL   L011EB5
L011B0F  PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L011B27
         DEX
L011B27  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2027
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2028
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2029
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   L01356E
         PHA
         _Hex2Long
         STA   L014E87
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$2030
         PHA
         JSL   L020000
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L011C12
         DEX
L011C12  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2031
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2032
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2033
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L011CD9
         DEX
L011CD9  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L011CF9
         EOR   #$8000
L011CF9  BMI   L011CFE
         BRL   L011D31
L011CFE  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L011D2C
         BRL   L011D31
L011D2C  INC   $26
         BRL   L011CFE
L011D31  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         CLC
         ADC   #$0026
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L011D6B
         DEX
L011D6B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2035
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2036
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2037
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L011E32
         DEX
L011E32  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L011E52
         EOR   #$8000
L011E52  BMI   L011E57
         BRL   L011E8A
L011E57  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L011E85
         BRL   L011E8A
L011E85  INC   $26
         BRL   L011E57
L011E8A  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         CLC
         ADC   #$0024
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         LDA   #$0001
         STA   L0135A6
         BRL   L011EC8
L011EB5  LDA   $20
         CMP   #$0002
         BEQ   L011EBF
         BRL   L011EC8
L011EBF  LDA   #$0001
         STA   L0135A6
         BRL   L011EC8
L011EC8  LDA   L01356C
         CMP   #$0014
         BEQ   L011ED3
         BRL   L011F21
L011ED3  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   L013584
         PHA
         LDA   L013582
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDX   L01358A
         LDA   L013588
         PHX
         PHA
         _DragWindow
         STA   L014E87
L011F21  LDA   L0135A6
         BNE   L011F29
         BRL   L011AC3
L011F29  PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L011F42
         DEX
L011F42  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $3A
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L011F74
         DEX
L011F74  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $38
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L011FA6
         DEX
L011FA6  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $36
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L011FD8
         DEX
L011FD8  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $34
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L01200A
         DEX
L01200A  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $32
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L01203C
         DEX
L01203C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _GetCtlValue
         STA   L014E87
         PLA
         STA   $30
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _CloseWindow
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$2040
         PHA
         JSL   L020000
         LDX   $24
         LDA   $22
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   $20
         CMP   #$0001
         BEQ   L012091
         BRL   L0123EE
L012091  LDA   $3A
         BNE   L012098
         BRL   L0120C6
L012098  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0020
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L0120F9
L0120C6  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0020
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0120F9  LDA   $38
         BNE   L012100
         BRL   L01212D
L012100  LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L01210A
         DEX
L01210A  PHX
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         BRL   L012157
L01212D  LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L012137
         DEX
L012137  PHX
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L012157  LDA   $36
         BNE   L01215E
         BRL   L01218C
L01215E  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L0121BF
L01218C  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0002
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0121BF  LDA   $34
         BNE   L0121C6
         BRL   L0121F4
L0121C6  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0008
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L012227
L0121F4  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0008
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L012227  LDA   $32
         BNE   L01222E
         BRL   L01225C
L01222E  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0040
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L01228F
L01225C  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0040
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L01228F  LDA   $30
         BNE   L012296
         BRL   L01235D
L012296  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$8000
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0010
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0400
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L012390
L01235D  LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$2000
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L012390  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L020E29
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _InsetRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _EraseRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _InvalRect
         STA   L014E87
         LDA   #$0001
         STA   $16
         BRL   L0123F3
L0123EE  LDA   #$0000
         STA   $16
L0123F3  LDA   $3D
         STA   $41
         LDA   $3C
         STA   $40
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0040
         TCS
         TXA
         RTL

L012406  BMI   L012438
         BMI   L01243A
         BMI   L01243B+1
         BMI   L01243D+1
L01240E  ENT
         TSC
         SEC
         SBC   #$0030
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
L012438  LDA   [$33],Y
L01243A  TAX
L01243B  LDA   [$33]
L01243D  STA   $00
         STX   $02
         LDY   #$0028
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L01244D
         DEX
L01244D  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         LDX   #^L0136A8
         LDA   #L0136A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $00
         STX   $02
         LDY   #$0030
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L01247F
         DEX
L01247F  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         LDX   #^L0135A8
         LDA   #L0135A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $00
         STX   $02
         LDY   #$0034
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L0124B1
         DEX
L0124B1  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         JSL   L014098
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _SetPort
         STA   L014E87
         LDA   #$001B
         STA   L01358E
         LDA   #$2006
         STA   L01358C
L0124E5  LDA   #$0000
         STA   L0135A6
         PHA
         pea   $FFFF
         LDX   #^L013578
         LDA   #L013578
         PHX
         PHA
         _TaskMaster
         STA   L014E87
         PLA
         STA   L01356C
         CMP   #$0021
         BEQ   L012511
         BRL   L01296E
L012511  PHA
         LDX   L0135A0
         LDA   L01359E
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $20
         LDA   $20
         CMP   #$0001
         BEQ   L012531
         BRL   L012956
L012531  PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L012549
         DEX
L012549  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2041
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2042
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2043
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L012610
         DEX
L012610  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L012630
         EOR   #$8000
L012630  BMI   L012635
         BRL   L012668
L012635  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L012663
         BRL   L012668
L012663  INC   $26
         BRL   L012635
L012668  LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0028
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L0126A2
         DEX
L0126A2  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2045
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2046
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2047
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L012769
         DEX
L012769  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L012789
         EOR   #$8000
L012789  BMI   L01278E
         BRL   L0127C1
L01278E  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L0127BC
         BRL   L0127C1
L0127BC  INC   $26
         BRL   L01278E
L0127C1  LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0030
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L0127FB
         DEX
L0127FB  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2049
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2050
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2051
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L0128C2
         DEX
L0128C2  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$2052
         PHA
         JSL   L020000
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L0128EE
         EOR   #$8000
L0128EE  BMI   L0128F3
         BRL   L012926
L0128F3  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L012921
         BRL   L012926
L012921  INC   $26
         BRL   L0128F3
L012926  LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0034
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         LDA   #$0001
         STA   $16
         LDA   #$0001
         STA   L0135A6
         BRL   L01296E
L012956  LDA   $20
         CMP   #$0002
         BEQ   L012960
         BRL   L01296E
L012960  LDA   #$0001
         STA   L0135A6
         LDA   #$0000
         STA   $16
         BRL   L01296E
L01296E  LDA   L01356C
         CMP   #$0014
         BEQ   L012979
         BRL   L0129C7
L012979  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   L013584
         PHA
         LDA   L013582
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDX   L01358A
         LDA   L013588
         PHX
         PHA
         _DragWindow
         STA   L014E87
L0129C7  LDA   L0135A6
         BNE   L0129CF
         BRL   L0124E5
L0129CF  PHA
         PHA
         _FrontWindow
         STA   L014E87
         _CloseWindow
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$2054
         PHA
         JSL   L020000
         LDX   $24
         LDA   $22
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   $31
         STA   $35
         LDA   $30
         STA   $34
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0034
         TCS
         TXA
         RTL

L012A14  ENT
         TSC
         SEC
         SBC   #$0030
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $00
         STX   $02
         LDY   #$002A
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L012A53
         DEX
L012A53  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         LDX   #^L0136A8
         LDA   #L0136A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $00
         STX   $02
         LDY   #$0032
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L012A85
         DEX
L012A85  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         LDX   #^L0135A8
         LDA   #L0135A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L012AB7
         DEX
L012AB7  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         JSL   L0142F3
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _SetPort
         STA   L014E87
         LDA   #$001B
         STA   L01358E
         LDA   #$2006
         STA   L01358C
L012AEB  LDA   #$0000
         STA   L0135A6
         PHA
         pea   $FFFF
         LDX   #^L013578
         LDA   #L013578
         PHX
         PHA
         _TaskMaster
         STA   L014E87
         PLA
         STA   L01356C
         CMP   #$0021
         BEQ   L012B17
         BRL   L012F68
L012B17  PHA
         LDX   L0135A0
         LDA   L01359E
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $20
         LDA   $20
         CMP   #$0001
         BEQ   L012B37
         BRL   L012F50
L012B37  PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L012B4F
         DEX
L012B4F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2055
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2056
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2057
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L012C16
         DEX
L012C16  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L012C36
         EOR   #$8000
L012C36  BMI   L012C3B
         BRL   L012C6E
L012C3B  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L012C69
         BRL   L012C6E
L012C69  INC   $26
         BRL   L012C3B
L012C6E  LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$002A
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L012CA8
         DEX
L012CA8  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2059
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2060
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2061
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L012D6F
         DEX
L012D6F  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L012D8F
         EOR   #$8000
L012D8F  BMI   L012D94
         BRL   L012DC7
L012D94  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L012DC2
         BRL   L012DC7
L012DC2  INC   $26
         BRL   L012D94
L012DC7  LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0032
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L012E01
         DEX
L012E01  PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2063
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         STA   L014E87
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2064
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         STA   L014E87
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2065
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L012EC8
         DEX
L012EC8  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L012EE8
         EOR   #$8000
L012EE8  BMI   L012EED
         BRL   L012F20
L012EED  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L012F1B
         BRL   L012F20
L012F1B  INC   $26
         BRL   L012EED
L012F20  LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         LDA   #$0001
         STA   $16
         LDA   #$0001
         STA   L0135A6
         BRL   L012F68
L012F50  LDA   $20
         CMP   #$0002
         BEQ   L012F5A
         BRL   L012F68
L012F5A  LDA   #$0001
         STA   L0135A6
         LDA   #$0000
         STA   $16
         BRL   L012F68
L012F68  LDA   L01356C
         CMP   #$0014
         BEQ   L012F73
         BRL   L012FC1
L012F73  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   L013584
         PHA
         LDA   L013582
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDX   L01358A
         LDA   L013588
         PHX
         PHA
         _DragWindow
         STA   L014E87
L012FC1  LDA   L0135A6
         BNE   L012FC9
         BRL   L012AEB
L012FC9  PHA
         PHA
         _FrontWindow
         STA   L014E87
         _CloseWindow
         STA   L014E87
         LDX   $24
         LDA   $22
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   $31
         STA   $35
         LDA   $30
         STA   $34
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0034
         TCS
         TXA
         RTL

L013002  ENT
         TSC
         SEC
         SBC   #$0032
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDX   #^L0136A8
         LDA   #L0136A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$002E
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L013041
         DEX
L013041  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         LDX   #^L0135A8
         LDA   #L0135A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$002C
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L013073
         DEX
L013073  PHX
         PHA
         JSL   L0147C4
         JSL   L014B68
         JSL   L014A35
         JSL   L014453
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         _SetPort
         STA   L014E87
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0200
         BNE   L0130B4
         BRL   L0130E6
L0130B4  LDA   #$0001
         PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L0130D0
         DEX
L0130D0  PHX
         PHA
         _GetCtlHandleFromID
         _SetCtlValue
L0130E6  LDA   #$001B
         STA   L01358E
         LDA   #$2006
         STA   L01358C
L0130F2  LDA   #$0000
         STA   L0135A6
         PHA
         pea   $FFFF
         LDX   #^L013578
         LDA   #L013578
         PHX
         PHA
         _TaskMaster
         PLA
         STA   L01356C
         CMP   #$0021
         BEQ   L01311E
         BRL   L013416
L01311E  PHA
         LDX   L0135A0
         LDA   L01359E
         PHX
         PHA
         _LoWord
         PLA
         STA   $20
         CMP   #$0001
         BEQ   L01313E
         BRL   L0133FE
L01313E  PHA
         PHA
         PHA
         PHA
         _FrontWindow
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L013156
         DEX
L013156  PHX
         PHA
         _GetCtlHandleFromID
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2068
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2069
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2070
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L01321D
         DEX
L01321D  PHX
         PHA
         _BlockMove
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L01323D
         EOR   #$8000
L01323D  BMI   L013242
         BRL   L013275
L013242  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L013270
         BRL   L013275
L013270  INC   $26
         BRL   L013242
L013275  LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         CLC
         ADC   #$002E
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L0132AF
         DEX
L0132AF  PHX
         PHA
         _GetCtlHandleFromID
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L013576
         STA   L013574
         LDA   L014E87
         PHA
         LDA   #$2072
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextHand
         PLA
         STA   L013570
         PLA
         STA   L013572
         LDA   L014E87
         PHA
         LDA   #$2073
         PHA
         JSL   L020000
         PHA
         LDX   L013576
         LDA   L013574
         PHX
         PHA
         _LEGetTextLen
         PLA
         STA   L01356E
         LDA   L014E87
         PHA
         LDA   #$2074
         PHA
         JSL   L020000
         LDX   #^L0137A8
         LDA   #L0137A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L013572
         LDA   L013570
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDX   #^L01356E
         LDA   #L01356E
         PHX
         PHA
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L013376
         DEX
L013376  PHX
         PHA
         _BlockMove
         LDA   L01356E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L013396
         EOR   #$8000
L013396  BMI   L01339B
         BRL   L0133CE
L01339B  LDA   $26
         TAX
         TXA
         CLC
         ADC   #L0138A8
         PEA   ^L0138A8
         PHA
         LDA   $26
         SEC
         SBC   #$0001
         TAX
         LDA   L0137A8,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $26
         BNE   L0133C9
         BRL   L0133CE
L0133C9  INC   $26
         BRL   L01339B
L0133CE  LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         CLC
         ADC   #$002C
         STA   $00
         STX   $02
         LDX   #^L0138A8
         LDA   #L0138A8
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014824
         STA   [$00]
         LDA   #$0001
         STA   $16
         LDA   #$0001
         STA   L0135A6
         BRL   L013416
L0133FE  LDA   $20
         CMP   #$0002
         BEQ   L013408
         BRL   L013416
L013408  LDA   #$0001
         STA   L0135A6
         LDA   #$0000
         STA   $16
         BRL   L013416
L013416  LDA   L01356C
         CMP   #$0014
         BEQ   L013421
         BRL   L01346F
L013421  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         LDA   #$0000
         PHA
         LDA   L013584
         PHA
         LDA   L013582
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDX   L01358A
         LDA   L013588
         PHX
         PHA
         _DragWindow
L01346F  LDA   L0135A6
         BNE   L013477
         BRL   L0130F2
L013477  PHA
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L013490
         DEX
L013490  PHX
         PHA
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         STA   $30
         LDA   L014E87
         PHA
         LDA   #$2077
         PHA
         JSL   L020000
         PHA
         PHA
         _FrontWindow
         _CloseWindow
         PHA
         LDA   #$2078
         PHA
         JSL   L020000
         LDX   $24
         LDA   $22
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   $20
         CMP   #$0001
         BEQ   L0134F1
         BRL   L013559
L0134F1  LDA   $30
         BNE   L0134F8
         BRL   L013526
L0134F8  LDY   #$0002
         LDA   [$35],Y
         PHA
         LDA   [$35]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L013559
L013526  LDY   #$0002
         LDA   [$35],Y
         PHA
         LDA   [$35]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0200
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L013559  LDA   $33
         STA   $37
         LDA   $32
         STA   $36
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0036
         TCS
         TXA
         RTL

L01356C  DB    $00
         DB    $00
L01356E  DB    $00
         DB    $00
L013570  DB    $00
         DB    $00
L013572  DB    $00
         DB    $00
L013574  DB    $00
         DB    $00
L013576  DB    $00
         DB    $00
L013578  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L013582  DB    $00
         DB    $00
L013584  DB    $00
         DB    $00
         DB    $00
         DB    $00
L013588  DB    $00
         DB    $00
L01358A  DB    $00
         DB    $00
L01358C  DB    $00
         DB    $00
L01358E  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L01359E  DB    $00
         DB    $00
L0135A0  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0135A6  DB    $00
         DB    $00
L0135A8  STR   ''
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0136A8  STR   ''
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0137A8  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0138A8  STR   ''
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0139A8  PEA   $0000
         PEA   $0000
         PEA   ^L0139DC
         PEA   L0139DC
         PEA   $0000
         PEA   $0000
         PEA   ^L013C50
         PEA   L013C50
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L0139E6
         PEA   L0139E6
         PEA   $800E
         _NewWindow2
         PLA
         PLA
         RTL

L0139DC  STR   ' Content '
L0139E6  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L0139DC    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L01469C    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L013C50    ; content defproc
         DW    $0074      ; content rect
         DW    $00D2
         DW    $00C4
         DW    $0276
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L013A36    ; storage ptr
         DW    $0003
L013A36  ADRL  L013C28
         ADRL  L013C00
         ADRL  L013BE0
         ADRL  L013BC0
         ADRL  L013BA0
         ADRL  L013B6F
         ADRL  L013B37
         ADRL  L013AFF
         ADRL  L013ACB
         ADRL  L013A98
         ADRL  L013A66
         ADRL  $00000000
L013A66  DW    $000A      ; pCount
         ADRL  $0000000B  ; ID
         DW    $000A      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013A90    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013A90  STR   'Visible'
L013A98  DW    $000A      ; pCount
         ADRL  $0000000A  ; ID
         DW    $000A      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013AC2    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013AC2  STR   'In front'
L013ACB  DW    $000A      ; pCount
         ADRL  $00000009  ; ID
         DW    $000A      ; rect
         DW    $0131
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013AF5    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013AF5  STR   'Is zoomed'
L013AFF  DW    $000A      ; pCount
         ADRL  $00000008  ; ID
         DW    $0014      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013B29    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013B29  STR   'Controls tied'
L013B37  DW    $000A      ; pCount
         ADRL  $00000007  ; ID
         DW    $0014      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013B61    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013B61  STR   'Quick content'
L013B6F  DW    $000A      ; pCount
         ADRL  $00000006  ; ID
         DW    $0014      ; rect
         DW    $0131
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013B99    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013B99  STR   'Dialog'
L013BA0  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0023      ; rect
         DW    $0046
         DW    $0030
         DW    $0094
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L0138A8    ; defaultRef
L013BC0  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0023      ; rect
         DW    $00ED
         DW    $0030
         DW    $0111
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0136A8    ; defaultRef
L013BE0  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0023      ; rect
         DW    $016C
         DW    $0030
         DW    $0190
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0135A8    ; defaultRef
L013C00  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0037      ; rect
         DW    $0042
         DW    $0044
         DW    $00A6
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146AD    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L013C28  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0037      ; rect
         DW    $00E8
         DW    $0044
         DW    $014C
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146A6    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L013C50  PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   ^L013CD4
         PEA   L013CD4
         _FrameRect
         _PenNormal
         PEA   $0014
         PEA   $002D
         _MoveTo
         PEA   ^L013CDC
         PEA   L013CDC
         _DrawString
         PEA   $009C
         PEA   $002D
         _MoveTo
         PEA   ^L013CE3
         PEA   L013CE3
         _DrawString
         PEA   $0119
         PEA   $002D
         _MoveTo
         PEA   ^L013CEF
         PEA   L013CEF
         _DrawString
         RTL

L013CD4  DW    $0002
         DW    $0004
         DW    $004E
         DW    $01A0
L013CDC  STR   'Refcon'
L013CE3  STR   'Horz Origin'
L013CEF  STR   'Vert Origin'
L013CFB  PEA   $0000
         PEA   $0000
         PEA   ^L013D2F
         PEA   L013D2F
         PEA   $0000
         PEA   $0000
         PEA   ^L013EB1
         PEA   L013EB1
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L013D3B
         PEA   L013D3B
         PEA   $800E
         _NewWindow2
         PLA
         PLA
         RTL

L013D2F  STR   ' Title Bar '
L013D3B  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L013D2F    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L01469C    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L013EB1    ; content defproc
         DW    $007B      ; content rect
         DW    $0122
         DW    $00C4
         DW    $0276
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L013D8B    ; storage ptr
         DW    $0003
L013D8B  ADRL  L013E89
         ADRL  L013E61
         ADRL  L013E41
         ADRL  L013DA7
         ADRL  L013DDA
         ADRL  L013E0D
         ADRL  $00000000
L013DA7  DW    $000A      ; pCount
         ADRL  $00000080  ; ID
         DW    $000A      ; rect
         DW    $00E4
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013DD1    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013DD1  STR   'Moveable'
L013DDA  DW    $000A      ; pCount
         ADRL  $00000100  ; ID
         DW    $000A      ; rect
         DW    $007F
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013E04    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013E04  STR   'Zoom box'
L013E0D  DW    $000A      ; pCount
         ADRL  $00004000  ; ID
         DW    $000A      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L013E37    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L013E37  STR   'Close box'
L013E41  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $001B      ; rect
         DW    $0014
         DW    $0028
         DW    $0140
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $00FF      ; maxSize
         ADRL  L0138A8    ; defaultRef
L013E61  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0032      ; rect
         DW    $0032
         DW    $003F
         DW    $0096
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146AD    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L013E89  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0032      ; rect
         DW    $00BE
         DW    $003F
         DW    $0122
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146A6    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L013EB1  PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   ^L013EE7
         PEA   L013EE7
         _FrameRect
         _PenNormal
         RTL

L013EE7  DW    $0002
         DW    $0004
         DW    $0047
         DW    $0150
L013EEF  PEA   $0000
         PEA   $0000
         PEA   ^L013F23
         PEA   L013F23
         PEA   $0000
         PEA   $0000
         PEA   ^L013FFE
         PEA   L013FFE
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L013F2E
         PEA   L013F2E
         PEA   $800E
         _NewWindow2
         PLA
         PLA
         RTL

L013F23  STR   ' Info Bar '
L013F2E  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L013F23    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L01469C    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L013FFE    ; content defproc
         DW    $0080      ; content rect
         DW    $01A4
         DW    $00C4
         DW    $0276
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L013F7E    ; storage ptr
         DW    $0003
L013F7E  ADRL  L013FD6
         ADRL  L013FAE
         ADRL  L013F8E
         ADRL  $00000000
L013F8E  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0019      ; rect
         DW    $005A
         DW    $0026
         DW    $00A8
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L0138A8    ; defaultRef
L013FAE  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $002D      ; rect
         DW    $0014
         DW    $003A
         DW    $0064
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146AD    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L013FD6  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $002D      ; rect
         DW    $006E
         DW    $003A
         DW    $00BE
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146A6    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L013FFE  PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   ^L014082
         PEA   L014082
         _FrameRect
         _PenNormal
         PEA   $0014
         PEA   $0012
         _MoveTo
         PEA   ^L014091
         PEA   L014091
         _DrawString
         PEA   $005A
         PEA   $0012
         _MoveTo
         PEA   ^L0137A8
         PEA   L0137A8
         _DrawString
         PEA   $0014
         PEA   $0023
         _MoveTo
         PEA   ^L01408A
         PEA   L01408A
         _DrawString
         RTL

L014082  DW    $0002
         DW    $0004
         DW    $0042
         DW    $00CE
L01408A  STR   'Refcon'
L014091  STR   'Height'
L014098  PEA   $0000
         PEA   $0000
         PEA   ^L0140CC
         PEA   L0140CC
         PEA   $0000
         PEA   $0000
         PEA   ^L0141F6
         PEA   L0141F6
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L0140DE
         PEA   L0140DE
         PEA   $800E
         _NewWindow2
         PLA
         PLA
         RTL

L0140CC  STR   ' Vertical Scroll '
L0140DE  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L0140CC    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L01469C    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L0141F6    ; content defproc
         DW    $0071      ; content rect
         DW    $018B
         DW    $00C4
         DW    $0276
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L01412E    ; storage ptr
         DW    $0003
L01412E  ADRL  L0141CE
         ADRL  L0141A6
         ADRL  L014186
         ADRL  L014166
         ADRL  L014146
         ADRL  $00000000
L014146  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $000A      ; rect
         DW    $007D
         DW    $0017
         DW    $00A1
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0138A8    ; defaultRef
L014166  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0019      ; rect
         DW    $007D
         DW    $0026
         DW    $00A1
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0136A8    ; defaultRef
L014186  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0028      ; rect
         DW    $007D
         DW    $0035
         DW    $00A1
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0135A8    ; defaultRef
L0141A6  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $003C      ; rect
         DW    $0014
         DW    $0049
         DW    $006E
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146AD    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L0141CE  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $003C      ; rect
         DW    $007D
         DW    $0049
         DW    $00D7
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146A6    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L0141F6  PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   ^L0142C8
         PEA   L0142C8
         _FrameRect
         _PenNormal
         PEA   $0014
         PEA   $0014
         _MoveTo
         PEA   ^L0142D7
         PEA   L0142D7
         _DrawString
         PEA   $00A7
         PEA   $0014
         _MoveTo
         PEA   ^L0142D0
         PEA   L0142D0
         _DrawString
         PEA   $0014
         PEA   $0023
         _MoveTo
         PEA   ^L0142E1
         PEA   L0142E1
         _DrawString
         PEA   $00A7
         PEA   $0023
         _MoveTo
         PEA   ^L0142D0
         PEA   L0142D0
         _DrawString
         PEA   $0014
         PEA   $0032
         _MoveTo
         PEA   ^L0142EB
         PEA   L0142EB
         _DrawString
         PEA   $00A7
         PEA   $0032
         _MoveTo
         PEA   ^L0142D0
         PEA   L0142D0
         _DrawString
         RTL

L0142C8  DW    $0002
         DW    $0004
         DW    $0051
         DW    $00E6
L0142D0  STR   'pixels'
L0142D7  STR   'Data Size'
L0142E1  STR   'Scroll by'
L0142EB  STR   'Page by'
L0142F3  PEA   $0000
         PEA   $0000
         PEA   ^L014327
         PEA   L014327
         PEA   $0000
         PEA   $0000
         PEA   ^L0141F6
         PEA   L0141F6
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L01433B
         PEA   L01433B
         PEA   $800E
         _NewWindow2
         PLA
         PLA
         RTL

L014327  STR   ' Horizontal Scroll '
L01433B  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L014327    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L01469C    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L0141F6    ; content defproc
         DW    $0071      ; content rect
         DW    $018B
         DW    $00C4
         DW    $0276
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L01438B    ; storage ptr
         DW    $0003
L01438B  ADRL  L01442B
         ADRL  L014403
         ADRL  L0143E3
         ADRL  L0143C3
         ADRL  L0143A3
         ADRL  $00000000
L0143A3  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $000A      ; rect
         DW    $007D
         DW    $0017
         DW    $00A1
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0138A8    ; defaultRef
L0143C3  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0019      ; rect
         DW    $007D
         DW    $0026
         DW    $00A1
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0136A8    ; defaultRef
L0143E3  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0028      ; rect
         DW    $007D
         DW    $0035
         DW    $00A1
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0135A8    ; defaultRef
L014403  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $003C      ; rect
         DW    $0014
         DW    $0049
         DW    $006E
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146AD    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L01442B  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $003C      ; rect
         DW    $007D
         DW    $0049
         DW    $00D7
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146A6    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L014453  PEA   $0000
         PEA   $0000
         PEA   ^L014487
         PEA   L014487
         PEA   $0000
         PEA   $0000
         PEA   ^L0145D0
         PEA   L0145D0
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L014492
         PEA   L014492
         PEA   $800E
         _NewWindow2
         PLA
         PLA
         RTL

L014487  STR   ' Size Box '
L014492  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L014487    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L01469C    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L0145D0    ; content defproc
         DW    $0071      ; content rect
         DW    $0162
         DW    $00C4
         DW    $0276
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L0144E2    ; storage ptr
         DW    $0003
L0144E2  ADRL  L0145A8
         ADRL  L014580
         ADRL  L014560
         ADRL  L014540
         ADRL  L0144FA
         ADRL  $00000000
L0144FA  DW    $000A      ; pCount
         ADRL  $00000005  ; ID
         DW    $000A      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L014524    ; titleRef
         DW    $0000      ; initialValue
         ADRL  $00000000  ; colorTableRef
         ASC   'L'        ; keyequivalent
         ASC   'l'        ; 2nd key equivalent
         DW    $0800      ; keyModifiers
         DW    $0900      ; keyCareBits
L014524  STR   'Grow/zoom don'27't move origin'
L014540  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0019      ; rect
         DW    $008C
         DW    $0026
         DW    $00B0
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0136A8    ; defaultRef
L014560  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0028      ; rect
         DW    $008C
         DW    $0035
         DW    $00B0
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L0135A8    ; defaultRef
L014580  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $003C      ; rect
         DW    $0020
         DW    $0049
         DW    $007A
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146AD    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L0145A8  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $003C      ; rect
         DW    $009A
         DW    $0049
         DW    $00F4
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0146A6    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L0145D0  PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   ^L01466E
         PEA   L01466E
         _FrameRect
         _PenNormal
         PEA   $0014
         PEA   $0023
         _MoveTo
         PEA   ^L01467D
         PEA   L01467D
         _DrawString
         PEA   $00B8
         PEA   $0023
         _MoveTo
         PEA   ^L014676
         PEA   L014676
         _DrawString
         PEA   $0014
         PEA   $0032
         _MoveTo
         PEA   ^L01468C
         PEA   L01468C
         _DrawString
         PEA   $00B8
         PEA   $0032
         _MoveTo
         PEA   ^L014676
         PEA   L014676
         _DrawString
         RTL

L01466E  DW    $0002
         DW    $0004
         DW    $0051
         DW    $0110
L014676  STR   'pixels'
L01467D  STR   'Max grow width'
L01468C  STR   'Max grow height'
L01469C  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $00F0
         DW    $00F0
L0146A6  STR   'Change'
L0146AD  STR   'Cancel'
L0146B4  ENT
         DB    $00
         DB    $00
L0146B6  ENT
         DB    $00
         DB    $00
L0146B8  ENT
         DB    $00
         DB    $00
L0146BA  ENT
         DB    $00
         DB    $00
L0146BC  ENT
         DB    $00
         DB    $00
L0146BE  ENT
         DB    $00
         DB    $00
L0146C0  ENT
         DB    $00
         DB    $00
L0146C2  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0147C4  LDA   $01,S
         PHA
         LDA   $05,S
         STA   $03,S
         PHD
         TSC
         TCD
         LDA   $0A
         PHA
         LDA   $08
         PHA
         LDA   #$0014
         STA   $06
         LDX   #$0000
         JSR   L014A74
         STA   $08
         STX   $0A
         BCS   L014818
         PHX
         PHA
         LDA   $06
         PHA
         PEA   $0001
         _Long2Dec
         BCC   L0147FA
         STZ   $06
         BRA   L014816
L0147FA  LDY   #$0000
         SEP   #$20
L0147FF  LDA   #$20
         CMP   [$08],Y
         BNE   L01480A
         INY
         DEC   $06
         BNE   L0147FF
L01480A  REP   #$20
         TYA
         CLC
         ADC   $08
         STA   $08
         BCC   L014816
         INC   $0A
L014816  PLD
         RTL

L014818  PEA   $0005
         JSL   L014F26
         STZ   $06
         PLA
         BRA   L014816
L014824  TDC
         TAX
         TSC
         SEC
         SBC   #$FFFF
         TCD
         DEC
         TCS
         PHX
         PEA   $0000
         LDA   $07
         PHA
         LDA   $05
         PHA
         LDA   $03
         PHA
         JSR   L014EC5
         PEA   $0001
         _Dec2Int
         PLX
         LDA   $01
         STA   $07
         LDA   $00
         STA   $06
         CLC
         TDC
         ADC   #$0005
         PLD
         TCS
         TXA
         RTL

L01485A  ENT
         TDC
         TAX
         TSC
         SEC
         SBC   #$0015
         TCD
         DEC
         TCS
         PHX
         LDA   $19
         DEC
         STA   $06
         ASL
         ADC   $06
         ASL
         STA   $06
         STA   $08
         LDA   $19
         STA   $14
         STZ   $00
L014878  LDX   $08
         LDA   $1F,X
         PHA
         LDA   $1D,X
         PHA
         LDA   $1B,X
         PHA
         JSL   L014ADD
         CLC
         ADC   $00
         STA   $00
         SEC
         LDA   $08
         SBC   #$0006
         STA   $08
         DEC   $14
         BNE   L014878
         LDA   $00
         BPL   L01489F
         LDA   #$7FFF
L01489F  BEQ   L0148FA
         LDX   #$0000
         JSR   L014A74
         STA   $02
         STX   $04
         BCS   L01491E
         LDA   $06
         STA   $08
         LDA   $19
         STA   $14
         STZ   $00
L0148B7  LDX   $08
         LDA   $1F,X
         PHA
         LDA   $1D,X
         PHA
         LDA   $1B,X
         PHA
         JSR   L014EC5
         PLA
         BNE   L0148CC
         PLA
         PLA
         BRA   L0148D9
L0148CC  STA   $0A
         PLA
         STA   $0C
         PLA
         STA   $0E
         JSR   L014929
         BCS   L01491A
L0148D9  SEC
         LDA   $08
         SBC   #$0006
         STA   $08
         DEC   $14
         BNE   L0148B7
         LDA   $00
         CMP   #$0001
         BNE   L0148FA
         LDA   [$02]
         AND   #$00FF
         STA   $04
         LDA   #$FFFF
         STA   $00
         STA   $02
L0148FA  LDX   $06
         LDA   $00
         STA   $1B,X
         LDA   $02
         STA   $1D,X
         LDA   $04
         STA   $1F,X
         LDA   $17
         STA   $19,X
         LDA   $16
         STA   $18,X
         CLC
         TDC
         ADC   $06
         ADC   #$0017
         PLD
         TCS
         RTL

L01491A  DEC   $00
         BRA   L0148FA
L01491E  PEA   $0005
         JSL   L014F26
         STZ   $00
         BRA   L0148FA
L014929  CLC
         LDA   $0A
         ADC   $00
         BPL   L01493B
         SEC
         PHP
         LDA   #$7FFF
         SBC   $00
         STA   $0A
         BRA   L01493D
L01493B  CLC
         PHP
L01493D  LDY   $0A
         BEQ   L01497B
         CLC
         LDA   $00
         ADC   $02
         STA   $10
         LDA   #$0000
         ADC   $04
         STA   $12
         CLC
         LDA   $00
         ADC   $0A
         STA   $00
         TYA
         LSR
         BCC   L014971
         SEP   #$20
         LDA   [$0C]
         STA   [$10]
         REP   #$20
         INC   $0C
         BNE   L014968
         INC   $0E
L014968  INC   $10
         BNE   L01496E
         INC   $12
L01496E  DEY
         BEQ   L01497B
L014971  DEY
         DEY
L014973  LDA   [$0C],Y
         STA   [$10],Y
         DEY
         DEY
         BPL   L014973
L01497B  PLP
         RTS

L01497D  ENT
         TDC
         TAX
         TSC
         SEC
         SBC   #$000F
         TCD
         DEC
         TCS
         PHX
         LDA   $13
         BNE   L01498F
         BRL   L014A25
L01498F  LDA   $15
         BNE   L014996
         BRL   L014A25
L014996  LDA   $1B
         PHA
         LDA   $19
         PHA
         LDA   $17
         PHA
         JSR   L014EC5
         PLA
         STA   $0E
         PLA
         STA   $0A
         PLA
         STA   $0C
         LDA   $0E
         BEQ   L014A25
         LDA   $15
         CMP   $0E
         BEQ   L0149B7
         BCS   L014A25
L0149B7  DEC   $15
         CLC
         LDA   $15
         ADC   $13
         STA   $00
         CMP   $0E
         BCS   L014A0B
         SEC
         LDA   $0E
         SBC   $00
         BEQ   L014A25
         TAX
         CLC
         LDA   $15
         ADC   $0A
         STA   $02
         LDA   #$0000
         ADC   $0C
         STA   $04
         CLC
         LDA   $00
         ADC   $0A
         STA   $06
         LDA   #$0000
         ADC   $0C
         STA   $08
         CLC
         TXA
         ADC   $15
         STA   $15
         LDY   #$0000
         TXA
         LSR
         TAX
         BCC   L014A02
         SEP   #$20
         LDA   [$06]
         STA   [$02]
         REP   #$20
         INY
         TXA
         BEQ   L014A0B
L014A02  LDA   [$06],Y
         STA   [$02],Y
         INY
         INY
         DEX
         BNE   L014A02
L014A0B  LDA   $17
         INC
         BPL   L014A1A
         SEP   #$20
         LDA   $15
         STA   [$19]
         REP   #$20
         BRA   L014A25
L014A1A  LDA   #$0000
         LDY   $15
         SEP   #$20
         STA   [$0A],Y
         REP   #$20
L014A25  LDA   $11
         STA   $1B
         LDA   $10
         STA   $1A
         CLC
         TDC
         ADC   #$0019
         PLD
         TCS
         RTL

L014A35  ENT
         LDA   $02
         PHA
         LDA   $00
         PHA
         PHB
         PHK
         PLB
         LDA   L014E8F
         STA   $02
         LDA   L014E8D
         STA   $00
L014A48  LDA   $00
         ORA   $02
         BEQ   L014A66
         LDA   $02
         PHA
         LDA   $00
         PHA
         LDY   #$0002
         LDA   [$00]
         TAX
         LDA   [$00],Y
         STA   $02
         STX   $00
         JSL   L01519E
         BRA   L014A48
L014A66  STZ   L014E8D
         STZ   L014E8F
         PLB
         PLA
         STA   $00
         PLA
         STA   $02
         RTL

L014A74  PHB
         PHK
         PLB
         CLC
         ADC   #$0004
         BCC   L014A7E
         INX
L014A7E  PHX
         PHA
         JSL   L014C1B
         STA   L014AD9
         STX   L014ADB
         ORA   L014ADB
         BEQ   L014AD6
         LDA   $02
         PHA
         LDA   $00
         PHA
         LDA   L014ADB
         STA   $02
         LDA   L014AD9
         STA   $00
         LDA   L014E8D
         STA   [$00]
         LDY   #$0002
         LDA   L014E8F
         STA   [$00],Y
         LDA   L014ADB
         STA   L014E8F
         LDA   L014AD9
         STA   L014E8D
         CLC
         LDA   L014AD9
         ADC   #$0004
         STA   L014AD9
         BCC   L014AC7
         INC   L014ADB
L014AC7  PLA
         STA   $00
         PLA
         STA   $02
         LDA   L014AD9
         LDX   L014ADB
         PLB
         CLC
         RTS

L014AD6  PLB
         SEC
         RTS

L014AD9  BRK   $00
L014ADB  BRK   $00
L014ADD  ENT
         PHD
         TSC
         TCD
         LDY   #$0000
         LDA   $06
         BPL   L014AFE
         CMP   #$FFFF
         BNE   L014AF6
         LDY   #$0001
         LDA   $0A
         BNE   L014B0D
         DEY
         BRA   L014B0D
L014AF6  LDA   [$08]
         AND   #$00FF
         TAY
         BRA   L014B0D
L014AFE  BEQ   L014B0D
         SEP   #$20
L014B02  LDA   [$08],Y
         BEQ   L014B0B
         INY
         CPY   $06
         BCC   L014B02
L014B0B  REP   #$20
L014B0D  LDA   $02
         STA   $08
         LDA   $04
         STA   $0A
         PLD
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         RTL

L014B1E  ENT
         TDC
         TAX
         TSC
         SEC
         SBC   #$FFFF
         TCD
         DEC
         TCS
         PHX
         LDA   $03
         LSR
         BCC   L014B44
         SEP   #$20
         LDA   [$05]
         STA   [$09]
         REP   #$20
         INC   $05
         BNE   L014B3C
         INC   $07
L014B3C  INC   $09
         BNE   L014B42
         INC   $0B
L014B42  DEC   $03
L014B44  LDY   $03
         BEQ   L014B58
         DEY
         DEY
         BEQ   L014B54
L014B4C  LDA   [$05],Y
         STA   [$09],Y
         DEY
         DEY
         BNE   L014B4C
L014B54  LDA   [$05]
         STA   [$09]
L014B58  LDA   $01
         STA   $0B
         LDA   $00
         STA   $0A
         CLC
         TDC
         ADC   #$0009
         PLD
         TCS
         RTL

L014B68  ENT
         TDC
         TAX
         TSC
         SEC
         SBC   #$0005
         TCD
         DEC
         TCS
         PHX
         LDA   $09
         CMP   $0F
         BNE   L014B95
         LDA   $13
         PHA
         LDA   $11
         PHA
         LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         BPL   L014B8E
         EOR   #$FFFF
         INC
         INC
L014B8E  PHA
         JSL   L014B1E
         BRA   L014C0B
L014B95  LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         PHA
         JSR   L014EC5
         PLA
         STA   $09
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDA   $13
         STA   $04
         LDA   $11
         STA   $02
         LDA   $0F
         BPL   L014BC0
         EOR   #$FFFF
         INC
         INC   $11
         BNE   L014BC0
         INC   $13
L014BC0  CMP   $09
         BCC   L014BC6
         LDA   $09
L014BC6  TAY
         STA   $00
         BEQ   L014BEF
         LSR
         BCC   L014BE5
         SEP   #$20
         LDA   [$0B]
         STA   [$11]
         REP   #$20
         INC   $0B
         BNE   L014BDC
         INC   $0D
L014BDC  INC   $11
         BNE   L014BE2
         INC   $13
L014BE2  DEY
         BEQ   L014BEF
L014BE5  DEY
         DEY
L014BE7  LDA   [$0B],Y
         STA   [$11],Y
         DEY
         DEY
         BPL   L014BE7
L014BEF  LDY   $0F
         BPL   L014BFD
         SEP   #$20
         LDA   $00
         STA   [$02]
         REP   #$20
         BRA   L014C0B
L014BFD  LDY   $00
         CPY   $0F
         BCS   L014C0B
         SEP   #$20
         LDA   #$00
         STA   [$02],Y
         REP   #$20
L014C0B  LDA   $07
         STA   $13
         LDA   $06
         STA   $12
         CLC
         TDC
         ADC   #$0011
         PLD
         TCS
         RTL

L014C1B  LDA   $06,S
         TAX
         LDA   $04,S
         CPX   #$0000
         BNE   L014C35
         CMP   #$0FFC
         BCS   L014C35
         CMP   #$0000
         BEQ   L014C39
         JSL   L014C46
         BRA   L014C39
L014C35  JSL   L014D57
L014C39  TAY
         LDA   $00,S
         STA   $04,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         TYA
         RTL

L014C46  PHA
         CLC
         ADC   #$0004
         PHA
         TSC
         SEC
         SBC   #$000A
         TCS
         PHD
         TCD
         LDA   #$0008
L014C57  CMP   $0B
         BCS   L014C5E
         ASL
         BRA   L014C57
L014C5E  STA   $0D
         JSL   L01532D
         STX   $09
         STX   $0B
L014C68  LDX   $0B
         LDAL  L015176,X
         ORAL  L015178,X
         BNE   L014CC3
         CPX   #$0024
         BCC   L014CB7
         LDA   #$1000
         LDX   #$0000
         JSL   L014D57
         STA   $01
         STAL  L01519A
         STX   $03
         TXA
         STAL  L01519C
         ORA   $01
         BNE   L014C97
         BRL   L014D42
L014C97  LDA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   #$1000
         STA   [$01],Y
         INY
         INY
         LDA   #$0000
         STA   [$01],Y
         INY
         INY
         STA   [$01],Y
         LDA   $0B
         CMP   $09
         BEQ   L014D23
         BRA   L014D18
L014CB7  CLC
         LDA   $0B
         ADC   #$0004
         STA   $0B
         ASL   $0D
         BRA   L014D18
L014CC3  LDX   $0B
         CPX   $09
         BCC   L014D10
         BEQ   L014D10
         LDAL  L015178,X
         STA   $03
         LDAL  L015176,X
         STA   $01
         LDY   $0D
         LDX   $03
         JSL   L014DF2
         LSR   $0D
         CLC
         LDA   $01
         ADC   $0D
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   $0D
         STA   [$05],Y
         STA   [$01],Y
         ORA   [$01]
         STA   [$05]
         LDY   $0D
         LDA   $01
         LDX   $03
         JSL   L01533E
         LDY   $0D
         LDA   $05
         LDX   $07
         JSL   L01533E
L014D10  SEC
         LDA   $0B
         SBC   #$0004
         STA   $0B
L014D18  LDA   $0B
         BMI   L014D23
         CMP   $09
         BCC   L014D23
         BRL   L014C68
L014D23  LDX   $09
         LDAL  L015176,X
         STA   $01
         LDAL  L015178,X
         STA   $03
         LDY   $0D
         LDX   $03
         LDA   $01
         JSL   L014DF2
         LDA   [$01]
         AND   #$7FFF
         STA   [$01]
L014D42  LDA   $01
         LDX   $03
         CLC
         ADC   #$0004
         BCC   L014D4D
         INX
L014D4D  TAY
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L014D57  CLC
         ADC   #$000E
         BCC   L014D5E
         INX
L014D5E  PHA
         PHA
         PHX
         PHA
         LDAL  L014E89
         PHA
         PEA   $C010
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L014D80
         PLA
         PLA
         LDA   #$0000
         TAX
         RTL

L014D80  PHA
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$05]
         STA   $01
         LDA   [$05],Y
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDAL  L015172
         INY
         INY
         STA   [$01],Y
         LDAL  L015174
         INY
         INY
         STA   [$01],Y
         INY
         INY
         LDA   $05
         STA   [$01],Y
         INY
         INY
         LDA   $07
         STA   [$01],Y
         INY
         INY
         LDA   #$0000
         STA   [$01],Y
         LDAL  L015172
         STA   $05
         LDAL  L015174
         STA   $07
         ORA   $05
         BEQ   L014DD5
         LDY   #$0002
         LDA   $01
         STA   [$05]
         LDA   $03
         STA   [$05],Y
L014DD5  LDA   $01
         STAL  L015172
         LDA   $03
         STAL  L015174
         CLC
         LDA   $01
         ADC   #$000E
         LDX   $03
         BCC   L014DEC
         INX
L014DEC  PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L014DF2  PHX
         PHA
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L01532D
         LDAL  L015176,X
         STA   $05
         LDAL  L015178,X
         STA   $07
L014E0F  LDA   $05
         CMP   $09
         BNE   L014E1B
         LDA   $07
         CMP   $0B
         BEQ   L014E32
L014E1B  LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         LDY   #$0004
         LDA   [$01],Y
         STA   $05
         INY
         INY
         LDA   [$01],Y
         STA   $07
         BRA   L014E0F
L014E32  LDY   #$0004
         LDA   $01
         ORA   $02
         BNE   L014E4B
         LDA   [$05],Y
         STAL  L015176,X
         INY
         INY
         LDA   [$05],Y
         STAL  L015178,X
         BRA   L014E55
L014E4B  LDA   [$05],Y
         STA   [$01],Y
         INY
         INY
         LDA   [$05],Y
         STA   [$01],Y
L014E55  PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L014E69
L014E69  DB    $00
         DB    $00
         ADRL  L014E6F
L014E6F  DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L014E77
L014E77  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L014E87  ENT
         DB    $00
         DB    $00
L014E89  DB    $00
         DB    $00
         DB    $00
         DB    $00
L014E8D  DB    $00
         DB    $00
L014E8F  DB    $00
         DB    $00
L014E91  DB    $00
         DB    $00
L014E93  DB    $00
         DB    $00
L014E95  DB    $00
L014E96  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L014EA3  PHA
         JSL   L015369
         LDAL  L014E89
         PHA
         _DisposeAll
         PLA
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L014EBF
L014EBF  ADRL  L014EC3    ;  path name
L014EC3  DW    $0000      ;  flags
L014EC5  PHD
         TSC
         TCD
         LDA   $05
         BEQ   L014F15
         BPL   L014F02
         INC
         BNE   L014EF3
         LDA   $09
         AND   #$00FF
         BNE   L014EDC
         STZ   $05
         BRA   L014F15
L014EDC  LDA   #$0001
         STA   $05
         LDA   $09
         STAL  L014F17
         LDA   #L014F17
         STA   $07
         LDA   #^L014F17
         STA   $09
         BRA   L014F15
L014EF3  LDA   [$07]
         AND   #$00FF
         STA   $05
         INC   $07
         BNE   L014F00
         INC   $09
L014F00  BRA   L014F15
L014F02  LDX   $05
         LDY   #$0000
         SEP   #$20
L014F09  LDA   [$07],Y
         BEQ   L014F11
         INY
         DEX
         BNE   L014F09
L014F11  STY   $05
         REP   #$20
L014F15  PLD
         RTS

L014F17  DW    $0000
L014F19  ENT
         PEA   $0008
         JSL   L014F26
         LDA   #$FFFF
         JMP   L014EA3

L014F26  LDA   $04,S
         PHA
         JSL   L015049
         JMPL  L014F31

L014F31  PHK
         PLB
         LDA   L014E95
         BNE   L014F3B
         BRL   L015043
L014F3B  BRA   L014F55
L014F3D  STR   'Error occurred at line '
L014F55  PEA   ^L014F3D
         PEA   L014F3D
         _ErrWriteString
         LDA   L014E95
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         JSL   L01545A
         BRA   L014F84
L014F75  STR   ' in procedure '
L014F84  PEA   ^L014F75
         PEA   L014F75
         _ErrWriteString
         PEA   ^L014E96
         PEA   L014E96
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L01548A
         JSL   L01537E
         LDA   L014E91
         ORA   L014E93
         BNE   L014FB3
         BRL   L015043
L014FB3  PEA   $000D
         _ErrWriteChar
         PEA   $000A
         _ErrWriteChar
         BRA   L014FD6
L014FC9  STR   '  Line  Name'
L014FD6  PEA   ^L014FC9
         PEA   L014FC9
         _ErrWriteLine
         BRA   L014FF2
L014FE5  STR   '  ----  ----'
L014FF2  PEA   ^L014FE5
         PEA   L014FE5
         _ErrWriteLine
L014FFF  LDA   L014E91
         ORA   L014E93
         BEQ   L015043
         LDA   L014E95
         PHA
         PEA   $0006
         PEA   $0000
         PEA   $0001
         JSL   L01545A
         BRA   L01501D
L01501A  STR   '  '
L01501D  PEA   ^L01501A
         PEA   L01501A
         _ErrWriteString
         PEA   ^L014E96
         PEA   L014E96
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L01548A
         JSL   L01537E
         BRA   L014FFF
L015043  LDA   #$FFFF
         BRL   L014EA3
L015049  PHD
         PEA   ^L015073
         PEA   L015073
         TSC
         TCD
         LDX   $0A
L015054  DEX
         BEQ   L015063
         SEC
         LDA   [$01]
         AND   #$00FF
         ADC   $01
         STA   $01
         BRA   L015054
L015063  _ErrWriteLine
         PLD
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         RTL

L015073  STR   'Subrange exceeded'
         STR   'File is not open'
         STR   'Read while at end of file'
         STR   'I/O error'
         STR   'Out of memory'
         STR   'EOLN while at end of file'
         STR   'Set overflow'
         STR   'Jump to undefined case statement label'
         STR   'Integer math error'
         STR   'Real math error'
         STR   'Underflow'
         STR   'Overflow'
         STR   'Divide by zero'
         STR   'Inexact'
         STR   'Stack overflow'
L015172  DB    $00
         DB    $00
L015174  DB    $00
         DB    $00
L015176  DB    $00
         DB    $00
L015178  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L01519A  DB    $00
         DB    $00
L01519C  DB    $00
         DB    $00
L01519E  TSC
         PHD
         TCD
         LDY   $04
         LDX   $06
         SEC
         TYA
         SBC   #$0002
         STA   $04
         BCS   L0151B0
         DEC   $06
L0151B0  LDA   [$04]
         BNE   L0151BB
         TYA
         JSL   L0152B9
         BRA   L0151C0
L0151BB  TYA
         JSL   L0151CC
L0151C0  LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L0151CC  PHA
         PHA
         PHA
         SEC
         SBC   #$0004
         BCS   L0151D6
         DEX
L0151D6  PHX
         PHA
         TSC
         PHD
         TCD
         LDA   [$01]
         BPL   L0151E2
         BRL   L0152B1
L0151E2  LDA   [$01]
         ORA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   [$01],Y
         STA   $09
         TAY
         LDA   $01
         LDX   $03
         JSL   L01533E
L0151F9  LDA   $09
         CMP   #$1000
         BCC   L015203
         BRL   L01529F
L015203  LDA   [$01]
         AND   $09
         BEQ   L01525A
         SEC
         LDA   $01
         SBC   $09
         STA   $05
         LDA   $03
         SBC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BEQ   L015223
         BRL   L0152B1
L015223  LDA   [$05]
         BMI   L01522A
         BRL   L0152B1
L01522A  LDY   $09
         LDX   $03
         LDA   $01
         JSL   L014DF2
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L014DF2
         LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         ASL   $09
         LDA   $09
         LDY   #$0002
         STA   [$01],Y
         TAY
         LDA   $01
         LDX   $03
         JSL   L01533E
         BRA   L0151F9
L01525A  CLC
         LDA   $01
         ADC   $09
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BNE   L0152B1
         LDA   [$05]
         BPL   L0152B1
         LDY   $09
         LDX   $03
         LDA   $01
         JSL   L014DF2
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L014DF2
         ASL   $09
         LDY   #$0002
         LDA   $09
         STA   [$01],Y
         LDY   $09
         LDA   $01
         LDX   $03
         JSL   L01533E
         BRL   L0151F9
L01529F  LDY   $09
         LDA   $01
         LDX   $03
         JSL   L014DF2
         LDA   $01
         LDX   $03
         JSL   L0152B9
L0152B1  PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         RTL

L0152B9  PHA
         PHA
         SEC
         SBC   #$000E
         BCS   L0152C2
         DEX
L0152C2  PHX
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$01],Y
         ORA   [$01]
         BNE   L0152E3
         LDY   #$0004
         LDA   [$01],Y
         STAL  L015172
         INY
         INY
         LDA   [$01],Y
         STAL  L015174
         BRA   L0152F8
L0152E3  LDA   [$01]
         STA   $05
         LDA   [$01],Y
         STA   $07
         LDY   #$0004
         LDA   [$01],Y
         STA   [$05],Y
         INY
         INY
         LDA   [$01],Y
         STA   [$05],Y
L0152F8  LDY   #$0004
         LDA   [$01],Y
         TAX
         INY
         INY
         ORA   [$01],Y
         BEQ   L015315
         LDA   [$01],Y
         STA   $07
         STX   $05
         LDY   #$0002
         LDA   [$01]
         STA   [$05]
         LDA   [$01],Y
         STA   [$05],Y
L015315  LDY   #$000A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         _DisposeHandle
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L01532D  LDX   #$0000
         DEC
         LSR
         LSR
         LSR
         BEQ   L01533D
L015336  INX
         INX
         INX
         INX
         LSR
         BNE   L015336
L01533D  RTL

L01533E  PHX
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L01532D
         LDY   #$0004
         LDAL  L015176,X
         STA   [$01],Y
         INY
         INY
         LDAL  L015178,X
         STA   [$01],Y
         LDA   $01
         STAL  L015176,X
         LDA   $03
         STAL  L015178,X
         PLD
         PLA
         PLA
         RTL

L015369  PHB
         PHK
         PLB
         STZ   L015172
         STZ   L015174
         LDX   #$0026
L015375  STZ   L015176,X
         DEX
         DEX
         BPL   L015375
         PLB
         RTL

L01537E  PHB
         PHK
         PLB
         LDA   L014E93
         STA   $02
         LDA   L014E91
         STA   $00
         LDY   #$0010
L01538E  LDA   [$00],Y
         STA   L014E91,Y
         DEY
         DEY
         BPL   L01538E
         LDA   $02
         PHA
         LDA   $00
         PHA
         JSL   L01519E
         PLB
         RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0153AF  ENT
         LDY   #$0000
         BIT   #$8000
         BEQ   L0153BC
         EOR   #$FFFF
         INC
         INY
L0153BC  PHA
         TXA
         BEQ   L0153F7
         BPL   L0153C7
         DEY
         EOR   #$FFFF
         INC
L0153C7  PHA
         PHY
         TSC
         PHD
         TCD
         LDA   #$0000
         LDY   #$0010
L0153D2  ASL   $05
         ROL
         SEC
         SBC   $03
         BCS   L0153E1
         ADC   $03
         DEY
         BNE   L0153D2
         BRA   L0153E6
L0153E1  INC   $05
         DEY
         BNE   L0153D2
L0153E6  TAX
         LDA   $05
         LDY   $01
         BEQ   L0153F1
         EOR   #$FFFF
         INC
L0153F1  CLV
         PLD
         PLY
         PLY
         PLY
         RTL

L0153F7  PLA
         SEP   #$40
         RTL

L0153FB  ENT
         TAY
         PHD
         TSC
         SEC
         SBC   #$0007
         TCD
         DEC
         TCS
         TYA
         LDY   #$0000
         BIT   #$8000
         BEQ   L015413
         EOR   #$FFFF
         INC
         INY
L015413  STA   $02
         TXA
         BPL   L01541D
         DEY
         EOR   #$FFFF
         INC
L01541D  STA   $04
         STY   $06
         LDY   #$0010
         LDA   #$0000
L015427  LSR   $02
         BCC   L01542E
         CLC
         ADC   $04
L01542E  ROR
         ROR   $00
         DEY
         BNE   L015427
         TAX
         BNE   L01544F
         LDA   $00
         BMI   L01544F
         LDY   $06
         BEQ   L015443
         EOR   #$FFFF
         INC
L015443  TAY
         TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         TYA
         CLV
         RTL

L01544F  TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         SEP   #$40
         RTL

L01545A  TSC
         PHD
         TCD
         PEA   ^L0154E6
         PEA   L0154E6
         LDA   $0A
         JSL   L0154CF
         PEA   ^L0154E6
         PEA   L0154E6
         LDA   $08
         PHA
         LDA   $06
         PHA
         LDA   $04
         PHA
         JSL   L01548A
         LDA   $02
         STA   $0A
         LDA   $00
         STA   $08
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L01548A  TSC
         PHD
         TCD
         INC   $0A
         BNE   L015493
         INC   $0C
L015493  LDA   [$0A]
         AND   #$00FF
         SEC
         SBC   $08
         BPL   L0154A7
         EOR   #$FFFF
         INC
         LDY   $04
         JSL   L015585
L0154A7  LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   $06
         EOR   #$0001
         ASL
         ORA   $04
         XBA
         CLC
         ADC   #$1A0C
         TAX
         JSL   $E10000
         LDA   $02
         STA   $0C
         LDA   $00
         STA   $0A
         PLD
         CLC
         TSC
         ADC   #$000A
         TCS
         RTL

L0154CF  PHA
         PEA   ^L015510
         PEA   L015510
         PEA   $0028
         PEA   $0001
         _Int2Dec
         JMP   L015538

L0154E6  DB    $28
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L015510  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L015538  PHD
         TSC
         TCD
         SEP   #$20
         LDX   #$0000
         LDA   #$20
L015542  CMPL  L015510,X
         BNE   L01554B
         INX
         BRA   L015542
L01554B  REP   #$20
         TXA
         SEC
         SBC   #$0028
         EOR   #$FFFF
         INC
         SEP   #$20
         CMP   [$06]
         BEQ   L01555E
         BCS   L015575
L01555E  LDY   #$0001
         STA   [$06],Y
L015563  LDAL  L015510,X
         INY
         STA   [$06],Y
         INX
         CPX   #$0028
         BCC   L015563
         REP   #$20
         CLV
         BRA   L015579
L015575  REP   #$20
         SEP   #$40
L015579  LDA   $02,S
         STA   $06,S
         LDA   $04,S
         STA   $08,S
         PLD
         PLA
         PLA
         RTL

L015585  PHA
         TYA
         XBA
         CLC
         ADC   #$180C
         PHA
         PHD
         TSC
         TCD
L015590  PEA   $0020
         LDX   $03
         JSL   $E10000
         DEC   $05
         BNE   L015590
         PLD
         PLA
         PLA
         RTL

