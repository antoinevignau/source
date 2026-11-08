
            LST   OFF            ; COLOR 2

ECR1100     LDX   SECR2+1        ; COLORS2 : SCR UP
            LDA   #ECR11001
            STA   BUMPER5+1      ; COLORS2 : PALETTE TRIEE ET REDUITE
            JMP   BUMPER
ECR11001    JSR   ECR110003
            JMP   SOURIS1
ECR110003   LDA   COLOR2CR
            CMP   COLOR2SL
            BEQ   ECR11002
            INC
            STA   COLOR2CR
            JSR   ECR11003       ; AFFICHAGE CHIFFRE
            JSR   ECR11013       ; AFFICHAGE COULEUR
ECR11002    RTS

ECR1101     LDX   SECR2+1        ; COLORS2 : SCR DOWN
            LDA   #ECR11011
            STA   BUMPER5+1
            JMP   BUMPER
ECR11011    JSR   ECR110013
            JMP   SOURIS1
ECR110013   LDA   COLOR2CR
            CMP   #$0001
            BEQ   ECR11012
            DEC
            STA   COLOR2CR
            JSR   ECR11003       ; AFFICHAGE CHIFFRE
            JSR   ECR11013       ; AFFICHAGE COULEUR
ECR11012    RTS

ECR1102     LDX   SECR2+1        ; COLORS2 : EXIT
            LDA   #ECR11030
            STA   BUMPER5+1
            JMP   BUMPER
ECR11030    LDA   #$0006         ; IMAGE STAT
            JMP   PICT

************

COLOR2CR    HEX   0100           ; NUMERO DE SCREEN COLORS2
COLOR2SL    HEX   0200           ; LIMITE DU NOMBRE D'ECRAN : 2
COLOR2NB    HEX   0001           ; NOMBRE DE COULEUR DE COLOR2 (SUR 4 CHIFFRES)

ECR11003    LDA   #$9322         ; AFFICHAGE DU NUMERO DE SCREEN
            STA   AFTCA+1        ; ADRESSE ECRAN
            LDA   COLOR2CR
            JSR   CHIF
            RTS

ECR11004    LDA   COLOR2NB       ; AFFICHAGE DU NB DE COUL
            STA   VALH
            LDA   #$935A
            STA   ADRE
            JSR   TRANSA
            RTS

ECR11013    LDY   #$0186         ; AFFICHAGE DES TEINTES RVB DE LA PALETTE
ECR11014    LDA   COLOR12ADR,Y
            TAX
            LDA   #$0000         ; TOUTES LES COULEURS A ZERO
            STAL  $019000,X
            DEY
            DEY
            BPL   ECR11014

            LDA   COLOR2CR       ; COMBIEN DE COULEUR AFFICHE T'ON ?
            CMP   #$0002
            BEQ   ECR11015

            LDA   COLOR2NB       ; ECRAN 1
            CMP   #$00C4         ; 196
            BMI   ECR11019
            LDA   #$00C4         ;
ECR11019    ASL
            STA   ECR11018+1
            LDA   #STATCOL2      ; COLOR2NB COULEURS, DEBUT PALETTE
            STA   ECR11017+1
            LDY   #$0000
            BRA   ECR11016

ECR11015    LDA   COLOR2NB       ; ECRAN 2
            SEC
            SBC   #$00C4
            ASL
            STA   ECR11018+1
            LDA   #STATCOL2+392  ; COLOR2NB-196 COULEURS, MILIEU PALETTE
            STA   ECR11017+1     ;
            LDY   #$0000

ECR11016    LDA   COLOR12ADR,Y
            TAX
ECR11017    LDA   STATCOL2,Y
            STAL  $019000,X
            INY
            INY
ECR11018    CPY   #$A0A0
            BNE   ECR11016
            RTS

************

