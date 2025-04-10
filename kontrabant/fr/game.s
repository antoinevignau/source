*
* Kontrabant
*
* (c) 1984, Radio Student
* (c) 2023, Tomaz Stih
* (c) 2024, Janez J. Starc & Brutal Deluxe Software
*
* See the MIT license @ https://github.com/iskra-delta/idp-quill/blob/main/LICENSE
*

	mx	%11
	org	$1000
	typ	$06
	dsk	Game
	lst	off
	
*------------------------------
* EQUATES
*------------------------------

*-------------- Zero page & friends

wpair	=	$00	; 00 for desc()
separator	=	wpair+2	; 02 
rule	=	separator+2	; 04 for engine_loop()
cmd	=	rule+2	; 06 
processed	=	cmd+2	; 08 
result	=	processed+2	; 0A 
parm1	=	result+2	; 0C for _engine_exec
parm2	=	parm1+2	; 0E 
temp	=	parm2+2	; 10 general usage
byte	=	temp+2	; 12 
oldCV	=	byte+2	; 14 

CH	=	$24
CV	=	$25
HBASL	=	$26
HBASH	=	$27
RNDL	=	$4E	; random counter low 
RNDH	=	$4F	; random counter high 

dpFROM	=	$f8	; $f8
dpRULES	=	dpFROM+2	; $fa
dpWORDS	=	dpRULES+2	; $fc
dpFUNC	=	dpWORDS+2	; $fe

TEXTBUFFER	=	$200
SOFTEV	=	$3F2

*-------------- Game

TRUE	=	255
FALSE	=	0

ptrPREFIX	=	$280
proBUFFER	=	$bb00
PRODOS	=	$bf00
MACHID	=	$bf98

*-------------- Softswitches

KBD	=	$C000
CLR80VID	=	$C00C
KBDSTROBE	=	$C010
VBL	=	$C019
MONOCOLOR	=	$C021
NEWVIDEO	=	$C029
VERTCNT	=	$C02e
SPKR	=	$C030
CYAREG	=	$C036
TXTCLR	=	$C050
TXTSET	=	$C051
MIXCLR	=	$C052
MIXSET	=	$C053
TXTPAGE1	=	$C054
TXTPAGE2	=	$C055
LORES	=	$C056
HIRES	=	$C057

*-------------- The firmware routines

HGR	=	$F3E2
HPOSN	=	$F417
INIT	=	$FB2F
TABV	=	$FB5B
SETPWRC	=	$FB6F
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
GETLN1	=	$FD6F
PRBYTE	=	$FDDA
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89
BELL	=	$FF3A

*-------------- Characters

chrNUL	=	$00

chrRETURN	=	$8D
chrESCAPE	=	$9B

chrN	=	"N"
chrY	=	"O"	; DEBUG
chrSPACE	=	" "
chrCOMMA	=	$AC	; "," does not work?!?

scrWIDTH	=	40

*------------------------------
* MACROS
*------------------------------

@print	mac
	ldx	#>]1	; C-string pointer
	ldy	#<]1
	jsr	printCSTRING
	eom

@dflag	mac
	ldx	#]1	; flag
	lda	#]2	; value
	jsr	dflag
	eom

@sys_messages	mac
	ldx	#]1	; system message index
	jsr	get_sys_message
	jsr	printCSTRING
	eom

*------------------------------
* MAIN
*------------------------------

main	jsr	platform_init
main_init	jsr	engine_init
	
main_loop	lda	#FALSE	; for restart
	sta	fgQUIT	; fin d'action
	sta	fgRESTART	; redémarrer

	jsr	engine_loop

	lda	fgRESTART	; after a LOAD SLOT
	cmp	#TRUE
	beq	main_loop

	lda	#FALSE	; shall we quit?
	sta	fgQUIT
	jsr	quit
	lda	fgQUIT
	cmp	#TRUE
	bne	main_init	; no
	
	jmp	platform_exit	; exit, please!

*------------------------------
* PLATFORM
*------------------------------

*-------------- PLATFORM_INIT

platform_init	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jsr	HOME	; home cursor and clear 

	lda	#<main	; set reset vector
	sta	SOFTEV
	lda	#>main
	sta	SOFTEV+1
	jsr	SETPWRC

pi_noprts	nop

*--- UPPER/lower case?

	lda	MACHID
	and	#%0000_1000	; bit 3
	bne	pi_oklower	; on means //c
	lda	MACHID
	bmi	pi_oklower
	
	lda	#$80	; force UPPER
	sta	fgCASE	
	sta	fgTRANSLATE	; and no accents

pi_oklower	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX

*--- //gs?

	sec
	jsr	IDROUTINE
	bcs	pi_noiigs	; nope
	
	lda	CYAREG	; yes
	sta	fgSPEED
	and	#%0111_1111
	sta	CYAREG
	
pi_noiigs	lda	#$60	; put a RTS
	sta	pi_noprts
	rts
	
*--- Data

proGETPFX	dfb	$1
	da	ptrPREFIX

fgSPEED	ds	2

*-------------- PLATFORM_BEEP
* X: duration (in /100)
* Y: pitch (/2-60)

platform_beep	rts
	stx	snd_duration	; calculate exit silence duration
	txa
	eor	#$ff
	clc
	adc	#1
	lsr
	lsr
	lsr
	lsr
	sta	snd_wait

	lda	#0	; calculate nb of loops per .2 sec increment
	tax
]lp	inx
	clc
	adc	#20
	cmp	snd_duration
	bcc	]lp
	stx	snd_duration

	tya		; keep the pitch
	sta	snd_pitch

pb_outer	ldy	#0	; make the sound
pb_loop	ldx	snd_pitch
	lda	SPKR
]lp	nop		; the NOPs make the diff
	nop
	inx
	bne	]lp
	dey
	bne	pb_loop
	dec	snd_duration
	bne	pb_outer

	lda	snd_wait	; exit
	jmp	WAIT

*--- Data

snd_duration	ds	2
snd_pitch	ds	2
snd_wait	ds	2

*-------------- PLATFORM_PAUSE
* 250 = 5s
* 200 = 4s
* 150 = 3s
* 100 = 2s
*  50 = 1s

platform_pause	lda	#86	; 0.02s
	jsr	WAIT
	lda	KBD
	bmi	pp_exit
	dex
	bne	platform_pause
pp_exit	sta	KBDSTROBE
	rts

*-------------- PLATFORM_RNDGEN

platform_rndgen	lda	RNDL
	and	#%01111111	; and 127
	cmp	#100	; >= 100
	bcc	pr_100
	sec		; oui
	sbc	#100	; alors -100
pr_100	cmp	#0	; non, zero alors ?
	bne	pr_ok
	clc		; oui
	adc	#1	; ajoute 1
pr_ok	rts		; non, on est OOOKKK
	
*-------------- PLATFORM_EXIT

platform_exit	sec
	jsr	IDROUTINE
	bcs	pe_noiigs

	lda	fgSPEED
	sta	CYAREG

pe_noiigs	jsr	PRODOS
	dfb	$65
	da	proQUIT

	brk	$bd

*--- Data

proQUIT	dfb	$4
	ds	1
	ds	2
	ds	1
	ds	2	

*------------------------------
* ENGINE
*------------------------------

*-------------- ENGINE_INIT

engine_init	lda	#0
	sta	location

* deconst objects collection

	lda	#<tblOBJECTS	; ie. fill in the objects table
	sta	dpFROM	; with the objects ID
	lda	#>tblOBJECTS
	sta	dpFROM+1

	ldx	#0	; j = 0
ei_objects	ldy	#0	; i = 0
	lda	(dpFROM),y
	cmp	#$ff
	beq	ei_flags
	sta	objects,x
	inx		; j++
]lp	iny		; i++
	lda	(dpFROM),y
	bne	]lp
	iny		; i++
	tya		; source += i
	clc
	adc	dpFROM
	sta	dpFROM
	lda	#0
	adc	dpFROM+1
	sta	dpFROM+1
	bne	ei_objects

* quit and done processing to false

ei_flags	lda	#FALSE
	sta	fgQUIT
	sta	fgDONE

* flags to 0, except flag 1 ... max allowed carried objects

	ldx	#0
	txa
]lp	sta	flags,x
	inx
	cpx	#MAX_FLAGS
	bcc	]lp
	beq	]lp

* now set flags to num of carried objects

	lda	#<tblOBJECTS
	sta	dpFROM
	lda	#>tblOBJECTS
	sta	dpFROM+1
	
	ldx	#0	; carried
]lp	ldy	#0
	lda	(dpFROM),y
	cmp	#$ff
	beq	ei_time
	cmp	#O_CARRIED
	bne	ei_next
	inx		; carried++

ei_next	iny		; loop until end of string
	lda	(dpFROM),y
	bne	ei_next
	iny		; i++
	tya		; source += i
	clc
	adc	dpFROM
	sta	dpFROM
	lda	#0
	adc	dpFROM+1
	sta	dpFROM+1
	jmp	]lp
	
ei_time	txa		; save number of carried objects
	ldx	#FLG_COUNT_CARR
	sta	flags,x
	
* kontrabant 2 only, easy victory!

	ldx	#FLG_MINUTE	; not used on the Apple II version
	lda	#40
	sta	flags,x
	
	ldx	#FLG_SECOND
	lda	#59
	sta	flags,x
	rts

*-------------- _engine_exec

_engine_exec	tya		; calculate address of function
	clc
	adc	#<tblFUNC
	sta	dpFUNC
	txa
	adc	#>tblFUNC
	sta	dpFUNC+1

* as long as there are program bytes
	
ee_outer	ldy	#0
	lda	(dpFUNC),y
	cmp	#FN_EOF
	beq	ee_exit
	lda	fgDONE
	cmp	#TRUE
	beq	ee_exit
	lda	fgQUIT
	cmp	#TRUE
	bne	ee_extract

ee_exit	lda	#TRUE
	clc
	rts

* extract function id

ee_extract	ldy	#0
	lda	(dpFUNC),y
	and	#CMD_FNBIT
	asl		; *2
	tax		; command index

* call the function

	lda	(dpFUNC),y
	and	#CMD_TYPBIT
	cmp	#CMD_ACT
	beq	ee_action

	lda	cndtbl,x	; condition table
	sta	ee_call+1
	lda	cndtbl+1,x
	sta	ee_call+2
	bne	ee_parms

ee_action	lda	acttbl,x	; action table
	sta	ee_call+1
	lda	acttbl+1,x
	sta	ee_call+2

ee_parms	lda	#R_SUCCESS
	sta	result

* get the parameters

	lda	(dpFUNC),y
	and	#CMD_PARBIT
	cmp	#CMD_NOPARS
	bne	ee_parms1

	jsr	ee_call
	ldx	#1
	bne	ee_next

ee_parms1	cmp	#CMD_1PAR
	bne	ee_parms2

	iny
	lda	(dpFUNC),y
	sta	parm1
	
	jsr	ee_call
	ldx	#2
	bne	ee_next

ee_parms2	cmp	#CMD_2PARS
	bne	ee_skip
	
	iny
	lda	(dpFUNC),y
	sta	parm1
	iny
	lda	(dpFUNC),y
	sta	parm2

	jsr	ee_call	
	ldx	#3

* next entry

ee_next	sta	result	; save result

	txa		; next pointer
	clc
	adc	dpFUNC
	sta	dpFUNC
	lda	#0
	adc	dpFUNC+1
	sta	dpFUNC+1
	
* did not succeed

ee_skip	lda	result
	cmp	#R_FAIL
	bne	ee_loop
	lda	#FALSE
	sec
	rts
ee_loop	jmp	ee_outer	; loop the while

ee_call	jsr	null	; return to me
	rts

*-------------- _turn

_turn	@dflag	#FLG_CMD0;-1	; dec flags 5-8
	@dflag	#FLG_CMD1;-1
	@dflag	#FLG_CMD2;-1
	@dflag	#FLG_CMD3;-1

	ldx	#FLG_DARK
	lda	flags,x
	beq	turn_turns

	@dflag	#FLG_CMDD;-1
	
	ldx	#LIGHTOBJ
	lda	objects,x
	cmp	location
	beq	turn_turns

	@dflag	#FLG_CMDDO0;-1

turn_turns	ldx	#FLG_TURNS_LO	; increment turns
	lda	flags,x
	clc
	adc	#1
	sta	flags,x
	ldx	#FLG_TURNS_HI
	lda	flags,x
	adc	#0
	sta	flags,x
	rts

*--- Hello Toinet

helloTOINET	lda	#7	; center vertically ((24 text lines - 10 intro lines) / 2)
	jsr	TABV

	lda	#<strTOINET
	sta	dpFROM
	lda	#>strTOINET
	sta	dpFROM+1

	ldy	#0
]lp	lda	(dpFROM),y
	beq	ht_end	; exit
	bmi	ht_print	; print out ASCII
	sta	CH	; or set HTAB
	iny
	bne	]lp
ht_print	bit	fgCASE
	bpl	ht_lower
	tax		; from lower to upper
	lda	tblKEY,x
ht_lower	iny
	jsr	COUT
	bne	]lp

ht_end	ldx	#250	; 5s
	jsr	platform_pause
	
	lda	#$2c	; never show again
	sta	engine_loop
	rts

*-------------- ENGINE_LOOP

engine_loop	jsr	helloTOINET
	jsr	desc

* processes
	
el_outer	lda	#FALSE
	sta	fgDONE

	lda	#<tblRULES
	sta	dpRULES
	lda	#>tblRULES
	sta	dpRULES+1
	
]lp	lda	fgDONE	; while
	cmp	#TRUE
	beq	el_continue

	ldy	#0
	lda	(dpRULES),y
	cmp	#$ff	; end of table
	beq	el_continue
	cmp	#CMD_PROC
	bne	el_next_rule

	ldy	#4	; codeloc is passed
	lda	(dpRULES),y	; in X/Y
	tax
	dey
	lda	(dpRULES),y
	tay
	jsr	_engine_exec

	lda	fgQUIT
	cmp	#FALSE
	beq	el_next_rule
	jmp	the_end

el_next_rule	lda	dpRULES
	clc
	adc	#SIZEOF_RULES
	sta	dpRULES
	lda	dpRULES+1
	adc	#0
	sta	dpRULES+1
	bne	]lp

* random what to do?

el_continue	jsr	platform_rndgen
	and	#%0000_0011
	clc
	adc	#SM_WHATS_NEXT1
	tax
	jsr	get_sys_message
	jsr	printCSTRING
	
* get command from the user

]lp	jsr	DEBUG

	lda	CV
	sta	oldCV
	
	@print	#strCOMMANDE
	jsr	GETLN1
*	jsr	GETLINE	; self-run
	stx	lenSTRING	; longueur de la chaine saisie
	cpx	#1
	bcs	el_parse
	
	lda	oldCV
	jsr	TABV
	jmp	]lp	; loop
	
* parse it!

el_parse	jsr	rewriteSTRING	; rewrite string in capital letters
	jsr	parse
	sty	cmd	; returns two word indexes
	stx	cmd+1
	
* actions

	lda	#FALSE
	sta	fgDONE
	sta	processed

	lda	#<tblRULES
	clc
	adc	#SIZEOF_RULES
	sta	dpRULES
	lda	#>tblRULES
	adc	#0
	sta	dpRULES+1
	
]lp	lda	fgDONE	; while
	cmp	#TRUE
	beq	el_processed

	ldy	#0
	lda	(dpRULES),y
	cmp	#$ff	; end of table
	beq	el_processed

	iny
	lda	(dpRULES),y
	cmp	cmd
	bne	el_next_rule2
	iny
	lda	(dpRULES),y
	cmp	cmd+1
	bne	el_next_rule2

	ldy	#4	; codeloc is passed
	lda	(dpRULES),y	; in X/Y
	tax
	dey
	lda	(dpRULES),y
	tay
	jsr	_engine_exec
	ora	processed
	sta	processed

	lda	fgQUIT
	cmp	#FALSE
	beq	el_next_rule2
	jmp	the_end

el_next_rule2	lda	dpRULES
	clc
	adc	#SIZEOF_RULES
	sta	dpRULES
	lda	dpRULES+1
	adc	#0
	sta	dpRULES+1
	bne	]lp

* if processed

el_processed	lda	processed
	cmp	#FALSE
	bne	el_notp
	
	lda	cmd
	cmp	#13
	bcs	el_hein
	@sys_messages	#SM_NO_DIRECTION
	jmp	el_notp
el_hein	@sys_messages	#SM_DONT_UNDERSTAND

* process turn actions

el_notp	jsr	_turn

	lda	fgQUIT
	cmp	#TRUE
	beq	the_end
	jmp	el_outer

the_end	rts

*--- Data

fgQUIT	ds	2
fgDONE	ds	2
fgRESTART	ds	2	; <>0 after LOAD SLOT

DATA_BEGIN
lsHEADER	asc	"BDK1"
location	ds	2
objects	ds	NUMOBJECTS+1
flags	ds	MAX_FLAGS+1

DATA_END

*------------------------------
* GET SOLUTION
*------------------------------
* 0A = end of line => 8D
* 61 = end of solution

GETLINE	ldx	#0
GETSOLUCE	lda	theSOLUTION
	cmp	#'a'
	bne	nottheend

	inc	$c034
	jsr	RDKEY
	brk	$bd	; end of the game

nottheend	cmp	#$0a	; end of line
	bne	notreturn
	
	inc	GETSOLUCE+1
	bne	nottheend2
	inc	GETSOLUCE+2
	
nottheend2	lda	#chrRETURN
	sta	TEXTBUFFER,x
	jmp	COUT

notreturn	ora	#$80
	sta	TEXTBUFFER,x
	jsr	COUT
	inx
	inc	GETSOLUCE+1
	bne	GETSOLUCE
	inc	GETSOLUCE+2
	bne	GETSOLUCE

*------------------------------
* DEBUG
*------------------------------

DEBUG	lda	fgDEBUG
	bmi	DEBUG_ON
	rts

DEBUG_ON	@print	#dLOCATION
	lda	location
	jsr	PRBYTE
	
	@print	#dWORD1
	lda	windex
	jsr	PRBYTE
	
	@print	#dWORD2
	lda	windex+1
	jsr	PRBYTE
	
	@print	#dPROCESSED
	lda	processed
	jsr	PRBYTE
	
	lda	#chrRETURN
	jmp	COUT

*--- Data

dLOCATION	asc	8D"Loc:"00
dWORD1	asc	"/W1:"00
dWORD2	asc	"/W2:"00
dPROCESSED	asc	"/P:"00

*------------------------------
* PARSER
*------------------------------

*-------------- find_word

find_word	lda	#<tblWORDS
	sta	dpWORDS
	lda	#>tblWORDS
	sta	dpWORDS+1
	stx	temp
	
fw_outer	ldy	#0
	lda	(dpWORDS),y
	cmp	#$ff
	beq	fw_notfound
			; 0 1 2
	ldy	#1	; x 1 I
	ldx	#0	; 1 I
]lp	lda	(dpWORDS),y	; 1 2 
	cmp	mot,x	; 0 1
	bne	fw_next
	iny		; 2 3
	inx		; 1 2
	cpx	mot	; 1 1
	bcc	]lp	; 1 x
	beq	]lp	; 1 x

	ldy	#0	; word found
	lda	(dpWORDS),y
	ldx	temp
	rts

fw_next	ldy	#1
	lda	(dpWORDS),y
	clc
	adc	#2
	adc	dpWORDS
	sta	dpWORDS
	lda	dpWORDS+1
	adc	#0
	sta	dpWORDS+1
	bne	fw_outer

fw_notfound	lda	#WORD_UNKNOWN	; word not found
	ldx	temp
	rts

*-------------- parse
	
parse	lda	#0
	sta	windex
	sta	windex+1

* 1. cherche le premier caractere

	jsr	clear_mot

	ldx	#0
]lp	lda	TEXTBUFFER,x
	cmp	#chrSPACE
	bne	p_foundit
	inx
	cpx	lenSTRING
	bcc	]lp
	jmp	parse_end

* 2. recopie le mot

p_foundit	ldy	#1
]lp	lda	TEXTBUFFER,x
	cmp	#chrRETURN
	beq	p_foundend
	cmp	#chrSPACE
	beq	p_foundend
	sta	mot,y	; 0P1R2E3N4
	iny
	inx
	cpx	lenSTRING
	bcs	p_foundend
	cpy	#4
	bcc	]lp
	beq	]lp
p_foundend	dey
	sty	mot	; sauve la longueur

* 3. cherche le mot

	jsr	find_word
	cmp	#WORD_UNKNOWN
	beq	parse_next
	sta	windex

* 4. cherche le premier caractere

parse_next	cpx	lenSTRING	; cannot find a second word...
	beq	parse_end
	
	jsr	clear_mot	; X is untouched

* 4b. est-on déjà sur un espace ou sur la fin du premier mot ?

]lp	lda	TEXTBUFFER,x
	cmp	#chrSPACE
	beq	parse_next_ok
	inx
	cpx	lenSTRING
	bcc	]lp
	bcs	parse_end
	
parse_next_ok
]lp	lda	TEXTBUFFER,x
	cmp	#chrSPACE
	bne	p_foundit2
	inx
	cpx	lenSTRING
	bcc	]lp
	jmp	parse_end

* 5. recopie le mot

p_foundit2	ldy	#1
]lp	lda	TEXTBUFFER,x
	cmp	#chrRETURN
	beq	p_foundend2
	cmp	#chrSPACE
	beq	p_foundend2
	sta	mot,y	; 0P1R2E3N4
	iny
	inx
	cpx	lenSTRING
	bcs	p_foundend2
	cpy	#4
	bcc	]lp
	beq	]lp
p_foundend2	dey
	sty	mot	; sauve la longueur

* 6. cherche le mot

	jsr	find_word
	cmp	#WORD_UNKNOWN
	beq	parse_next	; 2nd is unkonwn, try again
	
	sta	windex+1

* 9. retourne les index trouves
	
parse_end	ldy	windex
	ldx	windex+1
	rts

clear_mot	lda	#0
	sta	mot
	sta	mot+1
	sta	mot+2
	sta	mot+3
	sta	mot+4
	rts

*--- Data

mot	ds	5	; 0ABCD
windex	ds	2

*------------------------------
* FUNCTIONS
*------------------------------

*------------------------------
* global functions
*------------------------------

*-------------- dec/inc a X flag by +/- value in A

dflag	clc
	adc	flags,x
	bmi	dflag_exit
	sta	flags,x
dflag_exit	rts

*-------------- return carry clear if Y is pressed

bool_yesno	@print	#strLEFTP
	@sys_messages	#SM_YES
	@print	#strSLASH
	@sys_messages	#SM_NO
	@print	#strRIGHTP

	jsr	translateKEY
	jsr	COUT	; output selected entry
	cmp	#chrN
	beq	byn_no
	cmp	#chrY
	bne	byn_no

	clc
	rts
byn_no	sec
	rts

*-------------- convert integer (0..255) to ascii
*  in: A hex value
* out: X 0..2, Y 0..99

itoa	ldx	#0

	cmp	#200
	bcc	itoa_100
	sec
	sbc	#200
	ldx	#2
	bne	itoa_end

itoa_100	cmp	#100
	bcc	itoa_end
	sec
	sbc	#100
	ldx	#1
	
itoa_end	tay
	lda	tblHEX2DEC,y
	tay
	rts

*-------------- convert binary to BCD (Andrew Jacobs, 2004, 6502.org)

binbcd16	sty	valBIN
	stx	valBIN+1

	lda	#0
	sta	valBCD+0
	sta	valBCD+1
	sta	valBCD+2
	
	sed
	ldx	#16
]lp	asl	valBIN
	rol	valBIN+1

	lda	valBCD+0
	adc	valBCD+0
	sta	valBCD+0
	lda	valBCD+1
	adc	valBCD+1
	sta	valBCD+1
	lda	valBCD+2
	adc	valBCD+2
	sta	valBCD+2
	
	dex
	bne	]lp
	cld
	rts
	
*--- Data

valBIN	ds	2
valBCD	ds	3
	
*------------------------------
* condition function
*------------------------------

*--------------

null	lda	#R_SUCCESS
	clc
	rts

*--------------

at	lda	location
	cmp	parm1
	beq	at_success
	
	lda	#R_FAIL
	sec
	rts
at_success	lda	#R_SUCCESS
	clc
	rts

*--------------

not_at	lda	location
	cmp	parm1
	bne	na_success

	lda	#R_FAIL
	sec
	rts
na_success	lda	#R_SUCCESS
	clc
	rts

*-------------- check if we are not at location lower than?

at_lower_than	lda	location
	cmp	parm1
	bcc	alt_success

	lda	#R_FAIL
	sec
	rts
alt_success	lda	#R_SUCCESS
	clc
	rts

*-------------- do we carry an object

carried	ldx	parm1
	lda	objects,x
	cmp	#O_CARRIED
	beq	c_success

	lda	#R_FAIL
	sec
	rts
c_success	lda	#R_SUCCESS
	clc
	rts

*-------------- is the object not carried?

not_carried	ldx	parm1
	lda	objects,x
	cmp	#O_CARRIED
	bne	nc_success

	lda	#R_FAIL
	sec
	rts
nc_success	lda	#R_SUCCESS
	clc
	rts

*-------------- is object worn?

worn	ldx	parm1
	lda	objects,x
	cmp	#O_WORN
	beq	w_success

	lda	#R_FAIL
	sec
	rts
w_success	lda	#R_SUCCESS
	clc
	rts
	rts

*-------------- is object not worn?

not_worn	ldx	parm1
	lda	objects,x
	cmp	#O_WORN
	bne	nw_success

	lda	#R_FAIL
	sec
	rts
nw_success	lda	#R_SUCCESS
	clc
	rts

*-------------- is object present?

present	ldx	parm1
	lda	objects,x
	cmp	location
	beq	p_success
	cmp	#O_WORN
	beq	p_success
	cmp	#O_CARRIED
	beq	p_success

	lda	#R_FAIL
	sec
	rts
p_success	lda	#R_SUCCESS
	clc
	rts

*-------------- is object absent?

absent	jsr	present
	bcs	a_success

	lda	#R_FAIL
	sec
	rts
a_success	lda	#R_SUCCESS
	clc
	rts

*--------------

lower_than	ldx	parm1
	lda	flags,x
	cmp	parm2
	bcc	lt_success

	lda	#R_FAIL
	sec
	rts
lt_success	lda	#R_SUCCESS
	clc
	rts

*--------------

greater_than	ldx	parm1
	lda	parm2
	cmp	flags,x
	bcc	gt_success
	
	lda	#R_FAIL
	sec
	rts
gt_success	lda	#R_SUCCESS
	clc
	rts

*--------------

equal	ldx	parm1
	lda	flags,x
	cmp	parm2
	beq	e_success

	lda	#R_FAIL
	sec
	rts
e_success	lda	#R_SUCCESS
	clc
	rts

*-------------- check if flag is zero

zero	ldx	parm1
	lda	flags,x
	beq	z_success
	
	lda	#R_FAIL
	sec
	rts
z_success	lda	#R_SUCCESS
	clc
	rts

*-------------- check if flag is not zero

not_zero	ldx	parm1
	lda	flags,x
	bne	nz_success
	
	lda	#R_FAIL
	sec
	rts
nz_success	lda	#R_SUCCESS
	clc
	rts

*-------------- random

chance	jsr	platform_rndgen
	cmp	parm1
	bcc	rnd_success
	beq	rnd_success

	lda	#R_FAIL
	sec
	rts
rnd_success	lda	#R_SUCCESS
	clc
	rts

*------------------------------
* action function table

*-------------- move to location

go	lda	parm1
	sta	location
	
	lda	#R_SUCCESS
	clc
	rts

*--------------

desc	@dflag	#FLG_DSC;-1

	lda	fgHOME
	bmi	desc_not_home

	jsr	HOME

* it's dark

desc_not_home	ldx	#FLG_DARK
	lda	flags,x
	beq	desc_notdark

	@dflag	#FLG_DSCD;-1

	ldx	#LIGHTOBJ	; is object 0 present?
	lda	objects,x
	cmp	location
	beq	desc_darkwith

	@dflag	#FLG_DSCDO0;-1	; no
	@sys_messages	#SM_ITS_DARK
	jmp	desc_notdark

desc_darkwith	jsr	print_return
	ldx	location	; yes, dark with object 0
	jsr	get_location_name
	jsr	printCSTRING

* there's a light or a source of light

desc_notdark	ldx	#FLG_DARK
	lda	flags,x
	beq	desc_location
	ldx	#LIGHTOBJ
	lda	objects,x
	cmp	location
	beq	desc_location
	jmp	desc_end

* first the location

desc_location	jsr	print_return
	ldx	location
	jsr	get_location_name
	jsr	printCSTRING

* are we on welcome page?

	lda	location
	bne	desc_inventory
	jmp	desc_end

* now the inventory

desc_inventory	lda	#FALSE
	sta	fgFOUNDANY

	lda	#0
	sta	temp
	
]lp	ldx	temp
	lda	objects,x
	cmp	location
	bne	di_next

	lda	fgFOUNDANY
	cmp	#TRUE
	beq	di_got

	@sys_messages	#SM_I_ALSO_SEE

	lda	#TRUE	; carried object
	sta	fgFOUNDANY

di_got	jsr	print_return	; print object name
	jsr	print_space
	lda	temp
	jsr	get_object_name
	jsr	printCSTRING

di_next	inc	temp
	lda	temp
	cmp	#NUMOBJECTS
	bcc	]lp
	beq	]lp

* don't execute next action

desc_end	lda	#TRUE
	sta	fgDONE
	
	lda	#R_SUCCESS
	clc
	rts

*--------------

inven	lda	#FALSE
	sta	fgFOUNDANY

	@sys_messages	#SM_CARRYING

	lda	#0
	sta	temp
	
]lp	ldx	temp
	lda	objects,x
	cmp	#O_CARRIED
	bne	i_notcarried

	lda	#TRUE	; carried object
	sta	fgFOUNDANY

	jsr	print_return
	jsr	print_space
	txa
	jsr	get_object_name
	jsr	printCSTRING
	jmp	i_next

i_notcarried	cmp	#O_WORN
	bne	i_next

	lda	#TRUE	; worn object
	sta	fgFOUNDANY
	
	jsr	print_return
	jsr	print_space
	txa
	jsr	get_object_name
	jsr	printCSTRING
	@sys_messages	#SM_WORN

i_next	inc	temp
	lda	temp
	cmp	#NUMOBJECTS
	bcc	]lp
	beq	]lp

	lda	fgFOUNDANY
	cmp	#FALSE
	bne	inven_end

	@sys_messages	#SM_CARR_NOTHING
	
inven_end	lda	#TRUE
	sta	fgDONE
	
	lda	#R_SUCCESS
	clc
	rts

*--- Data

fgFOUNDANY	ds	2
fgSEPARATOR	ds	2

*-------------- quit game!

quit	@sys_messages	#SM_WANNA_QUIT
	jsr	bool_yesno
	bcs	q_no

	@sys_messages	#SM_THEEND
	
	lda	#TRUE
	sta	fgQUIT

q_no	lda	#TRUE
	sta	fgDONE
	lda	#R_SUCCESS
	clc
	rts

*-------------- it's the end

end	lda	#TRUE
	sta	fgQUIT
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- beep!

beep	ldx	parm1
	ldy	parm2
	jsr	platform_beep

	lda	#R_SUCCESS
	clc
	rts

*-------------- set flag to 255

set	ldx	parm1
	lda	#FLG_SET
	sta	flags,x
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- clear flag to 0

clear	ldx	parm1
	lda	#FLG_CLEAR
	sta	flags,x
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- remove an object (aka unwear)

oremove	ldx	parm1	; are we wearing it?
	lda	objects,x
	cmp	#O_WORN
	beq	or_next
	
	@sys_messages	#SM_NOT_WEARING	; no
	lda	#TRUE
	sta	fgDONE
	jmp	oremove_exit

or_next	ldx	#FLG_COUNT_CARR	; are hands full?
	lda	flags,x
	cmp	#MAXCARR
	bcc	or_ok
	beq	or_ok

	@sys_messages	#SM_HANDS_FULL	; yes
	lda	#TRUE
	sta	fgDONE
	jmp	oremove_exit

or_ok	inc	flags,x
	ldx	parm1
	lda	#O_CARRIED
	sta	objects,x

oremove_exit	lda	#R_SUCCESS
	clc
	rts

*-------------- get an object

get	ldx	parm1	; do we already have it?
	lda	objects,x
	cmp	#O_WORN
	beq	got_it
	cmp	#O_CARRIED
	bne	get_next
	
got_it	@sys_messages	#SM_ALREADY_HAVE	; yes
	lda	#TRUE
	sta	fgDONE
	jmp	get_exit

get_next	cmp	location	; check location of object
	beq	get_quantity

	@sys_messages	#SM_NOT_HERE	; not here
	lda	#TRUE
	sta	fgDONE
	jmp	get_exit

get_quantity	ldx	#FLG_COUNT_CARR	; check too many objects?
	lda	flags,x
	cmp	#MAXCARR
	bcc	get_it
	beq	get_it

	@sys_messages	#SM_TOO_HEAVY	; limit reached
	lda	#TRUE
	sta	fgDONE
	jmp	get_exit

get_it	@dflag	#FLG_COUNT_CARR;1	; get it, please

	ldx	parm1
	lda	#O_CARRIED
	sta	objects,x

get_exit	lda	#R_SUCCESS
	clc
	rts

*-------------- drop an object?

drop	ldx	parm1
	lda	objects,x
	cmp	#O_WORN
	beq	drop_ok
	cmp	#O_CARRIED
	beq	drop_ok
	
	@sys_messages	#SM_DONT_HAVE
	lda	#TRUE
	sta	fgDONE
	jmp	drop_exit

drop_ok	lda	location
	sta	objects,x
	
	@dflag	#FLG_COUNT_CARR;-1
	
drop_exit	lda	#R_SUCCESS
	clc
	rts

*-------------- print message

message	jsr	print_return

	ldx	parm1	; message index
	jsr	get_message	; get it
	jsr	printCSTRING	; print it

	ldx	parm1	; ** new ** patch for message 24
	cpx	#24
	bne	message_end
	ldx	#100	; add a 2s display
	jsr	platform_pause
	
message_end	lda	#R_SUCCESS
	clc
	rts

*-------------- wear an object

wear	ldx	parm1	; do we already wear it?
	lda	objects,x
	cmp	#O_WORN
	bne	wear_carry

	@sys_messages	#SM_ALREADY_WEARING	; yes
	lda	#TRUE
	sta	fgDONE
	jmp	wear_exit
	
wear_carry	cmp	#O_CARRIED	; no, do we already carry it?
	bne	wear_notowned

	lda	#O_WORN	; yes, wear it
	sta	objects,x
	@dflag	#FLG_COUNT_CARR;-1	; ** new ** AV: logical decrease
	jmp	wear_exit
	
wear_notowned	@sys_messages	#SM_DONT_HAVE	; no, we don't have it
	lda	#TRUE
	sta	fgDONE

wear_exit	lda	#R_SUCCESS
	clc
	rts

*-------------- wait

pause	ldx	parm1
	jsr	platform_pause

	lda	#R_SUCCESS
	clc
	rts

*-------------- create an object

create	ldx	parm1
	lda	objects,x
	cmp	#O_WORN
	bne	create_next

	@dflag	#FLG_COUNT_CARR;-1

create_next	ldx	parm1	; label could be put below
	lda	location
	sta	objects,x
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- delete an object

destroy	ldx	parm1
	lda	objects,x
	cmp	#O_WORN
	beq	d_drop
	cmp	#O_CARRIED
	bne	destroy_next

d_drop	@dflag	#FLG_COUNT_CARR;-1

destroy_next	ldx	parm1
	lda	#O_NOTCRE
	sta	objects,x

	lda	#R_SUCCESS
	clc
	rts

*-------------- swap two objects

swap	ldx	parm1
	ldy	parm2
	lda	objects,x
	sta	swap_temp
	lda	objects,y
	sta	objects,x
	lda	swap_temp
	sta	objects,y
	
	lda	#R_SUCCESS
	clc
	rts

*--- Data

swap_temp	ds	2

*-------------- add value to a flag

plus	ldx	parm1
	lda	flags,x
	clc
	adc	parm2
	sta	flags,x

	lda	#R_SUCCESS
	clc
	rts

*-------------- subtract value to a flag

minus	ldx	parm1
	lda	flags,x
	sec
	sbc	parm2
	sta	flags,x

	lda	#R_SUCCESS
	clc
	rts

*-------------- set value to a flag

let	ldx	parm1
	lda	parm2
	sta	flags,x

	lda	#R_SUCCESS
	clc
	rts

*-------------- tell OK to the player

ok	@sys_messages	#SM_OK

	lda	#TRUE
	sta	fgDONE

	lda	#R_SUCCESS
	clc
	rts

*-------------- tell we're done

done	lda	#TRUE
	sta	fgDONE

	lda	#R_SUCCESS
	clc
	rts

*-------------- save a game

save	lda	#TRUE
	sta	fgDONE

	@sys_messages	#SM_SAVE_SLOT
	jsr	RDKEY
	cmp	#"1"
	bcc	save_bad
	cmp	#"9"+1
	bcs	save_bad

	jsr	COUT	; show chosen slot
	jsr	saveSLOT
	bcs	save_bad

save_good	lda	#R_SUCCESS
	clc
	rts

save_bad	lda	#R_FAIL
	sec
	rts

*---

saveSLOT	sta	pPARTY+5

	jsr	PRODOS
	dfb	$C1
	da	gDESTROY

	jsr	PRODOS
	dfb	$C0
	da	gCREATE

	jsr	PRODOS
	dfb	$C8
	da	gOPEN
	bcc	ss_ok
	rts

ss_ok	lda	gOPEN+5
	sta	gREAD+1
	sta	gCLOSE+1
	
	jsr	PRODOS
	dfb	$CB	; it is a WRITE
	da	gREAD

	php
	jsr	PRODOS
	dfb	$CC
	da	gCLOSE
	plp
	rts

*--- Data

gDESTROY	dfb	$01
	da	pPARTY	; +01

gCREATE	dfb	$07
	da	pPARTY	; +01
	dfb	$e3	; +03
	dfb	$5d	; +04
	dw	$8026	; +05
	dfb	$01	; +07
	ds	2	; +08
	ds	2	; +0A

*-------------- load a game

load	lda	#TRUE
	sta	fgDONE

	@sys_messages	#SM_LOAD_SLOT
	jsr	RDKEY
	cmp	#"1"
	bcc	load_bad
	cmp	#"9"+1
	bcs	load_bad

	jsr	loadSLOT
	bcs	load_bad
	
load_good	lda	#TRUE
	sta	fgQUIT	; end the party
	sta	fgRESTART	; but start where we left

	lda	#R_SUCCESS
	clc
	rts

load_bad	lda	#R_FAIL
	sec
	rts

*---

loadSLOT	sta	pPARTY+5

	jsr	PRODOS
	dfb	$C8
	da	gOPEN
	bcc	ls_ok
	rts

ls_ok	lda	gOPEN+5
	sta	gREAD+1
	sta	gCLOSE+1
	
	jsr	PRODOS
	dfb	$CA
	da	gREAD
	bcs	ls_end

	ldx	#3
]lp	lda	lsHEADER,x
	cmp	mySTRING,x
	bne	ls_err
	dex
	bpl	]lp

	clc
	hex	24
ls_err	sec

ls_end	php
	jsr	PRODOS
	dfb	$CC
	da	gCLOSE
	plp
	rts

*--- Data

mySTRING	asc	"BDK1"
pPARTY	str	"GAME0"

gOPEN	dfb	$3
	da	pPARTY	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

gREAD	dfb	$4
	ds	1	; ref_num
	da	lsHEADER	; data_buffer
	dw	DATA_END-DATA_BEGIN ; request_count
	ds	2	; transfer_count

gCLOSE	dfb	$1
	ds	1	; ref_num

*-------------- wait for a keypress

anykey	@sys_messages	#SM_PRESS_ANY_KEY
	jsr	RDKEY
	lda	#R_SUCCESS
	clc
	rts

*-------------- how many turns?

turns	ldx	#FLG_TURNS_LO
	lda	flags,x
	tay
	ldx	#FLG_TURNS_HI
	lda	flags,x
	tax
	jsr	binbcd16

	lda	valBCD+2
	and	#$0f
	ora	#"0"
	sta	sturns+0

	lda	valBCD+1
	and	#$f0
	lsr
	lsr
	lsr
	lsr
	ora	#"0"
	sta	sturns+1
	lda	valBCD+1
	and	#$0f
	ora	#"0"
	sta	sturns+2

	lda	valBCD+0
	and	#$f0
	lsr
	lsr
	lsr
	lsr
	ora	#"0"
	sta	sturns+3
	lda	valBCD+0
	and	#$0f
	ora	#"0"
	sta	sturns+4

*--- output

	ldy	#FALSE
	sty	fgTURNS
	
	@sys_messages	#SM_YOU_HAVE_TAKEN

	ldx	#0	; print only non-zero values
]lp	lda	sturns,x
	beq	turns_next	; exit
	cmp	#"0"
	bne	turns_print
	ldy	fgTURNS
	cpy	#FALSE
	beq	turns_skip
turns_print	jsr	COUT
	ldy	#TRUE
	sty	fgTURNS
turns_skip	inx		; next character
	bne	]lp

turns_next	ldy	fgTURNS	; did we ever print out
	cpy	#TRUE	; a character?
	beq	turns_good	; yes
	lda	#"0"	; no, output 0 then
	jsr	COUT

turns_good	@sys_messages	#SM_TURN

	ldx	#FLG_TURNS_LO
	lda	flags,x
	bne	turns_plural
	ldx	#FLG_TURNS_HI
	lda	flags,x
	beq	turns_end

turns_plural	@sys_messages	#SM_TURNS_PLURAL

turns_end	@sys_messages	#SM_DOT	

	lda	#R_SUCCESS
	clc
	rts

*--- Data

sturns	asc	"00000"00
fgTURNS	ds	2	; $00: no header 0, $FF otherwise

*-------------- what is my score?

score	ldx	#FLG_SCORE
	lda	flags,x
	jsr	itoa	; flag 30 holds score

	txa		; save score in ascii
	ora	#"0"
	sta	sscore
	tya
	and	#$f0
	lsr
	lsr
	lsr
	lsr
	ora	#"0"
	sta	sscore+1
	tya
	and	#$0f
	ora	#"0"
	sta	sscore+2
	
* display percent complete

	@sys_messages	#SM_YOU_HAVE_SCORED
	@print	#sscore
	@sys_messages	#SM_PERCENT
	@sys_messages	#SM_DOT
	
	lda	#R_SUCCESS
	clc
	rts

*--- Data

sscore	asc	"000"00

*------------------------------
* condition function table

cndtbl	da	null	; 0..15
	da	at
	da	carried
	da	not_carried
	da	lower_than
	da	greater_than
	da	equal
	da	not_at
	da	at_lower_than
	da	worn
	da	not_worn
	da	present
	da	absent
	da	zero
	da	not_zero
	da	chance
	
*------------------------------
* action function table

acttbl	da	null	; 0..27..30
	da	go
	da	desc
	da	quit
	da	beep
	da	set
	da	clear
	da	oremove
	da	message
	da	drop
	da	wear
	da	pause
	da	create
	da	destroy
	da	swap
	da	plus
	da	minus
	da	let
	da	ok
	da	done
	da	turns
	da	inven
	da	end
	da	save
	da	load
	da	anykey
	da	score
	da	get
	da	switchCASE	; ** new ** toggle lower/upper case mode
	da	switchHOME	; ** new ** toggle home/scroll on location change
	da	switchDEBUG	; ** new ** toggle debug display on/off
	da	switchACCENTS	; ** new ** toggle accents on/off
	
*------------------------------
* ROUTINES
*------------------------------

*-------------- PRINT SPACE

print_space	lda	#chrSPACE
	jmp	COUT

*-------------- PRINT RETURN

print_return	lda	#chrRETURN
	jmp	COUT

*-------------- PRINT WORD

print_word	ldy	#1	; get length
	lda	(dpWORDS),y
	tax
]lp	iny
	lda	(dpWORDS),y	; get char
	jsr	COUT	; print it
	dex
	bne	]lp	; until the end
	rts
	
*-------------- GET_OBJECT_NAME

get_object_name	tax		; object index

	lda	#<tblOBJECTS
	sta	dpFROM
	lda	#>tblOBJECTS
	sta	dpFROM+1

gom_outer	cpx	#0
	beq	gom_ok

	ldy	#0	; did we reach end of entry?
]lp	lda	(dpFROM),y
	beq	gom_next	; yes
	iny
	bne	]lp
	
gom_next	iny
	tya
	clc
	adc	dpFROM
	sta	dpFROM
	lda	#0
	adc	dpFROM+1
	sta	dpFROM+1

gom_good	dex		; next object
	jmp	gom_outer	; could be bne
	
gom_ok	ldx	dpFROM+1	; return with the string pointer
	ldy	dpFROM
	iny
	bne	gom_exit
	inx
gom_exit	rts

*-------------- GET_LOCATION_NAME

get_location_name
	lda	#<tblLOCATIONS
	sta	dpFROM
	lda	#>tblLOCATIONS
	sta	dpFROM+1
	jmp	gsm_outer

*-------------- GET_MESSAGE

get_message
	lda	#<tblMESSAGES
	sta	dpFROM
	lda	#>tblMESSAGES
	sta	dpFROM+1
	jmp	gsm_outer

*-------------- GET_SYS_MESSAGE

get_sys_message
	lda	#<tblSYSMESSAGES
	sta	dpFROM
	lda	#>tblSYSMESSAGES
	sta	dpFROM+1
	
gsm_outer	cpx	#0
	beq	gsm_ok

gsm_inner	ldy	#0	; did we reach end of entry?
	lda	(dpFROM),y
	beq	gsm_next	; yes
	
	inc	dpFROM	; source++
	bne	gsm_inner
	inc	dpFROM+1
	bne	gsm_inner
	
gsm_next	inc	dpFROM	; source++
	bne	gsm_good
	inc	dpFROM+1

gsm_good	dex		; next string
	jmp	gsm_outer	; could be bne

gsm_ok	ldy	dpFROM	; return with the string pointer
	ldx	dpFROM+1
	rts

*-------------- SWITCH ACCENTS

switchACCENTS	lda	fgTRANSLATE
	eor	#$80
	sta	fgTRANSLATE
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- SWITCH CASE

switchCASE	lda	fgCASE
	eor	#$80
	sta	fgCASE
	beq	switchCASE9

	lda	#$80	; force accent translation
	sta	fgTRANSLATE	; if upper case display
	
switchCASE9	lda	#R_SUCCESS
	clc
	rts

*-------------- SHOW HOME

switchHOME	lda	fgHOME
	eor	#$80
	sta	fgHOME
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- SWITCH DEBUG

switchDEBUG	lda	fgDEBUG
	eor	#$80
	sta	fgDEBUG
	
	lda	#R_SUCCESS
	clc
	rts

*-------------- PRINT C STRING
* on prend la longueur d'un mot
* on ajoute à CH
* si >39 alors
*  RC
* print word

printCSTRING	sty	pcs1+1
	stx	pcs1+2
	sty	dpFROM
	stx	dpFROM+1

*--- All cases: check string length

	ldy	#0
]lp	lda	(dpFROM),y
	beq	pcsEOS
	iny
	bne	]lp
	ldy	#scrWIDTH
pcsEOS	cpy	#scrWIDTH
	bcc	pcs1
	jmp	pcsLONG

*--- Case 1: string length is <40

pcs1	lda	$ffff
	beq	pcs4
	
	bit	fgCASE
	bpl	pcs2
	and	#%0111_1111
	tax		; from lower to upper
	lda	tblKEY,x

pcs2	bit	fgTRANSLATE
	bpl	pcs3
	
	and	#%0111_1111
	tax		; remove accents
	lda	tblTRANSLATE,x

pcs3	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs4	rts

*--- Case 2: string length is >39

* 012345678
* ANTOINE_TOINET
* ANTOINE/

pcsLONG	ldy	#0
	sty	wordLEN

]lp	lda	(dpFROM),y	; get word length
	beq	pcslEOS	; end of string
	cmp	#chrRETURN
	beq	pcslEOW	; end of word (with a return)
	cmp	#chrSPACE
	beq	pcslEOW	; end of word (with a space)
	iny
	bne	]lp

pcslEOW	iny		; output the space character
pcslEOS	sty	wordLEN	; save nb of chars to output
	tya		; end X pos =+ word length
	clc
	adc	CH
	cmp	#scrWIDTH
	bcc	pcslGOOD	; we can output the word normally
	beq	pcslGOOD
	
	lda	#chrRETURN	; must perform a CR before outputting
	jsr	COUT

pcslGOOD	ldy	#0
]lp	lda	(dpFROM),y
	beq	pcslEND

	bit	fgCASE
	bpl	pcslg2
	and	#%0111_1111
	tax		; from lower to upper
	lda	tblKEY,x

pcslg2	bit	fgTRANSLATE
	bpl	pcslg3
	
	and	#%0111_1111
	tax		; remove accents
	lda	tblTRANSLATE,x

pcslg3	cmp	#chrSPACE	; shall we skip the space character?
	bne	pcslg4

	lda	CH	; beginning of screen
	beq	pcslg5
	cmp	#scrWIDTH-1	; end of screen
	beq	pcslg5
	lda	#chrSPACE

pcslg4	jsr	COUT	; output the char

	iny		; until end of string
	cpy	wordLEN
	bcc	]lp
	
pcslg5	lda	dpFROM
	clc
	adc	wordLEN
	sta	dpFROM
	lda	dpFROM+1
	adc	#0
	sta	dpFROM+1
	jmp	pcsLONG

pcslEND	rts

*--- Data

wordLEN	ds	2

*-------------- REWRITE STRING

rewriteSTRING	ldx	#0
]lp	lda	TEXTBUFFER,x
	and	#%0111_1111
	tay
	lda	tblKEY,y
	sta	TEXTBUFFER,x
	inx
	cpx	lenSTRING
	bcc	]lp
	rts

*-------------- TRANSLATE KEY

translateKEY	jsr	RDKEY
	and	#%0111_1111
	tax
	lda	tblKEY,x
	rts

*-------- Data

fgDEBUG	ds	2	; $00 debug display off, $80 otherwise
fgHOME	ds	2	; $00 lower HOME, $80 otherwise
fgCASE	ds	2	; $00 lower OK, $80 otherwise
fgTRANSLATE	ds	2	; $00 none, $80 remove accents

lenSTRING	ds	2

tblKEY
*	hex	00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F
*	hex	10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F
*	hex	20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F
*	hex	30,31,32,33,34,35,36,37,38,39,3A,3B,3C,3D,3E,3F
*	hex	40,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
*	hex	50,51,52,53,54,55,56,57,58,59,5A,5B,5C,5D,5E,5F
*	hex	60,61,62,63,64,65,66,67,68,69,6A,6B,6C,6D,6E,6F
*	hex	70,71,72,73,74,75,76,77,78,79,7A,7B,7C,7D,7E,7F
	hex	80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8D,8E,8F
	hex	90,91,92,93,94,95,96,97,98,99,9A,9B,9C,9D,9E,9F
	hex	A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF
	hex	B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF
	hex	C1,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,DB,C3,DD,DE,DF
	hex	E0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,C5,D5,C5,FE,FF

tblHEX2DEC	hex	00,01,02,03,04,05,06,07,08,09
	hex	10,11,12,13,14,15,16,17,18,19
	hex	20,21,22,23,24,25,26,27,28,29
	hex	30,31,32,33,34,35,36,37,38,39
	hex	40,41,42,43,44,45,46,47,48,49
	hex	50,51,52,53,54,55,56,57,58,59
	hex	60,61,62,63,64,65,66,67,68,69
	hex	70,71,72,73,74,75,76,77,78,79
	hex	80,81,82,83,84,85,86,87,88,89
	hex	90,91,92,93,94,95,96,97,98,99

* é   è   ç   à   ù
* FB  FD  DC  C0  FC
* C5  C5  C3  C1  D5
* E5  E5  E3  E1  F5

tblTRANSLATE
*	hex	00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F
*	hex	10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F
*	hex	20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F
*	hex	30,31,32,33,34,35,36,37,38,39,3A,3B,3C,3D,3E,3F
*	hex	40,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
*	hex	50,51,52,53,54,55,56,57,58,59,5A,5B,5C,5D,5E,5F
*	hex	60,61,62,63,64,65,66,67,68,69,6A,6B,6C,6D,6E,6F
*	hex	70,71,72,73,74,75,76,77,78,79,7A,7B,7C,7D,7E,7F
	hex	80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8D,8E,8F
	hex	90,91,92,93,94,95,96,97,98,99,9A,9B,9C,9D,9E,9F
	hex	A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF
	hex	B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF
	hex	E1,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,DB,E3,DD,DE,DF
	hex	E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,EA,EB,EC,ED,EE,EF
	hex	F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,FA,E5,F5,E5,FE,FF

*------------------------------
* PUT
*------------------------------

	put	data.s

theSOLUTION

*--- End of code