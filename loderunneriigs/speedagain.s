
	org	$1000
	lst	off
	
	clc
	xce
	rep	#$30
	
ComputeGSSpeed	lda	#16	; SHR line 16
	jsr	WaitForSpot
	stz	CGSS_Counter	; speed counter

	lda	#32	; SHR line 32
	jsr	WaitForSpot
	
]lp	inc	CGSS_Counter
	lda	#64	; SHR line 64
	jsr	WaitForSpot
	bcs	]lp

	ldx	#0	; 0 = 1 MHz Apple IIgs
	lda	CGSS_Counter
	cmp	#$40
	bcc	CGSS_Code
	inx		; 1 = 2,8MHz Apple IIgs
	cmp	#$70
	bcc	CGSS_Code
	inx		; 2 = Accelerated IIgs (7-16 MHz)
	cmp	#$400
	bcc	CGSS_Code
	inx		; 3 = Full speed emulator
CGSS_Code	stx	CGSS_SpeedCode

	sec
	xce
	sep	#$30
	
	lda	#$8d
	jsr	$fded
	lda	CGSS_SpeedCode+1
	jsr	$fdda
	lda	CGSS_SpeedCode
	jsr	$fdda
	lda	#$a0
	jsr	$fded
	lda	CGSS_Counter+1
	jsr	$fdda
	lda	CGSS_Counter
	jmp	$fdda
	
*--------------

VERTCNT	=	$E0C02E

WaitForSpot	lsr
	sep	#$20
	clc
	adc	#$80
]lp	cmpl	VERTCNT
	bne	wfs_notok

	rep	#$20
	lda	#0
	rts
wfs_notok	rep	#$20
	lda	#1
	rts
*--------------

CGSS_Counter	ds	2	; 1079-0820 = Full Speed Emulator, 0108-0129 = 8Mhz 39F = 16MHz, 005B = 2,8 Mhz, 0026 = 1 Mhz
CGSS_SpeedCode	ds	2	; Speed Code : 0=1Mhz, 1=2.8Mhz, 2=Accelerator Card, 3=Emulator Unlimited
