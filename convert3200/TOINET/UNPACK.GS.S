*-----------------
* FORMATS GS
*-----------------

            mx    %00

unpGS       lda   ptrPIC16
            sta   dpGS
            lda   ptrPIC16+2
            sta   dpGS+2

            ldx   proOPEN+16   ; auxtype
            ldy   proOPEN+42   ; eof

            lda   proOPEN+14   ; filetype
            cmp   #$c0
            bne   unpGS1
            brl   unpGS10
unpGS1      cmp   #$c1
            bne   unpGS2
            brl   unpGS20
unpGS2      cmp   #$f1
            bne   unpGS3
            brl   unpGS30
unpGS3      cmp   #$00
            bne   unpGS4
            brl   unpGS40
unpGS4      cmp   #$06
            bne   unpGS5
            brl   unpGS40
unpGS5      _errFORMAT

unpGS10     cpx   #$0000       ; PNT 320
            bne   unpGS11
            ldy   #0
            brl   unpPNT
unpGS11     cpx   #$0001       ; PackBytes
            bne   unpGS12
            ldy   #0
            brl   unpPACK
unpGS12     cpx   #$0002       ; APF
            bne   unpGS13
            brl   unpAPF
unpGS13     cpx   #$8000       ; PNT 640
            bne   unpGS14
            ldy   #1
            brl   unpPNT
unpGS14     cpx   #$8005       ; DreamGraphix
            bne   unpGS15
            brl   unpDG
unpGS15     _errFORMAT         ; GIF is not handled here

unpGS20     cpx   #$0101       ; Computer Vision
            bne   unpGS21
            ldy   #0
            brl   unpPIC
unpGS21     cpy   #$8000       ; Screen
            bne   unpGS22
            ldy   #0
            brl   unpPIC
unpGS22     cpy   #$9600       ; 3200
            bne   unpGS23
            ldy   #1
            brl   unpPIC
unpGS23     _errFORMAT

unpGS30     cpx   #$0004       ; PackBytes 3200
            bne   unpGS31
            ldy   #1
            brl   unpPACK
unpGS31     _errFORMAT

unpGS40     cpy   #$8000       ; 256/3200 Raw bin
            bne   unpGS41
            ldy   #0
            brl   unpPIC
unpGS41     cpy   #$9600
            bne   unpGS42
            ldy   #1
            brl   unpPIC

unpGS42     lda   ptrBUFFER    ; May be DYA/NRL/APP
            sta   dpBUF
            lda   ptrBUFFER+2
            sta   dpBUF+2

            ldy   #0
            lda   [dpBUF],y
            cmp   #"AP"        ; AP
            beq   unpGS43
            cmp   #"NR"        ; NR
            beq   unpGS43
            cmp   #"DY"        ; DY
            beq   unpGS43
            _errFORMAT

unpGS43     iny
            iny
            lda   [dpBUF],y
            and   #$00ff
            cmp   #"P"         ; P
            beq   unpGS44
            cmp   #"L"         ; L
            beq   unpGS45
            cmp   #"A"         ; A
            beq   unpGS46
            _errFORMAT

unpGS44     brl   unpAPP
unpGS45     brl   unpNRL
unpGS46     brl   unpDYA

