*-----------------
* PACKBYTES
*-----------------

                mx        %00

unpPACK         sty       PACKtype        ; En entree, on a 320*200

                ldx       #$0001
                ldy       #$0000
                jsr       GSOSread

                lda       ptrBUFFER
                sta       PACKpackedHa
                lda       ptrBUFFER+2
                sta       PACKpackedHa+2

                lda       proOPEN+42
                sta       PACKpackedSize

                lda       ptrPIC16
                sta       PACKstartHa
                lda       ptrPIC16+2
                sta       PACKstartHa+2

                lda       #$8000          ; Image 256
                sta       PACKsizePtr

                lda       PACKtype
                beq       unpPACK2

                lda       #$9600          ; Image 3200
                sta       PACKsizePtr

unpPACK2        pha
                PushLong  PACKpackedHa
                PushWord  PACKpackedSize
                PushLong  #PACKstartHa
                PushLong  #PACKsizePtr
                _UnPackBytes
                pla

unpPACKent      lda       ptrPIC16
                sta       unpPACK90+1
                lda       ptrPIC16+1
                sta       unpPACK90+2

                lda       ptrPIC16
                sta       dpGS
                lda       ptrPIC16+2
                sta       dpGS+2

                lda       PACKtype        ; 0:16/256 sinon 3200
                beq       unpPACK10
                brl       unpPACK30

*--- Image 16/256 couleurs

unpPACK10       lda       ptrPIC16
                clc
                adc       #$7d00
                tay
                lda       ptrPIC16+2
                adc       #0
                tax
                jsr       compareSCB      ; Si ok, les SCB sont copies
                bcc       unpPACK11       ; en ptrSCB
                rts                       ; dpGS pointe sur les SCBs

unpPACK11       jsr       initPALETTE     ; Palettes 256 octets apres SCBs
                ldy       #$7e00
]lp             lda       [dpGS],y
                jsr       savePALETTE
                iny
                bpl       ]lp

                lda       temp
                and       #%1000_0000
                beq       unpPACK12

                lda       #640
                sta       picWIDTH

unpPACK12       jsr       makePIC
                bcc       unpPACK13
                rts
unpPACK13       jsr       unpPACKy1       ; Get first SCB

                ldx       #0
                txy

                lda       picWIDTH
                cmp       #640
                beq       unpPACK20

unpPACK15       jsr       unpPACK90
                pha
                and       #$f0
                lsr
                lsr
                lsr
                lsr
                ora       PACKscb
                sta       [dpPIC],y
                iny
                pla
                and       #$0f
                ora       PACKscb
                sta       [dpPIC],y
                iny
                cpy       picWIDTH
                bne       unpPACK15
                jsr       unpPACKy
                bcs       unpPACK15
                rts

unpPACK20       jsr       unpPACK90
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
                ora       PACKscb
                sta       [dpPIC],y
                iny
                pla
                and       #%0011_0000
                lsr
                lsr
                lsr
                lsr
                ora       PACKscb
                sta       [dpPIC],y
                iny
                pla
                and       #%0000_1100
                lsr
                lsr
                ora       PACKscb
                sta       [dpPIC],y
                iny
                pla
                and       #%0000_0011
                ora       PACKscb
                sta       [dpPIC],y
                iny
                cpy       picWIDTH
                bne       unpPACK20
                jsr       unpPACKy
                bcs       unpPACK20
                rts

*--- Mode 3200 couleurs

unpPACK30       lda       ptrPIC16
                clc
                adc       #$7d00
                tay
                lda       ptrPIC16+2
                adc       #0
                tax
                jsr       count3200       ; C'est rapide...
                bcc       unpPACK31
                rts
unpPACK31       jsr       makePIC
                bcc       unpPACK32
                rts

unpPACK32       ldx       #0
                txy

unpPACK35       jsr       unpPACK90
                pha
                and       #$f0
                lsr
                lsr
                lsr
                lsr
                jsr       unpPACK40
                sta       [dpPIC],y
                iny
                pla
                and       #$0f
                jsr       unpPACK40
                sta       [dpPIC],y
                iny
                cpy       picWIDTH
                bne       unpPACK35
                jsr       unpPACKy10
                bcs       unpPACK35
                rts

unpPACK40       phy
                asl
                tay
                lda       [dpGS],y
                asl
                tay
                lda       zoneTAMPON,y
                ply
                rts

*--- Next line 16/256

unpPACKy        jsr       showTHERMO
                inc       numLIGNE
                lda       numLIGNE
                cmp       picHEIGHT
                bcs       unpPACKy2
                asl
                clc
                adc       numLIGNE
                tay
                lda       [dpLIGNES],y
                sta       dpPIC
                iny
                lda       [dpLIGNES],y
                sta       dpPIC+1

unpPACKy1       lda       numLIGNE
                clc
                adc       #$7d00
                tay
                lda       [dpGS],y
                and       #%0000_1111
                asl
                asl
                asl
                asl
                sta       PACKscb
                ldy       #0
                sec
                rts
unpPACKy2       clc
                rts

*--- Next line 3200

unpPACKy10      jsr       showTHERMO
                inc       numLIGNE
                lda       numLIGNE
                cmp       picHEIGHT
                bcs       unpPACKy12
                asl
                clc
                adc       numLIGNE
                tay
                lda       [dpLIGNES],y
                sta       dpPIC
                iny
                lda       [dpLIGNES],y
                sta       dpPIC+1

unpPACKy11      lda       dpGS
                clc
                adc       #32
                sta       dpGS
                lda       dpGS+2
                adc       #0
                sta       dpGS+2
                ldy       #0
                sec
                rts
unpPACKy12      clc
                rts

*--- Lecture d'un octet

unpPACK90       ldal      $012000,x
                and       #$ff
                inx
                rts

*--- Data

PACKpackedHa    ds        4
PACKpackedSize  ds        2
PACKstartHa     ds        4
PACKsizePtr     ds        2
PACKtype        ds        2
PACKscb         ds        2

