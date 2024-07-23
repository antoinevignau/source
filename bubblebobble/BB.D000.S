*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2020, Antoine Vignau
*

	mx	%11
	org	$d000
	lst	off

*-------------------------------

LD000    JMP   LD0A3

         DB    $12
         DB    $13
         DB    $FE
         DB    $0D
         DB    $03
         DB    $FE
         DB    $11
         DB    $03
         DB    $FE
         DB    $13
         DB    $07
         DB    $FF
LD00F    DB    $01
         DB    $02
         DB    $03
         DB    $04
LD013    DB    $5C
         DB    $66
         DB    $70
         DB    $7A
LD017    DB    $7A
         DB    $70
         DB    $66
         DB    $5C
         DB    $12
         DB    $04
         DB    $0B
         DB    $04
         DB    $02
         DB    $13
         DB    $1D
         DB    $81
         DB    $1D
         DB    $1B
         DB    $1D
         DB    $82
         DB    $1D
         DB    $0F
         DB    $0B
         DB    $00
         DB    $18
         DB    $04
         DB    $11
         DB    $12
         DB    $1A
         DB    $1D
         DB    $05
         DB    $08
         DB    $11
         DB    $04
         DB    $1D
         DB    $01
         DB    $14
         DB    $13
         DB    $13
         DB    $0E
         DB    $0D
         DB    $1D
         DB    $12
         DB    $13
         DB    $00
         DB    $11
         DB    $13
         DB    $12
         DB    $FF
         DB    $0F
         DB    $0B
         DB    $00
         DB    $18
         DB    $04
         DB    $11
         DB    $12
         DB    $FF
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $0F
         DB    $0B
         DB    $04
         DB    $00
         DB    $12
         DB    $04
         DB    $1D
         DB    $04
         DB    $0D
         DB    $13
         DB    $04
         DB    $11
         DB    $1D
         DB    $18
         DB    $0E
         DB    $14
         DB    $11
         DB    $1D
         DB    $08
         DB    $0D
         DB    $08
         DB    $13
         DB    $08
         DB    $00
         DB    $0B
         DB    $12
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $1D
         DB    $FF
         DB    $05
         DB    $0B
         DB    $08
         DB    $0F
         DB    $20
         DB    $03
         DB    $08
         DB    $12
         DB    $0A
         DB    $20
         DB    $0E
         DB    $15
         DB    $04
         DB    $11
         DB    $20
         DB    $00
         DB    $0D
         DB    $03
         DB    $20
         DB    $0F
         DB    $11
         DB    $04
         DB    $12
         DB    $12
         DB    $20
         DB    $00
         DB    $20
         DB    $0A
         DB    $04
         DB    $18
         DB    $FF
LD094    DB    $00
LD095    DB    $00
LD096    DB    $00
LD097    DB    $00
LD098    DB    $00
LD099    DB    $00
LD09A    DB    $00
LD09B    DB    $00
LD09C    DB    $00
LD09D    DB    $00
LD09E    DB    $00
LD09F    DB    $00
LD0A0    DB    $FF
LD0A1    DB    $FF
LD0A2    DB    $FF

*--- Welcome screen

LD0A3    JSR   LD415
         LDA   LD09F
         BNE   LD0F3
         JSR   LD458
LD0AE    LDA   #$04
         STA   LD098
         LDA   #$50
         STA   LD09A
         LDA   #$D0
         STA   LD09B
         LDA   #$75
         STA   LD09C
         JSR   LD4BF
         LDA   #$00
         STA   KBDSTROBE
LD0CA    LDA   KBD
         BPL   LD0CA
         JSR   LD415
         JSR   LD458
         LDX   #$64
         JSR   LDAFB
         LDA   #$00
         LDX   #$07
LD0DE    CLC
         ADC   L0800,X
         DEX
         BPL   LD0DE
         CMP   #$1C
         BNE   LD0AE
         STA   LD09F
         JSR   LD458
         LDA   #$01
         STA   nbPLAYERS
LD0F3    LDA   #$FF
         STA   LD0A0
         STA   LD0A1
         STA   LD0A2
         JSR   LD283
         JSR   LDB37	; load high scores picture
         LDA   #$02
         STA   $DE
         LDA   #$FF
         STA   $DF
         LDA   #$01
         STA   nbPLAYERS
         LDA   #$18
         STA   LD098
         LDY   #$88
         LDA   #$01
         JSR   LD469
         JSR   LD17D
         JSR   LD1DE
         JSR   LD443
         JSR   LD458
         JSR   LD391
         LDA   #$00
         STA   KBDSTROBE
         LDX   #$66
         JSR   LDAFB
         LDA   #$01	; play song
         JSR   LD665

LD13A    LDA   BUTN0
         BPL   LD14D
         LDX   #$07
         LDA   #$00
LD143    STA   L0F30,X
         STA   L0F38,X
         DEX
         BPL   LD143
         RTS

LD14D    LDA   KBD	; 1 player
         BPL   LD177
         CMP   #"1"
         BNE   LD161
         LDA   #$01
         STA   nbPLAYERS
         LDA   #$FF
         STA   $DF
         JMP   LD16B

LD161    CMP   #"2"	; 2 players
         BNE   LD177
         LDA   #$02
         STA   nbPLAYERS
         STA   $DF

LD16B    LDA   #$18
         STA   LD098
         LDY   #$88
         LDA   nbPLAYERS
         JSR   LD469
LD177    JSR   LD67E	; play music
         JMP   LD13A	; loop

LD17D    LDA   #$5C
         STA   LD09A
         LDA   #$07
         STA   LD098
         LDA   #$D0
         STA   LD09B
         LDA   #$03
         STA   LD09C
         JSR   LD4BF
         LDX   #$00
LD196    LDA   #$06
         STA   LD098
         LDA   LD00F,X
         LDY   LD013,X
         STX   LD095
         JSR   LD469
         LDX   LD095
         INX
         CPX   #$04
         BNE   LD196
         LDA   #$88
         STA   LD09A
         LDA   #$0F
         STA   LD098
         LDA   #$D0
         STA   LD09B
         LDA   #$44
         STA   LD09C
         JSR   LD4BF
         LDA   #$94
         STA   LD09A
         LDA   #$00
         STA   LD098
         LDA   #$D0
         STA   LD09B
         LDA   #$1B
         STA   LD09C
         JSR   LD4BF
         RTS

LD1DE    LDA   #$B0
         STA   LD1F8+1
         LDA   #$B8
         STA   LD218+1
         LDA   #$BC
         STA   LD245+1
         LDX   #$00
LD1EF    LDY   #$00
LD1F1    TYA
         CLC
         ADC   #$0C
         STA   LD098
LD1F8    LDA   L11FF,Y
         STY   LD096
         STX   LD095
         LDY   LD013,X
         JSR   LD469
         LDX   LD095
         LDY   LD096
         CPY   #$03
         BCS   LD23A
         TYA
         CLC
         ADC   #$16
         STA   LD098
LD218    LDA   L11FF,Y
         STX   LD095
         STY   LD096
         LDY   LD013,X
         CMP   #$80
         BCC   LD231
         SEC
         SBC   #$80
         JSR   LD494
         JMP   LD234

LD231    JSR   LD469
LD234    LDX   LD095
         LDY   LD096
LD23A    CPY   #$03
         BCS   LD25A
         TYA
         CLC
         ADC   #$1D
         STA   LD098
LD245    LDA   L11FF,Y
         STX   LD095
         STY   LD096
         LDY   LD013,X
         JSR   LD494
         LDY   LD096
         LDX   LD095
LD25A    INY
         CPY   #$08
         BNE   LD1F1
         LDA   LD1F8+1
         CLC
         ADC   #$10
         STA   LD1F8+1
         LDA   LD218+1
         CLC
         ADC   #$10
         STA   LD218+1
         LDA   LD245+1
         CLC
         ADC   #$10
         STA   LD245+1
         INX
         CPX   #$04
         BEQ   LD282
         JMP   LD1EF
LD282    RTS

LD283    LDA   nbPLAYERS
         SEC
         SBC   #$01
         ASL
         ASL
         ASL
         TAX
         STA   LD095
         LDA   #$B0
         STA   LD2BE+1
         STA   LD2EF+1
         STA   LD2DE+1
         LDA   #$C0
         STA   LD2E1+1
         LDA   #$B8
         STA   LD30C+1
         STA   LD2F4+1
         LDA   #$B9
         STA   LD332+1
         STA   LD311+1
         LDA   #$BA
         STA   LD32C+1
         STA   LD314+1
         LDA   #$03
         STA   LD097
LD2BC    LDY   #$00
LD2BE    LDA   L11FF,Y
         CMP   L0F30,X
         BEQ   LD338
         BCS   LD33E
         LDX   nbPLAYERS
         LDA   LD097
         STA   LD09F,X
         LDA   LD097
         BEQ   LD2E7
         LDA   LD097
         ASL
         ASL
         ASL
         ASL
         TAX
         DEX
LD2DE    LDA   L11FF,X
LD2E1    STA   L11FF,X
         DEX
         BPL   LD2DE
LD2E7    LDX   LD095
         LDY   #$00
LD2EC    LDA   L0F30,X
LD2EF    STA   L11FF,Y
         LDA   #$00
LD2F4    STA   L11FF,Y
         INX
         INY
         CPY   #$08
         BNE   LD2EC
         LDA   #$00
         STA   LD094
         LDX   nbPLAYERS
         LDA   $D9,X
         CMP   #$63
         BNE   LD31A
         LDA   #$80
LD30C    STA   L11FF
         LDA   #$8B
LD311    STA   L11FF
LD314    STA   L11FF
         JMP   LD389

LD31A    LDA   $D9,X
         CLC
         ADC   #$01
LD31F    CMP   #$0A
         BCC   LD32C
         INC   LD094
         SEC
         SBC   #$0A
         JMP   LD31F

LD32C    STA   L11FF
         LDA   LD094
LD332    STA   L11FF
         JMP   LD389

LD338    INY
         INX
         CPY   #$08
         BNE   LD2BE
LD33E    LDA   LD2BE+1
         CLC
         ADC   #$10
         STA   LD2BE+1
         STA   LD2EF+1
         STA   LD2DE+1
         CLC
         ADC   #$10
         STA   LD2E1+1
         LDA   LD30C+1
         CLC
         ADC   #$10
         STA   LD30C+1
         STA   LD2F4+1
         LDA   LD332+1
         CLC
         ADC   #$10
         STA   LD332+1
         STA   LD311+1
         LDA   LD32C+1
         CLC
         ADC   #$10
         STA   LD32C+1
         STA   LD314+1
         LDX   LD095
         DEC   LD097
         BMI   LD382
         JMP   LD2BC

LD382    LDX   nbPLAYERS
         LDA   #$FF
         STA   LD09F,X
LD389    DEC   nbPLAYERS
         BEQ   LD390
         JMP   LD283
LD390    RTS

LD391    LDA   LD0A0
         BPL   LD39C
         LDA   LD0A1
         BPL   LD39C
         RTS

LD39C    LDA   #$94
         STA   LD09A
         LDA   #$00
         STA   LD098
         LDA   #$D0
         STA   LD09B
         LDA   #$4C
         STA   LD09C
         JSR   LD4BF
         LDX   #$01
LD3B5    LDA   #$1D
         STA   LD098
         LDA   #$03
         SEC
         SBC   LD0A0,X
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$BC
         STA   LD3F8+1
LD3CA    LDY   LD0A0,X
         BMI   LD40E
         STX   LD095
         LDA   LD017,Y
         TAY
         STY   LD096
         LDA   #$1A
         JSR   LD494
         LDY   LD096
LD3E1    LDA   #$00
         STA   KBDSTROBE
LD3E6    LDA   KBD
         BPL   LD3E6
         AND   #$DF
         CMP   #$C1	; A
         BCC   LD3E1
         CMP   #$DB	; Z
         BCS   LD3E1
         SEC
         SBC   #$C1
LD3F8    STA   L11FF
         JSR   LD494
         INC   LD3F8+1
         INC   LD098
         LDX   LD095
         LDA   LD098
         CMP   #$20
         BNE   LD3CA
LD40E    DEX
         BPL   LD3B5
         JSR   LD17D
         RTS

LD415    LDX   #$40
         LDA   #>HGR1
         STA   LD420+2
         LDA   #$00
LD41E    LDY   #$00
LD420    STA   $FF00,Y
         DEY
         BNE   LD420
         INC   LD420+2
         DEX
         BNE   LD41E
         LDA   #$00
         STA   LD09D
         LDA   #$40
         STA   LD09E
         LDA   TXTCLR
         LDA   HIRES
         LDA   MIXCLR
         LDA   TXTPAGE1
         RTS

LD443    LDA   LD09D
         EOR   #$01
         STA   LD09D
         TAX
         LDA   TXTPAGE1,X
         LDA   LD09E
         EOR   #$60
         STA   LD09E
         RTS

LD458    LDA   LD09D
         EOR   #$01
         STA   LD09D
         LDA   LD09E
         EOR   #$60
         STA   LD09E
         RTS

LD469    ASL
         ASL
         ASL
         TAX
         LDA   #$07
         STA   LD097
LD472    LDA   L1200,Y
         CLC
         ADC   LD09E
         STA   LD489+2
         LDA   L1300,Y
         CLC
         ADC   LD098
         STA   LD489+1
         LDA   LD511,X
LD489    STA   $FFFF
         INX
         INY
         DEC   LD097
         BNE   LD472
         RTS

LD494    ASL
         ASL
         ASL
         TAX
         LDA   #$07
         STA   LD097
LD49D    LDA   L1200,Y
         CLC
         ADC   LD09E
         STA   LD4B4+2
         LDA   L1300,Y
         CLC
         ADC   LD098
         STA   LD4B4+1
         LDA   LD569,X
LD4B4    STA   $FFFF
         INX
         INY
         DEC   LD097
         BNE   LD49D
         RTS

LD4BF    LDA   LD098
         STA   LD099
         LDA   LD09B
         STA   LD4D4+2
         LDA   LD09C
         STA   LD4D4+1
LD4D1    LDY   LD09A
LD4D4    LDA   $FFFF
         BPL   LD4FB
         CMP   #$FF
         BEQ   LD510
         CMP   #$FE
         BNE   LD4F3
         LDA   LD09A
         CLC
         ADC   #$0A
         STA   LD09A
         LDA   LD099
         STA   LD098
         JMP   LD505

LD4F3    AND   #$7F
         JSR   LD469
         JMP   LD502

LD4FB    CMP   #$20
         BEQ   LD502
         JSR   LD494
LD502    INC   LD098
LD505    INC   LD4D4+1
         BNE   LD4D1
         INC   LD4D4+2
         JMP   LD4D1
LD510    RTS

LD511    DB    $1E
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
LD569    DB    $1E
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
         DB    $00
         DB    $00
         DB    $00
         DB    $1E
         DB    $1E
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
LD659    DB    $B9
LD65A    DB    $00
LD65B    DB    $00
LD65C    DB    $00
LD65D    DB    $00
LD65E    DB    $00
         DB    $00
         DB    $00
LD661    DB    $00
LD662    DB    $00
LD663    DW    $0000

LD665    LDX   LD659
         STX   LD65A
         ASL
         TAX
         LDA   tblMUSIC,X
         STA   $00
         STA   LD663
         LDA   tblMUSIC+1,X
         STA   $00+1
         STA   LD663+1
         RTS

LD67E    LDY   fgSOUND	; no sound means exit
         BNE   LD692
         LDY   #$01
         LDA   ($00),Y
         BNE   LD695
         LDA   LD663
         STA   $00
         LDA   LD663+1
         STA   $00+1
LD692    LDA   #$00
         RTS

LD695    ASL
         ASL
         TAX
         LDA   LD65A
         JSR   LD720
         STX   LD65D
         STA   LD65C
         DEY
         LDA   ($00),Y
         TAY
         LDA   #$CC
         JSR   LD6BB
         LDA   $00
         CLC
         ADC   #$02
         STA   $00
         LDA   $00+1
         ADC   #$00
         STA   $00+1
         RTS

LD6BB    CPX   #$00
         BEQ   LD70A
         CPY   #$00
         BNE   LD6C7
         LDA   #$00
         LDY   #$01
LD6C7    STA   LD65B
         STY   LD65E
         STX   LD65D
         LDA   #$00
         STA   LD65C
LD6D5    LDX   #$08
LD6D7    JSR   LD70B
         LDY   LD65E
LD6DD    DEY
         BNE   LD6DD
         DEX
         BNE   LD6D7
         LDA   LD65C
         SEC
         SBC   LD65E
         STA   LD65C
         LDA   LD65D
         SBC   #$00
         STA   LD65D
         BCC   LD70A
         LDA   LD65C
         SEC
         SBC   #$08
         STA   LD65C
         LDA   LD65D
         SBC   #$00
         STA   LD65D
         BCS   LD6D5
LD70A    RTS

LD70B    ASL   LD65B
         BCC   LD71A
         INC   LD65B
         BIT   SPKR
         BIT   $C020	; LOGO
         RTS

LD71A    PHA	; 4
         PLA	; 3
         NOP	; 2
         NOP	; 2
         NOP	; 2
         RTS	; 6 = 19 cycles

LD720    STA   LD661
         STX   LD662
         LDA   #$00
         LDX   #$08
         LSR   LD661
LD72D    BCC   LD733
         CLC
         ADC   LD662
LD733    ROR
         ROR   LD661
         DEX
         BNE   LD72D
         TAX
         LDA   LD661
         RTS

         DS    $C1,$FF
         DS    $100
         DS    $100

*-----------------------
* LOAD LEVEL
*-----------------------
* A=0 for BOSS1
* A=1 for BOSS2
* A=2 for level X

loadLEVEL
         CMP   #$02
         BNE   LDA1F
         STX   LDA29
         LDX   #$66	; load music
         JSR   LDAFB
         LDA   #$00	; set music #0 pointer
         JSR   LD665
LDA11    JSR   LD67E	; play music
         CMP   #$00
         BNE   LDA11
         LDX   LDA29	; load level
         JSR   LDAFB
         RTS	; and return

LDA1F    CMP   #$00
         BNE   LDA26
         JMP   LDB7E	; load BOSS1
LDA26    JMP   LDBC5	; load BOSS2

*-------------------------------
* T/S list for each level

LDA29    DB    $00	; level
LDA2A    DB    $00	; T
LDA2B    DB    $00	; S

LDA2C    HEX   01010101020202020303030304040404
         HEX   05050505060606060707070708080808
         HEX   090909090A0A0A0A0B0B0B0B0C0C0C0C
         HEX   0D0D0D0D0E0E0E0E0F0F0F0F10101010
         HEX   11111111121212121313131314141414
         HEX   15151515161616161717171718181818
         HEX   191919191A1A1A
LDA93    HEX   0004080C0004080C0004080C0004080C
         HEX   0004080C0004080C0004080C0004080C
         HEX   0004080C0004080C0004080C0004080C
         HEX   0004080C0004080C0004080C0004080C
         HEX   0004080C0004080C0004080C0004080C
         HEX   0004080C0004080C0004080C0004080C
         HEX   0004080C000408
LDAFA    DB    $00	; nb of sectors to load

LDAFB    LDA   LDA2C,X
         STA   LDA2A
         LDA   LDA93,X
         STA   LDA2B
         LDA   #$00
         STA   LDAFA
LDB0C    LDA   LDA2A
         STA   LDE04
         LDA   LDA2B
         STA   LDE05
         LDA   #<L0800
         STA   LDE08
         LDA   #>L0800
         CLC
         ADC   LDAFA
         STA   LDE08+1
         JSR   LDC0C
         INC   LDA2B
         INC   LDAFA
         LDA   LDAFA
         CMP   #$04
         BNE   LDB0C
         RTS

*--- Load the HIGH SCORES pictures

LDB37    LDA   #$1B
         STA   LDA2A
         LDA   #$00
         STA   LDAFA
         STA   LDA2B
LDB44    LDA   LDA2A
         STA   LDE04
         LDA   LDA2B
         STA   LDE05
         LDA   #<HGR2
         STA   LDE08
         LDA   #>HGR2
         CLC
         ADC   LDAFA
         STA   LDE08+1
         JSR   LDC0C
         INC   LDA2B
         LDA   LDA2B
         CMP   #$10
         BNE   LDB73
         INC   LDA2A
         LDA   #$00
         STA   LDA2B
LDB73    INC   LDAFA
         LDA   LDAFA
         CMP   #$20
         BNE   LDB44
         RTS

*--- Load the BOSS1 picture

LDB7E    LDA   #$1D
         STA   LDA2A
         LDA   #$00
         STA   LDA2B
         STA   LDAFA
LDB8B    LDA   LDA2A
         STA   LDE04
         LDA   LDA2B
         STA   LDE05
         LDA   #<HGR1
         STA   LDE08
         LDA   #>HGR1
         CLC
         ADC   LDAFA
         STA   LDE08+1
         JSR   LDC0C
         INC   LDA2B
         LDA   LDA2B
         CMP   #$10
         BNE   LDBBA
         INC   LDA2A
         LDA   #$00
         STA   LDA2B
LDBBA    INC   LDAFA
         LDA   LDAFA
         CMP   #$20
         BNE   LDB8B
         RTS

*--- Load the BOSS2 picture

LDBC5    LDA   #$1F
         STA   LDA2A
         LDA   #$00
         STA   LDAFA
         STA   LDA2B
LDBD2    LDA   LDA2A
         STA   LDE04
         LDA   LDA2B
         STA   LDE05
         LDA   #<HGR2
         STA   LDE08
         LDA   #>HGR2
         CLC
         ADC   LDAFA
         STA   LDE08+1
         JSR   LDC0C
         INC   LDA2B
         LDA   LDA2B
         CMP   #$10
         BNE   LDC01
         INC   LDA2A
         LDA   #$00
         STA   LDA2B
LDC01    INC   LDAFA
         LDA   LDAFA
         CMP   #$20
         BNE   LDBD2
         RTS

LDC0C    LDA   #$01
         STA   LDE00
         STA   LDE02
         STA   LDE0C
         STA   LDE10
         STA   LDF01
         LDA   #$60
         STA   LDE01
         STA   LDE0F
         LDA   #$00
         STA   LDE03
         STA   LDE0B
         STA   LDE0E
         STA   LDF00
         STA   LDE06
         LDA   #>LDF00
         STA   LDE06+1
         LDA   #$D8
         STA   LDF02
         LDA   #$EF
         STA   LDF03
         LDY   #<LDE00
         LDA   #>LDE00
         JSR   $B7B5
         LDA   #$00
         STA   $48
         RTS

         DS    \
         DS    $100

LDE00    DB    $FF	; The IOB table
LDE01    DB    $FF
LDE02    DB    $FF
LDE03    DB    $FF
LDE04    DB    $FF
LDE05    DB    $FF
LDE06    DA    $FFFF
LDE08    DA    $FFFF
         DB    $FF
LDE0B    DB    $FF
LDE0C    DB    $FF
         DB    $FF
LDE0E    DB    $FF
LDE0F    DB    $FF
LDE10    DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DS    $E0,$FF

LDF00    DB    $FF	; The Disk II table
LDF01    DB    $FF
LDF02    DB    $FF
LDF03    DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DS    $E0,$FF

