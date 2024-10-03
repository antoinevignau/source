*
* I'm fEDD up ;-)
*
* (c) 2012, Brutal Deluxe Software
*

*---------------------------
*
* ptrPREFIX at $280 holds the path to the directory
* we shorten it until we have the /root directory
* then we call get file info
* then we calculate the free blocks
* then we display
* source: BASIC.SYSTEM (c) Apple

xFREEB        =     0
yFREEB        =     23

*---

showFREE      =     *

              lda   #' '           ; clear block count area
              sta   strFREE2
              sta   strFREE2+1
              sta   strFREE2+2
              sta   strFREE2+3
              sta   strFREE2+4

*--- get the root directory of the volume

              lda   ptrPREFIX      ; save it
              sta   ACCL

*--- calculate the length of the root dir only

              ldx   #2             ; start at 2 (the min length)
]lp           cpx   ACCL           ; is it the end?
              bcs   showFREE0

              lda   ptrPREFIX,x
              cmp   #'/'           ; or separator met?
              beq   showFREE0      ; yes, got the length
              inx
              bne   ]lp

showFREE0     stx   ptrPREFIX      ; length of root only

*---

              jsr   PRODOS
              dfb   $c4
              da    proGETVINFO

              lda   ACCL           ; restore the prefix length
              sta   ptrPREFIX

*--- nb blocks - blocks used

              lda   proGETVINFO+5
              sec
              sbc   proGETVINFO+8
              sta   ACCL
              sta   freeBLOCKS
              lda   proGETVINFO+6
              sbc   proGETVINFO+9
              sta   ACCM
              sta   freeBLOCKS+1   ; now, we have our free blocks

              lda   #0
              sta   ACCH
              ldy   #4             ; length of string
* divide by 10
showFREE1     ldx   #$18
              lda   #0
              sta   MOD0
* shift 24
showFREE2     asl   ACCL
              rol   ACCM
              rol   ACCH
* divide by 10 (next)
              rol   MOD0
              sec
              lda   MOD0
              sbc   #10
              bcc   showFREE3
              sta   MOD0
              inc   ACCL
showFREE3     dex
              bne   showFREE2
*
              lda   MOD0
              ora   #'0'
              sta   strFREE2,y
              dey
              lda   ACCL
              ora   ACCM
              ora   ACCH
              bne   showFREE1

              ldx   #xFREEB
              ldy   #yFREEB
              jsr   tabXY

              ldx   #>strFREE
              ldy   #<strFREE
              jsr   printCSTR

              ldx   #>strFREE2
              ldy   #<strFREE2
              jsr   printCSTR
              rts

*---

strFREE       asc   'FREE: '00
strFREE2      asc   '     '00      ; nb free blocks

ACCL          ds    1              ; save ptrPREFIX
ACCM          ds    1              ; save proGETINFO+1
ACCH          ds    1              ; save proGETINFO+2
MOD0          ds    1

*---------------------------
* CHECK FREE BLOCKS FOR 5.25" (DSK)
*---------------------------

checkDSK525   =     *

              lda   ENDTRK         ; ENDTRK*2 = ENDTRK/4 * 8
              clc
              adc   #4             ; we add 4 for fileinfo
              asl
              sta   myBLOCKS
              lda   #1             ; always 1
              sta   myBLOCKS+1
              bne   calcVOLFREE    ; never 0

*---------------------------
* CHECK FREE BLOCKS FOR 5.25" (EDD & FRIENDS)
*---------------------------

checkVOL525   =     *

              lda   #$0e           ; one NIB tracks is $E blocks
              sta   myBLOCKS
              sta   tempBLOCKS
              lda   #0
              sta   myBLOCKS+1

              lda   fgWRITENIT     ; skip nit?
              beq   checkVOL526

              asl   tempBLOCKS     ; twice the size if NIT

checkVOL526   lda   DCCSLOT        ; have an EDD card?
              beq   checkVOL527

              lda   #$20           ; add $20 for 1 EDD track
              clc                  ; high byte is still 0
              adc   tempBLOCKS
              sta   tempBLOCKS

checkVOL527   ldx   STEP           ; get the step
              lda   ENDTRK         ; use the end phase as a multiplier
              cpx   #1             ; multiplier is $88 (if $22 tracks)
              beq   checkVOL528
              lsr                  ; multiplier is $44 (ditto)
              cpx   #2
              beq   checkVOL528
              lsr                  ; multiplier is $22 (ditto)

checkVOL528   tay                  ; our new multiplier
]lp           lda   myBLOCKS       ; and perform the addition
              clc
              adc   tempBLOCKS
              sta   myBLOCKS
              lda   myBLOCKS+1
              adc   #0
              sta   myBLOCKS+1
              dey                  ; Y times
              bne   ]lp            ; see if bpl wouldn't be better for error

*---------------------------
* CALCULATE THE FREE SPACE
*---------------------------

calcVOLFREE   =     *

              lda   fgOVERWRITE    ; leave a chance to the user
              bne   calcVOLCLC     ; we can overwrite

calcVOLFREE2  =     *              ; alternate entry if overwrite authorized

              lda   myBLOCKS+1     ; we compare high byte
              cmp   freeBLOCKS+1
              bcc   calcVOLEND     ; our size < free size, good
              beq   calcVOLLOW     ; our size = free size, maybe
              rts                  ; our size > free size, bad
calcVOLLOW    lda   myBLOCKS
              cmp   freeBLOCKS
              bcc   calcVOLEND     ; our size < free size, good
              sec                  ; equal or >, bad
calcVOLEND    rts
calcVOLCLC    clc
              rts

*---------------------------
* CHECK FREE BLOCKS FOR 3.5"
*---------------------------

checkVOL35    =     *

              lda   #$8c           ; 2700 blocks
              sta   myBLOCKS
              lda   #$0a
              sta   myBLOCKS+1

              lda   fgWRITENIT     ; skip nit
              beq   calcVOLFREE

              asl   myBLOCKS
              lsr   myBLOCKS+1
              bne   calcVOLFREE    ; never 0

*----------

freeBLOCKS    ds    2              ; our free blocks
myBLOCKS      ds    2              ; destination file size in blocks
tempBLOCKS    ds    1              ; temp for EDD/NIB/NIT

*---------------------------

createP8      jsr   doFILEP8

              jsr   PRODOS
              dfb   $c0
              da    proCREATE
              bcc   createP9

              lda   fgOVERWRITE    ; we cannot overwrite
              beq   createP9

              jsr   PRODOS
              dfb   $c4
              da    proGETINFO

              lda   proGETINFO+4
              sta   proSETINFO+4
              lda   proGETINFO+5
              sta   proSETINFO+5
              lda   proGETINFO+6
              sta   proSETINFO+6

              jsr   PRODOS
              dfb   $c3
              da    proSETINFO

              jsr   PRODOS
              dfb   $c1
              da    proDESTROY

              jsr   PRODOS
              dfb   $c0
              da    proCREATE

createP9      rts

*----------

* 0123456789ABCDEF
* 6NIBBLE
* .NIB
* ANIBBLE.NIB

doFILEP8      ldx   #16-1
]lp           lda   fileNAME,x
              and   #antiMASK
              sta   fileP8,x
              dex
              bpl   ]lp

              ldx   fileNAME
              ldy   #0
]lp           lda   (dpFROM),y
              beq   doFILEP9
              sta   fileP8+1,x
              inx
              iny
              cpy   #4
              bne   ]lp
doFILEP9      stx   fileP8
              rts

*----------

saveP8        jsr   doFILEP8

              jsr   PRODOS
              dfb   $c8
              da    proOPEN
              bcs   savePE

              lda   proOPEN+5
              sta   proGETEOF+1
              sta   proSETMARK+1
              sta   proWRITE+1
              sta   proCLOSE+1

              jsr   PRODOS
              dfb   $d1
              da    proGETEOF
              bcs   saveP9

              lda   proGETEOF+2
              sta   proSETMARK+2
              lda   proGETEOF+3
              sta   proSETMARK+3
              lda   proGETEOF+4
              sta   proSETMARK+4

              jsr   PRODOS
              dfb   $ce
              da    proSETMARK
              bcs   saveP9

              jsr   PRODOS
              dfb   $cb
              da    proWRITE

saveP9        php
              jsr   PRODOS
              dfb   $cc
              da    proCLOSE
              plp

savePE        rts

*---------------------------

proQUIT       dfb   $04
              ds    1              ; +01
              ds    2              ; +02
              ds    1              ; +04
              ds    2              ; +05

proDESTROY    dfb   $01
              da    fileP8         ; +01

proCREATE     dfb   $07
              da    fileP8         ; +01
              dfb   $e3            ; +03
              dfb   $06            ; +04
              ds    2              ; +05
              dfb   $01            ; +07
              ds    2              ; +08
              ds    2              ; +0A

proSETINFO    dfb   $07
              da    fileP8         ; +01
              dfb   $e3            ; +03
              dfb   $06            ; +04
              ds    2              ; +05
              ds    1              ; +07
              ds    2              ; +08
              ds    2              ; +0A
              ds    2              ; +0C
              ds    2              ; +0E

proGETINFO    dfb   $0a
              da    fileP8         ; +01
              ds    1              ; +03
              ds    1              ; +04
              ds    2              ; +05
              ds    1              ; +07
              ds    2              ; +08
              ds    2              ; +0A
              ds    2              ; +0C
              ds    2              ; +0E
              ds    2              ; +10

proGETVINFO   dfb   $0a
              da    ptrPREFIX      ; +01
              ds    1              ; +03
              ds    1              ; +04
              ds    2              ; +05 - blocks
              ds    1              ; +07
              ds    2              ; +08 - used blocks
              ds    2              ; +0A
              ds    2              ; +0C
              ds    2              ; +0E
              ds    2              ; +10

proSETPFX     dfb   $01
              da    ptrPREFIX      ; +01

proOPEN       dfb   $03
              da    fileP8         ; +01
              da    ptrBUFFER      ; +03
              ds    1              ; +05

proWRITE      dfb   $04
              ds    1              ; +01
              ds    2              ; +02
              ds    2              ; +04
              ds    2              ; +06

proCLOSE      dfb   $01
              ds    1              ; +01

proSETMARK    dfb   $02
              ds    1              ; +01
              ds    3              ; +02

proGETEOF     dfb   $02
              ds    1              ; +01
              ds    3              ; +02

* ds \

