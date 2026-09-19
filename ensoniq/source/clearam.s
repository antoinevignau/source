*
* ensoniq : clear RAM
*
* (c) 2026, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-----------------------------------
* EQUATES
*-----------------------------------

SOUNDCTL	=	$e0c03c
SOUNDDATA	=	$e0c03d
SOUNDADRL	=	$e0c03e
SOUNDADRH	=	$e0c03f

VALUE	=	$80	; valeur silence
			; essaye avec $00 aussi
			
*-----------------------------------
* ENTRY POINT
*-----------------------------------

	clc
	xce
	rep	#$30

	sep	#$20

	ldal	$e100ca
	and	#%0000_1111	; keep sound level
	ora	#%0110_0000	; to DOC RAM + auto increment + bank 0
	stal	SOUNDCTL

	lda	#0
	stal	SOUNDADRL
	stal	SOUNDADRH

	ldx	#0
	lda	#VALUE
]lp	stal	SOUNDDATA
	inx
	bne	]lp

	rep	#$20
	rts