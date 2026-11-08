*-----------------
* PIC
*-----------------

            mx    %00

unpPIC      sty   PACKtype

            lda   ptrPIC16
            sta   proREAD+4
            lda   ptrPIC16+2
            sta   proREAD+6

            lda   PACKtype
            bne   unpPIC2

            ldx   #0
            ldy   #$8000
            jsr   GSOSread
            brl   unpPACKent

unpPIC2     ldx   #0
            ldy   #$9600
            jsr   GSOSread
            brl   unpPACKent

