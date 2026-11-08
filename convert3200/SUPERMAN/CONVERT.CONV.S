
                 LST   OFF               ; CONVERT AREA

ECR0500          LDA   #CLNCON1+2        ; CONVERT : 3200
                 STA   CLNBMP2+1
                 LDA   #ECR05001
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05001         LDA   #$0000            ; BOUTON=00
                 STA   CLNCON1
                 LDA   #$0000            ; SCRIPT : 3200
                 STA   SCRIPMOD
                 LDA   #$0010            ; 16 COUL MAX
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COULEUR
                 JMP   SOURIS1

ECR0501          LDA   #CLNCON1+2        ; CONVERT : 256
                 STA   CLNBMP2+1
                 LDA   #ECR05011
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05011         LDA   #$0002            ; BOUTON=02
                 STA   CLNCON1
                 LDA   #$00001           ; SCRIPT : 256
                 STA   SCRIPMOD
                 LDA   #$0010            ; 16 COUL MAX
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COULEUR
                 JMP   SOURIS1

ECR0502          LDA   #CLNCON1+2        ; CONVERT : 16 COULEURS
                 STA   CLNBMP2+1
                 LDA   #ECR05021
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05021         LDA   #$0004            ; BOUTON=04
                 STA   CLNCON1
                 LDA   #$0002
                 STA   SCRIPMOD          ; SCRIPT : 16
                 LDA   #$0010            ; 16 COUL MAX
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COULEUR
                 JMP   SOURIS1

ECR0503          LDA   #CLNCON1+2        ; CONVERT : 16 GREYSCALE
                 STA   CLNBMP2+1
                 LDA   #ECR05031
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05031         LDA   #$0006            ; BOUTON=06
                 STA   CLNCON1
                 LDA   #$0010            ; 16 COUL MAX
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COULEUR
                 JMP   SOURIS1

ECR0504          LDA   #CLNCON1+2        ; CONVERT : PRINTSHOP
                 STA   CLNBMP2+1
                 LDA   #ECR05041
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05041         LDA   #$0008            ; BOUTON=08
                 STA   CLNCON1
                 LDA   #$0010            ; 16 COUL MAX
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COULEUR
                 JMP   SOURIS1

ECR0505          LDA   #CLNCON1+2        ; CONVERT : ALL
                 STA   CLNBMP2+1
                 LDA   #ECR05051
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05051         LDA   #$000A            ; BOUTON=0A
                 STA   CLNCON1
                 JMP   SOURIS1

ECR0506          LDA   #CLNCON1+2        ; CONVERT : NONE
                 STA   CLNBMP2+1
                 LDA   #ECR05061
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05061         LDA   #$000C            ; BOUTON=0C
                 STA   CLNCON1
                 JMP   SOURIS1

ECR0507          LDA   #CLNCON3+2        ; CONVERT : RED
                 STA   CLNBMP2+1
                 LDA   #ECR05071
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05071         LDA   #$0000            ; BOUTON=00
                 STA   CLNCON3
                 JMP   SOURIS1

ECR0508          LDA   #CLNCON3+2        ; CONVERT : GREY
                 STA   CLNBMP2+1
                 LDA   #ECR05081
                 STA   BOUTON3+1
                 JMP   BOUTON
ECR05081         LDA   #$0002            ; BOUTON=02
                 STA   CLNCON3
                 JMP   SOURIS1

ECR0509          LDX   SECR2+1           ; CONVERT : +
                 LDA   #ECR05090
                 STA   BOMPER5+1
                 JMP   BOMPER
ECR05090         LDA   COPELI            ; +1
                 CMP   #$0010
                 BEQ   ECR05092
                 INC
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COUL
ECR05092         JMP   SOURIS

ECR0510          LDX   SECR2+1           ; CONVERT : -
                 LDA   #ECR05100
                 STA   BOMPER5+1
                 JMP   BOMPER
ECR05100         LDA   COPELI            ; -1
                 CMP   #$0001
                 BEQ   ECR05102
                 DEC
                 STA   COPELI
                 JSR   ECR05091          ; AFFICHAGE NB COUL
ECR05102         JMP   SOURIS

ECR0511          LDX   SECR2+1           ; CONVERT : VIEW AREA
                 LDA   #ECR05111
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR05111         JSR   TOUCHENFONCE
                 JSR   STATGO
                 LDA   #$0001            ; PRINTSHOP FLAG
                 STA   CONVIRVIEWFL
                 LDA   TOUCHPOMME        ; AFFICHAGE POINTS/PALETTE(S)
                 BEQ   ECR05112
                 JMP   CONVIEWPALE       ; PALETTE(S)
ECR05112         JMP   CONVIEWAREA       ; POINTS

ECR0512          LDX   SECR2+1           ; CONVERT : CONVERT AREA
                 LDA   #ECR05120
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR05120         JSR   TOUCHENFONCE
                 JSR   STATGO            ; CALCULE LES STATISTIQUES
                 STZ   CONVIRVIEWFL
                 JSR   CONVERTAREA       ; CONVERSION
                 JMP   SOURIS1

ECR05121         RTS                     ; AUCUNE CONVERSION (16 GREY/NONE)

ECR0513          LDX   SECR2+1           ; CONVERT : CONVERT LINE
                 LDA   #ECR05130
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR05130         JSR   STATGO            ; CALCUL STATISTICS
                 LDA   #$0009            ; IMAGE LINE
                 JMP   PICT

ECR0514          LDX   SECR2+1           ; CONVERT : EXIT
                 LDA   #ECR05140
                 STA   BUMPER5+1
                 JMP   BUMPER
ECR05140         LDA   #$0001            ; IMAGE MAIN
                 JMP   PICT

TOUCHENFONCE     STZ   TOUCHPOMME        ; BOUTON ENFONCE ?
                 STZ   TOUCHOPTION
                 LDAL  $00C025
                 AND   #$0080
                 BEQ   TOUCHENFONCE1
                 INC   TOUCHPOMME
TOUCHENFONCE1    LDAL  $00C025
                 AND   #$0040
                 BEQ   TOUCHENFONCE2
                 INC   TOUCHOPTION
TOUCHENFONCE2    RTS

TOUCHPOMME       HEX   0000              ; 1:ENFONCE
TOUCHOPTION      HEX   0000
***************

ECR05091         LDA   #$81CA            ; AFFICHAGE COPELI
                 STA   ADRE
                 LDA   COPELI
                 STA   VALH
                 JSR   TRANS
                 RTS
COPELI           HEX   1000              ; COLORS PER LINES

***************

CONVERTAREA      LDX   CLNCON1           ; AIGUILLE VERS LA ROUTINE DE CONVERSION
                 JSR   (CONVAREATAB,X)
                 RTS

CONVIEWAREA      LDX   CLNCON1           ; AIGUILLE VERS LA ROUTINE D'AFFICHAGE
                 BEQ   CONVIEWAREA1      ; L'IMAGE 3200 EST TJS VISIBLE
                 LDA   CONV3200FLAG,X    ; IMAGE DEJA CONVERTIT ?
                 BNE   CONVIEWAREA1
                 JSR   STATGO            ; STATISTICS
                 JSR   CONVERTAREA       ; ON FORCE LA CONVERSION
CONVIEWAREA1     LDX   CLNCON1
                 JMP   (CONVIEWATAB,X)

CONVIEWPALE      LDX   CLNCON1           ; AIGUILLE VERS LA ROUTINE D'AFFICHAGE
                 BEQ   CONVIEWPALE1      ; IMAGE 3200 TJS VISIBLE
                 LDA   CONV3200FLAG,X    ; IMAGE DEJA CONVERTIT ?
                 BNE   CONVIEWPALE1
                 JSR   STATGO            ; STATISTICS
                 JSR   CONVERTAREA       ; ON FORCE LA CONVERSION
CONVIEWPALE1     LDX   CLNCON1
                 JMP   (CONVIEWPTAB,X)

CONVAREATAB      DA    CONVAR,CONVER,CONVOR,CONVUR,CONVIR,CONVARALL,ECR05121
CONVIEWATAB      DA    AFFICHPT,AFFUCHPT,AFFOCHPT,AFFGCHPT,AFFPCHPT,SOURIS1,SOURIS1
CONVIEWPTAB      DA    AFFICHPA,AFFUCHPA,AFFOCHPA,AFFGCHPA,AFFPCHPA,SOURIS1,SOURIS1

CONV3200FLAG     HEX   0000              ; IMAGE 3200 COUL DEJA CONVERTIT
CONV256FLAG      HEX   0000              ; IMAGE 256 COUL DEJA CONVERTIT
CONV16FLAG       HEX   0000              ; IMAGE 16 COUL DEJA CONVERTIT
CONV16GFLAG      HEX   0000              ; IMAGE 16 GREY DEJA CONVERTIT
CONVPSHPFLAG     HEX   0000              ; IMAGE PRINTSHOP DEJA CONVERTIT

*****************************************************************************
***************************  CONVERT AREA 3200  *****************************
*****************************************************************************

CONVAR           LDA   NOWINDOWFLAG      ; CONVERT ALL OU NORMAL ?
                 BEQ   CONVAR1
                 JMP   CONVARAUTO

CONVAR1          LDA   TOUCHPOMME
                 BEQ   CONVAR11
                 STZ   CONV3200FLAG      ; ON FORCE LA CONVERSION
                 LDX   #$018E            ; 200
                 LDA   #$0000
CONVAR12         STA   CONVTAB1,X
                 DEX
                 DEX
                 BPL   CONVAR12
                 BRA   CONVARMANUEL

CONVAR11         LDA   CONV3200FLAG      ; CONVERTI L'IMAGE : 200 LIGNES
                 BEQ   CONVARMANUEL
                 RTS

CONVARMANUEL     LDA   #$0002            ; FENETRE : MODE 3200
                 STA   WORKINGI
                 JSR   WORKING
                 LDA   #$61F6
                 STA   ADRE
                 LDA   #$E120
                 STA   AFTCA2+2
                 STA   AFTCA4+2
                 SEI                     ; INTERRUPTION DISABLED

                 LDA   NUMLINE           ; SAUVEGARDE NUMLINE
                 STA   CONVNUSV
                 STZ   CONVOSII          ; VALEUR MAX DU PARCOURS DANS LE SCRIPT

                 LDA   CLNOPT3           ; CONVERTION DE CERTAINES LIGNES: FROM-TO
                 BEQ   CONVAR4

                 LDX   #$0001            ; 200 LIGNES
CONVAR2          STX   NUMLINE           ; NUMERO LIGNE
                 STX   VALH              ; AFFICHAGE NUMERO LIGNE
                 PHX
                 JSR   TRANS
CONVAR88         JSR   CONVLINE          ; CONVERSION
                 PLX
                 LDA   CONVSCIN          ; VALEUR MAX DU SCRIPT
                 CMP   CONVOSII
                 BMI   CONVAR3
                 STA   CONVOSII
CONVAR3          JSR   CONVARKBD         ; CLAVIER ?
                 INX
                 CPX   #$00C9            ; 200
                 BNE   CONVAR2
                 LDA   #$0001            ; IMAGE 3200 CONVERTIE ENTIEREMENT
                 STA   CONV3200FLAG
                 BRA   CONVARFIN

CONVAR4          LDA   OPTTO             ; FROM
                 INC
                 STA   CONVAR7+1
                 LDX   OPTFROM
CONVAR5          STX   NUMLINE           ; NUMERO DE LIGNE
                 STX   VALH
                 PHX
                 JSR   TRANS             ; AFFICHAGE NUMERO
                 JSR   CONVLINE          ; CONVERSION
                 PLX
                 LDA   CONVSCIN          ; VALEUR MAX DU SCRIPT
                 CMP   CONVOSII
                 BMI   CONVAR6
                 STA   CONVOSII
CONVAR6          JSR   CONVARKBD         ; CLAVIER ?
                 INX
CONVAR7          CPX   #$A0A0
                 BNE   CONVAR5

CONVARFIN        LDA   CONVNUSV
                 STA   NUMLINE
                 JSR   ALERTFIN          ; ENLEVE LA FENETRE
                 LDA   #$0120
                 STA   AFTCA2+2
                 STA   AFTCA4+2
                 CLI                     ; INTERRUPTION
                 RTS

CONVARKBD        LDAL  $00BFFF
                 BPL   CONVARKBD1
                 STAL  $00C010
                 AND   #$FF00
                 CMP   #$9B00            ; ESC
                 BNE   CONVARKBD1
                 PLA                     ; RECUPERE L'ADRESSE DU JSR
                 BRA   CONVARFIN
CONVARKBD1       RTS

CONVNUSV         HEX   0000              ; SAUVEGARDE DE NUMLINE

CONVARAUTO       LDA   NUMLINE           ; CONVERSION 3200 AUTOMATIQUE : ALL
                 STA   CONVNUSV
                 LDX   #$0001            ; 200 LIGNES
CONVARAUTO2      STX   NUMLINE           ; NUMERO LIGNE
                 PHX
                 JSR   CONVLINE          ; CONVERSION DE LA LIGNE
                 PLX
                 INX
                 CPX   #$00C9            ; 200
                 BNE   CONVARAUTO2
                 LDA   #$0001            ; IMAGE 3200 CONVERTIE ENTIEREMENT
                 STA   CONV3200FLAG
                 LDA   CONVNUSV
                 STA   NUMLINE
                 RTS

***********************************************************************
********************  CONVERSION D'UNE LIGNE  *************************

CONVLINE         LDA   NUMLINE           ; LIGNE DEJA CONVERTIE ?
                 DEC
                 ASL
                 TAX
                 LDA   CONVTAB1,X
                 BEQ   CONVLINE1
                 RTS

CONVLINE1        JSR   CONV3200INIT      ; REMPLISSAGE DES TABLEAUX

                 LDA   CONV3200NBCOLI    ; CONDITION D'ARRET SUR LE NB DE COUL SOUHAITE
                 CMP   COLOR3200NB
                 BMI   CONVLINE2
                 JSR   CONVLINEFIN       ; FIN : REMAP 1 LIGNE + PALETTE
                 RTS

CONVLINE2        LDX   CONVSCIN          ; FREQ MAX
                 LDA   CONVSCR2,X
                 INC
                 STA   CONVLINE4+1

                 LDA   COLOR3200NB       ; ON PARCOURS LE TABLEAU
                 DEC
                 ASL
                 TAX
CONVLINE3        LDA   CONVTRTAB,X
                 TAY                     ; **
                 LSR
                 STA   SELECIND          ; INDICE QUI VA SERVIR DE REF POUR LA COUL
                 LDA   LINECOFRTAB,Y     ; **
CONVLINE4        CMP   #$A0A0            ; FREQ MAX AUTORISEE
                 BCS   CONVLINE10        ; BRANCH SI >=
                 LDY   CONVSCIN
                 LDA   CONVSCR2,Y
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONVLINE7
                 PHX
                 JSR   LINEBRC           ; CALCUL DE LA VALEUR LA + PROCHE
                 BRA   CONVLINE8
CONVLINE7        PHX                     ; ON CHERCHE UNE DIFF
                 JSR   LINEBRD
                 BEQ   CONVLINE11        ; DIFF=0, ON A PAS TROUVE LA DIFF DESIREE
CONVLINE8        STA   DIFF3200RVB       ; DIFF RVB
                 JSR   CONV3200TEST      ; DOIT T'ON ELIMINER LA COULEUR ? (Y INCHANGE)
                 BCS   CONVLINE6         ; ON ELIMINE LA COULEUR
CONVLINE11       PLX
                 DEX
                 DEX
                 BPL   CONVLINE3
CONVLINE10       INC   CONVSCIN          ; PROCHAINE VALEUR SCRIPT
                 INC   CONVSCIN
                 BRA   CONVLINE2

CONVLINE6        PLX                     ; ON ELIMINE LA COULEUR
                 PHX
                 JSR   CONVMOD           ; MODIF DES TABLEAUX
                 PLX
                 CPX   COLOR3200NB2      ; DOIT T'ON DECREMENTER X ? (FIN DE TABLEAU)
                 BNE   CONVLINE9
                 DEX
                 DEX
CONVLINE9        LDA   CONV3200NBCOLI    ; CONDITION D'ARRET SUR LE NB DE COUL SOUHAITE
                 CMP   COLOR3200NB
                 BMI   CONVLINE3
                 JSR   CONVLINEFIN       ; FIN : REMAP 8 BIT + REMAP GS
                 RTS

LINE3200NBC      HEX   0000              ; NB DE COULEUR-1*2 AU DEPART SUR LA LIGNE
COLOR3200NB      HEX   0000              ; NB DE COULEUR RESTANT SUR LA LIGNE
CONV3200NBCOLI   HEX   1000              ; NB DE COULEUR AUQUEL ON VEUT ARRIVER

******************************************************************************
************************  INIT AVANT CONVERSION  *****************************

CONV3200INIT     LDA   COPELI            ; NB COULEUR DESIREE
                 STA   CONV3200NBCOLI
                 LDA   NUMLINE
                 DEC
                 ASL
                 TAX
                 LDA   #$0001
                 STA   CONVTAB1,X        ; LIGNE CONVERTIE
                 JSR   LINERMP           ; LINENBC,LINECOFRTAB,LINEREFETAB
                 LDA   LINENBC
                 STA   COLOR3200NB
                 DEC
                 ASL
                 STA   LINE3200NBC
                 JSR   PALESUBSINIT      ; MET LES VALEURS DANS TRANSTAB1
                 JSR   CONV3200TR        ; TRI DES FREQUENCES
                 STZ   CONVSCIN          ; INDICE TABLEAU SCRIPT
                 RTS

***********  TRI DES FREQUENCES

CONV3200TR       LDA   LINEREFETAB       ; INIT
                 ASL
                 STA   CONVTRTAB         ; INDICE*2
                 LDA   LINENBC
                 CMP   #$0001            ; 1 COULEUR, DEJA TRIE...
                 BEQ   CONV3200TR0
                 ASL
                 STA   CONV3200TR2+1
                 LDY   #$0002            ; POUR CHAQUE COULEUR
CONV3200TR1      LDA   LINEREFETAB,Y
                 ASL
                 TAX
                 LDA   LINECOFRTAB,X     ; FREQUENCE SUR LA LIGNE
                 PHY
                 JSR   CONV3200TRPLACE   ; PLACE LA COULEUR
                 PLY
                 INY
                 INY
CONV3200TR2      CPY   #$A0A0
                 BNE   CONV3200TR1
CONV3200TR0      RTS

CONV3200TRPLACE  PHX
                 STA   CONV3200TR4+1     ; VALEUR DE LA FREQ
                 STY   CONV3200TR5+1     ; NB COULEUR DEJA TRIEE
                 LDY   #$0000
CONV3200TR3      LDA   CONVTRTAB,Y       ; INDICE PALETTE DE LA COULEUR
                 TAX
                 LDA   LINECOFRTAB,X     ; FREQ DE LA COULEUR
CONV3200TR4      CMP   #$A0A0
                 BCC   CONV3200TR6       ; BRANCH SI <
                 INY
                 INY
CONV3200TR5      CPY   #$A0A0
                 BNE   CONV3200TR3
                 TYX                     ; ON PLACE A LA FIN
                 BRA   CONV3200TR9
CONV3200TR6      STY   CONV3200TR8+1     ; ON A TROUVE LA PLACE : Y
                 LDX   CONV3200TR5+1
CONV3200TR7      LDA   CONVTRTAB-2,X     ; ON DECALE
                 STA   CONVTRTAB,X
                 DEX
                 DEX
CONV3200TR8      CPX   #$A0A0
                 BNE   CONV3200TR7

CONV3200TR9      PLA                     ; ON PLACE LA VALEUR (ON DEPILE X AU PASSAGE)
                 STA   CONVTRTAB,X
                 RTS

*******************************************************************************
**********************  REMPLACEMENT D'UNE COULEUR  ***************************

************  TEST SI ON DOIT SUPPRIMER CETTE COULEUR

CONV3200TEST     LDA   SELECIND
                 ASL
                 TAX
                 LDA   LINECOFRTAB,X
                 STA   OLD3200FREQ       ; FREQUENCE DU REMPLACE

                 LDX   CONVSCIN          ; ON PARCOURS LE SCRIPT, 0000 : DEBUT
                 LDA   CONVSCR1,X        ; DIFF RVB SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA DIFF
                 BEQ   CONV3200TEST1
                 LDA   DIFF3200RVB       ; DIFF RVB ENTRE LES 2 COULEURS
                 CMP   CONVSCR1,X        ; DIFF RVB SCRIPT
                 BNE   CONV3200NOPER
                 LDA   CONVSCR2,X        ; VALEUR FREQ SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONV3200PER       ; ON PERMUTTE
                 CMP   OLD3200FREQ       ; FREQ REMPLACE
                 BCS   CONV3200PER       ; PLUS PETITE, ON PERMUTTE
CONV3200NOPER    CLC
                 RTS
CONV3200PER      SEC
                 RTS
CONV3200TEST1    LDA   CONVSCR2,X        ; FREQ SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONV3200NOPER     ; DEUX ----, ON IGNORE : PROCHAINE VALEUR DU SCRIPT
                 CMP   OLD3200FREQ       ; FREQ REMPLACE
                 BCS   CONV3200PER       ; ON PERMUTTE BPL
                 BRA   CONV3200NOPER

OLD3200FREQ      HEX   0000
DIFF3200RVB      HEX   0000

CONVSCIN         HEX   0000              ; INDICE DU SCRIPT DE CONVERSION
CONVOSII         HEX   0000              ; INDICE MAXIMUM DE PARCOURS DU SCRIPT
CONVSCR1         HEX   0100,0200,0300,0400,0500,00FF,0100,0200,0300,0400,0500,00FF  ; VALEUR DE LA DIFF
                 HEX   0100,0200,0300,0400,0500,0100,00FF,0200,0300,0400,0500,0200
                 HEX   00FF,0300,0400,0500,0600,0700,0800,0900,0A00,0100,0200,0300  ; SECURITE
CONVSCR2         HEX   0100,0100,0100,0100,0100,0100,0200,0200,0200,0200,0200,0200  ; FREQ DE LA COULEUR SELEC
                 HEX   0300,0300,0300,0300,0300,00FF,0500,0600,0600,0600,0600,00FF
                 HEX   0900,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF  ; SECURITE

************  MISE A JOUR DES TABLEAUX ET VALEURS : COLOR3200NB,STATCOFR,CONVTRTAB

CONVMOD          STX   OLDFRTRIND        ; INDICE*2 CONVTRTAB REMPLACE
                 LDA   SELECIND
                 STA   OLD3200IND        ; INDICE IMAGE REMPLACE
                 STY   NEW3200IND        ; INDICE IMAGE REMPLACANT
                 TYA
                 ASL
                 STA   CONVMOD1+1

                 LDA   COLOR3200NB       ; UNE COULEUR EN MOINS
                 ASL
                 STA   NBCOLOR3200
                 DEC
                 DEC
                 STA   COLOR3200NB2
                 DEC   COLOR3200NB

                 LDA   OLD3200IND        ; CALCUL NEWFREQVAL
                 ASL
                 TAX
                 LDA   NEW3200IND
                 ASL
                 TAY
                 LDA   LINECOFRTAB,Y
                 CLC
                 ADC   LINECOFRTAB,X
                 STA   NEWFREQVAL

                 LDY   OLDFRTRIND        ; RECHERCHE NEWFRTRIND
                 LDX   COLOR3200NB2
CONVMOD0         LDA   CONVTRTAB,X
CONVMOD1         CMP   #$A0A0            ; INDICE IMAGE REMPLACANT (NEW16IND)*2
                 BEQ   CONVMOD2
                 DEX
                 DEX
                 BPL   CONVMOD0
CONVMOD2         STX   NEWFRTRIND
                 CPX   OLDFRTRIND
                 BMI   CONVMOD3          ; PERMUTE NEW ET OLD ?
                 STX   OLDFRTRIND
                 STY   NEWFRTRIND

CONVMOD3         LDX   NEWFRTRIND        ; CHERCHE FINFTRIND
                 BNE   CONVMOD4
                 STZ   FINFRTRIND        ; 0:ON EST DEJA EN BAS
                 BRA   CONVMODFT6
CONVMOD4         DEX
                 DEX
CONVMODFT1       LDA   CONVTRTAB,X       ; ON CHERCHE L'ENDROIT OU PLACER LA NOUVELLE FREQ
                 TAY
                 LDA   LINECOFRTAB,Y
                 CMP   NEWFREQVAL
                 BCS   CONVMODFT2        ; TROUVE !  (BPL)
                 DEX
                 DEX
                 BPL   CONVMODFT1
CONVMODFT2       INX
                 INX
                 STX   FINFRTRIND

CONVMODFT6       LDX   OLDFRTRIND        ; 1er DECALAGE : ON SUPPRIME CASE OLD
CONVMODFT3       LDA   CONVTRTAB+2,X
                 STA   CONVTRTAB,X
                 INX
                 INX
                 CPX   NBCOLOR3200
                 BNE   CONVMODFT3

                 LDX   NEWFRTRIND        ; 2eme DECALAGE : ON ECRASE CASE NEW
                 CPX   FINFRTRIND
                 BEQ   CONVMODFT5        ; CAS PARTICULIER : PAS DE DECALAGE
CONVMODFT4       LDA   CONVTRTAB-2,X
                 STA   CONVTRTAB,X
                 DEX
                 DEX
                 CPX   FINFRTRIND
                 BNE   CONVMODFT4
CONVMODFT5       LDA   NEW3200IND        ; ON MET L'INDICE NEW A SA PLACE FINALE
                 ASL
                 STA   CONVTRTAB,X

                 LDX   #$00FF            ; MISE A JOUR TRANSTABLE
CONVMODTT1       LDA   TRANSTAB1,X
                 AND   #$00FF
                 CMP   OLD3200IND        ; INDICE DU REMPLACE
                 BNE   CONVMODTT2
                 LDA   TRANSTAB1,X       ; ON REMPLACE
                 AND   #$FF00
                 ORA   NEW3200IND
                 STA   TRANSTAB1,X
CONVMODTT2       DEX
                 BPL   CONVMODTT1

                 LDA   OLD3200IND        ; MISE A JOUR DES VALEURS DES FREQUENCES
                 ASL
                 TAX
                 LDA   NEW3200IND
                 ASL
                 TAY
                 LDA   NEWFREQVAL
                 STA   LINECOFRTAB,Y     ; REMPLACANT += REMPLACE
                 STZ   LINECOFRTAB,X     ; REMPLACE A 0

                 LDX   LINE3200NBC
CONVMODTT3       LDA   LINEREFETAB,X     ; COULEUR NON VALIDE
                 CMP   OLD3200IND
                 BEQ   CONVMODTT4
                 DEX
                 DEX
                 BPL   CONVMODTT3
                 BRK   00                ; NEVER
CONVMODTT4       LDA   #$FFFF
                 STA   LINEREFETAB,X

                 RTS

COLOR3200NB2     HEX   0000              ; NB COULEUR*2 -2
NBCOLOR3200      HEX   0000              ; NB COULEUR*2
OLD3200IND       HEX   0000              ; INDICE IMAGE DU REMPLACE
NEW3200IND       HEX   0000              ; INDICE IMAGE DU REMPLACANT

********************************************************************************
****************************  FIN DE CONVERSION  *******************************

CONVLINEFIN      LDX   #$00FE            ; REMAP LIGNE 8 BIT -> LIGNE 4 BIT GS
                 LDA   #$0000
CONVLINEFIN2     STA   TRANSTAB2,X       ; NETTOY TRANSTAB2
                 DEX
                 DEX
                 BPL   CONVLINEFIN2

                 LDX   #$00FF            ; REMPLI TRANSTAB2
CONVLINEFIN3     LDA   TRANSTAB1,X
                 PHX
                 AND   #$00FF
                 TAY
                 ASL
                 TAX
                 LDA   LINECOFRTAB,X     ; COULEUR VRAIMENT UTILISEE ?
                 BEQ   CONVLINEFIN30
                 LDA   TRANSTAB2,Y
                 ORA   #$0001
                 STA   TRANSTAB2,Y
CONVLINEFIN30    PLX
                 DEX
                 BPL   CONVLINEFIN3

                 LDX   #$001E            ; NETTOY LA PALETTE
                 LDA   #$0000
CONVLINEFIN4     STA   PALETTE3200,X
                 DEX
                 DEX
                 BPL   CONVLINEFIN4

                 LDA   COLOR3200NB       ; REMPLI LA PALETTE
                 DEC
                 ASL
                 TAY
                 LDX   #$00FF
CONVLINEFIN5     LDA   TRANSTAB2,X
                 AND   #$00FF
                 BEQ   CONVLINEFIN6
                 PHX
                 TXA
                 ASL
                 TAX
                 LDA   STATCOL2,X
                 STA   PALETTE3200,Y
                 DEY
                 DEY
                 PLX
CONVLINEFIN6     DEX
                 BPL   CONVLINEFIN5

                 LDA   COLOR3200NB       ; MODIFIE TRANSTAB2
                 DEC
                 STA   CONVLINEFIN8+1
                 LDX   #$00FF
CONVLINEFIN7     LDA   TRANSTAB2,X
                 AND   #$00FF
                 BEQ   CONVLINEFIN9
                 LDA   TRANSTAB2,X
                 AND   #$FF00
CONVLINEFIN8     ORA   #$000F
                 STA   TRANSTAB2,X
                 DEC   CONVLINEFIN8+1
CONVLINEFIN9     DEX
                 BPL   CONVLINEFIN7

                 LDA   NUMLINE
                 DEC
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
                 ADC   #$8000
                 STA   CONVLINEFIN13+1
                 STA   CONVLINEFIN17+1
                 LDA   TABLE,X
                 ASL
                 STA   CONVLINEFIN10+1
                 STA   CONVLINEFIN11+1
                 LDX   #$0000            ; REMAP LA LIGNE
CONVLINEFIN10    LDAL  $20A0A0,X         ; 1er POINT
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB1,Y
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB2,Y
                 AND   #$00FF
                 ASL
                 ASL
                 ASL
                 ASL
                 STA   CONVLINEFIN12+1
                 INX
CONVLINEFIN11    LDAL  $20A0A0,X         ; 2eme POINT
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB1,Y
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB2,Y
                 AND   #$00FF
CONVLINEFIN12    ORA   #$A0A0
                 STA   CONVLINEFIN18+1
CONVLINEFIN17    LDAL  $2280A0
                 AND   #$FF00
CONVLINEFIN18    ORA   #$A0A0
CONVLINEFIN13    STAL  $2280A0
                 INC   CONVLINEFIN13+1
                 INC   CONVLINEFIN17+1
                 INX
                 CPX   #$0140            ; 320
                 BNE   CONVLINEFIN10

                 LDA   NUMLINE
                 DEC
                 ASL
                 ASL
                 ASL
                 ASL
                 ASL                     ; *32
                 CLC
                 ADC   #$C350
                 STA   CONVLINEFIN16+1
                 LDX   #$001E            ; PALETTE LIGNE
CONVLINEFIN15    LDA   PALETTE3200,X
CONVLINEFIN16    STAL  $22C350,X
                 DEX
                 DEX
                 BPL   CONVLINEFIN15

                 RTS

PALETTE3200      DS    16*2

*****************************************************************************
***************************  CONVERT AREA 256  ******************************
*****************************************************************************

CONVER           LDA   TOUCHPOMME        ; CONVERTI L'IMAGE : 16 PALETTES
                 BNE   CONVER0           ; POMME : ON FORCE
                 LDA   CONV256FLAG
                 BEQ   CONVER0
                 RTS

CONVER0          LDA   NOWINDOWFLAG
                 BEQ   CONVER1
                 JMP   CONVERAUTO        ; CONVERT ALL

CONVER1          SEI                     ; INTERRUPTION VIREE
                 JSR   PUTSCB            ; DECIDE DES SCB : MANUEL / AUTOMATIC
                 LDA   #$0003            ; CONVERT MODE 256
                 STA   WORKINGI
                 JSR   WORKING
                 LDA   #$61F6
                 STA   ADRE
                 LDA   #$E120
                 STA   AFTCA2+2
                 STA   AFTCA4+2
                 STZ   ZONEOSII          ; MAX

                 LDX   #$0000            ; 16 PALETTES
CONVER2          PHX
                 STX   ZONENUMBER
                 INX
                 STX   VALH
                 JSR   TRANS             ; AFFICHAGE NUMERO PALETTE
                 LDX   #$00C7
CONVER7          LDA   PICTURESCB,X      ; Y A T'IL DES LIGNES ASSCIEES A
                 AND   #$000F            ; CETTE PALETTE.
                 CMP   ZONENUMBER
                 BEQ   CONVER6
                 DEX
                 BPL   CONVER7
                 BRA   CONVER5
CONVER6          JSR   CONVZONE          ; CONVERTIE LA ZONE
                 LDA   ZONESCIN
                 CMP   ZONEOSII
                 BMI   CONVER5
                 STA   ZONEOSII          ; VALEUR MAX DU SCRIPT
CONVER5          PLX
                 INX
                 CPX   #$0010
                 BNE   CONVER2

CONVERFIN        CLI                     ; INTERRUPTION OK
                 LDX   #$00FE            ; RECOPIE LES SCB
CONVERFIN1       LDA   PICTURESCB,X
CONVERFIN2       STAL  $227D00,X
                 DEX
                 DEX
                 BPL   CONVERFIN1
                 JSR   ALERTFIN          ; ENLEVE LA FENETRE
                 LDA   #$0120
                 STA   AFTCA2+2
                 STA   AFTCA4+2
                 LDA   #$0001
                 STA   CONV256FLAG
                 RTS

ZONENUMBER       HEX   0000
PICTURESCB       DS    256               ; VALEUR DES SCB DE L'IMAGE
PICTURESCB256    DS    256

CONVERAUTO       STZ   ZONEOSII          ; MAX
                 JSR   PUTSCB            ; DECIDE DES SCB
                 LDX   #$0000            ; 16 PALETTES
CONVERAUTO2      PHX
                 STX   ZONENUMBER
                 LDX   #$00C7
CONVERAUTO7      LDA   PICTURESCB,X      ; Y A T'IL DES LIGNES ASSCIEES A
                 AND   #$000F            ; CETTE PALETTE.
                 CMP   ZONENUMBER
                 BEQ   CONVERAUTO6
                 DEX
                 BPL   CONVERAUTO7
                 BRA   CONVERAUTO5
CONVERAUTO6      JSR   CONVZONE          ; CONVERTIE LA ZONE
CONVERAUTO5      PLX
                 INX
                 CPX   #$0010
                 BNE   CONVERAUTO2

                 LDX   #$00FE            ; RECOPIE LES SCB
CONVERAUTOFIN1   LDA   PICTURESCB,X
CONVERAUTOFIN2   STAL  $227D00,X
                 DEX
                 DEX
                 BPL   CONVERAUTOFIN1
                 LDA   #$0001
                 STA   CONV256FLAG
                 RTS

***********************************************************************
*****************  DECIDE DE L'EMPLACEMENT DES SCB  *******************

PUTSCB           LDA   TOUCHOPTION
                 BEQ   PUTSCB1
                 JSR   SCBCHOIX          ; MANUEL
                 RTS

PUTSCB1          LDA   IMAGE256          ; ON GARDE LES SCB ORIGINAUX
                 BEQ   PUTSCB2           ; SI ON A CHARGE UNE IMAGE 16 PALETTES GS
                 LDA   OHS               ; 320 POINTS ?
                 CMP   #$0140
                 BNE   PUTSCB2
                 LDA   OVS               ; 200 LIGNES ?
                 CMP   #$00C8
                 BNE   PUTSCB2
                 LDA   RHS               ; 320 POINTS ?
                 CMP   #$0140
                 BNE   PUTSCB2
                 LDA   RVS               ; 200 LIGNES ?
                 CMP   #$00C8
                 BNE   PUTSCB2
                 LDX   #$00FE            ; OK, ON PREND LES SCB DE L'IMAGE
PUTSCB3          LDA   PICTURESCB256,X
                 STA   PICTURESCB,X
                 DEX
                 DEX
                 BPL   PUTSCB3
                 RTS

PUTSCB2          LDA   #$0001            ; CALCUL LE DEBUT/FIN DE L'IMAGE
                 STA   VALEURSCB
                 LDX   #$00FE
                 LDA   #$0000
SCBPUTLINE5      STA   PICTURESCB,X      ; TOUT @ 0
                 DEX
                 DEX
                 BPL   SCBPUTLINE5

                 LDX   #$0000
SCBPUTLINE1      LDA   NBCLTAB,X
                 AND   #$00FF            ; CALCUL LA 1ere LIGNE DE L'IMAGE
                 CMP   #$0001
                 BNE   SCBPUTLINE2
                 JSR   MEMECOULEUR1      ; 1 COULEUR, MAIS EST CE LA MEME
                 BNE   SCBPUTLINE2
                 INX
                 CPX   #$00C8            ; 200
                 BNE   SCBPUTLINE1
SCBPUTLINE2      STX   BEGINSCB

                 LDX   #$00C7
SCBPUTLINE3      LDA   NBCLTAB,X
                 AND   #$00FF            ; CALCUL LA DERNIERE LIGNE DE L'IMAGE
                 CMP   #$0001
                 BNE   SCBPUTLINE4
                 JSR   MEMECOULEUR2      ; 1 COULEUR, MAIS EST CE LA MEME
                 BNE   SCBPUTLINE4
                 DEX
                 BPL   SCBPUTLINE3
SCBPUTLINE4      STX   ENDSCB

                 LDA   BEGINSCB
                 CMP   #$00C8
                 BNE   SCBPUTLINE6
                 RTS                     ; 1 SEUL PALETTE...
SCBPUTLINE6      LDA   ENDSCB
                 SEC                     ; ZONE VIERGE > 13 LIGNES ?
                 SBC   BEGINSCB
                 CMP   #$00BA            ; 186
                 BMI   SCBPUTLINE60
                 STZ   VALEURSCB         ; PAS DE ZONE VIDE, INUTILE
                 STZ   BEGINSCB          ; ON FORCE L'IMAGE PLEINE
                 LDA   #$00C7
                 STA   ENDSCB
                 LDA   #$000D            ; 13 LIGNES/PALETTE
                 STA   NBLIGNESCB
                 STA   SCBPUTLINE11+1
                 LDX   BEGINSCB          ; 0
                 BRA   SCBPUTLINE10
SCBPUTLINE60     LDA   ENDSCB            ; MOINS DE 15 LIGNES ?
                 SEC
                 SBC   BEGINSCB
                 CMP   #$0010
                 BPL   SCBPUTLINE9
                 LDX   BEGINSCB          ; MOINS DE 15 : 1 PALETTE / LIGNE
SCBPUTLINE7      LDA   PICTURESCB,X
                 ORA   VALEURSCB         ; 01,02,03,...
                 STA   PICTURESCB,X
                 CPX   ENDSCB
                 BEQ   SCBPUTLINE8
                 INC   VALEURSCB
                 INX
                 BRA   SCBPUTLINE7
SCBPUTLINE8      RTS
SCBPUTLINE9      JSR   SCBNBLIGNE        ; PLUS DE 15 : PLUSIEUR LIGNES/PALETTES
                 LDX   BEGINSCB
SCBPUTLINE10     LDA   PICTURESCB,X
                 ORA   VALEURSCB         ; 01,02,03,...
                 STA   PICTURESCB,X
                 CPX   ENDSCB
                 BEQ   SCBPUTLINE12
                 INX
SCBPUTLINE11     LDA   #$A0A0            ; ON CHANGE LA VALEUR DE LA PALETTE
                 DEC   SCBPUTLINE11+1
                 BNE   SCBPUTLINE10
                 LDA   NBLIGNESCB
                 STA   SCBPUTLINE11+1
                 LDA   VALEURSCB
                 INC
                 CMP   #$0010
                 BEQ   SCBPUTLINE10      ; ON NE DEPASSE PAS 10
                 STA   VALEURSCB
                 BRA   SCBPUTLINE10
SCBPUTLINE12     RTS

*********

SCBNBLIGNE       CMP   #$00C7            ; CALCUL LE NB DE LIGNE PAR PALETTE
                 BEQ   SCBNBLIGNE1
                 LDY   #$0000
SCBNBLIGNE3      INY                     ; ON DIVISE PAR 15, 1 PALETTE RESERVEE
                 SEC
                 SBC   #$000F
                 CMP   #$000F
                 BPL   SCBNBLIGNE3
                 TYA
                 BRA   SCBNBLIGNE2
SCBNBLIGNE1      STZ   VALEURSCB         ; 200 LIGNES, PAS DE ZONE VIDE
                 LDA   #$000D            ; 13 LIGNES/PALETTE
SCBNBLIGNE2      STA   NBLIGNESCB
                 STA   SCBPUTLINE11+1
                 RTS

MEMECOULEUR1     CPX   #$0000            ; TESTE SI LA COULEUR EST LA MEME SUR
                 BNE   MEMECOULEUR10     ; 1ere LIGNE
                 LDA   #$0000
                 RTS
MEMECOULEUR10    PHX
                 DEX
                 TXA                     ; 2 LIGNE CONSECUTIVES
                 ASL
                 TAX
                 LDA   TABLE,X
                 ASL
                 TAX
MEMECOULEUR11    LDAL  $220140,X
MEMECOULEUR12    CMPL  $220000,X
                 BEQ   MEMECOULEUR13
                 PLX
                 LDA   #$0001
                 RTS
MEMECOULEUR13    PLX
                 LDA   #$0000
                 RTS

MEMECOULEUR2     CPX   #$00C7            ; TESTE SI LA COULEUR EST LA MEME SUR
                 BNE   MEMECOULEUR20     ; DERNIERE LIGNE
                 LDA   #$0000
                 RTS
MEMECOULEUR20    PHX
                 TXA                     ; 2 LIGNE CONSECUTIVES
                 ASL
                 TAX
                 LDA   TABLE,X
                 ASL
                 TAX
MEMECOULEUR21    LDAL  $220000,X
MEMECOULEUR22    CMPL  $220140,X
                 BEQ   MEMECOULEUR23
                 PLX
                 LDA   #$0001
                 RTS
MEMECOULEUR23    PLX
                 LDA   #$0000
                 RTS

***********

BEGINSCB         HEX   0000              ; NUMERO DE LA 1ere LIGNE DE L'IMAGE
ENDSCB           HEX   0000              ; NUMERO DE LA DERNIERE LIGNE DE L'IMAGE
VALEURSCB        HEX   0100
NBLIGNESCB       HEX   0000              ; NB DE LIGNE POUR 1 PALETTE

IMAGE256         HEX   0000              ; 0:NON, 1:OUI, ON A CHARGE UNE 16 PAL

***********************************************************************
********************  CONVERSION D'UNE ZONE  **************************

CONVZONE         JSR   CONVZONEINIT      ; REMPLISSAGE DES TABLEAUX

                 LDA   CONVZONENBCOLI    ; CONDITION D'ARRET SUR LE NB DE COUL SOUHAITE
                 CMP   COLORZONENB
                 BMI   CONVZONE2
                 JSR   CONVZONEFIN       ; FIN : REMAP 1 ZONE + PALETTE
                 RTS

CONVZONE2        LDX   ZONESCIN          ; FREQ MAX
                 LDA   ZONESCR2,X
                 INC
                 STA   CONVZONE4+1

                 LDA   COLORZONENB       ; ON PARCOURS LE TABLEAU
                 DEC
                 ASL
                 TAX
CONVZONE3        LDA   CONVTRTAB,X
                 TAY                     ; **
                 LSR
                 STA   SELECIND          ; INDICE QUI VA SERVIR DE REF POUR LA COUL
                 LDA   LINECOFRTAB,Y     ; **
CONVZONE4        CMP   #$A0A0            ; FREQ MAX AUTORISEE
                 BCS   CONVZONE10        ; BRANCH SI >=
                 LDY   ZONESCIN
                 LDA   ZONESCR2,Y
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONVZONE7
                 PHX
                 JSR   ZONEBRC           ; CALCUL DE LA VALEUR LA + PROCHE
                 BRA   CONVZONE8
CONVZONE7        PHX                     ; ON CHERCHE UNE DIFF
                 JSR   ZONEBRD
                 BEQ   CONVZONE11        ; DIFF=0, ON A PAS TROUVE LA DIFF DESIREE
CONVZONE8        STA   DIFFZONERVB       ; DIFF RVB
                 JSR   CONVZONETEST      ; DOIT T'ON ELIMINER LA COULEUR ? (Y INCHANGE)
                 BCS   CONVZONE6         ; ON ELIMINE LA COULEUR
CONVZONE11       PLX
                 DEX
                 DEX
                 BPL   CONVZONE3
CONVZONE10       INC   ZONESCIN          ; PROCHAINE VALEUR SCRIPT
                 INC   ZONESCIN
                 BRA   CONVZONE2

CONVZONE6        PLX                     ; ON ELIMINE LA COULEUR
                 PHX
                 JSR   ZONEMOD           ; MODIF DES TABLEAUX
                 PLX
                 CPX   COLORZONENB2      ; DOIT T'ON DECREMENTER X ? (FIN DE TABLEAU)
                 BNE   CONVZONE9
                 DEX
                 DEX
CONVZONE9        LDA   CONVZONENBCOLI    ; CONDITION D'ARRET SUR LE NB DE COUL SOUHAITE
                 CMP   COLORZONENB
                 BMI   CONVZONE3
                 JSR   CONVZONEFIN       ; FIN : REMAP 8 BIT + REMAP GS
                 RTS

LINEZONENBC      HEX   0000              ; NB DE COULEUR-1*2 AU DEPART SUR LA LIGNE
COLORZONENB      HEX   0000              ; NB DE COULEUR RESTANT SUR LA LIGNE
CONVZONENBCOLI   HEX   1000              ; NB DE COULEUR AUQUEL ON VEUT ARRIVER

******************************************************************************
************************  INIT AVANT CONVERSION  *****************************

CONVZONEINIT     LDA   COPELI            ; NB COULEUR DESIREE
                 STA   CONVZONENBCOLI
                 JSR   ZONERMP           ; ZONENBC,LINECOFRTAB,LINEREFETAB
                 LDA   ZONENBC
                 STA   COLORZONENB
                 DEC
                 ASL
                 STA   LINEZONENBC
                 JSR   PALESUBSINIT      ; MET LES VALEURS DANS TRANSTAB1 (00,01,02,...,FF)
                 JSR   CONVZONETR        ; TRI DES FREQUENCES
                 STZ   ZONESCIN          ; INDICE TABLEAU SCRIPT
                 RTS

***********  TRI DES FREQUENCES

CONVZONETR       LDA   LINEREFETAB       ; INIT
                 ASL
                 STA   CONVTRTAB         ; INDICE*2 : TABLE DES INDICES TRIES
                 LDA   ZONENBC
                 CMP   #$0001            ; 1 COULEUR, DEJA TRIE...
                 BEQ   CONVZONETR0
                 ASL
                 STA   CONVZONETR2+1
                 LDY   #$0002            ; POUR CHAQUE COULEUR
CONVZONETR1      LDA   LINEREFETAB,Y
                 ASL
                 TAX
                 LDA   LINECOFRTAB,X     ; FREQUENCE SUR LA LIGNE
                 PHY
                 JSR   CONVZONETRPLACE   ; PLACE LA COULEUR
                 PLY
                 INY
                 INY
CONVZONETR2      CPY   #$A0A0
                 BNE   CONVZONETR1
CONVZONETR0      RTS

CONVZONETRPLACE  PHX
                 STA   CONVZONETR4+1     ; VALEUR DE LA FREQ
                 STY   CONVZONETR5+1     ; NB COULEUR DEJA TRIEE
                 LDY   #$0000
CONVZONETR3      LDA   CONVTRTAB,Y       ; INDICE PALETTE DE LA COULEUR
                 TAX
                 LDA   LINECOFRTAB,X     ; FREQ DE LA COULEUR
CONVZONETR4      CMP   #$A0A0
                 BCC   CONVZONETR6       ; BRANCH SI <
                 INY
                 INY
CONVZONETR5      CPY   #$A0A0
                 BNE   CONVZONETR3
                 TYX                     ; ON PLACE A LA FIN
                 BRA   CONVZONETR9
CONVZONETR6      STY   CONVZONETR8+1     ; ON A TROUVE LA PLACE : Y
                 LDX   CONVZONETR5+1
CONVZONETR7      LDA   CONVTRTAB-2,X     ; ON DECALE
                 STA   CONVTRTAB,X
                 DEX
                 DEX
CONVZONETR8      CPX   #$A0A0
                 BNE   CONVZONETR7
CONVZONETR9      PLA                     ; ON PLACE LA VALEUR (ON DEPILE X AU PASSAGE)
                 STA   CONVTRTAB,X
                 RTS

*******************************************************************************
**********************  REMPLACEMENT D'UNE COULEUR  ***************************

************  TEST SI ON DOIT SUPPRIMER CETTE COULEUR

CONVZONETEST     LDA   SELECIND
                 ASL
                 TAX
                 LDA   LINECOFRTAB,X
                 STA   OLDZONEFREQ       ; FREQUENCE DU REMPLACE

                 LDX   ZONESCIN          ; ON PARCOURS LE SCRIPT, 0000 : DEBUT
                 LDA   ZONESCR1,X        ; DIFF RVB SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA DIFF
                 BEQ   CONVZONETEST1
                 LDA   DIFFZONERVB       ; DIFF RVB ENTRE LES 2 COULEURS
                 CMP   ZONESCR1,X        ; DIFF RVB SCRIPT
                 BNE   CONVZONENOPER
                 LDA   ZONESCR2,X        ; VALEUR FREQ SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONVZONEPER       ; ON PERMUTTE
                 CMP   OLDZONEFREQ       ; FREQ REMPLACE
                 BCS   CONVZONEPER       ; PLUS PETITE, ON PERMUTTE
CONVZONENOPER    CLC
                 RTS
CONVZONEPER      SEC
                 RTS
CONVZONETEST1    LDA   ZONESCR2,X        ; FREQ SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONVZONENOPER     ; DEUX ----, ON IGNORE : PROCHAINE VALEUR DU SCRIPT
                 CMP   OLDZONEFREQ       ; FREQ REMPLACE
                 BCS   CONVZONEPER       ; ON PERMUTTE BPL
                 BRA   CONVZONENOPER

OLDZONEFREQ      HEX   0000
DIFFZONERVB      HEX   0000

ZONESCIN         HEX   0000              ; INDICE DU SCRIPT DE CONVERSION
ZONEOSII         HEX   0000              ; INDICE MAXIMUM DE PARCOURS DU SCRIPT
ZONESCR1         HEX   00FF,0100,0200,0300,0100,00FF,0200,0300,00FF,0200,0300,0200  ; VALEUR DE LA DIFF
                 HEX   00FF,0300,00FF,0300,0400,0500,0600,0700,0800,0900,0A00,0B00  ;
                 HEX   0100,0200,0300,0400,0500,0600,0600,0800,0900,0A00,0B00,0C00  ; SECURITE
ZONESCR2         HEX   0400,2000,1000,0800,00FF,0800,2000,1000,1000,4000,2000,00FF  ; FREQ DE LA COULEUR SELEC
                 HEX   2000,4000,4000,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF  ;
                 HEX   1000,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF

************  MISE A JOUR DES TABLEAUX ET VALEURS : COLORZONENB,STATCOFR,CONVTRTAB

ZONEMOD          STX   OLDFRTRIND        ; INDICE*2 CONVTRTAB REMPLACE
                 LDA   SELECIND
                 STA   OLDZONEIND        ; INDICE IMAGE REMPLACE
                 STY   NEWZONEIND        ; INDICE IMAGE REMPLACANT
                 TYA
                 ASL
                 STA   ZONEMOD1+1

                 LDA   COLORZONENB       ; UNE COULEUR EN MOINS
                 ASL
                 STA   NBCOLORZONE
                 DEC
                 DEC
                 STA   COLORZONENB2
                 DEC   COLORZONENB

                 LDA   OLDZONEIND        ; CALCUL NEWFREQVAL
                 ASL
                 TAX
                 LDA   NEWZONEIND
                 ASL
                 TAY
                 LDA   LINECOFRTAB,Y
                 CLC
                 ADC   LINECOFRTAB,X
                 STA   NEWFREQVAL

                 LDY   OLDFRTRIND        ; RECHERCHE NEWFRTRIND
                 LDX   COLORZONENB2
ZONEMOD0         LDA   CONVTRTAB,X
ZONEMOD1         CMP   #$A0A0            ; INDICE IMAGE REMPLACANT (NEW16IND)*2
                 BEQ   ZONEMOD2
                 DEX
                 DEX
                 BPL   ZONEMOD0
ZONEMOD2         STX   NEWFRTRIND
                 CPX   OLDFRTRIND
                 BMI   ZONEMOD3          ; PERMUTE NEW ET OLD ?
                 STX   OLDFRTRIND
                 STY   NEWFRTRIND

ZONEMOD3         LDX   NEWFRTRIND        ; CHERCHE FINFTRIND
                 BNE   ZONEMOD4
                 STZ   FINFRTRIND        ; 0:ON EST DEJA EN BAS
                 BRA   ZONEMODFT6
ZONEMOD4         DEX
                 DEX
ZONEMODFT1       LDA   CONVTRTAB,X       ; ON CHERCHE L'ENDROIT OU PLACER LA NOUVELLE FREQ
                 TAY
                 LDA   LINECOFRTAB,Y
                 CMP   NEWFREQVAL
                 BCS   ZONEMODFT2        ; TROUVE !  (BPL)
                 DEX
                 DEX
                 BPL   ZONEMODFT1
ZONEMODFT2       INX
                 INX
                 STX   FINFRTRIND

ZONEMODFT6       LDX   OLDFRTRIND        ; 1er DECALAGE : ON SUPPRIME CASE OLD
ZONEMODFT3       LDA   CONVTRTAB+2,X
                 STA   CONVTRTAB,X
                 INX
                 INX
                 CPX   NBCOLORZONE
                 BNE   ZONEMODFT3

                 LDX   NEWFRTRIND        ; 2eme DECALAGE : ON ECRASE CASE NEW
                 CPX   FINFRTRIND
                 BEQ   ZONEMODFT5        ; CAS PARTICULIER : PAS DE DECALAGE
ZONEMODFT4       LDA   CONVTRTAB-2,X
                 STA   CONVTRTAB,X
                 DEX
                 DEX
                 CPX   FINFRTRIND
                 BNE   ZONEMODFT4
ZONEMODFT5       LDA   NEWZONEIND        ; ON MET L'INDICE NEW A SA PLACE FINALE
                 ASL
                 STA   CONVTRTAB,X

                 LDX   #$00FF            ; MISE A JOUR TRANSTABLE
ZONEMODTT1       LDA   TRANSTAB1,X
                 AND   #$00FF
                 CMP   OLDZONEIND        ; INDICE DU REMPLACE
                 BNE   ZONEMODTT2
                 LDA   TRANSTAB1,X       ; ON REMPLACE
                 AND   #$FF00
                 ORA   NEWZONEIND
                 STA   TRANSTAB1,X
ZONEMODTT2       DEX
                 BPL   ZONEMODTT1

                 LDA   OLDZONEIND        ; MISE A JOUR DES VALEURS DES FREQUENCES
                 ASL
                 TAX
                 LDA   NEWZONEIND
                 ASL
                 TAY
                 LDA   NEWFREQVAL
                 STA   LINECOFRTAB,Y     ; REMPLACANT += REMPLACE
                 STZ   LINECOFRTAB,X     ; REMPLACE A 0

                 LDX   LINEZONENBC
ZONEMODTT3       LDA   LINEREFETAB,X     ; COULEUR NON VALIDE
                 CMP   OLDZONEIND
                 BEQ   ZONEMODTT4
                 DEX
                 DEX
                 BPL   ZONEMODTT3
                 BRK   00                ; NEVER
ZONEMODTT4       LDA   #$FFFF
                 STA   LINEREFETAB,X

                 RTS

COLORZONENB2     HEX   0000              ; NB COULEUR*2 -2
NBCOLORZONE      HEX   0000              ; NB COULEUR*2
OLDZONEIND       HEX   0000              ; INDICE IMAGE DU REMPLACE
NEWZONEIND       HEX   0000              ; INDICE IMAGE DU REMPLACANT

********************************************************************************
****************************  FIN DE CONVERSION  *******************************

CONVZONEFIN      LDX   #$00FE            ; REMAP ZONE 8 BIT -> ZONE 4 BIT GS
                 LDA   #$0000
CONVZONEFIN2     STA   TRANSTAB2,X       ; NETTOY TRANSTAB2
                 DEX
                 DEX
                 BPL   CONVZONEFIN2

                 LDX   #$00FF            ; REMPLI TRANSTAB2
CONVZONEFIN3     LDA   TRANSTAB1,X
                 PHX
                 AND   #$00FF
                 TAY
                 ASL
                 TAX
                 LDA   LINECOFRTAB,X     ; COULEUR VRAIMENT UTILISEE ?
                 BEQ   CONVZONEFIN30
                 LDA   TRANSTAB2,Y
                 ORA   #$0001
                 STA   TRANSTAB2,Y
CONVZONEFIN30    PLX
                 DEX
                 BPL   CONVZONEFIN3

                 LDX   #$001E            ; NETTOY LA PALETTE
                 LDA   #$0000
CONVZONEFIN4     STA   PALETTEZONE,X
                 DEX
                 DEX
                 BPL   CONVZONEFIN4

                 LDA   COLORZONENB       ; REMPLI LA PALETTE
                 DEC
                 ASL
                 TAY
                 LDX   #$00FF
CONVZONEFIN5     LDA   TRANSTAB2,X
                 AND   #$00FF
                 BEQ   CONVZONEFIN6
                 PHX
                 TXA
                 ASL
                 TAX
                 LDA   STATCOL2,X
                 STA   PALETTEZONE,Y
                 DEY
                 DEY
                 PLX
CONVZONEFIN6     DEX
                 BPL   CONVZONEFIN5

                 LDA   COLORZONENB       ; MODIFIE TRANSTAB2
                 DEC
                 STA   CONVZONEFIN8+1
                 LDX   #$00FF
CONVZONEFIN7     LDA   TRANSTAB2,X
                 AND   #$00FF
                 BEQ   CONVZONEFIN9
                 LDA   TRANSTAB2,X
                 AND   #$FF00
CONVZONEFIN8     ORA   #$000F
                 STA   TRANSTAB2,X
                 DEC   CONVZONEFIN8+1
CONVZONEFIN9     DEX
                 BPL   CONVZONEFIN7

                 LDY   #$0000
CONVZONEFIN19    LDA   PICTURESCB,Y      ; REMAP LA ZONE
                 AND   #$000F
                 CMP   ZONENUMBER
                 BNE   CONVZONEFIN20
                 PHY
                 JSR   CONVZONEREMAP     ; REMAP LA LIGNE
                 PLY
CONVZONEFIN20    INY
                 CPY   #$00C8            ; 200
                 BNE   CONVZONEFIN19

                 JSR   CONVZONEPALET     ; PALETTE
                 RTS

***

CONVZONEREMAP    TYA                     ; REMAP 1 LIGNE DE LA ZONE
                 ASL
                 TAX
                 LDA   TABLE,X           ; ADRESSE DANS LE BANC GS
                 STA   CONVZONEFIN13+1
                 STA   CONVZONEFIN17+1
                 LDA   TABLE,X
                 ASL                     ; ADRESSE DANS LE BANC 8 BIT
                 STA   CONVZONEFIN10+1
                 STA   CONVZONEFIN11+1
                 LDX   #$0000            ; REMAP LA LIGNE
CONVZONEFIN10    LDAL  $20A0A0,X         ; 1er POINT
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB1,Y
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB2,Y
                 AND   #$00FF            ; 1er POINT
                 ASL
                 ASL
                 ASL
                 ASL
                 STA   CONVZONEFIN12+1
                 INX
CONVZONEFIN11    LDAL  $20A0A0,X         ; 2eme POINT
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB1,Y
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB2,Y
                 AND   #$00FF
CONVZONEFIN12    ORA   #$A0A0
                 STA   CONVZONEFIN18+1
CONVZONEFIN17    LDAL  $2280A0
                 AND   #$FF00
CONVZONEFIN18    ORA   #$A0A0
CONVZONEFIN13    STAL  $2280A0
                 INC   CONVZONEFIN13+1
                 INC   CONVZONEFIN17+1
                 INX
                 CPX   #$0140            ; 320
                 BNE   CONVZONEFIN10
                 RTS

CONVZONEPALET    LDA   ZONENUMBER        ; PLACE LA PALETTE
                 ASL
                 ASL
                 ASL
                 ASL
                 ASL                     ; *32
                 CLC
                 ADC   #$7E00
                 STA   CONVZONEFIN16+1
                 LDX   #$001E            ; PALETTE ZONE
CONVZONEFIN15    LDA   PALETTEZONE,X
CONVZONEFIN16    STAL  $207E00,X
                 DEX
                 DEX
                 BPL   CONVZONEFIN15
                 RTS

PALETTEZONE      DS    16*2

************************  CHOIX DES SCB A LA MAIN

SCBCHOIX         STZ   SCBVALUE          ; INIT
                 LDX   #$7FFE
SCBCHOIX0        LDAL  $012000,X         ; SAUVEGARDE
SCBCHOIX00       STAL  $200000,X
                 DEX
                 DEX
                 BPL   SCBCHOIX0
                 LDX   #$7FFE            ; EFFACE L'IMAGE
                 LDA   #$0000
SCBCHOIX1        STAL  $012000,X
                 DEX
                 DEX
                 BPL   SCBCHOIX1
                 LDX   #$7CFE            ; MET L'IMAGE NIVEAU DE GRIS
SCBCHOIX2        LDAL  $200000,X
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   SCBCHOIX2
                 LDX   #$00FE            ; SCB A 0
                 LDA   #$0000
SCBCHOIX3        STAL  $019D00,X
                 DEX
                 DEX
                 BPL   SCBCHOIX3
                 LDY   #$00C7            ; BANDES BLANCHES VERTICALES
                 LDX   #$0000
SCBCHOIX4        LDA   #$FFFF
                 STAL  $012000,X
                 STAL  $012002,X
                 STAL  $01209C,X
                 STAL  $01209E,X
                 TXA
                 CLC
                 ADC   #$00A0
                 TAX
                 DEY
                 BPL   SCBCHOIX4
                 LDX   #$01FE            ; PALETTES
SCBCHOIX5        LDA   SCBPALETTE,X
                 STAL  $019E00,X
                 DEX
                 DEX
                 BPL   SCBCHOIX5

****
                 JSR   SCBCADRE          ; AFFICHE LA 1ere FOIS
SCBCHOIX6        LDA   SCBMOUSEX         ; OLD=NEW
                 STA   SCBMOUSEOX
                 LDA   SCBMOUSEY
                 STA   SCBMOUSEOY
                 JSR   SCBMOUSE          ; LECTURE SOURIS+BOUTON
                 BCS   SCBCHOIX9         ; ON FIXE LA VALEUR DU SCB
                 LDX   SCBMOUSEY         ; FIXE LA VALEUR DU SCB
                 LDAL  $019D00,X
                 AND   #$FF00
                 ORA   SCBVALUE
                 STAL  $019D00,X
SCBCHOIX9        LDA   SCBMOUSEX         ;
                 CMP   SCBMOUSEOX
                 BNE   SCBCHOIX8
                 LDA   SCBMOUSEY
                 CMP   SCBMOUSEOY
                 BEQ   SCBCHOIX6         ; PAS BOUGE...
SCBCHOIX8        JSR   SCBCLEAN          ; EFFACE
                 JSR   SCBCADRE          ; AFFICHE
                 BRA   SCBCHOIX6

SCBVALUE         HEX   0000              ; 0 -> F

***************

SCBCADRE         LDA   SCBMOUSEX         ; AFFICHE CADRE
                 LSR
                 BCC   SCBCADREP         ; POSITION PAIRE
                 BRA   SCBCADREI         ; POSITION IMPAIRE

SCBCADREP        STA   SCBCADRE1+1       ; PAIR
                 LDA   SCBMOUSEY
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
SCBCADRE1        ADC   #$0000
                 TAX
                 LDA   #$E00E            ; MOTIF
                 STAL  $E12000,X
                 RTS

SCBCADREI        STA   SCBCADRE11+1      ; IMPAIR
                 LDA   SCBMOUSEY
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
SCBCADRE11       ADC   #$0000
                 TAX
                 LDAL  $E12000,X
                 AND   #$00F0
                 ORA   #$EE00            ; MOTIF
                 STAL  $E12000,X
                 LDAL  $E12002,X
                 AND   #$FF0F
                 STAL  $E12002,X
                 RTS

SCBCLEAN         LDA   SCBMOUSEOX        ; ENLEVE CADRE
                 LSR
                 STA   SCBCLEAN1+1
                 LDA   SCBMOUSEOY
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
SCBCLEAN1        ADC   #$0000
                 TAX
                 LDAL  $012000,X
                 STAL  $012000,X
                 LDAL  $012002,X
                 STAL  $012002,X
                 RTS

************

SCBMOUSE         LDAL  $00C026           ; $C027   LECTURE SOURIS POUR SELECT AREA
                 BPL   SCBMOUSE00
                 AND   #$0200
                 BNE   SCBMOUSE0011
                 JMP   SCBMOUSE01
SCBMOUSE0011     LDAL  $00C024

SCBMOUSE00       LDAL  $00BFFF           ; ESC = FIN
                 BPL   SCBMOUSE          ; TAB = NEXT SCB
                 STAL  $00C010
                 AND   #$FF00
                 CMP   #$9B00            ; ESC
                 BEQ   SCBCHOIXFIN
                 CMP   #$8900            ; TAB
                 BNE   SCBMOUSE
                 LDAL  $00C025           ; TAB OU POMME TAB ?
                 AND   #$0080
                 BEQ   SCBMOUSE000
                 LDA   SCBVALUE          ; POMME TAB
                 BEQ   SCBMOUSE0000
                 DEC
                 STA   SCBVALUE
                 BRA   SCBCHOIXTAB1
SCBMOUSE0000     LDA   #$000F
                 STA   SCBVALUE
                 BRA   SCBCHOIXTAB1
SCBMOUSE000      LDA   SCBVALUE          ; NEXT SCB
                 CMP   #$000F
                 BEQ   SCBCHOIXTAB
                 INC   SCBVALUE
                 BRA   SCBCHOIXTAB1
SCBCHOIXTAB      STZ   SCBVALUE
SCBCHOIXTAB1     LDAL  $00C034           ; BORDURE COULEUR
                 AND   #$FFF0            ; BORDURE NOIRE
                 ORA   SCBVALUE
                 STAL  $00C034
                 BRA   SCBMOUSE

SCBCHOIXFIN      LDAL  $00C034           ; RETOURNE A LA CONVERSION
                 AND   #$FFF0
                 STAL  $00C034           ; BORDURE NOIRE
                 PLA                     ; RECUPERE LE JSR
                 LDX   #$00FE
SCBCHOIXFIN2     LDAL  $019D00,X
                 STA   PICTURESCB,X
                 DEX
                 DEX
                 BPL   SCBCHOIXFIN2
                 LDX   #$02FE
                 LDA   #$0000
SCBCHOIX12       STAL  $012000,X         ; VIRE LES SCB+PALETTE
                 DEX
                 DEX
                 BPL   SCBCHOIX12
                 LDX   #$7FFE
SCBCHOIX11       LDAL  $200000,X         ; REMET L'IMAGE
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   SCBCHOIX11
                 RTS

SCBMOUSE01       JSR   SLECTA1

SCBMOUSE0        LDA   NEX               ; DELTA X
                 BNE   SCBMOUSE2
                 LDA   SCBMOUSEX
                 CLC
                 ADC   DELX+1
                 CMP   #$013C            ; 316 +1
                 BMI   SCBMOUSE1
                 LDA   #$013C
                 DEC
SCBMOUSE1        STA   SCBMOUSEX
                 BRA   SCBMOUSE4
SCBMOUSE2        LDA   SCBMOUSEX
                 SEC
                 SBC   DELX+1
                 BCS   SCBMOUSE3
                 LDA   #$0000
SCBMOUSE3        STA   SCBMOUSEX

SCBMOUSE4        LDA   NEY               ; DELTA Y
                 BNE   SCBMOUSE6
                 LDA   SCBMOUSEY
                 CLC
                 ADC   DELY+1
                 CMP   #$00C8            ; 199 +1
                 BMI   SCBMOUSE5
                 LDA   #$00C8
                 DEC
SCBMOUSE5        BRA   SCBMOUSE7
SCBMOUSE6        LDA   SCBMOUSEY
                 SEC
                 SBC   DELY+1
                 BCS   SCBMOUSE7
                 LDA   #$0000
SCBMOUSE7        STA   SCBMOUSEY

                 LDA   BOUT
                 BEQ   SCBMOUSE70
                 STZ   BOUT
                 CLC
                 RTS
SCBMOUSE70       SEC
                 RTS

SCBMOUSEX        HEX   0000              ; COORDONNEE
SCBMOUSEY        HEX   0000
SCBMOUSEOX       HEX   0000
SCBMOUSEOY       HEX   0000

*************

SCBPALETTE       HEX   0000,0000,0000,1101,1101,1101,2202,2202,2202,3303,3303,3303,4404,4404,FF0F,0000
                 HEX   0000,0001,0002,0003,0004,0104,0105,0106,0107,0108,0208,0209,020A,020B,FF0F,030D
                 HEX   0000,0100,0100,0200,0200,0300,0300,0400,0500,0500,0600,0600,0700,0700,FF0F,0900
                 HEX   0000,0101,0202,0303,0404,0404,0505,1606,1707,1808,1808,1909,1A0A,1B0B,FF0F,2D0D
                 HEX   0000,0000,1000,1000,2000,2000,3000,3100,3100,4100,4100,5100,5100,6100,FF0F,7200
                 HEX   0000,2202,2202,3303,3303,3303,4404,4404,4404,5505,5505,5505,6606,6606,FF0F,5505
                 HEX   0000,0100,0200,0300,0400,0500,0600,1701,1801,1901,1A01,1B01,1C01,1D01,FF0F,2F02
                 HEX   0000,1100,1201,2301,3401,3502,4602,5703,5803,6903,6A04,7B04,8C04,8D05,FF0F,AF06
                 HEX   0000,0001,0001,1002,1002,1003,2003,2004,2004,3005,3005,3006,4006,4007,FF0F,5008
                 HEX   0000,0001,1002,1003,1004,2005,2006,3007,3008,3009,400A,400B,400C,500D,FF0F,600F
                 HEX   0000,4404,5505,5505,6606,6606,7707,7707,8808,8808,9909,9909,AA0A,AA0A,FF0F,AA0A
                 HEX   0000,1101,1102,2203,2204,3305,3306,4407,5408,5509,650A,660B,760C,770D,FF0F,980F
                 HEX   0000,1000,2000,3000,4000,4000,5000,6000,7000,8000,8000,9000,A000,B000,FF0F,D000
                 HEX   0000,1001,2002,3003,4004,5005,6006,7007,8008,9009,A00A,B00B,C00C,D00D,FF0F,F00F
                 HEX   0000,1100,2100,3201,4201,5301,6302,7402,8502,9503,A603,B603,C704,D704,FF0F,F905
                 HEX   0000,8808,9909,9909,AA0A,AA0A,BB0B,BB0B,CC0C,CC0C,DD0D,DD0D,EE0E,EE0E,FF0F,FF0F

***************************************************************************
****************************  CONVERT AREA 16  ****************************
***************************************************************************

CONVOR           LDA   TOUCHPOMME        ; CONVERT AREA : 1 PALETTE (16/256)
                 BNE   CONVOR0           ; POMME : ON FORCE
                 LDA   CONV16FLAG
                 BEQ   CONVOR0
                 RTS

CONVOR0          LDA   #$0004            ; FENETRE : MODE 16
                 STA   WORKINGI
                 JSR   WORKING
                 LDA   #MESSAGE30        ; PREPARATIVE
                 JSR   WORKING15
                 JSR   CONV16INIT        ; INITS : CONVTRTAB,TRANSTAB1,SAUVEGARDE
                 LDA   #MESSAGE31
                 JSR   WORKING15         ; REMOVE COLORS

CONVOR1          LDA   CONV16NBCOLI      ; CONDITION D'ARRET SUR LE NB DE COUL SOUHAITE
                 CMP   COLOR2NB
                 BMI   CONVOR2
                 LDA   #MESSAGE32        ; REMAP PICTURE
                 JSR   WORKING15
                 JSR   CONVORF           ; FIN : REMAP 8 BIT + REMAP GS
                 JSR   ALERTFIN          ; ENLEVE LA FENETRE
                 RTS

CONVOR2          LDX   CONVOSCI
                 LDA   CONVOSC2,X        ; FREQ : 1->9999 OU ---- (65280:FFFF)
                 INC
                 STA   CONVOR4+1

                 LDA   COLOR2NB          ; ON PARCOURS LE TABLEAU
                 DEC
                 ASL
                 TAX
CONVOR3          LDA   CONVTRTAB,X
                 TAY                     ; **
                 LSR
                 STA   PALETIND          ; INDICE QUI VA SERVIR DE REF POUR LA COUL
                 LDA   STATCOFR,Y        ; **
CONVOR4          CMP   #$A0A0            ; FREQ MAX AUTORISEE
                 BCS   CONVOR10          ; BRANCH SI >=
                 LDY   CONVOSCI
                 LDA   CONVOSC2,Y
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONVOR7
                 PHX
                 JSR   PALEBRC           ; CALCUL DE LA VALEUR LA + PROCHE
                 BRA   CONVOR8
CONVOR7          PHX                     ; ON CHERCHE UNE DIFF
                 JSR   PALEBRD
                 BEQ   CONVOR11          ; DIFF=0, ON A PAS TROUVE LA DIFF DESIREE
CONVOR8          STA   DIFF16RVB         ; DIFF RVB
                 JSR   CONV16TEST        ; DOIT T'ON ELIMINER LA COULEUR ? (Y INCHANGE)
                 BCS   CONVOR6           ; ON ELIMINE LA COULEUR
CONVOR11         PLX
                 DEX
                 DEX
                 BPL   CONVOR3
CONVOR10         INC   CONVOSCI          ; PROCHAINE VALEUR SCRIPT
                 INC   CONVOSCI
                 BRA   CONVOR2

CONVOR6          PLX                     ; ON ELIMINE LA COULEUR
                 PHX
                 JSR   CONVMAD           ; MODIF DES TABLEAUX
                 PLX
                 CPX   COLOR16NB2        ; DOIT T'ON DECREMENTER X ? (FIN DE TABLEAU)
                 BNE   CONVOR9
                 DEX
                 DEX
CONVOR9          LDA   CONV16NBCOLI      ; CONDITION D'ARRET SUR LE NB DE COUL SOUHAITE
                 CMP   COLOR2NB
                 BMI   CONVOR3
                 LDA   #MESSAGE32
                 JSR   WORKING15
                 JSR   CONVORF           ; FIN : REMAP 8 BIT + REMAP GS
                 JSR   ALERTFIN          ; ENLEVE LA FENETRE
                 RTS

CONV16NBCOLI     HEX   1000              ; NB DE COULEUR AUQUEL ON VEUT ARRIVER

******************************************************************************
************************  INIT AVANT CONVERSION  *****************************

CONV16INIT       JSR   CONVSAVE          ; SAUVE STATCOFR,NBCOLOR2
                 LDA   COPELI
                 STA   CONV16NBCOLI      ; NB COULEUR DESIREE
                 JSR   PALESUBSINIT      ; MET LES VALEURS DANS TRANSTAB1
                 JSR   CONV16TR          ; TRI DES FREQUENCES
                 STZ   CONVOSCI          ; INDICE TABLEAU SCRIPT
                 LDA   COLOR2NB
                 STA   NBCOLORPALETTE    ; INIT POUR LA TEINTE LA + PROCHE
                 RTS

***********  SAUVEGARDE DES VALEURS

CONVSAVE         LDA   COLOR2NB          ; COLOR2NB
                 STA   COLOR2NBSAV
                 LDX   #$01FE            ; STATCOFR
CONVSAVE1        LDA   STATCOFR,X
                 STA   SELNBT,X
                 DEX
                 DEX
                 BPL   CONVSAVE1
                 RTS

***********  TRI DES FREQUENCES

CONV16TR         STZ   CONVTRTAB         ; INIT
                 LDA   COLOR2NB
                 CMP   #$0001
                 BEQ   CONV16TR0         ; 1 COULEUR, DEJA TRIE...
                 ASL
                 STA   CONV16TR2+1
                 LDX   #$0002            ; POUR CHAQUE COULEUR
CONV16TR1        LDA   STATCOFR,X
                 JSR   CONV16TRPLACE     ; PLACE LA COULEUR
                 INX
                 INX
CONV16TR2        CPX   #$A0A0
                 BNE   CONV16TR1
CONV16TR0        RTS

CONV16TRPLACE    PHX
                 STA   CONV16TR4+1       ; VALEUR DE LA FREQ
                 STX   CONV16TR5+1       ; NB COULEUR DEJA TRIEE
                 LDY   #$0000
CONV16TR3        LDA   CONVTRTAB,Y       ; INDICE PALETTE DE LA COULEUR
                 TAX
                 LDA   STATCOFR,X        ; FREQ DE LA COULEUR
CONV16TR4        CMP   #$A0A0
                 BCC   CONV16TR6         ; BRANCH SI <
                 INY
                 INY
CONV16TR5        CPY   #$A0A0
                 BNE   CONV16TR3
                 TYX                     ; ON PLACE A LA FIN
                 BRA   CONV16TR9
CONV16TR6        STY   CONV16TR8+1       ; ON A TROUVE LA PLACE : Y
                 LDX   CONV16TR5+1
CONV16TR7        LDA   CONVTRTAB-2,X     ; ON DECALE
                 STA   CONVTRTAB,X
                 DEX
                 DEX
CONV16TR8        CPX   #$A0A0
                 BNE   CONV16TR7

CONV16TR9        PLA                     ; ON PLACE LA VALEUR (ON DEPILE X AU PASSAGE)
                 STA   CONVTRTAB,X
                 TAX
                 RTS

CONVTRTAB        DS    256*2             ; INDICE*2

*******************************************************************************
**********************  REMPLACEMENT D'UNE COULEUR  ***************************

************  TEST SI ON DOIT SUPPRIMER CETTE COULEUR

CONV16TEST       LDA   PALETIND
                 ASL
                 TAX
                 LDA   STATCOFR,X
                 STA   OLD16FREQ         ; FREQUENCE DU REMPLACE

                 LDX   CONVOSCI          ; ON PARCOURS LE SCRIPT, 0000 : DEBUT
                 LDA   CONVOSC1,X        ; DIFF RVB SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA DIFF
                 BEQ   CONV16TEST1
                 LDA   DIFF16RVB         ; DIFF RVB ENTRE LES 2 COULEURS
                 CMP   CONVOSC1,X        ; DIFF RVB SCRIPT
                 BNE   CONV16NOPER
                 LDA   CONVOSC2,X        ; VALEUR FREQ SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONV16PER         ; ON PERMUTTE
                 CMP   OLD16FREQ         ; FREQ REMPLACE
                 BCS   CONV16PER         ; PLUS PETITE, ON PERMUTTE
CONV16NOPER      CLC
                 RTS
CONV16PER        SEC
                 RTS
CONV16TEST1      LDA   CONVOSC2,X        ; FREQ SCRIPT
                 CMP   #$FF00            ; ---- : ON SE MOQUE DE LA FREQ
                 BEQ   CONV16NOPER       ; DEUX ----, ON IGNORE : PROCHAINE VALEUR DU SCRIPT
                 CMP   OLD16FREQ         ; FREQ REMPLACE
                 BCS   CONV16PER         ; ON PERMUTTE BPL
                 BRA   CONV16NOPER

OLD16FREQ        HEX   0000
DIFF16RVB        HEX   0000

CONVOSCI         HEX   0000              ; INDICE DU SCRIPT DE CONVERSION
CONVOSC1         HEX   00FF,0100,0200,0300,00FF,0100,0200,0300,00FF,0100,0200,0300  ; VALEUR DE LA DIFF
                 HEX   0100,0200,0300,0400,0500,0600,0700,0800,0900,0A00,0B00,0C00  ;
                 HEX   00FF,0100,0200,0300,0400,0500,0600,0700,0800,0900,0A00,0B00
CONVOSC2         HEX   1900,2C01,2C01,2C01,AF00,5802,5802,5802,9001,8403,8403,8403  ; FREQ DE LA COULEUR SELEC
                 HEX   00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF  ;
                 HEX   4000,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF

************  MISE A JOUR DES TABLEAUX ET VALEURS : COLOR2NB,STATCOFR,CONVTRTAB

CONVMAD          STX   OLDFRTRIND        ; INDICE*2 CONVTRTAB REMPLACE
                 LDA   PALETIND
                 STA   OLD16IND          ; INDICE IMAGE REMPLACE
                 STY   NEW16IND          ; INDICE IMAGE REMPLACANT
                 TYA
                 ASL
                 STA   CONVMAD1+1

                 LDA   COLOR2NB          ; UNE COULEUR EN MOINS
                 ASL
                 STA   NBCOLOR16
                 DEC
                 DEC
                 STA   COLOR16NB2
                 DEC   COLOR2NB

                 LDA   OLD16IND          ; CALCUL NEWFREQVAL
                 ASL
                 TAX
                 LDA   NEW16IND
                 ASL
                 TAY
                 LDA   STATCOFR,Y
                 CLC
                 ADC   STATCOFR,X
                 STA   NEWFREQVAL

                 LDY   OLDFRTRIND        ; RECHERCHE NEWFRTRIND
                 LDX   COLOR16NB2
CONVMAD0         LDA   CONVTRTAB,X
CONVMAD1         CMP   #$A0A0            ; INDICE IMAGE REMPLACANT (NEW16IND)*2
                 BEQ   CONVMAD2
                 DEX
                 DEX
                 BPL   CONVMAD0
CONVMAD2         STX   NEWFRTRIND
                 CPX   OLDFRTRIND
                 BMI   CONVMAD3          ; PERMUTE NEW ET OLD ?
                 STX   OLDFRTRIND
                 STY   NEWFRTRIND

CONVMAD3         LDX   NEWFRTRIND        ; CHERCHE FINFTRIND
                 BNE   CONVMAD4
                 STZ   FINFRTRIND        ; 0:ON EST DEJA EN BAS
                 BRA   CONVMADFT6
CONVMAD4         DEX
                 DEX
CONVMADFT1       LDA   CONVTRTAB,X       ; ON CHERCHE L'ENDROIT OU PLACER LA NOUVELLE FREQ
                 TAY
                 LDA   STATCOFR,Y
                 CMP   NEWFREQVAL
                 BCS   CONVMADFT2        ; TROUVE !  (BPL)
                 DEX
                 DEX
                 BPL   CONVMADFT1
CONVMADFT2       INX
                 INX
                 STX   FINFRTRIND

CONVMADFT6       LDX   OLDFRTRIND        ; 1er DECALAGE : ON SUPPRIME CASE OLD
CONVMADFT3       LDA   CONVTRTAB+2,X
                 STA   CONVTRTAB,X
                 INX
                 INX
                 CPX   NBCOLOR16
                 BNE   CONVMADFT3

                 LDX   NEWFRTRIND        ; 2eme DECALAGE : ON ECRASE CASE NEW
                 CPX   FINFRTRIND
                 BEQ   CONVMADFT5        ; CAS PARTICULIER : PAS DE DECALAGE
CONVMADFT4       LDA   CONVTRTAB-2,X
                 STA   CONVTRTAB,X
                 DEX
                 DEX
                 CPX   FINFRTRIND
                 BNE   CONVMADFT4
CONVMADFT5       LDA   NEW16IND          ; ON MET L'INDICE NEW A SA PLACE FINALE
                 ASL
                 STA   CONVTRTAB,X

                 LDX   #$00FF            ; MISE A JOUR TRANSTABLE
CONVMADTT1       LDA   TRANSTAB1,X
                 AND   #$00FF
                 CMP   OLD16IND          ; INDICE DU REMPLACE
                 BNE   CONVMADTT2
                 LDA   TRANSTAB1,X       ; ON REMPLACE
                 AND   #$FF00
                 ORA   NEW16IND
                 STA   TRANSTAB1,X
CONVMADTT2       DEX
                 BPL   CONVMADTT1

                 LDA   OLD16IND          ; MISE A JOUR DES VALEURS DES FREQUENCES
                 ASL
                 TAX
                 LDA   NEW16IND
                 ASL
                 TAY
                 LDA   NEWFREQVAL
                 STA   STATCOFR,Y        ; REMPLACANT += REMPLACE
                 STZ   STATCOFR,X        ; REMPLACE A 0

                 RTS

COLOR16NB2       HEX   0000              ; NB COULEUR*2 -2
NBCOLOR16        HEX   0000              ; NB COULEUR*2
OLD16IND         HEX   0000              ; INDICE IMAGE DU REMPLACE
NEW16IND         HEX   0000              ; INDICE IMAGE DU REMPLACANT
OLDFRTRIND       HEX   0000              ; INDICE*2 CONVTRTAB REMPLACE
NEWFRTRIND       HEX   0000              ; INDICE*2 CONVTRTAB REMPLACANT
FINFRTRIND       HEX   0000              ; INDICE*2 CONVTRTAB FINALE REMPLACANT
NEWFREQVAL       HEX   0000              ; VALEUR DE LA NOUVELLE FREQUENCE REMPLACANT

********************************************************************************
****************************  FIN DE CONVERSION  *******************************

CONVORF          LDX   #$00FE            ; REMAP L'IMAGE 8 BIT -> IMAGE 4 BIT GS
                 LDA   #$0000
CONVORF2         STA   TRANSTAB2,X       ; NETTOY TRANSTAB2
                 DEX
                 DEX
                 BPL   CONVORF2

                 LDX   #$00FF            ; REMPLI TRANSTAB2
CONVORF3         LDA   TRANSTAB1,X
                 PHX
                 AND   #$00FF
                 TAY
                 ASL
                 TAX
                 LDA   STATCOFR,X        ; COULEUR VRAIMENT UTILISEE ?
                 BEQ   CONVORF30
                 LDA   TRANSTAB2,Y
                 ORA   #$0001
                 STA   TRANSTAB2,Y
CONVORF30        PLX
                 DEX
                 BPL   CONVORF3

                 LDX   #$001E            ; NETTOY LA PALETTE
                 LDA   #$0000
CONVORF4         STA   PALETTE16,X
                 DEX
                 DEX
                 BPL   CONVORF4

                 LDA   COLOR2NB          ; REMPLI LA PALETTE
                 DEC
                 ASL
                 TAY
                 LDX   #$00FF
CONVORF5         LDA   TRANSTAB2,X
                 AND   #$00FF
                 BEQ   CONVORF6
                 PHX
                 TXA
                 ASL
                 TAX
                 LDA   STATCOL2,X
                 STA   PALETTE16,Y
                 DEY
                 DEY
                 PLX
CONVORF6         DEX
                 BPL   CONVORF5

                 LDA   COLOR2NB          ; MODIFIE TRANSTAB2
                 DEC
                 STA   CONVORF8+1
                 LDX   #$00FF
CONVORF7         LDA   TRANSTAB2,X
                 AND   #$00FF
                 BEQ   CONVORF9
                 LDA   TRANSTAB2,X
                 AND   #$FF00
CONVORF8         ORA   #$000F
                 STA   TRANSTAB2,X
                 DEC   CONVORF8+1
CONVORF9         DEX
                 BPL   CONVORF7

                 LDA   #$8000
                 STA   CONVORF13+1
                 LDX   #$0000            ; REMAP L'IMAGE
CONVORF10        LDAL  $200000,X         ; 1er POINT
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB1,Y
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB2,Y
                 AND   #$00FF
                 ASL
                 ASL
                 ASL
                 ASL
                 STA   CONVORF12+1
                 INX
CONVORF11        LDAL  $200000,X         ; 2eme POINT
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB1,Y
                 AND   #$00FF
                 TAY
                 LDA   TRANSTAB2,Y
                 AND   #$00FF
CONVORF12        ORA   #$A0A0
CONVORF13        STAL  $218000
                 INC   CONVORF13+1
                 INX
                 CPX   #$FA00
                 BNE   CONVORF10

                 LDX   #$02FE            ; CREE LES SCB ET PLACE LA PALETTE
                 LDA   #$0000
CONVORF14        STAL  $21FD00,X         ; SCB
                 DEX
                 DEX
                 BPL   CONVORF14
                 LDX   #$001E            ; PALETTE
CONVORF15        LDA   PALETTE16,X
CONVORF16        STAL  $21FE00,X
                 DEX
                 DEX
                 BPL   CONVORF15

                 LDA   COLOR2NBSAV       ; RESTAURE LES VALEURS : STATCOFR,COLOR2NB
                 STA   COLOR2NB
                 LDX   #$01FE
CONVORF17        LDA   SELNBT,X
                 STA   STATCOFR,X
                 DEX
                 DEX
                 BPL   CONVORF17

                 LDA   #$0001            ; FLAG
                 STA   CONV16FLAG

                 RTS

PALETTE16        DS    16*2
COLOR2NBSAV      HEX   0000


***************************************************************************
**************************  CONVERT AREA 16 GREY  *************************
***************************************************************************

CONVUR           LDA   NOWINDOWFLAG      ; CONVERT AREA : GREYSCALE
                 BNE   CONVUR0           ; UTILISEE EN MODE CONVERT ALL
                 RTS
CONVUR0
                 LDX   #$01FE            ; PALETTE EN NIVEAU DE GRIS
CONVUR1          LDA   STATCOL2,X
                 AND   #$0F00
                 XBA
                 STA   CONVUR2+1         ; R
                 LDA   STATCOL2,X
                 AND   #$00F0
                 LSR                     ; V
                 LSR
                 LSR
                 LSR
                 CLC
CONVUR2          ADC   #$FFFF            ; R+V
                 STA   CONVUR3+1
                 LDA   STATCOL2,X
                 AND   #$000F            ; B
                 CLC
CONVUR3          ADC   #$FFFF            ; R+V+B
                 ASL
                 TAY
                 LDA   SELGRIS2,Y        ; /3
                 ASL
                 TAY
                 LDA   SELGRIS3,Y
                 STA   SELPALNB,X
                 DEX
                 DEX
                 BPL   CONVUR1

                 LDX   #$0000            ; REMAP IMAGE
CONVUR6          PHX
                 TXA
                 ASL
                 TAX
CONVUR4          LDAL  $090000,X         ; IMAGE 8 BIT 320*200
                 TAY
                 AND   #$00FF
                 ASL
                 TAX
                 LDA   SELPALNB,X
                 AND   #$00F0
                 STA   CONVUR7+1
                 TYA
                 XBA
                 AND   #$00FF
                 ASL
                 TAX
                 LDA   SELPALNB,X
                 AND   #$000F
CONVUR7          ORA   #$A0A0
                 PLX
CONVUR5          STAL  $200000,X         ; IMAGE GREY
                 INX
                 CPX   #$7D00
                 BNE   CONVUR6

                 LDX   #$02FE            ; SCB+PALETTE
                 LDA   #$0000
CONVUR8          STAL  $207D00,X
                 DEX
                 DEX
                 BPL   CONVUR8

                 LDX   #$001E            ; PALETTE
CONVUR10         LDA   SELGRIS1,X
CONVUR9          STAL  $207E00,X
                 DEX
                 DEX
                 BPL   CONVUR10

                 RTS

*******************************************************************************
***********************  CONVERSION PRINTSHOP  ********************************
*******************************************************************************

CONVIR           NOP
                 LDX   #$7FFE            ; AFFICHE IMAGE GRISE
CONVIR1          LDAL  $210000,X
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   CONVIR1

                 JSR   CONVIRCADRE       ; AFFICHE LA 1ere FOIS
CONVIR2          LDA   CONVIRMOUSEX      ; OLD=NEW
                 STA   CONVIRMOUSEOX
                 LDA   CONVIRMOUSEY
                 STA   CONVIRMOUSEOY
                 JSR   CONVIRMOUSE       ; LECTURE SOURIS+BOUTON
                 BCC   CONVIRFIN         ; ON SORT
                 LDA   CONVIRMOUSEX
                 CMP   CONVIRMOUSEOX
                 BNE   CONVIR3
                 LDA   CONVIRMOUSEY
                 CMP   CONVIRMOUSEOY
                 BEQ   CONVIR2           ; PAS BOUGE...
CONVIR3          JSR   CONVIRCLEAN       ; EFFACE
                 JSR   CONVIRCADRE       ; AFFICHE
                 BRA   CONVIR2

CONVIRFIN        JSR   CONVIRCAPTURE     ; RECUPERE LES POINTS
                 JSR   CONVIRCONV        ; CONVERTIT LES POINTS EN BRUT
                 JSR   CONVIRFORMAT      ; CONVERSION POINTS BRUT -> FORMAT PSHP
                 LDA   #$0001
                 STA   CONVPSHPFLAG      ; IMAGE PRINTSHOP CONVERTIT
                 LDA   CONVIRVIEWFL
                 BEQ   CONVIRFIN1
                 STZ   CONVIRVIEWFL      ; INIT
                 RTS
CONVIRFIN1       PLA                     ; RECUPERE L'ADRESSE DU JSR
                 LDA   #$0005            ; RETOURNE A L'ECRAN CONVERT
                 JMP   PICT00

CONVIRVIEWFL     HEX   0000              ; 0:CONVERSION, 1:CONVERSION+VIEW

*****************  CREE LE FORMAT DISQUE  **********************

CONVIRFORMAT     STZ   ZONEX             ; POINTS BRUT -> FORMAT DISK
                 LDA   #$3A98
                 STA   CONVIRFORMAT5+1
                 LDY   #$0000
CONVIRFORMAT4    PHY
                 STZ   ZONE1
                 STZ   ZONE2
                 STZ   ZONE3
                 LDX   #$0000
CONVIRFORMAT5    LDAL  $223A98,X
                 AND   #$0007            ; 3 BIT MAX : 0 -> 7
                 ASL
                 TAY
                 LDA   ZONETAB,Y
                 TAY
                 ASL   ZONE1             ; DECALAGE
                 ASL   ZONE2
                 ASL   ZONE3
                 AND   #$0001
                 ORA   ZONE3
                 STA   ZONE3
                 TYA
                 LSR
                 AND   #$0001
                 ORA   ZONE2
                 STA   ZONE2
                 TYA
                 LSR
                 LSR
                 AND   #$0001
                 ORA   ZONE1
                 STA   ZONE1
                 INX
                 CPX   #$0008
                 BNE   CONVIRFORMAT5

                 LDX   ZONEX             ; PLACE LES POINTS
CONVIRFORMAT1    LDAL  $224E20,X
                 AND   #$FF00
                 ORA   ZONE1
CONVIRFORMAT6    STAL  $224E20,X
CONVIRFORMAT2    LDAL  $22505C,X
                 AND   #$FF00
                 ORA   ZONE2
CONVIRFORMAT7    STAL  $22505C,X
CONVIRFORMAT3    LDAL  $225298,X
                 AND   #$FF00
                 ORA   ZONE3
CONVIRFORMAT8    STAL  $225298,X
                 INC   ZONEX

                 LDA   CONVIRFORMAT5+1
                 CLC
                 ADC   #$0008
                 STA   CONVIRFORMAT5+1

                 PLY
                 INY
                 CPY   #$023C            ; 572
                 BEQ   CONVIRFORMAT9
                 JMP   CONVIRFORMAT4

CONVIRFORMAT9    RTS

ZONEX            HEX   0000
ZONE1            HEX   0000
ZONE2            HEX   0000
ZONE3            HEX   0000
ZONETAB          HEX   0000,0700,0200,0600,0400,0500,0100,0300

*****************  CONVERTI LES POINTS  ************************

CONVIRCONV       LDA   PRINTSHOPFLAG
                 BNE   CONVIRCONV1
                 JSR   CONVIRMAKETAB     ; CREE LA TABLE DE REFERENCE
CONVIRCONV1      LDX   #$11DE            ; 88*52 POINTS
CONVIRCONV2      LDAL  $233A98,X
                 PHA
                 AND   #$00FF
                 ASL
                 TAY
                 LDA   CONVIRTAB,Y
                 STA   CONVIRCONV3+1
                 PLA
                 XBA
                 AND   #$00FF
                 ASL
                 TAY
                 LDA   CONVIRTAB,Y
                 XBA
                 ORA   CONVIRCONV3+1
                 STA   CONVIRCONV3+1
CONVIRCONV3      LDA   #$A0A0
CONVIRCONV4      STAL  $233A98,X
                 DEX
                 DEX
                 BPL   CONVIRCONV2
                 RTS

***********

CONVIRMAKETAB    LDA   COLOR2NB          ; CREE LA TABLE DE REFERENCE
                 DEC
                 ASL
                 TAX
CONVIRMAKETAB1   LDA   STATCOL2,X
                 JSR   CONVIRTEINTE      ; INDIQUE LA COULEUR LA + PROCHE
                 STA   CONVIRTAB,X
                 DEX
                 DEX
                 BPL   CONVIRMAKETAB1
                 LDA   #$0001
                 STA   PRINTSHOPFLAG
                 RTS

CONVIRTAB        DS    256*2

CONVIRTEINTE     PHX                     ; CALCULE LA TEINTE LA + PROCHE
                 TAY
                 AND   #$0F00            ; ROUGE
                 XBA
                 TAX
                 LDA   CONVIRTRANS1,X
                 AND   #$00FF
                 ASL
                 ASL
                 ASL
                 ASL                     ; *16
                 STA   CONVIRTEINTE1+1
                 TYA                     ; VERT
                 AND   #$00F0
                 LSR
                 LSR
                 LSR
                 LSR
                 TAX
                 LDA   CONVIRTRANS1,X
                 AND   #$00FF
                 ASL
                 ASL                     ; *4
                 CLC
                 ADC   CONVIRTEINTE1+1
                 STA   CONVIRTEINTE1+1
                 TYA                     ; BLEU
                 AND   #$000F
                 TAX
                 LDA   CONVIRTRANS1,X
                 AND   #$00FF
                 CLC
                 ADC   CONVIRTEINTE1+1
                 STA   CONVIRTEINTE1+1
CONVIRTEINTE1    LDX   #$A0A0
                 LDA   CONVIRTRANSTAB,X
                 AND   #$00FF
                 PLX
                 RTS

CONVIRTRANSTAB   HEX   01,06,06,06,05,00,06,06,05,05,00,06,05,05,05,00
                 HEX   01,06,06,06,05,00,06,06,05,05,00,06,05,05,00,00
                 HEX   02,07,07,07,03,03,07,06,05,04,00,06,05,05,00,00
                 HEX   02,02,07,07,03,03,07,07,04,04,00,07,04,04,04,00
CONVIRTRANS1     HEX   00,00,00,00,01,01,01,01,02,02,02,02,03,03,03,03
CONVIRCOLORS     HEX   FF0F,0000,000F,600F,F00F,F000,0F00,0C0C
                 HEX   0000,0000,0000,0000,0000,0000,0000,7707
PRINTSHOPFLAG    HEX   0000              ; TABLE DEJA CREE

*****************  CAPTURE LES POINTS  *************************

CONVIRCAPTURE    LDY   #$0033            ; RECOPIE LES OCTETS CORRESPONDANTS
                 LDA   #$3A98
                 STA   CONVIRCAPTURE2+1
                 LDA   CONVIRMOUSEY
                 ASL
                 TAX
                 LDA   TABLE,X
                 ASL                     ; *320
                 CLC
                 ADC   CONVIRMOUSEX
                 STA   CONVIRCAPTURE1+1
CONVIRCAPTURE0   LDX   #$0000
CONVIRCAPTURE1   LDAL  $200000,X
CONVIRCAPTURE2   STAL  $233A98
                 INC   CONVIRCAPTURE2+1
                 INC   CONVIRCAPTURE2+1
                 INX
                 INX
                 CPX   #$0058            ; 88 POINTS
                 BNE   CONVIRCAPTURE1
                 LDA   CONVIRCAPTURE1+1  ; NEXT LINE
                 CLC
                 ADC   #$0140
                 STA   CONVIRCAPTURE1+1
                 DEY                     ; 52 LIGNES
                 BPL   CONVIRCAPTURE0
                 RTS

****************  AFFICHE/NETTOY CADRE  ************************

CONVIRCADRE      LDA   CONVIRMOUSEX      ; AFFICHE CADRE
                 LSR
                 BCC   CONVIRCADREP      ; POSITION PAIRE
                 JMP   CONVIRCADREI      ; POSITION IMPAIRE

CONVIRCADREP     STA   CONVIRCADRE1+1    ; PAIR
                 LDA   CONVIRMOUSEY
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
CONVIRCADRE1     ADC   #$0000
                 STA   CONVIRCADRE3+1
                 LDY   #$0004
                 TAX
CONVIRCADRE2     LDA   #$0000            ; HORIZONTAL : DESSIN DU CADRE
                 STAL  $E12000,X
                 STAL  $E13FE0,X
                 LDA   #$FFFF
                 STAL  $E12004,X
                 STAL  $E13FE4,X
                 TXA
                 CLC
                 ADC   #$0008
                 TAX
                 DEY
                 BPL   CONVIRCADRE2
                 LDA   #$0000
                 STAL  $E12000,X
                 STAL  $E13FE0,X
                 STAL  $E12002,X
                 STAL  $E13FE2,X
                 STZ   CONVIRCOLOR
                 STZ   CONVIRCOLOR2
                 LDY   #$0006
CONVIRCADRE3     LDX   #$A0A0            ; VERTICAL : DESSIN DU CADRE
CONVIRCADRE4     LDAL  $E12000,X
                 AND   #$FF0F
                 ORA   CONVIRCOLOR
                 STAL  $E12000,X
                 LDAL  $E120A0,X
                 AND   #$FF0F
                 ORA   CONVIRCOLOR
                 STAL  $E120A0,X
                 LDAL  $E12140,X
                 AND   #$FF0F
                 ORA   CONVIRCOLOR
                 STAL  $E12140,X
                 LDAL  $E121E0,X
                 AND   #$FF0F
                 ORA   CONVIRCOLOR
                 STAL  $E121E0,X
                 LDAL  $E1202B,X         ;
                 AND   #$FFF0
                 ORA   CONVIRCOLOR2
                 STAL  $E1202B,X
                 LDAL  $E120CB,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR2
                 STAL  $E120CB,X
                 LDAL  $E1216B,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR2
                 STAL  $E1216B,X
                 LDAL  $E1220B,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR2
                 STAL  $E1220B,X
                 LDA   CONVIRCOLOR       ; NOIR ?
                 BEQ   CONVIRCADRE5
                 LDA   #$0000
                 STZ   CONVIRCOLOR2
                 BRA   CONVIRCADRE6
CONVIRCADRE5     LDA   #$000F
                 STA   CONVIRCOLOR2
                 LDA   #$00F0
CONVIRCADRE6     STA   CONVIRCOLOR
                 TXA
                 CLC
                 ADC   #$0500            ; 8 LIGNES
                 TAX
                 DEY
                 BMI   CONVIRCADRE7
                 JMP   CONVIRCADRE4
CONVIRCADRE7     RTS


CONVIRCADREI     STA   CONVIRCADRE11+1   ; IMPAIR
                 LDA   CONVIRMOUSEY
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
CONVIRCADRE11    ADC   #$0000
                 STA   CONVIRCADRE13+1
                 LDY   #$0004
                 TAX
CONVIRCADRE12    LDAL  $E12000,X         ; HORIZONTAL : DESSIN DU CADRE
                 AND   #$00F0
                 STAL  $E12000,X
                 LDAL  $E12002,X
                 AND   #$FF0F
                 STAL  $E12002,X
                 LDAL  $E13FE0,X
                 AND   #$00F0
                 STAL  $E13FE0,X
                 LDAL  $E13FE2,X
                 AND   #$FF0F
                 STAL  $E13FE2,X
                 LDAL  $E12004,X         ;
                 ORA   #$FF0F
                 STAL  $E12004,X
                 LDAL  $E12006,X
                 ORA   #$00F0
                 STAL  $E12006,X
                 LDAL  $E13FE4,X
                 ORA   #$FF0F
                 STAL  $E13FE4,X
                 LDAL  $E13FE6,X
                 ORA   #$00F0
                 STAL  $E13FE6,X
                 TXA
                 CLC
                 ADC   #$0008
                 TAX
                 DEY
                 BPL   CONVIRCADRE12
                 LDA   #$0000
                 LDAL  $E12000,X
                 AND   #$00F0
                 STAL  $E12000,X
                 LDAL  $E13FE0,X
                 AND   #$00F0
                 STAL  $E13FE0,X
                 LDAL  $E12002,X
                 AND   #$0000
                 STAL  $E12002,X
                 LDAL  $E13FE2,X
                 AND   #$0000
                 STAL  $E13FE2,X
                 STZ   CONVIRCOLOR
                 STZ   CONVIRCOLOR2
                 LDY   #$0006
CONVIRCADRE13    LDX   #$A0A0            ; VERTICAL : DESSIN DU CADRE
CONVIRCADRE14    LDAL  $E12000,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR
                 STAL  $E12000,X
                 LDAL  $E120A0,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR
                 STAL  $E120A0,X
                 LDAL  $E12140,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR
                 STAL  $E12140,X
                 LDAL  $E121E0,X
                 AND   #$FFF0
                 ORA   CONVIRCOLOR
                 STAL  $E121E0,X
                 LDAL  $E1202B,X         ;
                 AND   #$0FFF
                 ORA   CONVIRCOLOR2
                 STAL  $E1202B,X
                 LDAL  $E120CB,X
                 AND   #$0FFF
                 ORA   CONVIRCOLOR2
                 STAL  $E120CB,X
                 LDAL  $E1216B,X
                 AND   #$0FFF
                 ORA   CONVIRCOLOR2
                 STAL  $E1216B,X
                 LDAL  $E1220B,X
                 AND   #$0FFF
                 ORA   CONVIRCOLOR2
                 STAL  $E1220B,X
                 LDA   CONVIRCOLOR       ; NOIR ?
                 BEQ   CONVIRCADRE15
                 LDA   #$0000
                 STZ   CONVIRCOLOR2
                 BRA   CONVIRCADRE16
CONVIRCADRE15    LDA   #$F000
                 STA   CONVIRCOLOR2
                 LDA   #$000F
CONVIRCADRE16    STA   CONVIRCOLOR
                 TXA
                 CLC
                 ADC   #$0500            ; 8 LIGNES
                 TAX
                 DEY
                 BMI   CONVIRCADRE17
                 JMP   CONVIRCADRE14
CONVIRCADRE17    RTS


CONVIRCLEAN      LDA   CONVIRMOUSEOX     ; ENLEVE CADRE
                 LSR
                 STA   CONVIRCLEAN1+1
                 LDA   CONVIRMOUSEOY
                 ASL
                 TAX
                 LDA   TABLE,X
                 CLC
CONVIRCLEAN1     ADC   #$0000
                 TAX
                 STX   CONVIRCLEAN3+1
                 LDY   #$0015
CONVIRCLEAN2     LDAL  $012000,X
                 STAL  $012000,X
                 LDAL  $013FE0,X
                 STAL  $013FE0,X
                 INX
                 INX
                 DEY
                 BPL   CONVIRCLEAN2
                 LDY   #$0033
CONVIRCLEAN3     LDX   #$A0A0
CONVIRCLEAN4     LDAL  $012000,X
                 STAL  $012000,X
                 LDAL  $01202B,X
                 STAL  $01202B,X
                 TXA
                 CLC
                 ADC   #$00A0
                 TAX
                 DEY
                 BPL   CONVIRCLEAN4
                 RTS

CONVIRCOLOR      HEX   0000
CONVIRCOLOR2     HEX   0000

*******************  LECTURE SOURIS  ***********************

CONVIRMOUSE      JSR   SLECTA
                 LDA   BOUT
                 BEQ   CONVIRMOUSE0

CONVIRBOUT       LDAL  $00C026
                 BPL   CONVIRBOUT
                 AND   #$0100
                 BEQ   CONVIRBOUT1
                 LDAL  $00C024
                 BRA   CONVIRBOUT
CONVIRBOUT1      LDAL  $00C023
                 LDAL  $00C023
                 BPL   CONVIRBOUT
                 STZ   BOUT
                 STAL  $00C010
                 CLC
                 RTS

CONVIRMOUSE0     LDA   NEX               ; DELTA X
                 BNE   CONVIRMOUSE2
                 LDA   CONVIRMOUSEX
                 CLC
                 ADC   DELX+1
                 CMP   #$00E9            ; 300-88
                 BMI   CONVIRMOUSE1
                 LDA   #$00E9
                 DEC
CONVIRMOUSE1     STA   CONVIRMOUSEX
                 BRA   CONVIRMOUSE4
CONVIRMOUSE2     LDA   CONVIRMOUSEX
                 SEC
                 SBC   DELX+1
                 BCS   CONVIRMOUSE3
                 LDA   #$0000
CONVIRMOUSE3     STA   CONVIRMOUSEX

CONVIRMOUSE4     LDA   NEY               ; DELTA Y
                 BNE   CONVIRMOUSE6
                 LDA   CONVIRMOUSEY
                 CLC
                 ADC   DELY+1
                 CMP   #$0095            ; 200-52
                 BMI   CONVIRMOUSE5
                 LDA   #$0095
                 DEC
CONVIRMOUSE5     BRA   CONVIRMOUSE7
CONVIRMOUSE6     LDA   CONVIRMOUSEY
                 SEC
                 SBC   DELY+1
                 BCS   CONVIRMOUSE7
                 LDA   #$0000
CONVIRMOUSE7     STA   CONVIRMOUSEY
                 SEC
                 RTS

CONVIRMOUSEX     HEX   0000              ; COORDONNEE
CONVIRMOUSEY     HEX   0000
CONVIRMOUSEOX    HEX   0000
CONVIRMOUSEOY    HEX   0000

*******************************************************************************
***************************  CONVERSION : ALL  ********************************
*******************************************************************************

CONVARALL        JSR   CONVAR            ; IMAGE 3200 COUL
                 JSR   CONVER            ; IMAGE 256 COUL
                 JSR   CONVOR            ; IMAGE 16 COUL
                 RTS

*******************************************************************************
*******************************************************************************
*******************************************************************************

CONVKBD          LDAL  $00BFFF
                 BPL   CONVKBD
                 STAL  $00C010
                 LDAL  $00C034
                 AND   #$FFF0
CONVKBD1         ORA   #$0001
                 STAL  $00C034
                 LDA   CONVKBD1+1
                 INC
                 CMP   #$0010
                 BEQ   CONVKBD2
                 STA   CONVKBD1+1
                 RTS
CONVKBD2         STZ   CONVKBD1+1
                 RTS

CONVKBDII        LDAL  $00BFFF
                 BPL   CONVKBDII
                 STAL  $00C010
                 RTS

***********************  VIEW AREA  ******************************

****  CREE LA MOSAIQUE

MAKEMOSAIC       LDX   #$0000
MOSAIC1          LDY   #$0000
MOSAIC2          LDA   MOSAICTAB,Y
                 STAL  $012000,X
                 STAL  $012002,X
                 STAL  $012004,X
                 STAL  $012006,X
                 STAL  $012008,X
                 TXA
                 CLC
                 ADC   #$000A
                 TAX
                 INY
                 INY
                 CPY   #$0020
                 BNE   MOSAIC2
                 CPX   #$7D00
                 BNE   MOSAIC1
                 RTS

MOSAICTAB        HEX   0000,1111,2222,3333,4444,5555,6666,7777,8888,9999,AAAA,BBBB,CCCC,DDDD,EEEE,FFFF

CONVIEWBLACK     LDX   #$02FE
                 LDA   #$0000
CONVIEWBLACK1    STAL  $019D00,X         ; IMAGE NOIRE
                 DEX
                 DEX
                 BPL   CONVIEWBLACK1
                 RTS

********  AFFICHAGE 16 COUL

AFFOCHPT         LDA   CONV16FLAG        ; FLAG
                 BNE   AFFOCHPT0
                 JMP   SOURIS1
AFFOCHPT0        JSR   CONVIEWBLACK      ; ON NOIRCIT
                 LDX   #$7CFE
AFFOCHPT1        LDAL  $218000,X         ; POINTS
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   AFFOCHPT1
                 BRA   AFFOCHPA0

AFFOCHPA         LDA   CONV16FLAG        ; FLAG
                 BNE   AFFOCHPA2
                 JMP   SOURIS1
AFFOCHPA2        JSR   CONVIEWBLACK
                 JSR   MAKEMOSAIC
AFFOCHPA0        LDX   #$02FE            ; SCB+PALETTE
AFFOCHPA1        LDAL  $21FD00,X
                 STAL  $019D00,X
                 DEX
                 DEX
                 BPL   AFFOCHPA1
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 JSR   SBOUT             ; ON ATTEND UN CLICK POUR SORTIR
                 LDA   #$0005
                 JMP   PICT00

********  AFFICHAGE 16 GREY

AFFGCHPT         JSR   CONVIEWBLACK      ; NOIRE
                 LDX   #$7CFE
AFFGCHPT1        LDAL  $210000,X         ; POINTS
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   AFFGCHPT1
                 BRA   AFFGCHPA2

AFFGCHPA         JSR   CONVIEWBLACK
                 JSR   MAKEMOSAIC
AFFGCHPA2        LDX   #$02FE            ; SCB+PALETTE
AFFGCHPA1        LDAL  $217D00,X
                 STAL  $019D00,X
                 DEX
                 DEX
                 BPL   AFFGCHPA1
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 JSR   SBOUT             ; ON ATTEND UN CLICK POUR SORTIR
                 LDA   #$0005
                 JMP   PICT00

********  AFFICHAGE 256 COUL

AFFUCHPT         LDA   CONV256FLAG       ; FLAG
                 BNE   AFFUCHPT0
                 JMP   SOURIS1
AFFUCHPT0        JSR   CONVIEWBLACK
                 LDX   #$7CFE
AFFUCHPT1        LDAL  $220000,X         ; POINTS
                 STAL  $012000,X
                 DEX
                 DEX
                 BPL   AFFUCHPT1
                 BRA   AFFUCHPA2

AFFUCHPA         LDA   CONV256FLAG       ; FLAG
                 BNE   AFFUCHPA0
                 JMP   SOURIS1
AFFUCHPA0        JSR   CONVIEWBLACK
                 JSR   MAKEMOSAIC
AFFUCHPA2        LDX   #$02FE            ; SCB+PALETTE
AFFUCHPA1        LDAL  $227D00,X
                 STAL  $019D00,X
                 DEX
                 DEX
                 BPL   AFFUCHPA1
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 JSR   SBOUT             ; ON ATTEND UN CLICK POUR SORTIR
                 LDA   #$0005
                 JMP   PICT00

********  AFFICHAGE 3200 COUL

AFFICHPT         STZ   AFFICHIND         ; POINTS
                 JSR   CONVIEWBLACK
                 LDA   CLNCON3
                 BEQ   AFFICHPT1         ; 0000 : FULL RED
                 JSR   CONVGREY          ; GRIS : PALETTE+POINTS
                 JSR   AFFICH            ; AFFICHAGE 3200
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 LDA   #$0005
                 JMP   PICT00
AFFICHPT1        JSR   CONVRED           ; RED : PALETTE
                 JSR   AFFICH            ; AFFICHAGE 3200
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 LDA   #$0005
                 JMP   PICT00

AFFICHPA         LDA   #$0001            ; PALETTES
                 STA   AFFICHIND
                 JSR   CONVIEWBLACK
                 LDA   CLNCON3
                 BEQ   AFFICHPA1
                 JSR   CONVGREY          ; GRIS : PALETTE+POINTS
                 JSR   AFFICH            ; AFFICHAGE 3200
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 LDA   #$0005
                 JMP   PICT00
AFFICHPA1        JSR   CONVRED           ; RED : PALETTE
                 JSR   AFFICH            ; AFFICHAGE 3200
                 STZ   CONVIRVIEWFL      ; PRINTSHOP FLAG
                 LDA   #$0005
                 JMP   PICT00

CONVRED          LDY   #$018E            ; PALETTE : FULL RED
CONVRED1         LDA   CONVTAB1,Y
                 BNE   CONVRED3
                 LDA   CONVTAB4,Y
                 CLC
                 ADC   #$C350
                 STA   CONVRED2+1
                 LDX   #$001E
                 LDA   #$0F00
CONVRED2         STAL  $22A0A0,X         ; PALETTE : ROUGE
                 DEX
                 DEX
                 BPL   CONVRED2
                 LDA   TABLE,Y           ; POINTS : FULL BLACK
                 CLC
                 ADC   #$8000
                 STA   CONVRED4+1
                 LDX   #$009E
                 LDA   #$0000
CONVRED4         STAL  $22A0A0,X
                 DEX
                 DEX
                 BPL   CONVRED4
CONVRED3         DEY
                 DEY
                 BPL   CONVRED1
                 RTS

CONVGREY         LDY   #$018E            ; PALETTE : GRISE
CONVGREY1        LDA   CONVTAB1,Y
                 BNE   CONVGREY6
                 LDA   CONVTAB4,Y
                 CLC
                 ADC   #$C350
                 STA   CONVGREY3+1
                 LDX   #$001E
CONVGREY2        LDA   CONVTAB3,X        ; PALETTE : GREY
CONVGREY3        STAL  $22A0A0,X
                 DEX
                 DEX
                 BPL   CONVGREY2
                 LDA   TABLE,Y           ; POINTS
                 STA   CONVGREY4+1
                 CLC
                 ADC   #$8000
                 STA   CONVGREY5+1
                 LDX   #$009E
CONVGREY4        LDAL  $21A0A0,X
CONVGREY5        STAL  $22A0A0,X
                 DEX
                 DEX
                 BPL   CONVGREY4
CONVGREY6        DEY
                 DEY
                 BPL   CONVGREY1
                 RTS

CONVTAB1         DS    200*2

CONVTAB3         HEX   0000,1101,2202,3303,4404,5505,6606,7707,8808,9909,AA0A,BB0B,CC0C,DD0D,EE0E,FF0F
CONVTAB4         HEX   0000,2000,4000,6000,8000,A000,C000,E000,0001,2001,4001,6001,8001,A001,C001,E001
                 HEX   0002,2002,4002,6002,8002,A002,C002,E002,0003,2003,4003,6003,8003,A003,C003,E003
                 HEX   0004,2004,4004,6004,8004,A004,C004,E004,0005,2005,4005,6005,8005,A005,C005,E005
                 HEX   0006,2006,4006,6006,8006,A006,C006,E006,0007,2007,4007,6007,8007,A007,C007,E007
                 HEX   0008,2008,4008,6008,8008,A008,C008,E008,0009,2009,4009,6009,8009,A009,C009,E009
                 HEX   000A,200A,400A,600A,800A,A00A,C00A,E00A,000B,200B,400B,600B,800B,A00B,C00B,E00B
                 HEX   000C,200C,400C,600C,800C,A00C,C00C,E00C,000D,200D,400D,600D,800D,A00D,C00D,E00D
                 HEX   000E,200E,400E,600E,800E,A00E,C00E,E00E,000F,200F,400F,600F,800F,A00F,C00F,E00F
                 HEX   0010,2010,4010,6010,8010,A010,C010,E010,0011,2011,4011,6011,8011,A011,C011,E011
                 HEX   0012,2012,4012,6012,8012,A012,C012,E012,0013,2013,4013,6013,8013,A013,C013,E013
                 HEX   0014,2014,4014,6014,8014,A014,C014,E014,0015,2015,4015,6015,8015,A015,C015,E015
                 HEX   0016,2016,4016,6016,8016,A016,C016,E016,0017,2017,4017,6017,8017,A017,C017,E017
                 HEX   0018,2018,4018,6018,8018,A018,C018,E018

********  AFFICHAGE PRINTSHOP

AFFPCHPT         LDA   PRINTSHOPFLAG     ; FLAG
                 BNE   AFFPCHPT0
                 JMP   SOURIS1
AFFPCHPT0        JSR   CONVIEWBLACK      ; ON NOIRCIT
                 LDX   #$7CFE
                 LDA   #$FFFF            ; NETTOYAGE
AFFPCHPT1        STAL  $012000,X
                 DEX
                 DEX
                 BPL   AFFPCHPT1
                 LDA   #$3A98            ; AFFICHAGE 2*3
                 STA   AFFPCHPT2+1
                 LDA   #$2DE4
                 STA   AFFPCHPT4+1
                 LDA   #$2E84
                 STA   AFFPCHPT5+1
                 LDA   #$2F24
                 STA   AFFPCHPT6+1
                 LDX   #$0000
AFFPCHPT2        LDAL  $233A98
                 PHA
                 AND   #$00FF
                 ASL
                 TAY
                 LDA   AFFPCHPTAB,Y      ; 1 PIXEL => 2 PIXELS
                 AND   #$00FF
                 STA   AFFPCHPT3+1
                 PLA
                 XBA
                 AND   #$00FF
                 ASL
                 TAY
                 LDA   AFFPCHPTAB,Y
                 AND   #$00FF
                 XBA
                 ORA   AFFPCHPT3+1
                 STA   AFFPCHPT3+1
AFFPCHPT3        LDA   #$A0A0
AFFPCHPT4        STAL  $012DE4,X         ; 1 LIGNE => 3 LIGNES
AFFPCHPT5        STAL  $012E84,X
AFFPCHPT6        STAL  $012F24,X
                 LDA   AFFPCHPT2+1
                 INC
                 INC
                 CMP   #$4C78
                 BEQ   AFFPCHPA0         ; FIN
                 STA   AFFPCHPT2+1
                 INX
                 INX
                 CPX   #$0058
                 BNE   AFFPCHPT2
                 LDA   AFFPCHPT4+1       ; NEXT LINE
                 CLC
                 ADC   #$01E0
                 STA   AFFPCHPT4+1
                 CLC
                 ADC   #$00A0
                 STA   AFFPCHPT5+1
                 CLC
                 ADC   #$00A0
                 STA   AFFPCHPT6+1
                 LDX   #$0000
                 BRA   AFFPCHPT2

AFFPCHPA         LDA   PRINTSHOPFLAG     ; FLAG
                 BNE   AFFPCHPA2
                 JMP   SOURIS1
AFFPCHPA2        JSR   CONVIEWBLACK
                 JSR   MAKEMOSAIC
AFFPCHPA0        LDX   #$001E            ; PALETTE CLASSIQUE PRINTSHOP
AFFPCHPA1        LDA   CONVIRCOLORS,X
                 STAL  $019E00,X
                 DEX
                 DEX
                 BPL   AFFPCHPA1

                 JSR   SBOUT             ; ON ATTEND UN CLICK POUR SORTIR
                 STZ   CONVIRVIEWFL
                 LDA   #$0005
                 JMP   PICT00

AFFPCHPTAB       HEX   0000,1111,2222,3333,4444,5555,6666,7777

**********************

