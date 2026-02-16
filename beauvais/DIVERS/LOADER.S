*
* Loader p8
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            lda   #$00        ;thermometre
            ldx   #$00
            ldy   #$20
            jsr   loader
            rts
*
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
            bcs   load5
            lda   open+5
            sta   get_eof+1
            sta   set_mark+1
            sta   read+1
            jsr   $bf00       ;get eof
            dfb   $d1
            dw    get_eof
            bcs   load5
            inc   get_eof+3
            lda   #$00
            sta   set_mark+2
            sta   set_mark+3
            sta   set_mark+4
load0       jsr   $bf00       ;set mark
            dfb   $ce
            dw    set_mark
            bcs   load5
            jsr   $bf00       ;read
            dfb   $ca
            dw    read
            bcs   load5
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
load5       jsr   load4
            lda   #$01
            sta   $c029
            clc
            xce
            rep   #$30
            pea   $dead
            pea   $0000
            pea   #errmsg
            ldx   #$1503
            jsl   $e10000
            brk

* All datas

errmsg      str   "Cannot load program! Error was: $"

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

nom         dw    nom1,nom2,nom3,nom4,nom5,nom6,nom7
nom1        str   "ECR"
nom2        str   "LOGO"
nom3        str   "MUSIC"
nom4        str   "MUSIC.W"
nom5        str   "PLAYER"
nom6        str   "SCROLL"
nom7        str   "GAME.SYSTEM"

