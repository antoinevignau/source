
                 LST   OFF              ; SELECT AREA

ECR0400          LDA   #CLNSELE+2       ; SELECT : FULL SCREEN
                 STA   CLNBMP2+1        ; NETTOYAGE
                 LDA   #ECR04001        ; TRAITEMENT A EFFECTUER
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR04001         LDA   #$0000           ; BOUTON=00
                 STA   CLNSELE
                 LDX   #$0140
                 LDA   OHS
                 CMP   #$0140           ; ON CHOISIT LE 320*200
                 BPL   ECR04002         ; OU MOINS SI IMAGE + PETITE
                 LDX   OHS
ECR04002         STX   RHS
                 LDX   #$00C8
                 LDA   OVS
                 CMP   #$00C8
                 BPL   ECR04003
                 LDX   OVS
ECR04003         STX   RVS
                 JSR   ECR04061         ; AFFICHAGE CHIFFRES
                 JMP   SOURIS1

ECR0401          LDA   #CLNSELE+2       ; SELECT : POURCENT
                 STA   CLNBMP2+1        ; NETTOYAGE
                 LDA   #ECR04010        ; TRAITEMENT A EFFECTUER
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR04010         LDA   #$0002           ; BOUTON=02
                 STA   CLNSELE
                 JSR   REDUCEH          ; ON MODIFIE EN FONCTION DU %
                 JSR   REDUCEV
                 JSR   ECR04061         ; AFFICHAGE
                 JMP   SOURIS1

ECR0402          LDA   #CLNSELE+2       ; SELECT : SIZE
                 STA   CLNBMP2+1        ; NETTOYAGE
                 LDA   #ECR04021        ; TRAITEMENT A EFFECTUER
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR04021         LDA   #$0004           ; BOUTON=04
                 STA   CLNSELE
                 LDA   PRHS             ; ON CHOISIT LA TAILLE INDIQUEE
                 STA   RHS
                 LDA   PRVS
                 STA   RVS
                 JSR   ECR04061         ; AFFICHAGE CHIFFRES
                 JMP   SOURIS1

ECR0403          LDX   SECR2+1          ; SELECT : HORI +
                 LDA   #ECR04030
                 STA   BOMPER5+1
                 JMP   BOMPER
ECR04030         LDA   PRHR             ; +1
                 CMP   #$0064           ; 100%
                 BEQ   ECR04032         ; JMP SOURIS
                 INC
                 STA   PRHR
ECR04035         LDA   CLNSELE
                 CMP   #$0002           ; % CHOISIT
                 BNE   ECR04031
                 JSR   REDUCEH          ; MODIFICATION REDUCED
ECR04031         JSR   ECR04061         ; AFFICHAGE
ECR04032         JMP   SOURIS

ECR0404          LDX   SECR2+1          ; SELECT : HORI -
                 LDA   #ECR04040
                 STA   BOMPER5+1
                 JMP   BOMPER
ECR04040         LDA   PRHR             ; -1
                 CMP   #$0001           ; 1%
                 BEQ   ECR04042
                 DEC
                 STA   PRHR
ECR04045         LDA   CLNSELE
                 CMP   #$0002           ; % CHOISIT
                 BNE   ECR04041
                 JSR   REDUCEH          ; MODIFICATION REDUCED
ECR04041         JSR   ECR04061         ; AFFICHAGE
ECR04042         JMP   SOURIS

ECR0412          LDA   #ECR04120        ; HORI % : SURFACE
                 STA   SURFACE5+1
                 JMP   SURFACE
ECR04120         JSR   DESS1
                 LDA   #$6AC2
                 LDX   #$0001
                 LDY   #$0064
                 JSR   SAISIEVAL
                 BNE   ECR04121
                 LDA   PRHR
ECR04121         STA   PRHR
                 JSR   ECR04103         ; SOURIS VIDE
                 LDA   CLNSELE
                 CMP   #$0002           ; % CHOISIT
                 BNE   ECR04122
                 JSR   REDUCEH          ; MODIFICATION REDUCED
ECR04122         JSR   ECR04061         ; AFFICHAGE
                 JSR   SAUV
                 JMP   SOURIS1

ECR0405          LDX   SECR2+1          ; SELECT : VERT +
                 LDA   #ECR04050
                 STA   BOMPER5+1
                 JMP   BOMPER
ECR04050         LDA   PRVR             ; +1
                 CMP   #$0064           ; 100%
                 BEQ   ECR04052         ; SORT
                 INC
                 STA   PRVR
ECR04055         LDA   CLNSELE
                 CMP   #$0002           ; % CHOISIT
                 BNE   ECR04051
                 JSR   REDUCEV          ; MODIFICATION REDUCED
ECR04051         JSR   ECR04061         ; AFFICHAGE CHIFFRE
ECR04052         JMP   SOURIS

ECR0406          LDX   SECR2+1          ; SELECT : VERT -
                 LDA   #ECR04060
                 STA   BOMPER5+1
                 JMP   BOMPER
ECR04060         LDA   PRVR             ; -1
                 CMP   #$0001           ; 1%
                 BEQ   ECR04062
                 DEC
                 STA   PRVR
ECR04065         LDA   CLNSELE
                 CMP   #$0002           ; % CHOISIT
                 BNE   ECR04064
                 JSR   REDUCEV          ; MODIFICATION REDUCED
ECR04064         JSR   ECR04061         ; AFFICHAGE CHIFFRE
ECR04062         JMP   SOURIS

ECR0413          LDA   #ECR04130        ; VERT % : SURFACE
                 STA   SURFACE5+1
                 JMP   SURFACE
ECR04130         JSR   DESS1
                 LDA   #$7242
                 LDX   #$0001
                 LDY   #$0064
                 JSR   SAISIEVAL
                 BNE   ECR04131
                 LDA   PRVR
ECR04131         STA   PRVR
                 JSR   ECR04103         ; SOURIS VIDE
                 LDA   CLNSELE
                 CMP   #$0002           ; % CHOISIT
                 BNE   ECR04132
                 JSR   REDUCEV          ; MODIFICATION REDUCED
ECR04132         JSR   ECR04061         ; AFFICHAGE
                 JSR   SAUV
                 JMP   SOURIS1

ECR04063         LDA   OHS              ; AFFICHAGE CHIFFRE
                 STA   VALH
                 LDA   #$26B0
                 STA   ADRE
                 JSR   TRANSA           ; AFFICHAGE OHS
                 LDA   OVS
                 STA   VALH
                 LDA   #$2E30
                 STA   ADRE
                 JSR   TRANSA           ; AFFICHAGE OVS
ECR04061         LDA   RHS
                 STA   VALH
                 LDA   #$3790
                 STA   ADRE
                 JSR   TRANSA           ; AFFICHAGE RHS
                 LDA   RVS
                 STA   VALH
                 LDA   #$3F10
                 STA   ADRE
                 JSR   TRANSA           ; AFFICHAGE RVS
                 LDA   PRHR
                 STA   VALH
                 LDA   #$6AC2
                 STA   ADRE
                 JSR   TRANS            ; AFFICHAGE PRHR
                 LDA   PRVR
                 STA   VALH
                 LDA   #$7242
                 STA   ADRE
                 JSR   TRANS            ; AFFICHAGE PRVR
                 LDA   PRHS
                 STA   VALH
                 LDA   #$7BA2
                 STA   ADRE
                 JSR   TRANSA           ; AFFICHAGE PRHS
                 LDA   PRVS
                 STA   VALH
                 LDA   #$8322
                 STA   ADRE
                 JSR   TRANSA           ; AFFICHAGE PRVS
                 RTS

OHS              HEX   4001             ; ORIGINAL HORI SIZE
OVS              HEX   C800             ; ORIGINAL VERT SIZE
RHS              HEX   4001             ; REDUCED  HORI SIZE
RVS              HEX   C800             ; REDUCED  VERT SIZE
PRHR             HEX   6400             ; PICT REDUC HORI RATE (1% - 100%)
PRVR             HEX   6400             ; PICT REDUC VERT RATE (1% - 100%)
PRHS             HEX   4001             ; PICT REDUC HORI SIZE
PRVS             HEX   C800             ; PICT REDUC VERT SIZE

SELEIND          HEX   0000             ; INDICE DE SELETAB
SELETAB          DS    100*2
                 HEX   0000             ; ZERO EN BUTEE

SELCIND          HEX   0000             ; INDICE DE SELCOLT
SELCOLT          DS    800*3            ; TABLE CONTENANT LES ADRESSES DES DEBUTS DE LIGNES DE L'IMAGE NON CONVERTIT

SELNIND          HEX   0000             ; INDICE DE SELNBT
SELNBT           DS    800*3            ; TABLE CONTENANT LES ADRESSE DES DEBUTS DE LIGNES DE L'IMAGE N&B

SELHIND          HEX   0000             ; INDICE DE LA TABLE SELHORT
SELHORT          DS    1280*2           ; CONTIENT LES NUMEROS DES COLONNES CHOISIES DANS REDUCED
LINEPTS          HEX   0000,0000,0000,0000  ; 4 DE PLUS EN BUTEE

SELVIND          HEX   0000             ; INDICE DE LA TABLE SELVERT
SELVERT          DS    800*2            ; CONTIENT LES NUMEROS DES LIGNES CHOISIES DANS REDUCED
                 HEX   0000,0000,0000,0000  ; 4 DE PLUS EN BUTEE

ECR0407          LDX   SECR2+1          ; SELECT : SELECT
                 LDA   #ECR04070
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR04070         JSR   DESS1            ; TRAITEMENT DE LA VISION EN NIVEAU DE GRIS
                 LDA   #$0006
                 STA   ALERTI           ; A T'ON CHARGE UNE IMAGE ?
                 JSR   ALERT
                 LDA   #$0001           ; PICTURE REDUCTION
                 STA   WORKINGI
                 JSR   WORKING          ; AFFICHAGE FENETRE
                 JSR   SELCONV          ; CONVERSION DE L'IMAGE EN NIVEAU DE GRIS
                 JSR   ALERTFIN         ; ON VIRE LA FENETRE
                 JSR   SELAFFI          ; AFFICHAGE DE L'IMAGE EN NIVEAUX DE GRIS
                 JSR   INITNEWZONE      ; INITIALISATIONS NOUVELLE ZONE
                 LDA   #$0004           ; IMAGE SELECT AREA A REAFFICHER
                 JMP   PICT00

ECR0408          LDX   SECR2+1          ; SELECT : VIEW
                 LDA   #ECR04080
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR04080         LDA   ECR04083
                 BEQ   ECR04086         ; ON SORT, RIEN DE SELECTIONNE
                 JSR   DESS1
                 JSR   SELAFFA          ; AFFICHAGE AREA
                 LDA   #$0004
                 JMP   PICT00           ; IMAGE SELECT AREA A REAFFICHER
                 JMP   SOURIS1
ECR04086         LDA   #$0006           ; A T'ON CHARGE UNE IMAGE ?
                 STA   ALERTI
                 JSR   ALERT
                 LDA   #$0000           ; A T'ON CHOISIT UNE ZONE ?
                 STA   ALERTI
                 JSR   ALERT
                 JSR   ALERTFIN
                 JMP   SOURIS1
ECR04083         HEX   0000             ; FLAG A 1 SI UNE PORTION DEJA CHOISIE

ECR0409          LDX   SECR2+1          ; SELECT : EXIT
                 LDA   #ECR04090
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR04090         LDA   #$0001           ; IMAGE MAIN
                 JMP   PICT

ECR0410          LDA   #ECR04101        ; SELECT : SURFACE H.S
                 STA   SURFACE5+1
                 JMP   SURFACE
ECR04101         JSR   DESS1            ; TRAITEMENT
                 LDA   #$7BA2
                 LDY   OHS              ; MAX
                 JSR   SAISIEHVVAL
                 BNE   ECR04102
                 LDA   PRHS
ECR04102         STA   PRHS
                 LDX   CLNSELE
                 CPX   #$0004
                 BNE   ECR04105
                 STA   RHS
ECR04105         JSR   ECR04061         ; AFFICHAGE CHIFFRE
                 JSR   ECR04103         ; NETTOY LECTURE SOURIS
                 JSR   SAUV
                 JMP   SOURIS1

ECR04103         LDAL  $00C026          ; LECTURE SOURIS
                 BPL   ECR04103
                 AND   #$0100
                 BEQ   ECR04104
                 LDAL  $00C024
                 BRA   ECR04103
ECR04104         LDAL  $00C023
                 LDAL  $00C023
                 BPL   ECR04103
                 STZ   BOUT
                 STAL  $00C010
                 RTS

ECR0411          LDA   #ECR04111        ; SELECT : SURFACE V.S
                 STA   SURFACE5+1
                 JMP   SURFACE
ECR04111         JSR   DESS1            ; TRAITEMENT
                 LDA   #$8322
                 LDY   OVS              ; MAX
                 JSR   SAISIEHVVAL
                 BNE   ECR04112
                 LDA   PRVS
ECR04112         STA   PRVS
                 LDX   CLNSELE
                 CPX   #$0004
                 BNE   ECR04113
                 STA   RVS
ECR04113         JSR   ECR04061         ; AFFICHAGE CHIFFRE
                 JSR   ECR04103         ; NETTOY LECTURE SOURIS
                 JSR   SAUV
                 JMP   SOURIS1

****************  CONVERSION EN NIVEAU DE GRIS ET REDUCTION  ***********************

SELCONV          LDA   SELCONVF         ; FLAG PERMETTANT DE NE PAS RECONVERTIR LA PALETTE
                 BNE   SELREMP          ; DEJA TRANSFORMEE, ON NE S'OCCUPE QUE DE LA TABLE

                 LDX   #$01FE           ; PALETTE EN NIVEAU DE GRIS
SELCONV0         LDA   STATCOL1,X
                 AND   #$0F00
                 XBA
                 STA   SELCONV1+1       ; R
                 LDA   STATCOL1,X
                 AND   #$00F0
                 LSR                    ; V
                 LSR
                 LSR
                 LSR
                 CLC
SELCONV1         ADC   #$FFFF           ; R+V
                 STA   SELCONV2+1
                 LDA   STATCOL1,X
                 AND   #$000F           ; B
                 CLC
SELCONV2         ADC   #$FFFF           ; R+V+B
                 ASL
                 TAY
                 LDA   SELGRIS2,Y       ; /3
                 ASL
                 TAY
                 LDA   SELGRIS1,Y
                 STA   SELPALNB,X
                 DEX
                 DEX
                 BPL   SELCONV0

                 LDA   #$0001
                 STA   SELCONVF         ; FLAG A 1

******* REMPLISSAGE DES POURCENTAGES : SELETAB

SELREMP          LDA   RVS              ; INIT THERMO
                 DEC
                 STA   WORK01+1
                 LSR
                 LSR
                 LSR                    ; /16
                 LSR
                 STA   WORK02+1
                 STZ   SELDIFFH         ; NB DE POINTS A SORTIR : ZERO PAR DEFAUT
                 STZ   SELDIFFV
                 LDA   CLNSELE          ; SELECTION POUR SAVOIR DANS QUEL MODE ON EST
                 CMP   #$0002           ; POURCENTAGE
                 BEQ   SELREMPP
                 JSR   SELDICOH         ; RECHERCHE DICHOTOMIQUE DU % HORIZONTAL
                 BRA   SELREMPP1        ; SELETAB EST DEJA REMPLIE


SELREMPP         LDA   PRHR             ; POURCENTAGE HORIZONTAL
                 STA   SELPOUR
                 JSR   SELPOU           ; REMPLISSAGE SELETAB

SELREMPP1        LDA   RHS              ; TAILLE REDUITE HORIZONTALE
                 CLC
                 ADC   SELDIFFH
                 ASL
                 STA   SELREMP3+1       ; CONDITION D'ARRET
                 STZ   SELREMP2+1

                 LDX   #$0000           ; REMPLISSAGE SELHORT
SELREMP0         LDY   #$0000           ; X:INDICE DE SELHORT, Y INDICE DE SELETAB
SELREMP1         LDA   SELETAB,Y
                 BEQ   SELREMP4         ; ON TOMBE SUR UN ZERO, FIN DU TALEAU
                 DEC                    ; ON COMMENCE A PARTIR DE 0, DANS LE TABLEAU A 1
                 CLC
SELREMP2         ADC   #$0000
                 STA   SELHORT,X
                 INY
                 INY
                 INX
                 INX
SELREMP3         CPX   #$0000           ; NB DE POINT DE L'IMAGE *2-2
                 BNE   SELREMP1
                 BRA   SELREMP5         ; ON SORT

SELREMP4         LDA   SELREMP2+1
                 CLC
                 ADC   #$0064           ; 100
                 STA   SELREMP2+1
                 BRA   SELREMP0

****

SELREMP5         JSR   WORKING7         ; THERMO
                 LDA   CLNSELE          ; SELECTION POUR SAVOIR DANS QUEL MODE ON EST
                 CMP   #$0002
                 BEQ   SELREMPO         ; POURCENTAGE
                 JSR   SELDICOV         ; RECHERCHE DICHOTOMIQUE DU % VERTICAL
                 BRA   SELREMPO1        ; SELETAB EST DEJA REMPLIE


SELREMPO         LDA   PRVR             ; POURCENTAGE VERTICAL
                 STA   SELPOUR
                 JSR   SELPOU           ; REMPLISSAGE SELETAB

SELREMPO1        LDA   RVS              ; TAILLE REDUITE HORIZONTALE
                 CLC
                 ADC   SELDIFFV
                 ASL
                 STA   SELREMP9+1       ; CONDITION D'ARRET
                 STZ   SELREMP8+1       ; INIT

                 LDX   #$0000           ; REMPLISSAGE SELVERT
SELREMP6         LDY   #$0000           ; X:INDICE DE SELVERT, Y INDICE DE SELETAB
SELREMP7         LDA   SELETAB,Y
                 BEQ   SELREMP10        ; ON TOMBE SUR UN ZERO, FIN DU TALEAU
                 DEC                    ; ON COMMENCE A PARTIR DE 0, DANS LE TABLEAU A 1
                 CLC
SELREMP8         ADC   #$0000
                 STA   SELVERT,X
                 INY
                 INY
                 INX
                 INX
SELREMP9         CPX   #$0000           ; NB DE POINT DE L'IMAGE *2-2
                 BNE   SELREMP7
                 BRA   SELREMP11        ; ON SORT

SELREMP10        LDA   SELREMP8+1
                 CLC
                 ADC   #$0064           ; 100
                 STA   SELREMP8+1
                 BRA   SELREMP6

***********

SELREMP11        JSR   WORKING7         ; THERMO
                 LDA   RHS              ; ON VIRE LES POINTS INDESIRABLES
                 CLC
                 ADC   SELDIFFH
                 ASL
                 STA   SELREMP15+1      ; DERNIER POINT DE SELHORT
                 LDA   SELDIFFH
                 BEQ   SELREMP12        ; AUCUN POINT A SORTIR EN HORIZONTAL
                 LSR
                 ASL                    ; ELIMINE LES PROBLEMES DE NB DE POINTS PAIR/IMPAIR
                 TAX                    ; X OBLIGATOIREMENT PAIR
                 LDY   #$0000
SELREMP14        LDA   SELHORT,X
                 STA   SELHORT,Y
                 INX
                 INX
                 INY
                 INY
SELREMP15        CPX   #$0000           ; (RHS+DIFF)*2
                 BNE   SELREMP14

SELREMP12        JSR   WORKING7         ; THERMO
                 LDA   RVS
                 CLC
                 ADC   SELDIFFV
                 ASL
                 STA   SELREMP17+1
                 LDA   SELDIFFV
                 BEQ   SELREMP13        ; AUCUN POINT A SORTIR EN VERTICAL
                 LSR
                 ASL                    ; ELIMINE LES PROBLEMES DE NB DE POINTS PAIR/IMPAIR
                 TAX
                 LDY   #$0000
SELREMP16        LDA   SELVERT,X
                 STA   SELVERT,Y
                 INX
                 INX
                 INY
                 INY
SELREMP17        CPX   #$0000           ; (RVS+DIFF)*2
                 BNE   SELREMP16

***********

SELREMP13        JSR   WORKING7         ; THERMO
                 LDA   #$0003
                 STA   SELNIND          ; TRANSFORMATION DES POINTS EN NIVEAU DE GRIS
                 STZ   SELCIND          ; INDICES DES TABLES D'ADRESSE
                 STZ   SELVIND
                 STZ   SELHIND          ; INDICES DES TABLES DES NUMEROS DE COLONNES/LIGNES

                 LDA   RHS              ; CONDITION D'ARRET : NB COLONNES REDUCED
                 STA   SELCONV7+1
                 STA   SELCONV17+1
                 LSR
                 INC                    ; AU CAS OU NB IMPER...
                 STA   SELCONV8+1       ; NB OCTETS OCCUPEE PAR UNE LIGNE

                 STZ   SELCOMPT
                 LDA   RVS              ; CONDITION D'ARRET : NB LIGNES REDUCED
                 PHA

                 STZ   SELCONV6+1       ; INITIALISATION ADRESSE BASSE DU DEBUT DES POINTS GRIS
                 STZ   SELNBT
                 LDA   $0110            ; DEBUT DE LA ZONE GRISE
                 AND   #$FF00
                 STA   SELCONV6+2       ; INITIALISATION ADRESSE HAUTE
                 STA   SELNBT+1
                 LDA   #$0112
                 STA   SELCONV5+1       ; INIT


SELCONV20        LDX   SELVIND          ; ON VA CHOISIR LA BONNE LIGNE
                 LDA   SELVERT,X        ; NUMERO DE LA LIGNE
                 ASL
                 CLC                    ; *3
                 ADC   SELVERT,X
                 TAX                    ; TRAITEMENT DE L'ADRESSE SOURCE : POINTS COULEURS
                 LDA   SELCOLT,X        ; POSITIONNE LE DEBUT DE LIGNE
                 STA   SELCONV3+1       ; ADRESSE BASSE
                 STA   SELCONV30+1
                 INX
                 LDA   SELCOLT,X
                 STA   SELCONV3+2       ; ADRESSE HAUTE
                 STA   SELCONV30+2
                 INC   SELVIND
                 INC   SELVIND          ; ON POINTE SUR LA PROCHAINE LIGNE


SELCONV22        LDX   SELHIND          ; ON VA CHOISIR LES BONNES COLONNES
                 LDA   SELHORT,X
                 TAX
SELCONV3         LDAL  $0AA000,X        ; PREND LE POINT COULEUR CORESPONDANT A CETTE COLONNE
                 AND   #$00FF           ; ON NE PREND QU'UN POINT
                 ASL
                 TAY
                 LDA   SELPALNB,Y       ; NIVEAU DE GRIS CORRESPONDANT A CE POINT
                 AND   #$00F0
                 STA   SELCONV4+1       ; 1er POINT CHOISIT
                 LDA   SELCOMPT         ; CONDITION D'ARRET N[1
                 INC
                 STA   SELCOMPT
SELCONV17        CMP   #$0500           ; NB DE COLONNE DANS REDUCED : CONDITION DE FIN DE LIGNE
                 BNE   SELCONV18
                 DEC   SELCOMPT         ; ON SORTIRA AU PROCHAIN TEST
                 LDA   #$0000
                 BRA   SELCONV31        ; NOMBRE DE POINTS IMPER, ON MET UN ZERO A LA FIN
SELCONV18        LDX   SELHIND          ; ON CONTINUE ...
                 INX
                 INX                    ; PROCHAINE COLONNE CHOISIT
                 STX   SELHIND          ; ON CHOISIT UN DEUXIEME POINT (IMPLIQUE IMPAIR)
                 LDA   SELHORT,X
                 TAX
SELCONV30        LDAL  $0AA000,X        ; PREND LE POINT COULEUR CORRESPONDANT A CETTE COLONNE
                 AND   #$00FF           ; ON NE PREND QU'UN POINT
                 ASL
                 TAY
                 LDA   SELPALNB,Y       ; NIVEAU DE GRIS CORRESPONDANT A CE POINT
                 AND   #$000F           ; 2eme POINT CHOISIT
SELCONV31        CLC
SELCONV4         ADC   #$00F0           ; ON A GROUPE LES DEUX POINTS EN 1 OCTET
SELCONV6         STAL  $100A00          ; REMPLIT LES LIGNES EN GRIS : BANC 10/0000
                 INC   SELCONV6+1       ; POINTE SUR LA PROCHAINE CASE
                 INC   SELHIND
                 INC   SELHIND          ; PROCHAINE COLONNE CHOISIT
                 LDA   SELCOMPT         ; CONDITION D'ARRET N[2
                 INC
                 STA   SELCOMPT
SELCONV7         CMP   #$0500           ; NB DE COLONNE DANS REDUCED : CONDITION DE FIN DE LIGNE
                 BNE   SELCONV22

*************

                 LDA   SELCONV6+1       ; CHANGEMENT DE BANC MEMOIRE POUR LES LIGNES GRISES ?
                 CLC
SELCONV8         ADC   #$FFFF           ; LONGUEUR LIGNE
                 BCC   SELCONV9
                 STZ   SELCONV6+1       ; ON SAUTE DE BANC
SELCONV5         LDA   $0112
                 AND   #$FF00
                 STA   SELCONV6+2
                 INC   SELCONV5+1
                 INC   SELCONV5+1

SELCONV9         LDY   SELNIND          ; TRAITEMENT DE L'ADRESSE DESTINATION : POINTS GRIS
                 LDA   SELCONV6+1
                 STA   SELNBT,Y         ; ADRESSE BASSE
                 INY
                 LDA   SELCONV6+2
                 STA   SELNBT,Y         ; ADRESSE HAUTE
                 INY
                 INY
                 STY   SELNIND          ; INDICE DE LA TABLE DES ADRESSES LIGNES GRISES

                 PLA                    ; CONDITION D'ARRET POUR LES LIGNES
                 DEC
                 PHA
WORK01           CMP   #$0000
                 BNE   WORK03
                 SEC
WORK02           SBC   #$0000
                 STA   WORK01+1
                 JSR   WORKING7         ; THERMO
WORK03           PLA
                 BEQ   SELCONV10        ; FIN
                 PHA
                 STZ   SELCOMPT         ; CONDITION D'ARRET
                 STZ   SELHIND          ; NOUVELLE LIGNE : POINTEUR DE COLONNE A ZERO
                 JMP   SELCONV20
SELCONV10        RTS                    ; TABLE DES ADRESSES POINTS GRIS REMPLIE...

SELCONVF         HEX   0000             ; SELCONV FLAG (A 1 SI DEJA CONVERTIT)
SELCOMPT         HEX   0000             ; COMPTEUR
SELCOMPT2        HEX   0000             ; COMPTEUR
SELDIFFH         HEX   0000             ; NB DE POINTS A SORTIR EN HORI
SELDIFFV         HEX   0000             ; NB DE POINTS A SORTIE EN VERT

SELPALNB         DS    256*2

SELGRIS1         HEX   0000,1101,2202,3303,4404,5505,6606,7707,8808,9909,AA0A,BB0B,CC0C,DD0D,EE0E,FF0F
SELGRIS2         HEX   0000,0000,0100,0100,0100,0200,0200,0200,0300,0300,0300,0400,0400,0400,0500,0500,0500
                 HEX   0600,0600,0600,0700,0700,0700,0800,0800,0800,0900,0900,0900,0A00,0A00,0A00,0B00,0B00,0B00
                 HEX   0C00,0C00,0C00,0D00,0D00,0D00,0E00,0E00,0E00,0F00,0F00
SELGRIS3         HEX   0000,1111,2222,3333,4444,5555,6666,7777,8888,9999,AAAA,BBBB,CCCC,DDDD,EEEE,FFFF

**********************  AFFICHAGE DE L'IMAGE GRISE  *************************

SELAFFI          LDA   #$F0F0
                 LDX   #$1FFE
SELAFFI5         STAL  $012000,X        ; NETTOY LA PAGE GRAPHIQUE EN NOIR/BLANC
                 STAL  $014000,X        ; RAPIDEMENT
                 STAL  $016000,X
                 STAL  $017D00,X
                 DEX
                 DEX
                 BPL   SELAFFI5
                 LDA   #$0000
                 LDX   #$02FE
SELAFFI50        STAL  $019D00,X        ; SCB ET PALETTE A ZERO
                 DEX
                 DEX
                 BPL   SELAFFI50
                 LDX   #$001E
SELAFFI6         LDA   SELAFFP,X        ; PALETTE DE GRIS
                 STAL  $019E00,X
                 DEX
                 DEX
                 BPL   SELAFFI6

                 LDA   #$009F           ; ** 320 POINTS PAR LIGNE POUR L'AFFICHAGE
                 STA   SELAFFI20+1
                 LDA   #$00C8
                 STA   SELAFFI40+1
                 STZ   SELAFFIL         ; LIGNE ET COLONNE A ZERO A L'AFFICHAGE
                 STZ   SELAFFIC
                 LDA   RHS              ; TAILLE REDUITE : NB COLONNE
                 LSR                    ; IMPAIRE ?
                 BCC   SELAFFI60
                 INC                    ; AFFICHE UNE COLONNE DE PLUS (COMBLEE AVEC UN ZERO)
SELAFFI60        CMP   #$00A0
                 BPL   SELAFFI61        ; L'IMAGE EST PLUS PETITE QUE L'ECRAN
                 DEC
                 STA   SELAFFI20+1      ; NB DE COLONNES A AFFICHER (INFERIEUR A 320/2)
                 LDA   #$0001
                 STA   SELAFFCM
                 BRA   SELAFFI62
SELAFFI61        SEC
                 SBC   #$009F           ; 159
                 STA   SELAFFCM         ; COLONNE MAXI
SELAFFI62        LDA   RVS              ; TAILLE REDUITE : NOMBRE DE LIGNES
                 CMP   #$00C8
                 BPL   SELAFFI63
                 STA   SELAFFI40+1      ; NB DE LIGNES A AFFICHER CAR L'IMAGE EST PLUS PETITE
                 LDA   #$0001           ; L'IMAGE EST PLUS PETITE QUE L'ECRAN
                 STA   SELAFFLM
                 BRA   SELAFFI0
SELAFFI63        SEC
                 SBC   #$00C7           ; 199
                 STA   SELAFFLM         ; LIGNE MAXI

SELAFFI0         LDY   #$0000           ; CONDITION D'ARRET (200 LIGNES OU MOINS)
                 LDA   #$2000
                 STA   SELAFFI4+1       ; INIT ADRESSE PAGE GRAPHIQUE
                 LDA   SELAFFIL
                 STA   SELAFILI         ; LIGNE -> INDICE LIGNE (A ZERO AU DEBUT)

                 LDA   SELAFFIC         ; NUMERO DE LA COLONNE (0-639)/2
                 STA   SELAFFI2+1
SELAFFI3         LDA   SELAFILI         ; NUMERO DE LA LIGNE (0-479)
                 ASL
                 CLC
                 ADC   SELAFILI         ; SELAFFIL*3
                 TAX
                 INX
                 LDA   SELNBT,X         ; ADRESSE HAUTE DU DEBUT DE LA LIGNE
                 XBA
                 AND   #$00FF
                 ORA   #$4B00           ; PHK
                 STA   SELAFFI21+2
                 DEX
                 LDA   SELNBT,X         ; ADRESSE BASSE DU DEBUT DE LA LIGNE
                 CLC
SELAFFI2         ADC   #$FFFF           ; COLONNE
                 STA   SELAFFI1+1       ; ADRESSE BASSE
                 PHY                    ; SAUVEGARDE DE Y

SELAFFI1         LDX   #$A000           ; ADRESSE BASSE SOURCE
SELAFFI4         LDY   #$2000           ; ADRESSE BASSE DESTINATION
SELAFFI20        LDA   #$009F           ; NB D'OCTETS A DEPLACER-1
SELAFFI21        MVN   $0B0000,$010000  ; ADRESSE SOURCE, ADRESSE DESTINATION
                 PHK
                 PLB                    ; RESTAURE, PERTURBE PAR LE MVN

                 PLY                    ; RECUPERE Y
                 LDA   SELAFFI4+1
                 CLC                    ; LIGNE+1
                 ADC   #$00A0
                 STA   SELAFFI4+1
                 INC   SELAFILI         ; LIGNE SUIVANTE : INDICE +1
                 INY
SELAFFI40        CPY   #$00C8           ; 200 : NOMBRE DE LIGNES A AFFICHER
                 BNE   SELAFFI3


SELAFFI7         JSR   SLECTA           ; LECTURE SOURIS POUR LE DEPLACEMENT DE L'IMAGE
                 LDA   BOUT             ; BOUTON ENFONCE ?
                 BNE   SELAFFI72
                 JMP   SELAFFI8

SELAFFI72        LDAL  $00C026          ; ATTEND QUE LE BOUTON SOIT RELACHE
                 BPL   SELAFFI72
                 AND   #$0100
                 BEQ   SELAFFI73
                 LDAL  $00C024
                 BRA   SELAFFI72
SELAFFI73        LDAL  $00C023
                 LDAL  $00C023
                 BPL   SELAFFI72
                 JSR   PLEASE           ; AFFICHAGE PLEASE WAIT
                 STZ   BOUT
*********

                 LDX   #$7CFE           ; ON SAUVE L'IMAGE NIVEAU DE GRIS
                 LDA   SELPALNB         ; TEINTE GRISE CORRESPONDANTE A LA COUL 0
                 AND   #$000F
                 ASL
                 TAY
                 LDA   SELGRIS3,Y
SELAFFI70        STAL  $210000,X        ; NETTOYAGE
                 DEX
                 DEX
                 BPL   SELAFFI70

                 LDA   SELAFFI71+2
                 AND   #$FF00
                 ORA   #$007D
                 STA   SELAFFI710+2
                 LDX   #$02FE
                 LDA   #$0000
SELAFFI710       STAL  $217D00,X        ; SCB
                 DEX
                 DEX
                 BPL   SELAFFI710

                 LDX   #$001E
SELAFFI7100      LDA   SELGRIS1,X
SELAFFI71        STAL  $217E00,X        ; PALETTE
                 DEX
                 DEX
                 BPL   SELAFFI7100

                 LDY   #$0000
                 LDA   #$00C8           ; 200 LIGNES
                 STA   SELAFFIBLCK4+1
                 LDA   RVS
                 CMP   #$00C8
                 BPL   SELAFFIBLCK5
                 STA   SELAFFIBLCK4+1
SELAFFIBLCK5     LDA   #$00A0           ; 320 POINTS
                 STA   SELAFFIBLCK1+1
                 LDA   RHS
                 CMP   #$0140
                 BPL   SELAFFIBLCK0
                 INC
                 LSR
                 STA   SELAFFIBLCK1+1

SELAFFIBLCK0     TYA
                 ASL
                 TAX
                 LDA   TABLE,X
                 STA   SELAFFIBLCK3+1
                 STA   SELAFFIBLCK6+1
                 CLC
                 ADC   #$2000
                 STA   SELAFFIBLCK2+1

                 LDX   #$0000           ; RECOPIE 1 LIGNE
SELAFFIBLCK2     LDAL  $012000,X
                 AND   #$00FF
                 STA   SELAFFIBLCK7+1
SELAFFIBLCK3     LDAL  $21A0A0,X        ; AU DEBUT DE LA ZONE DES POINTS GRIS
                 AND   #$FF00
SELAFFIBLCK7     ORA   #$00FF
SELAFFIBLCK6     STAL  $21A0A0,X
                 INX
SELAFFIBLCK1     CPX   #$A0A0
                 BNE   SELAFFIBLCK2

                 INY
SELAFFIBLCK4     CPY   #$A0A0           ; RVS OU 200
                 BNE   SELAFFIBLCK0

***********

SELAFFI705       LDX   #$0000           ; NETTOYAGE DU BANC $09
                 LDA   #$0000
SELAFFI703       STAL  $200000,X
                 INX
                 INX
                 CPX   #$FA00
                 BNE   SELAFFI703

                 LDA   RVS              ; NOMBRE DE LIGNE A TRAITEE : CONDITION D'ARRET
                 CMP   #$00C8           ; 200
                 BMI   SELAFFI700
                 LDA   #$00C8
SELAFFI700       STA   SELAFFI79+1
                 LDA   RHS              ; NOMBRE DE COLONNE A TRAITER : CONDITION D'ARRET
                 CMP   #$0140           ; 320
                 BPL   SELAFFI701
                 LDA   #$0140           ; DES POINTS EN MOINS
                 SEC
                 SBC   RHS
                 STA   SELAFFI780+1     ; ON RATTRAPE LE DEBUT DE LA LIGNE SUIVANTE
                 LDA   RHS
                 BRA   SELAFFI704
SELAFFI701       STZ   SELAFFI780+1     ; RIEN A AJOUTER
                 LDA   #$0140
SELAFFI704       ASL
                 STA   SELAFFI702+1
                 STZ   SELAFFI77+1      ; TRANSFERT DES OCTETS CORRESPONDANT A L'IMAGE AFFICHEE
                 LDA   SELAFFIC         ; COLONNES RESTE CONSTANTE
                 ASL
                 ASL
                 STA   SELCOMPT2        ; 1ere COLONNE CONCERNEE
                 CLC
SELAFFI702       ADC   #$0280           ; 320 OCTETS A DEPLACER
                 STA   SELAFFI78+1      ; NOMBRE DE LIGNE A TRAITEE
                 LDA   SELAFFIL         ; INIT
                 ASL
                 STA   SELCOMPT         ; 1ere LIGNE CONCERNEE

                 LDY   #$0000           ; ON CHOISIT LA LIGNE A RECOPIER
SELAFFI74        LDX   SELCOMPT         ; LIGNES
                 LDA   SELVERT,X
                 ASL
                 CLC
                 ADC   SELVERT,X        ; *3
                 TAX
                 LDA   SELCOLT,X        ; ADRESSE BASSE
                 STA   SELAFFI76+1
                 INX
                 LDA   SELCOLT,X        ; ADRESSE HAUTE
                 STA   SELAFFI76+2
                 PHY                    ; SAUVEGARDE DE Y

                 LDY   SELCOMPT2        ; ON RECOPIE UNE LIGNE VERS LE BANC $0C, ON NE PREND QUE LES COLONNES RETENUES
SELAFFI75        LDA   SELHORT,Y
                 TAX
SELAFFI76        LDAL  $0EA0A0,X        ; POINT COULEUR SOURCE
                 AND   #$00FF           ; ON NE RECOPIE QU'UN SEUL POINT, LE SUIVANT EST FORCE A ZERO
SELAFFI77        STAL  $20A0A0          ; DESTINATION : BANC $09
                 INC   SELAFFI77+1
                 INY
                 INY
SELAFFI78        CPY   #$0000           ; 320 OCTETS PAR LIGNES
                 BNE   SELAFFI75
                 LDA   SELAFFI77+1      ; CAS OU IL Y A MOINS DE 320 OCTETS/LIGNES
                 CLC
SELAFFI780       ADC   #$0000
                 STA   SELAFFI77+1

                 PLY                    ; RECUPERATION DE Y
                 INC   SELCOMPT
                 INC   SELCOMPT         ; LIGNE SUIVANTE...
                 INY
SELAFFI79        CPY   #$00C8           ; 200 LIGNES A RECOPIER (OU MOINS...)
                 BNE   SELAFFI74
                 LDA   #$0001
                 STA   ECR04083         ; FLAG A 1
                 LDA   NOWINDOWFLAG
                 BNE   SELAFFI790
                 STAL  $00C010          ; ANNULE D'EVENTUELLE FRAPPE
                 JSR   PLEASEF          ; ON VIRE LE MESSAGE
SELAFFI790       RTS                    ; ON SORT
****

SELAFFI8         LDA   NEX              ; DELTA X <-> COLONNE
                 BNE   SELAFFI81        ; DEL X < 0
                 LDA   SELAFFIC         ; DELTA X > 0
                 SEC
                 SBC   DELX+1
                 BCS   SELAFFI80        ; DELX < SELAFFIC
                 LDA   #$0000
SELAFFI80        STA   SELAFFIC
                 BRA   SELAFFI9
SELAFFI81        LDA   SELAFFIC         ; DELTA X < 0
                 CLC
                 ADC   DELX+1
                 CMP   SELAFFCM         ; VALEUR MAXIMALE JAMAIS ATTEINTE DE COLONNE...
                 BMI   SELAFFI82
                 LDA   SELAFFCM
                 DEC
SELAFFI82        STA   SELAFFIC

SELAFFI9         LDA   NEY              ; DELTA Y <-> LIGNE
                 BNE   SELAFFI91        ; DEL Y < 0
                 LDA   SELAFFIL         ; DELTA Y > 0
                 SEC
                 SBC   DELY+1
                 BCS   SELAFFI90        ; DELY < SELAFFIL
                 LDA   #$0000
SELAFFI90        BRA   SELAFFI92
SELAFFI91        LDA   SELAFFIL         ; DELTA Y < 0
                 CLC
                 ADC   DELY+1
                 CMP   SELAFFLM         ; VALEUR MAXIMALE JAMAIS ATTEINTE DE LIGNE...
                 BMI   SELAFFI92
                 LDA   SELAFFLM
                 DEC
SELAFFI92        STA   SELAFFIL
                 JMP   SELAFFI0

SELAFFLM         HEX   0000             ; HAUTEUR MAXIMALE
SELAFFCM         HEX   0000             ; LARGEUR MAXIMALE
SELAFILI         HEX   0000             ; INDICE DE LA LIGNE BALAYEE
SELAFFIL         HEX   0000             ; NUMERO DE LA LIGNE (0-1279)
SELAFFIC         HEX   0000             ; NUMERO DE LA COLONNE (/2) (0-767)

SELAFFP          HEX   0000,1101,2202,3303,4404,5505,6606,7707,8808,9909,AA0A,BB0B,CC0C,DD0D,EE0E,FF0F

*************************  AFFICHAGE AREA  **********************************

SELAFFA          LDX   #$7FFE           ; ADRESSE DEBUT ZONE POINT GRIS
SELAFFA1         LDAL  $210000,X        ; AFFICHAGE AREA SELECTED
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   SELAFFA1

                 JSR   SBOUT            ; ON ATTEND UN CLICK POUR SORTIR
                 STAL  $00C010          ; ANNULE TOUTE TOUCHE FRAPPEE PENDANT L'AFFICHAGE
                 RTS

**********************  REDUCTION / POURCENTAGE  ****************************

REDUCEH          LDA   PRHR
                 STA   REDPRR           ; % DE REDUC
                 LDA   OHS
                 STA   REDOS            ; TAILLE ORIGINALE
                 JSR   REDUCE
                 LDA   REDRS
                 STA   RHS              ; TAILLE REDUITE
                 RTS

REDUCEV          LDA   PRVR
                 STA   REDPRR           ; % DE REDUC
                 LDA   OVS
                 STA   REDOS            ; TAILLE ORIGINALE
                 JSR   REDUCE
                 LDA   REDRS
                 STA   RVS              ; TAILLE REDUITE
                 RTS

*************

REDUCE           STZ   REDSULT1         ; INIT
                 STZ   REDSULT2

                 LDX   REDPRR           ; TRANSFORMATION DES % EN TAILLE FINALE
                 LDA   REDSULT2
REDUCE1          CLC
REDUCE2          ADC   REDOS            ; TAILLE ORIGINALE
                 BCC   REDUCE3
                 INC   REDSULT1
REDUCE3          DEX                    ; MULTIPLICATION SUR 32 BIT !
                 BNE   REDUCE1
                 STA   REDSULT2         ; SAUVEGARDE EN SORTIE

                 LDX   #$0000           ; DIVISION PAR 100
                 STX   REDRS
                 LDA   REDSULT1         ; ON ELIMINE LES CENTAINES DE MILLIERS
                 BEQ   REDUCE4
                 LDX   #$028F           ; 655
                 STX   REDRS
                 LDA   REDSULT2
                 CLC
                 ADC   #$0024           ; 36
                 STA   REDSULT2

REDUCE4          LDX   #$0000
                 LDA   REDSULT2         ; ON ELIMINE LES DIZAINES DE MILLIERS
REDUCE5          SEC
                 SBC   #$2710           ; 10.000
                 BCC   REDUCE6          ; ON SORT
                 STA   REDSULT2
                 INX
                 BRA   REDUCE5

REDUCE6          TXA
                 ASL
                 TAX
                 LDA   REDTAB1,X        ; MULTIPLE DE 100
                 CLC
                 ADC   REDRS
                 STA   REDRS            ;
                 LDX   #$0000
                 LDA   REDSULT2         ; ON ELIMINE LES MILLIERS
REDUCE7          SEC
                 SBC   #$03E8           ; 1000
                 BCC   REDUCE8          ; ON SORT
                 STA   REDSULT2
                 INX
                 BRA   REDUCE7

REDUCE8          TXA
                 ASL
                 TAX
                 LDA   REDTAB2,X        ; MULTIPLE DE 10
                 CLC
                 ADC   REDRS
                 STA   REDRS
                 LDX   #$0000
                 LDA   REDSULT2         ; ON ELIMINE LES CENTAINES
REDUCE10         SEC
                 SBC   #$0064           ; 100
                 BCC   REDUCE11         ; DEPASSEMENT
                 STA   REDSULT2
                 INX
                 BRA   REDUCE10

REDUCE11         TXA
                 CLC
                 ADC   REDRS
                 STA   REDRS            ; TAILLE REDUITE
                 RTS

REDSULT1         HEX   0000             ; VALEUR HAUTE
REDSULT2         HEX   0000             ; VALEUR BASSE
REDPRR           HEX   0000             ; POURCENTAGE DE REDUCTION
REDOS            HEX   0000             ; ORIGINAL SIZE
REDRS            HEX   0000             ; REDUCED SIZE
REDTAB1          HEX   0000,6400,C800,2C01,9001,F401,5802,BC02,2003,8403
REDTAB2          HEX   0000,0A00,1400,1E00,2800,3200,3C00,4600,5000,5A00

*********  RECHERCHE DICHOTOMIQUE POUR TROUVER LE %  *********************

SELDICOH         LDA   OHS              ; RECHERCHE DICHO HORIZONTALE
                 STA   REDOS            ; TAILLE ORIGINALE
                 LDA   RHS
                 STA   SELDICHR         ; TAILLE REDUITE
                 JSR   SELDICO
                 LDA   SELEDIFF         ; NB DE POINTS A ENLEVER
                 STA   SELDIFFH
                 LDA   REDPRR           ; POURCENTAGE TROUVE
                 STA   SELDICHP
                 RTS
SELDICOV         LDA   OVS              ; RECHERCHE DICHO VERTICALE
                 STA   REDOS            ; TAILLE ORIGINALE
                 LDA   RVS
                 STA   SELDICHR         ; TAILLE REDUITE
                 JSR   SELDICO
                 LDA   SELEDIFF         ; NB DE POINTS A ENLEVER
                 STA   SELDIFFV
                 LDA   REDPRR           ; POURCENTAGE TROUVE
                 STA   SELDICHP
                 RTS

************

SELDICO          LDA   #$0064           ; RECHERCHE DICHOTOMIQUE POUR TROUVER LE % LE PLUS PRES
                 STA   SELDICH2         ; INIT
                 LDA   #$0001
                 STA   SELDICH1
                 STZ   SELEDIFF         ; 0 POINTS A ENLEVER

SELDIC1          LDA   SELDICH2         ; 100%
                 CMP   SELDICH1
                 BEQ   SELDIC3          ; ON A PAS TROUVE : ON SORT
                 CLC
                 ADC   SELDICH1
                 LSR                    ; MAX+MIN/2
                 STA   REDPRR
                 JSR   REDUCE           ; CALCUL LA TAILLE REDUITE
                 LDA   REDRS
                 CMP   SELDICHR         ; TAILLE REDUITE (RHS ou RVS)
                 BEQ   SELDIC6          ; ON A TROUVE, ON TOMBE PILE DESSUS : ON SORT
                 BMI   SELDIC2
                 LDA   REDPRR           ; TROP GRAND
                 STA   SELDICH2
                 BRA   SELDIC1          ; ON RECOMMENCE
SELDIC2          LDA   REDPRR           ; TROP PETIT
                 INC
                 STA   SELDICH1
                 BRA   SELDIC1          ; ON RECOMMENCE

SELDIC3          LDA   SELDICH2         ; ON A TROUVE UN POURCENTAGE APPROXIMATIF
                 STA   REDPRR
                 JSR   REDUCE
                 LDA   REDRS
                 CMP   SELDICHR         ; TAILLE REDUITE
                 BPL   SELDIC4          ; ON A JUSTE LA TAILLE AU DESSUS
                 LDA   SELDICH2
                 INC                    ; AU PREND LE % JUSTE AU DESSUS
                 STA   REDPRR
                 JSR   REDUCE
                 LDA   REDRS
SELDIC4          SEC
                 SBC   SELDICHR         ; TAILLE REDUITE
                 STA   SELEDIFF         ; ON A xx POINTS A ENLEVER A L'HORIZONTALE
                 LDA   REDPRR
                 STA   SELPOUR
                 JSR   SELPOU           ; ON REMPLIT SELETAB
                 RTS

SELDIC6          LDA   REDPRR           ; ON A TROUVE LE % HORIZONTAL JUSTE
                 STA   SELPOUR
                 JSR   SELPOU           ; ON REMPLIT SELETAB
                 RTS

SELDICH1         HEX   0100             ; VALEUR BASSE
SELDICH2         HEX   6400             ; VALEUR HAUTE
SELDICHR         HEX   0000             ; TAILLE REDUITE (RHS ou VHS)
SELEDIFF         HEX   0000             ; NB DE POINTS A ENLEVER
SELDICHP         HEX   0000             ; POURCENTAGE EQUIVALENT

************  REMPLISSAGE TABLEAU DES POURCENTAGE  ***********************

SELPOU           LDA   #$0001           ; PREMIER POINT QUI MONTE
                 STA   SELETAB
                 LDA   #$0002           ; INDICE DU TABLEAU
                 STA   SELEIND

                 LDA   SELPOUR          ; INIT
                 DEC
                 STA   SELPOUOD         ; DY

                 LDA   #$0063
                 SEC
                 SBC   SELPOUOD         ; DX-DY
                 STA   SELPOU4+1

                 LDA   #$0063           ; DX=99
                 STA   SELPOUOF
                 LDX   #$0001           ; X=1
                 LDY   #$0001           ; Y=1

SELPOU1          CPX   #$0064           ; X = 100 ?
                 BNE   SELPOU2
                 CPY   SELPOUR
                 BNE   SELPOU2
                 LDA   #$0000           ; ON MET UN  ZERO A LA FIN
                 LDX   SELEIND
                 STA   SELETAB,X
                 RTS                    ; ON A FINI

SELPOU2          INX                    ; X=X+1
                 LDA   SELPOUOD
                 CMP   SELPOUOF         ; OF <= OD
                 BPL   SELPOU3

                 LDA   SELPOUOF         ; OF=OF-OD
                 SEC
                 SBC   SELPOUOD
                 STA   SELPOUOF
                 BRA   SELPOU1

SELPOU3          LDA   SELPOUOF
                 CLC
SELPOU4          ADC   #$0000           ; DX-DY
                 STA   SELPOUOF
                 INY
                 PHX                    ; SAUVEGARDE TEMPORAIRE DE X
                 TXA                    ; VALEUR DE X POUR LAQUELLE ON MONTE
                 LDX   SELEIND          ; ON REMPLIT LE TABLEAU
                 STA   SELETAB,X
                 INX
                 INX
                 STX   SELEIND
                 PLX                    ; RECUPERE X
                 BRA   SELPOU1

SELPOUR          HEX   0000             ; POURCENTAGE DESIRE
SELPOUOF         HEX   0000             ; OF
SELPOUOD         HEX   0000             ; OD=CSTE=DY

*********************  SAISIE DES CHIFFRES  ******************************

SAISIEHVVAL      SEI
                 STA   ADRE             ; ADRESSE AFFICHAGE
                 INY
                 STY   SAISIEHVVALMAX   ; VALEUR MAX
                 JSR   SAISIEHVNETTOY   ; EFFACE LA ZONE + TIRET ROUGE
                 STZ   SAISIEHVVALEUR
                 LDX   #$0000
SAISIEHV10       LDAL  $00BFFF          ; ON SAUTE LES 0 AU DEBUT
                 BPL   SAISIEHV10
                 STAL  $00C010
                 AND   #$FF00
                 CMP   #$8D00           ; RETURN
                 BEQ   SAISIEHVFIN
                 CMP   #$B100           ; 1
                 BMI   SAISIEHV10
                 CMP   #$BA00           ; :
                 BPL   SAISIEHV10
                 BRA   SAISIEHV12       ; ENFIN UN CHIFFRE 1-9
SAISIEHV11       LDAL  $00BFFF
                 BPL   SAISIEHV11
                 STAL  $00C010
                 AND   #$FF00
                 CMP   #$8D00           ; RETURN
                 BEQ   SAISIEHVFIN
                 CMP   #$B000           ; 0
                 BMI   SAISIEHV11
                 CMP   #$BA00           ; :
                 BPL   SAISIEHV11
SAISIEHV12       XBA
                 SEC
                 SBC   #$00B0           ; VALEUR 0 -> 9
                 PHA
                 JSR   SAISIEHV10FOIS
                 PLA
                 CLC
                 ADC   SAISIEHVVALEUR
                 STA   SAISIEHVVALEUR
                 JSR   SAISIEHVAFFICH   ; AFFICHAGE NOUVELLE VALEUR
                 INX
                 CPX   #$0004
                 BNE   SAISIEHV11
SAISIEHVFIN      JSR   SAISIEHVNETTOY2  ; ENLEVE TIRET ROUGE
                 LDA   SAISIEHVVALEUR   ; VERIFICATION COHERENCE VALEUR
                 CMP   SAISIEHVVALMAX
                 BPL   SAISIEHVFIN0
                 LDA   SAISIEHVVALEUR
                 CMP   #$0000
                 BMI   SAISIEHVFIN0
                 CLI
                 RTS

SAISIEHVFIN0     LDA   #$0000           ; ECHOUE
                 CLI
                 RTS

SAISIEHVNETTOY   LDY   #$0005           ; EFFACE ZONE
                 LDX   ADRE
SAISIEHVNETTOY1  LDA   #$0000
                 STAL  $010000,X
                 STAL  $010002,X
                 STAL  $010004,X
                 STAL  $010006,X
                 STAL  $010008,X
                 STAL  $01000A,X
                 STAL  $01000C,X
                 TXA
                 CLC
                 ADC   #$00A0
                 TAX
                 DEY
                 BPL   SAISIEHVNETTOY1
                 LDA   ADRE             ; TIRET ROUGE
                 CLC
                 ADC   #$0329
                 TAX
                 LDA   #$2202
                 STAL  $010000,X
                 INX
                 INX
                 LDA   #$2022
                 STAL  $010000,X
                 RTS
SAISIEHVNETTOY2  LDA   ADRE             ; ENLEVE LE TIRET
                 CLC
                 ADC   #$0329
                 TAX
                 LDA   #$0000
                 STAL  $010000,X
                 INX
                 INX
                 STAL  $010000,X
                 RTS

SAISIEHVAFFICH   LDA   SAISIEHVVALEUR
                 STA   VALH
                 PHX
                 PHY
                 JSR   TRANSA
                 PLY
                 PLX
                 RTS

SAISIEHV10FOIS   LDA   SAISIEHVVALEUR   ; *10
                 LDY   #$0008
SAISIEHV11FOIS   CLC
                 ADC   SAISIEHVVALEUR
                 DEY
                 BPL   SAISIEHV11FOIS
                 STA   SAISIEHVVALEUR
                 RTS

SAISIEHVVALEUR   HEX   0000
SAISIEHVVALMAX   HEX   0000

************************************************************************

