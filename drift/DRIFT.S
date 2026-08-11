*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

                mx    %11

                org   $2000
                lst   off
                typ   SYS
                dsk   DRIFT.SYSTEM

*
* $0800 : menu.txt
* $0c00 : prodos buffer
* $1000 : main program
* $2000 : hgr
* $4000 : hgr2
* $4000 : music info
* $4400 : icons
* $6000 : musics
*

*-----------------------------
* COMMON EQUATES
*-----------------------------

                USE   EQUATES

*-----------------------------
* WE ARE AT $2000
*-----------------------------

                JMP   HELLO

                DS    8192-3

*-----------------------------
* WE ARE AT $4000
*-----------------------------

HELLO           LDA   PRODOS          ; Are we under ProDOS?
                CMP   #$4C
                BEQ   HELLOK

                JMP   BASIC           ; No, go back to BASIC

HELLOK          JSR   HOME

                JSR   iigsOFF

*-----------------------------
* LOAD FILES
*-----------------------------

* Set the prefix
                JSR   PRODOS
                DFB   $C6
                DA    proSETPFX

* Load the program at $1000
                LDA   #>ptrPROGRAM
                LDX   #>strPROGRAM
                LDY   #<strPROGRAM
                JSR   loadFILE

* Play the animation
                JSR   animateIT

* Now, wait...
                LDX   #128
]LP             LDA   #$30
                JSR   WAIT

                LDA   KBD             ; ...unless a key
                BMI   HELLOK99        ; is pressed

                DEX                   ; otherwise, loop
                BNE   ]LP

* And jump to it

HELLOK99        STA   KBDSTRB

                JSR   iigsON

                JMP   ptrPROGRAM

*-----------------------------
* LOAD FILE
*-----------------------------

loadFILE        =     *

* Set file pointer
                STY   proOPEN+1
                STX   proOPEN+2

* Set load address
                STA   proREAD+3
                LDA   #0
                STA   proREAD+2

* Open the file
                JSR   PRODOS
                DFB   $C8
                DA    proOPEN

* Set file number
                LDA   proOPEN+5
                STA   proGETEOF+1
                STA   proREAD+1
                STA   proCLOSE+1

* Get file length
                JSR   PRODOS
                DFB   $D1
                DA    proGETEOF

* Set EOF to the READ call
                LDA   proGETEOF+2
                STA   proREAD+4
                LDA   proGETEOF+3
                STA   proREAD+5

* Load file into memory
                JSR   PRODOS
                DFB   $CA
                DA    proREAD

* Close file
                JSR   PRODOS
                DFB   $CC
                DA    proCLOSE

                RTS

*-----------

strPROGRAM      STR   'DATA/PROGRAM'

*-----------

proSETPFX       DFB   $01             ; 00 num_parms
                DA    $0280           ; 01 prefix

proOPEN         DFB   $03             ; 00 num_parms
                DS    2               ; 01 pathname
                DA    ptrBUFFER       ; 03 io_buffer
                DS    1               ; 05 ref_num

proREAD         DFB   $04             ; 00 num_parms
                DS    1               ; 01 ref_num
                DS    2               ; 02 data_buffer
                DS    2               ; 04 request_count
                DS    2               ; 06 transfer_count

proCLOSE        DFB   $01             ; 00 num_parms
                DS    1               ; 01 ref_num

proGETEOF       DFB   $02             ; 00 num_parms
                DS    1               ; 01 ref_num
                DS    3               ; 02 eof

*-----------------------------
* THE ANIMATION
*-----------------------------

animateIT       =     *

                LDA   #>ptrHGR1       ; Draw on HGR1
                STA   HPAG

                LDA   #0              ; Clear the JMP
                STA   ptrHGR1
                STA   ptrHGR1+1
                STA   ptrHGR1+2

* Displays the HGR page
                STA   CLR80COL        ; Yes, show the main screen
                STA   TXTCLR
                STA   MIXCLR
                STA   TXTPAGE1
                STA   HIRES

*-----------------------------
* Animation process:
*  Move the plane around the screen
*  Add the message to its left
*  Each X move, add 1 column for the message
*  Until we reach some final destination...
*-----------------------------

]lp             JSR   animPLANE
                JSR   animMESSAGE

                LDA   KBD
                BMI   animateIT99

                LDA   #$60            ; A tempo...
                JSR   WAIT

                LDA   yPLANE          ; Until we reach the end
                CMP   #maxPLANE
                BCC   ]lp

animateIT99     BIT   KBDSTRB
                RTS

*-----------------------------
* W = 11 BYTES
* H = 19 LINES

animPLANE       =     *
                LDA   sPLANE
                AND   #$0F            ; Keep 4 bits
                TAX
                LDA   tblPLANEx,X
                CLC
                ADC   xPLANE
                TAX
                STA   xMESSAGE        ; For the message...

                LDY   yPLANE
                JSR   affichePLANE

                INC   sPLANE          ; Next in table
                INC   yPLANE          ; Next Y
* INC yPLANE
                RTS

*-----------

xPLANE          DFB   77              ; X (line)
yPLANE          DFB   0               ; Y (width)
sPLANE          DFB   0               ; step

wiPLANE         =     11
hePLANE         =     19
maxPLANE        =     158

tblPLANEx       DFB   00,00,01,02,03,03,02,01
                DFB   00,00,-1,-2,-3,-3,-2,-1

*-----------------------------

affichePLANE    =     *

                STX   XVAL1+1         ;VALEUR LIGNE
                TXA
                CLC
                ADC   #hePLANE
                STA   XVAL2+1

                STY   YVAL1+1         ;VALEUR COLONNE
                TYA
                CLC
                ADC   #wiPLANE
                STA   YVAL2+1

                LDA   #<WPLANE
                STA   ARR1+1
                LDA   #>WPLANE
                STA   ARR1+2

*-----------

XVAL1           LDX   #$00            ;RECHERCHE
CALCUL          LDA   tblHGRl,X       ;DE L'ADRESSE
                STA   zpTO            ;HAUTE ET BASSE
                LDA   tblHGRh,X       ;DE LA LIGNE
                ORA   HPAG
                STA   zpTO+1          ;A AFFICHER

YVAL1           LDY   #$00            ;NOMBRE DE COLONNES

ARR1            LDA   $FFFF           ;VALEUR A CHARGER
                STA   (zpTO),Y        ;SAUVEGARDE DE LA VALEUR
                INC   ARR1+1          ;TOUR SUIVANT
                BNE   ARR2            ;NON, SAUTE
                INC   ARR1+2          ;OUI INCREMENTE

ARR2            INY                   ;INCREMENTE Y
YVAL2           CPY   #$00            ;EST-CE LA FIN??
                BNE   ARR1            ;NON, RECOMMENCE

                INX                   ;INCREMENTE X
XVAL2           CPX   #$00            ;EST-CE LA FIN??
                BNE   CALCUL          ;NON, RECOMMENCE
                RTS                   ;C'EST LA FIN

*-----------------------------
* W = 31 BYTES
* H =  9 LINES

animMESSAGE     =     *

                LDA   yPLANE          ; Do nothing at the beginning
                CMP   #10
                BCS   animMSG1
                RTS

animMSG1        LDA   xMESSAGE        ; Calculate real X
                CLC
                ADC   #5
                STA   xMESSAGE
                TAX

                LDA   yPLANE          ; Where to draw chars in Y
                SEC
                SBC   sMESSAGE
                TAY

                LDA   sMESSAGE        ; Number of chars to draw
                JSR   afficheMESSAGE

                LDA   sMESSAGE
                CMP   #wiMESSAGE
                BEQ   animMSG9

                INC   sMESSAGE        ; Draw one more character

animMSG9        RTS

*-----------

xMESSAGE        DS    1
yMESSAGE        DS    1
sMESSAGE        DFB   1               ; step

wiMESSAGE       =     31
heMESSAGE       =     9

*-----------------------------

afficheMESSAGE  =     *

                STY   YYVAL1+1        ; FIRST COLUMN
                STA   YYVAL2+1        ; NB COLUMNS
                TYA
                CLC
                ADC   YYVAL2+1
                STA   YYVAL2+1        ; CALCULATE LAST

                STX   XXVAL1+1        ;VALEUR LIGNE
                TXA
                CLC
                ADC   #heMESSAGE
                STA   XXVAL2+1

                LDA   #<WMESSAGE
                STA   zpFROM
                LDA   #>WMESSAGE
                STA   zpFROM+1

*-----------

XXVAL1          LDX   #$00            ;RECHERCHE
CALCUL1         LDA   tblHGRl,X       ;DE L'ADRESSE
                STA   zpTO            ;HAUTE ET BASSE
                LDA   tblHGRh,X       ;DE LA LIGNE
                ORA   HPAG
                STA   zpTO+1          ;A AFFICHER

                LDA   zpFROM          ; THE MESSAGE WINDOW
                STA   ARR11+1
                LDA   zpFROM+1
                STA   ARR11+2

YYVAL1          LDY   #$00            ;NOMBRE DE COLONNES

ARR11           LDA   $FFFF           ;VALEUR A CHARGER
                STA   (zpTO),Y        ;SAUVEGARDE DE LA VALEUR
                INC   ARR11+1         ;TOUR SUIVANT
                BNE   ARR22           ;NON, SAUTE
                INC   ARR11+2         ;OUI INCREMENTE

ARR22           INY                   ;INCREMENTE Y
YYVAL2          CPY   #$00            ;EST-CE LA FIN??
                BNE   ARR11           ;NON, RECOMMENCE

                LDA   zpFROM          ; NEXT LINE
                CLC
                ADC   #wiMESSAGE
                STA   zpFROM
                LDA   zpFROM+1
                ADC   #0
                STA   zpFROM+1

                INX                   ;INCREMENTE X
XXVAL2          CPX   #$00            ;EST-CE LA FIN??
                BNE   CALCUL1         ;NON, RECOMMENCE
                RTS                   ;C'EST LA FIN

*-----------------------------

                PUT   COMMON
                PUT   WPLANE
                PUT   WMESSAGE
                PUT   TABLES

*-----------------------------
* COPYRIGHT NOTICE
*-----------------------------

                DS    \

                asc   0d0d
                asc   'Music disk by Krue'0d
                asc   '(c) 2011, Brutal Deluxe Software'0d
                asc   'Code by Antoine Vignau and Olivier Zardini'
                asc   0d0d
                asc   'http://www.brutaldeluxe.fr/'0d0d

                DS    \

