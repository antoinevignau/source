
*******************************************************************************
********************************  INITS  **************************************
*******************************************************************************

         lda   #pMAIN
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   bip
         brl   initOFF

bip      lda   ptrECRAN+1
         jsr   unPACK

*--- Look for preference file

         lda   #$6038
         sta   loadERR+3

         lda   #pPREF
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   bip30
         brl   bip40

bip30    lda   ptrUNPACK
         sta   Debut
         lda   ptrUNPACK+2
         sta   Debut+2

         ldy   #0         ; Select
         lda   [Debut],y
         sta   ACTION
         and   #$7f
         sta   ACTION+2
         iny              ; Left
         iny
         lda   [Debut],y
         sta   ACTION+4
         and   #$7f
         sta   ACTION+6
         iny              ; Right
         iny
         lda   [Debut],y
         sta   ACTION+8
         and   #$7f
         sta   ACTION+10
         iny              ; Up
         iny
         lda   [Debut],y
         sta   ACTION+12
         and   #$7f
         sta   ACTION+14
         iny              ; Down
         iny
         lda   [Debut],y
         sta   ACTION+16
         and   #$7f
         sta   ACTION+18

         ldy   #14        ; Level
         lda   [Debut],y
         sta   LEVEL
         sta   level
         iny              ; Life
         iny
         lda   [Debut],y
         sta   life
         iny              ; Joker
         iny
         lda   [Debut],y
         sta   joker

         ldx   LEVEL
         lda   #0
]lp      cpx   #0
         beq   bip31
         clc
         adc   #8
         dex
         bpl   ]lp
         lda   #0
bip31    clc
         adc   #PASSWRD
         sta   bip32+1

         ldx   #0
bip32    lda   PASSWRD,x
         sec
         sbc   #$0300
         sta   SAVESBU,x
         inx
         inx
         cpx   #8
         bne   bip32

*--- Look for construction kit mode

bip40    lda   #pDATAS2
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcs   bip20

         lda   #$eaea
         sta   loadERR+3
         lda   #1
         sta   okDATAS2
         bra   bip21

bip20    lda   #$eaea
         sta   loadERR+3
         stz   okDATAS2

*---

bip21    lda   #pDOCU
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   bip1
         brl   initOFF

bip1     lda   ptrBOUGE+1
         jsr   unPACK

         ldal  $e102e9
         cmp   #$0202
         beq   bip11
         pha
         and   #$ff00
         cmp   #$0200
         beq   bip10
         pla
         and   #$00ff
         cmp   #$0002
         beq   bip11

         lda   #pDOCUS
         bra   bip12

bip10    pla
bip11    lda   #pDOCFR

bip12    ldx   ptrNIV+1
         jsr   loadFILE
         bcc   bip2
         brl   initOFF

bip2     lda   ptrNIV
         sta   AFTTBI
         sta   AFTDEB0+1
         sta   AFTDEB3+1

         lda   #pSPRITE
         ldx   ptrUNPACK+1
         jsr   loadFILE
         bcc   bip3
         brl   initOFF

bip3     lda   ptrDATAS+1
         jsr   unPACK

*---
         LDA   #$0000
         STA   POSX
         STA   POSY
         STA   A1         ; INIT SOURIS
         STA   AP
         JSR   SAUV       ; SAUVEGARDE DECOR
         JSR   DESS

         LDA   #$0001
         JMP   PICT       ; AFFICHE L'IMAGE MAIN

okDATAS2 ds    2
okDATAS3 ds    2

*-------------------------- Message

         hex   0d0d
         asc   'Is it possible to create a game without any easter eggs ?'
         asc   ':-)'
         hex   0d0d

*****************************************************************************
****************************  MOUSE MANAGER  ********************************
*****************************************************************************

SOURIS   LDA   BOUT       ; ANCIEN BOUT=NOUVEAU BOUT
         STA   BOUT1

SOURIS0  JSR   SLECT      ; LECTURE SOURIS
         CPY   #$FFFF
         BEQ   SECR       ; DONNEES NON DISPONIBLES

SOURIS1  LDA   A1         ; A1 POSITION ACTUELLE
         STA   AP         ; AP ANCIENNE POSITION
         LDA   POSX
         LSR
         STA   SOURIS2+1
         LDA   POSY
         ASL
         TAX
         LDA   Ligne,X
         CLC
SOURIS2  ADC   #$0000     ; CALCUL DE A1 (160*POSY+POSX)
         STA   A1
         JSR   TRACE      ; ON DESSINE LE POINTEUR

*****

SECR     LDA   ECRAN
         DEC
         ASL
         TAX
         LDA   ECRTAB,X
         TAY              ; ADRESSE TABLEAU DES BOUTONS
         DEC
         DEC
         TAX
SECR0    LDA\  $0000,X    ; NB DE BUMPER DANS ECRAN
         ASL
         STA   SECR8+1

         LDX   #$0000
         LDA   POSX
SECR1    CMP\  $0000,Y    ; X0   ECR1, ECR2, ECR3 ...
         BMI   SECR4
         INY
         INY
SECR11   CMP\  $0000,Y    ; X1
         BPL   SECR5
         INY
         INY
         LDA   POSY
SECR12   CMP\  $0000,Y    ; Y0
         BMI   SECR6
         INY
         INY
SECR13   CMP\  $0000,Y    ; Y1
         BPL   SECR7
         STX   SECR2+1    ; ON EST SUR UN BUMPER
         LDA   ECRAN
         DEC
         ASL
         TAX
         LDA   ECRDESA,X
         STA   SECR20+1   ; ADRESSE DE L'ADRESSE EXECUTION
SECR2    LDX   #$0000     ; NUMERO DU BUMPER TRAVERSE (*2)
SECR20   LDA   $FFFF,X
         STA   SECR3+1
SECR3    JMP   $A0A0      ;

SECR4    INY
         INY
SECR5    INY
         INY
SECR6    INY
         INY              ; BOUTON SUIVANT
SECR7    INY
         INY
         LDA   POSX
         INX
         INX
SECR8    CPX   #$0000     ; NB DE BOUTON
         BMI   SECR1
         JSR   BORD5
         JMP   BUMPDEF    ; AUCUN BOUTON DETECTE : TRAITEMENT PAR DEFAUT


*******************************************************************************
***********************  TRAITEMENT DES BOUTONS  ******************************
*******************************************************************************

BORD4    LDX   SECR2+1    ; NUMERO DU BUMPER (*2)
         LDA   #BORD44
         STA   BUMPER5+1  ; ADRESSE D'EXECUTION
         JMP   BUMPER
BORD44   JMP   SOURIS1    ; ON SORT SANS LIRE LA SOURIS

BORD5    LDA   ECRAN
         CMP   #$0009     ; ON EST SUR L'ECRAN LINE, ON NE CHANGE RIEN
         BEQ   BORD55
         LDAL  $00C034    ; ICI TRAITEMENT PAR DEFAUT
         AND   #$FFF0     ; BORDURE NOIRE
         STAL  $00C034
BORD55   RTS

BORD6    LDAL  $00C034
         AND   #$FFF0
         ORA   #$0001     ; ROUGE
         STAL  $00C034
         RTS

*********** TINIES MAIN

ECR0100  LDX   SECR2+1    ; MAIN : DOCUMENTATION
         LDA   #ECR01000
         STA   BUMPER5+1
         JMP   BUMPER
ECR01000 LDA   #$0002     ; IMAGE DOCU
         JMP   PICT

ECR0101  LDX   SECR2+1    ; MAIN : EXIT
         LDA   #ECR01010
         STA   BUMPER5+1
         JMP   BUMPER
ECR01010 lda   #1
         jsr   nowWAIT
         jsr   fadeOUT
         brl   initOFF    ; ON QUIT

ECR0102  LDX   SECR2+1    ; MAIN : PLAY
         LDA   #ECR01020
         STA   BUMPER5+1
         JMP   BUMPER
ECR01020 lda   LEVEL      ; TRANSFERT DE LEVEL ET DES TOUCHES
         sta   level
         ldx   #0
         txy
]lp      lda   ACTION,x
         sta   keyPREF,y
         inx
         inx
         inx
         inx
         iny
         iny
         cpy   #10
         bne   ]lp

         jsr   saveFILE

         LDA   okDATAS2   ; DETECTION DU DEUXIEME JEU DE TABLEAU
         BEQ   ECR01021
         LDA   #$0003
         JMP   PICT3      ; SELECTION DU JEU
ECR01021 lda   #1
         jsr   nowWAIT
         jsr   fadeOUT
         brl   entryGAME  ; SAUT AU JEU

ECR0103  LDA   #ECR01030  ; MAIN : SURFACE SAISIE CODE
         STA   SURFACE5+1
         JMP   SURFACE
ECR01030 JSR   DESS1      ; SAISIE DU CODE
         JSR   SAVESAI
         JSR   ECR0110    ; REAFFICHAGE
         JSR   SAUV
         JMP   SOURIS

ECR0104  LDA   #ECR01040  ; MAIN : SURFACE SAISIE HAUT
         STA   SURFACE5+1
         JMP   SURFACE
ECR01040 JSR   DESS1      ; SAISIE HAUT
         STZ   HAUT
         LDX   #$0CFC
         JSR   DIRECT
         STA   HAUT       ; VALEUR CLAVIER
         AND   #$007F
         STA   HAUT+2     ; VALEUR ASCII
         JSR   ECR0110    ; AFFICHAGE
         JSR   SAUV
         JMP   SOURIS

ECR0105  LDA   #ECR01050  ; MAIN : SURFACE SAISIE BAS
         STA   SURFACE5+1
         JMP   SURFACE
ECR01050 JSR   DESS1      ; SAISIE BAS
         STZ   BAS
         LDX   #$223C
         JSR   DIRECT
         STA   BAS        ; VALEUR CLAVIER
         AND   #$007F
         STA   BAS+2      ; VALEUR ASCII
         JSR   ECR0110    ; AFFICHAGE
         JSR   SAUV
         JMP   SOURIS

ECR0106  LDA   #ECR01060  ; MAIN : SURFACE SAISIE GAUCHE
         STA   SURFACE5+1
         JMP   SURFACE
ECR01060 JSR   DESS1      ; SAISIE GAUCHE
         STZ   GAUCHE
         LDX   #$1792
         JSR   DIRECT
         STA   GAUCHE     ; VALEUR CLAVIER
         AND   #$007F
         STA   GAUCHE+2   ; VALEUR ASCII
         JSR   ECR0110    ; AFFICHAGE
         JSR   SAUV
         JMP   SOURIS

ECR0107  LDA   #ECR01070  ; MAIN : SURFACE SAISIE DROITE
         STA   SURFACE5+1
         JMP   SURFACE
ECR01070 JSR   DESS1      ; SAISIE DROITE
         STZ   DROITE
         LDX   #$17A6
         JSR   DIRECT
         STA   DROITE     ; VALEUR CLAVIER
         AND   #$007F
         STA   DROITE+2   ; VALEUR ASCII
         JSR   ECR0110    ; AFFICHAGE
         JSR   SAUV
         JMP   SOURIS

ECR0108  LDA   #ECR01080  ; MAIN : SURFACE SAISIE ACTION
         STA   SURFACE5+1
         JMP   SURFACE
ECR01080 JSR   DESS1      ; SAISIE ACTION
         STZ   ACTION
         LDX   #$179C
         JSR   DIRECT
         STA   ACTION     ; VALEUR CLAVIER
         AND   #$007F
         STA   ACTION+2   ; VALEUR ASCII
         JSR   ECR0110    ; AFFICHAGE
         JSR   SAUV
         JMP   SOURIS

ECR0109  LDA   #ECR01090  ; MAIN : SURFACE TIPS
         STA   SURFACE5+1
         JMP   SURFACE
ECR01090 NOP
         LDA   TIPSFLAG   ; PLUS COURT...
         BNE   ECR01091
         INC   TIPSFLAG
ECR01091 JMP   SOURIS

TIPSFLAG HEX   0000

ECR0110  JSR   SAVESAF     ; AFFICHAGE ECRAN MAIN
         LDA   #$2CFC     ; UP
         STA   OPENADR
         LDA   HAUT+2
         JSR   OPENCAR
         LDA   #$379C     ; ACTION
         STA   OPENADR
         LDA   ACTION+2
         JSR   OPENCAR
         LDA   #$423C     ; DOWN
         STA   OPENADR
         LDA   BAS+2
         JSR   OPENCAR
         LDA   #$3792     ; <-
         STA   OPENADR
         LDA   GAUCHE+2
         JSR   OPENCAR
         LDA   #$37A6     ; ->
         STA   OPENADR
         LDA   DROITE+2
         JSR   OPENCAR

         LDA   LEVEL      ; AFFICHAGE LEVEL
         STA   VALH
         LDA   #$2C10
         STA   ADRE
         JSR   TRANS      ; AFFICHAGE RHS
         RTS

LEVEL    HEX   0000       ; N[ DU NIVEAU (1-110)
ACTION   HEX   B000,3000  ; CLAVIER,ASCII
GAUCHE   HEX   B400,3400  ; TOUCHE DE DIRECTION
DROITE   HEX   B600,3600
HAUT     HEX   B800,3800
BAS      HEX   B200,3200

DIRECT   NOP              ; SAISIE DIRECTION
         LDY   #$0004
DIREC    LDA   #$0000
         STAL  $012000,X
         STAL  $012002,X  ; NETTOY LA SURFACE
         TXA
         CLC
         ADC   #$00A0
         TAX
         DEY
         BPL   DIREC

         LDA   #$9999     ; AFFICHAGE TIRET ROUGE
         STAL  $012000,X
         LDA   #$9099
         STAL  $012002,X

DIRECKB  LDAL  $00BFFF
         BPL   DIRECKB
         STAL  $00C010    ; BIT $C010
         XBA
         AND   #$00FF
         CMP   #$00A6
         BEQ   DIRECKB    ; ON ELIMINE &
         CMP   #$00A0
         BMI   DIRECKB
         CMP   #$00DB
         BMI   DIRECKB1
         CMP   #$00E1
         BMI   DIRECKB
         CMP   #$00FB
         BPL   DIRECKB
DIRECKB1 CMP   HAUT       ; ON ACCEPTE LE CARACTERE
         BEQ   DIRECKB
         CMP   BAS
         BEQ   DIRECKB
         CMP   GAUCHE     ; ON VERIFIE QU'ON NE DOUBLONNE PAS
         BEQ   DIRECKB
         CMP   DROITE
         BEQ   DIRECKB
         CMP   ACTION
         BEQ   DIRECKB
         TAY
         LDA   #$0000     ; NETTOYAGE TIRET ROUGE
         STAL  $012000,X
         STAL  $012002,X
         TYA
         RTS

*********** TINIES DOCUMENTATION

ECR0200  LDX   SECR2+1    ; DOCU : <-
         LDA   #ECR02000
         STA   BUMPER5+1
         JMP   BUMPER
ECR02000 LDA   AFTIND     ; PAGE PRECEDENTE
         BEQ   ECR02001
         DEC   AFTIND
         STZ   AFTFL4
         JSR   AFFTEXT
ECR02001 JMP   SOURIS1

ECR0201  LDX   SECR2+1    ; DOCU : ->
         LDA   #ECR02010
         STA   BUMPER5+1
         JMP   BUMPER
ECR02010 LDA   AFTFL4     ; PAGE SUIVANTE
         BNE   ECR02011   ; ON EST AU BOUT DU FICHIER
         INC   AFTIND     ; INDEX
         JSR   AFFTEXT
ECR02011 JMP   SOURIS1

ECR0202  LDX   SECR2+1    ; DOCU : o
         LDA   #ECR02020
         STA   BUMPER5+1
         JMP   BUMPER
ECR02020 LDA   AFTIND     ; INDICE DE PAGE
         BEQ   ECR02021
         STZ   AFTFL4     ; SOMMAIRE
         STZ   AFTIND     ; PREMIERE PAGE
         STZ   AFTCONT
         JSR   AFFTEXT
ECR02021 JMP   SOURIS1

ECR0203  LDX   SECR2+1    ; DOCU : EXIT
         LDA   #ECR02030
         STA   BUMPER5+1
         JMP   BUMPER
ECR02030 STZ   AFTCONT    ; ECRAN MAIN
         LDA   #$0001
         JMP   PICT

*********** TINIES SELECT

ECR0300  LDX   SECR2+1    ; SELECT : CLASSIC
         LDA   #ECR03000
         STA   BUMPER5+1
         JMP   BUMPER
ECR03000 lda   #1
         jsr   nowWAIT
         stz   okDATAS3
         jsr   fadeOUT
         BRL   entryGAME

ECR0301  LDX   SECR2+1    ; SELECT : EXTEND
         LDA   #ECR03010
         STA   BUMPER5+1
         JMP   BUMPER
ECR03010 lda   #1
         jsr   nowWAIT
         lda   #1
         sta   okDATAS3
         jsr   fadeOUT
         BRL   entryGAME

***************************************************************************
******************************  DATA  *************************************
***************************************************************************

************  BUMPER MANAGER  ************  PAVE

BUMPER   LDA   FLAGTAB,X
         BEQ   BUMPER2
         LDA   BOUT
         BEQ   BUMPER1
BUMPER0  JMP   SOURIS
BUMPER1  STZ   FLAGTAB,X  ; RELEVE LE BUMPER ET EFFECTUE LE TRAITEMENT
         STZ   BMPFLG
         JSR   DESS1
         JSR   AFFSPRR
         JSR   SAUV
BUMPER5  JMP   $FFFF      ; TRAITEMENT A EFFECTUER
BUMPER2  STX   BUMPER4+1  ; SAUVEGARDE TEMPORAIRE DE X
         LDA   BMPFLG
         BEQ   BUMPER3
         LDX   LAST       ; FORCE LE REMONTEE DE L'ANCIEN
         STZ   FLAGTAB,X
         STZ   BMPFLG
         STX   SECR2+1
         JSR   DESS1
         JSR   AFFSPRR
         JSR   SAUV
BUMPER3  LDA   BOUT
         BEQ   BUMPER0    ; JMP SOURIS
BUMPER4  LDX   #$FFFF     ; RECUPERE LA VALEUR DE X PERTURBEE PAR LA REMONTE FORCEE
         STX   LAST       ; ENFONCE LE BUMPER SUR LEQUEL ON SE TROUVE
         LDA   #$0001
         STA   BMPFLG
         STA   FLAGTAB,X
         STX   SECR2+1
         JSR   DESS1
         JSR   AFFSPRE
         JSR   SAUV
         JMP   SOURIS1

************* SURFACE MANAGER *************  ZONE D'ECRAN

SURFACE  LDA   BMPFLG     ; X CONTIENT LE NUMERO DU BOUTON
         BEQ   SURFACE1
         LDX   LAST       ; ON FORCE SA RELEVE
         STZ   BMPFLG
         STZ   FLAGTAB,X
         STX   SECR2+1
         JSR   DESS1
         JSR   AFFSPRR
         JSR   SAUV
         JMP   SOURIS1
SURFACE1 LDA   BOUT
         BEQ   SURFACE2
SURFACE5 JMP   $FFFF      ; TRAITEMENT A EFFECTUER
SURFACE2 JMP   SOURIS

******** TRAITEMENT PAR DEFAUT *********

BUMPDEF  LDA   BMPFLG
         BEQ   BUMPDEF1
         LDX   LAST       ; FORCE LE REMONTEE DE L'ANCIEN
         STZ   FLAGTAB,X
         STZ   BMPFLG
         STX   SECR2+1
         JSR   DESS1
         JSR   AFFSPRR
         JSR   SAUV
         JMP   SOURIS1
BUMPDEF1 JMP   SOURIS

**********************************************

         HEX   0A00                 ; MAIN   NB DE BOUTONS DANS ECRAN1
ECR01TAB HEX   B600,3F01,8900,C700  ; DOCU   TABLEAU DES BOUTONS POUR ECRAN1
         HEX   0000,8900,8900,C700  ; EXIT   X0,X1 Y0,Y1
         HEX   4E00,F200,5D00,8500  ; PLAY
         HEX   2C00,6300,3400,3D00  ; CODE
         HEX   F700,0201,1200,1B00  ; HAUT
         HEX   F700,0201,3400,3D00  ; BAS
         HEX   E300,ED00,2300,2C00  ; GAUCHE
         HEX   0B01,1301,2300,2C00  ; DROITE
         HEX   F700,0201,2300,2C00  ; ACTION
         HEX   1700,1800,1E00,1F00  ; TIPS

ECR01DAT HEX   0600,1800,D87E,1D00  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
         HEX   0E00,2400,1D7A,0000  ; EXIT
         HEX   0100,0100,405D,9B00  ; PLAY

         HEX   0400       ; DOCU
ECR02TAB HEX   6C00,7800,B600,BF00  ; <-
         HEX   9000,9C00,B600,BF00  ; ->
         HEX   8100,8700,B800,BD00  ; POINT
         HEX   0601,3801,B300,C100  ; EXIT

ECR02DAT HEX   0300,0900,F691,2A00  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
         HEX   0300,0900,0892,6A06
         HEX   0200,0500,4093,AA0C
         HEX   0800,0700,E892,5D10

         HEX   0200       ; SELECT
ECR03TAB HEX   5D00,9E00,6500,7300  ; CLASSIC X0,X1 Y0,Y1
         HEX   A200,E300,6500,7300  ; EXTENT

ECR03DAT HEX   0E00,0700,D161,3105 ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
         HEX   0C00,0700,F761,3100

****************

ECRTAB   DA    ECR01TAB,ECR02TAB,ECR03TAB  ; ADRESSES DES TABLEAUX

ECRDAT   DA    ECR01DAT,ECR02DAT,ECR03DAT  ; ADRESSE DES DONNEES BUMPERS

ECRDESA  DA    ECRDES1,ECRDES2,ECRDES3  ; ADRESSE POUR LES DESTINATIONS

ECRDES1  DA    ECR0100,ECR0101,ECR0102,ECR0103,ECR0104 ; MAIN : ADRESSES DES DESTINATIONS
         DA    ECR0105,ECR0106,ECR0107,ECR0108,ECR0109
ECRDES2  DA    ECR0200,ECR0201,ECR0202,ECR0203  ; DOCUMENTATION
ECRDES3  DA    ECR0300,ECR0301  ; SELECT

*********************  SOUS ROUTINES SOURIS  **************************

DEC      HEX   000000000000  ; DECOR SOUS LE POINTEUR
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000

PTPAI    HEX   FFFFFFFF0000
         HEX   0F00000F0000  ; POINTEUR POSITION PAIRE
         HEX   00F000F00000
         HEX   000F00F00000
         HEX   0000FF000000
         HEX   00000F000000

PTPAIMA  HEX   00000000FFFF
         HEX   F0000000FFFF  ; MASQUE POSITION PAIRE
         HEX   FF00000FFFFF
         HEX   FFF0000FFFFF
         HEX   FFFF00FFFFFF
         HEX   FFFFF0FFFFFF

PTIMP    HEX   0FFFFFFFF000
         HEX   00F00000F000  ; POINTEUR POSITION IMPAIRE
         HEX   000F000F0000
         HEX   0000F00F0000
         HEX   00000FF00000
         HEX   000000F00000

PTIMPMA  HEX   F00000000FFF
         HEX   FF0000000FFF  ; MASQUE POSITION IMPAIRE
         HEX   FFF00000FFFF
         HEX   FFFF0000FFFF
         HEX   FFFFF00FFFFF
         HEX   FFFFFF0FFFFF

POSX     HEX   0000       ; 0-312
POSY     HEX   0000       ; 0-194
A1       HEX   0000       ; POSITION ACTUELLE
AP       HEX   0000       ; ANCIENNE POSITION
ECRAN    HEX   0000       ; ECRAN 1,2,3...
GO       HEX   0000       ; CONTIENT LE NUMERO DU BOUTON ENFONCE (A RELACHER)
LAST     HEX   0000       ; DERNIER BUMPER ENFONCE
BMPFLG   HEX   0000       ; A 1 SI UN BUMPER EST DEJA ENFONCE

BOUT     HEX   0000       ; BOUTON
BOUT1    HEX   0000       ;
DELX     HEX   000000
DELY     HEX   000000     ; DONNEES SOURIS
NEX      HEX   0000
NEY      HEX   0000

FLAGTAB  HEX   0000000000000000000000000000000000000000 ; FLAGS : 1 SI BUMPER ENFONCE
         HEX   0000000000000000000000000000000000000000 ; NB DE BUMPER/BOUTON DANS 1 ECRAN
         HEX   0000000000000000000000000000000000000000
         HEX   0000000000000000000000000000000000000000
         HEX   0000000000000000000000000000000000000000

********************

SEXIT    LDY   #$FFFF
         RTS

SLECT    LDAL  $00C026    ; $C027   LECTURE SOURIS
         BPL   SEXIT
         AND   #$0200     ; BUG
         BEQ   SLECT1
         LDAL  $00C024
         BRA   SLECT
SLECT1   LDA   #$0000     ; BOUT,NEX,NEY A 0 PAR DEFAUT
         STA   BOUT
         STA   NEX
         STA   NEY
         LDAL  $00C023    ; $C024 : DELTA X
         BIT   #$4000     ; SIGNE ?
         BNE   SLECT3
         AND   #$3F00     ; POSITIF
         STA   DELX
         BRA   SLECT4
SLECT3   AND   #$3F00     ; NEGATIF
         STA   SLECT33+1
         INC   NEX
         LDA   #$4000     ; 64
         SEC
SLECT33  SBC   #$0000
         STA   DELX
SLECT4   LDAL  $00C023    ; $C024 : DELTA Y
         BMI   SLECT44    ; NO BOUT : LECTURE SUR Y DE BOUTON 1
         INC   BOUT       ; BOUT=1
SLECT44  BIT   #$4000     ; SIGNE ?
         BNE   SLECT5
         AND   #$3F00     ; POSITIF
         STA   DELY
         BRA   SLECT6
SLECT5   AND   #$3F00     ; NEGATIF
         STA   SLECT55+1
         INC   NEY
         LDA   #$4000     ; 64
         SEC
SLECT55  SBC   #$0000
         STA   DELY
SLECT6   LDA   NEX        ; CALCUL DE POSX
         BNE   SLECT8
         LDA   POSX       ; DELX > 0
         CLC
         ADC   DELX+1
         CMP   #$0139     ; 313
         BMI   SLECT7
         LDA   #$0138     ; 312
SLECT7   STA   POSX
         BRA   SLECT10
SLECT8   LDA   POSX       ; DELX < 0
         SEC
         SBC   DELX+1
         BPL   SLECT9
         LDA   #$0000
SLECT9   STA   POSX
SLECT10  LDA   NEY        ; CALCUL DE POSY
         BNE   SLECT12
         LDA   POSY       ; DELY > 0
         CLC
         ADC   DELY+1
         CMP   #$00C3     ; 195
         BMI   SLECT11
         LDA   #$00C2     ; 194
SLECT11  STA   POSY
         BRA   SLECT14
SLECT12  LDA   POSY       ; DELY < 0
         SEC
         SBC   DELY+1
         BPL   SLECT13
         LDA   #$0000
SLECT13  STA   POSY
SLECT14  RTS

**********************

DESS1    LDA   A1
         BRA   DESS2
DESS     LDA   AP         ; DESSINE LE DECOR (LIE A AP), ANCIENNE POSITION
DESS2    CLC
         ADC   #$2000
         STA   DESS4+1
         LDY   #$0000
         LDX   #$0004     ; LARGEUR 3
DESS3    LDA   DEC,Y
DESS4    STAL  $012000,X
         INY
         INY
         DEX
         DEX
         BPL   DESS3
         CPY   #$0024     ; NB CASES (36)
         BPL   DESS5
         LDX   #$0004     ; LARGEUR 3
         LDA   DESS4+1
         CLC
         ADC   #$00A0
         STA   DESS4+1
         BRA   DESS3
DESS5    RTS

SAUV     LDA   A1         ; SAUVEGARDE LE DECOR (LIE A A1), NOUVELLE POSITION
         CLC
         ADC   #$2000
         STA   SAUV1+1
         LDY   #$0000
         LDX   #$0004     ; LARGEUR 3
SAUV1    LDAL  $012000,X
         STA   DEC,Y
         INY
         INY
         DEX
         DEX
         BPL   SAUV1
         CPY   #$0024     ; NB CASES (36)
         BPL   SAUV2
         LDX   #$0004     ; LARGEUR 3
         LDA   SAUV1+1
         CLC
         ADC   #$00A0
         STA   SAUV1+1
         BRA   SAUV1
SAUV2    RTS

TRACE    JSR   DESS       ; OK
         JSR   SAUV
         LDA   A1         ; DESSINE LE POINTEUR POSITION PAIRE
         CLC
         ADC   #$2000
         STA   TRACE1+1
         STA   TRACE4+1
         LDA   POSX
         LSR
         BCC   TRACEP
         LDX   #PTIMP     ; POSITION IMPAIRE
         LDY   #PTIMPMA
         BRA   TRACE0
TRACEP   LDX   #PTPAI     ; POSITION PAIRE
         LDY   #PTPAIMA
TRACE0   STX   TRACE3+1   ; MOTIF
         STY   TRACE2+1   ; MASQUE
         LDY   #$0000
         LDX   #$0000
TRACE1   LDAL  $012000,X
TRACE2   AND   $A0A0,Y    ; ET AVEC LE MASQUE
TRACE3   ORA   $A0A0,Y    ; OU AVEC LE MOTIF
TRACE4   STAL  $012000,X
         INY
         INY
         INX
         INX
         CPX   #$0006     ; LARGEUR 3
         BNE   TRACE1
         CPY   #$0024     ; NB CASES (36)
         BEQ   TRACE5
         LDX   #$0000
         LDA   TRACE1+1
         CLC
         ADC   #$00A0
         STA   TRACE1+1
         STA   TRACE4+1
         BRA   TRACE1
TRACE5   RTS

*************************************************

AFFSPRR  INC   AFFSPRF    ; BUMPER RELEVE
AFFSPRE  LDA   ECRAN      ; BUMPER ENFONCE
         DEC
         ASL
         TAX
         LDA   ECRDAT,X   ; ADRESSE DU TABLEAU DES DATA POUR L'ECRAN CONCERNE
         STA   AFFSPR1+1
         LDA   SECR2+1    ; CONTIENT LE NUMERO DU BUMPER (*2)
         ASL
         ASL              ; *4
         CLC
AFFSPR1  ADC   #$0000     ; ADRESSE DATA BUMPER
         TAX
SECR14   LDA\  $0000,X    ; LONGUEUR
         DEC
         ASL
         STA   AFFSPR3+1
         INX
         INX
SECR15   LDA\  $0000,X    ; HAUTEUR
         DEC
         STA   AFFSPR2+1
         INX
         INX
SECR16   LDA\  $0000,X    ; @ ECRAN
         STA   AFFSPR5+1
         INX
         INX
         lda   ptrDATAS
         sta   AFFSPR4+1
         lda   ptrDATAS+1
         sta   AFFSPR4+2
SECR17   LDA\  $0000,X    ; @ SPRITE
         clc
         adc   AFFSPR4+1
         STA   AFFSPR4+1
         LDA   AFFSPRF    ; FLAG DE AFFSPR
         BNE   AFFSPR2    ; ON DESSINE LE SPRITE RELEVE
         LDA   AFFSPR4+1
         CLC              ; SPRITE ENFONCE
         ADC   #$1720     ; 37 LIGNES PLUS BAS
         STA   AFFSPR4+1
AFFSPR2  LDY   #$0000     ; HAUTEUR-1
AFFSPR3  LDX   #$0000     ; NOMBRE DE *4-2
AFFSPR4  LDAL  $060000,X  ; ADRESSE SPRITE (BANC 06)
AFFSPR5  STAL  $012000,X  ; ADRESSE ECRAN
         DEX
         DEX
         BPL   AFFSPR4    ; RECOPIE 1 LIGNE
         LDA   AFFSPR4+1
         CLC              ; LIGNE SUIVANTE SPRITE
         ADC   #$00A0
         STA   AFFSPR4+1
         LDA   AFFSPR5+1
         CLC              ; LIGNE SUIVANTE ECRAN
         ADC   #$00A0
         STA   AFFSPR5+1
         DEY
         BPL   AFFSPR3
         STZ   AFFSPRF
         RTS
AFFSPRF  HEX   0000       ; FLAG RELEVE/ENFONCE

*-------------------------- Message

         hex   0d0d
         asc   'Have you ever dreamed of playing the level you prefer ?'
         hex   0d0d

*****************  AFFICHE DES CHIFFRES SUR 3 COLONNES  ****************************

TRANS    LDA   VALH       ;  ON CONVERTIT L'HEXA EN DECIMAL
         BNE   TRANS1
         LDA   #$000A     ; LE CHIFFRE EN NOIR
         STA   VAL2
         STA   VAL3
         stz   VAL1
         BRA   TRANS6     ; ON AFFICHE LE NOIR
TRANS1   LDX   #$0000
TRANS2   LDA   VALH       ; VALEUR EN HEXA
         CMP   #$0064     ; 100
         BMI   TRANS3
         SEC
         SBC   #$0064
         STA   VALH
         INX
         BRA   TRANS2
TRANS3   STX   VAL3       ; CENTAINE
         LDX   #$0000
TRANS4   LDA   VALH       ; VALEUR EN HEXA
         CMP   #$000A     ; 10
         BMI   TRANS5
         SEC
         SBC   #$000A     ; 10
         STA   VALH
         INX
         BRA   TRANS4
TRANS5   STX   VAL2       ; DIZAINE
         STA   VAL1       ; UNITES

         LDA   VAL3       ; CENTAINES
         BNE   TRANS6
         LDY   #$000A
         STY   VAL3       ; SI LE CHIFFRE DES CENTAINES EST 0, ON LE NOIRCI
         LDA   VAL2       ; DIZAINE
         BNE   TRANS6
         STY   VAL2       ; SI CENTAINE ET DIZAINE = ZERO, ON NOIRCIT LES 2

TRANS6   LDA   ADRE       ;  ON AFFICHE LES 3 CHIFFRES
         STA   AFTCA+1    ; ADRESSE ECRAN
         LDA   VAL3
         JSR   CHIF       ; CENTAINES
         LDA   ADRE
         CLC
         ADC   #$0003
         STA   AFTCA+1    ; ADRESSE ECRAN
         LDA   VAL2
         JSR   CHIF       ; DIZAINES
         LDA   ADRE
         CLC
         ADC   #$0006
         STA   AFTCA+1    ; ADRESSE ECRAN
         LDA   VAL1
         JSR   CHIF       ; UNITES
         RTS

*********************

CHIF     ASL              ; DANS ACC LA VALEUR DECIMALE (0-9)
         ASL
         STA   CHIF1+1
         ASL
         ASL              ; *16
         CLC
CHIF1    ADC   #$0000     ; + *4
         CLC
         ADC   #$0012     ; 10*2
         TAX
         LDY   #$0012     ; 10*2
CHIF2    LDA   AFBT0,X
         STA   AFBTT,Y
         DEX
         DEX              ; RECOPIE DANS LE BUFFER
         DEY
         DEY
         BPL   CHIF2

*** AFFICHE CARACTERE ***

AFTCA    LDA   #$0000     ; ADRESSE ECRAN
         STA   AFTCA2+1
         INC
         INC
         STA   AFTCA4+1
         LDX   #$0000     ; 1 ere COLONNE
AFTCA1   LDA   AFBTT,X
AFTCA2   STAL  $012000
         LDA   AFTCA2+1
         CLC
         ADC   #$00A0
         STA   AFTCA2+1   ; LIGNE SUIVANTE
         INX
         INX
         CPX   #$000A
         BNE   AFTCA1
         LDX   #$0000     ; 2 eme COLONNE
AFTCA3   LDA   AFBTT1,X
AFTCA4   STAL  $012000
         LDA   AFTCA4+1
         CLC
         ADC   #$00A0
         STA   AFTCA4+1   ; LIGNE SUIVANTE
         INX
         INX
         CPX   #$000A
         BNE   AFTCA3
         RTS

AFBTT    HEX   00000000000000000000
AFBTT1   HEX   00000000000000000000
VALH     HEX   0000       ; VALEUR HEXA
VAL1     HEX   0000
VAL2     HEX   0000       ; VALEUR DECIMALE
VAL3     HEX   0000
VAL4     HEX   0000
VALFLAG  HEX   0000       ; SI !=0 ALORS 000 EN NOIR
ADRE     HEX   0000       ; ADRESSE ECRAN
AFBT0    HEX   00FF0F000F000F0000FFF0000F000F000F00F000 ; 0
         HEX   000F00FF000F000F0FFF0000000000000000FF00 ; 1
         HEX   0FFF000000FF0F000FFFF0000F00F0000000FF00 ; 2
         HEX   0FFF0000000F00000FFFF0000F00F0000F00F000 ; 3
         HEX   0F000F000F000FFF00000000F000F000FF00F000 ; 4
         HEX   0FFF0F000FFF00000FFFFF000000F0000F00F000 ; 5
         HEX   00FF0F000FFF0F0000FFFF000000F0000F00F000 ; 6
         HEX   0FFF0000000F00F000F0FF00F000000000000000 ; 7
         HEX   00FF0F0000FF0F0000FFF0000F00F0000F00F000 ; 8
         HEX   00FF0F0000FF00000FFFF0000F00FF000F00F000 ; 9
         HEX   0000000000000000000000000000000000000000 ; NOIR

*-------------------------- Message

         hex   0d0d
         asc   'Let'27's just hope',0d
         asc   ':-)'
         hex   0d0d

********************  TRAITEMENT ET AFFICHAGE ECRANS  *********************

PICT     PHA              ; DESSINE LE DECOR SUR LE POINTEUR
         JSR   DESS1

PICT00   LDA   ECRAN
         BEQ   PICT01
         jsr   fadeOUT
PICT01   PLA
         STA   ECRAN      ; DANS ACC LE NUMERO DE L'ECRAN
         dec
         asl
         tax
         lda   ECRADTAB,x
         tax

         lda   ptrECRAN+1,x ; et mettre ces 3 lignes
         ldy   #0
         jsr   fadeIN

         JSR   CLNFLG     ; LES FLAGS DE BUMPER A ZERO
         STZ   BMPFLG     ; LES FLAGS A ZERO
         LDA   ECRAN      ; AFFICHAGES LIE A CHAQUE ECRAN
         DEC
         ASL
         TAX
         LDA   ECRANTAB,X
         STA   PICT20+1
PICT20   JMP   $FFFF      ; ON VA SUR LA ROUTINE CORRESPONDANTE

ECRANTAB DA    ECRMAIN,ECRDOCU  ; NOM DES ECRANS POUR INIT
ECRADTAB dw    0,4

CLNFLG   LDX   #$0062     ; ON MET TOUS LES FLAG DE BUMPER A 0
         LDA   #$0000
CLNFLG1  STA   FLAGTAB,X
         DEX
         DEX
         BPL   CLNFLG1
         RTS

PICT3    STA   ECRAN      ; CREATION DE L'IMAGE SELECT
         JSR   DESS1
         JSR   fadeOUT
         LDA   ptrDATAS+1
         STA   PICT31+2
* CLC
* ADC #$007E
* STA Fin3+2
* STA Fin5+2 ; INIT FADE IN
* STA Fin7+2
         LDA   PICT31+1
         AND   #$FF00
         ORA   #$004E
         STA   PICT31+1
         LDY   #$001A
PICT30   LDX   #$0048
PICT31   LDAL  $060000,X
PICT32   STAL  $015B8B,X  ; IMAGE
         DEX
         DEX
         BPL   PICT31
         LDA   PICT31+1
         CLC
         ADC   #$00A0
         STA   PICT31+1   ; LIGNE SUIVANTE
         LDA   PICT32+1
         CLC
         ADC   #$00A0
         STA   PICT32+1
         DEY
         BPL   PICT30
         LDA   #$5B8B
         STA   PICT32+1   ; REMET LA VALEUR
         lda   ptrDATAS+1
         ldy   #-1
         jsr   fadeIN
* JSR Fin0 ; FADEIN
         JSR   CLNFLG     ; LES FLAGS DE BUMPER A ZERO
         STZ   BMPFLG     ; LES FLAGS A ZERO
         JSR   SAUV
         JMP   SOURIS1

***********  TRAITEMENT INITIAL A L'AFFICHAGE

ECRMAIN  JSR   ECR0110    ; ECRAN MAIN
         JSR   SAUV
         JMP   SOURIS1

ECRDOCU  STZ   AFTCONT    ; ECRAN DOCUMENTATION
         JSR   AFFTEXT    ; INITIALISATION COMPLETE
         JSR   SAUV
         JMP   SOURIS1

*********************************************************************

********  SAISIE  *******************

SAVESAI  LDY   #$0006     ; NETTOYAGE SURFACE
SAVESAI1 LDA   #$0000
         LDX   #$0018
SAVESAI2 STAL  $0141D6,X  ; 1 LIGNES
         DEX
         DEX
         BPL   SAVESAI2
         LDA   SAVESAI2+1
         CLC              ; 5 LIGNES A EFFACER
         ADC   #$00A0
         STA   SAVESAI2+1
         DEY
         BNE   SAVESAI1
         LDA   #$41D6     ; REMET LA VALEUR
         STA   SAVESAI2+1

         LDX   #$0006     ; NETTOYAGE BUFFER ET NOM DE SAUVEGARDE (8 LETTRES)
         LDA   #$0000
SAVESAI3 STA   SAVESBU,X
         DEX
         DEX
         BPL   SAVESAI3

         LDA   #$9999     ; AFFICHAGE TIRET ROUGE
         STAL  $01450C
         LDA   #$9099
         STAL  $01450E

SAVESAI4 LDAL  $00BFFF    ; ON COMMENCE LA SAISIE : ON ATTEND 1 LETTRE
         BPL   SAVESAI4
         STAL  $00C010    ; BIT $C010
         XBA
         AND   #$00FF

         CMP   #$00FF     ; DELETE : ON EFFACE LA LETTRE
         BNE   SAVESAI10
         LDA   SAVESLS
         BEQ   SAVESAI4   ; RIEN A EFFACER
         JSR   SAVESGE    ; EFFACE 1 LETTRE : DECALAGE DROITE
         JSR   SAVESAF    ; REAFFICHE LA CHAINE
         DEC   SAVESLS
         BRA   SAVESAI4
SAVESAI10 CMP  #$00C1     ; MAJUSCULE ?
         BMI   SAVESAI4
         CMP   #$00DB
         BMI   SAVESAI5
         CMP   #$00E1     ; MINUSCULE ?
         BMI   SAVESAI4
         CMP   #$00FB
         BPL   SAVESAI4
         SEC
         SBC   #$0020
         BRA   SAVESAI5   ; CONVERSION MINUSCULE -> MAJUSCULE

SAVESAI5 TAY
         JSR   SAVESDE    ; DECALAGE GAUCHE
         STY   SAVESBU+7
         JSR   SAVESAF    ; AFFICHAGE
         LDA   SAVESLS
         INC
         CMP   #$0008
         BEQ   SAVESAI8   ; ON A SAISIE HUIT LETTRES
         STA   SAVESLS
         BRA   SAVESAI4

SAVESAI8 STZ   SAVESLS    ; C'EST LA FIN (8 LETTRES SAISIES)
         LDA   #$0000     ; EFFACE LE TIRET ROUGE
         STAL  $01450C
         STAL  $01450E
         LDX   #$0006     ; ON VERIFIE LE CODE
SAVESAI9 LDA   SAVESBU,X
         CLC
         ADC   #$0300
         STA   SAVECRY,X  ; ON CRYPTE
         DEX
         DEX
         BPL   SAVESAI9
         LDY   #$0000
         LDX   #$0000
SAVESAI6 LDA   SAVECRY,Y   ; ON CHERCHE
         CMP   PASSWRD,X
         BNE   SAVESAI7
         CPY   #$0006
         BEQ   SAVESAI11  ; TROUVE
         INY
         INY
         INX
         INX
         BRA   SAVESAI6
SAVESAI7 LDY   #$0000
         INX
         INX
         CPX   #$0328
         BNE   SAVESAI6
         LDA   #$0000     ; PAS TROUVE...
         STA   LEVEL
         LDX   #$0006
SAVESAI12 LDA  SAVEDEF,X  ; ON RECOPIE ADJUACES (DEFAULT)
         STA   SAVESBU,X
         DEX
         DEX
         BPL   SAVESAI12
         RTS
SAVESAI11 INX
         INX
         TXA
         LSR
         LSR              ; /8
         LSR
         dec
         STA   LEVEL
         sta   level
         stz   joker
         stz   life
         RTS

SAVESDE  LDX   #$0000     ; DECALAGE 1 CRAN VERS LA GAUCHE
SAVESDE1 LDA   SAVESBU+1,X
         STA   SAVESBU,X
         INX
         INX
         CPX   #$000A
         BNE   SAVESDE1
         RTS

SAVESGE  LDX   #$0006     ; DECALAGE 1 CRAN VERS LA DROITE
SAVESGE1 LDA   SAVESBU,X
         STA   SAVESBU+1,X
         DEX
         DEX
         BPL   SAVESGE1
         LDA   #$0000     ; PLACE UN ZERO AU DEBUT
         STA   SAVESBU-1
         RTS

SAVESAF  LDY   #$0000     ; AFFICHAGE SAISIE : 8 CARACTERES
         LDA   #$41D7
         STA   OPENADR
SAVESAF1 LDA   SAVESBU,Y
         AND   #$007F     ; PASSAGE 8 bit -> 7 bit
         JSR   OPENCAR    ; AFFICHE 1 CARAC
         INY
         CPY   #$0008
         BNE   SAVESAF1
         RTS

         HEX   0000
SAVESBU  HEX   C1,C4,CA,D5,C1,C3,C5,D3,0000 ; ADJUACES PAR DEFAUT
SAVESLS  HEX   0000       ; NB DE LETTRES SAISIES
SAVEDEF  HEX   C1C4CAD5C1C3C5D3
SAVECRY  HEX   0000000000000000

OPENCAR  PHY              ; RECOIT DANS ACC LE CARACTERE ET L'AFFICHE (OPENADR)
         AND   #$00FF
         CMP   #$0020     ; ESPACE -> SP
         BNE   OPENCAR8
         LDA   #$009E
OPENCAR8 STA   OPENCAR6+1
         LDY   #$0063
OPENCAR5 LDA   AFTTBL,Y   ; ON CHERCHE LE SPRITE CORESPONDANT
         AND   #$00FF
OPENCAR6 CMP   #$00FF
         BEQ   OPENCAR7
         DEY
         BPL   OPENCAR5
         LDY   #$003B     ; PAS TROUVE, ON MET UN ESPACE (40)
OPENCAR7 TYA
         ASL
         TAY
         LDA   AFTADR,Y   ; ADRESSE DES SPRITES
         STA   OPENCAR1+1
         CLC
         ADC   #$000A
         STA   OPENCAR3+1
         LDA   OPENADR    ; ADRESSE DESTINATION
         STA   OPENCAR2+1
         INC
         INC
         STA   OPENCAR4+1
         INC
         STA   OPENADR
         LDY   #$0000     ; 1 ere COLONNE
OPENCAR1 LDA   $AAAA,Y
OPENCAR2 STAL  $012000
         LDA   OPENCAR2+1
         CLC
         ADC   #$00A0
         STA   OPENCAR2+1 ; LIGNE SUIVANTE
         INY
         INY
         CPY   #$000A
         BNE   OPENCAR1
         LDY   #$0000     ; 2 eme COLONNE
OPENCAR3 LDA   $AAAA,Y
OPENCAR4 STAL  $012000
         LDA   OPENCAR4+1
         CLC
         ADC   #$00A0
         STA   OPENCAR4+1 ; LIGNE SUIVANTE
         INY
         INY
         CPY   #$000A
         BNE   OPENCAR3
         PLY
         RTS

OPENADR  HEX   0000       ; ADRESSE ECRAN

OBJAFF   SEC              ; AFFICHAGE OBJET
         SBC   #$00F0
         ASL
         TAX
         lda   ptrDATAS
         sta   OBJAFF1+1
         lda   ptrDATAS+1
         sta   OBJAFF1+2
         LDA   OBJETT,X
         clc
         adc   OBJAFF1+1
         STA   OBJAFF1+1  ; ADRESSE SPR
         LDA   AFTAE
         STA   OBJAFF2+1  ; ADRESSE ECR
         LDY   #$0017
OBJAFF0  LDX   #$000A
OBJAFF1  LDAL  $060000,X  ; ADRESSE SPRITE
OBJAFF2  STAL  $012000,X  ; ADRESSE ECRAN
         DEX
         DEX
         BPL   OBJAFF1
         LDA   OBJAFF1+1  ; LIGNE SUIVANTE
         CLC
         ADC   #$00A0
         STA   OBJAFF1+1
         LDA   OBJAFF2+1
         CLC
         ADC   #$00A0
         STA   OBJAFF2+1
         DEY
         BPL   OBJAFF0
         RTS

*-------------------------- Message

         hex   0d0d
         asc   'No wind, no wave, no woman, then no future'
         hex   0d0d

*************************************************

OBJETT   HEX   E12E,6140,E151,0B2F,EF2E,6F40,EF51,FD2E,7D40,FD51

AFTADR   DA    AFTA,AFTB,AFTC,AFTD,AFTE,AFTF,AFTG,AFTH,AFTI,AFTJ,AFTK,AFTL,AFTM,AFTN  ; 0-13
         DA    AFTO,AFTP,AFTQ,AFTR,AFTS,AFTT,AFTU,AFTV,AFTW,AFTX,AFTY,AFTZ,AFT0  ; 14-26
         DA    AFT1,AFT2,AFT3,AFT4,AFT5,AFT6,AFT7,AFT8,AFT9,AFTPL,AFTMOI,AFTET,AFTSL,AFTEG ; 27-40
         DA    AFTSO,AFTPE,AFTPI,AFTSU,AFTIN,AFTPO,AFTPF,AFTDP,AFTPT,AFTVI,AFTRO ; 41-51
         DA    AFTGU,AFTAP,AFTPV,AFTDI,AFTDO,AFTAC,AFTPC,AFTSP ; 52-59
         DA    AFTA,AFTB,AFTC,AFTD,AFTE,AFTF,AFTG,AFTH,AFTI,AFTJ,AFTK,AFTL,AFTM,AFTN ; 60-73
         DA    AFTO,AFTP,AFTQ,AFTR,AFTS,AFTT,AFTU,AFTV,AFTW,AFTX,AFTY,AFTZ ; 74-85
         DA    AFTA,AFTC,AFTE,AFTU,AFTE,AFTE,AFTA,AFTO,AFTBA,AFTRD,AFTFD,AFTFG,AFTSP,AFTNS ; 86-99

AFTA     HEX   00FF0F000FFF0F000F00F0000F00FF000F000F00 ; A
AFTB     HEX   0FFF0F000FFF0F000FFFF0000F00F0000F00F000 ; B
AFTC     HEX   00FF0F000F000F0000FFF0000F0000000F00F000 ; C
AFTD     HEX   0FFF0F000F000F000FFFF0000F000F000F00F000 ; D
AFTE     HEX   0FFF0F000FFF0F000FFFFF00000000000000FF00 ; E
AFTF     HEX   0FFF0F000FFF0F000F00FF000000000000000000 ; F
AFTG     HEX   00FF0F000F000F0000FFF0000000FF000F00F000 ; G
AFTH     HEX   0F000F000FFF0F000F000F000F00FF000F000F00 ; H
AFTI     HEX   0FFF000F000F000F0FFFFF00000000000000FF00 ; I
AFTJ     HEX   000F000000000F0000FFFF00F000F000F0000000 ; J
AFTK     HEX   0F000F000FFF0F000F000F00F0000000F0000F00 ; K
AFTL     HEX   0F000F000F000F000FFF0000000000000000FF00 ; L
AFTM     HEX   0F000FF00F0F0F000F000F00FF000F000F000F00 ; M
AFTN     HEX   0F000FF00F0F0F000F000F000F000F00FF000F00 ; N
AFTO     HEX   00FF0F000F000F0000FFF0000F000F000F00F000 ; O
AFTP     HEX   0FFF0F000FFF0F000F00F0000F00F00000000000 ; P
AFTQ     HEX   00FF0F000F000F0000FFF0000F000F00F0000F00 ; Q
AFTR     HEX   0FFF0F000FFF0F000F00F0000F00F000F0000F00 ; R
AFTS     HEX   00FF0F0000FF00000FFFFF000000F0000F00F000 ; S
AFTT     HEX   0FFF000F000F000F000FFF000000000000000000 ; T
AFTU     HEX   0F000F000F000F0000FF0F000F000F000F00F000 ; U
AFTV     HEX   0F000F0000F000F0000F0F000F00F000F0000000 ; V
AFTW     HEX   0F000F000F0F0FF00F000F000F000F00FF000F00 ; W
AFTX     HEX   0F0000F0000F00F00F000F00F0000000F0000F00 ; X
AFTY     HEX   0F000F0000F0000F000F0F000F00F00000000000 ; Y
AFTZ     HEX   0FFF0000000F00F00FFFFF00F00000000000FF00 ; Z
AFT0     HEX   00FF0F000F000F0000FFF0000F000F000F00F000 ; 0
AFT1     HEX   000F00FF000F000F0FFF0000000000000000FF00 ; 1
AFT2     HEX   0FFF000000FF0F000FFFF0000F00F0000000FF00 ; 2
AFT3     HEX   0FFF0000000F00000FFFF0000F00F0000F00F000 ; 3
AFT4     HEX   0F000F000F000FFF00000000F000F000FF00F000 ; 4
AFT5     HEX   0FFF0F000FFF00000FFFFF000000F0000F00F000 ; 5
AFT6     HEX   00FF0F000FFF0F0000FFFF000000F0000F00F000 ; 6
AFT7     HEX   0FFF0000000F00F000F0FF00F000000000000000 ; 7
AFT8     HEX   00FF0F0000FF0F0000FFF0000F00F0000F00F000 ; 8
AFT9     HEX   00FF0F0000FF00000FFFF0000F00FF000F00F000 ; 9
AFTPL    HEX   000F000F0FFF000F000F00000000FF0000000000 ; +
AFTMOI   HEX   000000000FFF0000000000000000FF0000000000 ; -
AFTET    HEX   0F0F00FF0FFF00FF0F0F0F00F000FF00F0000F00 ; *
AFTSL    HEX   00000000000F00F00F000F00F000000000000000 ; /
AFTEG    HEX   00000FFF00000FFF00000000FF000000FF000000 ; =
AFTSO    HEX   00000000000000000FFF0000000000000000FF00 ; _
AFTPE    HEX   000F000F000F0000000F00000000000000000000 ; !
AFTPI    HEX   00FF0F00000F0000000FF0000F00F00000000000 ; ?
AFTSU    HEX   00F0000F0000000F00F000000000F00000000000 ; >
AFTIN    HEX   0000000F00F0000F0000F000000000000000F000 ; <
AFTPO    HEX   000F00F000F000F0000F00000000000000000000 ; (
AFTPF    HEX   000F000000000000000F0000F000F000F0000000 ; )
AFTDP    HEX   0000000F0000000F000000000000000000000000 ; :
AFTPT    HEX   0000000000000000000F00000000000000000000 ; .
AFTVI    HEX   0000000000000000000F000000000000F0000000 ; ,
AFTRO    HEX   00FF00F000FF00000000F000F000F00000000000 ; o
AFTGU    HEX   00F000F0000000000000F000F000000000000000 ; "
AFTAP    HEX   000F000F00000000000000000000000000000000 ; '
AFTPV    HEX   0000000000000000000F0000F0000000F0000000 ; ;
AFTDI    HEX   00F00FFF00F00FFF00F0F000FF00F000FF00F000 ; #
AFTDO    HEX   00FF0F0F00FF000F0FFFFF000000F0000F00F000 ; $
AFTAC    HEX   000F00F00F00000000000000F0000F0000000000 ; ^
AFTPC    HEX   0FF00FF0000F00F00F000F00F0000000FF00FF00 ; %
AFTSP    HEX   0000000000000000000000000000000000000000 ; SPACE
AFTRD    HEX   00FF0FFF0FFF0FFF00FFF000FF00FF00FF00F000 ; o
AFTBA    HEX   0FF0F0000F0000F0FF00FF00F0F0FF00F000F000 ; SP
AFTFD    HEX   000F000F0FFF000F000F0000F000FF00F0000000 ; ->
AFTFG    HEX   000F00FF0FFF00FF000F00000000FF0000000000 ; <-
AFTNS    HEX   0FFF0FFF0FFF0FFF0FFFFF00FF00FF00FF00FF00 ; NO SE

AFTTBL   HEX   4142434445464748494A4B4C4D4E4F505152535455565758595A ; A-Z
         HEX   30313233343536373839 ; 0-9
         HEX   2B2D2A2F3D5F213F3E3C28293A2E2C ; +-*/=_!?><():.,
         HEX   5B22273B23245E2520 ; o"';#$^%                    @
         HEX   6162636465666768696A6B6C6D6E6F707172737475767778797A ; a-z
         HEX   888D8E9D8F9089999E94C8C709 ; @\{|}^e^a^oIo-><-TAB

PASSWRD  ASC   "AGJXAFEVGDSLAQDLGUOLDHKQNHBDCUUFRHSWUVHDEQTULDCRBRTFRHPDOFTRAQVD"
         ASC   "CRAGSXPSRDWESNIWTDNJVLLLDHNDJRIQVDMETKEDUQPDSXBRLDNGPDP\PUESPDNG"
         ASC   "NLFHSDIOBUOFIQDLBXSNPXLLLRGLMDRDOFTRGOAETUIVEPEVCRNYJHHRRHNGCOIQ"
         ASC   "NHGDPRL\PHTUAFCHSSOQEQCULDZ\HRMLHHNGOXTNPDP\ESISCRCNSWUPEWHLGDNJ"
         ASC   "IQLDDRNFIQTHAVSDMDSWWROGAERRIQSWBDCNBDNDEFLRWKISGUOLIPPRCXBDCXBD"
         ASC   "DHCODUOOSLMSUQDHUQHXSFHRLHGDMXRDAQIPCDTHLDUJMDGDPDLVD\SVBUOFRHVH"
         ASC   "PRRUUQDHULGXASEUNRNKMLSFPHRXSPIWD\SVDHKQDLUUGDSLOGOUCDUVPHAVAQCK"
         ASC   "UUOUDHFHSXBEPLCNRXLDSFAUNRDXORPKCRBHGDLHTUOOTDCVPHAVVDMEX\LRWLRH"
         ASC   "SFIXMLNWEXGHRXNHEUUSPOOWMDRLCRNNNXRVHLSSSQOEHRMRPRRWCDRRCKAUGHDD"
         ASC   "UQNHPRWVPROQRRMDPUEDPUESSDIOZROQIVOVNXRVHHNGWROGAJOQUSSQLDNGDLVX"
         ASC   "NLCNMDSWPLCNRRLOOXTVSSOWKDLDAFCHTHLRRXLDWRRNLDUGGUALUSLDPRLROFTR"
         ASC   "RHPDDHTDFHLGUQFRBDDLVHLOPDTLBHEITLTDSDUFPXPLUQPUMDSWEUUSQXAUFHLG"
         ASC   "GUIISLDHWKIWUQNLDRWQIQSXUQLLIVOSMXAGDLBX"

****************************  AFFICHAGE TEXT  **********************************

AFFTEXT  LDA   #$0062     ; LONGUEUR DE LA Ligne
         STA   AFTAM1+1   ; 90
         STZ   AFTLIG
         STZ   AFTCOL
         JSR   AFTLC      ; EN HAUT A GAUCHE
         STA   AFTAE
         JSR   AFTNE      ; CLEAR SCREEN

         LDA   AFTCONT
         BNE   AFTDEB1

***   DEBUT   ***

AFTDEB0  LDA   #$0000     ; DEBUT DU TEXTE 040000
         STA   AFTDEB3+1
         STA   AFTTBI
         STZ   AFTCONT
         STZ   AFTIND     ; PREMIERE PAGE
         STZ   AFTFL4     ; FIN DE FICHIER
         BRA   AFTDEB3

AFTDEB1  LDA   AFTIND
         ASL
         TAX              ; ON SE MET A LA BONNE PAGE
         LDA   AFTTBI,X   ; ADRESSE
         STA   AFTDEB3+1

******************

AFTDEB3  lda   #0000      ; ADRESSE DE LA PREMIERE LETTRE
         sta   AFTDEB4+1
         sta   AFTAM+1
         sep   #$20
         lda   ptrNIV+2
         sta   AFTDEB4+3
         sta   AFTAM+3
         rep   #$20

         LDY   #$0000
AFTDEB4  LDAL  $040000    ; ADRESSE DU MOT
         sec
         sbc   #$0303
         CMP   #$A4A4     ; FIN DU FICHIER : ]]
         BEQ   AFTFFI0
         AND   #$00FF
         BEQ   AFTFFI0    ; FIN DU FICHIER : 00
         CMP   #$00A4     ; TIPS...
         BEQ   AFTTIPS
         CMP   #$0020     ; ESPACE
         BEQ   AFTES0
         CMP   #$000D     ; RETURN
         BEQ   AFTRE0
         CMP   #$0009     ; TABULATION
         BEQ   AFTTA0
         INY
         INC   AFTDEB4+1
         BRA   AFTDEB4

AFTES0   JMP   AFTES
AFTRE0   JMP   AFTRE
AFTTA0   JMP   AFTTA
AFTFFI0  JMP   AFTFFI     ; FIN DE FICHIER
AFTTIPS  LDA   TIPSFLAG
         BEQ   AFTFFI0
         BRA   AFTES0     ; ON IGNORE

***************

AFTFFI   INC   AFTFL4      ; FIN DU FICHIER
         JMP   AFTFI

AFTTA    CPY   #$0000     ; TAB
         BNE   AFTTA1
         LDA   #$0001     ; TAB SEUL
         STA   AFTTR3+1
         JMP   AFTTR1
AFTTA1   INC   AFTFL3     ; MOT AVANT
         JMP   AFTMO

AFTRE    CPY   #$0000     ; RETURN
         BNE   AFTRE1
         LDA   #$0001     ; RETURN SEUL
         STA   AFTTR6+1
         JMP   AFTTR5
AFTRE1   INC   AFTFL2     ; MOT AVANT
         JMP   AFTMO

AFTES    CPY   #$0000     ; ESPACE
         BNE   AFTES1
         LDA   #$0001     ; ESPACE SEUL
         STA   AFTTR10+1
         JMP   AFTTR8
AFTES1   INC   AFTFL1     ; MOT AVANT
         JMP   AFTMO

*********  AFFICHAGE MOT  ***********

AFTMO    CPY   #$0033
         BMI   AFTMO2
         INY              ; MOT SUIVANT
         STY   AFTMO1+1
         LDA   AFTDEB3+1
         CLC
AFTMO1   ADC   #$0000
         STA   AFTDEB3+1
         JMP   AFTDEB3
AFTMO2   LDA   #$0034
         SEC
         SBC   AFTCOL
         STA   AFTMO3+1
AFTMO3   CPY   #$0000     ; NB COLON RESTANTE
         BMI   AFTMO5
         LDA   AFTLIG
         CMP   #$001A     ; 26 LIGNES
         BNE   AFTMO4
         JMP   AFTFI      ; FIN ECRAN
AFTMO4   STZ   AFTCOL
         INC   AFTLIG
AFTMO5   LDA   AFTDEB3+1  ; ADRESSE DU DERNIER MOT
         STA   AFTAM+1
         TYA
         STA   AFTAM8+1
         INC
         STA   AFTTR3+1   ; LONGUEUR DU MOT +1
         STA   AFTTR6+1
         STA   AFTTR10+1
         JSR   AFTLC
         STA   AFTAE
         JSR   AFTAM

******  TRAITEMENT DU SPACE, RETURN, TAB ...  ******

AFTTR    LDA   AFTFL3     ; TAB
         BEQ   AFTTR4
         STZ   AFTFL3
AFTTR1   LDA   AFTDEB3+1
         CLC
AFTTR3   ADC   #$0000     ; LONGUEUR+1
         STA   AFTDEB3+1
         LDA   AFTCOL
         ASL
         TAX
         LDA   AFTTAB,X
         CMP   #$0033
         BMI   AFTTR2
         LDA   AFTLIG     ; ON VA A LA LIGNE
         CMP   #$001A
         BEQ   AFTFI      ; FIN ECRAN
         INC   AFTLIG
         LDA   #$0000
AFTTR2   STA   AFTCOL
         JMP   AFTDEB3

AFTTR4   LDA   AFTFL2     ; RETURN
         BEQ   AFTTR7
         STZ   AFTFL2
AFTTR5   LDA   AFTDEB3+1
         CLC
AFTTR6   ADC   #$0000     ;  LONGUEUR+1
         STA   AFTDEB3+1
         LDA   AFTLIG
         CMP   #$001A     ; 26 LIGNES
         BEQ   AFTFI      ; FIN ECRAN
         INC   AFTLIG
         STZ   AFTCOL
         JMP   AFTDEB3

AFTTR7   LDA   AFTFL1     ; SPACE
         BEQ   AFTTR11    ; **********
         STZ   AFTFL1
AFTTR8   LDA   AFTDEB3+1
         CLC
AFTTR10  ADC   #$0000     ; LONGUEUR +1
         STA   AFTDEB3+1
         LDA   AFTCOL
         INC
         STA   AFTCOL
         CMP   #$0033
         BMI   AFTTR9
         LDA   AFTLIG
         CMP   #$001A
         BEQ   AFTFI      ; FIN ECRAN
         INC   AFTLIG
         STZ   AFTCOL
AFTTR9   JMP   AFTDEB3
AFTTR11  LDA   AFTDEB3+1
         CLC
         ADC   AFTTR10+1  ; LONGUEUR +1
         STA   AFTDEB3+1
         JMP   AFTDEB3

*******  FIN D'AFFICHAGE D'1 PAGE  *******

AFTFI    INC   AFTCONT    ;
         LDA   AFTIND
         INC
         ASL              ;
         TAX
         LDA   AFTDEB3+1
         STA   AFTTBI,X   ; INDEX TAB
         RTS              ; ON SORT

************************** AFFICHAGE GRAPHIQUE ********************************

AFTAM    LDAL  $040000    ; ADRESSE DE LA LETTRE
         AND   #$00FF
         sec
         sbc   #$0003
         STA   AFTAM3+1   ; cherche le caractere dans la table
         AND   #$00FF
         CMP   #$00F0     ; CARACTERE SPECIAUX : OBJETS
         BMI   AFTAM1
         JSR   OBJAFF     ; AFFICHAGE OBJETS
         BRA   AFTAM7
AFTAM1   LDX   #$0000     ; LONGUEUR DE LA Ligne DE CARACTERE
AFTAM2   LDA   AFTTBL,X
         AND   #$00FF
AFTAM3   CMP   #$0000     ; notre caractere
         BEQ   AFTAM5
         CPX   #$0000
         BEQ   AFTAM4
         DEX
         BRA   AFTAM2
AFTAM4   LDX   #$0063     ; PAS DANS LA Ligne
AFTAM5   JSR   AFTCAR     ; AFFICHE LE CARACTERE
         DEY              ; DANS Y LA LONGUEUR DU MOT
         BEQ   AFTAM7
         LDA   AFTAE
         INC
         INC              ; ADREC LETTRE SUIVANTE
         INC
         STA   AFTAE
         INC   AFTAM+1    ; LETTRE SUIVANTE
         BRA   AFTAM
AFTAM7   LDA   AFTCOL
         CLC
AFTAM8   ADC   #$0000     ; LONGUEUR DU MOT+1
         STA   AFTCOL
         RTS

*******  NETTOYAGE ********

AFTNE    LDA   #$25A2
         STA   AFTNE2+1   ; INIT
         LDY   #$00A0     ; 160 LIGNES
AFTNE1   LDA   #$0000
         LDX   #$0099     ; 306/2
AFTNE2   STAL  $0125A2,X
         DEX              ; 1 LIGNE
         DEX
         BPL   AFTNE2
         LDA   AFTNE2+1
         CLC              ; LIGNE SUIVANTE
         ADC   #$00A0
         STA   AFTNE2+1
         DEY
         BPL   AFTNE1
         RTS

******** AFFICHE CARACTERE ********

AFTCAR   TXA              ; RECOIT DANS X LA POSITION
         ASL              ; DU CARACTERE
         TAX
         LDA   AFTADR,X
         STA   AFTCAR1+1
         CLC
         ADC   #$000A
         STA   AFTCAR3+1
         LDA   AFTAE
         STA   AFTCAR2+1
         INC
         INC
         STA   AFTCAR4+1
         LDX   #$0000     ; 1 ere COLONNE
AFTCAR1  LDA   $AAAA,X
AFTCAR2  STAL  $012000
         LDA   AFTCAR2+1
         CLC
         ADC   #$00A0
         STA   AFTCAR2+1  ; LIGNE SUIVANTE
         INX
         INX
         CPX   #$000A
         BNE   AFTCAR1
         LDX   #$0000     ; 2 eme COLONNE
AFTCAR3  LDA   $AAAA,X
AFTCAR4  STAL  $012000
         LDA   AFTCAR4+1
         CLC
         ADC   #$00A0
         STA   AFTCAR4+1  ; LIGNE SUIVANTE
         INX
         INX
         CPX   #$000A
         BNE   AFTCAR3
         RTS

***********  LIGNE COLONNE  *************

AFTLC    LDA   AFTLIG
         ASL
         TAX
         LDA   AFTTL,X    ; LIGNE
         STA   AFTLC1+1
         LDA   AFTCOL
         ASL
         TAX
         LDA   AFTTC,X    ; COLON
         CLC
AFTLC1   ADC   #$0000
         CLC
         ADC   #$2000
         RTS

*-------------------------- Message

         hex   0d0d
         asc   'What is the difference the MAC IIcx and the SE30 ? $1000'
         hex   0d0d

***************  TABLES, VARIABLES ET FLAGS  ******************

AFTAE    HEX   0000       ; ADRESSE ECRAN ECRITURE
AFTLIG   HEX   0000       ; 0 A 26  LIGNES
AFTCOL   HEX   0000       ; 0 A 50  COLONNES
AFTIND   HEX   0000       ; INDEX PAGES

AFTFL1   HEX   0000       ; 1 SI SPACE
AFTFL2   HEX   0000       ; 1 SI RETURN
AFTFL3   HEX   0000       ; 1 SI TAB
AFTFL4   HEX   0000       ; 1 SI FIN DE FICHIER
AFTCONT  HEX   0000       ; 1 SI NON FIN

AFTTBI   HEX   0000000000000000000000000000000000000000 ; 10
         HEX   0000000000000000000000000000000000000000 ; 20
         HEX   0000000000000000000000000000000000000000 ; 30
         HEX   0000000000000000000000000000000000000000 ; 40

AFTTL    HEX   A0056009200DE010A0146018201CE01FA0236027202B ; 0-10
         HEX   E02EA0326036203AE03DA04160452049E04CA0506054 ; 11-21
         HEX   2058E05BA05F60632067                         ; 22-26

AFTTC    HEX   0300060009000C000F001200150018001B001E002100 ; 0-10
         HEX   240027002A002D0030003300360039003C003F004200 ; 11-21
         HEX   450048004B004E005100540057005A005D0060006300 ; 22-32
         HEX   660069006C006F007200750078007B007E0081008400 ; 33-43
         HEX   87008A008D009000930096009900 ; 44-50

AFTTAB   HEX   040004000400040008000800080008000C000C000C000C00 ; 12
         HEX   100010001000100014001400140014001800180018001800 ;
         HEX   1C001C001C001C0020002000200020002400240024002400 ;
         HEX   28002800280028002C002C002C002C003000300030003000 ;
         HEX   34003400340034003800380038003800

*******************************************************************************
