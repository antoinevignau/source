*-----------------
* APPLE FORMAT
*-----------------

             mx        %00

packAPF      lda       fgALL          ; CONVERT ALL
             beq       packAPF1
             lda       fgMODE
             cmp       #4
             bne       packAPF1
             brl       noneAPF

packAPF1     lda       menuSAVE1
             cmp       #5
             bne       packAPF3

             ldx       #$f8           ; PrintShop
             ldy       #$c323
             jsr       GSOScreate
             bcc       packAPF2
             rts
packAPF2     lda       ptrDATA3
             clc
             adc       #$4e20
             sta       proWRITE+4
             lda       ptrDATA3
             adc       #0
             sta       proWRITE+6
             ldx       #0
             ldy       #$06b4
             jsr       GSOSwrite
             rts

packAPF3     ldx       #$c0
             ldy       #$02
             jsr       GSOScreate
             bcc       packAPF4
             rts
packAPF4     lda       #320
             sta       pkAPF1
             lda       #1
             sta       pkAPF2

             lda       menuSAVE1
             cmp       #1
             bne       packAPF5

             lda       ptrPIC256      ; 3200 colors
             clc
             adc       #$8000
             sta       pdSOURCE
             lda       ptrPIC256+2
             adc       #0
             sta       pdSOURCE+2
             bra       packAPF10

packAPF5     cmp       #2
             bne       packAPF6

             lda       ptrPIC256      ; 256 colors
             sta       pdSOURCE
             lda       ptrPIC256+2
             sta       pdSOURCE+2
             lda       #16
             sta       pkAPF2
             bra       packAPF10

packAPF6     cmp       #3
             bne       packAPF7

             lda       ptrPIC16       ; 16 colors
             clc
             adc       #$8000
             sta       pdSOURCE
             lda       ptrPIC16+2
             adc       #0
             sta       pdSOURCE+2
             bra       packAPF10

packAPF7     lda       ptrPIC16       ; 16 greyscales
             sta       pdSOURCE
             lda       ptrPIC16+2
             sta       pdSOURCE+2

packAPF10    lda       pdSOURCE       ; SCBs
             clc
             adc       #$7d00
             sta       pdSCB
             lda       pdSOURCE+2
             adc       #0
             sta       pdSCB+2

             lda       pdSOURCE       ; Palette
             clc
             adc       #$7e00
             sta       pdPALETTE
             lda       pdSOURCE+2
             adc       #0
             sta       pdPALETTE+2

             lda       #pkAPFmain
             sta       proWRITE+4
             lda       #^pkAPFmain
             sta       proWRITE+6

             ldx       #0
             ldy       #15
             jsr       GSOSwrite
             bcc       packAPF11
             rts
packAPF11    lda       menuSAVE1      ; Si 3200, force une
             cmp       #1             ; palette en niveau de gris
             bne       packAPF12

             lda       ptrPIC16
             clc
             adc       #$7e00
             sta       pdPALETTE
             lda       ptrPIC16+2
             adc       #0
             sta       pdPALETTE+2

packAPF12    lda       pdPALETTE      ; Maintenant
             sta       proWRITE+4     ; ecris pkAPF2*32 octets
             lda       pdPALETTE+2    ; de palette
             sta       proWRITE+6

             lda       pkAPF2
             asl                      ; *2
             asl                      ; *4
             asl                      ; *8
             asl                      ; *16
             asl                      ; *32
             tay
             ldx       #0
             jsr       GSOSwrite
             bcc       packAPF13
             rts

packAPF13    lda       #200
             sta       pkAPFsize
             sta       pkAPF3

             lda       #pkAPFsize
             sta       proWRITE+4
             lda       #^pkAPFsize
             sta       proWRITE+6
             ldx       #0
             ldy       #2
             jsr       GSOSwrite
             bcc       packAPF14
             rts
packAPF14    jsr       GSOSgeteof     ; Get offset of dirEntry
             sty       pkAPFoffset
             stx       pkAPFoffset+2

             lda       ptrBUFFER      ; Recopie DirEntry
             sta       pdDEST
             sta       proWRITE+4
             lda       ptrBUFFER+2
             sta       pdDEST+2
             sta       proWRITE+6

             ldy       #0
             tya
]lp          sta       [pdDEST],y
             iny
             iny
             cpy       #200*4
             bne       ]lp

             ldy       #0
]lp          inc       pdDEST
             inc       pdDEST
             lda       [pdSCB],y
             and       #$ff
             sta       [pdDEST]
             inc       pdDEST
             inc       pdDEST
             iny
             cpy       #200
             bne       ]lp

             lda       ptrBUFFER
             sta       pdDEST
             lda       ptrBUFFER+2
             sta       pdDEST+2

             ldx       #0
             ldy       #200*4
             jsr       GSOSwrite
             bcc       packAPF15
             rts

packAPF15    stz       numLIGNE

             lda       #tempTABLE1
             sta       proWRITE+4
             lda       #^tempTABLE1
             sta       proWRITE+6

packAPF16    ldy       #0
]lp          lda       [pdSOURCE],y
             sta       tempTABLE,y
             iny
             iny
             cpy       #160
             bne       ]lp

             lda       #tempTABLE
             sta       pkAPFsource
             lda       #^tempTABLE
             sta       pkAPFsource+2
             lda       #160
             sta       pkAPFsize

             pha
             PushLong  #pkAPFsource
             PushLong  #pkAPFsize
             PushLong  #tempTABLE1
             PushWord  #1024
             _PackBytes
             pla
             sta       [pdDEST]
             tay
             ldx       #0
             jsr       GSOSwrite
             bcc       pkAPF17
             rts
pkAPF17      inc       pdDEST
             inc       pdDEST
             inc       pdDEST
             inc       pdDEST

             lda       pdSOURCE       ; Next Line
             clc
             adc       #160
             sta       pdSOURCE
             lda       pdSOURCE+2
             adc       #0
             sta       pdSOURCE+2

             inc       numLIGNE
             lda       numLIGNE
             cmp       #200
             bcs       packAPF18
             brl       packAPF16
             rts
packAPF18    ldx       pkAPFoffset+2  ; rewrite the
             ldy       pkAPFoffset    ; dirEntry
             jsr       GSOSappend

             lda       ptrBUFFER
             sta       proWRITE+4
             lda       ptrBUFFER+2
             sta       proWRITE+6

             ldx       #0
             ldy       #200*4
             jsr       GSOSwrite
             bcc       packAPF19
             rts
packAPF19    jsr       GSOSgeteof     ; Get EOF
             sty       pkAPFoffset    ; to write the
             stx       pkAPFoffset+2  ; size of the
                                      ; main chunk
             ldx       #0
             txy
             jsr       GSOSappend

             lda       #pkAPFoffset
             sta       proWRITE+4
             lda       #^pkAPFoffset
             sta       proWRITE+6
             ldx       #0
             ldy       #4
             jsr       GSOSwrite
             bcc       packAPF20
             rts

packAPF20    jsr       GSOSgeteof     ; Write note
             jsr       GSOSappend
             lda       #pkAPFnote
             sta       proWRITE+4
             lda       #^pkAPFnote
             sta       proWRITE+6
             ldx       #0
             ldy       #63
             jsr       GSOSwrite
             bcc       packAPF21
             rts

packAPF21    lda       menuSAVE1      ; Write Multipal
             cmp       #1
             beq       packAPF22
             clc
             rts
packAPF22    lda       #6415
             sta       pkAPFmulti
             stz       pkAPFmulti+2

             lda       #pkAPFmulti
             sta       proWRITE+4
             lda       #^pkAPFmulti
             sta       proWRITE+6
             ldx       #0
             ldy       #15
             jsr       GSOSwrite
             bcc       packAPF23
             rts
packAPF23    lda       ptrDATA3
             clc
             adc       #$c350
             sta       proWRITE+4
             lda       ptrDATA3+2
             adc       #0
             sta       proWRITE+6
             ldx       #0
             ldy       #6400
             jsr       GSOSwrite
             rts

*--- Mode de conversion NONE

noneAPF      lda       ptrBUFFER
             sta       proREAD+4
             sta       proWRITE+4
             lda       ptrBUFFER+2
             sta       proREAD+6
             sta       proWRITE+6

             lda       #0
             jsr       GSOSsetOPEN
             jsr       GSOSopen

             lda       #0
             jsr       GSOSsetSAVE
             ldx       proOPEN+14
             ldy       proOPEN+16
             jsr       GSOScreate
             bcs       noneAPF2

]lp          lda       #0
             jsr       GSOSsetOPEN
             ldx       #1
             ldy       #0
             jsr       GSOSread

             lda       #0
             jsr       GSOSsetSAVE
             ldx       proREAD+14
             ldy       proREAD+12
             jsr       GSOSwrite
             bcs       noneAPF2

             lda       proREAD+12
             beq       ]lp

noneAPF1     lda       proREAD+2
             sta       proCLOSE+2
             jsr       GSOSclose
             lda       proWRITE+2
             sta       proCLOSE+2
             jsr       GSOSclose
             clc
             rts
noneAPF2     jsr       noneAPF1
             sec
             rts

*--- Data

pkAPFoffset  ds        4

pkAPFsource  ds        4
pkAPFsize    ds        2

pkAPFmain    ds        4              ; Length
             str       'MAIN'         ; Kind
             ds        2              ; MasterWord (always $0000)
pkAPF1       ds        2              ; PixelsPerScanLine
pkAPF2       ds        2              ; NumColorTables

pkAPFmulti   ds        4              ; Length
             str       'MULTIPAL'     ; Kind
pkAPF3       ds        2              ; NumColorTables

pkAPFnote    adrl      63             ; Length
             str       'NOTE'         ; Kind
             strl      'This file created with Convert 3200 by Brutal Deluxe'

