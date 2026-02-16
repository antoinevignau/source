*
* Init 40 colonnes
*
* (c) LoGo, 22/07/92
* v1.00 def
*

            sta   $c00c
            sta   $c000
            jsr   $fe84
            jsr   $fb2f
            jsr   $fe93
            jsr   $fe89
            cld
            jsr   $fc58

