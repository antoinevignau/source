*
* DOS 3.3 FST
*

                   lst   off
                   rel
                   typ   $BD
                   dsk   DOS3.3.FST.L

                   mx    %00

*
* EQUATES
*

FST_DOS33          =     2
FST_BLOCKSIZE      =     $100
FST_NBBLOCKS       =     $230

rootDIR            =     $0F

iFCR_ID            =     $00
iFCR_NAME          =     $02
iFCR_FST           =     $06
iFCR_VCR           =     $08
iFCR_0A            =     $0A                 ; not used ?
iFCR_SEG1          =     $0C
iFCR_10            =     $10
iFCR_12            =     $12
iFCR_ACCESS        =     $14
iFCR_SEG2          =     $16
iFCR_EOF           =     $1A
iFCR_AUXTYPE       =     $1E
iFCR_MARK          =     $20
iFCR_TYPE          =     $24
iFCR_OTYPE         =     $26
iFCR_NBSEC         =     $28
iFCR_DISPLACEMENT  =     $2C
iFCR_2E            =     $2E
iFCR_TS            =     $30                 ; Track/Sector of data!

iVCR_ID            =     $00
iVCR_NAME          =     $02
iVCR_FLAGS         =     $06
iVCR_BUSY          =     $08
iVCR_FST           =     $0A
iVCR_DEVICEID      =     $0C
iVCR_SEGMENT       =     $0E                 ; virtual pointer to VTOC segment (TRACK $11)
iVCR_LENGTH        =     $12                 ; number of sectors of VTOC

* GS/OS calls

DEV_DISPATCHER     EQU   $01FC00
ALLOC_SEG          EQU   $01FC1C
RELEASE_SEG        EQU   $01FC20
ALLOC_VCR          EQU   $01FC24
RELEASE_VCR        EQU   $01FC28
ALLOC_FCR          EQU   $01FC2C
RELEASE_FCR        EQU   $01FC30
SWAP_OUT           EQU   $01FC34
DEREF              EQU   $01FC38
GET_SYS_GBUF       EQU   $01FC3C
SYS_EXIT           EQU   $01FC40
FIND_VCR           EQU   $01FC48
GET_FCR            EQU   $01FC64
LOCK_MEM           EQU   $01FC68
UNLOCK_MEM         EQU   $01FC6C
MOVE_INFO          EQU   $01FC70

* GS/OS direct page

deviceNum          =     $00
callNum            =     $02
bufferPtr          =     $04
controlListPtr     =     $04
requestCount       =     $08
transferCount      =     $0C
blockNum           =     $10
blockSize          =     $14
FSTNum             =     $16                 ; *
statusCode         =     $16                 ; *
controlCode        =     $16                 ; *
volumeID           =     $18
cachePriority      =     $1A
cachePointer       =     $1C
dibPointer         =     $20

ptrParamBlock      =     $32
lastDevice         =     $36
virtualFCR         =     $3A
virtualVCR         =     $3E

*
* FST direct page
*

ptrSEGMENT         =     $80
ptrVOLNAME         =     $84
ptrVCR             =     $88
ptrVTOC            =     $8C
ptrFCR             =     $90
ptrFCR2            =     $94
ptrGSOSBUFFER      =     $98
ptrVOLNAME2        =     $A0
ptrVOLNAME3        =     $A4
ptrFILENAME        =     $A8
shtVOLNAME         =     $AC
ptrVTOC2           =     $AE
shtFILENAME        =     $B2
gsosOUTPUT         =     $B4
ptrL01AA           =     $B8
shtPARAMETERS      =     $C2

*
* FST CODE
*

                   ASC   'FST '              ; FST signature
                   ADRL  L098C               ; call handler entry point
                   ADRL  L0ABC               ; GS/OS entry point
                   DW    FST_DOS33           ; file system ID

                   DW    $3803               ; attributes
* 0001_1000_0000_0011
* 0001 clear high bit of pathname characters
* 1000 read-only FST
* 0011 Apple II format

                   DW    $0104               ; version
                   DW    FST_BLOCKSIZE       ; block size
                   ADRL  $00000230           ; max volume size (blocks)
                   ADRL  $00000020
                   ADRL  $FFFFFFFF           ; max file size (bytes)
                   ADRL  $00000000
                   STR   'Apple II DOS 3.3'  ; FST name
                   STR   'DOS 3.3 FST           v01.03'
                   DW    $0000
                   ASC   'DOS 3.3 FST. Written by Monte Benaresh, '
                   ASC   'maintained by Cary Farrier and Jack Valois.  '
                   ASC   'Tested by Linda Pan.  Copyright 1992 Apple Computer'
                   ASC   'Erase/Format capabilities by Brutal Deluxe Software, 2008'

haSEGMENT          ADRL  $00000000
tmpDEVICE          DW    $0000
L00E2              DW    $0000
                   DB    $00
                   DB    $00

L00E6              DW    $0000
L00E8              DW    $0000
tmpLENGTH          DW    $0000
tmpMASK            DW    $0000
L00EE              DW    $0000
L00F0              DW    $0000

fgCLASS            DW    $0000
fgNBPARAMS         DW    $0000
                   DB    $00
                   DB    $00
                   DB    $00
                   DB    $00
                   DB    $00
                   DB    $00

tmpTOSKIP          DW    $0000
L00FE              DW    $0000
                   DB    $00
                   DB    $00
                   DB    $00
                   DB    $00

tmpEOF             DS    4
tmpSTART           DS    4
                   DB    $00
                   DB    $00

tmpTS              DW    $0000
tmpEND             DS    4
L0114              DW    $0000
L0116              DW    $0000
L0118              DW    $0000
tmpMARK            DS    4
tmpREQUESTCOUNT    DS    4
L0122              DW    $0000
L0124              DW    $0000
tmpBLOCKSIZE       DW    $0000
tmpTRANSFERCOUNT   DS    4
                   DB    $00
                   DB    $00

L012E              DW    $0000
*L0130 DW $0000
*L0132 DW $0000
gsosBUFFER         ADRL  $00000000
textMODE           DW    $0000
errVOLUME          DW    $0000
                   DB    $00
                   DB    $00
                   DB    $00
                   DB    $00

errMAIN            DW    $0000
maxPARAMS          DW    $0000
minPARAMS          DW    $0000

L0146              DS    $32                 ; VOLUNENAME (PROBABLY PARENT)
L0178              DS    $32                 ; FILENAME
L01AA              DS    $32                 ; VOLUMENAME
L01DC              DS    $32                 ; COMPLETE :DOS3.3

intENTRYNB         DW    $0000
intOFILETYPE       DW    $0000
intFILETYPE        DW    $0000
intACCESS          DW    $0000
intAUXTYPE         DW    $0000
intEOF             DS    4
intNBSEC           DW    $0000
theENTRY           DW    $0000
intSTORAGE         DW    $0001
                   DW    $0002
                   DB    $00
                   DB    $00

*
* OPEN
*

OPEN               STZ   errOPEN
                   JSL   LOCK_MEM
                   JSR   doOPEN
                   STA   errOPEN
                   LDA   haSEGMENT
                   TAX
                   ORA   haSEGMENT+2
                   BEQ   L0243
                   LDY   haSEGMENT+2
                   JSL   RELEASE_SEG
L0243              JSL   UNLOCK_MEM
                   LDA   errOPEN
                   CMP   #$0001
                   BCC   L0252
                   ORA   errMAIN
L0252              JMPL  SYS_EXIT

errOPEN            DW    $0000

*
* VOLUME
*

VOLUME             STZ   errVOLUME
                   JSL   LOCK_MEM
                   JSR   getDEVICEID
                   BCS   L02D5
                   BEQ   L026B
                   LDA   #$0052
                   BRA   L02D5

L026B              LDA   fgCLASS
                   BEQ   L0294

                   LDY   #$0006              ; volName
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2
                   LDA   #$0018              ; length of GSOS output string
                   CMP   [gsosOUTPUT]
                   BCC   L0292
                   LDA   #$0015              ; the length it must be!
                   LDY   #$0002
                   STA   [gsosOUTPUT],Y
                   LDA   #$004F              ; bufferTooSmall
                   BRL   L043F
L0292              BRA   L02A1

L0294              LDY   #$0004              ; do the same for class 0 calls
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2

*

L02A1              LDA   #L01AA              ; Get memory for volume info
                   STA   ptrL01AA
                   LDA   #$1000
                   JSL   ALLOC_SEG
                   BCC   L02B5
                   LDA   #$0054
                   BRL   L043F
L02B5              STX   haSEGMENT
                   STY   haSEGMENT+2
                   JSL   DEREF
                   STX   ptrSEGMENT
                   STY   ptrSEGMENT+2
                   JSR   getVOLUMENAME
                   BCC   L02D9
                   CMP   #$0022
                   BEQ   L02D2
                   CMP   #$002C
                   BNE   L02D5
L02D2              LDA   #$0052
L02D5              SEC
                   BRL   L043F

*

L02D9              LDA   #L01AA
                   STA   ptrVOLNAME
                   LDA   #^L01AA
                   STA   ptrVOLNAME+2
                   LDA   deviceNum
                   STA   tmpDEVICE
                   JSR   createVCR
                   BCC   L0354
                   CMP   #$0057
                   BNE   L02D5

                   LDA   $42
                   AND   #$4000
                   BEQ   L02FE

L02F9              LDA   #$0057
                   BRA   L02D5

L02FE              LDA   fgCLASS
                   BEQ   L031C

                   LDA   (ptrL01AA)
                   INC
                   LDY   #$0002
                   STA   [gsosOUTPUT],Y
                   LDA   gsosOUTPUT
                   CLC
                   ADC   #$0003
                   STA   gsosOUTPUT
                   BCC   L0317
                   INC   gsosOUTPUT+2
L0317              LDY   #$0002
                   BRA   L0321

L031C              LDA   (ptrL01AA)
                   INC
                   STA   [gsosOUTPUT]

L0321              SEP   #$20
                   LDY   #$0002
L0326              LDA   (ptrL01AA),Y
                   BEQ   L032F
                   STA   [gsosOUTPUT],Y
                   INY
                   BPL   L0326

L032F              REP   #$20
                   LDA   fgCLASS
                   BNE   L0345

                   LDY   #$0001
                   LDA   [gsosOUTPUT],Y
                   AND   #$FF00
                   ORA   #$002F              ; /
                   STA   [gsosOUTPUT],Y
                   BRA   L02F9
L0345              LDY   #$0001
                   LDA   [gsosOUTPUT],Y
                   AND   #$FF00
                   ORA   #$003A              ; :
                   STA   [gsosOUTPUT],Y
                   BRA   L02F9

*

L0354              LDA   fgCLASS
                   BEQ   L0372

                   LDA   (ptrL01AA)
                   INC
                   LDY   #$0002
                   STA   [gsosOUTPUT],Y
                   LDA   gsosOUTPUT
                   CLC
                   ADC   #$0003
                   STA   gsosOUTPUT
                   BCC   L036D
                   INC   gsosOUTPUT+2
L036D              LDY   #$0002
                   BRA   L0377

L0372              LDA   (ptrL01AA)
                   INC
                   STA   [gsosOUTPUT]
L0377              SEP   #$20
                   LDY   #$0002
L037C              LDA   (ptrL01AA),Y
                   BEQ   L0385
                   STA   [gsosOUTPUT],Y
                   INY
                   BPL   L037C

L0385              REP   #$20
                   LDA   fgCLASS
                   BNE   L03D1

                   LDY   #$0001
                   LDA   [gsosOUTPUT],Y
                   AND   #$FF00
                   ORA   #$002F
                   STA   [gsosOUTPUT],Y
                   LDY   #$0035
                   LDA   [ptrVTOC],Y
                   AND   #$0020
                   BNE   L03A8
                   LDA   #$0230              ; 560
                   BRA   L03AB
L03A8              LDA   #$0640              ; 1600
L03AB              LDY   #$0008              ; totalBlocks
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   JSR   doFREEBLOCKS
                   LDY   #$000C              ;  freeBlocks
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   LDA   #FST_DOS33
                   LDY   #$0010              ; fileSysID
                   STA   [ptrParamBlock],Y
                   CLC
                   BRA   L043F

L03D1              LDY   #$0001              ; class 1 calls
                   LDA   [gsosOUTPUT],Y
                   AND   #$FF00
                   ORA   #$003A
                   STA   [gsosOUTPUT],Y
                   LDA   fgNBPARAMS
                   STA   L0474
                   DEC   L0474
                   DEC   L0474
                   DEC   L0474
                   BMI   L043F
                   LDY   #$0035
                   LDA   [ptrVTOC],Y
                   AND   #$0020
                   BNE   L03FE
                   LDA   #$0230              ; 560
                   BRA   L0401
L03FE              LDA   #$0640              ; 1600
L0401              LDY   #$000A
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   DEC   L0474
                   BMI   L043F
                   JSR   doFREEBLOCKS
                   LDY   #$000E
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   DEC   L0474
                   BMI   L043F
                   LDA   #FST_DOS33
                   LDY   #$0012
                   STA   [ptrParamBlock],Y
                   DEC   L0474
                   BMI   L043F
                   LDA   #FST_BLOCKSIZE
                   LDY   #$0014
                   STA   [ptrParamBlock],Y
                   CLC
                   LDA   #$0000

*

L043F              PHA
                   PHP
                   BCC   L0459
                   BIT   errVOLUME
                   BPL   L0459
                   LDY   #iVCR_BUSY
                   LDA   #$0000
                   STA   [ptrVCR],Y
                   LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   JSL   RELEASE_VCR

L0459              LDA   haSEGMENT
                   TAX
                   ORA   haSEGMENT+2
                   BEQ   L0469
                   LDY   haSEGMENT+2
                   JSL   RELEASE_SEG
L0469              PLP
                   PLA
                   BCC   L0470
                   ORA   errMAIN
L0470              JMPL  SYS_EXIT

L0474              DW    $0000

*
* TRACK 11 / SECTOR 0

doFREEBLOCKS       LDY   #$0035              ; number of tracks
                   LDA   [ptrVTOC],Y
                   AND   #$00FF
                   LSR
                   LSR
                   LSR
                   LSR
                   STA   L04CC
                   STZ   L04CE
                   LDY   #$0034              ; number of sectors
                   LDA   [ptrVTOC],Y
                   AND   #$00FF
                   STA   L04D0

L0493              LDA   L04CC
                   STA   L04D2
                   LDA   L04D0
                   DEC
                   BMI   L04C8
                   STA   L04D0
                   ASL
                   ASL
                   ADC   #$0038              ; +56
                   TAY
L04A8              LDA   [ptrVTOC],Y
                   STA   L04D4
                   LDA   L04CE
                   LDX   #$0010              ; *16
L04B3              ASL   L04D4
                   ADC   #$0000
                   DEX
                   BNE   L04B3
                   STA   L04CE
                   DEC   L04D2
                   BEQ   L0493
                   INY
                   INY
                   BRA   L04A8
L04C8              LDA   L04CE
                   RTS

L04CC              DW    $0000
L04CE              DW    $0000
L04D0              DW    $0000
L04D2              DW    $0000
L04D4              DW    $0000

*
* GET FILE INFO
*

*GETFILEINFO STZ L0130
* STZ L0132
GETFILEINFO        JSL   LOCK_MEM
                   JSR   updateVCR
                   BCC   L04E8
                   BRL   L05E6

L04E8              STZ   L0608
                   LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC
                   STY   ptrVTOC+2
                   LDY   #iVCR_LENGTH
                   LDA   [ptrVCR],Y
                   STA   tmpLENGTH
                   LDA   (shtFILENAME)
                   BNE   L0534

                   STZ   intAUXTYPE
                   STZ   intEOF+2
                   STZ   intNBSEC
                   LDA   tmpLENGTH
                   INC
                   LDX   fgCLASS
                   BNE   L051F
                   STA   intNBSEC

L051F              XBA
                   STA   intEOF

                   LDA   #rootDIR            ; rootDIR
                   STA   intFILETYPE
                   STA   intSTORAGE
                   LDA   #$00C3              ; locked
                   STA   intACCESS
                   BRA   L056C

L0534              LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   BEQ   L0540
                   JSR   checkFCR
                   BCC   L05B4
L0540              JSR   L14A7
                   BCC   L054B
                   LDA   #$0051
                   BRL   L05E6
L054B              LDA   L00F0
                   BPL   L0556
                   LDA   #$0046
                   BRL   L05E6
L0556              LDA   gsosBUFFER
                   STA   ptrGSOSBUFFER
                   LDA   gsosBUFFER+2
                   STA   ptrGSOSBUFFER+2
                   LDA   #$0002
                   STA   callNum
                   JSR   getORIGINAL         ; Driver_Read
                   BCC   L056C
                   BRA   L05E5

L056C              LDA   fgCLASS
                   BNE   L0592

                   LDA   #$0001              ; class 0
                   STA   fgNBPARAMS
                   LDA   intFILETYPE
                   CMP   #rootDIR
                   BNE   L0585

                   LDA   #$0230              ; 560
                   STA   intAUXTYPE

L0585              LDA   #L0CD0
                   STA   shtPARAMETERS
                   JSR   setPARAMETERS
                   LDA   #$0000
                   BRA   L05E6

L0592              LDA   #L0CEA
                   STA   shtPARAMETERS
                   JSR   setPARAMETERS
                   LDA   fgNBPARAMS
                   CMP   #$0008
                   BCC   L05AF
                   LDY   #$0020
                   JSR   setOPTIONLIST
                   BCC   L05AF
                   LDA   #$004F
                   BRA   L05E6
L05AF              LDA   #$0000
                   BRA   L05E6
L05B4              LDY   #iFCR_ACCESS
                   LDA   [ptrFCR2],Y
                   STA   intACCESS
                   LDY   #iFCR_EOF
                   LDA   [ptrFCR2],Y
                   STA   intEOF
                   INY
                   INY
                   LDA   [ptrFCR2],Y
                   STA   intEOF+2
                   LDY   #iFCR_AUXTYPE
                   LDA   [ptrFCR2],Y
                   STA   intAUXTYPE
                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR2],Y
                   STA   intFILETYPE
                   LDY   #iFCR_NBSEC
                   LDA   [ptrFCR2],Y
                   STA   intNBSEC
                   BRA   L056C
L05E5              SEC

L05E6              PHA
                   LDA   haSEGMENT
                   TAX
                   ORA   haSEGMENT+2
                   BEQ   L05F7
                   LDY   haSEGMENT+2
                   JSL   RELEASE_SEG
L05F7              JSL   UNLOCK_MEM
                   PLA
                   CMP   #$0001
                   BCC   L0604
                   ORA   errMAIN
L0604              JMPL  SYS_EXIT

L0608              DW    $0000

*
* JUDGENAME
*

JUDGENAME          =     *

                   jsl   LOCK_MEM

                   lda   [ptrParamBlock]
                   sta   nbParams

                   ldy   #2
                   lda   [ptrParamBlock],y
                   cmp   #FST_DOS33
                   beq   judge1

                   lda   #$0064              ; invalidFSTID
                   sec
                   brl   judge99

judge1             ldy   #4
                   lda   [ptrParamBlock],y
                   cmp   #$0004
                   bcc   judge2

                   lda   #$0053              ; paramRangeError
                   sec
                   brl   judge99

judge2             dec   nbParams
                   dec   nbParams
                   lda   nbParams
                   bne   judge3
                   lda   #0
                   clc
                   brl   judge99

judge3             lda   #strDOS33
                   ldy   #6
                   sta   [ptrParamBlock],y
                   lda   #^strDOS33
                   ldy   #8
                   sta   [ptrParamBlock],y

                   dec   nbParams
                   lda   nbParams
                   bne   judge4
                   lda   #0
                   clc
                   brl   judge99

judge4             lda   #30
                   ldy   #$000a
                   sta   [ptrParamBlock],y

                   dec   nbParams
                   lda   nbParams
                   bne   judge5
                   lda   #0
                   clc
                   brl   judge99

judge5             dec   nbParams
                   lda   nbParams
                   bne   judge6
                   lda   #0
                   clc
                   brl   judge99

judge6             lda   #0                  ; nameFlags
                   ldy   #$0010
                   sta   [ptrParamBlock],y

                   clc

*-----------

judge99            pha
                   php

                   jsl   UNLOCK_MEM

                   plp
                   pla
                   jmpl  SYS_EXIT

nbParams           ds    2

strDOS33           str   'DOS 3.3 file names may contain any character except a comma, with a maximum name length of 30 characters.'

*
* FORMAT
*

FORMAT             =     *
ERASE              =     *

                   jsl   LOCK_MEM

                   JSR   getDEVICEID
                   BCS   errFORMAT
                   BEQ   okFORMAT
                   LDA   #$0052
                   BRA   errFORMAT

* jsr swapDEVICE
okFORMAT           jsr   formatDEVICE
                   bcs   errFORMAT
                   jsl   UNLOCK_MEM

                   lda   #0
                   clc
errFORMAT          jmpl  SYS_EXIT

*-----------

formatDEVICE       =     *

                   lda   #6                  ; Driver_Control
                   sta   callNum
                   lda   #1                  ; FormatDevice
                   sta   controlCode

                   lda   #formatBuffer
                   sta   controlListPtr
                   lda   #^formatBuffer
                   sta   controlListPtr+2

                   lda   #16
                   sta   requestCount
                   stz   requestCount+2

                   lda   #FST_NBBLOCKS
                   sta   blockNum
                   stz   blockNum+2

                   lda   #FST_BLOCKSIZE
                   sta   blockSize

]lp                JSL   DEV_DISPATCHER
                   bcc   writeALL
                   CMP   #$002E
                   BEQ   ]lp
                   SEC
                   RTS

*---- 2nd step: write data

writeALL           lda   #3
                   sta   callNum
                   lda   #FST_BLOCKSIZE
                   sta   blockSize
                   lda   #FST_DOS33
                   sta   FSTNum
                   stz   volumeID
                   stz   cachePriority

                   lda   #DOS33
                   sta   bufferPtr
                   lda   #^DOS33
                   sta   bufferPtr+2
                   lda   #$2500              ; 37 sectors
                   sta   requestCount
                   stz   requestCount+2
                   stz   blockNum            ; T0/S0
                   stz   blockNum+2
                   jsr   doACTION
                   bcc   doTRACK11
                   rts

doTRACK11          lda   #TRACK11
                   sta   bufferPtr
                   lda   #^TRACK11
                   sta   bufferPtr+2
                   lda   #$1000              ; 16 sectors
                   sta   requestCount
                   stz   requestCount+2
                   lda   #$0110              ; track $11
                   sta   blockNum
                   stz   blockNum+2
                   jsr   doACTION
                   bcc   doHELLO
                   rts

doHELLO            lda   #HELLO
                   sta   bufferPtr
                   lda   #^HELLO
                   sta   bufferPtr+2
                   lda   #$0200              ; 2 sectors
                   sta   requestCount
                   stz   requestCount+2
                   lda   #$012E              ; track $12/$0E
                   sta   blockNum
                   stz   blockNum+2
                   jsr   doACTION
                   rts

*-----------

swapDEVICE         lda   lastDevice
                   jsl   SWAP_OUT
                   rts

*-----------

doACTION           JSL   DEV_DISPATCHER
                   bcc   doACTION99
                   CMP   #$002E
                   BEQ   doACTION
                   SEC
doACTION99         RTS

*-----------

formatBuffer       ds    16

*----------------------------

*
* GETDIRENTRY
*

GETDIRENTRY        JSL   LOCK_MEM
                   LDX   virtualFCR
                   LDY   virtualFCR+2
                   JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2
                   LDX   virtualVCR
                   LDY   virtualVCR+2
                   JSL   DEREF
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDA   #$1000
                   JSL   ALLOC_SEG
                   BCC   L0633
                   LDA   #$0054
                   RTS

L0633              STX   haSEGMENT
                   STY   haSEGMENT+2
                   JSL   DEREF
                   STX   ptrSEGMENT
                   STY   ptrSEGMENT+2
                   LDA   gsosBUFFER
                   STA   ptrGSOSBUFFER
                   LDA   gsosBUFFER+2
                   STA   ptrGSOSBUFFER+2

                   LDA   fgCLASS
                   JSR   doGETDIRENTRY

                   PHA
                   LDA   haSEGMENT
                   TAX
                   ORA   haSEGMENT+2
                   BEQ   L0662
                   LDY   haSEGMENT+2
                   JSL   RELEASE_SEG
L0662              JSL   UNLOCK_MEM
                   PLA
                   CMP   #$0001
                   BCC   L066F
                   ORA   errMAIN
L066F              JMPL  SYS_EXIT

*
* READ
*

READ               JSL   LOCK_MEM
                   LDX   virtualFCR
                   LDY   virtualFCR+2
                   JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2
                   LDX   virtualVCR
                   LDY   virtualVCR+2
                   JSL   DEREF
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC
                   STY   ptrVTOC+2
                   LDY   #iFCR_2E
                   LDA   [ptrFCR],Y
                   TAX
                   LDY   #iFCR_DISPLACEMENT
                   LDA   [ptrFCR],Y
                   JSR   getFILEOFFSET
                   JSR   doREAD
                   PHA
                   PHP
                   JSL   UNLOCK_MEM
                   PLP
                   PLA
                   BCC   L06C0
                   ORA   errMAIN
L06C0              JMPL  SYS_EXIT

*
* CLOSE
*

CLOSE              JSL   LOCK_MEM
                   LDX   virtualFCR
                   LDY   virtualFCR+2
                   JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2
                   LDX   virtualVCR
                   LDY   virtualVCR+2
                   JSL   DEREF
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR],Y
                   CMP   #rootDIR
                   BEQ   L06F9
                   LDY   #iFCR_SEG2
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   TAY
                   JSL   RELEASE_SEG
L06F9              LDY   #iFCR_ID
                   LDA   [ptrFCR],Y
                   JSL   RELEASE_FCR
                   BCC   L0709
                   LDA   #$8043
                   BRA   L071C
L0709              LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   BNE   L0715
                   LDA   #$1F40
                   BRA   L071C
L0715              DEC
                   STA   [ptrVCR],Y
                   CLC
                   LDA   #$0000
L071C              PHA
                   PHP
                   JSL   UNLOCK_MEM
                   PLP
                   PLA
                   BCC   L0729
                   ORA   errMAIN
L0729              JMPL  SYS_EXIT

*
* GETDEVNUMBER
*

GETDEVNUMBER       JSL   LOCK_MEM

                   LDA   lastDevice          ; do we have a device number?
                   BEQ   L0744               ; no, get one!

L0735              LDY   #$0006              ; class 1
                   LDX   fgCLASS
                   BNE   L0740
                   LDY   #$0004              ; class 0
L0740              STA   [ptrParamBlock],Y
                   BRA   L075B

L0744              JSR   updateVCR
                   BCC   L0754
                   CMP   #$0057
                   BNE   L0751
                   LDA   #$0052
L0751              SEC
                   BRA   L075F

L0754              LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   BRA   L0735

L075B              CLC
                   LDA   #$0000
L075F              PHA
                   PHP
                   LDA   haSEGMENT
                   TAX
                   ORA   haSEGMENT+2
                   BEQ   L0771
                   LDY   haSEGMENT+2
                   JSL   RELEASE_SEG
L0771              JSL   UNLOCK_MEM
                   PLP
                   PLA
                   BCC   L077C
                   ORA   errMAIN
L077C              JMPL  SYS_EXIT

*
* GETEOF
*

GETEOF             JSL   LOCK_MEM
                   LDX   virtualFCR
                   LDY   virtualFCR+2
                   JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2
                   LDY   #iFCR_EOF
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   PHA

                   LDA   fgCLASS
                   BEQ   L07AD

                   PLA
                   LDY   #$0006
                   STA   [ptrParamBlock],Y
                   TXA
                   DEY
                   DEY
                   STA   [ptrParamBlock],Y
                   BRA   L07B8

L07AD              PLA
                   LDY   #$0004
                   STA   [ptrParamBlock],Y
                   TXA
                   DEY
                   DEY
                   STA   [ptrParamBlock],Y

L07B8              CLC
                   LDA   #$0000
                   PHA
                   PHP
                   JSL   UNLOCK_MEM
                   PLP
                   PLA
                   BCC   L07C9
                   ORA   errMAIN
L07C9              JMPL  SYS_EXIT

*
* GETMARK
*

GETMARK            JSL   LOCK_MEM
                   LDX   virtualFCR
                   LDY   virtualFCR+2
                   JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2
                   LDY   #iFCR_MARK
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   PHA

                   LDA   fgCLASS
                   BEQ   L07FA

                   PLA
                   LDY   #$0006
                   STA   [ptrParamBlock],Y
                   TXA
                   DEY
                   DEY
                   STA   [ptrParamBlock],Y
                   BRA   L0805

L07FA              PLA
                   LDY   #$0004
                   STA   [ptrParamBlock],Y
                   TXA
                   DEY
                   DEY
                   STA   [ptrParamBlock],Y
L0805              CLC
                   LDA   #$0000
                   PHA
                   PHP
                   JSL   UNLOCK_MEM
                   PLP
                   PLA
                   BCC   L0816
                   ORA   errMAIN
L0816              JMPL  SYS_EXIT

*
* SETMARK
*

SETMARK            JSL   LOCK_MEM
                   LDX   virtualFCR
                   LDY   virtualFCR+2
                   JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2

                   LDA   fgCLASS
                   BEQ   L0840

                   LDY   #$0006
                   LDA   [ptrParamBlock],Y
                   STA   tmpDISPLACEMENT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   tmpDISPLACEMENT+2
                   BRA   L0851

L0840              LDY   #$0002
                   LDA   [ptrParamBlock],Y
                   STA   tmpDISPLACEMENT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   tmpDISPLACEMENT+2
                   BRA   L0867

L0851              LDY   #$0004
                   LDA   [ptrParamBlock],Y
                   BEQ   L0867               ; 0
                   DEC
                   BEQ   L0875               ; 1
                   DEC
                   BEQ   L08B3               ; 2
                   DEC
                   BEQ   L0894               ; 3
                   LDA   #$0053
                   BRL   L08FD

* 0 mark = displacement
L0867              LDA   tmpDISPLACEMENT
                   STA   finalMARK
                   LDA   tmpDISPLACEMENT+2
                   STA   finalMARK+2
                   BRA   L08D0

* 1 mark = eof - displacement
L0875              LDY   #iFCR_EOF
                   LDA   [ptrFCR],Y
                   SEC
                   SBC   tmpDISPLACEMENT
                   STA   finalMARK
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   SBC   tmpDISPLACEMENT+2
                   BCS   L088F
                   LDA   #$004D
                   BRA   L08FD
L088F              STA   finalMARK+2
                   BRA   L08EA

* 3 mark = old mark - displacement
L0894              LDY   #iFCR_MARK
                   LDA   [ptrFCR],Y
                   SEC
                   SBC   tmpDISPLACEMENT
                   STA   finalMARK
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   SBC   tmpDISPLACEMENT+2
                   BCS   L08AE
                   LDA   #$004D
                   BRA   L08FD
L08AE              STA   finalMARK+2
                   BRA   L08EA

* 2 mark = old mark + displacement
L08B3              LDY   #iFCR_MARK
                   LDA   [ptrFCR],Y
                   CLC
                   ADC   tmpDISPLACEMENT
                   STA   finalMARK
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   ADC   tmpDISPLACEMENT+2
                   BCC   L08CD
                   LDA   #$004D
                   BRA   L08FD
L08CD              STA   finalMARK+2

L08D0              LDA   finalMARK+2
                   LDY   #$001C
                   CMP   [ptrFCR],Y
                   BCC   L08EA
                   BNE   L08E5
                   DEY
                   DEY
                   LDA   [ptrFCR],Y
                   CMP   finalMARK
                   BCS   L08EA
L08E5              LDA   #$004D
                   BRA   L08FD
L08EA              LDA   finalMARK
                   LDY   #iFCR_MARK
                   STA   [ptrFCR],Y
                   LDA   finalMARK+2
                   INY
                   INY
                   STA   [ptrFCR],Y
                   CLC
                   LDA   #$0000
L08FD              PHA
                   JSL   UNLOCK_MEM
                   PLA
                   CMP   #$0001
                   BCC   L090B
                   ORA   errMAIN
L090B              JMPL  SYS_EXIT

tmpDISPLACEMENT    ADRL  $00000000
finalMARK          ADRL  $00000000

*
* FLUSH
*

FLUSH              LDA   fgCLASS
                   BEQ   L092A

                   LDA   fgNBPARAMS
                   CMP   #$0003
                   BCC   L092A
                   LDA   #$0004
                   SEC
                   BRA   L092E
L092A              CLC
                   LDA   #$0000
L092E              BCC   L0933
                   ORA   errMAIN
L0933              JMPL  SYS_EXIT

*
* FSTSPECIFIC
*

FSTSPECIFIC        LDY   #$0004
                   LDA   [ptrParamBlock],Y
                   BEQ   L094E
                   DEC
                   BNE   L0946
                   JSR   specific1
                   BRA   L0952
L0946              DEC
                   BNE   L094E
                   JSR   specific2
                   BRA   L0952

L094E              LDA   #$0065
                   SEC
L0952              CMP   #$0001
                   BCC   L095A
                   ORA   errMAIN
L095A              JMPL  SYS_EXIT

*
*
*

L095E              JSL   LOCK_MEM
                   JSR   updateVCR
                   BCS   L096A
                   LDA   #$002B
L096A              PHA
                   LDA   haSEGMENT
                   TAX
                   ORA   haSEGMENT+2
                   BEQ   L097B
                   LDY   haSEGMENT+2
                   JSL   RELEASE_SEG
L097B              JSL   UNLOCK_MEM
                   PLA
                   CMP   #$0001
                   BCC   L0988
                   ORA   errMAIN
L0988              JMPL  SYS_EXIT

*
* FST INTERNAL ENTRY POINT
*
* A: UNDEFINED
* X: CALL NUMBER
* Y: CLASS TYPE
*

*L098C STAL $FF0500 ; ?
L098C              PHK
                   PLB
                   REP   #$30
                   STZ   fgNBPARAMS
                   STZ   errMAIN

                   STY   fgCLASS             ; class 0 or 1 call?
                   CPY   #$0000
                   BEQ   L09C2

                   LDA   [ptrParamBlock]     ; class 1
                   STA   fgNBPARAMS
                   LDA   L0A56-2,X           ; how many parameters
                   SEP   #$20                ; do we have?
                   STA   maxPARAMS
                   XBA
                   STA   minPARAMS
                   LDA   fgNBPARAMS
                   CMP   maxPARAMS
                   BCS   L09D0
                   CMP   minPARAMS
                   BCC   L09D0
                   REP   #$20

L09C2              STZ   haSEGMENT           ; jump to call
                   STZ   haSEGMENT+2
                   CPX   #$0069
                   BCS   L09D7
                   JMP   (TBL_CALLS,X)

L09D0              REP   #$20
                   LDA   #$0004
                   BRA   L09DA
L09D7              LDA   #$0001
L09DA              SEC
                   ORA   errMAIN
                   JMPL  SYS_EXIT

L09E2              LDA   #$002B
                   BRA   L09DA

L09E7              LDA   #$0065
                   BRA   L09DA

* GS/OS CALL NUMBERS

TBL_CALLS          DA    L09D7               ; 00
                   DA    L095E               ; 01 Create
                   DA    L095E               ; 02 Destroy
                   DA    L09D7               ; 03 OSShutdown
                   DA    L095E               ; 04 ChangePath
                   DA    L095E               ; 05 SetFileInfo
                   DA    GETFILEINFO         ; 06 GetFileInfo
                   DA    JUDGENAME           ; 07 JudgeName
                   DA    VOLUME              ; 08 Volume
                   DA    L09D7               ; 09 SetPrefix
                   DA    L09D7               ; 0A GetPrefix
                   DA    L095E               ; 0B ClearBackupBit
                   DA    L09D7               ; 0C SetSysPrefs
                   DA    L09D7               ; 0D Null
                   DA    L09D7               ; 0E ExpandPath
                   DA    L09D7               ; 0F GetSysPrefs
                   DA    OPEN                ; 10 Open
                   DA    L09D7               ; 11 NewLine
                   DA    READ                ; 12 Read
                   DA    L09E2               ; 13 Write
                   DA    CLOSE               ; 14 Close
                   DA    FLUSH               ; 15 Flush
                   DA    SETMARK             ; 16 SetMark
                   DA    GETMARK             ; 17 GetMark
                   DA    L09E2               ; 18 SetEOF
                   DA    GETEOF              ; 19 GetEOF
                   DA    L09D7               ; 1A SetLevel
                   DA    L09D7               ; 1B GetLevel
                   DA    GETDIRENTRY         ; 1C GetDirEntry
                   DA    L09D7               ; 1D BeginSession
                   DA    L09D7               ; 1E EndSession
                   DA    L09D7               ; 1F SessionStatus
                   DA    GETDEVNUMBER        ; 20 GetDevNumber
                   DA    L09D7               ; 21
                   DA    L09D7               ; 22
                   DA    L09D7               ; 23
                   DA    FORMAT              ; 24 Format
                   DA    ERASE               ; 25 EraseDisk
                   DA    L09D7               ; 26 ResetCache
                   DA    L09D7               ; 27 GetName
                   DA    L09D7               ; 28 GetBootVol
                   DA    L09D7               ; 29 Quit
                   DA    L09D7               ; 2A GetVersion
                   DA    L09D7               ; 2B GetFSTInfo
                   DA    L09D7               ; 2C DInfo
                   DA    L09D7               ; 2D DStatus
                   DA    L09D7               ; 2E DControl
                   DA    L09D7               ; 2F DRead
                   DA    L09D7               ; 30 DWrite
                   DA    L09D7               ; 31 BindInt
                   DA    L09D7               ; 32 UnbindInt
                   DA    FSTSPECIFIC         ; 33 FSTSpecific
                   DA    L09D7               ; 34 AddNotifyProc

*
* PARAMETERS: MIN & MAX
*

L0A56              DW    $0108               ; 01
                   DW    $0102               ; 02
                   DW    $0102               ; 03
                   DW    $0204               ; 04
                   DW    $020D               ; 05
                   DW    $010D               ; 06
                   DW    $0306               ; 07 JudgeName
                   DW    $0207               ; 08
                   DW    $0203               ; 09
                   DW    $0203               ; 0A
                   DW    $0102               ; 0B
                   DW    $0102               ; 0C
                   DW    $0001               ; 0D
                   DW    $0204               ; 0E
                   DW    $0102               ; 0F
                   DW    $0210               ; 10
                   DW    $0405               ; 11
                   DW    $0406               ; 12
                   DW    $0406               ; 13
                   DW    $0102               ; 14
                   DW    $0102               ; 15
                   DW    $0304               ; 16
                   DW    $0203               ; 17
                   DW    $0304               ; 18
                   DW    $0203               ; 19
                   DW    $0102               ; 1A
                   DW    $0102               ; 1B
                   DW    $0512               ; 1C
                   DW    $0001               ; 1D
                   DW    $0001               ; 1E
                   DW    $0102               ; 1F
                   DW    $0203               ; 20
                   DW    $0001               ; 21
                   DW    $0001               ; 22
                   DW    $0001               ; 23
                   DW    $0106               ; 24 Format
                   DW    $0106               ; 25 EraseDisk
                   DW    $0001               ; 26
                   DW    $0102               ; 27
                   DW    $0102               ; 28
                   DW    $0003               ; 29
                   DW    $0102               ; 2A
                   DW    $0209               ; 2B
                   DW    $020C               ; 2C
                   DW    $0506               ; 2D
                   DW    $0506               ; 2E
                   DW    $0607               ; 2F
                   DW    $0607               ; 30
                   DW    $0001               ; 31
                   DW    $0001               ; 32
                   DW    $0112               ; 33

*
* GS/OS INTERNAL CALL
*

*L0ABC STAL $FF0510
L0ABC              PHK
                   PLB
                   CPX   #$000B
                   BCS   L0ACA
                   JMP   (L0B05,X)

* 0
L0ACA              LDA   #$0001
                   RTL

* 1
L0ACE              JSL   GET_SYS_GBUF
                   STX   gsosBUFFER
                   STY   gsosBUFFER+2

                   LDA   #$0001
                   STA   textMODE
                   BRA   L0AE0

* 2 / 4
L0AE0              LDA   #$0000
                   CLC
                   RTL

* 3
*L0AE5 STAL $FE0358
L0AE5              LDX   virtualVCR
                   LDY   virtualVCR+2
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDY   #iVCR_SEGMENT
                   LDA   [virtualVCR],Y
                   TAX
                   INY
                   INY
                   ORA   [virtualVCR],Y
                   BEQ   L0B04
                   LDA   [virtualVCR],Y
                   TAY
                   JSL   RELEASE_SEG
L0B04              RTL

L0B05              DA    L0ACA               ; 0 NOT CALLED
                   DA    L0ACE               ; 1 HELLO
                   DA    L0AE0               ; 2 BYE
                   DA    L0AE5               ; 3 SET VCR
                   DA    L0AE0               ; 4 NOT CALLED

*
* GET VCR
*

getVCR             LDX   ptrVOLNAME
                   LDY   ptrVOLNAME+2
                   LDA   #$0000
                   JSL   FIND_VCR
                   BCC   L0B21
L0B1C              LDA   #$0000
                   CLC
                   RTS

L0B21              JSL   DEREF
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDY   #iFCR_FST
                   LDA   [ptrVCR],Y
                   CMP   #FST_DOS33
                   BEQ   L0B3D
                   JSR   releaseVCR
                   BCC   L0B1C
L0B38              LDA   #$0057
                   SEC
                   RTS

L0B3D              LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   LDA   lastDevice
                   BNE   L0B63
                   LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   STA   tmpDEVICE
                   JSR   checkVOLUME
                   BCC   L0B63
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   LDA   #$0045
                   SEC
                   RTS

L0B63              LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   JSR   compareVTOC
                   BCS   L0B77
                   LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   CLC
                   RTS

L0B77              JSR   releaseVCR
                   BCS   L0B38
                   BRA   L0B1C

*
* UPDATE VCR
*

updateVCR          STZ   tmpDEVICE
                   STZ   L00E2
                   STZ   haSEGMENT
                   STZ   haSEGMENT+2
                   LDA   #$1000
                   JSL   ALLOC_SEG
                   BCC   L0B97
                   LDA   #$0054
                   RTS
L0B97              STX   haSEGMENT
                   STY   haSEGMENT+2
                   JSL   DEREF
                   STX   ptrSEGMENT
                   STY   ptrSEGMENT+2
                   LDA   #L0146
                   STA   ptrVOLNAME
                   LDA   #^L0146
                   STA   ptrVOLNAME+2
                   LDA   #L0178
                   STA   shtFILENAME
                   LDA   #^L0178
                   STA   gsosOUTPUT
                   LDA   #L01AA
                   STA   ptrL01AA
                   LDA   #^L01AA
                   STA   ptrL01AA+2
                   JSR   L11CC
                   BCC   L0BCC
                   LDA   #$0040
                   RTS

L0BCC              LDA   lastDevice
                   BEQ   L0BED
                   STA   deviceNum
                   JSR   getDEVICEID
                   BCS   L0BDE
                   BNE   L0BDE
                   JSR   getVOLUMENAME
                   BCC   L0BE3
L0BDE              SEC
                   LDA   #$0052
                   RTS

L0BE3              LDA   #L01AA
                   STA   ptrVOLNAME
                   LDA   #^L01AA
                   STA   ptrVOLNAME+2

L0BED              LDX   ptrVOLNAME
                   LDY   ptrVOLNAME+2
                   LDA   #$0000
                   JSL   FIND_VCR
                   BCS   L0C55
                   JSL   DEREF
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDY   #iVCR_FST
                   LDA   [ptrVCR],Y
                   CMP   #FST_DOS33
                   BEQ   L0C27
L0C0C              LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   BEQ   L0C55
                   STZ   tmpDEVICE
                   JSR   checkVOLUME
                   LDA   #$0045
                   BCC   L0C21
                   BRL   L0CAF
L0C21              LDA   #$0057
                   BRL   L0CAF

L0C27              LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC
                   STY   ptrVTOC+2
                   JSR   compareVTOC
                   BCS   L0C53
                   LDY   #iVCR_FLAGS
                   LDA   [ptrVCR],Y
                   AND   #$4000
                   BEQ   L0CA7
                   LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   STA   tmpDEVICE
                   BRA   L0C5C
L0C53              BRA   L0C0C
L0C55              STZ   ptrVCR
                   STZ   ptrVCR+2
                   STZ   tmpDEVICE

L0C5C              STZ   L0CB0
                   LDA   ptrVCR
                   ORA   ptrVCR+2
                   BEQ   L0C70
                   INC   L0CB0
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y

L0C70              JSR   checkVOLUME
                   PHP
                   PHA
                   LDA   L0CB0
                   BEQ   L0C85

                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   STZ   L0CB0

L0C85              PLA
                   PLP
                   BCS   L0CAF
                   LDA   ptrVCR
                   ORA   ptrVCR+2
                   BEQ   L0CA2
                   LDY   #iVCR_DEVICEID
                   LDA   deviceNum
                   STA   [ptrVCR],Y
                   LDY   #iVCR_FLAGS
                   LDA   [ptrVCR],Y
                   AND   #$BFFF
                   STA   [ptrVCR],Y
                   BRA   L0CA7
L0CA2              JSR   createVCR
                   BCS   L0CAF
L0CA7              LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   STA   deviceNum
                   CLC
L0CAF              RTS

L0CB0              DW    $0000

*
* setPARAMETERS
* Return Parameters on the
* GS/OS class0/1 call buffer
*

setPARAMETERS      LDY   #$FFFE
                   LDX   fgNBPARAMS
L0CB8              INY
                   INY
                   LDA   (shtPARAMETERS),Y
                   ASL
                   PHP
                   BMI   L0CC9
                   LSR
                   PHY
                   TAY
                   LDA   intENTRYNB,Y
                   PLY
                   STA   [ptrParamBlock],Y
L0CC9              PLP
                   BCC   L0CB8
                   DEX
                   BNE   L0CB8
                   RTS

L0CD0              DW    $4000
                   DW    $4000
                   DW    $0006
                   DW    $0004
                   DW    $0008
                   DW    $0016
                   DW    $0012
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $000E
                   DW    $8016
L0CEA              DW    $4000
                   DW    $4000
                   DW    $C000
                   DW    $8006
                   DW    $8004
                   DW    $0008
                   DW    $8016
                   DW    $8012
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $8016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $8016
                   DW    $4000
                   DW    $C000
                   DW    $000A
                   DW    $800C
                   DW    $000E
                   DW    $8016
                   DW    $0016
                   DW    $8016
                   DW    $0016
                   DW    $8016
L0D1E              DW    $4000
                   DW    $4000
                   DW    $4000
                   DW    $4000
                   DW    $4000
                   DW    $4000
                   DW    $0010
                   DW    $0004
                   DW    $000A
                   DW    $000C
                   DW    $000E
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $0006
                   DW    $0008
                   DW    $0016
                   DW    $8014
L0D4E              DW    $4000
                   DW    $C000
                   DW    $C000
                   DW    $C000
                   DW    $C000
                   DW    $4000
                   DW    $C000
                   DW    $8010
                   DW    $8004
                   DW    $000A
                   DW    $800C
                   DW    $000E
                   DW    $8016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $8016
                   DW    $0016
                   DW    $0016
                   DW    $0016
                   DW    $8016
                   DW    $8006
                   DW    $0008
                   DW    $8016
                   DW    $8014
                   DW    $4000
                   DW    $C000
                   DW    $0016
                   DW    $8016
                   DW    $0016
                   DW    $8016

*
* TRACK/SECTOR TO BLOCK
*

TS2BLOCK           XBA
                   SEP   #$20
                   ASL
                   ASL
                   ASL
                   ASL
                   REP   #$20
                   LSR
                   LSR
                   LSR
                   LSR
                   STA   blockNum
                   STZ   $12
                   LDA   #FST_BLOCKSIZE
                   STA   blockSize
                   STA   requestCount
                   STZ   requestCount+2
                   LDA   #FST_DOS33
                   STA   FSTNum
                   STZ   cachePriority       ; cachePointer
L0DAD              JSL   DEV_DISPATCHER
                   BCS   L0DB4
                   RTS
L0DB4              CMP   #$002E
                   BEQ   L0DAD
                   SEC
                   RTS

*
* getFILEOFFSET
* Return the address of
* the file entry in the VTOC
*

getFILEOFFSET      CMP   #$0010
                   BCS   L0DE0
                   XBA
                   ADC   #FST_BLOCKSIZE
                   ADC   #$000B              ; file info begins at offset $B
                   CPX   #$0008              ; no more than 8 entries in a sector
                   BCS   L0DE0
L0DCC              DEX
                   BMI   L0DD4
                   ADC   #$0023              ; next entry
                   BRA   L0DCC

L0DD4              ADC   ptrVTOC             ; entry found...
                   STA   ptrFILENAME
                   LDA   ptrVTOC+2
                   ADC   #$0000
                   STA   ptrFILENAME+2
                   RTS
L0DE0              RTS

*
* isDELETEDFILE
*

isDELETEDFILE      LDA   [ptrFILENAME]
                   AND   #$00FF
                   BEQ   L0E0A               ; Points to T0
                   CMP   #$00FF              ; File is deleted
                   BEQ   L0E0A
                   PHY
                   PHX
                   LDX   #$000F
                   LDY   #$0003
L0DF5              LDA   [ptrFILENAME],Y
                   CMP   #$A0A0              ; Empty file name ?
                   BNE   L0E06
                   INY
                   INY
                   DEX
                   BNE   L0DF5
                   LDA   #$00FF
                   BRA   L0E08
L0E06              LDA   [ptrFILENAME]       ; Get TS
L0E08              PLX
                   PLY
L0E0A              AND   #$00FF              ; only track?
                   RTS

*
* compareVOLUME
*

compareVOLUME      LDA   [ptrVOLNAME2]
                   CMP   [ptrVOLNAME3]
                   BNE   L0E2C
                   TAY
                   BPL   L0E1A
                   LDY   #$7FFF
L0E1A              INY
                   SEP   #$20
L0E1D              LDA   [ptrVOLNAME3],Y
                   AND   tmpMASK
                   CMP   [ptrVOLNAME2],Y
                   BNE   L0E2C
                   DEY
                   BPL   L0E1D
                   REP   #$21
                   RTS
L0E2C              SEC
                   REP   #$20
                   RTS

*
* CREATE VCR
*

createVCR          JSR   getVCR
                   BCC   L0E39
                   LDA   #$0057
                   RTS
L0E39              BEQ   L0E3E
                   BRL   L0EF6
L0E3E              JSR   checkVOLUME
                   BCC   L0E47
                   LDA   #$0045
                   RTS
L0E47              LDA   #$0014
                   LDX   ptrVOLNAME
                   LDY   ptrVOLNAME+2
                   JSL   ALLOC_VCR
                   BCC   L0E58
                   LDA   #$0054
                   RTS
L0E58              JSL   DEREF
                   STX   ptrVCR
                   STY   ptrVCR+2
                   LDA   #$8000
                   TSB   errVOLUME
                   LDA   haSEGMENT
                   ORA   haSEGMENT+2
                   BNE   L0E82
                   LDA   #$1000
                   JSL   ALLOC_SEG
                   BCC   L0E7C
                   LDA   #$0054
                   BRA   L0ED1

L0E7C              STX   haSEGMENT
                   STY   haSEGMENT+2
L0E82              LDY   #iVCR_FST
                   LDA   #FST_DOS33
                   STA   [ptrVCR],Y
                   LDY   #iVCR_BUSY
                   LDA   #$0000
                   STA   [ptrVCR],Y
                   LDY   #iVCR_DEVICEID
                   LDA   deviceNum
                   STA   [ptrVCR],Y
                   LDY   #iVCR_SEGMENT
                   LDA   haSEGMENT
                   TAX
                   STA   [ptrVCR],Y
                   INY
                   INY
                   LDA   haSEGMENT+2
                   STA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC
                   STY   ptrVTOC+2
                   STZ   haSEGMENT
                   STZ   haSEGMENT+2
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   JSR   readVTOC
                   PHP
                   PHA
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   PLA
                   PLP
                   BCC   L0EEC
L0ED1              PHA
                   LDY   #iVCR_BUSY
                   LDA   #$0000
                   STA   [ptrVCR],Y
                   LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   JSL   RELEASE_VCR
                   LDA   #$8000
                   TRB   errVOLUME
                   PLA
                   SEC
                   RTS

L0EEC              LDA   tmpLENGTH
                   LDY   #iVCR_LENGTH
                   STA   [ptrVCR],Y
                   BRA   L0F10

L0EF6              LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC
                   STY   ptrVTOC+2
                   LDY   #iVCR_DEVICEID
                   LDA   deviceNum
                   STA   [ptrVCR],Y
L0F10              CLC
                   RTS

*
* getVOLUMENAME
*

getVOLUMENAME      LDA   ptrSEGMENT
                   STA   bufferPtr
                   LDA   ptrSEGMENT+2
                   STA   bufferPtr+2
                   LDA   #$0002
                   STA   callNum
                   LDA   #$0011
                   JSR   TS2BLOCK            ; Read T11/S0
                   BCC   L0F28
                   RTS

L0F28              SEP   #$30                ;
                   LDX   #$09
L0F2C              LDA   L1041,X
                   TAY
L0F30              LDA   [bufferPtr],Y
                   CMP   L104B,X
                   BNE   L0F42
L0F37              DEX
                   BMI   L0F52
                   TYA
                   CMP   L1041,X
                   BEQ   L0F37
                   BRA   L0F2C
L0F42              DEX
                   BMI   L0F4B
                   TYA
                   CMP   L1041,X
                   BEQ   L0F30
L0F4B              SEC
                   REP   #$30
                   LDA   #$0052
                   RTS

L0F52              REP   #$31
                   LDY   #$0001              ; Get TS of 1st directory
                   LDA   [bufferPtr],Y
                   BNE   L0F5F
                   LDA   #$0051
                   RTS

L0F5F              PHA                       ; load T11/SF
                   LDA   bufferPtr
                   STA   ptrSEGMENT
                   CLC
                   ADC   #FST_BLOCKSIZE
                   STA   bufferPtr
                   LDA   bufferPtr+2
                   STA   ptrSEGMENT+2
                   ADC   #$0000
                   STA   bufferPtr+2
                   LDA   #$0002
                   STA   callNum
                   PLA
                   JSR   TS2BLOCK
                   BCC   L0F7F
                   RTS

* Handle T11/SF

L0F7F              LDY   #$01FE              ; clear high-bit
                   LDA   #$0000
                   CLC
L0F86              EOR   [ptrSEGMENT],Y
                   ROR
                   BPL   L0F8E
                   EOR   #$7FFF
L0F8E              DEY
                   DEY
                   BPL   L0F86
                   STA   L1055               ; -> the magic number!

                   LDX   #$0000              ; Copy volume name
                   LDA   L1035,X
                   STA   shtVOLNAME
                   SEP   #$20
                   LDY   #$0002
L0FA2              LDA   (shtVOLNAME),Y
                   BEQ   L0FAE
                   STA   (ptrL01AA),Y
                   INY
                   CPY   #$000F
                   BNE   L0FA2

* MANAGE VOLUME VERSION

L0FAE              REP   #$20
                   STZ   L1059
                   STZ   L105B
                   LDA   L1055
                   AND   #$07FF
                   STA   L1057
L0FBF              SEC
                   SBC   #$03E8              ; 1000
                   BCC   L0FD6
                   STA   L1057
                   LDA   L1059
                   ADC   #$0000
                   STA   L1059
                   LDA   L1057
                   BRA   L0FBF
L0FD6              LDA   L1057
                   SEC
                   SBC   #$0064              ; 100
                   BCC   L0FED
                   STA   L1057
                   LDA   L1059
                   ADC   #$00FF
                   STA   L1059
                   BRA   L0FD6
L0FED              LDA   L1057
                   SEC
                   SBC   #$000A              ; 10
                   BCC   L1004
                   STA   L1057
                   LDA   L105B
                   ADC   #$0000
                   STA   L105B
                   BRA   L0FED
L1004              LDA   L1057
                   XBA
                   ADC   L105B
                   STA   L105B
                   LDA   L1059
                   ADC   #$3030
                   STA   (ptrL01AA),Y
                   INY
                   INY
                   LDA   L105B
                   ADC   #$3030
                   STA   (ptrL01AA),Y
                   INY
                   INY
                   LDA   #$0000
                   STA   (ptrL01AA),Y
                   DEY
                   DEY
                   TYA
                   STA   (ptrL01AA)
                   REP   #$31
                   LDA   #$8000
                   STA   errMAIN
                   RTS                       ; Now we have a beautiful version!

L1035              DA    L1035
                   ASC   'DOS 3.3 v'00

L1041              HEX   03273637313134343535
L104B              HEX   037A000101FF23321020

L1055              DW    $0000
L1057              DW    $0000
L1059              DW    $0000
L105B              DW    $0000

*
* RELEASE VCR
*

releaseVCR         LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   BEQ   L1066
                   SEC
                   RTS

L1066              LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   JSL   RELEASE_VCR
                   CLC
                   RTS

*
* COMPARE VTOC
*

compareVTOC        LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC2
                   STY   ptrVTOC2+2
                   LDY   #$01FE
L1087              LDA   [ptrVTOC],Y
                   CMP   [ptrVTOC2],Y
                   BNE   L1093
                   DEY
                   DEY
                   BPL   L1087
                   CLC
                   RTS

L1093              SEC
                   RTS

*
* GET DEVICE ID
*

getDEVICEID        LDA   deviceNum
                   PHA
                   STA   bufferPtr
                   STZ   deviceNum
                   LDA   #$0001
                   STA   callNum
                   JSL   DEV_DISPATCHER
                   PLY
                   STY   deviceNum
                   BCS   L10AF
                   LDY   #$0034
                   LDA   [dibPointer],Y      ; deviceID
L10AF              RTS

*
* CHECK VOLUME
*

checkVOLUME        LDX   tmpDEVICE
                   BNE   L10E7
L10B5              INX
                   STX   deviceNum
                   JSR   getVOLUMENAME
                   BCC   L10C6
                   CMP   #$0011
                   BEQ   L1138
L10C2              LDX   deviceNum
                   BRA   L10B5
L10C6              LDA   ptrVOLNAME
                   STA   ptrVOLNAME2
                   LDA   ptrVOLNAME+2
                   STA   ptrVOLNAME2+2
                   LDA   ptrL01AA
                   STA   ptrVOLNAME3
                   LDA   #^L01AA
                   STA   ptrVOLNAME3+2
                   LDA   #$00FF
                   STA   tmpMASK
                   JSR   compareVOLUME
                   BCC   L1136
                   STZ   errMAIN
                   BRA   L10C2
L10E7              STX   deviceNum
                   JSR   getDEVICEID
                   BCC   L10EF
                   RTS

L10EF              STA   theDEVICE
L10F2              JSR   getVOLUMENAME
                   BCC   L111A
                   CMP   #$0011
                   BNE   L10FE
L10FC              STZ   deviceNum
L10FE              LDX   deviceNum
                   INX
                   CPX   tmpDEVICE
                   BEQ   L1138
                   STX   deviceNum
                   JSR   getDEVICEID
                   BCC   L1113
                   CMP   #$0011
                   BEQ   L10FC
                   RTS

L1113              CMP   theDEVICE
                   BEQ   L10F2
                   BRA   L10FE
L111A              LDA   ptrVOLNAME
                   STA   ptrVOLNAME2
                   LDA   ptrVOLNAME+2
                   STA   ptrVOLNAME2+2
                   LDA   ptrL01AA
                   STA   ptrVOLNAME3
                   LDA   #^L01AA
                   STA   ptrVOLNAME3+2
                   LDA   #$00FF
                   STA   tmpMASK
                   JSR   compareVOLUME
                   BCS   L10FE
L1136              CLC
                   RTS

L1138              LDA   #$0045
                   SEC
                   RTS

theDEVICE          DW    $0000

*
* CHECK FCR
*

checkFCR           STZ   L00E6
                   STZ   L00E8
L1145              INC   L00E8
                   LDA   L00E8
                   JSL   GET_FCR
                   BCS   L11CB
                   JSL   DEREF
                   STX   ptrFCR2
                   STY   ptrFCR2+2
                   LDY   #iFCR_FST
                   LDA   [ptrFCR2],Y
                   CMP   #FST_DOS33
                   BNE   L1145

                   LDY   #iFCR_VCR
                   LDA   [ptrFCR2],Y
                   LDY   #iVCR_ID
                   CMP   [ptrVCR],Y
                   BNE   L1145

                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR2],Y
                   CMP   #rootDIR
                   BEQ   L1145

                   LDY   #iFCR_NAME
                   LDA   [ptrFCR2],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR2],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC2
                   STY   ptrVTOC2+2
                   SEP   #$20
                   LDY   #$0003
L1191              INY
                   LDA   [ptrVTOC2],Y
                   CMP   #$3A
                   BNE   L1191
                   LDX   #$0001
L119B              INY
                   INX
                   LDA   [ptrVTOC2],Y
                   STA   L01DC,X
                   BNE   L119B
                   REP   #$30
                   TXA
                   DEC
                   DEC
                   STA   L01DC
                   LDX   #L01DC
                   LDY   #^L01DC
                   STX   ptrVOLNAME3
                   STY   ptrVOLNAME3+2
                   LDA   shtFILENAME
                   STA   ptrVOLNAME2
                   LDA   #^L0178
                   STA   ptrVOLNAME2+2
                   JSR   compareVOLUME
                   BCS   L1145
                   LDA   L00E8
                   STA   L00E6
                   CLC
L11CB              RTS

L11CC              LDA   $42
                   AND   #$4000
                   BNE   L11E5

L11D3              REP   #$30
                   LDA   #$0000
                   LDY   #$0001
                   STA   [ptrVOLNAME],Y
                   STA   (shtFILENAME),Y
                   STA   [ptrVOLNAME]
                   STA   (shtFILENAME)
                   CLC
                   RTS

L11E5              SEP   #$20
                   LDY   #$0002
                   LDA   [virtualFCR],Y
                   BEQ   L11D3
                   CMP   #$3A                ; :
                   BNE   L1236
L11F2              INY
                   LDA   [virtualFCR],Y
                   BEQ   L1204
                   CMP   #$3A                ; :
                   BEQ   L1204
                   DEY
                   STA   [ptrVOLNAME],Y
                   INY
                   CPY   #$0017
                   BCC   L11F2
L1204              DEY
                   LDA   #$00
                   STA   [ptrVOLNAME],Y
                   REP   #$21
                   TYA
                   SBC   #$0001
                   STA   [ptrVOLNAME]
                   INY
                   LDA   [virtualFCR],Y
                   AND   #$00FF
                   BNE   L1237
                   LDA   #$0000
                   LDY   #$0001
                   STA   (shtFILENAME),Y
                   STA   (shtFILENAME)

L1223              LDA   $42
                   AND   #$0040
                   BNE   L122E
                   CLC
                   RTS

L122C              SEC
                   RTS

L122E              LDA   $46
                   BEQ   L122C
                   CMP   #$001F
                   RTS

L1236              DEY
L1237              LDX   #$0002
                   STX   L1272
                   SEP   #$20
L123F              INY
                   LDA   [virtualFCR],Y
                   BEQ   L1260
                   CMP   #$3A
                   BEQ   L126E
                   TYX
                   LDY   L1272
                   CMP   #$2C
                   BNE   L1252
                   LDA   #$3A
L1252              STA   (shtFILENAME),Y
                   INY
                   CPY   #$0022
                   BCS   L126E
                   STY   L1272
                   TXY
                   BRA   L123F
L1260              LDY   L1272
                   STA   (shtFILENAME),Y
                   REP   #$20
                   TYA
                   DEC
                   DEC
                   STA   (shtFILENAME)
                   BRA   L1223
L126E              REP   #$20
                   SEC
                   RTS

L1272              DW    $0000

*
*
*

L1274              LDX   ptrGSOSBUFFER
                   STX   bufferPtr
                   LDX   ptrGSOSBUFFER+2
                   STX   bufferPtr+2
                   STZ   L1459
                   STZ   L145B
                   STZ   L1455
                   STZ   L1457
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   JSR   TS2BLOCK
                   PHP
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   PLP
                   BCC   L12A8
                   RTS

L12A8              LDA   intOFILETYPE
                   BEQ   L1311
                   AND   #$0017
                   BEQ   L12B5
                   BRL   L13DF
L12B5              LDY   #$000C
                   INC   L145B
L12BB              LDA   [bufferPtr],Y
                   BEQ   L12F5
                   INC   L1459
                   INY
                   INY
                   CPY   #FST_BLOCKSIZE
                   BNE   L12BB
                   LDA   #$0002
                   STA   callNum
                   LDY   #$0001
                   LDA   [ptrGSOSBUFFER],Y
                   BEQ   L12F5
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   JSR   TS2BLOCK
                   PHP
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   PLP
                   BCC   L12B5
                   RTS

L12F5              LDA   L1459
                   XBA
                   TAX
                   AND   #$FF00
                   STA   L1455
                   TXA
                   AND   #$00FF
                   STA   L1457
                   LDA   L1459
                   CLC
                   ADC   L145B
                   BRL   L144D

L1311              LDX   #$000C              ; TEXT FILE
                   LDY   #$000C
                   INC   L145B
L131A              LDA   [bufferPtr],Y
                   BEQ   L1322
                   TYX
                   INC   L1459
L1322              INY
                   INY
                   CPY   #FST_BLOCKSIZE
                   BNE   L131A
                   LDA   #$0002
                   STA   callNum
                   LDY   #$0001
                   LDA   [ptrGSOSBUFFER],Y
                   BEQ   L1355
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   JSR   TS2BLOCK
                   PHP
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   PLP
                   BCC   L1311
                   RTS

L1355              TXA
                   SEC
                   SBC   #$000C
                   LSR
                   XBA
                   STA   L1455
                   LDA   bufferPtr
                   ADC   #FST_BLOCKSIZE
                   STA   bufferPtr
                   BCC   L136A
                   INC   bufferPtr+2
L136A              LDA   #$0002
                   STA   callNum
                   TXY
                   LDA   [ptrGSOSBUFFER],Y
                   STA   L012E
                   BNE   L137C
                   LDY   #$FFFF
                   BRA   L13A8
L137C              PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   JSR   TS2BLOCK
                   PHP
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   PLP
                   BCC   L139C
                   RTS

L139C              LDY   #$00FF
                   SEP   #$20
L13A1              LDA   [bufferPtr],Y
                   BNE   L13A8
                   DEY
                   BPL   L13A1
L13A8              REP   #$21
                   INY
                   TYX
                   LDY   #$0005
                   LDA   [ptrGSOSBUFFER],Y
                   XBA
                   TAY
                   AND   #$FF00
                   ADC   L1455
                   STA   L1455
                   TYA
                   AND   #$00FF
                   ADC   L1457
                   STA   L1457
                   TXA
                   ADC   L1455
                   STA   L1455
                   LDA   L1457
                   ADC   #$0000
                   STA   L1457
                   LDA   L1459
                   CLC
                   ADC   L145B
                   BRA   L144D
L13DF              LDA   bufferPtr
                   CLC
                   ADC   #FST_BLOCKSIZE
                   STA   bufferPtr
                   LDA   bufferPtr+2
                   ADC   #$0000
                   STA   bufferPtr+2
                   LDA   #$0002
                   STA   callNum
                   LDY   #$000C
                   LDA   [ptrGSOSBUFFER],Y
                   STA   L012E
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   JSR   TS2BLOCK
                   PHP
                   PHA
                   PHY
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   DEC
                   STA   [ptrVCR],Y
                   PLY
                   PLA
                   PLP
                   BCC   L141B
                   RTS

L141B              LDA   intOFILETYPE
                   LDY   #$0000
                   AND   #$007C
                   BEQ   L1429
                   LDY   #$0002
L1429              LDA   [bufferPtr],Y
                   STA   L1455
                   LDA   #$0000
                   STA   L1457
                   LDA   intOFILETYPE
                   AND   #$007B
                   BEQ   L144B
                   CMP   #$0001
                   BNE   L1446
                   LDA   #$0C00
                   BRA   L144D
L1446              LDA   #$0801
                   BRA   L144D
L144B              LDA   [bufferPtr]
L144D              LDX   L1455
                   LDY   L1457
                   CLC
                   RTS

L1455              DW    $0000
L1457              DW    $0000
L1459              DW    $0000
L145B              DW    $0000

*
* READ VTOC
*

readVTOC           LDA   ptrVTOC             ; T11/S0
                   CLC
                   ADC   #FST_BLOCKSIZE
                   STA   bufferPtr
                   LDA   ptrVTOC+2
                   ADC   #$0000
                   STA   bufferPtr+2
                   LDX   #$000E              ; Read 15 sectors
                   STX   L14A5               ; from 11/F to 11/1 max
L1472              LDY   #$0001              ; link to next T/S
                   LDA   [bufferPtr],Y
                   BEQ   L1499
                   PHA
                   LDA   bufferPtr
                   ADC   #FST_BLOCKSIZE
                   STA   bufferPtr
                   LDA   bufferPtr+2
                   ADC   #$0000
                   STA   bufferPtr+2
                   LDA   #$0002
                   STA   callNum
                   PLA
                   JSR   TS2BLOCK
                   BCC   L1494
                   RTS
L1494              DEC   L14A5
                   BNE   L1472

L1499              LDA   #$000F              ; F-nb sectors read
                   SEC                       ; equals length of VTOC
                   SBC   L14A5
                   STA   tmpLENGTH
                   CLC
                   RTS

L14A5              DW    $0000

*
*
*

L14A7              LDA   shtFILENAME
                   STA   ptrVOLNAME2
                   LDA   #^L0178
                   STA   ptrVOLNAME2+2
                   LDA   #$0000
L14B3              LDX   #$0000
L14B6              STA   L00EE
                   STX   L00F0
                   JSR   getFILEOFFSET
                   BCC   L14C2
                   RTS

L14C2              JSR   isDELETEDFILE
                   BEQ   L1515
                   CMP   #$00FF
                   BEQ   L1503
                   LDA   ptrFILENAME
                   ADC   #$0001
                   STA   ptrVOLNAME3
                   LDA   ptrFILENAME+2
                   ADC   #$0000
                   STA   ptrVOLNAME3+2
                   LDY   #$001F
                   LDA   [ptrVOLNAME3]
                   PHA
                   SEP   #$20
L14E2              LDA   [ptrVOLNAME3],Y
                   CMP   #$A0                ; space
                   BNE   L14F0
                   DEY
                   BPL   L14E2
                   PLX
                   REP   #$30
                   SEC
                   RTS

                   MX    %10
L14F0              DEY
                   LDA   #$7F
                   STA   tmpMASK
                   REP   #$20
                   TYA
                   STA   [ptrVOLNAME3]
                   JSR   compareVOLUME
                   PLA
                   STA   [ptrVOLNAME3]
                   BCC   L151D
L1503              LDX   L00F0
                   LDA   L00EE
                   INX
                   CPX   #$0007
                   BCC   L14B6
                   INC
                   CMP   tmpLENGTH
                   BCC   L14B3
L1515              LDA   #$FFFF
                   STA   L00F0
                   CLC
                   RTS

L151D              CLC
                   RTS

*
* Set OptionList
*

setOPTIONLIST      LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2
                   ORA   gsosOUTPUT
                   BEQ   L1540
                   LDA   [gsosOUTPUT]
                   CMP   #$0006
                   BCS   L1536
                   SEC
                   RTS

L1536              LDA   #FST_DOS33          ; Y=2 MUST BE 2
                   TAY                       ; Y=4 MUST BE FST_DOS33
                   STA   [gsosOUTPUT],Y
                   INY
                   INY
                   STA   [gsosOUTPUT],Y
L1540              CLC
                   RTS

*
* FSTSPECIFIC: OPTION 1
*

specific1          LDA   fgNBPARAMS
                   CMP   #$0003
                   BEQ   L154F
                   LDA   #$0004
                   SEC
                   RTS

L154F              LDY   #$0006
                   LDA   [ptrParamBlock],Y
                   CMP   #$0002              ; legal values are 0 or 1
                   BCC   L155E
                   LDA   #$0053
                   SEC
                   RTS

L155E              STA   textMODE
                   LDA   #$0000
                   CLC
                   RTS

*
* FSTSPECIFIC: OPTION 2
*

specific2          LDA   fgNBPARAMS
                   CMP   #$0003
                   BEQ   L1573
                   LDA   #$0004
                   SEC
                   RTS

L1573              LDA   textMODE
                   LDY   #$0006
                   STA   [ptrParamBlock],Y
                   LDA   #$0000
                   CLC
                   RTS

*
* GET ORIGINAL FILE INFORMATION
*

getORIGINAL        LDA   #$0001
                   STA   intSTORAGE
                   LDY   #$0002
                   LDA   [ptrFILENAME],Y
                   TAX
                   AND   #$0080
                   BNE   L1596
                   LDA   #$00C3
                   BRA   L1599
L1596              LDA   #$0001
L1599              STA   intACCESS
                   TXA
                   AND   #$007F
                   STA   intOFILETYPE
                   LDX   #$0008
L15A6              LSR
                   BCS   L15AC
                   DEX
                   BNE   L15A6
L15AC              TXA
                   ASL
                   TAX
                   LDA   L15F3,X
                   STA   intFILETYPE

                   LDA   intOFILETYPE
                   AND   #$0017              ; 00010111
                   BEQ   L15DB               ; 0 = TEXT FILE

                   LDY   #$0000
                   LDA   [ptrFILENAME],Y
                   JSR   L1274
                   BCC   L15C8
                   RTS
L15C8              STA   intAUXTYPE
                   STX   intEOF
                   STY   intEOF+2
                   LDY   #$0021
                   LDA   [ptrFILENAME],Y
                   STA   intNBSEC
                   CLC
                   RTS

L15DB              LDY   #$0000
                   LDA   [ptrFILENAME],Y
                   JSR   L1274
                   BCC   L15E6
                   RTS
L15E6              STA   intNBSEC
                   STX   intEOF
                   STY   intEOF+2
                   STZ   intAUXTYPE
                   RTS

L15F3              DW    $0004
                   DW    $000F
                   DW    $0000
                   DW    $0000
                   DW    $00FE
                   DW    $0000
                   DW    $0006
                   DW    $00FC
                   DW    $00FA
                   DW    $00EE

*
* HANDLE THE GetDirEntry GS/OS CALL
* on entry A = class type
*

doGETDIRENTRY      LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   STA   deviceNum
                   STZ   errGETDIR
                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR],Y
                   CMP   #rootDIR            ; must be done on the root directory
                   BEQ   L1620
                   LDA   #$804A
                   SEC
                   RTS

L1620              LDA   fgCLASS
                   BEQ   L1644

                   LDY   #$0006              ; base
                   LDA   [ptrParamBlock],Y
                   STA   theBASE
                   LDY   #$0008              ; displacement
                   LDA   [ptrParamBlock],Y
                   STA   theDISPLACEMENT
                   LDY   #$000A              ; name
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2
                   BRA   L166A

L1644              LDY   #$0004              ; base
                   LDA   [ptrParamBlock],Y
                   STA   theBASE
                   LDY   #$0006              ; displacement
                   LDA   [ptrParamBlock],Y
                   STA   theDISPLACEMENT

                   LDY   #iFCR_NBSEC
                   LDA   [ptrFCR],Y
                   DEC
                   STA   tmpLENGTH

                   LDY   #$0008
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2

*

L166A              LDA   theBASE
                   TAX
                   ORA   theDISPLACEMENT
                   BEQ   L1680               ; base = displacement = 0

                   TXA
                   BEQ   L1693               ; base = 0
                   DEC
                   BEQ   L16AA               ; base = 1
                   DEC
                   BEQ   L16C5               ; base = 2
                   LDA   #$0053
                   RTS

L1680              LDY   #iFCR_TS            ; base = 0
                   LDA   [ptrFCR],Y
                   STA   theENTRY
                   LDA   #$0000              ; set the new displacement
                   LDY   #iFCR_DISPLACEMENT
                   STA   [ptrFCR],Y
                   BRL   L17E3

L1693              LDY   #iFCR_TS
                   LDA   [ptrFCR],Y
                   CMP   theDISPLACEMENT
                   BCS   L16A2
                   LDA   #$0061
                   SEC
                   RTS

L16A2              LDA   theDISPLACEMENT
                   STA   theENTRY
                   BRA   L16E7

L16AA              LDY   #iFCR_DISPLACEMENT  ; base = 1
                   LDA   [ptrFCR],Y          ; displacement is added
                   CLC
                   ADC   theDISPLACEMENT
                   STA   theENTRY
                   LDY   #iFCR_TS
                   LDA   [ptrFCR],Y
                   CMP   theENTRY
                   BCS   L16E7
                   LDA   #$0061
                   SEC
                   RTS

L16C5              LDY   #iFCR_DISPLACEMENT  ; base = 2
                   LDA   [ptrFCR],Y
                   DEC                       ; are we at the beginning
                   CMP   theDISPLACEMENT
                   BCC   L16E2
                   INC                       ; no, calculate the entry number
                   SEC
                   SBC   theDISPLACEMENT
                   STA   theENTRY
                   LDY   #iFCR_TS
                   LDA   [ptrFCR],Y
                   CMP   theENTRY            ; do we exceed
                   BCS   L16E7
L16E2              LDA   #$0061
                   SEC
                   RTS

L16E7              LDA   theENTRY            ; set it as the new ref
                   LDY   #iFCR_DISPLACEMENT
                   STA   [ptrFCR],Y
                   STA   theENTRY2

                   LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVTOC             ; we must work on the VTOC
                   STY   ptrVTOC+2

*

                   LDA   #$0000              ; find the entry
L1708              LDX   #$0000              ; from the beginning of the VTOC

L170B              STA   L00EE
                   STX   L00F0
                   JSR   getFILEOFFSET
                   BCC   L1717
                   RTS

L1717              JSR   isDELETEDFILE
                   BNE   L1721
                   LDA   #$8061
                   SEC
                   RTS

L1721              CMP   #$00FF              ; is file deleted?
                   BEQ   L172B
                   DEC   theENTRY2
                   BEQ   L173D
L172B              LDX   L00F0
                   LDA   L00EE
                   INX
                   CPX   #$0007              ; next entry in the same sector
                   BCC   L170B
                   INC
                   CMP   tmpLENGTH
                   BCC   L1708

L173D              LDY   #iVCR_NAME
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrVOLNAME
                   STY   ptrVOLNAME+2
                   LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   STA   tmpDEVICE
                   JSR   checkVOLUME
                   BCC   L1761
                   LDA   #$0045
                   RTS

L1761              LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y          ; are we on the same device?
                   CMP   deviceNum
                   BEQ   L1771
                   LDY   #iVCR_DEVICEID
                   LDA   deviceNum           ; no update
                   STA   [ptrVCR],Y

L1771              JSR   getORIGINAL
                   BCC   L177A
                   LDA   #$0051
                   RTS

L177A              SEP   #$20                ; get the real file name length
                   LDY   #$0020
L177F              LDA   [ptrFILENAME],Y
                   CMP   #$A0                ; LEN(HELLO)=5
                   BNE   L1788
                   DEY
                   BNE   L177F
L1788              REP   #$21                ; offset Y = 7
                   INY                       ; +1
                   STY   L182D               ; length is 8
                   TYA
                   SBC   #$0002              ; -2
                   STA   L1839               ; the length of the output
                   INC                       ; is a word
                   INC
                   INC
                   TAY
                   LDA   [gsosOUTPUT]
                   STA   L183B               ; compare with the GSOS output buffer
                   CPY   L183B
                   BCC   L17A9
                   LDA   #$004F
                   STA   errGETDIR

L17A9              LDY   #$0002
                   LDA   #$0003
                   STA   L182F
                   SEP   #$20

L17B4              INY
                   CPY   L182D
                   BEQ   L17D9

                   LDX   L182F               ; on the filename
                   INX
                   CPX   L183B
                   BEQ   L17D9
                   STX   L182F
                   LDA   [ptrFILENAME],Y
                   TYX
                   LDY   L182F               ; replace
                   AND   #$7F
                   CMP   #$3A                ; :
                   BNE   L17D4               ; with
                   LDA   #$2C                ; ,
L17D4              STA   [gsosOUTPUT],Y
                   TXY
                   BRA   L17B4

L17D9              REP   #$21
                   LDA   L1839
                   LDY   #$0002
                   STA   [gsosOUTPUT],Y

*

L17E3              LDA   fgCLASS
                   BNE   L1800

                   LDA   #$0000
                   LDY   #$0002
                   STA   [ptrParamBlock],Y
                   LDA   #$0001
                   STA   fgNBPARAMS
                   LDA   #L0D1E
                   STA   shtPARAMETERS
                   JSR   setPARAMETERS
                   BRA   L1826

L1800              LDA   #$0000              ; flags
                   LDY   #$0004
                   STA   [ptrParamBlock],Y

                   LDA   #L0D4E
                   STA   shtPARAMETERS
                   JSR   setPARAMETERS
                   LDA   fgNBPARAMS
                   CMP   #$000F
                   BCC   L1826
                   LDY   #$0032
                   JSR   setOPTIONLIST
                   BCC   L1826
                   LDA   #$004F
                   STA   errGETDIR

L1826              LDA   errGETDIR
                   CMP   #$0001
                   RTS

L182D              DW    $0000
L182F              DW    $0000
errGETDIR          DW    $0000
theBASE            DW    $0000
theDISPLACEMENT    DW    $0000
theENTRY2          DW    $0000
L1839              DW    $0000
L183B              DW    $0000

*
*
*

L183D              LDY   #iFCR_SEG1
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   TAY
                   JSL   DEREF
                   STX   $BA
                   STY   $BC
                   LDY   #iFCR_12
                   LDA   [ptrFCR],Y
                   STA   $BE
                   LDA   L00FE
                   DEC
                   BNE   L18A5
                   LDA   [$BA]
                   AND   #$00FF
                   STA   $C0
                   LDY   L0116
                   BEQ   L18E5
                   LDY   #$0000
                   SEP   #$30
L186E              PHY
                   REP   #$30
                   LDY   #iFCR_OTYPE
                   LDA   [ptrFCR],Y
                   SEP   #$30
                   BNE   L1883
                   PLY
                   LDA   [ptrVTOC2],Y
                   STA   [gsosOUTPUT],Y
                   AND   #$7F
                   BRA   L1888
L1883              PLY
                   LDA   [ptrVTOC2],Y
                   STA   [gsosOUTPUT],Y
L1888              INC   L0118
                   AND   $BE
                   CMP   $C0
                   BEQ   L18A0
                   REP   #$30
                   INY
                   CPY   L0116
                   SEP   #$30
                   BCC   L186E
                   REP   #$30
                   CLC
                   BRA   L18E3
L18A0              REP   #$30
                   SEC
                   BRA   L18E3
L18A5              LDY   #$0000
                   SEP   #$20
L18AA              PHY
                   REP   #$20
                   LDY   #iFCR_OTYPE
                   LDA   [ptrFCR],Y
                   SEP   #$20
                   BNE   L18BF
                   PLY
                   LDA   [ptrVTOC2],Y
                   STA   [gsosOUTPUT],Y
                   AND   #$7F
                   BRA   L18C4
L18BF              PLY
                   LDA   [ptrVTOC2],Y
                   STA   [gsosOUTPUT],Y
L18C4              INC   L0118
                   AND   $BE
                   TYX
                   LDY   L00FE
L18CD              DEY
                   BMI   L18D6
                   CMP   [$BA],Y
                   BNE   L18CD
                   BRA   L18E2
L18D6              TXY
                   INY
                   CPY   L0116
                   BNE   L18AA
                   REP   #$20
                   CLC
                   BRA   L18E3
L18E2              SEC
L18E3              REP   #$30
L18E5              RTS

*
* READ
*

doREAD             STZ   errREAD
                   STZ   tmpTRANSFERCOUNT
                   STZ   tmpTRANSFERCOUNT+2
                   STZ   L0118

                   LDY   #iFCR_OTYPE
                   LDA   [ptrFCR],Y
                   BEQ   L1913               ; 00000000 : 80 TXT
                   AND   #$FFFC              ; 11111100 : 84 BIN
                   BNE   L1906
                   LDA   #$0002
                   STA   tmpTOSKIP
                   BRA   L1916
L1906              AND   #$FFEB              ; 11101011 :
                   BNE   L1913
                   LDA   #$0004
                   STA   tmpTOSKIP
                   BRA   L1916

L1913              STZ   tmpTOSKIP

L1916              LDY   #iFCR_12
                   LDA   [ptrFCR],Y
                   STA   $BE
                   LDY   #iFCR_10
                   LDA   [ptrFCR],Y
                   STA   L00FE
                   LDY   #iFCR_EOF
                   LDA   [ptrFCR],Y
                   STA   intEOF
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   STA   intEOF+2
                   LDY   #iFCR_MARK
                   LDA   [ptrFCR],Y
                   STA   tmpMARK
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   STA   tmpMARK+2
                   LDY   #iFCR_SEG2
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   TAY
                   JSL   DEREF
                   STX   ptrGSOSBUFFER
                   STY   ptrGSOSBUFFER+2

                   LDA   fgCLASS
                   BEQ   L1979

                   LDY   #$0008
                   LDA   [ptrParamBlock],Y
                   STA   tmpREQUESTCOUNT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   tmpREQUESTCOUNT+2
                   LDY   #$0004
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2
                   BRA   L1995

L1979              LDY   #$0006
                   LDA   [ptrParamBlock],Y
                   STA   tmpREQUESTCOUNT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   tmpREQUESTCOUNT+2
                   LDY   #$0002
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2

L1995              LDA   tmpMARK
                   CMP   intEOF
                   BNE   L19AE
                   LDA   tmpMARK+2
                   CMP   intEOF+2
                   BNE   L19AE
                   LDA   #$004C
                   STA   errREAD
                   BRL   L1D6E

L19AE              LDA   tmpMARK
                   CLC
                   ADC   tmpREQUESTCOUNT
                   STA   tmpEOF
                   LDA   tmpMARK+2
                   ADC   tmpREQUESTCOUNT+2
                   BCS   L19D2
                   STA   tmpEOF+2
                   CMP   intEOF+2
                   BCC   L19DE
                   BNE   L19D2
                   LDA   intEOF
                   CMP   tmpEOF
                   BCS   L19DE
L19D2              LDA   intEOF+2
                   STA   tmpEOF+2
                   LDA   intEOF
                   STA   tmpEOF

L19DE              LDA   tmpEOF
                   SEC
                   SBC   tmpMARK
                   STA   tmpEND
                   LDA   tmpEOF+2
                   SBC   tmpMARK+2
                   STA   tmpEND+2

                   LDA   tmpMARK
                   CLC
                   ADC   tmpTOSKIP
                   STA   tmpSTART
                   LDA   tmpMARK+2
                   ADC   #$0000
                   STA   tmpSTART+2

                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR],Y
                   CMP   #rootDIR
                   BNE   L1A11
                   BRL   L1C91

L1A11              LDY   #iVCR_DEVICEID
                   LDA   [ptrVCR],Y
                   STA   deviceNum
                   LDA   #$0002
                   STA   callNum
L1A1D              LDA   tmpSTART
                   XBA
                   AND   #$00FF
                   STA   L0122
                   LDA   tmpSTART+2
                   XBA
                   TAX
                   AND   #$FF00
                   ORA   L0122
                   STA   L0122
                   TXA
                   AND   #$00FF
                   STA   L0124
L1A3C              LDA   ptrGSOSBUFFER
                   STA   bufferPtr
                   LDA   ptrGSOSBUFFER+2
                   STA   bufferPtr+2
                   LDA   L0122
                   LDY   #$0005
                   SEC
                   SBC   [ptrGSOSBUFFER],Y
                   BCC   L1A65
                   CMP   #$007A
                   BCC   L1A72
                   LDY   #$0001
                   LDA   [ptrGSOSBUFFER],Y
                   BNE   L1A60
                   LDA   #$0051
                   SEC
                   RTS

L1A60              JSR   TS2BLOCK
                   BRA   L1A3C

L1A65              LDY   #$0000
                   LDA   [ptrFILENAME],Y
                   JSR   TS2BLOCK
                   BCC   L1A70
                   RTS

L1A70              BRA   L1A3C
L1A72              ASL
                   ADC   #$000C
                   TAY
                   LDA   [ptrGSOSBUFFER],Y
                   BNE   L1A7E
                   BRL   L1C12
L1A7E              STA   tmpTS
                   LDY   #iFCR_TS
                   CMP   [ptrFCR],Y
                   BEQ   L1AD6
                   LDA   $BE
                   BNE   L1AB6
                   LDA   tmpSTART
                   AND   #$00FF
                   BNE   L1AB6
                   LDA   tmpEND
                   CMP   #$0101
                   BCC   L1AB6
                   LDA   gsosOUTPUT
                   STA   bufferPtr
                   LDA   gsosOUTPUT+2
                   STA   bufferPtr+2
                   LDA   tmpTS
                   JSR   TS2BLOCK
                   BCC   L1AAD
                   RTS

L1AAD              LDA   #FST_BLOCKSIZE
                   STA   L0118
                   BRL   L1B9F
L1AB6              LDA   ptrGSOSBUFFER
                   CLC
                   ADC   #FST_BLOCKSIZE
                   STA   bufferPtr
                   LDA   ptrGSOSBUFFER+2
                   ADC   #$0000
                   STA   bufferPtr+2
                   LDA   tmpTS
                   JSR   TS2BLOCK
                   BCC   L1ACE
                   RTS

L1ACE              LDY   #iFCR_TS
                   LDA   tmpTS
                   STA   [ptrFCR],Y

L1AD6              LDA   tmpSTART
                   AND   #$00FF
                   STA   L0114
                   LDY   tmpEND+2
                   BNE   L1AED
                   CLC
                   ADC   tmpEND
                   CMP   #$0101
                   BCC   L1AF0
L1AED              LDA   #FST_BLOCKSIZE
L1AF0              STA   tmpBLOCKSIZE
                   SEC
                   SBC   L0114
                   STA   L0116
                   LDA   L0114
                   CLC
                   ADC   #FST_BLOCKSIZE
                   ADC   ptrGSOSBUFFER
                   STA   ptrVTOC2
                   LDA   ptrGSOSBUFFER+2
                   ADC   #$0000
                   STA   ptrVTOC2+2
                   LDX   $BE
                   BNE   L1B75
                   LDA   L0116
                   CMP   #$0064              ; 100
                   BCS   L1B51
                   LSR
                   TAX
                   BCC   L1B30
                   SEP   #$20
                   LDA   [ptrVTOC2]
                   STA   [gsosOUTPUT]
                   REP   #$21
                   INC   ptrVTOC2
                   BNE   L1B2A
                   INC   ptrVTOC2+2
L1B2A              INC   gsosOUTPUT
                   BNE   L1B30
                   INC   gsosOUTPUT+2
L1B30              TXA
                   DEC
                   BMI   L1B3E
                   ASL
                   TAY
L1B36              LDA   [ptrVTOC2],Y
                   STA   [gsosOUTPUT],Y
                   DEY
                   DEY
                   BPL   L1B36
L1B3E              LDA   L0116
                   STA   L0118
                   LSR
                   BCC   L1B9F
                   LDA   gsosOUTPUT
                   BNE   L1B4D
                   DEC   gsosOUTPUT+2
L1B4D              DEC   gsosOUTPUT
                   BRA   L1B9F
L1B51              PEI   ptrVTOC2+2
                   PEI   ptrVTOC2
                   PEI   gsosOUTPUT+2
                   PEI   gsosOUTPUT
                   PEA   $0000
                   LDA   L0116
                   PHA
                   PEA   $0805
                   JSL   MOVE_INFO
                   BCC   L1B6D
                   LDA   #$8000
                   RTS

L1B6D              LDA   L0116
                   STA   L0118
                   BRA   L1B9F
L1B75              JSR   L183D
                   BCC   L1B9F
                   LDA   L0118
                   CLC
                   ADC   tmpTRANSFERCOUNT
                   STA   tmpTRANSFERCOUNT
                   BCC   L1B89
                   INC   tmpTRANSFERCOUNT+2
L1B89              CLC
                   LDA   tmpTRANSFERCOUNT
                   ADC   tmpTOSKIP
                   STA   tmpTRANSFERCOUNT
                   LDA   tmpTRANSFERCOUNT+2
                   ADC   #$0000
                   STA   tmpTRANSFERCOUNT+2
                   BRL   L1CEF
L1B9F              LDA   L0118
                   CLC
                   ADC   tmpTRANSFERCOUNT
                   STA   tmpTRANSFERCOUNT
                   BCC   L1BAE
                   INC   tmpTRANSFERCOUNT+2
L1BAE              LDA   tmpEND
                   SEC
                   SBC   L0118
                   STA   tmpEND
                   BCS   L1BBD
                   DEC   tmpEND+2
L1BBD              LDA   tmpEND
                   ORA   tmpEND+2
                   BNE   L1BDB
                   CLC
                   LDA   tmpTRANSFERCOUNT
                   ADC   tmpTOSKIP
                   STA   tmpTRANSFERCOUNT
                   LDA   tmpTRANSFERCOUNT+2
                   ADC   #$0000
                   STA   tmpTRANSFERCOUNT+2
                   BRL   L1CEF
L1BDB              LDA   tmpEND
                   CLC
                   ADC   tmpTOSKIP
                   STA   L1BF3
                   LDA   tmpEND+2
                   ADC   #$0000
                   ORA   L1BF3
                   BNE   L1BF5
                   BRL   L1CEF

L1BF3              DW    $0000

L1BF5              LDA   L0118
                   TAX
                   CLC
                   ADC   tmpSTART
                   STA   tmpSTART
                   BCC   L1C05
                   INC   tmpSTART+2
L1C05              TXA
                   CLC
                   ADC   gsosOUTPUT
                   STA   gsosOUTPUT
                   BCC   L1C0F
                   INC   gsosOUTPUT+2
L1C0F              BRL   L1A1D
L1C12              LDA   $BE
                   BEQ   L1C40
                   LDY   L00FE
                   SEP   #$20
L1C1B              DEY
                   BMI   L1C40
                   LDA   [$BA],Y
                   BNE   L1C1B
                   STA   [gsosOUTPUT]
                   REP   #$31
                   INC   tmpTRANSFERCOUNT
                   BNE   L1C2E
                   INC   tmpTRANSFERCOUNT+2
L1C2E              LDA   tmpEND
                   SEC
                   SBC   #$0001
                   STA   tmpEND
                   BCS   L1C3D
                   DEC   tmpEND+2
L1C3D              BRL   L1CEF
L1C40              REP   #$31
                   LDA   tmpSTART
                   AND   #$00FF
                   STA   L0114
                   LDY   tmpEND+2
                   BNE   L1C59
                   CLC
                   ADC   tmpEND
                   CMP   #$0101
                   BCC   L1C5C
L1C59              LDA   #FST_BLOCKSIZE
L1C5C              STA   tmpBLOCKSIZE
                   SEC
                   SBC   L0114
                   STA   L0116
                   LSR
                   TAX
                   LDA   #$0000
                   BCC   L1C79
                   SEP   #$20
                   STA   [gsosOUTPUT]
                   REP   #$21
                   INC   gsosOUTPUT
                   BNE   L1C79
                   INC   gsosOUTPUT+2
L1C79              TXA
                   DEC
                   BMI   L1C88
                   ASL
                   TAY
                   LDA   #$0000
L1C82              STA   [gsosOUTPUT],Y
                   DEY
                   DEY
                   BPL   L1C82
L1C88              LDA   L0116
                   STA   L0118
                   BRL   L1B9F
L1C91              LDA   $BE
                   BEQ   L1CBB
                   LDA   tmpEND
                   STA   L0116
                   STZ   L0118
                   LDA   tmpMARK
                   CLC
                   ADC   ptrGSOSBUFFER
                   STA   ptrVTOC2
                   LDA   tmpMARK+2
                   ADC   ptrGSOSBUFFER+2
                   STA   ptrVTOC2+2
                   JSR   L183D
                   LDA   L0118
                   STA   tmpTRANSFERCOUNT
                   STZ   tmpTRANSFERCOUNT+2
                   BRA   L1CEF
L1CBB              LDA   tmpMARK
                   CLC
                   ADC   ptrGSOSBUFFER
                   TAX
                   LDA   tmpMARK+2
                   ADC   ptrGSOSBUFFER+2
                   PHA
                   PHX
                   PEI   gsosOUTPUT+2
                   PEI   gsosOUTPUT
                   PEA   $0000
                   LDA   tmpEND
                   PHA
                   PEA   $0805
                   JSL   MOVE_INFO
                   BCC   L1CE1
                   LDA   #$8000
                   RTS

L1CE1              LDA   tmpEND
                   STA   tmpTRANSFERCOUNT
                   LDA   tmpEND+2
                   STA   tmpTRANSFERCOUNT+2
                   BRA   L1D5A
L1CEF              SEC
                   LDA   tmpTRANSFERCOUNT
                   SBC   tmpTOSKIP
                   STA   tmpTRANSFERCOUNT
                   LDA   tmpTRANSFERCOUNT+2
                   SBC   #$0000
                   STA   tmpTRANSFERCOUNT+2
                   LDY   #iFCR_OTYPE
                   LDA   [ptrFCR],Y
                   BNE   L1D5A
                   LDA   textMODE
                   BEQ   L1D5A
                   LDA   fgCLASS
                   BEQ   L1D22
                   LDY   #$0004
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2
                   BRA   L1D2F
L1D22              LDY   #$0002
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT
                   INY
                   INY
                   LDA   [ptrParamBlock],Y
                   STA   gsosOUTPUT+2
L1D2F              LDY   tmpTRANSFERCOUNT+2
                   INY
                   LDX   tmpTRANSFERCOUNT
                   BNE   L1D3F
                   DEY
                   TXA
                   ORA   tmpTRANSFERCOUNT+2
                   BEQ   L1D58
L1D3F              STY   $C4
                   LDY   #$0000
                   SEP   #$20
L1D46              LDA   [gsosOUTPUT],Y
                   AND   #$7F
                   STA   [gsosOUTPUT],Y
                   INY
                   BNE   L1D51
                   INC   gsosOUTPUT+2
L1D51              DEX
                   BNE   L1D46
                   DEC   $C4
                   BNE   L1D46
L1D58              REP   #$20
L1D5A              LDY   #iFCR_MARK
                   LDA   [ptrFCR],Y
                   CLC
                   ADC   tmpTRANSFERCOUNT
                   STA   [ptrFCR],Y
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   ADC   tmpTRANSFERCOUNT+2
                   STA   [ptrFCR],Y
L1D6E              LDA   fgCLASS
                   BNE   L1D78
                   LDY   #$000A
                   BRA   L1D7B
L1D78              LDY   #$000C
L1D7B              LDA   tmpTRANSFERCOUNT
                   STA   [ptrParamBlock],Y
                   LDA   tmpTRANSFERCOUNT+2
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   LDA   errREAD
                   CMP   #$0001
                   RTS

errREAD            DW    $0000

*
* CHECK DATA FORK
*

checkDATAFORK      LDA   fgCLASS
                   BEQ   L1DCB

                   LDA   fgNBPARAMS
                   CMP   #$0004
                   BCC   L1DCB
                   CLC
                   LDY   #$0008
                   LDA   [ptrParamBlock],Y
                   AND   #$0002
                   BEQ   L1DAD
                   LDA   #$004E
                   BRA   L1DCA
L1DAD              LDA   fgNBPARAMS
                   CMP   #$0005
                   BCC   L1DCB
                   CLC
                   LDY   #$000A
                   LDA   [ptrParamBlock],Y
                   BEQ   L1DCB
                   CMP   #$0001
                   BEQ   L1DC7
                   LDA   #$0053
                   BRA   L1DCA
L1DC7              LDA   #$0063
L1DCA              SEC
L1DCB              RTS

*
* CALLED BY OPEN
*

doOPEN             STZ   errVOLUME
                   JSR   updateVCR
                   BCC   L1DD7
                   BRL   L20FA
L1DD7              LDA   (shtFILENAME)
                   BEQ   L1DDE
                   BRL   L1ED4
L1DDE              JSR   checkDATAFORK
                   BCC   L1DE6
                   BRL   L20FA
L1DE6              LDA   L01AA
                   INC
                   STA   L01DC
                   SEP   #$20
                   LDA   #$3A
                   LDY   #$0002
                   STA   L01DC,Y
L1DF7              LDA   L01AA,Y
                   CMP   #$01
                   INY
                   STA   L01DC,Y
                   BCS   L1DF7
                   REP   #$20
                   LDX   #L01DC
                   LDY   #^L01DC
                   LDA   #$0032
                   JSL   ALLOC_FCR
                   BCC   L1E16
                   BRL   L20FA
L1E16              JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2

                   LDA   #$4000
                   TSB   errVOLUME
                   LDY   #iFCR_FST
                   LDA   #FST_DOS33
                   STA   [ptrFCR],Y
                   LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   LDY   #iFCR_VCR
                   STA   [ptrFCR],Y
                   LDY   #iVCR_SEGMENT
                   LDA   [ptrVCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrVCR],Y
                   LDY   #iFCR_SEG2+2
                   STA   [ptrFCR],Y
                   TXA
                   DEY
                   DEY
                   STA   [ptrFCR],Y
                   LDY   #iFCR_MARK
                   LDA   #$0000
                   STA   [ptrFCR],Y
                   INY
                   INY
                   STA   [ptrFCR],Y
                   LDY   #iFCR_EOF+2
                   STA   [ptrFCR],Y
                   LDY   #iFCR_AUXTYPE
                   STA   [ptrFCR],Y
                   INY
                   INY
                   STA   [ptrFCR],Y
                   LDY   #iFCR_DISPLACEMENT
                   STA   [ptrFCR],Y
                   LDY   #iFCR_NBSEC+2
                   STA   [ptrFCR],Y
                   DEY
                   DEY
                   STA   [ptrFCR],Y
                   XBA
                   LDY   #iFCR_EOF
                   STA   [ptrFCR],Y
                   LDY   #iFCR_TYPE
                   LDA   #rootDIR
                   STA   [ptrFCR],Y
                   LDY   #iFCR_ACCESS
                   LDA   #$00C3
                   STA   [ptrFCR],Y
                   STZ   intENTRYNB

                   LDA   #$0000
L1E8E              LDX   #$0000
L1E91              STA   L00EE
                   STX   L00F0
                   JSR   getFILEOFFSET
                   BCC   L1E9F
                   BRL   L20FA

L1E9F              JSR   isDELETEDFILE
                   BEQ   L1EBE
                   CMP   #$00FF
                   BEQ   L1EAC
                   INC   intENTRYNB
L1EAC              LDX   L00F0
                   LDA   L00EE
                   INX
                   CPX   #$0007
                   BCC   L1E91
                   INC
                   CMP   tmpLENGTH
                   BCC   L1E8E
L1EBE              LDA   intENTRYNB
                   LDY   #iFCR_TS
                   STA   [ptrFCR],Y
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   BNE   L1ECF
                   INC
L1ECF              STA   [ptrVCR],Y
                   BRL   L2033

L1ED4              JSR   L14A7
                   BCC   L1EDF
                   LDA   #$0051
                   BRL   L20FA
L1EDF              LDA   L00F0
                   BPL   L1EEA
                   LDA   #$0046
                   BRL   L20FA
L1EEA              JSR   checkDATAFORK
                   BCC   L1EF2
                   BRL   L20FA
L1EF2              LDA   L01AA
                   INC
                   STA   L01DC
                   SEP   #$20
                   LDA   #$3A
                   LDY   #$0002
                   STA   L01DC,Y
L1F03              LDA   L01AA,Y
                   CMP   #$01
                   INY
                   STA   L01DC,Y
                   BCS   L1F03
                   REP   #$20
                   LDX   #L01DC
                   LDY   #^L01DC
                   LDA   #$0032
                   JSL   ALLOC_FCR
                   BCC   L1F25
                   LDA   #$0054
                   BRL   L20FA
L1F25              JSL   DEREF
                   STX   ptrFCR
                   STY   ptrFCR+2
                   LDA   #$4000
                   TSB   errVOLUME
                   LDA   #$0200
                   JSL   ALLOC_SEG
                   BCC   L1F42
                   LDA   #$0054
                   BRL   L20FA
L1F42              TYA
                   LDY   #iFCR_SEG2+2
                   STA   [ptrFCR],Y
                   TXA
                   DEY
                   DEY
                   STA   [ptrFCR],Y
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   INC
                   BNE   L1F56
                   INC
L1F56              STA   [ptrVCR],Y
                   LDA   #$0000
                   LDY   #iFCR_MARK
                   STA   [ptrFCR],Y
                   INY
                   INY
                   STA   [ptrFCR],Y
                   LDY   #iFCR_2E
                   LDA   L00F0
                   STA   [ptrFCR],Y
                   LDY   #iFCR_DISPLACEMENT
                   LDA   L00EE
                   STA   [ptrFCR],Y
                   LDY   #iFCR_FST
                   LDA   #FST_DOS33
                   STA   [ptrFCR],Y
                   LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   LDY   #iFCR_VCR
                   STA   [ptrFCR],Y
                   LDY   #$0002
                   LDA   [ptrFILENAME],Y
                   AND   #$007F
                   LDY   #iFCR_OTYPE
                   STA   [ptrFCR],Y
                   BRA   L1FC3

* DEAD CODE
                   STZ   L218A
                   LDY   #$0000
L1F9B              LDA   L218A
                   LSR
                   TAX
                   LDA   L214C,X
                   STA   L2188
                   LDX   #$0010
L1FA9              ASL   L2188
                   BCC   L1FB2
                   LDA   [ptrFCR2],Y
                   STA   [ptrFCR],Y
L1FB2              INY
                   INY
                   DEX
                   BNE   L1FA9
                   LDA   L218A
                   BNE   L1FC1
                   INC   L218A
                   BRA   L1F9B
L1FC1              BRA   L2033

* END OF DEAD CODE

L1FC3              LDY   #iFCR_SEG2
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   LDA   [ptrFCR],Y
                   TAY
                   JSL   DEREF
                   STX   bufferPtr
                   STX   ptrGSOSBUFFER
                   STY   bufferPtr+2
                   STY   ptrGSOSBUFFER+2
                   LDA   #$0002
                   STA   callNum
                   LDY   #iFCR_2E
                   LDA   [ptrFCR],Y
                   TAX
                   LDY   #iFCR_DISPLACEMENT
                   LDA   [ptrFCR],Y
                   JSR   getFILEOFFSET
                   JSR   getORIGINAL
                   BCC   L1FF5
                   BRL   L20FA
L1FF5              LDY   #iFCR_TS
                   LDA   L012E
                   STA   [ptrFCR],Y
                   LDY   #iFCR_ACCESS
                   LDA   intACCESS
                   STA   [ptrFCR],Y
                   LDY   #iFCR_EOF
                   LDA   intEOF
                   STA   [ptrFCR],Y
                   LDA   intEOF+2
                   INY
                   INY
                   STA   [ptrFCR],Y
                   LDY   #iFCR_AUXTYPE
                   LDA   intAUXTYPE
                   STA   [ptrFCR],Y
                   LDY   #iFCR_TYPE
                   LDA   intFILETYPE
                   STA   [ptrFCR],Y
                   LDY   #iFCR_NBSEC
                   LDA   intNBSEC
                   STA   [ptrFCR],Y
                   LDA   #$0000
                   INY
                   INY
                   STA   [ptrFCR],Y

L2033              LDA   fgCLASS
                   BNE   L203B
                   BRL   L20C3
L203B              LDA   fgNBPARAMS
                   TAX
                   LDY   #$FFFE
L2042              INY
                   INY
                   LDA   tblOPEN,Y
                   ASL
                   BCC   L204D
                   DEX
                   BMI   L205B
L204D              ASL
                   BCS   L2042
                   LSR
                   LSR
                   PHY
                   TAY
                   LDA   [ptrFCR],Y
                   PLY
                   STA   [ptrParamBlock],Y
                   BRA   L2042
L205B              LDX   fgNBPARAMS
                   CPX   #$0008
                   BCC   L20CD
                   LDY   #$0012
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   CPX   #$0009
                   BCC   L20CD
                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR],Y
                   CMP   #rootDIR
                   BEQ   L207D

                   LDA   #$0001
L207D              LDY   #$0014
                   STA   [ptrParamBlock],Y
                   CPX   #$000A
                   BCC   L20CD
                   LDA   #$0000
                   LDY   #$0016
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   CPX   #$000B
                   BCC   L20CD
                   LDY   #$001E
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   CPX   #$000C
                   BCC   L20CD
                   LDY   #$0026
                   JSR   setOPTIONLIST
                   BCC   L20CD
                   LDA   #$004F
                   BRA   L20FA
L20C3              LDY   #iFCR_ID
                   LDA   [ptrFCR],Y
                   LDY   #$0000
                   STA   [ptrParamBlock],Y
L20CD              LDA   fgNBPARAMS
                   CMP   #$000E
                   BCC   L20F5
                   LDY   #$0032
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
                   LDA   fgNBPARAMS
                   CMP   #$000F
                   BCC   L20F5
                   LDY   #$0036
                   LDA   #$0000
                   STA   [ptrParamBlock],Y
                   INY
                   INY
                   STA   [ptrParamBlock],Y
L20F5              CLC
                   LDA   #$0000
                   RTS

L20FA              PHA
                   BIT   errVOLUME
                   PHP
                   BVC   L2135
                   LDY   #iFCR_TYPE
                   LDA   [ptrFCR],Y
                   CMP   #rootDIR
                   BEQ   L211E
                   LDY   #iFCR_SEG2
                   LDA   [ptrFCR],Y
                   TAX
                   INY
                   INY
                   ORA   [ptrFCR],Y
                   BEQ   L211E
                   LDA   [ptrFCR],Y
                   TAY
                   JSL   RELEASE_SEG
L211E              LDY   #iFCR_ID
                   LDA   [ptrFCR],Y
                   JSL   RELEASE_FCR
                   LDY   #iVCR_BUSY
                   LDA   [ptrVCR],Y
                   BEQ   L2135
                   INC
                   BEQ   L2133
                   DEC
                   DEC
L2133              STA   [ptrVCR],Y
L2135              PLP
                   BPL   L2149
                   LDY   #iVCR_BUSY
                   LDA   #$0000
                   STA   [ptrVCR],Y
                   LDY   #iVCR_ID
                   LDA   [ptrVCR],Y
                   JSL   RELEASE_VCR
L2149              PLA
                   SEC
                   RTS

L214C              HEX   18E4FC00

tblOPEN            DW    $4000
                   DW    $8000
                   DW    $C000
                   DW    $4000
                   DW    $C000
                   DW    $C000
                   DW    $8014
                   DW    $8024
                   DW    $801E
                   DW    $4000
                   DW    $C000
                   DW    $C000
                   DW    $4000
                   DW    $4000
                   DW    $4000
                   DW    $C000
                   DW    $4000
                   DW    $4000
                   DW    $4000
                   DW    $C000
                   DW    $4000
                   DW    $801A
                   DW    $001C
                   DW    $8028
                   DW    $4002
                   DW    $C000
                   DW    $C000
                   DW    $C000
L2188              DW    $0000
L218A              DW    $0000

*-----------------------------

                   put   DOS33
                   put   TRACK11
                   put   HELLO

