*
* NTP Routines
*
* (c) 2025, Brutal Deluxe Software
* Antoine Vignau & Olivier Zardini
*

*--------------------------------------

	mx	%00
	
stopMIDI	lda	fgMIDI
	bne	stopMIDI99

	_NTPShutDown
	
	PushWord	#222	; unload NTP
	_UnloadOneTool
	
stopMIDI99	rts

*--------------------------------------

	mx	%00
	
initMIDI	PushWord	#222	; NTP
	PushWord	#0
	_LoadOneTool
	bcc	initMIDI2

	inc	fgMIDI
	rts
	
initMIDI2	PushWord	myID
	_NTPStartUp	; Start MidiSynth
	bcc	initMIDI3

	inc	fgMIDI
	rts

initMIDI3	PushLong	#pSEQ
	_NTPLoadOneMusic
	bcc	initMIDI4

	inc	fgMIDI
	rts

initMIDI4	PushWord	#TRUE
	_NTPPlayMusic
	bcc	initMIDI5
	
	inc	fgMIDI
	rts

initMIDI5	stz	fgMIDI	; we are good!
	rts

*--------------------------------------

doMUSIK	lda	fgMIDI	; can we play?
	bne	nozik99

	lda	fgMIDIPLAY
	eor	#1
	sta	fgMIDIPLAY
	bne	doSOUNDON
	beq	doSOUNDOFF

nozik99	rts
	
fgMIDIPLAY	ds	2	; 0- no play / 1-play

*--------------------------------------

doSOUNDON	lda	fgMIDI	; can we play?
	bne	playMUSIC99

	PushWord	#TRUE
	_NTPPlayMusic
	
playMUSIC99	rts

*--------------------------------------

doSOUNDOFF	lda	fgMIDI
	bne	stopMUSIC99

	_NTPStopMusic
	
stopMUSIC99	rts

*-----------------------------------------------
* DATA
*-----------------------------------------------
			
*--- GS/OS Strings

pSEQ	str	'@/data/anubis.ntp'

*--- Memory

ptrSEQ	ds	4

*--- Flags

fgMIDI	dw	1	; can play MIDI if 0
