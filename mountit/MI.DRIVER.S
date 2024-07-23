*
* GS/OS VIRTUAL DISK IMAGE DRIVER
* FOR SYSTEM 6.0.1
* BASED ON APPLE'S RAM5 DRIVER
*
* (C) Brutal Deluxe Software, 2009
*

               MX    %00

*
*
*

L0000          DW    DIBA-L0000                       ; offset to 1st DIB
               DW    maxIMAGES                        ; number of devices
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list
               DW    CFG-L0000                        ; offset to configuration list

CFG            DS    4

*
* Dispatch routine
*

entryPOINT     PHK                                    ; Dispatch
               PLB
               CMP   #$0009
               BCC   L0012
               LDA   #$0020
               BRA   L001D
L0012          ASL
               TAX
               STZ   errCODE
               JSR   (tblDISPATCH,X)
               LDA   errCODE
L001D          CMP   #$0001
               RTL

tblDISPATCH    DA    DStartup                         ; Driver_Startup
               DA    DOpen                            ; Driver_Open
               DA    DRead                            ; Driver_Read
               DA    DWrite                           ; Driver_Write
               DA    DClose                           ; Driver_Close
               DA    DStatus                          ; Driver_Status
               DA    DControl                         ; Driver_Control
               DA    DFlush                           ; Driver_Flush
               DA    DShutdown                        ; Driver_Shutdown

*
* Driver_Startup
*

DStartup       =     *                                ; Always active
               rts

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

dr1            ldy   #iptrDISK+2                      ; get the disk image data pointer
               lda   [dibPointer],y
               pha
               dey
               dey
               lda   [dibPointer],y
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

               ldy   #iptrDISK+2                      ; get the disk image data pointer
               lda   [dibPointer],y
               pha
               dey
               dey
               lda   [dibPointer],y
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

               ldy   #ifgDISK                         ; tell image has been modified
               lda   [dibPointer],y
               ora   #diskModifyBit
               sta   [dibPointer],y
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
               CMP   #$0005
               BCC   L03C3
               LDA   #$0021                           ; drvrBadCode
               STA   errCODE
               RTS

L03C3          ASL
               TAX
               STZ   transferCount
               STZ   transferCount+2
               JSR   (tblSTATUS,X)
               RTS

tblSTATUS      DA    SGetStatus                       ; GetDeviceStatus
               DA    SGet                             ; GetConfigParameters
               DA    SGet                             ; GetWaitStatus
               DA    SNada                            ; GetFormatOptions
               DA    SNada                            ; GetPartitionMap

SNada          rts

*-----------

SGetStatus     =     *                                ;
               LDA   #$0002                           ; GetDeviceStatus
               STA   transferCount

*
* RTFM RTFM RTFM RTFM ...
*

               ldy   #ifgDISK                         ; get status
               lda   [dibPointer],y
               and   #$00ff                           ; mask image modification
               sta   [statusListPtr]                  ; return it

               eor   #diskInDriveBit
               and   #diskInDriveBit+diskSwitchedBit
               beq   sg99

               jsl   SET_DISKSW

*
* ... RTFM RTFM RTFM RTFM
*

sg99           LDA   requestCount
               CMP   #$0006
               BCC   L03F8
               LDA   #$0006
               STA   transferCount

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
L03F8          RTS

*-----------

SGet           LDA   #$0000                           ; GetConfigParameters
               STA   [statusListPtr]                  ; GetWaitStatus
               LDA   #$0002
               STA   transferCount
               RTS

*
* Driver_Control
*

DControl       =     *                                ; Driver_Control
               jsr   checkSWITCHED
               beq   L0424
               rts
L0424          LDA   controlCode
               CMP   #9+1
               BCC   L0432

               LDA   #$0021
               STA   errCODE
               RTS

L0432          ASL
               TAX
               STZ   transferCount
               STZ   transferCount+2
               JSR   (tblCONTROL,X)
               RTS

tblCONTROL     DA    CNada                            ; 0 ResetDevice
               DA    CNada                            ; 1 FormatDevice
               DA    CEject                           ; 2 EjectMedium
               DA    CSet                             ; 3 SetConfigParameters
               DA    CSet                             ; 4 SetWaitStatus
               DA    CNada                            ; 5 SetFormatOptions
               DA    CNada                            ; 6 AssignPartitionOwner
               DA    CNada                            ; 7 ArmSignal
               DA    CNada                            ; 8 DisarmSignal
               DA    CNada                            ; 9 SetPartitionMap

CNada          rts

*-----------

CEject         =     *
               pei   dibPointer+2
               pei   dibPointer

               ldy   #iptrGSOS                        ; set pointer to GS/OS name
               lda   [dibPointer],y
               tax
               iny
               iny
               lda   [dibPointer],y
               sta   dibPointer+2
               stx   dibPointer

               lda   #0                               ; GS/OS length is 0
               sta   [dibPointer]

               pla                                    ; restore pointer
               sta   dibPointer
               pla
               sta   dibPointer+2

               ldx   #0
               ldy   #ihaFILE+2                       ; remove the handle
               lda   [dibPointer],y
               pha
               txa
               sta   [dibPointer],y

               dey
               dey
               lda   [dibPointer],y
               pha
               txa
               sta   [dibPointer],y
               _DisposeHandle

               ldy   #ifgDISK                         ; disk is gone with the wind...
               lda   #diskSwitchedBit
               sta   [dibPointer],y
               rts

*-----------

CSet           LDA   [controlListPtr]                 ; SetConfigParameters
               BNE   CSetERR                          ; SetWaitStatus
               RTS
CSetERR        LDA   #$0022
               STA   errCODE
               RTS

*
* Driver_Flush
*

DFlush         =     *                                ; Driver_Flush
               rts

*
* Driver_Shutdown
*

DShutdown      =     *
               ldy   #ihaFILE                         ; if the device
               lda   [dibPointer],y
               iny                                    ; is still in drive
               iny
               ora   [dibPointer],y
               beq   dshut99

               jsr   CEject                           ; ...remove the device

dshut99        rts

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

ds2            LDA   requestCount                     ; Nb of bytes to read
               ORA   requestCount+2
               BNE   ds4
               sec
               rts

ds4            lda   blockSize                        ; size of block ?
               cmp   #sizePRODOS
               bne   ds6

               lda   requestCount
               and   #$01FF                           ; multiple of $0200
               beq   ds8

ds6            LDA   #$002C                           ; invalidByteCount
               STA   errCODE
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
               STA   errCODE

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
               ldy   #ifgDISK                         ; check status
               lda   [dibPointer],y
               bit   #diskSwitchedBit
               beq   cs99

               lda   #$2f                             ; drvrDiskOffline
               sta   errCODE
cs99           rts

*----------------------------

* 8 1000 => 8 1000 RAM or ROM disk
* B 1011 => 3 0011 not speed dependent
* E 1110 => E 1110 block device | write allowed | read allowed
* 8 1000 => C 1100 format allowed | removable media

sizeEXTDIB     =     20                               ; sizeof

EXTDIB         =     *
fgDISK         ds    2                                ; +00 fgDISK
haFILE         ds    4                                ; +02 haFILE
ptrFILE        ds    4                                ; +06 ptrFILE
ptrDISK        ds    4                                ; +0A ptrDISK
blockCOUNT     ds    4                                ; +0E blockCOUNT
blockSIZE      ds    2                                ; +12 blockSIZE

ptrGSOS        ds    4                                ; pointer to GS/OS string
errCODE        ds    2

*
*
*

theDIB         da    DIBA,DIBB,DIBC,DIBD
               da    DIBE,DIBF,DIBG,DIBH
               da    DIBI,DIBJ,DIBK,DIBL
               da    DIBM,DIBN,DIBO,DIBP

thePATH        da    thePATHA,thePATHB,thePATHC,thePATHD
               da    thePATHE,thePATHF,thePATHG,thePATHH
               da    thePATHI,thePATHJ,thePATHK,thePATHL
               da    thePATHM,thePATHN,thePATHO,thePATHP

DIBA           ADRL  DIBB                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEA'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0001                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHA
thePATHA       ds    sizePATH

DIBB           ADRL  DIBC                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEB'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0002                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHB
thePATHB       ds    sizePATH

DIBC           ADRL  DIBD                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEC'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0003                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHC
thePATHC       ds    sizePATH

DIBD           ADRL  DIBE                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGED'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0004                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHD
thePATHD       ds    sizePATH

DIBE           ADRL  DIBF                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEE'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0005                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHE
thePATHE       ds    sizePATH

DIBF           ADRL  DIBG                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEF'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0006                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHF
thePATHF       ds    sizePATH

DIBG           ADRL  DIBH                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEG'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0007                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHG
thePATHG       ds    sizePATH

DIBH           ADRL  DIBI                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEH'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHH
thePATHH       ds    sizePATH

DIBI           ADRL  DIBJ                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEI'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHI
thePATHI       ds    sizePATH

DIBJ           ADRL  DIBK                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEJ'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHJ
thePATHJ       ds    sizePATH

DIBK           ADRL  DIBL                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEK'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHK
thePATHK       ds    sizePATH

DIBL           ADRL  DIBM                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEL'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHL
thePATHL       ds    sizePATH

DIBM           ADRL  DIBN                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEM'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHM
thePATHM       ds    sizePATH

DIBN           ADRL  DIBO                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEN'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHN
thePATHN       ds    sizePATH

DIBO           ADRL  DIBP                             ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEO'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHO
thePATHO       ds    sizePATH

DIBP           ADRL  $00000000                        ; +00 pointer to the next DIB
               ADRL  entryPOINT                       ; +04 driver entry point
               DW    dftCHAR                          ; +08 characteristics
               ADRL  $00000000                        ; +0A block count
               STR   'DISKIMAGEP'                     ; +0E device name
               ASC   '                     '
               DW    $8003                            ; +2E slot number
               DW    $0008                            ; +30 unit number
               DW    dftVERSION                       ; +32 version
               DW    dftDEV35                         ; +34 device ID
               DW    $0000                            ; +36 first linked device
               DW    $0000                            ; +38 next linked device
               ADRL  $00000000                        ; +3A extended DIB ptr
               DW    $0000                            ; +3E device number
               ds    sizeEXTDIB
               adrl  thePATHP
thePATHP       ds    sizePATH

