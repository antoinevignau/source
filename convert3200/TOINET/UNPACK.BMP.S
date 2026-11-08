*-----------------
* BMP
*-----------------

BMPidentifier   =     0
BMPoffset       =     10
BMPheader       =     14
BMPwidth        =     18
BMPheight       =     22
BMPplanes       =     26
BMPbpp          =     28
BMPcompression  =     30
BMPnumcolors    =     46
BMPpalette      =     54

BMPrle8         =     1
BMPrle4         =     2

*---

unpBMP          lda   ptrBUFFER
                sta   dpBUF
                lda   ptrBUFFER+2
                sta   dpBUF+2

                lda   [dpBUF]          ; En cas de presence
                cmp   #$4142           ; d'une image OS/2
                bne   unpBMP0          ; alors saute l'entete

                ldx   #0
                ldy   #14
                jsr   GSOSappend
                ldx   #0
                ldy   #$800
                jsr   GSOSread

unpBMP0         ldy   #BMPidentifier
                lda   [dpBUF],y
                cmp   #$4d42
                beq   unpBMP1
                _errFORMAT
unpBMP1         ldy   #BMPheader
                lda   [dpBUF],y
                cmp   #40
                beq   unpBMP2
                _errFORMAT
unpBMP2         ldy   #BMPwidth
                lda   [dpBUF],y
                sta   picWIDTH
                bne   unpBMP21
                _errSIZE
unpBMP21        ldy   #BMPheight
                lda   [dpBUF],y
                sta   picHEIGHT
                bne   unpBMP22
                _errSIZE
unpBMP22        lda   picWIDTH
                cmp   #maxWIDTH
                bcc   unpBMP3
                beq   unpBMP3
                _errSIZE
unpBMP3         lda   picHEIGHT
                cmp   #maxHEIGHT
                bcc   unpBMP4
                beq   unpBMP4
                _errSIZE
unpBMP4         ldy   #BMPplanes
                lda   [dpBUF],y
                sta   picPLANES
                cmp   #$0001
                beq   unpBMP5
                _errFORMAT
unpBMP5         ldy   #BMPbpp
                lda   [dpBUF],y
                sta   picBITS
                cmp   #1
                beq   unpBMP6
                cmp   #4
                beq   unpBMP6
                cmp   #8
                beq   unpBMP6
                _errCOLORS
unpBMP6         ldy   #BMPcompression
                lda   [dpBUF],y
                sta   picCOMPRESS
                cmp   #1
                bcc   unpBMP7
                beq   unpBMP7
                _errCOMPRESS
unpBMP7         ldy   #BMPnumcolors
                lda   [dpBUF],y
                sta   picCOLORS
                bne   unpBMP8
                lda   picBITS
                asl
                tax
                lda   BMPnbcolor,x
                sta   picCOLORS
                cmp   #256
                bcc   unpBMP8
                beq   unpBMP8
                _errCOLORS

unpBMP8         jsr   initPALETTE

                ldx   #0               ; Lecture de la palette
                ldy   #BMPpalette+2
]lp             lda   [dpBUF],y        ; B
                jsr   savePALETTE
                dey
                lda   [dpBUF],y        ; V
                jsr   savePALETTE
                dey
                lda   [dpBUF],y        ; R
                jsr   savePALETTE
                iny
                iny
                iny
                iny
                iny
                iny
                inx
                cpx   picCOLORS
                bne   ]lp

                jsr   makePIC
                bcc   unpBMP9
                rts
unpBMP9         ldy   #BMPoffset
                lda   [dpBUF],y
                tay
                ldx   #$0000
                jsr   GSOSappend

                ldx   #$0001
                ldy   #$0000
                jsr   GSOSread

*---

                lda   ptrBUFFER
                sta   unpBMP90+1
                lda   ptrBUFFER+1
                sta   unpBMP90+2

                ldx   #0
                txy

                lda   picBITS
                cmp   #1
                beq   loadBMP10
                cmp   #4
                bne   unpBMP11
                brl   loadBMP40
unpBMP11        cmp   #8
                bne   unpBMP12
                brl   loadBMP80
unpBMP12        _errFORMAT

*--- Format 1 bit/pixel

loadBMP10       lda   picWIDTH
                clc
                adc   #31
                lsr
                lsr
                lsr
                lsr
                lsr
                asl
                asl
                asl
                asl
                asl
                sta   BMPpadw

loadBMP11       jsr   unpBMP90
                and   #%1000_0000
                beq   loadBMP12
                lda   #1
                sta   [dpPIC],y
loadBMP12       iny
                lda   BMPc
                and   #%0100_0000
                beq   loadBMP13
                lda   #1
                sta   [dpPIC],y
loadBMP13       iny
                lda   BMPc
                and   #%0010_0000
                beq   loadBMP14
                lda   #1
                sta   [dpPIC],y
loadBMP14       iny
                lda   BMPc
                and   #%0001_0000
                beq   loadBMP15
                lda   #1
                sta   [dpPIC],y
loadBMP15       iny
                lda   BMPc
                and   #%0000_1000
                beq   loadBMP16
                lda   #1
                sta   [dpPIC],y
loadBMP16       iny
                lda   BMPc
                and   #%0000_0100
                beq   loadBMP17
                lda   #1
                sta   [dpPIC],y
loadBMP17       iny
                lda   BMPc
                and   #%0000_0010
                beq   loadBMP18
                lda   #1
                sta   [dpPIC],y
loadBMP18       iny
                lda   BMPc
                and   #%0000_0001
                beq   loadBMP19
                lda   #1
                sta   [dpPIC],y
loadBMP19       iny
                cpy   BMPpadw
                bcs   loadBMP20
                brl   loadBMP11

loadBMP20       jsr   showTHERMO
                inc   numLIGNE
                lda   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP21
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
                brl   loadBMP11

loadBMP21       jsr   BMPreturn
                clc
                rts

*--- Format 4 bits/pixel

loadBMP40       lda   picCOMPRESS
                beq   loadBMP41
                brl   loadBMP50

loadBMP41       lda   picWIDTH
                clc
                adc   #7
                lsr
                lsr
                lsr
                asl
                asl
                asl
                sta   BMPpadw

loadBMP42       jsr   unpBMP90
                pha
                and   #$f0
                lsr
                lsr
                lsr
                lsr
                sta   [dpPIC],y
                iny
                pla
                and   #$0f
                sta   [dpPIC],y
                iny
                cpy   BMPpadw
                bcs   loadBMP43
                bra   loadBMP42

loadBMP43       jsr   showTHERMO
                inc   numLIGNE
                lda   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP44
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
                brl   loadBMP42

loadBMP44       jsr   BMPreturn
                clc
                rts

*---

loadBMP50       lda   picCOMPRESS
                cmp   #BMPrle4
                beq   loadBMP51
                _errCOMPRESS

loadBMP51       jsr   unpBMP90
                cmp   #0
                beq   loadBMP52
                sta   BMPcnt

                jsr   unpBMP90         ; encoded mode
                phx
                ldx   BMPcnt
]lp             lda   BMPc
                and   #$f0
                lsr
                lsr
                lsr
                lsr
                sta   [dpPIC],y
                iny
                lda   BMPc
                and   #$0f
                sta   [dpPIC],y
                iny
                dex
                bne   ]lp
                plx
                bra   loadBMP51

loadBMP52       jsr   unpBMP90         ; escape code
                cmp   #0
                bne   loadBMP55

loadBMP53       jsr   showTHERMO
                inc   numLIGNE         ; ...end of line
                lda   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP54
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
                brl   loadBMP51

loadBMP54       jsr   BMPreturn
                clc
                rts

loadBMP55       cmp   #1               ; ...end of picture
                beq   loadBMP54
                cmp   #2
                bne   loadBMP56

                jsr   unpBMP90         ; ...delta movement
                sta   BMPtemp
                jsr   unpBMP90
                clc
                adc   numLIGNE
                sta   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP54
                asl
                clc
                adc   numLIGNE
                tay
                lda   [dpLIGNES],y
                sta   dpPIC
                iny
                lda   [dpLIGNES],y
                sta   dpPIC+1
                ldy   BMPtemp
                brl   loadBMP51

loadBMP56       sta   BMPcnt
                sta   BMPcnt+2
]lp             jsr   unpBMP90
                pha
                and   #$f0
                lsr
                lsr
                lsr
                lsr
                sta   [dpPIC],y
                iny
                pla
                and   #$0f
                sta   [dpPIC],y
                iny
                dec   BMPcnt
                bne   ]lp

                lda   BMPcnt+2
                and   #%0000_0001
                beq   loadBMP57
                jsr   unpBMP90
loadBMP57       brl   loadBMP51

*--- Format 8 bits/pixel

loadBMP80       lda   picCOMPRESS
                beq   loadBMP81
                brl   loadBMP90

loadBMP81       lda   picWIDTH
                clc
                adc   #3
                lsr
                lsr
                asl
                asl
                sta   BMPpadw

loadBMP82       jsr   unpBMP90
                sta   [dpPIC],y
                iny
                cpy   BMPpadw
                bne   loadBMP82

                jsr   showTHERMO
                inc   numLIGNE
                lda   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP83
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
                bra   loadBMP82

loadBMP83       jsr   BMPreturn
                clc
                rts

*---

loadBMP90       lda   picCOMPRESS
                cmp   #BMPrle8
                beq   loadBMP91
                _errCOMPRESS

loadBMP91       jsr   unpBMP90
                cmp   #0
                beq   loadBMP92
                sta   BMPcnt

                jsr   unpBMP90         ; encoded mode
                phx
                ldx   BMPcnt
]lp             sta   [dpPIC],y
                iny
                dex
                bne   ]lp
                plx
                bra   loadBMP91

loadBMP92       jsr   unpBMP90         ; escape code
                cmp   #0
                bne   loadBMP95

loadBMP93       jsr   showTHERMO
                inc   numLIGNE         ; ...end of line
                lda   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP94
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
                brl   loadBMP91

loadBMP94       jsr   BMPreturn
                clc
                rts

loadBMP95       cmp   #1               ; ...end of picture
                beq   loadBMP94
                cmp   #2               ; ...delta movement
                bne   loadBMP96

                jsr   unpBMP90         ; X
                sta   BMPtemp
                jsr   unpBMP90         ; Y
                clc
                adc   numLIGNE
                sta   numLIGNE
                cmp   picHEIGHT
                bcs   loadBMP94
                asl
                clc
                adc   numLIGNE
                tay
                lda   [dpLIGNES],y
                sta   dpPIC
                iny
                lda   [dpLIGNES],y
                sta   dpPIC+1
                ldy   BMPtemp
                brl   loadBMP91

loadBMP96       sta   BMPcnt
                sta   BMPcnt+2
]lp             jsr   unpBMP90
                sta   [dpPIC],y
                iny
                dec   BMPcnt
                bne   ]lp

                lda   BMPcnt+2
                and   #%0000_0001
                beq   loadBMP97
                jsr   unpBMP90
loadBMP97       brl   loadBMP91

*--- Lecture d'un octet

unpBMP90        ldal  $012000,x
                and   #$ff
                sta   BMPc
                inx
                bne   unpBMP91
                sty   BMPdest
                ldx   #$0001
                ldy   #$0000
                jsr   GSOSread
                ldx   #0
                ldy   BMPdest
unpBMP91        lda   BMPc
                rts

*--- Retournement de l'image BMP

BMPreturn       lda   picHEIGHT        ; 1 ligne, ne rien faire
                cmp   #2
                bcs   BMPreturn1
                rts

BMPreturn1      stz   BMPsource
                lda   picHEIGHT
                dec
                sta   BMPdest

                lda   picHEIGHT
                lsr
                tax

                lda   ptrLIGNES
                sta   dpLIGNES
                lda   ptrLIGNES+2
                sta   dpLIGNES+2

BMPreturn2      lda   BMPsource
                asl
                clc
                adc   BMPsource
                tay
                lda   [dpLIGNES],y
                sta   dpBUF
                iny
                iny
                lda   [dpLIGNES],y
                and   #$00ff
                sta   dpBUF+2

                lda   BMPdest
                asl
                clc
                adc   BMPdest
                tay
                lda   [dpLIGNES],y
                sta   dpPIC
                iny
                iny
                lda   [dpLIGNES],y
                and   #$00ff
                sta   dpPIC+2

                ldy   #0
                sep   #$20
]lp             lda   [dpBUF],y
                pha
                lda   [dpPIC],y
                sta   [dpBUF],y
                pla
                sta   [dpPIC],y
                iny
                cpy   picWIDTH
                bne   ]lp
                rep   #$20

                dec   BMPdest
                inc   BMPsource
                dex
                bne   BMPreturn2
                rts

*---

BMPtemp         ds    2
BMPmask         ds    2
BMPcnt          ds    4
BMPc            ds    2
BMPsource       ds    2
BMPdest         ds    2
BMParret        ds    2
BMPpadw         ds    2

BMPnbcolor      dw    -1,2,-1,-1,16,-1,-1,-1,256

