*
* TCK: Olivier
*

         LDX   #$7FFE     ; NETTOY ECRAN
         LDA   #$0000
LP1      STAL  $012000,X
         DEX
         DEX
         BPL   LP1

ADR      LDA   ptrTCK1+1  ; MISE A JOUR DES ADRESSES
         AND   #$FF00
         STA   ADR1+1
         STA   ADR2+1
         LDA   SPMSKTAB2+1
         AND   #$00FF
ADR1     ORA   #$FF00
         STA   SPMSKTAB2+1
         LDA   SPMSKTAB2+4
         AND   #$00FF
ADR2     ORA   #$FF00
         STA   SPMSKTAB2+4
         LDA   ptrNIV+1
         AND   #$FF00
         STA   ADR3+1
         LDA   ptrTCK2+1
         AND   #$FF00
         STA   ADR4+1
         LDY   #$0000     ; ADRESSE DES SPRITES SANS MASQUE
         LDX   #$0003
ADR0     LDA   SPMSKTAB2+11,Y
         AND   #$00FF
ADR3     ORA   #$FF00
         STA   SPMSKTAB2+11,Y
         LDA   SPMSKTAB2+14,Y
         AND   #$00FF
ADR4     ORA   #$FF00
         STA   SPMSKTAB2+14,Y
         TYA
         CLC
         ADC   #$000A
         TAY
         DEX
         BPL   ADR0
         LDA   ptrTCK2+1  ; ADRESSE SPRITE2 : TCK2
         STA   AFFSPR4+2
         STZ   AFFSPR4+1
         STA   AFFZONE2+2
         STA   COPYBL00+1
         STA   COPYBL2+1
         STA   COPYBL3+1
         STA   COPYBLN+1
         LDA   ptrNIV+1   ; ADRESSE NIVEAU : NIV02
         STA   COPYBL0+1
         STA   COPYBL1+1
         STA   COPYBL4+1
         STA   COPYBLN0+1
         STA   COPYBL8+1
         LDA   ptrTAB+1   ; ADRESSE TABLE DE DESCRIPTION
         STA   COPYLVL1+2
         STA   COPYDES2+2

         LDA   fgLANG
         BNE   LANGUE2

         LDX   #$0086
LANGUE1  LDA   ERRMESU,X  ; MESSAGE ERREUR EN ANGLAIS
         STA   ERRMES1,X
         DEX
         DEX
         BPL   LANGUE1

         LDA   #TEXTEUSD  ; DOCUMENTATION EN ANGLAIS
         STA   AFTLIG1+1

LANGUE2  LDA   #$0000
         STA   POSX
         STA   POSY
         STA   A1         ; INIT SOURIS
         STA   AP
         JSR   SAUV       ; SAUVEGARDE DECOR
         JSR   DESS

         JSR   MAKESPR    ; CREATION PLANCHE SPRITE2 AVEC PALETTE ET ZONE ROSE

         LDA   #$0000
         JSR   COPYLVL    ; COPIE DE LA TABLE DE DESCRIPTION DU NIVEAU A
         JSR   CONVLVL    ; CONVERTI LES VALEURS

         LDA   LEVEL      ; GESTION DU TEMPS
         STA   level
         JSR   doTIME
         LDA   minutes
         STA   TIMEMIN
         LDA   secondes
         STA   TIMESEC

         LDA   #$0002
         JMP   PICT       ; IMAGE PRINCIPALE (MENU DROITE)

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

*******************************************************************************
***********************  TRAITEMENT DES BOUTONS  ******************************
*******************************************************************************

KEYBOARD LDAL  $00BFFF
         BPL   KEYBOAR1
         STAL  $00C010    ; BIT $C010
         TAX              ; SAUVEGARDE
         LDA   ECRAN
         CMP   #$0003
         BPL   KEYBOAR4
         TXA              ; RECUP
         AND   #$FF00
         CMP   #$A000     ; BARRE ESPACE
         BNE   KEYBOAR5
         PLA              ; RECUPERE L'ADRESSE DE RETOUR DU JSR
         JSR   DESS1
         LDA   MAISELE
         BEQ   KEYBOAR2
         LDA   #$0006
         JMP   PICT1
KEYBOAR2 LDA   #$0005
         JMP   PICT1
KEYBOAR5 CMP   #$9500     ; FLECHE -> ET <-
         BEQ   KEYBOAR6
         CMP   #$8800     ; <-
         BNE   KEYBOAR1
         PLA              ; RECUPERE L'ADRESSE DU JSR
         JSR   DESS1
         JMP   ECR0181    ; <-
KEYBOAR6 PLA
         JSR   DESS1
         JMP   ECR0191    ; ->
KEYBOAR1 RTS
KEYBOAR4 CMP   #$0005     ; 5,6 -> OK
         BEQ   KEYBOAR3
         CMP   #$0006
         BEQ   KEYBOAR3
         RTS
KEYBOAR3 TXA              ; LA BARRE D'ESPACE FAIT DISPARAITRE LE MENU
         AND   #$FF00
         CMP   #$A000     ; BARRE ESPACE ?
         BNE   KEYBOAR1
         PLA              ; RECUP LE JSR
         JSR   DESS1
         LDA   DROITE     ; REVIENT AU MAIN
         JMP   PICT1

BORD5    LDAL  $00C034    ; ICI TRAITEMENT PAR DEFAUT
         AND   #$FFF0     ; BORDURE NOIRE
         STAL  $00C034
BORD55   RTS

BORD6    LDAL  $00C034
         AND   #$FFF0
         ORA   #$0001     ; ROUGE
         STAL  $00C034
         RTS

****************  MAIN

ECR0100  LDX   SECR2+1    ; MAIN : TIME
         LDA   #ECR0101
         STA   BUMPER5+1
         JMP   BUMPER
ECR0101  NOP
         LDA   #$0003
         JMP   PICT1

ECR0110  LDX   SECR2+1    ; MAIN : LEVEL
         LDA   #ECR0111
         STA   BUMPER5+1
         JMP   BUMPER
ECR0111  NOP
         LDA   LEVEL
         STA   OLDLEVEL   ; SAUVEGARDE LE LEVEL COURANT
         LDA   #$0004
         JMP   PICT1

ECR0120  LDX   SECR2+1    ; MAIN : PLAY
         LDA   #ECR0121
         STA   BUMPER5+1
         JMP   BUMPER
ECR0121  NOP
         JSR   VERIFOK
         BCC   ECR0122
         LDA   #$000B     ; ATTENTION PROBLEME
         JMP   PICT1
ECR0122  LDA   TIMEMIN    ; ROUTINE DE PLAY
         STA   minutes
         LDA   TIMESEC
         STA   secondes
         JSR   putTIME    ; BOGUE
         LDA   LEVEL
         STA   level
         JSR   putTIME
         JSR   CONVBUF    ; MISE A JOUR DE LA DESCRIPTION DU NIVEAU
         LDA   LEVEL      ; PLACE L'ANCIEN NIVEAU DANS LE TABLEAU
         JSR   COPYDES
         LDX   #$00CE
ECR0123  LDA   LEVELBUF,X
         STA   plateau5,X
         DEX
         DEX
         BPL   ECR0123
         JMP   tiniesPLAY

ECR0130  LDX   SECR2+1    ; MAIN : SELECT
         LDA   #ECR0131
         STA   BUMPER5+1
         JMP   BUMPER
ECR0131  NOP
         LDA   MAISELE
         BEQ   ECR0132
         LDA   #$0006
         JMP   PICT1
ECR0132  LDA   #$0005
         JMP   PICT1

MAISELE  HEX   0000       ; 0:GROUND,1:ITEM

ECR0140  LDX   SECR2+1    ; MAIN : v/^
         LDA   #ECR0141
         STA   BUMPER5+1
         JMP   BUMPER
ECR0141  NOP
         LDA   MAISELE
         BEQ   ECR0142
         STZ   MAISELE
         LDA   GRZONE
         JSR   SEBLCKG    ; GROUND
         LDA   DROITE
         JMP   PICT1
ECR0142  LDA   #$0001
         STA   MAISELE
         LDA   ITZONE
         JSR   SEBLCKI    ; ITEM
         LDA   DROITE
         JMP   PICT1

ECR0150  LDX   SECR2+1    ; MAIN : MENU
         LDA   #ECR0151
         STA   BUMPER5+1
         JMP   BUMPER
ECR0151  NOP
         LDA   #$0008
         JMP   PICT1

ECR0160  LDX   SECR2+1    ; MAIN : DOCU
         LDA   #ECR0161
         STA   BUMPER5+1
         JMP   BUMPER
ECR0161  NOP
         JSR   fadeOUT    ; FADE ET AFFICHAGE DE L'ECRAN DOCUMENTATION
         LDA   ptrDOC+1
         LDY   #$0000
         JSR   fadeIN
         LDA   #$0009
         JMP   PICT1

ECR0170  LDX   SECR2+1    ; MAIN : QUIT
         LDA   #ECR0171
         STA   BUMPER5+1
         JMP   BUMPER
ECR0171  NOP
         LDA   #$000A
         JMP   PICT1

ECR0180  LDX   SECR2+1    ; MAIN : <
         LDA   #ECR0181
         STA   BUMPER5+1
         JMP   BUMPER
ECR0181  NOP
         LDA   DROITE
         CMP   #$0001
         BEQ   ECR0182
         JSR   CLNDROIT   ; NETTOY
         LDA   #$0001
         STA   DROITE
         JMP   PICT1
ECR0182  JMP   SOURIS1

ECR0190  LDX   SECR2+1    ; MAIN : >
         LDA   #ECR0191
         STA   BUMPER5+1
         JMP   BUMPER
ECR0191  NOP
         LDA   DROITE
         CMP   #$0002
         BEQ   ECR0192
         JSR   CLNGAUCH   ; NETTOY
         LDA   #$0002
         STA   DROITE
         JMP   PICT1
ECR0192  JMP   SOURIS1

ECR01A0  LDX   SECR2+1    ; SURFACE QUADRILLEE GAUCHE
         LDA   #ECR01A1
         STA   BUMPER5+1
         JMP   BUMPER
ECR01A1  NOP
         LDA   POSX
         SEC
         SBC   #$0004     ; 4
         TAX
         LDA   ZONESCR,X
         AND   #$00FF
         DEC
         STA   SCRZONE
         LDA   POSY
         SEC
         SBC   #$0004     ; 4
         TAX
         LDA   ZONESCR,X
         AND   #$00FF
         DEC
         ASL
         TAX
         LDA   MULTREIZ,X ; *13
         CLC
         ADC   SCRZONE
         STA   SCRZONE    ; OFFSET
         JSR   PLACEBUF    ; PLACE LE CODE DANS GROUBUF OU DANS ITEMBUF
         LDA   SCRZONE
         JSR   SEBLCKS    ; AFFICHAGE DU SPRITE DANS LA GRILLE
ECR01A2  JSR   WAITVBL    ; REDESSINE LA GRILLE
         JSR   GRILHM
         JSR   GRILVM
         JSR   GRILHG
         JSR   GRILVG
         JSR   EFFDROIT   ; BANDE NOIRE
         JSR   SAUV
         JMP   SOURIS1

ECR01B0  LDX   SECR2+1     ; SURFACE QUADRILLEE DROITE
         LDA   #ECR01B1
         STA   BUMPER5+1
         JMP   BUMPER
ECR01B1  NOP
         LDA   POSX
         SEC
         SBC   #$0034     ; 52
         TAX
         LDA   ZONESCR,X
         AND   #$00FF
         INC              ; ++
         STA   SCRZONE
         LDA   POSY
         SEC
         SBC   #$0004     ; 4
         TAX
         LDA   ZONESCR,X
         AND   #$00FF
         DEC
         ASL
         TAX
         LDA   MULTREIZ,X ; *13
         CLC
         ADC   SCRZONE
         STA   SCRZONE
         JSR   PLACEBUF   ; PLACE LE CODE DE L'OBJET DANS GROUBUF OU ITEMBUF
         LDA   SCRZONE
         JSR   SEBLCKS    ; AFFICHAGE DU SPRITE DANS LA GRILLE
ECR01B2  JSR   WAITVBL    ; GRILLE
         JSR   GRILHM
         JSR   GRILVM
         JSR   GRILHD
         JSR   GRILVD
         JSR   EFFGAUCH   ; BANDE NOIRE
         JSR   SAUV
         JMP   SOURIS1

SCRZONE  HEX   0000
DROITE   HEX   0200
MULTREIZ HEX   0000,0D00,1A00,2700,3400,4100,4E00,5B00,6800

PLACEBUF LDAL  $00C025    ; PLACE LE CODE DE L'OBJET DANS GROUBUF OU ITEMBUF
         AND   #$0080
         BEQ   PLACEBU3   ; BIT 7=1 TOUCHE POMME ENFONCE
************* ENLEVE
         LDA   SCRZONE    ; ON ENLEVE L'OBJET DES BUFFERS
         ASL
         TAX
         LDA   MAISELE
         BNE   PLACEBU4
************* ENLEVE GROUND
         LDA   GRZONE
         PHA
         LDA   #$0031     ; GROUND
         STA   GROUBUF,X
         STA   ITEMBUF,X
         STA   GRZONE
         LDA   SCRZONE
         JSR   SEBLCKS    ; AFFICHE DU NOIR
         PLA
         STA   GRZONE
         PLA
         LDA   DROITE
         CMP   #$0001
         BNE   PLACEBU5
         JMP   ECR01B2    ;
PLACEBU5 JMP   ECR01A2
************* ENLEVE ITEM
PLACEBU4 LDA   ITEMBUF,X  ; ENLEVE L'ITEM
         BEQ   PLACEBU6
         CMP   #$0031
         BEQ   PLACEBU6   ; ON VERIFIE QU'IL Y AIT BIEN UN OBJET A ENLEVER
         LDA   #$0031
         STA   ITEMBUF,X
         LDA   ITZONE
         PHA
         LDA   GROUBUF,X
         STA   ITZONE
         LDA   SCRZONE    ; DESSINE LE SOL DESSUS
         JSR   SEBLCKS    ; AFFICHE
         PLA
         STA   ITZONE
         PLA              ; RECUPERE L'ADRESSE DU RTS
         LDA   DROITE
         CMP   #$0001
         BEQ   PLACEBU7
         JMP   ECR01A2    ; REDESSINE LA GRILLE
PLACEBU7 JMP   ECR01B2
PLACEBU6 JMP   SOURIS1
************* PLACE
PLACEBU3 LDA   SCRZONE    ; ET VERIFIE AU PASSAGE
         ASL
         TAX
         LDA   MAISELE
         BEQ   PLACEBU1
************* PLACE ITEM
         LDA   GROUBUF,X  ; ITEM
         CMP   #$0007
         BEQ   PLACEBU2
         CMP   #$0004
         BMI   PLACEBU2
         PLA              ; INTERDICTION DE POSER UN OBJET SUR UN MUR
         JMP   SOURIS1
PLACEBU2 LDA   ITZONE
         STA   ITEMBUF,X
         RTS
************* PLACE GROUND
PLACEBU1 LDA   GRZONE     ; GROUND
         STA   GROUBUF,X
         LDA   #$0031
         STA   ITEMBUF,X  ; ON ENLEVE L'OBJET
         RTS

*************  TIME

ECR0300  LDX   SECR2+1    ; TIME : <<
         LDA   #ECR0301
         STA   BUMPER5+1
         JMP   BUMPER
ECR0301  NOP
         LDA   TIMEMIN    ; MINUTE --
         BEQ   ECR0302
         DEC
         STA   TIMEMIN
         JSR   AFFTIMM    ; AFFICHAGE TIME
ECR0302  JMP   SOURIS1

ECR0310  LDX   SECR2+1    ; TIME : >>
         LDA   #ECR0311
         STA   BUMPER5+1
         JMP   BUMPER
ECR0311  NOP              ; MINUTE ++
         LDA   TIMEMIN
         CMP   #$003B     ; 59
         BEQ   ECR0312
         INC
         STA   TIMEMIN
         JSR   AFFTIMM    ; AFFICHAGE TIME
ECR0312  JMP   SOURIS1

ECR0320  LDX   SECR2+1    ; TIME : <
         LDA   #ECR0321
         STA   BUMPER5+1
         JMP   BUMPER
ECR0321  NOP              ; SECONDE --
         LDA   TIMESEC
         BEQ   ECR0322
         DEC
         STA   TIMESEC
         JSR   AFFTIMM    ; AFFICHAGE TIME
ECR0322  JMP   SOURIS1

ECR0330  LDX   SECR2+1    ; TIME : >
         LDA   #ECR0331
         STA   BUMPER5+1
         JMP   BUMPER
ECR0331  NOP              ; SECONDE ++
         LDA   TIMESEC
         CMP   #$003B     ; 59
         BEQ   ECR0332
         INC
         STA   TIMESEC
         JSR   AFFTIMM    ; AFFICHAGE TIME
ECR0332  JMP   SOURIS1

ECR0340  LDX   SECR2+1    ; TIME : OK
         LDA   #ECR0341
         STA   BUMPER5+1
         JMP   BUMPER
ECR0341  NOP
         JSR   CLNTIME    ; NETTOY
         LDA   DROITE
         JMP   PICT1

TIMEMIN  HEX   0000
TIMESEC  HEX   0000
TIMEMIND HEX   0000
TIMEMINU HEX   0000
TIMESECD HEX   0000
TIMESECU HEX   0000

AFFTIMG  LDA   #TIMECO1
         STA   AFFTIM2+1
         BRA   AFFTIM
AFFTIMM  LDA   #TIMECO2
         STA   AFFTIM2+1
         BRA   AFFTIM
AFFTIMD  LDA   #TIMECO3
         STA   AFFTIM2+1

AFFTIM   LDA   TIMEMIN    ; MINUTE
         ASL
         TAX
         LDA   HEXDEC,X
         XBA
         AND   #$00FF
         STA   TIMEMINU
         LDA   HEXDEC,X
         AND   #$00FF
         STA   TIMEMIND
         LDA   TIMESEC    ; SECONDE
         ASL
         TAX
         LDA   HEXDEC,X
         XBA
         AND   #$00FF
         STA   TIMESECU
         LDA   HEXDEC,X
         AND   #$00FF
         STA   TIMESECD
         LDY   #$0000
AFFTIM1  LDA   TIMEMIND,Y ; AFFICHAGE
         CLC
         ADC   #$001A
         TAX
AFFTIM2  LDA   TIMECO1,Y
         STA   AFTAE
         JSR   AFTCAR     ; AFFICHE MIN DIZAINE
         INY
         INY
         CPY   #$0008
         BNE   AFFTIM1
         RTS

MAJTIME  LDA   OLDLEVEL   ; MISE A JOUR DU TEMPS
         STA   level
         LDA   TIMEMIN    ; SAUVEGARDE DE L'ANCIEN
         STA   minutes
         LDA   TIMESEC
         STA   secondes
         JSR   putTIME
         LDA   LEVEL      ; CHARGE LE NOUVEAU
         STA   level
         JSR   doTIME
         LDA   minutes
         STA   TIMEMIN
         LDA   secondes
         STA   TIMESEC
         RTS

TIMECO1  HEX   0405,0805,0D05,1105 ; COORDONNEES GAUCHE
TIMECO2  HEX   C82A,CC2A,D12A,D52A ; COORDONNEES CENTRE
TIMECO3  HEX   8C05,9005,9505,9905 ; COORDONNEES DROITE

***********  LEVEL

ECR0400  LDX   SECR2+1    ; LEVEL : <<
         LDA   #ECR0401
         STA   BUMPER5+1
         JMP   BUMPER
ECR0401  NOP
         LDA   LEVEL       ; LEVEL -=10
         BEQ   ECR0403
         CMP   #$000A
         BMI   ECR0402
         SEC
         SBC   #$000A
         STA   LEVEL
         JSR   AFFLEVL2
         JMP   SOURIS1
ECR0402  STZ   LEVEL
         JSR   AFFLEVL2
ECR0403  JMP   SOURIS1

ECR0410  LDX   SECR2+1    ; LEVEL : <
         LDA   #ECR0411
         STA   BUMPER5+1
         JMP   BUMPER
ECR0411  NOP
         LDA   LEVEL      ; LEVEL --
         BEQ   ECR0412
         DEC
         STA   LEVEL
         JSR   AFFLEVL2   ; AFFICHAGE LEVEL
ECR0412  JMP   SOURIS1

ECR0420  LDX   SECR2+1    ; LEVEL : >
         LDA   #ECR0421
         STA   BUMPER5+1
         JMP   BUMPER
ECR0421  NOP
         LDA   LEVEL      ; LEVEL ++
         CMP   #$0064     ; 100
         BEQ   ECR0422
         INC
         STA   LEVEL
         JSR   AFFLEVL2   ; AFFICHAGE
ECR0422  JMP   SOURIS1

ECR0430  LDX   SECR2+1    ; LEVEL : >>
         LDA   #ECR0431
         STA   BUMPER5+1
         JMP   BUMPER
ECR0431  NOP
         LDA   LEVEL      ; LEVEL +=10
         CMP   #$0064     ; 100
         BEQ   ECR0433
         CMP   #$005A     ; 90
         BPL   ECR0432
         CLC
         ADC   #$000A
         STA   LEVEL
         JSR   AFFLEVL2   ; AFFICHAGE LEVEL
         JMP   SOURIS1
ECR0432  LDA   #$0064     ; 100
         STA   LEVEL
         JSR   AFFLEVL2
ECR0433  JMP   SOURIS1

ECR0440  LDX   SECR2+1    ; LEVEL : OK
         LDA   #ECR0441
         STA   BUMPER5+1
         JMP   BUMPER
ECR0441  NOP
         JSR   MAJLEVEL   ; MISE A JOUR DU NIVEAU (SAUV/LOAD)
         JSR   MAJTIME    ; MISE A JOUR DU TEMPS (SAUV/LOAD)
         JSR   MAJPICT    ; VERIFIE QUE L'ON AIT PAS BESOIN DE CHANGER LE DECOR
         JSR   CLNLEVE    ; NETTOY
         LDA   DROITE
         JMP   PICT1

LEVEL    HEX   0000       ; NIVEAU 0-109
LEVELC   HEX   0000
LEVELD   HEX   0000
LEVELU   HEX   0000
OLDLEVEL HEX   0000       ; NUMERO DU LEVEL EN ENTREE

AFFLEVL1 LDA   #LEVELCO1
         STA   AFFLEVL7+1
         BRA   AFFLEVL4
AFFLEVL2 LDA   #LEVELCO2
         STA   AFFLEVL7+1
         BRA   AFFLEVL4
AFFLEVL3 LDA   #LEVELCO3
         STA   AFFLEVL7+1
AFFLEVL4 LDA   LEVEL
* INC
         CMP   #$0064     ; 100
         BMI   AFFLEVL5
         LDX   #$0001
         STX   LEVELC
         SEC
         SBC   #$0064
AFFLEVL5 ASL
         TAX
         LDA   HEXDEC,X
         XBA
         AND   #$00FF
         STA   LEVELU
         LDA   HEXDEC,X
         AND   #$00FF
         STA   LEVELD
         LDY   #$0000
AFFLEVL6 LDA   LEVELC,Y
         CLC
         ADC   #$0057
         TAX
AFFLEVL7 LDA   LEVELCO1,Y
         STA   AFTAE
         JSR   AFTCAR     ; AFFICHE
         INY
         INY
         CPY   #$0006
         BNE   AFFLEVL6
         STZ   LEVELC
         RTS

MAJLEVEL JSR   CONVBUF    ; MISE A JOUR DE LA DESCRIPTION DU NIVEAU
         LDA   OLDLEVEL   ; PLACE L'ANCIEN NIVEAU DANS LE TABLEAU
         JSR   COPYDES
         LDA   LEVEL
         JSR   COPYLVL    ; COPIE DE LA TABLE DE DESCRIPTION DU NIVEAU A
         JSR   CONVLVL    ; CONVERTI LES VALEURS
         RTS

MAJPICT  LDA   LEVEL      ; DOIT ON CHANGER LE DECOR
         ASL
         TAX
         LDA   HEXDEC,X
         AND   #$00FF
         STA   MAJPICLE
         LDA   OLDLEVEL
         ASL
         TAX
         LDA   HEXDEC,X
         AND   #$00FF
         CMP   MAJPICLE
         BNE   MAJPICT2
         RTS
MAJPICT2 LDA   LEVEL      ; CHARGE LE FICHIER NIVlevel
         STA   level
         JSR   loadNIV
         JSR   MAKESPR    ; CREATION DE LA PLANCHE SPRITE AVEC PALETTE ET ZONE ROSE
         RTS

MAJPICLE HEX   0000

LEVELCO1 HEX   4615,4A15,4E15 ; AFFICHAGE GAUCHE
LEVELCO2 HEX   CA2A,CE2A,D22A ; AFFICHAGE MILIEU
LEVELCO3 HEX   CE15,D215,D615 ; AFFICHAGE DROITE

**************  SELECT GROUND

ECR0500  LDX   SECR2+1    ; GROUND : SURFACE
         LDA   #ECR0501
         STA   BUMPER5+1
         JMP   BUMPER
ECR0501  NOP
         LDA   POSX
         SEC
         SBC   #$006A     ; 106
         TAX
         LDA   ZONEGRH,X
         AND   #$00FF
         BEQ   ECR0502    ; RIEN
         DEC
         TAY              ; SAUVEGARDE
         LDA   POSY
         SEC
         SBC   #$0015     ; 21
         TAX
         LDA   ZONEGRV,X
         AND   #$00FF
         BEQ   ECR0502    ; RIEN
         STY   GRZONE
         DEC
         ASL
         ASL              ; *4
         CLC
         ADC   GRZONE
         STA   GRZONE
         JSR   SEBLCKG    ; AFFICHAGE BLOCK DANS LE MENU
ECR0502  JSR   CLNGROU    ; NETTOY
         LDA   DROITE
         STA   ECRAN
         JSR   SAUV
         JMP   SOURIS1

GRZONE   HEX   0000

***************  SELECT ITEM

ECR0600  LDX   SECR2+1    ; ITEM
         LDA   #ECR0601
         STA   BUMPER5+1
         JMP   BUMPER
ECR0601  NOP
         LDA   POSX
         SEC
         SBC   #$005C     ; 92
         TAX
         LDA   ZONEGRH,X
         AND   #$00FF
         BEQ   ECR0602    ; RIEN
         DEC
         TAY              ; SAUVEGARDE
         LDA   POSY
         SEC
         SBC   #$0028     ; 40
         TAX
         LDA   ZONEGRV,X
         AND   #$00FF
         BEQ   ECR0602    ; RIEN
         STY   ITZONE
         DEC
         ASL
         TAX
         LDA   MULCINQ,X  ; *5
         CLC
         ADC   ITZONE
         ASL
         TAX
         LDA   ITCVTAB,X
         STA   ITZONE
         CMP   #$0032     ; TINIES
         BEQ   ECR0603
         CMP   #$001D     ; BOMBE
         BEQ   ECR0603
         CMP   #$0015     ; SLEEPER
         BEQ   ECR0603
         CMP   #$0019     ; TELEPORTEUR
         BEQ   ECR0603
         CMP   #$0021     ; PORTE
         BEQ   ECR0603
         CMP   #$0025     ; INTERRUPTEUR
         BEQ   ECR0603
         JSR   SEBLCKI    ; AFFICHAGE BLOCK DANS LE MENU
ECR0602  JSR   CLNITEM    ; NETTOY
         LDA   DROITE
         STA   ECRAN
         JSR   SAUV
         JMP   SOURIS1
ECR0603  JSR   CLNITEM    ; NETTOY
         LDA   #$0007     ; COULEUR NECESSAIRE
         JMP   PICT1

ITZONE   HEX   3300       ; TINIES BLEU
MULCINQ  HEX   0000,0500,0A00,0F00,1400,1900,1E00

ITCVTAB  HEX   3200,1D00,2E00,2F00,3000
         HEX   2900,2A00,2B00,2C00,1400
         HEX   1500,1900,2100,2500,2D00

****************  SELECT COLOR

ECR0700  LDX   SECR2+1    ; COLOR
         LDA   #ECR0701
         STA   BUMPER5+1
         JMP   BUMPER
ECR0701  NOP
         LDA   POSX
         SEC
         SBC   #$006A     ; 106
         TAX
         LDA   ZONEGRH,X
         AND   #$00FF
         BEQ   ECR0702    ; RIEN
         DEC
         ASL
         TAX
         LDA   COLOCVT,X  ; TABLE DE CONVERSION COULEUR-INDICE
         CLC
         ADC   ITZONE
         STA   ITZONE
         JSR   CLNCOLO    ; NETTOY
         JSR   SEBLCKI    ; AFFICHAGE DU BLOC DANS LE MENU
         LDA   DROITE
         JMP   PICT1
ECR0702  JMP   SOURIS1

COLOCVT  HEX   0100,0000,0300,0200

****************  MENU

ECR0800  LDX   SECR2+1    ; MENU : LOAD
         LDA   #ECR0801
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0801  NOP
         lda   #pTAB
         ldx   ptrTAB+1
         JSR   loadFILE
         LDA   LEVEL
         JSR   COPYLVL    ; COPIE DE LA TABLE DE DESCRIPTION DU NIVEAU A
         JSR   CONVLVL    ; CONVERTI LES VALEURS
         lda   LEVEL      ; MISE A JOUR DU TEMPS
         sta   OLDLEVEL
         sta   level
         jsr   doTIME     ; +
         lda   minutes    ; +
         sta   TIMEMIN    ; +
         lda   secondes   ; +
         sta   TIMESEC    ; +
* LDA TIMEMIN
* STA minutes
* LDA TIMESEC
* STA secondes
* JSR putTIME
         JMP   SOURIS1

ECR0810  LDX   SECR2+1    ; MENU : SAVE
         LDA   #ECR0811
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0811  NOP
         JSR   CONVBUF    ; MISE A JOUR DE LA DESCRIPTION DU NIVEAU
         LDA   LEVEL      ; PLACE L'ANCIEN NIVEAU DANS LE TABLEAU
         JSR   COPYDES
         lda   LEVEL      ; CHARGE LE NOUVEAU TIME
         sta   OLDLEVEL
         sta   level
         lda   TIMEMIN    ; +
         sta   minutes    ; +
         lda   TIMESEC    ; +
         sta   secondes   ; +
         jsr   putTIME    ; +
* jsr doTIME
* LDA minutes
* STA TIMEMIN
* LDA secondes
* STA TIMESEC
         JSR   saveFILE
         JMP   SOURIS1

ECR0820  LDX   SECR2+1    ; MENU : CUT
         LDA   #ECR0821
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0821  NOP
         JSR   CONVBUF    ; CONV GROU+ITE -> LEVEL
         JSR   CUT        ; COPY LEVEL -> CLIPBOARD
         LDA   #$0001
         STA   CLIPFLAG
         JMP   SOURIS1

ECR0830  LDX   SECR2+1    ; MENU : PASTE
         LDA   #ECR0831
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0831  NOP
         LDA   CLIPFLAG
         BEQ   ECR0832
         JSR   PASTE      ; COPY CLIPBOARD -> LEVEL
         JSR   CONVLVL    ; CONV LEVEL -> GROU+ITE
ECR0832  JMP   SOURIS1

CLIPFLAG HEX   0000       ; 0:VIDE, 1:PLEIN

ECR0840  LDX   SECR2+1    ; MENU : ABOUT
         LDA   #ECR0841
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0841  NOP
         JSR   CLNMENU
         JMP   ABOUT

ECR0850  LDX   SECR2+1    ; MENU : OK
         LDA   #ECR0851
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0851  NOP
         JSR   CLNMENU    ; NETTOY
         LDA   DROITE
         JMP   PICT1

*************** DOC

ECR0900  LDX   SECR2+1    ; <
         LDA   #ECR0901
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0901  NOP
         LDA   AFTIND
         BEQ   ECR0902
         DEC
         STA   AFTIND
         JSR   AFTPAG     ; AFICHAGE PAGE PRECEDENTE
ECR0902  JMP   SOURIS1

ECR0910  LDX   SECR2+1    ; >
         LDA   #ECR0911
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0911  NOP
         LDA   AFTIND
ECR0912  CMP   #$0006     ; NB DE PAGES MAXI
         BEQ   ECR0913
         INC
         STA   AFTIND
         JSR   AFTPAG     ; AFFICHAGE PAGE SUIVANTE
ECR0913  JMP   SOURIS1

ECR0920  LDX   SECR2+1    ; o
         LDA   #ECR0921
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0921  NOP
         LDA   AFTIND     ; SAUT A LA 1ere PAGE
         BEQ   ECR0922
         STZ   AFTIND
         JSR   AFTPAG
ECR0922  JMP   SOURIS1

ECR0930  LDX   SECR2+1    ; OK
         LDA   #ECR0931
         STA   BUMPER5+1
         JMP   BUMPER0
ECR0931  NOP
         STZ   AFTIND
         JMP   LP4        ; FADE OUT ET RETOUR A L'ECRAN PRINCIPAL

DOCADR   HEX   0000       ; ADRESSE DU TEXTE DOCU (FRANCAIS/ANGLAIS)

*************  QUIT

ECR1000  LDX   SECR2+1    ; QUIT : QUIT
         LDA   #ECR1001
         STA   BUMPER5+1
         JMP   BUMPER0
ECR1001  NOP
         JSR   CLNQUIT
         JMP   initOFF    ; GOOD BYE

ECR1010  LDX   SECR2+1    ; QUIT : OK
         LDA   #ECR1011
         STA   BUMPER5+1
         JMP   BUMPER0
ECR1011  NOP
         JSR   CLNQUIT    ; NETTOY
         LDA   DROITE
         JMP   PICT1

************  WARNING

ECR1100  LDX   SECR2+1    ; WARNING : OK
         LDA   #ECR1101
         STA   BUMPER5+1
         JMP   BUMPER
ECR1101  NOP
         JSR   CLNWARN    ; NETTOY
         LDA   DROITE
         JMP   PICT

************ ECRAN ABOUT ***********

ABOUT    JSR   fadeOUT    ; AFFICHE L'ECRAN ABOUT
* LDA ptrABOUT+1
* LDY #$0000
* JSR fadeIN
         jsr   aboutMENU

         JSR   SBOUT      ; ATTEND UN CLICK DE SOURIS

LP4      JSR   fadeOUT
         LDA   ptrNIV+1
         AND   #$FF00
         ORA   #$007E
         STA   LP3+2
         LDX   #$001F      ; PALETTE IMAGE
LP3      LDAL  $047E00,X
         STAL  $019E00,X
         DEX
         DEX
         BPL   LP3
         LDA   DROITE
         JMP   PICT       ; REVIENS A L'IMAGE

*************  VERIFICATION DU CONTENU DU NIVEAU  *************

VERIFOK  LDX   #$0010
         LDA   #$0000
VERIFO1  STA   TINIEV,X   ; REMISE A ZERO
         DEX
         DEX
         BPL   VERIFO1
         LDY   #$019E     ; ON COMPTE CHAQUE OCCURENCE DES TINIES & SLEEPER
VERIFO2  LDA   GROUBUF,Y
         LDX   #$0000
         CMP   #$0032     ; TINIE VERT
         BEQ   VERIFO3
         LDX   #$0002
         CMP   #$0033     ; TINIE BLEU
         BEQ   VERIFO3
         LDX   #$0004
         CMP   #$0034     ; TINIE ROUGE
         BEQ   VERIFO3
         LDX   #$0006
         CMP   #$0035     ; TINIE JAUNE
         BEQ   VERIFO3
         LDX   #$0008
         CMP   #$0015     ; SLEEPER VERT
         BEQ   VERIFO3
         LDX   #$000A
         CMP   #$0016     ; SLEEPER BLEU
         BEQ   VERIFO3
         LDX   #$000C
         CMP   #$0017     ; SLEEPER ROUGE
         BEQ   VERIFO3
         LDX   #$000E
         CMP   #$0018     ; SLEEPER JAUNE
         BEQ   VERIFO3
         LDX   #$0010
VERIFO3  INC   TINIEV,X
         DEY
         DEY
         BPL   VERIFO2
         LDA   SLEEPV      ; ON VERIFIE
         CMP   TINIEV
         BMI   VERIFO4
         LDA   SLEEPB
         CMP   TINIEB
         BMI   VERIFO5
         LDA   SLEEPR
         CMP   TINIER
         BMI   VERIFO6
         LDA   SLEEPJ
         CMP   TINIEJ
         BMI   VERIFO7
         LDA   TINIEV
         ORA   TINIEB
         ORA   TINIER
         ORA   TINIEJ
         BEQ   VERIFO8
         CLC
         RTS              ; OK PAS DE PROBLEME
VERIFO4  LDA   #$0001     ; PAS ASSEZ DE SLEEPER VERT
         STA   ERRORFL
         SEC
         RTS
VERIFO5  LDA   #$0002     ; PAS ASSEZ DE SLEEPER BLEU
         STA   ERRORFL
         SEC
         RTS
VERIFO6  LDA   #$0003     ; PAS ASSEZ DE SLEEPER ROUGE
         STA   ERRORFL
         SEC
         RTS
VERIFO7  LDA   #$0004     ; PAS ASSEZ DE SLEEPER JAUNE
         STA   ERRORFL
         SEC
         RTS
VERIFO8  LDA   #$0005     ; PAS DE TINIES !!
         STA   ERRORFL
         SEC
         RTS

TINIEV   HEX   0000       ; NOMBRE DE TINIES
TINIEB   HEX   0000
TINIER   HEX   0000
TINIEJ   HEX   0000

SLEEPV   HEX   0000       ; NOMBRE DE SLEEPER
SLEEPB   HEX   0000
SLEEPR   HEX   0000
SLEEPJ   HEX   0000
ERRORFL  HEX   0000

ERRTINIE LDA   #ERRMES1   ; PAS DE TINIES
         LDX   #$2A18
         JSR   ERRAFF
         LDA   #ERRMES2
         LDX   #$2DD8
         JSR   ERRAFF
         LDA   #ERRMES3
         LDX   #$3198
         JSR   ERRAFF
         LDA   #TEXTEFRD
         STA   AFTLIG1+1
         RTS

ERRSLVR  LDA   #ERRMES5
         LDX   #$3198
         JSR   ERRAFF
         JMP   ERRSLEEP
ERRSLBL  LDA   #ERRMES7
         LDX   #$3198
         JSR   ERRAFF
         JMP   ERRSLEEP
ERRSLRG  LDA   #ERRMES6
         LDX   #$3198
         JSR   ERRAFF
         JMP   ERRSLEEP
ERRSLJN  LDA   #ERRMES8
         LDX   #$3198
         JSR   ERRAFF
         JMP   ERRSLEEP

ERRSLEEP LDA   #ERRMES1   ; PROBLEME DE SLEEPER
         LDX   #$2A18
         JSR   ERRAFF
         LDA   #ERRMES4
         LDX   #$2DD8
         JSR   ERRAFF
         LDA   #TEXTEFRD
         STA   AFTLIG1+1
         RTS

ERRAFF   STX   AFTAE
         STA   AFTLIG1+1
         LDY   #$0000
         JSR   AFTLIG1
         RTS

ERRMES1  ASC   "  IMPOSSIBLE !  ",8D
ERRMES2  ASC   "IL N'Y A PAS DE ",8D
ERRMES3  ASC   " TINIES EN JEU. ",8D
ERRMES4  ASC   "IL  MANQUE  DES ",8D
ERRMES5  ASC   " SLEEPER  VERTS.",8D
ERRMES6  ASC   " SLEEPER ROUGES.",8D
ERRMES7  ASC   " SLEEPER  BLEUS.",8D
ERRMES8  ASC   " SLEEPER JAUNES.",8D

ERRMESU  ASC   "  IMPOSSIBLE !  ",8D
         ASC   "THERE IS NOT ANY",8D
         ASC   "TINIES ON GAME. ",8D
         ASC   "THERE IS A LACK ",8D
         ASC   "OF GREEN SLEEPER",8D
         ASC   "OF RED SLEEPER. ",8D
         ASC   "OF BLUE SLEEPER.",8D
         ASC   "OF YELOW SLEEPER",8D

*************  GESTION DU CONTENU DES NIVEAUX

COPYLVL  ASL              ; COPY DU Aeme NIVEAU DANS LEVELBUF
         TAX
         LDA   MULDCH,X   ; *208
         TAX
         LDY   #$0000
COPYLVL1 LDAL  $058000,X
         STA   LEVELBUF,Y
         INX
         INX
         INY
         INY
         CPY   #$00D0
         BNE   COPYLVL1
         RTS

COPYDES  ASL              ; COPY DE LEVELBUF A LA PLACE DU Aeme NIVEAU
         TAX
         LDA   MULDCH,X   ; *208
         TAX
         LDY   #$0000
COPYDES1 LDA   LEVELBUF,Y
COPYDES2 STAL  $058000,X
         INX
         INX
         INY
         INY
         CPY   #$00D0
         BNE   COPYDES1
         RTS

CONVLVL  LDX   #$0000     ; CONVERSION LEVELBUF -> GROUBUF,ITEBUF
         LDY   #$0000
CONVLVL1 LDA   LEVELBUF,Y ; GROUND
         AND   #$00FF
         STA   GROUBUF,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF1,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF2,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF3,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF4,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF5,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF6,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   GROUBUF7,X
         INY
         INX
         INX
         CPX   #$001A     ; 13*2
         BNE   CONVLVL1
         LDX   #$0000
CONVLVL2 LDA   LEVELBUF,Y ; ITEM
         AND   #$00FF
         STA   ITEMBUF,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF1,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF2,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF3,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF4,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF5,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF6,X
         INY
         LDA   LEVELBUF,Y
         AND   #$00FF
         STA   ITEMBUF7,X
         INY
         INX
         INX
         CPX   #$001A     ; 13*2
         BNE   CONVLVL2
         LDX   #$00CE     ; CONVERSION DE LA PARTIE GROUND
CONVLVL3 LDA   GROUBUF,X
         CMP   #$00FF
         BNE   CONVLVL7
         LDA   #$0031     ; VIDE
         BRA   CONVLVL5
CONVLVL7 ASL
         TAY
         LDA   CONVLBG,Y
CONVLVL5 STA   GROUBUF,X
         DEX
         DEX
         BPL   CONVLVL3
         LDX   #$00CE     ; CONVERSION DE LA PARTIE ITEM
CONVLVL4 LDA   ITEMBUF,X
         CMP   #$00FF
         BNE   CONVLVL8
         LDA   #$0031     ; VIDE
         BRA   CONVLVL6
CONVLVL8 ASL
         TAY
         LDA   CONVLBI,Y
CONVLVL6 STA   ITEMBUF,X
         DEX
         DEX
         BPL   CONVLVL4
         RTS

CONVBUF  LDY   #$0000      ; CONVERSION BUFF -> LEVEL
         LDX   #$0000
CONVBUF1 LDA   GROUBUF,X  ; GROUND
         AND   #$00FF
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF1,X
         AND   #$00FF
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF2,X
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF3,X
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF4,X
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF5,X
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF6,X
         STA   LEVELBUF,Y
         INY
         LDA   GROUBUF7,X
         STA   LEVELBUF,Y
         INY
         INX
         INX
         CPX   #$001A     ; 13*2
         BNE   CONVBUF1
         LDX   #$0000
CONVBUF2 LDA   ITEMBUF,X  ; GROUND
         AND   #$00FF
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF1,X
         AND   #$00FF
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF2,X
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF3,X
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF4,X
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF5,X
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF6,X
         STA   LEVELBUF,Y
         INY
         LDA   ITEMBUF7,X
         STA   LEVELBUF,Y
         INY
         INX
         INX
         CPX   #$001A     ; 13*2
         BNE   CONVBUF2
         LDX   #$0000     ; CONVERSION CODE BUF -> CODE LVL
CONVBUF3 LDA   LEVELBUF,X
         AND   #$00FF
         ASL
         TAY
         LDA   CONVBULV,Y
         STA   CONVBUF4+1
         LDA   LEVELBUF,X
         AND   #$FF00
CONVBUF4 ORA   #$00FF
         STA   LEVELBUF,X
         INX
         CPX   #$00D0     ; 13*8 *2
         BNE   CONVBUF3
         RTS

CUT      LDX   #$00CE     ; COPY LEVEL -> CLIPBOARD
CUT1     LDA   LEVELBUF,X
         STA   CLIPBBUF,X
         DEX
         DEX
         BPL   CUT1
         RTS

PASTE    LDX   #$00CE     ; COPY CLIPBOARD -> LEVEL
PASTE1   LDA   CLIPBBUF,X
         STA   LEVELBUF,X
         DEX
         DEX
         BPL   PASTE1
         RTS

CONVLBG  HEX   0000,0100,0200,0300,0700,0D00,3600,0600,0400,1300,0B00
         HEX   0F00,0500,0800,1200,0A00,1000,1100,0900,0E00,0C00

CONVLBI  HEX   3200,3300,3400,3500,1500,1600,1700,1800,1900,1A00,1B00,1C00,1D00
         HEX   1E00,1F00,2000,2100,2200,2300,2400,2500,2600,2700
         HEX   2800,2900,2A00,2B00,2C00,2D00,2E00,2F00,3000,1400

CONVBULV HEX   0000,0100,0200,0300,0800,0C00,0700,0400,0D00,1200
         HEX   0F00,0A00,1400,0500,1300,0B00,1000,1100,0E00,0900
         HEX   2000,0400,0500,0600,0700,0800,0900,0A00,0B00,0C00
         HEX   0D00,0E00,0F00,1000,1100,1200,1300,1400,1500,1600
         HEX   1700,1800,1900,1A00,1B00,1C00,1D00,1E00,1F00,FF00
         HEX   0000,0100,0200,0300,0600

MULDCH   HEX   0000,D000,A001,7002,4003,1004,E004,B005,8006,5007,2008,F008,C009,900A,600B,300C
         HEX   000D,D00D,A00E,700F,4010,1011,E011,B012,8013,5014,2015,F015,C016,9017,6018,3019
         HEX   001A,D01A,A01B,701C,401D,101E,E01E,B01F,8020,5021,2022,F022,C023,9024,6025,3026
         HEX   0027,D027,A028,7029,402A,102B,E02B,B02C,802D,502E,202F,F02F,C030,9031,6032,3033
         HEX   0034,D034,A035,7036,4037,1038,E038,B039,803A,503B,203C,F03C,C03D,903E,603F,3040
         HEX   0041,D041,A042,7043,4044,1045,E045,B046,8047,5048,2049,F049,C04A,904B,604C,304D
         HEX   004E,D04E,A04F,7050,4051,1052,E052,B053,8054,5055,2056,F056,C057,9058,6059,305A

GROUBUF  HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF1 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF2 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF3 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF4 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF5 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF6 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
GROUBUF7 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000

ITEMBUF  HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF1 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF2 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF3 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF4 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF5 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF6 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
ITEMBUF7 HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000

LEVELBUF HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,0000

CLIPBBUF HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,0000

***************************************************************************
******************************  DATA  *************************************
***************************************************************************

************  BUMPER MANAGER  ************  PAVE

BUMPER   LDA   #$0000     ; PREMIERE PLANCHE SPRITE
         BRA   BUMPER7
BUMPER0  LDA   #$0001     ; DEUXIEME PLANCHE SPRITE
BUMPER7  STA   PLANCHE
         LDA   FLAGTAB,X
         BEQ   BUMPER2
         LDA   BOUT
         BEQ   BUMPER1
BUMPER6  JMP   SOURIS
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
         BEQ   BUMPER6    ; JMP SOURIS
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

ZONESCR  HEX   01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01
         HEX   02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
         HEX   03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03
         HEX   04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
         HEX   05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05
         HEX   06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06,06
         HEX   07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07
         HEX   08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08
         HEX   09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09,09
         HEX   0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A,0A
         HEX   0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B,0B
         HEX   0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C,0C
         HEX   0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D,0D

ZONEGRH  HEX   01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,00,00,00,00
         HEX   02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,00,00,00,00
         HEX   03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,00,00,00,00
         HEX   04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00
         HEX   05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,00,00,00,00

ZONEGRV  HEX   01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,00,00,00
         HEX   02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,00,00,00
         HEX   03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,00,00,00
         HEX   04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00
         HEX   05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,00,00,00

         HEX   0B00       ; MAIN GAUCHE     NB DE BOUTONS DANS ECRAN1
ECR01TAB HEX   0600,2A00,0600,1700 ; TIME    TABLEAU DES BOUTONS POUR ECRAN1
         HEX   0700,2800,2000,3100 ; LEVEL     X0,X1 Y0,Y1
         HEX   0800,2800,3A00,4500 ; PLAY
         HEX   0400,2C00,4E00,7200 ; SELECT
         HEX   0800,2800,7600,8100 ; v/^
         HEX   0800,2800,8A00,9500 ; MENU
         HEX   0800,2800,9A00,A500 ; DOCU
         HEX   0800,2800,AA00,B500 ; QUIT
         HEX   0800,1400,B900,C400 ; <
         HEX   1C00,2800,B900,C400 ; >
         HEX   3400,3B01,0400,C300 ; ZONE QUADRILLEE

ECR01DAT HEX   0700,0500,452B,7345,6045 ; TIME  LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE RELEVE, @ SPRITE ENFONCE
         HEX   0900,0500,833B,3349,2049 ; LEVEL
         HEX   0900,0B00,4444,F34C,E04C ; PLAY
         HEX   0B00,0500,2264,7754,6054 ; SELECT
         HEX   0900,0B00,C469,3358,2058 ; v/^
         HEX   0900,0B00,4476,B35F,A05F ; MENU
         HEX   0900,0B00,4480,3367,2067 ; DOCU
         HEX   0900,0B00,448A,B36E,A06E ; QUIT
         HEX   0400,0B00,A493,3276,2076 ; <
         HEX   0400,0B00,AE93,3B76,2976 ; >
         HEX   0100,0100,009F,009F,009F ; SPRITE INVISIBLE

         HEX   0B00       ; MAIN DROITE
ECR02TAB HEX   1601,3A01,0600,1700 ; TIME
         HEX   1701,3801,2000,3100 ; LEVEL
         HEX   1801,3801,3A00,4500 ; PLAY
         HEX   1401,3C01,4E00,7200 ; SELECT
         HEX   1801,3801,7600,8100 ; v/^
         HEX   1801,3801,8A00,9500 ; MENU
         HEX   1801,3801,9A00,A500 ; DOCU
         HEX   1801,3801,AA00,B500 ; QUIT
         HEX   1801,2401,B900,C400 ; <
         HEX   2C01,3801,B900,C400 ; >
         HEX   0400,0B01,0400,C300 ; ZONE QUDRILLEE

ECR02DAT HEX   0700,0500,CD2B,7345,6045 ; TIME  LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE RELEVE, @ SPRITE ENFONCE
         HEX   0900,0500,0B3C,3349,2049 ; LEVEL
         HEX   0900,0B00,CC44,F34C,E04C ; PLAY
         HEX   0B00,0500,AA64,7754,6054 ; SELECT
         HEX   0900,0B00,4C6A,3358,2058 ; v/^
         HEX   0900,0B00,CC76,B35F,A05F ; MENU
         HEX   0900,0B00,CC80,3367,2067 ; DOCU
         HEX   0900,0B00,CC8A,B36E,A06E ; QUIT
         HEX   0400,0B00,2C94,3276,2076 ; <
         HEX   0400,0B00,3694,3B76,2976 ; >
         HEX   0100,0100,009F,009F,009F

         HEX   0500       ; TIME
ECR03TAB HEX   8600,9100,5000,5900 ; <<
         HEX   9400,9F00,5000,5900 ; >>
         HEX   A200,AD00,5000,5900 ; <
         HEX   B000,BB00,5000,5900 ; >
         HEX   9000,B100,5E00,6900 ; OK

ECR03DAT HEX   0300,0900,4352,4658,4D58  ; <<
         HEX   0300,0900,4A52,865E,8D5E  ; >>
         HEX   0300,0900,5152,C664,CD64  ; <
         HEX   0300,0900,5852,066B,0D6B  ; >
         HEX   0900,0B00,085B,8645,4476  ; OK

         HEX   0500       ; LEVEL
ECR04TAB HEX   8600,9100,5000,5900 ; <<
         HEX   9400,9F00,5000,5900 ; <
         HEX   A200,AD00,5000,5900 ; >
         HEX   B000,BB00,5000,5900 ; >>
         HEX   9000,B100,5E00,6900 ; OK

ECR04DAT HEX   0300,0900,4352,4658,4D58 ; <<
         HEX   0300,0900,4A52,C664,CD64 ; <
         HEX   0300,0900,5152,066B,0D6B ; >
         HEX   0300,0900,5852,865E,8D5E ; >>
         HEX   0900,0B00,085B,8645,4476 ; OK

         HEX   0100       ; SELECT GROUND
ECR05TAB HEX   6A00,D500,1500,9900 ; GROUNDS

ECR05DAT HEX   0100,0100,009F,009F,009F

         HEX   0100       ; SELECT ITEM
ECR06TAB HEX   5C00,E400,2800,7600 ; ITEMS

ECR06DAT HEX   0100,0100,009F,009F,009F

         HEX   0100       ; SELECT COLOR
ECR07TAB HEX   6A00,D500,3C00,4F00 ; COLORS

ECR07DAT HEX   0100,0100,009F,009F,009F

         HEX   0600       ; MENU
ECR08TAB HEX   5E00,A200,4800,5300 ; LOAD
         HEX   5E00,A200,5600,6100 ; SAVE
         HEX   B800,E400,4100,4C00 ; CUT
         HEX   B800,E400,4F00,5A00 ; PASTE
         HEX   B800,E400,5D00,6800 ; ABOUT
         HEX   9000,B100,6B00,7600 ; OK

ECR08DAT HEX   1100,0B00,2F4D,0D42,8D49 ; LOAD
         HEX   1100,0B00,EF55,0D51,8D58 ; SAVE
         HEX   0B00,0B00,FC48,6076,7776 ; CUT
         HEX   0B00,0B00,BC51,8E76,A576 ; PASTE
         HEX   0B00,0B00,7C5A,0D6F,246F ; ABOUT
         HEX   0900,0B00,2863,ED31,0D3A ; OK

         HEX   0400       ; DOCU
ECR09TAB HEX   6C00,7700,B600,BF00 ; <-
         HEX   9000,9B00,B600,BF00 ; ->
         HEX   8100,8600,B800,BD00 ; o
         HEX   1201,2F01,B700,BE00 ; EXIT

ECR09DAT HEX   0300,0900,F691,7052,304C ; <-
         HEX   0300,0900,0892,7752,374C ; ->
         HEX   0200,0500,4093,3A01,9A05 ; o
         HEX   0800,0700,E892,3042,3047 ; EXIT

         HEX   0200       ; QUIT
ECR10TAB HEX   7E00,C300,4300,4E00 ; QUIT
         HEX   9000,B100,5300,5E00 ; OK

ECR10DAT HEX   1200,0B00,1F4A,0D60,8D67 ; QUIT
         HEX   0900,0B00,2854,ED31,0D3A ; OK

         HEX   0100       ; WARNING
ECR11TAB HEX   9000,B000,5A00,6500 ; OK

ECR11DAT HEX   0900,0B00,8858,8645,4476 ; OK

****************

ECRTAB   DA    ECR01TAB,ECR02TAB,ECR03TAB,ECR04TAB  ; ADRESSES DES TABLEAUX
         DA    ECR05TAB,ECR06TAB,ECR07TAB,ECR08TAB
         DA    ECR09TAB,ECR10TAB,ECR11TAB

ECRDAT   DA    ECR01DAT,ECR02DAT,ECR03DAT,ECR04DAT  ; ADRESSE DES DONNEES BUMPERS
         DA    ECR05DAT,ECR06DAT,ECR07DAT,ECR08DAT
         DA    ECR09DAT,ECR10DAT,ECR11DAT

ECRDESA  DA    ECRDES1,ECRDES2,ECRDES3,ECRDES4 ; ADRESSE POUR LES DESTINATIONS
         DA    ECRDES5,ECRDES6,ECRDES7,ECRDES8
         DA    ECRDES9,ECRDES10,ECRDES11

****

ECRDES1  DA    ECR0100,ECR0110,ECR0120,ECR0130,ECR0140 ; MAIN GAUCHE
         DA    ECR0150,ECR0160,ECR0170,ECR0180,ECR0190
         DA    ECR01B0

ECRDES2  DA    ECR0100,ECR0110,ECR0120,ECR0130,ECR0140 ; MAIN DROITE
         DA    ECR0150,ECR0160,ECR0170,ECR0180,ECR0190
         DA    ECR01A0

ECRDES3  DA    ECR0300,ECR0310,ECR0320,ECR0330,ECR0340 ; TIME

ECRDES4  DA    ECR0400,ECR0410,ECR0420,ECR0430,ECR0440 ; LEVEL

ECRDES5  DA    ECR0500    ; SELECT GROUND

ECRDES6  DA    ECR0600    ; SELECT ITEM

ECRDES7  DA    ECR0700    ; SELECT COLOR

ECRDES8  DA    ECR0800,ECR0810,ECR0820,ECR0830,ECR0840 ; MENU
         DA    ECR0850

ECRDES9  DA    ECR0900,ECR0910,ECR0920,ECR0930 ; DOCU

ECRDES10 DA    ECR1000,ECR1010 ; QUIT

ECRDES11 DA    ECR1100    ; WARNING

*********************  SOUS ROUTINES SOURIS  **************************

DEC      HEX   000000000000  ; DECOR SOUS LE POINTEUR
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000

PTPAI    HEX   AAAAAAAA0000
         HEX   0A00000A0000  ; POINTEUR POSITION PAIRE
         HEX   00A000A00000
         HEX   000A00A00000
         HEX   0000AA000000
         HEX   00000A000000

PTPAIMA  HEX   00000000FFFF
         HEX   F0000000FFFF  ; MASQUE POSITION PAIRE
         HEX   FF00000FFFFF
         HEX   FFF0000FFFFF
         HEX   FFFF00FFFFFF
         HEX   FFFFF0FFFFFF

PTIMP    HEX   0AAAAAAAA000
         HEX   00A00000A000  ; POINTEUR POSITION IMPAIRE
         HEX   000A000A0000
         HEX   0000A00A0000
         HEX   00000AA00000
         HEX   000000A00000

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

TABLE    HEX   0000A0004001E00180022003C00360040005A0054006E00680072008C0086009000AA00A400BE00B
         HEX   800C200DC00D600E000FA00F4010E01080112012C01260130014A0144015E01580162017C0176018
         HEX   0019A019401AE01A801B201CC01C601D001EA01E401FE01F80202021C02160220023A0234024E024
         HEX   80252026C02660270028A0284029E029802A202BC02B602C002DA02D402EE02E802F2030C0306031
         HEX   0032A0324033E03380342035C03560360037A0374038E0388039203AC03A603B003CA03C403DE03D
         HEX   803E203FC03F60400041A0414042E04280432044C04460450046A0464047E04780482049C049604A
         HEX   004BA04B404CE04C804D204EC04E604F0050A0504051E05180522053C05360540055A0554056E056
         HEX   80572058C0586059005AA05A405BE05B805C205DC05D605E005FA05F4060E06080612062C0626063
         HEX   0064A0644065E06580662067C06760680069A069406AE06A806B206CC06C606D006EA06E406FE06F
         HEX   80702071C07160720073A0734074E07480752076C07660770078A0784079E079807A207BC07B607C

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

SBOUT    LDAL  $00C026    ; ON ATTEND UN CLICK DE SOURIS ($C027)
         BPL   SBOUT      ; ET LE RELACHEMENT
         AND   #$0200
         BEQ   SBOUT1
         LDAL  $00C024
         BRA   SBOUT
SBOUT1   LDAL  $00C023    ; DONNEES SOURIS PRETE   $C024 : DELTA X
         LDAL  $00C023    ;                        $C024 : DELTA Y
         BMI   SBOUT      ; LECTURE SUR Y DE BOUTON 1, BIT 7=0 <=> ENFONCE
SBOUT2   LDAL  $00C026
         BPL   SBOUT2
         AND   #$0200
         BEQ   SBOUT3
         LDAL  $00C024
         BRA   SBOUT2
SBOUT3   LDAL  $00C023    ; DONNEES SOURIS PRETE   $C024 : DELTA X
         LDAL  $00C023    ;                        $C024 : DELTA Y
         BPL   SBOUT2     ; LECTURE SUR Y DE BOUTON 1, BIT 7=0 <=> ENFONCE
         RTS

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
DESS4    STAL  $E12000,X  ; PROUT
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
SAUV1    LDAL  $E12000,X  ; PROUT
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
TRACE1   LDAL  $E12000,X  ; PROUT
TRACE2   AND   $A0A0,Y    ; ET AVEC LE MASQUE
TRACE3   ORA   $A0A0,Y    ; OU AVEC LE MOTIF
TRACE4   STAL  $E12000,X  ; PROUT
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

*************  AFFICHAGE BUMPER  *************************

AFFSPRR  INC   AFFSPRF    ; BUMPER RELEVE
AFFSPRE  LDA   PLANCHE    ; BUMPER ENFONCE
         BEQ   AFFSPR6
         LDA   #$8000
         STA   AFFSPR4+1
AFFSPR6  LDA   ECRAN      ; ECRAN SELECTION GROUND,ITEM,COULEUR
AFFSPR0  DEC
         ASL
         TAX
         LDA   ECRDAT,X   ; ADRESSE DU TABLEAU DES DATA POUR L'ECRAN CONCERNE
         STA   AFFSPR1+1
         LDA   SECR2+1    ; CONTIENT LE NUMERO DU BUMPER (*2)
         ASL
         ASL              ; *5
         CLC
         ADC   SECR2+1
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
         LDA   AFFSPRF    ; FLAG DE AFFSPR
         BEQ   SECR18     ; ON DESSINE LE SPRITE RELEVE
SECR17   LDA\  $0000,X    ; @ SPRITE RELEVE
         CLC
         ADC   AFFSPR4+1
         STA   AFFSPR4+1
         BRA   AFFSPR2
SECR18   INX
         INX
         LDA\  $0000,X
         CLC              ; SPRITE ENFONCE
         ADC   AFFSPR4+1
         STA   AFFSPR4+1
AFFSPR2  LDY   #$0000     ; HAUTEUR-1
AFFSPR3  LDX   #$0000     ; NOMBRE DE *4-2
AFFSPR4  LDAL  $042000,X  ; ADRESSE SPRITE (BANC 04)
AFFSPR5  STAL  $E12000,X  ; ADRESSE ECRAN PROUT
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
         STZ   AFFSPR4+1  ; PAR DEFAUT PLANCHE 1
         RTS
AFFSPRF  HEX   0000       ; FLAG RELEVE/ENFONCE
PLANCHE  HEX   0000       ; 0:PLANCHE 1, 1:PLANCHE 2

********************  TRAITEMENT ET AFFICHAGE ECRANS  *********************

PICT1    LDX   ECRAN      ; PASSAGE ECRAN SANS CHANGEMENT DE FOND
         STX   OLDECR
         STA   ECRAN
         JSR   SAUV
         JMP   PICT21

PICT     PHA
         JSR   SAUV
         JSR   DESS       ; ENLEVE LE POINTEUR
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

ECRANTAB DA    ECRMAI1,ECRMAI2,ECRTIME,ECRLEVE,ECRGROU  ; NOM DES ECRANS POUR INIT D'AFFICHAGE
         DA    ECRITEM,ECRCOLO,ECRMENU,ECRDOCU,ECRQUIT
         DA    ECRWARN

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

ECRMAI1  NOP              ; CREATION DE L'ECRAN
         JSR   AFFGAUCH   ; AFFICHAGE A GAUCHE
         LDA   MAISELE
         BEQ   ECRMAI11
         LDA   ITZONE     ; AFFICHAGE BLOCK ITEM DANS LE MENU
         JSR   SEBLCKI
         JSR   AFFECRG    ; AFFICHE LE GROUND
         JSR   AFFECRI    ; AFFICHE LES ITEM PAR DESSUS
         BRA   ECRMAI12
ECRMAI11 LDA   GRZONE
         JSR   SEBLCKG    ; AFFICHAGE BLOCK GROUND DANS LE MENU
         JSR   AFFECRG    ; AFFICHE LE GROUND
ECRMAI12 JSR   WAITVBL    ; GRILLE
         JSR   GRILHM
         JSR   GRILHD
         JSR   GRILVM
         JSR   GRILVD
         JSR   EFFGAUCH   ; BANDE NOIRE
         JSR   AFFLEVL1   ; AFFICHAGE DU LEVEL
         JSR   AFFTIMG
         JSR   SAUV
         JMP   SOURIS1

ECRMAI2  NOP              ; CREATION DE L'ECRAN
         JSR   AFFDROIT   ; AFFICHAGE A DROITE
         LDA   MAISELE
         BEQ   ECRMAI21
         LDA   ITZONE     ; AFFICHAGE BLOCK ITEM DANS LE MENU
         JSR   SEBLCKI
         JSR   AFFECRG    ; AFFICHE LE FOND
         JSR   AFFECRI    ; AFFICHE LES ITEM
         BRA   ECRMAI22
ECRMAI21 LDA   GRZONE
         JSR   SEBLCKG    ; AFFICHAGE BLOCK GROUND DANS LE MENU
         JSR   AFFECRG    ; AFFICHE LE GROUND
ECRMAI22 JSR   WAITVBL    ; GRILLE
         JSR   GRILHM
         JSR   GRILHG
         JSR   GRILVM
         JSR   GRILVG
         JSR   EFFDROIT   ; BANDE NOIRE
         JSR   AFFLEVL3   ; AFFICHAGE DU LEVEL
         JSR   AFFTIMD
         JSR   SAUV
         JMP   SOURIS1

ECRTIME  NOP              ; CREATION DE L'ECRAN
         JSR   AFFTIME
         JSR   AFFTIMM
         JSR   SAUV
         JMP   SOURIS1

ECRLEVE  NOP              ; CREATION DE L'ECRAN
         JSR   AFFLEVE
         JSR   AFFLEVL2   ; AFFICHE LE NUMERO DU NIVEAU
         JSR   SAUV
         JMP   SOURIS1

ECRGROU  NOP              ; CREATION DE L'ECRAN
         JSR   AFFGROU
         JSR   SAUV
         JMP   SOURIS1

ECRITEM  NOP              ; CREATION DE L'ECRAN
         JSR   AFFITEM
         JSR   SAUV
         JMP   SOURIS1

ECRCOLO  NOP              ; CREATION DE L'ECRAN
         JSR   AFFCOLO
         JSR   SAUV
         JMP   SOURIS1

ECRMENU  NOP              ; CREATION DE L'ECRAN
         JSR   AFFMENU
         JSR   SAUV
         JMP   SOURIS1

ECRDOCU  NOP              ; CREATION DE L'ECRAN
         JSR   AFTPAG
         JSR   SAUV
         JMP   SOURIS1

ECRQUIT  NOP              ; CREATION DE L'ECRAN
         JSR   AFFQUIT
         JSR   SAUV
         JMP   SOURIS1

ECRWARN  NOP              ; CREATION DE L'ECRAN
         JSR   AFFWARN
         LDA   ERRORFL
         CMP   #$0001
         BNE   ECRWARN1
         JSR   ERRSLVR    ; SLEEPER VERT
         BRA   ECRWARN5
ECRWARN1 CMP   #$0002
         BNE   ECRWARN2
         JSR   ERRSLBL    ; SLEEPER BLEU
         BRA   ECRWARN5
ECRWARN2 CMP   #$0003
         BNE   ECRWARN3
         JSR   ERRSLRG    ; SLEEPER ROUGE
         BRA   ECRWARN5
ECRWARN3 CMP   #$0004
         BNE   ECRWARN4
         JSR   ERRSLJN    ; SLEEPER JAUNE
         BRA   ECRWARN5
ECRWARN4 JSR   ERRTINIE   ; PAS DE TINIES
ECRWARN5 JSR   SAUV
         JMP   SOURIS1

**************  ROUTINES AFFICHAGES ECRANS  ***************

AFFDROIT LDY   #$00C7     ; HAUTEUR -1
         LDX   #$0016     ; LARGEUR
         LDA   #$0088     ; @ SPRITE
         STA   AFFZONE2+1
         LDA   #$2088     ; @ ECRAN
         JSR   AFFZONE    ; AFFICHE A DROITE
         RTS

EFFDROIT LDX   #$0086     ; NETTOY LA BANDE
         LDY   #$00C7
EFFDROI2 LDA   #$0000     ; ON FORCE EN NOIR
         STAL  $E12000,X  ; PROUT
         TXA
         CLC
         ADC   #$00A0
         TAX
         DEY
         BPL   EFFDROI2
         RTS

CLNDROIT LDY   #$00C7     ; HAUTEUR -1
         LDX   #$0018     ; LARGEUR
         LDA   #$2086     ; @ ECRAN
         JSR   CLNZONE    ; NETTOY A DROITE
         RTS

AFFGAUCH LDY   #$00C7     ; HAUTEUR -1
         LDX   #$0016     ; LARGEUR
         LDA   #$0088     ; @ SPRITE
         STA   AFFZONE2+1
         LDA   #$2000     ; @ ECRAN
         JSR   AFFZONE    ; AFFICHE A GAUCHE
         RTS

EFFGAUCH LDX   #$0018     ; NETTOY LA BANDE
         LDY   #$00C7
EFFGAUC2 LDAL  $E12000,X  ; PROUT
         AND   #$0F00
         STAL  $E12000,X  ; PROUT
         TXA
         CLC
         ADC   #$00A0
         TAX
         DEY
         BPL   EFFGAUC2
         RTS

CLNGAUCH LDY   #$00C7     ; HAUTEUR -1
         LDX   #$0018     ; LARGEUR /2 -2
         LDA   #$2000     ; @ ECRAN
         JSR   CLNZONE    ; NETTOY A GAUCHE
         RTS

WAITVBL  LDAL  $E1C02E
         AND   #$00FF
         CMP   #$00B0
         BNE   WAITVBL
         RTS

AFFTIME  LDY   #$003B
         LDX   #$0044
         LDA   #$2841
         STA   AFFZONE2+1
         LDA   #$41ED
         JSR   AFFZONE    ; AFFICHE TIME
         RTS

CLNTIME  LDY   #$003B
         LDX   #$0044
         LDA   #$41ED
         JSR   CLNZONE    ; NETTOY TIME
         RTS

AFFLEVE  LDY   #$003B
         LDX   #$0044
         LDA   #$0181
         STA   AFFZONE2+1
         LDA   #$41ED
         JSR   AFFZONE    ; AFFICHE LEVEL
         RTS

CLNLEVE  LDY   #$003B
         LDX   #$0044
         LDA   #$41ED
         JSR   CLNZONE    ; NETTOY LEVE
         RTS

AFFGROU  LDY   #$009A
         LDX   #$003C
         LDA   #$80A1
         STA   AFFZONE2+1 ; DEUXIEME PLANCHE
         LDA   #$2991
         JSR   AFFZONE    ; AFFICHE GROUND
         RTS

CLNGROU  LDY   #$009A
         LDX   #$003C
         LDA   #$2991
         JSR   CLNZONE    ; NETTOY GROU
         RTS

AFFITEM  LDY   #$0064
         LDX   #$004A
         LDA   #$80E0     ; DEUXIEME PLANCHE
         STA   AFFZONE2+1
         LDA   #$356A
         JSR   AFFZONE    ; AFFICHE ITEM
         RTS

CLNITEM  LDY   #$0064
         LDX   #$004A
         LDA   #$356A
         JSR   CLNZONE    ; NETTOY ITEM
         RTS

AFFCOLO  LDY   #$0029
         LDX   #$003C
         LDA   #$E221
         STA   AFFZONE2+1 ; DEUXIEME PLANCHE DE SPRITE
         LDA   #$41F1
         JSR   AFFZONE    ; AFFICHE COLORS
         RTS

CLNCOLO  LDY   #$0029
         LDX   #$003C
         LDA   #$41F1
         JSR   CLNZONE    ; NETTOY COLORS
         RTS

AFFMENU  LDY   #$0048
         LDX   #$004E
         LDA   #$4EF7
         STA   AFFZONE2+1
         LDA   #$41E8
         JSR   AFFZONE    ; AFFICHE MENU
         RTS

CLNMENU  LDY   #$0048
         LDX   #$004E
         LDA   #$41E8
         JSR   CLNZONE    ; NETTOY MENU
         RTS

CLNDOCU  LDY   #$0000
         LDX   #$0000
         LDA   #$0000
         JSR   CLNZONE    ; NETTOY DOCU
         RTS

AFFQUIT  LDY   #$0030
         LDX   #$003E
         LDA   #$0140
         STA   AFFZONE2+1
         LDA   #$41F0
         JSR   AFFZONE    ; AFFICHE QUIT
         RTS

CLNQUIT  LDY   #$0030
         LDX   #$003E
         LDA   #$41F0
         JSR   CLNZONE    ; NETTOY QUIT
         RTS

AFFWARN  LDY   #$0037
         LDX   #$003E
         LDA   #$2080
         STA   AFFZONE2+1
         LDA   #$41F0
         JSR   AFFZONE    ; AFFICHE WARNING
         RTS

CLNWARN  LDY   #$0037
         LDX   #$003E
         LDA   #$41F0
         JSR   CLNZONE    ; NETTOY WARNING
         RTS

******

AFFZONE  STX   AFFZONE1+1 ; RECOPIE UN SPRITE SUR L'ECRAN
         STA   AFFZONE3+1
AFFZONE1 LDX   #$0000     ; NOMBRE DE *4-2
AFFZONE2 LDAL  $042000,X  ; ADRESSE ZONE SPRITE
AFFZONE3 STAL  $E12000,X  ; ADRESSE ZONE ECRAN PROUT
         DEX
         DEX
         BPL   AFFZONE2   ; RECOPIE 1 LIGNE
         LDA   AFFZONE2+1
         CLC              ; LIGNE SUIVANTE SPRITE
         ADC   #$00A0
         STA   AFFZONE2+1
         LDA   AFFZONE3+1
         CLC              ; LIGNE SUIVANTE ECRAN
         ADC   #$00A0
         STA   AFFZONE3+1
         DEY
         BPL   AFFZONE1
         RTS

CLNZONE  STA   CLNZONE2+1 ; EFFACE UNE ZONE
         STA   CLNZONE3+1
         STX   CLNZONE1+1
CLNZONE1 LDX   #$0000     ; NOMBRE DE *4-2
CLNZONE2 LDAL  $012000,X  ; ADRESSE ZONE
CLNZONE3 STAL  $012000,X  ; ADRESSE ZONE
         DEX
         DEX
         BPL   CLNZONE2   ; RECOPIE 1 LIGNE
         LDA   CLNZONE2+1
         CLC              ; LIGNE SUIVANTE SPRITE
         ADC   #$00A0
         STA   CLNZONE2+1
         LDA   CLNZONE3+1
         CLC              ; LIGNE SUIVANTE ECRAN
         ADC   #$00A0
         STA   CLNZONE3+1
         DEY
         BPL   CLNZONE1
         RTS

******

GRILHG   LDX   #$01E2     ; GRILLE HORI GAUCHE
         LDY   #$000B
         BRA   GRILH1

GRILHM   LDX   #$01FA     ; GRILLE HORI MILIEU
         LDY   #$0035
         BRA   GRILH1

GRILHD   LDX   #$0266     ; GRILLE HORI DROITE
         LDY   #$000B
         BRA   GRILH1

GRILH1   LDAL  $012000,X  ; GRILLE HORIZONTALE
         AND   #$F0F0
         ORA   #$0909
         STAL  $012000,X
         LDAL  $012F00,X  ; L2
         AND   #$F0F0
         ORA   #$0909
         STAL  $012F00,X
         LDAL  $013E00,X  ; L3
         AND   #$F0F0
         ORA   #$0909
         STAL  $013E00,X
         LDAL  $014D00,X  ; L4
         AND   #$F0F0
         ORA   #$0909
         STAL  $014D00,X
         LDAL  $015C00,X  ; L5
         AND   #$F0F0
         ORA   #$0909
         STAL  $015C00,X
         LDAL  $016B00,X  ; L6
         AND   #$F0F0
         ORA   #$0909
         STAL  $016B00,X
         LDAL  $017A00,X  ; L7
         AND   #$F0F0
         ORA   #$0909
         STAL  $017A00,X
         LDAL  $018900,X  ; L8
         AND   #$F0F0
         ORA   #$0909
         STAL  $018900,X
         LDAL  $019800,X  ; L9
         AND   #$F0F0
         ORA   #$0909
         STAL  $019800,X
         INX
         INX
         DEY
         BPL   GRILH3
         RTS
GRILH3   JMP   GRILH1

GRILVG   LDX   #$01E1
         LDY   #$0060
         BRA   GRILV1

GRILVD   LDX   #$0271
         LDY   #$0060
         BRA   GRILV1

GRILV1   LDAL  $012000,X  ; GRILLE VERTICALE LARGEUR 2
         AND   #$FFF0
         ORA   #$0009
         STAL  $012000,X
         LDAL  $01200C,X
         AND   #$FFF0
         ORA   #$0009
         STAL  $01200C,X
         TXA
         CLC
         ADC   #$0140     ; 2 LIGNES
         TAX
         DEY
         BPL   GRILV1
         RTS

GRILVM   LDX   #$01F9
         LDY   #$0060
         BRA   GRILV2

GRILV2   LDAL  $012000,X  ; GRILLE VERTICALE LARGEUR 10
         AND   #$FFF0
         ORA   #$0009
         STAL  $012000,X
         LDAL  $01200C,X  ; L2
         AND   #$FFF0
         ORA   #$0009
         STAL  $01200C,X
         LDAL  $012018,X  ; L3
         AND   #$FFF0
         ORA   #$0009
         STAL  $012018,X
         LDAL  $012024,X  ; L4
         AND   #$FFF0
         ORA   #$0009
         STAL  $012024,X
         LDAL  $012030,X  ; L5
         AND   #$FFF0
         ORA   #$0009
         STAL  $012030,X
         LDAL  $01203C,X  ; L6
         AND   #$FFF0
         ORA   #$0009
         STAL  $01203C,X
         LDAL  $012048,X  ; L7
         AND   #$FFF0
         ORA   #$0009
         STAL  $012048,X
         LDAL  $012054,X  ; L8
         AND   #$FFF0
         ORA   #$0009
         STAL  $012054,X
         LDAL  $012060,X  ; L9
         AND   #$FFF0
         ORA   #$0009
         STAL  $012060,X
         LDAL  $01206C,X  ; L10
         AND   #$FFF0
         ORA   #$0009
         STAL  $01206C,X
         TXA
         CLC
         ADC   #$0140     ; 2 LIGNES
         TAX
         DEY
         BPL   GRILV3
         RTS
GRILV3   JMP   GRILV2

*********

MAKESPR  LDY   #$0026     ; CREATION DE L'ECRAN SPRITE2 A PARTIR DE NIVEAU
MAKESPR1 LDA   GRDTAB2,Y  ; GROUND
         TAX
         LDA   GRDTAB1,Y
         PHY
         JSR   COPYBL0    ; AFFICHE NIVEAU -> SPRITE2
         PLY
         DEY
         DEY
         BPL   MAKESPR1
         LDA   #$1E00     ; COPY LE BLOC A COTE DES TINIES
         LDX   #$4B40
         JSR   COPYBL8
         LDA   #$4B00     ; COPY DE L'ANIM A LA PLACE DU BLOC
         LDX   #$1E00
         JSR   COPYBL8
         LDY   #$001A
MAKESPR2 LDA   ITETAB2,Y  ; ITEM
         TAX
         LDA   ITETAB1,Y
         PHY
         JSR   COPYBL0    ; AFFICHE NIVEAU -> SPRITE2
         PLY
         DEY
         DEY
         BPL   MAKESPR2
         LDA   #$0000     ; COPY DU SOL SOUS LES TINIES
         LDX   #$4B00
         JSR   COPYBL8
         LDA   #$0000
         LDX   #$4B10
         JSR   COPYBL8
         LDA   #$0000
         LDX   #$4B20
         JSR   COPYBL8
         LDA   #$0000
         LDX   #$4B30
         JSR   COPYBL8
         LDA   #$0001     ; COPY DES 4 TINIES DANS NIVEAU
         JSR   SPRMSK     ; VERT
         LDA   #$0002
         JSR   SPRMSK     ; BLEU
         LDA   #$0003
         JSR   SPRMSK     ; ROUGE
         LDA   #$0004
         JSR   SPRMSK     ; JAUNE
         LDA   #$0000     ; COLLE PAR DESSUS LA ZONE ROSE
         JSR   SPRMSK
         LDA   ptrNIV+1   ; PALETTE
         AND   #$FF00
         ORA   #$007E
         STA   LP2+2
         LDX   #$001F      ; PALETTE IMAGE
LP2      LDAL  $047E00,X
         STAL  $019E00,X
         DEX
         DEX
         BPL   LP2
         RTS

SEBLCKG  ASL              ; COPIE DANS LE BUFFER SELECT D'UN BLOC GROUND
         TAY
         LDA   GRDTAB2,Y
         LDY   DROITE
         CPY   #$0002
         BEQ   SEBLCKG1
         LDX   #$5206     ; ADRESSE ECRAN E1 GAUCHE
         JSR   COPYBL3
         RTS
SEBLCKG1 LDX   #$528E     ; ADRESSE ECRAN E1 DROITE
         JSR   COPYBL3
         RTS

SEBLCKI  ASL              ; COPIE DANS LE BUFFER SELECT D'UN BLOC ITEM
         TAY
         LDA   GRDTAB2,Y
         LDY   DROITE
         CPY   #$0002
         BEQ   SEBLCKI1
         LDX   #$5206     ; ADRESSE ECRAN E1 GAUCHE
         JSR   COPYBL4
         RTS
SEBLCKI1 LDX   #$528E     ; ADRESSE ECRAN E1 DROITE
         JSR   COPYBL4
         RTS

AFFECRG  LDA   DROITE     ; AFFICHE L'ECRAN GROUND
         CMP   #$0001
         BEQ   AFFECRGD
AFFECRGG LDA   #GAUCHTAB  ; AFFICHE A GAUCHE
         BRA   AFFECRG0
AFFECRGD LDA   #DROITTAB  ; AFFICHE A DROITE
AFFECRG0 STA   AFFECRG2+1
         LDY   #$0000
AFFECRG1 PHY              ; NUMERO DU CADRE
AFFECRG2 LDA   GAUCHTAB,Y
         TAY
         LDA   GROUBUF,Y  ; NUMERO DU SPRITE
         ASL
         TAX
         LDA   GRDTAB1,X  ; ADRESSE SPRITE
         PHA
         LDA   GRILLETA,Y ; ADRESSE ECRAN
         TAX
         PLA
         JSR   COPYBL1    ; COPY BLOCK
         PLY
         INY
         INY
         CPY   #$00B0     ; 11*8 *2
         BNE   AFFECRG1
         RTS

AFFECRI  LDA   DROITE     ; AFFICHE L'ECRAN ITEM SUR L'ECRAN GROUND
         CMP   #$0001
         BEQ   AFFECRID
AFFECRIG LDA   #GAUCHTAB  ; AFFICHE A GAUCHE
         BRA   AFFECRI0
AFFECRID LDA   #DROITTAB  ; AFFICHE A DROITE
AFFECRI0 STA   AFFECRI2+1
         LDY   #$0000
AFFECRI1 PHY              ; NUMERO DU CADRE
AFFECRI2 LDA   GAUCHTAB,Y
         TAY
         LDA   ITEMBUF,Y  ; NUMERO DU SPRITE
         CMP   #$0014     ; 20
         BMI   AFFECRI3
         CMP   #$0031     ; 49
         BEQ   AFFECRI3
         CMP   #$0036
         BPL   AFFECRI3
         ASL
         TAX
         LDA   GRDTAB1,X  ; ADRESSE SPRITE
         PHA
         LDA   GRILLETA,Y ; ADRESSE ECRAN
         TAX
         PLA
         JSR   COPYBL1    ; COPY BLOCK
AFFECRI3 PLY
         INY
         INY
         CPY   #$00B0     ; 11*8 *2
         BNE   AFFECRI1
         RTS

SEBLCKS  ASL              ; COPIE DANS LA GRILLE LE BLOC DU BUFFER
         TAY
         LDA   GRILLETA,Y
         TAY              ; Y=ADRESSE ECRAN
         LDA   MAISELE
         BEQ   SEBLCKS1
         LDA   ITZONE     ; ITEM OU GROUND
         BRA   SEBLCKS2
SEBLCKS1 LDA   GRZONE     ;
SEBLCKS2 ASL
         TAX
         LDA   GRDTAB1,X  ; A=ADRESSE SPRITE
         TYX
         JSR   COPYBL1
         RTS

GAUCHTAB HEX   0000,0200,0400,0600,0800,0A00,0C00,0E00,1000,1200,1400
         HEX   1A00,1C00,1E00,2000,2200,2400,2600,2800,2A00,2C00,2E00
         HEX   3400,3600,3800,3A00,3C00,3E00,4000,4200,4400,4600,4800
         HEX   4E00,5000,5200,5400,5600,5800,5A00,5C00,5E00,6000,6200
         HEX   6800,6A00,6C00,6E00,7000,7200,7400,7600,7800,7A00,7C00
         HEX   8200,8400,8600,8800,8A00,8C00,8E00,9000,9200,9400,9600
         HEX   9C00,9E00,A000,A200,A400,A600,A800,AA00,AC00,AE00,B000
         HEX   B600,B800,BA00,BC00,BE00,C000,C200,C400,C600,C800,CA00

DROITTAB HEX   0400,0600,0800,0A00,0C00,0E00,1000,1200,1400,1600,1800
         HEX   1E00,2000,2200,2400,2600,2800,2A00,2C00,2E00,3000,3200
         HEX   3800,3A00,3C00,3E00,4000,4200,4400,4600,4800,4A00,4C00
         HEX   5200,5400,5600,5800,5A00,5C00,5E00,6000,6200,6400,6600
         HEX   6C00,6E00,7000,7200,7400,7600,7800,7A00,7C00,7E00,8000
         HEX   8600,8800,8A00,8C00,8E00,9000,9200,9400,9600,9800,9A00
         HEX   A000,A200,A400,A600,A800,AA00,AC00,AE00,B000,B200,B400
         HEX   BA00,BC00,BE00,C000,C200,C400,C600,C800,CA00,CC00,CE00

GRDTAB1  HEX   0000,1000,2000,3000,7000,100F,6000,4000,200F,700F
         HEX   400F,9000,900F,5000,800F,000F,500F,600F,300F,8000
         HEX   001E,101E,201E,301E,401E,501E,601E,701E,801E,901E
         HEX   002D,102D,202D,302D,402D,502D,602D,702D,802D,902D
         HEX   003C,103C,203C,303C,403C,503C,603C,703C,803C,903C
         HEX   004B,104B,204B,304B,404B

GRDTAB2  HEX   6504,7304,8104,8F04,4515,5315,6115,6F15,2526,3326
         HEX   4126,4F26,0537,1337,2137,2F37,E547,F347,0148,0F48
         HEX   001E,101E,201E,301E,401E,501E,601E,701E,801E,901E
         HEX   002D,102D,202D,302D,402D,502D,602D,702D,802D,902D
         HEX   003C,103C,203C,303C,403C,503C,603C,703C,803C,903C
         HEX   004B,104B,204B,304B,404B

ITETAB1  HEX   901E,603C,703C,803C,103C,203C,303C,403C,001E,101E,701E,602D,802D,503C
ITETAB2  HEX   B204,C004,CE04,DC04,8415,9215,A015,AE15,BC15,6426,7226,8026,8E26,9C26

GRILLETA HEX   8222,8E22,9A22,A622,B222,BE22,CA22,D622,E222,EE22,FA22,0623,1223
         HEX   8231,8E31,9A31,A631,B231,BE31,CA31,D631,E231,EE31,FA31,0632,1232
         HEX   8240,8E40,9A40,A640,B240,BE40,CA40,D640,E240,EE40,FA40,0641,1241
         HEX   824F,8E4F,9A4F,A64F,B24F,BE4F,CA4F,D64F,E24F,EE4F,FA4F,0650,1250
         HEX   825E,8E5E,9A5E,A65E,B25E,BE5E,CA5E,D65E,E25E,EE5E,FA5E,065F,125F
         HEX   826D,8E6D,9A6D,A66D,B26D,BE6D,CA6D,D66D,E26D,EE6D,FA6D,066E,126E
         HEX   827C,8E7C,9A7C,A67C,B27C,BE7C,CA7C,D67C,E27C,EE7C,FA7C,067D,127D
         HEX   828B,8E8B,9A8B,A68B,B28B,BE8B,CA8B,D68B,E28B,EE8B,FA8B,068C,128C

COPYBL0  LDY   #$0500     ; COPIE DE BLOC 24*24 : NIVEAU -> SPRITE2
         STY   COPYBL6+2
COPYBL00 LDY   #$0480
         STY   COPYBL7+2
         STA   COPYBL6+1
         TXA
         CLC
         ADC   #$8000
         STA   COPYBL7+1
         JMP   COPYBLM
COPYBL1  LDY   #$0500     ; COPIE DE BLOC 24*24 : NIVEAU -> ECRAN 01
         STY   COPYBL6+2
         LDY   #$0120
         STY   COPYBL7+2
         STA   COPYBL6+1
         STX   COPYBL7+1
         JMP   COPYBLM
COPYBL4  LDY   #$0500     ; COPIE DE BLOC 24*24 : NIVEAU -> ECRAN E1
         STY   COPYBL6+2
         LDY   #$E120     ; PROUT
         STY   COPYBL7+2
         STA   COPYBL6+1
         STX   COPYBL7+1
         JMP   COPYBLM
COPYBL2  LDY   #$0480     ; COPIE DE BLOC 24*24 : SPRITE2 -> ECRAN 01
         STY   COPYBL6+2
         LDY   #$0120
         STY   COPYBL7+2
         CLC
         ADC   #$8000
         STA   COPYBL6+1
         STX   COPYBL7+1
         JMP   COPYBLM
COPYBL3  LDY   #$0480     ; COPIE DE BLOC 24*24 : SPRITE2 -> ECRAN E1
         STY   COPYBL6+2
         LDY   #$E120     ; PROUT
         STY   COPYBL7+2
         CLC
         ADC   #$8000
         STA   COPYBL6+1
         STX   COPYBL7+1
         JMP   COPYBLM
COPYBLN  LDY   #$0480     ; COPIE DE BLOC 24*24 : SPRITE2 -> NIVEAU
         STY   COPYBL6+2
COPYBLN0 LDY   #$0500
         STY   COPYBL7+2
         STA   COPYBL6+1
         STX   COPYBL7+1
         JMP   COPYBLM
COPYBL8  LDY   #$0500     ; COPIE DE BLOC 24*24 : NIVEAU -> NIVEAU
         STY   COPYBL6+2
         STY   COPYBL7+2
         STA   COPYBL6+1
         STX   COPYBL7+1
COPYBLM  LDY   #$0017     ; HAUTEUR-1
COPYBL5  LDX   #$000A     ; NOMBRE DE *4-2
COPYBL6  LDAL  $05A0A0,X  ; ADRESSE NIVEAU
COPYBL7  STAL  $048000,X  ; ADRESSE SPRITE2
         DEX
         DEX
         BPL   COPYBL6    ; RECOPIE 1 LIGNE
         LDA   COPYBL6+1
         CLC              ; LIGNE SUIVANTE SPRITE
         ADC   #$00A0
         STA   COPYBL6+1
         LDA   COPYBL7+1
         CLC              ; LIGNE SUIVANTE ECRAN
         ADC   #$00A0
         STA   COPYBL7+1
         DEY
         BPL   COPYBL5
         RTS

******************  AFFICHAGE SPRITE SANS MASQUE **********************

SPRMSK   ASL              ; ROUTINE AFFICHAGE SPRITE SANS MASQUE
         TAX
         LDA   MULDIX,X   ; *10
         TAX
         LDA   SPMSKTAB2,X ; ADRESSE BASSE DESTINATION
         STA   SPRMSK2+1
         STA   SPRMSK5+1
         STA   SPRMSK7+1
         INX
         LDA   SPMSKTAB2,X ; ADRESSE HAUTE DESTINATION
         STA   SPRMSK2+2
         STA   SPRMSK5+2
         STA   SPRMSK7+2
         INX
         INX
         LDA   SPMSKTAB2,X ; ADRESSE BASSE SOURCE
         STA   SPRMSK1+1
         STA   SPRMSK3+1
         STA   SPRMSK4+1
         STA   SPRMSK6+1
         INX
         LDA   SPMSKTAB2,X ; ADRESSE HAUTE SOURCE
         STA   SPRMSK1+2
         STA   SPRMSK3+2
         STA   SPRMSK4+2
         STA   SPRMSK6+2
         INX
         INX
         LDA   SPMSKTAB2,X ; LONGUEUR
         ASL
         STA   SPRMSK8+1
         INX
         INX
         LDA   SPMSKTAB2,X ; HAUTEUR
         STA   SPRMSK9+1

         LDY   #$0000
SPRMSK00 PHY
         LDX   #$0000
SPRMSK0  PHX
SPRMSK1  LDAL  $AAAAAA,X  ; 4 POINTS
         AND   #$00FF
         TAY
SPRMSK2  LDAL  $E12000,X  ; ECRAN PROUT
         AND   SPMSKTAB3,Y
SPRMSK3  ORAL  $AAAAAA,X  ; SPRITE
         STA   SPMSKTAB1
         INX
SPRMSK4  LDAL  $AAAAAA,X  ; SPRITE
         AND   #$00FF
         TAY
SPRMSK5  LDAL  $E12000,X  ; ECRAN PROUT
         AND   SPMSKTAB3,Y
SPRMSK6  ORAL  $AAAAAA,X  ; SPRITE
         STA   SPMSKTAB1+1
         DEX
         LDA   SPMSKTAB1
SPRMSK7  STAL  $E12000,X  ; ECRAN PROUT
         PLX
         INX
         INX
SPRMSK8  CPX   #$AAAA
         BNE   SPRMSK0
         LDA   SPRMSK2+1  ; ECRAN LIGNE SUIVANTE
         CLC
         ADC   #$00A0
         STA   SPRMSK2+1
         STA   SPRMSK5+1
         STA   SPRMSK7+1
         LDA   SPRMSK1+1  ; SPRITE LIGNE SUIVANTE
         CLC
         ADC   #$00A0
         STA   SPRMSK1+1
         STA   SPRMSK3+1
         STA   SPRMSK4+1
         STA   SPRMSK6+1
         PLY
         INY
SPRMSK9  CPY   #$AAAA
         BNE   SPRMSK00
         RTS

SPMSKTAB1 HEX  000000

SPMSKTAB2 HEX  8A9B04,A0C004,1600,5500 ;       ADR DESTI,ADR SOURCE,LONG/4,HAUTEUR
         HEX   004B04,6D9104,0600,1800
         HEX   104B04,A48404,0600,1800
         HEX   204B04,2D8104,0600,1800
         HEX   304B04,ADA104,0600,1800

SPMSKTAB3 HEX  FF,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

MULDIX   HEX   0000,0A00,1400,1E00,2800,3200,3C00,4600,5000,5A00,6400

*********************************************************************

HEXDEC   HEX   0000,0001,0002,0003,0004,0005,0006,0007,0008,0009
         HEX   0100,0101,0102,0103,0104,0105,0106,0107,0108,0109
         HEX   0200,0201,0202,0203,0204,0205,0206,0207,0208,0209
         HEX   0300,0301,0302,0303,0304,0305,0306,0307,0308,0309
         HEX   0400,0401,0402,0403,0404,0405,0406,0407,0408,0409
         HEX   0500,0501,0502,0503,0504,0505,0506,0507,0508,0509
         HEX   0600,0601,0602,0603,0604,0605,0606,0607,0608,0609
         HEX   0700,0701,0702,0703,0704,0705,0706,0707,0708,0709
         HEX   0800,0801,0802,0803,0804,0805,0806,0807,0808,0809
         HEX   0900,0901,0902,0903,0904,0905,0906,0907,0908,0909
         HEX   0A00,0A01,0A02,0A03,0A04,0A05,0A06,0A07,0A08,0A09

KBD      LDAL  $00BFFF    ; LECTURE DU CLAVIER
         BPL   KBD
         STAL  $00C010
         RTS
