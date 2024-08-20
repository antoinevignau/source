*
* SCANNER SCSI
* A test app for SCSI scanner commands
*
* (c) 2024, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	xc
	xc
	mx	%00

	rel
	lst	off

*----------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

Debut	=	$00
GSOS	=	$e100a8

*----------

windowID	=	0

devSCANNER	=	$001a

maxDEVICES	=	8

dcEXPLORE	=	$800e	; status
dcINQUIRY	=	$8012	; status
dcMODESELECT =	$8015
dcMODESENSE6 =	$801a
dcSTARTSTOP	=	$801b	; also eject/insert
dcSETWINDOWPARAMETERS =	$8024	; for scanner (control)
dcGETWINDOWPARAMETERS =	$8025	; for scanner (status)

stEXPLORE	=	$0e	; status
stINQUIRY	=	$12	; status
stMODESELECT =	$15
stMODESENSE6 =	$1a
stSTARTSTOP	=	$1b	; also eject/insert
stSETWINDOWPARAMETERS =	$24	; for scanner (control)
stGETWINDOWPARAMETERS =	$25	; for scanner (status)

DInfo	=	$202c
DStatus	=	$202d
DControl	=	$202e

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

	        lda	#previewPAGE
	        stal	$300
	        lda	#^previewPAGE
	        stal	$302

	        lda	#statusCALL
	        stal	$310
	        lda	#^statusCALL
	        stal	$312
		
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
          pha                           ; from a word to a string
          pha
          pha
          _HexIt
          PullLong  strDEVID

          PushWord  #$20                ; space
          _WriteChar

          lda       nbDEVICES           ; write device index
          inc
          ora       #"0"
          pha
          _WriteChar

          PushLong  #strDEV             ; show the string
          _WriteCString

	ldx	#$32-2                ; copy the original
]lp       lda	devINFO1,x          ; devname for open/close
          sta	devNAME,x           ; calls
          dex
          dex
          bpl	]lp
          
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
deviceMENU2       cmp       #"2"+1
                  bcs       ]lp

                  sec                            ; call the routines
                  sbc       #"1"
                  asl
                  tax
                  lda       ptrCOMMANDS,x
                  sta       deviceMENU3+1
deviceMENU3       jsr       $bdbd
                  jmp       deviceMENU

ptrCOMMANDS
	da	doINQUIRY
          da        previewPAGE
*	da	doMODESENSE6
*	da	doEXPLORE
*	da	doGETMODE
*	da	doGETWINDOWPARAMETERS

*--- Data

strDEVICEMENU
	asc	0d'Using SCSI Scanner device $'
strDEVMENU
	asc	'0000'0d
	asc	' 0. Go back to previous menu'0d
	asc       ' 1. Inquiry'0d
	asc       ' 2. Preview page'0d
	asc	00

*----------------
* APPLE SCANNERS
*
* Scanner (300dpi 4-bit grey)
*  06 00 02 02 2C 00 00 00 'APPLE   SCANNER A9M0337 '
*  06 00 02 02 28 00 00 00 'CPC INC Smart Scan(FW)  '
*
* OneScanner (300dpi 8-bit grey)
*  06 00 02 02 2C 20 04 08 'APPLE   SCANNER II      2.02'
*  00 20 00 90 00 27 34 01 08 A0 48 00 FF FF
*
* Color OneScanner (300dpi 24-bit color)
*  
*
* Color OneScanner 600/27 (600dpi 27-bit color) - CANOSCAN 300 (CS300)
*  06 00 02 02 1F 00 00 10 'CANON   IX-03035B       1.01' FF
*
* Color OneScanner 1200/30 (1200dpi 30-bit color) - CANOSCAN 600  (CS600)
*  06 00 02 02 1F 00 00 10 'CANON   IX-06015C       1.07' FF
*
* ---End of list

*----------------
* SCSI COMMANDS
*----------------

*-----------------------
* STATUS $8012 - INQUIRY
*-----------------------

doINQUIRY
          jsr       initSTATUSDATA

          ldx       #6-2                 ; put the inquiry data
]lp       lda       scsiINQUIRY,x
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

scsiINQUIRY       hex       12,00,00,00,F0,00

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

*-----------------------
* PREVIEW PAGE
*-----------------------

previewPAGE
          jsr	openSCANNER
          jsr	setMODE
	bit	setHALFTONES
          jsr	setWINDOW
          jsr	askforMEM
          jsr	scanSCANNER
          jsr	readSCANNER
          jsr	closeSCANNER
	jmp	saveFILE

*-----------------------
* OPEN THE SCANNER
*-----------------------

openSCANNER
	PushLong	#startOS
	_WriteCString
	lda	#^openSCANNER
	jsr	showWORD
	lda	#openSCANNER
	jsr	showWORD
	PushLong	#startOS2
	_WriteCString
	
          jsl       GSOS
          dw        $2010
          adrl      proOPEN
          bcc       os_ok

	PushLong	#openOS
	_WriteCString

os_ok	lda       proOPEN+2
	sta       proREAD+2
	sta       proCLOSE+2

*	lda       theDEVICE
*	sta       proWAIT+2
*
*	jsl       GSOS
*	dw        DControl
*	adrl      proWAIT
*	bcc       os_ok2
*
*	PushLong	#waitOS
*	_WriteCString

os_ok2	PushLong	#endOS
	_WriteCString
          rts

*---

startOS	asc	0d'Start openSCANNER ($'00
startOS2	asc	')'00
openOS	asc	' (open not OK) '00
waitOS	asc	' (wait not OK) '00
endOS	asc	'...End'00

proOPEN   dw        2         ; 00 pcount
          ds        2         ; 02 ref num
          adrl      devNAME   ; 04 path name

proWAIT   dw        5         ; 00 pcount
          ds        2         ; 02 device ID
          dw        4         ; 04 control code (setwaitstatus)
          adrl      waitDATA  ; 06 control list pointer
          adrl      2         ; 0A request length
          ds        4         ; 0E transfer length

waitDATA  dw        0         ; activate wait mode

*-----------------------
* SET THE MODE
*-----------------------

setMODE
	PushLong	#startSM
	_WriteCString
	lda	#^setMODE
	jsr	showWORD
	lda	#setMODE
	jsr	showWORD
	PushLong	#startSM2
	_WriteCString

          lda       theDEVICE
          sta       proSETMODE+2

          jsl       GSOS
          dw        DControl
          adrl      proSETMODE
          bcc       st_ok

	PushLong	#controlSM
	_WriteCString

st_ok	PushLong	#endSM
	_WriteCString
          rts

*---

startSM	asc	0d'Start setMODE ($'00
startSM2	asc	')'00
controlSM	asc	' (control not OK) '00
endSM	asc	'...End'00

proSETMODE
          dw        5
          ds        2
          dw        $8015	; MODE SELECT
          adrl      setmodeBUFF
          adrl      12
          ds        4

setmodeBUFF
          dw        $0000
          hex       15	; 00
          hex       10	; 01 PF bit is 1 for SCSI-2
          hex       00,00	; 02 reserved
          dfb       12	; 04 parameter list length
          hex       00,00,00,00,00,00,00
          adrl      setmodeonescannerDATA

*--- for Scanner

setmodeDATA
          hex       00,00	; 00 mode parameter header (8.3.3, table 91)
	hex	00,00
          hex       01	; 04
          hex       08	; 05
	hex	00	; 06
	hex	00	; 07
	hex	02	; 08
	hex	58	; 09
	hex	00,00	; 10 reserved - 2 bytes

*--- For OneScanner

setmodeonescannerDATA
          hex	00,00	; 00 mode parameter header (8.3.3, table 91)
	hex	00,00
          dfb	1	; 04 page code - Apple-specific parameter page
          dfb	8	; 05 page length - Apple-specific page
	dfb	0	; 06 graymap (Apple Scanner)
			;	0: dark
			;	1: normal
			;	2: light
	dfb	%00000000	; 07 auto background adjustment threshold
			;  	Default threshold value is 64 (Apple Scanner)
			;	bit 0 - 0: do not use custom CCT / 1: use custom CCT (3*3 Color Correction Table)
			;	bit 1 - 0: do not use custom gamma / 1: use custom gamma
			;	bit 2 - 0: setting of the ambler LED off / 1: setting on (OneScanner)
	dfb	%00000000	; 08 parameters setting 1
			; 	bit 0 - 0: turn lamp off / 1: turn lamp on
			;	bit 1 - power of the CCD array on / 1: power off
			;      bits 2/3 - 00: normal / 01: fast / 10: high speed (OneScanner)
			;	bit 2 - 0: do not reverse B&W / 1: reverse B&W (Color OneScanner)
			;	bit 3 - 0: no ICP / 1: ICP on (Color OneScanner)
			;	bit 4 - 0: no MTF / 1: MTF on (Color OneScanner)
	dfb	0	; 09 color sensor (color onescanner)
			;	0: all
			;	1: red
			;	2: green
			;	3: blue
	hex	00,00	; 10 reserved - 2 bytes
	hex	00,00	; for testing purposes
	
*-----------------------
* SET HALFTONES
*-----------------------

setHALFTONES
	PushLong	#startSHT
	_WriteCString
	lda	#^setHALFTONES
	jsr	showWORD
	lda	#setHALFTONES
	jsr	showWORD
	PushLong	#startSHT2
	_WriteCString

          lda       theDEVICE
          sta       proSETHALFTONES+2

          jsl       GSOS
          dw        DControl
          adrl      proSETHALFTONES
          bcc       sht_ok

	PushLong	#controlSHT
	_WriteCString

sht_ok	PushLong	#endSHT
	_WriteCString
          rts

*---

startSHT	asc	0d'Start setHALFTONES ($'00
startSHT2	asc	')'00
controlSHT asc	' (control not OK) '00
endSHT	asc	'...End'00

proSETHALFTONES
          dw        5
          ds        2
          dw        $802A
          adrl      sethalftonesBUFF
          adrl      17
          ds        4

sethalftonesBUFF
          dw        $0000
          hex       2A	; operation code
          hex       00	; logical unit / reserved
	hex	02	; data type code (halftone mask)
	hex	00	; reserved
	hex	00,02	; data type qualifier (halftone mask)
	dfb	00,00,17	; transfer length
	hex	00	; control
	hex	00,00
          adrl      sethalftonesDATA

* Halftone patterns
* 0: spiral 4*4
* 1: Bayer 4*4
* 3: spiral 8*8
* 4: Bayer 8*8

sethalftonesDATA

* 4x4 Bayer ordered dither matrix (ID = 1) (from Dev.CD Mar 92 / Dev.Sample.aii)

	hex	44
	hex	08,88,28,A8
	hex	C8,48,E8,68
	hex	38,B8,18,98
	hex	F8,78,D8,58

	hex	44
	dfb	00,08,02,10
	dfb	12,04,14,06
	dfb	03,11,01,09
	dfb	15,07,13,05

* Weird Apple dither matrix

	hex       44	; 4x4 matrix size + pel 0 to 15
	hex	F0,40,80,C0
	hex	B0,00,10,50
	hex	70,30,20,90
	hex	E0,A0,60,D0

	hex	44
	dfb	15,04,08,12
	dfb	11,00,01,05
	dfb	07,03,02,09
	dfb	14,10,06,13

* Exemple de spirale
* 01,02,03,04
* 12,13,14,05
* 11,16,15,06
* 10,09,08,07

* 8*8 Bayer ordered dither matrix (ID = 4)

	hex	88
	dfb	00,32,08,40,02,34,10,42
	dfb	48,16,56,24,50,18,58,26
	dfb	12,44,04,36,14,46,06,38
	dfb	60,28,52,20,62,30,54,22
	dfb	03,35,11,43,01,33,09,41
	dfb	51,19,59,27,49,17,57,25
	dfb	15,47,07,39,13,45,05,37
	dfb	63,31,55,23,61,29,53,21

* 2x2 Bayer ordered dither matrix
	hex	22
	hex	08,20
	hex	30,10

	hex	22
	dfb	0,2
	dfb	3,1
			
*-----------------------
* SET THE WINDOW
*-----------------------

setWINDOW
	PushLong	#startSW
	_WriteCString
	lda	#^setWINDOW
	jsr	showWORD
	lda	#setWINDOW
	jsr	showWORD
	PushLong	#startSW2
	_WriteCString

          lda       theDEVICE
          sta       proSETWINDOW+2

          jsl       GSOS
          dw        DControl
          adrl      proSETWINDOW
          bcc       sw_ok

	PushLong	#controlSW
	_WriteCString

sw_ok	PushLong	#endSW
	_WriteCString
	rts

*---

startSW	asc	0d'Start setWINDOW ($'00
startSW2	asc	')'00
controlSW asc	' (control not OK) '00
endSW	asc	'...End'00

proSETWINDOW
          dw        5
          ds        2
          dw        $8024
	adrl      coloronescannerBUFF	; for OneScanner and above
	adrl      80
	ds        4

*--- For Apple Color OneScanner
	
coloronescannerBUFF
          dw        $0000
          hex       24
          hex       00
	hex	00,00,00,00
          dfb       00,00,72	; length is 50 bytes for OneScanner
          hex       00	; control ($80: the Apple bit)
	hex	00,00
          adrl      coloronescannerDATA

coloronescannerDATA
          hex	00,00,00,00,00,00	; 00
          dfb	00,64		; 06 window length (canon scanners)

          dfb	windowID		; 08 00 window identifier
          hex	00		; 09 01 reserved

          dfb	00,75		; 10 02 x-axis resolution
          dfb	00,75		; 12 04 y-axis resolution
          hex	00,00,00,00	; 14 06 x-upper left
          hex	00,00,00,00	; 18 10 y-upper left
* Photographie 5 x 3,5 = 6000 x 4200 = $1770 x $1068
	hex	00,00,17,70	; 14 x-width (27D8 for 10200)
          hex       00,00,10,68	; 18 y-height (3390 for 13200)
          dfb	0		; 30 22 brightness
          dfb	0		; 31 23 threshold
          dfb	0		; 32 24 contrast
          dfb	5		; 33 25 imageComposition (see table 283)
          dfb	24		; 34 26 bitsPerPixel (8)
          hex	00,01		; 35 27 halftone (2)
          dfb	128+3		; 37 29 RIF + paddingType (byte boundary)
          hex	00,00		; 38 30 bit ordering
	hex	00		; 40 32 compression type
	hex	00		; 41 33 compression argument
	hex	00,00,00,00,00,00	; 42 34
	dfb	255		; 48 40 OPT_VOLT_REF_TOP = 255
	dfb	1		; 49 41 OPT_VOLT_REF_BOTTOM = 1
	dfb	0		; 50 42 bit 3: GRC, bit 2: Mirror
	hex	00		; 51 43
	hex	00		; 52 44
	hex	00		; 53 45
	dfb	2		; 54 46
	hex	00		; 55 47
	hex	00		; 56 48
	dfb	1		; 57 49
	dfb	1		; 58 50
	hex	255		; 59 51 Hilite R
	hex	0		; 60 52 Shadow R
	hex	00		; 61 53
	hex	255		; 62 54 Shadow G
	hex	00		; 63 55
	hex	0		; 64 56 Hilite G
	hex	00		; 65 57 
	hex	00		; 66 58 
	hex	00		; 67 59 
	hex	00		; 68 60 
	hex	00		; 69 61 
	hex	255		; 70 62 Hilite B
	hex	0		; 71 63 Shadow B

*-----------------------
* ASK FOR MEMORY
*-----------------------

askforMEM
	PushLong	#startMEM
	_WriteCString
	lda	#^askforMEM
	jsr	showWORD
	lda	#askforMEM
	jsr	showWORD
	PushLong	#startMEM2
	_WriteCString

	lda	haMEM
	ora	haMEM+2
	beq	noMEM
	
	PushLong haMEM
	_DisposeHandle

noMEM
          pha
          pha
          PushLong  #526350   ; 638 bytes-w * 825 bytes-h
          PushWord  myID
          PushWord  #%01000000_00001100	; fixed + aligned + no spec mem
          PushLong  #0
          _NewHandle
          phd
          tsc
          tcd
          lda       [3]
          sta       proREAD+4
          ldy       #2
          lda       [3],y
          sta       proREAD+6
          pld
          pla
	sta	haMEM
          pla
	sta	haMEM+2
          bcs       am_err
	
	PushLong	#adrMEM
	_WriteCString
	lda	proREAD+6
	jsr	showWORD
	lda	proREAD+4
	jsr	showWORD
	
	PushLong	#endMEM
	_WriteCString
          rts
am_err    brk       $b6

*---

startMEM	asc	0d'Start askforMEM ($'00
startMEM2	asc	')'00
adrMEM	asc	' Adr=$'00
endMEM	asc	'...End'00

haMEM	ds	4

*-----------------------
* START THE SCANNING
*-----------------------

scanSCANNER
	PushLong	#startSS
	_WriteCString
	lda	#^scanSCANNER
	jsr	showWORD
	lda	#scanSCANNER
	jsr	showWORD
	PushLong	#startSS2
	_WriteCString
	
          lda       theDEVICE
          sta       proSCAN+2

          jsl       GSOS
          dw        DControl
          adrl      proSCAN
          bcc       ss_ok

	PushLong	#controlSS
	_WriteCString

ss_ok	PushLong	#endSS
	_WriteCString
	clc
          rts

*---

startSS	asc	0d'Start scanSCANNER ($'00
startSS2	asc	')'00
controlSS	asc	' (control not OK) '00
endSS	asc	'...End'00

proSCAN   dw        5
          ds        2
          dw        $801b
          adrl      scanBUFF
          adrl      1
          ds        4

scanBUFF
          dw        $0000
          hex       1b	; 0
          hex       00	; 1
	hex	00,00	; 2
          hex       01	; 4 length is 1
          hex       00	; 5 (data?)
			;	bit 7 - 1: stop wait mode (Apple Scanner)
			;	bit 5 - 0: no calibrate / 1: calibrate (OneScanner)
          hex       00,00,00,00,00,00
          adrl      scanDATA

scanDATA
          dfb	windowID	; the window identifier we want to scan
          
*-----------------------
* READ THE PAGE
*-----------------------

readSCANNER
	PushLong	#startRS
	_WriteCString
	lda	#^readSCANNER
	jsr	showWORD
	lda	#readSCANNER
	jsr	showWORD
	PushLong	#startRS2
	_WriteCString

          jsl       GSOS
          dw        $2012
          adrl      proREAD
          bcc       rs_ok

	PushLong	#controlRS
	_WriteCString

rs_ok	PushLong	#lengthRS
	_WriteCString
	lda	proREAD+14
	jsr	showWORD
	lda	proREAD+12
	jsr	showWORD
	PushLong	#endRS
	_WriteCString
          rts

*---

startRS	asc	0d'Start readSCANNER ($'00
startRS2	asc	')'00
controlRS asc	' (read not OK) '00
lengthRS	asc	' Len=$'00
endRS	asc	'...End'00

proREAD   dw        4	; 00 pcount
          ds        2	; 02 ref num
          ds        4	; 04 buffer ptr
          adrl      526350	; 08 requested length
          ds        4	; 0C transfer length

*-----------------------
* CLOSE THE SCANNER
*-----------------------

closeSCANNER
	PushLong	#startCS
	_WriteCString
	lda	#^closeSCANNER
	jsr	showWORD
	lda	#closeSCANNER
	jsr	showWORD
	PushLong	#startCS2
	_WriteCString

          jsl       GSOS
          dw        $2014
          adrl      proCLOSE
          bcc       cs_ok

	PushLong	#closeCS
	_WriteCString

cs_ok	PushLong	#endCS
	_WriteCString
          rts

*---

startCS	asc	0d'Start closeSCANNER ($'00
startCS2	asc	')'00
closeCS	asc	' (close not OK) '00
endCS	asc	'...End'00

proCLOSE  dw        1         ; 00 pcount
          ds        2         ; 02 ref num

*-----------------------
* SAVE FILE
*-----------------------

saveFILE
	PushLong	#startFILE
	_WriteCString
	lda	#^saveFILE
	jsr	showWORD
	lda	#saveFILE
	jsr	showWORD
	PushLong	#startFILE2
	_WriteCString

	lda	proREAD+4
	sta	fileWRITE+4
	lda	proREAD+6
	sta	fileWRITE+6
	
	lda	proREAD+12
	sta	fileWRITE+8
	lda	proREAD+14
	sta	fileWRITE+10

	jsl	GSOS
	dw	$2002
	adrl	fileDESTROY

	jsl	GSOS
	dw	$2001
	adrl	fileCREATE
	
	jsl	GSOS
	dw	$2010
	adrl	fileOPEN

	lda	fileOPEN+2
*	sta	fileHEADER+2
	sta	fileWRITE+2
	sta	fileCLOSE+2

*	jsl	GSOS
*	dw	$2013
*	adrl	fileHEADER
	
	jsl	GSOS
	dw	$2013
	adrl	fileWRITE
	
	jsl	GSOS
	dw	$2014
	adrl	fileCLOSE

	PushLong	#endFILE
	_WriteCString
	rts

*--- Data

startFILE	asc	0d'Write file ($'00
startFILE2 asc	')'00
endFILE	asc	'...End'0d00

fileDESTROY
	dw	1	; pcount
	adrl	pFILE	; pathname

fileCREATE
	dw	7	; 00 pcount
	adrl	pFILE	; 02 pathname
	dw	$c3	; 06 access_code
	dw	$06	; 08 file_type
	ds	4	; 0A aux_type
	ds	2	; 0E storage_type
	ds	4	; 10 eof
	ds	4	; 14 resource_eof

fileOPEN
	dw	2
	ds	2
	adrl	pFILE

fileHEADER
	dw	5
	ds	2
	adrl	headerDATA
	adrl	4
	ds	4
	dw	1
	
fileWRITE	dw	5
	ds	2
	ds	4
	ds	4
	ds	4
	dw	1

fileCLOSE	dw	1
	ds	2

headerDATA
	dw	500
	dw	800

pFILE	strl	'1/Scan.BIN'

*-----------------------
* STATUS $801A - MODE SENSE (6)
*-----------------------

doMODESENSE6
       	jsr	initSTATUSDATA

	ldx	#6-2                 ; put the inquiry data
]lp	lda	scsiMODESENSE6,x
	sta	statusDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcMODESENSE6
	jsr	statusCALL
	jmp	waitKEY

*--- Data

scsiMODESENSE6
	hex       1A,00,00,00,00,00

* 00_11_1111

*-----------------------
* BLINK BORDER
*-----------------------

blinkBORDER
	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	rts

*-----------------------
* STATUS $800E - EXPLORE (NOT DESCRIBED BY APPLE)
*-----------------------

doEXPLORE
	jsr	getDEVICEID
	sta	proEXPLORE+2
	
	jsl	GSOS
	dw	DStatus
	adrl	proEXPLORE
	bcc	doEXPLORE1
	jsr	blinkBORDER

doEXPLORE1

*--- Display status

	PushLong	#strXSTATUS
	_WriteCString

	lda	expBUFF
	jsr	showBYTE

*--- Display rate

	PushLong	#strTRATE
	_WriteCString
	
	lda	expBUFF+1
	xba
	jsr	showWORD

	jmp	waitKEY

*--- Data

proEXPLORE
	dw	5
	ds	2
	dw	$800E
	adrl	exploreBUFF
	adrl	12
	ds	4

exploreBUFF
	dw	0
	hex	0e
	hex	00,00,00
	dfb	12
	hex	00,00,00,00,00,00,00
	adrl	expBUFF

expBUFF	ds	12

strXSTATUS
	asc	0d' Status: '00
strTRATE
	asc	0d' Rate: '00

*-----------------------
* STATUS $801A - MODE SENSE 6
*-----------------------

doGETMODE	jsr	getDEVICEID
	sta	proGETMODE+2
	
	jsl	GSOS
	dw	DStatus
	adrl	proGETMODE
	bcc	doGETMODE1
	jsr	blinkBORDER

doGETMODE1

*--- Display Type

	PushLong	#strTYPE
	_WriteCString

	lda	gmBUFF+4
	and	#$ff
	cmp	#$80
	bcs	doPAGETYPE

	PushLong	#strTYPEH
	_WriteCString
	bra	doGETMODE2

doPAGETYPE	PushLong	#strTYPEP
	_WriteCString

*--- Display Page control

doGETMODE2	PushLong	#strPAGECTL
	_WriteCString

	lda	gmBUFF+6
	jsr	showBYTE

*--- Display Hand control

	PushLong	#strHANDCTL
	_WriteCString

	lda	gmBUFF+7
	jsr	showBYTE

*--- Display Bytes per line

	PushLong	#strSCANLEN
	_WriteCString

	lda	gmBUFF+8
	xba
	jsr	showWORD

*--- Display Shutoff timer

	PushLong	#strTIMER
	_WriteCString

	lda	gmBUFF+10
	xba
	jsr	showWORD

	jmp	waitKEY

*--- Data

proGETMODE	dw	5
	ds	2
	dw	$801A
	adrl	getmodeBUFF
	adrl	12
	ds	4

getmodeBUFF	dw	0
	hex	1A
	hex	00,00,00
	dfb	12
	hex	00,00,00,00,00,00,00
	adrl	gmBUFF

gmBUFF	ds	12

strTYPE	asc	0d'Scanner type: '00
strTYPEP	asc	'Page'00
strTYPEH	asc	'Hand'00
strPAGECTL	asc	0d'Page control: '00
strHANDCTL	asc	0d'Hand control: '00
strSCANLEN	asc	0d'Byter per line: '00
strTIMER	asc	0d'Shutoff timer: '00

*-----------------------
* STATUS $8025 - GET WINDOW PARAMETERS
*-----------------------

doGETWINDOWPARAMETERS
	jsr	initSTATUSDATA

	ldx	#10-2		; put the getwindow data
]lp	lda	scsiGETWIN,x
	sta	statusDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcGETWINDOWPARAMETERS
	jsr	statusCALL
	bcc	doGETWINDOW1
	rts

doGETWINDOW1

	PushLong	#strGWXRES
	 _WriteCString

	 ldy	#2
	 lda	[Debut],y
	 xba
	 jsr	showWORD

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

scsiGETWIN	hex	25,00,00,00,F0,00,00,00,00,00

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
                  ldx	#12-2
]lp               stz	statusDATA,x
                  dex
                  dex
                  bpl	]lp
                  rts

initCOMMANDDATA                                  ; clear SCSI command buffer
                  ldx	#12-2
]lp               stz	commandDATA,x
                  dex
                  dex
                  bpl	]lp
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

*--- Get my Device ID

getDEVICEID	lda	theDEVICE	; get our ID
	rts

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Display in string offset
* A: offset in
* X: nb of chars to print
* offset from commandBUFF

showTEXT          ldy       #^statusBUFF
                  phy
                  clc
                  adc       #statusBUFF
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

errCODE           ds        2		; GS/OS error code
strERROR          asc       0d'<!> GS/OS error code $'00

*---

proQUIT           dw        2		; pcount
                  ds        4		; pathname
                  ds        2		; flags

proDINFO          dw        8		; Parms for DInfo
                  ds        2		; 02 device num
                  adrl      devINFO	; 04 device name
                  ds        2		; 08 characteristics
                  ds        4		; 0A total blocks
                  ds        2		; 0E slot number
                  ds        2		; 10 unit number
                  ds        2		; 12 version
                  ds        2		; 14 device id

devINFO           dw        $0034	; buffer size
devINFO1          db        $00	; length from a GS/OS string
devINFO2          db        $00	; to a Pascal string
devINFO3          ds        $30	; data

devNAME           ds        $32         ; GS/OS string containing the device name

proSTATUS         dw        5		; 00 pcount
                  ds        2		; 02 device num
                  dw        $8000	; 04 status/control code
                  adrl      statusLIST	; 06 status list
                  adrl      240		; 0A request count (AVI was 1024/32)
                  ds        4		; 0E transfer count

statusLIST        ds        2		; always 0000
statusDATA        hex       00	; 00
                  hex       00	; 01
                  hex       00	; 02
                  hex       00	; 03
                  dfb       240	; 04 - (240 AVI was $00)
                  hex       00	; 05
                  hex       00	; 06
                  hex       00	; 07
                  hex       00	; 08
                  hex       00	; 09
                  hex       00	; 10
                  hex       00	; 11
                  adrl      statusBUFF
statusBUFF        ds        256	; more than 240

proCONTROL        dw        5		; 00 pcount
                  ds        2		; 02 device num
                  dw        $8000	; 04 status/control code
                  adrl      controlLIST	; 06 status list
                  adrl      240	; 0A request count
                  ds        4		; 0E transfer count

controlLIST       ds        2		; always 0000
commandDATA       hex       00	; 00
                  hex       00	; 01
                  hex       00	; 02
                  hex       00	; 03
                  dfb       240	; 04 - (240 AVI was $00)
                  hex       00	; 05
                  hex       00	; 06
                  hex       00	; 07
                  hex       00	; 08
                  hex       00	; 09
                  hex       00	; 10
                  hex       00	; 11
commandPTR        adrl      commandBUFF
commandBUFF       ds        256	; more than 240

*----------

appID             ds        2
myID              ds        2

myDP              ds        2
ptrBUFFER         ds        4
haBUFFER          ds        4

