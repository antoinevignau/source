
               LST   OFF              ; OPTIONS

ECR0700        LDA   #CLNOPT1         ; OPTIONS : CONV ALL
               STA   BOOTON2+1        ; SERT POUR VOIR SI LE BOUTON EST ACTIF
               LDA   #ECR07000
               STA   BOOTON5+1
               JMP   BOOTON
ECR07000       STY   CLNAFF3+1        ; ADRESSE SPRITE RELEVE/ENFONCE
               STA   CLNOPT1          ; 0000/FFFF
               LDA   #$4125           ; ADRESSE ECRAN
               STA   CLNAFF4+1
               JSR   CLNAFF           ; AFFICHAGE SPRITE
               JSR   SAUV
               JMP   SOURIS1

***********

ECR07011       LDA   #$0009           ; ERREUR : ALL SELECTIONNE
               STA   ALERTI
               JSR   ALERT
               JSR   ALERTFIN
               JMP   SOURIS1
ECR07012       LDA   #$000A           ; ERREUR : PRINTSHOP SELECTIONNE
               STA   ALERTI
               JSR   ALERT
               JSR   ALERTFIN
               JMP   SOURIS1
ECR07013       LDA   #$000B           ; ERREUR : OPEN/SAVE MEME CHEMIN
               STA   ALERTI
               JSR   ALERT
               JSR   ALERTFIN
               JMP   SOURIS1
badCONVERT     lda   #$000F           ; toinet: Load format: 8 bits
               sta   ALERTI           ;         Save format: 4 bits
               jsr   ALERT            ;         but NONE's selected
               jsr   ALERTFIN
               jmp   SOURIS1

ECR0701        LDX   SECR2+1          ; OPTIONS : LET'S
               LDA   #ECR07010
               STA   BUMPER5+1
               JMP   BUMPER
ECR07010       LDA   CLNOPT1          ; CONVERT ALL FOLDER FILES
               BEQ   ECR070100
               JMP   SOURIS1
ECR070100      LDA   CLNCON1          ; ON VERIFIE QUE C'EST BON
               CMP   #$0008
               BEQ   ECR07012         ; PRINTSHOP
               CMP   #$000A
               BEQ   ECR07011         ; ALL
               LDA   CLNCON1          ; MODE DE CONVERSION (3200,256...)
               LSR
               CMP   #$0006           ; NONE
               BNE   ECR070101
               dec                    ; toinet 6->5
               dec                    ; toinet 5->4
ECR070101      STA   $0130

               JSR   SAMEFOLDER       ; MEME REPERTOIRE OPEN/SAVE
               bcc   goodINIT         ; toinet
               cmp   #1
               bne   badINIT1
               brl   ECR07013         ; save directory
badINIT1       brl   badCONVERT       ; mode de conversion mauvais

goodINIT       LDA   #$0006           ; FENETRE DE TRAVAIL : CONVERSION
               STA   WORKINGI
               JSR   WORKING
               LDA   #$61F6
               STA   ADRE
               LDA   #$E120
               STA   AFTCA2+2
               STA   AFTCA4+2         ; INIT AFFICHAGE NUMERO
               LDA   #$0001           ; PAS DE FENETRE WORKING AFFICHE
               STA   NOWINDOWFLAG
               LDA   #$0001
               STA   NUMEROIMAGE      ; NOMBRE D'IMAGE CONVERTIE

ECR0701NEXT    JSR   TOINETLOAD       ; CHARGE IMAGE ET DECOMPRESSE
               bcc   ECR07014         ; toinet
               CMP   #$0002           ; FIN
               BEQ   ECR07001FIN
               LDA   #$000C           ; ERREUR BLOQUANTE :I/O ERREUR LOAD
               STA   ALERTI
               JSR   ALERTFIN
               JSR   ALERT
               BRA   ECR07001FIN

ECR07014       JSR   SUPERMANCONV     ; CONVERTIT L'IMAGE
               JSR   TOINETSAVE       ; SAUVEGARDE L'IMAGE
               bcc   ECR07015
               CMP   #$0001           ; ERREUR BLOQUANTE
               BEQ   ECR07016
               LDA   #$000D           ; I/O ERREUR
               STA   ALERTI
               JSR   ALERTFIN
               JSR   ALERT
               BRA   ECR07001FIN
ECR07016       LDA   #$000E           ; FULL
               STA   ALERTI
               JSR   ALERTFIN
               JSR   ALERT
               BRA   ECR07001FIN
ECR07015       LDA   NUMEROIMAGE
               STA   VALH
               JSR   TRANS            ; AFFICHAGE NUMERO
               INC   NUMEROIMAGE
               LDX   #$0100           ; TEST CLAVIER
ECR07017       DEX
               BEQ   ECR0701NEXT
               LDAL  $00BFFF          ;  ESC ?
               BPL   ECR07017
               STAL  $00C010
               AND   #$FF00
               CMP   #$9B00           ; ESC
               BNE   ECR07017

ECR07001FIN    ldx   #goCONVERTALL    ; FIN
               ldy   #$0001
               jsr   goCOMMUNICATE
               STZ   IMAGEOK          ; PAS D'IMAGE EN MEMOIRE
               STZ   ECR04083         ;     AUCUNE ZONE CHOISIE
               STZ   STATFLAG         ;     ON DOIT RETRAVAILLER LA PALETTE
               STZ   NOWINDOWFLAG     ; FIN DE CONVERSION
               LDA   #$0120
               STA   AFTCA2+2
               STA   AFTCA4+2         ; FIN AFFICHAGE NUMERO
               JSR   ALERTFIN
               JMP   SOURIS1

NOWINDOWFLAG   HEX   0000
NUMEROIMAGE    HEX   0000

SAMEFOLDER     NOP                    ; VERIFIE QUE LES REPERTOIRES OPEN/SAVE SONT DIFFERENTS
               ldx   #goCONVERTALL    ; PALETTE 4096 GS
               ldy   #$0000           ; INIT
               jsr   goCOMMUNICATE    ; 0: CHEMINS DIFFERENTS, 1: CHEMIN IDENT
               RTS

TOINETLOAD     ldx   #goCONVERTLOAD   ; CHARGE L'IMAGE SUIVANTE ET LA DECOMPRESSE
               jsr   goCOMMUNICATE
               RTS

TOINETSAVE     ldx   #goCONVERTSAVE   ; SAUVEGARDE L'IMAGE
               jsr   goCOMMUNICATE
               RTS

SUPERMANCONV   lda   #1               ; toinet
               sta   IMAGEOK          ; toinet

               LDA   CLNCON1          ; NONE ? => ON SAUTE
               CMP   #$000C
               BEQ   SUPERMANCONV1
               LDA   $0100            ; OHS
               STA   OHS
               LDA   $0102            ; OVS
               STA   OVS
               LDA   #$0000           ; REDUCTION
               STA   CLNSELE
               LDX   #$0140
               LDA   OHS
               CMP   #$0140           ; ON CHOISIT LE 320*200
               BPL   SUPERMANCONV2    ; OU MOINS SI IMAGE + PETITE
               LDX   OHS
SUPERMANCONV2  STX   RHS
               LDX   #$00C8
               LDA   OVS
               CMP   #$00C8
               BPL   SUPERMANCONV3
               LDX   OVS
SUPERMANCONV3  STX   RVS
               LDA   $0104            ; FLAG SCB 256/16
               STA   IMAGE256
               JSR   SELCONV          ; REDECUTION DE L'IMAGE
               JSR   SELAFFI705
               JSR   INITNEWZONE
               JSR   STATGO           ; STATISTICS
               STZ   CONVIRVIEWFL
               JSR   CONVERTAREA      ; CONVERSION
SUPERMANCONV1  RTS

***************

ECR0703        LDA   #CLNOPT2         ; OPTIONS : I BELIEVE IN GOD
               STA   BOOTON2+1
               LDA   #ECR07030
               STA   BOOTON5+1
               JMP   BOOTON
ECR07030       STY   CLNAFF3+1
               STA   CLNOPT2          ; 0000/FFFF
               LDA   #$49E5           ; ADRESSE ECRAN
               STA   CLNAFF4+1
               JSR   CLNAFF           ; AFFICHAGE SPRITE
               JSR   SAUV
               JMP   SOURIS1

ECR0704        LDA   #CLNOPT3         ; OPTIONS : CONVERT FROM...TO
               STA   BOOTON2+1
               LDA   #ECR07040
               STA   BOOTON5+1
               JMP   BOOTON
ECR07040       STY   CLNAFF3+1
               STA   CLNOPT3          ; 0000/FFFF
               LDA   #$52A5           ; ADRESSE ECRAN
               STA   CLNAFF4+1
               JSR   CLNAFF           ; AFFICHAGE SPRITE
               JSR   SAUV
               JMP   SOURIS1

ECR0702        LDX   SECR2+1          ; OPTIONS : EXIT
               LDA   #ECR07020
               STA   BUMPER5+1        ; PREPARE LE JMP ECR07020
               JMP   BUMPER           ; BUMPER MANAGER (RELEVE,ENFONCE,TRAITE...)
ECR07020       LDA   #$0001           ; IMAGE MAIN
               JMP   PICT

ECR0705        LDX   SECR2+1          ; OPTIONS : FROM +
               LDA   #ECR07050
               STA   BOMPER5+1
               JMP   BOMPER
ECR07050       LDA   OPTFROM          ; +1
               CMP   OPTTO
               BEQ   ECR07051         ; ON SORT
               INC
               STA   OPTFROM
               JSR   ECR07065         ; AFFICHAGE FROM
ECR07051       JMP   SOURIS

ECR0716        LDA   #ECR07160        ; FROM : SURFACE
               STA   SURFACE5+1
               JMP   SURFACE
ECR07160       JSR   DESS1
               LDA   #$545A
               LDX   #$0000
               LDY   OPTTO
               JSR   SAISIEVAL
               BNE   ECR07161
               LDA   OPTFROM
ECR07161       STA   OPTFROM
               JSR   ECR07065         ; AFFICHAGE NOMBRE
               JSR   ECR04103
               JSR   SAUV
               JMP   SOURIS1

ECR0706        LDX   SECR2+1          ; OPTIONS : FROM -
               LDA   #ECR07060
               STA   BOMPER5+1
               JMP   BOMPER
ECR07060       LDA   OPTFROM          ; -1
               CMP   #$0001
               BEQ   ECR07061         ; ON SORT
               DEC
               STA   OPTFROM
               JSR   ECR07065         ; AFFICHAGE FROM
ECR07061       JMP   SOURIS

ECR0717        LDA   #ECR07170        ; TO : SURFACE
               STA   SURFACE5+1
               JMP   SURFACE
ECR07170       JSR   DESS1
               LDA   #$5BDA
               LDX   OPTFROM
               DEX
               LDY   #$00C8
               JSR   SAISIEVAL
               BNE   ECR07171
               LDA   OPTTO
ECR07171       STA   OPTTO
               JSR   ECR07066         ; AFFICHAGE NOMBRE
               JSR   ECR04103
               JSR   SAUV
               JMP   SOURIS1

ECR07065       LDA   OPTFROM          ; FROM AFFICHAGE
               STA   VALH
               LDA   #$545A
               STA   ADRE
               JSR   TRANSB
               RTS
ECR07066       LDA   OPTTO            ; TO AFFICHAGE
               STA   VALH
               LDA   #$5BDA
               STA   ADRE
               JSR   TRANSB
               RTS
ECR07067       LDA   OPTUNC           ; UNCONVERT AFFICHAGE
               STA   VALH
               LDA   #$650E
               STA   ADRE
               JSR   TRANSB           ; FULL BLACK
               RTS
OPTFROM        HEX   0100             ; FROM
OPTTO          HEX   C800             ; TO
OPTUNC         HEX   0000             ; UNCONVERT

ECR0707        LDX   SECR2+1          ; OPTIONS : TO +
               LDA   #ECR07070
               STA   BOMPER5+1
               JMP   BOMPER
ECR07070       LDA   OPTTO            ; +1
               CMP   #$00C8
               BEQ   ECR07071
               INC
               STA   OPTTO
               JSR   ECR07066         ; AFFICHAGE TO
ECR07071       JMP   SOURIS

ECR0708        LDX   SECR2+1          ; OPTIONS : TO -
               LDA   #ECR07080
               STA   BOMPER5+1
               JMP   BOMPER
ECR07080       LDA   OPTTO            ; -1
               CMP   OPTFROM
               BEQ   ECR07081
               DEC
               STA   OPTTO
               JSR   ECR07066         ; AFFICHAGE TO
ECR07081       JMP   SOURIS

ECR0709        LDX   SECR2+1          ; OPTIONS : UNCONVERT
               LDA   #ECR07090
               STA   BUMPER5+1
               JMP   BUMPER
ECR07090       LDA   OPTUNC
               BEQ   ECR07091         ; ON SORT CAR AUCUNE LIGNE PRETE
               DEC                    ; MISE A ZERO DANS CONVTAB1
               ASL
               TAX
               STZ   CONVTAB1,X       ; LIGNE NON TRAITEE
               JSR   ECR07114         ; ON RECHERCHE LE PLUS PRES DISPO
               JSR   ECR07067         ; ON L'AFFICHE
ECR07091       JMP   SOURIS1

ECR0710        LDX   SECR2+1          ; OPTIONS : UN +
               LDA   #ECR07100
               STA   BOMPER5+1
               JMP   BOMPER
ECR07100       JSR   ECR07107         ; TROUVE LE SUIVANT
               JSR   ECR07067         ; AFFICHAGE UNCONVERT
               JMP   SOURIS

ECR0711        LDX   SECR2+1          ; OPTIONS : UN -
               LDA   #ECR07110
               STA   BOMPER5+1
               JMP   BOMPER
ECR07110       JSR   ECR07116         ; TROUVE LE PRECEDENT
               JSR   ECR07067         ; AFFICHAGE UNCONVERT
               JMP   SOURIS

ECR07114       LDY   #$0000           ; EN TROUVE UN
               LDX   #$0000
               LDA   OPTUNC
               BEQ   ECR07118
               DEC
               ASL
               TAX
               LDA   CONVTAB1,X
               BNE   ECR07111
               TXY                    ; CHERCHE LE SUIVANT
               INY
               INY
               CPY   #$0190
               BEQ   ECR07119
ECR07118       LDA   CONVTAB1,Y
               BNE   ECR071192
               INY
               INY
               CPY   #$0190
               BNE   ECR07118
ECR07119       TXY                    ; PAS TROUVE... LE PRECEDENT
               CPY   #$0000
               BEQ   ECR071190
               DEY
               DEY
ECR071191      LDA   CONVTAB1,Y
               BNE   ECR071192
               DEY
               DEY
               BPL   ECR071191
ECR071190      STZ   OPTUNC           ; PAS TROUVE... IL N'Y EN A PAS
               RTS
ECR071192      TYA                    ; TROUVE !!
               LSR
               INC
               STA   OPTUNC
ECR07111       RTS


ECR07107       LDA   OPTUNC           ; TROUVE LE SUIVANT
               BEQ   ECR07105
               ASL
               TAX
               CPX   #$0190           ; C'EST LE DERNIER
               BEQ   ECR07105
ECR07101       LDA   CONVTAB1,X
               BNE   ECR07106
               INX
               INX
               CPX   #$0190           ; 200*2
               BNE   ECR07101
ECR07105       RTS                    ; PAS TROUVE
ECR07106       TXA
               LSR
               INC
               STA   OPTUNC
               RTS

ECR07116       LDA   OPTUNC           ; TROUVE LE PRECEDENT
               BEQ   ECR07115
               DEC
               BEQ   ECR07115
               DEC
               ASL
               TAX
ECR07113       LDA   CONVTAB1,X
               BNE   ECR07117
               DEX
               DEX
               BPL   ECR07113         ; 200*2
ECR07115       RTS                    ; PAS TROUVE
ECR07117       TXA
               LSR
               INC
               STA   OPTUNC
               RTS

ECR0712        LDA   #CLNOPT4         ; OPTIONS : TRUE COLOR
               STA   BOOTON2+1        ; SERT POUR VOIR SI LE BOUTON EST ACTIF
               LDA   #ECR07120
               STA   BOOTON5+1
               JMP   BOOTON
ECR07120       STY   CLNAFF3+1        ; ADRESSE SPRITE RELEVE/ENFONCE
               STA   CLNOPT4          ; 0000 ACTIF/FFFF INACTIF
               LDA   #$6D85           ; ADRESSE ECRAN
               STA   CLNAFF4+1
               JSR   CLNAFF           ; AFFICHAGE SPRITE
               JSR   SAUV
               JMP   SOURIS1

ECR0713        LDX   SECR2+1          ; OPTIONS : VIEW TRUE
               LDA   #ECR07130
               STA   BUMPER5+1
               JMP   BUMPER
ECR07130       LDA   CLNOPT4          ; AFFICHAGE
               BNE   ECR07132         ; NON ACTIF
               JSR   STATGO           ;  STATISTICS
               JSR   TRUE
               LDA   #$0007           ; IMAGE OPTION
               JMP   PICT00
ECR07132       JMP   SOURIS1          ; ON SORT SANS AFFICHER

ECR0714        LDX   SECR2+1          ; OPTION : ABOUT ...
               LDA   #ECR07140
               STA   BUMPER5+1
               JMP   BUMPER
ECR07140       LDA   #$000E           ; IMAGE ABOUT
               JMP   PICT             ; ON AFFICHE L'IMAGE ET ON TRAITE ...

ECR0715        LDA   #ECR07150        ; OPTION : SCRIPT EDITOR
               STA   SURFACE5+1
               JMP   SURFACE
ECR07150       JMP   SCRIPED          ; ON ENTRE DANS LE SCRIPT EDITOR

*******************************************************************
******************  SCRIPT MODIFICATION  **************************

SCRIPED        SEI                    ; ON MODIFIE LE SCRIPT
               STZ   SCRICOR3
               JSR   SCRIPCLN
               JSR   DESS1
               LDA   SCRIPMOD
               CMP   #$0001           ; 256
               BEQ   SCRIPAD04
               CMP   #$0002           ; 16
               BEQ   SCRIPED04

               LDX   #$002E           ; RECOPIE LES VALEURS DU SCRIPT 3200
SCRIPED01      LDA   CONVSCR1,X       ; DIFFERENCE
               STA   SCRIPVA5,X
               LDA   CONVSCR2,X       ; FREQUENCE
               STA   SCRIPVA6,X
               DEX
               DEX
               BPL   SCRIPED01
               BRA   SCRIPED03

SCRIPAD04      LDX   #$002E           ; RECOPIE LES VALEURS DU SCRIPT 256
SCRIPAD01      LDA   ZONESCR1,X       ; DIFFERENCE
               STA   SCRIPVA5,X
               LDA   ZONESCR2,X       ; FREQUENCE
               STA   SCRIPVA6,X
               DEX
               DEX
               BPL   SCRIPAD01
               BRA   SCRIPED03

SCRIPED04      LDX   #$002E           ; RECOPIE LES VALEURS DU SCRIPT 16
SCRIPED02      LDA   CONVOSC1,X       ; DIFFERENCE
               STA   SCRIPVA5,X
               LDA   CONVOSC2,X       ; FREQUENCE
               STA   SCRIPVA6,X
               DEX
               DEX
               BPL   SCRIPED02

SCRIPED03      LDX   #$0016
SCRIPOD04      LDA   SCRIPVA5,X       ; COPIE LES VALEURS
               STA   SCRIPVA3,X
               LDA   SCRIPVA6,X
               STA   SCRIPVA4,X
               DEX
               DEX
               BPL   SCRIPOD04
               LDA   SCRIPVA3
               STA   SCRVALEU
               STZ   SCRICOR1
               STZ   SCRICOR2         ; INIT
               sep   #$20             ; TOINET (A= 8bits, XY=16 bits)
               ldal  $e0c018
               sta   fg4080           ; bit 7=1 -> 80 colonnes mode
               stal  $e0c00c          ; Mise en 40 colonnes
               lda   #$f2
               stal  $e0c022          ; FOND BLEU, TEXTE BLANC
               ldal  $e0c034
               and   #$f0
               ora   #$02
               stal  $e0c034
               lda   #$41
               stal  $e0c029          ; MODE TEXT
               rep   #$20             ; FIN TOINET
               JSR   SCRIPIN          ; AFFICHAGE DU CADRE
               JSR   SCRIVAD          ; AFFICHAGE VALEURS PAR DEFAUT
               JSR   SCRIVAF          ; AFFICHAGE VALEURS MODIFIABLES
               JSR   SCRIVADFLCH      ; AFFICHE FLECHE
               LDA   #$B2AF           ; /2
               STAL  $000594
               LDA   #$B1A0           ; 1
               STAL  $000592
               JMP   SCRIPEDB         ; ON AFFICHE LA SELECTION

SCRIPED1       LDAL  $00BFFF
               BPL   SCRIPED1         ; LECTURE CLAVIER
               STAL  $00C010
               AND   #$FF00
               LDX   #$0000
SCRIPED10      CMP   SCRIKBT1,X
               BEQ   SCRIPED2
               INX
               INX
               CPX   #$0014
               BNE   SCRIPED10
               BRA   SCRIPED1
SCRIPED2       LDA   SCRIKBT2,X
               STA   SCRIPED20+1
SCRIPED20      JMP   $A0A0

SCRIKBT1       HEX   009B,008A,008B,0095,0088,00AB,00AD,00B9,00B6,0089
SCRIKBT2       DA    SCRIPEND,SCRIPED3,SCRIPED4,SCRIPED5,SCRIPED6,SCRIPED7,SCRIPED8,SCRIPED9,SCRIPEDA,SCRIPTAB

SCRIPTAB       LDA   SCRICOR3         ; TAB
               BEQ   SCRIPTAB2
               LDX   #$0016           ; SAUVEGARDE LES VALEURS
SCRIPTAB3      LDA   SCRIPVA3,X
               STA   SCRIPVA5+24,X    ; DIFF
               LDA   SCRIPVA4,X
               STA   SCRIPVA6+24,X    ; FREQ
               DEX
               DEX
               BPL   SCRIPTAB3
               LDX   #$0016           ; RECOPIE LES NOUVELLES
SCRIPTAB5      LDA   SCRIPVA5,X
               STA   SCRIPVA3,X       ; DIFF
               LDA   SCRIPVA6,X
               STA   SCRIPVA4,X       ; FREQ
               DEX
               DEX
               BPL   SCRIPTAB5
               LDA   #$B1A0           ; 1
               STAL  $000592
               STZ   SCRICOR3
               JSR   SCRIVAD          ; AFFICHAGE VALEURS PAR DEFAUT
               JSR   SCRIVAF          ; AFFICHAGE VALEURS MODIFIABLES
               JSR   SCRIVADFLCH      ; AFFICHE FLECHE
               LDA   SCRIPVA3
               STA   SCRVALEU
               STZ   SCRICOR1
               STZ   SCRICOR2         ; INIT
               JMP   SCRIPEDB         ; AFFICH SELECTION
SCRIPTAB2      LDX   #$0016           ; SAUVEGARDE LES VALEURS
SCRIPTAB4      LDA   SCRIPVA3,X
               STA   SCRIPVA5,X       ; DIFF
               LDA   SCRIPVA4,X
               STA   SCRIPVA6,X       ; FREQ
               DEX
               DEX
               BPL   SCRIPTAB4
               LDX   #$0016           ; RECOPIE LES NOUVELLES
SCRIPTAB6      LDA   SCRIPVA5+24,X
               STA   SCRIPVA3,X       ; DIFF
               LDA   SCRIPVA6+24,X
               STA   SCRIPVA4,X       ; FREQ
               DEX
               DEX
               BPL   SCRIPTAB6
               LDA   #$B2A0           ; 2
               STAL  $000592
               LDA   #$0001
               STA   SCRICOR3
               JSR   SCRIVAD          ; AFFICHAGE VALEURS PAR DEFAUT
               JSR   SCRIVAF          ; AFFICHAGE VALEURS MODIFIABLES
               JSR   SCRIVADFLCH      ; AFFICHE FLECHE
               LDA   SCRIPVA3
               STA   SCRVALEU
               STZ   SCRICOR1
               STZ   SCRICOR2         ; INIT
               JMP   SCRIPEDB         ; AFFICH SELECTION


SCRIPED3       LDA   SCRICOR2         ; DOWN
               CMP   #$000B           ; 11
               BEQ   SCRIPED32
               INC
               STA   SCRICOR2
               LDA   SCRICOR1
               BEQ   SCRIPED31        ; DIFF
               LDA   SCRICOR2
               ASL
               TAY
               LDA   SCRIPVA4,Y
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED31      LDA   SCRICOR2         ; DIFF
               ASL
               TAY
               LDA   SCRIPVA3,Y
               STA   SCRVALEU
SCRIPED32      JMP   SCRIPEDB


SCRIPED4       LDA   SCRICOR2         ; UP
               BEQ   SCRIPED42
               DEC
               STA   SCRICOR2
               LDA   SCRICOR1
               BEQ   SCRIPED41        ; DIFF
               LDA   SCRICOR2
               ASL
               TAY
               LDA   SCRIPVA4,Y
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED41      LDA   SCRICOR2         ; DIFF
               ASL
               TAY
               LDA   SCRIPVA3,Y
               STA   SCRVALEU
SCRIPED42      JMP   SCRIPEDB


SCRIPED5       LDA   #$0001           ;  ->
               STA   SCRICOR1
               LDA   SCRICOR2
               ASL
               TAY
               LDA   SCRIPVA4,Y
               STA   SCRVALEU
               JMP   SCRIPEDB


SCRIPED6       STZ   SCRICOR1         ;  <-
               LDA   SCRICOR2         ; DIFF
               ASL
               TAY
               LDA   SCRIPVA3,Y
               STA   SCRVALEU
               JMP   SCRIPEDB


SCRIPED7       LDA   SCRICOR1         ;  +
               BEQ   SCRIPED72        ; 0=DIFF
               LDA   SCRIPMOD         ; FREQ
               BEQ   SCRIPED77
               CMP   #$0001
               BEQ   SCRIPAD77
               LDA   SCRVALEU         ; 16
               CMP   #$FF00           ; ----
               BEQ   SCRIPED79
               CMP   #$270F           ; 9999
               BEQ   SCRIPED78
               INC
               STA   SCRVALEU
SCRIPED78      JMP   SCRIPEDB
SCRIPED79      LDA   #$0001
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPAD77      LDA   SCRVALEU         ; 256
               CMP   #$FF00           ; ----
               BEQ   SCRIPAD71
               CMP   #$0103F          ; 13*320
               BEQ   SCRIPAD70
               INC
               STA   SCRVALEU
SCRIPAD70      JMP   SCRIPEDB
SCRIPAD71      LDA   #$0001
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED77      LDA   SCRVALEU         ; 3200
               CMP   #$FF00           ; ----
               BEQ   SCRIPED71
               CMP   #$013F           ; 319
               BEQ   SCRIPED70
               INC
               STA   SCRVALEU
SCRIPED70      JMP   SCRIPEDB
SCRIPED71      LDA   #$0001
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED72      LDA   SCRVALEU         ; DIFF : 3200,256,16
               CMP   #$FF00           ; ----
               BEQ   SCRIPED74
               CMP   #$003A           ; 58
               BEQ   SCRIPED75
               INC
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED74      LDA   #$0001
               STA   SCRVALEU
SCRIPED75      JMP   SCRIPEDB


SCRIPED8       LDA   SCRICOR1         ;  -
               BEQ   SCRIPED82        ; 0=DIFF
               LDA   SCRVALEU         ; FREQ : 3200,256,16
               CMP   #$FF00           ; ----
               BEQ   SCRIPED89
               CMP   #$0001
               BEQ   SCRIPED88
               DEC
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED88      LDA   #$FF00           ; ----
               STA   SCRVALEU
SCRIPED89      JMP   SCRIPEDB
SCRIPED82      LDA   SCRVALEU         ; DIFF : 3200,256,16
               CMP   #$FF00           ; ----
               BEQ   SCRIPED84
               CMP   #$0001
               BEQ   SCRIPED83
               DEC
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED83      LDA   #$FF00           ; ----
               STA   SCRVALEU
SCRIPED84      JMP   SCRIPEDB


SCRIPED9       LDA   SCRICOR1         ;  9 (+100)
               BEQ   SCRIPED98
               LDA   SCRIPMOD
               BEQ   SCRIPED97
               CMP   #$0001
               BEQ   SCRIPAD98
               LDA   SCRVALEU         ; 16
               CMP   #$FF00           ; ----
               BEQ   SCRIPED92
               CMP   #$26AC           ; 9900
               BPL   SCRIPED99
               CLC
               ADC   #$0064           ; +100
               STA   SCRVALEU
SCRIPED98      JMP   SCRIPEDB
SCRIPED92      LDA   #$0064
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED99      LDA   #$270F
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPAD98      LDA   SCRVALEU         ; 256
               CMP   #$FF00           ; ----
               BEQ   SCRIPAD92
               CMP   #$0FDC           ; 13*320-100
               BPL   SCRIPAD99
               CLC
               ADC   #$0064           ; +100
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPAD92      LDA   #$0064
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPAD99      LDA   #$103F
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED97      LDA   SCRVALEU         ; 3200
               CMP   #$FF00
               BEQ   SCRIPED92
               CMP   #$00DC           ; 220
               BPL   SCRIPED91
               CLC
               ADC   #$0064           ; +100
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPED91      LDA   #$013F
               STA   SCRVALEU
               JMP   SCRIPEDB

SCRIPEDA       LDA   SCRICOR1         ;  6 (-100)
               BEQ   SCRIPEDA2
SCRIPEDA7      LDA   SCRVALEU         ; FREQ : 3200,256,16
               CMP   #$FF00           ; ----
               BEQ   SCRIPEDA2
               CMP   #$0065
               BMI   SCRIPEDA1
               SEC
               SBC   #$0064           ; -100
               STA   SCRVALEU
               JMP   SCRIPEDB
SCRIPEDA1      LDA   #$FF00           ; ----
               STA   SCRVALEU
SCRIPEDA2      JMP   SCRIPEDB

*********

SCRIPEDB       LDA   SCRICOR1         ; MISE A JOUR DES VALEURS
               BEQ   SCRIPEDB1
               LDA   SCRICOR2         ; FREQ
               ASL
               TAX
               LDA   SCRVALEU
               STA   SCRIPVA4,X
               BRA   SCRIPEDB2
SCRIPEDB1      LDA   SCRICOR2         ; DIFF
               ASL
               TAX
               LDA   SCRVALEU
               STA   SCRIPVA3,X
SCRIPEDB2      JSR   SCRIVAF          ; AFFICHAGE
               LDA   SCRICOR1
               BEQ   SCRIPEDB3
               LDA   #$001E           ; FREQ
               STA   SCRIPEDB5+1
               BRA   SCRIPEDB4
SCRIPEDB3      LDA   #$0018           ; DIFF
               STA   SCRIPEDB5+1
SCRIPEDB4      LDA   SCRICOR2
               CLC
               ADC   #$0006
               ASL
               TAX
               LDA   SCRITEXT,X       ; ADRESSE
               CLC
SCRIPEDB5      ADC   #$001A
               STA   SCRIPEDB6+1
               CLC
               ADC   #$0006
               STA   SCRIPEDB7+1
               LDA   #$3EA0           ; ON AFFICHE EN INVERSE VIDEO LE CONTOUR
SCRIPEDB6      STAL  $00A0A0
               LDA   #$A03C
SCRIPEDB7      STAL  $00A0A0
               JMP   SCRIPED1         ; ON REMONTE

SCRIPEND       LDA   SCRICOR3         ; ESC : FIN, ON SORT
               BEQ   SCRIPENDR2       ; RECOPIE LES VALEURS DE L'ECRAN
               LDX   #$0016           ; SAUVEGARDE LES VALEURS
SCRIPENDR1     LDA   SCRIPVA3,X
               STA   SCRIPVA5+24,X    ; DIFF
               LDA   SCRIPVA4,X
               STA   SCRIPVA6+24,X    ; FREQ
               DEX
               DEX
               BPL   SCRIPENDR1
               BRA   SCRIPENDR4
SCRIPENDR2     LDX   #$0016           ; SAUVEGARDE LES VALEURS
SCRIPENDR3     LDA   SCRIPVA3,X
               STA   SCRIPVA5,X       ; DIFF
               LDA   SCRIPVA4,X
               STA   SCRIPVA6,X       ; FREQ
               DEX
               DEX
               BPL   SCRIPENDR3
SCRIPENDR4     LDA   SCRIPMOD
               CMP   #$0001
               BEQ   SCRIPAND2
               CMP   #$0002
               BEQ   SCRIPEND2

               LDX   #$002E           ; RECOPIE LES VALEURS DU SCRIPT 3200
SCRIPEND1      LDA   SCRIPVA5,X       ; DIFFERENCE
               STA   CONVSCR1,X
               LDA   SCRIPVA6,X       ; FREQUENCE
               STA   CONVSCR2,X
               DEX
               DEX
               BPL   SCRIPEND1
               BRA   SCRIPEND4

SCRIPAND2      LDX   #$002E           ; RECOPIE LES VALEURS DU SCRIPT 256
SCRIPAND3      LDA   SCRIPVA5,X       ; DIFFERENCE
               STA   ZONESCR1,X
               LDA   SCRIPVA6,X       ; FREQUENCE
               STA   ZONESCR2,X
               DEX
               DEX
               BPL   SCRIPAND3
               BRA   SCRIPEND4

SCRIPEND2      LDX   #$002E           ; RECOPIE LES VALEURS DU SCRIPT 16
SCRIPEND3      LDA   SCRIPVA5,X       ; DIFFERENCE
               STA   CONVOSC1,X
               LDA   SCRIPVA6,X       ; FREQUENCE
               STA   CONVOSC2,X
               DEX
               DEX
               BPL   SCRIPEND3

SCRIPEND4      LDX   #$7FFE
               LDA   #$0000           ; NETTOY LA PAGE GRAPHIQUE
SCRIPEND5      STAL  $012000,X
               DEX
               DEX
               BPL   SCRIPEND5

               sep   #$20             ; TOINET (80 colonnes ou non ?)
               ldal  $e0c034          ; CONTOURS NOIR
               and   #$f0
               stal  $e0c034
               ldal  $e0c029          ; AFFICHE LA PAGE GRAPHIQUE
               ora   #$A1
               stal  $e0c029
               lda   fg4080           ; Si bit 7=0 alors en entree,
               bpl   noCHANGE         ; on etait en 40 colonnes
               stal  $e0c00d

noCHANGE       ldx   #0               ; Efface l'ecran texte
               lda   #$a0
]lp            stal  $e00400,x        ; $00-$80
               stal  $e00500,x        ; $28-$A8
               stal  $e00600,x        ; $50-$D0 up to $F7
               stal  $e00700,x        ; 'cos $F8-$D0= 40d colonnes
               inx                    ; Il n'y a que 248 octets utilises
               cpx   #$f8             ; les 8 restants sont indispensables
               bne   ]lp              ; au fonctionnement du systeme

               rep   #$20             ; FIN TOINET

               STZ   BOUT
               STZ   BOUT1
               CLI
               LDA   #$0007           ; ON SORT VERS L'ECRAN OPTION
               JMP   PICT

fg4080         ds    1

**********

SCRIVAF        LDA   #$001A           ; AFFICHAGE VALEURS
               STA   SCRIPAFX
               LDA   #$0006
               STA   SCRIPAFY         ; INIT
               LDX   #$0000
SCRIVAF1       LDA   SCRIPVA3,X       ; DIFF LOCAL
               JSR   SCRIPAF          ; AFFICHAGE 1 VALEUR
               INC   SCRIPAFY
               INX
               INX
               CPX   #$0018           ; 12 VALEURS
               BNE   SCRIVAF1
               LDA   #$0020
               STA   SCRIPAFX
               LDA   #$0006
               STA   SCRIPAFY
               LDX   #$0000
SCRIVAF2       LDA   SCRIPVA4,X       ; FREQ LOCAL
               JSR   SCRIPAF          ; AFFICHAGE 1 VALEUR
               INC   SCRIPAFY
               INX
               INX
               CPX   #$0018           ; 12 VALEURS
               BNE   SCRIVAF2
               RTS

SCRIVAD        LDA   #$0004           ; AFFICHAGE VALEURS PAR DEFAUT
               STA   SCRIPAFX
               LDA   #$0006
               STA   SCRIPAFY
               LDX   #$0000
               LDA   SCRIPMOD
               CMP   #$0001
               BEQ   SCRIVAD6
               CMP   #$0002
               BEQ   SCRIVAD5

               LDA   #SCRIPVA9        ; 3200
               STA   SCRIVAD1+1
               LDA   #SCRIPVA10
               STA   SCRIVAD2+1
               BRA   SCRIVADTAB

SCRIVAD6       LDA   #SCRIPVA7        ; 256
               STA   SCRIVAD1+1
               LDA   #SCRIPVA8
               STA   SCRIVAD2+1
               BRA   SCRIVADTAB

SCRIVAD5       LDA   #SCRIPVA1        ; 16
               STA   SCRIVAD1+1
               LDA   #SCRIPVA2
               STA   SCRIVAD2+1

SCRIVADTAB     LDA   SCRICOR3         ; QUEL ECRAN ?
               BEQ   SCRIVAD1
               LDA   SCRIVAD1+1
               CLC
               ADC   #$0018           ; +24
               STA   SCRIVAD1+1
               LDA   SCRIVAD2+1
               CLC
               ADC   #$0018           ; +24
               STA   SCRIVAD2+1
SCRIVAD1       LDA   SCRIPVA1,X       ; DIFF DEFAULT
               JSR   SCRIPAF          ; AFFICHAGE 1 VALEUR
               INC   SCRIPAFY
               INX
               INX
               CPX   #$0018           ; 12 VALEURS
               BNE   SCRIVAD1
               LDA   #$000A
               STA   SCRIPAFX
               LDA   #$0006
               STA   SCRIPAFY
               LDX   #$0000
SCRIVAD2       LDA   SCRIPVA2,X       ; DIFF DEFAULT
               JSR   SCRIPAF          ; AFFICHAGE 1 VALEUR
               INC   SCRIPAFY
               INX
               INX
               CPX   #$0018           ; 12 VALEURS
               BNE   SCRIVAD2
               RTS

SCRIVADFLCH    LDA   #$A0A0           ; ON PLACE LA FLECHE SI ELLE TOMBE DANS
               LDY   #$000C
SCRIVADFLCH1   LDX   SCRITEXT,Y
               STAL  $000014,X        ; EFFACE LA FLECHE
               INY
               INY
               CPY   #$0024
               BNE   SCRIVADFLCH1
               LDA   SCRIPMOD
               CMP   #$0001           ; L'ECRAN
               BEQ   SCRIVAD7
               CMP   #$0002
               BEQ   SCRIVAD8
               LDA   CONVOSII         ; 3200
               BRA   SCRIVAD4
SCRIVAD7       LDA   ZONEOSII         ; 256
               BRA   SCRIVAD4
SCRIVAD8       LDA   CONVOSCI         ; 16
SCRIVAD4       LSR                    ; VALEUR
               LDX   SCRICOR3
               CPX   #$0001
               BEQ   SCRIFLCH1
               CMP   #$000C           ; HAUT
               BMI   SCRIFLCH2
SCRIFLCH3      RTS
SCRIFLCH1      CMP   #$000C           ; BAS
               BMI   SCRIFLCH3
               SEC
               SBC   #$000C
               CMP   #$000C
               BMI   SCRIFLCH2
               RTS
SCRIFLCH2      CLC
               ADC   #$0006
               ASL
               TAX
               LDA   SCRITEXT,X
               CLC
               ADC   #$0014
               STA   SCRIVAD3+1
               LDA   #$BEAD           ; ->
SCRIVAD3       STAL  $00A0A0
               RTS


SCRIPAF        PHX                    ; AFFICHAGE DE ACC EN X,Y EN DECIMAL...
               STA   VALH
               JSR   SCRICOV          ; CONVERSION EN DECIMAL
               LDX   VAL4
               LDA   SCRIPAFT,X
               AND   #$00FF
               STA   SCRIPVAA         ; 1er CHIFFRE
               LDX   VAL3
               LDA   SCRIPAFT,X
               AND   #$00FF
               STA   SCRIPVAA+1       ; 2eme CHIFFRE
               LDX   VAL2
               LDA   SCRIPAFT,X
               AND   #$00FF
               STA   SCRIPVAA+2       ; 3eme CHIFFRE
               LDX   VAL1
               LDA   SCRIPAFT,X
               AND   #$00FF
               STA   SCRIPVAA+3       ; 4eme CHIFFRE
               LDX   SCRIPAFX
               STX   SCRIPAF4+1
               LDA   SCRIPAFY
               ASL
               TAY
               LDA   SCRITEXT,Y
               CLC
SCRIPAF4       ADC   #$A0A0
               STA   SCRIPAF5+1       ; ADRESSE
               INC
               INC
               STA   SCRIPAF6+1
               LDA   SCRIPVAA         ; 2 PREMIER CHIFFRES
SCRIPAF5       STAL  $00A0A0
               LDA   SCRIPVAA+2
SCRIPAF6       STAL  $00A0A0          ; 2 DERNIER CHIFFRES
               LDA   SCRIPAF5+1
               DEC                    ; NETTOYAGE BORDURE
               DEC
               STA   SCRIPAF7+1
               CLC
               ADC   #$0006
               STA   SCRIPAF8+1
               LDA   #$A0A0           ; SPACE
SCRIPAF7       STAL  $00A0A0
SCRIPAF8       STAL  $00A0A0
               PLX
               RTS

SCRIPIN        LDA   #SCRIPTE2        ; AFFICHAGE DU CADRE
               LDX   #$0000
               JSR   SCRIPLI          ; SCRIPT EDITOR
               LDA   #SCRIPTE3
               LDX   #$0004
               JSR   SCRIPLI          ; FOR ADVANCED USERS ONLY
               LDA   #SCRIPTE4
               LDX   #$0008
               JSR   SCRIPLI          ; DEFAULT VALUES  DIFF FREQ
               LDA   #SCRIPTE1
               LDX   #$0024
               JSR   SCRIPLI          ; BANDE INVERSE
               LDA   #$A020
               STAL  $0005D0
               LDA   #$20A0
               STAL  $0005F6          ; BORDURES
               LDA   #SCRIPTE5
               LDX   #$0028
               JSR   SCRIPLI          ; UP/DOWN...
               LDA   #SCRIPTE6
               LDX   #$002A
               JSR   SCRIPLI          ; TO MOVE...
               LDA   #$A020
               STAL  $000750
               LDA   #$20A0
               STAL  $000776          ; BORDURES
               LDA   #SCRIPTE1
               LDX   #$002E
               JSR   SCRIPLI          ; BANDE INVERSE
               LDA   SCRIPMOD
               CMP   #$0001
               BEQ   SCRIPIN2
               CMP   #$0002
               BEQ   SCRIPIN1
               LDA   #$3233           ; 3200
               STAL  $000692
               LDA   #$3030
               STAL  $000694
               RTS
SCRIPIN2       LDA   #$3532           ; 256
               STAL  $000692
               LDA   #$A036
               STAL  $000694
               RTS
SCRIPIN1       LDA   #$3631           ; 16
               STAL  $000693
               RTS

SCRIPLI        STA   SCRIPLI1+1       ; ADRESSE TEXTE
               LDA   SCRITEXT,X
               STA   SCRIPLI2+1       ; ADRESSE ECRAN
               LDX   #$0026
SCRIPLI1       LDA   $A0A0,X
SCRIPLI2       STAL  $00A0A0,X
               DEX
               DEX
               BPL   SCRIPLI1
               RTS

SCRIPCLN       LDY   #$002E           ; NETTOYAGE ECRAN 24 LIGNES
SCRIPCLN1      LDA   SCRITEXT,Y
               STA   SCRIPCLN2+1
               LDX   #$0024
               LDA   #$A0A0           ; NETTOY 1 LIGNE
SCRIPCLN2      STAL  $00A0A0,X
               DEX
               DEX
               BPL   SCRIPCLN2
               DEY
               DEY
               BPL   SCRIPCLN1
               RTS

SCRIPMOD       HEX   0000             ; 0:3200, 1:256, 2:16

SCRIPAFX       HEX   0000             ; COORDONNEES X
SCRIPAFY       HEX   0000             ; COORDONNEES Y
SCRIPAFT       HEX   B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,D3,D4,CF,D0,AD,C5  ; 0123456789STOP-E
SCRIPVAA       HEX   00,00,00,00,00

SCRICOR1       HEX   0000             ; 0=DIFF, 1=FREQ
SCRICOR2       HEX   0000             ; 0-11 (12 POSSIBILITES)
SCRICOR3       HEX   0000             ; 0: HAUT, 1:BAS
SCRVALEU       HEX   0000             ; VALEUR DE L'INVERSE

SCRIPVA9       HEX   0100,0200,0300,0400,0500,0600,0700,0800,0900,0A00,0B00,0C00  ; DIFF DEFAULT 3200
               HEX   0C00,0B00,0A00,0900,0800,0700,0600,0500,0400,0300,0200,0100
SCRIPVA10      HEX   00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF  ; FREQ DEFAULT 3200
               HEX   0C00,0B00,0A00,0900,0800,0700,0600,0500,0400,0300,0200,0100

SCRIPVA7       HEX   0100,0200,0300,0400,0500,0600,0700,0800,0900,0A00,0B00,0C00  ; DIFF DEFAULT 256
               HEX   0C00,0B00,0A00,0900,0800,0700,0600,0500,0400,0300,0200,0100
SCRIPVA8       HEX   00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF  ; FREQ DEFAULT 256
               HEX   0C00,0B00,0A00,0900,0800,0700,0600,0500,0400,0300,0200,0100

SCRIPVA1       HEX   0100,0200,0300,0400,0500,0600,0700,0800,0900,0A00,0B00,0C00  ; DIFF DEFAULT 16
               HEX   0C00,0B00,0A00,0900,0800,0700,0600,0500,0400,0300,0200,0100
SCRIPVA2       HEX   00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF,00FF  ; FREQ DEFAULT 16
               HEX   0C00,0B00,0A00,0900,0800,0700,0600,0500,0400,0300,0200,0100

SCRIPVA3       HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000  ; DIFF COURANT
SCRIPVA4       HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000  ; FREQ COURANT

SCRIPVA5       HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000  ; DIFF
               HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000
SCRIPVA6       HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000  ; FREQ
               HEX   0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000

SCRIPTE1       HEX   20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20
               HEX   20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20
SCRIPTE2       HEX   A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,13,03,12,09,10,14,20
               HEX   20,05,04,09,14,0F,12,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0,A0
SCRIPTE3       HEX   A0,A0,A0,A0,A0,A0,A0,A0,C6,CF,D2,A0,C1,C4,D6,C1,CE,C3,C5,C4
               HEX   A0,D5,D3,C5,D2,D3,A0,CF,CE,CC,D9,A0,A0,A0,A0,A0,A0,A0,A0,A0
SCRIPTE4       HEX   A0,A0,C4,C5,C6,C1,D5,CC,D4,A0,D6,C1,CC,D5,C5,D3,A0,A0,A0,A0
               HEX   A0,A0,A0,A0,A0,A0,C4,C9,C6,C6,A0,A0,C6,D2,C5,D1,A0,A0,A0,A0
SCRIPTE5       HEX   20,A0,15,10,AF,04,0F,17,0E,A0,2D,3E,AF,3C,2D,A0,A0,39,AC,2B  ; UP...
               HEX   AF,2D,AC,36,A0,A0,A0,14,01,02,A0,A0,A0,05,13,03,A0,A0,A0,20
SCRIPTE6       HEX   20,A0,A0,A0,A0,D4,CF,A0,CD,CF,D6,C5,A0,A0,A0,A0,D4,CF,A0,CD  ; TO...
               HEX   CF,C4,C9,C6,D9,A0,CE,C5,D8,D4,A0,D4,CF,A0,C5,D8,C9,D4,A0,20

SCRITEXT       HEX   0004,8004,0005,8005,0006,8006,0007,8007,2804,A804,2805,A805
               HEX   2806,A806,2807,A807,5004,D004,5005,D005,5006,D006,5007,D007

SCRICOV        LDA   VALH             ; CONVERSION HEXA EN DECIMAL
               CMP   #$FF00
               BEQ   SCRICOV7         ; ----
               LDX   #$0000
SCRICOV0       CMP   #$03E8           ; 1000
               BMI   SCRICOV1
               SEC
               SBC   #$03E8
               STA   VALH
               INX
               BRA   SCRICOV0
SCRICOV1       STX   VAL4
               LDX   #$0000
               LDA   VALH             ; VALEUR EN HEXA
SCRICOV2       CMP   #$0064           ; 100
               BMI   SCRICOV3
               SEC
               SBC   #$0064
               STA   VALH
               INX
               BRA   SCRICOV2
SCRICOV3       STX   VAL3             ; CENTAINE
               LDX   #$0000
               LDA   VALH             ; VALEUR EN HEXA
SCRICOV4       CMP   #$000A           ; 10
               BMI   SCRICOV5
               SEC
               SBC   #$000A           ; 10
               STA   VALH
               INX
               BRA   SCRICOV4
SCRICOV5       STX   VAL2             ; DIZAINE
               STA   VAL1             ; UNITES
               RTS
SCRICOV7       LDA   #$000E           ; MAX DETECTE : ----
               STA   VAL1
               STA   VAL2
               STA   VAL3
               STA   VAL4
               RTS

******************  TRUE COLOR VISION  **********************

TRUE           LDA   #$0000
               LDX   #$7FFE
TRUE1          STAL  $012000,X        ; EFFACE L'ECRAN
               DEX
               DEX
               BPL   TRUE1
               LDX   #$0000           ; MISE EN PLACE DES SCB
TRUE2          LDA   #$0201           ; PALETTE 0 : FULL BLACK
               STAL  $019D00,X        ; PALETTE 1 : FULL ROUGE
               INX
               INX
               LDA   #$0003           ; PALETTE 2 : FULL VERT
               STAL  $019D00,X        ; PALETTE 3 : FULL BLEU
               INX
               INX
               CPX   #$00C8           ; 200
               BNE   TRUE2
               LDX   #$001E           ; PALETTE ROUGE
               LDA   #$0F00
TRUE3          STAL  $019E20,X
               SEC
               SBC   #$0100
               DEX
               DEX
               BPL   TRUE3
               LDX   #$001E           ; PALETTE VERTE
               LDA   #$00F0
TRUE4          STAL  $019E40,X
               SEC
               SBC   #$0010
               DEX
               DEX
               BPL   TRUE4
               LDX   #$001E           ; PALETTE BLEU
               LDA   #$000F
TRUE5          STAL  $019E60,X
               DEC
               DEX
               DEX
               BPL   TRUE5

****  LECTURE SOURIS

               STZ   TRUELIG          ; INIT
               STZ   TRUECOL
               JMP   TRUE11           ; 1er AFFICHAGE

TRUE12         JSR   SLECTA           ; LECTURE SOURIS POUR LE DEPLACEMENT DE L'IMAGE
               LDA   BOUT             ; BOUTON ENFONCE ?
               BNE   TRUE13
               BRA   TRUE15

TRUE13         LDAL  $00C026          ; ATTEND QUE LE BOUTON SOIT RELACHE
               BPL   TRUE13
               AND   #$0100
               BEQ   TRUE14
               LDAL  $00C024
               BRA   TRUE13
TRUE14         LDAL  $00C023
               LDAL  $00C023
               BPL   TRUE13
               STZ   BOUT
               STAL  $00C010          ; ANNULE D'EVENTUELLE FRAPPE
               RTS                    ; ON SORT
****

TRUE15         LDA   NEX              ; DELTA X <-> COLONNE
               BNE   TRUE17           ; DEL X < 0
               LDA   TRUECOL          ; DELTA X > 0
               SEC
               SBC   DELX+1
               BCS   TRUE16           ; DELX < SELAFFIC
               LDA   #$0000
TRUE16         STA   TRUECOL
               BRA   TRUE19
TRUE17         LDA   TRUECOL          ; DELTA X < 0
               CLC
               ADC   DELX+1
               CMP   #$00F1           ; 320-80 : VALEUR MAXIMALE JAMAIS ATTEINTE DE COLONNE...
               BMI   TRUE18
               LDA   #$00F1
               DEC
TRUE18         STA   TRUECOL

TRUE19         LDA   NEY              ; DELTA Y <-> LIGNE
               BNE   TRUE21           ; DEL Y < 0
               LDA   TRUELIG          ; DELTA Y > 0
               SEC
               SBC   DELY+1
               BCS   TRUE20           ; DELY < SELAFFIL
               LDA   #$0000
TRUE20         BRA   TRUE22
TRUE21         LDA   TRUELIG          ; DELTA Y < 0
               CLC
               ADC   DELY+1
               CMP   #$0097           ; 200-50 VALEUR MAXIMALE JAMAIS ATTEINTE DE LIGNE...
               BMI   TRUE22
               LDA   #$0097
               DEC
TRUE22         STA   TRUELIG

               BRA   TRUE11           ; AFFICHAGE

TRUECOL        HEX   0000             ; COLONNE AFFICHEE (0-319)
TRUELIG        HEX   0000             ; LIGNE AFFICHEE (0-199)

****  AFFICHAGE

TRUE11         LDA   TRUELIG
               ASL                    ; *320
               TAX
               LDA   TABLE,X          ; *160
               ASL                    ; *320
               CLC
               ADC   TRUECOL
               STA   TRUE7+1
               STZ   TRUEICO          ; COLONNE
               STZ   TRUEILI          ; LIGNE
               STZ   TRUEIEC          ; ADRESSE ECRAN

TRUE6          LDX   TRUEICO
TRUE7          LDAL  $20A0A0,X        ; POINTS
               INX
               CPX   #$0051           ; 80 POINTS EN LARGEUR
               BNE   TRUE9

               LDA   TRUE7+1          ; CHANGEMENT DE LIGNE
               CLC
               ADC   #$0140
               STA   TRUE7+1
               STZ   TRUEICO          ; COLONNE
               LDA   TRUEIEC
               CLC
               ADC   #$01E0           ; 4 LIGNES EN PLUS
               STA   TRUEIEC          ; ADRESSE ECRAN
               LDA   TRUEILI          ; NB DE LIGNES TRAITEE
               INC
               CMP   #$0032           ; 50 LIGNES DE 4 PIXELS DE HAUT
               BEQ   TRUE8
               STA   TRUEILI
               BRA   TRUE6            ; ON RECOMMENCE
TRUE8          JMP   TRUE12           ; FIN ON SORT

TRUE9          STX   TRUEICO
               LDX   TRUEIEC          ; X ADRESSE ECRAN
               AND   #$00FF
               ASL
               TAY

               LDA   STATCOL2,Y       ; VALEUR RVB POUR 1 POINT
               PHA                    ; 0RVB
               AND   #$0F00           ; ROUGE
               XBA
               ASL                    ; $000F
               TAY
               LDA   TRUETAB,Y
               STAL  $012000,X        ; ROUGE
               PLA
               PHA
               LSR
               LSR
               LSR
               LSR
               AND   #$000F           ; VERT
               ASL
               TAY
               LDA   TRUETAB,Y
               STAL  $0120A0,X        ; VERT
               PLA
               AND   #$000F           ; BLEU
               ASL
               TAY
               LDA   TRUETAB,Y
               STAL  $012140,X        ; BLEU

               INX
               INX
               STX   TRUEIEC          ; ADRESSE ECRAN
               BRA   TRUE6            ; ON REMONTE

TRUEICO        HEX   0000             ; COLONNE BALAYEE
TRUEILI        HEX   0000             ; LIGNE BALAYEE
TRUEIEC        HEX   0000             ; ADRESSE ECRAN
TRUETAB        HEX   0000,1111,2222,3333,4444,5555,6666,7777,8888,9999,AAAA,BBBB,CCCC,DDDD,EEEE,FFFF

*****************  ECRAN ABOUT  *********************

ABOUT          LDA   #$EA60           ; INIT : BUFFER EN 08/A000
               STA   ABOUTADR

ABOUT00        LDY   #$0000
ABOUTS0        LDA   ABOUTMES,Y
               AND   #$00FF
               BEQ   ABOUT00          ; 00 : ON RECOMMENCE AU DEBUT
               CMP   #$0001
               BEQ   ABOUTTRA         ; 01 : LIGNE FINIT
               CMP   #$0002
               BEQ   ABOUTPAU         ; 02 : PAUSE
               STA   ABOUTS2+1
               PHY                    ; SAUVEGARDE

               LDY   #$0032           ; 51 CARACTERES
ABOUTS1        LDA   ABOUTALP,Y
               AND   #$00FF
ABOUTS2        CMP   #$0000
               BEQ   ABOUTS3
               DEY
               BPL   ABOUTS1
               LDY   #$0025           ; PAS TROUVE, ON PREND LE FULL
ABOUTS3        TYA
               ASL
               TAY
               LDA   ABOUTAB,Y        ; ADRESSE LETTRE
               STA   ABOUTR1+1
               CLC
               ADC   #$000A
               STA   ABOUTR3+1
               JSR   ABOUTR0          ; AFFICHE LE CARACTERE
               PLY
               INY
               BRA   ABOUTS0          ; ON CONTINUE

ABOUTPAU       JSR   ABOUTMOU         ; CLICK ?
               LDAL  $00BFFF
               BPL   ABOUTPAU
               STAL  $00C010
               LDA   #$EA60
               STA   ABOUTADR         ; ADRESSE A ZERO
               STZ   ABOUTLIG         ; LIGNE A ZERO
               INY
               BRA   ABOUTS0          ; CARACTERE SUIVANT

ABOUTTRA       PHY
               JSR   ABOUTSV          ; SCROLL VERTICAL DE L'ECRAN
               JSR   ABOUTRC          ; RECOPIE LA LIGNE
               JSR   ABOUTWAI         ; ATTENTE
               JSR   ABOUTSV          ; SCROLL
               JSR   ABOUTRC
               JSR   ABOUTWAI
               JSR   ABOUTSV          ; SCROLL
               JSR   ABOUTRC
               JSR   ABOUTWAI
               JSR   ABOUTSV          ; SCROLL
               JSR   ABOUTRC
               JSR   ABOUTWAI
               JSR   ABOUTSV          ; SCROLL
               JSR   ABOUTRC
               JSR   ABOUTWAI
               JSR   ABOUTSV          ; SCROLL
               JSR   ABOUTRC
               JSR   ABOUTWAI
               JSR   ABOUTSV          ; SCROLL
               JSR   ABOUTRC
               JSR   ABOUTWAI

               LDA   #$EA60
               STA   ABOUTADR         ; ADRESSE A ZERO
               STZ   ABOUTLIG         ; LIGNE A ZERO
               PLY
               INY
ABOUTSTP       LDAL  $00BFFF
               BMI   ABOUTOUC
               JSR   ABOUTMOU         ; CLICK DETECTE ?
               JMP   ABOUTS0          ; CARACTERE SUIVANT

ABOUTOUC       STAL  $00C010          ; UNE TOUCHE DETECTEE : ON FAIT UNE PAUSE
ABOUTOUC1      JSR   ABOUTMOU
               LDAL  $00BFFF
               BPL   ABOUTOUC1
               STAL  $00C010
               JMP   ABOUTS0          ; CARACTERE SUIVANT

ABOUTKBD       LDAL  $00BFFF
               BPL   ABOUTKBD
               STAL  $00C010
               RTS

ABOUTMOU       LDAL  $00C026          ; DETECTION DU CLICK POUR SORTIR
               BMI   ABOUTMOU1
               RTS                    ; PAS ENCORE PRETE
ABOUTMOU1      AND   #$0200
               BEQ   ABOUTMOU2
               LDAL  $00C024
               RTS
ABOUTMOU2      LDAL  $00C023
               LDAL  $00C023
               BPL   ABOUTMOU3
               RTS                    ; PAS ENFONCE
ABOUTMOU3      PLA                    ; RECUPERE L'ADRESSE DU JSR
               STZ   ABOUTLIG         ; INIT ...
               LDA   #$0007
               JMP   PICT00           ; RETOUR A L'ECRAN OPTION : ON SORT

ABOUTWAI       LDA   BTEMPO           ;
               LSR
               LSR
               LSR
               TAX
ABOUTWA1       NOP
               JSR   ABOUTMOU         ; SOURIS ?
               NOP
               DEX
               BPL   ABOUTWA1
               RTS

**********  AFFICHAGE CARACTERE  ***************

ABOUTR0        LDA   ABOUTADR         ; ADRESSE ECRAN
               STA   ABOUTR2+1
               INC
               INC
               STA   ABOUTR4+1
               INC
               STA   ABOUTADR
               LDX   #$0000           ; 1 ere COLONNE
ABOUTR1        LDA   $AAAA,X
ABOUTR2        STAL  $08EA60          ; BUFFER DE ABOUT EN 08/EA60
               LDA   ABOUTR2+1
               CLC
               ADC   #$00A0
               STA   ABOUTR2+1        ; LIGNE SUIVANTE
               INX
               INX
               CPX   #$000A
               BNE   ABOUTR1
               LDX   #$0000           ; 2 eme COLONNE
ABOUTR3        LDA   $AAAA,X
ABOUTR4        STAL  $08EA60
               LDA   ABOUTR4+1
               CLC
               ADC   #$00A0
               STA   ABOUTR4+1        ; LIGNE SUIVANTE
               INX
               INX
               CPX   #$000A
               BNE   ABOUTR3
               RTS

ABOUTADR       HEX   60EA             ; ADRESSE ECRAN BUFFER

**********  SCROLL VERTICAL  *******************

ABOUTSV        LDX   #$6DBD           ; ADRESSE BASSE SOURCE
               LDY   #$6D1D           ; ADRESSE BASSE DESTINATION

ABOUTSV1       PHX
               LDA   #$0056           ; NB D'OCTETS A DEPLACER-1
               MVN   $010000,$010000  ; ADRESSE SOURCE, ADRESSE DESTINATION
               PHK
               PLB                    ; RESTAURE, PERTURBE PAR LE MVN

               PLY                    ; LIGNE SUIVANTE SOURCE
               TYA                    ; LIGNE SUIVANTE DESTINATION
               CLC
               ADC   #$00A0
               TAX
               CPX   #$947D           ; CONDITION D'ARRET
               BNE   ABOUTSV1
               RTS

**********  RECOPIE DE LA BONNE LIGNE  *********

ABOUTRC        LDA   ABOUTLIG
               ASL                    ; ADRESSE SOURCE
               TAX
               LDA   ABOUTLIT,X
               TAX

               LDY   #$93DD           ;
               LDA   #$0056
ABOUTRC1       MVN   $080000,$010000
               PHK
               PLB
               INC   ABOUTLIG
               RTS

ABOUTLIG       HEX   0000
ABOUTLIT       HEX   60EA,00EB,A0EB,40EC,E0EC,80ED,20EE,C0EE

**********  DATA SCROLL  ***********************

ABOUTMES       ASC   "***  ***  *  * ***  **  *    ",01
               ASC   "*  * *  * *  *  *  *  * *    ",01
               ASC   "***  ***  *  *  *  **** *    ",01
               ASC   "*  * * *  *  *  *  *  * *    ",01
               ASC   "***  *  *  **   *  *  * **** ",01
               ASC   "                             ",01
               ASC   "***  **** *    *  * * * **** ",01
               ASC   "*  * *    *    *  * * * *    ",01
               ASC   "*  * ***  *    *  *  *  ***  ",01
               ASC   "*  * *    *    *  * * * *    ",01
               ASC   "***  **** ****  **  * * **** ",01
               ASC   "                             ",01
               HEX   01
               ASC   "      PROUDLY PRESENTS       ",01
               ASC   "                             ",01
               HEX   01
               ASC   "        CONVERT 3200         ",01
               ASC   "                             ",01
               HEX   01
               ASC   "THE SPEEDY GONZALES CONVERTER",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " PROGRAMMERS :               ",01
               ASC   "                             ",01
               ASC   "       ANTOINE VIGNAU        ",01
               ASC   "                             ",01
               ASC   "       OLIVIER ZARDINI       ",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " CONVERSION SCRIPT :         ",01
               ASC   "                             ",01
               ASC   "      SEBASTIEN INIESTA      ",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " SPECIAL THANKS TO :         ",01
               ASC   "                             ",01
               ASC   "        DANIEL CAUNES        ",01
               ASC   "      CYRILLE  FONTAINE      ",01
               ASC   "   JEAN-CHRISTOPHE  LEDUCQ   ",01
               ASC   "       THIERRY MECHAIN       ",01
               ASC   "      JEAN-MARIE ULMANN      ",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " BETA TESTERS :              ",01
               ASC   "                             ",01
               ASC   "      JEAN-MARC BOUILLY      ",01
               ASC   "      JEAN-ALBERT CANAL      ",01
               ASC   "        MARC FLEURIET        ",01
               ASC   "     JEAN-PIERRE GOURNAY     ",01
               ASC   "          TONY JOYE          ",01
               ASC   "          JOE  KOHN          ",01
               ASC   "      PHILIPPE  LECLERQ      ",01
               ASC   "         ALAIN MOREL         ",01
               ASC   "        GERARD ROUYER        ",01
               ASC   "                             ",01
               HEX   01,01,01,01
               ASC   " YOU CAN CONTACT US :        ",01
               ASC   "                             ",01
               ASC   "   BRUTAL DELUXE SOFTWARE    ",01
               ASC   "    11 RUE EMILE FOURCAND    ",01
               ASC   "       33000 BORDEAUX        ",01
               ASC   "           FRANCE            ",01
               ASC   "                             ",01
               ASC   "  ZARDINI@IXL.U-BORDEAUX.FR  ",01
               ASC   "                             ",01
               ASC   " (PRESS ANY KEY TO CONTINUE) ",01,02
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " THE PREVIOUS BRUTAL DELUXE'S",01
               ASC   "SOFTWARE ARE :               ",01
               ASC   "                             ",01
               ASC   "          BILLE ART          ",01
               ASC   "         THE TINIES          ",01
               ASC   "         OPALE DEMO          ",01
               ASC   "           COGITO            ",01
               ASC   "          BLOCKADE           ",01
               ASC   "    PICVIEWER, CONVERT2DG    ",01
               ASC   "   TINIES CONSTRUCTION KIT   ",01
               ASC   "                             ",01
               HEX   01
               ASC   " THEY ARE FREELY AVAILABLE ON",01
               ASC   "FTP SITES OR IN JOE KOHN'S   ",01
               ASC   "SHAREWARE LIBRARY.           ",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " SPECIAL HELLO TO :          ",01
               ASC   "                             ",01
               ASC   "    JESSE BLUE  AND  CLUE    ",01
               ASC   "                             ",01
               ASC   "            FROM             ",01
               ASC   "                             ",01
               ASC   "          NINJAFORCE         ",01
               ASC   "                             ",01
               HEX   01
               ASC   "NICE WEEK AT OLIVIER'S HOME..",01
               ASC   " NEXT YEAR IN GERMANY ?  :-) ",01
               ASC   "                             ",01
               HEX   01
               ASC   "  CRAZY NIGHT WITH SPK, DIZZY",01
               ASC   "AND MOBBY, WITH MOBBY MOBILE.",01
               ASC   "                             ",01
               HEX   01
               ASC   "  PIZZA, COCA COLA, ATARI ST,",01
               ASC   "AMIGA AND ... APPLE IIGS.    ",01
               ASC   "                             ",01
               HEX   01
               ASC   "  THANK YOU FOR THE 30 MB OF ",01
               ASC   "SOFTWARE AND FOR THE 'STAMP' ",01
               ASC   "PLASMA ROUTINE... :-)        ",01
               ASC   "                             ",01
               HEX   01
               ASC   "  WE ARE WAITING FOR YOUR NEW",01
               ASC   "SOFTWARE... FIRE AND FORGET..",01
               ASC   "                             ",01
               HEX   01
               ASC   "  ANOTHER MERGUEZ SANDWICH ? ",01
               ASC   " (SORRY, STUPID PRIVATE JOKE)",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   " HELLO TO :                  ",01
               ASC   "                             ",01
               ASC   "       RUSSELL NIELSON       ",01
               ASC   "                             ",01
               HEX   01
               ASC   "THANK YOU VERY MUCH FOR THE  ",01
               ASC   "DISKS FULL OF SOUNDSMITH 1.0 ",01
               ASC   "MUSIC FILES.                 ",01
               ASC   "                             ",01
               ASC   "  CONVERT 3200 WASN'T THE    ",01
               ASC   "PERFECT KIND OF SOFTWARE TO  ",01
               ASC   "USE YOUR MUSICS... BUT WE    ",01
               ASC   "HOPE TO PUT THEM IN OUR NEXT ",01
               ASC   "GAMES...                     ",01
               ASC   "                             ",01
               HEX   01,01,01

               ASC   "                             ",01
               ASC   "IF YOU WANT TO EXIT FROM THIS",01
               ASC   "WONDERFUL SCROLLING TEXT,    ",01
               ASC   "CLICK ON THE MOUSE...        ",01
               ASC   "                             ",01
               HEX   01,01,01
               ASC   "                             ",01

               ASC   "                             ",01
               ASC   "                             ",01
               ASC   "               3             ",01
               ASC   "                             ",01
               ASC   "               2             ",01
               ASC   "                             ",01
               ASC   "               1             ",01
               ASC   "                             ",01
               ASC   "              ...            ",01
               ASC   "                             ",01
               HEX   01,01,01,01,01,00


ABOUTALP       ASC   "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 =:.!,@()-'~*/?"

ABOUTAB        DA    ABOUTA,ABOUTB,ABOUTC,ABOUTD,ABOUTE,ABOUTF,ABOUTG,ABOUTH,ABOUTI
               DA    ABOUTJ,ABOUTK,ABOUTL,ABOUTM,ABOUTN,ABOUTO,ABOUTP,ABOUTQ,ABOUTR
               DA    ABOUTS,ABOUTT,ABOUTU,ABOUTV,ABOUTW,ABOUTX,ABOUTY,ABOUTZ
               DA    ABOUT0,ABOUT1,ABOUT2,ABOUT3,ABOUT4,ABOUT5,ABOUT6,ABOUT7,ABOUT8
               DA    ABOUT9,ABOUTSP,ABOUTFU,ABOUTDP,ABOUTPT,ABOUTPE,ABOUTVI,ABOUTAT
               DA    ABOUTPO,ABOUTPF,ABOUTTI,ABOUTAP,ABOUTGU,ABOUTET,ABOUTBA,ABOUTIN

ABOUTA         HEX   00DD0D000DBB0B000B00,B0000900990006000600  ; A
ABOUTB         HEX   0EDD0D000DBB0B000B99,B0000900900006006000  ; B
ABOUTC         HEX   00DD0D000D000B000099,BB000000000000006600  ; C
ABOUTD         HEX   0EDD0D000D000B000B99,B0000900090006006000  ; D
ABOUTE         HEX   0EDD0D000DBB0B000B99,BB000000900000006600  ; E
ABOUTF         HEX   0EDD0D000DBB0B000B00,BB000000900000000000  ; F
ABOUTG         HEX   00DD0D000D0B0B000099,BB000000990006006000  ; G
ABOUTH         HEX   0E000D000DBB0B000B00,0B000900990006000600  ; H
ABOUTI         HEX   0EDD000B000B00090B99,BB000000000000006600  ; I
ABOUTJ         HEX   00DD000000000B000099,BB00B000900090000000  ; J
ABOUTK         HEX   0E000D000DBB0B000B00,0B00B000000090000600  ; K
ABOUTL         HEX   0E000D000D000B000B99,00000000000000006600  ; L
ABOUTM         HEX   0E000DD00D0B0B000B00,0B00B900090006000600  ; M
ABOUTN         HEX   0E000DD00D0B0B000B00,0B000900090096000600  ; N
ABOUTO         HEX   00DD0D000D000B000099,B0000900090006006000  ; O
ABOUTP         HEX   0EDD0D000DBB0B000900,B0000900900000000000  ; P
ABOUTQ         HEX   00DD0D000D000B000099,B0000900090090000600  ; Q
ABOUTR         HEX   0EDD0D000DBB0B000B00,B0000900900090000600  ; R
ABOUTS         HEX   00DD0D0000BB00000B99,BB000000900006006000  ; S
ABOUTT         HEX   0EDD000B000B00090009,BB000000000000000000  ; T
ABOUTU         HEX   0E000D000D000B000099,0B000900090006006000  ; U
ABOUTV         HEX   0E000D0000B000B00009,0B000900900090000000  ; V
ABOUTW         HEX   0E000D000D0B0BB00B00,0B000900090096000600  ; W
ABOUTX         HEX   0E0000D0000B00B00B00,0B00B000000090000600  ; X
ABOUTY         HEX   0E000D0000BB00090009,0B000900900000000000  ; Y
ABOUTZ         HEX   0EDD0000000B00B00B99,BB00B000000000006600  ; Z
ABOUT0         HEX   00DD0D000D0B0BB00099,B000B900090006006000  ; 0
ABOUT1         HEX   000D00DB000B00090B99,00000000000000006600  ; 1
ABOUT2         HEX   0EDD000000BB0B000B99,B0000900900000006600  ; 2
ABOUT3         HEX   0EDD00000DBB00000B99,B0000900900006006000  ; 3
ABOUT4         HEX   0E000D000DBB00000000,0B000900990006000600  ; 4
ABOUT5         HEX   0EDD0D000DBB00000B99,BB000000900006006000  ; 5
ABOUT6         HEX   00DD0D000DBB0B000099,BB000000900006006000  ; 6
ABOUT7         HEX   0EDD0000000000090009,BB000900900000000000  ; 7
ABOUT8         HEX   00DD0D0000BB0B000099,B0000900900006006000  ; 8
ABOUT9         HEX   00DD0D0000BB00000B99,B0000900990006006000  ; 9
ABOUTSP        HEX   00000000000000000000,00000000000000000000  ; SPACE
ABOUTFU        HEX   0EDD0DDB0DBB0BB90B99,BB00B900990096006600  ; FULL
ABOUTDP        HEX   0000000B000000090000,00000000000000000000  ; :
ABOUTPT        HEX   00000000000000000009,00000000000000000000  ; .
ABOUTPE        HEX   000D000B000B00000009,00000000000000000000  ; !
ABOUTVI        HEX   00000000000000090090,00000000000000000000  ; ,
ABOUTAT        HEX   00DD0D00000B00B00009,B0000900990006006600  ; @
ABOUTPO        HEX   000D00D000B000B00009,00000000000000000000  ; (
ABOUTPF        HEX   000D0000000000000009,0000B000900090000000  ; )
ABOUTTI        HEX   0000000000BB00000000,00000000900000000000  ; -
ABOUTAP        HEX   000D000B000000000000,00000000000000000000  ; '
ABOUTGU        HEX   00D000D0000000000000,B000B000000000000000  ; "
ABOUTET        HEX   0E0D00DB0DBB00B90B09,0B00B000990090000600  ; *
ABOUTBA        HEX   00000000000B00B00B00,0B00B000000000000000  ; /
ABOUTIN        HEX   00DD0D00000B00000009,B0000900900000000000  ; ?

