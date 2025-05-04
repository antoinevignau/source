*
* Math Story Problems
*
* (c) 1987, Orange Cherry Software
* (s) 2025, Antoine Vignau
*

	mx	%00
	lst	off

*-------------------------------

GSOS	=	$E100A8
VF	=	1
	 
	use 	4/Event.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Qd.Macs
	use	4/Sound.Macs
	use	4/Util.Macs

*-------------------------------

* Apple		Atari
* 22	"	7E
* 82	Ç	80
* 88	à	85
* 89	â	83
* 8D	ç	87
* 8E	é	82
* 8F	è	8A
* 90	ê	88
* 91	ë	
* 94	î	8C
* 95	ï	8B
* 99	ô	93
* 9E	û	96
* 9D	ù	97
* CE	OE	B4
* CF	oe	B5

*-------------------------------
	
            CLC
            XCE
            REP   #$30
            PHK
            PLB
            _TLStartUp
            PEA   $0000
            _MMStartUp
            PLA
            STA   L0B93
            JSR   L10AC
            LDA   L0B93
            AND   #$F0FF
            ORA   #$0100
            STA   L0B95
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L0B95
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L10AC
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L0B97
            LDA   L0B97
            TAY
            CLC
            ADC   #$0100
            STA   L0B97
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L0B93
            PHA
            _EMStartUp
            JSR   L10AC
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$0001
            STAL  $E0C029
            LDY   L0B97
            TYA
            CLC
            ADC   #$0300
            STA   L0B97
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0B93
            PHA
            _QDStartUp
            JSR   L10AC
            JMP   L00BD

L00BB       DW    $0000
L00BD       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L00BB
            ASL
            ASL
            ASL
            ASL
            ORA   L00BB
            STA   L00BB
            LDAL  $E0C022
            AND   #$FF00
            ORA   L00BB
            STAL  $E0C022
            JSR   L12CB
            _PenNormal
            PEA   $0000
            _SetFontFlags
            PEA   $0004
            _SetTextMode
            PEA   $000F
            _SetForeColor
            PHA
            PHA
            _NewRgn
            JSR   L10AC
            PLA
            STA   L0B85
            PLA
            STA   L0B87
            LDA   L0B87
            PHA
            LDA   L0B85
            PHA
            _GetClip
            JSR   L10AC
            PHA
            PHA
            _NewRgn
            JSR   L10AC
            PLA
            STA   L0E9B
            PLA
            STA   L0E9B+2
            LDA   L0E9B+2
            PHA
            LDA   L0E9B
            PHA
            _GetClip
            JSR   L10AC
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0B95
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L10AC
            PLA
            STA   L0CAC
            PLA
            STA   L0CAE
            LDA   #$8000
            STA   L0CC2
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0B95
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L10AC
            PLA
            STA   L0ED5
            PLA
            STA   L0ED5+2
            JSR   L233E
            JMP   L01C8

L01B9       STR   'SUBB'
L01BE       DW    $0000       ;  ref num
            ADRL  L01B9       ;  path name
            ADRL  $00000000   ;  reserved
L01C8       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01BE
            JSR   L10AC
            LDA   L01BE
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L01E6

L01E4       DW    $0000
L01E6       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L01E4
            ASL
            ASL
            ASL
            ASL
            ORA   L01E4
            STA   L01E4
            LDAL  $E0C022
            AND   #$FF00
            ORA   L01E4
            STAL  $E0C022
            JSR   L492E
            JSR   L2072
            LDA   #$4000
            STA   L0CD4
            STZ   L0CD2
            JSR   L1217
            BRA   L0228
L0226       DW    $0000
L0228       JMP   L022D

L022B       DW    $0000
L022D       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L022B
            ASL
            ASL
            ASL
            ASL
            ORA   L022B
            STA   L022B
            LDAL  $E0C022
            AND   #$FF00
            ORA   L022B
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $2222
            _ClearScreen
            JSR   L11DD
            JSR   L2DD4
            STZ   L0D80
            LDA   #$0005
            STA   L0226
L0278       LDA   #$0005
            STA   L0B8F
            JSR   L236A
            STA   L1003
            STA   L0D54
            JSR   L2DC0
            BCS   L0278
            LDA   #$0001
            STA   L0D82
L0292       LDA   L1003
            STA   L0D54
            JSR   L2FF9
            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0013
            STA   L0CDA
            LDA   #$0094
            STA   L0CDC
            LDA   #$0009
            STA   L0CE2
            JMP   L02E4

	DO	VF
L02BB       STR   '    Saisis ta r'8e'ponse puis appuie sur'
	ELSE
L02BB       STR   '     Please type your answer, then press'
	FIN
L02E4       LDA   #^L02BB
            STA   L0CDE+2
            LDA   #L02BB
            STA   L0CDE
            JSR   L146D
            JMP   L02FE

	DO	VF
L02F6       STR   'ENTREE.'
	ELSE
L02F6       STR   'RETURN.'
	FIN
L02FE       LDA   #^L02F6
            STA   L0CDE+2
            LDA   #L02F6
            STA   L0CDE
            JSR   L146D
            LDA   #$000F
            STA   L0D50
            LDA   #$0008
            STA   L0D4E
            LDA   #$0097
            STA   L0CDA
            LDA   #$0061
            STA   L0CDC
            LDA   #$0002
            STA   L0CF0
            JSR   L14CA
            CLC
            LDA   #$0089
            STA   L0DE4
            LDA   #$0000
            STA   L0DE6
            LDA   #$00A1
            ADC   #$0001
            STA   L0DE2
            LDA   #$013F
            ADC   #$0001
            STA   L0DE8
            LDA   #$0002
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            JSR   L1592
            LDA   L0D52
            CMP   L0D54
            BNE   L036D
            JMP   L04BA

L036D       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$0088
            STA   L0CDC
            JMP   L0396

	DO	VF
L0381       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L0381       STR   'That is not correct.'
	FIN
L0396       LDA   #^L0381
            STA   L0CDE+2
            LDA   #L0381
            STA   L0CDE
            JSR   L14A6
            LDA   #$00A0
            STA   L0CDC
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   L0D82
            CMP   #$0001
            BCS   L03C1
            JMP   L0409

L03C1       DEC   L0D82
            JMP   L03D9

	DO	VF
L03C7       STR   'Essaye encore.'
	ELSE
L03C7       STR   'Please try again.'
	FIN
L03D9       LDA   #^L03C7
            STA   L0CDE+2
            LDA   #L03C7
            STA   L0CDE
            JSR   L14A6
            LDA   #$0004
            STA   L0CCA
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L2DF6
            PEA   $2222
            _ClearScreen
            JMP   L0292

L0409       LDA   L0D54
            JSR   L2E92
            JMP   L0429

	DO	VF
L0412       STR   'La bonne r'8e'ponse est '
	ELSE
L0412       STR   'The correct answer is '
	FIN
L0429       LDA   #^L0412
            STA   L0CDE+2
            LDA   #L0412
            STA   L0CDE
            LDA   L0CDE
            STA   L0CE4
            LDA   L0CDE+2
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L0461

L045F       STR   '.'
L0461       LDA   #^L045F
            STA   L0CDE+2
            LDA   #L045F
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   #^L0CF6
            STA   L0CDE+2
            LDA   #L0CF6
            STA   L0CDE
            JSR   L14A6
            LDA   #$0004
            STA   L0CCA
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L2DF6
            JMP   L04C7

L04BA       JSR   L2435
            LDA   L0D80
            CLC
            ADC   L0D82
            STA   L0D80
L04C7       DEC   L0226
            BNE   L04CF
            JMP   L0516
L04CF       JMP   L04D4

L04D2       DW    $0000
L04D4       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L04D2
            ASL
            ASL
            ASL
            ASL
            ORA   L04D2
            STA   L04D2
            LDAL  $E0C022
            AND   #$FF00
            ORA   L04D2
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $2222
            _ClearScreen
            JSR   L11DD
            JMP   L0278

L0516       JSR   L3FA4
            BRA   L051D
L051B       DW    $0000
L051D       JMP   L0522

L0520       DW    $0000
L0522       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0520
            ASL
            ASL
            ASL
            ASL
            ORA   L0520
            STA   L0520
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0520
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $2222
            _ClearScreen
            JSR   L11DD
            JSR   L2DD4
            STZ   L0D80
            LDA   #$0005
            STA   L051B
L056D       LDA   #$0005
            STA   L0B8F
            JSR   L236A
            STA   L1003
            STA   L0D54
            JSR   L2DC0
            BCS   L056D
            LDA   #$0001
            STA   L0D82
L0587       LDA   L1003
            STA   L0D54
            JSR   L32DC
            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0013
            STA   L0CDA
            LDA   #$0094
            STA   L0CDC
            LDA   #$0009
            STA   L0CE2
            JMP   L05D9

	DO	VF
L05B0       STR   '    Saisis ta r'8e'ponse puis appuie sur'
	ELSE
L05B0       STR   '     Please type your answer, then press'
	FIN
L05D9       LDA   #^L05B0
            STA   L0CDE+2
            LDA   #L05B0
            STA   L0CDE
            JSR   L146D
            JMP   L05F3

	DO	VF
L05EB       STR   'ENTREE.'
	ELSE
L05EB       STR   'RETURN.'
	FIN
L05F3       LDA   #^L05EB
            STA   L0CDE+2
            LDA   #L05EB
            STA   L0CDE
            JSR   L146D
            LDA   #$000F
            STA   L0D50
            LDA   #$0008
            STA   L0D4E
            LDA   #$0097
            STA   L0CDA
            LDA   #$0061
            STA   L0CDC
            LDA   #$0002
            STA   L0CF0
            JSR   L14CA
            CLC
            LDA   #$0089
            STA   L0DE4
            LDA   #$0000
            STA   L0DE6
            LDA   #$00A1
            ADC   #$0001
            STA   L0DE2
            LDA   #$013F
            ADC   #$0001
            STA   L0DE8
            LDA   #$0002
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            JSR   L1592
            LDA   L0D52
            CMP   L0D54
            BNE   L0662
            JMP   L07AF

L0662       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$0088
            STA   L0CDC
            JMP   L068B

	DO	VF
L0676       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L0676       STR   'That is not correct.'
	FIN
L068B       LDA   #^L0676
            STA   L0CDE+2
            LDA   #L0676
            STA   L0CDE
            JSR   L14A6
            LDA   #$00A0
            STA   L0CDC
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   L0D82
            CMP   #$0001
            BCS   L06B6
            JMP   L06FE

L06B6       DEC   L0D82
            JMP   L06CE

	DO	VF
L06BC       STR   'Essaye encore.'
	ELSE
L06BC       STR   'Please try again.'
	FIN
L06CE       LDA   #^L06BC
            STA   L0CDE+2
            LDA   #L06BC
            STA   L0CDE
            JSR   L14A6
            LDA   #$0004
            STA   L0CCA
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L2DF6
            PEA   $2222
            _ClearScreen
            JMP   L0587

L06FE       LDA   L0D54
            JSR   L2E92
            JMP   L071E

	DO	VF
L0707       STR   'La bonne r'8e'ponse est '
	ELSE
L0707       STR   'The correct answer is '
	FIN
L071E       LDA   #^L0707
            STA   L0CDE+2
            LDA   #L0707
            STA   L0CDE
            LDA   L0CDE
            STA   L0CE4
            LDA   L0CDE+2
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L0756

L0754       STR   '.'
L0756       LDA   #^L0754
            STA   L0CDE+2
            LDA   #L0754
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   #^L0CF6
            STA   L0CDE+2
            LDA   #L0CF6
            STA   L0CDE
            JSR   L14A6
            LDA   #$0004
            STA   L0CCA
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L2DF6
            JMP   L07BC

L07AF       JSR   L2435
            LDA   L0D80
            CLC
            ADC   L0D82
            STA   L0D80
L07BC       DEC   L051B
            BNE   L07C4
            JMP   L080B
L07C4       JMP   L07C9

L07C7       DW    $0000
L07C9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L07C7
            ASL
            ASL
            ASL
            ASL
            ORA   L07C7
            STA   L07C7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L07C7
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $2222
            _ClearScreen
            JSR   L11DD
            JMP   L056D

L080B       JSR   L3FA4
            BRA   L0812
L0810       DW    $0000
L0812       JMP   L0826

L0815       STR   'STAIRS'
L081C       DW    $0000       ;  ref num
            ADRL  L0815       ;  path name
            ADRL  $00000000   ;  reserved
L0826       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L081C
            JSR   L10AC
            LDA   L081C
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L0844

L0842       DW    $0000
L0844       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0842
            ASL
            ASL
            ASL
            ASL
            ORA   L0842
            STA   L0842
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0842
            STAL  $E0C022
            JSR   L492E
            JSR   L2DD4
            STZ   L0D80
            LDA   #$0005
            STA   L0810
L087F       LDA   #$0005
            STA   L0B8F
            JSR   L236A
            STA   L1003
            STA   L0D54
            JSR   L2DC0
            BCS   L087F
            LDA   #$0001
            STA   L0D82
            LDA   L1003
            STA   L0D54
            JSR   L3755
L08A2       LDA   #$000E
            PHA
            _SetForeColor
            LDA   #$0003
            STA   L0CDA
            LDA   #$0042
            STA   L0CDC
            LDA   #$0009
            STA   L0CE2
            JMP   L08D8

	DO	VF
L08C2       STR   '    Saisis ta r'8e'ponse'
	ELSE
L08C2       STR   '     Please type your'
	FIN
L08D8       LDA   #^L08C2
            STA   L0CDE+2
            LDA   #L08C2
            STA   L0CDE
            JSR   L146D
            JMP   L08FD

	DO	VF
L08EA       STR   'puis appuie sur'
	ELSE
L08EA       STR   'answer, then press'
	FIN
L08FD       LDA   #^L08EA
            STA   L0CDE+2
            LDA   #L08EA
            STA   L0CDE
            JSR   L146D
            JMP   L0917

	DO	VF
L090F       STR   'ENTREE.'
	ELSE
L090F       STR   'RETURN.'
	FIN
L0917       LDA   #^L090F
            STA   L0CDE+2
            LDA   #L090F
            STA   L0CDE
            JSR   L146D
            LDA   #$0006
            STA   L0D50
            LDA   #$0007
            STA   L0D4E
            LDA   #$004B
            STA   L0CDA
            LDA   #$0063
            STA   L0CDC
            LDA   #$0002
            STA   L0CF0
            JSR   L14CA
            JSR   L1592
            LDA   L0D52
            CMP   L0D54
            BNE   L0955
            JMP   L0AAD

L0955       LDA   #$000D
            PHA
            _SetForeColor
            LDA   #$0092
            STA   L0CDA
            LDA   #$0097
            STA   L0CDC
            JMP   L0984

	DO	VF
L096F       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L096F       STR   'That is not correct.'
	FIN
L0984       LDA   #^L096F
            STA   L0CDE+2
            LDA   #L096F
            STA   L0CDE
            JSR   L146D
            LDA   #$00A3
            STA   L0CDC
            LDA   #$0009
            PHA
            _SetForeColor
            LDA   L0D82
            CMP   #$0001
            BCS   L09AF
            JMP   L09F6

L09AF       DEC   L0D82
            LDA   #$009C
            STA   L0CDA
            JMP   L09CD

	DO	VF
L09BB       STR   'Essaye encore.'
	ELSE
L09BB       STR   'Please try again.'
	FIN
L09CD       LDA   #^L09BB
            STA   L0CDE+2
            LDA   #L09BB
            STA   L0CDE
            JSR   L146D
            LDA   #$0004
            STA   L0CCA
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L2DF6
            JSR   L1CC3
            JMP   L08A2

L09F6       LDA   L0D54
            JSR   L2E92
            LDA   #$0084
            STA   L0CDA
            JMP   L0A1C

	DO	VF
L0A05       STR   'La bonne r'8e'ponse est '
	ELSE
L0A05       STR   'The correct answer is '
	FIN
L0A1C       LDA   #^L0A05
            STA   L0CDE+2
            LDA   #L0A05
            STA   L0CDE
            LDA   L0CDE
            STA   L0CE4
            LDA   L0CDE+2
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L0A54

L0A52       STR   '.'
L0A54       LDA   #^L0A52
            STA   L0CDE+2
            LDA   #L0A52
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   #^L0CF6
            STA   L0CDE+2
            LDA   #L0CF6
            STA   L0CDE
            JSR   L146D
            LDA   #$0004
            STA   L0CCA
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L2DF6
            JMP   L0ABA

L0AAD       JSR   L2435
            LDA   L0D80
            CLC
            ADC   L0D82
            STA   L0D80
L0ABA       DEC   L0810
            BNE   L0AC2
            JMP   L0B26
L0AC2       JMP   L0AD6

L0AC5       STR   'STAIRS'
L0ACC       DW    $0000       ;  ref num
            ADRL  L0AC5       ;  path name
            ADRL  $00000000   ;  reserved
L0AD6       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0ACC
            JSR   L10AC
            LDA   L0ACC
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L0AF4

L0AF2       DW    $0000
L0AF4       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0AF2
            ASL
            ASL
            ASL
            ASL
            ORA   L0AF2
            STA   L0AF2
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0AF2
            STAL  $E0C022
            JSR   L492E
            JMP   L087F

L0B26       JSR   L3FA4
L0B29       JSR   L1BD0
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L109E
            DW    $0000
            ADRL  L0B3C
L0B3C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0B7D       DB    $00
            DB    $00
L0B7F       DB    $00
            DB    $00
L0B81       DB    $00
            DB    $00
L0B83       DB    $00
            DB    $00
L0B85       DB    $00
            DB    $00
L0B87       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0B8F       DB    $00
            DB    $00
L0B91       DB    $00
            DB    $00
L0B93       DB    $00
            DB    $00
L0B95       DB    $00
            DB    $00
L0B97       DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0BA3       DW    $0000       ;  ref num
L0BA5       ADRL  $00000000   ;  buffer ptr
L0BA9       ADRL  $00000000   ;  request count
L0BAD       ADRL  $00000000   ;  transfer count
L0BB1       DW    $0000       ;  ref num
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    L0C25
            DB    $0C
            DB    $01
            DB    $00
            DB    $C3
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    L0C25
            DB    $0C
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0BDF       DW    $0000       ;  ref num
L0BE1       ADRL  $00000000   ;  buffer ptr
L0BE5       ADRL  $00000000   ;  request count
L0BE9       ADRL  $00000000   ;  transfer count
L0BED       DW    $0000       ;  ref num
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $C3
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C01       DW    $0000       ;  ref num
            ADRL  $00000000   ;  buffer ptr
L0C07       ADRL  $00000000   ;  request count
            ADRL  $00000000   ;  transfer count
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C25       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CAC       DB    $00
            DB    $00
L0CAE       DB    $00
            DB    $00
L0CB0       ADRL  $00000000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CBC       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CC0       DB    $00
            DB    $00
L0CC2       DW    $0000
L0CC4       DB    $00
            DB    $00
L0CC6       DB    $00
            DB    $00
L0CC8       DB    $00
            DB    $00
L0CCA       DB    $00
            DB    $00
L0CCC       DB    $00
            DB    $00
L0CCE       DB    $00
            DB    $00
L0CD0       DB    $00
            DB    $00
L0CD2       DB    $00
            DB    $00
L0CD4       DB    $00
            DB    $00
L0CD6       DB    $00
            DB    $00
L0CD8       DB    $00
            DB    $00
L0CDA       DB    $00
            DB    $00
L0CDC       DW    $0000
L0CDE       ADRL  $00000000
L0CE2       DW    $0009
L0CE4       DB    $00
            DB    $00
L0CE6       DB    $00
            DB    $00
L0CE8       DB    $00
            DB    $00
L0CEA       DB    $00
            DB    $00
L0CEC       DB    $00
            DB    $00
L0CEE       DB    $00
            DB    $00
L0CF0       DB    $02
            DB    $00
L0CF2       DB    L0CF6
            DB    $0C
L0CF4       DB    $01
            DB    $00
L0CF6       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D20       DB    L0D24
            DB    $0D
L0D22       DB    $01
            DB    $00
L0D24       DB    $00
L0D25       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D4E       DB    $00
            DB    $00
L0D50       DB    $0F
            DB    $00
L0D52       DB    $00
            DB    $00
L0D54       DB    $00
            DB    $00
L0D56       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D80       DB    $00
            DB    $00
L0D82       DB    $00
            DB    $00
L0D84       DB    $00
            DB    $00
L0D86       DB    $00
            DB    $00
L0D88       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            DB    L0D95
            DB    $0D
            DB    $01
            DB    $00
            DB    $FF
L0D95       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DA7       DB    $00
            DB    $00
L0DA9       DB    $00
            DB    $00
L0DAB       DW    $0000       ; event code
L0DAD       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L0DB5       DW    $0000       ; mouse location
L0DB7       DW    $0000
            DW    $0000       ; modifiers
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L0DC3       DB    $00
            DB    $00
L0DC5       DB    $00
            DB    $00
L0DC7       DB    $00
            DB    $00
L0DC9       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DD2       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DDA       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DE2       DB    $00
            DB    $00
L0DE4       DB    $00
            DB    $00
L0DE6       DB    $00
            DB    $00
L0DE8       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DFC       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E00       DB    $00
            DB    $00
L0E02       DB    $00
            DB    $00
L0E04       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E54       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E5D       DB    $00
            DB    $00
L0E5F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E73       ADRL  L0EB5       ; ptr to source locinfo
            ADRL  L0EC5       ; ptr to dest locinfo
            ADRL  L0EED       ; ptr to source rect
            ADRL  L0EE9       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0E89       ADRL  L0EC5       ; ptr to source locinfo
            ADRL  L0EB5       ; ptr to dest locinfo
            ADRL  L0EED       ; ptr to source rect
            ADRL  L0EE9       ; ptr to dest point
            DW    $0002       ; mode
L0E9B       ADRL  $00000000   ; clip rgn handle
            ADRL  L0EB5       ; ptr to source locinfo
            ADRL  L0ED9       ; ptr to dest locinfo
            ADRL  L0EF9       ; ptr to source rect
            ADRL  L0EF5       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0EB5       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L0EC5       DW    $0000       ; SCB byte
L0EC7       ADRL  $00000000   ; Pointer to pixel image
L0ECB       DW    $0010       ; Width
L0ECD       DW    $0000       ; Bounds rect
L0ECF       DW    $0000
L0ED1       DW    $0014
L0ED3       DW    $0014
L0ED5       ADRL  $00000000
L0ED9       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L0EE9       DW    $0000
L0EEB       DW    $0000
L0EED       DW    $0000
L0EEF       DW    $0000
L0EF1       DW    $0014
L0EF3       DW    $0014
L0EF5       DW    $0000
            DW    $0000
L0EF9       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0F01       ADRL  L0EC5       ; ptr to source locinfo
            ADRL  L0EB5       ; ptr to dest locinfo
            ADRL  L0F2D       ; ptr to source rect
            ADRL  L0F35       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L0ED9       ; ptr to source locinfo
            ADRL  L0EB5       ; ptr to dest locinfo
            ADRL  L0F39       ; ptr to source rect
            ADRL  L0F41       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0F2D       DW    $0000
L0F2F       DW    $0000
L0F31       DW    $0014
L0F33       DW    $0014
L0F35       DW    $0000
            DW    $0000
L0F39       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0F41       DW    $0000
            DW    $0000
L0F45       ADRL  L0EB5       ; ptr to source locinfo
            ADRL  L0F5B       ; ptr to dest locinfo
            ADRL  L0F6B       ; ptr to source rect
            ADRL  L0F73       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0F5B       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L0F6B       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L0F73       DW    $0000
            DW    $0000
L0F77       ADRL  L0F5B       ; ptr to source locinfo
            ADRL  L0EB5       ; ptr to dest locinfo
            ADRL  L0F8D       ; ptr to source rect
            ADRL  L0F95       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0F8D       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L0F95       DW    $0000
            DW    $0000
L0F99       DB    $00
            DB    $00
L0F9B       DB    $00
            DB    $00
L0F9D       DB    $00
            DB    $00
L0F9F       HEX   7200000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L0FBF       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L0FDF       HEX   0000CD0009002D0D720055052F02AF06
            HEX   5008B70FCF02980FD000F00CF902FF0F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1003       DB    $00
            DB    $00
L1005       DB    $00
            DB    $00
L1007       DB    $00
            DB    $00
L1009       DB    $00
            DB    $00
L100B       DB    $00
            DB    $00
L100D       DB    $00
            DB    $00
L100F       ADRL  L1047
            ADRL  L104D
            ADRL  L1053
            ADRL  L105A
            ADRL  L1060
            ADRL  L1066
            ADRL  L106B
            ADRL  L1073
            ADRL  L107A
            ADRL  L107F
            ADRL  L1085
            ADRL  L108A
            ADRL  L1090
            ADRL  L1098
	DO	VF
L1047       STR   'de cygnes'
L104D       STR   'de lunes'
L1053       STR   'de coeurs'
L105A       STR   'd'27'elfes'
L1060       STR   'de roses'
L1066       STR   'd'27'insectes'
L106B       STR   'de fleurs'
L1073       STR   'de pommes'
L107A       STR   'de poissons'
L107F       STR   'de ballons'
L1085       STR   'de chats'
L108A       STR   'de bateaux'
L1090       STR   'de montres'
L1098       STR   'de papillons'
	ELSE
L1047       STR   'of swans'
L104D       STR   'of moons'
L1053       STR   'of hearts'
L105A       STR   'of elves'
L1060       STR   'of roses'
L1066       STR   'of bugs'
L106B       STR   'of flowers'
L1073       STR   'of apples'
L107A       STR   'of fish'
L107F       STR   'of balls'
L1085       STR   'of cats'
L108A       STR   'of boats'
L1090       STR   'of watches'
L1098       STR   'of moths'
	FIN
L109E       ADRL  L10A4       ;  path name
            DW    $0000       ;  flags
L10A4       STR   'program'
L10AC       BCS   L10AF
            RTS

L10AF       PHA
            LDA   #^L10C0
            PHA
            LDA   #L10C0
            PHA
            _SysFailMgr
            RTS

	DO	VF
L10C0       STR   'Erreur applicative ... Oups !'
	ELSE
L10C0       STR   'Application failure ... Oops!'
	FIN
L10DE       LDA   #$0000
            STA   L0E02
            LDA   L0B7D
            STA   $00
            LDA   L0B7F
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L0B81
            LDY   #$0002
            LDA   [$00],Y
            STA   L0B83
            LDA   L0B81
            BNE   L110B
            LDA   L0B83
            BNE   L110B
            JMP   L110C
L110B       RTS

L110C       LDA   L0B7F
            PHA
            LDA   L0B7D
            PHA
            _RestoreHandle
            JSR   L10AC
            LDA   #$8000
            STA   L0E02
            JMP   L10DE

            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0DA7
            STA   L0B7D
            LDA   L0DA9
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0D84
            LDA   L0B83
            STA   L0D86
            LDA   L0D84
            STA   L0BE1
            LDA   L0D86
            STA   L0BE1+2
            LDA   #$0000
            STA   L0BE5+2
            LDA   #$A000
            STA   L0BE5
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BDF
            JSR   L10AC
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0BED
            JSR   L10AC
            LDA   L0BE9
            STA   L0D88
            LDA   #$0000
            STA   L0CD2
            LDX   #$0008
L118E       LSR   L0D88
            BCC   L1199
            LDA   #$0001
            STA   L0CD2
L1199       DEX
            BNE   L118E
            LDA   L0D88
            CLC
            ADC   L0CD2
            STA   L0D88
            RTS

L11A7       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L11A7
L11BA       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L11BA
            RTS

L11CE       _GrafOff
            _HideCursor
            RTS

L11DD       _GrafOn
            RTS

L11E5       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DAB
            PHA
            LDA   #L0DAB
            PHA
            _GetNextEvent
            PLA
            BEQ   L1216
            LDA   L0DAB
            CMP   #$0003
            BNE   L120E
L1205       LDA   #$0080
            STA   L0CD2
            JMP   L1216

L120E       CMP   #$0001
            BNE   L1216
            JMP   L1205
L1216       RTS

L1217       LDA   L0CD4
            STA   L1231
            STZ   L0CD2
L1220       JSR   L11E5
            LDA   L0CD2
            CMP   #$0000
            BNE   L1230
            DEC   L1231
            BNE   L1220
L1230       RTS

L1231       DW    $0000
            STZ   L0CD2
L1236       JSR   L11E5
            LDA   L0CD2
            CMP   #$0000
            BEQ   L1236
            RTS

L1242       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DAB
            PHA
            LDA   #L0DAB
            PHA
            _GetNextEvent
            PLA
            BEQ   L1242
            LDA   L0DAB
            CMP   #$0003
            BNE   L1242
            LDA   L0DAD
            AND   #$007F
            CMP   #$0061
            BCC   L1271
            SEC
            SBC   #$0020
L1271       CMP   #$001B
            BNE   L1279
            JMP   L0B29

L1279       CMP   L0DC7
            BEQ   L1281
            JMP   L1242

L1281       CLC
            RTS

L1283       PHA
            PEA   $0008
            LDA   #^L0DAB
            PHA
            LDA   #L0DAB
            PHA
            _GetNextEvent
            PLA
            BEQ   L1283
            LDA   L0DAD
            AND   #$007F
            STA   L0DC7
            RTS

            PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L0F9F
            PHA
            LDA   #L0F9F
            PHA
            _SetColorTable
            RTS

L12CB       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L0FBF
            PHA
            LDA   #L0FBF
            PHA
            _SetColorTable
            RTS

L12F3       PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L0FDF
            PHA
            LDA   #L0FDF
            PHA
            _SetColorTable
            RTS

L131B       LDA   #^L0DC9
            PHA
            LDA   #L0DC9
            PHA
            LDA   L0DE6
            PHA
            LDA   L0DE4
            PHA
            LDA   L0DE8
            PHA
            LDA   L0DE2
            PHA
            _SetRect
            RTS

            LDA   #^L0DC9
            PHA
            LDA   #L0DC9
            PHA
            _FrameRect
            RTS

L134B       LDA   #^L0DC9
            PHA
            LDA   #L0DC9
            PHA
            _PaintRect
            RTS

L135B       _PenNormal
            RTS

L1363       LDA   L0DFC
            PHA
            _SetSolidPenPat
            RTS

L136F       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DAB
            PHA
            LDA   #L0DAB
            PHA
            _GetNextEvent
            PLA
            BEQ   L136F
            LDA   L0DAB
            CMP   #$0003
            BEQ   L1392
            JMP   L13E0

L1392       LDA   L0DAD
            AND   #$007F
            CMP   #$0061
            BCC   L13A1
            SEC
            SBC   #$0020
L13A1       STA   L0DC7
            _ObscureCursor
            LDA   #$0000
            STA   L0E00
            LDA   #$0001
            STA   L146B
            LDA   #$0000
            STA   L1469
L13BD       LDX   L1469
            LDA   L0E5F,X
            CMP   L0DC7
            BNE   L13C9
            RTS

L13C9       LDA   L146B
            CMP   L0E5D
            BEQ   L13DD
            INC   L146B
            INC   L1469
            INC   L1469
            JMP   L13BD
L13DD       JMP   L136F

L13E0       CMP   #$0001
            BEQ   L13E8
            JMP   L136F

L13E8       LDA   L0DB5
            STA   L0DC3
            LDA   L0DB7
            STA   L0DC5
            LDA   #$0080
            STA   L0E00
            LDA   #$0000
            STA   L1467
            STA   L1469
            LDA   #$0001
            STA   L146B
L1409       LDY   #$0000
            LDX   L1467
L140F       LDA   L0E04,X
            STA   L0E54,Y
            INX
            INY
            CPY   #$0008
            BCC   L140F
            PEA   $0000
            LDA   #^L0DC3
            PHA
            LDA   #L0DC3
            PHA
            LDA   #^L0E54
            PHA
            LDA   #L0E54
            PHA
            _PtInRect
            PLA
            BEQ   L143C
            JMP   L145D

L143C       LDA   L146B
            CMP   L0E5D
            BNE   L1447
            JMP   L136F

L1447       INC   L146B
            INC   L1469
            INC   L1469
            LDA   L1467
            CLC
            ADC   #$0008
            STA   L1467
            JMP   L1409

L145D       LDX   L1469
            LDA   L0E5F,X
            STA   L0DC7
            RTS

L1467       DW    $0000
L1469       DW    $0000
L146B       DW    $0000
L146D       LDA   L0CDA
            PHA
            LDA   L0CDC
            PHA
            _MoveTo
            LDA   L0CDE+2
            PHA
            LDA   L0CDE
            PHA
            _DrawString
            LDA   L0CDC
            CLC
            ADC   L0CE2
            STA   L0CDC
            RTS

L1496       LDA   L0CDE+2
            PHA
            LDA   L0CDE
            PHA
            _DrawString
            RTS

L14A6       PHA
            LDA   L0CDE+2
            PHA
            LDA   L0CDE
            PHA
            _StringWidth
            PLA
            STA   L14C8
            LDA   #$0140
            SEC
            SBC   L14C8
            LSR
            STA   L0CDA
            JMP   L146D

L14C8       DW    $0000
L14CA       JSR   L2072
            STZ   L0CE2
            STZ   L0D24
L14D3       JSR   L1283
            LDA   L0DC7
            CMP   #$0008
            BEQ   L14E6
            CMP   #$007F
            BEQ   L14E6
            JMP   L152E

L14E6       LDA   L0D4E
            PHA
            _SetForeColor
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L146D
            LDA   L0D24
            AND   #$00FF
            CMP   #$0002
            BCS   L150E
            JMP   L14CA

L150E       DEC   L0D24
L1511       LDA   L0D50
            PHA
            _SetForeColor
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L146D
            JMP   L14D3

L152E       CMP   #$000D
            BNE   L153F
            LDA   L0D24
            AND   #$00FF
            BNE   L153E
            JMP   L14D3
L153E       RTS

L153F       CMP   #$001B
            BNE   L1547
            JMP   L0B29

L1547       CMP   #$0030
            BCS   L154F
            JMP   L14D3

L154F       CMP   #$003A
            BCC   L1557
            JMP   L14D3

L1557       LDA   L0D24
            AND   #$00FF
            CMP   L0CF0
            BCC   L1565
            JMP   L14D3

L1565       LDA   L0D4E
            PHA
            _SetForeColor
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L146D
            INC   L0D24
            LDA   L0D24
            AND   #$00FF
            TAY
            LDA   L0DC7
            STA   L0D24,Y
            JMP   L1511

L1592       PHA
            LDA   #^L0D25
            PHA
            LDA   #L0D25
            PHA
            LDA   L0D24
            AND   #$00FF
            PHA
            PEA   $0000
            _Dec2Int
            JSR   L10AC
            PLA
            STA   L0D52
            RTS

            CLC
            LDA   #$00B5
            STA   L0DE4
            LDA   #$001A
            STA   L0DE6
            LDA   #$00C2
            ADC   #$0001
            STA   L0DE2
            LDA   #$00B4
            ADC   #$0001
            STA   L0DE8
            LDA   #$000E
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDX   #$0000
L15E8       LDA   L0DC9,X
            STA   L0DD2,X
            INX
            INX
            CPX   #$0008
            BNE   L15E8
            CLC
            LDA   #$00B5
            STA   L0DE4
            LDA   #$00D0
            STA   L0DE6
            LDA   #$00C2
            ADC   #$0001
            STA   L0DE2
            LDA   #$0124
            ADC   #$0001
            STA   L0DE8
            LDA   #$000D
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDX   #$0000
L1629       LDA   L0DC9,X
            STA   L0DDA,X
            INX
            INX
            CPX   #$0008
            BNE   L1629
            PEA   $0000
            _GetForeColor
            PLA
            STA   L1763
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L1667

	DO	VF
L1652       STR   'Espace pour continuer'
L1667       PEA   $001A
	ELSE
L1652       STR   'Spacebar to continue'
L1667       PEA   $001E
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L1652
            PHA
            LDA   #L1652
            PHA
            _DrawString
            JMP   L1692

	DO	VF
L1686       STR   'ESC pour quitter'
L1692       PEA   $00C2
	ELSE
L1686       STR   'ESC to quit'
L1692       PEA   $00D6
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L1686
            PHA
            LDA   #L1686
            PHA
            _DrawString
L16AE       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DAB
            PHA
            LDA   #L0DAB
            PHA
            _GetNextEvent
            PLA
            BEQ   L16AE
            LDA   L0DAB
            CMP   #$0003
            BEQ   L16D1
            JMP   L1700

L16D1       _ObscureCursor
            LDA   #$0000
            STA   L0E00
            LDA   L0DAD
            AND   #$007F
            CMP   #$0020
            BEQ   L16F1
            CMP   #$001B
            BEQ   L16F1
            JMP   L16AE

L16F1       STA   L0DC7
            LDA   L1763
            PHA
            _SetForeColor
            RTS

L1700       CMP   #$0001
            BEQ   L1708
            JMP   L16AE

L1708       LDA   L0DB5
            STA   L0DC3
            LDA   L0DB7
            STA   L0DC5
            LDA   #$0080
            STA   L0E00
            PEA   $0000
            LDA   #^L0DC3
            PHA
            LDA   #L0DC3
            PHA
            LDA   #^L0DD2
            PHA
            LDA   #L0DD2
            PHA
            _PtInRect
            PLA
            BEQ   L173D
            LDA   #$0020
            JMP   L16F1

L173D       PEA   $0000
            LDA   #^L0DC3
            PHA
            LDA   #L0DC3
            PHA
            LDA   #^L0DDA
            PHA
            LDA   #L0DDA
            PHA
            _PtInRect
            PLA
            BEQ   L1760
            LDA   #$001B
            JMP   L16F1
L1760       JMP   L16AE

L1763       DW    $0000
            JSR   L11CE
            JSR   L12CB
            JMP   L1770

L176E       DW    $0000
L1770       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L176E
            ASL
            ASL
            ASL
            ASL
            ORA   L176E
            STA   L176E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L176E
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L0DE4
            LDA   #$003F
            STA   L0DE6
            LDA   #$007E
            ADC   #$0001
            STA   L0DE2
            LDA   #$00F8
            ADC   #$0001
            STA   L0DE8
            LDA   #$000A
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0041
            STA   L0DE4
            LDA   #$0044
            STA   L0DE6
            LDA   #$007A
            ADC   #$0001
            STA   L0DE2
            LDA   #$00F3
            ADC   #$0001
            STA   L0DE8
            LDA   #$000C
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0060
            STA   L0DE4
            LDA   #$004E
            STA   L0DE6
            LDA   #$0072
            ADC   #$0001
            STA   L0DE2
            LDA   #$00E9
            ADC   #$0001
            STA   L0DE8
            LDA   #$000B
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0063
            STA   L0DE4
            LDA   #$0053
            STA   L0DE6
            LDA   #$006F
            ADC   #$0001
            STA   L0DE2
            LDA   #$0060
            ADC   #$0001
            STA   L0DE8
            LDA   #$000E
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDX   #$0000
L1863       LDA   L0DC9,X
            STA   L0DDA,X
            INX
            INX
            CPX   #$0008
            BNE   L1863
            CLC
            LDA   #$0063
            STA   L0DE4
            LDA   #$00C6
            STA   L0DE6
            LDA   #$006F
            ADC   #$0001
            STA   L0DE2
            LDA   #$00D3
            ADC   #$0001
            STA   L0DE8
            LDA   #$000D
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDX   #$0000
L18A4       LDA   L0DC9,X
            STA   L0DD2,X
            INX
            INX
            CPX   #$0008
            BNE   L18A4
            PEA   $0000
            _GetForeColor
            PLA
            STA   L1A86
            PEA   $0000
            _SetForeColor
            JMP   L18DD

	DO	VF
L18CC       STR   'Veux-tu vraiment'
	ELSE
L18CC       STR   'Are you sure you'
	FIN
L18DD       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L18CC
            PHA
            LDA   #L18CC
            PHA
            _DrawString
            JMP   L190A

	DO	VF
L18FC       STR   'quitter le jeu ?'
	ELSE
L18FC       STR   'want to quit?'
	FIN
L190A       PEA   $0064
            PEA   $0059
            _MoveTo
            LDA   #^L18FC
            PHA
            LDA   #L18FC
            PHA
            _DrawString
            JMP   L192D

	DO	VF
L1929       STR   'ui'
	ELSE
L1929       STR   'es'
	FIN
L192D       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L1929
            PHA
            LDA   #L1929
            PHA
            _DrawString
            JMP   L194F

	DO	VF
L194C       STR   'on'
	ELSE
L194C       STR   'o'
	FIN
L194F       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L194C
            PHA
            LDA   #L194C
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L197A

	DO	VF
L1978       STR   'O'
	ELSE
L1978       STR   'Y'
	FIN
L197A       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L1978
            PHA
            LDA   #L1978
            PHA
            _DrawString
            JMP   L199B

L1999       STR   'N'
L199B       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L1999
            PHA
            LDA   #L1999
            PHA
            _DrawString
            JSR   L11DD
            _InitCursor
L19C1       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DAB
            PHA
            LDA   #L0DAB
            PHA
            _GetNextEvent
            PLA
            BEQ   L19C1
            LDA   L0DAB
            CMP   #$0003
            BEQ   L19E4
            JMP   L1A23

L19E4       _ObscureCursor
            LDA   #$0000
            STA   L0E00
            LDA   L0DAD
            AND   #$007F
            CMP   #$0061
            BCC   L1A00
            SEC
            SBC   #$0020
	DO	VF
L1A00       CMP   #'O'
	ELSE
L1A00       CMP   #'Y'
	FIN
            BEQ   L1A0D
            CMP   #'N'
            BEQ   L1A0D
            JMP   L19C1

L1A0D       STA   L0DC7
            LDA   L1A86
            PHA
            _SetForeColor
            _HideCursor
            RTS

L1A23       CMP   #$0001
            BEQ   L1A2B
            JMP   L19C1

L1A2B       LDA   L0DB5
            STA   L0DC3
            LDA   L0DB7
            STA   L0DC5
            LDA   #$0080
            STA   L0E00
            PEA   $0000
            LDA   #^L0DC3
            PHA
            LDA   #L0DC3
            PHA
            LDA   #^L0DD2
            PHA
            LDA   #L0DD2
            PHA
            _PtInRect
            PLA
            BEQ   L1A60
            LDA   #$004E
            JMP   L1A0D

L1A60       PEA   $0000
            LDA   #^L0DC3
            PHA
            LDA   #L0DC3
            PHA
            LDA   #^L0DDA
            PHA
            LDA   #L0DDA
            PHA
            _PtInRect
            PLA
            BEQ   L1A83
	DO	VF
            LDA   #'O'
            	ELSE
            LDA   #'Y'
	FIN
            JMP   L1A0D
L1A83       JMP   L19C1

L1A86       DW    $0000
            JSR   L11CE
            JSR   L12CB
            CLC
            LDA   #$0037
            STA   L0DE4
            LDA   #$003B
            STA   L0DE6
            LDA   #$0089
            ADC   #$0001
            STA   L0DE2
            LDA   #$0104
            ADC   #$0001
            STA   L0DE8
            LDA   #$000B
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$003F
            STA   L0DE4
            LDA   #$0044
            STA   L0DE6
            LDA   #$0081
            ADC   #$0001
            STA   L0DE2
            LDA   #$00FB
            ADC   #$0001
            STA   L0DE8
            LDA   #$000E
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L1B14

	DO	VF
L1AFE       STR   'Merci d'27'avoir utilis'8e
	ELSE
L1AFE       STR   'Thank you for running'
	FIN
L1B14       PEA   $0055
            PEA   $004F
            _MoveTo
            LDA   #^L1AFE
            PHA
            LDA   #L1AFE
            PHA
            _DrawString
            JMP   L1B40

	DO	VF
L1B33       STR   'le programme.'
L1B40       PEA   $0072
	ELSE
L1B33       STR   'the program.'
L1B40       PEA   $007A
	FIN
            PEA   $005A
            _MoveTo
            LDA   #^L1B33
            PHA
            LDA   #L1B33
            PHA
            _DrawString
            PEA   $000B
            _SetForeColor
            JMP   L1B7F

	DO	VF
L1B69       STR   'Eteins l'27'ordinateur'
L1B7F       PEA   $004B
	ELSE
L1B69       STR   'Turn off the computer'
L1B7F       PEA   $0053
	FIN
            PEA   $006B
            _MoveTo
            LDA   #^L1B69
            PHA
            LDA   #L1B69
            PHA
            _DrawString
            JMP   L1BA9

	DO	VF
L1B9E       STR   'ou red'27'marre.'
L1BA9       PEA   $0074
	ELSE
L1B9E       STR   'or reboot.'
L1BA9       PEA   $0080
	FIN
            PEA   $0076
            _MoveTo
            LDA   #^L1B9E
            PHA
            LDA   #L1B9E
            PHA
            _DrawString
            JSR   L11DD
            _HideCursor
            STP
L1BD0       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L0B95
            PHA
            _DisposeAll
            JSR   L10AC
            LDA   L0B93
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L1C1B       LDA   L0CAC
            STA   L0B7D
            LDA   L0CAE
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0CB0
            LDA   L0B83
            STA   L0CB0+2
            PEA   $0000
            LDA   #^L0CBC
            PHA
            LDA   #L0CBC
            PHA
            LDA   #^L0CC0
            PHA
            LDA   #L0CC0
            PHA
            LDA   L0CB0+2
            PHA
            LDA   L0CB0
            PHA
            LDA   L0CC2
            PHA
            _PackBytes
            PLA
            STA   L0C07
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L0C01
            JSR   L10AC
            LDA   L0CC0
            BNE   L1C1B
            RTS

L1C73       _HideCursor
            LDA   L0CAC
            STA   L0B7D
            LDA   L0CAE
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0CB0
            LDA   L0B83
            STA   L0CB0+2
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HLock
            JSR   L10AC
            PEA   $00E1
            PEA   $2000
            LDA   L0CB0+2
            PHA
            LDA   L0CB0
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L1CC3       _HideCursor
            LDA   L0CB0+2
            PHA
            LDA   L0CB0
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HUnlock
            JSR   L10AC
            RTS

            _HideCursor
            LDA   #^L0F45
            PHA
            LDA   #L0F45
            PHA
            _PaintPixels
            JSR   L10AC
            RTS

            _HideCursor
            LDA   #^L0F77
            PHA
            LDA   #L0F77
            PHA
            _PaintPixels
            JSR   L10AC
            RTS

L1D2C       LDA   L0CAC
            STA   L0B7D
            LDA   L0CAE
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0CB0
            LDA   L0B83
            STA   L0CB0+2
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HLock
            JSR   L10AC
            PEA   $00E1
            PEA   $2000
            LDA   L0CB0+2
            PHA
            LDA   L0CB0
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L1D75       LDA   L0CB0+2
            PHA
            LDA   L0CB0
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HUnlock
            JSR   L10AC
            RTS

            _HideCursor
            LDA   L0ED5
            STA   L0B7D
            LDA   L0ED5+2
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0EC7
            LDA   L0B83
            STA   L0EC7+2
            LDA   #^L0E73
            PHA
            LDA   #L0E73
            PHA
            _PaintPixels
            JSR   L10AC
            _InitCursor
            RTS

L1DDF       _HideCursor
            LDA   L0ED5
            STA   L0B7D
            LDA   L0ED5+2
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0EC7
            LDA   L0B83
            STA   L0EC7+2
            LDA   #^L0F01
            PHA
            LDA   #L0F01
            PHA
            _PaintPixels
            JSR   L10AC
            RTS

            LDA   #^L0F99
            STA   L0BA5+2
            LDA   #L0F99
            STA   L0BA5
            LDA   #$0000
            STA   L0BA9+2
            LDA   #$0006
            STA   L0BA9
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            LDA   L0CAC
            STA   L0B7D
            LDA   L0CAE
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0CB0
            LDA   L0B83
            STA   L0CB0+2
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HLock
            JSR   L10AC
            LDA   L0CB0
            STA   L0BA5
            LDA   L0CB0+2
            STA   L0BA5+2
            LDA   #$8000
            STA   L0BA9
            LDA   #$0000
            STA   L0BA9+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0BB1
            LDA   #$0028
            STA   L0CDC
            LDA   L0ED5
            STA   L0B7D
            LDA   L0ED5+2
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0EC7
            LDA   L0B83
            STA   L0EC7+2
            LDA   L0EC7
            STA   L0CC4
            LDA   L0EC7+2
            STA   L0CC6
            LDA   L0F99
            STA   L0CC8
L1EC2       PHA
            LDA   L0CB0+2
            PHA
            LDA   L0CB0
            PHA
            LDA   L0BAD
            PHA
            LDA   #^L0CC4
            PHA
            LDA   #L0CC4
            PHA
            LDA   #^L0CC8
            PHA
            LDA   #L0CC8
            PHA
            _UnPackBytes
            PLA
            LDA   L0CC8
            BNE   L1EC2
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HUnlock
            JSR   L10AC
            RTS

            LDA   #$0000
            STA   L0ECD
            STA   L0ECF
            STA   L0F2D
            STA   L0F2F
            LDA   L0F9B
            STA   L0ED1
            STA   L0F31
            LDA   L0F9D
            STA   L0ED3
            STA   L0F33
            LSR
            CLC
            ADC   #$0001
            STA   L0ECB
            _HideCursor
            JSR   L1DDF
            RTS

            LDA   L0CDE
            STA   $00
            LDA   L0CDE+2
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L0B91
            LDA   #$0001
            STA   L1FB4
            PHA
            LDA   L0CDE+2
            PHA
            LDA   L0CDE
            PHA
            _StringWidth
            PLA
            STA   L1FB6
            LDA   #$0140
            SEC
            SBC   L1FB6
            LSR
            PHA
            LDA   L0CDC
            PHA
            _MoveTo
L1F76       LDA   L0CDE
            STA   $00
            LDA   L0CDE+2
            STA   $02
            LDY   L1FB4
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0061
            BCC   L1F91
            SEC
            SBC   #$0020
L1F91       STA   L0DC7
            JSR   L1242
            LDA   L0DC7
            PHA
            _DrawChar
            INC   L1FB4
            DEC   L0B91
            BNE   L1F76
            LDA   #$000D
            STA   L0DC7
            JSR   L1242
            RTS

L1FB4       DW    $0000
L1FB6       DW    $0000
            LDA   #^L0E54
            PHA
            LDA   #L0E54
            PHA
            LDA   L0CD6
            PHA
            LDA   L0CD8
            PHA
            LDA   L0CD6
            CLC
            ADC   #$0079
            PHA
            LDA   L0CD8
            CLC
            ADC   #$001A
            PHA
            _SetRect
            LDA   #$000F
            STA   L0DFC
            LDA   #$0001
            PHA
            _SetForeColor
            JSR   L135B
            JSR   L1363
            LDA   #^L0E54
            PHA
            LDA   #L0E54
            PHA
            _PaintRect
            LDA   L0CD6
            CLC
            ADC   #$0004
            STA   L0CDA
            LDA   L0CD8
            CLC
            ADC   #$000B
            STA   L0CDC
            JMP   L202C

	DO	VF
L201C       STR   'Clique sur la souris'
	ELSE
L201C       STR   'Click the mouse'
	FIN
L202C       LDA   #^L201C
            STA   L0CDE+2
            LDA   #L201C
            STA   L0CDE
            JSR   L146D
            LDA   L0CD6
            CLC
            ADC   #$0014
            STA   L0CDA
            LDA   L0CD8
            CLC
            ADC   #$0013
            STA   L0CDC
            JMP   L205F

	DO	VF
L2052       STR   'pour continuer.'
	ELSE
L2052       STR   'to continue.'
	FIN
L205F       LDA   #^L2052
            STA   L0CDE+2
            LDA   #L2052
            STA   L0CDE
            JSR   L146D
            JSR   L11A7
            RTS

L2072       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L2082       LDA   #L215B
            STA   $04
            LDA   #^L215B
            STA   $06
            LDA   L0CE4
            STA   $00
            LDA   L0CE6
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L2158
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L20B3       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L2158
            BNE   L20B3
            LDA   L215A
            AND   #$FF00
            ORA   L2158
            STA   L215A
            LDA   L0CE8
            STA   $00
            LDA   L0CEA
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L2158
            LDA   L215A
            AND   #$00FF
            CLC
            ADC   $04
            STA   $04
            LDA   $06
            ADC   #$0000
            STA   $06
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L2102       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L2158
            BNE   L2102
            LDA   L215A
            CLC
            ADC   L2158
            STA   L215A
            LDA   L0CEC
            STA   $00
            LDA   L0CEE
            STA   $02
            LDA   #L215B
            STA   $04
            LDA   #^L215B
            STA   $06
            LDA   L215A
            AND   #$00FF
            LDY   #$0000
            STA   [$00],Y
            AND   #$00FF
            STA   L2158
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L214D       LDA   [$04],Y
            STA   [$00],Y
            INY
            CPY   L2158
            BNE   L214D
            RTS

L2158       DB    $00
            DB    $00
L215A       DB    $00
L215B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            PEA   $0000
            LDA   L0CCA
            AND   #$000F
            PHA
            LDA   L0CCC
            AND   #$000F
            JSR   L2295
            STA   L229A
            LDA   L0CCE
            AND   #$000F
            ORA   L229A
            JSR   L2295
            STA   L229A
            LDA   L0CD0
            AND   #$000F
            ORA   L229A
            PHA
            _SetColorEntry
            JSR   L10AC
            RTS

L2295       ASL
            ASL
            ASL
            ASL
            RTS

L229A       DB    $00
            DB    $00
L229C       DB    $01
            DB    $00
L229E       DB    $00
            DB    $00
L22A0       DB    $00
            DB    $00
L22A2       DB    $00
            DB    $00
L22A4       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L233E       LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            _ReadTimeHex
            PLA
            STA   L2366
            PLA
            STA   L2368
            PLA
            PLA
            LDA   L2368
            PHA
            LDA   L2366
            PHA
            _SetRandSeed
            RTS

L2366       DW    $0000
L2368       DW    $0000
L236A       PEA   $0000
            _Random
            PLA
            STA   L23C1
            PEA   $0000
            PEA   $0000
            LDA   L0B8F
            PHA
            LDA   L23C1
            PHA
            _Multiply
            PLA
            STA   L23C3
            PLA
            STA   L23C3+2
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDA   L23C3+2
            PHA
            LDA   L23C3
            PHA
            LDA   #$0001
            PHA
            LDA   #$0000
            PHA
            _LongDivide
            JSR   L10AC
            PLA
            STA   L23C1
            PLA
            PLA
            PLA
            LDA   L23C1
            RTS

L23C1       DW    $0000
L23C3       ADRL  $00000000
            JSR   L479E
            JSR   L11CE
            JSR   L492E
            JSR   L1C73
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HUnlock
            JSR   L10AC
            PEA   $0000
            _ClearScreen
            JSR   L11DD
            LDA   L0CAC
            STA   L0B7D
            LDA   L0CAE
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0CB0
            LDA   L0B83
            STA   L0CB0+2
            LDA   L0CB0
            STA   L0EC7
            LDA   L0CB0+2
            STA   L0EC7+2
            LDA   #$00A0
            STA   L0ECB
            LDA   #$0000
            STA   L0ECD
            STA   L0ECF
            LDA   #$00C8
            STA   L0ED1
            LDA   #$0140
            STA   L0ED3
            RTS

L2435       LDA   L248B
            CMP   L2489
            BCC   L2456
            JSR   L233E
            LDA   #$0000
            STA   L248B
            LDX   #$0000
L2449       CPX   #$0027
            BCS   L2456
            STA   L248D,X
            INX
            INX
            JMP   L2449

L2456       LDA   L2489
            STA   L0B8F
            JSR   L236A
            STA   L24B5
            ASL
            TAX
            LDA   L248D,X
            BNE   L2456
            LDA   #$0001
            STA   L248D,X
            INC   L248B
            LDA   L24B5
            ASL
            ASL
            TAY
            LDA   L24B7,Y
            STAL  $000000
            LDA   L24B7+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L2489       DB    $11
            DB    $00
L248B       DB    $00
            DB    $00
L248D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L24B5       DB    $00
            DB    $00
L24B7       ADRL  L24FB
            ADRL  L2566
            ADRL  L25D7
            ADRL  L2642
            ADRL  L26B0
            ADRL  L2724
            ADRL  L278F
            ADRL  L27FA
            ADRL  L286B
            ADRL  L28DC
            ADRL  L294D
            ADRL  L29CA
            ADRL  L2A3E
            ADRL  L2AB5
            ADRL  L2B20
            ADRL  L2B91
            ADRL  L2C02
L24FB       JMP   L2510

L24FE       STR   '0/GOODA'
L2506       DW    $0000       ;  ref num
            ADRL  L24FE       ;  path name
            ADRL  $00000000   ;  reserved
L2510       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2506
            JSR   L10AC
            LDA   L2506
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L252E

L252C       DW    $0000
L252E       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0006
            STAL  $E0C034
            LDA   #$0006
            STA   L252C
            ASL
            ASL
            ASL
            ASL
            ORA   L252C
            STA   L252C
            LDAL  $E0C022
            AND   #$FF00
            ORA   L252C
            STAL  $E0C022
            JSR   L492E
            LDA   #$0004
            STA   L4A65
            JMP   L2C73
L2566       JMP   L257B

L2569       STR   '0/GOODB'
L2571       DW    $0000       ;  ref num
            ADRL  L2569       ;  path name
            ADRL  $00000000   ;  reserved
L257B       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2571
            JSR   L10AC
            LDA   L2571
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2599

L2597       DW    $0000
L2599       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2597
            ASL
            ASL
            ASL
            ASL
            ORA   L2597
            STA   L2597
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2597
            STAL  $E0C022
            JSR   L492E
            LDA   #$0002
            STA   L4A65
            STA   L4A67
            STA   L4A69
            JMP   L2C73
L25D7       JMP   L25EC

L25DA       STR   '0/GOODC'
L25E2       DW    $0000       ;  ref num
            ADRL  L25DA       ;  path name
            ADRL  $00000000   ;  reserved
L25EC       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L25E2
            JSR   L10AC
            LDA   L25E2
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L260A

L2608       DW    $0000
L260A       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2608
            ASL
            ASL
            ASL
            ASL
            ORA   L2608
            STA   L2608
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2608
            STAL  $E0C022
            JSR   L492E
            LDA   #$0004
            STA   L4A6B
            JMP   L2C73
L2642       JMP   L2657

L2645       STR   '0/GOODD'
L264D       DW    $0000       ;  ref num
            ADRL  L2645       ;  path name
            ADRL  $00000000   ;  reserved
L2657       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L264D
            JSR   L10AC
            LDA   L264D
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2675

L2673       DW    $0000
L2675       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L2673
            ASL
            ASL
            ASL
            ASL
            ORA   L2673
            STA   L2673
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2673
            STAL  $E0C022
            JSR   L492E
            LDA   #$0008
            STA   L4A65
            STA   L4A67
            JMP   L2C73
L26B0       JMP   L26C5

L26B3       STR   '0/GOODE'
L26BB       DW    $0000       ;  ref num
            ADRL  L26B3       ;  path name
            ADRL  $00000000   ;  reserved
L26C5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L26BB
            JSR   L10AC
            LDA   L26BB
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L26E3

L26E1       DW    $0000
L26E3       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L26E1
            ASL
            ASL
            ASL
            ASL
            ORA   L26E1
            STA   L26E1
            LDAL  $E0C022
            AND   #$FF00
            ORA   L26E1
            STAL  $E0C022
            JSR   L492E
            LDA   #$0008
            STA   L4A65
            STA   L4A67
            LDA   #$0003
            STA   L4A69
            JMP   L2C73
L2724       JMP   L2739

L2727       STR   '0/GOODF'
L272F       DW    $0000       ;  ref num
            ADRL  L2727       ;  path name
            ADRL  $00000000   ;  reserved
L2739       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L272F
            JSR   L10AC
            LDA   L272F
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2757

L2755       DW    $0000
L2757       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L2755
            ASL
            ASL
            ASL
            ASL
            ORA   L2755
            STA   L2755
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2755
            STAL  $E0C022
            JSR   L492E
            LDA   #$0002
            STA   L4A6B
            JMP   L2C73
L278F       JMP   L27A4

L2792       STR   '0/GOODG'
L279A       DW    $0000       ;  ref num
            ADRL  L2792       ;  path name
            ADRL  $00000000   ;  reserved
L27A4       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L279A
            JSR   L10AC
            LDA   L279A
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L27C2

L27C0       DW    $0000
L27C2       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L27C0
            ASL
            ASL
            ASL
            ASL
            ORA   L27C0
            STA   L27C0
            LDAL  $E0C022
            AND   #$FF00
            ORA   L27C0
            STAL  $E0C022
            JSR   L492E
            LDA   #$0006
            STA   L4A69
            JMP   L2C73
L27FA       JMP   L280F

L27FD       STR   '0/GOODH'
L2805       DW    $0000       ;  ref num
            ADRL  L27FD       ;  path name
            ADRL  $00000000   ;  reserved
L280F       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2805
            JSR   L10AC
            LDA   L2805
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L282D

L282B       DW    $0000
L282D       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L282B
            ASL
            ASL
            ASL
            ASL
            ORA   L282B
            STA   L282B
            LDAL  $E0C022
            AND   #$FF00
            ORA   L282B
            STAL  $E0C022
            JSR   L492E
            LDA   #$0008
            STA   L4A67
            LDA   #$000A
            STA   L4A69
            JMP   L2C73
L286B       JMP   L2880

L286E       STR   '0/GOODI'
L2876       DW    $0000       ;  ref num
            ADRL  L286E       ;  path name
            ADRL  $00000000   ;  reserved
L2880       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2876
            JSR   L10AC
            LDA   L2876
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L289E

L289C       DW    $0000
L289E       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L289C
            ASL
            ASL
            ASL
            ASL
            ORA   L289C
            STA   L289C
            LDAL  $E0C022
            AND   #$FF00
            ORA   L289C
            STAL  $E0C022
            JSR   L492E
            LDA   #$000A
            STA   L4A65
            LDA   #$0005
            STA   L4A67
            JMP   L2C73
L28DC       JMP   L28F1

L28DF       STR   '0/GOODJ'
L28E7       DW    $0000       ;  ref num
            ADRL  L28DF       ;  path name
            ADRL  $00000000   ;  reserved
L28F1       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L28E7
            JSR   L10AC
            LDA   L28E7
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L290F

L290D       DW    $0000
L290F       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L290D
            ASL
            ASL
            ASL
            ASL
            ORA   L290D
            STA   L290D
            LDAL  $E0C022
            AND   #$FF00
            ORA   L290D
            STAL  $E0C022
            JSR   L492E
            LDA   #$0005
            STA   L4A65
            LDA   #$000A
            STA   L4A6B
            JMP   L2C73
L294D       JMP   L2962

L2950       STR   '0/GOODK'
L2958       DW    $0000       ;  ref num
            ADRL  L2950       ;  path name
            ADRL  $00000000   ;  reserved
L2962       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2958
            JSR   L10AC
            LDA   L2958
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2980

L297E       DW    $0000
L2980       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L297E
            ASL
            ASL
            ASL
            ASL
            ORA   L297E
            STA   L297E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L297E
            STAL  $E0C022
            JSR   L492E
            LDA   #$000A
            STA   L4A65
            LDA   #$000B
            STA   L4A67
            LDA   #$0005
            STA   L4A69
            LDA   #$000A
            STA   L4A6B
            JMP   L2C73
L29CA       JMP   L29DF

L29CD       STR   '0/GOODL'
L29D5       DW    $0000       ;  ref num
            ADRL  L29CD       ;  path name
            ADRL  $00000000   ;  reserved
L29DF       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L29D5
            JSR   L10AC
            LDA   L29D5
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L29FD

L29FB       DW    $0000
L29FD       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L29FB
            ASL
            ASL
            ASL
            ASL
            ORA   L29FB
            STA   L29FB
            LDAL  $E0C022
            AND   #$FF00
            ORA   L29FB
            STAL  $E0C022
            JSR   L492E
            LDA   #$0005
            STA   L4A67
            LDA   #$0003
            STA   L4A69
            STA   L4A6B
            JMP   L2C73
L2A3E       JMP   L2A53

L2A41       STR   '0/GOODM'
L2A49       DW    $0000       ;  ref num
            ADRL  L2A41       ;  path name
            ADRL  $00000000   ;  reserved
L2A53       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2A49
            JSR   L10AC
            LDA   L2A49
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2A71

L2A6F       DW    $0000
L2A71       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L2A6F
            ASL
            ASL
            ASL
            ASL
            ORA   L2A6F
            STA   L2A6F
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2A6F
            STAL  $E0C022
            JSR   L492E
            LDA   #$0002
            STA   L4A65
            LDA   #$0003
            STA   L4A67
            LDA   #$0004
            STA   L4A6B
            JMP   L2C73
L2AB5       JMP   L2ACA

L2AB8       STR   '0/GOODN'
L2AC0       DW    $0000       ;  ref num
            ADRL  L2AB8       ;  path name
            ADRL  $00000000   ;  reserved
L2ACA       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2AC0
            JSR   L10AC
            LDA   L2AC0
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2AE8

L2AE6       DW    $0000
L2AE8       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L2AE6
            ASL
            ASL
            ASL
            ASL
            ORA   L2AE6
            STA   L2AE6
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2AE6
            STAL  $E0C022
            JSR   L492E
            LDA   #$0005
            STA   L4A69
            JMP   L2C73
L2B20       JMP   L2B35

L2B23       STR   '0/GOODO'
L2B2B       DW    $0000       ;  ref num
            ADRL  L2B23       ;  path name
            ADRL  $00000000   ;  reserved
L2B35       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2B2B
            JSR   L10AC
            LDA   L2B2B
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2B53

L2B51       DW    $0000
L2B53       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0005
            STAL  $E0C034
            LDA   #$0005
            STA   L2B51
            ASL
            ASL
            ASL
            ASL
            ORA   L2B51
            STA   L2B51
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2B51
            STAL  $E0C022
            JSR   L492E
            LDA   #$0007
            STA   L4A67
            LDA   #$0005
            STA   L4A6B
            JMP   L2C73
L2B91       JMP   L2BA6

L2B94       STR   '0/GOODQ'
L2B9C       DW    $0000       ;  ref num
            ADRL  L2B94       ;  path name
            ADRL  $00000000   ;  reserved
L2BA6       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2B9C
            JSR   L10AC
            LDA   L2B9C
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2BC4

L2BC2       DW    $0000
L2BC4       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2BC2
            ASL
            ASL
            ASL
            ASL
            ORA   L2BC2
            STA   L2BC2
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2BC2
            STAL  $E0C022
            JSR   L492E
            LDA   #$000F
            STA   L4A67
            LDA   #$0008
            STA   L4A69
            JMP   L2C73
L2C02       JMP   L2C17

L2C05       STR   '0/GOODR'
L2C0D       DW    $0000       ;  ref num
            ADRL  L2C05       ;  path name
            ADRL  $00000000   ;  reserved
L2C17       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2C0D
            JSR   L10AC
            LDA   L2C0D
            STA   L0BA3
            STA   L0BB1
            JSR   L479E
            JMP   L2C35

L2C33       DW    $0000
L2C35       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2C33
            ASL
            ASL
            ASL
            ASL
            ORA   L2C33
            STA   L2C33
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2C33
            STAL  $E0C022
            JSR   L492E
            LDA   #$0002
            STA   L4A67
            LDA   #$0003
            STA   L4A69
            JMP   L2C73

L2C73       JSR   L460B
            LDA   #$2000
            STA   L0CD4
            JSR   L2072
            STZ   L0CD2
            JSR   L1217
            JSR   L468C
            RTS

            STA   L2CEF
L2C8C       LDA   L2CEF
            SEC
            SBC   #$0001
            ASL
            ASL
            TAY
            LDA   L2D59,Y
            STA   L0CD8
            LDA   L2D5B,Y
            STA   L0CD6
            LDA   L229C
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L229E,Y
            STA   L0EED
            LDA   L22A0,Y
            STA   L0EEF
            LDA   L22A2,Y
            STA   L0EF1
            LDA   L22A4,Y
            STA   L0EF3
            LDA   L0CD8
            STA   L0EE9
            LDA   L0CD6
            STA   L0EEB
            LDA   #^L0E89
            PHA
            LDA   #L0E89
            PHA
            _PaintPixels
            JSR   L10AC
            DEC   L2CEF
            LDA   L2CEF
            BEQ   L2CEE
            JMP   L2C8C
L2CEE       RTS

L2CEF       DW    $0000
            STA   L2D57
L2CF4       LDA   L2D57
            SEC
            SBC   #$0001
            ASL
            ASL
            TAY
            LDA   L2D81,Y
            STA   L0CD8
            LDA   L2D83,Y
            STA   L0CD6
            LDA   L229C
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L229E,Y
            STA   L0EED
            LDA   L22A0,Y
            STA   L0EEF
            LDA   L22A2,Y
            STA   L0EF1
            LDA   L22A4,Y
            STA   L0EF3
            LDA   L0CD8
            STA   L0EE9
            LDA   L0CD6
            STA   L0EEB
            LDA   #^L0E89
            PHA
            LDA   #L0E89
            PHA
            _PaintPixels
            JSR   L10AC
            DEC   L2D57
            LDA   L2D57
            BEQ   L2D56
            JMP   L2CF4
L2D56       RTS

L2D57       DW    $0000
L2D59       DW    $0000
L2D5B       DW    $006C
            DW    $0000
            DW    $0036
            DW    $001B
            DW    $004E
            DW    $001B
            DW    $0084
            DW    $0000
            DW    $00A2
            DW    $001B
            DW    $00BA
            DW    $001B
            DW    $0018
            DW    $0000
            DW    $00D8
            DW    $0000
            DW    $0000
            DW    $001B
            DW    $00F0
L2D81       DW    $004C
L2D83       DW    $006C
            DW    $004C
            DW    $0036
            DW    $0067
            DW    $004E
            DW    $0067
            DW    $0084
            DW    $004C
            DW    $00A2
            DW    $0067
            DW    $00BA
            DW    $0067
            DW    $0018
            DW    $004C
            DW    $00D8
            DW    $004C
            DW    $0000
            DW    $0067
            DW    $00F0
            SEC
            SBC   #$0001
            ASL
            ASL
            TAY
            LDA   L100F,Y
            STA   L0CDE
            LDA   L100F+2,Y
            STA   L0CDE+2
            JSR   L1496
            RTS

L2DC0       LDA   L0D54
            ASL
            TAY
            LDA   L0D56,Y
            BEQ   L2DCC
            SEC
            RTS

L2DCC       LDA   #$0001
            STA   L0D56,Y
            CLC
            RTS

L2DD4       LDY   #$0000
            LDA   #$0000
L2DDA       STA   L0D56,Y
            INY
            INY
            CPY   #$0014
            BNE   L2DDA
            RTS

            LDA   #$000D
            STA   L0CCA
            LDA   #$000B
            PHA
            _SetForeColor
L2DF6       JSR   L2072
            CLC
            LDA   #$00BA
            STA   L0DE4
            LDA   #$000B
            STA   L0DE6
            LDA   #$00C7
            ADC   #$0001
            STA   L0DE2
            LDA   #$0135
            ADC   #$0001
            STA   L0DE8
            LDA   L0CCA
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            STZ   L0CE2
            LDA   #$00C4
            STA   L0CDC
            LDA   #$000F
            STA   L0CDA
            JMP   L2E53

	DO	VF
L2E3C       STR   '(espace : continuer)'
	ELSE
L2E3C       STR   '(spacebar to continue)'
	FIN
L2E53       LDA   #^L2E3C
            STA   L0CDE+2
            LDA   #L2E3C
            STA   L0CDE
            JSR   L146D
	DO	VF
            LDA   #$00C6
            	ELSE
            LDA   #$00D6
	FIN
            STA   L0CDA
            JMP   L2E79

	DO	VF
L2E6B       STR   '(esc : quitter)'
	ELSE
L2E6B       STR   '(esc to quit)'
	FIN
L2E79       LDA   #^L2E6B
            STA   L0CDE+2
            LDA   #L2E6B
            STA   L0CDE
            JSR   L146D
            LDA   #$0020
            STA   L0DC7
            JSR   L1242
            RTS

L2E92       STA   L2ECC
            PHA
            LDA   #^L0D25
            PHA
            LDA   #L0D25
            PHA
            LDA   L2ECC
            CMP   #$000A
            BCS   L2EAC
            LDA   #$0001
            JMP   L2EBA

L2EAC       CMP   #$0064
            BCS   L2EB7
            LDA   #$0002
            JMP   L2EBA

L2EB7       LDA   #$0003
L2EBA       STA   L0D24
            PHA
            PEA   $0000
            _Int2Dec
            JSR   L10AC
            RTS

L2ECC       DW    $0000
            LDA   #$000F
            PHA
            _SetForeColor
            PEA   $000F
            _SetSolidPenPat
            LDA   L0CD6
            CLC
            ADC   #$0001
            PHA
            LDA   L0CD8
            CLC
            ADC   #$0002
            PHA
            _MoveTo
            LDA   L0CD6
            CLC
            ADC   #$000E
            PHA
            LDA   L0CD8
            CLC
            ADC   #$0002
            PHA
            _LineTo
            JSR   L10AC
            LDA   L0CD6
            CLC
            ADC   #$0019
            PHA
            LDA   L0CD8
            CLC
            ADC   #$0002
            PHA
            _MoveTo
            LDA   L0CD6
            CLC
            ADC   #$0026
            PHA
            LDA   L0CD8
            CLC
            ADC   #$0002
            PHA
            _LineTo
            JSR   L10AC
            LDA   L0CD6
            CLC
            ADC   #$0031
            PHA
            LDA   L0CD8
            CLC
            ADC   #$0002
            PHA
            _MoveTo
            LDA   L0CD6
            CLC
            ADC   #$003E
            PHA
            LDA   L0CD8
            CLC
            ADC   #$0002
            PHA
            _LineTo
            JSR   L10AC
            LDA   L0CD6
            CLC
            ADC   #$0010
            PHA
            LDA   L0CD8
            PHA
            _MoveTo
            PEA   $002D
            _DrawChar
            LDA   L0CD6
            CLC
            ADC   #$0028
            PHA
            LDA   L0CD8
            PHA
            _MoveTo
            PEA   $003D
            _DrawChar
            RTS

            LDA   L1005
            JSR   L2E92
            LDA   L0CD6
            STA   L0CDA
            JMP   L2FE3

            LDA   L1007
            JSR   L2E92
            LDA   L0CD6
            CLC
            ADC   #$0018
            STA   L0CDA
            JMP   L2FE3

            LDA   L0D54
            JSR   L2E92
            LDA   L0CD6
            CLC
            ADC   #$0030
            STA   L0CDA
L2FE3       LDA   L0CD8
            STA   L0CDC
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L146D
            RTS

L2FF9       LDA   #$0006
            STA   L0CDA
            LDA   #$0024
            STA   L0CDC
            LDA   #$0009
            STA   L0CE2
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D54
            ASL
            ASL
            TAY
            LDA   L302D,Y
            STAL  $000000
            LDA   L302D+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L302D       ADRL  L3041
            ADRL  L30B1
            ADRL  L3126
            ADRL  L3199
            ADRL  L320A
L3041       JMP   L306C

	DO	VF
L3044       STR   '    Dix tartes ont '8e't'8e' cuites et sept'
	ELSE
L3044       STR   '     Ten pies were baked and seven were'
	FIN
L306C       LDA   #^L3044
            STA   L0CDE+2
            LDA   #L3044
            STA   L0CDE
            JSR   L146D
            JMP   L3099

	DO	VF
L307E       STR   'ont '8e't'8e' mang'8e'es. Combien en reste-t-il ?'
	ELSE
L307E       STR   'eaten.  How many are left?'
	FIN
L3099       LDA   #^L307E
            STA   L0CDE+2
            LDA   #L307E
            STA   L0CDE
            JSR   L146D
            LDA   #$0003
            STA   L0D54
            JMP   L3276
L30B1       JMP   L30E2

	DO	VF
L30B4       STR   '    Dix voitures dans un parking et quatre'
	ELSE
L30B4       STR   '     Ten cars are in a lot.  Four were driven'
	FIN
L30E2       LDA   #^L30B4
            STA   L0CDE+2
            LDA   #L30B4
            STA   L0CDE
            JSR   L146D
            JMP   L310E

	DO	VF
L30F4       STR   'partent. Combien en reste-t-il ?'
	ELSE
L30F4       STR   'away.  How many are left?'
	FIN
L310E       LDA   #^L30F4
            STA   L0CDE+2
            LDA   #L30F4
            STA   L0CDE
            JSR   L146D
            LDA   #$0006
            STA   L0D54
            JMP   L3276
L3126       JMP   L3154

	DO	VF
L3129       STR   '    Cinq poissons nageaient. Quatre ont'
	ELSE
L3129       STR   '     Five fish swam by a shark.  Four were'
	FIN
L3154       LDA   #^L3129
            STA   L0CDE+2
            LDA   #L3129
            STA   L0CDE
            JSR   L146D
            JMP   L3181

	DO	VF
L3166       STR   8e't'8e' mang'8e's. Combien en reste-t-il ?'
	ELSE
L3166       STR   'eaten.  How many are left?'
	FIN
L3181       LDA   #^L3166
            STA   L0CDE+2
            LDA   #L3166
            STA   L0CDE
            JSR   L146D
            LDA   #$0001
            STA   L0D54
            JMP   L3276
L3199       JMP   L31C6

	DO	VF
L319C       STR   '    Tu as six pi'8f'ces et en donnes quatre.'
	ELSE
L319C       STR   '     You have six coins and you give four'
	FIN
L31C6       LDA   #^L319C
            STA   L0CDE+2
            LDA   #L319C
            STA   L0CDE
            JSR   L146D
            JMP   L31F2

	DO	VF
L31D8       STR   'Combien t'27'en reste-t-il ?'
	ELSE
L31D8       STR   'away.  How many are left?'
	FIN
L31F2       LDA   #^L31D8
            STA   L0CDE+2
            LDA   #L31D8
            STA   L0CDE
            JSR   L146D
            LDA   #$0002
            STA   L0D54
            JMP   L3276
L320A       JMP   L323C

	DO	VF
L320D       STR   '    Six araign'8e'es sur une toile et trois'
	ELSE
L320D       STR   '     Six spiders are on a web and three leave.'
	FIN
L323C       LDA   #^L320D
            STA   L0CDE+2
            LDA   #L320D
            STA   L0CDE
            JSR   L146D
            JMP   L3261

	DO	VF
L324E       STR   'partent. Combien en reste-t-il ?'
	ELSE
L324E       STR   'How many are left?'
	FIN
L3261       LDA   #^L324E
            STA   L0CDE+2
            LDA   #L324E
            STA   L0CDE
            JSR   L146D
            LDA   #$0003
            STA   L0D54
L3276       CLC
            LDA   #$0052
            STA   L0DE4
            LDA   #$008F
            STA   L0DE6
            LDA   #$0067
            ADC   #$0001
            STA   L0DE2
            LDA   #$00AE
            ADC   #$0001
            STA   L0DE8
            LDA   #$0009
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0056
            STA   L0DE4
            LDA   #$0093
            STA   L0DE6
            LDA   #$0064
            ADC   #$0001
            STA   L0DE2
            LDA   #$00AA
            ADC   #$0001
            STA   L0DE8
            LDA   #$0008
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            JSR   L1C73
            RTS

L32DC       LDA   #$0006
            STA   L0CDA
            LDA   #$0024
            STA   L0CDC
            LDA   #$0009
            STA   L0CE2
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D54
            ASL
            ASL
            TAY
            LDA   L3310,Y
            STAL  $000000
            LDA   L3310+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L3310       ADRL  L3324
            ADRL  L33D6
            ADRL  L347D
            ADRL  L3562
            ADRL  L3657
L3324       JMP   L3356

	DO	VF
L3327       STR   '    Le chien blanc a trouv'8e' six os. Le chien'
	ELSE
L3327       STR   '     The white dog found six bones.  The black'
	FIN
L3356       LDA   #^L3327
            STA   L0CDE+2
            LDA   #L3327
            STA   L0CDE
            JSR   L146D
            JMP   L3394

	DO	VF
L3368       STR   'noir a trouv'8e' trois os. Combien d'27
	ELSE
L3368       STR   'dog found three bones.  How many more bones'
	FIN
L3394       LDA   #^L3368
            STA   L0CDE+2
            LDA   #L3368
            STA   L0CDE
            JSR   L146D
            JMP   L33BE

	DO	VF
L33A6       STR   'os de plus le chien blanc a trouv'8e' ?'
	ELSE
L33A6       STR   'did the white dog find?'
	FIN
L33BE       LDA   #^L33A6
            STA   L0CDE+2
            LDA   #L33A6
            STA   L0CDE
            JSR   L146D
            LDA   #$0003
            STA   L0D54
            JMP   L36EF
L33D6       JMP   L3408

	DO	VF
L33D9       STR   '    La route de John est de six kilom'8f'tres,'
	ELSE
L33D9       STR   '     John'27's road is six miles long and Harry'27's'
	FIN
L3408       LDA   #^L33D9
            STA   L0CDE+2
            LDA   #L33D9
            STA   L0CDE
            JSR   L146D
            JMP   L3446

	DO	VF
L341A       STR   'celle d'27'Harry est de 2 kilom'8f'tres. De'
	ELSE
L341A       STR   'road is two miles long.  How much longer is'
	FIN
L3446       LDA   #^L341A
            STA   L0CDE+2
            LDA   #L341A
            STA   L0CDE
            JSR   L146D
            JMP   L3465

	DO	VF
L3458       STR   'combien la route de John est plus longue ?'
	ELSE
L3458       STR   'John'27's road?'
	FIN
L3465       LDA   #^L3458
            STA   L0CDE+2
            LDA   #L3458
            STA   L0CDE
            JSR   L146D
            LDA   #$0004
            STA   L0D54
            JMP   L36EF
L347D       JMP   L34A8

	DO	VF
L3480       STR   '    Le cookie de Sally a trois p'8e'pites de'
	ELSE
L3480       STR   '     Sally'27's cookie has three chocolate'
	FIN
L34A8       LDA   #^L3480
            STA   L0CDE+2
            LDA   #L3480
            STA   L0CDE
            JSR   L146D
            JMP   L34E0

	DO	VF
L34BA       STR   'chocolat et celui de Jane en a deux.'
	ELSE
L34BA       STR   'chips in it and Jane'27's cookie has two'
	FIN
L34E0       LDA   #^L34BA
            STA   L0CDE+2
            LDA   #L34BA
            STA   L0CDE
            JSR   L146D
            JMP   L351E

	DO	VF
L34F2       STR   'Combien de p'8e'pites en plus y a-t-il dans'
	ELSE
L34F2       STR   'chocolate chips in it.  How many more chips'
	FIN
L351E       LDA   #^L34F2
            STA   L0CDE+2
            LDA   #L34F2
            STA   L0CDE
            JSR   L146D
            JMP   L354A

	DO	VF
L3530       STR   'le cookie de Sally ?'
	ELSE
L3530       STR   'does Sally'27's cookie have?'
	FIN
L354A       LDA   #^L3530
            STA   L0CDE+2
            LDA   #L3530
            STA   L0CDE
            JSR   L146D
            LDA   #$0001
            STA   L0D54
            JMP   L36EF
L3562       JMP   L358F

	DO	VF
L3565       STR   '    Une fus'8e'e am'8e'ricaine tourne huit fois'
	ELSE
L3565       STR   '     An American rocket orbited the earth'
	FIN
L358F       LDA   #^L3565
            STA   L0CDE+2
            LDA   #L3565
            STA   L0CDE
            JSR   L146D
            JMP   L35CC

	DO	VF
L35A1       STR   'autour de la Terre. La fus'8e'e russe'
	ELSE
L35A1       STR   'eight times.  A Russian rocket orbited the'
	FIN
L35CC       LDA   #^L35A1
            STA   L0CDE+2
            LDA   #L35A1
            STA   L0CDE
            JSR   L146D
            JMP   L3608

	DO	VF
L35DE       STR   'deux fois. Combien de fois de plus la'
	ELSE
L35DE       STR   'earth two times.  How many more times did'
	FIN
L3608       LDA   #^L35DE
            STA   L0CDE+2
            LDA   #L35DE
            STA   L0CDE
            JSR   L146D
            JMP   L363F

	DO	VF
L361A       STR   'fus'8e'e am'8e'ricaine a tourn'8e' en orbite ?'
	ELSE
L361A       STR   'the American rocket orbit the earth?'
	FIN
L363F       LDA   #^L361A
            STA   L0CDE+2
            LDA   #L361A
            STA   L0CDE
            JSR   L146D
            LDA   #$0006
            STA   L0D54
            JMP   L36EF
L3657       JMP   L3686

	DO	VF
L365A       STR   '    Jim a mang'8e' neuf glaces et Susan'
	ELSE
L365A       STR   '     Jim ate nine ice cream cones and Susan'
	FIN
L3686       LDA   #^L365A
            STA   L0CDE+2
            LDA   #L365A
            STA   L0CDE
            JSR   L146D
            JMP   L36C0

	DO	VF
L3698       STR   'sept. Combien de glaces de plus John'
	ELSE
L3698       STR   'ate seven.  How many more cones did Jim'
	FIN
L36C0       LDA   #^L3698
            STA   L0CDE+2
            LDA   #L3698
            STA   L0CDE
            JSR   L146D
            JMP   L36D7

	DO	VF
L36D2       STR   'a mang'8e' ?'
	ELSE
L36D2       STR   'eat?'
	FIN
L36D7       LDA   #^L36D2
            STA   L0CDE+2
            LDA   #L36D2
            STA   L0CDE
            JSR   L146D
            LDA   #$0002
            STA   L0D54
            JMP   L36EF

L36EF       CLC
            LDA   #$0052
            STA   L0DE4
            LDA   #$008F
            STA   L0DE6
            LDA   #$0067
            ADC   #$0001
            STA   L0DE2
            LDA   #$00AE
            ADC   #$0001
            STA   L0DE8
            LDA   #$0009
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0056
            STA   L0DE4
            LDA   #$0093
            STA   L0DE6
            LDA   #$0064
            ADC   #$0001
            STA   L0DE2
            LDA   #$00AA
            ADC   #$0001
            STA   L0DE8
            LDA   #$0008
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            JSR   L1C73
            RTS

L3755       LDA   #$0006
            STA   L0CDA
            LDA   #$0009
            STA   L0CDC
            LDA   #$0009
            STA   L0CE2
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D54
            ASL
            ASL
            TAY
            LDA   L3789,Y
            STAL  $000000
            LDA   L3789+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L3789       ADRL  L379D
            ADRL  L381C
            ADRL  L389A
            ADRL  L3956
            ADRL  L39E7
L379D       JMP   L37CF

	DO	VF
L37A0       STR   '    Tu es sur la premi'8f're marche. Combien'
	ELSE
L37A0       STR   '     You are on the first step.  How many more'
	FIN
L37CF       LDA   #^L37A0
            STA   L0CDE+2
            LDA   #L37A0
            STA   L0CDE
            JSR   L146D
            JMP   L37F2

	DO	VF
L37E1       STR   'en plus pour atteindre la troisi'8f'me ?'
	ELSE
L37E1       STR   'to get to three?'
	FIN
L37F2       LDA   #^L37E1
            STA   L0CDE+2
            LDA   #L37E1
            STA   L0CDE
            JSR   L146D
            LDA   #$0003
            STA   L1005
            LDA   #$0001
            STA   L1007
            LDA   #$0002
            STA   L0D54
            LDA   #$002B
            STA   L0CDA
            JMP   L3A92
L381C       JMP   L384E

	DO	VF
L381F       STR   '    Tu es sur la cinqui'8f'me marche. Combien'
	ELSE
L381F       STR   '     You are on the fifth step.  How many more'
	FIN
L384E       LDA   #^L381F
            STA   L0CDE+2
            LDA   #L381F
            STA   L0CDE
            JSR   L146D
            JMP   L3870

	DO	VF
L3860       STR   'en plus pour atteindre la neuvi'8f'me ?'
	ELSE
L3860       STR   'to get to nine?'
	FIN
L3870       LDA   #^L3860
            STA   L0CDE+2
            LDA   #L3860
            STA   L0CDE
            JSR   L146D
            LDA   #$0009
            STA   L1005
            LDA   #$0005
            STA   L1007
            LDA   #$0004
            STA   L0D54
            LDA   #$002B
            STA   L0CDA
            JMP   L3A92
L389A       JMP   L38C8

	DO	VF
L389D       STR   '    Tu es sur la onzi'8f'me marche et veux'
	ELSE
L389D       STR   '     You are on step 11 and you want to go'
	FIN
L38C8       LDA   #^L389D
            STA   L0CDE+2
            LDA   #L389D
            STA   L0CDE
            JSR   L146D
            JMP   L3902

	DO	VF
L38DA       STR   'retourner sur la troisi'8f'me. Combien'
	ELSE
L38DA       STR   'back to the third step.  How many steps'
	FIN
L3902       LDA   #^L38DA
            STA   L0CDE+2
            LDA   #L38DA
            STA   L0CDE
            JSR   L146D
            JMP   L392C

	DO	VF
L3914       STR   'de marches dois-tu descendre ?'
	ELSE
L3914       STR   'back do you have to go?'
	FIN
L392C       LDA   #^L3914
            STA   L0CDE+2
            LDA   #L3914
            STA   L0CDE
            JSR   L146D
            LDA   #$000B
            STA   L1005
            LDA   #$0003
            STA   L1007
            LDA   #$0008
            STA   L0D54
            LDA   #$0023
            STA   L0CDA
            JMP   L3A92
L3956       JMP   L3984

	DO	VF
L3959       STR   '    Tu es sur la dixi'8f'me marche et tombe'
	ELSE
L3959       STR   '     You are on step ten and you fall down'
	FIN
L3984       LDA   #^L3959
            STA   L0CDE+2
            LDA   #L3959
            STA   L0CDE
            JSR   L146D
            JMP   L39BD

	DO	VF
L3996       STR   'de neuf marches. Sur quelle marche es-tu ?'
	ELSE
L3996       STR   'nine steps.  What step are you on now?'
	FIN
L39BD       LDA   #^L3996
            STA   L0CDE+2
            LDA   #L3996
            STA   L0CDE
            JSR   L146D
            LDA   #$000A
            STA   L1005
            LDA   #$0009
            STA   L1007
            LDA   #$0001
            STA   L0D54
            LDA   #$0023
            STA   L0CDA
            JMP   L3A92
L39E7       JMP   L3A19

	DO	VF
L39EA       STR   '    Une amie est sur la marche sept. Combien'
	ELSE
L39EA       STR   '     A friend is on step seven.  How many more'
	FIN
L3A19       LDA   #^L39EA
            STA   L0CDE+2
            LDA   #L39EA
            STA   L0CDE
            JSR   L146D
            JMP   L3A54

	DO	VF
L3A2B       STR   'de marches en plus doit-elle monter pour'
	ELSE
L3A2B       STR   'steps does she have to go to get to step'
	FIN
L3A54       LDA   #^L3A2B
            STA   L0CDE+2
            LDA   #L3A2B
            STA   L0CDE
            JSR   L146D
            JMP   L3A6B

	DO	VF
L3A66       STR   'atteindre la dixi'8f'me marche ?'
	ELSE
L3A66       STR   'ten?'
	FIN
L3A6B       LDA   #^L3A66
            STA   L0CDE+2
            LDA   #L3A66
            STA   L0CDE
            JSR   L146D
            LDA   #$000A
            STA   L1005
            LDA   #$0007
            STA   L1007
            LDA   #$0003
            STA   L0D54
            LDA   #$0023
            STA   L0CDA
L3A92       LDA   L1005
            JSR   L2E92
            JMP   L3A9D

L3A9B       STR   '-'
L3A9D       LDA   #^L3A9B
            STA   L0CDE+2
            LDA   #L3A9B
            STA   L0CDE
            LDA   L0D20
            STA   L0CE4
            LDA   L0D22
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   L1007
            JSR   L2E92
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L3B02

L3B00       STR   '='
L3B02       LDA   #^L3B00
            STA   L0CDE+2
            LDA   #L3B00
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0D20
            STA   L0CEC
            LDA   L0D22
            STA   L0CEE
            JSR   L2082
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            LDA   #$0063
            STA   L0CDC
            STZ   L0CE2
            LDA   #$0000
            PHA
            _SetForeColor
            JSR   L146D
            JSR   L3B5F
            JSR   L1C73
            RTS

L3B5F       LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1005
            JSR   L3B9F
            LDA   L1005
            JSR   L3BB2
            STZ   L0CE2
            JMP   L3B7E

L3B7C       STR   '*'
L3B7E       LDA   #^L3B7C
            STA   L0CDE+2
            LDA   #L3B7C
            STA   L0CDE
            JSR   L146D
            LDA   L1007
            JSR   L3B9F
            LDA   L1007
            JSR   L3BB2
            JSR   L146D
            RTS

L3B9D       DW    $0000
L3B9F       STA   L3B9D
            ASL
            ASL
            ASL
            ASL
            SEC
            SBC   L3B9D
            CLC
            ADC   #$002E
            STA   L0CDA
            RTS

L3BB2       STA   L3B9D
            ASL
            ASL
            ASL
            CLC
            ADC   L3B9D
            CLC
            ADC   L3B9D
            STA   L0CDC
            LDA   #$00AA
            SEC
            SBC   L0CDC
            STA   L0CDC
            RTS

            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0077
            STA   L0CDC
            LDA   #$0008
            STA   L0CDA
            LDA   #$0009
            STA   L0CE2
            JMP   L3C19

	DO	VF
L3BEE       STR   '    Saisis le premier nombre puis'
	ELSE
L3BEE       STR   '     Please type in the first number, then'
	FIN
L3C19       LDA   #^L3BEE
            STA   L0CDE+2
            LDA   #L3BEE
            STA   L0CDE
            JSR   L146D
            JMP   L3C39

	DO	VF
L3C2B       STR   'appuie sur ENTREE.'
	ELSE
L3C2B       STR   'press RETURN.'
	FIN
L3C39       LDA   #^L3C2B
            STA   L0CDE+2
            LDA   #L3C2B
            STA   L0CDE
            JSR   L146D
            LDA   L0CD6
            STA   L0CDA
            LDA   L0CD8
            STA   L0CDC
            JSR   L14CA
            JSR   L1592
            LDA   L0D52
            STA   L1009
            CLC
            LDA   #$006E
            STA   L0DE4
            LDA   #$0000
            STA   L0DE6
            LDA   #$0082
            ADC   #$0001
            STA   L0DE2
            LDA   #$013F
            ADC   #$0001
            STA   L0DE8
            LDA   #$0002
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            RTS

            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0077
            STA   L0CDC
            LDA   #$0008
            STA   L0CDA
            LDA   #$0009
            STA   L0CE2
            JMP   L3CDE

	DO	VF
L3CB2       STR   '    Saisis le second nombre puis'
	ELSE
L3CB2       STR   '     Please type in the second number, then'
	FIN
L3CDE       LDA   #^L3CB2
            STA   L0CDE+2
            LDA   #L3CB2
            STA   L0CDE
            JSR   L146D
            JMP   L3CFE

	DO	VF
L3CF0       STR   'appuie sur ENTREE.'
	ELSE
L3CF0       STR   'press RETURN.'
	FIN
L3CFE       LDA   #^L3CF0
            STA   L0CDE+2
            LDA   #L3CF0
            STA   L0CDE
            JSR   L146D
            LDA   L0CD6
            CLC
            ADC   #$0018
            STA   L0CDA
            LDA   L0CD8
            STA   L0CDC
            JSR   L14CA
            JSR   L1592
            LDA   L0D52
            STA   L100B
            CLC
            LDA   #$006E
            STA   L0DE4
            LDA   #$0000
            STA   L0DE6
            LDA   #$0082
            ADC   #$0001
            STA   L0DE2
            LDA   #$013F
            ADC   #$0001
            STA   L0DE8
            LDA   #$0002
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            RTS

            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0077
            STA   L0CDC
            LDA   #$0008
            STA   L0CDA
            LDA   #$0009
            STA   L0CE2
            JMP   L3DA3

	DO	VF
L3D7B       STR   '    Saisis la somme puis appuie sur'
	ELSE
L3D7B       STR   '     Please type in the sum, then press'
	FIN
L3DA3       LDA   #^L3D7B
            STA   L0CDE+2
            LDA   #L3D7B
            STA   L0CDE
            JSR   L146D
            JMP   L3DBD

	DO	VF
L3DB5       STR   'ENTREE.'
	ELSE
L3DB5       STR   'RETURN.'
	FIN
L3DBD       LDA   #^L3DB5
            STA   L0CDE+2
            LDA   #L3DB5
            STA   L0CDE
            JSR   L146D
            LDA   L0CD6
            CLC
            ADC   #$0030
            STA   L0CDA
            LDA   L0CD8
            STA   L0CDC
            JSR   L14CA
            JSR   L1592
            LDA   L0D52
            STA   L100D
            CLC
            LDA   #$006E
            STA   L0DE4
            LDA   #$0000
            STA   L0DE6
            LDA   #$0082
            ADC   #$0001
            STA   L0DE2
            LDA   #$013F
            ADC   #$0001
            STA   L0DE8
            LDA   #$0002
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            RTS

            LDA   L1009
            CMP   L1005
            BEQ   L3E25
            JMP   L3E30

L3E25       LDA   L100B
            CMP   L1007
            BNE   L3E30
            JMP   L3E32

L3E30       SEC
            RTS

L3E32       LDA   L100D
            CMP   L0D54
            BEQ   L3E3D
            JMP   L3E30

L3E3D       CLC
            RTS
            JMP   L3E59

	DO	VF
L3E42       STR   'La bonne r'8e'ponse est '
	ELSE
L3E42       STR   'The correct answer is '
	FIN
L3E59       LDA   #^L3E42
            STA   L0CDE+2
            LDA   #L3E42
            STA   L0CDE
            LDA   L1005
            JSR   L2E92
            LDA   L0CDE
            STA   L0CE4
            LDA   L0CDE+2
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L3E97

L3E95       STR   '+'
L3E97       LDA   #^L3E95
            STA   L0CDE+2
            LDA   #L3E95
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   L1007
            JSR   L2E92
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L3EFC

L3EFA       STR   '='
L3EFC       LDA   #^L3EFA
            STA   L0CDE+2
            LDA   #L3EFA
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   L0D54
            JSR   L2E92
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            JMP   L3F61

L3F5F       STR   '.'
L3F61       LDA   #^L3F5F
            STA   L0CDE+2
            LDA   #L3F5F
            STA   L0CDE
            LDA   L0CF2
            STA   L0CE4
            LDA   L0CF4
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0CF2
            STA   L0CEC
            LDA   L0CF4
            STA   L0CEE
            JSR   L2082
            LDA   #^L0CF6
            STA   L0CDE+2
            LDA   #L0CF6
            STA   L0CDE
            JSR   L14A6
            RTS
L3FA4       JMP   L3FA9

L3FA7       DW    $0000
L3FA9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L3FA7
            ASL
            ASL
            ASL
            ASL
            ORA   L3FA7
            STA   L3FA7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3FA7
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $FFFF
            _ClearScreen
            JSR   L11DD
            CLC
            LDA   #$0036
            STA   L0DE4
            LDA   #$0072
            STA   L0DE6
            LDA   #$0048
            ADC   #$0001
            STA   L0DE2
            LDA   #$00C5
            ADC   #$0001
            STA   L0DE8
            LDA   #$0006
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0038
            STA   L0DE4
            LDA   #$0074
            STA   L0DE6
            LDA   #$0046
            ADC   #$0001
            STA   L0DE2
            LDA   #$00C3
            ADC   #$0001
            STA   L0DE8
            LDA   #$000A
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L4063

	DO	VF
L4058       STR   'Ton score'
L4063       PEA   $007B
	ELSE
L4058       STR   'Your score'
L4063       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L4058
            PHA
            LDA   #L4058
            PHA
            _DrawString
            LDA   #$0060
            STA   L0CDC
            LDA   #$0023
            STA   L0CDA
            LDA   #$0009
            STA   L0CE2
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L40B2

	DO	VF
L409F       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L409F       STR   '     You answered '
	FIN
L40B2       LDA   #^L409F
            STA   L0CDE+2
            LDA   #L409F
            STA   L0CDE
            JSR   L146D
            LDA   L0D80
            JSR   L2E92
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L1496
            JMP   L40ED

	DO	VF
L40D9       STR   ' questions sur 5'
	ELSE
L40D9       STR   ' out of 5 questions'
	FIN
L40ED       LDA   #^L40D9
            STA   L0CDE+2
            LDA   #L40D9
            STA   L0CDE
            JSR   L1496
            JMP   L411B

	DO	VF
L40FF       STR   'correctement au premier essai.'
	ELSE
L40FF       STR   'correctly on the first try.'
	FIN
L411B       LDA   #^L40FF
            STA   L0CDE+2
            LDA   #L40FF
            STA   L0CDE
            JSR   L146D
            LDA   L0D80
            CMP   #$0005
            BEQ   L4135
            JMP   L4171

L4135       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0085
            STA   L0CDC
            JMP   L4162

	DO	VF
L4149       STR   'C'27'est un score parfait !'
	ELSE
L4149       STR   'That is a perfect score!'
	FIN
L4162       LDA   #^L4149
            STA   L0CDE+2
            LDA   #L4149
            STA   L0CDE
            JSR   L14A6
L4171       JMP   L45F6
            JMP   L4179

L4177       DW    $0000
L4179       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L4177
            ASL
            ASL
            ASL
            ASL
            ORA   L4177
            STA   L4177
            LDAL  $E0C022
            AND   #$FF00
            ORA   L4177
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $FFFF
            _ClearScreen
            JSR   L11DD
            CLC
            LDA   #$0036
            STA   L0DE4
            LDA   #$0072
            STA   L0DE6
            LDA   #$0048
            ADC   #$0001
            STA   L0DE2
            LDA   #$00C5
            ADC   #$0001
            STA   L0DE8
            LDA   #$0006
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0038
            STA   L0DE4
            LDA   #$0074
            STA   L0DE6
            LDA   #$0046
            ADC   #$0001
            STA   L0DE2
            LDA   #$00C3
            ADC   #$0001
            STA   L0DE8
            LDA   #$000A
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L4233

	DO	VF
L4228       STR   'Ton score'
L4233       PEA   $007B
	ELSE
L4228       STR   'Your score'
L4233       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L4228
            PHA
            LDA   #L4228
            PHA
            _DrawString
            LDA   #$0060
            STA   L0CDC
            LDA   #$0023
            STA   L0CDA
            LDA   #$0009
            STA   L0CE2
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L4282

	DO	VF
L426F       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L426F       STR   '     You answered '
	FIN
L4282       LDA   #^L426F
            STA   L0CDE+2
            LDA   #L426F
            STA   L0CDE
            JSR   L146D
            LDA   L0D80
            JSR   L2E92
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L1496
            JMP   L42BD

	DO	VF
L42A9       STR   ' questions sur 3'
	ELSE
L42A9       STR   ' out of 3 questions'
	FIN
L42BD       LDA   #^L42A9
            STA   L0CDE+2
            LDA   #L42A9
            STA   L0CDE
            JSR   L1496
            JMP   L42EB

	DO	VF
L42CF       STR   'correctement au premier essai.'
	ELSE
L42CF       STR   'correctly on the first try.'
	FIN
L42EB       LDA   #^L42CF
            STA   L0CDE+2
            LDA   #L42CF
            STA   L0CDE
            JSR   L146D
            LDA   L0D80
            CMP   #$0003
            BEQ   L4305
            JMP   L4341

L4305       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0085
            STA   L0CDC
            JMP   L4332

	DO	VF
L4319       STR   'C'27'est un score parfait !'
	ELSE
L4319       STR   'That is a perfect score!'
	FIN
L4332       LDA   #^L4319
            STA   L0CDE+2
            LDA   #L4319
            STA   L0CDE
            JSR   L14A6
L4341       JMP   L45F6
            JMP   L4349

L4347       DW    $0000
L4349       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L4347
            ASL
            ASL
            ASL
            ASL
            ORA   L4347
            STA   L4347
            LDAL  $E0C022
            AND   #$FF00
            ORA   L4347
            STAL  $E0C022
            JSR   L11CE
            JSR   L12F3
            PEA   $FFFF
            _ClearScreen
            JSR   L11DD
            CLC
            LDA   #$0036
            STA   L0DE4
            LDA   #$0072
            STA   L0DE6
            LDA   #$0048
            ADC   #$0001
            STA   L0DE2
            LDA   #$00C5
            ADC   #$0001
            STA   L0DE8
            LDA   #$0006
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            CLC
            LDA   #$0038
            STA   L0DE4
            LDA   #$0074
            STA   L0DE6
            LDA   #$0046
            ADC   #$0001
            STA   L0DE2
            LDA   #$00C3
            ADC   #$0001
            STA   L0DE8
            LDA   #$000A
            STA   L0DFC
            JSR   L135B
            JSR   L1363
            JSR   L131B
            JSR   L134B
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L4403

	DO	VF
L43F8       STR   'Ton score'
L4403       PEA   $007B
	ELSE
L43F8       STR   'Your score'
L4403       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L43F8
            PHA
            LDA   #L43F8
            PHA
            _DrawString
            LDA   #$0060
            STA   L0CDC
            LDA   #$0023
            STA   L0CDA
            LDA   #$0009
            STA   L0CE2
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L4452

	DO	VF
L443F       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L443F       STR   '     You answered '
	FIN
L4452       LDA   #^L443F
            STA   L0CDE+2
            LDA   #L443F
            STA   L0CDE
            JSR   L146D
            LDA   L0D80
            JSR   L2E92
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L1496
            JMP   L448E

	DO	VF
L4479       STR   ' questions sur 10'
	ELSE
L4479       STR   ' out of 10 questions'
	FIN
L448E       LDA   #^L4479
            STA   L0CDE+2
            LDA   #L4479
            STA   L0CDE
            JSR   L1496
            JMP   L44BC

	DO	VF
L44A0       STR   'correctement au premier essai.'
	ELSE
L44A0       STR   'correctly on the first try.'
	FIN
L44BC       LDA   #^L44A0
            STA   L0CDE+2
            LDA   #L44A0
            STA   L0CDE
            JSR   L146D
            LDA   L0D80
            CMP   #$0000
            BEQ   L44D6
            JMP   L450C

L44D6       LDA   L0CDC
            CLC
            ADC   L0CE2
            STA   L0CDC
            JMP   L44FA

	DO	VF
L44E3       STR   'C'27'est un score de 0%.'
	ELSE
L44E3       STR   'That is a score of 0%.'
	FIN
L44FA       LDA   #^L44E3
            STA   L0CDE+2
            LDA   #L44E3
            STA   L0CDE
            JSR   L14A6
            JMP   L45AF

L450C       LDA   L0CDC
            CLC
            ADC   L0CE2
            STA   L0CDC
            JMP   L452D

	DO	VF
L4519       STR   'C'27'est un score de '
	ELSE
L4519       STR   'That is a score of '
	FIN
L452D       LDA   #^L4519
            STA   L0CDE+2
            LDA   #L4519
            STA   L0CDE
            LDA   L0D80
            JSR   L2E92
            LDA   L0CDE
            STA   L0CE4
            LDA   L0CDE+2
            STA   L0CE6
            LDA   L0D20
            STA   L0CE8
            LDA   L0D22
            STA   L0CEA
            LDA   L0D20
            STA   L0CEC
            LDA   L0D22
            STA   L0CEE
            JSR   L2082
            JMP   L456D

L4569       STR   '0%.'
L456D       LDA   #^L4569
            STA   L0CDE+2
            LDA   #L4569
            STA   L0CDE
            LDA   L0D20
            STA   L0CE4
            LDA   L0D22
            STA   L0CE6
            LDA   L0CDE
            STA   L0CE8
            LDA   L0CDE+2
            STA   L0CEA
            LDA   L0D20
            STA   L0CEC
            LDA   L0D22
            STA   L0CEE
            JSR   L2082
            LDA   #^L0D24
            STA   L0CDE+2
            LDA   #L0D24
            STA   L0CDE
            JSR   L14A6
L45AF       LDA   L0D80
            CMP   #$000A
            BEQ   L45BA
            JMP   L45F6

L45BA       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$008E
            STA   L0CDC
            JMP   L45E7

	DO	VF
L45CE       STR   'C'27'est un score parfait !'
	ELSE
L45CE       STR   'That is a perfect score!'
	FIN
L45E7       LDA   #^L45CE
            STA   L0CDE+2
            LDA   #L45CE
            STA   L0CDE
            JSR   L14A6
L45F6       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CCA
            JSR   L2DF6
            RTS

L460B       LDX   #$0000
L460E       LDA   L4A65,X
            STA   L4794,X
            INX
            INX
            CPX   #$0008
            BCC   L460E
            PEA   $0003
            _IntSource
            PHA
            PEA   $0064
            _GetSCB
            JSR   L10AC
            PLA
            AND   #$000F
            PHA
            LDA   #^L4A85
            PHA
            LDA   #L4A85
            PHA
            _GetColorTable
            JSR   L10AC
            PHA
            PEA   $0064
            _GetSCB
            JSR   L10AC
            PLA
            AND   #$000F
            PHA
            LDA   #^L4AA5
            PHA
            LDA   #L4AA5
            PHA
            _GetColorTable
            JSR   L10AC
            LDA   #^L46C8
            PHA
            LDA   #L46C8
            PHA
            _SetHeartBeat
            JSR   L10AC
            PEA   $0002
            _IntSource
            RTS

L468C       PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L4A85
            PHA
            LDA   #L4A85
            PHA
            _SetColorTable
            JSR   L10AC
            LDA   #^L46C8
            PHA
            LDA   #L46C8
            PHA
            _DelHeartBeat
            JSR   L10AC
            PEA   $0002
            _IntSource
            RTS

L46C8       ADRL  $00000000
L46CC       DW    $0001
            DW    $A55A
            PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L479C
L46D9       JSR   L471A
            INC   L479C
            INC   L479C
            LDA   L479C
            CMP   #$0008
            BCC   L46D9
            PHA
            PEA   $0064
            _GetSCB
            JSR   L10AC
            PLA
            AND   #$000F
            PHA
            LDA   #^L4AA5
            PHA
            LDA   #L4AA5
            PHA
            _SetColorTable
            JSR   L10AC
            LDA   #$0001
            STA   L46CC
            SEP   #$30
            PLA
            PLB
            RTL

            MX    %00
L471A       LDX   L479C
            DEC   L4794,X
            BEQ   L4723
            RTS

L4723       LDA   L4A65,X
            STA   L4794,X
            LDA   L4A6D,X
            STA   L4790
            LDA   L4A7D,X
            STA   L4792
L4735       LDA   L4792
            CMP   L4A75,X
            BCC   L4745
            BEQ   L4745
            LDA   L4A6D,X
            STA   L4792
L4745       LDY   L4790
            LDA   L4A85,Y
            LDY   L4792
            STA   L4AA5,Y
            INC   L4792
            INC   L4792
            INC   L4790
            INC   L4790
            LDA   L4790
            CMP   L4A75,X
            BCC   L4735
            BEQ   L4735
            LDA   L4A7D,X
            CLC
            ADC   L4A5D,X
            STA   L4A7D,X
            CMP   #$8000
            BCS   L477B
            CMP   L4A6D,X
            BCS   L4782
L477B       LDA   L4A75,X
            STA   L4A7D,X
            RTS

L4782       CMP   L4A75,X
            BCC   L478F
            BEQ   L478F
            LDA   L4A6D,X
            STA   L4A7D,X
L478F       RTS

L4790       DB    $00
            DB    $00
L4792       DB    $00
            DB    $00
L4794       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L479C       DB    $00
            DB    $00
L479E       PHA
            PEA   $0064
            _GetSCB
            JSR   L10AC
            PLA
            AND   #$000F
            STA   L490C
            LDA   L490C
            PHA
            LDA   #^L490E
            PHA
            LDA   #L490E
            PHA
            _GetColorTable
            JSR   L10AC
            PEA   $0001
            LDA   #^L490E
            PHA
            LDA   #L490E
            PHA
            _SetColorTable
            JSR   L10AC
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L0B95
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L10AC
            PLA
            STA   $00
            STA   L4AC5
            PLA
            STA   $02
            STA   L4AC5+2
            LDY   #$0000
            LDA   [$00],Y
            STA   L4AC9
            LDY   #$0002
            LDA   [$00],Y
            STA   L4AC9+2
            LDA   #^L4AD3
            STA   L0BA5+2
            LDA   #L4AD3
            STA   L0BA5
            LDA   #$000F
            STA   L0BA9
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            LDA   #$00E1
            STA   L0BA5+2
            LDA   #$9E00
            STA   L0BA5
            PHA
            PHA
            LDA   L4AE0
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L0BA9
            PLA
            STA   L0BA9+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            LDA   #^L4AE2
            STA   L0BA5+2
            LDA   #L4AE2
            STA   L0BA5
            LDA   #$0002
            STA   L0BA9
            LDA   #$0000
            STA   L0BA9+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            LDA   L4AC9
            STA   L0BA5
            LDA   L4AC9+2
            STA   L0BA5+2
            LDA   #$0320
            STA   L0BA9
            LDA   #$0000
            STA   L0BA9+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            LDA   L0CAC
            STA   L0B7D
            LDA   L0CAE
            STA   L0B7F
            JSR   L10DE
            LDA   L0B81
            STA   L0CB0
            LDA   L0B83
            STA   L0CB0+2
            LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HLock
            JSR   L10AC
            LDA   L0CB0
            STA   L0BA5
            LDA   L0CB0+2
            STA   L0BA5+2
            LDA   #$8000
            STA   L0BA9
            LDA   #$0000
            STA   L0BA9+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BA3
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0BB1
            RTS

L490C       DW    $0000
L490E       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L492E       _HideCursor
            LDA   #$00E1
            STA   L0BA5+2
            LDA   #$2000
            STA   L0BA5
            LDA   L0CB0
            STA   L4ACD
            LDA   L0CB0+2
            STA   L4ACF
            LDA   #$00C8
            STA   L0B91
            LDA   #$0000
            STA   L0CD2
L4959       LDA   #$0000
            STA   L4AD1
            LDA   #$00A0
            STA   L0CC8
L4965       PHA
            LDA   L4ACF
            PHA
            LDA   L4ACD
            PHA
            LDA   L4AC9
            STA   $00
            LDA   L4AC9+2
            STA   $02
            LDA   L0CD2
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L0BA5
            PHA
            LDA   #L0BA5
            PHA
            LDA   #^L0CC8
            PHA
            LDA   #L0CC8
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L4AD1
            STA   L4AD1
            LDA   L0CC8
            BNE   L4965
            LDA   L4ACD
            CLC
            ADC   L4AD1
            STA   L4ACD
            LDA   L4ACF
            ADC   #$0000
            STA   L4ACF
            LDA   L0CD2
            PHA
            PEA   $0000
            _SetSCB
            JSR   L10AC
            INC   L0CD2
            DEC   L0B91
            BEQ   L49D4
            JMP   L4959

L49D4       LDA   L4AC5+2
            PHA
            LDA   L4AC5
            PHA
            _DisposeHandle
            JSR   L10AC
            LDA   L4ACD
            CLC
            ADC   #$0009
            STA   L4ACD
            LDA   L4ACF
            ADC   #$0000
            STA   L4ACF
            LDX   #$0000
L49FC       LDA   L4ACD
            STA   $00
            LDA   L4ACF
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L4A13
            LDA   #$FFFE
            JMP   L4A16

L4A13       LDA   #$0002
L4A16       STA   L4A5D,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L4A6D,X
            STA   L4A7D,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L4A75,X
            LDA   L4ACD
            CLC
            ADC   #$0008
            STA   L4ACD
            INX
            INX
            CPX   #$0008
            BCS   L4A46
            JMP   L49FC

L4A46       LDA   L0CAE
            PHA
            LDA   L0CAC
            PHA
            _HUnlock
            JSR   L10AC
            RTS

            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4A5D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4A65       DB    $05
            DB    $00
L4A67       DB    $05
            DB    $00
L4A69       DB    $05
            DB    $00
L4A6B       DB    $05
            DB    $00
L4A6D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4A75       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4A7D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4A85       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L4AA5       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L4AC5       ADRL  $00000000
L4AC9       ADRL  $00000000
L4ACD       DB    $00
            DB    $00
L4ACF       DB    $00
            DB    $00
L4AD1       DB    $00
            DB    $00
L4AD3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4AE0       DB    $00
            DB    $00
L4AE2       DB    $00
            DB    $00
            JSR   L233E
            JSR   L11CE
            JSR   L492E
            JSR   L1D2C
            PEA   $0000
            _ClearScreen
            JSR   L11DD
            LDA   L0CB0
            STA   $00
            LDA   L0CB0+2
            STA   $02
            LDA   #$2000
            STA   $04
            LDA   #$00E1
            STA   $06
            LDA   #$5000
            STA   L4B41
            LDA   #$3E80
            STA   L0B8F
L4B1D       PEA   $0000
            _Random
            PLA
            LSR
            LSR
            LSR
            ASL
            ASL
            TAY
            LDA   [$00],Y
            STA   [$04],Y
            INY
            INY
            LDA   [$00],Y
            STA   [$04],Y
            DEC   L4B41
            BNE   L4B1D
            JSR   L1D75
            RTS

L4B41       DW    $0000
            JSR   L233E
            LDA   #$2000
            STA   $00
            LDA   #$00E1
            STA   $02
            LDA   #$4000
            STA   L4B8B
            LDA   #$3E80
            STA   L0B8F
L4B5C       PEA   $0000
            _Random
            PLA
            LSR
            LSR
            LSR
            ASL
            ASL
            CMP   #$7CFF
            BCS   L4B5C
            TAY
            LDA   #$0000
            STA   [$00],Y
            INY
            INY
            STA   [$00],Y
            DEC   L4B8B
            BNE   L4B5C
            PEA   $0000
            _ClearScreen
            RTS

L4B8B       DW    $0000

