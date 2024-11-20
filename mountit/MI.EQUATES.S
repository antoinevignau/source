*
* MountIt: equates
*
* (c) 2009, Brutal Deluxe Software
*

Debut            =     $00
Arrivee          =     $04
Third            =     $08
ptrSPATH         =     $14
ptrDPATH         =     $18

proDOS           =     $E100A8
GSOSBusy         =     $E100BE

MOVE_INFO        EQU   $01FC70
SET_DISKSW       EQU   $01FC90
INSTALL_DRIVER   =     $01FCA8

diskSwitchedBit  =     $0001
diskInDriveBit   =     $0010
diskModifyBit    =     $0100

maxIMAGES        =     16            ; no more than N images

cDSK             =     0             ; 140KB PO or DSK
cPO              =     1             ; 800KB PO
c2MG             =     2             ; 140KB or 800KB 2MG

sizePRODOS       =     $0200

sizePATH         =     128           ; set GS/OS path length to N bytes

dftCHAR          =     $83EC         ; default characteristics
dftVERSION       =     $1200         ; v1.2.0

dftDEV525        =     $0014         ; device ID for 5.25 disks
dftDEVHDD        =     $0013         ; device ID for Hard disk drive (generic)
dftDEV35         =     $0003         ; device ID for 3.5 disks

drvrDiskSwitch   =     $002E

dchar            =     $08
dblockcount      =     $0a
ddeviceid        =     $34
ddevnumber       =     $3e

extdib           =     ddevnumber+2
ifgDISK          =     extdib        ; device flags
ihaFILE          =     extdib+$02    ; handle to disk image in RAM
iptrFILE         =     extdib+$06    ; pointer to that handle
iptrDISK         =     extdib+$0a    ; pointer to the real disk image data
iblockCOUNT      =     extdib+$0e    ; number of blocks of that image
iblockSIZE       =     extdib+$12    ; size of a block
iptrGSOS         =     extdib+$14    ; pointer to the GS/OS disk image pathname

*
* GS/OS DP
*

deviceNum        =     $00
callNum          =     $02
bufferPtr        =     $04
statusListPtr    =     $04
controlListPtr   =     $04
requestCount     =     $08
transferCount    =     $0C
blockNum         =     $10
blockSize        =     $14
FSTNum           =     $16           ; *
statusCode       =     $16           ; *
controlCode      =     $16           ; *
volumeID         =     $18
cachePriority    =     $1A
cachePointer     =     $1C
dibPointer       =     $20

