*
* Unpackbytes
*
* (c) LoGo, 22/07/92
* v1.00 def
*
            ldx   #$06
            ldy   #$00
            jsr   unpack
            rts
*
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
            pha               ;i.e. de l'image compactee
            lda   buffer
            pha
            lda   get_eof+2   ;taille du buffer source
            pha               ;i.e. de l'image compactee

            pea   #^picptr    ;adresse de l'ecran
            pea   #picptr     ;destination $e12000
            pea   #^picsize   ;taille de l'ecran
            pea   #picsize    ;destination $8000

            ldx   #$2703      ;appel au tool
            jsl   $e10000
            pla
            sec
            xce
            sep   #$30
            rts
*
picptr      adrl  $00e12000
picsize     da    $8000
get_eof     da    $1234

