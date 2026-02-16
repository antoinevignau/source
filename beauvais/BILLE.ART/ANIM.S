*
* Animation thermometre
*
* (c) Zardos, 22/07/92
* v1.00 def
*

anim        clc
            XCE               ; 8 BIT
            SEP   #$30

            BIT   $C010
            LDA   #$A1
            STA   $C029
            STZ   $C035
            REP   #$30

            LDX   #$7FFE
COPIE       LDAL  $e12000,X   ; COPIE L'IMAGE POUR
            STAL  $012000,X   ; POUVOIR PLUSIEURS ESSAIS
            DEX
            DEX
            BPL   COPIE

            STZ   A1
            STZ   A2
            STZ   A3
            STZ   A4          ; ON INITIALISE
            STZ   AP1
            STZ   NP1
            STZ   AP2
            STZ   NP2

DEBUT       CLC
            XCE
            REP   #$30

R1          LDX   #$0000
            TXA
            CLC
            ADC   #$615d      ; 1ERE AVANCEE DE ROUGE
            STA   ANI7+1
            JSR   WAIT
            JSR   ANIL
            LDX   R1+1
            INX
            INX
            STX   R1+1
            CPX   #$0015
            BMI   R1
            JSR   ANIM2       ; PERSONNAGE DROITE

R2          LDX   #$0000
            TXA
            CLC
            ADC   #$617b      ; 2EME AVANCEE DE ROUGE
            STA   ANI7+1
            JSR   WAIT
            JSR   ANIL
            LDX   R2+1
            INX
            INX
            STX   R2+1
            CPX   #$0015
            BMI   R2
            JSR   ANIM4       ; VACHE
            JSR   WAIT

            LDA   #$0000
            STAL  $0156F0     ; POINT DU SPRITE A EFFACER
ANIP0       LDX   NP1         ; NOUVELLE POSITION
            LDA   TP1,X
            STA   ANIP1+1
            LDX   AP1         ; ANCIENNE POSITION
            LDA   TP1,X
            STA   ANIP2+1
            LDA   #$00E8      ; POINTS JAUNE-MARRON
ANIP1       STAL  $012000
            JSR   WAIT
            LDA   #$0000      ; NOIR = EFFACE
ANIP2       STAL  $012000
            LDA   NP1
            INC               ; NP1=NP1+2
            INC
            CMP   #$0032      ; 26 FOIS
            BPL   AN1
            STA   NP1
            LDA   AP1
            INC               ; AP1=AP1+2
            INC
            STA   AP1
            BRA   ANIP0
AN1         JSR   ANIM1

ANIP3       LDX   NP2         ; NOUVELLE POSITION
            LDA   TP2,X
            STA   ANIP4+1
            LDX   AP2         ; ANCIENNE POSITION
            LDA   TP2,X
            STA   ANIP5+1
            LDA   #$00E8      ; POINTS JAUNE-MARRON
ANIP4       STAL  $012000
            JSR   WAIT
            LDA   #$0000      ; NOIR = EFFACE
ANIP5       STAL  $012000
            LDA   NP2
            INC               ; NP2=NP2+2
            INC
            CMP   #$002C      ; 22 FOIS
            BPL   AN2
            STA   NP2
            LDA   AP2
            INC               ; AP2=AP2+2
            INC
            STA   AP2
            BRA   ANIP3
AN2         JSR   ANIM3
            JSR   WAIT
*
FIN         SEC
            XCE               ; 8 BIT
            SEP   #$30
            RTS

* Sous-routines

            CLC
            XCE
            REP   #$30

******** TETE EXPLOSION *************

ANIM1       LDA   A1          ; TETE
            ASL
            TAX
            LDA   TABLE1,X
            clc
            adc   #$8000
            STA   ANI1+1
            LDA   #$33A8      ; ECRAN LOCALISATION
            STA   ANI2+1
            JSR   ANIT        ; AFFICHAGE TETE

            LDA   A1
            CMP   #$0011      ; 18 ETAPES
            BPL   FIN1
            INC               ; IMAGE SUIVANTE
            STA   A1

            JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM1

FIN1        RTS

**************  PERSO DROITE *****************

ANIM2       LDA   A2          ; PERSO DROITE
            ASL
            TAX
            LDA   TABLE2,X
            clc
            adc   #$8000
            STA   ANI4+1
            LDA   #$5450      ; ECRAN LOCALISATION
            STA   ANI5+1
            JSR   ANIP        ; AFFICHAGE PERSO

            LDA   A2
            CMP   #$0007      ; 8 ETAPES
            BPL   FIN2
            INC               ; IMAGE SUIVANTE
            STA   A2

            JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM2

FIN2        RTS

**************  PERSO GAUCHE *****************

ANIM3       LDA   A3          ; PERSO GAUCHE
            ASL
            TAX
            LDA   TABLE3,X
            clc
            adc   #$8000
            STA   ANI4+1
            LDA   #$53FE      ; ECRAN LOCALISATION
            STA   ANI5+1
            JSR   ANIP        ; AFFICHAGE PERSO

            LDA   A3
            CMP   #$0007      ; 8 ETAPES
            BPL   FIN3
            INC               ; IMAGE SUIVANTE
            STA   A3

            JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM3

FIN3        RTS

**************  VACHE  *****************

ANIM4       LDA   A4          ; VACHE
            ASL
            TAX
            LDA   TABLE4,X
            clc
            adc   #$8000
            STA   ANI4+1
            LDA   #$5650      ; ECRAN LOCALISATION
            STA   ANI5+1
            JSR   ANIP        ; AFFICHAGE VACHE

            LDA   A4
            CMP   #$000A      ; 11 ETAPES
            BPL   FIN4
            INC               ; IMAGE SUIVANTE
            STA   A4

            JSR   WAIT        ; ROUTINE D'ATTENTE

            BRA   ANIM4

FIN4        RTS

************** ROUTINE D'AFFICHAGE N[1 ******************

ANIT        LDY   #$003E      ; HAUTEUR TETE MORT

ANI0        ldx   #$000E      ; LONGUEUR TETE DE MORT
ANI1        LDAL  $0E8000,x
ANI2        stal  $012000,x
            DEX
            DEX
            bpl   ANI1

            LDA   ANI1+1
            CLC
            ADC   #$00A0
            STA   ANI1+1
            LDA   ANI2+1
            CLC
            ADC   #$00A0
            STA   ANI2+1

            DEY
            DEY
            BPL   ANI0

            RTS

************* ROUTINE D'AFFICHAGE N[2 ****************

ANIP        LDY   #$004B      ; HAUTEUR PERSONNAGES

ANI3        ldx   #$000E      ; LONGUEUR PERSONNAGES
ANI4        LDAL  $0E8000,x
ANI5        stal  $012000,x
            DEX
            DEX
            bpl   ANI4

            LDA   ANI4+1
            CLC
            ADC   #$00A0
            STA   ANI4+1
            LDA   ANI5+1
            CLC
            ADC   #$00A0
            STA   ANI5+1

            DEY
            DEY
            BPL   ANI3

            RTS

***********  ROUTINE D'AFFICHAGE N[3  ****************

ANIL        LDY   #$000C      ; HAUTEUR TRACE=6

ANI6        LDA   #$7777      ; COULEUR ROUGE
ANI7        stal  $012000     ; DESTINATION ECRAN

            LDA   ANI7+1
            CLC
            ADC   #$00A0
            STA   ANI7+1

            DEY
            DEY
            BPL   ANI6

            RTS

**********************************************

TABLE1      HEX   410152016301740185019601A701B801C901
            HEX   81169216A316B416C516D616E716F8160917

TABLE2      HEX   C12BD22BE32BF42B052C162C272C382C

TABLE3      HEX   E35DF45D055E165E275E385E495E492C

TABLE4      HEX   C144D244E344F44405451645274538454945C15DD25D

TP1         HEX   0F55CD538C524A510950C74E854D434C
            HEX   014BBF497D483B47F845B5447243CF428C414940A73F
            HEX   043F613EBF3D1C3D793C753C

TP2         HEX   25456346A247E0481E4A5D4B9C4CDA4D194F57509651D552
            HEX   135452559156D0570F594E5A8D5BCC5C0B5E4A5F

A1          HEX   0000
A2          HEX   0000
A3          HEX   0000
A4          HEX   0000

LI          HEX   0000

AP1         HEX   0000
NP1         HEX   0000
AP2         HEX   0000
NP2         HEX   0000

**********************************************

WAIT        CLC
            XCE               ; 8 BIT
            SEP   #$30
*KBD LDA $C000
* BPL KBD
* BIT $C010
            LDA   #$DD
            JSR   $FCA8       ; ROUTINE ATTENTE
            CLC
            XCE               ; 16 BIT
            REP   #$30

            RTS

**********************************************

