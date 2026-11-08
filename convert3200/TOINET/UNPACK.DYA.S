*-----------------
* DYA
*-----------------

L01EB       =     $a0
L11EB       =     $a4
L12EB       =     $a8

            mx    %00

unpDYA      ldx   #$0000
            ldy   #$e000
            jsr   GSOSread

            lda   ptrBUFFER
            clc
            adc   #$e000
            sta   L01EB
            lda   ptrBUFFER+2
            adc   #0
            sta   L01EB+2

            lda   ptrBUFFER
            clc
            adc   #$f000
            sta   L11EB
            lda   ptrBUFFER+2
            adc   #0
            sta   L11EB+2

            lda   ptrBUFFER
            clc
            adc   #$f100
            sta   L12EB
            lda   ptrBUFFER+2
            adc   #0
            sta   L12EB+2

            ldy   #0
            tya
]lp         sta   [L11EB],y
            sta   [L12EB],y
            iny
            iny
            cpy   #256
            bne   ]lp

            stz   DYAflag

*---

unpDYA2     ldy   #3
            lda   [dpBUF],y
            and   #$ff
            cmp   #$02
            bcs   unpDYA3
            asl
            tax

            ldy   #6
            lda   dpBUF
            adc   [dpBUF],y
            sta   $82
            lda   dpBUF+2
            adc   #0
            sta   $84

            lda   dpBUF
            adc   #8
            sta   dpBUF
            lda   dpBUF+2
            adc   #0
            sta   dpBUF+2

            jsr   (DYAwhere,X)
            bcs   unpDYA3
            lda   #1
            sta   PACKtype
            brl   unpPACKent
unpDYA3     _errFORMAT

unpDYA10    lda   $82
            sta   DYAc
            ldy   #0
unpDYA11    lda   [dpBUF],Y
            sta   $96
            iny
            iny
            lda   [dpBUF],Y
            sta   $80
            iny
            iny
            lda   [dpBUF],Y
            clc
            adc   DYAc
            sta   DYAc
            iny
            iny
            lda   [dpBUF],Y
            cmp   #-1
            beq   unpDYA12
            sta   $86
            iny
            iny
            lda   [dpBUF],Y
            sta   $88
            iny
            iny
            sty   DYAcounty
            jsr   unpDYA30
            lda   $90
            cmp   $96
            bne   unpDYA13
            lda   DYAc
            sta   $82
            ldy   DYAcounty
            bra   unpDYA11
unpDYA12    clc
            rts
unpDYA13    sec
            rts

unpDYA20    lda   [dpBUF]
            sta   $96
            lda   #$7d00
            sta   $80
            lda   ptrPIC16
            sta   $86
            lda   ptrPIC16+2
            sta   $88
            jsr   unpDYA30

            lda   #$1900
            sta   $80
            lda   ptrPIC16
            clc
            adc   #$7d00
            sta   $86
            lda   ptrPIC16+2
            adc   #0
            sta   $88
            jsr   unpDYA40

            lda   $90
            cmp   $96
            bne   unpDYA21
            clc
            rts
unpDYA21    sec
            rts

unpDYA30    lda   DYAflag
            bne   unpDYA31
            jsr   unpDYA80
unpDYA31    stz   $90
            ldy   #$0FEC
            lda   #0
unpDYA32    sta   [L01EB],y
            dey
            dey
            bpl   unpDYA32
            lda   #$0FEE
            sta   $8C
            stz   $8E
            sec
            lda   #0
            sbc   $80
            sta   $80
unpDYA33    lsr   $8E
            lda   $8E
            bit   #$0100
            bne   unpDYA34
            jsr   unpDYA60
            ora   #$FF00
            sta   $8E
unpDYA34    bit   #$0001
            beq   unpDYA35
            jsr   unpDYA60
            ldy   $8C
            sep   #$20
            sta   [L01EB],y
            rep   #$20
            jsr   unpDYA50
            iny
            tya
            and   #$0FFF
            sta   $8C
            bra   unpDYA33
unpDYA35    jsr   unpDYA70
            tax
            and   #$0FFF
            tay
            txa
            rol
            rol
            rol
            rol
            rol
            and   #$000F
            inc
            inc
            sta   $8A
            ldx   $8C
unpDYA36    lda   [L01EB],y
            sep   #$20
            phy
            txy
            sta   [L01EB],y
            ply
            rep   #$20
            jsr   unpDYA50
            inx
            txa
            and   #$0FFF
            tax
            iny
            tya
            and   #$0FFF
            tay
            dec   $8A
            bpl   unpDYA36
            stx   $8C
            bra   unpDYA33

unpDYA40    sec
            lda   #0
            sbc   $80
            sta   $80
            pei   $9E
            lda   $98
            ldy   $9C
            ldx   $9A
            rts
            rts

unpDYA50    and   #$ff
            sep   #$20
            sta   [$86]
            phy
            eor   $91
            tay
            lda   $90
            eor   [L12EB],y
            sta   $91
            lda   [L11EB],y
            sta   $90
            ply
            rep   #$20
            inc   $86
            inc   $80
            bne   unpDYA51
            sta   $98
            sty   $9C
            stx   $9A
            pla
            sta   $9E
unpDYA51    rts

unpDYA60    lda   [$82]
            and   #$ff
            inc   $82
            rts

unpDYA70    lda   [$82]
            inc   $82
            inc   $82
            rts

unpDYA80    sep   #$30
            ldy   #$00
unpDYA81    tya
            eor   [L12EB],y
            sta   [L12EB],y
            ldx   #$08
unpDYA82    lda   [L11EB],y
            asl
            sta   [L11EB],y
            lda   [L12EB],y
            rol
            sta   [L12EB],y
            bcc   unpDYA83
            lda   [L12EB],y
            eor   #$10
            sta   [L12EB],y
            lda   [L11EB],y
            eor   #$21
            sta   [L11EB],y
unpDYA83    dex
            bne   unpDYA82
            iny
            bne   unpDYA81
            rep   #$30
            inc   DYAflag
            rts

*--- Data

DYAwhere    da    unpDYA10
            da    unpDYA20

DYAcounty   ds    2
DYAc        ds    2
DYAflag     ds    2

