; N° du mot1 dans MOTX1; *****************************************************
; **                                                 **
; **  fonctions musicales et graphiques pour VG5000  **
; **  PLAY,SOUND,MUSIC,PING,SHOOT,EXPLODE,ZAP,WAIT	 **
; **  CADRE,ZONE,DESSIN,COPY_GR,COPY_EG,SAVEDES      **
; **                                                 **
; *****************************************************
;
; assembleur utilisé TASM301
;
; tasm.exe -80 -g3 sound.asm
;

DIRX	.equ	0FFFCh	; direction		(-4)
MOTX1	.equ	0FFFDh	; 1er mot 		(-3)
MOTX2	.equ	0FFFEh	; 2eme mot		(-2)
BFACT	.equ	0FFE0h	; buffer chaine action	(-32)
NL		.equ	0FFDFh	; N° action				(-33)
		
start:
; Les fonctions sont appelées par le Hook MODEM

;	PING	'G'	; C000 = -16384
;	SHOOT	'T'	; C002 = -16382
;	EXPLODE	'E'	; C004 = -16380
;	ZAP		'Z'	; C006 = -16378
;	PLAY	'P'	; C008 = -16376
;	SOUND	'S'	; C00A = -16374
;	MUSIC	'M'	; C00D = -16371
;	WAIT	'W'	; C010 = -16368
;
;
;	ZONE	'N'		; 0C400h = -15360
;	DESSIN	'D'		; 0C409h = -15351
;	CADRE	'C'		; 0C40Fh = -15345
;	SCROLL	'L'		; 0C412h = -15342
;	PAPER	'F'
;
;	VOCA1	'U'
;	VOCA2	'V'
;	DIR		'I'
;	ACTION	'A'

; mise en place du Hook MODEM
; CALL -16384

	.org 0C000h	
	push hl
; vecteur MODEM	
	ld hl,entry
	ld (47f8h),hl
	ld a,0c3h
	ld (47f7h),a	
	pop hl
	ret


entry:

	ld a,(hl)
	inc hl
	cp 'G'
	jp z, PING
	cp 'T'
	jp z, SHOOT
	cp 'E'
	jp z, EXPLODE
	cp 'Z'
	jp z, ZAP
	cp 'P'
	jp z, PLAY
	cp 'S'
	jp z, SOUND
	cp 'M'
	jp z, MUSIC
	cp 'W'
	jp z, WAIT	
	cp 'N'
	jp z, ZONE
	cp 'D'
	jp z, DESSIN
	cp 'C'
	jp z, CADRE
	cp 'L'
	jp z, SCROLL
	cp 'F'
	jp z, PAPER
	cp 'U'
	jp z,VOCA1
	cp 'V'
	jp z,VOCA2
	cp 'I'
	jp z,DIR
	cp 'A'
	jp z,ACTION
	ret
	
	
ZAP:
	push hl
	ld hl,dataZAP
	call trf
	
	ld c,0
zap0:	
	xor a
	out (0ffh),a
	ld a,c
	out (0feh),a
	ld b,0
zap1:
	nop
	djnz zap1
	inc c
	ld a,c
	cp 070h
	jr nz,zap0
	ld a,8
	out (0ffh),a
	xor a
	out (0feh),a
	pop hl
	ret
		

PING:			; fonction ping
	push hl
	ld hl,dataPING
	call trf
	pop hl
	ret

	
SHOOT:			; fonction shoot
	push hl
	ld hl,dataSHOOT
	call trf
	pop hl
	ret

	
EXPLODE:			; fonction explode
	push hl
	ld hl,dataEXPLODE
	call trf
	pop hl
	ret

	
trf:	
	ld c,0
trf1:	
	ld a,c
	cp 0eh
	ret z
	ld b,(hl)
	call W8192
	inc c
	inc hl
	jr trf1
	
PLAY:				; commande PLAY t,s,e,d
	call rdval
	ld (PARAMS+1),de
	jr nz, error_syntaxe
	call rdval
	ld (PARAMS+3),de
	jr nz, error_syntaxe
	call rdval
	ld (PARAMS+5),de
	jr nz, error_syntaxe	
	call rdval	
	ld (PARAMS+7),de
	
	push hl
	ld IY,PARAMS
	ld a,(IY+3)
	sla a
	sla a
	sla a
	or (IY+1)
	xor 03fh
	ld b,a
	ld a,7
	call W8192
	ld l,(IY+7)
	ld h,(IY+8)
	add hl,hl
	ld a,0bh
	ld b,l
	call W8192
	ld a,0ch
	ld b,h
	call W8192
	ld c,(IY+5)
	ld b,0	
	ld hl,dataPLAY
	add hl,bc
	ld a,(hl)
	pop hl
	and 7
	ld b,a
	ld a,0dh
	jp W8192

	
error_syntaxe:
	ld e,02h
	jp 2252h
	
	
	
SOUND:				; commande SOUND c,h,v
	call rdval
	ld (PARAMS+1),de
	jr nz, error_syntaxe
	call rdval
	ld (PARAMS+3),de
	jr nz, error_syntaxe
	call rdval
	ld (PARAMS+5),de
sound1:	
	ld IY,PARAMS
	ld a,(IY+1)
	cp 1
	jr nz, snd2
	ld b,(IY+3)
	xor a
	call W8192
	ld b,(IY+4)
	ld a,1
	call W8192
snd0:
	ld a,(IY+5)
	and 0fh
	ld b,a
	jr nz, snd1
	ld b,10h
snd1:	
	ld a,8
	jr W8192

snd2:
	cp 2
	jr nz,snd4
	ld b,(IY+3)
	ld a,2
	call W8192	
	ld b,(IY+4)
	ld a,3
	call W8192
snd2a:
	ld a,(IY+5)
	and 0fh
	ld b,a
	jr nz, snd3
	ld b,10h
snd3:	
	ld a,9
	jr W8192	
	
snd4:
	cp 3
	jr nz,snd6
	ld b,(IY+3)
	ld a,4
	call W8192	
	ld b,(IY+4)
	ld a,5
	call W8192
snd4a:	
	ld a,(IY+5)
	and 0fh
	ld b,a
	jr nz, snd5
	ld b,10h
snd5:	
	ld a,10
	jr W8192		

snd6:
	ld b,(IY+3)
	ld a,6
	call W8192
	
	ld a,(IY+1)
	cp 4
	jr z, snd0
	cp 5
	jr z, snd2a
	cp 6
	jr z, snd4a
	inc (IY+0)
	ret
	
W8192:				; psg [a]=b
	out (0ffh),a
	ld a,b
	out (0feh),a
	ret


	
MUSIC:				; music c,o,n,v
	call rdval
	ld (PARAMS+1),de
music0:
	jp nz, error_syntaxe
	call rdval
	ld (PARAMS+3),de
	jr nz, music0
	call rdval
	ld (PARAMS+5),de
	jr nz, music0
	call rdval	
	ld (PARAMS+7),de
	
	push hl
	ld IY,PARAMS
	ld e,(IY+3)
	ld c,(IY+5)
	ld b,0
	ld hl,dataMUSIC
	add hl,bc
	ld a,(hl)
	ld (IY+4),a
	ld hl,dataMUSIC1
	add hl,bc
	ld a,(hl)
	ld (IY+3),a
	ld a,(IY+7)
	ld (IY+5),a
	pop hl
music1: 	
	dec e
	jp m,sound1
	srl (IY+4)
	rr (IY+3)
	jr music1

rdval:
	inc hl
	call 89h
	call 83h
	ld a,(hl)
	cp ','
	ret	
	
	
WAIT:
	call rdval
	ld (W_COUNT),de
wait1:
	ld bc,1200
wait2:
	nop
	dec bc
	ld a,b
	or c
	jr nz,wait2
	
	ld de,(W_COUNT)
	dec de
	ld (W_COUNT),de
	ld a,d
	or e
	jr nz, wait1
	ret



;
;*********************************************
;*                                           *
;* ** DESSIN CADRE ** *
;*                                           *
;*********************************************
;
;

VRAM	.equ	405Ch
BUFFER	.equ	0D000h

				
;   scrooling text 1 ligne vers le haut
;  depuis Y vers Y-1	
SCROLL:	
	push hl
scroll0:
	ld a,(4806h)
	cp 24
	jr z,scroll1
	cp 23
	jr nz,fin
scroll1:
	ld de,45A0h
	ld hl,45F0h
	ld bc,0230h
	ldir
	ld a,(4806h)
	push af
	ld hl,4780h
	ld (hl),80h
	inc hl
	ld (hl),0b3h
	inc hl
	ld b,39
scroll2:
	ld (hl),' '
	inc hl
	ld (hl),0
	inc hl
	djnz scroll2
	pop af
	dec a
	ld (4806h),a
	jr scroll0	
fin:
	pop hl
	ret
	
; trace le cadre et vide l'intérieur
CADRE:
	push hl
	di
	ld hl,0400Ah
	ld de,80
	push hl
	
	ld (hl),92
	inc hl
	ld (hl),083h
	inc hl
	
	ld b,28
cadre1:	
	ld (hl),76
	inc hl
	ld (hl),083h
	inc hl
	djnz cadre1
	
	ld (hl),108
	inc hl
	ld (hl),083h
	
	
	pop hl
	ld b,15
cadre2:
	push bc
	add hl,de
	push hl		
	ld (hl),85
	inc hl
	ld (hl),083h
	inc hl	

	ld b,28
	call effligne

	ld (hl),106
	inc hl
	ld (hl),083h
	pop hl
	pop bc
	djnz cadre2
	add hl,de
	
	ld (hl),77
	inc hl
	ld (hl),083h
	inc hl	
	
	ld b,28
cadre3:	
	ld (hl),76
	inc hl
	ld (hl),083h
	inc hl
	djnz cadre3
	
	ld (hl),78
	inc hl
	ld (hl),083h
	
	ei
	ld a,1
	ld (47fbh),a
	call W_RFSH
	pop hl
	ret

; efface une ligne
; b=nbr de caractères
; hl=adresse début
effligne:
	ld (hl),' '
	inc hl
	ld (hl),0
	inc hl
	djnz effligne
	ret
	
; ** vidage de la zone en bas de l'écran **
;
ZONE:
	push hl
	ld hl,045A0h	
	ld de,80
	ld b,7
zone1:	
	push hl
	ld (hl),080h
	inc hl
	ld (hl),0B3h
	inc hl
	push bc
	ld b,39
	call effligne
	pop bc
	pop hl
	add hl,de
	djnz zone1	
	ld a,1
	ld (4805h),a
	ld a,18
	ld (4806h),a
	pop hl
	ret
	
; copie un dessin vers la zone image
; puis met à jour les tables de caractères
;

DESSIN:
	di
	push hl
	ld hl,VRAM
	ld de,BUFFER
	ld b,14
dessin1:	
	push bc
	push hl
	ld bc,56
	ex de,hl
	ldir
	ex de,hl
	pop hl
	ld bc,80
	add hl,bc
	pop bc
	djnz dessin1
	
; copie la table EG	
	ld hl,BUFFER+0400h
	ld e,(hl)
	inc hl
	ld d,(hl)
	inc hl
	ld a,e
	or d
	call nz,copyEG
; copie la table GR	
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld a,e
	or d
	call nz,copyEG	
	pop hl
	ei
	ret
	
PAPER:
	push hl
	ld b,3
paper0:
	push bc
	ld a,68
	call ZONE_P
	call W_RFSH
	ld a,65
	call ZONE_P
	call W_RFSH
	ld a,67
	call ZONE_P
	call W_RFSH
	ld a,65
	call ZONE_P
	call W_RFSH
	xor a
	call ZONE_P
	call W_RFSH
	pop bc
	djnz paper0
	pop hl
	ret
	
ZONE_P
	di	
	ld hl,VRAM+1
	ld b,15
paper1:
	push bc
	push hl
	ld b,28
paper2:	
	ld (hl),a
	inc hl
	inc hl
	djnz paper2
	pop hl
	ld bc,80
	add hl,bc
	pop bc
	djnz paper1	
	ld a,1
	ld (47fbh),a
	ei
	ret
	
W_RFSH:	
	ld a,(47fbh)
	cp 00
	jr nz,W_RFSH
	
	ld b,50
W_RFSH1:
	djnz W_RFSH1
	ret
	
	
	
;** CODE DE REDEFINITION DES CARACTERES **
;

; copie de la table GR
; de=adr table
copyGR:
	push hl
	ex de,hl
	ld c,32
	ld b,127

setcar1:	
	ld a,c
	or 80h
	push hl
	push bc
	call 1bh
	pop bc
	pop hl
	ld de,10
	add hl,de
	inc c
	djnz setcar1
	pop hl
	ret	


; copie de la table EG
; de=adr table

copyEG:

	push hl
	ex de,hl	
	ld c,32
	ld b,127

setcar2:	
	ld a,c
	push hl
	push bc
	call 1bh
	pop bc
	pop hl
	ld de,10
	add hl,de
	inc c
	djnz setcar2
	
	pop hl
	ret

;
;***************
;*             *
;* VOCABULAIRE *
;*             *
;***************
;


VOCA1:
	call VOCAx
	ld (MOTX1),a
	ret
	
VOCA2:
	call VOCAx
	ld (MOTX2),a
	ret

VOCAx:
	inc hl			; lecture des paramètres d'une expression
	call 02861h		; lecture de l'expression après la commande
	push hl
	call 02851h		; vérifie que c'est une chaîne de car.
	call 37d1h
	call 05e0h		; E=nb de caractères, BC=adr de la chaine

	ld hl,CHAINE
	push hl
	ld d,0
voca00:	
	ld a,(BC)
	ld (HL),a
	inc hl
	inc bc
	inc d
	ld a,d
	cp 04
	jr z,voca02
	cp e
	jr nz,voca00
voca01:	

	ld a,d
	cp 04
	jr z, voca02
	ld (hl),' '
	inc hl
	inc d
	jr voca01
	
voca02:	
	pop hl
	ld de,VOCAB
voca0:	
	push de
	push hl
	ld b,4
voca1:	
	ld a,(de)
	cp (hl)
	inc hl
	inc de
	jr nz,voca2
	
	djnz voca1
	ld a,(de)
	pop hl
	pop de
	jr voca3
	
voca2:	
	pop de
	pop hl
	ld bc,5
	add hl,bc
	ld a,(hl)
	ex de,hl
	cp 0
	jr nz,voca0
voca3:
	pop hl
	ret


DIR:
	call rdval	
	ld (PARAMS+1),de		; N° de la salle
							; N° du mot dans MOTX1
	push hl
	ld a,(PARAMS+1)
	ld b,a
	dec b
	
	ld hl,DIRD	
dir1:	
	ld a,(hl)
	inc hl
	or a
	jr nz,dir1
	djnz dir1
	
dir2:
	ld a,(hl)
	or a
	jr z, dir4		;a=0
	
	ld a,(MOTX1)
	cp (hl)
	inc hl
	jr nz,dir2
	ld a,(hl)		; a=N° salle destination
	
dir4:
	ld (DIRX),a
	pop hl
	ret
	
ACTION:
	push hl		 	; N° du mot1 dans MOTX1
					; N° du mot2 dans MOTX2
	xor a
	ld (NL),a
	ld (BFACT),a
	ld hl,ACTIOND	
acti1:	
	ld a,(MOTX1)
	cp (hl)
	inc hl
	jr nz, acti2
	ld a,(MOTX2)
	cp (hl)
	jr z, acti3
	cp 0
	jr z, acti3

acti2:
	ld a,(hl)
	inc hl
	cp 0ffh
	jr nz,acti2
	ld a,(hl)
	cp 0ffh
	jr z,acti5
	ld a,(NL)
	inc a
	ld (NL),a
	jr acti1
	
acti3:
	ld de,BFACT
acti4:	
	ld a,(hl)
	ld (de),a
	inc hl
	inc de
	cp 0ffh
	jr nz,acti4
acti5:
	pop hl
	ret
	


dataPING:
	.byte 18h,00h,00h,00h,00h,00h,00h
	.byte 3Eh,10h,00h,00h,00h,0Fh,00h
	
dataSHOOT:
	.byte 00h,00h,00h,00h,00h,00h,0Fh
	.byte 07h,10h,10h,10h,00h,08h,00h
	
dataEXPLODE:
	.byte 00h,00h,00h,00h,00h,00h,1Fh
	.byte 07h,10h,10h,10h,00h,18h,00h
	
dataZAP:
	.byte 00h,00h,00h,00h,00h,00h,00h
	.byte 3Eh,0Fh,10h,10h,00h,00h,00h

dataPLAY:
	.byte 00h,00h,04h,08h,0Ah,0Bh,0Ch,0Dh
	
dataMUSIC:
	.byte 00h,07h,07h,06h,06h,05h,05h,05h
	.byte 04h,04h,04h,04h,03h

dataMUSIC1:
	.byte 00h,77h,0Bh,0A6h,47h,0ECh,97h
	.byte 47h,0FBh,0B3h,070h,30h,0F4h
	
PARAMS:
	.byte 00h
	.byte 00h,00h
	.byte 00h,00h
	.byte 00h,00h
	.byte 00h,00h
	
W_COUNT:
	.byte 00h,00h,00h

COUNT:
	.byte 00h,00h

CHAINE:
	.byte 0,0,0,0,0

VOCAB:
	.byte "N   ",001h,"NORD",001h,"S   ",002h,"SUD ",002h
	.byte "E   ",003h,"EST ",003h,"O   ",004h,"OUES",004h
	.byte "MONT",005h,"GRIM",005h,"DESC",006h
	.byte "PREN",00Ah,"RAMA",00Ah
	.byte "POSE",00Bh,"OUVR",00Ch,"FERM",00Dh
	.byte "ENTR",00Eh,"AVAN",00Eh,"ALLU",00Fh
	.byte "ETEI",010h,"REPA",011h
	.byte "DEPA",011h,"LIS ",012h,"REGA",013h
	.byte "RETO",014h,"RENI",015h,"SENS",015h
	.byte "REMP",016h,"VIDE",017h,"INVE",018h	
	.byte "LIST",018h,"RIEN",019h,"ATTE",019h
	.byte "POIG",01Ah,"COUT",01Bh,"TOUR",01Ch
	.byte "LAMP",01Dh,"CODE",01Eh,"ESCA",01Fh
	.byte "PIST",020h,"PLAC",021h,"TORC",022h
	.byte "TELE",023h,"MONS",024h,"PETR",025h
	.byte "POT ",026h,"LIT ",012h
	.byte "CLEF",027h,"PAPI",028h
	.byte "LIVR",029h,"BRIQ",02Ah,"COMB",02Bh
	.byte "COFF",02Ch,"ROUG",02Dh,"BLEU",02Eh
	.byte "VERT",02Fh,"TITR",030h,"ROBI",031h
	.byte "CISE",032h,"PORT",033h,"ACTI",034h
	.byte "JETE",035h,"LANC",035h,"EAU ",036h
	.byte "ENFI",037h,"PASS",037h
	.byte "APPU",038h,"ENFO",039h,"ENLE",03Ah
	.byte "RENT",03Bh
	.byte 0

DIRD:
	.byte 0, 0, 4,3,3,4,0, 3,2,0
	.byte 4,2,3,5,1,6,0, 4,4,1,7,3,20,0
	.byte 2,4,0, 4,8,1,9,2,5,0, 3,7,0
	.byte 4,13,2,7,3,10,0, 4,9,2,11,0
	.byte 1,10,3,12,0, 4,11,0, 3,9,0
	.byte 2,9,3,15,0, 0, 0, 0, 0
	.byte 1,22,3,21,0, 4,5,0 ,1,25,2,22,0
	.byte 1,21,0, 1,24,4,22,0, 2,23,0, 2,21,0
	
ACTIOND:	
	.byte 14,0,"A01.I02D02M.",0ffh
	.byte 5,0,"A03D08.D03N.",0ffh
	.byte 5,0,"A03E08E09D24.D04D05I19E02M.",0ffh
	.byte 5,0,"A03E08D24.D04D06N.",0ffh
	.byte 5,0,"A03E07.I19M.",0ffh
	.byte 5,0,"A03E03.I19M.",0ffh
	.byte 5,0,"A03.I19E02M.",0ffh
	.byte 6,0,"A19D08.D03N.",0ffh
	.byte 6,0,"A19E08E09D24.D04D05I03M.",0ffh
	.byte 6,0,"A19E08D24.D04D06N.",0ffh
	.byte 6,0,"A19.I03M.",0ffh
	.byte 1,0,"A09E07B22.D07N.",0ffh
	.byte 1,0,"A09E03B05.D07N.",0ffh
	.byte 1,0,"A09.I14E02M.",0ffh
	.byte 1,0,"A14.I16E02M.",0ffh
	.byte 2,0,"A16E07B22.D07N.",0ffh
	.byte 2,0,"A16E03B05.D07N.",0ffh
	.byte 2,0,"A16.I14E02M.",0ffh
	.byte 4,0,"A15E03B05.D07N.",0ffh
	.byte 4,0,"0A15E07B22.D07N.",0ffh
	.byte 4,0,"A15.I14E02M.",0ffh
	.byte 1,0,"A15E03.I17M.",0ffh
	.byte 1,0,"A15E07.I17M.",0ffh
	.byte 1,0,"A15.I17E02M.",0ffh
	.byte 2,0,"A17.F01I15M.",0ffh
	.byte 3,0,"A17.D08N.",0ffh
	.byte 4,0,"A17.D09K.",0ffh
	.byte 3,0,"A18.D10F03E01E02I17M.",0ffh
	.byte 4,0,"A21E03.I19M.",0ffh
	.byte 4,0,"A21E07.I19M.",0ffh
	.byte 4,0,"A21.I19E02M.",0ffh
	.byte 2,0,"A22E03.I19M.",0ffh
	.byte 2,0,"A22E07.I19M.",0ffh
	.byte 2,0,"A22.I19E02M.",0ffh
	.byte 2,0,"A19.D11N.",0ffh
	.byte 4,0,"A19.D11N.",0ffh
	.byte 3,0,"A22.D12I23M.",0ffh
	.byte 25,0,"A01.D13.",0ffh
	.byte 25,0,"I01.D14K.",0ffh
	.byte 12,44,"A03.D15M.",0ffh
	.byte 10,34,"B01.B01J.",0ffh
	.byte 10,27,"B08.B08J.",0ffh
	.byte 10,28,"B04.B04J.",0ffh
	.byte 10,29,"B05.B05J.",0ffh
	.byte 10,32,"B21.B21J.",0ffh
	.byte 10,38,"B24.B24J.",0ffh
	.byte 10,39,"B12.B12J.",0ffh
	.byte 10,40,"B09.B09J.",0ffh
	.byte 10,41,"B10.B10J.",0ffh
	.byte 10,43,"B18.B18J.",0ffh
	.byte 10,50,"B03.B03J.",0ffh
	.byte 10,42,"B22.B22J.",0ffh
	.byte 10,37,"A20B05.H11P05E05D16K.",0ffh
	.byte 10,37,"A20.D17K.",0ffh
	.byte 11,34,".C01J.",0ffh
	.byte 11,27,".C08J.",0ffh
	.byte 11,28,".C04J.",0ffh
	.byte 11,29,".C05J.",0ffh
	.byte 11,32,".C21J.",0ffh
	.byte 11,38,".C24J.",0ffh
	.byte 11,43,"E09.D62K.",0ffh
	.byte 11,39,".C12J.",0ffh
	.byte 11,40,".C09J.",0ffh
	.byte 11,41,".C10J.",0ffh
	.byte 11,43,".C18J.",0fvfh
	.byte 11,50,".C03J.",0ffh
	.byte 11,42,".C22J.",0ffh
	.byte 24,0,".A00L.",0ffh
	.byte 12,49,"A05.E04D20G0405J.",0ffh
	.byte 13,49,"A05.F04J.",0ffh
	.byte 22,38,"A05E04.P24E08J.",0ffh
	.byte 23,38,"A05E08.F08P24J.",0ffh
	.byte 23,38,"E08.D21N.",0ffh
	.byte 18,48,"B10.D22L.",0ffh
	.byte 18,41,"B10.D23N.",0ffh
	.byte 18,40,"B09.D24K.",0ffh
	.byte 20,40,"B09.D25K.",0ffh
	.byte 19,51,"A02.D26M.",0ffh
	.byte 19,51,".D27K.",0ffh
	.byte 21,0,"A14.D28K.",0ffh
	.byte 21,0,".D29K.",0ffh
	.byte 15,42,"C22.D33K.",0ffh
	.byte 15,42,"E07.D30K.",0ffh
	.byte 15,42,"A14.D07N.",0ffh
	.byte 15,42,"A17E01.D10K.",0ffh
	.byte 15,42,"E02.F02E07E06P22M.",0ffh
	.byte 15,42,".E07P22J.",0ffh
	.byte 15,29,"C05.D33K.",0ffh
	.byte 15,29,"E03.D30K.",0ffh
	.byte 15,29,"F07.D31L.",0ffh
	.byte 15,29,"F05.D32L.",0ffh
	.byte 15,29,"E02.F02E03E06P06P05M.",0ffh
	.byte 15,29,".E03P06P05J.",0ffh
	.byte 16,42,"C22.D33K.",0ffh
	.byte 16,42,"F07.D30K.",0ffh
	.byte 16,42,"E06E03.D36F07P22M.",0ffh
	.byte 16,42,"E06.E02F07F06P22M.",0ffh
	.byte 16,42,".F07P22M.",0ffh
	.byte 16,29,"C05.D33K.",0ffh
	.byte 16,29,"F03.D30K.",0ffh
	.byte 16,29,"E07E06.D34F03P05M.",0ffh
	.byte 16,29,"E06.E02F06F03P05M.",0ffh
	.byte 16,29,".F03P05M.",0ffh
	.byte 15,34,"B01.D35N.",0ffh
	.byte 17,35,"I16.D45K.",0ffh
	.byte 17,35,"E02.D43K.",0ffh
	.byte 17,35,"F03.D44K.",0ffh
	.byte 17,35,"C04.D46K.",0ffh
	.byte 17,35,".P16E10J.",0ffh
	.byte 56,0,"A16F10.D47K.",0ffh
	.byte 56,46,"A16.D48N.",0ffh
	.byte 56,45,"A16F09.D50D06N.",0ffh
	.byte 56,45,"A16.D49I18M.",0ffh
	.byte 55,43,"D18E09.D30K.",0ffh
	.byte 55,43,"D18.P18E09J.",0ffh
	.byte 57,43,"D18F09.D30K.",0ffh	
	.byte 57,43,"D18.P18F09J.",0ffh
	.byte 12,33,"A24C12.D51K.",0ffh
	.byte 12,33,"A24C03.D52N.",0ffh
	.byte 12,33,"A24.G0503E11D63K.",0ffh
	.byte 26,36,"E11.D54F11D55K.",0ffh
	.byte 53,50,"E11.D54F11D55K.",0ffh
	.byte 52,32,"B21.D56N.",0ffh
	.byte 58,30,"F08.D57.",0ffh
	.byte 58,30,".D58D59.",0ffh
	.byte 12,33,"A06.D61M.",0ffh
	.byte 12,33,"A25.D64N.",0ffh
	.byte 0ffh
	
	
	
	
	


	.end
	