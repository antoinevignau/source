
            LST   OFF         ; NBCL

ECR1200     LDX   SECR2+1     ; NBCL : UP
            LDA   #ECR12000
            STA   BOMPER5+1
            JMP   BOMPER
ECR12000    JSR   ECR12001
            JMP   SOURIS      ;
ECR12001    LDA   NBCLLI
            CMP   #$0001      ; 200
            BNE   ECR12002
            LDA   #$00C8      ; ON PASSE DE 1 A 200
ECR12002    DEC
            STA   NBCLLI
            JSR   ECR12003    ; AFFICHAGE NUM LIGNE ET TRAIT
            RTS

ECR1201     LDX   SECR2+1     ; NBCL : DOWN
            LDA   #ECR12010
            STA   BOMPER5+1
            JMP   BOMPER
ECR12010    JSR   ECR12012
            JMP   SOURIS
ECR12012    LDA   NBCLLI
            CMP   #$00C8
            BNE   ECR12011
            LDA   #$0001      ; ON PASSE DE 200 A 1
ECR12011    INC
            STA   NBCLLI
            JSR   ECR12003    ; AFFICHAGE NUM LIGNE ET TRAIT
            RTS

ECR1202     LDX   SECR2+1     ; NBCL : CONVERT LINE
            LDA   #ECR12020
            STA   BUMPER5+1
            JMP   BUMPER
ECR12020    LDA   NBCLLI      ; IMAGE LINE
            STA   NUMLINE
            LDA   #$0009
            JMP   PICT

ECR1203     LDX   SECR2+1     ; NBCL : EXIT
            LDA   #ECR12030
            STA   BUMPER5+1
            JMP   BUMPER
ECR12030    LDA   #$0006      ; IMAGE STAT
            JMP   PICT

ECR1204     LDA   #ECR12040   ; NBCL : SURFACE DE SELECTION LIGNE
            STA   SURFACE5+1
            JMP   SURFACE
ECR12040    LDA   POSY
            INC
            CMP   NBCLLI
            BEQ   ECR12041
            STA   NBCLLI
            JSR   ECR12003    ; AFFICHAGE
ECR12041    JMP   SOURIS

***************

ECR12003    LDA   NBCLLI      ; AFFICHAGE NUMERO DE LIGNE ET TRAIT HORI
            STA   VALH
            LDA   #$370F
            STA   ADRE
            JSR   TRANS       ; NUM DE LIGNE
            LDX   #$00C6      ; AFFICHAGE DE LA LIGNE EN SUR IMPRESSION
            LDA   #$0000
ECR12004    STAL  $019D00,X   ; MISE A ZERO DES SCB
            DEX
            DEX
            BPL   ECR12004
            LDX   NBCLLI      ; MISE A UN DU SCB DE LA LIGNE
            DEX
            LDA   #$0001
            STAL  $019D00,X
ECR12005    LDA   NBCLLI
            DEC
            TAX
            LDA   NBCLTAB,X   ; NB COUL/LIGNE
            AND   #$00FF
            BNE   ECR120050
            LDA   #$0100      ; 0=256
ECR120050   STA   NBCLVAL
            STA   VALH
            LDA   #$50AF
            STA   ADRE
            JSR   TRANS
            RTS

ECR12006    LDX   #$018E      ; AFFICHAGE DU SPECTRE
ECR12007    PHX
            LDA   #$55A9
            STA   E5          ; PAIRE
            LDA   #$50A9
            STA   E1          ; IMPAIRE
            LDA   TABLE,X
            STA   E3+1        ; ADRESSE DEBUT DE LIGNE
            TAY
            TXA
            LSR               ; X/2
            TAX
            LDA   NBCLTAB,X   ; NB DE COULEUR SUR LA LIGNE
            AND   #$00FF
            BNE   ECR120070
            LDA   #$0100      ; 0=256
ECR120070   STA   E4+1
            CMP   #$0011      ; 17
            BMI   ECR12008
            LDA   E3+1
            CLC
            ADC   #$0008
            STA   E3+1
            LDA   E4+1
            SEC
            SBC   #$0010
            STA   E4+1
            LDA   #$11A9
            STA   E5          ; PAIRE
            LDA   #$10A9
            STA   E1          ; IMPAIRE
            TYX
            LDA   #$5555
            STAL  $012000,X
            INX
            INX
            STAL  $012000,X
            INX
            INX
            STAL  $012000,X
            INX
            INX
            STAL  $012000,X
ECR12008    JSR   ECR12009    ; TRAITE LA LIGNE
            PLX
            DEX
            DEX
            BPL   ECR12007
            RTS

ECR12009    CLC
            XCE
            SEP   #$30        ; A 8 BIT
            CLC               ; X ET Y 16 BIT
            XCE
            REP   #$10
E3          LDX   #$FFFF
E4          LDY   #$FFFF
E0          DEY
            BEQ   E1          ; IMPAIRE
E5          LDA   #$22
            STAL  $012000,X
            INX
            DEY
            BEQ   E2          ; PAIRE
            BRA   E0
E1          LDA   #$20        ; C'EST LA FIN (IMPAIRE)
            STAL  $012000,X
E2          CLC               ; C'EST LA FIN (PAIRE)
            XCE
            REP   #$30        ; FULL 16 BIT
            RTS

NBCLLI      HEX   0100        ; NUMERO DE LA LIGNE EN COURS
NBCLVAL     HEX   0000        ; NB DE COULEUR SUR LA LIGNE
NBCLTAB     DS    200

****************

