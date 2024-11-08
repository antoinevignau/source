*
* RDOS 3.3 FST
*

                  lst   off
                  rel
                  typ   $BD
                  dsk   RDOS3.3.FST.L

                  mx    %00

*
* EQUATES
*

FST_RDOS33        =     $E
FST_BLOCKSIZE     =     $100

vtocSTART         =     $10                 ; $10 first block of VTOC
vtocEND           =     $20                 ; $20 end block of VTOC + 1

rootDIR           =     $0F

iFCR_ID           =     $00
iFCR_NAME         =     $02                 ; virtual pointer to name
iFCR_FST          =     $06                 ; which FST it is related to
iFCR_VCR          =     $08                 ; which VCR it is related to
iFCR_0A           =     $0A                 ; not used ?
iFCR_SEG1         =     $0C                 ; the "cached" block
iFCR_10           =     $10                 ; * and its pointer
iFCR_12           =     $12                 ; * and its second pointer
iFCR_ACCESS       =     $14                 ; GS/OS file access
iFCR_SEG2         =     $16                 ; virtual pointer to VTOC
iFCR_EOF          =     $1A                 ; file end of file
iFCR_AUXTYPE      =     $1E                 ; file auxtype
iFCR_MARK         =     $20                 ; file current mark
iFCR_TYPE         =     $24                 ; GS/OS file type
iFCR_OTYPE        =     $26                 ; original file type
iFCR_NBSEC        =     $28                 ; file number of blocks
iFCR_VTOCINDEX    =     $2C                 ; which vtoc block it is in
iFCR_FILEINDEX    =     $2E                 ; which entry in vtoc block number
iFCR_TS           =     $30                 ; latest Track/Sector of data!

iVCR_ID           =     $00
iVCR_NAME         =     $02
iVCR_FLAGS        =     $06
iVCR_BUSY         =     $08
iVCR_FST          =     $0A
iVCR_DEVICEID     =     $0C
iVCR_VTOC         =     $0E                 ; virtual pointer to VTOC segment (TRACK $1)
iVCR_LENGTH       =     $12                 ; number of sectors of VTOC

* GS/OS calls

DEV_DISPATCHER    EQU   $01FC00
ALLOC_SEG         EQU   $01FC1C
RELEASE_SEG       EQU   $01FC20
ALLOC_VCR         EQU   $01FC24
RELEASE_VCR       EQU   $01FC28
ALLOC_FCR         EQU   $01FC2C
RELEASE_FCR       EQU   $01FC30
DEREF             EQU   $01FC38
GET_SYS_GBUF      EQU   $01FC3C
SYS_EXIT          EQU   $01FC40
FIND_VCR          EQU   $01FC48
GET_FCR           EQU   $01FC64
LOCK_MEM          EQU   $01FC68
UNLOCK_MEM        EQU   $01FC6C
MOVE_INFO         EQU   $01FC70

* GS/OS direct page

deviceNum         =     $00
callNum           =     $02
bufferPtr         =     $04
requestCount      =     $08
transferCount     =     $0C
blockNum          =     $10
blockSize         =     $14
FSTNum            =     $16                 ; *
statusCode        =     $16                 ; *
volumeID          =     $18
cachePriority     =     $1A
cachePointer      =     $1C
dibPointer        =     $20

ptrParamBlock     =     $32
lastDevice        =     $36
virtualFCR        =     $3A
virtualVCR        =     $3E

*
* FST direct page
*

ptrSEGMENT        =     $80
ptrVOLNAME        =     $84

ptrVCR            =     $88
ptrVTOC           =     $8C
ptrFCR            =     $90
ptrFCR2           =     $94
ptrGSOSBUFFER     =     $98

ptrSTRING1        =     $A0
ptrSTRING2        =     $A4
ptrFILENAME       =     $A8
shtVOLNAME        =     $AC
ptrVTOC2          =     $AE
shtFILENAME       =     $B2
gsosOUTPUT        =     $B4
ptrSPATH          =     $B8
shtPARAMETERS     =     $C2

*
* FST CODE
*

                  ASC   'FST '              ; FST signature
                  ADRL  fstMAIN             ; call handler entry point
                  ADRL  fstGSOS             ; GS/OS entry point
                  DW    FST_RDOS33          ; file system ID

* 0001_1000_0000_0011
* 0001 clear high bit of pathname characters
* 1000 read-only FST
* 0000
* 0010 Non Apple II format
                  DW    $1802               ; attributes

                  DW    $0100               ; version
                  DW    FST_BLOCKSIZE       ; block size
                  ADRL  $00000230           ; max volume size (blocks)
                  ADRL  $00000020
                  ADRL  $FFFFFFFF           ; max file size (bytes)
                  ADRL  $00000000
                  STR   'Apple II RDOS 3.3'  ; FST name
                  STR   'RDOS 3.3 FST          v01.00'
                  DW    $0000
                  ASC   'RDOS 3.3 FST. Written by Antoine Vignau, '
                  ASC   'Based on the work of Monte Benaresh. '
                  ASC   'Copyright 2008 Brutal Deluxe Software'

haSEGMENT         ds    4
tmpDEVICE         ds    2

workFCR           ds    2
tmpFCR            ds    2
tmpLENGTH         ds    2
tmpMASK           ds    2

* Index of the current file

vtocINDEX         ds    2                   ; index within the complete VTOC
; 2 means 2nd sector of VTOC
fileINDEX         ds    2                   ; index within a VTOC sector

fgCLASS           ds    2
fgNBPARAMS        ds    2

newMARK           ds    4
workMARK          ds    4

tmpTS             ds    2
nbTOTRANSFER      ds    4
startINDEX        ds    2
nbINDEX           ds    2
transINDEX        ds    2
curMARK           ds    4
tmpREQUESTCOUNT   ds    4
tmpBLOCKSIZE      ds    2
tmpTRANSFERCOUNT  ds    4

startBLOCK        ds    2
gsosBUFFER        ds    4
textMODE          ds    2
errVOLUME         ds    2

errMAIN           ds    2
maxPARAMS         ds    2
minPARAMS         ds    2

STR_VOLUME        ds    $32                 ; VOLUNENAME
STR_FILE          ds    $32                 ; FILENAME
STR_PATH          ds    $32                 ; VOLUMENAME
STR_GSOS          ds    $32                 ; COMPLETE :RDOS3.3

intENTRYNB        ds    2
intOFILETYPE      ds    2
intFILETYPE       ds    2
intACCESS         ds    2
intAUXTYPE        ds    2
curEOF            ds    4
intNBSEC          ds    2
theENTRY          ds    2
intSTORAGE        dw    $0001
                  dw    $0002
                  ds    2

*
* OPEN
*

OPEN              STZ   errOPEN
                  JSL   LOCK_MEM
                  JSR   doOPEN
                  STA   errOPEN
                  LDA   haSEGMENT
                  TAX
                  ORA   haSEGMENT+2
                  BEQ   L0243
                  LDY   haSEGMENT+2
                  JSL   RELEASE_SEG
L0243             JSL   UNLOCK_MEM
                  LDA   errOPEN
                  CMP   #$0001
                  BCC   L0252
                  ORA   errMAIN
L0252             JMPL  SYS_EXIT

errOPEN           ds    2

*
* VOLUME
*

VOLUME            STZ   errVOLUME
                  JSL   LOCK_MEM
                  JSR   getDEVICEID
                  BCS   L02D5
                  BEQ   L026B
                  LDA   #$0052
                  BRA   L02D5

L026B             LDA   fgCLASS
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
L0292             BRA   L02A1

L0294             LDY   #$0004              ; do the same for class 0 calls
                  LDA   [ptrParamBlock],Y
                  STA   gsosOUTPUT
                  INY
                  INY
                  LDA   [ptrParamBlock],Y
                  STA   gsosOUTPUT+2

*

L02A1             LDA   #STR_PATH           ; Get memory for volume info
                  STA   ptrSPATH

                  LDA   #$1000
                  JSL   ALLOC_SEG
                  BCC   L02B5
                  LDA   #$0054
                  BRL   L043F

L02B5             STX   haSEGMENT
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
L02D2             LDA   #$0052
L02D5             SEC
                  BRL   L043F

*

L02D9             LDA   #STR_PATH
                  STA   ptrVOLNAME
                  LDA   #^STR_PATH
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
L02F9             LDA   #$0057
                  BRA   L02D5

L02FE             LDA   fgCLASS
                  BEQ   L031C

                  LDA   (ptrSPATH)
                  INC
                  LDY   #$0002
                  STA   [gsosOUTPUT],Y
                  LDA   gsosOUTPUT
                  CLC
                  ADC   #$0003
                  STA   gsosOUTPUT
                  BCC   L0317
                  INC   gsosOUTPUT+2
L0317             LDY   #$0002
                  BRA   L0321

L031C             LDA   (ptrSPATH)
                  INC
                  STA   [gsosOUTPUT]

L0321             SEP   #$20
                  LDY   #$0002
L0326             LDA   (ptrSPATH),Y
                  BEQ   L032F
                  STA   [gsosOUTPUT],Y
                  INY
                  BPL   L0326

L032F             REP   #$20
                  LDA   fgCLASS
                  BNE   L0345

                  LDY   #$0001
                  LDA   [gsosOUTPUT],Y
                  AND   #$FF00
                  ORA   #$002F              ; /
                  STA   [gsosOUTPUT],Y
                  BRA   L02F9
L0345             LDY   #$0001
                  LDA   [gsosOUTPUT],Y
                  AND   #$FF00
                  ORA   #$003A              ; :
                  STA   [gsosOUTPUT],Y
                  BRA   L02F9

*

L0354             LDA   fgCLASS
                  BEQ   L0372

                  LDA   (ptrSPATH)
                  INC
                  LDY   #$0002
                  STA   [gsosOUTPUT],Y
                  LDA   gsosOUTPUT
                  CLC
                  ADC   #$0003
                  STA   gsosOUTPUT
                  BCC   L036D
                  INC   gsosOUTPUT+2
L036D             LDY   #$0002
                  BRA   L0377

L0372             LDA   (ptrSPATH)
                  INC
                  STA   [gsosOUTPUT]
L0377             SEP   #$20
                  LDY   #$0002
L037C             LDA   (ptrSPATH),Y
                  BEQ   L0385
                  STA   [gsosOUTPUT],Y
                  INY
                  BPL   L037C

L0385             REP   #$20
                  LDA   fgCLASS
                  BNE   L03D1

                  LDY   #$0001
                  LDA   [gsosOUTPUT],Y
                  AND   #$FF00
                  ORA   #$002F
                  STA   [gsosOUTPUT],Y

                  LDY   #$0008              ; totalBlocks
                  LDA   #$0230              ; 560
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
                  LDA   #FST_RDOS33
                  LDY   #$0010              ; fileSysID
                  STA   [ptrParamBlock],Y
                  CLC
                  BRA   L043F

L03D1             LDY   #$0001              ; class 1 calls
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

                  LDY   #$000A
                  LDA   #$0230              ; 560
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

                  LDA   #FST_RDOS33
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

L043F             PHA
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

L0459             LDA   haSEGMENT
                  TAX
                  ORA   haSEGMENT+2
                  BEQ   L0469
                  LDY   haSEGMENT+2
                  JSL   RELEASE_SEG
L0469             PLP
                  PLA
                  BCC   L0470
                  ORA   errMAIN
L0470             JMPL  SYS_EXIT

L0474             DW    $0000

*
* doFREEBLOCKS
*

doFREEBLOCKS      =     *

                  stz   nbFREE

                  ldy   #0
]lp               lda   [ptrVTOC],y
                  tyx
                  and   #$00ff
                  beq   end
                  cmp   #$0080
                  beq   next

                  tya
                  clc
                  adc   #$19
                  tay
                  lda   [ptrVTOC],y
                  and   #$ff
                  clc
                  adc   nbFREE
                  sta   nbFREE

next              txa
                  clc
                  adc   #$20
                  tay
                  bra   ]lp

end               lda   #560
                  sec
                  sbc   nbFREE
                  rts

nbFREE            ds    2

*
* GET FILE INFO
*

GETFILEINFO       JSL   LOCK_MEM
                  JSR   matchVCR
                  BCC   L04E8
                  BRL   L05E6

L04E8             LDY   #iVCR_VTOC
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
                  BNE   L0534               ; not empty: a file

* Handle root directory information

                  STZ   intAUXTYPE          ; otherwise the root directory
                  STZ   curEOF+2
                  STZ   intNBSEC
                  LDA   tmpLENGTH
                  INC
                  LDX   fgCLASS
                  BNE   L051F
                  STA   intNBSEC

L051F             XBA
                  STA   curEOF

                  LDA   #rootDIR            ; rootDIR
                  STA   intFILETYPE
                  STA   intSTORAGE
                  LDA   #$00C3              ; locked
                  STA   intACCESS
                  BRA   L056C

* Handle file information

L0534             LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  BEQ   L0540               ; no activity = no files open

                  JSR   checkFCR            ; is the file already open
                  BCC   L05B4

L0540             JSR   compareFILENAME
                  BCC   L054B
                  LDA   #$0051
                  BRL   L05E6
L054B             LDA   fileINDEX
                  BPL   L0556
                  LDA   #$0046
                  BRL   L05E6

L0556             LDA   gsosBUFFER
                  STA   ptrGSOSBUFFER
                  LDA   gsosBUFFER+2
                  STA   ptrGSOSBUFFER+2
* LDA #$0002
* STA callNum
                  JSR   getORIGINAL         ; Driver_Read
                  BCC   L056C
                  BRA   L05E5

L056C             LDA   fgCLASS
                  BNE   L0592

                  LDA   #$0001              ; class 0
                  STA   fgNBPARAMS
                  LDA   intFILETYPE
                  CMP   #rootDIR
                  BNE   L0585

                  LDA   #$0230              ; 560
                  STA   intAUXTYPE

L0585             LDA   #L0CD0
                  STA   shtPARAMETERS
                  JSR   setPARAMETERS
                  LDA   #$0000
                  BRA   L05E6

L0592             LDA   #L0CEA
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
L05AF             LDA   #$0000
                  BRA   L05E6

* The file is already open

L05B4             LDY   #iFCR_ACCESS
                  LDA   [ptrFCR2],Y
                  STA   intACCESS
                  LDY   #iFCR_EOF
                  LDA   [ptrFCR2],Y
                  STA   curEOF
                  INY
                  INY
                  LDA   [ptrFCR2],Y
                  STA   curEOF+2
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
L05E5             SEC

L05E6             PHA
                  LDA   haSEGMENT
                  TAX
                  ORA   haSEGMENT+2
                  BEQ   L05F7
                  LDY   haSEGMENT+2
                  JSL   RELEASE_SEG
L05F7             JSL   UNLOCK_MEM
                  PLA
                  CMP   #$0001
                  BCC   L0604
                  ORA   errMAIN
L0604             JMPL  SYS_EXIT

*
* GETDIRENTRY
*

GETDIRENTRY       JSL   LOCK_MEM
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

L0633             STX   haSEGMENT
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
L0662             JSL   UNLOCK_MEM
                  PLA
                  CMP   #$0001
                  BCC   L066F
                  ORA   errMAIN
L066F             JMPL  SYS_EXIT

*
* READ
*

READ              JSL   LOCK_MEM
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

                  LDY   #iVCR_VTOC
                  LDA   [ptrVCR],Y
                  TAX
                  INY
                  INY
                  LDA   [ptrVCR],Y
                  TAY
                  JSL   DEREF
                  STX   ptrVTOC
                  STY   ptrVTOC+2

                  LDY   #iFCR_FILEINDEX
                  LDA   [ptrFCR],Y
                  TAX
                  LDY   #iFCR_VTOCINDEX
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
L06C0             JMPL  SYS_EXIT

*
* CLOSE
*

CLOSE             JSL   LOCK_MEM
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
L06F9             LDY   #iFCR_ID
                  LDA   [ptrFCR],Y
                  JSL   RELEASE_FCR
                  BCC   L0709
                  LDA   #$8043
                  BRA   L071C
L0709             LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  BNE   L0715
                  LDA   #$1F40
                  BRA   L071C
L0715             DEC
                  STA   [ptrVCR],Y
                  CLC
                  LDA   #$0000
L071C             PHA
                  PHP
                  JSL   UNLOCK_MEM
                  PLP
                  PLA
                  BCC   L0729
                  ORA   errMAIN
L0729             JMPL  SYS_EXIT

*
* GETDEVNUMBER
*

GETDEVNUMBER      JSL   LOCK_MEM

                  LDA   lastDevice          ; do we have a device number?
                  BEQ   L0744               ; no, get one!

L0735             LDY   #$0006              ; class 1
                  LDX   fgCLASS
                  BNE   L0740
                  LDY   #$0004              ; class 0
L0740             STA   [ptrParamBlock],Y
                  BRA   L075B

L0744             JSR   matchVCR
                  BCC   L0754
                  CMP   #$0057
                  BNE   L0751
                  LDA   #$0052
L0751             SEC
                  BRA   L075F

L0754             LDY   #iVCR_DEVICEID
                  LDA   [ptrVCR],Y
                  BRA   L0735

L075B             CLC
                  LDA   #$0000
L075F             PHA
                  PHP
                  LDA   haSEGMENT
                  TAX
                  ORA   haSEGMENT+2
                  BEQ   L0771
                  LDY   haSEGMENT+2
                  JSL   RELEASE_SEG
L0771             JSL   UNLOCK_MEM
                  PLP
                  PLA
                  BCC   L077C
                  ORA   errMAIN
L077C             JMPL  SYS_EXIT

*
* GETEOF
*

GETEOF            JSL   LOCK_MEM
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

L07AD             PLA
                  LDY   #$0004
                  STA   [ptrParamBlock],Y
                  TXA
                  DEY
                  DEY
                  STA   [ptrParamBlock],Y

L07B8             CLC
                  LDA   #$0000
                  PHA
                  PHP
                  JSL   UNLOCK_MEM
                  PLP
                  PLA
                  BCC   L07C9
                  ORA   errMAIN
L07C9             JMPL  SYS_EXIT

*
* GETMARK
*

GETMARK           JSL   LOCK_MEM
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

L07FA             PLA
                  LDY   #$0004
                  STA   [ptrParamBlock],Y
                  TXA
                  DEY
                  DEY
                  STA   [ptrParamBlock],Y
L0805             CLC
                  LDA   #$0000
                  PHA
                  PHP
                  JSL   UNLOCK_MEM
                  PLP
                  PLA
                  BCC   L0816
                  ORA   errMAIN
L0816             JMPL  SYS_EXIT

*
* SETMARK
*

SETMARK           JSL   LOCK_MEM
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

L0840             LDY   #$0002
                  LDA   [ptrParamBlock],Y
                  STA   tmpDISPLACEMENT
                  INY
                  INY
                  LDA   [ptrParamBlock],Y
                  STA   tmpDISPLACEMENT+2
                  BRA   L0867

L0851             LDY   #$0004
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
L0867             LDA   tmpDISPLACEMENT
                  STA   finalMARK
                  LDA   tmpDISPLACEMENT+2
                  STA   finalMARK+2
                  BRA   L08D0

* 1 mark = eof - displacement
L0875             LDY   #iFCR_EOF
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
L088F             STA   finalMARK+2
                  BRA   L08EA

* 3 mark = old mark - displacement
L0894             LDY   #iFCR_MARK
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
L08AE             STA   finalMARK+2
                  BRA   L08EA

* 2 mark = old mark + displacement
L08B3             LDY   #iFCR_MARK
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
L08CD             STA   finalMARK+2

L08D0             LDA   finalMARK+2
                  LDY   #iFCR_EOF+2
                  CMP   [ptrFCR],Y
                  BCC   L08EA
                  BNE   L08E5
                  DEY
                  DEY
                  LDA   [ptrFCR],Y
                  CMP   finalMARK
                  BCS   L08EA
L08E5             LDA   #$004D
                  BRA   L08FD
L08EA             LDA   finalMARK
                  LDY   #iFCR_MARK
                  STA   [ptrFCR],Y
                  LDA   finalMARK+2
                  INY
                  INY
                  STA   [ptrFCR],Y
                  CLC
                  LDA   #$0000
L08FD             PHA
                  JSL   UNLOCK_MEM
                  PLA
                  CMP   #$0001
                  BCC   L090B
                  ORA   errMAIN
L090B             JMPL  SYS_EXIT

tmpDISPLACEMENT   ds    4
finalMARK         ds    4

*
* FLUSH
*

FLUSH             LDA   fgCLASS
                  BEQ   L092A

                  LDA   fgNBPARAMS
                  CMP   #$0003
                  BCC   L092A
                  LDA   #$0004
                  SEC
                  BRA   L092E
L092A             CLC
                  LDA   #$0000
L092E             BCC   L0933
                  ORA   errMAIN
L0933             JMPL  SYS_EXIT

*
* FSTSPECIFIC
*

FSTSPECIFIC       LDY   #$0004
                  LDA   [ptrParamBlock],Y
                  BEQ   L094E
                  DEC
                  BNE   L0946
                  JSR   specific1
                  BRA   L0952
L0946             DEC
                  BNE   L094E
                  JSR   specific2
                  BRA   L0952

L094E             LDA   #$0065
                  SEC
L0952             CMP   #$0001
                  BCC   L095A
                  ORA   errMAIN
L095A             JMPL  SYS_EXIT

*
*
*

L095E             JSL   LOCK_MEM
                  JSR   matchVCR
                  BCS   L096A
                  LDA   #$002B
L096A             PHA
                  LDA   haSEGMENT
                  TAX
                  ORA   haSEGMENT+2
                  BEQ   L097B
                  LDY   haSEGMENT+2
                  JSL   RELEASE_SEG
L097B             JSL   UNLOCK_MEM
                  PLA
                  CMP   #$0001
                  BCC   L0988
                  ORA   errMAIN
L0988             JMPL  SYS_EXIT

*
* FST INTERNAL ENTRY POINT
*
* A: UNDEFINED
* X: CALL NUMBER
* Y: CLASS TYPE
*

fstMAIN           PHK
                  PLB
                  REP   #$30
                  STZ   fgNBPARAMS
                  STZ   errMAIN

                  STY   fgCLASS             ; class 0 or 1 call?
                  CPY   #$0000
                  BEQ   L09C2

                  LDA   [ptrParamBlock]     ; class 1
                  STA   fgNBPARAMS
                  LDA   tblPARAM-2,X        ; how many parameters
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

L09C2             STZ   haSEGMENT           ; jump to call
                  STZ   haSEGMENT+2
                  CPX   #$0069
                  BCS   L09D7
                  JMP   (tblMAIN,X)

L09D0             REP   #$20
                  LDA   #$0004
                  BRA   L09DA
L09D7             LDA   #$0001
L09DA             SEC
                  ORA   errMAIN
                  JMPL  SYS_EXIT

L09E2             LDA   #$002B
                  BRA   L09DA

L09E7             LDA   #$0065
                  BRA   L09DA

* GS/OS CALL NUMBERS

tblMAIN           DA    L09D7               ; 00
                  DA    L095E               ; 01 Create
                  DA    L095E               ; 02 Destroy
                  DA    L09D7               ; 03 OSShutdown
                  DA    L095E               ; 04 ChangePath
                  DA    L095E               ; 05 SetFileInfo
                  DA    GETFILEINFO         ; 06 GetFileInfo
                  DA    L09E7               ; 07 JudgeName
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
                  DA    L09E2               ; 24 Format
                  DA    L09E2               ; 25 EraseDisk
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

tblPARAM          DW    $0108
                  DW    $0102
                  DW    $0102
                  DW    $0204
                  DW    $020D
                  DW    $010D
                  DW    $0107
                  DW    $0207
                  DW    $0203
                  DW    $0203
                  DW    $0102
                  DW    $0102
                  DW    $0001
                  DW    $0204
                  DW    $0102
                  DW    $0210
                  DW    $0405
                  DW    $0406
                  DW    $0406
                  DW    $0102
                  DW    $0102
                  DW    $0304
                  DW    $0203
                  DW    $0304
                  DW    $0203
                  DW    $0102
                  DW    $0102
                  DW    $0512
                  DW    $0001
                  DW    $0001
                  DW    $0102
                  DW    $0203
                  DW    $0001
                  DW    $0001
                  DW    $0001
                  DW    $0305
                  DW    $0305
                  DW    $0001
                  DW    $0102
                  DW    $0102
                  DW    $0003
                  DW    $0102
                  DW    $0209
                  DW    $020C
                  DW    $0506
                  DW    $0506
                  DW    $0607
                  DW    $0607
                  DW    $0001
                  DW    $0001
                  DW    $0112

*
* GS/OS INTERNAL CALL
*

fstGSOS           PHK
                  PLB
                  CPX   #$000B
                  BCS   L0ACA
                  JMP   (tblGSOS,X)

* 0
L0ACA             LDA   #$0001
                  RTL

* 1
L0ACE             JSL   GET_SYS_GBUF
                  STX   gsosBUFFER
                  STY   gsosBUFFER+2

                  LDA   #$0001
                  STA   textMODE
                  BRA   L0AE0

* 2 / 4
L0AE0             LDA   #$0000
                  CLC
                  RTL

* 3
L0AE5             LDX   virtualVCR
                  LDY   virtualVCR+2
                  STX   ptrVCR
                  STY   ptrVCR+2
                  LDY   #iVCR_VTOC
                  LDA   [virtualVCR],Y
                  TAX
                  INY
                  INY
                  ORA   [virtualVCR],Y
                  BEQ   L0B04
                  LDA   [virtualVCR],Y
                  TAY
                  JSL   RELEASE_SEG
L0B04             RTL

tblGSOS           DA    L0ACA               ; 0 NOT CALLED
                  DA    L0ACE               ; 1 HELLO
                  DA    L0AE0               ; 2 BYE
                  DA    L0AE5               ; 3 SET VCR
                  DA    L0AE0               ; 4 NOT CALLED

*
* GET VCR
*

getVCR            LDX   ptrVOLNAME
                  LDY   ptrVOLNAME+2
                  LDA   #$0000
                  JSL   FIND_VCR
                  BCC   L0B21
L0B1C             LDA   #$0000
                  CLC
                  RTS

L0B21             JSL   DEREF
                  STX   ptrVCR
                  STY   ptrVCR+2
                  LDY   #iFCR_FST
                  LDA   [ptrVCR],Y
                  CMP   #FST_RDOS33
                  BEQ   L0B3D
                  JSR   releaseVCR
                  BCC   L0B1C
L0B38             LDA   #$0057
                  SEC
                  RTS

L0B3D             LDY   #iVCR_BUSY
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

L0B63             LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  DEC
                  STA   [ptrVCR],Y
                  JSR   compareVTOC
                  BCS   L0B77
                  LDY   #iVCR_ID
                  LDA   [ptrVCR],Y
                  CLC
                  RTS

L0B77             JSR   releaseVCR
                  BCS   L0B38
                  BRA   L0B1C

*
* UPDATE VCR
*

matchVCR          STZ   tmpDEVICE
                  STZ   haSEGMENT
                  STZ   haSEGMENT+2
                  LDA   #$1000
                  JSL   ALLOC_SEG
                  BCC   L0B97
                  LDA   #$0054
                  RTS
L0B97             STX   haSEGMENT
                  STY   haSEGMENT+2
                  JSL   DEREF
                  STX   ptrSEGMENT
                  STY   ptrSEGMENT+2

                  LDA   #STR_VOLUME         ; latest volume read
                  STA   ptrVOLNAME
                  LDA   #^STR_VOLUME
                  STA   ptrVOLNAME+2

                  LDA   #STR_FILE           ; current volume read
                  STA   shtFILENAME
                  LDA   #^STR_FILE          ; ?
                  STA   gsosOUTPUT          ; ?
                  LDA   #STR_PATH           ; path to GS/OS pathname
                  STA   ptrSPATH
                  LDA   #^STR_PATH
                  STA   ptrSPATH+2
                  JSR   L11CC
                  BCC   L0BCC
                  LDA   #$0040
                  RTS

L0BCC             LDA   lastDevice
                  BEQ   L0BED
                  STA   deviceNum
                  JSR   getDEVICEID
                  BCS   L0BDE
                  BNE   L0BDE
                  JSR   getVOLUMENAME
                  BCC   L0BE3
L0BDE             SEC
                  LDA   #$0052
                  RTS

L0BE3             LDA   #STR_PATH
                  STA   ptrVOLNAME
                  LDA   #^STR_PATH
                  STA   ptrVOLNAME+2

L0BED             LDX   ptrVOLNAME
                  LDY   ptrVOLNAME+2
                  LDA   #$0000
                  JSL   FIND_VCR
                  BCS   L0C55
                  JSL   DEREF
                  STX   ptrVCR
                  STY   ptrVCR+2

                  LDY   #iVCR_FST
                  LDA   [ptrVCR],Y
                  CMP   #FST_RDOS33
                  BEQ   L0C27

L0C0C             LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  BEQ   L0C55
                  STZ   tmpDEVICE
                  JSR   checkVOLUME
                  LDA   #$0045
                  BCC   L0C21
                  BRL   L0CAF
L0C21             LDA   #$0057
                  BRL   L0CAF

* VCR found

L0C27             LDY   #iVCR_VTOC
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
L0C53             BRA   L0C0C
L0C55             STZ   ptrVCR
                  STZ   ptrVCR+2
                  STZ   tmpDEVICE

L0C5C             STZ   L0CB0
                  LDA   ptrVCR
                  ORA   ptrVCR+2
                  BEQ   L0C70
                  INC   L0CB0
                  LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  INC
                  STA   [ptrVCR],Y

L0C70             JSR   checkVOLUME
                  PHP
                  PHA
                  LDA   L0CB0
                  BEQ   L0C85

                  LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  DEC
                  STA   [ptrVCR],Y
                  STZ   L0CB0

L0C85             PLA
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
L0CA2             JSR   createVCR
                  BCS   L0CAF
L0CA7             LDY   #iVCR_DEVICEID
                  LDA   [ptrVCR],Y
                  STA   deviceNum
                  CLC
L0CAF             RTS

L0CB0             DW    $0000

*
* setPARAMETERS
* Return Parameters on the
* GS/OS class0/1 call buffer
*

setPARAMETERS     LDY   #$FFFE
                  LDX   fgNBPARAMS
L0CB8             INY
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
L0CC9             PLP
                  BCC   L0CB8
                  DEX
                  BNE   L0CB8
                  RTS

L0CD0             DW    $4000
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
L0CEA             DW    $4000
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
L0D1E             DW    $4000
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
L0D4E             DW    $4000
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

TS2BLOCK          STA   blockNum
                  STZ   blockNum+2
                  LDA   #FST_BLOCKSIZE
                  STA   blockSize
                  STA   requestCount
                  STZ   requestCount+2
                  LDA   #FST_RDOS33
                  STA   FSTNum
                  STZ   cachePriority       ; cachePointer
L0DAD             JSL   DEV_DISPATCHER
                  BCS   L0DB4
                  RTS
L0DB4             CMP   #$002E
                  BEQ   L0DAD
                  SEC
                  RTS

*
* getFILEOFFSET
* Return the address of
* the file entry in the VTOC
*

getFILEOFFSET     =     *

                  CMP   #$0011              ; we cannot exceed
                  BCS   L0DE0               ; 10 vtoc sectors
                  XBA
                  CPX   #$0008              ; no more than 8 entries in a sector
                  BCS   L0DE0
]lp               DEX
                  BMI   L0DD4
                  ADC   #$0020              ; next entry
                  BRA   ]lp

L0DD4             ADC   ptrVTOC             ; entry found...
                  STA   ptrFILENAME
                  LDA   ptrVTOC+2
                  ADC   #$0000
                  STA   ptrFILENAME+2
L0DE0             RTS

*
* isDELETEDFILE
*

isDELETEDFILE     =     *

                  LDA   [ptrFILENAME]
                  AND   #$00FF
                  BEQ   L0E0A
                  cmp   #$0080              ; File is deleted
                  BEQ   L0E0A

                  PHY
                  PHX
                  ldx   #$000C
                  ldy   #$0000
L0DF5             LDA   [ptrFILENAME],Y
                  CMP   #$A0A0              ; Empty file name ?
                  BNE   L0E06
                  INY
                  INY
                  DEX
                  BNE   L0DF5
                  LDA   #$00FF
                  BRA   L0E08

L0E06             LDA   [ptrFILENAME]       ; Get a non-zero value
L0E08             PLX
                  PLY
L0E0A             AND   #$00FF
                  RTS

*
* compareSTRING
*

compareSTRING     =     *

                  LDA   [ptrSTRING1]
                  CMP   [ptrSTRING2]
                  BNE   L0E2C
                  TAY
                  BPL   L0E1A
                  LDY   #$7FFF
L0E1A             INY
                  SEP   #$20
L0E1D             LDA   [ptrSTRING2],Y
                  AND   tmpMASK
                  CMP   [ptrSTRING1],Y
                  BNE   L0E2C
                  DEY
                  BPL   L0E1D
                  REP   #$21
                  RTS
L0E2C             SEC
                  REP   #$20
                  RTS

*
* CREATE VCR
*

createVCR         JSR   getVCR
                  BCC   L0E39
                  LDA   #$0057
                  RTS
L0E39             BEQ   L0E3E
                  BRL   L0EF6
L0E3E             JSR   checkVOLUME
                  BCC   L0E47
                  LDA   #$0045
                  RTS
L0E47             LDA   #$0014
                  LDX   ptrVOLNAME
                  LDY   ptrVOLNAME+2
                  JSL   ALLOC_VCR
                  BCC   L0E58
                  LDA   #$0054
                  RTS
L0E58             JSL   DEREF
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

L0E7C             STX   haSEGMENT
                  STY   haSEGMENT+2
L0E82             LDY   #iVCR_FST
                  LDA   #FST_RDOS33
                  STA   [ptrVCR],Y
                  LDY   #iVCR_BUSY
                  LDA   #$0000
                  STA   [ptrVCR],Y
                  LDY   #iVCR_DEVICEID
                  LDA   deviceNum
                  STA   [ptrVCR],Y
                  LDY   #iVCR_VTOC
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
L0ED1             PHA
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

L0EEC             LDA   tmpLENGTH
                  LDY   #iVCR_LENGTH
                  STA   [ptrVCR],Y
                  BRA   L0F10

L0EF6             LDY   #iVCR_VTOC
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
L0F10             CLC
                  RTS

*
* getVOLUMENAME
*

getVOLUMENAME     =     *

                  LDA   ptrSEGMENT
                  STA   bufferPtr
                  LDA   ptrSEGMENT+2
                  STA   bufferPtr+2
                  LDA   #$0002
                  STA   callNum
                  lda   #$0010              ; $0011
                  JSR   TS2BLOCK            ; Read T1/S0
                  BCC   L0F28
                  RTS

L0F28             ldy   #16
]lp               lda   [bufferPtr],y
                  cmp   RDOS_ID1,y
                  bne   L0F4B               ; L0F29
                  dey
                  bpl   ]lp
                  bmi   L0F7F

*L0F29 ldy #$28
* ldx #8
*]lp lda [bufferPtr],y
* cmp RDOS_ID2,x
* bne L0F4B
* dey
* dex
* bpl ]lp
* bmi L0F7F

L0F4B             SEC
                  LDA   #$0052
                  RTS

* Handle T1/S0

L0F7F             LDY   #$00FE              ; $01FE clear high-bit
                  LDA   #$0000
                  CLC
L0F86             EOR   [ptrSEGMENT],Y
                  ROR
                  BPL   L0F8E
                  EOR   #$7FFF
L0F8E             DEY
                  DEY
                  BPL   L0F86
                  STA   L1055               ; -> the magic number!

                  LDX   #$0000              ; Copy volume name
                  LDA   L1035,X
                  STA   shtVOLNAME
                  SEP   #$20
                  LDY   #$0002
L0FA2             LDA   (shtVOLNAME),Y
                  BEQ   L0FAE
                  STA   (ptrSPATH),Y
                  INY
                  CPY   #$000F
                  BNE   L0FA2

* MANAGE VOLUME VERSION

L0FAE             REP   #$20
                  STZ   L1059
                  STZ   L105B
                  LDA   L1055
                  AND   #$07FF
                  STA   L1057
L0FBF             SEC
                  SBC   #$03E8              ; 1000
                  BCC   L0FD6
                  STA   L1057
                  LDA   L1059
                  ADC   #$0000
                  STA   L1059
                  LDA   L1057
                  BRA   L0FBF
L0FD6             LDA   L1057
                  SEC
                  SBC   #$0064              ; 100
                  BCC   L0FED
                  STA   L1057
                  LDA   L1059
                  ADC   #$00FF
                  STA   L1059
                  BRA   L0FD6
L0FED             LDA   L1057
                  SEC
                  SBC   #$000A              ; 10
                  BCC   L1004
                  STA   L1057
                  LDA   L105B
                  ADC   #$0000
                  STA   L105B
                  BRA   L0FED
L1004             LDA   L1057
                  XBA
                  ADC   L105B
                  STA   L105B
                  LDA   L1059
                  ADC   #$3030
                  STA   (ptrSPATH),Y
                  INY
                  INY
                  LDA   L105B
                  ADC   #$3030
                  STA   (ptrSPATH),Y
                  INY
                  INY
                  LDA   #$0000
                  STA   (ptrSPATH),Y
                  DEY
                  DEY
                  TYA
                  STA   (ptrSPATH)
                  REP   #$31
                  LDA   #$8000
                  STA   errMAIN
                  RTS                       ; Now we have a beautiful version!

L1035             DA    L1035
                  ASC   'RDOS 3.3 v'00

RDOS_ID1          ASC   "RDOS 3.3 COPYRIGHT"
*RDOS_ID2 ASC "SYSTEMBOOT"

L1055             ds    2
L1057             ds    2
L1059             ds    2
L105B             ds    2

*
* RELEASE VCR
*

releaseVCR        LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  BEQ   L1066
                  SEC
                  RTS

L1066             LDY   #iVCR_ID
                  LDA   [ptrVCR],Y
                  JSL   RELEASE_VCR
                  CLC
                  RTS

*
* COMPARE VTOC
*

compareVTOC       LDY   #iVCR_VTOC
                  LDA   [ptrVCR],Y
                  TAX
                  INY
                  INY
                  LDA   [ptrVCR],Y
                  TAY
                  JSL   DEREF
                  STX   ptrVTOC2
                  STY   ptrVTOC2+2
                  ldy   #$00FE              ; $01FE
L1087             LDA   [ptrVTOC],Y
                  CMP   [ptrVTOC2],Y
                  BNE   L1093
                  DEY
                  DEY
                  BPL   L1087
                  CLC
                  RTS

L1093             SEC
                  RTS

*
* GET DEVICE ID
*

getDEVICEID       LDA   deviceNum
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
L10AF             RTS

*
* CHECK VOLUME
*

checkVOLUME       LDX   tmpDEVICE
                  BNE   L10E7
L10B5             INX
                  STX   deviceNum
                  JSR   getVOLUMENAME
                  BCC   L10C6
                  CMP   #$0011
                  BEQ   L1138

L10C2             LDX   deviceNum
                  BRA   L10B5

L10C6             LDA   ptrVOLNAME
                  STA   ptrSTRING1
                  LDA   ptrVOLNAME+2
                  STA   ptrSTRING1+2

                  LDA   ptrSPATH
                  STA   ptrSTRING2
                  LDA   #^STR_PATH
                  STA   ptrSTRING2+2
                  LDA   #$00FF
                  STA   tmpMASK
                  JSR   compareSTRING
                  BCC   L1136

                  STZ   errMAIN
                  BRA   L10C2

L10E7             STX   deviceNum
                  JSR   getDEVICEID
                  BCC   L10EF
                  RTS

L10EF             STA   theDEVICE
L10F2             JSR   getVOLUMENAME
                  BCC   L111A
                  CMP   #$0011
                  BNE   L10FE
L10FC             STZ   deviceNum
L10FE             LDX   deviceNum
                  INX
                  CPX   tmpDEVICE
                  BEQ   L1138
                  STX   deviceNum
                  JSR   getDEVICEID
                  BCC   L1113
                  CMP   #$0011
                  BEQ   L10FC
                  RTS

L1113             CMP   theDEVICE
                  BEQ   L10F2
                  BRA   L10FE
L111A             LDA   ptrVOLNAME
                  STA   ptrSTRING1
                  LDA   ptrVOLNAME+2
                  STA   ptrSTRING1+2
                  LDA   ptrSPATH
                  STA   ptrSTRING2
                  LDA   #^STR_PATH
                  STA   ptrSTRING2+2
                  LDA   #$00FF
                  STA   tmpMASK
                  JSR   compareSTRING
                  BCS   L10FE
L1136             CLC
                  RTS

L1138             LDA   #$0045
                  SEC
                  RTS

theDEVICE         ds    2

*
* CHECK FCR
*

checkFCR          STZ   workFCR
                  STZ   tmpFCR
L1145             INC   tmpFCR
                  LDA   tmpFCR
                  JSL   GET_FCR
                  BCS   L11CB
                  JSL   DEREF
                  STX   ptrFCR2
                  STY   ptrFCR2+2
                  LDY   #iFCR_FST
                  LDA   [ptrFCR2],Y
                  CMP   #FST_RDOS33
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
L1191             INY
                  LDA   [ptrVTOC2],Y
                  CMP   #$3A
                  BNE   L1191
                  LDX   #$0001
L119B             INY
                  INX
                  LDA   [ptrVTOC2],Y
                  STA   STR_GSOS,X
                  BNE   L119B
                  REP   #$30
                  TXA
                  DEC
                  DEC
                  STA   STR_GSOS
                  LDX   #STR_GSOS
                  LDY   #^STR_GSOS
                  STX   ptrSTRING2
                  STY   ptrSTRING2+2
                  LDA   shtFILENAME
                  STA   ptrSTRING1
                  LDA   #^STR_FILE
                  STA   ptrSTRING1+2
                  JSR   compareSTRING
                  BCS   L1145
                  LDA   tmpFCR
                  STA   workFCR
                  CLC
L11CB             RTS

*
*
*

L11CC             LDA   $42
                  AND   #$4000
                  BNE   L11E5

L11D3             REP   #$30
                  LDA   #$0000
                  LDY   #$0001
                  STA   [ptrVOLNAME],Y
                  STA   (shtFILENAME),Y
                  STA   [ptrVOLNAME]
                  STA   (shtFILENAME)
                  CLC
                  RTS

L11E5             SEP   #$20
                  LDY   #$0002
                  LDA   [virtualFCR],Y
                  BEQ   L11D3
                  CMP   #$3A                ; :
                  BNE   L1236
L11F2             INY
                  LDA   [virtualFCR],Y
                  BEQ   L1204
                  CMP   #$3A                ; :
                  BEQ   L1204
                  DEY
                  STA   [ptrVOLNAME],Y
                  INY
                  CPY   #$0017              ; 17=15+2 = VOLUMENAME MAX LENGTH
                  BCC   L11F2
L1204             DEY
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

L1223             LDA   $42
                  AND   #$0040
                  BNE   L122E
                  CLC
                  RTS

L122C             SEC
                  RTS

L122E             LDA   $46
                  BEQ   L122C
                  CMP   #$001F
                  RTS

L1236             DEY
L1237             LDX   #$0002              ; 2
                  STX   L1272
                  SEP   #$20
L123F             INY
                  LDA   [virtualFCR],Y
                  BEQ   L1260
                  CMP   #$3A
                  BEQ   L126E
                  TYX
                  LDY   L1272
                  CMP   #$2C
                  BNE   L1252
                  LDA   #$3A
L1252             STA   (shtFILENAME),Y
                  INY
                  CPY   #$001A              ; 1A=18+2, WAS 22
                  BCS   L126E               ; IS MAX FILENAME LENGTH
                  STY   L1272
                  TXY
                  BRA   L123F
L1260             LDY   L1272
                  STA   (shtFILENAME),Y
                  REP   #$20
                  TYA
                  DEC
                  DEC
                  STA   (shtFILENAME)
                  BRA   L1223
L126E             REP   #$20
                  SEC
                  RTS

L1272             ds    2

*
* READ VTOC
*

readVTOC          lda   ptrVTOC             ; T1/S0
                  sta   bufferPtr
                  lda   ptrVTOC+2
                  sta   bufferPtr+2

                  ldx   #vtocSTART          ; Read 16 sectors
                  stx   vtocTS              ; from 1/0 to 1/F max

]lp               lda   #$0002
                  sta   callNum

                  txa
                  jsr   TS2BLOCK
                  bcc   L1472
                  rts

L1472             ldy   #0                  ; check if end of catalog
                  lda   [bufferPtr],Y
                  beq   L1499

                  lda   bufferPtr
                  adc   #FST_BLOCKSIZE
                  sta   bufferPtr
                  lda   bufferPtr+2
                  adc   #$0000
                  sta   bufferPtr+2

L1494             inc   vtocTS
                  ldx   vtocTS
                  cpx   #vtocEND            ; until block $20
                  bne   ]lp

L1499             lda   vtocTS              ; nb sectors read
                  sec
                  sbc   #vtocSTART
                  sta   tmpLENGTH
                  clc
                  rts

vtocTS            ds    2

*
* compareFileName
*

compareFILENAME   =     *

                  LDA   shtFILENAME
                  STA   ptrSTRING1
                  LDA   #^STR_FILE
                  STA   ptrSTRING1+2

                  LDA   #$0000
L14B3             LDX   #$0000
L14B6             STA   vtocINDEX
                  STX   fileINDEX
                  JSR   getFILEOFFSET
                  BCC   L14C2
                  RTS

L14C2             JSR   isDELETEDFILE
                  BEQ   L1515
                  CMP   #$00FF
                  BEQ   L1503

                  ldy   #$16
]lp               lda   [ptrFILENAME],y
                  sta   stringBUFFER+2,y
                  dey
                  bpl   ]lp

                  LDA   #stringBUFFER
                  STA   ptrSTRING2
                  LDA   #^stringBUFFER
                  STA   ptrSTRING2+2

                  LDY   #$0019              ; 16 $001F
                  SEP   #$20
L14E2             LDA   [ptrSTRING2],Y
                  CMP   #$A0                ; space
                  BNE   L14F0
                  DEY
                  BPL   L14E2
                  REP   #$30
                  SEC
                  RTS

                  MX    %10
L14F0             DEY
                  LDA   #$7F
                  STA   tmpMASK
                  REP   #$20
                  TYA
                  STA   [ptrSTRING2]
                  JSR   compareSTRING
                  BCC   L151D

L1503             LDX   fileINDEX
                  LDA   vtocINDEX
                  INX
                  CPX   #$0008              ;7
                  BCC   L14B6
                  INC
                  CMP   tmpLENGTH
                  BCC   L14B3
L1515             LDA   #$FFFF
                  STA   fileINDEX
                  CLC
                  RTS
L151D             CLC
                  RTS

stringBUFFER      ds    32

*
* Set OptionList
*

setOPTIONLIST     LDA   [ptrParamBlock],Y
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

L1536             LDA   #FST_RDOS33         ; Y=2 MUST BE 2
                  TAY                       ; Y=4 MUST BE FST_RDOS33
                  STA   [gsosOUTPUT],Y
                  INY
                  INY
                  STA   [gsosOUTPUT],Y
L1540             CLC
                  RTS

*
* FSTSPECIFIC: OPTION 1
*

specific1         LDA   fgNBPARAMS
                  CMP   #$0003
                  BEQ   L154F
                  LDA   #$0004
                  SEC
                  RTS

L154F             LDY   #$0006
                  LDA   [ptrParamBlock],Y
                  CMP   #$0002              ; legal values are 0 or 1
                  BCC   L155E
                  LDA   #$0053
                  SEC
                  RTS

L155E             STA   textMODE
                  LDA   #$0000
                  CLC
                  RTS

*
* FSTSPECIFIC: OPTION 2
*

specific2         LDA   fgNBPARAMS
                  CMP   #$0003
                  BEQ   L1573
                  LDA   #$0004
                  SEC
                  RTS

L1573             LDA   textMODE
                  LDY   #$0006
                  STA   [ptrParamBlock],Y
                  LDA   #$0000
                  CLC
                  RTS

*
* GET ORIGINAL FILE INFORMATION
*

getORIGINAL       LDA   #$0001
                  STA   intSTORAGE

                  lda   #$c3
                  sta   intACCESS

                  ldy   #$0018
                  lda   [ptrFILENAME],Y
                  and   #$00ff

                  ldx   #$04                ; TXT
                  cmp   #"T"
                  beq   gotTYPE
                  ldx   #$06                ; BIN
                  cmp   #"B"
                  beq   gotTYPE
                  ldx   #$fc                ; BAS
                  cmp   #"A"
                  beq   gotTYPE

                  ldx   #0
                  txa

gotTYPE           stx   intFILETYPE
                  sta   intOFILETYPE

                  ldy   #$19
                  lda   [ptrFILENAME],y
                  and   #$ff
                  sta   intNBSEC

                  iny
                  lda   [ptrFILENAME],y
                  sta   intAUXTYPE

                  iny
                  iny
                  lda   [ptrFILENAME],y
                  sta   curEOF
                  stz   curEOF+2

                  iny
                  iny
                  lda   [ptrFILENAME],y
                  sta   startBLOCK

                  clc
                  rts

*
* HANDLE THE GetDirEntry GS/OS CALL
* on entry A = class type
*

doGETDIRENTRY     =     *

                  LDY   #iVCR_DEVICEID
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

L1620             LDA   fgCLASS
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

L1644             LDY   #$0004              ; base
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

L166A             LDA   theBASE
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

L1680             LDY   #iFCR_TS            ; base = 0
                  LDA   [ptrFCR],Y
                  STA   theENTRY
                  LDA   #$0000              ; set the new displacement
                  LDY   #iFCR_VTOCINDEX
                  STA   [ptrFCR],Y
                  BRL   L17E3

L1693             LDY   #iFCR_TS
                  LDA   [ptrFCR],Y
                  CMP   theDISPLACEMENT
                  BCS   L16A2
                  LDA   #$0061
                  SEC
                  RTS

L16A2             LDA   theDISPLACEMENT
                  STA   theENTRY
                  BRA   L16E7

L16AA             LDY   #iFCR_VTOCINDEX     ; base = 1
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

L16C5             LDY   #iFCR_VTOCINDEX     ; base = 2
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
L16E2             LDA   #$0061
                  SEC
                  RTS

L16E7             LDA   theENTRY            ; set it as the new ref
                  LDY   #iFCR_VTOCINDEX
                  STA   [ptrFCR],Y
                  STA   theENTRY2

                  LDY   #iVCR_VTOC
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
L1708             LDX   #$0000              ; from the beginning of the VTOC

L170B             STA   vtocINDEX
                  STX   fileINDEX
                  JSR   getFILEOFFSET
                  BCC   L1717
                  RTS

L1717             JSR   isDELETEDFILE
                  BNE   L1721

                  LDA   #$8061
                  SEC
                  RTS

L1721             CMP   #$00FF              ; is file deleted?
                  BEQ   L172B
                  DEC   theENTRY2
                  BEQ   L173D

L172B             LDX   fileINDEX
                  LDA   vtocINDEX
                  INX
                  cpx   #$0008              ; next entry in the same sector
                  BCC   L170B
                  INC
                  CMP   tmpLENGTH
                  BCC   L1708

L173D             LDY   #iVCR_NAME
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

L1761             LDY   #iVCR_DEVICEID
                  LDA   [ptrVCR],Y          ; are we on the same device?
                  CMP   deviceNum
                  BEQ   L1771
                  LDY   #iVCR_DEVICEID
                  LDA   deviceNum           ; no update
                  STA   [ptrVCR],Y

L1771             JSR   getORIGINAL
                  BCC   L177A

                  LDA   #$0051
                  RTS

L177A             SEP   #$20                ; get the real file name length
                  ldy   #$0017
]lp               LDA   [ptrFILENAME],Y
                  CMP   #$A0                ; LEN(HELLO)=5
                  BNE   L1788
                  DEY
                  BNE   ]lp
L1788             REP   #$21                ; offset Y = 4
                  INY                       ; +1
                  STY   fnLEN               ; length is 5
                  TYA
* SBC #$0002 ; -2 = 3
                  STA   outFLEN             ; the length of the output
                  INC                       ; is a word
                  INC
                  INC
                  TAY                       ; 6
                  LDA   [gsosOUTPUT]
                  STA   outLEN              ; compare with the GSOS output buffer
                  CPY   outLEN              ; len file name < len buffer
                  BCC   L17A9

                  LDA   #$004F
                  STA   errGETDIR

L17A9             ldy   #-1                 ; $0002
                  LDA   #$0003
                  STA   outIND
                  SEP   #$20

]lp               INY
                  CPY   fnLEN
                  BEQ   L17D9

                  LDX   outIND              ; on the filename
                  INX
                  CPX   outLEN
                  BEQ   L17D9
                  STX   outIND

                  LDA   [ptrFILENAME],Y
                  TYX
                  LDY   outIND              ; replace
                  AND   #$7F
                  CMP   #$3A                ; :
                  BNE   L17D4               ; with
                  LDA   #$2C                ; /
L17D4             STA   [gsosOUTPUT],Y
                  TXY
                  BRA   ]lp

L17D9             REP   #$21
                  LDA   outFLEN
                  LDY   #$0002
                  STA   [gsosOUTPUT],Y

*

L17E3             LDA   fgCLASS
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

L1800             LDA   #$0000              ; flags
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

L1826             LDA   errGETDIR
                  CMP   #$0001
                  RTS

fnLEN             ds    2
outIND            ds    2
errGETDIR         ds    2
theBASE           ds    2
theDISPLACEMENT   ds    2
theENTRY2         ds    2
outFLEN           ds    2
outLEN            ds    2

*
* READ
*

doREAD            STZ   errREAD
                  STZ   tmpTRANSFERCOUNT
                  STZ   tmpTRANSFERCOUNT+2
                  STZ   transINDEX

                  LDY   #iFCR_EOF
                  LDA   [ptrFCR],Y
                  STA   curEOF
                  INY
                  INY
                  LDA   [ptrFCR],Y
                  STA   curEOF+2
                  LDY   #iFCR_MARK
                  LDA   [ptrFCR],Y
                  STA   curMARK
                  INY
                  INY
                  LDA   [ptrFCR],Y
                  STA   curMARK+2
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

L1979             LDY   #$0006
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

L1995             LDA   curMARK             ; did we reach EOF?
                  CMP   curEOF
                  BNE   L19AE
                  LDA   curMARK+2
                  CMP   curEOF+2
                  BNE   L19AE
                  LDA   #$004C              ; YES
                  STA   errREAD
                  BRL   L1D6E

L19AE             LDA   curMARK             ; calculate new mark
                  CLC                       ; depending on requestCount
                  ADC   tmpREQUESTCOUNT
                  STA   newMARK
                  LDA   curMARK+2
                  ADC   tmpREQUESTCOUNT+2
                  BCS   L19D2
                  STA   newMARK+2
                  CMP   curEOF+2
                  BCC   L19DE
                  BNE   L19D2
                  LDA   curEOF
                  CMP   newMARK
                  BCS   L19DE

L19D2             LDA   curEOF+2            ; end reached
                  STA   newMARK+2           ; new mark = current eof
                  LDA   curEOF
                  STA   newMARK

L19DE             LDA   newMARK             ; calculate number of
                  SEC                       ; bytes to transfer
                  SBC   curMARK             ;
                  STA   nbTOTRANSFER
                  LDA   newMARK+2
                  SBC   curMARK+2
                  STA   nbTOTRANSFER+2

                  LDA   curMARK             ; start the process ;-)
                  STA   workMARK
                  LDA   curMARK+2
                  STA   workMARK+2

                  LDY   #iFCR_TYPE
                  LDA   [ptrFCR],Y
                  CMP   #rootDIR
                  BNE   L1A11
                  BRL   L1C91

* READ FILE

L1A11             LDY   #iVCR_DEVICEID
                  LDA   [ptrVCR],Y
                  STA   deviceNum
                  LDA   #$0002
                  STA   callNum

L1A1D             LDA   workMARK
                  XBA
                  AND   #$00FF

                  pha
                  ldy   #iFCR_TS
                  lda   [ptrFCR],y
                  clc
                  adc   1,s
                  sta   1,s
                  pla
                  sta   tmpTS

L1A3C             LDA   ptrGSOSBUFFER
                  STA   bufferPtr
                  LDA   ptrGSOSBUFFER+2
                  STA   bufferPtr+2

                  LDA   workMARK            ; are we at the beginning
                  AND   #$00FF              ; of the file?
                  BNE   L1AB6

                  LDA   nbTOTRANSFER
                  CMP   #$0101              ; and <= $100 bytes
                  BCC   L1AB6               ; to read?

                  LDA   gsosOUTPUT          ; yep do that one shot
                  STA   bufferPtr
                  LDA   gsosOUTPUT+2
                  STA   bufferPtr+2
                  LDA   tmpTS
                  JSR   TS2BLOCK
                  BCC   L1AAD
                  RTS

L1AAD             LDA   #FST_BLOCKSIZE
                  STA   transINDEX
                  BRL   L1B9F

L1AB6             LDA   ptrGSOSBUFFER
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

L1ACE             =     *

*
* Move loaded data to buffer
*

L1AD6             LDA   workMARK            ; on a block
                  AND   #$00FF              ; where shall we begin at?
                  STA   startINDEX
                  LDY   nbTOTRANSFER+2
                  BNE   L1AED
                  CLC                       ; handle case <$10000 bytes
                  ADC   nbTOTRANSFER
                  CMP   #$0101              ; more than a block ?
                  BCC   L1AF0
L1AED             LDA   #FST_BLOCKSIZE
L1AF0             STA   tmpBLOCKSIZE
                  SEC
                  SBC   startINDEX
                  STA   nbINDEX

                  LDA   startINDEX
                  CLC
                  ADC   #FST_BLOCKSIZE
                  ADC   ptrGSOSBUFFER
                  STA   ptrVTOC2
                  LDA   ptrGSOSBUFFER+2
                  ADC   #$0000
                  STA   ptrVTOC2+2

                  LDA   nbINDEX
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
L1B2A             INC   gsosOUTPUT
                  BNE   L1B30
                  INC   gsosOUTPUT+2
L1B30             TXA
                  DEC
                  BMI   L1B3E
                  ASL
                  TAY
L1B36             LDA   [ptrVTOC2],Y
                  STA   [gsosOUTPUT],Y
                  DEY
                  DEY
                  BPL   L1B36
L1B3E             LDA   nbINDEX
                  STA   transINDEX
                  LSR
                  BCC   L1B9F
                  LDA   gsosOUTPUT
                  BNE   L1B4D
                  DEC   gsosOUTPUT+2
L1B4D             DEC   gsosOUTPUT
                  BRA   L1B9F

L1B51             PEI   ptrVTOC2+2
                  PEI   ptrVTOC2
                  PEI   gsosOUTPUT+2
                  PEI   gsosOUTPUT
                  PEA   $0000
                  LDA   nbINDEX
                  PHA
                  PEA   $0805
                  JSL   MOVE_INFO
                  BCC   L1B6D
                  LDA   #$8000
                  RTS
L1B6D             LDA   nbINDEX
                  STA   transINDEX

L1B9F             LDA   transINDEX
                  CLC
                  ADC   tmpTRANSFERCOUNT
                  STA   tmpTRANSFERCOUNT
                  BCC   L1BAE
                  INC   tmpTRANSFERCOUNT+2
L1BAE             LDA   nbTOTRANSFER
                  SEC
                  SBC   transINDEX
                  STA   nbTOTRANSFER
                  BCS   L1BBD
                  DEC   nbTOTRANSFER+2
L1BBD             LDA   nbTOTRANSFER
                  ORA   nbTOTRANSFER+2
                  BNE   L1BF5
                  BRL   L1CEF

L1BF5             LDA   transINDEX
                  TAX
                  CLC
                  ADC   workMARK
                  STA   workMARK
                  BCC   L1C05
                  INC   workMARK+2
L1C05             TXA
                  CLC
                  ADC   gsosOUTPUT
                  STA   gsosOUTPUT
                  BCC   L1C0F
                  INC   gsosOUTPUT+2
L1C0F             BRL   L1A1D               ; LOOP LOOP

*
* Handle root directory
*

L1C91             =     *

L1CBB             LDA   curMARK
                  CLC
                  ADC   ptrGSOSBUFFER
                  TAX
                  LDA   curMARK+2
                  ADC   ptrGSOSBUFFER+2
                  PHA
                  PHX
                  PEI   gsosOUTPUT+2
                  PEI   gsosOUTPUT
                  PEA   $0000
                  LDA   nbTOTRANSFER
                  PHA
                  PEA   $0805
                  JSL   MOVE_INFO
                  BCC   L1CE1
                  LDA   #$8000
                  RTS

L1CE1             LDA   nbTOTRANSFER
                  STA   tmpTRANSFERCOUNT
                  LDA   nbTOTRANSFER+2
                  STA   tmpTRANSFERCOUNT+2
                  BRA   L1D5A

*

L1CEF             LDY   #iFCR_OTYPE
                  LDA   [ptrFCR],Y
                  and   #$ff
                  cmp   #"T"
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

L1D22             LDY   #$0002
                  LDA   [ptrParamBlock],Y
                  STA   gsosOUTPUT
                  INY
                  INY
                  LDA   [ptrParamBlock],Y
                  STA   gsosOUTPUT+2

* mask values !

L1D2F             LDY   tmpTRANSFERCOUNT+2
                  INY
                  LDX   tmpTRANSFERCOUNT
                  BNE   L1D3F
                  DEY
                  TXA
                  ORA   tmpTRANSFERCOUNT+2
                  BEQ   L1D58
L1D3F             STY   $C4
                  LDY   #$0000
                  SEP   #$20
L1D46             LDA   [gsosOUTPUT],Y
                  AND   #$7F
                  STA   [gsosOUTPUT],Y
                  INY
                  BNE   L1D51
                  INC   gsosOUTPUT+2
L1D51             DEX
                  BNE   L1D46
                  DEC   $C4
                  BNE   L1D46
L1D58             REP   #$20

*

L1D5A             LDY   #iFCR_MARK          ; update the mark
                  LDA   [ptrFCR],Y
                  CLC
                  ADC   tmpTRANSFERCOUNT
                  STA   [ptrFCR],Y
                  INY
                  INY
                  LDA   [ptrFCR],Y
                  ADC   tmpTRANSFERCOUNT+2
                  STA   [ptrFCR],Y

L1D6E             ldy   #$000c
                  lda   fgCLASS
                  bne   L1D7B
                  ldy   #$000a
L1D7B             LDA   tmpTRANSFERCOUNT
                  STA   [ptrParamBlock],Y
                  LDA   tmpTRANSFERCOUNT+2
                  INY
                  INY
                  STA   [ptrParamBlock],Y
                  LDA   errREAD
                  CMP   #$0001
                  RTS

errREAD           DW    $0000

*
* CHECK DATA FORK
*

checkDATAFORK     =     *

                  LDA   fgCLASS
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
L1DAD             LDA   fgNBPARAMS
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
L1DC7             LDA   #$0063
L1DCA             SEC
L1DCB             RTS

*
* CALLED BY OPEN
*

doOPEN            STZ   errVOLUME
                  JSR   matchVCR
                  BCC   L1DD7
                  BRL   L20FA

L1DD7             LDA   (shtFILENAME)
                  BEQ   L1DDE
                  BRL   L1ED4

* Create a FCR for the VCR

L1DDE             JSR   checkDATAFORK
                  BCC   L1DE6
                  BRL   L20FA

L1DE6             LDA   STR_PATH
                  INC
                  STA   STR_GSOS
                  SEP   #$20
                  LDA   #$3A                ; :
                  LDY   #$0002
                  STA   STR_GSOS,Y
]lp               LDA   STR_PATH,Y
                  CMP   #$01                ; so that 0 exits!
                  INY
                  STA   STR_GSOS,Y
                  BCS   ]lp

                  REP   #$20
                  LDX   #STR_GSOS
                  LDY   #^STR_GSOS
                  LDA   #$0032
                  JSL   ALLOC_FCR
                  BCC   L1E16
                  BRL   L20FA
L1E16             JSL   DEREF
                  STX   ptrFCR
                  STY   ptrFCR+2

                  LDA   #$4000
                  TSB   errVOLUME

                  LDY   #iFCR_FST
                  LDA   #FST_RDOS33
                  STA   [ptrFCR],Y
                  LDY   #iVCR_ID
                  LDA   [ptrVCR],Y
                  LDY   #iFCR_VCR
                  STA   [ptrFCR],Y
                  LDY   #iVCR_VTOC
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
                  LDY   #iFCR_VTOCINDEX
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
L1E8E             LDX   #$0000
L1E91             STA   vtocINDEX
                  STX   fileINDEX
                  JSR   getFILEOFFSET
                  BCC   L1E9F
                  BRL   L20FA

L1E9F             JSR   isDELETEDFILE
                  BEQ   L1EBE
                  CMP   #$00FF
                  BEQ   L1EAC
                  INC   intENTRYNB
L1EAC             LDX   fileINDEX
                  LDA   vtocINDEX
                  INX
                  CPX   #$0008              ; $0007
                  BCC   L1E91
                  INC
                  CMP   tmpLENGTH
                  BCC   L1E8E
L1EBE             LDA   intENTRYNB
                  LDY   #iFCR_TS
                  STA   [ptrFCR],Y
                  LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  INC
                  BNE   L1ECF
                  INC
L1ECF             STA   [ptrVCR],Y
                  BRL   L2033

* Create a FCR for a filename !

L1ED4             JSR   compareFILENAME
                  BCC   L1EDF
                  LDA   #$0051
                  BRL   L20FA
L1EDF             LDA   fileINDEX
                  BPL   L1EEA
                  LDA   #$0046
                  BRL   L20FA
L1EEA             JSR   checkDATAFORK
                  BCC   L1EF2
                  BRL   L20FA
L1EF2             LDA   STR_PATH
                  INC
                  STA   STR_GSOS
                  SEP   #$20
                  LDA   #$3A
                  LDY   #$0002
                  STA   STR_GSOS,Y
L1F03             LDA   STR_PATH,Y
                  CMP   #$01
                  INY
                  STA   STR_GSOS,Y
                  BCS   L1F03
                  REP   #$20
                  LDX   #STR_GSOS
                  LDY   #^STR_GSOS
                  LDA   #$0032
                  JSL   ALLOC_FCR
                  BCC   L1F25
                  LDA   #$0054
                  BRL   L20FA
L1F25             JSL   DEREF
                  STX   ptrFCR
                  STY   ptrFCR+2

                  LDA   #$4000
                  TSB   errVOLUME
                  LDA   #$0200
                  JSL   ALLOC_SEG
                  BCC   L1F42
                  LDA   #$0054
                  BRL   L20FA
L1F42             TYA
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
L1F56             STA   [ptrVCR],Y
                  LDA   #$0000
                  LDY   #iFCR_MARK
                  STA   [ptrFCR],Y
                  INY
                  INY
                  STA   [ptrFCR],Y
                  LDY   #iFCR_FILEINDEX
                  LDA   fileINDEX
                  STA   [ptrFCR],Y
                  LDY   #iFCR_VTOCINDEX
                  LDA   vtocINDEX
                  STA   [ptrFCR],Y
                  LDY   #iFCR_FST
                  LDA   #FST_RDOS33
                  STA   [ptrFCR],Y
                  LDY   #iVCR_ID
                  LDA   [ptrVCR],Y
                  LDY   #iFCR_VCR
                  STA   [ptrFCR],Y

                  ldy   #$0018
                  LDA   [ptrFILENAME],Y
                  and   #$00ff              ; was $7F !
                  LDY   #iFCR_OTYPE
                  STA   [ptrFCR],Y

L1FC3             LDY   #iFCR_SEG2
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

                  LDY   #iFCR_FILEINDEX
                  LDA   [ptrFCR],Y
                  TAX
                  LDY   #iFCR_VTOCINDEX
                  LDA   [ptrFCR],Y
                  JSR   getFILEOFFSET
                  JSR   getORIGINAL
                  BCC   L1FF5
                  BRL   L20FA

L1FF5             LDY   #iFCR_TS
                  LDA   startBLOCK
                  STA   [ptrFCR],Y
                  LDY   #iFCR_ACCESS
                  LDA   intACCESS
                  STA   [ptrFCR],Y
                  LDY   #iFCR_EOF
                  LDA   curEOF
                  STA   [ptrFCR],Y
                  LDA   curEOF+2
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

L2033             LDA   fgCLASS
                  BNE   L203B
                  BRL   L20C3
L203B             LDA   fgNBPARAMS
                  TAX
                  LDY   #$FFFE
L2042             INY
                  INY
                  LDA   tblOPEN,Y
                  ASL
                  BCC   L204D
                  DEX
                  BMI   L205B
L204D             ASL
                  BCS   L2042
                  LSR
                  LSR
                  PHY
                  TAY
                  LDA   [ptrFCR],Y
                  PLY
                  STA   [ptrParamBlock],Y
                  BRA   L2042
L205B             LDX   fgNBPARAMS
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
L207D             LDY   #$0014
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
L20C3             LDY   #iFCR_ID
                  LDA   [ptrFCR],Y
                  LDY   #$0000
                  STA   [ptrParamBlock],Y
L20CD             LDA   fgNBPARAMS
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
L20F5             CLC
                  LDA   #$0000
                  RTS

* Handle error

L20FA             PHA
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

L211E             LDY   #iFCR_ID
                  LDA   [ptrFCR],Y
                  JSL   RELEASE_FCR
                  LDY   #iVCR_BUSY
                  LDA   [ptrVCR],Y
                  BEQ   L2135
                  INC
                  BEQ   L2133
                  DEC
                  DEC
L2133             STA   [ptrVCR],Y
L2135             PLP
                  BPL   L2149
                  LDY   #iVCR_BUSY
                  LDA   #$0000
                  STA   [ptrVCR],Y
                  LDY   #iVCR_ID
                  LDA   [ptrVCR],Y
                  JSL   RELEASE_VCR
L2149             PLA
                  SEC
                  RTS

*L214C HEX 18E4FC00

tblOPEN           DW    $4000
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
L2188             DW    $0000
L218A             DW    $0000

