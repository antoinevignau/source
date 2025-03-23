*
* Dhgr to shgr
* 7*16 to 16*16
*
* (c) Deckard, 91
* (k) LoGo, 12/91
*

            org   $1000
            lst   off

* Sprite dhgr  $2000
* Sprite shgr  $3000

* Memory adresses -------------*

octwait     =     $ed
datasp      =     $2000
tabl        =     $2100
savemod     =     $3000

* Entry point -----------------*

            jsr   decode
            jsr   recode
            rts

* Decodage du sprite dhgr -----*

decode      ldx   #$00
            stx   $ee
decode2     lda   #0
            sta   $ef
            jsr   decode4
decode3     ldy   $ef
            lda   ligne,y
            tay
            lda   eqcol,y
            ldy   $ee
            sta   tabl,y
            inc   $ee
            inc   $ef
            lda   $ef
            cmp   #$07
            bne   decode3
            inx
            cpx   #$40
            bne   decode2
            rts

decode4     lda   datasp,x
            tay
            and   #%00001111
            pha
            tya
            and   #%01110000
            lsr
            lsr
            lsr
            lsr
            sta   octwait
            inx
            lda   datasp,x
            tay
            and   #%00000001
            asl
            asl
            asl
            eor   octwait
            pha
            tya
            and   #%00011110
            lsr
            pha
            tya
            and   #%01100000
            lsr
            lsr
            lsr
            lsr
            lsr
            sta   octwait
            inx
            lda   datasp,x
            tay
            and   #%00000011
            asl
            asl
            eor   octwait
            pha
            tya
            and   #%00111100
            lsr
            lsr
            pha
            tya
            clc
            and   #%01000000
            rol
            rol
            rol
            sta   octwait
            inx
            lda   datasp,x
            tay
            and   #%00000111
            asl
            eor   octwait
            pha
            tya
            and   #%01111000
            lsr
            lsr
            lsr
            pha

            ldy   #$06
decode5     pla
            sta   ligne,y
            dey
            bpl   decode5
            rts

* Codage sprite shgr ----------*

recode      ldx   #$7f
            lda   #$00
recode2     sta   $3000,x
            dex
            bpl   recode2
            sta   recode4+1
            sta   recode5+1

            ldy   #$0f
recode3     ldx   #$00
recode4     lda   tabl,x
            sta   octwait
            asl
            asl
            asl
            asl
            eor   octwait
            jsr   recode5
            inx
            cpx   #$07
            bne   recode4
            lda   #$00
            jsr   recode5
            lda   recode4+1
            clc
            adc   #$07
            sta   recode4+1
            dey
            bpl   recode3
            rts

recode5     sta   $3000
            inc   recode5+1
            rts

* All datas -------------------*

ligne       ds    7
eqcol       hex   0008040c020a060e0109050d030b070f

