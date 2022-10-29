*--------------------------*
*                          *
*         BLOCKADE         *
*                          *
*      Brutal  Deluxe      *
*                          *
*  Version: 1.0 du 1/1/95  *
*--------------------------*

         lst   off
         rel
         dsk   Blockade.l

         mx    %00
         xc
         xc

lvl      =     1

*--------------------------------------

         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Misc.Macs
         use   4/Sound.Macs
         use   4/Util.Macs

*--------------------------------------

Debut    =     $00
Arrivee  =     $04
Second   =     $08
Third    =     $0c

proDOS   =     $e100a8

*--------------------------------------

         brl   ICI

         asc   0d0d
         asc   'Happy New Year'
         asc   0d0d

ICI      phk
         plb

         _TLStartUp
         pha
         _MMStartUp
         pla
         sta   myID
         _MTStartUp

*--- Keyboard buffering off

         PushWord #0
         PushWord #$2b
         _ReadBParam
         PullWord save5

         PushWord #0
         PushWord #$2b
         _WriteBParam

         sep   #$20

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

*--------------------------------------

         ldal  $e0c060
         bmi   okINIT1

         pha
         _SoundToolStatus
         pla
         bne   okINIT1

         lda   #1
         sta   fgSND

*--------------------------------------

         brl   okINIT1

         asc   0d'Hello Joe'0d
         asc   'Now that you have 1000 subscribers'0d
         asc   'We hope that Sheva will love your IIGS :-)'0d

*--------------------------------------

okINIT1  PushLong #0
         PushLong #$8fffff
         PushWord myID
         PushWord #%11000000_00000000
         PushLong #0
         _NewHandle
         _DisposeHandle
         _CompactMem

*--------------------------------------

]lp      PushLong #0
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
         sta   ptrUNPACK,x
         ldy   #2
         lda   [3],y
         sta   ptrUNPACK+2,x
         pld
         pla
         pla
         jsr   memERR
         inx
         inx
         inx
         inx
         stx   temp
         cpx   #4*6       ; 6*64ko
         bne   ]lp

         PushLong #0
         PushLong #$40000
         PushWord myID
         PushWord #%11000000_00001100
         PushLong #0
         _NewHandle
         phd
         tsc
         tcd
         ldy   #0
         lda   [3],y
         sta   ptrMUSIC
         ldy   #2
         lda   [3],y
         sta   ptrMUSIC+2
         pld
         pla
         pla
         bcc   okINIT2

         lda   #1
         sta   fgZIK

*--------------------------------------

okINIT2  ldx   #0

]lp      lda   ptrSCR,x
         clc
         adc   #$8000
         sta   ptrLEVEL,x
         lda   ptrSCR+2,x
         adc   #0
         sta   ptrLEVEL+2,x

         txa
         clc
         adc   #4
         tax
         cpx   #4*5
         bne   ]lp

*--------------------------------------

         ldx   #0
]lp      lda   ptrMUSIC,x
         clc
         adc   #$8000
         sta   ptrMUSIC+4,x
         lda   ptrMUSIC+2,x
         adc   #0
         sta   ptrMUSIC+6,x

         txa
         clc
         adc   #4
         tax
         cpx   #4*6
         bne   ]lp

*--------------------------------------

         ldx   #0
         txa
]lp      stal  $e12000,x
         inx
         inx
         bpl   ]lp

         sep   #$20
         lda   #$c1
         stal  $e0c029
         rep   #$20

*--------------------------------------

         PushWord #0
         PushWord #0
         PushWord #0
         PushWord #0
         _ReadTimeHex
         plx
         plx
         plx
         pla
         and   #$ff00
         cmp   #$0100
         beq   okINIT4
         cmp   #$0200
         bne   okINIT5

         lda   #1
         sta   fgBORDURE
         bra   okINIT5

okINIT4  lda   #$0f6f
         sta   adrSPRITE+20
         lda   #$0f7a
         sta   adrSPRITE+22

okINIT5  PushWord #0
         PushWord #$29
         _ReadBParam
         pla
         and   #$ff
         cmp   #$02
         beq   okINIT51
         brl   okINIT6

okINIT51 lda   #1
         sta   fgLANG

*--------------------------------------

         brl   okINIT6

         asc   0d'In the last issue of PowerGs'0d
         asc   'You saw no pictures of Digital Exodus members:'0d
         asc   'They consider their visage to be their own property'0d0d

         asc   'They act the same way with their software'0d
         asc   'They certainly program many things but...'0d
         asc   'They keep them for themselves... :-('0d
         asc   'That'27's why there is no available software from Digital Exodus'0d

*--------------------------------------

okINIT6  ldal  $e0c061
         bmi   okINIT7

         lda   fgZIK
         bne   okINIT9

         jsr   animIT
         bra   okINIT9

okINIT7  lda   #$6038
         sta   loadPATCH

         lda   #pANIM17
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         bcs   okINIT8

         ldx   ptrSCR+2
         ldy   ptrSCR
         jsr   unPACK

         ldx   ptrSCR+2
         ldy   ptrSCR
         lda   #-1
         jsr   fadeIN

okINIT8  lda   #$eaea
         sta   loadPATCH

okINIT9  brl   doCODE

*--------------------------------------

initOFF  ldx   #0
         txa
]lp      stal  $e12000,x
         inx
         inx
         bpl   ]lp

         PushWord save5
         PushWord #$2b
         _WriteBParam

         sep   #$20

         lda   save4
         stal  $e0c035
         lda   save3
         stal  $e0c034
         lda   save2
         stal  $e0c029
         lda   save1
         stal  $e0c022

         rep   #$20

         _MTShutDown

         PushWord myID
         _DisposeAll
         PushWord myID
         _MMShutDown
         _TLShutDown

         jsl   proDOS
         dw    $2029
         adrl  proQUIT

*--------------------------------------
* Le programme

doCODE   lda   #pSPRIT
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrSPRITE+2
         ldy   ptrSPRITE
         jsr   unPACK

         lda   #pHELP1
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP1+2
         ldy   ptrHELP1
         jsr   unPACK

         lda   fgLANG
         beq   doCODE1
         brl   doCODE2

doCODE1  lda   #pHELP2
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP2+2
         ldy   ptrHELP2
         jsr   unPACK

         lda   #pHELP3
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP3+2
         ldy   ptrHELP3
         jsr   unPACK

         lda   #pHELP4
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP4+2
         ldy   ptrHELP4
         jsr   unPACK

         lda   #pHELP5
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP5+2
         ldy   ptrHELP5
         jsr   unPACK

         lda   #pHELP6
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP6+2
         ldy   ptrHELP6
         jsr   unPACK
         brl   doCODE3

doCODE2  lda   #pHELP2VF
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP2+2
         ldy   ptrHELP2
         jsr   unPACK

         lda   #pHELP3VF
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP3+2
         ldy   ptrHELP3
         jsr   unPACK

         lda   #pHELP4VF
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP4+2
         ldy   ptrHELP4
         jsr   unPACK

         lda   #pHELP5VF
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP5+2
         ldy   ptrHELP5
         jsr   unPACK

         lda   #pHELP6VF
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         ldx   ptrHELP6+2
         ldy   ptrHELP6
         jsr   unPACK

doCODE3  lda   #pLEVEL
         ldx   ptrLEVEL+2
         ldy   ptrLEVEL
         jsr   loadFILE

         lda   fgSND
         beq   doCODE4

*---

         lda   #$6038
         sta   loadPATCH

         lda   #pSOUND
         ldx   ptrUNPACK+2
         ldy   ptrUNPACK
         jsr   loadFILE
         bcc   doCODE31

         lda   #1
         sta   fgFX
         bra   doCODE32

doCODE31 jsr   initSND

doCODE32 lda   ptrUNPACK
         clc
         adc   #$8000
         tay
         lda   ptrUNPACK+2
         adc   #0
         tax
         lda   #pFONTE
         jsr   loadFILE
         bcc   doCODE321

         lda   #1
         sta   fgAAHH

doCODE321 lda  fgZIK
         bne   doCODE4

         lda   #pMUSIC
         ldx   ptrMUSIC+2
         ldy   ptrMUSIC
         jsr   loadFILE
         bcc   doCODE33

         lda   #1         ; no ZIK
         sta   fgZIK
         bra   doCODE4

doCODE33 jsr   initMUSIC

doCODE4  lda   #$eaea
         sta   loadPATCH

         lda   #lvl
         sta   level

         jsr   fadeOUT

*--------------------------------------

loopGAME jsr   preparePIC

         jsr   decodeLEVEL
         jsr   printLEVEL

         lda   #1
         ldx   ptrSCR+2
         ldy   ptrSCR
         jsr   fadeIN

         lda   #-1
         sta   windowC

         stz   currC

         jsr   moFORE

         jsr   theMOUSE

         pha
         jsr   fadeOUT
         pla
         cmp   #-1        ; Quit
         beq   loopGAME1
         cmp   #-2        ; Restart
         beq   loopGAME

         ldy   #1
         jsr   playSND

         inc   level
         lda   level
         cmp   #82
         bne   loopGAME
         lda   #1
         sta   level
         bra   loopGAME

*---

loopGAME1 lda  fgSND
         beq   loopGAME2
         lda   fgZIK
         bne   loopGAME2

         sei
         stz   fgPLAY
         jsr   shutMUSIC1
         jsr   shutMUSIC

loopGAME2 brl  initOFF

*--------------------------------------
* Routines sonores

initSND  lda   ptrUNPACK
         sta   Debut
         lda   ptrUNPACK+2
         sta   Debut+2
         ldy   #0
         sei

initSND1 sep   #$20

         ldal  $e100ca
         ora   #%0110_0000
         stal  $e0c03c

         lda   #0
         stal  $e0c03e
         stal  $e0c03f

         ldy   #0
]lp      lda   [Debut],y
         stal  $e0c03d
         iny
         bne   ]lp

         rep   #$20
         cli
         rts

*---

playSND  pha
         lda   fgSND
         bne   playSND1
         pla
         rts

playSND1 lda   fgPLAY
         beq   playSND2
         pla
         rts

playSND2 lda   fgFX
         beq   playSND3
         pla
         rts

playSND3 tya
         asl
         tay

         sep   #$20

         ldal  $e100ca
         and   #$0f
         stal  $e0c03c

         tya
         stal  $e0c03e
         lda   #$d1
         stal  $e0c03d
         tya
         ora   #$01
         stal  $e0c03e
         lda   #$d1
         stal  $e0c03d

         tya
         ora   #$20
         stal  $e0c03e
         lda   #0
         stal  $e0c03d
         tya
         ora   #$21
         stal  $e0c03e
         lda   #0
         stal  $e0c03d

         tya
         ora   #$40
         stal  $e0c03e
         lda   #$ff
         stal  $e0c03d
         tya
         ora   #$41
         stal  $e0c03e
         lda   #$ff
         stal  $e0c03d

         tya
         ora   #$80
         stal  $e0c03e
         lda   sndADR,y
         stal  $e0c03d
         tya
         ora   #$81
         stal  $e0c03e
         lda   sndADR,y
         stal  $e0c03d

         tya
         ora   #$c0
         stal  $e0c03e
         lda   sndPAGE,y
         stal  $e0c03d
         tya
         ora   #$c1
         stal  $e0c03e
         lda   sndPAGE,y
         stal  $e0c03d

         tya
         ora   #$a0
         stal  $e0c03e
         lda   #%0000_0010
         stal  $e0c03d
         tya
         ora   #$a1
         stal  $e0c03e
         lda   #%0001_0010
         stal  $e0c03d

         rep   #$20

         pla
         rts

         mx    %00

*--------------------------------------

         asc   0d'Thanks to Jerome Cretaux for having shown us'0d
         asc   'this game for the first time a month ago.'0d

*--------------------------------------

initMUSIC sei

         PushLong #0
         PushWord #$000b
         _GetVector
         PullLong sndVECTOR

         PushWord #$000b
         PushLong #sndINTERRUPT
         _SetVector

         lda   #$373
         sta   zikPAGE
         lda   ptrMUSIC
         sta   zikMUSIC
         lda   ptrMUSIC+2
         sta   zikMUSIC+2

         sep   #$20

         ldal  $e100ca
         stal  $e0c03c

         ldy   #$04

         tya
         ora   #$00
         stal  $e0c03e
         lda   #$d1
         stal  $e0c03d
         tya
         ora   #$01
         stal  $e0c03e
         lda   #$d1
         stal  $e0c03d

         tya
         ora   #$20
         stal  $e0c03e
         lda   #$00
         stal  $e0c03d
         tya
         ora   #$21
         stal  $e0c03e
         lda   #0
         stal  $e0c03d

         tya
         ora   #$40
         stal  $e0c03e
         lda   #$f0
         stal  $e0c03d
         tya
         ora   #$41
         stal  $e0c03e
         lda   #$f0
         stal  $e0c03d

         tya
         ora   #$80
         stal  $e0c03e
         lda   #$3e
         stal  $e0c03d
         tya
         ora   #$81
         stal  $e0c03e
         lda   #$3f
         stal  $e0c03d

         tya
         ora   #$c0
         stal  $e0c03e
         lda   #0
         stal  $e0c03d
         tya
         ora   #$c1
         stal  $e0c03e
         lda   #0
         stal  $e0c03d

         rep   #$20

         jsr   shutMUSIC2

         lda   #1
         sta   zikPLAY

         rts

*---

shutMUSIC sei

         stz   zikPLAY

         PushWord #$000b
         PushLong sndVECTOR
         _SetVector

shutMUSIC1 sep #$20

         ldal  $e100ca
         and   #%0000_1111
         stal  $e0c03c

         ldy   #$1f
]lp      tya
         ora   #$a0
         stal  $e0c03e
         lda   #$01
         stal  $e0c03d
         dey
         bpl   ]lp

         rep   #$20

         cli
         rts

*---

shutMUSIC2 sei
         phd
         lda   #$c000
         tcd
         jsr   sndINTERRUPT2
         rep   #$20
         pld
         cli
         rts

*---

sndINTERRUPT phb
         phd
         phk
         plb

         clc
         xce
         rep   #$30

         lda   #$c000
         tcd

         lda   zikPLAY
         beq   sndINTERRUPT1

         mx    %10

]lp      jsr   sndINTERRUPT2

         ldal  $e100ca
         sta   $3c
         lda   #$e0
         sta   $3e
         lda   $3d
         lda   $3d
         bpl   ]lp

sndINTERRUPT1 clc
         xce
         sep   #$30

         pld
         plb
         clc
         rtl

*---

         mx    %10

sndINTERRUPT2 sep #$20

         ldal  $e100ca
         ora   #%0110_0000
         sta   $3c

         stz   $3e
         lda   #$3e
         ora   fgPAGE
         eor   #1
         sta   $3f

         ldy   zikMUSIC
         lda   zikMUSIC+2
         pha
         plb
         jsr   sndINTERRUPT10
         phk
         plb

         rep   #$20

         lda   zikMUSIC+1
         clc
         adc   #$0001
         sta   zikMUSIC+1

         dec   zikPAGE
         lda   zikPAGE
         bne   sndINTERRUPT3

         lda   whichSND
         beq   sndINTERRUPT21

         sep   #$20

         ldal  $e100ca
         sta   $3c

         lda   #$a4
         sta   $3e
         lda   #%0000_0011
         sta   $3d
         inc   $3e
         lda   #%0001_0011
         sta   $3d
         bra   sndINTERRUPT5

         rts

         mx    %00

sndINTERRUPT21 lda #$373
         sta   zikPAGE
         lda   ptrMUSIC
         sta   zikMUSIC
         lda   ptrMUSIC+2
         sta   zikMUSIC+2

sndINTERRUPT3 sep #$20

         ldal  $e100ca
         sta   $3c

         ldy   #$04

         ldx   fgPAGE
         bne   sndINTERRUPT4

         tya
         ora   #$a0
         sta   $3e
         lda   #%0000_1110
         sta   $3d
         inc   $3e
         lda   #%0001_1111
         sta   $3d
         bra   sndINTERRUPT5

sndINTERRUPT4 tya
         ora   #$a0
         sta   $3e
         lda   #%0000_1111
         sta   $3d
         inc   $3e
         lda   #%0001_1110
         sta   $3d

sndINTERRUPT5 lda fgPAGE
         eor   #1
         sta   fgPAGE

         rts

*---

sndINTERRUPT10 = *

]move    =     $00
         lup   256
         lda   ]move,y
         sta   $3d
]move    =     ]move+1
         --^
         rts

         mx    %00

*--------------------------------------

         asc   0d0d'PRIZM from ORCA/C is a great desktop environment'0d
         asc   'for developing software'0d
         asc   'You only have to reboot every 2 minutes!!'0d
         asc   'Thank you Mike :-)'0d

*--------------------------------------
* Routines gs/os

loadFILE sta   proOPEN+4
         sty   proREAD+4
         stx   proREAD+6

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

loadPATCH nop
         nop

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
loadERR1 jmp   initOFF

*--------------------------------------
* Routines diverses

memERR   bcs   memERR1    ; Erreur de memoire
         rts
memERR1  PushWord #0
         PushLong #memSTR1
         PushLong #memSTR2
         PushLong #proSTR3
         PushLong #proSTR4
         _TLTextMountVolume
         pla
         jmp   initOFF

*--------------------------

clickIT  ldal  $e0bfff
         bpl   clickIT1
         stal  $e0c010
         xba
         and   #$ff
         clc
         rts
clickIT1 sec
         rts

*------------------------------

nextVBL  lda   #75
         pha
]lp      ldal  $e0c02e
         and   #$7f
         cmp   1,s
         blt   ]lp
         cmp   #100
         bge   ]lp
         pla
waitVBL  ldal  $e0c018
         bpl   waitVBL
         rts

*-------------------------- Decompression

unPACK   phd
         tdc
         clc
         adc   #$200
         tcd

         sty   $04
         stx   $06

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
         jsr   clickIT
         bcc   nowWAIT2
]lp      ldal  $e0c018
         bmi   ]lp
         pla
         dec
         bne   nowWAIT1
         sec
         rts
nowWAIT2 pla
         clc
         rts

*--------------------------------------

         asc   0d' Tinies'27'last level code is MUADDIBU'0d

*--------------------------------------
* Routines graphiques

fadeIN   sty   Debut
         stx   Debut+2

         ldy   #$2000
         sty   Arrivee
         ldx   #$00e1
         stx   Arrivee+2

         cmp   #0
         beq   fadeIN1

         ldy   #$7dfe
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

fadeIN1  lda   Debut
         clc
         adc   #$7e00
         sta   Debut
         lda   Debut+2
         adc   #0
         sta   Debut+2

         lda   Arrivee
         clc
         adc   #$7e00
         sta   Arrivee
         lda   Arrivee+2
         adc   #0
         sta   Arrivee+2

         ldx   #$000f
fadeIN2  ldy   #$01fe
fadeIN3  lda   [Arrivee],y
         and   #$000f
         sta   temp
         lda   [Debut],y
         and   #$000f
         cmp   temp
         beq   fadeIN4
         lda   [Arrivee],y
         clc
         adc   #$0001
         sta   [Arrivee],y
fadeIN4  lda   [Arrivee],y
         and   #$00f0
         sta   temp
         lda   [Debut],y
         and   #$00f0
         cmp   temp
         beq   fadeIN5
         lda   [Arrivee],y
         clc
         adc   #$0010
         sta   [Arrivee],y
fadeIN5  lda   [Arrivee],y
         and   #$0f00
         sta   temp
         lda   [Debut],y
         and   #$0f00
         cmp   temp
         beq   fadeIN6
         lda   [Arrivee],y
         clc
         adc   #$0100
         sta   [Arrivee],y

fadeIN6  dey
         dey
         bpl   fadeIN3
         jsr   nextVBL
         dex
         bpl   fadeIN2
         rts

*---

fadeOUT  lda   #$9e00
         sta   Debut
         lda   #$00e1
         sta   Debut+2

         ldx   #$000f
fadeOUT1 ldy   #$01fe
fadeOUT2 lda   [Debut],y
         and   #$000f
         beq   fadeOUT3
         lda   [Debut],y
         sec
         sbc   #$0001
         sta   [Debut],y
fadeOUT3 lda   [Debut],y
         and   #$00f0
         beq   fadeOUT4
         lda   [Debut],y
         sec
         sbc   #$0010
         sta   [Debut],y
fadeOUT4 lda   [Debut],y
         and   #$0f00
         beq   fadeOUT5
         lda   [Debut],y
         sec
         sbc   #$0100
         sta   [Debut],y

fadeOUT5 dey
         dey
         bpl   fadeOUT2
         jsr   nextVBL
         dex
         bpl   fadeOUT1
         rts

*--------------------------------------
* All the data

         hex   8d8d
         asc   "------------ BLOCKADE ------------",8d
         asc   "        Version Apple //gs        ",8d
         asc   "  Antoine Vignau Olivier Zardini  ",8d
         asc   "          Brutal  Deluxe          ",8d
         asc   "------------ 1 1 1995 ------------",8d,8d

*--- Flags

save1    ds    1
save2    ds    1
save3    ds    1
save4    ds    1
save5    ds    2

*--- Textes

memSTR1  str   'Can'27't allocate memory'
memSTR2  str   'Press a key to quit.'

proSTR1  str   'Can'27't load file'
proSTR2  str   'Do what now ?'
proSTR3  str   '[RET] Continue'
proSTR4  str   '[ESC] Quit'

*--- Prodos

proQUIT  dw    2
         ds    4
         ds    2

proOPEN  dw    2
         ds    2
         adrl  pLEVEL

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

*--- Nom des fichiers

pFONTE   strl  '1/Blockade.Data/Fontes'
pLEVEL   strl  '1/Blockade.Data/Levels'
pMUSIC   strl  '1/Blockade.Data/Musics'
pSPRIT   strl  '1/Blockade.Data/Sprite'
pSOUND   strl  '1/Blockade.Data/Sounds'
pHELP1   strl  '1/Blockade.Data/Help.1'
pHELP2   strl  '1/Blockade.Data/Help.2'
pHELP3   strl  '1/Blockade.Data/Help.3'
pHELP4   strl  '1/Blockade.Data/Help.4'
pHELP5   strl  '1/Blockade.Data/Help.5'
pHELP6   strl  '1/Blockade.Data/Help.6'
pHELP2VF strl  '1/Blockade.Data/Help.2.V'
pHELP3VF strl  '1/Blockade.Data/Help.3.V'
pHELP4VF strl  '1/Blockade.Data/Help.4.V'
pHELP5VF strl  '1/Blockade.Data/Help.5.V'
pHELP6VF strl  '1/Blockade.Data/Help.6.V'
pANIM17  strl  '1/Blockade.Data/Anim.17'

*--- Sons

fgSND    ds    2
fgPLAY   ds    2
fgFX     ds    2
fgZIK    ds    2
fgAAHH   ds    2
copyPLAY ds    2
whichSND ds    2

sndADR   dw    $60,$00,$78,$d0,$26,$a0,$30,$28,$c0,$98,$40,$80,$e0
sndPAGE  dw    $2d,$36,$1b,$24,$00,$2d,$24,$1b,$24,$1b,$2d,$2d,$24

fgPAGE   ds    2
zikPLAY  ds    2
zikPAGE  ds    2
zikMUSIC ds    4

sndVECTOR ds   4

*--- Memoire

myID     ds    2

ptrUNPACK ds   4          ; 0

ptrSCR   ds    4          ; 1
ptrSPRITE ds   4          ; 2
ptrHELP1 ds    4          ; 3
ptrHELP3 ds    4          ; 4
ptrHELP5 ds    4          ; 5

ptrLEVEL ds    4          ; 6
         ds    4          ; 7
ptrHELP2 ds    4          ; 8
ptrHELP4 ds    4          ; 9
ptrHELP6 ds    4          ; 10

ptrMUSIC ds    4          ; 11
         ds    4          ; 12
         ds    4          ; 13
         ds    4          ; 14
         ds    4          ; 15
         ds    4          ; 16
         ds    4          ; 17
         ds    4          ; 18

*--- Divers

fgLANG   ds    2
fgBORDURE ds   2

*--- Conversion

scdVAR   hex   00,01,02,03,04,05,06,07,08,09
         hex   10,11,12,13,14,15,16,17,18,19
         hex   20,21,22,23,24,25,26,27,28,29
         hex   30,31,32,33,34,35,36,37,38,39
         hex   40,41,42,43,44,45,46,47,48,49
         hex   50,51,52,53,54,55,56,57,58,59
         hex   60,61,62,63,64,65,66,67,68,69
         hex   70,71,72,73,74,75,76,77,78,79
         hex   80,81,82,83,84,85,86,87,88,89

*--- Decompression

packMASK dw    $01ff
         dw    $03ff
         dw    $07ff
         dw    $0fff
         dw    $0000

temp     ds    8

*--- Lignes

Ligne    =     *

]Ligne   =     $0
         lup   200
         dw    ]Ligne
]Ligne   =     ]Ligne+160
         --^

*--------------------------------------

         asc   0d'Don'27't waste your time reading this'0d
         asc   0d'Try to succeed all the levels'0d

*--------------------------------------

         put   Blockade.Anim
         put   Blockade.Mice
         put   Blockade.Play
         put   Blockade.Docu
