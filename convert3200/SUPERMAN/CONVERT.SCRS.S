
            LST   OFF                  ; SCREEN SAVER

SCRSAV      SEI
            LDA   #$0000
            LDX   #$7FFE
SCRSAV1     STAL  $012000,X
            DEX                        ; NETTOY L'IMAGE
            DEX
            BPL   SCRSAV1

            LDX   #$001E
SCRSAV5     LDA   SCRSPAL1,X           ; PALETTE BLEU
            STAL  $019E00,X
            DEX
            DEX
            BPL   SCRSAV5

SCRSAV2     JSR   TRA                  ; ON TRACE
            JSR   DECAL
            JSR   VERIF
SCRSAV3     ldal  $e0bfff
            bmi   SCRSAV4              ; ON SORT
            ldal  $e0c026              ; BOUTON SOURIS ?
            bpl   SCRSAV2
            ldal  $e0c023
            ldal  $e0c023
            bmi   SCRSAV2              ; FIN
SCRSAV4     stal  $e0c00f              ; BIT $C010
            CLI
            LDA   ECRAN
            JMP   PICT00

*********** SOUS ROUTINES ******************

VERIF       NOP
VERX0       LDA   PTX0
            CMP   #$012C               ; 300
            BEQ   CHANX0
            CMP   #$0014               ; 20
            BEQ   CHANX0
VERY0       LDA   PTY0
            CMP   #$00B4               ; 180
            BEQ   CHANY0
            CMP   #$0014               ; 20
            BEQ   CHANY0
            BRA   DIR
CHANX0      LDA   DIRX0
            CMP   #$0000
            BEQ   CHANX01
            STZ   DIRX0
            BRA   VERY0
CHANX01     INC   DIRX0
            BRA   VERY0
CHANY0      LDA   DIRY0
            CMP   #$0000
            BEQ   CHANY01
            STZ   DIRY0
            BRA   DIR
CHANY01     INC   DIRY0
DIR         LDA   DIRX0                ; DIR X0
            CMP   #$0000               ; 0=+
            BEQ   DIR0
            LDA   #$E938               ; SEC SBC
            STA   DIR1
            BRA   DIR4
DIR0        LDA   #$6918               ; CLC ADC
            STA   DIR1
DIR4        LDA   DIRY0                ; DIR Y0
            CMP   #$0000               ; 0=+
            BEQ   DIR01
            LDA   #$E938               ; SEC SBC
            STA   DIR2
            BRA   DIR3
DIR01       LDA   #$6918               ; CLC ADC
            STA   DIR2
DIR3        LDA   PTX0
DIR1        CLC
            ADC   #$0002               ; 2
            STA   PTX0
            LDA   PTY0
DIR2        SEC
            SBC   #$0002               ; 2
            STA   PTY0

VERX1       LDA   PTX1
            CMP   #$013C               ; 160 318
            BEQ   CHANX1
            CMP   #$0000               ; 0
            BEQ   CHANX1
VERY1       LDA   PTY1
            CMP   #$00C6               ; 100 198
            BEQ   CHANY1
            CMP   #$0000
            BEQ   CHANY1
            BRA   DIRUN
CHANX1      LDA   DIRX1
            CMP   #$0000
            BEQ   CHANX11
            STZ   DIRX1
            BRA   VERY1
CHANX11     INC   DIRX1
            BRA   VERY1
CHANY1      LDA   DIRY1
            CMP   #$0000
            BEQ   CHANY11
            STZ   DIRY1
            BRA   DIRUN
CHANY11     INC   DIRY1
DIRUN       LDA   DIRX1                ; DIR X1
            CMP   #$0000               ; 0=+
            BEQ   DIR10
            LDA   #$E938               ; SEC SBC
            STA   DIR11
            BRA   DIR14
DIR10       LDA   #$6918               ; CLC ADC
            STA   DIR11
DIR14       LDA   DIRY1                ; DIR Y1
            CMP   #$0000               ; 0=+
            BEQ   DIR101
            LDA   #$E938               ; SEC SBC
            STA   DIR12
            BRA   DIR13
DIR101      LDA   #$6918               ; CLC ADC
            STA   DIR12
DIR13       LDA   PTX1
DIR11       CLC
            ADC   #$0002               ; 2
            STA   PTX1
            LDA   PTY1
DIR12       SEC
            SBC   #$0002               ; 2
            STA   PTY1
            RTS

TRA         LDX   #$001E               ; 16*2-2
            STX   TRA3
            LDA   #$0000
            STA   TRA1+1
            STA   TRA5+1
TRA0        LDX   TRA3
            LDA   PTX0,X
            STA   LIX0                 ; X0 POINTS
            LDA   PTY0,X
            STA   LIY0                 ; Y0
            LDA   PTX1,X
            STA   LIX1                 ; X1
            LDA   PTY1,X
            STA   LIY1                 ; Y1
TRA1        LDA   #$0000               ; COULEUR 1 : PAIRE
            XBA
            STA   LICOULP              ;
TRA5        LDA   #$0000               ; COULEUR 2 : IMPAIRE
            XBA
            STA   LICOULI              ;
            CPX   #$FFFE               ; VERIF FIN
            BEQ   TRA4
            LDA   TRA1+1
            CLC
            ADC   #$1000               ; COULEUR1
            STA   TRA1+1
            LDA   TRA5+1
            CLC
            ADC   #$0100               ; COULEUR2
            STA   TRA5+1
            DEX
            DEX
            STX   TRA3
            JSR   LIGNE                ; ******* LIGNE *******
            BRA   TRA0
TRA4        RTS

DECAL       LDX   #$001E               ; 30 (16*2-2)
DECAL1      LDA   PTX0-2,X
            STA   PTX0,X
            LDA   PTX1-2,X             ; ON DECALE
            STA   PTX1,X
            LDA   PTY0-2,X
            STA   PTY0,X
            LDA   PTY1-2,X
            STA   PTY1,X
            DEX
            DEX
            CPX   #$0000
            BNE   DECAL1
            RTS

**** DATA ****

KBD         CLC
            XCE                        ; 8 BIT
            SEP   #$30
KBD1        LDAL  $00BFFF
            BPL   KBD1
            STAL  $00C010              ; BIT $C010
            CLC
            XCE                        ; 16 BIT
            REP   #$30
            RTS

TRA3        HEX   0000                 ; SAUVEGARDE DE X DANS TRACE
PTX0        HEX   5600000000000000000000000000000000000000000000000000000000000000
PTX1        HEX   0001000000000000000000000000000000000000000000000000000000000000
PTY0        HEX   5600000000000000000000000000000000000000000000000000000000000000
PTY1        HEX   A000000000000000000000000000000000000000000000000000000000000000
DIRX0       HEX   0000
DIRY0       HEX   0000                 ; DIRECTION
DIRX1       HEX   0000
DIRY1       HEX   0000
SCRSPAL1    HEX   00000100020003000400050006000700080009000A000B000C000D000E000F00

************************************ LIGNE *************************************

LIGNE       STZ   LIOF
            LDA   LIX0
            CMP   LIX1
            BMI   LI2                  ; X0<X1

LI1         LDA   LIX0                 ; DX=X1-X0 < 0
            SEC
            SBC   LIX1
            STA   LIDX
            BRA   LI3

LI2         LDA   LIX1                 ; DX=X1-X0 > 0
            SEC
            SBC   LIX0
            STA   LIDX

LI3         LDA   LIY0
            CMP   LIY1
            BMI   LI4                  ; Y0<Y1

            LDA   LIY0                 ; DY=Y1-Y0 < 0
            SEC
            SBC   LIY1
            STA   LIDY
            BRA   LI5

LI4         LDA   LIY1                 ; DY=Y1-Y0 > 0
            SEC
            SBC   LIY0
            STA   LIDY

LI5         LDA   LIDX
            CMP   LIDY
            BPL   LIDX0                ; DX>DY
            JMP   LIDY0                ; DX<DY

*******  DX > DY  ***********

LIDX0       LDA   LIDY
            STA   LIPL42+1
            STA   LIPL52+1
            STA   LIPL45+1
            STA   LIPL55+1
            STA   LIPL62+1
            STA   LIPL72+1
            STA   LIPL75+1
            STA   LIPL65+1

            LDA   LIDX
            SEC
            SBC   LIDY
            STA   LIPL43+1             ; DX-DY
            STA   LIPL53+1
            STA   LIPL63+1
            STA   LIPL73+1

*** SWAP ***

            LDA   LIY0
            CMP   LIY1
            BPL   LIDX1                ; Y0 > Y1

            LDX   LIX0
            LDA   LIX1                 ; X1 = X0
            STA   LIX0                 ; X0 = X1
            STX   LIX1

            LDX   LIY0
            LDA   LIY1                 ; Y1 = Y0
            STA   LIY0                 ; Y0 = Y1
            STX   LIY1

************

LIDX1       LDA   LIX0
            LSR
            STA   LIDX2+1              ; CALCUL DE A0
            LDA   LIY0
            ASL
            TAX
            LDA   TABLE,X
            CLC
LIDX2       ADC   #$0000
            STA   LIA0

            LDA   LIX1
            LSR
            STA   LIDX3+1              ; CALCUL DE A1
            LDA   LIY1
            ASL
            TAX
            LDA   TABLE,X
            CLC
LIDX3       ADC   #$0000
            STA   LIA1

            LDY   #$0000
            LDA   LIX0
            LSR
            BCC   LIDX4
            INY

LIDX4       LDA   LIX1                 ; X0 PAIR
            CMP   LIX0
            BMI   LIDX5                ; DX<0
            JMP   LIDX9

LIDX5       TYA
            BEQ   LIDX6                ; X0 PAIR
            JMP   LIPL46
LIDX6       JMP   LIPL57

*****

LIDX7       LDA   LIX1
            LSR
            BCC   LIDX77
            LDX   LIA1
            LDAL  $012000,X            ; IMPAIR
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            RTS
LIDX77      LDX   LIA1
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            RTS

LIPL41      LDA   LIA0
            CMP   LIA1
            BEQ   LIDX7                ; FIN

            DEC   LIA0
            INY
            LDA   LIOF                 ; OF
LIPL42      CMP   #$0000               ; DY
            BPL   LIPL44

            CLC
LIPL43      ADC   #$0000               ; DX-DY
            STA   LIOF
            LDA   LIA0
            SEC
            SBC   #$00A0
            STA   LIA0
            TYA
            LSR
            BCC   LIPL47               ; PAIR
            BRA   LIPL46

LIPL44      SEC
LIPL45      SBC   #$0000               ; DY
            STA   LIOF
            TYA
            LSR
            BCC   LIPL47

LIPL46      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            BRA   LIPL51

LIPL47      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            BRA   LIPL41               ; **

LIDX8       LDA   LIX1
            LSR
            BCC   LIDX88
            LDX   LIA1
            LDAL  $012000,X            ; IMPAIR
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            RTS
LIDX88      LDX   LIA1
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            RTS

LIPL51      TXA                        ; A0
            CMP   LIA1
            BEQ   LIDX8                ; FIN

            INY
            LDA   LIOF                 ; OF
LIPL52      CMP   #$0000               ; DY
            BPL   LIPL54

            CLC
LIPL53      ADC   #$0000               ; DX-DY
            STA   LIOF
            LDA   LIA0
            SEC
            SBC   #$00A0
            STA   LIA0
            TYA
            LSR
            BCC   LIPL57               ; PAIR
            BRA   LIPL56

LIPL54      SEC
LIPL55      SBC   #$0000               ; DY
            STA   LIOF
            TYA
            LSR
            BCC   LIPL57

LIPL56      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            JMP   LIPL51

LIPL57      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            JMP   LIPL41               ;

******

LIDX9       TYA
            BEQ   LIDX10               ; X0 PAIR
            JMP   LIPL66
LIDX10      JMP   LIPL77

LIDX11      LDA   LIX1
            LSR
            BCC   LIDX111
            LDX   LIA1
            LDAL  $012000,X            ; IMPAIR
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            RTS
LIDX111     LDX   LIA1
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            RTS

LIPL61      LDA   LIA0
            CMP   LIA1
            BEQ   LIDX11               ; FIN

            INC   LIA0
            INY
            LDA   LIOF                 ; OF
LIPL62      CMP   #$0000               ; DY
            BPL   LIPL64

            CLC
LIPL63      ADC   #$0000               ; DX-DY
            STA   LIOF
            LDA   LIA0
            SEC
            SBC   #$00A0
            STA   LIA0
            TYA
            LSR
            BCC   LIPL67               ; PAIR
            BRA   LIPL66

LIPL64      SEC
LIPL65      SBC   #$0000               ; DY
            STA   LIOF
            TYA
            LSR
            BCC   LIPL67

LIPL66      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            BRA   LIPL61

LIPL67      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            BRA   LIPL71               ; **

LIDX12      LDA   LIX1
            LSR
            BCC   LIDX121
            LDX   LIA1
            LDAL  $012000,X            ; IMPAIR
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            RTS
LIDX121     LDX   LIA1
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            RTS

LIPL71      TXA                        ; A0
            CMP   LIA1
            BEQ   LIDX12               ; FIN

            INY
            LDA   LIOF                 ; OF
LIPL72      CMP   #$0000               ; DY
            BPL   LIPL74

            CLC
LIPL73      ADC   #$0000               ; DX-DY
            STA   LIOF
            LDA   LIA0
            SEC
            SBC   #$00A0
            STA   LIA0
            TYA
            LSR
            BCC   LIPL77               ; PAIR
            BRA   LIPL76

LIPL74      SEC
LIPL75      SBC   #$0000               ; DY
            STA   LIOF
            TYA
            LSR
            BCC   LIPL77               ; PAIR

LIPL76      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            JMP   LIPL61               ;

LIPL77      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            JMP   LIPL71

*****  DX < DY  *********

LIDY0       LDA   LIDX
            STA   LIPL2+1
            STA   LIPL12+1
            STA   LIPL5+1
            STA   LIPL15+1
            STA   LIPL22+1
            STA   LIPL32+1
            STA   LIPL25+1
            STA   LIPL35+1

            LDA   LIDY
            SEC
            SBC   LIDX
            STA   LIPL3+1              ; DY-DX
            STA   LIPL13+1
            STA   LIPL23+1
            STA   LIPL33+1

*** SWAP ***

            LDA   LIY1
            CMP   LIY0
            BPL   LIDY1                ; Y1 > Y0

            LDX   LIX0
            LDA   LIX1                 ; X1 = X0
            STA   LIX0                 ; X0 = X1
            STX   LIX1

            LDX   LIY0
            LDA   LIY1                 ; Y1 = Y0
            STA   LIY0                 ; Y0 = Y1
            STX   LIY1

************

LIDY1       LDA   LIX0
            LSR
            STA   LIDY2+1              ; CALCUL DE A0
            LDA   LIY0
            ASL
            TAX
            LDA   TABLE,X
            CLC
LIDY2       ADC   #$0000
            STA   LIA0

            LDA   LIX1
            LSR
            STA   LIDY3+1              ; CALCUL DE A1
            LDA   LIY1
            ASL
            TAX
            LDA   TABLE,X
            CLC
LIDY3       ADC   #$0000
            STA   LIA1

            LDY   #$0000
            LDA   LIX0
            LSR
            BCC   LIDY4
            INY

LIDY4       LDA   LIX1                 ; X0 PAIR
            CMP   LIX0
            BMI   LIDY5                ; DX<0
            JMP   LIDY9

LIDY5       TYA
            BEQ   LIDY6                ; X0 PAIR
            JMP   LIPL6
LIDY6       JMP   LIPL17

*****

LIDY7       RTS

LIPL1       LDA   LIA0
            CMP   LIA1
            BEQ   LIDY7                ; FIN

            CLC
            ADC   #$00A0
            STA   LIA0
            LDA   LIOF                 ; OF
LIPL2       CMP   #$0000               ; DX
            BPL   LIPL4

            CLC
LIPL3       ADC   #$0000               ; DY-DX
            STA   LIOF
            INY                        ; ON INVERSE
            DEC   LIA0
            TYA
            LSR
            BCC   LIPL7                ; PAIR
            BRA   LIPL6

LIPL4       SEC
LIPL5       SBC   #$0000               ; DX
            STA   LIOF
            TYA
            LSR
            BCC   LIPL7

LIPL6       LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            BRA   LIPL11

LIPL7       LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            BRA   LIPL1

LIDY8       RTS

LIPL11      TXA                        ; A0
            CMP   LIA1
            BEQ   LIDY8                ; FIN

            CLC
            ADC   #$00A0
            STA   LIA0
            LDA   LIOF                 ; OF
LIPL12      CMP   #$0000               ; DX
            BPL   LIPL14

            CLC
LIPL13      ADC   #$0000               ; DY-DX
            STA   LIOF
            INY                        ; ON INVERSE
            TYA
            LSR
            BCC   LIPL17               ; PAIR
            BRA   LIPL16

LIPL14      SEC
LIPL15      SBC   #$0000               ; DX
            STA   LIOF
            TYA
            LSR
            BCC   LIPL17

LIPL16      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            JMP   LIPL11

LIPL17      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            JMP   LIPL1

******

LIDY9       TYA
            BEQ   LIDY10               ; X0 PAIR
            JMP   LIPL26
LIDY10      JMP   LIPL37

LIDY11      RTS

LIPL21      LDA   LIA0
            CMP   LIA1
            BEQ   LIDY11               ; FIN

            CLC
            ADC   #$00A0
            STA   LIA0
            LDA   LIOF                 ; OF
LIPL22      CMP   #$0000               ; DX
            BPL   LIPL24

            CLC
LIPL23      ADC   #$0000               ; DY-DX
            STA   LIOF
            INY                        ; ON INVERSE
            INC   LIA0
            TYA
            LSR
            BCC   LIPL27               ; PAIR
            BRA   LIPL26

LIPL24      SEC
LIPL25      SBC   #$0000               ; DX
            STA   LIOF
            TYA
            LSR
            BCC   LIPL27

LIPL26      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            BRA   LIPL21

LIPL27      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            BRA   LIPL31

LIDY12      RTS

LIPL31      TXA                        ; A0
            CMP   LIA1
            BEQ   LIDY12               ; FIN

            CLC
            ADC   #$00A0
            STA   LIA0
            LDA   LIOF
LIPL32      CMP   #$0000               ; DX
            BPL   LIPL34

            CLC
LIPL33      ADC   #$0000               ; DY-DX
            STA   LIOF
            INY                        ; ON INVERSE
            TYA
            LSR
            BCC   LIPL37               ; PAIR
            BRA   LIPL36

LIPL34      SEC
LIPL35      SBC   #$0000               ; DX
            STA   LIOF
            TYA
            LSR
            BCC   LIPL37

LIPL36      LDX   LIA0                 ; IMPAIR
            LDAL  $012000,X
            AND   #$FFF0
            ORA   LICOULI
            STAL  $012000,X
            JMP   LIPL21

LIPL37      LDX   LIA0                 ; PAIR
            LDAL  $012000,X
            AND   #$FF0F
            ORA   LICOULP
            STAL  $012000,X
            JMP   LIPL31

****************  VARIABLES  *********************

LIX0        HEX   0000
LIY0        HEX   0000
LIX1        HEX   0000
LIY1        HEX   0000
LIDX        HEX   0000                 ; ABS DX
LIDY        HEX   0000                 ; ABS DY
LIOF        HEX   0000                 ; VARIABLE
LIA1        HEX   0000
LIA0        HEX   0000

LICOULP     HEX   F000                 ; COULEUR PAIRE
LICOULI     HEX   0F00                 ; COULEUR IMPAIRE

***********************************************
***************  AFFICHE IMAGE 3200 COULEURS  ****************************
*
* Hello, Les problemes venaient du shadowing a des/activer
* et du placement des palettes en $1000, zone qui ne nous appartient pas
* il faut se placer a partir de $2000, sinon BOOM!!
* Regarde avec WHERE IN MEMORY, il y a souvent des trucs en $01/1000
*
* J'ai reecrit la routine de SCBs, on gagne de la place
* On sort des que l'on appuie sur la souris
* J'ai raccourci les tests d'appui sur le bouton, on gagne en vitesse

AFFICH      sei

            ldal  $e0c035
            sta   tempC035
            and   #%11111111_11110111
            ora   #%00000000_00001000
            stal  $e0c035

            LDX   #$3FFE
            LDA   #$0000
AFFICH1     STAL  $012000,X            ; ON NETTOIE VITE
            STAL  $016000,X
            STAL  $E12000,X
            STAL  $E16000,X
            DEX
            DEX
            BPL   AFFICH1

            LDX   #$18FE
AFFICH2     LDAL  $22C350,X
            STAL  $012000,X            ; COPIE DES PALETTES (EN 19/8000)
            DEX
            DEX
            BPL   AFFICH2

            LDX   #$0000               ; ON RETOURNE LES VALEURS
AFFICH8     LDY   #$000F               ; 16 COULEURS A EMPILER
            STX   AFFICH10+1
AFFICH9     LDAL  $012000,X
            PHA
            INX
            INX
            DEY
            BPL   AFFICH9
AFFICH10    LDX   #$0000               ; 16 COULEURS A DEPILER
            LDY   #$000F
AFFICH11    PLA
            STAL  $012000,X
            INX
            INX
            DEY
            BPL   AFFICH11
            CPX   #$1900
            BNE   AFFICH8

            sep   #$20                 ; Put SCBS
            ldx   #0
do3201      lda   #$0f
]lp         stal  $019d00,x
            stal  $e19d00,x
            inx
            cpx   #$c8
            beq   do3202
            dec
            bpl   ]lp
            bra   do3201

do3202      rep   #$20

            ldal  $e0c035              ; Put shadowing
            and   #%11111111_11110111
            stal  $e0c035

            LDA   AFFICHIND
            BEQ   AFFICH15             ; LES POINTS

            LDX   #$7CFE               ; AFFICHAGES DES PALETTES
AFFICH13    LDY   #$009E
AFFICH14    LDA   POINTSTAB,Y
            STAL  $E12000,X
            DEX
            DEX
            DEY                        ; 1 LIGNE
            DEY
            BPL   AFFICH14
            CPX   #$FFFE
            BNE   AFFICH13
            BRA   AFFICH16             ; AFFICHAGE

AFFICH15    LDX   #$7CFE
AFFICH4     LDAL  $228000,X            ; COPIE DES POINTS (EN 19/0000)
            STAL  $E12000,X
            DEX
            DEX
            BPL   AFFICH4

*--- Main Routine 3200

AFFICH16    tdc                        ; save parameters
            sta   myDP
            tsc
            sta   mySTACK

            ldal  $e0c068
            ora   #$30
            stal  $e0c068


aff0        ldy   #0
            lda   #$1f00
            tcd

aff1        ldal  $e0c02e
            and   #$ff
            cmp   affTBL,y
            bne   aff1

aff2        iny
            iny

            lda   #$9fff
            tcs
            tdc
            clc
            adc   #$0100
            tcd

]affPOS1    =     $00
            lup   $80
            pei   ]affPOS1
]affPOS1    =     ]affPOS1+2
            --^

            tdc
            clc
            adc   #$0100
            tcd

]affPOS1    =     $00
            lup   $80
            pei   ]affPOS1
]affPOS1    =     ]affPOS1+2
            --^

            cpy   #$1a
            beq   aff3
            brl   aff1

aff3        ldal  $e0c026              ; BOUTON SOURIS ?
            bmi   aff4
            brl   aff0
aff4        ldal  $e0c023
            ldal  $e0c023
            bpl   aff5
            brl   aff0

*--- End of routine

aff5        stal  $e0c00f

            ldx   #768-2
            lda   #0
]lp         stal  $019d00,x
            dex
            dex
            bpl   ]lp

            ldal  $e0c068
            and   #$ffcf
            stal  $e0c068

            lda   mySTACK
            tcs
            lda   myDP
            tcd

            lda   tempC035
            stal  $e0c035

            cli

            rts

affTBL      dw    $e4,$84,$8c,$94,$9c,$a4,$ac
            dw    $b4,$bc,$c4,$cc,$d4,$dc

myDP        ds    2
mySTACK     ds    2
tempC035    ds    2
ptr3200     adrl  $0022c350

AFFICHIND   ds    2                    ; 0000:LES POINTS, 0001:LES PALETTES
POINTSTAB   HEX   00000000000000000000111111111111111111112222222222222222222233333333333333333333
            HEX   44444444444444444444555555555555555555556666666666666666666677777777777777777777
            HEX   8888888888888888888899999999999999999999AAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBB
            HEX   CCCCCCCCCCCCCCCCCCCCDDDDDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEEEEEEEFFFFFFFFFFFFFFFFFFFF

***********************************************

