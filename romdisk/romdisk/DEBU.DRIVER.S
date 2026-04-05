*
* GS/OS ROMDISK driver
*
* (c) 2016, Brutal Deluxe Software
* for Plamen
*
* v0.9 - 14/JUL/2016
*  - All code done
*  - Based on MountIt & RAM5 drivers
*

               mx    %00
               rel
               typ   DRV
               dsk   ROMDEBUG.l
               lst   off

*--------------------------------------

               use   GSOS.Equates

*--------------------------------------

L0000          da    DIB-L0000                        ; offset to 1st DIB
               dw    $0001                            ; number of devices
               dw    CFG-L0000                        ; offset to configuration list

CFG            ds    4

*
* Dispatch routine
*

entryPOINT     phk                                    ; Dispatch
               plb
               cmp   #$0009
               bcc   L0012
               lda   #$0020
               bra   L001D
L0012          asl
               tax
               stz   errCODE
               jsr   (tblDISPATCH,X)
               lda   errCODE
L001D          cmp   #$0001
               rtl

tblDISPATCH    da    DStartup                         ; Driver_Startup
               da    DOpen                            ; Driver_Open
               da    DRead                            ; Driver_Read
               da    DWrite                           ; Driver_Write
               da    DClose                           ; Driver_Close
               da    DStatus                          ; Driver_Status
               da    DControl                         ; Driver_Control
               da    DFlush                           ; Driver_Flush
               da    DShutdown                        ; Driver_Shutdown

*
* Driver_Startup
*

DStartup       =     *                                ; Always active

               lda   #^L0000
               stal  $302
               lda   #L0000
               stal  $300

               ldx   #6-2
]lp            ldal  ptrROMDISK,x                     ; static address of ROMDISK
               cmp   mySIGNATURE,x
               beq   dsOK

dsKO           rep   #$30                             ; sorry, we're not in memory
               lda   #1
               sta   fgACTIVE
               rts
dsOK           dex                                    ; continue
               dex
               bpl   ]lp

*--- If we're here, we're good, we have a ROMDISK
* It is time to collect some data

               ldal  ptrFBLOCK                        ; get pointer of first block
               sta   firstBLOCK
               ldal  ptrFBLOCK+2
               sta   firstBLOCK+2

               ldal  ptrNBBLOCKS                      ; get number of blocks from smartport driver
               sta   DIB+$0A                          ; number of blocks

*--- What is the unit assigned by smartport?
* Order of boot:
* 00: scan
* 0A: Appletalk
* 09: ROMDISK
* 08: RAMDISK
*
* If a RAMdisk is present, it is the unit 1
* and the ROMdisk is unit 2
* If no RAMdisk is present, the ROMdisk is unit 1

               sep   #$30
               ldal  $e10fbd                          ; see GS MEMORY MAP
* DEBUG
               lda   #$01
* ...DEBUG
               ldx   #$04
]lp            cmpl  $e10fbf,x
               beq   dsOK2
               dex
               bne   ]lp
               bra   dsKO                             ; we're not good!

dsOK2          stx   DIB+$30                          ; save unit number
               rep   #$30
               stz   fgACTIVE                         ; We're up and running
               rts

mySIGNATURE    asc   "ROMDISK"

*
* Driver_Open
*

DOpen          =     *                                ; Driver_Open
               rts

*
* Driver_Read
*

DRead          =     *                                ; Driver_Read
               jsr   doSETUP
               bcc   dr1
               rts

dr1            lda   firstBLOCK+2
               pha
               lda   firstBLOCK
               pha

               lda   blockNum                         ; from a block to an offset
               asl                                    ; *2 for ProDOS
               clc
               adc   2,s                              ; add and...
               sta   2,s                              ; ...save

               pei   bufferPtr+2
               pei   bufferPtr
               pei   transferCount+2
               pei   transferCount
               pea   $0805
               jsl   MOVE_INFO
               rep   #$30
               rts

*
* Driver_Write
*

DWrite         =     *                                ; Driver_Write
               jsr   doSETUP
               bcc   dw1
               rts

dw1            pei   bufferPtr+2                      ; push the bufferPtr for
               pei   bufferPtr                        ; the MOVE_INFO call

               lda   firstBLOCK+2
               pha
               lda   firstBLOCK
               pha

               lda   blockNum                         ; from a block to an offset
               asl                                    ; *2 for ProDOS
               clc
               adc   2,s                              ; add and...
               sta   2,s                              ; ...save

               pei   transferCount+2
               pei   transferCount
               pea   $0805
               jsl   MOVE_INFO
               rep   #$30

               lda   fgDISK                           ; Tell the disk has been modified
               ora   #diskModifyBit
               sta   fgDISK
               rts

*
* Driver_Close
*

DClose         =     *                                ; Driver_Close
               rts

*
* Driver_Status
*

DStatus        =     *                                ; Driver_Status
               lda   statusCode
               cmp   #$0005
               bcc   L03C3
               lda   #$0021                           ; drvrBadCode
               sta   errCODE
               rts

L03C3          asl
               tax
               stz   transferCount
               stz   transferCount+2
               jsr   (tblSTATUS,X)
               rts

tblSTATUS      da    SGetStatus                       ; GetDeviceStatus
               da    SGet                             ; GetConfigParameters
               da    SGet                             ; GetWaitStatus
               da    SNada                            ; GetFormatOptions
               da    SNada                            ; GetPartitionMap

SNada          rts

*-----------

SGetStatus     =     *                                ;
               lda   #$0002                           ; GetDeviceStatus
               sta   transferCount

*
* RTFM RTFM RTFM RTFM ...
*

               lda   fgDISK                           ; get status
               and   #$00ff                           ; mask image modification
               sta   [statusListPtr]                  ; return it

               eor   #diskInDriveBit
               and   #diskInDriveBit+diskSwitchedBit
               beq   sg99

               jsl   SET_DISKSW

*
* ... RTFM RTFM RTFM RTFM
*

sg99           lda   requestCount
               cmp   #$0006
               bcc   L03F8
               lda   #$0006
               sta   transferCount

               ldy   #dblockcount
               lda   [dibPointer],y
               tax
               iny
               iny
               lda   [dibPointer],y

               ldy   #4
               sta   [statusListPtr],y
               dey
               dey
               txa
               sta   [statusListPtr],y
L03F8          rts

*-----------

SGet           lda   #$0000                           ; GetConfigParameters
               sta   [statusListPtr]                  ; GetWaitStatus
               lda   #$0002
               sta   transferCount
               rts

*
* Driver_Control
*

DControl       =     *                                ; Driver_Control
               jsr   checkSWITCHED
               beq   L0424
               rts
L0424          lda   controlCode
               cmp   #9+1
               bcc   L0432

               lda   #$0021
               sta   errCODE
               rts

L0432          asl
               tax
               stz   transferCount
               stz   transferCount+2
               jsr   (tblCONTROL,X)
               rts

tblCONTROL     da    CNada                            ; 0 ResetDevice
               da    CNada                            ; 1 FormatDevice
               da    CNada                            ; 2 EjectMedium (was CEject)
               da    CSet                             ; 3 SetConfigParameters
               da    CSet                             ; 4 SetWaitStatus
               da    CNada                            ; 5 SetFormatOptions
               da    CNada                            ; 6 AssignPartitionOwner
               da    CNada                            ; 7 ArmSignal
               da    CNada                            ; 8 DisarmSignal
               da    CNada                            ; 9 SetPartitionMap

CNada          rts

*-----------

CSet           lda   [controlListPtr]                 ; SetConfigParameters
               bne   CSetERR                          ; SetWaitStatus
               rts
CSetERR        lda   #$0022
               sta   errCODE
               rts

*-----------
* We set the ROMDISK as being fixed
* so this code is useless but remains
* for a "I do not know why" reason

*CEject lda #diskSwitchedBit
* sta fgDISK ; disk is gone with the wind...
* rts

*
* Driver_Flush
*

DFlush         =     *                                ; Driver_Flush
               rts

*
* Driver_Shutdown
*

DShutdown      =     *                                ; Driver_Shutdown
               lda   #1
               sta   fgACTIVE                         ; bye bye
               rts

*----------------------------

* Status flag of the current device
* $0001: image has been switched (disk switched)
* $0010: image is active (disk in drive)
* $0100: image has been modified

*
* Checks everything is OK
*

doSETUP        =     *
               jsr   checkSWITCHED
               beq   ds2
               sec
               rts

ds2            lda   requestCount                     ; Nb of bytes to read
               ora   requestCount+2
               bne   ds4
               sec
               rts

ds4            lda   blockSize                        ; size of block ?
               cmp   #blockSIZE
               bne   ds6

               lda   requestCount
               and   #$01FF                           ; multiple of $0200
               beq   ds8

ds6            lda   #$002C                           ; invalidByteCount
               sta   errCODE
               sec
               rts

ds8            lda   requestCount                     ; assume transfer=request
               sta   transferCount
               lda   requestCount+2
               sta   transferCount+2

               lda   requestCount+3                   ; but check the limit
               and   #$00ff
               lsr
               pha
               lda   requestCount+1
               ror
               pha

               lda   blockNum                         ; calculate max @
               clc
               adc   1,s
               sta   1,s
               lda   blockNum+2
               adc   3,s
               sta   3,s

               ldy   #dblockcount                     ; are we in the range?
               lda   [dibPointer],y
               sec
               sbc   1,s
               pla
               iny
               iny
               lda   [dibPointer],y
               sbc   1,s
               pla                                    ; are we in the range?
               bcs   ds10                             ; YES YES YES

               lda   #$002D                           ; bad block count
               sta   errCODE

               stz   transferCount
               stz   transferCount+2

               ldy   #dblockcount                     ; set the new limit
               lda   [dibPointer],y
               sec
               sbc   blockNum
               asl
               sta   transferCount+1

ds10           clc
               rts

*
* check the switched flag
* but does not call SET_DISKSW
* which is made by DStatus
*
* Force offline disk error code!
*

checkSWITCHED  =     *
               lda   fgDISK                           ; check status
               bit   #diskSwitchedBit
               beq   cs99

cs33           lda   #$2f                             ; drvrDiskOffline
               sta   errCODE
cs66           rts

cs99           lda   fgACTIVE                         ; activate the driver
               beq   cs66
               jsl   SET_DISKSW                       ; we're here
               stz   fgACTIVE                         ; make it active
               lda   #$2e                             ; tell disk has switched
               bra   cs33

*----------------------------

DIB            ds    4                                ; +00 pointer to the next DIB
               adrl  entryPOINT                       ; +04 driver entry point
               dw    dftCHAR                          ; +08 characteristics
               ds    4                                ; +0A block count (modified)
               str   'ROMDISK'                        ; +0E device name
               asc   '                        '
               dw    $0005                            ; +2E slot number
               dw    $0004                            ; +30 unit number (modified)
               dw    dftVERSION                       ; +32 version
               dw    dftROMDISK                       ; +34 device ID
               ds    2                                ; +36 first linked device
               ds    2                                ; +38 next linked device
               ds    4                                ; +3A extended DIB ptr
               ds    2                                ; +3E device number

*--- My flag

fgACTIVE       dw    1                                ; *BEWARE* active if 0
fgDISK         ds    2                                ; fgDISK
errCODE        ds    2                                ; the error code word
firstBLOCK     ds    4                                ; address of the first block in RAM

*--- Internal signature

               asc   0d
               asc   'Antoine Vignau & Olivier Zardini'0d
               asc   'Brutal Deluxe Software, 2016'
               asc   0d

