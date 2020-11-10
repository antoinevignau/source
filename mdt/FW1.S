*
* MicroDrive Turbo
* (c) 1996-2006, Joachim Lange
* (s) 2019, Brutal Deluxe Software
*

         mx    %11
         org   $c800
         dsk   FW1.NEW
         lst   off

*----------------------------

SLOT161  =     $C1        ; This is for slot 1

MSLOT    EQU   $07F8
KBD      EQU   $C000
KBDSTROBE EQU  $C010
SPKR     EQU   $C030
DMAREG   EQU   $C037
SLOOP    EQU   $FABA
INIT     EQU   $FB2F
SETTXT   EQU   $FB39
HOME     EQU   $FC58
SETKBD   EQU   $FE89
SETVID   EQU   $FE93

*----------------------------

         LDY   #$20
         LDY   #$00
         LDY   #$03
         LDY   #$00
         CLD
         JSR   SETKBD
         JSR   SETVID
         JSR   INIT
         JSR   HOME
         LDA   #SLOT161
         STA   MSLOT
LC81A    LDA   LCFFF
         STZ   $C092
         JMP   LCC58

LC823    CLV
         BVC   LC828
LC826    SEP   #$40
LC828    LDA   #SLOT161
         STA   MSLOT
         LDA   LCFFF
         STZ   $C092
         LDA   LC980
         EOR   #$82
         CMP   LC981
         BEQ   LC842
         PHP
         JSR   LCD13
         PLP
LC842    BVS   LC847
         JMP   LCA16

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
LC87C    LDA   ($01,S),Y
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
         STZ   LC92B
LC8E9    JMP   LCA01

         DB    $01
         DB    $03
         DB    $07
         DB    $0F
         DB    $FF
         DB    $FF
         ASC   "IDU"
         DB    $10
         DB    $00
LC8F7    ASC   "MT"
LC8F9    ASC   "JL"
LC8FB    DB    $80
         DB    $00
         DB    $00
LC8FE    DB    $3F
LC8FF    DB    LC823      ; Smartport ID (add 3 for entry point)

*----------------------------

LC900    ASC   "JL"
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
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $05
         DB    $00
         DB    $03
         DB    $00
         DB    $08
         DB    $00
         DB    $01
         DB    $00
         DB    $03
         DB    $00
LC920    DB    $04
         DB    $00
         DB    $00
LC923    DB    $00
LC924    DB    $01
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LC9E0    JSL   $000000
LC9E4    RTS

LC9E5    JSL   $000000
         RTS

LC9EA    JSL   $000000
LC9EE    RTS

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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

LCA00    DB    $00
LCA01    DB    $00
         DB    $00
LCA03    JMP   LCB29

LCA06    LDA   #$CE       ; Switch bank
         STA   LC980
         STA   LC981
         LDA   #$28
         JMP   LCAEE
LCA13    JMP   LCB18

LCA16    LDA   #$03
         STA   LC920
         CLC
         XCE
         LDA   $42
         BMI   LCA03
         LDA   LC980
         CMP   #$CA
         BNE   LCA06
LCA28    LDX   #$01
         LDY   $43
         CPY   #$10
         BEQ   LCA35
         INX
         CPY   #$90
         BNE   LCA13
LCA35    STX   LC927
LCA38    LDA   $C09F
         BMI   LCA38
         LDA   $42
         CMP   #$02
         BEQ   LCA4A
         CMP   #$01
         BEQ   LCA9A
         JMP   LCAF2

LCA4A    LDA   $48
         PHA
         STZ   $48
         JSR   LC8E9+1    ; LOGO (see FW4)
         PLA
         STA   $48
         JSR   LCD62
         LDA   #$01
         STA   $C09A
         LDA   #$30
         STA   $C09F
         REP   #$30
         LDA   $44
         STA   $C094
         SEP   #$30
         STZ   DMAREG
         LDA   $C096
LCA71    LDA   $C09F
         BMI   LCA71
         AND   #$FD
         CMP   #$58
         BEQ   LCA82
         AND   #$21
         BEQ   LCA71
         BNE   LCA97
LCA82    STA   $C093
         JSR   LCDB7
LCA88    LDA   $C09F
         BMI   LCA88
         AND   #$FD
         CMP   #$50
         BEQ   LCAD5
         AND   #$21
         BEQ   LCA88
LCA97    JMP   LCADE

LCA9A    LDA   $48
         PHA
         STZ   $48
         JSR   LC8E9+1    ; LOGO (see FW4)
         PLA
         STA   $48
         LDA   #$01
         STA   $C09A
         JSR   LCD62
         LDA   #$20
         STA   $C09F
         REP   #$30
         LDA   $44
         STA   $C094
         SEP   #$30
         STZ   DMAREG
         LDA   $C097
         JSR   LCDB7
LCAC4    LDA   $C09F
         BMI   LCAC4
         AND   #$F9
         LSR
         BCS   LCADE
         CMP   #$2C
         BNE   LCAC4
         STA   $C093
LCAD5    LDA   #$00
         TAX
         LDY   #$02
LCADA    SEC
         XCE
         CLC
         RTS

LCADE    JSR   LCEF7
         JSR   LCD55
         DEC   LC920
         BEQ   LCAEC
         JMP   LCA28

LCAEC    LDA   #$27
LCAEE    SEC
         XCE
         SEC
         RTS

LCAF2    CMP   #$00
         BNE   LCB1D
         LDA   LC927
         ASL
         ASL
         TAX
         LDY   LC87E,X
         BNE   LCB13
         LDY   LC87C+1,X
         LDA   LC87C,X
         BNE   LCB0D
         CPY   #$00
         BEQ   LCB18
LCB0D    TAX
         LDA   #$00
LCB10    JMP   LCADA

LCB13    LDA   #$FF
         TAY
         BRA   LCB0D
LCB18    LDA   #$28
         JMP   LCAEE

LCB1D    CMP   #$03
         BEQ   LCB23
         BNE   LCB29
LCB23    LDA   #$00
         TAX
         TAY
         BEQ   LCB10
LCB29    CMP   #$81
         BEQ   LCB36
         CMP   #$82
         BEQ   LCB6A
         LDA   #$01
         JMP   LCAEE

LCB36    JSR   LCBB7
         LDA   #$20
         STA   $C09F
         JSR   LCDB7
LCB41    LDA   $C09F
         BMI   LCB41
         AND   #$F9
         CMP   #$58
         BEQ   LCB51
         LSR
         BCS   LCBB0
         BRA   LCB41
LCB51    REP   #$30
         LDY   $44
LCB55    LDA   $C090
         STA   |$0000,Y
         INY
         INY
         CPY   LC923
         BCC   LCB55
         SEP   #$30
         LDA   $C09F
         JMP   LCBAA

LCB6A    JSR   LCBB7
         LDA   #$30
         STA   $C09F
LCB72    LDA   $C09F
         BMI   LCB72
         AND   #$FD
         CMP   #$58
         BEQ   LCB83
         AND   #$21
         BNE   LCBB0
         BEQ   LCB72
LCB83    REP   #$30
         LDY   $44
LCB87    LDA   |$0000,Y
         STA   $C090
         INY
         INY
         CPY   LC923
         BCC   LCB87
         SEP   #$30
         JSR   LCDB7
LCB99    LDA   $C09F
         BMI   LCB99
         AND   #$FD
         CMP   #$50
         BEQ   LCBAA
         AND   #$21
         BNE   LCBB0
         BEQ   LCB99
LCBAA    SEC
         XCE
         LDA   #$00
         CLC
         RTS

LCBB0    SEC
         XCE
         LDA   $C09F
         SEC
         RTS

LCBB7    LDA   $43
         LSR
         LSR
         LSR
         AND   #$F0
         ORA   #$A0
         STA   $C09E
         JSR   LCD62
         LDA   #$01
         STA   $C09A
         LDA   $46
         STA   $C09B
         LDA   #$00
         STA   $C09C
         STA   $C09D
         LDA   $44
         STA   LC923
         LDA   $45
         INC
         INC
         STA   LC924
         RTS

LCBE5    LDY   #$00
LCBE7    LDA   LCBF3,Y
         BEQ   LCBF2
         STA   $04AD,Y
         INY
         BNE   LCBE7
LCBF2    RTS

LCBF3    ASC   "Waiting for hard drive..."00

*----------------------------

LCC0D    SEC
         XCE
         STZ   $00
         LDA   #SLOT161
         STA   $01
         JMP   SLOOP

LCC18    LDA   #$08
         STA   LC8FB
         STZ   LC8F9+1
         STZ   LC8F9
LCC23    LDA   $C09F
         CMP   #$FE
         BCS   LCC45
         CMP   #$EF
         BEQ   LCC45
         AND   #$F0
         CMP   #$50
         BNE   LCC36
         CLC
         RTS

LCC36    INC   LC8F9
         BNE   LCC23
         INC   LC8F9+1
         BNE   LCC23
         DEC   LC8FB
         BNE   LCC23
LCC45    SEC
         RTS

LCC47    LDA   #$01
         STA   LC8FE
         JSR   HOME
         JSR   LCDE7
         JSR   LCDF4
         JMP   LCD02

LCC58    CLC
         XCE
         LDA   #$BB
         STA   LC8F7+1
         LDA   KBD
         BPL   LCC6F
         LDY   KBDSTROBE
         CMP   #$B0
         BEQ   LCC0D
         CMP   #$9B
         BEQ   LCC0D
LCC6F    JSR   LCBE5
         JSR   LCDDB
         LDA   #$B0
         STA   $07F7
         JSR   LCC18
         BCS   LCC47
         JSR   HOME
         LDA   #$B1
         STA   $07F7
         JSR   LCD30
         LDA   #$B2
         STA   $07F7
         BCC   LCC94
         JMP   LCD02

LCC94    LDA   #$B3
         STA   $07F7
         LDA   #$03
         STA   LC920
LCC9E    LDA   #$A0
         STA   $C09E
         JSR   LCD62
         LDA   #$02
         STA   $C09B
         STZ   $C09C
         STZ   $C09D
         LDA   #$01
         STA   $C09A
         LDA   #$20
         STA   $C09F
         JSR   LCDB7
         JSR   LCD89
         BCC   LCCCA
         DEC   LC920
         BNE   LCC9E
         BEQ   LCCFD
LCCCA    CLC
         XCE
         REP   #$30
         LDY   #$0000
LCCD1    LDA   $C090
         STA   $8000,Y
         INY
         INY
         CPY   #$0200
         BNE   LCCD1
         SEC
         XCE
         MX    %11
         LDA   $C09F
         LDA   #$B3
         STA   $07F7
         LDA   $8000
         BEQ   LCCFD
         CMP   #$FF
         BEQ   LCCFD
         LDA   #$B5
         STA   $07F7
         SEC
         XCE
         LDX   #$10
         JMP   $8000

LCCFD    LDA   #$07
         STA   LC8FE
LCD02    SEC
         XCE
         JSR   HOME
         JSR   LCDE7
         JSR   LCDF4
         JSR   SETTXT
         JMP   $E000

LCD13    LDX   #$07
LCD15    LDA   $42,X
         STA   LC9EA+2,X
         DEX
         BPL   LCD15
         LDA   #$EE
         STA   LC8F7+1
         JSR   LCD30
         LDX   #$07
LCD27    LDA   LC9EA+2,X
         STA   $42,X
         DEX
         BPL   LCD27
         RTS

LCD30    JSR   LCDE1
         STZ   $C096
         JSR   LCDDB
         STZ   $C096
         LDX   #$03
         JSR   LCFA0
         BCS   LCD4B
         PHP
         LDX   #$02
         JSR   LCFA0
         PLP
         RTS

LCD4B    LDA   #$CE
         STA   LC980
         STA   LC981
         SEC
         RTS

LCD55    LDA   $C09F
         AND   #$08
         BEQ   LCD61
         LDA   $C090
         BRA   LCD55
LCD61    RTS

LCD62    LDA   #$02
         STA   LC8FB
         STZ   LC8F9
         STZ   LC8F9+1
LCD6D    LDA   $C09F
         BMI   LCD78
         AND   #$F0
         CMP   #$50
         BEQ   LCDA2
LCD78    INC   LC8F9
         BNE   LCD6D
         INC   LC8F9+1
         BNE   LCD6D
         DEC   LC8FB
         BNE   LCD6D
         SEC
         RTS

LCD89    STZ   LC8F9
         STZ   LC8F9+1
         LDA   #$02
         STA   LC8FB
LCD94    LDA   $C09F
         BMI   LCDA6
         LSR
         BCS   LCDA4
         AND   #$7C
         CMP   #$2C
         BNE   LCDA4
LCDA2    CLC
         RTS

LCDA4    SEC
         RTS

LCDA6    INC   LC8F9
         BNE   LCD94
         INC   LC8F9+1
         BNE   LCD94
         DEC   LC8FB
         BNE   LCD94
         SEC
         RTS

LCDB7    LDA   #$02
         STA   LC8FB
         STZ   LC8F9+1
         STZ   LC8F9
LCDC2    LDA   $C098
         BPL   LCDCB
         LDA   $C09F
         RTS

LCDCB    INC   LC8F9
         BNE   LCDC2
         INC   LC8F9+1
         BNE   LCDC2
         DEC   LC8FB
         BNE   LCDC2
         RTS

LCDDB    LDA   #$A0
         STA   $C09E
         RTS

LCDE1    LDA   #$B0
         STA   $C09E
         RTS

LCDE7    LDY   #$00
LCDE9    LDA   LCEE0,Y
         BEQ   LCE11
         STA   $0750,Y
         INY
         BNE   LCDE9
LCDF4    LDA   LC8FE
         BEQ   LCE11
         ASL
         TAY
         LDA   LCE12,Y
         STA   $1E
         LDA   LCE13,Y
         STA   $1F
         LDY   #$00
LCE07    LDA   ($1E),Y
         BEQ   LCE11
         STA   $07D0,Y
         INY
         BNE   LCE07
LCE11    RTS

*----------------------------

LCE12    DB    $00
LCE13    DB    $00
         DA    LCE22
         DA    LCE30
         DA    LCE43
         DA    LCE61
         DA    LCE82
         DA    LCEA4
         DA    LCECA

LCE22    ASC   "drive 1 error"00
LCE30    ASC   "drive 1 init error"00
LCE43    ASC   "configuration data is missing"00
LCE61    ASC   "configuration drive 2 is missing"00
LCE82    ASC   "service call, turn power off & on"00
LCEA4    ASC   "read error when loading configuration"00
LCECA    ASC   "boot block is missing"00
LCEE0    ASC   "MicroDrive/Turbo Card:"00

LCEF7    LDX   #$20
         STX   LC931
         LDY   #$40
LCEFE    LDA   SPKR
         LDX   LC931
LCF04    DEX
         BNE   LCF04
         DEY
         BNE   LCEFE
         LDX   #$50
LCF0C    DEY
         BNE   LCF0C
         DEX
         BNE   LCF0C
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
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
         JMP   LCA01

         LDA   LC8FF
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

*----------------------------
