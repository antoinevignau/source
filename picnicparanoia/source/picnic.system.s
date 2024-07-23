*
* Picnic Paranoia
* The ProDOS version
*

	mx	%11
	org	$b400
	lst	off
	dsk	picnic.system

*------------------------------------------------------------------------------
* Equates & friends
*------------------------------------------------------------------------------

*--- Memory usage / ProDOS equates

ptrPREFIX	=	$0280	; address of the ProDOS prefix
proBUFFER	=	$b800	; ProDOS open buffer
PRODOS	=	$bf00	; The MLI entry point


*--- Game pointers

ptrJEU	=	$0800	; where to load
leJEU	=	$a000	; where to execute

*--- The softswitches

TXTCLR	=	$c050
MIXCLR	=	$c052
TXTPAGE1	=	$c054
HIRES	=	$c057

*------------------------------------------------------------------------------
*
* LES POINTS D'ENTREE
*
*------------------------------------------------------------------------------

	ldx	#0	; relocate the loader
]lp	lda	$2000,x
	sta	$b400,x
	inx
	bne	]lp
	
	jmp	leLOADER
	
*------------------------------------------------------------------------------
* LE CODE PRINCIPAL
*------------------------------------------------------------------------------

leLOADER
	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX

	ldx	#$0	; clear the HGR screen
	ldy	#$20
	txa
loop	sta	$2000,x
	inx
	bne	loop
	inc	loop+2
	dey
	bne	loop

	sta	TXTCLR
	sta	MIXCLR
	sta	TXTPAGE1
	sta	HIRES

	jsr	loadALL	; on charge tout
	bcs	leQUITTER	; mais on quitte sur erreur
	
	jmp	leJEU	; on saute en $800

leQUITTER
	jsr	PRODOS	; exit
	dfb	$65
	da	proQUIT
	brk	$bd	; on ne se refait pas ;-)


*------------------------------------------------------------------------------
*
* LES ROUTINES DU LOADER
*
*------------------------------------------------------------------------------

*
*--- Le fichier ENGINE
*

loadALL	jsr	openFILE	; on ouvre le fichier engine
	bcc	loadALL1
loadALLERR	sec
	rts
loadALL1
	lda	proGETEOF+4	; le fichier Engine
	bne	loadALLERR	; ne doit pas dépasser $9800 bytes
	lda	proGETEOF+3
	cmp	#$ac
	bcc	loadALL2
	beq	loadALL2
	lda	proGETEOF+2	; $18xx ou pas ?
	bne	loadALLERR
loadALL2
	jsr	readFILE	; on lit le fichier engine
	bcs	loadALLERR
loadALL3
	jmp	closeFILE	; on ferme le fichier

*--- Data

pGAME	str	'PICNIC.GAME'

*--------------------------------------
* Tout ce qui est ProDOS
*--------------------------------------

openFILE
	jsr	PRODOS
	dfb	$c8
	da	proOPEN
	bcc	openFILE1
	sta	proERR
	rts

openFILE1
	lda	proOPEN+5	; zou, on prend l'ID
	sta	proGETEOF+1
	sta	proREAD+1
	sta	proCLOSE+1

	jsr	PRODOS	; longueur du fichier
	dfb	$d1
	da	proGETEOF
	sta	proERR
	rts

*
*---
*
	
readFILE
	jsr	PRODOS	; lecture du fichier
	dfb	$ca
	da	proREAD
	sta	proERR
	rts

*
*---
*

closeFILE
	jsr	PRODOS	; fermeture du fichier
	dfb	$cc
	da	proCLOSE
	sta	proERR
	rts

*--- (c)opyright

	asc	0d'(c) Antoine Vignau, 7/2020'0d
	
*--- Data

proERR	ds	1	; erreur ProDOS rencontrée

proQUIT	dfb	$4
	ds	1
	ds	2
	ds	1
	ds	2	

proGETPFX	dfb	$1
	da	ptrPREFIX

proOPEN	dfb	$3
	da	pGAME	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

proREAD	dfb	$4
	ds	1	; ref_num
	da	ptrJEU	; data_buffer
	dw	$ac00	; request_count
	ds	2	; transfer_count

proCLOSE	dfb	$1
	ds	1	; ref_num
	
proGETEOF	dfb	$2
	ds	1	; ref_num
	ds	3	; eof

	ds	\