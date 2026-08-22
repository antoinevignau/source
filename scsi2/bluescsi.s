*
* BlueSCSI
*
* (c) 2026, Brutal Deluxe Software
* Antoine Vignau & Olivier Zardini
* Visit brutaldeluxe.fr
*

	mx	%00
	rel
	lst	off

*-------------------------------
* Welcome!
*-------------------------------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

GSOS	=	$e100a8

*-------------------------------
* Theory of operation
* https://github.com/BlueSCSI/BlueSCSI-v2/wiki/Toolbox-Developer-Docs
*
* Scan the SCSI bus by sending an Inquiry 0x12 command.
* Check the Inquiry vendor response.
*   It will contain a text representation of the BlueSCSI Firmware version, eg: BlueSCSIv2024.05.22
*   Note: Some drive types can not support this additional vendor data such as Networking or ZIP drives.
* Check the BlueSCSI Toolbox API Version (uint8) to ensure your app supports the API version.
* Send a MODE SENSE 0x1A command for page 0x31.
*    Validate it against the BlueSCSIVendorPage (see: lib/SCSI2SD/src/firmware/mode.c)
* Send the BLUESCSI_TOOLBOX_LIST_DEVICES command.
*   To find all other devices this BlueSCSI is emulating (including Networking or ZIP)
*   Note: there maybe be more than one BlueSCSI on the bus, so scan the rest of the ID's that are not handled by this BlueSCSI.
*
*

*-------------------------------
* DIRECT PAGE
*-------------------------------

theINDEX	=	$00
theNBENTRIES	=	theINDEX+2
dpFROM	=	theNBENTRIES+2
skipWAIT	=	dpFROM+4	; true or false
theFILESIZE	=	skipWAIT+2
theNBBLOCKS	=	theFILESIZE+4

*-------------------------------
* SCSI EQUATES
*-------------------------------

MAX_DEVICES	=	8
MAX_SCSI_ID	=	8	; 0..7

dcINQUIRY	=	$8012	; ** bluescsi **
dcMODESENSE6	=	$801a	; ** bluescsi **
dcRECEIVEDIAG	=	$801c	; ** bluescsi **

dcBLUESCSI_TOOLBOX_LIST_FILES	=	$80d0
dcBLUESCSI_TOOLBOX_GET_FILE	=	$80d1
dcBLUESCSI_TOOLBOX_COUNT_FILES	=	$80d2
dcBLUESCSI_TOOLBOX_SEND_FILE_PREP	=	$80d3
dcBLUESCSI_TOOLBOX_SEND_FILE	=	$80d4
dcBLUESCSI_TOOLBOX_SEND_FILE_END	=	$80d5
dcBLUESCSI_TOOLBOX_TOGGLE_DEBUG	=	$80d6
dcBLUESCSI_TOOLBOX_LIST_CDS	=	$80d7
dcBLUESCSI_TOOLBOX_SET_NEXT_CD	=	$80d8
dcBLUESCSI_TOOLBOX_METADATA	=	$80d9
dcTOOLBOX_SUBCMD_LIST_DEVICES	=	$8000
dcBLUESCSI_TOOLBOX_COUNT_CDS	=	$80da

*---

chrPOINT	=	'.'
chrDEUXPOINTS	=	':'
chrRETURN	=	$0d
chrRETURN2	=	$8d

SIZE_BLOCK	=	4096
SIZE_DATA	=	4096	; more than a MTU, please

TRUE	=	0
FALSE	=	65535

*-------------------------------
* BLUESCSI EQUATES
*-------------------------------

MAX_MAC_PATH	=	32
MAX_FILE_LEN	=	32
ENTRY_SIZE	=	40
MAX_FILE_LISTING_FILES	=	100

BLUESCSI_TOOLBOX_LIST_FILES	=	$d0
BLUESCSI_TOOLBOX_GET_FILE	=	$d1
BLUESCSI_TOOLBOX_COUNT_FILES	=	$d2
BLUESCSI_TOOLBOX_SEND_FILE_PREP	=	$d3
BLUESCSI_TOOLBOX_SEND_FILE	=	$d4
BLUESCSI_TOOLBOX_SEND_FILE_END	=	$d5
BLUESCSI_TOOLBOX_TOGGLE_DEBUG	=	$d6
TOOLBOX_SUBCMD_DEBUG_SET_STATUS	=	$00
TOOLBOX_SUBCMD_DEBUG_GET_STATUS	=	$01
TOOLBOX_SUBCMD_DEBUG_ON	=	$00
TOOLBOX_SUBCMD_DEBUG_OFF	=	$01
BLUESCSI_TOOLBOX_LIST_CDS	=	$d7
BLUESCSI_TOOLBOX_SET_NEXT_CD	=	$d8
BLUESCSI_TOOLBOX_METADATA	=	$d9
BLUESCSI_TOOLBOX_COUNT_CDS	=	$da

iINDEX	=	0	; index in ToolboxFileEntry
iTYPE	=	1
iNAME	=	2
iSIZE	=	35

TYPE_FILE	=	0	; file types
TYPE_FOLDER	=	1

* The RECEIVE DIAGNOSTIC RESULT sub-commands...

SCSI_NETWORK_WIFI_CMD_SCAN	=	$01	; first, wait for non-zero
SCSI_NETWORK_WIFI_CMD_COMPLETE	=	$02	; check if complete, wait for non-zero
SCSI_NETWORK_WIFI_CMD_SCAN_RESULTS =	$03	; print results if done
SCSI_NETWORK_WIFI_CMD_INFO	=	$04	; 
SCSI_NETWORK_WIFI_CMD_JOIN	=	$05	; join network

* The METADATA sub-commands...

TOOLBOX_SUBCMD_LIST_DEVICES	=	$00
TOOLBOX_SUBCMD_GET_CAPABILITIES	=	$01
TOOLBOX_SUBCMD_SET_WORKING_DIR	=	$02
TOOLBOX_SUBCMD_GET_WORKING_DIR	=	$03

TOOLBOX_CAP_LARGE_TRANSFERS	=	1
TOOLBOX_CAP_LARGE_SEND	=	2
TOOLBOX_CAP_SET_WORKING_DIR	=	4

TOOLBOX_API_VERSION	=	0

*-------------------------------
* SOFTSWITCH
*-------------------------------

VERTCNT	=	$c02e	; for file size!

*-------------------------------
* CODE
*-------------------------------

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

*---------- Make the pointer a string for the GET_FILE command

	pha
	pha
	lda	ptrBUFFER+2
	pha
	_HexIt
	PullLong	strBUFFERHIGH

	pha
	pha
	lda	ptrBUFFER
	pha
	_HexIt
	PullLong	strBUFFERLOW

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

	lda	#FALSE	; never skip wait
	sta	skipWAIT
	
* DEBUG

	lda	#commandBUFF
	stal	$300
	lda	#^commandBUFF
	stal	$302

	lda	#toolboxD3_1
	stal	$308
	lda	#^toolboxD3_1
	stal	$30a
	
*----------------------------
* MAIN MENU
*----------------------------

mainMENU	PushLong  #strMAINMENU
	_WriteCString

	jsr	waitFORKEY
	cmp	#"R"
	beq	doRESTART
	cmp	#"r"
	beq	doRESTART

	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT

	cmp	#"1"
	bne	mainMENU

	jmp	searchMENU

*----------------------------
* RESTART/QUIT PROGRAM
*----------------------------

doRESTART	lda	#^strlMYAPP
	stal	proQUIT+4
	lda	#strlMYAPP
	stal	proQUIT+2
	
doQUIT	_IMShutDown
	_TextShutDown
	_MTShutDown

	PushWord	myID
	_DisposeAll

	PushWord	appID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*--- Data

strMAINMENU	asc	0d'BlueSCSI'0d
	asc	'(c) 2026, Brutal Deluxe Software'0d
	asc	' 1. Search for devices'0d
	asc	' Q. Quit'0d
	asc	' R. Restart app'0d00

*----------------------------
* SEARCH MENU
*----------------------------

searchMENU	PushLong	#strSEARCHMENU
	_WriteCString

	jsr	pollSCSI	; show SCSI devices

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"r"
	beq	searchMENU1
	cmp	#"R"
	bne	searchMENU2
searchMENU1	jmp	mainMENU	; or even 0 to exit
searchMENU2	cmp	#"0"
	bcc	]lp
	cmp	#"9"+1
	bcs	]lp

	sec		; we have our device ID
	sbc	#"0"
	cmp	nbDEVICES	; in the 1-nbDEVICES range
	bcc	searchMENU3
	bne	]lp

searchMENU3	dec
	asl
	tax
	lda	tblDEVICES,x
	sta	theDEVICE	; we have our device now
	jmp	deviceMENU

*---------- Routines

pollSCSI	stz	nbDEVICES	; number of SCSI devices found

	lda	#1	; start with device 1
	sta	proDINFO+2

]lp	jsl	GSOS	; do a DInfo
	dw	$202c
	adrl	proDINFO
	bcc	found

	cmp	#$0011	; no more devices
	bne	loop
	rts

loop	inc	proDINFO+2
	bra	]lp

*---------- Check it is a CD-ROM
*
*found	lda	proDINFO+8	; not removable
*	and	#dcREMOVE
*	beq	loop
*
*	lda	proDINFO+20	; not CD-ROM
*	cmp	#devCDROM
*	bne	loop
*
*--- We have a CDROM

found	lda	nbDEVICES
	asl
	tax
	lda	proDINFO+2
	sta	tblDEVICES,x

	jsr	showDEVICEINFO

	inc	nbDEVICES
	lda	nbDEVICES
	cmp	#MAX_DEVICES
	bcc	loop	; loop again
	rts

*--- Sub routines
*
* x - $xxxx - .NAMEOFDEVICE

showDEVICEINFO    pha		; from a word to a string
                  pha
                  pha
                  _HexIt
                  PullLong  strDEVID

                  PushWord  #$20	; space
                  _WriteChar

                  lda       nbDEVICES	; write device index
                  inc
                  ora       #"0"
                  pha
                  _WriteChar

                  PushLong  #strDEV	; show the string
                  _WriteCString

                  lda       devINFO1	; from a STRL to a STR
                  xba
                  sta       devINFO1

                  PushLong  #devINFO2
                  _WriteString

                  PushWord  #$0d
                  _WriteChar
                  rts

*---------- Data

strDEV	asc	' - $'
strDEVID	asc	'0000 - '00

nbDEVICES	ds	2	; number of devices
theDEVICE	ds	2	; the device to play with
tblDEVICES	ds	16*2	; we authorize 16 devices

strSEARCHMENU	asc	0d'Searching for SCSI devices...'0d
	asc	' R. Return to previous menu'0d00

*----------------------------
* DEVICE MENU
*----------------------------

deviceMENU	lda	theDEVICE            ; get our ID
	sta	proSTATUS+2
	sta	proCONTROL+2

	pha                            ; from a word to a string
	pha
	pha
	_HexIt
	PullLong	strDEVMENU

	PushLong	#strDEVICEMENU
	_WriteCString

*---

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"r"
	beq	deviceMENU1
	cmp	#"R"
	bne	deviceMENU2
deviceMENU1	jmp	searchMENU	; or even 0 to exit
deviceMENU2	cmp	#"0"
	bcc	]lp
	cmp	#"4"+1
	bcs	]lp

	sec		; call the routines
	sbc	#"1"
	asl
	tax
	lda	ptrCOMMANDS,x
	sta	deviceMENU3+1
deviceMENU3	jsr	$bdbd
	jmp	deviceMENU

ptrCOMMANDS	da	doINQUIRY
	da	doSENSE
	da	doWIFI
	da	doTOOLBOX

*--- Data

strDEVICEMENU     asc	0d'Using SCSI device $'
strDEVMENU        asc	'0000'0d
                  asc	' R. Return to previous menu'0d
                  asc	' 1. Inquiry device'0d
                  asc	' 2. Sense page $31'0d
                  asc	' 3. Show Wi-Fi access points'0d
	  asc	' 4. Toolbox commands'0d
	  dfb	00	  

*-----------------------------------------------
* INQUIRY
*-----------------------------------------------

doINQUIRY	jsr	initCOMMANDDATA

	ldx	#6-2	; put the inquiry data
]lp	lda	scsiINQUIRY,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcINQUIRY
	jsr	statusCALL
	bcc	doINQUIRY1
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

*--- Check if we have a BlueSCSI device

	ldy	#0	; no BS by default

	sep	#$20
	ldx	#8-1	; is one on Vendor ID?
]lp	lda	commandBUFF+8,x
	cmp	refBLUESCSI,x
	bne	checkBS2
	dex
	bpl	]lp
	bra	foundBS
	
checkBS2	ldx	#8-1	; or on Product ID?
]lp	lda	commandBUFF+16,x
	cmp	refBLUESCSI,x
	bne	nofoundBS
	dex
	bpl	]lp

foundBS	ldy	#-1
nofoundBS	rep	#$20
	sty	fgBLUESCSI

*--- Say it now...

	PushLong	#strBS
	_WriteCString

	lda	fgBLUESCSI
	beq	noBSFOUND
	
	PushLong	#strYES
	_WriteCString
	jmp	waitKEY

noBSFOUND	PushLong	#strNO
	_WriteCString
	jmp	waitKEY

*--- Data

scsiINQUIRY	hex	12,00,00,00,00,00

strPQ	asc	0d' Peripheral qualifier: '00
strPDT	asc	' - Peripheral device type : '00
strRMB	asc	0d' RMB: '00
strDTM	asc	' - Device-type modifier: '00
strISO	asc	0d' ISO version: '00
strECMA	asc	' - ECMA version: '00
strANSI	asc	' - ANSI-approved version: '00
strAENC	asc	0d' AENC: '00
strTRMIOP	asc	' - TrmIOP: '00
strRDF	asc	' - Response data format: '00
strRELADR	asc	0d' RelAdr: '00
strWBUS32	asc	' - WBus32: '00
strWBUS16	asc	' - WBus16: '00
strSYNC	asc	' - Sync: '00
strLINKED	asc	0d' Linked: '00
strCMDQUE	asc	' - CmdQue: '00
strSFTRE	asc	' - SftRe: '00
strVI	asc	0d' Vendor identification: '00
strPI	asc	0d' Product identification: '00
strPRL	asc	0d' Product revision level: '00

strBS	asc	0d' BlueSCSI: '00
strYES	asc	'Yes'00
strNO	asc	'No'00

refBLUESCSI	asc	'BlueSCSI'00

fgBLUESCSI	ds	2

*-----------------------------------------------
* SENSE PAGE $31
*-----------------------------------------------

doSENSE	jsr	initCOMMANDDATA

	ldx	#6-2	; put the stop data
]lp	lda	scsiSENSE,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcMODESENSE6	; MODE SENSE(10)
	jsr	statusCALL
	bcc	doSENSE1
	rts

doSENSE1

*--- We begin at +12 (this could have been better handled)

* Byte 0 - Page code

	PushLong	#strPAGECODE
	_WriteCString

	lda	commandBUFF+12
	jsr	showBYTE

* Byte 1 - Page length

	PushLong	#strPAGELENGTH
	_WriteCString
	
	lda	commandBUFF+12+1
	jsr	showDECIMAL

* Byte 2 - Text

	PushLong	#strVENDORPAGE
	_WriteCString

	lda	#12+2	; offset
	ldx	#41	; length
	jsr	showTEXT

*--- Now compare

	ldy	#0	; not the right page by default

	ldx	#42	; compare with the ref page
]lp	lda	commandBUFF+12,x
	cmp	refVENDORPAGE,x
	bne	noGOODPAGE
	dex
	dex
	bpl	]lp
	
	ldy	#-1	; we have one
noGOODPAGE	sty	fgBLUESCSI2

*--- Tell the world!

	PushLong	#strBS
	_WriteCString

	lda	fgBLUESCSI
	beq	noBSFOUND2
	
	PushLong	#strYES
	_WriteCString
	jmp	waitKEY

noBSFOUND2	PushLong	#strNO
	_WriteCString
	jmp	waitKEY

*--- Data

scsiSENSE	hex	1a,00,31,00,00,00	; want page $31, was $4E for PC "changeable values"

strPAGECODE	asc	0d' Page code: '00
strPAGELENGTH	asc	0d' Page length: '00
strVENDORPAGE	asc	0d' Vendor data: '00

refVENDORPAGE	hex	31
	dfb	42
	asc	'BlueSCSI is the BEST STOLEN FROM BLUESCSI'
	dfb	0

fgBLUESCSI2	ds	2

*-----------------------------------------------
* WIFI
*-----------------------------------------------

LEN_WIFI	=	6	; len of the SCSI command (Apple's doc is wrong)
MAX_SSID	=	10
SIZE_STRSSID	=	64	; len of string
SIZE_SSID	=	74	; 64 + 6 + 1 + 1 + 1 + 1
SIZE_JOIN_REQ	=	130
MAX_KEY	=	64	; a key limit
MAX_RETRIES	=	64	; number of tries before we cancel

*--- Code

doWIFI	jsr	initCOMMANDDATA

	ldx	#LEN_WIFI-2	; init string
]lp	lda	refWIFI,x
	sta	scsiWIFI,x
	dex
	dex
	bpl	]lp

*--- Execute the scan

	stz	commandBUFF
	stz	nbTRIES
	
	PushLong	#strSCANWIFI
	_WriteCString

	PushLong	#strRESULT1
	_WriteCString

]lp	ldx	#SCSI_NETWORK_WIFI_CMD_SCAN
	lda	#2	; length
	jsr	execWIFI

	PushWord	#chrPOINT
	_WriteChar
	
	inc	nbTRIES
	lda	nbTRIES
	cmp	#MAX_RETRIES
	bcs	doWIFI_EXITERR

	lda	commandBUFF	; non-zero is scan has started
	and	#$ff
	beq	]lp

	PushLong	#strSCANDONE
	_WriteCString

*--- Check if it has ended and say it so...

	stz	commandBUFF
	stz	nbTRIES
	
	PushLong	#strRESULT2
	_WriteCString

]lp	ldx	#SCSI_NETWORK_WIFI_CMD_COMPLETE
	lda	#2	; length
	jsr	execWIFI

	PushWord	#chrPOINT
	_WriteChar

	inc	nbTRIES
	lda	nbTRIES
	cmp	#MAX_RETRIES
	bcs	doWIFI_EXITERR

	lda	commandBUFF	; non-zero if scan has finished
	and	#$ff
	beq	]lp

	PushLong	#strSCANDONE
	_WriteCString

*--- See if we have access points. If so, display them

	stz	commandBUFF

	ldx	#SCSI_NETWORK_WIFI_CMD_SCAN_RESULTS
	lda	#1000	; length (70 x 10 max)
	jsr	execWIFI

	PushLong	#strRESULT3
	_WriteCString

	lda	commandBUFF
	bne	wehavedata

*--- We have found nothing, exit gracefully

doWIFI_EXITERR	PushLong	#strNOWIFI
	_WriteCString
	jmp	waitKEY

*--- We have Wi-Fi access points, show the names

* Clear the join request structure

wehavedata	ldx	#SIZE_JOIN_REQ-2
]lp	stz	theSSID,x
	dex
	dex
	bpl	]lp

* We found one, tell the world
	
	PushLong	#strYESWIFI	; AP found
	_WriteCString

	PushLong	#strSELECTAP	; print header
	_WriteCString
	
	lda	#1	; start with first AP
	sta	idNETWORK
	lda	#2	; offset from commandBUFF
	sta	offsetNETWORK

]lp	sep	#$20
	lda	idNETWORK
	ora	#'0'
	sta	strIDNETWORK+2
	rep	#$20

	ldx	offsetNETWORK	; did we reach the end?
	lda	commandBUFF,x
	and	#$ff
	cmp	#$ff
	beq	lastaccesspoint
	
	PushLong	#strIDNETWORK	; show ID
	_WriteCString

	lda	offsetNETWORK	; show SSID
	ldx	#64
	jsr	showTEXT

	lda	offsetNETWORK	; next entry
	clc
	adc	#SIZE_SSID
	sta	offsetNETWORK
	
	inc	idNETWORK	; next network
	lda	idNETWORK
	cmp	#MAX_SSID
	bcc	]lp
	beq	]lp

lastaccesspoint	PushWord	#chrRETURN	; a last return
	_WriteChar
	
*--- Let the user select one access point

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"r"
	beq	apMENU1
	cmp	#"R"
	bne	apMENU2
apMENU1	jmp	deviceMENU	; or even 0 to exit
apMENU2	cmp	#"0"
	bcc	]lp
	sec		; we have a value
	sbc	#"0"
	cmp	idNETWORK	; number of entries
	bcc	apMENU3	; found it
	bne	]lp

*--- Calculate the address of the selected SSID information

apMENU3	tax
	lda	#2	; offset is 2
]lp	dex
	cpx	#0	; done adding
	beq	apMENU4
	clc
	adc	#SIZE_SSID
	bra	]lp

apMENU4	sta	offsetNETWORK	; we point to the SSID information

* Copy the SSID name

	tax
	ldy	#0
	sep	#$20
]lp	lda	commandBUFF,x
	sta	theSSID,y
	inx
	iny
	cpy	#SIZE_STRSSID
	bcc	]lp
	rep	#$20
	
*--- Print the details of the SSID access point

	PushLong	#strDETAILAP
	_WriteCString
	
* +0 - SSID(64)

	PushLong	#strSSID
	_WriteCString
	lda	offsetNETWORK
	ldx	#64
	jsr	showTEXT
	
* +64 - BSSID(6) - The MAC address

	PushLong	#strBSSID
	_WriteCString
	lda	offsetNETWORK
	clc
	adc	#64
	ldx	#6
	jsr	showMAC

* +70 - RSSI(1)

	PushLong	#strRSSI
	_WriteCString
	lda	offsetNETWORK
	clc
	adc	#70
	tax
	lda	commandBUFF,x
	jsr	showBYTE

* +71 - CHANNEL(1)

	PushLong	#strCHANNEL
	_WriteCString
	lda	offsetNETWORK
	clc
	adc	#71
	tax
	lda	commandBUFF,x
	sep	#$20
	sta	theCHANNEL
	rep	#$20
	jsr	showBYTE

* +72 - FLAGS(1)

	PushLong	#strFLAGS
	_WriteCString
	lda	offsetNETWORK
	clc
	adc	#72
	tax
	lda	commandBUFF,x
	jsr	showBYTE

* +73 - PADDING(1)

	PushLong	#strPADDING
	_WriteCString
	lda	offsetNETWORK
	clc
	adc	#73
	tax
	lda	commandBUFF,x
	sep	#$20
	sta	thePADDING
	rep	#$20
	jsr	showBYTE

*--- Let the user decide what to do now

	PushLong	#strDOWHATNOW
	_WriteCString

]lp	jsr	waitFORKEY	; is it 0-1
	cmp	#"r"
	beq	apMENU9
	cmp	#"R"	; R to return
	bne	apMENU10
apMENU9	jmp	deviceMENU
apMENU10	cmp	#"1"	; 1 to connect
	bne	]lp

*--- Enter credentials...

	PushLong	#strTHEKEY
	_WriteCString
		
	PushWord	#0
	PushLong	#theKEY
	PushWord	#MAX_KEY
	PushWord	#chrRETURN2
	PushWord	#1
	_ReadLine
	pla
	bne	apMENU20
	jmp	apMENUEND

apMENU20	PushLong	#strCONNECTING
	_WriteCString

* Rewrite the key (bit 7)

	ldx	#MAX_KEY-1
	sep	#$20
]lp	lda	theKEY,x
	and	#%0111_1111
	sta	theKEY,x
	dex
	bpl	]lp
	rep	#$20

*--- THE END!! Connect to the network

* Prepare the SCSI command

	lda	#SIZE_JOIN_REQ	; set the size
	xba		; could have been put
	sta	scsiWIFIJOIN+3	; in the command directly
	
	ldx	#LEN_WIFI-2	; copy SCSI string
]lp	lda	scsiWIFIJOIN,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

* Copy the AP join network data to the buffer

	ldx	#SIZE_JOIN_REQ-2
]lp	lda	theSSID,x
	sta	commandBUFF,x
	dex
	dex
	bpl	]lp

	lda	#dcRECEIVEDIAG	; RECEIVE DIAGNOSTIC RESULTS
	jsr	controlCALL	; now a control command!!

apMENUEND	PushLong	#strPRESSAKEY
	_WriteCString
	jmp	waitKEY

*--- Execute Wi-Fi command

execWIFI	xba		; length
	sta	scsiWIFI+3
	sep	#$10	; sub-command
	stx	scsiWIFI+1
	rep	#$10

	ldx	#LEN_WIFI-2	; init string
]lp	lda	scsiWIFI,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcRECEIVEDIAG	; RECEIVE DIAGNOSTIC RESULTS
	jsr	statusCALL	; a status command
	rts
	
*--- Data

refWIFI	hex	1c,00,00,00,00,00,00,00,00,00

scsiWIFI	hex	1c
	hex	00	; +1: sub-command
	hex	00
	hex	00,00	; +3/4: length
	hex	00
	hex	00,00,00,00

scsiWIFIJOIN	hex	1c
	dfb	SCSI_NETWORK_WIFI_CMD_JOIN
	hex	00
	hex	00,00	; +3/4: length 130d = 82h
	hex	00
	hex	00,00,00,00

*--- Strings

strSCANWIFI	asc	0d'Start Wi-Fi scan for access points...'00
strSCANDONE	asc	' Finished!'00
strNOWIFI	asc	' No access points found!'00
strYESWIFI	asc	' Access points found!'00

strDETAILAP	asc	0d'Details of the access point:'00
strSSID	asc	0d' Service Set IDentifier: '00
strBSSID	asc	0d' Basic Service Set IDentifier: '00
strRSSI	asc	0d' Received Signal Strength Indicator: '00
strCHANNEL	asc	0d' Channel: '00
strFLAGS	asc	0d' Flags: '00
strPADDING	asc	0d' Padding: '00

strRESULT0	asc	0d' SCSI_NETWORK_WIFI... '00
strRESULT1	asc	0d' SCSI_NETWORK_WIFI_CMD_SCAN...'00
strRESULT2	asc	0d' SCSI_NETWORK_WIFI_CMD_COMPLETE...'00
strRESULT3	asc	0d' SCSI_NETWORK_WIFI_CMD_SCAN_RESULTS...'00

strIDNETWORK	asc	0d' 1. '00

strSELECTAP	asc	0d0d'Select an access point'
	asc	0d' R. Return to previous menu'00

strDOWHATNOW	asc	0d0d'Select an action'
	asc	0d' R. Return to previous menu'
	asc	0d' 1. Connect to the access point'0d00

strTHEKEY	asc	0d'Enter the key to connect: '00

strCONNECTING	asc	0d0d'Connecting to the access point...'00
strPRESSAKEY	asc	0d'Press a key.'00

idNETWORK	ds	2
offsetNETWORK	ds	2
nbTRIES	ds	2	; number of tries before we cancel

*--- The wifi_join_request

theSSID	ds	64
theKEY	ds	64
theCHANNEL	ds	1
thePADDING	ds	1

*-----------------------------------------------
* TOOLBOX
*-----------------------------------------------

LEN_CMD_TOOLBOX	=	10

*--- Code

doTOOLBOX	pha
	pha
	lda	#^commandBUFF
	pha
	_HexIt
	PullLong	strTOOLBOXHIGH

	pha
	pha
	lda	#commandBUFF
	pha
	_HexIt
	PullLong	strTOOLBOXLOW

	PushLong	#strTOOLBOX
	_WriteCString

*---

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"r"
	beq	doTOOLBOX0
	cmp	#"R"
	bne	doTOOLBOX1
doTOOLBOX0	jmp	deviceMENU	; or even 0 to exit
doTOOLBOX1	cmp	#"0"
	bcc	]lp
	cmp	#"9"
	bcc	doTOOLBOX2
	beq	doTOOLBOX2
	cmp	#"A"+1
	bcs	]lp
	cmp	#"A"
	beq	doTOOLBOX1OK
	cmp	#"a"
	bne	]lp

doTOOLBOX1OK	lda	#"9"+1	; for call $DA
doTOOLBOX2	sec		; call the routines
	sbc	#"0"
	asl
	tax
	lda	ptrTOOLBOX,x
	sta	doTOOLBOX3+1
doTOOLBOX3	jsr	$bdbd
	jmp	doTOOLBOX

ptrTOOLBOX	da	toolboxD0	; $D0
	da	toolboxD1	; $D1
	da	toolboxD2	; $D2
	da	toolboxD3	; $D3
	da	toolboxD4	; $D4
	da	toolboxD5	; $D5
	da	toolboxD6	; $D6
	da	toolboxD7	; $D7
	da	toolboxD8	; $D8
	da	toolboxD9	; $D9
	da	toolboxDA	; $DA

*--- Data

strTOOLBOX	asc	0d'Toolbox commands ($'
strTOOLBOXHIGH	asc	'0000'
strTOOLBOXLOW	asc	'0000)'0d
	asc	' R. Return to previous menu'0d
	asc	' 0. $D0 - List files'0d
	asc	' 1. $D1 - Get file'0d
	asc	' 2. $D2 - Count files'0d
	asc	' 3. $D3 - Send file prep'0d
	asc	' 4. $D4 - Send file'0d
	asc	' 5. $D5 - Send file end'0d
	asc	' 6. $D6 - Toggle debug'0d
	asc	' 7. $D7 - List CDs'0d
	asc	' 8. $D8 - Set next CD'0d
	asc	' 9. $D9 - Metadata'0d
	asc	' A. $DA - Count CDs'0d
	dfb	00	  

*-------------------------------
* A SIMPLE RTS
*-------------------------------

toolboxRTS	rts

*-------------------------------
* $D0 - BLUESCSI_TOOLBOX_LIST_FILES
*-------------------------------

toolboxD0

*--- Print the header

listFILES	jsr	getFILECOUNT	; First, get number of entries

	PushLong	#strTOOLBOXD0
	_WriteCString

	jsr	getWORKINGDIRECTORY

*--- Do the command
	
	jsr	initCOMMANDDATA	; Then, get list

	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD0,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_LIST_FILES
	jsr	statusCALL	; a status command

*--- Set pointer / Alternate entry for LIST_CDS

listFILES_ALT	lda	#commandBUFF	; made a 24-bit pointer
	sta	dpFROM	; even if the buffer is
	lda	#^commandBUFF	; here. For portability
	sta	dpFROM+2

	stz	theINDEX	; reset index
	
	lda	theNBENTRIES	; check if we have entries
	bne	listFILES_LOOP	; in the folder
	
	PushLong	#strNOFILES	; no, exit
	_WriteCString
	jmp	listFILES_END

*--- Init structure

listFILES_LOOP	sep	#$20	; clear entry
	ldx	#DATA_IN
	lda	#' '
]lp	sta	|$0000,x
	inx
	cpx	#DATA_OUT
	bcc	]lp
	rep	#$20

*--- Set the file index

	lda	[dpFROM]
	and	#$ff
	jsr	listFILES_HEXIT
	sty	strINDEX
	
*--- Set the file type
	
	ldy	#iTYPE
	lda	[dpFROM],y
	and	#$ff
	cmp	#TYPE_FOLDER+1	; 0 and 1 only
	bcs	listFILES_1
	asl
	asl
	tax
	lda	strTHETYPE,x
	sta	strTYPE
	lda	strTHETYPE+2,x
	sta	strTYPE+2

*--- Set the file name

listFILES_1	ldy	#iNAME
	sep	#$20
]lp	lda	[dpFROM],y
	beq	listFILES_2
	sta	strNAME,y
	iny
	cpy	#MAX_FILE_LEN
	bcc	]lp

listFILES_2	rep	#$20

*--- Set the file size

	ldy	#iSIZE
	lda	[dpFROM],y
	xba
	jsr	listFILES_HEXIT
	stx	strSIZE
	sty	strSIZE+2

	ldy	#iSIZE+2
	lda	[dpFROM],y
	xba
	jsr	listFILES_HEXIT
	stx	strSIZE+4
	sty	strSIZE+6

	ldy	#iSIZE+4
	lda	[dpFROM],y
	and	#$ff
	jsr	listFILES_HEXIT
	sty	strSIZE+8
	
*--- Output the string

	PushLong	#strFILEENTRY
	_WriteCString
	
*--- Next file entry

listFILES_9	lda	dpFROM	; prepare pointer
	clc		; to next entry
	adc	#ENTRY_SIZE
	sta	dpFROM
	lda	dpFROM+2
	adc	#0
	sta	dpFROM+2
	
	inc	theINDEX	; check index
	lda	theINDEX
	cmp	theNBENTRIES
	bcs	listFILES_END	; exit
	jmp	listFILES_LOOP	; or continue

listFILES_END	lda	#FALSE	; shall I skip wait?
	tax
	cmp	skipWAIT
	stx	skipWAIT	; always reset
	beq	listFILES_WAIT	; no
	rts		; yes
listFILES_WAIT	jmp	waitKEY

*--- Code

listFILES_HEXIT	pha		; from a byte to a string
	pha
	pha		; <= here, really
	_HexIt
	plx
	ply
	rts

*--- Data

scsiTOOLBOXD0	dfb	BLUESCSI_TOOLBOX_LIST_FILES
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD0	asc	0d'LIST_FILES ($D0)'0d00
strNOFILES	asc	0d'> No entries found.'00

strTHETYPE	asc	'Dir File'	; File Directory

strFILEENTRY	asc	0d
DATA_IN
strINDEX	ds	3	;  3  2 + space
strTYPE	ds	5	;  8  4 + space
strNAME	ds	33	; 41 32 + space
strSIZE	ds	10	; 52 10
DATA_OUT			; 62
	dfb	0
	
*-------------------------------
* $D1 - BLUESCSI_TOOLBOX_GET_FILE
*-------------------------------

toolboxD1	lda	#TRUE
	sta	skipWAIT

	jsr	listFILES

	lda	#FALSE
	sta	skipWAIT

*--- Ask for the file index

	PushLong	#strTOOLBOXD1
	_WriteCString
	
	PushWord	#0
	PushLong	#strFILEINDEX
	PushWord	#2
	PushWord	#chrRETURN2
	PushWord	#1
	_ReadLine
	pla
	bne	toolboxD1_1
	rts

*--- Set the file index in the SCSI command

toolboxD1_1	pha
	PushLong	#strFILEINDEX
	PushWord	#2
	_Hex2Int
	
	lda	1,s
	sep	#$20
	sta	scsiTOOLBOXD1+1
	rep	#$20

*--- Now get the file size from the buffer

	plx		; index
	lda	#0	; offset
]lp	cpx	#0
	beq	toolboxD1_2
	clc
	adc	#ENTRY_SIZE	; +40
	dex
	bra	]lp	; loop

*--- Tell the size in bytes

toolboxD1_2	tax		; get the filesize
	lda	commandBUFF+36,x
	xba		; but skip 8 bytes
	sta	theFILESIZE+2
	pha
	lda	commandBUFF+38,x
	xba
	sta	theFILESIZE
	pha
	PushLong	#strTELLSIZE2
	PushWord	#8
	_Long2Hex
	
	PushLong	#strTELLSIZE
	_WriteCString

*--- Tell the size in blocks

	lda	theFILESIZE	; make it +4095
	clc
	adc	#4095
	sta	theNBBLOCKS
	lda	theFILESIZE+2
	adc	#0
	sta	theNBBLOCKS+2

	ldx	#12	; 2^12 = 4096
]lp	lsr	theNBBLOCKS+2	; /2
	ror	theNBBLOCKS
	dex
	bne	]lp	; we have the number of blocks

	PushLong	theNBBLOCKS
	PushLong	#strTELLBLOCK2
	PushWord	#8
	_Long2Hex
	
	PushLong	#strTELLBLOCK
	_WriteCString

*--- Prepare the read

	stz	theINDEX	; reset index

	lda	ptrBUFFER	; set pointer
	sta	dpFROM
	lda	ptrBUFFER+2
	sta	dpFROM+2

	ldy	#0	; clear the destination buffer
	tya
]lp	sta	[dpFROM],y
	iny
	iny
	bne	]lp

*--- Now read the file (limit is 64K)

	stz	scsiTOOLBOXD1+2	; block offset high is 0
	sep	#$20	; (it is a test app only)
	stz	scsiTOOLBOXD1+6	; block count is 0
	rep	#$20	; meaning, read 1 block

toolboxD1_3	lda	theINDEX	; block offset low
	xba
	sta	scsiTOOLBOXD1+4

	jsr	execGETFILE	; read a block

	PushWord	#chrPOINT
	_WriteChar
	
	ldy	#0	; copy 4096 bytes
]lp	lda	commandBUFF,y
	sta	[dpFROM],y
	iny
	iny
	cpy	#SIZE_BLOCK
	bcc	]lp

	lda	dpFROM
	clc
	adc	#SIZE_BLOCK
	sta	dpFROM
	lda	dpFROM+2
	adc	#0
	sta	dpFROM+2
	
	inc	theINDEX
	lda	theINDEX
	cmp	#16	; 65536/4096
	bcs	toolboxD1_4
	cmp	theNBBLOCKS
	bcc	toolboxD1_3	; or loop

*--- And tell the world...

toolboxD1_4	PushLong	#strTOOLBOXD1END
	_WriteCString
	jmp	waitKEY

*--- Back to the original command to execute
	
execGETFILE	jsr	initCOMMANDDATA

	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD1,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_GET_FILE
	jmp	statusCALL	; a status command

*--- Data

scsiTOOLBOXD1	dfb	BLUESCSI_TOOLBOX_GET_FILE
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD1	asc	0d'GET_FILE ($D1) - Enter file index to get'0d
	asc	'> '00

strTOOLBOXD1END	asc	0d'> Read finished. Check buffer at $'
strBUFFERHIGH	asc	'0000'
strBUFFERLOW	asc	'0000'00

strFILEINDEX	ds	2

strTELLSIZE	asc	0d'File size in bytes is $'
strTELLSIZE2	asc	'00000000'00

strTELLBLOCK	asc	0d'File size in 4096-byte blocks is $'
strTELLBLOCK2	asc	'00000000'00

*-------------------------------
* $D2 - BLUESCSI_TOOLBOX_COUNT_FILES
*-------------------------------

toolboxD2	PushLong	#strTOOLBOXD2
	_WriteCString

	jsr	getFILECOUNT

	PushLong	#strCOUNTFILES
	_WriteCString
	
	lda	theNBENTRIES
	jsr	showDECIMAL
	jmp	waitKEY

*--- Execute command

getFILECOUNT	jsr	initCOMMANDDATA

	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD2,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_COUNT_FILES
	jsr	statusCALL	; a status command
	
	lda	commandBUFF
	and	#$ff
	sta	theNBENTRIES
	rts

*--- Data

scsiTOOLBOXD2	dfb	BLUESCSI_TOOLBOX_COUNT_FILES
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD2	asc	0d'COUNT_FILES ($D2)'0d00
strCOUNTFILES	asc	' Number of files: '00

*-------------------------------
* $D3 - BLUESCSI_TOOLBOX_SEND_FILE_PREP
* $D4 - BLUESCSI_TOOLBOX_SEND_FILE
* $D5 - BLUESCSI_TOOLBOX_SEND_FILE_END
*-------------------------------

toolboxD3
toolboxD4
toolboxD5	lda	#TRUE
	sta	skipWAIT

	jsr	listFILES

	lda	#FALSE
	sta	skipWAIT

*--- Ask for the filename to create

	ldx	#MAX_FILE_LEN-1
	sep	#$20
]lp	stz	strFILENAMED3,x
	dex
	bpl	]lp
	rep	#$20
	
	PushLong	#strTOOLBOXD3
	_WriteCString
	
	PushWord	#0
	PushLong	#strFILENAMED3
	PushWord	#MAX_FILE_LEN
	PushWord	#chrRETURN2
	PushWord	#1
	_ReadLine
	pla
	bne	toolboxD3_1
	rts

*--- Create the file

toolboxD3_1	jsr	initCOMMANDDATA

	ldx	#MAX_FILE_LEN-1	; move file name to destination
	sep	#$20
]lp	lda	strFILENAMED3,x
	and	#%0111_1111
	sta	commandBUFF,x
	dex
	bpl	]lp
	rep	#$20

	PushLong	#strTOOLBOXD3_1
	_WriteCString
	
	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD3,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_SEND_FILE_PREP
	jsr	controlCALL	; a control command

*--- Write the file (old mode)

toolboxD4_1	jsr	initCOMMANDDATA

	ldal	VERTCNT	; file size
	xba
	sta	scsiTOOLBOXD4+1

	ldx	#0	; fill in the buffer
]lp	sta	commandBUFF,x	; with usefuless data
	inc
	inx
	inx
	bne	]lp

	PushLong	#strTOOLBOXD4_1
	_WriteCString
	
	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD4,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_SEND_FILE
	jsr	controlCALL	; a control command

*--- Close the file

toolboxD5_1	jsr	initCOMMANDDATA

	PushLong	#strTOOLBOXD5_1
	_WriteCString
	
	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD5,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_SEND_FILE_END
	jsr	controlCALL	; a control command
	
	PushLong	#strTOOLBOXD5_2
	_WriteCString
	jmp	waitKEY

*--- Data

scsiTOOLBOXD3	dfb	BLUESCSI_TOOLBOX_SEND_FILE_PREP
	hex	00,00,00,00,00,00,00,00,00

scsiTOOLBOXD4	dfb	BLUESCSI_TOOLBOX_SEND_FILE
	hex	00,00,00,00,00,00,00,00,00

scsiTOOLBOXD5	dfb	BLUESCSI_TOOLBOX_SEND_FILE_END
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD3	asc	0d0d'SEND_FILE ($D3/$D4/$D5) - Enter file name to create'0d
	asc	'> '00

strFILENAMED3	ds	MAX_FILE_LEN

strTOOLBOXD3_1	asc	0d' > Creating file entry.'00
strTOOLBOXD4_1	asc	0d' > Writing file to SD card.'00
strTOOLBOXD5_1	asc	0d' > Closing file.'00
strTOOLBOXD5_2	asc	0d' > Write finished.'00

*-------------------------------
* $D6 - BLUESCSI_TOOLBOX_TOGGLE_DEBUG
*-------------------------------

toolboxD6	jsr	initCOMMANDDATA

toolboxD6_loop	jsr	toolboxD6_3	; first, get debug status

	PushLong	#strTOOLBOXD6
	_WriteCString

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"r"
	beq	toolboxD61
	cmp	#"R"
	bne	toolboxD62
toolboxD61	jmp	doTOOLBOX	; or even 0 to exit
toolboxD62	cmp	#"1"
	bcc	]lp
	cmp	#"2"+1
	bcs	]lp

	sec		; call the routines
	sbc	#"1"
	asl
	tax
	lda	subTOOLBOXD6,x
	sta	toolboxD63+1
toolboxD63	jsr	$bdbd
	jmp	toolboxD6_loop	; always update status

subTOOLBOXD6	da	toolboxD6_1	; Set debug on
	da	toolboxD6_2	; Set debug off
	da	toolboxD6_3	; Get debug status

*---------------
* SET DEBUG ON
*---------------

toolboxD6_1	sep	#$20
	lda	#TOOLBOX_SUBCMD_DEBUG_SET_STATUS
	sta	scsiTOOLBOXD6+1
	lda	#TOOLBOX_SUBCMD_DEBUG_ON
	sta	scsiTOOLBOXD6+2
	rep	#$20
	
	jsr	execD6
	rts

*---------------
* SET DEBUG OFF
*---------------

toolboxD6_2	sep	#$20
	lda	#TOOLBOX_SUBCMD_DEBUG_SET_STATUS
	sta	scsiTOOLBOXD6+1
	lda	#TOOLBOX_SUBCMD_DEBUG_OFF
	sta	scsiTOOLBOXD6+2
	rep	#$20
	
	jsr	execD6
	rts

*---------------
* GET DEBUG STATUS
*---------------

toolboxD6_3	sep	#$20
	lda	#TOOLBOX_SUBCMD_DEBUG_GET_STATUS
	sta	scsiTOOLBOXD6+1
	stz	scsiTOOLBOXD6+2
	rep	#$20
	
	jsr	execD6

	lda	commandBUFF
	pha		; from a byte to a string
	pha
	pha		; <= here, really
	_HexIt

	lda	#'  '	; empty string by default
	sta	strDEBUGSTATUS

	pla		; we don't use
	pla
	sta	strDEBUGSTATUS
	rts

*---------------
* EXEC COMMAND
*---------------

execD6	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD6,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_TOGGLE_DEBUG
	jmp	statusCALL	; a status command

*--- Data

scsiTOOLBOXD6	dfb	BLUESCSI_TOOLBOX_TOGGLE_DEBUG
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD6	asc	0d'TOGGLE_DEBUG ($D6)'0d
	asc	' R. Return to previous menu'0d
	asc	' 1. Set debug on'0d
	asc	' 2. Set debug off'0d
	asc	' >> Debug status is : $'
strDEBUGSTATUS	asc	'00'0d00
	
*-------------------------------
* $D7 - BLUESCSI_TOOLBOX_LIST_CDS
*-------------------------------

toolboxD7	jsr	getCDCOUNT	; First, get number of entries

	jsr	initCOMMANDDATA	; Then, get the list

	PushLong	#strTOOLBOXD7
	_WriteCString
	
	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD7,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_LIST_CDS
	jsr	statusCALL	; a status command

	jmp	listFILES_ALT	; and list files

*--- Data

scsiTOOLBOXD7	dfb	BLUESCSI_TOOLBOX_LIST_CDS
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD7	asc	0d'LIST_CDS ($D7)'0d00

*-------------------------------
* $D8 - BLUESCSI_TOOLBOX_SET_NEXT_CD
*-------------------------------

toolboxD8	lda	#TRUE
	sta	skipWAIT

	jsr	toolboxD7	; list all CDs

	lda	#FALSE
	sta	skipWAIT

*--- Ask for the CD index

	PushLong	#strTOOLBOXD8
	_WriteCString
	
	PushWord	#0
	PushLong	#strFILEINDEX
	PushWord	#2
	PushWord	#chrRETURN2
	PushWord	#1
	_ReadLine
	pla
	bne	toolboxD8_1
	rts

*--- Set the file index in the SCSI command

toolboxD8_1	pha
	PushLong	#strFILEINDEX
	PushWord	#2
	_Hex2Int
	pla
	bcc	toolboxD8_2
	rts

toolboxD8_2	sep	#$20
	sta	scsiTOOLBOXD8+1
	rep	#$20

*--- Now, set the next CD

	jsr	initCOMMANDDATA

	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD8,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_SET_NEXT_CD
	jsr	controlCALL	; a control command

	PushLong	#strTOOLBOXD8_E	; exit gracefully
	_WriteCString
	jmp	waitKEY

*--- Data

scsiTOOLBOXD8	dfb	BLUESCSI_TOOLBOX_SET_NEXT_CD
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD8	asc	0d'SET_NEXT_CD ($D8) - Enter file index to select new CD'0d
	asc	'> '00

strTOOLBOXD8_E	asc	0d'> Command executed. It does nothing under GS/OS!'00

*-------------------------------
* $D9 - BLUESCSI_TOOLBOX_METADATA
*-------------------------------

toolboxD9	jsr	initCOMMANDDATA

	PushLong	#strTOOLBOXD9
	_WriteCString

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"r"
	beq	toolboxD91
	cmp	#"R"
	bne	toolboxD92
toolboxD91	jmp	doTOOLBOX	; or even 0 to exit
toolboxD92	cmp	#"0"
	bcc	]lp
	cmp	#"3"+1
	bcs	]lp

	sec		; call the routines
	sbc	#"0"
	asl
	tax
	lda	subTOOLBOXD9,x
	sta	toolboxD93+1
toolboxD93	jsr	$bdbd
	jmp	toolboxD9

subTOOLBOXD9	da	toolboxD9_0	; list devices
	da	toolboxD9_1	; get capabilities
	da	toolboxD9_2	; set working directory
	da	toolboxD9_3	; get working directory

*---------------
* LIST_DEVICES
*---------------

toolboxD9_0	sep	#$20
	lda	#TOOLBOX_SUBCMD_LIST_DEVICES
	sta	scsiTOOLBOXD9+1
	rep	#$20
	
	jsr	execD9_STATUS

	PushLong	#strLISTDEVICES
	_WriteCString

*--- Show results

	stz	theINDEX
	
]lp	PushLong	#strCFG
	_WriteCString
	
	lda	theINDEX
	jsr	showDECIMAL
	
	PushLong	#strCFG_SEP
	_WriteCString
	
	ldx	theINDEX
	lda	commandBUFF,x
	and	#$ff
	cmp	#$ff
	beq	toolboxD9_0NO
	asl
	tax
	pea	^strCFG00
	lda	tblCFG,x
	pha
	_WriteCString

toolboxD9_0L	inc	theINDEX
	lda	theINDEX
	cmp	#MAX_SCSI_ID
	bcc	]lp
	jmp	waitKEY

toolboxD9_0NO	PushLong	#strNODEVICE
	_WriteCString
	jmp	toolboxD9_0L
	
*--- Data

strLISTDEVICES	asc	0d'List devices:'00
strCFG	asc	0d' ID '00
strCFG_SEP	asc	' - '00

tblCFG	da	strCFG00,strCFG01,strCFG02,strCFG03,
	da	strCFG04,strCFG05,strCFG06,strCFG07

strCFG00	asc	'Fixed disk'00
strCFG01	asc	'Removable disk'00
strCFG02	asc	'Optical disc'00
strCFG03	asc	'Floppy disk'00
strCFG04	asc	'Magneto-optical disk'00
strCFG05	asc	'Sequential access media (tape)'00
strCFG06	asc	'Network interface (DaynaPORT)'00
strCFG07	asc	'ZIP100 disk'00
strNODEVICE	asc	'No device'00

*---------------
* GET CAPABILITIES
*---------------

NB_BYTES	=	8

toolboxD9_1	sep	#$20
	lda	#TOOLBOX_SUBCMD_GET_CAPABILITIES
	sta	scsiTOOLBOXD9+1
	lda	#NB_BYTES
	sta	scsiTOOLBOXD9+8
	rep	#$20
	
	jsr	execD9_STATUS

*--- Show results

* Byte 0 - API Version

	PushLong	#strAPIVERSION
	_WriteCString

	lda	commandBUFF
	jsr	showBYTE

* Byte 1 - Capability Flags

	PushLong	#strCAPABILITY
	_WriteCString
	
* Byte 1 Bit 0 - CAP_LARGE_TRANSFERS

	PushLong	#strBIT0
	_WriteCString

	lda	commandBUFF+1
	and	#%00000000_00000001
	jsr	toolboxD9_BIT

* Byte 1 Bit 1 - CAP_LARGE_SEND

	PushLong	#strBIT1
	_WriteCString
	
	lda	commandBUFF+1
	and	#%00000000_00000010
	jsr	toolboxD9_BIT

* Byte 1 Bit 2 - CAP_SET_WORKING_DIR

	PushLong	#strBIT2
	_WriteCString

	lda	commandBUFF+1
	and	#%00000000_00000100
	jsr	toolboxD9_BIT
	jmp	waitKEY

*--- Print Supported/Not supported

toolboxD9_BIT	cmp	#0
	bne	toolboxD9_BITOK

	PushLong	#strNOTSUPPORTED
	_WriteCString
	rts

toolboxD9_BITOK	PushLong	#strSUPPORTED
	_WriteCString
	rts

*--- Data

strAPIVERSION	asc	0d' API version: $'00
strCAPABILITY	asc	0d' Capability flags:'00
strBIT0	asc	0d'  CAP_LARGE_TRANSFERTS: '00
strBIT1	asc	0d'  CAP_LARGE_SEND: '00
strBIT2	asc	0d'  CAP_SET_WORKING_DIR: '00

strSUPPORTED	asc	'Supported'00
strNOTSUPPORTED	asc	'Not supported'00

*---------------
* SET WORKING DIRECTORY
*---------------

MAX_SET_WD	=	64

toolboxD9_2	sep	#$20
	lda	#TOOLBOX_SUBCMD_SET_WORKING_DIR
	sta	scsiTOOLBOXD9+1
	lda	#MAX_SET_WD
	sta	scsiTOOLBOXD9+8
	rep	#$20

	PushLong	#strSETWD
	_WriteCString

* Enter the path of the directory

	PushWord	#0
	PushLong	#theWORKINGDIR
	PushWord	#MAX_SET_WD
	PushWord	#chrRETURN2
	PushWord	#1
	_ReadLine
	pla
	bne	toolboxD9_21
	rts

* Rewrite the path (bit 7) and save it into the buffer

toolboxD9_21	ldx	#MAX_SET_WD-1
	sep	#$20
]lp	lda	theWORKINGDIR,x
	and	#%0111_1111
	sta	commandBUFF,x
	dex
	bpl	]lp
	rep	#$20

	jsr	execD9_CONTROL
	jmp	waitKEY

*---

strSETWD	asc	0d'Set working directory:'0d
	asc	'> '00

theWORKINGDIR	ds	MAX_SET_WD

*---------------
* GET WORKING DIRECTORY
*---------------

MAX_GET_WD	=	128

getWORKINGDIRECTORY
	jsr	initCOMMANDDATA

toolboxD9_3	sep	#$20
	lda	#TOOLBOX_SUBCMD_GET_WORKING_DIR
	sta	scsiTOOLBOXD9+1
	lda	#MAX_GET_WD
	sta	scsiTOOLBOXD9+8
	rep	#$20
	
	jsr	execD9_STATUS

	PushLong	#strGETWD
	_WriteCString

	PushLong	#commandBUFF
	_WriteCString
	rts

*---

strGETWD	asc	0d'Working directory:'
	asc	0d' '00

*---------------
* EXEC COMMAND
*---------------

execD9_STATUS	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD9,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_METADATA
	jmp	statusCALL	; a status command

*---

execD9_CONTROL	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXD9,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_METADATA
	jmp	controlCALL	; a control command

*--- Data

scsiTOOLBOXD9	dfb	BLUESCSI_TOOLBOX_METADATA
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXD9	asc	0d'METADATA ($D9)'0d
	asc	' R. Return to previous menu'0d
	asc	' 0. List devices'0d
	asc	' 1. Get capabilities'0d
	asc	' 2. Set working directory'0d
	asc	' 3. Get working directory'0d00

*-------------------------------
* $DA - BLUESCSI_TOOLBOX_COUNT_CDS
*-------------------------------

toolboxDA	PushLong	#strTOOLBOXDA
	_WriteCString
	
	jsr	getCDCOUNT

	PushLong	#strCOUNTCDS
	_WriteCString

	lda	commandBUFF
	jsr	showDECIMAL
	jmp	waitKEY

*--- Code

getCDCOUNT	jsr	initCOMMANDDATA

	ldx	#LEN_CMD_TOOLBOX-2
]lp	lda	scsiTOOLBOXDA,x
	sta	commandDATA,x
	dex
	dex
	bpl	]lp

	lda	#dcBLUESCSI_TOOLBOX_COUNT_CDS
	jsr	statusCALL	; a status command

	lda	commandBUFF
	and	#$ff
	sta	theNBENTRIES
	rts
	
*--- Data

scsiTOOLBOXDA	dfb	BLUESCSI_TOOLBOX_COUNT_CDS
	hex	00,00,00,00,00,00,00,00,00

strTOOLBOXDA	asc	0d'COUNT_CDS ($DA)'0d00
strCOUNTCDS	asc	' Number of CDs: '00

*-----------------------------------------------
* SCSI ROUTINES
*-----------------------------------------------

initCOMMANDDATA			; clear SCSI command buffer
	ldx	#12-2
]lp	stz	commandDATA,x
	dex
	dex
	bpl	]lp
	  
	ldx	#SIZE_DATA-2	; clear the buffer as well
]lp	stz	commandBUFF,x
	dex
	dex
	bpl	]lp
	rts

*---

initSTATUSDATA
	ldx	#12-2	; clear SCSI status buffer
]lp	stz	statusDATA,x
	dex
	dex
	bpl	]lp
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
* Uses the DStatus parm buffer

statusCALL2       sta	proSTATUS+4	; SCSI driver command
                  sep	#$20	; SCSI commands are 8-bit
                  sta	statusDATA	; SCSI command
                  rep	#$20

                  jsl	GSOS	; call it
                  dw	$202d
                  adrl	proSTATUS
                  bra	showERR

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

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Display in string offset
* A: offset in
* X: nb of chars to print
* offset from commandBUFF

showCTEXT	stx	showCTEXT1+1	; limit
	ldy	#0	; index
	tax		; offset
]lp	lda	commandBUFF,x	; get buffer
	and	#$ff
	beq	showCTEXT2	; exit if 0
	phy
	phx
	pha
	_WriteChar		; output char
	plx
	inx
	ply
	iny
showCTEXT1	cpy	#0	; next char until limit
	bcc	]lp

showCTEXT2	rts

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

*---------- Display N bytes
* X: number of bytes
* A: offset from commandBUFF

showMAC	stx	showMAC1+1	; len
	tax
	clc
	adc	showMAC1+1	; + offset
	sta	showMAC1+1	; = end
	
	stz	fgDEUXPOINTS	; n'affiche pas les premiers deux points
	
]lp	phx

	lda	fgDEUXPOINTS
	beq	showMAC0

	PushWord	#chrDEUXPOINTS
	_WriteChar

showMAC0	plx
	phx
	lda	commandBUFF,x
	jsr	showBYTE

	lda	#1
	sta	fgDEUXPOINTS	; we want a separator

	plx
	inx
showMAC1	cpx	#8	; number of bytes to print
	bcc	]lp
	rts

*--- Data

fgDEUXPOINTS	ds	2

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

strlMYAPP	strl	'1/BlueSCSI'

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

devINFO           dw        $0032	; buffer size
devINFO1          db        $00		; length
devINFO2          db        $00
devINFO3          ds        $30		; data

proSTATUS         dw        5		; 00 pcount
                  ds        2		; 02 device num
                  dw        $8000	; 04 status/control code
                  adrl      statusLIST	; 06 status list
                  adrl      SIZE_DATA	; 0A request count
                  ds        4		; 0E transfer count

statusLIST        ds        2		; always 0000
statusDATA        hex       00		; 00
                  hex       00		; 01
                  hex       00		; 02
                  hex       00		; 03
                  hex       00		; 04
                  hex       00		; 05
                  hex       00		; 06
                  hex       00		; 07
                  hex       00		; 08
                  hex       00		; 09
                  hex       00		; 10
                  hex       00		; 11
                  adrl      statusBUFF
statusBUFF        ds        SIZE_DATA	; more than 1024

proCONTROL        dw        5		; 00 pcount
                  ds        2		; 02 device num
                  dw        $8000	; 04 status/control code
                  adrl      controlLIST	; 06 status list
                  adrl      SIZE_DATA	; 0A request count
                  ds        4		; 0E transfer count

controlLIST       ds        2		; always 0000
commandDATA       hex       00		; 00
                  hex       00		; 01
                  hex       00		; 02
                  hex       00		; 03
                  hex       00		; 04
                  hex       00		; 05
                  hex       00		; 06
                  hex       00		; 07
                  hex       00		; 08
                  hex       00		; 09
                  hex       00  	; 10
                  hex       00		; 11
commandPTR        adrl      commandBUFF
commandBUFF       ds        SIZE_DATA	; more than 1024

*-------------------------------
* BLUESCSI DATA
*-------------------------------

BlueSCSIVendorPage
	dfb	$31
	dfb	42
	asc	'BlueSCSI is the BEST '
	asc	'STOLEN FROM BLUESCSI'00

*-------------------------------
* DATA
*-------------------------------

appID	ds	2
myID	ds	2

myDP	ds	2
ptrBUFFER	ds	4
haBUFFER	ds	4
