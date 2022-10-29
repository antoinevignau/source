*--------------------------*
*                          *
*        THE TINIES        *
*                          *
*      Brutal  Deluxe      *
*      Atreid Concept      *
*                          *
*  Version: 1.1 du 2/2/95  *
*--------------------------*

         lst   off
         rel
         dsk   The.Tinies.l

         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Misc.Macs
         use   4/Sound.Macs
         use   4/Util.Macs

         mx    %00
         xc
         xc

*--- Parametres Page Zero

Debut    =     $00
Arrivee  =     $04
Second   =     $08
Third    =     $0c

scrMINU  =     $9818
scrSECO  =     $9824
scrLEVEL =     $9844
scrLIFE  =     $9868
scrJOKER =     $988c

proDOS   =     $e100a8

*--------------------------
* Initialisations d'entree
*--------------------------

         phk
         plb

*--- StartUp Tools

         _TLStartUp
         pha
         _MMStartUp
         pla
         sta   myID
         _MTStartUp

         ldal  $e0c060
         bpl   noPATCH

         lda   #$eaea
         sta   PATCH

*--- Modifie bordure and co...

noPATCH  pha
         _GetIRQEnable
         pla
         and   #$20
         beq   okIT1
         jsr   aptkERR

okIT1    sep   #$20
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
         stal  $e0c035

         rep   #$20

*--- Ah! GsBug

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
         pla
         pla
         pld
         brl   bugFOUND4

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

         sei

         PushLong #0
         PushWord #$12
         _GetVector
         PullLong saveDESK

         PushWord #$12
         PushLong #theDESK
         _SetVector

         cli

*--- Libere et compacte la memoire

bugFOUND4 PushLong #0
         PushLong #$8fffff
         PushWord myID
         PushWord #%11000000_00000000
         PushLong #0
         _NewHandle
         _DisposeHandle
         _CompactMem

*--- Verifie que l'on ait 448ko libres

         PushLong #0      ; 448ko au total
         _FreeMem
         pla
         pla
         cmp   #7         ; 7*64ko
         bcs   okIT2
         brl   memERR3

okIT2    PushLong #0      ; Demande Ecran Shadowing
         PushLong #$8000
         PushWord myID
         PushWord #%11000000_00000011
         PushLong #$012000
         _NewHandle
         pla
         pla
         bcc   okIT3
         brl   memERR3

okIT3    PushLong #0
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
         sta   ptrECRAN,x
         ldy   #2
         lda   [3],y
         sta   ptrECRAN+2,x
         pld
         pla
         pla
         jsr   memERR
         inx
         inx
         inx
         inx
         stx   temp
         cpx   #4*6
         bne   okIT3

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
         sta   ptrBUFFER
         ldy   #2
         lda   [3],y
         sta   ptrBUFFER+2
         pld
         pla
         pla

*---

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
         jmp   okIT4

*-------------------------- Message

         hex   0d0d
         asc   'Hello boy, are you looking for something ?'
         hex   0d0d

*--------------------------
* Fin du programme
*--------------------------

initOFF  ldx   #$7ffe
         lda   #0
]lp      stal  $012000,x
         dex
         dex
         bpl   ]lp

initOFF1 sep   #$30

         lda   save4
         stal  $e0c035
         lda   save3
         stal  $e0c034
         lda   save2
         stal  $e0c029
         lda   save1
         stal  $e0c022
         rep   #$30

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

initOFF2 lda   noSOUND
         cmp   #2
         beq   initOFF3

         _SoundShutDown


initOFF3 _MTShutDown

         PushWord myID
         _DisposeAll
         PushWord myID
         _MMShutDown
         _TLShutDown

         jsl   proDOS
         dw    $2029
         adrl  proQUIT

*--------------------------
* Met les pointers
*--------------------------

okIT4    lda   ptrECRAN
         clc
         adc   #$8000
         sta   ptrNIV
         lda   ptrECRAN+2
         sta   ptrNIV+2

         lda   ptrBOUGE
         clc
         adc   #$8000
         sta   ptrFONTE
         lda   ptrBOUGE+2
         sta   ptrFONTE+2

         lda   ptrGAG2
         clc
         adc   #$8000
         sta   ptrGAG3
         lda   ptrGAG2+2
         sta   ptrGAG3+2

         lda   ptrTINY1
         clc
         adc   #$8000
         sta   ptrTINY2
         lda   ptrTINY1+2
         sta   ptrTINY2+2

         lda   ptrUNPACK
         clc
         adc   #$8000
         sta   ptrDATAS
         lda   ptrUNPACK+2
         sta   ptrDATAS+2

*--------------------------
* Presentation
*--------------------------

         lda   #pKALISTO  ; Charge les fichiers
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT5
         brl   initOFF

okIT5    lda   ptrECRAN+1
         jsr   unPACK

         lda   #pTINIES
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT6
         brl   initOFF

okIT6    lda   ptrBOUGE+1
         jsr   unPACK

         lda   ptrECRAN+1
         jsr   do3200

         lda   ptrBOUGE+1
         jsr   do3200

*--------------------------
* Charges les donnees
*--------------------------

         PushWord #0
         _SoundToolStatus
         pla
         bne   okIT7

         stz   noSOUND

         tdc
         clc
         adc   #$100
         pha
         _SoundStartUp

         lda   #pSOUND    ; Charge les sons
         ldx   ptrZIK+1
         jsr   loadFILE
         bcc   okIT7

         lda   #1
         sta   noSOUND

*---

okIT7    lda   #pFONTE
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT8
         brl   initOFF
okIT8    lda   ptrFONTE+1
         jsr   unPACK

         lda   #pGAG2
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT9
         brl   initOFF
okIT9    lda   ptrGAG2+1
         jsr   unPACK

         lda   #pGAG3
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT10
         brl   initOFF
okIT10   lda   ptrGAG3+1
         jsr   unPACK

         lda   #pTINY1
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT11
         brl   initOFF
okIT11   lda   ptrTINY1+1
         jsr   unPACK

         lda   #pTINY2
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT12
         brl   initOFF
okIT12   lda   ptrTINY2+1
         jsr   unPACK

*--------------------------
* Les preferences
*--------------------------

preferNIV clc
         xce
         rep   #$30

         lda   #'00'
         sta   pINTRO+21
         sta   pNIV+19

         put   Tinies.Main2

*-------------------------- Message

         hex   0d0d
         asc   'Perhaps a code for a level ?',0d
         asc   'Ok! just try CUBACUBA or LANDPAPY...'
         hex   0d0d

*--------------------------
* Le programme
*--------------------------

         mx    %00

entryGAME lda  okDATAS3
         beq   entryGAME1
         lda   #pDATAS2
         bra   entryGAME2
entryGAME1 lda #pDATAS
entryGAME2 ldx ptrDATAS+1
         jsr   loadFILE
         bcc   entryGAME3
         brl   initOFF

entryGAME3 sei
         PushLong #intTIME
         _SetHeartBeat
         PushLong #intANIM
         _SetHeartBeat
         cli

         stz   noBUG

         lda   ptrECRAN+1
         sta   intANIM17+2
         sta   hideCURS1+2
         sta   hideCURS3+2
         sta   hideCURS4+2
         sta   esprit8+2
         clc
         adc   #$000e
         sta   hideCURS2+2

         lda   #pBOUGE    ; Indispensable
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   entryGAME4
         brl   initOFF
entryGAME4 lda ptrBOUGE+1
         jsr   unPACK

         bra   playGAME

*--- On a fini la partie

endGAME  sei
         PushLong #intTIME
         _DelHeartBeat
         PushLong #intANIM
         _DelHeartBeat
         cli

         jmp   preferNIV

*--------------------------
* Joue le niveau

playGAME jsr   allLVL     ; calcule le level
         jsr   allNIV     ; charge en consequence
         bcc   playGAME1
         jmp   endGAME

playGAME1 stz  fgLOST     ; on n'a pas perdu
         stz   fgPRINT    ; et on doit afficher
         stz   intANIM4+1
         lda   #-1
         sta   fgCURS

         stz   arrTINYcur
         stz   doMAIN2+1

         jsr   decodeALL  ; decode le niveau
         bcs   playNEXT1

         lda   ptrECRAN+1 ; fait un fade sur le niveau
         ldy   #0
         jsr   fadeIN
         jsr   affALL     ; affiche la barre de menu

         lda   #1
         sta   noBUG

         stz   curX
         stz   curY

         stal  $e0c010
         jmp   gereCURS

*--- On a gagne

playNEXT lda   #2
         jsr   nowWAIT
         jsr   fadeOUT

         stz   noBUG

playNEXT1 inc  level
         lda   level
         cmp   #101
         beq   playNEXT2
         brl   playGAME
playNEXT2 jmp  winGAME

*--- On a perdu

lostTIME lda   ptrFONTE
         clc
         adc   #$4b00
         ldy   #$0198
         jsr   putBAR

lostTIME1 lda  #2
         jsr   nowWAIT
         jsr   fadeOUT

         stz   noBUG

         ldal  $e0c060
         bmi   lostTIME2

         lda   life
         beq   lostTIME2
         dec   life
         brl   playGAME

lostTIME2 jsr  clrECRAN

         stz   life
         stz   joker

         lda   #strGAME
         ldy   #$2bc8
         ldx   ptrECRAN+2
         jsr   print16
         lda   #strCOD
         ldy   #$44d0
         ldx   ptrECRAN+2
         jsr   print16
         lda   ptrECRAN+1
         ldy   #0
         jsr   fadeIN
]lp      lda   #5
         jsr   nowWAIT
         bcs   ]lp
         jsr   fadeOUT

         lda   #pPERDU    ; On a perdu en 3200
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcs   lostTIME3
         lda   ptrECRAN+1
         jsr   unPACK
         lda   ptrECRAN+1
         jsr   do3200

lostTIME3 jmp  endGAME

*-------------------------- Message

         hex   0d0d
         asc   'So you are still here ?',0d
         asc   'Try another one: PURITIES'
         hex   0d0d

*--- 101 niveaux faits

winGAME  lda   #2
         jsr   nowWAIT

         jsr   fadeOUT

         stz   noBUG

         jsr   clrECRAN

         lda   #strWIN
         ldy   #$2bc8
         ldx   ptrECRAN+2
         jsr   print16
         lda   ptrECRAN+1
         ldy   #0
         jsr   fadeIN
]lp      lda   #5
         jsr   nowWAIT
         bcs   ]lp
         jsr   fadeOUT

         lda   #pGAGNE
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcs   winGAME1
         lda   ptrECRAN+1
         jsr   unPACK
         lda   ptrECRAN+1
         jsr   do3200

winGAME1 stz   level
         brl   playGAME

*--------------------------
* Gestion du curseur
*--------------------------

gereCURS lda   fgLOST     ; Tant que l'on n'a pas perdu
         beq   gereCURS1
         jmp   lostTIME

gereCURS1 ldx  curX
         ldy   curY
         jsr   showCURS   ; Show curseur
         jsr   gereKEY    ; gere les touches
         bcs   gereCURS   ; aucun deplacement
         cmp   #-1        ; 'esc' hit
         bne   gereCURS2
         jmp   lostTIME1

gereCURS2 pha             ; Efface le curseur
         ldx   curX
         ldy   curY
         jsr   hideCURS

         pla
         bne   gereCURS3

         ldx   curX
         ldy   curY
         jsr   calcWHAT
         lda   plateau3,x
         cmp   #4
         bcs   gereCURS
         stz   fgCURS
         brl   doTINIES   ; On gere les Tinies

gereCURS3 cmp  #1         ; Left
         bne   gereCURS5

         lda   curX
         beq   gereCURS4
         dec
         sta   curX
gereCURS4 brl  gereCURS

gereCURS5 cmp  #2         ; Right
         bne   gereCURS7

         lda   curX
         cmp   #12
         beq   gereCURS6
         inc
         sta   curX
gereCURS6 brl  gereCURS

gereCURS7 cmp  #3         ; Up
         bne   gereCURS9

         lda   curY
         beq   gereCURS8
         dec
         sta   curY
gereCURS8 brl  gereCURS

gereCURS9 cmp  #4         ; Down
         bne   gereCURS10

         lda   curY
         cmp   #7
         beq   gereCURS10
         inc
         sta   curY
gereCURS10 brl gereCURS

*-------------------------- Message

         hex   0d0d
         asc   'Sorry but the previous code was not a real one',0d
         asc   'It is dangerous to believe us ! :-)'
         hex   0d0d

*--------------------------
* Gere les Tinies
*--------------------------

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

*---

doMAIN   lda   fgLOST     ; Tant que l'on n'a pas perdu
         beq   doMAIN1
         jmp   lostTIME

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
         sei
         stz   anACTIF,x
         cli

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
         jmp   lostTIME1

doMAIN8  cmp   #0         ; Deselectionne
         bne   doMAIN9

         lda   #-1
         sta   fgCURS

         jmp   itsEND

doMAIN9  sta   tinyDIR
         stz   tinyMOVE   ; a pas bouge
         stz   tinyROULE  ; roule pas

doMAIN10 ldal  $e0bfff
         bpl   doMAIN12
         xba
         and   #$ff
         cmp   #$9b
         bne   doMAIN12
doMAIN11 brl   lostTIME1

doMAIN12 lda   fgLOST
         bne   doMAIN11

         lda   curX
         sta   oldX
         lda   curY
         sta   oldY
         lda   curXY
         sta   oldXY

         ldx   curXY      ; Sommes-nous sur une fleche ?
         lda   plateau2,x ; empeche le joueur de partir
         cmp   #24        ; de la fleche
         bcc   doMAIN13
         cmp   #28
         bcs   doMAIN13
         sec
         sbc   #24
         asl
         tax
         lda   spyDIR2,x
         sta   tinyDIR

doMAIN13 jsr   calcDIR    ; regarde la nouvelle position
         cmp   #-1
         bne   doMOVE

         jsr   doBOOM     ; boom...
         brl   doMAIN

*-------------------------- Message

         hex   0d0d
         asc   'Don'27't waste your time reading this! '
         asc   'Go away and play'
         hex   0d0d

*--------------------------

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
         jsr   doTIME
         brl   moveSHOW

move12   cmp   #30        ; life
         bne   move13
         jsr   doLIFE
         brl   moveSHOW

move13   cmp   #31        ; joker
         bne   move14
         jsr   doJOKE
         brl   moveSHOW

move14   cmp   #32        ; animation fixe
         bne   moveSHOW
         jsr   doBOOM
         brl   doMAIN

*---

moveSHOW jsr   doSHOW

         lda   tinyROULE
         bne   moveSHOW1
         ldx   #07
         jsr   doSND
         bra   moveSHOW2
moveSHOW1 ldx  #10
         jsr   doSND

moveSHOW2 ldx  oldXY
         lda   #-1
         sta   plateau3,x
moveSHOW3 ldx  curXY
         lda   espCOL
         sta   plateau3,x

         lda   #1
         sta   tinyMOVE
         brl   doMAIN10

*-------------------------- Message 1

         hex   0d0d
         asc   'Good morning Vietnam !!'
         hex   0d0d

*--------------------------
* Routines Tinies
*--------------------------

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
         sei
         lda   #-1
         sta   anACTIF,x
         cli
         lda   oldXY
         sta   anCOORD,x
         jmp   gereCURS

itsEND3  lda   anACTIF2,x ; Sleeper was active ?
         beq   itsEND2

         ldx   myNUMBER   ; Tiny now sleeps
         sei
         lda   #$2222
         sta   anACTIF,x
         cli
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
         jmp   playNEXT
itsEND5  jmp   gereCURS

*------------ Affiche le Tiny a l'ecran

doSHOW   stz   compteur2
         lda   tinyDIR
         dec
         asl
         clc
         adc   tinyROULE
         tax
         lda   chseBOUG,x
         ldy   ptrECRAN+1
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
doSHOW2  sei
         lda   anACTIF2,x
         sta   anACTIF,x
         stz   anANIM,x
         cli
         rts

*------------ Boooommmmm

doBOOM   lda   tinyROULE
         bne   doBOOM1
         lda   tinyMOVE
         beq   doBOOM1
         rts

doBOOM1  ldx   #12
         jsr   doSND

         lda   #99
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

*------------

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
doSLEEP2 sei
         lda   anACTIF,x
         sta   anACTIF2,x
         stz   anACTIF,x
         stz   anANIM,x
         cli
         rts

*------------ Les teleporteurs

doTELE   jsr   doSHOW

         lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #8
         beq   doTELE1

         ldx   #11
         jsr   doSND
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

         ldx   #01
         jsr   doSND

         lda   #99
         sta   compteur2

         lda   tinyDIR
         dec
         asl
         tax
         lda   chseTELE,x
         ldx   oldXY
         ldy   ptrGAG2+1
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

         ldx   #05
         jsr   doSND

         lda   tinyDIR
         dec
         asl
         tax
         lda   chseTELE2,x
         ldx   curXY
         ldy   ptrGAG2+1
         jsr   esprit

         jsr   doSHOW

         lda   #8
         sta   tinyROULE
         clc
         rts

*------------ Les bombes

doBOMB   jsr   doSHOW

         lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #12
         beq   doBOMB1

         ldx   #11
         jsr   doSND

         rts

doBOMB1  ldx   #04
         jsr   doSND

         lda   #99
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
         jmp   lostTIME1

doBOMB2  dec   joker
         jsr   affALL

         ldx   #08
         jsr   doSND

         lda   #anJOKER
         ldx   curXY
         ldy   ptrGAG3+1
         jsr   esprit

         ldx   #02
         jsr   doSND

         stz   tinyROULE

         ldx   curXY
         lda   #-1
         sta   plateau2,x
         rts

*------------ Les portes

doDOOR   lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #16
         beq   doDOOR1

         sec
         rts

doDOOR1  ldx   #13
         jsr   doSND

         lda   #99
         sta   compteur2

         lda   #anDOOR
         ldx   curXY
         ldy   ptrGAG3+1
         jsr   esprit

         lda   espCOL
         asl
         tax
         lda   anOPEN,x
         clc
         adc   ptrGAG3
         ldx   curXY
         jsr   sprite10

         ldx   curXY
         lda   #-1
         sta   plateau2,x
         clc
         rts

*------------ Les interrupteurs

doINTE   lda   tinyDEC
         sec
         sbc   espCOL
         cmp   #20
         beq   doINTE1
         rts

doINTE1  ldx   #03
         jsr   doSND

         ldx   anNUMBER
]lp      lda   anOBJET,x
         sec
         sbc   espCOL
         cmp   #4
         bne   doINTE2
         sei
         lda   #-1
         sta   anACTIF,x
         sta   anACTIF2,x
         stz   anANIM,x
         cli
doINTE2  dex
         dex
         bpl   ]lp

         lda   espCOL
         asl
         tax
         lda   anINTE,x
         clc
         adc   ptrGAG3
         ldx   curXY
         jsr   sprite10

         rts

*------------ Les fleches

doFLEC   jsr   doSHOW

doFLEC1  ldx   curXY
         lda   plateau2,x
         sec
         sbc   #24

         asl
         tax
         lda   spyDIR2,x
         sta   tinyDIR

         ldx   #06
         jsr   doSND

         rts

*------------ Bumper

doBUMP   ldx   #09
         jsr   doSND

         lda   #99
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

*------------ Time is life for the joker

doTIME   sei
         inc   minutes
         cli
         jsr   doCLR
         bra   doALL

doLIFE   sei
         inc   life
         cli
         jsr   doCLR
         bra   doALL

doJOKE   sei
         inc   joker
         cli
         jsr   doCLR

doALL    ldx   curXY
         lda   #-1
         sta   plateau2,x

         jsr   affALL
         rts

*------------ Clear a case

doCLR    ldx   #03
         jsr   doSND

         ldx   curXY
         lda   plateau1,x
         jsr   sprite
         rts

*--------------------------
* Routines programme
*--------------------------

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

*--------------------------

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
gereKEY1 cmp   #$0089     ; Tab for save ??
         bne   gereKEY2
         jsr   saveFILE
         sec
         rts
gereKEY2 cmp   keyPREF    ; Select ??
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

*-------------------------- Message

         hex   0d0d
         asc   'Only lamers use block editors'
         hex   0d0d

*--------------------------
* Calcul des donnees
*--------------------------

putTIME  ldx   minutes
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

putLEVEL ldx   level
         cpx   #100
         bne   putLEVEL1

         lda   #"()"
         bne   putLEVEL2

putLEVEL1 lda  scdVAR,x
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
putLEVEL2 sta  strLEVEL
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

*--------------------------
* Routines barre de menu
*--------------------------

affALL   jsr   putTIME
         jsr   putLEVEL
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

         lda   minutes
         bne   affALL1

         lda   fgPRINT
         bne   affALL2

affALL1  stz   fgPRINT
         lda   ptrFONTE   ; Affiche depuis fonte
         ldy   #$0198
         jsr   putBAR

affALL2  rts

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

*---

saveBAR  lda   #$9800
         sta   Debut
         lda   #$0001
         sta   Debut+2
         lda   ptrFONTE
         clc
         adc   #$7800
         sta   Arrivee
         lda   ptrFONTE+2
         sta   Arrivee+2

         ldy   #$4f4
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp
         rts

*--------------------------
* Routines interruption
*--------------------------

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

         lda   noBUG
         beq   intTIME1

         lda   fgLOST
         beq   intTIME2
intTIME1 brl   intTIME11

intTIME2 lda   minutes
         bne   intTIME6

         lda   fgPRINT
         bne   intTIME3

         lda   secondes
         cmp   #30
         bne   intTIME4

         lda   #1
         sta   fgPRINT
         jsr   saveBAR
         lda   ptrFONTE
         clc
         adc   #$500
         ldy   #$0198
         jsr   putBAR
         bra   intTIME6

intTIME3 lda   secondes
         cmp   #28
         bcc   intTIME5

intTIME4 cmp   #28
         bne   intTIME6

intTIME5 stz   fgPRINT
         jsr   affALL

intTIME6 lda   secondes
         beq   intTIME7
         dec
         sta   secondes
         bra   intTIME9
intTIME7 lda   #59
         sta   secondes
         lda   minutes
         beq   intTIME8
         dec
         sta   minutes
         bra   intTIME9

intTIME8 lda   #1
         sta   fgPRINT
         sta   fgLOST
         stz   secondes
         stz   minutes

intTIME9 jsr   putTIME

         lda   fgPRINT    ; affiche le temps sur fonte
         bne   intTIME10

         lda   fgLOST
         bne   intTIME11

         lda   #strMINU
         ldy   #scrMINU
         ldx   #$0001
         jsr   printIT

         lda   #strSECO
         ldy   #scrSECO
         ldx   #$0001
         jsr   printIT
         bra   intTIME11

intTIME10 lda  ptrFONTE
         clc
         adc   #$18
         tay
         lda   #strMINU
         ldx   ptrFONTE+2
         jsr   printIT

         lda   ptrFONTE
         clc
         adc   #$24
         tay
         lda   #strSECO
         ldx   ptrFONTE+2
         jsr   printIT

intTIME11 sep  #$30
         plb
         clc
         rtl

         mx    %00

*--- Interruption pour Tinies

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

         lda   noBUG
         bne   intANIM2
         brl   intANIM21

intANIM2 lda   #0         ; temporisation
         beq   intANIM3
         dec   intANIM2+1
         brl   intANIM21
intANIM3 lda   fgTEMP
         sta   intANIM2+1

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
         lda   ptrECRAN+1,y
         sta   intANIM16+2

         lda   anCOORD,x  ; On a la coordonnee ecran
         tay
         lda   scrCASE,y  ; Adresse ecran source
         clc
         adc   #$0002
         sta   intANIM17+1
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
         lda   anANIM,x
         cmp   sprFIX
         bne   intANIM21
         stz   anANIM,x

intANIM21 sep  #$30
         plb
         clc
         rtl

*-------------------------- Message

         hex   0d0d
         asc   'As you are still here, please listen to this story: <',0d
         asc   'What is the worst thing in oral sex ?',0d
         asc   'The view'
         hex   0d0d

*--------------------------

         mx    %00

*--------------------------
* Routines tableau
*--------------------------

allLVL   ldx   level      ; Charge image INTRO
         lda   lvlINTRO,x
         and   #$00ff
         sta   temp

         dec              ; Nb sprites/Anim fixe
         asl
         tax
         lda   sprNUM,x
         asl
         sta   sprFIX

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
         cmp   pINTRO+21
         beq   allLVL2
         sta   pINTRO+21
         sta   pNIV+19

         lda   #pINTRO
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcs   allLVL1

         lda   ptrECRAN+1
         jsr   unPACK
         lda   ptrECRAN+1
         jsr   do3200

allLVL1  lda   #pNIV
         ldx   ptrUNPACK+1
         jsr   loadFILE
         lda   ptrNIV+1
         jsr   unPACK

allLVL2  rts

*---

allNIV   lda   level      ; Calcule nom niveau
         asl
         asl
         asl
         clc
         adc   #allCODES
         sta   allNIV1+1

         ldx   #7
         sep   #$20
allNIV1  lda   allCODES,x
         dec
         dec
         dec
         sta   strCOD,x
         dex
         bpl   allNIV1
         rep   #$20

         lda   ptrDATAS
         clc
         adc   #$5300
         sta   Debut
         lda   ptrDATAS+2
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

*---

         jsr   clrECRAN
         lda   #strCOD
         ldy   #$3490
         ldx   ptrECRAN+2
         jsr   print16
         lda   ptrECRAN+1
         ldy   #0
         jsr   fadeIN
]lp      lda   #5
         jsr   nowWAIT
         bcs   ]lp
         jsr   fadeOUT
         jsr   clrECRAN

         lda   clickKEY
         cmp   #$9b
         beq   allNIV2
         clc
         rts
allNIV2  sec
         rts

*-------------------------- Message

         hex   0d0d
         asc   'The funniest story: the Apple II is dead'
         hex   0d0d

*--------------------------
* Routines decodage
*--------------------------

*--- Couche 1

decodeALL jsr  clrECRAN

         stz   fgNBTINIES
         stz   fgNBSLEEPERS

         ldx   #16-2
]lp      stz   nbOBJECTS,x
         dex
         dex
         bpl   ]lp

         ldx   #208-2
         lda   #-1
]lp      sta   plateau2,x
         sta   plateau3,x
         sta   plateau4,x
         dex
         dex
         bpl   ]lp

         ldx   level
         jsr   ZLevel
         clc
         adc   ptrDATAS
         sta   Debut
         lda   ptrDATAS+2
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

*--- Couche 2

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
         cmp   #0032
         bne   decodeBUG
         lda   #-1
         sta   plateau1,x
         lda   #32
         bra   decodeALL4

decodeBUG cmp  #0008      ; is it a Sleeper ?
         bcs   decodeALL4
         cmp   #0004
         bcc   decodeBUG1
         sta   plateau2,x
         pha
         phy
         asl
         tay
         lda   nbOBJECTS,y
         clc
         adc   #1
         sta   nbOBJECTS,y
         ply
         inc   fgNBSLEEPERS
         pla
         bra   decodeALL4

decodeBUG1 sta plateau3,x ; is it a Tiny ?
         phy
         asl
         tay
         lda   nbOBJECTS,y
         clc
         adc   #1
         sta   nbOBJECTS,y
         ply
         inc   fgNBTINIES
         lda   #-1
         sta   plateau2,x
         bra   decodeALL5

decodeALL4 sta plateau2,x

         clc
         adc   #21
         jsr   sprite

decodeALL5 ply
         iny
         plx
         inx
         inx
         cpx   #208
         bne   decodeALL3

*--- Animation

         ldx   #208*5
         lda   #$5555
]lp      sta   anNUMBER,x
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

*--- Calcule le temps d'attente entre animations

         lda   intTEMP,x
         sta   fgTEMP
         stz   intANIM2+1

*--- Interrupteurs

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

*--- Test de validite

         lda   fgNBTINIES ; nb tinies = nb sleepers
         cmp   fgNBSLEEPERS
         bne   decodeALL11

         lda   fgNBTINIES ; if equal, is zero ?
         beq   decodeALL11

         ldx   #8-2
]lp      lda   nbOBJECTS,x
         cmp   nbOBJECTS+8,x
         bne   decodeALL11
         dex
         dex
         bpl   ]lp

         lda   anNUMBER   ; no anim
         beq   decodeALL11
         clc
         rts
decodeALL11 sec
         rts

*---

ZLevel   lda   #0
         cpx   #0
         bne   ZLevel1
         rts
ZLevel1  clc
         adc   #208
         dex
         bne   ZLevel1
         rts

*--------------------------
* Routine clavier
*--------------------------

clickIT  ldal  $e0bfff    ; keyboard
         bpl   clickIT1
         stal  $e0c010
         xba
         and   #$00ff
         sta   clickKEY
         clc
         rts
clickIT1 ldal  $e0c026    ; mouse
         bmi   clickIT3
clickIT2 sec
         rts
clickIT3 ldal  $e0c023
         ldal  $e0c023
         and   #%10000000_00000000
         bne   clickIT2
         clc
         rts

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
         nop
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
loadERR1 sec
         rts

*---

saveFILE stz   noBUG

         jsl   proDOS
         dw    $2005
         adrl  proINFO

         jsl   proDOS
         dw    $2002
         adrl  proKILL

         jsl   proDOS
         dw    $2001
         adrl  proCREATE
         bcs   saveERR

         lda   #pPREF
         sta   proOPEN+4
         lda   #^pPREF
         sta   proOPEN+6

         jsl   proDOS
         dw    $2010
         adrl  proOPEN

         lda   proOPEN+2
         sta   proWRITE+2
         sta   proCLOSE+2

         jsl   proDOS
         dw    $2013
         adrl  proWRITE

saveFILE1 jsl  proDOS
         dw    $2014
         adrl  proCLOSE

         lda   #1
         sta   noBUG
         rts

saveERR  PushWord #0
         PushLong #proSTR11
         PushLong #proSTR2
         PushLong #proSTR31
         PushLong #proSTR41
         _TLTextMountVolume
         pla
         cmp   #1
         bne   saveFILE1
         brl   saveFILE

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
memERR2  jmp   initOFF

memERR3  lda   #$6060
         sta   memERR2
         jsr   memERR1
         brl   initOFF1

*---

aptkERR  PushWord #0
         PushLong #aptkSTR1
         PushLong #memSTR2
         PushLong #proSTR3
         PushLong #proSTR4
         _TLTextMountVolume
         pla
         cmp   #1
         bne   aptkERR1
         rts
aptkERR1 jmp   initOFF3

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

*------------------------------

unPACK   tax              ; Decompresse

         phd
         tdc
         clc
         adc   #$200
         tcd

         stz   $04
         stz   $06
         stx   $05

         lda   ptrUNPACK
         sta   $00
         lda   ptrUNPACK+2
         sta   $02

         lda   ptrBUFFER
         sta   $1e
         clc
         adc   #$2000
         sta   $22
         lda   ptrBUFFER+2
         sta   $20
         sta   $24

         ldy   #$3fff
         lda   #0
]lp      sta   [$1e],y
         dey
         dey
         bpl   ]lp

         LDA   #$0009
         STA   L0517+1
         LDA   #$01FF
         STA   L051E+1
         STZ   $1C
         PEA   $FFFF

L042C    JSR   L04E8
         CMP   #$0101
         bne   L042D
         brl   L04A4

L042D    CMP   #$0100
         BEQ   L0491
         STA   $12
         CMP   $14
         BCC   L0443
         LDA   $10
         PEI   $0E
L0443    CMP   #$0100
         BCC   L0455
         ASL
L0449    TAY
         LDA   [$22],Y
         PHA
         LDA   [$1E],Y
         CMP   #$0200
         BCS   L0449
         LSR
L0455    AND   #$00FF
         STA   $0E
         STA   $1A
         LDY   #$0000
L045F    STA   [$04],Y
         INY
         PLA
         BPL   L045F
         PHA
         TYA
         CLC
         ADC   $04
         STA   $04

         lda   $06
         adc   #0
         sta   $06

         JSR   L04D8
         LDA   $12
         STA   $10
         LDA   $14
         CMP   $18
         BCC   L048F
         LDA   L0517+1
         CMP   #$000C
         BEQ   L048F
         INC
         STA   L0517+1
         ASL
         TAX
         LDA   packMASK-$12,X
         STA   L051E+1
         ASL   $18
L048F    BRA   L042C
L0491    JSR   L04C1
         JSR   L04E8
         STA   $10
         STA   $1A
         STA   $0E
         STA   [$04]

         lda   $04
         clc
         adc   #1
         sta   $04
         lda   $06
         adc   #0
         sta   $06

         JMP   L042C

L04A4    pla
         pld
         phk
         plb
         rts

L04C1    LDA   #$0009
         STA   L0517+1
         LDA   #$01FF
         STA   L051E+1
         LDA   #$0200
         STA   $18
         LDA   #$0102
         STA   $14
         RTS

L04D8    LDA   $14
         ASL
         TAY
         LDA   $1A
         STA   [$22],Y
         LDA   $10
         ASL
         STA   [$1E],Y
         INC   $14
         RTS

L04E8    LDA   $1C
         AND   #$0007
         TAX
         LDA   $1C
         LSR
         LSR
         LSR
         CMP   #$03FD
         BCC   L0502
         CLC
         ADC   $00
         STA   $00
         STX   $1C
         LDA   #$0000
L0502    TAY
         LDA   [$00],Y
         STA   $08
         INY
         INY
         LDA   [$00],Y
         TXY
         BEQ   L0514
L050E    LSR
L050F    ROR   $08
         DEX
         BNE   L050E
L0514    LDA   $1C
         CLC
L0517    ADC   #$FFFF     ; $0009 on beginning
         STA   $1C
         LDA   $08
L051E    AND   #$FFFF     ; $01FF on beginning
         RTS

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
]lp      ldal  $e0c019
         and   #$80
         bne   ]lp
         pla
         dec
         bne   nowWAIT1
         sec
         rts
nowWAIT2 pla
         clc
         rts

*--------------------------
* Routines sonores
*--------------------------

doSND    lda   ptrZIK
         sta   pZIKptr
         lda   ptrZIK+2
         sta   pZIKptr+2

         dex
         txa
         asl
         tax

         lda   sndADR,x
         clc
         adc   pZIKptr+1
         sta   pZIKptr+1

         lda   sndSIZ,x
         sta   pZIKptr+4

         lda   noSOUND
         beq   doSND1
         rts

doSND1   PushWord #%00000000_00010000
         _FFStopSound
         PushWord #$0401
         PushLong #pZIKptr
         _FFStartSound
         rts

*--------------------------
* Routines graphiques
*--------------------------

*--- Affichage du curseur

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

         sei
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
         cli
         rts

*--- Effacement de l'ecran

clrECRAN lda   ptrECRAN
         sta   Debut
         lda   ptrECRAN+2
         sta   Debut+2
         ldy   #0
         tya
]lp      sta   [Debut],y
         iny
         iny
         cpy   #$7e00
         bne   ]lp

         lda   ptrNIV     ; Met la palette
         sta   Debut
         lda   ptrECRAN
         sta   Arrivee
         lda   ptrNIV+2
         sta   Debut+2
         lda   ptrECRAN+2
         sta   Arrivee+2

         ldy   #$7e00
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         iny
         cpy   #$8000
         bne   ]lp
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
         adc   ptrECRAN
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
         adc   ptrECRAN
         sta   Second
         lda   ptrECRAN+2
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
         adc   ptrECRAN
         sta   Second
         lda   ptrECRAN+2
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
         adc   ptrECRAN
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
         lda   ptrGAG3+2
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
         adc   ptrECRAN
         sta   Third
         lda   ptrECRAN+2
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

*---

print16  sta   print161+1
         stx   Arrivee+2
         sty   Arrivee

print161 lda   $ffff
         and   #$00ff
         bne   print162
         rts
print162 pha
         inc   print161+1

         ldy   #0037
]lp      lda   tblFNT16,y
         and   #$00ff
         cmp   1,s
         beq   print163
         dey
         bpl   ]lp

print163 pla
         tya
         asl
         tay
         lda   adrFNT16,y
         clc
         adc   ptrFONTE
         sta   Debut
         lda   ptrFONTE+2
         sta   Debut+2

         ldx   #0023
         ldy   #0000
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
         adc   #160-14
         tay

         dex
         bpl   ]lp

         lda   Arrivee
         clc
         adc   #16
         sta   Arrivee
         brl   print161

*-------------------------- Message

         hex   0d0d
         asc   'Oh! no more lemmings...'
         hex   0d0d

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

         lda   noBUG
         sta   oldBUG
         stz   noBUG

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
         sta   noBUG

         sep   #$30
         plp
         plb
         clc
         rtl

         mx    %00

*-------------------------- Message

         hex   0d0d
         asc   'During a year: we have released something '
         asc   'the FTA has never done: a GAME !!!'
         hex   0d0d

*--------------------------
* Routines 3200
*--------------------------

do3200   tax

         sep   #$20       ; A= pointeur source image compressee
         lda   #$1e
         stal  $e0c035
         rep   #$20

         stz   Debut
         stz   Debut+2
         stx   Debut+1

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
         bmi   do32006
         brl   do32003
do32006  ldal  $e0c023
         ldal  $e0c023
         and   #%10000000_00000000
         beq   do32007
         brl   do32003

do32007  stal  $e0c010
         ldal  $e0c068
         and   #$cf
         stal  $e0c068

*--- End of routine

         cli

         lda   mySTACK
         tcs
         pld
         phk
         plb

         ldx   #$7ffe
         lda   #0
]lp      stal  $012000,x
         stal  $e12000,x
         dex
         dex
         bpl   ]lp

         rts

*--------------------------
* All the datas
*--------------------------

         hex   8d8d
         asc   "----------- The Tinies -----------",8d
         asc   "        Version Apple //gs        ",8d
         asc   "  Antoine Vignau Olivier Zardini  ",8d
         asc   "          Brutal  Deluxe          ",8d
         asc   "------------ 9 2 1995 ------------",8d,8d

*--- Flags

noSOUND  dw    2
noBUG    ds    2
oldBUG   ds    2
bugFG    ds    2
bugA     ds    2
bugY     ds    2
saveDESK ds    4

clickKEY ds    2

save1    ds    1
save2    ds    1
save3    ds    1
save4    ds    1
save5    ds    2
save6    ds    2

compteur ds    2          ; pour affichage tiny (intANIM)
compteur2 ds   2          ; nombre de sprites a animer
compteur3 ds   2          ; pour affichage tiny (esprit)

fgKEY    ds    2
fgLOST   ds    2
fgPRINT  ds    2
fgTEMP   ds    2
fgCURS   ds    2

nbOBJECTS ds   16
fgNBTINIES ds  2
fgNBSLEEPERS ds 2

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
life     dw    2
joker    dw    2

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

strMINU  asc   "  ",00
strSECO  asc   "  ",00
strLEVEL asc   "  ",00
strLIFE  asc   "  ",00
strJOKER asc   "  ",00

strPREF  asc   "        ",00
strPREF2 asc   "LEVEL 00",00

strCOD   asc   "        ",00
strGAME  asc   "GAME OVER",00
strWIN   asc   " YOU WIN ",00

*--- Textes

memSTR1  str   'Can'27't allocate (screen) memory'
memSTR2  str   'Press a key to quit.'

aptkSTR1 str   'The game may not work with AppleTalk'

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

proOPEN  dw    2
         ds    2
         adrl  pINTRO

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
         adrl  pPREF      ; Pathname
         dw    $e3        ; AccessCode
         dw    $5a        ; FileType
         ds    4          ; AuxType
         dw    $02        ; Type d'enregistrement
         adrl  $14        ; Data segment
         ds    4          ; Resource segment

proKILL  dw    1
         adrl  pPREF      ; Pathname

proINFO  dw    4
         adrl  pPREF      ; Pathname
         dw    $e3        ; AccessCode
         dw    $5a        ; FileType
         ds    4          ; AuxType

proWRITE dw    5
         ds    2          ; Id
         adrl  keyPREF    ; Where
         adrl  $14        ; Length
         ds    4          ; Written
         ds    2

*--- Nom des fichiers

pINTRO   strl  '1/Tinies.Data/Intro00'
pNIV     strl  '1/Tinies.Data/Niv00'
pBOUGE   strl  '1/Tinies.Data/Bouge'
pGAG2    strl  '1/Tinies.Data/Gadget2'
pGAG3    strl  '1/Tinies.Data/Gadget3'
pTINY1   strl  '1/Tinies.Data/Tiny1'
pTINY2   strl  '1/Tinies.Data/Tiny2'
pFONTE   strl  '1/Tinies.Data/Fonte'
pGAGNE   strl  '1/Tinies.Data/Gagne'
pPERDU   strl  '1/Tinies.Data/Perdu'
pKALISTO strl  '1/Tinies.Data/Kalisto'
pTINIES  strl  '1/Tinies.Data/Tinies'
pDATAS   strl  '1/Tinies.Data/Tinies.Tab'
pDATAS2  strl  '1/Tinies.Data/Tinies.Tab2'
pSOUND   strl  '1/Tinies.Data/Tinies.Sound'

pMAIN    strl  '1/Tinies.Data/Tinies.Select'
pDOCU    strl  '1/Tinies.Data/Tinies.Docu'
pDOCFR   strl  '1/Tinies.Data/Tinies.Datas1'
pDOCUS   strl  '1/Tinies.Data/Tinies.Datas2'
pSPRITE  strl  '1/Tinies.Data/Tinies.Sprite'
pPREF    strl  '1/Tinies.Data/Tinies.Prefs'

*--- Memoire

myID     ds    2
mySTACK  ds    2

ptrECRAN ds    4          ; 0
ptrBOUGE ds    4          ; 1
ptrGAG2  ds    4          ; 2
ptrTINY1 ds    4          ; 3
ptrUNPACK ds   4          ; 4
ptrZIK   ds    4          ; 5

ptrNIV   ds    4          ; 0+8000
ptrFONTE ds    4          ; 1+8000
ptrGAG3  ds    4          ; 2+8000
ptrTINY2 ds    4          ; 3+8000
ptrDATAS ds    4          ; 4+8000

*--- Decompression

ptrBUFFER ds   4          ; pour le decompactage

packMASK dw    $01ff
         dw    $03ff
         dw    $07ff
         dw    $0fff
         dw    $0000

temp     ds    2

*--- Adresses des sons

sndADR   dw    $00,$21,$36,$3d,$46,$54,$61,$63,$6a,$74,$85,$8d,$d0
sndSIZ   dw    $21,$15,$07,$09,$0e,$0d,$02,$07,$0a,$11,$08,$43,$0a

pZIKptr  adrl  0          ; waveStart
         dw    41         ; waveSize
         dw    $00f5      ; freqOffset
         da    $1000      ; docBuffer
         dw    1          ; bufferSize
         adrl  0          ; nextWavePtr
         dw    255        ; volSetting

*--- Table routine 3200

affTBL   dw    $e4,$84,$8c,$94,$9c,$a4,$ac
         dw    $b4,$bc,$c4,$cc,$d4,$dc

*--- Tables pour les animations (jusqu'a 104 animations)

anNUMBER ds    2
anOBJET  ds    208
anACTIF  ds    208
anCOORD  ds    208
anANIM   ds    208
anACTIF2 ds    208

*--- Donnees pour les plateaux

plateau1 ds    208
plateau2 ds    208
plateau3 ds    208
plateau4 ds    208

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

adrFNT16 dw    $0f00,$0f10,$0f20,$0f30,$0f40,$0f50,$0f60,$0f70,$0f80,$0f90
         dw    $1e00,$1e10,$1e20,$1e30,$1e40,$1e50,$1e60,$1e70,$1e80,$1e90
         dw    $2d00,$2d10,$2d20,$2d30,$2d40,$2d50,$2d60,$2d70,$2d80,$2d90
         dw    $3c00,$3c10,$3c20,$3c30,$3c40,$3c50,$3c60,$3c70

tblFNT8  hex   a0a1a2a3a4a5a6a7a8a9aaabacadaeaf
         hex   b0b1b2b3b4b5b6b7b8b9babbbcbdbebf
         hex   c0c1c2c3c4c5c6c7c8c9cacbcccdcecf
         hex   d0d1d2d3d4d5d6d7d8d9dadbdcdddedf
         hex   e0e1e2e3e4e5e6e7e8e9eaebecedeeef
         hex   f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff
         hex   88958b8a

tblFNT16 asc   "ABCDEFGHIJ"
         asc   "KLMNOPQRST"
         asc   "UVWXYZ 012"
         asc   "3456789-"

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

intTEMP  dw    4,4,3,3,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         dw    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

*--- Types d'animation a faire

anCORRES dw    $9,$9,$9,$9
         dw    $2,$2,$2,$2
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    -1,-1,-1,-1
         dw    $6,$6,$6,$6
         dw    $3,$3,$3,$3

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

anSTAT   dw    $4b00,$4b0c,$4b18,$4b24,$4b30,$4b3c,$4b48,$4b54
         dw    $4b60,$4b6C,$4b78,$4b84,$4b90,-1

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

*--- Nombre Sprites animation fixe

sprNUM   dw    8,9,11,8,7,10,8,8,12,1,1,1,1,1,1,5,12
sprFIX   ds    2

*--- Mots de passe

allCODES hex   C4C7CDD8C4C6C8D6CAC4D6CCC4D1C7CC
         hex   CAD5D2CCC7C8CED1D1C8C5C4C6D5D8C6
         hex   D5C8D6D7D8D6CBC4C8D1D7D5CFC4C6D2
         hex   C5D2D7C6D5C8D3C4D2C6D7D2C4D1D9C4
         hex   C6D2C4C7D6D8D3D3D5C4DAC5D6CECCD7
         hex   D7C4D1CAD9CCCFCCC7C8D1C4CDD2CCD1
         hex   D9C4D0C5D7CBC8C4D8D1D3C4D6D8C5D2
         hex   CFC4D1C7D3C4D3DCD3D5C8D3D3C4D1C7
         hex   D1CCC9C8D6C4CCCFC5D5D2C6CCD1C7CC
         hex   C5D8D6CED3D8CFCCCFD2CACCD0C4D5C4
         hex   D2C6D7D2CACFC4C5D7D5CCD6C8D0C8D6
         hex   C6D2D1D9CDC8CBD2D5C8D1C7C6CFCCD1
         hex   D1C8CAC4D3D2CFDCD3C8D7D5C4C6C6C8
         hex   D6D3D2D1C8D1C6D5CFC4DDDCCBD2D0CC
         hex   CBC8D1C7D2D8D7CED3C4D3DCC8D3CCD3
         hex   C6D2C6CED6D7D8D0C8D7CBCCCAC4D1CA
         hex   CCD1CFC4C7D2D1C6CCD1D7C8C4D6D6C4
         hex   D0C4D6D7DAD2D2C7C4C5D5D2CCD1D6D7
         hex   C5C4C6CEC5C4D1C4C8C6CFD2DACBCCD3
         hex   CAD5D2CCCCD0D3D2C6D8C5C4C6D8C5C4
         hex   C7C8C6CFC7D5D2CFD6CCD0D3D8D1C7C8
         hex   D8D1CBD8D6C6CBD2CFC8CAC4D0D8D5C4
         hex   C4D1CCD0C6C4D7C8CFC4D8CAD0C4CAC4
         hex   D3C4CFD6C7DCD6D6C5D5D2C6D5C8D9C8
         hex   D3D2D5D5D8D1C7C8D8CCCAD8C4D3C8D5
         hex   D1D2D1CBD0CCD6C6D3C8D5D8D6D0CCD7
         hex   C7DCD6D6C7C8CED1C7CCD8D5CAC4D6CC
         hex   D2C7D2D5C6C4D8D6D3C8C4D6C4D1C6CB
         hex   D8D5D2D5C7C8C9C8D6D8C5C5D3CCC6CE
         hex   D5D8CFC4D6C6C4D5D1D2C7D8D2D2D3CB
         hex   C6D2C5C8CAC4CFC8D7D5D2CFD7C4C6D6
         hex   D3C8C4D6D9C4D0C5DBDCCFD2DACCD5C8
         hex   D6C6CCD8D0CCD1D7C8D8CAC8D5D8D1C8
         hex   C8D5D8D3D3CFD2D7D0C4D5CCC6D2D1CE
         hex   D1D8D5D6CBCCD6D3D6D1D2C5CBD2D0D2
         hex   D3D2D5D7C6C4D5D2C6CBC4D5CAC8C7C4
         hex   D8D1D1C8D3D2DAD6D3D2D2D1D5D2D0C4
         hex   D3D5C8C4D3D5C8D3D6C4CCCFDDD2D2D1
         hex   CCD6D2D6D1D8D5D6CBC8D1C7DAD2D2C7
         hex   C4CAD2D1D8D3D6D1CFC4D1C7C7CCD9D8
         hex   D1CCC6CED0C4D6D7D3CCC6CED5D2CFCF
         hex   D2D8D7D6D6D3D2D7CEC4CFC4C4C6C6C8
         hex   D7C8CFD2D5D8CFC4DAD2D5CECFC4D8C7
         hex   CAD5C4CCD8D3CFC4D3D2CFD2D2C6D7D2
         hex   D5C8D3C4C7C8D7C4C9C8CFC7D8D1C9D2
         hex   C5C4C7CCD9C8CFCFD3C4D7CCC5C8C8C9
         hex   D7CCD7C4D6C4D8C6D3D8D3CCD8D1D3D5
         hex   D0C4D6D7C8D5D8D3D4D8C4D5C9C8CFC7
         hex   CAD5CCC9D6CCC7C8DACBCCD7D8D1D1CC
         hex   C7D2DAD1CCD1D6D8D8D1CFCCCCD6D2D3
         hex   D0D8C4C7A3C7CCC5

*--- Lignes

Ligne    =     *

]Ligne   =     $0
         lup   200
         da    ]Ligne
]Ligne   =     ]Ligne+160
         --^
