*
* MicroDrive Turbo
* (c) 1996-2006, Joachim Lange
* (s) 2019, Brutal Deluxe Software
*

         mx    %11
         org   $c800
         dsk   FW2.NEW
         lst   off

*----------------------------

SLOT161  =     $C1        ; This is for slot 1

MSLOT    EQU   $07F8
SPKR     EQU   $C030
DMAREG   EQU   $C037
INIT     EQU   $FB2F
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
         JMP   LCA01

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
         JSR   LCA01
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
LC87C    LDA   ($01,S),Y
LC87E    STA   LC925
         BIT   LC925
         BVC   LC889
         JMP   LCB6F

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
         JMP   LCAB0
LC8DC    JMP   LCA0B
LC8DF    JMP   LCA29
LC8E2    JMP   LCA13

LC8E5    CLC
         STZ   LC92B
LC8E9    JMP   LCA26

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
         DB    $D4
LC8F9    DB    $CA
LC8FA    DB    $CC
LC8FB    DB    $80
         DB    $00
         DB    $00
         DB    $3F
LC8FF    DB    LC823

*----------------------------

         DB    $CA
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
         DB    $00
         DB    $01
LC925    DB    $00
         DB    $40
LC927    DB    $00
         DB    $01
LC929    DB    $00
LC92A    DB    $01
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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

LCA00    DB    $01
LCA01    DB    $00
         DB    $01

LCA03    LDA   #$21
         BNE   LCA15
LCA07    LDA   #$27
         BNE   LCA15
LCA0B    LDA   #$28
         BNE   LCA15
LCA0F    LDA   #$2F
         BNE   LCA15
LCA13    LDA   #$01
LCA15    SEC
         STA   LC92B
         JMP   LCCD3

LCA1C    STX   LC929
         STZ   LC92A
         STZ   LC92B
         CLC
LCA26    JMP   LCCD3

LCA29    LDA   LC980
         CMP   #$CA
         BNE   LCA0B
         LDA   $48
         BEQ   LCA3B
         CMP   #$03
         BNE   LCA03
         BRL   LCA7A
LCA3B    LDX   #$02
         JSR   LCFA0
         LDY   LC81A
         BEQ   LCA0F
         CPY   #$11
         BCS   LCA0F
         LDA   LC927
         BEQ   LCA99
         CMP   LC81A
         BCC   LCA58
         BEQ   LCA58
         JMP   LCA0B

LCA58    JSR   LCA60
         LDX   #$04
         JMP   LCA1C

LCA60    LDA   LC927
         ASL
         ASL
         TAX
         LDY   #$00
         LDA   LCDF8
         STA   ($44),Y
         INY
LCA6E    LDA   LC87C,X
         STA   ($44),Y
         INX
         INY
         CPY   #$04
         BNE   LCA6E
         RTS

LCA7A    LDA   LC927
         CMP   LC81A
         BCC   LCA87
         BEQ   LCA87
         JMP   LCA0B

LCA87    JSR   LCA60
LCA8A    LDA   LCDF9,Y
         STA   ($44),Y
         INY
         CPY   #$19
         BNE   LCA8A
         LDX   #$19
         JMP   LCA1C

LCA99    LDY   #$07
LCA9B    LDA   LCDC2,Y
         STA   ($44),Y
         DEY
         BNE   LCA9B
         LDA   LC81A
         STA   ($44),Y
         LDX   #$08
         JMP   LCA1C
LCAAD    JMP   LCA0F

LCAB0    LDA   #$03
         STA   LC920
LCAB5    JSR   LC8E9+1    ; LOGO (see FW4)
         LDA   $C09F
         AND   #$40
         BEQ   LCAAD
         LDA   LC925
         CMP   #$02
         BEQ   LCACC
         JMP   LCB1D
         JMP   LCA0B

LCACC    LDA   #$01
         STA   $C09A
         LDA   #$30
         STA   $C09F
         LDA   $C096
         STZ   DMAREG
         REP   #$30
         LDA   $44
         STA   $C094
         SEP   #$30
LCAE5    LDA   $C09F
         BMI   LCAE5
         AND   #$FD
         CMP   #$58
         BEQ   LCAF6
         AND   #$21
         BEQ   LCAE5
         BNE   LCB0B
LCAF6    STA   $C093
         JSR   LCD19
LCAFC    LDA   $C09F
         BMI   LCAFC
         AND   #$FD
         CMP   #$50
         BEQ   LCB0E
         AND   #$21
         BEQ   LCAFC
LCB0B    BRL   LCB5E
LCB0E    STZ   LC92B
         CLC
         REP   #$30
         LDA   #$0200
         STA   LC929
         JMP   LCCD5

*----------------------------

         MX    %11
LCB1D    LDA   #$01
         STA   $C09A
         LDA   #$20
         STA   $C09F
         LDA   $C097
         STZ   DMAREG
         REP   #$30
         LDA   $44
         STA   $C094
         SEP   #$30
         JSR   LCD19
LCB39    LDA   $C09F
         BMI   LCB39
         AND   #$F9
         CMP   #$58
         BEQ   LCB49
         LSR
         BCS   LCB5E
         BRA   LCB39
LCB49    STA   $C093
         LDA   $C09F
         STZ   LC92B
         CLC
         REP   #$30
         LDA   #$0200
         STA   LC929
         JMP   LCCD5

LCB5E    JSR   LCE27
         JSR   LCD0D
         DEC   LC920
         BEQ   LCB6C
         JMP   LCAB5
LCB6C    JMP   LCA07

LCB6F    REP   #$20
         MX    %01
         LDY   #$02
         LDA   ($01,S),Y
         STA   $4C
         LDY   #$04
         LDA   ($01,S),Y
         STA   $4E
         TSX
         LDA   $0101,X
         CLC
         ADC   #$0005
         STA   $0101,X
         LDY   #$02
         LDA   [$4C],Y
         STA   $4F
         LDY   #$04
         LDA   [$4C],Y
         STA   $51
         LDY   #$06
         LDA   [$4C],Y
         STA   $46
         LDY   #$08
         LDA   [$4C],Y
         STA   $48
         SEP   #$30
         LDY   #$01
         LDA   [$4C],Y
         STA   LC927
         LDA   #$03
         STA   LC920
LCBAE    LDA   LC925
         CMP   #$41
         BNE   LCBB8
         JMP   LCC51

LCBB8    CMP   #$42
         BEQ   LCBDA
         CMP   #$40
         BNE   LCBC3
         JMP   LCD63

LCBC3    CMP   #$43
         BEQ   LCBCE
         CMP   #$44
         BEQ   LCBCE
         JMP   LCD4D

LCBCE    CLC
         STZ   LC92B
         REP   #$30
         STZ   LC929
         JMP   LCCD3

         MX    %11
LCBDA    JSR   LC8E9+1    ; LOGO (see FW4)
         LDA   $C09F
         AND   #$40
         BEQ   LCC4E
         LDA   #$01
         STA   $C09A
         LDA   #$30
         STA   $C09F
LCBEE    LDA   $C09F
         BMI   LCBEE
         AND   #$FD
         CMP   #$58
         BEQ   LCC00
         AND   #$21
         BEQ   LCBEE
         BRL   LCCBF
LCC00    REP   #$30
         LDA   $4F
         STA   $44
         CMP   #$FE01
         BCC   LCC17
         SEP   #$30
         LDA   $51
LCC0F    STA   LC932
         JSR   LC8E5
         BRA   LCC3B
LCC17    STA   $C094
         SEP   #$30
         LDA   $51
         CMP   #$90
         BCS   LCC27
         CMP   LC826
         BCS   LCC0F
LCC27    CMP   #$E0
         BEQ   LCC0F
         CMP   #$E1
         BEQ   LCC0F
         STA   DMAREG
         LDA   $C096
         STA   $C093
         JSR   LCD19
LCC3B    LDA   $C09F
         BMI   LCC3B
         AND   #$FD
         CMP   #$50
         BEQ   LCC4C
         AND   #$21
         BEQ   LCC3B
         BNE   LCCBF
LCC4C    BRA   LCCB1
LCC4E    JMP   LCD45

LCC51    JSR   LC8E9+1    ; LOGO (see FW4)
         LDA   $C09F
         AND   #$40
         BEQ   LCC4E
         LDA   #$01
         STA   $C09A
         LDA   #$20
         STA   $C09F
         LDY   $51
         STY   DMAREG
         JSR   LCD19
LCC6D    LDA   $C09F
         BMI   LCC6D
         AND   #$F9
         CMP   #$58
         BEQ   LCC7D
         LSR
         BCS   LCCBF
         BRA   LCC6D
LCC7D    REP   #$30
         LDA   $4F
         STA   $44
         CMP   #$FE01
         BCC   LCC92
         SEP   #$30
LCC8A    STY   LC932
         JSR   LC8DF+1    ; LOGO (see FW4)
         BRA   LCCAE
LCC92    STA   $C094
         SEP   #$30
         CPY   #$90
         BCS   LCCA0
         CPY   LC826
         BCS   LCC8A
LCCA0    CPY   #$E0
         BEQ   LCC8A
         CPY   #$E1
         BEQ   LCC8A
         LDA   $C097
         STA   $C093
LCCAE    LDA   $C09F
LCCB1    STZ   LC92B
         REP   #$30
         LDA   #$0200
         STA   LC929
         CLC
         BRA   LCCD5
LCCBF    JSR   LCE27
         JSR   LCD0D
         DEC   LC920
         BEQ   LCCCD
         JMP   LCBAE

         MX    %11
LCCCD    LDA   #$27
         STA   LC92B
         SEC
LCCD3    REP   #$30
LCCD5    LDA   LC9E0
         STA   $42
         LDA   LC9E0+2
         STA   $44
         LDA   LC9E4
         STA   $46
         LDA   LC9E5+1
         STA   $48
         LDA   LC9E5+3
         STA   $4A
         LDA   LC9EA
         STA   $4C
         LDA   LC9EA+2
         STA   $4E
         LDA   LC9EE
         STA   $50
         SEP   #$30
         LDA   LC92B
         LDX   LC929
         LDY   LC92A
         PHP
         SEC
         XCE
         PLP
LCD0C    RTS

LCD0D    LDA   $C09F
         AND   #$08
         BEQ   LCD0C
         LDA   $C090
         BRA   LCD0D
LCD19    LDA   #$03
         STA   LC8FB
         STZ   LC8FA
         STZ   LC8F9
LCD24    LDA   $C098
         BPL   LCD2D
         LDA   $C09F
         RTS

LCD2D    INC   LC8F9
         BNE   LCD24
         INC   LC8FA
         BNE   LCD24
         DEC   LC8FB
         BNE   LCD24
         RTS

         LDA   #$27       ; LOGO - LCD3D
         BNE   LCD4F
LCD41    LDA   #$28
         BNE   LCD4F
LCD45    LDA   #$2F
         BNE   LCD4F
LCD49    LDA   #$21
         BNE   LCD4F
LCD4D    LDA   #$01
LCD4F    SEC
         STA   LC92B
         JMP   LCCD3

LCD56    STX   LC929
         STZ   LC92A
         STZ   LC92B
         CLC
         JMP   LCCD3

LCD63    LDA   LC980
         CMP   #$CA
         BEQ   LCD6D
         JMP   LCD41

LCD6D    LDA   $46
         CMP   #$04
         BCS   LCD49
         ASL
         TAX
         JMP   (LCD78,X)

LCD78    DA    LCD80
         DA    LCD49
         DA    LCD49
         DA    LCD9C

LCD80    LDX   #$02
         JSR   LCFA0
         LDA   LC927
         BEQ   LCDAF
         CMP   LC81A
         BCC   LCD93
         BEQ   LCD93
         BCS   LCD41
LCD93    LDY   #$04
         JSR   LCDCA
         LDX   #$05
         BNE   LCD56
LCD9C    LDA   LC927
         CMP   LC81A
         BCC   LCDA8
         BEQ   LCDA8
         BCS   LCD41
LCDA8    JSR   LCDCA
         LDX   #$1A
         BNE   LCD56
LCDAF    LDY   #$07
LCDB1    LDA   LCDC2,Y
         STA   [$4F],Y
         DEY
         BNE   LCDB1
         LDA   LC81A
         STA   [$4F],Y
         LDX   #$08
         BRA   LCD56

LCDC2    DB    $00
         DB    $40
         DB    $02
         DB    $00
         DB    $00
         DB    $10
         DB    $00
         DB    $00

LCDCA    LDY   #$00
         LDA   LCDF8
         STA   [$4F],Y
         INY
         LDA   LC927
         ASL
         ASL
         TAX
         REP   #$20
         LDA   LC87C,X
         STA   [$4F],Y
         LDY   #$03
         LDA   LC87E,X
         AND   #$00FF
         STA   [$4F],Y
         SEP   #$20
         LDY   #$05
LCDED    LDA   LCDF8,Y
         STA   [$4F],Y
         INY
         CPY   #$1A
         BNE   LCDED
         RTS

LCDF8    SED
LCDF9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         STR   'MicroDrive/Turbo'
         DB    $02

*----------------------------

         LDY   #$00
         BPL   LCE13
LCE13    LDX   #$FF
         BNE   LCE33
         LDX   #$80
         BNE   LCE33
         LDX   #$70
         BNE   LCE33
         LDX   #$60
         BNE   LCE33
         LDX   #$30
         BNE   LCE33
LCE27    LDX   #$20
         BNE   LCE33
         LDX   #$1C
         BNE   LCE33
         LDX   #$18
         BNE   LCE33
LCE33    STX   LC931
         LDY   #$20
LCE38    LDA   SPKR
         LDX   LC931
LCE3E    DEX
         BNE   LCE3E
         DEY
         BNE   LCE38
         LDX   #$20
LCE46    DEY
         BNE   LCE46
         DEX
         BNE   LCE46
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
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
