*
* Charge programme
*
* (c) LoGo, 29/09/92
* v3.00 def
*
            org   $2000
            lst   off
            dsk   game.system
            typ   #$ff

            ldy   #$08
            ldx   #$00
a0          lda   $2100,x
a1          sta   $0800,x
            inx
            bne   a0
            inc   a0+2
            inc   a1+2
            dey
            bpl   a0
            jmp   $0800

            ds    2,$8d
            asc   "Game.system: v3.0, 29/09/92"
            ds    2,$8d
            ds    \

* Commence ici

            org   $0800

            stz   $3f2
            stz   $3f3
            stz   $3f4
            lda   #$c1
            sta   $c029
            jsr   $bf00
            dfb   $c6
            dw    set_p

b0          lda   #$00
            ldx   #$00
            ldy   #$20
            jsr   loader
b1          ldx   #$06
b2          ldy   #$00
            jsr   unpack

            jsr   thermo      ;le thermometre

            lda   b2+1
            clc
            adc   #$80
            sta   b2+1
            bne   b3
            inc   b1+1
b3          inc   b0+1
            lda   b0+1
            cmp   #18
            bne   b0

            jsr   $a000
            jsr   anim
            jsr   $a006
            bit   $c010

            lda   #18         ;programme mouse
            ldx   #$00
            ldy   #$10
            jsr   loader
            lda   #19         ; music2.w
            ldx   #$03
            ldy   #$00
            jsr   loader
            lda   #20         ; music2
            ldx   #$05
            ldy   #$00
            jsr   loader

            jsr   fadeout     ;efface l'ecran
            ldx   #$06
            ldy   #$00
            jsr   fadein      ;affiche de nouveau
b4          lda   $c000       ;fait l'attente
            bpl   b4
            bit   $c010
            jsr   fadeout     ;efface l'ecran
            ldx   #$0b
            ldy   #$00
            jsr   fadein      ;affiche le billard
            clc
            xce
            rep   #$30
            ldx   #$7ffe
b6          ldal  $e12000,x
            stal  $012000,x
            dex
            dex
            bpl   b6
            sec
            xce
            sep   #$30
            jmp   $1000       ;saut

* Thermometre

thermo      clc               ;le joli thermometre
            xce
            rep   #$30
*
d0          ldx   #$0000      ;est-ce que l'on affiche
            lda   TaThermo,x
            cmp   #$ffff
            beq   d1
            jsr   c1
d1          lda   d0+1
            clc
            adc   #$0002
            sta   d0+1
            sec
            xce
            sep   #$30
            rts
*
            mx    %00
c1          lda   #$0000
            clc
            adc   #$6142
            sta   c3+1
            ldy   #$000c
c2          lda   #$7777
c3          stal  $e12000
            lda   c3+1
            clc
            adc   #$00a0
            sta   c3+1
            dey
            dey
            bpl   c2
            lda   c1+1
            clc
            adc   #$0002
            sta   c1+1
            rts

* Fade out

fadeout     clc               ;efface l'ecran graphique lentement
            xce
            rep   #$30
            ldy   #$000f
out0        ldx   #$01fe
out1        ldal  $e19e00,x
            and   #$000f
            beq   out2
            ldal  $e19e00,x
            sec
            sbc   #$0001
            stal  $e19e00,x
out2        ldal  $e19e00,x
            and   #$00f0
            beq   out3
            ldal  $e19e00,x
            sec
            sbc   #$0010
            stal  $e19e00,x
out3        ldal  $e19e00,x
            and   #$0f00
            beq   out4
            ldal  $e19e00,x
            sec
            sbc   #$0100
            stal  $e19e00,x
out4        dex
            dex
            bpl   out1
            dey
            bpl   out0
            sec
            xce
            sep   #$30
            rts

* Fade in

fadein      sty   in0+2       ;mem high
            stx   in0+3       ;bank
            stx   in3+3
            stx   in5+3
            stx   in7+3
            tya
            clc
            adc   #$7e
            sta   in3+2
            sta   in5+2
            sta   in7+2
            clc
            xce
            rep   #$30
            ldx   #$7dde
in0         ldal  $062000,x
            stal  $e12000,x
            dex
            dex
            bpl   in0
            ldy   #$000f
in1         ldx   #$01fe
in2         ldal  $e19e00,x
            and   #$000f
            sta   temp
in3         ldal  $069e00,x
            and   #$000f
            cmp   temp
            beq   in4
            ldal  $e19e00,x
            clc
            adc   #$0001
            stal  $e19e00,x
in4         ldal  $e19e00,x
            and   #$00f0
            sta   temp
in5         ldal  $069e00,x
            and   #$00f0
            cmp   temp
            beq   in6
            ldal  $e19e00,x
            clc
            adc   #$0010
            stal  $e19e00,x
in6         ldal  $e19e00,x
            and   #$0f00
            sta   temp
in7         ldal  $069e00,x
            and   #$0f00
            cmp   temp
            beq   in8
            ldal  $e19e00,x
            clc
            adc   #$0100
            stal  $e19e00,x
in8         dex
            dex
            bpl   in2
            dey
            bpl   in1
            sec
            xce
            sep   #$30
            rts

* Unpack bytes

unpack      stx   unp1+1
            sty   unp2+2
            clc               ;unpack file
            xce
            rep   #$30
            lda   #$8000
            sta   picsize
unp1        lda   #$0006
            sta   picptr+2
unp2        lda   #$8000
            sta   picptr

            pea   $0000       ;space for result
            lda   buffer+2    ;adresse du buffer (source)
            pha               ;donc de l'image compactee
            lda   buffer
            pha
            lda   get_eof+2   ;taille du buffer source
            pha

            pea   #^picptr    ;adresse de l'ecran
            pea   #picptr
            pea   #^picsize   ;taille de l'ecran
            pea   #picsize

            ldx   #$2703
            jsl   $e10000
            pla
            sec
            xce
            sep   #$30
            rts

* Loader

loader      stx   load2+3     ;banc
            sty   load2+2     ;mem haute
            asl
            tax
            lda   nom,x
            sta   open+1
            inx
            lda   nom,x
            sta   open+2
            jsr   $bf00       ;open file
            dfb   $c8
            dw    open
            bcs   load4
            lda   open+5
            sta   get_eof+1
            sta   set_mark+1
            sta   read+1
            jsr   $bf00       ;get eof
            dfb   $d1
            dw    get_eof
            bcs   load4
            inc   get_eof+3
            lda   #$00
            sta   set_mark+2
            sta   set_mark+3
            sta   set_mark+4
load0       jsr   $bf00       ;set mark
            dfb   $ce
            dw    set_mark
            bcs   load4
            jsr   $bf00       ;read
            dfb   $ca
            dw    read
            bcs   load4
            ldy   #$01
            ldx   #$00
load1       lda   $b000,x
load2       stal  $000000,x
            inx
            bne   load1
            inc   load1+2
            inc   load2+2
            dey
            bpl   load1
            lda   #$b0
            sta   load1+2
            inc   set_mark+3
            inc   set_mark+3
            lda   set_mark+3
            bne   load3
            inc   set_mark+4
            inc   load2+3
load3       lda   set_mark+3
            cmp   get_eof+3
            bcc   load0
            lda   set_mark+4
            cmp   get_eof+4
            bcs   load4
            bne   load0
load4       jsr   $bf00       ;close
            dfb   $cc
            dw    close
            rts

* All datas

set_p       dfb   $01
            da    $0280

open        dfb   $03
            dw    nom1
            hex   00b4
            hex   00

read        dfb   $04
            hex   00
            hex   00b0
            hex   0002
            hex   0000

close       dfb   $01
            hex   00

set_mark    dfb   $02
            hex   00
            hex   000000

get_eof     dfb   $02
            hex   00
            hex   000000

nom         dw    nom1,nom2,nom3,nom4,nom5,nom6,nom7,nom8,nom9
            dw    nom10,nom11,nom12,nom13,nom14,nom15
            dw    nom16,nom17,nom18,nom19,nom20,nom21

nom1        str   "BIL"
nom2        str   "AVE"
nom3        str   "LOUI"
nom4        str   "SCUL"
nom5        str   "JUP"
nom6        str   "TERR"
nom7        str   "GAL"
nom8        str   "RAD"
nom9        str   "BAB"
nom10       str   "OPT"
nom11       str   "POO"
nom12       str   "SPR"
nom13       str   "QUI"
nom14       str   "APR"
nom15       str   "REA"
nom16       str   "NEX"
nom17       str   "PHO"
nom18       str   "SPB"
nom19       str   "MOUSE"
nom20       str   "MUSIC2.W"
nom21       str   "MUSIC2"

buffer      adrl  $00002000
picptr      adrl  $00060000
picsize     da    $8000
temp        ds    2

TaThermo    da    $0000,$0000,$0000,$ffff,$0000,$0000,$0000
            da    $ffff,$0000,$0000,$0000,$0000,$ffff,$ffff
            da    $0000,$0000,$0000,$0000,$ffff,$ffff,$ffff

            ds    2,$8d
            asc   "Animation: v2.0, 29/09/92"
            ds    2,$8d

*
* Programme animation
*
* (c) Zardos, 29/09/92
* v2.00 def
* rajout boom by LoGo

anim        clc
            xce
            sep   #$30
            BIT   $C010
            LDA   #$A1
            STA   $C029
            STZ   $C035
            clc
            xce
            REP   #$30

            LDX   #$7FFE
COPIE       LDAL  $e12000,X   ; COPIE L'IMAGE POUR
            STAL  $012000,X   ; POUVOIR PLUSIEURS ESSAIS
            DEX
            DEX
            BPL   COPIE

            STZ   A1
            STZ   A2
            STZ   A3
            STZ   A4          ; ON INITIALISE
            STZ   AP1
            STZ   NP1
            STZ   AP2
            STZ   NP2

DEBUT       CLC
            XCE
            REP   #$30

            jsr   sound

R1          LDX   #$0000
            TXA
            CLC
            ADC   #$615d      ; 1ERE AVANCEE DE ROUGE
            STA   ANI7+1
            JSR   WAIT
            JSR   ANIL
            LDX   R1+1
            INX
            INX
            STX   R1+1
            CPX   #$0015
            BMI   R1
            JSR   ANIM2       ; PERSONNAGE DROITE

R2          LDX   #$0000
            TXA
            CLC
            ADC   #$617b      ; 2EME AVANCEE DE ROUGE
            STA   ANI7+1
            JSR   WAIT
            JSR   ANIL
            LDX   R2+1
            INX
            INX
            STX   R2+1
            CPX   #$0015
            BMI   R2
            JSR   ANIM4       ; VACHE
            JSR   WAIT

            LDA   #$0000
            STAL  $0156F0     ; POINT DU SPRITE A EFFACER
ANIP0       LDX   NP1         ; NOUVELLE POSITION
            LDA   TP1,X
            STA   ANIP1+1
            LDX   AP1         ; ANCIENNE POSITION
            LDA   TP1,X
            STA   ANIP2+1
            LDA   #$00E8      ; POINTS JAUNE-MARRON
ANIP1       STAL  $012000
            JSR   WAIT
            LDA   #$0000      ; NOIR = EFFACE
ANIP2       STAL  $012000
            LDA   NP1
            INC               ; NP1=NP1+2
            INC
            CMP   #$0032      ; 26 FOIS
            BPL   AN1
            STA   NP1
            LDA   AP1
            INC               ; AP1=AP1+2
            INC
            STA   AP1
            BRA   ANIP0
AN1         JSR   ANIM1

ANIP3       LDX   NP2         ; NOUVELLE POSITION
            LDA   TP2,X
            STA   ANIP4+1
            LDX   AP2         ; ANCIENNE POSITION
            LDA   TP2,X
            STA   ANIP5+1
            LDA   #$00E8      ; POINTS JAUNE-MARRON
ANIP4       STAL  $012000
            JSR   WAIT
            LDA   #$0000      ; NOIR = EFFACE
ANIP5       STAL  $012000
            LDA   NP2
            INC               ; NP2=NP2+2
            INC
            CMP   #$002C      ; 22 FOIS
            BPL   AN2
            STA   NP2
            LDA   AP2
            INC               ; AP2=AP2+2
            INC
            STA   AP2
            BRA   ANIP3
AN2         JSR   ANIM3
            JSR   WAIT
*
FIN         SEC
            XCE               ; 8 BIT
            SEP   #$30
            RTS

* Sous-routines

            CLC
            XCE
            REP   #$30

******** TETE EXPLOSION *************

ANIM1       LDA   A1          ; TETE
            ASL
            TAX
            LDA   TABLE1,X
            clc
            adc   #$8000
            STA   ANI1+1
            LDA   #$33A8      ; ECRAN LOCALISATION
            STA   ANI2+1
            JSR   ANIT        ; AFFICHAGE TETE

            LDA   A1
            CMP   #$0011      ; 18 ETAPES
            BPL   FIN1
            INC               ; IMAGE SUIVANTE
            STA   A1

            LDA   A1
            CMP   #$0001
            BNE   ANIM1b
            jsr   sound

ANIM1b      LDA   A1
            CMP   #$000A
            BNE   ANIM1a
            jsr   sound

ANIM1a      JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM1

FIN1        RTS

**************  PERSO DROITE *****************


ANIM2       LDA   A2          ; PERSO DROITE
            ASL
            TAX
            LDA   TABLE2,X
            clc
            adc   #$8000
            STA   ANI4+1
            LDA   #$5450      ; ECRAN LOCALISATION
            STA   ANI5+1
            JSR   ANIP        ; AFFICHAGE PERSO

            LDA   A2
            CMP   #$0007      ; 8 ETAPES
            BPL   FIN2
            INC               ; IMAGE SUIVANTE
            STA   A2

            LDA   A2
            CMP   #$0001
            BNE   ANIM2a
            jsr   sound

ANIM2a      JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM2

FIN2        RTS

**************  PERSO GAUCHE *****************

ANIM3       jsr   sound
ANIM3a      LDA   A3          ; PERSO GAUCHE
            ASL
            TAX
            LDA   TABLE3,X
            clc
            adc   #$8000
            STA   ANI4+1
            LDA   #$53FE      ; ECRAN LOCALISATION
            STA   ANI5+1
            JSR   ANIP        ; AFFICHAGE PERSO

            LDA   A3
            CMP   #$0007      ; 8 ETAPES
            BPL   FIN3
            INC               ; IMAGE SUIVANTE
            STA   A3

            JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM3a

FIN3        RTS

**************  VACHE  *****************

ANIM4       LDA   A4          ; VACHE
            ASL
            TAX
            LDA   TABLE4,X
            clc
            adc   #$8000
            STA   ANI4+1
            LDA   #$5650      ; ECRAN LOCALISATION
            STA   ANI5+1
            JSR   ANIP        ; AFFICHAGE VACHE

            LDA   A4
            CMP   #$000A      ; 11 ETAPES
            BPL   FIN4
            INC               ; IMAGE SUIVANTE
            STA   A4

            LDA   A4
            CMP   #$0006
            BNE   ANIM4a
            jsr   sound

ANIM4a      JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM4

FIN4        RTS

************** ROUTINE D'AFFICHAGE N[1 ******************

ANIT        LDY   #$003E      ; HAUTEUR TETE MORT

ANI0        ldx   #$000E      ; LONGUEUR TETE DE MORT
ANI1        LDAL  $0E8000,x
ANI2        stal  $012000,x
            DEX
            DEX
            bpl   ANI1

            LDA   ANI1+1
            CLC
            ADC   #$00A0
            STA   ANI1+1
            LDA   ANI2+1
            CLC
            ADC   #$00A0
            STA   ANI2+1

            DEY
            DEY
            BPL   ANI0

            RTS

************* ROUTINE D'AFFICHAGE N[2 ****************

ANIP        LDY   #$004B      ; HAUTEUR PERSONNAGES

ANI3        ldx   #$000E      ; LONGUEUR PERSONNAGES
ANI4        LDAL  $0E8000,x
ANI5        stal  $012000,x
            DEX
            DEX
            bpl   ANI4

            LDA   ANI4+1
            CLC
            ADC   #$00A0
            STA   ANI4+1
            LDA   ANI5+1
            CLC
            ADC   #$00A0
            STA   ANI5+1

            DEY
            DEY
            BPL   ANI3

            RTS

***********  ROUTINE D'AFFICHAGE N[3  ****************

ANIL        LDY   #$000C      ; HAUTEUR TRACE=6

ANI6        LDA   #$7777      ; COULEUR ROUGE
ANI7        stal  $012000     ; DESTINATION ECRAN

            LDA   ANI7+1
            CLC
            ADC   #$00A0
            STA   ANI7+1

            DEY
            DEY
            BPL   ANI6

            RTS

**********************************************

TABLE1      HEX   410152016301740185019601A701B801C901
            HEX   81169216A316B416C516D616E716F8160917

TABLE2      HEX   C12BD22BE32BF42B052C162C272C382C

TABLE3      HEX   E35DF45D055E165E275E385E495E492C

TABLE4      HEX   C144D244E344F44405451645274538454945C15DD25D

TP1         HEX   0F55CD538C524A510950C74E854D434C
            HEX   014BBF497D483B47F845B5447243CF428C414940A73F
            HEX   043F613EBF3D1C3D793C753C

TP2         HEX   25456346A247E0481E4A5D4B9C4CDA4D194F57509651D552
            HEX   135452559156D0570F594E5A8D5BCC5C0B5E4A5F

A1          HEX   0000
A2          HEX   0000
A3          HEX   0000
A4          HEX   0000

LI          HEX   0000

AP1         HEX   0000
NP1         HEX   0000
AP2         HEX   0000
NP2         HEX   0000

**********************************************

WAIT        CLC
            XCE               ; 8 BIT
            SEP   #$30
            LDA   #$DD
            JSR   $FCA8       ; ROUTINE ATTENTE
            CLC
            XCE               ; 16 BIT
            REP   #$30

            RTS

*-------------------------------
* play a sample
*-------------------------------

sound       clc
            xce
            rep   #$30

*-------------------------------
* met le son en ram son
*-------------------------------

            sep   #$20
            ldal  $e100ca
            and   #%00001111
            ora   #%01100000
            sta   $c03c
            stz   $c03e
            stz   $c03f

*-------------------------------
* joue le son en ram son
*-------------------------------

            ldal  $e100ca
            and   #$0f
            sta   $c03c

            lda   #$00        ; oscillo 0, frequence bas
            sta   $c03e
            lda   #$c4
            sta   $c03d

            lda   #$20        ; oscillo 0, frequence haut
            sta   $c03e
            lda   #$00
            sta   $c03d

            lda   #$40        ; oscillo 0, volume
            sta   $c03e
            lda   #$ff
            sta   $c03d

            lda   #$80        ; oscillo 0, adresse sound
            sta   $c03e
            lda   #$40
            sta   $c03d

            lda   #$c0        ; oscillo 0, taille du son
            sta   $c03e
            lda   #%00101101
            sta   $c03d

            lda   #$a0        ; oscillo 0, registre de controle
            sta   $c03e
            lda   #%00000010
            sta   $c03d       ; mode one-shot

            clc
            xce
            rep   #$30
            rts

