*
* VOC: a pure theory
*

*----------------------

vdRAMPageSel	=	$c9
vdAux	=	$00
vdMain	=	$10
vdInterlace	=	$30

vdMainPageLin	=	$c8
vdInterlaceMode	=	$cb
vdEnable	=	1
vdDisable	=	0

SET80COL	=	$c001
WRCARDRAM	=	$c005

*---------------------- The softswitches
*
* $C000
* Bit 7 6 5 4 3 2 1 0
*     | | | | | | | | 
*     | | | | | | | 
*     | | | | | | 
*     | | | | | VBL flag (0 for not detected, 1 for detected)
*     | | | | Video detected flag (0 for not detected, 1 for detected)
*     | | | Genlocked video flag (0 for not genlocked, 1 for genlocked)
*     | | Display field (0 for Field0, 1 for Field1)
*     | VBL Interrupt Request (0 for false, 1 for true)
*     Scan-line interrupt (0 for off, 1 for on)
*
* $C001
* Bit 7 6 5 4 3 2 1 0
*     | | --- | | | | 
*     | |  |  | | | Graphics generator Apple II bus interface (0 for off, 1 for on)
*     | |  |  | | 
*     | |  |  | Out Chroma Filter (0 for off, 1 for on)
*     | |  |  Main Page linearization (0 for off, 1 for on)
*     | |  RAM Page select (00 for Aux, 10 for Main, 11 for Interlace)
*     | VBL Interrupt (0 for off, 1 for on)
*     Scan-line interrupt (0 for off, 1 for on)
*
* $C003
* Bit 7 6 5 4 3 2 1 0
*     | ----- | -----
*     |   |   |   |
*     |   |   |   Key color Dissolve Value
*     |   |   |
*     |   |   Key Color Enhancement Dissolve (0 to disable, 1 to enable)
*     |   | 
*     |   Non-key Color Dissolve Value
*     Out setup (0 for off, 1 for on)
*
* $C004
* Bit 7 6 5 4 3 2 1 0
*     ------- ------- 
*        |       | 
*        |       Key color (Blue)
*        Key color (Green)
*
* $C005
* Bit 7 6 5 4 3 2 1 0
*     | | | | ------- 
*     | | | |    | 
*     | | | |    Key color (red)
*     | | | |
*     | | | |
*     | | | Out External Blank (0 for off, 1 for on)
*     | | Genlock (0 for off, 1 for on)
*     | Key Color (0 to disable, 1 to enable)
*     Interlace mode (0 for off, 1 for on)
*
*---------------------- $C8 - Main page linearization
* On entry:
*  Y: vdEnable / vdDisable
*  Use X: slot*16

doMAINPAGELIN

	sep	#$30
	ldx	slot16
	ldal	SET80COL,x
	and	#%1111_0111
	cpy	#vdDisable	; vdDisable required?
	beq	noLinear
	ora	#%0000_1000
noLinear	stal	SET80COL,x
	rep	#$30
	rts

*---------------------- $C9 - RAM page select
* On entry:
*  Y: vdAux / vdMain / vdInterlace
*  Use X: slot*16

doSELECTPAGE

	sep	#$30
	ldx	slot16
	ldal	SET80COL,x
	and	#%1100_1111
	cpy	#vdAux
	beq	selectPAGE
	ora	#vdMain
	cpy	#vdMain
	beq	selectPage
	ora	#vdInterlace
	cpy	#vdInterlace
	bne	noGoodPage
selectPage	stal	SET80COL,x
noGoodPage	rep	#$30
	rts

*---------------------- $CB - Interlace mode
* On entry:
*  Y: vdEnable / vdDisable
*  Use X: slot*16

doINTERLACEMODE

	sep	#$30
	ldx	slot16
	ldal	WRCARDRAM,x
	and	#%0111_1111
	cpy	#vdDisable	; vdDisable required?
	beq	noInterlace
	ora	#%1000_0000
noInterlace	stal	WRCARDRAM,x
	rep	#$30
	rts

