*
* Start Olivier
*

INITMOUS LDA   #$0000
         STA   POSX
         STA   POSY
         STA   A1         ; INIT SOURIS
         STA   AP
         JSR   SAUV       ; SAUVEGARDE DECOR
         JSR   DESS

         LDY   ptrMESSAGE+1 ; INIT ADRESSE EASTER EGGS
         STY   EAEGSP1+2
         STY   EAEGSP3+2
         STY   EAEGSP4+2
         STY   EAEGSP6+2

         LDA   fgDOC      ; INIT LANGUE
         BEQ   INITMOU1
         LDA   #TEXTEUSD  ; ANGLAIS
         STA   DOCADR
         LDA   #TEXTEUSA
         STA   ABOUADR
         LDA   #$0008     ; 9 PAGES DE DOC
         STA   ECR1012+1
         LDA   #$0008     ; 9 PAGES DE ABOUT
         STA   ECR1112+1
         BRA   INITMOU2
INITMOU1 LDA   #TEXTEFRD  ; FRANCAIS
         STA   DOCADR
         LDA   #TEXTEFRA
         STA   ABOUADR
         LDA   #$0007     ; 8 PAGES DE DOC
         STA   ECR1012+1
         LDA   #$0007     ; 8 PAGES DE ABOUT
         STA   ECR1112+1

INITMOU2 LDA   #CADMMUF   ; INIT MUSIC PATCH BUMPER : MUSIC
         STA   ECR07DAT
         LDA   #CADMSNC
         STA   ECR07DAT+8

         JSR   ECR08PATCH ; INIT GROUND PATCH BUMPER : RANDOM
         LDA   #CADGRRAF
         STA   ECR08DAT+32

         LDA   #$0002
         JMP   PICT       ; IMAGE LUDY

         asc   'Tinies & Cogito, copyright CACAlisto',8d
         asc   'Atreid, Kalisto, Muad Dib... copyright Frank Herbert',8D
         asc   'Taken from the book Dune...',8d

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
         LDA   TABLE,X
         CLC
SOURIS2  ADC   #$0000     ; CALCUL DE A1 (160*POSY+POSX)
         STA   A1
         JSR   TRACE      ; ON DESSINE LE POINTEUR

         lda   BON
         inc
         sta   BON
         cmp   #1000
         bne   SECR
         stz   BON

         LDA   fgWHICH
         BNE   SECR
         PHA
         _NTUpdateSound   ; SOUNDTRACK
         PLA

*****

SECR     JSR   KEYBOARD   ; TOUCHE ?
         LDA   ECRAN
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
         JSR   BORD5      ; FORCE LA BORDURE NOIRE
         JMP   BUMPDEF    ; AUCUN BOUTON DETECTE : TRAITEMENT PAR DEFAUT

BON      ds    2

         asc   'Steve Sebban: don t you need a french dictionary? :-)',8d

*******************************************************************************
***********************  TRAITEMENT DES BOUTONS  ******************************
*******************************************************************************

KEYBOARD LDAL  $00BFFF
         BPL   KEYBOAR1
         STAL  $00C010    ; BIT $C010
         LDA   ECRAN
         CMP   #$0005
         BPL   KEYBOAR1
         PLA              ; RECUPERE L'ADRESSE DE RETOUR DU JSR
         LDA   #$0005     ; SAUT AU CONTROL PANEL
         JMP   PICT
KEYBOAR1 RTS

BORD5    LDAL  $00C034    ; ICI TRAITEMENT PAR DEFAUT
         AND   #$FFF0     ; BORDURE NOIRE
         STAL  $00C034
BORD55   RTS

BORD6    LDAL  $00C034
         AND   #$FFF0
         ORA   #$0001     ; ROUGE
         STAL  $00C034
         RTS

**************** COGITO JEU

ECRJEH1  LDX   SECR2+1    ; FLECHES HAUT
         LDA   #ECRJEH10
         STA   BUMPER5+1
         JMP   BUMPER
ECRJEH10 LDA   POSX
         SEC
         SBC   #$0016     ; 22
         TAX
         LDA   ECR01TA1,X
         AND   #$00FF
         BEQ   ECRJEH11   ; RIEN
         DEC
         PHA
         JSR   DESS1
         PLA
         JMP   THIRD
ECRJEH11 JMP   SOURIS

ECRJEB1  LDX   SECR2+1    ; FLECHES BAS
         LDA   #ECRJEB10
         STA   BUMPER5+1
         JMP   BUMPER
ECRJEB10 LDA   POSX
         SEC
         SBC   #$0016     ; 22
         TAX
         LDA   ECR01TA2,X
         AND   #$00FF
         BEQ   ECRJEB11   ; RIEN
         PHA
         JSR   DESS1
         PLA
         JMP   THIRD
ECRJEB11 JMP   SOURIS

ECRJEG1  LDX   SECR2+1    ; FLECHES GAUCHE
         LDA   #ECRJEG10
         STA   BUMPER5+1
         JMP   BUMPER
ECRJEG10 LDA   POSY
         SEC
         SBC   #$0026     ; 38
         TAX
         LDA   ECR01TA3,X
         AND   #$00FF
         BEQ   ECRJEG11   ; RIEN
         PHA
         JSR   DESS1
         PLA
         JMP   THIRD
ECRJEG11 JMP   SOURIS

ECRJED1  LDX   SECR2+1    ; FLECHE DROITE 1
         LDA   #ECRJED10
         STA   BUMPER5+1
         JMP   BUMPER
ECRJED10 LDA   POSY
         SEC
         SBC   #$0026     ; 38
         TAX
         LDA   ECR01TA4,X
         AND   #$00FF
         BEQ   ECRJED11   ; RIEN
         PHA
         JSR   DESS1
         PLA
         JMP   THIRD
ECRJED11 JMP   SOURIS

ECREEHA  LDA   #ECREEHA1  ; EASTER EGGS HAPPY (SURFACE)
         STA   SURFACE5+1
         JMP   SURFACE
ECREEHA1 NOP
         STZ   noINTER    ; ARRETE LE TEMPS
         INC   CTPNFLG    ; INTERDIT L'ENTREE DANS LE CONTROL PANEL
         JSR   DESS1      ; ENLEVE LE POINTEUR
         JSR   CADEAEG    ; CREATION DU CADRE ET DU BOUTON
         LDA   #$0000     ; SPRITE WOOD
         JSR   EAEGSPR
         LDA   #$0001     ; TEXTE WOOD
         JSR   EAEGSPR
         LDA   #$000D
         JMP   PICT1

ECREELU  LDA   #ECREELU1  ; EASTER EGGS LUDY (SURFACE)
         STA   SURFACE5+1
         JMP   SURFACE
ECREELU1 NOP
         STZ   noINTER    ; ARRETE LE TEMPS
         INC   CTPNFLG    ; INTERDIT L'ENTREE DANS LE CONTROL PANEL
         JSR   DESS1      ; ENLEVE LE POINTEUR
         JSR   CADEAEG    ; CREATION CADRE ET BOUTON
         LDA   #$0004     ; SPRITE B&W
         JSR   EAEGSPR
         LDA   #$0005     ; TEXTE B&W
         JSR   EAEGSPR
         LDA   #$000D
         JMP   PICT1

ECREEPL  LDA   #ECREEPL1  ; EASTER EGGS PLANET (SURFACE)
         STA   SURFACE5+1
         JMP   SURFACE
ECREEPL1 NOP
         STZ   noINTER    ; ARRETE LE TEMPS
         INC   CTPNFLG    ; INTERDIT L'ENTREE DANS LE CONTROL PANEL
         JSR   DESS1      ; ENLEVE LE POINTEUR
         JSR   CADEAEG    ; CREATION CADRE ET BOUTON
         LDA   #$0006     ; SPRITE FUTUR
         JSR   EAEGSPR
         LDA   #$0007     ; TEXTE FUTUR
         JSR   EAEGSPR
         LDA   #$000D
         JMP   PICT1

ECREEXE  LDA   #ECREEXE1  ; EASTER EGGS XENO (SURFACE)
         STA   SURFACE5+1
         JMP   SURFACE
ECREEXE1 NOP
         STZ   noINTER    ; ARRETE LE TEMPS
         INC   CTPNFLG    ; INTERDIT L'ENTREE DANS LE CONTROL PANEL
         JSR   DESS1      ; ENLEVE LE POINTEUR
         JSR   CADEAEG    ; CREATION CADRE ET BOUTON
         LDA   #$0002     ; SPRITE BRUTAL
         JSR   EAEGSPR
         LDA   #$0003     ; TEXTE BRUTAL
         JSR   EAEGSPR
         LDA   #$000D
         JMP   PICT1

JAMAIS   STZ   noINTER    ; ECRAN GAGNE !!
         INC   CTPNFLG
         JSR   DESS1
         JSR   CADRE
         LDA   #$0008     ; COUPE
         JSR   EAEGSPR
         LDA   #$0009     ; TEXTE
         JSR   EAEGSPR
         JSR   KBD        ; ATTEND UNE TOUCHE
         JSR   RESTAUR
         LDA   #$0001
         STA   noINTER    ; RETABLI LE TEMPS
         STZ   CTPNFLG    ; ON AUTORISE L'ENTREE DANS LE CTPN
         LDA   OLDECR
         STA   ECRAN
         RTS

************* CONTROL PANEL

ECR0500  LDX   SECR2+1    ; GAME
         LDA   #ECR0501
         STA   BUMPER5+1
         JMP   BUMPER
ECR0501  NOP
         LDA   #$0006
         JMP   PICT

ECR0510  LDX   SECR2+1    ; MUSIC
         LDA   #ECR0511
         STA   BUMPER5+1
         JMP   BUMPER
ECR0511  NOP
         LDA   #$0007
         JMP   PICT

ECR0520  LDX   SECR2+1    ; GROUND
         LDA   #ECR0521
         STA   BUMPER5+1
         JMP   BUMPER
ECR0521  NOP
         LDA   #$0008
         JMP   PICT

ECR0530  LDX   SECR2+1    ; LEVEL
         LDA   #ECR0531
         STA   BUMPER5+1
         JMP   BUMPER
ECR0531  NOP
         LDA   #$0009
         JMP   PICT

ECR0540  LDX   SECR2+1    ; DOC
         LDA   #ECR0541
         STA   BUMPER5+1
         JMP   BUMPER
ECR0541  NOP
         STZ   AFTIND
         LDA   #$000A
         JMP   PICT

ECR0550  LDX   SECR2+1    ; ABOUT
         LDA   #ECR0551
         STA   BUMPER5+1
         JMP   BUMPER
ECR0551  NOP
         STZ   AFTIND
         LDA   #$000B
         JMP   PICT

ECR0560  LDX   SECR2+1    ; QUIT
         LDA   #ECR0561
         STA   BUMPER5+1
         JMP   BUMPER
ECR0561  NOP
         LDA   #$000C
         JMP   PICT

ECR0570  LDX   SECR2+1    ; OK
         LDA   #ECR0571
         STA   BUMPER5+1
         JMP   BUMPER
ECR0571  NOP
         JSR   RESTAUR    ; ENLEVE LE CONTROL PANEL
         LDA   #$0001
         STA   noINTER    ; RETABLI LE TEMPS
         STZ   CTPNFLG    ; ON AUTORISE LA CREATION DU CTPN
         LDA   GROUECR
         JMP   PICT1      ; EN REVIENT A L'ANCIEN ECRAN

*********** LOAD/SAVE GAME

ECR0600  LDX   SECR2+1    ; LOAD
         LDA   #ECR0601
         STA   BUMPER5+1
         JMP   BUMPER
ECR0601  NOP
         JSR   TEMPload
         LDA   CHANGFLG   ; ON DEMANDE UN CHANGEMENT PIECES/FLECHES
         ORA   #$0001     ; 0000.0000,0000.0001
         STA   CHANGFLG
         JMP   SOURIS1

ECR0610  LDX   SECR2+1    ; SAVE
         LDA   #ECR0611
         STA   BUMPER5+1
         JMP   BUMPER
ECR0611  NOP
         JSR   saveFILE
         JMP   SOURIS1

ECR0620  LDX   SECR2+1    ; OK
         LDA   #ECR0621
         STA   BUMPER5+1
         JMP   BUMPER
ECR0621  NOP
         JSR   CTPNCLNZ    ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

**************  MUSIC

ECR0700  LDX   SECR2+1    ; MUSIC
         LDA   #ECR0701
         STA   BUMPER5+1
         JMP   BUMPER
ECR0701  NOP
         LDA   #CADMMUF   ; PATCH BUMPER
         STA   ECR07DAT
         LDA   #CADMSNC
         STA   ECR07DAT+8
         JSR   CADMSNC    ; SOUND FONCE
         JSR   CADMMUF    ; MUSIC CLAIR
         LDA   MUSIFLAG
         BEQ   ECR07010   ; ON AVAIT DEJA SELECTIONNE LA ZIC
         STZ   MUSIFLAG
         jsr   stopSND    ; ARRETE LES SONS
         jsr   startNT    ; DEMARRE LA MUSIQUE
         jsr   startZIK
         stz   fgWHICH
ECR07010 JSR   SAUV
         JMP   SOURIS1

ECR0710  LDX   SECR2+1    ; SOUND
         LDA   #ECR0711
         STA   BUMPER5+1
         JMP   BUMPER
ECR0711  NOP
         LDA   #CADMMUC   ; PATCH BUMPER
         STA   ECR07DAT
         LDA   #CADMSNF
         STA   ECR07DAT+8
         JSR   CADMMUC    ; MUSIC FONCE
         JSR   CADMSNF    ; SOUND CLAIR
         LDA   MUSIFLAG
         BNE   ECR07110   ; ON AVAIT DEJA
         LDA   #$0001
         STA   MUSIFLAG
         JSR   stopNT     ; ARRETE MUSIQUE
         JSR   startSND   ; DEMARRE LES SONS
         lda   #1
         sta   fgWHICH
ECR07110 JSR   SAUV
         JMP   SOURIS1

ECR0720  LDX   SECR2+1    ; OK
         LDA   #ECR0721
         STA   BUMPER5+1
         JMP   BUMPER
ECR0721  NOP
         JSR   CTPNCLNZ   ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

MUSIFLAG HEX   0000       ; 0:MUSIC, 1:SOUND

****************** GROUND

ECR0800  LDX   SECR2+1    ; HAPPY
         LDA   #ECR0801
         STA   BUMPER5+1
         JMP   BUMPER
ECR0801  NOP
         JSR   ECR08PATCH ; PATCH BUMPER
         LDA   #CADGRHAF
         STA   ECR08DAT
         JSR   CADGRLUC   ; LUDY FONCE
         JSR   CADGRPLC   ; PLANET FONCE
         JSR   CADGRXEC   ; XENO FONCE
         JSR   CADGRRAC   ; RANDOM FONCE
         JSR   CADGRHAF   ; HAPPY CLAIR
         STZ   GROUFLAG   ; DESIRE : HAPPY
         STZ   fgRANDOM   ; RANDOM OFF
         LDA   CHANGFLG
         ORA   #$0002     ; DEMANDE UN CHANGEMENT DE DECOR
         STA   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECR0810  LDX   SECR2+1    ; LUDY
         LDA   #ECR0811
         STA   BUMPER5+1
         JMP   BUMPER
ECR0811  NOP
         JSR   ECR08PATCH ; PATCH BUMPER
         LDA   #CADGRLUF
         STA   ECR08DAT+8
         JSR   CADGRHAC   ; HAPPY FONCE
         JSR   CADGRPLC   ; PLANET FONCE
         JSR   CADGRXEC   ; XENO FONCE
         JSR   CADGRRAC   ; RANDOM FONCE
         JSR   CADGRLUF   ; LUDY CLAIR
         LDA   #$0001
         STA   GROUFLAG   ; DESIRE : LUDY
         STZ   fgRANDOM   ; RANDOM OFF
         LDA   CHANGFLG
         ORA   #$0002     ; DEMANDE UN CHANGEMENT DE DECOR
         STA   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECR0820  LDX   SECR2+1    ; PLANET
         LDA   #ECR0821
         STA   BUMPER5+1
         JMP   BUMPER
ECR0821  NOP
         JSR   ECR08PATCH ; PATCH BUMPER
         LDA   #CADGRPLF
         STA   ECR08DAT+16
         JSR   CADGRHAC   ; HAPPY FONCE
         JSR   CADGRLUC   ; LUDY FONCE
         JSR   CADGRXEC   ; XENO FONCE
         JSR   CADGRRAC   ; RANDOM FONCE
         JSR   CADGRPLF   ; PLANET CLAIR
         LDA   #$0002
         STA   GROUFLAG   ; DESIRE : PLANET
         STZ   fgRANDOM   ; RANDOM OFF
         LDA   CHANGFLG
         ORA   #$0002     ; DEMANDE UN CHANGEMENT DE DECOR
         STA   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECR0830  LDX   SECR2+1    ; XENO
         LDA   #ECR0831
         STA   BUMPER5+1
         JMP   BUMPER
ECR0831  NOP
         JSR   ECR08PATCH ; PATCH BUMPER
         LDA   #CADGRXEF
         STA   ECR08DAT+24
         JSR   CADGRHAC   ; HAPPY FONCE
         JSR   CADGRLUC   ; LUDY FONCE
         JSR   CADGRPLC   ; PLANET FONCE
         JSR   CADGRRAC   ; RANDOM FONCE
         JSR   CADGRXEF   ; XENO CLAIR
         LDA   #$0003
         STA   GROUFLAG   ; DESIRE : XENO
         STZ   fgRANDOM   ; RANDOM OFF
         LDA   CHANGFLG
         ORA   #$0002     ; DEMANDE UN CHANGEMENT DE DECOR
         STA   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECR0840  LDX   SECR2+1    ; RANDOM
         LDA   #ECR0841
         STA   BUMPER5+1
         JMP   BUMPER
ECR0841  NOP
         JSR   ECR08PATCH ; PATCH BUMPER
         LDA   #CADGRRAF
         STA   ECR08DAT+32
         JSR   CADGRHAC   ; HAPPY FONCE
         JSR   CADGRLUC   ; LUDY FONCE
         JSR   CADGRPLC   ; PLANET FONCE
         JSR   CADGRXEC   ; XENO FONCE
         JSR   CADGRRAF   ; RANDOM CLAIR
         LDA   #$0004
         STA   GROUFLAG
         LDA   #$0001     ; RAMDOM ON
         STA   fgRANDOM
         LDA   CHANGFLG
         AND   #$FFFD     ; INTERDIT UN CHANGEMENT DE DECOR
         STA   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECR0850  LDX   SECR2+1    ; OK
         LDA   #ECR0851
         STA   BUMPER5+1
         JMP   BUMPER
ECR0851  NOP
         JSR   CTPNCLNZ   ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

ECR08PATCH LDA #CADGRHAC  ; PATCH BUMPER
         STA   ECR08DAT
         LDA   #CADGRLUC
         STA   ECR08DAT+8
         LDA   #CADGRPLC
         STA   ECR08DAT+16
         LDA   #CADGRXEC
         STA   ECR08DAT+24
         LDA   #CADGRRAC
         STA   ECR08DAT+32
         RTS

GROUFLAG HEX   0400       ; 0:HAPPY,1:LUDY,2:PLANET,3:XENO,4:RANDOM
GROUCONV HEX   0300,0100,0400,0200
GROUECR  HEX   0000       ; NUMERO DE L'ECRAN PRECEDENT

****************  LEVEL

ECR0900  LDX   SECR2+1    ; <<
         LDA   #ECR0901
         STA   BUMPER5+1
         JMP   BUMPER
ECR0901  NOP
         JSR   NUMMOID    ; LEVEL - 10
         JSR   NUMVERIF   ; COHERENCE 1-120
         JSR   NUMAFFI    ; AFFICHAGE
         LDA   CHANGFLG
         ORA   #$0001     ; DEMANDE LE CHANGEMENT PIECES/FLECHES
         STA   CHANGFLG
         JMP   SOURIS1

ECR0910  LDX   SECR2+1    ; <
         LDA   #ECR0911
         STA   BUMPER5+1
         JMP   BUMPER
ECR0911  NOP
         JSR   NUMMOIU    ; LEVEL - 1
         JSR   NUMVERIF   ; COHERENCE 1-120
         JSR   NUMAFFI    ; AFFICHAGE
         LDA   CHANGFLG
         ORA   #$0001     ; DEMANDE LE CHANGEMENT PIECES/FLECHES
         STA   CHANGFLG
         JMP   SOURIS1

ECR0920  LDX   SECR2+1    ; >
         LDA   #ECR0921
         STA   BUMPER5+1
         JMP   BUMPER
ECR0921  NOP
         JSR   NUMPLUU    ; LEVEL + 1
         JSR   NUMVERIF   ; COHERENCE 1-120
         JSR   NUMAFFI    ; AFFICHAGE
         LDA   CHANGFLG
         ORA   #$0001     ; DEMANDE LE CHANGEMENT PIECES/FLECHES
         STA   CHANGFLG
         JMP   SOURIS1

ECR0930  LDX   SECR2+1    ; >>
         LDA   #ECR0931
         STA   BUMPER5+1
         JMP   BUMPER
ECR0931  NOP
         JSR   NUMPLUD    ; LEVEL + 10
         JSR   NUMVERIF   ; COHERENCE 1-120
         JSR   NUMAFFI    ; AFFICHAGE
         LDA   CHANGFLG
         ORA   #$0001     ; DEMANDE LE CHANGEMENT PIECES/FLECHES
         STA   CHANGFLG
         JMP   SOURIS1

ECR0940  LDX   SECR2+1    ; OK
         LDA   #ECR0941
         STA   BUMPER5+1
         JMP   BUMPER
ECR0941  NOP
         JSR   CTPNCLNZ   ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

*************** DOC

ECR1000  LDX   SECR2+1    ; <
         LDA   #ECR1001
         STA   BUMPER5+1
         JMP   BUMPER
ECR1001  NOP
         LDA   AFTIND
         BEQ   ECR1002
         DEC
         STA   AFTIND
         JSR   AFTPAG     ; AFICHAGE PAGE PRECEDENTE
ECR1002  JMP   SOURIS1

ECR1010  LDX   SECR2+1    ; >
         LDA   #ECR1011
         STA   BUMPER5+1
         JMP   BUMPER
ECR1011  NOP
         LDA   AFTIND
ECR1012  CMP   #$0007     ; NB DE PAGES MAXI
         BEQ   ECR1013
         INC
         STA   AFTIND
         JSR   AFTPAG     ; AFFICHAGE PAGE SUIVANTE
ECR1013  JMP   SOURIS1

ECR1020  LDX   SECR2+1    ; OK
         LDA   #ECR1021
         STA   BUMPER5+1
         JMP   BUMPER
ECR1021  NOP
         JSR   CTPNCLNZ   ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

DOCADR   HEX   0000       ; ADRESSE DU TEXTE DOCU (FRANCAIS/ANGLAIS)

*************  ABOUT

ECR1100  LDX   SECR2+1    ; <
         LDA   #ECR1101
         STA   BUMPER5+1
         JMP   BUMPER
ECR1101  NOP
         LDA   AFTIND
         BEQ   ECR1102
         DEC
         STA   AFTIND
         JSR   AFTPAG     ; AFICHAGE PAGE PRECEDENTE
ECR1102  JMP   SOURIS1

ECR1110  LDX   SECR2+1    ; >
         LDA   #ECR1111
         STA   BUMPER5+1
         JMP   BUMPER
ECR1111  NOP
         LDA   AFTIND
ECR1112  CMP   #$0005     ; NB DE PAGES MAXI
         BEQ   ECR1113
         INC
         STA   AFTIND
         JSR   AFTPAG     ; AFFICHAGE PAGE SUIVANTE
ECR1113  JMP   SOURIS1

ECR1120  LDX   SECR2+1    ; OK
         LDA   #ECR1121
         STA   BUMPER5+1
         JMP   BUMPER
ECR1121  NOP
         JSR   CTPNCLNZ   ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

ABOUADR  HEX   0000       ; ADRESSE DU TEXTE ABOUT (FRANCAIS/ANGLAIS)

************  QUIT

ECR1200  LDX   SECR2+1    ; QUIT
         LDA   #ECR1201
         STA   BUMPER5+1
         JMP   BUMPER
ECR1201  NOP
         JMP   keyEND     ; FIN

ECR1210  LDX   SECR2+1    ; OK
         LDA   #ECR1211
         STA   BUMPER5+1
         JMP   BUMPER
ECR1211  NOP
         JSR   CTPNCLNZ   ; ENLEVE LES BOUTONS
         LDA   #$0005
         JMP   PICT1

************ EASTER EGG HAPPY,LUDY,PLANET,XENO

ECR1300  LDX   SECR2+1    ; OK
         LDA   #ECR1301
         STA   BUMPER5+1
         JMP   BUMPER
ECR1301  NOP
         JSR   RESTAUR
         LDA   #$0001
         STA   noINTER    ; RETABLI LE TEMPS
         STZ   CTPNFLG    ; ON AUTORISE L'ENTREE DANS LE CTPN
         LDA   OLDECR
         STA   ECRAN
         JSR   SAUV
         JMP   SOURIS1

         asc   'Hey! I am looking for the WATCHMEN comics number 5 and 6',8d

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

ECR01TA1 HEX   01,01,01,01,01,01,01,01,01,01,01,01,00,00,00,00 ; FLECHES HAUT
         HEX   02,02,02,02,02,02,02,02,02,02,02,02,00,00,00,00
         HEX   03,03,03,03,03,03,03,03,03,03,03,03,00,00,00,00
         HEX   04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00
         HEX   05,05,05,05,05,05,05,05,05,05,05,05,00,00,00,00
         HEX   06,06,06,06,06,06,06,06,06,06,06,06,00,00,00,00
         HEX   07,07,07,07,07,07,07,07,07,07,07,07,00,00,00,00
         HEX   08,08,08,08,08,08,08,08,08,08,08,08,00,00,00,00
         HEX   09,09,09,09,09,09,09,09,09,09,09,09,00,00,00,00

ECR01TA2 HEX   12,12,12,12,12,12,12,12,12,12,12,12,00,00,00,00 ; FLECHES BAS
         HEX   13,13,13,13,13,13,13,13,13,13,13,13,00,00,00,00
         HEX   14,14,14,14,14,14,14,14,14,14,14,14,00,00,00,00
         HEX   15,15,15,15,15,15,15,15,15,15,15,15,00,00,00,00
         HEX   16,16,16,16,16,16,16,16,16,16,16,16,00,00,00,00
         HEX   17,17,17,17,17,17,17,17,17,17,17,17,00,00,00,00
         HEX   18,18,18,18,18,18,18,18,18,18,18,18,00,00,00,00
         HEX   19,19,19,19,19,19,19,19,19,19,19,19,00,00,00,00
         HEX   1A,1A,1A,1A,1A,1A,1A,1A,1A,1A,1A,1A,00,00,00,00

ECR01TA3 HEX   1B,1B,1B,1B,1B,1B,1B,1B,1B,1B,1B,1B,00,00 ; FLECHES GAUCHE
         HEX   1C,1C,1C,1C,1C,1C,1C,1C,1C,1C,1C,1C,00,00
         HEX   1D,1D,1D,1D,1D,1D,1D,1D,1D,1D,1D,1D,00,00
         HEX   1E,1E,1E,1E,1E,1E,1E,1E,1E,1E,1E,1E,00,00
         HEX   1F,1F,1F,1F,1F,1F,1F,1F,1F,1F,1F,1F,00,00
         HEX   20,20,20,20,20,20,20,20,20,20,20,20,00,00
         HEX   21,21,21,21,21,21,21,21,21,21,21,21,00,00
         HEX   22,22,22,22,22,22,22,22,22,22,22,22,00,00
         HEX   23,23,23,23,23,23,23,23,23,23,23,23,00,00

ECR01TA4 HEX   09,09,09,09,09,09,09,09,09,09,09,09,00,00 ; FLECHES DROITE
         HEX   0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,00,00
         HEX   0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,00,00
         HEX   0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,00,00
         HEX   0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,00,00
         HEX   0E,0E,0E,0E,0E,0E,0E,0E,0E,0E,0E,0E,00,00
         HEX   0F,0F,0F,0F,0F,0F,0F,0F,0F,0F,0F,0F,00,00
         HEX   10,10,10,10,10,10,10,10,10,10,10,10,00,00
         HEX   11,11,11,11,11,11,11,11,11,11,11,11,00,00

         HEX   0500       ; HAPPY     NB DE BOUTONS DANS ECRAN1
ECR01TAB HEX   1600,A100,1B00,2300  ; HAUT    TABLEAU DES BOUTONS POUR ECRAN1
         HEX   1600,A100,A500,AD00  ; BAS     X0,X1 Y0,Y1
         HEX   0A00,1100,2600,A200  ; GAUCHE
         HEX   A700,AE00,2600,A200  ; DROITE
         HEX   E900,ED00,2500,2800  ; EASTER EGGS

         HEX   0500       ; LUDY
ECR02TAB HEX   1600,A100,1B00,2300  ; HAUT
         HEX   1600,A100,A500,AD00  ; BAS
         HEX   0A00,1100,2600,A200  ; GAUCHE
         HEX   A700,AE00,2600,A200  ; DROITE
         HEX   1D01,2301,2E00,3300  ; EASTER EGGS

         HEX   0500       ; PLANET
ECR03TAB HEX   1600,A100,1B00,2300  ; HAUT
         HEX   1600,A100,A500,AD00  ; BAS
         HEX   0A00,1100,2600,A200  ; GAUCHE
         HEX   A700,AE00,2600,A200  ; DROITE
         HEX   0D01,1101,6300,6700  ; EASTER EGGS

         HEX   0500       ; XENO
ECR04TAB HEX   1600,A100,1B00,2300  ; HAUT
         HEX   1600,A100,A500,AD00  ; BAS
         HEX   0A00,1100,2600,A200  ; GAUCHE
         HEX   A700,AE00,2600,A200  ; DROITE
         HEX   0801,0E01,1900,1E00  ; EASTER EGGS

ECR01DAT HEX   0000,0000,0000,0000  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE

         HEX   0800       ; CONTROL PANEL
ECR05TAB HEX   1800,5700,2500,3500 ; GAME
         HEX   1800,5700,3800,4800 ; MUSIC
         HEX   1800,5700,4B00,5B00 ; GROUND
         HEX   1800,5700,5E00,6E00 ; LEVEL
         HEX   1800,5700,7100,8100 ; DOC
         HEX   1800,5700,8400,9400 ; ABOUT
         HEX   1800,5700,9700,A700 ; QUIT
         HEX   8800,B800,AD00,BD00 ; OK

ECR05DAT DA    CADGAMC,CADGAMF,CADGAMC,CADGAMF
         DA    CADMUSC,CADMUSF,CADMUSC,CADMUSF
         DA    CADGROC,CADGROF,CADGROC,CADGROF
         DA    CADLEVC,CADLEVF,CADLEVC,CADLEVF
         DA    CADDOCC,CADDOCF,CADDOCC,CADDOCF
         DA    CADABOC,CADABOF,CADABOC,CADABOF
         DA    CADQUIC,CADQUIF,CADQUIC,CADQUIF
         DA    CADOKC,CADOKF,CADOKC,CADOKF

         HEX   0300       ; LOAD/SAVE GAME
ECR06TAB HEX   BC00,1301,4B00,5B00 ; LOAD
         HEX   BC00,1301,5E00,6E00 ; SAVE
         HEX   D000,FF00,7B00,8B00 ; OK

ECR06DAT DA    CADGLOC,CADGLOF,CADGLOC,CADGLOF
         DA    CADGSAC,CADGSAF,CADGSAC,CADGSAF
         DA    CADGOKC,CADGOKF,CADGOKC,CADGOKF

         HEX   0300       ; MUSIC
ECR07TAB HEX   C800,0701,4B00,5B00 ; MUSIC  X0,X1,Y0,Y1
         HEX   C800,0701,5E00,6E00 ; SOUND
         HEX   D000,FF00,7B00,8B00 ; OK

ECR07DAT DA    CADMMUC,CADMMUF,CADMMUC,CADMMUF
         DA    CADMSNC,CADMSNF,CADMSNC,CADMSNF
         DA    CADMOKC,CADMOKF,CADMOKC,CADMOKF

         HEX   0600       ; GROUND
ECR08TAB HEX   A200,E700,4100,5100 ; HAPPY
         HEX   EC00,3101,4100,5100 ; LUDY
         HEX   A200,E700,5400,6400 ; PLANET
         HEX   EC00,3101,5400,6400 ; XENO
         HEX   C800,0B01,6C00,7C00 ; RANDOM
         HEX   D200,0101,8900,9900 ; OK

ECR08DAT DA    CADGRHAC,CADGRHAF,CADGRHAC,CADGRHAF
         DA    CADGRLUC,CADGRLUF,CADGRLUC,CADGRLUF
         DA    CADGRPLC,CADGRPLF,CADGRPLC,CADGRPLF
         DA    CADGRXEC,CADGRXEF,CADGRXEC,CADGRXEF
         DA    CADGRRAC,CADGRRAF,CADGRRAC,CADGRRAF
         DA    CADGROKC,CADGROKF,CADGROKC,CADGROKF

         HEX   0500       ; LEVEL
ECR09TAB HEX   B400,CB00,6800,7700 ; MOINS 10
         HEX   CE00,E500,6800,7700 ; MOINS 1
         HEX   E000,0101,6800,7700 ; PLUS 1
         HEX   0401,1B01,6800,7700 ; PLUS 10
         HEX   D000,FF00,8400,9400 ; OK

ECR09DAT DA    CADLMDC,CADLMDF,CADLMDC,CADLMDF
         DA    CADLMUC,CADLMUF,CADLMUC,CADLMUF
         DA    CADLPUC,CADLPUF,CADLPUC,CADLPUF
         DA    CADLPDC,CADLPDF,CADLPDC,CADLPDF
         DA    CADLOKC,CADLOKF,CADLOKC,CADLOKF

         HEX   0300       ; DOC
ECR10TAB HEX   9600,AD00,9900,A800 ; MOINS UNE
         HEX   E600,FD00,9900,A800 ; PLUS UNE
         HEX   B200,E100,9900,A900 ; OK

ECR10DAT DA    CADDMUC,CADDMUF,CADDMUC,CADDMUF
         DA    CADDPUC,CADDPUF,CADDPUC,CADDPUF
         DA    CADDOKC,CADDOKF,CADDOKC,CADDOKF

         HEX   0300       ; ABOUT
ECR11TAB HEX   9600,AD00,9900,A800 ; MOINS UNE
         HEX   E600,FD00,9900,A800 ; PLUS UNE
         HEX   B200,E100,9900,A900 ; OK

ECR11DAT DA    CADDMUC,CADDMUF,CADDMUC,CADDMUF
         DA    CADDPUC,CADDPUF,CADDPUC,CADDPUF
         DA    CADDOKC,CADDOKF,CADDOKC,CADDOKF

         HEX   0200       ; QUIT
ECR12TAB HEX   BC00,1101,5600,6600 ; QUIT
         HEX   CE00,FD00,7D00,8D00 ; OK

ECR12DAT DA    CADQQUC,CADQQUF,CADQQUC,CADQQUF
         DA    CADQOKC,CADQOKF,CADQOKC,CADQOKF

         HEX   0100       ; EASTER EGGS
ECR13TAB HEX   8800,B800,AD00,BD00 ; OK

ECR13DAT DA    CADOKC,CADOKF,CADOKC,CADOKF

****************

ECRTAB   DA    ECR01TAB,ECR02TAB,ECR03TAB,ECR04TAB  ; ADRESSES DES TABLEAUX
         DA    ECR05TAB,ECR06TAB,ECR07TAB,ECR08TAB
         DA    ECR09TAB,ECR10TAB,ECR11TAB,ECR12TAB
         DA    ECR13TAB

ECRDAT   DA    ECR01DAT,ECR01DAT,ECR01DAT,ECR01DAT  ; ADRESSE DES DONNEES BUMPERS
         DA    ECR05DAT,ECR06DAT,ECR07DAT,ECR08DAT
         DA    ECR09DAT,ECR10DAT,ECR11DAT,ECR12DAT
         DA    ECR13DAT

ECRDESA  DA    ECRDES1,ECRDES2,ECRDES3,ECRDES4 ; ADRESSE POUR LES DESTINATIONS
         DA    ECRDES5,ECRDES6,ECRDES7,ECRDES8
         DA    ECRDES9,ECRDES10,ECRDES11,ECRDES12
         DA    ECRDES13

****

ECRDES1  DA    ECRJEH1,ECRJEB1,ECRJEG1,ECRJED1,ECREEHA ; ECRAN JEU : HAPPY

ECRDES2  DA    ECRJEH1,ECRJEB1,ECRJEG1,ECRJED1,ECREELU ; ECRAN JEU : LUDY

ECRDES3  DA    ECRJEH1,ECRJEB1,ECRJEG1,ECRJED1,ECREEPL ; ECRAN JEU : PLANET

ECRDES4  DA    ECRJEH1,ECRJEB1,ECRJEG1,ECRJED1,ECREEXE ; ECRAN JEU : XENO

ECRDES5  DA    ECR0500,ECR0510,ECR0520,ECR0530,ECR0540 ; CONTROL PANEL
         DA    ECR0550,ECR0560,ECR0570

ECRDES6  DA    ECR0600,ECR0610,ECR0620 ; LOAD/SAVE

ECRDES7  DA    ECR0700,ECR0710,ECR0720 ; MUSIC

ECRDES8  DA    ECR0800,ECR0810,ECR0820,ECR0830,ECR0840 ; GROUND
         DA    ECR0850

ECRDES9  DA    ECR0900,ECR0910,ECR0920,ECR0930,ECR0940 ; LEVEL

ECRDES10 DA    ECR1000,ECR1010,ECR1020 ; DOC

ECRDES11 DA    ECR1100,ECR1110,ECR1120 ; ABOUT

ECRDES12 DA    ECR1200,ECR1210 ; QUIT

ECRDES13 DA    ECR1300    ; EASTER EGGS

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
ECRAN    HEX   0100       ; ECRAN 1,2,3...
OLDECR   HEX   0000       ; ECRAN PRECEDENT
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

         asc   'There are two ways to get rich:',8d
         asc   '- To be very strong',8d
         asc   '- To take advantage of people',8d
         asc   'Isn t it, Gaumu?',8d

********************

SEXIT    LDY   #$FFFF
         RTS

SLECT    LDAL  $00C026    ; $C027   LECTURE SOURIS
         BPL   SEXIT
         AND   #$0200
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
DESS4    STAL  $E12000,X
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
SAUV1    LDAL  $E12000,X
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
TRACE6   LDA   A1         ; DESSINE LE POINTEUR POSITION PAIRE
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
TRACE1   LDAL  $E12000,X
TRACE2   AND   $A0A0,Y    ; ET AVEC LE MASQUE
TRACE3   ORA   $A0A0,Y    ; OU AVEC LE MOTIF
TRACE4   STAL  $E12000,X
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
         CMP   #$0005
         BPL   AFFSPR0
         STZ   AFFSPRF
         RTS              ; BOUTON DE JEUX : PAS DE POSITIONS RELEVES/ENFONCES
AFFSPR0  DEC
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
         LDA\  $0000,X    ; ADRESSE RELEVE C
         STA   AFFSPR3+1
         LDA\  $0002,X    ; ADRESSE ENFONCE F
         STA   AFFSPR2+1
         LDA   AFFSPRF    ; FLAG DE AFFSPR
         BNE   AFFSPR3    ; ON DESSINE LE SPRITE RELEVE
AFFSPR2  JSR   $A0A0
         STZ   AFFSPRF
         RTS
AFFSPR3  JSR   $A0A0
         STZ   AFFSPRF
         RTS
AFFSPRF  HEX   0000       ; FLAG RELEVE/ENFONCE

********************  TRAITEMENT ET AFFICHAGE ECRANS  *********************

PICT1    LDX   ECRAN      ; PASSAGE ECRAN SANS CHANGEMENT DE FOND
         STX   OLDECR
         STA   ECRAN
         JSR   SAUV
         JMP   PICT21

PICT     PHA
         JSR   DESS1      ; ENLEVE LE POINTEUR
         PLA
         LDX   ECRAN
         STX   OLDECR
         STA   ECRAN

PICT21   JSR   CLNFLG     ; LES FLAGS DE BUMPER A ZERO
         STZ   BMPFLG     ; LES FLAGS A ZERO
         LDA   ECRAN      ; AFFICHAGES LIE A CHAQUE ECRAN
         DEC
         ASL
         TAX
         LDA   ECRANTAB,X
         STA   PICT20+1
PICT20   JMP   $FFFF      ; ON VA SUR LA ROUTINE CORRESPONDANTE

ECRANTAB DA    ECRJEU1,ECRJEU2,ECRJEU3,ECRJEU4,ECRCTPN  ; NOM DES ECRANS POUR INIT D'AFFICHAGE
         DA    ECRGAME,ECRMUSI,ECRGROU,ECRLEVE,ECRDOCU
         DA    ECRABOU,ECRQUIT,ECREAEG

CLNFLG   LDX   #$0062     ; ON MET TOUS LES FLAG DE BUMPER A 0
         LDA   #$0000
CLNFLG1  STA   FLAGTAB,X
         DEX
         DEX
         BPL   CLNFLG1
         RTS

CHANGFLG HEX   0000       ; 0 SI PAS DE CHANGEMENT D'ECRAN QUAND ON REVIENT DU CTPN
                          ; 1 SI CHANGEMENT PIECES/FLECHES
                          ; 2 SI CHANGEMENT DECOR
                          ; 3 SI CHANGEMENT TOTAL : PIECES/FLECHES et DECOR

***********  TRAITEMENT INITIAL A L'AFFICHAGE D'UN ECRAN

ECRJEU1  LDA   CHANGFLG   ; ECRAN DE JEU HAPPYLAND
         BEQ   ECRJEU10
         LDA   #$0001     ; MODIFICATION ?
         JSR   CHANGSOM
ECRJEU10 STZ   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECRJEU2  LDA   CHANGFLG   ; ECRAN DE JEU LUDYLAND
         BEQ   ECRJEU20
         LDA   #$0002     ; MODIFICATION ?
         JSR   CHANGSOM
ECRJEU20 STZ   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECRJEU3  LDA   CHANGFLG   ; ECRAN DE JEU PLANETLAST
         BEQ   ECRJEU30
         LDA   #$0003     ; MODIFICATION ?
         JSR   CHANGSOM
ECRJEU30 STZ   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

ECRJEU4  LDA   CHANGFLG   ; ECRAN DE JEU XENOLAST
         BEQ   ECRJEU40
         LDA   #$0004     ; MODIFICATION ?
         JSR   CHANGSOM
ECRJEU40 STZ   CHANGFLG
         JSR   SAUV
         JMP   SOURIS1

CHANGSOM LDX   GROUFLAG   ; AIGUILLAGE VERS UN CHANGEMENT PIECES ET/OU DECOR
         CPX   #$0004
         BEQ   CHANGSO4   ; PAS BESOIN DE CHANGER LE DECOR
         DEC
         CMP   GROUFLAG
         BEQ   CHANGSO4   ; PAS BESOIN DE CHANGER LE DECOR
         LDA   CHANGFLG
         CMP   #$0001     ; BESOIN DE CHANGER LES PIECES ?
         BEQ   CHANGSO1
         CMP   #$0002     ; BESOIN DE CHANGER LE DECOR
         BEQ   CHANGSO2
         BRA   CHANGSO3   ; BESOIN DE CHANGER LES DEUX
CHANGSO4 LDA   CHANGFLG   ; ON N'A PAS BESOIN DE MODIFIER LE DECOR
         AND   #$0001
         BNE   CHANGSO1
         STZ   CHANGFLG
         RTS              ; AUCUNE MODIF
CHANGSO1 PLX              ; MODIFICATION PIECES/FLECHES
         STZ   CHANGFLG
         LDA   ECRAN      ; NOUVEL ECRAN SOUHAITE
         DEC
         ASL
         TAX
         LDA   GROUCONV,X
         STA   CurDecor
         lda   vivaTOINET
         bne   laRUSE
         LDA   NUMHEX
         STA   Niveau
         stz   ldFlag
         bra   ahlala
laRUSE   stz   vivaTOINET
         lda   #1
         sta   ldFlag
ahlala   jsr   fadeOUT
         JMP   FIRST
CHANGSO2 PLX              ; MODIFICATION DECOR
         STZ   CHANGFLG
         LDA   GROUFLAG   ; NOUVEL ECRAN SOUHAITE
         ASL
         TAX
         LDA   GROUCONV,X
         STA   CurDecor
         LDA   GROUFLAG
         INC
         STA   ECRAN
         JSR   setDecor
         LDA   #$0001
         STA   ldFlag
         JSR   fadeOUT
         JMP   FIRST
CHANGSO3 PLX              ; MODIFICATION TOTALE
         STZ   CHANGFLG
         LDA   NUMHEX
         STA   Niveau
         LDA   GROUFLAG   ; NOUVEL ECRAN SOUHAITE
         ASL
         TAX
         LDA   GROUCONV,X
         STA   CurDecor
         LDA   GROUFLAG
         INC
         STA   ECRAN
         jsr   setDecor
         jsr   fadeOUT
         stz   ldFlag
         JMP   FIRST

ECRCTPN  LDA   CTPNFLG
         BNE   ECRCTPN1
         LDA   OLDECR
         STA   GROUECR    ; ON CONSERVE LE NUMERO DE L'ECRAN PRECEDENT L'ENTREE
         STZ   noINTER    ; ARRETE LE TEMPS
         STZ   CHANGFLG   ; AUCUN CHANGEMENT PREVU AU RETOUR
         JSR   CADRE      ; CREATION CADRE PAGE
         JSR   CADCTPN    ; CREATION CONTROL PANEL
         INC   CTPNFLG
ECRCTPN1 JSR   CTPNCLNZ   ; NETTOYAGE ZONE BOUTONS AUXILIAIRES
         JSR   SAUV
         JMP   SOURIS1
CTPNFLG  HEX   0000

ECRGAME  JSR   CADGAME    ; CREATION DE L'ECRAN
         JSR   SAUV
         JMP   SOURIS1

ECRMUSI  JSR   CADMUSI    ; CREATION DE L'ECRAN
         JSR   SAUV
         JMP   SOURIS1

ECRGROU  JSR   CADGROU    ; CREATION DE L'ECRAN
         JSR   SAUV
         JMP   SOURIS1

ECRLEVE  JSR   CADLEVE    ; CREATION DE L'ECRAN
         JSR   NUMVNOC    ; CONVERSION NIVEAU EN COURS
         JSR   NUMAFFI    ; AFFICHAGE NIVEAU
         JSR   SAUV
         JMP   SOURIS1

ECRDOCU  JSR   CADDOCU    ; CREATION DE L'ECRAN
         LDA   DOCADR
         STA   AFTLIG1+1
         JSR   AFTPAG     ; AFFICHE 1 PAGE DE TEXTE
         JSR   SAUV
         JMP   SOURIS1

ECRABOU  JSR   CADABOU    ; CREATION DE L'ECRAN
         LDA   ABOUADR
         STA   AFTLIG1+1
         JSR   AFTPAG     ; AFFICHE 1 PAGE DE TEXTE
         JSR   SAUV
         JMP   SOURIS1

ECRQUIT  JSR   CADQUIT    ; CREATION DE L'ECRAN
         JSR   SAUV
         JMP   SOURIS1

ECREAEG  JSR   SAUV       ; EASTER EGGS (ECRAN DEJA CONSTRUIT)
         JMP   SOURIS1

         asc   'Coming soon to a screen near you: Cogito for the TurboRez',8d
         asc   'The colorful version of the legendary game',8d

*********************************************************************

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

AFTADR   DA    AFTA,AFTB,AFTC,AFTD,AFTE,AFTF,AFTG,AFTH,AFTI,AFTJ,AFTK,AFTL,AFTM,AFTN  ; 0-13
         DA    AFTO,AFTP,AFTQ,AFTR,AFTS,AFTT,AFTU,AFTV,AFTW,AFTX,AFTY,AFTZ,AFT0  ; 14-26
         DA    AFT1,AFT2,AFT3,AFT4,AFT5,AFT6,AFT7,AFT8,AFT9,AFTPL,AFTMOI,AFTET,AFTSL,AFTEG ; 27-40
         DA    AFTSO,AFTPE,AFTPI,AFTSU,AFTIN,AFTPO,AFTPF,AFTDP,AFTPT,AFTVI,AFTRO ; 41-51
         DA    AFTGU,AFTAP,AFTPV,AFTDI,AFTDO,AFTAC,AFTPC,AFTSP ; 52-59
         DA    AFTA,AFTB,AFTC,AFTD,AFTE,AFTF,AFTG,AFTH,AFTI,AFTJ,AFTK,AFTL,AFTM,AFTN ; 60-73
         DA    AFTO,AFTP,AFTQ,AFTR,AFTS,AFTT,AFTU,AFTV,AFTW,AFTX,AFTY,AFTZ ; 74-85
         DA    AFTRD

AFTTBL   HEX   C1C2C3C4C5C6C7C8C9CACBCCCDCECFD0D1D2D3D4D5D6D7D8D9DA ; A-Z
         HEX   B0,B1,B2,B3,B4,B5,B6,B7,B8,B9 ; 0-9
         HEX   AB,AD,AA,AF,BD,DF,A1,BF,BE,BC,A8,A9,BA,AE,AC ; +-*/=_!?><():.,
         HEX   DB,A2,A7,BB,A3,A4,DE,A5,A0 ; o"';#$^%SPC
         HEX   E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0F1F2F3F4F5F6F7F8F9FA ; a-z

****************************  AFFICHAGE TEXT  **********************************

******** AFFICHE PAGE ************

AFTPAG   JSR   AFTNE      ; NETTOY
         LDA   #$0000
AFTPAG1  JSR   AFTLIG     ; AFFICHE 16 LIGNES
         INC
         CMP   #$0010
         BNE   AFTPAG1
         RTS

******** AFFICHE LIGNE ************

AFTLIG   PHA              ; RECOIT DANS A LE NUMERO DE LA LIGNE
         ASL
         TAX
         LDA   AFTTADLI,X
         STA   AFTAE      ; OFFSET ADRESSE ECRAN DEBUT LIGNE
         LDA   AFTTABM,X
         STA   AFTLIG0+1  ; OFFSET DU CARACTERE DANS SA PAGE

         LDA   AFTIND
         ASL
         TAX
         LDA   AFTTADPT,X ; OFFSET DE LA PAGE DANS LE TEXTE
         CLC
AFTLIG0  ADC   #$AAAA
         TAY              ; OFFSET DU CARACTERE DANS LE TEXTE
AFTLIG1  LDA   TEXTEFRD,Y
         AND   #$00FF
         CMP   #$008D
         BEQ   AFTLIG5    ; FIN DE LIGNE DETECTE
         STA   AFTLIG3+1

         LDX   #$0000
AFTLIG2  LDA   AFTTBL,X
         AND   #$00FF
AFTLIG3  CMP   #$AAAA
         BEQ   AFTLIG4    ; CARACTERE TROUVE
         INX
         CPX   #$0062
         BNE   AFTLIG2
         LDX   #$0056     ; PAS TROUVE : ON MET UN BLANC
AFTLIG4  JSR   AFTCAR     ; AFFICHE CARACTERE
         LDA   AFTAE      ; ADRESSE ECRAN CARACTERE SUIVANT
         CLC
         ADC   #$0003
         STA   AFTAE
         INY
         BRA   AFTLIG1
AFTLIG5  PLA
         RTS

******** AFFICHE CARACTERE ********

AFTCAR   PHY              ; RECOIT DANS X L'INDICE DU CARACTERE
         TXA
         ASL
         TAX
         LDA   AFTADR,X
         STA   AFTCAR1+1
         CLC
         ADC   #$000A
         STA   AFTCAR3+1
         LDX   AFTAE      ; 1 ere COLONNE
         LDY   #$0000     ;
AFTCAR2  LDAL  $E12000,X
AFTCAR1  ORA   $AAAA,Y
         STAL  $E12000,X
         TXA
         CLC
         ADC   #$00A0
         TAX              ; LIGNE SUIVANTE
         INY
         INY
         CPY   #$000A
         BNE   AFTCAR2
         LDX   AFTAE      ; 2 eme COLONNE
         INX
         INX
         LDY   #$0000
AFTCAR4  LDAL  $E12000,X
AFTCAR3  ORA   $AAAA,Y
         STAL  $E12000,X
         TXA
         CLC
         ADC   #$00A0
         TAX              ; LIGNE SUIVANTE
         INY
         INY
         CPY   #$000A
         BNE   AFTCAR4
         PLY
         RTS

*******  NETTOYAGE ********

AFTNE    LDA   #$0064     ; NETTOYAGE DE LA ZONE D'AFFICHAGE
         STA   CADRX0
         LDA   #$0031
         STA   CADRY0
         LDA   #$012C
         STA   CADRX1
         LDA   #$0091
         STA   CADRY1
         JSR   CARETAB
         RTS

***************  TABLES, VARIABLES ET FLAGS  ******************

AFTAE    HEX   0000       ; ADRESSE ECRAN ECRITURE
AFTIND   HEX   0000       ; INDEX PAGES

AFTTADPT HEX   0000,2002,4004,6006,8008,A00A,C00C,E00E,0011,2013
         HEX   4015,6017,8019,A01B,C01D,E01F,0022,2024,4026,6028

AFTTADLI HEX   731F,3323,F326,B32A,732E,3332,F335,B339,733D,3341,F344,B348,734C,3350,F353,B357

AFTTABM  HEX   0000,2200,4400,6600,8800,AA00,CC00,EE00,1001,3201,5401,7601,9801,BA01,DC01,FE01

****************..  TEXTE  ......................*****************

TEXTEFRD ASC   "                                 ",8D
         ASC   "      DOCUMENTATION COGITO       ",8D
         ASC   "                                 ",8D
         ASC   "    (C) 1992  ATREID CONCEPT.    ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "CONCEPTION     : JEROME CRETAUX  ",8D
         ASC   "                                 ",8D
         ASC   "GRAPHISMES     : O. BAILLY-MAITRE",8D
         ASC   "                                 ",8D
         ASC   "MUSIQUE        : FREDERIC MOTTE  ",8D
         ASC   "                                 ",8D
         ASC   "EFFETS SONORES : O. BAILLY-MAITRE",8D
         ASC   "                                 ",8D
         ASC   "DOCUMENTATION  : T.P. HIBIKI     ",8D
         ASC   "                                 ",8D

         ASC   "                                 ",8D
         ASC   "  PRINCIPE DU JEU                ",8D
         ASC   "  ---------------                ",8D
         ASC   "                                 ",8D
         ASC   "     LE  BUT   DU   JEU   EST  DE",8D
         ASC   "RECONSTITUER UNE  FIGURE MELANGEE",8D
         ASC   "PAR  L'ORDINATEUR.  UTILISEZ  LES",8D
         ASC   "FLECHES DE CONTROLE POUR DEPLACER",8D
         ASC   "LES LIGNES OU LES COLONNES.      ",8D
         ASC   "                                 ",8D
         ASC   "     MAIS  ATTENTION,  PLUS  VOUS",8D
         ASC   "MONTEZ  EN NIVEAU,  PLUS  LE MODE",8D
         ASC   "DE DEPLACEMENT  DES LIGNES ET DES",8D
         ASC   "COLONNES  DEVIENT  COMPLEXE,  ET,",8D
         ASC   "BIEN  ENTENDU, PLUS LA  FIGURE  A",8D
         ASC   "RECONSTITUER  EST  SOPHISTIQUEE. ",8D

         ASC   "                                 ",8D
         ASC   "     DANS COGITO, LE TEMPS  N'EST",8D
         ASC   "PAS LIMITE MAIS  IL  EST  COMPTE.",8D
         ASC   "VOTRE  ENJEU   EST  DONC   DE  LE",8D
         ASC   "REDUIRE AU MINIMUM. IL FAUT NOTER",8D
         ASC   "QUE LE  CHRONOMETRE  NE  S'ARRETE",8D
         ASC   "PAS   SI  VOUS   ENTREZ  DANS  LE",8D
         ASC   "CONTROL PANEL DU  GS  PENDANT  LE",8D
         ASC   "JEU.                             ",8D
         ASC   "                                 ",8D
         ASC   "     CE    JEU    N'ETANT    PAS ",8D
         ASC   "FONDAMENTALEMENT    UNE    COURSE",8D
         ASC   "CONTRE   LA   MONTRE,   IL   EST ",8D
         ASC   "IMPORTANT QUE VOUS  PRENIEZ VOTRE",8D
         ASC   "TEMPS  LA PREMIERE FOIS  QUE VOUS",8D
         ASC   "DECOUVREZ   UN   TABLEAU   POUR  ",8D

         ASC   "                                 ",8D
         ASC   "ANALYSER  FINEMENT  LES  ACTIONS ",8D
         ASC   "DE TOUTES LES FLECHES.           ",8D
         ASC   "                                 ",8D
         ASC   "     UNE  FOIS  QUE  VOUS  AUREZ ",8D
         ASC   "TERMINE   UN   TABLEAU   POUR  LA",8D
         ASC   "PREMIERE     FOIS,     ESSAYEZ   ",8D
         ASC   "D'AMELIORER   VOTRE   SCORE   EN ",8D
         ASC   "REDUISANT  AUSSI  BIEN  LE  TEMPS",8D
         ASC   "ECOULE  QUE  LE  NOMBRE  DE COUPS",8D
         ASC   "UTILISES.                        ",8D
         ASC   "                                 ",8D
         ASC   "     LE JEU COMPORTE 120 NIVEAUX ",8D
         ASC   "DE DIFFICULTE CROISSANTE.        ",8D
         ASC   "                                 ",8D
         ASC   "          BON COURAGE !          ",8D

         ASC   "                                 ",8D
         ASC   "  LE MENU DE CONFIGURATION       ",8D
         ASC   "  ------------------------       ",8D
         ASC   "                                 ",8D
         ASC   "     L'ACCES  AU  MENU  DEPUIS LE",8D
         ASC   "JEU  S'EFFECTUE   SIMPLEMENT   EN",8D
         ASC   "APPUYANT   SUR   UNE   TOUCHE  DU",8D
         ASC   "CLAVIER.                         ",8D
         ASC   "                                 ",8D
         ASC   "  * GAME :  SI   VOUS   VOULEZ   ",8D
         ASC   "INTERROMPRE UN JEU EN COURS POUR ",8D
         ASC   "LE REPRENDRE PLUS TARD,  IL  VOUS",8D
         ASC   "SUFFIT   D'ENREGISTRER   LE   JEU",8D
         ASC   "EN  UTILISANT  L'OPTION  'SAVE'. ",8D
         ASC   "VOUS  POURREZ  LE  REPRENDRE DANS",8D
         ASC   "L'ETAT OU IL  ETAIT  AVEC 'LOAD'.",8D

         ASC   "  * MUSIC :  VOUS POUVEZ  ACTIVER",8D
         ASC   "OU DESACTIVER LA MUSIQUE DE FOND.",8D
         ASC   "SI  LA MUSIQUE  EST  DESACTIVEE, ",8D
         ASC   "VOUS  AUREZ  DROIT  A  UN  SON  A",8D
         ASC   "CHAQUE DEPLACEMENT D'UNE LIGNE OU",8D
         ASC   "D'UNE COLONNE.                   ",8D
         ASC   "     SI TOUTEFOIS  VOUS NE VOULEZ",8D
         ASC   "AUCUN  BRUIT,  L'ACCES AU CONTROL",8D
         ASC   "PANEL DU  GS RESTE  POSSIBLE POUR",8D
         ASC   "METTRE  A  ZERO  LE VOLUME SONORE",8D
         ASC   "DU GS.                           ",8D
         ASC   "     IL    FAUT    NOTER    QUE  ",8D
         ASC   "L'ACTIVATION OU NON DE LA MUSIQUE",8D
         ASC   "N'A  AUCUNE  INFLUENCE  SUR  LE  ",8D
         ASC   "CHRONOMETRE  DU  JEU.            ",8D
         ASC   "                                 ",8D

         ASC   "  * GROUND : CETTE OPTION  PERMET",8D
         ASC   "DE  CHANGER  DE  DECOR  DE  FOND.",8D
         ASC   "VOUS  AVEZ  LA  POSSIBILITE  DE  ",8D
         ASC   "CHOISIR  UN  DES  QUATRE  DECORS ",8D
         ASC   "(HAPPY, LUDY, PLANET OU XENO)  OU",8D
         ASC   "DE  LAISSER  L'ORDINATEUR CHOISIR",8D
         ASC   "ALEATOIREMENT  UN  DECOR  DE FOND",8D
         ASC   "POUR CHAQUE TABLEAU.             ",8D
         ASC   "     LE  CHOIX  DU  DECOR DE FOND",8D
         ASC   "N'A AUCUNE INCIDENCE   SUR   LA  ",8D
         ASC   "DIFFICULTE  DU  TABLEAU.         ",8D
         ASC   "                                 ",8D
         ASC   "  * LEVEL : DANS   LES   VERSIONS",8D
         ASC   "COMMERCIALES  DU JEU (MAC ET PC),",8D
         ASC   "UN CODE  PERMETTAIT D'ACCEDER AUX",8D
         ASC   "DIFFERENTS  NIVEAUX DU JEU.  DANS",8D

         ASC   "LA VERSION GS, NOUS AVONS DECIDE ",8D
         ASC   "DE VOUS LAISSER ACCEDER LIBREMENT",8D
         ASC   "A N'IMPORTE QUEL NIVEAU.         ",8D
         ASC   "     VOUS POUVEZ DONC CHOISIR  LE",8D
         ASC   "NIVEAU EN INDIQUANT SON NUMERO.  ",8D
         ASC   "                                 ",8D
         ASC   "  * DOC : VOUS Y ETES !!! TOUT CE",8D
         ASC   "QUE VOUS AVEZ  BESOIN  DE  SAVOIR",8D
         ASC   "POUR UTILISER  CE  LOGICIEL DE LA",8D
         ASC   "MEILLEURE FACON.                 ",8D
         ASC   "                                 ",8D
         ASC   "  * ABOUT : INFORMATIONS DIVERSES",8D
         ASC   "SUR   LES   PROGRAMMEURS   DE  LA",8D
         ASC   "VERSION APPLE //GS DU JEU.       ",8D
         ASC   "                                 ",8D
         ASC   "  * QUIT : QUITTER LE LOGICIEL.  ",8D


TEXTEUSD ASC   "                                 ",8D
         ASC   "      COGITO DOCUMENTATION       ",8D
         ASC   "                                 ",8D
         ASC   "    (C) 1992  ATREID CONCEPT.    ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "CONCEPT        : JEROME CRETAUX  ",8D
         ASC   "                                 ",8D
         ASC   "GRAPHICS       : O. BAILLY-MAITRE",8D
         ASC   "                                 ",8D
         ASC   "MUSIC          : FREDERIC MOTTE  ",8D
         ASC   "                                 ",8D
         ASC   "SOUND EFFECTS  : O. BAILLY-MAITRE",8D
         ASC   "                                 ",8D
         ASC   "DOCUMENTATION  : T.P. HIBIKI     ",8D
         ASC   "                                 ",8D

         ASC   "                                 ",8D
         ASC   "  INTRODUCTION                   ",8D
         ASC   "  ------------                   ",8D
         ASC   "                                 ",8D
         ASC   "     A  FURIOUS  CLICKING  SOUND ",8D
         ASC   "THAT  DOES  NOT  QUITE  DROWN OUT",8D
         ASC   "SOFT ENCHANTING MUSIC. PEARL-LIKE",8D
         ASC   "BALLS SMASH INTO EACH OTHER WITH ",8D
         ASC   "UNBELIEVABLE SPEED.              ",8D
         ASC   "AND  YET,  ALREADY,  IT  IS  CALM",8D
         ASC   "AGAIN.  ALONE  AGAINST  AN  EVER ",8D
         ASC   "CHANGING OPPONENT,  YOU WILL HAVE",8D
         ASC   "TO FIND  A  WAY  TO RECONSTRUCT A",8D
         ASC   "DIAGRAM  THAT  HAS BEEN SCRAMBLED",8D
         ASC   "BY  THE COMPUTER. DON'T  GET YOUR",8D
         ASC   "HOPES  UP,  HOWEVER : ANY VICTORY",8D

         ASC   "                                 ",8D
         ASC   "WILL  ONLY  BE  TEMPORARY,  YOUR ",8D
         ASC   "FREEDOM OF CHOICE WILL CONSTANTLY",8D
         ASC   "BE CURTAILED, YOUR MOVEMENTS WILL",8D
         ASC   "BECOME  CLUMSY  AND CONFUSED, THE",8D
         ASC   "DIAGRAM WILL  BE  MORE COMPLEX...",8D
         ASC   "AND  THUS  BEGINS, FOR THE NOVICE",8D
         ASC   "AS  FOR  THE  EXPERT,  THE  NEVER",8D
         ASC   "ENDING  QUEST  FOR THE BOUNDARIES",8D
         ASC   "OF THE HUMAN SPIRIT...           ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D

         ASC   "                                 ",8D
         ASC   "  OVERVIEW                       ",8D
         ASC   "  --------                       ",8D
         ASC   "                                 ",8D
         ASC   "     THE OBJECTIVE OF THE GAME IS",8D
         ASC   "TO RECONSTRUCT A DIAGRAM THAT HAS",8D
         ASC   "BEEN SCRAMBLED BY THE COMPUTER.  ",8D
         ASC   "YOU  WILL  USE THE CONTROL ARROWS",8D
         ASC   "THAT SURROUND THE DIAGRAM TO MOVE",8D
         ASC   "THE ROWS AND COLUMNS.            ",8D
         ASC   "     BE CAREFUL, HOWEVER: AS YOU ",8D
         ASC   "PROGRESS,  MOVING  THE  ROWS  AND",8D
         ASC   "COLUMNS    WILL    BECOME    MORE",8D
         ASC   "DIFFICULT  AND,  NATURALLY,  THE ",8D
         ASC   "DIAGRAM  ITSELF WILL  BECOME MORE",8D
         ASC   "AND MORE SOPHISTICATED.          ",8D

         ASC   "                                 ",8D
         ASC   "     THERE IS NO TIME  LIMIT, BUT",8D
         ASC   "THE TIME ELAPSED IS DISPLAYED.   ",8D
         ASC   "YOUR  GOAL  IS TO RECONSTRUCT THE",8D
         ASC   "DIAGRAM AS QUICKLY AS POSSIBLE.  ",8D
         ASC   "                                 ",8D
         ASC   "    AS THIS GAME IS FUNDAMENTALLY",8D
         ASC   "NOT A RACE AGAINST THE CLOCK, WE ",8D
         ASC   "RECOMMEND THAT YOU TAKE YOUR TIME",8D
         ASC   "AT   THE  BEGINNING  TO   CLOSELY",8D
         ASC   "ANALYZE THE RESULTS OBTAINED WHEN",8D
         ASC   "USING THE VARIOUS CONTROL ARROWS.",8D
         ASC   "     ONCE  YOU  HAVE SUCCESSFULLY",8D
         ASC   "COMPLETED  A   DIAGRAM,  TRY   TO",8D
         ASC   "IMPROVE  YOUR SCORE  BY  REDUCING",8D
         ASC   "THE TIME AND NUMBER OF MOVES USED",8D

         ASC   "                                 ",8D
         ASC   "  CONFIGURATION PANEL            ",8D
         ASC   "  -------------------            ",8D
         ASC   "                                 ",8D
         ASC   "     TO   ACCESS   THE   PANEL   ",8D
         ASC   "CONFIGURATION FROM THE GAME, JUST",8D
         ASC   "HIT  A  KEY  OF  THE  APPLE  IIGS",8D
         ASC   "KEYBOARD.                        ",8D
         ASC   "                                 ",8D
         ASC   "  * GAME : IF YOU WANT  TO  END A",8D
         ASC   "CURRENT GAME TO  COME BACK LATER,",8D
         ASC   "YOU JUST  HAVE TO RECORD IT USING",8D
         ASC   "THE 'SAVE GAME' OPTION.          ",8D
         ASC   "IF  YOU  NOW  WANT  TO  LOAD YOUR",8D
         ASC   "SAVED    GAME    JUST   USE   THE",8D
         ASC   "'LOAD GAME' OPTION.              ",8D

         ASC   "  * MUSIC :  YOU  CAN ACTIVATE OR",8D
         ASC   "DESACTIVATE   THE   MUSIC.       ",8D
         ASC   "IF THE MUSIC IS DESACTIVADED, YOU",8D
         ASC   "WILL  HAVE A SOUND  EACH TIME YOU",8D
         ASC   "MOVE A ROW OR A COLUMN.          ",8D
         ASC   "     IF  YOU DON'T WANT ANY NOISE",8D
         ASC   "YOU  CAN  FREELY  ACCESS  THE    ",8D
         ASC   "APPLE IIGS  CONTROL PANEL  DURING",8D
         ASC   "THE  GAME  TO  MODIFY THE SPEAKER",8D
         ASC   "VOLUME.                          ",8D
         ASC   "                                 ",8D
         ASC   "  * GROUND : THIS OPTION LETS YOU",8D
         ASC   "CHOOSE  THE  BACKGROUND  PICTURE.",8D
         ASC   "YOU CAN SELECT ONE  FROM THE FOUR",8D
         ASC   "AVAILABLE (HAPPY, LUDY, PLANET OR",8D
         ASC   "XENO)  OR  LET   THE   COMPUTER  ",8D

         ASC   "RANDOMLY CHOOSE A NEW  BACKGROUND",8D
         ASC   "PICTURE FOR EACH NEW LEVEL.      ",8D
         ASC   "    THE  CHOICE  OF  A BACKGROUND",8D
         ASC   "PICTURE HAS NO CONNEXION WITH THE",8D
         ASC   "DIFFICULTY OF THE LEVEL.         ",8D
         ASC   "                                 ",8D
         ASC   "  * LEVEL : IN   THE   COMMERCIAL",8D
         ASC   "EDITIONS OF  THIS GAME (MAC, PC),",8D
         ASC   "YOU HAD TO GIVE  A  CODE TO  GAIN",8D
         ASC   "ACCESS   TO   A  LEVEL.  IN   THE",8D
         ASC   "APPLE  II  GS  VERSION,  WE  HAVE",8D
         ASC   "DECIDED   TO   LET   YOU   ACCESS",8D
         ASC   "FREELY ANY LEVEL.                ",8D
         ASC   "     THEN  YOU  CAN  CHOOSE  YOUR",8D
         ASC   "LEVEL JUST BY GIVING ITS NUMBER. ",8D
         ASC   "                                 ",8D

         ASC   "                                 ",8D
         ASC   "  * DOC :   HERE   YOU   ARE  !!!",8D
         ASC   "EVERYTHING YOU NEED TO KNOW ABOUT",8D
         ASC   "THIS  GAME  TO USE IT AS THE BEST",8D
         ASC   "WAY.                             ",8D
         ASC   "                                 ",8D
         ASC   "  * ABOUT :  INFORMATIONS  ABOUT ",8D
         ASC   "THE PROGRAMMERS OF THE APPLE //GS",8D
         ASC   "VERSION OF THE GAME.             ",8D
         ASC   "                                 ",8D
         ASC   "  * QUIT : TO QUIT THE GAME.     ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   " GOOD LUCK WITH THE 120 LEVELS ! ",8D
         ASC   "                                 ",8D

TEXTEFRA ASC   "                                 ",8D
         ASC   " ***  ***  *   * *****  **  *    ",8D
         ASC   " *  * *  * *   *   *   *  * *    ",8D
         ASC   " ***  ***  *   *   *   **** *    ",8D
         ASC   " *  * * *  *   *   *   *  * *    ",8D
         ASC   " ***  *  *  ***    *   *  * **** ",8D
         ASC   "                                 ",8D
         ASC   " ***  **** *    *   * *   * **** ",8D
         ASC   " *  * *    *    *   *  * *  *    ",8D
         ASC   " *  * ***  *    *   *   *   ***  ",8D
         ASC   " *  * *    *    *   *  * *  *    ",8D
         ASC   " ***  **** ****  ***  *   * **** ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "          SEPTEMBRE 1994         ",8D
         ASC   "                                 ",8D

         ASC   "                                 ",8D
         ASC   "     COGITO VERSION APPLE//GS    ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   " PROGRAMMATION :   BRUTAL DELUXE ",8D
         ASC   "                                 ",8D
         ASC   " DESIGN        :   BRUTAL DELUXE ",8D
         ASC   "                                 ",8D
         ASC   "LES GRAPHIQUES ONT ETE CONVERTIS ",8D
         ASC   "  A  L'AIDE  DE  CONVERT 3200,   ",8D
         ASC   "    (C) 1993 BRUTAL DELUXE       ",8D
         ASC   "                                 ",8D
         ASC   " MUSIQUE       :   TOOL 220      ",8D
         ASC   "                 (C) 1991 FTA    ",8D
         ASC   "                                 ",8D
         ASC   "MERCI A J. CRETAUX POUR SON AIDE.",8D

         ASC   "                                 ",8D
         ASC   " COGITO GS EST                   ",8D
         ASC   "                                 ",8D
         ASC   "   - INSTALLABLE SUR DISQUE DUR, ",8D
         ASC   "                                 ",8D
         ASC   "   - COMPATIBLE GS/OS 5.0 A 6.01,",8D
         ASC   "                                 ",8D
         ASC   "   - N'OCCUPE QUE 500 KO EN RAM, ",8D
         ASC   "                                 ",8D
         ASC   "   - UN LOGICIEL EN FREEWARE,    ",8D
         ASC   "                                 ",8D
         ASC   "   - N'EST PAS CENSE FONCTIONNER ",8D
         ASC   "SOUS  DES  ENVIRONNEMENTS  MULTI ",8D
         ASC   "TACHES  OU  MULTI  APPLICATIONS  ",8D
         ASC   "(THE MANAGER, SWITCH IT, GNO...).",8D
         ASC   "A VOS RISQUES ET PERILS...       ",8D

         ASC   "                                 ",8D
         ASC   " TOUTES NOS PRODUCTIONS :        ",8D
         ASC   "                                 ",8D
         ASC   "    - BILLE ART                  ",8D
         ASC   "                                 ",8D
         ASC   "    - OPALE DEMO                 ",8D
         ASC   "                                 ",8D
         ASC   "    - SYSTEME GS/OS 6.01 FRANCAIS",8D
         ASC   "                                 ",8D
         ASC   "    - TINIES GS                  ",8D
         ASC   "                                 ",8D
         ASC   "    - COGITO GS                  ",8D
         ASC   "                                 ",8D
         ASC   " SONT   DISPONIBLES   AUPRES   DU",8D
         ASC   "GS CLUB.                         ",8D
         ASC   "                                 ",8D

         ASC   "                                 ",8D
         ASC   " PROCHAINS LOGICIELS DISPONIBLES ",8D
         ASC   "                                 ",8D
         ASC   "    - TINIES CONSTRUCTION KIT    ",8D
         ASC   "EDITEZ  VOUS  MEME  DES  NOUVEAUX",8D
         ASC   "TABLEAUX  POUR  TINIES  ET  JOUEZ",8D
         ASC   "AVEC.                            ",8D
         ASC   "                                 ",8D
         ASC   "    - CONVERT 3200               ",8D
         ASC   "UN CONVERTISSEUR GRAPHIQUE.      ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "VOUS  POUVEZ  NOUS  CONTACTER SUR",8D
         ASC   "MINITEL :                        ",8D
         ASC   "                                 ",8D
         ASC   " 3615 RTEL, BAL :  BRUTAL DELUXE ",8D

         ASC   "UN GRAND COUCOU A NOS AMIS :     ",8D
         ASC   "                                 ",8D
         ASC   "     ACHA,  ANTONIO,  ARAGORN GS,",8D
         ASC   "AZEBULON, BABAR, BANDIT II, BARBE",8D
         ASC   "BLEUE, BILBO BILOBA, J.M BOUILLY,",8D
         ASC   "BRAINSTORM SOFTWARE,  J.A. CANAL,",8D
         ASC   "CGS,  DIZZY,  FLATLINER, GHERKIN,",8D
         ASC   "J.P  GOURNAY, GRAND SOT, INDIANA,",8D
         ASC   "KRYPTON,   LACAZE   BROTHER,  J.C",8D
         ASC   "LEDUCQ,   FRED   LEHIDEUX,  LO44,",8D
         ASC   "NIBBLE,  OTOMATIC,  PERFECT BUGS,",8D
         ASC   "PILATUS, SAM IIGS, TEASER,  TEDY,",8D
         ASC   "THE WHITE MAN...                 ",8D
         ASC   "                                 ",8D
         ASC   " AINSI QU'AUX NOMBREUX ET FIDELES",8D
         ASC   "RTELIENS DE LA RUB GS.           ",8D

         ASC   " NOUS N'OUBLIONS PAS NON PLUS NOS",8D
         ASC   "CONTACTS A L'ETRANGER :          ",8D
         ASC   "                                 ",8D
         ASC   "  URS 'CODEBURGER', HENRIK GUDAT,",8D
         ASC   "FRANK  M.LIN,  JOE KOHN,  WILLIAM",8D
         ASC   "ST PIERRE,  KEN POPPLETON,  STEVE",8D
         ASC   "SEBAN, SAM LATELLA...            ",8D
         ASC   "                                 ",8D
         ASC   "   COGITO COMME TOUTES NOS AUTRES",8D
         ASC   "PRODUCTIONS EST  GRATUIT. SI VOUS",8D
         ASC   "PENSEZ  QUE  VOUS  AURIEZ  ACHETE",8D
         ASC   "CES LOGICIELS  S'ILS  ETAIENT  EN",8D
         ASC   "VENTE, LA CHOSE  QUI NOUS  FERAIT",8D
         ASC   "PLAISIR SERAIT QUE VOUS UTILISIEZ",8D
         ASC   "L'ARGENT  AINSI ECONOMISE EN VOUS",8D
         ASC   "ABONNANT A DES REVUES EN FRANCAIS",8D

         ASC   "QUI  PARLENT  DU  GS. VOICI LEURS",8D
         ASC   "ADRESSES.                        ",8D
         ASC   "                                 ",8D
         ASC   "  LA POMME ILLUSTREE :           ",8D
         ASC   "                                 ",8D
         ASC   "       LA POMME ILLUSTREE        ",8D
         ASC   "    20 IMPASSE SOUS LES PRES     ",8D
         ASC   "         94110 ARCUEIL           ",8D
         ASC   "             FRANCE              ",8D
         ASC   "                                 ",8D
         ASC   "  KISS FROM ISRAEL :             ",8D
         ASC   "                                 ",8D
         ASC   "           KPL EDITION           ",8D
         ASC   "           PO BOX 2593           ",8D
         ASC   "             NETANYA             ",8D
         ASC   "             ISRAEL              ",8D


TEXTEUSA ASC   "                                 ",8D
         ASC   " ***  ***  *   * *****  **  *    ",8D
         ASC   " *  * *  * *   *   *   *  * *    ",8D
         ASC   " ***  ***  *   *   *   **** *    ",8D
         ASC   " *  * * *  *   *   *   *  * *    ",8D
         ASC   " ***  *  *  ***    *   *  * **** ",8D
         ASC   "                                 ",8D
         ASC   " ***  **** *    *   * *   * **** ",8D
         ASC   " *  * *    *    *   *  * *  *    ",8D
         ASC   " *  * ***  *    *   *   *   ***  ",8D
         ASC   " *  * *    *    *   *  * *  *    ",8D
         ASC   " ***  **** ****  ***  *   * **** ",8D
         ASC   "                                 ",8D
         ASC   "          SEPTEMBER 1994         ",8D
         ASC   "                                 ",8D
         ASC   "           WE'RE BACK !          ",8D

         ASC   "                                 ",8D
         ASC   "     COGITO APPLE//GS VERSION    ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   " PROGRAMMATION :   BRUTAL DELUXE ",8D
         ASC   "                                 ",8D
         ASC   " DESIGN        :   BRUTAL DELUXE ",8D
         ASC   "                                 ",8D
         ASC   " GRAPHICS  HAVE  BEEN  CONVERTED ",8D
         ASC   "     USING  CONVERT  3200,       ",8D
         ASC   "    (C) 1993 BRUTAL DELUXE       ",8D
         ASC   "                                 ",8D
         ASC   " MUSIC         :   TOOL 220      ",8D
         ASC   "                 (C) 1991 FTA    ",8D
         ASC   "                                 ",8D
         ASC   "THANKS TO J.CRETAUX FOR HIS HELP.",8D

         ASC   "                                 ",8D
         ASC   " COGITO GS IS                    ",8D
         ASC   "                                 ",8D
         ASC   "   - INSTALLABLE ON HARD DRIVE   ",8D
         ASC   "                                 ",8D
         ASC   "   - COMPATIBLE GS/OS 5.0 TO 6.01",8D
         ASC   "                                 ",8D
         ASC   "   - USE ONLY 500 KB OF MEMORY   ",8D
         ASC   "                                 ",8D
         ASC   "   - A FREEWARE SOFTWARE         ",8D
         ASC   "                                 ",8D
         ASC   "   - NOT SUPPOSED  TO WORK  UNDER",8D
         ASC   "MULTI  TASKING   ENVIRONMENTS  OR",8D
         ASC   "MULTI APPLICATIONS   ENVIRONMENTS",8D
         ASC   "(THE MANAGER, SWITCH IT, GNO...).",8D
         ASC   "YOU WILL USE IT AT YOUR OWN RISKS",8D

         ASC   "                                 ",8D
         ASC   " ALL OUR PRODUCTIONS :           ",8D
         ASC   "                                 ",8D
         ASC   "    - BILLE ART                  ",8D
         ASC   "                                 ",8D
         ASC   "    - TINIES GS                  ",8D
         ASC   "                                 ",8D
         ASC   "    - OPALE DEMO                 ",8D
         ASC   "                                 ",8D
         ASC   "    - COGITO GS                  ",8D
         ASC   "                                 ",8D
         ASC   "  ARE AVAILABLE ON FTP SITES LIKE",8D
         ASC   "CCOSUN.CALTECH.EDU OR IF YOU HAVE",8D
         ASC   "SUBSCRIBED TO SHAREWARE SOLUTIONS",8D
         ASC   "YOU CAN ASK THEM TO JOE KOHN.    ",8D
         ASC   "                                 ",8D

         ASC   " OUR NEXT SOFTWARES WILL BE :    ",8D
         ASC   "                                 ",8D
         ASC   "    - TINIES CONSTRUCTION KIT    ",8D
         ASC   "EDIT AND PLAY AT YOUR OWN LEVELS.",8D
         ASC   "                                 ",8D
         ASC   "    - CONVERT 3200               ",8D
         ASC   "A 16/256/3200 GRAPHIC CONVERTER  ",8D
         ASC   "                                 ",8D
         ASC   "YOU CAN JOIN US AT :             ",8D
         ASC   "                                 ",8D
         ASC   "     BRUTAL DELUXE SOFTWARE      ",8D
         ASC   "      11 RUE EMILE FOURCAND      ",8D
         ASC   "         33000 BORDEAUX          ",8D
         ASC   "             FRANCE              ",8D
         ASC   " INTERNET :                      ",8D
         ASC   "    ZARDINI@IXL.U-BORDEAUX.FR    ",8D

         ASC   " WE WOULD LIKE TO SAY  HELLO  TO ",8D
         ASC   "OUR FRIENDS  AND  PEOPLE  WE HAVE",8D
         ASC   "MET ON INTERNET :                ",8D
         ASC   "                                 ",8D
         ASC   " JOE KOHN, FRANK M.LIN, MARC SIRA",8D
         ASC   "PAUL SCHULTZ, NATHAN MATES, DAVID",8D
         ASC   "ONG  TAT-WEE,  LIM  THYE  CHEAN, ",8D
         ASC   "DANIEL PFARRER, RANDY SHACKELFORD",8D
         ASC   "PETAR E PUSKARICH,  SAM  LATELLA,",8D
         ASC   "KEN RICHARSON, ELIAS KOUTOULAKIS,",8D
         ASC   "RICHARD KING, TOM WEISHAAR, STEVE",8D
         ASC   "SEBAN,  WILLIAM  ST  PIERRE,  KEN",8D
         ASC   "POPPLETON,  URS  'CODEBURGER',   ",8D
         ASC   "HENRIK GUDAT, IAN SCHMIDT...     ",8D
         ASC   "                                 ",8D
         ASC   "AND ALL THOSE WE HAVE FORGOTTEN..",8D

         ASC   "                                 ",8D
         ASC   "  SPECIAL HELLO TO ALL THE PEOPLE",8D
         ASC   "WHO HAVE WRITTEN TO US TO TELL US",8D
         ASC   "THEY HAD LOVED TINIES...         ",8D
         ASC   "                                 ",8D
         ASC   "    BRUTAL DELUXE SUPPORTS THE   ",8D
         ASC   "         PHOENIX PROJECT         ",8D
         ASC   "      TURBO REZ GRAPHIC CARD     ",8D
         ASC   "             DSP CARD            ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "BRUTAL  DELUXE  IS  LOOKING  FOR ",8D
         ASC   "GRAPHISTS TO END THE OPALE GAME, ",8D
         ASC   "JUST  HAVE  A  LOOK TO THE OPALE ",8D
         ASC   "DEMO FOR MORE INFORMATIONS.      ",8D
         ASC   "                                 ",8D

         ASC   "     BIG KISSES EVERYWHERE TO    ",8D
         ASC   "  CHARLOTTE HORSTMAN (OKLAHOMA), ",8D
         ASC   "MY PREFERED AMERICAN GIRL...     ",8D
         ASC   "                                 ",8D
         ASC   "                                 ",8D
         ASC   "    ALL OUR PRODUCTIONS ARE FREE.",8D
         ASC   "IF  YOU  THINK  YOU  HAD  BOUGHT ",8D
         ASC   "THEM  IF THEY  HAD  BEEN SOLD, WE",8D
         ASC   "WILL BE REALLY  VERY HAPPY IF YOU",8D
         ASC   "COULD USE THE MONEY YOU HAVE KEPT",8D
         ASC   "TO SUBSCRIBE TO SHAREWARE SOL. II",8D
         ASC   "NEWSLETTER.  IT  IS  A  VERY GOOD",8D
         ASC   "BI-MONTHLY PAPER. SSII COMES WITH",8D
         ASC   "A PRO-RATED MONEY BACK GUARANTEE.",8D
         ASC   "    PERHAPS YOU  DON'T UNDERSTAND",8D
         ASC   "THE  CONNEXION BETWEEN  THE  FACT",8D

         ASC   "THAT WE SPEND OUR TIME TO PROGRAM",8D
         ASC   "FREELY  AND A NEWSLETTER,  BUT IT",8D
         ASC   "EXISTS...THE SAME APPLE II SPIRIT",8D
         ASC   "                                 ",8D
         ASC   " TO CONTACT JOE :                ",8D
         ASC   "                                 ",8D
         ASC   "     SHAREWARE SOLUTIONS II      ",8D
         ASC   "            JOE KOHN             ",8D
         ASC   "        166 ALPINE STREET        ",8D
         ASC   "    SAN RAFAEL, CA 94901-1008    ",8D
         ASC   "               USA               ",8D
         ASC   "                                 ",8D
         ASC   "CIS               :  76702,565   ",8D
         ASC   "GENIE             :  JOE.KOHN    ",8D
         ASC   "INTERNET          :  JOKO@CRL.COM",8D
         ASC   "AMERICAN ONLINE   :  JOKO        ",8D

**************************

KBD      PHA
KBD1     LDAL  $00BFFF
         BPL   KBD1
         STAL  $00C010
         PLA
         RTS

FADELINE1 PHX             ; FADE OUT LIGNE Acc
         PHY
         LDY   #$0000
FAD0     ASL
         TAX
         LDA   TABLE,X
         CLC
         ADC   #$2000
         STA   FAD5+1
         STA   FAD8+1
         STA   FAD6+1
         STA   FAD9+1
FAD4     LDX   #$009F
FAD5     LDAL  $E15E80,X
         BIT   #$00F0
         BEQ   FAD6
         SEC
         SBC   #$0010
FAD8     STAL  $E15E80,X
FAD6     LDAL  $E15E80,X
         BIT   #$000F
         BEQ   FAD7
         SEC
         SBC   #$0001
FAD9     STAL  $E15E80,X
FAD7     DEX
         BPL   FAD5
         DEY
         BPL   FAD4
         PLY
         PLX
         RTS

FADELINE8 PHX             ; FADE LINE Acc
         PHY
         ASL
         TAX
         LDA   TABLE,X
         CLC
         ADC   #$2000
         STA   FAD10+1
         STA   FAD12+1
         STA   FAD13+1
         LDX   #$009F
FAD10    LDAL  $E12000,X
         AND   #$00FF
         TAY
         LDA   TABLE2,Y
         AND   #$00FF
         STA   FAD11+1
FAD12    LDAL  $E12000,X
         AND   #$FF00
FAD11    ORA   #$0000
FAD13    STAL  $E12000,X
         DEX
         BPL   FAD10
         PLY
         PLX
         RTS

TRAC1    PHA
         PHX
         PHY
         LDA   TRACFLAG
         BEQ   TRAC10
         STZ   TRACFLAG
         BRA   TRAC11
TRAC10   STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         DEC   COOR1Y
         DEC   COOR1Y
         INC   COOR2Y
         INC   COOR2Y
         INC   LIFLAG
         JSR   TRACELI    ; TRACE
         INC   TRACFLAG
TRAC11   PLY
         PLX
         PLA
         RTS

TRAC2    PHA
         PHX
         PHY
         LDA   TRACFLAG
         BEQ   TRAC20
         STZ   TRACFLAG
         BRA   TRAC22
TRAC20   STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         INC   COOR1X
         INC   COOR1X
         INC   COOR1X
         INC   COOR1X
         INC   COOR2Y
         INC   COOR2Y
         INC   LIFLAG
         JSR   TRACELI    ; TRACE
         INC   TRACFLAG
TRAC22   PLY
         PLX
         PLA
         RTS

TRAC3    PHA
         PHX
         PHY
         LDA   TRACFLAG
         BEQ   TRAC30
         STZ   TRACFLAG
         BRA   TRAC33
TRAC30   STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         INC   COOR1X
         INC   COOR1X
         INC   COOR1X
         INC   COOR1X
         DEC   COOR2X
         DEC   COOR2X
         DEC   COOR2X
         DEC   COOR2X
         INC   LIFLAG
         JSR   TRACELI    ; TRACE
         INC   TRACFLAG
TRAC33   PLY
         PLX
         PLA
         RTS

TRAC4    PHA
         PHX
         PHY
         LDA   TRACFLAG
         BEQ   TRAC40
         STZ   TRACFLAG
         BRA   TRAC44
TRAC40   STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         INC   COOR1Y
         INC   COOR1Y
         DEC   COOR2X
         DEC   COOR2X
         DEC   COOR2X
         DEC   COOR2X
         INC   LIFLAG
         JSR   TRACELI    ; TRACE
         INC   TRACFLAG
TRAC44   PLY
         PLX
         PLA
         RTS

TRAC5    PHA
         PHX
         PHY
         LDA   TRACFLAG
         BEQ   TRAC50
         STZ   TRACFLAG
         BRA   TRAC55
TRAC50   STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         LDA   COOR1Y
         CMP   #$00C1
         BEQ   TRAC51
         INC   COOR1Y
         INC   COOR1Y
TRAC51   DEC   COOR2Y
         DEC   COOR2Y
         INC   LIFLAG
         JSR   TRACELI    ; TRACE
         INC   TRACFLAG
TRAC55   PLY
         PLX
         PLA
         RTS

TRAC6    PHA
         PHX
         PHY
         LDA   TRACFLAG
         BEQ   TRAC60
         STZ   TRACFLAG
         BRA   TRAC66
TRAC60   STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         DEC   COOR1X
         DEC   COOR1X
         DEC   COOR1X
         DEC   COOR1X
         DEC   COOR2Y
         DEC   COOR2Y
         INC   LIFLAG
         JSR   TRACELI    ; TRACE
         INC   TRACFLAG
TRAC66   PLY
         PLX
         PLA
         RTS

TRACEND  PHX
         PHY
         STZ   LIFLAG
         JSR   TRACELI    ; NETTOYAGE
         INC   LIFLAG
         PLY
         PLX
         RTS

TRACELI  LDA   COOR1X     ; TRACE LES LIGNES DU CADRE
         STA   LIX1
         LDA   COOR1Y
         STA   LIY1
         LDA   #$00A0
         STA   LIX0
         LDA   #$0064
         STA   LIY0
         JSR   LIGNE

         LDA   COOR2X
         STA   LIX1
         LDA   COOR2Y
         STA   LIY1
         LDA   #$00A0
         STA   LIX0
         LDA   #$0064
         STA   LIY0
         JSR   LIGNE
         RTS

TRACFLAG HEX   0000

COOR1X   HEX   0000
COOR1Y   HEX   0000
COOR2X   HEX   0000
COOR2Y   HEX   0000
