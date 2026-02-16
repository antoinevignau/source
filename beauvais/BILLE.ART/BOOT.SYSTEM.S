*
* Charge presentation
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            org   $2000
            lst   off
            dsk   boot.system
            typ   #$ff

            ldx   #$00
a0          lda   $2100,x
            sta   $0800,x
            lda   $2200,x
            sta   $0900,x
            lda   $2300,x
            sta   $0a00,x
            inx
            bne   a0
            jmp   $0800

            asc   "Boot.system "
            asc   "v1.00, 16/07/92"
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

            lda   #$00        ;thermometre
            ldx   #$00
            ldy   #$20
            jsr   loader
            ldx   #$06
            ldy   #$00
            jsr   unpack

            lda   #$01        ;image de boot
            ldx   #$00
            ldy   #$20
            jsr   loader
            ldx   #$06
            ldy   #$80
            jsr   unpack

            lda   #$02        ;music
            ldx   #$05
            ldy   #$00
            jsr   loader

            lda   #$03        ;music.w
            ldx   #$03
            ldy   #$00
            jsr   loader

            lda   #$04        ;player
            ldx   #$00
            ldy   #$80
            jsr   loader

            lda   #$05        ;scroll
            ldx   #$00
            ldy   #$20
            jsr   loader

            jsr   $8000       ;play music
            jsr   fadeout     ;efface l'ecran
            ldx   #$06
            ldy   #$80
            jsr   fadein      ;affiche de nouveau
            jsr   $2000       ;fait le scroll
            jsr   fadeout     ;efface l'ecran
            ldx   #$06
            ldy   #$00
            jsr   fadein      ;affiche le thermometre
            jsr   $8003       ;music off
            lda   #$06        ;charge le gamesystem
            ldx   #$00
            ldy   #$20
            jsr   loader
            jmp   $2000       ;saut

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

buffer      adrl  $00002000
picptr      adrl  $00060000
picsize     da    $8000
temp        ds    2

