*-----------------
* DREAMGRAPHIX
*-----------------

            mx    %00

unpDG       ldx   #$0000
            ldy   #$c000
            jsr   GSOSread

            phd
            tdc
            clc
            adc   #$0100
            tcd

            lda   ptrBUFFER
            sta   Debut
            lda   ptrBUFFER+2
            sta   Debut+2

            lda   ptrPIC16
            sta   Arrivee
            lda   ptrPIC16+2
            sta   Arrivee+2

            lda   ptrBUFFER
            clc
            adc   #$c000
            sta   $1e
            lda   ptrBUFFER+2
            adc   #0
            sta   $20

            lda   ptrBUFFER
            clc
            adc   #$e000
            sta   $22
            lda   ptrBUFFER+2
            adc   #0
            sta   $24

            ldy   #$3fff
            lda   #0
]lp         sta   [$1e],y
            dey
            dey
            bpl   ]lp

            lda   #$0009
            sta   G0517+1
            lda   #$01FF
            sta   G051E+1
            stz   $1C
            pea   $FFFF

G042C       jsr   G04E8
            cmp   #$0101
            bne   G042D
            brl   G04A4
G042D       cmp   #$0100
            beq   G0491
            sta   $12
            cmp   $14
            bcc   G0443
            lda   $10
            pei   $0E
G0443       cmp   #$0100
            bcc   G0455
            asl
G0449       tay
            lda   [$22],Y
            pha
            lda   [$1E],Y
            cmp   #$0200
            bcs   G0449
            lsr
G0455       and   #$00FF
            sta   $0E
            sta   $1A
            ldy   #$0000
G045F       sta   [Arrivee],Y
            iny
            pla
            bpl   G045F
            pha
            tya
            clc
            adc   Arrivee
            sta   Arrivee

            jsr   G04D8
            lda   $12
            sta   $10
            lda   $14
            cmp   $18
            bcc   G048F
            lda   G0517+1
            cmp   #$000C
            beq   G048F
            inc
            sta   G0517+1
            asl
            tax
            lda   maskPACK-$12,X
            sta   G051E+1
            asl   $18
G048F       bra   G042C
G0491       jsr   G04C1
            jsr   G04E8
            sta   $10
            sta   $1A
            sta   $0E
            sta   [Arrivee]

            inc   Arrivee

            jmp   G042C

G04A4       pla

            lda   proOPEN+42      ; eof
            sec
            sbc   #$0011
            clc
            adc   ptrBUFFER
            sta   Debut

            lda   [Debut]
            bne   G04A5
            pld
            stz   PACKtype
            brl   unpPACKent
G04A5       pld
            lda   #1
            sta   PACKtype
            brl   unpPACKent

G04C1       lda   #$0009
            sta   G0517+1
            lda   #$01FF
            sta   G051E+1
            lda   #$0200
            sta   $18
            lda   #$0102
            sta   $14
            rts

G04D8       lda   $14
            asl
            tay
            lda   $1A
            sta   [$22],Y
            lda   $10
            asl
            sta   [$1E],Y
            inc   $14
            rts

G04E8       lda   $1C
            and   #$0007
            tax
            lda   $1C
            lsr
            lsr
            lsr
            cmp   #$03FD
            bcc   G0502
            clc
            adc   Debut
            sta   Debut
            stx   $1C
            lda   #$0000
G0502       tay
            lda   [Debut],Y
            sta   $08
            iny
            iny
            lda   [Debut],Y
            txy
            beq   G0514
G050E       lsr
G050F       ror   $08
            dex
            bne   G050E
G0514       lda   $1C
            clc
G0517       adc   #$FFFF          ; $0009 on beginning
            sta   $1C
            lda   $08
G051E       and   #$FFFF          ; $01FF on beginning
            rts

maskPACK    dw    $01ff
            dw    $03ff
            dw    $07ff
            dw    $0fff
            dw    $0000

