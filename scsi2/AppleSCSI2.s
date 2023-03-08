*
* Apple SCSI-2
*
* (c) 2018, Brutal Deluxe Software
* Antoine Vignau & Olivier Zardini
* Visit http://www.brutaldeluxe.fr/
*

                  xc
                  xc
                  mx    %00
                  rel
                  typ   DRV
                  dsk   AppleSCSI2.l
                  lst   off

*----------------------------

DECBUSYFLG  EQU   $E10068
GSOS        EQU   $E100A8

                  use   4/Int.Macs
                  use   4/Media.Macs
                  use   4/Mem.Macs
                  use   4/Util.Macs

mcInChapters      =     1
mcInFrames        =     2
mcInTime          =     3

mcSDeviceType     =     0
mcSPlayStatus     =     1
mcSDoorStatus     =     2
mcSDiscType       =     3
mcSDiscSize       =     4
mcSDiscSide       =     5
mcSVolumeL        =     6
mcSVolumeR        =     7

mcSUnknown        =     0

mcSLaserDisc      =     1
mcSCDAudio        =     2
mcSLaserCD        =     3
mcSVCR            =     4
mcSCamCorder      =     5

mcSPlaying        =     1
mcSStill          =     2
mcSParked         =     3

mcSDoorOpen       =     1
mcSDoorclosed     =     2

mcS_CLV           =     1
mcS_CAV           =     2
mcS_CDV           =     3
mcS_CD            =     4

mcSDisc3inch      =     3
mcSDisc5inch      =     5
mcSDisc8inch      =     8
mcSDisc12inch     =     12

mcSSideOne        =     1
mcSSideTwo        =     2

mcCInit           =     1                 ; init
mcCEject          =     2                 ; eject
mcCDisplayOn      =     5                 ; turn video position display on
mcCDisplayOff     =     6                 ; turn video position display off
mcCLockDev        =     9                 ; lock
mcCUnLockDev      =     10                ; unlock

AudioOff          =     0                 ;
AudioRight        =     1                 ;
AudioLinR         =     2                 ;
AudioMinR         =     3
AudioRinL         =     4                 ;
AudioRinLR        =     5                 ;
AudioReverse      =     6                 ;
AudioRinLMR       =     7
AudioLeft         =     8                 ;
AudioStereo       =     9                 ;
AudioLinLR        =     10
AudioLinLMR       =     11
AudioMinL         =     12
AudioMinLRinR     =     13
AudioMinLLinR     =     14
AudioMonaural     =     15

mcUnImp           =     $2601
mcBadAudio        =     $2606
mcBadSelector     =     $2609
mcInvalidPort     =     $260b
mcInvalidParam    =     $2612

*----------------------------

                  dw    $0000
                  dw    $001B
                  jmp   EntryStuff

                  dw    $0100
                  str   'AppleSCSI2'

L0013             ADRL  MCGetName
                  ADRL  MCDStartUp
                  ADRL  MCDShutDown
                  ADRL  MCGetFeatures
                  ADRL  MCPlay
                  ADRL  MCPause
                  ADRL  MCSendRawData
                  ADRL  MCGetStatus
                  ADRL  MCControl
                  ADRL  MCScan
                  ADRL  MCGetSpeeds
                  ADRL  MCSpeed
                  ADRL  MCStopAt
                  ADRL  MCJogN
                  ADRL  MCSearchTo
                  ADRL  MCSearchDone
                  ADRL  MCSearchWait
                  ADRL  MCGetPosition
                  ADRL  MCSetAudio
                  ADRL  MCGetTimes
                  ADRL  MCGetDiscTOC
                  ADRL  MCGetDiscID
                  ADRL  MCGetNoTracks
                  ADRL  MCRecord
                  ADRL  MCStop
                  ADRL  MCWaitRawData
                  ADRL  MCSetVolume

*----------------------------

EntryStuff        PHD
                  PHB
                  PHK
                  PLB
                  TSC
                  SEC
                  SBC   #$000A
                  TCS
                  INC
                  TCD
                  JMP   (L0013,X)

exit20            TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $26,S
                  LDA   $10,S
                  STA   $24,S
                  LDA   $0E,S
                  STA   $22,S
                  TSC
                  CLC
                  ADC   #$0014
                  TCS
                  BRL   Exit0x

Exit16            TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $22,S
                  LDA   $10,S
                  STA   $20,S
                  LDA   $0E,S
                  STA   $1E,S
                  TSC
                  CLC
                  ADC   #$0010
                  TCS
                  BRL   Exit0x

Exit14            TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $20,S
                  LDA   $10,S
                  STA   $1E,S
                  LDA   $0E,S
                  STA   $1C,S
                  TSC
                  CLC
                  ADC   #$000E
                  TCS
                  BRL   Exit0x

Exit12            TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $1E,S
                  LDA   $10,S
                  STA   $1C,S
                  LDA   $0E,S
                  STA   $1A,S
                  TSC
                  CLC
                  ADC   #$000C
                  TCS
                  BRL   Exit0x

Exit10            TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $1C,S
                  LDA   $10,S
                  STA   $1A,S
                  LDA   $0E,S
                  STA   $18,S
                  PLA
                  PLA
                  PLA
                  PLA
                  PLA
                  BRL   Exit0x

Exit8             TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $1A,S
                  LDA   $10,S
                  STA   $18,S
                  LDA   $0E,S
                  STA   $16,S
                  PLA
                  PLA
                  PLA
                  PLA
                  BRL   Exit0x

Exit6             TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $18,S
                  LDA   $10,S
                  STA   $16,S
                  LDA   $0E,S
                  STA   $14,S
                  PLA
                  PLA
                  PLA
                  BRL   Exit0x

Exit4             TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $16,S
                  LDA   $10,S
                  STA   $14,S
                  LDA   $0E,S
                  STA   $12,S
                  PLA
                  PLA
                  BRA   Exit0x

Exit2             TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD
                  LDA   $12,S
                  STA   $14,S
                  LDA   $10,S
                  STA   $12,S
                  LDA   $0E,S
                  STA   $10,S
                  PLA
                  BRA   Exit0x

Exit0             TAX
                  LDA   $0A,S
                  PHA
                  PLB
                  PLB
                  LDA   $0C,S
                  TCD

Exit0x            TSC
                  CLC
                  ADC   #$000D
                  TCS
                  TXA
                  PHA
                  JSL   DECBUSYFLG
                  PLA
                  CMP   #$0001
                  RTL

*----------------------------

MCGetName
                  PEA   ^DriverNamStr
                  PEA   DriverNamStr
                  LDA   $1A,S
                  PHA
                  LDA   $1A,S
                  PHA
                  LDA   #$0000
                  PHA
                  LDA   DriverNamStr
                  AND   #$00FF
                  INC
                  PHA
                  _BlockMove
                  LDA   #$0000
                  JMP   Exit6

DriverNamStr      STR   'MCToolkit AppleSCSI2 1.0'
ConnectPort       DS    $24
DriverNLen        DW    ConnectPort-DriverNamStr-1  ; $0017

*----------------------------

MCDStartUp
                  LDA   BeenOpen
                  BEQ   L0210
                  BRL   L02A6

L0210             LDA   $14,S
                  STA   L02B7
                  LDA   #$0000
                  STA   L02C1
                  STA   L0311
                  LDA   $18,S
                  PHA
                  LDA   $18,S
                  PHA
                  PEA   ^ConnectPort
                  PEA   ConnectPort
                  PEA   $0000
                  PEA   $0024
                  _BlockMove
                  LDA   ConnectPort
                  AND   #$00FF
                  SEC
                  ADC   DriverNLen
                  SEP   #$30
                  STA   DriverNamStr
                  REP   #$30
                  LDA   ConnectPort
                  AND   #$FF00
                  ORA   #$0020
                  STA   ConnectPort
                  LDA   $18,S
                  PHA
                  LDA   $18,S
                  PHA
                  PEA   ^L02D8
                  PEA   L02D8
                  PEA   $0000
                  PEA   $0024
                  _BlockMove
                  LDA   L02D7+1
                  AND   #$00FF
                  STA   L02D7
                  BEQ   L0294
                  LDA   L02D7+2
                  AND   #$007F
                  CMP   #$002E
                  BNE   L0294
                  JSL   GSOS
                  DW    $2020             ; GetDevNumber
                  ADRL  L02FD
                  BCS   L0297
                  LDA   L0303
                  BRA   L029A

L0294             LDA   #mcInvalidPort
L0297             JMP   L02A9

L029A             STA   MyDevID
                  INC   BeenOpen
                  LDA   L02C1
                  STA   L0315
L02A6             LDA   #$0000
L02A9             JMP   Exit8

*----------------------------

MCDShutDown
                  lda   #0
                  sta   BeenOpen
                  jmp   Exit2

*--- New data

BeenOpen          DW    $0000
L02B7             DW    $0000
MyDevID           DW    $0000
                  DW    $0000
                  DW    $0000
                  DW    $0008
L02C1             DW    $0000
                  ADRL  L02D5
                  DW    $0000
                  ADRL  $00000000
                  DW    $0000
                  DW    $0000
                  DW    $0000
                  DW    $0000

L02D5             DW    $0024
L02D7             DS    $01
L02D8             DS    $25

L02FD             DW    $0002             ; Parms for GetDevNumber
                  ADRL  L02D7             ;  device name
L0303             DW    $0000             ;  device num
                  DW    $0003
                  DW    $0000
                  ADRL  L02D7
                  DW    $0003
                  DW    $0001
L0311             DW    $0000
                  DW    $0005
L0315             DW    $0000
                  DW    $0004
                  ADRL  L0325
                  ADRL  $00000002
                  ADRL  $00000000
L0325             DW    $8000
                  DW    $0004
                  DW    $0000
                  ADRL  L0337
                  ADRL  $00000001
                  ADRL  $00000000
L0337             DW    $0000

*----------------------------

HEX2BCD
                  phx
                  pha
                  and   #$f0
                  lsr
                  lsr
                  lsr
                  tax
                  lda   HD,x
                  sta   HSave

                  pla
                  and   #$0f
                  asl
                  tax
                  sed
                  lda   HU,x
                  clc
                  adc   HSave
                  cld
                  plx
                  rts

*--- New data

HD                dw    $0000
                  dw    $0016
                  dw    $0032
                  dw    $0048
                  dw    $0064
                  dw    $0080
                  dw    $0090

HU                dw    $0000
                  dw    $0001
                  dw    $0002
                  dw    $0003
                  dw    $0004
                  dw    $0005
                  dw    $0006
                  dw    $0007
                  dw    $0008
                  dw    $0009
                  dw    $0010
                  dw    $0011
                  dw    $0012
                  dw    $0013
                  dw    $0014
                  dw    $0015

HSave             ds    2

*----------------------------

BCD2HEX
                  phx
                  pha
                  and   #$0f
                  sta   BSave

                  pla
                  and   #$f0
                  lsr
                  lsr
                  lsr
                  tax
                  lda   BD,x
                  clc
                  adc   BSave
                  plx
                  rts

*--- New data

BD                dw    00
                  dw    10
                  dw    20
                  dw    30
                  dw    40
                  dw    50
                  dw    60
                  dw    70
                  dw    80
                  dw    90

BSave             ds    2

*----------------------------

getCURRENTSTATUS
                  lda   MyDevID
                  sta   SubDNum

                  jsl   GSOS
                  dw    $202D             ; DStatus
                  adrl  SubBlk
                  bcc   getCS1
                  sta   errCODE
                  rts

getCS1

*---

                  lda   SubData+6         ; get current track
                  and   #$ff
                  sta   trackCURRENT

                  lda   SubData+1         ; return Audio status
                  and   #$ff
                  rts

*--- New data

errCODE           ds    2                 ; GS/OS error code

SubBlk            DW    $0005             ; Parms for DStatus
SubDNum           DW    $0000             ;  device num
                  DW    $8042             ;  status code
                  ADRL  SubList           ;  status list
                  ADRL  16                ;  request count
                  ADRL  $00000000         ;  transfer count

SubList           DW    $0000
                  DB    $42
                  DB    $02               ; MSF
                  DB    $40               ; SubQ
                  DB    $01               ; CD-ROM current position data format
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ADRL  SubData
SubData           ds    16

*----------------------------

getTOC
                  sta   TOCType           ; 00-40-80
                  stx   TOCTrack          ; 00-63

                  lda   MyDevID
                  sta   TOCDNum

                  jsl   GSOS
                  dw    $202D             ; DStatus
                  adrl  ReadTOCBlk
                  bcc   getTOC1
                  rts

getTOC1

*--- The TOC is read now

                  sep   #$20              ; $00: first and last tracks
                  lda   TOCData+2
                  sta   trackFIRST
                  lda   TOCData+3
                  sta   trackLAST
                  rep   #$20

*---

                  lda   TOCType           ; $40: lead-out (end of disk)
                  cmp   #$40
                  beq   getTOC2
                  clc
                  rts

getTOC2           lda   TOCData+3
                  and   #$ff
                  asl
                  asl
                  asl                     ; *8
                  clc
                  adc   #8                ; 4 for header & 4 to reach hours
                  tay

                  lda   TOCData,y         ; hour / minute
                  sta   TOCData
                  lda   TOCData+2,y       ; second / frame
                  sta   TOCData+2
                  clc
                  rts

*--- Old data

TOCType           ds    2

*--- New data

ReadTOCBlk        DW    $0005             ; Parms for DStatus
TOCDNum           DW    $0000             ;  device num
                  DW    $8043             ;  status code
                  ADRL  TOCList           ;  status list
                  ADRL  1024              ;  request count
                  ADRL  $00000000         ;  transfer count
TOCList           DW    $0000
                  DB    $43
                  DB    $02               ; in MSF
                  DB    $00
                  DB    $00
                  DB    $00
TOCTrack          DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ADRL  TOCData
TOCData           ds    1024

*----------------------------

doSTARTSTOP
                  lda   MyDevID
                  sta   StopDNum

                  jsr   getCURRENTSTATUS
                  bcc   doSTOP1
                  rts

doSTOP1           ldx   #0                ;  stop
                  cmp   #$11              ; Audio play in progress
                  beq   doSTOP2
                  cmp   #$13              ; Audio play stopped
                  bne   doSTOP3
                  inx                     ;  start

doSTOP2           stx   StopFlag

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  StopBk
                  rts

doSTOP3           lda   #0                ; exit w/no error
                  rts

*--- New data

StopBk            DW    $0005             ; Parms for DControl
StopDNum          DW    $0000             ;  device num
                  DW    $801b             ;  control code
                  ADRL  StopList          ;  control list
                  ADRL  $00000000         ;  request count
                  ADRL  $00000000         ;  transfer count

StopList          DW    $0000
                  DB    $1b
                  DB    $00
                  DB    $00
                  DB    $00
StopFlag          DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ds    4

*----------------------------

doPAUSE
                  lda   MyDevID
                  sta   PauseDNum

                  jsr   getCURRENTSTATUS
                  bcc   doPAUSE1
                  rts

doPAUSE1          ldx   #0                ;  pause
                  cmp   #$11              ; Audio play in progress
                  beq   doPAUSE2
                  cmp   #$12              ; Audio play paused
                  bne   doPAUSE3
                  inx                     ;  resume

*--- Alternate entry

doPAUSE2          stx   PauseFlag

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  PauseBk
doPAUSE3          rts

*--- New data

PauseBk           DW    $0005             ; Parms for DControl
PauseDNum         DW    $0000             ;  device num
                  DW    $804b             ;  control code
                  ADRL  PauseList         ;  control list
                  ADRL  $00000000         ;  request count
                  ADRL  $00000000         ;  transfer count

PauseList         DW    $0000
                  DB    $4b
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
PauseFlag         DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ds    4

*----------------------------

MCGetFeatures
                  lda   #0                ; init result
                  sta   $18,s
                  sta   $1a,s

                  lda   $14,s             ; check if 0-9
                  cmp   #10
                  bcc   MCGF1

                  lda   #mcBadSelector    ; bad parameter if not
                  bra   MCGF9

MCGF1             tax                     ; return handling of
                  lda   tblFEATURES,x
                  and   #$ff              ; requested feature
                  sta   $18,s
                  lda   #$0000
                  sta   $1a,s
MCGF9             jmp   Exit4

*--- Data

tblFEATURES       dfb   $05               ; MCFTypes - Times and Chapters
                  dfb   $00
                  dfb   $00
                  dfb   $00
                  dfb   $01               ; MCFEject - yes
                  dfb   $01               ; MCFLock - yes
                  dfb   $01               ; MCFVDisplay - yes
                  dfb   $00
                  dfb   $00
                  dfb   $01               ; MCFVolume - yes

*----------------------------

MCPlay
                  lda   MyDevID
                  sta   PlayDNum          ; for PLAY AUDIO

                  lda   trackTOGO         ; we must jog!
                  bne   MCPlay2

                  lda   fgRUNFROM         ; 1
                  ora   fgRUNTO           ; 2
                  cmp   #3                ; must be 3 to accept the Run button
                  beq   MCPlay2           ; so, do as usual

                  jsr   getCURRENTSTATUS
                  bcs   MCPlay9

*- If in pause, we resume and exit

                  cmp   #$12              ; Audio play paused
                  bne   MCPlay1

                  ldx   #1                ; call resume
                  jsr   doPAUSE2
                  bra   MCPlay9           ; we exit

MCPlay1           cmp   #$11              ; Audio play in progress
                  beq   MCPlay8           ; we exit w/o error

*- If we're not already playing

MCPlay2           lda   #0                ; get full TOC
                  tax
                  jsr   getTOC
                  bcs   MCPlay9

                  lda   trackTOGO         ; we must jog!
                  bne   MCPlay4

                  lda   fgRUNFROM         ; play MSF?
                  ora   fgRUNTO
                  cmp   #3
                  bne   MCPlay3           ; no

                  jsr   MCPlayMSF
                  bcc   MCPlay8
                  bcs   MCPlay9

MCPlay3           lda   trackFIRST        ; get first and last tracks
MCPlay4           sta   PlayFirst         ; or trackTOGO and last tracks
                  lda   trackLAST
                  sta   PlayLast

                  stz   trackTOGO         ; reset track to go

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  PlayBk
                  bcs   MCPlay9

MCPlay8           lda   #0
MCPlay9           jmp   Exit2

*--- Play Audio MSF because Run was pressed

MCPlayMSF
                  lda   MyDevID
                  sta   PlayMSFDNum       ; for PLAY AUDIO MSF

                  stz   fgRUNFROM
                  stz   fgRUNTO

                  lda   runFROM+1         ; MM:SS
                  sta   fromMSF
                  lda   runFROM+2         ; SS:FF
                  sta   fromMSF+1

                  lda   runTO+1           ; MM:SS
                  sta   toMSF
                  lda   runTO+2           ; SS:FF
                  sta   toMSF+1

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  PlayMSFBk
                  rts

*--- Track data

trackFIRST        ds    2                 ; first track of a disk
trackLAST         ds    2                 ; last track of a disk
trackCURRENT      ds    2                 ; track the beam is on
trackTOGO         ds    2                 ; track to jog to

*--- New data

PlayBk            DW    $0005             ; Parms for DControl
PlayDNum          DW    $0000             ;  device num
                  DW    $8048             ;  control code
                  ADRL  PlayList          ;  control list
                  ADRL  $00000000         ;  request count
                  ADRL  $00000000         ;  transfer count

PlayList          DW    $0000
                  DB    $48
                  DB    $00
                  DB    $00
                  DB    $00
PlayFirst         DB    $00
                  DB    $00
                  DB    $00
PlayLast          DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ds    4

*--- Play Audio MSF block

PlayMSFBk         DW    $0005             ; Parms for DControl
PlayMSFDNum       DW    $0000             ;  device num
                  DW    $8047             ;  control code
                  ADRL  PlayMSFList       ;  control list
                  ADRL  $00000000         ;  request count
                  ADRL  $00000000         ;  transfer count

PlayMSFList       DW    $0000
                  DB    $47
                  DB    $00
                  DB    $00
fromMSF           DB    $00               ; MM
                  DB    $00               ; SS
                  DB    $00               ; FF
toMSF             DB    $00               ; MM
                  DB    $00               ; SS
                  DB    $00               ; FF
                  DB    $00
                  DB    $00
                  DB    $00
                  ds    4

*----------------------------

MCPause
                  jsr   doPAUSE
                  lda   #0
                  jmp   Exit2

*----------------------------

MCSendRawData
                  lda   #mcUnImp
                  jmp   Exit6

*----------------------------

MCGetStatus
                  lda   #0                ; init result
                  sta   $18,s

                  lda   $14,s             ; which device?
                  cmp   #mcSDeviceType
                  bne   MCGS1

*--- device type

                  ldx   #mcSCDAudio
                  bra   MCGS18

*--- play status

MCGS1             cmp   #mcSPlayStatus
                  bne   MCGS2

                  jsr   getCURRENTSTATUS
                  bcc   MCGS11

                  ldx   #mcSParked
                  lda   errCODE
                  cmp   #$002f            ; device is offline
                  beq   MCGS18
                  cmp   #$0027            ; I/O error
                  beq   MCGS18
                  bra   MCGS19            ; other errors, exit

MCGS11            ldx   #mcSPlaying
                  cmp   #$11              ; audio play operation in progress
                  beq   MCGS18

                  ldx   #mcSStill
                  cmp   #$12              ; paused
                  beq   MCGS18
                  cmp   #$13              ; stopped
                  beq   MCGS18
                  cmp   #$14              ; stopped due to error
                  beq   MCGS18

*--- generic return

MCGS17            ldx   #mcSUnknown
MCGS18            txa
                  sta   $18,s
                  lda   #$0000
MCGS19            jmp   Exit4

*--- door status

MCGS2             cmp   #mcSDoorStatus
                  beq   MCGS17            ; we don't know

*--- disc type

MCGS3             cmp   #mcSDiscType
                  bne   MCGS4

                  jsr   getCURRENTSTATUS
                  bcs   MCGS19

                  ldx   #mcS_CD
                  bra   MCGS18

*--- disc size

MCGS4             cmp   #mcSDiscSize
                  bne   MCGS5

                  jsr   getCURRENTSTATUS
                  bcs   MCGS19

                  ldx   #mcSDisc5inch
                  bra   MCGS18

*--- disc side

MCGS5             cmp   #mcSDiscSide
                  bne   MCGS6

                  jsr   getCURRENTSTATUS
                  bcs   MCGS19

                  ldx   #mcSSideOne
                  bra   MCGS18

*--- left volume

MCGS6             cmp   #mcSVolumeL
                  bne   MCGS7

                  jsr   doSENSE           ; mode sense
                  bcs   MCGS9

                  lda   SenseData+9,y     ; left volume
                  bra   MCGS79

*--- right volume

MCGS7             cmp   #mcSVolumeR
                  bne   MCGS8

                  jsr   doSENSE           ; mode sense
                  bcs   MCGS9

                  lda   SenseData+11,y    ; right volume

MCGS79            and   #$ff              ; save volume
                  xba                     ; 00FF becomes FF00
                  sta   $18,s
                  lda   #$0000            ; exit OK
                  bra   MCGS9

*--- We exit

MCGS8             lda   #mcBadSelector
MCGS9             jmp   Exit4

*----------------------------

doSENSE
                  lda   MyDevID
                  sta   SenseDNum

                  jsl   GSOS
                  dw    $202D             ; DStatus
                  adrl  SenseBlk
                  pha

                  lda   SenseData+3       ; get block descriptor length
                  and   #$ff
                  clc
                  adc   #4                ; add param header length
                  tay                     ; make it our offset

                  pla
                  rts

*--- New data

SenseBlk          DW    $0005             ; Parms for DStatus
SenseDNum         DW    $0000             ;  device num
                  DW    $801a             ;  status code
                  ADRL  SenseList         ;  status list
                  ADRL  128               ;  request count
                  ADRL  $00000000         ;  transfer count

SenseList         DW    $0000
                  DB    $1a
                  DB    $00
                  DB    $0e               ; current values / page E
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ADRL  SenseData
SenseData         ds    128               ; mode parameter header
                                          ; page E is usually at offset 4+8

*----------------------------

SENSE2SELECT
                  ldx   #0                ; copy the page
]lp               lda   SenseData,y
                  sta   Select0E,x
                  iny
                  iny
                  inx
                  inx
                  cpx   #16
                  bcc   ]lp
                  rts

*----------------------------

doSELECT
                  lda   MyDevID
                  sta   SelectDNum

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  SelectBlk
                  rts

*--- New data

SelectBlk         DW    $0005             ; Parms for DControl
SelectDNum        DW    $0000             ;  device num
                  DW    $8015             ;  status code
                  ADRL  SelectList        ;  status list
                  ADRL  20                ;  request count
                  ADRL  $00000000         ;  transfer count

SelectList        DW    $0000
                  DB    $15
                  DB    $10               ; page in SCSI-2
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ADRL  SelectData

* Must start with 4 zeroes
* Then, we have the CD-ROM parameters page
* output port 0 at +8, volume at +9
* output port 1 at +10, volume at +11

SelectData        hex   00,00,00,00
Select0E          hex   0e,0e,04,00,00,00,00,00
                  hex   01,ff,02,ff,00,00,00,00

*----------------------------

MCControl
                  lda   MyDevID
                  sta   EjectDNum
                  sta   PreventDNum

                  lda   $14,s             ; over 10, we don't handle
                  cmp   #mcCUnLockDev+1
                  bcc   MCC1

                  lda   #mcUnImp
                  jmp   Exit4

*--- Init?

MCC1              cmp   #mcCInit
                  bne   MCC2

                  stz   trackTOGO
                  stz   fgRUNFROM
                  stz   fgRUNTO
                  bra   MCC98

*--- Eject?

MCC2              cmp   #mcCEject
                  bne   MCC9

                  jsr   doUNLOCK

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  EjectBk
                  bra   MCC99

*--- Lock device?

MCC9              cmp   #mcCLockDev
                  bne   MCC10

                  jsr   doLOCK
                  bra   MCC99

*--- Unlock device?

MCC10             cmp   #mcCUnLockDev
                  bne   MCC5

                  jsr   doUNLOCK
                  bra   MCC99

*--- Video position display on/off?

MCC5              cmp   #mcCDisplayOn
                  beq   MCC98
                  cmp   #mcCDisplayOff
                  beq   MCC98

                  lda   #mcBadSelector
                  bra   MCC99

*--- Lock/Unlock

doLOCK            lda   #1
                  bne   doPREVENT
doUNLOCK          lda   #0
doPREVENT         sta   fgLOCK

                  jsl   GSOS
                  dw    $202E             ; DControl
                  adrl  PreventBk
                  rts

*--- We exit

MCC98             lda   #0
MCC99             jmp   Exit4

*--- New data for Eject

EjectBk           DW    $0005             ; Parms for DControl
EjectDNum         DW    $0000             ;  device num
                  DW    $0002             ;  control code
                  ADRL  $00000000         ;  control list
                  ADRL  $00000000         ;  request count
                  ADRL  $00000000         ;  transfer count

*--- New data for PREVENT/ALLOW REMOVAL

PreventBk         DW    $0005             ; Parms for DControl
PreventDNum       DW    $0000             ;  device num
                  DW    $801e             ;  control code
                  ADRL  PreventList       ;  control list
                  ADRL  $00000000         ;  request count
                  ADRL  $00000000         ;  transfer count

PreventList       DW    $0000
                  DB    $1e
                  DB    $00
                  DB    $00
                  DB    $00
fgLOCK            DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  DB    $00
                  ds    4

*----------------------------

MCScan
                  lda   #$40              ; get lead-out
                  ldx   #0
                  jsr   getTOC
                  bcc   MCS1
                  jmp   Exit4

*--- Get disc range

MCS1
                  lda   TOCData+8         ; get disk start
                  xba
                  sta   scanBEGIN+2
                  lda   TOCData+10
                  xba
                  sta   scanBEGIN

                  lda   TOCData           ; get disk end
                  xba
                  sta   scanEND+2
                  lda   TOCData+2
                  xba
                  sta   scanEND

*--- And the status

                  jsr   getCURRENTSTATUS  ; get status

                  lda   SubData+8         ; get current position
                  xba
                  sta   scanCURRENT+2
                  lda   SubData+10
                  xba
                  sta   scanCURRENT

*--- Now move the beast

                  lda   $14,s             ; 0: forward, <0: rewind
                  bpl   MCSFF

                  jsr   doREWIND          ; scan backwards
                  bcc   MCS7
                  bcs   MCS8

MCSFF             jsr   doFORWARD         ; scan forward
                  bcs   MCS8              ; cannot move, exit

MCS7
                  lda   scanCURRENT+2     ; MM HH
                  xba
                  sta   runFROM           ; HH MM
                  lda   scanCURRENT       ; FF SS
                  xba
                  sta   runFROM+2         ; SS FF

                  jsr   correctEND        ; remove one frame

                  lda   scanEND+2         ; MM HH
                  xba
                  sta   runTO             ; HH MM
                  lda   scanEND           ; FF SS
                  xba
                  sta   runTO+2           ; SS FF

                  jsr   MCPlayMSF         ; move the beam and play
                  bra   MCS9

MCS8              lda   #0
MCS9              jmp   Exit4

*--- Scan forward (add 10 seconds)

doFORWARD
                  sep   #$20

                  lda   scanCURRENT+1     ; add 10 seconds
                  clc
                  adc   #10
                  sta   scanCURRENT+1
                  cmp   #60               ; above 59 seconds?
                  bcc   doFORWARD5
                  sec
                  sbc   #60
                  sta   scanCURRENT+1

                  inc   scanCURRENT+2     ; add 1 minute
                  lda   scanCURRENT+2
                  cmp   #100              ; above 99 minutes?
                  bcc   doFORWARD5
                  lda   #99
                  sta   scanCURRENT+2

                  inc   scanCURRENT+3     ; add 1 hour
                  lda   scanCURRENT+3
                  cmp   #100              ; above 99 hours?
                  bcc   doFORWARD5
                  lda   #99               ; force 99 hours
                  sta   scanCURRENT+3

doFORWARD5                                ; Are we above disc end?
                  rep   #$20

                  lda   scanCURRENT+2     ; hhmm
                  cmp   scanEND+2
                  bcc   doFORWARD9

                  lda   scanCURRENT       ; ssff
                  cmp   scanEND
                  bcc   doFORWARD9

                  sec                     ; force error
doFORWARD9        rts

*--- Scan backwards (subtract 10 seconds)

doREWIND
                  sep   #$20

                  lda   scanCURRENT+1     ; subtract 10 seconds
                  sec
                  sbc   #10
                  sta   scanCURRENT+1
                  bpl   doREWIND5
                  clc
                  adc   #60               ; above 60 seconds
                  sta   scanCURRENT+1

                  dec   scanCURRENT+2     ; subtract 1 minute
                  bpl   doREWIND5
                  lda   #99               ; 99 minutes
                  sta   scanCURRENT+2

                  dec   scanCURRENT+3     ; subtract 1 hour
                  bpl   doREWIND5
                  lda   #99               ; 99 hours
                  sta   scanCURRENT+3

*--- Are we above the disc start?

doREWIND5
                  rep   #$20

                  lda   scanCURRENT+2
                  cmp   #$6363            ; 9999
                  beq   doREWIND7

                  lda   scanBEGIN+2       ; MM HH
                  cmp   scanCURRENT+2
                  bcc   doREWIND9         ; <, exit

                  lda   scanBEGIN         ; FF SS
                  cmp   scanCURRENT
                  bcc   doREWIND9         ; <, exit

doREWIND7         sec
doREWIND9         rts

*--- Correct the end of the disc

correctEND
                  sep   #$20

                  dec   scanEND           ; remove a frame
                  bpl   correctEND9

                  lda   #74               ; last frame
                  sta   scanEND
                  dec   scanEND+1         ; SS--
                  bpl   correctEND9

                  lda   #59               ; last second
                  sta   scanEND+1
                  dec   scanEND+2         ; MM--
                  bpl   correctEND9

                  lda   #99               ; last minute
                  sta   scanEND+2
                  dec   scanEND+3         ; HH--
                  bpl   correctEND9

                  lda   #99               ; last hour
                  sta   scanEND+3

correctEND9       rep   #$20
                  rts

*--- New data

scanBEGIN         ds    4
scanCURRENT       ds    4
scanEND           ds    4

*----------------------------

MCGetSpeeds
                  lda   #mcUnImp
                  jmp   Exit6

*----------------------------

MCSpeed
                  lda   #mcUnImp
                  jmp   Exit4

*----------------------------

MCStopAt
                  stz   fgRUNTO

*- Track

                  lda   $18,s             ; track?
                  cmp   #mcInChapters
                  bne   MCSA1

                  lda   $14,s
                  sta   runTO
                  bra   MCSA8

*- Time

MCSA1             cmp   #mcInTime         ; or time?
                  beq   MCSA2

                  lda   #mcUnImp          ; it is frames, error
                  bra   MCSA9

*- Convert from BCD time

MCSA2
                  lda   $17,s             ; get hours
                  jsr   BCD2HEX
                  sta   runTO
                  lda   $16,s             ; get minutes
                  jsr   BCD2HEX
                  sta   runTO+1
                  lda   $15,s             ; get seconds
                  jsr   BCD2HEX
                  sta   runTO+2
                  lda   $14,s             ; get frames
                  jsr   BCD2HEX
                  sta   runTO+3

*--- We exit

MCSA8             lda   #2                ; good init
                  sta   fgRUNTO

                  lda   #0                ; exit OK
MCSA9             jmp   Exit8

*----------------------------

MCJogN
                  lda   $14,s             ; mcJogRepeat must exit
                  sta   dataJOGR          ; times to repeat
                  bne   MCJ1

                  lda   #mcInvalidParam
                  jmp   Exit10

*--- Which UnitType?

MCJ1              lda   $1a,s             ; we support track
                  cmp   #mcInChapters
                  beq   MCJ2

                  lda   #mcUnImp
                  jmp   Exit10

*--- Jog in tracks

MCJ2              lda   $16,s
                  sta   dataNJOG          ; number of units to jog

                  stz   trackTOGO         ; init destination track

                  jsr   getCURRENTSTATUS
                  bcc   MCJ3
                  jmp   Exit10

MCJ3              lda   #0
                  tax
                  jsr   getTOC
                  bcc   MCJ4
                  jmp   Exit10

*--- Now jog

MCJ4              lda   dataJOGR          ; move + or -
                  bmi   MCJ4BACK

                  lda   trackCURRENT
                  clc
                  adc   dataNJOG
                  sta   trackTOGO         ; where we must go
                  cmp   trackLAST         ; are we over
                  bcc   MCJ4END           ; the last track?

                  lda   trackLAST
                  sta   trackTOGO         ; yes, limit to last track
MCJ4END           bra   MCJ8

*--- Move backwards

MCJ4BACK          lda   trackCURRENT
                  sec
                  sbc   dataNJOG
                  sta   trackTOGO         ; where we must go
                  bmi   MCJ5              ; are we < 0
                  cmp   trackFIRST        ; or < first track
                  bcs   MCJ8

MCJ5              lda   trackFIRST
                  sta   trackTOGO         ; yes, limit to first track

*--- We exit

MCJ8              lda   #$0000
MCJ9              jmp   Exit10

*--- Data

dataJOGR          ds    2
dataNJOG          ds    2

*----------------------------

MCSearchTo
                  stz   fgRUNFROM

*- Track

                  lda   $18,s             ; track?
                  cmp   #mcInChapters
                  bne   MCST1

                  lda   $14,s
                  sta   runFROM
                  bra   MCST8

*- Time

MCST1             cmp   #mcInTime         ; time?
                  beq   MCST2

                  lda   #mcUnImp          ; it is frames, error
                  bra   MCST9

*- Convert from BCD time

MCST2
                  lda   $17,s             ; get hours
                  jsr   BCD2HEX
                  sta   runFROM
                  lda   $16,s             ; get minutes
                  jsr   BCD2HEX
                  sta   runFROM+1
                  lda   $15,s             ; get seconds
                  jsr   BCD2HEX
                  sta   runFROM+2
                  lda   $14,s             ; get frames
                  jsr   BCD2HEX
                  sta   runFROM+3

*--- We exit

MCST8             lda   #1                ; good init
                  sta   fgRUNFROM

                  lda   #$0000            ; exit OK
MCST9             jmp   Exit8

*--- Data

runFROM           ds    5                 ; HH MM SS FF 00
runTO             ds    5                 ; HH MM SS FF 00
fgRUNFROM         ds    2                 ; we did MCSearchTo (0 or 1)
fgRUNTO           ds    2                 ; we did MCSearchAt (0 or 2)
                                          ; we'll run A-B if above result is 3

*----------------------------

MCSearchDone
                  lda   #1
                  sta   $16,s

                  lda   #0
                  jmp   Exit2

*----------------------------

MCSearchWait
                  lda   #0
                  jmp   Exit2

*----------------------------

MCGetPosition
                  lda   #0
                  sta   $18,s
                  sta   $1a,s

                  lda   $14,s             ; which mcUnitType?
                  cmp   #mcInFrames
                  bne   MCGP2

MCGP1             lda   #mcUnImp          ; video frames not implemented
                  bne   MCGP9

MCGP2             jsr   getCURRENTSTATUS  ; get current status
                  bcs   MCGP9

                  lda   $14,s
                  cmp   #mcInChapters
                  bne   MCGP3

                  lda   trackCURRENT      ; return current track
                  sta   $18,s
                  bra   MCGP8

MCGP3             cmp   #mcInTime         ; if not time, exit with error
                  bne   MCGP1

                  lda   SubData+11        ; frame
                  jsr   HEX2BCD
                  sta   currentPOS
                  lda   SubData+10        ; seconds
                  jsr   HEX2BCD
                  sta   currentPOS+1
                  lda   SubData+9         ; minutes
                  jsr   HEX2BCD
                  sta   currentPOS+2
                  lda   SubData+8         ; hours
                  jsr   HEX2BCD
                  sta   currentPOS+3

                  lda   currentPOS
                  sta   $18,s
                  lda   currentPOS+2
                  sta   $1a,s

MCGP8             lda   #0
MCGP9             jmp   Exit4

*---

currentPOS        ds    5                 ; makes a BCD of the HEX position

*----------------------------

MCSetAudio
                  lda   $14,s             ; check value
                  cmp   #AudioMonaural+1
                  bcc   MCSAU1

                  lda   #mcBadAudio       ; not within 0-15
                  bra   MCSAU9

MCSAU1            jsr   doSENSE           ; get audio values
                  bcs   MCSAU9

                  jsr   SENSE2SELECT

*--- Now, do the work

                  lda   $14,s
                  asl
                  tax
                  sep   #$20
                  lda   tblAUDIO+1,x      ; copy value for left
                  sta   Select0E+8
                  lda   tblAUDIO,x        ; copy value for right
                  sta   Select0E+10
                  rep   #$20

                  jsr   doSELECT          ; send the audio values
MCSAU9            jmp   Exit4

*--- New data

* High byte for left value
* Low byte for right value

tblAUDIO          dw    $0000             ; 0
                  dw    $0002             ; 1
                  dw    $0001             ; 2
                  dw    $0003             ; 3
                  dw    $0200             ; 4
                  dw    $0202             ; 5
                  dw    $0201             ; 6
                  dw    $0203             ; 7
                  dw    $0100             ; 8
                  dw    $0102             ; 9
                  dw    $0101             ; 10
                  dw    $0103             ; 11
                  dw    $0300             ; 12
                  dw    $0302             ; 13
                  dw    $0301             ; 14
                  dw    $0303             ; 15

*----------------------------

MCGetTimes
                  lda   #mcUnImp
                  jmp   Exit4

*----------------------------

MCGetNoTracks
                  lda   #0
                  sta   $16,s             ; clear result

                  lda   #0                ; TOCType = 0
                  tax                     ; Track = 0
                  jsr   getTOC
                  bcs   MCGNT9

                  sep   #$20              ; last - first + 1
                  lda   TOCData+3
                  sec
                  sbc   TOCData+2
                  clc
                  adc   #1
                  rep   #$20
                  and   #$00ff
                  sta   $16,s

                  lda   #0
MCGNT9            jmp   Exit2

*----------------------------

MCGetDiscTOC
                  lda   #0                ; clear result
                  sta   $18,s             ; if track = 0
                  sta   $1a,s

                  lda   $14,s             ; which track?
                  tax
                  bne   MCGDT1
                  lda   #mcInvalidParam
                  bne   MCGDT9

MCGDT1            lda   #0                ; TOCType = 0
                  jsr   getTOC
                  bcs   MCGNT9

                  lda   #0                ; space
                  pha
                  pha
                  lda   TOCData+8         ; HH:MM
                  xba
                  pha
                  lda   TOCData+10        ; SS:FF
                  xba
                  pha
                  _MCBinToTime
                  pla
                  plx
                  sta   $18,s
                  txa
                  sta   $1a,s

                  lda   #0
MCGDT9            jmp   Exit4

*----------------------------

MCGetDiscID
                  LDA   #mcUnImp
                  jmp   Exit2

*----------------------------

MCRecord
                  lda   #mcUnImp
                  jmp   Exit2

*----------------------------

MCStop
                  jsr   doSTARTSTOP
                  bcs   MCStop9

                  lda   #0
MCStop9           jmp   Exit2

*----------------------------

MCWaitRawData
                  lda   $18,s
                  sta   $00
                  lda   $1A,s
                  sta   $02

                  lda   #0
                  ldy   #2
                  sta   [$00],y

                  lda   #mcUnImp
                  jmp   Exit8

*----------------------------

MCSetVolume

*--- First, get values (because output might be different)

                  jsr   doSENSE
                  bcs   MCSV9

                  jsr   SENSE2SELECT

*--- Then, copy volume

                  sep   #$20

                  lda   $15,s             ; get right volume (high-byte only)
                  sta   Select0E+11

                  lda   $17,s             ; get left volume (high-byte only)
                  sta   Select0E+9

                  rep   #$20

                  jsr   doSELECT          ; A=0 or not
MCSV9             jmp   Exit6

