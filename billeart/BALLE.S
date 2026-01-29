
             LST   ON


             ORG   $1000


PHTAB        EQU   $0F0000
let          EQU   $0F4000     ;pourquoi, oh mon Dieu ??
Rlet         EQU   $0F5000     ;pourquoi, oh mon Dieu ??


             BIT   $C010


_ReadMouse   MAC
             Tool  $1703
             <<<
_InitMouse   MAC
             Tool  $1803
             <<<
_SetMouse    MAC
             Tool  $1903
             <<<
_ClampMouse  MAC
             Tool  $1C03
             <<<
Tool         MAC
             LDX   #]1
             JSL   $E10000
             <<<

             STZ   $C035
             LDA   #$A1
             STA   $C029       ; AFFICHE LA PAGE GRAPH

             LDA   $C034
             AND   #$F0        ; COULEUR NOIRE BORD
             ORA   #$00
             STA   $C034

             CLC
             XCE
             REP   #$30        ; 16 BIT


* LDAL $E100C9 ; VOLUME SONORE
* AND #$0F00
* STA SND
             LDA   #$0001
             STA   ECRAN       ; ECRAN=1

             PEA   $0000       ; recherche du slot
             _InitMouse

             PEA   0           ; X min
             PEA   312         ; X max
             PEA   0           ; Y min
             PEA   194         ; Y max
             _ClampMouse

             PEA   $0001       ; Mode Transparent
             _SetMouse

             STZ   A1
             STZ   AP
             STZ   POSX
             STZ   POSY        ; POINTEUR
             STZ   POSXA
             STZ   POSYA
             INC   POSX
             STZ   POSXI
             STZ   BOUT
             STZ   LACH

**** PRELIMINAIRES *****

             JSR   SAUV        ; OK
             JSR   DESS

* JSR SVB
* JSR DSB

* CLC
* XCE  ; 8 BIT
* SEP #$30
* JSR FADOU
* LDX #$00
* LDY #$0B ; BANK
* JSR FADIN ; FADE IN

             CLC
             XCE               ; 16 BIT
             REP   #$30
             LDA   #$0001
             STA   ECRAN
             JSR   SAUV        ; OK

             LDA   BBY
             ASL               ; POSY=POSY*2
             TAX               ; X=POSY*2
             LDA   TABLE,X
             CLC               ; ON TRANSFORME DES CORDONNEES X ET Y (POSX, POSY)
             ADC   BBX         ; EN UN NOMBRE (A1) AVEC A1=160*POSY+POSX
             STA   BBA
             STA   BBO

             JSR   SVB
             JSR   DSB
             JSR   BB          ; ON DESSINE 2 FOIS LA BOULE BLANCHE

             JSR   TIMETR
             JSR   LEVTR
             JSR   SCRTR
             JSR   CLEAR
             JSR   BPTR

*******************************************************

KBD          CLC
             XCE
             REP   #$30

LOOP         PHA
             PHA
             PHA
             _ReadMouse
             PLA               ; Etat de la souris (bouton...)

             CMP   #$C001
             BNE   CONTI1

             BRA   BOUTON1

CONTI1       PLY
             PLX
             STY   CONTI3+1
             STX   CONTI4+1
             STZ   BOUT
             LDA   BOUT3
             CMP   #$00A0      ; DELAI BOUTON
             BMI   CONTI2
             STZ   BOUT2
             JSR   CLRLI
             LDA   LACH
             CMP   #$0001      ; ON A LACHE LA BOULE
             BNE   CONTI2
             JMP   LACHE

CONTI2       INC   BOUT3
CONTI3       LDY   #$0000      ; coordonnee Y
CONTI4       LDX   #$0000      ; coordonnee X

             CPY   POSY        ; necessaire car le curseur n'est pas
             BNE   :noequal    ; synchronise, on affiche que si la
             CPX   POSX        ; position a change. tu peux supprimer
             BEQ   LOOP        ; ces 4 lignes pour voir la difference.

:noequal     STY   POSY        ; Y
             STX   POSX        ; X

             BRA   DEB

BOUTON1      LDA   #$0001
             STA   BOUT
             PLY
             PLX
             STY   POSY
             STX   POSX

*************************************************

DEB          CLC
             XCE
             REP   #$30

             LDA   POSX
             CMP   #$0139      ; BORD DROIT
             BPL   BD

             CMP   #$0000      ; BORD GAUCHE
             BMI   BG

             LDA   POSY        ; BORD BAS
             CMP   #$00C2
             BPL   BA

             CMP   #$0000      ; BORD HAUT
             BMI   BH

             BRA   DEB1


BD           LDA   #$0138      ; BORD DROIT
             STA   POSX
             BRA   DEB1

BG           STZ   POSX        ; BORD GAUCHE
             BRA   DEB1

BA           LDA   #$00C2      ; BORD BAS
             STA   POSY
             BRA   DEB1

BH           STZ   POSY        ; BORD HAUT
             BRA   DEB1



*************************************************

DEB1         LDA   A1          ; A1 POSITION ACTUELLE
             STA   AP          ; AP ANCIENNE POSITION

             LDA   POSX
             LSR   A           ; ON DIVISE POSX PAR 2 POUR QUE CA SOIT EN BYTES
             STA   POSXI       ; POSXI = POSX INTERMEDIAIRE

             LDA   POSY
             ASL   A           ; POSY=POSY*2
             TAX               ; X=POSY*2
             LDA   TABLE,X
             CLC               ; ON TRANSFORME DES CORDONNEES X ET Y (POSX, POSY)
             ADC   POSXI       ; EN UN NOMBRE (A1) AVEC A1=160*POSY+POSX
             STA   A1

             LDA   BOUT        ; BOUTON ENFONCE ?
             CMP   #$0000
             BEQ   PA

             JMP   BOUTON

***************************************************

PA           CLC
             LDA   POSX        ; ON REGARDE SI ON EST SUR UNE COLONNE
                               ; PAIR OU IMPAIR POUR DESSINER LE POINTEUR
             LSR

             BCC   PAIR
             BCS   IMPA

             RTS               ; FIN IMPOSSIBLE

PAIR         JMP   TRACE1

IMPA         JMP   TRACE2


*******************************************************


TRACE1       CLC
             XCE
             REP   #$30

             LDA   SYN
             CMP   #$0000
             BEQ   TRACE3

             JSR   SAUV
TRACE3       JSR   DESS        ; OK
             JSR   SAUV
             STZ   SYN

             LDX   A1          ; DESSINE LE POINTER POSITION PAIRE

             LDA   #$FFFF
             STAL  $012000,X   ; A1
             STAL  $012002,X   ; B1

             LDAL  $0120A0,X   ; A2
             AND   #$00FF
             ORA   #$000F
             STAL  $0120A0,X

             LDA   #$0F00      ; B2
             STAL  $0120A2,X

             LDAL  $012140,X   ; A3
             AND   #$F0FF
             ORA   #$F000
             STAL  $012140,X

             LDAL  $012142,X   ; B3
             AND   #$FF00
             ORA   #$F000
             STAL  $012142,X

             LDAL  $0121E0,X   ; A4
             ORA   #$0F00
             STAL  $0121E0,X

             LDAL  $0121E2,X   ; B4
             AND   #$FF00
             ORA   #$F000
             STAL  $0121E2,X

             LDAL  $012282,X   ; B5
             ORA   #$00FF
             STAL  $012282,X

             LDAL  $012322,X   ; B6
             ORA   #$000F
             STAL  $012322,X

             JMP   KBD

******************************************************

TRACE2       CLC
             XCE
             REP   #$30

             LDA   SYN
             CMP   #$0000
             BEQ   TRACE4

             JSR   SAUV
TRACE4       JSR   DESS        ; OK
             JSR   SAUV
             STZ   SYN

             LDX   A1

             LDAL  $012000,X   ; C1
             ORA   #$FF0F
             STAL  $012000,X

             LDA   #$FFFF      ; D1
             STAL  $012002,X

             LDAL  $012004,X   ; E1
             ORA   #$00F0
             STAL  $012004,X

             LDAL  $0120A0,X   ; C2
             AND   #$F0FF
             ORA   #$F000
             STAL  $0120A0,X

             LDA   #$0000      ; D2
             STAL  $0120A2,X

             LDAL  $0120A4,X   ; E2
             ORA   #$00F0
             STAL  $0120A4,X

             LDAL  $012140,X   ; C3
             ORA   #$0F00
             STAL  $012140,X

             LDA   #$0F00      ; D3
             STAL  $012142,X

             LDA   #$0FF0      ; D4
             STAL  $0121E2,X

             LDAL  $012282,X   ; D5
             ORA   #$F00F
             STAL  $012282,X

             LDAL  $012322,X   ; D6
             ORA   #$F000
             STAL  $012322,X

             JMP   KBD

******************************************************

DESS         CLC               ; DESSINE LE DECOR (LIE A AP), ANCIENNE POSITION
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

SAUV         CLC               ; SAUVEGARDE LE DECOR (LIE A A1), NOUVELLE POSITION
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

TABLE        HEX   0000A0004001E00180022003C00360040005A0054006E00680072008C0086009000AA00A400BE00B
             HEX   800C200DC00D600E000FA00F4010E01080112012C01260130014A0144015E01580162017C0176018
             HEX   0019A019401AE01A801B201CC01C601D001EA01E401FE01F80202021C02160220023A0234024E024
             HEX   80252026C02660270028A0284029E029802A202BC02B602C002DA02D402EE02E802F2030C0306031
             HEX   0032A0324033E03380342035C03560360037A0374038E0388039203AC03A603B003CA03C403DE03D
             HEX   803E203FC03F60400041A0414042E04280432044C04460450046A0464047E04780482049C049604A
             HEX   004BA04B404CE04C804D204EC04E604F0050A0504051E05180522053C05360540055A0554056E056
             HEX   80572058C0586059005AA05A405BE05B805C205DC05D605E005FA05F4060E06080612062C0626063
             HEX   0064A0644065E06580662067C06760680069A069406AE06A806B206CC06C606D006EA06E406FE06F
             HEX   80702071C07160720073A0734074E07480752076C07660770078A0784079E079807A207BC07B607C

DEC          HEX   000000000000000000000000000000000000000000000000

DECB         HEX   0000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000

A1           HEX   0000        ; POSITION ACTUELLE
AP           HEX   0000        ; ANCIENNE POSITION
POSX         HEX   0000        ; POSITION X (COMPRISE ENTRE 0 ET 312)
POSY         HEX   0000        ; POSITION Y (COMPRISE ENTRE 0 ET 194)
POSXA        HEX   0000        ; POSITION X ANCIENNE
POSYA        HEX   0000        ; POSITION Y ANCIENNE
POSX1        HEX   0000        ; POSITION POINTEUR POUR L'UTILISATION
POSY1        HEX   0000        ; POUR LA CREATION DE TABLE
POSXI        HEX   0000        ; POSITION X INTERMEDIAIRE (UTILISEE DANS UN CAL
BBX          HEX   6000        ; POSITION X BOULE B (COMPRISE ENTRE
BBY          HEX   6000        ; POSITION Y BOULE B (COMPRISE ENTRE
BBX1         HEX   0000        ; DERNIERE POSITION DE LA BOULE BLANCHE
BBY1         HEX   0000
BBX2         HEX   0000        ; UTILISE POUR DIRECTION
BBY2         HEX   0000
BBA          HEX   0000        ; BOULE BLANCHE ACTUELLE POSITION
BBO          HEX   0000        ; BOULE BLANCHE OLD POSITION
BBS          HEX   0000        ; BOULE BLANCHE SAUVEGARDE
SYN          HEX   0000        ;

ECRAN        HEX   0000        ; ECRAN N[...
BOUT2        HEX   0000        ; BOUTON ENFONCE TRACE ?
BOUT3        HEX   0000        ; BOUTON RELACHE ?
BOUT         HEX   0000        ; BOUTON ENFONCE ?

************************************************

BOUTON       STZ   BOUT3
             LDA   BOUT2
             CMP   #$0001
             BEQ   ECR4
             LDA   ECRAN
             CMP   #$0001
             BEQ   ECR1

* CMP #$0002
* BEQ ECR2
* CMP #$0003
* BEQ ECR3

             JMP   KBD         ; NO SCREEN ?

*ECR2 JMP ECRA2
*ECR3 JMP ECRA3
ECR4         JMP   CANNE

***************

ECR1         LDA   POSY
             CMP   #$00B8      ; 184
             BMI   BOULE
             CMP   #$00C3      ; 195
             BPL   RETOUR
             LDA   POSX
             CMP   #$0014      ; 20
             BMI   RETOUR
             CMP   #$005B      ; 91
             BMI   PANIC1
             CMP   #$007C      ; 124
             BMI   RETOUR
             CMP   #$00C3      ; 195
             BMI   OPTIONS1
             CMP   #$00E1      ; 225
             BMI   RETOUR
             CMP   #$012E      ; 296
             BMI   PAUSE1

             BRA   RETOUR

RETOUR       JMP   KBD

PAUSE1       JMP   KBD
OPTIONS1     JMP   KBD
PANIC1       JMP   KBD

BOULE        LDA   BBY
             SEC
             SBC   #$0003
             STA   BOU1+1
             CLC
             ADC   #$0005
             STA   BOU2+1
             LDA   BBX
             ASL               ; *2
             CLC
             ADC   #$0004
             STA   BOU4+1
             SEC
             SBC   #$0006
             STA   BOU3+1

             LDA   POSY
BOU1         CMP   #$0000
             BMI   RETOUR
BOU2         CMP   #$0000
             BPL   RETOUR
             LDA   POSX
BOU3         CMP   #$0000
             BMI   RETOUR
BOU4         CMP   #$0000
             BPL   RETOUR

             LDA   #$0001
             STA   BOUT2

             JMP   KBD

**********  ECRA2  **********

**********  ECRA3  **********

********************** BOULE BLANCHE *******************

BB           CLC
             XCE
             REP   #$30

BB1          LDA   BBA         ; BBA POSITION ACTUELLE
             STA   BBO         ; BBO ANCIENNE POSITION (OLD)

             LDA   BBY
             ASL   A           ; POSY=POSY*2
             TAX               ; X=POSY*2
             LDA   TABLE,X
             CLC               ; ON TRANSFORME DES CORDONNEES X ET Y (POSX, POSY)
             ADC   BBX         ; EN UN NOMBRE (A1) AVEC A1=160*POSY+POSX
             STA   BBA

***************************************************

TRABB        CLC               ; BOULE BLANCHE
             XCE
             REP   #$30

             CLC
             XCE
             SEP   #$30
SYNC1        LDA   $C019
             BMI   SYNC1
SYNC2        LDA   $C019
             BPL   SYNC2
             CLC
             XCE
             REP   #$30

             JSR   DSB         ; OK
             JSR   SVB

             LDX   BBA         ; DESSINE LA BOULE

             LDA   #$FFFF
             STAL  $011CE0,X   ;PARTIES BLANCHES
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
             STAL  $011EBE,X   ; BLANC/GRIS CLAIR
             STAL  $01209E,X
             LDA   #$FEFF
             STAL  $011EC2,X
             STAL  $0120A2,X

             LDAL  $011CDE,X   ; LIGNE 1
             AND   #$F0FF
             ORA   #$0D00
             STAL  $011CDE,X

             LDAL  $011CE2,X
             AND   #$FF0F
             ORA   #$00D0
             STAL  $011CE2,X

             LDAL  $011D7E,X   ; LIGNE 2
             AND   #$00FF
             ORA   #$FF00
             STAL  $011D7E,X

             LDAL  $011D82,X
             AND   #$FF00
             ORA   #$00FF
             STAL  $011D82,X

             LDAL  $011E1E,X   ; LIGNE 3
             AND   #$00F0
             ORA   #$FF0F
             STAL  $011E1E,X

             LDAL  $011E22,X
             AND   #$0F00
             ORA   #$F0FF
             STAL  $011E22,X

             LDAL  $01213E,X   ; LIGNE 8
             AND   #$00F0
             ORA   #$FF0F
             STAL  $01213E,X

             LDAL  $012142,X
             AND   #$0F00
             ORA   #$F0FF
             STAL  $012142,X

             LDAL  $0121DE,X   ; LIGNE 9
             AND   #$00FF
             ORA   #$FF00
             STAL  $0121DE,X

             LDAL  $0121E2,X
             AND   #$FF00
             ORA   #$00FF

             STAL  $0121E2,X

             LDAL  $01227E,X   ; LIGNE 10
             AND   #$F0FF
             ORA   #$0D00
             STAL  $01227E,X

             LDAL  $012282,X
             AND   #$FF0F
             ORA   #$00D0
             STAL  $012282,X

             RTS

******************************************************

DSB          CLC               ; DESSINE LE DECOR (LIE A AP), ANCIENNE POSITION
             XCE               ; BOULE BLANCHE
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
             LDA   DECB+20     ; 1 ere COLONNE
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
             LDA   DECB+40     ; 2 eme
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

SVB          CLC               ; SAUVEGARDE LE DECOR (LIE A BBA), NOUVELLE POSITION
             XCE               ; BOULE BLANCHE
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
             STA   DECB+18     ; 1 ere COLONNE
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
             STA   DECB+38     ; 2 eme COLONNE
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
             STA   DECB+58     ; 3 eme COLONNE

             RTS

*****************************************************************************

CANNE        CLC
             XCE
             REP   #$30

*******  DISTANCE  *******

             LDA   #$0001
             STA   LACH        ; BOULE PEUT ETRE LACHEE
             LDA   #$0F00
             STA   CLRLI2+1
             LDA   #$F000      ; LIGNE BLANCHE
             STA   CLRLI1+1
             LDA   DX
             LSR
             LSR
             ASL
             TAX               ; /2 /2 *2
             LDA   MUTAB,X     ; MULTI
             STA   DIS1+1
             LDA   DY
             LSR
             LSR
             ASL
             TAX               ; /2 /2 *2
             LDA   MUTAB,X
             CLC
DIS1         ADC   #$0000
             ASL               ; *16 /4
             ASL
             STA   DIST
             CMP   #$04E2      ; 1250
             BPL   CAN2
             CMP   #$0029
             BPL   CAN1

CAN2         LDA   #$0000
             STA   CLRLI2+1
             LDA   #$0000      ; LIGNE INVISIBLE
             STA   CLRLI1+1
             STZ   DIST        ; DIST=0
             STZ   LACH        ; LACH=0

CAN1         LDA   DIST
             STA   DIST2
             JSR   CLRLI

             LDA   POSX
             STA   X0
             LDA   POSY
             STA   Y0

             LDA   BBX
             ASL               ; *2
             STA   X1
             LDA   BBY
             STA   Y1

             JSR   LIGNE

             JMP   KBD

***************************

LACHE        LDA   A1
             STA   AP
             JSR   DESS        ; DESSINE LE DECOR DE FOND
             LDA   POSX
             STA   POSX1       ; INITIALISATION DE POSX1 ET POSY1
             LDA   POSY        ; AVANT LEUR UTILISATION
             STA   POSY1
             LDA   BBX
             STA   BBX1        ; SAUVEGARDE DE LA DERNIERE POSITION
             STA   BBX2
             LDA   BBY         ; AVANT DEPART
             STA   BBY1
             STA   BBY2

             STZ   SVYI
             LDA   #$0001
             STA   TABCRE      ; CREATION TAB
             LDY   #$0000
             JSR   LIGNE2

             LDA   X0
             CMP   X1          ; CREATION TAB1
             BPL   LACH2
             LDA   X1          ; X1>X0
             ASL
             SEC
             SBC   X0
             STA   X0
             BRA   LACH3
LACH2        LDA   X0
             ASL
             SEC
             SBC   X1
             STA   X1
LACH3        LDA   #$0001
             STA   TABCRE      ; CREATION
             STA   SVYI        ; TAB1
             LDY   #$0000
             JSR   LIGNE2
             STZ   SVYI
             STZ   TABCRE      ; INITIALISATION
             STZ   LACH

LACH1        LDA   BBA         ; SAUVEGARDE POSITION ACTUELLE
             STA   BBS
             LDY   SVY
             STY   GO1+1

*************

DIR          LDA   BBX2
             ASL               ; *2
             CMP   POSX1       ; OK
             BPL   DIR1

             LDA   POSY1       ; OK
             CMP   BBY2
             BPL   AD
             LDA   DX
             CMP   DY
             BPL   AD
             BRA   SB

DIR1         LDA   POSY1       ; OK
             CMP   BBY2
             BMI   SB
             LDA   DX
             CMP   DY
             BMI   AD

***** BOULE BLANCHE

SB           LDA   #$E938      ; SEC SBC
             STA   GO02
             LDA   #$0001
             STA   INV
             BRA   GO1

AD           LDA   #$6918      ; CLC ADC
             STA   GO02
             STZ   INV

*******
GO1          LDY   #$0000      ; DEPLACEMENT BOULE BLANCHE  SVY OU SVY1
             STY   GO01+1
GO00         LDA   DIST2
             CMP   #$0000
             BEQ   GOF
GO           LDA   BBA
             STA   BBO
GO01         LDY   #$0000
             DEY
             DEY
             STY   GO01+1
             CPY   #$0000
             BEQ   GOF1        ; ON EST AU BOUT DE LA TABLE

             LDA   SVYI
             CMP   #$0001
             BEQ   GO04
             LDA   TAB,Y
             STA   GO2+1
             BRA   GO05
GO04         LDA   TAB1,Y
             STA   GO2+1
GO05         LDA   BBS
GO02         SEC
GO2          SBC   #$0000      ; ADC OU SBC
             STA   BBA
             JSR   TRANS       ; TRANSFORMATION BBA EN BBX1 ET BBY1
             JMP   BORDU       ; BORDURES
GO3          JSR   AFF         ; AFFICHAGE
             DEC   DIST2
GO5          LDA   DIST2       ; NOUVELLE ROUTINE D'ARRET
             CMP   #$0000
             BEQ   GOF
             JSR   TIMETR
GO4          BRA   GO00

******* FIN

GOF1         LDA   BBA
             STA   BBS
             JMP   GO1

GOF          JSR   TRANS
             INC   POSX        ; OK POUR RE-AFFICHAGE
             INC   SYN
* JSR DESS
             JSR   GAGNE
             JSR   SCRTR
             LDA   GAGN
             CMP   #$0000
             BEQ   GOF2
             INC   LEVEL
             LDA   SCORE
             CLC
             ADC   #$002F      ; +47 SI NIVEAU FINI
             STA   SCORE
             JSR   CLEAR       ; NETTOIE LES BUMPERS
GOF2         JSR   BPTR        ; TRACE LES BUMPERS
             JSR   LEVTR       ; TRACE N[ LEVEL
             JSR   SCRTR       ; SCORE TRACE
             JMP   PA

************** SOUS ROUTINES **********************

***** BORDURE BLANCHE *********

BORDU        LDA   BBX         ;      VERIFICATION BORDURES
             CMP   #$000B      ; 12
             BMI   BX1         ;      BORDU X GAUCH
             INC   BMPV
             CMP   #$0093      ; 146
             BPL   BX1         ;      BORDU X DROIT
BORDU1       LDA   BBY
             CMP   #$0015      ; 22
             BMI   BY1I        ;      BORDU Y HAUT
             INC   BMPH
             CMP   #$0086      ; 133
             BPL   BY1I        ;      BORDU Y BAS
             STZ   BMPH
             STZ   BMPV
             JMP   GO3

BY1I         JMP   BY1         ; INTERMEDIAIRE

BX1          LDA   BBO
             STA   BBA
             STA   BBS
             JSR   TRANS       ; BBA EN BBX ET BBY
             LDA   BMPV        ; BUMPER ?
             CMP   #$0001
             BNE   BX14
             JMP   BX5
BX14         LDX   #$000C      ; 12
             STX   BX10+1
             LDA   LVBPA,X     ;
             CMP   #$0000
             BEQ   BX6         ; LE PREMIER A ZERO ON CONTINUE
             STA   BX7+1
             STA   BX9+1
             CLC
             ADC   #$0018      ; +24
             STA   BX8+1
             LDA   BBY
             SEC
             SBC   #$0012      ; 18 RECTIFICATION
BX7          CMP   #$0000      ; GAUCHE HAUT
             BPL   BX8
             BRA   BX6
BX8          CMP   #$0000      ; GAUCHE BAS
             BMI   BX9
BX6          LDX   #$000E      ; 14
             STX   BX10+1
             LDA   LVBPA,X
             CMP   #$0000
             BNE   BX22        ; ON SORT
             JMP   BX11
BX22         STA   BX12+1
             STA   BX9+1
             CLC
             ADC   #$0018      ; +24
             STA   BX13+1
             LDA   BBY
             SEC
             SBC   #$0012      ; 18 RECTIFICATION
BX12         CMP   #$0000      ; GAUCHE HAUT
             BPL   BX13
             JMP   BX11
BX13         CMP   #$0000      ; GAUCHE BAS
             BMI   BX9
             JMP   BX11
BX9          LDA   #$0000      ; LVBPA
             STA   BPTRAC4+1
             LDA   #$0007      ; COULEUR BLEU
             STA   BPCOUL4+1
             JSR   BPTRAC4
             LDA   #$0003      ; COULEUR ROSE
             STA   BPCOUL4+1
             LDA   SCORE
             CLC
             ADC   #$0010      ; SCORE +16 SI TOUCHE
             STA   SCORE
BX10         LDX   #$0000
             STZ   LVBPA,X
             JMP   BX11
BX5          LDX   #$0004      ; 4
             STX   BX21+1
             LDA   LVBPA,X     ;
             CMP   #$0000
             BEQ   BX17        ; LE PREMIER A ZERO ON CONTINUE
             STA   BX15+1
             STA   BX20+1
             CLC
             ADC   #$0018      ; +24
             STA   BX16+1
             LDA   BBY
             SEC
             SBC   #$0012      ; 18 RECTIFICATION
BX15         CMP   #$0000      ; GAUCHE HAUT
             BPL   BX16
             BRA   BX17
BX16         CMP   #$0000      ; GAUCHE BAS
             BMI   BX20
BX17         LDX   #$0006      ;
             STX   BX21+1
             LDA   LVBPA,X
             CMP   #$0000
             BEQ   BX11        ; ON SORT
             STA   BX18+1
             STA   BX20+1
             CLC
             ADC   #$0018      ; +24
             STA   BX19+1
             LDA   BBY
             SEC
             SBC   #$0012      ; 18 RECTIFICATION
BX18         CMP   #$0000      ; GAUCHE HAUT
             BPL   BX19
             JMP   BX11
BX19         CMP   #$0000      ; GAUCHE BAS
             BMI   BX20
             JMP   BX11
BX20         LDA   #$0000      ; LVBPA
             STA   BPTRAC2+1
             LDA   #$0070      ; COULEUR BLEU
             STA   BPCOUL2+1
             JSR   BPTRAC2
             LDA   #$0030      ; COULEUR ROSE
             STA   BPCOUL2+1
             LDA   SCORE
             CLC
             ADC   #$0010
             STA   SCORE       ; SCORE +16
BX21         LDX   #$0000
             STZ   LVBPA,X
BX11         STZ   BMPV
             LDA   SVYI
             CMP   #$0001
             BEQ   BX2
             LDA   #$0001      ; TAB
             STA   SVYI
             LDA   SVY1
             STA   GO1+1
             LDA   LI
             CMP   #$0002
             BNE   BX3
             INC   INV
             BRA   BX3
BX2          STZ   SVYI        ; TAB1
             LDA   SVY
             STA   GO1+1
             LDA   LI1
             CMP   #$0002
             BNE   BX3
             INC   INV
BX3          LDA   INV
             CMP   #$0001
             BEQ   BX4
             JMP   SB
BX4          JMP   AD


BY1          LDA   BBO
             STA   BBA
             STA   BBS
             JSR   TRANS       ; BBA EN BBX ET BBY
             LDA   BMPH        ; BUMPER ?
             CMP   #$0001
             BNE   BY14
             JMP   BY5
BY14         LDX   #$0000      ;ON PREND LE PREMIER HAUT
             STX   BY10+1
             LDA   LVBPA,X     ;
             CMP   #$0000
             BEQ   BY6         ; LE PREMIER A ZERO ON CONTINUE
             STA   BY7+1
             STA   BY9+1
             CLC
             ADC   #$0010      ; 32/2 LONGUEUR BUMPER
             STA   BY8+1
             LDA   BBX
             SEC
             SBC   #$0009      ; 9 RECTIFICATION ORIGINE
BY7          CMP   #$0000      ; LVPBA      HAUT GAUCHE
             BPL   BY8
             BRA   BY6
BY8          CMP   #$0000      ; LVPBA+32/2 HAUT GAUCHE
             BMI   BY9
BY6          LDX   #$0002      ; ON PREND LE DEUXIEME
             STX   BY10+1
             LDA   LVBPA,X
             CMP   #$0000
             BNE   BY22        ; ON SORT SI = 0
             JMP   BY11
BY22         STA   BY12+1
             STA   BY9+1
             CLC
             ADC   #$0010      ; 32/2  LONGUEUR BUMPER
             STA   BY13+1
             LDA   BBX
             SEC
             SBC   #$0009      ; 9 RECTIFICATION ORIGINE
BY12         CMP   #$0000      ; LVBPA  HAUT DROITE
             BPL   BY13
             JMP   BY11
BY13         CMP   #$0000      ; LVBPA+32/2 HAUT DROITE
             BMI   BY9
             JMP   BY11
BY9          LDA   #$0000      ; LVBPA
             STA   BPTRAC1+1
             LDA   #$7777      ; COULEUR BLEU
             STA   BPCOUL1+1
             JSR   BPTRAC1
             LDA   #$3333      ; COULEUR ROSE
             STA   BPCOUL1+1
             LDA   SCORE
             CLC
             ADC   #$0010
             STA   SCORE       ; SCORE +10
BY10         LDX   #$0000
             STZ   LVBPA,X
             JMP   BY11
BY5          LDX   #$0008      ; 8  BAS DROITE
             STX   BY21+1
             LDA   LVBPA,X     ;
             CMP   #$0000
             BEQ   BY17        ; LE PREMIER A ZERO ON CONTINUE
             STA   BY15+1
             STA   BY20+1
             CLC
             ADC   #$0010      ; 32/2 LONGUEUR BUMPER
             STA   BY16+1
             LDA   BBX
             SEC
             SBC   #$0009      ; 9 RECTIFICATION ORIGINE
BY15         CMP   #$0000      ; LVBPA BAS DROITE
             BPL   BY16
             BRA   BY17
BY16         CMP   #$0000      ; LVBPA BAS GAUCHE
             BMI   BY20
BY17         LDX   #$000A      ; LVBPA BAS GAUCHE
             STX   BY21+1
             LDA   LVBPA,X
             CMP   #$0000
             BEQ   BY11        ; ON SORT SI=0
             STA   BY18+1
             STA   BY20+1
             CLC
             ADC   #$0010      ; 32/2 LONGUEUR BUMPER
             STA   BY19+1
             LDA   BBX
             SEC
             SBC   #$0009      ; 9 RECTIFICATION ORIGINE
BY18         CMP   #$0000      ; LVBPA BAS DROITE
             BPL   BY19
             JMP   BY11
BY19         CMP   #$0000      ; LVBPA BAS DROITE
             BMI   BY20
             JMP   BY11
BY20         LDA   #$0000      ; LVBPA
             STA   BPTRAC3+1
             LDA   #$7777      ; COULEUR BLEU
             STA   BPCOUL3+1
             JSR   BPTRAC3
             LDA   #$3333      ; COULEUR ROSE
             STA   BPCOUL3+1
             LDA   SCORE
             CLC
             ADC   #$0010
             STA   SCORE       ; SCORE +16
BY21         LDX   #$0000
             STZ   LVBPA,X
BY11         STZ   BMPH
             LDA   SVYI
             CMP   #$0001
             BEQ   BY2
             LDA   #$0001      ; TAB
             STA   SVYI
             LDA   SVY1
             STA   GO1+1
             LDA   LI
             CMP   #$0001
             BNE   BY3
             INC   INV
             BRA   BY3
BY2          STZ   SVYI        ; TAB1
             LDA   SVY
             STA   GO1+1
             LDA   LI1
             CMP   #$0001
             BNE   BY3
             INC   INV
BY3          LDA   INV
             CMP   #$0001
             BEQ   BY4
             JMP   SB
BY4          JMP   AD

************************************************************************************
************************************************************************************

AFF          JSR   TRABB       ; ON AFFICHE LA BOULE BLANCHE
             JSR   WAIT
             RTS

WAIT         LDA   DIST2       ; ATTENTE BOULE BLANCHE
             LSR
             LSR
             LSR               ; /2*2*2*2=16
             LSR
             STA   WAIT2+1
             LDA   #$004F
             SEC
WAIT2        SBC   #$0000
             STA   WAIT3
             BRA   WAIT5
WAIT3        HEX   0000
WAIT5        CLC
             XCE               ; 8 BIT
             SEP   #$30
             LDA   WAIT3
             JSR   $FCA8
             CLC
             XCE               ; 16 BIT
             REP   #$30
             RTS

TRANS        LDA   BBA         ; ON TRANSFORME BBA EN BBX ET BBY
             STA   TRANS1+1
             LDX   #$0000
             LDY   #$0000
TRANS1       LDA   #$0000      ; BBA
             CMP   #$00A0
             BMI   TRANS2
             SEC
             SBC   #$00A0
             STA   TRANS1+1
             INY
             BRA   TRANS1
TRANS2       TAX
             STX   BBX
             STY   BBY
             RTS

CLEAR        LDA   #$4444      ; NETTOYAGE BORD BILLARD
             LDX   #$008A
CL1          STAL  $012969,X
             STAL  $017649,X
             DEX
             DEX
             BPL   CL1
             LDX   #$00A0
CL2          LDA   #$5455
             STAL  $012967,X
             LDA   #$4566
             STAL  $0129F5,X
             TXA
             CLC
             ADC   #$00A0
             TAX
             CMP   #$4CE0
             BNE   CL2
             RTS

TIMETR       LDA   TIMEREG     ; TIME TRACE
             CMP   #$0000
             BEQ   TIMETR5
             DEC   TIMEREG
             RTS
TIMETR5      LDA   #$0020
             STA   TIMEREG
             LDA   TIME
             CMP   #$0000
             BEQ   TIMETR3
             DEC   TIME
             BRA   TIMETR4
TIMETR3      LDA   MINU
             CMP   #$0000
             BEQ   TIMEFIN
             DEC   MINU
             LDA   #$003B
             STA   TIME
             BRA   TIMETR4
TIMEFIN      STZ   TIME
             STZ   MINU
             LDA   #$0001
             STA   PERDU       ; TEMPS ECOULE
TIMETR4      LDX   #$0000
             LDY   #$0000
             LDA   TIME        ; LEVEL EN HEXA
             STA   TIMETR1+1
TIMETR1      LDA   #$0000
             CMP   #$000A
             BMI   TIMETR2
             SEC
             SBC   #$000A
             INX
             STA   TIMETR1+1
             BRA   TIMETR1
TIMETR2      TAY
             STY   TIM2        ; CHIFFRE DES UNITES
             STX   TIM1        ; CHIFFRE DES DIZAINES
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

LEVTR        LDX   #$0000      ; LEVEL TRACE
             LDY   #$0000
             LDA   LEVEL       ; LEVEL EN HEXA
             STA   LEVTR1+1
LEVTR1       LDA   #$0000
             CMP   #$000A
             BMI   LEVTR2
             SEC
             SBC   #$000A
             INX
             STA   LEVTR1+1
             BRA   LEVTR1
LEVTR2       TAY
             STY   LEV2        ; CHIFFRE DES UNITES
             STX   LEV1        ; CHIFFRE DES DIZAINES
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

SCRTR        LDX   #$0000      ; SCORE TRACE
             LDY   #$0000
             LDA   SCORE
             STA   SCRTR1+1
SCRTR1       LDA   #$0000      ; SCORE
             CMP   #$000A
             BMI   SCRTR2
             SEC
             SBC   #$000A
             INX
             STA   SCRTR1+1
             BRA   SCRTR1
SCRTR2       TAY               ; UNITES
             STY   SCR1
             STX   SCRTR3+1
             LDX   #$0000
             LDY   #$0000
SCRTR3       LDA   #$0000
             CMP   #$000A
             BMI   SCRTR4
             SEC
             SBC   #$000A
             INX
             STA   SCRTR3+1
             BRA   SCRTR3
SCRTR4       TAY
             STY   SCR2
             STX   SCRTR5+1
             LDX   #$0000
             LDY   #$0000
SCRTR5       LDA   #$0000
             CMP   #$000A
             BMI   SCRTR6
             SEC
             SBC   #$000A
             INX
             STA   SCRTR5+1
             BRA   SCRTR5
SCRTR6       TAY
             STY   SCR3
             STX   SCRTR7+1
             LDX   #$0000
             LDY   #$0000
SCRTR7       LDA   #$0000
             CMP   #$000A
             BMI   SCRTR8
             SEC
             SBC   #$000A
             INX
             STA   SCRTR7+1
             BRA   SCRTR7
SCRTR8       TAY
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

CHITR        LDY   #$0000      ; CHIFFRE TRACE
             LDA   CHIFR
             ASL
             ASL               ; *5
             CLC
             ADC   CHIFR
             ASL
             TAX
CHITR2       LDA   CHI,X
CHITR1       STAL  $012000
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
CHIFR        HEX   0000        ; COMPRIS ENTRE 0 ET 9

LCHTR        LDY   #$0000      ; LEVEL CHIFFRE TRACE
             LDA   LCH
             ASL
             ASL
             ASL
             ASL
             SEC
             SBC   LCH
             SEC               ; *14
             SBC   LCH
             STA   LCHTR3+1
             ASL
             TAX
LCHTR2       LDA   LVL,X
LCHTR1       STAL  $012000
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
LCHTR3       LDA   #$0000
             CLC
             ADC   #$0007
             ASL
             TAX
LCHTR4       LDA   LVL,X
LCHTR5       STAL  $012000
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
LCH          HEX   0000        ; COMPRIS ENTRE 0 ET 9

BPTR         LDA   LEVEL       ; BUMPER TRACE
             ASL
             ASL               ; *8
             ASL
             ASL               ; ENTREE TABLE
             TAX
             STX   BPTRCOP1+1
             LDY   #$0000
BPTRCOP      LDA   LVBP,X
             STA   LVBPA,Y
             INX
             INX               ; ON COPIE LE LEVEL DANS LVBPA
             INY
             INY
             CPY   #$0010
             BMI   BPTRCOP
BPTRCOP1     LDX   #$0000
             STX   BPTR1+1
             LDA   LVBP,X      ;
             CMP   #$0000
             BEQ   BPTR1
             STA   BPTRAC1+1
             JSR   BPTRAC1
BPTR1        LDX   #$0000
             INX
             INX
             STX   BPTR2+1
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR2
             STA   BPTRAC1+1
             JSR   BPTRAC1
BPTR2        LDX   #$0000
             INX
             INX
             STX   BPTR3+1
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR3
             STA   BPTRAC2+1
             JSR   BPTRAC2
BPTR3        LDX   #$0000
             INX
             INX
             STX   BPTR4+1
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR4
             STA   BPTRAC2+1
             JSR   BPTRAC2
BPTR4        LDX   #$0000
             INX
             INX
             STX   BPTR5+1
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR5
             STA   BPTRAC3+1
             JSR   BPTRAC3
BPTR5        LDX   #$0000
             INX
             INX
             STX   BPTR6+1
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR6
             STA   BPTRAC3+1
             JSR   BPTRAC3
BPTR6        LDX   #$0000
             INX
             INX
             STX   BPTR7+1
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR7
             STA   BPTRAC4+1
             JSR   BPTRAC4
BPTR7        LDX   #$0000
             INX
             INX
             LDA   LVBP,X
             CMP   #$0000
             BEQ   BPTR8
             STA   BPTRAC4+1
             JSR   BPTRAC4
BPTR8        RTS

BPTRAC1      LDA   #$0000      ; TRACE HAUT
             CLC
             ADC   #$0969
             TAX
             LDY   #$0000
BPCOUL1      LDA   #$3333      ; COULEUR
BPTRAC12     STAL  $012000,X
             INX
             INX
             INY
             CPY   #$0008
             BMI   BPTRAC12
             RTS
BPTRAC2      LDA   #$0000      ; TRACE DROITE
             ASL
             TAX
             LDA   TABLE,X
             CLC
             ADC   #$2A96
             STA   BPTRAC22+1
             STA   BPTRAC23+1
             LDY   #$0000
BPTRAC22     LDAL  $012000
             AND   #$FF0F
BPCOUL2      ORA   #$0030
BPTRAC23     STAL  $012000
             LDA   BPTRAC22+1
             CLC
             ADC   #$00A0
             STA   BPTRAC22+1
             STA   BPTRAC23+1
             INY
             CPY   #$0018
             BMI   BPTRAC22
             RTS
BPTRAC3      LDA   #$0000      ; TRACE BAS
             CLC
             ADC   #$5649
             TAX
             LDY   #$0000
BPCOUL3      LDA   #$3333      ; COULEUR
BPTRAC32     STAL  $012000,X
             INX
             INX
             INY
             CPY   #$0008
             BMI   BPTRAC32
             RTS
BPTRAC4      LDA   #$0000      ; TRACE GAUCHE
             ASL
             TAX
             LDA   TABLE,X
             CLC
             ADC   #$2A08
             STA   BPTRAC42+1
             STA   BPTRAC43+1
             LDY   #$0000
BPTRAC42     LDAL  $012000
             AND   #$FFF0
BPCOUL4      ORA   #$0003
BPTRAC43     STAL  $012000
             LDA   BPTRAC42+1
             CLC
             ADC   #$00A0
             STA   BPTRAC42+1
             STA   BPTRAC43+1
             INY
             CPY   #$0018
             BMI   BPTRAC42
             RTS

GAGNE        LDX   #$0000
GAGNE1       LDA   LVBPA,X
             CMP   #$0000
             BEQ   GAGNE2
             STZ   GAGN
             RTS
GAGNE2       INX
             INX
             CPX   #$0010
             BMI   GAGNE1
             LDA   #$0001
             STA   GAGN
             RTS

*************************************************************************

CLRLI        LDA   POSXA       ; CLEAR LIGNE
             STA   X0
             LDA   POSYA
             STA   Y0

             LDA   BBX
             ASL
             STA   X1
             LDA   BBY
             STA   Y1

             LDA   #$EAEA      ; NOP NOP
             STA   PLOT6+4
             STA   PLOT5+4
             STA   PLOT6+5     ; ORA
             STA   PLOT5+5
             LDA   #$0120
             STA   PLOT6+2
             STA   PLOT5+2
             STA   PLOT6+9
             STA   PLOT5+9

             JSR   LIGNE2

             LDA   #$E120
             STA   PLOT6+2
             STA   PLOT5+2
             STA   PLOT6+9
             STA   PLOT5+9
             LDA   #$0009
             STA   PLOT6+4
             STA   PLOT5+4
CLRLI1       LDA   #$F000
             STA   PLOT6+5
CLRLI2       LDA   #$0F00
             STA   PLOT5+5

             RTS

************************************ LIGNE *************************************

**************  CALCUL  DX  DY  ************

             CLC
             XCE
             REP   #$30

LIGNE        LDA   POSX
             STA   POSXA
             LDA   POSY
             STA   POSYA

LIGNE2       LDA   X0          ; **
             CMP   X1
             BMI   DXP         ; X0<X1

DXN          LDA   X0          ; DX=X1-X0 < 0
             SEC
             SBC   X1
             STA   DX
             BRA   DY1

DXP          LDA   X1          ; DX=X1-X0 > 0
             SEC
             SBC   X0
             STA   DX

DY1          LDA   Y0
             CMP   Y1
             BMI   DYP         ; Y0<Y1

DYN          LDA   Y0          ; DY=Y1-Y0 < 0
             SEC
             SBC   Y1
             STA   DY
             BRA   DEL

DYP          LDA   Y1          ; DY=Y1-Y0 > 0
             SEC
             SBC   Y0
             STA   DY

DEL          LDA   DX
             CMP   DY
             BPL   DXDY        ; DX>DY
             JMP   DYDX        ; DX<DY

*******************************************************
**********************  DX > DY  **********************
*******************************************************

DXDY         LDA   DY
             STA   DXDY3+1
             STA   DXDY6+1
             STA   DXDY8+1
             STA   DXDY11+1

             LDA   DX
             SEC
             SBC   DY
             STA   DXDY4+1     ; DX-DY
             STA   DXDY9+1

*** SWAP ***

             LDA   X1
             CMP   X0
             BPL   DXDY1       ; X1 > X0

             LDX   X0
             LDA   X1          ; X1 = X0
             STA   X0          ; X0 = X1
             STX   X1

             LDX   Y0
             LDA   Y1          ; Y1 = Y0
             STA   Y0          ; Y0 = Y1
             STX   Y1

************

DXDY1        LDA   X0
             STA   X           ; X=X0
             LDA   Y0
             STA   Y           ; Y=Y0

             LDA   Y1
             CMP   Y0
             BPL   DXDY13      ; DY>0

*****

             LDA   SVYI
             CMP   #$0001
             BEQ   DXDY12
             LDA   #$0001
             STA   LI
             BRA   PL1
DXDY12       LDA   #$0001
             STA   LI1

PL1          JSR   PLOT        ; DY<0
             LDA   X
             CMP   X1          ; X=X1 ?
             BNE   DXDY2
             LDA   Y
             CMP   Y1          ; Y=Y1 ?
             BNE   DXDY2
             RTS               ; FIN

DXDY2        INC   X           ; X=X+1
             LDA   OF

DXDY3        CMP   #$0000      ; OD=DY
             BPL   DXDY5

             LDA   OF
             CLC
DXDY4        ADC   #$0000      ; DEL
             STA   OF
             DEC   Y           ; Y=Y-1
             BRA   PL1

DXDY5        LDA   OF
             SEC
DXDY6        SBC   #$0000      ; OD=DY
             STA   OF

             BRA   PL1

******

DXDY13       LDA   SVYI
             CMP   #$0001
             BEQ   DXDY14
             LDA   #$0001
             STA   LI
             BRA   PL2
DXDY14       LDA   #$0001
             STA   LI1

PL2          JSR   PLOT        ; DY>0
             LDA   X
             CMP   X1          ; X=X1 ?
             BNE   DXDY7
             LDA   Y
             CMP   Y1          ; Y=Y1 ?
             BNE   DXDY7
             RTS               ; FIN

DXDY7        INC   X           ; X=X+1
             LDA   OF
DXDY8        CMP   #$0000      ; OD=DY
             BPL   DXDY10

             LDA   OF
             CLC
DXDY9        ADC   #$0000      ; DEL
             STA   OF
             INC   Y           ; Y=Y+1
             BRA   PL2

DXDY10       LDA   OF
             SEC
DXDY11       SBC   #$0000      ; OD=DY
             STA   OF

             BRA   PL2

*******************************************************
**********************  DX < DY  **********************
*******************************************************

DYDX         LDA   DX
             STA   DYDX3+1
             STA   DYDX6+1
             STA   DYDX8+1
             STA   DYDX11+1

             LDA   DY
             SEC
             SBC   DX
             STA   DYDX4+1     ; DY-DX
             STA   DYDX9+1

*** SWAP ***

             LDA   Y1
             CMP   Y0
             BPL   DYDX1       ; Y1 > Y0

             LDX   X0
             LDA   X1          ; X1 = X0
             STA   X0          ; X0 = X1
             STX   X1

             LDX   Y0
             LDA   Y1          ; Y1 = Y0
             STA   Y0          ; Y0 = Y1
             STX   Y1

************

DYDX1        LDA   X0
             STA   X           ; X=X0
             LDA   Y0
             STA   Y           ; Y=Y0

             LDA   X1
             CMP   X0
             BPL   DYDX13      ; DX>0

*****

             LDA   SVYI
             CMP   #$0001
             BEQ   DYDX12
             LDA   #$0002
             STA   LI
             BRA   PL3
DYDX12       LDA   #$0002
             STA   LI1

PL3          JSR   PLOT        ; DX<0
             LDA   X
             CMP   X1          ; X=X1 ?
             BNE   DYDX2
             LDA   Y
             CMP   Y1          ; Y=Y1 ?
             BNE   DYDX2
             RTS               ; FIN

DYDX2        INC   Y           ; Y=Y+1
             LDA   OF
DYDX3        CMP   #$0000      ; OD=DX
             BPL   DYDX5

             LDA   OF
             CLC
DYDX4        ADC   #$0000      ; DEL
             STA   OF
             DEC   X           ; X=X-1
             BRA   PL3

DYDX5        LDA   OF
             SEC
DYDX6        SBC   #$0000      ; OD=DX
             STA   OF

             BRA   PL3

******

DYDX13       LDA   SVYI
             CMP   #$0001
             BEQ   DYDX14
             LDA   #$0002
             STA   LI
             BRA   PL4
DYDX14       LDA   #$0002
             STA   LI1

PL4          JSR   PLOT        ; DX>0
             LDA   X
             CMP   X1          ; X=X1 ?
             BNE   DYDX7
             LDA   Y
             CMP   Y1          ; Y=Y1 ?
             BNE   DYDX7
             RTS               ; FIN

DYDX7        INC   Y           ; Y=Y+1
             LDA   OF
DYDX8        CMP   #$0000      ; OD=DX
             BPL   DYDX10

             LDA   OF
             CLC
DYDX9        ADC   #$0000      ; DEL
             STA   OF
             INC   X           ; X=X+1
             BRA   PL4

DYDX10       LDA   OF
             SEC
DYDX11       SBC   #$0000      ; OD=DX
             STA   OF

             BRA   PL4

********************** PLOT **********************

             CLC
             XCE               ; 16 BIT
             REP   #$30

PLOT         LDA   TABCRE      ; LIGNE OU CREATION DE TABLE ?
             CMP   #$0001
             BNE   PLOT7
             BRA   CREA1

PLOT7        LDA   X
             LSR   A           ; DERNIER BIT DANS LA RETENUE
             BCC   PLOT1       ; PAIR
             BRA   PLOT3       ; IMPAIR

*********  X EST PAIR  **********

PLOT1        LDA   X           ; X
             LSR   A           ; X/2
             STA   PLOT2+1
             LDA   Y           ; Y
             ASL   A           ; Y*2
             TAX
             LDA   TABLE,X     ; A0*Y
             CLC
PLOT2        ADC   #$0000      ; X/2
             TAX

PLOT6        LDAL  $E12000,X
             ORA   #$F000
             STAL  $E12000,X

             RTS

*******  X EST IMPAIR  *********

PLOT3        LDA   X           ; X
             LSR   A           ; X/2
             STA   PLOT4+1
             LDA   Y           ; Y
             ASL   A           ; Y*2
             TAX
             LDA   TABLE,X     ; A0*Y
             CLC
PLOT4        ADC   #$0000      ; X/2
             TAX

PLOT5        LDAL  $E12000,X
             ORA   #$0F00
             STAL  $E12000,X

             RTS

**********     CREATION TABLE     **********************

CREA1        LDA   SVYI
             CMP   #$0001
             BEQ   CREA11

             LDA   X           ; X      TAB
             LSR               ; X/2
             STA   CREA2+1
             LDA   Y           ; Y
             ASL               ; Y*2
             TAX
             LDA   TABLE,X     ; A0*Y
             CLC
CREA2        ADC   #$0000      ; X/2
             INY
             INY
             STA   TAB,Y
             STY   SVY
             BRA   CREA10

CREA11       LDA   X           ; X       TAB1
             LSR               ; X/2
             STA   CREA12+1
             LDA   Y           ; Y
             ASL               ; Y*2
             TAX
             LDA   TABLE,X     ; A0*Y
             CLC
CREA12       ADC   #$0000      ; X/2
             INY
             INY
             STA   TAB1,Y
             STY   SVY1

CREA10       LDA   X1
             LSR
             STA   CREA4+1
             LDA   Y1
             ASL
             TAX
             LDA   TABLE,X
             CLC               ; ON TRANSFORME DES CORDONNEES X1 ET Y1
CREA4        ADC   #$0000
             STA   CREA7+1
             STA   CREA9+1

             LDA   SVYI
             CMP   #$0001
             BEQ   CREA8

CREA6        LDA   TAB,Y       ; TAB
             SEC
CREA7        SBC   #$0000
             STA   TAB,Y
             RTS

CREA8        LDA   TAB1,Y      ; TAB1
             SEC
CREA9        SBC   #$0000
             STA   TAB1,Y
             RTS

*****************  TABLE LIGNE  *********************

X0           HEX   0000
Y0           HEX   0000
X1           HEX   0000
Y1           HEX   0000
DX           HEX   0000        ; ABS DX
DY           HEX   0000        ; ABS DY
X            HEX   0000
Y            HEX   0000
OF           HEX   0000        ; VARIABLE
OD           HEX   0000        ; VARIABLE

LI           HEX   0000        ; LIGNE INFO TAB
LI1          HEX   0000        ; LIGNE INFO TAB1
INV          HEX   0000        ; UTILISATION DE DIR
DIST         HEX   0000        ; DISTANCE^2
DIST2        HEX   0000        ; DISTANCE PARCOURUE PAR LA BOULE AVANT STOP
LACH         HEX   0000        ; BOULE LACHEE ?
TABCRE       HEX   0000        ; TABLE CREATION
SVY          HEX   0000        ; SAUVEGARDE Y TAB
SVY1         HEX   0000        ; SAUVEGARDE Y TAB 1
SVYI         HEX   0000        ; INDICATION SUR TAB OU TAB1
LEVEL        HEX   0000        ; NIVEAU ENTRE 0 ET 99
LEV1         HEX   0000        ; CHIFFRE DES DIZAINES
LEV2         HEX   0000        ; CHIFFRE DES UNITES
SCORE        HEX   0000        ; SCORE
SCR1         HEX   0000
SCR2         HEX   0000
SCR3         HEX   0000        ; SCORE
SCR4         HEX   0000
SCR5         HEX   0000
MINU         HEX   0900
TIME         HEX   0000        ; TEMPS
TIM1         HEX   0000
TIM2         HEX   0000
TIMEREG      HEX   0000        ; REGULATEUR TEMPS
PERDU        HEX   0000        ; PERDU ? = TEMPS ECOULE
BMPH         HEX   0000        ; BUMPER HORIZONTAL
BMPV         HEX   0000        ; BUMPER VERTICAL
GAGN         HEX   0000        ; GAGNE ?

MUTAB        HEX   0000010004000900100019002400310040005100640079009000A900C400E100
             HEX   00012101440169019001B901E401110240027102A402D902100349038403C103
             HEX   000441048404C90410055905A405F10540069106E40639079007E9074408A108
             HEX   00096109C409290A900AF90A640BD10B400CB10C240D990D100E890E040F810F
             HEX   0010811004118911101299122413B1134014D1146415F91590162917C4176118
             HEX   0019A119441AE91A901B391CE41C911D401EF11EA41F59201021C92184224123
             HEX   0024C124842549261027D927A4287129402A112BE42BB92C902D692E442F2130
             HEX   0031E131C432A933903479356436513740383139243A193B103C093D043E013F
             HEX   0040014104420943104419452446314740485149644A794B904CA94DC44EE14F

TAB          HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000

TAB1         HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000
             HEX   0000000000000000000000000000000000000000000000000000000000000000

CHI          HEX   D333D3D3D3D3D3D3D333
             HEX   DD3DD33DDD3DDD3DD333
             HEX   D333DDD3D333D3DDD333
             HEX   D333DDD3DD33DDD3D333
             HEX   D3D3D3D3D333DDD3DDD3
             HEX   D333D3DDD333DDD3D333
             HEX   D333D3DDD333D3D3D333
             HEX   D333DDD3DDD3DD3DDD3D
             HEX   D333D3D3D333D3D3D333
             HEX   D333D3D3D333DDD3D333

LVL          HEX   0111110011001100110011000111
             HEX   1000110011001100110011001000
             HEX   0011111100110011001100111111
             HEX   0000000000000000000000001100
             HEX   0111110000000001001101101111
             HEX   1000110011001000000000001100
             HEX   0111110000000011000011000111
             HEX   1000110011001000110011001000
             HEX   1100110011001100111100000000
             HEX   0000110011001100110011001100
             HEX   1111110011110000000011000111
             HEX   1000000010001100110011001000
             HEX   0111110011111100110011000111
             HEX   1000000010001100110011001000
             HEX   1111000000010011001101100110
             HEX   1100110010000000000000000000
             HEX   0111110011000111110011000111
             HEX   1000110011001000110011001000
             HEX   0111110011001100011100000111
             HEX   1000110011001100110011001000

LVBPA        HEX   00000000000000000000000000000000  ; BUMPERS EN COURS

LVBP         HEX   40000000000000000000000000000000  ; BUMPERS LEVEL 0
             HEX   40000000000000004000000000000000  ;
             HEX   00000000100000000000000000000000

             HEX   09004000030040000A00600005006000  ; BUMPERS LEVEL

***********************************************************

JAUNE        CLC               ; BORDU
             XCE
             SEP   #$30
             LDA   $C034
             AND   #$F0
             ORA   #$0D
             STA   $C034
             CLC
             XCE
             REP   #$30
             RTS

NOIR         CLC               ; GO2
             XCE
             SEP   #$30
             LDA   $C034
             AND   #$F0
             ORA   #$00
             STA   $C034
             CLC
             XCE
             REP   #$30
             RTS

KEY          CLC
             RTS
             XCE
             SEP   #$30
KEY1         LDA   $C000
             BPL   KEY1
             BIT   $C010
             CLC
             XCE
             REP   #$30
             RTS

**************************************************************

