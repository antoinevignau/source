*
* Orphee - Police CPC -> SHR
*
* (c) 1985, Laurent Benes & Loriciels
* (c) 2024, Brutal Deluxe Software (Apple II)
*

	mx	%11
	org	$1000
	lst	off

*-----------------------------------
* LA POLICE DU JEU (EN SHR)
*-----------------------------------

byte1	=	$fc
byte2	=	byte1+1
byte3	=	byte2+1
byte4	=	byte3+1

*-----------------------------------

	clc
	xce
	rep	#$30
	lda	#0
	tax
	tay
	sep	#$20

]lp	stz	byte1
	stz	byte2
	stz	byte3
	stz	byte4

	lda	source,y
	asl
	pha
	bcc	bit7
	lda	#%11110000
	sta	byte1
bit7	pla
	asl
	pha
	bcc	bit6
	lda	#%00001111
	tsb	byte1
bit6	pla
	asl
	pha
	bcc	bit5
	lda	#%11110000
	sta	byte2
bit5	pla
	asl
	pha
	bcc	bit4
	lda	#%00001111
	tsb	byte2
bit4	pla
	asl
	pha
	bcc	bit3
	lda	#%11110000
	sta	byte3
bit3	pla
	asl
	pha
	bcc	bit2
	lda	#%00001111
	tsb	byte3
bit2	pla
	asl
	pha
	bcc	bit1
	lda	#%11110000
	sta	byte4
bit1	pla
	asl
	pha
	bcc	bit0
	lda	#%00001111
	tsb	byte4
bit0	pla

	lda	byte1
	sta	destination,x
	lda	byte2
	sta	destination+1,x
	lda	byte3
	sta	destination+2,x
	lda	byte4
	sta	destination+3,x

	iny
	inx
	inx
	inx
	inx
	cpy	#480
	bcc	]lp

	sec
	xce
	sep	#$30
	rts

	ds	\
	
*-----------------------------------

source      HEX   0000000000000000	; space
            HEX   2020202020002000
            HEX   5050500000000000
            HEX   6C6CFE6CFE6C6C00
            HEX   2078A0F828F02000
            HEX   C8D8102040D89800
            HEX   60909060A8906800
            HEX   2020400000000000
            HEX   60C0C0C0C0C06000
            HEX   3018181818183000
            HEX   008870F870880000
            HEX   0010107C10100000
            HEX   0000000000303060
            HEX   0000007000000000
            HEX   0000000000303000
            HEX   060C183060C08000
            HEX   708898A8C8887000
            HEX   2060202020207000
            HEX   7088183060C0F800
            HEX   70C8081008C87000
            HEX   C0C0C0D0D0F81000
            HEX   F8C0C0F00808F000
            HEX   70C8C0F0C8C87000
            HEX   F898183060C08000
            HEX   70C8C870C8C87000
            HEX   7098987818987000
            HEX   0000303000303000
            HEX   0000303000303060
            HEX   0C18306030180C00
            HEX   0000700070000000
            HEX   6030180C18306000
            HEX   7088081020002000
            HEX   7CC6DEDEDEC07C00
            HEX   70C8C8F8C8C8C800
            HEX   F0C8C8F0C8C8F000
            HEX   70C8C0C0C0C87000
            HEX   F0C8C8C8C8C8F000
            HEX   78C0C0F0C0C07800
            HEX   78C0C0F0C0C04000
            HEX   78C0C0D8C8C87000
            HEX   C8C8C8F8C8C8C800
            HEX   7070202020707000
            HEX   3838101010906000
            HEX   C8D8F0E0F0D8C800
            HEX   C0C0C0C0C0C8F800
            HEX   88D8F8C8C8C8C800
            HEX   88C8E8F8D8C8C800
            HEX   70C8C8C8C8C87000
            HEX   F0C8C8F0C0C0C000
            HEX   70C8C8C8C8D06800
            HEX   F0C8C8F0D0C8C800
            HEX   70C8C07008C87000
            HEX   F8A8202020202000
            HEX   C8C8C8C8C8C87800
            HEX   C8C8C8C8C8702000
            HEX   C8C8C8C8F8D88800
            HEX   88D8702070D88800
            HEX   88D8702020207000
            HEX   F80810204080F800
            HEX   3C30303030303C00	; [

	ds	\
	
*-----------------------------------

destination	ds	2048	; need 4x480