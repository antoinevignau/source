*
* Ultima II: The Revenge of the Enchanteress
*
* (c) 1982, Sierra On-Line
* (s) 2020, John Disam
*

         TYP   BIN
         ORG   $8900
         MX    %11
         LST   OFF

*----------------------------

TXTCLR   EQU   $C050
HIRES    EQU   $C057

*----------------------------

L8900    LDA   $02
         STA   $6A
         LDA   $03
         STA   $6B
         LDA   $FB
         BEQ   L8915
         JSR   L8951
         JSR   L89D7
         JSR   L8F58
L8915    LDA   $02
         STA   $6A
         LDA   $03
         STA   $6B
         LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L8F42
         STA   $12
         LDA   $00
         CLC
         ADC   $6A
         STA   $F4
         LDA   $01
         CLC
         ADC   $6B
         STA   $F5
         JSR   L8F42
         STA   $13
         LDA   $00
         SEC
         SBC   $6A
         STA   $F4
         LDA   $01
         SEC
         SBC   $6B
         STA   $F5
         JSR   L8F42
         STA   $14
         RTS

L8951    CLC
         LDA   $00
         STA   $5C
         ADC   $6B
         STA   $5A
         SEC
         LDA   $01
         STA   $5D
         SBC   $6A
         STA   $5B
         SEC
         LDA   $00
         SBC   $6B
         STA   $5E
         CLC
         LDA   $01
         ADC   $6A
         STA   $5F
         LDX   #$00
L8973    LDA   $5A
         AND   #$3F
         STA   $F4
         CLC
         ADC   $6A
         STA   $5A
         LDA   $5B
         AND   #$3F
         STA   $F5
         CLC
         ADC   $6B
         STA   $5B
         JSR   L8F42
         AND   #$F0
         STA   $70,X
         LDA   $5C
         AND   #$3F
         STA   $F4
         CLC
         ADC   $6A
         STA   $5C
         LDA   $5D
         AND   #$3F
         STA   $F5
         CLC
         ADC   $6B
         STA   $5D
         JSR   L8F42
         AND   #$F0
         STA   $78,X
         JSR   L8F42
         AND   #$07
         STA   $90,X
         LDA   $5E
         AND   #$3F
         STA   $F4
         CLC
         ADC   $6A
         STA   $5E
         LDA   $5F
         AND   #$3F
         STA   $F5
         CLC
         ADC   $6B
         STA   $5F
         JSR   L8F42
         AND   #$F0
         STA   $80,X
         INX
         CPX   #$08
         BCC   L8973
         RTS

L89D7    JSR   L8FF4
         BIT   HIRES
         BIT   TXTCLR
         LDA   #$00
         STA   $69
         JSR   L8BD0
L89E7    LDX   $69
         LDA   $78,X
         BPL   L8A0E
         JSR   L8BD0
         LDA   $78,X
         AND   #$40
         BEQ   L8A6F
         LDA   $78,X
         AND   #$20
         BNE   L8A6F
         JSR   L8C07
         LDA   $69
         BNE   L8A6F
         INC   $69
         LDA   $69
         CMP   #$08
         BCS   L8A6F
         JMP   L89E7

L8A0E    LDA   $78,X
         AND   #$20
         BEQ   L8A17
         JSR   L8C96
L8A17    LDA   $78,X
         AND   #$10
         BEQ   L8A23
         JSR   L8CD8
         JMP   L8A2C

L8A23    LDA   $78,X
         AND   #$40
         BEQ   L8A2C
         JSR   L8D45
L8A2C    LDA   $70,X
         BPL   L8A45
         JSR   L8B70
         LDA   $70,X
         AND   #$40
         BEQ   L8A48
         LDA   $70,X
         AND   #$20
         BNE   L8A48
         JSR   L8C34
         JMP   L8A48

L8A45    JSR   L8AF4
L8A48    LDA   $80,X
         BPL   L8A61
         JSR   L8BA0
         LDA   $80,X
         AND   #$40
         BEQ   L8A64
         LDA   $80,X
         AND   #$20
         BNE   L8A64
         JSR   L8C66
         JMP   L8A64

L8A61    JSR   L8B32
L8A64    INC   $69
         LDA   $69
         CMP   #$07
         BCS   L8A6F
         JMP   L89E7
L8A6F    RTS

L8A70    DB    $00
L8A71    DB    $40
L8A72    DB    $60
L8A73    DB    $70
         DB    $78
         DB    $7C
         DB    $7E
         DB    $7F
         DB    $7F
         DB    $7F
L8A7A    DB    $FF
L8A7B    DB    $BF
L8A7C    DB    $9F
L8A7D    DB    $8F
         DB    $87
         DB    $83
         DB    $81
         DB    $80
         DB    $80
         DB    $80
L8A84    DB    $00
L8A85    DB    $20
         DB    $30
         DB    $38
         DB    $3C
         DB    $3E
         DB    $3F
         DB    $3F
L8A8C    DB    $7F
L8A8D    DB    $5F
         DB    $4F
         DB    $47
         DB    $43
         DB    $41
         DB    $40
         DB    $40
L8A94    DB    $10
L8A95    DB    $48
         DB    $64
         DB    $72
         DB    $79
         DB    $7C
         DB    $7F
         DB    $7F
L8A9C    DB    $30
L8A9D    DB    $58
         DB    $6C
         DB    $76
         DB    $7B
         DB    $7C
         DB    $7F
         DB    $7F
L8AA4    DB    $EF
L8AA5    DB    $B7
         DB    $9B
         DB    $8D
         DB    $86
         DB    $83
         DB    $80
         DB    $80
L8AAC    DB    $CF
L8AAD    DB    $A7
         DB    $93
         DB    $89
         DB    $84
         DB    $83
         DB    $80
         DB    $80
L8AB4    DB    $77
         DB    $5B
         DB    $4D
         DB    $46
         DB    $42
         DB    $40
         DB    $40
         DB    $40
L8ABC    DB    $67
         DB    $53
         DB    $49
         DB    $44
         DB    $42
         DB    $40
         DB    $40
         DB    $40
L8AC4    DB    $2A
         DB    $35
         DB    $3B
         DB    $3D
         DB    $3E
         DB    $3F
         DB    $3F
         DB    $3F
L8ACC    DB    $08
         DB    $24
         DB    $32
         DB    $39
         DB    $3C
         DB    $3E
         DB    $3F
         DB    $3F
L8AD4    DB    $18
         DB    $2C
         DB    $36
         DB    $3A
         DB    $3D
         DB    $3E
         DB    $3F
         DB    $3F
L8ADC    DB    $77
         DB    $5B
         DB    $4D
         DB    $46
         DB    $43
         DB    $41
         DB    $40
         DB    $40
L8AE4    DB    $67
         DB    $53
         DB    $49
         DB    $45
         DB    $42
         DB    $41
         DB    $40
         DB    $40
L8AEC    DB    $6F
         DB    $57
         DB    $4B
         DB    $45
         DB    $42
         DB    $40
         DB    $40
         DB    $40

L8AF4    LDX   $69
         LDA   L8A70,X
         STA   $60
         STA   $62
         LDA   L8A84,X
         STA   $61
         LDA   L8A8C,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A85,X
         STA   $61
         STA   $63
         LDA   L8A71,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8A8D,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A70,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         RTS

L8B32    LDX   $69
         LDA   L8A7A,X
         STA   $60
         STA   $62
         LDA   L8A84,X
         STA   $61
         LDA   L8A8C,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A85,X
         STA   $61
         STA   $63
         LDA   L8A7B,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8A8D,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A7A,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         RTS

L8B70    LDX   $69
         LDA   L8A70,X
         STA   $60
         LDA   L8A71,X
         STA   $62
         LDA   L8A84,X
         STA   $61
         LDA   L8A85,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A70,X
         STA   $62
         LDA   L8A8C,X
         STA   $63
         LDA   L8A8D,X
         STA   $61
         JSR   L8DC5
         LDX   $69
         RTS

L8BA0    LDX   $69
         LDA   L8A7A,X
         STA   $60
         LDA   L8A7B,X
         STA   $62
         LDA   L8A84,X
         STA   $61
         LDA   L8A85,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A7A,X
         STA   $62
         LDA   L8A8C,X
         STA   $63
         LDA   L8A8D,X
         STA   $61
         JSR   L8DC5
         LDX   $69
         RTS

L8BD0    LDX   $69
         LDA   L8A70,X
         STA   $60
         LDA   L8A84,X
         STA   $61
         STA   $63
         LDA   L8A7A,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8A8C,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A70,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8A84,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         RTS

L8C07    LDX   $69
         LDA   L8A71,X
         STA   $60
         STA   $62
         LDA   L8A8C,X
         STA   $61
         LDA   L8A85,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A7B,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8A8C,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         RTS

L8C34    LDX   $69
         LDA   L8A94,X
         STA   $60
         STA   $62
         LDA   L8AB4,X
         STA   $61
         LDA   L8A85,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A9C,X
         STA   $62
         LDA   L8AC4,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8ABC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         RTS

L8C66    LDX   $69
         LDA   L8AA4,X
         STA   $60
         STA   $62
         LDA   L8AB4,X
         STA   $61
         LDA   L8A85,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8AAC,X
         STA   $62
         LDA   L8AC4,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8ABC,X
         STA   $63
         JSR   L8DC5
         RTS

L8C96    LDX   $69
         LDA   L8A95,X
         STA   $60
         LDA   L8A9D,X
         STA   $62
         LDA   L8ADC,X
         STA   $61
         LDA   L8AE4,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8AAD,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8AA5,X
         STA   $62
         LDA   L8ADC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A95,X
         STA   $62
         JSR   L8DC5
         JSR   L8D1A
         LDX   $69
         RTS

L8CD8    LDX   $69
         LDA   L8A95,X
         STA   $60
         LDA   L8A9D,X
         STA   $62
         LDA   L8ACC,X
         STA   $61
         LDA   L8AD4,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8AAD,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8AA5,X
         STA   $62
         LDA   L8ACC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A95,X
         STA   $62
         JSR   L8DC5
         JSR   L8D1A
         LDX   $69
         RTS

L8D1A    LDX   $69
         LDA   #$7F
         STA   $60
         STA   $62
         LDA   L8ACC,X
         STA   $61
         LDA   L8ADC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   #$80
         STA   $60
         STA   $62
         LDA   L8ACC,X
         STA   $61
         LDA   L8ADC,X
         STA   $63
         JSR   L8DC5
         RTS

L8D45    LDA   L8A72,X
         STA   $60
         LDA   L8AEC,X
         STA   $61
         STA   $63
         LDA   L8A7D,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8AB4,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A72,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8AEC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A73,X
         STA   $62
         LDA   L8ABC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A7C,X
         STA   $62
         JSR   L8DC5
         LDX   $69
         LDA   L8AEC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A7D,X
         STA   $62
         LDA   L8AB4,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         LDA   L8A7D,X
         STA   $60
         LDA   L8AEC,X
         STA   $61
         LDA   L8A7C,X
         STA   $62
         LDA   L8ABC,X
         STA   $63
         JSR   L8DC5
         LDX   $69
         RTS

L8DC5    LDA   $62
         CMP   $60
         BNE   L8DD2
         LDA   $63
         CMP   $61
         BNE   L8DD2
         RTS

L8DD2    SEC
         LDA   $62
         SBC   $60
         STA   $6A
         BCS   L8DE8
         EOR   #$FF
         STA   $6A
         INC   $6A
         LDA   #$FF
         STA   $64
         JMP   L8DEC

L8DE8    LDA   #$01
         STA   $64
L8DEC    SEC
         LDA   $63
         SBC   $61
         STA   $6B
         BCS   L8E02
         EOR   #$FF
         STA   $6B
         INC   $6B
         LDA   #$FF
         STA   $65
         JMP   L8E06

L8E02    LDA   #$01
         STA   $65
L8E06    LDA   $6A
         CMP   $6B
         BCS   L8E0F
         JMP   L8E3A

L8E0F    LDA   $6A
         STA   $66
         LSR
         STA   $67
L8E16    CLC
         LDA   $67
         ADC   $6B
         STA   $67
         SEC
         SBC   $6A
         BCC   L8E2B
         STA   $67
         CLC
         LDA   $61
         ADC   $65
         STA   $61
L8E2B    CLC
         LDA   $60
         ADC   $64
         STA   $60
         JSR   L8FB6
         DEC   $66
         BNE   L8E16
         RTS

L8E3A    LDA   $6B
         STA   $66
         LSR
         STA   $67
L8E41    CLC
         LDA   $67
         ADC   $6A
         STA   $67
         SEC
         SBC   $6B
         BCC   L8E56
         STA   $67
         CLC
         LDA   $60
         ADC   $64
         STA   $60
L8E56    CLC
         LDA   $61
         ADC   $65
         STA   $61
         JSR   L8FB6
         DEC   $66
         BNE   L8E41
         RTS

L8E65    LDA   $61
         CLC
         ADC   #$10
         TAY
         LDA   $472C,Y
         STA   $FE
         LDA   $47EC,Y
         STA   $FF
         LDX   $60
         LDY   $48AC,X
         INY
         LDA   $1F
         BEQ   L8E92
         CMP   #$01
         BEQ   L8EA4
         CMP   #$02
         BEQ   L8EB1
         CMP   #$03
         BEQ   L8ED0
         CMP   #$04
         BEQ   L8EDD
         JMP   L8E9A

L8E92    LDA   $49CB,X
         ORA   ($FE),Y
         STA   ($FE),Y
         RTS

L8E9A    LDA   $49CB,X
         EOR   #$7F
         AND   ($FE),Y
         STA   ($FE),Y
         RTS

L8EA4    LDA   L8EE8,Y
         EOR   #$7F
         AND   $49CB,X
         BNE   L8E92
         JMP   L8FD4

L8EB1    LDA   L8EE8,Y
         AND   $49CB,X
         BNE   L8E92
         JMP   L8FD4

L8EBC    LDA   $49CB,X
         ORA   #$80
         ORA   ($FE),Y
         STA   ($FE),Y
         RTS

L8EC6    LDA   $49CB,X
         EOR   #$FF
         AND   ($FE),Y
         STA   ($FE),Y
         RTS

L8ED0    LDA   L8EE8,Y
         EOR   #$7F
         AND   $49CB,X
         BEQ   L8EC6
         JMP   L8EBC

L8EDD    LDA   L8EE8,Y
         AND   $49CB,X
         BEQ   L8EC6
         JMP   L8EBC

L8EE8    HEX   552A552A552A552A552A552A552A552A
         HEX   552A552A552A552A552A552A552A552A
         HEX   552A552A552A552A

L8F10    LDA   $04
         CLC
         ASL
         ASL
         STA   $62
         STA   $60
         ADC   #$04
         STA   $64
         LDA   $05
         CLC
         ASL
         ASL
         STA   $63
         STA   $61
         ADC   #$04
         STA   $65
L8F2A    JSR   L8E65
         INC   $60
         LDA   $60
         CMP   $64
         BCC   L8F2A
         LDA   $62
         STA   $60
         INC   $61
         LDA   $61
         CMP   $65
         BCC   L8F2A
         RTS

L8F42    LDA   $F6
         CLC
         ADC   #$10
         STA   $FD
         LDA   $F5
         ASL
         ASL
         ASL
         ASL
         ADC   $F4
         STA   $FC
         LDY   #$00
         LDA   ($FC),Y
         RTS

L8F58    INC   $69
         LDX   #$00
L8F5C    INX
         CPX   $69
         BCC   L8F62
         RTS

L8F62    LDA   $90,X
         BEQ   L8F5C
         CPX   #$01
         BEQ   L8F7A
         LDA   #$08
         STA   $FD
         LDA   L8FAE,X
         STA   $FC
         LDA   $FD
         LDX   $FC
         JMP   L8F83

L8F7A    CLC
         ADC   #$08
         STA   $FD
         LDA   #$00
         STA   $FC
L8F83    LDY   #$00
         LDA   ($FC),Y
         BNE   L8F8A
         RTS

L8F8A    STA   $04
         JSR   L8FA7
         LDA   ($FC),Y
         AND   #$1F
         STA   $05
         LDA   ($FC),Y
         LSR
         LSR
         LSR
         LSR
         LSR
         STA   $1F
         JSR   L8FA7
         JSR   L8F10
         JMP   L8F83

L8FA7    INC   $FC
         BNE   L8FAD
         INC   $FD
L8FAD    RTS

L8FAE    HEX   000080C0E0F0F8FC

L8FB6    LDA   $61
         CLC
         ADC   #$10
         TAY
         LDA   $472C,Y
         STA   $FE
         LDA   $47EC,Y
         STA   $FF
         LDX   $60
         LDY   $48AC,X
         INY
         LDA   $49CB,X
         ORA   ($FE),Y
         STA   ($FE),Y
         RTS

L8FD4    LDA   $61
         CLC
         ADC   #$10
         TAY
         LDA   $472C,Y
         STA   $FE
         LDA   $47EC,Y
         STA   $FF
         LDX   $60
         LDY   $48AC,X
         INY
         LDA   $49CB,X
         EOR   #$FF
         AND   ($FE),Y
         STA   ($FE),Y
         RTS

L8FF4    LDA   #$20
         STA   $FB
         LDA   #$00
         TAY
         STA   $FA
L8FFD    STA   ($FA),Y
         INY
         BNE   L8FFD
         INC   $FB
         LDX   $FB
         CPX   #$40
         BCC   L8FFD
         RTS
