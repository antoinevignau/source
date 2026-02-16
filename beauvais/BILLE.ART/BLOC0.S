*
* Bloc 0
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            org   $a00
            lst   off

            hex   01

            sec
            xce
            sep   #$30
            ldx   #$00        ;reloge la routine
h0          lda   $800,x
            sta   $a00,x
            lda   $900,x
            sta   $b00,x
            inx
            bne   h0
            jmp   h1

h1          sec               ;verifie qu'on est
            jsr   $fe1f       ;sur un gs
            bcc   h2          ;si clc alors c'est bon
            hex   00          ;sinon plante tout simplement

h2          lda   $c036
            ora   #$80
            sta   $c036
            inc   $3f4
            lda   #$41        ;init ecran
            sta   $c029
            sta   $c00c
            sta   $c000
            jsr   $fe84
            jsr   $fb2f
            jsr   $fe93
            jsr   $fe89
            cld
            jsr   $fc58

            lda   #$01        ;bloc 1
            ldx   #$08        ;en $800
            jsr   read

            lda   #$02        ;main dir
            ldx   #$0c
            jsr   read
            lda   $c3c        ;block pointer A.IMAGE
            ldx   #$0c
            jsr   read

h3          lda   $0c00       ;charge le fichier
            beq   h5          ;boot
h4          ldx   #$10
            jsr   read
            inc   h3+1
            inc   h4+1
            inc   h4+1
            bra   h3

h5          ldx   #$00        ;affiche "unable to load prodos"
h6          lda   mes,x
            beq   h7
            sta   $5b1,x
            inx
            bra   h6

h7          lda   $c000       ;attend le control-x
            bpl   h7
            bit   $c010
            cmp   #$98
            bne   h7

            lda   $c034       ;couleur noire
            and   #$f0        ;et efface l'ecran
            sta   $c034
            lda   $c022
            and   #$f0
            sta   $c022
            jsr   $fc58       ;clear screen!!
            jsr   $1000
            sec
            xce
            sep   #$30
sync0       lda   $c019
            bpl   sync0
sync1       lda   $c019
            bmi   sync1
            lda   #$c1        ;affiche la shgr
            sta   $c029
            ldx   #$50        ;et lance le fichier
            lda   #$01        ;prodos
            jmp   $801

read        sta   bloc        ;lecture d'un bloc
            stx   memoire+1
            jsr   $c50d
            dfb   $01
            dw    tbl
            rts

tbl         hex   03
            hex   01
memoire     hex   0010
bloc        hex   000000

mes         asc   "UNABLE TO LOAD PRODOS"
            ds    \

