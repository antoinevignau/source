*
* Slow/Fast Speed
*

	mx	%11
	lst	off

	use	4/Misc.Macs
	use	4/Util.Macs

*----------------------------

systemSpeed	=	$20	; index in BRAM (0: color, 1: mono)

TRUE	=	1
FALSE	=	0

CYAREG	=	$c036
IDROUTINE	=	$fe1f

*----------------------------
* Force slow speed

	mx	%11
	
setSLOWSPEED	sec		; are we on a IIgs?
	jsr	IDROUTINE
	bcc	IIgs	; yes
	rts

IIgs	clc		; full 16-bit
	xce
	rep	#$30

	PushWord	#0	; get BRAM entry for speed
	PushWord	#systemSpeed
	_ReadBParam
	pla
	sta	bramSPEED	; save current value

	PushWord	#FALSE	; we force slow speed
	PushWord	#systemSpeed
	_WriteBParam

	sep	#$20
	ldal	CYAREG
	sta	firmSPEED
	and	#%0111_1111
	stal	CYAREG
	
exitNOW	sec
	xce
	sep	#$30
	rts

*----------------------------
* Restore speed

	mx	%11
	
restoreSPEED	sec		; are we on a IIgs?
	jsr	IDROUTINE
	bcc	IIgs2	; yes
	rts

IIgs2	clc		; full 16-bit
	xce
	rep	#$30

	PushWord	bramSPEED	; we restore the speed
	PushWord	#systemSpeed
	_WriteBParam

	sep	#$20
	lda	firmSPEED
	stal	CYAREG
	
	sec
	xce
	sep	#$30
	rts

*----------------------------

bramSPEED	ds	2
firmSPEED	ds	1
