*-----------------
* APPLE FORMAT
*-----------------

               mx        %00

unpAPF         lda       #1
               sta       APFfg

*--- Routine Multipal

               lda       #APFstrMULTI
               ldx       #8
               jsr       unpAPFchunk
               bcc       unpAPF2
               brl       unpAPF10

unpAPF2        ldx       #0              ; 32768 assez pour 768 lignes
               ldy       #$8000
               jsr       GSOSread

               ldy       #13
               lda       [dpBUF],y
               sta       picHEIGHT
               bne       unpAPF3
               _errSIZE
unpAPF3        asl
               asl
               asl
               asl
               asl
               sta       APFcnt

               lda       ptrBUFFER
               clc
               adc       #15
               sta       dpBUF
               lda       ptrBUFFER+2
               adc       #0
               sta       dpBUF+2

               ldy       #0              ; Recopie les palettes
]lp            lda       [dpBUF],y
               sta       [dpGS],y
               iny
               iny
               cpy       APFcnt
               bne       ]lp

               lda       ptrBUFFER
               sta       dpBUF
               lda       ptrBUFFER+2
               sta       dpBUF+2

               lda       #1
               sta       APFfg3200

               ldx       ptrPIC16+2
               ldy       ptrPIC16
               jsr       count3200
               bcc       unpAPF10
               _errCOLORS

*--- Routine Main

unpAPF10       lda       #APFstrMAIN
               ldx       #4
               jsr       unpAPFchunk
               bcc       unpAPF11
               _errFORMAT

unpAPF11       ldx       #1
               ldy       #0
               jsr       GSOSread

               ldy       #9
               lda       [dpBUF],y       ; MasterMode
               sta       APFfg640
               iny
               iny
               lda       [dpBUF],y       ; PixelsPerScanLine
               sta       picWIDTH
               bne       unpAPF12
               _errFORMAT
unpAPF12       cmp       #maxWIDTH
               bcc       unpAPF13
               beq       unpAPF13
               _errSIZE
unpAPF13       iny
               iny
               lda       [dpBUF],y       ; NumColorTables
               cmp       #16
               bcc       unpAPF14
               beq       unpAPF14
               _errFORMAT
unpAPF14       asl                       ; *2
               asl                       ; *4
               asl                       ; *8
               asl                       ; *16
               asl                       ; *32
               tax
               iny                       ; 15
               iny

               cpx       #0              ; Pas de color table
               beq       unpAPF16

               lda       APFfg3200       ; Si 3200, ne recopie rien
               beq       unpAPF15
               txa
               clc
               adc       #15             ; offset from beginning
               tay
               bra       unpAPF16

unpAPF15       lda       [dpBUF],y
               jsr       savePALETTE
               iny
               dex
               bne       unpAPF15

unpAPF16       lda       [dpBUF],y       ; Points to numscanlines
               sta       picHEIGHT
               bne       unpAPF17
               _errFORMAT
unpAPF17       iny
               iny
               sty       APFdest
               jsr       makePIC
               bcc       unpAPF18
               rts

unpAPF18       lda       ptrPIC16
               sta       dpGS
               clc
               adc       #$8000
               sta       dpGS2
               lda       ptrPIC16+2
               sta       dpGS+2
               adc       #0
               sta       dpGS2+2

               lda       picHEIGHT       ; Recopie ScanLineDirectory
               asl
               asl
               tax
               ldy       APFdest
]lp            lda       [dpBUF],y
               sta       [dpGS2]
               inc       dpGS2
               inc       dpGS2
               iny
               iny
               dex
               dex
               bne       ]lp

               lda       ptrPIC16
               clc
               adc       #$8000
               sta       dpGS2
               lda       ptrPIC16+2
               adc       #0
               sta       dpGS2+2

               sty       APFdest

               lda       ptrBUFFER
               sta       unpAPF90+1
               lda       ptrBUFFER+1
               sta       unpAPF90+2

               ldx       APFdest
               stx       APFx

*--- Decompresse une ligne

unpAPF20       lda       numLIGNE
               asl
               asl
               tay
               lda       [dpGS2],y
               sta       APFpackedSize
               sta       APFcnt
               iny
               iny
               lda       [dpGS2],y
               and       #%0000_1111
               jsr       saveSCB
               asl
               asl
               asl
               asl
               sta       APFscb

               ldx       APFx

               ldy       #0              ; Recopie
]lp            jsr       unpAPF90
               sta       tempTABLE,y
               iny
               dec       APFcnt
               bne       ]lp

               stx       APFx

               lda       #tempTABLE
               sta       APFpackedHa
               lda       #^tempTABLE
               sta       APFpackedHa+2

               lda       #tempTABLE1
               sta       APFstartHa
               lda       #^tempTABLE1
               sta       APFstartHa+2

               lda       #1536
               sta       APFsizePtr

               pha
               PushLong  APFpackedHa
               PushWord  APFpackedSize
               PushLong  #APFstartHa
               PushLong  #APFsizePtr
               _UnPackBytes
               pla
               bra       unpAPF30

unpAPF25       jsr       unpAPFy
               bcs       unpAPF27

               lda       APFfg3200
               bne       unpAPF26
               ldx       ptrSCB+2
               ldy       ptrSCB
               jsr       compareSCB      ; Si ok, les SCB sont copies
unpAPF26       clc
               rts

unpAPF27       brl       unpAPF20

*--- Decode maintenant les donnees

unpAPF30       ldx       #0
               txy

               lda       APFfg3200
               beq       unpAPF31
               brl       unpAPF35

unpAPF31       lda       APFfg640
               bne       unpAPF33

unpAPF32       lda       tempTABLE1,x
               pha
               and       #$f0
               lsr
               lsr
               lsr
               lsr
               ora       APFscb
               sta       [dpPIC],y
               iny
               pla
               and       #$0f
               ora       APFscb
               sta       [dpPIC],y
               inx
               iny
               cpy       picWIDTH
               bne       unpAPF32
               brl       unpAPF25

unpAPF33       lda       tempTABLE1,x
               pha
               pha
               pha
               and       #%1100_0000
               lsr
               lsr
               lsr
               lsr
               lsr
               lsr
               ora       APFscb
               sta       [dpPIC],y
               iny
               pla
               and       #%0011_0000
               lsr
               lsr
               lsr
               lsr
               ora       APFscb
               sta       [dpPIC],y
               iny
               pla
               and       #%0000_1100
               lsr
               lsr
               ora       APFscb
               sta       [dpPIC],y
               iny
               pla
               and       #%0000_0011
               ora       APFscb
               sta       [dpPIC],y
               inx
               iny
               cpy       picWIDTH
               bne       unpAPF33
               brl       unpAPF25

*--- Mode 3200 couleurs

unpAPF35       lda       tempTABLE1,x
               pha
               and       #$f0
               lsr
               lsr
               lsr
               lsr
               jsr       unpAPF40
               sta       [dpPIC],y
               iny
               pla
               and       #$0f
               jsr       unpAPF40
               sta       [dpPIC],y
               inx
               iny
               cpy       picWIDTH
               bne       unpAPF35
               brl       unpAPF25

unpAPF40       phy
               asl
               tay
               lda       [dpGS],y
               asl
               tay
               lda       zoneTAMPON,y
               ply
               rts

*--- Next line 16/256/3200

unpAPFy        jsr       showTHERMO
               inc       numLIGNE
               lda       numLIGNE
               cmp       picHEIGHT
               bcs       unpAPFy1
               asl
               clc
               adc       numLIGNE
               tay
               lda       [dpLIGNES],y
               sta       dpPIC
               iny
               lda       [dpLIGNES],y
               sta       dpPIC+1

               lda       dpGS
               clc
               adc       #32
               sta       dpGS
               lda       dpGS+2
               adc       #0
               sta       dpGS+2
               sec
               rts
unpAPFy1       clc
               rts

*--- Lecture d'un octet

unpAPF90       ldal      $012000,x
               and       #$ff
               sta       APFc
               inx
               bne       unpAPF91
               sty       APFdest
               ldx       #$0001
               ldy       #$0000
               jsr       GSOSread
               ldx       #0
               ldy       APFdest
               lda       APFc
unpAPF91       rts

*--- Routine to find a chunk

unpAPFchunk    sta       unpAPFchunk2+1
               stx       unpAPFchunk3+1

               stz       APFoffset
               stz       APFoffset+2

unpAPFchunk1   ldx       APFoffset+2
               ldy       APFoffset
               jsr       GSOSappend

               ldx       #0              ; 16 octets suffisent
               ldy       #16             ; pour MAIN & MULTIPAL
               jsr       GSOSread

               ldy       #0
               lda       [dpBUF],y
               clc
               adc       APFoffset
               sta       APFnext
               iny
               iny
               lda       [dpBUF],y
               adc       APFoffset+2
               sta       APFnext+2

               sep       #$20

               ldy       #5
               ldx       #0
]lp            lda       [dpBUF],y
unpAPFchunk2   cmp       $ffff,x
               bne       unpAPFchunk4
               iny
               inx
unpAPFchunk3   cpx       #$ffff
               bne       ]lp

               rep       #$20

               ldx       APFoffset+2
               ldy       APFoffset
               jsr       GSOSappend
               clc
               rts

unpAPFchunk4   rep       #$20

               lda       APFnext         ; next chunk
               sta       APFoffset
               lda       APFnext+2
               sta       APFoffset+2

               lda       APFoffset
               cmp       proOPEN+42      ; mod EOF
               bcs       unpAPFchunk5
               brl       unpAPFchunk1
unpAPFchunk5   lda       APFoffset+2
               cmp       proOPEN+44
               bcs       unpAPFchunk6
               brl       unpAPFchunk1
unpAPFchunk6   sec
               rts

*--- Data

APFpackedHa    ds        4
APFpackedSize  ds        2
APFstartHa     ds        4
APFsizePtr     ds        2

APFc           ds        2
APFcnt         ds        2
APFdest        ds        2
APFfg          ds        2
APFfg640       ds        2
APFfg3200      ds        2
APFscb         ds        2
APFx           ds        2
APFoffset      ds        4
APFnext        ds        4

APFstrMAIN     asc       'MAIN'
APFstrMULTI    asc       'MULTIPAL'

