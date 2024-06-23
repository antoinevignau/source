*
* Pac-Man
*
* (c) 1983, Atari
* (s) 2024, Antoine Vignau
*

            TYP   BIN
            ORG   $4000
            MX    %11

	USE   PACMAN.E
	
*-----------------------------------
* FIRMWARE EQUATES
*-----------------------------------

SOFTEV      EQU   $03F2
PWREDUP     EQU   $03F4
NMILOC      EQU   $03FB
IRQLOC      EQU   $03FE
KBD         EQU   $C000
KBDSTROBE   EQU   $C010
SPKR        EQU   $C030
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
TXTPAGE2    EQU   $C055
LORES       EQU   $C056
HIRES       EQU   $C057
SETAN0      EQU   $C058
CLRAN0      EQU   $C059
SETAN1      EQU   $C05A
CLRAN1      EQU   $C05B
SETAN2      EQU   $C05C
BUTN0       EQU   $C061
PADDL0      EQU   $C064
PADDL1      EQU   $C065
PTRIG       EQU   $C070
VTAB        EQU   $FC22
VTABZ       EQU   $FC24
RDKEY       EQU   $FD0C
GETLN1      EQU   $FD6F
COUT1       EQU   $FDF0
SETKBD      EQU   $FE89
SETVID      EQU   $FE93

*-----------------------------------
* ENTRY POINT
*-----------------------------------

            LDA   #$AF	; relocate from $1000 to $4000
            STA   $17
            LDA   #$7F
            STA   $15
            LDY   #$00
            STY   $16
            STY   $14
            LDX   #$70
L4010       LDA   ($14),Y
            STA   ($16),Y
            INY
            BNE   L4010
            DEC   $17
            DEC   $15
            DEX
            BPL   L4010
            JSR   SETKBD
            JSR   SETVID
            JMP   L4027

L4027       LDA   #$01
            STA   $51
            JSR   L54D4
            LDA   #$00
            STA   $00
            STA   $01
            STA   $02
            STA   $58
            LDA   #$01
            STA   zpMONITOR
            STA   $E8		; ZP - demo if 1?
            LDA   #<L43D2
            STA   SOFTEV
            STA   NMILOC+1
            STA   IRQLOC
            LDA   #>L43D2
            STA   SOFTEV+1
            STA   NMILOC+2
            STA   IRQLOC+1
            EOR   #$A5
            STA   PWREDUP
            LDA   #$4C
            STA   NMILOC
            JSR   selectMONITOR
            JMP   L43D2		; show LOGO

            ASC   "(C) 1983 ATARI, INC.ALL RIGHTS RESERVED."
            ASC   "UNAUTHORIZED REPRODUCTION, ADAPTATION, D"
            ASC   "ISTRIBUTION, PERFORMANCE, OR DISPLAY OF "
            ASC   "THIS DOCUMENT, THE ASSOCIATED COMPUTER P"
            ASC   "ROGRAM, OR THE AUDIOVISUAL WORK IS STRIC"
            ASC   "TLY PROHIBITED."
            DB    $02
            DB    $BB
            DB    $5A
            DB    $30
            DB    $5F
            DB    $EE
            DB    $3D
            DB    $A8
            DB    $17

*-----------------------------------
* MAIN ENTRY POINT
*-----------------------------------

selectRANKCARTOON
            bit   selecNBPLAYERS		; LoGo

L4147       JSR   setTEXT2	; set text mode
            JSR   clearTEXT2	; clear text screen
            LDA   #$00
            STA   $24
            LDA   #$05
            JSR   gotoXY
            LDX   #$00
L4158       LDA   L41DC,X	; RANK OR CARTOON?
            JSR   printCHAR
            INX
            CPX   #$11
            BCC   L4158
            JSR   GETLN1
            LDA   #$07
            JSR   gotoXY
            LDA   #$00
            STA   $24
            LDA   $0200
            CMP   #"C"
            BNE   L419F

*--- Choose cartoon

            LDX   #$00
L4178       LDA   L4201,X	; CARTOON NUMBER (1-3)
            JSR   printCHAR
            INX
            CPX   #$16
            BCC   L4178
            JSR   GETLN1
            LDX   $0200
            LDA   #$02
            CPX   #"1"
            BEQ   L4197
            LDA   #$05
            CPX   #"2"
            BEQ   L4197
            LDA   #$09
L4197       STA   $55		; ZP
            JSR   playCARTOON
            JMP   selectRANKCARTOON

*--- Choose rank

L419F       LDX   #$00
L41A1       LDA   L41ED,X	; RANK NUMBER (1-21)
            JSR   printCHAR
            INX
            CPX   #$14
            BCC   L41A1
            JSR   GETLN1
            CPX   #$01
            BEQ   L41D2
            LDA   $0200
            AND   #$0F
            TAX
            LDA   $0201
            AND   #$0F
            CPX   #$00
            BEQ   L41C8
L41C2       CLC
            ADC   #$0A
            DEX
            BNE   L41C2
L41C8       CMP   #$16
            BCS   L41D9
L41CC       STA   L54E0+1
            JMP   selecNBPLAYERS

L41D2       LDA   $0200
            AND   #$0F
            BNE   L41CC
L41D9       JMP   selectRANKCARTOON

L41DC       ASC   "RANK OR CARTOON? "
L41ED       ASC   "RANK NUMBER? (1-21) "
L4201       ASC   "CARTOON NUMBER? (1-3) "

*-----------------------------------
* SELECT NUMBER OF PLAYERS
*-----------------------------------

selecNBPLAYERS
            JSR   setTEXT2
            JSR   clearTEXT2
            LDA   #$00
            STA   $24
            LDA   #$06
            JSR   gotoXY
            LDX   #$00
L4228       LDA   L427C,X	; HOW MANY PLAYERS?
            JSR   printCHAR
            INX
            CPX   #$1D
            BNE   L4228
L4233       JSR   RDKEY
            CMP   #$96		; ctrl-v
            BEQ   L4272
            CMP   #"1"
            BCC   L4233
            CMP   #"6"
            BCS   L4233
            JSR   printCHAR
            AND   #$07
            STA   $51		; ZP

            LDA   #$00
            STA   $24
            LDA   #$0B
            STA   $25
            JSR   gotoXY
            LDX   #$00
L4256       LDA   L4299,X	; SPACE OR RETURN
            JSR   printCHAR
            INX
            CPX   #$37
            BNE   L4256
L4261       JSR   RDKEY
            CMP   #" "
            BNE   L426B
            JMP   L43D2		; space means the end

L426B       CMP   #$8D
            BNE   L4261
            JMP   L52FC		; RETURN TO PLAY

L4272       JSR   RDKEY
            CMP   #$83		; ctrl-c
            BNE   L4233
            JMP   L4147

L427C       ASC   "HOW MANY PLAYERS?  (1 - 5)   "
L4299       ASC   "PRESS <RETURN> TO PLAY"8D
            ASC   "OR <SPACE> TO GO BACK TO DEMO.  "

*-----------------------------------
* 
*-----------------------------------

L42D0       LDA   ($14),Y
            STA   zpXCOL
            INY
            LDA   ($14),Y
            STA   $10
            STA   $0A
            INY
            STY   $0B
L42DE       LDY   $0B
            LDA   ($14),Y
            BMI   L4303
            BEQ   L42F6
            CMP   #$20
            BEQ   L42F9
            CMP   #$21
            BEQ   L4306
            CMP   #$03
            BCS   L42F6
            INC   $10
            INC   $10
L42F6       JSR   L4316
L42F9       LDA   $0A
            STA   $10
            INC   $0B
            INC   $04
            BNE   L42DE
L4303       INC   $0B
            RTS

L4306       LDA   #<L4673
            STA   L55B1+1
            LDA   #>L4673
            STA   L55B1+2
            JSR   L4338
            JMP   L42F9

L4316       STA   $09
            ASL
            ASL
            ASL
            ADC   $09
            STA   L55B1+1
            LDA   #>L4553
            STA   L55B1+2
            BCC   L432A
            INC   L55B1+2
L432A       CLC
            LDA   L55B1+1
            ADC   #<L4553
            STA   L55B1+1
            BCC   L4338
            INC   L55B1+2
L4338       LDA   #$01
            STA   $1A
            LDA   #$09
            STA   $18
            LDA   #$00
            STA   zpXBIT
            JSR   L55A6
            JSR   getINPUT
            LDX   #$50
            JMP   doWAIT2

L434F       DB    $0D
            DB    $0B
            DB    $04
            DB    $12
            DB    $0D
            DB    $19
            DB    $0D
            DB    $0E
            DB    $1B
            DB    $10
            DB    $19
            DB    $20
            DB    $1E
            DB    $20
            DB    $09
            DB    $13
            DB    $0E
            DB    $14
            DB    $17
            DB    $0D
            DB    $16
            DB    $10
            DB    $FF
            DB    $0E
            DB    $1E
            DB    $0C
            DB    $12
            DB    $0D
            DB    $0F
            DB    $18
            DB    $00
            DB    $FF
            DB    $1A
            DB    $1E
            DB    $06
            DB    $17
            DB    $14
            DB    $01
            DB    $FF
            DB    $0E
            DB    $2D
            DB    $0B
            DB    $0D
            DB    $1A
            DB    $12
            DB    $11
            DB    $1C
            DB    $15
            DB    $FF
            DB    $1A
            DB    $2D
            DB    $0B
            DB    $15
            DB    $13
            DB    $17
            DB    $14
            DB    $01
            DB    $FF
            DB    $0E
            DB    $3C
            DB    $0C
            DB    $02
            DB    $10
            DB    $10
            DB    $0F
            DB    $01
            DB    $FF
            DB    $1A
            DB    $3C
            DB    $0A
            DB    $13
            DB    $17
            DB    $14
            DB    $01
            DB    $FF
            DB    $0E
            DB    $4B
            DB    $0A
            DB    $18
            DB    $14
            DB    $10
            DB    $01
            DB    $FF
            DB    $1A
            DB    $4B
            DB    $04
            DB    $15
            DB    $01
            DB    $0F
            DB    $10
            DB    $FF
            DB    $11
            DB    $8A
            DB    $0A
            DB    $0D
            DB    $0E
            DB    $16
            DB    $0D
            DB    $17
            DB    $FF
            DB    $12
            DB    $9A
            DB    $03
            DB    $1B
            DB    $0D
            DB    $19
            DB    $13
            DB    $20
            DB    $06
            DB    $17
            DB    $0E
            DB    $1F
            DB    $FF
            DB    $0E
            DB    $AF
            DB    $0A
            DB    $19
            DB    $10
            DB    $1A
            DB    $1A
            DB    $20
            DB    $0C
            DB    $02
            DB    $0D
            DB    $0E
            DB    $10
            DB    $20
            DB    $21
            DB    $0D
            DB    $19
            DB    $FF

*-----------------------------------
* GAME ENTRY POINT
*-----------------------------------

L43D2       LDA   #$01
            STA   $E8
            JSR   showTITLESCREEN
            JSR   clearHGR
            LDA   #$01
            STA   $81
            LDA   #$00
            STA   $78
            STA   $79
            LDA   #<L434F
            STA   $14
            LDA   #>L434F
            STA   $14+1
            LDY   #$00
            JSR   L42D0
            JSR   L44E8
            LDA   #$22
            STA   $10
            LDA   #$01
            STA   $E0
            JSR   L88A2
            LDY   $0B
            JSR   L42D0
            LDY   $0B
            JSR   L42D0
            JSR   L44E8
            LDA   #$31
            STA   $10
            LDA   #$03
            STA   $E0
            JSR   L88A2
            LDY   $0B
            JSR   L42D0
            LDY   $0B
            JSR   L42D0
            JSR   L44E8
            LDA   #$40
            STA   $10
            LDA   #$02
            STA   $E0
            JSR   L88A2
            LDY   $0B
            JSR   L42D0
            LDY   $0B
            JSR   L42D0
            JSR   L44E8
            LDA   #$4F
            STA   $10
            LDA   #$04
            STA   $E0
            JSR   L88A2
            LDY   $0B
            JSR   L42D0
            LDY   $0B
            JSR   L42D0
            LDA   #$74
            STA   $0C
            LDA   #$78
            STA   $10
            JSR   L6172
            LDA   #$7C
            STA   $0E
            LDA   #$00
            STA   $0F
            LDA   #$75
            STA   $11
            LDA   #$01
            JSR   L7159
            CLC
            LDA   $0E
            ADC   #$06
            STA   $0E
            LDA   #$00
            JSR   L7159
            LDA   #$14
            STA   zpXCOL
            LDA   #$75
            STA   $10
            JSR   L44F1
            LDA   #$73
            STA   $0C
            LDA   #$81
            STA   $10
            JSR   L61B6
            LDA   #$7C
            STA   $0E
            LDA   #$80
            STA   $11
            LDA   #$05
            JSR   L7159
            CLC
            LDA   $0E
            ADC   #$06
            STA   $0E
            LDA   #$00
            JSR   L7159
            LDA   #$14
            STA   zpXCOL
            LDA   #$80
            STA   $10
            JSR   L44F1
            LDA   #$0C
            STA   zpXCOL
            LDA   #$9A
            STA   $10
            LDA   #$00
            STA   zpXBIT
            LDA   #$05
            STA   $1A
            LDA   #$09
            STA   $18
            LDA   #<L4526
            STA   L55B1+1
            LDA   #>L4526
            STA   L55B1+2
            JSR   L55A6
            LDY   $0B
            JSR   L42D0
            LDY   $0B
            JSR   L42D0
            LDY   $0B
            JSR   L42D0
            JMP   L4689

L44E8       LDA   #$49
            STA   $0C
            LDA   #$00
            STA   $0D
            RTS

L44F1       LDA   #$04
            STA   $1A
            LDA   #$07
            STA   $18
            LDA   #<L450A
            STA   L55B1+1
            LDA   #>L450A
            STA   L55B1+2
            LDA   #$00
            STA   zpXBIT
            JMP   L55A6

L450A       DB    $0F
            DB    $00
            DB    $20
            DB    $00
            DB    $11
            DB    $10
            DB    $20
            DB    $00
            DB    $11
            DB    $00
            DB    $70
            DB    $1C
            DB    $0F
            DB    $53
            DB    $23
            DB    $02
            DB    $41
            DB    $54
            DB    $24
            DB    $1C
            DB    $41
            DB    $54
            DB    $24
            DB    $20
            DB    $01
            DB    $53
            DB    $44
            DB    $1C
L4526       DB    $7C
            DB    $40
            DB    $70
            DB    $71
            DB    $38
            DB    $02
            DB    $61
            DB    $08
            DB    $0A
            DB    $45
            DB    $39
            DB    $42
            DB    $08
            DB    $0A
            DB    $41
            DB    $05
            DB    $42
            DB    $08
            DB    $0A
            DB    $41
            DB    $05
            DB    $42
            DB    $70
            DB    $71
            DB    $38
            DB    $05
            DB    $42
            DB    $00
            DB    $09
            DB    $41
            DB    $39
            DB    $42
            DB    $40
            DB    $08
            DB    $41
            DB    $02
            DB    $41
            DB    $20
            DB    $08
            DB    $45
            DB    $7C
            DB    $70
            DB    $13
            DB    $70
            DB    $38
L4553       DB    $00
            DB    $00
            DB    $00
            DB    $11
            DB    $11
            DB    $15
            DB    $15
            DB    $15
            DB    $0A
            DB    $00
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $1E
            DB    $10
            DB    $11
            DB    $0E
            DB    $00
            DB    $1D
            DB    $22
            DB    $22
            DB    $22
            DB    $1E
            DB    $02
            DB    $02
            DB    $02
            DB    $0C
            DB    $12
            DB    $21
            DB    $21
            DB    $3F
            DB    $21
            DB    $21
            DB    $21
            DB    $21
            DB    $1E
            DB    $21
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $21
            DB    $1E
            DB    $3F
            DB    $01
            DB    $01
            DB    $01
            DB    $0F
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $3F
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $3F
            DB    $21
            DB    $21
            DB    $21
            DB    $21
            DB    $3F
            DB    $21
            DB    $21
            DB    $21
            DB    $21
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $3F
            DB    $23
            DB    $23
            DB    $25
            DB    $25
            DB    $29
            DB    $29
            DB    $29
            DB    $31
            DB    $31
            DB    $1F
            DB    $21
            DB    $21
            DB    $21
            DB    $1F
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $1F
            DB    $21
            DB    $21
            DB    $21
            DB    $1F
            DB    $21
            DB    $21
            DB    $21
            DB    $1F
            DB    $1E
            DB    $21
            DB    $01
            DB    $01
            DB    $1E
            DB    $20
            DB    $20
            DB    $21
            DB    $1E
            DB    $00
            DB    $00
            DB    $00
            DB    $0E
            DB    $11
            DB    $10
            DB    $1E
            DB    $11
            DB    $2E
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $1E
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $1E
            DB    $11
            DB    $11
            DB    $11
            DB    $3E
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $21
            DB    $1F
            DB    $01
            DB    $21
            DB    $1E
            DB    $18
            DB    $24
            DB    $04
            DB    $04
            DB    $1F
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $01
            DB    $01
            DB    $01
            DB    $1D
            DB    $23
            DB    $21
            DB    $21
            DB    $21
            DB    $21
            DB    $00
            DB    $04
            DB    $00
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $08
            DB    $01
            DB    $01
            DB    $01
            DB    $09
            DB    $05
            DB    $03
            DB    $05
            DB    $09
            DB    $11
            DB    $02
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $15
            DB    $2A
            DB    $2A
            DB    $2A
            DB    $2A
            DB    $2A
            DB    $00
            DB    $00
            DB    $00
            DB    $1D
            DB    $22
            DB    $22
            DB    $22
            DB    $22
            DB    $22
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $21
            DB    $21
            DB    $21
            DB    $21
            DB    $1E
            DB    $00
            DB    $00
            DB    $00
            DB    $1D
            DB    $22
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $01
            DB    $1E
            DB    $20
            DB    $21
            DB    $1E
            DB    $04
            DB    $04
            DB    $04
            DB    $1E
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $18
            DB    $00
            DB    $00
            DB    $00
            DB    $11
            DB    $12
            DB    $12
            DB    $12
            DB    $12
            DB    $2C
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $40
            DB    $20
            DB    $10
            DB    $08
            DB    $04
            DB    $02
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $06
L4673       DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $1F
            DB    $21
            DB    $21
            DB    $1F

*-----------------------------------
* 
*-----------------------------------

L467C       JSR   L7DB8
            CLC
            SED
            LDA   $68
            ADC   $68
            STA   $68
            CLD
            RTS

L4689       LDA   #$70
            STA   $5E
            LDA   #$20
            STA   $59
            LDA   #$18
            STA   $80
            LDA   #$03
            STA   $62
            LDA   #$00
            STA   $66
            STA   $78
            STA   $79
            LDA   #$01
            STA   $81
            STA   $5F
            LDA   #$8D
            STA   $60
            LDA   #$68
            STA   $71
            STA   $61
            LDA   #$04
            STA   $E0
L46B5       JSR   L8712
            DEC   $E0
            BNE   L46B5
            LDA   #$B1
            STA   $84
            LDA   #$C1
            STA   $98
            LDA   #$D1
            STA   $AC
            LDA   #$E1
            STA   $C0
L46CC       DEC   $59
            BNE   L46EC
            JSR   getINPUT
            LDA   #$20
            STA   $59
            JSR   L7D80
            JSR   L699E
            SEC
            LDA   $60
            SBC   #$02
            STA   $60
            JSR   L7D80
            INC   $66
            JSR   L79A4
L46EC       JSR   L6CF3
            LDA   #$04
            STA   $E0
L46F3       JSR   L86FC
            DEC   $80
            BNE   L4711
            LDA   #$18
            STA   $80
            JSR   L7D8D
            JSR   L699E
            SEC
            LDA   $70
            SBC   #$02
            STA   $70
            JSR   L7D8D
            JSR   L88A2
L4711       JSR   L8712
            DEC   $E0
            BNE   L46F3
            DEC   $5E
            BNE   L4742
            LDA   #$60
            STA   $5E
            LDA   $5F
            BEQ   L4733
            LDA   #$67
            STA   $10
            LDA   #$4B
            STA   $0C
            JSR   L61B6
            LDA   #$00
            BEQ   L4740
L4733       LDA   #$66
            STA   $10
            LDA   #$4A
            STA   $0C
            JSR   L7819
            LDA   #$01
L4740       STA   $5F
L4742       LDA   $60
            CMP   #$4F
            BCC   L474B
            JMP   L46CC

L474B       LDA   #$01
            STA   $8C
            STA   $A0
            STA   $B4
            STA   $C8
            LDA   #$FF
            STA   $E2
            LDA   #$02
            STA   $68
            STA   $62
L475F       DEC   $59
            BNE   L477F
            JSR   getINPUT
            LDA   #$20
            STA   $59
            JSR   L7D80
            JSR   L699E
            CLC
            LDA   $60
            ADC   #$02
            STA   $60
            JSR   L7D80
            INC   $66
            JSR   L79A4
L477F       JSR   L6CF3
            LDA   #$04
            STA   $E0
L4786       JSR   L86FC
            DEC   $80
            BNE   L47C0
            LDA   #$40
            STA   $80
            LDA   $79
            BNE   L47C0
            SEC
            LDA   $70
            SBC   $60
            CMP   #$05
            BCS   L47AD
            JSR   L467C
            LDA   $68
            CMP   #$32
            BEQ   L47C9
            LDA   #$01
            STA   $79
            BNE   L47C0
L47AD       JSR   L7D8D
            JSR   L699E
            CLC
            LDA   $70
            ADC   #$02
            STA   $70
            JSR   L7D8D
            JSR   L88A2
L47C0       JSR   L8712
            DEC   $E0
            BNE   L4786
            BEQ   L475F
L47C9       LDA   #<L47DA
            LDY   #>L47DA
            STA   $1B
            STY   $1C
            LDA   #$01
            STA   $E8
            STA   $55
            JMP   L5303

L47DA       DB    $03
            DB    $03
            DB    $03
            DB    $00
            DB    $03
            DB    $03
            DB    $00
            DB    $02
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $03
            DB    $03
            DB    $01
            DB    $03
            DB    $03
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $03
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $02
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $01
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $01
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $02
            DB    $00
            DB    $00
            DB    $03
            DB    $03
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $00

*-----------------------------------
* SELECT MONITOR TYPE
*-----------------------------------

selectMONITOR
            bit   L48A6		; LoGo
            JSR   setTEXT2	; set text mode
            JSR   clearTEXT2	; clear text screen
            LDA   #$0A
            STA   $25
            JSR   gotoXY
            LDA   #$00
            STA   $24
            LDX   #$00
L4837       LDA   L4886,X	; B&W OR COLOR MONITOR?
            JSR   printCHAR
            INX
            CPX   #$20
            BNE   L4837
L4842       JSR   RDKEY
            CMP   #"B"		; BLACK
            BCC   L4842
            CMP   #"C"+1	; COLOR
            BCS   L4842
            AND   #$01
            STA   $1D		; ZP MONITOR
            JMP   L48A6

*-----------------------------------
* 
*-----------------------------------

            LDA   $25
            JSR   VTABZ
            JMP   L485F

*-----------------------------------
* GOTO X/Y
*-----------------------------------

gotoXY      JSR   VTAB
L485F       LDA   $29
            AND   #$03
            ORA   #$08
            STA   $29
            RTS

*-----------------------------------
* CLER TEXT PAGE 2
*-----------------------------------

clearTEXT2  LDA   #$00
            STA   $25
            STA   $24
            LDX   #$04
            LDY   #$00
L4872       LDA   #" "
L4874       STA   TEXT2,Y
            INY
            BNE   L4874
            INC   L4874+2
            DEX
            BNE   L4872
            LDA   #>TEXT2
            STA   L4874+2
            RTS

L4886       ASC   "BLACK & WHITE OR COLOR? (B / C) "

*-----------------------------------
* SELECT INPUT DEVICE
*-----------------------------------

L48A6       JSR   setTEXT2
            JSR   clearTEXT2
            LDA   #$00
            STA   $24
            STA   $25
            JSR   gotoXY
            LDX   #$00
L48B7       LDA   L48D9,X	; KEYBOARD OR JOYSTICK
            BEQ   L48C2
            JSR   printCHAR
            INX
            BNE   L48B7
L48C2       JSR   RDKEY
            CMP   #$B1
            BEQ   L48D2
            CMP   #$B2
            BNE   L48C2
            LDA   #$01		; ZP joystick
            STA   $F5
            RTS
L48D2       LDA   #$00		; ZP keyboard
            STA   $F5
            JMP   L492F

L48D9       ASC   " PACMAN CAN BE PLAYED WITH"8D8D
            ASC   " 1. KEYBOARD"8D
            ASC   " 2. APPLE JOYSTICK"8D8D8D8D
            ASC   "CHOOSE A MODE (1 - 2) "00

*-----------------------------------
* 
*-----------------------------------

L492F       JSR   clearTEXT2
            JSR   setTEXT2
            LDA   #$00
            STA   $24
            STA   $25
            JSR   gotoXY
            LDX   #$00
L4940       LDA   L4A01,X
            JSR   printCHAR
            INX
            CPX   #$26
            BCC   L4940
            JSR   RDKEY
            CMP   #$C3
            BEQ   L4955
            JMP   L4A00

L4955       JSR   printCHAR
            LDA   #$04
            STA   $25
            LDA   #$00
            STA   $24
            JSR   gotoXY
            LDX   #$00
L4965       LDA   L4A26,X
            JSR   printCHAR
            INX
            CPX   #$14
            BCC   L4965
            LDA   #$16
            STA   $24
            LDA   #$06
            STA   $25
            JSR   gotoXY
            LDX   #$00
L497D       LDA   L4A3A,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L497D
            JSR   RDKEY
            STA   L6FB9+1
            INC   $25
            LDA   #$16
            STA   $24
            JSR   gotoXY
            LDX   #$00
L4999       LDA   L4A46,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L4999
L49A4       JSR   RDKEY
            CMP   L6FB9+1
            BEQ   L49A4
            STA   L6FB5+1
            INC   $25
            LDA   #$16
            STA   $24
            JSR   gotoXY
            LDX   #$00
L49BA       LDA   L4A52,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L49BA
L49C5       JSR   RDKEY
            CMP   L6FB9+1
            BEQ   L49C5
            CMP   L6FB5+1
            BEQ   L49C5
            STA   L6FB1+1
            INC   $25
            LDA   #$16
            STA   $24
            JSR   gotoXY
            LDX   #$00
L49E0       LDA   L4A5E,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L49E0
L49EB       JSR   RDKEY
            CMP   L6FB9+1
            BEQ   L49EB
            CMP   L6FB5+1
            BEQ   L49EB
            CMP   L6FB1+1
            BEQ   L49EB
            STA   L6FBD+1
L4A00       RTS

L4A01       ASC   "NORMAL OR CUSTOMIZED KEYBOARD (N/C)? "
L4A26       ASC   "   PRESS KEY USED TO"
L4A3A       ASC   "MOVE LEFT   "
L4A46       ASC   "MOVE RIGHT  "
L4A52       ASC   "MOVE UP     "
L4A5E       ASC   "MOVE DOWN   "

*-----------------------------------
* OUTPUT CHARACTER
*-----------------------------------

printCHAR   CMP   #$8D
            BNE   L4A77
            INC   $25
            LDA   #$00
            STA   $24
            JMP   gotoXY
L4A77       JMP   COUT1

*-----------------------------------
* PACMAN LOGO
*-----------------------------------

* +0 goes to $0C: X start
* +1 goes to $0E: X end
* +2 goes to $10: Y

theLOGO     HEX   FFFFFE01410101450301450501470701
            HEX   4909014B0B014D0D014F0F014F110151
            HEX   13015115015317012419012B11295319
            HEX   01211B2B531B01201F011F1D2D531D2D
            HEX   531F0121212B5321012323295323FFFF
            HEX   FE01532501532701532901512B01512D
            HEX   014F2F014F31014D3301493501453701
            HEX   4339012B3B012B3D012B3F012B41012B
            HEX   43012B45012B47012B49012B49012B4B
            HEX   012B4D012B4F012B51012B53012B55FF
            HEX   FFFF014302014504014706014908014B
            HEX   0A014B0C014D0E014F10014F12015114
            HEX   01511601511801221A2B531A011F1C2D
            HEX   531C01201E2D53202D531E0120200121
            HEX   222B5322012424255324015326015328
            HEX   01512C01512A014F30014F2E014D3201
            HEX   4934014536014338014338012B3A012B
            HEX   3C012B3E012B3E012B40012B42012B44
            HEX   012B46012B48012B4A012B4E012B4C01
            HEX   2B50012B52012B54FFFFFFFFFFFFFFFF
            HEX   FE737301737303737305717507717509
            HEX   6F770B6F770D6D790F6D7911697D176B
            HEX   7B136B7B15677F1B697D19677F1F677F
            HEX   1D658123658121638325637127718327
            HEX   616F29778529616D2B79852B5F6B2D7B
            HEX   872D5F6B2F7B872F5D6D317989317789
            HEX   335D6F335B8B355B8B37598D39598D3B
            HEX   598D3D578F3F578F4155914355914553
            HEX   934753934951954B51954D4F974F4F97
            HEX   514D99534D9955FFFFFF737302737304
            HEX   73730671750871750A71750A6F770C6F
            HEX   770E6F770E6D79106D79126B7B146B7B
            HEX   146B7B16697D18697D1A677F1C677F1E
            HEX   658120658122638324638326616F2875
            HEX   8528616D2A77852A5F6B2C79872C5F6B
            HEX   2E7B872E5F6B307B87305D6D325D7134
            HEX   5B8B365B8B36598D3A5B8B38598D3C59
            HEX   8D3E578F40758934798932578F425591
            HEX   4455914653934853934A51954C51954E
            HEX   4F97504F97524D9954FFFFFEC1D501BB
            HEX   DB03B7DF05B5E107B1E509AFE70BADE9
            HEX   0DABEB11ABEB0FA9ED13A7EF17A7EF15
            HEX   A5EB19A3E71BA3E31DA3DF1FA1DB21A1
            HEX   D723A1CF27A1CF27A1D325A1CB29A1C9
            HEX   2BA1CD2DA1D12FA1D531A1D933A1DB35
            HEX   A3E137A3E73BA3E339A7EF3FA7EB3DA9
            HEX   ED43A7EF41ADEB49ABEB47ABEB45AFE7
            HEX   4BB1E54DB5E14FC1D555BBDB53B7DF51
            HEX   FFFFFFBDD902B9DD04B5E106B3E308B1
            HEX   E50AAFE70C0D490EA7EF16ADE90EABEB
            HEX   10A9ED12A9ED14BDD954B9DD52B5E150
            HEX   B3E34EB1E54CAFE74AADE948ABEB46A9
            HEX   ED44A9ED42A7EF40A7EF40A5ED3EA5E9
            HEX   3CA3E53AA3E138A1DD36A1D934A1CF2E
            HEX   A1D330A1D732A1C92AA1CB2CA1D922A1
            HEX   D126A1CD28A1DD20A1D524A3E51CA3E1
            HEX   1EA5E91AA5ED18FFFFFE01010101016A
            HEX   01036C01056E010770010972010B7401
            HEX   0D76010F7801117A01137C01157E0117
            HEX   80011982011B84011D86011F8801218A
            HEX   01238C01258E01279001299201559401
            HEX   559601559801559A01559C0155A00155
            HEX   A20155A40155A60155A80155AA0155A0
            HEX   0155A20155A401559E2D55922F559031
            HEX   558E33558C35558A3755883955863B55
            HEX   843D55823F558041567E43557C45557A
            HEX   4755784955764B55744D55724F557051
            HEX   556E53556C55556AFFFFFF01016B0103
            HEX   6D01056F010771010973010B75010D77
            HEX   010F7901117B01137D01157F01178101
            HEX   1983011B8501218B011F89011D870123
            HEX   8D01258F012791015593015595015597
            HEX   01559901559B01559D01559F0155A101
            HEX   55A30155A50155A70155A92F558F2D55
            HEX   9131558D33558B355589375587395585
            HEX   3B55833D55813F557F41557D43557B45
            HEX   55794755774955754B55734D55714F55
            HEX   6F51556D53556B0155BD0155BB0155B9
            HEX   0155B70155B50155B30155B10155AF01
            HEX   55AD0155ABFFFFFE0155BE0155BC0155
            HEX   BA0155B80155B60155B40155B20155B0
            HEX   0155AE0155ACFFFFFE81816A81816C81
            HEX   816E7F83707F83727D85767D85747B87
            HEX   787B877A79897C79897E778B80778B82
            HEX   758D84758D86758D88758D86738F8A73
            HEX   8F8C71918E717F908391906F7D928593
            HEX   926F7B948793946D79968995966D7998
            HEX   8995986B7B9A87979A6B7D9C85979C81
            HEX   819069999E6999A0679BA6679BA4679B
            HEX   A2659DA8659DAA639FAC639FAE61A1B0
            HEX   61A1B25FA3B65FA3B45DA5B85DA5BA5B
            HEX   A7BE5DA7BCFFFFFF81816B81816D8181
            HEX   6F7F83717F83737D85757D85777B8779
            HEX   7B877B79897D79897F778B81778B8375
            HEX   8D85758D87738F89738F8B71918D7191
            HEX   8F6F7D918391916F7B938591936D7995
            HEX   8793956D79978995976B7B9B6D799989
            HEX   959987979B6B7F9D83979D69999F7F7F
            HEX   915BA7BD5DA5BB5DA5B95FA3B55FA3B7
            HEX   639FAD639FAF61A1B361A1B1659DAB65
            HEX   9DA9679BA7679BA36999A1679BA5FFFF
            HEX   FEABAB69ABAF6BABB16DABB36FABB771
            HEX   ABB973ABBB75ABBD77ABC179ABC37BAB
            HEX   C57DABC97FABCB81ABCD83ABD185ABD3
            HEX   87ABD589ABD98BABDB8DABDD8FABE191
            HEX   ABFF93ABFF95ABFF97ABFF99ABFF9DAB
            HEX   FF9BABFF9FABFFA1ABFFA3ABFFA5ABFF
            HEX   A9ABFFA7ABFFABABFFADABFFAFABFFB1
            HEX   ABFFB3ABFFB5ABFFB7ABFFB9ABFFBBAB
            HEX   FFBDE3FF69E3FF6BE3FF6DE3FF6FE3FF
            HEX   71E3FF73E3FF77E3FF75E3FF79E3FF7B
            HEX   E3FF7DE3FF7FE3FF81E3FF83E3FF85E3
            HEX   FF89E3FF87E3FF8BE3FF8DE3FF8FE3FF
            HEX   91FFFFFEFFFFFE0B0101FFFFFFABAD6A
            HEX   ABAF6CABB36EABB570ABB772ABB974AB
            HEX   BD76ABBF78ABC17AABC57CABC77EABC9
            HEX   80ABCD82ABCF84ABD186ABD588ABD78A
            HEX   ABD98CABDD8EABDF90ABE192ABFF94AB
            HEX   FF96ABFF98ABFF9AABFF9CABFF9EABFF
            HEX   A0ABFFA2ABFFA4ABFFA6ABFFA8ABFFAA
            HEX   ABFFACABFFAEABFFB0ABFFB2ABFFB4AB
            HEX   FFB6ABFFB8ABFFBAABFFBCABFFBEE3FF
            HEX   6AE3FF6CE3FF6EE3FF70E3FF72E3FF74
            HEX   E3FF76E3FF78E3FF7AE3FF7CE3FF7EE3
            HEX   FF80E3FF82E3FF84E3FF86E3FF88E3FF
            HEX   8AE3FF8CE3FF8EE3FF92E3FF90FDFDFD
            ASC   'THIS W'

*-----------------------------------
* DECODE LOGO
*-----------------------------------

decodeLOGO  STA   $16
            STY   $16+1
            LDA   zpMONITOR	; save monitor type
            PHA
            LDA   #$01		; force color
            STA   zpMONITOR
            LDA   #$00
            STA   $1E		; no high-bit
            STA   $0D
            STA   $0F
L5273       LDY   #$00
            LDA   ($16),Y
            STA   $0C
            INY
            LDA   ($16),Y
            STA   $0E
            INY
            LDA   ($16),Y	; line
            STA   $10
            CMP   #$FD		; exit
            BEQ   L52A7
            CMP   #$FE		; reset high-bit
            BEQ   L52AD
            CMP   #$FF		; set high-bit
            BEQ   L52B4
            JSR   drawHLINE
            LDA   KBD
            CMP   #" "
            BEQ   L52A7
L5299       CLC		; ptr +=3
            LDA   $16
            ADC   #$03
            STA   $16
            BCC   L52A4
            INC   $16+1
L52A4       JMP   L5273

L52A7       PLA		; restore monitor type
            STA   zpMONITOR
            JMP   getINPUT	; exit

L52AD       LDA   #$00		; reset high-bit
            STA   $1E
            JMP   L5299

L52B4       LDA   #$80		; set high-bit
            STA   $1E
            JMP   L5299

*-----------------------------------
* SHOW TITLE SCREEN
*-----------------------------------

showTITLESCREEN
            LDA   TXTCLR	; set GR MODE PAGE 2
            LDA   LORES
            LDA   MIXCLR
            LDA   TXTPAGE2
            LDA   #$DD		; make it yellow
            LDY   #$00
L52CB       STA   TEXT2,Y
            STA   TEXT2+$100,Y
            STA   TEXT2+$200,Y
            STA   TEXT2+$300,Y
            INY
            BNE   L52CB
            JSR   clearHGR

            LDA   #<theLOGO
            LDY   #>theLOGO
            JSR   decodeLOGO
            JSR   setHGR
            LDY   #$0A
L52E9       LDX   #$FA
            JSR   doWAIT2
            LDA   KBD
            CMP   #" "
            BEQ   L52F9
            DEY
            BPL   L52E9
            RTS
L52F9       JMP   getINPUT

*-----------------------------------
* 
*-----------------------------------

L52FC       JSR   L54D4
            LDA   #$00
            STA   $F4
L5303       JSR   L531E
L5306       JSR   prepareLEVEL
            JSR   L5850
            JSR   L53E6
L530F       JSR   L7861
            JSR   L86EA
            JSR   L6A7C
            JSR   L570C
            JMP   L530F

L531E       LDA   #$01
            STA   $59
            JSR   L5331
            LDA   #$F8
            STA   $56
            LDA   #$40
            STA   $57
            JSR   savePLAYERDATA
            RTS

*-----------------------------------
* SET DEFAULT BOARD
*-----------------------------------

L5331       LDA   #<dftBOARD
            STA   $14
            LDA   #>dftBOARD
            STA   $14+1
            LDA   #<theBOARD
            STA   $16
            LDA   #>theBOARD
            STA   $16+1
            LDY   #$00
L5343       LDA   ($14),Y
            STA   ($16),Y
            INC   $16
            BNE   L534D
            INC   $16+1
L534D       INC   $14
            BNE   L5353
            INC   $14+1
L5353       LDA   $16+1
            CMP   #>dftBOARD
            BNE   L5343
            LDA   $16
            CMP   #<dftBOARD
            BNE   L5343
            RTS

*-----------------------------------
* LOAD PLAYER BOARD
*-----------------------------------

loadPLAYERBOARD
            LDA   $50
            ASL
            TAX
            LDA   L53B2,X
            STA   $14
            LDA   L53B2+1,X
            CLC
            ADC   #$03
            STA   $15
            LDA   #<theBOARD
            STA   $16
            LDA   #>theBOARD
            CLC
            ADC   #$03
            STA   $17

*-----------------------------------
* COPY FROM/TO BOARD BUFFER
*-----------------------------------

L537C       LDX   #$03	; $copy $380 bytes of buffer data
            LDY   #$7F	; this is a player's board
L5380       LDA   ($14),Y
            STA   ($16),Y
            DEY
            BNE   L5380
            LDA   ($14),Y
            STA   ($16),Y
            DEY
            DEC   $16+1
            DEC   $14+1
            DEX
            BPL   L5380
            RTS

*-----------------------------------
* SAVE PLAYER BOARD
*-----------------------------------

savePLAYERBOARD
            LDA   $50
            ASL
            TAX
            LDA   L53B2,X
            STA   $16
            LDA   L53B2+1,X
            CLC
            ADC   #$03
            STA   $16+1
            LDA   #<theBOARD
            STA   $14
            LDA   #>theBOARD
            CLC
            ADC   #$03
            STA   $14+1
            BNE   L537C

L53B2       DA    $0666		; board buffers ($380) per player
            DA    L0C00
            DA    L1000
            DA    L1380
            DA    L1700
            DA    L1A80

*-----------------------------------
* SAVE PLAYER DATA
*-----------------------------------

savePLAYERDATA
            LDX   $50
            LDY   L53E0,X
            LDX   #$07
L53C5       LDA   $52,X
            STA   L0300,Y
            DEY
            DEX
            BPL   L53C5
            RTS

*-----------------------------------
* LOAD PLAYER DATA
*-----------------------------------

loadPLAYERDATA
            LDX   $50
            LDY   L53E0,X
            LDX   #$07
L53D6       LDA   L0300,Y
            STA   $52,X
            DEY
            DEX
            BPL   L53D6
            RTS

L53E0       DB    $00	; offset of player data
            DB    $07
            DB    $0F
            DB    $17
            DB    $1F
            DB    $27

*-----------------------------------
* 
*-----------------------------------

L53E6       JSR   L5839
            LDX   #$0D
L53EB       LDA   L5446,X
            STA   $60,X
            DEX
            BPL   L53EB
            LDY   #$53
L53F5       LDA   L5454,Y
            STA   |$0084,Y
            DEY
            BPL   L53F5
            LDA   #$00
            LDY   #$06
L5402       STA   |$0059,Y
            DEY
            BPL   L5402
            JSR   L6E79
            JSR   loadPLAYERDATA
            LDA   #$01
            STA   $E9
            LDA   #$A0
            STA   $EA
            LDA   #$00
            STA   $EB
            STA   $E4
            STA   $E7
            STA   $1F
            JSR   L6D1E
            TAX
            LDY   #$12
            LDA   L54A4,X
            STA   |$0098,Y
            LDA   L54B4,X
            STA   |$00AC,Y
            LDA   L54C4,X
            STA   |$00C0,Y
            LDY   #$03
L543A       LDX   #$FF
            JSR   doWAIT2
            DEY
            BPL   L543A
            JSR   getINPUT
            RTS

L5446       DB    $8B
            DB    $8F
            DB    $03
            DB    $03
            DB    $2C
            DB    $2D
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $0D
            DB    $17
            DB    $02
            DB    $00
L5454       DB    $8B
            DB    $47
            DB    $03
            DB    $17
            DB    $18
            DB    $00
            DB    $08
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $7F
            DB    $5D
            DB    $01
            DB    $17
            DB    $18
            DB    $00
            DB    $09
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $01
            DB    $80
            DB    $00
            DB    $8B
            DB    $55
            DB    $00
            DB    $17
            DB    $18
            DB    $00
            DB    $0A
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $40
            DB    $00
            DB    $99
            DB    $5D
            DB    $01
            DB    $17
            DB    $18
            DB    $00
            DB    $0B
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $04
            DB    $01
            DB    $01
            DB    $A0
            DB    $00
L54A4       DB    $00
            DB    $70
            DB    $50
            DB    $30
            DB    $30
            DB    $14
            DB    $14
            DB    $10
            DB    $10
            DB    $0E
            DB    $0E
            DB    $10
            DB    $10
            DB    $08
            DB    $08
            DB    $08
L54B4       DB    $00
            DB    $30
            DB    $28
            DB    $20
            DB    $20
            DB    $10
            DB    $10
            DB    $08
            DB    $08
            DB    $05
            DB    $05
            DB    $08
            DB    $08
            DB    $08
            DB    $04
            DB    $04
L54C4       DB    $00
            DB    $90
            DB    $70
            DB    $40
            DB    $40
            DB    $18
            DB    $18
            DB    $14
            DB    $14
            DB    $12
            DB    $12
            DB    $10
            DB    $12
            DB    $04
            DB    $0A
            DB    $09

*-----------------------------------
* 
*-----------------------------------

L54D4       LDA   #$00
            STA   $52
            STA   $53
            STA   $54
            STA   $E8
            STA   $F3
L54E0       LDA   #$01
            STA   $55
            LDA   #$01
            STA   $59
            LDA   #$83
            STA   $58
            LDA   #$F8
            STA   $56
            LDA   #$40
            STA   $57
            LDA   $51
            STA   $50
            JSR   L5331
L54FB       JSR   savePLAYERDATA
            JSR   savePLAYERBOARD
            DEC   $50
            BNE   L54FB
            LDA   #$01
            STA   $50
            RTS

L550A       LDA   $51
            STA   $50
L550E       LDA   $50
            ASL
            ASL
            ASL
            TAX
            LDA   L55CC,X
            STA   $0B
            LDA   L55CD,X
            STA   $0A
            JSR   L556E
            LDA   #$00
            STA   $0D
            STA   $0F
            LDA   $0B
            STA   $0C
            CLC
            ADC   #$31
            STA   $0E
            BCC   L5534
            INC   $0F
L5534       JSR   L5CF6
            LDA   $50
            BEQ   L553E
            JSR   loadPLAYERDATA
L553E       JSR   L70CC
            DEC   $50
            BMI   L5563
            BEQ   L554A
            JMP   L550E

L554A       LDA   #<L5628
            STA   L5591+1
            LDA   #>L5628
            STA   L5596+1
            LDA   $00
            STA   $52
            LDA   $01
            STA   $53
            LDA   $02
            STA   $54
            JMP   L550E

L5563       LDA   #<L55F7
            STA   L5591+1
            LDA   #>L55F7
            STA   L5596+1
            RTS

L556E       LDA   L55C7,X
            STA   zpXCOL
            LDA   L55C8,X
            STA   $10
            LDA   L55C9,X
            STA   $0E
            LDA   L55CA,X
            STA   $0F
            LDA   L55CB,X
            STA   $11
            LDA   #$00
            STA   zpXBIT
            LDA   #$07
            STA   $18
            STA   $1A
L5591       LDA   #<L55F7
            STA   L55B1+1
L5596       LDA   #>L55F7
            STA   L55B1+2
            JSR   L55A6
            LDA   $50
            BEQ   L55A5
            JSR   L7159
L55A5       RTS

L55A6       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   $1A
            STA   $09
L55B1       LDA   $0666,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            INY
            DEC   $09
            BNE   L55B1
            STX   $03	; next X
            INC   $10	; next Y
            DEC   $18	; data--
            BNE   L55A6
            RTS

L55C7       DB    $00
L55C8       DB    $54
L55C9       DB    $2F
L55CA       DB    $00
L55CB       DB    $54
L55CC       DB    $04
L55CD       DB    $5C
            DB    $00
            DB    $00
            DB    $06
            DB    $2F
            DB    $00
            DB    $06
            DB    $04
            DB    $0E
            DB    $00
            DB    $20
            DB    $06
            DB    $0F
            DB    $01
            DB    $06
            DB    $E4
            DB    $0E
            DB    $00
            DB    $00
            DB    $29
            DB    $2F
            DB    $00
            DB    $29
            DB    $04
            DB    $31
            DB    $00
            DB    $20
            DB    $29
            DB    $0F
            DB    $01
            DB    $29
            DB    $E4
            DB    $31
            DB    $00
            DB    $20
            DB    $54
            DB    $0F
            DB    $01
            DB    $54
            DB    $E4
            DB    $5C
            DB    $00
L55F7       DB    $70
            DB    $09
            DB    $10
            DB    $22
            DB    $5F
            DB    $07
            DB    $0A
            DB    $10
            DB    $0A
            DB    $28
            DB    $22
            DB    $41
            DB    $08
            DB    $0A
            DB    $10
            DB    $0A
            DB    $44
            DB    $14
            DB    $41
            DB    $08
            DB    $1F
            DB    $70
            DB    $09
            DB    $7C
            DB    $08
            DB    $5F
            DB    $07
            DB    $0A
            DB    $10
            DB    $08
            DB    $44
            DB    $08
            DB    $41
            DB    $02
            DB    $1F
            DB    $10
            DB    $08
            DB    $44
            DB    $08
            DB    $41
            DB    $04
            DB    $0A
            DB    $10
            DB    $78
            DB    $45
            DB    $08
            DB    $5F
            DB    $08
            DB    $0A
L5628       DB    $30
            DB    $7B
            DB    $79
            DB    $78
            DB    $38
            DB    $3E
            DB    $38
            DB    $10
            DB    $2A
            DB    $8D
            DB    $44
            DB    $44
            DB    $44
            DB    $22
            DB    $10
            DB    $22
            DB    $04
            DB    $02
            DB    $04
            DB    $45
            DB    $02
            DB    $70
            DB    $22
            DB    $78
            DB    $02
            DB    $04
            DB    $3D
            DB    $1E
            DB    $10
            DB    $22
            DB    $40
            DB    $02
            DB    $04
            DB    $15
            DB    $02
            DB    $10
            DB    $2A
            DB    $45
            DB    $44
            DB    $44
            DB    $24
            DB    $22
            DB    $30
            DB    $7B
            DB    $7C
            DB    $78
            DB    $38
            DB    $46
            DB    $38

*-----------------------------------
* PREPARE THE COMPLETE LEVEL
*-----------------------------------

prepareLEVEL
            JSR   clearHGR
            STA   KBDSTROBE
            JSR   setHGR
            JSR   drawGAMEBOARD
            JSR   drawGHOSTDOOR
            LDA   $50	; save current player index
            STA   $F1
            JSR   loadPLAYERDATA
            JSR   drawDOTS
            JSR   L550A
            LDA   $F1	; restore current player index
            STA   $50
            JSR   loadPLAYERDATA
            JSR   L5692
            JSR   L56CF
            LDA   $E8
            BNE   L5691
            LDA   $F4	; did we already play the intro music? 
            BNE   L5691
            JSR   playINTROMUSIC
            LDA   #$01
            STA   $F4
L5691       RTS

L5692       bit   L6F13		; LoGo
            LDA   #$E1
            STA   $0E
            LDA   #$00
            STA   $0F
            LDA   #$B0
            STA   $11
            LDA   $55
            JSR   L56C3
            STA   $19
            AND   #$F0
            BEQ   L56B3
            ROR
            ROR
            ROR
            ROR
            JSR   L7159
L56B3       LDA   #$E7
            STA   $0E
            LDA   #$B0
            STA   $11
            LDA   $19
            AND   #$0F
            JSR   L7159
            RTS

L56C3       TAX
            LDA   #$00
            SED
            CLC
L56C8       ADC   #$01
            DEX
            BNE   L56C8
            CLD
            RTS

L56CF       LDA   $58
            AND   #$7F
            STA   $19
            LDA   $E8
            BNE   L56FC
            LDA   #$09
            STA   $0E
            LDA   #$00
            STA   $0D
            LDA   #$B2
            STA   $11
            LDA   $19
            BNE   L56EA
            RTS

L56EA       DEC   $19
            BEQ   L56FC
L56EE       JSR   L56FD
            CLC
            LDA   $0E
            ADC   #$0C
            STA   $0E
            DEC   $19
            BNE   L56EE
L56FC       RTS

L56FD       LDA   $0E
            STA   $0C
            LDA   $11
            STA   $10
            LDA   #<L9CB8
            LDY   #>L9CB8
            JMP   L6A20

L570C       JSR   L58B3
            LDA   $5E
            BEQ   L5716
            DEC   $5E
            RTS

L5716       JSR   L6D1E
            TAX
            LDA   L5733,X
            STA   $5E
            LDA   $5F
            BEQ   L572B
            JSR   L5743
            LDA   #$00
            STA   $5F
            RTS

L572B       JSR   L57BE
            LDA   #$01
            STA   $5F
            RTS

L5733       DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50

*-----------------------------------
* 
*-----------------------------------

L5743       LDA   #$00
            STA   $0D
            LDA   #$62
            STA   $17
            CLC
            LDA   #$3A
            ADC   #$23
            STA   $16
            BCC   L5756
            INC   $17
L5756       LDY   #$00
            LDA   ($16),Y
            BEQ   L5767
            LDA   #$3F
            STA   $0C
            LDA   #$15
            STA   $10
            JSR   L7819
L5767       CLC
            LDA   $16
            ADC   #$14
            STA   $16
            BCC   L5772
            INC   $17
L5772       LDY   #$00
            LDA   ($16),Y
            BEQ   L5783
            LDA   #$3F
            STA   $0C
            LDA   #$8D
            STA   $10
            JSR   L7819
L5783       CLC
            LDA   #<theBOARD
            ADC   #$43
            STA   $16
            LDA   #>theBOARD
            ADC   #$03
            STA   $16+1
            LDY   #$00
            LDA   ($16),Y
            BEQ   L57A1
            LDA   #$D6
            STA   $0C
            LDA   #$15
            STA   $10
            JSR   L7819
L57A1       CLC
            LDA   $16
            ADC   #$14
            STA   $16
            BCC   L57AC
            INC   $17
L57AC       LDY   #$00
            LDA   ($16),Y
            BEQ   L57BD
            LDA   #$D6
            STA   $0C
            LDA   #$8D
            STA   $10
            JSR   L7819
L57BD       RTS

L57BE       LDA   #$00
            STA   $0D
            LDA   #>theBOARD
            STA   $16+1
            CLC
            LDA   #<theBOARD
            ADC   #$23
            STA   $16
            BCC   L57D1
            INC   $17
L57D1       LDY   #$00
            LDA   ($16),Y
            BEQ   L57E2
            LDA   #$40
            STA   $0C
            LDA   #$16
            STA   $10
            JSR   L61B6
L57E2       CLC
            LDA   $16
            ADC   #$14
            STA   $16
            BCC   L57ED
            INC   $17
L57ED       LDY   #$00
            LDA   ($16),Y
            BEQ   L57FE
            LDA   #$40
            STA   $0C
            LDA   #$8E
            STA   $10
            JSR   L61B6
L57FE       CLC
            LDA   #<theBOARD
            ADC   #$43
            STA   $16
            LDA   #>theBOARD
            ADC   #$03
            STA   $17
            LDY   #$00
            LDA   ($16),Y
            BEQ   L581C
            LDA   #$D6
            STA   $0C
            LDA   #$16
            STA   $10
            JSR   L61B6
L581C       CLC
            LDA   $16
            ADC   #$14
            STA   $16
            BCC   L5827
            INC   $17
L5827       LDY   #$00
            LDA   ($16),Y
            BEQ   L5838
            LDA   #$D6
            STA   $0C
            LDA   #$8E
            STA   $10
            JSR   L61B6
L5838       RTS

L5839       LDA   #$8B
            STA   $0C
            LDA   #$8F
            STA   $10
            LDA   #$00
            STA   $0D
            LDA   #$00
            STA   $1E
            LDA   #<L96FA
            LDY   #>L96FA
            JMP   L6A20

L5850       JSR   L5839
            LDA   $E8
            BEQ   L585A
            JMP   L80E3

L585A       LDA   #$68
            STA   $10
            LDA   #$00
            STA   zpXBIT
            LDA   #$05
            STA   $1A
            LDA   #$07
            STA   $18
            LDA   #$11
            STA   zpXCOL
            LDA   #$90
            STA   L55B1+1
            LDA   #$58
            STA   L55B1+2
            JSR   L55A6
            LDY   #$08
L587D       LDX   #$FF
            JSR   doWAIT2
            DEY
            BNE   L587D
            LDA   #$10
            STA   zpXCOL
            LDA   #$66
            STA   $10
            JMP   L6978

            DB    $78
            DB    $7C
            DB    $0C
            DB    $0F
            DB    $49
            DB    $08
            DB    $05
            DB    $12
            DB    $51
            DB    $48
            DB    $44
            DB    $02
            DB    $52
            DB    $48
            DB    $24
            DB    $3C
            DB    $1E
            DB    $4F
            DB    $08
            DB    $23
            DB    $06
            DB    $41
            DB    $28
            DB    $04
            DB    $11
            DB    $4A
            DB    $40
            DB    $14
            DB    $42
            DB    $00
            DB    $31
            DB    $2F
            DB    $74
            DB    $21
            DB    $04

*-----------------------------------
* 
*-----------------------------------

L58B3       LDA   $59
            CMP   #$01
            BNE   L58C6
            LDA   $E8
            BEQ   L58C0
            JSR   L80E3
L58C0       LDA   $E5
            BEQ   L58C7
            DEC   $E5
L58C6       RTS

L58C7       JSR   L6D1E
            TAX
            LDA   L5903,X
            STA   $E5
            LDA   $E6
            BEQ   L58DF
            JSR   L58E7
            LDA   #$00
            STA   $E6
            CLC
            ROR   $E5
            RTS

L58DF       JSR   L58FA
            LDA   #$01
            STA   $E6
            RTS

L58E7       LDA   $50
            ASL
            TAX
            LDA   L6992,X
            STA   zpXCOL
            LDA   L6993,X
            SBC   #$0E
            STA   $10
            JMP   L6978

L58FA       LDA   $50
            ASL
            ASL
            ASL
            TAX
            JMP   L556E

L5903       DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08

*-----------------------------------
* DRAW A DOT ON SCREEN
*-----------------------------------

drawDOT     LDA   L5925,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            RTS

            LDA   L592C,X
            AND   (zpHGR),Y
            ORA   $1E
            STA   (zpHGR),Y
            RTS

L5925       DB    $01
            DB    $02
            DB    $04
            DB    $08
            DB    $10
            DB    $20
            DB    $40
L592C       DB    $FE
            DB    $FD
            DB    $FB
            DB    $F7
            DB    $EF
            DB    $DF
            DB    $BF

*-----------------------------------
* CALCULATE HGR X-COORDS
*-----------------------------------

calcXYHGR   LDA   $0D	; address in board?
            BEQ   L594B	; yup
            CLC	; no, after
            LDA   $0C
            ADC   #$04
            TAX
            CLC
            LDA   L5A58,X
            ADC   #$24
            STA   zpXCOL	; to the right of the board
            LDA   L5958,X
            STA   zpXBIT	; the x-sprite offset
            RTS

L594B       LDX   $0C	; from x-coord
            LDA   L5A58,X
            STA   zpXCOL	; to x-screen
            LDA   L5958,X
            STA   zpXBIT	; and x-sprite offset
            RTS

*--- X-coord to Y-byte

L5958       HEX   00010203040506000102030405060001
            HEX   02030405060001020304050600010203
            HEX   04050600010203040506000102030405
            HEX   06000102030405060001020304050600
            HEX   01020304050600010203040506000102
            HEX   03040506000102030405060001020304
            HEX   05060001020304050600010203040506
            HEX   00010203040506000102030405060001
            HEX   02030405060001020304050600010203
            HEX   04050600010203040506000102030405
            HEX   06000102030405060001020304050600
            HEX   01020304050600010203040506000102
            HEX   03040506000102030405060001020304
            HEX   05060001020304050600010203040506
            HEX   00010203040506000102030405060001
            HEX   02030405060001020304050600010203

*--- X-coord to Y-col

L5A58       HEX   00000000000000010101010101010202
            HEX   02020202020303030303030304040404
            HEX   04040405050505050505060606060606
            HEX   06070707070707070808080808080809
            HEX   0909090909090A0A0A0A0A0A0A0B0B0B
            HEX   0B0B0B0B0C0C0C0C0C0C0C0D0D0D0D0D
            HEX   0D0D0E0E0E0E0E0E0E0F0F0F0F0F0F0F
            HEX   10101010101010111111111111111212
            HEX   12121212121313131313131314141414
            HEX   14141415151515151515161616161616
            HEX   16171717171717171818181818181819
            HEX   1919191919191A1A1A1A1A1A1A1B1B1B
            HEX   1B1B1B1B1C1C1C1C1C1C1C1D1D1D1D1D
            HEX   1D1D1E1E1E1E1E1E1E1F1F1F1F1F1F1F
            HEX   20202020202020212121212121212222
            HEX   22222222222323232323232324242424

*-----------------------------------
* SET HGR ADDRESS
*-----------------------------------

setHGRADDRESS
            LDX   $10
            LDA   L5B67,X
            STA   zpHGR
            LDA   L5C27,X
            ORA   #>HGR
            STA   zpHGR+1
            RTS

*--- The HGR tables

L5B67       HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
L5C27       HEX   0004080C1014181C0004080C1014181C
            HEX   0105090D1115191D0105090D1115191D
            HEX   02060A0E12161A1E02060A0E12161A1E
            HEX   03070B0F13171B1F03070B0F13171B1F
            HEX   0004080C1014181C0004080C1014181C
            HEX   0105090D1115191D0105090D1115191D
            HEX   02060A0E12161A1E02060A0E12161A1E
            HEX   03070B0F13171B1F03070B0F13171B1F
            HEX   0004080C1014181C0004080C1014181C
            HEX   0105090D1115191D0105090D1115191D
            HEX   02060A0E12161A1E02060A0E12161A1E
            HEX   03070B0F13171B1F03070B0F13171B1F

*-----------------------------------
* GET NEXT X BIT (0..7)
*-----------------------------------

getNEXTXBIT INX	; next X-bit
            CPX   #$07
            BCC   L5CEF
            LDX   #$00	; loop done
            INY	; next Y-coord
L5CEF       RTS

*-----------------------------------
* DRAW LINE
*-----------------------------------

drawHLINE   LDA   #$00
            STA   $0D
            STA   $0F
L5CF6       JSR   setHGRADDRESS
            JSR   calcXYHGR
            LDX   zpXBIT
            LDY   zpXCOL
L5D00       JSR   drawDOT
            LDA   (zpHGR),Y
            AND   #$7F
            ORA   $1E
            STA   (zpHGR),Y
            LDA   zpMONITOR
            BEQ   L5D31
            JSR   getNEXTXBIT
            JSR   getNEXTXBIT
            CLC
            LDA   $0C
            ADC   #$02
            STA   $0C
            BCC   L5D20
            INC   $0D
L5D20       LDA   $0D
            CMP   $0F
            BCC   L5D00
            BEQ   L5D2A
            BCS   L5D30
L5D2A       LDA   $0E	; end of X?
            CMP   $0C
            BCS   L5D00	; no, loop
L5D30       RTS

L5D31       JSR   getNEXTXBIT
            INC   $0C
            BNE   L5D20
            INC   $0D
            JMP   L5D20

*-----------------------------------
* DRAW A VERTICAL LINE
*-----------------------------------

drawVLINE   JSR   calcXYHGR
L5D40       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            JSR   drawDOT
            INC   $10	; next Y
            LDA   $11	; Y-end reached?
            CMP   $10
            BCS   L5D40	; no, loop
            RTS	; yes, exit

*-----------------------------------
* DRAW GAME BOARD
*-----------------------------------

drawGAMEBOARD
            LDA   #$80
            STA   $1E
            LDA   zpMONITOR
            BEQ   L5D66
            LDA   #<boardBW
            STA   $16
            LDA   #>boardBW
            STA   $17
            JMP   L5D6E

L5D66       LDA   #<boardCOLOR
            STA   $16
            LDA   #>boardCOLOR
            STA   $16+1
L5D6E       LDA   #$00
            STA   $0D
            LDA   #$48		; $48 entries for horizontal line
            STA   $08
L5D76       LDY   #$00
            LDA   ($16),Y
            STA   $0C		; x from
            INY
            LDA   ($16),Y
            STA   $0E		; x to
            INY
            LDA   ($16),Y
            STA   $10		; y
            JSR   drawHLINE
            CLC
            LDA   #$03
            ADC   $16
            STA   $16
            BCC   L5D94
            INC   $17
L5D94       DEC   $08
            BNE   L5D76

            LDA   #$46		; $46 entries for vertical line
            STA   $08
L5D9C       LDY   #$00
            LDA   ($16),Y
            STA   $0C
            INY
            LDA   ($16),Y
            STA   $10
            INY
            LDA   ($16),Y
            STA   $11
            JSR   drawVLINE
            CLC
            LDA   $16
            ADC   #$03
            STA   $16
            BCC   L5DBA
            INC   $17
L5DBA       DEC   $08
            BNE   L5D9C
            RTS

*--- The board in color

boardCOLOR  HEX   3C89058B8E1D90DD05C1DD3CC1E153C1
            HEX   E160C1DD77D3DD96D3DD9B3CDDBA3C46
            HEX   9B3C46963C58773958603958533C583C
            HEX   49581249581D677C12677C1D9DB2129D
            HEX   B21DC1D012C1D01D49582A49582FC1D0
            HEX   2AC1D02F79A04E79A065676A60686A77
            HEX   AFB260AFB277677C84677C899DB2849D
            HEX   B28949588455589B495389C1D084C6D0
            HEX   89C1C49B676A2A6C7C3C6C7C41676A53
            HEX   79A02A90A02F8B8E4179892FAFB22AAF
            HEX   B2539DAD419DAD3C79A07290A0778B8E
            HEX   89798977676A966C7CA8497CAD4965A8
            HEX   79A09690A09B8B8EAD79899BAFB296B4
            HEX   D0A89DD0AD9DADA88A061C8F061CDE06
            HEX   3BC03D52C06176DE7895D2979ADE9CB9
            HEX   3B9CB947979A3B7895596176593D523B
            HEX   063B59131C48131C7D131C66131CB313
            HEX   1C9C131CD1131CC0131C592B2E482B2E
            HEX   D12B2EC02B2EA14F64784F646B617666
            HEX   6176B36176AE61767D8588668588B385
            HEX   889C858859859A548A9A488588D18588
            HEX   C58A9AC0859A6B2B3B7D3D406B425266
            HEX   2B52A12B2E8F30408A3040782B2EB32B
            HEX   52AE42529C3D40AE2B3BA173768F7888
            HEX   8A78887873766B97A77DA9AC48A9AC66
            HEX   97A7A1979A8F9CAC8A9CAC78979AB397
            HEX   A7D1A9AC9CA9ACAE97A7

*--- The board in black & white

boardBW     HEX   3C88058C8E1D90DC05C2DC3CC2E253C2
            HEX   E260C2DC77D4DC96D4DC9B3CDCBA3C44
            HEX   9B3C44963C56773856603856533C563C
            HEX   4A56124A561D687A12687A1D9EB0129E
            HEX   B01DC2CE12C2CE1D4A562A4A562FC2CE
            HEX   2AC2CE2F7A9E4E7A9E65686A60686A77
            HEX   B0B260B0B277687A84687A899EB0849E
            HEX   B0894A568456589B4A5289C2CE84C8CE
            HEX   89C2C49B686A2A6C7A3C6C7A41686A53
            HEX   7A9E2A909E2F8C8E417A882FB0B22AB0
            HEX   B2539EAC419EAC3C7A9E72909E778C8E
            HEX   897A8877686A966C7AA84A7AAD4A64A8
            HEX   7A9E96909E9B8C8EAD7A889BB0B296B4
            HEX   CEA89ECEAD9EACA88A061C8E061CDE06
            HEX   3BC03D52C06176DE7895D2979ADE9CB9
            HEX   3A9CB946979A3A7895586176583D523A
            HEX   063B58131C48131C7C131C66131CB213
            HEX   1C9C131CD0131CC0131C582B2E482B2E
            HEX   D02B2EC02B2EA04F64784F646A617666
            HEX   6176B26176AE61767C8588668588B285
            HEX   889C858858859A548A9A488588D08588
            HEX   C48A9AC0859A6A2B3B7C3D406A425266
            HEX   2B52A02B2E8E30408A3040782B2EB22B
            HEX   52AE42529C3D40AE2B3BA073768E7888
            HEX   8A78887873766A97A77CA9AC48A9AC66
            HEX   97A7A0979A8E9CAC8A9CAC78979AB297
            HEX   A7D0A9AC9CA9ACAE97A7

*-----------------------------------
* DRAW ALL REMAINING DOTS
*-----------------------------------
* 0: empty
* 1: normal dot
* 2: energy dot
*
* The board is stored per column!!

drawDOTS    LDA   #<theBOARD
            STA   $16
            LDA   #>theBOARD
            STA   $16+1
            LDA   #$3B	; draw at X=$3B
            STA   $0E
L611F       LDA   #$01	; index in board
            STA   $19
            LDA   #$0B	; draw at Y=$B
            STA   $11
L6127       LDY   $19
            LDA   ($16),Y
            BEQ   L614D	; empty
            ROR
            BCS   L6142
            LDA   $0E	; move X/Y coord
            STA   $0C	; by -1
            DEC   $0C
            LDA   $11
            STA   $10
            DEC   $10
            JSR   L61B6	; draw big dot
            CLC
            BCC   L614D
L6142       LDA   $0E
            STA   $0C
            LDA   $11
            STA   $10
            JSR   L6172	; draw standard energy dot
	
L614D       CLC	; next Y on board
            LDA   $11
            ADC   #$06
            STA   $11

            INC   $19	; next X-board
            LDA   $19	; end of line?
            CMP   #$1F
            BCC   L6127
            LDA   $16	; yes, next board line
            ADC   #$1F
            STA   $16
            BCC   L6166
            INC   $16+1
L6166       CLC	; next X
            LDA   $0E
            ADC   #$06
            STA   $0E
            CMP   #$DD	; until last line
            BCC   L611F
            RTS

L6172       JSR   calcXYHGR
            ASL   $03
            JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   L61A8,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            INY
            LDA   L61A8,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INC   $10
            JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   L61A8,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            INY
            LDA   L61A8,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            RTS

L61A8       DB    $03
            DB    $00
            DB    $06
            DB    $00
            DB    $0C
            DB    $00
            DB    $18
            DB    $00
            DB    $30
            DB    $00
            DB    $60
            DB    $00
            DB    $40
            DB    $01

L61B6       LDA   #<L61CA
            STA   L6950+1
            STA   L6959+1
            LDA   #>L61CA
            STA   L6950+2
            STA   L6959+2
            JSR   L693A
            RTS

L61CA       DB    $86
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $86
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $8C
            DB    $80
            DB    $9E
            DB    $80
            DB    $9E
            DB    $80
            DB    $8C
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $98
            DB    $80
            DB    $BC
            DB    $80
            DB    $BC
            DB    $80
            DB    $98
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $B0
            DB    $80
            DB    $F8
            DB    $80
            DB    $F8
            DB    $80
            DB    $B0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $80
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $E0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $81
            DB    $E0
            DB    $83
            DB    $E0
            DB    $83
            DB    $C0
            DB    $81
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $83
            DB    $C0
            DB    $87
            DB    $C0
            DB    $87
            DB    $80
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80

*-----------------------------------
* CURRENT BOARD (32-Y x 28-X)
*-----------------------------------

theBOARD    HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010FFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010AFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF

*-----------------------------------
* DEFAULT BOARD (STORED PER COLUMN)
*-----------------------------------
* The first byte is not used to make 32b wide
* Turn your head 90¡ to the left to see where the dots are

dftBOARD    HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0001010201010101010000000000000000000000010101020000010101010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010000010000000000000000000000010000010101010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001010101010101010101010101010101010101010101010101010000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001000000010101010000000000000000000000010000010101010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001010101010000010101000000000000000000010101010000010101010000
            HEX   0000000000010000000000000000000000000000000000000000000000010000
            HEX   0000000000010000000000000000000000000000000000000000000000010000
            HEX   0001010101010000010101000000000000000000010101010000010101010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010101010000000000000000000000010000010101010000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001010101010101010101010101010101010101010101010101010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001000000010000010000000000000000000000010000010101010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001010201010101010000000000000000000000010101020000010101010000
            HEX   0000000000000000000000000000000000000000000000000000000000000000

*-----------------------------------
* DRAW BIG SPRITE
*-----------------------------------

L693A       LDA   #$F8
            STA   $18
            JSR   calcXYHGR
            LDA   $03
            ASL
            ASL
            ASL
            ASL
            STA   zpXBIT
L6949       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
L6950       LDA   $0666,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INY
            INX
L6959       LDA   $0666,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            STX   $03
            INC   $10
            INC   $18
            BNE   L6949
            RTS

L696A       LDA   $50
            ASL
            TAX
            LDA   L6992,X
            STA   zpXCOL
            LDA   L6993,X
            STA   $10
L6978       LDA   #$0C
            STA   $18
L697C       JSR   setHGRADDRESS
            LDY   zpXCOL
            LDX   #$08
            LDA   #$80
L6985       STA   (zpHGR),Y
            INY
            DEX
            BNE   L6985
            INC   $10
            DEC   $18
            BNE   L697C
            RTS

L6992       DB    $00
L6993       DB    $5E
            DB    $00
            DB    $10
            DB    $20
            DB    $10
            DB    $00
            DB    $33
            DB    $20
            DB    $33
            DB    $20
            DB    $5E

*-----------------------------------
* 
*-----------------------------------

L699E       JSR   L7D9A
L69A1       LDA   #$F6
            STA   $18
            JSR   calcXYHGR
            ASL   $03
            ASL   $03
L69AC       JSR   setHGRADDRESS
            LDA   #$03	; width
            STA   $09
            LDX   zpXBIT
            LDY   zpXCOL
L69B7       LDA   L69CD,X
            AND   (zpHGR),Y
            ORA   #$80
            STA   (zpHGR),Y
            INY
            INX
            DEC   $09
            BNE   L69B7
            INC   $10	; Y+=1
            INC   $18	; data++
            BNE   L69AC
            RTS

L69CD       DB    $00
            DB    $78
            DB    $7F
            DB    $00
            DB    $01
            DB    $70
            DB    $7F
            DB    $00
            DB    $03
            DB    $60
            DB    $7F
            DB    $00
            DB    $07
            DB    $40
            DB    $7F
            DB    $00
            DB    $0F
            DB    $00
            DB    $7F
            DB    $00
            DB    $1F
            DB    $00
            DB    $7E
            DB    $00
            DB    $3F
            DB    $00
            DB    $7C
            DB    $00

L69E9       JSR   L7DA9
            LDA   #<L6A04
            LDY   #>L6A04
            STA   L69B7+1
            STY   L69B7+2
            JSR   L69A1
            LDA   #<L69CD
            LDY   #>L69CD
            STA   L69B7+1
            STY   L69B7+2
            RTS

L6A04       DB    $00
            DB    $60
            DB    $7F
            DB    $00
            DB    $01
            DB    $40
            DB    $7F
            DB    $00
            DB    $03
            DB    $00
            DB    $7F
            DB    $00
            DB    $07
            DB    $00
            DB    $7E
            DB    $00
            DB    $0F
            DB    $00
            DB    $7C
            DB    $00
            DB    $1F
            DB    $00
            DB    $78
            DB    $00
            DB    $3F
            DB    $00
            DB    $70
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L6A20       LDX   zpMONITOR
            BEQ   L6A28
            LDX   $1E
            BNE   L6A62
L6A28       STA   L6A4A+1
            STY   L6A4A+2
            JSR   L7D9A
            LDA   #$0A
            STA   $18
            LDA   #$03
            STA   $1A
            JSR   calcXYHGR
            JSR   L780A
L6A3F       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   $1A
            STA   $09
L6A4A       LDA   $0666,X
            ORA   (zpHGR),Y
            AND   #$7F
            STA   (zpHGR),Y
            INX
            INY
            DEC   $09
            BNE   L6A4A
            STX   $03
            INC   $10
            DEC   $18
            BNE   L6A3F
            RTS

L6A62       STA   L55B1+1
            STY   L55B1+2
            JSR   L7D9A
            LDA   #$0A
            STA   $18
            JSR   calcXYHGR
            JSR   L780A
            LDA   #$03
            STA   $1A
            JMP   L55A6

L6A7C       LDA   $57
            BNE   L6AA7
            LDA   $55
            CMP   #$1A
            BCC   L6A88
            LDA   #$1A
L6A88       ASL
            ASL
            TAX
            LDA   L6AFE,X
            STA   $5C
            LDA   L6AFF,X
            STA   $5D
            LDA   L6B00,X
            STA   $5A
            LDA   L6B01,X
            STA   $5B
            LDA   #$60
            STA   $57
            LDA   #$01
            STA   $E7
L6AA7       LDA   $59
            CMP   #$01
            BNE   L6AFA
            LDA   $E7
            BEQ   L6AFA
            LDA   $5A
            BNE   L6AB7
            DEC   $5B
L6AB7       DEC   $5A
            CLC
            LDA   $5A
            ADC   $5B
            BNE   L6AC2
            BCC   L6AEB
L6AC2       LDA   $E7
            CMP   #$01
            BEQ   L6AE4
            LDA   #$91
            STA   $0E
            LDA   #$00
            STA   $0F
            STA   $05
            STA   $07
            LDA   #$68
            STA   $11
            JSR   L6D1E
            TAX
            LDA   L6CD4,X
            STA   $06
            JMP   L70F5

L6AE4       LDA   $5C
            LDY   $5D
            JMP   L6EDA

L6AEB       LDA   #$10
            STA   zpXCOL
            LDA   #$66
            STA   $10
            LDA   #$00
            STA   $E7
            JSR   L6978
L6AFA       RTS
L6AFB       JMP   L6AEB

L6AFE       DB    $00
L6AFF       DB    $00
L6B00       DB    $00
L6B01       DB    $00
            DB    $6E
            DB    $6B
            DB    $00
            DB    $01
            DB    $92
            DB    $6B
            DB    $00
            DB    $01
            DB    $B6
            DB    $6B
            DB    $00
            DB    $01
            DB    $B6
            DB    $6B
            DB    $00
            DB    $01
            DB    $DA
            DB    $6B
            DB    $20
            DB    $01
            DB    $DA
            DB    $6B
            DB    $20
            DB    $01
            DB    $FE
            DB    $6B
            DB    $30
            DB    $01
            DB    $FE
            DB    $6B
            DB    $30
            DB    $01
            DB    $22
            DB    $6C
            DB    $40
            DB    $01
            DB    $22
            DB    $6C
            DB    $40
            DB    $01
            DB    $46
            DB    $6C
            DB    $60
            DB    $01
            DB    $46
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $8E
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $55
            DB    $00
            DB    $00
            DB    $04
            DB    $02
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $90
            DB    $20
            DB    $85
            DB    $D4
            DB    $00
            DB    $95
            DB    $DC
            DB    $00
            DB    $97
            DB    $DD
            DB    $A2
            DB    $D7
            DB    $D5
            DB    $A2
            DB    $D5
            DB    $D4
            DB    $00
            DB    $95
            DB    $D4
            DB    $00
            DB    $95
            DB    $90
            DB    $00
            DB    $94
            DB    $00
            DB    $2A
            DB    $05
            DB    $10
            DB    $2A
            DB    $15
            DB    $40
            DB    $A4
            DB    $11
            DB    $40
            DB    $A2
            DB    $86
            DB    $50
            DB    $9A
            DB    $85
            DB    $00
            DB    $AE
            DB    $87
            DB    $00
            DB    $B2
            DB    $85
            DB    $00
            DB    $8A
            DB    $86
            DB    $00
            DB    $EC
            DB    $85
            DB    $00
            DB    $A8
            DB    $84
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $A0
            DB    $81
            DB    $00
            DB    $2A
            DB    $00
            DB    $40
            DB    $20
            DB    $00
            DB    $C0
            DB    $82
            DB    $00
            DB    $50
            DB    $0A
            DB    $00
            DB    $D4
            DB    $AE
            DB    $00
            DB    $54
            DB    $E3
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $54
            DB    $2A
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $50
            DB    $0A
            DB    $00
            DB    $C0
            DB    $82
            DB    $00
            DB    $40
            DB    $02
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $B8
            DB    $9D
            DB    $00
            DB    $D4
            DB    $AB
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $C8
            DB    $92
            DB    $00
            DB    $D0
            DB    $8A
            DB    $00
            DB    $90
            DB    $89
            DB    $00
            DB    $E0
            DB    $86
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $54
            DB    $0B
            DB    $00
            DB    $54
            DB    $0E
            DB    $00
            DB    $5C
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $B4
            DB    $00
            DB    $00
            DB    $92
            DB    $81
            DB    $00
            DB    $B2
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $92
            DB    $81
            DB    $00
            DB    $B8
            DB    $00
            DB    $00
            DB    $B8
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $E0
            DB    $81
            DB    $00
            DB    $E0
            DB    $81
            DB    $00
            DB    $F0
            DB    $82
            DB    $00
            DB    $F0
            DB    $82
            DB    $00
            DB    $F8
            DB    $86
            DB    $00
            DB    $E8
            DB    $87
            DB    $00
            DB    $EC
            DB    $8F
            DB    $00
            DB    $EE
            DB    $9F
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $B8
            DB    $81
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $81
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $80
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $81
            DB    $00
            DB    $F0
            DB    $00
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $4A
            DB    $04
            DB    $00
            DB    $2A
            DB    $05
            DB    $00
            DB    $6E
            DB    $05
            DB    $00
            DB    $2A
            DB    $1D
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $5B
            DB    $3B
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $5B
            DB    $3B
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L6CB2       LDX   $E8
            BNE   L6CD3
            JSR   L6D1E
            TAX
            CLC
            SED
            LDA   $53
            ADC   L6CD4,X
            STA   $53
            LDA   $54
            ADC   #$00
            STA   $54
            CLD
            JSR   L696A
            JSR   L7091
            JSR   L7C61
L6CD3       RTS

L6CD4       DB    $00
            DB    $01
            DB    $03
            DB    $05
            DB    $05
            DB    $07
            DB    $07
            DB    $10
            DB    $10
            DB    $20
            DB    $20
            DB    $30
            DB    $30
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50

*-----------------------------------
* PATIENTLY WAIT
*-----------------------------------

doWAIT      LDX   #$01
doWAIT2     LDA   #$8F
L6CEA       SEC
            SBC   #$01
            BCS   L6CEA
            DEX
            BNE   doWAIT2
            RTS
L6CF3       RTS

*-----------------------------------
* 
*-----------------------------------

L6CF4       JSR   L58FA
            JSR   L7D80
            JSR   L699E
            JSR   L7D80
            JSR   L79A4
            LDY   #$0B
L6D05       LDX   #$FF
            JSR   doWAIT2
            DEY
            BNE   L6D05
            JSR   playCARTOON
            INC   $55	; ZP next level?
            JSR   L531E
            JSR   prepareLEVEL
            JSR   L53E6
            JMP   L530F

L6D1E       LDA   $55
            CMP   #$0F
            BCC   L6D26
            LDA   #$0F
L6D26       RTS

L6D27       LDA   $55
            CMP   #$15
            BCC   L6D2F
            LDA   #$15
L6D2F       RTS

L6D30       LDA   $E0
            ASL
            TAX
            LDA   L6D3F,X
            STA   $70
            LDA   L6D40,X
            STA   $71
            RTS

L6D3F       DB    $00
L6D40       DB    $00
            DB    $8B
            DB    $55
            DB    $7F
            DB    $5D
            DB    $8B
            DB    $55
            DB    $99
            DB    $5D

*-----------------------------------
* 
*-----------------------------------

L6D49       LDA   #$00
            LDX   #$08
            STA   $84,X
            STA   $98,X
            STA   $AC,X
            STA   $C0,X
            STA   $78
            STA   $E4
            STA   $E9
            LDA   #$02
            STA   $68
            RTS

L6D60       LDX   $55
            CPX   #$15
            BCS   L6DA0
            LDA   #$04
            STA   $E0
L6D6A       JSR   L86FC
            LDA   $79
            BNE   L6D75
            LDA   #$01
            STA   $78
L6D75       JSR   L8712
            DEC   $E0
            BNE   L6D6A
            LDA   #$02
            STA   $68
            LDA   #$01
            STA   $E4
            JSR   L6D27
            ASL
            TAX
            LDA   L6DEF,X
            STA   $E1
            LDA   L6DEF+1,X
            STA   $E2
            LDA   #$04
            STA   $EA
            STA   $EB
            LDA   #$01
            STA   $E9
            JSR   L80C1
L6DA0       RTS

L6DA1       LDY   $77
            INY
            LDA   $E0
            CMP   #$01
            BEQ   L6DDE
            CMP   #$03
            BEQ   L6DDE
            LDA   #$01
            STA   ($75),Y
            INY
            LDA   #$00
            STA   ($75),Y
            INY
            LDA   $E0
            CMP   #$02
            BEQ   L6DC4
            LDA   #$03
            STA   ($75),Y
            BNE   L6DC8
L6DC4       LDA   #$02
            STA   ($75),Y
L6DC8       INY
            LDA   #$01
            STA   ($75),Y
            INY
            STA   ($75),Y
            INY
            LDA   #$03
            STA   ($75),Y
            INY
            LDA   #$FF
            STA   ($75),Y
            JSR   L8712
            RTS

L6DDE       LDA   #$00
            STA   ($75),Y
            INY
            LDA   #$01
            STA   ($75),Y
            INY
            LDA   #$00
            STA   ($75),Y
            BEQ   L6DC8
            RTS

L6DEF       DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $C0
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $01
            DB    $50
            DB    $00
            DB    $50
            DB    $00
            DB    $40
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $FF
            DB    $FF
            DB    $B0
            DB    $00
            DB    $10
            DB    $00
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $B0
            DB    $00
L6E19       DB    $40
L6E1A       DB    $00
            DB    $30
            DB    $00
            DB    $20
            DB    $00
            DB    $20
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $02
            DB    $00
            DB    $03
            DB    $02
            DB    $00
            DB    $03
            DB    $01
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $03
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $03
            DB    $03
            DB    $00
            DB    $00
            DB    $02
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $01
            DB    $03
            DB    $03
            DB    $02
            DB    $02
            DB    $01
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $03
            DB    $02
            DB    $01
            DB    $01
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $01
            DB    $03

L6E79       LDY   #$0E
L6E7B       LDA   L8A44,Y
            STA   $0800,Y
            DEY
            BPL   L6E7B
            LDY   #$00
            LDX   #$01
L6E88       LDA   #$00
            STA   $0A00,Y
            STA   $0900,X
            STA   $0B00,X
            INX
            INY
            LDA   #$01
            STA   $0A00,Y
            STA   $0900,X
            STA   $0B00,X
            INX
            INY
            BNE   L6E88
            RTS

L6EA5       LDA   $E0
            ASL
            TAX
            LDA   L8A3A,X
            STA   L6EB7+1
            LDA   L8A3B,X
            STA   L6EB7+2
            LDX   #$00
L6EB7       LDA   $0666,X
            STA   ($75),Y
            INY
            INX
            CPX   #$10
            BNE   L6EB7
            RTS

L6EC3       JSR   L6AFB
            JSR   L80E3
            LDA   #$01
            STA   $E8
            LDY   #$30
L6ECF       LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L6ECF
            JMP   L43D2

L6EDA       LDX   #$66
            STX   $10
            LDX   #$13
            STX   $04
L6EE2       STA   L6EFF+1
            STY   L6EFF+2
            LDA   #$0C
            STA   $18
            LDA   #$00
            STA   zpXBIT
L6EF0       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   #$03
            STA   $09
L6EFB       LDA   (zpHGR),Y
            AND   #$7F
L6EFF       ORA   $0666,X
            STA   (zpHGR),Y
            INX
            INY
            DEC   $09
            BNE   L6EFB
            STX   $03
            INC   $10
            DEC   $18
            BNE   L6EF0
            RTS

L6F13       LDA   $55
            CMP   #$1A
            BCC   L6F1B
            LDA   #$1A
L6F1B       ASL
            ASL
            TAX
            LDA   #$B0
            STA   $10
            LDA   #$21
            STA   zpXCOL
            LDA   L6AFE,X
            LDY   L6AFF,X
            JMP   L6EE2

*-----------------------------------
* SET THE HGR SCREEN
*-----------------------------------

setHGR      LDA   TXTCLR
            LDA   MIXCLR
            LDA   HIRES
            LDA   TXTPAGE1
            RTS

*-----------------------------------
* SET THE TEXT SCREEN
*-----------------------------------

setTEXT2    LDA   TXTSET
            LDA   TXTPAGE2
            LDA   MIXCLR
            RTS

*-----------------------------------
* CLEAR THE HGR SCREEN
*-----------------------------------

clearHGR    LDA   #>HGR
            STA   $17
            LDY   #<HGR
            STY   $16
L6F4E       LDA   #$80
L6F50       STA   ($16),Y
            INY
            BNE   L6F50
            INC   $16+1
            LDA   $16+1
            CMP   #>HGR2
            BNE   L6F4E
            RTS

*-----------------------------------
* GET INPUT FROM SELECTED DEVICE
*-----------------------------------

getINPUT    JSR   readKEYBOARD	; read keyboard
            BCS   L6F65
            STA   $63
L6F65       LDA   zpDEVICE	; which device?
            BNE   L6F6F
            JSR   readJOYPAD	; read joypad
            JMP   L6F72
L6F6F       JSR   readJOYSTICK	; read joystick
L6F72       BCS   L6F76
            STA   $63		; save movement
L6F76       RTS

*-----------------------------------
* READ KEYBOARD
*-----------------------------------

readKEYBOARD
            LDA   KBD
            BPL   L6FCE
            STA   KBDSTROBE

            CMP   #$93		; ctrl-s
            BNE   L6F96		; speaker or tape out
            LDA   L7BB5+1
            EOR   #$10
            STA   L7BB5+1
            LDA   L7D06+1
            EOR   #$10
            STA   L7D06+1
            JMP   L6FCE

L6F96       CMP   #$9B		; ESC
            BNE   L6FA2

L6F9A       LDA   KBD
            BPL   L6F9A
            STA   KBDSTROBE

L6FA2       LDX   $E8
            BEQ   L6FB1
            CMP   #" "
            BEQ   L6FAE
            CMP   #" "
            BNE   L6FCE
L6FAE       JMP   selectRANKCARTOON		; space resets the game

*  0: down
*  1: up
*  2: right
*  3: left

L6FB1       CMP   #$C1		; A
            BEQ   L6FCA
L6FB5       CMP   #$95		; right-arrow
            BEQ   L6FC7
L6FB9       CMP   #$88		; left-arrow
            BEQ   L6FC4
L6FBD       CMP   #$DA		; Z
            BNE   L6FCE
            LDA   #$00		; down
            HEX   2C
L6FC4       LDA   #$03		; up
            HEX   2C
L6FC7       LDA   #$02		; right
            HEX   2C
L6FCA       LDA   #$01		; left
            CLC
            RTS
L6FCE       SEC
            RTS

*-----------------------------------
* READ JOYPAD
*-----------------------------------

readJOYPAD
            LDA   $E8
            BNE   L700A
            LDA   #$00
            BIT   SETAN0
            BIT   SETAN1
            BIT   SETAN2
            LDX   BUTN0
            BPL   L6FE6
            ORA   #$04
L6FE6       BIT   CLRAN0
            LDX   BUTN0
            BPL   L6FF0
            ORA   #$08
L6FF0       BIT   CLRAN1
            LDX   BUTN0
            BPL   L6FFA
            ORA   #$02
L6FFA       BIT   SETAN0
            LDX   BUTN0
            BPL   L7004
            ORA   #$01
L7004       TAX
            LDA   L700E,X
            BPL   L700C
L700A       SEC
            RTS
L700C       CLC
            RTS

L700E       DB    $FF
            DB    $00	; down
            DB    $01	; up
            DB    $FF
            DB    $02	; right
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $03	; left
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF

*-----------------------------------
* GET JOYSTICK VALUES
*-----------------------------------

getLLJOYSTICK
            LDA   PTRIG
            SEC
            LDA   #$63
            LDX   #$00
            LDY   #$00
L7028       BIT   PADDL0
            BPL   L7030
            INX
            BNE   L7032
L7030       NOP
            NOP
L7032       BIT   PADDL1
            BPL   L703A
            INY
            BNE   L703C
L703A       NOP
            NOP
L703C       SBC   #$01
            BNE   L7028
            RTS

*-----------------------------------
* READ JOYSTICK
*-----------------------------------

readJOYSTICK
            LDA   $E8
            BNE   L708D
            JSR   getLLJOYSTICK		; read joystick
            LDA   $62
            LSR
            BNE   L7065
            BCS   L705E
            CPY   #$1C
            BCC   L7081
L7053       CPX   #$1C
            BCC   L7089
            CPX   #$44
            BCS   L7085
            LDA   #$80
            RTS

L705E       CPY   #$44
            BCS   L707D
            JMP   L7053

L7065       BCS   L7076
            CPX   #$1C
            BCC   L7089
L706B       CPY   #$1C
            BCC   L7081
            CPY   #$44
            BCS   L707D
            LDA   #$80
            RTS

L7076       CPX   #$44
            BCS   L7085
            JMP   L706B

*  0: down
*  1: up
*  2: right
*  3: left
* 80: none

L707D       CLC
            LDA   #$00
            RTS
L7081       CLC
            LDA   #$01
            RTS
L7085       CLC
            LDA   #$02
            RTS
L7089       CLC
            LDA   #$03
            RTS
L708D       CLC
            LDA   #$80
            RTS

*-----------------------------------
* 
*-----------------------------------

L7091       LDA   $54
            CMP   $02
            BEQ   L709B
            BCC   L70CC
            BCS   L70AB
L709B       LDA   $53
            CMP   $01
            BEQ   L70A5
            BCC   L70CC
            BCS   L70AB
L70A5       LDA   $52
            CMP   $00
            BCC   L70CC
L70AB       LDA   $52
            STA   $00
            STA   $05
            LDA   $53
            STA   $01
            STA   $06
            LDA   $54
            STA   $02
            STA   $07
            LDA   $50
            STA   $F0
            LDA   #$00
            STA   $50
            JSR   L70D8
            LDA   $F0
            STA   $50
L70CC       LDA   $52
            STA   $05
            LDA   $53
            STA   $06
            LDA   $54
            STA   $07
L70D8       JSR   L696A
            LDA   $50
            ASL
            ASL
            TAX
            LDA   L7141,X
            STA   $0E
            LDA   L7142,X
            STA   $0F
            LDA   L7143,X
            STA   $11
            JSR   L70F5
            JMP   L7124

L70F5       LDA   #$00
            LDY   #$04
L70F9       CLC
            ROR   $07
            ROR   $06
            ROR   $05
            ROR
            DEY
            BNE   L70F9
            CLC
            ROR
            ROR
            ROR
            ROR
            JSR   L7159
            SEC
            LDA   $0E
            SBC   #$06
            STA   $0E
            BCS   L7117
            DEC   $0F
L7117       LDA   $07
            BNE   L70F5
            LDA   $06
            BNE   L70F5
            LDA   $05
            BNE   L70F5
            RTS

L7124       LDA   $50
            BEQ   L7140
            BIT   $58
            BPL   L7140
            LDA   $54
            CMP   #$01
            BCC   L7140
            JSR   L7C51
            INC   $58
            LDA   $58
            AND   #$7F
            STA   $58
            JSR   L56CF
L7140       RTS

L7141       DB    $28
L7142       DB    $00
L7143       DB    $5E
            DB    $00
            DB    $28
            DB    $00
            DB    $10
            DB    $00
            DB    $0A
            DB    $01
            DB    $10
            DB    $00
            DB    $28
            DB    $00
            DB    $33
            DB    $00
            DB    $0A
            DB    $01
            DB    $33
            DB    $00
            DB    $0A
            DB    $01
            DB    $5E
            DB    $00

L7159       ASL
            TAX
            LDA   L717D,X
            STA   L6950+1
            STA   L6959+1
            LDA   L717D+1,X
            STA   L6950+2
            STA   L6959+2
            LDA   $0E
            STA   $0C
            LDA   $0F
            STA   $0D
            LDA   $11
            STA   $10
            JSR   L693A
            RTS

L717D       DA    L7191
            DA    L7201
            DA    L7271
            DA    L72E1
            DA    L7351
            DA    L73C1
            DA    L7431
            DA    L74A1
            DA    L7511
            DA    L7581
L7191       HEX   8E80918091809180918091808E808080
            HEX   9C80A280A280A280A280A2809C808080
            HEX   B880C480C480C480C480C480B8808080
            HEX   F08088818881888188818881F0808080
            HEX   E08190829082908290829082E0818080
            HEX   C083A084A084A084A084A084C0838080
            HEX   8087C088C088C088C088C08880878080
L7201       HEX   8480868084808480848084808E808080
            HEX   88808C8088808880888088809C808080
            HEX   908098809080908090809080B8808080
            HEX   A080B080A080A080A080A080F0808080
            HEX   C080E080C080C080C080C080E0818080
            HEX   8081C0818081808180818081C0838080
            HEX   80828083808280828082808280878080
L7271       HEX   8E80918090808C80828081809F808080
            HEX   9C80A280A080988084808280BE808080
            HEX   B880C480C080B08088808480FC808080
            HEX   F08088818081E08090808880F8818080
            HEX   E08190828082C081A0809080F0838080
            HEX   C083A08480848083C080A080E0878080
            HEX   8087C088808880868081C080C08F8080
L72E1       HEX   9F80908088808C80908091808E808080
            HEX   BE80A08090809880A080A2809C808080
            HEX   FC80C080A080B080C080C480B8808080
            HEX   F8818081C080E08080818881F0808080
            HEX   F08380828081C08180829082E0818080
            HEX   E0878084808280838084A084C0838080
            HEX   C08F8088808480868088C08880878080
L7351       HEX   8C808A8089809F808880888088808080
            HEX   988094809280BE809080908090808080
            HEX   B080A880A480FC80A080A080A0808080
            HEX   E080D080C880F881C080C080C0808080
            HEX   C081A0819081F0838081808180818080
            HEX   8083C082A082E0878082808280828080
            HEX   80868085C084C08F8084808480848080
L73C1       HEX   9F8081808E809080908091808E808080
            HEX   BE8082809C80A080A080A2809C808080
            HEX   FC808480B880C080C080C480B8808080
            HEX   F8818880F080808180818881F0808080
            HEX   F0839080E081808280829082E0818080
            HEX   E087A080C08380848084A084C0838080
            HEX   C08FC080808780888088C08880878080
L7431       HEX   9C80828081808F80918091808E808080
            HEX   B880848082809E80A280A2809C808080
            HEX   F08088808480BC80C480C480B8808080
            HEX   E08190808880F88088818881F0808080
            HEX   C083A0809080F08190829082E0818080
            HEX   8087C080A080E083A084A084C0838080
            HEX   808E8081C080C087C088C08880878080
L74A1       HEX   9F809080888084808280828082808080
            HEX   BE80A080908088808480848084808080
            HEX   FC80C080A08090808880888088808080
            HEX   F8818081C080A0809080908090808080
            HEX   F08380828081C080A080A080A0808080
            HEX   E087808480828081C080C080C0808080
            HEX   C08F8088808480828081808180818080
L7511       HEX   8E80918091808E80918091808E808080
            HEX   9C80A280A2809C80A280A2809C808080
            HEX   B880C480C480B880C480C480B8808080
            HEX   F08088818881F08088818881F0808080
            HEX   E08190829082E08190829082E0818080
            HEX   C083A084A084C083A084A084C0838080
            HEX   8087C088C0888087C088C08880878080
L7581       HEX   8E80918091809E809080888087808080
            HEX   9C80A280A280BC80A08090808E808080
            HEX   B880C480C480F880C080A0809C808080
            HEX   F08088818881F0818081C080B8808080
            HEX   E08190829082E08380828081F0808080
            HEX   C083A084A084C08780848082E0818080
            HEX   8087C088C088808F80888084C0838080
L75F1       STA   $16
            LDA   #$76
            STA   $17
            LDA   $16
            ASL
            ASL
            ASL
            BCC   L7600
            INC   $17
L7600       CLC
            ADC   #$0A
            STA   $16
            BCC   L7609
            INC   $17
L7609       RTS

            DB    $41
            DB    $0B
            DB    $06
            DB    $FF
            DB    $01
            DB    $FF
            DB    $00
            DB    $00
            DB    $5F
            DB    $0B
            DB    $07
            DB    $FF
            DB    $02
            DB    $00
            DB    $66
            DB    $66
            DB    $83
            DB    $0B
            DB    $09
            DB    $FF
            DB    $FF
            DB    $01
            DB    $11
            DB    $11
            DB    $95
            DB    $0B
            DB    $0A
            DB    $FF
            DB    $04
            DB    $FF
            DB    $00
            DB    $00
            DB    $B9
            DB    $0B
            DB    $0C
            DB    $FF
            DB    $05
            DB    $03
            DB    $66
            DB    $66
            DB    $D7
            DB    $0B
            DB    $0D
            DB    $FF
            DB    $FF
            DB    $04
            DB    $11
            DB    $11
            DB    $41
            DB    $23
            DB    $0E
            DB    $00
            DB    $07
            DB    $FF
            DB    $88
            DB    $88
            DB    $5F
            DB    $23
            DB    $0F
            DB    $01
            DB    $08
            DB    $06
            DB    $99
            DB    $99
            DB    $71
            DB    $23
            DB    $10
            DB    $FF
            DB    $09
            DB    $07
            DB    $66
            DB    $66
            DB    $83
            DB    $23
            DB    $FF
            DB    $02
            DB    $0A
            DB    $08
            DB    $55
            DB    $55
            DB    $95
            DB    $23
            DB    $FF
            DB    $03
            DB    $0B
            DB    $09
            DB    $55
            DB    $55
            DB    $A7
            DB    $23
            DB    $13
            DB    $FF
            DB    $0C
            DB    $0A
            DB    $66
            DB    $66
            DB    $B9
            DB    $23
            DB    $14
            DB    $04
            DB    $0D
            DB    $0B
            DB    $99
            DB    $99
            DB    $D7
            DB    $23
            DB    $15
            DB    $05
            DB    $FF
            DB    $0C
            DB    $77
            DB    $77
            DB    $41
            DB    $35
            DB    $FF
            DB    $06
            DB    $0F
            DB    $FF
            DB    $22
            DB    $22
            DB    $5F
            DB    $35
            DB    $1A
            DB    $07
            DB    $FF
            DB    $0E
            DB    $77
            DB    $77
            DB    $71
            DB    $35
            DB    $FF
            DB    $08
            DB    $11
            DB    $FF
            DB    $22
            DB    $22
            DB    $83
            DB    $35
            DB    $17
            DB    $FF
            DB    $FF
            DB    $10
            DB    $11
            DB    $11
            DB    $95
            DB    $35
            DB    $18
            DB    $FF
            DB    $13
            DB    $FF
            DB    $00
            DB    $00
            DB    $A7
            DB    $35
            DB    $FF
            DB    $0B
            DB    $FF
            DB    $12
            DB    $33
            DB    $33
            DB    $B9
            DB    $35
            DB    $1D
            DB    $0C
            DB    $15
            DB    $FF
            DB    $88
            DB    $88
            DB    $D7
            DB    $35
            DB    $FF
            DB    $0D
            DB    $FF
            DB    $14
            DB    $33
            DB    $33
            DB    $71
            DB    $47
            DB    $1B
            DB    $FF
            DB    $17
            DB    $FF
            DB    $00
            DB    $00
            DB    $83
            DB    $47
            DB    $FF
            DB    $11
            DB    $18
            DB    $16
            DB    $44
            DB    $44
            DB    $95
            DB    $47
            DB    $FF
            DB    $12
            DB    $19
            DB    $17
            DB    $44
            DB    $44
            DB    $A7
            DB    $47
            DB    $1C
            DB    $FF
            DB    $FF
            DB    $18
            DB    $11
            DB    $11
            DB    $5F
            DB    $59
            DB    $21
            DB    $0F
            DB    $1B
            DB    $1D
            DB    $99
            DB    $99
            DB    $71
            DB    $59
            DB    $1E
            DB    $16
            DB    $FF
            DB    $1A
            DB    $77
            DB    $77
            DB    $A7
            DB    $59
            DB    $1F
            DB    $19
            DB    $1D
            DB    $FF
            DB    $88
            DB    $88
            DB    $B9
            DB    $59
            DB    $26
            DB    $14
            DB    $1A
            DB    $1C
            DB    $99
            DB    $99
            DB    $71
            DB    $6B
            DB    $22
            DB    $1B
            DB    $1F
            DB    $FF
            DB    $88
            DB    $88
            DB    $A7
            DB    $6B
            DB    $25
            DB    $1C
            DB    $FF
            DB    $1E
            DB    $77
            DB    $77
            DB    $41
            DB    $7D
            DB    $28
            DB    $FF
            DB    $21
            DB    $FF
            DB    $00
            DB    $00
            DB    $5F
            DB    $7D
            DB    $2A
            DB    $1A
            DB    $22
            DB    $20
            DB    $99
            DB    $99
            DB    $71
            DB    $7D
            DB    $FF
            DB    $1E
            DB    $23
            DB    $21
            DB    $55
            DB    $55
            DB    $83
            DB    $7D
            DB    $2C
            DB    $FF
            DB    $FF
            DB    $22
            DB    $11
            DB    $11
            DB    $95
            DB    $7D
            DB    $2D
            DB    $FF
            DB    $25
            DB    $FF
            DB    $00
            DB    $00
            DB    $A7
            DB    $7D
            DB    $FF
            DB    $1F
            DB    $26
            DB    $24
            DB    $55
            DB    $55
            DB    $B9
            DB    $7D
            DB    $2F
            DB    $1D
            DB    $27
            DB    $25
            DB    $99
            DB    $99
            DB    $D7
            DB    $7D
            DB    $31
            DB    $FF
            DB    $FF
            DB    $26
            DB    $11
            DB    $11
            DB    $41
            DB    $8F
            DB    $FF
            DB    $20
            DB    $29
            DB    $FF
            DB    $22
            DB    $22
            DB    $4D
            DB    $8F
            DB    $33
            DB    $FF
            DB    $FF
            DB    $28
            DB    $11
            DB    $11
            DB    $5F
            DB    $8F
            DB    $34
            DB    $21
            DB    $2B
            DB    $FF
            DB    $88
            DB    $88
            DB    $71
            DB    $8F
            DB    $35
            DB    $FF
            DB    $2C
            DB    $2A
            DB    $66
            DB    $66
            DB    $83
            DB    $8F
            DB    $FF
            DB    $23
            DB    $2D
            DB    $2B
            DB    $55
            DB    $55
            DB    $95
            DB    $8F
            DB    $FF
            DB    $24
            DB    $2E
            DB    $2C
            DB    $55
            DB    $55
            DB    $A7
            DB    $8F
            DB    $38
            DB    $FF
            DB    $2F
            DB    $2D
            DB    $66
            DB    $66
            DB    $B9
            DB    $8F
            DB    $39
            DB    $26
            DB    $FF
            DB    $2E
            DB    $77
            DB    $77
            DB    $CB
            DB    $8F
            DB    $3A
            DB    $FF
            DB    $31
            DB    $FF
            DB    $00
            DB    $00
            DB    $D7
            DB    $8F
            DB    $FF
            DB    $27
            DB    $FF
            DB    $30
            DB    $33
            DB    $33
            DB    $41
            DB    $A1
            DB    $3C
            DB    $FF
            DB    $33
            DB    $FF
            DB    $00
            DB    $00
            DB    $4D
            DB    $A1
            DB    $FF
            DB    $29
            DB    $34
            DB    $32
            DB    $55
            DB    $55
            DB    $5F
            DB    $A1
            DB    $FF
            DB    $2A
            DB    $FF
            DB    $33
            DB    $33
            DB    $33
            DB    $71
            DB    $A1
            DB    $FF
            DB    $2B
            DB    $36
            DB    $FF
            DB    $22
            DB    $22
            DB    $83
            DB    $A1
            DB    $3D
            DB    $FF
            DB    $FF
            DB    $35
            DB    $11
            DB    $11
            DB    $95
            DB    $A1
            DB    $3E
            DB    $FF
            DB    $38
            DB    $FF
            DB    $00
            DB    $00
            DB    $A7
            DB    $A1
            DB    $FF
            DB    $2E
            DB    $FF
            DB    $37
            DB    $33
            DB    $33
            DB    $B9
            DB    $A1
            DB    $FF
            DB    $2F
            DB    $3A
            DB    $FF
            DB    $22
            DB    $22
            DB    $CB
            DB    $A1
            DB    $FF
            DB    $30
            DB    $3B
            DB    $39
            DB    $55
            DB    $55
            DB    $D7
            DB    $A1
            DB    $3F
            DB    $FF
            DB    $FF
            DB    $3A
            DB    $11
            DB    $11
            DB    $41
            DB    $B3
            DB    $FF
            DB    $32
            DB    $3D
            DB    $FF
            DB    $22
            DB    $22
            DB    $83
            DB    $B3
            DB    $FF
            DB    $36
            DB    $3E
            DB    $3C
            DB    $55
            DB    $55
            DB    $95
            DB    $B3
            DB    $FF
            DB    $37
            DB    $3F
            DB    $3D
            DB    $55
            DB    $55
            DB    $D7
            DB    $B3
            DB    $FF
            DB    $3B
            DB    $FF
            DB    $3E
            DB    $33
            DB    $33
L780A       LDX   zpXBIT
            LDA   L7812,X
            STA   zpXBIT
            RTS

L7812       DB    $00
            DB    $1E
            DB    $3C
            DB    $5A
            DB    $78
            DB    $96
            DB    $B4
L7819       LDA   #$F8
            STA   $18
            JSR   calcXYHGR
            ASL   $03
L7822       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   L7843,X
            AND   (zpHGR),Y
            ORA   #$80
            STA   (zpHGR),Y
            INY
            LDA   L7844,X
            AND   (zpHGR),Y
            ORA   #$80
            STA   (zpHGR),Y
            INC   $10
            INC   $18
            BNE   L7822
            RTS
L7843       DB    $40
L7844       DB    $7F
            DB    $01
            DB    $7F
            DB    $03
            DB    $7E
            DB    $07
            DB    $7C
            DB    $0F
            DB    $78
            DB    $1F
            DB    $70
            DB    $3F
            DB    $60
L7851       DB    $09
            DB    $09
            DB    $08
            DB    $07
            DB    $07
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $05
            DB    $05
            DB    $05
            DB    $05
            DB    $04
            DB    $04
            DB    $04
L7861       LDA   zpDEVICE
            BNE   L7868
            JSR   getINPUT
L7868       DEC   $59
            BEQ   L786D
            RTS

L786D       LDA   zpDEVICE
            BEQ   L7874
            JSR   getINPUT
L7874       JSR   L808C
            JSR   L6D1E
            TAX
            LDA   L7851,X
            CLC
            LDX   #$08
            LDY   $98,X
            BEQ   L7887
            ADC   #$01
L7887       LDY   $C0,X
            BEQ   L788D
            ADC   #$01
L788D       SEC
            INX
            LDY   $84,X
            BEQ   L7895
            SBC   #$01
L7895       LDY   $AC,X
            BEQ   L789B
            SBC   #$01
L789B       STA   $59
            LDA   $F3
            BEQ   L78A5
            DEC   $F3
            INC   $59
L78A5       LDA   $64
            TAX
            JSR   L75F1
            LDY   #$00
            LDA   ($16),Y
            CMP   $60
            BNE   L78BA
            INY
            LDA   ($16),Y
            CMP   $61
            BEQ   L78D1
L78BA       LDA   $65
            BMI   L78D7
            TAX
            JSR   L75F1
            LDY   #$00
            LDA   ($16),Y
            CMP   $60
            BNE   L78CF
            INY
            LDA   ($16),Y
            CMP   $61
L78CF       BNE   L794B
L78D1       STX   $64
            LDA   #$FF
            STA   $65
L78D7       LDA   $E8
            BEQ   L78E7
            INC   $1B
            BNE   L78E1
            INC   $1C
L78E1       LDY   #$00
            LDA   ($1B),Y
            STA   $63
L78E7       LDY   $63
            BMI   L78FD
            INY
            INY
            LDA   ($16),Y
            BPL   L78F9
            LDY   $62
            INY
            INY
            LDA   ($16),Y
            BPL   L7915
L78F9       LDA   $63
            STA   $62
L78FD       LDY   $62
            INY
            INY
            LDA   ($16),Y
            BPL   L7915
            JSR   L7D80
            JSR   L699E
            LDA   #$02
            STA   $66
            JSR   L7D80
            JMP   L79A4

L7915       STA   $65
            LDA   $64
            CMP   #$1A
            BEQ   L793B
            CMP   #$1D
            BNE   L795B
            LDA   #$15
            STA   $6A
            LDA   #$00
            STA   $6C
            LDA   $62
            CMP   #$02
            BNE   L7935
L792F       LDA   #$01
            STA   $69
            BNE   L795B
L7935       LDA   #$00
            STA   $69
            BEQ   L795B
L793B       LDA   #$06
            STA   $6A
            LDA   #$00
            STA   $6C
            LDA   $62
            CMP   #$03
            BNE   L7935
            BEQ   L792F
L794B       LDA   $63
            BMI   L795B
            EOR   $62
            CLC
            ROR
            BNE   L795B
            BCC   L795B
            LDA   $63
            STA   $62
L795B       LDA   $69
            BEQ   L7962
            JMP   L7B2F

L7962       JSR   L7D80
            JSR   L699E
            CLC
            LDA   $62
            ROR
            BNE   L797A
            LDA   $61
            BCS   L7976
            ADC   #$02
            BCC   L7988
L7976       SBC   #$02
            BCS   L7988
L797A       LDA   $60
            BCS   L7982
            ADC   #$02
            BCC   L7984
L7982       SBC   #$02
L7984       STA   $60
            LDA   $61
L7988       STA   $61
            STA   $10
            LDA   $60
            STA   $0C
            INC   $66
            INC   $1F
            LDA   $1F
            CMP   #$FB
            BNE   L799E
            LDA   #$00
            STA   $1F
L799E       JSR   L79A4
            JMP   L79CD

L79A4       LDA   $66
            AND   #$0F
            STA   $66
            AND   #$03
            BEQ   L79BE
            CMP   #$03
            BNE   L79B4
            LDA   #$01
L79B4       ROR
            LDA   $62
            BCS   L79BC
            ADC   #$04
            SEC
L79BC       ADC   #$00
L79BE       ASL
            TAX
            LDA   #$80
            STA   $1E
            LDA   L96E8,X
            LDY   L96E8+1,X
            JMP   L6A20

L79CD       LDA   $61
            CMP   #$6B
            BNE   L79FD
            LDA   $60
            CMP   #$8A
            BCC   L79FD
            CMP   #$8E
            BCS   L79FD
            LDA   $E7
            CMP   #$01
            BNE   L79FD
            LDA   #$30
            STA   $5A
            LDA   #$00
            STA   $5B
            LDA   #$02
            STA   $E7
            LDA   #$10
            STA   zpXCOL
            LDA   #$66
            STA   $10
            JSR   L6978
            JSR   L6CB2
L79FD       CLC
            LDA   $62
            ROR
            BEQ   L7A31
            LDA   $6C
            BCS   L7A1F
            ADC   #$02
            CMP   #$06
            BNE   L7A11
            LDA   #$00
            INC   $6A
L7A11       STA   $6C
            CMP   #$02
            BNE   L7A1E
            INC   $6A
            JSR   L7A5F
            DEC   $6A
L7A1E       RTS

L7A1F       SBC   #$02
            CMP   #$FE
            BNE   L7A29
            LDA   #$04
            DEC   $6A
L7A29       STA   $6C
            CMP   #$04
            BNE   L7A1E
            BEQ   L7A5F
L7A31       LDA   $6D
            BCS   L7A4D
            ADC   #$02
            CMP   #$06
            BNE   L7A3F
            LDA   #$00
            INC   $6B
L7A3F       STA   $6D
            CMP   #$02
            BNE   L7A1E
            INC   $6B
            JSR   L7A5F
            DEC   $6B
            RTS

L7A4D       SBC   #$02
            CMP   #$FE
            BNE   L7A57
            LDA   #$04
            DEC   $6B
L7A57       STA   $6D
            CMP   #$04
            BNE   L7A1E
            BEQ   L7A5F
L7A5F       JSR   L7A6B
            LDY   #$00
            LDA   ($16),Y
            BEQ   L7A1E
            JMP   L7AAC

L7A6B       LDA   #$62
            STA   $17
            LDA   $6A
            ASL
            ASL
            ASL
            ASL
            BCC   L7A7B
            INC   $17
            INC   $17
L7A7B       ASL
            BCC   L7A80
            INC   $17
L7A80       CLC
            ADC   $6B
            ADC   #$3A
            BCC   L7A89
            INC   $17
L7A89       STA   $16
            RTS

L7A8C       DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L7A9C       DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L7AAC       CLC
            JSR   L6D1E
            TAX
            LDA   L7A8C,X
            ADC   $59
            STA   $59
            LDA   L7A9C,X
            STA   $F3
            LDA   ($16),Y
            LDX   $E8
            BNE   L7B1F
            CLC
            ROR
            BEQ   L7AF4
            JSR   L7C45
            LDA   $16
            PHA
            LDA   $17
            PHA
            JSR   L5743
            PLA
            STA   $17
            PLA
            STA   $16
            CLC
            SED
            LDA   $52
            ADC   #$50
            STA   $52
            LDA   $53
            ADC   #$00
            STA   $53
            LDA   $54
            ADC   #$00
            STA   $54
            CLD
            JSR   L6D60
            CLC
            BCC   L7B0C
L7AF4       CLC
            SED
            LDA   $52
            ADC   #$10
            STA   $52
            LDA   $53
            ADC   #$00
            STA   $53
            LDA   $54
            ADC   #$00
            STA   $54
            CLD
            JSR   L7BDC
L7B0C       LDA   #$00
            LDY   #$00
            STA   ($16),Y
            JSR   L7091
            DEC   $57
            DEC   $56
            BNE   L7B1E
            JMP   L6CF4
L7B1E       RTS

L7B1F       CLC
            ROR
            BEQ   L7B26
            JSR   L6D60
L7B26       LDA   #$00
            LDY   #$00
            STA   ($16),Y
            DEC   $56
            RTS

L7B2F       JSR   L7D80
            JSR   L699E
            LDA   $64
            CMP   #$1A
            BEQ   L7B79
            LDA   $62
            ROR
            BCC   L7B54
            LDA   $60
            SBC   #$02
            STA   $60
            STA   $0C
L7B48       LDA   $61
            STA   $10
            INC   $66
            JSR   L79A4
            JMP   L79FD

L7B54       CLC
            LDA   $60
            ADC   #$02
            STA   $60
            STA   $0C
            CMP   #$DD
            BNE   L7B48
            LDA   $65
            STA   $64
            LDA   #$1D
            STA   $65
            LDA   #$3D
            STA   $60
            STA   $0C
            LDA   #$00
            STA   $6A
            LDA   #$00
            STA   $6C
            BEQ   L7B48
L7B79       LDA   $62
            ROR
            BCS   L7B88
            LDA   $60
            ADC   #$02
            STA   $60
            STA   $0C
            BNE   L7B48
L7B88       LDA   $60
            SBC   #$02
            STA   $60
            STA   $0C
            CMP   #$3B
            BNE   L7B48
            LDA   $65
            STA   $64
            LDA   #$1A
            STA   $65
            LDA   #$DB
            STA   $60
            STA   $0C
            LDA   #$1C
            STA   $6A
            LDA   #$00
            STA   $6C
            BEQ   L7B48
L7BAC       LDX   #$04
L7BAE       LDY   $05
L7BB0       DEY
            INY
            DEY
            BNE   L7BB0
L7BB5       BIT   SPKR
            DEX
            BNE   L7BAE
            RTS

L7BBC       STA   L7BCD+1
            STY   L7BCD+2
            LDA   $E8
            BEQ   L7BC7
            RTS

L7BC7       LDY   #$00
            STY   $06
L7BCB       LDY   $06
L7BCD       LDA   $0666,Y
            BEQ   L7BDB
            STA   $05
            JSR   L7BAC
            INC   $06
            BNE   L7BCB
L7BDB       RTS

L7BDC       LDA   #<L7BE3
            LDY   #>L7BE3
            JMP   L7BBC

L7BE3       DB    $30
            DB    $1C
            DB    $00

L7BE6       LDA   #<L7BED
            LDY   #>L7BED
            JMP   L7BBC

L7BED       DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $49
            DB    $49
            DB    $49
            DB    $48
            DB    $48
            DB    $48
            DB    $47
            DB    $47
            DB    $47
            DB    $46
            DB    $46
            DB    $46
            DB    $45
            DB    $45
            DB    $45
            DB    $44
            DB    $44
            DB    $44
            DB    $43
            DB    $43
            DB    $43
            DB    $42
            DB    $42
            DB    $42
            DB    $41
            DB    $41
            DB    $41
            DB    $40
            DB    $40
            DB    $40
            DB    $40
            DB    $40
            DB    $40
            DB    $39
            DB    $39
            DB    $39
            DB    $38
            DB    $38
            DB    $38
            DB    $37
            DB    $37
            DB    $37
            DB    $36
            DB    $36
            DB    $36
            DB    $35
            DB    $35
            DB    $35
            DB    $34
            DB    $34
            DB    $34
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $28
            DB    $28
            DB    $27
            DB    $27
            DB    $26
            DB    $26
            DB    $25
            DB    $25
            DB    $24
            DB    $24
            DB    $23
            DB    $23
            DB    $23
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $00

L7C45       LDA   #<L7C4C
            LDY   #>L7C4C
            JMP   L7BBC

L7C4C       DB    $40
            DB    $40
            DB    $40
            DB    $30
            DB    $00

L7C51       LDY   #$50
            STY   $06
L7C55       LDA   #$20
            STA   $05
            JSR   L7BAC
            DEC   $06
            BNE   L7C55
            RTS

L7C61       LDA   #<L7C68
            LDY   #>L7C68
            JMP   L7BBC

L7C68       DB    $70
            DB    $70
            DB    $70
            DB    $70
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $00

*-----------------------------------
* PLAY HIGHER BEEPS
*-----------------------------------

L7C82       LDA   $0A
            ASL
            TAX
            LDA   L7C8F,X
            LDY   L7C8F+1,X
            JMP   L7BBC

L7C8F       DA    $0000
            DA    L7CE4
            DA    L7CD7
            DA    L7CCA
            DA    L7CBD
            DA    L7CB0
            DA    L7C9D

L7C9D       DB    $20
            DB    $20
            DB    $20
            DB    $19
            DB    $19
            DB    $20
            DB    $20
            DB    $19
            DB    $19
            DB    $16
            DB    $16
            DB    $16
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $12
            DB    $12
            DB    $00
L7CB0       DB    $20
            DB    $20
            DB    $22
            DB    $24
            DB    $25
            DB    $28
            DB    $29
            DB    $2A
            DB    $2C
            DB    $2D
            DB    $2D
            DB    $2E
            DB    $00
L7CBD       DB    $28
            DB    $28
            DB    $2A
            DB    $2A
            DB    $2B
            DB    $2F
            DB    $2F
            DB    $30
            DB    $34
            DB    $35
            DB    $39
            DB    $39
            DB    $00
L7CCA       DB    $30
            DB    $39
            DB    $36
            DB    $36
            DB    $39
            DB    $40
            DB    $42
            DB    $43
            DB    $43
            DB    $43
            DB    $44
            DB    $47
            DB    $00
L7CD7       DB    $40
            DB    $40
            DB    $42
            DB    $43
            DB    $43
            DB    $44
            DB    $46
            DB    $48
            DB    $48
            DB    $48
            DB    $49
            DB    $49
            DB    $00
L7CE4       DB    $10
            DB    $10
            DB    $08
            DB    $07
            DB    $07
            DB    $09
            DB    $20
            DB    $07
            DB    $06
            DB    $03
            DB    $03
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L7CF0       LDA   #<L7C9D
            LDY   #>L7C9D
            JMP   L7BBC

L7CF7       LDX   #$04
L7CF9       LDY   $05
L7CFB       DEY
            INY
            PHA
            PLA
            PHA
            PLA
            PHA
            PLA
            DEY
            BNE   L7CFB
L7D06       BIT   SPKR
            DEX
            BNE   L7CF9
            RTS

L7D0D       STA   $14
            STY   $14+1
            LDA   #$00
            STA   $06
L7D15       LDY   $06
            LDA   ($14),Y
            BEQ   L7D32
            STA   $05		; height
            INY
            LDA   ($14),Y
            STA   L7CF7+1	; duration
            JSR   L7CF7
            JSR   getINPUT
            JSR   L7D7B
            INC   $06
            INC   $06
            BNE   L7D15
L7D32       LDA   #$04
            STA   L7CF7+1
            RTS

*-----------------------------------
* PLAY INTRO MUSIC
*-----------------------------------

playINTROMUSIC
            LDA   #<L7D3F
            LDY   #>L7D3F
            JMP   L7D0D

L7D3F       DB    $41
            DB    $60
            DB    $41
            DB    $30
            DB    $41
            DB    $20
            DB    $49
            DB    $24
            DB    $57
            DB    $26
            DB    $41
            DB    $60
            DB    $37
            DB    $A0
            DB    $41
            DB    $60
            DB    $41
            DB    $30
            DB    $41
            DB    $20
            DB    $49
            DB    $24
            DB    $57
            DB    $26
            DB    $41
            DB    $60
            DB    $49
            DB    $70
            DB    $41
            DB    $60
            DB    $41
            DB    $30
            DB    $41
            DB    $20
            DB    $49
            DB    $24
            DB    $57
            DB    $26
            DB    $41
            DB    $60
            DB    $39
            DB    $80
            DB    $39
            DB    $20
            DB    $31
            DB    $24
            DB    $2E
            DB    $A0
            DB    $31
            DB    $90
            DB    $39
            DB    $60
            DB    $41
            DB    $30
            DB    $34
            DB    $80
            DB    $41
            DB    $82
            DB    $00
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L7D7B       LDX   #$1E
            JMP   doWAIT2

L7D80       LDA   $60
            STA   $0C
            LDA   $61
            STA   $10
            LDA   #$00
            STA   $0D
            RTS

L7D8D       LDA   $70
            STA   $0C
            LDA   $71
            STA   $10
            LDA   #$00
            STA   $0D
            RTS

L7D9A       SEC
            LDA   $0C
            SBC   #$04
            STA   $0C
            SEC
            LDA   $10
            SBC   #$04
            STA   $10
            RTS

L7DA9       SEC
            LDA   $0C
            SBC   #$05
            STA   $0C
            SEC
            LDA   $10
            SBC   #$04
            STA   $10
            RTS

L7DB8       LDA   $68
            CMP   #$02
            BEQ   L7DCC
            CMP   #$04
            BEQ   L7DD2
            CMP   #$08
            BEQ   L7DD8
            LDA   #$21
            LDY   #$80
            BNE   L7DDC
L7DCC       LDA   #<L7FC7
            LDY   #>L7FC7
            BNE   L7DDC
L7DD2       LDA   #<L7FE5
            LDY   #>L7FE5
            BNE   L7DDC
L7DD8       LDA   #<L8003
            LDY   #>L8003
L7DDC       STA   $16
            STY   $17
            JSR   L7D80
            JSR   L699E
            JSR   L7D8D
            JSR   L699E
            JSR   L7D8D
            JSR   L7E1F
            LDA   $E8
            BNE   L7E0E
            JSR   L805D
            JSR   L805D
            JSR   L7BE6
            JSR   L805D
            JSR   L805D
            JSR   L805D
            JSR   L805D
            JMP   L7E13

L7E0E       LDX   #$FF
            JSR   doWAIT2
L7E13       JSR   L7D8D
            JSR   L69E9
            JSR   L7D80
            JMP   L79A4

L7E1F       JSR   L7DA9
            JSR   calcXYHGR
            LDY   #$1D
L7E27       LDA   ($16),Y
            STA   L7E70,Y
            DEY
            BPL   L7E27
            LDA   $03
            BEQ   L7E3C
            STA   $0B
L7E35       JSR   L7E4F
            DEC   $0B
            BNE   L7E35
L7E3C       JSR   L780A
            JSR   L804E
            LDA   #<L7E70
            LDY   #>L7E70
            SEC
            SBC   $03
            BCS   L7E4C
            DEY
L7E4C       JMP   L6A20

L7E4F       LDX   #$1B
L7E51       ASL   L7E70,X
            ASL   L7E70,X
            INX
            ROL   L7E70,X
            ASL   L7E70,X
            INX
            ROL   L7E70,X
            DEX
            ROR   L7E70,X
            DEX
            ROR   L7E70,X
            DEX
            DEX
            DEX
            BPL   L7E51
            RTS

*--- Array of data is $50 bytes

L7E70       DB    $CB
L7E71       DB    $A0
L7E72       DB    $D4
L7E73       DB    $CF
            DB    $A0
            DB    $C4
            DB    $C5
            DB    $CD
            DB    $CF
            DB    $AE
            DB    $A0
            DB    $A0
            DB    $B1
            DB    $14
            DB    $85
            DB    $04
            DB    $C8
            DB    $B1
            DB    $14
            DB    $85
            DB    $10
            DB    $85
            DB    $0A
            DB    $C8
            DB    $84
            DB    $0B
            DB    $A4
            DB    $0B
            DB    $B1
            DB    $14
            DB    $30
            DB    $1F
            DB    $F0
            DB    $10
            DB    $C9
            DB    $20
            DB    $F0
            DB    $0F
            DB    $C9
            DB    $21
            DB    $F0
            DB    $18
            DB    $C9
            DB    $03
            DB    $B0
            DB    $04
            DB    $E6
            DB    $10
            DB    $E6
            DB    $10
            DB    $20
            DB    $16
            DB    $43
            DB    $A5
            DB    $0A
            DB    $85
            DB    $10
            DB    $E6
            DB    $0B
            DB    $E6
            DB    $04
            DB    $D0
            DB    $DB
            DB    $E6
            DB    $0B
            DB    $60
            DB    $A9
            DB    $73
            DB    $8D
            DB    $B2
            DB    $55
            DB    $A9
            DB    $46
            DB    $8D
            DB    $B3
            DB    $55
            DB    $20
            DB    $38
            DB    $43
            DB    $4C

*-----------------------------------
* 
*-----------------------------------

L7EC0       JSR   L7D80
            LDA   #<L9BE6
            LDY   #>L9BE6
            JSR   L6A20
            LDY   #$03
L7ECC       LDX   #$FF
            JSR   doWAIT2
            DEY
            BNE   L7ECC
            JSR   L7D80
            JSR   L699E
            LDA   #$06
            STA   $0A
L7EDE       LDA   $0A
            ASL
            TAX
            JSR   L7D80
            LDA   L7F05,X
            LDY   L7F05+1,X
            STA   $16
            STY   $17
            JSR   L7E1F
            JSR   L7C82
            LDX   #$80
            JSR   doWAIT2
            JSR   L7D80
            JSR   L69E9
            DEC   $0A
            BNE   L7EDE
            RTS

L7F05       DA    $0000
            DA    L7FA9
            DA    L7F8B
            DA    L7F6D
            DA    L7F4F
            DA    L7F31
            DA    L7F13

L7F13       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $1E
            DB    $0F
            DB    $00
            DB    $7E
            DB    $0F
            DB    $00
            DB    $7E
            DB    $0F
            DB    $00
            DB    $7C
            DB    $07
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $70
            DB    $01
            DB    $00
L7F31       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $7E
            DB    $0F
            DB    $00
            DB    $7E
            DB    $0F
            DB    $00
            DB    $7C
            DB    $07
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $70
            DB    $01
            DB    $00
L7F4F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $7C
            DB    $07
            DB    $00
            DB    $7C
            DB    $07
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $70
            DB    $01
            DB    $00
L7F6D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $70
            DB    $01
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $70
            DB    $01
            DB    $00
            DB    $60
            DB    $00
            DB    $00
L7F8B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
L7FA9       DB    $00
            DB    $00
            DB    $00
            DB    $24
            DB    $02
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $2C
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $24
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L7FC7       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $77
            DB    $0E
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $56
            DB    $0A
            DB    $00
            DB    $51
            DB    $0A
            DB    $00
            DB    $77
            DB    $0E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L7FE5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $75
            DB    $0E
            DB    $00
            DB    $55
            DB    $0A
            DB    $00
            DB    $57
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $74
            DB    $0E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L8003       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $77
            DB    $0E
            DB    $00
            DB    $55
            DB    $0A
            DB    $00
            DB    $57
            DB    $0A
            DB    $00
            DB    $55
            DB    $0A
            DB    $00
            DB    $77
            DB    $0E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L8020       DB    $00
            DB    $44
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $00
            DB    $44
            DB    $03
            DB    $00
            DB    $44
            DB    $02
            DB    $00
            DB    $44
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $5C
            DB    $03
            DB    $00
            DB    $54
            DB    $02
            DB    $00
            DB    $54
            DB    $02
            DB    $00
            DB    $5C
            DB    $03
            DB    $00
            DB    $18

*-----------------------------------
* 
*-----------------------------------

            LDA   $0C
            ADC   #$05
            STA   $0C
            CLC
            LDA   $10
            ADC   #$04
            STA   $10
            RTS

L804E       CLC
            LDA   $0C
            ADC   #$04
            STA   $0C
            CLC
            LDA   $10
            ADC   #$04
            STA   $10
            RTS

L805D       LDA   $E0
            STA   $F1
            JSR   L8712
            LDA   #$04
            STA   $E0
L8068       JSR   L86FC
            LDA   $79
            BEQ   L807D
            LDA   #$01
            STA   $80
            JSR   L8763
            LDA   #$01
            STA   $80
            JSR   L8763
L807D       JSR   L8712
            DEC   $E0
            BNE   L8068
            LDA   $F1
            STA   $E0
            JSR   L86FC
            RTS

L808C       LDA   $EA
            BNE   L8092
            DEC   $EB
L8092       DEC   $EA
            CLC
            LDA   $EA
            ADC   $EB
            BCS   L80C0
            BNE   L80C0
            LDA   $E9
            BNE   L80B1
            JSR   L80C1
            LDA   #$01
            STA   $E9
            LDA   #$8C
            STA   $EA
            LDA   #$00
            STA   $EB
            RTS

L80B1       JSR   L80C1
            LDA   #$00
            STA   $E9
            LDA   #$02
            STA   $EB
            LDA   #$58
            STA   $EA
L80C0       RTS

L80C1       LDA   #$04
            STA   $E0
L80C5       JSR   L86FC
            LDA   $81
            BNE   L80DB
            LDA   $72
            EOR   #$01
            STA   $72
            LDY   $77
            STA   ($75),Y
            LDA   #$FF
            INY
            STA   ($75),Y
L80DB       JSR   L8712
            DEC   $E0
            BNE   L80C5
            RTS

L80E3       LDA   #$69
            LDX   #$04
            LDY   #$0F
            JSR   L8107
            LDX   #$07
            LDA   #<L811D
            LDY   #>L811D
            JSR   L8112
            LDA   #$69
            LDX   #$04
            LDY   #$15
            JSR   L8107
            LDX   #$07
            LDA   #<L8139
            LDY   #>L8139
            JMP   L8112

L8107       STA   $10
            STX   $1A
            STY   $04
            LDA   #$00
            STA   zpXBIT
            RTS

L8112       STX   $18
            STA   L55B1+1
            STY   L55B1+2
            JMP   L55A6

L811D       DB    $60
            DB    $23
            DB    $44
            DB    $3E
            DB    $10
            DB    $50
            DB    $6C
            DB    $02
            DB    $10
            DB    $08
            DB    $55
            DB    $02
            DB    $50
            DB    $7B
            DB    $55
            DB    $0E
            DB    $10
            DB    $0A
            DB    $45
            DB    $02
            DB    $10
            DB    $0A
            DB    $45
            DB    $02
            DB    $60
            DB    $0B
            DB    $45
            DB    $3E
L8139       DB    $4E
            DB    $68
            DB    $77
            DB    $01
            DB    $51
            DB    $28
            DB    $10
            DB    $02
            DB    $51
            DB    $28
            DB    $10
            DB    $02
            DB    $51
            DB    $68
            DB    $71
            DB    $01
            DB    $51
            DB    $28
            DB    $50
            DB    $00
            DB    $11
            DB    $25
            DB    $10
            DB    $01
            DB    $0E
            DB    $62
            DB    $17
            DB    $02

*-----------------------------------
* WHICH CARTOON TO PLAY?
*-----------------------------------

playCARTOON LDA   $55
L8157       CMP   #$02
            BNE   L815E
            JMP   playCARTOON1

L815E       CMP   #$05
            BNE   L8165
            JMP   playCARTOON2

L8165       CMP   #$09
            BNE   L816C
            JMP   playCARTOON3

L816C       BCC   L8172
            SBC   #$0D
            BCS   L8157
L8172       RTS

*-----------------------------------
* DRAW AN HORIZONTAL LINE
*-----------------------------------

cartoonHLINE
            STA   $0C	; X
            STY   $0E	; Y from
            STX   $10	; Y to
            LDA   #$80	; mode
            STA   $1E
            JMP   drawHLINE

*-----------------------------------
* DRAW A VERTICAL LINE
*-----------------------------------

cartoonVLINE
            STA   $0C	; X
            STY   $10	; Y-from
            STX   $11	; Y-to
            JMP   drawVLINE

*-----------------------------------
* CARTOON INIT
*-----------------------------------

initCARTOON
            LDA   #$C1	; start X
            STA   $60
            LDA   #$7A	; Y
            STA   $61
            STA   $71
            LDA   #$E5
            STA   $70
            LDA   #$00
            STA   $79
            STA   $78
            STA   $66
            LDA   #$01
            STA   $E0
            STA   $81
            STA   $59
            STA   $80
            LDA   #$03
            STA   $62
            RTS

*-----------------------------------
* PLAY CARTOON 1
*-----------------------------------

playCARTOON1
            JSR   clearHGR
            JSR   setHGR
            JSR   initCARTOON
L81B7       DEC   $59
            BNE   L81DB
            LDA   #$20
            STA   $59
            JSR   L7D80
            JSR   L699E
            SEC
            LDA   $60	; x -= 2
            SBC   #$02
            STA   $60
            STA   $0C
            CMP   #$21
            BCC   L81FC
            LDA   $61
            STA   $10
            INC   $66
            JSR   L79A4
L81DB       JSR   doWAIT
            DEC   $80
            BNE   L81F9
            LDA   #$1D
            STA   $80
            JSR   L7D8D
            JSR   L699E
            SEC
            LDA   $70
            SBC   #$02
            STA   $70
            JSR   L7D8D
            JSR   L88A2
L81F9       JMP   L81B7

L81FC       JSR   L7D80
            JSR   L699E
            JSR   L7D8D
            JSR   L699E
            LDY   #$08
L820A       LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L820A
            LDA   #$00
            STA   $60
            SEC
            LDA   $61
            SBC   #$0E
            STA   $61
            LDA   #$38
            STA   $70
L8221       DEC   $59
            BNE   L8237
            LDA   #$06
            STA   $59
            CLC
            LDA   $60
            ADC   #$02
            STA   $60
            CMP   #$A0
            BCS   L8258
            JSR   L8259
L8237       JSR   doWAIT
            DEC   $80
            BNE   L8255
            LDA   #$07
            STA   $80
            JSR   L7D8D
            JSR   L699E
            CLC
            LDA   $70
            ADC   #$02
            STA   $70
            JSR   L7D8D
            JSR   L88A2
L8255       JMP   L8221
L8258       RTS

L8259       INC   $66
            LDA   $66
            AND   #$03
            ASL
            TAX
            LDA   L82D8,X
            LDY   L82D8+1,X
            STA   L827A+1
            STY   L827A+2
            LDA   $61
            STA   $10
            LDA   $60
            STA   $0C
            JSR   calcXYHGR
            LDY   #$4F
L827A       LDA   $0666,Y
            STA   L7E70,Y
            DEY
            BPL   L827A
            LDA   #$14
            STA   $18
            LDA   $03
            BEQ   L8292
L828B       JSR   L82B1
            DEC   $03
            BNE   L828B
L8292       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   #$04
            STA   $09
L829D       LDA   L7E70,X
            STA   (zpHGR),Y
            INX
            INY
            DEC   $09
            BNE   L829D
            STX   $03
            INC   $10
            DEC   $18
            BNE   L8292
            RTS

L82B1       LDX   #$4C
L82B3       ASL   L7E70,X
            ASL   L7E70,X
            ROL   L7E71,X
            ASL   L7E71,X
            ROL   L7E72,X
            ASL   L7E72,X
            ROL   L7E73,X
            ROR   L7E72,X
            ROR   L7E71,X
            ROR   L7E70,X
            DEX
            DEX
            DEX
            DEX
            BPL   L82B3
            RTS

L82D8       DA    L82E0
            DA    L8330
            DA    L8380
            DA    L8330

L82E0       HEX   00000000007E0100407F0700607F0F00
            HEX   707F1F00787F3F00787F3F007C7F7F00
            HEX   7C7F7F007C7F7F007C7F7F007C7F7F00
            HEX   7C7F7F007C7F7F00787F3F00787F3F00
            HEX   707F1F00607F0F00407F0700007E0100
L8330       HEX   00000000007E0100407F0700607F0F00
            HEX   707F1F00787F3F00787F3F007C7F1F00
            HEX   7C7F03007C3F00007C0F00007C3F0000
            HEX   7C7F03007C7F1F00787F3F00787F3F00
            HEX   707F1F00607F0F00407F0700007E0100
L8380       HEX   00000000007E0100407F0700607F0300
            HEX   707F0100787F0000783F00007C1F0000
            HEX   7C0F00007C0700007C0300007C070000
            HEX   7C0F00007C1F0000783F0000787F0000
            HEX   707F0100607F0300407F0700007E0100

*-----------------------------------
* PLAY CARTOON 2
*-----------------------------------

playCARTOON2
            JSR   clearHGR
            JSR   setHGR
            JSR   initCARTOON
L83D9       DEC   $59
            BNE   L840C
            LDA   #$28
            STA   $59
            LDA   #$80
            LDY   #$7C
            LDX   #$81
            JSR   cartoonVLINE
            LDA   #$81
            LDY   #$7C
            LDX   #$81
            JSR   cartoonVLINE
            JSR   L7D80
            JSR   L699E
            SEC
            LDA   $60
            SBC   #$02
            STA   $60
            CMP   #$10
            BCC   L847D
            JSR   L7D80
            INC   $66
            JSR   L79A4
L840C       JSR   doWAIT
            DEC   $80
            BNE   L83D9
            LDA   #$21
            STA   $80
            LDA   $70
            CMP   #$71
            BEQ   L83D9
            JSR   L7D8D
            JSR   L699E
            SEC
            LDA   $70
            SBC   #$02
            STA   $70
            JSR   L7D8D
            JSR   L88A2
            LDA   $70
            CMP   #$7B
            BCS   L83D9
            CMP   #$71
            BEQ   L844F
            SBC   #$73
            TAX
            LDA   #$A0
            STA   $80
            LDA   L847E,X
            LDY   L847F,X
            LDX   #$7F
            JSR   cartoonVLINE
            JMP   L83D9

L844F       JSR   L7D8D
            JSR   L699E
            JSR   L7D8D
            CLC
            LDA   $0C
            ADC   #$0A
            STA   $0C
            JSR   L699E
            JSR   L7D8D
            JSR   L88A2
            LDA   #$74
            LDY   #$7D
            LDX   #$7F
            JSR   cartoonVLINE
            LDA   #$76
            LDY   #$7E
            LDX   #$7F
            JSR   cartoonVLINE
            JMP   L83D9
L847D       RTS

L847E       DB    $79
L847F       DB    $7B
            DB    $7B
            DB    $7C
            DB    $7D
            DB    $7D
            DB    $7F
            DB    $7E

*-----------------------------------
* PLAY CARTOON 3
*-----------------------------------

playCARTOON3
            JSR   clearHGR
            JSR   setHGR
            JSR   initCARTOON
L848F       DEC   $59
            BNE   L84B0
            LDA   #$26
            STA   $59
            JSR   L7D80
            JSR   L699E
            SEC
            LDA   $60
            SBC   #$02
            STA   $60
            CMP   #$20
            BCC   L84DD
            JSR   L7D80
            INC   $66
            JSR   L79A4
L84B0       JSR   doWAIT
            DEC   $80
            BNE   L848F

            LDA   #$21
            STA   $80
            JSR   L7D8D
            JSR   L699E
            SEC
            LDA   $70
            SBC   #$02
            STA   $70
            JSR   L7D8D
            JSR   L88A2
            CLC
            LDA   $70
            ADC   #$03
            LDY   #$7D
            LDX   #$7F
            JSR   cartoonVLINE
            JMP   L848F

*--- Play 2nd part of the cartoon

L84DD       JSR   L7D8D
            JSR   L699E
            LDY   #$08
L84E5       LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L84E5
            LDA   #$37
            STA   $70
            LDA   #$10
            STA   $60
            LDA   #$02
            STA   $62
L84F9       DEC   $59
            BNE   L8519
            LDA   #$22
            STA   $59
            JSR   L7D80
            JSR   L699E
            LDA   $60
            CMP   #$B0
            BCS   L8549
            ADC   #$02
            STA   $60
            JSR   L7D80
            INC   $66
            JSR   L79A4
L8519       JSR   doWAIT
            DEC   $80
            BNE   L8546
            LDA   #$27
            STA   $80
            JSR   L7D8D
            JSR   L69E9
            CLC
            LDA   $70
            ADC   #$02
            STA   $70
            JSR   L7D8D
            LDA   $66
            AND   #$02
            TAX
            LDA   L854A,X
            LDY   L854A+1,X
            STA   $16
            STY   $16+1
            JSR   L7E1F
L8546       JMP   L84F9
L8549       RTS

L854A       DA    L856C
            DA    L854E

L854E       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $61
            DB    $05
            DB    $00
            DB    $23
            DB    $07
            DB    $00
            DB    $33
            DB    $02
            DB    $00
            DB    $1E
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
L856C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            DB    $4E
            DB    $05
            DB    $00
            DB    $6F
            DB    $00
            DB    $00
            DB    $39
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $60
            DB    $60

*-----------------------------------
* PACMAN IS TRAPPED (DEAD CODE)
*-----------------------------------

L858C       JSR   clearHGR
            JSR   setHGR
            LDA   #$80
            STA   $1E
            LDA   #$00
            LDY   #$7A
            LDX   #$51
            JSR   cartoonHLINE
            LDA   #$00
            LDY   #$7A
            LDX   #$5E
            JSR   cartoonHLINE
            LDA   #$88
            LDY   #$FC
            LDX   #$51
            JSR   cartoonHLINE
            LDA   #$88
            LDY   #$FC
            LDX   #$5E
            JSR   cartoonHLINE
            LDA   #$7A
            LDY   #$00
            LDX   #$51
            JSR   cartoonVLINE
            LDA   #$88
            LDY   #$00
            LDX   #$51
            JSR   cartoonVLINE
            LDA   #$7A
            LDY   #$5E
            LDX   #$BE
            JSR   cartoonVLINE
            LDA   #$88
            LDY   #$5E
            LDX   #$BE
            JSR   cartoonVLINE
            JSR   initCARTOON
            LDA   #$02
            STA   $66
            LDA   #$04
            STA   $E0
L85E9       JSR   L8712
            DEC   $E0
            BNE   L85E9
            LDA   #$81
            STA   $60
            STA   $84
            STA   $98
            LDA   #$31
            STA   $AC
            LDA   #$D1
            STA   $C0
            LDA   #$57
            STA   $61
            STA   $AD
            STA   $C1
            LDA   #$07
            STA   $85
            LDA   #$A7
            STA   $99
            JSR   L7D80
            JSR   L79A4
L8616       LDA   #$04
            STA   $E0
L861A       JSR   L86FC
            DEC   $80
            BNE   L8662
            LDA   #$12
            STA   $80
            JSR   L7D8D
            JSR   L699E
            LDA   $E0
            CMP   #$03
            BCS   L8649
            CMP   #$02
            BEQ   L863F
            CLC
            LDA   $71
            ADC   #$02
            STA   $71
            JMP   L865C

L863F       LDA   $71
            SEC
            SBC   #$02
            STA   $71
            JMP   L865C

L8649       BEQ   L8655
            SEC
            LDA   $70
            SBC   #$02
            STA   $70
            JMP   L865C

L8655       CLC
            LDA   $70
            ADC   #$02
            STA   $70
L865C       JSR   L7D8D
            JSR   L88A2
L8662       JSR   L8712
            DEC   $E0
            BNE   L861A
            LDA   $85
            CMP   #$43
            BCC   L8616
            JSR   L7CF0
            LDA   #$8D
            LDY   #$8F
            LDX   #$57
            JSR   cartoonHLINE
            LDX   #$50
            JSR   doWAIT2
            JSR   L7D80
            JSR   L699E
            LDA   #$01
            STA   $62
            JSR   L7D80
            JSR   L79A4
            JSR   L7CF0
            LDA   #$81
            LDY   #$49
            LDX   #$4C
            JSR   cartoonVLINE
            LDX   #$50
            JSR   doWAIT2
            JSR   L7D80
            JSR   L699E
            LDA   #$03
            STA   $62
            JSR   L7D80
            JSR   L79A4
            JSR   L7CF0
            LDA   #$73
            LDY   #$75
            LDX   #$57
            JSR   cartoonHLINE
            LDX   #$50
            JSR   doWAIT2
            LDA   #$00
            STA   $62
            JSR   L7D80
            JSR   L699E
            JSR   L7D80
            JSR   L79A4
            JSR   L7CF0
            LDA   #$81
            LDY   #$63
            LDX   #$66
            JSR   cartoonVLINE
            LDY   #$19
L86E0       NOP
            LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L86E0
            RTS

L86EA       LDA   #$04
            STA   $E0
L86EE       JSR   L86FC
            JSR   L8763
            JSR   L8712
            DEC   $E0
            BNE   L86EE
            RTS

L86FC       LDY   $E0
            LDX   L870D,Y
            LDY   #$13
L8703       LDA   $84,X
            STA   |$0070,Y
            DEX
            DEY
            BPL   L8703
            RTS

L870D       DB    $00
            DB    $13
            DB    $27
            DB    $3B
            DB    $4F

L8712       LDY   $E0
            LDX   L870D,Y
            LDY   #$13
L8719       LDA   |$0070,Y
            STA   $84,X
            DEX
            DEY
            BPL   L8719
            RTS
	
L8723       DB    $0A
            DB    $0A
            DB    $09
            DB    $08
            DB    $08
            DB    $07
            DB    $07
            DB    $07
            DB    $07
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $05
            DB    $05
            DB    $04
L8733       DB    $13
            DB    $13
            DB    $11
            DB    $10
            DB    $10
            DB    $0D
            DB    $0D
            DB    $0C
            DB    $0C
            DB    $09
            DB    $09
            DB    $09
            DB    $09
            DB    $07
            DB    $06
            DB    $05
L8743       DB    $13
            DB    $13
            DB    $12
            DB    $11
            DB    $11
            DB    $10
            DB    $10
            DB    $0F
            DB    $0F
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0B
            DB    $0B
            DB    $07
L8753       DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $01

*-----------------------------------
* 
*-----------------------------------

L8763       DEC   $80
            BEQ   L8768
            RTS

L8768       LDA   $E4
            BEQ   L8780
            LDA   $E1
            BNE   L8772
            DEC   $E2
L8772       DEC   $E1
            CLC
            LDA   $E1
            ADC   $E2
            BNE   L8780
            BCS   L8780
            JSR   L6D49
L8780       JSR   L6D1E
            TAX
            LDA   $78
            BNE   L8793
            LDA   $79
            BNE   L879A
            LDA   L8723,X
            STA   $80
            BNE   L879F
L8793       LDA   L8743,X
            STA   $80
            BNE   L879F
L879A       LDA   L8753,X
            STA   $80
L879F       CLC
            LDA   $E0
            ROR
            TAX
            DEX
            LDA   $72
            AND   #$02
            BEQ   L87AF
            LDA   $71
            BNE   L87B1
L87AF       LDA   $70
L87B1       AND   #$02
            BNE   L87BA
            TXA
            ADC   $80
            STA   $80
L87BA       LDA   $7A
            BEQ   L87C0
            ASL   $80
L87C0       LDA   $73
            TAX
            JSR   L75F1
            LDY   #$00
            LDA   ($16),Y
            CMP   $70
            BNE   L87D5
            INY
            LDA   ($16),Y
            CMP   $71
            BEQ   L87ED
L87D5       LDA   $74
            TAX
            JSR   L75F1
            LDY   #$00
            LDA   ($16),Y
            CMP   $70
            BNE   L87EA
            INY
            LDA   ($16),Y
            CMP   $71
            BEQ   L87ED
L87EA       JMP   L8866

L87ED       STX   $73
            JSR   L8C50
            INC   $77
            LDY   $77
            LDA   ($75),Y
            CMP   $72
            STA   $72
            BEQ   L880B
            LDA   $79
            BNE   L880B
            JSR   L6D1E
            TAX
            LDA   L8733,X
            STA   $80
L880B       LDY   $72
            INY
            INY
            LDA   ($16),Y
            STA   $74
            LDA   $73
            CMP   #$17
            BEQ   L8839
            CMP   #$18
            BEQ   L8839
            CMP   #$1A
            BEQ   L8854
            CMP   #$1D
            BNE   L8866
            LDA   #$15
            STA   $7B
            LDA   #$00
            STA   $7D
            LDA   $72
            CMP   #$02
            BNE   L8862
L8833       LDA   #$01
            STA   $7A
            BNE   L8866
L8839       LDA   $79
            BEQ   L8866
            LDA   #$00
            STA   $79
            LDA   #$01
            STA   $81
            JSR   L7D8D
            JSR   L699E
            JSR   L6D30
            JSR   L6DA1
            JMP   L8866

L8854       LDA   #$06
            STA   $7B
            LDA   #$00
            STA   $7D
            LDA   $72
            CMP   #$03
            BEQ   L8833
L8862       LDA   #$00
            STA   $7A
L8866       LDA   $7A
            BEQ   L886D
            JMP   L8A9C

L886D       LDA   $81
            BEQ   L8874
            JMP   L8988

L8874       JSR   L7D8D
            JSR   L699E
            CLC
            LDA   $72
            ROR
            BNE   L888C
            LDA   $71
            BCS   L8888
            ADC   #$02
            BCC   L889A
L8888       SBC   #$02
            BCS   L889A
L888C       LDA   $70
            BCS   L8894
            ADC   #$02
            BCC   L8896
L8894       SBC   #$02
L8896       STA   $70
            LDA   $71
L889A       STA   $71
            STA   $10
            LDA   $70
            STA   $0C
L88A2       LDA   $E0
            ASL
            TAX
            LDA   $78
            BEQ   L88BC
            LDA   $E2
            BNE   L88BA
            LDA   $E1
            CMP   #$80
            BCS   L88BA
            LDX   #$06
            AND   #$10
            BEQ   L88C2
L88BA       LDX   #$00
L88BC       LDA   $79
            BEQ   L88C2
            LDX   #$0A
L88C2       LDA   zpMONITOR
            BEQ   L88D3
            CLC
            TXA
            ROR
            TAY
            LDA   L88E1,Y
            STA   $1E
            TXA
            ADC   #$0C
            TAX
L88D3       LDA   L9E5C,X
            LDY   L9E5C+1,X
            JSR   L6A20
            LDA   $81
            BEQ   L88E6
            RTS

L88E1       DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
L88E6       LDA   $79
            BNE   L88ED
            JSR   L8B34
L88ED       CLC
            LDA   $72
            ROR
            BEQ   L8929
            BCS   L890F
            LDA   #$02
            ADC   $7D
            CMP   #$06
            BNE   L8901
            LDA   #$00
            INC   $7B
L8901       STA   $7D
            CMP   #$00
            BNE   L890E
            DEC   $7B
            JSR   L895F
            INC   $7B
L890E       RTS

L890F       LDA   $7D
            SBC   #$02
            CMP   #$FE
            BNE   L891B
            LDA   #$04
            DEC   $7B
L891B       STA   $7D
            CMP   #$00
            BNE   L890E
            INC   $7B
            JSR   L895F
            DEC   $7B
            RTS

L8929       BCS   L8945
            LDA   $7E
            ADC   #$02
            CMP   #$06
            BNE   L8937
            LDA   #$00
            INC   $7C
L8937       STA   $7E
            CMP   #$00
            BNE   L890E
            DEC   $7C
            JSR   L895F
            INC   $7C
            RTS

L8945       LDA   $7E
            SBC   #$02
            CMP   #$FE
            BNE   L8951
            LDA   #$04
            DEC   $7C
L8951       STA   $7E
            CMP   #$00
            BNE   L890E
            INC   $7C
            JSR   L895F
            DEC   $7C
            RTS

L895F       JSR   L8B13
            LDY   #$00
            LDA   ($16),Y
            ROR
            BCC   L8980
            LDA   $7B
            JSR   L8981
            CLC
            ADC   #$3B
            STA   $0C
            LDA   $7C
            JSR   L8981
            CLC
            ADC   #$05
            STA   $10
            JSR   L6172
L8980       RTS

L8981       ASL
            STA   $0B
            ASL
            ADC   $0B
            RTS

L8988       DEC   $82
            BNE   L89DA
            LDY   $77
            LDA   $E0
            ROR
            BCC   L89A6
            LDA   $72
            CMP   #$00
            BNE   L899E
L8999       LDA   #$01
            INY
            STA   ($75),Y
L899E       LDA   #$01
            INY
            STA   ($75),Y
            JMP   L89C7

L89A6       LDA   $72
            CMP   #$01
            BNE   L89B1
            INY
            LDA   #$00
            STA   ($75),Y
L89B1       LDA   $E0
            CMP   #$02
            BNE   L89BF
            LDA   #$02
            INY
            STA   ($75),Y
            JMP   L8999

L89BF       LDA   #$03
            INY
            STA   ($75),Y
            JMP   L8999

L89C7       INY
            LDA   $E9
            BNE   L89D7
            LDA   #$03
            STA   ($75),Y
            INY
            LDA   #$FF
            STA   ($75),Y
            BNE   L89DA
L89D7       JSR   L6EA5
L89DA       LDA   $E0
            ROR
            BCC   L89E1
            BCS   L8A05
L89E1       ROR
            BCC   L89E8
            LDA   #$7F
            BNE   L89EA
L89E8       LDA   #$99
L89EA       CMP   $70
            BNE   L8A05
            LDA   $71
            CMP   #$55
            BNE   L89FF
L89F4       INC   $77
            LDY   $77
            LDA   ($75),Y
            STA   $72
L89FC       JMP   L8874

L89FF       CMP   #$5D
            BEQ   L89F4
            BNE   L89FC
L8A05       LDA   $70
            CMP   #$8B
            BNE   L89FC
            LDA   $71
            CMP   #$5D
            BEQ   L89F4
            CMP   #$55
            BEQ   L89F4
            CMP   #$47
            BNE   L89FC
            JSR   drawGHOSTDOOR
            LDA   #$17
            STA   $73
            LDA   #$18
            STA   $74
            LDA   #$0D
            STA   $7B
            LDA   #$0B
            STA   $7C
            LDA   #$02
            STA   $7D
            LDA   #$00
            STA   $7E
            LDA   #$00
            STA   $81
            BEQ   L89F4
L8A3A       DB    $00
L8A3B       DB    $00
            DB    $44
            DB    $8A
            DB    $53
            DB    $8A
            DB    $61
            DB    $8A
            DB    $6F
            DB    $8A
L8A44       DB    $03
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $02
            DB    $00
            DB    $03
            DB    $FF
            DB    $03
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $03
            DB    $03
            DB    $00
            DB    $02
            DB    $01
            DB    $FF
            DB    $03
            DB    $03
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $03
            DB    $00
            DB    $02
            DB    $00
            DB    $03
            DB    $00
            DB    $02
            DB    $FF
            DB    $03
            DB    $03
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $02
            DB    $00
            DB    $03
            DB    $FF

*-----------------------------------
* DRAW GHOST DOOR
*-----------------------------------

drawGHOSTDOOR       LDA   #$87
            STA   $0C
            LDA   #$93
            STA   $0E
            LDA   #$4D
            STA   $10
            JSR   drawHLINE
            LDA   #$87
            STA   $0C
            LDA   #$93
            STA   $0E
            LDA   #$4E
            STA   $10
            JSR   drawHLINE
            RTS

*-----------------------------------
* 
*-----------------------------------

L8A9C       JSR   L7D8D
            JSR   L699E
            LDA   $70
            CMP   #$60
            BCC   L8AE0
            LDA   $72
            ROR
            BCC   L8ABC
            LDA   $70
            SBC   #$02
            STA   $70
            STA   $0C
L8AB5       LDA   $71
            STA   $10
            JMP   L88A2

L8ABC       LDA   $70
            ADC   #$02
            STA   $70
            STA   $0C
            CMP   #$DD
            BNE   L8AB5
            LDA   $74
            STA   $73
            LDA   #$1D
            STA   $74
            LDA   #$3D
            STA   $70
            STA   $0C
            LDA   #$00
            STA   $7B
            LDA   #$00
            STA   $7D
            BEQ   L8AB5
L8AE0       LDA   $72
            ROR
            BCS   L8AEF
            LDA   $70
            ADC   #$02
            STA   $70
            STA   $0C
            BNE   L8AB5
L8AEF       LDA   $70
            SBC   #$02
            STA   $70
            STA   $0C
            CMP   #$3B
            BNE   L8AB5
            LDA   $74
            STA   $73
            LDA   #$1A
            STA   $74
            LDA   #$DB
            STA   $70
            STA   $0C
            LDA   #$1C
            STA   $7B
            LDA   #$00
            STA   $7D
            BEQ   L8AB5
L8B13       LDA   #$62
            STA   $17
            LDA   $7B
            ASL
            ASL
            ASL
            ASL
            BCC   L8B23
            INC   $17
            INC   $17
L8B23       ASL
            BCC   L8B28
            INC   $17
L8B28       CLC
            ADC   $7C
            ADC   #$3A
            BCC   L8B31
            INC   $17
L8B31       STA   $16
            RTS

L8B34       LDA   $60
            CMP   $70
            BNE   L8B6F
            SEC
            LDA   $61
            SBC   $71
L8B3F       BCS   L8B45
            EOR   #$FF
            ADC   #$01
L8B45       CMP   #$0A
            BCS   L8B7D
            TAX
            LDA   $55
            CMP   #$05
            BCC   L8B67
            LDA   $72
            AND   #$02
            BEQ   L8B5A
            LDA   $61
            BNE   L8B5C
L8B5A       LDA   $60
L8B5C       AND   #$02
            BNE   L8B67
            CLC
            LDA   $59
            ADC   #$01
            STA   $59
L8B67       TXA
            CMP   #$06
            BCS   L8B7D
            JMP   L8B7E

L8B6F       LDA   $61
            CMP   $71
            BNE   L8B7D
            SEC
            LDA   $60
            SBC   $70
            JMP   L8B3F
L8B7D       RTS

L8B7E       LDA   $67
            JMP   L8B9D

            BEQ   L8B8A
            DEC   $67
            BEQ   L8B9D
            RTS

L8B8A       LDA   $1F
            LDX   $78
            BNE   L8B92
            AND   #$3F
L8B92       CMP   #$00
            BNE   L8B9D
            LDA   #$04
            STA   $67
            STA   $66
            RTS

L8B9D       LDA   $78
            BEQ   L8BDD
            JSR   L7DB8
            JSR   L6D1E
            ASL
            TAX
            LDA   $E1
            ADC   L6E19,X
            STA   $E1
            LDA   $E2
            ADC   L6E1A,X
            STA   $E2
            LDA   #$01
            STA   $79
            LDA   #$00
            STA   $78
            LDX   $E8
            BNE   L8BDC
            CLC
            SED
            LDA   $68
            ADC   $53
            STA   $53
            LDA   $54
            ADC   #$00
            STA   $54
            CLC
            LDA   $68
            ADC   $68
            STA   $68
            CLD
            JSR   L7091
L8BDC       RTS

L8BDD       JSR   L8712
            JSR   L58FA
            LDY   #$03
L8BE5       LDX   #$FA
            JSR   doWAIT2
            DEY
            BNE   L8BE5
            LDA   #$04
            STA   $E0
L8BF1       JSR   L86FC
            JSR   L7D8D
            JSR   L699E
            DEC   $E0
            BNE   L8BF1
            JSR   L7D80
            JSR   L699E
            JSR   L7EC0
            LDA   $E8
            BEQ   L8C0E
            JMP   L43D2

L8C0E       DEC   $58
            LDA   $58
            AND   #$7F
            BNE   L8C1A
            LDA   #$00
            STA   $58
L8C1A       JSR   savePLAYERBOARD
            JSR   savePLAYERDATA
            LDA   $50
            STA   $0B
            JMP   L8C2E

L8C27       JSR   loadPLAYERDATA
            LDA   $58
            BNE   L8C4A
L8C2E       INC   $50
            LDA   $51
            CMP   $50
            BCS   L8C3A
            LDA   #$01
            STA   $50
L8C3A       LDA   $50
            CMP   $0B
            BNE   L8C27
            JSR   loadPLAYERDATA
            LDA   $58
            BNE   L8C4A
            JMP   L6EC3

L8C4A       JSR   loadPLAYERBOARD
            JMP   L5306

L8C50       LDA   $79
            BEQ   L8C64
            LDY   $77
            LDX   $73
            LDA   LA360,X
            INY
            STA   ($75),Y
            INY
            LDA   #$FF
            STA   ($75),Y
            RTS

L8C64       LDY   $77
            INY
            LDA   ($75),Y
            BMI   L8C6C
            RTS

L8C6C       LDA   $73
            ASL
            ASL
            ADC   $E0
            SEC
            SBC   #$01
            TAX
            LDA   L8CBE,X
            ASL
            TAX
            LDA   L8DBE,X
            STA   L8CA6+1
            LDA   L8DBE+1,X
            STA   L8CA6+2
            LDA   $78
            BNE   L8C8F
            LDA   $E9
            BEQ   L8CA0
L8C8F       LDA   $E0
            ASL
            TAX
            LDA   L8CB4,X
            TAY
            LDA   L8CB5,X
            TAX
            LDA   $72
            JMP   L8CA6

L8CA0       LDA   $72
            LDX   $60
            LDY   $61
L8CA6       JSR   $0666
            LDY   $77
            INY
            STA   ($75),Y
            INY
            LDA   #$FF
            STA   ($75),Y
            RTS

L8CB4       DB    $00
L8CB5       DB    $00
            DB    $19
            DB    $C9
            DB    $19
            DB    $51
            DB    $87
            DB    $51
            DB    $87
            DB    $C9
L8CBE       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $04
            DB    $04
            DB    $04
            DB    $04
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $05
            DB    $05
            DB    $05
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $0A
            DB    $29
            DB    $0A
            DB    $0A
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $2D
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $26
            DB    $09
            DB    $09
            DB    $09
            DB    $07
            DB    $07
            DB    $07
            DB    $07
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $2E
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $12
            DB    $28
            DB    $12
            DB    $12
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $15
            DB    $15
            DB    $15
            DB    $15
            DB    $13
            DB    $13
            DB    $13
            DB    $13
            DB    $16
            DB    $16
            DB    $16
            DB    $2F
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $18
            DB    $18
            DB    $2C
            DB    $18
            DB    $1A
            DB    $1A
            DB    $1A
            DB    $1A
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $1B
            DB    $27
            DB    $1B
            DB    $1B
            DB    $19
            DB    $19
            DB    $19
            DB    $19
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $1C
            DB    $1C
            DB    $1C
            DB    $1C
            DB    $1E
            DB    $1E
            DB    $1E
            DB    $1E
            DB    $20
            DB    $20
            DB    $2B
            DB    $20
            DB    $21
            DB    $21
            DB    $21
            DB    $21
            DB    $1F
            DB    $1F
            DB    $1F
            DB    $1F
            DB    $1D
            DB    $1D
            DB    $1D
            DB    $1D
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $22
            DB    $22
            DB    $22
            DB    $22
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $23
            DB    $23
            DB    $23
            DB    $23
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $24
            DB    $24
            DB    $24
            DB    $24
            DB    $25
            DB    $25
            DB    $2A
            DB    $25
            DB    $03
            DB    $03
            DB    $03
            DB    $03

L8DBE       DA    L8E1E
            DA    L8E28
            DA    L8E32
            DA    L8E3C
            DA    L8E46
            DA    L8E6B
            DA    L8E90
            DA    L8EB3
            DA    L8ED6
            DA    L8F20
            DA    L8F6C
            DA    L8F95
            DA    L8FBE
            DA    L8FED
            DA    L901A
            DA    L903B
            DA    L905E
            DA    L905F
            DA    L9073
            DA    L90B7
            DA    L90CF
            DA    L90F0
            DA    L9111
            DA    L9136
            DA    L915D
            DA    L91C3
            DA    L922B
            DA    L9266
            DA    L92A3
            DA    L92F2
            DA    L933D
            DA    L936A
            DA    L9399
            DA    L93DE
            DA    L941D
            DA    L9458
            DA    L9493
            DA    L94C6
            DA    L94F7
            DA    L95EA
            DA    L96C0
            DA    L969D
            DA    L966C
            DA    L9627
            DA    L9590
            DA    L951F
            DA    L954A
            DA    L956B

L8E1E       CMP   #$01
            BEQ   L8E25
            LDA   #$00
            RTS

L8E25       LDA   #$02
            RTS

L8E28       CMP   #$01
            BEQ   L8E2F
            LDA   #$00
            RTS

L8E2F       LDA   #$03
            RTS

L8E32       CMP   #$00
            BEQ   L8E39
            LDA   #$01
            RTS

L8E39       LDA   #$02
            RTS

L8E3C       CMP   #$00
            BEQ   L8E43
            LDA   #$01
            RTS

L8E43       LDA   #$03
            RTS

L8E46       CMP   #$01
            BEQ   L8E62
            CPY   #$22
            BCS   L8E5F
            CMP   #$02
            BEQ   L8E59
            CPX   $70
            BCS   L8E5F
L8E56       LDA   #$03
            RTS

L8E59       CPX   $70
            BEQ   L8E5F
            BCS   L8E68
L8E5F       LDA   #$00
            RTS

L8E62       CPX   $70
            BEQ   L8E56
            BCC   L8E56
L8E68       LDA   #$02
            RTS

L8E6B       CMP   #$01
            BEQ   L8E89
            CPY   #$22
            BCS   L8E86
            CMP   #$03
            BEQ   L8E80
            CPX   $70
            BEQ   L8E86
            BCC   L8E86
L8E7D       LDA   #$02
            RTS

L8E80       CPX   $70
            BEQ   L8E86
            BCC   L8E8D
L8E86       LDA   #$00
            RTS

L8E89       CPX   $70
            BCS   L8E7D
L8E8D       LDA   #$03
            RTS

L8E90       CMP   #$03
            BEQ   L8EAC
            CPX   #$5F
            BCS   L8EA2
            CMP   #$01
            BEQ   L8EA5
            CPY   $71
            BEQ   L8EA2
            BCS   L8EB0
L8EA2       LDA   #$02
            RTS

L8EA5       CPY   $71
            BCS   L8EA2
L8EA9       LDA   #$01
            RTS

L8EAC       CPY   $71
            BCC   L8EA9
L8EB0       LDA   #$00
            RTS

L8EB3       CMP   #$02
            BEQ   L8ECF
            CPX   #$BB
            BCC   L8EC5
            CMP   #$01
            BEQ   L8EC8
            CPY   $71
            BEQ   L8EC5
            BCS   L8ED3
L8EC5       LDA   #$03
            RTS

L8EC8       CPY   $71
            BCS   L8EC5
L8ECC       LDA   #$01
            RTS

L8ECF       CPY   $71
            BCC   L8ECC
L8ED3       LDA   #$00
            RTS

L8ED6       CMP   #$01
            BEQ   L8EEF
            CPY   #$58
            BCS   L8F15
            CMP   #$02
            BEQ   L8EF8
            CMP   #$03
            BEQ   L8F0B
            CPX   $70
            BEQ   L8F15
            BCS   L8F02
L8EEC       LDA   #$03
            RTS

L8EEF       CPX   $70
            BCC   L8EEC
            BNE   L8F02
L8EF5       LDA   #$01
            RTS

L8EF8       CPX   $70
            BCC   L8F05
            BEQ   L8F05
            CPY   $71
            BCC   L8EF5
L8F02       LDA   #$02
            RTS

L8F05       CPY   $71
            BCC   L8EF5
            BCS   L8F15
L8F0B       CPX   $70
            BCC   L8F18
            CPY   $71
            BCC   L8EF5
            BEQ   L8EF5
L8F15       LDA   #$00
            RTS

L8F18       CPY   $71
            BEQ   L8EEC
            BCC   L8EF5
            BCS   L8F15
L8F20       CMP   #$01
            BEQ   L8F39
            CPY   #$58
            BCS   L8F61
            CMP   #$03
            BEQ   L8F42
            CMP   #$02
            BEQ   L8F55
            CPX   $70
            BEQ   L8F61
            BCC   L8F3F
L8F36       LDA   #$02
            RTS

L8F39       CPX   $70
            BEQ   L8F4C
            BCS   L8F36
L8F3F       LDA   #$03
            RTS

L8F42       CPX   $70
            BCS   L8F4F
            CPY   $71
            BEQ   L8F3F
            BCC   L8F3F
L8F4C       LDA   #$01
            RTS

L8F4F       CPY   $71
            BCC   L8F4C
            BCS   L8F61
L8F55       CPX   $70
            BEQ   L8F5B
            BCS   L8F64
L8F5B       CPY   $71
            BCC   L8F4C
            BEQ   L8F4C
L8F61       LDA   #$00
            RTS

L8F64       CPY   $71
            BEQ   L8F36
            BCC   L8F4C
            BCS   L8F61

L8F6C       CMP   #$01
            BEQ   L8F8A
            CMP   #$02
            BEQ   L8F81
            CPX   #$60
            BCC   L8F92
            CPY   $71
            BCC   L8F92
            BEQ   L8F92
L8F7E       LDA   #$00
            RTS

L8F81       CPY   $71
            BEQ   L8F87
            BCS   L8F7E
L8F87       LDA   #$02
            RTS

L8F8A       CPY   #$37
            BCS   L8F92
            CPX   $70
            BCS   L8F87
L8F92       LDA   #$03
            RTS

L8F95       CMP   #$01
            BEQ   L8FB3
            CMP   #$03
            BEQ   L8FAA
            CPX   #$B9
            BCS   L8FBB
            CPY   $71
            BCC   L8FBB
            BEQ   L8FBB
L8FA7       LDA   #$00
            RTS

L8FAA       CPY   $71
            BEQ   L8FB0
            BCS   L8FA7
L8FB0       LDA   #$03
            RTS

L8FB3       CPY   #$37
            BCS   L8FBB
            CPX   $70
            BCC   L8FB0
L8FBB       LDA   #$02
            RTS

L8FBE       CMP   #$00
            BEQ   L8FE5
            CMP   #$02
            BEQ   L8FD8
            CPX   #$85
            BCC   L8FCD
L8FCA       LDA   #$03
            RTS

L8FCD       CPX   #$61
            BCC   L8FCA
            CPY   $71
            BCS   L8FCA
L8FD5       LDA   #$01
            RTS

L8FD8       CPX   #$85
            BCC   L8FDF
L8FDC       LDA   #$02
            RTS

L8FDF       CPY   #$37
            BCC   L8FD5
            BCS   L8FDC
L8FE5       CPX   $70
            BCC   L8FCA
            BEQ   L8FCA
            BCS   L8FDC

L8FED       CMP   #$00
            BEQ   L9014
            CMP   #$03
            BEQ   L9007
            CPX   #$93
            BCS   L8FFC
L8FF9       LDA   #$02
            RTS

L8FFC       CPX   #$B9
            BCS   L8FF9
            CPY   $71
            BCS   L8FF9
L9004       LDA   #$01
            RTS

L9007       CPX   #$93
            BCS   L900E
L900B       LDA   #$03
            RTS

L900E       CPY   #$37
            BCC   L9004
            BCS   L900B
L9014       CPX   $70
            BCS   L8FF9
            BCC   L900B

L901A       CMP   #$02
            BEQ   L9032
            CMP   #$00
            BEQ   L9029
            CPX   $70
            BCC   L902F
L9026       LDA   #$01
            RTS

L9029       CPY   $71
            BEQ   L902F
            BCS   L9038
L902F       LDA   #$03
            RTS

L9032       CPY   $71
            BCC   L9026
            BEQ   L9026
L9038       LDA   #$00
            RTS

L903B       CMP   #$03
            BEQ   L9055
            CMP   #$00
            BEQ   L904C
            CPX   $70
            BEQ   L9049
            BCS   L9052
L9049       LDA   #$01
            RTS

L904C       CPY   $71
            BEQ   L9052
            BCS   L905B
L9052       LDA   #$02
            RTS

L9055       CPY   $71
            BCC   L9049
            BEQ   L9049
L905B       LDA   #$00
            RTS

L905E       NOP
L905F       CMP   #$00
            BEQ   L906D
            CMP   #$02
            BEQ   L906A
L9067       LDA   #$03
            RTS

L906A       LDA   #$02
            RTS

L906D       CPX   $70
            BCC   L9067
            BCS   L906A
L9073       CMP   #$02
            BEQ   L90A3
            LDA   $69
            BEQ   L907E
            LDA   #$03
            RTS

L907E       LDA   $72
            CMP   #$03
            BEQ   L90B1
            CMP   #$01
            BEQ   L9098
            CPY   $71
            BEQ   L908E
            BCS   L9091
L908E       LDA   #$02
            RTS

L9091       CPY   #$6C
            BCC   L908E
L9095       LDA   #$00
            RTS

L9098       CPY   $71
            BCS   L908E
            CPY   #$46
            BCS   L908E
L90A0       LDA   #$01
            RTS

L90A3       CPX   $70
            BEQ   L90B1
            CPY   #$46
            BCC   L90A0
            CPY   #$6C
            BCS   L9095
            BCC   L908E
L90B1       CPY   $71
            BCC   L90A0
            BCS   L9095

L90B7       PHA
            CMP   #$02
            BCC   L90BE
            EOR   #$01
L90BE       STA   $72
            JSR   L9073
            CMP   #$02
            BCC   L90C9
            EOR   #$01
L90C9       TAX
            PLA
            STA   $72
            TXA
            RTS

L90CF       CMP   #$02
            BEQ   L90E9
            CPX   #$60
            BCC   L90E6
            CMP   #$01
            BEQ   L90E2
            CPY   #$36
            BCC   L90E6
L90DF       LDA   #$00
            RTS

L90E2       CPY   #$7C
            BCC   L90ED
L90E6       LDA   #$03
            RTS

L90E9       CPY   $71
            BCS   L90DF
L90ED       LDA   #$01
            RTS

L90F0       CMP   #$03
            BEQ   L910A
            CPX   #$B9
            BCS   L9107
            CMP   #$01
            BEQ   L9103
            CPY   #$36
            BCC   L9107
L9100       LDA   #$00
            RTS

L9103       CPY   #$7C
            BCC   L910E
L9107       LDA   #$02
            RTS

L910A       CPY   $71
            BCS   L9100
L910E       LDA   #$01
            RTS

L9111       CMP   #$03
            BEQ   L9130
            CMP   #$01
            BEQ   L9129
            CPX   $70
            BCS   L9120
L911D       LDA   #$00
            RTS

L9120       CPY   $71
            BEQ   L9126
            BCS   L911D
L9126       LDA   #$02
            RTS

L9129       CPY   $71
            BEQ   L9126
L912D       LDA   #$01
            RTS

L9130       CPY   $71
            BCC   L912D
            BCS   L911D

L9136       CMP   #$02
            BEQ   L9157
            CMP   #$01
            BEQ   L9150
            CPX   $70
            BCC   L9147
            BEQ   L9147
L9144       LDA   #$00
            RTS

L9147       CPY   $71
            BEQ   L914D
            BCS   L9144
L914D       LDA   #$03
            RTS

L9150       CPY   $71
            BEQ   L914D
L9154       LDA   #$01
            RTS

L9157       CPY   $71
            BCC   L9154
            BCS   L9144

L915D       CMP   #$00
            BEQ   L91A3
            CPY   #$36
            BCS   L9168
L9165       LDA   #$01
            RTS

L9168       CPX   $70
            BEQ   L9165
            CMP   #$01
            BEQ   L919D
            CMP   #$02
            BEQ   L917E
            CPX   $70
            BCC   L917B
L9178       LDA   #$00
            RTS

L917B       LDA   #$03
            RTS

L917E       CPX   $70
            BEQ   L9178
            BCC   L9178
            CPX   #$8D
            BCC   L918B
L9188       LDA   #$02
            RTS

L918B       CPY   $71
            BEQ   L9188
            BCS   L9197
            CPY   #$5A
            BCC   L9165
            BCS   L9188
L9197       CPY   #$8F
            BCS   L9178
            BCC   L9188
L919D       CPX   $70
            BCC   L917B
            BCS   L9188
L91A3       CPY   $71
            BCC   L9188
            BNE   L91AF
            CPX   $70
            BCC   L917B
            BCS   L9188
L91AF       CPX   $70
            BEQ   L9178
            BCS   L91BB
            CPY   #$A1
            BCS   L9178
            BCC   L917B
L91BB       LDA   $62
            CMP   #$03
            BEQ   L9178
            BNE   L9188

L91C3       CMP   #$00
            BEQ   L920B
            CPY   #$36
            BCS   L91CE
L91CB       LDA   #$01
            RTS

L91CE       CPX   $70
            BEQ   L91CB
            CMP   #$01
            BEQ   L9205
            CMP   #$03
            BEQ   L91E6
            CPX   $70
            BEQ   L91E0
            BCS   L917B
L91E0       LDA   #$00
            RTS

L91E3       LDA   #$02
            RTS

L91E6       CPX   $70
            BCS   L91E0
            CPX   #$8D
            BEQ   L91F0
            BCS   L91F3
L91F0       LDA   #$03
            RTS

L91F3       CPY   $71
            BEQ   L91F0
            BCS   L91FF
            CPY   #$5A
            BCC   L91CB
            BCS   L91F0
L91FF       CPY   #$8F
            BCS   L91E0
            BCC   L91F0
L9205       CPX   $70
            BCS   L91E3
            BCC   L91F0
L920B       CPY   $71
            BCC   L91F0
            BNE   L9217
            CPX   $70
            BCS   L91E3
            BCC   L91F0
L9217       CPX   $70
            BEQ   L91E0
            BCC   L9223
            CPY   #$A1
            BCS   L91E0
            BCC   L91E3
L9223       LDA   $62
            CMP   #$02
            BEQ   L91E0
            BNE   L91F0

L922B       CMP   #$00
            BEQ   L9258
            CMP   #$02
            BEQ   L924D
            CPY   #$36
            BCS   L923A
L9237       LDA   #$03
            RTS

L923A       CPY   $71
            BCS   L9237
            CPX   $70
            BCC   L9245
L9242       LDA   #$01
            RTS

L9245       LDA   $62
            CMP   #$02
            BEQ   L9242
            BNE   L9237
L924D       CPY   #$36
            BCC   L9242
            CPY   $71
            BCC   L9242
L9255       LDA   #$02
            RTS

L9258       CPY   $71
            BCC   L9237
            BEQ   L9260
            BCS   L9255
L9260       CPX   $70
            BCC   L9237
            BCS   L9255

L9266       CMP   #$00
            BEQ   L9295
            CMP   #$03
            BEQ   L928A
            CPY   #$36
            BCS   L9275
L9272       LDA   #$02
            RTS

L9275       CPY   $71
            BCS   L9272
            CPX   $70
            BEQ   L927F
            BCS   L9282
L927F       LDA   #$01
            RTS

L9282       LDA   $62
            CMP   #$03
            BEQ   L927F
            BNE   L9272
L928A       CPY   #$36
            BCC   L927F
            CPY   $71
            BCC   L927F
L9292       LDA   #$03
            RTS

L9295       CPY   $71
            BCC   L9272
            BEQ   L929D
            BCS   L9292
L929D       CPX   $70
            BCS   L9272
            BCC   L9292

L92A3       CMP   #$03
            BEQ   L92EC
            CMP   #$01
            BEQ   L92CB
            CPY   #$5A
            BCC   L92BC
            CPX   $70
            BEQ   L92B5
            BCS   L92B8
L92B5       LDA   #$00
            RTS

L92B8       CPX   #$83
            BCC   L92BF
L92BC       LDA   #$02
            RTS

L92BF       CPY   #$B3
            BCC   L92BC
            LDA   $62
            CMP   #$02
            BEQ   L92BC
            BNE   L92B5
L92CB       CPY   #$7D
            BCS   L92D2
L92CF       LDA   #$01
            RTS

L92D2       CPX   #$83
            BCS   L92BC
            CPX   $70
            BEQ   L92CF
            BCC   L92CF
            CPY   $71
            BCS   L92BC
            LDA   $62
            CMP   #$03
            BEQ   L92CF
            CMP   #$01
            BEQ   L92CF
            BNE   L92BC
L92EC       CPY   $71
            BCC   L92CF
            BCS   L92B5

L92F2       CMP   #$02
            BEQ   L9337
            CMP   #$01
            BEQ   L9318
            CPY   #$5A
            BCC   L9309
            CPX   $70
            BCC   L9305
L9302       LDA   #$00
            RTS

L9305       CPX   #$96
            BCS   L930C
L9309       LDA   #$03
            RTS

L930C       CPY   #$B3
            BCC   L9309
            LDA   $62
            CMP   #$03
            BEQ   L9309
            BNE   L9302
L9318       CPY   #$7D
            BCS   L931F
L931C       LDA   #$01
            RTS

L931F       CPX   #$96
            BCC   L9309
            CPX   $70
            BCS   L931C
            CPY   $71
            BCS   L9309
            LDA   $62
            CMP   #$02
            BEQ   L931C
            CMP   #$01
            BEQ   L931C
            BNE   L9309
L9337       CPY   $71
            BCC   L931C
            BCS   L9302

L933D       CMP   #$01
            BEQ   L9364
            CMP   #$02
            BEQ   L9355
            CPX   $70
            BCC   L9352
            CPY   $71
            BCC   L9352
            BEQ   L9352
L934F       LDA   #$00
            RTS

L9352       LDA   #$03
            RTS

L9355       CPY   $71
            BEQ   L935B
            BCS   L935E
L935B       LDA   #$02
            RTS

L935E       CPX   #$84
            BCC   L934F
            BCS   L935B
L9364       CPX   $70
            BCC   L9352
            BCS   L935B

L936A       CMP   #$01
            BEQ   L9393
            CMP   #$03
            BEQ   L9384
            CPX   $70
            BEQ   L9378
            BCS   L9381
L9378       CPY   $71
            BCC   L9381
            BEQ   L9381
L937E       LDA   #$00
            RTS

L9381       LDA   #$02
            RTS

L9384       CPY   $71
            BEQ   L938A
            BCS   L938D
L938A       LDA   #$03
            RTS

L938D       CPX   #$94
            BCS   L937E
            BCC   L938A
L9393       CPX   $70
            BCS   L9381
            BCC   L938A

L9399       CMP   #$00
            BEQ   L93CA
            CMP   #$02
            BEQ   L93B1
            CPY   #$7D
            BCC   L93AE
            CPX   $70
            BEQ   L93AB
            BCS   L93AE
L93AB       LDA   #$03
            RTS

L93AE       LDA   #$01
            RTS

L93B1       CPY   #$B3
            BCS   L93BF
            CPY   #$6B
            BEQ   L93C2
            CPX   $70
            BCC   L93AE
            BEQ   L93AE
L93BF       LDA   #$02
            RTS

L93C2       LDA   $62
            CMP   #$02
            BEQ   L93BF
            BNE   L93AE
L93CA       CPY   #$B3
            BCC   L93D6
            LDA   $62
            CMP   #$02
            BEQ   L93BF
            BNE   L93AB
L93D6       CPX   $70
            BCC   L93AB
            BEQ   L93AB
            BCS   L93BF

L93DE       CMP   #$00
            BEQ   L940B
            CMP   #$03
            BEQ   L93F4
            CPY   #$7D
            BCC   L93F1
            CPX   $70
            BCC   L93F1
L93EE       LDA   #$02
            RTS

L93F1       LDA   #$01
            RTS

L93F4       CPY   #$B3
            BCS   L9400
            CPY   #$6B
            BEQ   L9403
            CPX   $70
            BCS   L93F1
L9400       LDA   #$03
            RTS

L9403       LDA   $62
            CMP   #$03
            BEQ   L9400
            BNE   L93F1
L940B       CPY   #$B3
            BCC   L9417
            LDA   $62
            CMP   #$03
            BEQ   L9400
            BNE   L93EE
L9417       CPX   $70
            BCS   L93EE
            BCC   L9400

L941D       CMP   #$00
            BEQ   L943E
            CMP   #$02
            BEQ   L942C
            CPY   $71
            BCC   L9438
L9429       LDA   #$03
            RTS

L942C       CPY   #$7D
            BCC   L943B
            CPY   $71
            BCS   L943B
            CPX   #$5F
            BCS   L943B
L9438       LDA   #$01
            RTS

L943B       LDA   #$02
            RTS

L943E       CPY   #$B3
            BNE   L944E
            LDA   $62
            CMP   #$02
            BNE   L9429
            CPX   $70
            BCC   L9429
            BCS   L943B
L944E       CPX   $70
            BCS   L943B
            CPY   $71
            BCS   L9429
            BCC   L943B

L9458       CMP   #$00
            BEQ   L9479
            CMP   #$03
            BEQ   L9467
            CPY   $71
            BCC   L9473
L9464       LDA   #$02
            RTS

L9467       CPY   #$7D
            BCC   L9476
            CPY   $71
            BCS   L9476
            CPX   #$BA
            BCC   L9476
L9473       LDA   #$01
            RTS

L9476       LDA   #$03
            RTS

L9479       CPY   #$B3
            BNE   L9489
            LDA   $62
            CMP   #$03
            BNE   L9464
            CPX   $70
            BCC   L9476
            BCS   L9464
L9489       CPX   $70
            BCC   L9476
            CPY   $71
            BCS   L9464
            BCC   L9476

L9493       CMP   #$00
            BEQ   L94BC
            CMP   #$02
            BEQ   L94AF
            CPY   #$B3
            BEQ   L94A9
            CPX   #$5F
            BCS   L94AC
            LDA   $62
            CMP   #$00
            BNE   L94AC
L94A9       LDA   #$03
            RTS

L94AC       LDA   #$01
            RTS

L94AF       CPY   #$B3
            BEQ   L94B9
            CPX   $70
            BCC   L94AC
            BEQ   L94AC
L94B9       LDA   #$02
            RTS

L94BC       CPY   #$7D
            BCC   L94B9
            CPX   $70
            BCC   L94A9
            BCS   L94B9

L94C6       CMP   #$00
            BEQ   L94ED
            CMP   #$03
            BEQ   L94E2
            CPY   #$B3
            BEQ   L94DC
            CPX   #$BA
            BCC   L94DF
            LDA   $62
            CMP   #$00
            BNE   L94DF
L94DC       LDA   #$02
            RTS

L94DF       LDA   #$01
            RTS

L94E2       CPY   #$B3
            BEQ   L94EA
            CPX   $70
            BCS   L94DF
L94EA       LDA   #$03
            RTS

L94ED       CPY   #$7D
            BCC   L94EA
            CPX   $70
            BCS   L94DC
            BCC   L94EA

L94F7       PHA
            TXA
            SEC
            SBC   $70
            BCS   L9500
            EOR   #$FF
L9500       CMP   #$20
            BCS   L951B
            TYA
            SEC
            SBC   $71
            BCS   L950C
            EOR   #$FF
L950C       CMP   #$20
            BCS   L951B
            PLA
            CMP   #$02
            BEQ   L9518
            LDA   #$03
            RTS

L9518       LDA   #$01
            RTS

L951B       PLA
            JMP   L8F20

L951F       CMP   #$00
            BEQ   L9544
            CMP   #$03
            BEQ   L9539
            CPX   #$93
            BCS   L952E
L952B       LDA   #$01
            RTS

L952E       CPX   #$B9
            BCS   L952B
            CPY   $71
            BCS   L952B
L9536       LDA   #$02
            RTS

L9539       CPX   #$93
            BCC   L952B
            CPX   #$37
            BCC   L952B
L9541       LDA   #$03
            RTS

L9544       CPX   $70
            BCS   L9541
            BCC   L9536

L954A       CMP   #$03
            BEQ   L9564
            CMP   #$00
            BEQ   L955B
            CPX   $70
            BEQ   L9558
            BCS   L9568
L9558       LDA   #$02
            RTS

L955B       CPY   $71
            BEQ   L9561
            BCS   L9558
L9561       LDA   #$00
            RTS

L9564       CPY   $71
            BCS   L9561
L9568       LDA   #$00
            RTS

L956B       CMP   #$03
            BEQ   L958A
            CMP   #$01
            BEQ   L9583
            CPX   $70
            BCS   L957A
L9577       LDA   #$02
            RTS

L957A       CPY   $71
            BEQ   L9580
            BCS   L9577
L9580       LDA   #$00
            RTS

L9583       CPY   $71
            BNE   L9577
L9587       LDA   #$01
            RTS

L958A       CPY   $71
            BCC   L9580
            BCS   L9587

L9590       CMP   #$00
            BEQ   L95CA
            CPY   #$36
            BCS   L959B
L9598       LDA   #$01
            RTS

L959B       CMP   #$01
            BEQ   L95C4
            CMP   #$02
            BEQ   L95AD
            CPX   $70
            BCC   L95AA
L95A7       LDA   #$00
            RTS

L95AA       LDA   #$03
            RTS

L95AD       CPX   $70
            BEQ   L9598
            BCC   L9598
            CPX   #$8D
            BCS   L9598
            CPY   $71
            BCS   L9598
            CPY   #$5A
            BCC   L95A7
            BCS   L9598
L95C1       LDA   #$02
            RTS

L95C4       CPX   $70
            BCC   L95AA
            BCS   L95C1
L95CA       CPY   $71
            BCC   L95C1
            BNE   L95D6
            CPX   $70
            BCC   L95AA
            BCS   L95C1
L95D6       CPX   $70
            BEQ   L95A7
            BCS   L95E2
            CPY   #$A1
            BCS   L95A7
            BCC   L95AA
L95E2       LDA   $62
            CMP   #$03
            BEQ   L95A7
            BNE   L95C1

L95EA       CMP   #$00
            BEQ   L9619
            CMP   #$03
            BEQ   L960E
            CPY   #$36
            BCS   L95F9
L95F6       LDA   #$01
            RTS

L95F9       CPY   $71
            BCS   L95F6
            CPX   $70
            BEQ   L9603
            BCS   L9606
L9603       LDA   #$02
            RTS

L9606       LDA   $62
            CMP   #$03
            BEQ   L9603
            BNE   L95F6
L960E       CPY   #$36
            BCC   L9616
            CPY   $71
            BCS   L95F6
L9616       LDA   #$03
            RTS

L9619       CPY   $71
            BCC   L9616
            BEQ   L9621
            BCS   L9603
L9621       CPX   $70
            BCS   L9616
            BCC   L9603

L9627       CMP   #$00
            BEQ   L9658
            CMP   #$02
            BEQ   L963F
            CPY   #$7D
            BCC   L9639
            CPX   $70
            BEQ   L963C
            BCC   L963C
L9639       LDA   #$03
            RTS

L963C       LDA   #$01
            RTS

L963F       CPY   #$B3
            BCS   L963C
            CPY   #$6B
            BEQ   L9650
            CPX   $70
            BEQ   L964D
            BCS   L963C
L964D       LDA   #$02
            RTS

L9650       LDA   $62
            CMP   #$02
            BEQ   L963C
            BNE   L964D
L9658       CPY   #$B3
            BCC   L9664
            LDA   $62
            CMP   #$02
            BEQ   L9639
            BNE   L964D
L9664       CPX   $70
            BCC   L964D
            BEQ   L964D
            BCS   L9639

L966C       CMP   #$00
            BEQ   L9693
            CMP   #$03
            BEQ   L9688
            CPY   #$B3
            BEQ   L9682
            CPX   #$BA
            BCC   L9685
            LDA   $62
            CMP   #$00
            BNE   L9685
L9682       LDA   #$01
            RTS

L9685       LDA   #$02
            RTS

L9688       CPY   #$B3
            BEQ   L9682
            CPX   $70
            BCC   L9682
L9690       LDA   #$03
            RTS

L9693       CPY   #$7D
            BCC   L9682
            CPX   $70
            BCS   L9690
            BCC   L9685

L969D       CMP   #$01
            BEQ   L96B5
            CMP   #$02
            BEQ   L96B2
            CPX   #$60
            BCC   L96BD
            CPY   $71
            BCC   L96BD
            BEQ   L96BD
            LDA   #$00
            RTS

L96B2       LDA   #$02
            RTS

L96B5       CPY   #$37
            BCS   L96BD
            CPX   $70
            BCS   L96B2
L96BD       LDA   #$03
            RTS

L96C0       PHA
            TXA
            SEC
            SBC   $70
            BCS   L96C9
            EOR   #$FF
L96C9       CMP   #$20
            BCS   L96E4
            TYA
            SEC
            SBC   $71
            BCS   L96D5
            EOR   #$FF
L96D5       CMP   #$20
            BCS   L96E4
            PLA
            CMP   #$02
            BEQ   L96E1
            LDA   #$03
            RTS

L96E1       LDA   #$02
            RTS

L96E4       PLA
            JMP   L9073

L96E8       DA    L96FA
            DA    L97CC
            DA    L989E
            DA    L9970
            DA    L9A42
            DA    L9B14
            DA    L9BE6
            DA    L9CB8
            DA    L9D8A

L96FA       HEX   7800007C01007E03007F07007F07007F
            HEX   07007F07007E03007C01007800007001
            HEX   007803007C07007E0F007E0F007E0F00
            HEX   7E0F007C070078030070010060030070
            HEX   0700780F007C1F007C1F007C1F007C1F
            HEX   00780F00700700600300400700600F00
            HEX   701F00783F00783F00783F00783F0070
            HEX   1F00600F00400700000F00401F00603F
            HEX   00707F00707F00707F00707F00603F00
            HEX   401F00000F00001E00003F00407F0060
            HEX   7F01607F01607F01607F01407F00003F
            HEX   00001E00003C00007E00007F01407F03
            HEX   407F03407F03407F03007F01007E0000
            HEX   3C00
L97CC       HEX   7800007C01007E03007F07007F07004F
            HEX   07004F07000603000401000000007001
            HEX   007803007C07007E0F007E0F001E0F00
            HEX   1E0F000C060008020000000060030070
            HEX   0700780F007C1F007C1F003C1E003C1E
            HEX   00180C00100400000000400700600F00
            HEX   701F00783F00783F00783C00783C0030
            HEX   1800200800000000000F00401F00603F
            HEX   00707F00707F00707900707900603000
            HEX   401000000000001E00003F00407F0060
            HEX   7F01607F016073016073014061000021
            HEX   00000000003C00007E00007F01407F03
            HEX   407F0340670340670300430100420000
            HEX   0000
L989E       HEX   0000000401000603004F07004F07007F
            HEX   07007F07007E03007C01007800000000
            HEX   000802000C06001E0F001E0F007E0F00
            HEX   7E0F007C070078030070010000000010
            HEX   0400180C003C1E003C1E007C1F007C1F
            HEX   00780F00700700600300000000200800
            HEX   301800783C00783C00783F00783F0070
            HEX   1F00600F004007000000004010006030
            HEX   00707900707900707F00707F00603F00
            HEX   401F00000F0000000000210040610060
            HEX   7301607301607F01607F01407F00003F
            HEX   00001E00000000004200004301406703
            HEX   406703407F03407F03007F01007E0000
            HEX   3C00
L9970       HEX   7800007C01007E03007F00001F00001F
            HEX   00007F00007E03007C01007800007001
            HEX   007803007C07007E01003E00003E0000
            HEX   7E01007C070078030070010060030070
            HEX   0700780F007C03007C00007C00007C03
            HEX   00780F00700700600300400700600F00
            HEX   701F0078070078010078010078070070
            HEX   1F00600F00400700000F00401F00603F
            HEX   00700F00700300700300700F00603F00
            HEX   401F00000F00001E00003F00407F0060
            HEX   1F00600700600700601F00407F00003F
            HEX   00001E00003C00007E00007F01403F00
            HEX   400F00400F00403F00007F01007E0000
            HEX   3C00
L9A42       HEX   7800007C01007E030078070060070060
            HEX   07007807007E03007C01007800007001
            HEX   007803007C0700700F00400F00400F00
            HEX   700F007C070078030070010060030070
            HEX   0700780F00601F00001F00001F00601F
            HEX   00780F00700700600300400700600F00
            HEX   701F00403F00003E00003E00403F0070
            HEX   1F00600F00400700000F00401F00603F
            HEX   00007F00007C00007C00007F00603F00
            HEX   401F00000F00001E00003F00407F0000
            HEX   7E01007801007801007E01407F00003F
            HEX   00001E00003C00007E00007F01007C03
            HEX   007003007003007C03007F01007E0000
            HEX   3C00
L9B14       HEX   7800007C01007E03007F07007F07004F
            HEX   07000707000202000000000000007001
            HEX   007803007C07007E0F007E0F001E0F00
            HEX   0E0E0004040000000000000060030070
            HEX   0700780F007C1F007C1F003C1E001C1C
            HEX   00080800000000000000400700600F00
            HEX   701F00783F00783F00783C0038380010
            HEX   1000000000000000000F00401F00603F
            HEX   00707F00707F00707900707000202000
            HEX   000000000000001E00003F00407F0060
            HEX   7F01607F016073016061014040000000
            HEX   00000000003C00007E00007F01407F03
            HEX   407F0340670340430300010100000000
            HEX   0000
L9BE6       HEX   0000000000000202000707004F07007F
            HEX   07007F07007E03007C01007800000000
            HEX   000000000404000E0E001E0F007E0F00
            HEX   7E0F007C070078030070010000000000
            HEX   00000808001C1C003C1E007C1F007C1F
            HEX   00780F00700700600300000000000000
            HEX   101000383800783C00783F00783F0070
            HEX   1F00600F004007000000000000002020
            HEX   00707000707900707F00707F00603F00
            HEX   401F00000F0000000000000040400060
            HEX   6101607301607F01607F01407F00003F
            HEX   00001E00000000000000000101404303
            HEX   406703407F03407F03007F01007E0000
            HEX   3C00
L9CB8       HEX   7800007C01007E00003F00001F00001F
            HEX   00003F00007E00007C01007800007001
            HEX   007803007C01007E00003E00003E0000
            HEX   7E00007C010078030070010060030070
            HEX   07007803007C01007C00007C00007C01
            HEX   00780300700700600300400700600F00
            HEX   70070078030078010078010078030070
            HEX   0700600F00400700000F00401F00600F
            HEX   00700700700300700300700700600F00
            HEX   401F00000F00001E00003F00401F0060
            HEX   0F00600700600700600F00401F00003F
            HEX   00001E00003C00007E00003F00401F00
            HEX   400F00400F00401F00003F00007E0000
            HEX   3C00
L9D8A       HEX   7800007C010078030070070060070060
            HEX   07007007007803007C01007800007001
            HEX   00780300700700600F00400F00400F00
            HEX   600F0070070078030070010060030070
            HEX   0700600F00401F00001F00001F00401F
            HEX   00600F00700700600300400700600F00
            HEX   401F00003F00003E00003E00003F0040
            HEX   1F00600F00400700000F00401F00003F
            HEX   00007E00007C00007C00007E00003F00
            HEX   401F00000F00001E00003F00007E0000
            HEX   7C01007801007801007C01007E00003F
            HEX   00001E00003C00007E00007C01007803
            HEX   007003007003007803007C01007E0000
            HEX   3C00

L9E5C       DA    LA1BC
            DA    LA0EA
            DA    L9F46
            DA    LA018
            DA    L9E74
            DA    LA28E
            DA    LA3A0
            DA    LA472
            DA    LA544
            DA    LA616
            DA    LA472
            DA    LA28E

L9E74       HEX   3000007C01007E030036030033060033
            HEX   06007F07000707007F07003603006000
            HEX   007803007C07006C0600660C00660C00
            HEX   7E0F000E0E007E0F006C060040010070
            HEX   0700780F00580D004C19004C19007C1F
            HEX   001C1C007C1F00580D00000300600F00
            HEX   701F00301B00183300183300783F0038
            HEX   3800783F00301B00000600401F00603F
            HEX   00603600306600306600707F00707000
            HEX   707F00603600000C00003F00407F0040
            HEX   6D00604C01604C01607F01606101607F
            HEX   01406D00001800007E00007F01005B01
            HEX   401903401903407F03404303407F0300
            HEX   5B01
L9F46       HEX   0000007C01007E03007B06003707007F
            HEX   07007F07000306007F07003307000000
            HEX   007803007C0700760D006E0E007E0F00
            HEX   7E0F00060C007E0F00660E0000000070
            HEX   0700780F006C1B005C1D007C1F007C1F
            HEX   000C18007C1F004C1D00000000600F00
            HEX   701F00583700383B00783F00783F0018
            HEX   3000783F00183B00000000401F00603F
            HEX   00306F00707600707F00707F00306000
            HEX   707F00307600000000003F00407F0060
            HEX   5E01606D01607F01607F01604001607F
            HEX   01606C01000000007E00007F01403D03
            HEX   405B03407F03407F03400103407F0340
            HEX   5903
LA018       HEX   3000007800003401003603007E030006
            HEX   03007E03004A02004A02004A02006000
            HEX   007001006802006C06007C07000C0600
            HEX   7C070014050014050014050040010060
            HEX   0300500500580D00780F00180C00780F
            HEX   00280A00280A00280A00000300400700
            HEX   200B00301B00701F00301800701F0050
            HEX   1400501400501400000600000F004016
            HEX   00603600603F00603000603F00202900
            HEX   202900202900000C00001E00002D0040
            HEX   6D00407F00406100407F004052004052
            HEX   00405200001800003C00005A00005B01
            HEX   007F01004301007F0100250100250100
            HEX   2501
LA0EA       HEX   7C01007E03007F07003306007F07007F
            HEX   07007F07000306007F07003306007803
            HEX   007C07007E0F00660C007E0F007E0F00
            HEX   7E0F00060C007E0F00660C0070070078
            HEX   0F007C1F004C19007C1F007C1F007C1F
            HEX   000C18007C1F004C1900600F00701F00
            HEX   783F00183300783F00783F00783F0018
            HEX   3000783F00183300401F00603F00707F
            HEX   00306600707F00707F00707F00306000
            HEX   707F00306600003F00407F00607F0160
            HEX   4C01607F01607F01607F01604001607F
            HEX   01604C01007E00007F01407F03401903
            HEX   407F03407F03407F03400103407F0340
            HEX   1903
LA1BC       HEX   0300004C01000202004A02004D05004D
            HEX   05000104000104004904003603000600
            HEX   001803000404001405001A0B001A0B00
            HEX   0208000208001209006C06000C000030
            HEX   0600080800280A003416003416000410
            HEX   00041000241200580D00180000600C00
            HEX   101000501400682C00682C0008200008
            HEX   2000482400301B003000004019002020
            HEX   00202900505900505900104000104000
            HEX   10490060360060000000330040400040
            HEX   52002033012033012000012000012012
            HEX   01406D00400100006600000101002501
            HEX   40660240660240000240000240240200
            HEX   5B01
LA28E       HEX   0000000000000000000000004C01004C
            HEX   01000000000000000000000000000000
            HEX   00000000000000000000180300180300
            HEX   00000000000000000000000000000000
            HEX   00000000000000003006003006000000
            HEX   00000000000000000000000000000000
            HEX   000000000000600C00600C0000000000
            HEX   00000000000000000000000000000000
            HEX   00000000401900401900000000000000
            HEX   00000000000000000000000000000000
            HEX   00000033000033000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00660000660000000000000000000000
            HEX   0000

LA360       HEX   00000000000002020003020003030201
            HEX   02000003010300030200010302010000
            HEX   02010303020201030100010301010201
            HEX   00010202010103020101030301010101

LA3A0       HEX   2801002801003A07003A07002A05006A
            HEX   05007A07002A05002A05002204005002
            HEX   00500200740E00740E00540A00540B00
            HEX   740F00540A00540A0044080020050020
            HEX   0500681D00681D00281500281700681F
            HEX   00281500281500081100400A00400A00
            HEX   503B00503B00502A00502E00503F0050
            HEX   2A00502A001022000015000015002077
            HEX   00207700205500205D00207F00205500
            HEX   205500204400002A00002A00406E0140
            HEX   6E01402A01403A01407E01402A01402A
            HEX   01400801005400005400005D03005D03
            HEX   005502007502007D0300550200550200
            HEX   1102
LA472       HEX   54000054000077020077020055020055
            HEX   02007F02005502005502001102002801
            HEX   002801006E05006E05002A05002A0500
            HEX   7E05002A05002A050022040050020050
            HEX   02005C0B005C0B00540A00540A007C0B
            HEX   00540A00540A00440800200500200500
            HEX   38170038170028150028150078170028
            HEX   1500281500081100400A00400A00702E
            HEX   00702E00502A00502A00702F00502A00
            HEX   502A00102200001500001500605D0060
            HEX   5D00205500205500605F002055002055
            HEX   00204400002A00002A00403B01403B01
            HEX   402A01402A01403F01402A01402A0140
            HEX   0801
LA544       HEX   2801002801003A07003A07002A05002A
            HEX   05007A07002A05002A05002204005002
            HEX   00500200740E00740E00540A00540A00
            HEX   740F00540A00540A0044080020050020
            HEX   0500681D00681D00281500281500681F
            HEX   00281500281500081100400A00400A00
            HEX   503B00503B00502A00502A00503F0050
            HEX   2A00502A001022000015000015002077
            HEX   00207700205500205500207F00205500
            HEX   205500204400002A00002A00406E0140
            HEX   6E01402A01402A01407E01402A01402A
            HEX   01400801005400005400005D03005D03
            HEX   005502005502007D0300550200550200
            HEX   1102
LA616       HEX   7C01007C01003306003306007F07007F
            HEX   07000306007F07007F07003306007803
            HEX   00780300660C00660C007E0F007E0F00
            HEX   060C007E0F007E0F00660C0070070070
            HEX   07004C19004C19007C1F007C1F000C18
            HEX   007C1F007C1F004C1900600F00600F00
            HEX   183300183300783F00783F0018300078
            HEX   3F00783F00183300401F00401F003066
            HEX   00306600707F00707F00306000707F00
            HEX   707F00306600003F00003F00604C0160
            HEX   4C01607F01607F01604001607F01607F
            HEX   01604C01007E00007E00401903401903
            HEX   407F03407F03400103407F03407F0340
            HEX   1903

            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $8E
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $55
            DB    $00
            DB    $00
            DB    $04
            DB    $02
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $90
            DB    $20
            DB    $85
            DB    $D4
            DB    $00
            DB    $95
            DB    $DC
            DB    $00
            DB    $97
            DB    $DD
            DB    $A2
            DB    $D7
            DB    $D5
            DB    $A2
            DB    $D5
            DB    $D4
            DB    $00
            DB    $95
            DB    $D4
            DB    $00
            DB    $95
            DB    $90
            DB    $00
            DB    $94
            DB    $00
            DB    $2A
            DB    $05
            DB    $10
            DB    $2A
            DB    $15
            DB    $40
            DB    $A4
            DB    $11
            DB    $40
            DB    $A2
            DB    $86
            DB    $50
            DB    $9A
            DB    $85
            DB    $00
            DB    $AE
            DB    $87
            DB    $00
            DB    $B2
            DB    $85
            DB    $00
            DB    $8A
            DB    $86
            DB    $00
            DB    $EC
            DB    $85
            DB    $00
            DB    $A8
            DB    $84
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $A0
            DB    $81
            DB    $00
            DB    $2A
            DB    $00
            DB    $40
            DB    $20
            DB    $00
            DB    $C0
            DB    $82
            DB    $00
            DB    $50
            DB    $0A
            DB    $00
            DB    $D4
            DB    $AE
            DB    $00
            DB    $54
            DB    $E3
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $54
            DB    $2A
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $50
            DB    $0A
            DB    $00
            DB    $C0
            DB    $82
            DB    $00
            DB    $40
            DB    $02
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $B8
            DB    $9D
            DB    $00
            DB    $D4
            DB    $AB
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $C8
            DB    $92
            DB    $00
            DB    $D0
            DB    $8A
            DB    $00
            DB    $90
            DB    $89
            DB    $00
            DB    $E0
            DB    $86
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $54
            DB    $0B
            DB    $00
            DB    $54
            DB    $0E
            DB    $00
            DB    $5C
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $B4
            DB    $00
            DB    $00
            DB    $92
            DB    $81
            DB    $00
            DB    $B2
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $92
            DB    $81
            DB    $00
            DB    $B8
            DB    $00
            DB    $00
            DB    $B8
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $E0
            DB    $81
            DB    $00
            DB    $E0
            DB    $81
            DB    $00
            DB    $F0
            DB    $82
            DB    $00
            DB    $F0
            DB    $82
            DB    $00
            DB    $F8
            DB    $86
            DB    $00
            DB    $E8
            DB    $87
            DB    $00
            DB    $EC
            DB    $8F
            DB    $00
            DB    $EE
            DB    $9F
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $B8
            DB    $81
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $81
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $80
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $81
            DB    $00
            DB    $F0
            DB    $00
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $4A
            DB    $04
            DB    $00
            DB    $2A
            DB    $05
            DB    $00
            DB    $6E
            DB    $05
            DB    $00
            DB    $2A
            DB    $1D
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $5B
            DB    $3B
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $5B
            DB    $3B
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            MX    %11
            DB    $A6
            DB    $E8
            DB    $D0
            DB    $1D
            DB    $20
            DB    $1E
            DB    $6D
            DB    $AA
            DB    $18
            DB    $F8
            DB    $A5
            DB    $53
            DB    $7D
            DB    $D4
            DB    $6C
            DB    $85
            DB    $53
            DB    $A5
            DB    $54
            DB    $69
            DB    $00
            DB    $85
            DB    $54
            DB    $D8
            DB    $20
            DB    $6A
            DB    $69
            DB    $20
            DB    $91
            DB    $70
            DB    $20
            DB    $61
            DB    $7C
            DB    $60
            DB    $00
            DB    $01
            DB    $03
            DB    $05
            DB    $05
            DB    $07
            DB    $07
            DB    $10
            DB    $10
            DB    $20
            DB    $20
            DB    $30
            DB    $30
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $A2
            DB    $01
            DB    $A9
            DB    $8F
            DB    $38
            DB    $E9
            DB    $01
            DB    $B0
            DB    $FB
            DB    $CA
            DB    $D0
            DB    $F6
            DB    $60
            DB    $60
            DB    $20
            DB    $FA
            DB    $58
            DB    $20
            DB    $80
            DB    $7D
            DB    $20
            DB    $9E
            DB    $69
            DB    $20
            DB    $80
            DB    $7D
            DB    $20
            DB    $A4
            DB    $79
            DB    $A0
            DB    $0B
            DB    $A2
            DB    $FF
            DB    $20
            DB    $E8
            DB    $6C
            DB    $88
            DB    $D0
            DB    $F8
            DB    $20
            DB    $55
            DB    $81
            DB    $E6
            DB    $55
            DB    $20
            DB    $1E
            DB    $53
            DB    $20
            DB    $59
            DB    $56
            DB    $20
            DB    $E6
            DB    $53
            DB    $4C
            DB    $0F
            DB    $53
            DB    $A5
            DB    $55
            DB    $C9
            DB    $0F
            DB    $90
            DB    $02
            DB    $A9
            DB    $0F
            DB    $60
            DB    $A5
            DB    $55
            DB    $C9
            DB    $15
            DB    $90
            DB    $02
            DB    $A9
            DB    $15
            DB    $60
            DB    $A5
            DB    $E0
            DB    $0A
            DB    $AA
            DB    $BD
            DB    $3F
            DB    $6D
            DB    $85
            DB    $70
            DB    $BD
            DB    $40
            DB    $6D
            DB    $85
            DB    $71
            DB    $60
            DB    $00
            DB    $00
            DB    $8B
            DB    $55
            DB    $7F
            DB    $5D
            DB    $8B
            DB    $55
            DB    $99
            DB    $5D
            DB    $A9
            DB    $00
            DB    $A2
            DB    $08
            DB    $95
            DB    $84
            DB    $95
            DB    $98
            DB    $95
            DB    $AC
            DB    $95
            DB    $C0
            DB    $85
            DB    $78
            DB    $85
            DB    $E4
            DB    $85
            DB    $E9
            DB    $A9
            DB    $02
            DB    $85
            DB    $68
            DB    $60
            DB    $A6
            DB    $55
            DB    $E0
            DB    $15
            DB    $B0
            DB    $3A
            DB    $A9
            DB    $04
            DB    $85
            DB    $E0
            DB    $20
            DB    $FC
            DB    $86
            DB    $A5
            DB    $79
            DB    $D0
            DB    $04
            DB    $A9
            DB    $01
            DB    $85
            DB    $78
            DB    $20
            DB    $12
            DB    $87
            DB    $C6
            DB    $E0
            DB    $D0
            DB    $EE
            DB    $A9
            DB    $02
            DB    $85
            DB    $68
            DB    $A9
            DB    $01
            DB    $85
            DB    $E4
            DB    $20
            DB    $27
            DB    $6D
            DB    $0A
            DB    $AA
            DB    $BD
            DB    $EF
            DB    $6D
            DB    $85
            DB    $E1
            DB    $BD
            DB    $F0
            DB    $6D
            DB    $85
            DB    $E2
            DB    $A9
            DB    $04
            DB    $85
            DB    $EA
            DB    $85
            DB    $EB
            DB    $A9
            DB    $01
            DB    $85
            DB    $E9
            DB    $20
            DB    $C1
            DB    $80
            DB    $60
            DB    $A4
            DB    $77
            DB    $C8
            DB    $A5
            DB    $E0
            DB    $C9
            DB    $01
            DB    $F0
            DB    $34
            DB    $C9
            DB    $03
            DB    $F0
            DB    $30
            DB    $A9
            DB    $01
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $00
            DB    $91
            DB    $75
            DB    $C8
            DB    $A5
            DB    $E0
            DB    $C9
            DB    $02
            DB    $F0
            DB    $06
            DB    $A9
            DB    $03
            DB    $91
            DB    $75
            DB    $D0
            DB    $04
            DB    $A9
            DB    $02
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $01
            DB    $91
            DB    $75
            DB    $C8
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $03
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $FF
            DB    $91
            DB    $75
            DB    $20
            DB    $12
            DB    $87
            DB    $60
            DB    $A9
            DB    $00
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $01
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $00
            DB    $91
            DB    $75
            DB    $F0
            DB    $DA
            DB    $60
            DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $C0
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $01
            DB    $50
            DB    $00
            DB    $50
            DB    $00
            DB    $40
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $FF
            DB    $FF
            DB    $B0
            DB    $00
            DB    $10
            DB    $00
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $B0
            DB    $00
            DB    $40
            DB    $00
            DB    $30
            DB    $00
            DB    $20
            DB    $00
            DB    $20
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $02
            DB    $00
            DB    $03
            DB    $02
            DB    $00
            DB    $03
            DB    $01
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $03
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $01
            DB    $03
            DB    $01

*--- End of Pac-Man
