
                LST   OFF              ; PALETTE

ECR1300         LDX   SECR2+1          ; PALETTE : <-
                LDA   #ECR13001
                STA   BUMPER5+1
                JMP   BUMPER
ECR13001        JSR   PALEGA           ; DECALAGE GAUCHE
                JMP   SOURIS1

ECR1301         LDX   SECR2+1          ; PALETTE : ->
                LDA   #ECR13011
                STA   BUMPER5+1
                JMP   BUMPER
ECR13011        JSR   PALEDR           ; DECALAGE DROITE
                JMP   SOURIS1

ECR1302         LDX   SECR2+1          ; PALETTE : POINT
                LDA   #ECR13021
                STA   BUMPER5+1
                JMP   BUMPER
ECR13021        LDA   COLOR2NB
                DEC
                BEQ   ECR13024         ; 1 SEULE COULEUR, ON SORT
                JSR   PALESUBS         ; TABLE REMAP + DECAL PALET + CALCUL FREQ
                JSR   ECR13023         ; CALCUL LE NB MAX D'ECRANS / NBCOUL
                CMP   PALETSLI         ; NB MAX
                BEQ   ECR13022
                STA   PALETSLI         ; ON A PASSE UN ECRAN, NUM SCREEN--
                LDA   PALETSCR
                DEC
                CMP   PALETSLI
                BMI   ECR13022
                DEC   PALETSCR
ECR13022        JSR   ECR13123         ; AFFICHAGE COULEUR + FREQ
                JSR   ECR13093         ; AFFICH NUM SCREEN
                JSR   ECR13034         ; AFFICH NB COUL
                LDA   PALETSCR         ; ON PREND L'INDICE DE LA COULEUR DU HAUT
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                LSR
                STA   PALETIND
                JSR   ECR13129         ; AFFICH BAS (FREQ, COUL)
                LDA   #$0001           ; RECALCUL : REMAP EN SORTIE
                STA   PALETFL
ECR13024        JMP   SOURIS1

ECR13023        LDX   #$0001           ; CALCUL LE NB MAX D'ECRAN AUTORISE
                LDA   COLOR2NB
ECR130230       CMP   #$0071           ; 112 + 1
                BMI   ECR130231        ; FINI
                SEC
                SBC   #$0070
                INX
                BRA   ECR130230
ECR130231       TXA
                RTS

*******

ECR1303         LDX   SECR2+1          ; PALETTE : R:UP
                LDA   #ECR13031
                STA   BUMPER5+1
                JMP   BUMPER
ECR13031        LDA   PALETR
                CMP   #$000F
                BEQ   ECR13032
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOL2,X
                CLC                    ; MODIF COULEUR PALETTE
                ADC   #$0100
                STA   STATCOL2,X
                JSR   ECR13063         ; MODIF COULEUR ECRAN
                JSR   ECR13129         ; AFFICHAGE BAS
                LDA   #$0001           ; ON MODIFIE 1 COULEUR
                STA   PALETFLC
ECR13032        JMP   SOURIS1

ECR1304         LDX   SECR2+1          ; PALETTE : R:DOWN
                LDA   #ECR13041
                STA   BUMPER5+1
                JMP   BUMPER
ECR13041        LDA   PALETR
                BEQ   ECR13042
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOL2,X
                SEC                    ; MODIF COULEUR PALETTE
                SBC   #$0100
                STA   STATCOL2,X
                JSR   ECR13063         ; MODIF COULEUR ECRAN
                JSR   ECR13129         ; AFFICHAGE BAS
                LDA   #$0001           ; ON MODIFIE 1 COULEUR
                STA   PALETFLC
ECR13042        JMP   SOURIS1

ECR1305         LDX   SECR2+1          ; PALETTE : V:UP
                LDA   #ECR13051
                STA   BUMPER5+1
                JMP   BUMPER
ECR13051        LDA   PALETV
                CMP   #$000F
                BEQ   ECR13052
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOL2,X
                CLC                    ; MODIF COULEUR PALETTE
                ADC   #$0010
                STA   STATCOL2,X
                JSR   ECR13063         ; MODIF COULEUR ECRAN
                JSR   ECR13129         ; AFFICHAGE BAS
                LDA   #$0001           ; ON MODIFIE 1 COULEUR
                STA   PALETFLC
ECR13052        JMP   SOURIS1

ECR1306         LDX   SECR2+1          ; PALETTE : V:DOWN
                LDA   #ECR13061
                STA   BUMPER5+1
                JMP   BUMPER
ECR13061        LDA   PALETV
                BEQ   ECR13062
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOL2,X
                SEC                    ; MODIF COULEUR PALETTE
                SBC   #$0010
                STA   STATCOL2,X
                JSR   ECR13063         ; MODIF COULEUR ECRAN
                JSR   ECR13129         ; AFFICHAGE BAS
                LDA   #$0001           ; ON MODIFIE 1 COULEUR
                STA   PALETFLC
ECR13062        JMP   SOURIS1

ECR1307         LDX   SECR2+1          ; PALETTE : B:UP
                LDA   #ECR13071
                STA   BUMPER5+1
                JMP   BUMPER
ECR13071        LDA   PALETB
                CMP   #$000F
                BEQ   ECR13072
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOL2,X
                INC                    ; MODIF COULEUR PALETTE
                STA   STATCOL2,X
                JSR   ECR13063         ; MODIF COULEUR ECRAN
                JSR   ECR13129         ; AFFICHAGE BAB
                LDA   #$0001           ; ON MODIFIE 1 COULEUR
                STA   PALETFLC
ECR13072        JMP   SOURIS1

ECR1308         LDX   SECR2+1          ; PALETTE : B:DOWN
                LDA   #ECR13081
                STA   BUMPER5+1
                JMP   BUMPER
ECR13081        LDA   PALETB
                BEQ   ECR13082
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOL2,X
                DEC                    ; MODIF COULEUR PALETTE
                STA   STATCOL2,X
                JSR   ECR13063         ; MODIF COULEUR ECRAN
                JSR   ECR13129         ; AFFICHAGE BAS
                LDA   #$0001           ; ON MODIFIE 1 COULEUR
                STA   PALETFLC
ECR13082        JMP   SOURIS1

ECR13063        LDA   PALETSCR         ; MODIF COULEUR ECRAN
                DEC
                ASL
                TAY
                LDA   PALETIND
                ASL
                SEC
                SBC   PALETAB,Y        ; 0, 2*112, 4*112
                TAY
                LDA   PALETADR,Y
                STA   ECR13064+1
                LDA   STATCOL2,X
ECR13064        STAL  $012000
                RTS

PALETR          HEX   0000             ; ROUGE
PALETV          HEX   0000             ; VERT
PALETB          HEX   0000             ; BLEU

********

ECR1309         LDX   SECR2+1          ; PALETTE : SCR UP
                LDA   #ECR13091
                STA   BUMPER5+1
                JMP   BUMPER
ECR13091        JSR   ECR130093
                JMP   SOURIS1
ECR130093       LDA   PALETSCR
                CMP   PALETSLI
                BEQ   ECR13092
                INC
                STA   PALETSCR
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                LSR
                STA   PALETIND         ; INDICE DE LA COULEUR EN HAUT A GAUCHE
                JSR   ECR13093         ; AFFICHAGE CHIFFRE SCR (1,2,3)
                JSR   ECR13123         ; AFFICHAGE COULEUR ET FREQUENCES ECRAN
                JSR   ECR13129         ; CALCUL ET AFFICHAGE BAS : COULEUR,FREQ,RVB
ECR13092        RTS

ECR1310         LDX   SECR2+1          ; PALETTE : SCR DOWN
                LDA   #ECR13101
                STA   BUMPER5+1
                JMP   BUMPER
ECR13101        JSR   ECR131003
                JMP   SOURIS1
ECR131003       LDA   PALETSCR
                CMP   #$0001
                BEQ   ECR13102
                DEC
                STA   PALETSCR
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                LSR
                STA   PALETIND         ; INDICE DE LA COULEUR EN HAUT A GAUCHE
                JSR   ECR13093         ; AFFICHAGE CHIFFRE SCR (1,2,3)
                JSR   ECR13123         ; AFFICHAGE COULEUR ET FREQUENCES ECRAN
                JSR   ECR13129         ; CALCUL ET AFFICHAGE BAS : COULEUR,FREQ,RVB
ECR13102        RTS

PALETSCR        HEX   0100             ; NUMERO DE L'ECRAN DE PALETTE
PALETSLI        HEX   0300             ; NOMBRE MAX D'ECRAN DE PALETTE

**********

ECR1311         LDX   SECR2+1          ; PALETTE : EXIT
                LDA   #ECR13110
                STA   BUMPER5+1
                JMP   BUMPER
ECR13110        JSR   ECR13110ESC      ; QQCHOSE A FAIRE AVANT DE SORTIR
                LDA   #$0006
                JMP   PICT

ECR13110ESC     LDA   PALETFL          ; RIEN A FAIRE, ON SORT
                ORA   PALETFLC
                BNE   ECR1311013
                RTS
ECR1311013      JSR   PLEASE           ; AFFICHE LE MESSAGE PLEASE WAIT
                LDA   PALETFL          ; ON A APPUYE SUR o (AU MOINS)
                BEQ   ECR13111
                LDX   #TRANSTAB1       ; COPIE LA TABLE DE TRANSLATION
                LDY   #$FD00
                LDA   #$00FF
ECR131100       MVN   $030000,$200000
                PHK
                PLB
                LDX   #$0002
ECR131101       JSL   $20FB00          ; REMAP PICTURE
                PHK
                PLB
ECR13111        LDA   PALETFLC         ; A T'ON TOUCHE AUX COULEURS
                BEQ   ECR13112
                LDA   #$0002           ; INIT
                LDY   #STATCOL2
ECR131110       JSL   $040100
                PHK
                PLB
                LDA   #$0004           ; COULEURS UTILES
ECR131111       JSL   $040100
                PHK
                PLB
                LDA   #$0006           ; TRI PALETTE
                LDY   #STATCOL2
ECR131112       JSL   $040100
                PHK
                PLB
                STA   COLOR2NB         ; NB COULEUR ZONE
                LDA   #$0008           ; REMAP PICTURE
ECR131113       JSL   $040100
                PHK
                PLB
                LDA   #$000C           ; CALCUL FREQUENCE
                LDY   #STATCOFR
ECR131114       JSL   $040100
                PHK
                PLB
ECR13112        LDA   PALETFL          ; CALCUL DU SPECTRE : NBCL
                ORA   PALETFLC
                BEQ   ECR13113
                LDA   #$000A
                LDY   #NBCLTAB
ECR131120       JSL   $040100
                PHK
                PLB
                JSR   PRECALCUL        ; PRECALCUL DE LA TABLE DE DIFF
                JSR   PLEASEF          ; ENLEVE LE MESSAGE
                STZ   PALETFL
                STZ   PALETFLC
ECR13113        RTS                    ; ON A TOUCHE A RIEN

PALETFL         HEX   0000             ; A ZERO TANT QU'ON NE TOUCHE PAS A o
PALETFLC        HEX   0000             ; A ZERO TANT QU'ON NE TOUCHE PAS AUX COUL

******

ECR1312         LDA   #ECR13120        ; PALETTE : SURFACE
                STA   SURFACE5+1
                JMP   SURFACE
ECR13120        LDA   PALETSCR
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                LSR
                STA   ECR13122+1
                LDA   POSX             ;      6 -> 314
                SEC
                SBC   #$0006           ; -6 : 0 -> 308
                LSR                    ; /2 : 0 -> 154
                ASL
                TAX
                LDA   FREQHORI,X       ;      0 -> 13
                STA   ECR13121+1
                LDA   POSY             ;      1 -> 161
                DEC                    ; -1 : 0 -> 160
                LSR
                LSR                    ; /4 : 0 -> 40
                ASL
                TAX
                LDA   FREQVERT,X       ;      0 -> 7
                ASL
                TAX
                LDA   FREQMULT,X       ; *14 : 0 -> 98
                CLC
ECR13121        ADC   #$FFFF           ; 0 -> 111
                CLC
ECR13122        ADC   #$A0A0           ; INDICE OFFSET
                CMP   PALETIND
                BEQ   ECR131222        ; ON NE REAFFICHE PAS SI IDENTIQUE
                CMP   COLOR2NB
                BPL   ECR131222        ; ON NE REAFFICHE PAS SI COUL NON VALIDE
                STA   PALETIND
                JSR   ECR13129         ; CALCUL ET AFF EN BAS : COUL,FREQ,RVB
ECR131222       JMP   SOURIS

***********  AFFICHAGE

ECR13033        LDA   #$8AA2           ; AFFICHAGE R : ROUGE
                STA   AFTCA+1
                LDA   PALETR
                JSR   CHIF
                RTS

ECR13053        LDA   #$8AA9           ; AFFICHAGE V : VERT
                STA   AFTCA+1
                LDA   PALETV
                JSR   CHIF
                RTS

ECR13083        LDA   #$8AB0           ; AFFICHAGE B : BLEU
                STA   AFTCA+1
                LDA   PALETB
                JSR   CHIF
                RTS

ECR13034        LDA   COLOR2NB         ; AFFICHAGE NB COULEUR (PALETTE TRIEE)
                STA   VALH
                LDA   #$965D
                STA   ADRE
                JSR   TRANSA
                RTS

ECR13093        LDA   #$8AD3           ; AFFICHAGE SCREEN (1,2,3)
                STA   AFTCA+1
                LDA   PALETSCR
                JSR   CHIF
                RTS

ECR13129        LDA   PALETIND         ; AFFICHAGE BAS : COULEUR SELECTIONNEE
                ASL
                TAY
                LDA   STATCOL2,Y       ; COULEUR BAS
                STAL  $019F42
                TAY                    ; R.V.B
                AND   #$000F
                STA   PALETB           ; B
                TYA
                AND   #$0F00
                XBA
                STA   PALETR           ; R
                TYA
                AND   #$00F0
                LSR
                LSR
                LSR
                LSR
                STA   PALETV           ; V
                JSR   ECR13033         ; AFF R
                JSR   ECR13053         ; AFF V
                JSR   ECR13083         ; AFF B
                LDA   PALETIND
                ASL
                TAX
                LDA   STATCOFR,X       ; FREQ
                STA   VALH
                LDA   #$8E01
                STA   ADRE
                JSR   TRANSB           ; AFFICHAGE FREQUENCE
                JSR   PALEBRP          ; REMPLISSAGE POUR LES TEINTES VOISINES
                LDX   #$0002           ; AFFICHAGE BAS : COULEUR PROCHES
ECR1312900      LDA   PALETIND,X
                BMI   ECR1312901
                ASL
                TAY
                LDA   STATCOL2,Y       ; COULEUR BAS
                STAL  $019F42,X
                INX
                INX
                CPX   #$000E
                BNE   ECR1312900
                RTS
ECR1312901      LDA   #$0000           ; INDICE INCOHERENT : COULEUR NOIRE
                STAL  $019F42,X
                INX
                INX
                CPX   #$000E
                BNE   ECR1312900
                RTS

PALETIND        HEX   0000             ; INDICE IMAGE
                HEX   0000,0000,0000,0000,0000,0000

PALETADR        HEX   429E,449E,469E,489E,4A9E,4C9E,4E9E,509E,529E,549E,569E,589E,5A9E,5C9E
                HEX   629E,649E,669E,689E,6A9E,6C9E,6E9E,709E,729E,749E,769E,789E,7A9E,7C9E
                HEX   829E,849E,869E,889E,8A9E,8C9E,8E9E,909E,929E,949E,969E,989E,9A9E,9C9E
                HEX   A29E,A49E,A69E,A89E,AA9E,AC9E,AE9E,B09E,B29E,B49E,B69E,B89E,BA9E,BC9E
                HEX   C29E,C49E,C69E,C89E,CA9E,CC9E,CE9E,D09E,D29E,D49E,D69E,D89E,DA9E,DC9E
                HEX   E29E,E49E,E69E,E89E,EA9E,EC9E,EE9E,F09E,F29E,F49E,F69E,F89E,FA9E,FC9E
                HEX   029F,049F,069F,089F,0A9F,0C9F,0E9F,109F,129F,149F,169F,189F,1A9F,1C9F
                HEX   229F,249F,269F,289F,2A9F,2C9F,2E9F,309F,329F,349F,369F,389F,3A9F,3C9F

PALETAB         HEX   0000,E000,C001

******************  REMPLISSAGE DE L'ECRAN  ***************

ECR13123        LDA   #PALETADR        ; REMPLISSAGE COUL+FREQ
                STA   ECR13124+1
                LDA   COLOR2NB
                ASL
                STA   ECR13126+1       ; CONDITION ARRET
                LDA   PALETSCR         ; 1,2 OU 3
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                TAY
                LDX   #$0000
ECR13124        LDA   PALETADR,X       ; COULEUR
                STA   ECR13125+1
                LDA   STATCOL2,Y
ECR13125        STAL  $019F22
                LDA   FREQADRE,X       ; FREQUENCE
                STA   ADRE
                LDA   STATCOFR,Y
                STA   VALH
                PHX
                PHY
                JSR   TRANSB
                PLY
                PLX
                INX
                INX
                INY
                INY
                CPX   #$00E0           ; 112*2
                BEQ   ECR131290
ECR13126        CPY   #$A0A0
                BNE   ECR13124
ECR13127        LDA   PALETADR,X       ; COULEUR NOIRE
                STA   ECR13128+1
                LDA   #$0000
ECR13128        STAL  $019F22
                LDA   FREQADRE,X       ; FREQUENCE INVISIBLE
                STA   ADRE
                LDA   #$0000
                STA   VALH
                PHX
                PHY
                JSR   TRANSB
                PLY
                PLX
                INY
                INY
                INX
                INX
                CPX   #$00E0           ; 112*2
                BNE   ECR13127
ECR131290       RTS

ECR13200        RTS                    ; ON RECOPIE DE FREQRVB VERS STATCOL2

************  DECALAGE COULEURS BAS  ****************

PALEGA          LDA   COLOR2NB         ; DECALAGE A GAUCHE D'UN CRAN
                CMP   #$0003           ; DEPLACE LES INDICES ET LE COULEURS A L'ECRAN
                BPL   PALEGA1
                RTS                    ; 1 OU 2 COULEUR SUR LA LIGNE
PALEGA1         LDY   #$000C
                CMP   #$0007
                BPL   PALEGA2
                DEC
                ASL
                TAY
PALEGA2         LDAL  $019F44          ; COULEUR RVB
                PHA
                LDA   PALETIND+2       ; INDICE
                PHA
                LDX   #$0000
PALEGA3         LDA   PALETIND+4,X     ; DECAL INDICE + RVB
                STA   PALETIND+2,X
                LDAL  $019F46,X
                STAL  $019F44,X
                INX
                INX
                CPX   #$000A
                BNE   PALEGA3
                TYX
                PLA
                STA   PALETIND,X
                PLA
                STAL  $019F42,X
                RTS

PALEDR          LDA   COLOR2NB         ; DECALAGE A DROITE D'UN CRAN
                CMP   #$0003
                BPL   PALEDR1
                RTS                    ; 1 OU 2 COULEUR SUR LA LIGNE
PALEDR1         LDX   #$000C
                STX   PALEDR4+1
                LDX   #$000C
                CMP   #$0007
                BPL   PALEDR2
                DEC                    ; MOINS DE 7 COULEURS
                ASL
                TAX
                STA   PALEDR4+1
PALEDR2         LDA   PALETIND,X       ; SAUVEGARDE
                PHA
                LDAL  $019F42,X        ; VALEUR RVB
                PHA
PALEDR4         LDX   #$000C
PALEDR3         LDA   PALETIND-2,X
                STA   PALETIND,X       ; INDICE
                LDAL  $019F40,X
                STAL  $019F42,X
                DEX
                DEX
                CPX   #$0002
                BNE   PALEDR3
                PLA
                STAL  $019F44
                PLA
                STA   PALETIND+2
                RTS

****************  CALCUL DES 6 TEINTES LES + PROCHES  ********************

PALEBRP         LDX   #$000A
                LDA   #$1FFF           ; INIT : REMPLISSAGE DES DIFF RVB A #$1FFF
PALEBRP2        STA   LINEBTB2,X
                DEX
                DEX
                BPL   PALEBRP2

* LDA PALETIND   ; NOUVELLE METHODE
* XBA
* STA LINEBRNEW2+1

                LDA   PALETIND         ; IL FAUT TROUVER LES 6 TEINTES RVB LES + PROCHES
                ASL
                TAX
                STX   PALEBRP1+1       ; INDICE DE LA COULEUR DE REFERENCE
                LDA   STATCOL2,X
                TAX
                AND   #$0F00           ; ROUGE
                STA   LINEBR5+1
                TXA
                AND   #$00F0           ; VERT
                STA   LINEBR8+1
                TXA
                AND   #$000F           ; BLEU
                STA   LINEBR11+1

                LDA   COLOR2NB         ; NB DE COUL
                DEC
                ASL
                TAX                    ; NB DE COULEURS *2-2
PALEBRP3        JSR   PALEBR           ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BNE   PALEBRP10        ; DIFF ZERO : COULEUR CHOISIT ?
PALEBRP1        CPX   #$A0A0
                BEQ   PALEBRP6
PALEBRP10       LDY   #$0000           ; X : INDICE SUR LINERVB, Y : INDICE SUR LINEBT2
PALEBRP4        CMP   LINEBTB2,Y
                BPL   PALEBRP5
                JSR   PALEBR14         ; DECALAGE DE LINEBTB1,LINEBTB2 ET MISE EN PLACE VALEUR
                BRA   PALEBRP6
PALEBRP5        INY
                INY
                CPY   #$000C           ; 12
                BNE   PALEBRP4
PALEBRP6        DEX
                DEX
                BPL   PALEBRP3

                LDY   #$0000           ; REMPLISSAGE DES TABLEAUX SELEC...
PALEBRP7        LDA   LINEBTB2,Y
                CMP   #$1FFF           ; MOINS DE 7 COULEURS
                BEQ   PALEBRP8
                LDA   LINEBTB1,Y       ; INDICE DANS STATCOL2
                STA   PALETIND+2,Y
                BRA   PALEBRP9
PALEBRP8        LDA   #$FFFF
                STA   PALETIND+2,Y     ; INDICE A FFFF (INUTILE)
PALEBRP9        INY
                INY
                CPY   #$000C
                BNE   PALEBRP7
                RTS

********

PALEBRC         LDA   #$1FFF           ; CALCUL LA COULEUR LA PLUS PROCHE
                STA   PALEBRC2+1       ; INIT

                LDA   PALETIND
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

                LDA   NBCOLORPALETTE   ; NB DE COUL
                DEC
                ASL
                TAX                    ; NB DE COULEURS *2-2
PALEBRC1        LDA   STATCOFR,X       ; VERIF : COULEUR VALIDE (FREQ != 0)
                BEQ   PALEBRC3
                JSR   PALEBRNEW        ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   PALEBRC3         ; DIFF ZERO : COULEUR CHOISIT
PALEBRC2        CMP   #$A0A0
                BPL   PALEBRC3
                STA   PALEBRC2+1       ; STOCKE LA DIFF
                TXY                    ; STOCKE L'INDICE*2 DANS Y
                CMP   #$0001           ; DIFF = 1, ON NE POURRA PAS FAIRE MIEUX
                BEQ   PALEBRC4
PALEBRC3        DEX
                DEX
                BPL   PALEBRC1
PALEBRC4        TYA
                LSR
                TAY
                LDA   PALEBRC2+1       ; A=DIFF, Y=INDICE REMPLACANT
                RTS

NBCOLORPALETTE  HEX   0000             ; NB COULEUR DANS LA PALETTE

********

PALEBRD         LDA   PALETIND         ; CALCUL LA COULEUR AVEC DIFF DEFINIE
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

                LDX   CONVOSCI
                LDA   CONVOSC1,X
                STA   PALEBRD2+1       ; VALEUR DE LA DIFF SOUHAITEE

                LDA   NBCOLORPALETTE   ; NB DE COUL
                DEC
                ASL
                TAX                    ; NB DE COULEURS *2-2
PALEBRD1        LDA   STATCOFR,X       ; VERIF : COULEUR VALIDE (FREQ != 0)
                BEQ   PALEBRD3
                JSR   PALEBRNEW        ; RETOURNE DANS ACC LA DIFF RVB, DANS LINEDICL L'INFO
                BEQ   PALEBRD3         ; DIFF ZERO : COULEUR CHOISIT
PALEBRD2        CMP   #$A0A0
                BEQ   PALEBRD4
PALEBRD3        DEX
                DEX
                BPL   PALEBRD1
                LDA   #$0000           ; PAS TROUVE
                RTS
PALEBRD4        TXA                    ; TROUVE
                LSR
                TAY                    ; INDICE
                LDA   PALEBRD2+1       ; A=DIFF, Y=INDICE REMPLACANT
                RTS

******************

PALEBR          PHX                    ; CALCUL LA DIFFERENCE RVB ENTRE SELC ET LA Xeme COULEUR
                PHY
                JMP   LINEBR0
                RTS
**************

PALEBR14        CPY   #$000A           ; DECALAGE ET PLACEMENT DE LA NOUVELLE TEINTE DANS LA LISTE DES 6
                BEQ   PALEBR17         ; ON NE DECALE PAS
PALEBR36        CPY   #$0000           ; VERIFICATION DE NON REPETITION
                BEQ   PALEBR34         ; PAS POSSIBLE (PAS ENCORE DE VALEURS ENTREE)
                LDA   LINEBTB2-2,Y
                CMP   LINEDIFF
                BNE   PALEBR34         ; LE PRECEDENT N'EST PAS EGAL (INFERIEUR)
                LDA   LINEBTB3-2,Y
                AND   #$00FF           ; SOMME VAL ABS
                STA   PALEBR35+1
                LDA   LINEDICL
                AND   #$00FF           ; SOMME
PALEBR35        CMP   #$A0A0           ; SOMME
                BPL   PALEBR34         ; C'EST LE BON ORDRE
                DEY
                DEY                    ; IL FAUT LE PLACER AVANT : ON MODIFIE Y
                BRA   PALEBR36
PALEBR34        PHY
                STY   PALEBR16+1       ; CONDITION D'ARRET
                LDY   #$000A
PALEBR15        LDA   LINEBTB1-2,Y
                STA   LINEBTB1,Y       ; INDICE
                LDA   LINEBTB2-2,Y
                STA   LINEBTB2,Y       ; DIFF RVB
                LDA   LINEBTB3-2,Y
                STA   LINEBTB3,Y       ; DIFF R-V-B AVEC SENS ET VALEUR
                DEY
                DEY
PALEBR16        CPY   #$000A
                BNE   PALEBR15
                PLY                    ; PLACEMENT DE L'INDICE (TABLEAU)
PALEBR17        TXA
                LSR
                STA   LINEBTB1,Y
                LDA   LINEDIFF         ; PLACEMENT DE LA DIFFERENCE RVB
                STA   LINEBTB2,Y
                LDA   LINEDICL         ; INFORMATIONS SUR LA DIFF RVB
                STA   LINEBTB3,Y
                RTS

**********  SUBSTITUTION DE LA COULEUR  *************

PALESUBS        LDA   COLOR2NB         ; PALETTE
                ASL
                STA   PALESUBS2+1
                LDA   PALETIND         ; REMPLACE
                ASL
                TAX
                LDA   PALETIND+2       ; REMPLACANT
                ASL
                TAY
                LDA   STATCOFR,Y       ; NOUVELLE FREQ = SOMME DES 2
                CLC
                ADC   STATCOFR,X
                STA   STATCOFR,Y
PALESUBS1       LDA   STATCOL2+2,X     ; DECAL PALETTE + FREQ
                STA   STATCOL2,X
                LDA   STATCOFR+2,X
                STA   STATCOFR,X
                INX
                INX
PALESUBS2       CPX   #$A0A0           ; NB COULEUR
                BNE   PALESUBS1
                DEC   COLOR2NB         ; NB COULEUR --
                JSR   PALESUBS5        ; CREE LA TABLE DE TRANSLATION INTERMEDIAIRE
                JSR   PALESUBS3        ; MET A JOUR LA TABLE DE TRANSLATION
                RTS

PALESUBS3       LDA   #$0000           ; MET A JOUR LA TABLE DE TRANSLATION
                CLC
                XCE
                SEP   #$30
                CLC
                XCE
                REP   #$10             ; A:8 BIT, X,Y:16 BIT
                LDX   #$00FF
PALESUBS4       LDA   TRANSTAB1,X
                TAY
                LDA   TRANSTAB2,Y
                STA   TRANSTAB1,X
                DEX
                BPL   PALESUBS4
                CLC
                XCE
                REP   #$30
                RTS

PALESUBS5       LDA   #$0000           ; REMPLIT LA TABLE DE TRANS NUMERO 2
                CLC
                XCE
                SEP   #$30
                CLC
                XCE
                REP   #$10             ; A:8 BIT, X,Y:16 BIT
                LDA   #$00
                LDX   #$0000
PALESUBS6       CPX   PALETIND         ; REMPLACE
                BNE   PALESUBS8
                PHA
                LDA   PALETIND+2       ; REMPLACANT
                STA   TRANSTAB2,X
                PLA
                LDY   PALETIND
                CPY   PALETIND+2
                BPL   PALESUBS9
                DEC   TRANSTAB2,X
                BRA   PALESUBS9
PALESUBS8       STA   TRANSTAB2,X
                INC
PALESUBS9       INX
                CPX   #$0100
                BNE   PALESUBS6
                CLC
                XCE                    ; FULL 16 BIT
                REP   #$30
                RTS

PALESUBSINIT    LDX   #$0000           ; REMPLIT LA TABLE DE TRANSLATION INIT
                LDA   #$0100
PALESUBSINIT1   STA   TRANSTAB1,X
                CLC
                ADC   #$0202
                INX
                INX
                CPX   #$0100
                BNE   PALESUBSINIT1
                RTS

TRANSTAB1       DS    256
TRANSTAB2       DS    256

****************************************************

