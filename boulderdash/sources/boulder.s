*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022-2025, Brutal Deluxe Software
*

*----------------------------- The loader

	mx	%11
	typ	SYS
	dsk	BOULDER.SYSTEM
	org	$2000
	lst	off

	use	BD.EQUATES
	
*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

leJEU	=	$6000

*-----------------------------------
* LOAD THE GAME
*-----------------------------------

	putbin	EA	; the EA logo

	lda	#$ff	; show HGR page 1
	sta	$2000
	sta	$2001
	sta	$2002
	
	STA	TXTCLR
	STA	MIXCLR
	STA	TXTPAGE1
	STA	HIRES

*---

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
	sta	proGETEOF+1
	sta	proREAD+1
	sta	proCLOSE+1

	jsr	PRODOS	; longueur du fichier
	dfb	$d1
	da	proGETEOF
	bcs	quitME

	lda	proGETEOF+2
	sta	proREAD+4
	lda	proGETEOF+3
	sta	proREAD+5

	jsr	PRODOS	; lecture du fichier
	dfb	$ca
	da	proREAD
	bcs	quitME
	
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
	ds	2	; request_count
	ds	2	; transfer_count

proCLOSE	dfb	$1
	ds	1	; ref_num

proGETEOF	dfb	$2
	ds	1	; ref_num
	ds	3	; eof

pLEJEU	str	'BD'

*---

	asc	0d0d
	asc	"     Boulder Dash     "0d
	asc	"     ------------     "0d
	asc	"Brutal Deluxe Software"0d
	asc	"    Antoine Vignau    "0d
	asc	"   Olivier  Zardini   "0d
	asc	"                      "0d
	asc	"     juillet 2025     "0d
	asc	0d