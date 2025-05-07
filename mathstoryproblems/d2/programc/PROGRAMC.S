*
* Math Story Problems
*
* (c) 1989, Orange Cherry Software
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

            CLC
            XCE
            REP   #$30
            PHK
            PLB
            _TLStartUp
            PEA   $0000
            _MMStartUp
            PLA
            STA   L0BA4
            JSR   L1056
            LDA   L0BA4
            AND   #$F0FF
            ORA   #$0100
            STA   L0BA6
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L0BA6
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1056
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L0BA8
            LDA   L0BA8
            TAY
            CLC
            ADC   #$0100
            STA   L0BA8
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L0BA4
            PHA
            _EMStartUp
            JSR   L1056
            LDY   L0BA8
            TYA
            CLC
            ADC   #$0300
            STA   L0BA8
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0BA4
            PHA
            JMP   L00A5

L00A3       DW    $0000
L00A5       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L00A3
            ASL
            ASL
            ASL
            ASL
            ORA   L00A3
            STA   L00A3
            LDAL  $E0C022
            AND   #$FF00
            ORA   L00A3
            STAL  $E0C022
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$0001
            STAL  $E0C029
            _QDStartUp
            JSR   L1056
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
            JSR   L1056
            PLA
            STA   L0B96
            PLA
            STA   L0B98
            LDA   L0B98
            PHA
            LDA   L0B96
            PHA
            _GetClip
            JSR   L1056
            PHA
            PHA
            _NewRgn
            JSR   L1056
            PLA
            STA   L0EAC
            PLA
            STA   L0EAC+2
            LDA   L0EAC+2
            PHA
            LDA   L0EAC
            PHA
            _GetClip
            JSR   L1056
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0BA6
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1056
            PLA
            STA   L0CBD
            PLA
            STA   L0CBD+2
            LDA   #$8000
            STA   L0CD3
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0BA6
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1056
            PLA
            STA   L0EE6
            PLA
            STA   L0EE6+2
            JSR   L21A2
            JMP   L01C5

L01B6       STR   'SUBC'
L01BB       DW    $0000       ;  ref num
            ADRL  L01B6       ;  path name
            ADRL  $00000000   ;  reserved
L01C5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01BB
            JSR   L1056
            LDA   L01BB
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L01E3

L01E1       DW    $0000
L01E3       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L01E1
            ASL
            ASL
            ASL
            ASL
            ORA   L01E1
            STA   L01E1
            LDAL  $E0C022
            AND   #$FF00
            ORA   L01E1
            STAL  $E0C022
            JSR   L617E
            LDA   #$0001
            STA   L62B5
            LDA   #$2000
            STA   L0CE5
            JSR   L1D38
            JSR   L5E5B
            STZ   L0CE3
            JSR   L1181
            JSR   L5EDC
L022D       JMP   L0243

L0230       STR   'submenua'
L0239       DW    $0000       ;  ref num
            ADRL  L0230       ;  path name
            ADRL  $00000000   ;  reserved
L0243       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0239
            JSR   L1056
            LDA   L0239
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L0261

L025F       DW    $0000
L0261       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L025F
            ASL
            ASL
            ASL
            ASL
            ORA   L025F
            STA   L025F
            LDAL  $E0C022
            AND   #$FF00
            ORA   L025F
            STAL  $E0C022
            JSR   L617E
            _InitCursor
            _ObscureCursor
            LDA   #^L0E15
            PHA
            LDA   #L0E15
            PHA
            LDA   #$0037
            PHA
            LDA   #$003D
            PHA
            LDA   #$00C3
            CLC
            ADC   #$0001
            PHA
            LDA   #$004D
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L0E70
            LDA   #^L0E1D
            PHA
            LDA   #L0E1D
            PHA
            LDA   #$0037
            PHA
            LDA   #$0052
            PHA
            LDA   #$0115
            CLC
            ADC   #$0001
            PHA
            LDA   #$0062
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0042
            STA   L0E72
            LDA   #^L0E25
            PHA
            LDA   #L0E25
            PHA
            LDA   #$0037
            PHA
            LDA   #$0067
            PHA
            LDA   #$0115
            CLC
            ADC   #$0001
            PHA
            LDA   #$0077
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0043
            STA   L0E74
            LDA   #^L0E2D
            PHA
            LDA   #L0E2D
            PHA
            LDA   #$0037
            PHA
            LDA   #$007C
            PHA
            LDA   #$0113
            CLC
            ADC   #$0001
            PHA
            LDA   #$008C
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0052
            STA   L0E76
            LDA   #$0004
            STA   L0E6E
            JSR   L1D38
            JSR   L1E5D
            LDA   L0DD8
            CMP   #$0052
            BNE   L0365
            JMP   L0B3A

L0365       CMP   #$0041
            BNE   L036D
            JMP   L0378

L036D       CMP   #$0042
            BNE   L0375
            JMP   L0406
L0375       JMP   L0494

L0378       JSR   L2A93
            LDA   #$0005
            STA   L03FE
            LDA   #$0000
            STA   L0D91
            JSR   L21A2
L038A       LDA   #$0001
            STA   L0D93
            LDA   #$0005
            STA   L0BA0
            JSR   L21CE
            STA   L0D65
            JSR   L2A7F
            BCC   L03A4
            JMP   L038A
L03A4       JMP   L03A9

L03A7       DW    $0000
L03A9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L03A7
            ASL
            ASL
            ASL
            ASL
            ORA   L03A7
            STA   L03A7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L03A7
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $2222
            _ClearScreen
            JSR   L113E
            JSR   L4AE3
L03EB       JSR   L38C1
            JSR   L3E1F
            BCS   L03F6
            JMP   L03EB

L03F6       DEC   L03FE
            BEQ   L0400
            JMP   L038A

L03FE       DW    $0000
L0400       JSR   L2BF1
            JMP   L022D

L0406       JSR   L2A93
            LDA   #$0005
            STA   L048C
            LDA   #$0000
            STA   L0D91
            JSR   L21A2
L0418       LDA   #$0001
            STA   L0D93
            LDA   #$0005
            STA   L0BA0
            JSR   L21CE
            STA   L0D65
            JSR   L2A7F
            BCC   L0432
            JMP   L0418
L0432       JMP   L0437

L0435       DW    $0000
L0437       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0435
            ASL
            ASL
            ASL
            ASL
            ORA   L0435
            STA   L0435
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0435
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $2222
            _ClearScreen
            JSR   L113E
            JSR   L4F6E
L0479       JSR   L38C1
            JSR   L3E1F
            BCS   L0484
            JMP   L0479

L0484       DEC   L048C
            BEQ   L048E
            JMP   L0418

L048C       DW    $0000
L048E       JSR   L2BF1
            JMP   L022D

L0494       JSR   L2A93
            LDA   #$0005
            STA   L051A
            LDA   #$0000
            STA   L0D91
            JSR   L21A2
L04A6       LDA   #$0001
            STA   L0D93
            LDA   #$0005
            STA   L0BA0
            JSR   L21CE
            STA   L0D65
            JSR   L2A7F
            BCC   L04C0
            JMP   L04A6
L04C0       JMP   L04C5

L04C3       DW    $0000
L04C5       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L04C3
            ASL
            ASL
            ASL
            ASL
            ORA   L04C3
            STA   L04C3
            LDAL  $E0C022
            AND   #$FF00
            ORA   L04C3
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $2222
            _ClearScreen
            JSR   L113E
            JSR   L53A2
L0507       JSR   L38C1
            JSR   L3E1F
            BCS   L0512
            JMP   L0507

L0512       DEC   L051A
            BEQ   L051C
            JMP   L04A6

L051A       DW    $0000
L051C       JMP   L0521

L051F       DW    $0000
L0521       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L051F
            ASL
            ASL
            ASL
            ASL
            ORA   L051F
            STA   L051F
            LDAL  $E0C022
            AND   #$FF00
            ORA   L051F
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $FFFF
            _ClearScreen
            JSR   L113E
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L0587

	DO	VF
L056E       STR   'Veux-tu continuer ?'
L0587       PEA   $0062
	ELSE
L056E       STR   'Do you want to continue?'
L0587       PEA   $004E
	FIN
            PEA   $004F
            _MoveTo
            LDA   #^L056E
            PHA
            LDA   #L056E
            PHA
            _DrawString
            CLC
            LDA   #$0064
            STA   L0DF5
            LDA   #$0034
            STA   L0DF7
            LDA   #$007A
            ADC   #$0001
            STA   L0DF3
            LDA   #$0071
            ADC   #$0001
            STA   L0DF9
            LDA   #$0004
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0066
            STA   L0DF5
            LDA   #$0036
            STA   L0DF7
            LDA   #$0078
            ADC   #$0001
            STA   L0DF3
            LDA   #$006F
            ADC   #$0001
            STA   L0DF9
            LDA   #$000C
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0068
            STA   L0DF5
            LDA   #$003B
            STA   L0DF7
            LDA   #$0076
            ADC   #$0001
            STA   L0DF3
            LDA   #$0048
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$006A
            STA   L0DF5
            LDA   #$003D
            STA   L0DF7
            LDA   #$0074
            ADC   #$0001
            STA   L0DF3
            LDA   #$0046
            ADC   #$0001
            STA   L0DF9
            LDA   #$000F
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0002
            PHA
            _SetForeColor
            JMP   L0677

	DO	VF
L0675       STR   'O'
	ELSE
L0675       STR   'Y'
	FIN
L0677       PEA   $003E
            PEA   $0073
            _MoveTo
            LDA   #^L0675
            PHA
            LDA   #L0675
            PHA
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            JMP   L06A5

	DO	VF
L06A1       STR   'ui'
	ELSE
L06A1       STR   'es'
	FIN
L06A5       PEA   $0050
            PEA   $0073
            _MoveTo
            LDA   #^L06A1
            PHA
            LDA   #L06A1
            PHA
            _DrawString
            LDA   #^L0E15
            PHA
            LDA   #L0E15
            PHA
            LDA   #$0034
            PHA
            LDA   #$0064
            PHA
            LDA   #$0071
            CLC
            ADC   #$0001
            PHA
            LDA   #$007A
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0059
            STA   L0E70
            CLC
            LDA   #$0064
            STA   L0DF5
            LDA   #$00DB
            STA   L0DF7
            LDA   #$007A
            ADC   #$0001
            STA   L0DF3
            LDA   #$0118
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0066
            STA   L0DF5
            LDA   #$00DD
            STA   L0DF7
            LDA   #$0078
            ADC   #$0001
            STA   L0DF3
            LDA   #$0116
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0068
            STA   L0DF5
            LDA   #$00E2
            STA   L0DF7
            LDA   #$0076
            ADC   #$0001
            STA   L0DF3
            LDA   #$00EF
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$006A
            STA   L0DF5
            LDA   #$00E4
            STA   L0DF7
            LDA   #$0074
            ADC   #$0001
            STA   L0DF3
            LDA   #$00ED
            ADC   #$0001
            STA   L0DF9
            LDA   #$000F
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0002
            PHA
            _SetForeColor
            JMP   L07C1

	DO	VF
L07BF       STR   'N'
	ELSE
L07BF       STR   'N'
	FIN
L07C1       PEA   $00E5
            PEA   $0073
            _MoveTo
            LDA   #^L07BF
            PHA
            LDA   #L07BF
            PHA
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            JMP   L07EE

	DO	VF
L07EB       STR   'on'
	ELSE
L07EB       STR   'o'
	FIN
L07EE       PEA   $00FB
            PEA   $0073
            _MoveTo
            LDA   #^L07EB
            PHA
            LDA   #L07EB
            PHA
            _DrawString
            LDA   #^L0E1D
            PHA
            LDA   #L0E1D
            PHA
            LDA   #$00DB
            PHA
            LDA   #$0064
            PHA
            LDA   #$0118
            CLC
            ADC   #$0001
            PHA
            LDA   #$007A
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$004E
            STA   L0E72
            LDA   #$0002
            STA   L0E6E
            _InitCursor
            LDA   L0E11
            BNE   L084F
            _ObscureCursor
L084F       JSR   L1D38
            JSR   L1E5D
            LDA   L0DD8
            CMP   #$004E
            BEQ   L0860
            JMP   L0866

L0860       JSR   L2BF1
            JMP   L022D
L0866       JMP   L086B

L0869       DW    $0000
L086B       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L0869
            ASL
            ASL
            ASL
            ASL
            ORA   L0869
            STA   L0869
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0869
            STAL  $E0C022
            PEA   $FFFF
            _ClearScreen
            _InitCursor
            LDA   L0E11
            BNE   L08B4
            _ObscureCursor
L08B4       LDA   #$0006
            STA   L0CEB
            LDA   #$0046
            STA   L0CED
            LDA   #$000C
            STA   L0CF3
            LDA   #$0000
            PHA
            _SetForeColor
            JMP   L08FD

	DO	VF
L08D4       STR   '    Dans les probl'8f'mes suivants, il y a'
	ELSE
L08D4       STR   '     In the following problems, too much'
	FIN
L08FD       LDA   #^L08D4
            STA   L0CF1
            LDA   #L08D4
            STA   L0CEF
            JSR   L1201
            JMP   L0925

	DO	VF
L090F       STR   'des informations en trop.'
	ELSE
L090F       STR   'information is given.'
	FIN
L0925       LDA   #^L090F
            STA   L0CF1
            LDA   #L090F
            STA   L0CEF
            JSR   L1201
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            JSR   L2A93
            LDA   #$0003
            STA   L09C8
            JSR   L21A2
L0954       LDA   #$0003
            STA   L0BA0
            JSR   L21CE
            STA   L0D65
            JSR   L2A7F
            BCC   L0968
            JMP   L0954
L0968       JMP   L096D

L096B       DW    $0000
L096D       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L096B
            ASL
            ASL
            ASL
            ASL
            ORA   L096B
            STA   L096B
            LDAL  $E0C022
            AND   #$FF00
            ORA   L096B
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $2222
            _ClearScreen
            JSR   L113E
            JSR   L587F
            LDA   #$0001
            STA   L0D93
L09B5       JSR   L38C1
            JSR   L3E1F
            BCS   L09C0
            JMP   L09B5

L09C0       DEC   L09C8
            BEQ   L09CA
            JMP   L0954

L09C8       DW    $0000
L09CA       JMP   L09CF

L09CD       DW    $0000
L09CF       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L09CD
            ASL
            ASL
            ASL
            ASL
            ORA   L09CD
            STA   L09CD
            LDAL  $E0C022
            AND   #$FF00
            ORA   L09CD
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $FFFF
            _ClearScreen
            JSR   L113E
            _InitCursor
            LDA   L0E11
            BNE   L0A21
            _ObscureCursor
L0A21       LDA   #$0006
            STA   L0CEB
            LDA   #$0046
            STA   L0CED
            LDA   #$000C
            STA   L0CF3
            LDA   #$0000
            PHA
            _SetForeColor
            JMP   L0A66

	DO	VF
L0A41       STR   '    Dans les probl'8f'mes suivants, il y a'
	ELSE
L0A41       STR   '     In the following problems, some'
	FIN
L0A66       LDA   #^L0A41
            STA   L0CF1
            LDA   #L0A41
            STA   L0CEF
            JSR   L1201
            JMP   L0A97

	DO	VF
L0A78       STR   'des informations qui sont manquantes.'
	ELSE
L0A78       STR   'information has been left out.'
	FIN
L0A97       LDA   #^L0A78
            STA   L0CF1
            LDA   #L0A78
            STA   L0CEF
            JSR   L1201
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            JSR   L2A93
            LDA   #$0002
            STA   L0B32
            JSR   L21A2
L0AC6       LDA   #$0002
            STA   L0BA0
            JSR   L21CE
            STA   L0D65
            JSR   L2A7F
            BCC   L0ADA
            JMP   L0AC6
L0ADA       JMP   L0ADF

L0ADD       DW    $0000
L0ADF       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0ADD
            ASL
            ASL
            ASL
            ASL
            ORA   L0ADD
            STA   L0ADD
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0ADD
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $2222
            _ClearScreen
            JSR   L113E
            JSR   L5BD3
            JSR   L423E
            JSR   L45CD
            JSR   L476D
            DEC   L0B32
            BEQ   L0B34
            JMP   L0AC6

L0B32       DW    $0000
L0B34       JSR   L2DE6
            JMP   L022D

L0B3A       JSR   L1942
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L1048
            DW    $0000
            ADRL  L0B4D
L0B4D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0B8E       DB    $00
            DB    $00
L0B90       DB    $00
            DB    $00
L0B92       DB    $00
            DB    $00
L0B94       DB    $00
            DB    $00
L0B96       DB    $00
            DB    $00
L0B98       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0BA0       DB    $00
            DB    $00
L0BA2       DB    $00
            DB    $00
L0BA4       DB    $00
            DB    $00
L0BA6       DB    $00
            DB    $00
L0BA8       DB    $00
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
L0BB4       DW    $0000       ;  ref num
L0BB6       ADRL  $00000000   ;  buffer ptr
L0BBA       ADRL  $00000000   ;  request count
L0BBE       ADRL  $00000000   ;  transfer count
L0BC2       DW    $0000       ;  ref num
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
            ADRL  L0C36
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
            ADRL  L0C36
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0BF0       DW    $0000       ;  ref num
L0BF2       ADRL  $00000000   ;  buffer ptr
L0BF6       ADRL  $00000000   ;  request count
L0BFA       ADRL  $00000000   ;  transfer count
L0BFE       DW    $0000       ;  ref num
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
L0C12       DW    $0000       ;  ref num
            ADRL  $00000000   ;  buffer ptr
L0C18       ADRL  $00000000   ;  request count
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
L0C36       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CBD       ADRL  $00000000
L0CC1       DB    $00
            DB    $00
L0CC3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CCD       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CD1       DB    $00
            DB    $00
L0CD3       DB    $00
            DB    $00
L0CD5       DB    $00
            DB    $00
L0CD7       DB    $00
            DB    $00
L0CD9       DB    $00
            DB    $00
L0CDB       DB    $00
            DB    $00
L0CDD       DB    $00
            DB    $00
L0CDF       DB    $00
            DB    $00
L0CE1       DB    $00
            DB    $00
L0CE3       DB    $00
            DB    $00
L0CE5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CEB       DB    $00
            DB    $00
L0CED       DB    $00
            DB    $00
L0CEF       DB    $00
            DB    $00
L0CF1       DB    $00
            DB    $00
L0CF3       DB    $09
            DB    $00
L0CF5       DB    $00
            DB    $00
L0CF7       DB    $00
            DB    $00
L0CF9       DB    $00
            DB    $00
L0CFB       DB    $00
            DB    $00
L0CFD       DB    $00
            DB    $00
L0CFF       DB    $00
            DB    $00
L0D01       DB    $02
            DB    $00
L0D03       ADRL  L0D07
L0D07       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D31       ADRL  L0D35
L0D35       DB    $00
L0D36       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D5F       DB    $00
            DB    $00
L0D61       DB    $0F
            DB    $00
L0D63       DB    $00
            DB    $00
L0D65       DB    $00
            DB    $00
L0D67       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D91       DB    $00
            DB    $00
L0D93       DB    $00
            DB    $00
L0D95       DB    $00
            DB    $00
L0D97       DB    $00
            DB    $00
L0D99       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            ADRL  L0DA6
            DB    $FF
L0DA6       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DB8       DB    $00
            DB    $00
L0DBA       DB    $00
            DB    $00
L0DBC       DW    $0000       ; event code
L0DBE       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L0DC6       DW    $0000       ; mouse location
L0DC8       DW    $0000
            DW    $0000       ; modifiers
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L0DD4       DB    $00
            DB    $00
L0DD6       DB    $00
            DB    $00
L0DD8       DB    $00
            DB    $00
L0DDA       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DE3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DEB       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0DF3       DB    $00
            DB    $00
L0DF5       DB    $00
            DB    $00
L0DF7       DB    $00
            DB    $00
L0DF9       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E0D       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E11       DB    $00
            DB    $00
L0E13       DB    $00
            DB    $00
L0E15       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E1D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E25       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E2D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E65       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E6E       DB    $00
            DB    $00
L0E70       DB    $00
            DB    $00
L0E72       DB    $00
            DB    $00
L0E74       DB    $00
            DB    $00
L0E76       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E84       ADRL  L0EC6       ; ptr to source locinfo
            ADRL  L0ED6       ; ptr to dest locinfo
            ADRL  L0EFE       ; ptr to source rect
            ADRL  L0EFA       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L0ED6       ; ptr to source locinfo
            ADRL  L0EC6       ; ptr to dest locinfo
            ADRL  L0EFE       ; ptr to source rect
            ADRL  L0EFA       ; ptr to dest point
            DW    $0002       ; mode
L0EAC       ADRL  $00000000   ; clip rgn handle
            ADRL  L0EC6       ; ptr to source locinfo
            ADRL  L0EEA       ; ptr to dest locinfo
            ADRL  L0F0A       ; ptr to source rect
            ADRL  L0F06       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0EC6       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L0ED6       DW    $0000       ; SCB byte
L0ED8       ADRL  $00000000   ; Pointer to pixel image
L0EDC       DW    $0010       ; Width
L0EDE       DW    $0000       ; Bounds rect
L0EE0       DW    $0000
L0EE2       DW    $0014
L0EE4       DW    $0014
L0EE6       ADRL  $00000000
L0EEA       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L0EFA       DW    $0000
            DW    $0000
L0EFE       DW    $0000
            DW    $0000
            DW    $0014
            DW    $0014
L0F06       DW    $0000
            DW    $0000
L0F0A       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0F12       ADRL  L0ED6       ; ptr to source locinfo
            ADRL  L0EC6       ; ptr to dest locinfo
            ADRL  L0F3E       ; ptr to source rect
            ADRL  L0F46       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L0EEA       ; ptr to source locinfo
            ADRL  L0EC6       ; ptr to dest locinfo
            ADRL  L0F4A       ; ptr to source rect
            ADRL  L0F52       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0F3E       DW    $0000
L0F40       DW    $0000
L0F42       DW    $0014
L0F44       DW    $0014
L0F46       DW    $0000
            DW    $0000
L0F4A       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0F52       DW    $0000
            DW    $0000
L0F56       ADRL  L0EC6       ; ptr to source locinfo
            ADRL  L0F6C       ; ptr to dest locinfo
            ADRL  L0F7C       ; ptr to source rect
            ADRL  L0F84       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0F6C       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L0F7C       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L0F84       DW    $0000
            DW    $0000
L0F88       ADRL  L0F6C       ; ptr to source locinfo
            ADRL  L0EC6       ; ptr to dest locinfo
            ADRL  L0F9E       ; ptr to source rect
            ADRL  L0FA6       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0F9E       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L0FA6       DW    $0000
            DW    $0000
L0FAA       DB    $00
            DB    $00
L0FAC       DB    $00
            DB    $00
L0FAE       DB    $00
            DB    $00
L0FB0       HEX   7200000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L0FD0       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L0FF0       HEX   0000CD000900800D720055052F02AF06
            HEX   5008B70FCF02980FD000F00CF902FF0F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1016       DB    $00
            DB    $00
L1018       DB    $00
            DB    $00
L101A       DB    $00
            DB    $00
L101C       DB    $00
            DB    $00
L101E       DB    $00
            DB    $00
L1020       DB    $00
            DB    $00
L1022       DB    $00
            DB    $00
L1024       DB    $00
            DB    $00
L1026       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L102E       DB    $00
            DB    $00
L1030       DB    $00
            DB    $00
L1032       DB    $00
            DB    $00
L1034       DB    $00
            DB    $00
L1036       DB    $00
            DB    $00
L1038       DB    $00
            DB    $00
L103A       DB    $00
            DB    $00
L103C       DB    $00
            DB    $00
L103E       DB    $00
            DB    $00
L1040       DB    $00
            DB    $00
L1042       DB    $00
            DB    $00
L1044       DB    $00
            DB    $00
L1046       DB    $00
            DB    $00
L1048       ADRL  L104E       ;  path name
            DW    $0000       ;  flags
L104E       STR   'program'
L1056       BCS   L1059
            RTS

L1059       PHA
            LDA   #^L106A
            PHA
            LDA   #L106A
            PHA
            _SysFailMgr
            RTS

	DO	VF
L106A       STR   'Erreur applicative ... Oups !'
	ELSE
L106A       STR   'Application failure ... Oops!'
	FIN
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0DB8
            STA   L0B8E
            LDA   L0DBA
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0D95
            LDA   L0B94
            STA   L0D97
            LDA   L0D95
            STA   L0BF2
            LDA   L0D97
            STA   L0BF2+2
            LDA   #$0000
            STA   L0BF6+2
            LDA   #$A000
            STA   L0BF6
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BF0
            JSR   L1056
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0BFE
            JSR   L1056
            LDA   L0BFA
            STA   L0D99
            LDA   #$0000
            STA   L0CE3
            LDX   #$0008
L10EF       LSR   L0D99
            BCC   L10FA
            LDA   #$0001
            STA   L0CE3
L10FA       DEX
            BNE   L10EF
            LDA   L0D99
            CLC
            ADC   L0CE3
            STA   L0D99
            RTS

L1108       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L1108
L111B       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L111B
            RTS

L112F       _GrafOff
            _HideCursor
            RTS

L113E       _GrafOn
            RTS

L1146       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BEQ   L1180
            LDA   L0DBC
            CMP   #$0003
            BNE   L1172
            STZ   L0E11
L1169       LDA   #$0080
            STA   L0CE3
            JMP   L1180

L1172       CMP   #$0001
            BNE   L1180
            LDA   #$8000
            STA   L0E11
            JMP   L1169
L1180       RTS

L1181       LDA   L0CE5
            STA   L119B
            STZ   L0CE3
L118A       JSR   L1146
            LDA   L0CE3
            CMP   #$0000
            BNE   L119A
            DEC   L119B
            BNE   L118A
L119A       RTS

L119B       DW    $0000
            STZ   L0CE3
L11A0       JSR   L1146
            LDA   L0CE3
            CMP   #$0000
            BEQ   L11A0
            RTS

L11AC       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BEQ   L11AC
            LDA   L0DBC
            CMP   #$0003
            BNE   L11AC
            LDA   L0DBE
            AND   #$007F
            CMP   #$0061
            BCC   L11DB
            SEC
            SBC   #$0020
L11DB       CMP   L0DD8
            BNE   L11AC
            RTS

L11E1       PHA
            PEA   $0008
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BEQ   L11E1
            LDA   L0DBE
            AND   #$007F
            STA   L0DD8
            RTS

L1201       LDA   L0CEB
            PHA
            LDA   L0CED
            PHA
            _MoveTo
            LDA   L0CF1
            PHA
            LDA   L0CEF
            PHA
            _DrawString
            LDA   L0CED
            CLC
            ADC   L0CF3
            STA   L0CED
            RTS

L122A       LDA   L0CF1
            PHA
            LDA   L0CEF
            PHA
            _DrawString
            RTS

L123A       PHA
            LDA   L0CF1
            PHA
            LDA   L0CEF
            PHA
            _StringWidth
            PLA
            STA   L125C
            LDA   #$0140
            SEC
            SBC   L125C
            LSR
            STA   L0CEB
            JMP   L1201

L125C       DW    $0000
L125E       JSR   L1D38
            STZ   L0CF3
            STZ   L0D35
L1267       JSR   L11E1
            LDA   L0DD8
            CMP   #$0008
            BEQ   L127A
            CMP   #$007F
            BEQ   L127A
            JMP   L12C2

L127A       LDA   L0D5F
            PHA
            _SetForeColor
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            LDA   L0D35
            AND   #$00FF
            CMP   #$0002
            BCS   L12A2
            JMP   L125E

L12A2       DEC   L0D35
L12A5       LDA   L0D61
            PHA
            _SetForeColor
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            JMP   L1267

L12C2       CMP   #$000D
            BNE   L12D3
            LDA   L0D35
            AND   #$00FF
            BNE   L12D2
            JMP   L1267
L12D2       RTS

L12D3       CMP   #$001B
            BNE   L12DB
            JMP   L0B3A

L12DB       CMP   #$0030
            BCS   L12E3
            JMP   L1267

L12E3       CMP   #$003A
            BCC   L12EB
            JMP   L1267

L12EB       LDA   L0D35
            AND   #$00FF
            CMP   L0D01
            BCC   L12F9
            JMP   L1267

L12F9       LDA   L0D5F
            PHA
            _SetForeColor
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            INC   L0D35
            LDA   L0D35
            AND   #$00FF
            TAY
            LDA   L0DD8
            STA   L0D35,Y
            JMP   L12A5

            CLC
            LDA   #$00B5
            STA   L0DF5
            LDA   #$001A
            STA   L0DF7
            LDA   #$00C2
            ADC   #$0001
            STA   L0DF3
            LDA   #$00B4
            ADC   #$0001
            STA   L0DF9
            LDA   #$000E
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDX   #$0000
L135A       LDA   L0DDA,X
            STA   L0DE3,X
            INX
            INX
            CPX   #$0008
            BNE   L135A
            CLC
            LDA   #$00B5
            STA   L0DF5
            LDA   #$00D0
            STA   L0DF7
            LDA   #$00C2
            ADC   #$0001
            STA   L0DF3
            LDA   #$0124
            ADC   #$0001
            STA   L0DF9
            LDA   #$000D
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDX   #$0000
L139B       LDA   L0DDA,X
            STA   L0DEB,X
            INX
            INX
            CPX   #$0008
            BNE   L139B
            PEA   $0000
            _GetForeColor
            PLA
            STA   L14D5
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L13D9

	DO	VF
L13C4       STR   'Espace : continuer'
	ELSE
L13C4       STR   'Spacebar to continue'
	FIN
L13D9       PEA   $001E
            PEA   $00BF
            _MoveTo
            LDA   #^L13C4
            PHA
            LDA   #L13C4
            PHA
            _DrawString
            JMP   L1404

	DO	VF
L13F8       STR   'ESC : quitter'
L1404       PEA   $00C6
	ELSE
L13F8       STR   'ESC to quit'
L1404       PEA   $00D6
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L13F8
            PHA
            LDA   #L13F8
            PHA
            _DrawString
L1420       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BEQ   L1420
            LDA   L0DBC
            CMP   #$0003
            BEQ   L1443
            JMP   L1472

L1443       _ObscureCursor
            LDA   #$0000
            STA   L0E11
            LDA   L0DBE
            AND   #$007F
            CMP   #$0020
            BEQ   L1463
            CMP   #$001B
            BEQ   L1463
            JMP   L1420

L1463       STA   L0DD8
            LDA   L14D5
            PHA
            _SetForeColor
            RTS

L1472       CMP   #$0001
            BEQ   L147A
            JMP   L1420

L147A       LDA   L0DC6
            STA   L0DD4
            LDA   L0DC8
            STA   L0DD6
            LDA   #$0080
            STA   L0E11
            PEA   $0000
            LDA   #^L0DD4
            PHA
            LDA   #L0DD4
            PHA
            LDA   #^L0DE3
            PHA
            LDA   #L0DE3
            PHA
            _PtInRect
            PLA
            BEQ   L14AF
            LDA   #$0020
            JMP   L1463

L14AF       PEA   $0000
            LDA   #^L0DD4
            PHA
            LDA   #L0DD4
            PHA
            LDA   #^L0DEB
            PHA
            LDA   #L0DEB
            PHA
            _PtInRect
            PLA
            BEQ   L14D2
            LDA   #$001B
            JMP   L1463
L14D2       JMP   L1420

L14D5       DW    $0000
            JSR   L112F
            JSR   L1DB9
            JMP   L14E2

L14E0       DW    $0000
L14E2       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L14E0
            ASL
            ASL
            ASL
            ASL
            ORA   L14E0
            STA   L14E0
            LDAL  $E0C022
            AND   #$FF00
            ORA   L14E0
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L0DF5
            LDA   #$003F
            STA   L0DF7
            LDA   #$007E
            ADC   #$0001
            STA   L0DF3
            LDA   #$00F8
            ADC   #$0001
            STA   L0DF9
            LDA   #$000A
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0041
            STA   L0DF5
            LDA   #$0044
            STA   L0DF7
            LDA   #$007A
            ADC   #$0001
            STA   L0DF3
            LDA   #$00F3
            ADC   #$0001
            STA   L0DF9
            LDA   #$000C
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0060
            STA   L0DF5
            LDA   #$004E
            STA   L0DF7
            LDA   #$0072
            ADC   #$0001
            STA   L0DF3
            LDA   #$00E9
            ADC   #$0001
            STA   L0DF9
            LDA   #$000B
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0063
            STA   L0DF5
            LDA   #$0053
            STA   L0DF7
            LDA   #$006F
            ADC   #$0001
            STA   L0DF3
            LDA   #$0060
            ADC   #$0001
            STA   L0DF9
            LDA   #$000E
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDX   #$0000
L15D5       LDA   L0DDA,X
            STA   L0DEB,X
            INX
            INX
            CPX   #$0008
            BNE   L15D5
            CLC
            LDA   #$0063
            STA   L0DF5
            LDA   #$00C6
            STA   L0DF7
            LDA   #$006F
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D3
            ADC   #$0001
            STA   L0DF9
            LDA   #$000D
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDX   #$0000
L1616       LDA   L0DDA,X
            STA   L0DE3,X
            INX
            INX
            CPX   #$0008
            BNE   L1616
            PEA   $0000
            _GetForeColor
            PLA
            STA   L17F8
            PEA   $0000
            _SetForeColor
            JMP   L164F

	DO	VF
L163E       STR   'Veux-tu vraiment'
	ELSE
L163E       STR   'Are you sure you'
	FIN
L164F       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L163E
            PHA
            LDA   #L163E
            PHA
            _DrawString
            JMP   L167C

	DO	VF
L166E       STR   'quitter le jeu ?'
	ELSE
L166E       STR   'want to quit?'
	FIN
L167C       PEA   $0064
            PEA   $0059
            _MoveTo
            LDA   #^L166E
            PHA
            LDA   #L166E
            PHA
            _DrawString
            JMP   L169F

	DO	VF
L169B       STR   'ui'
	ELSE
L169B       STR   'es'
	FIN
L169F       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L169B
            PHA
            LDA   #L169B
            PHA
            _DrawString
            JMP   L16C1

	DO	VF
L16BE       STR   'on'
	ELSE
L16BE       STR   'o'
	FIN
L16C1       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L16BE
            PHA
            LDA   #L16BE
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L16EC

	DO	VF
L16EA       STR   'O'
	ELSE
L16EA       STR   'Y'
	FIN
L16EC       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L16EA
            PHA
            LDA   #L16EA
            PHA
            _DrawString
            JMP   L170D

	DO	VF
L170B       STR   'N'
	ELSE
L170B       STR   'N'
	FIN
L170D       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L170B
            PHA
            LDA   #L170B
            PHA
            _DrawString
            JSR   L113E
            _InitCursor
L1733       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BEQ   L1733
            LDA   L0DBC
            CMP   #$0003
            BEQ   L1756
            JMP   L1795

L1756       _ObscureCursor
            LDA   #$0000
            STA   L0E11
            LDA   L0DBE
            AND   #$007F
            CMP   #$0061
            BCC   L1772
            SEC
            SBC   #$0020
L1772       CMP   #$0059
            BEQ   L177F
            CMP   #$004E
            BEQ   L177F
            JMP   L1733

L177F       STA   L0DD8
            LDA   L17F8
            PHA
            _SetForeColor
            _HideCursor
            RTS

L1795       CMP   #$0001
            BEQ   L179D
            JMP   L1733

L179D       LDA   L0DC6
            STA   L0DD4
            LDA   L0DC8
            STA   L0DD6
            LDA   #$0080
            STA   L0E11
            PEA   $0000
            LDA   #^L0DD4
            PHA
            LDA   #L0DD4
            PHA
            LDA   #^L0DE3
            PHA
            LDA   #L0DE3
            PHA
            _PtInRect
            PLA
            BEQ   L17D2
            LDA   #$004E
            JMP   L177F

L17D2       PEA   $0000
            LDA   #^L0DD4
            PHA
            LDA   #L0DD4
            PHA
            LDA   #^L0DEB
            PHA
            LDA   #L0DEB
            PHA
            _PtInRect
            PLA
            BEQ   L17F5
            LDA   #$0059
            JMP   L177F
L17F5       JMP   L1733

L17F8       DW    $0000
            JSR   L112F
            JSR   L1DB9
            CLC
            LDA   #$0037
            STA   L0DF5
            LDA   #$003B
            STA   L0DF7
            LDA   #$0089
            ADC   #$0001
            STA   L0DF3
            LDA   #$0104
            ADC   #$0001
            STA   L0DF9
            LDA   #$000B
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$003F
            STA   L0DF5
            LDA   #$0044
            STA   L0DF7
            LDA   #$0081
            ADC   #$0001
            STA   L0DF3
            LDA   #$00FB
            ADC   #$0001
            STA   L0DF9
            LDA   #$000E
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L1886

	DO	VF
L1870       STR   'Merci d'27'avoir utilis'8e
	ELSE
L1870       STR   'Thank you for running'
	FIN
L1886       PEA   $0055
            PEA   $004F
            _MoveTo
            LDA   #^L1870
            PHA
            LDA   #L1870
            PHA
            _DrawString
            JMP   L18B2

	DO	VF
L18A5       STR   'le programme.'
L18B2       PEA   $0072
	ELSE
L18A5       STR   'the program.'
L18B2       PEA   $007A
	FIN
            PEA   $005A
            _MoveTo
            LDA   #^L18A5
            PHA
            LDA   #L18A5
            PHA
            _DrawString
            PEA   $000B
            _SetForeColor
            JMP   L18F1

	DO	VF
L18DB       STR   'Eteins l'27'ordinateur'
L18F1       PEA   $004B
	ELSE
L18DB       STR   'Turn off the computer'
L18F1       PEA   $0053
	FIN
            PEA   $006B
            _MoveTo
            LDA   #^L18DB
            PHA
            LDA   #L18DB
            PHA
            _DrawString
            JMP   L191B

	DO	VF
L1910       STR   'ou red'8e'marre.'
L191B       PEA   $0074
	ELSE
L1910       STR   'or reboot.'
L191B       PEA   $0080
	FIN
            PEA   $0076
            _MoveTo
            LDA   #^L1910
            PHA
            LDA   #L1910
            PHA
            _DrawString
            JSR   L113E
            _HideCursor
            STP
L1942       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L0BA6
            PHA
            _DisposeAll
            JSR   L1056
            LDA   L0BA4
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L198D       LDA   L0CBD
            STA   L0B8E
            LDA   L0CBD+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0CC1
            LDA   L0B94
            STA   L0CC3
            PEA   $0000
            LDA   #^L0CCD
            PHA
            LDA   #L0CCD
            PHA
            LDA   #^L0CD1
            PHA
            LDA   #L0CD1
            PHA
            LDA   L0CC3
            PHA
            LDA   L0CC1
            PHA
            LDA   L0CD3
            PHA
            _PackBytes
            PLA
            STA   L0C18
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L0C12
            JSR   L1056
            LDA   L0CD1
            BNE   L198D
            RTS

L19E5       _HideCursor
            LDA   L0CBD
            STA   L0B8E
            LDA   L0CBD+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0CC1
            LDA   L0B94
            STA   L0CC3
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HLock
            JSR   L1056
            PEA   $00E1
            PEA   $2000
            LDA   L0CC3
            PHA
            LDA   L0CC1
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L1A35       _HideCursor
            LDA   L0CC3
            PHA
            LDA   L0CC1
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HUnlock
            JSR   L1056
            RTS

            _HideCursor
            LDA   #^L0F56
            PHA
            LDA   #L0F56
            PHA
            _PaintPixels
            JSR   L1056
            RTS

            _HideCursor
            LDA   #^L0F88
            PHA
            LDA   #L0F88
            PHA
            _PaintPixels
            JSR   L1056
            RTS

L1A9E       _HideCursor
            LDA   L0CBD
            STA   L0B8E
            LDA   L0CBD+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0CC1
            LDA   L0B94
            STA   L0CC3
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HLock
            JSR   L1056
            PEA   $00E1
            PEA   $2000
            LDA   L0CC3
            PHA
            LDA   L0CC1
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L1AEE       _HideCursor
            LDA   L0CC3
            PHA
            LDA   L0CC1
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HUnlock
            JSR   L1056
            RTS

            _HideCursor
            LDA   L0EE6
            STA   L0B8E
            LDA   L0EE6+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0ED8
            LDA   L0B94
            STA   L0ED8+2
            LDA   #^L0E84
            PHA
            LDA   #L0E84
            PHA
            _PaintPixels
            JSR   L1056
            _InitCursor
            RTS

L1B5F       _HideCursor
            LDA   L0EE6
            STA   L0B8E
            LDA   L0EE6+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0ED8
            LDA   L0B94
            STA   L0ED8+2
            LDA   #^L0F12
            PHA
            LDA   #L0F12
            PHA
            _PaintPixels
            JSR   L1056
            RTS

            LDA   #^L0FAA
            STA   L0BB6+2
            LDA   #L0FAA
            STA   L0BB6
            LDA   #$0000
            STA   L0BBA+2
            LDA   #$0006
            STA   L0BBA
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            LDA   L0CBD
            STA   L0B8E
            LDA   L0CBD+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0CC1
            LDA   L0B94
            STA   L0CC3
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HLock
            JSR   L1056
            LDA   L0CC1
            STA   L0BB6
            LDA   L0CC3
            STA   L0BB6+2
            LDA   #$8000
            STA   L0BBA
            LDA   #$0000
            STA   L0BBA+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0BC2
            LDA   #$0028
            STA   L0CED
            LDA   L0EE6
            STA   L0B8E
            LDA   L0EE6+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0ED8
            LDA   L0B94
            STA   L0ED8+2
            LDA   L0ED8
            STA   L0CD5
            LDA   L0ED8+2
            STA   L0CD7
            LDA   L0FAA
            STA   L0CD9
L1C42       PHA
            LDA   L0CC3
            PHA
            LDA   L0CC1
            PHA
            LDA   L0BBE
            PHA
            LDA   #^L0CD5
            PHA
            LDA   #L0CD5
            PHA
            LDA   #^L0CD9
            PHA
            LDA   #L0CD9
            PHA
            _UnPackBytes
            PLA
            LDA   L0CD9
            BNE   L1C42
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HUnlock
            JSR   L1056
            RTS

            LDA   #$0000
            STA   L0EDE
            STA   L0EE0
            STA   L0F3E
            STA   L0F40
            LDA   L0FAC
            STA   L0EE2
            STA   L0F42
            LDA   L0FAE
            STA   L0EE4
            STA   L0F44
            LSR
            CLC
            ADC   #$0001
            STA   L0EDC
            _HideCursor
            JSR   L1B5F
            RTS

            LDA   L0CEF
            STA   $00
            LDA   L0CF1
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L0BA2
            LDA   #$0001
            STA   L1D34
            PHA
            LDA   L0CF1
            PHA
            LDA   L0CEF
            PHA
            _StringWidth
            PLA
            STA   L1D36
            LDA   #$0140
            SEC
            SBC   L1D36
            LSR
            PHA
            LDA   L0CED
            PHA
            _MoveTo
L1CF6       LDA   L0CEF
            STA   $00
            LDA   L0CF1
            STA   $02
            LDY   L1D34
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0061
            BCC   L1D11
            SEC
            SBC   #$0020
L1D11       STA   L0DD8
            JSR   L11AC
            LDA   L0DD8
            PHA
            _DrawChar
            INC   L1D34
            DEC   L0BA2
            BNE   L1CF6
            LDA   #$000D
            STA   L0DD8
            JSR   L11AC
            RTS

L1D34       DW    $0000
L1D36       DW    $0000
L1D38       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L1D48       LDA   #$0000
            STA   L0E13
            LDA   L0B8E
            STA   $00
            LDA   L0B90
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L0B92
            LDY   #$0002
            LDA   [$00],Y
            STA   L0B94
            LDA   L0B92
            BNE   L1D75
            LDA   L0B94
            BNE   L1D75
            JMP   L1D76
L1D75       RTS

L1D76       LDA   L0B90
            PHA
            LDA   L0B8E
            PHA
            _RestoreHandle
            JSR   L1056
            LDA   #$8000
            STA   L0E13
            JMP   L1D48

            PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L0FB0
            PHA
            LDA   #L0FB0
            PHA
            _SetColorTable
            RTS

L1DB9       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L0FD0
            PHA
            LDA   #L0FD0
            PHA
            _SetColorTable
            RTS

L1DE1       PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L0FF0
            PHA
            LDA   #L0FF0
            PHA
            _SetColorTable
            RTS

L1E09       LDA   #^L0DDA
            PHA
            LDA   #L0DDA
            PHA
            LDA   L0DF7
            PHA
            LDA   L0DF5
            PHA
            LDA   L0DF9
            PHA
            LDA   L0DF3
            PHA
            _SetRect
            RTS

            LDA   #^L0DDA
            PHA
            LDA   #L0DDA
            PHA
            _FrameRect
            RTS

L1E39       LDA   #^L0DDA
            PHA
            LDA   #L0DDA
            PHA
            _PaintRect
            RTS

L1E49       _PenNormal
            RTS

L1E51       LDA   L0E0D
            PHA
            _SetSolidPenPat
            RTS

L1E5D       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BEQ   L1E5D
            LDA   L0DBC
            CMP   #$0003
            BEQ   L1E80
            JMP   L1ED9

L1E80       LDA   L0DBE
            AND   #$007F
            CMP   #$0061
            BCC   L1E8F
            SEC
            SBC   #$0020
L1E8F       STA   L0DD8
            _ObscureCursor
            LDA   #$0000
            STA   L0E11
            LDA   L0DD8
            CMP   #$001B
            BNE   L1EAA
            JMP   L0B3A

L1EAA       LDA   #$0001
            STA   L1F64
            LDA   #$0000
            STA   L1F62
L1EB6       LDX   L1F62
            LDA   L0E70,X
            CMP   L0DD8
            BNE   L1EC2
            RTS

L1EC2       LDA   L1F64
            CMP   L0E6E
            BEQ   L1ED6
            INC   L1F64
            INC   L1F62
            INC   L1F62
            JMP   L1EB6
L1ED6       JMP   L1E5D

L1ED9       CMP   #$0001
            BEQ   L1EE1
            JMP   L1E5D

L1EE1       LDA   L0DC6
            STA   L0DD4
            LDA   L0DC8
            STA   L0DD6
            LDA   #$0080
            STA   L0E11
            LDA   #$0000
            STA   L1F60
            STA   L1F62
            LDA   #$0001
            STA   L1F64
L1F02       LDY   #$0000
            LDX   L1F60
L1F08       LDA   L0E15,X
            STA   L0E65,Y
            INX
            INY
            CPY   #$0008
            BCC   L1F08
            PEA   $0000
            LDA   #^L0DD4
            PHA
            LDA   #L0DD4
            PHA
            LDA   #^L0E65
            PHA
            LDA   #L0E65
            PHA
            _PtInRect
            PLA
            BEQ   L1F35
            JMP   L1F56

L1F35       LDA   L1F64
            CMP   L0E6E
            BNE   L1F40
            JMP   L1E5D

L1F40       INC   L1F64
            INC   L1F62
            INC   L1F62
            LDA   L1F60
            CLC
            ADC   #$0008
            STA   L1F60
            JMP   L1F02

L1F56       LDX   L1F62
            LDA   L0E70,X
            STA   L0DD8
            RTS

L1F60       DW    $0000
L1F62       DW    $0000
L1F64       DW    $0000
L1F66       PHA
            LDA   #^L0D36
            PHA
            LDA   #L0D36
            PHA
            LDA   L0D35
            AND   #$00FF
            PHA
            PEA   $0000
            _Dec2Int
            JSR   L1056
            PLA
            STA   L0D63
            RTS

L1F88       LDA   #L2061
            STA   $04
            LDA   #^L2061
            STA   $06
            LDA   L0CF5
            STA   $00
            LDA   L0CF7
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L205E
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L1FB9       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L205E
            BNE   L1FB9
            LDA   L2060
            AND   #$FF00
            ORA   L205E
            STA   L2060
            LDA   L0CF9
            STA   $00
            LDA   L0CFB
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L205E
            LDA   L2060
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
L2008       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L205E
            BNE   L2008
            LDA   L2060
            CLC
            ADC   L205E
            STA   L2060
            LDA   L0CFD
            STA   $00
            LDA   L0CFF
            STA   $02
            LDA   #L2061
            STA   $04
            LDA   #^L2061
            STA   $06
            LDA   L2060
            AND   #$00FF
            LDY   #$0000
            STA   [$00],Y
            AND   #$00FF
            STA   L205E
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L2053       LDA   [$04],Y
            STA   [$00],Y
            INY
            CPY   L205E
            BNE   L2053
            RTS

L205E       DB    $00
            DB    $00
L2060       DB    $00
L2061       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
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
            LDA   L0CDB
            AND   #$000F
            PHA
            LDA   L0CDD
            AND   #$000F
            JSR   L219B
            STA   L21A0
            LDA   L0CDF
            AND   #$000F
            ORA   L21A0
            JSR   L219B
            STA   L21A0
            LDA   L0CE1
            AND   #$000F
            ORA   L21A0
            PHA
            _SetColorEntry
            JSR   L1056
            RTS

L219B       ASL
            ASL
            ASL
            ASL
            RTS

L21A0       DW    $0000
L21A2       LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            _ReadTimeHex
            PLA
            STA   L21CA
            PLA
            STA   L21CC
            PLA
            PLA
            LDA   L21CC
            PHA
            LDA   L21CA
            PHA
            _SetRandSeed
            RTS

L21CA       DW    $0000
L21CC       DW    $0000
L21CE       PEA   $0000
            _Random
            PLA
            STA   L2225
            PEA   $0000
            PEA   $0000
            LDA   L0BA0
            PHA
            LDA   L2225
            PHA
            _Multiply
            PLA
            STA   L2227
            PLA
            STA   L2229
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDA   L2229
            PHA
            LDA   L2227
            PHA
            LDA   #$0001
            PHA
            LDA   #$0000
            PHA
            _LongDivide
            JSR   L1056
            PLA
            STA   L2225
            PLA
            PLA
            PLA
            LDA   L2225
            RTS

L2225       DW    $0000
L2227       DW    $0000
L2229       DW    $0000
L222B       LDA   L2281
            CMP   L227F
            BCC   L224C
            JSR   L21A2
            LDA   #$0000
            STA   L2281
            LDX   #$0000
L223F       CPX   #$0027
            BCS   L224C
            STA   L2283,X
            INX
            INX
            JMP   L223F

L224C       LDA   L227F
            STA   L0BA0
            JSR   L21CE
            STA   L22AB
            ASL
            TAX
            LDA   L2283,X
            BNE   L224C
            LDA   #$0001
            STA   L2283,X
            INC   L2281
            LDA   L22AB
            ASL
            ASL
            TAY
            LDA   L22AD,Y
            STAL  $000000
            LDA   L22AD+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L227F       DB    $11
            DB    $00
L2281       DB    $00
            DB    $00
L2283       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L22AB       DB    $00
            DB    $00
L22AD       ADRL  L22F1
            ADRL  L235C
            ADRL  L23CD
            ADRL  L2438
            ADRL  L24A6
            ADRL  L251A
            ADRL  L2585
            ADRL  L25F0
            ADRL  L2661
            ADRL  L26D2
            ADRL  L2743
            ADRL  L27C0
            ADRL  L2834
            ADRL  L28AB
            ADRL  L2916
            ADRL  L2987
            ADRL  L29F8
L22F1       JMP   L2306

L22F4       STR   '0/GOODA'
L22FC       DW    $0000       ;  ref num
            ADRL  L22F4       ;  path name
            ADRL  $00000000   ;  reserved
L2306       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L22FC
            JSR   L1056
            LDA   L22FC
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2324

L2322       DW    $0000
L2324       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0006
            STAL  $E0C034
            LDA   #$0006
            STA   L2322
            ASL
            ASL
            ASL
            ASL
            ORA   L2322
            STA   L2322
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2322
            STAL  $E0C022
            JSR   L617E
            LDA   #$0004
            STA   L62B5
            JMP   L2A69
L235C       JMP   L2371

L235F       STR   '0/GOODB'
L2367       DW    $0000       ;  ref num
            ADRL  L235F       ;  path name
            ADRL  $00000000   ;  reserved
L2371       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2367
            JSR   L1056
            LDA   L2367
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L238F

L238D       DW    $0000
L238F       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L238D
            ASL
            ASL
            ASL
            ASL
            ORA   L238D
            STA   L238D
            LDAL  $E0C022
            AND   #$FF00
            ORA   L238D
            STAL  $E0C022
            JSR   L617E
            LDA   #$0002
            STA   L62B5
            STA   L62B7
            STA   L62B9
            JMP   L2A69
L23CD       JMP   L23E2

L23D0       STR   '0/GOODC'
L23D8       DW    $0000       ;  ref num
            ADRL  L23D0       ;  path name
            ADRL  $00000000   ;  reserved
L23E2       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L23D8
            JSR   L1056
            LDA   L23D8
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2400

L23FE       DW    $0000
L2400       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L23FE
            ASL
            ASL
            ASL
            ASL
            ORA   L23FE
            STA   L23FE
            LDAL  $E0C022
            AND   #$FF00
            ORA   L23FE
            STAL  $E0C022
            JSR   L617E
            LDA   #$0004
            STA   L62BB
            JMP   L2A69
L2438       JMP   L244D

L243B       STR   '0/GOODD'
L2443       DW    $0000       ;  ref num
            ADRL  L243B       ;  path name
            ADRL  $00000000   ;  reserved
L244D       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2443
            JSR   L1056
            LDA   L2443
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L246B

L2469       DW    $0000
L246B       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L2469
            ASL
            ASL
            ASL
            ASL
            ORA   L2469
            STA   L2469
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2469
            STAL  $E0C022
            JSR   L617E
            LDA   #$0008
            STA   L62B5
            STA   L62B7
            JMP   L2A69
L24A6       JMP   L24BB

L24A9       STR   '0/GOODE'
L24B1       DW    $0000       ;  ref num
            ADRL  L24A9       ;  path name
            ADRL  $00000000   ;  reserved
L24BB       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L24B1
            JSR   L1056
            LDA   L24B1
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L24D9

L24D7       DW    $0000
L24D9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L24D7
            ASL
            ASL
            ASL
            ASL
            ORA   L24D7
            STA   L24D7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L24D7
            STAL  $E0C022
            JSR   L617E
            LDA   #$0008
            STA   L62B5
            STA   L62B7
            LDA   #$0003
            STA   L62B9
            JMP   L2A69
L251A       JMP   L252F

L251D       STR   '0/GOODF'
L2525       DW    $0000       ;  ref num
            ADRL  L251D       ;  path name
            ADRL  $00000000   ;  reserved
L252F       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2525
            JSR   L1056
            LDA   L2525
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L254D

L254B       DW    $0000
L254D       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L254B
            ASL
            ASL
            ASL
            ASL
            ORA   L254B
            STA   L254B
            LDAL  $E0C022
            AND   #$FF00
            ORA   L254B
            STAL  $E0C022
            JSR   L617E
            LDA   #$0002
            STA   L62BB
            JMP   L2A69
L2585       JMP   L259A

L2588       STR   '0/GOODG'
L2590       DW    $0000       ;  ref num
            ADRL  L2588       ;  path name
            ADRL  $00000000   ;  reserved
L259A       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2590
            JSR   L1056
            LDA   L2590
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L25B8

L25B6       DW    $0000
L25B8       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L25B6
            ASL
            ASL
            ASL
            ASL
            ORA   L25B6
            STA   L25B6
            LDAL  $E0C022
            AND   #$FF00
            ORA   L25B6
            STAL  $E0C022
            JSR   L617E
            LDA   #$0006
            STA   L62B9
            JMP   L2A69
L25F0       JMP   L2605

L25F3       STR   '0/GOODH'
L25FB       DW    $0000       ;  ref num
            ADRL  L25F3       ;  path name
            ADRL  $00000000   ;  reserved
L2605       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L25FB
            JSR   L1056
            LDA   L25FB
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2623

L2621       DW    $0000
L2623       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2621
            ASL
            ASL
            ASL
            ASL
            ORA   L2621
            STA   L2621
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2621
            STAL  $E0C022
            JSR   L617E
            LDA   #$0008
            STA   L62B7
            LDA   #$000A
            STA   L62B9
            JMP   L2A69
L2661       JMP   L2676

L2664       STR   '0/GOODI'
L266C       DW    $0000       ;  ref num
            ADRL  L2664       ;  path name
            ADRL  $00000000   ;  reserved
L2676       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L266C
            JSR   L1056
            LDA   L266C
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2694

L2692       DW    $0000
L2694       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2692
            ASL
            ASL
            ASL
            ASL
            ORA   L2692
            STA   L2692
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2692
            STAL  $E0C022
            JSR   L617E
            LDA   #$000A
            STA   L62B5
            LDA   #$0005
            STA   L62B7
            JMP   L2A69
L26D2       JMP   L26E7

L26D5       STR   '0/GOODJ'
L26DD       DW    $0000       ;  ref num
            ADRL  L26D5       ;  path name
            ADRL  $00000000   ;  reserved
L26E7       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L26DD
            JSR   L1056
            LDA   L26DD
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2705

L2703       DW    $0000
L2705       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2703
            ASL
            ASL
            ASL
            ASL
            ORA   L2703
            STA   L2703
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2703
            STAL  $E0C022
            JSR   L617E
            LDA   #$0005
            STA   L62B5
            LDA   #$000A
            STA   L62BB
            JMP   L2A69
L2743       JMP   L2758

L2746       STR   '0/GOODK'
L274E       DW    $0000       ;  ref num
            ADRL  L2746       ;  path name
            ADRL  $00000000   ;  reserved
L2758       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L274E
            JSR   L1056
            LDA   L274E
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2776

L2774       DW    $0000
L2776       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2774
            ASL
            ASL
            ASL
            ASL
            ORA   L2774
            STA   L2774
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2774
            STAL  $E0C022
            JSR   L617E
            LDA   #$000A
            STA   L62B5
            LDA   #$000B
            STA   L62B7
            LDA   #$0005
            STA   L62B9
            LDA   #$000A
            STA   L62BB
            JMP   L2A69
L27C0       JMP   L27D5

L27C3       STR   '0/GOODL'
L27CB       DW    $0000       ;  ref num
            ADRL  L27C3       ;  path name
            ADRL  $00000000   ;  reserved
L27D5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L27CB
            JSR   L1056
            LDA   L27CB
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L27F3

L27F1       DW    $0000
L27F3       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L27F1
            ASL
            ASL
            ASL
            ASL
            ORA   L27F1
            STA   L27F1
            LDAL  $E0C022
            AND   #$FF00
            ORA   L27F1
            STAL  $E0C022
            JSR   L617E
            LDA   #$0005
            STA   L62B7
            LDA   #$0003
            STA   L62B9
            STA   L62BB
            JMP   L2A69
L2834       JMP   L2849

L2837       STR   '0/GOODM'
L283F       DW    $0000       ;  ref num
            ADRL  L2837       ;  path name
            ADRL  $00000000   ;  reserved
L2849       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L283F
            JSR   L1056
            LDA   L283F
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2867

L2865       DW    $0000
L2867       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L2865
            ASL
            ASL
            ASL
            ASL
            ORA   L2865
            STA   L2865
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2865
            STAL  $E0C022
            JSR   L617E
            LDA   #$0002
            STA   L62B5
            LDA   #$0003
            STA   L62B7
            LDA   #$0004
            STA   L62BB
            JMP   L2A69
L28AB       JMP   L28C0

L28AE       STR   '0/GOODN'
L28B6       DW    $0000       ;  ref num
            ADRL  L28AE       ;  path name
            ADRL  $00000000   ;  reserved
L28C0       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L28B6
            JSR   L1056
            LDA   L28B6
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L28DE

L28DC       DW    $0000
L28DE       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L28DC
            ASL
            ASL
            ASL
            ASL
            ORA   L28DC
            STA   L28DC
            LDAL  $E0C022
            AND   #$FF00
            ORA   L28DC
            STAL  $E0C022
            JSR   L617E
            LDA   #$0005
            STA   L62B9
            JMP   L2A69
L2916       JMP   L292B

L2919       STR   '0/GOODO'
L2921       DW    $0000       ;  ref num
            ADRL  L2919       ;  path name
            ADRL  $00000000   ;  reserved
L292B       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2921
            JSR   L1056
            LDA   L2921
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2949

L2947       DW    $0000
L2949       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0005
            STAL  $E0C034
            LDA   #$0005
            STA   L2947
            ASL
            ASL
            ASL
            ASL
            ORA   L2947
            STA   L2947
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2947
            STAL  $E0C022
            JSR   L617E
            LDA   #$0007
            STA   L62B7
            LDA   #$0005
            STA   L62BB
            JMP   L2A69
L2987       JMP   L299C

L298A       STR   '0/GOODQ'
L2992       DW    $0000       ;  ref num
            ADRL  L298A       ;  path name
            ADRL  $00000000   ;  reserved
L299C       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2992
            JSR   L1056
            LDA   L2992
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L29BA

L29B8       DW    $0000
L29BA       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L29B8
            ASL
            ASL
            ASL
            ASL
            ORA   L29B8
            STA   L29B8
            LDAL  $E0C022
            AND   #$FF00
            ORA   L29B8
            STAL  $E0C022
            JSR   L617E
            LDA   #$000F
            STA   L62B7
            LDA   #$0008
            STA   L62B9
            JMP   L2A69
L29F8       JMP   L2A0D

L29FB       STR   '0/GOODR'
L2A03       DW    $0000       ;  ref num
            ADRL  L29FB       ;  path name
            ADRL  $00000000   ;  reserved
L2A0D       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L2A03
            JSR   L1056
            LDA   L2A03
            STA   L0BB4
            STA   L0BC2
            JSR   L5FEE
            JMP   L2A2B

L2A29       DW    $0000
L2A2B       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2A29
            ASL
            ASL
            ASL
            ASL
            ORA   L2A29
            STA   L2A29
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2A29
            STAL  $E0C022
            JSR   L617E
            LDA   #$0002
            STA   L62B7
            LDA   #$0003
            STA   L62B9
            JMP   L2A69

L2A69       JSR   L5E5B
            LDA   #$2000
            STA   L0CE5
            JSR   L1D38
            STZ   L0CE3
            JSR   L1181
            JSR   L5EDC
            RTS

L2A7F       LDA   L0D65
            ASL
            TAY
            LDA   L0D67,Y
            BEQ   L2A8B
            SEC
            RTS

L2A8B       LDA   #$0001
            STA   L0D67,Y
            CLC
            RTS

L2A93       LDY   #$0000
            LDA   #$0000
L2A99       STA   L0D67,Y
            INY
            INY
            CPY   #$0014
            BNE   L2A99
            RTS

            LDA   #$000D
            STA   L0CDB
            LDA   #$000B
            PHA
            _SetForeColor
L2AB5       JSR   L1D38
            CLC
            LDA   #$00BA
            STA   L0DF5
            LDA   #$000B
            STA   L0DF7
            LDA   #$00C7
            ADC   #$0001
            STA   L0DF3
            LDA   #$0135
            ADC   #$0001
            STA   L0DF9
            LDA   L0CDB
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            STZ   L0CF3
            LDA   #$00C4
            STA   L0CED
            LDA   #$000F
            STA   L0CEB
            JMP   L2B12

	DO	VF
L2AFB       STR   '(espace : continuer)'
	ELSE
L2AFB       STR   '(spacebar to continue)'
	FIN
L2B12       LDA   #^L2AFB
            STA   L0CF1
            LDA   #L2AFB
            STA   L0CEF
            JSR   L1201
	DO	VF
            LDA   #$00C6
	ELSE
            LDA   #$00D6
	FIN
            STA   L0CEB
            JMP   L2B38

	DO	VF
L2B2A       STR   '(esc : quitter)'
	ELSE
L2B2A       STR   '(esc to quit)'
	FIN
L2B38       LDA   #^L2B2A
            STA   L0CF1
            LDA   #L2B2A
            STA   L0CEF
            JSR   L1201
L2B47       PEA   $0000
            PEA   $FFFF
            LDA   #^L0DBC
            PHA
            LDA   #L0DBC
            PHA
            _GetNextEvent
            PLA
            BNE   L2B62
            JMP   L2B47

L2B62       LDA   L0DBC
            CMP   #$0003
            BEQ   L2B6D
            JMP   L2B9F

L2B6D       LDA   #$0000
            STA   L0E11
            _ObscureCursor
            LDA   L0DBE
            AND   #$007F
            CMP   #$0020
            BEQ   L2B8D
            CMP   #$001B
            BEQ   L2B9C
            JMP   L2B47

L2B8D       _InitCursor
            _ObscureCursor
            RTS
L2B9C       JMP   L0B3A

L2B9F       CMP   #$0001
            BEQ   L2BA7
            JMP   L2B47

L2BA7       LDA   #$0080
            STA   L0E11
            _InitCursor
            RTS

L2BB5       STA   L2BEF
            PHA
            LDA   #^L0D36
            PHA
            LDA   #L0D36
            PHA
            LDA   L2BEF
            CMP   #$000A
            BCS   L2BCF
            LDA   #$0001
            JMP   L2BDD

L2BCF       CMP   #$0064
            BCS   L2BDA
            LDA   #$0002
            JMP   L2BDD

L2BDA       LDA   #$0003
L2BDD       STA   L0D35
            PHA
            PEA   $0000
            _Int2Dec
            JSR   L1056
            RTS

L2BEF       DW    $0000
L2BF1       JMP   L2BF6

L2BF4       DW    $0000
L2BF6       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L2BF4
            ASL
            ASL
            ASL
            ASL
            ORA   L2BF4
            STA   L2BF4
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2BF4
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $FFFF
            _ClearScreen
            JSR   L113E
            CLC
            LDA   #$0036
            STA   L0DF5
            LDA   #$0072
            STA   L0DF7
            LDA   #$0048
            ADC   #$0001
            STA   L0DF3
            LDA   #$00C5
            ADC   #$0001
            STA   L0DF9
            LDA   #$0006
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0038
            STA   L0DF5
            LDA   #$0074
            STA   L0DF7
            LDA   #$0046
            ADC   #$0001
            STA   L0DF3
            LDA   #$00C3
            ADC   #$0001
            STA   L0DF9
            LDA   #$000A
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L2CB0

	DO	VF
L2CA5       STR   'Ton score'
L2CB0       PEA   $007B
	ELSE
L2CA5       STR   'Your score'
L2CB0       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L2CA5
            PHA
            LDA   #L2CA5
            PHA
            _DrawString
            LDA   #$0060
            STA   L0CED
            LDA   #$0023
            STA   L0CEB
            LDA   #$0009
            STA   L0CF3
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L2CFF

	DO	VF
L2CEC       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L2CEC       STR   '     You answered '
	FIN
L2CFF       LDA   #^L2CEC
            STA   L0CF1
            LDA   #L2CEC
            STA   L0CEF
            JSR   L1201
            LDA   L0D91
            JSR   L2BB5
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L122A
            JMP   L2D3A

	DO	VF
L2D26       STR   ' questions sur 5'
	ELSE
L2D26       STR   ' out of 5 questions'
	FIN
L2D3A       LDA   #^L2D26
            STA   L0CF1
            LDA   #L2D26
            STA   L0CEF
            JSR   L122A
            JMP   L2D68

	DO	VF
L2D4C       STR   'correctement au premier essai.'
	ELSE
L2D4C       STR   'correctly on the first try.'
	FIN
L2D68       LDA   #^L2D4C
            STA   L0CF1
            LDA   #L2D4C
            STA   L0CEF
            JSR   L1201
            LDA   L0D91
            CMP   #$0005
            BEQ   L2D82
            JMP   L2DBE

L2D82       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0085
            STA   L0CED
            JMP   L2DAF

	DO	VF
L2D96       STR   'C'27'est un score parfait !'
	ELSE
L2D96       STR   'That is a perfect score!'
	FIN
L2DAF       LDA   #^L2D96
            STA   L0CF1
            LDA   #L2D96
            STA   L0CEF
            JSR   L123A
L2DBE       _InitCursor
            LDA   L0E11
            BNE   L2DD1
            _ObscureCursor
L2DD1       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS
L2DE6       JMP   L2DEB

L2DE9       DW    $0000
L2DEB       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L2DE9
            ASL
            ASL
            ASL
            ASL
            ORA   L2DE9
            STA   L2DE9
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2DE9
            STAL  $E0C022
            JSR   L112F
            JSR   L1DE1
            PEA   $FFFF
            _ClearScreen
            JSR   L113E
            CLC
            LDA   #$0036
            STA   L0DF5
            LDA   #$0072
            STA   L0DF7
            LDA   #$0048
            ADC   #$0001
            STA   L0DF3
            LDA   #$00C5
            ADC   #$0001
            STA   L0DF9
            LDA   #$0006
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0038
            STA   L0DF5
            LDA   #$0074
            STA   L0DF7
            LDA   #$0046
            ADC   #$0001
            STA   L0DF3
            LDA   #$00C3
            ADC   #$0001
            STA   L0DF9
            LDA   #$000A
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L2EA5

	DO	VF
L2E9A       STR   'Ton score'
L2EA5       PEA   $007B
	ELSE
L2E9A       STR   'Your score'
L2EA5       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L2E9A
            PHA
            LDA   #L2E9A
            PHA
            _DrawString
            LDA   #$0060
            STA   L0CED
            LDA   #$0023
            STA   L0CEB
            LDA   #$0009
            STA   L0CF3
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L2EF4

	DO	VF
L2EE1       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L2EE1       STR   '     You answered '
	FIN
L2EF4       LDA   #^L2EE1
            STA   L0CF1
            LDA   #L2EE1
            STA   L0CEF
            JSR   L1201
            LDA   L0D91
            JSR   L2BB5
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L122A
            JMP   L2F30

	DO	VF
L2F1B       STR   ' questions sur 10'
	ELSE
L2F1B       STR   ' out of 10 questions'
	FIN
L2F30       LDA   #^L2F1B
            STA   L0CF1
            LDA   #L2F1B
            STA   L0CEF
            JSR   L122A
            JMP   L2F5E

	DO	VF
L2F42       STR   'correctement au premier essai.'
	ELSE
L2F42       STR   'correctly on the first try.'
	FIN
L2F5E       LDA   #^L2F42
            STA   L0CF1
            LDA   #L2F42
            STA   L0CEF
            JSR   L1201
            LDA   L0D91
            CMP   #$0000
            BEQ   L2F78
            JMP   L2FAE

L2F78       LDA   L0CED
            CLC
            ADC   L0CF3
            STA   L0CED
            JMP   L2F9C

	DO	VF
L2F85       STR   'C'27'est un score de 0%.'
	ELSE
L2F85       STR   'That is a score of 0%.'
	FIN
L2F9C       LDA   #^L2F85
            STA   L0CF1
            LDA   #L2F85
            STA   L0CEF
            JSR   L123A
            JMP   L3051

L2FAE       LDA   L0CED
            CLC
            ADC   L0CF3
            STA   L0CED
            JMP   L2FCF

	DO	VF
L2FBB       STR   'C'27'est un score de '
	ELSE
L2FBB       STR   'That is a score of '
	FIN
L2FCF       LDA   #^L2FBB
            STA   L0CF1
            LDA   #L2FBB
            STA   L0CEF
            LDA   L0D91
            JSR   L2BB5
            LDA   L0CEF
            STA   L0CF5
            LDA   L0CF1
            STA   L0CF7
            LDA   L0D31
            STA   L0CF9
            LDA   L0D31+2
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            JMP   L300F

L300B       STR   '0%.'
L300F       LDA   #^L300B
            STA   L0CF1
            LDA   #L300B
            STA   L0CEF
            LDA   L0D31
            STA   L0CF5
            LDA   L0D31+2
            STA   L0CF7
            LDA   L0CEF
            STA   L0CF9
            LDA   L0CF1
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L123A
L3051       LDA   L0D91
            CMP   #$000A
            BEQ   L305C
            JMP   L3098

L305C       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$008E
            STA   L0CED
            JMP   L3089

	DO	VF
L3070       STR   'C'27'est un score parfait !'
	ELSE
L3070       STR   'That is a perfect score!'
	FIN
L3089       LDA   #^L3070
            STA   L0CF1
            LDA   #L3070
            STA   L0CEF
            JSR   L123A
L3098       _InitCursor
            LDA   L0E11
            BNE   L30AB
            _ObscureCursor
L30AB       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS

L30C0       LDA   #$0052
            STA   L0CED
            LDA   #$0013
            STA   L0CEB
            LDA   #$0009
            STA   L0CF3
            LDA   #$0001
            PHA
            _SetForeColor
            JMP   L3109

	DO	VF
L30E0       STR   '    Pour r'8e'soudre ce probl'8f'me, que'
	ELSE
L30E0       STR   '     To solve this problem, which should'
	FIN
L3109       LDA   #^L30E0
            STA   L0CF1
            LDA   #L30E0
            STA   L0CEF
            JSR   L1201
            JMP   L3124

	DO	VF
L311B       STR   'dois-tu utiliser ?'
	ELSE
L311B       STR   'you use?'
	FIN
L3124       LDA   #^L311B
            STA   L0CF1
            LDA   #L311B
            STA   L0CEF
            JSR   L1201
            CLC
            LDA   #$0078
            STA   L0DF5
            LDA   #$0024
            STA   L0DF7
            LDA   #$0088
            ADC   #$0001
            STA   L0DF3
            LDA   #$0079
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0077
            STA   L0DF5
            LDA   #$0023
            STA   L0DF7
            LDA   #$0087
            ADC   #$0001
            STA   L0DF3
            LDA   #$0078
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0079
            STA   L0DF5
            LDA   #$0025
            STA   L0DF7
            LDA   #$0085
            ADC   #$0001
            STA   L0DF3
            LDA   #$0032
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0079
            STA   L0DF5
            LDA   #$0035
            STA   L0DF7
            LDA   #$0085
            ADC   #$0001
            STA   L0DF3
            LDA   #$0076
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L3211

	DO	VF
L3205       STR   'A  ddition'
	ELSE
L3205       STR   'A  ddition'
	FIN
L3211       PEA   $0028
            PEA   $0083
            _MoveTo
            LDA   #^L3205
            PHA
            LDA   #L3205
            PHA
            _DrawString
            LDA   #^L0E15
            PHA
            LDA   #L0E15
            PHA
            LDA   #$0023
            PHA
            LDA   #$0077
            PHA
            LDA   #$0078
            CLC
            ADC   #$0001
            PHA
            LDA   #$0087
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L0E70
            CLC
            LDA   #$0078
            STA   L0DF5
            LDA   #$00A9
            STA   L0DF7
            LDA   #$0088
            ADC   #$0001
            STA   L0DF3
            LDA   #$0117
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0077
            STA   L0DF5
            LDA   #$00A8
            STA   L0DF7
            LDA   #$0087
            ADC   #$0001
            STA   L0DF3
            LDA   #$0116
            ADC   #$0001
            STA   L0DF9
            LDA   #$000D
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0079
            STA   L0DF5
            LDA   #$00AA
            STA   L0DF7
            LDA   #$0085
            ADC   #$0001
            STA   L0DF3
            LDA   #$00B7
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0079
            STA   L0DF5
            LDA   #$00BA
            STA   L0DF7
            LDA   #$0085
            ADC   #$0001
            STA   L0DF3
            LDA   #$0114
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L333A

	DO	VF
L332B       STR   'S  oustraction'
	ELSE
L332B       STR   'S  ubtraction'
	FIN
L333A       PEA   $00AD
            PEA   $0083
            _MoveTo
            LDA   #^L332B
            PHA
            LDA   #L332B
            PHA
            _DrawString
            LDA   #^L0E1D
            PHA
            LDA   #L0E1D
            PHA
            LDA   #$00A8
            PHA
            LDA   #$0077
            PHA
            LDA   #$0116
            CLC
            ADC   #$0001
            PHA
            LDA   #$0087
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0053
            STA   L0E72
            LDA   #$0002
            STA   L0E6E
            JSR   L1D38
            _InitCursor
            LDA   L0E11
            BNE   L339E
            _ObscureCursor
L339E       JSR   L1E5D
            LDA   L0DD8
            CMP   L101E
            BEQ   L33AC
            JMP   L347E

L33AC       LDA   #$000A
            STA   L0CEB
            LDA   #$00A1
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$0007
            PHA
            _SetForeColor
            JMP   L33E5

	DO	VF
L33CC       STR   '    Tr'8f's bien, tu as utilis'8e' '
	ELSE
L33CC       STR   '     Very good, you use '
	FIN
L33E5       LDA   #^L33CC
            STA   L0CF1
            LDA   #L33CC
            STA   L0CEF
            JSR   L1201
            LDA   L101E
            CMP   #$0053
            BEQ   L33FF
            JMP   L3420
L33FF       JMP   L340E

	DO	VF
L3402       STR   'la soustraction'
	ELSE
L3402       STR   'subtraction'
	FIN
L340E       LDA   #^L3402
            STA   L0CF1
            LDA   #L3402
            STA   L0CEF
            JSR   L122A
            JMP   L343B
L3420       JMP   L342C

	DO	VF
L3423       STR   'l'27'addition'
	ELSE
L3423       STR   'addition'
	FIN
L342C       LDA   #^L3423
            STA   L0CF1
            LDA   #L3423
            STA   L0CEF
            JSR   L122A
L343B       JMP   L3446

	DO	VF
L343E       STR   'pour avoir '
	ELSE
L343E       STR   'to get '
	FIN
L3446       LDA   #^L343E
            STA   L0CF1
            LDA   #L343E
            STA   L0CEF
            JSR   L1201	; was L122A
            JMP   L346C

	DO	VF
L3458       STR   'le bon r'8e'sultat.'
	ELSE
L3458       STR   'the correct answer.'
	FIN
L346C       LDA   #^L3458
            STA   L0CF1
            LDA   #L3458
            STA   L0CEF
            JSR   L122A	; was L1201
            JMP   L3545

L347E       LDA   #$0005
            STA   L0CEB
            LDA   #$00A2
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L34C2

	DO	VF
L349E       STR   '    C'27'est une erreur. Tu dois utiliser'
	ELSE
L349E       STR   '     That is not correct.  You use'
	FIN
L34C2       LDA   #^L349E
            STA   L0CF1
            LDA   #L349E
            STA   L0CEF
            JSR   L1201
            LDA   L101E
            CMP   #$0053
            BEQ   L34DC
            JMP   L34FD
L34DC       JMP   L34EB

	DO	VF
L34DF       STR   'la soustraction'
	ELSE
L34DF       STR   'subtraction'
	FIN
L34EB       LDA   #^L34DF
            STA   L0CF1
            LDA   #L34DF
            STA   L0CEF
            JSR   L1201
            JMP   L3518
L34FD       JMP   L3509

	DO	VF
L3500       STR   'l'27'addition'
	ELSE
L3500       STR   'addition'
	FIN
L3509       LDA   #^L3500
            STA   L0CF1
            LDA   #L3500
            STA   L0CEF
            JSR   L1201
L3518       JMP   L3536

	DO	VF
L351B       STR   ' pour obtenir le bon r'8E'sultat.'
	ELSE
L351B       STR   ' to get the correct answer.'
	FIN
L3536       LDA   #^L351B
            STA   L0CF1
            LDA   #L351B
            STA   L0CEF
            JSR   L122A
L3545       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS

L355A       _HideCursor
            LDA   #$0001
            STA   L0D93
L3567       CLC
            LDA   #$0037
            STA   L0DF5
            LDA   #$0000
            STA   L0DF7
            LDA   #$00C7
            ADC   #$0001
            STA   L0DF3
            LDA   #$013F
            ADC   #$0001
            STA   L0DF9
            LDA   #$0002
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0008
            STA   L0CEB
            LDA   #$0049
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$0001
            PHA
            _SetForeColor
            JMP   L35E5

	DO	VF
L35B8       STR   '    Quel nombre n'27'est pas utile pour r'8e'soudre'
	ELSE
L35B8       STR   '     Which number is not needed to solve the'
	FIN
L35E5       LDA   #^L35B8
            STA   L0CF1
            LDA   #L35B8
            STA   L0CEF
            JSR   L1201
            JMP   L3600

	DO	VF
L35F7       STR   'probl'8f'me ?'
	ELSE
L35F7       STR   'problem?'
	FIN
L3600       LDA   #^L35F7
            STA   L0CF1
            LDA   #L35F7
            STA   L0CEF
            JSR   L1201
            LDA   #$0061
            STA   L0CED
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L364B

	DO	VF
L3623       STR   '    Saisis le nombre puis appuie sur '
	ELSE
L3623       STR   '     Please type the number, then press'
	FIN
L364B       LDA   #^L3623
            STA   L0CF1
            LDA   #L3623
            STA   L0CEF
            JSR   L1201
            JMP   L3665

	DO	VF
L365D       STR   'ENTREE.'
	ELSE
L365D       STR   'RETURN.'
	FIN
L3665       LDA   #^L365D
            STA   L0CF1
            LDA   #L365D
            STA   L0CEF
            JSR   L1201
            CLC
            LDA   #$0076
            STA   L0DF5
            LDA   #$008D
            STA   L0DF7
            LDA   #$0088
            ADC   #$0001
            STA   L0DF3
            LDA   #$00AE
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0075
            STA   L0DF5
            LDA   #$008C
            STA   L0DF7
            LDA   #$0087
            ADC   #$0001
            STA   L0DF3
            LDA   #$00AD
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0078
            STA   L0DF5
            LDA   #$008F
            STA   L0DF7
            LDA   #$0084
            ADC   #$0001
            STA   L0DF3
            LDA   #$00AA
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0003
            STA   L0D5F
            LDA   #$0000
            STA   L0D61
            LDA   #$0091
            STA   L0CEB
            LDA   #$0082
            STA   L0CED
            LDA   #$0003
            STA   L0D01
            JSR   L125E
            JSR   L1F66
            LDA   L0D63
            CMP   L1020
            BEQ   L3736
            JMP   L376D

L3736       LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$00A2
            STA   L0CED
            JMP   L375B

	DO	VF
L374A       STR   'C'27'est la bonne r'8e'ponse.'
	ELSE
L374A       STR   'That is correct.'
	FIN
L375B       LDA   #^L374A
            STA   L0CF1
            LDA   #L374A
            STA   L0CEF
            JSR   L123A
            JMP   L3899

L376D       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$009B
            STA   L0CED
            JMP   L3796

	DO	VF
L3781       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L3781       STR   'That is not correct.'
	FIN
L3796       LDA   #^L3781
            STA   L0CF1
            LDA   #L3781
            STA   L0CEF
            JSR   L123A
            LDA   #$000B
            PHA
            _SetForeColor
            LDA   #$00AA
            STA   L0CED
            LDA   L0D93
            BEQ   L37BE
            JMP   L385B
L37BE       JMP   L37D8

	DO	VF
L37C1       STR   'La bonne r'8e'ponse '
	ELSE
L37C1       STR   'The correct answer is '
	FIN
L37D8       LDA   #^L37C1
            STA   L0CF1
            LDA   #L37C1
            STA   L0CEF
            LDA   L1020
            JSR   L2BB5
            LDA   L0CEF
            STA   L0CF5
            LDA   L0CF1
            STA   L0CF7
            LDA   L0D31
            STA   L0CF9
            LDA   L0D31+2
            STA   L0CFB
            LDA   L0D03
            STA   L0CFD
            LDA   L0D03+2
            STA   L0CFF
            JSR   L1F88
            JMP   L3816

L3814       STR   '.'
L3816       LDA   #^L3814
            STA   L0CF1
            LDA   #L3814
            STA   L0CEF
            LDA   L0D03
            STA   L0CF5
            LDA   L0D03+2
            STA   L0CF7
            LDA   L0CEF
            STA   L0CF9
            LDA   L0CF1
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L123A
            JMP   L3899

L385B       DEC   L0D93
            JMP   L3873

	DO	VF
L3861       STR   'Essaye encore.'
	ELSE
L3861       STR   'Please try again.'
	FIN
L3873       LDA   #^L3861
            STA   L0CF1
            LDA   #L3861
            STA   L0CEF
            JSR   L123A
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            JMP   L3567

L3899       _InitCursor
            LDA   L0E11
            BNE   L38AC
            _ObscureCursor
L38AC       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS

L38C1       JSR   L1A35
            LDA   #$0001
            PHA
            _SetForeColor
            JMP   L38EF

	DO	VF
L38D2       STR   'Quelle est la bonne r'8e'ponse ?'
	ELSE
L38D2       STR   'Which is the correct answer?'
	FIN
L38EF       PEA   $0034
            PEA   $0046
            _MoveTo
            LDA   #^L38D2
            PHA
            LDA   #L38D2
            PHA
            _DrawString
            CLC
            LDA   #$005D
            STA   L0DF5
            LDA   #$005B
            STA   L0DF7
            LDA   #$006D
            ADC   #$0001
            STA   L0DF3
            LDA   #$008C
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$005C
            STA   L0DF5
            LDA   #$005A
            STA   L0DF7
            LDA   #$006C
            ADC   #$0001
            STA   L0DF3
            LDA   #$008B
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$005E
            STA   L0DF5
            LDA   #$005C
            STA   L0DF7
            LDA   #$006A
            ADC   #$0001
            STA   L0DF3
            LDA   #$0069
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$005E
            STA   L0DF5
            LDA   #$006C
            STA   L0DF7
            LDA   #$006A
            ADC   #$0001
            STA   L0DF3
            LDA   #$0089
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L39DF

L39DD       STR   'A'
L39DF       PEA   $005F
            PEA   $0068
            _MoveTo
            LDA   #^L39DD
            PHA
            LDA   #L39DD
            PHA
            _DrawString
            LDA   #$0068
            STA   L0CED
            LDA   #$006F
            STA   L0CEB
            LDA   L1016
            JSR   L2BB5
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            LDA   #^L0E15
            PHA
            LDA   #L0E15
            PHA
            LDA   #$005A
            PHA
            LDA   #$005C
            PHA
            LDA   #$008B
            CLC
            ADC   #$0001
            PHA
            LDA   #$006C
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L0E70
            CLC
            LDA   #$007E
            STA   L0DF5
            LDA   #$005B
            STA   L0DF7
            LDA   #$008E
            ADC   #$0001
            STA   L0DF3
            LDA   #$008C
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007D
            STA   L0DF5
            LDA   #$005A
            STA   L0DF7
            LDA   #$008D
            ADC   #$0001
            STA   L0DF3
            LDA   #$008B
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007F
            STA   L0DF5
            LDA   #$005C
            STA   L0DF7
            LDA   #$008B
            ADC   #$0001
            STA   L0DF3
            LDA   #$0069
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007F
            STA   L0DF5
            LDA   #$006C
            STA   L0DF7
            LDA   #$008B
            ADC   #$0001
            STA   L0DF3
            LDA   #$0089
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L3B1C

L3B1A       STR   'B'
L3B1C       PEA   $005F
            PEA   $0089
            _MoveTo
            LDA   #^L3B1A
            PHA
            LDA   #L3B1A
            PHA
            _DrawString
            LDA   #$0089
            STA   L0CED
            LDA   #$006F
            STA   L0CEB
            LDA   L1018
            JSR   L2BB5
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            LDA   #^L0E1D
            PHA
            LDA   #L0E1D
            PHA
            LDA   #$005A
            PHA
            LDA   #$007D
            PHA
            LDA   #$008B
            CLC
            ADC   #$0001
            PHA
            LDA   #$008D
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0042
            STA   L0E72
            CLC
            LDA   #$005D
            STA   L0DF5
            LDA   #$00B1
            STA   L0DF7
            LDA   #$006D
            ADC   #$0001
            STA   L0DF3
            LDA   #$00E2
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$005C
            STA   L0DF5
            LDA   #$00B0
            STA   L0DF7
            LDA   #$006C
            ADC   #$0001
            STA   L0DF3
            LDA   #$00E1
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$005E
            STA   L0DF5
            LDA   #$00B2
            STA   L0DF7
            LDA   #$006A
            ADC   #$0001
            STA   L0DF3
            LDA   #$00BF
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$005E
            STA   L0DF5
            LDA   #$00C2
            STA   L0DF7
            LDA   #$006A
            ADC   #$0001
            STA   L0DF3
            LDA   #$00DF
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L3C59

L3C57       STR   'C'
L3C59       PEA   $00B5
            PEA   $0068
            _MoveTo
            LDA   #^L3C57
            PHA
            LDA   #L3C57
            PHA
            _DrawString
            LDA   #$0068
            STA   L0CED
            LDA   #$00C5
            STA   L0CEB
            LDA   L101A
            JSR   L2BB5
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            LDA   #^L0E25
            PHA
            LDA   #L0E25
            PHA
            LDA   #$00B0
            PHA
            LDA   #$005C
            PHA
            LDA   #$00E1
            CLC
            ADC   #$0001
            PHA
            LDA   #$006C
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0043
            STA   L0E74
            CLC
            LDA   #$007E
            STA   L0DF5
            LDA   #$00B1
            STA   L0DF7
            LDA   #$008E
            ADC   #$0001
            STA   L0DF3
            LDA   #$00E2
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007D
            STA   L0DF5
            LDA   #$00B0
            STA   L0DF7
            LDA   #$008D
            ADC   #$0001
            STA   L0DF3
            LDA   #$00E1
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007F
            STA   L0DF5
            LDA   #$00B2
            STA   L0DF7
            LDA   #$008B
            ADC   #$0001
            STA   L0DF3
            LDA   #$00BF
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007F
            STA   L0DF5
            LDA   #$00C2
            STA   L0DF7
            LDA   #$008B
            ADC   #$0001
            STA   L0DF3
            LDA   #$00DF
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L3D96

L3D94       STR   'D'
L3D96       PEA   $00B5
            PEA   $0089
            _MoveTo
            LDA   #^L3D94
            PHA
            LDA   #L3D94
            PHA
            _DrawString
            LDA   #$0089
            STA   L0CED
            LDA   #$00C5
            STA   L0CEB
            LDA   L101C
            JSR   L2BB5
            LDA   #^L0D35
            STA   L0CF1
            LDA   #L0D35
            STA   L0CEF
            JSR   L1201
            LDA   #^L0E2D
            PHA
            LDA   #L0E2D
            PHA
            LDA   #$00B0
            PHA
            LDA   #$007D
            PHA
            LDA   #$00E1
            CLC
            ADC   #$0001
            PHA
            LDA   #$008D
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0044
            STA   L0E76
            LDA   #$0004
            STA   L0E6E
            JSR   L19E5
            _InitCursor
            LDA   L0E11
            BNE   L3E1B
            _ObscureCursor
L3E1B       JSR   L1E5D
            RTS

L3E1F       LDA   L0DD8
            CMP   L0D65
            BEQ   L3E2A
            JMP   L3E39

L3E2A       LDA   L0D91
            CLC
            ADC   L0D93
            STA   L0D91
            JSR   L222B
            SEC
            RTS

L3E39       LDA   L0D93
            BNE   L3E41
            JMP   L3EFD

L3E41       DEC   L0D93
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #$0056
            STA   L0CEB
            LDA   #$00A1
            STA   L0CED
            STZ   L0CF3
            JMP   L3E76

	DO	VF
L3E61       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L3E61       STR   'That is not correct.'
	FIN
L3E76       LDA   #^L3E61
            STA   L0CF1
            LDA   #L3E61
            STA   L0CEF
            JSR   L1201
            DEC   L0CEB
            DEC   L0CED
            LDA   #$0009
            PHA
            _SetForeColor
            JSR   L1201
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #$0062
            STA   L0CEB
            LDA   #$00B1
            STA   L0CED
            JMP   L3EC5

	DO	VF
L3EB3       STR   'Essaye encore.'
	ELSE
L3EB3       STR   'Please try again.'
	FIN
L3EC5       LDA   #^L3EB3
            STA   L0CF1
            LDA   #L3EB3
            STA   L0CEF
            JSR   L1201
            DEC   L0CEB
            DEC   L0CED
            LDA   #$000B
            PHA
            _SetForeColor
            JSR   L1201
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS

L3EFD       LDA   #$0000
            PHA
            _SetForeColor
            LDA   #$0074
            STA   L0CEB
            LDA   #$00A2
            STA   L0CED
            STZ   L0CF3
            JMP   L3F28

	DO	VF
L3F1A       STR   'Tu es proche,'
	ELSE
L3F1A       STR   'You'27're close,'
	FIN
L3F28       LDA   #^L3F1A
            STA   L0CF1
            LDA   #L3F1A
            STA   L0CEF
            JSR   L1201
            LDA   #$0009
            PHA
            _SetForeColor
            DEC   L0CEB
            DEC   L0CED
            JSR   L1201
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #$0074
            STA   L0CEB
            LDA   #$00AE
            STA   L0CED
            JMP   L3F73

	DO	VF
L3F65       STR   'revoyons cela.'
	ELSE
L3F65       STR   'let'27's review.'
	FIN
L3F73       LDA   #^L3F65
            STA   L0CF1
            LDA   #L3F65
            STA   L0CEF
            JSR   L1201
            LDA   #$000B
            PHA
            _SetForeColor
            DEC   L0CEB
            DEC   L0CED
            JSR   L1201
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            JMP   L3FAF

L3FAD       DW    $0000
L3FAF       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L3FAD
            ASL
            ASL
            ASL
            ASL
            ORA   L3FAD
            STA   L3FAD
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3FAD
            STAL  $E0C022
            PEA   $FFFF
            _ClearScreen
            _InitCursor
            LDA   L0E11
            BNE   L3FF8
            _ObscureCursor
L3FF8       CLC
            LDA   #$001A
            STA   L0DF5
            LDA   #$0073
            STA   L0DF7
            LDA   #$0028
            ADC   #$0001
            STA   L0DF3
	DO	VF
            LDA   #$00D8
            	ELSE
            LDA   #$00D0
	FIN
            ADC   #$0001
            STA   L0DF9
            LDA   #$0006
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$001C
            STA   L0DF5
            LDA   #$0075
            STA   L0DF7
            LDA   #$0026
            ADC   #$0001
            STA   L0DF3
	DO	VF
            LDA   #$00D6
            	ELSE
            LDA   #$00CE
	FIN
            ADC   #$0001
            STA   L0DF9
            LDA   #$000E
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   L101E
            CMP   #$0053
            BEQ   L4070
            JMP   L40AF
L4070       JMP   L407F

	DO	VF
L4073       STR   'SOUSTRACTION'
	ELSE
L4073       STR   'SUBTRACTION'
	FIN
L407F       PEA   $0076
            PEA   $0025
            _MoveTo
            LDA   #^L4073
            PHA
            LDA   #L4073
            PHA
            _DrawString
            JMP   L40A0

L409E       STR   '-'
L40A0       LDA   #^L409E
            STA   L0CF1
            LDA   #L409E
            STA   L0CEF
            JMP   L40E8
L40AF       JMP   L40BB

	DO	VF
L40B2       STR   'ADDITION'
	ELSE
L40B2       STR   'ADDITION'
	FIN
L40BB       PEA   $0082
            PEA   $0025
            _MoveTo
            LDA   #^L40B2
            PHA
            LDA   #L40B2
            PHA
            _DrawString
            JMP   L40DC

L40DA       STR   '+'
L40DC       LDA   #^L40DA
            STA   L0CF1
            LDA   #L40DA
            STA   L0CEF
L40E8       LDA   L1022
            JSR   L2BB5
            LDA   L0D31
            STA   L0CF5
            LDA   L0D31+2
            STA   L0CF7
            LDA   L0CEF
            STA   L0CF9
            LDA   L0CF1
            STA   L0CFB
            LDA   L0D03
            STA   L0CFD
            LDA   L0D03+2
            STA   L0CFF
            JSR   L1F88
            LDA   L1024
            JSR   L2BB5
            LDA   L0D03
            STA   L0CF5
            LDA   L0D03+2
            STA   L0CF7
            LDA   L0D31
            STA   L0CF9
            LDA   L0D31+2
            STA   L0CFB
            LDA   L0D03
            STA   L0CFD
            LDA   L0D03+2
            STA   L0CFF
            JSR   L1F88
            JMP   L4147

L4145       STR   '='
L4147       LDA   #^L4145
            STA   L0CF1
            LDA   #L4145
            STA   L0CEF
            LDA   L0D03
            STA   L0CF5
            LDA   L0D03+2
            STA   L0CF7
            LDA   L0CEF
            STA   L0CF9
            LDA   L0CF1
            STA   L0CFB
            LDA   L0D03
            STA   L0CFD
            LDA   L0D03+2
            STA   L0CFF
            JSR   L1F88
            LDA   L1026
            JSR   L2BB5
            LDA   L0D03
            STA   L0CF5
            LDA   L0D03+2
            STA   L0CF7
            LDA   L0D31
            STA   L0CF9
            LDA   L0D31+2
            STA   L0CFB
            LDA   L0D03
            STA   L0CFD
            LDA   L0D03+2
            STA   L0CFF
            JSR   L1F88
            LDA   #^L0D07
            STA   L0CF1
            LDA   #L0D07
            STA   L0CEF
            LDA   #$0006
            PHA
            _SetForeColor
            LDA   #$0056
            STA   L0CED
            JSR   L123A
            LDA   L101E
            CMP   #$0041
            BEQ   L41D2
            JMP   L41F2
L41D2       JMP   L41E3

	DO	VF
L41D5       STR   'Tu les ADDITIONNES.'
	ELSE
L41D5       STR   'You ADD them.'
	FIN
L41E3       LDA   #^L41D5
            STA   L0CF1
            LDA   #L41D5
            STA   L0CEF
            JMP   L4214
L41F2       JMP   L4208

	DO	VF
L41F5       STR   'Tu les SOUSTRAIS.'
	ELSE
L41F5       STR   'You SUBTRACT them.'
	FIN
L4208       LDA   #^L41F5
            STA   L0CF1
            LDA   #L41F5
            STA   L0CEF
L4214       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0079
            STA   L0CED
            JSR   L123A
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            SEC
            RTS

L423E       CLC
            LDA   #$0040
            STA   L0DF5
            LDA   #$0070
            STA   L0DF7
            LDA   #$004E
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D4
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0057
            STA   L0DF5
            LDA   #$0035
            STA   L0DF7
            LDA   #$0065
            ADC   #$0001
            STA   L0DF3
            LDA   #$0099
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0057
            STA   L0DF5
            LDA   #$00AC
            STA   L0DF7
            LDA   #$0065
            ADC   #$0001
            STA   L0DF3
            LDA   #$0110
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0042
            STA   L0DF5
            LDA   #$0072
            STA   L0DF7
            LDA   #$004C
            ADC   #$0001
            STA   L0DF3
            LDA   #$007B
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0059
            STA   L0DF5
            LDA   #$0037
            STA   L0DF7
            LDA   #$0063
            ADC   #$0001
            STA   L0DF3
            LDA   #$0040
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0059
            STA   L0DF5
            LDA   #$00AE
            STA   L0DF7
            LDA   #$0063
            ADC   #$0001
            STA   L0DF3
            LDA   #$00B7
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L4374

L4372       STR   'A'
L4374       PEA   $0073
            PEA   $004B
            _MoveTo
            LDA   #^L4372
            PHA
            LDA   #L4372
            PHA
            _DrawString
            JMP   L4395

L4393       STR   'B'
L4395       PEA   $0038
            PEA   $0062
            _MoveTo
            LDA   #^L4393
            PHA
            LDA   #L4393
            PHA
            _DrawString
            JMP   L43B6

L43B4       STR   'C'
L43B6       PEA   $00AF
            PEA   $0062
            _MoveTo
            LDA   #^L43B4
            PHA
            LDA   #L43B4
            PHA
            _DrawString
            CLC
            LDA   #$0042
            STA   L0DF5
            LDA   #$0080
            STA   L0DF7
            LDA   #$004C
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D2
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0059
            STA   L0DF5
            LDA   #$0045
            STA   L0DF7
            LDA   #$0063
            ADC   #$0001
            STA   L0DF3
            LDA   #$0097
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0059
            STA   L0DF5
            LDA   #$00BC
            STA   L0DF7
            LDA   #$0063
            ADC   #$0001
            STA   L0DF3
            LDA   #$010E
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #$0081
            STA   L0CEB
            LDA   #$004B
            STA   L0CED
            STZ   L0CF3
            LDA   L102E
            STA   L0CEF
            LDA   L1030
            STA   L0CF1
            JSR   L1201
            LDA   #$0046
            STA   L0CEB
            LDA   #$0062
            STA   L0CED
            LDA   L1032
            STA   L0CEF
            LDA   L1034
            STA   L0CF1
            JSR   L1201
            LDA   #$00BD
            STA   L0CEB
            LDA   L1036
            STA   L0CEF
            LDA   L1038
            STA   L0CF1
            JSR   L1201
            LDA   #^L0E15
            PHA
            LDA   #L0E15
            PHA
            LDA   #$0070
            PHA
            LDA   #$0040
            PHA
            LDA   #$00D4
            CLC
            ADC   #$0001
            PHA
            LDA   #$004E
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L0E70
            LDA   #^L0E1D
            PHA
            LDA   #L0E1D
            PHA
            LDA   #$0035
            PHA
            LDA   #$0057
            PHA
            LDA   #$0099
            CLC
            ADC   #$0001
            PHA
            LDA   #$0065
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0042
            STA   L0E72
            LDA   #^L0E25
            PHA
            LDA   #L0E25
            PHA
            LDA   #$00AC
            PHA
            LDA   #$0057
            PHA
            LDA   #$0110
            CLC
            ADC   #$0001
            PHA
            LDA   #$0065
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0043
            STA   L0E74
            LDA   #$0003
            STA   L0E6E
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   #$0010
            STA   L0CEB
            LDA   #$007B
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            JMP   L4592

	DO	VF
L4568       STR   '    Quel nombre et quel mot sont n'8e'cessaires'
	ELSE
L4568       STR   '     Which number and word do you need to'
	FIN
L4592       LDA   #^L4568
            STA   L0CF1
            LDA   #L4568
            STA   L0CEF
            JSR   L1201
            JMP   L45BA

	DO	VF
L45A4       STR   'pour r'8e'soudre le probl'8f'me ?'
	ELSE
L45A4       STR   'complete the problem?'
	FIN
L45BA       LDA   #^L45A4
            STA   L0CF1
            LDA   #L45A4
            STA   L0CEF
            JSR   L1201
            JSR   L19E5
            RTS

L45CD       LDA   #$0001
            STA   L0D93
            JSR   L1D38
L45D6       _InitCursor
            LDA   L0E11
            BNE   L45E9
            _ObscureCursor
L45E9       JSR   L1E5D
            LDA   L0DD8
            CMP   L0D65
            BEQ   L45F7
            JMP   L462F

L45F7       LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$00A2
            STA   L0CED
            JMP   L461C

	DO	VF
L460B       STR   'C'27'est la bonne r'8e'ponse.'
	ELSE
L460B       STR   'That is correct.'
	FIN
L461C       LDA   #^L460B
            STA   L0CF1
            LDA   #L460B
            STA   L0CEF
            JSR   L123A
            JMP   L4758
            RTS

L462F       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$00A1
            STA   L0CED
            STZ   L0CF3
            JMP   L465B

	DO	VF
L4646       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L4646       STR   'That is not correct.'
	FIN
L465B       LDA   #^L4646
            STA   L0CF1
            LDA   #L4646
            STA   L0CEF
            JSR   L123A
            LDA   #$000B
            PHA
            _SetForeColor
            LDA   #$00B1
            STA   L0CED
            LDA   L0D93
            BNE   L4683
            JMP   L46C4

L4683       DEC   L0D93
            JMP   L469B

	DO	VF
L4689       STR   'Essaye encore.'
	ELSE
L4689       STR   'Please try again.'
	FIN
L469B       LDA   #^L4689
            STA   L0CF1
            LDA   #L4689
            STA   L0CEF
            JSR   L123A
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            JSR   L1A35
            JMP   L45D6
L46C4       JMP   L46DE

	DO	VF
L46C7       STR   'La bonne r'8e'ponse '
	ELSE
L46C7       STR   'The correct answer is '
	FIN
L46DE       LDA   #^L46C7
            STA   L0CF1
            LDA   #L46C7
            STA   L0CEF
            LDA   L0CEF
            STA   L0CF5
            LDA   L0CF1
            STA   L0CF7
            LDA   L103A
            STA   L0CF9
            LDA   L103C
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            JMP   L4716

L4714       STR   '.'
L4716       LDA   #^L4714
            STA   L0CF1
            LDA   #L4714
            STA   L0CEF
            LDA   L0D31
            STA   L0CF5
            LDA   L0D31+2
            STA   L0CF7
            LDA   L0CEF
            STA   L0CF9
            LDA   L0CF1
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            LDA   L0D31
            STA   L0CEF
            LDA   L0D31+2
            STA   L0CF1
            JSR   L123A
L4758       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS

L476D       LDA   #$0001
            STA   L0D93
            CLC
            LDA   #$003C
            STA   L0DF5
            LDA   #$0000
            STA   L0DF7
            LDA   #$00C7
            ADC   #$0001
            STA   L0DF3
            LDA   #$013F
            ADC   #$0001
            STA   L0DF9
            LDA   #$0002
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            LDA   #$0007
            PHA
            _SetForeColor
            LDA   #$0042
            STA   L0CED
            LDA   L103A
            STA   L0CEF
            LDA   L103C
            STA   L0CF1
            JSR   L123A
            LDA   #$000D
            PHA
            _SetForeColor
            LDA   #$0011
            STA   L0CEB
            LDA   #$005E
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            JMP   L480E

	DO	VF
L47E4       STR   '    Quelle est ta r'8e'ponse ?  Saisis ta'
	ELSE
L47E4       STR   '     What is the answer?  Please type the'
	FIN
L480E       LDA   #^L47E4
            STA   L0CF1
            LDA   #L47E4
            STA   L0CEF
            JSR   L1201
            JMP   L483B

	DO	VF
L4820       STR   'r'8e'ponse puis appuie sur ENTREE.'
	ELSE
L4820       STR   'answer, then press RETURN.'
	FIN
L483B       LDA   #^L4820
            STA   L0CF1
            LDA   #L4820
            STA   L0CEF
            JSR   L1201
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1042
            STA   L0CEB
            LDA   L1044
            STA   L0CED
            LDA   L103E
            STA   L0CEF
            LDA   L1040
            STA   L0CF1
            JSR   L1201
            CLC
            LDA   #$0079
            STA   L0DF5
            LDA   #$00BD
            STA   L0DF7
            LDA   #$008D
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D8
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0078
            STA   L0DF5
            LDA   #$00BC
            STA   L0DF7
            LDA   #$008C
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D7
            ADC   #$0001
            STA   L0DF9
            LDA   #$0000
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0077
            STA   L0DF5
            LDA   #$00BB
            STA   L0DF7
            LDA   #$008B
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D6
            ADC   #$0001
            STA   L0DF9
            LDA   #$000F
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$0078
            STA   L0DF5
            LDA   #$00BC
            STA   L0DF7
            LDA   #$008A
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D5
            ADC   #$0001
            STA   L0DF9
            LDA   #$0008
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            CLC
            LDA   #$007B
            STA   L0DF5
            LDA   #$00BF
            STA   L0DF7
            LDA   #$0087
            ADC   #$0001
            STA   L0DF3
            LDA   #$00D2
            ADC   #$0001
            STA   L0DF9
            LDA   #$0003
            STA   L0E0D
            JSR   L1E49
            JSR   L1E51
            JSR   L1E09
            JSR   L1E39
            JSR   L1A9E
L4968       LDA   #$0002
            STA   L0D01
            LDA   #$00C1
            STA   L0CEB
            LDA   #$0085
            STA   L0CED
            STZ   L0D61
            LDA   #$0003
            STA   L0D5F
            JSR   L125E
            JSR   L1F66
            LDA   L0D63
            CMP   L1046
            BEQ   L4994
            JMP   L49A2

L4994       LDA   L0D91
            CLC
            ADC   L0D93
            STA   L0D91
            JSR   L222B
            RTS

L49A2       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$00A0
            STA   L0CED
            JMP   L49CB

	DO	VF
L49B6       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L49B6       STR   'That is not correct.'
	FIN
L49CB       LDA   #^L49B6
            STA   L0CF1
            LDA   #L49B6
            STA   L0CEF
            JSR   L123A
            LDA   #$00AE
            STA   L0CED
            LDA   #$000B
            PHA
            _SetForeColor
            LDA   L0D93
            BNE   L49F3
            JMP   L4A34
L49F3       JMP   L4A08

	DO	VF
L49F6       STR   'Essaye encore.'
	ELSE
L49F6       STR   'Please try again.'
	FIN
L4A08       LDA   #^L49F6
            STA   L0CF1
            LDA   #L49F6
            STA   L0CEF
            JSR   L123A
            DEC   L0D93
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            JSR   L1AEE
            JMP   L4968
L4A34       JMP   L4A4E

	DO	VF
L4A37       STR   'La bonne r'8e'ponse est '
	ELSE
L4A37       STR   'The correct answer is '
	FIN
L4A4E       LDA   #^L4A37
            STA   L0CF1
            LDA   #L4A37
            STA   L0CEF
            LDA   L1046
            JSR   L2BB5
            LDA   L0CEF
            STA   L0CF5
            LDA   L0CF1
            STA   L0CF7
            LDA   L0D31
            STA   L0CF9
            LDA   L0D31+2
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            JMP   L4A8C

L4A8A       STR   '.'
L4A8C       LDA   #^L4A8A
            STA   L0CF1
            LDA   #L4A8A
            STA   L0CEF
            LDA   L0D31
            STA   L0CF5
            LDA   L0D31+2
            STA   L0CF7
            LDA   L0CEF
            STA   L0CF9
            LDA   L0CF1
            STA   L0CFB
            LDA   L0D31
            STA   L0CFD
            LDA   L0D31+2
            STA   L0CFF
            JSR   L1F88
            LDA   L0D31
            STA   L0CEF
            LDA   L0D31+2
            STA   L0CF1
            JSR   L123A
            LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L0CDB
            JSR   L2AB5
            RTS

L4AE3       LDA   #$0006
            STA   L0CEB
            LDA   #$0014
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D65
            ASL
            ASL
            TAY
            LDA   L4B17,Y
            STAL  $000000
            LDA   L4B17+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L4B17       ADRL  L4B2B
            ADRL  L4BF7
            ADRL  L4CA6
            ADRL  L4D86
            ADRL  L4E66
L4B2B       JMP   L4B5D

	DO	VF
L4B2E       STR   '    Un chien a eu huit chiots. Si six'
	ELSE
L4B2E       STR   '     A terrier had eight puppies.  If six were'
	FIN
L4B5D       LDA   #^L4B2E
            STA   L0CF1
            LDA   #L4B2E
            STA   L0CEF
            JSR   L1201
            JMP   L4B97

	DO	VF
L4B6F       STR   'chiots ont '8e't'8e' donn'8e's, combien en'
	ELSE
L4B6F       STR   'given away to good homes, how many were'
	FIN
L4B97       LDA   #^L4B6F
            STA   L0CF1
            LDA   #L4B6F
            STA   L0CEF
            JSR   L1201
            JMP   L4BAF

	DO	VF
L4BA9       STR   'reste t-il ?'
	ELSE
L4BA9       STR   'left?'
	FIN
L4BAF       LDA   #^L4BA9
            STA   L0CF1
            LDA   #L4BA9
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$000B
            STA   L1016
            LDA   #$0007
            STA   L1018
            LDA   #$0002
            STA   L101A
            LDA   #$0004
            STA   L101C
            LDA   #$0043
            STA   L0D65
            LDA   #$0008
            STA   L1022
            LDA   #$0006
            STA   L1024
            LDA   #$0002
            STA   L1026
            JMP   L4F67
L4BF7       JMP   L4C27

	DO	VF
L4BFA       STR   '    Un cuisinier a pr'8e'par'8e' trois biscuits.'
	ELSE
L4BFA       STR   '     A cook baked three cookies.  Jim walked'
	FIN
L4C27       LDA   #^L4BFA
            STA   L0CF1
            LDA   #L4BFA
            STA   L0CEF
            JSR   L1201
            JMP   L4C5E

	DO	VF
L4C39       STR   'Jim en a mang'8e' deux. Combien en reste t-il ?'
	ELSE
L4C39       STR   'by and ate two.  How many were left?'
	FIN
L4C5E       LDA   #^L4C39
            STA   L0CF1
            LDA   #L4C39
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$000B
            STA   L1016
            LDA   #$0009
            STA   L1018
            LDA   #$0001
            STA   L101A
            LDA   #$0008
            STA   L101C
            LDA   #$0043
            STA   L0D65
            LDA   #$0003
            STA   L1022
            LDA   #$0002
            STA   L1024
            LDA   #$0001
            STA   L1026
            JMP   L4F67
L4CA6       JMP   L4CD7

	DO	VF
L4CA9       STR   '    Un zoo a huit singes. Un mois plus tard,'
	ELSE
L4CA9       STR   '     A zoo had eight monkeys.  A month later,'
	FIN
L4CD7       LDA   #^L4CA9
            STA   L0CF1
            LDA   #L4CA9
            STA   L0CEF
            JSR   L1201
            JMP   L4D11

	DO	VF
L4CE9       STR   'on lui donne quatre nouveaux singes.'
	ELSE
L4CE9       STR   'it was given another four monkeys.  How'
	FIN
L4D11       LDA   #^L4CE9
            STA   L0CF1
            LDA   #L4CE9
            STA   L0CEF
            JSR   L1201
            JMP   L4D3E

	DO	VF
L4D23       STR   'Combien le zoo en a-t-il en tout ?'
	ELSE
L4D23       STR   'many did they have in all?'
	FIN
L4D3E       LDA   #^L4D23
            STA   L0CF1
            LDA   #L4D23
            STA   L0CEF
            JSR   L1201
            LDA   #$0041
            STA   L101E
            LDA   #$0006
            STA   L1016
            LDA   #$000C
            STA   L1018
            LDA   #$0005
            STA   L101A
            LDA   #$0003
            STA   L101C
            LDA   #$0042
            STA   L0D65
            LDA   #$0008
            STA   L1022
            LDA   #$0004
            STA   L1024
            LDA   #$000C
            STA   L1026
            JMP   L4F67
L4D86       JMP   L4DB3

	DO	VF
L4D89       STR   '    Sept canards volent vers le sud pour l'27
	ELSE
L4D89       STR   '     Seven ducks are flying south for the'
	FIN
L4DB3       LDA   #^L4D89
            STA   L0CF1
            LDA   #L4D89
            STA   L0CEF
            JSR   L1201
            JMP   L4DF1

	DO	VF
L4DC5       STR   'hiver. Ils sont rejoints par quatre autres.'
	ELSE
L4DC5       STR   'winter.  They are joined by four more.  How'
	FIN
L4DF1       LDA   #^L4DC5
            STA   L0CF1
            LDA   #L4DC5
            STA   L0CEF
            JSR   L1201
            JMP   L4E1E

	DO	VF
L4E03       STR   'Combien sont-ils en tout ?'
	ELSE
L4E03       STR   'many are there altogether?'
	FIN
L4E1E       LDA   #^L4E03
            STA   L0CF1
            LDA   #L4E03
            STA   L0CEF
            JSR   L1201
            LDA   #$0041
            STA   L101E
            LDA   #$000B
            STA   L1016
            LDA   #$000D
            STA   L1018
            LDA   #$000A
            STA   L101A
            LDA   #$0003
            STA   L101C
            LDA   #$0041
            STA   L0D65
            LDA   #$0007
            STA   L1022
            LDA   #$0004
            STA   L1024
            LDA   #$000B
            STA   L1026
            JMP   L4F67
L4E66       JMP   L4E95

	DO	VF
L4E69       STR   '    Une poule a pondu neuf 'cf'ufs la semaine'
	ELSE
L4E69       STR   '     A chicken laid nine eggs last week and'
	FIN
L4E95       LDA   #^L4E69
            STA   L0CF1
            LDA   #L4E69
            STA   L0CEF
            JSR   L1201
            JMP   L4ED0

	DO	VF
L4EA7       STR   'derni'8f're et cinq cette semaine. Combien'
	ELSE
L4EA7       STR   'five eggs this week.  How many more eggs'
	FIN
L4ED0       LDA   #^L4EA7
            STA   L0CF1
            LDA   #L4EA7
            STA   L0CEF
            JSR   L1201
            JMP   L4F0A

	DO	VF
L4EE2       STR   'd'27cf'ufs a-t-elle pondu en plus la premi'8f're'
	ELSE
L4EE2       STR   'did she lay last week than she did this'
	FIN
L4F0A       LDA   #^L4EE2
            STA   L0CF1
            LDA   #L4EE2
            STA   L0CEF
            JSR   L1201
            JMP   L4F22

	DO	VF
L4F1C       STR   'semaine par rapport '88' la seconde ?'
	ELSE
L4F1C       STR   'week?'
	FIN
L4F22       LDA   #^L4F1C
            STA   L0CF1
            LDA   #L4F1C
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$000A
            STA   L1016
            LDA   #$000C
            STA   L1018
            LDA   #$0009
            STA   L101A
            LDA   #$0004
            STA   L101C
            LDA   #$0044
            STA   L0D65
            LDA   #$0009
            STA   L1022
            LDA   #$0005
            STA   L1024
            LDA   #$0004
            STA   L1026
L4F67       JSR   L19E5
            JSR   L30C0
            RTS

L4F6E       LDA   #$0006
            STA   L0CEB
            LDA   #$0014
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D65
            ASL
            ASL
            TAY
            LDA   L4FA2,Y
            STAL  $000000
            LDA   L4FA2+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L4FA2       ADRL  L4FB6
            ADRL  L509B
            ADRL  L516D
            ADRL  L5251
            ADRL  L52F3
L4FB6       JMP   L4FE4

	DO	VF
L4FB9       STR   '    70 '8e'tudiants ont postul'8e' '88' l'278e'quipe de'
	ELSE
L4FB9       STR   '     70 students wanted to try out for the'
	FIN
L4FE4       LDA   #^L4FB9
            STA   L0CF1
            LDA   #L4FB9
            STA   L0CEF
            JSR   L1201
            JMP   L5021

	DO	VF
L4FF6       STR   'football. Si 9 ont '8e't'8e' s'8e'lectionn'8e's,'
	ELSE
L4FF6       STR   'soccer team.  If 9 students were selected,'
	FIN
L5021       LDA   #^L4FF6
            STA   L0CF1
            LDA   #L4FF6
            STA   L0CEF
            JSR   L1201
            JMP   L5053

	DO	VF
L5033       STR   'combien ne l'27'ont pas '8e't'8e' ?'
	ELSE
L5033       STR   'how many did not make the team?'
	FIN
L5053       LDA   #^L5033
            STA   L0CF1
            LDA   #L5033
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$003D
            STA   L1016
            LDA   #$0029
            STA   L1018
            LDA   #$0045
            STA   L101A
            LDA   #$0033
            STA   L101C
            LDA   #$0041
            STA   L0D65
            LDA   #$0046
            STA   L1022
            LDA   #$0009
            STA   L1024
            LDA   #$003D
            STA   L1026
            JMP   L539B
L509B       JMP   L50C7

	DO	VF
L509E       STR   '    Un stand de hot-dogs a vendu 96 hot-'
	ELSE
L509E       STR   '     A hot dog stand sold 96 hot dogs on'
	FIN
L50C7       LDA   #^L509E
            STA   L0CF1
            LDA   #L509E
            STA   L0CEF
            JSR   L1201
            JMP   L5102

	DO	VF
L50D9       STR   'dogs mardi et 79 lundi. Combien ont '8e't'8e
	ELSE
L50D9       STR   'Tuesday and 79 on Monday.  How many were'
	FIN
L5102       LDA   #^L50D9
            STA   L0CF1
            LDA   #L50D9
            STA   L0CEF
            JSR   L1201
            JMP   L5125

	DO	VF
L5114       STR   'vendus en tout ?'
	ELSE
L5114       STR   'sold altogether?'
	FIN
L5125       LDA   #^L5114
            STA   L0CF1
            LDA   #L5114
            STA   L0CEF
            JSR   L1201
            LDA   #$0041
            STA   L101E
            LDA   #$00A5
            STA   L1016
            LDA   #$00AD
            STA   L1018
            LDA   #$00B9
            STA   L101A
            LDA   #$00AF
            STA   L101C
            LDA   #$0044
            STA   L0D65
            LDA   #$0060
            STA   L1022
            LDA   #$004F
            STA   L1024
            LDA   #$00AF
            STA   L1026
            JMP   L539B
L516D       JMP   L5199

	DO	VF
L5170       STR   '    44 enfants sont '88' Camp Mohawk. 17'
	ELSE
L5170       STR   '     44 children attend Camp Mohawk.  17'
	FIN
L5199       LDA   #^L5170
            STA   L0CF1
            LDA   #L5170
            STA   L0CEF
            JSR   L1201
            JMP   L51D6

	DO	VF
L51AB       STR   'sont au Camp du Lac Blanc. Combien d'27
	ELSE
L51AB       STR   'children attend Camp White Lake.  How many'
	FIN
L51D6       LDA   #^L51AB
            STA   L0CF1
            LDA   #L51AB
            STA   L0CEF
            JSR   L1201
            JMP   L5209

	DO	VF
L51E8       STR   'enfants de plus sont '88' Camp Mohawk ?'
	ELSE
L51E8       STR   'more children go to Camp Mohawk?'
	FIN
L5209       LDA   #^L51E8
            STA   L0CF1
            LDA   #L51E8
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$001B
            STA   L1016
            LDA   #$0021
            STA   L1018
            LDA   #$0025
            STA   L101A
            LDA   #$001D
            STA   L101C
            LDA   #$0041
            STA   L0D65
            LDA   #$002C
            STA   L1022
            LDA   #$0011
            STA   L1024
            LDA   #$001B
            STA   L1026
            JMP   L539B
L5251       JMP   L527E

	DO	VF
L5254       STR   '    Un fermier ach'8f'te 92 lapins et en'
	ELSE
L5254       STR   '     A farm bought 92 rabbits and gave 54'
	FIN
L527E       LDA   #^L5254
            STA   L0CF1
            LDA   #L5254
            STA   L0CEF
            JSR   L1201
            JMP   L52AB

	DO	VF
L5290       STR   'donne 54. Combien en reste t-il ?'
	ELSE
L5290       STR   'away.  How many were left?'
	FIN
L52AB       LDA   #^L5290
            STA   L0CF1
            LDA   #L5290
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$002A
            STA   L1016
            LDA   #$0030
            STA   L1018
            LDA   #$0024
            STA   L101A
            LDA   #$0026
            STA   L101C
            LDA   #$0044
            STA   L0D65
            LDA   #$005C
            STA   L1022
            LDA   #$0036
            STA   L1024
            LDA   #$0026
            STA   L1026
            JMP   L539B
L52F3       JMP   L531E

	DO	VF
L52F6       STR   '    Un gar'8d'on a besoin de 32 billes. Il'
	ELSE
L52F6       STR   '     A boy needs 32 marbles.  He has 31'
	FIN
L531E       LDA   #^L52F6
            STA   L0CF1
            LDA   #L52F6
            STA   L0CEF
            JSR   L1201
            JMP   L5356

	DO	VF
L5330       STR   'en a 31. Combien lui en faut-il en plus ?'
	ELSE
L5330       STR   'marbles.  How many more does he need?'
	FIN
L5356       LDA   #^L5330
            STA   L0CF1
            LDA   #L5330
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$0021
            STA   L1016
            LDA   #$0001
            STA   L1018
            LDA   #$0003
            STA   L101A
            LDA   #$0002
            STA   L101C
            LDA   #$0042
            STA   L0D65
            LDA   #$0020
            STA   L1022
            LDA   #$001F
            STA   L1024
            LDA   #$0001
            STA   L1026
L539B       JSR   L19E5
            JSR   L30C0
            RTS

L53A2       LDA   #$0006
            STA   L0CEB
            LDA   #$0014
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D65
            ASL
            ASL
            TAY
            LDA   L53D6,Y
            STAL  $000000
            LDA   L53D6+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L53D6       ADRL  L53EA
            ADRL  L54BD
            ADRL  L558F
            ADRL  L565D
            ADRL  L5733
L53EA       JMP   L5419

	DO	VF
L53ED       STR   '    Un g'8e'ant mesure 460 m'8f'tres et'
	ELSE
L53ED       STR   '     A giant was 460 feet tall and Jack was'
	FIN
L5419       LDA   #^L53ED
            STA   L0CF1
            LDA   #L53ED
            STA   L0CEF
            JSR   L1201
            JMP   L5452

	DO	VF
L542B       STR   'Jack mesure 75 m'8f'tres. De combien le'
	ELSE
L542B       STR   '75 feet tall.  How much taller was the'
	FIN
L5452       LDA   #^L542B
            STA   L0CF1
            LDA   #L542B
            STA   L0CEF
            JSR   L1201
            JMP   L5475

	DO	VF
L5464       STR   'g'8e'ant est-il plus grand que Jack ?'
	ELSE
L5464       STR   'giant than Jack?'
	FIN
L5475       LDA   #^L5464
            STA   L0CF1
            LDA   #L5464
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$018B
            STA   L1016
            LDA   #$0181
            STA   L1018
            LDA   #$014F
            STA   L101A
            LDA   #$01B3
            STA   L101C
            LDA   #$0042
            STA   L0D65
            LDA   #$01CC
            STA   L1022
            LDA   #$004B
            STA   L1024
            LDA   #$0181
            STA   L1026
            JMP   L5878
L54BD       JMP   L54EF

	DO	VF
L54C0       STR   '    Un arbre mesure 312 m'8f'tres de haut. Si un'
	ELSE
L54C0       STR   '     A tree is 312 feet tall.  If a lumberjack'
	FIN
L54EF       LDA   #^L54C0
            STA   L0CF1
            LDA   #L54C0
            STA   L0CEF
            JSR   L1201
            JMP   L552B

	DO	VF
L5501       STR   'b'9e'cheron coupe 78 m'8f'tres, combien mesure'
	ELSE
L5501       STR   'cuts 78 feet off the top, how high is the'
	FIN
L552B       LDA   #^L5501
            STA   L0CF1
            LDA   #L5501
            STA   L0CEF
            JSR   L1201
            JMP   L5547

	DO	VF
L553D       STR   'l'27'arbre maintenant ?'
	ELSE
L553D       STR   'tree now?'
	FIN
L5547       LDA   #^L553D
            STA   L0CF1
            LDA   #L553D
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$0106
            STA   L1016
            LDA   #$00EA
            STA   L1018
            LDA   #$00E8
            STA   L101A
            LDA   #$00F4
            STA   L101C
            LDA   #$0042
            STA   L0D65
            LDA   #$0138
            STA   L1022
            LDA   #$004E
            STA   L1024
            LDA   #$00EA
            STA   L1026
            JMP   L5878
L558F       JMP   L55BF

	DO	VF
L5592       STR   '    Un ogre a mang'8e' 415 donuts et sa femme'
	ELSE
L5592       STR   '     A big man ate 415 donuts while his wife'
	FIN
L55BF       LDA   #^L5592
            STA   L0CF1
            LDA   #L5592
            STA   L0CEF
            JSR   L1201
            JMP   L55F7

	DO	VF
L55D1       STR   'en a mang'8e' 87. Combien de donuts'
	ELSE
L55D1       STR   'ate 87 donuts.  How many did they eat'
	FIN
L55F7       LDA   #^L55D1
            STA   L0CF1
            LDA   #L55D1
            STA   L0CEF
            JSR   L1201
            JMP   L5615

	DO	VF
L5609       STR   'ont-ils mang'8e' ensemble ?'
	ELSE
L5609       STR   'altogether?'
	FIN
L5615       LDA   #^L5609
            STA   L0CF1
            LDA   #L5609
            STA   L0CEF
            JSR   L1201
            LDA   #$0041
            STA   L101E
            LDA   #$01EC
            STA   L1016
            LDA   #$0200
            STA   L1018
            LDA   #$01F6
            STA   L101A
            LDA   #$0201
            STA   L101C
            LDA   #$0043
            STA   L0D65
            LDA   #$019F
            STA   L1022
            LDA   #$0057
            STA   L1024
            LDA   #$01F6
            STA   L1026
            JMP   L5878
L565D       JMP   L568B

	DO	VF
L5660       STR   '    Une baleine bleue mesure 175 m'8f'tres de'
	ELSE
L5660       STR   '     A blue whale is 175 feet long and its'
	FIN
L568B       LDA   #^L5660
            STA   L0CF1
            LDA   #L5660
            STA   L0CEF
            JSR   L1201
            JMP   L56C7

	DO	VF
L569D       STR   'long et son b'8e'b'8e' 42 m'8f'tres. De combien'
	ELSE
L569D       STR   'baby is 42 feet long.  How much longer is'
	FIN
L56C7       LDA   #^L569D
            STA   L0CF1
            LDA   #L569D
            STA   L0CEF
            JSR   L1201
            JMP   L56EB

	DO	VF
L56D9       STR   'la maman baleine est-elle plus longue ?'
	ELSE
L56D9       STR   'the mother whale?'
	FIN
L56EB       LDA   #^L56D9
            STA   L0CF1
            LDA   #L56D9
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$008A
            STA   L1016
            LDA   #$008F
            STA   L1018
            LDA   #$0084
            STA   L101A
            LDA   #$0085
            STA   L101C
            LDA   #$0044
            STA   L0D65
            LDA   #$00AF
            STA   L1022
            LDA   #$002A
            STA   L1024
            LDA   #$0085
            STA   L1026
            JMP   L5878
L5733       JMP   L5762

	DO	VF
L5736       STR   '    La maison de Grand-M'8f're est '88' 235 km.'
	ELSE
L5736       STR   '     Grandmother'27's house is 235 miles away.'
	FIN
L5762       LDA   #^L5736
            STA   L0CF1
            LDA   #L5736
            STA   L0CEF
            JSR   L1201
            JMP   L579E

	DO	VF
L5774       STR   'En rentrant chez elle, elle tombe en panne.'
	ELSE
L5774       STR   'While driving to her house, our car broke'
	FIN
L579E       LDA   #^L5774
            STA   L0CF1
            LDA   #L5774
            STA   L0CEF
            JSR   L1201
            JMP   L57DA

	DO	VF
L57B0       STR   'Si elle '8e'tait '88' 57 km de sa maison,'
	ELSE
L57B0       STR   'down.  If we were 57 miles from her house'
	FIN
L57DA       LDA   #^L57B0
            STA   L0CF1
            LDA   #L57B0
            STA   L0CEF
            JSR   L1201
            JMP   L5816

	DO	VF
L57EC       STR   'alors combien de kilom'8f'tres avait-elle'
	ELSE
L57EC       STR   'when the car broke down, then how far had'
	FIN
L5816       LDA   #^L57EC
            STA   L0CF1
            LDA   #L57EC
            STA   L0CEF
            JSR   L1201
            JMP   L5833

	DO	VF
L5828       STR   'd'8e'j'88' parcouru ?'
	ELSE
L5828       STR   'we driven?'
	FIN
L5833       LDA   #^L5828
            STA   L0CF1
            LDA   #L5828
            STA   L0CEF
            JSR   L1201
            LDA   #$0053
            STA   L101E
            LDA   #$00B6
            STA   L1016
            LDA   #$00AC
            STA   L1018
            LDA   #$00BC
            STA   L101A
            LDA   #$00B2
            STA   L101C
            LDA   #$0044
            STA   L0D65
            LDA   #$00EB
            STA   L1022
            LDA   #$0039
            STA   L1024
            LDA   #$00B2
            STA   L1026
L5878       JSR   L19E5
            JSR   L30C0
            RTS

L587F       LDA   #$0006
            STA   L0CEB
            LDA   #$0014
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$0041
            STA   L101E
            LDA   L0D65
            ASL
            ASL
            TAY
            LDA   L58B9,Y
            STAL  $000000
            LDA   L58B9+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L58B9       ADRL  L58C5
            ADRL  L59DA
            ADRL  L5AA9
L58C5       JMP   L58F3

	DO	VF
L58C8       STR   '    Henry a grimp'8e' 221 m'8f'tres d'27'une montagne.'
	ELSE
L58C8       STR   '     Henry climbed 221 feet up a mountain.'
	FIN
L58F3       LDA   #^L58C8
            STA   L0CF1
            LDA   #L58C8
            STA   L0CEF
            JSR   L1201
            JMP   L592D

	DO	VF
L5905       STR   'Une heure apr'8f's, il avait grimp'8e' 79 m'8f'tres'
	ELSE
L5905       STR   'One hour later he climbed up another 79'
	FIN
L592D       LDA   #^L5905
            STA   L0CF1
            LDA   #L5905
            STA   L0CEF
            JSR   L1201
            JMP   L596B

	DO	VF
L593F       STR   'de plus. La montagne mesure 400 m'8f'tres.'
	ELSE
L593F       STR   'feet.  The mountain was 400 feet high.  How'
	FIN
L596B       LDA   #^L593F
            STA   L0CF1
            LDA   #L593F
            STA   L0CEF
            JSR   L1201
            JMP   L5992

	DO	VF
L597D       STR   'Jusqu'27'o'9d' Henry est-il mont'8e' ?'
	ELSE
L597D       STR   'far did Henry climb?'
	FIN
L5992       LDA   #^L597D
            STA   L0CF1
            LDA   #L597D
            STA   L0CEF
            JSR   L1201
            LDA   #$0190
            STA   L1020
            LDA   #$0122
            STA   L1016
            LDA   #$012C
            STA   L1018
            LDA   #$0118
            STA   L101A
            LDA   #$0136
            STA   L101C
            LDA   #$0042
            STA   L0D65
            LDA   #$00DD
            STA   L1022
            LDA   #$004F
            STA   L1024
            LDA   #$012C
            STA   L1026
            JMP   L5BC2
L59DA       JMP   L5A0C

	DO	VF
L59DD       STR   '    Une arm'8e' a 60 chars, 246 avions et 836'
	ELSE
L59DD       STR   '     An army has 60 tanks, 246 planes, and 836'
	FIN
L5A0C       LDA   #^L59DD
            STA   L0CF1
            LDA   #L59DD
            STA   L0CEF
            JSR   L1201
            JMP   L5A49

	DO	VF
L5A1E       STR   'soldats. Combien de chars et d'27'avions'
	ELSE
L5A1E       STR   'troops.  How many tanks and planes does it'
	FIN
L5A49       LDA   #^L5A1E
            STA   L0CF1
            LDA   #L5A1E
            STA   L0CEF
            JSR   L1201
            JMP   L5A61

	DO	VF
L5A5B       STR   'poss'8f'de-t-elle ?'
	ELSE
L5A5B       STR   'have?'
	FIN
L5A61       LDA   #^L5A5B
            STA   L0CF1
            LDA   #L5A5B
            STA   L0CEF
            JSR   L1201
            LDA   #$0344
            STA   L1020
            LDA   #$0168
            STA   L1016
            LDA   #$0130
            STA   L1018
            LDA   #$0128
            STA   L101A
            LDA   #$0132
            STA   L101C
            LDA   #$0044
            STA   L0D65
            LDA   #$003C
            STA   L1022
            LDA   #$00F6
            STA   L1024
            LDA   #$0132
            STA   L1026
            JMP   L5BC2
L5AA9       JMP   L5AD7

	DO	VF
L5AAC       STR   '    Une usine peut produire 399 cookies'
	ELSE
L5AAC       STR   '     A cookie factory can bake 399 cookies'
	FIN
L5AD7       LDA   #^L5AAC
            STA   L0CF1
            LDA   #L5AAC
            STA   L0CEF
            JSR   L1201
            JMP   L5B12

	DO	VF
L5AE9       STR   'par jour. Le matin, elle produit 242'
	ELSE
L5AE9       STR   'in one day.  In the morning it baked 242'
	FIN
L5B12       LDA   #^L5AE9
            STA   L0CF1
            LDA   #L5AE9
            STA   L0CEF
            JSR   L1201
            JMP   L5B4E

	DO	VF
L5B24       STR   'cookies et l'27'apr'8f's-midi, 57 cookies.'
	ELSE
L5B24       STR   'cookies and in the afternoon, 57 cookies.'
	FIN
L5B4E       LDA   #^L5B24
            STA   L0CF1
            LDA   #L5B24
            STA   L0CEF
            JSR   L1201
            JMP   L5B7D

	DO	VF
L5B60       STR   'Combien en a-t-elle produit en un jour ?'
	ELSE
L5B60       STR   'How many were baked all day?'
	FIN
L5B7D       LDA   #^L5B60
            STA   L0CF1
            LDA   #L5B60
            STA   L0CEF
            JSR   L1201
            LDA   #$018F
            STA   L1020
            LDA   #$0121
            STA   L1016
            LDA   #$012B
            STA   L1018
            LDA   #$0135
            STA   L101A
            LDA   #$012A
            STA   L101C
            LDA   #$0042
            STA   L0D65
            LDA   #$00F2
            STA   L1022
            LDA   #$0039
            STA   L1024
            LDA   #$012B
            STA   L1026
L5BC2       _HideCursor
            JSR   L19E5
            JSR   L30C0
            JSR   L355A
            RTS

L5BD3       LDA   #$0006
            STA   L0CEB
            LDA   #$0014
            STA   L0CED
            LDA   #$0009
            STA   L0CF3
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L0D65
            ASL
            ASL
            TAY
            LDA   L5C07,Y
            STAL  $000000
            LDA   L5C07+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L5C07       ADRL  L5C0F
            ADRL  L5D2C
L5C0F       JMP   L5C3F

	DO	VF
L5C12       STR   '    Un fermier a des chevaux, 9 vaches,'
	ELSE
L5C12       STR   '     A farmer has horses, 9 cows, 9 rabbits,'
	FIN
L5C3F       LDA   #^L5C12
            STA   L0CF1
            LDA   #L5C12
            STA   L0CEF
            JSR   L1201
            JMP   L5C7C

	DO	VF
L5C51       STR   '9 lapins et 18 poules. Combien d'27'animaux'
	ELSE
L5C51       STR   'and 18 chickens.  How many animals does he'
	FIN
L5C7C       LDA   #^L5C51
            STA   L0CF1
            LDA   #L5C51
            STA   L0CEF
            JSR   L1201
            JMP   L5C94

	DO	VF
L5C8E       STR   'poss'8f'de-t-il ?'
	ELSE
L5C8E       STR   'have?'
	FIN
L5C94       LDA   #^L5C8E
            STA   L0CF1
            LDA   #L5C8E
            STA   L0CEF
            JSR   L1201
            JMP   L5CAF

	DO	VF
L5CA6       STR   '8 chevaux'
	ELSE
L5CA6       STR   '8 horses'
	FIN
L5CAF       LDA   #^L5CA6
            STA   L1030
            LDA   #L5CA6
            STA   L102E
            JMP   L5CC5

	DO	VF
L5CBE       STR   '9 vaches'
	ELSE
L5CBE       STR   '9 cows'
	FIN
L5CC5       LDA   #^L5CBE
            STA   L1034
            LDA   #L5CBE
            STA   L1032
            JMP   L5CE0

	DO	VF
L5CD4       STR   '18 poules'
	ELSE
L5CD4       STR   '18 chickens'
	FIN
L5CE0       LDA   #^L5CD4
            STA   L1038
            LDA   #L5CD4
            STA   L1036
            LDA   L102E
            STA   L103A
            LDA   L1030
            STA   L103C
            LDA   #$0041
            STA   L0D65
            JMP   L5D0B

	DO	VF
L5D01       STR   '8+9+9+18='
	ELSE
L5D01       STR   '8+9+9+18='
	FIN
L5D0B       LDA   #^L5D01
            STA   L1040
            LDA   #L5D01
            STA   L103E
            LDA   #$0069
            STA   L1042
            LDA   #$0085
            STA   L1044
            LDA   #$002C
            STA   L1046
            JMP   L5E50
L5D2C       JMP   L5D59

	DO	VF
L5D2F       STR   '    Une dame riche, ses domestiques, ses'
	ELSE
L5D2F       STR   '     A wealthy lady, her servants, her 11'
	FIN
L5D59       LDA   #^L5D2F
            STA   L0CF1
            LDA   #L5D2F
            STA   L0CEF
            JSR   L1201
            JMP   L5D97

	DO	VF
L5D6B       STR   '11 chiens et ses 18 chats se sont endormis.'
	ELSE
L5D6B       STR   'dogs, and her 18 cats all fell asleep.  How'
	FIN
L5D97       LDA   #^L5D6B
            STA   L0CF1
            LDA   #L5D6B
            STA   L0CEF
            JSR   L1201
            JMP   L5DBB

	DO	VF
L5DA9       STR   'Combien se sont endormis ?'
	ELSE
L5DA9       STR   'many fell asleep?'
	FIN
L5DBB       LDA   #^L5DA9
            STA   L0CF1
            LDA   #L5DA9
            STA   L0CEF
            JSR   L1201
            JMP   L5DD8

	DO	VF
L5DCD       STR   '8 domestiques'
	ELSE
L5DCD       STR   '8 servants'
	FIN
L5DD8       LDA   #^L5DCD
            STA   L1030
            LDA   #L5DCD
            STA   L102E
            JMP   L5DEF

	DO	VF
L5DE7       STR   '11 chiens'
	ELSE
L5DE7       STR   '11 dogs'
	FIN
L5DEF       LDA   #^L5DE7
            STA   L1034
            LDA   #L5DE7
            STA   L1032
            JMP   L5E06

	DO	VF
L5DFE       STR   '18 chats'
	ELSE
L5DFE       STR   '18 cats'
	FIN
L5E06       LDA   #^L5DFE
            STA   L1038
            LDA   #L5DFE
            STA   L1036
            LDA   L102E
            STA   L103A
            LDA   L1030
            STA   L103C
            LDA   #$0041
            STA   L0D65
            JMP   L5E32

	DO	VF
L5E27       STR   '1+8+11+18='
	ELSE
L5E27       STR   '1+8+11+18='
	FIN
L5E32       LDA   #^L5E27
            STA   L1040
            LDA   #L5E27
            STA   L103E
            LDA   #$0069
            STA   L1042
            LDA   #$0085
            STA   L1044
            LDA   #$0026
            STA   L1046
L5E50       _HideCursor
            JSR   L19E5
            RTS

L5E5B       LDX   #$0000
L5E5E       LDA   L62B5,X
            STA   L5FE4,X
            INX
            INX
            CPX   #$0008
            BCC   L5E5E
            PEA   $0003
            _IntSource
            PHA
            PEA   $0064
            _GetSCB
            JSR   L1056
            PLA
            AND   #$000F
            PHA
            LDA   #^L62D5
            PHA
            LDA   #L62D5
            PHA
            _GetColorTable
            JSR   L1056
            PHA
            PEA   $0064
            _GetSCB
            JSR   L1056
            PLA
            AND   #$000F
            PHA
            LDA   #^L62F5
            PHA
            LDA   #L62F5
            PHA
            _GetColorTable
            JSR   L1056
            LDA   #^L5F18
            PHA
            LDA   #L5F18
            PHA
            _SetHeartBeat
            JSR   L1056
            PEA   $0002
            _IntSource
            RTS

L5EDC       PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L62D5
            PHA
            LDA   #L62D5
            PHA
            _SetColorTable
            JSR   L1056
            LDA   #^L5F18
            PHA
            LDA   #L5F18
            PHA
            _DelHeartBeat
            JSR   L1056
            PEA   $0002
            _IntSource
            RTS

L5F18       ADRL  $00000000
L5F1C       DW    $0001
            DW    $A55A
            PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L5FEC
L5F29       JSR   L5F6A
            INC   L5FEC
            INC   L5FEC
            LDA   L5FEC
            CMP   #$0008
            BCC   L5F29
            PHA
            PEA   $0064
            _GetSCB
            JSR   L1056
            PLA
            AND   #$000F
            PHA
            LDA   #^L62F5
            PHA
            LDA   #L62F5
            PHA
            _SetColorTable
            JSR   L1056
            LDA   #$0001
            STA   L5F1C
            SEP   #$30
            PLA
            PLB
            RTL

            MX    %00
L5F6A       LDX   L5FEC
            DEC   L5FE4,X
            BEQ   L5F73
            RTS

L5F73       LDA   L62B5,X
            STA   L5FE4,X
            LDA   L62BD,X
            STA   L5FE0
            LDA   L62CD,X
            STA   L5FE2
L5F85       LDA   L5FE2
            CMP   L62C5,X
            BCC   L5F95
            BEQ   L5F95
            LDA   L62BD,X
            STA   L5FE2
L5F95       LDY   L5FE0
            LDA   L62D5,Y
            LDY   L5FE2
            STA   L62F5,Y
            INC   L5FE2
            INC   L5FE2
            INC   L5FE0
            INC   L5FE0
            LDA   L5FE0
            CMP   L62C5,X
            BCC   L5F85
            BEQ   L5F85
            LDA   L62CD,X
            CLC
            ADC   L62AD,X
            STA   L62CD,X
            CMP   #$8000
            BCS   L5FCB
            CMP   L62BD,X
            BCS   L5FD2
L5FCB       LDA   L62C5,X
            STA   L62CD,X
            RTS

L5FD2       CMP   L62C5,X
            BCC   L5FDF
            BEQ   L5FDF
            LDA   L62BD,X
            STA   L62CD,X
L5FDF       RTS

L5FE0       DW    $0000
L5FE2       DW    $0000
L5FE4       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L5FEC       DW    $0000
L5FEE       PHA
            PEA   $0064
            _GetSCB
            JSR   L1056
            PLA
            AND   #$000F
            STA   L615C
            LDA   L615C
            PHA
            LDA   #^L615E
            PHA
            LDA   #L615E
            PHA
            _GetColorTable
            JSR   L1056
            PEA   $0001
            LDA   #^L615E
            PHA
            LDA   #L615E
            PHA
            _SetColorTable
            JSR   L1056
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L0BA6
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L1056
            PLA
            STA   $00
            STA   L6315
            PLA
            STA   $02
            STA   L6315+2
            LDY   #$0000
            LDA   [$00],Y
            STA   L6319
            LDY   #$0002
            LDA   [$00],Y
            STA   L6319+2
            LDA   #^L6323
            STA   L0BB6+2
            LDA   #L6323
            STA   L0BB6
            LDA   #$000F
            STA   L0BBA
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            LDA   #$00E1
            STA   L0BB6+2
            LDA   #$9E00
            STA   L0BB6
            PHA
            PHA
            LDA   L6330
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L0BBA
            PLA
            STA   L0BBA+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            LDA   #^L6332
            STA   L0BB6+2
            LDA   #L6332
            STA   L0BB6
            LDA   #$0002
            STA   L0BBA
            LDA   #$0000
            STA   L0BBA+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            LDA   L6319
            STA   L0BB6
            LDA   L6319+2
            STA   L0BB6+2
            LDA   #$0320
            STA   L0BBA
            LDA   #$0000
            STA   L0BBA+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            LDA   L0CBD
            STA   L0B8E
            LDA   L0CBD+2
            STA   L0B90
            JSR   L1D48
            LDA   L0B92
            STA   L0CC1
            LDA   L0B94
            STA   L0CC3
            LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HLock
            JSR   L1056
            LDA   L0CC1
            STA   L0BB6
            LDA   L0CC3
            STA   L0BB6+2
            LDA   #$8000
            STA   L0BBA
            LDA   #$0000
            STA   L0BBA+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0BB4
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0BC2
            RTS

L615C       DW    $0000
L615E       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L617E       _HideCursor
            LDA   #$00E1
            STA   L0BB6+2
            LDA   #$2000
            STA   L0BB6
            LDA   L0CC1
            STA   L631D
            LDA   L0CC3
            STA   L631F
            LDA   #$00C8
            STA   L0BA2
            LDA   #$0000
            STA   L0CE3
L61A9       LDA   #$0000
            STA   L6321
            LDA   #$00A0
            STA   L0CD9
L61B5       PHA
            LDA   L631F
            PHA
            LDA   L631D
            PHA
            LDA   L6319
            STA   $00
            LDA   L6319+2
            STA   $02
            LDA   L0CE3
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L0BB6
            PHA
            LDA   #L0BB6
            PHA
            LDA   #^L0CD9
            PHA
            LDA   #L0CD9
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L6321
            STA   L6321
            LDA   L0CD9
            BNE   L61B5
            LDA   L631D
            CLC
            ADC   L6321
            STA   L631D
            LDA   L631F
            ADC   #$0000
            STA   L631F
            LDA   L0CE3
            PHA
            PEA   $0000
            _SetSCB
            JSR   L1056
            INC   L0CE3
            DEC   L0BA2
            BEQ   L6224
            JMP   L61A9

L6224       LDA   L6315+2
            PHA
            LDA   L6315
            PHA
            _DisposeHandle
            JSR   L1056
            LDA   L631D
            CLC
            ADC   #$0009
            STA   L631D
            LDA   L631F
            ADC   #$0000
            STA   L631F
            LDX   #$0000
L624C       LDA   L631D
            STA   $00
            LDA   L631F
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L6263
            LDA   #$FFFE
            JMP   L6266

L6263       LDA   #$0002
L6266       STA   L62AD,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L62BD,X
            STA   L62CD,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L62C5,X
            LDA   L631D
            CLC
            ADC   #$0008
            STA   L631D
            INX
            INX
            CPX   #$0008
            BCS   L6296
            JMP   L624C

L6296       LDA   L0CBD+2
            PHA
            LDA   L0CBD
            PHA
            _HUnlock
            JSR   L1056
            RTS

            DB    $00
            DB    $00
            DB    $00
            DB    $00
L62AD       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L62B5       DB    $05
            DB    $00
L62B7       DB    $05
            DB    $00
L62B9       DB    $05
            DB    $00
L62BB       DB    $05
            DB    $00
L62BD       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L62C5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L62CD       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L62D5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L62F5       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L6315       ADRL  $00000000
L6319       ADRL  $00000000
L631D       DB    $00
            DB    $00
L631F       DB    $00
            DB    $00
L6321       DB    $00
            DB    $00
L6323       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L6330       DB    $00
            DB    $00
L6332       DB    $00
            DB    $00
            JSR   L21A2
            JSR   L112F
            JSR   L617E
            JSR   L1A9E
            PEA   $0000
            _ClearScreen
            JSR   L113E
            LDA   L0CC1
            STA   $00
            LDA   L0CC3
            STA   $02
            LDA   #$2000
            STA   $04
            LDA   #$00E1
            STA   $06
            LDA   #$5000
            STA   L6391
            LDA   #$3E80
            STA   L0BA0
L636D       PEA   $0000
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
            DEC   L6391
            BNE   L636D
            JSR   L1AEE
            RTS

L6391       DW    $0000
            JSR   L21A2
            LDA   #$2000
            STA   $00
            LDA   #$00E1
            STA   $02
            LDA   #$4000
            STA   L63DB
            LDA   #$3E80
            STA   L0BA0
L63AC       PEA   $0000
            _Random
            PLA
            LSR
            LSR
            LSR
            ASL
            ASL
            CMP   #$7CFF
            BCS   L63AC
            TAY
            LDA   #$0000
            STA   [$00],Y
            INY
            INY
            STA   [$00],Y
            DEC   L63DB
            BNE   L63AC
            PEA   $0000
            _ClearScreen
            RTS

L63DB       DW    $0000

