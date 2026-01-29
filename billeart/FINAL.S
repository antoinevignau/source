
                  LST   OFF


                  ORG   $1000


PHTAB             EQU   $0F0000
let               EQU   $0F4000      ;pourquoi, oh mon Dieu ??
Rlet              EQU   $0F5000      ;pourquoi, oh mon Dieu ??

                  CLC
                  XCE
                  SEP   #$30
                  JSR   $A000
                  jsr   SOUND
                  clc
                  xce
                  sep   #$30
                  BIT   $C010

***** NO ADB ******

~AsyncADBReceive  MAC
                  PHLW  ]1;]2
                  Tool  $D09
                  <<<

~SyncADBReceive   MAC
                  PHW   ]1
                  PHLW  ]2;]3
                  Tool  $E09
                  <<<

PHLW              MAC
                  PHL   ]1
                  PHW   ]2
                  <<<

PHL               MAC
                  IF    #=]1
                  PEA   ^]1
                  ELSE
                  PHW   ]1+2
                  FINADB
                  PHW   ]1
                  <<<

PHW               MAC
                  IF    #=]1
                  PEA   ]1
                  ELSE
                  IF    MX/2
                  LDA   ]1+1
                  PHA
                  FINADB
                  LDA   ]1
                  PHA
                  FINADB
                  <<<

*********************

_SENDINFO         MAC
                  Tool  $909
                  <<<
_ReadMouse        MAC
                  Tool  $1703
                  <<<
_InitMouse        MAC
                  Tool  $1803
                  <<<
_SetMouse         MAC
                  Tool  $1903
                  <<<
_ClampMouse       MAC
                  Tool  $1C03
                  <<<

Tool              MAC
                  LDX   #]1
                  JSL   $E10000
                  <<<

                  STZ   $C035
                  LDA   #$A1
                  STA   $C029        ; AFFICHE LA PAGE GRAPH

                  LDA   $C034
                  AND   #$F0         ; COULEUR NOIRE BORD
                  ORA   #$00
                  STA   $C034

                  CLC
                  XCE
                  REP   #$30         ; 16 BIT
                  LDAL  $E100C9      ; VOLUME SONORE
                  AND   #$0F00
                  STA   SND

                  LDA   #$0001
                  STA   ECRAN        ; ECRAN=1

                  PEA   $0000        ; recherche du slot
                  _InitMouse

                  PEA   0            ; X min
                  PEA   312          ; X max
                  PEA   0            ; Y min
                  PEA   194          ; Y max
                  _ClampMouse

                  PEA   $0001        ; Mode Transparent
                  _SetMouse

                  STZ   A1
                  STZ   AP
                  STZ   POSX
                  STZ   POSY
                  STZ   POSXA
                  STZ   POSYA
                  INC   POSX
* STZ POSXI   ; PERMET D'EVITER LE BUG...
                  STZ   BOUT
                  STZ   LACH

                  LDA   #$0060
                  STA   BBX
                  LDA   #$0050
                  STA   BBY
                  LDA   #$0000
                  LDX   #$004C
ERAS              STA   X0,X
                  DEX
                  DEX
                  BPL   ERAS
                  LDA   #$0009
                  STA   MINU

**** PRELIMINAIRES *****

                  JSR   SAUV         ; OK
                  JSR   DESS

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  LDA   #$0001
                  STA   ECRAN
                  JSR   SAUV         ; OK

                  JSR   REINIT

*******************************************************

KBD               CLC
                  XCE
                  REP   #$30

LOOP              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$E001       ; C001, E001, F001
                  CMP   #$C001
                  BNE   CONTI1

                  BRA   BOUTON1

CONTI1            PLY
                  PLX
                  STY   CONTI3+1
                  STX   CONTI4+1
                  STZ   BOUT
                  LDA   BOUT3
                  CMP   #$00A0       ; DELAI BOUTON
                  BMI   CONTI2
                  STZ   BOUT2
                  JSR   CLRLI
                  LDA   LACH
                  CMP   #$0001
                  BNE   CONTI2
                  JMP   LACHE

CONTI2            INC   BOUT3
CONTI3            LDY   #$0000
CONTI4            LDX   #$0000

                  CPY   POSY         ; necessaire car le curseur n'est pas
                  BNE   :noequal     ; synchronise, on affiche que si la
                  CPX   POSX         ; position a change. tu peux supprimer
                  BEQ   LOOP         ; ces 4 lignes pour voir la difference.

:noequal          STY   POSY         ; Y
                  STX   POSX         ; X

                  BRA   DEB

BOUTON1           LDA   #$0001
                  STA   BOUT
                  PLY
                  PLX
                  STY   POSY
                  STX   POSX

*************************************************

DEB               CLC
                  XCE
                  REP   #$30

                  LDA   POSX
                  CMP   #$0139       ; BORD DROIT
                  BPL   BD

                  CMP   #$0000       ; BORD GAUCHE
                  BMI   BG

                  LDA   POSY         ; BORD BAS
                  CMP   #$00C2
                  BPL   BA

                  CMP   #$0000       ; BORD HAUT
                  BMI   BH

                  BRA   DEB1


BD                LDA   #$0138       ; BORD DROIT
                  STA   POSX
                  BRA   DEB1

BG                STZ   POSX         ; BORD GAUCHE
                  BRA   DEB1

BA                LDA   #$00C2       ; BORD BAS
                  STA   POSY
                  BRA   DEB1

BH                STZ   POSY         ; BORD HAUT
                  BRA   DEB1

*************************************************

DEB1              LDA   A1           ; A1 POSITION ACTUELLE
                  STA   AP           ; AP ANCIENNE POSITION

                  LDA   POSX
                  LSR   A            ; ON DIVISE POSX PAR 2 POR QUE CA SOIT EN BYTES
                  STA   POSXI        ; POSXI = POSX INTERMEDIAIRE

                  LDA   POSY
                  ASL   A            ; POSY=POSY*2
                  TAX                ; X=POSY*2
                  LDA   TABLE,X
                  CLC                ; ON TRANSFORME DES CORDONNEES X ET Y (POSX, POSY)
                  ADC   POSXI        ; EN UN NOMBRE (A1) AVEC A1=160*POSY+POSX
                  STA   A1

                  LDA   BOUT         ; BOUTON ENFONCE ?
                  CMP   #$0000
                  BEQ   PA

                  JMP   BOUTON

***************************************************

PA                CLC
                  LDA   POSX         ; ON REGARDE SI ON EST SUR UNE COLONNE
                                     ; PAIR OU IMPAIR POUR DESSINER LE POINTEUR
                  LSR   A

                  BCC   PAIR
                  BCS   IMPA

                  RTS                ; FIN

PAIR              JMP   TRACE1
IMPA              JMP   TRACE2

*******************************************************

TRACE1            CLC
                  XCE
                  REP   #$30

                  LDA   SYN
                  CMP   #$0000
                  BEQ   TRACE3

                  JSR   SAUV
TRACE3            JSR   DESS         ; OK
                  JSR   SAUV
                  STZ   SYN

                  LDX   A1           ; DESSINE LE POINTER POSITION PAIRE

                  LDA   #$FFFF
                  STAL  $012000,X    ; A1
                  STAL  $012002,X    ; B1

                  LDAL  $0120A0,X    ; A2
                  AND   #$00FF
                  ORA   #$000F
                  STAL  $0120A0,X

                  LDA   #$0F00       ; B2
                  STAL  $0120A2,X

                  LDAL  $012140,X    ; A3
                  AND   #$F0FF
                  ORA   #$F000
                  STAL  $012140,X

                  LDAL  $012142,X    ; B3
                  AND   #$FF00
                  ORA   #$F000
                  STAL  $012142,X

                  LDAL  $0121E0,X    ; A4
                  ORA   #$0F00
                  STAL  $0121E0,X

                  LDAL  $0121E2,X    ; B4
                  AND   #$FF00
                  ORA   #$F000
                  STAL  $0121E2,X

                  LDAL  $012282,X    ; B5
                  ORA   #$00FF
                  STAL  $012282,X

                  LDAL  $012322,X    ; B6
                  ORA   #$000F
                  STAL  $012322,X

                  JMP   KBD

******************************************************

TRACE2            CLC
                  XCE
                  REP   #$30

                  LDA   SYN
                  CMP   #$0000
                  BEQ   TRACE4

                  JSR   SAUV
TRACE4            JSR   DESS         ; OK
                  JSR   SAUV
                  STZ   SYN

                  LDX   A1

                  LDAL  $012000,X    ; C1
                  ORA   #$FF0F
                  STAL  $012000,X

                  LDA   #$FFFF       ; D1
                  STAL  $012002,X

                  LDAL  $012004,X    ; E1
                  ORA   #$00F0
                  STAL  $012004,X

                  LDAL  $0120A0,X    ; C2
                  AND   #$F0FF
                  ORA   #$F000
                  STAL  $0120A0,X

                  LDA   #$0000       ; D2
                  STAL  $0120A2,X

                  LDAL  $0120A4,X    ; E2
                  ORA   #$00F0
                  STAL  $0120A4,X

                  LDAL  $012140,X    ; C3
                  ORA   #$0F00
                  STAL  $012140,X

                  LDA   #$0F00       ; D3
                  STAL  $012142,X

                  LDA   #$0FF0       ; D4
                  STAL  $0121E2,X

                  LDAL  $012282,X    ; D5
                  ORA   #$F00F
                  STAL  $012282,X

                  LDAL  $012322,X    ; D6
                  ORA   #$F000
                  STAL  $012322,X

                  JMP   KBD

******************************************************

DESS              CLC                ; DESSINE LE DECOR (LIE A AP), ANCIENNE POSITION
                  XCE
                  REP   #$30

                  LDX   AP

                  LDA   DEC
                  STAL  $012000,X
                  LDA   DEC+2
                  STAL  $012002,X
                  LDA   DEC+4
                  STAL  $012004,X
                  LDA   DEC+6
                  STAL  $0120A0,X
                  LDA   DEC+8
                  STAL  $0120A2,X
                  LDA   DEC+10
                  STAL  $0120A4,X
                  LDA   DEC+12
                  STAL  $012140,X
                  LDA   DEC+14
                  STAL  $012142,X
                  LDA   DEC+16
                  STAL  $0121E0,X
                  LDA   DEC+18
                  STAL  $0121E2,X
                  LDA   DEC+20
                  STAL  $012282,X
                  LDA   DEC+22
                  STAL  $012322,X

                  RTS

SAUV              CLC                ; SAUVEGARDE LE DECOR (LIE A A1), NOUVELLE POSITION
                  XCE
                  REP   #$30

                  LDX   A1

                  LDAL  $012000,X
                  STA   DEC
                  LDAL  $012002,X
                  STA   DEC+2
                  LDAL  $012004,X
                  STA   DEC+4
                  LDAL  $0120A0,X
                  STA   DEC+6
                  LDAL  $0120A2,X
                  STA   DEC+8
                  LDAL  $0120A4,X
                  STA   DEC+10
                  LDAL  $012140,X
                  STA   DEC+12
                  LDAL  $012142,X
                  STA   DEC+14
                  LDAL  $0121E0,X
                  STA   DEC+16
                  LDAL  $0121E2,X
                  STA   DEC+18
                  LDAL  $012282,X
                  STA   DEC+20
                  LDAL  $012322,X
                  STA   DEC+22

                  RTS

***********************************************

DEC               HEX   000000000000000000000000000000000000000000000000

DECB              HEX   0000000000000000000000000000000000000000
                  HEX   0000000000000000000000000000000000000000
                  HEX   0000000000000000000000000000000000000000

A1                HEX   0000         ; POSITION ACTUELLE
AP                HEX   0000         ; ANCIENNE POSITION
POSX              HEX   0000         ; POSITION X (COMPRISE ENTRE 0 ET 312)
POSY              HEX   0000         ; POSITION Y (COMPRISE ENTRE 0 ET 194)
POSXA             HEX   0000         ; POSITION X ANCIENNE
POSYA             HEX   0000         ; POSITION Y ANCIENNE
POSX1             HEX   0000         ; POSITION POINTEUR POUR L'UTILISATION
POSY1             HEX   0000         ; POUR LA CREATION DE TABLE
POSXI             HEX   0000         ; POSITION X INTERMEDIAIRE (UTILISEE DANS UN CAL
BBX               HEX   6000         ; POSITION X BOULE B (COMPRISE ENTRE
BBY               HEX   6000         ; POSITION Y BOULE B (COMPRISE ENTRE
BBX1              HEX   0000         ; DERNIERE POSITION DE LA BOULE BLANCHE
BBY1              HEX   0000
BBX2              HEX   0000         ; UTILISE POUR DIRECTION
BBY2              HEX   0000
BBA               HEX   0000         ; BOULE BLANCHE ACTUELLE POSITION
BBO               HEX   0000         ; BOULE BLANCHE OLD POSITION
BBS               HEX   0000         ; BOULE BLANCHE SAUVEGARDE
SYN               HEX   0000         ;
TIMEMAR           HEX   0000         ; =1 SI LEVEL=10,20,30,40

ECRAN             HEX   0000         ; ECRAN N[...
BOUT2             HEX   0000         ; BOUTON ENFONCE TRACE ?
BOUT3             HEX   0000         ; BOUTON RELACHE ?
BOUT              HEX   0000         ; BOUTON ENFONCE ?

***********************************************

BOUTON            STZ   BOUT3
                  LDA   BOUT2
                  CMP   #$0001
                  BEQ   ECR4
                  LDA   ECRAN
                  CMP   #$0001
                  BEQ   ECR1
                  CMP   #$0002
                  BEQ   ECR2
                  CMP   #$0003
                  BEQ   ECR3

                  JMP   KBD          ; NO SCREEN ?

ECR2              JMP   ECRA2
ECR3              JMP   ECRA3
ECR4              JMP   CANNE

****************

ECR1              LDA   POSY
                  CMP   #$00B8       ; 184
                  BMI   BOULE
                  CMP   #$00C3       ; 195
                  BPL   RETOUR
                  LDA   POSX
                  CMP   #$0014       ; 20
                  BMI   RETOUR
                  CMP   #$005B       ; 91
                  BMI   PANIC1
                  CMP   #$007C       ; 124
                  BMI   RETOUR
                  CMP   #$00C3       ; 195
                  BMI   OPTIONS1
                  CMP   #$00E1       ; 225
                  BMI   RETOUR
                  CMP   #$012E       ; 296
                  BMI   PAUSE1

                  BRA   RETOUR

RETOUR            JMP   KBD

PAUSE1            JMP   PAUSE
OPTIONS1          JMP   OPTIONS
PANIC1            JMP   PANIC

BOULE             LDA   BBY
                  SEC
                  SBC   #$0003
                  STA   BOU1+1
                  CLC
                  ADC   #$0005
                  STA   BOU2+1
                  LDA   BBX
                  ASL                ; *2
                  CLC
                  ADC   #$0004
                  STA   BOU4+1
                  SEC
                  SBC   #$0006
                  STA   BOU3+1

                  LDA   POSY
BOU1              CMP   #$0000
                  BMI   RETOUR
BOU2              CMP   #$0000
                  BPL   RETOUR
                  LDA   POSX
BOU3              CMP   #$0000
                  BMI   RETOUR
BOU4              CMP   #$0000
                  BPL   RETOUR

                  LDA   #$0001
                  STA   BOUT2

RETOUR2           JMP   KBD

***********************************************************

ECRA2             LDA   POSX         ; NEXT ABOUT ET QUIT GAME
                  CMP   #$0044       ; 68
                  BMI   RETOUR2
                  CMP   #$0095       ; 149
                  BPL   SEL1
                  LDA   POSY
                  CMP   #$0025       ; 37
                  BMI   RETOUR2
                  CMP   #$0091       ; 145
                  BMI   NEAB

SEL1              LDA   POSY         ; BD.THE HALL ET LVP
                  CMP   #$0094       ; 148
                  BPL   SEL2
                  LDA   POSX
                  CMP   #$00AF       ; 175
                  BMI   RETOUR2
                  CMP   #$010A       ; 166
                  BMI   BDPH
                  BRA   RETOUR2

SEL2              LDA   POSY         ; RETURN ET SON
                  CMP   #$00A4       ; 164
                  BMI   RETOUR2
                  LDA   POSX
                  CMP   #$00B8       ; 184
                  BPL   SON
                  LDA   POSY
                  CMP   #$00B5       ; 185
                  BPL   RETOUR2
                  LDA   POSX
                  CMP   #$0048       ; 72
                  BMI   RETOUR2
                  CMP   #$00B7       ; 183
                  BMI   RETU
                  BRA   RETOUR2

SON               LDA   POSY
                  CMP   #$00B0       ; 176
                  BMI   RETOUR1
                  CMP   #$00B5       ; 181
                  BPL   RETOUR1
                  LDA   POSX
                  CMP   #$00F3       ; 243
                  BMI   RETOUR1
                  CMP   #$00F9       ; 249
                  BMI   SONPL        ; SON PL OK
                  CMP   #$0102       ; 258
                  BMI   RETOUR1
                  CMP   #$0108       ; 264
                  BPL   RETOUR1
                  JMP   SONMO        ; SONMO OK

RETU              LDA   POSY
                  CMP   #$00B2       ; 178
                  BPL   RETOUR1
                  JMP   RETURN       ;   RETURN OK

NEAB              LDA   POSY
                  CMP   #$0037       ; 55
                  BMI   NEXT         ;   NEXT OK
                  CMP   #$0052       ; 82
                  BMI   RETOUR1
                  CMP   #$0064       ; 100
                  BMI   ABOUT        ;   ABOUT OK
                  CMP   #$007F       ; 127
                  BMI   RETOUR1
                  CMP   #$0091       ; 145
                  BMI   QUITGA       ;   QUIT GAME OK
                  BRA   RETOUR1

BDPH              LDA   POSX
                  CMP   #$00AF       ; 175
                  BMI   RETOUR1
                  LDA   POSY
                  CMP   #$003B       ; 59
                  BMI   BDTHE        ;   BD.THE OK
                  CMP   #$004C       ; 76
                  BMI   RETOUR1
                  CMP   #$0069       ; 105
                  BMI   HALL         ;   HALL OK
                  CMP   #$007A       ; 122
                  BMI   RETOUR1
                  CMP   #$0094       ; 148
                  BMI   LVP          ;   LVP OK


RETOUR1           JMP   KBD

****************

QUITGA            JMP   QUIT
BDTHE             JMP   PHOTO
HALL              JMP   HALLOF
LVP               JMP   LOUISVP
ABOUT             JMP   REALI
NEXT              JMP   NEXT1
SONPL             JMP   SONPL1
SONMO             JMP   SONMO1
RETURN            JMP   RETURN1

********************************************************

ECRA3             LDA   POSX
                  CMP   #$0063       ; 99
                  BMI   RETOUR1
                  CMP   #$006A       ; 106
                  BPL   RETOUR1
                  LDA   POSY
                  CMP   #$0058       ; 88
                  BMI   RETOUR1
                  CMP   #$005E
                  BMI   QUIPRO       ; QUIT PRODOS OK
                  CMP   #$0064       ; 100
                  BMI   RETOUR1
                  CMP   #$006A       ; 106
                  BMI   QUIRE        ; QUIT REBOOT OK
                  CMP   #$0070       ; 112
                  BMI   RETOUR1
                  CMP   #$0076       ; 118
                  BMI   QUICAN       ; QUIT CANCEL OK
                  BRA   RETOUR1

**********

QUIPRO            JMP   RADIO
QUIRE             JMP   RADIO
QUICAN            JMP   QUICAN1

***************************  HALL OF FRIME  ************************

HALLOF            JSR   DESS         ;                MOUAI ***
                  INC   POSX
                  LDA   #$002C       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0BA6       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$014F       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$A665       ; SPRIT
                  STA   MU1+1
                  LDA   #$4FD7       ; GRAPH
                  STA   MU2+1
                  LDA   #$B925       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

HALLOF1           CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  JSR   FADOU        ; FADE OUT

                  LDX   #$80         ; APRIL
                  LDY   #$0C         ; BANK   *
                  JSR   FADIN

                  LDA   #$FF
                  JSR   $FCA8        ; WAIT *************
                  LDA   #$FF
                  JSR   $FCA8

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA

HAL2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000       ; ****
                  CMP   #$C000
                  BNE   HAL4
                  JMP   HAL3

HAL4              PLA
                  PLA
                  BRA   HAL2

HAL3              PLA
                  PLA
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

HAL1              JSR   FADOU

                  LDX   #$80         ; IMAGE OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  STZ   PERDU
                  JSR   SAUV         ; OK

                  JMP   SAFF

***************************  THE PHOTO  ************************

PHOTO             JSR   DESS         ;               MOUAI ***
                  INC   POSX
                  LDA   #$002C       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0B86       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0134       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$860A       ; SPRIT
                  STA   MU1+1
                  LDA   #$34F7       ; GRAPH
                  STA   MU2+1
                  LDA   #$96EA       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  JSR   FADOU        ; FADE OUT

                  LDX   #$00         ; PHOTO
                  LDY   #$0E         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA

                  CLC
                  XCE
                  SEP   #$30
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 1 SEC
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  CLC
                  XCE
                  REP   #$30


*********** CYCLAGE

                  LDA   #$0FF0       ; PRELIMINAIRES
                  STA   PHCO
                  STAL  PHTAB
                  STZ   PHCT


                  JSR   PHA1         ; CREATION TABLE

PHCYC             LDA   #$9E22       ; N[ DE LA COULEUR : 1
                  STA   PHCOU+1
                  LDA   PHAA1        ; PLACE DANS LA TABLE
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA1
                  CMP   #$00B2
                  BNE   PHC2
                  LDA   #$0000
                  STA   PHAA1

PHC2              JSR   PHAFF        ; AFFICHAGE

                  LDA   #$9E24       ; COULEUR 2
                  STA   PHCOU+1
                  LDA   PHAA2
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA2
                  CMP   #$00B2
                  BNE   PHC3
                  LDA   #$0000
                  STA   PHAA2

PHC3              JSR   PHAFF

                  LDA   #$9E26       ; COULEUR 3
                  STA   PHCOU+1
                  LDA   PHAA3
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA3
                  CMP   #$00B2
                  BNE   PHC4
                  LDA   #$0000
                  STA   PHAA3

PHC4              JSR   PHAFF


PH3O2             PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000       ; ***
                  CMP   #$C000
                  BNE   PH3O4
                  JMP   PHO3

PH3O4             PLA
                  PLA


                  LDA   #$9E28       ; COULEUR 4
                  STA   PHCOU+1
                  LDA   PHAA4
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA4
                  CMP   #$00B2
                  BNE   PHC5
                  LDA   #$0000
                  STA   PHAA4

PHC5              JSR   PHAFF

                  LDA   #$9E2A       ; COULEUR 5
                  STA   PHCOU+1
                  LDA   PHAA5
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA5
                  CMP   #$00B2
                  BNE   PHC6
                  LDA   #$0000
                  STA   PHAA5

PHC6              JSR   PHAFF

                  LDA   #$9E2C       ; COULEUR 6
                  STA   PHCOU+1
                  LDA   PHAA6
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA6
                  CMP   #$00B2
                  BNE   PHC7
                  LDA   #$0000
                  STA   PHAA6

PHC7              JSR   PHAFF


PH2O2             PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000
                  CMP   #$C000       ; ****
                  BNE   PH2O4
                  JMP   PHO3

PH2O4             PLA
                  PLA


                  LDA   #$9E2E       ; COULEUR 7
                  STA   PHCOU+1
                  LDA   PHAA7
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA7
                  CMP   #$00B2
                  BNE   PHC8
                  LDA   #$0000
                  STA   PHAA7

PHC8              JSR   PHAFF

                  LDA   #$9E30       ; COULEUR 6
                  STA   PHCOU+1
                  LDA   PHAA8
                  INC
                  INC
                  STA   PHEMP+1
                  STA   PHAA8
                  CMP   #$00B2
                  BNE   PHC9
                  LDA   #$0000
                  STA   PHAA8

PHC9              JSR   PHAFF

                  CLC
                  XCE
                  SEP   #$30
                  LDA   #$AA         ; ATTENTE
                  JSR   $FCA8
                  CLC
                  XCE
                  REP   #$30


PHO2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000
                  CMP   #$C000       ; ****
                  BNE   PHO4
                  JMP   PHO3

PHO4              PLA
                  PLA


                  JMP   PHCYC


*********************** AFFICHAGE ************************

                  CLC
                  XCE
                  REP   #$30

PHAFF             NOP

                  LDX   #$001C       ; ON EMPILE
PHEMP             LDAL  PHTAB,X
                  PHA
                  DEX
                  DEX
                  BPL   PHEMP

                  LDX   #$0001C0
PHDEP             PLA
PHCOU             STAL  $019E22,X
                  TXA
                  SEC
                  SBC   #$0020
                  TAX
                  BPL   PHDEP

                  RTS

*************************  CREATION DE LA TABLE  ********************

                  CLC
                  XCE
                  REP   #$30

PHA1              LDA   PHCO         ; 1ERE COULEUR (H)
                  AND   #$0FF0
                  CMP   #$0F00
                  BEQ   PHA2
                  SEC
                  SBC   #$0010
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA1


PHA2              LDA   PHCO
                  AND   #$0F0F
                  CMP   #$0F0F
                  BEQ   PHA3
                  INC
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA2


PHA3              LDA   PHCO
                  AND   #$0F0F
                  CMP   #$000F
                  BEQ   PHA4
                  SEC
                  SBC   #$0100
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA3


PHA4              LDA   PHCO
                  AND   #$00FF
                  CMP   #$00FF
                  BEQ   PHA5
                  CLC
                  ADC   #$0010
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA4


PHA5              LDA   PHCO
                  AND   #$00FF
                  CMP   #$00F0
                  BEQ   PHA6
                  DEC
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA5


PHA6              LDA   PHCO
                  AND   #$0FF0
                  CMP   #$0FF0
                  BEQ   PHA7
                  CLC
                  ADC   #$0100
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA6

PHA7              LDA   PHCO
                  AND   #$0FF0
                  CMP   #$0F00
                  BEQ   PHA8
                  SEC
                  SBC   #$0010
                  STA   PHCO

                  LDX   PHCT
                  INX
                  INX
                  STX   PHCT
                  STAL  PHTAB,X
                  BRA   PHA7


PHA8              RTS

**************************************

PHAA1             HEX   0000
PHAA2             HEX   1E00
PHAA3             HEX   3C00
PHAA4             HEX   5A00
PHAA5             HEX   7800
PHAA6             HEX   9600
PHAA7             HEX   0000
PHAA8             HEX   1E00
PHCT              HEX   0000
PHCO              HEX   0FF0

*************************************


PHO3              PLA
                  PLA
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  BIT   $C010
PHO1              JSR   FADOU

                  LDX   #$80         ; IMAGE OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   SAUV         ; OK

                  JMP   KBD

***************************  LOUIS VAN PROOF  ************************

LOUISVP           JSR   DESS         ;                MOUAI ***
                  INC   POSX
                  LDA   #$002C       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0BBA       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$016C       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$BA65       ; SPRIT
                  STA   MU1+1
                  LDA   #$6C97       ; GRAPH
                  STA   MU2+1
                  LDA   #$CB45       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   $C000
                  BIT   $C010

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  JSR   FADOU        ; FADE OUT

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA
**** DEB

                  CLC
                  xce                ; 8 BIT
                  sep   #$30

                  LDX   #$00
                  LDY   #$09
                  JSR   FADIN        ; IMAGE GALAXIE


********** FIXAGE DES SCB POUR LE MESSAGE ET LE SCROLL ************

* Prend le caractere de la chaine

debut             lda   #<mes
                  sta   debut0+1
                  lda   #>mes
                  sta   debut0+2
debut0            hex   ad
                  dw    mes
                  beq   debut
                  cmp   #$01         ; COMPARAISON
                  BEQ   attend
                  CMP   #$02
                  BEQ   LPL2         ; JUP
                  CMP   #$03
                  BEQ   LPL3         ; TER
                  CMP   #$04
                  BEQ   LPL4         ; SCU
                  CMP   #$05
                  BEQ   LPL5         ; LOU
                  CMP   #$08
                  BEQ   LPL8         ; CLIGNO
                  CMP   #$09
                  BEQ   LPL9         ; MULTI
                  BRA   cherche

LPL2              JSR   JUP
                  BRA   CONTI
LPL3              JSR   TER
                  BRA   CONTI
LPL4              JSR   SCU
                  BRA   CONTI

LPL5              JMP   LOU          ; FIN

LPL8              JSR   CLI
                  BRA   CONTI
LPL9              JSR   BRAI


CONTI             INC   debut0+1
                  BRA   debut0

*************************************

attend            LDA   #$CC         ;routine d'attente
                  JSR   $FCA8        ;ATTEND

                  INC   debut0+1
                  bra   debut0

cherche           ldx   #41          ;avec la table 'table'
cherche0          cmp   table,x
                  beq   trouve
                  dex
                  bra   cherche0

trouve            txa                ;on a le caractere
                  asl                ;calcule son adresse
                  tax
                  lda   adresse,x
                  sta   dep+1
                  inx
                  lda   adresse,x
                  sta   dep+2

                  clc
                  xce
                  rep   #$30
                  ldx   #$1E
dep               lda   $ffff,x
                  stal  let,x
                  dex
                  dex
                  bpl   dep

* Ici on affiche le caractere

]ecr              =     $01989E
]pos              =     $0F4000      ; let

                  lup   #$08         ;0 to 3
                  ldal  ]pos
                  stal  ]ecr
]pos              =     ]pos+2
]ecr              =     ]ecr+$a0
                  --^

                  jsr   scroll

***********
]ecr              =     $01989E      ;4 to 7
]pos              =     $0F4010      ; let

                  lup   #$08
                  ldal  ]pos
                  stal  ]ecr
]pos              =     ]pos+2
]ecr              =     ]ecr+$a0
                  --^

                  jsr   scroll


                  CLC
                  XCE
                  SEP   #$30

                  lda   $c000
                  bmi   quitte
]inc              inc   debut0+1
                  bne   ]no
                  inc   debut0+2
]no               jmp   debut0

quitte            bit   $c010
                  cmp   #$98
                  bne   ]inc

FINI              JSR   FADOU        ; FIN

                  LDX   #$80         ; IMAGE OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   SAUV

                  JMP   KBD


* Scroll shgr gauche

scroll            CLC
                  xce
                  sep   #$30
scroll0           lda   $c019        ;synchronisation
                  bpl   scroll0
sync              lda   $c019
                  bmi   sync

                  clc
                  xce
                  rep   #$30

                  ldx   #$0000
SCROLL1           ldal  $019802,x
                  stal  $019800,x
                  ldal  $0198a2,x
                  stal  $0198a0,x
                  ldal  $019942,x
                  stal  $019940,x
                  ldal  $0199e2,x
                  stal  $0199e0,x
                  ldal  $019a82,x
                  stal  $019a80,x
                  ldal  $019b22,x
                  stal  $019b20,x
                  ldal  $019bc2,x
                  stal  $019bc0,x
                  ldal  $019c62,x
                  stal  $019c60,x
                  inx
                  inx
                  cpx   #$9e
                  beq   scroll2
                  brl   SCROLL1

scroll2           clc
                  xce
                  rep   #$30

                  rts

* All datas needed

mes               asc   "ANNEE 2019 DE L'ERE CHRETIENNE"
                  ASC   "                                        "
                  asc   "VAISSEAU SIRUS EN PROVENANCE DE LA GALAXIE D'ANDROMEDE"
                  ASC   "                                        "
                  asc   "MISSION : RENOUVELLEMENT DES INFORMATIONS SUR SYSTEMES "
                  ASC   "SOLAIRES ELOIGNES"
                  ASC   "                                        "
                  ASC   "OBJECTIF EN COURS : PLANETTE TERRE, VOIE LACTEE"
                  ASC   "                                        "
                  asc   "DATE DES DERNIERS RELEVES :  1992"
                  ASC   "                                        "
                  ASC   "&LA PLANETE SERA BIENTOT EN VUE MON CAPITAINE{"
                  ASC   "                                        "
                  HEX   02
                  HEX   01
                  ASC   "&IL Y A UN PROBLEME.........."
                  ASC   "                          "
                  ASC   "CELA NE CORRESPOND PLUS AUX DERNIERS RELEVES...{"
                  ASC   "                                        "
                  ASC   "&LA PLANETE SEMBLE S'ETRE ASSECHEE...{"
                  ASC   "                                        "
                  ASC   "&FAITES APPARAITRE LES RELEVES DE 1992{"
                  ASC   "                                        "
                  HEX   03
                  ASC   "                                        "
                  HEX   01
                  ASC   "&NOS SCANNERS NE DETECTENT AUCUN SIGNE DE VIE"
                  ASC   "                                        "
                  ASC   "LA TERRE EST UN VRAI DESERT             "
                  ASC   "                                        "
                  HEX   08
                  ASC   "&CA Y EST, "
                  HEX   08
                  ASC   "ON A TROUVE "
                  HEX   08
                  ASC   "QUELQUE CHOSE..."
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "&NOUS AVONS"
                  HEX   08
                  ASC   " REUSSI A "
                  HEX   08
                  ASC   " LOCALISER"
                  HEX   08
                  ASC   " L'ENDROIT : "
                  ASC   "    "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "ANCIENNEMENT"
                  HEX   08
                  ASC   " VILLE DE NANCY"
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   " FRANCE"
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   " EUROPE"
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "             "
                  HEX   08
                  ASC   "&NOUS ENVOYONS"
                  HEX   08
                  ASC   " UN VAISSEAU"
                  HEX   08
                  ASC   " POUR VERIFIER...{"
                  HEX   08
                  ASC   "              "
                  HEX   08
                  ASC   "              "
                  HEX   08
                  ASC   "                          "
                  HEX   04
                  HEX   01
                  HEX   01
                  ASC   "&CA Y EST, NOUS AVONS PU ETABLIR LE CONTACT"
                  ASC   "                                                "
                  ASC   "CET HOMME ETAIT ENTRAIN DE PRECHER...."
                  ASC   "                                                "
                  ASC   "JE CROIS QU'IL ESSAYE DE NOUS DIRE QUELQUE CHOSE...."
                  ASC   "                                                "
                  ASC   "CELA POURRAIT ETRE CAPITAL POUR COMPRENDRE COMMENT LA TERRE"
                  ASC   " EN EST ARRIVEE LA...                       "
                  ASC   " ECOUTONS LE :                                         "
                  HEX   09
                  HEX   01
                  HEX   01
                  HEX   01
                  ASC   "                                                    "
                  ASC   "MULTIFINDER ????               GS ?????                   "
                  ASC   "&LES PROPOS SONT INCOMPREHENSIBLES MON CAPITAINE...{"
                  ASC   "                                     "
                  ASC   "&CE N'EST PAS GRAVE,    ILS ONT DU DEVENIR FOUS A FORCE"
                  ASC   " D'ETRE TOUT SEUL...                                "
                  HEX   05
                  asc   "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 9 "
                  asc   "( ) ! ? & { ' , . \ :                                     "
                  hex   00

table             asc   " ABCDEFGHIJKLMNOPQRSTUVWXYZ0129()!?&{',.\:"
adresse           dw    ESL,AL,BL,CL,DL,EL,FL,GL,HL,IL,JL,KL,LL,ML,NL,OL,PL,QL
                  dw    RL,SL,TL,UL,VL,WL,XL,YL,ZL,ZEL,UNL,DEL,NEL,POL,PFL,PEL,PIL
                  dw    GOL,GFL,APL,VIL,PTL,COL,DPL

ESL               HEX   00000000000000000000000000000000
                  HEX   00000000000000000000000000000000

AL                HEX   000000CC0BBB0AA00990088807700660
                  HEX   0000CC00BBB00AA00990088007700660

BL                HEX   00000CCC0BB00AA00990088007700666
                  HEX   0000CC000BB00AA09900088007706600

CL                HEX   000000CC0BB00AA00990088007700066
                  HEX   0000CC000BB000000000000007706600

DL                HEX   00000CCC0BB00AA00990088007700660
                  HEX   0000CC00BBB00AA00990088077706600

EL                HEX   00000CCC0BB00AA00990088007700666
                  HEX   0000CCC0000000009900000000006660

FL                HEX   00000CCC0BB00AA00990088007700660
                  HEX   0000CCC0000000009900000000000000

GL                HEX   000000CC0BB00AA00990088007700066
                  HEX   0000CC0000B000009990088007706660

HL                HEX   00000CC00BB00AA00999088007700660
                  HEX   00000CC00BB00AA00990088007700660

IL                HEX   000000CC000B000A0009000800070066
                  HEX   0000CC00B000A0009000800070006600

JL                HEX   00000000000000000000000007700066
                  HEX   00000CC00BB00AA00990088007706600

KL                HEX   00000CC00BB00AAA0999088007700660
                  HEX   00000CC0BB00A0000000000077000660

LL                HEX   00000CC00BB00AA00990088007700666
                  HEX   00000000000000000000000007706660

ML                HEX   0000CC00BBB0AAAA9909880077006600
                  HEX   000000C0B0B0A0A00090008000700060

NL                HEX   00000CC00BBB0AAA0999088007700660
                  HEX   000000C000B0A0A09090808000700060

OL                HEX   000000CC0BB00AA00990088007700066
                  HEX   0000CC000BB00AA00990088007706600

PL                HEX   00000CCC0BB00AA00990088007700660
                  HEX   0000CC000BB00AA09900000000000000

QL                HEX   000000CC0BB00AA00990088007700066
                  HEX   0000CC000BB00AA00990008077000660

RL                HEX   00000CCC0BB00AA00990088007700660
                  HEX   0000CC000BB00AA09900800007000060

SL                HEX   000000CC0BB00AA00099000007700066
                  HEX   0000CC000BB000009900088007706600

TL                HEX   00000CCC0000000A0009000800070006
                  HEX   0000CCC00000A0009000800070006000

UL                HEX   00000CC00BB00AA00990088007700066
                  HEX   00000CC00BB00AA00990088007706660

VL                HEX   00000CC00BB00AA00990088000770006
                  HEX   00000CC00BB00AA00990088077006000

WL                HEX   0000CC00BB00AA009909888877706600
                  HEX   000000C000B000A00090808000700060

XL                HEX   00000C000BB000AA0009008807700600
                  HEX   000000C00BB0AA009000880007700060

YL                HEX   00000C000B000AA00099000800070006
                  HEX   000000C000B00AA09900800070006000

ZL                HEX   00000CCC000000000009008800000666
                  HEX   0000CCC00BB0AA009000000000006660

ZEL               HEX   000000CC0BB00AA00990088007700066
                  HEX   0000CC000BB00AA00990088007706600

UNL               HEX   0000000C00BB000A0009000800070666
                  HEX   0000C000B000A0009000800070006660

DEL               HEX   000000CC0BB000000000000800770666
                  HEX   0000CC000BB00AA09900800000006660

NEL               HEX   000000CC0BB00AA00099000000000066
                  HEX   0000CC000BB00AA09990088077006000

POL               HEX   000000000000000A0009000800000000
                  HEX   00000CC0BB00A0009000800077000660

PFL               HEX   00000CC000BB000A0009000800770660
                  HEX   000000000000A0009000800000000000

PEL               HEX   0000000C000B000A0009000800000006
                  HEX   0000C000B000A0009000800000006000

PIL               HEX   000000CC0BB000000000000800000006
                  HEX   0000CC000BB00AA09900800000006000

GOL               HEX   00000CC00B0000A00000000000000000
                  HEX   00000CC00B0000A00000000000000000

GFL               HEX   00000CC000B00A000000000000000000
                  HEX   00000CC000B00A000000000000000000

APL               HEX   0000000C0000000A0000000000000000
                  HEX   0000C000B00000000000000000000000

VIL               HEX   00000000000000000000000000070000
                  HEX   00000000000000000000000070006000

PTL               HEX   00000000000000000000000000070006
                  HEX   00000000000000000000000070006000

COL               HEX   00DD0C00B00BA0A09090800807000066
                  HEX   DD0000C0B00B000A0009800800706600

DPL               HEX   00000000000B000A0000000800070000
                  HEX   00000000B000A0000000800070000000


****************  CLIGNOTEMENT  ****************************

CLI               CLC
                  XCE
                  SEP   #$30

                  LDAL  $012D96
                  CMP   #$2E
                  BEQ   CLI2

                  LDA   #$2E
                  STAL  $012D96
                  RTS

CLI2              LDA   #$27
                  STAL  $012D96
                  RTS

***************  MULTIFINDER  *****************************

BRAI              clc
                  xce                ; 16 BIT
                  rep   #$30

                  LDA   #$85A0
                  STA   MUU1+1       ; INITIALISATION
                  LDA   #$41F1
                  STA   MUU2+1

MUU               ldx   #$0042
MUU1              LDAL  $0B85A0,x
MUU2              stal  $0141F1,x
                  DEX
                  DEX
                  bpl   MUU1

                  LDA   MUU1+1
                  CLC
                  ADC   #$00A0
                  CMP   #$AB20
                  BEQ   MUU3
                  STA   MUU1+1

                  LDA   MUU2+1
                  CLC
                  ADC   #$00A0
                  STA   MUU2+1
                  BRA   MUU

MUU3              CLC
                  XCE
                  SEP   #$30

                  RTS

****************************************************************

JUP               CLC
                  XCE
                  SEP   #$30

                  JSR   FADOU
                  LDX   #$00
                  LDY   #$08
                  JSR   FADIN        ; IMAGE JUPITER
                  RTS

TER               JSR   FADOU
                  LDX   #$80
                  LDY   #$08
                  JSR   FADIN        ; IMAGE TERRES
                  RTS

SCU               JSR   FADOU
                  LDX   #$80
                  LDY   #$07
                  JSR   FADIN        ; IMAGE SCULLEY
                  RTS


LOU               clc
                  xce                ; 16 BIT
                  rep   #$30
                  LDX   #$7FFE
LOU0              LDA   #$0000       ; EFFACE
                  STAL  $012000,X
                  DEX
                  DEX
                  BPL   LOU0

                  ldx   #$7FFE
LOU1              ldal  $070000,x    ; IMAGE LOUIS
                  stal  $012000,x
                  dex
                  dex
                  bpl   LOU1

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30


                  LDX   #$04
LOU8              LDA   #$FF         ; ATTEND 3 SECONDE
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  DEX
                  DEX
                  BPL   LOU8


                  LDX   #$22
                  LDA   #$00
LOU4              STAL  $019D76,X    ; FIXE LES SCB
                  DEX
                  BPL   LOU4

                  LDX   #$04
LOU7              LDA   #$FF         ; ATTEND 1 SECONDE
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  DEX
                  DEX
                  BPL   LOU7

AVE               JSR   FADOU
                  LDX   #$80
                  LDY   #$06
                  JSR   FADIN        ; IMAGE AVERTISS


                  LDX   #$20
AVE1              LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  DEX
                  DEX
                  BPL   AVE1

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

**** FIN

LVP2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000       ; ****
                  CMP   #$C000
                  BNE   LVP4
                  JMP   LVP3

LVP4              PLA
                  PLA
                  BRA   LVP2

LVP3              PLA
                  PLA
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

LVP1              JSR   FADOU

                  LDX   #$80         ; IMAGE OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   SAUV         ; OK

                  JMP   KBD

***************************  NEXT  ************************

NEXT1             JSR   DESS         ;                 MOUAI ***
                  INC   POSX
                  LDA   #$0028       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0B98       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0136       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$9834       ; SPRIT
                  STA   MU1+1
                  LDA   #$36A2       ; GRAPH
                  STA   MU2+1
                  LDA   #$A4B4       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  JSR   FADOU        ; FADE OUT

                  LDX   #$80         ; NEXT
                  LDY   #$0D         ; BANK   *
                  JSR   FADIN

                  LDA   #$FF
                  JSR   $FCA8        ; WAIT ***********
                  LDA   #$FF
                  JSR   $FCA8

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA

NET2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000
                  CMP   #$C000       ; ****
                  BNE   NET4
                  JMP   NET3

NET4              PLA
                  PLA
                  BRA   NET2

NET3              PLA
                  PLA
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

NET1              JSR   FADOU

                  LDX   #$80         ; IMAGE OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   SAUV         ; OK

                  JMP   KBD

***************************  REALISATION  ************************

REALI             JSR   DESS         ;                  MOUAI ***
                  INC   POSX
                  LDA   #$0028       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0BA6       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0152       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$A694       ; SPRIT
                  STA   MU1+1
                  LDA   #$52C2       ; GRAPH
                  STA   MU2+1
                  LDA   #$B314       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  BIT   $C010
                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  JSR   FADOU        ; FADE OUT

                  LDX   #$00         ; REALISATION
                  LDY   #$0D         ; BANK   *
                  JSR   FADIN
                  JSR   $a000        ; la zikmu
                  jsr   $a003

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA

******** DEB

Rdebut            lda   #Rmes        ;routine d'attente CLAVIER
                  sta   Rdebut0+1
Rdebut0           hex   ad
                  dw    Rmes
                  and   #$00ff
                  beq   Rdebut       ; 0000 ON REDEMARE
                  cmp   #$0001
                  bne   Rcherche

                  CLC                ;la routine d'attente
                  XCE                ; 8 BIT
                  SEP   #$30
                  ldx   #$1D
]Rlp2             lda   #$a0
                  jsr   $fca8
                  dex
                  bpl   ]Rlp2
                  CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  lda   Rdebut0+1
                  clc
                  adc   #$0001
                  sta   Rdebut0+1
                  JMP   ABO2

Rcherche          sta   Rcherche1+1  ;cherche le caractere dans la table
                  ldx   #0045
]Rlp1             lda   Rtable,x
                  and   #$00ff
Rcherche1         cmp   #$ffff       ;notre caractere
                  beq   Rtrouve
                  dex
                  bra   ]Rlp1

Rtrouve           txa                ;on a le caractere
                  asl                ;calcule son adresse
                  tax
                  lda   Radresse,x
                  sta   Rdep+1
*
                  ldx   #$001E       ;met le caractere dans le buffer
Rdep              lda   $ffff,x
                  stal  Rlet,x
                  dex
                  dex
                  bpl   Rdep

***********

* Ici on affiche le caractere
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  jsr   Rscroll

]Recr             =     $01989F
]Rpos             =     $0F5000

                  lup   #$08         ;0 to 1
                  ldal  ]Rpos
                  stal  ]Recr
]Rpos             =     ]Rpos+1
]Recr             =     ]Recr+$a0
                  --^

                  jsr   Rscroll

***********

]Recr             =     $01989F      ;2 to 3
]Rpos             =     $0F5008

                  lup   #$08
                  ldal  ]Rpos
                  stal  ]Recr
]Rpos             =     ]Rpos+1
]Recr             =     ]Recr+$a0
                  --^

                  jsr   Rscroll

***********

]Recr             =     $01989F      ;4 to 5
]Rpos             =     $0F5010

                  lup   #$08
                  ldal  ]Rpos
                  stal  ]Recr
]Rpos             =     ]Rpos+1
]Recr             =     ]Recr+$a0
                  --^
                  jsr   Rscroll

***********

]Recr             =     $01989F      ;6 to 7
]Rpos             =     $0F5018

                  lup   #$08
                  ldal  ]Rpos
                  stal  ]Recr
]Rpos             =     ]Rpos+1
]Recr             =     ]Recr+$a0
                  --^

**********************

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  lda   Rdebut0+1    ;prochain caractere
                  clc
                  adc   #$0001
                  sta   Rdebut0+1

ABO2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000
                  CMP   #$C000       ; ***
                  BNE   ABO4
                  STZ   ZICJEU
                  JMP   ABO3

ABO4              PLA
                  PLA
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30
                  LDA   $C000        ; CLAVIER
                  BMI   TOUCH
TOUCH1            CLC
                  XCE
                  REP   #$30
                  JMP   Rdebut0

TOUCH             CLC
                  XCE
                  SEP   #$30
                  BIT   $C010
                  CMP   #$98
                  BNE   TOUCH1
                  CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  LDA   #$0001
                  STA   ZICJEU
                  JMP   TOUCH2

* Scroll shgr gauche

Rscroll           sec
                  xce                ; 8 BIT
                  sep   #$30
Rscroll0          lda   $c019        ;synchronisation
                  bpl   Rscroll0
Rsync             lda   $c019
                  bmi   Rsync
                  ldx   #$00
RSCROLL1          ldal  $019801,x
                  stal  $019800,x
                  ldal  $0198a1,x
                  stal  $0198a0,x
                  ldal  $019941,x
                  stal  $019940,x
                  ldal  $0199e1,x
                  stal  $0199e0,x
                  ldal  $019a81,x
                  stal  $019a80,x
                  ldal  $019b21,x
                  stal  $019b20,x
                  ldal  $019bc1,x
                  stal  $019bc0,x
                  ldal  $019c61,x
                  stal  $019c60,x
                  inx
                  cpx   #$9F
                  beq   Rscroll2
                  brl   RSCROLL1
Rscroll2          rts

                  CLC
                  XCE
                  REP   #$30

* All datas needed


Rmes              ASC   "   BILLE ART \ 1992 BY BRUTAL DELUXE    ",01
                  ASC   "                                            "
                  ASC   "   THE BOOT WAS A LITTLE SLOW BUT ...                    "
                  ASC   "     NO DISK ACCESS DURING THE GAME                      "
                  ASC   "   YOU CAN REMOVE THE DISK WITHOUT ANY PROBLEM                      "
                  ASC   " BE CAREFUL !! USING THIS PROGRAM COULD BE"
                  ASC   " DANGEROUS FOR THE DATA OF YOUR RAM DISK...             "
                  ASC   " RISK OF RADIOACTIVITY POLLUTION...                                  "
                  ASC   " FULL ASSEMBLY PROGRAM, AROUND 5OOO LINES UNDER MERLIN 16                    "
                  ASC   "   MOST OF THE BOOT PICTURES WERE TAKEN"
                  ASC   " FROM THE BITMAP BROTHERS FAMOUS GAMES :    "
                  ASC   " SPEEDBALL 2  AND  GODS,           THE SPRITES ANIMATION"
                  ASC   " WAS MODIFIED FOR BEST EFFECTS...                                     "
                  ASC   " THE PICTURES OF THE  &REALISATION{  AND  &HALL OF FRIME{  SCENES"
                  ASC   " WERE DRAWN BY OUR FRIEND DIZZY.              THE WOMAN IN &HALL OF FRIME{ IS"
                  ASC   " NOT A SCANNED PHOTO...          IT'S REALLY A PATTERN !!          NICE WORK...        "
                  ASC   "              "
                  ASC   " WE HAVE USED AS GRAPHIC TOOLS PAINTWORKS GOLD,     THE.BD.256,"
                  ASC   " A 256 COLORS PROGRAM WE HAVE MADE AND...   THE EXCELLENT DREAMGRAPHIX"
                  ASC   " FOR THE MULTIPALETTE SCREENS...      THIS PROGRAM IS WONDERFUL, JUST"
                  ASC   " BUY IT !                                                      "
                  ASC   " THE TWO MUSICS THEMES WERE CREATED BY GOLD GS USING SOUNDSMITH"
                  ASC   " \ FUN AND HUIBERT HAALBERS.                                    "
                  ASC   " YOU CAN CONTACT US ON FRENCH MINITEL : 36-15 RTEL, 36-14 RTEL1,"
                  ASC   " 36-14 RTEL2, BAL : BRUTAL DELUXE                                 "
                  ASC   " SEE YOU SOON WITH MORE ANIMATIONS,       MORE FULL COLORED GRAPHICS,      "
                  ASC   " MORE GREAT MUSICS,       A SHORTER BOOT,       A FULL GS.OS COMPATIBLE,      "
                  ASC   " HARD DISK INSTALLATION OPTION AVAIBLE AND       A MORE INTERRESTING"
                  ASC   " MAIN PROGRAM...                           "
                  ASC   "   BRUTAL DELUXE, OCTOBER 1992, 14 TH   ",01,01
                  ASC   "                                        "
                  ASC   "                                        "
* ASC "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 "
* ASC "5 6 9 ( ) ! ? & { , . \ : - '                               "
                  da    $0000

Rtable            asc   " ABCDEFGHIJKLMNOPQRSTUVWXYZ1234569()!?&{,.\:-'"
Radresse          da    RESL,RAL,RBL,RCL,RDL,REL,RFL,RGL,RHL,RIL,RJL,RKL,RLL,RML,RNL,ROL,RPL,RQL
                  da    RRL,RSL,RTL,RUL,RVL,RWL,RXL,RYL,RZL,RUNL,RDEL,RTRL,RQUL,RCIL,RSIL
                  da    RNEL,RPOL,RPFL,RPEL,RPIL,RGOL,RGFL,RVIL,RPTL,RCOL,RDPL,RMOL,RQOL

RESL              HEX   99AABBCCDDEEFFFF99AABBCCDDEEFFFF
                  HEX   99AABBCCDDEEFFFF99AABBCCDDEEFFFF

RAL               HEX   99AAB7C6D5E4F3F29988776C5D443F2F
                  HEX   998877C6D5E4F3F299AA7B6C5D4E3F2F

RBL               HEX   99A8B7C6D5E4F3F299887B6C5D4E3F22
                  HEX   9988B7A655E4F32299AA7B6CDD4E3FFF

RCL               HEX   99AAB7C6D5E4F3FF99887B6C5D4E3F22
                  HEX   9988B7CCDDEEF32299AA7BCCDDEE3FFF

RDL               HEX   99A8B7C6D5E4F3F299887B6C5D4E3F2F
                  HEX   998877C6D5E4332299AA7B6C5D4E3FFF

REL               HEX   99A8B7C6D5E4F3F299887B6C5D4E3F22
                  HEX   9988BBCC55EEFF22998ABBCCDDEEFF2F

RFL               HEX   99A8B7C6D5E4F3F299887B6C5D4E3F2F
                  HEX   9988BBCC55EEFFFF998ABBCCDDEEFFFF

RGL               HEX   99AAB7C6D5E4F3FF99887B6C5D4E3F22
                  HEX   9988BBCC55E4F32299AA7BCC5D4E3F2F

RHL               HEX   99A8B7C6D5E4F3F2998A7B6C554E3F2F
                  HEX   99A8B7C6D5E4F3F2998A7B6C5D4E3F2F

RIL               HEX   99AABBCCDDEEFFFF9988B7C6D5E4F322
                  HEX   99887B6C5D4E3F2299AABBCCDDEEFFFF

RJL               HEX   99AABBCCDDEEF3FF99AABBCCDDEE3F22
                  HEX   99A8B7C6D5E4F322998A7B6C5D4E3FFF

RKL               HEX   99A8B7C6D5E4F3F2998A7B66554E3F2F
                  HEX   99A8776CDDEE33F2998ABBCCDDEEFF2F

RLL               HEX   99A8B7C6D5E4F3F2998A7B6C5D4E3F22
                  HEX   99AABBCCDDEEF32299AABBCCDDEE3F2F

RML               HEX   998877665544332299AA7B66D5EEFFFF
                  HEX   99AA7B6CDDEEFFFF998A7B6C5D4E3F2F

RNL               HEX   99A8B7C6D5E4F3F2998A7766554E3F2F
                  HEX   99AABB6C5D4EFFFF998A7B6C5D4E3F2F

ROL               HEX   99AAB7C6D5E4F3FF99887B6C5D4E3F22
                  HEX   9988B7C6D5E4F32299AA7B6C5D4E3FFF

RPL               HEX   99A8B7C6D5E4F3F299887B6C5D4E3F2F
                  HEX   9988B7C655EEFFFF99AA7B6CDDEEFFFF

RQL               HEX   99AAB7C6D5E4F3FF99887B6C5D4E3F22
                  HEX   9988B7C6D5EE33F299AA7B6C5D4EFF2F

RRL               HEX   99A8B7C6D5E4F3F299887B6C5D4E3F2F
                  HEX   9988B7C6554EF3FF99AA7B6CDDEEFF2F

RSL               HEX   99AAB7C6DDEEF3FF99887B6C55EE3F22
                  HEX   9988B7CC55E4F32299AA7BCCDD4E3FFF

RTL               HEX   99A8BBCCDDEEFFFF9988BBC6D5E4F3F2
                  HEX   9988BB6C5D4E3F2F998ABBCCDDEEFFFF

RUL               HEX   99A8B7C6D5E4F3FF998A7B6C5D4E3F22
                  HEX   99A8B7C6D5E4F322998A7B6C5D4E3F2F

RVL               HEX   99A8B7C6D5E4FFFF998A7B6C5D4E33F2
                  HEX   99A8B7C6D5E4332F998A7B6C5D4EFFFF

RWL               HEX   998877665544332299AABBCCD5443FFF
                  HEX   99AABBCCDD4EFFFF998A7B6C5D4E3F2F

RXL               HEX   99A8B7CCDDEEF3F299AA7B66D5443FFF
                  HEX   99AAB7665D44F3FF998A7BCCDDEE3F2F

RYL               HEX   99A8B7C6DDEEFFFF99AABB6C55E4F3F2
                  HEX   99AABBC6554E3F2F998A7B6CDDEEFFFF

RZL               HEX   99A8BBCCDDEEFFF29988BBCCD544FF22
                  HEX   9988B7665DEEFF22998A7BCCDDEEFF2F

RUNL              HEX   99AABBCCDDEEFFF299A877C6D5E4F322
                  HEX   998A7B6C5D4E3F2299AABBCCDDEEFF2F

RDEL              HEX   99AAB7CCDDEEFFF299887BCCDDE43322
                  HEX   9988B7C6554EFF2299AA7B6CDDEEFF2F

RTRL              HEX   99A8BBCCDDEEF3FF9988BBC6DDEE3F22
                  HEX   9988776C55E4F322998ABBCCDD4E3FFF

RQUL              HEX   99AABBCCD5E4FFFF99AAB7665D44FFFF
                  HEX   998877665544332299AABBCCDD4EFFFF

RCIL              HEX   99A8B7C6DDEEF3FF99887B66DDEE3F22
                  HEX   9988BB66D5E4F322998ABBCC5D4E3FFF

RSIL              HEX   99AAB7C6D5E4F3FF99887B6C554E3F22
                  HEX   9988BBCC55E4F32299AABBCCDD4E3FFF

RNEL              HEX   99AAB7C6DDEEFFFF99887B6C55EEFF22
                  HEX   9988B7C655E4332F99AA7B6C5D4EFFFF

RPOL              HEX   99AABBCCDDEEFFFF99AABBC6D5E4FFFF
                  HEX   99A8776C5D4E33F2998ABBCCDDEEFF2F

RPFL              HEX   99A8BBCCDDEEFFF2998A77C6D5E4332F
                  HEX   99AABB6C5D4EFFFF99AABBCCDDEEFFFF

RPEL              HEX   99AABBCCDDEEFFFF99A8B7C6D5E4FFF2
                  HEX   998A7B6C5D4EFF2F99AABBCCDDEEFFFF

RPIL              HEX   99AAB7CCDDEEFFFF99887BCCDDE4FFF2
                  HEX   9988B7C6554EFF2F99AA7B6CDDEEFFFF

RGOL              HEX   99A8B7CCDDEEFFFF998ABB6CDDEEFFFF
                  HEX   99A8B7CCDDEEFFFF998ABB6CDDEEFFFF

RGFL              HEX   99A8BBC6DDEEFFFF998A7BCCDDEEFFFF
                  HEX   99A8BBC6DDEEFFFF998A7BCCDDEEFFFF

RVIL              HEX   99AABBCCDDEEFFFF99AABBCCDDEEF3FF
                  HEX   99AABBCCDDEE3F2F99AABBCCDDEEFFFF

RPTL              HEX   99AABBCCDDEEFFFF99AABBCCDDEEF3F2
                  HEX   99AABBCCDDEE3F2F99AABBCCDDEEFFFF

RCOL              HEX   99A87B6C5D4EF3FF88AAB76C5DE4FF22
                  HEX   88AA7BCCDD4EFF22998AB7C6D5E43FFF

RDPL              HEX   99AABBCCDDEEFFFF99AAB7C6DDE4F3FF
                  HEX   99AA7B6CDD4E3FFF99AABBCCDDEEFFFF

RMOL              HEX   99AABBCCD5EEFFFF99AABBCC55EEFFFF
                  HEX   99AABBCC55EEFFFF99AABBCC5DEEFFFF

RQOL              HEX   99AABBCCDDEEFFFF99A8B7C6DDEEFFFF
                  HEX   998A7B6CDDEEFFFF99AABBCCDDEEFFFF

ZICJEU            HEX   0000

********* FIN

ABO3              CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  PLA
                  PLA
                  LDA   ZICJEU
                  CMP   #$0001       ; MUSIC PENDANT LE JEU
                  BEQ   TOUCH2
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30
                  Jsr   $a006        ; FIN ZIK

TOUCH2            CLC
                  XCE
                  SEP   #$30

ABO1              JSR   FADOU

                  LDX   #$80         ; IMAGE OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   SAUV         ; OK

                  JMP   KBD

***************************  QUIT  ************************

QUIT              JSR   DESS         ;                 MOUAI ***
                  INC   POSX
                  LDA   #$28         ; LONGUEUR
                  STA   MU+1
                  LDA   #$0BB4       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$016E       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$B4F4       ; SPRIT
                  STA   MU1+1
                  LDA   #$6EE2       ; GRAPH
                  STA   MU2+1
                  LDA   #$C174       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  JSR   FADOU        ; FADE OUT

                  LDX   #$00         ; QUIT
                  LDY   #$0C         ; BANK   *
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDA   #$0003
                  STA   ECRAN

                  JSR   SAUV         ; OK

                  JMP   KBD

***************

QUICAN1           INC   POSX

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  JSR   FADOU

                  LDX   #$80         ; OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDA   #$0002
                  STA   ECRAN

                  JSR   SAUV         ; OK

                  JMP   KBD

*************************** RADIO **************************

RADIO             JSR   DESS         ;                  MOUAI ***

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S

                  JSR   FADOU        ; FADE OUT

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDX   #$7FFE
RAD2              LDAL  $098000,X    ; IMAGE RADIO
                  STAL  $012000,X
                  DEX
                  DEX
                  BPL   RAD2

                  CLC
                  XCE                ; 8  BIT
                  SEP   #$30

                  LDA   $C034
                  AND   $F0          ; BORDURE JAUNE
                  ORA   #$0D
                  STA   $C034

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   ADBNO        ; * * * * * * * * * * * * * * * * * * * *

RAD1              NOP

                  LDX   #$045E
RAD3              LDAL  $0B8000,X    ; TURN OFF 7 LIGNES
                  STAL  $E198A0,X
                  DEX
                  DEX
                  BPL   RAD3

                  JSR   RADW         ; ATTENTE
                  JSR   RADW
                  JSR   RADW

                  LDX   #$045E
RAD4              LDAL  $0198A0,X    ; RADIO
                  STAL  $0198A0,X
                  DEX
                  DEX
                  BPL   RAD4

                  JSR   RADW         ; ATTENTE
                  JSR   RADW
                  JSR   RADW

                  BRA   RAD1

RADW              CLC
                  XCE
                  SEP   #$30
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF         ; ATTENTE 1 SEC
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  CLC
                  XCE
                  REP   #$30
                  RTS

***************************  PANIC  ************************

PANIC             JSR   DESS         ;                    MOUAI ***
                  INC   POSX
                  LDA   #$0022       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0B86       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0193       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$8685       ; SPRIT
                  STA   MU1+1
                  LDA   #$930A       ; GRAPH
                  STA   MU2+1
                  LDA   #$8EA5       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S

                  JSR   FADOU        ; FADE OUT

                  LDX   #$00
                  LDY   #$0A         ; BANK
                  JSR   FADIN

                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA

PAN2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000
                  CMP   #$C000       ; ***
                  BNE   PAN4
                  JMP   PAN3

PAN4              PLA
                  PLA
                  BRA   PAN2

PAN3              PLA
                  PLA
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

PAN1              JSR   FADOU

                  LDX   #$00
                  LDY   #$0B         ; BANK
                  JSR   FADIN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  JSR   REINIT

                  JSR   SAUV         ; OK

                  JMP   KBD

***************************  RETURN  ************************

RETURN1           JSR   DESS         ;                      MOUAI ***
                  INC   POSX
                  LDA   #$0036       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0BAD       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0186       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$AD01       ; SPRIT
                  STA   MU1+1
                  LDA   #$86A4       ; GRAPH
                  STA   MU2+1
                  LDA   #$B661       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S

                  JSR   FADOU        ; FADE OUT

                  LDX   #$00
                  LDY   #$0B         ; BANK
                  JSR   FADIN        ; FADE IN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDA   #$0001
                  STA   ECRAN

                  JSR   REINIT

                  JSR   SAUV         ; OK

                  JMP   KBD

**************************  PAUSE  ******************************

PAUSE             JSR   DESS         ; DESSINE ENFONCE         MOUAI ***
                  INC   POSX
                  LDA   #$0022       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0B91       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0193       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$9125       ; SPRIT
                  STA   MU1+1
                  LDA   #$9370       ; GRAPH
                  STA   MU2+1
                  LDA   #$99E5       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  LDA   #$0042       ; LONGUEUR   SAUVE LE DECOR
                  STA   MU+1
                  LDA   #$0140       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0BD8       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$40AF       ; SPRIT
                  STA   MU1+1
                  LDA   #$D8C0       ; GRAPH
                  STA   MU2+1
                  LDA   #$608F       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  LDA   #$0042       ; LONGUEUR   DESSINE LE 'PAUSE'
                  STA   MU+1
                  LDA   #$0BB8       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0140       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$B840       ; SPRIT
                  STA   MU1+1
                  LDA   #$40AF       ; GRAPH
                  STA   MU2+1
                  LDA   #$D820       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  JSR   $FCA8

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA
                  PLA
                  PLA

PAU2              PHA
                  PHA
                  PHA
                  _ReadMouse
                  PLA                ; Etat de la souris (bouton...)
                  AND   #$C000
                  CMP   #$C000       ; ****
                  BNE   PAU4
                  BRA   PAU3

PAU4              PLA
                  PLA
                  BRA   PAU2

PAU3              PLA
                  PLA

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30
                  LDA   #$FF
                  JSR   $FCA8
                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDA   #$0042       ; LONGUEUR   DESSINE LE DECOR
                  STA   MU+1
                  LDA   #$0BD8       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0140       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$D8C0       ; SPRIT
                  STA   MU1+1
                  LDA   #$40AF       ; GRAPH
                  STA   MU2+1
                  LDA   #$F8A0       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  LDA   #$0022       ; LONGUEUR  DESSINE LE PAUSE NORMAL
                  STA   MU+1
                  LDA   #$0BCC       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0192       ; BANK GRAPH *
                  STA   MU2+2
                  LDA   #$CC85       ; SPRIT
                  STA   MU1+1
                  LDA   #$92D0       ; GRAPH    *
                  STA   MU2+1
                  LDA   #$D545       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  JSR   SAUV         ; OK

                  STZ   BOUT

                  JMP   KBD          ; ANCIEN DEB

**************************  OPTIONS  ****************************

OPTIONS           JSR   DESS         ;                  MOUAI ***
                  INC   POSX
                  LDA   #$0022       ; LONGUEUR
                  STA   MU+1
                  LDA   #$0B9B       ; BANK SPRIT
                  STA   MU1+2
                  LDA   #$0193       ; BANK GRAPH
                  STA   MU2+2
                  LDA   #$9B25       ; SPRIT
                  STA   MU1+1
                  LDA   #$933E       ; GRAPH
                  STA   MU2+1
                  LDA   #$A345       ; HAUTEUR
                  STA   MU4+1
                  JSR   MU

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDA   #$FF
                  JSR   $FCA8        ; ATTENTE 0,3 S

                  JSR   FADOU        ; FADE OUT

                  LDX   #$80         ; OPTIONS
                  LDY   #$0A         ; BANK
                  JSR   FADIN        ; FADE IN

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDA   #$0002
                  STA   ECRAN

                  JSR   SAUV         ; OK

                  JMP   SAFF

***************************** SON ***********************************

SONPL1            LDA   SND
                  CMP   #$0F00
                  BEQ   SAFF
                  LDA   SND
                  CLC
                  ADC   #$0100
                  STA   SND
***
                  LDA   $C03B
                  AND   #$F0FF
                  ORA   SND
                  STA   $C03B

                  CLC
                  XCE
                  SEP   #$30
                  JSR   $FF3A        ; GLONG
                  CLC
                  XCE
                  REP   #$30
***
                  BRA   SAFF

SONMO1            LDA   SND
                  CMP   #$0000
                  BEQ   SAFF
                  LDA   SND
                  SEC
                  SBC   #$0100
                  STA   SND
***
                  LDA   $C03B
                  AND   #$F0FF
                  ORA   SND
                  STA   $C03B

                  CLC
                  XCE
                  SEP   #$30
                  JSR   $FF3A        ; GLONG
                  CLC
                  XCE
                  REP   #$30
***


SAFF              LDA   SND
                  LSR
                  LSR
                  LSR
                  LSR
                  LSR
                  LSR
                  LSR
                  TAX
                  LDA   STAB,X
                  STA   SMU1+1
                  JSR   SMU

                  CLC
                  XCE
                  SEP   #$30
                  LDA   #$EE
                  JSR   $FCA8
                  CLC
                  XCE
                  REP   #$30

                  JMP   KBD

**************
SMU               LDA   #$86FB       ; ADRESSE ECRAN
                  STA   SMU2+1
                  LDA   #$E6FB
                  STA   SMU3+1
                  LDY   #$000C

SMU0              ldx   #$0006       ; LONGUEUR
SMU1              LDAL  $0BD725,x
SMU2              stal  $0186FB,x
SMU3              STAL  $0AE6FB,X
                  DEX
                  DEX
                  bpl   SMU1

                  LDA   SMU1+1
                  CLC
                  ADC   #$00A0
                  STA   SMU1+1

                  LDA   SMU2+1
                  CLC
                  ADC   #$00A0
                  STA   SMU2+1
                  ADC   #$6000
                  STA   SMU3+1

                  DEY
                  DEY
                  BPL   SMU0


                  RTS

STAB              HEX   25D72ED737D740D749D752D75BD764D7
                  HEX   C5DCCEDCD7DCE0DCE9DCF2DCFBDC04DD
SND               HEX   0000         ; EN HEXA 0 -> F

***************************************************************************
***************************************************************************
***************************************************************************

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

MU                ldx   #$0022
MU1               LDAL  $0B8000,x
MU2               stal  $019200,x
                  DEX
                  DEX
                  bpl   MU1

                  LDA   MU1+1
                  CLC
                  ADC   #$00A0
MU4               CMP   #$8820
                  BEQ   MU3
                  STA   MU1+1

                  LDA   MU2+1
                  CLC
                  ADC   #$00A0
                  STA   MU2+1
                  BRA   MU

MU3               RTS

******************* FADE OUT ***** 8 BIT *******************

FADOU             CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  LDY   #$000F
CLR1              LDX   #$01FE
CLR2              LDAL  $019E00,X
                  CMP   #$0000
                  BEQ   CONT

                  LDAL  $019E00,X
                  AND   #$0F00
                  CMP   #$0000       ; ON NOIRCIT CHAQUE COMPOSANTE
                  BEQ   NEX1
                  LDAL  $019E00,X
                  SEC
                  SBC   #$0100
                  STAL  $019E00,X

NEX1              LDAL  $019E00,X
                  AND   #$00F0
                  CMP   #$0000
                  BEQ   NEX2
                  LDAL  $019E00,X
                  SEC
                  SBC   #$0010
                  STAL  $019E00,X

NEX2              LDAL  $019E00,X
                  AND   #$000F
                  CMP   #$0000
                  BEQ   CONT
                  LDAL  $019E00,X
                  SEC
                  SBC   #$0001
                  STAL  $019E00,X


CONT              DEX

                  BPL   CLR2

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDX   #$FF         ;ROUTINE D'ATTENTE
SCR               LDA   $C02E
                  CMP   #$FF
                  BNE   SCR
                  DEX
                  BPL   SCR

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  DEY                ; ON LE FAIT 16 FOIS
                  BPL   CLR1

FIN               CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  RTS

*************** FADE IN ***** 8 BIT ****************

FADIN             stx   in0+2        ;X= MEMOIRE HAUTE
                  sty   in0+3        ;Y=BANC
                  sty   in2+3
                  sty   in4+3
                  sty   in6+3

                  txa
                  clc
                  adc   #$7e
                  sta   in2+2
                  sta   in4+2
                  sta   in6+2

                  clc
                  xce                ; 16 BIT
                  rep   #$30

                  ldx   #$7dde
in0               ldal  $062000,x
                  stal  $012000,x
                  dex
                  dex
                  bpl   in0

                  ldy   #$000f
in1               ldx   #$01fe
in2               ldal  $019e00,x
                  and   #$000f
                  sta   temp
in3               ldal  $019e00,x
                  and   #$000f
                  cmp   temp
                  beq   in4
                  ldal  $019e00,x
                  clc
                  adc   #$0001
                  stal  $019e00,x
in4               ldal  $019e00,x
                  and   #$00f0
                  sta   temp
in5               ldal  $019e00,x
                  and   #$00f0
                  cmp   temp
                  beq   in6
                  ldal  $019e00,x
                  clc
                  adc   #$0010
                  stal  $019e00,x
in6               ldal  $019e00,x
                  and   #$0f00
                  sta   temp
in7               ldal  $019e00,x
                  and   #$0f00
                  cmp   temp
                  beq   in8
                  ldal  $019e00,x
                  clc
                  adc   #$0100
                  stal  $019e00,x
in8               dex
                  dex
                  bpl   in2

                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30

                  LDX   #$FF         ;ROUTINE D'ATTENTE
ISCR2             LDA   $C02E
                  CMP   #$FF
                  BNE   ISCR2
                  DEX
                  BPL   ISCR2

                  CLC
                  XCE                ; 16 BIT
                  REP   #$30

                  dey
                  bpl   in11

                  CLC
                  xce                ; 8 BIT
                  sep   #$30

                  rts

in11              JMP   in1
temp              ds    2

**********************************************************************************

                  CLC
                  XCE
                  REP   #$30

REINIT            LDA   #$0060
                  STA   BBX
                  LDA   #$0050
                  STA   BBY
                  STZ   LEVEL
                  LDA   #$0009
                  STA   MINU
                  STZ   TIME
                  STZ   SCORE

                  LDA   BBY
                  ASL
                  TAX
                  LDA   TABLE,X
                  CLC
                  ADC   BBX
                  STA   BBA
                  STA   BBO

                  JSR   SVB
                  JSR   DSB
                  JSR   BB

                  JSR   TIMETR5      ; TRACE
                  JSR   LEVTR
                  JSR   SCRTR
                  JSR   CLEAR
                  JSR   BPTR

                  RTS

********************** BOULE BLANCHE *******************

BB                CLC
                  XCE
                  REP   #$30

BB1               LDA   BBA          ; BBA POSITION ACTUELLE
                  STA   BBO          ; BBO ANCIENNE POSITION (OLD)

                  LDA   BBY
                  ASL   A            ; POSY=POSY*2
                  TAX                ; X=POSY*2
                  LDA   TABLE,X
                  CLC                ; ON TRANSFORME DES CORDONNEES X ET Y (POSX, POSY)
                  ADC   BBX          ; EN UN NOMBRE (A1) AVEC A1=160*POSY+POSX
                  STA   BBA

***************************************************

TRABB             CLC                ; BOULE BLANCHE
                  XCE
                  REP   #$30

                  CLC
                  XCE
                  SEP   #$30
SYNC1             LDA   $C019
                  BMI   SYNC1
SYNC2             LDA   $C019
                  BPL   SYNC2
                  CLC
                  XCE
                  REP   #$30

                  JSR   DSB          ; OK
                  JSR   SVB

                  LDX   BBA          ; DESSINE LA BOULE

                  LDA   #$FFFF
                  STAL  $011CE0,X    ;PARTIES BLANCHES
                  STAL  $011D80,X
                  STAL  $011E20,X
                  STAL  $011EC0,X
                  STAL  $011F60,X
                  STAL  $012000,X
                  STAL  $0120A0,X
                  STAL  $012140,X
                  STAL  $0121E0,X
                  STAL  $012280,X
                  STAL  $011F5E,X
                  STAL  $011FFE,X
                  STAL  $011F62,X
                  STAL  $012002,X

                  LDA   #$FFEF
                  STAL  $011EBE,X    ; BLANC/GRIS CLAIR
                  STAL  $01209E,X
                  LDA   #$FEFF
                  STAL  $011EC2,X
                  STAL  $0120A2,X

                  LDAL  $011CDE,X    ; LIGNE 1
                  AND   #$F0FF
                  ORA   #$0D00
                  STAL  $011CDE,X

                  LDAL  $011CE2,X
                  AND   #$FF0F
                  ORA   #$00D0
                  STAL  $011CE2,X

                  LDAL  $011D7E,X    ; LIGNE 2
                  AND   #$00FF
                  ORA   #$FF00
                  STAL  $011D7E,X

                  LDAL  $011D82,X
                  AND   #$FF00
                  ORA   #$00FF
                  STAL  $011D82,X

                  LDAL  $011E1E,X    ; LIGNE 3
                  AND   #$00F0
                  ORA   #$FF0F
                  STAL  $011E1E,X

                  LDAL  $011E22,X
                  AND   #$0F00
                  ORA   #$F0FF
                  STAL  $011E22,X

                  LDAL  $01213E,X    ; LIGNE 8
                  AND   #$00F0
                  ORA   #$FF0F
                  STAL  $01213E,X

                  LDAL  $012142,X
                  AND   #$0F00
                  ORA   #$F0FF
                  STAL  $012142,X

                  LDAL  $0121DE,X    ; LIGNE 9
                  AND   #$00FF
                  ORA   #$FF00
                  STAL  $0121DE,X

                  LDAL  $0121E2,X
                  AND   #$FF00
                  ORA   #$00FF

                  STAL  $0121E2,X

                  LDAL  $01227E,X    ; LIGNE 10
                  AND   #$F0FF
                  ORA   #$0D00
                  STAL  $01227E,X

                  LDAL  $012282,X
                  AND   #$FF0F
                  ORA   #$00D0
                  STAL  $012282,X

                  RTS

******************************************************

DSB               CLC                ; DESSINE LE DECOR (LIE A AP), ANCIENNE POSITION
                  XCE                ; BOULE BLANCHE
                  REP   #$30

                  LDX   BBO
                  LDA   DECB
                  STAL  $011CDE,X
                  LDA   DECB+2
                  STAL  $011D7E,X
                  LDA   DECB+4
                  STAL  $011E1E,X
                  LDA   DECB+6
                  STAL  $011EBE,X
                  LDA   DECB+8
                  STAL  $011F5E,X
                  LDA   DECB+10
                  STAL  $011FFE,X
                  LDA   DECB+12
                  STAL  $01209E,X
                  LDA   DECB+14
                  STAL  $01213E,X
                  LDA   DECB+16
                  STAL  $0121DE,X
                  LDA   DECB+18
                  STAL  $01227E,X
                  LDA   DECB+20      ; 1 ere COLONNE
                  STAL  $011CE0,X
                  LDA   DECB+22
                  STAL  $011D80,X
                  LDA   DECB+24
                  STAL  $011E20,X
                  LDA   DECB+26
                  STAL  $011EC0,X
                  LDA   DECB+28
                  STAL  $011F60,X
                  LDA   DECB+30
                  STAL  $012000,X
                  LDA   DECB+32
                  STAL  $0120A0,X
                  LDA   DECB+34
                  STAL  $012140,X
                  LDA   DECB+36
                  STAL  $0121E0,X
                  LDA   DECB+38
                  STAL  $012280,X
                  LDA   DECB+40      ; 2 eme
                  STAL  $011CE2,X
                  LDA   DECB+42
                  STAL  $011D82,X
                  LDA   DECB+44
                  STAL  $011E22,X
                  LDA   DECB+46
                  STAL  $011EC2,X
                  LDA   DECB+48
                  STAL  $011F62,X
                  LDA   DECB+50
                  STAL  $012002,X
                  LDA   DECB+52
                  STAL  $0120A2,X
                  LDA   DECB+54
                  STAL  $012142,X
                  LDA   DECB+56
                  STAL  $0121E2,X
                  LDA   DECB+58
                  STAL  $012282,X

                  RTS

**************

SVB               CLC                ; SAUVEGARDE LE DECOR (LIE A BBA), NOUVELLE POSITION
                  XCE                ; BOULE BLANCHE
                  REP   #$30

                  LDX   BBA
                  LDAL  $011CDE,X
                  STA   DECB
                  LDAL  $011D7E,X
                  STA   DECB+2
                  LDAL  $011E1E,X
                  STA   DECB+4
                  LDAL  $011EBE,X
                  STA   DECB+6
                  LDAL  $011F5E,X
                  STA   DECB+8
                  LDAL  $011FFE,X
                  STA   DECB+10
                  LDAL  $01209E,X
                  STA   DECB+12
                  LDAL  $01213E,X
                  STA   DECB+14
                  LDAL  $0121DE,X
                  STA   DECB+16
                  LDAL  $01227E,X
                  STA   DECB+18      ; 1 ere COLONNE
                  LDAL  $011CE0,X
                  STA   DECB+20
                  LDAL  $011D80,X
                  STA   DECB+22
                  LDAL  $011E20,X
                  STA   DECB+24
                  LDAL  $011EC0,X
                  STA   DECB+26
                  LDAL  $011F60,X
                  STA   DECB+28
                  LDAL  $012000,X
                  STA   DECB+30
                  LDAL  $0120A0,X
                  STA   DECB+32
                  LDAL  $012140,X
                  STA   DECB+34
                  LDAL  $0121E0,X
                  STA   DECB+36
                  LDAL  $012280,X
                  STA   DECB+38      ; 2 eme COLONNE
                  LDAL  $011CE2,X
                  STA   DECB+40
                  LDAL  $011D82,X
                  STA   DECB+42
                  LDAL  $011E22,X
                  STA   DECB+44
                  LDAL  $011EC2,X
                  STA   DECB+46
                  LDAL  $011F62,X
                  STA   DECB+48
                  LDAL  $012002,X
                  STA   DECB+50
                  LDAL  $0120A2,X
                  STA   DECB+52
                  LDAL  $012142,X
                  STA   DECB+54
                  LDAL  $0121E2,X
                  STA   DECB+56
                  LDAL  $012282,X
                  STA   DECB+58      ; 3 eme COLONNE

                  RTS

*****************************************************************************

CANNE             CLC
                  XCE
                  REP   #$30

*******  DISTANCE  *******

                  LDA   #$0001
                  STA   LACH         ; BOULE PEUT ETRE LACHEE
                  LDA   #$0F00
                  STA   CLRLI2+1
                  LDA   #$F000       ; LIGNE BLANCHE
                  STA   CLRLI1+1
                  LDA   DX
                  LSR
                  LSR
                  ASL
                  TAX                ; /2 /2 *2
                  LDA   MUTAB,X      ; MULTI
                  STA   DIS1+1
                  LDA   DY
                  LSR
                  LSR
                  ASL
                  TAX                ; /2 /2 *2
                  LDA   MUTAB,X
                  CLC
DIS1              ADC   #$0000
                  ASL                ; *16 /4
                  ASL
                  STA   DIST
                  CMP   #$04E2       ; 1250
                  BPL   CAN2
                  CMP   #$0029
                  BPL   CAN1

CAN2              LDA   #$0000
                  STA   CLRLI2+1
                  LDA   #$0000       ; LIGNE INVISIBLE
                  STA   CLRLI1+1
                  STZ   DIST         ; DIST=0
                  STZ   LACH         ; LACH=0

CAN1              LDA   DIST
                  STA   DIST2
                  JSR   CLRLI

                  LDA   POSX
                  STA   X0
                  LDA   POSY
                  STA   Y0

                  LDA   BBX
                  ASL                ; *2
                  STA   X1
                  LDA   BBY
                  STA   Y1

                  JSR   LIGNE

                  JMP   KBD

***************************

LACHE             LDA   A1
                  STA   AP
                  JSR   DESS         ; DESSINE LE DECOR DE FOND
                  LDA   POSX
                  STA   POSX1        ; INITIALISATION DE POSX1 ET POSY1
                  LDA   POSY         ; AVANT LEUR UTILISATION
                  STA   POSY1
                  LDA   BBX
                  STA   BBX1         ; SAUVEGARDE DE LA DERNIERE POSITION
                  STA   BBX2
                  LDA   BBY          ; AVANT DEPART
                  STA   BBY1
                  STA   BBY2

                  STZ   SVYI
                  LDA   #$0001
                  STA   TABCRE       ; CREATION TAB
                  LDY   #$0000
                  JSR   LIGNE2

                  LDA   X0
                  CMP   X1           ; CREATION TAB1
                  BPL   LACH2
                  LDA   X1           ; X1>X0
                  ASL
                  SEC
                  SBC   X0
                  STA   X0
                  BRA   LACH3
LACH2             LDA   X0
                  ASL
                  SEC
                  SBC   X1
                  STA   X1
LACH3             LDA   #$0001
                  STA   TABCRE       ; CREATION
                  STA   SVYI         ; TAB1
                  LDY   #$0000
                  JSR   LIGNE2
                  STZ   SVYI
                  STZ   TABCRE       ; INITIALISATION
                  STZ   LACH

LACH1             LDA   BBA          ; SAUVEGARDE POSITION ACTUELLE
                  STA   BBS
                  LDY   SVY
                  STY   GO1+1

*************

DIR               LDA   BBX2
                  ASL                ; *2
                  CMP   POSX1        ; OK
                  BPL   DIR1

                  LDA   POSY1        ; OK
                  CMP   BBY2
                  BPL   AD
                  LDA   DX
                  CMP   DY
                  BPL   AD
                  BRA   SB

DIR1              LDA   POSY1        ; OK
                  CMP   BBY2
                  BMI   SB
                  LDA   DX
                  CMP   DY
                  BMI   AD

***** BOULE BLANCHE

SB                LDA   #$E938       ; SEC SBC
                  STA   GO02
                  LDA   #$0001
                  STA   INV
                  BRA   GO1

AD                LDA   #$6918       ; CLC ADC
                  STA   GO02
                  STZ   INV

*******
GO1               LDY   #$0000       ; DEPLACEMENT BOULE BLANCHE  SVY OU SVY1
                  STY   GO01+1
GO00              LDA   DIST2
                  CMP   #$0000
                  BEQ   GOF
GO                LDA   BBA
                  STA   BBO
GO01              LDY   #$0000
                  DEY
                  DEY
                  STY   GO01+1
                  CPY   #$0000
                  BEQ   GOF1         ; ON EST AU BOUT DE LA TABLE

                  LDA   SVYI
                  CMP   #$0001
                  BEQ   GO04
                  LDA   TAB,Y
                  STA   GO2+1
                  BRA   GO05
GO04              LDA   TAB1,Y
                  STA   GO2+1
GO05              LDA   BBS
GO02              SEC
GO2               SBC   #$0000       ; ADC OU SBC
                  STA   BBA
                  JSR   TRANS        ; TRANSFORMATION BBA EN BBX1 ET BBY1
                  JMP   BORDU        ; BORDURES
GO3               JSR   AFF          ; AFFICHAGE
                  DEC   DIST2
GO5               LDA   DIST2        ; NOUVELLE ROUTINE D'ARRET
                  CMP   #$0000
                  BEQ   GOF
                  JSR   TIMETR
                  LDA   PERDU
                  CMP   #$0001
                  BEQ   GOF3
GO4               BRA   GO00

******* FIN

GOF1              LDA   BBA
                  STA   BBS
                  JMP   GO1

GOF               JSR   TRANS
                  INC   POSX         ; OK POUR RE-AFFICHAGE
                  INC   SYN
                  JSR   GAGNE
                  JSR   SCRTR
                  LDA   GAGN
                  CMP   #$0000
                  BEQ   GOF2
                  INC   LEVEL
                  LDA   SCORE
                  CLC
                  ADC   #$002F       ; +47 SI NIVEAU FINI
                  STA   SCORE
                  JSR   CLEAR        ; NETTOIE LES BUMPERS
GOF2              JSR   BPTR         ; TRACE LES BUMPERS
                  JSR   LEVTR        ; TRACE N[ LEVEL
                  JSR   SCRTR        ; SCORE TRACE
                  JMP   PA

GOF3              STZ   PERDU        ; PERDU
                  JSR   GOF4
                  JSR   GOF4
                  JSR   GOF4
                  JSR   GOF4
                  JSR   GOF4
* LDA #$0009
* STA MINU ; BUG ...
                  LDA   #$0002
                  STA   ECRAN
                  JMP   HALLOF1

GOF4              STZ   TIMEREG      ; ON FAIT CLIGNOTER LE TIME
                  LDA   CHI3
                  STA   CHI
                  LDA   CHI3+2
                  STA   CHI+2
                  LDA   CHI3+4
                  STA   CHI+4
                  LDA   CHI3+6
                  STA   CHI+6
                  LDA   CHI3+8
                  STA   CHI+8
                  JSR   TIMETR5
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  LDA   CHI1
                  STA   CHI
                  LDA   CHI1+2
                  STA   CHI+2
                  LDA   CHI1+4
                  STA   CHI+4
                  LDA   CHI1+6
                  STA   CHI+6
                  LDA   CHI1+8
                  STA   CHI+8
                  STZ   TIMEREG
                  JSR   TIMETR5
                  CLC
                  XCE                ; 8 BIT
                  SEP   #$30
                  LDA   #$FF
                  JSR   $FCA8
                  LDA   #$FF
                  JSR   $FCA8
                  CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  RTS

************** SOUS ROUTINES **********************

***** BORDURE BLANCHE *********

BORDU             LDA   BBX          ;      VERIFICATION BORDURES
                  CMP   #$000B       ; 12
                  BMI   BX1          ;      BORDU X GAUCH
                  INC   BMPV
                  CMP   #$0093       ; 146
                  BPL   BX1          ;      BORDU X DROIT
BORDU1            LDA   BBY
                  CMP   #$0015       ; 22
                  BMI   BY1I         ;      BORDU Y HAUT
                  INC   BMPH
                  CMP   #$0086       ; 133
                  BPL   BY1I         ;      BORDU Y BAS
                  STZ   BMPH
                  STZ   BMPV
                  JMP   GO3

BY1I              JMP   BY1          ; INTERMEDIAIRE

BX1               LDA   BBO
                  STA   BBA
                  STA   BBS
                  JSR   TRANS        ; BBA EN BBX ET BBY
                  LDA   BMPV         ; BUMPER ?
                  CMP   #$0001
                  BNE   BX14
                  JMP   BX5
BX14              LDX   #$000C       ; 12
                  STX   BX10+1
                  LDA   LVBPA,X      ;
                  CMP   #$0000
                  BEQ   BX6          ; LE PREMIER A ZERO ON CONTINUE
                  STA   BX7+1
                  STA   BX9+1
                  CLC
                  ADC   #$0018       ; +24
                  STA   BX8+1
                  LDA   BBY
                  SEC
                  SBC   #$0012       ; 18 RECTIFICATION
BX7               CMP   #$0000       ; GAUCHE HAUT
                  BPL   BX8
                  BRA   BX6
BX8               CMP   #$0000       ; GAUCHE BAS
                  BMI   BX9
BX6               LDX   #$000E       ; 14
                  STX   BX10+1
                  LDA   LVBPA,X
                  CMP   #$0000
                  BNE   BX22         ; ON SORT
                  JMP   BX11
BX22              STA   BX12+1
                  STA   BX9+1
                  CLC
                  ADC   #$0018       ; +24
                  STA   BX13+1
                  LDA   BBY
                  SEC
                  SBC   #$0012       ; 18 RECTIFICATION
BX12              CMP   #$0000       ; GAUCHE HAUT
                  BPL   BX13
                  JMP   BX11
BX13              CMP   #$0000       ; GAUCHE BAS
                  BMI   BX9
                  JMP   BX11
BX9               LDA   #$0000       ; LVBPA
                  STA   BPTRAC4+1
                  LDA   #$0007       ; COULEUR BLEU
                  STA   BPCOUL4+1
                  JSR   BPTRAC4
                  JSR   SOUND        ; * * * * * * * * SON
                  LDA   #$0003       ; COULEUR ROSE
                  STA   BPCOUL4+1
                  LDA   SCORE
                  CLC
                  ADC   #$0010       ; SCORE +16 SI TOUCHE
                  STA   SCORE
BX10              LDX   #$0000
                  STZ   LVBPA,X
                  JMP   BX11
BX5               LDX   #$0004       ; 4
                  STX   BX21+1
                  LDA   LVBPA,X      ;
                  CMP   #$0000
                  BEQ   BX17         ; LE PREMIER A ZERO ON CONTINUE
                  STA   BX15+1
                  STA   BX20+1
                  CLC
                  ADC   #$0018       ; +24
                  STA   BX16+1
                  LDA   BBY
                  SEC
                  SBC   #$0012       ; 18 RECTIFICATION
BX15              CMP   #$0000       ; GAUCHE HAUT
                  BPL   BX16
                  BRA   BX17
BX16              CMP   #$0000       ; GAUCHE BAS
                  BMI   BX20
BX17              LDX   #$0006       ;
                  STX   BX21+1
                  LDA   LVBPA,X
                  CMP   #$0000
                  BEQ   BX11         ; ON SORT
                  STA   BX18+1
                  STA   BX20+1
                  CLC
                  ADC   #$0018       ; +24
                  STA   BX19+1
                  LDA   BBY
                  SEC
                  SBC   #$0012       ; 18 RECTIFICATION
BX18              CMP   #$0000       ; GAUCHE HAUT
                  BPL   BX19
                  JMP   BX11
BX19              CMP   #$0000       ; GAUCHE BAS
                  BMI   BX20
                  JMP   BX11
BX20              LDA   #$0000       ; LVBPA
                  STA   BPTRAC2+1
                  LDA   #$0070       ; COULEUR BLEU
                  STA   BPCOUL2+1
                  JSR   BPTRAC2
                  JSR   SOUND        ; * * * * * * * * SON
                  LDA   #$0030       ; COULEUR ROSE
                  STA   BPCOUL2+1
                  LDA   SCORE
                  CLC
                  ADC   #$0010
                  STA   SCORE        ; SCORE +16
BX21              LDX   #$0000
                  STZ   LVBPA,X
BX11              STZ   BMPV
                  LDA   SVYI
                  CMP   #$0001
                  BEQ   BX2
                  LDA   #$0001       ; TAB
                  STA   SVYI
                  LDA   SVY1
                  STA   GO1+1
                  LDA   LI
                  CMP   #$0002
                  BNE   BX3
                  INC   INV
                  BRA   BX3
BX2               STZ   SVYI         ; TAB1
                  LDA   SVY
                  STA   GO1+1
                  LDA   LI1
                  CMP   #$0002
                  BNE   BX3
                  INC   INV
BX3               LDA   INV
                  CMP   #$0001
                  BEQ   BX4
                  JMP   SB
BX4               JMP   AD


BY1               LDA   BBO
                  STA   BBA
                  STA   BBS
                  JSR   TRANS        ; BBA EN BBX ET BBY
                  LDA   BMPH         ; BUMPER ?
                  CMP   #$0001
                  BNE   BY14
                  JMP   BY5
BY14              LDX   #$0000       ;ON PREND LE PREMIER HAUT
                  STX   BY10+1
                  LDA   LVBPA,X      ;
                  CMP   #$0000
                  BEQ   BY6          ; LE PREMIER A ZERO ON CONTINUE
                  STA   BY7+1
                  STA   BY9+1
                  CLC
                  ADC   #$0010       ; 32/2 LONGUEUR BUMPER
                  STA   BY8+1
                  LDA   BBX
                  SEC
                  SBC   #$0009       ; 9 RECTIFICATION ORIGINE
BY7               CMP   #$0000       ; LVPBA      HAUT GAUCHE
                  BPL   BY8
                  BRA   BY6
BY8               CMP   #$0000       ; LVPBA+32/2 HAUT GAUCHE
                  BMI   BY9
BY6               LDX   #$0002       ; ON PREND LE DEUXIEME
                  STX   BY10+1
                  LDA   LVBPA,X
                  CMP   #$0000
                  BNE   BY22         ; ON SORT SI = 0
                  JMP   BY11
BY22              STA   BY12+1
                  STA   BY9+1
                  CLC
                  ADC   #$0010       ; 32/2  LONGUEUR BUMPER
                  STA   BY13+1
                  LDA   BBX
                  SEC
                  SBC   #$0009       ; 9 RECTIFICATION ORIGINE
BY12              CMP   #$0000       ; LVBPA  HAUT DROITE
                  BPL   BY13
                  JMP   BY11
BY13              CMP   #$0000       ; LVBPA+32/2 HAUT DROITE
                  BMI   BY9
                  JMP   BY11
BY9               LDA   #$0000       ; LVBPA
                  STA   BPTRAC1+1
                  LDA   #$7777       ; COULEUR BLEU
                  STA   BPCOUL1+1
                  JSR   BPTRAC1
                  JSR   SOUND        ; * * * * * * * * * * SON
                  LDA   #$3333       ; COULEUR ROSE
                  STA   BPCOUL1+1
                  LDA   SCORE
                  CLC
                  ADC   #$0010
                  STA   SCORE        ; SCORE +10
BY10              LDX   #$0000
                  STZ   LVBPA,X
                  JMP   BY11
BY5               LDX   #$0008       ; 8  BAS DROITE
                  STX   BY21+1
                  LDA   LVBPA,X      ;
                  CMP   #$0000
                  BEQ   BY17         ; LE PREMIER A ZERO ON CONTINUE
                  STA   BY15+1
                  STA   BY20+1
                  CLC
                  ADC   #$0010       ; 32/2 LONGUEUR BUMPER
                  STA   BY16+1
                  LDA   BBX
                  SEC
                  SBC   #$0009       ; 9 RECTIFICATION ORIGINE
BY15              CMP   #$0000       ; LVBPA BAS DROITE
                  BPL   BY16
                  BRA   BY17
BY16              CMP   #$0000       ; LVBPA BAS GAUCHE
                  BMI   BY20
BY17              LDX   #$000A       ; LVBPA BAS GAUCHE
                  STX   BY21+1
                  LDA   LVBPA,X
                  CMP   #$0000
                  BEQ   BY11         ; ON SORT SI=0
                  STA   BY18+1
                  STA   BY20+1
                  CLC
                  ADC   #$0010       ; 32/2 LONGUEUR BUMPER
                  STA   BY19+1
                  LDA   BBX
                  SEC
                  SBC   #$0009       ; 9 RECTIFICATION ORIGINE
BY18              CMP   #$0000       ; LVBPA BAS DROITE
                  BPL   BY19
                  JMP   BY11
BY19              CMP   #$0000       ; LVBPA BAS DROITE
                  BMI   BY20
                  JMP   BY11
BY20              LDA   #$0000       ; LVBPA
                  STA   BPTRAC3+1
                  LDA   #$7777       ; COULEUR BLEU
                  STA   BPCOUL3+1
                  JSR   BPTRAC3
                  JSR   SOUND        ; * * * * * * * * * * SON
                  LDA   #$3333       ; COULEUR ROSE
                  STA   BPCOUL3+1
                  LDA   SCORE
                  CLC
                  ADC   #$0010
                  STA   SCORE        ; SCORE +16
BY21              LDX   #$0000
                  STZ   LVBPA,X
BY11              STZ   BMPH
                  LDA   SVYI
                  CMP   #$0001
                  BEQ   BY2
                  LDA   #$0001       ; TAB
                  STA   SVYI
                  LDA   SVY1
                  STA   GO1+1
                  LDA   LI
                  CMP   #$0001
                  BNE   BY3
                  INC   INV
                  BRA   BY3
BY2               STZ   SVYI         ; TAB1
                  LDA   SVY
                  STA   GO1+1
                  LDA   LI1
                  CMP   #$0001
                  BNE   BY3
                  INC   INV
BY3               LDA   INV
                  CMP   #$0001
                  BEQ   BY4
                  JMP   SB
BY4               JMP   AD

************************************************************************************
************************************************************************************

AFF               JSR   TRABB        ; ON AFFICHE LA BOULE BLANCHE
                  JSR   WAIT
                  RTS

WAIT              LDA   DIST2        ; ATTENTE BOULE BLANCHE
                  LSR
                  LSR
                  LSR                ; /2*2*2*2=16
                  LSR
                  STA   WAIT2+1
                  LDA   #$004F
                  SEC
WAIT2             SBC   #$0000
                  STA   WAIT3
                  BRA   WAIT5
WAIT3             HEX   0000
WAIT5             CLC
                  XCE                ; 8 BIT
                  SEP   #$30
                  LDA   WAIT3
                  JSR   $FCA8
                  CLC
                  XCE                ; 16 BIT
                  REP   #$30
                  RTS

TRANS             LDA   BBA          ; ON TRANSFORME BBA EN BBX ET BBY
                  STA   TRANS1+1
                  LDX   #$0000
                  LDY   #$0000
TRANS1            LDA   #$0000       ; BBA
                  CMP   #$00A0
                  BMI   TRANS2
                  SEC
                  SBC   #$00A0
                  STA   TRANS1+1
                  INY
                  BRA   TRANS1
TRANS2            TAX
                  STX   BBX
                  STY   BBY
                  RTS

CLEAR             LDA   #$4444       ; NETTOYAGE BORD BILLARD
                  LDX   #$008A
CL1               STAL  $012969,X
                  STAL  $017649,X
                  DEX
                  DEX
                  BPL   CL1
                  LDX   #$00A0
CL2               LDA   #$5455       ;5455
                  STAL  $012967,X
                  LDAL  $E129F5,X
                  AND   #$0FFF
                  ORA   #$4000
                  STAL  $0129F5,X
                  TXA
                  CLC
                  ADC   #$00A0
                  TAX
                  CMP   #$4CE0
                  BNE   CL2
                  RTS

TIMETR            LDA   TIMEREG      ; TIME TRACE
                  CMP   #$0000
                  BEQ   TIMETR5
                  DEC   TIMEREG
                  RTS
TIMETR5           LDA   #$0040       ; 40 EN REALITE *************************
                  STA   TIMEREG
                  LDA   TIME
                  CMP   #$0000
                  BEQ   TIMETR3
                  DEC   TIME
                  BRA   TIMETR4
TIMETR3           LDA   MINU
                  CMP   #$0000
                  BEQ   TIMEFIN
                  DEC   MINU
                  LDA   #$003B       ; 59
                  STA   TIME
                  BRA   TIMETR4
TIMEFIN           STZ   TIME
                  STZ   MINU
                  LDA   #$0001
                  STA   PERDU        ; TEMPS ECOULE
TIMETR4           LDX   #$0000
                  LDY   #$0000
                  LDA   TIME         ; SECONDE EN HEXA
                  STA   TIMETR1+1
TIMETR1           LDA   #$0000
                  CMP   #$000A
                  BMI   TIMETR2
                  SEC
                  SBC   #$000A
                  INX
                  STA   TIMETR1+1
                  BRA   TIMETR1
TIMETR2           TAY
                  STY   TIM2         ; CHIFFRE DES UNITES
                  STX   TIM1         ; CHIFFRE DES DIZAINES
                  STX   CHIFR
                  LDA   #$8A30
                  STA   CHITR1+1
                  JSR   CHITR
                  LDA   TIM2
                  STA   CHIFR
                  LDA   #$8A32
                  STA   CHITR1+1
                  JSR   CHITR
                  LDA   MINU
                  STA   CHIFR
                  LDA   #$8A2D
                  STA   CHITR1+1
                  JSR   CHITR
                  RTS

LEVTR             LDX   #$0000       ; LEVEL TRACE
                  LDY   #$0000
                  LDA   LEVEL        ; LEVEL EN HEXA
                  STA   LEVTR1+1
                  CMP   #$000A
                  BEQ   LEVTR01
                  CMP   #$0014       ; 20
                  BEQ   LEVTR01
                  CMP   #$001E       ; 30
                  BEQ   LEVTR01
                  CMP   #$0028       ; 40
                  BNE   LEVTR02
LEVTR01           LDA   TIMEMAR
                  CMP   #$0001
                  BEQ   LEVTR1
                  INC   TIMEMAR
                  STZ   TIME
                  LDA   #$0009
                  STA   MINU
                  BRA   LEVTR1
LEVTR02           STZ   TIMEMAR
LEVTR1            LDA   #$0000
                  CMP   #$000A
                  BMI   LEVTR2
                  SEC
                  SBC   #$000A
                  INX
                  STA   LEVTR1+1
                  BRA   LEVTR1
LEVTR2            TAY
                  STY   LEV2         ; CHIFFRE DES UNITES
                  STX   LEV1         ; CHIFFRE DES DIZAINES
                  STX   LCH
                  LDA   #$8956
                  STA   LCHTR1+1
                  LDA   #$8958
                  STA   LCHTR5+1
                  JSR   LCHTR
                  LDA   LEV2
                  STA   LCH
                  LDA   #$895A
                  STA   LCHTR1+1
                  LDA   #$895C
                  STA   LCHTR5+1
                  JSR   LCHTR
                  RTS

SCRTR             LDX   #$0000       ; SCORE TRACE
                  LDY   #$0000
                  LDA   SCORE
                  STA   SCRTR1+1
SCRTR1            LDA   #$0000       ; SCORE
                  CMP   #$000A
                  BMI   SCRTR2
                  SEC
                  SBC   #$000A
                  INX
                  STA   SCRTR1+1
                  BRA   SCRTR1
SCRTR2            TAY                ; UNITES
                  STY   SCR1
                  STX   SCRTR3+1
                  LDX   #$0000
                  LDY   #$0000
SCRTR3            LDA   #$0000
                  CMP   #$000A
                  BMI   SCRTR4
                  SEC
                  SBC   #$000A
                  INX
                  STA   SCRTR3+1
                  BRA   SCRTR3
SCRTR4            TAY
                  STY   SCR2
                  STX   SCRTR5+1
                  LDX   #$0000
                  LDY   #$0000
SCRTR5            LDA   #$0000
                  CMP   #$000A
                  BMI   SCRTR6
                  SEC
                  SBC   #$000A
                  INX
                  STA   SCRTR5+1
                  BRA   SCRTR5
SCRTR6            TAY
                  STY   SCR3
                  STX   SCRTR7+1
                  LDX   #$0000
                  LDY   #$0000
SCRTR7            LDA   #$0000
                  CMP   #$000A
                  BMI   SCRTR8
                  SEC
                  SBC   #$000A
                  INX
                  STA   SCRTR7+1
                  BRA   SCRTR7
SCRTR8            TAY
                  STY   SCR4
                  STX   SCR5
                  LDA   SCR1
                  STA   CHIFR
                  LDA   #$89C7
                  STA   CHITR1+1
                  JSR   CHITR
                  LDA   SCR2
                  STA   CHIFR
                  LDA   #$89C5
                  STA   CHITR1+1
                  JSR   CHITR
                  LDA   SCR3
                  STA   CHIFR
                  LDA   #$89C3
                  STA   CHITR1+1
                  JSR   CHITR
                  LDA   SCR4
                  STA   CHIFR
                  LDA   #$89C1
                  STA   CHITR1+1
                  JSR   CHITR
                  LDA   SCR5
                  STA   CHIFR
                  LDA   #$89BF
                  STA   CHITR1+1
                  JSR   CHITR
                  STZ   CHIFR
                  LDA   #$89BD
                  STA   CHITR1+1
                  JSR   CHITR
                  RTS

CHITR             LDY   #$0000       ; CHIFFRE TRACE
                  LDA   CHIFR
                  ASL
                  ASL                ; *5
                  CLC
                  ADC   CHIFR
                  ASL
                  TAX
CHITR2            LDA   CHI,X
CHITR1            STAL  $012000
                  INX
                  INX
                  LDA   CHITR1+1
                  CLC
                  ADC   #$00A0
                  STA   CHITR1+1
                  INY
                  CPY   #$0005
                  BNE   CHITR2
                  RTS
CHIFR             HEX   0000         ; COMPRIS ENTRE 0 ET 9

LCHTR             LDY   #$0000       ; LEVEL CHIFFRE TRACE
                  LDA   LCH
                  ASL
                  ASL
                  ASL
                  ASL
                  SEC
                  SBC   LCH
                  SEC                ; *14
                  SBC   LCH
                  STA   LCHTR3+1
                  ASL
                  TAX
LCHTR2            LDA   LVL,X
LCHTR1            STAL  $012000
                  INX
                  INX
                  LDA   LCHTR1+1
                  CLC
                  ADC   #$00A0
                  STA   LCHTR1+1
                  INY
                  CPY   #$0007
                  BNE   LCHTR2
                  LDY   #$0000
LCHTR3            LDA   #$0000
                  CLC
                  ADC   #$0007
                  ASL
                  TAX
LCHTR4            LDA   LVL,X
LCHTR5            STAL  $012000
                  INX
                  INX
                  LDA   LCHTR5+1
                  CLC
                  ADC   #$00A0
                  STA   LCHTR5+1
                  INY
                  CPY   #$0007
                  BNE   LCHTR4
                  RTS
LCH               HEX   0000         ; COMPRIS ENTRE 0 ET 9

BPTR              LDA   LEVEL        ; BUMPER TRACE
                  ASL
                  ASL                ; *8
                  ASL
                  ASL                ; ENTREE TABLE
                  TAX
                  STX   BPTRCOP1+1
                  LDY   #$0000
BPTRCOP           LDA   LVBP,X
                  STA   LVBPA,Y
                  INX
                  INX                ; ON COPIE LE LEVEL DANS LVBPA
                  INY
                  INY
                  CPY   #$0010
                  BMI   BPTRCOP
BPTRCOP1          LDX   #$0000
                  STX   BPTR1+1
                  LDA   LVBP,X       ;
                  CMP   #$0000
                  BEQ   BPTR1
                  STA   BPTRAC1+1
                  JSR   BPTRAC1
BPTR1             LDX   #$0000
                  INX
                  INX
                  STX   BPTR2+1
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR2
                  STA   BPTRAC1+1
                  JSR   BPTRAC1
BPTR2             LDX   #$0000
                  INX
                  INX
                  STX   BPTR3+1
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR3
                  STA   BPTRAC2+1
                  JSR   BPTRAC2
BPTR3             LDX   #$0000
                  INX
                  INX
                  STX   BPTR4+1
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR4
                  STA   BPTRAC2+1
                  JSR   BPTRAC2
BPTR4             LDX   #$0000
                  INX
                  INX
                  STX   BPTR5+1
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR5
                  STA   BPTRAC3+1
                  JSR   BPTRAC3
BPTR5             LDX   #$0000
                  INX
                  INX
                  STX   BPTR6+1
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR6
                  STA   BPTRAC3+1
                  JSR   BPTRAC3
BPTR6             LDX   #$0000
                  INX
                  INX
                  STX   BPTR7+1
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR7
                  STA   BPTRAC4+1
                  JSR   BPTRAC4
BPTR7             LDX   #$0000
                  INX
                  INX
                  LDA   LVBP,X
                  CMP   #$0000
                  BEQ   BPTR8
                  STA   BPTRAC4+1
                  JSR   BPTRAC4
BPTR8             RTS

BPTRAC1           LDA   #$0000       ; TRACE HAUT
                  CLC
                  ADC   #$0969
                  TAX
                  LDY   #$0000
BPCOUL1           LDA   #$3333       ; COULEUR
BPTRAC12          STAL  $012000,X
                  INX
                  INX
                  INY
                  CPY   #$0008
                  BMI   BPTRAC12
                  RTS
BPTRAC2           LDA   #$0000       ; TRACE DROITE
                  ASL
                  TAX
                  LDA   TABLE,X
                  CLC
                  ADC   #$2A96
                  STA   BPTRAC22+1
                  STA   BPTRAC23+1
                  LDY   #$0000
BPTRAC22          LDAL  $012000
                  AND   #$FF0F
BPCOUL2           ORA   #$0030
BPTRAC23          STAL  $012000
                  LDA   BPTRAC22+1
                  CLC
                  ADC   #$00A0
                  STA   BPTRAC22+1
                  STA   BPTRAC23+1
                  INY
                  CPY   #$0018
                  BMI   BPTRAC22
                  RTS
BPTRAC3           LDA   #$0000       ; TRACE BAS
                  CLC
                  ADC   #$5649
                  TAX
                  LDY   #$0000
BPCOUL3           LDA   #$3333       ; COULEUR
BPTRAC32          STAL  $012000,X
                  INX
                  INX
                  INY
                  CPY   #$0008
                  BMI   BPTRAC32
                  RTS
BPTRAC4           LDA   #$0000       ; TRACE GAUCHE
                  ASL
                  TAX
                  LDA   TABLE,X
                  CLC
                  ADC   #$2A08
                  STA   BPTRAC42+1
                  STA   BPTRAC43+1
                  LDY   #$0000
BPTRAC42          LDAL  $012000
                  AND   #$FFF0
BPCOUL4           ORA   #$0003
BPTRAC43          STAL  $012000
                  LDA   BPTRAC42+1
                  CLC
                  ADC   #$00A0
                  STA   BPTRAC42+1
                  STA   BPTRAC43+1
                  INY
                  CPY   #$0018
                  BMI   BPTRAC42
                  RTS

GAGNE             LDX   #$0000
GAGNE1            LDA   LVBPA,X
                  CMP   #$0000
                  BEQ   GAGNE2
                  STZ   GAGN
                  RTS
GAGNE2            INX
                  INX
                  CPX   #$0010
                  BMI   GAGNE1
                  LDA   #$0001
                  STA   GAGN
                  RTS

*****************************************

*-------------------------------
* play a sample
*-------------------------------

SOUND             clc
                  xce
                  rep   #$30
                  LDA   ZICJEU
                  CMP   #$0001
                  BNE   SOUND1
                  RTS
SOUND1            LDA   $C03B
                  AND   #$F0FF
                  ORA   SND
                  STA   $C03B

*-------------------------------
* met le son en ram son
*-------------------------------

* ldal $e100ca
* and #%00001111
* ora #%01100000
* sta $c03c
* stz $c03e
* stz $c03f

*-------------------------------
* joue le son en ram son
*-------------------------------

                  clc
                  xce
                  sep   #$20
                  stz   $c03e
                  stz   $c03f

                  lda   #$00         ; oscillo 0, frequence bas
                  sta   $c03e
                  lda   #$60
                  sta   $c03d

                  lda   #$20         ; oscillo 0, frequence haut
                  sta   $c03e
                  lda   #$00
                  sta   $c03d

                  lda   #$40         ; oscillo 0, volume
                  sta   $c03e
                  lda   #$ff
                  sta   $c03d

                  lda   #$80         ; oscillo 0, adresse sound
                  sta   $c03e
                  lda   #$80         ; son en $8000 en ram son
                  sta   $c03d

                  lda   #$c0         ; oscillo 0, taille du son
                  sta   $c03e
                  lda   #%00101101   ; longueur du son $1700
                  sta   $c03d

                  lda   #$a0         ; oscillo 0, registre de controle
                  sta   $c03e
                  lda   #%00000010
                  sta   $c03d        ; mode one-shot

                  clc
                  xce
                  rep   #$30
                  rts

**************************************************

                  PUT   TABLE

