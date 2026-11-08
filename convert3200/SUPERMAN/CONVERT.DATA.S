
************  BUMPER MANAGER  ************  PAVE

BUMPER        LDA       FLAGTAB,X
              BEQ       BUMPER2
              LDA       BOUT
              BEQ       BUMPER1
BUMPER0       JMP       SOURIS
BUMPER1       STZ       FLAGTAB,X            ; RELEVE LE BUMPER ET EFFECTUE LE TRAITEMENT
              STZ       BMPFLG
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
BUMPER5       JMP       $FFFF                ; TRAITEMENT A EFFECTUER
BUMPER2       STX       BUMPER4+1            ; SAUVEGARDE TEMPORAIRE DE X
              LDA       BMPFLG
              BEQ       BUMPER3
              LDX       LAST                 ; FORCE LE REMONTEE DE L'ANCIEN
              STZ       FLAGTAB,X
              STZ       BMPFLG
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
BUMPER3       LDA       BOUT
              BEQ       BUMPER0              ; JMP SOURIS
BUMPER4       LDX       #$FFFF               ; RECUPERE LA VALEUR DE X PERTURBEE PAR LA REMONTE FORCEE
              STX       LAST                 ; ENFONCE LE BUMPER SUR LEQUEL ON SE TROUVE
              LDA       #$0001
              STA       BMPFLG
              STA       FLAGTAB,X
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRE
              JSR       SAUV
              JMP       SOURIS1

**********  BOMPER MANAGER  ***********  FLECHE

BOMPER        LDA       FLAGTAB,X
              BEQ       BOMPER2
              LDA       BOUT
              BEQ       BOMPER1
              LDY       BTEMPO               ; TEMPO POUR LA SOURIS
BOMPER6       NOP
              NOP
              NOP
              NOP
              NOP
              DEY
              BNE       BOMPER6
BOMPER5       JMP       $FFFF                ; TRAITEMENT A EFFECTUER
BOMPER1       STZ       FLAGTAB,X            ; RELEVE LE BOMPER ET EFFECTUE LE TRAITEMENT
              STZ       BMPFLG
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
              JMP       SOURIS1
BOMPER2       STX       BOMPER4+1            ; SAUVEGARDE TEMPORAIRE DE X
              LDA       BMPFLG
              BEQ       BOMPER3
              LDX       LAST                 ; FORCE LE REMONTEE DE L'ANCIEN
              STZ       FLAGTAB,X
              STZ       BMPFLG
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
BOMPER3       LDA       BOUT
              BEQ       BOMPER0              ; JMP SOURIS
BOMPER4       LDX       #$FFFF               ; RECUPERE LA VALEUR DE X PERTURBEE PAR LA REMONTE FORCEE
              STX       LAST                 ; ENFONCE LE BOMPER SUR LEQUEL ON SE TROUVE
              LDA       #$0001
              STA       BMPFLG
              STA       FLAGTAB,X
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRE
              JSR       SAUV
              JMP       SOURIS1
BOMPER0       JMP       SOURIS

BTEMPO        HEX       0050                 ; TEMPO SOURIS

************  BOUTON MANAGER  ************  ROND ROUGE

BOUTON        LDA       BMPFLG
              BEQ       BOUTON1
              LDX       LAST                 ; ON FORCE SA RELEVE
              STZ       BMPFLG
              STZ       FLAGTAB,X
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
              JMP       SOURIS1
BOUTON1       LDA       FLAGTAB1,X           ; PAS FORCEMENT INDISPENSABLE (PERMET D'EVITER DE REAFFICHER)
              BEQ       BOUTON2              ; DEJA ENFONCE
BOUTON0       JMP       SOURIS
BOUTON2       LDA       BOUT
              BEQ       BOUTON0              ; JMP SOURIS
              JSR       CLNFLAG
              LDA       #$0002               ; ON EFFACE LES AUTRES ET ON AFFICHE CELUI LA
              STA       FLAGTAB1,X           ; ON EFFECTUE ENSUITE LE TRAITEMENT
              JSR       DESS1
              JSR       CLNBMP
              JSR       AFFSPRE
              JSR       SAUV
BOUTON3       JMP       $FFFF                ; TRAITEMENT A EFFECTUER

************  BOOTON ON/OFF MANAGER  ************  ROND ROUGE ON/OFF

BOOTON        LDA       BMPFLG
              BEQ       BOOTON1
              LDX       LAST                 ; ON FORCE SA RELEVE
              STZ       BMPFLG
              STZ       FLAGTAB,X
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
              JMP       SOURIS1
BOOTON4       LDA       #$0001               ; PASSAGE LIBERE
              STA       BOOTONFL
BOOTON0       JMP       SOURIS
BOOTON1       LDA       BOUT                 ; ON TESTE LE BOUTON DE LA SOURIS
              BEQ       BOOTON4
              LDA       BOOTONFL             ; PEUT ON PASSER ? (01:OUI, 00:NON)
              BEQ       BOOTON0
              STZ       BOOTONFL             ; PASSAGE BLOQUE
              JSR       DESS1
BOOTON2       LDA       $FFFF                ; NUMERO DU BOUT ACTIF (0000=ACTIF, FFFF=NON ACTIF)
              BEQ       BOOTON3
              LDA       #$0000               ; ON ACTIVE
              LDY       #$8B79               ; ADRESSE SPRITE ENFONCE
              BRA       BOOTON5              ; TRAITEMENT
BOOTON3       LDA       #$FFFF               ; ON DESACTIVE
              LDY       #$0B79               ; ADRESSE SPRITE RELEVE
BOOTON5       JMP       $FFFF                ; TRAITEMENT A EFFECTUER
BOOTONFL      HEX       0100                 ; FLAG

************* SURFACE MANAGER *************  ZONE D'ECRAN

SURFACE       LDA       BMPFLG               ; X CONTIENT LE NUMERO DU BOUTON
              BEQ       SURFACE1
              LDX       LAST                 ; ON FORCE SA RELEVE
              STZ       BMPFLG
              STZ       FLAGTAB,X
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
              JMP       SOURIS1
SURFACE1      LDA       BOUT
              BEQ       SURFACE2
SURFACE5      JMP       $FFFF                ; TRAITEMENT A EFFECTUER
SURFACE2      JMP       SOURIS

******** TRAITEMENT PAR DEFAUT *********

BUMPDEF       LDA       #$0001
              STA       BOOTONFL             ; PASSAGE AUTORISE POUR BOOTON
              LDA       BMPFLG
              BEQ       BUMPDEF1
              LDX       LAST                 ; FORCE LE REMONTEE DE L'ANCIEN
              STZ       FLAGTAB,X
              STZ       BMPFLG
              STX       SECR2+1
              JSR       DESS1
              JSR       AFFSPRR
              JSR       SAUV
              JMP       SOURIS1
BUMPDEF1      JMP       SOURIS

**********************************************

              HEX       0D00                 ; MAIN   NB DE BOUTONS DANS ECRAN1
ECR01TAB      HEX       1000,4900,2E00,3C00  ; LOAD   TABLEAU DES BOUTONS POUR ECRAN1
              HEX       4E00,8500,2E00,3C00  ; SAVE   X0,X1 Y0,Y1
              HEX       B200,2701,2E00,3C00  ; SELECT
              HEX       0F00,8400,7300,8100  ; CONVERT
              HEX       B200,2701,7300,8100  ; STATIST
              HEX       0F00,8400,BA00,C800  ; OPTIONS
              HEX       B200,2701,BA00,C800  ; DOC
              HEX       5900,6100,1F00,2100  ; EASTER EGG
              HEX       D900,DC00,1E00,2100  ; EASTER EGG
              HEX       6300,6500,5C00,5E00  ; EASTER EGG
              HEX       C700,CA00,6800,6B00  ; EASTER EGG
              HEX       4200,4600,9700,9E00  ; EASTER EGG
              HEX       0501,0801,A400,A700  ; EASTER EGG

ECR01DAT      HEX       0E00,0E00,C83C,C21D  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0E00,0E00,E63C,E21D
              HEX       1D00,0E00,193D,A201
              HEX       1E00,0E00,E767,2227
              HEX       1D00,0E00,3968,020B
              HEX       1E00,0E00,4794,8230
              HEX       1D00,0E00,9994,6214

ECR02TAB      NOP                            ; OPEN
ECR02DAT      NOP
ECR03TAB      NOP                            ; SAVE
ECR03DAT      NOP

              HEX       0E00                 ; SELECT
ECR04TAB      HEX       3200,4000,6200,6A00  ; FULL SCR
              HEX       3200,4000,7600,7E00  ; POURCENT
              HEX       3200,4000,9100,9900  ; SIZE
              HEX       F200,FD00,7500,7E00  ; HORI +
              HEX       0101,0C01,7500,7E00  ; HORI -
              HEX       F200,FD00,8100,8A00  ; VERT +
              HEX       0101,0C01,8100,8A00  ; VERT -
              HEX       1300,7200,B800,C600  ; SELECT
              HEX       8A00,DF00,B800,C600  ; VIEW
              HEX       F600,2D01,B800,C600  ; EXIT
              HEX       C100,E000,9100,9800  ; SURFACE HORI SIZE
              HEX       C100,E000,9D00,A400  ; SURFACE VERT SIZE
              HEX       C100,D800,7600,7D00  ; SURFACE HORI POURCENT
              HEX       C100,D800,8200,8900  ; SURFACE VERT POURCENT

ECR04DAT      HEX       0400,0800,595D,AD70  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0400,0800,D969,AD70
              HEX       0400,0800,B97A,AD70
              HEX       0300,0900,9969,FF6F  ; HORI +
              HEX       0300,0900,A069,0670
              HEX       0300,0900,1971,3F76
              HEX       0300,0900,2071,4676
              HEX       1800,0E00,0993,8266  ; SELECT
              HEX       1500,0E00,4593,225D
              HEX       0E00,0E00,7B93,E26F  ; EXIT

              HEX       0F00                 ; CONVERT
ECR05TAB      HEX       9000,9E00,2300,2B00  ; 3200
              HEX       9000,9E00,2E00,3600  ; 256
              HEX       9000,9E00,3900,4100  ; 16 COLOR
              HEX       9000,9E00,4400,4C00  ; 16 GREY
              HEX       9000,9E00,4F00,5700  ; PRINT SHOP GS
              HEX       9000,9E00,5A00,6200  ; ALL
              HEX       9000,9E00,6500,6D00  ; NONE
              HEX       9000,9E00,7C00,8400  ; RED
              HEX       9000,9E00,8700,8F00  ; GREY
              HEX       B300,BE00,9A00,A300  ; +
              HEX       C200,CD00,9A00,A300  ; -
              HEX       D500,2901,9700,A500  ; VIEW AREA
              HEX       0C00,7500,B800,C600  ; CONVERT AREA
              HEX       8400,ED00,B800,C600  ; CONVERT LINE
              HEX       FC00,3301,B800,C600  ; EXIT

ECR05DAT      HEX       0400,0800,2836,5F15  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0400,0800,083D,5F15
              HEX       0400,0800,E843,5F15
              HEX       0400,0800,C84A,5F15
              HEX       0400,0800,A851,5F15
              HEX       0400,0800,8858,5F15  ; ALL
              HEX       0400,0800,685F,5F15  ; NONE
              HEX       0400,0800,C86D,5F15
              HEX       0400,0800,A874,5F15
              HEX       0300,0900,9980,6815  ; +
              HEX       0300,0900,A180,6F15
              HEX       1500,0E00,CA7E,421F
              HEX       1A00,0E00,0693,4201
              HEX       1A00,0E00,4293,420B
              HEX       0E00,0E00,7E93,4215  ; EXIT

              HEX       0500                 ; STATISTICS
ECR06TAB      HEX       D400,3501,3000,3E00  ; VIEW COLORS
              HEX       D400,3501,4800,5600  ; VIEW COLORS
              HEX       C000,1D01,6000,6E00  ; VIEW TABLE
              HEX       B900,2301,7800,8600  ; VIEW SPECTRE
              HEX       FC00,3301,9A00,A800  ; EXIT

ECR06DAT      HEX       1800,0E00,6A3E,6F73  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       1800,0E00,6A4D,6F73
              HEX       1700,0E00,605C,D869
              HEX       1B00,0E00,5C6B,3873
              HEX       0E00,0E00,BE80,0F6A

              HEX       1300                 ; OPTIONS
ECR07TAB      HEX       0A00,1800,3500,3D00  ; CONVERT ALL
              HEX       EB00,3501,3300,4100  ; LET'S GO
              HEX       0A00,1800,4300,4B00  ; QUICK MOUSE
              HEX       0A00,1800,5100,5900  ; CONVERT SOMME
              HEX       FC00,3301,9A00,A800  ; EXIT
              HEX       1601,2101,5100,5A00  ; FROM +
              HEX       2501,3001,5100,5A00  ; FROM -
              HEX       1601,2101,5D00,6600  ; TO +
              HEX       2501,3001,5D00,6600  ; TO -
              HEX       0A00,1800,6C00,7400  ; UNCONVERT
              HEX       BE00,C900,6C00,7500  ; UN +
              HEX       CD00,D800,6C00,7500  ; UN -
              HEX       0A00,1800,7C00,8400  ; TRUE COLOR
              HEX       F400,2C01,7900,8700  ; VIEW TRUE
              HEX       0B00,4400,9A00,A800  ; ABOUT
              HEX       0000,0C00,BE00,C900  ; SCRIPT EDITOR (SURFACE)
              HEX       F100,0801,5200,5900  ; FROM SURFACE
              HEX       F100,0801,5E00,6500  ; TO   SURFACE
              HEX       7B00,8100,4500,4A00  ; EASTER EGG

ECR07DAT      HEX       0400,0800,2541,790B  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       1300,0E00,5540,7901
              HEX       0400,0800,E549,790B
              HEX       0400,0800,A552,790B
              HEX       0E00,0E00,BE80,E30A
              HEX       0300,0900,2B53,FF6F  ; FROM +
              HEX       0300,0900,3253,0670
              HEX       0300,0900,AB5A,FF6F
              HEX       0300,0900,B25A,0670
              HEX       0400,0800,8563,790B  ; UNCONVERT
              HEX       0300,0900,DF63,FF6F
              HEX       0300,0900,E663,0670
              HEX       0400,0800,856D,790B  ; TRUE COLOR
              HEX       0E00,0E00,1A6C,5D21
              HEX       0F00,0E00,4580,1B5E  ; ABOUT

              HEX       0600                 ; DOCU
ECR08TAB      HEX       3C00,4C00,B600,BF00  ; I <-
              HEX       5B00,6800,B600,BF00  ; <-
              HEX       8C00,9900,B600,BF00  ; ->
              HEX       A800,B800,B600,BF00  ; -> I
              HEX       7700,7D00,B800,BD00  ; POINT
              HEX       F500,3201,B400,C100  ; EXIT

ECR08DAT      HEX       0400,0900,DE91,622C  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0400,0900,ED91,6C2C
              HEX       0400,0900,0692,7C2C
              HEX       0400,0900,1492,862C
              HEX       0200,0500,3B93,562E  ; POINT
              HEX       1000,0D00,FA90,502B

              HEX       0A00                 ; LINE
ECR09TAB      HEX       1100,1D00,BB00,C500  ; <-
              HEX       2900,3500,BB00,C500  ; ->
              HEX       2000,2600,BD00,C300  ; POINT
              HEX       C200,CA00,BA00,C000  ; SCR UP
              HEX       C200,CA00,C000,C600  ; SCR DOWN
              HEX       D300,DE00,B200,BC00  ; +
              HEX       E200,ED00,B200,BC00  ; -
              HEX       0201,3901,B400,C300  ; EXIT
              HEX       0600,3C01,0100,A300  ; SURFACE : CHOIX D'UNE TEINTE
              HEX       D400,EB00,A800,AF00  ; SURFACE LINE

ECR09DAT      HEX       0300,0900,E894,8248  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0300,0900,F494,9048
              HEX       0200,0500,3096,CA49
              HEX       0200,0500,A194,4949  ; SCR UP
              HEX       0200,0500,6198,094D
              HEX       0300,0900,A98F,E251
              HEX       0300,0900,B18F,EA51
              HEX       0E00,0E00,0191,B450  ; EXIT

              HEX       0300                 ; COLORS 1
ECR10TAB      HEX       5100,5900,B500,BA00  ; SCR UP
              HEX       5100,5900,BB00,C000  ; SCR DOWN
              HEX       FA00,3101,B400,C200  ; EXIT

ECR10DAT      HEX       0200,0500,4891,BE16  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0200,0500,0895,7E1A
              HEX       0E00,0E00,FD90,C316

              HEX       0300                 ; COLORS 2
ECR11TAB      HEX       5100,5900,B500,BA00  ; SCR UP
              HEX       5100,5900,BB00,C000  ; SCR DOWN
              HEX       FA00,3101,B400,C200  ; EXIT

ECR11DAT      HEX       0200,0500,4891,BE16  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0200,0500,0895,7E1A
              HEX       0E00,0E00,FD90,C316

              HEX       0500                 ; NBCL
ECR12TAB      HEX       1C01,2601,3000,3800  ; UP
              HEX       2A01,3401,3000,3800  ; DOWN
              HEX       F100,3901,7B00,9200  ; CONVERT LINE
              HEX       FA00,3101,B000,BE00  ; EXIT
              HEX       0000,E700,0000,C800  ; SURFACE POUR SELECTION LIGNE

ECR12DAT      HEX       0300,0800,8E3E,6236  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0300,0800,953E,6936
              HEX       1200,1700,586D,7F36
              HEX       0E00,0E00,7D8E,023C

              HEX       0D00                 ; PALETTE
ECR13TAB      HEX       1100,1D00,BB00,C400  ; <-
              HEX       2900,3500,BB00,C400  ; ->
              HEX       2000,2600,BD00,C200  ; POINT
              HEX       C400,CC00,B500,BA00  ; R : UP
              HEX       C400,CC00,BC00,C100  ; R : DOWN
              HEX       D200,DA00,B500,BA00  ; V : UP
              HEX       D200,DA00,BC00,C100  ; V : DOWN
              HEX       E000,E800,B500,BA00  ; B : UP
              HEX       E000,E800,BC00,C100  ; B : DOWN
              HEX       3301,3B01,A700,AC00  ; SCR UP
              HEX       3301,3B01,AD00,B200  ; SCR DOWN
              HEX       FA00,3101,B500,C300  ; EXIT
              HEX       0600,3C01,0100,A200  ; SURFACE : CHOIX D'UNE TEINTE

ECR13DAT      HEX       0300,0900,E894,7860  ; LONGUEUR (*4),HAUTEUR,@ ECRAN,@ SPRITE
              HEX       0300,0900,F494,8460
              HEX       0200,0500,3096,BF61
              HEX       0200,0500,8291,EB5F
              HEX       0200,0500,E295,AB63
              HEX       0200,0500,8991,F05F
              HEX       0200,0500,E995,B063
              HEX       0200,0500,9091,F55F
              HEX       0200,0500,F095,B563  ; B : DOWN
              HEX       0200,0500,F988,F555
              HEX       0200,0500,B98C,555A
              HEX       0E00,0E00,9D91,3855

******************************

ECRTAB        DA        ECR01TAB,ECR02TAB,ECR03TAB,ECR04TAB  ; ADRESSES DES TABLEAUX
              DA        ECR05TAB,ECR06TAB,ECR07TAB,ECR08TAB
              DA        ECR09TAB,ECR10TAB,ECR11TAB,ECR12TAB
              DA        ECR13TAB
ECRDAT        DA        ECR01DAT,ECR02DAT,ECR03DAT,ECR04DAT  ; ADRESSE DES DONNEES BUMPERS
              DA        ECR05DAT,ECR06DAT,ECR07DAT,ECR08DAT
              DA        ECR09DAT,ECR10DAT,ECR11DAT,ECR12DAT
              DA        ECR13DAT
ECRDESA       DA        ECRDES1,ECRDES2,ECRDES3,ECRDES4  ; ADRESSE POUR LES DESTINATIONS
              DA        ECRDES5,ECRDES6,ECRDES7,ECRDES8
              DA        ECRDES9,ECRDES10,ECRDES11,ECRDES12
              DA        ECRDES13

ECRDES1       DA        ECR0100,ECR0101,ECR0102,ECR0103,ECR0104  ; MAIN : ADRESSES DES DESTINATIONS
              DA        ECR0105,ECR0106,ECR0107,ECR0108,ECR0109
              DA        ECR0110,ECR0111,ECR0112
ECRDES2       NOP                            ; ECRAN2 : OPEN
ECRDES3       NOP                            ; ECRAN3 : SAVE
ECRDES4       DA        ECR0400,ECR0401,ECR0402,ECR0403,ECR0404  ; ECRAN4 : SELECT
              DA        ECR0405,ECR0406,ECR0407,ECR0408,ECR0409
              DA        ECR0410,ECR0411,ECR0412,ECR0413
ECRDES5       DA        ECR0500,ECR0501,ECR0502,ECR0503,ECR0504  ; ECRAN5 : CONVERT
              DA        ECR0505,ECR0506,ECR0507,ECR0508,ECR0509
              DA        ECR0510,ECR0511,ECR0512,ECR0513,ECR0514
ECRDES6       DA        ECR0600,ECR0601,ECR0602,ECR0603,ECR0604  ; ECRAN6 : STATISTIC
ECRDES7       DA        ECR0700,ECR0701,ECR0703,ECR0704,ECR0702  ; ECRAN7 : OPTIONS
              DA        ECR0705,ECR0706,ECR0707,ECR0708,ECR0709
              DA        ECR0710,ECR0711,ECR0712,ECR0713,ECR0714
              DA        ECR0715,ECR0716,ECR0717,ECR0113
ECRDES8       DA        ECR0800,ECR0801,ECR0802,ECR0803,ECR0804  ; ECRAN8 : DOCUMENTATION
              DA        ECR0805
ECRDES9       DA        ECR0900,ECR0901,ECR0902  ; ECRAN9 : LINE
              DA        ECR0905,ECR0906,ECR0907,ECR0908,ECR0909
              DA        ECR090A,ECR090B
ECRDES10      DA        ECR1000,ECR1001,ECR1002  ; COLORS 1
ECRDES11      DA        ECR1100,ECR1101,ECR1102  ; COLORS 2
ECRDES12      DA        ECR1200,ECR1201,ECR1202,ECR1203,ECR1204  ; NBCL
ECRDES13      DA        ECR1300,ECR1301,ECR1302,ECR1303,ECR1304  ; PALETTE
              DA        ECR1305,ECR1306,ECR1307,ECR1308,ECR1309
              DA        ECR1310,ECR1311,ECR1312

*********************  SOUS ROUTINES SOURIS  **************************

DEC           HEX       000000000000         ; DECOR SOUS LE POINTEUR
              HEX       000000000000
              HEX       000000000000
              HEX       000000000000
              HEX       000000000000
              HEX       000000000000

PTPAI         HEX       FFFFFFFF0000
              HEX       0F00000F0000         ; POINTEUR POSITION PAIRE
              HEX       00F000F00000
              HEX       000F00F00000
              HEX       0000FF000000
              HEX       00000F000000

PTPAIMA       HEX       00000000FFFF
              HEX       F0000000FFFF         ; MASQUE POSITION PAIRE
              HEX       FF00000FFFFF
              HEX       FFF0000FFFFF
              HEX       FFFF00FFFFFF
              HEX       FFFFF0FFFFFF

PTIMP         HEX       0FFFFFFFF000
              HEX       00F00000F000         ; POINTEUR POSITION IMPAIRE
              HEX       000F000F0000
              HEX       0000F00F0000
              HEX       00000FF00000
              HEX       000000F00000

PTIMPMA       HEX       F00000000FFF
              HEX       FF0000000FFF         ; MASQUE POSITION IMPAIRE
              HEX       FFF00000FFFF
              HEX       FFFF0000FFFF
              HEX       FFFFF00FFFFF
              HEX       FFFFFF0FFFFF

POSX          HEX       0000                 ; 0-312
POSY          HEX       0000                 ; 0-194
A1            HEX       0000                 ; POSITION ACTUELLE
AP            HEX       0000                 ; ANCIENNE POSITION
ECRAN         HEX       0100                 ; ECRAN 1,2,3...
GO            HEX       0000                 ; CONTIENT LE NUMERO DU BOUTON ENFONCE (A RELACHER)
LAST          HEX       0000                 ; DERNIER BUMPER ENFONCE
BMPFLG        HEX       0000                 ; A 1 SI UN BUMPER EST DEJA ENFONCE

BOUT          HEX       0000                 ; BOUTON
BOUT1         HEX       0000                 ;
DELX          HEX       000000
DELY          HEX       000000               ; DONNEES SOURIS
NEX           HEX       0000
NEY           HEX       0000

FLAGTAB       HEX       0000000000000000000000000000000000000000  ; FLAGS : 1 SI BUMPER ENFONCE
              HEX       0000000000000000000000000000000000000000  ; NB DE BUMPER/BOUTON DANS 1 ECRAN
              HEX       0000000000000000000000000000000000000000
              HEX       0000000000000000000000000000000000000000
              HEX       0000000000000000000000000000000000000000

FLAGTAB1      HEX       0000000000000000000000000000000000000000  ; FLAGS POUR LES BOUTONS
              HEX       0000000000000000000000000000000000000000
              HEX       0000000000000000000000000000000000000000
              HEX       0000000000000000000000000000000000000000
              HEX       0000000000000000000000000000000000000000

TABLE         HEX       0000A0004001E00180022003C00360040005A0054006E00680072008C0086009000AA00A400BE00B
              HEX       800C200DC00D600E000FA00F4010E01080112012C01260130014A0144015E01580162017C0176018
              HEX       0019A019401AE01A801B201CC01C601D001EA01E401FE01F80202021C02160220023A0234024E024
              HEX       80252026C02660270028A0284029E029802A202BC02B602C002DA02D402EE02E802F2030C0306031
              HEX       0032A0324033E03380342035C03560360037A0374038E0388039203AC03A603B003CA03C403DE03D
              HEX       803E203FC03F60400041A0414042E04280432044C04460450046A0464047E04780482049C049604A
              HEX       004BA04B404CE04C804D204EC04E604F0050A0504051E05180522053C05360540055A0554056E056
              HEX       80572058C0586059005AA05A405BE05B805C205DC05D605E005FA05F4060E06080612062C0626063
              HEX       0064A0644065E06580662067C06760680069A069406AE06A806B206CC06C606D006EA06E406FE06F
              HEX       80702071C07160720073A0734074E07480752076C07660770078A0784079E079807A207BC07B607C

********************

taskREC       ds        2                    ; wmWhat           +0
              ds        4                    ; wmMessage        +2
              ds        4                    ; wmWhen           +6
              ds        4                    ; wmWhere          +10
              ds        2                    ; wmModifiers      +14
              ds        4                    ; wmTaskData       +16
              adrl      $001fffff            ; wmTaskMask       +20
              ds        4                    ; wmLastClickTick  +24
              ds        2                    ; wmClickCount     +28
              ds        4                    ; wmTaskData2      +30
              ds        4                    ; wmTaskData3      +34
              ds        4                    ; wmTaskData4      +38
              ds        4                    ; wmLastClickPt    +42

********************

SEXIT         PushWord  #0
              PushWord  #%11111111_11111111
              PushLong  #taskREC
              _TaskMaster
              pla
              ldy       #-1
              rts

SLECT         LDAL      $00C026              ; $C027   LECTURE SOURIS
              BPL       SEXIT
              AND       #$0200
              BEQ       SLECT1
              LDAL      $00C024
              bpl       SEXIT
SLECT1        LDA       #$0000               ; BOUT,NEX,NEY A 0 PAR DEFAUT
              STA       BOUT
              STA       NEX
              STA       NEY
              LDAL      $00C023              ; $C024 : DELTA X
              BIT       #$4000               ; SIGNE ?
              BNE       SLECT3
              AND       #$3F00               ; POSITIF
              STA       DELX
              BRA       SLECT4
SLECT3        AND       #$3F00               ; NEGATIF
              STA       SLECT33+1
              INC       NEX
              LDA       #$4000               ; 64
              SEC
SLECT33       SBC       #$0000
              STA       DELX
SLECT4        LDAL      $00C023              ; $C024 : DELTA Y
              BMI       SLECT44              ; NO BOUT : LECTURE SUR Y DE BOUTON 1
              INC       BOUT                 ; BOUT=1
SLECT44       BIT       #$4000               ; SIGNE ?
              BNE       SLECT5
              AND       #$3F00               ; POSITIF
              STA       DELY
              BRA       SLECT6
SLECT5        AND       #$3F00               ; NEGATIF
              STA       SLECT55+1
              INC       NEY
              LDA       #$4000               ; 64
              SEC
SLECT55       SBC       #$0000
              STA       DELY
SLECT6        LDA       NEX                  ; CALCUL DE POSX
              BNE       SLECT8
              LDA       POSX                 ; DELX > 0
              CLC
              ADC       DELX+1
              CMP       #$0139               ; 313
              BMI       SLECT7
              LDA       #$0138               ; 312
SLECT7        STA       POSX
              BRA       SLECT10
SLECT8        LDA       POSX                 ; DELX < 0
              SEC
              SBC       DELX+1
              BPL       SLECT9
              LDA       #$0000
SLECT9        STA       POSX
SLECT10       LDA       NEY                  ; CALCUL DE POSY
              BNE       SLECT12
              LDA       POSY                 ; DELY > 0
              CLC
              ADC       DELY+1
              CMP       #$00C3               ; 195
              BMI       SLECT11
              LDA       #$00C2               ; 194
SLECT11       STA       POSY
              BRA       SLECT14
SLECT12       LDA       POSY                 ; DELY < 0
              SEC
              SBC       DELY+1
              BPL       SLECT13
              LDA       #$0000
SLECT13       STA       POSY
SLECT14       RTS

**********************

SLECTA        LDAL      $00C026              ; $C027   LECTURE SOURIS POUR SELECT AREA
              BPL       SLECTA
              AND       #$0200
              BEQ       SLECTA1
              LDAL      $00C024
              BRA       SLECTA
SLECTA1       LDA       #$0000               ; BOUT,NEX,NEY A 0 PAR DEFAUT
              STA       BOUT
              STA       NEX
              STA       NEY
              LDAL      $00C023              ; $C024 : DELTA X
              BIT       #$4000               ; SIGNE ?
              BNE       SLECTA3
              AND       #$3F00               ; POSITIF
              STA       DELX
              BRA       SLECTA4
SLECTA3       AND       #$3F00               ; NEGATIF
              STA       SLECTA33+1
              INC       NEX
              LDA       #$4000               ; 64
              SEC
SLECTA33      SBC       #$0000
              STA       DELX                 ; DELTA X OK

SLECTA4       LDAL      $00C023              ; $C024 : DELTA Y
              BMI       SLECTA44             ; NO BOUT : LECTURE SUR Y DE BOUTON 1
              INC       BOUT                 ; BOUT=1
SLECTA44      BIT       #$4000               ; SIGNE ?
              BNE       SLECTA5
              AND       #$3F00               ; POSITIF
              STA       DELY
              BRA       SLECTA6
SLECTA5       AND       #$3F00               ; NEGATIF
              STA       SLECTA55+1
              INC       NEY
              LDA       #$4000               ; 64
              SEC
SLECTA55      SBC       #$0000
              STA       DELY                 ; DELTA Y OK

SLECTA6       RTS

**********************

SBOUT         LDAL      $00C026              ; ON ATTEND UN CLICK DE SOURIS ($C027)
              BPL       SBOUT                ; ET LE RELACHEMENT
              AND       #$0200
              BEQ       SBOUT1
              LDAL      $00C024
              BRA       SBOUT
SBOUT1        LDAL      $00C023              ; DONNEES SOURIS PRETE   $C024 : DELTA X
              LDAL      $00C023              ;                        $C024 : DELTA Y
              BMI       SBOUT                ; LECTURE SUR Y DE BOUTON 1, BIT 7=0 <=> ENFONCE

SBOUT2        LDAL      $00C026
              BPL       SBOUT2
              AND       #$0200
              BEQ       SBOUT3
              LDAL      $00C024
              BRA       SBOUT2
SBOUT3        LDAL      $00C023              ; DONNEES SOURIS PRETE   $C024 : DELTA X
              LDAL      $00C023              ;                        $C024 : DELTA Y
              BPL       SBOUT2               ; LECTURE SUR Y DE BOUTON 1, BIT 7=0 <=> ENFONCE
              RTS

**********************

DESS1         LDA       A1
              BRA       DESS2
DESS          LDA       AP                   ; DESSINE LE DECOR (LIE A AP), ANCIENNE POSITION
DESS2         CLC
              ADC       #$2000
              STA       DESS4+1
              LDY       #$0000
              LDX       #$0004               ; LARGEUR 3
DESS3         LDA       DEC,Y
DESS4         STAL      $012000,X
              INY
              INY
              DEX
              DEX
              BPL       DESS3
              CPY       #$0024               ; NB CASES (36)
              BPL       DESS5
              LDX       #$0004               ; LARGEUR 3
              LDA       DESS4+1
              CLC
              ADC       #$00A0
              STA       DESS4+1
              BRA       DESS3
DESS5         RTS

SAUV          LDA       A1                   ; SAUVEGARDE LE DECOR (LIE A A1), NOUVELLE POSITION
              CLC
              ADC       #$2000
              STA       SAUV1+1
              LDY       #$0000
              LDX       #$0004               ; LARGEUR 3
SAUV1         LDAL      $012000,X
              STA       DEC,Y
              INY
              INY
              DEX
              DEX
              BPL       SAUV1
              CPY       #$0024               ; NB CASES (36)
              BPL       SAUV2
              LDX       #$0004               ; LARGEUR 3
              LDA       SAUV1+1
              CLC
              ADC       #$00A0
              STA       SAUV1+1
              BRA       SAUV1
SAUV2         RTS

TRACE         JSR       DESS                 ; OK
              JSR       SAUV
              LDA       A1                   ; DESSINE LE POINTEUR POSITION PAIRE
              CLC
              ADC       #$2000
              STA       TRACE1+1
              STA       TRACE4+1
              LDA       POSX
              LSR
              BCC       TRACEP
              LDX       #PTIMP               ; POSITION IMPAIRE
              LDY       #PTIMPMA
              BRA       TRACE0
TRACEP        LDX       #PTPAI               ; POSITION PAIRE
              LDY       #PTPAIMA
TRACE0        STX       TRACE3+1             ; MOTIF
              STY       TRACE2+1             ; MASQUE
              LDY       #$0000
              LDX       #$0000
TRACE1        LDAL      $012000,X
TRACE2        AND       $A0A0,Y              ; ET AVEC LE MASQUE
TRACE3        ORA       $A0A0,Y              ; OU AVEC LE MOTIF
TRACE4        STAL      $012000,X
              INY
              INY
              INX
              INX
              CPX       #$0006               ; LARGEUR 3
              BNE       TRACE1
              CPY       #$0024               ; NB CASES (36)
              BEQ       TRACE5
              LDX       #$0000
              LDA       TRACE1+1
              CLC
              ADC       #$00A0
              STA       TRACE1+1
              STA       TRACE4+1
              BRA       TRACE1
TRACE5        RTS

******************************

AFFSPRR       INC       AFFSPRF              ; BUMPER RELEVE
AFFSPRE       LDA       ECRAN                ; BUMPER ENFONCE
              DEC
              ASL
              TAX
              LDA       ECRDAT,X             ; ADRESSE DU TABLEAU DES DATA POUR L'ECRAN CONCERNE
              STA       AFFSPR1+1
              LDA       SECR2+1              ; CONTIENT LE NUMERO DU BUMPER (*2)
              ASL
              ASL                            ; *4
              CLC
AFFSPR1       ADC       #$0000               ; ADRESSE DATA BUMPER
              TAX
SECR14        LDA\      $0000,X              ; LONGUEUR
              DEC
              ASL
              STA       AFFSPR3+1
              INX
              INX
SECR15        LDA\      $0000,X              ; HAUTEUR
              DEC
              STA       AFFSPR2+1
              INX
              INX
SECR16        LDA\      $0000,X              ; @ ECRAN
              STA       AFFSPR5+1
              INX
              INX
SECR17        LDA\      $0000,X              ; @ SPRITE
              STA       AFFSPR4+1
              LDA       AFFSPRF              ; FLAG DE AFFSPR
              BNE       AFFSPR2              ; ON DESSINE LE SPRITE RELEVE
              LDA       AFFSPR4+1
              CLC                            ; SPRITE ENFONCE
              ADC       #$8000
              STA       AFFSPR4+1
AFFSPR2       LDY       #$0000               ; HAUTEUR-1
AFFSPR3       LDX       #$0000               ; NOMBRE DE *4-2
AFFSPR4       LDAL      $070000,X            ; ADRESSE SPRITE (BANC 07)
AFFSPR5       STAL      $012000,X            ; ADRESSE ECRAN
              DEX
              DEX
              BPL       AFFSPR4              ; RECOPIE 1 LIGNE
              LDA       AFFSPR4+1
              CLC                            ; LIGNE SUIVANTE SPRITE
              ADC       #$00A0
              STA       AFFSPR4+1
              LDA       AFFSPR5+1
              CLC                            ; LIGNE SUIVANTE ECRAN
              ADC       #$00A0
              STA       AFFSPR5+1
              DEY
              BPL       AFFSPR3
              STZ       AFFSPRF
              RTS
AFFSPRF       HEX       0000                 ; FLAG RELEVE/ENFONCE

*****************  DECOMPRESSION  ***********************

UNPACK        STX       UNPACKBEGIN+2        ; X:BANC SRC
              STX       UNPACK11+2
              STX       UNPACK33+2
              STX       UNPACK34+2
              STA       UNPACKBEGIN+1        ; A:ADRESSE SRC
              STA       UNPACK11+1
              STA       UNPACK33+1
              INC
              INC
              STA       UNPACK34+1
              STZ       UNPACKINDEX          ; INIT
              LDX       #$0000
UNPACKBEGIN   LDAL      $040000,X
              PHX                            ; SAUV
              TAY
              AND       #$003F               ; REPET
              STA       UNPACKREPET
              TYA                            ; CODE
              AND       #$00C0               ; TEL QUEL
              BEQ       UNPACK10
              CMP       #$0040               ; 3,5,6,7
              BEQ       UNPACK20
              CMP       #$0080               ; REPET NEXT
              BEQ       UNPACK30
              BRA       UNPACK40             ; REPET 4 NEXT

UNPACK10      INC       UNPACKREPET
              PLX
              INX                            ; SAUTE L'OCTET CODE
              LDY       #$0000
UNPACK11      LDAL      $040000,X            ; RECOPIE DANS LE BUFFER
              STA       UNPACKBUFFER,Y
              INX
              INY
              CPY       UNPACKREPET
              BNE       UNPACK11
              PHX
              LDY       #$0000               ; RECOPIE VERS L'IMAGE
              LDX       UNPACKINDEX
UNPACK12      LDA       UNPACKBUFFER,Y
UNPACK13      STAL      $068000,X
              INX
              INY
              CPY       UNPACKREPET
              BNE       UNPACK12
              STX       UNPACKINDEX
              BRA       UNPACKFIN

UNPACK20      LDX       UNPACKINDEX          ; REPETE L'OCTET SUIVANT
              TYA
              XBA
              LDY       UNPACKREPET
UNPACK21      STAL      $068000,X            ; ZONE DECOMPRE
              INX
              DEY
              BPL       UNPACK21
              STX       UNPACKINDEX
              PLX
              INX
              INX
              PHX
              BRA       UNPACKFIN

UNPACK30      INX                            ; REPET LES 4 SUIVANTS
UNPACK33      LDAL      $040000,X
              STA       UNPACK31+1           ; 1 ET 2
UNPACK34      LDAL      $040002,X
              STA       UNPACK32+1           ; 3 ET 4
              LDX       UNPACKINDEX
              LDY       UNPACKREPET
UNPACK31      LDA       #$A0A0
UNPACK35      STAL      $068000,X
UNPACK32      LDA       #$A0A0
UNPACK36      STAL      $068002,X
              INX
              INX
              INX
              INX
              DEY
              BPL       UNPACK31
              STX       UNPACKINDEX
              PLA                            ; INDICE IMAGE COMP
              CLC
              ADC       #$0005
              PHA
              BRA       UNPACKFIN

UNPACK40      TYA                            ; REPET 4*LE SUIVANT
              AND       #$FF00
              STA       UNPACK41+1
              XBA
UNPACK41      ORA       #$0A0A
              LDX       UNPACKINDEX
              LDY       UNPACKREPET
UNPACK42      STAL      $068000,X
UNPACK43      STAL      $068002,X
              INX
              INX
              INX
              INX
              DEY
              BPL       UNPACK42
              STX       UNPACKINDEX
              PLX                            ; INDICE IMAGE COMP
              INX
              INX
              PHX
***********

UNPACKFIN     LDX       UNPACKINDEX          ; FIN DE TRAITEMENT CODE
              CPX       #$8000
              BCS       UNPACKFINI           ; BPL
UNPACKFIN0    CPX       #$0000
              BCS       UNPACKFIN2
UNPACKFIN1    PLX
              JMP       UNPACKBEGIN
UNPACKFIN2    LDA       UNPACKFIN0+1
              CLC
              ADC       #$0800               ; PROCHAINE VALEUR
              STA       UNPACKFIN0+1
              JSR       FADEOUT0             ; FADE OUT : 1 CRAN
              PLX
              JMP       UNPACKBEGIN
UNPACKFINI    PLA
              STZ       UNPACKFIN0+1         ; VALEUR INITIALE
              RTS

UNPACKINDEX   HEX       0000                 ;
UNPACKREPET   HEX       0000                 ; FACTEUR DE REPETITION
UNPACKBUFFER  DS        66

*****************  FADE IN - FADE OUT  *******************

FADEIN        LDX       #$01FE
              LDA       #$0000               ; NETTOYAGE PREALABLE
IN0           STAL      $019E00,X
              DEX
              DEX
              BPL       IN0
              LDY       #$000F               ; L'IMAGE EST EN BANC 06/8000
IN1           LDX       #$01FE               ; ELLE VIENT D'ETRE DECOMPRESSEE
IN2           LDAL      $019E00,X            ; ON FAIT UN FADE SUR LES 16 PALETTES
              AND       #$000F
              STA       TEMP
IN3           LDAL      $06FE00,X
              AND       #$000F
              CMP       TEMP
              BEQ       IN4
              LDAL      $019E00,X            ; COMPOSANTE BLEUE
              CLC
              ADC       #$0001
              STAL      $019E00,X
IN4           LDAL      $019E00,X
              AND       #$00F0
              STA       TEMP
IN5           LDAL      $06FE00,X
              AND       #$00F0
              CMP       TEMP
              BEQ       IN6
              LDAL      $019E00,X            ; COMPOSANTE VERTE
              CLC
              ADC       #$0010
              STAL      $019E00,X
IN6           LDAL      $019E00,X
              AND       #$0F00
              STA       TEMP
IN7           LDAL      $06FE00,X
              AND       #$0F00
              CMP       TEMP
              BEQ       IN8
              LDAL      $019E00,X            ; COMPOSANTE ROUGE
              CLC
              ADC       #$0100
              STAL      $019E00,X
IN8           DEX
              DEX
              BPL       IN2
              DEY
              BPL       IN1
              RTS
TEMP          HEX       0000

FADEOUT0      PHX                            ; FADE 1 INTENSITE
OUT0          LDX       #$01FE
OUT1          LDAL      $E19E00,X            ; COMPOSANTE BLEUE
              AND       #$000F
              BEQ       OUT2
              LDAL      $E19E00,X
              SEC
              SBC       #$0001
              STAL      $E19E00,X
OUT2          LDAL      $E19E00,X            ; COMPOSANTE VERTE
              AND       #$00F0
              BEQ       OUT3
              LDAL      $E19E00,X
              SEC
              SBC       #$0010
              STAL      $E19E00,X
OUT3          LDAL      $E19E00,X            ; COMPOSANTE ROUGE
              AND       #$0F00
              BEQ       OUT4
              LDAL      $E19E00,X
              SEC
              SBC       #$0100
              STAL      $E19E00,X
OUT4          DEX
              DEX
              BPL       OUT1
              PLX
              RTS

**********  AFFICHAGE DES FENETRES D'ALERTES  ***************

WORKING       LDA       NOWINDOWFLAG         ; AFFICHAGE WORKING WINDOW
              BEQ       WORKING000           ; SI NON CONVERT ALL FILES
              RTS
WORKING000    LDA       #$8000
              STA       WORKING1+1
              LDA       #$4AAA               ; ADRESSE ECRAN (STAT & OPTIONS)
              STA       WORKING2+1
              STA       ALERTF1+1
              STA       ALERTF2+1
              LDY       #$0030               ; 49 LIGNES
WORKING0      LDX       #$0046               ; 144 POINTS
WORKING1      LDAL      $048000,X
WORKING2      STAL      $E12000,X
              DEX
              DEX
              BPL       WORKING1
              LDA       WORKING1+1           ; LIGNE SUIVANTE
              CLC
              ADC       #$00A0
              STA       WORKING1+1
              LDA       WORKING2+1
              CLC
              ADC       #$00A0
              STA       WORKING2+1
              DEY                            ; FIN ?
              BPL       WORKING0

              LDA       WORKINGI             ; MESSAGE A AFFICHER
              ASL
              TAX
              LDA       WORKINGT,X
              STA       WORKING3+1
WORKING3      JMP       $A0A0

WORKINGT      DA        WORKING00,WORKING10,WORKING20,WORKING30,WORKING40,WORKING50
              DA        WORKING60

WORKING00     LDX       #MESSAGE1            ; TRAVAIL PRELIMINAIRE SUR LA PALETTE
              LDY       #MESSAGE2
              JMP       WORKING11

WORKING10     LDX       #MESSAGE7            ; REDUCTION DE L'IMAGE ET AFFICHAGE EN GRIS
              LDY       #MESSAGE8
              JMP       WORKING11

WORKING20     LDX       #MESSAGE11           ; CONVERSION MODE 3200
              LDY       #MESSAGE12
              JSR       WORKING11
              LDA       #MESSAGE13
              JMP       WORKING15

WORKING30     LDX       #MESSAGE16           ; CONVERSION MODE 256
              LDY       #MESSAGE0
              JSR       WORKING11
              LDA       #MESSAGE15
              JMP       WORKING15

WORKING40     LDX       #MESSAGE14           ; CONVERSION MODE 16
              LDY       #MESSAGE0
              JMP       WORKING11

WORKING50     LDX       #MESSAGE20           ; CHARGEMENT ET DECOMPRESSION
              LDY       #MESSAGE21
              JMP       WORKING11

WORKING60     LDX       #MESSAGE33           ; CONVERT ALL THE FOLDER FILES
              LDY       #MESSAGE12
              JSR       WORKING11
              LDA       #MESSAGE35
              JMP       WORKING15

**********

WORKING15     LDY       NOWINDOWFLAG         ; AFFICHAGE MESSAGE LIGNE THERMO
              CPY       #$0000               ; SI NON CONVERT ALL FILES
              BEQ       WORKING150
              RTS
WORKING150    STA       WORKING5+1           ; AFFICHAGE MESSAGE LIGNE THERMO
              LDA       #$61DA               ; ADRES ECRAN
              STA       AFTAE
              LDA       #$E120
              STA       AFTCAR2+2
              STA       AFTCAR4+2
              LDY       #$0000
              BRA       WORKING5

WORKING11     STX       WORKING12+1
              STY       WORKING5+1
              LDA       #$E120               ; ECRITURE EN BANC E1/
              STA       AFTCAR2+2
              STA       AFTCAR4+2
              LDA       #$55F0               ; AFFICHAGE MESSAGE DANS FENETRE
              STA       AFTAE
              LDY       #$0000               ; AFFICHAGE MESSAGE 1ere LIGNE
WORKING12     LDA       MESSAGE1,Y
              BEQ       WORKING4             ; 0000 : ON SORT
              AND       #$00FF
              TAX
              JSR       AFTCAR               ; AFFICH 1 CARAC
              INY
              LDA       AFTAE
              CLC
              ADC       #$0003               ; ADRESSE CARACTERE SUIVANT
              STA       AFTAE
              BRA       WORKING12
WORKING4      LDA       #$5A50
              STA       AFTAE
              LDY       #$0000               ; AFFICHAGE MESSAGE 2eme LIGNE
WORKING5      LDA       MESSAGE2,Y
              BEQ       WORKING6             ; 0000 : ON SORT
              AND       #$00FF
              TAX
              JSR       AFTCAR               ; AFFICH 1 CARAC
              INY
              LDA       AFTAE
              CLC
              ADC       #$0003               ; ADRESSE CARACTERE SUIVANT
              STA       AFTAE
              BRA       WORKING5
WORKING6      LDA       #$0120
              STA       AFTCAR2+2
              STA       AFTCAR4+2
              LDA       #$61D9
              STA       WORKING9+1
              RTS
WORKINGI      HEX       0000                 ; INDICE

MESSAGE0      HEX       0000                 ; VIDE

MESSAGE20     HEX       3B,3B,47,4A,3C,3F,44,49,42,3B,4B,44,3E,4F,50,4D,40,3B,3B,3B,0000  ;   LOADING PICTURE
MESSAGE21     HEX       3B,3B,3B,3C,49,3F,3B,50,49,4B,3C,3E,46,44,49,42,3B,3B,3B,3B,0000  ;    AND UNPACKING

MESSAGE7      HEX       3B,4D,40,4E,44,55,40,3B,4B,44,3E,4F,50,4D,40,3B,3C,49,3F,3B,0000  ;  RESIZE PICTURE AND
MESSAGE8      HEX       42,4D,40,54,3B,4E,3E,3C,47,40,4E,3B,3F,44,4E,4B,47,3C,54,3B,0000  ; GREY SCALES DISPLAY

MESSAGE1      HEX       3B,3B,4B,4D,40,4B,3C,4D,3C,4F,44,51,40,3B,52,4A,4D,46,3B,3B,0000  ;   PREPARATIVE WORK
MESSAGE2      HEX       3B,3B,3B,4A,49,3B,4F,43,40,3B,4B,44,3E,4F,50,4D,40,3B,3B,3B,0000  ;    ON THE PICTURE
MESSAGE3      HEX       3B,50,4E,40,3F,3B,3E,4A,47,4A,4D,4E,3B,0000  ; USED COLORS
MESSAGE4      HEX       4E,4A,4D,4F,3B,4B,3C,47,40,4F,4F,40,3B,0000  ; SORT PALETTE
MESSAGE5      HEX       4D,40,48,3C,4B,3B,4B,44,3E,4F,50,4D,40,0000  ; REMAP PICTURE
MESSAGE6      HEX       3B,3B,3B,4E,4B,40,3E,4F,4D,3C,3B,3B,3B,0000  ; SPECTRA
MESSAGE9      HEX       3B,41,4D,40,4C,50,40,49,3E,40,4E,3B,3B,0000  ; FREQUENCES
MESSAGE10     HEX       4B,4D,40,3E,3C,47,3E,50,47,3C,4F,40,3F,0000  ; PRECALCULATED

MESSAGE15     HEX       4B,3C,47,40,4F,4F,40,4E,3B,30,3B,3B,3B,0000  ; PALETTES :

MESSAGE30     HEX       3B,4B,4D,40,4B,3C,4D,3C,4F,44,51,40,3B,0000  ;  PREPARATIVE
MESSAGE31     HEX       4D,40,48,4A,51,40,3B,3E,4A,47,4A,4D,4E,0000  ; REMOVE COLORS
MESSAGE32     HEX       4D,40,48,3C,4B,3B,4B,44,3E,4F,50,4D,40,0000  ; REMAP PICTURE

MESSAGE11     HEX       3E,4A,49,51,40,4D,4E,44,4A,49,3B,48,4A,3F,40,3B,1D,1C,1A,1A,0000  ; CONVERSION MODE 3200
MESSAGE12     HEX       4B,4D,40,4E,4E,3B,35,40,4E,3E,35,3B,4F,4A,3B,40,53,44,4F,3B,0000  ; PRESS 'ESC' TO EXIT
MESSAGE13     HEX       3B,47,44,49,40,3B,3B,30,0000  ;  LINE :

MESSAGE14     HEX       3B,3E,4A,49,51,40,4D,4E,44,4A,49,3B,48,4A,3F,40,3B,1B,20,3B,0000  ;  CONVERSION MODE 16

MESSAGE16     HEX       3E,4A,49,51,40,4D,4E,44,4A,49,3B,48,4A,3F,40,3B,1C,1F,20,3B,0000  ; CONVERSION MODE 256

MESSAGE33     HEX       3E,4A,49,51,40,4D,4F,44,49,42,3B,4B,44,3E,4F,50,4D,40,4E,31,0000  ;  CONVERTING PICTURES
MESSAGE35     HEX       3B,3B,3F,4A,49,40,3B,30,3B,3B,3B,3B,3B,0000  ; DONE :

*************

WORKING7      PHA                            ; ON FAIT AVANCER LE THERMO
              LDA       NOWINDOWFLAG
              BEQ       WORKING70
              PLA
              RTS
WORKING70     PHX
              PHY
              LDA       WORKING9+1           ; DEBORDEMENT
              CMP       #$6203
              BEQ       WORKINGA
              LDY       #$0005               ; 5 LIGNES
WORKING8      LDA       #$2222               ; ROUGE...
WORKING9      STAL      $E12000
              LDA       WORKING9+1
              CLC
              ADC       #$00A0
              STA       WORKING9+1
              DEY
              BNE       WORKING8
              LDA       WORKING9+1           ; PREPARATION LIGNE SUIVANTE
              SEC
              SBC       #$031E
              STA       WORKING9+1
WORKINGA      PLY
              PLX
              PLA
              RTS

***************

ALERT         LDA       ALERTI
              ASL
              TAX                            ; ON ORIENTE LE MESSAGE
              LDA       ALERTAB,X
              STA       ALERT130+1
ALERT130      JMP       $A0A0

ALERTAB       DA        #ALERT00,#ALERT01,#ALERT02,#ALERT03,#ALERT04,#ALERT05
              DA        #ALERT06,#ALERT07,#ALERT08,#ALERT09,#ALERT10,#ALERT11
              DA        #ALERT12,#ALERT13,#ALERT14,#ALERT15,#ALERT16,#ALERT17,#ALERT18

ALERT00       LDA       ECR04083             ; PAS DE ZONE CHOISIE
              BEQ       ALERT110
              RTS                            ; ON A DEJA CHOISIT
ALERT110      LDA       #MASSAGE3
              STA       ALERT3+1
              LDA       #MASSAGE4
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT                ; ATTEND LE BOUTON
              LDA       ECRAN                ; EST ON DEJA SUR L'ECRAN SELECT ?
              CMP       #$0004
              BNE       ALERT111
              RTS
ALERT111      PLA
              PLA                            ; RECUPERE LES ADRESSES DE RETOUR DES JSR
              LDA       #$0004
              JMP       PICT00               ; FORCE LE SAUT A L'ECRAN SELECT SANS REDESSINER

ALERT01       LDA       #MASSAGE9            ; LOAD : TROP DE COULEURS
              STA       ALERT3+1
              LDA       #MASSAGE1
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT02       NOP

ALERT03       LDA       #MASSAGE9            ; LOAD : FORMAT GRAPHIQUE NON RECONNU
              STA       ALERT3+1
              LDA       #MASSAGE10
              STA       ALERT5+1
              LDA       #MASSAGE11
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT04       LDA       #MASSAGE9            ; LOAD : IMAGE TROP GRANDE
              STA       ALERT3+1
              LDA       #MASSAGE13
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT05       LDA       #MASSAGE9            ; LOAD : SPECIFICATION NON GEREE
              STA       ALERT3+1
              LDA       #MASSAGE14
              STA       ALERT5+1
              LDA       #MASSAGE15
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT06       LDA       IMAGEOK              ; PAS D'IMAGE EN MEMOIRE
              BEQ       ALERT061
              RTS
ALERT061      LDA       #MASSAGE3
              STA       ALERT3+1
              LDA       #MASSAGE16
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              PLA
              PLA                            ; RECUPERE LES ADRESSES DE RETOUR DES JSR
              LDA       #$0002
              JMP       PICT00               ; FORCE LE SAUT A L'ECRAN LOAD SANS REDESSINER

ALERT07       LDA       #MASSAGE9            ; LOAD : PAS ASSEZ DE MEMOIRE.
              STA       ALERT3+1
              LDA       #MASSAGE19
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT08       LDA       #MASSAGE9            ; LOAD : ERREUR I/O
              STA       ALERT3+1
              LDA       #MASSAGE20
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT09       LDA       #MASSAGE30           ; CONVERT ALL : ALL CHOICE
              STA       ALERT3+1
              LDA       #MASSAGE31
              STA       ALERT5+1
              LDA       #MASSAGE33
              STA       ALERT7+1
              LDA       #MASSAGE34
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT10       LDA       #MASSAGE30           ; CONVERT ALL : PRINTSHOP CHOICE
              STA       ALERT3+1
              LDA       #MASSAGE32
              STA       ALERT5+1
              LDA       #MASSAGE33
              STA       ALERT7+1
              LDA       #MASSAGE34
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT11       LDA       #MASSAGE30           ; CONVERT ALL : SAME PATHS
              STA       ALERT3+1
              LDA       #MASSAGE35
              STA       ALERT5+1
              LDA       #MASSAGE36
              STA       ALERT7+1
              LDA       #MASSAGE37
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT12       LDA       #MASSAGE30           ; CONVERT ALL : I/O ERREUR LOAD
              STA       ALERT3+1
              LDA       #MASSAGE40
              STA       ALERT5+1
              LDA       #MASSAGE41
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT13       LDA       #MASSAGE30           ; CONVERT ALL : I/O ERREUR SAVE
              STA       ALERT3+1
              LDA       #MASSAGE40
              STA       ALERT5+1
              LDA       #MASSAGE42
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT14       LDA       #MASSAGE30           ; CONVERT ALL : DISK FULL
              STA       ALERT3+1
              LDA       #MASSAGE43
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT15       LDA       #MASSAGE30           ; CONVERT ALL : LOAD8BIT+NONE+SAVE4BIT
              STA       ALERT3+1             ; NONE BAD CHOICE
              LDA       #MASSAGE39
              STA       ALERT5+1
              LDA       #MASSAGE33
              STA       ALERT7+1
              LDA       #MASSAGE34
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT16       LDA       #MASSAGE8            ; SAVE : PAS D'IMAGE EN MEMOIRE
              STA       ALERT3+1
              LDA       #MASSAGE44
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT17       LDA       #MASSAGE8            ; SAVE : I/O ERREUR
              STA       ALERT3+1
              LDA       #MASSAGE20
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

ALERT18       LDA       #MASSAGE8            ; SAVE : DISK FULL
              STA       ALERT3+1
              LDA       #MASSAGE43
              STA       ALERT5+1
              LDA       #MASSAGE0
              STA       ALERT7+1
              LDA       #MASSAGE6
              STA       ALERT9+1
              JSR       ALERT120
              JSR       SBOUT
              RTS

***************

ALERT120      LDA       #$8049               ; INIT
              STA       ALERT1+1
              LDA       #$496A               ; ADRESSE ECRAN (STAT & OPTIONS)
              STA       ALERT2+1
              STA       ALERTF1+1
              STA       ALERTF2+1
              LDY       #$0030               ; 49 LIGNES
ALERT0        LDX       #$0046               ; 144 POINTS
ALERT1        LDAL      $048000,X
ALERT2        STAL      $E12000,X
              DEX
              DEX
              BPL       ALERT1
              LDA       ALERT1+1             ; LIGNE SUIVANTE
              CLC
              ADC       #$00A0
              STA       ALERT1+1
              LDA       ALERT2+1
              CLC
              ADC       #$00A0
              STA       ALERT2+1
              DEY                            ; FIN ?
              BPL       ALERT0
              LDA       #$E120               ; ECRITURE EN BANC E1/
              STA       AFTCAR2+2
              STA       AFTCAR4+2
              LDA       #$54B0               ; AFFICHAGE MESSAGE DANS FENETRE
              STA       AFTAE
              LDY       #$0000               ; AFFICHAGE MESSAGE 1ere LIGNE
ALERT3        LDA       MASSAGE0,Y
              AND       #$00FF
              BEQ       ALERT4               ; 0000 : ON SORT
              TAX
              JSR       AFTCAR               ; AFFICH 1 CARAC
              INY
              LDA       AFTAE
              CLC
              ADC       #$0003               ; ADRESSE CARACTERE SUIVANT
              STA       AFTAE
              BRA       ALERT3
ALERT4        LDA       #$5910
              STA       AFTAE
              LDY       #$0000               ; AFFICHAGE MESSAGE 2eme LIGNE
ALERT5        LDA       MASSAGE0,Y
              AND       #$00FF
              BEQ       ALERT6               ; 0000 : ON SORT
              TAX
              JSR       AFTCAR               ; AFFICH 1 CARAC
              INY
              LDA       AFTAE
              CLC
              ADC       #$0003               ; ADRESSE CARACTERE SUIVANT
              STA       AFTAE
              BRA       ALERT5
ALERT6        LDA       #$5CD0
              STA       AFTAE
              LDY       #$0000               ; AFFICHAGE MESSAGE 2eme LIGNE
ALERT7        LDA       MASSAGE0,Y
              AND       #$00FF
              BEQ       ALERT8               ; 0000 : ON SORT
              TAX
              JSR       AFTCAR               ; AFFICH 1 CARAC
              INY
              LDA       AFTAE
              CLC
              ADC       #$0003               ; ADRESSE CARACTERE SUIVANT
              STA       AFTAE
              BRA       ALERT7
ALERT8        LDA       #$6090
              STA       AFTAE
              LDY       #$0000               ; AFFICHAGE MESSAGE 2eme LIGNE
ALERT9        LDA       MASSAGE0,Y
              AND       #$00FF
              BEQ       ALERT100             ; 0000 : ON SORT
              TAX
              JSR       AFTCAR               ; AFFICH 1 CARAC
              INY
              LDA       AFTAE
              CLC
              ADC       #$0003               ; ADRESSE CARACTERE SUIVANT
              STA       AFTAE
              BRA       ALERT9
ALERT100      LDA       #$0120
              STA       AFTCAR2+2
              STA       AFTCAR4+2
              RTS
ALERTI        HEX       0000

MASSAGE0      HEX       0000                 ; LIGNE VIDE

MASSAGE3      HEX       3B,54,4A,50,3B,41,44,4D,4E,4F,3B,43,3C,51,40,3B,4F,4A,3B,3B,0000  ;  YOU HAVE FIRST TO

MASSAGE4      HEX       3B,3B,4E,40,47,40,3E,4F,3B,3C,49,3B,3C,4D,40,3C,31,3B,3B,3B,0000  ;   SELECT AN AREA.

MASSAGE6      HEX       3B,3E,47,44,3E,46,3B,4F,4A,3B,3E,4A,49,4F,44,49,50,40,3B,3B,0000  ;  CLICK TO CONTINUE

MASSAGE1      HEX       3B,3B,4F,4A,4A,3B,48,3C,49,54,3B,3E,4A,47,4A,4D,4E,31,3B,3B,0000  ;   TOO MANY COLORS.

MASSAGE9      HEX       3B,3B,3B,47,4A,3C,3F,3B,3E,3C,49,3E,40,47,47,40,3F,3B,3B,3B,0000  ;    LOAD CANCELLED
MASSAGE8      HEX       3B,3B,3B,4E,3C,51,40,3B,3E,3C,49,3E,40,47,47,40,3F,3B,3B,3B,0000  ;    SAVE CANCELLED

MASSAGE10     HEX       3B,3B,50,49,46,49,4A,52,49,3B,42,4D,3C,4B,43,44,3E,3B,3B,3B,0000  ;   UNKNOWN GRAPHIC
MASSAGE11     HEX       3B,3B,3B,3B,41,44,47,40,3B,41,4A,4D,48,3C,4F,31,3B,3B,3B,3B,0000  ;     FILE FORMAT.

MASSAGE13     HEX       3B,4B,44,3E,4F,50,4D,40,3B,4F,4A,4A,3B,47,3C,4D,42,40,31,3B,0000  ;  PICTURE TOO LARGE.

MASSAGE14     HEX       3B,4E,4B,40,3E,44,41,44,3E,3C,4F,44,4A,49,4E,3B,49,4A,4F,3B,0000  ;  SPECIFICATIONS NOT
MASSAGE15     HEX       3B,3B,3B,3B,3B,4E,50,4B,4B,4A,4D,4F,40,3F,31,3B,3B,3B,3B,3B,0000  ;      SUPPORTED.

MASSAGE16     HEX       3B,3B,47,4A,3C,3F,3B,3C,3B,4B,44,3E,4F,50,4D,40,31,3B,3B,3B,0000  ;   LOAD A PICTURE

MASSAGE19     HEX       3B,49,4A,4F,3B,40,49,4A,50,42,43,3B,48,40,48,4A,4D,54,31,3B,0000  ;  NOT ENOUGH MEMORY.

MASSAGE20     HEX       3B,3B,3B,3B,3B,44,27,4A,3B,40,4D,4D,4A,4D,31,3B,3B,3B,3B,3B,0000  ;      I/O ERROR.

MASSAGE30     HEX       3B,3B,52,4A,4D,46,3B,3E,3C,49,3E,40,47,47,40,3F,31,3B,3B,3B,0000  ;   WORK CANCELLED.

MASSAGE31     HEX       3B,3B,3B,3B,3B,3B,3B,35,3C,47,47,35,3B,3B,3B,3B,3B,3B,3B,3B,0000  ;       'ALL'
MASSAGE32     HEX       3B,3B,3B,3B,35,4B,4D,44,49,4F,4E,43,4A,4B,35,3B,3B,3B,3B,3B,0000  ;    'PRINTSHOP'
MASSAGE33     HEX       3B,44,4E,3B,3C,3B,3D,3C,3F,3B,3E,43,4A,44,3E,40,3B,44,49,3B,0000  ;  IS A BAD CHOICE IN
MASSAGE34     HEX       3B,3B,35,3E,4A,49,51,40,4D,4F,3B,3C,4D,40,3C,35,31,3B,3B,3B,0000  ;    'CONVERT AREA'.

MASSAGE35     HEX       3B,3B,3B,4E,3C,48,40,3B,4B,3C,4F,43,4E,3B,44,49,3B,3B,3B,3B,0000  ;     SAME PATHS IN
MASSAGE36     HEX       3B,35,47,4A,3C,3F,35,3B,3C,49,3F,3B,35,4E,3C,51,40,35,3B,3B,0000  ;   'LOAD' AND 'SAVE'
MASSAGE37     HEX       3B,3B,3B,3B,3B,3B,4E,3E,4D,40,40,49,4E,31,3B,3B,3B,3B,3B,3B,0000  ;        SCREENS.

MASSAGE39     HEX       3B,3B,3B,3B,3B,3B,3B,35,49,4A,49,40,35,3B,3B,3B,3B,3B,3B,3B,0000  ;        'NONE'

MASSAGE40     HEX       3B,3B,44,27,4A,3B,40,4D,4D,4A,4D,3B,44,49,3B,4F,43,40,3B,3B,0000  ;   I/O ERROR IN THE
MASSAGE41     HEX       3B,3B,47,4A,3C,3F,3B,4A,4B,40,4D,3C,4F,44,4A,49,31,3B,3B,3B,0000  ;    LOAD OPERATION.
MASSAGE42     HEX       3B,3B,4E,3C,51,40,3B,4A,4B,40,4D,3C,4F,44,4A,49,31,3B,3B,3B,0000  ;    SAVE OPERATION.
MASSAGE43     HEX       3B,3B,3B,3B,3B,3F,44,4E,46,3B,41,50,47,47,31,3B,3B,3B,3B,3B,0000  ;     DISK FULL.

MASSAGE44     HEX       49,4A,3B,4B,44,3E,4F,50,4D,40,3B,3C,51,3C,44,47,3C,3D,47,40,0000  ; NO PICTURE AVAILABLE

***********

ALERTFIN      LDA       NOWINDOWFLAG         ; NETTOYAGE SURFACE
              BEQ       ALERTFIN0
              RTS
ALERTFIN0     LDY       #$0032               ; 51 LIGNES
ALERTF0       LDX       #$0046               ; 144 POINTS
ALERTF1       LDAL      $012000,X
ALERTF2       STAL      $012000,X
              DEX
              DEX
              BPL       ALERTF1
              LDA       ALERTF1+1            ; LIGNE SUIVANTE
              CLC
              ADC       #$00A0
              STA       ALERTF1+1
              STA       ALERTF2+1
              DEY                            ; FIN ?
              BPL       ALERTF0
              RTS

PLEASE        LDA       #$9EA0               ; INIT PLEASE
              STA       PLEASE1+1
              LDA       #$5237
              STA       PLEASE2+1
              STA       PLEASEF1+1
              STA       PLEASEF2+1
              LDY       #$0012               ; 19 LIGNES
PLEASE0       LDX       #$002E               ; 96 POINTS
PLEASE1       LDAL      $048000,X
PLEASE2       STAL      $E12000,X
              DEX
              DEX
              BPL       PLEASE1
              LDA       PLEASE1+1            ; LIGNE SUIVANTE
              CLC
              ADC       #$00A0
              STA       PLEASE1+1
              LDA       PLEASE2+1
              CLC
              ADC       #$00A0
              STA       PLEASE2+1
              DEY                            ; FIN ?
              BPL       PLEASE0
              RTS

PLEASEF       LDY       #$0012               ; 19 LIGNES
PLEASEF0      LDX       #$002E               ; 96 POINTS
PLEASEF1      LDAL      $012000,X
PLEASEF2      STAL      $012000,X
              DEX
              DEX
              BPL       PLEASEF1
              LDA       PLEASEF1+1           ; LIGNE SUIVANTE
              CLC
              ADC       #$00A0
              STA       PLEASEF1+1
              LDA       PLEASEF2+1
              CLC
              ADC       #$00A0
              STA       PLEASEF2+1
              DEY                            ; FIN ?
              BPL       PLEASEF0
              RTS

****************************************************

