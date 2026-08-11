*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

              mx    %11

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
* DISPLAY MENU
*-----------------------------

*
* Format of the text file is:
*  MENU NAME,
*  ADDRESS OF ICON,
*  PATH NAME TO MUSIC,
*  PATH NAME TO MUSIC INFO,
*  MESSAGE,
*  TEMPO (0..9)
*

*-----------------------------

displayMENU   =     *

              LDA   nbMUSIC
              BNE   displayMENU1
              RTS

* First, draw entries
displayMENU1  =     *
              LDA   currentLIST     ; save index
              STA   indexLIST
              CLC
              ADC   nbMITEMS        ; #3 ...could be improved...
              STA   maxLIST         ; set max item to display

              LDA   #0              ; index to draw on the screen
              STA   indexMENU

]LP           JSR   drawICON
              JSR   drawTEXT

              INC   indexMENU       ; next index on screen

              INC   indexLIST       ; next index from menu
              LDA   indexLIST
              CMP   maxLIST
              BCC   ]LP

* And then, the arrows
              JSR   drawARROWS
              RTS

*-----------

currentLIST   DS    1               ; first to display from menu.txt
currentMENU   DS    1               ; 0..2 current selected entry on screen
oldMENU       DFB   2               ; force old ^^ to 2 to force refresh
indexLIST     DS    1               ; temp index
maxLIST       DS    1               ; max item to display
indexMENU     DS    1               ; temp index

nbMITEMS      DFB   3               ; number of menu items max per screen
nbMAXITEMS    DFB   2               ; number of menu items max per screen - 1

*-----------------------------
* HANDLE MENU
*-----------------------------

handleMENU    =     *

* Start with first entry
              LDA   #0
              STA   curSONG

* Invert the menu and display the message
handle01      JSR   displayMENU
              JSR   invertMENU

* Now handle keypressed
handle02      LDA   KBD             ; wait for key
              BPL   handle02
              BIT   KBDSTRB
              AND   #%0111_1111

              CMP   #chrUQ          ; is it Q or q?
              BEQ   handle03
              CMP   #chrLQ
              BNE   handle04

handle03      LDA   BUTN0           ; Must have OA pressed
              BPL   handle02
              RTS

*-----------

handle04      CMP   #chrRET         ; is it RETURN?
              BNE   handle06

              LDA   nbMUSIC         ; no song, no play
              BEQ   handle05

* song index to play is offset from menu + offset from screen
              LDA   currentLIST
              CLC
              ADC   currentMENU
              STA   curSONG

              JSR   playSONG        ; action: play song
handle05      JMP   handle02

*-----------

handle06      CMP   #chrLEFT        ; Move UP
              BEQ   handleUP
              CMP   #chrUP
              BEQ   handleUP

              CMP   #chrRIGHT       ; Move DOWN
              BEQ   handleDOWN
              CMP   #chrDOWN
              BEQ   handleDOWN

              JMP   handle02

*-----------

handleUP      LDA   currentMENU
              BEQ   handleUP1
              DEC   currentMENU
              JMP   handle01

handleUP1     LDA   currentLIST
              BEQ   handleUP2
              DEC   currentLIST
handleUP2     JMP   handle01

*-----------

handleDOWN    LDA   currentMENU
              CMP   nbMAXITEMS      ; #2 max entries in HGR screen
              BEQ   handleDOWN1
              INC   currentMENU
              JMP   handle01

handleDOWN1   LDA   nbMUSIC
              SEC
              SBC   currentLIST
              CMP   nbMITEMS        ; #3 cant go further
              BCC   handleDOWN2
              BEQ   handleDOWN2
              INC   currentLIST
handleDOWN2   JMP   handle01

*-----------------------------

invertMENU    =     *

              LDA   nbMUSIC
              BNE   invMENU1
              RTS

* Different menus?
invMENU1      LDA   currentMENU
              CMP   oldMENU
              BNE   invMENU2
              RTS

* Undraw previous frame
invMENU2      LDX   #hgrBLACK
              LDY   oldMENU
              JSR   drawFRAME

* And draw new frame
              LDX   #hgrORANGE
              LDY   currentMENU
              JSR   drawFRAME

* Save current menu selection
              LDA   currentMENU
              STA   oldMENU
              RTS

*-----------

drawFRAME     =     *

              JSR   SETHCOL         ; set HGR color

              TYA                   ; now prepare frame drawing
              ASL
              TAY
              LDA   tblFRAME,Y
              STA   zpFROM
              LDA   tblFRAME+1,Y
              STA   zpFROM+1

* With HPLOT and HLIN we need the following:

              JSR   getFROM
              TAX                   ; low X in X
              JSR   getFROM
              LDY   #0              ; high X in Y
              JSR   HPLOT           ; Y in A

]LP           JSR   getFROM
              BCS   drawFRAME1

              PHA
              JSR   getFROM
              TAY                   ; Y in Y

              LDX   #0              ; high X in X
              PLA                   ; low X in A
              JSR   HLIN
              JMP   ]LP

drawFRAME1    RTS

*-----------

getFROM       LDY   #0              ; Just get a byte
              LDA   (zpFROM),Y
              CMP   #-1
              BEQ   getFROM2

              INC   zpFROM
              BNE   getFROM1
              INC   zpFROM+1

getFROM1      CLC
              RTS
getFROM2      SEC
              RTS

*-----------

tblFRAME      DA    FRAME0,FRAME1,FRAME2

FRAME0        DFB   1,12
              DFB   137,12
              DFB   137,62
              DFB   1,62
              DFB   1,12
              DFB   -1

FRAME1        DFB   1,69
              DFB   137,69
              DFB   137,119
              DFB   1,119
              DFB   1,69
              DFB   -1

FRAME2        DFB   1,126
              DFB   137,126
              DFB   137,176
              DFB   1,176
              DFB   1,126
              DFB   -1

*-----------------------------

drawICON      =     *

              LDA   indexLIST       ; Get icon pointer
              ASL                   ; of the song to display
              TAX
              LDA   tblENTRY,X
              STA   zpFROM
              LDA   tblENTRY+1,X
              STA   zpFROM+1

              LDY   #iICON          ; The icon address is set
              LDA   (zpFROM),Y
              STA   ARR1+1
              INY
              LDA   (zpFROM),Y
              STA   ARR1+2

              LDA   indexMENU       ; Now set where to display
              ASL
              TAX
              LDA   tblICON,X
              STA   zpFROM
              LDA   tblICON+1,X
              STA   zpFROM+1

              JSR   drawIT          ; And draw!
              RTS

*----------------------------- Draw something

drawTEXT      =     *

              LDA   indexLIST       ; Get pointer to song
              ASL
              TAX
              LDA   tblENTRY,X
              STA   zpFROM
              LDA   tblENTRY+1,X
              STA   zpFROM+1

* And save it
              LDY   #iTITLE
              LDA   (zpFROM),Y
              TAX                   ; save in X
              INY
              LDA   (zpFROM),Y
              STA   zpFROM+1        ; We have the pointer
              STX   zpFROM          ; to the song name

* Now, zero title name
              LDY   #16-1
]LP           LDA   strEMPTYNAME,Y
              STA   strSONGNAME,Y
              DEY
              BPL   ]LP

* Now we recopy title name
              LDY   #0
]LP           LDA   (zpFROM),Y
              CMP   #chrEOF         ; until $
              BEQ   drawTEXT1
              STA   strSONGNAME,Y
              INY
              CPY   #15             ; max 15 chrs
              BCC   ]LP

* Now set where to display
drawTEXT1     LDA   indexMENU       ; Now set where to display
              ASL
              TAX
              LDA   tblTEXT,X
              STA   zpFROM
              LDA   tblTEXT+1,X
              STA   zpFROM+1

              LDY   #0              ; Get X
              LDA   (zpFROM),Y
              TAX
              INY                   ; Get Y
              LDA   (zpFROM),Y
              TAY                   ; Tabula rasa
              JSR   setTABULATION

              LDX   #>strSONGNAME
              LDY   #<strSONGNAME
              JSR   printSTRING

              RTS

*-----------------

strSONGNAME   ASC   '               ,'
strEMPTYNAME  ASC   '               ,'

*----------------------------- Draw something

drawARROWS    =     *


* Do up arrow
              LDX   #0              ; no up arrow
              LDA   currentLIST     ; first in screen is first of list
              BEQ   drawARR1
              INX                   ; yes, up arrow
drawARR1      JSR   drawARROW

* Do down arrow
              LDX   #2              ; no down arrow
              LDA   nbMUSIC
              CMP   maxLIST
              BEQ   drawARR2
              INX                   ; yes, down arrow
drawARR2      =     *

* And draw it, we don't call the routine, we save bytes...

*-----------------

drawARROW     LDA   tblARROWl,X
              STA   ARR1+1
              LDA   tblARROWh,X
              STA   ARR1+2

              TXA
              ASL
              TAX
              LDA   tblARROW,X
              STA   zpFROM
              LDA   tblARROW+1,X
              STA   zpFROM+1

* And draw it, we don't call the routine, we save bytes...

*----------------------------- Draw something

drawIT        =     *

              LDY   #0              ; 0
              LDA   (zpFROM),Y
              STA   XVAL1+1         ; first X
              INY                   ; 1
              CLC
              ADC   (zpFROM),Y
              STA   XVAL2+1         ; max X

              INY                   ; 2
              LDA   (zpFROM),Y
              STA   YVAL1+1         ; first Y
              INY                   ; 3
              CLC
              ADC   (zpFROM),Y
              STA   YVAL2+1         ; max Y

*---

YVAL1         LDX   #$00            ;RECHERCHE
CALCUL        LDA   tblHGRl,X       ;DE L'ADRESSE
              STA   zpTO            ;HAUTE ET BASSE
              LDA   tblHGRh,X       ;DE LA LIGNE
              ORA   HPAG
              STA   zpTO+1          ;A AFFICHER

XVAL1         LDY   #$00            ;NOMBRE DE COLONNES

ARR1          LDA   $FFFF           ;VALEUR A CHARGER
              STA   (zpTO),Y        ;SAUVEGARDE DE LA VALEUR
              INC   ARR1+1          ;TOUR SUIVANT
              BNE   ARR2            ;NON, SAUTE
              INC   ARR1+2          ;OUI INCREMENTE

ARR2          INY                   ;INCREMENTE Y
XVAL2         CPY   #$00            ;EST-CE LA FIN??
              BCC   ARR1            ;NON, RECOMMENCE

              INX                   ;INCREMENTE X
YVAL2         CPX   #$00            ;EST-CE LA FIN??
              BCC   CALCUL          ;NON, RECOMMENCE
              RTS                   ;C'EST LA FIN

*-----------------------------

* Pointer to icon & text coordinates
tblICON       DA    ICON1,ICON2,ICON3
tblTEXT       DA    TEXT1,TEXT2,TEXT3

* X, width, Y, height
ICON1         DFB   5,10,15,35
ICON2         DFB   5,10,72,35
ICON3         DFB   5,10,129,35

TEXT1         DFB   1,52
TEXT2         DFB   1,109
TEXT3         DFB   1,166

