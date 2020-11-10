*
* Swashbuckler
* (c) Stephenson
* (s) 2018, Brutal Deluxe Software
*
* This is the $0800..$1FFF area
* Called from T3 & T4 by previous stage
* A lot of unused areas here!
*

         mx    %11
         org   $0800
         lst   off
         dsk   swashbuckler
	
*----------------------------

* Zero page
* $4E: random value
* $E3: bit 7 - 0: HGR1, 1: HGR2
*      bit 6 - 0: left, 1: right (direction of player)
* $E9:
* $EB: sprite index
* $EC: which HGR page is active
*      bit 7 - 0: HGR1, 1: HGR2
* $ED: X-position (in bytes) of the player
* $F9: X start
* $FA: ?offset
* $FB: sprite width in bytes
* $FC: Y start
* $FD: Y end
* $FE: key pressed

zpRANDOM =     $4E
zpHPLAYER =    $E3
zpHGRACTIVE =  $EC
zpXPLAYER =    $ED
zpXSCREEN =    $F9
zpSPRWIDTH =   $FB
zpYBEGIN =     $FC
zpYEND   =     $FD
zpKEY    =     $FE

*----------------------------

KBD      EQU   $C000
KBDSTROBE EQU  $C010
SPKR     EQU   $C030
TXTCLR   EQU   $C050
TXTSET   EQU   $C051
MIXCLR   EQU   $C052
TXTPAGE1 EQU   $C054
TXTPAGE2 EQU   $C055
HIRES    EQU   $C057
VTAB     EQU   $FC22
HOME     EQU   $FC58
WAIT     EQU   $FCA8
CROUT    EQU   $FD8E
COUT     EQU   $FDED

*----------------------------

ptrLINEH HEX   0004080C1014181C0004080C1014181C
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

*----------

saveX    DB    $FF        ; save X
saveY    DB    $FF        ; save Y
         DB    $08
sprWIDTH DB    $00        ; width of a sprite in bytes
pageHGR  DB    $40        ; 20 or 40: HGR page
         DB    $0B
         DB    $8D
charFONT DB    $33        ; this is the char index we have to print
         DB    $08
         DB    $B9
         DB    $00
         DB    $08
         DB    $8D
         DB    $E4
         DB    $08
         DB    $8D

*--- X of sprites on screen

L08D0    DB    $1D        ; player
L08D1    DB    $02        ; foe 1
L08D2    DB    $1E        ; foe 2
L08D3    DB    $00        ; foe 3
L08D4    DB    $09        ; foe 4
         DB    $8D
         DB    $E3
L08D7    DB    $0B
L08D8    DB    $10
L08D9    DB    $0C
L08DA    DB    $12
         DB    $BD
         DB    $00
         DB    $0A
L08DE    DB    $12
         DB    $AD
         DB    $FF
         DB    $08
         DB    $5D
         DB    $A8
         DB    $23
         DB    $9D
         DB    $A8
         DB    $23
         DB    $AE
         DB    $FE
         DB    $08
         DB    $60
         DB    $A2
         DB    $00
         DB    $BC
         DB    $00
         DB    $40
         DB    $20
         DB    $C0
         DB    $08
         DB    $E8
         DB    $F0
         DB    $03
         DB    $4C
         DB    $02
         DB    $08
         DB    $60
         DB    $00
         DB    $00
         DB    $00
         DB    $A0
         DB    $40

*----------

ptrLINEL HEX   00000000000000008080808080808080
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

*----------

theSCORE HEX   1A00       ; score
theLIVES DB    $03        ; lives

L09C3    DB    $80
L09C4    DB    $C0
L09C5    DB    $0C
         DB    $6D
L09C7    DB    $00
L09C8    DB    $D2
L09C9    DB    $01
L09CA    DB    $00
L09CB    DB    $00
         DB    $04
L09CD    DB    $80
L09CE    DB    $00
L09CF    DB    $00
L09D0    DB    $00
L09D1    DB    $19
L09D2    DB    $1F
L09D3    DB    $21
L09D4    DB    $FE        ; index of sprite 5
L09D5    DB    $0E
L09D6    DB    $C0
L09D7    DB    $35
L09D8    DB    $19
L09D9    DB    $06
L09DA    DB    $00
L09DB    DB    $84
saveHPLAYER DB $C0
L09DD    DB    $0C
fgPLAY   DB    $FF        ; true: game on, false: game over
L09DF    DB    $00
         DB    $AC
         DB    $EE
         DB    $09
         DB    $20
         DB    $C0
         DB    $08
         DB    $60
         DB    $FE
         DB    $09
         DB    $EE
         DB    $FE
         DB    $09
         DB    $EE
         DB    $FE
         DB    $09
         DB    $EE
         DB    $FE
         DB    $09
         DB    $EE
         DB    $FE
         DB    $09
         DB    $EE
         DB    $FE
         DB    $09
         DB    $EE
         DB    $FE
         DB    $09
         DB    $4C
         DB    $DD
         DB    $09
         DB    $BF
         DB    $F8

*----------

drawSPRITE1 LDA #$20      ; draw HGR1
         STA   pageHGR
         JMP   L0A0D

drawSPRITE2 LDA #$40      ; draw HGR2
         STA   pageHGR

L0A0D    STX   saveX
         STY   saveY

         LDY   zpYBEGIN   ; from line Y
L0A15    LDA   ptrLINEH,Y
         CLC
         ADC   pageHGR
         STA   L0A35+2
         STA   L0A38+2
         LDA   ptrLINEL,Y
         STA   L0A35+1
         STA   L0A38+1
         LDA   zpSPRWIDTH
         STA   sprWIDTH
         LDX   zpXSCREEN
L0A32    LDA   $6CD7
L0A35    ORA   $5DA8,X
L0A38    STA   $5DA8,X
         INC   L0A32+1
         BNE   L0A43
         INC   L0A32+2
L0A43    INX
         DEC   sprWIDTH
         BNE   L0A32
         INY
         CPY   zpYEND     ; to end line
         BNE   L0A15
         LDX   saveX
         LDY   saveY
         RTS

*---------- Draw a sprite on screen

drawSPRITE STA $EB        ; sprite index
         ASL
         TAY
         LDA   tblSPRITES,Y
         STA   L0A71+1    ; get the pointer to its structure
         CLC
         ADC   #$04
         STA   L0A32+1    ; and to its data
         INY
         LDA   tblSPRITES,Y
         STA   L0A71+2
         STA   L0A32+2
         LDY   #$03       ; copy its structure
L0A71    LDA   $6C5B,Y
         STA   |$00FA,Y
         DEY
         BPL   L0A71
         SEC
         LDA   zpXSCREEN  ; offset on screen
         SBC   $FA        ; width in bytes
         STA   zpXSCREEN  ; save it
         BIT   zpHPLAYER  ; which HGR page?
         BPL   L0A8B
         JSR   drawSPRITE2
         JMP   L0A8E
L0A8B    JSR   drawSPRITE1
L0A8E    RTS

*----------

L0A8F    STA   $EF        ; save sprite
         JSR   L0B43

         BIT   zpHGRACTIVE ; which page is active?
         BMI   L0AB3      ; page 2, so draw on page 1

         LDA   #$80       ; we're on page 1
         ORA   zpHGRACTIVE ; next is page 2
         STA   zpHGRACTIVE
         LDA   TXTPAGE1   ; show HGR1
         LDA   #$80       ; draw on HGR2
         ORA   zpHPLAYER
         STA   zpHPLAYER
         JSR   clearHGR2  ; clear HGR2
         JSR   L0ACC      ; redraw sprites
         LDA   TXTPAGE2   ; and show the page
         JMP   L0ACB

L0AB3    LDA   zpHGRACTIVE ; we're on page 2
         AND   #$7F       ; next is page 1
         STA   zpHGRACTIVE
         LDA   TXTPAGE2   ; show HGR2
         LDA   zpHPLAYER  ; draw on HGR1
         AND   #$7F
         STA   zpHPLAYER
         JSR   clearHGR1  ; clear HGR1
         JSR   L0ACC      ; redraw sprites
         LDA   TXTPAGE1   ; and show the page
L0ACB    RTS

*---------- Draw all sprites?

L0ACC    JSR   L0C0C
         JSR   L1000      ; draw sprite 1
         JSR   L1013      ; draw sprite 2
         JSR   L1026      ; draw sprite 3
         JSR   L1039      ; draw sprite 4
         JSR   L104C      ; draw sprite 5
         RTS

*---------- Init game

initALL  LDA   #$03
         STA   theLIVES
         LDA   #$00
         STA   theSCORE
         STA   theSCORE+1
         STA   L09CB
         STA   L09DF
         STA   L09C5
         STA   L09D5
         STA   L09C4
         STA   L09D6
         STA   L08D1
         STA   L08D3
         STA   |$00E9
         STA   L09CD
         STA   L09CE
         STA   L09CF
         STA   L09D0
         LDA   #$1F
         STA   L08D0
         STA   L08D2
         LDA   #$FF
         STA   L09C3
         LDA   TXTCLR
         LDA   MIXCLR
         LDA   HIRES
         LDA   TXTPAGE1
         LDA   #$40       ; player looks right
         STA   zpHPLAYER
         LDA   #$08       ; sprite for player
         STA   $E8
         LDA   #$11       ; x-offset for player
         STA   zpXPLAYER
         LDA   #$1F
         STA   L09D2
         LDA   #$21
         STA   L09D3
         RTS

*---------- Check x-position of player

L0B43    LDA   #$04
         CMP   zpXPLAYER
         BCC   L0B4F
         LDA   #$05
         STA   zpXPLAYER
         BNE   L0B59
L0B4F    LDA   #$1C
         CMP   zpXPLAYER
         BCS   L0B59
         LDA   #$1C
         STA   zpXPLAYER
L0B59    SEC
         LDA   L08D0
         SBC   zpXPLAYER
         STA   L08D7
         SEC
         LDA   zpXPLAYER
         SBC   L08D1
         STA   L08D8
         SEC
         LDA   L08D2
         SBC   zpXPLAYER
         STA   L08D9
         SEC
         LDA   zpXPLAYER
         SBC   L08D3
         STA   L08DA
         LDA   #$02
         CMP   L08D7
         BCC   L0B90
         INC   L08D0
         LDA   L08D0
         CMP   #$1E
         BCC   L0B90
         DEC   zpXPLAYER
L0B90    LDA   L08D0
         CMP   #$07
         BCS   L0B9F
         LDA   #$07
         STA   L08D0
         JMP   L0BAB

L0B9F    LDA   L08D0
         CMP   #$1E
         BCC   L0BAB
         LDA   #$1E
         STA   L08D0
L0BAB    LDA   #$02
         CMP   L08D8
         BCC   L0BB9
         DEC   L08D1
         BNE   L0BB9
         INC   zpXPLAYER
L0BB9    LDA   L08D1
         BMI   L0BC2
         CMP   #$01
         BCS   L0BC5
L0BC2    INC   L08D1
L0BC5    LDA   L08D1
         BMI   L0BC2
         JMP   L0BD1

         INC              ; dead
         STA   L08D1      ; dead

L0BD1    LDA   #$02
         CMP   L08D9
         BCC   L0BE4
         INC   L08D2
         LDA   L08D2
         CMP   #$1E
         BCC   L0BE4
         DEC   zpXPLAYER
L0BE4    LDA   L08D2
         CMP   #$07
         BCS   L0BF3
         LDA   #$07
         STA   L08D2
         JMP   L0BFF

L0BF3    LDA   L08D2
         CMP   #$1E
         BCC   L0BFF
         LDA   #$1E
         STA   L08D2
L0BFF    LDA   L08D3
         CMP   #$21
         BCC   L0C0B
         LDA   #$21
         STA   L08D3
L0C0B    RTS

L0C0C    LDA   zpXPLAYER
         STA   zpXSCREEN
         LDA   $E8
         JSR   drawSPRITE
         RTS

*---------- Handle keypress

doKEYPRESS BIT KBD
         BPL   L0C69
L0C1B    LDA   KBD
         STA   zpKEY
         LDA   #$00
         STA   KBDSTROBE
         STA   L09CB
         LDA   zpKEY
         CMP   #"S"       ; Switch direction
         BNE   L0C4A
         BIT   zpHPLAYER  ; bit 6?
         BVC   L0C3D      ; is left turned?
         LDA   zpHPLAYER  ; no, turned right
         AND   #$BF       ; %1011_1111
         STA   zpHPLAYER  ; now looks left
         LDA   #$01       ; sprite 1
         JMP   L0C45

L0C3D    LDA   zpHPLAYER  ; force bit 6
         ORA   #$40       ; now looks right
         STA   zpHPLAYER
         LDA   #$08       ; sprite 8
L0C45    STA   $E8
         JSR   L0A8F      ; draw next frame

* BUG: keyboard value is not restored

L0C4A    CMP   #$C1       ; A
         BEQ   L0CAE
         CMP   #$C4       ; D
         BEQ   L0C7C
         CMP   #$C9       ; I
         BEQ   L0C72
         CMP   #$CA       ; J
         BEQ   L0C75
         CMP   #$CB       ; K
         BEQ   L0C78
         CMP   #$CC       ; L
         BEQ   L0C6C
         CMP   #$CD       ; M
         BEQ   L0C6F
L0C66    JSR   L0A8F
L0C69    INC   zpRANDOM   ; randomize
         RTS

L0C6C    JMP   L0D16
L0C6F    JMP   L0D45
L0C72    JMP   L0CE0
L0C75    JMP   L0CF2
L0C78    JMP   L0D04
         RTS

L0C7C    BIT   zpHPLAYER  ; bit 6?
         BVC   L0C97      ; player looks left?
         LDA   #$09       ; right
         STA   $E8
         JSR   L0A8F
         INC   zpXPLAYER
         LDA   #$0D
         STA   $E8
         JSR   L0A8F
         LDA   #$08
         STA   $E8
         JMP   L0C66

L0C97    LDA   #$07       ; left
         STA   $E8
         JSR   L0A8F
         INC   zpXPLAYER
         LDA   #$06
         STA   $E8
         JSR   L0A8F
         LDA   #$01
         STA   $E8
         JMP   L0C66

*--- A - Move player to the left

L0CAE    BIT   zpHPLAYER  ; bit 6?
         BVC   L0CC9      ; not set
         LDA   #$0D
         STA   $E8
         JSR   L0A8F      ; au repos
         DEC   zpXPLAYER  ; x--
         LDA   #$09
         STA   $E8
         JSR   L0A8F      ;
         LDA   #$08
         STA   $E8
         JMP   L0C66

L0CC9    LDA   #$06
         STA   $E8
         JSR   L0A8F
         DEC   zpXPLAYER
         LDA   #$07
         STA   $E8
         JSR   L0A8F
         LDA   #$01
         STA   $E8
         JMP   L0C66

L0CE0    BIT   zpHPLAYER  ; bit 6?
         BVC   L0CEB      ; not set
         LDA   #$0E
         STA   $E8
         JMP   L0C66

L0CEB    LDA   #$02
         STA   $E8
         JMP   L0C66

L0CF2    BIT   zpHPLAYER
         BVC   L0CFD
         LDA   #$0C
         STA   $E8
         JMP   L0C66

L0CFD    LDA   #$03
         STA   $E8
         JMP   L0C66

L0D04    BIT   zpHPLAYER
         BVC   L0D0F
         LDA   #$08
         STA   $E8
         JMP   L0C66

L0D0F    LDA   #$01
         STA   $E8
         JMP   L0C66

*----------

L0D16    LDA   L09C3
         BNE   L0D25
         LDY   #$5A
         STY   $50
         JSR   L0303      ; beep
         JMP   L0CF2

L0D25    BIT   zpHPLAYER
         BVC   L0D37
         LDA   #$09
         STA   $E8
         JSR   L0A8F
         LDA   #$0A
         STA   $E8
         JMP   L0C66

L0D37    LDA   #$07
         STA   $E8
         JSR   L0A8F
         LDA   #$04
         STA   $E8
         JMP   L0C66

L0D45    BIT   zpHPLAYER
         BVC   L0D50
         LDA   #$0B
         STA   $E8
         JMP   L0C66

L0D50    LDA   #$05
         STA   $E8
         JMP   L0C66

         DB    $0C
         DB    $50
         DB    $07
         DB    $A9
         DB    $0B
         DB    $85
         DB    $E8
         DB    $4C
         DB    $77
         DB    $0C
         DB    $A9
         DB    $05
         DB    $85
         DB    $E8
         DB    $4C
         DB    $77
         DB    $0C
         DB    $9D
         DB    $28
         DB    $3F
         DB    $9D
         DB    $A8
         DB    $23
         DB    $9D
         DB    $A8
         DB    $27
         DB    $9D
         DB    $A8
         DB    $2B
         DB    $9D
         DB    $A8
         DB    $2F
         DB    $9D
         DB    $A8
         DB    $33
         DB    $9D
         DB    $A8
         DB    $37
         DB    $9D
         DB    $A8
         DB    $3B
         DB    $9D
         DB    $A8
         DB    $3F
         DB    $9D
         DB    $50
         DB    $20
         DB    $9D
         DB    $50
         DB    $24
         DB    $9D
         DB    $50
         DB    $28
         DB    $9D
         DB    $50
         DB    $2C
         DB    $9D
         DB    $50
         DB    $30
         DB    $9D
         DB    $50
         DB    $34
         DB    $9D
         DB    $50
         DB    $38
         DB    $9D
         DB    $50
         DB    $3C
         DB    $9D
         DB    $D0
         DB    $20
         DB    $9D
         DB    $D0
         DB    $24
         DB    $9D
         DB    $D0
         DB    $28
         DB    $9D
         DB    $D0
         DB    $2C
         DB    $9D
         DB    $D0
         DB    $30
         DB    $9D
         DB    $D0
         DB    $34
         DB    $9D
         DB    $D0
         DB    $38
         DB    $9D
         DB    $D0
         DB    $3C
         DB    $9D
         DB    $50
         DB    $21
         DB    $9D
         DB    $50
         DB    $25
         DB    $9D
         DB    $50
         DB    $29
         DB    $9D
         DB    $50
         DB    $2D
         DB    $9D
         DB    $50
         DB    $31
         DB    $9D
         DB    $50
         DB    $35
         DB    $9D
         DB    $50
         DB    $39
         DB    $9D
         DB    $50
         DB    $3D
         DB    $9D
         DB    $D0
         DB    $21
         DB    $9D
         DB    $D0
         DB    $25
         DB    $9D
         DB    $D0
         DB    $29
         DB    $9D
         DB    $D0
         DB    $2D
         DB    $9D
         DB    $D0
         DB    $31
         DB    $9D
         DB    $D0
         DB    $35
         DB    $9D
         DB    $D0
         DB    $39
         DB    $9D
         DB    $D0
         DB    $3D
         DB    $9D
         DB    $50
         DB    $22
         DB    $9D
         DB    $50
         DB    $26
         DB    $9D
         DB    $50
         DB    $2A
         DB    $9D
         DB    $50
         DB    $2E
         DB    $50
         DB    $2E
         DB    $9D
         DB    $50
         DB    $32
         DB    $9D
         DB    $50
         DB    $36
         DB    $9D
         DB    $50
         DB    $3A
         DB    $9D
         DB    $50
         DB    $3E
         DB    $9D
         DB    $D0
         DB    $22

*---------- Clear HGR1

clearHGR1 LDA  #$00
         LDX   #$27
L0E04    STA   $2028,X
         STA   $2428,X
         STA   $2828,X
         STA   $2C28,X
         STA   $3028,X
         STA   $3428,X
         STA   $3828,X
         STA   $3C28,X
         STA   $20A8,X
         STA   $24A8,X
         STA   $28A8,X
         STA   $2CA8,X
         STA   $30A8,X
         STA   $34A8,X
         STA   $38A8,X
         STA   $3CA8,X
         STA   $2128,X
         STA   $2528,X
         STA   $2928,X
         STA   $2D28,X
         STA   $3128,X
         STA   $3528,X
         STA   $3928,X
         STA   $3D28,X
         STA   $21A8,X
         STA   $25A8,X
         STA   $29A8,X
         STA   $2DA8,X
         STA   $31A8,X
         STA   $35A8,X
         STA   $39A8,X
         STA   $3DA8,X
         STA   $2228,X
         STA   $2628,X
         STA   $2A28,X
         STA   $2E28,X
         STA   $3228,X
         STA   $3628,X
         STA   $3A28,X
         STA   $3E28,X
         STA   $22A8,X
         STA   $26A8,X
         STA   $2AA8,X
         STA   $2EA8,X
         STA   $32A8,X
         STA   $36A8,X
         STA   $3AA8,X
         STA   $3EA8,X
         STA   $2328,X
         STA   $2728,X
         STA   $2B28,X
         STA   $2F28,X
         STA   $3328,X
         STA   $3728,X
         STA   $3B28,X
         STA   $3F28,X
         STA   $23A8,X
         STA   $27A8,X
         STA   $2BA8,X
         STA   $2FA8,X
         STA   $33A8,X
         STA   $37A8,X
         STA   $3BA8,X
         STA   $3FA8,X
         DEX
         BPL   L0EC8
         RTS
L0EC8    JMP   L0E04

         DB    $00
         DB    $2A
         DB    $9D
         DB    $28
         DB    $2E
         DB    $9D
         DB    $28
         DB    $32
         DB    $9D
         DB    $28
         DB    $36
         DB    $9D
         DB    $28
         DB    $3A
         DB    $9D
         DB    $28
         DB    $3E
         DB    $9D
         DB    $A8
         DB    $22
         DB    $9D
         DB    $A8
         DB    $26
         DB    $9D
         DB    $A8
         DB    $2A
         DB    $9D
         DB    $A8
         DB    $2E
         DB    $9D
         DB    $A8
         DB    $32
         DB    $9D
         DB    $A8
         DB    $36
         DB    $9D
         DB    $A8
         DB    $3A
         DB    $9D
         DB    $A8
         DB    $3E
         DB    $9D
         DB    $28
         DB    $22
         DB    $9D
         DB    $28
         DB    $26
         DB    $9D
         DB    $28
         DB    $2A
         DB    $9D
         DB    $28
         DB    $2C

*---------- Clear HGR2

clearHGR2 LDA  #$00
         LDX   #$27
L0F04    STA   $4028,X
         STA   $4428,X
         STA   $4828,X
         STA   $4C28,X
         STA   $5028,X
         STA   $5428,X
         STA   $5828,X
         STA   $5C28,X
         STA   $40A8,X
         STA   $44A8,X
         STA   $48A8,X
         STA   $4CA8,X
         STA   $50A8,X
         STA   $54A8,X
         STA   $58A8,X
         STA   $5CA8,X
         STA   $4128,X
         STA   $4528,X
         STA   $4928,X
         STA   $4D28,X
         STA   $5128,X
         STA   $5528,X
         STA   $5928,X
         STA   $5D28,X
         STA   $41A8,X
         STA   $45A8,X
         STA   $49A8,X
         STA   $4DA8,X
         STA   $51A8,X
         STA   $55A8,X
         STA   $59A8,X
         STA   $5DA8,X
         STA   $4228,X
         STA   $4628,X
         STA   $4A28,X
         STA   $4E28,X
         STA   $5228,X
         STA   $5628,X
         STA   $5A28,X
         STA   $5E28,X
         STA   $42A8,X
         STA   $46A8,X
         STA   $4AA8,X
         STA   $4EA8,X
         STA   $52A8,X
         STA   $56A8,X
         STA   $5AA8,X
         STA   $5EA8,X
         STA   $4328,X
         STA   $4728,X
         STA   $4B28,X
         STA   $4F28,X
         STA   $5328,X
         STA   $5728,X
         STA   $5B28,X
         STA   $5F28,X
         STA   $43A8,X
         STA   $47A8,X
         STA   $4BA8,X
         STA   $4FA8,X
         STA   $53A8,X
         STA   $57A8,X
         STA   $5BA8,X
         STA   $5FA8,X
         DEX
         BPL   L0FC8
         RTS
L0FC8    JMP   L0F04

         DB    $9D
         DB    $04
         DB    $10
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $E0
         DB    $FC
         DB    $D0
         DB    $F2
         DB    $AD
         DB    $FF
         DB    $0F
         DB    $8D
         DB    $00
         DB    $10
         DB    $60
         DB    $20
         DB    $10
         DB    $0F
         DB    $20
         DB    $20
         DB    $0F
         DB    $20
         DB    $30
         DB    $0F
         DB    $20
         DB    $C0
         DB    $0F
         DB    $20
         DB    $70
         DB    $0F
         DB    $20
         DB    $90
         DB    $0F
         DB    $20
         DB    $10
         DB    $0F
         DB    $20
         DB    $20
         DB    $0F
         DB    $20
         DB    $30
         DB    $0F
         DB    $60
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $71

*---------- Draw all sprites

L1000    LDA   L08D0      ; 1000
L1003    STA   zpXSCREEN
         LDA   L08DE
         BIT   |$00E9
         BMI   L100F
         LDA   #$10
L100F    JSR   drawSPRITE
         RTS

L1013    LDA   L08D1
         STA   zpXSCREEN
         LDA   L09D1
         BIT   L09CD
         BMI   L1022
         LDA   #$10
L1022    JSR   drawSPRITE
         RTS

L1026    LDA   L08D2
         STA   zpXSCREEN
         LDA   L09D2
         BIT   L09CE
         BMI   L1035
         LDA   #$10
L1035    JSR   drawSPRITE
         RTS

L1039    LDA   L08D3
         STA   zpXSCREEN
         LDA   L09D3
         BIT   L09CF
         BMI   L1048
         LDA   #$10
L1048    JSR   drawSPRITE
         RTS

L104C    LDA   L08D4
         STA   zpXSCREEN
         LDA   L09D4
         BIT   L09D0
         BMI   L105B
         LDA   #$10
L105B    JSR   drawSPRITE
         RTS

*----------

L105F    BIT   |$00E9
         BPL   L10E1
         BVC   L106E
         LDA   #$17
         STA   L08DE
         JMP   L10E1
L106E    JMP   L15DA

L1071    BIT   L09C4
         BMI   L10AB
         LDA   L09C5
         CMP   #$05
         BCS   L1091
         LDY   zpRANDOM
         LDA   L1D00,Y
         CMP   #$30
         BCS   L10AE
L1086    LDA   #$80
         ORA   L09C4
         STA   L09C4
         JMP   L10A1

L1091    LDY   zpRANDOM
         LDA   L1D00,Y
         CMP   #$20
         BCC   L10AE
         CMP   #$40
         BCC   L1086
         JMP   L10AE

L10A1    BIT   |$00E9
         BPL   L10E1
         BIT   L09C4
         BPL   L10AE
L10AB    JMP   L1209

L10AE    LDY   zpRANDOM
         LDA   L1D00,Y
         STA   $EB        ; sprite
         AND   #$07
         TAY
         LDA   L1E00,Y
         STA   L08DE
         LDA   $EB
         CMP   #$E6
         BCS   L10CB
         CMP   #$64
         BCC   L10D6
         JMP   L10DE

L10CB    INC   L08D0
         LDA   #$11
         STA   L08DE
         JMP   L10DE

L10D6    DEC   L08D0
         LDA   #$11
         STA   L08DE
L10DE    JSR   L0A8F
L10E1    RTS

*----------

L10E2    BIT   zpHPLAYER
         BVC   L10F9
         JSR   L165D
         LDA   $E8
         CMP   #$0A
         BEQ   L10FF
         CMP   #$0C
         BEQ   L10F6
         JMP   L1208
L10F6    JMP   L1167

L10F9    JSR   L1680
         JMP   L138B

L10FF    BIT   |$00E9
         BPL   L114C
         BVS   L114C
         LDA   L08D7
         CMP   #$0D
         BCS   L114C
         LDA   L08DE
         CMP   #$11
         BEQ   L1164
         LDA   #$09
         CMP   L08D7
         BCC   L114C
L111B    LDA   #$16
         STA   L08DE
         INC   L09C5
         JSR   L0A8F
         JSR   L11C7
         JSR   L11D1
         JSR   L11F1
         LDA   #$17
         STA   L08DE
         LDA   #$0E
         STA   $E8
         JSR   L0A8F
         LDA   |$00E9
         ORA   #$40
         STA   |$00E9
         JSR   L11FE
         JSR   L11E1
         JSR   L114F
L114C    JMP   L1208

L114F    NOP
         NOP
         NOP
         NOP
         LDA   theSCORE
         CMP   #$17
         BNE   L115D
         INC   theLIVES   ; new lives
L115D    JSR   L1854
         RTS

         NOP
         NOP
         RTS
L1164    JMP   L1186

L1167    BIT   |$00E9
         BPL   L114C
         BVS   L114C
         LDA   L08D7
         CMP   #$0A
         BCS   L114C
         LDA   L08DE
         CMP   #$11
         BEQ   L1186
         LDA   #$05
         CMP   L08D7
         BCC   L114C
         JMP   L111B

L1186    LDX   #$3C
         STX   $50
         JSR   L0303
         INC   zpRANDOM
         INC   L09CB
         INC   L08D0
         LDA   L09CB
         CMP   #$01
         BEQ   L11C4
         LDA   #$08
         CMP   L09C5
         BCS   L11C4
         DEC   L08D0
         JSR   L1261
         JSR   L0A8F
L11AC    BIT   KBD
         BMI   L11C1
         JSR   L143B
         INC   zpRANDOM
         BNE   L11AC
         DEC   L08D0
         JSR   L1261
         JSR   L0A8F
L11C1    JMP   L0C1B
L11C4    JMP   L1208

L11C7    LDA   #$96
         STA   $50
         LDX   #$64
         JSR   L0303
         RTS

*---------- Wait

L11D1    LDA   #$05
         STA   L09CA
L11D6    LDA   #$FF
         JSR   WAIT
         DEC   L09CA
         BNE   L11D6
         RTS

*---------- Wait

L11E1    LDA   #$02
         STA   L09CA
L11E6    LDA   #$FF
         JSR   WAIT
         DEC   L09CA
         BNE   L11E6
         RTS

L11F1    CLC
         INC   theSCORE
         BCC   L11FA
         INC   theSCORE+1
L11FA    JMP   L1B76      ; next level
         RTS

*---------- Play sound

L11FE    LDA   #$1E
         STA   $50
         LDY   #$1E
         JSR   L0303
         RTS
L1208    RTS

L1209    BIT   L09C4
         BVS   L121E
         LDA   #$40
         ORA   L09C4
         STA   L09C4
         JSR   L1252
         LDA   #$08
         STA   L09C9
L121E    DEC   L09C9
         BNE   L122E
         LDA   #$BF
         AND   L09C4
         STA   L09C4
         JMP   L10AE

L122E    LDY   L09C7
         LDA   L1E80,Y
         STA   L09C8
         AND   #$1F
         STA   L08DE
         BIT   L09C8
         BPL   L124C
         BVC   L1249
         DEC   L08D0
         JMP   L124C

L1249    INC   L08D0
L124C    DEC   L09C7
         JMP   L10DE

L1252    LDY   zpRANDOM
         LDA   L1D00,Y
         AND   #$07
         TAY
         LDA   L1E40,Y
         STA   L09C7
         RTS

*----------

L1261    BIT   |$00E9
         BPL   L1280
         BVS   L1280
         LDA   L08DE
         CMP   #$11
         BNE   L1272
         JMP   L1281

L1272    CMP   #$13
         BNE   L1279
         JMP   L12D6      ; is player hit?

L1279    CMP   #$14
         BNE   L1280
         JMP   L131D
L1280    RTS

L1281    LDA   L08D7
         CMP   #$04
         BCC   L12D0
         CMP   #$06
         BCS   L129A
         LDA   $E8
         CMP   #$0A
         BEQ   L12D0      ; I'm hit!
         CMP   #$08
         BEQ   L12D3
         CMP   #$0C
         BEQ   L12D3
L129A    LDA   L08D7
         CMP   #$07
         BCS   L12AF
         LDA   $E8
         CMP   #$08
         BEQ   L12D3
         CMP   #$0A
         BEQ   L12D3
         CMP   #$0C
         BEQ   L12D3
L12AF    LDA   L08D7
         CMP   #$0A
         BCS   L12C0
         LDA   $E8
         CMP   #$0A
         BEQ   L1333
         CMP   #$0C
         BEQ   L1333
L12C0    LDA   L08D7
         CMP   #$0E
         BCS   L1280
         LDA   $E8
         CMP   #$0A
         BNE   L1280
         JMP   L1333

L12D0    JMP   playerHIT  ; player is hit!
L12D3    JMP   L1333

L12D6    LDA   L08D7
         CMP   #$03
         BCS   L12E6
         LDA   $E8
         CMP   #$0E
         BEQ   L12E6
         JMP   playerHIT  ; player is hit!

L12E6    LDA   L08D7
         CMP   #$04
         BCS   L12FA
         LDA   $E8
         CMP   #$08
         BCS   L12FA
         CMP   #$04
         BEQ   L12FA
         JMP   playerHIT

L12FA    LDA   L08D7
         CMP   #$05
         BCS   L130A
         LDA   $E8
         CMP   #$0E
         BNE   L130A
         JMP   L1333

L130A    LDA   L08D7
         CMP   #$06
         BCS   L131A
         LDA   $E8
         CMP   #$0A
         BNE   L131A
         JMP   playerHIT
L131A    JMP   L1280

L131D    LDA   L08D7
         CMP   #$05
         BCS   L1330
         LDA   #$00
         STA   L09C3
         LDX   #$5A
         STX   $50
         JSR   L0303
L1330    JMP   L1280

L1333    LDX   #$3C
         STX   $50
         JSR   L0303
         INC   L08D0
         JMP   L1280

*---------- Player is hit

playerHIT LDA  #$0F       ; show sprite HIT
         STA   $E8
         JSR   L0A8F
         JSR   L1381      ; play sound
         JSR   L11D1      ; wait
         LDA   #$00       ; show sprite DEAD
         STA   $E8
         STA   L09DF
         JSR   L0A8F
         JSR   L11FE      ; play sound
         LDA   #$80
         STA   L09C3
         JSR   L11E1      ; wait
         JSR   L136B      ; go die
         JSR   showALL
         JMP   L180D

L136B    DEC   theLIVES   ; lives--
         BEQ   L1374
         NOP
         NOP
         NOP
         RTS

L1374    LDX   #$FF       ; i'm dead
         STX   $50
         JSR   L0303
         LDA   #$00       ; game over
         STA   fgPLAY
         RTS

L1381    LDA   #$28       ; ouch sound
         STA   $50
         LDX   #$C8
         JSR   L0303
         RTS

L138B    BIT   L09CD
         BPL   L13FC
         BVS   L13FC
         LDA   $E8
         CMP   #$04
         BNE   L13A9
         LDA   L08D8
         CMP   #$09
         BCS   L13A2
         JMP   L1402

L13A2    CMP   #$0C
         BCS   L13FC
         JMP   L13BB

L13A9    CMP   #$03
         BNE   L13FC
         LDA   L08D8
         CMP   #$06
         BCS   L13B7
         JMP   L1402

L13B7    CMP   #$07
         BCS   L1433
L13BB    LDX   #$3C
         STX   $50
         JSR   L0303
         INC   zpRANDOM
         INC   L09CB
         DEC   L08D1
         LDA   L09CB
         CMP   #$01
         BEQ   L13FF
         LDA   #$08
         CMP   L09C5
         BCS   L13FF
         INC   L08D1
         JSR   L14E4
         JSR   L0A8F
L13E1    BIT   KBD
         BMI   L13F6
         JSR   L143B
         INC   zpRANDOM
         BNE   L13E1
         INC   L08D1
         JSR   L14E4
         JSR   L0A8F
L13F6    JMP   L0C1B
         JMP   L1437
L13FC    JMP   L1433
L13FF    JMP   L1433

L1402    LDA   #$1D
         STA   L09D1
         INC   L09D5
         JSR   L0A8F
         JSR   L11C7
         JSR   L11D1
         JSR   L11F1
         LDA   #$1E
         STA   L09D1
         LDA   #$02
         STA   $E8
         JSR   L0A8F
         LDA   L09CD
         ORA   #$40
         STA   L09CD
         JSR   L11FE
         JSR   L11E1
         JSR   L114F
L1433    RTS

         NOP
         NOP
         NOP
L1437    NOP
         NOP
         NOP
         RTS

L143B    JSR   L1454
         JSR   L14E4
         JSR   L14A5
         JSR   L1537
         NOP
         NOP
         NOP
         JSR   L154A
         JSR   L14E0
         JSR   L157B
         RTS

*----------

L1454    BIT   L09CD
         BPL   L14A4
         BVC   L1463
         LDA   #$1E
         STA   L09D1
         JMP   L14A4
L1463    JMP   L161C

L1466    BIT   L09D6
         BPL   L146E
         JMP   L157F

L146E    LDY   zpRANDOM
         LDA   L1D00,Y
         STA   $EB
         AND   #$07
         ORA   #$08
         TAY
         LDA   L1E00,Y
         STA   L09D1
         LDA   $EB
         CMP   #$5A
         BCS   L148D
         LDA   #$80
         STA   L09D6
         LDA   $EB
L148D    CMP   #$E6
         BCS   L1498
         CMP   #$50
         BCS   L149E
         JMP   L14A1

L1498    INC   L08D1
         JMP   L14A1

L149E    DEC   L08D1
L14A1    JSR   L0A8F
L14A4    RTS

*----------

L14A5    BIT   L09CE
         BPL   L14C1
         LDA   L09D2
         CMP   #$1F
         BEQ   L14B9
         LDA   #$1F
         STA   L09D2
         JMP   L14C1

L14B9    LDA   #$20
         STA   L09D2
         DEC   L08D2
L14C1    RTS

L14C2    BIT   L09CF
         BPL   L14DE
         LDA   L09D3
         CMP   #$21
         BEQ   L14D6
         LDA   #$21
         STA   L09D3
         JMP   L14DE

L14D6    LDA   #$22
         STA   L09D3
         INC   L08D3
L14DE    RTS
         RTS

L14E0    NOP
         NOP
         NOP
         RTS

*----------

L14E4    BIT   L09CD
         BPL   L1519
         BVS   L1519
         LDA   L09D1
         CMP   #$1B
         BNE   L14F5
         JMP   L151A

L14F5    CMP   #$1C
         BEQ   L1524
         LDA   L08D8
         CMP   #$04
         BCC   L1534
L1500    CMP   #$09       ; difficulty?
         BCS   L1519
         LDA   $E8
         CMP   #$08
         BCS   L1519
         CMP   #$02
         BEQ   L1519
         CMP   #$05
         BEQ   L1519
L1512    LDX   #$3C
         STX   $50
         JSR   L0303
L1519    RTS

L151A    LDA   L08D8
         CMP   #$05
         BCC   L1534
         JMP   L1519

L1524    LDA   L08D8
         CMP   #$05
         BCS   L1519
         LDA   $E8
         CMP   #$05
         BEQ   L1512
         JMP   L1534
L1534    JMP   playerHIT

*----------

L1537    BIT   L09CE
         BPL   L1546
         LDA   #$05
         CMP   L08D9
         BCC   L1546
         JMP   playerHIT
L1546    RTS

         NOP
         NOP
         RTS

*----------

L154A    BIT   L09CF
         BPL   L1577
         LDA   #$04
         CMP   L08DA
         BCC   L1577
         LDA   #$00
         STA   L09C3
         LDX   #$5A
         STX   $50
         JSR   L0303
         LDA   #$00
         STA   L09CF
         STA   L08D3
         INC   L09DF
         LDA   L09DF
         CMP   #$04
         BCC   L1577
         JMP   playerHIT
L1577    RTS

         NOP
         NOP
         RTS

L157B    NOP
         NOP
         NOP
         RTS

L157F    NOP
         NOP
         NOP
         BIT   L09D6
         BVS   L1597
         LDA   #$40
         ORA   L09D6
         STA   L09D6
         JSR   L15CB
         LDA   #$08
         STA   L09D9
L1597    DEC   L09D9
         BNE   L15A7
         LDA   #$BF
         AND   L09D6
         STA   L09D6
         JMP   L146E

L15A7    LDY   L09D7
         LDA   L1E80,Y
         STA   L09D8
         AND   #$1F
         STA   L09D1
         BIT   L09D8
         BPL   L15C5
         BVC   L15C2
         INC   L08D1
         JMP   L15C5

L15C2    DEC   L08D1
L15C5    DEC   L09D7
         JMP   L14A1

L15CB    LDY   zpRANDOM
         LDA   L1D00,Y
         AND   #$07
         TAY
         LDA   L1E48,Y
         STA   L09D7
         RTS

L15DA    BIT   L09DA
         BMI   L1606
         LDA   L09C5
         CMP   #$20
         BCS   L1615
         CMP   #$0C
         BCS   L15FE
         CMP   #$02
         BCS   L15F6
         LDA   #$86
         STA   L09DA
         JMP   L1618

L15F6    LDA   #$84
         STA   L09DA
         JMP   L1618

L15FE    LDA   #$82
         STA   L09DA
         JMP   L1618

L1606    DEC   L09DA
         LDA   #$80
         CMP   L09DA
         BNE   L1618
         LDA   #$00
         STA   L09DA
L1615    JMP   L1071
L1618    JMP   L10DE
         RTS

L161C    BIT   L09DB
         BMI   L1648
         LDA   L09D5
         CMP   #$19
         BCS   L1657
         CMP   #$08
         BCS   L1638
         CMP   #$02
         BCS   L1640
         LDA   #$86
         STA   L09DB
         JMP   L165A

L1638    LDA   #$84
         STA   L09DB
         JMP   L165A

L1640    LDA   #$82
         STA   L09DB
         JMP   L165A

L1648    DEC   L09DB
         LDA   #$80
         CMP   L09DB
         BNE   L165A
         LDA   #$00
         STA   L09DB
L1657    JMP   L1466
L165A    JMP   L14A1

L165D    BIT   L09CE
         BPL   L167F
         LDA   $E8
         CMP   #$0B
         BNE   L167F
         LDA   #$06
         CMP   L08D9
         BCC   L167F
         JSR   L11C7
         JSR   L11F1
         LDA   #$00
         STA   L09CE
         LDA   #$23
         STA   L08D2
L167F    RTS

L1680    BIT   L09CF
         BPL   L169D
         LDA   $E8
         CMP   #$05
         BNE   L169D
         LDA   #$05
         CMP   L08DA
         BCC   L169D
         JSR   L11C7
         LDA   #$00
         STA   L09CF
         STA   L08D3
L169D    RTS

*--- Dead data

         DB    $D4
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $D3
         DB    $D3
         DB    $D3
         DB    $D1
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $D2
         DB    $D3
         DB    $D1
         DB    $D3
         DB    $A9
         DB    $11
         DB    $8D
         DB    $DE
         DB    $08
         DB    $A9
         DB    $24
         DB    $8D
         DB    $D0
         DB    $08
         DB    $A9
         DB    $80
         DB    $85
         DB    $E9
         DB    $4C
         DB    $03
         DB    $18
         DB    $8D
         DB    $10
         DB    $C0
         DB    $8D
         DB    $CB
         DB    $09
         DB    $60
         DB    $15
         DB    $15
         DB    $12
         DB    $12
         DB    $12
         DB    $13
         DB    $15
         DB    $13
         DB    $13
         DB    $11
         DB    $14
         DB    $15
         DB    $15
         DB    $12
         DB    $11
         DB    $12
         DB    $13
         DB    $12
         DB    $15
         DB    $11
         DB    $13
         DB    $13
         DB    $11
         DB    $14
         DB    $14
         DB    $14
         DB    $13
         DB    $14
         DB    $12
         DB    $13
         DB    $12
         DB    $13
         DB    $12
         DB    $15
         DB    $12
         DB    $13
         DB    $15
         DB    $13
         DB    $12
         DB    $13
         DB    $A9
         DB    $24
         DB    $8D
         DB    $D0
         DB    $08
         DB    $A9
         DB    $80
         DB    $85
         DB    $E9
         DB    $4C
         DB    $03
         DB    $18
         DB    $15
         DB    $13
         DB    $12
         DB    $12

*---------- Pointer to sprites
* The first 4 bytes are copied to $FA..$FD

tblSPRITES DA  $7B06      ; 00 player is dead
         DA    $6000      ; 01 player left
         DA    $6184      ; 02 "
         DA    $6348      ; 03 "
         DA    $655B      ; 04 "
         DA    $67CF      ; 05 "
         DA    $6953      ; 06 "
         DA    $6AD7      ; 07 "
         DA    $6C5B      ; 08 player right
         DA    $6DEE      ; 09 "
         DA    $6F72      ; 0A "
         DA    $7246      ; 0B "
         DA    $73CA      ; 0C "
         DA    $763E      ; 0D "
         DA    $77BE      ; 0E "
         DA    $7982      ; 0F " is wounded
         DA    $7C10      ; 10 empty
         DA    $8000      ; 11 foe right
         DA    $81E4      ; 12 "
         DA    $8418      ; 13 "
         DA    $864C      ; 14 "
         DA    $8830      ; 15 "
         DA    $8A14      ; 16 "
         DA    $8C48      ; 17 " is dead
         DA    $8D3D      ; 18 foe left
         DA    $8F0E      ; 19 "
         DA    $90DF      ; 1A "
         DA    $92B0      ; 1B "
         DA    $9480      ; 1C "
         DA    $9666      ; 1D "
         DA    $97DB      ; 1E " is dead
         DA    $9858      ; 1F animal right
         DA    $98EC      ; 20 "
         DA    $9980      ; 21 animal left
         DA    $9A14      ; 22 "
         DA    $9AA8      ; The rest is... nothing
         DA    $0424
         DA    $0919
         DA    $110E
         DA    $1904
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $0115
         DA    $080A
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $0424
         DA    $0919
         DA    $110E
         DA    $1904
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $0115
         DA    $080A
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50
         DA    $8C50

*----------

playGAME JSR   initALL    ; init all
         LDA   #$FF
         STA   fgPLAY     ; game is active
         LDA   #$80
         STA   |$00E9

L180D    LDA   #$00
         STA   L08D1
         STA   L09CE
         STA   L09CF
         STA   L08D3
         LDA   #$20
         STA   L08D0
         STA   L08D2
         LDA   #$10       ; x-pos of player
         STA   zpXPLAYER

*--- The main game loop

L1827    JSR   doKEYPRESS
         JSR   L105F
         JSR   L19D5
         JSR   L1454      ;
         JSR   L14A5      ;
         JSR   L14C2      ;
         JSR   L10E2      ;
         JSR   L1261      ;
         JSR   L14E4      ;
         JSR   L1537      ;
         JSR   L154A      ;
         LDA   fgPLAY     ; am I dead
         BNE   L1827      ; for real?
         RTS              ; yes!

*--- Dead code

         JMP   L1827

         NOP
         NOP
         NOP
L1854    NOP
         LDA   theSCORE+1
         BEQ   L185D
         JMP   L18C8

L185D    LDA   theSCORE
         CMP   #$02
         BCS   L188A
         AND   #$01
         BEQ   L1878
         LDA   #$00
         STA   L08D1
         STA   |$00E9
         LDA   #$80
         STA   L09CD
         JMP   L18C3

L1878    LDA   #$20
         STA   L08D0
         LDA   #$00
         STA   L09CD
         LDA   #$80
         STA   |$00E9
         JMP   L18C3

L188A    BIT   |$00E9
         BPL   L1891
         BVC   L18C4
L1891    BIT   L09CD
         BPL   L1898
         BVC   L18C4
L1898    LDA   #$80
         STA   |$00E9
         STA   L09CD
         JMP   L1A78

*--- Dead code

         INC   L08D0
         DEC   L08D1
         DEC   L08D1
         LDA   L09C5
         CMP   #$17
         BCS   L18C3
L18B3    LDA   #$00
         STA   L08D1
         LDA   #$20
         STA   L08D0
         JMP   L18C3
         JMP   L18C8

L18C3    NOP
L18C4    JSR   L0A8F
         RTS

L18C8    LDA   #$3C
         STA   L09DD
         JSR   L1A04
         RTS

         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP
         NOP

*---------- Calculate offset of font char

calcFOFFSET STX saveX
         STY   saveY

         LDA   #<theFONT
         STA   L1939+1
         LDA   #>theFONT
         STA   L1939+2
         LDX   #$20       ; space
L18EC    CPX   charFONT   ; the char
         BEQ   L1904
         INX
         CLC
         LDA   #$08       ; offset+8
         ADC   L1939+1
         STA   L1939+1
         BCC   L1900
         INC   L1939+2
L1900    CPX   #$7E       ; last char
         BNE   L18EC
L1904    LDX   saveX
         LDY   saveY
         RTS

*---------- Draw a char

printCHAR1 LDA #$20       ; on HGR1
         STA   pageHGR
         JMP   L1918

printCHAR2 LDA #$40       ; or HGR2
         STA   pageHGR

*---------- Draw a char on screen

L1918    STX   saveX
         STY   saveY
         LDY   zpYBEGIN   ; Y start
         CLC
         LDA   #$08
         ADC   zpYBEGIN
         STA   zpYEND     ; Y end
         LDX   zpXSCREEN
L1929    LDA   ptrLINEH,Y
         CLC
         ADC   pageHGR
         STA   L193C+2
         LDA   ptrLINEL,Y
         STA   L193C+1
L1939    LDA   theFONT
L193C    STA   $5E50,X
         INC   L1939+1
         BNE   L1947
         INC   L1939+2
L1947    INY
         CPY   zpYEND     ; the end?
         BNE   L1929
         LDX   saveX      ; restore
         LDY   saveY
         RTS

*---------- Print C string

printCSTR STA  L195B+1
         STY   L195B+2

         LDX   #$00
L195B    LDA   |$009F,X   ; get a char
         BEQ   L1988
         STA   charFONT   ; the char
         JSR   calcFOFFSET ; calc offset in font
         BIT   zpHPLAYER  ; which page to draw?
         BPL   L1970
         JSR   printCHAR2 ; HGR2
         JMP   L1973
L1970    JSR   printCHAR1 ; HGR1

L1973    INC   zpXSCREEN  ; next X
         LDA   zpXSCREEN
         CMP   #$28
         BNE   L1985
         LDA   #$00       ; next Y
         STA   zpXSCREEN
         LDA   #$08
         ADC   zpYBEGIN
         STA   zpYBEGIN
L1985    INX
         BNE   L195B
L1988    RTS

*---------- Show score and lives

showALL  LDA   zpHPLAYER
         STA   saveHPLAYER
         AND   #$7F
         STA   zpHPLAYER
         JSR   showSCORE
         JSR   showLIVES
         LDA   zpHPLAYER
         ORA   #$80
         STA   zpHPLAYER
         JSR   showSCORE
         JSR   showLIVES
         LDA   saveHPLAYER
         STA   zpHPLAYER
         RTS

*----------

showSCORE LDA  #$0E
         STA   zpXSCREEN
         LDA   #$A0
         STA   zpYBEGIN
         LDA   theSCORE
         STA   $9F
         LDA   theSCORE+1
         STA   $9E
         LDA   #$90
         STA   $9D
         LDA   #$00
         STA   $A0
         STA   $A1
         STA   $A2
         JSR   $ED34      ; convert fac
         JSR   printCSTR  ; print score
         RTS

*----------

L19CF    JMP   L1A68
L19D2    JMP   L1A6E

*----------

L19D5    LDA   L09C5
         CMP   #$05
         BEQ   L19CF
         CMP   #$0D
         BEQ   L19CF
         CMP   #$16
         BEQ   L19CF
         LDA   L09D5
         CMP   #$06
         BEQ   L19D2
         CMP   #$0B
         BEQ   L19D2
         CMP   #$13
         BEQ   L19D2
         CMP   #$17
         BEQ   L19D2
         LDA   theSCORE
         CMP   #$13
         BCC   L1A47
         AND   #$01
         BNE   L1A47
         LDA   #$0C
L1A04    STA   L09DD
         LDY   zpRANDOM
         LDA   L1D00,Y
         CMP   L09DD
         BNE   L1A14
         JMP   L1A22

L1A14    CMP   #$27
         BNE   L1A1B
         JMP   L1A36

L1A1B    CMP   #$54
         BNE   L1A47
         JMP   L1A36

L1A22    LDA   #$80
         STA   L09CE
         LDA   #$21
         STA   L08D2
         LDX   #$6E
         STX   $50
         JSR   L0303
         JMP   L1A47

L1A36    LDA   #$80
         STA   L09CF
         LDA   #$00
         STA   L08D3
         LDX   #$B4
         STX   $50
         JSR   L0303
L1A47    RTS

*----------

showLIVES CLC
         LDA   theLIVES
         BPL   L1A50
         LDA   #$00
L1A50    ADC   #$30
         STA   $9F
         LDA   #$22
         STA   zpXSCREEN
         LDA   #$A0
         STA   zpYBEGIN
         LDA   #$00
         STA   $A0
         LDA   #$9F
         LDY   #$00
         JSR   printCSTR  ; print lives
         RTS

L1A68    INC   L09C5
         JMP   L1A36

L1A6E    INC   L09D5
         JMP   L1A22

*--- Dead code

         BCS   showLIVES
         LDA   #$00
L1A78    LDA   L09C5
         CMP   #$05
         BCC   L1AB9
         CMP   #$08
         BCC   L1A92
         CMP   #$0C
         BCC   L1A98
         CMP   #$10
         BCC   L1A9E
         CMP   #$14
         BCC   L1AA4
         JMP   L1AAA

L1A92    INC   L08D0
         DEC   L08D1
L1A98    INC   L08D0
         DEC   L08D1
L1A9E    INC   L08D0
         DEC   L08D1
L1AA4    INC   L08D0
         DEC   L08D1
L1AAA    INC   L08D0
         DEC   L08D1
         INC   L08D0
         DEC   L08D1
         JMP   L1ABC
L1AB9    JMP   L18B3

L1ABC    JSR   L0B43
         JMP   L18C3

         JSR   HOME
         LDA   #$08
         JSR   VTAB
         LDA   #$80
         LDY   #$40
         JSR   $DB3A
         LDA   theSCORE
         STA   $9F
         LDA   theSCORE+1
         STA   $9E
         LDA   #$90
         STA   $9D
         LDA   #$00
         STA   $A0
         STA   $A1
         STA   $A2
         JSR   $ED2E
         JSR   CROUT
         JSR   CROUT
L1AF0    BIT   KBD
         BPL   L1AF0
         LDA   #$00
         STA   KBDSTROBE
         JMP   L1B34
         DB    $30
         DB    $03
         DB    $8D

*---------- Entry point

L1B00    LDA   #$00
         STA   L0328
         STA   L031E      ; S0
         LDA   #$03
         STA   L031D      ; T3
         LDA   #$08
         STA   L0328+1     ; $0800..$0FFF
         LDA   #$07
         STA   L031F      ; until S7
L1B17    JSR   L033D      ; read TS
         INC   L031E
         INC   L0328+1
         LDA   L031E
         CMP   L031F
         BNE   L1B17
         JSR   L033D      ; read T3/S7

         LDA   #$09       ; Load T9-A
         LDX   #$00       ; $6000..$7FFF
         LDY   #$60
         JSR   L0366

*---------- Main loop

L1B34    LDA   #$0F       ; Load TF-10
         LDX   #$00       ; $8000..$8FFF
         LDY   #$80
         JSR   L0366

         LDA   #$15       ; Load T15-16
         LDX   #$00       ; $2000..$3FFF
         LDY   #$20
         JSR   L0366

         JSR   L1CAC      ; clear text line 23

L1B49    BIT   KBD
         BPL   L1B49
         LDA   #$00
         STA   KBDSTROBE
         JSR   L1CB7      ; show score
         JSR   playGAME   ; play

* if we're back here, the player is dead

         JSR   HOME       ; clear text

         LDA   #$03       ; Load T3/SC
         STA   L031D      ; $4000..$40FF
         LDA   #$0C
         STA   L031E
         LDA   #<L4000
         STA   L0328
         LDA   #>L4000
         STA   L0328+1
         JSR   L033D
         JMP   L4000      ; and jump

*----------

L1B76    LDA   theSCORE
         CMP   #$15       ; harder, new foes
         BEQ   L1B9C
         CMP   #$21       ; new image, new foes
         BEQ   L1BA6
         CMP   #$2B       ; new foes
         BEQ   L1BB0
         CMP   #$36       ; new image, new foes
         BEQ   L1BB5
         CMP   #$3E       ; new foes
         BEQ   L1BBF
         CMP   #$4A       ; new foes
         BEQ   L1BC4
         CMP   #$53       ; new foes
         BEQ   L1BC9
         CMP   #$62       ; new foes
         BEQ   L1BCE
         JMP   showALL

L1B9C    LDA   #$09
         STA   L1500+1    ; more difficult
         LDA   #$0B
         JMP   loadSPRFOE

L1BA6    LDA   #$13
         JSR   loadIMAGE
         LDA   #$1F
         JMP   loadSPRFOE

L1BB0    LDA   #$1B
         JMP   loadSPRFOE

L1BB5    LDA   #$05
         JSR   loadIMAGE
         LDA   #$0B
         JMP   loadSPRFOE

L1BBF    LDA   #$17
         JMP   loadSPRFOE

L1BC4    LDA   #$21
         JMP   loadSPRFOE

L1BC9    LDA   #$19
         JMP   loadSPRFOE

L1BCE    LDA   #$0D
         JMP   loadSPRFOE
         RTS

*---------- Load foe sprite data

loadSPRFOE LDX #$00
         LDY   #$80
         JSR   L0366
         JMP   L180D

*---------- Load new background image

loadIMAGE STA  TXTPAGE2
         LDX   #$00
         LDY   #$20
         JSR   L0366
         JSR   blitHGR
         JSR   showALL
         RTS

*--- Dead code

         DB    $41
         DB    $49
         DB    $4E
         DB    $20
         DB    $3F
         DB    $20
         DB    $28
         DB    $59
         DB    $2F
         DB    $4E
         DB    $29
         DB    $20
         DB    $22
         DB    $3B
         DB    $3A
         DB    $BE
         DB    $41

*----------

         DB    $24
         DB    $3A
         DB    $AD
         DB    $41
         DB    $24
         DB    $D1
         DB    $CF
         DB    $22
         DB    $4E
         DB    $22
         DB    $C4
         DB    $35
         DB    $00
         DB    $13
         DB    $1C
         DB    $06
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $41
         DB    $80
         DB    $01
         DB    $A3
         DB    $9A
         DB    $00
         DB    $00
         DB    $41
         DB    $00
         DB    $87
         DB    $7E
         DB    $00
         DB    $00
         DB    $00
         DB    $43
         DB    $30
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $C0
         DB    $08
         DB    $AC
         DB    $C1
         DB    $08
         DB    $60
         DB    $A9
         DB    $20
         DB    $8D
         DB    $C4
         DB    $08
         DB    $4C
         DB    $3E
         DB    $1C
         DB    $A9
         DB    $40
         DB    $8D
         DB    $C4
         DB    $08
         DB    $8E
         DB    $C0
         DB    $08
         DB    $8C
         DB    $C1
         DB    $08
         DB    $A4
         DB    $FC
         DB    $18
         DB    $A9
         DB    $08
         DB    $65
         DB    $FC
         DB    $85
         DB    $FD
         DB    $A6
         DB    $F9
         DB    $B9
         DB    $00
         DB    $08
         DB    $18
         DB    $6D
         DB    $C4
         DB    $08
         DB    $8D
         DB    $64
         DB    $1C
         DB    $B9
         DB    $00
         DB    $09
         DB    $8D
         DB    $63
         DB    $1C
         DB    $AD
         DB    $90
         DB    $1F
         DB    $9D
         DB    $50
         DB    $3E
         DB    $EE
         DB    $60
         DB    $1C
         DB    $D0
         DB    $03
         DB    $EE
         DB    $61
         DB    $1C
         DB    $C8
         DB    $C4
         DB    $FD
         DB    $D0
         DB    $DD
         DB    $AE
         DB    $C0
         DB    $08
         DB    $AC
         DB    $C1
         DB    $08
         DB    $60
         DB    $8D
         DB    $82
         DB    $1C
         DB    $8C
         DB    $83
         DB    $1C
         DB    $A2

*---------- Copy HGR1 onto HGR2

blitHGR  CLC
L1C81    LDX   #$00
L1C83    LDA   $2000,X
L1C86    STA   $4000,X
         INX
         BNE   L1C83
         INC   L1C83+2
         INC   L1C86+2
         LDA   L1C83+2
         CMP   #$40
         BNE   L1C81
         LDA   #$20
         STA   L1C83+2
         LDA   #$40
         STA   L1C86+2
         LDA   #$00
         STA   L1C83+1
         STA   L1C86+1
         RTS

*---------- Clear last line of text

L1CAC    LDX   #$27
         LDA   #$A0
L1CB0    STA   $07D0,X
         DEX
         BPL   L1CB0
         RTS

*---------- Init game

L1CB7    LDA   #$00       ; Max score is 3
         STA   theSCORE
         STA   theSCORE+1
         LDA   #$03
         STA   theLIVES
         JSR   showALL    ; show it
         JSR   blitHGR    ; copy HGR
         LDA   #$05
         STA   L1500+1    ; difficulty
         RTS

         DB    $1C
         DB    $A0
         DB    $FF
         DB    $C8
         DB    $B1
         DB    $00
         DB    $F0
         DB    $37
         DB    $10
         DB    $0C
         DB    $C9
         DB    $E0
         DB    $90
         DB    $02
         DB    $29
         DB    $1F
         DB    $20
         DB    $ED
         DB    $FD
         DB    $4C
         DB    $D3
         DB    $1C
         DB    $C9
         DB    $18
         DB    $D0
         DB    $05
         DB    $68
         DB    $68
         DB    $4C
         DB    $42
         DB    $13
         DB    $AA
         DB    $BD
         DB    $0B
         DB    $1C
         DB    $85
         DB    $02
         DB    $BD
         DB    $0C
         DB    $1C
         DB    $85
         DB    $03
         DB    $98
         DB    $48
         DB    $A0
         DB    $00
         DB    $B1
         DB    $A0

*---------- Table to sprite index

L1D00    DB    $41
         DB    $2B
         DB    $9A
         DB    $A1
         DB    $43
         DB    $37
         DB    $F7
         DB    $86
         DB    $3A
         DB    $5E
         DB    $C8
         DB    $A5
         DB    $8E
         DB    $A2
         DB    $C1
L1D0F    DB    $1C
         DB    $B9
         DB    $14
         DB    $33
         DB    $BF
         DB    $A9
         DB    $75
         DB    $13
         DB    $72
         DB    $42
         DB    $1D
         DB    $C7
         DB    $CF
         DB    $C4
         DB    $3D
         DB    $95
         DB    $27
         DB    $80
         DB    $84
         DB    $F2
         DB    $CE
         DB    $99
         DB    $A6
         DB    $FB
         DB    $7C
         DB    $2A
         DB    $CA
         DB    $AF
         DB    $16
         DB    $FA
         DB    $AD
         DB    $40
         DB    $4E
         DB    $35
         DB    $68
         DB    $E2
         DB    $46
         DB    $AC
         DB    $07
         DB    $23
         DB    $02
         DB    $6E
         DB    $B6
         DB    $F3
         DB    $85
         DB    $63
         DB    $0A
         DB    $52
         DB    $D0
         DB    $9D
         DB    $74
         DB    $C2
         DB    $DA
         DB    $2D
         DB    $71
         DB    $0B
         DB    $88
         DB    $D9
         DB    $9C
         DB    $8C
         DB    $20
         DB    $67
         DB    $83
         DB    $79
         DB    $2C
         DB    $5B
         DB    $B3
         DB    $4C
         DB    $62
         DB    $DD
         DB    $F4
         DB    $6D
         DB    $87
         DB    $59
         DB    $C5
         DB    $F1
         DB    $F5
         DB    $81
         DB    $7F
         DB    $3B
         DB    $C9
         DB    $66
         DB    $BC
         DB    $12
         DB    $57
         DB    $10
         DB    $53
         DB    $E8
         DB    $09
         DB    $AA
         DB    $21
         DB    $49
         DB    $C0
         DB    $8B
         DB    $2E
         DB    $9E
         DB    $6B
         DB    $45
         DB    $A3
         DB    $82
         DB    $00
         DB    $6F
         DB    $C6
         DB    $6A
         DB    $AB
         DB    $03
         DB    $15
         DB    $58
         DB    $06
         DB    $08
         DB    $E4
         DB    $DC
         DB    $78
         DB    $ED
         DB    $D5
         DB    $FE
         DB    $9F
         DB    $A7
         DB    $0E
         DB    $FC
         DB    $BD
         DB    $FF
         DB    $0C
         DB    $B0
         DB    $B7
         DB    $4D
         DB    $D6
         DB    $0D
         DB    $D8
         DB    $B2
         DB    $32
         DB    $EF
         DB    $DE
         DB    $5F
         DB    $F8
         DB    $69
         DB    $7D
         DB    $7B
         DB    $BA
         DB    $B4
         DB    $6C
         DB    $48
         DB    $92
         DB    $EC
         DB    $E9
         DB    $BE
         DB    $28
         DB    $E7
         DB    $FD
         DB    $17
         DB    $7A
         DB    $11
         DB    $8A
         DB    $56
         DB    $22
         DB    $04
         DB    $C3
         DB    $8D
         DB    $34
         DB    $F6
         DB    $2F
         DB    $01
         DB    $26
         DB    $29
         DB    $24
         DB    $7E
         DB    $30
         DB    $5A
         DB    $76
         DB    $EB
         DB    $E1
         DB    $60
         DB    $61
         DB    $96
         DB    $3F
         DB    $4B
         DB    $77
         DB    $B1
         DB    $F9
         DB    $D4
         DB    $E6
         DB    $D1
         DB    $90
         DB    $3C
         DB    $94
         DB    $97
         DB    $E3
         DB    $93
         DB    $50
         DB    $05
         DB    $5C
         DB    $89
         DB    $EE
         DB    $DF
         DB    $51
         DB    $73
         DB    $D3
         DB    $36
         DB    $1F
         DB    $D2
         DB    $39
         DB    $F0
         DB    $E0
         DB    $B8
         DB    $25
         DB    $BB
         DB    $8F
         DB    $B5
         DB    $DB
         DB    $0F
         DB    $38
         DB    $D7
         DB    $3E
         DB    $4A
         DB    $64
         DB    $CB
         DB    $91
         DB    $A8
         DB    $55
         DB    $54
         DB    $CC
         DB    $A4
         DB    $65
         DB    $1E
         DB    $4F
         DB    $1A
         DB    $5D
         DB    $47
         DB    $A0
         DB    $1B
         DB    $9B
         DB    $98
         DB    $CD
         DB    $31
         DB    $E5
         DB    $70
         DB    $18
         DB    $AE
         DB    $EA
         DB    $44
         DB    $00

*----------

L1E00    DB    $11
         DB    $12
         DB    $13
         DB    $14
         DB    $15
         DB    $11
         DB    $12
         DB    $11
         DB    $18
         DB    $19
         DB    $1A
         DB    $1B
         DB    $18
         DB    $1A
         DB    $19
         DB    $1B
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1D
         DB    $1F
         DB    $B5
         DB    $00
         DB    $85
         DB    $00
         DB    $B5
         DB    $01
         DB    $85
         DB    $01
         DB    $4C
         DB    $91
         DB    $1D
         DB    $A5
         DB    $00
         DB    $95
         DB    $00
         DB    $A5
         DB    $01
         DB    $95
         DB    $01
         DB    $4C
         DB    $91
         DB    $1D
         DB    $A5
         DB    $00
         DB    $81
         DB    $00
         DB    $A0
         DB    $00
         DB    $84

L1E40    DB    $07        ; 00-2F
         DB    $0F
         DB    $17
         DB    $1F
         DB    $27
         DB    $2F
         DB    $07
         DB    $1F

L1E48    DB    $37        ; 37-5F
         DB    $3F
         DB    $47
         DB    $4F
         DB    $57
         DB    $5F
         DB    $37
         DB    $3F

*--- Dead data

         DB    $84
         DB    $01
         DB    $84
         DB    $1D
         DB    $F6
         DB    $00
         DB    $D0
         DB    $02
         DB    $F6
         DB    $01
         DB    $4C
         DB    $91
         DB    $1D
         DB    $B5
         DB    $00
         DB    $D0
         DB    $02
         DB    $D6
         DB    $01
         DB    $D6
         DB    $00
         DB    $A1
         DB    $00
         DB    $A8
         DB    $D0
         DB    $02
         DB    $A0
         DB    $00
         DB    $B5
         DB    $00
         DB    $D0
         DB    $02
         DB    $D6
         DB    $01
         DB    $D6
         DB    $00
         DB    $A1
         DB    $00
         DB    $85
         DB    $00
         DB    $84
         DB    $01
         DB    $A0
         DB    $00
         DB    $84
         DB    $1D
         DB    $4C
         DB    $91

*---

L1E80    DB    $D3        ; The table
         DB    $D2        ; ends at $1E80+$5F
         DB    $D1        ; ...$1EDF
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $93
         DB    $94
         DB    $93
         DB    $92
         DB    $91
         DB    $91
         DB    $91
         DB    $91
         DB    $11
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $92
         DB    $94
         DB    $93
         DB    $91
         DB    $11
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $12
         DB    $D2
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $D1
         DB    $D1
         DB    $92
         DB    $91
         DB    $91
         DB    $D1
         DB    $D2
         DB    $D1
         DB    $19
         DB    $18
         DB    $DA
         DB    $19
         DB    $18
         DB    $DA
         DB    $19
         DB    $DB
         DB    $98
         DB    $18
         DB    $19
         DB    $9A
         DB    $DB
         DB    $DB
         DB    $DB
         DB    $DB
         DB    $DA
         DB    $18
         DB    $DA
         DB    $19
         DB    $18
         DB    $18
         DB    $DB
         DB    $DB
         DB    $18
         DB    $D8
         DB    $1A
         DB    $19
         DB    $D8
         DB    $DB
         DB    $19
         DB    $DB
         DB    $DB
         DB    $DB
         DB    $DB
         DB    $DB
         DB    $DB
         DB    $D8
         DB    $1A
         DB    $19
         DB    $9B
         DB    $1C
         DB    $9B
         DB    $19
         DB    $1A
         DB    $18
         DB    $99
         DB    $18
         DB    $01
         DB    $F5
         DB    $01
         DB    $99
         DB    $01
         DB    $00
         DB    $98
         DB    $69
         DB    $00
         DB    $85
         DB    $1D
         DB    $4C
         DB    $91
         DB    $1D
         DB    $A5
         DB    $00
         DB    $75
         DB    $00
         DB    $85
         DB    $00
         DB    $A5
         DB    $01
         DB    $75
         DB    $01
         DB    $A0
         DB    $00
         DB    $99
         DB    $01
         DB    $00
         DB    $98
         DB    $69
         DB    $7F

*---------- The font

theFONT  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $00
         DB    $08
         DB    $00
         DB    $14
         DB    $14
         DB    $14
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $28
         DB    $94
         DB    $7E
         DB    $14
         DB    $BF
         DB    $8A
         DB    $0A
         DB    $00
         DB    $08
         DB    $3C
         DB    $0A
         DB    $1C
         DB    $28
         DB    $1E
         DB    $08
         DB    $00
         DB    $06
         DB    $26
         DB    $10
         DB    $08
         DB    $04
         DB    $32
         DB    $30
         DB    $00
         DB    $04
         DB    $0A
         DB    $0A
         DB    $04
         DB    $2A
         DB    $12
         DB    $2C
         DB    $00
         DB    $08
         DB    $08
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $04
         DB    $02
         DB    $02
         DB    $02
         DB    $04
         DB    $08
         DB    $00
         DB    $08
         DB    $10
         DB    $20
         DB    $20
         DB    $20
         DB    $10
         DB    $08
         DB    $00
         DB    $08
         DB    $2A
         DB    $1C
         DB    $08
         DB    $1C
         DB    $2A
         DB    $08
         DB    $00
         DB    $00
         DB    $08
         DB    $08
         DB    $3E
         DB    $08
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $8C
         DB    $88
         DB    $84
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
         DB    $8C
         DB    $00
         DB    $00
         DB    $20
         DB    $10
         DB    $08
         DB    $04
         DB    $02
         DB    $00
         DB    $00
         DB    $8C
         DB    $92
         DB    $22
         DB    $22
         DB    $22
         DB    $92
         DB    $8C
         DB    $00
         DB    $08
         DB    $0C
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $1C
         DB    $00
         DB    $1C
         DB    $22
         DB    $20
         DB    $10
         DB    $84
         DB    $82
         DB    $3E
         DB    $00
         DB    $3E
         DB    $90
         DB    $10
         DB    $18
         DB    $20
         DB    $22
         DB    $1C
         DB    $00
         DB    $10
         DB    $18
         DB    $14
         DB    $12
         DB    $3E
         DB    $10
         DB    $10
         DB    $00
         DB    $3E
         DB    $02
         DB    $1E
         DB    $20
         DB    $20
         DB    $22
         DB    $1C
         DB    $00
         DB    $18
         DB    $04
         DB    $82
         DB    $1E
         DB    $22
         DB    $22
         DB    $1C
         DB    $00
         DB    $3E
         DB    $90
         DB    $10
         DB    $88
         DB    $08
         DB    $84
         DB    $04
         DB    $00
         DB    $1C
         DB    $22
         DB    $22
         DB    $1C
         DB    $22
         DB    $22
         DB    $1C
         DB    $00
         DB    $1C
         DB    $22
         DB    $22
         DB    $3C
         DB    $90
         DB    $10
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $8C
         DB    $00
         DB    $00
         DB    $8C
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $8C
         DB    $00
         DB    $00
         DB    $8C
         DB    $88
         DB    $84
         DB    $10
         DB    $08
         DB    $04
         DB    $02
         DB    $04
         DB    $08
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $3E
         DB    $00
         DB    $3E
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $08
         DB    $10
         DB    $20
         DB    $10
         DB    $08
         DB    $04
         DB    $00
         DB    $1C
         DB    $22
         DB    $90
         DB    $88
         DB    $08
         DB    $00
         DB    $08
         DB    $00

*----------------------------

	put	SB.0300
	put	SB.4000

*----------------------------

