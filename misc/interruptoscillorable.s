*
* Interruptoscillatorable
*

* 1. You program an oscillator with interrupt enable
* eg. register $A0 = %----1--0 (1=interrupt enable, 0=halt bit off (aka start sound))
 
soundctl	=	$c03c	; $c03c
sounddata	=	$c03d	; $c03d
soundadrl	=	$c03e	; $c03e
soundadrh	=	$c03f	; $c03f

	sep	#$20

]lp	ldal	soundctl	; is DOC available?
	bmi	]lp

	ldal	$e100ca	; we want to deal
	and	#%0000_1111	; with the registers
	stal	soundctl

	lda	#$e0	; get the OIR
	stal	soundadrl	; which oscillo
	ldal	sounddata	; has generated
]lp	ldal	sounddata	; an interrupt?
	and	#%0011_1110
	lsr
	cmp	#1	; is it mine?
	bne	]lp	; no, wait

	...		; yes, exit
	
* 2. You program an oscillator with halt bit only and you check the halt bit
* eg. register $A0 = %-------0 (0=halt bit off (aka start sound))
 
	sep	#$20

]lp	ldal	soundctl	; is DOC available?
	bmi	]lp

	ldal	$e100ca	; we want to deal
	and	#%0000_1111	; with the registers
	stal	soundctl

	lda	#$a0	; get my control register
	stal	soundadrl	; the sound is playing
	ldal	sounddata	; if the Halt bit = 0
]lp	ldal	sounddata	; is sound playing?
	and	#%0000_0001
	beq	]lp	; no, wait

	...		; yes, exit
	
