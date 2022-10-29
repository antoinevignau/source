*
* VOC Populi
* The features of your VOC
*
* (c) 2022, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	xc
	xc
	mx	%00
	
	rel
	typ	S16
	dsk	VOCPopuli.l
	lst	off

*----------

VDNoVideoDevice	=	$2110
VDAlreadyStarted	=	$2111

vdVideoOverlay	=	1	; 1st feature
vdTextMonoOver	=	20	; Last feature

vdTrue	=	$01
vdFalse	=	$00
vdAvail	=	$01
vdNotAvail	=	$00
vdYes	=	$01
vdNo	=	$00
vdOn	=	$01
vdOff	=	$00
vdNil	=	$00

vdNone	=	$00
vdNTSC	=	$01
vdPAL	=	$02
vdSECAM	=	$04	; doc says $03
vdSNTSC	=	$08
vdSPAL	=	$10
vdSSECAM	=	$20
vdRGB60	=	$40
vdRGB50	=	$80

dpTABLE	=	$00	; DP index of the VOC table

*----------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Video.Macs

GSOS	=	$e100a8

*----------

	phk
	plb
	
	clc
	xce
	rep	#$30
	
	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID
	
	_MTStartUp
	_TextStartUp
	
	_IMStartUp

*----------

	PushWord	#$00FF
	PushWord	#$0080
	_SetInGlobals
	PushWord	#$00FF
	PushWord	#$0080
	_SetOutGlobals
	PushWord	#$00FF
	PushWord	#$0080
	_SetErrGlobals
	
	PushWord	#0
	PushLong	#3
	_SetInputDevice
	PushWord	#0
	PushLong	#3
	_SetOutputDevice
	PushWord	#0
	PushLong	#3
	_SetErrorDevice
	
	PushWord	#0
	_InitTextDev
	PushWord	#1
	_InitTextDev
	PushWord	#2
	_InitTextDev
	
*----------------------------
* DO WE HAVE A VOC?
*----------------------------

	PushWord	#33
	PushWord	#0
	_LoadOneTool
	bcc	okTOOL

	PushLong	#strTOOL
	bra	theEND

okTOOL	_VDStartUp
	bcc	mainMENU
	cmp	#VDAlreadyStarted
	beq	mainMENU

	PushLong	#strNOVOC
	
theEND	_WriteCString
	PushLong	#strINSTALL
	_WriteCString
	jsr	waitKEY
	jmp	doQUIT

*----------------------------
* MAIN MENU
*----------------------------

mainMENU
	PushWord	#$0c	; home
	_WriteChar

	PushLong	#strMAINMENU
	_WriteCString

	jsr	waitKEY
	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT
	cmp	#"1"
	bne	mainMENU
	
	jmp	showMENU

*----------------------------
* QUIT PROGRAM
*----------------------------

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

*----------------------------
* ASCII DATA
*----------------------------

strTOOL	asc	0d'Video Overlay Toolset not found!'00
strNOVOC	asc	0d'No Video Overlay card found!'00
strINSTALL	asc	0d'Please install it and come back here...'0d00

strMAINMENU	asc	0d'VOC Populi'0d
	asc	'(c) 2022, Brutal Deluxe Software'0d
	asc	' 1. Show VOC Features'0d
	asc	' Q. Quit'0d00

*----------------------------
* SEARCH MENU
*----------------------------

showMENU

* 1. Get all the features

	lda	#vdVideoOverlay
]lp	pha		; push index
	pea	$0000
	pha
	_VDGetFeatures
	ply		; get value
	
	lda	1,s	; get index
	asl
	tax
	sty	dpTABLE,x	; save value
	
	pla		; next index
	inc
	cmp	#vdTextMonoOver+1
	bcc	]lp

* 2. Show the results

	lda	#vdVideoOverlay	; from 1
]lp	pha
	asl
	tax
	pea	^tblSEL
	lda	tblSEL,x
	pha
	_WriteCString

	pla
	pha
	asl
	tax
	lda	dpTABLE,x	; get value
	jsr	(cmdSEL,x)	; show value

	pla		; next index
	inc
	cmp	#vdTextMonoOver+1	; to 20
	bcc	]lp

* 3. Wait for key

	jsr	waitKEY
	jmp	mainMENU	; loop

*--- Data
	
tblSEL	da	strSEL1
	da	strSEL1,strSEL2,strSEL3,strSEL4,strSEL5
	da	strSEL6,strSEL7,strSEL8,strSEL9,strSEL10
	da	strSEL11,strSEL12,strSEL13,strSEL14,strSEL15
	da	strSEL16,strSEL17,strSEL18,strSEL19,strSEL20

strSEL1	asc	0d'Video Overlay                  : '00
strSEL2	asc	0d'Frame grabber                  : '00
strSEL3	asc	0d'Input video standards          : '00
strSEL4	asc	0d'Output video standards         : '00
strSEL5	asc	0d'Key dissolve levels            : '00
strSEL6	asc	0d'Non-key dissolve levels        : '00
strSEL7	asc	0d'Adjust save side effect        : '00
strSEL8	asc	0d'Key color bits of significance : '00
strSEL9	asc	0d'Input hue adjustment           : '00
strSEL10	asc	0d'Input saturation adjustment    : '00
strSEL11	asc	0d'Input contrast adjustment      : '00
strSEL12	asc	0d'Input brightness adjustment    : '00
strSEL13	asc	0d'Output setup                   : '00
strSEL14	asc	0d'Output chroma filter           : '00
strSEL15	asc	0d'Pass external VBL interval     : '00
strSEL16	asc	0d'Enhanced dissolve mode         : '00
strSEL17	asc	0d'Scan line interrupts support   : '00
strSEL18	asc	0d'Graphics generator disability  : '00
strSEL19	asc	0d'Dual graphics display support  : '00
strSEL20	asc	0d'Text monochrome override       : '00
	
cmdSEL	da	cmdAVAIL
	da	cmdAVAIL,cmdAVAIL,cmdSTDS,cmdSTDS,cmdNUM
	da	cmdNUM,cmdYESNO,cmdNUM,cmdAVAIL,cmdAVAIL
	da	cmdAVAIL,cmdAVAIL,cmdAVAIL,cmdAVAIL,cmdAVAIL
	da	cmdAVAIL,cmdAVAIL,cmdAVAIL,cmdAVAIL,cmdAVAIL

*-----------------------------------

cmdAVAIL	cmp	#vdAvail
	bne	cmdNOTAVAIL

	PushLong	#strAVAIL
	_WriteCString
	rts

cmdNOTAVAIL	cmp	#vdNotAvail
	bne	cmdAVAIL99
	
	PushLong	#strNOTAVAIL
	_WriteCString

cmdAVAIL99	rts

*---

strAVAIL	asc	'Available'00
strNOTAVAIL	asc	'Not available'00

*-----------------------------------

cmdSTDS	pha
	jsr	cmdNUM
	pla
	
	ldx	#0
]lp	cmp	tblSTDSVAL,x
	beq	cmdSTDSOK

	inx
	inx
	cpx	#9*2
	bcc	]lp
	rts

cmdSTDSOK	pea	^tblSTDSSTR
	lda	tblSTDSSTR,x
	pha
	_WriteCString
	rts

*---

tblSTDSVAL	dw	vdNone,vdNTSC,vdPAL,vdSECAM,vdSNTSC
	dw	vdSPAL,vdSSECAM,vdRGB60,vdRGB50

tblSTDSSTR	da	strSTDS1,strSTDS2,strSTDS3,strSTDS4,strSTDS5
	da	strSTDS6,strSTDS7,strSTDS8,strSTDS9

strSTDS1	asc	' None'00
strSTDS2	asc	' NTSC'00
strSTDS3	asc	' PAL'00
strSTDS4	asc	' SECAM'00
strSTDS5	asc	' SNTSC'00
strSTDS6	asc	' SPAL'00
strSTDS7	asc	' SSECAM'00
strSTDS8	asc	' RGB60'00
strSTDS9	asc	' RGB50'00
	
*-----------------------------------

cmdYESNO	cmp	#vdYes
	bne	cmdNO

	PushLong	#strYES
	_WriteCString
	rts

cmdNO	cmp	#vdNo
	bne	cmdYESNO99
	
	PushLong	#strNO
	_WriteCString

cmdYESNO99	rts

*---

strYES	asc	'Yes'00
strNO	asc	'No'00

*-----------------------------------

cmdNUM	pha	; from a word to a string
	pha
	pha
	_HexIt
	PullLong	strNUM

	PushLong	#strNUM
	_WriteCString
	rts

*---

strNUM	asc	'0000'00

*-----------------------------------
* COMMANDES
*-----------------------------------

waitKEY	PushWord  #$0d
	_WriteChar
	
	PushWord  #0
	PushWord  #0                   ; don't echo char
	_ReadChar

	lda       1,s                  ; check CR
	and       #$ff                 ; of typed
	sta       1,s                  ; in char
	cmp       #$8d
	beq       waitKEY9
	
	PushWord  #$0d                 ; return
	_WriteChar

waitKEY9	pla                            ; restore entered char
	rts

*----------------------------
* DATA
*----------------------------

proQUIT           dw        2                    ; pcount
                  ds        4                    ; pathname
                  ds        2                    ; flags

*---

myID              ds        2
appID             ds        2

*--- End of code