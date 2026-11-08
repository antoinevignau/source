
            LST   OFF         ; STATISTICS

ECR0600     LDX   SECR2+1     ; STAT : VIEW COLORS1
            LDA   #ECR06000
            STA   BUMPER5+1
            JMP   BUMPER
ECR06000    LDA   #$000A      ; IMAGE COLORS1
            JMP   PICT

ECR0601     LDX   SECR2+1     ; STAT : VIEW COLORS2
            LDA   #ECR06010
            STA   BUMPER5+1
            JMP   BUMPER
ECR06010    LDA   #$000B      ; IMAGE COLORS2
            JMP   PICT

ECR0602     LDX   SECR2+1     ; STAT : VIEW TABLE
            LDA   #ECR06020
            STA   BUMPER5+1
            JMP   BUMPER
ECR06020    LDA   #$000D      ; IMAGE PALETTE
            JMP   PICT

ECR0603     LDX   SECR2+1     ; STAT : VIEW SPECTRE
            LDA   #ECR06030
            STA   BUMPER5+1
            JMP   BUMPER
ECR06030    LDA   #$000C      ; IMAGE NBCL
            JMP   PICT

ECR0604     LDX   SECR2+1     ; STAT : EXIT
            LDA   #ECR06040
            STA   BUMPER5+1
            JMP   BUMPER
ECR06040    LDA   #$0001      ; IMAGE MAIN
            JMP   PICT


****************  ROUTINES PRELIMINAIRES : TRAVAIL SUR LA PALETTE  ************

STATGO      LDA   STATFLAG
            BEQ   STATTRA     ; ON TRANSFORME
            RTS               ; ON SORT

STATFLAG    HEX   0000        ; A 1 SI DEJA TRAITEE

**************  CALCULE LES STATISTIQUES  ***************

STATTRA     LDA   #$0006      ; A T'ON CHARGE UNE IMAGE ?
            STA   ALERTI
            JSR   ALERT
            LDA   #$0000      ; A T'ON CHOISIT UNE ZONE ?
            STA   ALERTI
            JSR   ALERT

            LDA   #$0000      ; AFFICHE FENETRE : TRAVAIL PRELIMINAIRE
            STA   WORKINGI
            JSR   WORKING

            LDA   #$0002      ; INIT
            LDY   #STATCOL1
STAT2       JSL   $040100
            PHK
            PLB

            LDA   #MESSAGE3
            JSR   WORKING15
            LDA   #$0004      ; COULEURS UTILES
STAT3       JSL   $040100
            PHK
            PLB

            LDA   #MESSAGE4
            JSR   WORKING15
            LDA   #$0006      ; TRI PALETTE
            LDY   #STATCOL2
STAT4       JSL   $040100
            PHK
            PLB
            STA   COLOR2NB    ; NB COULEUR ZONE

            LDA   #MESSAGE5
            JSR   WORKING15
            LDA   #$0008      ; REMAP PICTURE
STAT5       JSL   $040100
            PHK
            PLB

            LDA   #MESSAGE6
            JSR   WORKING15
            LDA   #$000A      ; CALCUL NBCL
            LDY   #NBCLTAB
STAT6       JSL   $040100
            PHK
            PLB

            LDA   #MESSAGE9
            JSR   WORKING15
            LDA   #$000C      ; CALCUL FREQUENCE
            LDY   #STATCOFR
STAT7       JSL   $040100
            PHK
            PLB

            LDA   #MESSAGE10
            JSR   WORKING15
            JSR   PRECALCUL   ; PRECALCUL DE LA TABLE DE DIFF

            JSR   ALERTFIN    ; ENLEVE FENETRE

            LDA   #$0001
            STA   STATFLAG    ; DEJA TRAITEE

            RTS
**********

STATCOL1    DS    256*2       ; COULEURS PALETTE ORIGINE

STATCOL2    DS    256*2       ; COULEURS TRIEES ZONE CHOISIE

STATCOFR    DS    256*2       ; FREQUENCE UTILISATION

***************************************************

