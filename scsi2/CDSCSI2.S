*
* CD SCSI-2
* A test app for SCSI-2 audio commands
*
* (c) 2018, Brutal Deluxe Software
* Visit http://www.brutaldeluxe.fr/
*

                  xc
                  xc
                  mx        %00

                  rel
                  dsk       CDSCSI2.l
                  lst       off

*----------

                  use       4/Int.Macs
                  use       4/Locator.Macs
                  use       4/Mem.Macs
                  use       4/Misc.Macs
                  use       4/Text.Macs
                  use       4/Util.Macs

Debut             =         $00
GSOS              =         $e100a8

*----------

dcREMOVE          =         $0004
dcONLINE          =         $0010
devCDROM          =         $0007

maxDEVICES        =         8

dcINQUIRY         =         $8012
doMODESELECT      =         $8015
dcMODESENSE6      =         $801a
dcSTARTSTOP       =         $801b                ; also eject/insert
dcREADCAPACITY    =         $8025
dcSUBCHANNEL      =         $8042
dcREADTOC         =         $8043
dcPATI            =         $8048
dcPAUSERESUME     =         $804b
dcMODESENSE10     =         $805a

*----------

                  phk
                  plb

                  tdc
                  sta       myDP

                  _TLStartUp
                  pha
                  _MMStartUp
                  pla
                  sta       appID
                  ora       #$0100
                  sta       myID

                  _MTStartUp
                  _TextStartUp

                  _IMStartUp

                  pha
                  pha
                  PushLong  #$010000
                  PushWord  myID
                  PushWord  #%11000000_00011100
                  PushLong  #0
                  _NewHandle
                  phd
                  tsc
                  tcd
                  lda       [3]
                  sta       ptrBUFFER
                  ldy       #2
                  lda       [3],y
                  sta       ptrBUFFER+2
                  pld
                  ply
                  sty       haBUFFER
                  plx
                  stx       haBUFFER+2

*----------

                  PushWord  #$00FF
                  PushWord  #$0080
                  _SetInGlobals
                  PushWord  #$00FF
                  PushWord  #$0080
                  _SetOutGlobals
                  PushWord  #$00FF
                  PushWord  #$0080
                  _SetErrGlobals

                  PushWord  #0
                  PushLong  #3
                  _SetInputDevice
                  PushWord  #0
                  PushLong  #3
                  _SetOutputDevice
                  PushWord  #0
                  PushLong  #3
                  _SetErrorDevice

                  PushWord  #0
                  _InitTextDev
                  PushWord  #1
                  _InitTextDev
                  PushWord  #2
                  _InitTextDev

                  PushWord  #$0c                 ; home
                  _WriteChar

* DEBUG

                  lda       #proCONTROL
                  stal      $300
                  lda       #^proCONTROL
                  stal      $302

                  lda       ptrBUFFER
                  stal      $304
                  lda       ptrBUFFER+2
                  stal      $306

*----------------------------
* MAIN MENU
*----------------------------

mainMENU          =         *

                  PushLong  #strMAINMENU
                  _WriteCString

                  jsr       waitFORKEY
                  cmp       #"Q"
                  beq       doQUIT
                  cmp       #"q"
                  beq       doQUIT
                  cmp       #"1"
                  bne       mainMENU

                  jmp       searchMENU

*--- Data

strMAINMENU       asc       0d'CD SCSI-2'0d
                  asc       '(c) 2018, Brutal Deluxe Software'0d
                  asc       ' 1. Search for SCSI CD-ROM drives'0d
                  asc       ' Q. Quit'0d00

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT            =         *

                  _IMShutDown
                  _TextShutDown
                  _MTShutDown

                  PushWord  myID
                  _DisposeAll

                  PushWord  appID
                  _MMShutDown

                  _TLShutDown

                  jsl       GSOS
                  dw        $2029
                  adrl      proQUIT

                  brk       $bd

*----------------------------
* SEARCH MENU
*----------------------------

searchMENU        =         *

                  jsr       initFG               ; init flags

                  PushLong  #strSEARCHMENU
                  _WriteCString

                  jsr       pollCDSCSI           ; show CD-ROM devices

]lp               jsr       waitFORKEY           ; is it 0-9
                  cmp       #"0"
                  bcc       ]lp
                  bne       searchMENU2
                  jmp       mainMENU             ; or even 0 to exit
searchMENU2       cmp       #"9"+1
                  bcs       ]lp

                  sec                            ; we have our device ID
                  sbc       #"0"
                  cmp       nbDEVICES            ; in the 1-nbDEVICES range
                  bcc       searchMENU3
                  bne       ]lp

searchMENU3       dec
                  asl
                  tax
                  lda       tblDEVICES,x
                  sta       theDEVICE            ; we have our device now
                  jmp       deviceMENU

*---------- Routines

pollCDSCSI        stz       nbDEVICES            ; number of SCSI CD-ROM found

                  lda       #1                   ; start with device 1
                  sta       proDINFO+2

]lp               jsl       GSOS                 ; do a DInfo
                  dw        $202c
                  adrl      proDINFO
                  bcc       found

                  cmp       #$0011               ; no more devices
                  bne       loop
                  rts

loop              inc       proDINFO+2
                  bra       ]lp

*---------- Check it is a CD-ROM

found             lda       proDINFO+8           ; not removable
                  and       #dcREMOVE
                  beq       loop

                  lda       proDINFO+20          ; not CD-ROM
                  cmp       #devCDROM
                  bne       loop

*--- We have a CDROM

                  lda       nbDEVICES
                  asl
                  tax
                  lda       proDINFO+2
                  sta       tblDEVICES,x

                  jsr       showDEVICEINFO

                  inc       nbDEVICES
                  lda       nbDEVICES
                  cmp       #maxDEVICES
                  bcc       loop                 ; loop again
                  rts

*--- Sub routines
*
* x - $xxxx - .NAMEOFDEVICE

showDEVICEINFO
                  pha                            ; from a word to a string
                  pha
                  pha
                  _HexIt
                  PullLong  strDEVID

                  PushWord  #$20                 ; space
                  _WriteChar

                  lda       nbDEVICES            ; write device index
                  inc
                  ora       #"0"
                  pha
                  _WriteChar

                  PushLong  #strDEV              ; show the string
                  _WriteCString

                  lda       devINFO1             ; from a STRL to a STR
                  xba
                  sta       devINFO1

                  PushLong  #devINFO2
                  _WriteString

                  PushWord  #$0d
                  _WriteChar
                  rts

*---------- Data

strDEV            asc       ' - $'
strDEVID          asc       '0000 - '00

nbDEVICES         ds        2                    ; number of devices
theDEVICE         ds        2                    ; the device to play with
tblDEVICES        ds        16*2                 ; we authorize 16 devices

strSEARCHMENU
                  asc       0d'Searching for SCSI CD-ROM drives...'0d
                  asc       ' 0. Go back to previous menu'0d00

*----------------------------
* DEVICE MENU
*----------------------------

deviceMENU        =         *

                  lda       theDEVICE            ; get our ID
                  sta       proSTATUS+2
                  sta       proCONTROL+2

                  pha                            ; from a word to a string
                  pha
                  pha
                  _HexIt
                  PullLong  strDEVMENU

                  PushLong  #strDEVICEMENU
                  _WriteCString

*---

]lp               jsr       waitFORKEY           ; is it 0-9
                  cmp       #"0"
                  bcc       ]lp
                  bne       deviceMENU2
                  jmp       searchMENU           ; or even 0 to exit
deviceMENU2       cmp       #"8"+1
                  bcs       ]lp

                  sec                            ; call the routines
                  sbc       #"1"
                  asl
                  tax
                  lda       ptrCOMMANDS,x
                  sta       deviceMENU3+1
deviceMENU3       jsr       $bdbd
                  jmp       deviceMENU

ptrCOMMANDS       da        doINQUIRY
                  da        doCAPACITY
                  da        doAUDIOPARMS
                  da        doREADTOC
                  da        doSUBCHANNEL
                  da        doPLAYSTOP
                  da        doPAUSERESUME
                  da        doINSERTEJECT

*----------------
* SCSI COMMANDS
*----------------

doINQUIRY         =         *

                  jsr       initCOMMANDDATA

                  ldx       #6-2                 ; put the inquiry data
]lp               lda       scsiINQUIRY,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcINQUIRY
                  jsr       statusCALL
                  bcc       doINQUIRY1
                  rts

doINQUIRY1

*--- Display data

* Byte 0

                  PushLong  #strPQ
                  _WriteCString

                  lda       commandBUFF
                  and       #%11100000
                  xba
                  ldx       #3
                  jsr       showBITS

                  PushLong  #strPDT
                  _WriteCString

                  lda       commandBUFF
                  and       #%00011111
                  asl
                  asl
                  asl
                  xba
                  ldx       #5
                  jsr       showBITS

* Byte 1

                  PushLong  #strRMB
                  _WriteCString

                  lda       commandBUFF+1
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strDTM
                  _WriteCString

                  lda       commandBUFF+1
                  and       #%01111111
                  asl
                  xba
                  ldx       #7
                  jsr       showBITS

* Byte 2

                  PushLong  #strISO
                  _WriteCString

                  lda       commandBUFF+2
                  and       #%11000000
                  xba
                  ldx       #2
                  jsr       showBITS

                  PushLong  #strECMA
                  _WriteCString

                  lda       commandBUFF+2
                  and       #%00111000
                  asl
                  asl
                  xba
                  ldx       #3
                  jsr       showBITS

                  PushLong  #strANSI
                  _WriteCString

                  lda       commandBUFF+2
                  and       #%00000111
                  asl
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #3
                  jsr       showBITS

* Byte 3

                  PushLong  #strAENC
                  _WriteCString

                  lda       commandBUFF+3
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strTRMIOP
                  _WriteCString

                  lda       commandBUFF+3
                  and       #%01000000
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strRDF
                  _WriteCString

                  lda       commandBUFF+3
                  and       #%00001111
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #4
                  jsr       showBITS

* Bytes 4..6 not used

* Byte 7

                  PushLong  #strRELADR
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strWBUS32
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%01000000
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strWBUS16
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%00100000
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strSYNC
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%00010000
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strLINKED
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%00001000
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strCMDQUE
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%00000010
                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strSFTRE
                  _WriteCString

                  lda       commandBUFF+7
                  and       #%00000001
                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

* Bytes 8

                  PushLong  #strVI
                  _WriteCString

                  lda       #8                   ; offset is 8
                  tax                            ; length is 8
                  jsr       showTEXT

* Bytes 16

                  PushLong  #strPI
                  _WriteCString

                  lda       #16
                  tax
                  jsr       showTEXT

* Bytes 32

                  PushLong  #strPRL
                  _WriteCString

                  lda       #32
                  ldx       #4
                  jsr       showTEXT

                  jmp       waitKEY

*--- Data

scsiINQUIRY       hex       12,00,00,00,00,00

strPQ             asc       0d' Peripheral qualifier: '00
strPDT            asc       ' - Peripheral device type : '00
strRMB            asc       0d' RMB: '00
strDTM            asc       ' - Device-type modifier: '00
strISO            asc       0d' ISO version: '00
strECMA           asc       ' - ECMA version: '00
strANSI           asc       ' - ANSI-approved version: '00
strAENC           asc       0d' AENC: '00
strTRMIOP         asc       ' - TrmIOP: '00
strRDF            asc       ' - Response data format: '00
strRELADR         asc       0d' RelAdr: '00
strWBUS32         asc       ' - WBus32: '00
strWBUS16         asc       ' - WBus16: '00
strSYNC           asc       ' - Sync: '00
strLINKED         asc       0d' Linked: '00
strCMDQUE         asc       ' - CmdQue: '00
strSFTRE          asc       ' - SftRe: '00
strVI             asc       0d' Vendor identification: '00
strPI             asc       0d' Product identification: '00
strPRL            asc       0d' Product revision level: '00

*----------------

doCAPACITY        =         *

                  jsr       initCOMMANDDATA

                  ldx       #10-2                ; put the pause data
]lp               lda       scsiCAPACITY,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcREADCAPACITY
                  jsr       statusCALL
                  bcc       doCAPACITY1
                  rts

doCAPACITY1

*--- Display number of blocks

                  PushLong  #strNBBLOCKS
                  _WriteCString

                  lda       commandBUFF
                  xba
                  jsr       showWORD

                  lda       commandBUFF+2
                  xba
                  jsr       showWORD

*--- Display block length

                  PushLong  #strBLOCKSIZE
                  _WriteCString

                  lda       commandBUFF+4
                  xba
                  jsr       showWORD

                  lda       commandBUFF+6
                  xba
                  jsr       showWORD

*--- We're done

                  jmp       waitKEY

*--- Data

scsiCAPACITY      hex       25,00,00,00,00,00,00,00,00,00

strNBBLOCKS       asc       0d' Number of blocks: $'00
strBLOCKSIZE      asc       0d' Size of a block: $'00

*----------------

doAUDIOPARMS      =         *

                  jsr       initCOMMANDDATA

*--- Execute command

                  ldx       #6-2                 ; put the stop data
]lp               lda       scsiAP,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcMODESENSE6        ; MODE SENSE(10)
                  jsr       statusCALL
                  bcc       doAP1
                  rts

doAP1

*--- Header

                  PushLong  #strAPMT             ; Medium type
                  _WriteCString

                  lda       commandBUFF+1
                  jsr       showBYTE

                  PushLong  #strAPDPOFUA
                  _WriteCString

                  lda       commandBUFF+2
                  and       #%00010000
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strAPEBC
                  _WriteCString

                  lda       commandBUFF+2
                  and       #%00000001
                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

*--- Parameter block descriptor

*- Density code

                  PushLong  #strAPDC
                  _WriteCString

                  lda       commandBUFF+4
                  jsr       showBYTE

*- Number of blocks

                  PushLong  #strNBBLOCKS
                  _WriteCString

                  lda       commandBUFF+5
                  xba
                  jsr       showWORD

                  lda       commandBUFF+7
                  jsr       showBYTE

*- Block length

                  PushLong  #strBLOCKSIZE
                  _WriteCString

                  lda       commandBUFF+9
                  xba
                  jsr       showWORD

                  lda       commandBUFF+11
                  jsr       showBYTE

*--- We begin at +12 (this could have been better handled)

* Byte 0

                  PushLong  #strAPPS
                  _WriteCString

                  lda       commandBUFF+12
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strAPPC
                  _WriteCString

                  lda       commandBUFF+12
                  and       #%00111111
                  asl
                  asl
                  xba
                  ldx       #6
                  jsr       showBITS

* Byte 2

                  PushLong  #strAPIMMED
                  _WriteCString

                  lda       commandBUFF+12+1
                  and       #%00000100
                  asl
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strAPSOTC
                  _WriteCString

                  lda       commandBUFF+12+1
                  and       #%00000010
                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

* Byte 5

                  PushLong  #strAPAPR
                  _WriteCString

                  lda       commandBUFF+12+5
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strAPLBA
                  _WriteCString

                  lda       commandBUFF+12+5
                  and       #%00001111
                  jsr       showBYTE

* Byte 6

                  PushLong  #strAPLBPS
                  _WriteCString

                  lda       commandBUFF+12+6
                  xba
                  jsr       showWORD

* Bytes 8/9

                  PushLong  #strAP0C
                  _WriteCString

                  lda       commandBUFF+12+8
                  and       #%00001111
                  jsr       showBYTE

                  PushLong  #strAP0V
                  _WriteCString

                  lda       commandBUFF+12+9
                  and       #%11111111
                  jsr       showBYTE

* Bytes 10/11

                  PushLong  #strAP1C
                  _WriteCString

                  lda       commandBUFF+12+10
                  and       #%00001111
                  jsr       showBYTE

                  PushLong  #strAP1V
                  _WriteCString

                  lda       commandBUFF+12+11
                  and       #%11111111
                  jsr       showBYTE

* Byte 12/13

                  PushLong  #strAP2C
                  _WriteCString

                  lda       commandBUFF+12+12
                  and       #%00001111
                  jsr       showBYTE

                  PushLong  #strAP2V
                  _WriteCString

                  lda       commandBUFF+12+13
                  and       #%11111111
                  jsr       showBYTE

* Byte 14/15

                  PushLong  #strAP3C
                  _WriteCString

                  lda       commandBUFF+12+14
                  and       #%00001111
                  jsr       showBYTE

                  PushLong  #strAP3V
                  _WriteCString

                  lda       commandBUFF+12+15
                  and       #%11111111
                  jsr       showBYTE

*--- We're done

                  jmp       waitKEY

*--- Data
* 4e is PC= changeable values, 0e=audio control parameters page

scsiAP            hex       1a,00,4e,00,00,00

strAPMT           asc       0d' Medium type: $'00
strAPDC           asc       0d' Density code: $'00
strAPDPOFUA       asc       0d' DPOFUA: '00
strAPEBC          asc       ' - EBC: '00
ascAPDC           asc       0d' CD-ROM density code: $'00
strAPPS           asc       0d' Parameters savable: '00
strAPPC           asc       ' - Page code: '00
strAPIMMED        asc       0d' Immed: '00
strAPSOTC         asc       ' - SOTC: '00
strAPAPR          asc       0d' APRVal '00
strAPLBA          asc       ' - Format of LBA/Sec.: '00
strAPLBPS         asc       0d' Logical blocks per second of audio playback: $'00
strAP0C           asc       0d' Output port 0 / Channel selection: $'00
strAP0V           asc       ' - Volume: $'00
strAP1C           asc       0d' Output port 1 / Channel selection: $'00
strAP1V           asc       ' - Volume: $'00
strAP2C           asc       0d' Output port 2 / Channel selection: $'00
strAP2V           asc       ' - Volume: $'00
strAP3C           asc       0d' Output port 3 / Channel selection: $'00
strAP3V           asc       ' - Volume: $'00

*----------------

doREADTOC         =         *

                  jsr       initCOMMANDDATA

*--- Select mode

                  lda       #"1"                 ; max key
                  ldx       #^strMSFMODE
                  ldy       #strMSFMODE
                  jsr       keyINRANGE
                  sta       fgMSF                ; in return

                  asl                            ; 0 means block
                  sep       #$20                 ; 1 means MSF
                  sta       scsiTOC+1
                  rep       #$20

*--- Execute command

                  ldx       #10-2                ; put the stop data
]lp               lda       scsiTOC,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcREADTOC           ; READ TOC
                  jsr       statusCALL
                  bcc       doREADTOC1
                  rts

doREADTOC1

*--- The TOC is read now

                  sep       #$20                 ; get track index
                  lda       commandBUFF+2
                  sta       trackFIRST
                  lda       commandBUFF+3
                  sta       trackLAST
                  sta       nbSONGS
                  rep       #$20

*--- Check track number

                  lda       nbSONGS
                  cmp       #64
                  bcc       doREADTOC2
                  rts

doREADTOC2

*--- Display the header

                  PushLong  #strFIRSTT
                  _WriteCString

                  lda       trackFIRST
                  jsr       showDECIMAL

                  PushLong  #strLASTT
                  _WriteCString

                  lda       trackLAST
                  jsr       showDECIMAL

                  PushWord  #$0d
                  _WriteChar

                  jsr       printLINE            ; print the entry list
                  jsr       waitKEY

*--- The end

                  lda       #1
                  sta       fgTOCREAD            ; say the TOC was read
                  rts

*--- Print the song list

printLINE         lda       fgMSF                ; 0 for block
                  bne       printLINE1           ; 1 for MSF

                  PushLong  #strSEPL
                  _WriteCString
                  PushWord  #$0d
                  _WriteChar
                  PushLong  #strHBLOCK
                  _WriteCString
                  PushLong  #strSEPL
                  bra       printLINE2

printLINE1        PushLong  #strSEPL1
                  _WriteCString
                  PushWord  #$0d
                  _WriteChar
                  PushLong  #strHMSF
                  _WriteCString
                  PushLong  #strSEPL1

printLINE2        _WriteCString

                  PushWord  #$0d
                  _WriteChar

*--- Now, print each entry

                  lda       #4                   ; index is 4
                  sta       indexTOC

printLINE5        PushLong  #strSEPC
                  _WriteCString

                  ldy       indexTOC
                  lda       commandBUFF+2,y
                  and       #$ff
                  jsr       showDECIMAL

                  PushLong  #strSEPC
                  _WriteCString

                  ldy       indexTOC             ; ADR
                  lda       commandBUFF+1,y
                  and       #%11110000
                  xba
                  ldx       #4
                  jsr       showBITS

                  PushLong  #strSEPC
                  _WriteCString

                  ldy       indexTOC             ; CONTROL
                  lda       commandBUFF+1,y
                  and       #%00001111
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #4
                  jsr       showBITS

                  PushLong  #strSEPC
                  _WriteCString

*--- Block or MSF

                  lda       fgMSF                ; 0 for block
                  bne       printLINE6           ; 1 for MSF

                  ldy       indexTOC
                  lda       commandBUFF+4,y
                  xba
                  jsr       showWORD

                  ldy       indexTOC
                  lda       commandBUFF+6,y
                  xba
                  jsr       showWORD
                  brl       printLINE8

*--- Show minute:second:frame

printLINE6        ldy       indexTOC             ; minute
                  lda       commandBUFF+5,y
                  and       #$ff
                  sta       minFROM
                  jsr       showDECIMAL
                  jsr       printSEP

                  ldy       indexTOC             ; second
                  lda       commandBUFF+6,y
                  and       #$ff
                  sta       secFROM
                  jsr       showDECIMAL
                  jsr       printSEP

                  ldy       indexTOC
                  lda       commandBUFF+7,y
                  and       #$ff
                  jsr       showDECIMAL

*--- Now, show length

                  PushLong  #strSEPC
                  _WriteCString

                  ldy       indexTOC             ; second
                  lda       commandBUFF+13,y
                  and       #$ff
                  sta       minTO

                  lda       commandBUFF+14,y
                  and       #$ff
                  sta       secTO

*- Calc length

                  lda       minTO                ; minutes
                  sec
                  sbc       minFROM
                  sta       minTO

                  lda       secTO
                  sec
                  sbc       secFROM
                  sta       secTO
                  bpl       printLINE7           ; secTO < secFROM

                  clc                            ; if so,
                  adc       #60                  ; correct
                  sta       secTO
                  dec       minTO

*- Subtract the 2 sec gap of the beginning

printLINE7        lda       secTO
                  sec
                  sbc       #2
                  sta       secTO
                  bpl       printLINE7B          ; secTO < secFROM

                  clc                            ; if so,
                  adc       #60                  ; correct
                  sta       secTO                ; again
                  dec       minTO

*- Show results

printLINE7B       lda       minTO
                  jsr       showDECIMAL
                  jsr       printSEP
                  lda       secTO
                  jsr       showDECIMAL

*--- End of line

printLINE8        PushLong  #strSEPC
                  _WriteCString

                  PushWord  #$0d
                  _WriteChar

                  lda       indexTOC             ; next index
                  clc
                  adc       #8
                  sta       indexTOC

                  dec       nbSONGS              ; nb songs--
                  bmi       printLINE9           ; another check
                  beq       printLINE9
                  jmp       printLINE5

printLINE9        lda       fgMSF
                  bne       printLINEA

                  PushLong  #strSEPL
                  _WriteCString
                  rts

printLINEA        PushLong  #strSEPL1
                  _WriteCString
                  rts

*---

printSEP          PushWord  #':'
                  _WriteChar
                  rts

*--- Data

scsiTOC           hex       43,00,00,00,00,00,00,00,00,00

strMSFMODE        asc       0d'Select mode (0=block, 1=MSF) '00

strFIRSTT         asc       ' First track: '00
strLASTT          asc       '  Last track: '00

strHBLOCK         asc       ' | Tr | ADR  | Ctrl | Abs Addr |'0d00
strHMSF           asc       ' | Tr | ADR  | Ctrl | Mi:Se:Fr | Duree |'0d00
strSEPL           asc       ' +=============================+'00
strSEPL1          asc       ' +=====================================+'00
strSEPC           asc       ' | '00

minFROM           ds        2
secFROM           ds        2
minTO             ds        2
secTO             ds        2

*----------------

doSUBCHANNEL      =         *

                  jsr       initCOMMANDDATA

*--- Select mode Block or MSF

                  lda       #"1"                 ; max key
                  ldx       #^strMSFMODE
                  ldy       #strMSFMODE
                  jsr       keyINRANGE

                  sta       fgMSF                ; in return
                  asl                            ; 0 means block
                  sep       #$20                 ; 1 means MSF
                  sta       scsiSUB+1
                  rep       #$20

*--- Select SubQ

                  lda       #"1"                 ; max key
                  ldx       #^strSUBQ
                  ldy       #strSUBQ
                  jsr       keyINRANGE

                  asl
                  asl
                  asl
                  asl
                  asl
                  asl
                  sep       #$20
                  sta       scsiSUB+2
                  rep       #$20

*--- Select mode

                  lda       #"3"                 ; max key
                  ldx       #^strSUBMODE
                  ldy       #strSUBMODE
                  jsr       keyINRANGE

                  sep       #$20                 ; 0-3
                  sta       scsiSUB+3
                  rep       #$20

*--- Sometimes, the track is needed

                  sep       #$20
                  lda       #1
                  sta       scsiSUB+6
                  rep       #$20

*--- Check current status and replace the track

                  jsr       getCURRENTSTATUS
                  bcs       doREADSUB1

                  sep       #$20                 ; set the track
                  lda       statusBUFF+6
                  sta       scsiSUB+6
                  rep       #$20

doREADSUB1

*--- Execute command

                  ldx       #10-2                ; put the sub data
]lp               lda       scsiSUB,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcSUBCHANNEL        ; READ SUB CHANNEL
                  jsr       statusCALL
                  bcc       doREADSUB2
                  rts

doREADSUB2

*--- The SUB CHANNEL is read now

                  jsr       doSUBHEADER
                  jsr       subBYTE04            ; for all

*- Allow 0-3

                  lda       commandBUFF+4
                  and       #$ff
                  cmp       #4
                  bcs       doREADSUB9
                  asl
                  tax
                  lda       ptrSUB,x
                  sta       doREADSUB8+1
doREADSUB8        jsr       $bdbd
doREADSUB9        jmp       waitKEY

ptrSUB            da        doSUB00
                  da        doSUB01
                  da        doSUB02
                  da        doSUB03

*--- Audio status always returned

doSUBHEADER
                  PushLong  #strAUDIOSTATUS
                  _WriteCString

                  lda       commandBUFF+1
                  and       #$ff
                  pha
                  jsr       showBYTE
                  pla

                  ldx       #-2
]lp               inx
                  inx
                  cmp       tblAUDIOSTATUS,x
                  bmi       noAUDIOSTATUS
                  bne       ]lp

                  lda       #^strAUDIOS00
                  pha
                  lda       ptrAUDIOSTATUS,x
                  pha
                  _WriteCString

noAUDIOSTATUS
                  rts

*--- Data

tblAUDIOSTATUS
                  dw        $0000
                  dw        $0011
                  dw        $0012
                  dw        $0013
                  dw        $0014
                  dw        $0015
                  dw        $ffff                ; end of table

ptrAUDIOSTATUS
                  da        strAUDIOS00
                  da        strAUDIOS11
                  da        strAUDIOS12
                  da        strAUDIOS13
                  da        strAUDIOS14
                  da        strAUDIOS15

strAUDIOSTATUS    asc       0d' Audio status $'00
strAUDIOS00       asc       ' (Audio status byte not supported or not valid)'00
strAUDIOS11       asc       ' (Audio play operation in progress)'00
strAUDIOS12       asc       ' (Audio play operation paused)'00
strAUDIOS13       asc       ' (Audio play operation successfully completed)'00
strAUDIOS14       asc       ' (Audio play operation stopped due to error)'00
strAUDIOS15       asc       ' (No current audio status to return)'00

*--- Sub-Q channel data format for mode 00

doSUB00
                  jsr       doSUB01              ; re-use

                  lda       #0                   ; UPC/Barcode
                  ldx       #16                  ; at offset 16
                  jsr       checkMCTC

                  lda       #1                   ; T ISRC
                  ldx       #32                  ; at offset 32
                  jmp       checkMCTC

*--- Sub-Q channel data format for mode 01

doSUB01
                  jsr       subBYTE05
                  jsr       subBYTE06
                  jsr       subBYTE07

*- Show Absolute CD-ROM address

                  PushLong  #strABSADR
                  _WriteCString

                  lda       scsiSUB+1
                  and       #%00000010
                  bne       doSUB01A

                  PushWord  #'$'                 ; show in blocks
                  _WriteChar

                  lda       commandBUFF+8
                  xba
                  jsr       showWORD
                  lda       commandBUFF+10
                  xba
                  jsr       showWORD
                  bra       doSUB01B

doSUB01A          lda       commandBUFF+9
                  jsr       showDECIMAL
                  jsr       printSEP
                  lda       commandBUFF+10
                  jsr       showDECIMAL
                  jsr       printSEP
                  lda       commandBUFF+11
                  jsr       showDECIMAL

*- Show Track relative CD-ROM address

doSUB01B          PushLong  #strTRELADR
                  _WriteCString

                  lda       scsiSUB+1
                  and       #%00000010
                  bne       doSUB01C

                  PushWord  #'$'                 ; show in blocks
                  _WriteChar

                  lda       commandBUFF+12
                  xba
                  jsr       showWORD
                  lda       commandBUFF+14
                  xba
                  jmp       showWORD

doSUB01C          lda       commandBUFF+13
                  jsr       showDECIMAL
                  jsr       printSEP
                  lda       commandBUFF+14
                  jsr       showDECIMAL
                  jsr       printSEP
                  lda       commandBUFF+15
                  jmp       showDECIMAL

*--- Data

strABSADR         asc       0d' Absolute CD-ROM address: '00
strTRELADR        asc       0d' Track relative CD-ROM address: '00

*--- Sub-Q channel data format for mode 02

doSUB02
                  lda       #0                   ; UPC/Barcode
                  ldx       #8                   ; at offset 8
                  jmp       checkMCTC

*--- Sub-Q channel data format for mode 03

doSUB03
                  jsr       subBYTE05
                  jsr       subBYTE06
                  lda       #1                   ; T ISRC
                  ldx       #8                   ; at offset 8
                  jmp       checkMCTC

*--- Show sub channel data format code

subBYTE04         PushLong  #strSCDFC
                  _WriteCString

                  lda       commandBUFF+4
                  jmp       showBYTE

*--- Data

strSCDFC          asc       0d' Sub channel data format code: $'00

*--- Show ADR and CONTROL

subBYTE05         PushLong  #strADR
                  _WriteCString

*- ADR

                  lda       commandBUFF+5
                  and       #%11110000
                  xba
                  ldx       #4
                  jsr       showBITS

*- Control

                  PushLong  #strCONTROL
                  _WriteCString

                  lda       commandBUFF+5
                  and       #%00001111
                  asl
                  asl
                  asl
                  asl
                  xba
                  ldx       #4
                  jmp       showBITS

*--- Data

strADR            asc       0d' ADR: '00
strCONTROL        asc       ' - Control: '00

*--- Show Track number

subBYTE06         PushLong  #strTNUMBER
                  _WriteCString

                  lda       commandBUFF+6
                  jmp       showBYTE

*--- Data

strTNUMBER        asc       0d' Track number : $'00

*--- Show index number

subBYTE07         PushLong  #strINUMBER
                  _WriteCString

                  lda       commandBUFF+7
                  jmp       showBYTE

*--- Data

strINUMBER        asc       0d' Index number: $'00

*--- Check and display MCVal or TCVal

*- Show MCVal or TCVal: data is valid if 1

checkMCTC         pha                            ; A is MC=0 or TC=1
                  phx                            ; X is index

                  cmp       #1
                  beq       checkMCTC1

                  PushLong  #strMCVal
                  bra       checkMCTC2
checkMCTC1        PushLong  #strTCVal
checkMCTC2        _WriteCString

                  plx                            ; show bit MC/TCVal
                  phx

                  lda       commandBUFF,x
                  xba
                  ldx       #1
                  jsr       showBITS

                  plx
                  pla
                  phx

*- Show string now

                  cmp       #1
                  beq       checkMCTC5

                  PushLong  #strMCN
                  bra       checkMCTC6
checkMCTC5        PushLong  #strTISRC
checkMCTC6        _WriteCString

*- If the bit is 0, no valid data, but show anyway

                  plx

* lda commandBUFF,x
* and #%10000000
* beq checkMCTC9

                  inx                            ; offset is in X, add 1
                  txa
                  ldx       #15                  ; length is 15
                  jsr       showTEXT
checkMCTC9        rts

*--- Data

strMCVal          asc       0d' MCVal: '00
strTCVal          asc       0d' TCVal: '00
strMCN            asc       0d' Media catalogue number: '00
strTISRC          asc       0d' Track ISRC: '00

*--- Data

scsiSUB           hex       42,00,00,00,00,00,00,00,00,00

strSUBQ           asc       'Select SubQ (0=off, 1=on) '00
strSUBMODE        asc       'Select Data mode'0d
                  asc       ' 0- Sub-Q channel data'0d
                  asc       ' 1- CD-ROM current position'0d
                  asc       ' 2- Media catalogue number (UPC/bar code)'0d
                  asc       ' 3- Track international standard recording code (ISRC)'0d
                  asc       'Select an entry: '00

*----------------

doPLAYSTOP        =         *

                  jsr       initCOMMANDDATA

                  lda       fgPLAY
                  eor       #1
                  sta       fgPLAY
                  bne       doPLAY

                  ldx       #6-2                 ; put the stop data
]lp               lda       scsiSTOP,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcSTARTSTOP
                  jmp       controlCALL

*- Was TOC read?

doPLAY            lda       fgTOCREAD            ; was TOC already read for this disk?
                  bne       doPLAY1              ; yes

                  jsr       doREADTOC
                  bcc       doPLAY1

                  lda       #1                   ; error, say first track
                  sta       trackFIRST
                  sta       trackLAST

doPLAY1           sep       #$20                 ; copy first/last tracks
                  lda       trackFIRST
                  sta       scsiPLAY+4
                  lda       trackLAST
                  sta       scsiPLAY+7
                  rep       #$20

*---

                  ldx       #10-2                ; put the play data
]lp               lda       scsiPLAY,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcPATI              ; PLAY AUDIO TRACK INDEX
                  jmp       controlCALL

*--- Data

scsiPLAY          hex       48,00,00,00,01,00,00,02,00,00

*----------------

doPAUSERESUME     =         *

                  jsr       initCOMMANDDATA

                  lda       fgPAUSE
                  eor       #1
                  sta       fgPAUSE
                  bne       doPAUSE

                  ldx       #10-2                ; put the resume data
]lp               lda       scsiRESUME,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcPAUSERESUME
                  jmp       controlCALL

doPAUSE           ldx       #10-2                ; put the pause data
]lp               lda       scsiPAUSE,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcPAUSERESUME
                  jmp       controlCALL

*--- Data

scsiPAUSE         hex       4b,00,00,00,00,00,00,00,00,00
scsiRESUME        hex       4b,00,00,00,00,00,00,00,01,00

*----------------
* The standard way would be
* to check if a media is online

doINSERTEJECT     =         *

                  jsr       initCOMMANDDATA

                  lda       fgINSERT
                  eor       #1
                  sta       fgINSERT
                  beq       doINSERT

                  ldx       #6-2                 ; put the eject data
]lp               lda       scsiEJECT,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcSTARTSTOP
                  jmp       controlCALL

doINSERT          ldx       #6-2                 ; put the insert data
]lp               lda       scsiINSERT,x
                  sta       commandDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcSTARTSTOP
                  jmp       controlCALL

*--- Data

scsiINSERT        hex       1b,00,00,00,03,00
scsiEJECT         hex       1b,00,00,00,02,00
scsiREADY         hex       1b,00,00,00,01,00
scsiSTOP          hex       1b,00,00,00,00,00

*--- Are we already playing?

getCURRENTSTATUS

                  ldx       #10-2                ; put the sub data
]lp               lda       scsiSTATUS,x
                  sta       statusDATA,x
                  dex
                  dex
                  bpl       ]lp

                  lda       #dcSUBCHANNEL        ; READ SUB CHANNEL
                  jsr       statusCALL2
                  bcc       getCS1
                  rts

getCS1            lda       statusBUFF+1
                  and       #$ff
                  cmp       #$11                 ; play in progress
                  beq       getCS2
                  cmp       #$12
                  beq       getCS2
                  sec                            ; error
                  hex       24
getCS2            clc                            ; we're playing
                  rts

*--- Data

scsiSTATUS        hex       42,00,40,01,00,00,00,00,00,00

*--- Routines

initFG            stz       fgMSF                ; init all flags
                  stz       fgSUB
                  stz       fgPLAY
                  stz       fgPAUSE
                  stz       fgINSERT
                  stz       fgTOCREAD            ; consider TOC was not read
                  rts

*--- SCSI routines

initCOMMANDDATA                                  ; clear SCSI command buffer
                  ldx       #12-2
]lp               stz       commandDATA,x
                  dex
                  dex
                  bpl       ]lp
                  rts

*--- DStatus
* Uses the DControl parm buffer

statusCALL        sta       proCONTROL+4         ; SCSI driver command
                  sep       #$20                 ; SCSI commands are 8-bit
                  sta       commandDATA          ; SCSI command
                  rep       #$20

                  jsl       GSOS                 ; call it
                  dw        $202d
                  adrl      proCONTROL
                  bra       showERR

*--- DStatus
* Uses the DControl parm buffer

statusCALL2       sta       proSTATUS+4          ; SCSI driver command
                  sep       #$20                 ; SCSI commands are 8-bit
                  sta       statusDATA           ; SCSI command
                  rep       #$20

                  jsl       GSOS                 ; call it
                  dw        $202d
                  adrl      proSTATUS
                  rts

*--- DControl

controlCALL       sta       proCONTROL+4         ; SCSI driver command
                  sep       #$20                 ; SCSI commands are 8-bit
                  sta       commandDATA          ; SCSI command
                  rep       #$20

                  jsl       GSOS                 ; call it
                  dw        $202e
                  adrl      proCONTROL

*--- Show GS/OS error code

showERR           bcc       showNOERR
                  sta       errCODE              ; save error code

                  PushLong  #strERROR
                  _WriteCString

                  lda       errCODE
                  jsr       showWORD             ; display it

                  PushWord  #$0d
                  _WriteChar
                  sec                            ; force carry
showNOERR         rts

*--- Data

fgMSF             ds        2                    ; 0/1
fgSUB             ds        2                    ; 0/1/2/3
fgPLAY            ds        2                    ; 0/1
fgPAUSE           ds        2                    ; 0/1
fgINSERT          ds        2                    ; 0/1

* For music

fgTOCREAD         ds        2                    ; was TOC read?
trackFIRST        ds        2
trackLAST         ds        2
indexTOC          ds        2
nbSONGS           ds        2                    ; nb of songs on disc

strDEVICEMENU
                  asc       0d'Using SCSI CD-ROM device $'
strDEVMENU        asc       '0000'0d
                  asc       ' 0. Go back to previous menu'0d
                  asc       ' 1. Inquiry disk'0d
                  asc       ' 2. Disk capacity'0d
                  asc       ' 3. Audio control parameters'0d
                  asc       ' 4. Read TOC'0d
                  asc       ' 5. Read Sub Channel'0d
                  asc       ' 6. Play/Stop disk'0d
                  asc       ' 7. Pause/Resume'0d
                  asc       ' 8. Insert/Eject disk'0d00

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Display in string offset
* A: offset in
* X: nb of chars to print
* offset from commandBUFF

showTEXT          ldy       #^commandBUFF
                  phy
                  clc
                  adc       #commandBUFF
                  pha
                  PushWord  #0
                  phx
                  _TextWriteBlock
                  rts

*---------- Display decimal
* A: word

showDECIMAL       and       #$ff
                  pha

                  lda       #'  '                ; space by default
                  sta       strDECIMAL

                  PushLong  #strDECIMAL
                  PushWord  #2
                  PushWord  #0
                  _Int2Dec

                  PushLong  #strDECIMAL
                  _WriteCString
                  rts

*--- Data

strDECIMAL        asc       '00'00

*---------- Display bits
* A: word
* X: nb of bits to display (1-8)

showBITS          cpx       #16
                  bcc       showBITS0
                  rts

showBITS0         ldy       #0                   ; index
]lp               pha
                  asl                            ; bit in carry
                  bcs       showBITS1

                  lda       #'00'                ; output 0
                  bra       showBITS2
showBITS1         lda       #'11'                ; output 1
showBITS2         sta       strBITS,y

                  pla
                  asl
                  iny
                  dex
                  bne       ]lp

                  lda       #0                   ; end C string
                  sta       strBITS,y

                  PushLong  #strBITS             ; show the string
                  _WriteCString
                  rts

*--- Data

strBITS           ds        18                   ; 16 bits + 2 zeros

*---------- Display a byte

showBYTE          pha                            ; from a byte to a string
                  pha
                  pha                            ; <= here, really
                  _HexIt

                  lda       #'  '                ; empty string by default
                  sta       strBYTE

                  pla                            ; we don't use
                  pla
                  sta       strBYTE

                  PushLong  #strBYTEP            ; show the string
                  _WriteString
                  rts

*--- Data

strBYTEP          dfb       2                    ; for a Pascal string
strBYTE           asc       '  '

*---------- Display a word

showWORD          pha                            ; from a word to a string
                  pha
                  pha                            ; <= here, really
                  _HexIt
                  PullLong  strHEX

                  PushLong  #strHEX              ; show the string
                  _WriteCString
                  rts

*--- Data

strHEX            asc       '0000'00

*---------- Wait for a key in a range 0-Acc
* A: high key
* X: high ptr to C string
* Y: low ptr to C string

keyINRANGE        sta       keyHIGH
                  sty       strKEY
                  stx       strKEY+2

]lp               PushLong  strKEY
                  _WriteCString

                  PushWord  #0
                  PushWord  #1                   ; echo char
                  _ReadChar
                  pla
                  and       #$ff
                  cmp       #"0"
                  bcc       ]lp
                  cmp       keyHIGH
                  bcc       keyINRANGE9
                  beq       keyINRANGE9
                  bra       ]lp

keyINRANGE9       sec
                  sbc       #"0"
                  pha
                  bra       waitKEY8

*--- Data

strKEY            ds        4                    ; pointer to string
keyHIGH           ds        2

*---------- Wait for a key

waitKEY           PushWord  #$0d
                  _WriteChar

                  PushWord  #0
                  PushWord  #0                   ; don't echo char
                  _ReadChar
                  bra       waitKEY1             ; go below

*---------- Wait for a key

waitFORKEY        PushLong  #strINPUT
                  _WriteCString

                  PushWord  #0                   ; wait for key
                  PushWord  #1                   ; echo char
                  _ReadChar

waitKEY1          lda       1,s                  ; check CR
                  and       #$ff                 ; of typed
                  sta       1,s                  ; in char
                  cmp       #$8d
                  beq       waitKEY9

waitKEY8          PushWord  #$0d                 ; return
                  _WriteChar

waitKEY9          pla                            ; restore entered char
                  rts

*--- Data

strINPUT          asc       'Select an entry: '00

*----------------------------
* DATA
*----------------------------

errCODE           ds        2                    ; GS/OS error code
strERROR          asc       0d'<!> GS/OS error code $'00

*---

proQUIT           dw        2                    ; pcount
                  ds        4                    ; pathname
                  ds        2                    ; flags

proDINFO          dw        8                    ; Parms for DInfo
                  ds        2                    ; 02 device num
                  adrl      devINFO              ; 04 device name
                  ds        2                    ; 08 characteristics
                  ds        4                    ; 0A total blocks
                  ds        2                    ; 0E slot number
                  ds        2                    ; 10 unit number
                  ds        2                    ; 12 version
                  ds        2                    ; 14 device id

devINFO           dw        $0032                ; buffer size
devINFO1          db        $00                  ; length
devINFO2          db        $00
devINFO3          ds        $30                  ; data

proSTATUS         dw        5                    ; 00 pcount
                  ds        2                    ; 02 device num
                  dw        $8000                ; 04 status/control code
                  adrl      statusLIST           ; 06 status list
                  adrl      1024                 ; 0A request count
                  ds        4                    ; 0E transfer count

statusLIST        ds        2                    ; always 0000
statusDATA        hex       00                   ; 00
                  hex       00                   ; 01
                  hex       00                   ; 02
                  hex       00                   ; 03
                  hex       00                   ; 04
                  hex       00                   ; 05
                  hex       00                   ; 06
                  hex       00                   ; 07
                  hex       00                   ; 08
                  hex       00                   ; 09
                  hex       00                   ; 10
                  hex       00                   ; 11
                  adrl      statusBUFF
statusBUFF        ds        1234                 ; more than 1024

proCONTROL        dw        5                    ; 00 pcount
                  ds        2                    ; 02 device num
                  dw        $8000                ; 04 status/control code
                  adrl      controlLIST          ; 06 status list
                  adrl      1024                 ; 0A request count
                  ds        4                    ; 0E transfer count

controlLIST       ds        2                    ; always 0000
commandDATA       hex       00                   ; 00
                  hex       00                   ; 01
                  hex       00                   ; 02
                  hex       00                   ; 03
                  hex       00                   ; 04
                  hex       00                   ; 05
                  hex       00                   ; 06
                  hex       00                   ; 07
                  hex       00                   ; 08
                  hex       00                   ; 09
                  hex       00                   ; 10
                  hex       00                   ; 11
commandPTR        adrl      commandBUFF
commandBUFF       ds        1234                 ; more than 1024

*----------

appID             ds        2
myID              ds        2

myDP              ds        2
ptrBUFFER         ds        4
haBUFFER          ds        4

