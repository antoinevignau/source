*
* MicroDrive Turbo
* (c) 1996-2006, Joachim Lange
* (s) 2019, Brutal Deluxe Software
*

         mx    %11
         org   $c800
         dsk   FW4.NEW
         lst   off

*----------------------------

SLOT161  =     $C1        ; This is for slot 1

MSLOT    EQU   $07F8
SPKR     EQU   $C030
BUTN0    EQU   $C061
BUTN1    EQU   $C062
INIT     EQU   $FB2F
HOME     EQU   $FC58
SETKBD   EQU   $FE89
SETVID   EQU   $FE93

*----------------------------

LC800    LDY   #$20
LC802    LDY   #$00
         LDY   #$03
         LDY   #$00
         CLD
         JSR   SETKBD
         JSR   SETVID
         JSR   INIT
         JSR   HOME
LC815    LDA   #SLOT161
LC817    STA   MSLOT
LC81A    LDA   LCFFF
         STZ   $C092
LC820    JMP   LCA01

LC823    CLV
LC824    BVC   LC828
         SEP   #$40
LC828    LDA   #SLOT161
LC82A    STA   MSLOT
         LDA   LCFFF
LC830    STZ   $C092
         LDA   LC980
         EOR   #$82
         CMP   LC981
         BEQ   LC842
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
LC881    BIT   LC925
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
         STZ   LC92B
LC8EA    JMP   LCA01	; called from FW1 and FW2

*----------------------------

         DB    $01
         DB    $03
         DB    $07
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $C9
         DB    $C4
         DB    $D5
         DB    $10
         DB    $00
         DB    $CD
LC8F8    DB    $D4
LC8F9    DB    $CA
LC8FA    DB    $CC
LC8FB    DB    $80
LC8FC    DB    $00
         DB    $00
LC8FE    DB    $3F
LC8FF    DB    LC823

*----------------------------

LC900    DB    $CA
LC901    DB    $CC
LC902    DB    $64
         DB    $02
         DB    $64
         DB    $02
LC906    DB    $00
         DB    $00
LC908    DB    $00
         DB    $00
         DB    $05
         DB    $00
LC90C    DB    $05
LC90D    DB    $00
LC90E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $00
LC914    DB    $01
         DB    $00
         DB    $05
         DB    $00
         DB    $03
         DB    $00
         DB    $08
         DB    $00
LC91C    DB    $01
         DB    $00
LC91E    DB    $03
LC91F    DB    $00
LC920    DB    $04
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC940    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
LC9A0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC9C0    DB    $00
LC9C1    DB    $00
         DB    $00
LC9C3    DB    $00
         DB    $00
LC9C5    DB    $00
         DB    $00
LC9C7    DB    $00
         DB    $00
LC9C9    DB    $00
         DB    $00
LC9CB    DB    $00
         DB    $00
LC9CD    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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

LCA00    DB    $03
LCA01    DB    $00
         DB    $03

         MX    %11

LCA03    LDA   #$05
         BNE   LCA19
         LDA   #$04
         BNE   LCA19
LCA0B    LDA   #$03
         BNE   LCA19
LCA0F    LDA   #$02
         BNE   LCA19
LCA13    LDA   #$01
         BNE   LCA19
         LDA   #$00
LCA19    STA   LC8FE
         SEC
         JMP   LCFAC

LCA20    CLC
         XCE
         REP   #$20
         LDA   #$0000
         TAY
LCA28    STA   LC800,Y
         STA   LC900,Y
         INY
         INY
         CPY   #$E0
         BNE   LCA28
         SEP   #$30
         LDA   #$CE
         STA   LC980
         STA   LC981
         STA   LC800
         LDA   $42
         CMP   #$81
         BEQ   LCA03
         CMP   #$82
         BEQ   LCA03
         JSR   LCDA4
         LDA   #$00
         STA   LC9C3
         JSR   LCDD7
         LDA   LC8F8
         CMP   #$BB
         BEQ   LCA6D
         JSR   LCDA4
         LDA   #$3D
         STA   LC8FC
         JSR   LCCA5
         BCC   LCA6D
         JMP   LCA13

LCA6D    LDA   #$01
         STA   LC9C0
         JSR   LCDAA
         LDA   #$02
         STA   LC8FC
         JSR   LCCA5
         BCS   LCA8D
         INC   LC9C0
         JSR   LCDAA
         LDA   #$01
         STA   LC9C3
         JSR   LCDD7
LCA8D    JSR   LCDA4
         JSR   LCC9D
         BCC   LCA98
         JMP   LCA0F

LCA98    LDY   #$00
         STY   LC9C5
         STY   LC9C3
         JSR   LCC3C
         BCC   LCAA8
         JMP   LCA0B

LCAA8    JSR   LCDEB
         JSR   LCB60
         LDY   #$05
LCAB0    LDA   LC90E,Y
         STA   LC81A+2,Y
         DEY
         BPL   LCAB0
         LDY   #$07
LCABB    LDA   LC914,Y
         STA   LC824,Y
         DEY
         BPL   LCABB
         LDA   LC82A
         BEQ   LCB0D
         DEC
         BEQ   LCB0D
         ASL
         ASL
         TAY
         STY   LC9CB
         LDX   #$00
LCAD4    LDA   LC87E+2,Y
         PHA
         LDA   LC87E+2,X
         STA   LC9C9
         PLA
         STA   LC87E+2,X
         LDA   LC9C9
         STA   LC87E+2,Y
         INY
         INX
         CPX   #$04
         BCC   LCAD4
         LDY   LC9CB
         LDX   #$00
LCAF3    LDA   LC83E+2,Y
         PHA
         LDA   LC83E+2,X
         STA   LC9C9
         PLA
         STA   LC83E+2,X
         LDA   LC9C9
         STA   LC83E+2,Y
         INY
         INX
         CPX   #$04
         BCC   LCAF3
LCB0D    LDA   LC90D
         BEQ   LCB1E
         JSR   LCBEA
         LDA   LC90D
         STA   LC817+1
         JMP   LCB35

LCB1E    LDA   LC9C0
         CMP   #$02
         BCC   LCB35
         LDY   #$01
         STY   LC9C3
         JSR   LCC3C
         BCS   LCB35
         JSR   LCDEB
         JSR   LCB60
LCB35    CLC
         LDA   LC815+1
         ADC   LC817+1
         STA   LC81A
         LDA   LC9C0
         STA   LC820+2
         LDA   #$CC
         STA   LC800+1
         LDA   #$CA
         STA   LC800
         STA   LC980
         EOR   #$82
         STA   LC981
         CLC
         LDA   #$00
         STA   LC8FE
         JMP   LCFAC

LCB60    REP   #$20
         LDA   LC9C3
         AND   #$00FF
         ASL
         TAY
         LDX   #$00
LCB6C    LDA   LC902,X
         STA   LC802,Y
         INX
         INX
         INY
         INY
         INY
         INY
         CPX   #$0C
         BCC   LCB6C
         SEP   #$20
         LDY   LC9C5
         LDX   #$00
         LDA   LC90C
         ASL
         STA   LC9C7
         REP   #$20
LCB8C    LDA   LC920,X
         STA   LC83E+2,Y
         LDA   LC940,X
         STA   LC87E+2,Y
         INX
         INX
         INY
         INY
         DEC   LC9C7
         BNE   LCB8C
         SEP   #$20
         LDY   LC9C3
         LDA   LCC9B,Y
         STA   LC9C1
         TYA
         ASL
         STA   LC9CD
         LDY   LC9C5
         LDX   LC90C
LCBB7    LDA   LC9C1
         STA   LC842+1,Y
         LDA   LC9CD
         STA   LC881+2,Y
         INY
         INY
         INY
         INY
         DEX
         BNE   LCBB7
         STY   LC9C5
         SEP   #$30
         LDA   LC9C3
         AND   #$FF
         TAX
         ASL
         TAY
         LDA   LC91C
         STA   LC82A+2,Y
         LDA   LC91E
         STA   LC830,X
         LDA   LC91F
         STA   LC830+2,X
         RTS

LCBEA    LDY   LC9C5
         LDX   #$00
         LDA   LC90D
         ASL
         STA   LC9C7
         REP   #$20
LCBF8    LDA   LC980,X
         STA   LC83E+2,Y
         LDA   LC9A0,X
         STA   LC87E+2,Y
         INX
         INX
         INY
         INY
         DEC   LC9C7
         BNE   LCBF8
         SEP   #$20
         LDY   LC9C3
         LDA   LCC9B,Y
         STA   LC9C1
         TYA
         ASL
         STA   LC9CD
         LDY   LC9C5
         LDX   LC90D
LCC23    LDA   LC9C1
         STA   LC842+1,Y
         LDA   LC9CD
         STA   LC881+2,Y
         INY
         INY
         INY
         INY
         DEX
         BNE   LCC23
         STY   LC9C5
         SEP   #$30
         RTS

LCC3C    LDA   LCC9B,Y
         STA   LC9C1
         STA   $C09E
         JSR   LCCD1
         BCS   LCC99
         LDA   #$01
         STA   $C09B
         LDA   #$01
         STA   $C09A
         LDA   #$00
         STA   $C09C
         STA   $C09D
         LDA   #$20
         STA   $C09F
         JSR   LCD31
         BCS   LCC99
         JSR   LCCF8
         BCS   LCC99
         REP   #$20
         LDX   #$01
         LDY   #$00
LCC71    LDA   $C090
         STA   LC900,Y
         INY
         INY
         CPY   #$C0
         BCC   LCC71
LCC7D    LDA   $C090
         INY
         INY
         BNE   LCC7D
         DEX
         BPL   LCC7D
         SEP   #$30
         LDA   LC900
         CMP   #$CA
         BNE   LCC99
         LDA   LC901
         CMP   #$CC
         BNE   LCC99
         CLC
         RTS

LCC99    SEC
         RTS

LCC9B    LDY   #$B0
LCC9D    LDA   #$10
         STA   $C09F
         JMP   LCD2D

LCCA5    LDA   $C09F
         AND   #$F0
         CMP   #$F0
         BEQ   LCCC2
         CMP   #$00
         BEQ   LCCC2
         CMP   #$50
         BNE   LCCB8
         CLC
         RTS

LCCB8    LDA   #$32
         JSR   LCDB0
         DEC   LC8FC
         BNE   LCCA5
LCCC2    SEC
         RTS

LCCC4    LDA   $C09F
         AND   #$08
         BEQ   LCCD0
         LDA   $C090
         BRA   LCCC4
LCCD0    RTS

LCCD1    LDA   #$02
         STA   LC8FB
         STZ   LC8F9
         STZ   LC8FA
LCCDC    LDA   $C09F
         BMI   LCCE7
         AND   #$F0
         CMP   #$50
         BEQ   LCD11
LCCE7    INC   LC8F9
         BNE   LCCDC
         INC   LC8FA
         BNE   LCCDC
         DEC   LC8FB
         BNE   LCCDC
         SEC
         RTS

LCCF8    STZ   LC8F9
         STZ   LC8FA
         LDA   #$02
         STA   LC8FB
LCD03    LDA   $C09F
         BMI   LCD1C
         LSR
         BCS   LCD13
         AND   #$7C
         CMP   #$2C
         BNE   LCD13
LCD11    CLC
         RTS

LCD13    AND   #$04
         BEQ   LCD1A
         JSR   LCCC4
LCD1A    SEC
         RTS

LCD1C    INC   LC8F9
         BNE   LCD03
         INC   LC8FA
         BNE   LCD03
         DEC   LC8FB
         BNE   LCD03
         SEC
         RTS

LCD2D    LDA   #$14
         BNE   LCD33
LCD31    LDA   #$02
LCD33    STA   LC8FB
         STZ   LC8FA
         STZ   LC8F9
LCD3C    LDA   $C098
         BPL   LCD46
         LDA   $C09F
         CLC
         RTS

LCD46    INC   LC8F9
         BNE   LCD3C
         INC   LC8FA
         BNE   LCD3C
         DEC   LC8FB
         PHP
         LDY   LC8FB
         LDA   LCD68,Y
         STA   $07F2
         LDA   LCD86,Y
         STA   $07F3
         PLP
         BNE   LCD3C
         SEC
         RTS

*----------------------------

LCD68    ASC   "          "
         ASC   "1111111111"
         ASC   "2222222222"
LCD86    ASC   "0123456789"
         ASC   "0123456789"
         ASC   "0123456789"

*----------------------------

         MX    %11

LCDA4    LDA   #$A0
         STA   $C09E
         RTS

LCDAA    LDA   #$B0
         STA   $C09E
         RTS

LCDB0    LDX   #$C9
LCDB2    DEX
         BNE   LCDB2
         SEC
         SBC   #$01
         BNE   LCDB0
         RTS

         LDX   #$20
         STX   LC931
         LDY   #$40
LCDC2    LDA   SPKR
         LDX   LC931
LCDC8    DEX
         BNE   LCDC8
         DEY
         BNE   LCDC2
         LDX   #$50
LCDD0    DEY
         BNE   LCDD0
         DEX
         BNE   LCDD0
LCDD6    RTS

LCDD7    LDA   BUTN0
         BPL   LCDD6
         LDA   BUTN1
         BPL   LCDD6
         LDA   #$11
         STA   LC908
         LDA   #$04
         STA   LC906
LCDEB    LDY   LC9C3
         LDA   LC906
         DEC
         ORA   LCC9B,Y
         STA   LC9C1
         STA   $C09E
         JSR   LCCD1
         LDA   LC908
         STA   $C09A
         LDA   #$11
         STA   $C09B
         LDA   #$91
         STA   $C09F
         JMP   LCD31

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
         JMP   LCA20

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
