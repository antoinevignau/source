*
* Blockade: Game
*

*--------------------------------------
* Gestion du jeu

nowPLAY  ldx   currX
         ldy   currY
         jsr   calcPLATEAU
         tax
         lda   plateauBACK,x ; on ne deplace pas
         and   #$ff       ; si on a qqch de fixe
         sta   valueCURR
         cmp   #$07
         beq   nowPLAY1
         cmp   #$11
         bcs   nowPLAY1

         lda   plateauFORE,x ; si rien en fore, alors retour
         and   #$ff
         beq   nowPLAY2

         brl   nowPLAY20  ; on a qqch en fore

*---

nowPLAY1 ldy   #6
         jsr   playSND

         ldx   oldX       ; retour sans changement
         stx   currX
         ldy   oldY
         sty   currY
         lda   oldC
         sta   currC
         rts

nowPLAY2 lda   #06        ; on affiche le sprite
         ldx   currX
         ldy   currY
         jsr   showSCREEN
         lda   oldC
         ldx   oldX
         ldy   oldY
         jsr   showSCREEN

         lda   valueCURR
         sta   currC

         ldy   #4
         jsr   playSND

         rts

*--- On a qqch en foreground

nowPLAY20 sta  currC

         jsr   calcNEXT
         bcs   nowPLAY1

         tax
         lda   plateauFORE,x
         and   #$ff
         sta   nextC
         cmp   #$11
         bcc   nowPLAY201

         brl   nowPLAY1

nowPLAY201 eor currC
         cmp   #1
         bne   nowPLAY22

         jsr   saveALL

         lda   nextC      ; regarde si CARRE
         cmp   #$0a
         bcs   nowPLAY21

         ldy   #10
         jsr   playSND

         dec   nbPIECES   ; CARRE -> effacer
         dec   nbPIECES

         ldx   nextX
         ldy   nextY
         jsr   calcPLATEAU
         tax
         lda   plateauFORE,x
         and   #$ff00
         sta   plateauFORE,x

         stz   currC
         stz   nextC
         brl   nowPLAY40

nowPLAY21 lda  nextC
         sec
         sbc   #2
         sta   nextC

         ldy   #0
         jsr   playSND

         stz   currC
         dec   nbPIECES
         brl   nowPLAY40

nowPLAY22 cmp  currC      ; si =currC alors on a rien
         beq   nowPLAY23  ; en fore

         brl   nowPLAY1

nowPLAY23 lda  currC
         sta   nextC

         phx
         jsr   saveALL
         plx

*--- Rien en nextFore, regarde en nextBack

nowPLAY30 lda  plateauBACK,x
         and   #$ff
         cmp   #$07
         beq   nowPLAY31
         cmp   #$11
         bcc   nowPLAY32

nowPLAY31 brl  nowPLAY1

nowPLAY32 ldy  currC      ; gestion du mur mouvant
         cpy   #$10
         bne   nowPLAY321
         sty   nextC
         brl   nowPLAY40

nowPLAY321 cmp #1         ; force jaune
         bne   nowPLAY33

         ldy   #9
         jsr   playSND

         lda   currC
         and   #$fe
         sta   nextC
         brl   nowPLAY40

nowPLAY33 cmp  #2         ; force bleu
         bne   nowPLAY34

         ldy   #3
         jsr   playSND

         lda   currC
         ora   #$01
         sta   nextC
         brl   nowPLAY40

nowPLAY34 cmp  #3         ; echange couleur
         bne   nowPLAY35

         ldy   #12
         jsr   playSND

         lda   currC      ; vire bit 0
         and   #$fe
         pha
         lda   currC
         and   #$01       ; garde bit 0
         eor   #$01       ; 0=>1 & 1=>0
         ora   1,s
         ply
         sta   nextC
         brl   nowPLAY40

nowPLAY35 cmp  #4         ; degenerateur
         bne   nowPLAY37

         lda   currC
         cmp   #$0e
         bcs   nowPLAY36
         clc
         adc   #2
         sta   nextC

         ldy   #5
         jsr   playSND

nowPLAY36 brl  nowPLAY40

nowPLAY37 cmp  #5         ; teleporteur
         bne   nowPLAY40

         jsr   manageTELE
         bcs   nowPLAY40

         stx   nextX
         sty   nextY

         lda   currC
         sta   nextC

         ldy   #11
         jsr   playSND

*--- Reaffiche tout ce qui a change

nowPLAY40 lda  #06        ; on affiche le curseur
         ldx   currX
         ldy   currY
         jsr   showSCREEN
         lda   oldC       ; on reaffiche l'ancien sprite
         ldx   oldX
         ldy   oldY
         jsr   showSCREEN

         ldy   #8
         jsr   playSND

         lda   nbPIECES
         cmp   nbPIECES2
         bne   nowPLAY41

         jsr   saveALL

nowPLAY41 ldx  oldX       ; on efface l'ancienne valeur
         ldy   oldY
         jsr   calcPLATEAU
         tax
         lda   plateauFORE,x
         and   #$ff00
         sta   plateauFORE,x

         ldx   currX
         ldy   currY
         jsr   calcPLATEAU
         tax
         lda   plateauFORE,x
         and   #$ff00
         sta   plateauFORE,x

         ldx   nextX      ; on met la nouvelle valeur
         ldy   nextY
         jsr   calcPLATEAU
         tax
         lda   plateauFORE,x
         and   #$ff00
         ora   nextC
         sta   plateauFORE,x

         lda   nextC
         bne   nowPLAY42

         ldx   nextX      ; on met la nouvelle valeur
         ldy   nextY
         jsr   calcPLATEAU
         tax
         lda   plateauBACK,x
         and   #$ff
nowPLAY42 ldx  nextX      ; affiche it
         ldy   nextY
         jsr   showSCREEN

         lda   valueCURR
         sta   currC

         lda   #1
         sta   fgUNDO

         rts

*--- Gestion du teleporteur

manageTELE lda #1
         sta   deltaMVT

         ldx   nextX
         stx   teleX
         ldy   nextY
         sty   teleY

*---

manageTELE1 lda deltaMVT
         asl
         asl
         clc
         adc   #2
         sta   maxMVT     ; nombre maxi de deplacement

         stz   nbMVT      ; nb de deplacements effectues

         ldx   teleX      ; calcul de l'adresse
         stx   xFIRST     ; de la premiere case
         stx   xSECOND

         lda   teleY
         sec
         sbc   deltaMVT
         sta   yFIRST
         sta   ySECOND

*---

manageTELE2 ldx xFIRST
         ldy   yFIRST
         jsr   manageTELE10
         bcs   manageTELE3
         ldx   xFIRST
         ldy   yFIRST
         clc
         rts
manageTELE3 ldx xSECOND
         ldy   ySECOND
         jsr   manageTELE10
         bcs   manageTELE4
         ldx   xSECOND
         ldy   ySECOND
         clc
         rts

*---

manageTELE4 lda nbMVT
         clc
         adc   #2
         sta   nbMVT      ; incremente le numero du mouvement
         cmp   maxMVT
         bne   manageTELE6

         lda   deltaMVT
         clc
         adc   #1
         sta   deltaMVT
         cmp   #16
         beq   manageTELE5
         brl   manageTELE1
manageTELE5 sec
         rts

*---

manageTELE6 lda yFIRST
         clc
         adc   #1
         sta   yFIRST
         sta   ySECOND
         bmi   manageTELE7
         cmp   teleY
         bcc   manageTELE7
         beq   manageTELE7

         inc   xFIRST
         bra   manageTELE8

manageTELE7 dec xFIRST

manageTELE8 lda teleX
         sec
         sbc   xFIRST
         clc
         adc   teleX
         sta   xSECOND
         brl   manageTELE2

*---

manageTELE10 cpx #15      ; x<15
         bcc   manageTELE11
         bra   manageTELE15

manageTELE11 cpy #9       ; y<9
         bcc   manageTELE12
         bra   manageTELE15

manageTELE12 cpx currX    ; sur curseur
         bne   manageTELE13
         cpy   currY
         beq   manageTELE15

manageTELE13 cpx teleX    ; sur teleporteur de depart
         bne   manageTELE14
         cpy   teleY
         beq   manageTELE15

manageTELE14 jsr calcPLATEAU ; regarde si on a un teleporteur
         tax
         lda   plateauBACK,x
         and   #$ff
         cmp   #$05
         bne   manageTELE15

         lda   plateauFORE,x
         and   #$ff
         bne   manageTELE15

         clc
         rts
manageTELE15 sec
         rts

*--------------------------------------

saveALL  ldx   #0
         sep   #$20
]lp      lda   plateauBACK,x
         sta   plateauBACK2,x
         lda   plateauFORE,x
         sta   plateauFORE2,x
         inx
         cpx   #15*9
         bne   ]lp

         rep   #$20

         ldx   oldX
         stx   copyX
         ldy   oldY
         sty   copyY
         lda   oldC
         sta   copyC

         lda   nbPIECES
         sta   nbPIECES2

         rts

*---

restoreALL lda fgUNDO
         bne   restoreALL1
         rts

restoreALL1 ldx #0
         sep   #$20

]lp      lda   plateauBACK,x
         pha
         lda   plateauBACK2,x
         sta   plateauBACK,x
         pla
         sta   plateauBACK2,x

         lda   plateauFORE,x
         pha
         lda   plateauFORE2,x
         sta   plateauFORE,x
         tay
         pla
         sta   plateauFORE2,x

         tya
         bne   restoreALL2
         lda   plateauBACK,x
restoreALL2 sta plateauALL,x

         inx
         cpx   #15*9
         bne   ]lp

         rep   #$20

         lda   #showSCREEN
         sta   printLEVEL1+1
         jsr   printLEVEL
         lda   #showSPRITE
         sta   printLEVEL1+1

         lda   coorX
         ldx   copyX
         stx   currX
         stx   coorX
         sta   copyX

         lda   coorY
         ldy   copyY
         sty   currY
         sty   coorY
         sta   copyY

         lda   currC
         pha
         lda   copyC
         sta   currC
         pla
         sta   copyC

         lda   #6
         jsr   showSCREEN

         ldx   nbPIECES
         lda   nbPIECES2
         sta   nbPIECES
         stx   nbPIECES2

         rts

*--------------------------------------
* Routines diverses

decodeLEVEL lda ptrLEVEL
         sta   Debut
         lda   ptrLEVEL+2
         sta   Debut+2

         lda   #0
         ldx   level
]lp      dex
         cpx   #0
         beq   decodeLEVEL1
         clc
         adc   #$b8
         bra   ]lp
decodeLEVEL1 clc
         adc   Debut
         sta   Debut
         lda   Debut+2
         adc   #0
         sta   Debut+2

*--- Recopie nom

         ldy   #24-2
]lp      lda   [Debut],y
         sta   levelNAME,y
         dey
         dey
         bpl   ]lp

*--- Recopie fond

         lda   Debut
         clc
         adc   #$18
         sta   Debut
         lda   Debut+2
         adc   #0
         sta   Debut+2

         lda   #plateauALL
         sta   Arrivee
         lda   #^plateauALL
         sta   Arrivee+2

         ldx   #9
decodeLEVEL2 ldy #14
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

         lda   Debut
         clc
         adc   #16
         sta   Debut

         lda   Arrivee
         clc
         adc   #15
         sta   Arrivee

         dex
         bne   decodeLEVEL2

         lda   [Debut]
         xba
         sta   nbPIECES

*--- Gere le premier plan

         sep   #$20
         ldx   #0
]lp      lda   plateauALL,x
         cmp   #$06
         beq   decodeLEVEL3
         cmp   #$13
         bcs   decodeLEVEL5
         cmp   #$08
         bcs   decodeLEVEL4
         bra   decodeLEVEL5

decodeLEVEL3 lda #0

decodeLEVEL4 sta plateauFORE,x
         stz   plateauBACK,x
         bra   decodeLEVEL6

decodeLEVEL5 sta plateauBACK,x
         stz   plateauFORE,x

decodeLEVEL6 inx
         cpx   #15*9
         bne   ]lp

         rep   #$20

         stz   fgUNDO

         rts

*--------------------------------------

putLEVEL sep   #$20

         ldx   level
         lda   scdVAR,x
         and   #$f0
         lsr
         lsr
         lsr
         lsr
         ora   #'0'
         cmp   #'0'
         bne   putLEVEL0
         lda   #' '
putLEVEL0 sta  strLEVEL

         lda   scdVAR,x
         and   #$0f
         ora   #'0'
         sta   strLEVEL+1

         rep   #$20

putLEVEL1 lda  #strLEVEL
         ldx   #$00e1
         ldy   #$95f0
         jsr   printIT

         lda   ptrSCR
         clc
         adc   #$75f0
         tay

         lda   #strLEVEL
         ldx   ptrSCR+2
         jsr   printIT

         rts

*--------------------------------------

printLEVEL lda #0
         sta   printY
         sta   showX
         sta   showY

]lp      tax
         lda   plateauALL,x
         and   #$ff
         ldx   showX
         ldy   showY
         cmp   #$06
         bne   printLEVEL1
         stx   currX
         stx   coorX
         stx   oldX
         sty   currY
         sty   coorY
         sty   oldY

printLEVEL1 jsr showSPRITE

         inc   showX
         lda   showX
         cmp   #15
         bne   printLEVEL2
         stz   showX
         inc   showY

printLEVEL2 inc printY
         lda   printY
         cmp   #15*9
         bne   ]lp

*--- Affiche le nom

         lda   levelNAME
         and   #$ff
         tax
         stz   levelNAME1,x

         lda   #$7598
         clc
         adc   ptrSCR
         tay

         lda   #levelNAME1
         ldx   ptrSCR+2
         jsr   printIT

         jsr   putLEVEL

         rts

*--------------------------------------

showSCREEN phy

         asl
         tay
         lda   adrSPRITE,y
         clc
         adc   ptrSPRITE
         sta   Debut
         lda   ptrSPRITE+2
         adc   #0
         sta   Debut+2

         ply
         jsr   calcWHAT
         clc
         adc   #$2005
         sta   Arrivee
         lda   #$00e1
         sta   Arrivee+2
         bra   showSPRITE1

*--------------------------------------

showSPRITE phy

         asl
         tay
         lda   adrSPRITE,y
         clc
         adc   ptrSPRITE
         sta   Debut
         lda   ptrSPRITE+2
         adc   #0
         sta   Debut+2

         ply
         jsr   calcWHAT
         clc
         adc   #5         ; Correctif centre
         clc
         adc   ptrSCR
         sta   Arrivee
         lda   ptrSCR+2
         adc   #0
         sta   Arrivee+2

showSPRITE1 ldx #20
         ldy   #0
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         lda   [Debut],y
         sta   [Arrivee],y

         tya
         clc
         adc   #160-8
         tay

         dex
         bne   ]lp

         rts

*--------------------------------------

calcWHAT tya
         asl
         tay
         lda   scrY,y
         pha

         txa
         asl
         tax
         lda   scrX,x
         clc
         adc   1,s
         plx
         rts

*--------------------------------------

calcPLATEAU lda platY,y
         and   #$ff
         pha

         txa
         clc
         adc   1,s
         plx
         clc
         rts

*--------------------------------------

calcNEXT lda   currX
         sta   nextX
         lda   currY
         sta   nextY

         lda   theDIR     ; left
         bne   calcNEXT1
         lda   nextX
         beq   calcNEXT5
         dec   nextX
         bra   calcNEXT4

calcNEXT1 cmp  #1         ; right
         bne   calcNEXT2
         lda   nextX
         cmp   #14
         beq   calcNEXT5
         inc   nextX
         bra   calcNEXT4

calcNEXT2 cmp  #2         ; up
         bne   calcNEXT3
         lda   nextY
         beq   calcNEXT5
         dec   nextY
         bra   calcNEXT4

calcNEXT3 lda  nextY      ; down
         cmp   #8
         beq   calcNEXT5
         inc   nextY

calcNEXT4 ldx  nextX
         ldy   nextY
         jsr   calcPLATEAU
         clc
         rts
calcNEXT5 sec
         rts

*--------------------------------------

preparePIC lda ptrSPRITE
         sta   Debut
         lda   ptrSPRITE+2
         sta   Debut+2

         lda   ptrSCR
         sta   Arrivee
         lda   ptrSCR+2
         sta   Arrivee+2

         ldy   #0
         tya
]lp      sta   [Arrivee],y
         iny
         iny
         bpl   ]lp

         ldy   #180*160
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         bpl   ]lp
         rts

*--- Jeu

level    ds    2
oldLEVEL ds    2

strLEVEL asc   '  '00

nbPIECES ds    2
nbPIECES2 ds   2

fgUNDO   ds    2

printY   ds    2

showX    ds    2
showY    ds    2

valueCURR ds   2

xFIRST   ds    2          ; teleporteur
yFIRST   ds    2

xSECOND  ds    2
ySECOND  ds    2

nbMVT    ds    2
maxMVT   ds    2

teleX    ds    2
teleY    ds    2

deltaMVT ds    2

oldX     ds    2          ; ancien
oldY     ds    2
oldC     ds    2

currX    ds    2          ; courant
currY    ds    2
currC    ds    2

nextX    ds    2          ; le premier apres
nextY    ds    2
nextC    ds    2

copyX    ds    2          ; sauvegarde
copyY    ds    2
copyC    ds    2

theDIR   ds    2
theKEY   ds    2

scrX     dw    $00,$0a,$14,$1e,$28,$32,$3c,$46
         dw    $50,$5a,$64,$6e,$78,$82,$8c
scrY     dw    $0000,$0c80,$1900,$2580,$3200
         dw    $3e80,$4b00,$5780,$6400

adrSPRITE dw   $141,$14c,$157,$162,$16d,$178,$183
         dw    $18e,$199,$1a4,$1af,$1ba,$1c5,$1d0
         dw    $f01,$f0c,$f17,$f22,$f2d,$f38,$f43
         dw    $f4e,$f59,$f64,$f6f,$f7a,$f85,$f90

platY    db    0,15,30,45,60,75,90,105,120,135

levelNAME ds   1
levelNAME1 ds  24

plateauALL ds  15*9

plateauBACK2 ds 15*9
plateauFORE2 ds 15*9

plateauBACK ds 15*9
plateauFORE ds 15*9
