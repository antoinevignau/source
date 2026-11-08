*-----------------
* PCX
*-----------------

PCX_ID       =     0              ; byte
PCX_VER      =     1              ; byte
PCX_ENC      =     2              ; byte
PCX_BPP      =     3              ; byte
PCX_XMIN     =     4              ; word
PCX_YMIN     =     6              ; word
PCX_XMAX     =     8              ; word
PCX_YMAX     =     10             ; word
PCX_PALETTE  =     16             ; palette
PCX_PLANES   =     65             ; byte
PCX_BPR      =     66             ; word

*---

unpPCX       lda   ptrBUFFER
             sta   dpBUF
             lda   ptrBUFFER+2
             sta   dpBUF+2

             ldy   #PCX_ID        ; Identifier
             lda   [dpBUF],y
             and   #$0f
             cmp   #$0a
             beq   unpPCX1
             _errFORMAT
unpPCX1      ldy   #PCX_VER       ; Version
             lda   [dpBUF],y
             and   #$0f
             sta   PCXversion
             cmp   #$05
             bcc   unpPCX2
             beq   unpPCX2
             _errFORMAT
unpPCX2      ldy   #PCX_XMIN      ; Width
             lda   [dpBUF],y
             pha
             ldy   #PCX_XMAX
             lda   [dpBUF],y
             sec
             sbc   1,s
             bne   unpPCX2A
             pla
             _errSIZE
unpPCX2A     inc
             sta   picWIDTH
             pla

             ldy   #PCX_YMIN      ; Height
             lda   [dpBUF],y
             pha
             ldy   #PCX_YMAX
             lda   [dpBUF],y
             sec
             sbc   1,s
             bne   unpPCX2B
             pla
             _errSIZE
unpPCX2B     inc
             sta   picHEIGHT
             pla

             lda   picWIDTH       ; Teste la taille
             cmp   #maxWIDTH
             bcc   unpPCX3
             beq   unpPCX3
             _errSIZE
unpPCX3      lda   picHEIGHT
             cmp   #maxHEIGHT
             bcc   unpPCX4
             beq   unpPCX4
             _errSIZE
unpPCX4      ldy   #PCX_PLANES    ; Number of colors
             lda   [dpBUF],y
             and   #$0f
             sta   picPLANES

             ldx   #256
             stx   picCOLORS

             ldy   #PCX_BPP
             lda   [dpBUF],y
             sta   picBITS
             cmp   #8
             beq   unpPCX5

             ldx   #16
             stx   picCOLORS

unpPCX5      clc
             adc   picPLANES
             asl
             tax
             lda   PCXaddress,x
             sta   unpPCX9+1

             ldy   #PCX_ENC
             lda   [dpBUF],y
             and   #$0f
             sta   picCOMPRESS
             cmp   #$01
             beq   unpPCX6
             _errCOMPRESS
unpPCX6      lda   picBITS
             clc
             adc   picPLANES
             cmp   #$0b           ; 3+8
             bne   unpPCX7
             _errFORMAT
unpPCX7      ldy   #PCX_BPR
             lda   [dpBUF],y
             sta   PCXbperlin

             jsr   initPALETTE    ; Recopie la palette
                                  ; tout simplement
             ldx   #0
             ldy   #PCX_PALETTE
]lp          lda   [dpBUF],y
             jsr   savePALETTE
             iny
             lda   [dpBUF],y
             jsr   savePALETTE
             iny
             lda   [dpBUF],y
             jsr   savePALETTE
             iny
             inx
             cpx   #16
             bne   ]lp

             jsr   makePIC
             bcc   unpPCX8
             rts

unpPCX8      ldx   #$0000
             ldy   #$0080
             jsr   GSOSappend

             ldx   #$0001
             ldy   #$0000
             jsr   GSOSread

             lda   ptrBUFFER
             sta   unpPCX90+1
             lda   ptrBUFFER+1
             sta   unpPCX90+2

             ldx   #0
             txy

unpPCX9      jsr   $ffff
             brl   unpPCXpal

unpPCXnot    _errFORMAT

*--- Mode 1 bits/pixel, 1 plane

unpPCX10     jsr   unpPCX90
             cmp   #$c0
             bcc   unpPCX11
             and   #$3f
             sta   PCXcnt
             jsr   unpPCX90
             bra   unpPCX12

unpPCX11     lda   #1
             sta   PCXcnt

unpPCX12     phy
             lda   #$80
             sta   PCXmask
             ldy   #0
]lp          lda   PCXb
             and   PCXmask
             beq   unpPCX13
             lda   #1
             sta   [dpPIC],y
unpPCX13     lsr   PCXmask
             iny
             cpy   #8
             bne   ]lp

             tya
             clc
             adc   dpPIC
             sta   dpPIC

             ply
             iny
             cpy   PCXbperlin
             bcs   unpPCX14
             dec   PCXcnt
             bne   unpPCX12
             bra   unpPCX10

unpPCX14     jsr   showTHERMO

             inc   numLIGNE
             lda   numLIGNE
             cmp   picHEIGHT
             bcs   unpPCX15
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
             brl   unpPCX10
unpPCX15     clc
             rts

*--- Mode 2 bits/pixel, 1 plane

unpPCX20     jsr   unpPCX90
             cmp   #$c0
             bcc   unpPCX21
             and   #$3f
             sta   PCXcnt
             jsr   unpPCX90
             bra   unpPCX22

unpPCX21     lda   #1
             sta   PCXcnt

unpPCX22     phy

             ldy   #0
             lda   PCXb
             and   #%1100_0000
             lsr
             lsr
             lsr
             lsr
             lsr
             lsr
             sta   [dpPIC],y
             iny
             lda   PCXb
             and   #%0011_0000
             lsr
             lsr
             lsr
             lsr
             sta   [dpPIC],y
             iny
             lda   PCXb
             and   #%0000_1100
             lsr
             lsr
             sta   [dpPIC],y
             iny
             lda   PCXb
             and   #%0000_0011
             sta   [dpPIC],y
             iny
             tya
             clc
             adc   dpPIC
             sta   dpPIC
             ply
             iny
             cpy   PCXbperlin
             bcs   unpPCX23
             dec   PCXcnt
             bne   unpPCX22
             bra   unpPCX20

unpPCX23     jsr   showTHERMO

             inc   numLIGNE
             lda   numLIGNE
             cmp   picHEIGHT
             bcs   unpPCX24
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
             brl   unpPCX20
unpPCX24     clc
             rts

*--- Mode 1 bits/pixel, 3 plane

unpPCX30     lda   #1
             sta   PCXpmask
             stz   PCXplane

             lda   [dpLIGNES]
             sta   dpPIC
             sta   PCXoldimage
             iny
             lda   [dpLIGNES],y
             sta   dpPIC+1
             sta   PCXoldimage+1

             ldx   #0
             txy

unpPCX31     jsr   unpPCX90
             cmp   #$c0
             bcc   unpPCX32
             and   #$3f
             sta   PCXcnt
             jsr   unpPCX90
             bra   unpPCX33

unpPCX32     lda   #1
             sta   PCXcnt

unpPCX33     phy
             lda   #$80
             sta   PCXmask
             ldy   #0
]lp          lda   PCXb
             and   PCXmask
             beq   unpPCX34
             lda   [dpPIC],y
             ora   PCXpmask
             sta   [dpPIC],y
unpPCX34     lsr   PCXmask
             iny
             cpy   #8
             bne   ]lp

             tya
             clc
             adc   dpPIC
             sta   dpPIC

             ply
             iny
             cpy   PCXbperlin
             bcs   unpPCX36
unpPCX35     dec   PCXcnt
             bne   unpPCX33
             bra   unpPCX31

unpPCX36     inc   PCXplane
             lda   PCXplane
             cmp   #3
             bcs   unpPCX37

             lda   PCXoldimage    ; same row, next plane
             sta   dpPIC
             lda   PCXoldimage+1
             sta   dpPIC+1

             lda   PCXplane
             asl
             sta   PCXpmask
             ldy   #0
             brl   unpPCX35

unpPCX37     stz   PCXplane       ; next row, same plane
             lda   #1
             sta   PCXpmask

             jsr   showTHERMO

             inc   numLIGNE
             lda   numLIGNE
             cmp   picHEIGHT
             bcs   unpPCX38
             asl
             clc
             adc   numLIGNE
             tay
             lda   [dpLIGNES],y
             sta   dpPIC
             sta   PCXoldimage
             iny
             lda   [dpLIGNES],y
             sta   dpPIC+1
             sta   PCXoldimage+1
             ldy   #0
             brl   unpPCX35
unpPCX38     clc
             rts

*--- Mode 1 bits/pixel, 4 plane

unpPCX40     lda   #1
             sta   PCXpmask
             lda   #0
             sta   PCXplane

             lda   [dpLIGNES]
             sta   dpPIC
             sta   PCXoldimage
             iny
             lda   [dpLIGNES],y
             sta   dpPIC+1
             sta   PCXoldimage+1

             ldx   #0
             txy

unpPCX41     jsr   unpPCX90
             cmp   #$c0
             bcc   unpPCX42
             and   #$3f
             sta   PCXcnt
             jsr   unpPCX90
             bra   unpPCX43

unpPCX42     lda   #1
             sta   PCXcnt

unpPCX43     phy
             lda   #$80
             sta   PCXmask
             ldy   #0
]lp          lda   PCXb
             and   PCXmask
             beq   unpPCX44
             lda   [dpPIC],y
             ora   PCXpmask
             sta   [dpPIC],y
unpPCX44     lsr   PCXmask
             iny
             cpy   #8
             bne   ]lp

             tya
             clc
             adc   dpPIC
             sta   dpPIC

             ply
             iny
             cpy   PCXbperlin
             bcs   unpPCX46
unpPCX45     dec   PCXcnt
             bne   unpPCX43
             bra   unpPCX41

unpPCX46     inc   PCXplane
             lda   PCXplane
             cmp   #4
             bcs   unpPCX47

             lda   PCXoldimage    ; same row, next plane
             sta   dpPIC
             lda   PCXoldimage+1
             sta   dpPIC+1

             lda   PCXplane
             asl
             sta   PCXpmask
             ldy   #0
             brl   unpPCX45

unpPCX47     lda   #1             ; next row, same plane
             sta   PCXpmask
             stz   PCXplane

             jsr   showTHERMO

             inc   numLIGNE
             lda   numLIGNE
             cmp   picHEIGHT
             bcs   unpPCX48
             asl
             clc
             adc   numLIGNE
             tay
             lda   [dpLIGNES],y
             sta   dpPIC
             sta   PCXoldimage
             iny
             lda   [dpLIGNES],y
             sta   dpPIC+1
             sta   PCXoldimage+1
             ldy   #0
             brl   unpPCX45
unpPCX48     clc
             rts

*--- Mode 8 bits/pixel, 1 plane

unpPCX80     jsr   unpPCX90
             cmp   #$c0
             bcc   unpPCX81

             and   #$3f
             sta   PCXcnt
             jsr   unpPCX90
]lp          sta   [dpPIC],y
             iny
             cpy   PCXbperlin
             bcs   unpPCX82
             dec   PCXcnt
             bne   ]lp
             bra   unpPCX80

unpPCX81     sta   [dpPIC],y
             iny
             cpy   PCXbperlin
             bne   unpPCX80

unpPCX82     jsr   showTHERMO

             inc   numLIGNE
             lda   numLIGNE
             cmp   picHEIGHT
             bcs   unpPCX83
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
             bra   unpPCX80
unpPCX83     clc
             rts

*--- Lecture d'un octet

unpPCX90     ldal  $012000,x
             and   #$ff
             sta   PCXb
             inx
             bne   unpPCX91
             sty   PCXdest
             ldx   #$0001
             ldy   #$0000
             jsr   GSOSread
             ldx   #0
             ldy   PCXdest
             lda   PCXb
unpPCX91     rts

*--- Palette

unpPCXpal    lda   PCXversion
             cmp   #5
             beq   unpPCXpal1
             clc
             rts
unpPCXpal1   lda   proOPEN+42
             sec
             sbc   #769
             tay
             lda   proOPEN+44
             sbc   #0
             tax
             jsr   GSOSappend

             ldx   #$0000
             ldy   #$0301
             jsr   GSOSread

             ldy   #0
             lda   [dpBUF],y
             and   #$ff
             beq   unpPCXpal2
             cmp   #$0c
             bne   unpPCXpal3

unpPCXpal2   jsr   initPALETTE

             ldy   #1
]lp          lda   [dpBUF],y
             jsr   savePALETTE
             iny
             lda   [dpBUF],y
             jsr   savePALETTE
             iny
             lda   [dpBUF],y
             jsr   savePALETTE
             iny
             cpy   proREAD+12
             bne   ]lp

unpPCXpal3   clc
             rts

*--- Data PCX

PCXaddress   da    unpPCXnot,unpPCXnot
             da    unpPCX10,unpPCX20
             da    unpPCX30,unpPCX40
             da    unpPCXnot,unpPCXnot
             da    unpPCXnot,unpPCX80

PCXbperlin   ds    2
PCXb         ds    2
PCXcnt       ds    2
PCXmask      ds    2
PCXplane     ds    2
PCXpmask     ds    2
PCXoldimage  ds    4
PCXversion   ds    2
PCXdest      ds    2

