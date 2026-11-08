*-----------------
* TIFF
*-----------------

TIFFidentifier  =     0
TIFFversion     =     2
TIFFifd         =     4

dpBUF1          =     $20
dpBUF2          =     $24

*---

unpTIFF         lda   ptrBUFFER
                sta   dpBUF
                lda   ptrBUFFER+2
                sta   dpBUF+2

                stz   TIFFendian

                lda   #1
                sta   TIFFlwidth
                sta   TIFFlheight
                sta   TIFFlphoto
                sta   TIFFlstrip
                sta   TIFFlcmap

                sta   picBITS          ; Valeurs par defaut
                sta   picCOMPRESS
                sta   picPLANES
                inc
                sta   picCOLORS

                ldy   #TIFFidentifier
                lda   [dpBUF],y
                cmp   #$4949
                beq   unpTIFF2
                cmp   #$4d4d
                beq   unpTIFF1
                _errFORMAT

unpTIFF1        lda   #$8000
                sta   TIFFendian

unpTIFF2        ldy   #TIFFversion
                lda   [dpBUF],y
                jsr   unpSWAP
                cmp   #$002a
                beq   unpTIFF3
                _errFORMAT

unpTIFF3        ldy   #TIFFifd
                lda   [dpBUF],y
                sta   TIFFoffset
                jsr   unpSWAP
                bcc   unpTIFF4
                sta   TIFFoffset+2
                iny
                iny
                lda   [dpBUF],y
                jsr   unpSWAP
                sta   TIFFoffset
                bra   unpTIFF5
unpTIFF4        iny
                iny
                lda   [dpBUF],y
                sta   TIFFoffset+2

*---

unpTIFF5        ldx   TIFFoffset+2
                ldy   TIFFoffset
                jsr   GSOSappend

                ldx   #0
                ldy   #2
                jsr   GSOSread

                ldy   #0
                lda   [dpBUF],y
                jsr   unpSWAP
                sta   TIFFnumdir

                pha
                pha
                pha
                pea   $000c
                _Multiply
                ply
                plx
                jsr   GSOSread

*---

unpTIFF10       lda   [dpBUF]
                jsr   unpSWAP
                ldx   #0
]lp             cmp   TIFFid,x
                beq   unpTIFF12
                inx
                inx
                cpx   #8*2
                bne   ]lp

unpTIFF11       lda   dpBUF
                clc
                adc   #12
                sta   dpBUF
                dec   TIFFnumdir
                lda   TIFFnumdir
                bne   unpTIFF10
                _errFORMAT
]lp             rts

unpTIFF12       lda   TIFFadd,x
                sta   unpTIFF13+1
unpTIFF13       jsr   $ffff
                bcs   ]lp

                lda   TIFFlwidth
                ora   TIFFlheight
                ora   TIFFlphoto
                ora   TIFFlstrip
                ora   TIFFlcmap
                bne   unpTIFF11
                brl   unpTIFF20

*--- Largeur

TIFFawidth      ldy   #8               ; ImageWidth
                lda   [dpBUF],y
                jsr   unpSWAP
                bcs   TIFFawidth1
                sta   picWIDTH
                iny
                iny
                lda   [dpBUF],y
                beq   TIFFawidth2
]lp             _errSIZE
TIFFawidth1     sta   picWIDTH

TIFFawidth2     lda   picWIDTH
                cmp   #maxWIDTH
                bcc   TIFFawidth3
                beq   TIFFawidth3
                _errSIZE
TIFFawidth3     stz   TIFFlwidth
                clc
                rts

*--- Hauteur

TIFFaheight     ldy   #8               ; ImageHeight
                lda   [dpBUF],y
                jsr   unpSWAP
                bcs   TIFFaheight1
                sta   picHEIGHT
                iny
                iny
                lda   [dpBUF],y
                beq   TIFFaheight2
]lp             _errSIZE
TIFFaheight1    sta   picHEIGHT

TIFFaheight2    lda   picHEIGHT
                cmp   #maxHEIGHT
                bcc   TIFFaheight3
                beq   TIFFaheight3
                _errSIZE
TIFFaheight3    stz   TIFFlheight
                clc
                rts

*---

TIFFabps        ldy   #8               ; BitsPerSample
                lda   [dpBUF],y
                jsr   unpSWAP
TIFFabps1       sta   picBITS
                ldx   #2
                cmp   #1
                beq   TIFFabps2
                ldx   #4
                cmp   #2
                beq   TIFFabps3
                ldx   #16
                cmp   #4
                beq   TIFFabps3
                ldx   #256
                cmp   #8
                beq   TIFFabps3
                _errFORMAT
TIFFabps2       stz   TIFFlcmap
TIFFabps3       stx   picCOLORS
                clc
                rts

*---

TIFFacomp       ldy   #8               ; Compression
                lda   [dpBUF],y
                jsr   unpSWAP
TIFFacomp1      sta   picCOMPRESS
                cmp   #1
                beq   TIFFacomp2
                cmp   #32773
                beq   TIFFacomp2
                _errCOMPRESS
TIFFacomp2      clc
                rts

*---

TIFFaphoto      ldy   #8               ; PhotometricInterpretation
                lda   [dpBUF],y
                jsr   unpSWAP
TIFFaphoto1     sta   TIFFphoto
                beq   TIFFaphoto2
                cmp   #1
                beq   TIFFaphoto2
                cmp   #3
                beq   TIFFaphoto2
                _errFORMAT
TIFFaphoto2     stz   TIFFlphoto
                clc
                rts

*---

TIFFastrip      ldy   #8               ; StripOffsets
                lda   [dpBUF],y
                sta   TIFFstrip
                jsr   unpSWAP
                bcc   TIFFastrip1
                sta   TIFFstrip+2
                iny
                iny
                lda   [dpBUF],y
                jsr   unpSWAP
                sta   TIFFstrip
                bra   TIFFastrip2
TIFFastrip1     iny
                iny
                lda   [dpBUF],y
                sta   TIFFstrip+2

TIFFastrip2     ldy   #4               ; Un seul bloc de donnees
                lda   [dpBUF],y
                sta   TIFFnbstrips
                jsr   unpSWAP
                bcc   TIFFastrip3
                iny
                iny
                lda   [dpBUF],y
                jsr   unpSWAP
                sta   TIFFnbstrips

TIFFastrip3     lda   TIFFnbstrips
                cmp   #1
                beq   TIFFastrip4
                _errFORMAT

TIFFastrip4     stz   TIFFlstrip
                clc
                rts

*---

TIFFaplanar     ldy   #8               ; PlanarConfiguration
                lda   [dpBUF],y
                jsr   unpSWAP
TIFFaplanar1    sta   picPLANES
                cmp   #1
                beq   TIFFaplanar2
                cmp   #2
                beq   TIFFaplanar2
                _errFORMAT
TIFFaplanar2    clc
                rts

*---

TIFFacmap       ldy   #4               ; ColorMap
                lda   [dpBUF],y
                sta   TIFFoffset
                jsr   unpSWAP
                bcc   TIFFacmap1
                sta   TIFFoffset+2
                iny
                iny
                lda   [dpBUF],y
                jsr   unpSWAP
                sta   TIFFoffset
                bra   TIFFacmap2
TIFFacmap1      iny
                iny
                lda   [dpBUF],y
                sta   TIFFoffset+2

TIFFacmap2      lda   TIFFoffset
                cmp   #768             ; Composante sur 16 bits
                bcc   TIFFacmap3
                beq   TIFFacmap3
                _errFORMAT
TIFFacmap3      lda   TIFFoffset+2
                beq   TIFFacmap4
                _errFORMAT

TIFFacmap4      iny                    ; And its address
                iny
                lda   [dpBUF],y
                sta   TIFFcmap
                jsr   unpSWAP
                bcc   TIFFacmap5
                sta   TIFFcmap+2
                iny
                iny
                lda   [dpBUF],y
                jsr   unpSWAP
                sta   TIFFcmap
                bra   TIFFacmap6
TIFFacmap5      iny
                iny
                lda   [dpBUF],y
                sta   TIFFcmap+2

TIFFacmap6      stz   TIFFlcmap
                clc
                rts

*--- On a eu tous les tags, maintenant charge l'image

unpTIFF20       jsr   makePIC
                bcc   unpTIFF21
                rts
unpTIFF21       jsr   unpTIFFcmap
                bcc   unpTIFF22
                rts
unpTIFF22       jsr   unpTIFF30
                rts

*--- Routine sur la palette

unpTIFFcmap     lda   TIFFlcmap
                beq   unpTIFFcmap1
                _errFORMAT

unpTIFFcmap1    jsr   initPALETTE

                lda   picBITS
                cmp   #1
                bne   unpTIFFcmap4

                lda   TIFFphoto
                beq   unpTIFFcmap2
                cmp   #1
                beq   unpTIFFcmap3
                cmp   #3
                beq   unpTIFFcmap4
                _errFORMAT

unpTIFFcmap2    lda   #$ff             ; BlackIsZero
                jsr   savePALETTE
                lda   #$ff
                jsr   savePALETTE
                lda   #$ff
                jsr   savePALETTE
                clc
                rts

unpTIFFcmap3    lda   #$00             ; WhiteIsZero
                jsr   savePALETTE
                lda   #$00
                jsr   savePALETTE
                lda   #$00
                jsr   savePALETTE
                lda   #$ff
                jsr   savePALETTE
                lda   #$ff
                jsr   savePALETTE
                lda   #$ff
                jsr   savePALETTE
                clc
                rts

unpTIFFcmap4    ldx   TIFFcmap+2       ; Palette integree
                ldy   TIFFcmap
                jsr   GSOSappend

                ldx   TIFFoffset+2
                lda   TIFFoffset
                asl
                tay
                jsr   GSOSread

                lda   picCOLORS
                asl
                pha
                clc
                adc   ptrBUFFER
                sta   dpBUF1
                clc
                adc   1,s
                sta   dpBUF2
                pla

                lda   ptrBUFFER+2
                adc   #0
                sta   dpBUF1+2
                sta   dpBUF2+2

                ldx   #0
                txy
]lp             lda   [dpBUF],y
                xba
                jsr   savePALETTE
                lda   [dpBUF1],y
                xba
                jsr   savePALETTE
                lda   [dpBUF2],y
                xba
                jsr   savePALETTE
                iny
                iny
                inx
                cpx   picCOLORS
                bne   ]lp

                clc
                rts

*--- Gestion de l'image

unpTIFF30       ldx   TIFFstrip+2      ; Image integree
                ldy   TIFFstrip
                jsr   GSOSappend

                ldx   #$0001
                ldy   #$0000
                jsr   GSOSread

                lda   picBITS
                ldx   #3
                cmp   #1
                beq   unpTIFF31
                dex
                cmp   #2
                beq   unpTIFF31
                dex
                cmp   #4
                beq   unpTIFF31
                dex
                cmp   #8
                beq   unpTIFF31
                _errFORMAT

unpTIFF31       lda   picWIDTH
]lp             cpx   #0
                beq   unpTIFF32
                lsr
                dex
                bra   ]lp

unpTIFF32       sta   TIFFwidth

                lda   ptrBUFFER
                sta   unpTIFF90+1
                lda   ptrBUFFER+1
                sta   unpTIFF90+2

                ldx   #0
                txy

                lda   picCOMPRESS
                cmp   #1               ; Uncompressed
                beq   unpTIFF50
                cmp   #32773           ; PackBits
                beq   unpTIFF60
                _errCOMPRESS

*- Image non compressee

unpTIFF50       jsr   unpTIFF90
                jsr   unpTIFFy
                bcs   unpTIFF50
                rts

*- Image compressee

unpTIFF60       jsr   unpTIFF90
                cmp   #$81
                bcc   unpTIFF65

                eor   #$ff
                inc
                sta   TIFFcnt
                jsr   unpTIFF90
]lp             lda   TIFFb
                jsr   unpTIFFy
                bcc   unpTIFF61
                dec   TIFFcnt
                bpl   ]lp
                bra   unpTIFF60
unpTIFF61       rts

unpTIFF65       sta   TIFFcnt
]lp             jsr   unpTIFF90
                jsr   unpTIFFy
                bcc   unpTIFF66
                dec   TIFFcnt
                bpl   ]lp
                bra   unpTIFF60
unpTIFF66       rts

*---

unpTIFFy        sta   tempTABLE,y
                iny
                cpy   TIFFwidth
                bcs   unpTIFFy0
                sec
                rts

unpTIFFy0       phx

                lda   picPLANES
                cmp   #2
                beq   unpTIFFy1
                lda   picBITS
                cmp   #1
                beq   unpTIFFy1
                brl   unpTIFFz1

unpTIFFy1       lda   #%0000_0001      ; multiple planes / 1 to 8 bits
                sta   TIFFpmask        ; single plane / 1 bit
                stz   TIFFplanes

                ldx   #0
unpTIFFy2       ldy   #0
unpTIFFy3       lda   tempTABLE,x
                and   #%1000_0000
                beq   unpTIFFy4
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy4       iny
                lda   tempTABLE,x
                and   #%0100_0000
                beq   unpTIFFy5
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy5       iny
                lda   tempTABLE,x
                and   #%0010_0000
                beq   unpTIFFy6
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy6       iny
                lda   tempTABLE,x
                and   #%0001_0000
                beq   unpTIFFy7
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy7       iny
                lda   tempTABLE,x
                and   #%0000_1000
                beq   unpTIFFy8
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy8       iny
                lda   tempTABLE,x
                and   #%0000_0100
                beq   unpTIFFy9
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy9       iny
                lda   tempTABLE,x
                and   #%0000_0010
                beq   unpTIFFy10
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy10      iny
                lda   tempTABLE,x
                and   #%0000_0001
                beq   unpTIFFy11
                lda   [dpPIC],y
                ora   TIFFpmask
                sta   [dpPIC],y
unpTIFFy11      iny
                inx
                cpx   picWIDTH
                bcs   unpTIFFy13
                cpy   picWIDTH
                bcs   unpTIFFy12
                brl   unpTIFFy3
unpTIFFy12      asl   TIFFpmask
                inc   TIFFplanes
                lda   TIFFplanes
                cmp   picPLANES
                beq   unpTIFFy13
                brl   unpTIFFy2

unpTIFFy13      jsr   showTHERMO
                inc   numLIGNE
                lda   numLIGNE
                cmp   picHEIGHT
                bcs   unpTIFFy14
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
unpTIFFy14      plx
                clc
                rts

*---

unpTIFFz1       lda   picBITS
                cmp   #2
                bne   unpTIFFz2

                ldx   #0               ; 2 bits, single plane
                txy
]lp             lda   tempTABLE,x
                and   #%1100_0000
                asl
                asl
                xba
                sta   [dpPIC],y
                iny
                lda   tempTABLE,x
                and   #%0011_0000
                lsr
                lsr
                lsr
                lsr
                sta   [dpPIC],y
                iny
                lda   tempTABLE,x
                and   #%0000_1100
                lsr
                lsr
                sta   [dpPIC],y
                iny
                lda   tempTABLE,x
                and   #%0000_0011
                sta   [dpPIC],y
                iny
                inx
                cpx   TIFFwidth
                bne   ]lp
                brl   unpTIFFy13

unpTIFFz2       cmp   #4
                bne   unpTIFFz3

                ldx   #0               ; 4 bits, single plane
                txy
]lp             lda   tempTABLE,x
                and   #$f0
                lsr
                lsr
                lsr
                lsr
                sta   [dpPIC],y
                iny
                lda   tempTABLE,x
                and   #$0f
                sta   [dpPIC],y
                iny
                inx
                cpx   TIFFwidth
                bne   ]lp
                brl   unpTIFFy13

unpTIFFz3       ldx   #0               ; 8 bits, single plane
                txy
]lp             lda   tempTABLE,x
                sta   [dpPIC],y
                iny
                inx
                cpx   TIFFwidth
                bne   ]lp
                brl   unpTIFFy13

*--- Lecture d'un octet

unpTIFF90       ldal  $012000,x
                and   #$ff
                sta   TIFFb
                inx
                bne   unpTIFF91
                sty   TIFFdest
                ldx   #$0001
                ldy   #$0000
                jsr   GSOSread
                ldx   #0
                ldy   TIFFdest
                lda   TIFFb
unpTIFF91       rts

*--- Data

TIFFid          dw    $100,$101,$102,$103,$106,$111,$11c,$140
TIFFadd         da    TIFFawidth,TIFFaheight
                da    TIFFabps,TIFFacomp
                da    TIFFaphoto,TIFFastrip
                da    TIFFaplanar,TIFFacmap

TIFFb           ds    2
TIFFcnt         ds    2
TIFFdest        ds    2
TIFFwidth       ds    2
TIFFplanes      ds    2
TIFFpmask       ds    2

TIFFendian      ds    2
TIFFnumdir      ds    2
TIFFphoto       ds    2

TIFFcmap        ds    4
TIFFoffset      ds    4
TIFFstrip       ds    4
TIFFnbstrips    ds    2

TIFFlcmap       ds    2
TIFFlheight     ds    2
TIFFlphoto      ds    2
TIFFlstrip      ds    2
TIFFlwidth      ds    2

