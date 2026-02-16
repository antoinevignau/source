*
* Comment ralentir un scroll
*
* (c) Logo, 22/07/92
* v1.00 def

* Eh bien, c'est hyper facile,
* il suffit de demander a ne deplacer
* que tout les 4 appels
*
* On lance un scroll par JSR SCROLL
* voici ce qu'il faut au debut de la routine

SCROLL      lda   #$00fc
            beq   VASY

PAENCOR     inc   SCROLL+1
            rts

VASY        lda   #$00fc
            sta   SCROLL+1

* C'est tout...
*
* PAENCOR incremente le compteur
* lorsqu'il sera a $0000 alors on
* deplace et VASY remet $00fc pour
* attendre 4 tours ($fc, $fd, $fe, $ff)
*
* C'est-y-pas-simple ?

