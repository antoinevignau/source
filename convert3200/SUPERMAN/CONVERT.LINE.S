
                LST   OFF             ; CONVERT LINE

ECR0900         LDX   SECR2+1         BORD4
                LDA   #ECR09001
                STA   BUMPER5+1
                JMP   BUMPER
ECR09001        JSR   LINEGA          ; DECALAGE A GAUCHE D'UN CRAN
                JMP   SOURIS1

ECR0901         LDX   SECR2+1         ; LINE : ->
                LDA   #ECR09011
                STA   BUMPER5+1
                JMP   BUMPER
ECR09011        JSR   LINEDR          ; DECALAGE A DROITE D'UN CRAN
                JMP   SOURIS1

ECR0902         LDX   SECR2+1         ; LINE : POINT
                LDA   #ECR09021
                STA   BUMPER5+1
                JMP   BUMPER
ECR09021        LDA   LINENBC
                DEC
                BEQ   ECR09022        ; 1 COULEUR, ON SORT CAR RIEN A REMPLACER
                JSR   LINESUB         ; SUBSTITUTION DE LA COULEUR SUR LA LIGNE
                LDA   NUMLINE
                DEC
                TAX
                DEC   NBCLTAB,X       ; MISE A JOUR DU SPECTRE
                JSR   LINERMP         ; REMPLISSAGE DES TABLEAUX
                JSR   ECR09023        ; NB D'ECRAN AUTORISE
                STA   LINESLI
                CMP   LINESCR         ; ECRAN ACTUEL
                BPL   ECR090220
                DEC   LINESCR
ECR090220       JSR   ECR09051        ; AFF CHIFFRE SCR
                JSR   ECR09123        ; AFFICHAGE COUL + FREQ
                JSR   ECR09073        ; AFFICHAGE NB COUL
                LDA   LINESCR
                DEC
                ASL
                TAX
                LDA   PALETAB,X       ; 0,E0,1C0
                TAX
                LDA   LINEREFETAB,X
                STA   SELECIND        ; INDICE 0
                JSR   LINEBAS         ; AFFICHAGE BAS
                INC   LINEFL          ; ON DOIT TOUT RECALCULER EN SORTIE
ECR09022        JMP   SOURIS1

*********

ECR0905         LDX   SECR2+1         ; LINE : SCR UP
                LDA   #ECR09050
                STA   BUMPER5+1
                JMP   BUMPER
ECR09050        JSR   ECR09053
                JMP   SOURIS1
ECR09053        LDA   LINESCR         ; TRAITEMENT
                CMP   LINESLI
                BEQ   ECR09052
                INC
                STA   LINESCR
                JSR   ECR09051        ; AFFICHAGE CHIFFRE SCR
                JSR   ECR09123        ; AFFICHAGE COUL+FREQ
                LDX   #$00E0
                LDA   LINEREFETAB,X
                STA   SELECIND
                JSR   LINEBAS         ; AFFICHAGE BAS
ECR09052        RTS

ECR0906         LDX   SECR2+1         ; LINE : SCR DOWN
                LDA   #ECR09060
                STA   BUMPER5+1
                JMP   BUMPER
ECR09060        JSR   ECR09061
                JMP   SOURIS1
ECR09061        LDA   LINESCR         ; TRAITEMENT
                CMP   #$0001
                BEQ   ECR09062
                DEC
                STA   LINESCR
                JSR   ECR09051        ; AFFICHAGE CHIFFRE SCR
                JSR   ECR09123        ; AFFICHAGE COUL+FREQ
                LDA   LINEREFETAB
                STA   SELECIND
                JSR   LINEBAS         ; AFFICHAGE BAS
ECR09062        RTS

ECR09023        LDX   #$0001          ; CALCUL LE NB MAX D'ECRAN AUTORISE
                LDA   LINENBC
ECR090230       CMP   #$0071          ; 112 + 1
                BMI   ECR090231       ; FINI
                SEC
                SBC   #$0070
                INX
                BRA   ECR090230
ECR090231       TXA
                RTS

LINESCR         HEX   0100            ; NUMERO DE L'ECRAN DE LINE
LINESLI         HEX   0200            ; NOMBRE MAX D'ECRAN DE LINE

**********

ECR0907         LDX   SECR2+1         ; LINE : +
                LDA   #ECR09070
                STA   BOMPER5+1
                JMP   BOMPER
ECR09070        LDA   NUMLINE         ; TRAITEMENT
                CMP   #$00C8          ; 200
                BNE   ECR09071
                LDA   #$0000          ; ON PASSE DE 200 A 1
ECR09071        INC
                STA   NUMLINE
                JSR   LINERMP         ; REMPLISSAGE DES TABLEAUX
                JSR   ECR09123        ; AFFICHAGE COUL + FREQ
                JSR   ECR09073        ; AFFICHAGE NB COUL
                JSR   ECR09023        ; NB D'ECRAN AUTORISE
                STA   LINESLI
                LDA   #$0001          ; ECRAN ACTUEL
                STA   LINESCR
                JSR   ECR09051        ; AFF CHIFFRE SCR
                LDA   LINEREFETAB
                STA   SELECIND        ; INDICE 0
                JSR   LINEBAS         ; AFFICHAGE BAS
                JSR   ECR09072        ; AFF NUM LIGNE
                JMP   SOURIS

ECR0908         LDX   SECR2+1         ; LINE : -
                LDA   #ECR09080
                STA   BOMPER5+1
                JMP   BOMPER
ECR09080        LDA   NUMLINE         ; TRAITEMENT
                CMP   #$0001
                BNE   ECR09081
                LDA   #$00C9          ; 201 : ON PASSE DE 1 A 200
ECR09081        DEC
                STA   NUMLINE
ECR0908A        NOP
                JSR   LINERMP         ; REMPLISSAGE DES TABLEAUX
                JSR   ECR09123        ; AFFICHAGE COUL + FREQ
                JSR   ECR09073        ; AFFICHAGE NB COUL
                JSR   ECR09023        ; NB D'ECRAN AUTORISE
                STA   LINESLI
                LDA   #$0001          ; ECRAN ACTUEL
                STA   LINESCR
                JSR   ECR09051        ; AFF CHIFFRE SCR
                LDA   LINEREFETAB
                STA   SELECIND        ; INDICE 0
                JSR   LINEBAS         ; AFFICHAGE BAS
                JSR   ECR09072        ; AFF NUM LIGNE
                JMP   SOURIS

ECR090B         LDA   #ECR090B0       ; NIMERO LIGNE : SURFACE
                STA   SURFACE5+1
                JMP   SURFACE
ECR090B0        JSR   DESS1
                JSR   LINESAISIEINIT  ; COULEUR TRAIT
                LDA   #$8A0B
                LDX   #$0001
                LDY   #$00C8
                JSR   SAISIEVAL
                BNE   ECR090B1
                JSR   ECR09072        ; AFFICHAGE NOMBRE (INCHANGE)
                LDA   #$2222
                STA   SAISIECOLOR
                JSR   ECR04103
                JSR   SAUV
                JMP   SOURIS1
ECR090B1        STA   NUMLINE
                JSR   ECR09072        ; AFFICHAGE NOMBRE
                JSR   LINERMP         ; REMPLISSAGE DES TABLEAUX
                JSR   ECR09123        ; AFFICHAGE COUL + FREQ
                JSR   ECR09073        ; AFFICHAGE NB COUL
                JSR   ECR09023        ; NB D'ECRAN AUTORISE
                STA   LINESLI
                LDA   #$0001          ; ECRAN ACTUEL
                STA   LINESCR
                JSR   ECR09051        ; AFF CHIFFRE SCR
                LDA   LINEREFETAB
                STA   SELECIND        ; INDICE 0
                JSR   LINEBAS         ; AFFICHAGE BAS
                LDA   #$2222
                STA   SAISIECOLOR
                JSR   ECR04103
                JSR   SAUV
                JMP   SOURIS1

LINESAISIEINIT  LDA   #$8888
                STA   SAISIECOLOR
                LDA   #$0E00          ; ROUGE
                STAL  $019E30         ; PALETTE 1
                RTS

NUMLINE         HEX   0100            ; NUMERO DE LIGNE (1-200)

********

ECR0909         LDX   SECR2+1         ; LINE : EXIT
                LDA   #ECR09090
                STA   BUMPER5+1
                JMP   BUMPER
ECR09090        JSR   ECR09090ESC     ; ON FAIT QQCHOSE ??
                LDA   #$0005
                JMP   PICT

ECR09090ESC     LDAL  $00C034         ; IMAGE CONVERT
                AND   #$FFF0          ; NOIR
                STAL  $00C034
                LDA   LINEFL
                BEQ   ECR09091
                JSR   PLEASE          ; MESSAGE A L'ECRAN
                LDA   #$0002          ; INIT
                LDY   #STATCOL2
ECR090900       JSL   $040100
                PHK
                PLB
                LDA   #$0004          ; COULEURS UTILES
ECR090901       JSL   $040100
                PHK
                PLB
                LDA   #$0006          ; TRI PALETTE
                LDY   #STATCOL2
ECR090902       JSL   $040100
                PHK
                PLB
                STA   COLOR2NB        ; NB COULEUR ZONE
                LDA   #$0008          ; REMAP PICTURE
ECR090903       JSL   $040100
                PHK
                PLB
                LDA   #$000C          ; CALCUL FREQUENCE
                LDY   #STATCOFR
ECR090904       JSL   $040100
                PHK
                PLB
                JSR   PRECALCUL       ; PRECALCUL DE LA TABLE DE DIFF
                JSR   PLEASEF         ; ON ENLEVE LE MESSAGE
                STZ   LINEFL
ECR09091        RTS

LINEFL          HEX   0000

*******

ECR090A         LDA   #ECR090A1       ; LINE : SURFACE SELECTION TEINTE
                STA   SURFACE5+1
                JMP   SURFACE
ECR090A1        LDA   LINESCR
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                LSR
                STA   ECR090A3+1
                LDA   POSX            ;      6 -> 314
                SEC
                SBC   #$0006          ; -6 : 0 -> 308
                LSR                   ; /2 : 0 -> 154
                ASL
                TAX
                LDA   FREQHORI,X      ;      0 -> 13
                STA   ECR090A2+1
                LDA   POSY            ;      1 -> 161
                DEC                   ; -1 : 0 -> 160
                LSR
                LSR                   ; /4 : 0 -> 40
                ASL
                TAX
                LDA   FREQVERT,X      ;      0 -> 7
                ASL
                TAX
                LDA   FREQMULT,X      ; *14 : 0 -> 98
                CLC
ECR090A2        ADC   #$FFFF          ; 0 -> 111
                CLC
ECR090A3        ADC   #$A0A0          ; INDICE ABSOLU ECRAN
                ASL
                TAX
                LDA   LINEREFETAB,X   ; INDICE IMAGE
                CMP   SELECIND
                BEQ   ECR090A4
                CMP   #$FFFF
                BEQ   ECR090A4        ; INDICE INVALIDE
                STA   SELECIND
                JSR   LINEBAS         ; AFFICHAGE BAS
ECR090A4        JMP   SOURIS

************  AFFICHAGE  *************

ECR09051        LDA   #$967B          ; AFFICHAGE NUMERO SCREEN
                STA   AFTCA+1
                LDA   LINESCR
                JSR   CHIF
                RTS

ECR09072        LDA   NUMLINE         ; AFFICHAGE NUMERO DE LIGNE
                STA   VALH
                LDA   #$8A0B
                STA   ADRE
                JSR   TRANS
                RTS

ECR09073        LDA   LINENBC         ; AFFICHAGE NB DE COULEUR
                STA   VALH
                LDA   #$8A30
                STA   ADRE
                JSR   TRANS

                LDA   NUMLINE         ; DEJA TRAITEE ?
                DEC
                ASL
                TAX
                LDA   CONVTAB1,X
                BNE   ECR09078
                LDA   COPELI
                CMP   LINENBC
                BPL   ECR09074
                LDAL  $00C034
                AND   #$FFF0
                ORA   #$0001          ; ROUGE : PLUS DE xx COUL/LIGNE
                STAL  $00C034
                RTS
ECR09074        LDAL  $00C034
                AND   #$FFF0          ; NOIR : MOINS DE xx COUL/LIGNE
                STAL  $00C034
                RTS
ECR09078        LDAL  $00C034         ; VERT : DEJA CONVERTIT
                AND   #$FFF0
                ORA   #$0004
                STAL  $00C034
                RTS

LINEBAS         LDA   SELECIND        ; AFFICHAGE BAS : COULEUR SELECTIONNEE
                ASL
                TAX
                LDA   STATCOL2,X      ; COULEUR BAS
                STAL  $019E22
                LDA   LINECOFRTAB,X   ; FREQ
                STA   VALH
                LDA   #$8E01
                STA   ADRE
                JSR   TRANSB          ; AFFICHAGE FREQUENCE
                JSR   LINEBRP         ; REMPLISSAGE POUR LES TEINTES VOISINES
                LDX   #$0002          ; AFFICHAGE BAS : COULEUR PROCHES
LINEBAS1        LDA   SELECIND,X
                BMI   LINEBAS2
                ASL
                TAY
                LDA   STATCOL2,Y      ; COULEUR BAS
                STAL  $019E22,X
                INX
                INX
                CPX   #$000E
                BNE   LINEBAS1
                RTS
LINEBAS2        LDA   #$0000          ; INDICE INCOHERENT : COULEUR NOIRE
                STAL  $019E22,X
                INX
                INX
                CPX   #$000E
                BNE   LINEBAS1
                RTS

******************  REMPLISSAGE DE L'ECRAN  ***************

ECR09123        LDA   LINESCR         ; REMPLISSAGE COUL+FREQ
                DEC
                ASL
                TAX
                LDA   PALETAB,X       ; 0000,00E0,01C0 : 0,224,448
                TAX
                CLC
                ADC   #$00E0          ; 112*2
                STA   ECR09125+1
                LDY   #$0000
ECR09124        LDA   LINEREFETAB,X
                JSR   ECR09126        ; AFFICHE
                INY
                INY
                INX
                INX
ECR09125        CPX   #$A0A0
                BNE   ECR09124
                RTS

ECR09126        PHX                   ; AFFICHE COUL ET FREQ A L'ECRAN
                PHY
                CMP   #$FFFF
                BEQ   ECR09128        ; ZERO
                ASL
                TAX
                LDA   PALETADR,Y      ; COULEUR
                STA   ECR09127+1
                LDA   STATCOL2,X
ECR09127        STAL  $019F22
                LDA   FREQADRE,Y      ; FREQUENCE
                STA   ADRE
                LDA   LINECOFRTAB,X
                STA   VALH
                JSR   TRANSB
                PLY
                PLX
                RTS
ECR09128        LDA   PALETADR,Y      ; COULEUR NOIRE
                TAX
                LDA   #$0000
                STAL  $010000,X
                LDA   FREQADRE,Y
                STA   ADRE
                LDA   #$0000
                STA   VALH
                JSR   TRANSB
                PLY
                PLX
                RTS

*********  DECALAGE AVEC LES <- -> EN BAS  ****************

LINEGA          LDA   LINENBC         ; DECALAGE A GAUCHE D'UN CRAN
                CMP   #$0003          ; DEPLACE LES INDICES ET LE COULEURS A L'ECRAN
                BPL   LINEGA1
                RTS                   ; 1 OU 2 COULEUR SUR LA LIGNE
LINEGA1         LDY   #$000C
                CMP   #$0007
                BPL   LINEGA2
                DEC
                ASL
                TAY
LINEGA2         LDAL  $019E24         ; COULEUR RVB
                PHA
                LDA   SELECIND+2      ; INDICE
                PHA
                LDX   #$0000
LINEGA3         LDA   SELECIND+4,X    ; DECAL INDICE + RVB
                STA   SELECIND+2,X
                LDAL  $019E26,X
                STAL  $019E24,X
                INX
                INX
                CPX   #$000A
                BNE   LINEGA3
                TYX
                PLA
                STA   SELECIND,X
                PLA
                STAL  $019E22,X
                RTS

LINEDR          LDA   LINENBC         ; DECALAGE A DROITE D'UN CRAN
                CMP   #$0003
                BPL   LINEDR1
                RTS                   ; 1 OU 2 COULEUR SUR LA LIGNE
LINEDR1         LDX   #$000C
                STX   LINEDR4+1
                LDX   #$000C
                CMP   #$0007
                BPL   LINEDR2
                DEC                   ; MOINS DE 7 COULEURS
                ASL
                TAX
                STA   LINEDR4+1
LINEDR2         LDA   SELECIND,X      ; SAUVEGARDE
                PHA
                LDAL  $019E22,X       ; VALEUR RVB
                PHA
LINEDR4         LDX   #$000C
LINEDR3         LDA   SELECIND-2,X
                STA   SELECIND,X      ; INDICE
                LDAL  $019E20,X
                STAL  $019E22,X
                DEX
                DEX
                CPX   #$0002
                BNE   LINEDR3
                PLA
                STAL  $019E24
                PLA
                STA   SELECIND+2
                RTS

********************  REMPLISSAGE DES TABLEAUX : ZONE MODE 256

ZONERMP         LDX   #$01FE          ; REMPLISSAGE TABLEAU 1 ZONE
ZONERMP01       LDA   #$0000          ; NETTOYAGE PRELIMINAIRE
                STA   LINECOFRTAB,X   ; 0000
                DEC
                STA   LINEREFETAB,X   ; FFFF
                DEX
                DEX
                BPL   ZONERMP01

                LDY   #$0000          ; LIGNE APPARTENANT @ LA ZONE ?
ZONERMP06       LDA   PICTURESCB,Y
                AND   #$000F
                CMP   ZONENUMBER      ; NUMERO DE LA ZONE TRAITEE
                BNE   ZONERMP07
                PHY
                JSR   ZONERMPCOUL     ; TABLE COUL/FREQ
                PLY
ZONERMP07       INY
                CPY   #$00C8          ; 200
                BNE   ZONERMP06

                STZ   ZONENBC         ; NB DE COULEUR DE LA ZONE
                JSR   ZONEREFTABLE    ; REMPLIT LA TABLE DE REFERENCE
                RTS

ZONERMPCOUL     TYA                   ; REMPLIT LA TABLE COULEUR/FREQ
                ASL
                TAX
                LDA   TABLE,X         ; *160
                ASL
                STA   ZONERMP03+1
                LDY   #$013F
ZONERMP02       TYX
ZONERMP03       LDAL  $20A0A0,X
                AND   #$00FF
                ASL
                TAX
                INC   LINECOFRTAB,X
                DEY
                BPL   ZONERMP02
                RTS

ZONEREFTABLE    LDX   #$0000          ; REMPLIT LA TABLE DE REFERENCE + NB COUL
                LDY   #$0000
ZONERMP04       LDA   LINECOFRTAB,X
                BEQ   ZONERMP05
                TXA
                LSR
                STA   LINEREFETAB,Y
                INC   ZONENBC         ; 1 COULEUR DE +
                INY
                INY
ZONERMP05       INX
                INX
                CPX   #$0200
                BNE   ZONERMP04
                RTS

ZONENBC         HEX   0000            ; NB DE COULEUR DE LA ZONE

******* REMPLISSAGE DES TABLEAUX : LINE

LINERMP         LDA   NUMLINE         ; REMPLISSAGE DES POINTS,COULEURS ET FREQUENCES
                DEC
                TAX
                LDA   NBCLTAB,X
                AND   #$00FF
                BNE   LINERMP00
                LDA   #$0100          ; 0=256
LINERMP00       STA   LINENBC         ; NB DE COULEUR DE LA LIGNE

                LDX   #$01FE
LINERMP01       LDA   #$0000          ; NETTOYAGE PRELIMINAIRE
                STA   LINECOFRTAB,X   ; 0000
                DEC
                STA   LINEREFETAB,X   ; FFFF
                DEX
                DEX
                BPL   LINERMP01

                LDA   NUMLINE         ; REMPLIT LA TABLE COULEUR/FREQ
                DEC
                ASL
                TAX
                LDA   TABLE,X         ; *160
                ASL
                STA   LINERMP03+1
                LDY   #$013F
LINERMP02       TYX
LINERMP03       LDAL  $20A0A0,X
                AND   #$00FF
                ASL
                TAX
                INC   LINECOFRTAB,X
                DEY
                BPL   LINERMP02

                LDX   #$0000          ; REMPLIT LA TABLE DE REFERENCE
                LDY   #$0000
LINERMP04       LDA   LINECOFRTAB,X
                BEQ   LINERMP05
                TXA
                LSR
                STA   LINEREFETAB,Y
                INY
                INY
LINERMP05       INX
                INX
                CPX   #$0200
                BNE   LINERMP04
                RTS

LINECOFRTAB     DS    256*2
LINEREFETAB     DS    256*2

********

LINENBC         HEX   0000            ; NB DE COULEUR DE LA LIGNE

SELECIND        HEX   0000            ; INDICE DE LA COULEUR SELECTIONNEE EN BAS A GAUCHE
                HEX   0000,0000,0000,0000,0000,0000  ; CORRESPONDANT A L'IMAGE DIRECTEMENT

FREQADRE        HEX   2428,2F28,3A28,4528,5028,5B28,6628,7128,7C28,8728,9228,9D28,A828,B328
                HEX   A434,AF34,BA34,C534,D034,DB34,E634,F134,FC34,0735,1235,1D35,2835,3335
                HEX   2441,2F41,3A41,4541,5041,5B41,6641,7141,7C41,8741,9241,9D41,A841,B341
                HEX   A44D,AF4D,BA4D,C54D,D04D,DB4D,E64D,F14D,FC4D,074E,124E,1D4E,284E,334E
                HEX   245A,2F5A,3A5A,455A,505A,5B5A,665A,715A,7C5A,875A,925A,9D5A,A85A,B35A
                HEX   A466,AF66,BA66,C566,D066,DB66,E666,F166,FC66,0767,1267,1D67,2867,3367
                HEX   2473,2F73,3A73,4573,5073,5B73,6673,7173,7C73,8773,9273,9D73,A873,B373
                HEX   A47F,AF7F,BA7F,C57F,D07F,DB7F,E67F,F17F,FC7F,0780,1280,1D80,2880,3380

FREQHORI        HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0100,0100,0100,0100,0100,0100,0100,0100,0100,0100,0100
                HEX   0200,0200,0200,0200,0200,0200,0200,0200,0200,0200,0200,0300,0300,0300,0300,0300,0300,0300,0300,0300,0300,0300
                HEX   0400,0400,0400,0400,0400,0400,0400,0400,0400,0400,0400,0500,0500,0500,0500,0500,0500,0500,0500,0500,0500,0500
                HEX   0600,0600,0600,0600,0600,0600,0600,0600,0600,0600,0600,0700,0700,0700,0700,0700,0700,0700,0700,0700,0700,0700
                HEX   0800,0800,0800,0800,0800,0800,0800,0800,0800,0800,0800,0900,0900,0900,0900,0900,0900,0900,0900,0900,0900,0900
                HEX   0A00,0A00,0A00,0A00,0A00,0A00,0A00,0A00,0A00,0A00,0A00,0B00,0B00,0B00,0B00,0B00,0B00,0B00,0B00,0B00,0B00,0B00
                HEX   0C00,0C00,0C00,0C00,0C00,0C00,0C00,0C00,0C00,0C00,0C00,0D00,0D00,0D00,0D00,0D00,0D00,0D00,0D00,0D00,0D00,0D00

FREQVERT        HEX   0000,0000,0000,0000,0000,0100,0100,0100,0100,0100,0200,0200,0200,0200,0200
                HEX   0300,0300,0300,0300,0300,0400,0400,0400,0400,0400,0500,0500,0500,0500,0500
                HEX   0600,0600,0600,0600,0600,0700,0700,0700,0700,0700

FREQMULT        HEX   0000,0E00,1C00,2A00,3800,4600,5400,6200

*******************  PRECALCULE LE TABLEAU DES DIFF  **************************

PRECALCUL       LDA   COLOR2NB        ; INIT VALEURS
                DEC
                BNE   PRECALCUL00
                RTS                   ; 1 COULEUR, ON SORT...
PRECALCUL00     TAX
                STZ   PRECALCUL0+1
                LDA   #$0000          ; 0 DANS LA DIAGONALE
PRECALCUL0      STAL  $22A0A0
                LDA   PRECALCUL0+1
                CLC
                ADC   #$0101
                STA   PRECALCUL0+1
                LDA   #$0000
                DEX
                BPL   PRECALCUL0

                STZ   PRECALCUL1+1
                LDA   COLOR2NB
                ASL
                STA   PRECALCUL4+1
                DEC
                DEC
                STA   PRECALCUL5+1
PRECALCUL1      LDY   #$0000
PRECALCUL2      TYX
                INX
                INX
PRECALCUL3      JSR   COMPUTEDIFF     ; CALCUL DIFF
                JSR   PUTDIFF         ; PLACE LA DIFF
                INX
                INX
PRECALCUL4      CPX   #$A0A0          ; X MAX
                BNE   PRECALCUL3
                INY
                INY
PRECALCUL5      CPY   #$A0A0          ; Y MAX
                BNE   PRECALCUL2
                RTS

COMPUTEDIFF     PHX                   ; DIFF ENTRE X ET Y
                LDA   STATCOL2,Y
                TAX
                AND   #$0F00          ; ROUGE
                STA   LINEBR5+1
                TXA
                AND   #$00F0          ; VERT
                STA   LINEBR8+1
                TXA
                AND   #$000F          ; BLEU
                STA   LINEBR11+1
                PLX
                PHX
                PHY
                JMP   LINEBR0         ; CALCUL DIFF

PUTDIFF         TXA                   ; PLACE LA DIFF DANS LA TABLE
                LSR
                STA   PUTDIFF1+1
                TYA
                LSR
                XBA
PUTDIFF1        ORA   #$A0A0          ; ADRESSE
                STA   PUTDIFF2+1
                XBA
                STA   PUTDIFF3+1
                STA   PUTDIFF4+1
                LDA   LINEDIFF
PUTDIFF2        STAL  $20A0A0
PUTDIFF3        LDAL  $20A0A0         ; ON PLACE LA VALEUR SYMETRIQUE
                AND   #$FF00
                ORA   LINEDIFF
PUTDIFF4        STAL  $20A0A0
                RTS

***************  LES 6 COUL LES + PROCHES  *****************

LINEBRP         LDX   #$000A
                LDA   #$1FFF          ; INIT : REMPLISSAGE DES DIFF RVB A #$1FFF
LINEBRP2        STA   LINEBTB2,X
                DEX
                DEX
                BPL   LINEBRP2

                LDA   SELECIND        ; IL FAUT TROUVER LES 6 TEINTES RVB LES + PROCHES
* XBA
* STA LINEBRNEW2+1
                ASL
                TAX
                LDA   STATCOL2,X
                TAX
                AND   #$0F00          ; ROUGE
                STA   LINEBR5+1
                TXA
                AND   #$00F0          ; VERT
                STA   LINEBR8+1
                TXA
                AND   #$000F          ; BLEU
                STA   LINEBR11+1

                LDA   LINENBC
                DEC
                ASL
                TAX                   ; NB DE COULEURS SUR LA LIGNE *2-2
LINEBRP3        JSR   LINEBR          ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   LINEBRP6        ; DIFF ZERO, ON IGNORE : C'EST LA COULEUR CHOISIT

LINEBRP10       LDY   #$0000          ; X : INDICE SUR LINERVB, Y : INDICE SUR LINEBT2
LINEBRP4        CMP   LINEBTB2,Y      ; DIFF RVB
                BPL   LINEBRP5
                JSR   LINEBR14        ; DECALAGE DE LINEBTB1,LINEBTB2 ET MISE EN PLACE VALEUR
                BRA   LINEBRP6
LINEBRP5        INY
                INY
                CPY   #$000C
                BNE   LINEBRP4

LINEBRP6        DEX
                DEX
                BPL   LINEBRP3


                LDY   #$0000          ; REMPLISSAGE DES TABLEAUX SELEC...
LINEBRP7        LDA   LINEBTB2,Y      ; DIFF RVB
                CMP   #$1FFF          ; MOINS DE 7 COULEURS SUR LA LIGNE
                BEQ   LINEBRP8
                LDA   LINEBTB1,Y      ; INDICE IMAGE
                STA   SELECIND+2,Y
                BRA   LINEBRP9

LINEBRP8        LDA   #$FFFF
                STA   SELECIND+2,Y    ; INDICE A FFFF (INUTILE)

LINEBRP9        INY
                INY
                CPY   #$000C
                BNE   LINEBRP7

                RTS

LINEDIFF        HEX   0000            ; DIFFERENCE RVB
LINEBTB1        HEX   0000,0000,0000,0000,0000,0000  ; INDICES DES REMPLACANTS
LINEBTB2        HEX   FF1F,FF1F,FF1F,FF1F,FF1F,FF1F  ; DIFF RVB (BRUTE 00-3A)
LINEBTB3        HEX   0000,0000,0000,0000,0000,0000  ; DIFF RVB DETAILLEE
LINEDICL        HEX   0000            ; DIFFERENCE CLASSEE R-V-B ET SENS

LINEBTBIND      HEX   0000            ; INDICE DU REMPLACE *2

********

LINEBRC         LDA   #$1FFF          ; CALCUL LA COULEUR LA PLUS PROCHE
                STA   LINEBRC2+1      ; INIT

                LDA   SELECIND
                XBA
                STA   LINEBRNEW2+1
* ASL
* TAX
* LDA STATCOL2,X
* TAX
* AND #$0F00 ; ROUGE
* STA LINEBR5+1
* TXA
* AND #$00F0 ; VERT
* STA LINEBR8+1
* TXA
* AND #$000F ; BLEU
* STA LINEBR11+1

                LDX   LINE3200NBC     ; NB DE COULEURS *2-2
LINEBRC1        LDA   LINEREFETAB,X   ; VERIF : COULEUR VALIDE
                BMI   LINEBRC3        ; FFFF : INVALIDE

                JSR   LINEBRNEW       ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   LINEBRC3        ; DIFF ZERO : COULEUR CHOISIT

LINEBRC2        CMP   #$A0A0
                BPL   LINEBRC3
                STA   LINEBRC2+1      ; STOCKE LA DIFF
                TXY                   ; STOCKE L'INDICE REFE *2 DANS Y
                CMP   #$0001          ; DIFF = 1, ON NE POURRA PAS FAIRE MIEUX
                BEQ   LINEBRC4

LINEBRC3        DEX
                DEX
                BPL   LINEBRC1

LINEBRC4        LDA   LINEREFETAB,Y
                TAY
                LDA   LINEBRC2+1      ; A=DIFF, Y=INDICE IMAGE REMPLACANT
                RTS

********

LINEBRD         LDA   SELECIND        ; CALCUL LA COULEUR AVEC DIFF DEFINIE
                XBA
                STA   LINEBRNEW2+1
* ASL
* TAX
* LDA STATCOL2,X
* TAX
* AND #$0F00 ; ROUGE
* STA LINEBR5+1
* TXA
* AND #$00F0 ; VERT
* STA LINEBR8+1
* TXA
* AND #$000F ; BLEU
* STA LINEBR11+1

                LDX   CONVSCIN
                LDA   CONVSCR1,X
                STA   LINEBRD2+1      ; VALEUR DE LA DIFF SOUHAITEE

                LDX   LINE3200NBC     ; NB DE COULEURS *2-2
LINEBRD1        LDA   LINEREFETAB,X   ; VERIF : COULEUR VALIDE
                BMI   LINEBRD3        ; FFFF : INVALIDE

                JSR   LINEBRNEW       ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   LINEBRD3        ; DIFF ZERO : COULEUR CHOISIT
LINEBRD2        CMP   #$A0A0
                BEQ   LINEBRD4

LINEBRD3        DEX
                DEX
                BPL   LINEBRD1

                LDA   #$0000          ; PAS TROUVE
                RTS

LINEBRD4        LDA   LINEREFETAB,X   ; TROUVE
                TAY                   ; INDICE
                LDA   LINEBRD2+1      ; A=DIFF, Y=INDICE IMAGE REMPLACANT
                RTS

********

ZONEBRC         LDA   #$1FFF          ; CALCUL LA COULEUR LA PLUS PROCHE
                STA   ZONEBRC2+1      ; INIT

                LDA   SELECIND
                XBA
                STA   LINEBRNEW2+1

                LDX   LINEZONENBC     ; NB DE COULEURS *2-2
ZONEBRC1        LDA   LINEREFETAB,X   ; VERIF : COULEUR VALIDE
                BMI   ZONEBRC3        ; FFFF : INVALIDE

                JSR   LINEBRNEW       ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   ZONEBRC3        ; DIFF ZERO : COULEUR CHOISIT

ZONEBRC2        CMP   #$A0A0
                BPL   ZONEBRC3
                STA   ZONEBRC2+1      ; STOCKE LA DIFF
                TXY                   ; STOCKE L'INDICE REFE *2 DANS Y
                CMP   #$0001          ; DIFF = 1, ON NE POURRA PAS FAIRE MIEUX
                BEQ   ZONEBRC4

ZONEBRC3        DEX
                DEX
                BPL   ZONEBRC1

ZONEBRC4        LDA   LINEREFETAB,Y
                TAY
                LDA   ZONEBRC2+1      ; A=DIFF, Y=INDICE IMAGE REMPLACANT
                RTS

********

ZONEBRD         LDA   SELECIND        ; CALCUL LA COULEUR AVEC DIFF DEFINIE
                XBA
                STA   LINEBRNEW2+1

                LDX   ZONESCIN
                LDA   ZONESCR1,X
                STA   ZONEBRD2+1      ; VALEUR DE LA DIFF SOUHAITEE

                LDX   LINEZONENBC     ; NB DE COULEURS *2-2
ZONEBRD1        LDA   LINEREFETAB,X   ; VERIF : COULEUR VALIDE
                BMI   ZONEBRD3        ; FFFF : INVALIDE

                JSR   LINEBRNEW       ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   ZONEBRD3        ; DIFF ZERO : COULEUR CHOISIT
ZONEBRD2        CMP   #$A0A0
                BEQ   ZONEBRD4

ZONEBRD3        DEX
                DEX
                BPL   ZONEBRD1

                LDA   #$0000          ; PAS TROUVE
                RTS

ZONEBRD4        LDA   LINEREFETAB,X   ; TROUVE
                TAY                   ; INDICE
                LDA   ZONEBRD2+1      ; A=DIFF, Y=INDICE IMAGE REMPLACANT
                RTS

***************  SOUS ROUTINE  ****************

PALEBRNEW       TXA                   ; NOUVELLE METHODE AVEC PRECALCUL
                LSR
                BRA   LINEBRNEW2
LINEBRNEW       LDA   LINEREFETAB,X
LINEBRNEW2      ORA   #$A0A0
                STA   LINEBRNEW3+1
LINEBRNEW3      LDAL  $22A0A0         ; ADRESSE DIFF
                AND   #$00FF
                STA   LINEDIFF
                RTS
*******

LINEBR          PHX                   ; CALCUL LA DIFFERENCE RVB ENTRE SELC ET LA Xeme COULEUR
                PHY
                LDA   LINEREFETAB,X   ; INDICE COULEUR DANS STATCOL2
                ASL
                TAX
                JMP   LINEBR0

*****

LINEBR0         STZ   LINERGDIF+2     ; INIT
                STZ   LINEVTDIF+2
                STZ   LINEBLDIF+2

                LDA   STATCOL2,X
LINEBR1         TAY                   ; TRAITEMENT  ** ROUGE **
                AND   #$0F00          ; ROUGE
                STA   LINEBR6+1
                SEC
LINEBR5         SBC   #$0000          ; 0R00
                BCS   LINEBR7
                LDA   LINEBR5+1       ; PROBLEME : DEPASSEMENT
                SEC
LINEBR6         SBC   #$0000          ; 0R00
                INC   LINERGDIF+2     ; SIGNE DE LA DIFF
LINEBR7         XBA
                STA   LINERGDIF       ; DIFF ROUGE

                TYA                   ; TRAITEMENT  ** VERT **
                AND   #$00F0          ; VERT
                STA   LINEBR9+1
                SEC
LINEBR8         SBC   #$0000          ; 00V0
                BCS   LINEBR10
                LDA   LINEBR8+1       ; PROBLEME : DEPASSEMENT
                SEC
LINEBR9         SBC   #$0000          ; 00V0
                INC   LINEVTDIF+2     ; SIGNE DE LA DIFF
LINEBR10        LSR
                LSR
                LSR
                LSR
                STA   LINEVTDIF       ; DIFF VERT

                TYA                   ; TRAITEMENT  ** BLEU **
                AND   #$000F          ; BLEU
                STA   LINEBR12+1
                SEC
LINEBR11        SBC   #$0000          ; 000B
                BCS   LINEBR13
                LDA   LINEBR11+1      ; PROBLEME : DEPASSEMENT
                SEC
LINEBR12        SBC   #$0000          ; 000B
                INC   LINEBLDIF+2     ; SIGNE DE LA DIFF
LINEBR13        STA   LINEBLDIF       ; DIFF BLEU

                LDA   LINERGDIF       ; ON CLASSE LES 3 (RG<VT<BL)
                CMP   LINEVTDIF
                BPL   LINEBR18
                LDA   LINEVTDIF+2     ; VT>RG
                BEQ   LINEBR19        ; VT>RG VT>0 => VT>RG : ON NE TOUCHE PAS
                BRA   LINEBR20        ; VT>RG VT<0 => VT<RG : ON ECHANGE
LINEBR18        LDA   LINERGDIF+2     ; RG>VT
                BEQ   LINEBR20
                BRA   LINEBR19        ; RG>VT RG<0 => RG<VT : ON NE TOUCHE PAS
LINEBR20        LDX   LINERGDIF       ; RG>VT RG>0 => RG>VT : ON ECHANGE
                LDY   LINERGDIF+2
                LDA   LINEVTDIF
                STA   LINERGDIF
                LDA   LINEVTDIF+2
                STA   LINERGDIF+2
                STY   LINEVTDIF+2
                STX   LINEVTDIF       ; RG<VT  OK
LINEBR19        LDA   LINEVTDIF
                CMP   LINEBLDIF
                BPL   LINEBR21
                LDA   LINEBLDIF+2     ; BL>VT
                BEQ   LINEBR24        ; BL>VT BL>0 => BL>VT : ON NE TOUCHE PAS
                BRA   LINEBR22        ; BL>VT BL<0 => BL<VT : ON ECHANGE
LINEBR21        LDA   LINEVTDIF+2     ; VT>BL
                BEQ   LINEBR22
                BRA   LINEBR24        ; VT>BL VT<0 => VT<BL : ON NE TOUCHE PAS
LINEBR22        LDX   LINEVTDIF       ; VT>BL VT>0 => VT>BL : ON ECHANGE
                LDY   LINEVTDIF+2
                LDA   LINEBLDIF
                STA   LINEVTDIF
                LDA   LINEBLDIF+2
                STA   LINEVTDIF+2
                STY   LINEBLDIF+2
                STX   LINEBLDIF       ; VT<BL  OK
LINEBR23        LDA   LINERGDIF
                CMP   LINEVTDIF
                BPL   LINEBR25
                LDA   LINEVTDIF+2     ; VT>RG
                BEQ   LINEBR24        ; VT>RG VT>0 => VT>RG : ON NE TOUCHE PAS
                BRA   LINEBR26        ; VT>RG VT<0 => VT<RG : ON ECHANGE
LINEBR25        LDA   LINERGDIF+2     ; RG>VT
                BEQ   LINEBR26
                BRA   LINEBR24        ; RG>VT RG<0 => RG<VT : ON NE TOUCHE PAS
LINEBR26        LDX   LINERGDIF       ; RG>VT RG>0 => RG>VT : ON ECHANGE
                LDY   LINERGDIF+2
                LDA   LINEVTDIF
                STA   LINERGDIF
                LDA   LINEVTDIF+2
                STA   LINERGDIF+2
                STY   LINEVTDIF+2
                STX   LINEVTDIF       ; RG<VT  OK

LINEBR24        LDA   LINEVTDIF       ; TRI FINI, ON CALCULE LA DIFFERENCE
                XBA
                STA   LINERVBDIF      ; COEF DE REFERENCE

                LDA   LINEVTDIF+2     ; ON CALCULE LA DIFFERENCE ENTRE VT ET BL
                CMP   LINEBLDIF+2
                BEQ   LINEBR27
                LDA   LINEVTDIF       ; VT ET BL DE SIGNE DIFFERENT => VT<0 BL>0
                CLC
                ADC   LINEBLDIF
                STA   LINEBLDIF
                BRA   LINEBR29
LINEBR27        LDA   LINEVTDIF+2     ; VT ET BL m^ SIGNE
                BEQ   LINEBR28
                LDA   LINEVTDIF       ; VT ET BL <0
                SEC
                SBC   LINEBLDIF
                STA   LINEBLDIF
                BRA   LINEBR29
LINEBR28        LDA   LINEBLDIF       ; VT ET BL >0
                SEC
                SBC   LINEVTDIF
                STA   LINEBLDIF

LINEBR29        LDA   LINEVTDIF+2     ; ON CALCUL LA DIFFERENCE ENTRE RG ET VT
                CMP   LINERGDIF+2
                BEQ   LINEBR30
                LDA   LINERGDIF       ; VT ET RG DE SIGNE DIFFERENT => VT>0 ET RG<0
                CLC
                ADC   LINEVTDIF
                STA   LINERGDIF
                BRA   LINEBR32
LINEBR30        LDA   LINEVTDIF+2     ; VT ET RG DE m^ SIGNE
                BEQ   LINEBR31
                LDA   LINERGDIF       ; VT<0 RG<0
                SEC
                SBC   LINEVTDIF
                STA   LINERGDIF
                BRA   LINEBR32
LINEBR31        LDA   LINEVTDIF       ; VT>0 RG>0
                SEC
                SBC   LINERGDIF
                STA   LINERGDIF

LINEBR32        CLC                   ; SOMME DES VALEURS ABSOLUES
                ADC   LINEBLDIF
                STA   LINEBR33+1
                ORA   LINERVBDIF
                STA   LINERVBDIF      ; COEF,SOMME VAL ABS
                STA   LINEDICL
                XBA
                AND   #$00FF
                ASL
                TAX
                LDA   LINEMULTI,X
                CLC
LINEBR33        ADC   #$A0A0          ; SOMME DES VAL ABS
                TAX
                LDA   LINECOLOR,X
                AND   #$00FF          ; DIFF RVB
                STA   LINEDIFF
                PLY
                PLX
                LDA   LINEDIFF        ; ENVOI LA DIFF (POUR TESTER SI=0)
                RTS

LINERVBDIF      HEX   00,00           ; COEF,SOMME VAL ABS
LINERGDIF       HEX   0000,0000
LINEVTDIF       HEX   0000,0000       ; TRIE DE HAUT EN BAS : RG<VT<BL
LINEBLDIF       HEX   0000,0000       ; DIFF,SIGNE


LINEBR14        CPY   #$000A          ; DECALAGE ET PLACEMENT DE LA NOUVELLE TEINTE DANS LA LISTE DES 6
                BEQ   LINEBR17        ; ON NE DECALE PAS

LINEBR36        CPY   #$0000          ; VERIFICATION DE NON REPETITION
                BEQ   LINEBR34        ; PAS POSSIBLE (PAS ENCORE DE VALEURS ENTREE)
                LDA   LINEBTB2-2,Y
                CMP   LINEDIFF
                BNE   LINEBR34        ; LE PRECEDENT N'EST PAS EGAL (INFERIEUR)

                LDA   LINEBTB3-2,Y
                AND   #$00FF          ; SOMME VAL ABS
                STA   LINEBR35+1
                LDA   LINEDICL
                AND   #$00FF          ; SOMME
LINEBR35        CMP   #$A0A0          ; SOMME
                BPL   LINEBR34        ; C'EST LE BON ORDRE
                DEY
                DEY                   ; IL FAUT LE PLACER AVANT : ON MODIFIE Y
                BRA   LINEBR36

LINEBR34        PHY
                STY   LINEBR16+1      ; CONDITION D'ARRET
                LDY   #$000A
LINEBR15        LDA   LINEBTB1-2,Y
                STA   LINEBTB1,Y      ; INDICE
                LDA   LINEBTB2-2,Y
                STA   LINEBTB2,Y      ; DIFF RVB
                LDA   LINEBTB3-2,Y
                STA   LINEBTB3,Y      ; DIFF R-V-B AVEC SENS ET VALEUR
                DEY
                DEY
LINEBR16        CPY   #$000A
                BNE   LINEBR15
                PLY
LINEBR17        LDA   LINEREFETAB,X   ; PLACEMENT DE L'INDICE (IMAGE)
                STA   LINEBTB1,Y
                LDA   LINEDIFF        ; PLACEMENT DE LA DIFFERENCE RVB
                STA   LINEBTB2,Y
                LDA   LINEDICL        ; INFORMATIONS SUR LA DIFF RVB
                STA   LINEBTB3,Y
                RTS

LINEMULTI       HEX   0000,1F00,3E00,5D00,7C00,9B00,BA00,D900,F800,1701,3601,5501,7401,9301,B201,D101
LINECOLOR       HEX   00,01,04,05,07,08,09,0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21
                HEX   01,02,05,06,07,08,09,0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21
                HEX   03,04,06,07,08,09,0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1E,20,21,22
                HEX   04,05,07,08,09,0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23
                HEX   06,07,08,09,0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24
                HEX   08,09,0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26
                HEX   0A,0B,0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28
                HEX   0C,0D,0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A
                HEX   0E,0F,10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C
                HEX   10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E
                HEX   12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F,30
                HEX   14,15,16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F,30,31,32
                HEX   16,17,18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F,30,31,32,33,34
                HEX   18,19,1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F,30,31,32,33,34,35,36
                HEX   1A,1B,1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F,30,31,32,33,34,35,36,37,38
                HEX   1C,1D,1E,1F,20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F,30,31,32,33,34,35,36,37,38,39,3A

****************************

LINESUB         LDA   NUMLINE         ; ECHANGE DES DEUX INDICES DE LA LIGNE
                DEC
                ASL
                TAX
                LDA   TABLE,X
                ASL
                STA   LINESUB1+1      ; ADRESSE DEBUT LIGNE
                STA   LINESUB2+1
                LDX   #$013F
LINESUB1        LDAL  $20A0A0,X
                TAY
                AND   #$00FF
                CMP   SELECIND
                BNE   LINESUB3
                TYA                   ; TROUVE, ON REMPLACE
                AND   #$FF00
                ORA   SELECIND+2
LINESUB2        STAL  $20A0A0,X
LINESUB3        DEX
                BPL   LINESUB1
                RTS

*********************

