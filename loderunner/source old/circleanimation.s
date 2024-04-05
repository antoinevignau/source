*
* L'animation affiche 4 points par rapport à un centre
*

circleANIMATION
	LDA	#88	; 88
	STA	caCENTERY
	LDA	#140	; 140
	STA	caCENTERX

	LDA	fgCIRCLE	; inner or outer animation?
	BEQ	L88BD	; show the level

*--- hide the level

	LDX	#170	; 170
	STX	caCURRENTY
	LDX	#0	; 0
	STX	caFGMODE
L88B6	JSR	caDOIT
	DEC	caCURRENTY
	BNE	L88B6

*--- show the level

L88BD	LDA	#1	; 1
	STA	caCURRENTY
	STA	fgCIRCLE
	STA	caFGMODE	; 1
	
	JSR	printMEN
	JSR	printLEVEL
	
L88CB	JSR	caDOIT
	INC	caCURRENTY
	LDA	caCURRENTY
	CMP	#170
	BNE	L88CB
	RTS

*---

caDOIT	LDA	caCURRENTY
	STA	caY16
	LDA	#$00
	STA	caY16+1

	STA	caFROM	; from 0
	STA	caFROM+1

	LDA	caY16	; to Y*2
	ASL
	STA	caTO
	LDA	caY16+1
	ROL
	STA	caTO+1
	
	LDA	#$03	; corrige de 3
	SEC
	SBC	caTO
	STA	caTO
	LDA	#$00
	SBC	caTO+1
	STA	caTO+1

*--- On calcule les Y

	LDA	caCENTERY	; Point 1
	SEC		; vers le haut
	SBC	caCURRENTY
	STA	caY1
	LDA	#$00
	SBC	#$00
	STA	caY1high

	LDA	caCENTERY	; Point 2
	STA	caY4	; Point 3
	STA	caY3

	LDA	#$00
	STA	caY4high
	STA	caY3high

	LDA	caCENTERY	; Point 4
	CLC		; vers le bas
	ADC	caCURRENTY
	STA	caY2
	LDA	#$00
	ADC	#$00
	STA	caY2high

*--- On calcule les X

	LDA	caCENTERX	; points à gauche
	SEC
	SBC	caCURRENTY
	TAX
	LDA	#$00
	SBC	#$00
	JSR	caCALCX
	STY	caX1	; x1 index
	STA	caX1mask	; x1 mask index

	LDX	caCENTERX	; points centraux
	LDA	#$00
	JSR	caCALCX
	STY	caX2
	STY	caX3
	STA	caX2mask
	STA	caX3mask

	LDA	caCENTERX	; points à droite
	CLC
	ADC	caCURRENTY
	TAX
	LDA	#$00
	ADC	#$00
	JSR	caCALCX
	STY	caX4	; x4 index
	STA	caX4mask	; x4 mask index

*-- On boucle

L8951	LDA	caFROM+1	; a-t-on tout affiché ?
	CMP	caY16+1
	BCC	L896F	; non
	BEQ	L8969
L8959	LDA	caFROM
	CMP	caY16
	BNE	L8968
	LDA	caFROM+1
	CMP	caY16+1
	BNE	L8968
	JMP	caDRAWPOINTS ; dernier point et sort
L8968	RTS		; oui

L8969	LDA	caFROM
	CMP	caY16
	BCS	L8959	; oui
L896F	JSR	caDRAWPOINTS ; non

*---

	LDA	caTO+1	; en + ou en -
	BPL	L89A7

	LDA	caFROM	; *2
	ASL
	STA	caTEMP16
	LDA	caFROM+1
	ROL
	STA	caTEMP16+1

	LDA	caTEMP16	; *4
	ASL
	STA	caTEMP16
	LDA	caTEMP16+1
	ROL
	STA	caTEMP16+1

	LDA	caTO	; temp16 += to
	CLC
	ADC	caTEMP16
	STA	caTEMP16
	LDA	caTO+1
	ADC	caTEMP16+1
	STA	caTEMP16+1

	LDA	#$06	; +=6
	CLC
	ADC	caTEMP16
	STA	caTO
	LDA	#$00
	ADC	caTEMP16+1
	STA	caTO+1
	JMP	L8A14

L89A7	LDA	caFROM
	SEC
	SBC	caY16
	STA	caTEMP16
	LDA	caFROM+1
	SBC	caY16+1
	STA	caTEMP16+1

	LDA	caTEMP16
	ASL
	STA	caTEMP16
	LDA	caTEMP16+1
	ROL
	STA	caTEMP16+1

	LDA	caTEMP16
	ASL
	STA	caTEMP16
	LDA	caTEMP16+1
	ROL
	STA	caTEMP16+1

	LDA	caTEMP16
	CLC
	ADC	#$10
	STA	caTEMP16
	LDA	caTEMP16+1
	ADC	#$00
	STA	caTEMP16+1

	LDA	caTEMP16
	CLC
	ADC	caTO
	STA	caTO
	LDA	caTEMP16+1
	ADC	caTO+1
	STA	caTO+1

	LDA	caY16
	PHP
	DEC	caY16
	PLP
	BNE	L89EC
	DEC	caY16+1
L89EC	INC	caY1
	BNE	L89F2
	INC	caY1high
L89F2	DEC	caX4mask
	BPL	L89FC
	LDA	#$06
	STA	caX4mask
	DEC	caX4

L89FC	INC	caX1mask
	LDA	caX1mask
	CMP	#$07
	BNE	L8A0A
	LDA	#$00
	STA	caX1mask
	INC	caX1
L8A0A	DEC	caY2
	LDA	caY2
	CMP	#$FF
	BNE	L8A14
	DEC	caY2high

L8A14	INC	caFROM
	BNE	L8A1A
	INC	caFROM+1

L8A1A	INC	caX3mask
	LDA	caX3mask
	CMP	#$07
	BNE	L8A28
	LDA	#$00
	STA	caX3mask
	INC	caX3
L8A28	DEC	caY4
	LDA	caY4
	CMP	#$FF
	BNE	L8A32
	DEC	caY4high

L8A32	INC	caY3	; y++
	BNE	L8A38
	INC	caY3high
L8A38	DEC	caX2mask	; mask--
	BPL	L8A42
	LDA	#$06	; reset mask
	STA	caX2mask
	DEC	caX2	; x--
L8A42	JMP	L8951

*-----------------------------------
* CALCULE LA COLONNE (X/A)
*-----------------------------------
*  in: X/A
* out: A: bit index
*      Y: column

caBI2BY	=	2	; HGR: 7, SHR: 2

caCALCX	STX	caTEMP16	; sauve le bas
	LDY	#$08	; huit bits
	SEC		; -7
	SBC	#caBI2BY
L8A4C	PHP		; sauve
	ROL	caTEMP16+1
	ASL	caTEMP16
	ROL
	PLP
	BCC	L8A5A
	SBC	#caBI2BY
	JMP	L8A5C
L8A5A	ADC	#caBI2BY

L8A5C	DEY
	BNE	L8A4C
	BCS	L8A64
	ADC	#caBI2BY	; corrige
	CLC
L8A64	ROL	caTEMP16+1	; retourne les valeurs
	LDY	caTEMP16+1	; la colonne
	RTS

*-----------------------------------
* DRAW ALL POSSIBLE POINTS
*-----------------------------------

caDRAWPOINTS
	LDY	caY2high
	BNE	L8A8C
	LDY	caY2
	CPY	#176
	BCS	L8A8C
	JSR	setHGRPOINTERS
	LDY	caX3
	CPY	#hgrWIDTH
	BCS	L8A81
	LDX	caX3mask
	JSR	caDRAW
L8A81	LDY	caX2
	CPY	#hgrWIDTH
	BCS	L8A8C
	LDX	caX2mask
	JSR	caDRAW

L8A8C	LDY	caY1high
	BNE	L8AAF
	LDY	caY1
	CPY	#176
	BCS	L8AAF
	JSR	setHGRPOINTERS
	LDY	caX3
	CPY	#hgrWIDTH
	BCS	L8AA4
	LDX	caX3mask
	JSR	caDRAW
L8AA4	LDY	caX2
	CPY	#hgrWIDTH
	BCS	L8AAF
	LDX	caX2mask
	JSR	caDRAW

L8AAF	LDY	caY3high
	BNE	L8AD2
	LDY	caY3
	CPY	#176
	BCS	L8AD2
	JSR	setHGRPOINTERS
	LDY	caX4
	CPY	#hgrWIDTH
	BCS	L8AC7
	LDX	caX4mask
	JSR	caDRAW
L8AC7	LDY	caX1
	CPY	#hgrWIDTH
	BCS	L8AD2
	LDX	caX1mask
	JSR	caDRAW

L8AD2	LDY	caY4high
	BNE	L8AF5
	LDY	caY4
	CPY	#176
	BCS	L8AF5
	JSR	setHGRPOINTERS
	LDY	caX4
	CPY	#hgrWIDTH
	BCS	L8AEA
	LDX	caX4mask
	JSR	caDRAW
L8AEA	LDY	caX1
	CPY	#hgrWIDTH
	BCS	L8AF5
	LDX	caX1mask
	JMP	caDRAW
L8AF5	RTS

*-----------------------------------
* DRAW OR HIDE BYTE
*-----------------------------------

caDRAW	LDA	caFGMODE
	BNE	L8B02
	LDA	[ptrHGR1],Y	; hide
	AND	L8B0C,X
	STA	[ptrHGR1],Y
	RTS

L8B02	LDA	[ptrHGR2],Y	; show
	AND	L8B13,X
	ORA	[ptrHGR1],Y
	STA	[ptrHGR1],Y
	RTS

*                       00 01 02 03 04 05 06 parce que 7 bits
L8B0C	HEX	F0,F0,F0,F0,8F,8F,8F
L8B13	HEX	8F,8F,8F,8F,F0,F0,F0