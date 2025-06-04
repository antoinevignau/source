*
* Applesqueezer: equates
*
* (c) 2022, Brutal Deluxe Software
*

*-----------------------------------
* APPLESQUEEZER EQUATES
*-----------------------------------

* data
* bit 0: 1 if Acceralation is enabled
* bit 1: 1 if Built-RAM is enabled
* bit 2: 1 if Extra RAM is enabled
* bit 3-7: values unknown

FL_WRITE	=	$e20000
FL_READ_REQUEST =	$e20002 
FL_READ	=	$e20004
FL_CS	=	$e20006
FL_READY	=	$e20008
FL_IDLE	=	$e2000a
FL_VERSION	=	$e2000c

CMD_WRITE_ENABLE = 	$06
CMD_WRITE_DISABLE =	$04
CMD_PAGE_PROGRAM =	$02
CMD_SECTOR_ERASE =	$d8
CMD_BULK_ERASE =	$c7
CMD_READ_DATA_BYTES = 	$03
CMD_READ_STATUS_REGISTER = $05

exdram_address_set_main_bank =	$e30000	; 00..0E
exdram_address_set_addr_low =	$e30002	; 00/00xx
exdram_address_set_addr_high =	$e30004	; 00/xx00
exdram_address_set_addr_bank =	$e30006	; xx/0000
exdram_address_access	=	$e30008	; R/W auto-increment to end of main bank

TRUE	=	1
FALSE	=	0

minVERSION	=	7	; minimum core version to handle the driver

*-----------------------------------
* GS/OS EQUATES
*-----------------------------------

GSOS2            =     $E100B0
MOVE_INFO        =     $01FC70
SET_DISKSW       =     $01FC90

uncertainBlockCountBit = $8000
diskSwitchedBit  =     $0001
diskInDriveBit   =     $0010
diskModifyBit    =     $0100

dftRAMDISK       =     $000e         ; device ID for RAM/ROM disks

dchar            =     $08
dblockcount      =     $0a
ddeviceid        =     $34
ddevnumber       =     $3e

*-----------------------------------
* AS DRIVER EQUATES
*-----------------------------------

maxIMAGES	=	1	; no more than N images
blockSIZE	=	512	; ProDOS 8 block size
maxBLOCKP	=	65536	;  65536 blocks for ProDOS 8
maxBLOCKH	=	491520	; 491520 blocks for HFS

* 8 1000 => 8 1000 RAM or ROM disk
* B 1011 => B 1011 restartable + not speed dependent
* E 1110 => E 1110 block device | write allowed | read allowed
* 8 1000 => 8 1000 format allowed

dftCHAR	=	$8BE8         ; default characteristics 8FE8

dftVERSION	=	$1000         ; v1

*-----------------------------------
* GS/OS DIRECT PAGE
*-----------------------------------

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

