*
* Lecture du joystick par la
* routine en rom: $fb1e (pread)
* input:  X= 0, 1, 2, 3 (paddle to read)
* output: Y= paddle count
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            org   $1000
            lst   off
*
            jsr   $fc58       ;home
h0          lda   #$02        ;htab 2
            sta   $24
            lda   #$03        ;vtab 3
            jsr   $fb5b       ;tabv
            ldx   #$00        ;paddle 0
            jsr   $fb1e
            tya
            jsr   $fdda       ;print it

            lda   #$a0        ;espace
            jsr   $fded
            ldx   #$01        ;paddle 1
            jsr   $fb1e
            tya
            jsr   $fdda       ;print it

            lda   $c000       ;wait for a keypress
            bpl   h0
            bit   $c010
            rts

