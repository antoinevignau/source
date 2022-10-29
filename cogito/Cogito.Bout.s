
         LST   OFF

*********** CREATION DE L'ECRAN D'INTRODUCTION ********

CADPRES  LDA   #$0008     ; SPRITE HAUTEUR-1
         STA   CADSPR4+1
         LDA   #$0640     ; NB DE LIGNE A SAUTER POUR LE MASK
         STA   CADSPR7+1
         LDA   #$3160     ; ADRESSE SPRITE
         LDX   #$0012     ; LARGEUR (*4)
         LDY   #$75A5     ; ADRESSE ECRAN
         JSR   CADSPR     ; AFFICHE LE TEXTE : NO COLOR
         LDA   #$0001
         JSR   nowWait    ; WAIT 1 sec
         LDA   #$0007
         STA   CADSPR4+1
         LDA   #$05A0
         STA   CADSPR7+1
         LDA   #$3225
         LDX   #$0010
         LDY   #$766A
         JSR   CADSPR     ; AFFICHE LE TEXTE : NO MUSIC
         LDA   #$0001
         JSR   nowWait    ; WAIT 1 sec
         LDA   #$000A
         STA   CADSPR4+1
         LDA   #$06E0
         STA   CADSPR7+1
         LDA   #$3607
         LDX   #$0027
         LDY   #$75EE
         JSR   CADSPR     ; AFFICHE LE TEXTE : NO YOU NEEDN'T
         LDA   #$0001
         JSR   nowWait    ; WAIT 1 sec
         LDA   #$000A
         STA   CADSPR4+1
         LDA   #$06E0
         STA   CADSPR7+1
         LDA   #$5E60
         LDX   #$0048
         LDY   #$7DC8
         JSR   CADSPR     ; AFFICHE LE TEXTE : IT'S ONLY A FIGHT
         LDA   #$0003
         JSR   nowWait    ; WAIT 3 sec
         LDA   #$000C
         STA   CADSPR4+1
         LDA   #$0820
         STA   CADSPR7+1
         LDA   #$1947
         LDX   #$001B
         LDY   #$2676
         JSR   CADSPR     ; AFFICHE LE TEXTE : JEROME CRETAUX
         LDA   #$0001
         JSR   nowWait    ; WAIT 1 sec
         LDA   #$000C
         STA   CADSPR4+1
         LDA   #$0820
         STA   CADSPR7+1
         LDA   #$1981
         LDX   #$000E
         LDY   #$2E02
         JSR   CADSPR     ; AFFICHE LE TEXTE : PRESENT
         LDA   #$0001
         JSR   nowWait    ; WAIT 1 sec
         LDA   #$0007
         STA   CADSPR4+1
         LDA   #$0640
         STA   CADSPR7+1
         LDA   #$2A26
         LDX   #$002C
         LDY   #$6624
         JSR   CADSPR     ; AFFICHE LE TEXTE : THE NEURONAL CHALLENGE
         LDA   #$0002
         JSR   nowWait    ; WAIT 2 sec
         LDA   #$000C
         STA   CADSPR4+1
         LDA   #$0820
         STA   CADSPR7+1
         LDA   #$6CC0
         LDX   #$004B
         LDY   #$9305
         JSR   CADSPR     ; AFFICHE LE TEXTE : c ATREID CONCEPT
         LDA   #$0004
         JSR   nowWait    ; WAIT 4 sec
         RTS

* pha  ; Need to be frequently done
* _NTUpdateSound
* pla

***********  CREATION ECRAN EASTER EGGS  **************

CADEAEG  JSR   CADRE      ; CREATION DU CADRE
         LDA   #CADRE9    ; BOUTON OK C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$CCCC     ; PATCH BOUTON OK
         STAL  $E195D9
         LDA   #$0D0D     ; TEXTE OK
         LDX   #$0004
         LDY   #$8EEC
         JSR   CADTXT
         RTS

*********** CREATION ECRAN CONTROL PANEL **************

CADCTPN  LDA   #CADRE1    ; CREATION DES BOUTONS
         JSR   CASOMB
         LDA   #$000F     ; SPRITE COGITO HAUTEUR
         STA   CADSPR4+1
         LDA   #$0C80
         STA   CADSPR7+1
         LDA   #$1900
         LDX   #$001F
         LDY   #$2851
         JSR   CADSPR
         LDA   #CADRE2    ; BOUTON2 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0C80     ; TEXTE 2 : GAME
         LDX   #$0009
         LDY   #$39B3
         JSR   CADTXT
         LDA   #CADRE8    ; BOUTON 8 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0CFC     ; TEXTE 8 : QUIT
         LDX   #$0008
         LDY   #$80F4
         JSR   CADTXT
         LDA   #CADRE3    ; BOUTON 3 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0C93     ; TEXTE 3 : MUSIC
         LDX   #$000A
         LDY   #$4592
         JSR   CADTXT
         LDA   #CADRE7    ; BOUTON 7 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0CE5     ; TEXTE 7 : ABOUT
         LDX   #$000B
         LDY   #$7511
         JSR   CADTXT
         LDA   #CADRE4    ; BOUTON 4 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0CA8     ; TEXTE 4 : GROUND
         LDX   #$000D
         LDY   #$516F
         JSR   CADTXT
         LDA   #CADRE6    ; BOUTON 6 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0CD8     ; TEXTE 6 : DOC
         LDX   #$0006
         LDY   #$6936
         JSR   CADTXT
         LDA   #CADRE5    ; BOUTON 5 C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$0CC3     ; TEXTE 5 : LEVEL
         LDX   #$000A
         LDY   #$5D52
         JSR   CADTXT
         LDA   #CADRE9    ; BOUTON OK C
         JSR   CADRC
         JSR   CASOMB0
         LDA   #$CCCC     ; PATCH BOUTON OK
         STAL  $E195D9
         LDA   #$0D0D     ; TEXTE OK
         LDX   #$0004
         LDY   #$8EEC
         JSR   CADTXT
         RTS

************ BOUTONS CONTROL PANEL **********

CADGAMC  LDA   #CADREC2   ; BOUTON2 C
         JSR   CADRC
         LDA   #$0C80     ; TEXTE 2 : GAME
         LDX   #$0009
         LDY   #$39B3
         JSR   CADTXT
         RTS
CADGAMF  LDA   #CADREF2   ; BOUTON2 F
         JSR   CADRC
         LDA   #$0000     ; TEXTE 2 : GAME
         LDX   #$0009
         LDY   #$39B3
         JSR   CADTXT
         RTS

CADQUIC  LDA   #CADREC8   ; BOUTON 8 C
         JSR   CADRC
         LDA   #$0CFC     ; TEXTE 8 : QUIT
         LDX   #$0008
         LDY   #$80F4
         JSR   CADTXT
         RTS
CADQUIF  LDA   #CADREF8   ; BOUTON 8 F
         JSR   CADRC
         LDA   #$007C     ; TEXTE 8 : QUIT
         LDX   #$0008
         LDY   #$80F4
         JSR   CADTXT
         RTS

CADMUSC  LDA   #CADREC3   ; BOUTON 3 C
         JSR   CADRC
         LDA   #$0C93     ; TEXTE 3 : MUSIC
         LDX   #$000A
         LDY   #$4592
         JSR   CADTXT
         RTS
CADMUSF  LDA   #CADREF3   ; BOUTON 3 F
         JSR   CADRC
         LDA   #$0013     ; TEXTE 3 : MUSIC
         LDX   #$000A
         LDY   #$4592
         JSR   CADTXT
         RTS

CADABOC  LDA   #CADREC7   ; BOUTON 7 C
         JSR   CADRC
         LDA   #$0CE5     ; TEXTE 7 : ABOUT
         LDX   #$000B
         LDY   #$7511
         JSR   CADTXT
         RTS
CADABOF  LDA   #CADREF7   ; BOUTON 7 F
         JSR   CADRC
         LDA   #$0065     ; TEXTE 7 : ABOUT
         LDX   #$000B
         LDY   #$7511
         JSR   CADTXT
         RTS

CADGROC  LDA   #CADREC4   ; BOUTON 4 C
         JSR   CADRC
         LDA   #$0CA8     ; TEXTE 4 : GROUND
         LDX   #$000D
         LDY   #$516F
         JSR   CADTXT
         RTS
CADGROF  LDA   #CADREF4   ; BOUTON 4 F
         JSR   CADRC
         LDA   #$0028     ; TEXTE 4 : GROUND
         LDX   #$000D
         LDY   #$516F
         JSR   CADTXT
         RTS

CADDOCC  LDA   #CADREC6   ; BOUTON 6 C
         JSR   CADRC
         LDA   #$0CD8     ; TEXTE 6 : DOC
         LDX   #$0006
         LDY   #$6936
         JSR   CADTXT
         RTS
CADDOCF  LDA   #CADREF6   ; BOUTON 6 F
         JSR   CADRC
         LDA   #$0058     ; TEXTE 6 : DOC
         LDX   #$0006
         LDY   #$6936
         JSR   CADTXT
         RTS

CADLEVC  LDA   #CADREC5   ; BOUTON 5 C
         JSR   CADRC
         LDA   #$0CC3     ; TEXTE 5 : LEVEL
         LDX   #$000A
         LDY   #$5D52
         JSR   CADTXT
         RTS
CADLEVF  LDA   #CADREF5   ; BOUTON 5 F
         JSR   CADRC
         LDA   #$0043     ; TEXTE 5 : LEVEL
         LDX   #$000A
         LDY   #$5D52
         JSR   CADTXT
         RTS

CADOKC   LDA   #CADREC9   ; BOUTON OK C
         JSR   CADRC
         LDA   #$CCCC     ; PATCH BOUTON OK
         STAL  $E195D9
         LDA   #$0D0D     ; TEXTE OK
         LDX   #$0004
         LDY   #$8EEC
         JSR   CADTXT
         RTS
CADOKF   LDA   #CADREF9   ; BOUTON OK F
         JSR   CADRC
         LDA   #$FFFF     ; PATCH BOUTON OK
         STAL  $E195D9
         LDA   #$008D     ; TEXTE OK
         LDX   #$0004
         LDY   #$8EEC
         JSR   CADTXT
         RTS

CADRE1   HEX   5D00,0900,E200,2000,00CC,C000,0000 ; COGITO

CADRE2   HEX   1800,2500,5600,3400,00CC,C000,0100 ; GAME
CADREC2  HEX   1800,2500,5600,3400,00CC,C000,0000
CADREF2  HEX   1800,2500,5600,3400,00FF,F000,0000

CADRE3   HEX   1800,3800,5600,4700,00CC,C000,0100 ; MUSIC
CADREC3  HEX   1800,3800,5600,4700,00CC,C000,0000
CADREF3  HEX   1800,3800,5600,4700,00FF,F000,0000

CADRE4   HEX   1800,4B00,5600,5A00,00CC,C000,0100 ; GROUND
CADREC4  HEX   1800,4B00,5600,5A00,00CC,C000,0000
CADREF4  HEX   1800,4B00,5600,5A00,00FF,F000,0000

CADRE5   HEX   1800,5E00,5600,6D00,00CC,C000,0100 ; LEVEL
CADREC5  HEX   1800,5E00,5600,6D00,00CC,C000,0000
CADREF5  HEX   1800,5E00,5600,6D00,00FF,F000,0000

CADRE6   HEX   1800,7100,5600,8000,00CC,C000,0100 ; DOC
CADREC6  HEX   1800,7100,5600,8000,00CC,C000,0000
CADREF6  HEX   1800,7100,5600,8000,00FF,F000,0000

CADRE7   HEX   1800,8400,5600,9300,00CC,C000,0100 ; ABOUT
CADREC7  HEX   1800,8400,5600,9300,00CC,C000,0000
CADREF7  HEX   1800,8400,5600,9300,00FF,F000,0000

CADRE8   HEX   1800,9700,5600,A600,00CC,C000,0100 ; QUIT
CADREC8  HEX   1800,9700,5600,A600,00CC,C000,0000
CADREF8  HEX   1800,9700,5600,A600,00FF,F000,0000

CADRE9   HEX   8800,AD00,B600,BC00,00CC,C000,0100 ; OK
CADREC9  HEX   8800,AD00,B600,BC00,00CC,C000,0000
CADREF9  HEX   8800,AD00,B600,BC00,00FF,F000,0000

         asc   'The one who finishes this game is not normal!',8d
         asc   'Contact your local dealer for a brain update',8d

***************  CREATION DE L'ECRAN LOAD/SAVE  ***********

CADGAME  LDA   #CADRGAME
         JSR   CASOMB
         LDA   #$0000     ; GAME
         LDX   #$0009
         LDY   #$3BEB
         JSR   CADTXT
         LDA   #CADRGA1   ; LOAD
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGLOC
         LDA   #CADRGA3   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGOKC
         LDA   #CADRGA2   ; SAVE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGSAC
         RTS

***************  BOUTONS LOAD/SAVE GAME  *****************

CADGLOC  LDA   #CADRGAC1  ; BOUTON 1 C
         JSR   CADRC      ; TEXTE 1 : LOAD
         LDA   #$467C     ; ADRESSE SPRITE
         LDX   #$0012     ; LARGEUR
         LDY   #$51C2     ; ADRESSE ECRAN
         JSR   CADTXT
         RTS
CADGLOF  LDA   #CADRGAF1  ; BOUTON 1 F
         JSR   CADRC
         LDA   #$3DE0     ; TEXTE 1 : LOAD
         LDX   #$0012
         LDY   #$51C2
         JSR   CADTXT
         RTS

CADGSAC  LDA   #CADRGAC2  ; BOUTON 2 C
         JSR   CADRC
         LDA   #$525C     ; TEXTE 2 : SAVE
         LDX   #$0012
         LDY   #$5DA2
         JSR   CADTXT
         RTS
CADGSAF  LDA   #CADRGAF2  ; BOUTON 2 F
         JSR   CADRC
         LDA   #$49C0     ; TEXTE 2 : SAVE
         LDX   #$0012
         LDY   #$5DA2
         JSR   CADTXT
         RTS

CADGOKC  LDA   #CADRGAC3  ; BOUTON 3 C
         JSR   CADRC
         LDA   #$0D0D     ; TEXTE 3 : OK
         LDX   #$0004
         LDY   #$6FD0
         JSR   CADTXT
         RTS
CADGOKF  LDA   #CADRGAF3  ; BOUTON 3 F
         JSR   CADRC
         LDA   #$008D     ; TEXTE 3 : OK
         LDX   #$0004
         LDY   #$6FD0
         JSR   CADTXT
         RTS

CADRGAME HEX   CE00,2800,FE00,3700,0000,0000,0000 ; GAME

CADRGA1  HEX   BC00,4B00,1201,5A00,00CC,C000,0100 ; LOAD
CADRGAC1 HEX   BC00,4B00,1201,5A00,00CC,C000,0000
CADRGAF1 HEX   BC00,4B00,1201,5A00,00FF,F000,0000

CADRGA2  HEX   BC00,5E00,1201,6D00,00CC,C000,0100 ; SAVE
CADRGAC2 HEX   BC00,5E00,1201,6D00,00CC,C000,0000
CADRGAF2 HEX   BC00,5E00,1201,6D00,00FF,F000,0000

CADRGA3  HEX   D000,7B00,FE00,8A00,00CC,C000,0100 ; OK
CADRGAC3 HEX   D000,7B00,FE00,8A00,00CC,C000,0000
CADRGAF3 HEX   D000,7B00,FE00,8A00,00FF,F000,0000

*************  CREATION DE L'ECRAN MUSIC  *************

CADMUSI  LDA   #CADRMUSI
         JSR   CASOMB
         LDA   #$0013     ; MUSIC TITRE
         LDX   #$000A
         LDY   #$3BEA
         JSR   CADTXT
         LDA   MUSIFLAG   ; MUSIC
         BEQ   CADMUSI1
         LDA   #CADRMU1   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADMMUC
         BRA   CADMUSI2
CADMUSI1 LDA   #CADRMU1+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADMMUF
CADMUSI2 LDA   #CADRMU3   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADMOKC
         LDA   MUSIFLAG    ; SOUND
         BNE   CADMUSI3
         LDA   #CADRMU2   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADMSNC
         RTS
CADMUSI3 LDA   #CADRMU2+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADMSNF
         RTS

*******************  MUSIC  ********************

CADMMUC  LDA   #CADRMUC1  ; BOUTON 1 C
         JSR   CADRC      ; TEXTE 1 : MUSIC
         LDA   #$0C93     ; ADRESSE SPRITE
         LDX   #$000A     ; LARGEUR
         LDY   #$51CA     ; ADRESSE ECRAN
         JSR   CADTXT
         RTS
CADMMUF  LDA   #CADRMUF1  ; BOUTON 1 F
         JSR   CADRC
         LDA   #$0013     ; TEXTE 1 : MUSIC
         LDX   #$000A
         LDY   #$51CA
         JSR   CADTXT
         RTS

CADMSNC  LDA   #CADRMUC2  ; BOUTON 2 C
         JSR   CADRC
         LDA   #$5245     ; TEXTE 2 : SOUND
         LDX   #$000B
         LDY   #$5DA9
         JSR   CADTXT
         RTS
CADMSNF  LDA   #CADRMUF2  ; BOUTON 2 F
         JSR   CADRC
         LDA   #$45C5     ; TEXTE 2 : SOUND
         LDX   #$000B
         LDY   #$5DA9
         JSR   CADTXT
         RTS

CADMOKC  LDA   #CADRMUC3  ; BOUTON 3 C
         JSR   CADRC
         LDA   #$0D0D     ; TEXTE 3 : OK
         LDX   #$0004
         LDY   #$6FD0
         JSR   CADTXT
         RTS
CADMOKF  LDA   #CADRMUF3  ; BOUTON 3 F
         JSR   CADRC
         LDA   #$008D     ; TEXTE 3 : OK
         LDX   #$0004
         LDY   #$6FD0
         JSR   CADTXT
         RTS

CADRMUSI HEX   CC00,2800,0001,3700,0000,0000,0000 ; MUSIC CADRE SOMBRE

CADRMU1  HEX   C800,4B00,0601,5A00,00CC,C000,0100 ; MUSIC
         HEX   C800,4B00,0601,5A00,00FF,F000,0100
CADRMUC1 HEX   C800,4B00,0601,5A00,00CC,C000,0000
CADRMUF1 HEX   C800,4B00,0601,5A00,00FF,F000,0000

CADRMU2  HEX   C800,5E00,0601,6D00,00CC,C000,0100 ; SOUND
         HEX   C800,5E00,0601,6D00,00FF,F000,0100
CADRMUC2 HEX   C800,5E00,0601,6D00,00CC,C000,0000
CADRMUF2 HEX   C800,5E00,0601,6D00,00FF,F000,0000

CADRMU3  HEX   D000,7B00,FE00,8A00,00CC,C000,0100 ; OK
CADRMUC3 HEX   D000,7B00,FE00,8A00,00CC,C000,0000
CADRMUF3 HEX   D000,7B00,FE00,8A00,00FF,F000,0000

*************  CREATION DE L'ECRAN GROUND  *************

CADGROU  LDA   #CADRGROU
         JSR   CASOMB
         LDA   #$0028     ; GROUND TITRE
         LDX   #$000D
         LDY   #$3BE8
         JSR   CADTXT
         LDA   #CADRGR6   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGROKC
         LDA   GROUFLAG    ; RANDOM
         CMP   #$0004
         BNE   CADGROU1
         LDA   #CADRGR5+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRRAF
         BRA   CADGROU2
CADGROU1 LDA   #CADRGR5   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRRAC
CADGROU2 LDA   GROUFLAG    ; LUDY
         CMP   #$0001
         BNE   CADGROU3
         LDA   #CADRGR2+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRLUF
         BRA   CADGROU4
CADGROU3 LDA   #CADRGR2   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRLUC
CADGROU4 LDA   GROUFLAG   ; HAPPY
         CMP   #$0000
         BNE   CADGROU5
         LDA   #CADRGR1+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRHAF
         BRA   CADGROU6
CADGROU5 LDA   #CADRGR1   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRHAC
CADGROU6 LDA   GROUFLAG   ; XENO
         CMP   #$0003
         BNE   CADGROU7
         LDA   #CADRGR4+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRXEF
         BRA   CADGROU8
CADGROU7 LDA   #CADRGR4   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRXEC
CADGROU8 LDA   GROUFLAG   ; PLANET
         CMP   #$0002
         BNE   CADGROU9
         LDA   #CADRGR3+14 ; CLAIR
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRPLF
         RTS
CADGROU9 LDA   #CADRGR3   ; FONCE
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADGRPLC
         RTS

*******************  GROUND  ********************

CADGRHAC LDA   #CADRGRC1  ; BOUTON 1 C
         JSR   CADRC      ; TEXTE 1 : HAPPY
         LDA   #$0CAE     ; ADRESSE SPRITE
         LDX   #$000B     ; LARGEUR
         LDY   #$4B78     ; ADRESSE ECRAN
         JSR   CADTXT2
         RTS
CADGRHAF LDA   #CADRGRF1  ; BOUTON 1 F
         JSR   CADRC
         LDA   #$002E     ; TEXTE 1 : HAPPY
         LDX   #$000B
         LDY   #$4B78
         JSR   CADTXT2
         RTS

CADGRLUC LDA   #CADRGRC2  ; BOUTON 2 C
         JSR   CADRC
         LDA   #$0CC4     ; TEXTE 2 : LUDY
         LDX   #$0009
         LDY   #$4B9F
         JSR   CADTXT2
         RTS
CADGRLUF LDA   #CADRGRF2  ; BOUTON 2 F
         JSR   CADRC
         LDA   #$0044     ; TEXTE 2 : LUDY
         LDX   #$0009
         LDY   #$4B9F
         JSR   CADTXT2
         RTS

CADGRPLC LDA   #CADRGRC3  ; BOUTON 3 C
         JSR   CADRC
         LDA   #$0CD6     ; TEXTE 3 : PLANET
         LDX   #$000D
         LDY   #$5755
         JSR   CADTXT2
         RTS
CADGRPLF LDA   #CADRGRF3  ; BOUTON 3 F
         JSR   CADRC
         LDA   #$0056     ; TEXTE 3 : PLANET
         LDX   #$000D
         LDY   #$5755
         JSR   CADTXT2
         RTS

CADGRXEC LDA   #CADRGRC4  ; BOUTON 4 C
         JSR   CADRC
         LDA   #$0CF2     ; TEXTE 4 : XENO
         LDX   #$0009
         LDY   #$577F
         JSR   CADTXT2
         RTS
CADGRXEF LDA   #CADRGRF4  ; BOUTON 4 F
         JSR   CADRC
         LDA   #$0072     ; TEXTE 4 : XENO
         LDX   #$0009
         LDY   #$577F
         JSR   CADTXT2
         RTS

CADGRRAC LDA   #CADRGRC5  ; BOUTON 5 C
         JSR   CADRC
         LDA   #$0D04     ; TEXTE 5 : RANDOM
         LDX   #$000D
         LDY   #$6668
         JSR   CADTXT2
         RTS
CADGRRAF LDA   #CADRGRF5  ; BOUTON 5 F
         JSR   CADRC
         LDA   #$0084     ; TEXTE 5 : RANDOM
         LDX   #$000D
         LDY   #$6668
         JSR   CADTXT2
         RTS

CADGROKC LDA   #CADRGRC6  ; BOUTON 6 C
         JSR   CADRC
         LDA   #$0D0D     ; TEXTE 6 : OK
         LDX   #$0004
         LDY   #$7891
         JSR   CADTXT
         RTS
CADGROKF LDA   #CADRGRF6  ; BOUTON 6 F
         JSR   CADRC
         LDA   #$008D     ; TEXTE 6 : OK
         LDX   #$0004
         LDY   #$7891
         JSR   CADTXT
         RTS

CADRGROU HEX   C800,2800,0A01,3700,0000,0000,0000 ; GROUND CADRE SOMBRE

CADRGR1  HEX   A200,4100,E600,5000,00CC,C000,0100 ; HAPPY
         HEX   A200,4100,E600,5000,00FF,F000,0100
CADRGRC1 HEX   A200,4100,E600,5000,00CC,C000,0000
CADRGRF1 HEX   A200,4100,E600,5000,00FF,F000,0000

CADRGR2  HEX   EC00,4100,3001,5000,00CC,C000,0100 ; LUDY
         HEX   EC00,4100,3001,5000,00FF,F000,0100
CADRGRC2 HEX   EC00,4100,3001,5000,00CC,C000,0000
CADRGRF2 HEX   EC00,4100,3001,5000,00FF,F000,0000

CADRGR3  HEX   A200,5400,E600,6300,00CC,C000,0100 ; PLANET
         HEX   A200,5400,E600,6300,00FF,F000,0100
CADRGRC3 HEX   A200,5400,E600,6300,00CC,C000,0000
CADRGRF3 HEX   A200,5400,E600,6300,00FF,F000,0000

CADRGR4  HEX   EC00,5400,3001,6300,00CC,C000,0100 ; XENO
         HEX   EC00,5400,3001,6300,00FF,F000,0100
CADRGRC4 HEX   EC00,5400,3001,6300,00CC,C000,0000
CADRGRF4 HEX   EC00,5400,3001,6300,00FF,F000,0000

CADRGR5  HEX   C800,6C00,0A01,7B00,00CC,C000,0100 ; RANDOM
         HEX   C800,6C00,0A01,7B00,00FF,F000,0100
CADRGRC5 HEX   C800,6C00,0A01,7B00,00CC,C000,0000
CADRGRF5 HEX   C800,6C00,0A01,7B00,00FF,F000,0000

CADRGR6  HEX   D200,8900,0001,9800,00CC,C000,0100 ; OK
CADRGRC6 HEX   D200,8900,0001,9800,00CC,C000,0000
CADRGRF6 HEX   D200,8900,0001,9800,00FF,F000,0000

*************  CREATION DE L'ECRAN LEVEL  *************

CADLEVE  LDA   #CADRLEVE
         JSR   CASOMB
         LDA   #$0043     ; LEVEL TITRE
         LDX   #$000A
         LDY   #$3BEB
         JSR   CADTXT
         LDA   #CADRLE5   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADLOKC
         LDA   #CADRLE4   ; >>
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADLPDC
         LDA   #CADRLE3   ; >
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADLPUC
         LDA   #CADRLE2   ; <
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADLMUC
         LDA   #CADRLE1   ; <<
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADLMDC
         RTS

         asc   'Nice place in San Francisco: O FARREL STREET THEATRE... :-)',8d

*******************  LEVEL  ********************

CADLMDC  LDA   #CADRLEC1  ; BOUTON 1 C
         JSR   CADRC      ; TEXTE 1 : <<
         LDA   #$5197     ; ADRESSE SPRITE
         LDX   #$0003     ; LARGEUR
         LDY   #$633D     ; ADRESSE ECRAN
         JSR   CADTXT9
         RTS
CADLMDF  LDA   #CADRLEF1  ; BOUTON 1 F
         JSR   CADRC
         LDA   #$4517     ; TEXTE 1 : <<
         LDX   #$0003
         LDY   #$633D
         JSR   CADTXT9
         RTS

CADLMUC  LDA   #CADRLEC2  ; BOUTON 2 C
         JSR   CADRC
         LDA   #$6B77     ; TEXTE 2 : <
         LDX   #$0002
         LDY   #$634B
         JSR   CADTXT9
         RTS
CADLMUF  LDA   #CADRLEF2  ; BOUTON 2 F
         JSR   CADRC
         LDA   #$5EF7     ; TEXTE 2 : <
         LDX   #$0002
         LDY   #$634B
         JSR   CADTXT9
         RTS

CADLPUC  LDA   #CADRLEC3  ; BOUTON 3 C
         JSR   CADRC
         LDA   #$6B7C     ; TEXTE 3 : >
         LDX   #$0002
         LDY   #$6359
         JSR   CADTXT9
         RTS
CADLPUF  LDA   #CADRLEF3  ; BOUTON 3 F
         JSR   CADRC
         LDA   #$5EFC     ; TEXTE 3 : >
         LDX   #$0002
         LDY   #$6359
         JSR   CADTXT9
         RTS

CADLPDC  LDA   #CADRLEC4  ; BOUTON 4 C
         JSR   CADRC
         LDA   #$519E     ; TEXTE 4 : >>
         LDX   #$0003
         LDY   #$6365
         JSR   CADTXT9
         RTS
CADLPDF  LDA   #CADRLEF4  ; BOUTON 4 F
         JSR   CADRC
         LDA   #$451E     ; TEXTE 4 : >>
         LDX   #$0003
         LDY   #$6365
         JSR   CADTXT9
         RTS

CADLOKC  LDA   #CADRLEC5  ; BOUTON 5 C
         JSR   CADRC
         LDA   #$0D0D     ; TEXTE 5 : OK
         LDX   #$0004
         LDY   #$7570
         JSR   CADTXT
         RTS
CADLOKF  LDA   #CADRLEF5  ; BOUTON 5 F
         JSR   CADRC
         LDA   #$008D     ; TEXTE 5 : OK
         LDX   #$0004
         LDY   #$7570
         JSR   CADTXT
         RTS

CADRLEVE HEX   CE00,2800,0401,3700,0000,0000,0000 ; LEVEL CADRE SOMBRE

CADRLE1  HEX   B400,6800,CA00,7600,00CC,C000,0100 ; <<
CADRLEC1 HEX   B400,6800,CA00,7600,00CC,C000,0000
CADRLEF1 HEX   B400,6800,CA00,7600,00FF,F000,0000

CADRLE2  HEX   CE00,6800,E400,7600,00CC,C000,0100 ; <
CADRLEC2 HEX   CE00,6800,E400,7600,00CC,C000,0000
CADRLEF2 HEX   CE00,6800,E400,7600,00FF,F000,0000

CADRLE3  HEX   EA00,6800,0001,7600,00CC,C000,0100 ; >
CADRLEC3 HEX   EA00,6800,0001,7600,00CC,C000,0000
CADRLEF3 HEX   EA00,6800,0001,7600,00FF,F000,0000

CADRLE4  HEX   0401,6800,1A01,7600,00CC,C000,0100 ; >>
CADRLEC4 HEX   0401,6800,1A01,7600,00CC,C000,0000
CADRLEF4 HEX   0401,6800,1A01,7600,00FF,F000,0000

CADRLE5  HEX   D000,8400,FE00,9300,00CC,C000,0100 ; OK
CADRLEC5 HEX   D000,8400,FE00,9300,00CC,C000,0000
CADRLEF5 HEX   D000,8400,FE00,9300,00FF,F000,0000

*************  CREATION DE L'ECRAN DOC  *************

CADDOCU  LDA   #CADRDOCU
         JSR   CASOMB
         LDA   #$0058     ; DOC TITRE
         LDX   #$0006
         LDY   #$359F
         JSR   CADTXT
         LDA   #CADRDO3   ; >
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADDPUC
         LDA   #CADRDO2   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADDOKC
         LDA   #CADRDO1   ; <
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADDMUC
         RTS

******************  CREATION DE ABOUT  **************

CADABOU  LDA   #CADRABOU
         JSR   CASOMB
         LDA   #$0065     ; ABOUT TITRE
         LDX   #$000B
         LDY   #$359B
         JSR   CADTXT
         LDA   #CADRDO3   ; >
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADDPUC
         LDA   #CADRDO2   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADDOKC
         LDA   #CADRDO1   ; <
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADDMUC
         RTS

*******************  DOC/ABOUT  ********************

CADDMUC  LDA   #CADRDOC1  ; BOUTON 1 C
         JSR   CADRC      ; TEXTE 1 : <
         LDA   #$6B77     ; ADRESSE SPRITE
         LDX   #$0002     ; LARGEUR
         LDY   #$81CF     ; ADRESSE ECRAN
         JSR   CADTXT9
         RTS
CADDMUF  LDA   #CADRDOF1  ; BOUTON 1 F
         JSR   CADRC
         LDA   #$5EF7     ; TEXTE 1 : <
         LDX   #$0002
         LDY   #$81CF
         JSR   CADTXT9
         RTS

CADDOKC  LDA   #CADRDOC2  ; BOUTON 2 C
         JSR   CADRC
         LDA   #$0D0D     ; TEXTE 2 : OK
         LDX   #$0004
         LDY   #$8281
         JSR   CADTXT
         RTS
CADDOKF  LDA   #CADRDOF2  ; BOUTON 2 F
         JSR   CADRC
         LDA   #$008D     ; TEXTE 2 : OK
         LDX   #$0004
         LDY   #$8281
         JSR   CADTXT
         RTS

CADDPUC  LDA   #CADRDOC3  ; BOUTON 3 C
         JSR   CADRC
         LDA   #$6B7C     ; TEXTE 3 : >
         LDX   #$0002
         LDY   #$81F7
         JSR   CADTXT9
         RTS
CADDPUF  LDA   #CADRDOF3  ; BOUTON 3 F
         JSR   CADRC
         LDA   #$5EFC     ; TEXTE 3 : >
         LDX   #$0002
         LDY   #$81F7
         JSR   CADTXT9
         RTS

CADRDOCU HEX   B600,1E00,DC00,2D00,0000,0000,0000 ; DOCU CADRE SOMBRE
CADRABOU HEX   B000,1E00,E600,2D00,0000,0000,0000 ; ABOUT CADRE SOMBRE

CADRDO1  HEX   9600,9900,AC00,A700,00CC,C000,0100 ; <
CADRDOC1 HEX   9600,9900,AC00,A700,00CC,C000,0000
CADRDOF1 HEX   9600,9900,AC00,A700,00FF,F000,0000

CADRDO2  HEX   B200,9900,E000,A800,00CC,C000,0100 ; OK
CADRDOC2 HEX   B200,9900,E000,A800,00CC,C000,0000
CADRDOF2 HEX   B200,9900,E000,A800,00FF,F000,0000

CADRDO3  HEX   E600,9900,FC00,A700,00CC,C000,0100 ; >
CADRDOC3 HEX   E600,9900,FC00,A700,00CC,C000,0000
CADRDOF3 HEX   E600,9900,FC00,A700,00FF,F000,0000

*************  CREATION DE L'ECRAN QUIT  *************

CADQUIT  LDA   #CADRQUIT
         JSR   CASOMB
         LDA   #$007C     ; QUIT
         LDX   #$0008
         LDY   #$3BEC
         JSR   CADTXT
         LDA   #CADRQU2   ; OK
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADQOKC
         LDA   #CADRQU1   ; QUIT
         JSR   CADRC
         JSR   CASOMB0
         JSR   CADQQUC
         RTS

*******************  QUIT  ********************

CADQQUC  LDA   #CADRQUC1  ; BOUTON 1 C
         JSR   CADRC      ; TEXTE 1 : QUIT
         LDA   #$5214     ; ADRESSE SPRITE
         LDX   #$0011     ; LARGEUR
         LDY   #$58A2     ; ADRESSE ECRAN
         JSR   CADTXT
         RTS
CADQQUF  LDA   #CADRQUF1  ; BOUTON 1 F
         JSR   CADRC
         LDA   #$4594     ; TEXTE 1 : QUIT
         LDX   #$0011
         LDY   #$58A2
         JSR   CADTXT
         RTS

CADQOKC  LDA   #CADRQUC2  ; BOUTON 2 C
         JSR   CADRC
         LDA   #$0D0D     ; TEXTE 2 : OK
         LDX   #$0004
         LDY   #$710F
         JSR   CADTXT
         RTS
CADQOKF  LDA   #CADRQUF2  ; BOUTON 2 F
         JSR   CADRC
         LDA   #$008D     ; TEXTE 2 : OK
         LDX   #$0004
         LDY   #$710F
         JSR   CADTXT
         RTS

CADRQUIT HEX   D200,2800,FC00,3700,0000,0000,0000 ; QUIT CADRE SOMBRE

CADRQU1  HEX   BC00,5600,1001,6500,00CC,C000,0100 ; QUIT
CADRQUC1 HEX   BC00,5600,1001,6500,00CC,C000,0000
CADRQUF1 HEX   BC00,5600,1001,6500,00FF,F000,0000

CADRQU2  HEX   CE00,7D00,FC00,8C00,00CC,C000,0100 ; OK
CADRQUC2 HEX   CE00,7D00,FC00,8C00,00CC,C000,0000
CADRQUF2 HEX   CE00,7D00,FC00,8C00,00FF,F000,0000

************  GESTION DU NIVEAU EN DECIMAL  ***********************

NUMPLUU  LDA   NUMUNI     ; LEVEL + 1
         CMP   #$0009
         BEQ   NUMPLUU1
         INC
         STA   NUMUNI
         RTS
NUMPLUU1 LDA   NUMDIZ
         CMP   #$0009
         BEQ   NUMPLUU2
         INC
         STA   NUMDIZ
         STZ   NUMUNI
         RTS
NUMPLUU2 LDA   NUMCEN
         INC
         STA   NUMCEN
         STZ   NUMDIZ
         STZ   NUMUNI
         RTS

NUMPLUD  LDA   NUMDIZ     ; LEVEL + 10
         CMP   #$0009
         BEQ   NUMPLUD1
         INC
         STA   NUMDIZ
         RTS
NUMPLUD1 LDA   NUMCEN
         INC
         STA   NUMCEN
         STZ   NUMDIZ
         RTS

NUMMOIU  LDA   NUMUNI     ; LEVEL - 1
         BEQ   NUMMOIU1
         DEC
         STA   NUMUNI
         RTS
NUMMOIU1 LDA   NUMDIZ
         BEQ   NUMMOIU2
         DEC
         STA   NUMDIZ
         LDA   #$0009
         STA   NUMUNI
         RTS
NUMMOIU2 LDA   NUMCEN
         BEQ   NUMMOIU3
         DEC
         STA   NUMCEN
         LDA   #$0009
         STA   NUMDIZ
         STA   NUMUNI
NUMMOIU3 RTS

NUMMOID  LDA   NUMDIZ     ; LEVEL - 10
         BEQ   NUMMOID1
         DEC
         STA   NUMDIZ
         RTS
NUMMOID1 LDA   NUMCEN
         BEQ   NUMMOID2
         DEC
         STA   NUMCEN
         LDA   #$0009
         STA   NUMDIZ
         RTS
NUMMOID2 STZ   NUMUNI
         RTS

NUMVERIF LDA   NUMUNI     ; VERIFICATION DE LA COHERENCE DU LEVEL
         BNE   NUMVERI1
         LDA   NUMDIZ
         BNE   NUMVERI1
         LDA   NUMCEN
         BNE   NUMVERI1
         LDA   #$0001
         STA   NUMUNI     ; 000 -> 001
         JSR   NUMCONV    ; CONVERSION
         RTS
NUMVERI1 LDA   NUMCEN
         BEQ   NUMVERI2
         LDA   NUMDIZ
         CMP   #$0002
         BMI   NUMVERI2
         LDA   #$0002
         STA   NUMDIZ
         STZ   NUMUNI
NUMVERI2 JSR   NUMCONV    ; CONVERSION
         RTS

NUMCONV  LDA   NUMCEN     ; TRANSFORMATION LEVEL DECIMAL -> LEVEL HEXA
         ASL
         TAX
         LDA   NUMTABC,X
         CLC
         ADC   NUMUNI
         STA   NUMHEX
         LDA   NUMDIZ
         ASL
         TAX
         LDA   NUMTABD,X
         CLC
         ADC   NUMHEX
         STA   NUMHEX
         RTS

NUMVNOC  LDA   Niveau     ; TRANSFORMATION Niveau (HEXA) -> DECIMAL
         STA   NUMHEX
         CMP   #$0064     ; 100
         BPL   NUMVNOC1
         STZ   NUMCEN     ; CENTAINE A ZERO
         BRA   NUMVNOC2
NUMVNOC1 LDA   #$0001
         STA   NUMCEN     ; CENTAINE A UN
         LDA   Niveau
         SEC
         SBC   #$0064
NUMVNOC2 ASL
         TAX
         LDA   NUMTABV,X  ;
         AND   #$FF00
         XBA
         STA   NUMDIZ     ; DIZAINE
         LDA   NUMTABV,X
         AND   #$00FF
         STA   NUMUNI
         RTS

NUMAFFI  LDA   #$00D8     ; NETTOYAGE ZONE
         STA   CADRX0
         LDA   #$004F
         STA   CADRY0
         LDA   #$00F6
         STA   CADRX1
         LDA   #$005C
         STA   CADRY1
         JSR   CARETAB
         LDA   NUMCEN     ; CHIFFRE CENTAINE
         ASL
         TAX
         LDA   NUMTAB,X   ; *44
         TAY
         LDX   #$326D
         LDA   #$394D
         STA   NUMAF11+1
         JSR   NUMAF10
         LDA   NUMDIZ     ; CHIFFRE DIZAINE
         ASL
         TAX
         LDA   NUMTAB,X   ; *44
         TAY
         LDX   #$3272
         LDA   #$3952
         STA   NUMAF11+1
         JSR   NUMAF10
         LDA   NUMUNI     ; CHIFFRE UNITE
         ASL
         TAX
         LDA   NUMTAB,X   ; *44
         TAY
         LDX   #$3277
         LDA   #$3957
         STA   NUMAF11+1
         JSR   NUMAF10
         RTS

NUMAF10  LDAL  $E12000,X
         ORA   NUMEZE,Y
         STAL  $E12000,X
         INX
         INX
         INY
         INY
         LDAL  $E12000,X
         ORA   NUMEZE,Y
         STAL  $E12000,X
         INY
         INY
         TXA
         CLC
         ADC   #$009E     ; LIGNE SUIVANTE
         TAX
NUMAF11  CMP   #$AAAA
         BNE   NUMAF10
         RTS

NUMHEX   HEX   0000       ; LEVEL EN HEXA

NUMCEN   HEX   0000       ; LEVEL : 1-120
NUMDIZ   HEX   0000
NUMUNI   HEX   0100

NUMTAB   HEX   0000,2C00,5800,8400,B000,DC00,0801,3401,6001,8C01

NUMTABD  HEX   0000,0A00,1400,1E00,2800,3200,3C00,4600,5000,5A00
NUMTABC  HEX   0000,6400,C800,2C01,9001,F401,5802,BC02,2003,8403

NUMEZE   HEX   0FFFFF00FF000FF0FF000FF0FF000FF0FF000FF0FF000FF0FF000FF0FF000FF0FF000FF0FF000FF00FFFFF00
         HEX   000FF00000FFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000
         HEX   0FFFFF00F0000FF000000FF000000FF00000FF00000FF00000FF00000FF00000FF000000FF000000FFFFFFF0
         HEX   FFFFFFF000000FF00000FF00000FF00000FFFF0000000FF000000FF000000FF000000FF0F0000FF00FFFFF00
         HEX   00000FF00000FFF0000F0FF000F00FF00F000FF0F0000FF0FFFFFFFF00000FF000000FF000000FF000000FF0
         HEX   FFFFFFF0FF000000FF000000FF000000FFFFFF0000000FF000000FF000000FF000000FF0F0000FF00FFFFF00
         HEX   000FFF0000F000000F000000FF000000FFFFFF00FF000FF0FF000FF0FF000FF0FF000FF0FF000FF00FFFFF00
         HEX   FFFFFFF000000FF000000FF000000FF00000FFF0000FFF00000FF000000FF000000FF000000FF000000FF000
         HEX   0FFFFF00FF000FF0FF000FF0FF000FF0FF000FF00FFFFF00FF000FF0FF000FF0FF000FF0FF000FF00FFFFF00
         HEX   0FFFFF00FF000FF0FF000FF0FF000FF0FF000FF0FF000FF00FFFFFF000000FF00000FF00000FF0000FFF0000

NUMTABV  HEX   0000,0100,0200,0300,0400,0500,0600,0700,0800,0900
         HEX   0001,0101,0201,0301,0401,0501,0601,0701,0801,0901
         HEX   0002,0102,0202,0302,0402,0502,0602,0702,0802,0902
         HEX   0003,0103,0203,0303,0403,0503,0603,0703,0803,0903
         HEX   0004,0104,0204,0304,0404,0504,0604,0704,0804,0904
         HEX   0005,0105,0205,0305,0405,0505,0605,0705,0805,0905
         HEX   0006,0106,0206,0306,0406,0506,0606,0706,0806,0906
         HEX   0007,0107,0207,0307,0407,0507,0607,0707,0807,0907
         HEX   0008,0108,0208,0308,0408,0508,0608,0708,0808,0908
         HEX   0009,0109,0209,0309,0409,0509,0609,0709,0809,0909

         asc   'We had a problem with Tinies, we couldn t play after level 87',8d
         asc   'Strange, isn t it?',8d

******************  AFFICHAGE EASTER EGGS  **********************

EAEGSPR  ASL              ; ROUTINE AFFICHAGE SPRITE SANS MASQUE
         ASL
         ASL
         TAX
         LDA   EAEGTAB2,X ; ADRESSE ECRAN
         STA   EAEGSP2+1
         STA   EAEGSP5+1
         STA   EAEGSP7+1
         INX
         INX
         LDA   EAEGTAB2,X ; ADRESSE SPRITE
         STA   EAEGSP1+1
         STA   EAEGSP3+1
         STA   EAEGSP4+1
         STA   EAEGSP6+1
         INX
         INX
         LDA   EAEGTAB2,X ; LONGUEUR
         ASL
         STA   EAEGSP8+1
         INX
         INX
         LDA   EAEGTAB2,X ; HAUTEUR
         STA   EAEGSP9+1

         LDY   #$0000
EAEGSP00 PHY
         LDX   #$0000
EAEGSP0  PHX
EAEGSP1  LDAL  $AAAAAA,X  ; 4 POINTS
         AND   #$00FF
         TAY
EAEGSP2  LDAL  $E12000,X  ; ECRAN
         AND   EAEGTAB3,Y
EAEGSP3  ORAL  $AAAAAA,X  ; SPRITE
         STA   EAEGTAB1
         INX
EAEGSP4  LDAL  $AAAAAA,X  ; SPRITE
         AND   #$00FF
         TAY
EAEGSP5  LDAL  $E12000,X  ; ECRAN
         AND   EAEGTAB3,Y
EAEGSP6  ORAL  $AAAAAA,X  ; SPRITE
         STA   EAEGTAB1+1
         DEX
         LDA   EAEGTAB1
EAEGSP7  STAL  $E12000,X  ; ECRAN
         PLX
         INX
         INX
EAEGSP8  CPX   #$AAAA
         BNE   EAEGSP0
         LDA   EAEGSP2+1  ; ECRAN LIGNE SUIVANTE
         CLC
         ADC   #$00A0
         STA   EAEGSP2+1
         STA   EAEGSP5+1
         STA   EAEGSP7+1
         LDA   EAEGSP1+1  ; SPRITE LIGNE SUIVANTE
         CLC
         ADC   #$00A0
         STA   EAEGSP1+1
         STA   EAEGSP3+1
         STA   EAEGSP4+1
         STA   EAEGSP6+1
         PLY
         INY
EAEGSP9  CPY   #$AAAA
         BNE   EAEGSP00
         RTS

EAEGTAB1 HEX   000000

EAEGTAB2 HEX   BC31,E101,1500,4400 ; WOOD      ADR ECRAN,ADR SPRITE,LONG/4,HAUTEUR
         HEX   9B65,E562,1600,2300 ; WOOD TEXT
         HEX   1A31,6D1A,1600,4E00 ; BRUTAL
         HEX   3B6B,E553,1500,1400 ; BRUTAL TEXT
         HEX   D62F,9B1A,1A00,5600 ; B&W
         HEX   4F6E,5369,2100,1900 ; B&W TEXT
         HEX   BF36,A150,1100,4000 ; FUTUR
         HEX   AB68,C1E2,2500,1800 ; FUTUR TEXT
         HEX   7E44,812F,1300,3000 ; WIN
         HEX   5A6E,7358,1600,1700 ; WIN TEXT

EAEGTAB3 HEX   FF,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0,F0
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
         HEX   0F,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

******************************************************************************
***************  ROUTINES GRAPHIQUE CADRES ETC...*****************************
******************************************************************************

*************  AFFICHAGE DU TEXT DANS LE CADRE  **************

CADTXT   STY   CADTXT3+1  ; ADRESSE ECRAN
         STY   CADTXT4+1
         LDY   ptrSUPERMAN+1
CADTXT7  STY   CADTXT5+2
         STY   CADTXT6+2
         STA   CADTXT6+1  ; ADRESSE SPRITE
         CLC
         ADC   #$0640     ; 10 LIGNES
         STA   CADTXT5+1
         TXA              ; LARGEUR
         DEC
         ASL
         STA   CADTXT1+1
CADTXT0  LDY   #$0007     ; TEXTE = 8 LIGNE
CADTXT1  LDX   #$0000
CADTXT4  LDAL  $E12000,X  ; FOND
CADTXT5  ANDL  $E12000,X  ; MASK
CADTXT6  ORAL  $E12000,X  ; SPRITE
CADTXT3  STAL  $E12000,X  ; ECRAN
         DEX
         DEX
         BPL   CADTXT4
         LDA   CADTXT4+1
         CLC
         ADC   #$00A0
         STA   CADTXT4+1
         LDA   CADTXT3+1
         CLC
         ADC   #$00A0
         STA   CADTXT3+1
         LDA   CADTXT5+1
         CLC
         ADC   #$00A0
         STA   CADTXT5+1
         LDA   CADTXT6+1
         CLC
         ADC   #$00A0
         STA   CADTXT6+1
         DEY
         BPL   CADTXT1
         RTS

CADTXT9  PHA              ; AFFICHAGE SUR 9 LIGNES : >...
         LDA   #$0008
         STA   CADTXT0+1
         PLA
         JSR   CADTXT
         LDA   #$0007
         STA   CADTXT0+1
         RTS

CADTXT2  STY   CADTXT3+1   ; AFFICHAGE DES SPRITES DE LA 2eme PLANCHE
         STY   CADTXT4+1
         LDY   ptrMESSAGE+1
         JMP   CADTXT7

*************  AFFICHAGE DU SPRITE DANS LE CADRE  **************

CADSPR   STY   CADSPR2+1  ; ADRESSE ECRAN
         STY   CADSPR3+1
         LDY   ptrSUPERMAN+1
         STY   CADSPR5+2  ; MASK
         STY   CADSPR6+2  ; SPRITE
         STA   CADSPR6+1  ; ADRESSE SPRITE
         CLC
CADSPR7  ADC   #$0000     ; DISTANCE SPRITE/MASK
         STA   CADSPR5+1
         TXA              ; LARGEUR
         DEC
         ASL
         STA   CADSPR1+1
CADSPR4  LDY   #$0007     ; SPRITE = x LIGNES
CADSPR1  LDX   #$0000
CADSPR2  LDAL  $E12000,X  ; FOND
CADSPR5  ANDL  $E12000,X  ; MASK
CADSPR6  ORAL  $E12000,X  ; SPRITE
CADSPR3  STAL  $E12000,X  ; ECRAN
         DEX
         DEX
         BPL   CADSPR2
         LDA   CADSPR2+1
         CLC
         ADC   #$00A0
         STA   CADSPR2+1
         LDA   CADSPR3+1
         CLC
         ADC   #$00A0
         STA   CADSPR3+1
         LDA   CADSPR5+1
         CLC
         ADC   #$00A0
         STA   CADSPR5+1
         LDA   CADSPR6+1
         CLC
         ADC   #$00A0
         STA   CADSPR6+1
         DEY
         BPL   CADSPR1
         RTS

**************  CREATION VERT ET CADRE  ******************

CADRE    LDA   #$0001     ; ON TRACE LA LIGNE
         STA   CADRFLAG
         LDX   #$001E
         LDA   #$00F0     ; PALETTE 1 GREEN TONE
:2       STAL  $E19E20,X
         SEC
         SBC   #$0010
         DEX
         DEX
         BPL   :2

         LDX   #$001E     ; PALETTE 2 FULL GREEN
         LDA   #$00F0
:3       STAL  $E19E40,X
         DEX
         DEX
         BPL   :3

         LDY   #$000F     ; FADE OUT LIGNE 100
:4       LDA   #$0064
         JSR   FADELINE1
         JSR   WAIT1      ; WAIT
         DEY
         BPL   :4

         LDAL  $E19D64    ; SBC LIGNE 100 (PALETTE 1)
         AND   #$FF00
         ORA   #$0001
         STAL  $E19D64

         LDX   #$000E     ; FADE IN POINT VERT
         LDA   #$0000
:8       CLC
         ADC   #$0011
         STAL  $E15ED0
         JSR   WAIT1      ; WAIT
         DEX
         BPL   :8

         LDX   #$004E     ; TRACE HORIZONTAL
         LDY   #$004E
         LDA   #$FFFF
:9       STAL  $E15E81,X  ; <-
         PHX
         TYX
         STAL  $E15E82,X  ; ->
         PLX
         JSR   WAIT1      ; WAIT
         INY
         DEX
         BPL   :9
         STAL  $E15E80

         LDX   #$009E
:7       LDAL  $015E80,X  ; REMET LA LIGNE 100
         STAL  $E15E80,X
         DEX
         DEX
         BPL   :7

         LDX   #$0063     ; DEPLOIEMENT VERTICAL
         LDY   #$0064
:10      LDA   #$0102     ; MONTE
         STAL  $E19D00,X
         PHX
         TYX
         LDA   #$0201     ; DESCEND
         STAL  $E19D00,X
         PLX
         TXA
         INC
         JSR   FADELINE8
         TYA
         CMP   #$0064
         BEQ   :11
         JSR   FADELINE8
:11      JSR   WAIT1      ; WAIT
         INY
         DEX
         BPL   :10
         LDA   #$0101
         STAL  $E19D00
         LDA   #$0000
         JSR   FADELINE8

         LDX   #$3F6E     ; DEUX TRANSVERSALES
         LDY   #$3F70
:12      TXA
         SEC
         SBC   #$009E
         TAX
         LDA   #$FFBB     ; ->
         STAL  $E12000,X
         PHX
         TYA
         SEC
         SBC   #$00A2
         TAY
         TYX
         LDA   #$BBFF     ; <-
         STAL  $E12000,X
         PLX
         JSR   WAIT1      ; WAIT
         LDA   #$BBBB
         STAL  $E12000,X
         PHX
         TYX
         STAL  $E12000,X
         PLX
         CPY   #$26C2
         BNE   :12

         JSR   WAIT2      ; WAIT

         LDX   #$3F70     ; NETTOYAGE TRANSVERSALE GAUCHE
:22      TXA
         SEC
         SBC   #$00A2
         TAX
         LDAL  $012000,X  ; <-
         AND   #$00FF
         TAY
         LDA   TABLE2,Y
         AND   #$00FF
         STA   :220+1
         LDAL  $E12000,X
         AND   #$FF00
:220     ORA   #$0000
         STAL  $E12000,X
         LDAL  $012000,X  ; <-
         AND   #$FF00
         XBA
         TAY
         LDA   TABLE2,Y
         AND   #$00FF
         XBA
         STA   :221+1
         LDAL  $E12000,X
         AND   #$00FF
:221     ORA   #$0000
         STAL  $E12000,X
         CPX   #$26C2
         BNE   :22

         LDX   #$3F6E     ; NETTOYAGE TRANSVERSALE DROITE
:223     TXA
         SEC
         SBC   #$009E
         TAX
         LDAL  $012000,X  ; <-
         AND   #$00FF
         TAY
         LDA   TABLE2,Y
         AND   #$00FF
         STA   :224+1
         LDAL  $E12000,X
         AND   #$FF00
:224     ORA   #$0000
         STAL  $E12000,X
         LDAL  $012000,X  ; <-
         AND   #$FF00
         XBA
         TAY
         LDA   TABLE2,Y
         AND   #$00FF
         XBA
         STA   :225+1
         LDAL  $E12000,X
         AND   #$00FF
:225     ORA   #$0000
         STAL  $E12000,X
         CPX   #$275C
         BNE   :223

         LDA   #$0006
         STA   COOR1X
         LDA   #$0040
         STA   COOR1Y
         LDA   #$0139
         STA   COOR2X
         LDA   #$003D
         STA   COOR2Y
         STZ   TRACFLAG

         LDX   #$26C2     ; TRACE CADRE 1
         LDY   #$275D
:13      LDAL  $E12000,X  ; MONTE
         ORA   #$00FF
         STAL  $E12000,X
         TXA
         SEC
         SBC   #$00A0
         TAX
         PHX
         TYX
         LDAL  $E12000,X  ; DESCEND
         ORA   #$00FF
         STAL  $E12000,X
         TYA
         CLC
         ADC   #$00A0
         TAY
         PLX
         JSR   TRAC1
         NOP              ; WAIT
         CPX   #$0142
         BNE   :13

         JSR   TRACEND
         LDA   #$0006
         STA   COOR1X
         LDA   #$0005
         STA   COOR1Y
         STZ   TRACFLAG

         LDX   #$01E2     ; TRACE CADRE 2
:14      LDA   #$FFFF
         STAL  $E12000,X
         STAL  $E120A0,X  ; DROITE
         INX
         PHX
         TYX
         LDAL  $E12000,X  ; DESCEND
         ORA   #$00FF
         STAL  $E12000,X
         TYA
         CLC
         ADC   #$00A0
         TAY
         PLX
         JSR   TRAC2
         NOP              ; WAIT
         CPY   #$7BBD
         BNE   :14

         JSR   TRACEND
         DEC   COOR1X
         DEC   COOR1X
         LDA   #$0139
         STA   COOR2X
         LDA   #$00C2
         STA   COOR2Y
         STZ   TRACFLAG

         LDY   #$7A7C     ; TRACE CADRE 3
:15      LDA   #$FFFF
         STAL  $E12000,X
         STAL  $E120A0,X  ; DROITE
         INX
         PHX
         TYX
         LDA   #$FFFF
         STAL  $E12000,X  ; GAUCHE
         STAL  $E120A0,X
         DEY
         PLX
         JSR   TRAC3
         NOP              ; WAIT
         CPX   #$027D
         BNE   :15

         JSR   TRACEND
         INC   COOR2X
         INC   COOR2X
         LDA   #$0139
         STA   COOR1X
         LDA   #$0005
         STA   COOR1Y
         STZ   TRACFLAG

         LDX   #$03BD     ; TRACE CADRE 4
:16      LDAL  $E12000,X  ; DESCEND
         ORA   #$00FF
         STAL  $E12000,X
         TXA
         CLC
         ADC   #$00A0
         TAX
         PHX
         TYX
         LDA   #$FFFF
         STAL  $E12000,X  ; GAUCHE
         STAL  $E120A0,X
         DEY
         PLX
         JSR   TRAC4
         NOP              ; WAIT
         CPY   #$79E1
         BNE   :16

         JSR   TRACEND
         LDA   #$0006
         STA   COOR2X
         LDA   #$00C2
         STA   COOR2Y
         STZ   TRACFLAG

         LDX   #$7942     ; TRACE CADRE 5
:17      LDAL  $E12000,X
         ORA   #$00FF
         STAL  $E12000,X
         TXA
         SEC
         SBC   #$00A0
         TAX
         JSR   TRAC5
         NOP              ; WAIT
         CPX   #$3202
         BNE   :17

         JSR   TRACEND
         LDA   #$0139
         STA   COOR1X
         LDA   #$00C2
         STA   COOR1Y
         STZ   TRACFLAG

:18      LDAL  $E12000,X  ; TRACE CADRE 6
         ORA   #$00FF
         STAL  $E12000,X
         TXA
         SEC
         SBC   #$00A0
         TAX
         JSR   TRAC6
         NOP              ; WAIT
         CPX   #$26C2
         BNE   :18

         JSR   TRACEND    ; NETTOY LES TRAITS

         RTS

*******************  RETABLI L'IMAGE  ***********************

RESTAUR  LDA   #$0102
         STAL  $E19D00
         LDA   #$0201
         STAL  $E19DC6

         LDX   #$0000     ; DEPLOIEMENT VERTICAL
         LDY   #$00C6
REST0    LDA   #$0200     ; DECEND
         STAL  $E19D00,X
         PHX
         TYX
         LDA   #$0002
         STAL  $E19D00,X  ; MONTE
         PLX
         PHX
         TXA
         ASL
         TAX
         LDA   TABLE,X
         CLC
         ADC   #$2000
         STA   REST1+1
         STA   REST2+1
         LDX   #$009E
REST1    LDAL  $012000,X  ; RECOPIE LA LIGNE
REST2    STAL  $012000,X
         DEX
         DEX
         BPL   REST1
         TYA
         INC
         ASL
         TAX
         LDA   TABLE,X
         CLC
         ADC   #$2000
         STA   REST3+1
         STA   REST4+1
         LDX   #$009E
REST3    LDAL  $012000,X  ; RECOPIE LA LIGNE
REST4    STAL  $012000,X
         DEX
         DEX
         BPL   REST3
         JSR   WAIT3      ; WAIT
         PLX
         INX
         DEY
         CPY   #$0062
         BNE   REST0

         LDX   #$009E
         LDA   #$FFFF
REST6    STAL  $E15DE0,X  ; LIGNE BLANCHE
         DEX
         DEX
         BPL   REST6

         LDA   #$0001     ; SCB A 1
         STAL  $E19D63

         LDX   #$0000     ; TRACE HORIZONTAL
         LDY   #$009E
         LDA   #$0000
REST5    STAL  $E15DE0,X  ; ->
         PHX
         TYX
         STAL  $E15DE0,X  ; <-
         JSR   WAIT3      ; WAIT
         PLX
         DEY
         INX
         CPX   #$0050
         BNE   REST5

         LDA   #$0000
         STAL  $E19D63

         LDX   #$009E
REST7    LDAL  $015DE0,X
         STAL  $E15DE0,X  ; LIGNE BLANCHE
         DEX
         DEX
         BPL   REST7

         RTS

****************** ASSOMBRIR UN CADRE *******************

CASOMB   STA   CASOMB2+1
         LDX   #$000C
CASOMB2  LDA   $AAAA,X
         STA   CADRX0,X
         DEX
         DEX
         BPL   CASOMB2

CASOMB0  LDX   #$0001
CASOMB1  JSR   CAFAD      ; FADE DE DEGRE 3
         DEX
         BPL   CASOMB1
         RTS

CAFAD    PHX              ; FADE OUT DU CADRE (CADRX0,CADRY0...)
         PHY
         LDA   CADRX1     ; LARGEUR
         SEC
         SBC   CADRX0
         LSR
         DEC
         DEC
         STA   CAFAD10+1
         LDA   CADRY1
         SEC
         SBC   CADRY0
         DEC
         DEC
         STA   CAFAD11+1
         LDA   CADRY0     ; ADRESSE EN HAUT A GAUCHE
         INC
         ASL
         TAX
         LDA   CADRX0
         LSR
         INC
         CLC
         ADC   TABLE,X
         CLC
         ADC   #$2000
         STA   CAFAD5+1
         STA   CAFAD8+1
         STA   CAFAD6+1
         STA   CAFAD9+1
CAFAD11  LDY   #$0000
CAFAD10  LDX   #$0000     ; 1 LIGNE
CAFAD5   LDAL  $E15E80,X  ; FADE 1 POINT
         BIT   #$00F0
         BEQ   CAFAD6
         SEC
         SBC   #$0010
CAFAD8   STAL  $E15E80,X
CAFAD6   LDAL  $E15E80,X
         BIT   #$000F
         BEQ   CAFAD7
         SEC
         SBC   #$0001
CAFAD9   STAL  $E15E80,X
CAFAD7   DEX
         BPL   CAFAD5
         LDA   CAFAD5+1
         CLC
         ADC   #$00A0
         STA   CAFAD5+1
         STA   CAFAD8+1
         STA   CAFAD6+1
         STA   CAFAD9+1
         DEY
         BPL   CAFAD10
         PLY
         PLX
         RTS

         asc   'Hi! Olivier is speaking: I have forgotten the following book',8d
         asc   'in SF: Le IIgs epluche. You can keep it, Joe...',8d

******************** RETABLIR UN CADRE ********************

CARETAB  PHX              ; RETABLI LE CADRE (CADRX0,CADRY0...)
         PHY
         LDA   CADRX1     ; LARGEUR
         SEC
         SBC   CADRX0
         LSR
         DEC
         DEC
         STA   CARET10+1
         LDA   CADRY1
         SEC
         SBC   CADRY0
         DEC
         DEC
         STA   CARET11+1
         LDA   CADRY0     ; ADRESSE EN HAUT A GAUCHE
         INC
         ASL
         TAX
         LDA   CADRX0
         LSR
         INC
         CLC
         ADC   TABLE,X
         CLC
         ADC   #$2000
         STA   CARET5+1
         STA   CARET8+1
         STA   CARET9+1
CARET11  LDY   #$0000
CARET10  LDX   #$0000     ; 1 LIGNE
         PHY
CARET5   LDAL  $012000,X  ; 1 POINT
         AND   #$00FF
         TAY
         LDA   TABLE2,Y
         AND   #$00FF
         STA   CARET6+1
CARET8   LDAL  $E12000,X
         AND   #$FF00
CARET6   ORA   #$0000
CARET9   STAL  $E12000,X
CARET7   DEX
         BPL   CARET5
         PLY
         LDA   CARET5+1
         CLC
         ADC   #$00A0
         STA   CARET5+1
         STA   CARET8+1
         STA   CARET9+1
         DEY
         BPL   CARET10
         PLY
         PLX
         RTS

CTPNCLNZ LDA   #$0058     ; NETTOYAGE CONTROL PANEL
         STA   CADRX0
         LDA   #$0020
         STA   CADRY0
         LDA   #$0136
         STA   CADRX1
         LDA   #$00AC
         STA   CADRY1
         JSR   CARETAB
         RTS

CTPNCLNT LDA   #$0066     ; NETTOYAGE ZONE TEXTE
         STA   CADRX0
         LDA   #$0031
         STA   CADRY0
         LDA   #$012C
         STA   CADRX1
         LDA   #$0091
         STA   CADRY1
         JSR   CARETAB
         RTS

****************** CREATION D'UN CADRE BOUTON ******************

CADRC    STA   FULL1+1
         LDX   #$000C
FULL1    LDA   $AAAA,X
         STA   CADRX0,X
         DEX
         DEX
         BPL   FULL1
         LDA   CADRX0     ; ON DETERMINE LE TYPE DE CADRE A UTILISER
         CMP   #$00A0
         BMI   CADRC1
         LDA   CADRY0
         CMP   #$0064
         BMI   CADRC5
         JMP   CACAS9     ; CAS 9
CADRC5   LDA   CADRY1
         CMP   #$0064
         BMI   CADRC6
         JMP   CACAS6     ; CAS 6
CADRC6   JMP   CACAS3     ; CAS 3
CADRC1   LDA   CADRX1
         CMP   #$00A0
         BMI   CADRC2
         LDA   CADRY0
         CMP   #$0064
         BMI   CADRC7
         JMP   CACAS8     ; CAS 8
CADRC7   LDA   CADRY1
         CMP   #$0064
         BMI   CADRC8
         JMP   CACAS5     ; CAS 5
CADRC8   JMP   CACAS2     ; CAS 2
CADRC2   LDA   CADRY0
         CMP   #$0064
         BMI   CADRC3
         JMP   CACAS7     ; CAS 7
CADRC3   LDA   CADRY1
         CMP   #$0064
         BMI   CADRC4
         JMP   CACAS4     ; CAS 4
CADRC4   JMP   CACAS1     ; CAS 1

CACAS1   LDA   CADRX0
         STA   CADRCO3
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         JSR   CALIVBH    ; VERT BH
         LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY0
         STA   CADRCO3
         JSR   CALIHGD    ; HORI GD
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         LDA   CADRX1
         STA   CADRCO3
         JSR   CALIVHB    ; VERT HB
         LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY1
         STA   CADRCO3
         JSR   CALIHDG    ; HORI DG
         RTS
CACAS2   JMP   CACAS1
CACAS3   LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY0
         STA   CADRCO3
         JSR   CALIHGD    ; HORI GD
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         LDA   CADRX1
         STA   CADRCO3
         JSR   CALIVHB    ; VERT HB
         LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY1
         STA   CADRCO3
         JSR   CALIHDG    ; HORI DG
         LDA   CADRX0
         STA   CADRCO3
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         JSR   CALIVBH    ; VERT BH
         RTS
CACAS4   JMP   CACAS7
CACAS5   JMP   CACAS1
CACAS6   JMP   CACAS3
CACAS7   LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY1
         STA   CADRCO3
         JSR   CALIHDG    ; HORI DG
         LDA   CADRX0
         STA   CADRCO3
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         JSR   CALIVBH    ; VERT BH
         LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY0
         STA   CADRCO3
         JSR   CALIHGD    ; HORI GD
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         LDA   CADRX1
         STA   CADRCO3
         JSR   CALIVHB    ; VERT HB
         RTS

CACAS8   LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         LDA   CADRX1
         STA   CADRCO3
         JSR   CALIVHB    ; VERT HB
         LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY1
         STA   CADRCO3
         JSR   CALIHDG    ; HORI DG
         LDA   CADRX0
         STA   CADRCO3
         LDA   CADRY0
         STA   CADRCO1
         LDA   CADRY1
         STA   CADRCO2
         JSR   CALIVBH    ; VERT BH
         LDA   CADRX0
         STA   CADRCO1
         LDA   CADRX1
         STA   CADRCO2
         LDA   CADRY0
         STA   CADRCO3
         JSR   CALIHGD    ; HORI GD
         RTS
CACAS9   JMP   CACAS8

CALIHGD  LDA   CADRCO3    ; LIGNE GAUCHE-DROITE
         ASL
         TAY
         LDA   TABLE,Y
         CLC
         ADC   #$2000
         STA   CALIHG1+1
         STA   CALIHG2+1
         LDA   CADRCO2
         SEC
         SBC   CADRCO1
         LSR
         DEC
         TAY
         LDA   CADRCO1
         DEC
         LSR
         TAX
CALIHG1  LDAL  $E12000,X
         AND   #$00FF
         ORA   CADRCOL1
CALIHG2  STAL  $E12000,X
         TXA
         INC
         ASL
         INC
         STA   CADRLIX
         LDA   CADRCO3
         INC
         CMP   #$0065
         BMI   CALIHG3
         DEC
         DEC
CALIHG3  STA   CADRLIY
         JSR   CADRLINE   ; WAIT & LIGNE
         INX
         DEY
         BPL   CALIHG1
         JSR   CADRCLE
         RTS

CALIHDG  LDA   CADRCO3    ; LIGNE DROITE-GAUCHE
         ASL
         TAY
         LDA   TABLE,Y
         CLC
         ADC   #$2000
         STA   CALIHD1+1
         STA   CALIHD2+1
         LDA   CADRCO2
         SEC
         SBC   CADRCO1
         LSR
         DEC
         TAY
         LDA   CADRCO2
         DEC
         LSR
         DEC
         TAX
CALIHD1  LDAL  $E12000,X
         AND   #$00FF
         ORA   CADRCOL1
CALIHD2  STAL  $E12000,X
         TXA
         INC
         ASL
         STA   CADRLIX
         LDA   CADRCO3
         INC
         CMP   #$0065
         BMI   CALIHD3
         DEC
         DEC
CALIHD3  STA   CADRLIY
         JSR   CADRLINE   ; WAIT & LIGNE
         DEX
         DEY
         BPL   CALIHD1
         JSR   CADRCLE
         RTS

CALIVHB  LDA   CADRCO2    ; LIGNE HAUT-BAS
         SEC
         SBC   CADRCO1
         TAX
         LSR   CADRCO3
         LDA   CADRCO1
         ASL
         TAY
         LDA   TABLE,Y
         CLC
         ADC   #$2000
         CLC
         LDY   CADRCO1
         INY
         ADC   CADRCO3
         STA   CALIVH1+1
         STA   CALIVH2+1
CALIVH1  LDAL  $E12000
         AND   #$FF0F
         ORA   CADRCOL2
CALIVH2  STAL  $E12000
         LDA   CALIVH1+1
         CLC
         ADC   #$00A0     ; LIGNE SUIVANTE
         STA   CALIVH1+1
         STA   CALIVH2+1
         LDA   CADRCO3
         ASL
         INC
         CMP   #$00A1
         BMI   CALIVH4
         DEC
         DEC
CALIVH4  STA   CADRLIX
         STY   CADRLIY
         JSR   CADRLINE   ; WAIT & LIGNE
         INY
         DEX
         BPL   CALIVH1
         JSR   CADRCLE
         RTS

CALIVBH  LDA   CADRCO2    ; LIGNE BAS-HAUT
         SEC
         SBC   CADRCO1
         TAX
         LSR   CADRCO3
         LDA   CADRCO2
         ASL
         TAY
         LDA   TABLE,Y
         CLC
         ADC   #$2000
         CLC
         ADC   CADRCO3
         STA   CALIVB1+1
         STA   CALIVB2+1
         LDY   CADRCO2
         DEY
CALIVB1  LDAL  $E12000
         AND   #$FF0F
         ORA   CADRCOL2
CALIVB2  STAL  $E12000
         LDA   CALIVB1+1
         SEC
         SBC   #$00A0     ; LIGNE SUIVANTE
         STA   CALIVB1+1
         STA   CALIVB2+1
         LDA   CADRCO3
         ASL
         INC
         CMP   #$00A1
         BMI   CALIVB4
         DEC
         DEC
CALIVB4  STA   CADRLIX
         STY   CADRLIY
         JSR   CADRLINE   ; WAIT & LIGNE
         DEY
         DEX
         BPL   CALIVB1
         JSR   CADRCLE
         RTS

CADRLINE PHX
         PHY
         NOP
         LDA   CADRFLAG   ; DESSINE LA LIGNE DU CENTRE
         BEQ   CADRLIN2
         JSR   CADRCLE    ; NETTOYAGE
         LDA   #$00A0
         STA   LIX1
         LDA   #$0064
         STA   LIY1
         LDA   CADRLIX
         STA   LIX0
         LDA   CADRLIY
         STA   LIY0
         INC   LIFLAG
         JSR   LIGNE      ; TRACE

CADRLIN2 PLY
         PLX
         RTS

CADRLIX  HEX   0000       ; COORDONNEES
CADRLIY  HEX   0000

CADRCLE  PHX
         PHY
         STZ   LIFLAG
         JSR   LIGNE      ; NETTOYAGE
         INC   LIFLAG
         PLY
         PLX
         RTS

CADRCO1  HEX   0000
CADRCO2  HEX   0000
CADRCO3  HEX   0000       ; DONNEE COMPL

CADRX0   HEX   0000
CADRY0   HEX   0000
CADRX1   HEX   0000
CADRY1   HEX   0000

CADRCOL1 HEX   00CC       ; COULEUR DU TRAIT
CADRCOL2 HEX   C000

CADRFLAG HEX   0100       ; SERT A SAVOIR SI ON DOIT DESSINER LA LIGNE

         asc   'Here am I again, I have forgotten my french/english dictionary',8d
         asc   'at Joe s friends house... The daughter can keep it...',8d

***************** ROUTINES ******************

WAIT1    PHX
         PHY
         LDY   #$0001
WAI10    LDX   #$1000
WAI11    DEX
         BNE   WAI11
         DEY
         BNE   WAI10
         PLY
         PLX
         RTS

WAIT2    PHX
         PHY
         LDY   #$0010
         BRA   WAI10

WAIT3    PHX
         PHY
         LDY   #$0003
         BRA   WAI10

************************************ LIGNE *************************************

LIGNE    LDA   CADRFLAG
         BNE   LI6
         RTS
LI6      STZ   LIOF
         LDA   LIX0
         CMP   LIX1
         BMI   LI2        ; X0<X1

LI1      LDA   LIX0        ; DX=X1-X0 < 0
         SEC
         SBC   LIX1
         STA   LIDX
         BRA   LI3

LI2      LDA   LIX1       ; DX=X1-X0 > 0
         SEC
         SBC   LIX0
         STA   LIDX

LI3      LDA   LIY0
         CMP   LIY1
         BMI   LI4        ; Y0<Y1

         LDA   LIY0        ; DY=Y1-Y0 < 0
         SEC
         SBC   LIY1
         STA   LIDY
         BRA   LI5

LI4      LDA   LIY1       ; DY=Y1-Y0 > 0
         SEC
         SBC   LIY0
         STA   LIDY

LI5      LDA   LIDX
         CMP   LIDY
         BPL   LIDX0      ; DX>DY
         JMP   LIDY0      ; DX<DY

*******  DX > DY  ***********

LIDX0    LDA   LIDY
         STA   LIPL42+1
         STA   LIPL52+1
         STA   LIPL45+1
         STA   LIPL55+1
         STA   LIPL62+1
         STA   LIPL72+1
         STA   LIPL75+1
         STA   LIPL65+1

         LDA   LIDX
         SEC
         SBC   LIDY
         STA   LIPL43+1   ; DX-DY
         STA   LIPL53+1
         STA   LIPL63+1
         STA   LIPL73+1

*** SWAP ***

         LDA   LIY0
         CMP   LIY1
         BPL   LIDX1      ; Y0 > Y1

         LDX   LIX0
         LDA   LIX1       ; X1 = X0
         STA   LIX0       ; X0 = X1
         STX   LIX1

         LDX   LIY0
         LDA   LIY1       ; Y1 = Y0
         STA   LIY0       ; Y0 = Y1
         STX   LIY1

************

LIDX1    LDA   LIX0
         LSR
         STA   LIDX2+1    ; CALCUL DE A0
         LDA   LIY0
         ASL
         TAX
         LDA   TABLE,X
         CLC
LIDX2    ADC   #$0000
         STA   LIA0

         LDA   LIX1
         LSR
         STA   LIDX3+1    ; CALCUL DE A1
         LDA   LIY1
         ASL
         TAX
         LDA   TABLE,X
         CLC
LIDX3    ADC   #$0000
         STA   LIA1

         LDY   #$0000
         LDA   LIX0
         LSR
         BCC   LIDX4
         INY

LIDX4    LDA   LIX1       ; X0 PAIR
         CMP   LIX0
         BMI   LIDX5      ; DX<0
         JMP   LIDX9

LIDX5    TYA
         BEQ   LIDX6       ; X0 PAIR
         JMP   LIPL46
LIDX6    JMP   LIPL57

*****

LIDX7    LDA   LIX1
         LSR
         BCC   LIDX77
         LDX   LIA1
         JSR   LIIMPA
         RTS
LIDX77   LDX   LIA1
         JSR   LIPAIR
         RTS

LIPL41   LDA   LIA0
         CMP   LIA1
         BEQ   LIDX7      ; FIN

         DEC   LIA0
         INY
         LDA   LIOF       ; OF
LIPL42   CMP   #$0000     ; DY
         BPL   LIPL44

         CLC
LIPL43   ADC   #$0000     ; DX-DY
         STA   LIOF
         LDA   LIA0
         SEC
         SBC   #$00A0
         STA   LIA0
         TYA
         LSR
         BCC   LIPL47     ; PAIR
         BRA   LIPL46

LIPL44   SEC
LIPL45   SBC   #$0000     ; DY
         STA   LIOF
         TYA
         LSR
         BCC   LIPL47

LIPL46   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         BRA   LIPL51

LIPL47   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         BRA   LIPL41     ; **

LIDX8    LDA   LIX1
         LSR
         BCC   LIDX88
         LDX   LIA1
         JSR   LIIMPA
         RTS
LIDX88   LDX   LIA1
         JSR   LIPAIR
         RTS

LIPL51   TXA              ; A0
         CMP   LIA1
         BEQ   LIDX8      ; FIN

         INY
         LDA   LIOF       ; OF
LIPL52   CMP   #$0000     ; DY
         BPL   LIPL54

         CLC
LIPL53   ADC   #$0000     ; DX-DY
         STA   LIOF
         LDA   LIA0
         SEC
         SBC   #$00A0
         STA   LIA0
         TYA
         LSR
         BCC   LIPL57     ; PAIR
         BRA   LIPL56

LIPL54   SEC
LIPL55   SBC   #$0000     ; DY
         STA   LIOF
         TYA
         LSR
         BCC   LIPL57

LIPL56   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         JMP   LIPL51

LIPL57   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         JMP   LIPL41     ;

******

LIDX9    TYA
         BEQ   LIDX10     ; X0 PAIR
         JMP   LIPL66
LIDX10   JMP   LIPL77

LIDX11   LDA   LIX1
         LSR
         BCC   LIDX111
         LDX   LIA1
         JSR   LIIMPA
         RTS
LIDX111  LDX   LIA1
         JSR   LIPAIR
         RTS

LIPL61   LDA   LIA0
         CMP   LIA1
         BEQ   LIDX11     ; FIN

         INC   LIA0
         INY
         LDA   LIOF       ; OF
LIPL62   CMP   #$0000     ; DY
         BPL   LIPL64

         CLC
LIPL63   ADC   #$0000     ; DX-DY
         STA   LIOF
         LDA   LIA0
         SEC
         SBC   #$00A0
         STA   LIA0
         TYA
         LSR
         BCC   LIPL67     ; PAIR
         BRA   LIPL66

LIPL64   SEC
LIPL65   SBC   #$0000     ; DY
         STA   LIOF
         TYA
         LSR
         BCC   LIPL67

LIPL66   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         BRA   LIPL61

LIPL67   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         BRA   LIPL71     ; **

LIDX12   LDA   LIX1
         LSR
         BCC   LIDX121
         LDX   LIA1
         JSR   LIIMPA
         RTS
LIDX121  LDX   LIA1
         JSR   LIPAIR
         RTS

LIPL71   TXA              ; A0
         CMP   LIA1
         BEQ   LIDX12     ; FIN

         INY
         LDA   LIOF       ; OF
LIPL72   CMP   #$0000     ; DY
         BPL   LIPL74

         CLC
LIPL73   ADC   #$0000     ; DX-DY
         STA   LIOF
         LDA   LIA0
         SEC
         SBC   #$00A0
         STA   LIA0
         TYA
         LSR
         BCC   LIPL77     ; PAIR
         BRA   LIPL76

LIPL74   SEC
LIPL75   SBC   #$0000     ; DY
         STA   LIOF
         TYA
         LSR
         BCC   LIPL77     ; PAIR

LIPL76   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         JMP   LIPL61     ;

LIPL77   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         JMP   LIPL71

*****  DX < DY  *********

LIDY0    LDA   LIDX
         STA   LIPL2+1
         STA   LIPL12+1
         STA   LIPL5+1
         STA   LIPL15+1
         STA   LIPL22+1
         STA   LIPL32+1
         STA   LIPL25+1
         STA   LIPL35+1

         LDA   LIDY
         SEC
         SBC   LIDX
         STA   LIPL3+1    ; DY-DX
         STA   LIPL13+1
         STA   LIPL23+1
         STA   LIPL33+1

*** SWAP ***

         LDA   LIY1
         CMP   LIY0
         BPL   LIDY1      ; Y1 > Y0

         LDX   LIX0
         LDA   LIX1       ; X1 = X0
         STA   LIX0       ; X0 = X1
         STX   LIX1

         LDX   LIY0
         LDA   LIY1       ; Y1 = Y0
         STA   LIY0       ; Y0 = Y1
         STX   LIY1

************

LIDY1    LDA   LIX0
         LSR
         STA   LIDY2+1    ; CALCUL DE A0
         LDA   LIY0
         ASL
         TAX
         LDA   TABLE,X
         CLC
LIDY2    ADC   #$0000
         STA   LIA0

         LDA   LIX1
         LSR
         STA   LIDY3+1    ; CALCUL DE A1
         LDA   LIY1
         ASL
         TAX
         LDA   TABLE,X
         CLC
LIDY3    ADC   #$0000
         STA   LIA1

         LDY   #$0000
         LDA   LIX0
         LSR
         BCC   LIDY4
         INY

LIDY4    LDA   LIX1       ; X0 PAIR
         CMP   LIX0
         BMI   LIDY5      ; DX<0
         JMP   LIDY9

LIDY5    TYA
         BEQ   LIDY6       ; X0 PAIR
         JMP   LIPL6
LIDY6    JMP   LIPL17

*****

LIDY7    RTS

LIPL1    LDA   LIA0
         CMP   LIA1
         BEQ   LIDY7      ; FIN

         CLC
         ADC   #$00A0
         STA   LIA0
         LDA   LIOF       ; OF
LIPL2    CMP   #$0000     ; DX
         BPL   LIPL4

         CLC
LIPL3    ADC   #$0000     ; DY-DX
         STA   LIOF
         INY              ; ON INVERSE
         DEC   LIA0
         TYA
         LSR
         BCC   LIPL7      ; PAIR
         BRA   LIPL6

LIPL4    SEC
LIPL5    SBC   #$0000     ; DX
         STA   LIOF
         TYA
         LSR
         BCC   LIPL7

LIPL6    LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         BRA   LIPL11

LIPL7    LDX   LIA0       ; PAIR
         JSR   LIPAIR
         BRA   LIPL1

LIDY8    RTS

LIPL11   TXA              ; A0
         CMP   LIA1
         BEQ   LIDY8      ; FIN

         CLC
         ADC   #$00A0
         STA   LIA0
         LDA   LIOF       ; OF
LIPL12   CMP   #$0000     ; DX
         BPL   LIPL14

         CLC
LIPL13   ADC   #$0000     ; DY-DX
         STA   LIOF
         INY              ; ON INVERSE
         TYA
         LSR
         BCC   LIPL17     ; PAIR
         BRA   LIPL16

LIPL14   SEC
LIPL15   SBC   #$0000     ; DX
         STA   LIOF
         TYA
         LSR
         BCC   LIPL17

LIPL16   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         JMP   LIPL11

LIPL17   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         JMP   LIPL1

******

LIDY9    TYA
         BEQ   LIDY10     ; X0 PAIR
         JMP   LIPL26
LIDY10   JMP   LIPL37

LIDY11   RTS

LIPL21   LDA   LIA0
         CMP   LIA1
         BEQ   LIDY11     ; FIN

         CLC
         ADC   #$00A0
         STA   LIA0
         LDA   LIOF       ; OF
LIPL22   CMP   #$0000     ; DX
         BPL   LIPL24

         CLC
LIPL23   ADC   #$0000     ; DY-DX
         STA   LIOF
         INY              ; ON INVERSE
         INC   LIA0
         TYA
         LSR
         BCC   LIPL27     ; PAIR
         BRA   LIPL26

LIPL24   SEC
LIPL25   SBC   #$0000     ; DX
         STA   LIOF
         TYA
         LSR
         BCC   LIPL27

LIPL26   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         BRA   LIPL21

LIPL27   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         BRA   LIPL31

LIDY12   RTS

LIPL31   TXA              ; A0
         CMP   LIA1
         BEQ   LIDY12     ; FIN

         CLC
         ADC   #$00A0
         STA   LIA0
         LDA   LIOF
LIPL32   CMP   #$0000     ; DX
         BPL   LIPL34

         CLC
LIPL33   ADC   #$0000     ; DY-DX
         STA   LIOF
         INY              ; ON INVERSE
         TYA
         LSR
         BCC   LIPL37     ; PAIR
         BRA   LIPL36

LIPL34   SEC
LIPL35   SBC   #$0000     ; DX
         STA   LIOF
         TYA
         LSR
         BCC   LIPL37

LIPL36   LDX   LIA0       ; IMPAIR
         JSR   LIIMPA
         JMP   LIPL21

LIPL37   LDX   LIA0       ; PAIR
         JSR   LIPAIR
         JMP   LIPL31

******* TRACE

LIPAIR   LDA   LIFLAG
         BEQ   LIPAIR1
         LDAL  $E12000,X  ; TRACE PAIR
         AND   #$FF0F
         ORA   LICOULP
         STAL  $E12000,X
         RTS

LIPAIR1  PHY
         LDAL  $012000,X  ; NETTOYAGE PAIR
         AND   #$00FF
         TAY
         LDA   TABLE2,Y
         AND   #$00F0
         STA   LIPAIR2+1
         LDAL  $E12000,X
         AND   #$FF0F
LIPAIR2  ORA   #$0000
         STAL  $E12000,X
         PLY
         RTS

LIIMPA   LDA   LIFLAG
         BEQ   LIIPAI1
         LDAL  $E12000,X
         AND   #$FFF0
         ORA   LICOULI
         STAL  $E12000,X
         RTS

LIIPAI1  PHY
         LDAL  $012000,X  ; NETTOYAGE IMPAIR
         AND   #$00FF
         TAY
         LDA   TABLE2,Y
         AND   #$000F
         STA   LIIPAI2+1
         LDAL  $E12000,X
         AND   #$FFF0
LIIPAI2  ORA   #$0000
         STAL  $E12000,X
         PLY
         RTS

****************  VARIABLES  *********************

LIFLAG   HEX   0100

LIX0     HEX   0000
LIY0     HEX   0000
LIX1     HEX   0000
LIY1     HEX   0000
LIDX     HEX   0000       ; ABS DX
LIDY     HEX   0000       ; ABS DY
LIOF     HEX   0000       ; VARIABLE
LIA1     HEX   0000
LIA0     HEX   0000

LICOULP  HEX   C000       ; COULEUR PAIRE
LICOULI  HEX   0C00       ; COULEUR IMPAIRE

TABLE    HEX   0000A0004001E00180022003C00360040005A0054006E00680072008C0086009000AA00A400BE00B
         HEX   800C200DC00D600E000FA00F4010E01080112012C01260130014A0144015E01580162017C0176018
         HEX   0019A019401AE01A801B201CC01C601D001EA01E401FE01F80202021C02160220023A0234024E024
         HEX   80252026C02660270028A0284029E029802A202BC02B602C002DA02D402EE02E802F2030C0306031
         HEX   0032A0324033E03380342035C03560360037A0374038E0388039203AC03A603B003CA03C403DE03D
         HEX   803E203FC03F60400041A0414042E04280432044C04460450046A0464047E04780482049C049604A
         HEX   004BA04B404CE04C804D204EC04E604F0050A0504051E05180522053C05360540055A0554056E056
         HEX   80572058C0586059005AA05A405BE05B805C205DC05D605E005FA05F4060E06080612062C0626063
         HEX   0064A0644065E06580662067C06760680069A069406AE06A806B206CC06C606D006EA06E406FE06F
         HEX   80702071C07160720073A0734074E07480752076C07660770078A0784079E079807A207BC07B607C

TABLE2   HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   00,00,00,00,00,00,00,00,00,01,02,03,04,05,06,07
         HEX   10,10,10,10,10,10,10,10,10,11,12,13,14,15,16,17
         HEX   20,20,20,20,20,20,20,20,20,21,22,23,24,25,26,27
         HEX   30,30,30,30,30,30,30,30,30,31,32,33,34,35,36,37
         HEX   40,40,40,40,40,40,40,40,40,41,42,43,44,45,46,47
         HEX   50,50,50,50,50,50,50,50,50,51,52,53,54,55,56,57
         HEX   60,60,60,60,60,60,60,60,60,61,62,63,64,65,66,67
         HEX   70,70,70,70,70,70,70,70,70,71,72,73,74,75,76,77

***************************************************************
