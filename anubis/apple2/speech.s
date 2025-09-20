*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	mx	%00

	use	4/Female.Macs
	use	4/Male.Macs
	use	4/Speech.Macs

*-------------------------------
* EQUATES
*-------------------------------

speechVOLUME	=	9
speechSPEED	=	3
speechPITCH	=	3
speechSTART	=	1

*-------------------------------
* MACROS
*-------------------------------

@SPEECH	mac
	ldx	#^]1
	ldy	#]1
	jsr	TALK
	<<<

*-------------------------------
* CODE
*-------------------------------

initSPEECH	PushWord	#50	; Male Toolset
	PushWord	#0
	_LoadOneTool
	bcc	SPEECH_1
	inc	fgSPEECH
	rts

SPEECH_1	PushWord	#51	; Female Toolset
	PushWord	#0
	_LoadOneTool
	bcc	SPEECH_2
	inc	fgSPEECH
	rts

SPEECH_2	PushWord	#52	; Speech Manager
	PushWord	#0
	_LoadOneTool
	bcc	SPEECH_3
	inc	fgSPEECH
	rts

SPEECH_3	PushWord	myID
	_SpeechStartUp
	bcc	SPEECH_4
	inc	fgSPEECH
	rts
	
SPEECH_4	_MaleStartUp
	bcc	SPEECH_5
	inc	fgSPEECH
	rts

SPEECH_5	_FemaleStartUp
	bcc	SPEECH_6
	inc	fgSPEECH
SPEECH_6	rts

*-------------------------------
* NO MORE SPEECH
*-------------------------------

stopSPEECH	lda	fgSPEECH
	beq	SPEECH_QUIT_1
	rts

SPEECH_QUIT_1	_SpeechShutDown
	_FemaleShutDown
	_MaleShutDown
	stz	fgSPEECH
	rts

*-------------------------------
* TALK TO US
*-------------------------------

TALK	lda	fgSPEECH
	beq	TALK_1
	rts

TALK_1	pha		
	phx
	phy
	PushLong	#strPHONETICS
	PushWord	#speechSTART
	_Parse
	pla

	PushWord	#speechVOLUME
	PushWord	#speechSPEED
	PushWord	#speechPITCH
	PushLong	#strPHONETICS

	ldal	RDVBLBAR	; Male of Female?
	and	#1
	beq	TALK_2
	_MaleSpeak
	rts
TALK_2	_FemaleSpeak
	rts

*-------------------------------
* DATA
*-------------------------------

fgSPEECH	ds	2	; non-zero means error

strPHONETICS	ds	512
