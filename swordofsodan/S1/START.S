*
* Sword of Sodan: the game
*
* (c) 1989, Discovery Software
* (s) 2018, Brutal Deluxe Software
*

         mx    %00
         TYP   BIN
         ORG   $000800
         lst   off

*----------------------------

         use   START.E

ptrA000	=	$A000	; where FILEDATA is in bank 0
ptr025E38	=	$025E3B	; where L5E38 jumps to
ptr025E88	=	$025E8B	; where L5E88 jumps to
ptr028179	=	$02817C	; where L8179 jumps to

*----------------------------

         JMP   L097C
         jmpl  L09F8	; new pointer to loadFILE
         jmpl  saveSCORE	; AV 201806 - save score
         
L0803    DW    $1400
L0805    DW    $0000
L0807    DW    $0000
L0809    DW    $0000
L080B    DW    $0000
L080D    DW    $0000
L080F    DW    $0000
L0811    DW    $0000

L0813    DB    $00
L0814    DB    $00
L0815    DB    $00
L0816    DB    $00
L0817    DB    $00
L0818    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0823    DB    $00
         DB    $00
L0825    DB    $00
         DB    $00
L0827    DB    $00
         DB    $00

*----------------------------

L0829    STA   L0811
         STY   L0807
         STX   L0809
         SEP   #$30
         LDA   #$C8
         STA   L08FA
         REP   #$30
         LDA   #$0003
         STA   L0813
         LDA   L0811
         STA   L0814
         LDA   #$1000
         STA   L0816
         JSR   L08F5
         LDX   L0818
         STX   L0823
         SEP   #$20
         LDA   #$D1
         STA   L08FA
         REP   #$30
         LDA   #$0002
         STA   L0813
         LDA   L0823
         STA   L0814
         JSR   L08F5
         LDA   L0815
         STA   L0825
         STA   L080D
         LDA   L0817
         AND   #$00FF
         STA   L0827
         STA   L080F
L0883    LDA   L0825
         CMP   #$8000
         BCC   L0893
         LDA   #$8000
         STA   L080B
         BRA   L0899
L0893    LDA   L0825
         STA   L080B
L0899    SEP   #$30
         LDA   #$CA
         STA   L08FA
         REP   #$30
         LDA   #$0004
         STA   L0813
         LDA   L0823
         STA   L0814
         LDA   #$1400
         STA   L0815
         LDA   L080B
         STA   L0817
         JSR   L08F5
         LDA   L0807
         CMP   L0803
         BNE   L08CD
         LDA   L0809
         CMP   L0805
         BEQ   L08D0
L08CD    JSR   L0949
L08D0    LDA   L0825
         SEC
         SBC   L080B
         STA   L0825
         BNE   L0883
         SEP   #$30
         LDA   #$CC
         STA   L08FA
         REP   #$30
         LDA   #$0001
         STA   L0813
         LDA   L0823
         STA   L0814
         JSR   L08F5
         RTS

L08F5    SEC
         XCE
         JSR   PRODOS8
L08FA    DB    $00
         DA    L0813

         PHP
         CLC
         XCE
         PLP
         REP   #$30
         BCC   L0940

         LDX   L0811
         LDA   |$0003,X
         JSL   $025E38
         LDA   L0A90
         SEC
         SBC   #$000A
         STA   L0A90
         STZ   $1C
         STZ   $1E
         PLA
         SEP   #$30
         LDA   #$CC
         STA   L0938
         REP   #$30
         LDA   #$0001
         STA   L0813
         LDA   L0823
         STA   L0814
         SEC
         XCE
         JSR   PRODOS8
L0938    DB    $00
         DA    L0813
         CLC
         XCE
         REP   #$30
         RTS

*----------------------------

L0940    BIT   $D8
         BPL   L0948
         JSL   $025E88
L0948    RTS

*----------------------------

L0949    SEP   #$30
         LDA   L0805
         STA   L0963+2
         LDA   L0809
         STA   L0963+1
         REP   #$30
         LDA   L080B
         DEC
         LDX   L0803
         LDY   L0807
L0963    MVN   $000000,$000000
         PHK
         PLB
         LDA   L0807
         CLC
         ADC   L080B
         STA   L0807
         LDA   L0809
         ADC   #$0000
         STA   L0809
         RTS

*----------------------------

L097C    SEC
         XCE
         JSR   HOME
         SEI
         CLC
         XCE
         REP   #$30
         SEP   #$30
         PHB
         LDA   #$E1
         PHA
         PLB
         LDA   #$80
         TSB   CYAREG
         LDA   #$40
         TSB   NEWVIDEO
         LDA   #$30
         TRB   STATEREG
         LDA   #$0F
         TRB   CLOCKCTL
         LDA   #$F0
         TRB   TBCOLOR
         PLB
         REP   #$30
         PHA
         PHP
         SEP   #$20
         LDA   #$1F
         STAL  $E1C035
         REP   #$20
         PLP
         PLA
         LDA   #$0000
         LDX   #$0000
L09BD    STAL  $E12000,X
         INX
         INX
         BPL   L09BD
         LDA   #$0001
         LDY   #$0000
         JSL   L09F8
         SEP   #$20
L09D1    LDAL  $E1C019
         BMI   L09D1
L09D7    LDAL  $E1C019
         BPL   L09D7
         REP   #$20
         LDAL  $E1C029
         ORA   #$0080
         STAL  $E1C029
         LDA   #$0000
         LDY   #$0000
         JSL   L09F8
         JMPL  ptr028179

*
* SAVE SCORE
*

saveSCORE
	rtl
	
*
* LOAD FILE
*
* A= INDEX IN $A000
* Y= ENTRY INDEX FROM THE TARGET SOURCE POINTER
*
* A000 = (A010, A012...): THIS IS A
* A012 = (A0DE, A0F7...): THIS IS Y

L09F8    PHA
         PHP
         SEP   #$20
         LDA   #$1F
         STAL  $E1C035
         REP   #$20
         PLP
         PLA
         PHB
         PHK
         PLB
         STZ   $D8
         PHA
         LDX   #$00FE
L0A0F    LDA   $00,X
         STAL  $010100,X
         DEX
         DEX
         BPL   L0A0F
         PLA
         PHY
         ASL
         TAY
         LDA   ptrA000,Y
         STA   $00
         PLA		; WAS Y
         ASL
         TAY
         LDA   ($00),Y
         STA   $00
         LDY   #$0000
L0A2C    LDA   ($00),Y
         CMP   #$FFFF
         BEQ   L0A73
         PHA
         INY
         INY
         LDA   ($00),Y
         STA   $18
         PHA
         INY
         INY
         LDA   ($00),Y
         STA   $1A
         TAX
         INY
         INY
         LDA   ($00),Y
         STA   $1C
         INY
         INY
         LDA   ($00),Y
         STA   $1E
         INY
         INY
         STY   L0A90
         PLY
         PLA
         JSR   L0829
         LDA   $1C
         ORA   $1E
         BEQ   L0A6E
         LDA   [$18]
         CMP   #$9000
         BCC   L0A66
         DB    $00	; breaks if size > $9000
         
L0A66    INC   $18
         INC   $18
         JSL   L0AC0
L0A6E    LDY   L0A90
         BRA   L0A2C
L0A73    LDX   #$00FE
L0A76    LDAL  $010100,X
         STA   $00,X
         DEX
         DEX
         BPL   L0A76
         PLB
         PHA
         PHP
         SEP   #$20
         LDA   #$1F
         STAL  $E1C035
         REP   #$20
         PLP
         PLA
         RTL

L0A90    DW    $0000

*----------------------------

         MX    %11

L0A92    LDY   #$00
         STY   $12
         LDA   #$00
L0A98    STA   $1000,Y
         INY
         CPY   #$80
         BNE   L0A98
L0AA0    LDA   [$18]
         REP   #$30
         INC   $18
         SEP   #$30
         PHA
         STA   [$1C]
         REP   #$30
         INC   $1C
         DEC   $20
         SEP   #$30
         PLA
         STA   $1000,Y
         INY
         BNE   L0AA0
         RTS

L0ABB    LDA   #$00
         STA   $14
         RTS

*----------------------------

         MX    %00

L0AC0    PHB
         PEA   $0000
         PLB
         PLB
         STA   $20
         SEP   #$30
         JSR   L0A92
         JSR   L0ABB
L0AD0    LDA   [$18]
         REP   #$30
         INC   $18
         SEP   #$30
         TAX
         BEQ   L0AF9
         LDA   [$18]
         REP   #$30
         INC   $18
         SEP   #$30
         TAY
L0AE4    LDA   $1000,Y
         STX   $10
         LDX   $14
         STA   $1100,X
         INX
         STX   $14
         LDX   $10
         INY
         DEX
         BNE   L0AE4
         BRA   L0B09
L0AF9    LDA   [$18]
         REP   #$30
         INC   $18
         SEP   #$30
         LDX   $14
         STA   $1100,X
         INX
         STX   $14
L0B09    LDX   #$00
L0B0B    LDA   $1100,X
         STA   [$1C]
         REP   #$30
         INC   $1C
         DEC   $20
         BEQ   L0B2D
         SEP   #$30
         LDY   $12
         STA   $1000,Y
         INY
         STY   $12
         INX
         CPX   $14
         BNE   L0B0B
         LDX   #$00
         STX   $14
         BRA   L0AD0
L0B2D    REP   #$30
         PLB
         RTL
