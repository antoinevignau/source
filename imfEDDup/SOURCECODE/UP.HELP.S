*
* I'm fEDD up ;-)
*
* (c) 2012, Brutal Deluxe Software
*

*----------------------------

xHELP       =     0
yHELP       =     7

*----------

doHELP      =     *

            jsr   HOME
            jsr   showHEADER

            ldx   #xHELP
            ldy   #yHELP
            jsr   tabXY

            ldx   #>strHELP
            ldy   #<strHELP
            jsr   printCSTR

]lp         jsr   K7
            bcc   ]lp

            jmp   mainMENU

*----------

strHELP     =     *
* asc '                                        '
            asc   ' iMnAIN SCREEN COMMANDS'0d
            asc   '  O/PTIONS'0d
            asc   '   D: 16-SEC 5.25 DISK TO DSK/PO FILE'0d
* asc '   2: 13-SEC 5.25 DISK TO D13 FILE'0d
            asc   '   R: 3.5 DISK TO NIB FILE'0d
            asc   '   S: 5.25 DISK TO EDD/NIB FILES'0d
            asc   '   CTRL-Q/UIT'0d
* asc ''0d
            asc   ' iOnPTIONS MENU COMMANDS'0d
            asc   '  B/ITS: CHANGE TIMEBITS'0d
            asc   '  C/HANGE ORIGINAL SLOT & DRIVE'0d
            asc   '  E/DD SLOT: CHANGE EDD SLOT'0d
            asc   '  O/VERWRITE: REPLACE EXISTING FILES'0d
            asc   '  N/IT W/RITE FILES: WRITE OR SKIP FILES'
            asc   '  P/REFIX: SELECT DESTINATION FOLDER'0d
            asc   '  R/ETRY 3.5" ERR: READ AGAIN ON ERROR'0d
            asc   '  S/TEP: DEFINE TRACK STEP'0d
            asc   '  T/RACKS: LAST TRACK TO READ'0d
            asc   '  X/PORT AS EDD OF FDI FORMAT'00

*----------

* ds \

