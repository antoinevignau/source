*
* Chargeur de fichier
* pour LABYRINTHE
*
* (k) LoGo, 12/91
*

            org   $2000
            lst   off
            dsk   anim.system
            typ   #$ff

*-------------------------------

            jsr   $c300
            lda   #$15
            jsr   $fded
            jsr   $fb2f
            jsr   $fc58
            sta   $c05e
            sta   $c05f

*-------------------------------

            jsr   $bf00
            dfb   $c6
            dw    set_p

            jsr   $bf00
            dfb   $cc
            dw    close

*-------------------------------

            ldx   #$00
            lda   #$10
            jsr   load        ;animation
            ldx   #$01
            lda   #$40
            jsr   load        ;picture
            ldx   #$02
            lda   #$80
            jsr   load        ;sprite
            ldx   #$03
            lda   #$90
            jsr   load        ;music

*-------------------------------

            lda   $c036
            and   #$7f
            sta   $c036
            jmp   $1000

*-------------------------------

load        sta   read+3
            txa
            asl
            tax
            lda   name,x
            sta   open+1
            inx
            lda   name,x
            sta   open+2

            jsr   $bf00
            dfb   $c8
            dw    open
            lda   open+5
            sta   read+1
            sta   get_eof+1

            jsr   $bf00
            dfb   $d1
            dw    get_eof
            lda   get_eof+2
            sta   read+4
            lda   get_eof+3
            sta   read+5

            jsr   $bf00
            dfb   $ca
            dw    read

            jsr   $bf00
            dfb   $cc
            dw    close
            rts

*-------------------------------

set_p       dfb   $01
            hex   8002

open        dfb   $03
            dw    path
            hex   001c
            hex   ff

read        dfb   $04
            hex   ff
            da    $1000
            hex   ffff
            hex   ffff

close       dfb   $01
            hex   00

get_eof     dfb   $02
            hex   ff
            hex   ffffff

path        str   "               "

name        dw    name0,name1,name2,name3
name0       str   "ANIMATION"
name1       str   "PICTURE"
name2       str   "SPRITE"
name3       str   "MUSIC"

