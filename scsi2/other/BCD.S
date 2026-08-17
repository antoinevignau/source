*
* Playing with BCD
*
* (c) 2018, Brutal Deluxe Software
*

            xc
            xc
            mx    %00
            org   $1000
            lst   off

*---

            clc
            xce
            rep   #$30

            lda   #$1000
            jsr   BCD2HEX

            lda   #$9999
            jsr   BCD2HEX

            lda   #$270f
            jsr   HEX2BCD

            sec
            xce
            sep   #$30
            rts

*---

            mx    %00

BCD2HEX     pha

* milliers

            and   #$f000
            lsr
            lsr
            lsr
            xba
            tax
            lda   tblBM,x
            sta   result

* centaines

            lda   1,s
            and   #$0f00
            asl
            xba
            tax
            lda   tblBC,x
            clc
            adc   result
            sta   result

* dizaines

            lda   1,s
            and   #$00f0
            lsr
            lsr
            lsr
            tax
            lda   tblBD,x
            clc
            adc   result
            sta   result

* unites

            lda   1,s
            and   #$000f
            asl
            tax
            lda   tblBU,x
            clc
            adc   result
            sta   result

            plx
            jmp   printME

*--- BCD 2 HEX table

tblBM       dw    0000,1000,2000,3000,4000,5000,6000,7000,8000,9000
tblBC       dw    0000,0100,0200,0300,0400,0500,0600,0700,0800,0900
tblBD       dw    0000,0010,0020,0030,0040,0050,0060,0070,0080,0090
tblBU       dw    0000,0001,0002,0003,0004,0005,0006,0007,0008,0009

*---

HEX2BCD     pha

* Step 1

            and   #$f000
            lsr
            lsr
            lsr
            xba
            tax
            lda   tblH1,x
            sta   result

* Step 2

            lda   1,s
            and   #$0f00
            asl
            xba
            tax
            sed
            lda   tblH2,x
            clc
            adc   result
            sta   result
            cld

* Step 3

            lda   1,s
            and   #$00f0
            lsr
            lsr
            lsr
            tax
            sed
            lda   tblH3,x
            clc
            adc   result
            sta   result
            cld

* Step 4

            lda   1,s
            and   #$000f
            asl
            tax
            sed
            lda   tblH4,x
            clc
            adc   result
            sta   result
            cld

exit        plx
            jmp   printME

*--- HEX 2 BCD table

tblH1       dw    $0000,$4096,$8192
tblH2       dw    $0000,$0256,$0512,$0768,$1024,$1280,$1536,$1792
            dw    $2048,$2304,$2560,$2816,$3072,$3328,$3584,$3840
tblH3       dw    $0000,$0016,$0032,$0048,$0064,$0080,$0096,$0112
            dw    $0128,$0144,$0160,$0176,$0192,$0208,$0224,$0240
tblH4       dw    $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
            dw    $0008,$0009,$0010,$0011,$0012,$0013,$0014,$0015


*---

printME     sta   result

            sec
            xce
            sep   #$30

            lda   result+1
            jsr   $fdda
            lda   result
            jsr   $fdda

            lda   #$8d
            jsr   $fded

            clc
            xce
            rep   #$30
            rts

*---

result      ds    2

