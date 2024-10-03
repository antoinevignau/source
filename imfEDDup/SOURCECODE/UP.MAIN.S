*
* I'm fEDD up ;-)
*
* (c) 2012-17, Brutal Deluxe Software
* w/code by John Brooks
* w/text by Krue
*
* http://www.brutaldeluxe.fr/
*

* V1.1 - AV - 2/OCT/2012
*  - corrects some typ0
*  - adds the D/isk copy option
*  - adds a $28 40-track option
*  - smooth arm calibration
*
* V1.2 - AV - 1/NOV/2012
*  - now supports DOS 3.2 disks
*  - unreleased
*
* V2.0 - AV/JB - 27/JAN/2016
*  - bugs in UP.PREFIX corrected
*  - add /R/ip feature for 3.5" NIB file
*    using John Brooks code
*  - add /W/ option to skip writing 5.25" NIB files if we have an EDD only
*  - add /N/ option to skip writing NIT files (3.5" and 5.25")
*  - add /T/ option to skip writing timing bits files (5.25" & 3.5")
*  - add /R/ option to re-read partially read 3.5" disk
*  - (4am request) options are now loaded and saved!
*  - (4am request) display destination volume free blocks
*  - (4am request) see if there's enough room to save files before copying
*
* V2.1 - AV - 11/MAY/2016
*  - NIB files were created even if we said no
*  - config file on a cold boot was not loaded
*  - (4am request) calc free blocks B4 checking needed blocks
*    I did that after, ahem...
*
* V2.2 - AV - 9/AUG/2016
*  - System loads CODE.IFU located at $800
*    that gives more room to the beast
*  - Prefix acts as a catalog
*    You can also delete unlocked BIN files only!
*  - Using an EDD card on a IIgs w/4MB loads all data in memory
*    That faster process may help create sync'ed EDD files
*  - A BRA was still present in the UP.PREFIX code
*  - Save EDD files as FDI files
*
* V2.3 - AV - 4/2017
*  - Using an EDD card on a IIe w/RamWorks loads all data in memory
*    That process may help create sync'ed EDD files, it is not faster
*  - Added more messages: success/failure
*
* V - AV -
*  - Activate that damn 13-SEC code
*  - When John is ready, add his IIgs code for 5.25" disks
*

             xc
             xc
             mx    %11

             org   $800
             typ   BIN
             dsk   CODE.IFU
             lst   off

*----------------------------
* EQUATES & FRIENDS
*----------------------------

ptrPREFIX    =     $0280
ptrOPTPFX    =     $0300

LBB00        =     $b000
LBC00        =     LBB00+$0100
ptrBUFFER    =     LBC00+$0100

L4000        =     $4000
E4000        =     L4000+$4000       ; should have been $3F00
L7800        =     L4000+$3800
L9400        =     L7800+$1C00
LB000        =     L7800+$3800

fileEDD      =     0
fileNIB      =     fileEDD+2
fileTIM      =     fileNIB+2
fileFDI      =     fileTIM+2         ; v2.2
fileDSK      =     fileFDI+2
filePO       =     fileDSK+2
fileD13      =     filePO+2
fileD35      =     fileD13+2
fileT35      =     fileD35+2

*---------- IIgs

ptrNIB       =     $020000           ; first bank for nibbles
ptrNIB2      =     $170000
ptrNIT       =     $180000           ; first bank for timing
ptrNIT2      =     $2D0000

*----------

xCURSOR      =     3
yCURSOR      =     8

xMENU        =     0
yMENU        =     7

xTRACK       =     23
yTRACK       =     6

xTRACK2      =     29
yTRACK2      =     6

xPSTEP       =     36
yPSTEP       =     8

xPSTEP2      =     36
yPSTEP2      =     10

xFILENAME    =     11
yFILENAME    =     21

xMESSAGE     =     12                ; Say READ/WRITE
yMESSAGE     =     19                ; for 3.5" disks

*----------

slotMASK     =     %0000_0111
driveMASK    =     %0000_0011

maxLENGTH    =     11                ; length of filename

keyTAB       =     $89
keyRET       =     $8D
keyESC       =     $9B
keySPC       =     $A0
keyDEL       =     $FF
keySLASH     =     '/'
maskLOWER    =     $DF

*----------

CH           =     $24
CV           =     $25
INVFLG       =     $32

PRODOS       =     $BF00
MACHID       =     $BF98

KBD          =     $C000
CLR80COL     =     $C000
SET80COL     =     $C001
RDMAINRAM    =     $C002
RDCARDRAM    =     $C003
WRMAINRAM    =     $C004
WRCARDRAM    =     $C005
SETSTDZP     =     $C008
SETALTZP     =     $C009
KBDSTRB      =     $C010
RDLCBNK2     =     $C011
RD80COL      =     $C018
BANKSEL      =     $C073
ROMIN        =     $C081
LCBANK1      =     $C08B
BASIC        =     $E000

INIT         =     $FB2F
SETTXT       =     $FB39
TABV         =     $FB5B
SETPWRC      =     $FB6F
BELL1        =     $FBDD
HOME         =     $FC58
WAIT         =     $FCA8
RDKEY        =     $FD0C
PRBYTE       =     $FDDA
COUT         =     $FDED
IDROUTINE    =     $FE1F
SETINV       =     $FE80
SETNORM      =     $FE84
SETKBD       =     $FE89
SETVID       =     $FE93
BELL         =     $FF3A
RESTORE      =     $FF3F
SAVE         =     $FF4A
MONZ         =     $FF69

OS_BOOT      =     $E100BD           ; 0=P8
NumBanks     =     $E11624           ; #$60 means 6MB
minBANKS     =     $30               ; for 3MB

*----------

dpY          =     $f9
dpX          =     dpY+1
dpA          =     dpX+1
dpTO         =     dpA+1
dpFROM       =     dpTO+2

*----------------------------
* MAIN PROOF OF CONCEPT CODE
*----------------------------

             lda   PRODOS            ; Are we under ProDOS?
             cmp   #$4C
             beq   OK1
             jmp   BASIC

*----------------------------

OK1          lda   #<mainMENU        ; The reset vector
             sta   $3f2
             lda   #>mainMENU
             sta   $3f3
             jsr   SETPWRC

             jsr   readCONFIG        ; Yes, get the prefix

*----------------------------

mainMENU     jsr   SETNORM           ; Set a std text mode
             jsr   SETVID
             jsr   SETTXT
             jsr   HOME

*----------------------------
* THE MAIN LOOP PART
*----------------------------

             jsr   showMAIN          ; display splash screen
             jsr   showPHASE

*----------

mainFREE     jsr   showFREE

mainLOOP     ldx   #xCURSOR          ; wait for key
             ldy   #yCURSOR
             jsr   tabXY
             jsr   RDKEY

             and   #maskLOWER        ; lowercase

             ldx   #0
]lp          cmp   tblKEY,x
             beq   foundKEY
             inx
             cpx   #tblDOKEY-tblKEY
             bcc   ]lp

             jsr   BELL
             jmp   mainLOOP

foundKEY     txa
             asl
             tax
             lda   tblDOKEY,x
             sta   dpTO
             lda   tblDOKEY+1,x
             sta   dpTO+1

foundADR     jmp   (dpTO)

*----------

tblKEY       asc   "SODR"
             hex   98
             hex   9f
             hex   91

tblDOKEY     da    doCOPY,doOPTIONS
             da    doDSK
* da doDSK32
             da    doDSK35
             da    doMONZ            ; ctrl-X: go to the monitor!
             da    doHELP            ; ctrl-?: help
             da    doQUIT            ; ctrl-q: quit

*----------------------------
* THE MONITOR PART
*----------------------------

doMONZ       jsr   HOME

             ldx   #>strMONITOR
             ldy   #<strMONITOR
             jsr   printSTR
             jmp   MONZ

strMONITOR   str   'Type 800G to re-enter'

*----------------------------
* THE QUIT PART
*----------------------------

doQUIT       jsr   PRODOS
             dfb   $65
             da    proQUIT

             brk   $bd

*----------------------------
* THE FILE PART
*----------------------------

doFILE       ldx   #xFILENAME
             stx   dpX
             ldy   #yFILENAME
             jsr   tabXY

             ldx   #>fileEMPTY
             ldy   #<fileEMPTY
             jsr   printSTR

             ldy   #0                ; length
             sty   dpY

]lp          ldx   dpX               ; screen index
             ldy   #yFILENAME
             jsr   tabXY
             jsr   RDKEY
             cmp   #keyRET
             beq   doFILEend
             cmp   #keyDEL
             bne   doFILE1

*--- Delete

             ldy   dpY
             beq   ]lp

             lda   #keySPC
             jsr   COUT

             dec   dpY
             dec   dpX
             bne   ]lp

doFILE1      jsr   checkCHAR
             bcs   ]lp

             inc   dpX
             inc   dpY               ; length++
             lda   dpY
             cmp   #maxLENGTH
             bne   ]lp

doFILEend    lda   dpY
             sta   fileNAME
             bne   doFILEend1

             lda   #keySPC
             jsr   COUT

doFILEend1   rts

*----------

checkCHAR    sta   dpA

             cmp   #"."
             beq   checkFIRST
             cmp   #"0"
             bcc   checkKO
             cmp   #"9"+1
             bcc   checkFIRST

             cmp   #"A"
             bcc   checkKO
             cmp   #"Z"+1
             bcc   checkOK

             and   #maskLOWER        ; lowercae
             cmp   #"A"
             bcc   checkKO
             cmp   #"Z"+1
             bcc   checkOK
             bcs   checkKO

checkFIRST   ldy   dpY               ; Begin with a letter
             beq   checkKO

checkOK      ldy   dpY
             sta   fileNAME+1,y

             jsr   COUT              ; output the char

             clc
             rts
checkKO      sec
             rts

*----------------------------
* THE COPY PART (EDD 5.25")
*----------------------------

doCOPY       lda   DCCSLOT           ; same slots
             cmp   POS               ; bad user ;-)
             beq   theEND

* V2.1: calc free blocks
             jsr   showFREE          ; calc free blocks
             jsr   checkVOL525       ; calc required blocks
             bcs   theEND            ; handle fgOVERWRITE

             jsr   doFILE

             sec                     ; to display the error
             lda   fileNAME          ; empty filename
             beq   theEND

             jsr   initEDD

             jsr   createFILES
             bcs   theEND

* V2.1 - Moved the routine here to calculate the available space
             jsr   showFREE          ; calculate free space
             jsr   calcVOLFREE2      ; enough room to save files?
             bcs   theEND            ; fgOVERWRITE not taken

* V2.3 - Clear message area

             ldx   #>msgEMPTY
             ldy   #<msgEMPTY
             jsr   doDSK35PRINT

* V2.2 - Use a faster routine with a IIgs with a EDD card only!
* V2.3 - Same with a //e with 8MB of RAM

             lda   DCCSLOT           ; no EDD, no fast copy!
             beq   doCOPY1

             lda   fgIIE             ; v2.3
             bne   iieCOPY           ; we have EDD, do we have a 3M IIe?

             lda   fgIIGS            ; we have EDD, do we have a 3M IIgs?
             beq   doCOPY1           ; no
             jmp   iigsCOPY          ; yes!

doCOPY1      =     *

]lp          jsr   K7
             bcs   theEND

             jsr   MTRON

             lda   STARTTRK
             jsr   ARMV
             jsr   showPHASE

             lda   DCCSLOT
             bne   copyEDD
             jsr   TDUMPW            ; normal bitcopy
             jmp   noEDD
copyEDD      jsr   DCCDUMP           ; dump with EDD card

noEDD        jsr   MTROFF

             jsr   saveFILES
             bcs   theEND

             jsr   NTRKCALC
             sta   STARTTRK
             bcc   ]lp

*----------------------------
* SOME MESSAGES DISPLAY (for Brian)
*----------------------------

theEND       bcs   theEND1

             ldx   #>msgSUCCESS
             ldy   #<msgSUCCESS
             jmp   theEND2

theEND1      ldx   #>msgFAILURE
             ldy   #<msgFAILURE
theEND2      jsr   doDSK35PRINT

             jsr   BELL
             jmp   mainFREE

*---------- v2.3 - Display messages for Brian

msgFAILURE   str   ' FAILURE '
msgSUCCESS   str   ' SUCCESS '

*----------

K7           lda   KBD
             bmi   K8
             clc
             rts
K8           sta   KBDSTRB
             and   #maskLOWER        ; lowercase
             sec
             rts

*----------------------------
* THE IIE COPY PART (EDD 5.25")
* V2.3 - New, use a IIe to read all
*----------------------------

iieCOPY      =     *

* Files are created
* All requirements checked

             jsr   iieINITRAM
             jsr   MTRON

]lp          jsr   K7
             bcs   iieEND

             lda   STARTTRK
             jsr   ARMV
             jsr   showPHASE

* lda DCCSLOT
* bne iigsEDD
* jsr TDUMPW ; normal bitcopy
* jmp noiigsEDD
iieEDD       jsr   DCCDUMP           ; dump with EDD card

noiieEDD     jsr   iieTORAM          ; copy to IIgs RAM

             jsr   NTRKCALC
             sta   STARTTRK
             bcc   ]lp

             jsr   MTROFF            ; turn off motor
             jsr   iieSAVE           ; save our file
iieEND       php                     ; save status
             jsr   MTROFF            ; turn off motor
             plp                     ; restore status
             jmp   theEND            ; display end message

*---------- Save our EDD file

iieSAVE      =     *
             jsr   initEDD           ; reset track info

]lp          jsr   iieFROMRAM        ; get RAM
             jsr   showPHASE         ; show phase
             jsr   saveFILES         ; save file
             bcs   iieSAVE1          ; error

             lda   STARTTRK          ; calculate next phase
             clc
             adc   STEP
             sta   STARTTRK
             cmp   ENDTRK
             bcc   ]lp
             beq   ]lp
             clc                     ; force carry clear
iieSAVE1     rts                     ; we're done!

*----------------------------
* THE IIGS COPY PART (EDD 5.25")
* V2.2 - New, use a IIgs to read all
*----------------------------

iigsCOPY     =     *

* Files are created
* All requirements checked

             jsr   iigsINITRAM
             jsr   MTRON

]lp          jsr   K7
             bcs   iigsEND

             lda   STARTTRK
             jsr   ARMV
             jsr   showPHASE

* lda DCCSLOT
* bne iigsEDD
* jsr TDUMPW ; normal bitcopy
* jmp noiigsEDD
iigsEDD      jsr   DCCDUMP           ; dump with EDD card

noiigsEDD    jsr   iigsTORAM         ; copy to IIgs RAM

             jsr   NTRKCALC
             sta   STARTTRK
             bcc   ]lp

             jsr   MTROFF            ; turn off motor
             jsr   iigsSAVE          ; save our file

iigsEND      php                     ; save status
             jsr   MTROFF            ; turn off motor
             plp                     ; restore status
             jmp   theEND            ; display end message

*---------- Save our EDD file

iigsSAVE     =     *
             jsr   initEDD           ; reset track info

]lp          jsr   iigsFROMRAM       ; get RAM
             jsr   showPHASE         ; show phase
             jsr   saveFILES         ; save file
             bcs   iigsSAVE1         ; error

             lda   STARTTRK          ; calculate next phase
             clc
             adc   STEP
             sta   STARTTRK
             cmp   ENDTRK
             bcc   ]lp
             beq   ]lp
             clc                     ; force carry clear
iigsSAVE1    rts                     ; we're done!

*----------------------------
* THE MENU PART
*----------------------------

showMAIN     =     *

             jsr   showHEADER

             ldx   #xMENU
             ldy   #yMENU
             jsr   tabXY

             ldx   #>strMENU
             ldy   #<strMENU
             jsr   printCCSTR

             rts

*----------------------------
* THE PHASE
*----------------------------

showPHASE    =     *

*---------- Track

             lda   STARTTRK
             and   #%1111_1100
             lsr
             lsr
             pha

             lsr
             lsr
             lsr
             lsr
             ldx   #xTRACK
             ldy   #yTRACK
             jsr   printBIG

             pla
             and   #%0000_1111
             ldx   #xTRACK2
             ldy   #yTRACK2
             jsr   printBIG

*---------- Step

             lda   STARTTRK
             and   #%0000_0011
             asl
             tax
             lda   tblSTEP,x
             sta   dpFROM
             lda   tblSTEP+1,x
             sta   dpFROM+1

             ldx   #xPSTEP
             ldy   #yPSTEP
             jsr   tabXY
             ldy   #0
             lda   (dpFROM),y
             jsr   printCHAR

             ldx   #xPSTEP2
             ldy   #yPSTEP2
             jsr   tabXY
             ldy   #1
             lda   (dpFROM),y
             jsr   printCHAR

             rts

*----------

tblMSTEP     da    mstep25           ; 1-0-0
             da    mstep50           ; 2-1-2
             da    mstep10           ; 4-2-4

mstep25      asc   '.25'00
mstep50      asc   '.50'00
mstep10      asc   '1.0'00

tblSTEP      da    step00            ; 0000
             da    step25            ; 0001
             da    step50            ; 0010
             da    step75            ; 0011

step00       asc   '  '
step25       asc   '14'
step50       asc   '12'
step75       asc   '34'

*----------------------------
* PREPARE ALL FILES
*----------------------------

createFILES  lda   DCCSLOT
             beq   noEDDFILE

             jsr   createFDI         ; v2.2
             bcs   createERR

* V2.1, the missing code...
             lda   fgWRITENIB        ; do not write nib if we
             beq   noNIBFILE         ; have an EDD active only

noEDDFILE    lda   #fileNIB
             jsr   createFILE
             bcs   createERR

noNIBFILE    lda   fgWRITENIT        ; do not write
             beq   createERR

             lda   #fileTIM
             jsr   createFILE
             bcs   createERR

* lda #fileFDI
* jsr createFILE

             jsr   showFREE          ; recalculate the free space

createERR    rts

createFILE   tax
             lda   tblSUFFIX,x
             sta   dpFROM
             lda   tblSUFFIX+1,x
             sta   dpFROM+1

             jsr   createP8
             rts

*----------

saveFILES    lda   DCCSLOT           ; do we have an EDD?
             beq   saveFILES1

             jsr   saveFDI           ; v2.2
             bcs   saveFILES9

             jsr   DCC2NIB

             lda   fgWRITENIB        ; do not write nib if we
             beq   saveFILES2        ; have an EDD active only

saveFILES1   lda   #fileNIB          ; we always write the NIB
             jsr   saveFILE          ; unless above check
             bcs   saveFILES9

saveFILES2   lda   fgWRITENIT        ; do not write timing bits
             beq   saveFILES8

             lda   DCCSLOT           ; timing bits are created by
             beq   saveFILES8        ; the EDD card!

             lda   #fileTIM
             jsr   saveFILE
             bcs   saveFILES9

saveFILES8   clc

saveFILES9   rts

*----------

savePREP     tax
             lda   tblSUFFIX,x
             sta   dpFROM
             lda   tblSUFFIX+1,x
             sta   dpFROM+1

             lda   tblADDRESS,x
             sta   proWRITE+2
             lda   tblADDRESS+1,x
             sta   proWRITE+3

             lda   tblLENGTH,x
             sta   proWRITE+4
             lda   tblLENGTH+1,x
             sta   proWRITE+5
             rts

*--- Save tblLENGTH of data

saveFILE     jsr   savePREP
saveFILE1    jsr   saveP8
             rts

*--- Save Y of data

saveFILE2    jsr   savePREP
             sty   proWRITE+5        ; for UP.DISK
             jmp   saveFILE1

*----------

tblSUFFIX    da    suffEDD
             da    suffNIB
             da    suffTIM
             da    suffFDI
             da    suffDSK
             da    suffPO
             da    suffD13
             da    suffN35           ; for 3.5"
             da    suffT35

tblADDRESS   da    L4000             ; EDD
             da    L4000             ; NIB
             da    L7800             ; TIM
             da    L4000             ; FDI
             da    L4000
             da    L4000
             da    L4000
             da    L4000             ; for 3.5"
             da    L4000

tblLENGTH    dw    $4000             ; EDD
             dw    $1a00             ; NIB
             dw    $1a00             ; TIM
             dw    $4000             ; v2.2 FDI
             dw    $7000             ; 1000*7
             dw    $7000             ; 1000*7
             dw    $6800             ; 0D00*8
             dw    $4000             ; for 3.5"
             dw    $4000

suffEDD      asc   '.EDD'00
suffNIB      asc   '.NIB'00
suffTIM      asc   '.NIT'00
suffFDI      asc   '.FDI'00          ; v2.2 was DDL
suffDSK      asc   '.DSK'00
suffPO       asc   '.PO'00
suffD13      asc   '.D13'00
suffN35      asc   '.N35'00
suffT35      asc   '.T35'00

*----------

fgIIE        ds    1                 ; 0: Std IIe / 1: full of RAM!!
fgIIGS       ds    1                 ; 0: no IIgs / 1: IIgs for 3.5"

fileEMPTY    str   '           '

fileNAME     ds    16                ; up to 11 chars
fileP8       ds    16                ; up to 15 chars

*----------------------------
* OTHER PARTS
*----------------------------

             asc   'Happy New Year!'

             put   UP.HELP
             put   UP.OPTIONS
             put   UP.PREFIX
             put   UP.TEXT
             put   UP.PRODOS
             put   UP.RAM            ; v2.3
             put   UP.FDI            ; v2.2
             put   UP.EDD
             put   UP.DISK
* put UP.DISK32 ; Maybe one day...
             put   UP.DISK35

             ds    \

