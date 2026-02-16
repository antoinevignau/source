*
* Beauvais loader
*
* (c) LoGo, 27/07/92
* v1.01 def
*
            org   $2000
            lst   off
            dsk   bovai.system
            typ   #$ff

            ldx   #$00
]lp         lda   $2100,x
            sta   $0800,x
            lda   $2200,x
            sta   $0900,x
            lda   $2300,x
            sta   $0a00,x
            lda   $2400,x
            sta   $0b00,x
            inx
            bne   ]lp
            jmp   $0800

            asc   "Bovai.system "
            asc   "v1.01, 27/07/92"
            ds    \

* Commence ici

            org   $0800

            stz   $3f2
            stz   $3f3
            stz   $3f4
            jsr   $bf00
            dfb   $c6
            dw    set_p
            lda   $c022
            sta   Sc022
            lda   #$f0
            sta   $c022
            lda   $c034
            sta   Sc034
            and   #$f0
            sta   $c034

*-------------------------------

            clc
            xce
            rep   #$30

            ldx   #$7ffe      ;clear image
]lp         lda   #$0000
            stal  $e12000,x
            dex
            dex
            bpl   ]lp
            sec
            xce
            sep   #$30

*-------------------------------

            lda   $c000
            bmi   z0
            lda   #$00        ;scrol
            ldx   #$00
            ldy   #$10
            jsr   loader
            lda   #$01        ;player
            ldx   #$00
            ldy   #$80
            jsr   loader
            lda   #$02        ;music
            ldx   #$05
            ldy   #$00
            jsr   loader
            lda   #$03        ;music.w
            ldx   #$03
            ldy   #$00
            jsr   loader

            lda   #$c1
            sta   $c029
            lda   $c000
            bmi   z0
            jsr   $8000       ;music on
            jsr   fadeout     ;fadeout
            jsr   $1000       ;anim on
            jsr   $8003       ;music off

z0          bit   $c010
            lda   #$04        ;charge directory PICTURES
            ldx   #$00        ;en $001000
            ldy   #$10
            jsr   loader
            jsr   $bf00       ;new_prefixe
            dfb   $c6
            dw    set_p1

*-------------------------------

a0          lda   #$2b        ;debut en $102b
            sta   $fe
            lda   #$10
            sta   $ff

a1          ldy   #$10
            lda   ($fe),y
            cmp   #$c0
            bne   a2a

            ldy   #$00        ;longueur du nom
            lda   ($fe),y
            and   #$0f
            sta   nom6
            tax
a2          iny
            lda   ($fe),y     ;recopie le nom
            ora   #$80
            sta   nom6,y
            dex
            bpl   a2

            lda   #$05        ;charge l'image
            ldx   #$00
            ldy   #$20
            jsr   loader
            bcs   a0
            jsr   fadeout     ;efface
            jsr   unpack      ;decompacte
            jsr   fadein
            jsr   b0
a2a         lda   $fe         ;prochaine image
            clc
            adc   #$27
            sta   $fe
            bcc   a3
            inc   $ff
a3          cmp   #$ff
            bne   a1
            lda   #$04
            sta   $fe
            inc   $ff
            bra   a1

b0          ldx   #$40        ;routine d'attente
b1          lda   #$a0
            jsr   $fca8
            lda   $c000
            bmi   b2
            dex
            bpl   b1
            rts
b2          bit   $c010
            cmp   #$9b        ;esc:...pause
            beq   b3
            cmp   #$91        ;ct_Q:..quitter
            beq   b4
            rts

b3          lda   $c034
            and   #$f0
            ora   #$0c
            sta   $c034
]lp         lda   $c000       ;pause
            bpl   ]lp
            lda   $c034
            and   #$f0
            ora   #$00
            sta   $c034
            bra   b1

b4          sec
            xce
            sep   #$30
            jsr   fadeout     ;quitte le programme
            lda   #$01
            sta   $c029
            lda   Sc022
            sta   $c022
            lda   Sc034
            sta   $c034
            jsr   $bf00
            dfb   $65
            dw    quit

*-------------------------------
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

*-------------------------------
* Fade in

fadein      clc               ;fadein de $012000 a $e12000
            xce
            rep   #$30
            ldx   #$7dde
in0         ldal  $012000,x
            stal  $e12000,x
            dex
            dex
            bpl   in0
            ldy   #$000f
in1         ldx   #$01fe
in2         ldal  $e19e00,x
            and   #$000f
            sta   temp
            ldal  $019e00,x
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
            ldal  $019e00,x
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
            ldal  $019e00,x
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

*-------------------------------
* Unpack bytes

unpack      clc               ;unpack file at $012000
            xce
            rep   #$30
            lda   #$8000
            sta   picsize
            lda   #$0001
            sta   picptr+2
            lda   #$2000
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

*-------------------------------
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
            clc
            rts
load5       jsr   load4
            sec
            rts

*-------------------------------
* All datas

quit        dfb   $04
            hex   01
            hex   0000000000

set_p       dfb   $01
            da    $0280

set_p1      dfb   $01
            da    prefix

open        dfb   $03
            da    nom1
            da    $b400
            hex   00

read        dfb   $04
            hex   00
            da    $b000
            da    $0200
            da    $0000

close       dfb   $01
            hex   00

set_mark    dfb   $02
            hex   00
            hex   000000

get_eof     dfb   $02
            hex   00
            hex   000000

prefix      str   "/BEAUVAIS.92/PICTURES/"
nom         dw    nom1,nom2,nom3,nom4,nom5,nom6
nom1        str   "SCROL"
nom2        str   "PLAYER"
nom3        str   "MUSIC"
nom4        str   "MUSIC.W"
nom5        str   "PICTURES"
nom6        str   "               "

buffer      adrl  $00002000
picptr      adrl  $00012000
picsize     da    $8000
temp        ds    2
Sc022       ds    1
Sc034       ds    1

