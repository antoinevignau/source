*
* Apple IIgs accelerators
* Set 2.8MHz & Restore speed
*
* (c) 2024, Brutal Deluxe Software
*

	org	$1000
	mx	%00
	lst	off

*----------------------------------------
* Accelerators
*  Applesqueezer
*  Transwarp GS
*  ZipGSX (+ KEGS, Sweet16)
*
* In full 16-bits
*  set28SPEED
*   identifies the accelerator
*   set the closest speed to 2.8MHz
*
*  restoreSPEED
*   set the previous or highest speed
*----------------------------------------

*----------------------------------------
* EQUATES
*----------------------------------------

*-------------- Applesqueezer
* Niek says: "These 5 settings correspond to the 5 speed options in
* the AppleSqueezer control panel.
* 255 is the fastest setting corresponding to 14MHz. and
* 223 is the slowest setting, corresponding to 3MHz
* Possible values are 255, 251, 247, 239, and 223.

FL_IDLE	=	$e2000a
FL_VERSION	=	$e2000c
SET_SPEED	=	$e50000

*-------------- Transwarp GS
* Possible values: 1000 (1MHz), 2600 (2.6MHz), 7000 (7MHz)

GetCurSpeed	=	$bcff20	; value returned in A
SetCurSpeed	=	$bcff24	; value passed in A

* or, if your prefer indexes: 0 (1MHz), 1 (2.6MHz), 2 (7MHz)

GetICurSpeed	=	$bcff28	; value returned in X
SetICurSpeed	=	$bcff2c	; value passed in X

*-------------- ZipGS
* Sixteen possible speeds (in % of full speed)
* 0: full speed, 4: 75% of full speed, 8: 50%, 12: 25%, 16: 1MHz (disabled)
* Set the value in bits 4-7 of CLRAN2

SETAN0	=	$e0c058
CLRAN0	=	$e0c059
SETAN1	=	$e0c05a
CLRAN1	=	$e0c05b
SETAN2	=	$e0c05c
CLRAN2	=	$e0c05d
SETAN3	=	$e0c05e
CLRAN3	=	$e0c05f

*----------------------------------------
* SAVE SPEED & SET 2.8MHz
*----------------------------------------
* Entry in full 16-bits

set28SPEED	sep	#$20	; Check Applesqueezer

	ldal	FL_IDLE	; do we have an AS?
	and	#$ff
	cmp	#1
	bne	no_AS	; no AS present

*	ldal	SET_SPEED	; get current speed
*	sta	accSPEED	; save it
	lda	#233	; set 3.10MHz
	stal	SET_SPEED	; the closest match
	rep	#$20
	lda	#1	; tell we have an AS acc
	sta	theACC
	rts

	mx	%10

no_AS	rep	#$20	; Check Transwarp IIgs

	ldal	$bcff00	; do we have a TWGS?
	cmp	#'TW'
	bne	no_TW
	ldal	$bcff02
	cmp	#'GS'
	bne	no_TW	; no TWGS present

	jsl	GetCurSpeed	; get current speed
	sta	accSPEED	; save it
	lda	#2600	; set 2.6MHz
	jsr	SetCurSpeed	; the closest match
	lda	#2
	sta	theACC	; tell we have a TWGS
	rts

no_TW	sep	#$20	; Check ZipGSX

	lda	#$5a	; unlock
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	
	ldal	CLRAN0	; do we have a ZipGS?
	eor	#$f8
	sta	temp
	stal	CLRAN0
	ldal	CLRAN0
	cmp	temp
	bne	no_ACC	; no ZipGS present
	eor	#$f8
	stal	CLRAN0
	
	lda	#%1010_0000	; #$10-#$6th option (3.10MHz) or #%1011_0000 for 2.56MHz
	stal	CLRAN2	; set speed
	stal	CLRAN1	; enable card
	lda	#$a5	; lock
	stal	SETAN1

	lda	#3
	sta	theACC	; tell we have a ZipGS

no_ACC	rep	#$20
	rts
	
*----------------------------------------
* RESTORE ORIGINAL SPEED
*----------------------------------------
* Entry in full 16-bits

restoreSPEED	lda	theACC	; Applesqueezer?
	cmp	#1
	bne	check_TW

	sep	#$20
	lda	accSPEED
	stal	SET_SPEED
	rep	#$20
	rts

check_TW	cmp	#2	; Transwarp GS?
	bne	check_ZIP

	lda	accSPEED	; restore speed
	jsl	SetCurSpeed
	rts
	
check_ZIP	cmp	#3	; ZipGSX?
	bne	check_NADA

	sep	#$20	; restore speed
	lda	#$5a	; unlock
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	lda	#%0000_0000	; any write to set fastest speed
	stal	CLRAN2
	stal	CLRAN1	
	lda	#$a5	; lock
	stal	SETAN1
	rep	#$20	

check_NADA	rts

*-------------- Data

theACC	ds	2	; 1:AS / 2:TW / 3:ZIP
accSPEED	ds	2

*-------------- End of code