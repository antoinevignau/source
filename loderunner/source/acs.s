*
* Get ACS LR sprites
*

	mx	%00
	org	$900
	lst	off
	
	clc
	xce
	rep	#$30

	sep	#$20
	stz	$c035
	lda	#$c1
	sta	$c029

	rep	#$30
	ldx	#$7d00-2
	lda	#0
]lp	stal	$012000,x
	dex
	dex
	bpl	]lp

	stz	theINDEX

]lp	lda	theINDEX
	asl
	tax
	asl
	tay
	lda	table,x
	clc
	adc	#$2000
	sta	theY+1
	lda	$d01,y
	sta	theADDRESS+1
	lda	$d02,y
	sta	theADDRESS+2

theY	ldy	#0
theADDRESS	jsl	$050000

	inc	theINDEX
	lda	theINDEX
	cmp	#$60
	bcc	]lp
	sec
	xce
	sep	#$30
	rts
	
table	dw	$0000,$0008,$0010,$0018,$0020,$0028,$0030,$0038,$0040,$0048,$0050,$0058,$0060,$0068,$0070,$0078
	dw	$0A00,$0A08,$0A10,$0A18,$0A20,$0A28,$0A30,$0A38,$0A40,$0A48,$0A50,$0A58,$0A60,$0A68,$0A70,$0A78
	dw	$1400,$1408,$1410,$1418,$1420,$1428,$1430,$1438,$1440,$1448,$1450,$1458,$1460,$1468,$1470,$1478
	dw	$1E00,$1E08,$1E10,$1E18,$1E20,$1E28,$1E30,$1E38,$1E40,$1E48,$1E50,$1E58,$1E60,$1E68,$1E70,$1E78
	dw	$2800,$2808,$2810,$2818,$2820,$2828,$2830,$2838,$2840,$2848,$2850,$2858,$2860,$2868,$2870,$2878
	dw	$3200,$3208,$3210,$3218,$3220,$3228,$3230,$3238,$3240,$3248,$3250,$3258,$3260,$3268,$3270,$3278

theINDEX	ds	2

