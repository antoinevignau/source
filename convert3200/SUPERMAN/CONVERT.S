*
* Convert 3200 (GS/OS)
*
* Module: Code
*
* (c) 1995, Brutal Deluxe
*

                org   $0000
                lst   off

                mx    %00

                use   4/Util.Macs
                use   4/Window.Macs

*---------------------------------------
* CONSTANTES
*---------------------------------------

goOPEN          =     0                 ; standard open
goSAVE          =     2                 ; standard save
goSELCOLT       =     4
goPALETTE       =     6
goWINDOW        =     8
goCONVERTALL    =     10                ; INIT/FIN
goCONVERTLOAD   =     12
goCONVERTSAVE   =     14
goSCB           =     16

*---------------------------------------
* POINT D'ENTREE INDISPENSABLE
*---------------------------------------

                ds    256
ADRBANCS        ds    256

                phk
                plb

                stx   goCOMMUNICATE1+2
                sty   goCOMMUNICATE1+1

                ldx   #goSELCOLT
                ldy   #SELCOLT
                jsr   goCOMMUNICATE

                ldx   #goPALETTE        ; PALETTE 4096 GS
                ldy   #STATCOL1
                jsr   goCOMMUNICATE

                ldx   #goWINDOW         ; ADRESSE ROUTINE FENETRE
                ldy   #PUTWINDOW
                jsr   goCOMMUNICATE

                ldx   #goSCB            ; RECUPERE SCB SI IMAGE GS 16/256
                ldy   #PICTURESCB256
                lda   #IMAGE256
                jsr   goCOMMUNICATE

                lda   ADRBANCS+32       ;
                sta   shutDOWN+1
                lda   ADRBANCS+33
                sta   shutDOWN+2

                bra   goCONVERT

shutDOWN        jmpl  $012000           ; A RAJOUTER Pour quitter

*---------------------------------------
* Routine de communication
*---------------------------------------

goCOMMUNICATE   phb
goCOMMUNICATE1  jsl   $012000
                plb
                rts

******  INIT  ******

goCONVERT       JSR   CONVERTINIT       ; INIT MEMOIRE

                LDA   #$0000
                STA   POSX
                STA   POSY
                STA   A1                ; INIT SOURIS
                STA   AP
                JSR   SAUV              ; SAUVEGARDE DECOR
                JSR   DESS

                LDA   #$0001            ; INIT MAIN
                STA   ECRAN

                LDA   #$0001
                JMP   PICT              ; AFFICHE L'IMAGE MAIN

****************************  MOUSE MANAGER  ********************************

SOURIS          LDA   BOUT              ; ANCIEN BOUT=NOUVEAU BOUT
                STA   BOUT1

                LDAL  $00BFFF
                AND   #$FF00
                BMI   TOUCH

SOURIS0         JSR   SLECT             ; LECTURE SOURIS
                CPY   #$FFFF
                BEQ   SECR              ; DONNEES NON DISPONIBLES
                BRA   SOURIS1

TOUCH           STAL  $00C010           ; BIT $C010
                LDY   BMPFLG
                BNE   SOURIS0           ; BUMPER NON RELEVE
                JMP   TOUCH0

SOURIS1         LDA   A1                ; A1 POSITION ACTUELLE
                STA   AP                ; AP ANCIENNE POSITION
                LDA   POSX
                LSR
                STA   SOURIS2+1
                LDA   POSY
                ASL
                TAX
                LDA   TABLE,X
                CLC
SOURIS2         ADC   #$0000            ; CALCUL DE A1 (160*POSY+POSX)
                STA   A1
                JSR   TRACE             ; ON DESSINE LE POINTEUR

*****

SECR            LDA   ECRAN
                DEC
                ASL
                TAX
                LDA   ECRTAB,X
                TAY                     ; ADRESSE TABLEAU DES BOUTONS
                DEC
                DEC
                TAX
SECR0           LDA\  $0000,X           ; NB DE BUMPER DANS ECRAN
                ASL
                STA   SECR8+1

                LDX   #$0000
                LDA   POSX
SECR1           CMP\  $0000,Y           ; X0   ECR1, ECR2, ECR3 ...
                BMI   SECR4
                INY
                INY
SECR11          CMP\  $0000,Y           ; X1
                BPL   SECR5
                INY
                INY
                LDA   POSY
SECR12          CMP\  $0000,Y           ; Y0
                BMI   SECR6
                INY
                INY
SECR13          CMP\  $0000,Y           ; Y1
                BPL   SECR7
                STX   SECR2+1           ; ON EST SUR UN BUMPER
                LDA   ECRAN
                DEC
                ASL
                TAX
                LDA   ECRDESA,X
                STA   SECR20+1          ; ADRESSE DE L'ADRESSE EXECUTION
SECR2           LDX   #$0000            ; NUMERO DU BUMPER TRAVERSE (*2)
SECR20          LDA   $FFFF,X
                STA   SECR3+1
SECR3           JMP   $A0A0             ;

SECR4           INY
                INY
SECR5           INY
                INY
SECR6           INY
                INY                     ; BOUTON SUIVANT
SECR7           INY
                INY
                LDA   POSX
                INX
                INX
SECR8           CPX   #$0000            ; NB DE BOUTON
                BMI   SECR1
                JSR   BORD5
                JMP   BUMPDEF           ; AUCUN BOUTON DETECTE : TRAITEMENT PAR DEFAUT

*******

TOUCH0          LDX   #$0000            ; ON A TOUCHE LE CLAVIER
TOUCH1          CMP   TOUCHTA1,X
                BEQ   TOUCH3
                INX
                INX
                CPX   #$0022            ; 17*2
                BNE   TOUCH1
TOUCH2          JMP   SOURIS0           ; AUCUNE TOUCHE CONNU, ON SORT
TOUCH3          LDA   TOUCHTA2,X        ; ADRESSE D'EXECUTION
                STA   TOUCH4+1
TOUCH4          JMP   $A0A0             ; ON EXECUTE...

TOUCH03         LDA   #$0002            ; = : OPEN
                CMP   ECRAN
                BEQ   TOUCH2            ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0002
                JMP   PICT

TOUCH04         LDA   #$0003            ; / : SAVE
                CMP   ECRAN
                BEQ   TOUCH2            ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0003
                JMP   PICT

TOUCH05         LDA   #$0004            ; * : SELECT
                CMP   ECRAN
                BEQ   TOUCH2            ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0004
                JMP   PICT

TOUCH06         LDA   #$0005            ; 9 : CONVERT
                CMP   ECRAN
                BEQ   TOUCH2            ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0005
                JMP   PICT

TOUCH07         LDA   #$0006            ; + : STAT
                CMP   ECRAN
                BEQ   TOUCH2            ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0006
                JMP   PICT

TOUCH08         LDA   #$0007            ; 6 : OPTIONS
                CMP   ECRAN
                BEQ   TOUCH2            ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0007
                JMP   PICT

TOUCH09         LDA   #$0008            ; - : DOCU
                CMP   ECRAN
                BEQ   TOUCH20           ; ON SORT
                JSR   TOUCHTRAVAIL
                LDA   #$0008
                JMP   PICT

TOUCH10         LDA   ECRAN             ; TAB : DOCU SPECIAL
                INC                     ; ***
                STA   DOCFLAG
                JSR   TOUCHTRAVAIL
                LDA   #$0008
                JMP   PICT

TOUCH11         LDA   ECRAN             ; ESC : EXIT
                CMP   #$0008            ; DOCU
                BEQ   TOUCH110
                CMP   #$000D            ; PALE
                BEQ   TOUCH112
                CMP   #$0009            ; LINE
                BEQ   TOUCH113
                DEC
                ASL
                TAX
                LDA   TOUCHTAB,X
                BEQ   TOUCH20           ; ZERO DETECTE, ON SORT
                JMP   PICT
TOUCH110        LDA   DOCFLAG           ; DOCU : TRAIT SPECIAL
                BEQ   TOUCH111          ; PAS D'ECRAN SAUVEGARDE
                STZ   DOCFLAG
                DEC                     ; ***
                JMP   PICT
TOUCH111        LDA   #$0001
                JMP   PICT
TOUCH112        JMP   ECR13110          ; PALE : TRAIT SPECIAL
TOUCH113        JMP   ECR09090          ; LINE : TRAIT SPECIAL
TOUCH20         JMP   SOURIS0

TOUCH12         JMP   SCRSAV            ; SPACE : SCREEN SAVER

TOUCHTRAVAIL    LDA   ECRAN
                CMP   #$000D            ; PALE
                BEQ   TOUCHTRAVAIL1
                CMP   #$0009            ; LINE
                BEQ   TOUCHTRAVAIL2
                RTS
TOUCHTRAVAIL1   JSR   ECR13110ESC       ; PALE
                RTS
TOUCHTRAVAIL2   JSR   ECR09090ESC       ; LINE
                RTS

TOUCH13         LDA   ECRAN             ; UP
                CMP   #$000C
                BEQ   TOUCH131          ; NBCL
                CMP   #$000A
                BEQ   TOUCH132          ; COLOR1
                CMP   #$000B
                BEQ   TOUCH133          ; COLOR2
                CMP   #$000D
                BEQ   TOUCH134          ; PALETTE
                CMP   #$0009
                BEQ   TOUCH135          ; LINE
                JMP   SOURIS0
TOUCH131        JSR   DESS1             ; NBCL
                JSR   ECR12001
                JSR   SAUV
                JMP   SOURIS1
TOUCH132        JSR   DESS1             ; COLOR1
                JSR   ECR100003
                JSR   SAUV
                JMP   SOURIS1
TOUCH133        JSR   DESS1             ; COLOR2
                JSR   ECR110003
                JSR   SAUV
                JMP   SOURIS1
TOUCH134        JSR   DESS1             ; PALETTE
                JSR   ECR130093
                JSR   SAUV
                JMP   SOURIS1
TOUCH135        JSR   DESS1             ; LINE
                JSR   ECR09053
                JSR   SAUV
                JMP   SOURIS1

TOUCH14         LDA   ECRAN             ; DOWN
                CMP   #$000C
                BEQ   TOUCH141          ; NBCL
                CMP   #$000A
                BEQ   TOUCH142          ; COLOR1
                CMP   #$000B
                BEQ   TOUCH143          ; COLOR2
                CMP   #$000D
                BEQ   TOUCH144          ; PALETTE
                CMP   #$0009
                BEQ   TOUCH145          ; LINE
                JMP   SOURIS0
TOUCH141        JSR   DESS1             ; NBCL
                JSR   ECR12012
                JSR   SAUV
                JMP   SOURIS1
TOUCH142        JSR   DESS1             ; COLOR1
                JSR   ECR100013
                JSR   SAUV
                JMP   SOURIS1
TOUCH143        JSR   DESS1             ; COLOR2
                JSR   ECR110013
                JSR   SAUV
                JMP   SOURIS1
TOUCH144        JSR   DESS1             ; PALETTE
                JSR   ECR131003
                JSR   SAUV
                JMP   SOURIS1
TOUCH145        JSR   DESS1             ; LINE
                JSR   ECR09061
                JSR   SAUV
                JMP   SOURIS1

TOUCH15         LDA   ECRAN             ; <-
                CMP   #$000D
                BEQ   TOUCH151          ; PALETTE
                CMP   #$0009
                BEQ   TOUCH152          ; LINE
                JMP   SOURIS0
TOUCH151        JMP   ECR13001          ; PALETTE
TOUCH152        JMP   ECR09001          ; LINE

TOUCH16         LDA   ECRAN             ; ->
                CMP   #$000D
                BEQ   TOUCH161          ; PALETTE
                CMP   #$0009
                BEQ   TOUCH162          ; LINE
                JMP   SOURIS0
TOUCH161        JMP   ECR13011          ; PALETTE
TOUCH162        JMP   ECR09011          ; LINE

TOUCH17         LDAL  $00C025           ; Q ou q : ON VEUT QUITTER LE SOFT
                AND   #$0080            ; TOUCHE POMME ENFONCEE ?
                BNE   TOUCH18
                JMP   SOURIS0           ; ON NE SORT PAS
TOUCH18         NOP                     ; Ctrl-Q
                JMP   shutDOWN          ; ON SORT

TOUCHTAB        HEX   0000,0100,0100,0100,0100,0100,0100,0100  ; ECRAN DE DESTINATION SI EXIT
                HEX   0500,0600,0600,0600,0600
TOUCHTA1        HEX   00BD,00AF,00AA,00B9,00AB,00B6,00AD,0089,009B,00A0,008B,008A,0088,0095,00D1,00F1,0091
TOUCHTA2        DA    TOUCH03,TOUCH04,TOUCH05,TOUCH06,TOUCH07,TOUCH08,TOUCH09,TOUCH10
                DA    TOUCH11,TOUCH12,TOUCH13,TOUCH14,TOUCH15,TOUCH16,TOUCH17,TOUCH17,TOUCH18

******************************************************

                PUT   CONVERT.INIT
                PUT   CONVERT.DATA      ; SLECT,TRACE,AFFSPR
                                        ; BUMPER,BOMPER,BOUTON,SURFACE MANAGER
                                        ; TABLEAUX DES DATA POUR LES BUMPERS,BOMPERS...

******************************************************

BORD4           LDX   SECR2+1           ; NUMERO DU BUMPER (*2)
                LDA   #BORD44
                STA   BUMPER5+1         ; ADRESSE D'EXECUTION
                JMP   BUMPER
BORD44          JMP   SOURIS1           ; ON SORT SANS LIRE LA SOURIS

BORD5           LDA   ECRAN
                CMP   #$0009            ; ON EST SUR L'ECRAN LINE, ON NE CHANGE RIEN
                BEQ   BORD55
                LDAL  $00C034           ; ICI TRAITEMENT PAR DEFAUT
                AND   #$FFF0            ; BORDURE NOIRE
                STAL  $00C034
BORD55          RTS

*******************  TRAITEMENT DES BOUTONS  **************************

                PUT   CONVERT.MAIN      ; ECR01xxx : MAIN
                PUT   CONVERT.SELE      ; ECR04xxx : SELECT AREA
                PUT   CONVERT.CONV      ; ECR05xxx : CONVERT AREA
                PUT   CONVERT.STAT      ; ECR06xxx : STATISTICS
                PUT   CONVERT.OPTI      ; ECR07xxx : OPTIONS
                PUT   CONVERT.DOCU      ; ECR08xxx : DOCUMENTATION
                PUT   CONVERT.LINE      ; ECR09xxx : CONVERT LINE
                PUT   CONVERT.COL1      ; ECR10xxx : COLOR 1
                PUT   CONVERT.COL2      ; ECR11xxx : COLOR 2
                PUT   CONVERT.NBCL      ; ECR12xxx : SPECTRE NBCL
                PUT   CONVERT.PALE      ; ECR13xxx : PALETTE

**************  TRAITEMENT DES AFFICHAGES ECRANS  *********************

PICT            PHA                     ; DESSINE LE DECOR SUR LE POINTEUR
                JSR   DESS1
                PLA
PICT00          STA   ECRAN             ; DANS ACC LE NUMERO DE L'ECRAN
                DEC
                ASL
                TAX
                LDAL  $00C034           ; BORDURE NOIRE
                AND   #$FFF0
                STAL  $00C034
                LDA   ECRADTAB,X        ; ADRESSE BASSE SOURCE
                CMP   #$FFFF
                BEQ   PICT12            ; IMAGE SPECIALE
                LDY   ECRAN
                CPY   #$0001            ; MAIN
                BEQ   PICT02
                CPY   #$000A            ; COLORS 1
                BEQ   PICT02
                CPY   #$000B
                BEQ   PICT02

********* DECOMPRESSION

PICT01          LDX   #$0500            ; NUMERO DU BANC : DOCU,SELE,OPTI,ABOUT,NBCL
                BRA   PICT03
PICT02          LDX   #$0600            ; NUMERO DU BANC : MAIN,COLORS

PICT03          JSR   UNPACK            ; POINTS : ON NOIRCIT EN MEME TEMPS

                LDX   #$7DFE            ; COPIE LES POINTS+SCB
PICT0           LDAL  $068000,X
                STAL  $012000,X         ; COPIE L'IMAGE QUAND ELLE EST DECOMPRESSEE
                DEX
                DEX
                BPL   PICT0

                JSR   FADEIN            ; APPARITION DES COULEURS (COPIER)
                BRA   PICT20

******************

PICT12          LDX   #$7CFE            ; IMAGE OPEN-SAVE
                LDA   #$0000
PICT13          STAL  $012000,X
                DEX
                DEX
                BPL   PICT13

******************

PICT20          JSR   CLNFLG            ; LES FLAGS DE BUMPER A ZERO
                JSR   CLNFLAG           ; LES FLAGS DE BOUTON A ZERO

                STZ   BMPFLG            ; LES FLAGS A ZERO
                LDA   ECRAN             ; AFFICHAGES LIE A CHAQUE ECRAN
                DEC
                ASL
                TAX
                LDA   ECRANTAB,X
                STA   PICT22+1
PICT22          JMP   $FFFF             ; ON VA SUR LA ROUTINE CORRESPONDANTE

ECRANTAB        DA    ECRMAIN,ECROPEN,ECRSAVE,ECRSELE,ECRCONV,ECRSTAT,ECROPTI
                DA    ECRDOCU,ECRLINE,ECRCOL1,ECRCOL2,ECRNBCL,ECRPALE,ECRABOU

ECRADTAB        HEX   0000,FFFF,FFFF,980C,DE88,D8E5,9C2A
                HEX   0000,6FA4,452B,452B,B57C,0AC5,B83E

***************  INIT ECRAN

ECRMAIN         JSR   SAUV              ; ECRAN MAIN
                JMP   SOURIS1

ECROPEN         LDX   #goOPEN
                JSR   goCOMMUNICATE
                BCS   ECROPEN1          ; PAS D'IMAGE
                JSR   ALERTFIN          ; ENLEVE LA FENETRE WORKING
                JSR   INITNEWPICT       ; NOUVELLE IMAGE EN MEMOIRE
                JSR   SAUV
                LDA   #$0004            ; ON ATTERIT DANS L'ECRAN SELECT
                JMP   PICT
ECROPEN1        CMP   #$0000            ; A=0, CANCEL
                BNE   ECROPEN2
                JSR   SAUV
                LDA   #$0001            ; ON SAUTE A L'ECRAN MAIN
                JMP   PICT
ECROPEN2        SEC
                SBC   #$FFFA            ; -1 : FORMAT INCONNU
                ASL
                TAX
                LDA   OPENTABLE,X
                STA   ALERTI
                JSR   PUTPALETTE        ; ERREUR CHARGEMENT
                JSR   ALERTFIN          ; AU CAS OU DEJA UNE FENETRE (WORKING)
                JSR   ALERT             ; FENETRE ALERTE
                JSR   SAUV
                LDA   #$0002            ; ON RETOURNE DANS L'ECRAN OPEN
                JMP   PICT

OPENTABLE       HEX   0500,0100,0800,0700,0400,0300

ECRSAVE         LDX   #$0008            ; RECOPIE LES FLAGS IMAGES CONVERTIES
ECRSAVE1        LDA   CONV3200FLAG,X    ; 3200,256,16col,16grey,PRINTSHOP
                STA   $0130,X
                DEX
                DEX
                BPL   ECRSAVE1
                lda   CLNCON1           ; toinet
                lsr
                cmp   #5
                bcc   ecrsave2
                lda   #0
ecrsave2        sta   $140
                LDX   #goSAVE           ; ON VA DANS L'ECRAN SAVE
                JSR   goCOMMUNICATE
                BCS   ECRSAVE2          ; PROBLEME
                JSR   SAUV              ; DECOR
                LDA   #$0001
                JMP   PICT
ECRSAVE2        CMP   #$0000            ; A=0, CANCEL
                BNE   ECRSAVE3
                JSR   SAUV
                LDA   #$0001            ; ON SAUTE A L'ECRAN MAIN
                JMP   PICT
ECRSAVE3        CMP   #$0001            ; ERREUR BLOQUANTE
                BEQ   ECRSAVE4
                CMP   #$0003            ; NO PICT IN MEMORY
                BEQ   ECRSAVE6
                LDA   #$0011            ; I/O ERREUR
                STA   ALERTI
                BRA   ECRSAVE5
ECRSAVE4        LDA   #$0012            ; DISK FULL
                STA   ALERTI
ECRSAVE5        JSR   PUTPALETTE        ; ERREUR CHARGEMENT
                JSR   ALERTFIN          ; AU CAS OU DEJA UNE FENETRE (WORKING)
                JSR   ALERT             ; FENETRE ALERTE
                JSR   SAUV
                LDA   #$0003            ; ON RETOURNE DANS L'ECRAN SAVE
                JMP   PICT
ECRSAVE6        LDA   #$0010            ; PAS D'IMAGE EN MEMOIRE
                STA   ALERTI
                JSR   PUTPALETTE        ; ERREUR CHARGEMENT
                JSR   ALERTFIN          ; AU CAS OU DEJA UNE FENETRE (WORKING)
                JSR   ALERT             ; FENETRE ALERTE
                JSR   SAUV
                LDA   #$0001            ; ON SORT DANS L'ECRAN MAIN
                JMP   PICT

ECRSELE         JSR   ECR04063          ; ECRAN SELECT
                LDY   #CLNSELE
                JSR   PICT21            ; AFFICHAGE BOUTON
                JSR   SAUV
                JMP   SOURIS1

ECRCONV         JSR   ECR05091          ; ECRAN CONVERT
                LDY   #CLNCON
                JSR   PICT21            ; AFFICHAGE BOUTON
                JSR   SAUV
                JMP   SOURIS1

ECRSTAT         JSR   STATGO            ; ECRAN STATISTIC
                LDA   COLOR1NB
                STA   VALH
                LDA   #$4175
                STA   ADRE
                JSR   TRANSA            ; ORIGINAL COLOR
                LDA   COLOR2NB
                STA   VALH
                LDA   #$5075
                STA   ADRE
                JSR   TRANSA            ; USED COLOR
                JSR   SAUV
                JMP   SOURIS1

ECROPTI         JSR   ECR07065          ; ECRAN OPTIONS
                JSR   ECR07066          ; TO
                JSR   ECR07114          ; UN : EN CHARCHE UN
                JSR   ECR07067          ; AFFICHAGE UNCONVERT
                LDY   #CLNOPT
                JSR   PICT21            ; AFFICHAGE BOUTON
                JSR   SAUV
                JMP   SOURIS1

ECRDOCU         LDA   DOCFLAG           ; ECRAN DOCUMENTATION
                BEQ   ECRDOCU1          ; ON ATTERIR AU SOMMAIRE
                LDY   #$0000
                LDX   #$0000
                STX   AFTCLE
                STX   ECRDOCU2+1        ; TEXTE EN BANC 04/0000
ECRDOCU2        LDAL  $040000
                CMP   #$A4A4            ; ]] : FIN DE FICHIER : ON SORT
                BEQ   ECRDOCU1
                AND   #$00FF
                CMP   #$00A4            ; ] : FIN DE CHAPITRE
                BEQ   ECRDOCU3
ECRDOCU5        INC   ECRDOCU2+1
                BRA   ECRDOCU2
ECRDOCU1        STZ   AFTCONT           ; INITIALISATION COMPLETE
                JSR   AFFTEXT
                JSR   SAUV
                JMP   SOURIS1
ECRDOCU3        INX                     ; ON VIENT DE PASSER SUR UN ]
                INX
                LDA   ECRDOCU2+1
                INC
                STA   AFTTAR,X          ; ADRESSE DEBUT DE CHAPITRE
                INC   AFTCLE            ; NUMERO DU CHAPITRE
                INY
                TYA
                INC
                CMP   DOCFLAG
                BEQ   ECRDOCU4
                BRA   ECRDOCU5
ECRDOCU4        INC   AFTCONT           ; PAS D'INITIALISATION COMPLETE
                INC   AFTCHG            ; CHANGEMENT DE CHAPITRE
                JSR   AFFTEXT
                JSR   SAUV
                JMP   SOURIS1

ECRLINE         NOP                     ; ECRAN LINE
                JSR   LINERMP           ; REMPLISSAGE DES TABLEAUX
                JSR   ECR09023          ; NB D'ECRAN AUTORISE
                STA   LINESLI
                LDA   #$0001            ; ECRAN ACTUEL
                STA   LINESCR
                JSR   ECR09051          ; AFF CHIFFRE SCR
                JSR   ECR09123          ; AFFICHAGE COUL + FREQ
                JSR   ECR09073          ; AFFICHAGE NB COUL
                JSR   ECR09072          ; AFF NUM LIGNE
                LDA   LINEREFETAB
                STA   SELECIND          ; INDICE 0
                JSR   LINEBAS           ; AFFICHAGE BAS
                JSR   SAUV
                JMP   SOURIS1

ECRCOL1         NOP                     ; ECRAN COLORS1
                JSR   ECR10013          ; AFFICHAGE COULEURS
                JSR   ECR10003          ; AFF NUM SCR
                JSR   ECR10004          ; AFF NB COUL
                JSR   SAUV
                JMP   SOURIS1

ECRCOL2         LDX   #$0001            ; ECRAN COLORS2
                LDA   COLOR2NB          ; ON DETERMINE LE NB MAX D'ECRAN AUTORISE
ECRCOL20        CMP   #$00C5            ; 196+1
                BMI   ECRCOL21          ; FINI
                LDX   #$0002
ECRCOL21        STX   COLOR2SL          ; 1 OU 2
                JSR   ECR11013          ; AFFICHAGE COULEURS
                JSR   ECR11003          ; AFF NUM SCR
                JSR   ECR11004          ; AFF NB COUL
                JSR   SAUV
                JMP   SOURIS1

ECRNBCL         LDX   #$001E            ; ECRAN NBCL (SPECTRE)
ECRNBCL1        LDA   ECRNBPAL,X
                STAL  $019E20,X
                DEX
                DEX
                BPL   ECRNBCL1          ; PATCH POUR LES COULEURS
                JSR   ECR12003
                JSR   ECR12006          ; AFF SPECTRE
                JSR   SAUV
                JMP   SOURIS1

ECRNBPAL        HEX   0000,F00F,000E,EE00,F00F,1F01,1F01,0A00
                HEX   0800,2302,3403,5605,6706,7807,AB0A,DE0D

ECRPALE         JSR   ECR13023          ; ECRAN PALETTE
                STA   PALETSLI          ; NB MAX D'ECRAN
                LDA   PALETSCR          ; ON PREND L'INDICE DE LA COULEUR DU HAUT
                DEC
                ASL
                TAX
                LDA   PALETAB,X
                LSR
                STA   PALETIND
                JSR   ECR13093          ; AFFICHAGE CHIFFRE SCR (1,2,3)
                JSR   ECR13034          ; AFFICHAGE NB COUL
                JSR   ECR13123          ; AFFICHAGE COULEUR ET FREQUENCES ECRAN
                JSR   ECR13129          ; CALCUL ET AFF BAS : COULEUR,FREQ,RVB
                JSR   PALESUBSINIT      ; INITIALISE LA TABLE DE TRANSLATION
                JSR   SAUV
                JMP   SOURIS1

ECRABOU         LDX   #$0460            ; ECRAN ABOUT
                LDA   #$0000
ECRABOU1        STAL  $08EA60,X
                DEX                     ; NETTOYAGE DU BUFFER
                DEX
                BPL   ECRABOU1
                JMP   ABOUT             ; ON ANIME

****************  INIT NOUVELLE IMAGE/ZONE  *************************

INITNEWPICT     LDA   #$0064            ; INITIALISATIONS A EFFECTUER A CHAQUE NOUVELLE IMAGE
                STA   PRHR              ; 100%
                STA   PRVR              ; 100%
                LDA   $0100             ; OHS
                STA   OHS
                STA   PRHS
                LDA   $0102             ; OVS
                STA   OVS
                STA   PRVS
                LDX   #$0140
                LDA   OHS
                CMP   #$0140            ; ON CHOISIT LE 320*200
                BPL   INITNEWPICT2      ; OU MOINS SI IMAGE + PETITE
                LDX   OHS
INITNEWPICT2    STX   RHS
                LDX   #$00C8
                LDA   OVS
                CMP   #$00C8
                BPL   INITNEWPICT3
                LDX   OVS
INITNEWPICT3    STX   RVS
                STZ   CLNSELE           ; FULL SCREEN
                STZ   SELCONVF          ; PALETTE A CONVERTIR EN GRIS
                LDA   #$0001
                STA   IMAGEOK           ; 1 IMAGE EN MEMOIRE
                STZ   STATFLAG
                STZ   ECR04083          ; AUCUNE ZONE CHOISIE
                LDA   $0104             ; FLAG SCB 256/16
                STA   IMAGE256
                LDX   #$018E            ; NETTOYAGE TABLE DE VIEW
                LDA   #$0000
INITNEWPICT4    STA   CONVTAB1,X
                DEX
                DEX
                BPL   INITNEWPICT4
                RTS

INITNEWZONE     NOP
                STZ   STATFLAG          ; ON DOIT RETRAVAILLER LA PALETTE
                STZ   CONV3200FLAG      ; ON PEUT RECALCULER IMAGE 3200 COUL
                STZ   CONV256FLAG       ; ON PEUT RECALCULER IMAGE 256 COUL
                STZ   CONV16FLAG        ; ON PEUT RECALCULER IMAGE 16 COUL
                STZ   CONVPSHPFLAG      ; IMAGE PRINTSHOP A RECALCULER
                LDA   #$0001            ; IMAGE 16 GREY DEJA CALCULEE
                STA   CONV16GFLAG
                LDA   #$FFFF
                STA   CLNOPT3           ; FROM-TO DESACTIVE
                STZ   PRINTSHOPFLAG     ; ON A A RECALCULER LA TABLE DE REFERENCE
                STZ   CONVOSII          ; VALEUR MAX SCRIPT 3200
                STZ   ZONEOSII          ; VALEUR MAX SCRIPT 256
                STZ   CONVOSCI          ; VALEUR MAX SCRIPT 16
                LDA   #$0001
                STA   ECR04083
                LDA   COLOR1NB
                STA   COLOR2NB          ; NB DE COULEUR FINAL
                LDX   #$018E            ; NETTOYAGE TABLE DE VIEW
                LDA   #$0000
INITNEWZONE1    STA   CONVTAB1,X
                DEX
                DEX
                BPL   INITNEWZONE1
                RTS

IMAGEOK         HEX   0000              ; 0000 : PAS D'IMAGE EN MEMOIRE

PUTWINDOW       PHB
                PHK
                PLB
                JSR   PUTPALETTE        ; MET LES COULEURS
                LDA   #$0005
                STA   WORKINGI          ; MET LA FENETRE : CHARGEMENT ET DECOMPRESSION
                JSR   WORKING
                PLB
                RTL

PUTPALETTE      LDX   #$001E
PUTPALETTE1     LDA   PALETTEWINDOW,X
                STAL  $019E00,X
                DEX
                DEX
                BPL   PUTPALETTE1
                RTS

PALETTEWINDOW   HEX   0000,0008,000E,EE00,F00F,9000,0C00,0A00,0800,2302,3403,5605,6706,7807,AB0A,DE0D

****************  AFFICHAGE BOUTONS  *************************

PICT21          STY   PICT3+1           ; ON TRAITE L'AFFICHAGE DES BOUTONS (CLNOPEN,CLNSAVE...)
                INY
                INY
                STY   PICT4+1
                STY   PICT6+1           ; TRAITEMENT DES GROUPES
PICT3           LDX   $A0A0             ; NUMERO DU BOUTON
                CPX   #$FFFF
                BEQ   PICT6             ; ON A DES GROUPES DE BOUTONS
PICT4           LDA   $A0A0,X           ; ADRESSE ECRAN DU BOUTON
                STA   CLNAFF4+1
                LDA   #$8B79            ; ADRESSE SPRITE
                STA   CLNAFF3+1
                JSR   CLNAFF            ; AFFICHE LE BOUTON ROUGE
PICT5           RTS

PICT6           LDX   $A0A0             ; ON TRAITE LES GROUPES (NB DE GROUPES*2-2)
                INY
                INY
                STY   PICT7+1
PICT7           LDA   $A0A0,X           ; ADRESSE D'UN GROUPE
                STA   PICT8+1
                INC
                INC
                STA   PICT9+1           ; DEBUT DES ADRESSE ECRAN DU GROUPE
PICT8           LDY   $A0A0             ; NUMERO DU BOUTON DU GROUPE
                CPY   #$FFFF
                BEQ   PICT10            ; AUCUN BOUTON ACTIF DANS LE GROUPE
PICT9           LDA   $A0A0,Y           ; ADRESSE ECRAN DU BOUTON
                STA   CLNAFF4+1
                LDA   #$8B79
                STA   CLNAFF3+1
                PHX
                JSR   CLNAFF            ; AFFICHE LE BOUTON ROUGE DU GROUPE
                PLX
PICT10          DEX
                DEX
                BPL   PICT7             ; GROUPE SUIVANT
                RTS

*************  NETTOYAGE  ***************

CLNFLAG         LDY   #$0062
                LDA   #$0000            ; EFFACE LA TABLE DES FLAGS DE BOUTON
CLNFLAG1        STA   FLAGTAB1,Y
                DEY
                DEY
                BPL   CLNFLAG1
                RTS

CLNFLG          LDX   #$0062            ; ON MET TOUS LES FLAG DE BUMPER A 0
                LDA   #$0000
CLNFLG1         STA   FLAGTAB,X
                DEX
                DEX
                BPL   CLNFLG1
                RTS

CLNBMP          LDX   #$0000            ; CLEAN ALL BOUTONS
CLNBMP2         LDA   $FFFF,X
                BEQ   CLNBMP3           ; C'EST LA FIN
                STA   CLNAFF4+1         ; ADRESSE ECRAN
                INX
                INX
                PHX
                LDA   #$0B79            ; ADRESSE SPRITE
                STA   CLNAFF3+1
                JSR   CLNAFF
                PLX
                BRA   CLNBMP2
CLNBMP3         RTS

CLNAFF          LDY   #$0007            ; HAUTEUR
CLNAFF2         LDX   #$0003            ; LARGEUR
CLNAFF3         LDAL  $070B79
CLNAFF4         STAL  $012000
                INC   CLNAFF3+1         ; AFFICHAGE DU BUMPER VIERGE
                INC   CLNAFF3+1
                INC   CLNAFF4+1
                INC   CLNAFF4+1
                DEX
                BPL   CLNAFF3
                LDA   CLNAFF3+1
                CLC
                ADC   #$0098
                STA   CLNAFF3+1
                LDA   CLNAFF4+1
                CLC
                ADC   #$0098
                STA   CLNAFF4+1
                DEY
                BPL   CLNAFF2
                LDA   #$0B79
                STA   CLNAFF3+1
                RTS

*********************************

CLNOPEN         HEX   0600              ; NUMERO DU BOUTON ACTIF (*2)
                HEX   3D73,FD7B,BD84,5A73,1A7C,DA84,7673,367C,9273,527C,F684,0000

CLNSAVE         HEX   0A00              ; NUMERO DU BOUTON ACTIF (*2)
                HEX   8D77,4D80,0D89,CD91,BC77,7C80,3C89,FC91,EC77,AC80,6C89,0000

CLNSELE         HEX   0000              ; NUMERO DU BOUTON ACTIF (*2)
                HEX   595D,D969,B97A,0000

CLNOPT          HEX   FFFF,0600         ; NB DE GROUPE DE BOUTONS (*2-2)
                DA    CLNOPT1,CLNOPT2,CLNOPT3,CLNOPT4  ; ADRESSE DES DIFFERENTS GROUPES
CLNOPT1         HEX   FFFF              ; NUMERO DU BOUTON ACTIF (*2)
                HEX   2541,0000         ; ADRESSE ECRAN
CLNOPT2         HEX   FFFF              ; NUM BOUT ACTIF (#$FFFF SI AUCUN ACTIF)
                HEX   E549,0000
CLNOPT3         HEX   FFFF              ; FROM-TO MNUM BOUT ACTIF
                HEX   A552,0000
CLNOPT4         HEX   0000              ; TRUE
                HEX   856D,0000

CLNCON          HEX   FFFF,0200         ; NB DE GROUPE DE BOUTONS (*2-2)
                DA    CLNCON1,CLNCON3   ; ADRESSE DES DIFFERENTS GROUPES
CLNCON1         HEX   0000              ; NUMERO DU BOUTON ACTIF (*2)
                HEX   2836,083D,E843,C84A,A851,8858,685F,0000
CLNCON3         HEX   0000              ; NUMERO DU BOUTON ACTIF (*2)
                HEX   C86D,A874,0000

************************************

*****************  AFFICHE DES CHIFFRES SUR 3 COLONNES  ****************************

TRANS           LDA   VALH              ;  ON CONVERTIT L'HEXA EN DECIMAL
                BNE   TRANS1
                LDA   VALFLAG
                BEQ   TRANS1
                LDA   #$000A            ; LE CHIFFRE EN NOIR
                STA   VAL1
                STA   VAL2
                STA   VAL3
                BRA   TRANS6            ; ON AFFICHE LE NOIR
TRANS1          LDX   #$0000
TRANS2          LDA   VALH              ; VALEUR EN HEXA
                CMP   #$0064            ; 100
                BMI   TRANS3
                SEC
                SBC   #$0064
                STA   VALH
                INX
                BRA   TRANS2
TRANS3          STX   VAL3              ; CENTAINE
                LDX   #$0000
TRANS4          LDA   VALH              ; VALEUR EN HEXA
                CMP   #$000A            ; 10
                BMI   TRANS5
                SEC
                SBC   #$000A            ; 10
                STA   VALH
                INX
                BRA   TRANS4
TRANS5          STX   VAL2              ; DIZAINE
                STA   VAL1              ; UNITES

                LDA   VAL3              ; CENTANES
                BNE   TRANS6
                LDY   #$0010
                STY   VAL3              ; SI LE CHIFFRE DES CENTAINES EST 0, ON LE NOIRCI
                LDA   VAL2              ; DIZAINE
                BNE   TRANS6
                STY   VAL2              ; SI CENTAINE ET DIZAINE = ZERO, ON NOIRCIT LES 2

TRANS6          LDA   ADRE              ;  ON AFFICHE LES 3 CHIFFRES
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL3
                JSR   CHIF              ; CENTAINES
                LDA   ADRE
                CLC
                ADC   #$0003
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL2
                JSR   CHIF              ; DIZAINES
                LDA   ADRE
                CLC
                ADC   #$0006
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL1
                JSR   CHIF              ; UNITES
                RTS

********************  AFFICHAGE SUR 3 COLONNES FULL BLACK  ****************

TRANSB          LDA   VALH              ; ON CONVERTIT L'HEXA EN DECIMAL
                BMI   TRANSS7           ; SUPERIEUR A 32768
                CMP   #$03E8            ; 1000 : ON VERIFIE SI LE NOMBRE TIENT SUR 3 CHIFFRES
                BMI   TRANSB0
                CMP   #$2710            ; ON VA GERER L'AFFICHAGE SCIENTIFIQUE
                BMI   TRANSS3
                LDX   #$0000            ; DE LA FORME xE4
                LDA   VALH
TRANSS1         CMP   #$2710            ; 10000
                BMI   TRANSS2
                SEC
                SBC   #$2710
                INX
                BRA   TRANSS1
TRANSS2         STX   VAL3              ; xE4
                LDA   #$0004
                STA   VAL1
                BRA   TRANSS6           ; AFFICHAGE
TRANSS7         LDX   #$0003            ; NOMBRE SUPPERIEUR A 32768
                SEC
                SBC   #$7530            ; 30000
                BPL   TRANSS1
                SEC
                SBC   #$7530
                LDX   #$0006
                BRA   TRANSS1
TRANSS3         LDA   VALH
                LDX   #$0000            ; DE LA FORME xE3
TRANSS4         CMP   #$03E8            ; 1000
                BMI   TRANSS5
                SEC
                SBC   #$03E8            ; 1000
                INX
                BRA   TRANSS4
TRANSS5         STX   VAL3              ; xE3
                LDA   #$0003
                STA   VAL1
TRANSS6         LDA   #$000E            ; E
                STA   VAL2
                BRA   TRANSB6           ; AFFICHAGE
TRANSB0         LDA   VALH              ; TOUT EST OK, INFERIEUR A 1000
                BNE   TRANSB1
                JMP   TRANSBLA          ; 0 A CONVERTIR EN NOIR TOTAL
TRANSB1         LDX   #$0000
TRANSB2         LDA   VALH              ; VALEUR EN HEXA
                CMP   #$0064            ; 100
                BMI   TRANSB3
                SEC
                SBC   #$0064
                STA   VALH
                INX
                BRA   TRANSB2
TRANSB3         STX   VAL3              ; CENTAINE
                LDX   #$0000
TRANSB4         LDA   VALH              ; VALEUR EN HEXA
                CMP   #$000A            ; 10
                BMI   TRANSB5
                SEC
                SBC   #$000A            ; 10
                STA   VALH
                INX
                BRA   TRANSB4
TRANSB5         STX   VAL2              ; DIZAINE
                STA   VAL1              ; UNITES
                LDA   VAL3              ; CENTANES
                BNE   TRANSB6
                LDY   #$0010
                STY   VAL3              ; SI LE CHIFFRE DES CENTAINES EST 0, ON LE NOIRCI
                LDA   VAL2              ; DIZAINE
                BNE   TRANSB6
                STY   VAL2              ; SI CENTAINE ET DIZAINE = ZERO, ON NOIRCIT LES 2
TRANSB6         LDA   ADRE              ; ON AFFICHE LES 3 CHIFFRES
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL3
                JSR   CHIF              ; CENTAINES
                LDA   ADRE
                CLC
                ADC   #$0003
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL2
                JSR   CHIF              ; DIZAINES
                LDA   ADRE
                CLC
                ADC   #$0006
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL1
                JSR   CHIF              ; UNITES
                RTS

TRANSBLA        LDA   ADRE              ; ADRESSE HAUT GAUCHE
                STA   TRANSBL2+1
                LDY   #$0005            ; NB DE LIGNES
TRANSBL1        LDX   #$0008            ; LARGEUR
                LDA   #$0000
TRANSBL2        STAL  $012000,X
                DEX
                DEX                     ; ON NETTOY LA SURFACE
                BPL   TRANSBL2
                LDA   TRANSBL2+1
                CLC
                ADC   #$00A0
                STA   TRANSBL2+1
                DEY
                BPL   TRANSBL1
                RTS

******************  AFFICHAGE CHIFFRES SUR 4 COLONNES  **********************

TRANSA          LDA   VALH              ;  ON CONVERTIT L'HEXA EN DECIMAL
                BNE   TRANSA0
                LDA   VALFLAG
                BEQ   TRANSA1
                LDA   #$0010            ; LE CHIFFRE EN NOIR
                STA   VAL1              ; UNITES
                STA   VAL2              ; DIZAINES
                STA   VAL3              ; CENTAINES
                STA   VAL4              ; MILLIERS
                BRA   TRANSA6           ; ON AFFICHE LE NOIR
TRANSA0         LDX   #$0000
TRANSA00        LDA   VALH              ; VALEUR EN HEXA
                CMP   #$03E8            ; 1000
                BMI   TRANSA01
                SEC
                SBC   #$03E8
                STA   VALH
                INX
                BRA   TRANSA00
TRANSA01        STX   VAL4
TRANSA1         LDX   #$0000
TRANSA2         LDA   VALH              ; VALEUR EN HEXA
                CMP   #$0064            ; 100
                BMI   TRANSA3
                SEC
                SBC   #$0064
                STA   VALH
                INX
                BRA   TRANSA2
TRANSA3         STX   VAL3              ; CENTAINE
                LDX   #$0000
TRANSA4         LDA   VALH              ; VALEUR EN HEXA
                CMP   #$000A            ; 10
                BMI   TRANSA5
                SEC
                SBC   #$000A            ; 10
                STA   VALH
                INX
                BRA   TRANSA4
TRANSA5         STX   VAL2              ; DIZAINE
                STA   VAL1              ; UNITES

                LDA   VAL4              ; MILLIERS
                BNE   TRANSA6
                LDY   #$0010            ; FORCE EN NOIR
                STY   VAL4
                LDA   VAL3              ; CENTANES
                BNE   TRANSA6
                STY   VAL3              ; SI LE CHIFFRE DES CENTAINES EST 0, ON LE NOIRCI
                LDA   VAL2              ; DIZAINE
                BNE   TRANSA6
                STY   VAL2              ; SI CENTAINE ET DIZAINE = ZERO, ON NOIRCIT LES 2

TRANSA6         LDA   ADRE              ;  ON AFFICHE LES 4 CHIFFRES
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL4
                JSR   CHIF              ; MILLIERS
                LDA   ADRE
                CLC
                ADC   #$0003
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL3
                JSR   CHIF              ; CENTAINES
                LDA   ADRE
                CLC
                ADC   #$0006
                STA   AFTCA+1           ; ADRESSE ECRAN
                LDA   VAL2
                JSR   CHIF              ; DIZAINES
                LDA   ADRE
                CLC
                ADC   #$0009
                STA   AFTCA+1
                LDA   VAL1
                JSR   CHIF              ; UNITES
                RTS

******************************

CHIF            ASL                     ; DANS ACC LA VALEUR DECIMALE (0-9)
                ASL
                STA   CHIF1+1
                ASL
                ASL                     ; *16
                CLC
CHIF1           ADC   #$0000            ; + *4
                CLC
                ADC   #$0012            ; 10*2
                TAX
                LDY   #$0012            ; 10*2
CHIF2           LDA   AFBT0,X
                STA   AFBTT,Y
                DEX
                DEX                     ; RECOPIE DANS LE BUFFER
                DEY
                DEY
                BPL   CHIF2

*** AFFICHE CARACTERE ***

AFTCA           LDA   #$0000            ; ADRESSE ECRAN
                STA   AFTCA2+1
                INC
                INC
                STA   AFTCA4+1
                LDX   #$0000            ; 1 ere COLONNE
AFTCA1          LDA   AFBTT,X
AFTCA2          STAL  $012000
                LDA   AFTCA2+1
                CLC
                ADC   #$00A0
                STA   AFTCA2+1          ; LIGNE SUIVANTE
                INX
                INX
                CPX   #$000A
                BNE   AFTCA1
                LDX   #$0000            ; 2 eme COLONNE
AFTCA3          LDA   AFBTT1,X
AFTCA4          STAL  $012000
                LDA   AFTCA4+1
                CLC
                ADC   #$00A0
                STA   AFTCA4+1          ; LIGNE SUIVANTE
                INX
                INX
                CPX   #$000A
                BNE   AFTCA3
                RTS

AFBTT           HEX   00000000000000000000
AFBTT1          HEX   00000000000000000000
VALH            HEX   0000              ; VALEUR HEXA
VAL1            HEX   0000
VAL2            HEX   0000              ; VALEUR DECIMALE
VAL3            HEX   0000
VAL4            HEX   0000
VALFLAG         HEX   0000              ; SI !=0 ALORS 000 EN NOIR
ADRE            HEX   0000              ; ADRESSE ECRAN
AFBT0           HEX   00FF0F000F000F0000FFF0000F000F000F00F000  ; 0
                HEX   000F00FF000F000F0FFF0000000000000000FF00  ; 1
                HEX   0FFF000000FF0F000FFFF0000F00F0000000FF00  ; 2
                HEX   0FFF0000000F00000FFFF0000F00F0000F00F000  ; 3
                HEX   0F000F000F000FFF00000000F000F000FF00F000  ; 4
                HEX   0FFF0F000FFF00000FFFFF000000F0000F00F000  ; 5
                HEX   00FF0F000FFF0F0000FFFF000000F0000F00F000  ; 6
                HEX   0FFF0000000F00F000F0FF00F000000000000000  ; 7
                HEX   00FF0F0000FF0F0000FFF0000F00F0000F00F000  ; 8
                HEX   00FF0F0000FF00000FFFF0000F00FF000F00F000  ; 9
                HEX   00FF0F000FFF0F000F00F0000F00FF000F000F00  ; A
                HEX   0FFF0F000FFF0F000FFFF0000F00F0000F00F000  ; B
                HEX   00FF0F000F000F0000FFF0000F0000000F00F000  ; C
                HEX   0FFF0F000F000F000FFFF0000F000F000F00F000  ; D
                HEX   0FFF0F000FFF0F000FFFFF000000F0000000FF00  ; E
                HEX   0FFF0F000FFF0F000F00FF000000F00000000000  ; F
                HEX   0000000000000000000000000000000000000000  ; NOIR

*****************  SAISIE CHIFFRE : 3 CHIFFRES  ******************

SAISIEVAL       SEI
                STA   ADRE              ; ADRESSE AFFICHAGE
                STX   SAISIEVALMIN      ; VALEUR MIN
                INY
                STY   SAISIEVALMAX      ; VALEUR MAX
                JSR   SAISIENETTOY      ; EFFACE LA ZONE + TIRET ROUGE
                STZ   SAISIEVALEUR
                LDX   #$0000
SAISIE10        LDAL  $00BFFF           ; ON SAUTE LES 0 AU DEBUT
                BPL   SAISIE10
                STAL  $00C010
                AND   #$FF00
                CMP   #$8D00            ; RETURN
                BEQ   SAISIEFIN
                CMP   #$B100            ; 1
                BMI   SAISIE10
                CMP   #$BA00            ; :
                BPL   SAISIE10
                BRA   SAISIE12          ; ENFIN UN CHIFFRE 1-9
SAISIE11        LDAL  $00BFFF
                BPL   SAISIE11
                STAL  $00C010
                AND   #$FF00
                CMP   #$8D00            ; RETURN
                BEQ   SAISIEFIN
                CMP   #$B000            ; 0
                BMI   SAISIE11
                CMP   #$BA00            ; :
                BPL   SAISIE11
SAISIE12        XBA
                SEC
                SBC   #$00B0            ; VALEUR 0 -> 9
                PHA
                JSR   SAISIE10FOIS
                PLA
                CLC
                ADC   SAISIEVALEUR
                STA   SAISIEVALEUR
                JSR   SAISIEAFFICH      ; AFFICHAGE NOUVELLE VALEUR
                INX
                CPX   #$0003
                BNE   SAISIE11
SAISIEFIN       JSR   SAISIENETTOY2     ; ENLEVE TIRET ROUGE
                LDA   SAISIEVALEUR      ; VERIFICATION COHERENCE VALEUR
                CMP   SAISIEVALMAX
                BPL   SAISIEFIN0
                LDA   SAISIEVALEUR
                CMP   SAISIEVALMIN
                BMI   SAISIEFIN0
                CLI
                RTS

SAISIEFIN0      LDA   #$0000            ; ECHOUE
                CLI
                RTS

SAISIENETTOY    LDY   #$0005            ; EFFACE ZONE
                LDX   ADRE
SAISIENETTOY1   LDA   #$0000
                STAL  $010000,X
                STAL  $010002,X
                STAL  $010004,X
                STAL  $010006,X
                STAL  $010008,X
                TXA
                CLC
                ADC   #$00A0
                TAX
                DEY
                BPL   SAISIENETTOY1
                LDA   ADRE              ; TIRET ROUGE
                CLC
                ADC   #$0325
                TAX
                LDA   SAISIECOLOR
                AND   #$FF00
                STAL  $010000,X
                INX
                INX
                LDA   SAISIECOLOR
                STAL  $010000,X
                RTS
SAISIENETTOY2   LDA   ADRE              ; ENLEVE LE TIRET
                CLC
                ADC   #$0325
                TAX
                LDA   #$0000
                STAL  $010000,X
                INX
                INX
                STAL  $010000,X
                RTS

SAISIEAFFICH    LDA   SAISIEVALEUR
                STA   VALH
                PHX
                PHY
                JSR   TRANS
                PLY
                PLX
                RTS

SAISIE10FOIS    LDA   SAISIEVALEUR      ; *10
                LDY   #$0008
SAISIE11FOIS    CLC
                ADC   SAISIEVALEUR
                DEY
                BPL   SAISIE11FOIS
                STA   SAISIEVALEUR
                RTS

SAISIECOLOR     HEX   2222
SAISIEVALEUR    HEX   0000
SAISIEVALMIN    HEX   0000
SAISIEVALMAX    HEX   0000

*****************  EASTER EGGS  *******************

ECR0107         LDA   #ECR01070         ; WIN
                STA   SURFACE5+1
                JMP   SURFACE
ECR01070        LDA   #$0001
                JSR   EASTER
                LDA   #EATEXTE1
                LDX   #$77B9
                JSR   EASTERS           ; AFFICHE LIGNE
                JMP   CONTINUE

ECR0108         LDA   #ECR01080         ; BOMBE
                STA   SURFACE5+1
                JMP   SURFACE
ECR01080        LDA   #$0002
                JSR   EASTER
                LDA   #EATEXTE2
                LDX   #$7794
                JSR   EASTERS
                JMP   CONTINUE

ECR0109         LDA   #ECR01090         ; TETE MORT
                STA   SURFACE5+1
                JMP   SURFACE
ECR01090        LDA   #$0003
                JSR   EASTER
                LDA   #EATEXTE30
                LDX   #$77C5
                JSR   EASTERS
                LDA   #EATEXTE31
                LDX   #$7F0F
                JSR   EASTERS
                LDA   #EATEXTE32
                LDX   #$86AC
                JSR   EASTERS
                LDA   #EATEXTE33
                LDX   #$8E16
                JSR   EASTERS
                JMP   CONTINUE

ECR0110         LDA   #ECR01100         ; ECLAIR
                STA   SURFACE5+1
                JMP   SURFACE
ECR01100        LDA   #$0004
                JSR   EASTER
                LDA   #EATEXTE40
                LDX   #$77A3
                JSR   EASTERS
                LDA   #EATEXTE41
                LDX   #$7F11
                JSR   EASTERS
                JMP   CONTINUE

ECR0111         LDA   #ECR01110         ; LEMMING
                STA   SURFACE5+1
                JMP   SURFACE
ECR01110        LDA   #$0005
                JSR   EASTER
                LDX   #$001E            ; DEUXIEME PALETTE
ECR01111        LDA   PALETTELEMING,X
                STAL  $E19E20,X
                DEX
                DEX
                BPL   ECR01111
                LDX   #$001C            ; LES SCB
ECR01112        LDA   #$0101
                STAL  $E19D5B,X
                DEX
                DEX
                BPL   ECR01112
                LDA   #EATEXTE50
                LDX   #$778D
                JSR   EASTERS
                LDA   #EATEXTE51
                LDX   #$7F25
                JSR   EASTERS
                JMP   CONTINUE

PALETTELEMING   HEX   0000,0700,0902,1B04,6000,8000,980E,A90F,5206,C005,E005,A105,F10A,7408,960A,FF0F

ECR0112         LDA   #ECR01120         ; NFC
                STA   SURFACE5+1
                JMP   SURFACE
ECR01120        LDA   #$0006
                JSR   EASTER
                LDA   #EATEXTE60
                LDX   #$77B1
                JSR   EASTERS
                LDA   #EATEXTE61
                LDX   #$7F36
                JSR   EASTERS
                JMP   CONTINUE

ECR0113         LDA   #ECR01130         ; GS
                STA   SURFACE5+1
                JMP   SURFACE
ECR01130        LDA   #$0007
                JSR   EASTER
                LDA   #EATEXTE70
                LDX   #$77BF
                JSR   EASTERS
                LDA   #EATEXTE71
                LDX   #$7F2E
                JSR   EASTERS
                LDA   #EATEXTE72
                LDX   #$8695
                JSR   EASTERS
                JMP   CONTINUE

*******

CONTINUE        JSR   SBOUT             ; ATTEND BOUTON SOURIS
                LDX   #$007E
                LDA   #$0000
CONTINUE1       STAL  $E19E00,X
                DEX
                DEX
                BPL   CONTINUE1
                LDX   #$7CFE            ; POINTS
CONTINUE2       LDAL  $012000,X
                STAL  $012000,X
                DEX
                DEX
                BPL   CONTINUE2
                LDX   #$02FE            ; SCB+PALETTE
CONTINUE3       LDAL  $019D00,X
                STAL  $019D00,X
                DEX
                DEX
                BPL   CONTINUE3
                STZ   BOUT
                LDA   EAADRESSESVG
                STA   ABOUTR2+2         ; ADRESSE BUFFER...
                STA   ABOUTR4+2
                JMP   SOURIS

EASTER          DEC                     ; A: NUMERO EASTER
                ASL
                PHA
                TAX
                LDA   EASTERTABX,X
                DEC
                ASL
                STA   EASTERX
                LDA   EASTERTABY,X
                STA   EASTERY
                LDA   EASTERTABSPR,X
                STA   EASTER3+1
                LDA   EASTERTABSCR,X
                STA   EASTER4+1
                LDX   #$7FFE
                LDA   #$0000            ; IMAGE NOIRE
EASTER1         STAL  $E12000,X
                DEX
                DEX
                BPL   EASTER1
                LDY   EASTERY           ; COPIE SPRITE
EASTER2         LDX   EASTERX
EASTER3         LDAL  $20A0A0,X
EASTER4         STAL  $E12000,X
                DEX
                DEX
                BPL   EASTER3
                LDA   EASTER3+1
                CLC
                ADC   #$00A0
                STA   EASTER3+1
                LDA   EASTER4+1
                CLC
                ADC   #$00A0
                STA   EASTER4+1
                DEY
                BNE   EASTER2
                LDX   #$001E            ; MET LA PALETTE DU TEXTE
EASTER5         LDA   EASTERPALETTE,X
                STAL  $E19E60,X
                DEX
                DEX
                BPL   EASTER5
                LDX   #$0046            ; MET LES SCB TEXTE
                LDA   #$0303
EASTER6         STAL  $E19D79,X
                DEX
                DEX
                BPL   EASTER6
                PLA                     ; *32
                ASL
                ASL
                ASL
                ASL
                CLC
                ADC   #$001E
                TAY
                LDX   #$001E            ; PALETTE IMAGE
EASTER7         LDA   EASTERPALET,Y
                STAL  $E19E00,X
                DEY
                DEY
                DEX
                DEX
                BPL   EASTER7
                LDA   ABOUTR2+2         ; ADRESSE BUFFER...
                STA   EAADRESSESVG
                LDA   #$E120
                STA   ABOUTR2+2         ; ADRESSE BUFFER...
                STA   ABOUTR4+2
                RTS

EAADRESSESVG    HEX   0000
EASTERX         HEX   0000              ; LARGEUR*4
EASTERY         HEX   0000              ; HAUTEUR
EASTERTABX      HEX   0C00,0500,0500,0600,1300,1700,1200  ; LARGEUR
EASTERTABY      HEX   2C00,1500,1400,1700,4C00,1600,4800  ; HAUTEUR
EASTERTABSPR    HEX   0436,BF3B,BF4A,CB3B,FA39,ABBB,3BBB  ; ADRESSE SPRITE
EASTERTABSCR    HEX   C44F,2B5E,CB5E,E85C,BD3B,795D,3E3E  ; ADRESSE ECRAN
EASTERPALETTE   HEX   0000,0904,2206,0F09,020F,0F0B,4209,0F0F,6906,620B,9B09,940D,BD0B,B60F,D90F,DF0D

EASTERPALET     HEX   0000,7707,4108,2C07,1F01,8000,700F,000F,A90F,F00F,A000,DF04,AF0D,8F07,CC0C,FF0F
                HEX   0000,6904,9906,6604,4602,9B06,BB09,4402,0D00,FF0F,000D,6F09,9F06,BF04,DF02,FF00
                HEX   0000,6904,9906,6604,4602,9B06,BB09,4402,0D00,FF0F,000D,6F09,9F06,BF04,DF02,FF00
                HEX   0000,6904,9906,6604,4602,9B06,BB09,4402,0D00,FF0F,000D,6F09,9F06,BF04,DF02,FF00
                HEX   0000,0700,0902,1B04,6000,8000,980E,A90F,C70D,A50B,8309,6107,A80A,DF08,9E00,FF0F
                HEX   0000,0400,1601,2902,5D01,8F00,BF07,0000,2202,3303,4404,6606,9909,CC0C,DF0A,FF0F
                HEX   0000,1101,2202,3303,4404,5505,6606,7707,8808,9909,AA0A,BB0B,CC0C,DD0D,EE0E,FF0F

EATEXTE1        ASC   "JUST SAY... NO !",00
EATEXTE2        ASC   "CONVERT 3200 : THE NEW FRENCH BOMB  :-)",00
EATEXTE30       ASC   "DR TOM,",00
EATEXTE31       ASC   "YOU HAVE MODIFIED BILLE ART SCROLLING TEXT,",00
EATEXTE32       ASC   "IT WAS A BIG MISTAKE...",00
EATEXTE33       ASC   "TAKE YOUR SECTOR EDITOR AND GO AWAY !!",00
EATEXTE40       ASC   "CONVERT 3200 IS AS FAST AS...",00
EATEXTE41       ASC   "STRANGE !! I CAN'T FIND THE RIGHT WORD...",00
EATEXTE50       ASC   "IF YOU WANT TO SEE ME SOON ON YOUR COMPUTER,",00
EATEXTE51       ASC   "YOU SHOULD BUY CONVERT 3200.",00
EATEXTE60       ASC   "WE LOVE THE MEGADEMO",00
EATEXTE61       ASC   "NICE WORK GUYS !!",00
EATEXTE70       ASC   "1992 - 1995",00
EATEXTE71       ASC   "BRUTAL DELUXE SOFTWARE",00
EATEXTE72       ASC   "ALREADY 3 YEARS OF IIGS PROGRAMMING...",00
********

EASTERS         STA   EASTERS0+1        ; AFFICHE 1 LIGNE
                STX   ABOUTADR          ; A:MESSAGE,X:ADRESSE ECRAN
                LDY   #$0000
EASTERS0        LDA   ABOUTMES,Y
                AND   #$00FF
                BEQ   EASTERS4          ; 00 : FIN DE LIGNE
                STA   EASTERS2+1
                PHY                     ; SAUVEGARDE
                LDY   #$0031            ; 50 CARACTERES
EASTERS1        LDA   ABOUTALP,Y
                AND   #$00FF
EASTERS2        CMP   #$0000
                BEQ   EASTERS3
                DEY
                BPL   EASTERS1
                LDY   #$0025            ; PAS TROUVE, ON PREND LE FULL
EASTERS3        TYA
                ASL
                TAY
                LDA   ABOUTAB,Y         ; ADRESSE LETTRE
                STA   ABOUTR1+1
                CLC
                ADC   #$000A
                STA   ABOUTR3+1
                JSR   ABOUTR0           ; AFFICHE LE CARACTERE
                PLY
                INY
                BRA   EASTERS0          ; ON CONTINUE
EASTERS4        RTS

*****************  SCREEN SAVER  *******************

                PUT   CONVERT.SCRS      ; SCREEN SAVER

*****************************************************

