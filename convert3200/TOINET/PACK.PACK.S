*-----------------
* CONVERT 4->8
*-----------------

pdSOURCE     =     $80
pdDEST       =     $84
pdSCB        =     $88
pdPALETTE    =     $8c

*--- CONVERSION 4 BITS 16-256

changeRES    sty   pdSOURCE        ; Depart
             stx   pdSOURCE+2
             tya
             clc
             adc   #$7d00
             sta   pdSCB
             stx   pdSCB+2
             tya
             clc
             adc   #$7e00
             sta   pdPALETTE
             stx   pdPALETTE+2

             lda   ptrBUFFER
             sta   pdDEST
             lda   ptrBUFFER+2
             sta   pdDEST+2

             ldy   #0              ; Clear buffer
             tya
]lp          sta   [pdDEST],y
             iny
             iny
             bne   ]lp

             stz   numLIGNE

*--- On convertit maintenant une image 4 bits en 8 bits

             jsr   changeRES6      ; Get first SCB

]lp          lda   [pdSOURCE]
             pha
             and   #$f0
             lsr
             lsr
             lsr
             lsr
             ora   changeSCB
             sta   [pdDEST],y
             iny
             pla
             and   #$0f
             ora   changeSCB
             sta   [pdDEST],y
             inc   pdSOURCE
             iny
             cpy   #320
             bne   ]lp
             jsr   changeRES5
             bcs   ]lp
             brl   changeRES40

changeRES5   inc   numLIGNE
             lda   numLIGNE
             cmp   #200
             bcs   changeRES7

             lda   pdDEST
             clc
             adc   #320
             sta   pdDEST

changeRES6   ldy   numLIGNE
             lda   [pdSCB],y
             and   #%0000_1111
             asl
             asl
             asl
             asl
             sta   changeSCB
             ldy   #0
             sec
             rts
changeRES7   clc
             rts

*--- CONVERSION 4 BITS 3200

changeRES10  lda   ptrPIC256
             clc
             adc   #$8000
             sta   pdSOURCE
             lda   ptrPIC256+2
             adc   #0
             sta   pdSOURCE+2

             lda   ptrDATA3
             clc
             adc   #$c350
             sta   pdPALETTE
             lda   ptrDATA3+2
             adc   #0
             sta   pdPALETTE+2

             lda   ptrBUFFER
             sta   pdDEST
             lda   ptrBUFFER+2
             sta   pdDEST+2

             ldy   #0              ; Clear buffer
             tya
]lp          sta   [pdDEST],y
             iny
             iny
             bne   ]lp

             jsr   changeRES30

             stz   numLIGNE

             ldy   #0

*--- Mode 3200 couleurs

]lp          lda   [pdSOURCE]
             pha
             and   #$f0
             lsr
             lsr
             lsr
             lsr
             jsr   changeRES15
             sta   [pdDEST],y
             iny
             pla
             and   #$0f
             jsr   changeRES15
             sta   [pdDEST],y
             inc   pdSOURCE
             iny
             cpy   #320
             bne   ]lp
             jsr   changeRES20
             bcs   ]lp
             rts

changeRES15  phy
             asl
             tay
             lda   [pdPALETTE],y
             asl
             tay
             lda   zoneTAMPON,y
             ply
             rts

changeRES20  inc   numLIGNE
             lda   numLIGNE
             cmp   #200
             bcs   changeRES21

             lda   pdDEST
             clc
             adc   #320
             sta   pdDEST

             lda   pdPALETTE
             clc
             adc   #32
             sta   pdPALETTE
             ldy   #0
             sec
             rts
changeRES21  lda   #pcPALETTE
             sta   pdPALETTE
             lda   #^pcPALETTE
             sta   pdPALETTE+2
             brl   changeRES40

*--- Re-ecriture des palettes

changeRES30  ldx   #0              ; clear buffer
]lp          stz   zoneTAMPON,x
             inx
             inx
             cpx   #4096*2
             bne   ]lp

             ldx   #0              ; clear palette
]lp          stz   pcPALETTE,x
             inx
             inx
             cpx   #256*3
             bne   ]lp

             ldy   #0              ; read each component
]lp          lda   [pdPALETTE],y
             asl
             tax
             inc   zoneTAMPON,x
             iny
             iny
             cpy   #6400
             bne   ]lp

             ldx   #0              ; re-ecriture avec les indices
             txy
]lp          lda   zoneTAMPON,x
             beq   changeRES31
             txa
             lsr
             sta   pcPALETTE,y
             tya
             lsr
             sta   zoneTAMPON,x
             iny
             iny
changeRES31  inx
             inx
             cpx   #4096*2
             bne   ]lp
             rts

*--- Modifie la palette de l'image source

changeRES40  ldy   #0
             tyx

]lp          lda   [pdPALETTE],y
             and   #$0f00          ; R
             xba
             asl
             asl
             asl
             asl
             sta   pcPALETTE1,x

             lda   [pdPALETTE],y   ; V
             and   #$f0
             sta   pcPALETTE1+1,x

             lda   [pdPALETTE],y   ; B
             and   #$0f
             asl
             asl
             asl
             asl
             sta   pcPALETTE1+2,x
             inx
             inx
             inx
             iny
             iny
             cpy   #256*2
             bne   ]lp
             clc
             rts

*--- Data

changeSCB    ds    2

