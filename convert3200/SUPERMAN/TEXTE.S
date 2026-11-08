
                ORG   $0000
                LST   OFF

                DS    256

                PHK                     ; TRAVAIL AILLEURS QU'EN BANC 00
                PLB

                CLC
                XCE
                REP   #$30

                TAX                     ; A: CODE DE LA COMMANDE
                JMP   (TABLEINDEX,X)

TABLEINDEX      DA    FIRST,INIT,COULEURSUTIL,TRIPALETTE,REMAP,CALCULNBCL,FREQUENCE

********  RECOPIE DES EXE SOUS L'IMAGE + INIT MEMOIRE  *********

FIRST           TYA                     ; BANC CODE
                AND   #$FF00
                STA   FIRSTBANCCODE
                STA   INIT1+2
                ORA   #$0001
                STA   FIRST2+2
                STA   FIRST3+2

FIRST2          LDAL  $030110           ; BANC IMAGE 8 BIT
                AND   #$FF00
                STA   FIRSTBANCPICT
                STA   COULEURSUTIL02+2
                ORA   #$00FB
                STA   COULEURSUTIL00+2
                STA   REMAP2+2
                STA   CALCULNBCL1+2
                STA   FREQUENCE1+2

FIRST3          LDAL  $03010A           ; BANC CODE ANNEXE
                AND   #$FF00
                STA   FIRSTBANCHERE

                LDA   FIRSTBANCPICT     ; ON S'OCCUPE DES MVN
                XBA
                ORA   FIRSTBANCHERE
                STA   FIRST1+1
                STA   REMAP1+1
                XBA
                STA   COULEURSUTIL01+1

                LDA   FIRSTBANCCODE
                XBA
                ORA   FIRSTBANCHERE
                STA   TOTO00+1

                LDA   FIRSTBANCCODE
                XBA
                ORA   FIRSTBANCPICT
                STA   TOTO22+1
                STA   TOTO11+1


                LDX   #DEBUT+1          ; RECOPIE LES EXE SOUS L'IMAGE
                LDY   #$FB00
                LDA   #$01FF
FIRST1          MVN   $040000,$200000
                PHK
                PLB
                RTL

FIRSTBANCCODE   HEX   0000
FIRSTBANCPICT   HEX   0000
FIRSTBANCHERE   HEX   0000

***************  INIT DES TABLES/VALEURS  *************

INIT            STY   INIT1+1           ; Y : ADRESSE PALETTE ORIGINE
                LDX   #$01FE            ; RECOPIE LA PALETTE
INIT1           LDAL  $030A0A,X
                STA   PALETTEORIGINE,X
                DEX
                DEX
                BPL   INIT1

                LDX   #$1FFE            ; NETTOYAGE DES TABLES
                LDA   #$0000
NETTOY          STA   NBOCCURENCE,X
                DEX
                DEX
                BPL   NETTOY
                LDX   #$0000            ; INIT TABLE CORRESPONDANCE
                LDA   #$0000
INITRANSTAB1    STA   TRANSTABLE,X
                INC
                INX
                CPX   #$0100
                BNE   INITRANSTAB1
                STZ   NBCOULEURDESTI    ; VALEURS
                RTL

****************  CALCULE LE NB DE COULEURS UTILISEE *******************************

COULEURSUTIL    LDX   #$0000            ; COULEURS UTILISEES
COULEURSUTIL00  JSL   $20FB00
                PHK
                PLB

                LDX   #$FD00            ; RECUPERE LA TABLE
                LDY   #UTILTABLE
                LDA   #$00FF
COULEURSUTIL01  MVN   $200000,$040000
                PHK
                PLB

COULEURSUTIL02  LDAL  $200000           ; ON PREND 1 COULEUR VRAIEMENT UTILISEE
                AND   #$00FF            ; POUR MASQUER LES INUTILES
                ASL
                TAX
                LDA   PALETTEORIGINE,X
                STA   COULEURSUTIL3+1

                LDX   #$00FF
COULEURSUTIL2   LDA   UTILTABLE,X
                AND   #$00FF
                BNE   COULEURSUTIL4
                TXA
                ASL
                TAY
COULEURSUTIL3   LDA   #$A0A0
                STA   PALETTEORIGINE,Y
COULEURSUTIL4   DEX
                BPL   COULEURSUTIL2

                RTL

UTILTABLE       DS    256

**************  TRI PALETTE ET NETTOYAGE  *****************

TRIPALETTE      STY   TOTO+1            ; ADRESSE PALETTE
                LDY   #$01FE
TRAITEPALETTE   LDA   PALETTEORIGINE,Y
                ASL
                TAX
                LDA   NBOCCURENCE,X
                BNE   TRAITEPALETTE1    ; COULEUR DEJA UTILISEE
                TYA                     ; RESERVE LA CASE
                LSR
                XBA
                ORA   #$0001
                STA   NBOCCURENCE,X     ; Y PLACE LE FLAG ET LA VALEUR DE REF
                INC   NBCOULEURDESTI    ; ON COMPTE LE NOMBRE DE COULEUR VALIDE
                BRA   TRAITEPALETTE3
TRAITEPALETTE1  AND   #$FF00            ; CONSERVE LA VALEUR DE REF
                XBA
                STA   TRAITEPALETTE2+1
                TYA
                LSR
                TAX
                LDA   TRANSTABLE,X      ; PLACE CETTE VALEUR DANS LA TABLE DE REMAP
                AND   #$FF00            ; EN FACE DE LA VALEUR EN DOUBLE
TRAITEPALETTE2  ORA   #$00A0
                STA   TRANSTABLE,X
TRAITEPALETTE3  DEY
                DEY
                BPL   TRAITEPALETTE

                LDX   #$1FFE            ; PARCOURS LA TABLE POUR EXTRAIRE COULEURS
                LDA   NBCOULEURDESTI
                DEC
                ASL
                TAY
PARCOURSPALET   LDA   NBOCCURENCE,X
                BEQ   PARCOURSPALET3
                PHX
                AND   #$FF00            ; ON EXTRAIT LA VALEUR DE CORRESPONDANCE
                XBA                     ; ET ON REMPLI LA TABLE DE TRANSLATION 2
                TAX
                TYA
                LSR
                STA   PARCOURSPALET2+1
                LDA   TRANSTABLE2,X
                AND   #$FF00
PARCOURSPALET2  ORA   #$00A0
                STA   TRANSTABLE2,X
                PLX                     ; ON PLACE LA VALEUR RVB DANS LA PALETTE
                TXA
                LSR
                STA   PALETTEDESTINA,Y
                DEY
                DEY
PARCOURSPALET3  DEX
                DEX
                BPL   PARCOURSPALET

                CLC
                XCE                     ; 8 BIT
                SEP   #$30
                LDX   #$00
CREATABLETRANS  LDA   TRANSTABLE,X      ; CREATION FINALE DE LA TABLE DE TRANSLATION
                TAY
                LDA   TRANSTABLE2,Y
                STA   TRANSTABLE,X
                INX
                BNE   CREATABLETRANS
                CLC
                XCE                     ; 16 BIT
                REP   #$30

                LDX   #PALETTEDESTINA   ; RECOPIE DE LA PALETTE TRIEE
TOTO            LDY   #$A0A0
                LDA   #$01FF
TOTO00          MVN   $040000,$030000
                PHK
                PLB

                LDA   NBCOULEURDESTI
                RTL

NBCOULEURDESTI  HEX   0000              ; NOMBRE DE COULEUR DE LA ZONE

PALETTEORIGINE  DS    256*2             ; PALETTE 0RVB ORIGINALE
PALETTEDESTINA  DS    256*2             ; PALETTE TRIEE

NBOCCURENCE     DS    4096*2            ; NB D'OCCURENCE DE CHAQUE TEINTE RVB,
                                        ; VALEUR DE REFERENCE ASSOCIEE

**************  REMAPPING AVEC TABLE DE CORRESPONDANCE  ************

REMAP           LDX   #TRANSTABLE       ; COPIE LA TABLE DE TRANSLATION
                LDY   #$FD00
                LDA   #$00FF
REMAP1          MVN   $040000,$200000
                PHK
                PLB

                LDX   #$0002
REMAP2          JSL   $20FB00           ; REMAP PICTURE
                PHK
                PLB

                RTL

TRANSTABLE      DS    257               ; TABLE EQUIVALENCE POUR LE REMAPING
TRANSTABLE2     DS    257

*****************  CALCUL NOMBRE COULEUR/LIGNE  ********************

CALCULNBCL      STY   TOTO1+1           ; SPECTRE NOMBRE COULEUR/LIGNE
                LDX   #$0006
CALCULNBCL1     JSL   $20FB00
                PHK
                PLB

                LDX   #$FD00            ; RAPATRIE LA TABLE (Y:BANC ORIGI,A FAIRE)
TOTO1           LDY   #$A0A0
                LDA   #$00C7            ; 200 LIGNES
TOTO11          MVN   $200000,$030000
                PHK
                PLB

                RTL

*****************  FREQUENCE D'UTILISATION DES COULEURS  *************

FREQUENCE       STY   TOTO2+1
                LDX   #$0008
FREQUENCE1      JSL   $20FB00
                PHK
                PLB

                LDX   #$FD00            ; RAPATRIE LA TABLE (Y:BANC ORIG,A FAIRE)
TOTO2           LDY   #$A0A0
                LDA   #$01FF            ; 256*2 COULEURS
TOTO22          MVN   $200000,$030000
                PHK
                PLB

                RTL

***************** A DEPLACER SOUS L'IMAGE **************************

DEBUT           NOP
                ORG   $FB00

CHOIXEXEC       PHK                     ; X = CODE DE L'EXE
                PLB
                JMP   (TABLEEXE,X)

TABLEEXE        DA    COULEURSUTILES,REMAPZONE,REMAPLINE,NBCL,FREQCOUL
*****

COULEURSUTILES  LDX   #$00FE            ; COULEURS UTILISEES
                LDA   #$0000
COULEURSUTIL0   STA   $FD00,X           ; UTILTABLE
                DEX
                DEX
                BPL   COULEURSUTIL0

                LDA   #$0000
                CLC
                XCE
                SEP   #$30
                CLC
                XCE
                REP   #$10
                LDY   #$0000
                LDX   #$0000
COULEURSUTIL1   LDA\  $0000,X
                TAY
                LDA   #$01
                STA   $FD00,Y           ; UTILTABLE
                INX
                CPX   #$FA00
                BNE   COULEURSUTIL1
                CLC
                XCE                     ; FULL 16 BIT
                REP   #$30
                RTL
*****

REMAPZONE       LDA   #$0000            ; PREVENTIF POUR LE TYA
                CLC                     ; REMAP IMAGE ENTIERE
                XCE
                SEP   #$30
                CLC
                XCE
                REP   #$10              ; A 8 BIT, X ET Y 16 BIT
                LDY   #$0000
                LDX   #$F9FF
REMAPZONE1      LDA\  $0000,X
                TAY
                LDA   $FD00,Y           ; TRANSTABLE
                STA\  $0000,X
                DEX
                BNE   REMAPZONE1
                LDA\  $0000             ; CAS DU 1er OCTET
                TAY
                LDA   $FD00,Y           ; TRANSTABLE
                STA\  $0000
                CLC
                XCE                     ; FULL 16 BIT
                REP   #$30
                RTL
*****

REMAPLINE       STA   REMAPLINE1+1      ; REMAP 1 LIGNE ENTIERE
                STA   REMAPLINE2+1
                LDA   #$0000            ; PREVENTIF POUR LE TYA
                CLC
                XCE
                SEP   #$30
                CLC
                XCE
                REP   #$10              ; A 8 BIT, X ET Y 16 BIT
                LDY   #$0000
                LDX   #$013E
REMAPLINE1      LDA\  $0000,X
                TAY
                LDA   $FD00,Y           ; TRANSTABLE
REMAPLINE2      STA\  $0000,X
                DEX
                BPL   REMAPLINE1
                CLC
                XCE                     ; FULL 16 BIT
                REP   #$30
                RTL
*****

NBCL            LDX   #$00FE            ; CALCUL LE NB DE COULEUR/LIGNE
                LDA   #$0000
NBCL1           STA   $FD00,X           ; NETTOYAGE PRELIMINAIRE
                STA   $FE00,X
                DEX
                DEX
                BPL   NBCL1

                STA   NBCL2+1           ; INIT NUMERO LIGNE
                STA   NUMEROLIGNE
NBCL0           CLC
                XCE
                SEP   #$30
                CLC
                XCE                     ; A 8 BIT, X Y 16 BIT
                REP   #$10
                LDX   #$0000
                LDY   #$013F
NBCL2           LDA\  $0000,Y
                TAX
                LDA   #$01
                STA   $FE00,X
                DEY
                BPL   NBCL2
                LDY   #$0000
                LDX   #$00FF
NBCL3           LDA   $FE00,X
                BEQ   NBCL4
                INY
                STZ   $FE00,X           ; ON NETTOY AU PASSAGE
NBCL4           DEX
                BPL   NBCL3
                CLC
                XCE                     ; 16 BIT
                REP   #$30
                LDA   NBCL2+1
                CLC
                ADC   #$0140
                STA   NBCL2+1
                LDX   NUMEROLIGNE
                TYA                     ; NB COULEURS SUR LA LIGNE
                STA   $FD00,X
                INX
                STX   NUMEROLIGNE
                CPX   #$00C8            ; 200 LIGNES
                BNE   NBCL0
                RTL

NUMEROLIGNE     HEX   0000

*****

FREQCOUL        LDX   #$01FE            ; FREQUENCE UTILISATION COULEUR
                LDA   #$0000
FREQCOUL1       STA   $FD00,X           ; NETTOYAGE
                DEX
                DEX
                BPL   FREQCOUL1

                LDY   #$F9FF
FREQCOUL2       LDA\  $0000,Y
                AND   #$00FF
                ASL
                TAX
                INC   $FD00,X
                DEY
                BNE   FREQCOUL2
                LDA\  $0000             ; CAS PARTICULIER 0
                AND   #$00FF
                ASL
                TAX
                INC   $FD00,X
                RTL
******

