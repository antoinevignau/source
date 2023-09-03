*
* Essai sonore
*

	org	$1000
	lst	off

	clc
	xce
	rep	#$30
	
	sei
	sep	#$20

	ldal	$e100ca
	ora	#%0110_0000
	stal	$c03c

	lda	#0
	stal	$c03e
	stal	$c03f

	ldy	#0
]lp	lda	$2000,y
	stal	$c03d
	iny
	cpy	#$4000
	bcc	]lp

* 2. on lance le rythme en mode loop sur deux oscillos
	
	ldy	#0	; oscillos 0 & 1

	ldal	$e100ca	; volume
	and	#$0f
	stal	$c03c

	tya		; fréquence basse
	stal	$3e
	lda	#217
	stal	$c03d
	tya
	ora	#$01
	stal	$c03e
	lda	#217
	stal	$c03d

	tya		; fréquence haute
	ora	#$20
	stal	$c03e
	lda	#0
	stal	$c03d
	tya
	ora	#$21
	stal	$c03e
	lda	#0
	stal	$c03d

	tya		; volume
	ora	#$40
	stal	$c03e
	lda	#$ff
	stal	$c03d
	tya
	ora	#$41
	stal	$c03e
	lda	#$ff
	stal	$c03d

	tya		; address pointer
	ora	#$80
	stal	$c03e
	lda	#0
	stal	$c03d
	tya
	ora	#$81
	stal	$c03e
	lda	#0
	stal	$c03d

	tya		; waveform table size
	ora	#$c0
	stal	$c03e
	lda	#%00111111
	stal	$c03d
	tya
	ora	#$c1
	stal	$c03e
	lda	#%00111111
	stal	$c03d

	tya		; control register
	ora	#$a0
	stal	$c03e
	lda	#%0000_0000
	stal	$c03d
	tya
	ora	#$a1
	stal	$c03e
	lda	#%0001_0000
	stal	$c03d
	
* 3. on sort et ça joue

	sec
	xce
	sep	#$30
	cli
	rts
