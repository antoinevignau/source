*
* MicroDrive Turbo
* (c) 1996-2006, Joachim Lange
* (s) 2019, Brutal Deluxe Software
*

         mx    %11
         org   $c800
         dsk   FW3.NEW
         lst   off

*----------------------------

         use   4/Mem.Macs
         use   4/Util.Macs

*----------------------------

SLOT161  =     $C1        ; This is for slot 1

MSLOT    EQU   $07F8
SPKR     EQU   $C030
INIT     EQU   $FB2F
SETTXT   EQU   $FB39
HOME     EQU   $FC58
COUT1    EQU   $FDF0
SETKBD   EQU   $FE89
SETVID   EQU   $FE93

*----------------------------

LC800    LDY   #$20
         LDY   #$00
         LDY   #$03
         LDY   #$00
         CLD
LC809    JSR   SETKBD
LC80C    JSR   SETVID
         JSR   INIT
         JSR   HOME
         LDA   #SLOT161
         STA   MSLOT
LC81A    LDA   LCFFF
         STZ   $C092
         JMP   LCA01

LC823    CLV
         BVC   LC828
         SEP   #$40
LC828    LDA   #SLOT161
         STA   MSLOT
         LDA   LCFFF
         STZ   $C092
         LDA   LC980
         EOR   #$82
         CMP   LC981
LC83B    BEQ   LC842
         PHP
LC83E    JSR   LCA01
         PLP
LC842    BVS   LC847
         JMP   LCA01

LC847    LDA   #$01
         STA   $C092
         CLC
         XCE
         REP   #$30
         LDA   $42
         STA   LC9E0
         LDA   $44
         STA   LC9E0+2
         LDA   $46
         STA   LC9E4
         LDA   $48
         STA   LC9E5+1
         LDA   $4A
         STA   LC9E5+3
         LDA   $4C
         STA   LC9EA
         LDA   $4E
         STA   LC9EA+2
         LDA   $50
         STA   LC9EE
         SEP   #$30
         LDY   #$01
         LDA   ($01,S),Y
LC87E    STA   LC925
         BIT   LC925
         BVC   LC889
         JMP   LCA01

LC889    INY
         REP   #$20
         LDA   ($01,S),Y
         STA   $4C
         TSX
         LDA   $0101,X
         CLC
         ADC   #$0003
         STA   $0101,X
         SEP   #$20
         LDY   #$01
         LDA   ($4C),Y
         STA   LC927
         CMP   LC81A
         BCC   LC8AD
         BEQ   LC8AD
         BCS   LC8DC
LC8AD    INY
         REP   #$20
         LDA   ($4C),Y
         STA   $44
         SEP   #$20
         INY
         LDA   LC925
         CMP   #$04
         BEQ   LC8E5
         CMP   #$03
         BEQ   LC8E5
         BCS   LC8E2
         CMP   #$01
         BCC   LC8D2
         INY
         REP   #$20
         LDA   ($4C),Y
         STA   $46
         SEP   #$20
         INY
LC8D2    INY
         LDA   ($4C),Y
         STA   $48
         BCC   LC8DF
         JMP   LCA01
LC8DC    JMP   LCA01
LC8DF    JMP   LCA01
LC8E2    JMP   LCA01

LC8E5    CLC
LC8E6    STZ   LC92B
LC8E9    JMP   LCA01

         DB    $01
LC8ED    DB    $03
LC8EE    DB    $07
         DB    $0F
LC8F0    DB    $FF
         DB    $FF
LC8F2    DB    $C9
         DB    $C4
LC8F4    DB    $D5
         DB    $10
LC8F6    DB    $00
LC8F7    DB    $CD
         DB    $D4
         DB    $CA
         DB    $CC
         DB    $80
         DB    $00
         DB    $00
         DB    $3F
LC8FF    DB    LC823

*----------------------------

LC900    DB    $CA
         DB    $CC
         DB    $64
         DB    $02
         DB    $64
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $05
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC912    DB    $01
         DB    $00
LC914    DB    $01
         DB    $00
LC916    DB    $05
         DB    $00
         DB    $03
         DB    $00
         DB    $08
         DB    $00
LC91C    DB    $01
         DB    $00
LC91E    DB    $03
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $00
         DB    $01
LC925    DB    $00
         DB    $40
LC927    DB    $00
         DB    $01
         DB    $00
         DB    $01
LC92B    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC931    DB    $00
LC932    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC980    DB    $00
LC981    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC9C1    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

*----------------------------

LC9E0    JSL   $000000
LC9E4    RTS

LC9E5    JSL   $000000
         RTS

LC9EA    JSL   $000000
LC9EE    RTS

*----------------------------

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

*----------------------------

LCA00    DB    $02
LCA01    DB    $00
         DB    $02

LCA03    CLC
         XCE
         PHK
         PLB
         REP   #$30
         LDX   #$000E
LCA0C    LDA   $18,X
         STA   LC900,X
         DEX
         DEX
         BPL   LCA0C
         LDA   LC8F7
         AND   #$00FF
         BNE   LCA66
         LDA   LC8F6
         CMP   #$0002
         BCC   LCA66
         CMP   #$00E0
         BEQ   LCA34
         CMP   #$00E1
         BEQ   LCA34
         CMP   #$0080
         BCS   LCA66
LCA34    LDA   LC8F6
         PHA
         LDA   LC8F4
         PHA
         _CheckHandle
         BCS   LCA66
         LDA   LC8F6
         STA   $1A
         LDA   LC8F4
         STA   $18
         LDY   #$0000
         LDA   [$18],Y
         CMP   LC8F0
         BNE   LCA66
         LDY   #$0002
         LDA   [$18],Y
         CMP   LC8F2
         BNE   LCA66
         JMP   LCBDE

LCA66    JSR   LCF71
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0D90
         PEA   $0003
         PEA   $C01C
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLX
         PLY
         BCS   LCAA8
         STX   $18
         STY   $1A
         STX   LC8F4
         STY   LC8F6
         LDY   #$0000
         LDA   [$18],Y
         STA   LC8F0
         INY
         INY
         LDA   [$18],Y
         STA   LC8F2
         JMP   LCADD

LCAA8    SEC
         XCE
         MX    %11
         JSR   HOME
         JSR   SETTXT
         LDY   #$00
LCAB2    LDA   LCABE,Y
         BEQ   LCABD
         JSR   COUT1
         INY
         BNE   LCAB2
LCABD    DB    $00

LCABE    ASC   "IDE Card Memory Request Error"8D00

*----------------------------

         MX    %00

LCADD    LDA   LC8F0
         LDY   LC8F2
         STA   $1C
         STY   $1E
         LDY   #$0000
         SEP   #$20
LCAEC    LDA   LCC4D,Y
         STA   [$1C],Y
         INY
         CPY   #$000B
         BCC   LCAEC
         REP   #$20
         JSR   LCC37
         SEP   #$20
         LDX   #$0000
         LDY   #$0000
LCB04    LDA   LCC58,X
         STA   [$1C],Y
         INX
         INY
         CPX   #$0010
         BCC   LCB04
         REP   #$20
         JSR   LCC37
         LDA   LCC43
         LDY   #$0000
         JSR   LCC29
         STZ   LC912
         LDX   #$0100
         LDY   #$0001
LCB27    LDA   LC912
         STA   [$1C],Y
         INY
         INY
         INY
         INY
         INY
         INC   LC912
         INC   LC912
         DEX
         BNE   LCB27
         LDY   #$0003
         LDA   LCC46
         JSR   LCC29
         DEY
         DEY
         DEY
         JSR   LCC37
         SEP   #$20
         LDX   #$0000
         TXY
LCB4F    LDA   LCC68,X
         STA   [$1C],Y
         INX
         INY
         CPX   #$0008
         BCC   LCB4F
         REP   #$20
         JSR   LCC37
         SEP   #$20
         LDX   #$0000
         LDY   #$0000
LCB68    LDA   LCC70,X
         STA   [$1C],Y
         INX
         INY
         CPX   #$0010
         BCC   LCB68
         REP   #$20
         JSR   LCC37
         LDY   #$0000
         LDA   LCC48
         JSR   LCC29
         LDY   #$0002
         LDA   LCC4A
         JSR   LCC29
         STZ   LC912
         LDX   #$0100
         LDY   #$0003
LCB94    LDA   LC912
         STA   [$1C],Y
         INY
         INY
         INY
         INY
         INY
         INC   LC912
         INC   LC912
         DEX
         BNE   LCB94
         DEY
         DEY
         DEY
         JSR   LCC37
         SEP   #$20
         LDX   #$0000
         TXY
LCBB3    LDA   LCC80,X
         STA   [$1C],Y
         INX
         INY
         CPX   #$0008
         BCC   LCBB3
         REP   #$20
         JSR   LCC37
         LDY   #$0000
LCBC7    LDA   LCC89,Y
         STA   [$1C],Y
         INY
         INY
         CPY   #$02E8
         BCC   LCBC7
         JSR   LCC37
         LDY   #$0000
         LDA   #$FFFF
         STA   [$1C],Y
LCBDE    LDA   LC8F0
         STA   LC8DF+2
         CLC
         ADC   #$0003
         STA   LC8E6
         CLC
         ADC   #$0003
         STA   LC8E9+2
         SEP   #$30
         LDA   LC8F2
         STA   LC8E2+1
         STA   LC8E6+2
         STA   LC8ED
         LDA   #$22
         STA   LC8DF+1
         STA   LC8E5
         STA   LC8E9+1
         LDA   #$60
         STA   LC8E2+2
         STA   LC8E9
         STA   LC8EE
         REP   #$30
         LDX   #$000E
LCC1B    LDA   LC900,X
         STA   $18,X
         DEX
         DEX
         BPL   LCC1B
         SEP   #$30
         JMP   LCFAC

*----------------------------

         MX    %00

LCC29    LDX   #$0100
LCC2C    STA   [$1C],Y
         INY
         INY
         INY
         INY
         INY
         DEX
         BNE   LCC2C
         RTS

LCC37    STY   LC914
         LDA   $1C
         CLC
         ADC   LC914
         STA   $1C
         RTS

*----------------------------
* Generated code

LCC43    LDA   |$0000,Y
LCC46    STA   $90
LCC48    LDA   $90
LCC4A    STA   |$0000,Y

LCC4D    HEX   822005
         HEX   820500
         HEX   82320A
         DB    $00
         DB    $00

LCC58    REP   #$10
         LDY   $44
         PHB
         LDA   LC932
         PHA
         PLB
         REP   #$20
         LDA   #$C000
         TCD

LCC68    LDA   #$0000
         TCD
         SEP   #$30
         PLB
         RTL

LCC70    REP   #$10
         LDY   $44
         PHB
         LDA   LC932
         PHA
         PLB
         REP   #$20
         LDA   #$C000
         TCD
LCC80    LDA   #$0000
         TCD
         SEP   #$30
         PLB
         RTL
         RTL

LCC89    LDA   LC927
         ASL
         ASL
         TAX
         CLC
         REP   #$20
         LDA   $46
         ADC   LC83B+1,X
         STA   LC91C
         SEP   #$20
         LDA   $48
         ADC   LC83E,X
         STA   LC91E
         LDA   LC83E+1,X
         STA   LC9C1
         LDA   LC87E+1,X
         TAX
         REP   #$20
         CLC
         LDA   LC91E
         AND   #$003F
         BEQ   LCCBC
         BRL   LCD42
LCCBC    ASL   LC91C
         BCC   LCCC4
         BRL   LCD45
LCCC4    ASL   LC91C
         BCC   LCCCC
         BRL   LCD51
LCCCC    ASL   LC91C
         BCC   LCCD4
         BRL   LCD5D
LCCD4    ASL   LC91C
         BCC   LCCDC
         BRL   LCD69
LCCDC    ASL   LC91C
         BCC   LCCE4
         BRL   LCD75
LCCE4    ASL   LC91C
         BCC   LCCEC
         BRL   LCD81
LCCEC    ASL   LC91C
         BCC   LCCF4
         BRL   LCD8D
LCCF4    ASL   LC91C
         BCC   LCCFC
         BRL   LCD99
LCCFC    ASL   LC91C
         BCC   LCD04
         BRL   LCDA5
LCD04    ASL   LC91C
         BCC   LCD0C
         BRL   LCDB1
LCD0C    ASL   LC91C
         BCC   LCD14
         BRL   LCDBD
LCD14    ASL   LC91C
         BCC   LCD1C
         BRL   LCDC9
LCD1C    ASL   LC91C
         BCC   LCD24
         BRL   LCDD5
LCD24    ASL   LC91C
         BCC   LCD2C
         BRL   LCDE1
LCD2C    ASL   LC91C
         BCC   LCD34
         BRL   LCDED
LCD34    ASL   LC91C
         BCC   LCD3C
         BRL   LCDF9
LCD3C    ASL   LC91C
         BRL   LCE05
LCD42    ASL   LC91C
LCD45    ROL
         CMP   LC80C+2,X
         BCC   LCD4E
         SBC   LC80C+2,X
LCD4E    ROL   LC91C
LCD51    ROL
         CMP   LC80C+2,X
         BCC   LCD5A
         SBC   LC80C+2,X
LCD5A    ROL   LC91C
LCD5D    ROL
         CMP   LC80C+2,X
         BCC   LCD66
         SBC   LC80C+2,X
LCD66    ROL   LC91C
LCD69    ROL
         CMP   LC80C+2,X
         BCC   LCD72
         SBC   LC80C+2,X
LCD72    ROL   LC91C
LCD75    ROL
         CMP   LC80C+2,X
         BCC   LCD7E
         SBC   LC80C+2,X
LCD7E    ROL   LC91C
LCD81    ROL
         CMP   LC80C+2,X
         BCC   LCD8A
         SBC   LC80C+2,X
LCD8A    ROL   LC91C
LCD8D    ROL
         CMP   LC80C+2,X
         BCC   LCD96
         SBC   LC80C+2,X
LCD96    ROL   LC91C
LCD99    ROL
         CMP   LC80C+2,X
         BCC   LCDA2
         SBC   LC80C+2,X
LCDA2    ROL   LC91C
LCDA5    ROL
         CMP   LC80C+2,X
         BCC   LCDAE
         SBC   LC80C+2,X
LCDAE    ROL   LC91C
LCDB1    ROL
         CMP   LC80C+2,X
         BCC   LCDBA
         SBC   LC80C+2,X
LCDBA    ROL   LC91C
LCDBD    ROL
         CMP   LC80C+2,X
         BCC   LCDC6
         SBC   LC80C+2,X
LCDC6    ROL   LC91C
LCDC9    ROL
         CMP   LC80C+2,X
         BCC   LCDD2
         SBC   LC80C+2,X
LCDD2    ROL   LC91C
LCDD5    ROL
         CMP   LC80C+2,X
         BCC   LCDDE
         SBC   LC80C+2,X
LCDDE    ROL   LC91C
LCDE1    ROL
         CMP   LC80C+2,X
         BCC   LCDEA
         SBC   LC80C+2,X
LCDEA    ROL   LC91C
LCDED    ROL
         CMP   LC80C+2,X
         BCC   LCDF6
         SBC   LC80C+2,X
LCDF6    ROL   LC91C
LCDF9    ROL
         CMP   LC80C+2,X
         BCC   LCE02
         SBC   LC80C+2,X
LCE02    ROL   LC91C
LCE05    SEP   #$20
         INC
         STA   $C09B
         REP   #$20
         LDA   LC91C
         STA   LC916
         REP   #$20
         LDA   #$0000
         ASL   LC916
         BCC   LCE20
         BRL   LCE9E
LCE20    ASL   LC916
         BCC   LCE28
         BRL   LCEAA
LCE28    ASL   LC916
         BCC   LCE30
         BRL   LCEB6
LCE30    ASL   LC916
         BCC   LCE38
         BRL   LCEC2
LCE38    ASL   LC916
         BCC   LCE40
         BRL   LCECE
LCE40    ASL   LC916
         BCC   LCE48
         BRL   LCEDA
LCE48    ASL   LC916
         BCC   LCE50
         BRL   LCEE6
LCE50    ASL   LC916
         BCC   LCE58
         BRL   LCEF2
LCE58    ASL   LC916
         BCC   LCE60
         BRL   LCEFE
LCE60    ASL   LC916
         BCC   LCE68
         BRL   LCF0A
LCE68    ASL   LC916
         BCC   LCE70
         BRL   LCF16
LCE70    ASL   LC916
         BCC   LCE78
         BRL   LCF22
LCE78    ASL   LC916
         BCC   LCE80
         BRL   LCF2E
LCE80    ASL   LC916
         BCC   LCE88
         BRL   LCF3A
LCE88    ASL   LC916
         BCC   LCE90
         BRL   LCF46
LCE90    ASL   LC916
         BCC   LCE98
         BRL   LCF52
LCE98    ASL   LC916
         BRL   LCF5E
LCE9E    ROL
         CMP   LC809+1,X
         BCC   LCEA7
         SBC   LC809+1,X
LCEA7    ROL   LC916
LCEAA    ROL
         CMP   LC809+1,X
         BCC   LCEB3
         SBC   LC809+1,X
LCEB3    ROL   LC916
LCEB6    ROL
         CMP   LC809+1,X
         BCC   LCEBF
         SBC   LC809+1,X
LCEBF    ROL   LC916
LCEC2    ROL
         CMP   LC809+1,X
         BCC   LCECB
         SBC   LC809+1,X
LCECB    ROL   LC916
LCECE    ROL
         CMP   LC809+1,X
         BCC   LCED7
         SBC   LC809+1,X
LCED7    ROL   LC916
LCEDA    ROL
         CMP   LC809+1,X
         BCC   LCEE3
         SBC   LC809+1,X
LCEE3    ROL   LC916
LCEE6    ROL
         CMP   LC809+1,X
         BCC   LCEEF
         SBC   LC809+1,X
LCEEF    ROL   LC916
LCEF2    ROL
         CMP   LC809+1,X
         BCC   LCEFB
         SBC   LC809+1,X
LCEFB    ROL   LC916
LCEFE    ROL
         CMP   LC809+1,X
         BCC   LCF07
         SBC   LC809+1,X
LCF07    ROL   LC916
LCF0A    ROL
         CMP   LC809+1,X
         BCC   LCF13
         SBC   LC809+1,X
LCF13    ROL   LC916
LCF16    ROL
         CMP   LC809+1,X
         BCC   LCF1F
         SBC   LC809+1,X
LCF1F    ROL   LC916
LCF22    ROL
         CMP   LC809+1,X
         BCC   LCF2B
         SBC   LC809+1,X
LCF2B    ROL   LC916
LCF2E    ROL
         CMP   LC809+1,X
         BCC   LCF37
         SBC   LC809+1,X
LCF37    ROL   LC916
LCF3A    ROL
         CMP   LC809+1,X
         BCC   LCF43
         SBC   LC809+1,X
LCF43    ROL   LC916
LCF46    ROL
         CMP   LC809+1,X
         BCC   LCF4F
         SBC   LC809+1,X
LCF4F    ROL   LC916
LCF52    ROL
         CMP   LC809+1,X
         BCC   LCF5B
         SBC   LC809+1,X
LCF5B    ROL   LC916
LCF5E    SEP   #$20
         ORA   LC9C1
         STA   $C09E
         REP   #$20
         LDA   LC916
         STA   $C09C
         SEP   #$30
         RTL

LCF71    PHP
         SEP   #$30
         LDX   #$10
         STX   LC931
         LDY   #$20
LCF7B    LDA   SPKR
         LDX   LC931
LCF81    DEX
         BNE   LCF81
         DEY
         BNE   LCF7B
         PLP
         RTS

*----------------------------

         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF

*----------------------------

LCFA0    LDA   LCA00
         STA   LC8FF
         STX   $C092
         JMP   LCA03

LCFAC    LDA   LC8FF
         STA   $C092
         RTS

*----------------------------

         DB    $00
         DB    $01
         DB    $02
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LCFFF    DB    $00
