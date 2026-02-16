*
* The Brutal Deluxe 256
*
* (c) LoGo, 12/91
* v1.00 def
*
            org   $1000
            lst   off

* Image charg{e en $e12000
* puis d{plac{e en $032000

*------------------------------*

            clc
            xce
            sep   #$30
            lda   #$c1
            sta   $c029

            jsr   move_im      ;deplace image en $032000
            jsr   init_mo      ;active la souris
entry       jsr   init_ec      ;affiche l'ecran de travail
entryA      jsr   set_20       ;met les 20 lignes
            jsr   set_scb      ;met les 20 scb
            jsr   set_col      ;met les couleurs
            rep   #$30
            lda   #$ffff
            jsr   set_adr      ;affiche l'endroit
            jsr   decode       ;decode l'ecran
entryB      jsr   dkod         ;decode a l'ecran
            jsr   scr_dat      ;sauve le fond
            jsr   cur_scr      ;affiche le curseur
entry0      jsr   read_mo      ;lit la souris
            lda   coorx
            cmp   oldx
            bne   entry1
            lda   coory
            cmp   oldy
            beq   entry2
entry1      jsr   dat_scr      ;reaffiche le fond
            jsr   scr_dat      ;sauvegarde le fond
            jsr   cur_scr      ;affiche le curseur
entry2      lda   status
            cmp   #$c001
            bne   entry2A
            jsr   clicklak     ;on a appuye sur le bouton
            brl   entryB
entry2A     sep   #$30
            lda   $c000
            bpl   entry0
            bit   $c010
            cmp   #$a0         ;espace, on affiche
            beq   entry3
            cmp   #$9b         ;escape, on quitte
            beq   entry4
            cmp   #"8"         ;8, ligne-20
            beq   entry5
            cmp   #"2"         ;2, ligne+20
            beq   entry6
            cmp   #"4"         ;4, endroit-1
            beq   entry7A
            cmp   #"6"         ;6, endroit+1
            beq   entry8A
            cmp   #$89         ;TAB, help screen
            beq   entry9A
            brl   entry0
entry7A     brl   entry7
entry8A     brl   entry8
entry9A     brl   entry9

entry3      rep   #$30
            jsr   recode
            jsr   rkod
            jsr   show_ec      ;affiche l'ecran
            sep   #$30
]lp         lda   $c000
            bpl   ]lp
            bit   $c010
            brl   entry
entry4      jsr   dat_scr
            jsr   show_ec
            sec
            xce
            sep   #$30
            jsr   $fc58
            lda   #$21
            sta   $c029
            rts

entry5      rep   #$30         ;ligne-20
            jsr   dat_scr
            lda   soury
            bne   ent5
            brl   entry1
ent5        jsr   recode
            jsr   rkod
            lda   soury
            sec
            sbc   #0040
            sta   soury
            lda   scby
            sec
            sbc   #0020
            sta   scby
            brl   entryA

entry6      rep   #$30         ;ligne+20
            jsr   dat_scr
            lda   soury
            cmp   #360
            beq   ent6
            jsr   recode
            jsr   rkod
            lda   soury
            clc
            adc   #0040
            sta   soury
            lda   scby
            clc
            adc   #0020
            sta   scby
            brl   entryA
ent6        brl   entry1

entry7      rep   #$30         ;endroit-1
            jsr   dat_scr
            lda   endroit
            bne   ent7
            brl   entry1
ent7        jsr   recode
            jsr   rkod
            lda   #$0000
            jsr   set_adr
            dec   endroit
            brl   entryA

entry8      rep   #$30         ;endroit+1
            jsr   dat_scr
            lda   endroit
            cmp   #0009
            beq   ent8
            jsr   recode
            jsr   rkod
            lda   #$0000
            jsr   set_adr
            inc   endroit
            brl   entryA
ent8        brl   entry1

entry9      rep   #$30         ;help screen
            jsr   dat_scr
            sep   #$30
            lda   #$21
            sta   $c029
            jsr   $fc58
            clc
            xce
            rep   #$30
            ldx   #$03fe
]lp         lda   $1900,x
            sta   $0400,x
            dex
            dex
            bpl   ]lp
            sep   #$30
]lp         lda   $c000
            bpl   ]lp
            bit   $c010
            lda   #$c1
            sta   $c029
            rep   #$30
            jsr   init_mo
            brl   entry1

*------------------------------*

move_im     rep   #$30         ;sauve l'image
            ldx   #$7ffe
]lp         ldal  $e12000,x
            stal  $032000,x
            dex
            dex
            bpl   ]lp

            stz   soury
            stz   scby
            stz   endroit
            rts

*------------------------------*

init_mo     rep   #$30
            pea   $0000        ;init mouse
            ldx   #$1803
            jsl   $e10000
            pea   $0001
            ldx   #$1903
            jsl   $e10000
            pea   $0001        ;clamp mouse
            pea   $0033
            pea   $0000
            pea   $0013
            ldx   #$1c03
            jsl   $e10000
            rts

*------------------------------*

read_mo     clc                ;read mouse
            xce
            rep   #$30
            pea   $0000
            pea   $0000
            pea   $0000
            ldx   #$1703
            jsl   $e10000
            pla
            sta   status
            pla
            sta   coory
            pla
            sta   coorx
            rts

*------------------------------*

init_ec     rep   #$30         ;efface ecran
            ldx   #$7ffe
            lda   #$0000
]lp         stal  $e12000,x
            dex
            dex
            bpl   ]lp
            rts

*------------------------------*

show_ec     rep   #$30         ;montre l'ecran
            ldx   #$7ffe
]lp         ldal  $032000,x
            stal  $e12000,x
            dex
            dex
            bpl   ]lp
            rts

*------------------------------*

set_20      rep   #$30         ;met les 20 lignes et palettes
            ldy   soury
            ldx   #$0000
ec0         lda   ecran,y
            sta   ec1+1
            lda   ecran,x
            sta   ec2+1
            phx
            ldx   #$009e
ec1         ldal  $032000,x
ec2         stal  $e12000,x
            dex
            dex
            bpl   ec1
            iny
            iny
            plx
            inx
            inx
            cpx   #$0028
            bne   ec0

            ldx   #$01fe
ec3         ldal  $039e00,x
            stal  $e19e00,x
            dex
            dex
            bpl   ec3
            rts

*------------------------------*

set_scb     sep   #$30         ;met les bonnes scb
            ldy   scby
            ldx   #$00
scb0        sty   scb1+1
scb1        ldal  $039d00
            stal  $e19d00,x
            iny
            inx
            cpx   #$14
            bne   scb0
            rep   #$30
            rts

*------------------------------*

set_col     rep   #$30         ;affiche les 16 couleurs
            ldy   #190
col0        ldx   #$0003
col1        phx
            lda   ecran,y
            sta   col2+1
            ldx   #107
            lda   #$0000
col2        stal  $e12000,x
            clc
            adc   #$1111
            inx
            inx
            inx
            cpx   #155
            bne   col2
            iny
            iny
            plx
            dex
            bpl   col1
            iny
            iny
            cpy   #382
            bcc   col0

            sep   #$30
            stz   col3+1
            ldx   #95
col3        ldal  $e19d00
            stal  $e19d00,x
            inx
            stal  $e19d00,x
            inx
            stal  $e19d00,x
            inx
            stal  $e19d00,x
            inx
            inx
            inc   col3+1
            lda   col3+1
            cmp   #20
            bne   col3
            rep   #$30
            rts

*------------------------------*

clicklak    rep   #$30         ;test le clic
            jsr   dat_scr
            lda   coorx
            cmp   #0033
            bcc   clim         ;dans image
            cmp   #0036
            bcs   clcol        ;dans couleur
            rts
clcol       jsr   cur_col
            rts
clim        lda   coory
            asl
            tay
            lda   buffer,y
            sta   clim0+1
            sep   #$30
            lda   coorx
            sec
            sbc   #$01
            tax
            lda   zecol
clim0       sta   $2000,x
            rep   #$30
            jsr   recode
            jsr   show_mo      ;affiche dans les 20 lignes
            rts

*------------------------------*

cur_col     rep   #$30         ;affiche la couleur courante
            lda   coorx
            sec
            sbc   #0036
            sta   ccol0+1
            sta   zecol
            asl
            asl
            asl
            asl
            clc
ccol0       adc   #$0000
            sta   ccol1+1
            asl
            asl
            asl
            asl
            asl
            asl
            asl
            asl
            clc
ccol1       adc   #$0000
            ldx   #$009e
]lp         stal  $e13400,x
            stal  $e134a0,x
            stal  $e13540,x
            stal  $e135e0,x
            dex
            dex
            bpl   ]lp

            sep   #$30
            ldx   coory
            ldal  $e19d00,x
            stal  $e19d20
            stal  $e19d21
            stal  $e19d22
            stal  $e19d23
            rep   #$30
            rts

*------------------------------*

set_adr     sta   adrA+1       ;affiche le trait
            lda   #$0000
            ldx   endroit
            beq   adr0
]lp         clc
            adc   #$0010
            dex
            bne   ]lp
adr0        tax
            clc
            adc   #$0010
            sta   adr2+1
            ldy   #0050
            lda   ecran,y
            sta   adr1+1
adrA        lda   #$ffff
adr1        stal  $e12000,x
            inx
            inx
adr2        cpx   #$0000
            bne   adr1
            rts

*------------------------------*

decode      sep   #$30         ;decode les 20 premieres lignes
            ldx   endroit
            lda   colonne,x
            sta   deco1+1
            clc
            adc   #$10
            sta   deco3+1
            lda   #$00         ;buffer en $2000
            sta   deco4+1      ;de 32*20 pixels!
            lda   #$20
            sta   deco4+2
            ldy   #$00
deco0       lda   ecran,y
            sta   deco2+1
            iny
            lda   ecran,y
            sta   deco2+2
deco1       ldx   #$0000
deco2       ldal  $e12000,x
            pha
            and   #$f0
            lsr
            lsr
            lsr
            lsr
            jsr   deco4
            pla
            and   #$0f
            jsr   deco4
            inx
deco3       cpx   #$0000
            bne   deco2
            iny
            cpy   #0040
            bne   deco0
            bra   deco5

deco4       sta   $2000        ;sauve la valeur
            inc   deco4+1
            bne   deco5
            inc   deco4+2
deco5       rts

*------------------------------*

dkod        clc                ;affiche a l'ecran
            xce
            rep   #$30
            lda   #$2000
            sta   dkod0+1
            lda   #190
            sta   dkod3+1
            lda   #$0003
            sta   dkod5+1

dkod0       lda   $2000
            and   #$00ff
            sta   dkod1+1
            asl
            asl
            asl
            asl
            clc
dkod1       adc   #$0000
            jsr   dkod2
            inc   dkod0+1
            lda   dkod0+1
            cmp   #$2280
            bne   dkod0
            rts

dkod2       sta   dkod6+1
dkod3       ldy   #190
            ldx   #$0003
dkod4       phx
            lda   ecran,y
            sta   dkod7+1
            sta   dkod7a+1
dkod5       ldx   #$0002
dkod6       lda   #$0000
dkod7       stal  $e12000,x
            inx
dkod7a      stal  $e12000,x
            iny
            iny
            plx
            dex
            bpl   dkod4
            lda   dkod5+1
            clc
            adc   #$0003
            sta   dkod5+1
            cmp   #0099
            bne   dkod8
            lda   #$0003
            sta   dkod5+1
            lda   dkod3+1
            clc
            adc   #0010
            sta   dkod3+1
dkod8       rts

*------------------------------*

recode      rep   #$30         ;recode les 20 premieres lignes
            lda   #$2000       ;buffer en $3000
            sta   rcod2+1      ;16 octets*20 lignes= 320 bytes
            lda   #$3000
            sta   rcod4+1
rcod0       sep   #$30
            jsr   rcod2
            asl
            asl
            asl
            asl
            sta   rcod1+1
            jsr   rcod2
            clc
rcod1       adc   #$00
            jsr   rcod4
            rep   #$30
            lda   rcod2+1
            cmp   #$2280
            bne   rcod0
            rts

rcod2       lda   $ffff        ;lit le buffer
            inc   rcod2+1
            bne   rcod3
            inc   rcod2+2
rcod3       rts
rcod4       sta   $ffff        ;ecrit le buffer
            inc   rcod4+1
            bne   rcod5
            inc   rcod4+2
rcod5       rts

*------------------------------*

rkod        sep   #$30         ;sauve a l'ecran
            ldx   endroit
            lda   colonne,x
            sta   rkod0+1
            clc
            adc   #$10
            sta   rkod3+1
            rep   #$30
            lda   #$3000       ;buffer lecture
            sta   rkod1+1
            lda   soury
            tay
            clc
            adc   #0040
            sta   rkod4+1

rkod0       ldx   #$0000
            lda   ecran,y
            sta   rkod2+1
rkod1       lda   $3000
rkod2       stal  $032000,x
            lda   rkod1+1
            clc
            adc   #$0002
            sta   rkod1+1
            cmp   #$3140
            beq   rkod5
            inx
            inx
rkod3       cpx   #$0000
            bne   rkod1
            iny
            iny
rkod4       cpy   #$0000
            bne   rkod0
rkod5       rts

*------------------------------*

show_mo     sep   #$30         ;sauve a l'ecran
            ldx   endroit
            lda   colonne,x
            sta   show0+1
            clc
            adc   #$10
            sta   show3+1
            rep   #$30
            lda   #$3000       ;buffer lecture
            sta   show1+1
            ldy   #$0000
show0       ldx   #$0000
            lda   ecran,y
            sta   show2+1
show1       lda   $3000
show2       stal  $e12000,x
            lda   show1+1
            clc
            adc   #$0002
            sta   show1+1
            cmp   #$3140
            beq   show4
            inx
            inx
show3       cpx   #$0000
            bne   show1
            iny
            iny
            cpy   #0040
            bne   show0
show4       rts

*------------------------------*

scr_dat     rep   #$30         ;met le fond de l'ecran dans
            lda   #datacur     ;le buffer
            sta   dat2+1
            lda   coory
            asl
            tay
            lda   curlig,y
            asl
            tay
            clc
            adc   #$0010
            sta   dat4+1
dat0        lda   ecran,y
            sta   dat1+1
            lda   coorx
            asl
            tax
            lda   curcol,x
            tax
            clc
            adc   #$0002
            sta   dat3+1
dat1        ldal  $e12000,x
dat2        sta   datacur
            lda   dat2+1
            clc
            adc   #$0002
            sta   dat2+1
            inx
            inx
dat3        cpx   #$0000
            bne   dat1
            iny
            iny
dat4        cpy   #$0000
            bne   dat0
            rts

*------------------------------*

dat_scr     rep   #$30         ;affiche les datas
            lda   #datacur
            sta   dcr1+1
            lda   oldy
            asl
            tay
            lda   curlig,y
            asl
            tay
            clc
            adc   #$0010
            sta   dcr4+1
dcr0        lda   ecran,y
            sta   dcr2+1
            lda   oldx
            asl
            tax
            lda   curcol,x
            tax
            clc
            adc   #$0002
            sta   dcr3+1
dcr1        lda   curseur
dcr2        stal  $e12000,x
            lda   dcr1+1
            clc
            adc   #$0002
            sta   dcr1+1
            inx
            inx
dcr3        cpx   #$0000
            bne   dcr1
            iny
            iny
dcr4        cpy   #$0000
            bne   dcr0
            rts

*------------------------------*

cur_scr     rep   #$30         ;affiche le curseur
            lda   #curseur
            sta   scr1+1
            lda   coory
            asl
            tay
            lda   curlig,y
            asl
            tay
            clc
            adc   #$0010
            sta   scr4+1
scr0        lda   ecran,y
            sta   scr2+1
            lda   coorx
            asl
            tax
            lda   curcol,x
            tax
            clc
            adc   #$0002
            sta   scr3+1
scr1        lda   curseur
scr2        stal  $e12000,x
            lda   scr1+1
            clc
            adc   #$0002
            sta   scr1+1
            inx
            inx
scr3        cpx   #$0000
            bne   scr1
            iny
            iny
scr4        cpy   #$0000
            bne   scr0
            lda   coorx
            sta   oldx
            lda   coory
            sta   oldy
            rts

*------------------------------*

cadry       ds    2            ;coordonnees
cadrx       ds    2            ;du cadre
soury       ds    2            ;ligne de depart de l'image pour les 20 lignes
scby        ds    2            ;scb de depart pour au-dessus!
endroit     ds    2            ;partie a afficher
zecol       ds    2            ;la couleur

oldx        da    36           ;datas souris
oldy        da    2
coorx       da    36
coory       da    2
status      ds    2

datacur     ds    16
curseur     hex   0000
            hex   ff00
            hex   fff0
            hex   ffff
            hex   ffff
            hex   0ff0
            hex   0ff0
            hex   0000

curlig      =     *            ;pour le curseur
]curlig     =     $5f
            lup   20
            da    ]curlig
]curlig     =     ]curlig+$05
            --^

curcol      =     *            ;pour le curseur
]curcol     =     $00
            lup   53
            da    ]curcol
]curcol     =     ]curcol+$03
            --^

buffer      =     *            ;pour le buffer
]buf        =     $2000
            lup   20
            da    ]buf
]buf        =     ]buf+$20
            --^

colonne     =     *            ;les adresses des colonnes
]col        =     $00
            lup   10
            dfb   ]col
]col        =     ]col+$10
            --^

ecran       =     *            ;toutes les lignes d'ecran
]ecran      =     $2000
            lup   200
            da    ]ecran
]ecran      =     ]ecran+$a0
            --^

*------------------------------*

