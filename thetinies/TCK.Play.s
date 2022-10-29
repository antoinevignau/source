*--------------------------------------*
*                                      *
*  Tinies Contruction Kit: Test level  *
*                                      *
*     (c) 01/1995 by Brutal Deluxe     *
*                                      *
*--------------------------------------*

scrMINU  =     $9818
scrSECO  =     $9824
scrLEVEL =     $9844
scrLIFE  =     $9868
scrJOKER =     $988c

*--------------------------------------

tiniesPLAY lda #-1
         sta   fgCURS

         sei
         stz   fgBUG

         PushLong #intTIME
         _SetHeartBeat
         PushLong #intANIM
         _SetHeartBeat

         cli

         stz   life
         stz   joker

         stz   curX
         stz   curY

         stz   fgLOST
         stz   arrTINYcur
         stz   doMAIN2+1
         stz   intANIM4+1

         lda   ptrBACK+1
         sta   intANIM17+2
         sta   hideCURS1+2
         sta   hideCURS3+2
         sta   hideCURS4+2
         sta   esprit8+2
         clc
         adc   #$000e
         sta   hideCURS2+2

         jsr   decodeALL

         lda   anNUMBER
         bne   tiniesPLAY1
         jmp   lostLEVEL1

tiniesPLAY1 lda ptrBACK+1
         ldy   #0
         jsr   fadeIN

         jsr   affALL

         lda   #1
         sta   fgBUG

*-------------------------------------- Gere le curseur

gereCURS lda   fgLOST
         bne   gereCURS0

         ldx   curX
         ldy   curY
         jsr   showCURS   ; Show curseur
         jsr   gereKEY    ; gere les touches
         bcs   gereCURS   ; aucun deplacement
         cmp   #-1        ; 'esc' hit
         bne   gereCURS1
gereCURS0 jmp  lostLEVEL

gereCURS1 pha             ; Efface le curseur
         ldx   curX
         ldy   curY
         jsr   hideCURS

         pla
         bne   gereCURS2

         ldx   curX
         ldy   curY
         jsr   calcWHAT
         lda   plateau3,x
         cmp   #4
         bcs   gereCURS
         stz   fgCURS
         brl   doTINIES   ; On gere les Tinies

gereCURS2 cmp  #1         ; Left
         bne   gereCURS4

         lda   curX
         beq   gereCURS3
         dec
         sta   curX
gereCURS3 brl  gereCURS

gereCURS4 cmp  #2         ; Right
         bne   gereCURS6

         lda   curX
         cmp   #12
         beq   gereCURS5
         inc
         sta   curX
gereCURS5 brl  gereCURS

gereCURS6 cmp  #3         ; Up
         bne   gereCURS8

         lda   curY
         beq   gereCURS7
         dec
         sta   curY
gereCURS7 brl  gereCURS

gereCURS8 cmp  #4         ; Down
         bne   gereCURS9

         lda   curY
         cmp   #7
         beq   gereCURS9
         inc
         sta   curY
gereCURS9 brl  gereCURS

*-------------------------------------- Gere les Tinies

doTINIES sta   espCOL     ; couleur du Tiny

         ldx   curX
         ldy   curY
         jsr   calcWHAT
         stx   curXY

         lda   curX
         sta   oldX
         lda   curY
         sta   oldY
         lda   curXY
         sta   oldXY

         ldx   anNUMBER   ; Met le Tiny inactif
]lp      lda   anOBJET,x
         cmp   espCOL
         bne   doTINIES1
         lda   anCOORD,x
         cmp   curXY
         beq   doTINIES2
doTINIES1 dex
         dex
         bpl   ]lp
         ldx   anNUMBER
doTINIES2 stx  myNUMBER   ; Sauve X pour plus tard
         stz   anANIM,x
         stz   anACTIF,x

         stz   compteur2  ; Affiche le Tiny qui attend de bouger
         lda   #anBougDr
         ldx   curXY
         ldy   ptrBOUGE+1
         jsr   esprit

*--------------------------------------

doMAIN   lda   fgLOST
         beq   doMAIN1
         jmp   lostLEVEL

doMAIN1  lda   arrTINYcur ; etait-ce un tiny en cours?
         beq   doMAIN2

         ldx   arrNUMBER
         lda   oldXY
         sta   anCOORD,x
         lda   #-1
         sta   anACTIF,x

         lda   arrCOL
         sta   espCOL
         lda   arrXY
         sta   curXY
         sta   oldXY
         lda   arrX
         sta   curX
         sta   oldX
         lda   arrY
         sta   curY
         sta   oldY
         stz   arrTINYcur

doMAIN2  ldx   #0         ; est-ce que l'on a un tiny sur fleche?
         lda   plateau4,x
         inx
         inx
         stx   doMAIN2+1
         cpx   #208
         bne   doMAIN3
         stz   doMAIN2+1
         brl   doMAIN6

doMAIN3  cmp   #-1
         beq   doMAIN2

         ldy   espCOL
         sty   arrCOL
         sta   espCOL

         dex
         dex
         lda   #-1
         sta   plateau4,x

         lda   curXY
         sta   arrXY
         lda   curX
         sta   arrX
         lda   curY
         sta   arrY

         stx   curXY

         lda   tblXY,x
         pha
         and   #$ff00
         xba
         sta   curX
         pla
         and   #$00ff
         sta   curY

         lda   #-1
         sta   arrTINYcur

         txy
         ldx   anNUMBER   ; Met le Tiny inactif
]lp      lda   anOBJET,x
         cmp   espCOL
         bne   doMAIN4
         lda   anCOORD,x
         cmp   curXY
         beq   doMAIN5
doMAIN4  dex
         dex
         bpl   ]lp
         ldx   anNUMBER
doMAIN5  stx   arrNUMBER  ; Sauve X pour plus tard
         stz   anACTIF,x

         lda   plateau2,y
         sec
         sbc   #24
         asl
         tax
         lda   spyDIR2,x
         bra   doMAIN9

*---

doMAIN6  jsr   gereKEY
         bcc   doMAIN7
         brl   doMAIN
doMAIN7  cmp   #-1
         bne   doMAIN8
         jmp   lostLEVEL

doMAIN8  cmp   #0         ; Deselectionne
         bne   doMAIN9

         lda   #-1
         sta   fgCURS
         brl   itsEND

doMAIN9  sta   tinyDIR
         stz   tinyMOVE   ; a pas bouge
         stz   tinyROULE  ; roule pas

doMAIN10 ldal  $e0bfff
         bpl   doMAIN12
         xba
         and   #$ff
         cmp   #$9b
         bne   doMAIN12
         jmp   lostLEVEL

doMAIN12 lda   fgLOST
         beq   doMAIN13
         jmp   lostLEVEL

doMAIN13 lda   curX
         sta   oldX
         lda   curY
         sta   oldY
         lda   curXY
         sta   oldXY

         ldx   curXY      ; Sommes-nous sur une fleche ?
         lda   plateau2,x ; empeche le joueur de partir
         cmp   #24        ; de la fleche
         bcc   doMAIN14
         cmp   #28
         bcs   doMAIN14
         sec
         sbc   #24
         asl
         tax
         lda   spyDIR2,x
         sta   tinyDIR

doMAIN14 jsr   calcDIR    ; regarde la nouvelle position
         cmp   #-1
         bne   doMOVE

         jsr   doBOOM     ; boom...
         brl   doMAIN

*--------------------------------------

doMOVE   ldx   curX       ; Regarde ce qu'il y a sur la nouvelle
         ldy   curY       ; position
         jsr   calcWHAT
         stx   curXY

         lda   plateau1,x ; is there a sol
         cmp   #5
         bcc   doMOVE2

doMOVE1  lda   oldX
         sta   curX
         lda   oldY
         sta   curY
         lda   oldXY
         sta   curXY

         jsr   doBOOM
         brl   doMAIN

*---

doMOVE2  lda   plateau3,x ; is there a tiny
         cmp   #-1
         beq   doMOVE3

         ldx   oldXY      ; Is Tiny on Arrow ?
         lda   plateau2,x
         cmp   #24
         bcc   doMOVE1
         cmp   #28
         bcs   doMOVE1

         lda   espCOL
         sta   plateau4,x

         lda   oldX
         sta   curX
         lda   oldY
         sta   curY
         lda   oldXY
         sta   curXY
         brl   doMAIN

doMOVE3  lda   plateau2,x ; animation
         sta   tinyDEC
         cmp   #-1
         bne   move1
         brl   moveSHOW

*---

move1    cmp   #4         ; tiny
         bcs   move2
         jsr   doBOOM
         brl   doMAIN

move2    cmp   #8         ; sleeper
         bcs   move3
         jsr   doSLEEP
         brl   moveSHOW

move3    cmp   #12        ; teleporteur
         bcs   move5
         jsr   doTELE
         bcc   move4
         brl   moveSHOW2
move4    brl   moveSHOW3

move5    cmp   #16        ; bombe
         bcs   move6
         jsr   doBOMB
         brl   moveSHOW2

move6    cmp   #20        ; porte
         bcs   move8
         jsr   doDOOR
         bcc   move7
         brl   doMOVE1
move7    brl   moveSHOW

move8    cmp   #24        ; interrupteur
         bcs   move9
         jsr   doINTE
         brl   moveSHOW

move9    cmp   #28        ; fleche
         bcs   move10
         jsr   doFLEC
         brl   moveSHOW2

move10   cmp   #28        ; bumper
         bne   move11
         jsr   doBUMP
         brl   moveSHOW

move11   cmp   #29        ; bonus temps
         bne   move12
         jsr   doTIM
         brl   moveSHOW

move12   cmp   #30        ; life
         bne   move13
         jsr   doLIF
         brl   moveSHOW

move13   cmp   #31        ; joker
         bne   move14
         jsr   doJOK
         brl   moveSHOW

move14   cmp   #32        ; animation fixe
         bne   moveSHOW
         jsr   doBOOM
         brl   doMAIN

*---

moveSHOW jsr   doSHOW

moveSHOW2 ldx  oldXY
         lda   #-1
         sta   plateau3,x
moveSHOW3 ldx  curXY
         lda   espCOL
         sta   plateau3,x

         lda   #1
         sta   tinyMOVE
         brl   doMAIN10

*-------------------------------------- Teste la fin de niveau

itsEND   ldx   anNUMBER   ; Regarde si sous le Tiny
]lp      lda   anCOORD,x  ; on n'aurait pas un sleeper
         cmp   oldXY
         bne   itsEND1
         lda   anOBJET,x
         sec
         sbc   espCOL
         cmp   #4
         beq   itsEND3
itsEND1  dex
         dex
         bpl   ]lp

itsEND2  ldx   myNUMBER   ; No sleeper under
         lda   #-1
         sta   anACTIF,x
         lda   oldXY
         sta   anCOORD,x
         brl   gereCURS

itsEND3  lda   anACTIF2,x ; Sleeper was active ?
         beq   itsEND2

         ldx   myNUMBER   ; Tiny now sleeps
         lda   #$2222
         sta   anACTIF,x
         lda   oldXY
         sta   anCOORD,x

         ldx   anNUMBER
         dex              ; Regarde, s'ils dorment tous
         dex
]lp      lda   anOBJET,x
         cmp   #4
         bcs   itsEND4
         lda   anACTIF,x
         cmp   #$2222
         bne   itsEND5
itsEND4  dex
         dex
         bpl   ]lp
         jmp   lostLEVEL
itsEND5  brl   gereCURS

*---

lostLEVEL lda  #2
         jsr   nowWAIT

lostLEVEL1 sei
         stz   fgBUG

         PushLong #intANIM
         _DelHeartBeat
         PushLong #intTIME
         _DelHeartBeat

         cli

         jmp   LP4

*-------------------------------------- Affiche le Tiny

doSHOW   stz   compteur2
         lda   tinyDIR
         dec
         asl
         clc
         adc   tinyROULE
         tax
         lda   chseBOUG,x
         ldy   ptrBACK+1
         jsr   moveIT

         ldx   anNUMBER   ; Regarde si sous le Tiny (pos. precedente)
]lp      lda   anCOORD,x  ; on n'aurait pas un sleeper
         cmp   oldXY
         bne   doSHOW1
         lda   anOBJET,x
         cmp   #4
         bcc   doSHOW1
         cmp   #8
         bcc   doSHOW2
doSHOW1  dex
         dex
         bpl   ]lp
         rts
doSHOW2  lda   anACTIF2,x
         sta   anACTIF,x
         stz   anANIM,x
         rts

*--- Boom

doBOOM   lda   tinyROULE
         bne   doBOOM1
         lda   tinyMOVE
         beq   doBOOM1
         rts

doBOOM1  lda   #99
         sta   compteur2
         lda   tinyDIR
         dec
         asl
         tax
         lda   chseBOOM,x
         ldx   curXY
         ldy   ptrTINY1+1
         jsr   esprit
         rts

*--- Sleep

doSLEEP  ldx   anNUMBER   ; Regarde si sous le Tiny
]lp      lda   anCOORD,x  ; on n'aurait pas un sleeper
         cmp   curXY
         bne   doSLEEP1
         lda   anOBJET,x
         cmp   #4
         bcc   doSLEEP1
         cmp   #8
         bcc   doSLEEP2
doSLEEP1 dex
         dex
         bpl   ]lp
         rts
doSLEEP2 lda   anACTIF,x
         sta   anACTIF2,x
         stz   anACTIF,x
         stz   anANIM,x
         rts

*--- Tele

doTELE   jsr   doSHOW

         lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #8
         beq   doTELE1

         sec
         rts

doTELE1  ldx   oldXY
         lda   #-1
         sta   plateau3,x

         ldx   #206
]lp      lda   plateau2,x
         cmp   tinyDEC
         bne   doTELE2
         cpx   curXY
         bne   doTELE3
doTELE2  dex
         dex
         bpl   ]lp
         rts

doTELE3  lda   plateau3,x
         cmp   #-1
         beq   doTELE4
         rts

doTELE4  lda   curXY
         sta   oldXY
         stx   curXY

         lda   #99
         sta   compteur2

         lda   tinyDIR
         dec
         asl
         tax
         lda   chseTELE,x
         ldx   oldXY
         ldy   ptrGADGET2+1
         jsr   esprit

         ldx   curXY
         stx   oldXY
         lda   tblXY,x
         pha
         and   #$ff00
         xba
         sta   curX
         sta   oldX
         pla
         and   #$00ff
         sta   curY
         sta   oldY

         lda   tinyDIR
         dec
         asl
         tax
         lda   chseTELE2,x
         ldx   curXY
         ldy   ptrGADGET2+1
         jsr   esprit

         jsr   doSHOW

         lda   #8
         sta   tinyROULE
         clc
         rts

*--- Bomb

doBOMB   jsr   doSHOW

         lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #12
         beq   doBOMB1

         rts

doBOMB1  lda   #99
         sta   compteur2

         lda   #anEXPL1
         ldx   curXY
         ldy   ptrTINY1+1
         jsr   esprit

         ldx   curXY
         lda   plateau1,x
         jsr   sprite

         lda   #anEXPL2
         ldx   curXY
         ldy   ptrTINY1+1
         jsr   esprit

         lda   joker
         bne   doBOMB2
         jmp   lostLEVEL

doBOMB2  dec   joker

         jsr   affALL

         lda   #anJOKER
         ldx   curXY
         ldy   ptrGADGET3+1
         jsr   esprit

         stz   tinyROULE

         ldx   curXY
         lda   #-1
         sta   plateau2,x
         rts

*--- Door

doDOOR   lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #16
         beq   doDOOR1

         sec
         rts

doDOOR1  lda   #99
         sta   compteur2

         lda   #anDOOR
         ldx   curXY
         ldy   ptrGADGET3+1
         jsr   esprit

         lda   espCOL
         asl
         tax
         lda   anOPEN,x
         clc
         adc   ptrGADGET3
         ldx   curXY
         jsr   sprite10

         ldx   curXY
         lda   #-1
         sta   plateau2,x
         clc
         rts

*--- Inte

doINTE   lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #20
         beq   doINTE1
         rts

doINTE1  ldx   anNUMBER
]lp      lda   anOBJET,x
         sec
         sbc   espCOL
         cmp   #4
         bne   doINTE2
         lda   #-1
         sta   anACTIF,x
         sta   anACTIF2,x
         stz   anANIM,x
doINTE2  dex
         dex
         bpl   ]lp

         lda   espCOL
         asl
         tax
         lda   anINTE,x
         clc
         adc   ptrGADGET3
         ldx   curXY
         jsr   sprite10

         rts

*--- Arrow

doFLEC   jsr   doSHOW

doFLEC1  ldx   curXY
         lda   plateau2,x
         sec
         sbc   #24

         asl
         tax
         lda   spyDIR2,x
         sta   tinyDIR

         rts

*--- Bump

doBUMP   lda   #99
         sta   compteur2

         stz   esprit4+1

         lda   tinyDIR
         dec
         asl
         tax
         lda   chseBUMP,x
         ldx   curXY
         ldy   ptrTINY1+1
         jsr   esprit

         lda   tinyDIR
         dec
         asl
         tax
         lda   chseBOOM,x
         ldx   oldXY
         ldy   ptrTINY1+1
         jsr   esprit

         lda   #10
         sta   esprit4+1
         lda   #1
         sta   tinyMOVE
         lda   #8
         sta   tinyROULE

         lda   tinyDIR    ; change la direction du Tiny
         dec
         asl
         tax
         lda   spyDIR,x
         sta   tinyDIR

         lda   oldX
         sta   curX
         lda   oldY
         sta   curY
         lda   oldXY
         sta   curXY

         rts

*--- Time, Life and Joker

doTIM    inc   minutes
         bra   doCLR

doLIF    inc   life
         bra   doCLR

doJOK    inc   joker

doCLR    ldx   curXY
         lda   plateau1,x
         jsr   sprite

         ldx   curXY
         lda   #-1
         sta   plateau2,x

         jsr   affALL

         rts

*-------------------------------------- Deplacement

calcDIR  lda   tinyDIR    ; left
         cmp   #1
         bne   calcDIR2
         lda   curX
         bne   calcDIR1
         lda   #-1
         rts
calcDIR1 dec   curX
         rts

calcDIR2 cmp   #2         ; right
         bne   calcDIR4
         lda   curX
         cmp   #12
         bne   calcDIR3
         lda   #-1
         rts
calcDIR3 inc   curX
         rts

calcDIR4 cmp   #3         ; up
         bne   calcDIR6
         lda   curY
         bne   calcDIR5
         lda   #-1
         rts
calcDIR5 dec   curY
         rts

calcDIR6 lda   curY       ; down
         cmp   #7
         bne   calcDIR7
         lda   #-1
         rts
calcDIR7 inc   curY
         rts

*---

calcWHAT txa              ; calcule adresse plateau
         asl
         asl
         asl
         asl
         pha
         tya
         asl
         clc
         adc   1,s
         tax
         pla
         rts

*-------------------------------------- Clavier

gereKEY  ldal  $e0bfff    ; lit le clavier
         bpl   gereKEY7
         stal  $e0c010
         xba
         and   #$00ff
         cmp   #$009b
         bne   gereKEY1
         lda   #-1
         clc
         rts
gereKEY1 cmp   keyPREF    ; Select ??
         bne   gereKEY3
         lda   #0
         clc
         rts
gereKEY3 cmp   keyPREF+2  ; left ??
         bne   gereKEY4
         lda   #1
         clc
         rts
gereKEY4 cmp   keyPREF+4  ; right ??
         bne   gereKEY5
         lda   #2
         clc
         rts
gereKEY5 cmp   keyPREF+6  ; up ??
         bne   gereKEY6
         lda   #3
         clc
         rts
gereKEY6 cmp   keyPREF+8  ; down ??
         bne   gereKEY7
         lda   #4
         clc
         rts
gereKEY7 sec
         rts

*-------------------------------------- Decodage

decodeALL jsr  clrECRAN

         ldx   #0
         lda   #-1
]lp      sta   plateau2,x
         sta   plateau3,x
         sta   plateau4,x
         inx
         inx
         cpx   #208
         bne   ]lp

         lda   #plateau5
         sta   Debut
         lda   #^plateau5
         sta   Debut+2

         ldy   #0
         tyx
decodeALL1 phx
         phy
         lda   [Debut],y
         and   #$00ff
         sta   plateau1,x
         cmp   #$00ff
         beq   decodeALL2

         jsr   sprite

decodeALL2 ply
         iny
         plx
         inx
         inx
         cpx   #208
         bne   decodeALL1

         lda   Debut
         clc
         adc   #104
         sta   Debut

         ldy   #0
         tyx
decodeALL3 phx
         phy
         lda   [Debut],y
         and   #$00ff
         cmp   #$00ff
         beq   decodeALL5
         cmp   #0004
         bcs   decodeALL4
         sta   plateau3,x
         lda   #-1
         sta   plateau2,x
         bra   decodeALL5
decodeALL4 sta plateau2,x
         cmp   #32
         bne   decodeALL40
         pha
         lda   #-1
         sta   plateau1,x
         pla

decodeALL40 clc
         adc   #21
         jsr   sprite

decodeALL5 ply
         iny
         plx
         inx
         inx
         cpx   #208
         bne   decodeALL3

*---

         ldx   #208-2     ; Animation
         lda   #$5555
]lp      sta   anOBJET,x
         sta   anACTIF,x
         sta   anCOORD,x
         sta   anANIM,x
         sta   anACTIF2,x
         dex
         dex
         bpl   ]lp

         ldy   #0
         tyx
]lp      lda   [Debut],y
         and   #$00ff
         cmp   #$00ff
         beq   decodeALL7
         cmp   #32
         beq   decodeALL6
         cmp   #8
         bcs   decodeALL7

decodeALL6 sta anOBJET,x
         stz   anANIM,x
         lda   #-1
         sta   anACTIF,x
         sta   anACTIF2,x
         tya
         asl
         sta   anCOORD,x
         inx
         inx

decodeALL7 iny
         cpy   #104
         bne   ]lp

         stx   anNUMBER

         ldy   #0
decodeALL8 lda [Debut],y
         and   #$00ff
         cmp   #0020
         bcc   decodeALL10
         cmp   #0024
         bcs   decodeALL10

         sec
         sbc   #0016
         ldx   anNUMBER
]lp      cmp   anOBJET,x
         bne   decodeALL9
         stz   anACTIF,x
         stz   anACTIF2,x
decodeALL9 dex
         dex
         bpl   ]lp

decodeALL10 iny
         cpy   #104
         bne   decodeALL8

         rts

*-------------------------------------- Routines graphiques

showCURS txa
         asl
         tax
         lda   scrX,x
         pha
         tya
         asl
         tay
         lda   scrY,y
         clc
         adc   1,s
         tax              ; en X, adresse ecran
         pla

         lda   fgCURS
         cmp   #-1
         beq   showCURS1
         rts

showCURS1 lda  cursL
         stal  $012002,x
         stal  $012e62,x
         lda   cursL+2
         stal  $012004,x
         stal  $012e64,x
         lda   cursL+4
         stal  $012006,x
         stal  $012e66,x
         lda   cursL+6
         stal  $012008,x
         stal  $012e68,x
         lda   cursL+8
         stal  $01200a,x
         stal  $012e6a,x
         lda   cursL+10
         stal  $01200c,x
         stal  $012e6c,x

         ldy   #0
]lp      sep   #$20
         ldal  $0120a2,x
         and   cursMSK1,y
         ora   cursCOL1,y
         stal  $0120a2,x
         ldal  $0120ad,x
         and   cursMSK2,y
         ora   cursCOL2,y
         stal  $0120ad,x
         rep   #$20
         txa
         clc
         adc   #$a0
         tax
         iny
         cpy   #22
         bne   ]lp
         rts

*---

hideCURS txa
         asl
         tax
         lda   scrX,x
         pha
         tya
         asl
         tay
         lda   scrY,y
         clc
         adc   1,s
         tax              ; en X, adresse ecran
         pla
         phx

         ldy   #$0a
hideCURS1 ldal $110002,x
         stal  $012002,x
hideCURS2 ldal $110e62,x
         stal  $012e62,x
         inx
         inx
         dey
         dey
         bpl   hideCURS1

         plx
         ldy   #0
]lp      sep   #$20
hideCURS3 ldal $1100a2,x
         stal  $0120a2,x
hideCURS4 ldal $1100ad,x
         stal  $0120ad,x
         rep   #$20
         txa
         clc
         adc   #$a0
         tax
         iny
         cpy   #22
         bne   ]lp
         rts

*--- Effacement de l'ecran

clrECRAN lda   ptrBACK
         sta   Arrivee
         lda   ptrBACK+2
         sta   Arrivee+2

         ldy   #0
         tya
]lp      sta   [Arrivee],y
         iny
         iny
         cpy   #$7e00
         bne   ]lp

         lda   ptrNIV     ; Met la palette
         sta   Debut
         lda   ptrNIV+2
         sta   Debut+2

         ldy   #$7e00
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         bpl   ]lp
         rts

*--- Routine col/col

moveIT   sta   moveIT2+1

         sty   moveIT6+2  ; page 2

         lda   ptrBOUGE+1
         sta   moveIT5+2

         ldx   oldXY
         cpx   curXY
         bne   moveIT1
         rts

moveIT1  lda   scrCASE,x
         clc
         adc   #$2
         sta   espECR
         clc
         adc   #$2000
         sta   espSCR

moveIT2  lda   $ffff      ; Lit adresse sprite source
         clc
         adc   ptrBOUGE
         sta   moveIT5+1

         inc   moveIT2+1
         inc   moveIT2+1

         lda   tinyDIR    ; En fonction de la direction
         dec
         asl              ; calcule les bonnes coordonnees
         tax
         lda   tinyHOW,x
         sta   moveIT12+1
         lda   tinyCALC,x
         pha
         clc
         adc   espECR
         sta   espECR
         clc
         adc   ptrBACK
         sta   moveIT6+1

         pla
         clc
         adc   espSCR
         sta   espSCR
         sta   moveIT8+1

         lda   espCOL     ; couleur du Tinie
         asl
         tax
         lda   anDRAW,x
         sta   moveIT7+1

         ldx   #2
]lp      wai
         dex
PATCH    bpl   ]lp

         lda   #23
         sta   compteur3
moveIT3  sep   #$20
moveIT4  ldx   #0
moveIT5  ldal  $110000,x  ; data
         tay
moveIT6  ldal  $e12000,x
         and   tblMASK,y  ; MASK
moveIT7  ora   tblGRE,y   ; pour couleur
moveIT8  stal  $012000,x
         inx
moveIT9  cpx   #12
         bne   moveIT5

         rep   #$20
         lda   moveIT4+1
         clc
         adc   #160
         sta   moveIT4+1
         clc
         adc   #12
         sta   moveIT9+1
         dec   compteur3
         lda   compteur3
         bpl   moveIT3

         stz   moveIT4+1
         lda   #12
         sta   moveIT9+1

         lda   tinyDIR     ; Maintenant efface
         dec
         pha
         asl
         tax
         lda   tinyCALC2,x
         clc
         adc   espECR
         tax
         pla
         cmp   #2
         bcs   moveIT10
         jsr   clrLR
         bra   moveIT11
moveIT10 jsr   clrUD

moveIT11 inc   compteur2
         lda   compteur2
moveIT12 cmp   #8
         beq   moveIT13
         brl   moveIT2
moveIT13 rts

*--- Efface les colonnes

clrLR    txa
         clc
         adc   ptrBACK
         sta   Second
         lda   ptrBACK+2
         sta   Second+2

         txa
         clc
         adc   #$2000
         sta   Third
         lda   #$0001
         sta   Third+2

         ldy   #0
]lp      lda   [Second],y
         sta   [Third],y
         iny
         lda   [Second],y
         sta   [Third],y
         dey
         tya
         clc
         adc   #160
         tay
         cpy   #24*160
         bne   ]lp
         rts

*--- Efface les lignes

clrUD    txa
         clc
         adc   ptrBACK
         sta   Second
         lda   ptrBACK+2
         sta   Second+2

         txa
         clc
         adc   #$2000
         sta   Third
         lda   #$0001
         sta   Third+2

         ldx   #3
         brl   sprite2

*--- Best routine pour afficher un sprite

esprit   pha
         lda   scrCASE,x
         sta   espECR
         pla
esprit1  sta   esprit2+1  ; Adresse table d'animation
         sty   espADR+1
         sty   esprit7+2

esprit2  lda   $ffff      ; adresse source de la table d'animation
         cmp   #-1
         bne   esprit3
         rts

esprit3  clc
         adc   espADR
         sta   esprit7+1

esprit4  ldx   #9
]lp      wai
         dex
         bpl   ]lp

         stz   esprit6+1
         lda   #12
         sta   esprit11+1

         lda   espECR     ; prend adresse ecran
         clc
         adc   #2
         adc   ptrBACK
         sta   esprit8+1

         lda   espECR
         clc
         adc   #$2002
         sta   esprit10+1

         lda   espCOL     ; couleur du Tiny
         asl
         tax
         lda   anDRAW,x
         sta   esprit9+1

         lda   esprit2+1  ; next one
         inc
         inc
         sta   esprit2+1

         lda   #23
         sta   compteur3

esprit5  sep   #$20
esprit6  ldx   #0
esprit7  ldal  $110000,x  ; data
         tay
esprit8  ldal  $e12000,x
         and   tblMASK,y  ; MASK
esprit9  ora   tblGRE,y   ; pour couleur
esprit10 stal  $012000,x
         inx
esprit11 cpx   #12
         bne   esprit7

         rep   #$20
         lda   esprit6+1
         clc
         adc   #160
         sta   esprit6+1
         clc
         adc   #12
         sta   esprit11+1
         dec   compteur3
         lda   compteur3
         bpl   esprit5

         dec   compteur2
         lda   compteur2
         bmi   esprit12
         brl   esprit2
esprit12 rts

*--- Routine pour afficher un sprite

sprite10 sta   Second
         lda   ptrGADGET3+2
         sta   Second+2

         bra   sprite1

*--- Routine pour afficher un sprite

sprite   asl
         tay

         lda   scrNIV,y
         tay
         clc
         adc   ptrNIV
         sta   Second
         lda   ptrNIV+2
         sta   Second+2

sprite1  lda   scrCASE,x
         clc
         adc   #$0002
         clc
         adc   ptrBACK
         sta   Third
         lda   ptrBACK+2
         sta   Third+2

         ldx   #23
sprite2  ldy   #0
]lp      lda   [Second],y
         sta   [Third],y
         iny
         iny
         lda   [Second],y
         sta   [Third],y
         iny
         iny
         lda   [Second],y
         sta   [Third],y
         iny
         iny
         lda   [Second],y
         sta   [Third],y
         iny
         iny
         lda   [Second],y
         sta   [Third],y
         iny
         iny
         lda   [Second],y
         sta   [Third],y

         tya
         clc
         adc   #160-10
         tay

         dex
         bpl   ]lp
         rts

*-------------------------------------- Affichage d'un texte

printIT  sta   printIT1+1
         stx   Arrivee+2
         sty   Arrivee

printIT1 lda   $ffff
         and   #$00ff
         bne   printIT2
         rts
printIT2 pha
         inc   printIT1+1

         ldy   #99
]lp      lda   tblFNT8,y
         and   #$00ff
         cmp   1,s
         beq   printIT3
         dey
         bpl   ]lp
         iny

printIT3 pla
         tya
         asl
         tay
         lda   adrFNT8,y
         clc
         adc   ptrFONTE
         sta   Debut
         lda   ptrFONTE+2
         sta   Debut+2

         ldx   #0007
         ldy   #0000
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         lda   [Debut],y
         sta   [Arrivee],y

         tya
         clc
         adc   #160-2
         tay

         dex
         bpl   ]lp

         lda   Arrivee
         clc
         adc   #4
         sta   Arrivee
         brl   printIT1

*-------------------------------------- Affichage des donnees

putTIM   ldx   minutes
         lda   scdVAR,x
         and   #$00ff
         pha
         and   #$00f0
         asl
         asl
         asl
         asl
         ora   #$b000
         sta   strMINU
         pla
         and   #$000f
         ora   #$00b0
         ora   strMINU
         xba
         sta   strMINU

         ldx   secondes
         lda   scdVAR,x
         and   #$00ff
         pha
         and   #$00f0
         asl
         asl
         asl
         asl
         ora   #$b000
         sta   strSECO
         pla
         and   #$000f
         ora   #$00b0
         ora   strSECO
         xba
         sta   strSECO
         rts

*---

putLVL   ldx   level
         cpx   #100
         bne   putLVL1

         lda   #"()"
         bne   putLVL2

putLVL1  lda   scdVAR,x
         and   #$00ff
         pha
         and   #$00f0
         asl
         asl
         asl
         asl
         ora   #$b000
         sta   strLEVEL
         pla
         and   #$000f
         ora   #$00b0
         ora   strLEVEL
         xba
putLVL2  sta   strLEVEL
         rts

*---

putLIFE  ldx   life
         cpx   #99
         bcc   putLIFE1
         ldx   #99
putLIFE1 lda   scdVAR,x
         and   #$00ff
         pha
         and   #$00f0
         asl
         asl
         asl
         asl
         ora   #$b000
         sta   strLIFE
         pla
         and   #$000f
         ora   #$00b0
         ora   strLIFE
         xba
         sta   strLIFE
         rts

*---

putJOKER ldx   joker
         cpx   #99
         bcc   putJOKER1
         ldx   #99
putJOKER1 lda  scdVAR,x
         and   #$00ff
         pha
         and   #$00f0
         asl
         asl
         asl
         asl
         ora   #$b000
         sta   strJOKER
         pla
         and   #$000f
         ora   #$00b0
         ora   strJOKER
         xba
         sta   strJOKER
         rts

*-------------------------------------- Affichage de la barre

affALL   jsr   putTIM
         jsr   putLVL
         jsr   putLIFE
         jsr   putJOKER

         lda   ptrFONTE
         clc
         adc   #$18
         tay
         ldx   ptrFONTE+2
         lda   #strMINU
         jsr   printIT

         lda   ptrFONTE
         clc
         adc   #$24
         tay
         ldx   ptrFONTE+2
         lda   #strSECO
         jsr   printIT

         lda   ptrFONTE
         clc
         adc   #$44
         tay
         ldx   ptrFONTE+2
         lda   #strLEVEL
         jsr   printIT

         lda   ptrFONTE
         clc
         adc   #$68
         tay
         ldx   ptrFONTE+2
         lda   #strLIFE
         jsr   printIT

         lda   ptrFONTE
         clc
         adc   #$8c
         tay
         ldx   ptrFONTE+2
         lda   #strJOKER
         jsr   printIT

         stz   fgPRINT
         lda   ptrFONTE   ; Affiche depuis fonte
         ldy   #$0198
         jsr   putBAR

         rts

*---

putBAR   ldx   ptrFONTE+1
         stx   putBAR1+2

         sta   putBAR1+1
         sty   putBAR2+2

         ldx   #$04f4
putBAR1  ldal  $012000,x
putBAR2  stal  $012000,x
         dex
         dex
         bpl   putBAR1
         rts

*-------------------------------------- Interruption temps

intTIME  ds    4
         dw    60
         dw    $a55a

         phb
         phk
         plb
         clc
         xce
         rep   #$30

         lda   #60
         sta   intTIME+4

         lda   fgBUG
         beq   intTIME5

         lda   fgLOST
         bne   intTIME5

intTIME1 lda   secondes
         beq   intTIME2
         dec
         sta   secondes
         bra   intTIME4
intTIME2 lda   #59
         sta   secondes
         lda   minutes
         beq   intTIME3
         dec
         sta   minutes
         bra   intTIME4

intTIME3 lda   #1
         sta   fgLOST
         stz   secondes
         stz   minutes

intTIME4 jsr   putTIM

         lda   #strMINU
         ldy   #scrMINU
         ldx   #$0001
         jsr   printIT

         lda   #strSECO
         ldy   #scrSECO
         ldx   #$0001
         jsr   printIT

intTIME5 sep   #$30
         plb
         clc
         rtl

         mx    %00

*-------------------------------------- Interruption animation

intANIM  ds    4
         dw    1
         dw    $a55a

         phb
         phk
         plb
         clc
         xce
         rep   #$30

         lda   #1
         sta   intANIM+4

         lda   fgBUG
         bne   intANIM4
         brl   intANIM21

intANIM4 lda   #0         ; Numero de l'objet a animer
         cmp   anNUMBER
         bne   intANIM5
         stz   intANIM4+1
         bra   intANIM4

intANIM5 tax
         inc
         inc
         sta   intANIM4+1

         stz   intANIM8+1
         lda   anACTIF,x  ; Regarde s'il est actif
         cmp   #-1
         beq   intANIM7
         cmp   #$2222
         beq   intANIM6
         brl   intANIM21

intANIM6 lda   #$8000     ; sleep
         sta   intANIM8+1

intANIM7 stz   intANIM16+1
         lda   anOBJET,x  ; Recupere l'adresse source
intANIM8 ldy   #$8000
         bpl   intANIM9
         clc
         adc   #36
intANIM9 asl              ; de l'image
         tay
         lda   anCORRES,y
         asl
         asl
         tay
         lda   ptrTCK1+1,y
         sta   intANIM16+2

         lda   anCOORD,x  ; On a la coordonnee ecran
         tay
         lda   scrCASE,y  ; Adresse ecran source
         clc
         adc   #$0002
         pha
         clc
         adc   ptrBACK
         sta   intANIM17+1
         pla
         clc
         adc   #$2000     ; et ecran destination
         sta   intANIM19+1

intANIM10 lda  anOBJET,x  ; Numero de l'objet
         ldy   intANIM8+1
         bpl   intANIM11
         clc
         adc   #36
intANIM11 asl
         tay
         lda   anDRAW,y   ; table de correspondance
         sta   intANIM18+1
         lda   anTYPE,y   ; Recherche la table des adresses
         clc
         adc   anANIM,x
         tay
         hex   b90000     ; en A, adresse ecran source
         cmp   #-1
         bne   intANIM12

         stz   anANIM,x
         brl   intANIM10

intANIM12 clc
         adc   intANIM16+1
         sta   intANIM16+1

         inc   anANIM,x
         inc   anANIM,x

         lda   anOBJET,x  ; Regarde si tiny sur sleeper
         cmp   #4
         bcc   intANIM13
         cmp   #8
         bcs   intANIM13

         lda   anCOORD,x
         tax
         lda   plateau3,x
         cmp   #-1
         bne   intANIM21

intANIM13 lda  #23
         sta   compteur

*--- Debut routine d'affichage (lente)

intANIM14 sep  #$20
intANIM15 ldx  #0
intANIM16 ldal $110000,x  ; data
         tay
intANIM17 ldal $e10000,x  ; ECRAN source
         and   tblMASK,y  ; MASK
intANIM18 ora  tblGRE,y   ; data
intANIM19 stal $012000,x  ; $01/2000
         inx
intANIM20 cpx  #12
         bne   intANIM16

         rep   #$20
         lda   intANIM15+1
         clc
         adc   #160
         sta   intANIM15+1
         clc
         adc   #12
         sta   intANIM20+1

         dec   compteur
         lda   compteur
         bpl   intANIM14

         stz   intANIM15+1
         lda   #12
         sta   intANIM20+1

         lda   intANIM4+1
         dec
         dec
         tax
         lda   anOBJET,x
         cmp   #32
         bne   intANIM21
         stz   anANIM,x

intANIM21 sep  #$30
         plb
         clc
         rtl

         mx    %00

*-------------------------------------- Datas

compteur ds    2          ; pour affichage tiny (intANIM)
compteur2 ds   2          ; nombre de sprites a animer
compteur3 ds   2          ; pour affichage tiny (esprit)

fgKEY    ds    2
fgLOST   ds    2
fgPRINT  ds    2
fgTEMP   ds    2
fgCURS   ds    2
fgLEVEL  ds    2
fgBUG    ds    2
oldBUG   ds    2

spyDIR   dw    2,1,4,3
spyDIR2  dw    2,1,3,4

keyPREF  dw    $00b0      ; select
         dw    $00b4      ; left
         dw    $00b6      ; right
         dw    $00b8      ; up
         dw    $00b2      ; down

minutes  ds    2          ; Bar info
secondes ds    2
level    ds    2
life     ds    2
joker    ds    2

strMINU  asc   "  ",00
strSECO  asc   "  ",00
strLEVEL asc   "  ",00
strLIFE  asc   "  ",00
strJOKER asc   "  ",00

*--- Adresses caracteres

adrFNT8  dw    $5780,$5784,$5788,$578c,$5790,$5794,$5798,$579c
         dw    $57a0,$57a4,$57a8,$57ac,$57b0,$57b4,$57b8,$57bc
         dw    $57c0,$57c4,$57c8,$57cc,$57d0,$57d4,$57d8,$57dc
         dw    $57e0,$57e4,$57e8,$57ec,$57f0,$57f4,$57f8,$57fc
         dw    $5800,$5804,$5808,$580c,$5810,$5814,$5818,$581c
         dw    $5c80,$5c84,$5c88,$5c8c,$5c90,$5c94,$5c98,$5c9c
         dw    $5ca0,$5ca4,$5ca8,$5cac,$5cb0,$5cb4,$5cb8,$5cbc
         dw    $5cc0,$5cc4,$5cc8,$5ccc,$5cd0,$5cd4,$5cd8,$5cdc
         dw    $5ce0,$5ce4,$5ce8,$5cec,$5cf0,$5cf4,$5cf8,$5cfc
         dw    $5d00,$5d04,$5d08,$5d0c,$5d10,$5d14,$5d18,$5d1c
         dw    $6180,$6184,$6188,$618c,$6190,$6194,$6198,$619c
         dw    $61a0,$61a4,$61a8,$61ac,$61b0,$61b4,$61b8,$61bc
         dw    $61c0,$61c4,$61c8,$61cc

tblFNT8  hex   a0a1a2a3a4a5a6a7a8a9aaabacadaeaf
         hex   b0b1b2b3b4b5b6b7b8b9babbbcbdbebf
         hex   c0c1c2c3c4c5c6c7c8c9cacbcccdcecf
         hex   d0d1d2d3d4d5d6d7d8d9dadbdcdddedf
         hex   e0e1e2e3e4e5e6e7e8e9eaebecedeeef
         hex   f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff
         hex   88958b8a

*--- Flags pour le jeu

tinyMOVE ds    2          ; a-t-il bouge
tinyROULE ds   2          ; faut-il qu'il roule ??
tinyDIR  ds    2          ; direction du Tiny
tinyDEC  ds    2          ; le decor
espCOL   ds    2          ; la couleur du Tiny + word (sauvegarde)
espADR   ds    4
espECR   ds    2
espSCR   ds    2
myNUMBER ds    2          ; numero du tiny arrete (anim table)

tinyCALC dw    $fffe,$0002,$fe20,$01e0
tinyCALC2 dw   $000c,$fffd,$0f00,$fe20
tinyHOW  dw    6,6,8,8

curXY    ds    2          ; Curseur
curX     ds    2
curY     ds    2
oldXY    ds    2
oldX     ds    2
oldY     ds    2

arrCOL   ds    2
arrTINYcur ds  2
arrXY    ds    2
arrX     ds    2
arrY     ds    2
arrNUMBER ds   2

*--- Tables pour les animations (jusqu'a 104 animations)

anNUMBER ds    2
anOBJET  ds    208
anACTIF  ds    208
anCOORD  ds    208
anANIM   ds    208
anACTIF2 ds    208

         asc   0d
         asc   'Hello This Is Antoine On Line'
         asc   0d

*--- Donnees pour les plateaux

plateau1 ds    208
plateau2 ds    208
plateau3 ds    208
plateau4 ds    208
plateau5 ds    208

*--- Conversion HEXA/DECI

lvlINTRO hex   01,01,01,01,01,01,01,01,01,01
         hex   02,02,02,02,02,02,02,02,02,02
         hex   03,03,03,03,03,03,03,03,03,03
         hex   04,04,04,04,04,04,04,04,04,04
         hex   05,05,05,05,05,05,05,05,05,05
         hex   06,06,06,06,06,06,06,06,06,06
         hex   07,07,07,07,07,07,07,07,07,07
         hex   08,08,08,08,08,08,08,08,08,08
         hex   09,09,09,09,09,09,09,09,09,09
         hex   10,10,10,10,10,10,10,10,10,10,11

scdVAR   hex   00,01,02,03,04,05,06,07,08,09
         hex   10,11,12,13,14,15,16,17,18,19
         hex   20,21,22,23,24,25,26,27,28,29
         hex   30,31,32,33,34,35,36,37,38,39
         hex   40,41,42,43,44,45,46,47,48,49
         hex   50,51,52,53,54,55,56,57,58,59
         hex   60,61,62,63,64,65,66,67,68,69
         hex   70,71,72,73,74,75,76,77,78,79
         hex   80,81,82,83,84,85,86,87,88,89
         hex   90,91,92,93,94,95,96,97,98,99

*--- Donnees du curseur

cursL    hex   a89999b9bbbbbbbb9b99998a

cursCOL1 hex   8990909090b090b0b0b0b0
         hex   b0b0b0b090b09090909989
cursCOL2 hex   98090909090b090b0b0b0b
         hex   0b0b0b0b090b0909090998
cursMSK1 hex   000f0f0f0f0f0f0f0f0f0f
         hex   0f0f0f0f0f0f0f0f0f0000
cursMSK2 hex   00f0f0f0f0f0f0f0f0f0f0
         hex   f0f0f0f0f0f0f0f0f00000

*--- Adresses pour NIV

scrNIV   dw    $0000,$0010,$0020,$0030,$0040
         dw    $0050,$1e00,$0060,$0070,$0080
         dw    $0090,$0f00,$0f10,$0f20,$0f30
         dw    $0f40,$0f50
         dw    $0f60,$0f70,$0f80,$0f90
         dw    $5a00,$5a10,$5a20,$5a30
         dw    $1e10,$1e20,$1e30,$1e40,$1e50,$1e60,$1e70,$1e80,$1e90
         dw    $2d00,$2d10,$2d20,$2d30,$2d40,$2d50,$2d60,$2d70,$2d80,$2d90
         dw    $3c00,$3c10,$3c20,$3c30,$3c40,$3c50,$3c60,$3c70,$3c80

scrCASE  dw    $0000,$0f00,$1e00,$2d00,$3c00,$4b00,$5a00,$6900
         dw    $000c,$0f0c,$1e0c,$2d0c,$3c0c,$4b0c,$5a0c,$690c
         dw    $0018,$0f18,$1e18,$2d18,$3c18,$4b18,$5a18,$6918
         dw    $0024,$0f24,$1e24,$2d24,$3c24,$4b24,$5a24,$6924
         dw    $0030,$0f30,$1e30,$2d30,$3c30,$4b30,$5a30,$6930
         dw    $003c,$0f3c,$1e3c,$2d3c,$3c3c,$4b3c,$5a3c,$693c
         dw    $0048,$0f48,$1e48,$2d48,$3c48,$4b48,$5a48,$6948
         dw    $0054,$0f54,$1e54,$2d54,$3c54,$4b54,$5a54,$6954
         dw    $0060,$0f60,$1e60,$2d60,$3c60,$4b60,$5a60,$6960
         dw    $006c,$0f6c,$1e6c,$2d6c,$3c6c,$4b6c,$5a6c,$696c
         dw    $0078,$0f78,$1e78,$2d78,$3c78,$4b78,$5a78,$6978
         dw    $0084,$0f84,$1e84,$2d84,$3c84,$4b84,$5a84,$6984
         dw    $0090,$0f90,$1e90,$2d90,$3c90,$4b90,$5a90,$6990

scrX     dw    $0000,$000c,$0018,$0024,$0030,$003c,$0048
         dw    $0054,$0060,$006c,$0078,$0084,$0090

scrY     dw    $0000,$0f00,$1e00,$2d00
         dw    $3c00,$4b00,$5a00,$6900

*--- Types d'animation a faire

anCORRES dw    $D,$D,$D,$D ; staticTiny
         dw    $5,$5,$5,$5 ; sleeper
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    $1,$1,$1,$1 ; staticAnim
         dw    $6,$6,$6,$6 ; sleepTiny

anDRAW   da    tblGRE,tblBLU,tblRED,tblYEL
         da    tblGRE,tblBLU,tblRED,tblYEL
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         da    tblGRE,tblGRE,tblGRE,tblGRE
         da    tblGRE,tblBLU,tblRED,tblYEL

anTYPE   da    anGREE,anBLUE,anREDE,anYELL
         da    anSLEE,anSLEE,anSLEE,anSLEE
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         da    anSTAT,anSTAT,anSTAT,anSTAT
         da    anDORM,anDORM,anDORM,anDORM

anGREE   dw    $0000,$000c,$0018,$0024,$0030,$003c,$0048,$0054,$0060,$006c,$0078,$0084
         dw    $0f00,$0f0c,$0f18,$0f24,-1

anBLUE   dw    $0f30,$0f3c,$0f48,$0f54,$0f60,$0f6c,$0f78,$0f84
         dw    $1e00,$1e0c,$1e18,$1e24,$1e30,-1

anREDE   dw    $1e3c,$1e48,$1e54,$1e60,$1e6c,$1e78,$1e84
         dw    $2d00,$2d0c,$2d18,$2d24,$2d30,-1

anYELL   dw    $2d3c,$2d48,$2d54,$2d60,$2d6c,$2d78,$2d84
         dw    $3c00,$3c0c,$3c18,$3c24,$3c30,$3c3c,$3c48,$3c54,-1

anSLEE   dw    $0000,$000c,$0018,$0024,$0030,$003c,$0048,$0054,-1

anSTAT   dw    $1e00,-1

anDORM   dw    $3c30,$3c30,$3c3c,$3c3c,$3c48,$3c48,$3c54,$3c54,-1

*--- Tables de correspondance pour les animations

tblGRE   hex   000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
         hex   202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f
         hex   404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f
         hex   606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f
         hex   808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9f
         hex   a0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebf
         hex   c0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf
         hex   e0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff

tblBLU   hex   000502070405060708090a0b0c0d0e0f505552575455565758595a5b5c5d5e5f
         hex   202522272425262728292a2b2c2d2e2f707572777475767778797a7b7c7d7e7f
         hex   404542474445464748494a4b4c4d4e4f505552575455565758595a5b5c5d5e5f
         hex   606562676465666768696a6b6c6d6e6f707572777475767778797a7b7c7d7e7f
         hex   808582878485868788898a8b8c8d8e8f909592979495969798999a9b9c9d9e9f
         hex   a0a5a2a7a4a5a6a7a8a9aaabacadaeafb0b5b2b7b4b5b6b7b8b9babbbcbdbebf
         hex   c0c5c2c7c4c5c6c7c8c9cacbcccdcecfd0d5d2d7d4d5d6d7d8d9dadbdcdddedf
         hex   e0e5e2e7e4e5e6e7e8e9eaebecedeeeff0f5f2f7f4f5f6f7f8f9fafbfcfdfeff

tblRED   hex   0009020b0405060708090a0b0c0d0e0f9099929b9495969798999a9b9c9d9e9f
         hex   2029222b2425262728292a2b2c2d2e2fb0b9b2bbb4b5b6b7b8b9babbbcbdbebf
         hex   4049424b4445464748494a4b4c4d4e4f5059525b5455565758595a5b5c5d5e5f
         hex   6069626b6465666768696a6b6c6d6e6f7079727b7475767778797a7b7c7d7e7f
         hex   8089828b8485868788898a8b8c8d8e8f9099929b9495969798999a9b9c9d9e9f
         hex   a0a9a2aba4a5a6a7a8a9aaabacadaeafb0b9b2bbb4b5b6b7b8b9babbbcbdbebf
         hex   c0c9c2cbc4c5c6c7c8c9cacbcccdcecfd0d9d2dbd4d5d6d7d8d9dadbdcdddedf
         hex   e0e9e2ebe4e5e6e7e8e9eaebecedeeeff0f9f2fbf4f5f6f7f8f9fafbfcfdfeff

tblYEL   hex   000d020f0405060708090a0b0c0d0e0fd0ddd2dfd4d5d6d7d8d9dadbdcdddedf
         hex   202d222f2425262728292a2b2c2d2e2ff0fdf2fff4f5f6f7f8f9fafbfcfdfeff
         hex   404d424f4445464748494a4b4c4d4e4f505d525f5455565758595a5b5c5d5e5f
         hex   606d626f6465666768696a6b6c6d6e6f707d727f7475767778797a7b7c7d7e7f
         hex   808d828f8485868788898a8b8c8d8e8f909d929f9495969798999a9b9c9d9e9f
         hex   a0ada2afa4a5a6a7a8a9aaabacadaeafb0bdb2bfb4b5b6b7b8b9babbbcbdbebf
         hex   c0cdc2cfc4c5c6c7c8c9cacbcccdcecfd0ddd2dfd4d5d6d7d8d9dadbdcdddedf
         hex   e0ede2efe4e5e6e7e8e9eaebecedeeeff0fdf2fff4f5f6f7f8f9fafbfcfdfeff

tblMASK  hex   fff0f0f0f0f0f0f0f0f0f0f0f0f0f0f00f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000
         hex   0f0000000000000000000000000000000f000000000000000000000000000000

tblXY    dw    $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
         dw    $0100,$0101,$0102,$0103,$0104,$0105,$0106,$0107
         dw    $0200,$0201,$0202,$0203,$0204,$0205,$0206,$0207
         dw    $0300,$0301,$0302,$0303,$0304,$0305,$0306,$0307
         dw    $0400,$0401,$0402,$0403,$0404,$0405,$0406,$0407
         dw    $0500,$0501,$0502,$0503,$0504,$0505,$0506,$0507
         dw    $0600,$0601,$0602,$0603,$0604,$0605,$0606,$0607
         dw    $0700,$0701,$0702,$0703,$0704,$0705,$0706,$0707
         dw    $0800,$0801,$0802,$0803,$0804,$0805,$0806,$0807
         dw    $0900,$0901,$0902,$0903,$0904,$0905,$0906,$0907
         dw    $0a00,$0a01,$0a02,$0a03,$0a04,$0a05,$0a06,$0a07
         dw    $0b00,$0b01,$0b02,$0b03,$0b04,$0b05,$0b06,$0b07
         dw    $0c00,$0c01,$0c02,$0c03,$0c04,$0c05,$0c06,$0c07

*--- Tinies bougent

moveLEFT dw    $0000,$000c,$0018,$0024
         dw    $0030,$003c,$0048,$0054

moveRIGHT dw   $0f00,$0f0c,$0f18,$0f24
         dw    $0f30,$0f3c,$0f48,$0f54

moveUP   dw    $1e00,$1e0c,$1e18,$1e24
         dw    $1e30,$1e3c,$1e48,$1e54

moveDOWN dw    $2d00,$2d0c,$2d18,$2d24
         dw    $2d30,$2d3c,$2d48,$2d54

rollLEFT dw    $3c00,$3c0c,$3c18,$3c24
         dw    $3c30,$3c3c,$3c48,$3c54

rollRIGHT dw   $4b00,$4b0c,$4b18,$4b24
         dw    $4b30,$4b3c,$4b48,$4b54

rollUP   dw    $5a00,$5a0c,$5a18,$5a24
         dw    $5a30,$5a3c,$5a48,$5a54

rollDOWN dw    $6900,$690c,$6918,$6924
         dw    $6930,$693c,$6948,$6954

*--- Adresses ecran des sprites

chseBOUG da    anBougGa,anBougDr,anBougHa,anBougBa
         da    anRoulGa,anRoulDr,anRoulHa,anRoulBa
anBougGa dw    $0f0c,$0f18,$0f24,$0f30,$0f3c,$0f48
anBougDr dw    $000c,$0018,$0024,$0030,$003c,$0048
anBougHa dw    $1e00,$1e0c,$1e18,$1e24,$1e30,$1e3c,$1e48,$1e54
anBougBa dw    $2d00,$2d0c,$2d18,$2d24,$2d30,$2d3c,$2d48,$2d54
anRoulGa dw    $4b0c,$4b18,$4b24,$4b30,$4b3c,$4b48
anRoulDr dw    $3c0c,$3c18,$3c24,$3c30,$3c3c,$3c48
anRoulHa dw    $5a00,$5a0c,$5a18,$5a24,$5a30,$5a3c,$5a48,$5a54
anRoulBa dw    $6900,$690c,$6918,$6924,$6930,$693c,$6948,$6954

chseBUMP da    anBumpGa,anBumpDr,anBumpBa,anBumpHa
anBumpGa dw    $0064,$0070,$007c,$0088,$0094
         dw    $0f64,$0f70,$0f7c,$0f88,$0064,-1
anBumpDr dw    $0064,$0f94,$1e64,$1e70,$1e7c
         dw    $1e88,$1e94,$2d64,$0f88,$0064,-1
anBumpHa dw    $0064,$2d64,$2d70,$2d7c,$2d88
         dw    $2d94,$3c64,$3c70,$3c7c,$0064,-1
anBumpBa dw    $0064,$3c7c,$3c88,$3c94,$4b64
         dw    $4b70,$4b7c,$4b88,$4b94,$0064,-1

chseTELE da    anTeleGa,anTeleDr,anTeleHa,anTeleBa
anTeleGa dw    $1e30,$1e48,$1e60,$1e78
         dw    $2d00,$2d18,$2d30
         dw    $2d48,$693c,-1
anTeleDr dw    $0060,$0078
         dw    $0f00,$0f18,$0f30
         dw    $0f48,$0f60,$0f78,$693c,-1
anTeleHa dw    $3c00,$3c18,$3c30
         dw    $3c48,$3c60,$3c78
         dw    $4b00,$4b18,$693c,-1
anTeleBa dw    $4b60,$4b78
         dw    $5a00,$5a18,$5a30
         dw    $5a48,$5a60,$5a78,$693c,-1

chseTELE2 da   anTeleGa2,anTeleDr2,anTeleHa2,anTeleBa2
anTeleGa2 dw   $2d84,$2d78,$2d6c,$2d60,$1e54,$1e48,$1e3c,$1e30,-1
anTeleDr2 dw   $1e24,$1e18,$1e0c,$1e00,$0084,$0078,$006c,$0060,-1
anTeleHa2 dw   $4b54,$4b48,$4b3c,$4b30,$3c24,$3c18,$3c0c,$3c00,-1
anTeleBa2 dw   $6924,$6918,$690c,$6900,$4b84,$4b78,$4b6c,$4b60,-1

anINTE   dw    $0000,$0f00,$1e00,$2d00
anOPEN   dw    $006c,$0f6c,$1e6c,$2d6c
anDOOR   dw    $000c,$0018,$0024,$0030,$003c,$0048,$0054,$0060,$006c,-1
anJOKER  dw    $3c00,$3c0c,$3c18,$3c24,$3c30,$3c3c
         dw    $3c48,$3c54,$3c60,$3c6c,$3c78,$3c84,-1

chseBOOM da    anBoumGa,anBoumDr,anBoumHa,anBoumBa
anBoumGa dw    $0f00,$0f0c,$0f18,$0f24,$0f30,$0f3c,$0f48,$0f54,-1
anBoumDr dw    $0000,$000c,$0018,$0024,$0030,$003c,$0048,$0054,-1
anBoumHa dw    $1e00,$1e0c,$1e18,$1e24,$1e30,$1e3c,$1e48,$1e54,-1
anBoumBa dw    $2d00,$2d0c,$2d18,$2d24,$2d30,$2d3c,$2d48,$2d54,-1

anEXPL1  dw    $4b30,$4b3c,$4b48,$4b54,-1
anEXPL2  dw    $5a00,$5a0c,$5a18,$5a24,$5a30,$5a3c
         dw    $5a48,$5a54,$6900,$690c,$6918,$6924,-1
