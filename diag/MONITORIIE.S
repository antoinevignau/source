*
* Apple II diagnostics code
*
* (c) 1983, Apple Computer, Inc.
* (s) 2018, Brutal Deluxe Software
*

*---------------------------------------------------------
* EPROM19B.BIN
* $F800..$FFFF
* This is a slightly modified AUTOSTART MONITOR ROM
*---------------------------------------------------------

LF800    LSR
         PHP
         JSR   LF847
         PLP
         LDA   #$0F
         BCC   LF80C
         ADC   #$E0
LF80C    STA   $2E
LF80E    LDA   ($26),Y
         EOR   $30
         AND   $2E
         EOR   ($26),Y
         STA   ($26),Y
         RTS

LF819    JSR   LF800
LF81C    CPY   $2C
         BCS   LF831
         INY
         JSR   LF80E
         BCC   LF81C
LF826    ADC   #$01
VLINE    PHA
         JSR   LF800
         PLA
         CMP   $2D
         BCC   LF826
LF831    RTS

LF832    LDY   #$2F
         BNE   LF838
CLRTOP   LDY   #$27
LF838    STY   $2D
         LDY   #$27
LF83C    LDA   #$00
         STA   $30
         JSR   VLINE
         DEY
         BPL   LF83C
         RTS

LF847    PHA
         LSR
         AND   #$03
         ORA   #$04
         STA   $27
         PLA
         AND   #$18
         BCC   LF856
         ADC   #$7F
LF856    STA   $26
         ASL
         ASL
         ORA   $26
         STA   $26
         RTS

         LDA   $30
         CLC
         ADC   #$03
         AND   #$0F
         STA   $30
         ASL
         ASL
         ASL
         ASL
         ORA   $30
         STA   $30
         RTS

         LSR
         PHP
         JSR   LF847
         LDA   ($26),Y
         PLP
LF879    BCC   LF87F
         LSR
         LSR
         LSR
         LSR
LF87F    AND   #$0F
         RTS

LF882    LDX   $3A
         LDY   $3B
         JSR   LFD96
         JSR   LF948
         LDA   ($3A,X)
         TAY
         LSR
         BCC   LF89B
         ROR
         BCS   LF8A5
         CMP   #$A2
         BEQ   LF8A5
         AND   #$87
LF89B    LSR
         TAX
         LDA   FMT1,X
         JSR   LF879
         BNE   LF8A9
LF8A5    LDY   #$80
         LDA   #$00
LF8A9    TAX
         LDA   FMT2,X
         STA   $2E
         AND   #$03
         STA   $2F
         TYA
         AND   #$8F
         TAX
         TYA
         LDY   #$03
         CPX   #$8A
         BEQ   LF8C9
LF8BE    LSR
         BCC   LF8C9
         LSR
LF8C2    LSR
         ORA   #$20
         DEY
         BNE   LF8C2
         INY
LF8C9    DEY
         BNE   LF8BE
         RTS

         DB    $FF
         DB    $FF
         DB    $FF
LF8D0    JSR   LF882
         PHA
LF8D4    LDA   ($3A),Y
         JSR   PRBYTE
         LDX   #$01
LF8DB    JSR   LF94A
         CPY   $2F
         INY
         BCC   LF8D4
         LDX   #$03
         CPY   #$04
         BCC   LF8DB
         PLA
         TAY
         LDA   MNEML,Y
         STA   $2C
         LDA   MNEMR,Y
         STA   $2D
LF8F5    LDA   #$00
         LDY   #$05
LF8F9    ASL   $2D
         ROL   $2C
         ROL
         DEY
         BNE   LF8F9
         ADC   #$BF
         JSR   COUT
         DEX
         BNE   LF8F5
         JSR   LF948
         LDY   $2F
         LDX   #$06
LF910    CPX   #$03
         BEQ   LF930
LF914    ASL   $2E
         BCC   LF926
         LDA   CHAR1-1,X
         JSR   COUT
         LDA   CHAR2-1,X
         BEQ   LF926
         JSR   COUT
LF926    DEX
         BNE   LF910
         RTS

LF92A    DEY
         BMI   LF914
         JSR   PRBYTE
LF930    LDA   $2E
         CMP   #$E8
         LDA   ($3A),Y
         BCC   LF92A
         JSR   LF956
         TAX
         INX
         BNE   LF940
         INY
LF940    TYA
         JSR   PRBYTE
         TXA
         JMP   PRBYTE

LF948    LDX   #$03
LF94A    LDA   #$A0
         JSR   COUT
         DEX
         BNE   LF94A
         RTS

LF953    SEC
         LDA   $2F
LF956    LDY   $3B
         TAX
         BPL   LF95C
         DEY
LF95C    ADC   $3A
         BCC   LF961
         INY
LF961    RTS

FMT1     DB    $04
         DB    $20
         DB    $54
         DB    $30
         DB    $0D
         DB    $80
         DB    $04
         DB    $90
         DB    $03
         DB    $22
         DB    $54
         DB    $33
         DB    $0D
         DB    $80
         DB    $04
         DB    $90
         DB    $04
         DB    $20
         DB    $54
         DB    $33
         DB    $0D
         DB    $80
         DB    $04
         DB    $90
         DB    $04
         DB    $20
         DB    $54
         DB    $3B
         DB    $0D
         DB    $80
         DB    $04
         DB    $90
         DB    $00
         DB    $22
         DB    $44
         DB    $33
         DB    $0D
         DB    $C8
         DB    $44
         DB    $00
         DB    $11
         DB    $22
         DB    $44
         DB    $33
         DB    $0D
         DB    $C8
         DB    $44
         DB    $A9
         DB    $01
         DB    $22
         DB    $44
         DB    $33
         DB    $0D
         DB    $80
         DB    $04
         DB    $90
         DB    $01
         DB    $22
         DB    $44
         DB    $33
         DB    $0D
         DB    $80
         DB    $04
         DB    $90
         DB    $26
         DB    $31
         DB    $87
         DB    $9A
FMT2     DB    $00
         DB    $21
         DB    $81
         DB    $82
         DB    $00
         DB    $00
         DB    $59
         DB    $4D
         DB    $91
         DB    $92
         DB    $86
         DB    $4A
         DB    $85
         DB    $9D
CHAR1    DB    $AC
         DB    $A9
         DB    $AC
         DB    $A3
         DB    $A8
         DB    $A4
CHAR2    DB    $D9
         DB    $00
         DB    $D8
         DB    $A4
         DB    $A4
         DB    $00

MNEML    DB    $1C
         DB    $8A
         DB    $1C
         DB    $23
         DB    $5D
         DB    $8B
         DB    $1B
         DB    $A1
         DB    $9D
         DB    $8A
         DB    $1D
         DB    $23
         DB    $9D
         DB    $8B
         DB    $1D
         DB    $A1
         DB    $00
         DB    $29
         DB    $19
         DB    $AE
         DB    $69
         DB    $A8
         DB    $19
         DB    $23
         DB    $24
         DB    $53
         DB    $1B
         DB    $23
         DB    $24
         DB    $53
         DB    $19
         DB    $A1
         DB    $00
         DB    $1A
         DB    $5B
         DB    $5B
         DB    $A5
         DB    $69
         DB    $24
         DB    $24
         DB    $AE
         DB    $AE
         DB    $A8
         DB    $AD
         DB    $29
         DB    $00
         DB    $7C
         DB    $00
         DB    $15
         DB    $9C
         DB    $6D
         DB    $9C
         DB    $A5
         DB    $69
         DB    $29
         DB    $53
         DB    $84
         DB    $13
         DB    $34
         DB    $11
         DB    $A5
         DB    $69
         DB    $23
         DB    $A0

MNEMR    DB    $D8
         DB    $62
         DB    $5A
         DB    $48
         DB    $26
         DB    $62
         DB    $94
         DB    $88
         DB    $54
         DB    $44
         DB    $C8
         DB    $54
         DB    $68
         DB    $44
         DB    $E8
         DB    $94
         DB    $00
         DB    $B4
         DB    $08
         DB    $84
         DB    $74
         DB    $B4
         DB    $28
         DB    $6E
         DB    $74
         DB    $F4
         DB    $CC
         DB    $4A
         DB    $72
         DB    $F2
         DB    $A4
         DB    $8A
         DB    $00
         DB    $AA
         DB    $A2
         DB    $A2
         DB    $74
         DB    $74
         DB    $74
         DB    $72
         DB    $44
         DB    $68
         DB    $B2
         DB    $32
         DB    $B2
         DB    $00
         DB    $22
         DB    $00
         DB    $1A
         DB    $1A
         DB    $26
         DB    $26
         DB    $72
         DB    $72
         DB    $88
         DB    $C8
         DB    $C4
         DB    $CA
         DB    $26
         DB    $48
         DB    $44
         DB    $44
         DB    $A2
         DB    $C8

LFA40    STA   $45
         PLA
         PHA
         ASL
         ASL
         ASL
         BMI   LFA4C
         JMP   (IRQLOC)

LFA4C    PLP
         JSR   LFF4C
         PLA
         STA   $3A
         PLA
         STA   $3B
         JMP   ($03F0)

LFA59    JSR   LF882
         JSR   LFADA
         JMP   LFF65

LFA62    CLD
         JSR   LFE84
         JSR   LFB2F
         JSR   LFE93
         JSR   LFE89
LFA6F    LDA   SETAN0
         LDA   SETAN1
         LDA   CLRAN2
         LDA   CLRAN3
         LDA   CLRROM
         BIT   KBDSTROBE

*
* This is the change in the AUTOSTART ROM
* It forces a jump to the DIAG CODE
*

LFA81    JMP   FNDSLOT	; WAS CLD JSR BELL
         DB    $FF

         LDA   SOFTEV+1
         EOR   #$A5
         CMP   PWREDUP
         BNE   LFAA6
         LDA   SOFTEV
         BNE   LFAA3
         LDA   #$E0
         CMP   SOFTEV+1
         BNE   LFAA3
LFA9B    LDY   #$03
         STY   SOFTEV
         JMP   LE000
LFAA3    JMP   (SOFTEV)

LFAA6    JSR   LFB60
         LDX   #$05
LFAAB    LDA   LFAFC,X
         STA   $03EF,X
         DEX
         BNE   LFAAB
         LDA   #$C8
         STX   $00
         STA   $01
LFABA    LDY   #$07
         DEC   $01
         LDA   $01
         CMP   #$C0
         BEQ   LFA9B
         STA   MSLOT
LFAC7    LDA   ($00),Y
         CMP   LFB02-1,Y
         BNE   LFABA
         DEY
         DEY
         BPL   LFAC7
         JMP   ($0000)

         NOP
         NOP
LFAD7    JSR   CROUT
LFADA    LDA   #$45
         STA   $40
         LDA   #$00
         STA   $41
         LDX   #$FB
LFAE4    LDA   #$A0
         JSR   COUT
         LDA   LFB19-$FB,X
         JSR   COUT
         LDA   #$BD
         JSR   COUT
         LDA   $4A,X
         JSR   PRBYTE
         INX
         BMI   LFAE4
LFAFC    RTS

*
*
*

LFAFD    DA    LFA59
         DA    $E000
         DB    $45
LFB02    HEX   20FF00FF03FF3C
LFB09    ASC   "APPLE ]["
XLTBL    ASC   "DBA"FF"C"FFFFFF
LFB19    ASC   "AXYPS"

*
*
*

LFB1E    LDA   PTRIG
         LDY   #$00
         NOP
         NOP
LFB25    LDA   $C064,X
         BPL   LFB2E
         INY
         BNE   LFB25
         DEY
LFB2E    RTS

LFB2F    LDA   #$00
         STA   $48
         LDA   LORES
SETTXT   LDA   TXTPAGE1
         LDA   TXTSET
         LDA   #$00
         BEQ   LFB4B

SETGR    LDA   TXTCLR
         LDA   MIXSET
         JSR   CLRTOP
         LDA   #$14
LFB4B    STA   $22
         LDA   #$00
         STA   $20
         LDA   #$28
         STA   $21
         LDA   #$18
         STA   $23
         LDA   #$17
         STA   CV
         JMP   LFC22

LFB60    JSR   HOME
         LDY   #$08
LFB65    LDA   LFB09-1,Y
         STA   $040E,Y
         DEY
         BNE   LFB65
         RTS

LFB6F    LDA   SOFTEV+1
         EOR   #$A5
         STA   PWREDUP
         RTS

LFB78    CMP   #$8D
         BNE   LFB94
         LDY   KBD
         BPL   LFB94
         CPY   #$93
         BNE   LFB94
         BIT   KBDSTROBE
LFB88    LDY   KBD
         BPL   LFB88
         CPY   #$83
         BEQ   LFB94
         BIT   KBDSTROBE
LFB94    JMP   LFBFD

LFB97    SEC
         JMP   LFC2C

LFB9B    TAY
         LDA   XLTBL-$C9,Y
         JSR   LFB97
         JSR   LFD0C
LFBA5    CMP   #$CE
         BCS   LFB97
         CMP   #$C9
         BCC   LFB97
         CMP   #$CC
         BEQ   LFB97
         BNE   LFB9B
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
LFBC1    PHA
         LSR
         AND   #$03
         ORA   #$04
         STA   $29
         PLA
         AND   #$18
         BCC   LFBD0
         ADC   #$7F
LFBD0    STA   $28
         ASL
         ASL
         ORA   $28
         STA   $28
         RTS

LFBD9    CMP   #$87
         BNE   LFBEF
         LDA   #$40
         JSR   WAIT
         LDY   #$C0
LFBE4    LDA   #$0C
         JSR   WAIT
         LDA   SPKR
         DEY
         BNE   LFBE4
LFBEF    RTS

LFBF0    LDY   CH
         STA   ($28),Y
LFBF4    INC   CH
         LDA   CH
         CMP   $21
         BCS   LFC62
LFBFC    RTS

LFBFD    CMP   #$A0
         BCS   LFBF0
         TAY
         BPL   LFBF0
         CMP   #$8D
         BEQ   LFC62
         CMP   #$8A
         BEQ   LFC66
         CMP   #$88
         BNE   LFBD9
LFC10    DEC   CH
         BPL   LFBFC
         LDA   $21
         STA   CH
         DEC   CH
LFC1A    LDA   $22
         CMP   CV
         BCS   LFC2B
         DEC   CV
LFC22    LDA   CV
LFC24    JSR   LFBC1
         ADC   $20
         STA   $28
LFC2B    RTS

LFC2C    EOR   #$C0
         BEQ   HOME
         ADC   #$FD
         BCC   LFBF4
         BEQ   LFC10
         ADC   #$FD
         BCC   LFC66
         BEQ   LFC1A
         ADC   #$FD
         BCC   LFC9C
         BNE   LFC2B
         LDY   CH
         LDA   CV
LFC46    PHA
         JSR   LFC24
         JSR   LFC9E
         LDY   #$00
         PLA
         ADC   #$00
         CMP   $23
         BCC   LFC46
         BCS   LFC22

HOME     LDA   $22
         STA   CV
         LDY   #$00
         STY   CH
         BEQ   LFC46
LFC62    LDA   #$00
         STA   CH
LFC66    INC   CV
         LDA   CV
         CMP   $23
         BCC   LFC24
         DEC   CV
         LDA   $22
         PHA
         JSR   LFC24
LFC76    LDA   $28
         STA   $2A
         LDA   $29
         STA   $2B
         LDY   $21
         DEY
         PLA
         ADC   #$01
         CMP   $23
         BCS   LFC95
         PHA
         JSR   LFC24
LFC8C    LDA   ($28),Y
         STA   ($2A),Y
         DEY
         BPL   LFC8C
         BMI   LFC76
LFC95    LDY   #$00
         JSR   LFC9E
         BCS   LFC22
LFC9C    LDY   CH
LFC9E    LDA   #$A0
LFCA0    STA   ($28),Y
         INY
         CPY   $21
         BCC   LFCA0
         RTS

WAIT     SEC
LFCA9    PHA
LFCAA    SBC   #$01
         BNE   LFCAA
         PLA
         SBC   #$01
         BNE   LFCA9
         RTS

LFCB4    INC   $42
         BNE   LFCBA
         INC   $43
LFCBA    LDA   $3C
         CMP   $3E
         LDA   $3D
         SBC   $3F
         INC   $3C
         BNE   LFCC8
         INC   $3D
LFCC8    RTS

LFCC9    LDY   #$4B
         JSR   LFCDB
         BNE   LFCC9
         ADC   #$FE
         BCS   LFCC9
         LDY   #$21
LFCD6    JSR   LFCDB
         INY
         INY
LFCDB    DEY
         BNE   LFCDB
         BCC   LFCE5
         LDY   #$32
LFCE2    DEY
         BNE   LFCE2
LFCE5    LDY   $C020
         LDY   #$2C
         DEX
         RTS

LFCEC    LDX   #$08
LFCEE    PHA
         JSR   LFCFA
         PLA
         ROL
         LDY   #$3A
         DEX
         BNE   LFCEE
         RTS

LFCFA    JSR   LFCFD
LFCFD    DEY
         LDA   BUTN3
         EOR   $2F
         BPL   LFCFD
         EOR   $2F
         STA   $2F
         CPY   #$80
         RTS

LFD0C    LDY   CH
         LDA   ($28),Y
         PHA
         AND   #$3F
         ORA   #$40
         STA   ($28),Y
         PLA
         JMP   ($0038)

LFD1B    INC   $4E
         BNE   LFD21
         INC   $4F
LFD21    BIT   KBD
         BPL   LFD1B
         STA   ($28),Y
         LDA   KBD
         BIT   KBDSTROBE
         RTS

LFD2F    JSR   LFD0C
         JSR   LFBA5
LFD35    JSR   LFD0C
         CMP   #$9B
         BEQ   LFD2F
         RTS

LFD3D    LDA   $32
         PHA
         LDA   #$FF
         STA   $32
         LDA   $0200,X
         JSR   COUT
         PLA
         STA   $32
         LDA   $0200,X
         CMP   #$88
         BEQ   LFD71
         CMP   #$98
         BEQ   LFD62
         CPX   #$F8
         BCC   LFD5F
         JSR   BELL
LFD5F    INX
         BNE   LFD75
LFD62    LDA   #$DC
         JSR   COUT
LFD67    JSR   CROUT
         LDA   $33
         JSR   COUT
         LDX   #$01
LFD71    TXA
         BEQ   LFD67
         DEX
LFD75    JSR   LFD35
         CMP   #$95
         BNE   LFD7E
         LDA   ($28),Y
LFD7E    CMP   #$E0
         BCC   LFD84
         AND   #$DF
LFD84    STA   $0200,X
         CMP   #$8D
         BNE   LFD3D
         JSR   LFC9C
CROUT    LDA   #$8D
         BNE   COUT
LFD92    LDY   $3D
         LDX   $3C
LFD96    JSR   CROUT
         JSR   LF940
         LDY   #$00
         LDA   #$AD
         JMP   COUT

LFDA3    LDA   $3C
         ORA   #$07
         STA   $3E
         LDA   $3D
         STA   $3F
LFDAD    LDA   $3C
         AND   #$07
         BNE   LFDB6
LFDB3    JSR   LFD92
LFDB6    LDA   #$A0
         JSR   COUT
         LDA   ($3C),Y
         JSR   PRBYTE
         JSR   LFCBA
         BCC   LFDAD
         RTS

LFDC6    LSR
         BCC   LFDB3
         LSR
         LSR
         LDA   $3E
         BCC   LFDD1
         EOR   #$FF
LFDD1    ADC   $3C
         PHA
         LDA   #$BD
         JSR   COUT
         PLA

PRBYTE   PHA
         LSR
         LSR
         LSR
         LSR
         JSR   LFDE5
         PLA
         AND   #$0F
LFDE5    ORA   #$B0
         CMP   #$BA
         BCC   COUT
         ADC   #$06

COUT    JMP   ($0036)

LFDF0    CMP   #$A0
         BCC   LFDF6
         AND   $32
LFDF6    STY   $35
         PHA
         JSR   LFB78
         PLA
         LDY   $35
         RTS

LFE00    DEC   $34
         BEQ   LFDA3
LFE04    DEX
         BNE   LFE1D
         CMP   #$BA
         BNE   LFDC6
         STA   $31
         LDA   $3E
         STA   ($40),Y
         INC   $40
         BNE   LFE17
         INC   $41
LFE17    RTS

LFE18    LDY   $34
         LDA   $01FF,Y
LFE1D    STA   $31
         RTS

LFE20    LDX   #$01
LFE22    LDA   $3E,X
         STA   $42,X
         STA   $44,X
         DEX
         BPL   LFE22
         RTS

LFE2C    LDA   ($3C),Y
         STA   ($42),Y
         JSR   LFCB4
         BCC   LFE2C
         RTS

LFE36    LDA   ($3C),Y
         CMP   ($42),Y
         BEQ   LFE58
         JSR   LFD92
         LDA   ($3C),Y
         JSR   PRBYTE
         LDA   #$A0
         JSR   COUT
         LDA   #$A8
         JSR   COUT
         LDA   ($42),Y
         JSR   PRBYTE
         LDA   #$A9
         JSR   COUT
LFE58    JSR   LFCB4
         BCC   LFE36
         RTS

LFE5E    JSR   LFE75
         LDA   #$14
LFE63    PHA
         JSR   LF8D0
         JSR   LF953
         STA   $3A
         STY   $3B
         PLA
         SEC
         SBC   #$01
         BNE   LFE63
         RTS

LFE75    TXA
         BEQ   LFE7F
LFE78    LDA   $3C,X
         STA   $3A,X
         DEX
         BPL   LFE78
LFE7F    RTS

LFE80    LDY   #$3F
         BNE   LFE86
LFE84    LDY   #$FF
LFE86    STY   $32
         RTS

LFE89    LDA   #$00
         STA   $3E
LFE8D    LDX   #$38
         LDY   #$1B
         BNE   LFE9B
LFE93    LDA   #$00
         STA   $3E
LFE97    LDX   #$36
         LDY   #$F0
LFE9B    LDA   $3E
         AND   #$0F
         BEQ   LFEA7
         ORA   #$C0
         LDY   #$00
         BEQ   LFEA9
LFEA7    LDA   #$FD
LFEA9    STY   $00,X
         STA   $01,X
         RTS

         NOP
         NOP
LFEB0    JMP   LE000
LFEB3    JMP   LE003

LFEB6    JSR   LFE75
         JSR   LFF3F
         JMP   ($003A)
LFEBF    JMP   LFAD7
LFEC2    RTS

         NOP
         RTS

LFEC5    NOP
         NOP
         NOP
         NOP
         NOP
LFECA    JMP   USRADR

LFECD    LDA   #$40
         JSR   LFCC9
         LDY   #$27
LFED4    LDX   #$00
         EOR   ($3C,X)
         PHA
         LDA   ($3C,X)
         JSR   LFEED
         JSR   LFCBA
         LDY   #$1D
         PLA
         BCC   LFED4
         LDY   #$22
         JSR   LFEED
         BEQ   BELL
LFEED    LDX   #$10
LFEEF    ASL
         JSR   LFCD6
         BNE   LFEEF
         RTS

LFEF6    JSR   LFE00
         PLA
         PLA
         BNE   MONZ
LFEFD    JSR   LFCFA
         LDA   #$16
         JSR   LFCC9
         STA   $2E
         JSR   LFCFA
LFF0A    LDY   #$24
         JSR   LFCFD
         BCS   LFF0A
         JSR   LFCFD
         LDY   #$3B
LFF16    JSR   LFCEC
         STA   ($3C,X)
         EOR   $2E
         STA   $2E
         JSR   LFCBA
         LDY   #$35
         BCC   LFF16
         JSR   LFCEC
         CMP   $2E
         BEQ   BELL
         LDA   #$C5
         JSR   COUT
         LDA   #$D2
         JSR   COUT
         JSR   COUT

BELL     LDA   #$87
         JMP   COUT

LFF3F    LDA   $48
         PHA
         LDA   $45
         LDX   $46
         LDY   $47
         PLP
         RTS

LFF4A    STA   $45
LFF4C    STX   $46
         STY   $47
         PHP
         PLA
         STA   $48
         TSX
         STX   $49
         CLD
         RTS

LFF59    JSR   LFE84
         JSR   LFB2F
         JSR   LFE93
         JSR   LFE89
LFF65    CLD
         JSR   BELL

MONZ     LDA   #$AA
         STA   $33
         JSR   LFD67
         JSR   LFFC7
LFF73    JSR   LFFA7
         STY   $34
         LDY   #$17
LFF7A    DEY
         BMI   LFF65
         CMP   LFFCC,Y
         BNE   LFF7A
         JSR   LFFBE
         LDY   $34
         JMP   LFF73

LFF8A    LDX   #$03
         ASL
         ASL
         ASL
         ASL
LFF90    ASL
         ROL   $3E
         ROL   $3F
         DEX
         BPL   LFF90
LFF98    LDA   $31
         BNE   LFFA2
         LDA   $3F,X
         STA   $3D,X
         STA   $41,X
LFFA2    INX
         BEQ   LFF98
         BNE   LFFAD
LFFA7    LDX   #$00
         STX   $3E
         STX   $3F
LFFAD    LDA   $0200,Y
         INY
         EOR   #$B0
         CMP   #$0A
         BCC   LFF8A
         ADC   #$88
         CMP   #$FA
         BCS   LFF8A
         RTS

LFFBE    LDA   #>LFE00
         PHA
         LDA   LFFE3,Y
         PHA
         LDA   $31
LFFC7    LDY   #$00
         STY   $31
         RTS

LFFCC    HEX   BCB2BEB2EFC4B2A9BBA6A40695070205F000EB93A7C699
LFFE3    DB    LFEB3-1
         DB    LFECA-1
         DB    LFEBF-1
         DB    LFEC2-1
         DB    LFE36-1
         DB    LFE8D-1
         DB    LFEC5-1
         DB    LFE97-1
         DB    LFEB0-1
         DB    LFE18-1
         DB    LFE18-1
         DB    LFE2C-1
         DB    LFE20-1
         DB    LFE84-1
         DB    LFE80-1
         DB    LFE5E-1
         DB    LFECD-1
         DB    LFEB6-1
         DB    LFEFD-1
         DB    LFE18-1
         DB    LFE18-1
         DB    LFEF6-1
         DB    LFE04-1

         DA    $03FB
         DA    LFA62
         DA    LFA40
