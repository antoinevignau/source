*-----------------
* GIF
*-----------------

GIFsignature    =         0
GIFlocalwidth   =         4
GIFlocalpacked  =         8

GIFextension    =         $21
GIFseparator    =         $2c

*---

unpGIF          lda       ptrBUFFER
                sta       dpBUF
                lda       ptrBUFFER+2
                sta       dpBUF+2

                lda       #1                   ; Look for a color table
                sta       GIFcmap
                sta       GIFbody

                stz       GIFindice

                ldx       #0
                txy
                jsr       GSOSappend

                ldx       #0
                ldy       #13
                jsr       GSOSread

                ldy       #GIFsignature
                lda       [dpBUF],y
                cmp       #'GI'
                beq       unpGIF1
                _errFORMAT
unpGIF1         iny
                iny
                lda       [dpBUF],y
                cmp       #'F8'
                beq       unpGIF2
                _errFORMAT
unpGIF2         iny
                iny
                lda       [dpBUF],y
                cmp       #'7a'
                beq       unpGIF3
                cmp       #'9a'
                beq       unpGIF3
                _errFORMAT

unpGIF3         iny
                iny
                lda       [dpBUF],y
                sta       picWIDTH
                bne       unpGIF31
                _errSIZE
unpGIF31        iny
                iny
                lda       [dpBUF],y
                sta       picHEIGHT
                bne       unpGIF32
                _errSIZE

unpGIF32        lda       picWIDTH
                cmp       #maxWIDTH
                bcc       unpGIF4
                beq       unpGIF4
                _errSIZE
unpGIF4         lda       picHEIGHT
                cmp       #maxHEIGHT
                bcc       unpGIF5
                beq       unpGIF5
                _errSIZE

unpGIF5         iny
                iny
                lda       [dpBUF],y
                and       #%1000_0000
                beq       unpGIF10             ; No color map follows

                lda       [dpBUF],y
                and       #%0000_0111
                asl
                tay
                lda       GIFnbcolors,y
                sta       picCOLORS
                lda       GIFsizecmap,y
                tay
                ldx       #0
                jsr       GSOSread

                ldx       #0                   ; recopie la palette
                txy
]lp             lda       [dpBUF],y
                jsr       savePALETTE
                iny
                lda       [dpBUF],y
                jsr       savePALETTE
                iny
                lda       [dpBUF],y
                jsr       savePALETTE
                iny
                inx
                cpx       picCOLORS
                bne       ]lp

                stz       GIFcmap

*---

unpGIF10        jsr       unpGIF90
                cmp       #GIFextension
                beq       unpGIF15
                cmp       #GIFseparator
                beq       unpGIF20
                _errFORMAT

unpGIF15        jsr       unpGIF90             ; Label
]lp             jsr       unpGIF90             ; BlockSize
                cmp       #0
                beq       unpGIF16
                tay
                ldx       #0
                jsr       GSOSread
                bra       ]lp
unpGIF16        bra       unpGIF10

*--- On a trouve une image...

unpGIF20        ldx       #0
                ldy       #9
                jsr       GSOSread

                ldy       #GIFlocalwidth
                lda       [dpBUF],y
                sta       picWIDTH
                iny
                iny
                lda       [dpBUF],y
                sta       picHEIGHT

                lda       picWIDTH
                cmp       #maxWIDTH
                bcc       unpGIF21
                beq       unpGIF21
                _errSIZE
unpGIF21        lda       picHEIGHT
                cmp       #maxHEIGHT
                bcc       unpGIF22
                beq       unpGIF22
                _errSIZE

unpGIF22        jsr       makePIC
                bcc       unpGIF23
                rts

unpGIF23        ldy       #GIFlocalpacked
                lda       [dpBUF],y
                and       #%0100_0000
                sta       GIFinterlace         ; set if interlace

                lda       [dpBUF],y
                and       #%1000_0000
                beq       unpGIF24             ; No color map follows

                lda       [dpBUF],y
                and       #%0000_0111
                asl
                tay
                lda       GIFnbcolors,y
                sta       picCOLORS
                lda       GIFsizecmap,y
                tay
                ldx       #0
                jsr       GSOSread

                jsr       initPALETTE

                ldx       #0
                txy                            ; recopie la palette
]lp             lda       [dpBUF],y
                jsr       savePALETTE
                iny
                lda       [dpBUF],y
                jsr       savePALETTE
                iny
                lda       [dpBUF],y
                jsr       savePALETTE
                iny
                inx
                cpx       picCOLORS
                bne       ]lp

                stz       GIFcmap

unpGIF24        stz       GIFbody

                lda       GIFcmap
                beq       unpGIF30
                _errFORMAT

*--- Initialisations d'entree: Les choses serieuses commencent

GIFerror        PushLong  GIFhandle
                _DisposeHandle
                _errMEMORY

unpGIF30        pha
                pha
                PushLong  #$3000
                PushWord  myID
                PushWord  #%11000000_00000101
                PushLong  #0
                _NewHandle
                phd
                tsc
                tcd
                lda       [3]
                sta       GIFstack
                pld
                pla
                sta       GIFhandle
                pla
                sta       GIFhandle+2
                bcs       GIFerror

*---

                lda       #^tempTABLE
                sta       proREAD+6
                lda       #tempTABLE
                sta       proREAD+4
                sta       GIFgetbuffer2+1

                stz       GIFgetbuffer1+1

                stz       GIFpass

                ldx       #0                   ; Initial codesize
                ldy       #1
                jsr       GSOSread

                lda       tempTABLE
                and       #$ff
                inc
                sta       GIFcodesize

                ldx       #0                   ; Read length of buffer
                ldy       #1
                jsr       GSOSread

                lda       #4
                ldy       #tempTABLE
                jsr       GIFgetbuffer

*---

                jsr       GIFinit

                tsc
                sta       GIFoldstack
                lda       GIFstack
                clc
                adc       #$2FFF
                tcs
                stz       GIFbitoffset

*--- Entry point

L42E6           pea       $FFFF

L42E7           jsr       GIFreadcode
L42EA           cmp       #$0000               ; EOF
                bne       L42EB
                brl       GIFeoi
L42EB           cmp       GIFclearcode         ; ClearCode
                bne       L42EC
                brl       GIFclear
L42EC           sta       L4343+1
                cmp       GIFbitmaxi
                bcc       L4301
                lda       $f0
L42FE           pea       $0000
L4301           cmp       GIFclearcode
                bcc       L4315
                asl
L4307           tay
                lda       zoneTAMPON1,y
                pha
                lda       zoneTAMPON,y
L430F           cmp       #$0000
                bcs       L4307
                lsr
L4315           and       #$ff
                sta       L42FE+1
                ldy       #0
L431E           jsr       GIFsave
                iny
                pla
                bpl       L431E
                pha

L432F           lda       GIFbitmaxi
                asl
                tay
                lda       $f0
                asl
                sta       zoneTAMPON,y
                lda       L42FE+1
                sta       zoneTAMPON1,y
                inc       GIFbitmaxi
L4343           lda       #0
                sta       $f0
                lda       GIFbitmaxi
                cmp       GIFmask
                bcc       L42E7
                lda       GIFcodesize2
                cmp       #12
                beq       L42E7
                inc
                sta       GIFcodesize2
                asl       GIFmask
                jmp       L42E7

GIFclear        jsr       GIFinit
                jsr       GIFreadcode
                sta       $f0
                sta       L42FE+1
                jsr       GIFsave
                jmp       L42E7

GIFeoi          jsr       GIFcorrectif

                lda       GIFoldstack
                tcs
                PushLong  GIFhandle
                _DisposeHandle
                clc
                rts

GIFsave         sty       GIFy
                ldy       GIFindice
                sep       #$20
                sta       [dpPIC],y
                rep       #$20
                iny
                sty       GIFindice
                cpy       picWIDTH
                bcs       GIFsave1
                ldy       GIFy
                rts
GIFsave1        jsr       showTHERMO
                stz       GIFindice

                lda       GIFinterlace         ; Test interlace
                bne       GIFsave3

                inc       numLIGNE

GIFsave2        lda       numLIGNE
                asl
                clc
                adc       numLIGNE
                tay
                lda       [dpLIGNES],y
                sta       dpPIC
                iny
                lda       [dpLIGNES],y
                sta       dpPIC+1
                ldy       GIFy
                rts

GIFsave3        lda       GIFpass              ; for interlace
                bne       GIFsave5

                lda       numLIGNE
                clc
                adc       #8
                sta       numLIGNE
                cmp       picHEIGHT
                bcs       GIFsave4
                brl       GIFsave2
GIFsave4        inc       GIFpass
                lda       #4
                sta       numLIGNE
                brl       GIFsave2

GIFsave5        cmp       #1
                bne       GIFsave7
                lda       numLIGNE
                clc
                adc       #8
                sta       numLIGNE
                cmp       picHEIGHT
                bcs       GIFsave6
                brl       GIFsave2
GIFsave6        inc       GIFpass
                lda       #2
                sta       numLIGNE
                brl       GIFsave2

GIFsave7        cmp       #2
                bne       GIFsave9
                lda       numLIGNE
                clc
                adc       #4
                sta       numLIGNE
                cmp       picHEIGHT
                bcs       GIFsave8
                brl       GIFsave2
GIFsave8        inc       GIFpass
                lda       #1
                sta       numLIGNE
                brl       GIFsave2

GIFsave9        lda       numLIGNE
                clc
                adc       #2
                sta       numLIGNE
                brl       GIFsave2

*---

GIFcorrectif    ldy       GIFindice
                bne       GIFcorrectif1
                rts
GIFcorrectif1   dey
                sep       #$20
                lda       [dpPIC],y
]lp             sta       [dpPIC],y
                iny
                cpy       picWIDTH
                bne       ]lp
                rep       #$20
                rts

*---

GIFgetbuffer    sta       GIFgetbuffer3+1
                sty       proREAD+4
GIFgetbuffer1   ldx       #0
GIFgetbuffer2   lda       tempTABLE,x
                and       #$ff
                sty       GIFgetbuffer2+1
                beq       GIFgetbuffer4
                tax
                stx       GIFgetbuffer1+1
                inx
                sec
GIFgetbuffer3   sbc       #$0000
                sta       GIFbyteoffset
                asl
                asl
                asl
                sta       GIFreadcode1+1
                txy
                ldx       #0
                jsr       GSOSread
GIFgetbuffer4   rts

GIFinit         lda       GIFcodesize
                sta       GIFcodesize2
                asl
                tay
                lda       GIFtblmask,y
                inc
                sta       GIFmask
                lda       GIFtblclear,y
                sta       GIFbitmaxi
                dec
                sta       L42EA+1
                dec
                sta       GIFclearcode
                asl
                sta       L430F+1
                rts

GIFreadcode     lda       GIFbitoffset
GIFreadcode1    cmp       #$0000
                bcc       GIFreadcode2
                sbc       GIFreadcode1+1
                sta       GIFbitoffset
                ldy       GIFbyteoffset
                lda       tempTABLE,y
                sta       tempTABLE
                lda       tempTABLE+2,y
                sta       tempTABLE+2
                lda       #0
                ldy       #tempTABLE+4
                jsr       GIFgetbuffer
                bcc       GIFreadcode
                pla
                jmp       GIFeoi

GIFreadcode2    tax
                lsr
                lsr
                lsr
                tay
                lda       tempTABLE,y
                sta       GIFcode
                txa
                and       #%0000_0111
                beq       GIFreadcode3
                tax
                lda       tempTABLE+2,y
]lp             lsr
                ror       GIFcode
                dex
                bne       ]lp
GIFreadcode3    lda       GIFcodesize2
                asl
                tay
                lda       GIFbitoffset
                adc       GIFcodesize2
                sta       GIFbitoffset
                lda       GIFcode
                and       GIFtblmask,y
                rts

*--- Lecture d'un octet du fichier

unpGIF90        ldx       #0
                ldy       #1
                jsr       GSOSread
                lda       [dpBUF]
                and       #$ff
                rts

*--- Data

GIFhandle       ds        4
GIFstack        ds        2
GIFoldstack     ds        2
GIFinterlace    ds        2
GIFbody         ds        2
GIFcmap         ds        2

GIFindice       ds        2
GIFy            ds        2
GIFpass         ds        2

GIFclearcode    ds        2                    ; Clear Code
GIFbitoffset    ds        2                    ; BitOffset
GIFbyteoffset   ds        2                    ; ByteOffset
GIFcode         ds        2                    ; Code
GIFcodesize     ds        2                    ; Initial code size
GIFcodesize2    ds        2                    ; Copy of ICS
GIFbitmaxi      ds        2                    ; Current
GIFmask         ds        2                    ; Mask

GIFnbcolors     dw        2
                dw        4
                dw        8
                dw        16
                dw        32
                dw        64
                dw        128
                dw        256
GIFsizecmap     dw        6
                dw        12
                dw        24
                dw        48
                dw        96
                dw        192
                dw        384
                dw        768

GIFtblclear     dw        $0000                ; EOF Code
                dw        $0000
                dw        $0000
                dw        $0006
                dw        $000A
                dw        $0012
                dw        $0022
                dw        $0042
                dw        $0082
                dw        $0102
                dw        $0202
                dw        $0402
                dw        $0802
GIFtblmask      dw        $0000                ; Mask
                dw        $0001
                dw        $0003
                dw        $0007
                dw        $000F
                dw        $001F
                dw        $003F
                dw        $007F
                dw        $00FF
                dw        $01FF
                dw        $03FF
                dw        $07FF
                dw        $0FFF

