*
* Quickdraw score
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            org   $2000
            lst   off

* Les macros

_TLStart    MAC               ;Tool Locator
            Tool  $0201
            EOM
_TLShut     MAC
            Tool  $0301
            EOM
_MMStart    MAC               ;Memory Manager Tools
            pea   $0000
            Tool  $0202
            pla
            ora   #$0100
            sta   myID
            EOM
_MMShut     MAC
            lda   myID
            pha
            Tool  $0302
            EOM
_MTStart    MAC               ;Miscellaneous Tools
            Tool  $0203
            EOM
_MTShut     MAC
            Tool  $0303
            EOM
_QDStart    MAC               ;Quickdraw II Tools
            Tool  $0204
            EOM
_QDShut     MAC
            Tool  $0304
            EOM
_MoveTo     MAC
            Tool  $3a04
            EOM
_SetFoCo    MAC
            Tool  $a004
            EOM
_SetBaCo    MAC
            Tool  $a204
            EOM
_DrawChr    MAC
            Tool  $a404
            EOM
_DraCStr    MAC
            Tool  $a604
            EOM
_IMStart    MAC               ;Integer Math Tools
            Tool  $020b
            EOM
_Int2Dec    MAC
            Tool  $260b
            EOM
_IMShut     MAC
            Tool  $030b
            EOM
Tool        MAC               ;LoGo Tool ! The Best One
            ldx   #]1
            jsl   $e10000
            EOM

* Le programme

            clc
            xce
            rep   #$30

            _TLStart
            _MMStart
            _MTStart
            pea   $1000
            pea   $0000
            pea   $0000
            lda   myID
            pha
            _QDStart
            _IMStart

            pea   $000f       ;couleur du texte
            _SetFoCo
            pea   $0000       ;couleur du fond
            _SetBaCo

h0          ldx   #$0000
            lda   Nom,x
            sta   h2+1
            lda   Score,x
            sta   h3+1
*
            pea   $0010       ;affiche le nom
h1          pea   $0010
            _MoveTo
            pea   $0000
h2          pea   Nom1
            _DraCStr
*
h3          pea   $ffff       ;calcule le score
            pea   #^ScrStr    ;en ascii
            pea   ScrStr
            pea   $0005
            pea   $0000
            _Int2Dec
            pea   $0050
h4          pea   $0010
            _MoveTo

            ldx   #$0000      ;affiche le score
hA          phx               ;avec une justification
            lda   ScrStr,x    ;a droite
            and   #$00ff
            cmp   #$0020      ;attention!!
            bne   hB          ;pour Shaston 8,
            lda   #$0020      ;il faut 2 espaces
            jsr   hC          ;pour un vrai espace!
            lda   #$0020      ;bizarre, il faut
hB          jsr   hC          ;tout gerer soi-meme
            plx
            inx               ;mais vive les tools
            cpx   #$0005      ;c'est quand meme pratique
            bne   hA
            bra   hE

hC          sta   hD+1
hD          pea   $ffff
            _DrawChr
            rts
*
hE          lda   #$2020
            sta   ScrStr
            sta   ScrStr+1
*
            lda   h1+1        ;ligne suivante
            clc
            adc   #$0010
            sta   h1+1
            sta   h4+1
            lda   h0+1
            clc
            adc   #$0002
            sta   h0+1
            cmp   #$000a
            beq   h5
            brl   h0

h5          sep   #$30
]lp         lda   $c000
            bpl   ]lp
            bit   $c010
            rep   #$30

            _IMShut
            _QDShut
            _MTShut
            _MMShut
            _TLShut
            sec
            xce
            sep   #$30
            rts

myID        ds    4
Nom         da    Nom1,Nom2,Nom3,Nom4,Nom5
Nom1        asc   'LoGo   ',00
Nom2        asc   'Zardos ',00
Nom3        asc   'The    ',00
Nom4        asc   'Brutal ',00
Nom5        asc   'Deluxe ',00

Score       da    $ffff,$ff48,$8654,$008e,$0004
ScrStr      asc   '     ',00

