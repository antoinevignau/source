*
* I'm fEDD up ;-)
*
* (c) 2012-16, Brutal Deluxe Software
* w/ code by John Brooks
* w/ text by Krue
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
*  - See UP.MAIN.S for changes
*

            xc
            xc
            mx    %11

            org   $2000
            typ   #$ff
            dsk   IMFEDDUP.SYSTEM
            lst   off

*----------------------------
* EQUATES & FRIENDS
*----------------------------

ptrCODE     =     $0800        ; This is where v2.2 is located
PRODOS      =     $BF00
BASIC       =     $E000

*----------------------------
* MAIN PROOF OF CONCEPT CODE
*----------------------------

            lda   PRODOS       ; Are we under ProDOS?
            cmp   #$4C
            beq   OK1
            jmp   BASIC

*----------------------------

OK1         ldx   #0           ; We relocate at $4000
]lp         lda   RELOC,x
            sta   $4000,x
            inx
            bne   ]lp
            jmp   OK2

RELOC       =     *

*---

            org   $4000

OK2         jsr   PRODOS
            dfb   $c8
            da    proOPEN
            bcs   KO1

            lda   proOPEN+5
            sta   proGETEOF+1
            sta   proREAD+1
            sta   proCLOSE+1

            jsr   PRODOS
            dfb   $d1
            da    proGETEOF
            bcs   KO1

            lda   proGETEOF+2
            sta   proREAD+4
            lda   proGETEOF+3
            sta   proREAD+5

            jsr   PRODOS
            dfb   $ca
            da    proREAD
            bcs   KO1

            jsr   PRODOS
            dfb   $cc
            da    proCLOSE

            jmp   ptrCODE
KO1         jmp   BASIC

*--- Some data

ptrFILE     str   'CODE.IFU'   ; v2.2 - new name

proOPEN     dfb   $03
            da    ptrFILE
            da    $B000        ; our buffer
            ds    1

proGETEOF   dfb   $02
            ds    1
            ds    3

proREAD     dfb   $04
            ds    1
            da    ptrCODE
            ds    2
            ds    2

proCLOSE    dfb   $01
            ds    1

*----------

            ds    \

