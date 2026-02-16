*
* mouse 2
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            org   $1000
            lst   off

********************************

            jsr   $fc58
            clc
            xce
            rep   #$30

            pea   $0000
            ldx   #$1803
            jsl   $e10000
            pea   $0001
            ldx   #$1903
            jsl   $e10000
            pea   $0000
            pea   $0020
            pea   $0000
            pea   $001e
            ldx   #$1c03
            jsl   $e10000
            ldx   #$1a03
            jsl   $e10000

********************************

h0          clc
            xce
            rep   #$30
            pea   $0000
            pea   $0000
            pea   $0000
            ldx   #$1703
            jsl   $e10000
            pla
            sta   savex
            pla
            sta   savey
            pla
            sta   status

            sec
            xce
            sep   #$30
            lda   #$00
            sta   $24
            jsr   $fb5b
            ldx   #$00
h1          lda   savex,x
            jsr   $fdda
            inx
            cpx   #$06
            bne   h1

            lda   $c000
            bpl   h0
            bit   $c010
            rts

savex       ds    2
savey       ds    2
status      ds    1
mode        ds    1

