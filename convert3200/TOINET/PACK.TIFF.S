*-----------------
* TIFF
*-----------------

             mx    %00

packTIFF     lda   fgALL         ; CONVERT ALL
             beq   packTIFF1
             lda   fgMODE
             cmp   #4
             bne   packTIFF1
             brl   noneTIFF

packTIFF1    ldx   #6
             ldy   #0
             jsr   GSOScreate
             bcc   packTIFF2
             rts
packTIFF2    lda   #320
             sta   pkTIFF1
             lda   #200
             sta   pkTIFF2

             lda   #pkTIFF       ; Header
             sta   proWRITE+4
             lda   #^pkTIFF
             sta   proWRITE+6
             ldx   #0
             ldy   #200
             jsr   GSOSwrite
             bcc   packTIFF3
             rts

packTIFF3    lda   menuSAVE1     ; 16 grey
             cmp   #4
             bne   packTIFF4
             ldx   ptrPIC16+2
             ldy   ptrPIC16
             jsr   changeRES
             bra   packTIFF10

packTIFF4    cmp   #3            ; 16 col
             bne   packTIFF5
             lda   ptrPIC16
             clc
             adc   #$8000
             tay
             lda   ptrPIC16+2
             adc   #0
             tax
             jsr   changeRES
             bra   packTIFF10

packTIFF5    cmp   #2            ; 256 col
             bne   packTIFF6
             ldx   ptrPIC256+2
             ldy   ptrPIC256
             jsr   changeRES
             bra   packTIFF10

packTIFF6    jsr   changeRES10   ; Image 3200

packTIFF10   lda   #tempTABLE    ; Palette
             sta   proWRITE+4
             lda   #^tempTABLE
             sta   proWRITE+6

             ldx   #0
]lp          phx
             jsr   noneTIFF10
             bcc   packTIFF11
             plx
             rts
packTIFF11   plx
             inx
             cpx   #3
             bne   ]lp

             lda   ptrBUFFER     ; Sauve les points
             sta   proWRITE+4
             lda   ptrBUFFER+2
             sta   proWRITE+6
             ldx   #0
             ldy   #64000
             jsr   GSOSwrite
             rts

*--- Mode NONE

noneTIFF     lda   picWIDTH
             sta   pkTIFF1
             lda   picHEIGHT
             sta   pkTIFF2

             ldx   #6
             ldy   #0
             jsr   GSOScreate
             bcc   noneTIFF1
             rts
noneTIFF1    lda   #pkTIFF       ; Header
             sta   proWRITE+4
             lda   #^pkTIFF
             sta   proWRITE+6
             ldx   #0
             ldy   #200
             jsr   GSOSwrite
             bcc   noneTIFF2
             rts

*--- Palette

noneTIFF2    lda   #tempTABLE    ; Palette
             sta   proWRITE+4
             lda   #^tempTABLE
             sta   proWRITE+6

             ldx   #0
]lp          phx
             jsr   noneTIFF10
             bcc   noneTIFF3
             plx
             rts
noneTIFF3    plx
             inx
             cpx   #3
             bne   ]lp

*--- Image

             ldx   #0
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
             sta   pkTIFFwidth

             stz   numLIGNE

*---

noneTIFF4    lda   numLIGNE      ; Les lignes
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
             ldy   pkTIFFwidth
             jsr   GSOSwrite
             bcc   noneTIFF5
             rts
noneTIFF5    inc   numLIGNE
             lda   numLIGNE
             cmp   picHEIGHT
             bne   noneTIFF4
             clc
             rts

*--- Ecriture de la palette

noneTIFF10   ldy   #0
]lp          lda   pcPALETTE1,x  ; B
             and   #$ff
             xba
             sta   tempTABLE,y
             inx
             inx
             inx
             iny
             iny
             cpy   #256*2
             bne   ]lp

             ldx   #0
             ldy   #256*2
             jsr   GSOSwrite
             rts

*--- Data TIFF (Write $93 Bytes)

pkTIFFwidth  ds    2

pkTIFF       asc   'II'          ; +00 Identifier
             dw    $2a           ; +02 Version
             adrl  8             ; +04 IFDOffset

             dw    $000C         ; NumDirEntries
             dw    $0100         ; ImageWidth
             dw    $0003
             adrl  $00000001
pkTIFF1      adrl  $00000140
             dw    $0101         ; ImageHeight
             dw    $0003
             adrl  $00000001
pkTIFF2      adrl  $000000C8
             dw    $0102         ; BitsPerSample
             dw    $0003
             adrl  $00000001
             adrl  $00000008
             dw    $0103         ; Compression
             dw    $0003
             adrl  $00000001
             adrl  $00000001
             dw    $0106         ; PhotometricInterpretation
             dw    $0003
             adrl  $00000001
             adrl  $00000003
             dw    $0111         ; StripOffsets
             dw    $0004
             adrl  $00000001
             adrl  $000006C8
             dw    $0115         ; SamplesPerPixel
             dw    $0003
             adrl  $00000001
             adrl  $00000001
             dw    $011A         ; XResolution
             dw    $0005
             adrl  $00000001
             adrl  $00000020
             dw    $011B         ; YResolution
             dw    $0005
             adrl  $00000001
             adrl  $00000020
             dw    $011C         ; PlanarConfiguration
             dw    $0003
             adrl  $00000001
             adrl  $00000001
             dw    $0131         ; Software
             dw    $0002
             adrl  $00000001
             adrl  $0000009E
             dw    $0140         ; ColorMap
             dw    $0003
             adrl  $00000300
             adrl  $000000C8
             adrl  $00000000

             asc   'Convert 3200 IIgs'0d
             asc   '(c) 1995, Brutal Deluxe'00

