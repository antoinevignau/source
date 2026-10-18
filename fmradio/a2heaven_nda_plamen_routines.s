*
* Plamen FM Radio NDA
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 2026
*

	mx	%00

* Default CHAN is $013F (319)
* 15:6 13F CHAN[9:0]  100111111
*    5   0 DIRECTMODE
*    4   0 TUNE (disable) - set to 1 to go to frequency
*  3:2  00 BAND[1:0]: 00: 87-107 MHz US/Europe	<--
*                     01: 76- 91 MHz Japan
*                     10: 76-108 MHz Worldwide
*                     11: 65- 76 MHz East Europe
*  1:0  00 SPACE[1:0] 00: 100 kHz
*                     01: 200 kHz
*                     10:  50 kHz	<--
*                     11:  25 kHz
*
* Band = 0, frequency = channel spacing (kHz) * CHAN + 87 MHz
* Band = 1, frequency = channel spacing (kHz) * CHAN + 76 MHz
* Band = 2, frequency = channel spacing (kHz) * CHAN + 76 MHz
* Band = 3, frequency = channel spacing (kHz) * CHAN + 65 MHz

**************************************************
*
*                   Radio Constants
*
**************************************************

RADIO_REG_2            equ   $02
RADIO_REG_3            equ   $03
RADIO_REG_4            equ   $04
RADIO_REG_5            equ   $05
RADIO_REG_6            equ   $06
RADIO_REG_7            equ   $07

RADIO_REG_A            equ   $0A
RADIO_REG_B            equ   $0B
RADIO_REG_C            equ   $0C
RADIO_REG_D            equ   $0D
RADIO_REG_E            equ   $0E
RADIO_REG_F            equ   $0F

R2_AUDIO_OUTPUT        equ   $8000
R2_MUTE_DISABLE        equ   $4000
R2_MONO_SELECT         equ   $2000
R2_BASS_BOOST          equ   $1000
R2_CLOCK_CAL           equ   $0800
R2_RCLK_DIRECT         equ   $0400
R2_SEEK_UP             equ   $0200
R2_SEEK_ENABLE         equ   $0100
R2_SEEK_NO_WRAP        equ   $0080
R2_CLOCK_MODE          equ   $0070
R2_CLOCK_MODE_32K      equ   $0000
R2_CLOCK_MODE_12M      equ   $0010
R2_CLOCK_MODE_13M      equ   $0020
R2_CLOCK_MODE_19M      equ   $0030
R2_CLOCK_MODE_24M      equ   $0050
R2_CLOCK_MODE_26M      equ   $0060
R2_CLOCK_MODE_38M      equ   $0070
R2_RDS_ENABLE          equ   $0008
R2_NEW_METHOD          equ   $0004
R2_SOFT_RESET          equ   $0002
R2_ENABLE              equ   $0001
R2_DISABLE	=	$0000	; ** new AV **

R3_CHANNEL             equ   $FFC0
R3_DIRECT_MODE         equ   $0020
R3_TUNE_ENABLE         equ   $0010
R3_BAND                equ   $000C
R3_BAND_US_EU          equ   $0000
R3_BAND_JP             equ   $0004
R3_BAND_WORLD          equ   $0008
R3_BAND_E_EU           equ   $000C
R3_CHAN_SPACING        equ   $0003
R3_CHAN_SPACE_100K     equ   $0000
R3_CHAN_SPACE_200K     equ   $0001
R3_CHAN_SPACE_50K      equ   $0002
R3_CHAN_SPACE_25K      equ   $0003

R4_SEEK_TUNE_IE        equ   $4000
R4_DE_EMPHASIS_50      equ   $0800
R4_SOFT_MUTE_ENABLE    equ   $0200
R4_AFC_DISABLE         equ   $0100
R4_I2S_ENABLE          equ   $0040
R4_GPIO3               equ   $0030
R4_GPIO2               equ   $000C
R4_GPIO1               equ   $0003

R5_INTERRUPT_MODE      equ   $8000
R5_SNR_THRESHOLD       equ   $0800
R5_LNA_PORT            equ   $0080
R5_VOLUME              equ   $000F

RA_RDS_READY           equ   $8000
RA_TUNE_COMPLETE       equ   $4000
RA_SEEK_FAIL           equ   $2000
RA_RDS_SYNC            equ   $1000
RA_RDS_BLK_E           equ   $0800
RA_STEREO              equ   $0400
RA_CHANNEL             equ   $03FF

RB_RSSI                equ   $FE00
RB_IS_STATION          equ   $0100
RB_RDS_BLOCK_E         equ   $0010
RB_RDS_ERR             equ   $000F

RDS_GROUP              equ   $F800
RDS_GROUP_A0           equ   $0000
RDS_GROUP_A2           equ   $2000
RDS_GROUP_A4           equ   $4000
RDS_GROUP_A10          equ   $A000
RDS_GROUP_B0           equ   $0800

REGS_00L               equ   REGS+0
REGS_00H               equ   REGS+1
REGS_01L               equ   REGS+2
REGS_01H               equ   REGS+3
REGS_02L               equ   REGS+4
REGS_02H               equ   REGS+5
REGS_03L               equ   REGS+6
REGS_03H               equ   REGS+7
REGS_04L               equ   REGS+8
REGS_04H               equ   REGS+9
REGS_05L               equ   REGS+10
REGS_05H               equ   REGS+11
REGS_06L               equ   REGS+12
REGS_06H               equ   REGS+13
REGS_07L               equ   REGS+14
REGS_07H               equ   REGS+15
REGS_08L               equ   REGS+16
REGS_08H               equ   REGS+17
REGS_09L               equ   REGS+18
REGS_09H               equ   REGS+19
REGS_0AL               equ   REGS+20
REGS_0AH               equ   REGS+21
REGS_0BL               equ   REGS+22
REGS_0BH               equ   REGS+23
REGS_0CL               equ   REGS+24
REGS_0CH               equ   REGS+25
REGS_0DL               equ   REGS+26
REGS_0DH               equ   REGS+27
REGS_0EL               equ   REGS+28
REGS_0EH               equ   REGS+29
REGS_0FL               equ   REGS+30
REGS_0FH               equ   REGS+31

SPKR	=	$c030

**************************************************
*
*                   I2C Constants
*
**************************************************

********************** Define I2C Address *******

I2C_DATA_WRITE         equ   #$22
I2C_DATA_READ          equ   #$23

I2C_2402_WRITE         equ   #$A0
I2C_2402_READ          equ   #$A1

OPTIONS_OFFSET         equ   #64

TEXT_VIEW              equ   TRUE
DLR_VIEW               equ   FALSE

OPTION_ISMUTED         equ   OPTIONS_OFFSET + 0
OPTION_ISSOFTMUTE      equ   OPTIONS_OFFSET + 1
OPTION_ISMONOFORCED    equ   OPTIONS_OFFSET + 2
OPTION_ISBASSBOOST     equ   OPTIONS_OFFSET + 3
OPTION_ISRDSENABLED    equ   OPTIONS_OFFSET + 4
OPTION_VOLUME          equ   OPTIONS_OFFSET + 5
OPTION_CURRENTPRESET   equ   OPTIONS_OFFSET + 6
OPTION_BAND            equ   OPTIONS_OFFSET + 7
OPTION_CHANNELSPACING  equ   OPTIONS_OFFSET + 8
OPTION_UI_TYPE       equ   OPTIONS_OFFSET + 9

CYAREG	=	$e1c036	; ** new AV **

C_SCL_L	=	$E1C088	; ** new AV **
C_SCL_H	=	$E1C089
C_SDA_L	=	$E1C08A
C_SDA_H	=	$E1C08B
C_SDA_R	=	$E1C08C

LED_STEREO	=	$E1C08E
LED_TUNED	=	$E1C08F

*----------------------------
* Antoine's equates
*----------------------------

baseFREQ	=	$0358	; (-)10.7 MHz
NB_RETRY	=	8

*----------------------------
* GET DEVICE INFO
*----------------------------

plamen_getINFO	stz	SlotNr	; no card by default
	
	ldx	#$100	; slot * $100
	ldy	#1	; slot 1
]lp	ldal	$e1c0f7,x
	cmp	strID
	bne	next_slot
	ldal	$e1c0f9,x
	cmp	strID+2
	bne	next_slot
	ldal	$e1c0fb,x
	cmp	strID+4
	bne	next_slot
	ldal	$e1c0fd,x
	cmp	strID+6
	beq	found_card

next_slot	txa
	clc
	adc	#$100
	tax
	iny
	cpy	#8
	bcc	]lp
	sec
	rts

found_card	tya		; 1 -> $10
	asl		; 2 -> $20
	asl
	asl
	asl
	sta	SlotNr
	clc
	rts

*--- Data

strID	asc	'][RADIO'00

*----------------------------
* PRINT RDS TEXT
*----------------------------

plamen_printRDS
	sep	#$30
	lda	STATE_ISRDSENABLED
	bne	ppRDS_1
	
	ldy	#8	; clear station name
	lda	#'-'
]lp	sta	STATE_STATIONNAME,y
	dey
	bpl	]lp

ppRDS_1	rep	#$30	; draw it

	PushLong	#rectRDS
	PushLong	#whitePATTERN
	_FillRect

	PushWord	#20
	PushWord	#50
	_MoveTo

	PushLong	#STATE_STATIONNAME
	_DrawCString
	rts

*---

rectRDS	dw	40,20,50,169

*----------------------------
* DISPLAY FREQUENCY
*----------------------------

plamen_printFREQUENCY
	sep	#$30
	jsr	INT2DEC
	rep	#$30

	lda	STR_FREQ	; is it a new freq?
	cmp	OLD_FREQ
	bne	ppf_refresh
	lda	STR_FREQ+2
	cmp	OLD_FREQ+2
	bne	ppf_refresh
	lda	STR_FREQ+4
	cmp	OLD_FREQ+4
	bne	ppf_refresh
	rts		; no, exit
	
*
* Font: LED.24 font, ID#32671, from BRCC Font #4 disk
*

yFREQUENCY	=	27	; was 30

ppf_refresh	stz	theINDEX

	PushLong	#rectFREQUENCY
	PushLong	#whitePATTERN
	_FillRect

	PushWord #$1800
	PushWord #32671		; LED.24
	PushWord #0
	_InstallFont

]lp	ldy	theINDEX
	lda	xFREQUENCY,y
	and	#$ff
	tax		; the x-coord

	lda	STR_FREQ,y	; the digit
	sta	OLD_FREQ,y	; save for later
	and	#$ff
	cmp	#10	; space, skip
	beq	printF2

	ora	#'0'
	pha		; save char
	cmp	#'1'
	bne	printF1

	txa		; slide digit 1 to the right
	clc
	adc	#10	; add 10 to the x-coord
	tax
	
printF1	phx		; set xy-coords
	PushWord	#yFREQUENCY
	_MoveTo
	
	_DrawChar		; draw the char
	
printF2	lda	theINDEX
	cmp	#2	; did we print the unité?
	bne	printF3	; no, skip
	
	PushWord	#100	; yes, print the separator
	PushWord	#yFREQUENCY
	_MoveTo
	PushWord	#'.'
	_DrawChar
	
printF3	inc	theINDEX
	lda	theINDEX
	cmp	#5
	bcc	]lp

	PushWord #$0800
	PushWord #65534		; Shaston.8
	PushWord #0
	_InstallFont

	rts

*---

rectFREQUENCY	dw	2,20,32,169
xFREQUENCY	dfb	10,40,70,110,140	; put the dot at 100

theINDEX	ds	2

*********************************************************************
*********************************************************************
********************* EVERYTHING BELOW IS 8-BIT *********************
*********************************************************************
*********************************************************************

****************************************
* Radio DLR                            *
*                                      *
* A2Heaven                             *
* 12-03-2026                           *
****************************************

	mx	%11	; ** new AV **

**************************************************
*
* Macros
*
**************************************************


mov                    mac
                       lda   #<]2                ; Lo Byte
                       sta   ]1L
                       lda   #>]2                ; Hi Byte
                       sta   ]1H
                       <<<


set                    mac
                       do    ]2 / $FF            ; if (]2 > $FF) then ...
                       lda   ]1H
                       ora   #>]2
                       sta   ]1H
                       else
                       lda   ]1L
                       ora   #<]2
                       sta   ]1L
                       fin
                       <<<

clr                    mac
                       do    ]2 / $FF            ; if (]2 > $FF) then ...
                       lda   ]1H
                       and   #>]2  ! $FFFF
                       sta   ]1H
                       else
                       lda   ]1L
                       and   #<]2  ! $FFFF
                       sta   ]1L
                       fin
                       <<<

sbi                    mac
                       ora   #>]1
                       <<<

cbi                    mac
                       and   #>]1 ! $FFFF
                       <<<

*----------------------------
* SET TO 1MHz
*----------------------------

slowSPEED	tax
	ldal	CYAREG	; switch to 1MHz
	sta	saveSPEED
	and	#%0111_1111
	stal	CYAREG
	txa
	rts

*----------------------------
* RESTORE SPEED
*----------------------------

fastSPEED	tax
	lda	saveSPEED
	stal	CYAREG
	txa
	rts

*---

saveSPEED	ds	1

**************************************************
*                Handle Key Tune Up              *
**************************************************

HandleKeyTuneUp
	jsr	GetFreqAndChannSpacing	; in A is ChnnelSpacing
	clc			; Add Current Freq with ChannelSpacing
	adc	PARAM_L
	sta	PARAM_L
	bcc	:NoCarrySet
	inc	PARAM_H
:NoCarrySet	jmp	CarrySet:

**************************************************
*                Handle Key Tune Down            *
**************************************************

HandleKeyTuneDown
	jsr	GetFreqAndChannSpacing	; in A is ChnnelSpacing
	eor	#$FF		; Subtract Current Freq with ChannelSpacing
	sec
	adc	PARAM_L
	sta	PARAM_L
	bcs	CarrySet:
	dec	PARAM_H
CarrySet:	jmp	RADIO_TUNE_TO
	
**************************************************
*                Handle Key Exit                 *
**************************************************

HandleKeyExit
	lda	STATE_CURRENTPRESET
	ldy	OPTION_CURRENTPRESET
	jsr	SaveOption

	lda	STATE_CURRENTPRESET
	jmp	SavePreset                      
	
************************************************
*                                              *
*                  Save Option                 *
*                                              *
************************************************

LoadOption
	sty	I2CDATA_ADDR	; A -> Value ,  Y -> Option Address
	jmp	ReadFrom2402

************************************************
*                                              *
*                  Save Option                 *
*                                              *
************************************************

SaveOption
	sty	I2CDATA_ADDR	; A -> Value ,  Y -> Option Address
	jmp	WriteTo2402

************************************************
*                                              *
*                  Save Preset                 *
*                                              *
************************************************

SavePreset
	asl
	sta	I2CDATA_ADDR
	lda	STATE_FREQ_L
	jsr	WriteTo2402
	inc	I2CDATA_ADDR
	lda	STATE_FREQ_H
	jmp	WriteTo2402

************************************************
*                                              *
*                  Load Preset                 *
*                                              *
************************************************

LoadPreset
	asl
	sta	I2CDATA_ADDR
	jsr	ReadFrom2402
	sta	STATE_FREQ_L
	sta	PARAM_L
	inc	I2CDATA_ADDR
	jsr	ReadFrom2402
	sta	STATE_FREQ_H
	sta	PARAM_H
	rts

************************************************
*                                              *
*              Load Saved Data                 *
*                                              *
************************************************

LoadSavedData

;OPTION_ISMUTED         equ   OPTIONS_OFFSET + 0
;OPTION_ISSOFTMUTE      equ   OPTIONS_OFFSET + 1
;OPTION_ISMONOFORCED    equ   OPTIONS_OFFSET + 2
;OPTION_ISBASSBOOST     equ   OPTIONS_OFFSET + 3
;OPTION_ISRDSENABLED    equ   OPTIONS_OFFSET + 4
;OPTION_VOLUME          equ   OPTIONS_OFFSET + 5
;OPTION_CURRENTPRESET   equ   OPTIONS_OFFSET + 6
;OPTION_BAND            equ   OPTIONS_OFFSET + 7
;OPTION_CHANNELSPACING  equ   OPTIONS_OFFSET + 8
	
	ldy	OPTION_ISMUTED
	jsr	LoadOption
	jsr	RADIO_SET_MUTE

	ldy	OPTION_ISSOFTMUTE
	jsr	LoadOption
	jsr	RADIO_SET_SOFTMUTE

	ldy	OPTION_ISMONOFORCED
	jsr	LoadOption
	jsr	RADIO_SET_FORCEMONO

	ldy	OPTION_ISBASSBOOST
	jsr	LoadOption
	jsr	RADIO_SET_BASSBOOST

	ldy	OPTION_ISRDSENABLED
	jsr	LoadOption
	sta	STATE_ISRDSENABLED

	ldy	OPTION_VOLUME
	jsr	LoadOption
	jsr	RADIO_SET_VOLUME

	ldy	OPTION_BAND
	jsr	LoadOption
	jsr	RADIO_SET_BAND

	ldy	OPTION_CHANNELSPACING
	jsr	LoadOption
	jsr	RADIO_SET_CHANSPACING

	jsr	GetBandFreqInterval

	ldy	OPTION_CURRENTPRESET
	jsr	LoadOption
	sta	STATE_CURRENTPRESET

	jsr	LoadPreset
	jmp	RADIO_TUNE_TO

*************** GetFreqAndChannSpacing ***********

GetFreqAndChannSpacing
	lda	STATE_FREQ_L
	sta	PARAM_L
	lda	STATE_FREQ_H
	sta	PARAM_H
	jmp	GetChannelSpacing

********************** Get Band FreqInterval ************************

GetBandFreqInterval
	lda	REGS_03L
	and	#R3_BAND
	lsr
	lsr
	tay
	lda	FREQ_INTEVAL_FROM_L,Y
	sta	VAL_FROM
	lda	FREQ_INTEVAL_FROM_H,Y
	sta	VAL_FROM+1

	lda	FREQ_INTEVAL_TO_L,Y
	sta	VAL_TO
	lda	FREQ_INTEVAL_TO_H,Y
	sta	VAL_TO+1
	rts

FREQ_INTEVAL_FROM_L    dfb   #<8700,#<7600,#<7600,#<6500
FREQ_INTEVAL_FROM_H    dfb   #>8700,#>7600,#>7600,#>6500

FREQ_INTEVAL_TO_L      dfb   #<10800,#<9100,#<10800,#<7600
FREQ_INTEVAL_TO_H      dfb   #>10800,#>9100,#>10800,#>7600

********************** Get Space FreqInterval ************************
* 00 = 100 kHz
* 01 = 200 kHz
* 10 = 50kHz
* 11 = 25KHz   ! Not Implemented !!!!!!

GetChannelSpacing
	lda	REGS_03L
GetChannelSpacingA
	and	#R3_CHAN_SPACING
	tay
	lda	CHANNEL_SPACING,Y
	rts

CHANNEL_SPACING
	dfb	#10,#20,#5,#5

*SetChannelSpacing
*	and	#R3_CHAN_SPACING
*	lda	REGS_03L
*	rts

CalcPointerPosition
		; Calculate Denominator: DEN = VAL_TO - VAL_FROM
	sec
	lda	VAL_TO
	sbc	VAL_FROM
	sta	DEN
	lda	VAL_TO+1
	sbc	VAL_FROM+1
	sta	DEN+1
	
		; Check if DEN == 0 to prevent division by zero
	lda	DEN
	ora	DEN+1
	bne	CalcNum
	lda	#0
* sta	RESULT
	rts
	
CalcNum
		; Calculate Numerator Base: ORIG_N = CUR_VAL - VAL_FROM
	sec
	lda	CUR_VAL
	sbc	VAL_FROM
	sta	ORIG_N
	sta	NUM
	lda	CUR_VAL+1
	sbc	VAL_FROM+1
	sta	ORIG_N+1
	sta	NUM+1
	   	
		; If CUR_VAL < VAL_FROM (Carry clear after SBC), return 0
	bcs	ClampMax
	lda	#0
* sta	RESULT
	rts
	
ClampMax
		; Clear high byte of our 24-bit NUM variable
	lda	#0
	sta	NUM+2
		; Multiply NUM by 32 (Shift Left 5 times)
	ldx	#5
ShiftLoop	asl	NUM
	rol	NUM+1
	rol	NUM+2
	dex
	bne	ShiftLoop

		; Subtract ORIG_N to effectively multiply by 31: NUM = NUM - ORIG_N
	sec
	lda	NUM
	sbc	ORIG_N
	sta	NUM
	lda	NUM+1
	sbc	ORIG_N+1
	sta	NUM+1
	lda	NUM+2
	sbc	#0
	sta	NUM+2

		; Divide 24-bit NUM by 16-bit DEN
		; Initialize 16-bit Remainder (REM) to 0
	lda	#0
	sta	REM
	sta	REM+1

		; 24-bit Restoring Division Loop
	ldx	#24
DivLoop	asl	NUM
	rol	NUM+1
	rol	NUM+2
	rol	REM
	rol	REM+1
	
		; Compare REM against DEN
	sec
	lda	REM
	sbc	DEN
	tay		; Save low byte of subtraction
	lda	REM+1
	sbc	DEN+1
	bcc	DivSkip	; If REM < DEN, skip the subtraction
	
		; REM >= DEN: apply subtraction and set quotient bit
	sty	REM
	sta	REM+1
	inc	NUM	; Set lowest bit of quotient
	
DivSkip	dex
	bne	DivLoop

		; The quotient safely lands in the lowest bits of NUM.
		; Safety Check: Clamp to 31 if CUR_VAL exceeded VAL_TO
	lda	NUM+1
	ora	NUM+2
	bne	Cap31	; If upper bytes aren't 0, it's way over 31
	lda	NUM
	cmp	#32
	bcc	SaveRes	; If < 32, it is safe

Cap31	lda	#31
SaveRes
*	sta	RESULT
	rts

************************************************
*                                              *
*                 WriteTo2402                  *
*                                              *
************************************************

WriteTo2402
	pha
	jsr	slowSPEED	; ** new AV **
	jsr	I2CStart
	lda	#I2C_2402_WRITE	; Send i2c dev addr and write bit
	jsr	I2CWriteByte
	
	lda	I2CDATA_ADDR
	jsr	I2CWriteByte	; Send Address
	
	pla
	jsr	I2CWriteByte	; Write Byte
	jsr	I2CStop
	jsr	Delay10
	jmp	fastSPEED	; ** new AV **

************************************************
*                                              *
*                   ReadFrom2402               *
*                                              *
************************************************

ReadFrom2402
	jsr	slowSPEED	; ** new AV **

	jsr	I2CStart
	lda	#I2C_2402_WRITE	; Send i2c dev addr and write bit
	jsr	I2CWriteByte
	
	lda	I2CDATA_ADDR
	jsr	I2CWriteByte	; Send Address
	
	jsr	I2CStart
	lda	#I2C_2402_READ	; Send i2c dev addr and Read bit
	jsr	I2CWriteByte
	
	jsr	I2CReadByte
	pha
	jsr	I2CSendNack
	jsr	I2CStop
	pla
	jmp	fastSPEED	; ** new AV **

* ========================================================================
* Dummy Delay Stubs
* ========================================================================

; Clock: 1.023 MHz

; --- 10ms Base ---
Delay10
	pha		; [Stack: A]
	txa
	pha		; [Stack: A, X]

	ldx	#$14
:outer	lda	#$64
:inner	sec
	sbc	#$01
	bne	:inner
	dex
	bne	:outer

	pla		; Pull X-value into A
	tax		; [Stack: A] -> X restored
	pla		; [Stack: empty] -> A restored
	rts

; --- 500ms ---
Delay10xYms

:loop	jsr	Delay10
	dey
	bne	:loop
	rts

; ------------------------------------------------------------------
; Variable Allocations (Zero Page is faster, but standard memory here)
; ------------------------------------------------------------------
VAL_FROM               ds    2
VAL_TO                 ds    2
CUR_VAL                ds    2
DEN                    ds    2
ORIG_N                 ds    2
NUM                    ds    3                   ; 24-bit Numerator
REM                    ds    2                   ; 16-bit Remainder

* ===============================================================
* FUNCTION: RADIO_INIT
* ===============================================================

RADIO_INIT
	
*    ***************  Clear REGS *********************
	ldy	#$00
	lda	#$00
LOOP_CLEAR_REGS
	sta	REGS,Y
	iny
	cpy	#32
	bne	LOOP_CLEAR_REGS

	lda	#TRUE
	sta	STATE_ISENABLED
	sta	STATE_UITYPE	; ** new AV **

	lda	#FALSE
	sta	STATE_ISMUTED
	sta	STATE_ISSOFTMUTE
	sta	STATE_ISMONOFORCED
	sta	STATE_ISBASSBOOST
	sta	STATE_SENSITIVITY

	lda	#$0F
	sta	STATE_VOLUME

	mov	REGS_02; R2_SOFT_RESET . R2_ENABLE

	mov	REGS_03; R3_BAND_US_EU . R3_CHAN_SPACE_100K
	mov	REGS_04; R4_DE_EMPHASIS_50

	mov	REGS_05; R5_INTERRUPT_MODE . R5_SNR_THRESHOLD . R5_LNA_PORT
	lda	REGS_05L
	ora	STATE_VOLUME
	sta	REGS_05L
	lda	#$00
	sta	REGS_06H
	sta	REGS_06L
	sta	REGS_07H
	sta	REGS_07L

* ******************** Update Physical registers
	lda	#2
LOOP_INIT_SEND	pha
	jsr	SEND_REGISTER
	pla
	adc	#$01
	cmp	#$08
	bne	LOOP_INIT_SEND

	mov	REGS_02; R2_AUDIO_OUTPUT . R2_MUTE_DISABLE . R2_RDS_ENABLE . R2_NEW_METHOD . R2_ENABLE
	lda	#$02
	jsr	SEND_REGISTER
                       
	set	REGS_03; #R3_TUNE_ENABLE
	lda	#$03
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_RESET_STATION
* ===============================================================

RADIO_RESET_STATION
	lda	#TRUE
	sta	STATE_ISTUNING
	lda	#FALSE
	sta	STATE_ISTUNEDCHAN
	sta	STATE_HASSTATNAME
CLEAR_STATION_NAME
	ldy	#0                       
	lda	#$00	; Space character
	ldx	STATE_UITYPE
	beq	LOOP_RESET_NAME
	lda	#' '
LOOP_RESET_NAME
	sta	STATE_STATIONNAME,Y
	iny
	cpy	#8+1	; ** new av **
	bne	LOOP_RESET_NAME
	rts

* ===============================================================
* FUNCTION: RADIO_SET_VOLUME
* ===============================================================

RADIO_SET_VOLUME
	sta	STATE_VOLUME
	and	#$0F
	sta	TEMP_L
	lda	REGS_05L
	and	#$F0
	ora	TEMP_L
	sta	REGS_05L
	lda	#$05
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SET_BASSBOOST
* ===============================================================

RADIO_SET_BASSBOOST
	sta	STATE_ISBASSBOOST
	cmp	#TRUE
	beq	BASS_TRUE
BASS_FALSE
	clr	REGS_02; R2_BASS_BOOST
	jmp	BASS_DONE
BASS_TRUE
	set	REGS_02; R2_BASS_BOOST
BASS_DONE
	lda	#$02
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SET_MONOSTEREO
* ===============================================================

RADIO_SET_MONOSTEREO
	sta	STATE_ISMONOFORCED
	cmp	#TRUE
	beq	MONOSTEREO_TRUE
MONOSTEREO_FALSE
	clr	REGS_02; R2_MONO_SELECT
	jmp	MONOSTEREO_DONE
MONOSTEREO_TRUE
	set	REGS_02; R2_MONO_SELECT
MONOSTEREO_DONE
	lda	#$02
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SET_RDS
* ===============================================================

RADIO_SET_RDS
	sta	STATE_ISRDSENABLED
	cmp	#TRUE
	beq	RDS_TRUE
RDS_FALSE
	set	REGS_02; R2_RDS_ENABLE
	jmp	RDS_DONE
RDS_TRUE
	clr	REGS_02; R2_RDS_ENABLE
RDS_DONE
	lda	#$02
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SET_MUTE
* ===============================================================

RADIO_SET_MUTE
	sta	STATE_ISMUTED
	cmp	#TRUE
	beq	MUTE_TRUE
MUTE_FALSE
	set	REGS_02; R2_MUTE_DISABLE
	jmp	MUTE_DONE
MUTE_TRUE
	clr	REGS_02; R2_MUTE_DISABLE
MUTE_DONE
	lda	#$02
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SET_SOFTMUTE
* ===============================================================

RADIO_SET_SOFTMUTE
	sta	STATE_ISSOFTMUTE
	cmp	#TRUE
	beq	SMUTE_TRUE
SMUTE_FALSE
	clr	REGS_04; R4_SOFT_MUTE_ENABLE
	jmp	SMUTE_DONE
SMUTE_TRUE
	set	REGS_04; R4_SOFT_MUTE_ENABLE
SMUTE_DONE
	lda	#$04
	jmp	SEND_REGISTER
                       
* ===============================================================
* FUNCTION: RADIO_SET_FORCEMONO
* ===============================================================

RADIO_SET_FORCEMONO
	sta	STATE_ISMONOFORCED
	cmp	#TRUE
	beq	MONO_TRUE
MONO_FALSE                                       
	clr	REGS_02; R2_MONO_SELECT 
	jmp	MONO_DONE
MONO_TRUE
	set	REGS_02; R2_MONO_SELECT
MONO_DONE
	lda	#$02
	jmp	SEND_REGISTER
                       
* ===============================================================
* FUNCTION: RADIO_SET_CHANSPACING 
* ===============================================================

RADIO_SET_CHANSPACING 
	and	#<R3_CHAN_SPACING
	sta	TEMP_L                                              
	lda	REGS_03L                       
	and	#<R3_CHAN_SPACING ! #$FF
	ora	TEMP_L
	sta	REGS_03L                                                                     
                       
	lda	#$03
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SET_BAND
* ===============================================================

RADIO_SET_BAND
	asl
	asl
	and	#<R3_BAND 
	sta	TEMP_L                                              
	lda	REGS_03L                       
	and	#<R3_BAND  ! #$FF
	ora	TEMP_L
	sta	REGS_03L                                                                     

	lda	#$03
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SEEK_UP
* ===============================================================

RADIO_SEEK_UP
	jsr	RADIO_RESET_STATION
	set	REGS_02; R2_SEEK_UP . R2_SEEK_ENABLE
	lda	#$02
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_SEEK_DOWN
* ===============================================================

RADIO_SEEK_DOWN
	jsr	RADIO_RESET_STATION
	clr	REGS_02; R2_SEEK_UP
	set	REGS_02; R2_SEEK_ENABLE
	lda	#$02
	jmp	SEND_REGISTER

* ===============================================================
* FUNCTION: RADIO_GET_CHIPID
* ===============================================================

RADIO_GET_CHIPID
	lda	#$00	;  Chip ID register
	jmp	GET_REGISTER

* ===============================================================
* FUNCTION: RADIO_GET_FREQUENCY
* ===============================================================

RADIO_GET_FREQUENCY
                                                 ; band = regs[3] & R3_BAND;
                       lda   REGS_03L
                       and   #R3_BAND
                       sta   TEMP_H              ; Store band temporarily

                                                 ; channelSpacing = regs[3] & R3_CHAN_SPACING;
                       lda   REGS_03L
                       and   #R3_CHAN_SPACING
                       sta   TEMP_L              ; Store spacing temporarily

                                                 ; channel = regs[A] & RA_CHANNEL;
                       lda   REGS_0AL
                       sta   PARAM_L
                       lda   REGS_0AH
                       and   #$03
                       sta   PARAM_H

                                                 ; Multiply channel by spacing factor
                       lda   TEMP_L
                       cmp   #R3_CHAN_SPACE_50K
                       beq   MULT_50K
                       cmp   #R3_CHAN_SPACE_200K
                       beq   MULT_200K

MULT_100K
                       lda   #10
                       jsr   MULTIPLY_16
                       jmp   GF_ADD_BASE
MULT_50K
                       lda   #5
                       jsr   MULTIPLY_16
                       jmp   GF_ADD_BASE
MULT_200K
                       lda   #20
                       jsr   MULTIPLY_16

GF_ADD_BASE
                       lda   TEMP_H
                       cmp   #R3_BAND_US_EU
                       beq   GF_BASE_US
                       cmp   #R3_BAND_E_EU
                       beq   GF_BASE_EEU

GF_BASE_JP
                                                 ; add 7600 ($1DB0)
                       clc
                       lda   MATH_RES_L
                       adc   #$B0
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       adc   #$1D
                       sta   MATH_RES_H
                       rts
GF_BASE_EEU
                                                 ; add 6500 ($1964)
                       clc
                       lda   MATH_RES_L
                       adc   #$64
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       adc   #$19
                       sta   MATH_RES_H
                       rts
GF_BASE_US
                                                 ; add 8700 ($21FC)
                       clc
                       lda   MATH_RES_L
                       adc   #$FC
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       adc   #$21
                       sta   MATH_RES_H
:RTS
                       rts
                       
* ===============================================================
** new AV **
* FUNCTION: FROM PRESET TO A FREQUENCY
* ===============================================================

fromPRESETtoFREQUENCY
	lda   REGS_03L
	and   #R3_CHAN_SPACING
	sta   TEMP_L

	lda   REGS_03L	; band = regs[3] & R3_BAND;
	and   #R3_BAND
	cmp   #R3_BAND_US_EU
	beq   ATUNE_BAND_US
	cmp   #R3_BAND_E_EU
	beq   ATUNE_BAND_EEU
    
ATUNE_BAND_JP	sec	; frequency -= 7600 ($1DB0)
	lda   PARAM_L
	sbc   #$B0
	sta   PARAM_L
	lda   PARAM_H
	sbc   #$1D
	sta   PARAM_H
	jmp   ATUNE_DIVIDE
    
ATUNE_BAND_EEU	sec	; frequency -= 6500 ($1964)
	lda   PARAM_L
	sbc   #$64
	sta   PARAM_L
	lda   PARAM_H
	sbc   #$19
	sta   PARAM_H
	jmp   ATUNE_DIVIDE

ATUNE_BAND_US	sec	; frequency -= 8700 ($21FC)
	lda   PARAM_L
	sbc   #$FC
	sta   PARAM_L
	lda   PARAM_H
	sbc   #$21
	sta   PARAM_H

ATUNE_DIVIDE		; Divide based on Channel Spacing (in TEMP_L)
	lda   TEMP_L
	cmp   #R3_CHAN_SPACE_50K
	beq   ADIV_50K
	cmp   #R3_CHAN_SPACE_200K
	beq   ADIV_200K
    
ADIV_100K		; Divide by 10
	lda   #10
	jsr   DIVIDE_16
	jmp   ATUNE_SET_REGS
    
ADIV_50K		; Divide by 5
	lda   #5
	jsr   DIVIDE_16
	jmp   ATUNE_SET_REGS
    
ADIV_200K		; Divide by 20
	lda   #20
	jsr   DIVIDE_16

ATUNE_SET_REGS
	ldx	#6
]lp	asl	MATH_RES_L
	rol	MATH_RES_H
	dex
	bne	]lp

*--- Convert the frequency in a text string

                       ldx   #$00                ; X is both table index and STR_FREQ string index
ANEXT_PWR              ldy   #$00                ; Y will act as our DIGIT counter (0-9)

ASUB_LOOP              sec                       ; Attempt to subtract the power of 10
                       lda   MATH_RES_L
                       sbc   TBL_10_L,X
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       sbc   TBL_10_H,X
                       sta   MATH_RES_H
                       bcc   ARESTORE             ; If borrow occurred, we subtracted too much
                       iny                       ; Subtraction succeeded, increment digit count
                       bne   ASUB_LOOP            ; Unconditional branch (Y will never reach 0 here)

ARESTORE               clc                       ; Subtracted too much, add the power of 10 back
                       lda   MATH_RES_L
                       adc   TBL_10_L,X
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       adc   TBL_10_H,X
                       sta   MATH_RES_H
                                                 ; --- DIGIT EVALUATION & ZERO SUPPRESSION ---
                       tya                       ; Move digit (Y) to Accumulator
                       bne   APRINT_DIG           ; If digit > 0, always print it
                                                 ; Digit is 0. Check if we should suppress it.
                       cpx   #$00
                       beq   ASUPPRESS_Z          ; If it's the very first digit (10000s), always suppress
                                                 ; Check the previous character written to the string
                       lda   STR_FREQ-1,X
                       cmp   #' '                ; Was the previous character a space?
                       beq   ASUPPRESS_Z          ; Yes, so continue suppressing leading zeros

                                                 ; We are not suppressing, so prepare to print '0'
                       lda   #'0'                ; '0'
                       bra   ASTORE_CHR           ; Unconditional branch
ASUPPRESS_Z            lda   #' '                ; Space ' '
                       bne   ASTORE_CHR           ; Unconditional branch

APRINT_DIG             tya                       ; Bring digit back to A

ASTORE_CHR             sta   STR_FREQ,X          ; Store character in output array
                       inx                       ; Move to next string position / power of 10
                       cpx   #$04                ; Have we done 10000, 1000, 100, and 10?
                       bne   ANEXT_PWR
                       lda   MATH_RES_L
                       sta   STR_FREQ,X
	rts
 
************************************************
*                                              *
*                   Error Beep                 *
*                                              *
************************************************
                       
ErrorBeep:

                       ldx   #$50
Loop]
                       txa
                       jsr   :Beep
                       eor   #$FF
                       ;eor   #$F0
                       jsr   :Beep
                       dex
                       bne   Loop]
                       rts
:Beep
                       tay
BeepLoop]
                       dey
                       bne   BeepLoop]
                       stal  SPKR
                       rts

*****************************************************************
* FUNCTION: RADIO_TUNE_TO
* ===============================================================

RADIO_TUNE_TO
                                                 ; Check if Freq is in range FROM ... TO
                       lda   PARAM_L              
                       cmp   VAL_FROM             
                       lda   PARAM_H              
                       sbc   VAL_FROM+1           
                       bcc   ErrorBeep:          ; Exit if  (PARAM < VAL_FROM)
                                                  
                       lda   VAL_TO               
                       cmp   PARAM_L              
                       lda   VAL_TO+1             
                       sbc   PARAM_H              
                       bcc   ErrorBeep:          ; Exit if (VAL_TO < PARAM)
                       
                                                 ; channelSpacing = regs[3] & R3_CHAN_SPACING;
                       lda   REGS_03L
                       and   #R3_CHAN_SPACING
                       sta   TEMP_L
    
                                                 ; band = regs[3] & R3_BAND;
                       lda   REGS_03L
                       and   #R3_BAND
                       cmp   #R3_BAND_US_EU
                       beq   TUNE_BAND_US
                       cmp   #R3_BAND_E_EU
                       beq   TUNE_BAND_EEU
    
TUNE_BAND_JP
                                                 ; frequency -= 7600 ($1DB0)
                       sec
                       lda   PARAM_L
                       sbc   #$B0
                       sta   PARAM_L
                       lda   PARAM_H
                       sbc   #$1D
                       sta   PARAM_H
                       jmp   TUNE_DIVIDE
    
TUNE_BAND_EEU
                                                 ; frequency -= 6500 ($1964)
                       sec
                       lda   PARAM_L
                       sbc   #$64
                       sta   PARAM_L
                       lda   PARAM_H
                       sbc   #$19
                       sta   PARAM_H
                       jmp   TUNE_DIVIDE

TUNE_BAND_US
                                                 ; frequency -= 8700 ($21FC)
                       sec
                       lda   PARAM_L
                       sbc   #$FC
                       sta   PARAM_L
                       lda   PARAM_H
                       sbc   #$21
                       sta   PARAM_H

TUNE_DIVIDE
                                                 ; Divide based on Channel Spacing (in TEMP_L)
                       lda   TEMP_L
                       cmp   #R3_CHAN_SPACE_50K
                       beq   DIV_50K
                       cmp   #R3_CHAN_SPACE_200K
                       beq   DIV_200K
    
DIV_100K
                                                 ; Divide by 10
                       lda   #10
                       jsr   DIVIDE_16
                       jmp   TUNE_SET_REGS
    
DIV_50K
                                                 ; Divide by 5
                       lda   #5
                       jsr   DIVIDE_16
                       jmp   TUNE_SET_REGS
    
DIV_200K
                                                 ; Divide by 20
                       lda   #20
                       jsr   DIVIDE_16

TUNE_SET_REGS
	jsr	RADIO_RESET_STATION

	clr	REGS_03; #R3_TUNE_ENABLE                       
	lda	#03
	jsr	SEND_REGISTER

		; channel is now in MATH_RES_L, MATH_RES_H
		; Shift left 6 bits and OR with R3_TUNE_ENABLE
		; This places channel in the correct spot for R3_CHANNEL
                                                 
	ldx	#6
LOOP_TUNE_SHIFT
	asl	MATH_RES_L
	rol	MATH_RES_H
	dex
	bne	LOOP_TUNE_SHIFT
	
	lda	REGS_03L
	and	#%00111111          ; ~R3_CHANNEL
	sta	REGS_03L
	                               
	lda	MATH_RES_L
	and	#%11000000          ; R3_CHANNEL      
	ora	REGS_03L
	ora	#R3_TUNE_ENABLE
	sta	REGS_03L
	
	lda	MATH_RES_H
	sta	REGS_03H
	    
	lda	#$03
	jsr	SEND_REGISTER
	rts
 
* ***************************** HELPERS *******************************

************************************************
*                                              *
*      16-bit to Decimal String Conversion     *
*                                              *
************************************************

INT2DEC
                       ldx   #$00                ; X is both table index and STR_FREQ string index

NEXT_PWR
                       ldy   #$00                ; Y will act as our DIGIT counter (0-9)

SUB_LOOP
                       sec                       ; Attempt to subtract the power of 10
                       lda   MATH_RES_L
                       sbc   TBL_10_L,X
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       sbc   TBL_10_H,X
                       sta   MATH_RES_H
                       bcc   RESTORE             ; If borrow occurred, we subtracted too much
                       iny                       ; Subtraction succeeded, increment digit count
                       bne   SUB_LOOP            ; Unconditional branch (Y will never reach 0 here)

RESTORE
                       clc                       ; Subtracted too much, add the power of 10 back
                       lda   MATH_RES_L
                       adc   TBL_10_L,X
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       adc   TBL_10_H,X
                       sta   MATH_RES_H

                                                 ; --- DIGIT EVALUATION & ZERO SUPPRESSION ---
                       tya                       ; Move digit (Y) to Accumulator
                       bne   PRINT_DIG           ; If digit > 0, always print it

                                                 ; Digit is 0. Check if we should suppress it.
                       cpx   #$00
                       beq   SUPPRESS_Z          ; If it's the very first digit (10000s), always suppress

                                                 ; Check the previous character written to the string
                       lda   STR_FREQ-1,X
                       cmp   #10                 ; Was the previous character a space?
                       beq   SUPPRESS_Z          ; Yes, so continue suppressing leading zeros

                                                 ; We are not suppressing, so prepare to print '0'
                       lda   #$00                ; '0'
                       beq   STORE_CHR           ; Unconditional branch

SUPPRESS_Z
                       lda   #10                 ; Space ' '
                       bne   STORE_CHR           ; Unconditional branch

PRINT_DIG
                       tya                       ; Bring digit back to A

STORE_CHR
                       sta   STR_FREQ,X          ; Store character in output array
                       inx                       ; Move to next string position / power of 10
                       cpx   #$04                ; Have we done 10000, 1000, 100, and 10?
                       bne   NEXT_PWR

                                                 ; --- FINAL DIGIT (1s) ---
                                                 ; The remainder in MATH_RES_L is the 1s digit.
                                                 ; We always print this, even if it is '0'.
                       lda   MATH_RES_L
                       sta   STR_FREQ,X
                       rts

* ------------------------------------------------------------------
* Data Tables
* ------------------------------------------------------------------

TBL_10_L	dfb	$10, $E8, $64, $0A
TBL_10_H	dfb	$27, $03, $00, $00

*******************************************************************
* DIVIDE_16: Divides 16-bit (PARAM_H:PARAM_L) by 8-bit divisor in A
* Result in MATH_RES_H:MATH_RES_L
*******************************************************************

DIVIDE_16
	sta	TEMP_L	; Save Divisor
	lda	#0
	sta	MATH_REM_L
	sta	MATH_REM_H
	sta	MATH_RES_H
	sta	MATH_RES_L
	ldx	#16
DIV_LOOP
	asl	PARAM_L
	rol	PARAM_H
	rol	MATH_REM_L
	rol	MATH_REM_H
    
	lda	MATH_REM_L
	sec
	sbc	TEMP_L
	tay                       ; Save result
	lda	MATH_REM_H
	sbc	#0
	bcc	DIV_NEXT	; If < 0, skip

	sta	MATH_REM_H	; Update remainder
	sty	MATH_REM_L
	inc	PARAM_L	; Set result bit
DIV_NEXT
	dex
	bne	DIV_LOOP
    
	lda	PARAM_L
	sta	MATH_RES_L
	lda	PARAM_H
	sta	MATH_RES_H
	rts
                       
*******************************************************************
* MULTIPLY_16: Multiplies 16-bit (PARAM_H:PARAM_L) by 8-bit in A
* Result in MATH_RES_H:MATH_RES_L
*******************************************************************

MULTIPLY_16            sta   TEMP_L
                       lda   #0
                       sta   MATH_RES_H
                       sta   MATH_RES_L
                       ldx   #8
MUL_LOOP
                       lsr   TEMP_L
                       bcc   MUL_NOADD

                       clc
                       lda   MATH_RES_L
                       adc   PARAM_L
                       sta   MATH_RES_L
                       lda   MATH_RES_H
                       adc   PARAM_H
                       sta   MATH_RES_H
MUL_NOADD
                       asl   PARAM_L
                       rol   PARAM_H
                       dex
                       bne   MUL_LOOP
                       rts


* ===============================================================
* FUNCTION: RADIO_UPDATE_STATUS
* ===============================================================

RADIO_UPDATE_STATUS	
	lda	#$03	; Register 3
	jsr	GET_REGISTER
	lda	#$0A	; Register A
	jsr	GET_REGISTER
	lda	#$0B	; Register B
	jsr	GET_REGISTER
;	lda	#$0C	; Register C
;	jsr	GET_REGISTER
;	lda	#$0D	; Register D
;	jsr	GET_REGISTER
;	lda	#$0E	; Register E
;	jsr	GET_REGISTER
;	lda	#$0F	; Register F
;	jsr	GET_REGISTER

	lda	REGS_0AH	; High byte of REG_A
	and	#>RA_RDS_READY
	beq	RDSNotReady:
                       
	lda	#$0C	; Register C
	jsr	GET_REGISTER
	lda	#$0D	; Register D
	jsr	GET_REGISTER
	lda	#$0E	; Register E
	jsr	GET_REGISTER
	lda	#$0F	; Register F
	jsr	GET_REGISTER
                                             
RDSNotReady:
	lda	STATE_ISTUNING
	cmp	#TRUE
	bne	US_SKIP_TUNE_CHECK
	lda	REGS_0AH	; High byte of REG_A
	and	#>RA_TUNE_COMPLETE
	beq	US_SKIP_TUNE_CHECK
	
	clr	REGS_03; #R3_TUNE_ENABLE
	lda	#$03
	jsr	SEND_REGISTER
	
	clr	REGS_02; R2_SEEK_ENABLE
	lda	#$02
	jsr	SEND_REGISTER
	
US_SKIP_TUNE_CHECK
		; Extract Flags
	lda	REGS_0AH
	and	#>RA_RDS_READY
	beq	L1
	lda	#TRUE	; RA_RDS_READY
	bne	L2
L1	lda	#FALSE
L2	sta	STATE_HASRDSDATA

	lda	REGS_0AH
	and	#>RA_TUNE_COMPLETE
	beq	L3
	lda	#FALSE	; !TUNE_COMPLETE
	beq	L4
L3	lda	#TRUE
L4	sta	STATE_ISTUNING

	lda	REGS_0AH
	and	#>RA_SEEK_FAIL	; RA_SEEK_FAIL
	beq	L5
	lda	#TRUE
	bne	L6
L5	lda	#FALSE
L6	sta	STATE_TUNINGERR

	lda	REGS_0AH
	and	#>RA_RDS_BLK_E	; RA_RDS_BLK_E
	beq	L7
	lda	#TRUE
	bne	L8
L7	lda	#FALSE
L8	sta	STATE_HASRDSBLOCKE

	lda	REGS_0AH
	and	#>RA_STEREO	; RA_STEREO
	beq	L9
	lda	#TRUE
	bne	L10
L9	lda	#FALSE
L10	sta	STATE_ISSTEREO

		; Update Frequency
	jsr	RADIO_GET_FREQUENCY
                       
	lda	MATH_RES_L	; set to STATE_FREQ
	sta	STATE_FREQ_L
	lda	MATH_RES_H
	sta	STATE_FREQ_H

		; Signal Strength
	lda	REGS_0BH	; High byte of REG_B
	lsr
	sta	STATE_SIGNALSTR

		; Is Station
	lda	REGS_0BH
	and	#>RB_IS_STATION
	sta	STATE_ISTUNEDCHAN
	
	lda	STATE_HASRDSDATA
	cmp	#TRUE
	bne	US_END
		; RDS Block Logic
	lda	REGS_0BL
	and	#RB_RDS_ERR
	sta	STATE_RDSBLOCKERRS	; Different from FALSE !!!!
	
	lda	REGS_0BL
	and	#RB_RDS_BLOCK_E
	bne	US_HAS_BLOCK_E
	
	lda	REGS_0CL
	sta	STATE_RDSBLOCKA_L
	lda	REGS_0CH
	sta	STATE_RDSBLOCKA_H
	
	lda	REGS_0DL
	sta	STATE_RDSBLOCKB_L
	lda	REGS_0DH
	sta	STATE_RDSBLOCKB_H
	
	lda	REGS_0EL
	sta	STATE_RDSBLOCKC_L
	lda	REGS_0EH
	sta	STATE_RDSBLOCKC_H
	
	lda	REGS_0FL
	sta	STATE_RDSBLOCKD_L
	lda	REGS_0FH
	sta	STATE_RDSBLOCKD_H
	
	jsr	RADIO_DECODE_RDS
	jmp	US_END

US_HAS_BLOCK_E
	lda	REGS_0CL
	sta	STATE_RDSBLOCKE_L
	lda	REGS_0CH
	sta	STATE_RDSBLOCKE_H
US_END
	rts

* ===============================================================
* FUNCTION: RADIO_DECODE_RDS
* ===============================================================
RADIO_DECODE_RDS
	lda	STATE_RDSBLOCKB_H
	and	#>RDS_GROUP
	cmp	#>RDS_GROUP_A0
	beq	DO_RDS_DECODE
	cmp	#>RDS_GROUP_B0
	beq	DO_RDS_DECODE
	rts

DO_RDS_DECODE
	lda	STATE_RDSBLOCKB_L
	and	#$03
	asl
	sta	TEMP_L
	tax                       
	lda	STATE_RDSBLOCKD_H
	jsr	CONVERT_VALIDATE_CHR
	cmp	RDSSTATIONNAME,X
	bne	DECODE_MISMATCH_C1
	sta	STATE_STATIONNAME,X
	lda	#TRUE
	sta	STATE_HASSTATNAME
	jmp	DECODE_C2

DECODE_MISMATCH_C1
	sta	RDSSTATIONNAME,X

DECODE_C2
	inx
	lda	STATE_RDSBLOCKD_L
	jsr	CONVERT_VALIDATE_CHR
	cmp	RDSSTATIONNAME,X
	bne	DECODE_MISMATCH_C2
	sta	STATE_STATIONNAME,X
	lda	#TRUE
	sta	STATE_HASSTATNAME
	rts

DECODE_MISMATCH_C2
	sta	RDSSTATIONNAME,X
	rts

CONVERT_VALIDATE_CHR
*	ldy	STATE_UITYPE	; check is Text Mode
*	beq	DLR_MODE	; ** new AV ** the two comments
	cmp	#$20	; Compare with Space (lowest printable ASCII)
	bcc	BAD_APPLE_CHAR	; Branch if Carry Clear (A < $20)
	cmp	#$7F                 
	bcs	BAD_APPLE_CHAR
	rts

BAD_APPLE_CHAR
	lda	#' '
	rts

DLR_MODE
	cmp	#$20	; Compare with Space (lowest printable ASCII)
	bcc	BAD_CHAR	; Branch if Carry Clear (A < $20)
	sbc	#$20
	cmp	#59	; Compare with DEL (highest standard ASCII + 1)
	bcs	BAD_CHAR	; Branch if Carry Set (A >= 59)
	rts		; Character is valid, return with it in A

BAD_CHAR
	lda	#$00	; Replace garbage character with a space
	rts

* ===============================================================
* FUNCTION: SEND_REGISTER
* ===============================================================

SEND_REGISTER	pha
	jsr	slowSPEED	; ** new AV **
	jsr	I2CStart
	lda	#I2C_DATA_WRITE	; Send i2c dev addr and write bit
	jsr	I2CWriteByte
	pla
	pha
	jsr	I2CWriteByte	; Send reg Nbr
	pla
	asl
	tay
	pha
	lda	REGS+1,Y	; Write High Byte first
	jsr	I2CWriteByte
	pla
	tay
	lda	REGS,Y	; Write Low Byte next
	jsr	I2CWriteByte
	jsr	I2CStop
	jmp	fastSPEED	; ** new AV **

* ===============================================================
* FUNCTION: GET_REGISTER
* ===============================================================

GET_REGISTER	pha
	jsr	slowSPEED	; ** new AV **
	jsr	I2CStart
	lda	#I2C_DATA_WRITE	; Send i2c dev addr and write command
	jsr	I2CWriteByte
	pla
	pha
	jsr	I2CWriteByte	; Send reg Nbr

	jsr	I2CStart
	lda	#I2C_DATA_READ	; Send i2c dev addr and read command
	jsr	I2CWriteByte
	pla
	asl
	tay
	jsr	I2CReadByte
	jsr	I2CSendAck
	sta	REGS+1,Y	; Save High Byte first
	jsr	I2CReadByte
	jsr	I2CSendNack
	jsr	I2CStop
	sta	REGS,Y	; Save Low Byte next
	jmp	fastSPEED	; ** new AV **

; --- I2C Start Condition ---

I2CStart	ldx	SlotNr
	stal	C_SDA_H,x
	stal	C_SCL_H,x
	stal	C_SDA_L,x
	stal	C_SCL_L,x
	rts

; --- I2C Stop Condition ---

I2CStop	ldx	SlotNr
	stal	C_SDA_L,x
	stal	C_SCL_H,x
	stal	C_SDA_H,x
	rts

; --- Send 8 bits ---

I2CWriteByte	sta	I2C_TEMP
	ldx	SlotNr
	ldy	#$08
SBLoop	asl	I2C_TEMP
	bcs	SBHigh
	stal	C_SDA_L,x
	bcc	SBClk
SBHigh	stal	C_SDA_H,x
SBClk	stal	C_SCL_H,x
	stal	C_SCL_L,x
	dey
	bne	SBLoop
	jsr	I2CGetAck
	rts

; --- Read 8 bits ---

I2CReadByte	phy
	stal	C_SDA_H,x	; Release SDA
	ldx	SlotNr
	ldy	#$08
RBLoop	stal	C_SCL_H,x
	ldal	C_SDA_R,x	; Sample bus
	asl		; Move bit 7 to Carry
	rol	I2C_TEMP	; Shift Carry into TEMP
	stal	C_SCL_L,x
	dey
	bne	RBLoop
	ply		; restore Y
	lda	I2C_TEMP
	rts

; --- Read ACK from Slave ---

I2CGetAck	ldx	SlotNr
	stal	C_SDA_H,x	; Release SDA
	stal	C_SCL_H,x
	ldal	C_SDA_R,x	; Read SDA (0=ACK, 1=NACK)
	asl		; Put SDA state into Carry flag
	stal	C_SCL_L,x
	rts

; --- Send ACK to Slave ---

I2CSendAck	ldx	SlotNr
	stal	C_SDA_L,x
	stal	C_SCL_H,x
	stal	C_SCL_L,x
	rts

; --- Send NACK to Slave ---

I2CSendNack	ldx	SlotNr
	stal	C_SDA_H,x
	stal	C_SCL_H,x
	stal	C_SCL_L,x
	rts

	mx	%00	; ** new AV **
	
**************************************************
*
*          Variables (Program Variables)
*
**************************************************

SlotNr                 dfb	0

* bool mapped as byte ($00 = false, $FF = true)

STATE_ISENABLED        dfb	0
STATE_ISMUTED          dfb	0
STATE_ISSOFTMUTE       dfb	0
STATE_ISMONOFORCED     dfb	0
STATE_ISBASSBOOST      dfb	0
STATE_ISRDSENABLED     dfb	0

STATE_VOLUME           dfb	0
STATE_SENSITIVITY      dfb	0
STATE_CURRENTPRESET    dfb	0
STATE_BAND             dfb	0
STATE_CHANNELSPACING   dfb	0

STATE_ISTUNING         dfb	0
STATE_TUNINGCOMP       dfb	0
STATE_TUNINGERR        dfb	0
STATE_ISTUNEDCHAN      dfb	0
STATE_ISSTEREO         dfb	0
STATE_FREQ_L           dfb	0
STATE_FREQ_H           dfb	0
STATE_SIGNALSTR        dfb	0
STATE_UITYPE           dfb	0

STATE_HASRDSDATA       dfb	0
STATE_HASRDSBLOCKE     dfb	0
STATE_RDSBLOCKERRS     dfb	0
STATE_RDSBLOCKA_L      dfb	0
STATE_RDSBLOCKA_H      dfb	0
STATE_RDSBLOCKB_L      dfb	0
STATE_RDSBLOCKB_H      dfb	0
STATE_RDSBLOCKC_L      dfb	0
STATE_RDSBLOCKC_H      dfb	0
STATE_RDSBLOCKD_L      dfb	0
STATE_RDSBLOCKD_H      dfb	0
STATE_RDSBLOCKE_L      dfb	0
STATE_RDSBLOCKE_H      dfb	0

STATE_HASSTATNAME      dfb	0
STATE_STATIONNAME      ds	9+1	; for a trailing \0
RDSSTATIONNAME         ds	8

* regs array (16 words = 32 bytes)
* Low byte first, High byte second

REGS                   ds	32

* variables for passing parameters and math

PARAM_L                dfb	0
PARAM_H                dfb	0
TEMP_L                 dfb	0
TEMP_H                 dfb	0
MATH_REM_L             dfb	0
MATH_REM_H             dfb	0
STR_FREQ	ds	6
OLD_FREQ	ds	6	; ** new AV **
DISPLAY_COUNTER        dfb	0
OLD_POINTER_POS        dfb	0
KEY_HOLD_COUNTER       dfb	0
SETUP_ITEM_INDEX       dfb	0
APPLETYPE              dfb	0                   ; Zero if Apple //e

I2CDATA_ADDR           dfb	0
I2C_TEMP               dfb	0
MATH_RES_L             dfb	0
MATH_RES_H             dfb	0
