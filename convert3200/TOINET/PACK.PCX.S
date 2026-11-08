*-----------------
* PCX
*-----------------

packPCX     lda   fgALL            ; CONVERT ALL
            beq   packPCX1
            lda   fgMODE           ; MODE NONE?
            cmp   #4
            bne   packPCX1
            brl   nonePCX

packPCX1    ldx   #6
            ldy   #0
            jsr   GSOScreate
            bcc   packPCX2
            rts
packPCX2    lda   #320
            sta   pkPCX3
            dec
            sta   pkPCX1
            lda   #199
            sta   pkPCX2

            lda   #pkPCX           ; Entete
            sta   proWRITE+4
            lda   #^pkPCX
            sta   proWRITE+6
            ldx   #0
            ldy   #128
            jsr   GSOSwrite
            bcc   packPCX3
            rts

packPCX3    lda   menuSAVE1        ; 16 grey
            cmp   #4
            bne   packPCX4
            ldx   ptrPIC16+2
            ldy   ptrPIC16
            jsr   changeRES
            bra   packPCX10

packPCX4    cmp   #3               ; 16 col
            bne   packPCX5
            lda   ptrPIC16
            clc
            adc   #$8000
            tay
            lda   ptrPIC16+2
            adc   #0
            tax
            jsr   changeRES
            bra   packPCX10

packPCX5    cmp   #2               ; 256 col
            bne   packPCX6
            ldx   ptrPIC256+2
            ldy   ptrPIC256
            jsr   changeRES
            bra   packPCX10

packPCX6    jsr   changeRES10      ; Image 3200

*---

packPCX10   lda   ptrBUFFER
            sta   Debut
            lda   ptrBUFFER+2
            sta   Debut+2

            lda   #zoneTAMPON1
            sta   proWRITE+4
            lda   #^zoneTAMPON1
            sta   proWRITE+6

            stz   numLIGNE

packPCX11   ldy   #0               ; Recopie une ligne
]lp         lda   [Debut],y        ; dans le buffer
            sta   zoneTAMPON,y
            iny
            cpy   #320
            bne   ]lp

            lda   Debut
            clc
            adc   #320
            sta   Debut
            lda   Debut+2
            adc   #0
            sta   Debut+2

            lda   #1
            sta   pkPCXcnt         ; compteur
            stz   pkPCXcnt1        ; indice source
            stz   pkPCXcnt2        ; indice destination

*---

packPCX12   ldx   pkPCXcnt1
            lda   zoneTAMPON,x
            and   #$ff
            sta   pkPCXdata

]lp         inx
            lda   zoneTAMPON,x
            and   #$ff
            cmp   pkPCXdata
            bne   packPCX13

            cpx   #320
            bcs   packPCX13
            inc   pkPCXcnt
            lda   pkPCXcnt
            cmp   #63              ; end of counter
            bcc   ]lp
            inx

packPCX13   stx   pkPCXcnt1

            ldy   pkPCXcnt2

            lda   pkPCXcnt
            cmp   #1
            beq   packPCX14
            ora   #$c0
            sta   zoneTAMPON1,y
            lda   pkPCXdata
            sta   zoneTAMPON1+1,y
            iny
            iny
            bra   packPCX16

packPCX14   lda   pkPCXdata
            cmp   #$c0
            bcs   packPCX15
            sta   zoneTAMPON1,y
            iny
            bra   packPCX16

packPCX15   lda   #$c1
            sta   zoneTAMPON1,y
            lda   pkPCXdata
            sta   zoneTAMPON1+1,y
            iny
            iny
packPCX16   sty   pkPCXcnt2

*--- Test eventual end of line

            lda   #1
            sta   pkPCXcnt         ; re-init counter

            lda   pkPCXcnt1        ; end of line
            cmp   #320
            bcs   packPCX17
            brl   packPCX12

packPCX17   ldx   #0               ; output the line
            ldy   pkPCXcnt2
            jsr   GSOSwrite
            bcc   packPCX18
            rts
packPCX18   inc   numLIGNE
            lda   numLIGNE
            cmp   #200
            bcs   packPCX30
            brl   packPCX11

*--- Maintenant, sauve la palette

packPCX30   lda   #pkPCX10
            sta   proWRITE+4
            lda   #^pkPCX10
            sta   proWRITE+6
            ldx   #0
            ldy   #1
            jsr   GSOSwrite
            bcc   packPCX31
            rts
packPCX31   lda   #pcPALETTE1
            sta   proWRITE+4
            lda   #^pcPALETTE1
            sta   proWRITE+6
            ldx   #0
            ldy   #768
            jsr   GSOSwrite
            rts

*--- Mode NONE

nonePCX     lda   picWIDTH
            sta   pkPCX3
            dec
            sta   pkPCX1
            lda   picHEIGHT
            dec
            sta   pkPCX2

            ldx   #6
            ldy   #0
            jsr   GSOScreate
            bcc   nonePCX1
            rts
nonePCX1    lda   #pkPCX           ; Entete
            sta   proWRITE+4
            lda   #^pkPCX
            sta   proWRITE+6
            ldx   #0
            ldy   #128
            jsr   GSOSwrite
            bcc   nonePCX2
            rts

*---

nonePCX2    lda   #zoneTAMPON1
            sta   proWRITE+4
            lda   #^zoneTAMPON1
            sta   proWRITE+6

            stz   numLIGNE

nonePCX3    lda   numLIGNE         ; Les lignes
            asl
            clc
            adc   numLIGNE
            tay
            lda   [dpLIGNES],y
            sta   Debut
            iny
            lda   [dpLIGNES],y
            sta   Debut+1

            ldy   #0               ; Recopie une ligne
]lp         lda   [Debut],y        ; dans le buffer
            sta   zoneTAMPON,y
            iny
            cpy   picWIDTH
            bne   ]lp

            lda   #1
            sta   pkPCXcnt         ; compteur
            stz   pkPCXcnt1        ; indice source
            stz   pkPCXcnt2        ; indice destination

*---

nonePCX10   ldx   pkPCXcnt1
            lda   zoneTAMPON,x
            and   #$ff
            sta   pkPCXdata

]lp         inx
            lda   zoneTAMPON,x
            and   #$ff
            cmp   pkPCXdata
            bne   nonePCX11

            cpx   picWIDTH
            bcs   nonePCX11
            inc   pkPCXcnt
            lda   pkPCXcnt
            cmp   #63              ; end of counter
            bcc   ]lp
            inx

nonePCX11   stx   pkPCXcnt1

            ldy   pkPCXcnt2

            lda   pkPCXcnt
            cmp   #1
            beq   nonePCX12
            ora   #$c0
            sta   zoneTAMPON1,y
            lda   pkPCXdata
            sta   zoneTAMPON1+1,y
            iny
            iny
            bra   nonePCX14

nonePCX12   lda   pkPCXdata
            cmp   #$c0
            bcs   nonePCX13
            sta   zoneTAMPON1,y
            iny
            bra   nonePCX14

nonePCX13   lda   #$c1
            sta   zoneTAMPON1,y
            lda   pkPCXdata
            sta   zoneTAMPON1+1,y
            iny
            iny

nonePCX14   sty   pkPCXcnt2

*--- Test eventual end of line

            lda   #1
            sta   pkPCXcnt         ; re-init counter

            lda   pkPCXcnt1        ; end of line
            cmp   picWIDTH
            bcs   nonePCX15
            brl   nonePCX10

nonePCX15   ldx   #0               ; output the line
            ldy   pkPCXcnt2
            jsr   GSOSwrite
            bcc   nonePCX16
            rts
nonePCX16   inc   numLIGNE
            lda   numLIGNE
            cmp   picHEIGHT
            bcs   nonePCX17
            brl   nonePCX3
nonePCX17   brl   packPCX30

*--- Data BIN

pkPCXcnt    ds    2
pkPCXcnt1   ds    2
pkPCXcnt2   ds    2
pkPCXdata   ds    2

pkPCX       db    $0a              ; Identifier
            db    $05              ; Version
            db    $01              ; Encoding
            db    $08              ; BitsPerPixel
            ds    2                ; XStart
            ds    2                ; YStart
pkPCX1      ds    2                ; XEnd
pkPCX2      ds    2                ; YEnd
            ds    2                ; HorzRes
            ds    2                ; VertRes
            hex   000000101010202020303030
            hex   404040505050606060707070
            hex   808080909090a0a0a0b0b0b0
            hex   c0c0c0d0d0d0e0e0e0f0f0f0
            ds    1                ; Reserved1
            db    $01              ; NumBitsPlanes
pkPCX3      ds    2                ; BytesPerLine
            dw    1                ; PaletteType
            ds    2                ; HorzScreenSize
            ds    2                ; HorzScreenSize
            ds    54               ; Reserved2

pkPCX10     db    $0c

