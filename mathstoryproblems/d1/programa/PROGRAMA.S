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
            STA   L1A0F
            JSR   L1F28
            LDA   L1A0F
            AND   #$F0FF
            ORA   #$0100
            STA   L1A11
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L1A11
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1F28
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L1A13
            LDA   L1A13
            TAY
            CLC
            ADC   #$0100
            STA   L1A13
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L1A0F
            PHA
            _EMStartUp
            JSR   L1F28
            LDAL  $000029
            AND   #$FF00
            ORA   #$0001
            STAL  $E0C029
            LDY   L1A13
            TYA
            CLC
            ADC   #$0300
            STA   L1A13
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L1A0F
            PHA
            _QDStartUp
            JSR   L1F28
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
            JSR   L2147
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
            JSR   L1F28
            PLA
            STA   L1A01
            PLA
            STA   L1A03
            LDA   L1A03
            PHA
            LDA   L1A01
            PHA
            _GetClip
            JSR   L1F28
            PHA
            PHA
            _NewRgn
            JSR   L1F28
            PLA
            STA   L1D17
            PLA
            STA   L1D17+2
            LDA   L1D17+2
            PHA
            LDA   L1D17
            PHA
            _GetClip
            JSR   L1F28
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L1A11
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1F28
            PLA
            STA   L1B28
            PLA
            STA   L1B28+2
            LDA   #$8000
            STA   L1B3E
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L1A11
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1F28
            PLA
            STA   L1D51
            PLA
            STA   L1D51+2
            JSR   L31BA
            JMP   L01C8

L01B9       STR   'SUBA'
L01BE       DW    $0000       ;  ref num
            ADRL  L01B9       ;  path name
            ADRL  $00000000   ;  reserved
L01C8       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01BE
            JSR   L1F28
            LDA   L01BE
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
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
            JSR   L5CDC
            LDA   #$2000
            STA   L1B50
            JSR   L2EEE
            STZ   L1B4E
            JSR   L2093
L0224       JMP   L023A

L0227       STR   'submenua'
L0230       DW    $0000       ;  ref num
            ADRL  L0227       ;  path name
            ADRL  $00000000   ;  reserved
L023A       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0230
            JSR   L1F28
            LDA   L0230
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L0258

L0256       DW    $0000
L0258       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L0256
            ASL
            ASL
            ASL
            ASL
            ORA   L0256
            STA   L0256
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0256
            STAL  $E0C022
            JSR   L5CDC
            _InitCursor
            _ObscureCursor
            LDA   #^L1C80
            PHA
            LDA   #L1C80
            PHA
            LDA   #$0039
            PHA
            LDA   #$0043
            PHA
            LDA   #$00E2
            CLC
            ADC   #$0001
            PHA
            LDA   #$0053
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L1CDB
            LDA   #^L1C88
            PHA
            LDA   #L1C88
            PHA
            LDA   #$0039
            PHA
            LDA   #$0059
            PHA
            LDA   #$00E9
            CLC
            ADC   #$0001
            PHA
            LDA   #$0069
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0042
            STA   L1CDD
            LDA   #^L1C90
            PHA
            LDA   #L1C90
            PHA
            LDA   #$0039
            PHA
            LDA   #$006F
            PHA
            LDA   #$0115
            CLC
            ADC   #$0001
            PHA
            LDA   #$007F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0052
            STA   L1CDF
            LDA   #$0003
            STA   L1CD9
            JSR   L2EEE
            JSR   L21EB
            LDA   L1C43
            CMP   #$0052
            BNE   L0330
            JMP   L19A5

L0330       CMP   #$0041
            BNE   L0338
            JMP   L033B
L0338       JMP   L16A2
L033B       JMP   L034F

L033E       STR   'actor1'
L0345       DW    $0000       ;  ref num
            ADRL  L033E       ;  path name
            ADRL  $00000000   ;  reserved
L034F       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0345
            JSR   L1F28
            LDA   L0345
            STA   L1A1F
            STA   L1A2D
            JSR   L3243
            LDA   #^L311A
            PHA
            LDA   #L311A
            PHA
            LDA   #$0001
            PHA
            LDA   #$0001
            PHA
            LDA   #$0038
            CLC
            ADC   #$0001
            PHA
            LDA   #$002F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3122
            PHA
            LDA   #L3122
            PHA
            LDA   #$003A
            PHA
            LDA   #$0001
            PHA
            LDA   #$0071
            CLC
            ADC   #$0001
            PHA
            LDA   #$002F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L312A
            PHA
            LDA   #L312A
            PHA
            LDA   #$0073
            PHA
            LDA   #$0001
            PHA
            LDA   #$00AA
            CLC
            ADC   #$0001
            PHA
            LDA   #$002F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3132
            PHA
            LDA   #L3132
            PHA
            LDA   #$00AC
            PHA
            LDA   #$0001
            PHA
            LDA   #$00E3
            CLC
            ADC   #$0001
            PHA
            LDA   #$002F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L313A
            PHA
            LDA   #L313A
            PHA
            LDA   #$00E5
            PHA
            LDA   #$0001
            PHA
            LDA   #$011C
            CLC
            ADC   #$0001
            PHA
            LDA   #$002F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3142
            PHA
            LDA   #L3142
            PHA
            LDA   #$0001
            PHA
            LDA   #$0031
            PHA
            LDA   #$0038
            CLC
            ADC   #$0001
            PHA
            LDA   #$005F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L314A
            PHA
            LDA   #L314A
            PHA
            LDA   #$003A
            PHA
            LDA   #$0031
            PHA
            LDA   #$0071
            CLC
            ADC   #$0001
            PHA
            LDA   #$005F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3152
            PHA
            LDA   #L3152
            PHA
            LDA   #$0073
            PHA
            LDA   #$0031
            PHA
            LDA   #$00AA
            CLC
            ADC   #$0001
            PHA
            LDA   #$005F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L315A
            PHA
            LDA   #L315A
            PHA
            LDA   #$00AC
            PHA
            LDA   #$0031
            PHA
            LDA   #$00E3
            CLC
            ADC   #$0001
            PHA
            LDA   #$005F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3162
            PHA
            LDA   #L3162
            PHA
            LDA   #$00E5
            PHA
            LDA   #$0031
            PHA
            LDA   #$011C
            CLC
            ADC   #$0001
            PHA
            LDA   #$005F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L316A
            PHA
            LDA   #L316A
            PHA
            LDA   #$0001
            PHA
            LDA   #$0061
            PHA
            LDA   #$0038
            CLC
            ADC   #$0001
            PHA
            LDA   #$008F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3172
            PHA
            LDA   #L3172
            PHA
            LDA   #$003A
            PHA
            LDA   #$0061
            PHA
            LDA   #$0071
            CLC
            ADC   #$0001
            PHA
            LDA   #$008F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L317A
            PHA
            LDA   #L317A
            PHA
            LDA   #$0073
            PHA
            LDA   #$0061
            PHA
            LDA   #$00AA
            CLC
            ADC   #$0001
            PHA
            LDA   #$008F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3182
            PHA
            LDA   #L3182
            PHA
            LDA   #$00AC
            PHA
            LDA   #$0061
            PHA
            LDA   #$00E3
            CLC
            ADC   #$0001
            PHA
            LDA   #$008F
            ADC   #$0001
            PHA
            _SetRect
            JSR   L3C2E
            LDA   #$0005
            STA   L098E
            LDA   #$0000
            STA   L1BFC
            JSR   L31BA
L058E       LDA   #$0001
            STA   L1BFE
            LDA   #$000A
            STA   L1A0B
            JSR   L31E6
            CLC
            ADC   #$0001
            STA   L1E81
            JSR   L31E6
            CLC
            ADC   #$0001
            STA   L1E83
            LDA   L1E81
            CLC
            ADC   L1E83
            STA   L1BD0
            JSR   L3C1A
            BCC   L05C0
            JMP   L058E

L05C0       LDA   #$000E
            STA   L1A0B
            JSR   L31E6
            CLC
            ADC   #$0001
            STA   L3118
            STA   L1E7B
            LDA   L1E81
            JSR   L3AE3
            CLC
            LDA   #$004A
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$004B
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$000F
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
L060A       LDA   #$000E
            STA   L1A0B
            JSR   L31E6
            CLC
            ADC   #$0001
            CMP   L3118
            BEQ   L060A
            STA   L3118
            STA   L1E7D
            LDA   L1E83
            JSR   L3B4B
L0628       LDA   #$000B
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L1B56
            LDA   #$009F
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            JMP   L0660

	DO	VF
*L0648       STR   'Additionne le nombre de '
L0648       STR   'Additionne le nombre '
	ELSE
*L0648       STR   '     Add the number of '
L0648       STR   '     Add the number '
	FIN
L0660       LDA   #^L0648
            STA   L1B5A+2
            LDA   #L0648
            STA   L1B5A
            JSR   L22E9
            LDA   L1E7B
            JSR   L3C03
            JMP   L0687

	DO	VF
L0678       STR   '  au nombre '
	ELSE
L0678       STR   '  to the number '
	FIN
L0687       LDA   #^L0678
            STA   L1B5A+2
            LDA   #L0678
            STA   L1B5A
*            JSR   L2312
            JSR   L22E9
            JMP   L069D

*L0699       STR   'of '
L069D
*            LDA   #^L0699
*            STA   L1B5A+2
*            LDA   #L0699
*            STA   L1B5A
*            JSR   L22E9
            LDA   L1E7D
            JSR   L3C03
            JMP   L06B7

L06B5       STR   '.'
L06B7       LDA   #^L06B5
            STA   L1B5A+2
            LDA   #L06B5
            STA   L1B5A
            JSR   L2312
            LDA   #$00B4
            STA   L1B58
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L0704

	DO	VF
L06DA       STR   '    Saisis ta r'8e'ponse puis appuie sur ENTREE.'
	ELSE
L06DA       STR   '     Type your answer, then press RETURN.'
	FIN
L0704       LDA   #^L06DA
            STA   L1B5A+2
            LDA   #L06DA
            STA   L1B5A
            JSR   L22E9
            CLC
            LDA   #$00B7
            STA   L1C60
            LDA   #$0090
            STA   L1C62
            LDA   #$00C7
            ADC   #$0001
            STA   L1C5E
            LDA   #$00A9
            ADC   #$0001
            STA   L1C64
            LDA   #$0007
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$00B9
            STA   L1C60
            LDA   #$0093
            STA   L1C62
            LDA   #$00C5
            ADC   #$0001
            STA   L1C5E
            LDA   #$00A6
            ADC   #$0001
            STA   L1C64
            LDA   #$0002
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDA   #$0095
            STA   L1B56
            LDA   #$00C3
            STA   L1B58
            LDA   #$0002
            STA   L1B6C
            LDA   #$000F
            STA   L1BCC
            LDA   #$0002
            STA   L1BCA
            JSR   L2346
            JSR   L240E
            LDA   L1BCE
            CMP   L1BD0
            BEQ   L07A4
            JMP   L081A

L07A4       JSR   L32B1
            JMP   L07BB

L07AA       STR   'ACTOR1'
L07B1       DW    $0000       ;  ref num
            ADRL  L07AA       ;  path name
            ADRL  $00000000   ;  reserved
L07BB       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L07B1
            JSR   L1F28
            LDA   L07B1
            STA   L1A1F
            STA   L1A2D
            JSR   L3243
            LDA   L1BFC
            CLC
            ADC   L1BFE
            STA   L1BFC
L07DE       DEC   L098E
            BEQ   L0817
            JMP   L07E8

L07E6       DW    $0000
L07E8       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L07E6
            ASL
            ASL
            ASL
            ASL
            ORA   L07E6
            STA   L07E6
            LDAL  $E0C022
            AND   #$FF00
            ORA   L07E6
            STAL  $E0C022
            JMP   L058E
L0817       JMP   L0990

L081A       CLC
            LDA   #$0097
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$00C7
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0000
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDA   #$00A4
            STA   L1B58
            LDA   #$000E
            STA   L1B5E
            JMP   L086F

	DO	VF
L085A       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L085A       STR   'That is not correct.'
	FIN
L086F       LDA   #^L085A
            STA   L1B5A+2
            LDA   #L085A
            STA   L1B5A
            JSR   L2322
            LDA   L1BFE
            BNE   L0886
            JMP   L08E4
L0886       JMP   L089B

	DO	VF
L0889       STR   'Essaye encore.'
	ELSE
L0889       STR   'Please try again.'
	FIN
L089B       LDA   #^L0889
            STA   L1B5A+2
            LDA   #L0889
            STA   L1B5A
            JSR   L2322
            DEC   L1BFE
            JSR   L3C3F
            CLC
            LDA   #$0097
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$00C7
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0000
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            JMP   L0628

L08E4       LDA   L1BD0
            JSR   L3CEC
            JMP   L0904

	DO	VF
L08ED       STR   'La bonne r'8e'ponse est '
	ELSE
L08ED       STR   'The correct answer is '
	FIN
L0904       LDA   #^L08ED
            STA   L1B5A+2
            LDA   #L08ED
            STA   L1B5A
            LDA   L1B5A
            STA   L1B60
            LDA   L1B5A+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B9C
            STA   L1B68
            LDA   L1B9C+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L093C

L093A       STR   '.'
L093C       LDA   #^L093A
            STA   L1B5A+2
            LDA   #L093A
            STA   L1B5A
            LDA   L1B9C
            STA   L1B60
            LDA   L1B9C+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B9C
            STA   L1B68
            LDA   L1B9C+2
            STA   L1B6A
            JSR   L2EFE
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L2322
            JSR   L3C3F
            PEA   $0000
            _ClearScreen
            JMP   L07DE

L098E       DW    $0000
L0990       JSR   L5352
            JMP   L0998

L0996       DW    $0000
L0998       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0996
            ASL
            ASL
            ASL
            ASL
            ORA   L0996
            STA   L0996
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0996
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $2222
            _ClearScreen
            JSR   L2059
            LDA   #$000E
            PHA
            _SetForeColor
            LDA   #$0034
            STA   L1B58
            LDA   #$0006
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            JMP   L0A1E

	DO	VF
L09F7       STR   '    Les mots "ensemble," "en tout,"'
	ELSE
L09F7       STR   '     The words "altogether," "in all,"'
	FIN
L0A1E       LDA   #^L09F7
            STA   L1B5A+2
            LDA   #L09F7
            STA   L1B5A
            JSR   L22E9
            JMP   L0A5B

	DO	VF
L0A30       STR   '"total," "somme," and "ensemble" nous indiquent'
	ELSE
L0A30       STR   '"total," "sum," and "both" tell us that we'
	FIN
L0A5B       LDA   #^L0A30
            STA   L1B5A+2
            LDA   #L0A30
            STA   L1B5A
            JSR   L22E9
            JMP   L0A82

	DO	VF
L0A6D       STR   'qu'27'il faut probablement additionner.'
	ELSE
L0A6D       STR   'are supposed to add.'
	FIN
L0A82       LDA   #^L0A6D
            STA   L1B5A+2
            LDA   #L0A6D
            STA   L1B5A
            JSR   L22E9
            LDA   #$000A
            PHA
            _SetForeColor
            LDA   #$0058
            STA   L1B58
            JMP   L0AD2

	DO	VF
L0AA5       STR   '    In fran'8d'ais, vous lisez des phrases,'
	ELSE
L0AA5       STR   '     In English, you read sentences, but did'
	FIN
L0AD2       LDA   #^L0AA5
            STA   L1B5A+2
            LDA   #L0AA5
            STA   L1B5A
            JSR   L22E9
            JMP   L0B0F

	DO	VF
L0AE4       STR   'savez-vous qu'27'il en existe en maths aussi ?'
	ELSE
L0AE4       STR   'you know there are sentences in math, too?'
	FIN
L0B0F       LDA   #^L0AE4
            STA   L1B5A+2
            LDA   #L0AE4
            STA   L1B5A
            JSR   L22E9
            JMP   L0B4C

	DO	VF
L0B21       STR   'Elles sont appel'8e'es "'8e'nonc'8e's" et elles'
	ELSE
L0B21       STR   'They are called number sentences, and they'
	FIN
L0B4C       LDA   #^L0B21
            STA   L1B5A+2
            LDA   #L0B21
            STA   L1B5A
            JSR   L22E9
            JMP   L0B6E

	DO	VF
L0B5E       STR   'ressemblent '88' ceci :'
	ELSE
L0B5E       STR   'look like this:'
	FIN
L0B6E       LDA   #^L0B5E
            STA   L1B5A+2
            LDA   #L0B5E
            STA   L1B5A
            JSR   L22E9
            LDA   #$0078
            STA   L1B52
            LDA   #$009E
            STA   L1B54
            JSR   L3D28
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            PEA   $2222
            _ClearScreen
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$0013
            STA   L1B56
            LDA   #$002B
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            JMP   L0BF4

	DO	VF
L0BCA       STR   '    Voici un exemple d'27'utilisation d'27
	ELSE
L0BCA       STR   '     Here is an example of using a number'
	FIN
L0BF4       LDA   #^L0BCA
            STA   L1B5A+2
            LDA   #L0BCA
            STA   L1B5A
            JSR   L22E9
            JMP   L0C10

	DO	VF
L0C06       STR   'un '8e'nonc'8e' math'8e'matique :'
	ELSE
L0C06       STR   'sentence:'
	FIN
L0C10       LDA   #^L0C06
            STA   L1B5A+2
            LDA   #L0C06
            STA   L1B5A
            JSR   L22E9
            LDA   #$000E
            PHA
            _SetForeColor
            LDA   #$0009
            STA   L1B56
            LDA   #$005C
            STA   L1B58
            JMP   L0C66

	DO	VF
L0C39       STR   '    Marie a trois cookies. Elle en ach'8f'te'
	ELSE
L0C39       STR   '     Mary had three cookies.  She bought two'
	FIN
L0C66       LDA   #^L0C39
            STA   L1B5A+2
            LDA   #L0C39
            STA   L1B5A
            JSR   L22E9
            JMP   L0CA1

	DO	VF
L0C78       STR   'deux de plus. Combien cela fait en tout ?'
	ELSE
L0C78       STR   'more.  How many did she have altogether?'
	FIN
L0CA1       LDA   #^L0C78
            STA   L1B5A+2
            LDA   #L0C78
            STA   L1B5A
            JSR   L22E9
            LDA   #$0003
            STA   L1E81
            LDA   #$0002
            STA   L1E83
            LDA   #$0005
            STA   L1BD0
            LDA   #$0076
            STA   L1B52
            LDA   #$0098
            STA   L1B54
            JSR   L3D28
            JSR   L2AEF
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JSR   L2B3F
            LDA   #$000D
            PHA
            _SetForeColor
            JSR   L3E0B
            JSR   L2AEF
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JSR   L2B3F
            LDA   #$000D
            PHA
            _SetForeColor
            JSR   L3E1A
            JSR   L2AEF
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JSR   L2B3F
            LDA   #$000D
            PHA
            _SetForeColor
            JSR   L3E2D
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            LDA   #$0005
            STA   L098E
            JSR   L3C2E
            STZ   L1BFC
            PEA   $2222
            _ClearScreen
L0D61       LDA   #$0005
            STA   L1A0B
            JSR   L31E6
            STA   L1E7F
            STA   L1BD0
            JSR   L3C1A
            BCS   L0D61
            LDA   #$0001
            STA   L1BFE
L0D7B       LDA   L1E7F
            STA   L1BD0
            JSR   L3E53
            LDA   #$000D
            STA   L1BCC
            LDA   #$0002
            STA   L1BCA
            JSR   L4F6C
            JSR   L5030
            JSR   L50F9
            JSR   L51B8
            BCS   L0DA1
            JMP   L0E57

L0DA1       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$009D
            STA   L1B58
            JMP   L0DCA

	DO	VF
L0DB5       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L0DB5       STR   'That is not correct.'
	FIN
L0DCA       LDA   #^L0DB5
            STA   L1B5A+2
            LDA   #L0DB5
            STA   L1B5A
            JSR   L2322
            LDA   #$00AF
            STA   L1B58
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   L1BFE
            CMP   #$0001
            BCS   L0DF5
            JMP   L0E3D

L0DF5       DEC   L1BFE
            JMP   L0E0D

	DO	VF
L0DFB       STR   'Essaye encore.'
	ELSE
L0DFB       STR   'Please try again.'
	FIN
L0E0D       LDA   #^L0DFB
            STA   L1B5A+2
            LDA   #L0DFB
            STA   L1B5A
            JSR   L2322
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            PEA   $2222
            _ClearScreen
            JMP   L0D7B

L0E3D       JSR   L51ED
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JMP   L0E64

L0E57       JSR   L32B1
            LDA   L1BFC
            CLC
            ADC   L1BFE
            STA   L1BFC
L0E64       DEC   L098E
            BNE   L0E6C
            JMP   L0EB3
L0E6C       JMP   L0E71

L0E6F       DW    $0000
L0E71       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0E6F
            ASL
            ASL
            ASL
            ASL
            ORA   L0E6F
            STA   L0E6F
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0E6F
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $2222
            _ClearScreen
            JSR   L2059
            JMP   L0D61

L0EB3       JSR   L5352
            JMP   L0EBB

L0EB9       DW    $0000
L0EBB       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0EB9
            ASL
            ASL
            ASL
            ASL
            ORA   L0EB9
            STA   L0EB9
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0EB9
            STAL  $E0C022
            PEA   $2222
            _ClearScreen
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$005A
            STA   L1B58
            LDA   #$000E
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            JMP   L0F3C

	DO	VF
L0F11       STR   '    Nous allons maintenant utiliser le'
	ELSE
L0F11       STR   '     Now we'27'll try some problems using the'
	FIN
L0F3C       LDA   #^L0F11
            STA   L1B5A+2
            LDA   #L0F11
            STA   L1B5A
            JSR   L22E9
            JMP   L0F5B

	DO	VF
L0F4E       STR   'mot "ensemble."'
	ELSE
L0F4E       STR   'word "both."'
	FIN
L0F5B       LDA   #^L0F4E
            STA   L1B5A+2
            LDA   #L0F4E
            STA   L1B5A
            JSR   L22E9
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JMP   L0F83

L0F81       DW    $0000
L0F83       LDA   #$0003
            STA   L0F81
            JSR   L3C2E
            STZ   L1BFC
            PEA   $2222
            _ClearScreen
L0F99       LDA   #$0003
            STA   L1A0B
            JSR   L31E6
            STA   L1E7F
            STA   L1BD0
            JSR   L3C1A
            BCS   L0F99
            LDA   #$0001
            STA   L1BFE
L0FB3       LDA   L1E7F
            STA   L1BD0
            JSR   L4218
            LDA   #$000D
            STA   L1BCC
            LDA   #$0002
            STA   L1BCA
            JSR   L4F6C
            JSR   L5030
            JSR   L50F9
            JSR   L51B8
            BCS   L0FD9
            JMP   L108F

L0FD9       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$009D
            STA   L1B58
            JMP   L1002

	DO	VF
L0FED       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L0FED       STR   'That is not correct.'
	FIN
L1002       LDA   #^L0FED
            STA   L1B5A+2
            LDA   #L0FED
            STA   L1B5A
            JSR   L2322
            LDA   #$00AF
            STA   L1B58
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   L1BFE
            CMP   #$0001
            BCS   L102D
            JMP   L1075

L102D       DEC   L1BFE
            JMP   L1045

	DO	VF
L1033       STR   'Essaye encore.'
	ELSE
L1033       STR   'Please try again.'
	FIN
L1045       LDA   #^L1033
            STA   L1B5A+2
            LDA   #L1033
            STA   L1B5A
            JSR   L2322
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            PEA   $2222
            _ClearScreen
            JMP   L0FB3

L1075       JSR   L51ED
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JMP   L109C

L108F       JSR   L32B1
            LDA   L1BFC
            CLC
            ADC   L1BFE
            STA   L1BFC
L109C       DEC   L0F81
            BNE   L10A4
            JMP   L10EB
L10A4       JMP   L10A9

L10A7       DW    $0000
L10A9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L10A7
            ASL
            ASL
            ASL
            ASL
            ORA   L10A7
            STA   L10A7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L10A7
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $2222
            _ClearScreen
            JSR   L2059
            JMP   L0F99

L10EB       JSR   L5522
            JMP   L10F3

L10F1       DW    $0000
L10F3       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L10F1
            ASL
            ASL
            ASL
            ASL
            ORA   L10F1
            STA   L10F1
            LDAL  $E0C022
            AND   #$FF00
            ORA   L10F1
            STAL  $E0C022
            PEA   $2222
            _ClearScreen
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$0022
            STA   L1B58
            LDA   #$0009
            STA   L1B56
            STA   L1B5E
            JMP   L1171

	DO	VF
L1146       STR   '    Avec ces probl'8f'mes, tu vas ajouter'
	ELSE
L1146       STR   '     In these problems, you will be adding'
	FIN
L1171       LDA   #^L1146
            STA   L1B5A+2
            LDA   #L1146
            STA   L1B5A
            JSR   L22E9
            JMP   L11AD

	DO	VF
L1183       STR   'plus de deux nombres. Ecris les nombres'
	ELSE
L1183       STR   'more than two numbers.  Write the numbers'
	FIN
L11AD       LDA   #^L1183
            STA   L1B5A+2
            LDA   #L1183
            STA   L1B5A
            JSR   L22E9
            JMP   L11EA

	DO	VF
L11BF       STR   'sur une feuille de papier, puis ajoute-les'
	ELSE
L11BF       STR   'down on a piece of paper, then add them to'
	FIN
L11EA       LDA   #^L11BF
            STA   L1B5A+2
            LDA   #L11BF
            STA   L1B5A
            JSR   L22E9
            JMP   L120B

	DO	VF
L11FC       STR   'pour obtenir le total.'
	ELSE
L11FC       STR   'get the total.'
	FIN
L120B       LDA   #^L11FC
            STA   L1B5A+2
            LDA   #L11FC
            STA   L1B5A
            JSR   L22E9
            LDA   L1B58
            CLC
            ADC   L1B5E
            STA   L1B58
            LDA   #$000E
            PHA
            _SetForeColor
            JMP   L124A

	DO	VF
L1232       STR   '     Voici un exemple :'
	ELSE
L1232       STR   '     Here'27's an example:'
	FIN
L124A       LDA   #^L1232
            STA   L1B5A+2
            LDA   #L1232
            STA   L1B5A
            JSR   L22E9
            LDA   L1B58
            CLC
            ADC   L1B5E
            STA   L1B58
            LDA   #$0001
            PHA
            _SetForeColor
            JMP   L129F

	DO	VF
L1271       STR   '    Jean a achet'8e' quatre g'89'teaux. Puis trois'
	ELSE
L1271       STR   '     John bought four cakes.  He bought three'
	FIN
L129F       LDA   #^L1271
            STA   L1B5A+2
            LDA   #L1271
            STA   L1B5A
            JSR   L22E9
            JMP   L12DC

	DO	VF
L12B1       STR   'de plus. Enfin, il en prend encore neuf.'
	ELSE
L12B1       STR   'more.  Then he bought nine more.  How many'
	FIN
L12DC       LDA   #^L12B1
            STA   L1B5A+2
            LDA   #L12B1
            STA   L1B5A
            JSR   L22E9
            JMP   L1303

	DO	VF
L12EE       STR   'Combien Jean en a-t-il achet'8e' en tout ?'
	ELSE
L12EE       STR   'did John buy in all?'
	FIN
L1303       LDA   #^L12EE
            STA   L1B5A+2
            LDA   #L12EE
            STA   L1B5A
            JSR   L22E9
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   #$0086
            STA   L1B58
            LDA   #$009B
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            JMP   L1334

L1332       STR   '4'
L1334       LDA   #^L1332
            STA   L1B5A+2
            LDA   #L1332
            STA   L1B5A
            JSR   L22E9
            JMP   L1348

L1346       STR   '3'
L1348       LDA   #^L1346
            STA   L1B5A+2
            LDA   #L1346
            STA   L1B5A
            JSR   L22E9
            LDA   #$0093
            STA   L1B56
            JMP   L1363

L1360       STR   '+9'
L1363       LDA   #^L1360
            STA   L1B5A+2
            LDA   #L1360
            STA   L1B5A
            JSR   L22E9
            CLC
            LDA   #$009A
            STA   L1C60
            LDA   #$0094
            STA   L1C62
            LDA   #$009B
            ADC   #$0001
            STA   L1C5E
            LDA   #$00A1
            ADC   #$0001
            STA   L1C64
            LDA   #$0009
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            JMP   L13A9

L13A6       STR   '16'
L13A9       PEA   $0093
            PEA   $00A5
            _MoveTo
            LDA   #^L13A6
            PHA
            LDA   #L13A6
            PHA
            _DrawString
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            PEA   $2222
            _ClearScreen
            JMP   L13E8

L13E6       DW    $0000
L13E8       LDA   #$0003
            STA   L13E6
            JSR   L3C2E
            STZ   L1BFC
            PEA   $2222
            _ClearScreen
L13FE       LDA   #$0003
            STA   L1A0B
            JSR   L31E6
            STA   L1E7F
            STA   L1BD0
            JSR   L3C1A
            BCS   L13FE
            LDA   #$0001
            STA   L1BFE
L1418       LDA   L1E7F
            STA   L1BD0
            JSR   L4445
            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0013
            STA   L1B56
            LDA   #$0094
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            JMP   L146A

	DO	VF
L1441       STR   '    Saisis ta r'8e'ponse puis appuie sur'
	ELSE
L1441       STR   '     Please type your answer, then press'
	FIN
L146A       LDA   #^L1441
            STA   L1B5A+2
            LDA   #L1441
            STA   L1B5A
            JSR   L22E9
            JMP   L1484

	DO	VF
L147C       STR   'ENTREE.'
	ELSE
L147C       STR   'RETURN.'
	FIN
L1484       LDA   #^L147C
            STA   L1B5A+2
            LDA   #L147C
            STA   L1B5A
            JSR   L22E9
            LDA   #$000F
            STA   L1BCC
            LDA   #$0008
            STA   L1BCA
            LDA   #$0097
            STA   L1B56
            LDA   #$0061
            STA   L1B58
            LDA   #$0002
            STA   L1B6C
            JSR   L2346
            CLC
            LDA   #$0089
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$00A1
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0002
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            JSR   L240E
            LDA   L1BCE
            CMP   L1BD0
            BNE   L14F3
            JMP   L1640

L14F3       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$0088
            STA   L1B58
            JMP   L151C

	DO	VF
L1507       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L1507       STR   'That is not correct.'
	FIN
L151C       LDA   #^L1507
            STA   L1B5A+2
            LDA   #L1507
            STA   L1B5A
            JSR   L2322
            LDA   #$00A0
            STA   L1B58
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   L1BFE
            CMP   #$0001
            BCS   L1547
            JMP   L158F

L1547       DEC   L1BFE
            JMP   L155F

	DO	VF
L154D       STR   'Essaye encore.'
	ELSE
L154D       STR   'Please try again.'
	FIN
L155F       LDA   #^L154D
            STA   L1B5A+2
            LDA   #L154D
            STA   L1B5A
            JSR   L2322
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            PEA   $2222
            _ClearScreen
            JMP   L1418

L158F       LDA   L1BD0
            JSR   L3CEC
            JMP   L15AF

	DO	VF
L1598       STR   'La bonne r'8e'ponse est '
	ELSE
L1598       STR   'The correct answer is '
	FIN
L15AF       LDA   #^L1598
            STA   L1B5A+2
            LDA   #L1598
            STA   L1B5A
            LDA   L1B5A
            STA   L1B60
            LDA   L1B5A+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L15E7

L15E5       STR   '.'
L15E7       LDA   #^L15E5
            STA   L1B5A+2
            LDA   #L15E5
            STA   L1B5A
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            LDA   #^L1B72
            STA   L1B5A+2
            LDA   #L1B72
            STA   L1B5A
            JSR   L2322
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JMP   L164D

L1640       JSR   L32B1
            LDA   L1BFC
            CLC
            ADC   L1BFE
            STA   L1BFC
L164D       DEC   L13E6
            BNE   L1655
            JMP   L169C
L1655       JMP   L165A

L1658       DW    $0000
L165A       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L1658
            ASL
            ASL
            ASL
            ASL
            ORA   L1658
            STA   L1658
            LDAL  $E0C022
            AND   #$FF00
            ORA   L1658
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $2222
            _ClearScreen
            JSR   L2059
            JMP   L13FE

L169C       JSR   L5522
            JMP   L0224
L16A2       JMP   L16A7

L16A5       DW    $0000
L16A7       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L16A5
            ASL
            ASL
            ASL
            ASL
            ORA   L16A5
            STA   L16A5
            LDAL  $E0C022
            AND   #$FF00
            ORA   L16A5
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $2222
            _ClearScreen
            JSR   L2059
            JMP   L16EB

L16E9       DW    $0000
L16EB       LDA   #$000A
            STA   L16E9
            JSR   L3C2E
            STZ   L1BFC
            PEA   $2222
            _ClearScreen
L1701       LDA   #$000A
            STA   L1A0B
            JSR   L31E6
            STA   L1E7F
            STA   L1BD0
            JSR   L3C1A
            BCS   L1701
            LDA   #$0001
            STA   L1BFE
L171B       LDA   L1E7F
            STA   L1BD0
            JSR   L471E
            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0013
            STA   L1B56
            LDA   #$0094
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            JMP   L176D

	DO	VF
L1744       STR   '    Saisis ta r'8e'ponse puis appuie sur'
	ELSE
L1744       STR   '     Please type your answer, then press'
	FIN
L176D       LDA   #^L1744
            STA   L1B5A+2
            LDA   #L1744
            STA   L1B5A
            JSR   L22E9
            JMP   L1787

	DO	VF
L177F       STR   'ENTREE.'
	ELSE
L177F       STR   'RETURN.'
	FIN
L1787       LDA   #^L177F
            STA   L1B5A+2
            LDA   #L177F
            STA   L1B5A
            JSR   L22E9
            LDA   #$000F
            STA   L1BCC
            LDA   #$0008
            STA   L1BCA
            LDA   #$0093
            STA   L1B56
            LDA   #$0061
            STA   L1B58
            LDA   #$0003
            STA   L1B6C
            JSR   L2346
            CLC
            LDA   #$0089
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$00A1
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0002
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            JSR   L240E
            LDA   L1BCE
            CMP   L1BD0
            BNE   L17F6
            JMP   L1943

L17F6       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$0088
            STA   L1B58
            JMP   L181F

	DO	VF
L180A       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L180A       STR   'That is not correct.'
	FIN
L181F       LDA   #^L180A
            STA   L1B5A+2
            LDA   #L180A
            STA   L1B5A
            JSR   L2322
            LDA   #$00A0
            STA   L1B58
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   L1BFE
            CMP   #$0001
            BCS   L184A
            JMP   L1892

L184A       DEC   L1BFE
            JMP   L1862

	DO	VF
L1850       STR   'Essaye encore.'
	ELSE
L1850       STR   'Please try again.'
	FIN
L1862       LDA   #^L1850
            STA   L1B5A+2
            LDA   #L1850
            STA   L1B5A
            JSR   L2322
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            PEA   $2222
            _ClearScreen
            JMP   L171B

L1892       LDA   L1BD0
            JSR   L3CEC
            JMP   L18B2

	DO	VF
L189B       STR   'La bonne r'8e'ponse est '
	ELSE
L189B       STR   'The correct answer is '
	FIN
L18B2       LDA   #^L189B
            STA   L1B5A+2
            LDA   #L189B
            STA   L1B5A
            LDA   L1B5A
            STA   L1B60
            LDA   L1B5A+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L18EA

L18E8       STR   '.'
L18EA       LDA   #^L18E8
            STA   L1B5A+2
            LDA   #L18E8
            STA   L1B5A
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            LDA   #^L1B72
            STA   L1B5A+2
            LDA   #L1B72
            STA   L1B5A
            JSR   L2322
            LDA   #$0004
            STA   L1B46
            LDA   #$000C
            PHA
            _SetForeColor
            JSR   L3C50
            JMP   L1950

L1943       JSR   L32B1
            LDA   L1BFC
            CLC
            ADC   L1BFE
            STA   L1BFC
L1950       DEC   L16E9
            BNE   L1958
            JMP   L199F
L1958       JMP   L195D

L195B       DW    $0000
L195D       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L195B
            ASL
            ASL
            ASL
            ASL
            ORA   L195B
            STA   L195B
            LDAL  $E0C022
            AND   #$FF00
            ORA   L195B
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $2222
            _ClearScreen
            JSR   L2059
            JMP   L1701

L199F       JSR   L56F2
            JMP   L0224

L19A5       JSR   L2A4C
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L1F1A
            DB    $00
            DB    $00
            ADRL  L19B8
L19B8       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L19F9       ADRL  $00000000
L19FD       DB    $00
            DB    $00
L19FF       DB    $00
            DB    $00
L1A01       DB    $00
            DB    $00
L1A03       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1A0B       DB    $00
            DB    $00
L1A0D       DB    $00
            DB    $00
L1A0F       DB    $00
            DB    $00
L1A11       DB    $00
            DB    $00
L1A13       DB    $00
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
L1A1F       DW    $0000       ;  ref num
L1A21       ADRL  $00000000   ;  buffer ptr
L1A25       ADRL  $00000000   ;  request count
L1A29       ADRL  $00000000   ;  transfer count
L1A2D       DW    $0000       ;  ref num
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
            ADRL  L1AA1
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
            ADRL  L1AA1
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1A5B       DW    $0000       ;  ref num
L1A5D       ADRL  $00000000   ;  buffer ptr
L1A61       ADRL  $00000000   ;  request count
L1A65       ADRL  $00000000   ;  transfer count
L1A69       DW    $0000       ;  ref num
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
L1A7D       DW    $0000       ;  ref num
            ADRL  $00000000   ;  buffer ptr
L1A83       ADRL  $00000000   ;  request count
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
L1AA1       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1B28       ADRL  $00000000
L1B2C       DB    $00
            DB    $00
L1B2E       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1B38       DB    $00
            DB    $00
            DB    $00
            DB    $00
L1B3C       DB    $00
            DB    $00
L1B3E       DB    $00
            DB    $00
L1B40       DB    $00
            DB    $00
L1B42       DB    $00
            DB    $00
L1B44       DB    $00
            DB    $00
L1B46       DB    $00
            DB    $00
L1B48       DB    $00
            DB    $00
L1B4A       DB    $00
            DB    $00
L1B4C       DB    $00
            DB    $00
L1B4E       DB    $00
            DB    $00
L1B50       DB    $00
            DB    $00
L1B52       DB    $00
            DB    $00
L1B54       DB    $00
            DB    $00
L1B56       DW    $0000
L1B58       DW    $0000
L1B5A       ADRL  $00000000
L1B5E       DB    $09
            DB    $00
L1B60       DB    $00
            DB    $00
L1B62       DB    $00
            DB    $00
L1B64       DB    $00
            DB    $00
L1B66       DB    $00
            DB    $00
L1B68       DB    $00
            DB    $00
L1B6A       DB    $00
            DB    $00
L1B6C       DB    $02
            DB    $00
L1B6E       ADRL  L1B72
L1B72       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1B9C       ADRL  L1BA0
L1BA0       DB    $00
L1BA1       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1BCA       DB    $00
            DB    $00
L1BCC       DB    $0F
            DB    $00
L1BCE       DB    $00
            DB    $00
L1BD0       DB    $00
            DB    $00
L1BD2       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1BFC       DB    $00
            DB    $00
L1BFE       DB    $00
            DB    $00
L1C00       DB    $00
            DB    $00
L1C02       DB    $00
            DB    $00
L1C04       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            ADRL  L1C11
            DB    $FF
L1C11       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C23       DB    $00
            DB    $00
L1C25       DB    $00
            DB    $00
L1C27       DW    $0000       ; event code
L1C29       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L1C31       DW    $0000       ; mouse location
L1C33       DW    $0000
            DW    $0000       ; modifiers
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L1C3F       DB    $00
            DB    $00
L1C41       DB    $00
            DB    $00
L1C43       DB    $00
            DB    $00
L1C45       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C4E       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C56       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C5E       DB    $00
            DB    $00
L1C60       DB    $00
            DB    $00
L1C62       DB    $00
            DB    $00
L1C64       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C78       DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C7C       DB    $00
            DB    $00
L1C7E       DB    $00
            DB    $00
L1C80       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C88       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C90       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1CD0       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1CD9       DB    $00
            DB    $00
L1CDB       DB    $00
            DB    $00
L1CDD       DB    $00
            DB    $00
L1CDF       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1CEF       ADRL  L1D31       ; ptr to source locinfo
            ADRL  L1D41       ; ptr to dest locinfo
            ADRL  L1D69       ; ptr to source rect
            ADRL  L1D65       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1D05       ADRL  L1D41       ; ptr to source locinfo
            ADRL  L1D31       ; ptr to dest locinfo
            ADRL  L1D69       ; ptr to source rect
            ADRL  L1D65       ; ptr to dest point
            DW    $0002       ; mode
L1D17       ADRL  $00000000   ; clip rgn handle
            ADRL  L1D31       ; ptr to source locinfo
            ADRL  L1D55       ; ptr to dest locinfo
            ADRL  L1D75       ; ptr to source rect
            ADRL  L1D71       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1D31       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L1D41       DW    $0000       ; SCB byte
L1D43       ADRL  $00000000   ; Pointer to pixel image
L1D47       DW    $0010       ; Width
L1D49       DW    $0000       ; Bounds rect
L1D4B       DW    $0000
L1D4D       DW    $0014
L1D4F       DW    $0014
L1D51       ADRL  $00000000
L1D55       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L1D65       DW    $0000
L1D67       DW    $0000
L1D69       DW    $0000
L1D6B       DW    $0000
L1D6D       DW    $0014
L1D6F       DW    $0014
L1D71       DW    $0000
            DW    $0000
L1D75       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L1D7D       ADRL  L1D41       ; ptr to source locinfo
            ADRL  L1D31       ; ptr to dest locinfo
            ADRL  L1DA9       ; ptr to source rect
            ADRL  L1DB1       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L1D55       ; ptr to source locinfo
            ADRL  L1D31       ; ptr to dest locinfo
            ADRL  L1DB5       ; ptr to source rect
            ADRL  L1DBD       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1DA9       DW    $0000
L1DAB       DW    $0000
L1DAD       DW    $0014
L1DAF       DW    $0014
L1DB1       DW    $0000
            DW    $0000
L1DB5       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L1DBD       DW    $0000
            DW    $0000
L1DC1       ADRL  L1D31       ; ptr to source locinfo
            ADRL  L1DD7       ; ptr to dest locinfo
            ADRL  L1DE7       ; ptr to source rect
            ADRL  L1DEF       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1DD7       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L1DE7       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L1DEF       DW    $0000
            DW    $0000
L1DF3       ADRL  L1DD7       ; ptr to source locinfo
            ADRL  L1D31       ; ptr to dest locinfo
            ADRL  L1E09       ; ptr to source rect
            ADRL  L1E11       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1E09       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L1E11       DW    $0000
            DW    $0000
L1E15       DB    $00
            DB    $00
L1E17       DB    $00
            DB    $00
L1E19       DB    $00
            DB    $00
L1E1B       HEX   7200000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L1E3B       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L1E5B       HEX   0000CD0009002D0D720055052F02AF06
            HEX   5008B70FCF02980FD000F00CF902FF0F
L1E7B       DB    $00
            DB    $00
L1E7D       DW    $0000
L1E7F       DB    $00
            DB    $00
L1E81       DB    $00
            DB    $00
L1E83       DB    $00
            DB    $00
L1E85       DB    $00
            DB    $00
L1E87       DB    $00
            DB    $00
L1E89       DB    $00
            DB    $00
L1E8B       ADRL  L1EC3
            ADRL  L1EC9
            ADRL  L1ECF
            ADRL  L1ED6
            ADRL  L1EDC
            ADRL  L1EE2
            ADRL  L1EE7
            ADRL  L1EEF
            ADRL  L1EF6
            ADRL  L1EFB
            ADRL  L1F01
            ADRL  L1F06
            ADRL  L1F0C
            ADRL  L1F14
            
	DO	VF
L1EC3       STR   'de cygnes'
L1EC9       STR   'de lunes'
L1ECF       STR   'de coeurs'
L1ED6       STR   'd'27'elfes'
L1EDC       STR   'de roses'
L1EE2       STR   'd'27'insectes'
L1EE7       STR   'de fleurs'
L1EEF       STR   'de pommes'
L1EF6       STR   'de poissons'
L1EFB       STR   'de ballons'
L1F01       STR   'de chats'
L1F06       STR   'de bateaux'
L1F0C       STR   'de montres'
L1F14       STR   'de papillons'
	ELSE
L1EC3       STR   'of swans'
L1EC9       STR   'of moons'
L1ECF       STR   'of hearts'
L1ED6       STR   'of elves'
L1EDC       STR   'of roses'
L1EE2       STR   'of bugs'
L1EE7       STR   'of flowers'
L1EEF       STR   'of apples'
L1EF6       STR   'of fish'
L1EFB       STR   'of balls'
L1F01       STR   'of cats'
L1F06       STR   'of boats'
L1F0C       STR   'of watches'
L1F14       STR   'of moths'
	FIN

L1F1A       ADRL  L1F20       ;  path name
            DW    $0000       ;  flags
L1F20       STR   'program'

L1F28       BCS   L1F2B
            RTS

L1F2B       PHA
            LDA   #^L1F3C
            PHA
            LDA   #L1F3C
            PHA
            _SysFailMgr
            RTS

	DO	VF
L1F3C       STR   'Erreur applicative ... Oups !'
	ELSE
L1F3C       STR   'Application failure ... Oops!'
	FIN
L1F5A       LDA   #$0000
            STA   L1C7E
            LDA   L19F9
            STA   $00
            LDA   L19F9+2
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L19FD
            LDY   #$0002
            LDA   [$00],Y
            STA   L19FF
            LDA   L19FD
            BNE   L1F87
            LDA   L19FF
            BNE   L1F87
            JMP   L1F88
L1F87       RTS

L1F88       LDA   L19F9+2
            PHA
            LDA   L19F9
            PHA
            _RestoreHandle
            JSR   L1F28
            LDA   #$8000
            STA   L1C7E
            JMP   L1F5A

            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1C23
            STA   L19F9
            LDA   L1C25
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1C00
            LDA   L19FF
            STA   L1C02
            LDA   L1C00
            STA   L1A5D
            LDA   L1C02
            STA   L1A5D+2
            LDA   #$0000
            STA   L1A61+2
            LDA   #$A000
            STA   L1A61
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A5B
            JSR   L1F28
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L1A69
            JSR   L1F28
            LDA   L1A65
            STA   L1C04
            LDA   #$0000
            STA   L1B4E
            LDX   #$0008
L200A       LSR   L1C04
            BCC   L2015
            LDA   #$0001
            STA   L1B4E
L2015       DEX
            BNE   L200A
            LDA   L1C04
            CLC
            ADC   L1B4E
            STA   L1C04
            RTS

L2023       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L2023
L2036       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L2036
            RTS

L204A       _GrafOff
            _HideCursor
            RTS

L2059       _GrafOn
            RTS

L2061       PEA   $0000
            PEA   $FFFF
            LDA   #^L1C27
            PHA
            LDA   #L1C27
            PHA
            _GetNextEvent
            PLA
            BEQ   L2092
            LDA   L1C27
            CMP   #$0003
            BNE   L208A
L2081       LDA   #$0080
            STA   L1B4E
            JMP   L2092

L208A       CMP   #$0001
            BNE   L2092
            JMP   L2081
L2092       RTS

L2093       LDA   L1B50
            STA   L20AD
            STZ   L1B4E
L209C       JSR   L2061
            LDA   L1B4E
            CMP   #$0000
            BNE   L20AC
            DEC   L20AD
            BNE   L209C
L20AC       RTS

L20AD       DW    $0000
            STZ   L1B4E
L20B2       JSR   L2061
            LDA   L1B4E
            CMP   #$0000
            BEQ   L20B2
            RTS

L20BE       PEA   $0000
            PEA   $FFFF
            LDA   #^L1C27
            PHA
            LDA   #L1C27
            PHA
            _GetNextEvent
            PLA
            BEQ   L20BE
            LDA   L1C27
            CMP   #$0003
            BNE   L20BE
            LDA   L1C29
            AND   #$007F
            CMP   #$0061
            BCC   L20ED
            SEC
            SBC   #$0020
L20ED       CMP   #$001B
            BEQ   L20FC
            CMP   L1C43
            BEQ   L20FA
            JMP   L20BE

L20FA       CLC
            RTS
L20FC       JMP   L19A5

L20FF       PHA
            PEA   $0008
            LDA   #^L1C27
            PHA
            LDA   #L1C27
            PHA
            _GetNextEvent
            PLA
            BEQ   L20FF
            LDA   L1C29
            AND   #$007F
            STA   L1C43
            RTS

            PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L1E1B
            PHA
            LDA   #L1E1B
            PHA
            _SetColorTable
            RTS

L2147       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L1E3B
            PHA
            LDA   #L1E3B
            PHA
            _SetColorTable
            RTS

L216F       PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L1E5B
            PHA
            LDA   #L1E5B
            PHA
            _SetColorTable
            RTS

L2197       LDA   #^L1C45
            PHA
            LDA   #L1C45
            PHA
            LDA   L1C62
            PHA
            LDA   L1C60
            PHA
            LDA   L1C64
            PHA
            LDA   L1C5E
            PHA
            _SetRect
            RTS

            LDA   #^L1C45
            PHA
            LDA   #L1C45
            PHA
            _FrameRect
            RTS

L21C7       LDA   #^L1C45
            PHA
            LDA   #L1C45
            PHA
            _PaintRect
            RTS

L21D7       _PenNormal
            RTS

L21DF       LDA   L1C78
            PHA
            _SetSolidPenPat
            RTS

L21EB       PEA   $0000
            PEA   $FFFF
            LDA   #^L1C27
            PHA
            LDA   #L1C27
            PHA
            _GetNextEvent
            PLA
            BEQ   L21EB
            LDA   L1C27
            CMP   #$0003
            BEQ   L220E
            JMP   L225C

L220E       LDA   L1C29
            AND   #$007F
            CMP   #$0061
            BCC   L221D
            SEC
            SBC   #$0020
L221D       STA   L1C43
            _ObscureCursor
            LDA   #$0000
            STA   L1C7C
            LDA   #$0001
            STA   L22E7
            LDA   #$0000
            STA   L22E5
L2239       LDX   L22E5
            LDA   L1CDB,X
            CMP   L1C43
            BNE   L2245
            RTS

L2245       LDA   L22E7
            CMP   L1CD9
            BEQ   L2259
            INC   L22E7
            INC   L22E5
            INC   L22E5
            JMP   L2239
L2259       JMP   L21EB

L225C       CMP   #$0001
            BEQ   L2264
            JMP   L21EB

L2264       LDA   L1C31
            STA   L1C3F
            LDA   L1C33
            STA   L1C41
            LDA   #$0080
            STA   L1C7C
            LDA   #$0000
            STA   L22E3
            STA   L22E5
            LDA   #$0001
            STA   L22E7
L2285       LDY   #$0000
            LDX   L22E3
L228B       LDA   L1C80,X
            STA   L1CD0,Y
            INX
            INY
            CPY   #$0008
            BCC   L228B
            PEA   $0000
            LDA   #^L1C3F
            PHA
            LDA   #L1C3F
            PHA
            LDA   #^L1CD0
            PHA
            LDA   #L1CD0
            PHA
            _PtInRect
            PLA
            BEQ   L22B8
            JMP   L22D9

L22B8       LDA   L22E7
            CMP   L1CD9
            BNE   L22C3
            JMP   L21EB

L22C3       INC   L22E7
            INC   L22E5
            INC   L22E5
            LDA   L22E3
            CLC
            ADC   #$0008
            STA   L22E3
            JMP   L2285

L22D9       LDX   L22E5
            LDA   L1CDB,X
            STA   L1C43
            RTS

L22E3       DW    $0000
L22E5       DW    $0000
L22E7       DW    $0000
L22E9       LDA   L1B56
            PHA
            LDA   L1B58
            PHA
            _MoveTo
            LDA   L1B5A+2
            PHA
            LDA   L1B5A
            PHA
            _DrawString
            LDA   L1B58
            CLC
            ADC   L1B5E
            STA   L1B58
            RTS

L2312       LDA   L1B5A+2
            PHA
            LDA   L1B5A
            PHA
            _DrawString
            RTS

L2322       PHA
            LDA   L1B5A+2
            PHA
            LDA   L1B5A
            PHA
            _StringWidth
            PLA
            STA   L2344
            LDA   #$0140
            SEC
            SBC   L2344
            LSR
            STA   L1B56
            JMP   L22E9

L2344       DW    $0000
L2346       JSR   L2EEE
            STZ   L1B5E
            STZ   L1BA0
L234F       JSR   L20FF
            LDA   L1C43
            CMP   #$0008
            BEQ   L2362
            CMP   #$007F
            BEQ   L2362
            JMP   L23AA

L2362       LDA   L1BCA
            PHA
            _SetForeColor
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L22E9
            LDA   L1BA0
            AND   #$00FF
            CMP   #$0002
            BCS   L238A
            JMP   L2346

L238A       DEC   L1BA0
L238D       LDA   L1BCC
            PHA
            _SetForeColor
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L22E9
            JMP   L234F

L23AA       CMP   #$000D
            BNE   L23BB
            LDA   L1BA0
            AND   #$00FF
            BNE   L23BA
            JMP   L234F
L23BA       RTS

L23BB       CMP   #$001B
            BNE   L23C3
            JMP   L19A5

L23C3       CMP   #$0030
            BCS   L23CB
            JMP   L234F

L23CB       CMP   #$003A
            BCC   L23D3
            JMP   L234F

L23D3       LDA   L1BA0
            AND   #$00FF
            CMP   L1B6C
            BCC   L23E1
            JMP   L234F

L23E1       LDA   L1BCA
            PHA
            _SetForeColor
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L22E9
            INC   L1BA0
            LDA   L1BA0
            AND   #$00FF
            TAY
            LDA   L1C43
            STA   L1BA0,Y
            JMP   L238D

L240E       PHA
            LDA   #^L1BA1
            PHA
            LDA   #L1BA1
            PHA
            LDA   L1BA0
            AND   #$00FF
            PHA
            PEA   $0000
            _Dec2Int
            JSR   L1F28
            PLA
            STA   L1BCE
            RTS

            CLC
            LDA   #$00B5
            STA   L1C60
            LDA   #$001A
            STA   L1C62
            LDA   #$00C2
            ADC   #$0001
            STA   L1C5E
            LDA   #$00B4
            ADC   #$0001
            STA   L1C64
            LDA   #$000E
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDX   #$0000
L2464       LDA   L1C45,X
            STA   L1C4E,X
            INX
            INX
            CPX   #$0008
            BNE   L2464
            CLC
            LDA   #$00B5
            STA   L1C60
            LDA   #$00D0
            STA   L1C62
            LDA   #$00C2
            ADC   #$0001
            STA   L1C5E
            LDA   #$0124
            ADC   #$0001
            STA   L1C64
            LDA   #$000D
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDX   #$0000
L24A5       LDA   L1C45,X
            STA   L1C56,X
            INX
            INX
            CPX   #$0008
            BNE   L24A5
            PEA   $0000
            _GetForeColor
            PLA
            STA   L25DF
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L24E3

	DO	VF
L24CE       STR   'Espace pour continuer'
L24E3       PEA   $001A
	ELSE
L24CE       STR   'Spacebar to continue'
L24E3       PEA   $001E
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L24CE
            PHA
            LDA   #L24CE
            PHA
            _DrawString
            JMP   L250E

	DO	VF
L2502       STR   'ESC pour quitter'
L250E       PEA   $00C2
	ELSE
L2502       STR   'ESC to quit'
L250E       PEA   $00D6
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L2502
            PHA
            LDA   #L2502
            PHA
            _DrawString
L252A       PEA   $0000
            PEA   $FFFF
            LDA   #^L1C27
            PHA
            LDA   #L1C27
            PHA
            _GetNextEvent
            PLA
            BEQ   L252A
            LDA   L1C27
            CMP   #$0003
            BEQ   L254D
            JMP   L257C

L254D       _ObscureCursor
            LDA   #$0000
            STA   L1C7C
            LDA   L1C29
            AND   #$007F
            CMP   #$0020
            BEQ   L256D
            CMP   #$001B
            BEQ   L256D
            JMP   L252A

L256D       STA   L1C43
            LDA   L25DF
            PHA
            _SetForeColor
            RTS

L257C       CMP   #$0001
            BEQ   L2584
            JMP   L252A

L2584       LDA   L1C31
            STA   L1C3F
            LDA   L1C33
            STA   L1C41
            LDA   #$0080
            STA   L1C7C
            PEA   $0000
            LDA   #^L1C3F
            PHA
            LDA   #L1C3F
            PHA
            LDA   #^L1C4E
            PHA
            LDA   #L1C4E
            PHA
            _PtInRect
            PLA
            BEQ   L25B9
            LDA   #$0020
            JMP   L256D

L25B9       PEA   $0000
            LDA   #^L1C3F
            PHA
            LDA   #L1C3F
            PHA
            LDA   #^L1C56
            PHA
            LDA   #L1C56
            PHA
            _PtInRect
            PLA
            BEQ   L25DC
            LDA   #$001B
            JMP   L256D
L25DC       JMP   L252A

L25DF       DW    $0000
            JSR   L204A
            JSR   L2147
            JMP   L25EC

L25EA       DW    $0000
L25EC       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L25EA
            ASL
            ASL
            ASL
            ASL
            ORA   L25EA
            STA   L25EA
            LDAL  $E0C022
            AND   #$FF00
            ORA   L25EA
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L1C60
            LDA   #$003F
            STA   L1C62
            LDA   #$007E
            ADC   #$0001
            STA   L1C5E
            LDA   #$00F8
            ADC   #$0001
            STA   L1C64
            LDA   #$000A
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0041
            STA   L1C60
            LDA   #$0044
            STA   L1C62
            LDA   #$007A
            ADC   #$0001
            STA   L1C5E
            LDA   #$00F3
            ADC   #$0001
            STA   L1C64
            LDA   #$000C
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0060
            STA   L1C60
            LDA   #$004E
            STA   L1C62
            LDA   #$0072
            ADC   #$0001
            STA   L1C5E
            LDA   #$00E9
            ADC   #$0001
            STA   L1C64
            LDA   #$000B
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0063
            STA   L1C60
            LDA   #$0053
            STA   L1C62
            LDA   #$006F
            ADC   #$0001
            STA   L1C5E
            LDA   #$0060
            ADC   #$0001
            STA   L1C64
            LDA   #$000E
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDX   #$0000
L26DF       LDA   L1C45,X
            STA   L1C56,X
            INX
            INX
            CPX   #$0008
            BNE   L26DF
            CLC
            LDA   #$0063
            STA   L1C60
            LDA   #$00C6
            STA   L1C62
            LDA   #$006F
            ADC   #$0001
            STA   L1C5E
            LDA   #$00D3
            ADC   #$0001
            STA   L1C64
            LDA   #$000D
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDX   #$0000
L2720       LDA   L1C45,X
            STA   L1C4E,X
            INX
            INX
            CPX   #$0008
            BNE   L2720
            PEA   $0000
            _GetForeColor
            PLA
            STA   L2902
            PEA   $0000
            _SetForeColor
            JMP   L2759

	DO	VF
L2748       STR   'Veux-tu vraiment'
	ELSE
L2748       STR   'Are you sure you'
	FIN
L2759       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L2748
            PHA
            LDA   #L2748
            PHA
            _DrawString
            JMP   L2786

	DO	VF
L2778       STR   'quitter le jeu ?'
	ELSE
L2778       STR   'want to quit?'
	FIN
L2786       PEA   $0064
            PEA   $0059
            _MoveTo
            LDA   #^L2778
            PHA
            LDA   #L2778
            PHA
            _DrawString
            JMP   L27A9

	DO	VF
L27A5       STR   'ui'
	ELSE
L27A5       STR   'es'
	FIN
L27A9       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L27A5
            PHA
            LDA   #L27A5
            PHA
            _DrawString
            JMP   L27CB

	DO	VF
L27C8       STR   'on'
	ELSE
L27C8       STR   'o'
	FIN
L27CB       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L27C8
            PHA
            LDA   #L27C8
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L27F6

	DO	VF
L27F4       STR   'O'
	ELSE
L27F4       STR   'Y'
	FIN
L27F6       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L27F4
            PHA
            LDA   #L27F4
            PHA
            _DrawString
            JMP   L2817

L2815       STR   'N'
L2817       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L2815
            PHA
            LDA   #L2815
            PHA
            _DrawString
            JSR   L2059
            _InitCursor
L283D       PEA   $0000
            PEA   $FFFF
            LDA   #^L1C27
            PHA
            LDA   #L1C27
            PHA
            _GetNextEvent
            PLA
            BEQ   L283D
            LDA   L1C27
            CMP   #$0003
            BEQ   L2860
            JMP   L289F

L2860       _ObscureCursor
            LDA   #$0000
            STA   L1C7C
            LDA   L1C29
            AND   #$007F
            CMP   #$0061
            BCC   L287C
            SEC
            SBC   #$0020
	DO	VF
L287C       CMP   #'O'
	ELSE
L287C       CMP   #'Y'
	FIN
            BEQ   L2889
            CMP   #'N'
            BEQ   L2889
            JMP   L283D

L2889       STA   L1C43
            LDA   L2902
            PHA
            _SetForeColor
            _HideCursor
            RTS

L289F       CMP   #$0001
            BEQ   L28A7
            JMP   L283D

L28A7       LDA   L1C31
            STA   L1C3F
            LDA   L1C33
            STA   L1C41
            LDA   #$0080
            STA   L1C7C
            PEA   $0000
            LDA   #^L1C3F
            PHA
            LDA   #L1C3F
            PHA
            LDA   #^L1C4E
            PHA
            LDA   #L1C4E
            PHA
            _PtInRect
            PLA
            BEQ   L28DC
            LDA   #$004E
            JMP   L2889

L28DC       PEA   $0000
            LDA   #^L1C3F
            PHA
            LDA   #L1C3F
            PHA
            LDA   #^L1C56
            PHA
            LDA   #L1C56
            PHA
            _PtInRect
            PLA
            BEQ   L28FF
	DO	VF
            LDA   #'O'
            	ELSE
            LDA   #'Y'
	FIN
            JMP   L2889
L28FF       JMP   L283D

L2902       DW    $0000
            JSR   L204A
            JSR   L2147
            CLC
            LDA   #$0037
            STA   L1C60
            LDA   #$003B
            STA   L1C62
            LDA   #$0089
            ADC   #$0001
            STA   L1C5E
            LDA   #$0104
            ADC   #$0001
            STA   L1C64
            LDA   #$000B
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$003F
            STA   L1C60
            LDA   #$0044
            STA   L1C62
            LDA   #$0081
            ADC   #$0001
            STA   L1C5E
            LDA   #$00FB
            ADC   #$0001
            STA   L1C64
            LDA   #$000E
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L2990

	DO	VF
L297A       STR   'Merci d'27'avoir utilis'8e
	ELSE
L297A       STR   'Thank you for running'
	FIN
L2990       PEA   $0055
            PEA   $004F
            _MoveTo
            LDA   #^L297A
            PHA
            LDA   #L297A
            PHA
            _DrawString
            JMP   L29BC

	DO	VF
L29AF       STR   'le programme.'
L29BC       PEA   $0072
	ELSE
L29AF       STR   'the program.'
L29BC       PEA   $007A
	FIN
            PEA   $005A
            _MoveTo
            LDA   #^L29AF
            PHA
            LDA   #L29AF
            PHA
            _DrawString
            PEA   $000B
            _SetForeColor
            JMP   L29FB

	DO	VF
L29E5       STR   'Eteins l'27'ordinateur'
L29FB       PEA   $004B
	ELSE
L29E5       STR   'Turn off the computer'
L29FB       PEA   $0053
	FIN
            PEA   $006B
            _MoveTo
            LDA   #^L29E5
            PHA
            LDA   #L29E5
            PHA
            _DrawString
            JMP   L2A25

	DO	VF
L2A1A       STR   'ou red'8e'marre.'
L2A25       PEA   $0074
	ELSE
L2A1A       STR   'or reboot.'
L2A25       PEA   $0080
	FIN
            PEA   $0076
            _MoveTo
            LDA   #^L2A1A
            PHA
            LDA   #L2A1A
            PHA
            _DrawString
            JSR   L2059
            _HideCursor
            STP
L2A4C       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L1A11
            PHA
            _DisposeAll
            JSR   L1F28
            LDA   L1A0F
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L2A97       LDA   L1B28
            STA   L19F9
            LDA   L1B28+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1B2C
            LDA   L19FF
            STA   L1B2E
            PEA   $0000
            LDA   #^L1B38
            PHA
            LDA   #L1B38
            PHA
            LDA   #^L1B3C
            PHA
            LDA   #L1B3C
            PHA
            LDA   L1B2E
            PHA
            LDA   L1B2C
            PHA
            LDA   L1B3E
            PHA
            _PackBytes
            PLA
            STA   L1A83
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L1A7D
            JSR   L1F28
            LDA   L1B3C
            BNE   L2A97
            RTS

L2AEF       _HideCursor
            LDA   L1B28
            STA   L19F9
            LDA   L1B28+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1B2C
            LDA   L19FF
            STA   L1B2E
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HLock
            JSR   L1F28
            PEA   $00E1
            PEA   $2000
            LDA   L1B2E
            PHA
            LDA   L1B2C
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L2B3F       _HideCursor
            LDA   L1B2E
            PHA
            LDA   L1B2C
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HUnlock
            JSR   L1F28
            RTS

            _HideCursor
            LDA   #^L1DC1
            PHA
            LDA   #L1DC1
            PHA
            _PaintPixels
            JSR   L1F28
            RTS

            _HideCursor
            LDA   #^L1DF3
            PHA
            LDA   #L1DF3
            PHA
            _PaintPixels
            JSR   L1F28
            RTS

L2BA8       LDA   L1B28
            STA   L19F9
            LDA   L1B28+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1B2C
            LDA   L19FF
            STA   L1B2E
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HLock
            JSR   L1F28
            PEA   $00E1
            PEA   $2000
            LDA   L1B2E
            PHA
            LDA   L1B2C
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L2BF1       LDA   L1B2E
            PHA
            LDA   L1B2C
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HUnlock
            JSR   L1F28
            RTS

            _HideCursor
            LDA   L1D51
            STA   L19F9
            LDA   L1D51+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1D43
            LDA   L19FF
            STA   L1D43+2
            LDA   #^L1CEF
            PHA
            LDA   #L1CEF
            PHA
            _PaintPixels
            JSR   L1F28
            _InitCursor
            RTS

L2C5B       _HideCursor
            LDA   L1D51
            STA   L19F9
            LDA   L1D51+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1D43
            LDA   L19FF
            STA   L1D43+2
            LDA   #^L1D7D
            PHA
            LDA   #L1D7D
            PHA
            _PaintPixels
            JSR   L1F28
            RTS

            LDA   #^L1E15
            STA   L1A21+2
            LDA   #L1E15
            STA   L1A21
            LDA   #$0000
            STA   L1A25+2
            LDA   #$0006
            STA   L1A25
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            LDA   L1B28
            STA   L19F9
            LDA   L1B28+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1B2C
            LDA   L19FF
            STA   L1B2E
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HLock
            JSR   L1F28
            LDA   L1B2C
            STA   L1A21
            LDA   L1B2E
            STA   L1A21+2
            LDA   #$8000
            STA   L1A25
            LDA   #$0000
            STA   L1A25+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L1A2D
            LDA   #$0028
            STA   L1B58
            LDA   L1D51
            STA   L19F9
            LDA   L1D51+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1D43
            LDA   L19FF
            STA   L1D43+2
            LDA   L1D43
            STA   L1B40
            LDA   L1D43+2
            STA   L1B42
            LDA   L1E15
            STA   L1B44
L2D3E       PHA
            LDA   L1B2E
            PHA
            LDA   L1B2C
            PHA
            LDA   L1A29
            PHA
            LDA   #^L1B40
            PHA
            LDA   #L1B40
            PHA
            LDA   #^L1B44
            PHA
            LDA   #L1B44
            PHA
            _UnPackBytes
            PLA
            LDA   L1B44
            BNE   L2D3E
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HUnlock
            JSR   L1F28
            RTS

            LDA   #$0000
            STA   L1D49
            STA   L1D4B
            STA   L1DA9
            STA   L1DAB
            LDA   L1E17
            STA   L1D4D
            STA   L1DAD
            LDA   L1E19
            STA   L1D4F
            STA   L1DAF
            LSR
            CLC
            ADC   #$0001
            STA   L1D47
            _HideCursor
            JSR   L2C5B
            RTS

            LDA   L1B5A
            STA   $00
            LDA   L1B5A+2
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L1A0D
            LDA   #$0001
            STA   L2E30
            PHA
            LDA   L1B5A+2
            PHA
            LDA   L1B5A
            PHA
            _StringWidth
            PLA
            STA   L2E32
            LDA   #$0140
            SEC
            SBC   L2E32
            LSR
            PHA
            LDA   L1B58
            PHA
            _MoveTo
L2DF2       LDA   L1B5A
            STA   $00
            LDA   L1B5A+2
            STA   $02
            LDY   L2E30
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0061
            BCC   L2E0D
            SEC
            SBC   #$0020
L2E0D       STA   L1C43
            JSR   L20BE
            LDA   L1C43
            PHA
            _DrawChar
            INC   L2E30
            DEC   L1A0D
            BNE   L2DF2
            LDA   #$000D
            STA   L1C43
            JSR   L20BE
            RTS

L2E30       DW    $0000
L2E32       DW    $0000
            LDA   #^L1CD0
            PHA
            LDA   #L1CD0
            PHA
            LDA   L1B52
            PHA
            LDA   L1B54
            PHA
            LDA   L1B52
            CLC
            ADC   #$0079
            PHA
            LDA   L1B54
            CLC
            ADC   #$001A
            PHA
            _SetRect
            LDA   #$000F
            STA   L1C78
            LDA   #$0001
            PHA
            _SetForeColor
            JSR   L21D7
            JSR   L21DF
            LDA   #^L1CD0
            PHA
            LDA   #L1CD0
            PHA
            _PaintRect
            LDA   L1B52
            CLC
            ADC   #$0004
            STA   L1B56
            LDA   L1B54
            CLC
            ADC   #$000B
            STA   L1B58
            JMP   L2EA8

	DO	VF
L2E98       STR   'Clique sur la souris'
	ELSE
L2E98       STR   'Click the mouse'
	FIN
L2EA8       LDA   #^L2E98
            STA   L1B5A+2
            LDA   #L2E98
            STA   L1B5A
            JSR   L22E9
            LDA   L1B52
            CLC
            ADC   #$0014
            STA   L1B56
            LDA   L1B54
            CLC
            ADC   #$0013
            STA   L1B58
            JMP   L2EDB

	DO	VF
L2ECE       STR   'pour continuer.'
	ELSE
L2ECE       STR   'to continue.'
	FIN
L2EDB       LDA   #^L2ECE
            STA   L1B5A+2
            LDA   #L2ECE
            STA   L1B5A
            JSR   L22E9
            JSR   L2023
            RTS

L2EEE       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L2EFE       LDA   #L2FD7
            STA   $04
            LDA   #^L2FD7
            STA   $06
            LDA   L1B60
            STA   $00
            LDA   L1B62
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L2FD4
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L2F2F       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L2FD4
            BNE   L2F2F
            LDA   L2FD6
            AND   #$FF00
            ORA   L2FD4
            STA   L2FD6
            LDA   L1B64
            STA   $00
            LDA   L1B66
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L2FD4
            LDA   L2FD6
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
L2F7E       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L2FD4
            BNE   L2F7E
            LDA   L2FD6
            CLC
            ADC   L2FD4
            STA   L2FD6
            LDA   L1B68
            STA   $00
            LDA   L1B6A
            STA   $02
            LDA   #L2FD7
            STA   $04
            LDA   #^L2FD7
            STA   $06
            LDA   L2FD6
            AND   #$00FF
            LDY   #$0000
            STA   [$00],Y
            AND   #$00FF
            STA   L2FD4
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L2FC9       LDA   [$04],Y
            STA   [$00],Y
            INY
            CPY   L2FD4
            BNE   L2FC9
            RTS

L2FD4       DB    $00
            DB    $00
L2FD6       DB    $00
L2FD7       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
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
            LDA   L1B46
            AND   #$000F
            PHA
            LDA   L1B48
            AND   #$000F
            JSR   L3111
            STA   L3116
            LDA   L1B4A
            AND   #$000F
            ORA   L3116
            JSR   L3111
            STA   L3116
            LDA   L1B4C
            AND   #$000F
            ORA   L3116
            PHA
            _SetColorEntry
            JSR   L1F28
            RTS

L3111       ASL
            ASL
            ASL
            ASL
            RTS

L3116       DB    $00
            DB    $00
L3118       DB    $01
            DB    $00
L311A       DB    $00
            DB    $00
L311C       DB    $00
            DB    $00
L311E       DB    $00
            DB    $00
L3120       DB    $00
            DB    $00
L3122       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L312A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3132       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L313A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3142       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L314A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3152       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L315A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3162       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L316A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3172       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L317A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3182       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L31BA       LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            _ReadTimeHex
            PLA
            STA   L31E2
            PLA
            STA   L31E4
            PLA
            PLA
            LDA   L31E4
            PHA
            LDA   L31E2
            PHA
            _SetRandSeed
            RTS

L31E2       DW    $0000
L31E4       DW    $0000
L31E6       PEA   $0000
            _Random
            PLA
            STA   L323D
            PEA   $0000
            PEA   $0000
            LDA   L1A0B
            PHA
            LDA   L323D
            PHA
            _Multiply
            PLA
            STA   L323F
            PLA
            STA   L323F+2
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDA   L323F+2
            PHA
            LDA   L323F
            PHA
            LDA   #$0001
            PHA
            LDA   #$0000
            PHA
            _LongDivide
            JSR   L1F28
            PLA
            STA   L323D
            PLA
            PLA
            PLA
            LDA   L323D
            RTS

L323D       DW    $0000
L323F       ADRL  $00000000
L3243       JSR   L5B4C
            JSR   L204A
            JSR   L5CDC
            JSR   L2AEF
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HUnlock
            JSR   L1F28
            PEA   $0000
            _ClearScreen
            JSR   L2059
            LDA   L1B28
            STA   L19F9
            LDA   L1B28+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1B2C
            LDA   L19FF
            STA   L1B2E
            LDA   L1B2C
            STA   L1D43
            LDA   L1B2E
            STA   L1D43+2
            LDA   #$00A0
            STA   L1D47
            LDA   #$0000
            STA   L1D49
            STA   L1D4B
            LDA   #$00C8
            STA   L1D4D
            LDA   #$0140
            STA   L1D4F
            RTS

L32B1       LDA   L3307
            CMP   L3305
            BCC   L32D2
            JSR   L31BA
            LDA   #$0000
            STA   L3307
            LDX   #$0000
L32C5       CPX   #$0027
            BCS   L32D2
            STA   L3309,X
            INX
            INX
            JMP   L32C5

L32D2       LDA   L3305
            STA   L1A0B
            JSR   L31E6
            STA   L3331
            ASL
            TAX
            LDA   L3309,X
            BNE   L32D2
            LDA   #$0001
            STA   L3309,X
            INC   L3307
            LDA   L3331
            ASL
            ASL
            TAY
            LDA   L3333,Y
            STAL  $000000
            LDA   L3333+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L3305       DB    $11
            DB    $00
L3307       DB    $00
            DB    $00
L3309       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3331       DB    $00
            DB    $00
L3333       ADRL  L3377
            ADRL  L33E0
            ADRL  L344F
            ADRL  L34B8
            ADRL  L3524
            ADRL  L3596
            ADRL  L35FF
            ADRL  L3668
            ADRL  L36D7
            ADRL  L3746
            ADRL  L37B5
            ADRL  L3830
            ADRL  L38A2
            ADRL  L3917
            ADRL  L3980
            ADRL  L39EF
            ADRL  L3A5E
L3377       JMP   L338A

L337A       STR   'GOODA'
L3380       DW    $0000       ;  ref num
            ADRL  L337A       ;  path name
            ADRL  $00000000   ;  reserved
L338A       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3380
            JSR   L1F28
            LDA   L3380
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L33A8

L33A6       DW    $0000
L33A8       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0006
            STAL  $E0C034
            LDA   #$0006
            STA   L33A6
            ASL
            ASL
            ASL
            ASL
            ORA   L33A6
            STA   L33A6
            LDAL  $E0C022
            AND   #$FF00
            ORA   L33A6
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0004
            STA   L5E13
            JMP   L3ACD
L33E0       JMP   L33F3

L33E3       STR   'GOODB'
L33E9       DW    $0000       ;  ref num
            ADRL  L33E3       ;  path name
            ADRL  $00000000   ;  reserved
L33F3       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L33E9
            JSR   L1F28
            LDA   L33E9
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3411

L340F       DW    $0000
L3411       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L340F
            ASL
            ASL
            ASL
            ASL
            ORA   L340F
            STA   L340F
            LDAL  $E0C022
            AND   #$FF00
            ORA   L340F
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0002
            STA   L5E13
            STA   L5E15
            STA   L5E17
            JMP   L3ACD
L344F       JMP   L3462

L3452       STR   'GOODC'
L3458       DW    $0000       ;  ref num
            ADRL  L3452       ;  path name
            ADRL  $00000000   ;  reserved
L3462       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3458
            JSR   L1F28
            LDA   L3458
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3480

L347E       DW    $0000
L3480       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L347E
            ASL
            ASL
            ASL
            ASL
            ORA   L347E
            STA   L347E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L347E
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0004
            STA   L5E19
            JMP   L3ACD
L34B8       JMP   L34CB

L34BB       STR   'GOODD'
L34C1       DW    $0000       ;  ref num
            ADRL  L34BB       ;  path name
            ADRL  $00000000   ;  reserved
L34CB       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L34C1
            JSR   L1F28
            LDA   L34C1
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L34E9

L34E7       DW    $0000
L34E9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L34E7
            ASL
            ASL
            ASL
            ASL
            ORA   L34E7
            STA   L34E7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L34E7
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0008
            STA   L5E13
            STA   L5E15
            JMP   L3ACD
L3524       JMP   L3537

L3527       STR   'GOODE'
L352D       DW    $0000       ;  ref num
            ADRL  L3527       ;  path name
            ADRL  $00000000   ;  reserved
L3537       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L352D
            JSR   L1F28
            LDA   L352D
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3555

L3553       DW    $0000
L3555       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3553
            ASL
            ASL
            ASL
            ASL
            ORA   L3553
            STA   L3553
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3553
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0008
            STA   L5E13
            STA   L5E15
            LDA   #$0003
            STA   L5E17
            JMP   L3ACD
L3596       JMP   L35A9

L3599       STR   'GOODF'
L359F       DW    $0000       ;  ref num
            ADRL  L3599       ;  path name
            ADRL  $00000000   ;  reserved
L35A9       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L359F
            JSR   L1F28
            LDA   L359F
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L35C7

L35C5       DW    $0000
L35C7       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L35C5
            ASL
            ASL
            ASL
            ASL
            ORA   L35C5
            STA   L35C5
            LDAL  $E0C022
            AND   #$FF00
            ORA   L35C5
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0002
            STA   L5E19
            JMP   L3ACD
L35FF       JMP   L3612

L3602       STR   'GOODG'
L3608       DW    $0000       ;  ref num
            ADRL  L3602       ;  path name
            ADRL  $00000000   ;  reserved
L3612       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3608
            JSR   L1F28
            LDA   L3608
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3630

L362E       DW    $0000
L3630       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L362E
            ASL
            ASL
            ASL
            ASL
            ORA   L362E
            STA   L362E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L362E
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0006
            STA   L5E17
            JMP   L3ACD
L3668       JMP   L367B

L366B       STR   'GOODH'
L3671       DW    $0000       ;  ref num
            ADRL  L366B       ;  path name
            ADRL  $00000000   ;  reserved
L367B       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3671
            JSR   L1F28
            LDA   L3671
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3699

L3697       DW    $0000
L3699       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3697
            ASL
            ASL
            ASL
            ASL
            ORA   L3697
            STA   L3697
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3697
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0008
            STA   L5E15
            LDA   #$000A
            STA   L5E17
            JMP   L3ACD
L36D7       JMP   L36EA

L36DA       STR   'GOODI'
L36E0       DW    $0000       ;  ref num
            ADRL  L36DA       ;  path name
            ADRL  $00000000   ;  reserved
L36EA       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L36E0
            JSR   L1F28
            LDA   L36E0
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3708

L3706       DW    $0000
L3708       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3706
            ASL
            ASL
            ASL
            ASL
            ORA   L3706
            STA   L3706
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3706
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$000A
            STA   L5E13
            LDA   #$0005
            STA   L5E15
            JMP   L3ACD
L3746       JMP   L3759

L3749       STR   'GOODJ'
L374F       DW    $0000       ;  ref num
            ADRL  L3749       ;  path name
            ADRL  $00000000   ;  reserved
L3759       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L374F
            JSR   L1F28
            LDA   L374F
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3777

L3775       DW    $0000
L3777       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3775
            ASL
            ASL
            ASL
            ASL
            ORA   L3775
            STA   L3775
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3775
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0005
            STA   L5E13
            LDA   #$000A
            STA   L5E19
            JMP   L3ACD
L37B5       JMP   L37C8

L37B8       STR   'GOODK'
L37BE       DW    $0000       ;  ref num
            ADRL  L37B8       ;  path name
            ADRL  $00000000   ;  reserved
L37C8       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L37BE
            JSR   L1F28
            LDA   L37BE
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L37E6

L37E4       DW    $0000
L37E6       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L37E4
            ASL
            ASL
            ASL
            ASL
            ORA   L37E4
            STA   L37E4
            LDAL  $E0C022
            AND   #$FF00
            ORA   L37E4
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$000A
            STA   L5E13
            LDA   #$000B
            STA   L5E15
            LDA   #$0005
            STA   L5E17
            LDA   #$000A
            STA   L5E19
            JMP   L3ACD
L3830       JMP   L3843

L3833       STR   'GOODL'
L3839       DW    $0000       ;  ref num
            ADRL  L3833       ;  path name
            ADRL  $00000000   ;  reserved
L3843       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3839
            JSR   L1F28
            LDA   L3839
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3861

L385F       DW    $0000
L3861       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L385F
            ASL
            ASL
            ASL
            ASL
            ORA   L385F
            STA   L385F
            LDAL  $E0C022
            AND   #$FF00
            ORA   L385F
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0005
            STA   L5E15
            LDA   #$0003
            STA   L5E17
            STA   L5E19
            JMP   L3ACD
L38A2       JMP   L38B5

L38A5       STR   'GOODM'
L38AB       DW    $0000       ;  ref num
            ADRL  L38A5       ;  path name
            ADRL  $00000000   ;  reserved
L38B5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L38AB
            JSR   L1F28
            LDA   L38AB
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L38D3

L38D1       DW    $0000
L38D3       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L38D1
            ASL
            ASL
            ASL
            ASL
            ORA   L38D1
            STA   L38D1
            LDAL  $E0C022
            AND   #$FF00
            ORA   L38D1
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0002
            STA   L5E13
            LDA   #$0003
            STA   L5E15
            LDA   #$0004
            STA   L5E19
            JMP   L3ACD
L3917       JMP   L392A

L391A       STR   'GOODN'
L3920       DW    $0000       ;  ref num
            ADRL  L391A       ;  path name
            ADRL  $00000000   ;  reserved
L392A       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3920
            JSR   L1F28
            LDA   L3920
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3948

L3946       DW    $0000
L3948       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L3946
            ASL
            ASL
            ASL
            ASL
            ORA   L3946
            STA   L3946
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3946
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0005
            STA   L5E17
            JMP   L3ACD
L3980       JMP   L3993

L3983       STR   'GOODO'
L3989       DW    $0000       ;  ref num
            ADRL  L3983       ;  path name
            ADRL  $00000000   ;  reserved
L3993       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3989
            JSR   L1F28
            LDA   L3989
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L39B1

L39AF       DW    $0000
L39B1       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0005
            STAL  $E0C034
            LDA   #$0005
            STA   L39AF
            ASL
            ASL
            ASL
            ASL
            ORA   L39AF
            STA   L39AF
            LDAL  $E0C022
            AND   #$FF00
            ORA   L39AF
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0007
            STA   L5E15
            LDA   #$0005
            STA   L5E19
            JMP   L3ACD
L39EF       JMP   L3A02

L39F2       STR   'GOODQ'
L39F8       DW    $0000       ;  ref num
            ADRL  L39F2       ;  path name
            ADRL  $00000000   ;  reserved
L3A02       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L39F8
            JSR   L1F28
            LDA   L39F8
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3A20

L3A1E       DW    $0000
L3A20       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3A1E
            ASL
            ASL
            ASL
            ASL
            ORA   L3A1E
            STA   L3A1E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3A1E
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$000F
            STA   L5E15
            LDA   #$0008
            STA   L5E17
            JMP   L3ACD
L3A5E       JMP   L3A71

L3A61       STR   'GOODR'
L3A67       DW    $0000       ;  ref num
            ADRL  L3A61       ;  path name
            ADRL  $00000000   ;  reserved
L3A71       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3A67
            JSR   L1F28
            LDA   L3A67
            STA   L1A1F
            STA   L1A2D
            JSR   L5B4C
            JMP   L3A8F

L3A8D       DW    $0000
L3A8F       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3A8D
            ASL
            ASL
            ASL
            ASL
            ORA   L3A8D
            STA   L3A8D
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3A8D
            STAL  $E0C022
            JSR   L5CDC
            LDA   #$0002
            STA   L5E15
            LDA   #$0003
            STA   L5E17
            JMP   L3ACD

L3ACD       JSR   L59B9
            LDA   #$2000
            STA   L1B50
            JSR   L2EEE
            STZ   L1B4E
            JSR   L2093
            JSR   L5A3A
            RTS

L3AE3       STA   L3B49
L3AE6       LDA   L3B49
            SEC
            SBC   #$0001
            ASL
            ASL
            TAY
            LDA   L3BB3,Y
            STA   L1B54
            LDA   L3BB5,Y
            STA   L1B52
            LDA   L3118
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L311A,Y
            STA   L1D69
            LDA   L311C,Y
            STA   L1D6B
            LDA   L311E,Y
            STA   L1D6D
            LDA   L3120,Y
            STA   L1D6F
            LDA   L1B54
            STA   L1D65
            LDA   L1B52
            STA   L1D67
            LDA   #^L1D05
            PHA
            LDA   #L1D05
            PHA
            _PaintPixels
            JSR   L1F28
            DEC   L3B49
            LDA   L3B49
            BEQ   L3B48
            JMP   L3AE6
L3B48       RTS

L3B49       DW    $0000
L3B4B       STA   L3BB1
L3B4E       LDA   L3BB1
            SEC
            SBC   #$0001
            ASL
            ASL
            TAY
            LDA   L3BDB,Y
            STA   L1B54
            LDA   L3BDD,Y
            STA   L1B52
            LDA   L3118
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L311A,Y
            STA   L1D69
            LDA   L311C,Y
            STA   L1D6B
            LDA   L311E,Y
            STA   L1D6D
            LDA   L3120,Y
            STA   L1D6F
            LDA   L1B54
            STA   L1D65
            LDA   L1B52
            STA   L1D67
            LDA   #^L1D05
            PHA
            LDA   #L1D05
            PHA
            _PaintPixels
            JSR   L1F28
            DEC   L3BB1
            LDA   L3BB1
            BEQ   L3BB0
            JMP   L3B4E
L3BB0       RTS

L3BB1       DW    $0000
L3BB3       DW    $0000
L3BB5       DW    $006C
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
L3BDB       DW    $004C
L3BDD       DW    $006C
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
L3C03       SEC
            SBC   #$0001
            ASL
            ASL
            TAY
            LDA   L1E8B,Y
            STA   L1B5A
            LDA   L1E8B+2,Y
            STA   L1B5A+2
            JSR   L2312
            RTS

L3C1A       LDA   L1BD0
            ASL
            TAY
            LDA   L1BD2,Y
            BEQ   L3C26
            SEC
            RTS

L3C26       LDA   #$0001
            STA   L1BD2,Y
            CLC
            RTS

L3C2E       LDY   #$0000
            LDA   #$0000
L3C34       STA   L1BD2,Y
            INY
            INY
            CPY   #$0014
            BNE   L3C34
            RTS

L3C3F       LDA   #$000D
            STA   L1B46
            LDA   #$000B
            PHA
            _SetForeColor
L3C50       JSR   L2EEE
            CLC
            LDA   #$00BA
            STA   L1C60
            LDA   #$000B
            STA   L1C62
            LDA   #$00C7
            ADC   #$0001
            STA   L1C5E
            LDA   #$0135
            ADC   #$0001
            STA   L1C64
            LDA   L1B46
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            STZ   L1B5E
            LDA   #$00C4
            STA   L1B58
            LDA   #$000F
            STA   L1B56
            JMP   L3CAD

	DO	VF
L3C96       STR   '(espace : continuer)'
	ELSE
L3C96       STR   '(spacebar to continue)'
	FIN
L3CAD       LDA   #^L3C96
            STA   L1B5A+2
            LDA   #L3C96
            STA   L1B5A
            JSR   L22E9
	DO	VF
            LDA   #$00C6
            	ELSE
            LDA   #$00D6
	FIN
            STA   L1B56
            JMP   L3CD3

	DO	VF
L3CC5       STR   '(esc : quitter)'
	ELSE
L3CC5       STR   '(esc to quit)'
	FIN
L3CD3       LDA   #^L3CC5
            STA   L1B5A+2
            LDA   #L3CC5
            STA   L1B5A
            JSR   L22E9
            LDA   #$0020
            STA   L1C43
            JSR   L20BE
            RTS

L3CEC       STA   L3D26
            PHA
            LDA   #^L1BA1
            PHA
            LDA   #L1BA1
            PHA
            LDA   L3D26
            CMP   #$000A
            BCS   L3D06
            LDA   #$0001
            JMP   L3D14

L3D06       CMP   #$0064
            BCS   L3D11
            LDA   #$0002
            JMP   L3D14

L3D11       LDA   #$0003
L3D14       STA   L1BA0
            PHA
            PEA   $0000
            _Int2Dec
            JSR   L1F28
            RTS

L3D26       DW    $0000
L3D28       LDA   #$000F
            PHA
            _SetForeColor
            PEA   $000F
            _SetSolidPenPat
            LDA   L1B52
            CLC
            ADC   #$0001
            PHA
            LDA   L1B54
            CLC
            ADC   #$0002
            PHA
            _MoveTo
            LDA   L1B52
            CLC
            ADC   #$000E
            PHA
            LDA   L1B54
            CLC
            ADC   #$0002
            PHA
            _LineTo
            JSR   L1F28
            LDA   L1B52
            CLC
            ADC   #$0019
            PHA
            LDA   L1B54
            CLC
            ADC   #$0002
            PHA
            _MoveTo
            LDA   L1B52
            CLC
            ADC   #$0026
            PHA
            LDA   L1B54
            CLC
            ADC   #$0002
            PHA
            _LineTo
            JSR   L1F28
            LDA   L1B52
            CLC
            ADC   #$0031
            PHA
            LDA   L1B54
            CLC
            ADC   #$0002
            PHA
            _MoveTo
            LDA   L1B52
            CLC
            ADC   #$003E
            PHA
            LDA   L1B54
            CLC
            ADC   #$0002
            PHA
            _LineTo
            JSR   L1F28
            LDA   L1B52
            CLC
            ADC   #$0010
            PHA
            LDA   L1B54
            PHA
            _MoveTo
            PEA   $002B
            _DrawChar
            LDA   L1B52
            CLC
            ADC   #$0028
            PHA
            LDA   L1B54
            PHA
            _MoveTo
            PEA   $003D
            _DrawChar
            RTS

L3E0B       LDA   L1E81
            JSR   L3CEC
            LDA   L1B52
            STA   L1B56
            JMP   L3E3D

L3E1A       LDA   L1E83
            JSR   L3CEC
            LDA   L1B52
            CLC
            ADC   #$0018
            STA   L1B56
            JMP   L3E3D

L3E2D       LDA   L1BD0
            JSR   L3CEC
            LDA   L1B52
            CLC
            ADC   #$0030
            STA   L1B56
L3E3D       LDA   L1B54
            STA   L1B58
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L22E9
            RTS

L3E53       LDA   #$0006
            STA   L1B56
            LDA   #$0024
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1BD0
            ASL
            ASL
            TAY
            LDA   L3E87,Y
            STAL  $000000
            LDA   L3E87+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L3E87       ADRL  L3E9B
            ADRL  L3F40
            ADRL  L3FD2
            ADRL  L4079
            ADRL  L415B
L3E9B       JMP   L3EC9

	DO	VF
L3E9E       STR   '    Tommy a achet'8e' sept billes. Il en a trouv'8e
	ELSE
L3E9E       STR   '     Tommy bought seven marbles.  He found'
	FIN
L3EC9       LDA   #^L3E9E
            STA   L1B5A+2
            LDA   #L3E9E
            STA   L1B5A
            JSR   L22E9
            JMP   L3F01

	DO	VF
L3EDB       STR   'trois de plus. Trouve le nombre total'
	ELSE
L3EDB       STR   'three more.  Find the total number of'
	FIN
L3F01       LDA   #^L3EDB
            STA   L1B5A+2
            LDA   #L3EDB
            STA   L1B5A
            JSR   L22E9
            JMP   L3F1C

	DO	VF
L3F13       STR   'de billes.'
	ELSE
L3F13       STR   'marbles.'
	FIN
L3F1C       LDA   #^L3F13
            STA   L1B5A+2
            LDA   #L3F13
            STA   L1B5A
            JSR   L22E9
            LDA   #$0007
            STA   L1E81
            LDA   #$0003
            STA   L1E83
            LDA   #$000A
            STA   L1BD0
            JMP   L4205
L3F40       JMP   L3F70

	DO	VF
L3F43       STR   '    Six chats ont saut'8e' d'27'un mur. Sept de plus'
	ELSE
L3F43       STR   '     Six cats jumped off a wall.  Seven more'
	FIN
L3F70       LDA   #^L3F43
            STA   L1B5A+2
            LDA   #L3F43
            STA   L1B5A
            JSR   L22E9
            JMP   L3FAE

	DO	VF
L3F82       STR   'ont saut'8e'. Combien de chats ont saut'8e' en tout ?'
	ELSE
L3F82       STR   'followed.  How many cats jumped off in all?'
	FIN
L3FAE       LDA   #^L3F82
            STA   L1B5A+2
            LDA   #L3F82
            STA   L1B5A
            JSR   L22E9
            LDA   #$0006
            STA   L1E81
            LDA   #$0007
            STA   L1E83
            LDA   #$000D
            STA   L1BD0
            JMP   L4205
L3FD2       JMP   L4003

	DO	VF
L3FD5       STR   '     Joey a mont'8e' six marches. Il en restait'
	ELSE
L3FD5       STR   '     Joey climbed six steps.  There were five'
	FIN
L4003       LDA   #^L3FD5
            STA   L1B5A+2
            LDA   #L3FD5
            STA   L1B5A
            JSR   L22E9
            JMP   L403C

	DO	VF
L4015       STR   'cinq '88' monter. Quelle est la somme'
	ELSE
L4015       STR   'more to climb.  What is the sum of the'
	FIN
L403C       LDA   #^L4015
            STA   L1B5A+2
            LDA   #L4015
            STA   L1B5A
            JSR   L22E9
            JMP   L4055

	DO	VF
L404E       STR   'du nombre de marches ?'
	ELSE
L404E       STR   'steps?'
	FIN
L4055       LDA   #^L404E
            STA   L1B5A+2
            LDA   #L404E
            STA   L1B5A
            JSR   L22E9
            LDA   #$0006
            STA   L1E81
            LDA   #$0005
            STA   L1E83
            LDA   #$000B
            STA   L1BD0
            JMP   L4205
L4079       JMP   L40A7

	DO	VF
L407C       STR   '    Matt a lanc'8e' son Frisbee '88' Susan huit'
	ELSE
L407C       STR   '     Matt threw his Frisbee to Susan eight'
	FIN
L40A7       LDA   #^L407C
            STA   L1B5A+2
            LDA   #L407C
            STA   L1B5A
            JSR   L22E9
            JMP   L40E6

	DO	VF
L40B9       STR   'fois. Puis il l'27'a lanc'8e' '88' Tom huit fois.'
	ELSE
L40B9       STR   'times.  Then he threw it to Tom eight times.'
	FIN
L40E6       LDA   #^L40B9
            STA   L1B5A+2
            LDA   #L40B9
            STA   L1B5A
            JSR   L22E9
            JMP   L4123

	DO	VF
L40F8       STR   'Combien de fois a-t-il lanc'8e' son Frisbee'
	ELSE
L40F8       STR   'How many times did he throw the Frisbee in'
	FIN
L4123       LDA   #^L40F8
            STA   L1B5A+2
            LDA   #L40F8
            STA   L1B5A
            JSR   L22E9
            JMP   L413A

	DO	VF
L4135       STR   'en tout ?'
	ELSE
L4135       STR   'all?'
	FIN
L413A       LDA   #^L4135
            STA   L1B5A+2
            LDA   #L4135
            STA   L1B5A
            JSR   L22E9
            LDA   #$0008
            STA   L1E81
            STA   L1E83
            LDA   #$0010
            STA   L1BD0
            JMP   L4205
L415B       JMP   L4189

	DO	VF
L415E       STR   '    Sept personnes vont faire des courses.'
	ELSE
L415E       STR   '     Seven people went to the store.  Four'
	FIN
L4189       LDA   #^L415E
            STA   L1B5A+2
            LDA   #L415E
            STA   L1B5A
            JSR   L22E9
            JMP   L41C6

	DO	VF
L419B       STR   'Quatre de plus suivent. Combien de personnes'
	ELSE
L419B       STR   'more followed.  How many people were there'
	FIN
L41C6       LDA   #^L419B
            STA   L1B5A+2
            LDA   #L419B
            STA   L1B5A
            JSR   L22E9
            JMP   L41E4

	DO	VF
L41D8       STR   'au total font des courses ?'
	ELSE
L41D8       STR   'altogether?'
	FIN
L41E4       LDA   #^L41D8
            STA   L1B5A+2
            LDA   #L41D8
            STA   L1B5A
            JSR   L22E9
            LDA   #$0007
            STA   L1E81
            LDA   #$0004
            STA   L1E83
            LDA   #$000B
            STA   L1BD0
L4205       LDA   #$0078
            STA   L1B52
            LDA   #$0058
            STA   L1B54
            JSR   L3D28
            JSR   L2AEF
            RTS

L4218       LDA   #$0006
            STA   L1B56
            LDA   #$0024
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1BD0
            ASL
            ASL
            TAY
            LDA   L424C,Y
            STAL  $000000
            LDA   L424C+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L424C       ADRL  L4258
            ADRL  L42E9
            ADRL  L437A
L4258       JMP   L4288

	DO	VF
L425B       STR   '    Quatre assiettes sont sur une table. Quatre'
	ELSE
L425B       STR   '     Four plates were on a table.  Four were'
	FIN
L4288       LDA   #^L425B
            STA   L1B5A+2
            LDA   #L425B
            STA   L1B5A
            JSR   L22E9
            JMP   L42C5

	DO	VF
L429A       STR   'sur une autre. Combien d'27'assiettes au total ?'
	ELSE
L429A       STR   'on another.  How many plates were on both?'
	FIN
L42C5       LDA   #^L429A
            STA   L1B5A+2
            LDA   #L429A
            STA   L1B5A
            JSR   L22E9
            LDA   #$0004
            STA   L1E81
            LDA   #$0004
            STA   L1E83
            LDA   #$0008
            STA   L1BD0
            JMP   L4432
L42E9       JMP   L431B

	DO	VF
L42EC       STR   '    Deux singes sont dans une cage. Quatre sont'
	ELSE
L42EC       STR   '     Two monkeys were in a cage.  Four were in'
	FIN
L431B       LDA   #^L42EC
            STA   L1B5A+2
            LDA   #L42EC
            STA   L1B5A
            JSR   L22E9
            JMP   L4356

	DO	VF
L432D       STR   'dans une autre. Combien de singes au total ?'
	ELSE
L432D       STR   'another.  How many monkeys were in both?'
	FIN
L4356       LDA   #^L432D
            STA   L1B5A+2
            LDA   #L432D
            STA   L1B5A
            JSR   L22E9
            LDA   #$0002
            STA   L1E81
            LDA   #$0004
            STA   L1E83
            LDA   #$0006
            STA   L1BD0
            JMP   L4432
L437A       JMP   L43A7

	DO	VF
L437D       STR   '    Michelle a d'8e'pens'8e' huit euros un jour'
	ELSE
L437D       STR   '     Michelle spent eight dollars one day'
	FIN
L43A7       LDA   #^L437D
            STA   L1B5A+2
            LDA   #L437D
            STA   L1B5A
            JSR   L22E9
            JMP   L43E3

	DO	VF
L43B9       STR   'et sept euros le jour suivant. Combien'
	ELSE
L43B9       STR   'and seven dollars the next day.  How much'
	FIN
L43E3       LDA   #^L43B9
            STA   L1B5A+2
            LDA   #L43B9
            STA   L1B5A
            JSR   L22E9
            JMP   L4411

	DO	VF
L43F5       STR   'a-t-elle d'8e'pens'8e' sur ces deux jours ?'
	ELSE
L43F5       STR   'did she spend on both days?'
	FIN
L4411       LDA   #^L43F5
            STA   L1B5A+2
            LDA   #L43F5
            STA   L1B5A
            JSR   L22E9
            LDA   #$0008
            STA   L1E81
            LDA   #$0007
            STA   L1E83
            LDA   #$000F
            STA   L1BD0
L4432       LDA   #$0078
            STA   L1B52
            LDA   #$0058
            STA   L1B54
            JSR   L3D28
            JSR   L2AEF
            RTS

L4445       LDA   #$0006
            STA   L1B56
            LDA   #$0024
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1BD0
            ASL
            ASL
            TAY
            LDA   L4479,Y
            STAL  $000000
            LDA   L4479+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L4479       ADRL  L4485
            ADRL  L453C
            ADRL  L45E1
L4485       JMP   L44B4

	DO	VF
L4488       STR   '    Jenny a ramass'8e' cinq fleurs. Apr'8f's, elle'
	ELSE
L4488       STR   '     Jenny picked five flowers.  Later, she'
	FIN
L44B4       LDA   #^L4488
            STA   L1B5A+2
            LDA   #L4488
            STA   L1B5A
            JSR   L22E9
            JMP   L44EE

	DO	VF
L44C6       STR   'en prend trois de plus. Elle en ach'8f'te'
	ELSE
L44C6       STR   'picked three more.  Then she bought two'
	FIN
L44EE       LDA   #^L44C6
            STA   L1B5A+2
            LDA   #L44C6
            STA   L1B5A
            JSR   L22E9
            JMP   L4524

	DO	VF
L4500       STR   'deux de plus. Quelle est la somme de fleurs ?'
	ELSE
L4500       STR   'more.  Find the sum of the flowers.'
	FIN
L4524       LDA   #^L4500
            STA   L1B5A+2
            LDA   #L4500
            STA   L1B5A
            JSR   L22E9
            LDA   #$000A
            STA   L1BD0
            JMP   L46B8
L453C       JMP   L456C

	DO	VF
L453F       STR   '    Jill a trouv'8e' sept pierres. Elle en trouve'
	ELSE
L453F       STR   '     Jill found seven rocks.  Then she found'
	FIN
L456C       LDA   #^L453F
            STA   L1B5A+2
            LDA   #L453F
            STA   L1B5A
            JSR   L22E9
            JMP   L45AC

	DO	VF
L457E       STR   'trois de plus. Puis, elle en trouve une autre.'
	ELSE
L457E       STR   'three more.  Later, she found one more.  Find'
	FIN
L45AC       LDA   #^L457E
            STA   L1B5A+2
            LDA   #L457E
            STA   L1B5A
            JSR   L22E9
            JMP   L45C9

	DO	VF
L45BE       STR   'Trouve le total de pierres.'
	ELSE
L45BE       STR   'the total.'
	FIN
L45C9       LDA   #^L45BE
            STA   L1B5A+2
            LDA   #L45BE
            STA   L1B5A
            JSR   L22E9
            LDA   #$000B
            STA   L1BD0
            JMP   L46B8
L45E1       JMP   L4610

	DO	VF
L45E4       STR   '    Trois astronautes vont dans l'27'espace. Deux'
	ELSE
L45E4       STR   '     Three astronauts went into space.  Two'
	FIN
L4610       LDA   #^L45E4
            STA   L1B5A+2
            LDA   #L45E4
            STA   L1B5A
            JSR   L22E9
            JMP   L464A

	DO	VF
L4622       STR   'y '8e'taient d'8e'j'88'. Puis un autre les rejoint.'
	ELSE
L4622       STR   'were already in space.  Later, one more'
	FIN
L464A       LDA   #^L4622
            STA   L1B5A+2
            LDA   #L4622
            STA   L1B5A
            JSR   L22E9
            JMP   L4685

	DO	VF
L465C       STR   'Combien '8e'taient-ils dans l'27'espace ?'
	ELSE
L465C       STR   'went into space.  How many were in space'
	FIN
L4685       LDA   #^L465C
            STA   L1B5A+2
            LDA   #L465C
            STA   L1B5A
            JSR   L22E9
            JMP   L46A3

	DO	VF
L4697       STR   'altogether?'
	ELSE
L4697       STR   'altogether?'
	FIN
L46A3       LDA   #^L4697
            STA   L1B5A+2
            LDA   #L4697
            STA   L1B5A
            JSR   L22E9
            LDA   #$0006
            STA   L1BD0
L46B8       CLC
            LDA   #$0052
            STA   L1C60
            LDA   #$008F
            STA   L1C62
            LDA   #$0067
            ADC   #$0001
            STA   L1C5E
            LDA   #$00AE
            ADC   #$0001
            STA   L1C64
            LDA   #$0009
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0056
            STA   L1C60
            LDA   #$0093
            STA   L1C62
            LDA   #$0064
            ADC   #$0001
            STA   L1C5E
            LDA   #$00AA
            ADC   #$0001
            STA   L1C64
            LDA   #$0008
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            JSR   L2AEF
            RTS

L471E       LDA   #$0006
            STA   L1B56
            LDA   #$0024
            STA   L1B58
            LDA   #$0009
            STA   L1B5E
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1BD0
            ASL
            ASL
            TAY
            LDA   L4752,Y
            STAL  $000000
            LDA   L4752+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L4752       ADRL  L477A
            ADRL  L4819
            ADRL  L48DA
            ADRL  L49C2
            ADRL  L4A7A
            ADRL  L4B19
            ADRL  L4BA0
            ADRL  L4C5C
            ADRL  L4D13
            ADRL  L4E10
L477A       JMP   L47AC

	DO	VF
L477D       STR   '    94 cr'8e'atures sont dans une navette.'
	ELSE
L477D       STR   '     94 creatures are on a spaceship.  65 more'
	FIN
L47AC       LDA   #^L477D
            STA   L1B5A+2
            LDA   #L477D
            STA   L1B5A
            JSR   L22E9
            JMP   L47EA

	DO	VF
L47BE       STR   '65 de plus montent. Combien de cr'8e'atures'
	ELSE
L47BE       STR   'get on.  How many creatures are on board in'
	FIN
L47EA       LDA   #^L47BE
            STA   L1B5A+2
            LDA   #L47BE
            STA   L1B5A
            JSR   L22E9
            JMP   L4801

	DO	VF
L47FC       STR   'y a-t-il '88' bord au total ?'
	ELSE
L47FC       STR   'all?'
	FIN
L4801       LDA   #^L47FC
            STA   L1B5A+2
            LDA   #L47FC
            STA   L1B5A
            JSR   L22E9
            LDA   #$009F
            STA   L1BD0
            JMP   L4F06
L4819       JMP   L484A

	DO	VF
L481C       STR   '    Dr. Frankenstein organise une f'90'te.'
	ELSE
L481C       STR   '     Dr. Frankenstein was having a big party.'
	FIN
L484A       LDA   #^L481C
            STA   L1B5A+2
            LDA   #L481C
            STA   L1B5A
            JSR   L22E9
            JMP   L4886

	DO	VF
L485C       STR   'Il invite 98 loups-garous et 30 vampires.'
	ELSE
L485C       STR   'He invited 98 werewolves and 30 vampires.'
	FIN
L4886       LDA   #^L485C
            STA   L1B5A+2
            LDA   #L485C
            STA   L1B5A
            JSR   L22E9
            JMP   L48C2

	DO	VF
L4898       STR   'Combien de cr'8e'atures a-t-il invit'8e'es ?'
	ELSE
L4898       STR   'How many strange creatures did he invite?'
	FIN
L48C2       LDA   #^L4898
            STA   L1B5A+2
            LDA   #L4898
            STA   L1B5A
            JSR   L22E9
            LDA   #$0080
            STA   L1BD0
            JMP   L4F06
L48DA       JMP   L490A

	DO	VF
L48DD       STR   '    Tazzie, le chien de Joan aime se promener.'
	ELSE
L48DD       STR   '     Joan'27's dog, Tazzie, likes to roam.  The'
	FIN
L490A       LDA   #^L48DD
            STA   L1B5A+2
            LDA   #L48DD
            STA   L1B5A
            JSR   L22E9
            JMP   L4947

	DO	VF
L491C       STR   'Le premier jour, il a parcouru 13 kilom'8f'tres'
	ELSE
L491C       STR   'first day, he wandered 13 miles.  The next'
	FIN
L4947       LDA   #^L491C
            STA   L1B5A+2
            LDA   #L491C
            STA   L1B5A
            JSR   L22E9
            JMP   L4985

	DO	VF
L4959       STR   'et 93 le jour suivant. Combien de kilom'8f'tres'
	ELSE
L4959       STR   'day he walked 93 miles.  How many miles did'
	FIN
L4985       LDA   #^L4959
            STA   L1B5A+2
            LDA   #L4959
            STA   L1B5A
            JSR   L22E9
            JMP   L49AA

	DO	VF
L4997       STR   'a-t-il parcouru sur ces deux jours ?'
	ELSE
L4997       STR   'he roam both days?'
	FIN
L49AA       LDA   #^L4997
            STA   L1B5A+2
            LDA   #L4997
            STA   L1B5A
            JSR   L22E9
            LDA   #$006A
            STA   L1BD0
            JMP   L4F06
L49C2       JMP   L49F2

	DO	VF
L49C5       STR   '    Superman a sauv'8e' 30 personnes du danger'
	ELSE
L49C5       STR   '     Superman saved 30 people from danger in'
	FIN
L49F2       LDA   #^L49C5
            STA   L1B5A+2
            LDA   #L49C5
            STA   L1B5A
            JSR   L22E9
            JMP   L4A30

	DO	VF
L4A04       STR   'un jour. Le lendemain, il en a sauv'8e' 95.'
	ELSE
L4A04       STR   'one day.  The next day, he saved 95 people.'
	FIN
L4A30       LDA   #^L4A04
            STA   L1B5A+2
            LDA   #L4A04
            STA   L1B5A
            JSR   L22E9
            JMP   L4A62

	DO	VF
L4A42       STR   'Combien en a-t-il sauv'8e' sur ces deux jours ?'
	ELSE
L4A42       STR   'How many did he save both days?'
	FIN
L4A62       LDA   #^L4A42
            STA   L1B5A+2
            LDA   #L4A42
            STA   L1B5A
            JSR   L22E9
            LDA   #$007D
            STA   L1BD0
            JMP   L4F06
L4A7A       JMP   L4AA9

	DO	VF
L4A7D       STR   '    67 personnes vont '88' un concours de danse.'
	ELSE
L4A7D       STR   '     67 people went to a dance contest.  If'
	FIN
L4AA9       LDA   #^L4A7D
            STA   L1B5A+2
            LDA   #L4A7D
            STA   L1B5A
            JSR   L22E9
            JMP   L4AE3

	DO	VF
L4ABB       STR   'Si 95 autres les rejoignent, combien de'
	ELSE
L4ABB       STR   '95 people join them, how many name tags'
	FIN
L4AE3       LDA   #^L4ABB
            STA   L1B5A+2
            LDA   #L4ABB
            STA   L1B5A
            JSR   L22E9
            JMP   L4B01

	DO	VF
L4AF5       STR   'badges seront n'8e'cessaires ?'
	ELSE
L4AF5       STR   'are needed?'
	FIN
L4B01       LDA   #^L4AF5
            STA   L1B5A+2
            LDA   #L4AF5
            STA   L1B5A
            JSR   L22E9
            LDA   #$00A2
            STA   L1BD0
            JMP   L4F06
L4B19       JMP   L4B49

	DO	VF
L4B1C       STR   '    217 personnes sont dans un train. Si 154'
	ELSE
L4B1C       STR   '     217 people are on a train.  If 154 more'
	FIN
L4B49       LDA   #^L4B1C
            STA   L1B5A+2
            LDA   #L4B1C
            STA   L1B5A
            JSR   L22E9
            JMP   L4B88

	DO	VF
L4B5B       STR   'de plus montent, combien y seront en tout ?'
	ELSE
L4B5B       STR   'get on, how many people are on board in all?'
	FIN
L4B88       LDA   #^L4B5B
            STA   L1B5A+2
            LDA   #L4B5B
            STA   L1B5A
            JSR   L22E9
            LDA   #$0173
            STA   L1BD0
            JMP   L4F06
L4BA0       JMP   L4BD0

	DO	VF
L4BA3       STR   '    Un cin'8e'ma vend 280 tickets en une soir'8e'e'
	ELSE
L4BA3       STR   '     A movie theater sold 280 tickets in one'
	FIN
L4BD0       LDA   #^L4BA3
            STA   L1B5A+2
            LDA   #L4BA3
            STA   L1B5A
            JSR   L22E9
            JMP   L4C0A

	DO	VF
L4BE2       STR   'et 149 tickets la soir'8e'e suivante. Combien'
	ELSE
L4BE2       STR   'night and 149 tickets on another night.'
	FIN
L4C0A       LDA   #^L4BE2
            STA   L1B5A+2
            LDA   #L4BE2
            STA   L1B5A
            JSR   L22E9
            JMP   L4C44

	DO	VF
L4C1C       STR   'de tickets ont '8e't'8e' vendus les deux soirs ?'
	ELSE
L4C1C       STR   'How many tickets were sold both nights?'
	FIN
L4C44       LDA   #^L4C1C
            STA   L1B5A+2
            LDA   #L4C1C
            STA   L1B5A
            JSR   L22E9
            LDA   #$01AD
            STA   L1BD0
            JMP   L4F06
L4C5C       JMP   L4C8D

	DO	VF
L4C5F       STR   '    Un car emm'8f'ne 258 '8e'l'8f'ves '88' l'278e'cole'
	ELSE
L4C5F       STR   '     A school bus took 258 students to school'
	FIN
L4C8D       LDA   #^L4C5F
            STA   L1B5A+2
            LDA   #L4C5F
            STA   L1B5A
            JSR   L22E9
            JMP   L4CC7

	DO	VF
L4C9F       STR   'le lundi et 410 '8e'l'8f'ves le mardi.'
	ELSE
L4C9F       STR   'on Monday and 410 students to school on'
	FIN
L4CC7       LDA   #^L4C9F
            STA   L1B5A+2
            LDA   #L4C9F
            STA   L1B5A
            JSR   L22E9
            JMP   L4CFB

	DO	VF
L4CD9       STR   'Combien d'278e'l'8f'ves sur ces deux jours ?'
	ELSE
L4CD9       STR   'Tuesday.  How many for both days?'
	FIN
L4CFB       LDA   #^L4CD9
            STA   L1B5A+2
            LDA   #L4CD9
            STA   L1B5A
            JSR   L22E9
            LDA   #$029C
            STA   L1BD0
            JMP   L4F06
L4D13       JMP   L4D45

	DO	VF
L4D16       STR   '    Un avions atterrit '88' Paris et embarque'
	ELSE
L4D16       STR   '     A jumbo jet lands in Chicago and picks up'
	FIN
L4D45       LDA   #^L4D16
            STA   L1B5A+2
            LDA   #L4D16
            STA   L1B5A
            JSR   L22E9
            JMP   L4D84

	DO	VF
L4D57       STR   '334 passagers. Puis, il en embarque 411'
	ELSE
L4D57       STR   '334 passengers.  Later, it picks up 411 more'
	FIN
L4D84       LDA   #^L4D57
            STA   L1B5A+2
            LDA   #L4D57
            STA   L1B5A
            JSR   L22E9
            JMP   L4DBF

	DO	VF
L4D96       STR   'de plus '88' Lyon. Combien de passagers'
	ELSE
L4D96       STR   'people in New York.  How many passengers'
	FIN
L4DBF       LDA   #^L4D96
            STA   L1B5A+2
            LDA   #L4D96
            STA   L1B5A
            JSR   L22E9
            JMP   L4DF8

	DO	VF
L4DD1       STR   'seront mont'8e's '88' Paris et '88' Lyon ?'
	ELSE
L4DD1       STR   'got on from both Chicago and New York?'
	FIN
L4DF8       LDA   #^L4DD1
            STA   L1B5A+2
            LDA   #L4DD1
            STA   L1B5A
            JSR   L22E9
            LDA   #$02E9
            STA   L1BD0
            JMP   L4F06
L4E10       JMP   L4E43

	DO	VF
L4E13       STR   '    Un cirque s'27'installe pour deux nuits.'
	ELSE
L4E13       STR   '     A circus came to town for two nights.  250'
	FIN
L4E43       LDA   #^L4E13
            STA   L1B5A+2
            LDA   #L4E13
            STA   L1B5A
            JSR   L22E9
            JMP   L4E7F

	DO	VF
L4E55       STR   '250 personnes y vont le premier soir et 52'
	ELSE
L4E55       STR   'people attended on the first night and 52'
	FIN
L4E7F       LDA   #^L4E55
            STA   L1B5A+2
            LDA   #L4E55
            STA   L1B5A
            JSR   L22E9
            JMP   L4EBC

	DO	VF
L4E91       STR   'le second soir. Combien de personnes seront'
	ELSE
L4E91       STR   'came on the second night.  How many people'
	FIN
L4EBC       LDA   #^L4E91
            STA   L1B5A+2
            LDA   #L4E91
            STA   L1B5A
            JSR   L22E9
            JMP   L4EF1

	DO	VF
L4ECE       STR   'venues au cirque sur les deux soirs?'
	ELSE
L4ECE       STR   'came to the circus on both nights?'
	FIN
L4EF1       LDA   #^L4ECE
            STA   L1B5A+2
            LDA   #L4ECE
            STA   L1B5A
            JSR   L22E9
            LDA   #$012E
            STA   L1BD0
L4F06       CLC
            LDA   #$0052
            STA   L1C60
            LDA   #$008B
            STA   L1C62
            LDA   #$0067
            ADC   #$0001
            STA   L1C5E
            LDA   #$00B2
            ADC   #$0001
            STA   L1C64
            LDA   #$0009
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0056
            STA   L1C60
            LDA   #$008F
            STA   L1C62
            LDA   #$0064
            ADC   #$0001
            STA   L1C5E
            LDA   #$00AE
            ADC   #$0001
            STA   L1C64
            LDA   #$0008
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            JSR   L2AEF
            RTS

L4F6C       LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0077
            STA   L1B58
            LDA   #$0008
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            JMP   L4FB7

	DO	VF
L4F8C       STR   '    Saisis le premier nombre puis'
	ELSE
L4F8C       STR   '     Please type in the first number, then'
	FIN
L4FB7       LDA   #^L4F8C
            STA   L1B5A+2
            LDA   #L4F8C
            STA   L1B5A
            JSR   L22E9
            JMP   L4FD7

	DO	VF
L4FC9       STR   'appuie sur ENTREE.'
	ELSE
L4FC9       STR   'press RETURN.'
	FIN
L4FD7       LDA   #^L4FC9
            STA   L1B5A+2
            LDA   #L4FC9
            STA   L1B5A
            JSR   L22E9
            LDA   L1B52
            STA   L1B56
            LDA   L1B54
            STA   L1B58
            JSR   L2346
            JSR   L240E
            LDA   L1BCE
            STA   L1E85
            CLC
            LDA   #$006E
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$0082
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0002
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            RTS

L5030       LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0077
            STA   L1B58
            LDA   #$0008
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            JMP   L507C

	DO	VF
L5050       STR   '    Saisis le second nombre puis'
	ELSE
L5050       STR   '     Please type in the second number, then'
	FIN
L507C       LDA   #^L5050
            STA   L1B5A+2
            LDA   #L5050
            STA   L1B5A
            JSR   L22E9
            JMP   L509C

	DO	VF
L508E       STR   'appuie sur ENTREE.'
	ELSE
L508E       STR   'press RETURN.'
	FIN
L509C       LDA   #^L508E
            STA   L1B5A+2
            LDA   #L508E
            STA   L1B5A
            JSR   L22E9
            LDA   L1B52
            CLC
            ADC   #$0018
            STA   L1B56
            LDA   L1B54
            STA   L1B58
            JSR   L2346
            JSR   L240E
            LDA   L1BCE
            STA   L1E87
            CLC
            LDA   #$006E
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$0082
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0002
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            RTS

L50F9       LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0077
            STA   L1B58
            LDA   #$0008
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            JMP   L5141

	DO	VF
L5119       STR   '    Saisis la somme puis appuie sur'
	ELSE
L5119       STR   '     Please type in the sum, then press'
	FIN
L5141       LDA   #^L5119
            STA   L1B5A+2
            LDA   #L5119
            STA   L1B5A
            JSR   L22E9
            JMP   L515B

	DO	VF
L5153       STR   'ENTREE.'
	ELSE
L5153       STR   'RETURN.'
	FIN
L515B       LDA   #^L5153
            STA   L1B5A+2
            LDA   #L5153
            STA   L1B5A
            JSR   L22E9
            LDA   L1B52
            CLC
            ADC   #$0030
            STA   L1B56
            LDA   L1B54
            STA   L1B58
            JSR   L2346
            JSR   L240E
            LDA   L1BCE
            STA   L1E89
            CLC
            LDA   #$006E
            STA   L1C60
            LDA   #$0000
            STA   L1C62
            LDA   #$0082
            ADC   #$0001
            STA   L1C5E
            LDA   #$013F
            ADC   #$0001
            STA   L1C64
            LDA   #$0002
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            RTS

L51B8       LDA   L1E85
            CMP   L1E81
            BEQ   L51C3
            JMP   L51D0

L51C3       LDA   L1E87
            CMP   L1E83
            BNE   L51CE
            JMP   L51E0

L51CE       SEC
            RTS

L51D0       CMP   L1E83
            BNE   L51CE
            LDA   L1E87
            CMP   L1E81
            BEQ   L51E0
            JMP   L51CE

L51E0       LDA   L1E89
            CMP   L1BD0
            BEQ   L51EB
            JMP   L51CE

L51EB       CLC
            RTS
L51ED       JMP   L5207

	DO	VF
L51F0       STR   'La bonne r'8e'ponse est '
	ELSE
L51F0       STR   'The correct answer is '
	FIN
L5207       LDA   #^L51F0
            STA   L1B5A+2
            LDA   #L51F0
            STA   L1B5A
            LDA   L1E81
            JSR   L3CEC
            LDA   L1B5A
            STA   L1B60
            LDA   L1B5A+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L5245

L5243       STR   '+'
L5245       LDA   #^L5243
            STA   L1B5A+2
            LDA   #L5243
            STA   L1B5A
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            LDA   L1E83
            JSR   L3CEC
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L52AA

L52A8       STR   '='
L52AA       LDA   #^L52A8
            STA   L1B5A+2
            LDA   #L52A8
            STA   L1B5A
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            LDA   L1BD0
            JSR   L3CEC
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L530F

L530D       STR   '.'
L530F       LDA   #^L530D
            STA   L1B5A+2
            LDA   #L530D
            STA   L1B5A
            LDA   L1B6E
            STA   L1B60
            LDA   L1B6E+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B6E
            STA   L1B68
            LDA   L1B6E+2
            STA   L1B6A
            JSR   L2EFE
            LDA   #^L1B72
            STA   L1B5A+2
            LDA   #L1B72
            STA   L1B5A
            JSR   L2322
            RTS
L5352       JMP   L5357

L5355       DW    $0000
L5357       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L5355
            ASL
            ASL
            ASL
            ASL
            ORA   L5355
            STA   L5355
            LDAL  $E0C022
            AND   #$FF00
            ORA   L5355
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $FFFF
            _ClearScreen
            JSR   L2059
            CLC
            LDA   #$0036
            STA   L1C60
            LDA   #$0072
            STA   L1C62
            LDA   #$0048
            ADC   #$0001
            STA   L1C5E
            LDA   #$00C5
            ADC   #$0001
            STA   L1C64
            LDA   #$0006
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0038
            STA   L1C60
            LDA   #$0074
            STA   L1C62
            LDA   #$0046
            ADC   #$0001
            STA   L1C5E
            LDA   #$00C3
            ADC   #$0001
            STA   L1C64
            LDA   #$000A
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L5411

	DO	VF
L5406       STR   'Ton score'
L5411       PEA   $007B
	ELSE
L5406       STR   'Your score'
L5411       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L5406
            PHA
            LDA   #L5406
            PHA
            _DrawString
            LDA   #$0060
            STA   L1B58
            LDA   #$0023
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L5460

	DO	VF
L544D       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L544D       STR   '     You answered '
	FIN
L5460       LDA   #^L544D
            STA   L1B5A+2
            LDA   #L544D
            STA   L1B5A
            JSR   L22E9
            LDA   L1BFC
            JSR   L3CEC
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L2312
            JMP   L549B

	DO	VF
L5487       STR   ' questions sur 5'
	ELSE
L5487       STR   ' out of 5 questions'
	FIN
L549B       LDA   #^L5487
            STA   L1B5A+2
            LDA   #L5487
            STA   L1B5A
            JSR   L2312
            JMP   L54C9

	DO	VF
L54AD       STR   'correctement au premier essai.'
	ELSE
L54AD       STR   'correctly on the first try.'
	FIN
L54C9       LDA   #^L54AD
            STA   L1B5A+2
            LDA   #L54AD
            STA   L1B5A
            JSR   L22E9
            LDA   L1BFC
            CMP   #$0005
            BEQ   L54E3
            JMP   L551F

L54E3       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0085
            STA   L1B58
            JMP   L5510

	DO	VF
L54F7       STR   'C'27'est un score parfait !'
	ELSE
L54F7       STR   'That is a perfect score!'
	FIN
L5510       LDA   #^L54F7
            STA   L1B5A+2
            LDA   #L54F7
            STA   L1B5A
            JSR   L2322
L551F       JMP   L59A4
L5522       JMP   L5527

L5525       DW    $0000
L5527       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L5525
            ASL
            ASL
            ASL
            ASL
            ORA   L5525
            STA   L5525
            LDAL  $E0C022
            AND   #$FF00
            ORA   L5525
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $FFFF
            _ClearScreen
            JSR   L2059
            CLC
            LDA   #$0036
            STA   L1C60
            LDA   #$0072
            STA   L1C62
            LDA   #$0048
            ADC   #$0001
            STA   L1C5E
            LDA   #$00C5
            ADC   #$0001
            STA   L1C64
            LDA   #$0006
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0038
            STA   L1C60
            LDA   #$0074
            STA   L1C62
            LDA   #$0046
            ADC   #$0001
            STA   L1C5E
            LDA   #$00C3
            ADC   #$0001
            STA   L1C64
            LDA   #$000A
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L55E1

	DO	VF
L55D6       STR   'Ton score'
L55E1       PEA   $007B
	ELSE
L55D6       STR   'Your score'
L55E1       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L55D6
            PHA
            LDA   #L55D6
            PHA
            _DrawString
            LDA   #$0060
            STA   L1B58
            LDA   #$0023
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L5630

	DO	VF
L561D       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L561D       STR   '     You answered '
	FIN
L5630       LDA   #^L561D
            STA   L1B5A+2
            LDA   #L561D
            STA   L1B5A
            JSR   L22E9
            LDA   L1BFC
            JSR   L3CEC
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L2312
            JMP   L566B

	DO	VF
L5657       STR   ' questions sur 3'
	ELSE
L5657       STR   ' out of 3 questions'
	FIN
L566B       LDA   #^L5657
            STA   L1B5A+2
            LDA   #L5657
            STA   L1B5A
            JSR   L2312
            JMP   L5699

	DO	VF
L567D       STR   'correctement au premier essai.'
	ELSE
L567D       STR   'correctly on the first try.'
	FIN
L5699       LDA   #^L567D
            STA   L1B5A+2
            LDA   #L567D
            STA   L1B5A
            JSR   L22E9
            LDA   L1BFC
            CMP   #$0003
            BEQ   L56B3
            JMP   L56EF

L56B3       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0085
            STA   L1B58
            JMP   L56E0

	DO	VF
L56C7       STR   'C'27'est un score parfait !'
	ELSE
L56C7       STR   'That is a perfect score!'
	FIN
L56E0       LDA   #^L56C7
            STA   L1B5A+2
            LDA   #L56C7
            STA   L1B5A
            JSR   L2322
L56EF       JMP   L59A4
L56F2       JMP   L56F7

L56F5       DW    $0000
L56F7       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L56F5
            ASL
            ASL
            ASL
            ASL
            ORA   L56F5
            STA   L56F5
            LDAL  $E0C022
            AND   #$FF00
            ORA   L56F5
            STAL  $E0C022
            JSR   L204A
            JSR   L216F
            PEA   $FFFF
            _ClearScreen
            JSR   L2059
            CLC
            LDA   #$0036
            STA   L1C60
            LDA   #$0072
            STA   L1C62
            LDA   #$0048
            ADC   #$0001
            STA   L1C5E
            LDA   #$00C5
            ADC   #$0001
            STA   L1C64
            LDA   #$0006
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            CLC
            LDA   #$0038
            STA   L1C60
            LDA   #$0074
            STA   L1C62
            LDA   #$0046
            ADC   #$0001
            STA   L1C5E
            LDA   #$00C3
            ADC   #$0001
            STA   L1C64
            LDA   #$000A
            STA   L1C78
            JSR   L21D7
            JSR   L21DF
            JSR   L2197
            JSR   L21C7
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L57B1

	DO	VF
L57A6       STR   'Ton score'
L57B1       PEA   $007B
	ELSE
L57A6       STR   'Your score'
L57B1       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L57A6
            PHA
            LDA   #L57A6
            PHA
            _DrawString
            LDA   #$0060
            STA   L1B58
            LDA   #$0023
            STA   L1B56
            LDA   #$0009
            STA   L1B5E
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L5800

	DO	VF
L57ED       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L57ED       STR   '     You answered '
	FIN
L5800       LDA   #^L57ED
            STA   L1B5A+2
            LDA   #L57ED
            STA   L1B5A
            JSR   L22E9
            LDA   L1BFC
            JSR   L3CEC
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L2312
            JMP   L583C

	DO	VF
L5827       STR   ' questions sur 10'
	ELSE
L5827       STR   ' out of 10 questions'
	FIN
L583C       LDA   #^L5827
            STA   L1B5A+2
            LDA   #L5827
            STA   L1B5A
            JSR   L2312
            JMP   L586A

	DO	VF
L584E       STR   'correctement au premier essai.'
	ELSE
L584E       STR   'correctly on the first try.'
	FIN
L586A       LDA   #^L584E
            STA   L1B5A+2
            LDA   #L584E
            STA   L1B5A
            JSR   L22E9
            LDA   L1BFC
            CMP   #$0000
            BEQ   L5884
            JMP   L58BA

L5884       LDA   L1B58
            CLC
            ADC   L1B5E
            STA   L1B58
            JMP   L58A8

	DO	VF
L5891       STR   'C'27'est un score de 0%.'
	ELSE
L5891       STR   'That is a score of 0%.'
	FIN
L58A8       LDA   #^L5891
            STA   L1B5A+2
            LDA   #L5891
            STA   L1B5A
            JSR   L2322
            JMP   L595D

L58BA       LDA   L1B58
            CLC
            ADC   L1B5E
            STA   L1B58
            JMP   L58DB

	DO	VF
L58C7       STR   'C'27'est un score de '
	ELSE
L58C7       STR   'That is a score of '
	FIN
L58DB       LDA   #^L58C7
            STA   L1B5A+2
            LDA   #L58C7
            STA   L1B5A
            LDA   L1BFC
            JSR   L3CEC
            LDA   L1B5A
            STA   L1B60
            LDA   L1B5A+2
            STA   L1B62
            LDA   L1B9C
            STA   L1B64
            LDA   L1B9C+2
            STA   L1B66
            LDA   L1B9C
            STA   L1B68
            LDA   L1B9C+2
            STA   L1B6A
            JSR   L2EFE
            JMP   L591B

L5917       STR   '0%.'
L591B       LDA   #^L5917
            STA   L1B5A+2
            LDA   #L5917
            STA   L1B5A
            LDA   L1B9C
            STA   L1B60
            LDA   L1B9C+2
            STA   L1B62
            LDA   L1B5A
            STA   L1B64
            LDA   L1B5A+2
            STA   L1B66
            LDA   L1B9C
            STA   L1B68
            LDA   L1B9C+2
            STA   L1B6A
            JSR   L2EFE
            LDA   #^L1BA0
            STA   L1B5A+2
            LDA   #L1BA0
            STA   L1B5A
            JSR   L2322
L595D       LDA   L1BFC
            CMP   #$000A
            BEQ   L5968
            JMP   L59A4

L5968       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$008E
            STA   L1B58
            JMP   L5995

	DO	VF
L597C       STR   'C'27'est un score parfait !'
	ELSE
L597C       STR   'That is a perfect score!'
	FIN
L5995       LDA   #^L597C
            STA   L1B5A+2
            LDA   #L597C
            STA   L1B5A
            JSR   L2322
L59A4       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L1B46
            JSR   L3C50
            RTS

L59B9       LDX   #$0000
L59BC       LDA   L5E13,X
            STA   L5B42,X
            INX
            INX
            CPX   #$0008
            BCC   L59BC
            PEA   $0003
            _IntSource
            PHA
            PEA   $0064
            _GetSCB
            JSR   L1F28
            PLA
            AND   #$000F
            PHA
            LDA   #^L5E33
            PHA
            LDA   #L5E33
            PHA
            _GetColorTable
            JSR   L1F28
            PHA
            PEA   $0064
            _GetSCB
            JSR   L1F28
            PLA
            AND   #$000F
            PHA
            LDA   #^L5E53
            PHA
            LDA   #L5E53
            PHA
            _GetColorTable
            JSR   L1F28
            LDA   #^L5A76
            PHA
            LDA   #L5A76
            PHA
            _SetHeartBeat
            JSR   L1F28
            PEA   $0002
            _IntSource
            RTS

L5A3A       PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L5E33
            PHA
            LDA   #L5E33
            PHA
            _SetColorTable
            JSR   L1F28
            LDA   #^L5A76
            PHA
            LDA   #L5A76
            PHA
            _DelHeartBeat
            JSR   L1F28
            PEA   $0002
            _IntSource
            RTS

L5A76       ADRL  $00000000
L5A7A       DW    $0001
            DW    $A55A
            PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L5B4A
L5A87       JSR   L5AC8
            INC   L5B4A
            INC   L5B4A
            LDA   L5B4A
            CMP   #$0008
            BCC   L5A87
            PHA
            PEA   $0064
            _GetSCB
            JSR   L1F28
            PLA
            AND   #$000F
            PHA
            LDA   #^L5E53
            PHA
            LDA   #L5E53
            PHA
            _SetColorTable
            JSR   L1F28
            LDA   #$0001
            STA   L5A7A
            SEP   #$30
            PLA
            PLB
            RTL

            MX    %00
L5AC8       LDX   L5B4A
            DEC   L5B42,X
            BEQ   L5AD1
            RTS

L5AD1       LDA   L5E13,X
            STA   L5B42,X
            LDA   L5E1B,X
            STA   L5B3E
            LDA   L5E2B,X
            STA   L5B40
L5AE3       LDA   L5B40
            CMP   L5E23,X
            BCC   L5AF3
            BEQ   L5AF3
            LDA   L5E1B,X
            STA   L5B40
L5AF3       LDY   L5B3E
            LDA   L5E33,Y
            LDY   L5B40
            STA   L5E53,Y
            INC   L5B40
            INC   L5B40
            INC   L5B3E
            INC   L5B3E
            LDA   L5B3E
            CMP   L5E23,X
            BCC   L5AE3
            BEQ   L5AE3
            LDA   L5E2B,X
            CLC
            ADC   L5E0B,X
            STA   L5E2B,X
            CMP   #$8000
            BCS   L5B29
            CMP   L5E1B,X
            BCS   L5B30
L5B29       LDA   L5E23,X
            STA   L5E2B,X
            RTS

L5B30       CMP   L5E23,X
            BCC   L5B3D
            BEQ   L5B3D
            LDA   L5E1B,X
            STA   L5E2B,X
L5B3D       RTS

L5B3E       DB    $00
            DB    $00
L5B40       DB    $00
            DB    $00
L5B42       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5B4A       DB    $00
            DB    $00
L5B4C       PHA
            PEA   $0064
            _GetSCB
            JSR   L1F28
            PLA
            AND   #$000F
            STA   L5CBA
            LDA   L5CBA
            PHA
            LDA   #^L5CBC
            PHA
            LDA   #L5CBC
            PHA
            _GetColorTable
            JSR   L1F28
            PEA   $0001
            LDA   #^L5CBC
            PHA
            LDA   #L5CBC
            PHA
            _SetColorTable
            JSR   L1F28
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L1A11
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1F28
            PLA
            STA   $00
            STA   L5E73
            PLA
            STA   $02
            STA   L5E75
            LDY   #$0000
            LDA   [$00],Y
            STA   L5E77
            LDY   #$0002
            LDA   [$00],Y
            STA   L5E79
            LDA   #^L5E81
            STA   L1A21+2
            LDA   #L5E81
            STA   L1A21
            LDA   #$000F
            STA   L1A25
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            LDA   #$00E1
            STA   L1A21+2
            LDA   #$9E00
            STA   L1A21
            PHA
            PHA
            LDA   L5E8E
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L1A25
            PLA
            STA   L1A25+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            LDA   #^L5E90
            STA   L1A21+2
            LDA   #L5E90
            STA   L1A21
            LDA   #$0002
            STA   L1A25
            LDA   #$0000
            STA   L1A25+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            LDA   L5E77
            STA   L1A21
            LDA   L5E79
            STA   L1A21+2
            LDA   #$0320
            STA   L1A25
            LDA   #$0000
            STA   L1A25+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            LDA   L1B28
            STA   L19F9
            LDA   L1B28+2
            STA   L19F9+2
            JSR   L1F5A
            LDA   L19FD
            STA   L1B2C
            LDA   L19FF
            STA   L1B2E
            LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HLock
            JSR   L1F28
            LDA   L1B2C
            STA   L1A21
            LDA   L1B2E
            STA   L1A21+2
            LDA   #$8000
            STA   L1A25
            LDA   #$0000
            STA   L1A25+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1A1F
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L1A2D
            RTS

L5CBA       DW    $0000
L5CBC       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L5CDC       _HideCursor
            LDA   #$00E1
            STA   L1A21+2
            LDA   #$2000
            STA   L1A21
            LDA   L1B2C
            STA   L5E7B
            LDA   L1B2E
            STA   L5E7D
            LDA   #$00C8
            STA   L1A0D
            LDA   #$0000
            STA   L1B4E
L5D07       LDA   #$0000
            STA   L5E7F
            LDA   #$00A0
            STA   L1B44
L5D13       PHA
            LDA   L5E7D
            PHA
            LDA   L5E7B
            PHA
            LDA   L5E77
            STA   $00
            LDA   L5E79
            STA   $02
            LDA   L1B4E
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L1A21
            PHA
            LDA   #L1A21
            PHA
            LDA   #^L1B44
            PHA
            LDA   #L1B44
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L5E7F
            STA   L5E7F
            LDA   L1B44
            BNE   L5D13
            LDA   L5E7B
            CLC
            ADC   L5E7F
            STA   L5E7B
            LDA   L5E7D
            ADC   #$0000
            STA   L5E7D
            LDA   L1B4E
            PHA
            PEA   $0000
            _SetSCB
            JSR   L1F28
            INC   L1B4E
            DEC   L1A0D
            BEQ   L5D82
            JMP   L5D07

L5D82       LDA   L5E75
            PHA
            LDA   L5E73
            PHA
            _DisposeHandle
            JSR   L1F28
            LDA   L5E7B
            CLC
            ADC   #$0009
            STA   L5E7B
            LDA   L5E7D
            ADC   #$0000
            STA   L5E7D
            LDX   #$0000
L5DAA       LDA   L5E7B
            STA   $00
            LDA   L5E7D
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L5DC1
            LDA   #$FFFE
            JMP   L5DC4

L5DC1       LDA   #$0002
L5DC4       STA   L5E0B,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L5E1B,X
            STA   L5E2B,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L5E23,X
            LDA   L5E7B
            CLC
            ADC   #$0008
            STA   L5E7B
            INX
            INX
            CPX   #$0008
            BCS   L5DF4
            JMP   L5DAA

L5DF4       LDA   L1B28+2
            PHA
            LDA   L1B28
            PHA
            _HUnlock
            JSR   L1F28
            RTS

            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E0B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E13       DB    $05
            DB    $00
L5E15       DB    $05
            DB    $00
L5E17       DB    $05
            DB    $00
L5E19       DB    $05
            DB    $00
L5E1B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E23       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E2B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E33       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E53       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E73       DB    $00
            DB    $00
L5E75       DB    $00
            DB    $00
L5E77       DB    $00
            DB    $00
L5E79       DB    $00
            DB    $00
L5E7B       DB    $00
            DB    $00
L5E7D       DB    $00
            DB    $00
L5E7F       DB    $00
            DB    $00
L5E81       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5E8E       DB    $00
            DB    $00
L5E90       DB    $00
            DB    $00
            JSR   L31BA
            JSR   L204A
            JSR   L5CDC
            JSR   L2BA8
            PEA   $0000
            _ClearScreen
            JSR   L2059
            LDA   L1B2C
            STA   $00
            LDA   L1B2E
            STA   $02
            LDA   #$2000
            STA   $04
            LDA   #$00E1
            STA   $06
            LDA   #$5000
            STA   L5EEF
            LDA   #$3E80
            STA   L1A0B
L5ECB       PEA   $0000
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
            DEC   L5EEF
            BNE   L5ECB
            JSR   L2BF1
            RTS

L5EEF       DW    $0000
            JSR   L31BA
            LDA   #$2000
            STA   $00
            LDA   #$00E1
            STA   $02
            LDA   #$4000
            STA   L5F39
            LDA   #$3E80
            STA   L1A0B
L5F0A       PEA   $0000
            _Random
            PLA
            LSR
            LSR
            LSR
            ASL
            ASL
            CMP   #$7CFF
            BCS   L5F0A
            TAY
            LDA   #$0000
            STA   [$00],Y
            INY
            INY
            STA   [$00],Y
            DEC   L5F39
            BNE   L5F0A
            PEA   $0000
            _ClearScreen
            RTS

L5F39       DW    $0000

