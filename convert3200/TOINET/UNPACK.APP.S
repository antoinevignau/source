*-----------------
* APP & NRL
*-----------------

               mx        %00

unpAPP         ldx       #$0001
               ldy       #$0000
               jsr       GSOSread

               lda       ptrBUFFER
               clc
               adc       #4
               sta       dpBUF
               lda       ptrBUFFER+2
               adc       #0
               sta       dpBUF+2

               lda       ptrPIC16
               clc
               adc       #$7d00
               sta       dpGS
               lda       ptrPIC16+2
               adc       #0
               sta       dpGS+2

               ldy       #0
]lp            lda       [dpBUF],y
               sta       [dpGS],y
               iny
               iny
               cpy       #$1900
               bne       ]lp

               lda       ptrBUFFER
               clc
               adc       #$1904
               sta       APPpackedHa
               lda       ptrBUFFER+2
               adc       #0
               sta       APPpackedHa+2

               lda       proOPEN+42
               sec
               sbc       #$1904
               sta       APPpackedSize

               lda       ptrPIC16
               sta       APPstartHa
               lda       ptrPIC16+2
               sta       APPstartHa+2

               lda       #$7d00         ; Image 3200
               sta       APPsizePtr

               pha
               PushLong  APPpackedHa
               PushWord  APPpackedSize
               PushLong  #APPstartHa
               PushLong  #APPsizePtr
               _UnPackBytes
               pla

               lda       #1
               sta       PACKtype
               brl       unpPACKent

*--- Data

APPpackedHa    ds        4
APPpackedSize  ds        2
APPstartHa     ds        4
APPsizePtr     ds        2

*-----------------
* NRL
*-----------------

               mx        %00

unpNRL         ldx       #$0001
               ldy       #$0000
               jsr       GSOSread

               lda       ptrBUFFER
               clc
               adc       #4
               sta       dpBUF
               lda       ptrBUFFER+2
               adc       #0
               sta       dpBUF+2

               lda       ptrPIC16
               clc
               adc       #$7d00
               sta       dpPIC
               lda       ptrPIC16+2
               adc       #0
               sta       dpPIC+2

               ldy       #0
]lp            lda       [dpBUF],y
               sta       [dpPIC],y
               iny
               iny
               cpy       #$1900
               bne       ]lp

               lda       ptrBUFFER
               clc
               adc       #$1904
               sta       dpBUF
               lda       ptrBUFFER+2
               adc       #0
               sta       dpBUF+2

               lda       ptrPIC16
               sta       dpPIC
               lda       ptrPIC16+2
               sta       dpPIC+2

               stz       NRLflag1
               stz       NRLflag2

               lda       #$7d00         ; length
               sta       NRLlength
               stz       NRLlength+2
               jsr       L133E
               clc
               xce
               rep       #$30
               lda       #1
               sta       PACKtype
               brl       unpPACKent

L133E          tsc
               sta       NRLstack
               sep       #$30

L1344          jsr       L137A
               cmp       #$08
               bcc       L135C
               tay
               ldx       NRLtable,Y
               jsr       L137A
L1352          pha
               jsr       L139C
               pla
               dex
               bpl       L1352
               bra       L1344
L135C          tax
L135D          jsr       L137A
               jsr       L139C
               dex
               bpl       L135D
               bra       L1344

L137A          lda       NRLflag2
               eor       #$01
               sta       NRLflag2
               bne       L1393
               lda       [dpBUF]
               and       #$0F
               rep       #$20
               inc       dpBUF
               sep       #$20
               rts

L1393          lda       [dpBUF]
               and       #$F0
               lsr
               lsr
               lsr
               lsr
               rts

L139C          pha
               lda       NRLflag1
               eor       #$01
               sta       NRLflag1
               bne       L13CA
               pla
               ora       [dpPIC]
               sta       [dpPIC]

               rep       #$20
               inc       dpPIC
               lda       NRLlength
               bne       L13BA
               dec       NRLlength+2
L13BA          dec       NRLlength
               lda       NRLlength
               ora       NRLlength+2
               beq       L13C5
               sep       #$20
               rts

               mx        %00

L13C5          lda       NRLstack
               tcs
               rts

L13CA          pla
               asl
               asl
               asl
               asl
               sta       [dpPIC]
               rts

*--- Data NRL

NRLtable       hex       00000000000000000807060504030201
NRLstack       ds        2
NRLflag1       ds        2
NRLflag2       ds        2
NRLlength      ds        4

