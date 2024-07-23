*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2020, Antoine Vignau
*

	mx	%11
	org	$f800
	lst	off

*-------------------------------
* CODE
*-------------------------------

LF800    JMP   LF80F      ; F800

LF803    DB    $00
LF804    DB    $00
LF805    DB    $00
LF806    DB    $00
LF807    DB    $00
LF808    DB    $00
LF809    DB    $00
LF80A    DB    $00
LF80B    DB    $00
LF80C    DB    $00
LF80D    DB    $00	; save Y
LF80E    DB    $00	; save X

LF80F    STY   LF80D
         STX   LF80E
         LDY   $10
         BNE   LF827
         TAY
         LDA   LF82E,Y
         STA   $0E
         LDA   LF83B,Y
         STA   $0E+1
         JMP   ($000E)

LF827    LDY   LF80D
         LDX   LF80E
         RTS

LF82E    DFB   <LF848,<LF859,<LF872,<LF888,<LF8AA,<LF8C0,<LF8CD,<LF8D7
         DFB   <LF8ED,<LF90D,<LF926,<LF943,<LF960
LF83B    DFB   >LF848,>LF859,>LF872,>LF888,>LF8AA,>LF8C0,>LF8CD,>LF8D7
         DFB   >LF8ED,>LF90D,>LF926,>LF943,>LF960

LF848    LDY   #$02
         LDX   #$20
         JSR   LF979
         LDY   #$01
         LDX   #$60
         JSR   LF979
         JMP   LF827

LF859    LDY   #$10
         LDX   #$20
         LDA   #$04
         STA   LF80A
         LDA   #$04
         STA   LF80B
         LDA   #$01
         STA   LF80C
         JSR   LF9DA
         JMP   LF827

LF872    LDY   #$20
         LDX   #$10
         LDA   #$04
         STA   LF80A
         JSR   LF98C
         LDY   #$20
         LDX   #$90
         JSR   LF979
         JMP   LF827

LF888    LDY   #$20
         LDX   #$80
         LDA   #$01
         STA   LF80A
         JSR   LF9B3
         LDY   #$20
         LDX   #$04
         JSR   LF979
         LDY   #$20
         LDX   #$10
         LDA   #$02
         STA   LF80A
         JSR   LF98C
         JMP   LF827

LF8AA    LDY   #$10
         LDX   #$80
         JSR   LF979
         LDY   #$20
         LDX   #$40
         LDA   #$01
         STA   LF80A
         JSR   LF98C
         JMP   LF827

LF8C0    LDY   #$08
         LDA   #$02
         STA   LF80A
         JSR   LFA12
         JMP   LF827

LF8CD    LDY   #$08
         LDX   #$30
         JSR   LF979
         JMP   LF827

LF8D7    LDY   #$40
         LDX   #$90
         LDA   #$02
         STA   LF80A
         JSR   LF9B3
         LDY   #$10
         LDX   #$B0
         JSR   LF979
         JMP   LF827

LF8ED    LDY   #$20
         LDX   #$10
         LDA   #$04
         STA   LF80A
         LDA   #$0A
         STA   LF80B
         LDA   #$00
         STA   LF80C
         JSR   LF9DA
         LDY   #$08
         LDX   #$03
         JSR   LF979
         JMP   LF827

LF90D    LDY   #$08
         LDX   #$02
         LDA   #$02
         STA   LF80A
         LDA   #$06
         STA   LF80B
         LDA   #$01
         STA   LF80C
         JSR   LF9DA
         JMP   LF827

LF926    LDY   #$30
         LDX   #$C0
         LDA   #$04
         STA   LF80A
         JSR   LF9B3
         LDY   #$20
         LDX   #$A0
         JSR   LF979
         LDY   #$20
         LDX   #$C0
         JSR   LF979
         JMP   LF827

LF943    LDY   #$20
         LDX   #$10
         JSR   LF979
         LDY   #$30
         LDX   #$10
         LDA   #$01
         STA   LF80A
         JSR   LF98C
         LDY   #$20
         LDX   #$80
         JSR   LF979
         JMP   LF827

LF960    LDY   #$08
         LDX   #$06
         LDA   #$01
         STA   LF80A
         LDA   #$03
         STA   LF80B
         LDA   #$00
         STA   LF80C
         JSR   LF9DA
         JMP   LF827

LF979    STX   LF808
LF97C    DEY
         BEQ   LF98B
         LDX   LF808
LF982    DEX
         BNE   LF982
         JSR   LFA2C
         JMP   LF97C
LF98B    RTS

LF98C    STX   LF808
         LDA   LF80A
         STA   LF809
LF995    DEY
         BEQ   LF9B2
         LDX   LF808
LF99B    DEX
         BNE   LF99B
         JSR   LFA2C
         DEC   LF809
         BNE   LF995
         LDA   LF80A
         STA   LF809
         DEC   LF808
         JMP   LF995
LF9B2    RTS

LF9B3    STX   LF808
         LDA   LF80A
         STA   LF809
LF9BC    DEY
         BEQ   LF9D9
         LDX   LF808
LF9C2    DEX
         BNE   LF9C2
         JSR   LFA2C
         DEC   LF809
         BNE   LF9BC
         LDA   LF80A
         STA   LF809
         INC   LF808
         JMP   LF9BC
LF9D9    RTS

LF9DA    STX   LF808
         LDA   LF80A
         STA   LF809
LF9E3    DEY
         BEQ   LFA11
         LDX   LF808
LF9E9    DEX
         BEQ   LF9F2
         JSR   LFA2C
         JMP   LF9E9

LF9F2    LDX   LF80B
LF9F5    DEX
         BNE   LF9F5
         LDA   LF80C
         BEQ   LFA00
         JSR   LFA2C

LFA00    DEC   LF809
         BNE   LF9E3
         LDA   LF80A
         STA   LF809
         DEC   LF808
         JMP   LF9E3
LFA11    RTS

LFA12    STY   LF809
LFA15    LDA   LF809
         BEQ   LFA2B
         JSR   LFA38
         TAX
         INX
         LDY   LF80A
         JSR   LF979
         DEC   LF809
         JMP   LFA15
LFA2B    RTS

LFA2C    STX   LF807
         LDX   #$10
         LDA   $C020,X
         LDX   LF807
         RTS

LFA38    LDA   LF803
         INC   LF803
         ROL
         SBC   LF806
         EOR   LF804
         ROL
         PHA
         ROR   LF804
         LDA   LF804
         ROR
         EOR   LF805
         ROR
         EOR   LF803
         ADC   LF806
         STA   LF803
         PLA
         STA   LF804
         PHA
         JSR   LFA65
         PLA
         RTS

LFA65    LDA   LF805
         ADC   #$07
         PHA
         LDA   LF804
         BMI   LFA7B
         PLA
         EOR   LF806
         STA   LF805
         DEC   LF806
         RTS

LFA7B    PLA
         SBC   #$33
         STA   LF805
         RTS

         DS    \

*-------------------------------
* DATA
*-------------------------------

LFB00    DB    $1E
         DB    $33
         DB    $33
         DB    $3F
         DB    $33
         DB    $33
         DB    $33
         DB    $00
         DB    $1F
         DB    $33
         DB    $33
         DB    $1F
         DB    $33
         DB    $33
         DB    $1F
         DB    $00
         DB    $1E
         DB    $33
         DB    $03
         DB    $03
         DB    $03
         DB    $33
         DB    $1E
         DB    $00
         DB    $1F
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $1F
         DB    $00
         DB    $3F
         DB    $03
         DB    $03
         DB    $1F
         DB    $03
         DB    $03
         DB    $3F
         DB    $00
         DB    $3F
         DB    $03
         DB    $03
         DB    $1F
         DB    $03
         DB    $03
         DB    $03
         DB    $00
         DB    $1E
         DB    $33
         DB    $03
         DB    $03
         DB    $3B
         DB    $33
         DB    $1E
         DB    $00
         DB    $33
         DB    $33
         DB    $33
         DB    $3F
         DB    $33
         DB    $33
         DB    $33
         DB    $00
         DB    $3F
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $3F
         DB    $00
         DB    $3F
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $07
         DB    $00
         DB    $33
         DB    $33
         DB    $1B
         DB    $0F
         DB    $1B
         DB    $33
         DB    $33
         DB    $00
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $3F
         DB    $00
         DB    $33
         DB    $3F
         DB    $3F
         DB    $3F
         DB    $33
         DB    $33
         DB    $33
         DB    $00
         DB    $33
         DB    $37
         DB    $37
         DB    $3F
         DB    $3B
         DB    $3B
         DB    $33
         DB    $00
         DB    $1E
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $1E
         DB    $00
         DB    $1F
         DB    $33
         DB    $33
         DB    $1F
         DB    $03
         DB    $03
         DB    $03
         DB    $00
         DB    $1E
         DB    $33
         DB    $33
         DB    $33
         DB    $3F
         DB    $3B
         DB    $3E
         DB    $00
         DB    $1F
         DB    $33
         DB    $33
         DB    $1F
         DB    $0F
         DB    $1B
         DB    $33
         DB    $00
         DB    $1E
         DB    $33
         DB    $03
         DB    $0E
         DB    $38
         DB    $33
         DB    $1E
         DB    $00
         DB    $3F
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $00
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $1E
         DB    $00
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $1E
         DB    $0C
         DB    $00
         DB    $33
         DB    $33
         DB    $33
         DB    $3F
         DB    $3F
         DB    $3F
         DB    $33
         DB    $00
         DB    $33
         DB    $33
         DB    $1E
         DB    $0C
         DB    $1E
         DB    $33
         DB    $33
         DB    $00
         DB    $33
         DB    $33
         DB    $33
         DB    $1E
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $00
         DB    $3F
         DB    $30
         DB    $18
         DB    $0C
         DB    $06
         DB    $03
         DB    $3F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0C
         DB    $0C
         DB    $00
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $00
         DB    $0C
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $1C
         DB    $22
         DB    $20
         DB    $18
         DB    $08
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

LFC00    DB    $1E
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $33
         DB    $1E
         DB    $00
         DB    $0C
         DB    $0E
         DB    $0F
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $3F
         DB    $00
         DB    $1E
         DB    $33
         DB    $30
         DB    $18
         DB    $0C
         DB    $06
         DB    $3F
         DB    $00
         DB    $1E
         DB    $33
         DB    $30
         DB    $1C
         DB    $30
         DB    $33
         DB    $1E
         DB    $00
         DB    $30
         DB    $33
         DB    $33
         DB    $33
         DB    $3F
         DB    $30
         DB    $30
         DB    $00
         DB    $3F
         DB    $33
         DB    $03
         DB    $1F
         DB    $30
         DB    $33
         DB    $1E
         DB    $00
         DB    $1E
         DB    $33
         DB    $03
         DB    $1F
         DB    $33
         DB    $33
         DB    $1E
         DB    $00
         DB    $1F
         DB    $33
         DB    $30
         DB    $18
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $00
         DB    $1E
         DB    $33
         DB    $33
         DB    $1E
         DB    $33
         DB    $33
         DB    $1E
         DB    $00
         DB    $1E
         DB    $33
         DB    $33
         DB    $33
         DB    $3E
         DB    $30
         DB    $30
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $3E
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFC60    DB    $80
         DB    $20
         DB    $20
         DB    $14
         DB    $20
         DB    $0F
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFC70    DB    $06
         DB    $00
         DB    $0C
         DB    $04
         DB    $20
         DB    $0E
         DB    $15
         DB    $04
         DB    $11
         DB    $20
         DB    $0F
         DB    $0B
         DB    $00
         DB    $18
         DB    $04
         DB    $11
         DB    $20
LFC81    DB    $80
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFC88    DB    $20
         DB    $20
         DB    $20
         DB    $02
         DB    $0E
         DB    $0D
         DB    $06
         DB    $11
         DB    $00
         DB    $13
         DB    $14
         DB    $0B
         DB    $00
         DB    $13
         DB    $08
         DB    $0E
         DB    $0D
         DB    $12
         DB    $FE
         DB    $20
         DB    $20
         DB    $20
         DB    $18
         DB    $0E
         DB    $14
         DB    $20
         DB    $07
         DB    $00
         DB    $15
         DB    $04
         DB    $20
         DB    $16
         DB    $0E
         DB    $0D
         DB    $1C
         DB    $1C
         DB    $1C
         DB    $FF
         DB    $00
         DB    $00
LFCB0    DB    $02
LFCB1    DB    $0E
         DB    $0D
         DB    $13
LFCB4    DB    $08
         DB    $0D
         DB    $14
         DB    $04
         DB    $1F
         DB    $00
         DB    $00
         DB    $00
LFCBC    DB    $00
LFCBD    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFCC8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFCCE    DB    $00
         DB    $00
LFCD0    DB    $00
         DB    $00
LFCD2    DB    $00
         DB    $00
LFCD4    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFCDC    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFCE4    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFCEC    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LFCF4    DB    $00
         DB    $00
LFCF6    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

LFD00    DS    $100
LFE00    DS    $100
LFF00    DS    $08
LFF08    DS    $08
LFF10    DS    $08
LFF18    DS    $08
LFF20    DS    $20
LFF40    DS    $10
LFF50    DS    $10
         DS    \
