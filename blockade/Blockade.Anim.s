*
* Blockade: Anim
*

         mx    %00
         xc
         xc

*--------------------------------------
* Animation

animIT   stz   temp       ; Chargement

         lda   #$6038
         sta   loadPATCH

]lp      lda   temp
         asl
         tax
         asl
         tay
         lda   animWHICH,x
         xba
         sta   pANIM+23

         lda   ptrSCR,y
         sta   animPTR
         lda   ptrSCR+2,y
         sta   animPTR+2

         jsr   animTHERMO

         lda   #pANIM
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         bcc   animIT1
         brl   animIT12

animIT1  ldx   animPTR+2
         ldy   animPTR
         jsr   unPACK

         lda   temp
         bne   animIT2

         ldx   ptrSCR+2
         ldy   ptrSCR
         lda   #-1
         jsr   fadeIN

animIT2  inc   temp
         lda   temp
         cmp   #17
         bne   ]lp

*--- Load sprite picture

         lda   animPTR
         clc
         adc   #$8000
         sta   animSPR
         lda   animPTR+2
         adc   #0
         sta   animSPR+2

         lda   #pSPRIT
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         bcc   animIT3
         brl   animIT12

animIT3  ldx   animSPR+2
         ldy   animSPR
         jsr   unPACK

*--------------------------------------

         lda   #0         ; Animation
animIT4  tax
         phx
         lda   ptrSCR,x
         sta   Debut
         lda   ptrSCR+2,x
         sta   Debut+2

         ldy   #0
]lp      tyx
         lda   [Debut],y
         stal  $e12000,x
         iny
         iny
         bpl   ]lp

         jsr   nextVBL
         jsr   nextVBL

         pla
         clc
         adc   #4
         cmp   #4*16
         bne   animIT4

*--------------------------------------

         ldx   #15*4
         lda   ptrSCR,x
         sta   animMINE
         lda   ptrSCR+2,x
         sta   animMINE+2

         lda   animMINE
         clc
         adc   #$3875
         sta   Arrivee
         lda   animMINE+2
         adc   #0
         sta   Arrivee+2

         lda   animSPR
         clc
         adc   #$3e0d
         sta   Debut
         lda   animSPR+2
         adc   #0
         sta   Debut+2

         ldx   #40
animIT5  ldy   #30
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

         lda   Debut
         clc
         adc   #160
         sta   Debut

         lda   Arrivee
         clc
         adc   #160
         sta   Arrivee

         dex
         bpl   animIT5

*-------------------------------------- Animation lettres

         lda   animSPR
         clc
         adc   ptrB
         sta   ptrB
         lda   animSPR+2
         adc   #0
         sta   ptrB+2

         lda   animSPR
         clc
         adc   ptrD
         sta   ptrD
         lda   animSPR+2
         adc   #0
         sta   ptrD+2

*---

         stz   temp

animIT6  ldx   ptrB+2
         ldy   ptrB
         lda   #0
         jsr   animPRINT

         ldx   ptrD+2
         ldy   ptrD
         lda   #1
         jsr   animPRINT

         jsr   nextVBL
         jsr   nextVBL

         inc   temp
         lda   temp
         cmp   #10
         bne   animIT6

*-------------------------------------- Animation derniere image

         ldx   #16*4
         lda   ptrSCR,x
         sta   Debut
         sta   Second
         lda   ptrSCR+2,x
         sta   Debut+2
         sta   Second+2

         lda   #$2000
         sta   Arrivee
         sta   Third
         lda   #$00e1
         sta   Arrivee+2
         sta   Third+2

         ldy   #$7e00     ; palettes
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         bpl   ]lp

*--------------------------------------

         ldx   #0

animIT11 ldy   #160-2
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

         txa
         clc
         adc   #$7d00
         tay
         sep   #$20
         lda   [Second],y
         sta   [Third],y
         rep   #$20

         lda   Debut
         clc
         adc   #160
         sta   Debut

         lda   Arrivee
         clc
         adc   #160
         sta   Arrivee

         inx
         cpx   #200
         bne   animIT11

*--------------------------------------

animIT12 lda   #$eaea
         sta   loadPATCH

         rts

*--------------------------------------

animTHERMO lda temp
         asl
         tax
         lda   #$ffff
         stal  $e12cbe,x
         stal  $e12d5e,x
         stal  $e12dfe,x
         stal  $e12e9e,x
         stal  $e12f3e,x
         stal  $e12fde,x
         stal  $e1307e,x
         rts

*-------------------------------------- Routine animation

animPRINT sty  Debut
         stx   Debut+2

         asl
         tax
         lda   nbX,x
         sta   maxX
         lda   nbY,x
         sta   maxY

         lda   temp
         asl
         tay

         cpx   #0
         bne   animPRINT1

         lda   animB,y
         bra   animPRINT2
animPRINT1 lda animD,y

animPRINT2 sec
         sbc   #$0320

         pha
         clc
         adc   #$2000
         sta   Arrivee
         lda   #$00e1
         sta   Arrivee+2

         pla
         clc
         adc   animMINE
         sta   Second
         lda   animMINE+2
         adc   #0
         sta   Second+2

animPRINT3 sep #$20

         ldy   #0
]lp      lda   [Debut],y  ; data
         tax
         lda   [Second],y
         and   tblMASK,x  ; MASK
         ora   tblVALUE,x ; pour couleur
         sta   [Arrivee],y
         iny
         cpy   maxX
         bne   ]lp

         rep   #$20

         lda   Debut
         clc
         adc   #160
         sta   Debut

         lda   Second
         clc
         adc   #160
         sta   Second

         lda   Arrivee
         clc
         adc   #160
         sta   Arrivee

         dec   maxY
         lda   maxY
         bpl   animPRINT3

         rts

*--------------------------------------

animWHICH dw   $3031,$3032,$3033,$3034,$3035,$3036,$3037,$3038
         dw    $3039,$3130,$3131,$3132,$3133,$3134,$3135,$3136
         dw    $3137

pANIM    strl  '1/Blockade.Data/Anim.01'

animPTR  ds    4

decBUF   ds    4
decPIC   ds    4
decSIZ   ds    2

ptrB     adrl  $3de1
ptrD     adrl  $3dfa

animSPR  ds    4
animLAST ds    4
animMINE ds    4

animB    dw    $3d70,$3f4b,$41c6,$43a1,$457c
         dw    $4757,$49d2,$4bad,$4d88,$4f62

animD    dw    $3d85,$4006,$41e7,$43c8,$45a9
         dw    $478a,$496b,$4b4c,$4dcd,$504e

maxX     ds    2
maxY     ds    2

nbX      dw    23,18
nbY      dw    39,38

tblVALUE hex   000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
         hex   202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f
         hex   404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f
         hex   606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f
         hex   808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9f
         hex   a0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebf
         hex   c0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf
         hex   e0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff

tblMASK  hex   fff0f0f0f0f0f0f0f0f0f0f0f0f0f0f00f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
