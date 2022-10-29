*--------------------------*
*                          *
* Tinies: Construction Kit *
*                          *
*      Brutal  Deluxe      *
*                          *
*  Version: 1.0 du 2/2/95  *
*--------------------------*

         lst   off
         rel
         dsk   TCK.l

         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Misc.Macs
         use   4/Util.Macs

         mx    %00
         xc
         xc

*--- Parametres Page Zero

Debut    =     $00
Arrivee  =     $04
Second   =     $08
Third    =     $0c

proDOS   =     $e100a8

*-------------------------- Initialisations d'entree

         phk
         plb
         bra   pp

*$
         asc   0d
         asc   "We cannot promise you anything..."0d
         asc   "But Future may be wonderful :->"0d
         asc   "Keep your IIgs..."0d

pp       _TLStartUp
         pha
         _MMStartUp
         pla
         sta   myID
         _MTStartUp

         ldal  $e0c060
         bpl   noPATCH
         lda   #$eaea
         sta   PATCH

noPATCH  sep   #$20

         ldal  $e0c022
         sta   save1
         ldal  $e0c029
         sta   save2
         ldal  $e0c034
         sta   save3
         ldal  $e0c035
         sta   save4

         lda   #$f0
         stal  $e0c022
         lda   #$00
         stal  $e0c034

         rep   #$20

*--- Affichage texte

         PushWord #0
         PushWord #$29
         _ReadBParam
         pla
         and   #$ff
         cmp   #$02
         bne   noFUCK

         lda   #1
         sta   fgLANG

*--- Ah! GsBug

noFUCK   sei

         phd
         ldal  $e1004b
         pha
         ldal  $e10049
         sec
         sbc   #$82
         pha
         tsc
         tcd
         ldy   #0
]lp      lda   [$01],y
         cmp   #$78f0
         beq   bugFOUND1
         iny
         iny
         iny
         cpy   #12
         bne   ]lp
         bra   bugFOUND2

*$
         asc   0d"Hello Atreid!"0d
         asc   "If you mix The Furies with new intro graphs..."0d
         asc   "Then you get... Pac In Time!"0d

bugFOUND1 sta  bugA
         stx   bugY
         lda   #$7880
         sta   [$01],y

         lda   #1
         sta   bugFG

bugFOUND2 pla
         pla
         pld

         PushWord #0
         PushWord #0
         PushWord #0
         PushWord #0
         PushWord #0
         PushWord #0
         PushWord #0
         PushWord #$fe1f
         _FWEntry
         pla
         cmp   #1
         beq   bugFOUND3
         lda   #$cf28
         sta   theDESK2+1

bugFOUND3 pla
         pla
         pla

         PushLong #0
         PushWord #$12
         _GetVector
         PullLong saveDESK

         PushWord #$12
         PushLong #theDESK
         _SetVector

         cli

*--- Compact memory

         PushLong #0
         PushLong #$8fffff
         PushWord myID
         PushWord #%11000000_00000000
         PushLong #0
         _NewHandle
         _DisposeHandle
         _CompactMem

         PushLong #0      ; 448ko au total
         _FreeMem
         pla
         pla
         cmp   #7         ; 7*64ko
         bcs   okINIT2
         sec
         jmp   memERR

*$
         asc   0d"Hi Gog! Have U ever seen SuperFamicom code?"0d

okINIT2  PushLong #0
         PushLong #$8000
         PushWord myID
         PushWord #%11000000_00000011
         PushLong #$012000
         _NewHandle
         pla
         pla
         bcc   okINIT3
         sec
         jmp   memERR

okINIT3  PushLong #0
         PushLong #$10000
         PushWord myID
         PushWord #%11000000_00011100
         PushLong #0
         _NewHandle
         ldx   temp
         phd
         tsc
         tcd
         ldy   #0
         lda   [3],y
         sta   ptrTCK1,x
         ldy   #2
         lda   [3],y
         sta   ptrTCK1+2,x
         pld
         pla
         pla
         jsr   memERR
         inx
         inx
         inx
         inx
         stx   temp
         cpx   #4*7
         bne   okINIT3

*---

         PushLong #0
         PushLong #$10000
         PushWord myID
         PushWord #%11000000_00011100
         PushLong #0
         _NewHandle
         phd
         tsc
         tcd
         ldy   #0
         lda   [3],y
         sta   ptrUNPACK
         ldy   #2
         lda   [3],y
         sta   ptrUNPACK+2
         pld
         pla
         pla
         jsr   memERR

*---

         lda   #1
         jsr   setSHADOW

         ldx   #$7ffe
         lda   #0
]lp      stal  $012000,x
         dex
         dex
         bpl   ]lp

         sep   #$20
         lda   #$c1
         stal  $e0c029
         rep   #$20

*-------------------------- Met les pointeurs

         lda   ptrTCK1
         clc
         adc   #$8000
         sta   ptrTCK2
         lda   ptrTCK1+2
         sta   ptrTCK2+2

         lda   ptrNIV
         clc
         adc   #$8000
         sta   ptrBACK
         lda   ptrNIV+2
         sta   ptrBACK+2

         lda   ptrDOC
         clc
         adc   #$8000
         sta   ptrABOUT
         lda   ptrDOC+2
         sta   ptrABOUT+2

         lda   ptrBOUGE
         clc
         adc   #$8000
         sta   ptrFONTE
         lda   ptrBOUGE+2
         sta   ptrFONTE+2

         lda   ptrGADGET2
         clc
         adc   #$8000
         sta   ptrGADGET3
         lda   ptrGADGET2+2
         sta   ptrGADGET3+2

         lda   ptrTINY1
         clc
         adc   #$8000
         sta   ptrTINY2
         lda   ptrTINY1+2
         sta   ptrTINY2+2

*---------------------------

         jsr   doTCK
         jsr   loadNIV

         lda   #pLOGO
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okINIT4
         jmp   initOFF
okINIT4  lda   ptrTCK1+1
         jsr   unPACK

         lda   ptrTCK1+1
         jsr   do3200

*---

         lda   #pTCK1
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrTCK1+1
         jsr   unPACK

         lda   #pTCK2
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrTCK2+1
         jsr   unPACK

         lda   #pTINY1
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrTINY1+1
         jsr   unPACK

         lda   #pTINY2
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrTINY2+1
         jsr   unPACK

         lda   #pFONTE
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrFONTE+1
         jsr   unPACK

*---

         put   TCK.Main
         put   TCK.Docu

*--------------------------
* Fin du programme
*--------------------------

initOFF  lda   #0
         jsr   setSHADOW

         ldx   #$7ffe
         lda   #0
]lp      stal  $012000,x
         dex
         dex
         bpl   ]lp

initOFF1 sep   #$20

         lda   save4
         stal  $e0c035
         lda   save3
         stal  $e0c034
         lda   save2
         stal  $e0c029
         lda   save1
         stal  $e0c022

         rep   #$20

*--- Ah GsBug

         lda   bugFG
         beq   initOFF2

         sei

         phd
         ldal  $e1004b
         pha
         ldal  $e10049
         sec
         sbc   #$82
         pha
         tsc
         tcd
         ldy   bugY
         lda   bugA
         sta   [$01],y
         pla
         pla
         pld

         PushWord #$12
         PushLong saveDESK
         _SetVector

         cli

*---

initOFF2 _MTShutDown

         PushWord myID
         _DisposeAll
         PushWord myID
         _MMShutDown
         _TLShutDown

         ldal  $e0c061
         bpl   noQUIT

         jsl   proDOS
         dw    $2029
         adrl  proQUIT2

noQUIT   jsl   proDOS
         dw    $2029
         adrl  proQUIT

*$
         asc   0d"Hey Joe... Take a walk on the wild side..."0d
         asc   "If Tinies could have been released"0d
         asc   "It has nothing to do with Gog"0d

*--------------------------
* Code principal
*--------------------------

doTCK    lda   #pDOC
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrDOC+1
         jsr   unPACK

         lda   #pABOUT
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrABOUT+1
         jsr   unPACK

*-------------------------------------- Fichiers a charger pour le test

         lda   #pBOUGE
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrBOUGE+1
         jsr   unPACK

         lda   #pGADGET2
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrGADGET2+1
         jsr   unPACK

         lda   #pGADGET3
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrGADGET3+1
         jsr   unPACK

         lda   #pTAB
         ldx   ptrTAB+1
         jsr   loadFILE

         rts

*-------------------------- Charge l'image NIV en fonction du NIVEAU

loadNIV  ldx   level
         lda   lvlINTRO,x
         and   #$00ff
         sta   temp

         lda   temp
         and   #$00f0
         asl
         asl
         asl
         asl
         ora   #$3000
         pha
         lda   temp
         and   #$000f
         ora   #$0030
         sta   temp
         pla
         ora   temp
         xba
         sta   temp

         lda   temp
         cmp   pNIV+19
         beq   loadNIV1
         sta   pNIV+19

         lda   #pNIV
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrNIV+1
         jsr   unPACK

loadNIV1 rts

*-------------------------- Met le temps

doTIME   lda   ptrTAB
         clc
         adc   #$5300
         sta   Debut
         lda   ptrTAB+2
         sta   Debut+2

         lda   level
         asl
         tay
         lda   [Debut],y
         pha
         and   #$00ff
         sta   minutes

         pla
         and   #$ff00
         xba
         sta   secondes
         rts

putTIME  lda   ptrTAB
         clc
         adc   #$5300
         sta   Debut
         lda   ptrTAB+2
         sta   Debut+2

         lda   level
         asl
         tay

         lda   secondes
         xba
         ora   minutes
         sta   [Debut],y
         rts

*$
         asc   0d"Hello Christer Ericsson"0d
         asc   "Thank you for the free distribution of Blockade GS..."0d

*--------------------------
* Routines gs/os
*--------------------------

loadFILE sta   proOPEN+4
         stx   proREAD+5

loadFILE1 jsl  proDOS
         dw    $2010
         adrl  proOPEN
         bcs   loadERR

         lda   proOPEN+2
         sta   proGETEOF+2
         sta   proREAD+2

         jsl   proDOS
         dw    $2019
         adrl  proGETEOF

         lda   proGETEOF+4
         sta   proREAD+8
         lda   proGETEOF+6
         sta   proREAD+10

         jsl   proDOS
         dw    $2012
         adrl  proREAD
         bcs   loadERR

loadFILE2 jsl  proDOS
         dw    $2014
         adrl  proCLOSE
         clc
         rts

loadERR  jsr   loadFILE2

         PushWord #0
         PushLong #proSTR1
         PushLong #proSTR2
         PushLong #proSTR3
         PushLong #proSTR4
         _TLTextMountVolume
         pla
         cmp   #1
         bne   loadERR1
         brl   loadFILE1
loadERR1 jmp   initOFF1

*$
         asc   0d"Hello Christer!"0d
         asc   "Do Ya Feel It?"0d

*-------------------------- Save file

saveFILE lda   ptrTAB
         sta   proWRITE+4
         lda   ptrTAB+2
         sta   proWRITE+6
         lda   #$53d0
         sta   proWRITE+8

         lda   #pTAB
         sta   proOPEN+4
         lda   #^pTAB
         sta   proOPEN+6

saveFILE1 jsl  proDOS
         dw    $2005
         adrl  proINFO
         bcs   saveERR

         jsl   proDOS
         dw    $2002
         adrl  proDESTROY

         jsl   proDOS
         dw    $2001
         adrl  proCREATE

         jsl   proDOS
         dw    $2010
         adrl  proOPEN
         bcs   saveERR

         lda   proOPEN+2
         sta   proWRITE+2
         sta   proCLOSE+2

         jsl   proDOS
         dw    $2013
         adrl  proWRITE
         bcs   saveERR

saveFILE2 jsl  proDOS
         dw    $2014
         adrl  proCLOSE

         clc
         rts

saveERR  jsr   saveFILE2

         PushWord #0
         PushLong #proSTR11
         PushLong #proSTR2
         PushLong #proSTR31
         PushLong #proSTR41
         _TLTextMountVolume
         pla
         cmp   #1
         bne   saveERR1
         brl   saveFILE1

saveERR1 sec
         rts

*--------------------------
* Routines diverses
*--------------------------

memERR   bcs   memERR1    ; Erreur de memoire
         rts
memERR1  PushWord #0
         PushLong #memSTR1
         PushLong #memSTR2
         PushLong #proSTR3
         PushLong #proSTR4
         _TLTextMountVolume
         pla
         jmp   initOFF1

*--------------------------

setSHADOW sep  #$20       ; A=0, shadow off
                          ; A=1, shadow on
         eor   #1
         asl
         asl
         asl
         pha
         ldal  $e0c035
         and   #%11110111
         ora   1,s
         stal  $e0c035
         pla
         rep   #$20
         rts

*$
         asc   0d"A SecondSight Graphic Card? Never"0d
         asc   "A TurboRez Graphic Card? Forever"0d

*------------------------------

nextVBL  lda   #150
         jsr   waitSPOT
         jsr   waitVBL
         rts

waitSPOT lsr
         sta   waitSPOT2+1
waitSPOT1 ldal $e0c02e
         and   #$7f
waitSPOT2 cmp  #150
         blt   waitSPOT1
         cmp   #100
         bge   waitSPOT1
         rts

waitVBL  ldal  $e0c019
         and   #$80
         beq   waitVBL
         rts

*-------------------------- Decompression

unPACK   tax              ; Decompresse

         phd
         tdc
         clc
         adc   #$100
         tcd

         stz   $04
         stz   $06
         stx   $05

         lda   ptrUNPACK
         sta   $00
         lda   ptrUNPACK+2
         sta   $02

         lda   ptrUNPACK
         clc
         adc   #$8000
         sta   $1e
         clc
         adc   #$2000
         sta   $22
         lda   ptrUNPACK+2
         sta   $20
         sta   $24

         ldy   #$3fff
         lda   #0
]lp      sta   [$1e],y
         dey
         dey
         bpl   ]lp

         lda   #$0009
         sta   L0517+1
         lda   #$01FF
         sta   L051E+1
         stz   $1C
         pea   $FFFF

L042C    jsr   L04E8
         cmp   #$0101
         bne   L042D
         brl   L04A4

L042D    cmp   #$0100
         beq   L0491
         sta   $12
         cmp   $14
         bcc   L0443
         lda   $10
         pei   $0E
L0443    cmp   #$0100
         bcc   L0455
         asl
L0449    tay
         lda   [$22],Y
         pha
         lda   [$1E],Y
         cmp   #$0200
         bcs   L0449
         lsr
L0455    and   #$00FF
         sta   $0E
         sta   $1A
         ldy   #$0000
L045F    sta   [$04],Y
         iny
         pla
         bpl   L045F
         pha
         tya
         clc
         adc   $04
         sta   $04

         lda   $06
         adc   #0
         sta   $06

         jsr   L04D8
         lda   $12
         sta   $10
         lda   $14
         cmp   $18
         bcc   L048F
         lda   L0517+1
         cmp   #$000C
         beq   L048F
         inc
         sta   L0517+1
         asl
         tax
         lda   packMASK-$12,X
         sta   L051E+1
         asl   $18
L048F    bra   L042C
L0491    jsr   L04C1
         jsr   L04E8
         sta   $10
         sta   $1A
         sta   $0E
         sta   [$04]

         lda   $04
         clc
         adc   #1
         sta   $04
         lda   $06
         adc   #0
         sta   $06

         jmp   L042C

L04A4    pla
         pld
         phk
         plb
         rts

L04C1    lda   #$0009
         sta   L0517+1
         lda   #$01FF
         sta   L051E+1
         lda   #$0200
         sta   $18
         lda   #$0102
         sta   $14
         rts

L04D8    lda   $14
         asl
         tay
         lda   $1A
         sta   [$22],Y
         lda   $10
         asl
         sta   [$1E],Y
         inc   $14
         rts

L04E8    lda   $1C
         and   #$0007
         tax
         lda   $1C
         lsr
         lsr
         lsr
         cmp   #$03FD
         bcc   L0502
         clc
         adc   $00
         sta   $00
         stx   $1C
         lda   #$0000
L0502    tay
         lda   [$00],Y
         sta   $08
         iny
         iny
         lda   [$00],Y
         txy
         beq   L0514
L050E    lsr
L050F    ror   $08
         dex
         bne   L050E
L0514    lda   $1C
         clc
L0517    adc   #$FFFF     ; $0009 on beginning
         sta   $1C
         lda   $08
L051E    and   #$FFFF     ; $01FF on beginning
         rts

*$
         asc   0d
         asc   "-Olivier, Gimme Salt"0d
         asc   "-Antoine, Gimme Pepper"0d
         asc   "-Give us Salt and Pepper"0d
         asc   "Let us talk about sex baby"0d
         asc   "Let us talk about U and Me"0d
         asc   "No, we are not homosexuals"0d

*------------------------------

nowWAIT  dec              ; Attend A secondes
         tax
         lda   #0
]lp      clc
         adc   #60
         cpx   #0
         beq   nowWAIT1
         dex
         bra   ]lp
nowWAIT1 pha
         jsr   waitVBL
]lp      ldal  $e0c019
         and   #$80
         bne   ]lp
         pla
         dec
         bne   nowWAIT1
         sec
         rts

*--------------------------
* Routines graphiques
*--------------------------

*--- Routine 3200 couleurs

do3200   stz   Debut
         stz   Debut+2
         sta   Debut+1

         sep   #$20
         lda   #$1e
         stal  $e0c035
         rep   #$20

         ldx   #$7ffe
         lda   #0
]lp      stal  $012000,x
         stal  $e12000,x
         dex
         dex
         bpl   ]lp

         ldy   #$7d00
         ldx   #0
]lp      lda   [Debut],y
         stal  $012000,x
         iny
         iny
         inx
         inx
         cpx   #$1900
         bne   ]lp

         sep   #$20
         ldx   #$00
do32001  lda   #$0f
]lp      stal  $019d00,x
         stal  $e19d00,x
         inx
         cpx   #$c8
         beq   do32002
         dec
         bpl   ]lp
         bra   do32001

do32002  lda   #0
         stal  $e0c035

         rep   #$20

         ldy   #$7cfe
]lp      tyx
         lda   [Debut],y
         stal  $e12000,x
         dey
         dey
         bpl   ]lp

         phd
         tsc
         sta   mySTACK

         sei

*--- Main routine 3200

         ldal  $e0c068
         ora   #$30
         stal  $e0c068

do32003  ldy   #0
         lda   #$1f00
         tcd

do32004  ldal  $e0c02e
         and   #$ff
         cmp   affTBL,y
         bne   do32004

         iny
         iny

         lda   #$9fff
         tcs
         tdc
         clc
         adc   #$0100
         tcd

]affPOS1 =     $00
         lup   $80
         pei   ]affPOS1
]affPOS1 =     ]affPOS1+2
         --^

         tdc
         clc
         adc   #$0100
         tcd

]affPOS1 =     $00
         lup   $80
         pei   ]affPOS1
]affPOS1 =     ]affPOS1+2
         --^

         cpy   #$1a
         beq   do32005
         brl   do32004

do32005  ldal  $e0bfff
         bmi   do32007
         ldal  $e0c026
         bpl   do32006
         and   #%00000010_00000000
         bne   do32006
         ldal  $e0c023
         ldal  $e0c023
         and   #%10000000_00000000
         beq   do32007
         brl   do32003
do32006  ldal  $e0c026
         brl   do32003

do32007  stal  $e0c010
         ldal  $e0c068
         and   #$cf
         stal  $e0c068

         cli

         lda   mySTACK
         tcs
         pld
         phk
         plb

         ldx   #$7ffe
         lda   #0
]lp      stal  $012000,x
         dex
         dex
         bpl   ]lp

         rts

*$
         asc   0d
         asc   "Our only drug is the IIgs"0d
         asc   "Aaahhh llaaaaa laaaaaa"0d

*--- Fade sur les palettes

fadeIN   sta   fadeIN1+2
         clc
         adc   #$007e
         sta   fadeIN5+2
         sta   fadeIN7+2
         sta   fadeIN9+2
         cpy   #-1
         beq   fadeIN2

         ldx   #$7dfe
fadeIN1  ldal  $062000,x
         stal  $012000,x
         dex
         dex
         bpl   fadeIN1

fadeIN2  ldy   #$000f
fadeIN3  ldx   #$01fe
fadeIN4  ldal  $019e00,x
         and   #$000f
         sta   temp
fadeIN5  ldal  $069e00,x
         and   #$000f
         cmp   temp
         beq   fadeIN6
         ldal  $019e00,x
         clc
         adc   #$0001
         stal  $019e00,x
fadeIN6  ldal  $019e00,x
         and   #$00f0
         sta   temp
fadeIN7  ldal  $069e00,x
         and   #$00f0
         cmp   temp
         beq   fadeIN8
         ldal  $019e00,x
         clc
         adc   #$0010
         stal  $019e00,x
fadeIN8  ldal  $019e00,x
         and   #$0f00
         sta   temp
fadeIN9  ldal  $069e00,x
         and   #$0f00
         cmp   temp
         beq   fadeIN10
         ldal  $019e00,x
         clc
         adc   #$0100
         stal  $019e00,x

fadeIN10 dex
         dex
         bpl   fadeIN4
         jsr   nextVBL
         dey
         bpl   fadeIN3
         rts

*---

fadeOUT  ldy   #$000f
fadeOUT1 ldx   #$01fe
fadeOUT2 ldal  $019e00,x
         and   #$000f
         beq   fadeOUT3
         ldal  $019e00,x
         sec
         sbc   #$0001
         stal  $019e00,x
fadeOUT3 ldal  $019e00,x
         and   #$00f0
         beq   fadeOUT4
         ldal  $019e00,x
         sec
         sbc   #$0010
         stal  $019e00,x
fadeOUT4 ldal  $019e00,x
         and   #$0f00
         beq   fadeOUT5
         ldal  $019e00,x
         sec
         sbc   #$0100
         stal  $019e00,x

fadeOUT5 dex
         dex
         bpl   fadeOUT2
         jsr   nextVBL
         dey
         bpl   fadeOUT1

         ldx   #$7ffe
         lda   #$0000
]lp      stal  $012000,x
         dex
         dex
         bpl   ]lp
         rts

*--------------------------
* Routine control panel
*--------------------------

         mx    %11

theDESK  jmp   theDESK1
         jmp   theDESK1
         jmp   theDESK1

theDESK1 sep   #$30
         lda   $c025

         phb
         php
         phk
         plb

         clc
         xce
         rep   #$30

         lda   fgBUG
         sta   oldBUG
         stz   fgBUG

         sep   #$30

theDESK2 jsl   $feadb9

         phk
         plb

         clc
         xce
         sep   #$30

         ldal  $e0c034
         and   #$f0
         stal  $e0c034

         rep   #$30

         lda   oldBUG
         sta   fgBUG

         sep   #$30
         plp
         plb
         clc
         rtl

         mx    %00

*--------------------------
* All the datas
*--------------------------

         hex   8d8d
         asc   "---- Tinies Construction Kit -----",8d
         asc   "        Version Apple //gs        ",8d
         asc   "  Antoine Vignau Olivier Zardini  ",8d
         asc   "          Brutal  Deluxe          ",8d
         asc   "------------ 9 2 1995 ------------",8d,8d

*--- Flags

save1    ds    1
save2    ds    1
save3    ds    1
save4    ds    1

fgLANG   ds    2          ; 1=fr

bugA     ds    2
bugY     ds    2
bugFG    ds    2
saveDESK ds    4

*--- Textes

memSTR1  str   'Can'27't allocate (screen) memory'
memSTR2  str   'Press a key to quit.'

proSTR1  str   'Can'27't load file'
proSTR11 str   'Can'27't save file'
proSTR2  str   'Do what now ?'
proSTR3  str   '[RET] Continue'
proSTR31 str   '[RET] Retry'
proSTR4  str   '[ESC] Quit'
proSTR41 str   '[ESC] Cancel'

*--- Prodos

proQUIT  dw    2
         ds    4
         ds    2

proQUIT2 dw    2
         adrl  pGAME
         ds    2

proOPEN  dw    2
         ds    2
         adrl  pTCK1

proGETEOF dw   2
         ds    2
         ds    4

proREAD  dw    4
         ds    2
         ds    4
         ds    4
         ds    4

proCLOSE dw    1
         ds    2

proCREATE dw   7
         adrl  pTAB       ; Pathname
         dw    $e3        ; AccessCode
         dw    6          ; FileType
         ds    4          ; AuxType
         dw    2          ; Type d'enregistrement
         adrl  $53d0      ; Data segment
         ds    4          ; Resource segment

proDESTROY dw  1
         adrl  pTAB       ; Pathname

proINFO  dw    4
         adrl  pTAB       ; Pathname
         dw    $e3        ; AccessCode
         dw    6          ; FileType
         ds    4          ; AuxType

proWRITE dw    5
         ds    2          ; Id
         ds    4          ; Where
         adrl  $53d0      ; Length
         ds    4          ; Written
         ds    2

*--- Nom des fichiers

pTCK1    strl  '1/Tinies.Data/TCK1'
pTCK2    strl  '1/Tinies.Data/TCK2'
pDOC     strl  '1/Tinies.Data/Tinies.Docu'
pABOUT   strl  '1/Tinies.Data/TCK.About'
pLOGO    strl  '1/Tinies.Data/TCK.Logo'
pNIV     strl  '1/Tinies.Data/Niv00'
pTAB     strl  '1/Tinies.Data/Tinies.Tab2'

pBOUGE   strl  '1/Tinies.Data/Bouge'
pFONTE   strl  '1/Tinies.Data/Fonte'
pGADGET2 strl  '1/Tinies.Data/Gadget2'
pGADGET3 strl  '1/Tinies.Data/Gadget3'
pTINY1   strl  '1/Tinies.Data/Tiny1'
pTINY2   strl  '1/Tinies.Data/Tiny2'

pGAME    strl  '1/The.Tinies'

*--- Routine 3200 couleurs

mySTACK  ds    2

affTBL   dw    $e4,$84,$8c,$94,$9c,$a4,$ac
         dw    $b4,$bc,$c4,$cc,$d4,$dc

*--- Memoire

myID     ds    2

ptrTCK1  ds    4          ; 0
ptrNIV   ds    4          ; 1
ptrDOC   ds    4          ; 2
ptrTAB   ds    4          ; 3
ptrBOUGE ds    4          ; 4
ptrGADGET2 ds  4          ; 5
ptrTINY1 ds    4          ; 6

ptrTCK2  ds    4          ; 7
ptrBACK  ds    4          ; 8
ptrABOUT ds    4          ; 9
         ds    4          ; A (unused 32kb)
ptrFONTE ds    4          ; B
ptrGADGET3 ds  4          ; C
ptrTINY2 ds    4          ; D

ptrUNPACK ds   4          ; 64kb for unpacking

*--- Decompression

packMASK dw    $01ff
         dw    $03ff
         dw    $07ff
         dw    $0fff
         dw    $0000

temp     ds    2

*--- Lignes

Ligne    =     *

]Ligne   =     $0
         lup   200
         dw    ]Ligne
]Ligne   =     ]Ligne+160
         --^

*$
         asc   0d
         asc   "Olivier is happy with his new CdROM: HottestFantasies"0d
         asc   "650mB of happiness... :-)"0d

         put   TCK.Play
         put   TCK.About

*$
         asc   0d
         asc   "See You Next Time In The Next Power GS Issue"0d
         asc   "End of Transmission.."0d
