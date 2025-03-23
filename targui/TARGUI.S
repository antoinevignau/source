*
* Targui
*
* (c) 1990, Antoine Vignau
*

            mx    %11
            org   $9000
            lst   off

*----------------------------

KBD         =     $C000
KBDSTROBE   =     $C010
RDPAGE2     =     $C01C
SPKR        =     $C030
TXTPAGE1    =     $C054
TXTPAGE2    =     $C055

*----------------------------

L9000       jsr   $A900       ; show DHGR

            ldx   #11         ; clear board
]lp         lda   #0
            sta   theBOARD,X
            dex
            bpl   ]lp

            lda   #$0B
            sta   $08
            sta   $00
            lda   #$00
            sta   $01
            sta   $02

doLOOP      lda   #$01
            jsr   showWINDOW
            jsr   waitKEY
            cmp   #"A"
            bcc   badKEY
            cmp   #"M"
            bcs   badKEY
            jsr   checkKEY
            lda   theBOARD,X
            beq   L9033
            bne   badKEY
L9033       stx   $07
            lda   #$02
            jsr   showWINDOW
            jsr   waitKEY
            cmp   #"+"
            beq   moveFWD
            cmp   #"-"
            bne   badKEY
            jsr   moveBWD
            jmp   checkMOVE

moveFWD     jsr   L9051
            jmp   checkMOVE

L9051       lda   $07         ; move 5 forward
            clc
            adc   #$05
            sta   $07
            cmp   #$0C
            bcc   L9063
            lda   $07
            sec
            sbc   #$0C
            sta   $07
L9063       rts

moveBWD     lda   $07         ; move 5 backward
            sec
            sbc   #$05
            sta   $07
            bcs   L907B
            lda   #$00
            sec
            sbc   $07
            sta   $07
            lda   #$0C
            sec
            sbc   $07
            sta   $07
L907B       rts

badKEY      lda   #$03
            jsr   showWINDOW
            ldx   #$40
            ldy   #$40
            jsr   doBEEP      ; beep
            jmp   doLOOP

            asc   "       LOGO          15/12/90           "
            asc   "         "

*--- Wait for a key

waitKEY     lda   KBD         ; wait for a key
            bpl   waitKEY
            bit   KBDSTROBE
            sta   $06
            rts

            nop
            nop
            nop
            nop

*--- Beep

doBEEP      stx   $0A
            sty   $0B
            ldy   #$00
L90D1       ldx   $0A
            lda   SPKR
L90D6       dey
            bne   L90DD
            dec   $0B
            beq   L90EC
L90DD       nop
            nop
            nop
            nop
            nop
            dex
            nop
            nop
            nop
            nop
            nop
            beq   L90D1
            bne   L90D6
L90EC       lda   #$10
            sta   $FE
L90F0       ldx   #$00
L90F2       ldy   #$00
L90F4       dey
            bpl   L90F4
            dex
            bpl   L90F2
            dec   $FE
            bne   L90F0
            rts

*--- Check key

checkMOVE   nop               ; wait?
            nop
            nop
            nop
            nop
            nop
            nop
            lda   #$00
            sta   $03
            ldx   $07
            lda   theBOARD,X  ; is square empty?
            beq   L9114
            jmp   badKEY

*--- Square is empty, make it used

L9114       jsr   L91D3       ; get coordinates
            ldx   #$20
            ldy   #$30
            jsr   doBEEP      ; beep
            ldx   $07         ; target square
            lda   #$01        ; make it used
            sta   theBOARD,X
            dec   $08         ; nb pieces--
            bmi   L9151       ; we won?

*--- Check board

            lda   #$FF        ; check board
            sta   $06
L912D       inc   $06
            ldx   $06
            lda   theBOARD,X
            cmp   #$01
            beq   L9147
            stx   $07
            jsr   L9051       ; move forward
            ldx   $07
            lda   theBOARD,X
            bne   L9147
            jmp   doLOOP

L9147       lda   $06
            cmp   #$0C
            bne   L912D
            lda   #$05
            bne   L9153

L9151       lda   #$04
L9153       jsr   showWINDOW
            ldx   #$40
            ldy   #$50
            jsr   doBEEP
            ldx   #$90
            ldy   #$60
            jsr   doBEEP
            lda   #$06
            jsr   showWINDOW
            jsr   waitKEY
            cmp   #"Q"
            beq   L9173
            jmp   L9000       ; play again
L9173       jmp   $A970       ; quit and reboot

*--- Print out a window

showWINDOW  asl               ; print a window
            clc               ; from FENETRE
            adc   #$80        ; at $8000
            sta   L9197+2
            lda   #$00
            sta   L9197+1
            ldx   #$88
L9184       lda   L9245,X
            sta   $FE
            lda   L92D5,X
            sta   $FF
            lda   #$00
            sta   $09
            sta   TXTPAGE1
            ldy   #$03
L9197       lda   $8000
            sta   ($FE),Y
            inc   L9197+1
            bne   L91A4
            inc   L9197+2
L91A4       lda   $09
            cmp   #$3D
            beq   L91BD
            inc   $09
            lda   RDPAGE2
            bmi   L91B7
            sta   TXTPAGE2
            iny
            bne   L9197
L91B7       sta   TXTPAGE1
            jmp   L9197

L91BD       inx
            cpx   #$8E
            bne   L9184
            rts

*--- Check authorized keys

checkKEY    ldx   #$0B
L91C5       lda   L9371,X
            cmp   $06
            beq   L91D1
            dex
            bpl   L91C5
            sec
            rts
L91D1       clc
            rts

*--- Get coordinates and print square

L91D3       lda   L937D,X
            sta   L9208+1
            lda   L9389,X
            sta   L921B+1
            jmp   L91F5

            asc   "        LOGO       "

L91F5       lda   L9208+1
            clc
            adc   #$11
            sta   L9240+1
            lda   #$00
            sta   L921D+1
            lda   #$94
            sta   L921D+2
L9208       ldx   #$00
L920A       lda   #$00
            sta   $09
            sta   TXTPAGE2
            lda   L9245,X
            sta   $FE
            lda   L92D5,X
            sta   $FF
L921B       ldy   #$00
L921D       lda   $ffff
            sta   ($FE),Y
            inc   L921D+1
            lda   $09
            cmp   #$05
            beq   L923F
            inc   $09
            lda   RDPAGE2
            bmi   L9239
            sta   TXTPAGE2
            iny
            jmp   L921D

L9239       sta   TXTPAGE1
            jmp   L921D

L923F       inx
L9240       cpx   #$00
            bne   L920A
            rts

*--- Line addresses

L9245       hex   00000000000000008080808080808080
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   5050505050505050D0D0D0D0D0D0D0D0
            hex   5050505050505050D0D0D0D0D0D0D0D0
            hex   5050505050505050D0D0D0D0D0D0D0D0
            hex   5050505050505050D0D0D0D0D0D0D0D0
L92D5       hex   23272B2F33373B3F23272B2F33373B3F
            hex   2024282C3034383C2024282C3034383C
            hex   2125292D3135393D2125292D3135393D
            hex   22262A2E32363A3E22262A2E32363A3E
            hex   23272B2F33373B3F23272B2F33373B3F
            hex   2024282C3034383C2024282C3034383C
            hex   2125292D3135393D2125292D3135393D
            hex   22262A2E32363A3E22262A2E32363A3E
            hex   23272B2F33373B3F23272B2F33373B3F

theBOARD    hex   000000000000000000000000

*--- Authorized keys

L9371       asc   "ABCDEFGHIJKL"

*--- Coordinates of the squares

L937D       hex   000000002040606060604020
L9389       hex   070E151C1C1C1C150E070707
            ds    \

*--- The empty square

L9400       hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA
            hex   D5AAD5AAD5AAD5AAD5AAD5AAD5AAD5AA

            ds    \

