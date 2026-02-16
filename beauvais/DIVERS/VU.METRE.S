*
* Vu-metre
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            org   $1000
            lst   off
*
            ldx   #$1f
]lp         stz   $300,x
            stz   table,x
            dex
            bpl   ]lp
            jsr   $fc58
            jsr   $8000
*
            lda   #$5c
            stal  $e10030
            lda   #$00
            stal  $e10033
            lda   #inter
            stal  $e10031
            lda   #>inter
            stal  $e10032
            lda   $c041
            ora   #$08
            sta   $c041
            rts
*
inter       sep   #$30
            phb
            phk
            plb

h1          lda   $c019
            bmi   h1
]lp         lda   $c019
            bpl   ]lp

            clc
            xce
            rep   #$30
            ldx   #$0000
h2          lda   $300,x
            and   #$000f
            beq   down
            asl
            cmp   table,x
            beq   down
            bcs   up

down        lda   table,x     ;descend
            tay
            lda   ecran,x
            sta   prdown+1
            lda   #"  "
prdown      sta   $400,y
            lda   table,x
            beq   end
            dec   table,x
            bra   end

up          sta   pr+1
            sta   prsave+1
            lda   table,x
            tay
            lda   ecran,x
            sta   prup+1
            lda   #"--"
prup        sta   $400,y
            iny
prsave      cpy   #$0020
            bne   prup
pr          lda   #$0000
            sta   table,x
            lda   #$0000
            sta   $300,x

end         inx
            inx
            cpx   #$001e
            bne   h2

            plb
            clc
            cli
            rtl

table       ds    32

ecran       da    $400,$480,$500,$580,$600,$680,$700,$780
            da    $428,$4a8,$528,$5a8,$628,$6a8,$728,$7a8
            da    $450,$4d0,$550,$5d0,$650,$6d0,$750,$7d0

