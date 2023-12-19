*
* Kikekankoi loader
*
* (c) 1985, Laurent Benes & Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	org	$2000
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

leJEU	=	$800

ptrPREFIX	=	$280
proBUFFER	=	$b800
PRODOS	=	$bf00

*-----------------------------------
* LOAD THE GAME
*-----------------------------------

	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX

	jsr	PRODOS
	dfb	$c8
	da	proOPEN
	bcs	quitME

	lda	proOPEN+5	; zou, on prend l'ID
	sta	proREAD+1
	sta	proSETMARK+1
	sta	proREAD2+1
	sta	proCLOSE+1

	jsr	PRODOS	; lecture du fichier
	dfb	$ca
	da	proREAD
	bcs	quitME

	jsr	PRODOS
	dfb	$ce
	da	proSETMARK
	bcs	quitME
	
	jsr	PRODOS	; lecture du fichier
	dfb	$ca
	da	proREAD2

	jsr	PRODOS	; fermeture du fichier
	dfb	$cc
	da	proCLOSE
	bcs	quitME
	
	jmp	leJEU

quitME	jsr	PRODOS	; exit
	dfb	$65
	da	proQUIT
	brk	$bd	; on ne se refait pas ;-)
	
*--- Data

proQUIT	dfb	$4
	ds	1
	ds	2
	ds	1
	ds	2	

proGETPFX	dfb	$1
	da	ptrPREFIX

proOPEN	dfb	$3
	da	pLEJEU	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

proREAD	dfb	$4
	ds	1	; ref_num
	da	leJEU	; data_buffer
	dw	$1800	; request_count
	ds	2	; transfer_count

proREAD2	dfb	$4
	ds	1	; ref_num
	da	$4000	; data_buffer
	dw	$7800	; request_count
	ds	2	; transfer_count

proCLOSE	dfb	$1
	ds	1	; ref_num

proSETMARK dfb	$2
	ds	1	; ref_num
	adr	$3800	; set_mark
	
pLEJEU	str	'Kikekankoi'
