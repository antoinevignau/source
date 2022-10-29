*--------------------------*
*                          *
*          COGITO          *
*                          *
*      Brutal  Deluxe      *
*                          *
* Version: 2.0 du 26/08/94 *
*--------------------------*

         mx    %00

         lst   off
         rel
         dsk   Cogito.l

         use   4/Int.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Misc.Macs
         use   4/Sound.Macs
         use   4/Tool220.Macs
         use   4/Util.Macs

*--- Parametres Page Zero

Debut    =     $00
Arrivee  =     $04

proDOS   =     $e100a8

*--------------------------
* Initialisations d'entree
*--------------------------

         phk
         plb

         _TLStartUp
         pha
         _MMStartUp
         pla
         sta   myID
         _MTStartUp
         _IMStartUp

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
         stal  $e0c035
         rep   #$20

*--- Libere et compacte la memoire

okIT1    PushLong #0
         PushLong #$8fffff
         PushWord myID
         PushWord #%11000000_00000000
         PushLong #0
         _NewHandle
         _DisposeHandle
         _CompactMem

*--- Verifie que l'on ait 512ko libres

         PushLong #0
         _FreeMem
         pla
         pla
         cmp   #8         ; 8*64ko
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
         sta   ptrHAPPY,x
         ldy   #2
         lda   [3],y
         sta   ptrHAPPY+2,x
         pld
         pla
         pla
         jsr   memERR
         inx
         inx
         inx
         inx
         stx   temp
         cpx   #4*8       ; 8 bancs
         bne   okIT3

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

*--------------------------
* Met les pointeurs
*--------------------------

         lda   ptrHAPPY
         clc
         adc   #$8000
         sta   ptrLUDY
         lda   ptrHAPPY+2
         sta   ptrLUDY+2

         lda   ptrPLANET
         clc
         adc   #$8000
         sta   ptrXENO
         lda   ptrPLANET+2
         sta   ptrXENO+2

         lda   ptrMESSAGE
         clc
         adc   #$8000
         sta   ptrSPRITES
         lda   ptrMESSAGE+2
         sta   ptrSPRITES+2

         lda   ptrSUPERMAN
         clc
         adc   #$8000
         sta   ptrUNPACK
         lda   ptrSUPERMAN+2
         sta   ptrUNPACK+2

         lda   ptrTOINET
         clc
         adc   #$8000
         sta   ptrSOUND1
         lda   ptrTOINET+2
         sta   ptrSOUND1+2

*--------------------------
* Presentation
*--------------------------

         lda   #pHAPPY
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT4
         brl   initOFF
okIT4    lda   ptrHAPPY+1
         ldy   #$8000
         jsr   unPACK

         lda   #pLUDY
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT5
         brl   initOFF
okIT5    lda   ptrLUDY+1
         ldy   #$8000
         jsr   unPACK

         lda   #pPLANET
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT6
         brl   initOFF
okIT6    lda   ptrPLANET+1
         ldy   #$8000
         jsr   unPACK

         lda   #pXENO
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT7
         brl   initOFF
okIT7    lda   ptrXENO+1
         ldy   #$8000
         jsr   unPACK

         lda   #pMESSAGE
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT8
         brl   initOFF
okIT8    lda   ptrMESSAGE+1
         ldy   #$8000
         jsr   unPACK

         lda   #pSPRITES
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT9
         brl   initOFF
okIT9    lda   ptrSPRITES+1
         ldy   #$8000
         jsr   unPACK

*-------------------------- Doc

         ldal  $e102e9    ; 0: francais
         cmp   #$0202     ; 1: autre
         beq   okDOC

         lda   #1
         sta   fgDOC
         bra   okDOC

         asc   'Good luck to find the Easter Eggs in the game...',8d

*-------------------------- Oliver's presentation

okDOC    lda   #pCOGITO
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT10
         brl   initOFF
okIT10   lda   ptrSOUND2+1
         ldy   #$9600
         jsr   unPACK

         lda   #pTOINET
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT11
         brl   initOFF
okIT11   lda   ptrTOINET+1
         ldy   #$8000
         jsr   unPACK

         lda   #pSUPERMAN
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   okIT12
         brl   initOFF
okIT12   lda   ptrSUPERMAN+1
         ldy   #$8000
         jsr   unPACK

*--- Tool 220 and zikmu

         PushWord #220
         PushWord #$0105
         _LoadOneTool
         bcs   okIT13

         lda   #pMUSIC
         ldx   ptrMUSIC+1
         jsr   loadFILE
         bcc   okIT14

okIT13   lda   #1         ; Music is not loaded
         sta   fgMUSIC

*--- It's up to you

okIT14   lda   ptrSOUND2+1
         jsr   do3200     ; show 3200 picture

         lda   ptrTOINET
         sta   Debut
         lda   ptrTOINET+2
         sta   Debut+2
         ldy   #$7ffe
]lp      tyx
         lda   [Debut],y
         stal  $012000,x
         dey
         dey
         bpl   ]lp

         jsr   startNT
         jsr   startZIK

         JSR   CADPRES    ; OLIVIER ***************

         STAL  $00C00F    ; ELIMINE UNE TOUCHE

         pha              ; Need to be frequently done
         _NTUpdateSound
         pla

         jsr   fadeOUT

*--- Avant de demarrer le jeu

         lda   #pSOUND1
         ldx   ptrSOUND1+1
         jsr   loadFILE
         bcc   okIT15

         lda   #1
         sta   fgSOUND1

okIT15   lda   #pSOUND2
         ldx   ptrSOUND2+1
         jsr   loadFILE
         bcc   okIT19

         lda   #1
         sta   fgSOUND2
         bra   okIT19

         asc   'What are you doing here again?',8D

*--------------------------
* Le programme
*--------------------------

*--- Debut du jeu niveau 1

okIT19   lda   ptrSPRITES+1
         sta   pntNum5+2

         sei
         PushLong #myVBL
         _SetHeartBeat
         PushLong #myRAN
         _SetHeartBeat
         cli

         stz   noINTER

         PushWord #2
         _IntSource

DEBUG    lda   #1
         sta   CurDecor   ; Image 'HappyLand'
         jsr   setDecor
         lda   #1
         sta   Niveau     ; Niveau 00
         sta   NbCoups
         sta   fgRANDOM   ; mode RANDOM
         sta   NbCompute
         stz   ldFlag

FIRST    stz   Diabolic   ; Initialise flags
         jsr   DoInit     ; Initialise dep/dec/nom
         jsr   DoDecor    ; Calcule le decor
         jsr   DoDeplacement
         jsr   DoFleches

*--- Deplace l'image a l'ecran (sans les palettes)

SECOND   lda   ptrDECOR+1 ; Deplace l'image du decor
         sta   Move+2
         lda   ptrDECOR
         sta   Move+1

         ldx   #$7dfe
Move     ldal  $012000,x
         stal  $012000,x
         dex
         dex
         bpl   Move

         jsr   PutArrows  ; Met les fleches
         jsr   ShowAll    ; Affiche le plateau

         lda   ptrDECOR+1 ; Montre le decor
         ldy   #-1
         jsr   fadeIN

         lda   ldFlag
         bne   ICI

         stz   Temps
         stz   Temps+2
         stz   Temps+4
         stz   NbCoups
         stz   NbCompute

ICI      jsr   OpenPanel  ; Ouvre le tableau
         jsr   ahNIVEAU   ; Affiche le niveau
         jsr   ahCOMPCP   ; Ah! Le nombre de deplacement
         jsr   ahMOICP
         jsr   ahTIME2

         lda   #1
         sta   noINTER

*--- On a demarre, maintenant melange

         lda   ldFlag
         bne   FIFTH

         jsr   ComputeIt  ; Deplace a l'ecran

AMEN     lda   firstENTRY
         bne   JESUISLA
         lda   #1
         sta   firstENTRY
         JMP   INITMOUS

JESUISLA jsr   SAUV
         lda   CurDecor
         dec
         asl
         tax
         lda   myTable,x
         JMP   PICT1

THIRD    sta   MyArrow    ; Sauve numero de fleche
         jsr   TestArrow  ; Est-ce que ca existe ?
         bcc   SIXTH

FIFTH    jsr   SAUV
         jmp   SOURIS1

SIXTH    lda   fgWHICH
         beq   SEVENTH
         lda   fgSOUND1
         bne   SEVENTH

         lda   #0
         jsr   playSND

SEVENTH  lda   NbCoups
         inc
         sta   NbCoups
         jsr   ahMOICP    ; Affiche mes coups
         jsr   ChoixMelange ; Fait le deplacement

         jsr   TestEnd    ; Regarde si fin de niveau
         bcs   FIFTH

*--- Is sound possible

         lda   fgWHICH
         beq   noSND

         lda   fgSOUND2
         bne   noSND

         lda   #1
         jsr   playSND

*--- Fin de niveau

noSND    stz   noINTER

         lda   fgRANDOM
         beq   PRR

         jsr   Random
         and   #3
         inc
         sta   CurDecor
         jsr   setDecor

PRR      stz   ldFlag
         inc   Niveau
         lda   Niveau
         cmp   #121
         bne   NEXT

         JSR   JAMAIS     ; GAGNE !!! (OPTIMISTE)
         lda   #1         ; End of game
         sta   Niveau
NEXT     jsr   fadeOUT
         brl   FIRST

         asc   'There is nothing interesting here! Truly!!',8D

*--- End of game

keyEND   stz   noINTER

         sei
         PushLong #myRAN
         _DelHeartBeat
         PushLong #myVBL
         _DelHeartBeat
         cli

*--- On quitte le programme

initOFF  ldx   #$7ffe
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

         lda   fgMUSIC
         bne   initOFF2

         _NTStopMusic
         _NTShutDown
         PushWord #220
         _UnloadOneTool

initOFF2 _SoundShutDown

         _IMShutDown
         _MTShutDown

         PushWord myID
         _DisposeAll
         _MMShutDown
         _TLShutDown

         jsl   proDOS
         dw    $2029
         adrl  proQuit

         asc   'Just for U: code 100 for The Tinies is MUADIBU',8D

*--- Chargement du fichier TEMP

TEMPload lda   #pTEMP
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcs   TPload1

         lda   ptrUNPACK
         sta   $00
         lda   ptrUNPACK+2
         sta   $02

         ldy   #0
]lp      lda   [$00],y
         sta   Probleme,y
         iny
         iny
         cpy   #342
         bne   ]lp

         lda   #1
         sta   ldFlag
         sta   vivaTOINET
         clc
         rts
TPload1  stz   ldFlag
         sec
         rts

*--------------------------
* Routines melange
*--------------------------

ChoixMelange lda WhichDep

         cmp   #1         ; Normal
         bne   melan2

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan2   cmp   #2         ; 2 cases dans la meme direction
         bne   melan3

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         jsr   DoScroll
         rts

*---

melan3   cmp   #3         ; Inversion N/E, S/O
         bne   melan4

         lda   MyArrow
         asl
         tax
         lda   TblMel38,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan4   cmp   #4         ; Normal sans fleches
         bne   melan5

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan5   cmp   #5         ; Inversion N/S, E/O
         bne   melan6

         lda   MyArrow
         asl
         tax
         lda   TblMel5,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan6   cmp   #6         ; N1=S9, E1=O9
         bne   melan7

         lda   MyArrow
         asl
         tax
         lda   TblMel67,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan7   cmp   #7         ; N1=N1+S9, N2=N2+S8
         bne   melan8

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         lda   MyArrow
         asl
         tax
         lda   TblMel67,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan8   cmp   #8         ; N1=N1+E1, S1=S1+O1
         bne   melan9

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         lda   MyArrow
         asl
         tax
         lda   TblMel38,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan9   cmp   #9         ; N1=N1+N9, N2=N2+N8
         bne   melan10

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         lda   MyArrow
         asl
         tax
         lda   TblMel9,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan10  cmp   #10        ; Manque fleches, sinon comme 8
         bne   melan11

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         lda   MyArrow
         asl
         tax
         lda   TblMel38,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan11  cmp   #11        ; N1=N1+N2, O1=O1+O2
         bne   melan12

         lda   MyArrow
         asl
         sta   MyColumn
         jsr   DoScroll
         lda   MyArrow
         asl
         tax
         lda   TblMel11,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

*---

melan12  lda   MyArrow    ; N4=N4+N2, N9=N9+N7
         asl
         sta   MyColumn
         jsr   DoScroll
         lda   MyArrow
         asl
         tax
         lda   TblMel12,x
         asl
         sta   MyColumn
         jsr   DoScroll
         rts

         asc   'Nice sunday at Olivier s home: drinking Pepsi, eating Pizza, reading Playboy (US edition) !!!',8D

*--- Regarde si la fleche X existe

TestArrow lda  MyArrow
         asl
         tax
         lda   Fleches2,x
         bne   TstArr1
         sec              ; Fleche n'existe pas
         rts
TstArr1  clc              ; Fleche existe
         rts

*--- L'ordinateur choisit

ComputeIt jsr  Random
         beq   ComputeIt
         cmp   #37
         bcs   ComputeIt
         dec              ; Pour 0-36
         cmp   MyArrow
         beq   ComputeIt
         sta   MyArrow

         jsr   TestArrow  ; Fleche existe ?
         bcs   ComputeIt  ; non, si C=1
komp1    lda   NbCompute
         inc
         sta   NbCompute
         jsr   ahCOMPCP   ; Ah! Le nombre de deplacement
         jsr   ChoixMelange ; Melange

komp2    lda   NbCompute
         cmp   NbMelange
         bne   ComputeIt

         jsr   TestEnd    ; Plateau=Probleme ?
         bcc   ComputeIt  ; C=0, oui, recommence

         lda   Diabolic
         bne   komp3
         rts

komp3    stz   Diabolic   ; Re-affiche le plateau
         lda   #$0001     ; Apres avoir melange suivant Diabolic
         sta   Arrivee+2
         lda   ptrSPRITES+2
         sta   Debut+2
         ldx   #0         ; Write Big plateau
]lp      phx
         lda   Plateau,x
         jsr   WriteBig
         plx
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*--- Compare les deux plateaux

TestEnd  ldx   #0
]lp      lda   Plateau,x  ; C=1, c'est le meme
         cmp   Probleme,x ; C=0, different
         bne   TstEnd1
         inx
         inx
         cpx   #81*2
         bne   ]lp
         clc
         rts
TstEnd1  sec              ; Erreur
         rts

*--- Initialise les donnees de decor, deplacement et nom

DoInit   lda   Niveau
         dec
         asl
         tax
         lda   ChoixDeplace,x
         sta   WhichDep   ; Type de deplacement
         lda   ChoixDecor,x
         sta   WhichDecor ; Type de decor pour la creation

         lda   CurDecor   ; Adresse du decor
         dec
         asl
         tax
         lda   sprDecor,x
         sta   AdrDecor
         rts

*--- Prepare le decor

DoDecor  lda   ldFlag
         bne   noDec

         lda   WhichDecor
         dec
         asl
         tax
         jsr   (AdrCalcDec,x)
noDec    rts

*--- Prepare les deplacements

DoDeplacement lda ldFlag
         bne   noDep

         lda   WhichDep
         dec
         asl
         tax
         lda   TblDeplacement,x
         sta   NbMelange
         ldx   #0
         cmp   #500
         bne   Dep1
         inx
Dep1     stx   Diabolic
noDep    rts

*--- Prepare les fleches suivant le deplacement

DoFleches lda  Niveau
         cmp   #24
         bcs   FlechesA

         ldx   #0         ; On deplace sur 9
         lda   #9
]lp      sta   Fleches,x
         inx
         inx
         cpx   #36*2
         bne   ]lp
         brl   FlechesE

*---

FlechesA cmp   #48
         bcs   FlechesB

         ldx   #0         ; On deplace sur 5
         lda   #5
]lp      sta   Fleches,x
         inx
         inx
         cpx   #36*2
         bne   ]lp
         brl   FlechesE

*---

FlechesB cmp   #72
         bcs   FlechesC

         ldx   #0         ; On deplace sur 6 et 4
]lp      lda   #6
         sta   Fleches,x
         sta   Fleches+36,x
         lda   #4
         sta   Fleches+18,x
         sta   Fleches+54,x
         inx
         inx
         cpx   #9*2
         bne   ]lp
         brl   FlechesE

*---

FlechesC cmp   #99
         bcs   FlechesD

         ldx   #0         ; On deplace sur 6, 4, 7 et 3
]lp      lda   #6
         sta   Fleches,x
         lda   #4
         sta   Fleches+18,x
         lda   #7
         sta   Fleches+36,x
         lda   #3
         sta   Fleches+54,x
         inx
         inx
         cpx   #9*2
         bne   ]lp

         lda   #3
         sta   Fleches+6
         sta   Fleches+8
         sta   Fleches+10
         lda   #7
         sta   Fleches+24
         sta   Fleches+26
         sta   Fleches+28
         brl   FlechesE

*---

FlechesD ldx   #0         ; On deplace sur 8 et 3
]lp      lda   #8
         sta   Fleches,x
         sta   Fleches+36,x
         lda   #3
         sta   Fleches+18,x
         sta   Fleches+54,x
         inx
         inx
         cpx   #9*2
         bne   ]lp

*---

FlechesE lda   WhichDep
         cmp   #4
         beq   FlechesG
         cmp   #10
         beq   FlechesG

FlechesF ldx   #0
         lda   #1
]lp      sta   Fleches2,x
         inx
         inx
         cpx   #36*2
         bne   ]lp
         rts

FlechesG jsr   FlechesF
         stz   Fleches2+2 ; Inhibe des fleches
         stz   Fleches2+12
         stz   Fleches2+20
         stz   Fleches2+22
         stz   Fleches2+30
         stz   Fleches2+38
         stz   Fleches2+48
         stz   Fleches2+56
         stz   Fleches2+58
         stz   Fleches2+66
         rts

         asc   'Special hello to Maria Checa, playmate of the month (Aug.94)',8D
         asc   'We love your smile and many more... :-)',8D

*--------------------------
* Routines mathematiques
*--------------------------

ahCOMPCP lda   #'00'
         sta   StrPtr
         sta   StrPtr+1

         PushWord NbCompute
         PushLong #StrPtr
         PushWord #3
         PushWord #0
         _Int2Dec

         lda   CurDecor
         dec
         asl
         tax
         lda   zeCOMPCP,x
         tax
         lda   #StrPtr
         ldy   #$640
         jsr   printNUM
         rts

*--- Affiche mon nombre de coups

ahMOICP  lda   #'00'
         sta   LgStrPtr
         sta   LgStrPtr+2
         sta   LgStrPtr+4
         sta   LgStrPtr+5

         PushLong NbCoups
         PushLong #LgStrPtr
         PushWord #7
         PushWord #0
         _Long2Dec

         lda   CurDecor
         dec
         asl
         tax
         lda   zeMOICP,x
         tax
         lda   #LgStrPtr
         ldy   #$140
         jsr   printNUM
         rts

*--- Affiche le niveau

ahNIVEAU jsr   chNIVEAU

         lda   CurDecor
         dec
         asl
         tax
         lda   zeNIVEAU,x
         tax
         lda   #StrPtr
         ldy   #$640
         jsr   printNUM
         rts

chNIVEAU lda   #'00'
         sta   StrPtr
         sta   StrPtr+1

         PushWord Niveau
         PushLong #StrPtr
         PushWord #3
         PushWord #0
         _Int2Dec
         rts

*--- Gestion du temps (interruption VBL)

ahTIME   lda   CurDecor   ; Si le curseur
         dec              ; est sur le temps, c'est ici
         asl
         tax
         LDA   POSY
         CMP   PanelY2,x
         BPL   time       ; POSY > Y2
         CMP   PanelY1,x
         BMI   time

         LDA   POSX
         CMP   PanelX2,x
         BPL   time       ; POSX < X2
         CMP   PanelX1,x
         BMI   time

         JSR   DESS1
         inc   fgTIME     ; LE CURSEUR DE LA SOURIS EST SUR LE TEMPS

time     lda   Temps+4
         inc
         cmp   #60
         beq   time1
         sta   Temps+4
         brl   time6

time1    stz   Temps+4
         lda   Temps+2
         inc
         cmp   #60
         beq   time2
         sta   Temps+2
         brl   time5

time2    stz   Temps+2
         lda   Temps
         inc
         cmp   #60
         beq   time3
         sta   Temps
         bra   ahTIME2
time3    stz   Temps

ahTIME2  lda   #'00'
         sta   StrTime
         PushWord Temps
         PushLong #StrTime
         PushWord #2
         PushWord #0
         _Int2Dec
         lda   CurDecor
         dec
         asl
         tax
         lda   zeTEMPS1,x
         tax
         lda   #StrTime
         ldy   #$140
         jsr   printNUM

time5    lda   #'00'
         sta   StrTime
         PushWord Temps+2
         PushLong #StrTime
         PushWord #2
         PushWord #0
         _Int2Dec
         lda   CurDecor
         dec
         asl
         tax
         lda   zeTEMPS2,x
         tax
         lda   #StrTime
         ldy   #$140
         jsr   printNUM

time6    lda   #'00'
         sta   StrTime
         PushWord Temps+4
         PushLong #StrTime
         PushWord #2
         PushWord #0
         _Int2Dec
         lda   CurDecor
         dec
         asl
         tax
         lda   zeTEMPS3,x
         tax
         lda   #StrTime
         ldy   #$140
         jsr   printNUM

         lda   fgTIME
         beq   time7

         stz   fgTIME     ; LE CURSEUR EST SUR LE TEMPS
         JSR   SAUV       ; SAUVEGARDE LE FOND
         JSR   TRACE6     ; DESSINE LE POINTEUR

time7    rts

*--- Charge le decor

setDecor lda   CurDecor
         dec
         asl
         tax
         lda   proDecor,x
         asl
         asl
         tax
         lda   ptrHAPPY,x
         sta   ptrDECOR
         lda   ptrHAPPY+2,x
         sta   ptrDECOR+2
         rts

         asc   'Full Apple IIgs Planete: soon... :-O',8D

*--------------------------
* Creation des decors
*--------------------------

Decor1   jsr   Random     ; couleur 1
         beq   Decor1
         cmp   #7
         bcs   Decor1
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB

         ldx   #0         ; met le fond
         lda   colorA
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp

         lda   colorB     ; met le motif
         sta   Plateau+60
         sta   Probleme+60
         sta   Plateau+62
         sta   Probleme+62
         sta   Plateau+64
         sta   Probleme+64
         sta   Plateau+78
         sta   Probleme+78
         sta   Plateau+80
         sta   Probleme+80
         sta   Plateau+82
         sta   Probleme+82
         sta   Plateau+96
         sta   Probleme+96
         sta   Plateau+98
         sta   Probleme+98
         sta   Plateau+100
         sta   Probleme+100
         rts

*---

Decor2   jsr   Random     ; couleur 1
         beq   Decor2
         cmp   #7
         bcs   Decor2
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB

         ldx   #0         ; met couleur 1
         lda   colorA
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #36*2
         bne   ]lp

         ldx   #36*2      ; met couleur 2
         lda   colorB
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*---

Decor3   jsr   Random     ; couleur 1
         beq   Decor3
         cmp   #7
         bcs   Decor3
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB
]lp      jsr   Random     ; couleur 3
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         cmp   colorB
         beq   ]lp
         sta   colorC

         ldx   #0         ; met le motif
]lp      lda   colorA
         sta   Plateau,x
         sta   Probleme,x
         sta   Plateau+2,x
         sta   Probleme+2,x
         sta   Plateau+4,x
         sta   Probleme+4,x
         lda   colorB
         sta   Plateau+6,x
         sta   Probleme+6,x
         sta   Plateau+8,x
         sta   Probleme+8,x
         sta   Plateau+10,x
         sta   Probleme+10,x
         lda   colorC
         sta   Plateau+12,x
         sta   Probleme+12,x
         sta   Plateau+14,x
         sta   Probleme+14,x
         sta   Plateau+16,x
         sta   Probleme+16,x
         txa
         clc
         adc   #9*2
         tax
         cpx   #81*2
         bne   ]lp
         rts

*---

Decor4   jsr   Random     ; couleur 1
         beq   Decor4
         cmp   #7
         bcs   Decor4
         sta   colorA
]lp      jsr   Random     ; couleur 2
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         sta   colorB
]lp      jsr   Random     ; couleur 3
         beq   ]lp
         cmp   #7
         bcs   ]lp
         cmp   colorA
         beq   ]lp
         cmp   colorB
         beq   ]lp
         sta   colorC

         ldx   #0         ; met le motif 1
         lda   colorA
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #27*2
         bne   ]lp

         ldx   #27*2      ; met le motif 2
         lda   colorB
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #54*2
         bne   ]lp

         ldx   #54*2      ; met le motif 3
         lda   colorC
]lp      sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*--- Simplification par tableaux deja en memoire

Decor5   lda   #AdrDecor5
         bra   DecorA
Decor6   lda   #AdrDecor6
         bra   DecorA
Decor7   lda   #AdrDecor7
         bra   DecorA
Decor8   lda   #AdrDecor8
         bra   DecorA
Decor9   lda   #AdrDecor9

DecorA   sta   DecorB+1
         ldx   #0
DecorB   lda   $ffff,x
         sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   DecorB
         rts

*---

Decor10  ldx   #0
]lp      stz   Plateau,x
         stz   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp

         ldx   #0
]lp      jsr   Random     ; Random2
         bne   Decor10a
         inc
Decor10a cmp   #7
         bcs   ]lp

         sta   Plateau,x
         sta   Probleme,x
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*--- Affiche tous les pions

ShowAll  lda   #$0001
         sta   Arrivee+2
         lda   ptrSPRITES+2
         sta   Debut+2

         ldx   #0
]lp      phx
         lda   Plateau,x
         jsr   WriteBig
         plx
         phx
         lda   Probleme,x
         jsr   WriteSmall
         plx
         inx
         inx
         cpx   #81*2
         bne   ]lp
         rts

*--- Ouvre le tableau

OpenPanel ldx  #0         ; Commence sprite 0 en 1
openPAN1 phx
         lda   CurDecor
         dec
         asl
         tay
         lda   zePANEL,y
         clc
         adc   #$2000
         sta   Panel2+1

         lda   ptrSPRITES+1
         sta   Panel1+2
         lda   ptrSPRITES
         clc
         adc   zePANEL2,x
         sta   Panel1+1
         jsr   PutPanel

         ldx   #1
]lp      jsr   nextVBL
         jsr   nextVBL
         dex
         bpl   ]lp

         plx
         inx
         inx
         cpx   #26
         bne   openPAN1
         rts

*---

PutPanel ldy   #19
Panel    ldx   #18
         sep   #$20
Panel1   ldal  $012000,x
Panel2   stal  $012000,x
         dex
         bpl   Panel1
         rep   #$20

         lda   Panel1+1
         clc
         adc   #$a0
         sta   Panel1+1
         lda   Panel2+1
         clc
         adc   #$a0
         sta   Panel2+1
         dey
         bpl   Panel
         rts

*--- Affiche les fleches

PutArrows lda  ptrSPRITES+1
         sta   NSpnt4+2
         sta   EOpnt4+2

         ldx   #0         ; Au nord
]lp      phx
         lda   Fleches2,x
         beq   nxtArr1
         lda   Fleches,x
         ldy   #0
         jsr   PrintNS
nxtArr1  plx
         inx
         inx
         cpx   #18
         bne   ]lp

         ldx   #18        ; A l'est
]lp      phx
         lda   Fleches2,x
         beq   nxtArr2
         lda   Fleches,x
         ldy   #0
         jsr   PrintEO
nxtArr2  plx
         inx
         inx
         cpx   #36
         bne   ]lp

         ldx   #36        ; Au sud
]lp      phx
         lda   Fleches2,x
         beq   nxtArr3
         lda   Fleches,x
         ldy   #0
         jsr   PrintNS
nxtArr3  plx
         inx
         inx
         cpx   #54
         bne   ]lp

         ldx   #54        ; A l'ouest
]lp      phx
         lda   Fleches2,x
         beq   nxtArr4
         lda   Fleches,x
         ldy   #0
         jsr   PrintEO
nxtArr4  plx
         inx
         inx
         cpx   #72
         bne   ]lp

         rts

         asc   'Joke of the month: FTA rules... ahahahah',8D

*--- Affichage ecran des boutons

PrintNS  sty   NSpnt3+1

         lda   AdrScrBtn,x ; Adresse ecran des boutons
         sta   NSpnt5+1
         cpx   #18        ; Si au nord, si au sud
         bcs   NSpnt1
         lda   #0         ; on veut sprite 0
         beq   NSpnt2
NSpnt1   lda   #8         ; on veut sprite 8
NSpnt2   clc
NSpnt3   adc   #0
         tax
         lda   sprButtn,x ; Adresse planche de sprites des buttns
         clc
         adc   AdrDecor
         clc
         adc   ptrSPRITES
         sta   NSpnt4+1

         ldy   #7
]lp      ldx   #6
NSpnt4   ldal  $012000,x
NSpnt5   stal  $012000,x
         dex
         dex
         bpl   NSpnt4

         lda   NSpnt4+1
         clc
         adc   #$a0
         sta   NSpnt4+1
         lda   NSpnt5+1
         clc
         adc   #$a0
         sta   NSpnt5+1
         dey
         bpl   ]lp
         rts

*--- Affichage bouton E/O

PrintEO  sty   EOpnt3+1

         lda   AdrScrBtn,x ; Adresse ecran des boutons
         sta   EOpnt5+1
         cpx   #36        ; Si a l'est, si a l'ouest
         bcs   EOpnt1
         lda   #4         ; on veut sprite 4
         bra   EOpnt2
EOpnt1   lda   #12        ; on veut sprite 12
EOpnt2   clc
EOpnt3   adc   #0
         tax
         lda   sprButtn,x ; Adresse planche de sprites des buttns
         clc
         adc   AdrDecor
         clc
         adc   ptrSPRITES
         sta   EOpnt4+1

         ldy   #13
]lp      ldx   #2
EOpnt4   ldal  $012000,x
EOpnt5   stal  $012000,x
         dex
         dex
         bpl   EOpnt4

         lda   EOpnt4+1
         clc
         adc   #$a0
         sta   EOpnt4+1
         lda   EOpnt5+1
         clc
         adc   #$a0
         sta   EOpnt5+1
         dey
         bpl   ]lp
         rts

*--------------------------
* Routines scrolls
*--------------------------

DoScroll lda   MyColumn   ; Ma colonne
         cmp   #18
         bcs   scrol1
         brl   ScrollNorth
scrol1   cmp   #36
         bcs   scrol2
         brl   ScrollEast
scrol2   cmp   #54
         bcs   scrol3
         brl   ScrollSouth
scrol3   brl   ScrollWest

*--- Scroll plateau haut->bas

ScrollNorth ldx MyColumn
         lda   TblPlateau,x
         sta   MyArrivee

         lda   Fleches,x
         dec
         asl
         tax
         lda   TblPlateau2,x
         clc
         adc   MyArrivee
         sta   MyDepart

         ldx   MyDepart
         lda   Plateau,x
         tay
]lp      txa
         sec
         sbc   #18
         tax
         lda   Plateau,x
         sta   Plateau+18,x
         cpx   MyArrivee
         bne   ]lp
         tya
         sta   Plateau,x

         lda   Diabolic
         bne   noScrN
         jsr   ScrNorth
noScrN   rts

*--- Scroll plateau droite->gauche

ScrollEast ldx MyColumn
         lda   TblPlateau,x
         clc
         adc   #2
         sta   MyArrivee

         lda   Fleches,x
         asl
         sta   PlaEast1+1

         lda   MyArrivee
         sec
PlaEast1 sbc   #$0000
         sta   MyDepart

         ldx   MyDepart
         lda   Plateau,x
         tay
]lp      lda   Plateau+2,x
         sta   Plateau,x
         inx
         inx
         cpx   MyArrivee
         bne   ]lp
         tya
         sta   Plateau-2,x

         lda   Diabolic
         bne   noScrE
         jsr   ScrEast
noScrE   rts

*--- Scroll plateau bas->haut

ScrollSouth ldx MyColumn
         lda   TblPlateau,x
         sta   MyArrivee

         lda   Fleches,x
         dec
         asl
         tax
         lda   TblPlateau2,x
         sta   PlaSouth1+1

         lda   MyArrivee
         sec
PlaSouth1 sbc  #$ffff
         sta   MyDepart

         ldx   MyDepart
         lda   Plateau,x
         tay
]lp      lda   Plateau+18,x
         sta   Plateau,x
         txa
         clc
         adc   #18
         tax
         cpx   MyArrivee
         bne   ]lp
         tya
         sta   Plateau,x

         lda   Diabolic
         bne   noScrS
         jsr   ScrSouth
noScrS   rts

*--- Scroll plateau gauche->droite

ScrollWest ldx MyColumn
         lda   TblPlateau,x
         sta   MyArrivee

         lda   Fleches,x
         asl
         clc
         adc   MyArrivee
         sec
         sbc   #2
         sta   MyDepart

         ldx   MyDepart
         lda   Plateau,x
         tay
]lp      dex
         dex
         lda   Plateau,x
         sta   Plateau+2,x
         cpx   MyArrivee
         bne   ]lp
         tya
         sta   Plateau,x

         lda   Diabolic
         bne   noScrW
         jsr   ScrWest
noScrW   rts

*--------------------------
* Routines scrolls ecran
*--------------------------

*--- Scroll plateau haut->bas

ScrNorth ldx   MyArrivee
         lda   scrBig,x
         sta   MyScrArr

         lda   MyDepart
         clc
         adc   #18
         tax
         lda   scrBig,x
         sec
         sbc   #$a0
         sta   MyScrDep

         ldy   #13
scrN1    ldx   MyScrDep
         ldal  $012000,x
         sta   Buffer
         ldal  $012002,x
         sta   Buffer+2
         ldal  $012004,x
         sta   Buffer+4
         ldal  $012006,x
         sta   Buffer+6

]lp      txa
         sec
         sbc   #$a0
         tax
         ldal  $012000,x  ; Deplace vers le haut
         stal  $0120a0,x
         ldal  $012002,x
         stal  $0120a2,x
         ldal  $012004,x
         stal  $0120a4,x
         ldal  $012006,x
         stal  $0120a6,x
         cpx   MyScrArr
         bne   ]lp

         ldx   MyScrArr
         lda   Buffer
         stal  $012000,x
         lda   Buffer+2
         stal  $012002,x
         lda   Buffer+4
         stal  $012004,x
         lda   Buffer+6
         stal  $012006,x

         jsr   nextVBL
         dey
         bpl   scrN1
         rts

*--- Scroll plateau droite->gauche

ScrEast  lda   MyArrivee
         sec
         sbc   #2
         tax
         lda   scrBig,x
         clc
         adc   #7
         sta   MyScrArr

         ldx   MyDepart
         lda   scrBig,x
         sta   MyScrDep

         lda   MyScrArr
         sec
         sbc   MyScrDep
         sta   MyScrLth

         lda   #7
         sta   CSEtemp

*---

scrE1    lda   #$0001
         sta   Arrivee+2
         sta   Debut+2
         lda   #$2000
         clc
         adc   MyScrDep
         sta   Arrivee
         inc
         sta   Debut

         ldx   #13
scrE2    sep   #$30
         ldy   #0
         lda   [Arrivee],y
         sta   Buffer
]lp      lda   [Debut],y
         sta   [Arrivee],y
         iny
         cpy   MyScrLth
         bne   ]lp
         lda   Buffer
         sta   [Arrivee],y

         rep   #$30
         lda   Arrivee
         clc
         adc   #$a0
         sta   Arrivee
         inc
         sta   Debut
         dex
         bpl   scrE2

         jsr   nextVBL
         dec   CSEtemp
         bpl   scrE1
         rts

*--- Scroll plateau bas->haut

ScrSouth lda   MyArrivee
         clc
         adc   #18
         tax
         lda   scrBig,x
         sec
         sbc   #$a0
         sta   MyScrArr

         ldx   MyDepart
         lda   scrBig,x
         sta   MyScrDep

         ldy   #13
scrS1    ldx   MyScrDep
         ldal  $012000,x
         sta   Buffer
         ldal  $012002,x
         sta   Buffer+2
         ldal  $012004,x
         sta   Buffer+4
         ldal  $012006,x
         sta   Buffer+6

]lp      ldal  $0120a0,x  ; Deplace vers le haut
         stal  $012000,x
         ldal  $0120a2,x
         stal  $012002,x
         ldal  $0120a4,x
         stal  $012004,x
         ldal  $0120a6,x
         stal  $012006,x
         txa
         clc
         adc   #$a0
         tax
         cpx   MyScrArr
         bne   ]lp

         ldx   MyScrArr
         lda   Buffer
         stal  $012000,x
         lda   Buffer+2
         stal  $012002,x
         lda   Buffer+4
         stal  $012004,x
         lda   Buffer+6
         stal  $012006,x

         jsr   nextVBL
         dey
         bpl   scrS1
         rts

*--- Scroll plateau gauche->droite

ScrWest  ldx   MyArrivee
         lda   scrBig,x
         sta   MyScrArr

         ldx   MyDepart
         lda   scrBig,x
         clc
         adc   #7
         sta   MyScrDep

         lda   MyScrDep
         sec
         sbc   MyScrArr
         sta   MyScrLth

         lda   #7
         sta   CSEtemp

*---

scrW1    lda   #$0001
         sta   Arrivee+2
         sta   Debut+2
         lda   #$2000
         clc
         adc   MyScrArr
         sta   Arrivee
         dec
         sta   Debut

         ldx   #13
scrW2    sep   #$30
         ldy   MyScrLth
         lda   [Arrivee],y
         sta   Buffer
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         bpl   ]lp
         iny
         lda   Buffer
         sta   [Arrivee],y

         rep   #$30
         lda   Arrivee
         clc
         adc   #$a0
         sta   Arrivee
         dec
         sta   Debut
         dex
         bpl   scrW2

         jsr   nextVBL
         dec   CSEtemp
         bpl   scrW1
         rts

*--------------------------
* Sprites routines
*--------------------------

WriteBig dec
         asl              ; Calcule adresse du sprite big
         tay
         lda   sprBig,y
         clc
         adc   AdrDecor
         clc
         adc   ptrSPRITES
         sta   Debut

         lda   scrBig,x   ; Calcule adresse arrivee
         clc
         adc   #$2000
         sta   Arrivee

         ldx   #$000d
]lp      ldy   #0
         lda   [Debut],y  ; Arriv: destination
         sta   [Arrivee],y ; Debut: source
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

         lda   Debut
         clc
         adc   #$a0
         sta   Debut

         lda   Arrivee
         clc
         adc   #$a0
         sta   Arrivee

         dex
         bpl   ]lp
         rts

*--- Affiche un petit sprite

WriteSmall dec
         asl              ; Calcule adresse du sprite small
         tay
         lda   sprSmall,y
         clc
         adc   AdrDecor
         clc
         adc   ptrSPRITES
         sta   Debut

         lda   scrSmall,x ; Calcule adresse arrivee
         clc
         adc   #$2000     ; $2140
         sta   Arrivee

         ldx   #$0006
]lp      ldy   #0
         lda   [Debut],y  ; Arriv: destination
         sta   [Arrivee],y ; Debut: source
         iny
         iny
         lda   [Debut],y
         sta   [Arrivee],y

         lda   Debut
         clc
         adc   #$a0
         sta   Debut

         lda   Arrivee
         clc
         adc   #$a0
         sta   Arrivee

         dex
         bpl   ]lp
         rts

         asc   'BIG Shit to Yoshi, you, little lamer',8D
         asc   'Do something for the IIgs before you criticize us :-D',8D

*--------------------------
* Routines sonores
*--------------------------

startNT  tdc
         clc
         adc   #$100
         pha
         _NTStartUp
         rts

startZIK PushLong ptrMUSIC
         _NTInitMusic
         _NTLaunchMusic
         rts

stopZIK  _NTStopMusic
         rts

stopNT   _NTStopMusic
         _NTShutDown
         rts

*---

startSND tdc
         clc
         adc   #$0100
         pha
         _SoundStartUp
         rts

playSND  cmp   #1
         beq   playEND

         ldx   ptrSOUND1
         ldy   ptrSOUND1+2
         lda   #$28
         bra   playZEN

playEND  ldx   ptrSOUND2
         ldy   ptrSOUND2+2
         lda   #$eb

playZEN  stx   pZIKptr
         sty   pZIKptr+2
         sta   pZIKptr+4

         PushWord #%01111111_11111111
         _FFStopSound
         PushWord #$0201
         PushLong #pZIKptr
         _FFStartSound
         rts

stopSND  _SoundShutDown
         rts

pZIKptr  ds    4
         ds    2
         dw    $1b7
         dw    $8000
         dw    $6
         ds    4
         dw    $ff

*--------------------------
* Routines gs/os
*--------------------------

loadFILE sta   proOpen+4
         stx   proRead+5

loadFILE1 jsl  proDOS
         dw    $2010
         adrl  proOpen
         bcs   loadERR
         lda   proOpen+2
         sta   proGetEof+2
         sta   proRead+2

         jsl   proDOS
         dw    $2019
         adrl  proGetEof
         lda   proGetEof+4
         sta   sizeEOF
         sta   proRead+8
         lda   proGetEof+6
         sta   proRead+10

         jsl   proDOS
         dw    $2012
         adrl  proRead
         bcs   loadERR

loadFILE2 jsl  proDOS
         dw    $2014
         adrl  proClose
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

saveFILE jsl   proDOS
         dw    $2005
         adrl  proInfo

         jsl   proDOS
         dw    $2002
         adrl  proKill

         jsl   proDOS
         dw    $2001
         adrl  proCreate
         bcs   saveERR

         lda   #pTEMP
         sta   proOpen+4
         lda   #^pTEMP
         sta   proOpen+6

         jsl   proDOS
         dw    $2010
         adrl  proOpen

         lda   proOpen+2
         sta   proWrite+2
         sta   proClose+2

         jsl   proDOS
         dw    $2013
         adrl  proWrite

saveFILE2 jsl  proDOS
         dw    $2014
         adrl  proClose

         rts

saveERR  PushWord #0
         PushLong #proSTR11
         PushLong #proSTR2
         PushLong #proSTR31
         PushLong #proSTR41
         _TLTextMountVolume
         pla
         cmp   #1
         bne   saveFILE2
         brl   saveFILE

         asc   'Whose turn is it now??',8D

*--------------------------
* Routines diverses
*--------------------------

*--- Erreur de memoire

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

*--- Attend une synchro ecran

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

*--- unPACK un fichier

unPACK   sta   decPIC+1

         lda   ptrUNPACK+1
         sta   decBUF+1
         sty   decSIZ
         PushWord #$0000
         PushLong decBUF
         PushWord sizeEOF
         PushLong #decPIC
         PushLong #decSIZ
         _UnPackBytes
         pla
         rts

*--- Genere un nombre aleatoire

Random   ldal  $e0c02e
         xba
         clc
         adc   VBLCounter0
         sta   VBLCounter0
         and   #$ff
         rts

*--- Attend A secondes

nowWait  dec
         tax
         lda   #0
]lp      clc
         adc   #60
         cpx   #0
         beq   Wait1
         dex
         bra   ]lp
Wait1    pha
         jsr   waitVBL
         bcc   Wait2
]lp      ldal  $e0c019
         and   #$80
         bne   ]lp
         pla
         dec
         bne   Wait1
         sec
         rts
Wait2    plx
         clc
         rts

*--------------------------
* Interruption VBL
*--------------------------

myVBL    ds    4
VBLcnt   da    60
         da    $a55a

         phb
         phk
         plb
         rep   #$30

         lda   #60
         sta   VBLcnt
         lda   noINTER
         beq   noVBL
         jsr   ahTIME

noVBL    sep   #$30
         plb
         clc
         rtl

         mx    %00        ; A laisser pour avoir suite en 16 bits

*---

myRAN    ds    4          ;link
RANcnt   da    1          ;count
         da    $a55a      ;signature

         phb
         phk
         plb
         rep   #$30

         inc   VBLCounter0

         lda   #1
         sta   RANcnt
         sep   #$30
         plb
         clc
         rtl

         mx    %00

*--------------------------
* Routines graphiques
*--------------------------

*--- Affiche une chaine de nombres (petits caracteres)

printNUM sta   pntNum1+1
         txa
         sta   pntNum4+1
         sty   pntNum3+1

pntNum1  lda   $ffff      ; Prend caractere
         and   #$00ff
         bne   pntNum2
         rts

pntNum2  cmp   #$20
         bne   pntNum2a
         lda   #'0'
pntNum2a sec
         sbc   #'0'
         asl
         tax              ; Adresse du caractere
         lda   sprNum,x
         sta   pntNum3A+1
         lda   CurDecor   ; Rajoute adresse decor
         dec
         asl
         tax
         lda   sprDecor,x
         clc
         adc   ptrSPRITES
         clc
pntNum3  adc   #$ffff
         clc
pntNum3A adc   #$ffff
         sta   pntNum5+1

pntNum4  lda   #$ffff
         clc
         adc   #$2000     ; +$2000, debut d'ecran
         sta   pntNum6+1
         inc   pntNum1+1

         ldy   #4
         ldx   #0
pntNum5  ldal  $012000,x
pntNum6  stal  $012000,x

         lda   pntNum5+1
         clc
         adc   #$a0
         sta   pntNum5+1
         lda   pntNum6+1
         clc
         adc   #$a0
         sta   pntNum6+1
         dey
         bpl   pntNum5

         lda   pntNum4+1
         clc
         adc   #2
         sta   pntNum4+1
         brl   pntNum1

*--- fade in

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

*-------------------------- Routine 3200

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

         stz   temp

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

do32005  lda   temp
         inc
         sta   temp
         cmp   #150
         beq   do32006
         brl   do32003

do32006  ldal  $e0c068
         and   #$cf
         stal  $e0c068

*--- End of routine

         cli

         lda   mySTACK
         tcs
         pld
         phk
         plb
         rts

*-------------------------- Olivier's place

         put   Cogito.Main
         put   Cogito.Bout

*--------------------------
* All the datas
*--------------------------

*--- Parametres du jeu

Probleme ds    162
Plateau  ds    162

Niveau   ds    2
NbCoups  ds    4
NbCompute ds   2
Temps    ds    6

CurDecor ds    2

         hex   8d8d
         asc   '------------- Cogito -------------',8d
         asc   'Programme original: Jerome Cretaux',8d
         asc   'Version Apple //gs: Antoine Vignau',8d
         asc   '                   Olivier Zardini',8d
         asc   '----------- 26 08 1994 -----------',8d,8d

*--- Tables des adresses des datas

AdrCalcDec da  Decor1,Decor2,Decor3,Decor4,Decor5
         da    Decor6,Decor7,Decor8,Decor9,Decor10

*--- Adresses des sprites

sprDecor da    $0000,$1900,$3200,$4b00

sprBig   da    $0b41,$0b4a,$0b53,$0b5c,$0b65,$0b6e
sprSmall da    $0b77,$0b7c,$0b81,$0b86,$0b8b,$0b90

sprButtn da    $0141,$014a
         da    $0153,$015c
         da    $0165,$016e
         da    $0177,$0180

sprNum   da    $49,$4c,$4f,$52,$55,$58,$5b,$5e,$61,$64

*--- Correspondance de tables

myTable  dw    2,4,1,3

firstENTRY ds  2

*--- Adresses ecrans

scrBig   da    $172a,$1732,$173a,$1742,$174a,$1752,$175a,$1762,$176a
         da    $1fea,$1ff2,$1ffa,$2002,$200a,$2012,$201a,$2022,$202a
         da    $28aa,$28b2,$28ba,$28c2,$28ca,$28d2,$28da,$28e2,$28ea
         da    $316a,$3172,$317a,$3182,$318a,$3192,$319a,$31a2,$31aa
         da    $3a2a,$3a32,$3a3a,$3a42,$3a4a,$3a52,$3a5a,$3a62,$3a6a
         da    $42ea,$42f2,$42fa,$4302,$430a,$4312,$431a,$4322,$432a
         da    $4baa,$4bb2,$4bba,$4bc2,$4bca,$4bd2,$4bda,$4be2,$4bea
         da    $546a,$5472,$547a,$5482,$548a,$5492,$549a,$54a2,$54aa
         da    $5d2a,$5d32,$5d3a,$5d42,$5d4a,$5d52,$5d5a,$5d62,$5d6a
         da    $65ea,$65f2,$65fa,$6602,$660a,$6612,$661a,$6622,$662a
         da    $6eaa,$6eb2,$6eba,$6ec2,$6eca,$6ed2,$6eda,$6ee2,$6eea

scrSmall da    $5432,$5436,$543a,$543e,$5442,$5446,$544a,$544e,$5452
         da    $5892,$5896,$589a,$589e,$58a2,$58a6,$58aa,$58ae,$58b2
         da    $5cf2,$5cf6,$5cfa,$5cfe,$5d02,$5d06,$5d0a,$5d0e,$5d12
         da    $6152,$6156,$615a,$615e,$6162,$6166,$616a,$616e,$6172
         da    $65b2,$65b6,$65ba,$65be,$65c2,$65c6,$65ca,$65ce,$65d2
         da    $6a12,$6a16,$6a1a,$6a1e,$6a22,$6a26,$6a2a,$6a2e,$6a32
         da    $6e72,$6e76,$6e7a,$6e7e,$6e82,$6e86,$6e8a,$6e8e,$6e92
         da    $72d2,$72d6,$72da,$72de,$72e2,$72e6,$72ea,$72ee,$72f2
         da    $7732,$7736,$773a,$773e,$7742,$7746,$774a,$774e,$7752

*--- Adresses messages

AdrScrBtn da   $30ea,$30f2,$30fa,$3102,$310a,$3112,$311a,$3122,$312a
         da    $3773,$4033,$48f3,$51b3,$5a73,$6333,$6bf3,$74b3,$7d73
         da    $872a,$8732,$873a,$8742,$874a,$8752,$875a,$8762,$876a
         da    $3725,$3fe5,$48a5,$5165,$5a25,$62e5,$6ba5,$7465,$7d25

*--- Adresses pour les donnees du tableau

zePANEL  da    $0bc8,$0202,$2f58,$45d2
zePANEL2 da    $026b,$116b,$1fcb,$2e2b,$3c8b,$4aeb,$594b,$67ab
         da    $0254,$1154,$1fb4,$2e14,$3c74
zeTEMPS1 da    $0c6b,$02a5,$2ffb,$4675
zeTEMPS2 da    $0c70,$02aa,$3000,$467a
zeTEMPS3 da    $0c75,$02af,$3005,$467f
zeNIVEAU da    $1029,$0663,$33b9,$4a33
zeCOMPCP da    $1035,$066f,$33c5,$4a3f
zeMOICP  da    $13eb,$0a25,$377b,$4df5

*--- Couleurs

colorA   ds    2
colorB   ds    2
colorC   ds    2

*--- Pour les textes

String   asc   "        ",00
LgStrPtr asc   '1234567',00
StrPtr   asc   '123',00
StrTime  asc   '12',00

CSEtemp  ds    2

*--- Pour deplacements

MyArrow  ds    2
MyColumn ds    2
MyDepart ds    2
MyArrivee ds   2
MyScrDep ds    2
MyScrArr ds    2
MyScrLth ds    2

Buffer   ds    8

WhichDep ds    2
WhichDecor ds  2
WhichName ds   2
AdrDecor ds    2
NbMelange ds   2
Melange  ds    2

noINTER  ds    2
fgTIME   ds    2
ldFlag   ds    2
vivaTOINET ds  2
Diabolic ds    2

fgMUSIC  ds    2
fgSOUND1 ds    2
fgSOUND2 ds    2
fgWHICH  ds    2          ; 0: NT, 1: Sound Tool Set
fgDOC    ds    2          ; 0: french, 1: other
fgRANDOM ds    2

*--- Messages

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

proQuit  dw    2
         ds    4
         ds    2

proOpen  dw    2
         ds    2
         adrl  pCOGITO

proGetEof dw   2
         ds    2
         ds    4

proRead  dw    4
         ds    2
         ds    4
         ds    4
         ds    4

proClose dw    1
         ds    2

proCreate dw   7
         adrl  pTEMP      ; Pathname
         dw    $e3        ; AccessCode
         dw    $5a        ; FileType
         ds    4          ; AuxType
         dw    $02        ; Type d'enregistrement
         adrl  340        ; Data segment
         ds    4          ; Resource segment

proKill  dw    1
         adrl  pTEMP      ; Pathname

proInfo  dw    4
         adrl  pTEMP      ; Pathname
         dw    $e3        ; AccessCode
         dw    $5a        ; FileType
         ds    4          ; AuxType

proWrite dw    5
         ds    2          ; Id
         adrl  Probleme   ; Where
         adrl  340        ; Length
         ds    4          ; Written
         ds    2

sizeEOF  ds    2

*--- Nom des fichiers

pCOGITO  strl  '1/Cogito.Datas/Cogito'
pTOINET  strl  '1/Cogito.Datas/Toinet'
pSUPERMAN strl '1/Cogito.Datas/Superman'

pMESSAGE strl  '1/Cogito.Datas/Messages'
pSPRITES strl  '1/Cogito.Datas/Sprites'
pHAPPY   strl  '1/Cogito.Datas/Happyland'
pLUDY    strl  '1/Cogito.Datas/Ludyland'
pPLANET  strl  '1/Cogito.Datas/Planetlast'
pXENO    strl  '1/Cogito.Datas/Xenolast'
pTEMP    strl  '1/Cogito.Datas/Temp'

pSOUND1  strl  '1/Cogito.Datas/Sound.1'
pSOUND2  strl  '1/Cogito.Datas/Sound.2'
pMUSIC   strl  '1/Cogito.Datas/Music'

*---

PanelX1  HEX   0E01,4200,EE00,E200
PanelX2  HEX   3201,6600,1201,0601
PanelY1  HEX   0C00,0000,4600,6A00
PanelY2  HEX   1800,0900,5100,7500

*--- Memoire

myID     ds    2
mySTACK  ds    2

proDecor dw    8,9,0,1
ptrDECOR ds    4

ptrHAPPY ds    4
ptrPLANET ds   4
ptrMESSAGE ds  4
ptrSUPERMAN ds 4
ptrTOINET ds   4
ptrSOUND2 ds   4
ptrMUSIC ds    4
         ds    4

ptrLUDY  ds    4
ptrXENO  ds    4
ptrSPRITES ds  4
ptrUNPACK ds   4
ptrSOUND1 ds   4

save1    ds    1
save2    ds    1
save3    ds    1
save4    ds    1

VBLCounter0 ds 2

affTBL   dw    $e4,$84,$8c,$94,$9c,$a4,$ac
         dw    $b4,$bc,$c4,$cc,$d4,$dc

*--- Decompactage

decBUF   adrl  $00002000
decPIC   adrl  $00060000
decSIZ   dw    $8000
temp     ds    2

*--- Fleches

Fleches  ds    72

Fleches2 ds    72

*--- Tableau

TblPlateau da  0,2,4,6,8,10,12,14,16
         da    16,34,52,70,88,106,124,142,160
         da    144,146,148,150,152,154,156,158,160

TblPlateau2 da 0,18,36,54,72,90,108,126,144

*--- Tables pour le choix des deplacements

TblDeplacement da 35,35,80,60,80,60,60,60,35,500,35,30

TblMel38 da    9,10,11,12,13,14,15,16,17
         da    0,1,2,3,4,5,6,7,8
         da    27,28,29,30,31,32,33,34,35
         da    18,19,20,21,22,23,24,25,26

TblMel5  da    18,19,20,21,22,23,24,25,26
         da    27,28,29,30,31,32,33,34,35
         da    0,1,2,3,4,5,6,7,8
         da    9,10,11,12,13,14,15,16,17

TblMel67 da    26,25,24,23,22,21,20,19,18
         da    35,34,33,32,31,30,29,28,27
         da    8,7,6,5,4,3,2,1,0
         da    17,16,15,14,13,12,11,10,9

TblMel9  da    8,7,6,5,4,3,2,1,0
         da    17,16,15,14,13,12,11,10,9
         da    26,25,24,23,22,21,20,19,18
         da    35,34,33,32,31,30,29,28,27

TblMel11 da    1,2,3,4,5,6,7,8,0
         da    10,11,12,13,14,15,16,17,9
         da    19,20,21,22,23,24,25,26,18
         da    28,29,30,31,32,33,34,35,27

TblMel12 da    7,8,0,1,2,3,4,5,6
         da    16,17,9,10,11,12,13,14,15
         da    25,26,18,19,20,21,22,23,24
         da    34,35,27,28,29,30,31,32,33

*--- Correspondance niveau/deplacement

ChoixDeplace da 1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12
         da    1,2,3,4,5,6,7,8,9,10,11,12

ChoixDecor da  1,1,1,1,1,1,1,1,1,1,1,1
         da    2,2,2,2,2,2,2,2,2,2,2,2
         da    3,3,3,3,3,3,3,3,3,3,3,3
         da    4,4,4,4,4,4,4,4,4,4,4,4
         da    5,5,5,5,5,5,5,5,5,5,5,5
         da    6,6,6,6,6,6,6,6,6,6,6,6
         da    7,7,7,7,7,7,7,7,7,7,7,7
         da    8,8,8,8,8,8,8,8,8,8,8,8
         da    9,9,9,9,9,9,9,9,9,9,9,9
         da    10,10,10,10,10,10,10,10,10,10,10,10

*---

AdrDecor5 da   1,1,1,1,1,1,1,1,1
         da    1,2,2,2,6,3,3,3,1
         da    1,2,2,2,6,3,3,3,1
         da    1,2,2,2,6,3,3,3,1
         da    1,6,6,6,6,6,6,6,1
         da    1,4,4,4,6,5,5,5,1
         da    1,4,4,4,6,5,5,5,1
         da    1,4,4,4,6,5,5,5,1
         da    1,1,1,1,1,1,1,1,1

AdrDecor6 da   1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3
         da    1,2,3,4,5,6,1,2,3

AdrDecor7 da   2,4,4,6,5,6,4,4,2
         da    4,2,4,6,5,6,4,2,4
         da    4,4,2,6,3,6,2,4,4
         da    6,6,6,2,1,2,6,6,6
         da    5,5,3,1,2,1,3,5,5
         da    6,6,6,2,1,2,6,6,6
         da    4,4,2,6,3,6,2,4,4
         da    4,2,4,6,5,6,4,2,4
         da    2,4,4,6,5,6,4,4,2

AdrDecor8 da   2,2,2,5,5,5,4,4,4
         da    2,2,2,5,5,5,4,4,4
         da    2,2,2,5,5,5,4,4,4
         da    3,3,3,6,6,6,3,3,3
         da    3,3,3,6,6,6,3,3,3
         da    3,3,3,6,6,6,3,3,3
         da    4,4,4,1,1,1,2,2,2
         da    4,4,4,1,1,1,2,2,2
         da    4,4,4,1,1,1,2,2,2

AdrDecor9 da   1,1,1,1,1,1,1,1,1
         da    3,1,1,1,1,1,1,1,4
         da    3,3,6,6,6,6,6,4,4
         da    3,3,6,1,1,1,6,4,4
         da    3,3,6,6,6,6,6,4,4
         da    3,3,6,2,2,2,6,4,4
         da    3,3,6,6,6,6,6,4,4
         da    3,2,2,2,2,2,2,2,4
         da    2,2,2,2,2,2,2,2,2

*--- Lignes

Ligne    =     *

]Ligne   =     $0
         lup   200
         da    ]Ligne
]Ligne   =     ]Ligne+160
         --^

*--- Fin du code...
