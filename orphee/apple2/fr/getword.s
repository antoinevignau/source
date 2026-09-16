*-------------------------------
* GETWORD
* Cherche un mot dans une liste
* Entrée :
*  A: @ buffer d'entrée
*  X: @ liste des mots
*  Y: longueur de la chaîne
*-------------------------------

GETWORD	sta	GETWORD_TEXT+1	; @ buffer texte
	stx	GETWORD_LIST+1	; @ liste des mots
	sty	LEN$	; la longueur

	stz	MOT$	; index du mot

	cpy	#0	; empty string
	bne	GETWORD_2	; nah

GETWORD_1	rep	#$30
	rts

* 1. cherche le premier caractère

GETWORD_2	sep	#$30

	ldx	#0	; cherche le premier caractere
]lp	jsr	GETWORD_TEXT
	cmp	#chrNULL
	beq	GETWORD_3
	cmp	#chrSPACE
	bne	GETWORD_4	; on a trouvé un caractère
	inx
	cpx	lenSTRING
	bcc	]lp
	beq	]lp
GETWORD_3	bcs	GETWORD_1	; retourne sans avoir trouve

* 2. recopie le mot

GETWORD_4	ldy	#1	; longueur du mot
]lp	jsr	GETWORD_TEXT
	cmp	#chrNULL
	beq	GETWORD_6
	cmp	#chrSPACE
	beq	GETWORD_5
	sta	STR$,y	; recopie le mot
	inx
	cpx	LEN$
	beq	]lp
	bcs	GETWORD_6
	iny
	cpy	#NB_CAR
	bcc	]lp
	beq	]lp	; on sort si 5
GETWORD_5	dey
GETWORD_6	sty	STR$	; sauve la longueur
	
* 3. réduit la longueur du mot trouvé

	ldx	#LEN_WORD
	lda	STR$
	cmp	#LEN_WORD
	bcc	GETWORD_7
	beq	GETWORD_7
	stx	STR$

* 4. cherche le mot dans la liste
	
GETWORD_7	lda	STR$
	beq	GETWORD_1

	ldy	#1	; first index is 1
]lp	ldx	#1
GETWORD_8	jsr	GETWORD_LIST	; compare chars
	cmp	STR$,x
	bne	GETWORD_9	; different
	inx
	cpx	STR$	; check length
	bcc	GETWORD_8
	beq	GETWORD_8
	
	ldx	#0	; check length of word
	jsr	GETWORD_LIST
	cmp	STR$	; mismatch
	bne	GETWORD_9	; try the next one
	
	sty	MOT$	; got it!
	rep	#$30
	rts
	
	mx	%11

GETWORD_9	ldx	#0	; calculate address of
	jsr	GETWORD_LIST	; next word
	clc
	adc	GETWORD_LIST+1	; @adr = @adr + word_len + 1
	sta	GETWORD_LIST+1
	lda	GETWORD_LIST+2
	adc	#0
	sta	GETWORD_LIST+2
	inc	GETWORD_LIST+1
	bne	GETWORD_10
	inc	GETWORD_LIST+2

GETWORD_10	iny
	jsr	GETWORD_LIST	; get char
	bne	]lp	; if not 0, loop

	rep	#$30
	rts

*---

GETWORD_TEXT	lda	$bdbd,x	; get a char from the buffer
	rts
	
GETWORD_LIST	lda	$bdbd,x	; get a char from a list
	rts

	mx	%00

*--- Data

LEN$	ds	2	; longueur de la chaîne d'entrée
MOT$	ds	2	; index du mot
STR$	ds	NB_CAR+1	; mot recopié
