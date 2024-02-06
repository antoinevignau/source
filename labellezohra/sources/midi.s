*
* Midi routines
*
* (c) 2020, Brutal Deluxe Software
* Antoine Vignau & Olivier Zardini
*

dpSEQ	=	$f8

seqOFFSET	=	$006
seqTEMPO	=	$18A
seqTPB	=	$190

*--------------------------------------

	mx	%00
	
stopMIDI	lda	fgMIDI
	bne	stopMIDI99

	_SoundShutDown

	PushWord	#8
	_UnloadOneTool
	
	_KillAllNotes	; Stop MidiSynth
	_MSShutDown

	PushWord	#35	; unload MidiSynth
	_UnloadOneTool
	
stopMIDI99	rts

*--------------------------------------

initMIDI	pha		; Check for AppleTalk
	_GetIRQEnable
	pla
	and	#$20
	beq	initSOUND

	inc	fgMIDI
	rts

initSOUND	PushWord	#8	; Sound Tool Set
	PushWord	#0
	_LoadOneTool
	bcc	initSOUND1
	
	inc	fgMIDI
	rts

initSOUND1	lda	myDP
	clc
	adc	#256
	pha
	_SoundStartUp
	bcc	initSOUND2
	
	inc	fgMIDI
	rts
	
initSOUND2	PushWord #%1111_1111_1111_1111	; on arrête tout pour MIDI Synth
	_FFStopSound

*---

	PushWord	#35	; MidiSynth
	PushWord	#0
	_LoadOneTool
	bcc	initMIDI2
	
	inc	fgMIDI
	rts
	
initMIDI2	_MSStartUp	; Start MidiSynth
	bcc	musicMEMORY

	inc	fgMIDI
	rts

*-------------------------------------- Now, get RAM

musicMEMORY
	PushLong	#0
	PushLong	#$10000
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrSEQ
	ldy	#2
	lda	[3],y
	sta	ptrSEQ+2
	pld
	pla
	pla
	bcc	musicMEMORY1

	inc	fgMIDI	; cannot assign memory for MIDI sequences
	rts
	
musicMEMORY1
	PushLong	#0
	PushLong	#$10000
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrBNK
	ldy	#2
	lda	[3],y
	sta	ptrBNK+2
	pld
	pla
	pla
	bcc	musicMEMORY2

	inc	fgMIDI	; cannot assign memory for MIDI sequences
	rts

musicMEMORY2
	PushLong	#0
	PushLong	#$10000
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrWAV
	ldy	#2
	lda	[3],y
	sta	ptrWAV+2
	pld
	pla
	pla
	bcc	loadWAV

	inc	fgMIDI	; cannot assign memory for MIDI sequences
	rts

*-------------------------------------- Load WAV

loadWAV
	lda	#pWAV
	sta	midiOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	midiOPEN
	sta	midiERR

	lda	midiOPEN+2
	sta	midiSETMARK+2
	sta	midiREAD+2
	sta	midiCLOSE+2

	jsl	GSOS
	dw	$2016
	adrl	midiSETMARK

	lda	ptrWAV
	sta	midiREAD+4
	lda	ptrWAV+2
	sta	midiREAD+6

	stz	midiREAD+8
	lda	#1
	sta	midiREAD+10

	jsl	GSOS
	dw	$2012
	adrl	midiREAD
	sta	midiERR

	jsl	GSOS
	dw	$2014
	adrl	midiCLOSE

	lda	midiERR	; check err
	beq	loadBNK

	inc	fgMIDI	; exit
	rts

*-------------------------------------- Load BNK

loadBNK
	lda	#pBNK	; load the MIDI bank
	ldx	ptrBNK+2
	ldy	ptrBNK
	jsr	loadGSOS

	lda	midiERR	; check err
	beq	loadSEQUENCE

	inc	fgMIDI
	rts
	
*-------------------------------------- Load Sequence

loadSEQUENCE
	lda	#pSEQ
	ldx	ptrSEQ+2
	ldy	ptrSEQ
	jsr	loadGSOS

	lda	midiERR	; check err
	beq	initMUSIC
	
	inc	fgMIDI
	rts

*-------------------------------------- Play sequence

initMUSIC
	lda	ptrSEQ
	sta	dpSEQ
	lda	ptrSEQ+2
	sta	dpSEQ+2

	_KillAllNotes

	ldy	#seqOFFSET
	lda	[dpSEQ],y
	clc
	adc	dpSEQ
	sta	seqPlayRec
	lda	#0
	adc	dpSEQ+2
	sta	seqPlayRec+2

	ldy	#seqTEMPO
	lda	[dpSEQ],y
	asl
	sec
	sbc	#10
	pha
	_SetTempo

	ldy	#seqTPB
	lda	[dpSEQ],y
	pha
	_SetBeat

*--- Toutes les pistes sont actives

	lda	ptrBNK
	clc
	adc	#$400
	sta	ptrINST
	lda	ptrBNK+2
	adc	#0
	sta	ptrINST+2

	stz	myINDEX

]lp	PushWord	myINDEX
	PushWord	#$8000
	_SetPlayTrack

	PushWord	myINDEX
	PushWord	#-1
	_TrackToChannel

	PushWord	myINDEX
	PushWord	#2
	_SetTrackOut

	PushLong	ptrINST
	PushWord	myINDEX
	_SetInstrument

	lda	ptrINST
	clc
	adc	#$120
	sta	ptrINST
	lda	ptrINST+2
	adc	#0
	sta	ptrINST+2

	inc	myINDEX
	lda	myINDEX
	cmp	#16
	bne	]lp

*---

	sei

	PushLong	ptrWAV
	PushWord	#0	; docStart
	PushWord	#0	; byteCount (=64ko)
	_WriteRamBlock

	PushLong	#callBackRec
	_SetCallBack

	PushWord	#0
	PushWord	#0
	PushLong	seqClock
	PushLong	seqPlayRec
	_Locate
	PullLong	seqPlayRec

	stz	fgMIDI	; we are good!!!
	cli		; end of the long init!
	rts
	
*--------------------------------------

doMUSIK	lda	fgMIDI		; can we play?
	bne	nozik99

	lda	fgMIDIPLAY
	eor	#1
	sta	fgMIDIPLAY
	beq	doSOUNDON
	bne	doSOUNDOFF

nozik99	rts
	
fgMIDIPLAY	ds	2

*--------------------------------------

doSOUNDON	lda	fgMIDI		; can we play?
	bne	playMUSIC99

	jsr	initMUSIC
	
	lda	#$0100		; no, let's start playing!
	sta	seqPlay
	PushLong	#seqPlayRec
	_SeqPlayer
	stz	fgLOOP
	
playMUSIC99
	rts

*--------------------------------------

doSOUNDOFF	lda	fgMIDI
	bne	stopMUSIC99

	stz	seqPlay
	PushLong	#seqPlayRec
	_SeqPlayer
	_KillAllNotes
	
stopMUSIC99	rts

*-------------------------------------- Suspend music

suspendMUSIC
	lda	fgMIDI
	ora	fgMIDIPLAY
	bne	suspendMUSIC9
	
	_MSSuspend
	
suspendMUSIC9
	rts
	
*-------------------------------------- Resume music

resumeMUSIC
	lda	fgMIDI
	ora	fgMIDIPLAY
	bne	resumeMUSIC9
	
	_MSResume
	
resumeMUSIC9
	rts
	
*--------------------------------------

checkREPLAY	lda	fgMIDI
	bne	checkREPLAY99
	
	lda	fgLOOP
	beq	checkREPLAY99
	jsr	doSOUNDON

checkREPLAY99
	rts

*--------------------------------------

replayMUSIC
	lda	#-1
	stal	fgLOOP
	rtl

fgLOOP	dw	-1

*-------------------------------------- Load a file

loadGSOS	sta	midiOPEN+4
	sty	midiREAD+4
	stx	midiREAD+6
	stz	midiERR

	jsl	GSOS
	dw	$2010
	adrl	midiOPEN
	bcs	loadGSOSERR

	lda	midiOPEN+2
	sta	midiREAD+2
	sta	midiCLOSE+2

	lda	midiEOF
	sta	midiREAD+8
	lda	midiEOF+2
	sta	midiREAD+10

	jsl	GSOS
	dw	$2012
	adrl	midiREAD
	bcs	loadGSOSERR

loadGSOS2	jsl	GSOS
	dw	$2014
	adrl	midiCLOSE
	rts

loadGSOSERR	jsr	loadGSOS2
	inc	fgMIDI
	rts

*-------------------------------------- DATA

myINDEX	ds	2

*--- GS/OS

midiERR	ds	2

midiOPEN	dw	12
	ds	2
	adrl	pSEQ
	ds	2
	ds	2
	ds	2
	ds	2
	ds	4
	ds	2
	ds	8
	ds	8
	ds	4
midiEOF	ds	4

midiREAD	dw	4
	ds	2
	ds	4
	ds	4
	ds	4

midiCLOSE	dw	1
	ds	2

midiSETMARK	dw	3
	ds	2
	ds	2
	adrl	$900       ; +$900 pour WAV

*--- GS/OS Strings

pSEQ	strl	'1/data/musiques/sequence'
pWAV	strl	'1/data/musiques/piano.Wav'
pBNK	strl	'1/data/musiques/piano.Bnk'

*--- Memory

ptrSEQ	ds	4
ptrWAV	ds	4
ptrBNK	ds	4

*--- Flags

fgMIDI	dw	1	; can play MIDI if 0

*--- Instruments

ptrINST	ds	4

*--- MidiSynth

seqPlayRec
	ds	4
	ds	4
	ds	4
	ds	4
seqPlay	ds	2	; Play
seqClock	ds	4

callBackRec	adrl	replayMUSIC	; When sequence ends !
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
	ds	4
