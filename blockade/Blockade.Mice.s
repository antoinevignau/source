*
* Blockade: Souris
*

*--------------------------------------

maximumX =     312
maximumY =     194


theMOUSE lda   nbPIECES
         bne   theMOUSE1
         lda   #0
         rts

theMOUSE1 jsr  moREAD
         jsr   moCONTROL
         bcs   theMOUSE10

         cpx   #-1
         beq   theMOUSE10
         cpx   #135*2
         bcc   theMOUSE4
         brl   doBUTTON

theMOUSE4 lda  coorX
         sta   oldX
         lda   coorY
         sta   oldY
         lda   currC
         sta   oldC

         ldy   #0

theMOUSE5 jsr  checkVALID
         bcc   theMOUSE6

         ldx   oldX
         stx   coorX
         ldy   oldY
         sty   coorY
         lda   oldC
         sta   currC

         bra   theMOUSE10

theMOUSE6 lda  #-1
         sta   windowC

         ldx   coorX
         stx   currX
         ldy   coorY
         sty   currY

         jsr   moBACK
         jsr   nowPLAY
         jsr   moFORE

         ldx   currX
         stx   coorX
         ldy   currY
         sty   coorY

         brl   theMOUSE

*---

theMOUSE10 lda fgBORDURE
         beq   theMOUSE12

         sep   #$20
         ldal  $e0c034
         inc
         stal  $e0c034
         rep   #$20

theMOUSE12 ldy #0
         jsr   clickIT
         bcc   theMOUSE13
         brl   theMOUSE

theMOUSE13 sta theKEY

         cpy   #0
         bne   theMOUSE14

         ldal  $e0c060
         bmi   theMOUSE14
         brl   theMOUSE30

theMOUSE14 lda theKEY
         and   #%00000000_11011111
         cmp   #"Q"
         bne   theMOUSE16

         jsr   doQUIT
         bcs   theMOUSE15
         lda   #-1
         clc
         rts
theMOUSE15 brl theMOUSE

theMOUSE16 lda theKEY
         and   #%00000000_11011111
         cmp   #"R"
         bne   theMOUSE17

         lda   #-2
         rts

theMOUSE17 lda theKEY
         and   #%00000000_11011111
         cmp   #"Z"
         bne   theMOUSE18

         lda   #-1
         sta   windowC

         jsr   moBACK
         jsr   restoreALL
         jsr   moFORE
         brl   theMOUSE

theMOUSE18 lda theKEY
         and   #%00000000_11011111
         cmp   #"P"
         bne   theMOUSE20

         jsr   doLEVEL
         bcc   theMOUSE19
         jsr   moFORE
         brl   theMOUSE
theMOUSE19 lda #-2
         rts

theMOUSE20 lda theKEY
         cmp   #"?"
         bne   theMOUSE21

         jsr   doHELP
         brl   theMOUSE

theMOUSE21 lda fgFX
         bne   theMOUSE22
         lda   fgSND
         beq   theMOUSE22

         lda   theKEY
         and   #%00000000_11011111
         cmp   #"S"
         bne   theMOUSE22

         lda   fgPLAY
         eor   #1
         sta   fgPLAY
         brl   theMOUSE

theMOUSE22 lda fgZIK
         bne   theMOUSE24
         lda   fgSND
         beq   theMOUSE24

         lda   theKEY
         and   #%00000000_11011111
         cmp   #"M"
         bne   theMOUSE24

         lda   zikPLAY
         eor   #1
         sta   zikPLAY
         beq   theMOUSE23
         jsr   shutMUSIC2
         bra   theMOUSE24
theMOUSE23 jsr shutMUSIC1

theMOUSE24 brl theMOUSE

*---

theMOUSE30 ldx coorX
         stx   oldX
         ldy   coorY
         sty   oldY
         ldx   currC
         stx   oldC

         lda   theKEY
         cmp   #"4"
         beq   theMOUSE32
         cmp   #$88
         beq   theMOUSE32
         cmp   #"J"
         beq   theMOUSE32
         cmp   #"j"
         beq   theMOUSE32

         cmp   #"6"
         beq   theMOUSE33
         cmp   #$95
         beq   theMOUSE33
         cmp   #"L"
         beq   theMOUSE33
         cmp   #"l"
         beq   theMOUSE33

         cmp   #"8"
         beq   theMOUSE34
         cmp   #$8b
         beq   theMOUSE34
         cmp   #"I"
         beq   theMOUSE34
         cmp   #"i"
         beq   theMOUSE34

         cmp   #"2"
         beq   theMOUSE35
         cmp   #"5"
         beq   theMOUSE35
         cmp   #$8a
         beq   theMOUSE35
         cmp   #"K"
         beq   theMOUSE35
         cmp   #"k"
         beq   theMOUSE35

theMOUSE31 brl theMOUSE

theMOUSE32 lda coorX
         beq   theMOUSE31
         dec   coorX
         bra   theMOUSE36

theMOUSE33 lda coorX
         cmp   #14
         beq   theMOUSE31
         inc   coorX
         bra   theMOUSE36

theMOUSE34 lda coorY
         beq   theMOUSE31
         dec   coorY
         bra   theMOUSE36

theMOUSE35 lda coorY
         cmp   #8
         beq   theMOUSE31
         inc   coorY

theMOUSE36 ldx coorX
         ldy   coorY
         jsr   calcPLATEAU
         tax
         ldy   #1
         brl   theMOUSE5

*--------------------------------------

doBUTTON lda   #-1
         sta   windowC

         cpx   #135*2
         bne   doBUTTON1
         lda   #"?"       ; help
         ldy   #-1
         brl   theMOUSE13
doBUTTON1 cpx  #136*2
         bne   doBUTTON2
         lda   #"P"       ; level
         ldy   #-1
         brl   theMOUSE13
doBUTTON2 cpx  #137*2
         bne   doBUTTON3
         lda   #"S"       ; sound
         ldy   #-1
         brl   theMOUSE13
doBUTTON3 cpx  #138*2
         bne   doBUTTON4
         lda   #"M"       ; music
         ldy   #-1
         brl   theMOUSE13
doBUTTON4 cpx  #139*2
         bne   doBUTTON5
         lda   #"Q"       ; quit
         ldy   #-1
         brl   theMOUSE13
doBUTTON5 brl  theMOUSE

*--------------------------------------

doLEVEL  lda   #'  '
         sta   strLEVEL

         lda   level
         sta   oldLEVEL

         jsr   moBACK

         lda   #$9999     ; Affiche barre rouge
         stal  $e19913
         stal  $e19914

         jsr   putLEVEL1

]lp      jsr   clickIT
         bcs   ]lp
         cmp   #$b1
         bcc   ]lp
         cmp   #$ba
         bcs   ]lp

         sep   #$20
         and   #$7f
         sta   strLEVEL+1
         rep   #$20

         jsr   putLEVEL1

]lp      jsr   clickIT
         bcs   ]lp
         cmp   #$8d
         beq   doLEVEL1
         cmp   #$b0
         bcc   ]lp
         cmp   #$ba
         bcs   ]lp

         sep   #$20
         and   #$7f
         pha
         lda   strLEVEL+1
         sta   strLEVEL
         pla
         sta   strLEVEL+1
         rep   #$20

doLEVEL1 lda   #$0000
         stal  $e19913
         stal  $e19914

         sep   #$20

         lda   strLEVEL+1
         and   #$0f
         pha
         lda   strLEVEL
         and   #$0f
         asl
         asl
         asl
         asl
         clc
         adc   1,s
         sta   level
         pla

         lda   level
         cmp   #130       ; 130d=82h
         bcs   doLEVEL3

         ldx   #0
]lp      lda   scdVAR,x
         cmp   level
         beq   doLEVEL2
         inx
         bne   ]lp
         ldx   #1
doLEVEL2 stx   level

         lda   level
         cmp   oldLEVEL
         bne   doLEVEL4

         rep   #$20
         jsr   putLEVEL
         sec
         rts

doLEVEL3 rep   #$20
         lda   #1
         sta   level
         sta   oldLEVEL
         jsr   putLEVEL
         clc
         rts

doLEVEL4 rep   #$20
         lda   level
         sta   oldLEVEL
         jsr   putLEVEL
         clc
         rts

*--------------------------------------

doHELP   jsr   moBACK

         sei
         lda   zikPLAY
         sta   copyPLAY
         stz   zikPLAY
         jsr   shutMUSIC1
         cli

         lda   ptrSCR
         sta   Debut
         lda   ptrSCR+2
         sta   Debut+2

         ldx   #0
]lp      txy
         ldal  $e12000,x
         sta   [Debut],y
         inx
         inx
         bpl   ]lp

         jsr   fadeOUT
         ldx   ptrHELP1+2
         ldy   ptrHELP1
         lda   #-1
         jsr   fadeIN
         jsr   moFORE

         lda   #2
         sta   window

         lda   #-1
         sta   windowC

         lda   #"1"
         sta   theKEY

*---

doHELP1  sep   #$20
         ldal  $e0c000
         bpl   doHELP2
         stal  $e0c010
         cmp   #$9b
         beq   doHELP3

doHELP2  rep   #$20

         jsr   moREAD
         jsr   moCONTROL
         bcs   doHELP1
         cpx   #142*2
         bne   doHELP21

         lda   theKEY
         cmp   #"1"
         bne   doHELP21

*---

         lda   fgSND
         beq   doHELP21
         lda   fgAAHH
         bne   doHELP21

         sei
         lda   ptrUNPACK
         clc
         adc   #$8000
         sta   zikMUSIC
         lda   ptrUNPACK+2
         adc   #0
         sta   zikMUSIC+2
         lda   #$18
         sta   zikPAGE

         jsr   shutMUSIC2

         lda   #1
         sta   fgPAGE
         sta   zikPLAY
         sta   whichSND

         lda   #-1
         sta   windowC

         brl   doHELP1

*---

doHELP21 inc   theKEY

         lda   theKEY
         cmp   #"7"
         bne   doHELP10

doHELP3  sep   #$20
         stal  $e0c010
         rep   #$20

         jsr   moBACK
         jsr   fadeOUT
         ldx   ptrSCR+2
         ldy   ptrSCR
         lda   #-1
         jsr   fadeIN
         jsr   moFORE

*---

         sei

         lda   ptrMUSIC
         sta   zikMUSIC
         lda   ptrMUSIC+2
         sta   zikMUSIC+2
         lda   #$373
         sta   zikPAGE

         stz   whichSND
         lda   copyPLAY
         sta   zikPLAY
         beq   doHELP31

         jsr   shutMUSIC2

*---

doHELP31 lda   #-1
         sta   windowC
         stz   window
         rts

*---

doHELP10 lda   theKEY
         cmp   #"2"
         bne   doHELP11
         ldx   ptrHELP2+2
         ldy   ptrHELP2
         bra   doHELP20

doHELP11 cmp   #"3"
         bne   doHELP12
         ldx   ptrHELP3+2
         ldy   ptrHELP3
         bra   doHELP20

doHELP12 cmp   #"4"
         bne   doHELP13
         ldx   ptrHELP4+2
         ldy   ptrHELP4
         bra   doHELP20

doHELP13 cmp   #"5"
         bne   doHELP14
         ldx   ptrHELP5+2
         ldy   ptrHELP5
         bra   doHELP20

doHELP14 ldx   ptrHELP6+2
         ldy   ptrHELP6

doHELP20 stx   temp+4
         sty   temp+6
         jsr   moBACK
         jsr   fadeOUT
         ldx   temp+4
         ldy   temp+6
         lda   #-1
         jsr   fadeIN
         jsr   moFORE

         lda   #-1
         sta   windowC

         brl   doHELP1

*--------------------------------------

doQUIT   lda   #1
         sta   window
         lda   #-1
         sta   windowC
         jsr   showMSG

doQUIT1  sep   #$20
         ldal  $e0c000
         bpl   doQUIT2
         stal  $e0c010
         cmp   #$9b
         bne   doQUIT2
         rep   #$20
         ldx   #141*2
         bra   doQUIT3

doQUIT2  rep   #$20
         jsr   moREAD
         jsr   moCONTROL
         bcs   doQUIT1

         cpx   #140*2
         bne   doQUIT3

         stz   window
         lda   #-1
         sta   windowC
         jsr   redrawMSG
         clc
         rts

doQUIT3  cpx   #141*2
         bne   doQUIT1

         stz   window
         lda   #-1
         sta   windowC
         jsr   redrawMSG
         sec
         rts

*--------------------------------------

checkVALID cpy #1
         beq   checkVALID1

         lda   window2XY,x
         pha
         and   #$ff
         sta   coorX
         pla
         xba
         and   #$ff
         sta   coorY

checkVALID1 lda coorX     ; regarde si varX=1
         ora   currX
         cmp   #1
         beq   checkVALID2
         cmp   coorX
         beq   checkVALID2

         lda   coorY      ; regarde si varY=1
         ora   currY
         cmp   #1
         beq   checkVALID2
         cmp   coorY
         beq   checkVALID2
         sec
         rts

checkVALID2 lda coorX
         cmp   currX
         beq   checkVALID4
         ldy   #1
         lda   coorY
         cmp   currY
         bne   checkVALID3
         lda   coorX
         sec
         sbc   currX
         cmp   #1
         beq   checkVALID5
         ldy   #0
         lda   coorY
         cmp   currY
         bne   checkVALID3
         lda   currX
         sec
         sbc   coorX
         cmp   #1
         beq   checkVALID5
checkVALID3 sec
         rts

checkVALID4 lda coorY
         cmp   currY
         beq   checkVALID3
         ldy   #3
         lda   coorX
         cmp   currX
         bne   checkVALID3
         lda   coorY
         sec
         sbc   currY
         cmp   #1
         beq   checkVALID5
         ldy   #2
         lda   coorX
         cmp   currX
         bne   checkVALID3
         lda   currY
         sec
         sbc   coorY
         cmp   #1
         beq   checkVALID5
         sec
         rts

checkVALID5 sty theDIR
         clc
         rts

*--------------------------------------
* Routines souris

moREAD   jsr   moTOOL

         sep   #$20
         ldal  $e0c034
         and   #$f0
         stal  $e0c034
         rep   #$20

         lda   moX
         cmp   oldMOx
         bne   moREAD1
         lda   moY
         cmp   oldMOy
         bne   moREAD1
         rts

moREAD1  jsr   moBACK
         ldx   moX
         stx   oldMOx
         ldy   moY
         sty   oldMOy
         jsr   moFORE
         rts

*--------------------------------------

moCONTROL lda  window
         asl
         tax
         lda   windowS+2,x
         asl
         pha
         lda   windowS,x
         asl
         tax

moCONTROL1 lda moX
         cmp   windowL,x
         bcc   moCONTROL2
         cmp   windowR,x
         bcs   moCONTROL2

         lda   moY
         cmp   windowU,x
         bcc   moCONTROL2
         cmp   windowD,x
         bcc   moCONTROL3

moCONTROL2 inx
         inx
         txa
         cmp   1,s
         bcc   moCONTROL1
         ldx   #-1

moCONTROL3 pla

         lda   moBTN0
         and   #%00000000_11000000
         cmp   #%00000000_01000000
         beq   moCONTROL10
         cmp   #%00000000_10000000
         beq   moCONTROL20
         cmp   #%00000000_11000000
         bne   moCONTROL4
         brl   moCONTROL30
moCONTROL4 sec
         rts

*- is up, was down

moCONTROL10 cpx #-1
         bne   moCONTROL12
         ldx   windowC
         lda   windowFLG,x
         and   #%00000000_00000010
         bne   moCONTROL11
         lda   windowFLG,x
         and   #%00000000_00000001
         beq   moCONTROL11
         lda   windowFLG,x
         and   #%11111111_11111110
         sta   windowFLG,x
         ldy   #0
         jsr   inverseIT
moCONTROL11 sec           ; not same control
         rts
moCONTROL12 cpx windowC
         bne   moCONTROL11
         lda   windowFLG,x
         and   #%00000000_00000010
         bne   moCONTROL11
         lda   windowFLG,x
         and   #%00000000_00000001
         beq   moCONTROL13
         lda   windowFLG,x
         and   #%11111111_11111110
         sta   windowFLG,x
         ldy   #0
         jsr   inverseIT
moCONTROL13 clc           ; same control
         rts

*- is down, was up

moCONTROL20 cpx #-1
         beq   moCONTROL21
         lda   windowFLG,x
         and   #%00000000_00000010
         bne   moCONTROL21
         stx   windowC
         lda   windowFLG,x
         and   #%00000000_00000001
         bne   moCONTROL21
         lda   windowFLG,x
         and   #%11111111_11111110
         ora   #%00000000_00000001
         sta   windowFLG,x
         ldy   #1
         jsr   inverseIT
moCONTROL21 sec           ; set new control
         rts

*- is down, was down

moCONTROL30 cpx windowC
         beq   moCONTROL32
         ldx   windowC
         cpx   #-1
         beq   moCONTROL31
         lda   windowFLG,x
         and   #%00000000_00000010
         bne   moCONTROL31
         lda   windowFLG,x
         and   #%00000000_00000001
         beq   moCONTROL31
         lda   windowFLG,x
         and   #%11111111_11111110
         sta   windowFLG,x
         ldy   #0
         jsr   inverseIT
moCONTROL31 sec           ; no more on control
         rts

moCONTROL32 cpx #-1
         beq   moCONTROL33
         lda   windowFLG,x
         and   #%00000000_00000010
         bne   moCONTROL33
         lda   windowFLG,x
         and   #%00000000_00000001
         bne   moCONTROL33
         lda   windowFLG,x
         and   #%11111111_11111110
         ora   #%00000000_00000001
         sta   windowFLG,x
         ldy   #1
         jsr   inverseIT
moCONTROL33 sec           ; same control
         rts

*--------------------------------------

moTOOL   ldal  $e0c026
         bpl   moTOOL1
         and   #%00000010_00000000
         beq   moTOOL2
         ldal  $e0c024
moTOOL1  rts

moTOOL2  ldal  $e0c024
         tax
         and   #%00000000_10000000
         eor   #%00000000_10000000
         lsr   moBTN1
         eor   moBTN1
         and   #%00000000_11000000
         sta   moBTN1

         ldal  $e0c024
         tay
         and   #%00000000_10000000
         eor   #%00000000_10000000
         lsr   moBTN0
         eor   moBTN0
         and   #%00000000_11000000
         sta   moBTN0

*- Occupe toi de X

         txa
         and   #%00000000_00111111
         pha
         txa
         and   #%00000000_01000000
         beq   moTOOL3

         lda   moX
         clc
         adc   1,s
         sec
         sbc   #64
         bcc   moTOOL4
         sta   moX
         bra   moTOOL4

moTOOL3  lda   moX
         clc
         adc   1,s
         cmp   #maximumX
         bcs   moTOOL4
         sta   moX

*- Occupe toi de Y

moTOOL4  pla              ; Recupere la pile

         tya
         and   #%00000000_00111111
         pha
         tya
         and   #%00000000_01000000
         beq   moTOOL6

         lda   moY
         clc
         adc   1,s
         sec
         sbc   #64
         bcc   moTOOL5
         sta   moY
moTOOL5  pla
         rts

moTOOL6  lda   moY
         clc
         adc   1,s
         cmp   #maximumY
         bcs   moTOOL7
         sta   moY
moTOOL7  pla
         rts

*--------------------------------------

moBACK   lda   oldMOx
         lsr
         pha

         lda   oldMOy
         asl
         tay
         lda   Ligne,y
         clc
         adc   1,s
         tax

         ldy   #0

moBACK1  lda   moDATA,y
         stal  $e12000,x
         lda   moDATA+2,y
         stal  $e12002,x
         lda   moDATA+4,y
         stal  $e12004,x

         txa
         clc
         adc   #160
         tax
         cpx   #$7d00
         bcs   moBACK2
         iny
         iny
         iny
         iny
         iny
         iny
         cpy   #36
         bne   moBACK1

moBACK2  pla
         rts

*--------------------------------------

moFORE   lda   #moDATA
         sta   moFORE3+1
         sta   moFORE4+1
         sta   moFORE5+1
         ldy   #0
         ldx   #36

         lda   moX
         lsr
         pha
         bcc   moFORE1

         lda   #moDATA
         sec
         sbc   #36
         sta   moFORE3+1
         sta   moFORE4+1
         sta   moFORE5+1
         ldy   #36
         ldx   #72

moFORE1  stx   moFORE6+1

         lda   moY
         asl
         tax
         lda   Ligne,x
         clc
         adc   1,s
         tax

moFORE2  ldal  $e12000,x
moFORE3  sta   moDATA,y
         and   moMASK,y
         ora   moSPRI,y
         stal  $e12000,x

         iny
         iny
         ldal  $e12002,x
moFORE4  sta   moDATA,y
         and   moMASK,y
         ora   moSPRI,y
         stal  $e12002,x

         iny
         iny
         ldal  $e12004,x
moFORE5  sta   moDATA,y
         and   moMASK,y
         ora   moSPRI,y
         stal  $e12004,x

         txa
         clc
         adc   #160
         tax
         cpx   #$7d00
         bcs   moFORE7

         iny
         iny
moFORE6  cpy   #-1
         bne   moFORE2

moFORE7  pla
         rts

*--------------------------------------

inverseIT cpx  #144*2
         bcs   inverseIT0

         lda   windowFLG,x
         and   #%00000000_00000100
         beq   inverseIT1
inverseIT0 rts

inverseIT1 phx

         txa
         sec
         sbc   #135*2
         tax

         cpy   #1
         beq   inverseIT2

         lda   windowNOR,x
         bra   inverseIT3

inverseIT2 lda windowINV,x

inverseIT3 clc
         adc   ptrSPRITE
         sta   Debut
         lda   ptrSPRITE+2
         adc   #0
         sta   Debut+2

         lda   windowSCR,x
         clc
         adc   #$2000
         sta   Arrivee
         lda   #$00e1
         sta   Arrivee+2

         lda   windowLR,x
         lsr
         sta   temp

         lda   windowUP,x
         sta   temp+2

         jsr   moBACK     ; restore background

inverseIT5 ldy #0
         sep   #$20
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         cpy   temp
         bne   ]lp
         rep   #$20

         lda   Debut
         clc
         adc   #160
         sta   Debut

         lda   Arrivee
         clc
         adc   #160
         sta   Arrivee
         cmp   #$9d00
         bcs   inverseIT6

         dec   temp+2
         lda   temp+2
         bpl   inverseIT5

inverseIT6 jsr moFORE     ; show cursor
         plx              ; pull X from stack

         rts

*--------------------------------------
* Fenetres

showMSG  lda   ptrSPRITE+1
         sta   showMSG3+2

         lda   adrMSG     ; adresse source
         clc
         adc   ptrSPRITE
         sta   showMSG3+1

         lda   adrMSGscr  ; adresse ecran
         sta   showMSG2+1
         sta   showMSG4+1

         lda   adrMSGx    ; nombre de points
         lsr
         sta   temp
         lda   adrMSGy    ; nombre de lignes
         sta   temp+2

         lda   ptrUNPACK
         sta   Debut
         lda   ptrUNPACK+2
         sta   Debut+2

         jsr   moBACK

         ldy   #0
showMSG1 ldx   #0
         sep   #$20
showMSG2 ldal  $e12000,x
         sta   [Debut],y
showMSG3 ldal  $e12000,x
showMSG4 stal  $e12000,x
         iny
         inx
         cpx   temp
         bcc   showMSG2
         rep   #$20

         lda   showMSG3+1
         clc
         adc   #160
         sta   showMSG3+1
         lda   showMSG3+2
         adc   #0
         sta   showMSG3+2

         lda   showMSG2+1
         clc
         adc   #160
         sta   showMSG2+1
         sta   showMSG4+1
         cmp   #$9d00
         bcs   showMSG5

         dec   temp+2
         lda   temp+2
         bpl   showMSG1

showMSG5 jsr   moFORE

         rts

*-------------------------- Redraw Fenetre

redrawMSG lda  adrMSGscr  ; adresse ecran
         sta   redrawMSG3+1

         lda   adrMSGx    ; nombre de points
         lsr
         sta   temp
         lda   adrMSGy    ; nombre de lignes
         sta   temp+2

         lda   ptrUNPACK
         sta   Debut
         lda   ptrUNPACK+2
         sta   Debut+2

         jsr   moBACK

         ldy   #0
redrawMSG1 ldx #0
         sep   #$20
redrawMSG2 lda [Debut],y
redrawMSG3 stal $e12000,x
         iny
         inx
         cpx   temp
         bcc   redrawMSG2
         rep   #$20

         lda   redrawMSG3+1
         clc
         adc   #160
         sta   redrawMSG3+1
         cmp   #$9d00
         bcs   redrawMSG4

         dec   temp+2
         lda   temp+2
         bpl   redrawMSG1

redrawMSG4 jsr moFORE

         rts

*--- Donnes fenetres

window   ds    2          ; numero de la fenetre active
windowC  dw    -1         ; numero du controle actif
windowS  dw    0          ; debut des boutons de la fenetre
         dw    140
         dw    142
         dw    144

windowL  dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    5,25,45,65,85,105,125,145,165,185,205,225,245,265,285
         dw    6,178,245,266,282
         dw    126,144
         dw    30,0

windowR  dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    24,44,64,84,104,124,144,164,184,204,224,244,264,284,304
         dw    39,236,260,274,313
         dw    193,175
         dw    46,319

windowU  dw    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         dw    20,20,20,20,20,20,20,20,20,20,20,20,20,20,20
         dw    40,40,40,40,40,40,40,40,40,40,40,40,40,40,40
         dw    60,60,60,60,60,60,60,60,60,60,60,60,60,60,60
         dw    80,80,80,80,80,80,80,80,80,80,80,80,80,80,80
         dw    100,100,100,100,100,100,100,100,100,100,100,100,100,100,100
         dw    120,120,120,120,120,120,120,120,120,120,120,120,120,120,120
         dw    140,140,140,140,140,140,140,140,140,140,140,140,140,140,140
         dw    160,160,160,160,160,160,160,160,160,160,160,160,160,160,160
         dw    185,187,185,185,185
         dw    89,105
         dw    77,0

windowD  dw    19,19,19,19,19,19,19,19,19,19,19,19,19,19,19
         dw    39,39,39,39,39,39,39,39,39,39,39,39,39,39,39
         dw    59,59,59,59,59,59,59,59,59,59,59,59,59,59,59
         dw    79,79,79,79,79,79,79,79,79,79,79,79,79,79,79
         dw    99,99,99,99,99,99,99,99,99,99,99,99,99,99,99
         dw    119,119,119,119,119,119,119,119,119,119,119,119,119,119,119
         dw    139,139,139,139,139,139,139,139,139,139,139,139,139,139,139
         dw    159,159,159,159,159,159,159,159,159,159,159,159,159,159,159
         dw    179,179,179,179,179,179,179,179,179,179,179,179,179,179,179
         dw    195,193,195,195,195
         dw    99,115
         dw    88,199

*--- Flags des fenetres
* bit 0: windowFLG (old windowA)           -> 0
* bit 1: windowTGT (can't be target if 1)  -> 2
* bit 2: windowREF (can't refresh if 1)    -> 4

windowFLG dw   4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
         dw    0,0,0,0,0
         dw    0,0
         dw    4,4

*---

window2XY dw   $000,$001,$002,$003,$004,$005,$006,$007,$008,$009,$00a,$00b,$00c,$00d,$00e
         dw    $100,$101,$102,$103,$104,$105,$106,$107,$108,$109,$10a,$10b,$10c,$10d,$10e
         dw    $200,$201,$202,$203,$204,$205,$206,$207,$208,$209,$20a,$20b,$20c,$20d,$20e
         dw    $300,$301,$302,$303,$304,$305,$306,$307,$308,$309,$30a,$30b,$30c,$30d,$30e
         dw    $400,$401,$402,$403,$404,$405,$406,$407,$408,$409,$40a,$40b,$40c,$40d,$40e
         dw    $500,$501,$502,$503,$504,$505,$506,$507,$508,$509,$50a,$50b,$50c,$50d,$50e
         dw    $600,$601,$602,$603,$604,$605,$606,$607,$608,$609,$60a,$60b,$60c,$60d,$60e
         dw    $700,$701,$702,$703,$704,$705,$706,$707,$708,$709,$70a,$70b,$70c,$70d,$70e
         dw    $800,$801,$802,$803,$804,$805,$806,$807,$808,$809,$80a,$80b,$80c,$80d,$80e

coorX    ds    2
coorY    ds    2

*---

windowNOR dw   $73a3,$75d9,$741a,$7425,$742d
         dw    $24ef,$2ef8
windowINV dw   $6874,$6c47,$68a7,$68b9,$68d1
         dw    $608c,$6054
windowSCR dw   $73a3,$75d9,$741a,$7425,$742d
         dw    $37df,$41e8
windowLR dw    34,40,18,10,32
         dw    70,34
windowUP dw    10,4,10,10,10
         dw    10,10

*--- Adresses des fenetres

adrMSG   dw    $1cc0      ; adresse source
adrMSGscr dw   $4fb0      ; adresse ecran
adrMSGx  dw    128        ; nombre de colonnes
adrMSGy  dw    94-46      ; nombre de lignes

*--- Datas souris

moX      ds    2          ; coordonnee X
moY      ds    2          ; coordonnee Y
moBTN0   ds    2          ; bouton 0
moBTN1   ds    2          ; bouton 1
oldMOx   ds    2          ; ancienne coordonnee X
oldMOy   ds    2          ; ancienne coordonnee Y

moDATA   ds    36         ; buffer du fond de l'image

moSPRI   hex   FFFFFFFF0000 ; sprite pointeur pair
         hex   0F00000F0000
         hex   00F000F00000
         hex   000F00F00000
         hex   0000FF000000
         hex   00000F000000

         hex   0FFFFFFFF000 ; sprite pointeur impair
         hex   00F00000F000
         hex   000F000F0000
         hex   0000F00F0000
         hex   00000FF00000
         hex   000000F00000

moMASK   hex   00000000FFFF ; mask pointeur pair
         hex   F0000000FFFF
         hex   FF00000FFFFF
         hex   FFF0000FFFFF
         hex   FFFF00FFFFFF
         hex   FFFFF0FFFFFF

         hex   F00000000FFF ; mask pointeur impair
         hex   FF0000000FFF
         hex   FFF00000FFFF
         hex   FFFF0000FFFF
         hex   FFFFF00FFFFF
         hex   FFFFFF0FFFFF
