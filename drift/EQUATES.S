*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

            mx    %11
            lst   off

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

* My zero page values

zpTITLE     =     $F4
zpICON      =     $F6
zpFROM      =     $F8
zpTO        =     $FA
zpDEP       =     $FC
zpARR       =     $FE

zpPLAYER    =     $00         ; Which player to use?
zpMUSIC     =     $1E

zp80        =     $80         ; For player 2
zp8A        =     $8A
zp8C        =     $8C
zp8E        =     $8E
zp90        =     $90

* ROM
HPAG        =     $E6

hgrBLACK    =     $00
hgrORANGE   =     $05

* All chars
chrSPACE    =     ' '
chrCOMMA    =     ','
chrEOF      =     '$'
chrUQ       =     'Q'
chrLQ       =     'q'

chrLEFT     =     $08
chrDOWN     =     $0a
chrUP       =     $0b
chrRET      =     $0d
chrRIGHT    =     $15
chrESC      =     $1b

* For the menu
firstX      =     10
firstY      =     8
lastX       =     30
lastY       =     16

* For the window
maxX        =     40
maxY        =     24

* All indexes
iTITLE      =     $0
iICON       =     iTITLE+2
iMUSIC      =     iICON+2
iMINFO      =     iMUSIC+2
iMESSAGE    =     iMINFO+2
iPLAYER     =     iMESSAGE+2

* All pointers
ptrTEXT     =     $0400
ptrMENU     =     $0800
ptrBUFFER   =     $0C00
ptrPROGRAM  =     $1000
ptrHGR1     =     $2000
ptrHGR2     =     $4000
ptrMINFO    =     $4000
ptrICONS    =     $6000
ptrMUSIC    =     $7000

PRODOS      =     $BF00

* ROM
KBD         =     $C000
CLR80COL    =     $C00C
KBDSTRB     =     $C010
TBCOLOR     =     $C022
SPKR        =     $C030
CLOCKCTL    =     $C034
CYAREG      =     $C036
TXTCLR      =     $C050
TXTSET      =     $C051
MIXCLR      =     $C052
MIXSET      =     $C053
TXTPAGE1    =     $C054
TXTPAGE2    =     $C055
LORES       =     $C056
HIRES       =     $C057
BUTN0       =     $C061

BASIC       =     $E000

HPLOT       =     $F457
HLIN        =     $F53A
SETHCOL     =     $F6EC
SETTXT      =     $FB39
HOME        =     $FC58
WAIT        =     $FCA8
COUT        =     $FDED
IDROUTINE   =     $FE1F

