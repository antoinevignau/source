*-----------------
* BMP
*-----------------

packBMP      lda   fgALL           ; CONVERT ALL
             beq   packBMP1
             lda   fgMODE
             cmp   #4
             bne   packBMP1
             brl   noneBMP

packBMP1     lda   #320
             sta   pkBMP1+4
             lda   #200
             sta   pkBMP1+8

             ldx   #6
             ldy   #0
             jsr   GSOScreate
             bcc   packBMP2
             rts
packBMP2     lda   #pkBMP          ; Header
             sta   proWRITE+4
             lda   #^pkBMP
             sta   proWRITE+6
             ldx   #0
             ldy   #14
             jsr   GSOSwrite
             bcc   packBMP3
             rts

packBMP3     lda   #pkBMP1         ; ImageInfo
             sta   proWRITE+4
             lda   #^pkBMP1
             sta   proWRITE+6
             ldx   #0
             ldy   #40
             jsr   GSOSwrite
             bcc   packBMP4
             rts

packBMP4     lda   menuSAVE1       ; 16 grey
             cmp   #4
             bne   packBMP5
             ldx   ptrPIC16+2
             ldy   ptrPIC16
             jsr   changeRES
             bra   packBMP10

packBMP5     cmp   #3              ; 16 col
             bne   packBMP6
             lda   ptrPIC16
             clc
             adc   #$8000
             tay
             lda   ptrPIC16+2
             adc   #0
             tax
             jsr   changeRES
             bra   packBMP10

packBMP6     cmp   #2              ; 256 col
             bne   packBMP7
             ldx   ptrPIC256+2
             ldy   ptrPIC256
             jsr   changeRES
             bra   packBMP10

packBMP7     jsr   changeRES10     ; Image 3200

*--- Palette

packBMP10    ldx   #0
]lp          stz   tempTABLE,x
             inx
             inx
             cpx   #256*4
             bne   ]lp

             ldx   #0
             txy
]lp          lda   pcPALETTE1+2,x  ; B
             sta   tempTABLE,y
             lda   pcPALETTE1+1,x  ; G
             sta   tempTABLE+1,y
             lda   pcPALETTE1,x    ; R
             sta   tempTABLE+2,y
             lda   #0              ; 0
             sta   tempTABLE+3,y
             inx
             inx
             inx
             iny
             iny
             iny
             iny
             cpy   #256*4
             bne   ]lp

             lda   #tempTABLE      ; Palette
             sta   proWRITE+4
             lda   #^tempTABLE
             sta   proWRITE+6

             ldx   #0
             ldy   #256*4
             jsr   GSOSwrite
             bcc   packBMP11
             rts

packBMP11    stz   numLIGNE

             lda   ptrBUFFER
             clc
             adc   #$f8c0
             sta   pkBMPoffset
             sta   proWRITE+4
             lda   ptrBUFFER+2
             adc   #0
             sta   pkBMPoffset+2
             sta   proWRITE+6

packBMP12    ldx   #0
             ldy   #320
             jsr   GSOSwrite
             bcc   packBMP13
             rts

packBMP13    lda   pkBMPoffset
             sec
             sbc   #320
             sta   pkBMPoffset
             sta   proWRITE+4

             inc   numLIGNE
             lda   numLIGNE
             cmp   #200
             bne   packBMP12
             clc
             rts

*--- Mode NONE

noneBMP      lda   picWIDTH
             sta   pkBMP1+4
             lda   picHEIGHT
             sta   pkBMP1+8

             ldx   #6
             ldy   #0
             jsr   GSOScreate
             bcc   noneBMP1
             rts
noneBMP1     lda   #pkBMP          ; Header
             sta   proWRITE+4
             lda   #^pkBMP
             sta   proWRITE+6
             ldx   #0
             ldy   #14
             jsr   GSOSwrite
             bcc   noneBMP2
             rts

noneBMP2     lda   #pkBMP1         ; ImageInfo
             sta   proWRITE+4
             lda   #^pkBMP1
             sta   proWRITE+6
             ldx   #0
             ldy   #40
             jsr   GSOSwrite
             bcc   noneBMP3
             rts

*--- Palette

noneBMP3     ldx   #0
]lp          stz   tempTABLE,x
             inx
             inx
             cpx   #256*4
             bne   ]lp

             ldx   #0
             txy
]lp          lda   pcPALETTE1+2,x  ; B
             sta   tempTABLE,y
             lda   pcPALETTE1+1,x  ; G
             sta   tempTABLE+1,y
             lda   pcPALETTE1,x    ; R
             sta   tempTABLE+2,y
             lda   #0              ; 0
             sta   tempTABLE+3,y
             inx
             inx
             inx
             iny
             iny
             iny
             iny
             cpy   #256*4
             bne   ]lp

             lda   #tempTABLE      ; Palette
             sta   proWRITE+4
             lda   #^tempTABLE
             sta   proWRITE+6

             ldx   #0
             ldy   #256*4
             jsr   GSOSwrite
             bcc   noneBMP4
             rts

*--- Image

noneBMP4     ldx   #0
]lp          stz   tempTABLE,x
             inx
             inx
             cpx   #1024
             bne   ]lp

             lda   picWIDTH
             clc
             adc   #3
             lsr
             lsr
             asl
             asl
             sta   pkBMPwidth

             lda   picHEIGHT
             dec
             sta   numLIGNE

*---

noneBMP5     lda   numLIGNE        ; Les lignes
             asl
             clc
             adc   numLIGNE
             tay
             lda   [dpLIGNES],y
             sta   dpPIC
             iny
             iny
             lda   [dpLIGNES],y
             sta   dpPIC+2

             ldy   #0
]lp          lda   [dpPIC],y
             sta   tempTABLE,y
             iny
             cpy   picWIDTH
             bne   ]lp

             ldx   #0
             ldy   pkBMPwidth
             jsr   GSOSwrite
             bcc   noneBMP6
             rts
noneBMP6     dec   numLIGNE
             lda   numLIGNE
             bpl   noneBMP5
             clc
             rts

*--- Data BMP

pkBMPwidth   ds    2
pkBMPoffset  ds    4

pkBMP        asc   'BM'            ; +00 ImageFileType
             ds    4               ; +02 FileSize
             ds    2               ; +06 Reserved1
             ds    2               ; +08 Reserved2
             adrl  1078            ; +10 ImageDataOffset

* 1078= 14+40+4*256 (Header+ImageInfo+Palette)

pkBMP1       adrl  40              ; +00 HeaderSize
             ds    4               ; +04 ImageWidth
             ds    4               ; +08 ImageHeight
             dw    1               ; +12 NumberOfImagePlanes
             dw    8               ; +14 BitsPerPixel
             ds    4               ; +16 CompressionMethod
             ds    4               ; +20 SizeOfBitmap
             ds    4               ; +24 HorzResolution
             ds    4               ; +28 VertResolution
             adrl  256             ; +32 NumColorsUsed
             ds    4               ; +36 NumSignificantColors

