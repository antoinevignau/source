*
* GS/OS ROMDISK driver
*
* (c) 2016, Brutal Deluxe Software
* for Plamen
*

MOVE_INFO        EQU   $01FC70
SET_DISKSW       EQU   $01FC90

diskSwitchedBit  =     $0001
diskInDriveBit   =     $0010
diskModifyBit    =     $0100

ptrROMDISK       =     $F00000
ptrFBLOCK        =     ptrROMDISK+$A  ; pointer to pointer of first block
ptrNBBLOCKS      =     ptrFBLOCK+$4   ; pointer to nbblocks
blockSIZE        =     $200           ; a block is 512 bytes

* 8 1000 => 8 1000 RAM or ROM disk
* B 1011 => 3 0011 not speed dependent
* E 1110 => E 1110 block device | write allowed | read allowed
* 8 1000 => 8 1100 format allowed

dftCHAR          =     $83E8          ; default characteristics
dftVERSION       =     $1000          ; v1
dftROMDISK       =     $000F          ; device ID for RAM/ROMDISK

drvrDiskSwitch   =     $002E

dchar            =     $08
dblockcount      =     $0a
ddeviceid        =     $34
ddevnumber       =     $3e

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
FSTNum           =     $16            ; *
statusCode       =     $16            ; *
controlCode      =     $16            ; *
volumeID         =     $18
cachePriority    =     $1A
cachePointer     =     $1C
dibPointer       =     $20

