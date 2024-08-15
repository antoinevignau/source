*
* SCANNER SCSI
* A test app for SCSI scanner commands
*
* (c) 2024, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

                  xc
                  xc
                  mx        %00

                  rel
                  dsk       SCANNERSCSI.l
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

devSCANNER        =         $001a

maxDEVICES        =         8

dcINQUIRY         =         $8012
doMODESELECT      =         $8015
dcMODESENSE6      =         $801a
dcSTARTSTOP       =         $801b	; also eject/insert
dcGETWINDOW24     =         $8024	; for scanner
dcGETWINDOW25     =         $8025	; for scanner
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

                  lda       #proSTATUS
                  stal      $300
                  lda       #^proSTATUS
                  stal      $302

                  lda       #proCONTROL
                  stal      $310
                  lda       #^proCONTROL
                  stal      $312

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

strMAINMENU       asc       0d'SCANNER SCSI'0d
                  asc       '(c) 2024, Brutal Deluxe Software'0d
                  asc       ' 1. Search for SCSI Scanners'0d
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

*---------- Check it is a scanner

found             lda       proDINFO+20          ; not SCANNER
                  cmp       #devSCANNER
                  bne       loop

*--- We have a scanner

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
                  asc       0d'Searching for SCSI Scanners...'0d
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
deviceMENU2       cmp       #"5"+1
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
                  da        doGWP2424
                  da        doGWP2425
                  da        doGWP2524
                  da        doGWP2525

*--- Data

strDEVICEMENU     asc	0d'Using SCSI Scanner device $'
strDEVMENU        asc	'0000'0d
                  asc	' 0. Go back to previous menu'0d
                  asc	' 1. Inquiry'0d
                  asc	' 2. Get Window Parameters 24/24'0d
                  asc	' 3. Get Window Parameters 24/25'0d
                  asc	' 4. Get Window Parameters 25/24'0d
                  asc	' 5. Get Window Parameters 25/25'0d
	      asc	00

*----------------
* SCSI COMMANDS
*----------------

doINQUIRY         =         *

                  jsr       initSTATUSDATA

                  ldx       #6-2                 ; put the inquiry data
]lp               lda       scsiINQUIRY,x
                  sta       statusDATA,x
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

                  lda       statusBUFF
                  and       #%11100000
                  xba
                  ldx       #3
                  jsr       showBITS

                  PushLong  #strPDT
                  _WriteCString

                  lda       statusBUFF
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

                  lda       statusBUFF+1
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strDTM
                  _WriteCString

                  lda       statusBUFF+1
                  and       #%01111111
                  asl
                  xba
                  ldx       #7
                  jsr       showBITS

* Byte 2

                  PushLong  #strISO
                  _WriteCString

                  lda       statusBUFF+2
                  and       #%11000000
                  xba
                  ldx       #2
                  jsr       showBITS

                  PushLong  #strECMA
                  _WriteCString

                  lda       statusBUFF+2
                  and       #%00111000
                  asl
                  asl
                  xba
                  ldx       #3
                  jsr       showBITS

                  PushLong  #strANSI
                  _WriteCString

                  lda       statusBUFF+2
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

                  lda       statusBUFF+3
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strTRMIOP
                  _WriteCString

                  lda       statusBUFF+3
                  and       #%01000000
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strRDF
                  _WriteCString

                  lda       statusBUFF+3
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

                  lda       statusBUFF+7
                  and       #%10000000
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strWBUS32
                  _WriteCString

                  lda       statusBUFF+7
                  and       #%01000000
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strWBUS16
                  _WriteCString

                  lda       statusBUFF+7
                  and       #%00100000
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strSYNC
                  _WriteCString

                  lda       statusBUFF+7
                  and       #%00010000
                  asl
                  asl
                  asl
                  xba
                  ldx       #1
                  jsr       showBITS

                  PushLong  #strLINKED
                  _WriteCString

                  lda       statusBUFF+7
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

                  lda       statusBUFF+7
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

                  lda       statusBUFF+7
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

doGWP2424	lda	#dcGETWINDOW24
	ldx	#$24
	bra	doGETWINDOW

doGWP2425	lda	#dcGETWINDOW24
	ldx	#$25
	bra	doGETWINDOW

doGWP2524	lda	#dcGETWINDOW25
	ldx	#$24
	bra	doGETWINDOW

doGWP2525	lda	#dcGETWINDOW25
	ldx	#$25

doGETWINDOW	sta	doGETWIN0+1
	sep	#$10
	stx	scsiGETWIN
	rep	#$10
	
	jsr	initSTATUSDATA

	ldx	#10-2		; put the getwindow data
]lp	lda	scsiGETWIN,x
	sta	statusDATA,x
	dex
	dex
	bpl	]lp

doGETWIN0	lda	#dcGETWINDOW24
	jsr	statusCALL
	bcc	doGETWINDOW1
	rts

doGETWINDOW1

*--- Check response length

	lda	#statusBUFF
	clc
	adc	#8
	sta	Debut
	lda	#^statusBUFF
	adc	#0
	sta	Debut+2

*--- Display Window identifier

	PushLong	#strGWID
	 _WriteCString

	 ldy	#0
	 lda	[Debut],y
	 xba
	 jsr	showBYTE

*--- Display X-Axis resolution

	PushLong	#strGWXRES
	 _WriteCString

	 ldy	#2
	 lda	[Debut],y
	 xba
	 jsr	showWORD

*--- Display Y-Axis resolution

	PushLong	#strGWYRES
	 _WriteCString

	 ldy	#4
	 lda	[Debut],y
	 xba
	 jsr	showWORD
	 
*--- Display X-Axis upper left

	PushLong	#strGWXUL
	 _WriteCString

	 ldy	#6
	 lda	[Debut],y
	 xba
	 jsr	showWORD
	 ldy	#8
	 lda	[Debut],y
	 xba
	 jsr	showWORD

*--- Display Y-Axis upper left

	PushLong	#strGWYUL
	 _WriteCString

	 ldy	#10
	 lda	[Debut],y
	 xba
	 jsr	showWORD
	 ldy	#12
	 lda	[Debut],y
	 xba
	 jsr	showWORD

*--- Display Window width

	PushLong	#strGWWW
	 _WriteCString

	 ldy	#14
	 lda	[Debut],y
	 xba
	 jsr	showWORD
	 ldy	#16
	 lda	[Debut],y
	 xba
	 jsr	showWORD

*--- Display Window length

	PushLong	#strGWWL
	 _WriteCString

	 ldy	#18
	 lda	[Debut],y
	 xba
	 jsr	showWORD
	 ldy	#20
	 lda	[Debut],y
	 xba
	 jsr	showWORD

*--- Display Brightness

	PushLong	#strGWBR
	 _WriteCString

	 ldy	#22
	 lda	[Debut],y
	 jsr	showBYTE

*--- Display Threshold

	PushLong	#strGWTH
	 _WriteCString

	 ldy	#23
	 lda	[Debut],y
	 jsr	showBYTE

*--- Display Contrast

	PushLong	#strGWCO
	_WriteCString

	ldy	#24
	lda	[Debut],y
	jsr	showBYTE

*--- Display Image composition

	PushLong	#strGWIC
	_WriteCString

	ldy	#25
	lda	[Debut],y
	and	#$ff
	pha
	jsr	showBYTE
	pla
	cmp	#6+1
	bcc	okGWIC
	lda	#6
okGWIC	asl
	tax

	lda	#^strGWIC00
	pha
	lda	ptrGWIC,x
	pha
	_WriteCString

*--- Display Bits per pixel

	PushLong	#strGWBPP
	_WriteCString

	ldy	#26
	lda	[Debut],y
	jsr	showBYTE

*--- Display Halftone pattern

	PushLong	#strGWHP
	_WriteCString

	ldy	#27
	lda	[Debut],y
	xba
	jsr	showWORD

*--- Display Padding type

	PushLong	#strGWPT
	_WriteCString

	ldy	#29
	lda	[Debut],y
	and	#%00000111
	cmp	#4+1
	bcc	okGWPT
	lda	#4
okGWPT	asl
	tax

	lda	#^strGWPT00
	pha
	lda	ptrGWPT,x
	pha
	_WriteCString

*--- Display Bit ordering

	PushLong	#strGWBO
	_WriteCString

	ldy	#30
	lda	[Debut],y
	xba
	jsr	showWORD

*--- Display Compression type

	PushLong	#strGWCT
	_WriteCString

	ldy	#32
	lda	[Debut],y
	and	#$ff
	cmp	#$10+1
	bcc	okGWCT
	lda	#$10
okGWCT	asl
	tax
	
	lda	#^strGWCT00
	pha
	lda	ptrGWCT,x
	pha
	_WriteCString

*--- Display Compression argument

	PushLong	#strGWCA
	_WriteCString

	ldy	#33
	lda	[Debut],y
	jsr	showBYTE

*--- We're done

	jmp	waitKEY

*--- Data

scsiGETWIN	hex	25,00,00,00,00,00,00,00,00,00

strGWID	asc	0d'Window identifier: $'00
strGWXRES	asc	0d'X-Axis resolution: $'00
strGWYRES	asc	0d'Y-axis resolution: $'00
strGWXUL	asc	0d'X-Axis upper left: $'00
strGWYUL	asc	0d'Y-Axis upper left: $'00
strGWWW	asc	0d'Window width: $'00
strGWWL	asc	0d'Window length: $'00
strGWBR	asc	0d'Brightness: $'00
strGWTH	asc	0d'Threshold: $'00
strGWCO	asc	0d'Contrast: $'00
strGWIC	asc	0d'Image composition: $'00
strGWBPP	asc	0d'Bits per pixel: $'00
strGWHP	asc	0d'Halftone pattern: $'00
strGWPT	asc	0d'Padding type: $'00
strGWBO	asc	0d'Bit ordering: $'00
strGWCT	asc	0d'Compression type: $'00
strGWCA	asc	0d'Compression argument: $'00

ptrGWIC	da	strGWIC00
	da	strGWIC01
	da	strGWIC02
	da	strGWIC03
	da	strGWIC04
	da	strGWIC05
	da	strGWIC06

strGWIC00	asc	' (Bi-level black & white)'00
strGWIC01	asc	' (Dithered/halftone black & white)'00
strGWIC02	asc	' (Multi-level black & white (gray scale))'00
strGWIC03	asc	' (Bi-level RGB colour)'00
strGWIC04	asc	' (Dithered/halftone RGB colour)'00
strGWIC05	asc	' (Multi-level RGB colour)'00
strGWIC06	asc	' (Reserved)'00

ptrGWPT	da	strGWPT00
	da	strGWPT01
	da	strGWPT02
	da	strGWPT03
	da	strGWPT04

strGWPT00	asc	' (No boundary)'00
strGWPT01	asc	' (Pad with 0s to byte boundary)'00
strGWPT02	asc	' (Pad with 1s to byte boundary)'00
strGWPT03	asc	' (Truncate by byte boundary)'00
strGWPT04	asc	' (Reserved)'00

ptrGWCT	da	strGWCT00
	da	strGWCT01
	da	strGWCT02
	da	strGWCT03
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT04
	da	strGWCT10

strGWCT00	asc	' (No compression)'00
strGWCT01	asc	' (CCITT group III, 1 dimensional)'00
strGWCT02	asc	' (CCITT group III, 2 dimensional)'00
strGWCT03	asc	' (CCITT group IV, 2 dimensional)'00
strGWCT04	asc	' (Reserved)'00
strGWCT10	asc	' (Optical character recognition)'00

*--- SCSI routines

initSTATUSDATA                                  ; clear SCSI command buffer
                  ldx       #12-2
]lp               stz       statusDATA,x
                  dex
                  dex
                  bpl       ]lp
                  rts

initCOMMANDDATA                                  ; clear SCSI command buffer
                  ldx       #12-2
]lp               stz       commandDATA,x
                  dex
                  dex
                  bpl       ]lp
                  rts

*--- DStatus
* Uses the DStatus parm buffer

statusCALL        sta       proSTATUS+4          ; SCSI driver command
                  sep       #$20                 ; SCSI commands are 8-bit
                  sta       statusDATA           ; SCSI command
                  rep       #$20

                  jsl       GSOS                 ; call it
                  dw        $202d
                  adrl      proSTATUS
                  bra       showERR

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

