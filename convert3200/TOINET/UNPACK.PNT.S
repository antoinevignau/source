*-----------------
* PAINTWORKS
*-----------------

               mx        %00

unpPNT         cpy       #0
               beq       unpPNT2

               lda       #640           ; aux $8000: 640 width
               sta       picWIDTH
               lda       #$80
               jsr       initSCB

unpPNT2        ldx       #$0001
               ldy       #$0000
               jsr       GSOSread

               jsr       initPALETTE    ; Palette

               ldy       #0             ; recopie la palette
]lp            lda       [dpBUF],y
               jsr       savePALETTE
               iny
               cpy       #32
               bne       ]lp

*---

               lda       ptrBUFFER
               clc
               adc       #$222
               sta       PNTpackedHa
               lda       ptrBUFFER+2
               adc       #0
               sta       PNTpackedHa+2

               lda       proOPEN+42
               sec
               sbc       #$222
               sta       PNTpackedSize

               lda       ptrPIC16
               sta       PNTstartHa
               lda       ptrPIC16+2
               sta       PNTstartHa+2

               lda       #$fa00         ; Suppose 200*2
               sta       PNTsizePtr

               pha
               PushLong  PNTpackedHa
               PushWord  PNTpackedSize
               PushLong  #PNTstartHa
               PushLong  #PNTsizePtr
               _UnPackBytes
               pla

               lda       PNTsizePtr     ; =32000, image 200 lignes
               cmp       #$7d00
               beq       unpPNT3

               pha                      ; sinon calcule la vraie hauteur
               pha
               pha
               pha
               pea       $0000
               lda       PNTstartHa
               pha
               pea       $0000
               pea       $00a0
               _LongDivide
               pla
               sta       picHEIGHT
               pla
               pla
               pla

unpPNT3        lda       #1
               sta       fgIMAGE256

               jsr       makePIC
               bcc       unpPNT4
               rts

unpPNT4        lda       ptrPIC16
               sta       unpPNT90+1
               lda       ptrPIC16+1
               sta       unpPNT90+2

               ldx       #0
               txy

               lda       picWIDTH
               cmp       #640
               beq       unpPNT20

unpPNT10       jsr       unpPNT90
               pha
               and       #$f0
               lsr
               lsr
               lsr
               lsr
               sta       [dpPIC],y
               iny
               pla
               and       #$0f
               sta       [dpPIC],y
               iny
               cpy       picWIDTH
               bne       unpPNT10
               jsr       unpPNTy
               bcs       unpPNT10
               rts

unpPNT20       jsr       unpPNT90
               pha
               pha
               pha
               and       #%1100_0000
               lsr
               lsr
               lsr
               lsr
               lsr
               lsr
               sta       [dpPIC],y
               iny
               pla
               and       #%0011_0000
               lsr
               lsr
               lsr
               lsr
               sta       [dpPIC],y
               iny
               pla
               and       #%0000_1100
               lsr
               lsr
               sta       [dpPIC],y
               iny
               pla
               and       #%0000_0011
               sta       [dpPIC],y
               iny
               cpy       picWIDTH
               bne       unpPNT20
               jsr       unpPNTy
               bcs       unpPNT20
               rts

unpPNTy        jsr       showTHERMO
               inc       numLIGNE
               lda       numLIGNE
               cmp       picHEIGHT
               bcs       unpPNTy1
               asl
               clc
               adc       numLIGNE
               tay
               lda       [dpLIGNES],y
               sta       dpPIC
               iny
               lda       [dpLIGNES],y
               sta       dpPIC+1
               ldy       #0
               sec
               rts
unpPNTy1       clc
               rts

unpPNT90       ldal      $012000,x
               and       #$ff
               inx
               rts

*--- Data

PNTpackedHa    ds        4
PNTpackedSize  ds        2
PNTstartHa     ds        4
PNTsizePtr     ds        2

