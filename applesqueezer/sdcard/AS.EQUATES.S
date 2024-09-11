*
* AppleSqueezer - Equates
*
* (c) 2023, Niek Van Suchtelen
* (c) 2023, Brutal Deluxe Software
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

SD_ADDRESS_SET_MSB	=	$e40000
SD_ADDRESS_SET_MSB_1	=	$e40002
SD_ADDRESS_SET_MSB_2	=	$e40004
SD_ADDRESS_SET_MSB_3	=	$e40006
SD_START_READ	=	$e40008	; starts reading the sector (if it was idle)
SD_ACCESS 		=	$e4000a 
SD_START_WRITE 	=	$e4000c	; starts writing the sector (if it was idle)
SD_IDLE	=	$e4000e
SD_CARD_INSERTED	=	$e40012	; 0: no card inserted, 1: card inserted

* STA_NOINIT	=	1	; Drive not initialized
* STA_NODISK	=	2	; No medium in the drive

TRUE	=	1
FALSE	=	0

minVERSION	=	7	; minimum core version to handle the driver

*--- Speed settings
* From 233 (3 MHz) to 255 (full speed)
* Setting is not preserved

AS_SPEED	=	$e50000	; just write a speed byte

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

devPROFILE10MB = 	$0002
devRAMDISK	=	$000e	; device ID for RAM/ROM disks
devHDD	=	$0013	; device ID for HDD (generic)

dchar	=	$08
dblockcount	=	$0a
ddeviceid	=	$34
ddevnumber	=	$3e

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

