*-----------------
* IFF
*-----------------

IFF_ID        =     0              ; block 4
IFF_BITMAP    =     $08            ; block 8
IFF_WIDTH     =     $14            ; word
IFF_HEIGHT    =     $16            ; word
IFF_PLANES    =     $1C            ; byte
IFF_MASK      =     $1D            ; byte
IFF_ENCODING  =     $1E            ; byte
IFF_TRANS     =     $20            ; word

*---

unpIFF        lda   ptrBUFFER
              sta   Debut
              lda   ptrBUFFER+2
              sta   Debut+2

              ldy   #IFF_ID
              lda   [Debut],y
              cmp   #'FO'          ; FO
              bne   unpIFF1
              iny
              iny
              lda   [Debut],y
              cmp   #'RM'          ; RM
              beq   unpIFF2
unpIFF1       _errFORMAT

unpIFF2       ldy   #IFF_BITMAP
              ldx   #0
              lda   [Debut],y
              cmp   #'PB'
              beq   unpIFF3
              cmp   #'IL'          ; IL
              bne   unpIFF1
unpIFF3       iny
              iny
              lda   [Debut],y
              cmp   #'M '
              beq   unpIFF4
              inx
              cmp   #'BM'          ; BM
              bne   unpIFF1

unpIFF4       stx   IFFformat
              iny
              iny
              lda   [Debut],y
              cmp   #'BM'          ; BM
              bne   unpIFF1
              iny
              iny
              lda   [Debut],y
              cmp   #'HD'          ; HD
              bne   unpIFF1

              ldy   #IFF_WIDTH
              lda   [Debut],y
              xba
              sta   picWIDTH
              bne   unpIFF41
              _errSIZE

unpIFF41      ldy   #IFF_HEIGHT
              lda   [Debut],y
              xba
              sta   picHEIGHT
              bne   unpIFF42
              _errSIZE

unpIFF42      lda   picWIDTH
              cmp   #maxWIDTH
              bcc   unpIFF5
              beq   unpIFF5
              _errSIZE
unpIFF5       lda   picHEIGHT
              cmp   #maxHEIGHT
              bcc   unpIFF6
              beq   unpIFF6
              _errSIZE

unpIFF6       ldy   #IFF_PLANES
              lda   [Debut],y
              and   #$ff
              sta   picPLANES
              ldx   #3
              cmp   #1
              beq   unpIFF7
              dex
              cmp   #2
              beq   unpIFF7
              dex
              cmp   #4
              beq   unpIFF7
              dex
              cmp   #8
              beq   unpIFF7
              _errFORMAT

unpIFF7       lda   picWIDTH
]lp           cpx   #0
              beq   unpIFF8
              lsr
              dex
              bra   ]lp

unpIFF8       sta   IFFwidth

              ldy   #IFF_MASK
              lda   [Debut],y
              and   #$ff
              beq   unpIFF9
              _errFORMAT

unpIFF9       ldy   #IFF_ENCODING
              lda   [Debut],y
              and   #$ff
              sta   picCOMPRESS

              lda   #1
              sta   IFFcmap
              sta   IFFbody

              jsr   makePIC
              bcc   unpIFF10
              rts

unpIFF10      ldx   #$0000
              ldy   #$0028
              jsr   GSOSappend

*-

unpIFF20      lda   IFFcmap
              ora   IFFbody
              bne   unpIFF21
              clc
              rts

unpIFF21      ldx   #$0000
              ldy   #$0008
              jsr   GSOSread
              bcc   unpIFF22
              _errFORMAT

unpIFF22      ldy   #6             ; Calculate the
              lda   [dpBUF],y      ; size of the chunk
              xba                  ; and the address
              sta   IFFsize
              ldy   #4
              lda   [dpBUF],y
              xba
              sta   IFFsize+2

              lda   [dpBUF]
              cmp   #'CM'          ; CM
              beq   unpIFF23
              cmp   #'BO'          ; BO
              beq   unpIFF23
              cmp   #'CA'          ; CA
              bne   unpIFF24

unpIFF23      ldy   #2
              lda   [dpBUF],y
              cmp   #'AP'          ; AP
              beq   unpIFFcmap
              cmp   #'DY'          ; DY
              beq   unpIFFbody
              cmp   #'MG'          ; MG
              beq   unpIFFamiga

unpIFF24      ldx   IFFsize+2      ; Alors decale de X/Y octets
              ldy   IFFsize        ; ou X/Y+1 si impair
              tya
              and   #$0001
              beq   unpIFF25
              tya                  ; impair: Y+1
              inc
              tay
unpIFF25      jsr   GSOSnewmark
              brl   unpIFF20

unpIFF26      stz   IFFsize+2
              lda   IFFsize
              and   #$0001
              sta   IFFsize
              bra   unpIFF24

unpIFFamiga   _errFORMAT           ; Chunck AMIGA: on ne gere pas

*--- Gestion de la palette

unpIFFcmap    lda   IFFsize+2      ; Chunk CMAP
              bne   unpIFFcmap1

              tax
              ldy   IFFsize
              bra   unpIFFcmap2

unpIFFcmap1   ldx   #$0001
              ldy   #$0000

unpIFFcmap2   jsr   GSOSread

              jsr   initPALETTE

              ldy   #0
              tyx
]lp           lda   [dpBUF],y
              jsr   savePALETTE
              iny
              lda   [dpBUF],y
              jsr   savePALETTE
              iny
              lda   [dpBUF],y
              jsr   savePALETTE
              inx
              iny
              cpy   IFFsize
              bne   ]lp
              inx
              stx   picCOLORS

              stz   IFFcmap
              brl   unpIFF26

*--- Gestion de l'image

unpIFFbody    lda   IFFsize+2
              bne   unpIFFbody1

              tax
              ldy   IFFsize
              bra   unpIFFbody2

unpIFFbody1   ldx   #$0001
              ldy   #$0000

unpIFFbody2   jsr   GSOSread

              stz   IFFbody

              lda   ptrBUFFER
              sta   unpIFF90+1
              lda   ptrBUFFER+1
              sta   unpIFF90+2

              ldx   #0
              txy

              lda   picCOMPRESS
              beq   unpIFF30

* lda picPLANES
* cmp #8
* beq unpIFFbody3
              lda   IFFformat
              beq   unpIFFbody3
              brl   unpIFF60       ; ILBM 1-8 planes
unpIFFbody3   brl   unpIFF80       ;  PBM 1-8 planes

*- Image non compressee ILBM

unpIFF30      lda   IFFformat
              beq   unpIFF35

]lp           jsr   unpIFF90
              jsr   unpIFFy
              bcs   ]lp
              brl   unpIFF26

*- Image non compressee PBM

unpIFF35      jsr   unpIFF90
              sta   [dpPIC],y
              iny
              cpy   IFFwidth
              bne   unpIFF35

              jsr   showTHERMO
              inc   numLIGNE
              lda   numLIGNE
              cmp   picHEIGHT
              bcs   unpIFF36
              asl
              clc
              adc   numLIGNE
              tay
              lda   [dpLIGNES],y
              sta   dpPIC
              iny
              lda   [dpLIGNES],y
              sta   dpPIC+1
              ldy   #0
              bra   unpIFF35
unpIFF36      brl   unpIFF26

*- Image compressee ILBM (1-8 plans)

unpIFF60      jsr   unpIFF90
              cmp   #$81
              bcc   unpIFF70

              eor   #$ff
              inc
              sta   IFFcnt
              jsr   unpIFF90
]lp           lda   IFFb
              jsr   unpIFFy
              bcc   unpIFF61
              dec   IFFcnt
              bpl   ]lp
              bra   unpIFF60
unpIFF61      brl   unpIFF26

unpIFF70      sta   IFFcnt
]lp           jsr   unpIFF90
              jsr   unpIFFy
              bcc   unpIFF71
              dec   IFFcnt
              bpl   ]lp
              bra   unpIFF60
unpIFF71      brl   unpIFF26

*- Image compressee PBM (1-8 plans)

unpIFF80      jsr   unpIFF90
              cmp   #$81
              bcc   unpIFF85

              eor   #$ff
              inc
              sta   IFFcnt
              jsr   unpIFF90
]lp           lda   IFFb
              jsr   unpIFFy20
              bcc   unpIFF81
              dec   IFFcnt
              bpl   ]lp
              bra   unpIFF80
unpIFF81      brl   unpIFF26

unpIFF85      sta   IFFcnt
]lp           jsr   unpIFF90
              jsr   unpIFFy20
              bcc   unpIFF86
              dec   IFFcnt
              bpl   ]lp
              bra   unpIFF80
unpIFF86      brl   unpIFF26

*---

unpIFFy       sta   tempTABLE,y
              iny
              cpy   IFFwidth
              bcs   unpIFFy1
              sec
              rts
unpIFFy1      phx
              lda   #%0000_0001
              sta   IFFpmask
              stz   IFFplanes

              ldx   #0
unpIFFy2      ldy   #0
unpIFFy3      lda   tempTABLE,x
              and   #%1000_0000
              beq   unpIFFy4
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy4      iny
              lda   tempTABLE,x
              and   #%0100_0000
              beq   unpIFFy5
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy5      iny
              lda   tempTABLE,x
              and   #%0010_0000
              beq   unpIFFy6
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy6      iny
              lda   tempTABLE,x
              and   #%0001_0000
              beq   unpIFFy7
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy7      iny
              lda   tempTABLE,x
              and   #%0000_1000
              beq   unpIFFy8
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy8      iny
              lda   tempTABLE,x
              and   #%0000_0100
              beq   unpIFFy9
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy9      iny
              lda   tempTABLE,x
              and   #%0000_0010
              beq   unpIFFy10
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy10     iny
              lda   tempTABLE,x
              and   #%0000_0001
              beq   unpIFFy11
              lda   [dpPIC],y
              ora   IFFpmask
              sta   [dpPIC],y
unpIFFy11     iny
              inx
              cpx   picWIDTH
              bcs   unpIFFy13
              cpy   picWIDTH
              bcs   unpIFFy12
              brl   unpIFFy3
unpIFFy12     asl   IFFpmask
              inc   IFFplanes
              lda   IFFplanes
              cmp   picPLANES
              beq   unpIFFy13
              brl   unpIFFy2

unpIFFy13     jsr   showTHERMO
              inc   numLIGNE
              lda   numLIGNE
              cmp   picHEIGHT
              bcs   unpIFFy14
              asl
              clc
              adc   numLIGNE
              tay
              lda   [dpLIGNES],y
              sta   dpPIC
              iny
              lda   [dpLIGNES],y
              sta   dpPIC+1
              plx
              ldy   #0
              sec
              rts
unpIFFy14     plx
              clc
              rts

unpIFFy20     sta   [dpPIC],y      ; sauvegarde pour PBM 8 plans
              iny
              cpy   IFFwidth
              bcs   unpIFFy21
              sec
              rts
unpIFFy21     jsr   showTHERMO
              inc   numLIGNE
              lda   numLIGNE
              cmp   picHEIGHT
              bcs   unpIFFy22
              asl
              clc
              adc   numLIGNE
              tay
              lda   [dpLIGNES],y
              sta   dpPIC
              iny
              lda   [dpLIGNES],y
              sta   dpPIC+1
              ldy   #0
              sec
              rts
unpIFFy22     clc
              rts

*--- Lecture d'un octet

unpIFF90      ldal  $012000,x
              and   #$ff
              sta   IFFb
              inx
              bne   unpIFF91
              sty   IFFdest
              ldx   #$0001
              ldy   #$0000
              jsr   GSOSread
              ldx   #0
              ldy   IFFdest
              lda   IFFb
unpIFF91      rts

*--- Data

IFFformat     ds    2              ; 0=PBM, 1=ILBM
IFFplanes     ds    2
IFFwidth      ds    2

IFFb          ds    2
IFFcnt        ds    2
IFFdest       ds    2
IFFpmask      ds    2

IFFcmap       ds    2
IFFbody       ds    2
IFFsize       ds    4

