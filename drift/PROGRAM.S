*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

               mx    %11

               org   $1000
               lst   off
               typ   BIN
               dsk   DATA/PROGRAM

*
* $0800 : menu.txt
* $0c00 : prodos buffer
* $1000 : main program
* $2000 : hgr
* $4000 : hgr2
* $4000 : music info
* $6000 : icons
* $7000 : musics
*

*-----------------------------
* COMMON EQUATES
*-----------------------------

               PUT   EQUATES

*-----------------------------
* MAIN
*-----------------------------

               JSR   initALL
               JSR   playALL
               JMP   quitALL

*-----------------------------
* PERFORM ALL INITS
*-----------------------------

initALL        =     *

               JSR   iigsOFF

* Load menu page at $0800
               LDA   #>ptrMENU
               LDX   #>strMENUTXT
               LDY   #<strMENUTXT
               CLC
               JSR   loadFILE

* Load title page at $4000
               LDA   #>ptrHGR2
               LDX   #>strMENU
               LDY   #<strMENU
               CLC
               JSR   loadFILE

               RTS

*-----------------------------
* THE MAIN PROGRAM IS HERE
*-----------------------------

playALL        =     *

* Prepare the menu
               JSR   analyzeMENU

* Draw the menu on the HGR2 screen
               LDA   #>ptrHGR2
               STA   HPAG
               JSR   displayMENU
               JSR   showHGR

* Manage the menu
               LDA   #>ptrHGR1
               STA   HPAG
               JSR   handleMENU

               RTS

*-----------------------------
* ANALYZE MENU
*-----------------------------

*
* Format of the text file is:
*  MENU NAME,
*  ICON PATH,
*  PATH NAME TO MUSIC,
*  PATH NAME TO MUSIC INFO,
*  MESSAGE,
*  TEMPO (0..9)
*

analyzeMENU    =     *

               LDA   #0
               STA   nbMUSIC

* Start of MENU.TXT file
               LDA   #<ptrMENU
               STA   zpDEP
               LDA   #>ptrMENU
               STA   zpDEP+1

* Work on the icon info
               LDA   #<ptrICONS
               STA   proREAD+2
               lda   #>ptrICONS
               STA   proREAD+3

* Set pointer to destination buffer
]LP            LDA   nbMUSIC
               ASL
               TAX
               LDA   tblENTRY,X
               STA   zpARR
               LDA   tblENTRY+1,X
               STA   zpARR+1

* Handle one line and loop
               JSR   handleLINE
               BCS   analyze90

               INC   nbMUSIC
               BNE   ]LP

* Prepare menu limits
analyze90      LDA   nbMUSIC       ; We may have less than 3 songs
               CMP   nbMITEMS      ; We must then limit the number to display
               BCS   analyze99

               STA   nbMITEMS
               SEC
               SBC   #1
               STA   nbMAXITEMS

analyze99      RTS

*-----------

handleLINE     =     *

* First check EOF value

               LDY   #0
               LDA   (zpDEP),y
               CMP   #chrEOF
               BNE   handleOK
               SEC
               RTS

* Copy address of song name
handleOK       LDA   zpDEP         ; Y=0
               STA   (zpARR),Y
               INY                 ; 1
               LDA   zpDEP+1
               STA   (zpARR),y

               JSR   nextSEP

* Copy address of icon path name
               JSR   loadICON      ; load icon
                                   ; we assume icon exists!!!

               LDY   #iICON        ; 2
               LDA   proREAD+2     ; ptr to icon file
               STA   (zpARR),Y
               INY                 ; 3
               LDA   proREAD+3
               STA   (zpARR),y

               LDA   proREAD+2     ; calculate
               CLC                 ; next address
               ADC   proREAD+4     ; for
               STA   proREAD+2     ; next icon
               LDA   proREAD+3
               ADC   proREAD+5
               STA   proREAD+3

               JSR   nextSEP

* Copy address of music path name
               LDY   #iMUSIC       ; 4
               LDA   zpDEP
               STA   (zpARR),Y
               INY                 ; 5
               LDA   zpDEP+1
               STA   (zpARR),y

               JSR   nextSEP

* Copy address of music info path name
               INY                 ; 6
               LDA   zpDEP
               STA   (zpARR),Y
               INY                 ; 7
               LDA   zpDEP+1
               STA   (zpARR),y

               JSR   nextSEP

* Copy address of message
               INY                 ; 8
               LDA   zpDEP
               STA   (zpARR),Y
               INY                 ; 9
               LDA   zpDEP+1
               STA   (zpARR),y

               JSR   nextSEP

* Copy address of tempo
               INY                 ; 10
               LDA   zpDEP
               STA   (zpARR),Y
               INY                 ; 11
               LDA   zpDEP+1
               STA   (zpARR),y

               JSR   nextSEP

               CLC                 ; Say "Good"
               RTS

*-----------

nextSEP        TYA                 ; Save Y
               PHA

]LP            JSR   nextDEP       ; Move to next menu char

               LDY   #0            ; Do we have a separator?
               LDA   (zpDEP),Y
               CMP   #chrCOMMA     ; Yes, a comma or a return
               BEQ   nextSEP99
               CMP   #chrRET
               BEQ   nextSEP99
               CMP   #chrEOF       ; or a $
               BNE   ]LP           ; Otherwise, loop

               JSR   nextDEP       ; A trick for song name

nextSEP99      PLA                 ; Restore Y
               TAY

*----------- NOTE: no RTS above, done on purpose

nextDEP        INC   zpDEP         ; Move pointer
               BNE   nextDEP99
               INC   zpDEP+1
nextDEP99      RTS

*-----------------------------

loadICON       =     *

               LDY   #0
]LP            LDA   (zpDEP),Y
               CMP   #chrCOMMA
               BEQ   loadICON1
               STA   strMUSIC+1,Y
               INY
               BNE   ]LP

loadICON1      STY   strMUSIC      ; The pathname length

* Load the icon
               LDX   #>strMUSIC
               LDY   #<strMUSIC
               SEC
               JSR   loadFILE
               RTS

copyrow        =     *

               ldy   #$00
]lp
               lda   (zpFROM),y
               sta   (zpTO),y
               iny
               cpy   #$78
               bne   ]lp

               lda   zpFROM+0
               eor   #$80
               sta   zpFROM+0
               bne   copyrow0
               inc   zpFROM+1

copyrow0       =     *

               lda   zpTO+0
               eor   #$80
               sta   zpTO+0
               bne   copyrow1
               inc   zpTO+1

copyrow1       =     *
               rts


*-----------------------------

playSONG       =     *

* Get the pointer to the pathname
               LDA   curSONG
               ASL
               TAX
               LDA   tblENTRY,X
               STA   zpDEP
               LDA   tblENTRY+1,X
               STA   zpDEP+1

*----------- Handle music

               LDY   #iMINFO
               LDA   (zpDEP),Y
               STA   zpARR
               INY
               LDA   (zpDEP),Y
               STA   zpARR+1

* Now copy string

               LDY   #0
]LP            LDA   (zpARR),Y
               CMP   #chrCOMMA
               BEQ   playSONG1
               STA   strMUSIC+1,Y
               INY
               BNE   ]LP

playSONG1      STY   strMUSIC      ; The pathname length

* Load the music info song at $4000
               LDA   #>ptrMINFO
               LDX   #>strMUSIC
               LDY   #<strMUSIC
               CLC
               JSR   loadFILE

*----------- Now prepare text screen

               JSR   HOME

               LDA   #<ptrMINFO
               STA   zpFROM
               LDA   #>ptrMINFO
               STA   zpFROM+1

               LDA   #<ptrTEXT
               STA   zpTO
               LDA   #>ptrTEXT
               STA   zpTO+1

               jsr   copyrow
               jsr   copyrow
               jsr   copyrow
               jsr   copyrow
               jsr   copyrow
               jsr   copyrow
               jsr   copyrow
               jsr   copyrow


;]lp LDY #0
                                   ;LDA (zpFROM),y
                                   ;CMP #chrEOF
                                   ;BEQ textSONGok

                                   ;ORA #$80 ; Set bit 7
                                   ;JSR COUT ; Print out char



                                   ;INC zpFROM ; Loop until
                                   ;INC zpTO ; end of file
                                   ;BNE ]lp ; end of text page 1
                                   ;INC zpFROM+1 ; or $ encountered
                                   ;INC zpTO+1

                                   ;LDA zpTO+1
                                   ;CMP #>ptrMENU
                                   ;BCC ]lp

*----------- Handle music

textSONGok     LDY   #iMUSIC
               LDA   (zpDEP),Y
               STA   zpARR
               INY
               LDA   (zpDEP),Y
               STA   zpARR+1

* Now copy string

               LDY   #0
]LP            LDA   (zpARR),Y
               CMP   #chrCOMMA
               BEQ   playSONG2
               STA   strMUSIC+1,Y
               INY
               BNE   ]LP

playSONG2      STY   strMUSIC      ; The pathname length

* Load the music song at $7000
               LDA   #>ptrMUSIC
               LDX   #>strMUSIC
               LDY   #<strMUSIC
               CLC
               JSR   loadFILE

*-----------

* Now handle the player

               LDY   #iPLAYER
               LDA   (zpDEP),Y
               STA   zpARR
               INY
               LDA   (zpDEP),Y
               STA   zpARR+1

               LDA   #0
               STA   fgHGR
               STA   fgQUIT        ; force quit for player 2

               LDY   #0
               LDA   (zpARR),Y     ; From a char value
               CMP   #'0'
               BNE   playSONG3

               JSR   PLAYER
               CLC
               BCC   playSONG9

playSONG3      JSR   PLAYER2

playSONG9      JSR   setHGRon      ; force HGR mode

               LDA   #0
               STA   fgHGR
               RTS

*-----------------------------

fgQUIT         DS    1             ; force quit for player 2

curSONG        DS    1
nbMUSIC        DS    1             ; number of musics

tblENTRY       DA    ptrENTRY0,ptrENTRY1,ptrENTRY2,ptrENTRY3
               DA    ptrENTRY4,ptrENTRY5,ptrENTRY6,ptrENTRY7
ptrENTRY0      DS    12            ; a buffer
ptrENTRY1      DS    12            ; a buffer
ptrENTRY2      DS    12            ; a buffer
ptrENTRY3      DS    12            ; a buffer
ptrENTRY4      DS    12            ; a buffer
ptrENTRY5      DS    12            ; a buffer
ptrENTRY6      DS    12            ; a buffer
ptrENTRY7      DS    12            ; a buffer

*
* Buffer is like this...
*  ptrNAME    DS 2  pointer to song name
*  ptrICON    DS 2  pointer to icon address
*  ptrPATH    DS 2  pointer to music path name
*  ptrMINFO   DS 2  pointer to music info path name
*  ptrMESSAGE DS 2  pointer to message
*  thePLAYER  DS 2  pointer to player type
*

*-----------------------------
* SET TABULATIONS
*-----------------------------

setTABULATION  =     *

               STX   XB            ; set X coordinate
               STY   YB            ; set Y coordinate
               RTS

*-----------------------------
* PRINT STRING
*-----------------------------

printSTRING    =     *

               STY   zpFROM        ; string pointer
               STX   zpFROM+1

]LP            LDY   #$00          ;TEXTE
               LDA   (zpFROM),Y    ;RETOUR
               CMP   #chrCOMMA
               BEQ   printSTR99    ;SI 00
               JSR   printCHAR     ;AFFICHE

               JSR   nextFROM      ; get next char
               JMP   ]LP           ;BOUCLE

printSTR99     RTS

*-----------

nextFROM       INC   zpFROM        ; move next source
               BNE   nextFROM99
               INC   zpFROM+1
nextFROM99     RTS

*-----------

printCHAR      SEC                 ;SOUSTRAIT A0
               SBC   #chrSPACE     ;POUR L'EQUIVALENCE

               TAX                 ;TABLE/CARACTERE
               LDA   tblFONTl,X    ;CARACTERES
               STA   printCHAR2+1  ;CORRESPONDANT
               LDA   tblFONTh,X    ;ADRESSE BASSE
               STA   printCHAR2+2  ;ET HAUTE

               LDA   YB            ; HGR line
               TAX                 ; move to X (start line)
               CLC
               ADC   #$08          ; end line
               STA   printCHAR4+1

               LDY   XB

]LP            LDA   tblHGRl,X     ;CHARGE LA LIGNE
               STA   zpTO          ;D'ARRIVEE BASSE
               LDA   tblHGRh,X     ;ET EVIDEMMENT
               ORA   HPAG          ;
               STA   zpTO+1        ;HAUTE

printCHAR2     LDA   $FFFF         ;AFFICHE
               STA   (zpTO),Y      ;YB

               INC   printCHAR2+1  ;BYTE+1
               BNE   printCHAR3
               INC   printCHAR2+2

printCHAR3     INX                 ;LIGNE+1
printCHAR4     CPX   #$FF
               BNE   ]LP

               INC   XB            ; next column
               RTS                 ; end of work

*-----------

XB             DS    1             ; from X
YB             DS    1             ; from Y

*-----------------------------
* END OF PROGRAM / QUIT
*-----------------------------

quitALL        =     *

               JSR   setHGRoff     ; Back to text mode
               JSR   iigsON        ; Restore IIgs speed

               JSR   PRODOS        ; Bye
               DFB   $65
               DA    proQUIT

               BRK                 ; ...just in case

*-----------------------------
* HGR ROUTINES
*-----------------------------

switchHGR      LDA   fgHGR         ; Switch HGR on or off
               EOR   #1
               STA   fgHGR
               BNE   setHGRoff

setHGRon       BIT   CLR80COL      ; HGR mode on
               BIT   TXTPAGE1
               BIT   TXTCLR
               BIT   MIXCLR
               BIT   HIRES
               RTS

setHGRoff      BIT   CLR80COL      ; HGR mode off
               BIT   TXTPAGE1
               BIT   LORES
               BIT   MIXSET
               BIT   TXTSET
               RTS


fgHGR          DS    1

*-----------------------------
* A LITTLE HGR ANIMATION
*-----------------------------

showHGR        =     *

               LDY   #$00          ;VALEUR DU
H0             LDA   MASK,Y        ;MASQUE POUR
               STA   H4+1          ;LE CODAGE

               LDA   #$40          ;DE LA PAGE
               STA   H3+2          ;HGR2
               LDA   #$20          ;VERS LA PAGE
               STA   H5+2          ;HGR1

H2             LDX   #$00          ;DEPLACE TOUTE
H3             LDA   $4000,X       ;LA ZONE DE
H4             AND   #$00          ;$4000-$5FFF
H5             STA   $2000,X       ;VERS $2000
               INX                 ;AVEC EN PASSANT
               BNE   H3            ;LE CODAGE

               INC   H3+2          ;CONTINUE
               INC   H5+2          ;EN INCREMENTANT
               LDA   H5+2          ;LES ADRESSES
               CMP   #$40          ;HAUTES DE 1
               BNE   H2            ;JUSQU'A LA FIN

               LDA   #$30          ;ROUTINE
               JSR   $FCA8         ;D'ATTENTE

               INY                 ;FAIT 8
               CPY   #$08          ;TOURS DE
               BNE   H0            ;CODAGE

               RTS                 ;LA FIN!!!!!

*-----------

MASK           HEX   0103070F
               HEX   1F3F7FFF

*-----------------------------
* LOAD FILE
*-----------------------------

loadFILE       =     *

* Set file pointer
               STY   proOPEN+1
               STX   proOPEN+2

* Skip load address if carry set
               BCS   loadFILE1

* Set load address
               STA   proREAD+3
               LDA   #0
               STA   proREAD+2

* Open the file
loadFILE1      JSR   PRODOS
               DFB   $C8
               DA    proOPEN
               STA   proERR

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
               STA   proERR
* Close file
               JSR   PRODOS
               DFB   $CC
               DA    proCLOSE
               STA   proERR
               RTS

*-----------

strMENU        str   'DATA/MENU'
strMENUTXT     str   'DATA/MENU.TXT'
strMUSIC       ds    32

*-----------

proERR         DS    1

proQUIT        DFB   $04           ; 00 num_parms
               DS    1             ; 01 quit_type
               DS    2             ; 02 pathname
               DS    1             ; 04 reserved
               DS    2             ; 05 reserved

proSETPFX      DFB   $01           ; 00 num_parms
               DA    $0280         ; 01 prefix

proOPEN        DFB   $03           ; 00 num_parms
               DS    2             ; 01 pathname
               DA    ptrBUFFER     ; 03 io_buffer
               DS    1             ; 05 ref_num

proREAD        DFB   $04           ; 00 num_parms
               DS    1             ; 01 ref_num
               DS    2             ; 02 data_buffer
               DS    2             ; 04 request_count
               DS    2             ; 06 transfer_count

proCLOSE       DFB   $01           ; 00 num_parms
               DS    1             ; 01 ref_num

proGETEOF      DFB   $02           ; 00 num_parms
               DS    1             ; 01 ref_num
               DS    3             ; 02 eof

*-----------------------------
* OTHER FILES
*-----------------------------

               PUT   COMMON
               PUT   FONT
               PUT   TABLES
               PUT   MENU
               PUT   WARROWS

               DS    \
               PUT   PLAYER2
               DS    \
               PUT   PLAYER
               DS    \

