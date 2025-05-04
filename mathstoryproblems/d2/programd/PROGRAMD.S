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
            STA   L1C99
            JSR   L2027
            LDA   L1C99
            AND   #$F0FF
            ORA   #$0100
            STA   L1C9B
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L1C9B
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L2027
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L1C9D
            LDA   L1C9D
            TAY
            CLC
            ADC   #$0100
            STA   L1C9D
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L1C99
            PHA
            _EMStartUp
            JSR   L2027
            LDY   L1C9D
            TYA
            CLC
            ADC   #$0300
            STA   L1C9D
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L1C99
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
            JSR   L2027
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
            JSR   L2027
            PLA
            STA   L1C8B
            PLA
            STA   L1C8D
            LDA   L1C8D
            PHA
            LDA   L1C8B
            PHA
            _GetClip
            JSR   L2027
            PHA
            PHA
            _NewRgn
            JSR   L2027
            PLA
            STA   L1EAB
            PLA
            STA   L1EAB+2
            LDA   L1EAB+2
            PHA
            LDA   L1EAB
            PHA
            _GetClip
            JSR   L2027
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L1C9B
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L2027
            PLA
            STA   L1CCF
            PLA
            STA   L1CD1
            LDA   #$8000
            STA   L1CDD
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L1C9B
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L2027
            PLA
            STA   L1EE5
            PLA
            STA   L1EE5+2
            JSR   L2AF0
            JMP   L01C5

L01B6       STR   'SUBD'
L01BB       DW    $0000       ;  ref num
            ADRL  L01B6       ;  path name
            ADRL  $00000000   ;  reserved
L01C5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01BB
            JSR   L2027
            LDA   L01BB
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
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
            JSR   L5231
            LDA   #$2000
            STA   L1CEF
            JSR   L2AE0
            STZ   L1CED
            JSR   L2152
L0221       JMP   L0237

L0224       STR   'submenub'
L022D       DW    $0000       ;  ref num
            ADRL  L0224       ;  path name
            ADRL  $00000000   ;  reserved
L0237       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L022D
            JSR   L2027
            LDA   L022D
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L0255

L0253       DW    $0000
L0255       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L0253
            ASL
            ASL
            ASL
            ASL
            ORA   L0253
            STA   L0253
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0253
            STAL  $E0C022
            JSR   L5231
            _InitCursor
            _ObscureCursor
            LDA   #^L1E14
            PHA
            LDA   #L1E14
            PHA
            LDA   #$0039
            PHA
            LDA   #$003D
            PHA
            LDA   #$00ED
            CLC
            ADC   #$0001
            PHA
            LDA   #$004D
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L1E6F
            LDA   #^L1E1C
            PHA
            LDA   #L1E1C
            PHA
            LDA   #$0039
            PHA
            LDA   #$0052
            PHA
            LDA   #$0109
            CLC
            ADC   #$0001
            PHA
            LDA   #$0062
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0042
            STA   L1E71
            LDA   #^L1E24
            PHA
            LDA   #L1E24
            PHA
            LDA   #$0039
            PHA
            LDA   #$0067
            PHA
            LDA   #$00CC
            CLC
            ADC   #$0001
            PHA
            LDA   #$0077
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0043
            STA   L1E73
            LDA   #^L1E2C
            PHA
            LDA   #L1E2C
            PHA
            LDA   #$0039
            PHA
            LDA   #$007C
            PHA
            LDA   #$0111
            CLC
            ADC   #$0001
            PHA
            LDA   #$008C
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0052
            STA   L1E75
            LDA   #$0004
            STA   L1E6D
            JSR   L2AE0
            JSR   L2C8E
            LDA   L1DE7
            CMP   #$0052
            BNE   L0359
            JMP   L1C27

L0359       CMP   #$0041
            BNE   L0361
            JMP   L036C

L0361       CMP   #$0042
            BNE   L0369
            JMP   L0B7D
L0369       JMP   L125F

L036C       JSR   L2100
            JMP   L0374

L0372       DW    $0000
L0374       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0372
            ASL
            ASL
            ASL
            ASL
            ORA   L0372
            STA   L0372
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0372
            STAL  $E0C022
            JSR   L2C12
            PEA   $2222
            _ClearScreen
            JSR   L210F
            LDA   #$000A
            STA   L1CF5
            LDA   #$0051
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L03FC

	DO	VF
L03D0       STR   '     When we measure distances, we know how'
	ELSE
L03D0       STR   '     When we measure distances, we know how'
	FIN
L03FC       LDA   #^L03D0
            STA   L1CFB
            LDA   #L03D0
            STA   L1CF9
            JSR   L220B
            JMP   L0432

	DO	VF
L040E       STR   'far away one thing is from another.'
	ELSE
L040E       STR   'far away one thing is from another.'
	FIN
L0432       LDA   #^L040E
            STA   L1CFB
            LDA   #L040E
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            PEA   $2222
            _ClearScreen
            LDA   #$0009
            STA   L1CF5
            STA   L1CFD
            LDA   #$004D
            STA   L1CF7
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L0497

	DO	VF
L046B       STR   '     We can measure how many miles you live'
	ELSE
L046B       STR   '     We can measure how many miles you live'
	FIN
L0497       LDA   #^L046B
            STA   L1CFB
            LDA   #L046B
            STA   L1CF9
            JSR   L220B
            JMP   L04D1

	DO	VF
L04A9       STR   'from school, or how many feet long your'
	ELSE
L04A9       STR   'from school, or how many feet long your'
	FIN
L04D1       LDA   #^L04A9
            STA   L1CFB
            LDA   #L04A9
            STA   L1CF9
            JSR   L220B
            JMP   L050F

	DO	VF
L04E3       STR   'room is, or how many inches wide your front'
	ELSE
L04E3       STR   'room is, or how many inches wide your front'
	FIN
L050F       LDA   #^L04E3
            STA   L1CFB
            LDA   #L04E3
            STA   L1CF9
            JSR   L220B
            JMP   L052A

	DO	VF
L0521       STR   'door is.'
	ELSE
L0521       STR   'door is.'
	FIN
L052A       LDA   #^L0521
            STA   L1CFB
            LDA   #L0521
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            PEA   $2222
            _ClearScreen
            LDA   #$000D
            STA   L1CF5
            LDA   #$004F
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L0593

	DO	VF
L0566       STR   '     Miles, yards, feet, and inches are some'
	ELSE
L0566       STR   '     Miles, yards, feet, and inches are some'
	FIN
L0593       LDA   #^L0566
            STA   L1CFB
            LDA   #L0566
            STA   L1CF9
            JSR   L220B
            JMP   L05C9

	DO	VF
L05A5       STR   'words that tell us we are measuring'
	ELSE
L05A5       STR   'words that tell us we are measuring'
	FIN
L05C9       LDA   #^L05A5
            STA   L1CFB
            LDA   #L05A5
            STA   L1CF9
            JSR   L220B
            JMP   L05E5

	DO	VF
L05DB       STR   'distance.'
	ELSE
L05DB       STR   'distance.'
	FIN
L05E5       LDA   #^L05DB
            STA   L1CFB
            LDA   #L05DB
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            PEA   $2222
            _ClearScreen
            JMP   L0615

L0604       STR   'actor2'
L060B       DW    $0000       ;  ref num
            ADRL  L0604       ;  path name
            ADRL  $00000000   ;  reserved
L0615       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L060B
            JSR   L2027
            LDA   L060B
            STA   L1CA9
            STA   L1CB7
            JSR   L3053
            JMP   L0633

L0631       DW    $0000
L0633       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L0631
            ASL
            ASL
            ASL
            ASL
            ORA   L0631
            STA   L0631
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0631
            STAL  $E0C022
            JSR   L3F69
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$000A
            STA   L1CF5
            LDA   #$001B
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            JMP   L06AE

	DO	VF
L0682       STR   '     Maybe you'27've seen something that looks'
	ELSE
L0682       STR   '     Maybe you'27've seen something that looks'
	FIN
L06AE       LDA   #^L0682
            STA   L1CFB
            LDA   #L0682
            STA   L1CF9
            JSR   L21D2
            JMP   L06E9

	DO	VF
L06C0       STR   'like this inside a car.  It is measuring'
	ELSE
L06C0       STR   'like this inside a car.  It is measuring'
	FIN
L06E9       LDA   #^L06C0
            STA   L1CFB
            LDA   #L06C0
            STA   L1CF9
            JSR   L21D2
            JMP   L0725

	DO	VF
L06FB       STR   'the distance that the car has traveled in'
	ELSE
L06FB       STR   'the distance that the car has traveled in'
	FIN
L0725       LDA   #^L06FB
            STA   L1CFB
            LDA   #L06FB
            STA   L1CF9
            JSR   L21D2
            JMP   L073E

	DO	VF
L0737       STR   'miles.'
	ELSE
L0737       STR   'miles.'
	FIN
L073E       LDA   #^L0737
            STA   L1CFB
            LDA   #L0737
            STA   L1CF9
            JSR   L21D2
            LDA   #$01F4
            STA   L1CEF
            LDA   #$000C
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$005F
            STA   L1EF9
            LDA   #$0061
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            STZ   L1CED
            JSR   L2152
            LDA   #$0002
            STA   L2FB1
L07A0       LDA   L2FB1
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0064
            STA   L1EF9
            LDA   #$00C5
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            STZ   L1CED
            JSR   L2152
            INC   L2FB1
            LDA   L2FB1
            CMP   #$000B
            BCC   L07A0
            LDA   #$000B
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0064
            STA   L1EF9
            LDA   #$00B2
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$0001
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0064
            STA   L1EF9
            LDA   #$00C5
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            STZ   L1CED
            JSR   L2152
            LDA   #$0002
            STA   L2FB1
L0880       LDA   L2FB1
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0064
            STA   L1EF9
            LDA   #$00C5
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            STZ   L1CED
            JSR   L2152
            INC   L2FB1
            LDA   L2FB1
            CMP   #$000B
            BCC   L0880
            JSR   L393A
            JSR   L2C12
            JMP   L08DD

L08DB       DW    $0000
L08DD       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L08DB
            ASL
            ASL
            ASL
            ASL
            ORA   L08DB
            STA   L08DB
            LDAL  $E0C022
            AND   #$FF00
            ORA   L08DB
            STAL  $E0C022
            PEA   $2222
            _ClearScreen
            LDA   #$0030
            STA   L1CF5
            LDA   #$0051
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L0955

	DO	VF
L0933       STR   '     Now, let'27's try some distance'
	ELSE
L0933       STR   '     Now, let'27's try some distance'
	FIN
L0955       LDA   #^L0933
            STA   L1CFB
            LDA   #L0933
            STA   L1CF9
            JSR   L220B
            JMP   L097D

	DO	VF
L0967       STR   'measurement problems.'
	ELSE
L0967       STR   'measurement problems.'
	FIN
L097D       LDA   #^L0967
            STA   L1CFB
            LDA   #L0967
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            PEA   $2222
            _ClearScreen
            JSR   L3929
            LDA   #$0005
            STA   L0B75
            LDA   #$0000
            STA   L1D9B
            JSR   L2AF0
L09AB       JMP   L09BC

L09AE       STR   'map'
L09B2       DW    $0000       ;  ref num
            ADRL  L09AE       ;  path name
            ADRL  $00000000   ;  reserved
L09BC       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L09B2
            JSR   L2027
            LDA   L09B2
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L09DA

L09D8       DW    $0000
L09DA       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0004
            STAL  $E0C034
            LDA   #$0004
            STA   L09D8
            ASL
            ASL
            ASL
            ASL
            ORA   L09D8
            STA   L09D8
            LDAL  $E0C022
            AND   #$FF00
            ORA   L09D8
            STAL  $E0C022
            JSR   L5231
L0A09       LDA   #$0005
            STA   L1C95
            JSR   L2B1C
            STA   L1D6F
            JSR   L3915
            BCS   L0A09
            JSR   L4217
L0A1D       LDA   #$0083
            STA   L1CF5
            LDA   #$009E
            STA   L1CF7
            JSR   L22A2
            JSR   L3A78
            LDA   L1D6D
            CMP   L1D6F
            BEQ   L0A3A
            JMP   L0A4A

L0A3A       JSR   L30C1
            LDA   L1D9B
            CLC
            ADC   L1D9D
            STA   L1D9B
            JMP   L0B6D

L0A4A       LDA   #$00B0
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L0A73

	DO	VF
L0A5E       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L0A5E       STR   'That is not correct.'
	FIN
L0A73       LDA   #^L0A5E
            STA   L1CFB
            LDA   #L0A5E
            STA   L1CF9
            JSR   L227E
            LDA   #$00B8
            STA   L1CF7
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   L1D9D
            BNE   L0A9B
            JMP   L0ACB

L0A9B       DEC   L1D9D
            JMP   L0AB3

	DO	VF
L0AA1       STR   'Essaye encore.'
	ELSE
L0AA1       STR   'Please try again.'
	FIN
L0AB3       LDA   #^L0AA1
            STA   L1CFB
            LDA   #L0AA1
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            JSR   L2870
            JMP   L0A1D
L0ACB       JMP   L0AE5

	DO	VF
L0ACE       STR   'La bonne r'8e'ponse est '
	ELSE
L0ACE       STR   'The correct answer is '
	FIN
L0AE5       LDA   #^L0ACE
            STA   L1CFB
            LDA   #L0ACE
            STA   L1CF9
            LDA   L1D6F
            JSR   L3A31
            LDA   L1CF9
            STA   L1CFF
            LDA   L1CFB
            STA   L1D01
            LDA   L1D3B
            STA   L1D03
            LDA   L1D3B+2
            STA   L1D05
            LDA   L1D0D
            STA   L1D07
            LDA   L1D0D+2
            STA   L1D09
            JSR   L2D97
            JMP   L0B28

	DO	VF
L0B21       STR   ' feet.'
	ELSE
L0B21       STR   ' feet.'
	FIN
L0B28       LDA   #^L0B21
            STA   L1CFB
            LDA   #L0B21
            STA   L1CF9
            LDA   L1D0D
            STA   L1CFF
            LDA   L1D0D+2
            STA   L1D01
            LDA   L1CF9
            STA   L1D03
            LDA   L1CFB
            STA   L1D05
            LDA   L1D3B
            STA   L1D07
            LDA   L1D3B+2
            STA   L1D09
            JSR   L2D97
            LDA   L1D3B
            STA   L1CF9
            LDA   L1D3B+2
            STA   L1CFB
            JSR   L227E
            JSR   L393A
L0B6D       DEC   L0B75
            BEQ   L0B77
            JMP   L09AB

L0B75       DW    $0000
L0B77       JSR   L3A9A
            JMP   L0221
L0B7D       JMP   L0B82

L0B80       DW    $0000
L0B82       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L0B80
            ASL
            ASL
            ASL
            ASL
            ORA   L0B80
            STA   L0B80
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0B80
            STAL  $E0C022
            JSR   L2100
            JSR   L2C12
            PEA   $FFFF
            _ClearScreen
            JSR   L210F
            LDA   #$0007
            PHA
            _SetForeColor
            LDA   #$0018
            STA   L1CF5
            LDA   #$0049
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            JMP   L0C06

	DO	VF
L0BE1       STR   '     When we measure temperature, we'
	ELSE
L0BE1       STR   '     When we measure temperature, we'
	FIN
L0C06       LDA   #^L0BE1
            STA   L1CFB
            LDA   #L0BE1
            STA   L1CF9
            JSR   L21D2
            JMP   L0C3D

	DO	VF
L0C18       STR   'measure how much heat is present.  A'
	ELSE
L0C18       STR   'measure how much heat is present.  A'
	FIN
L0C3D       LDA   #^L0C18
            STA   L1CFB
            LDA   #L0C18
            STA   L1CF9
            JSR   L21D2
            JMP   L0C75

	DO	VF
L0C4F       STR   'thermometer is a device that measures'
	ELSE
L0C4F       STR   'thermometer is a device that measures'
	FIN
L0C75       LDA   #^L0C4F
            STA   L1CFB
            LDA   #L0C4F
            STA   L1CF9
            JSR   L21D2
            JMP   L0C94

	DO	VF
L0C87       STR   'temperature.'
	ELSE
L0C87       STR   'temperature.'
	FIN
L0C94       LDA   #^L0C87
            STA   L1CFB
            LDA   #L0C87
            STA   L1CF9
            JSR   L21D2
            JMP   L0CBC

L0CA6       STR   'thermometer'
L0CB2       DW    $0000       ;  ref num
            ADRL  L0CA6       ;  path name
            ADRL  $00000000   ;  reserved
L0CBC       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0CB2
            JSR   L2027
            LDA   L0CB2
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JSR   L393A
            JMP   L0CDD

L0CDB       DW    $0000
L0CDD       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L0CDB
            ASL
            ASL
            ASL
            ASL
            ORA   L0CDB
            STA   L0CDB
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0CDB
            STAL  $E0C022
            JSR   L5231
            JSR   L2820
            LDA   #$0051
            STA   L1CF5
            LDA   #$0044
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0009
            PHA
            _SetForeColor
            JMP   L0D4F

	DO	VF
	ELSE
	FIN
L0D2F       STR   '     This is what a thermometer'
L0D4F       LDA   #^L0D2F
            STA   L1CFB
            LDA   #L0D2F
            STA   L1CF9
            JSR   L220B
            JMP   L0D81

	DO	VF
	ELSE
	FIN
L0D61       STR   'looks like.  The numbers on the'
L0D81       LDA   #^L0D61
            STA   L1CFB
            LDA   #L0D61
            STA   L1CF9
            JSR   L220B
            JMP   L0DB2

	DO	VF
	ELSE
	FIN
L0D93       STR   'side tell us what the tempera-'
L0DB2       LDA   #^L0D93
            STA   L1CFB
            LDA   #L0D93
            STA   L1CF9
            JSR   L220B
            JMP   L0DE3

	DO	VF
	ELSE
	FIN
L0DC4       STR   'ture is in degrees Fahrenheit.'
L0DE3       LDA   #^L0DC4
            STA   L1CFB
            LDA   #L0DC4
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            JSR   L2870
            CLC
            LDA   #$0037
            STA   L1E04
            LDA   #$0011
            STA   L1E06
            LDA   #$007D
            ADC   #$0001
            STA   L1E02
            LDA   #$0019
            ADC   #$0001
            STA   L1E08
            LDA   #$0007
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$0050
            STA   L1CF5
            LDA   #$0035
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            JMP   L0E6A

	DO	VF
	ELSE
	FIN
L0E49       STR   '     70 degrees is a comfortable'
L0E6A       LDA   #^L0E49
            STA   L1CFB
            LDA   #L0E49
            STA   L1CF9
            JSR   L220B
            JMP   L0E8E

	DO	VF
	ELSE
	FIN
L0E7C       STR   'room temperature.'
L0E8E       LDA   #^L0E7C
            STA   L1CFB
            LDA   #L0E7C
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            JSR   L2870
            CLC
            LDA   #$005F
            STA   L1E04
            LDA   #$0011
            STA   L1E06
            LDA   #$007D
            ADC   #$0001
            STA   L1E02
            LDA   #$0019
            ADC   #$0001
            STA   L1E08
            LDA   #$0007
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$000B
            PHA
            _SetForeColor
            LDA   #$004E
            STA   L1CF5
            LDA   #$005E
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            JMP   L0F15

	DO	VF
	ELSE
	FIN
L0EF4       STR   '     Water freezes into ice when'
L0F15       LDA   #^L0EF4
            STA   L1CFB
            LDA   #L0EF4
            STA   L1CF9
            JSR   L220B
            JMP   L0F46

	DO	VF
	ELSE
	FIN
L0F27       STR   'the temperature is 32 degrees.'
L0F46       LDA   #^L0F27
            STA   L1CFB
            LDA   #L0F27
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            JSR   L2870
            CLC
            LDA   #$0018
            STA   L1E04
            LDA   #$0011
            STA   L1E06
            LDA   #$007E
            ADC   #$0001
            STA   L1E02
            LDA   #$0019
            ADC   #$0001
            STA   L1E08
            LDA   #$0007
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$0008
            PHA
            _SetForeColor
            LDA   #$0044
            STA   L1CF5
            LDA   #$0018
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            JMP   L0FCF

	DO	VF
	ELSE
	FIN
L0FAC       STR   '     Your body temperature is 98.6'
L0FCF       LDA   #^L0FAC
            STA   L1CFB
            LDA   #L0FAC
            STA   L1CF9
            JSR   L220B
            JMP   L0FEA

	DO	VF
	ELSE
	FIN
L0FE1       STR   'degrees.'
L0FEA       LDA   #^L0FE1
            STA   L1CFB
            LDA   #L0FE1
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            JMP   L1001

L0FFF       DW    $0000
L1001       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L0FFF
            ASL
            ASL
            ASL
            ASL
            ORA   L0FFF
            STA   L0FFF
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0FFF
            STAL  $E0C022
            JSR   L2100
            JSR   L2C12
            PEA   $FFFF
            _ClearScreen
            JSR   L210F
            LDA   #$001C
            STA   L1CF5
            LDA   #$005B
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L1086

	DO	VF
	ELSE
	FIN
L1060       STR   '     Now we'27'll do some problems using'
L1086       LDA   #^L1060
            STA   L1CFB
            LDA   #L1060
            STA   L1CF9
            JSR   L21D2
            JMP   L10A5

	DO	VF
	ELSE
	FIN
L1098       STR   'temperature.'
L10A5       LDA   #^L1098
            STA   L1CFB
            LDA   #L1098
            STA   L1CF9
            JSR   L21D2
            JSR   L393A
            JSR   L3929
            LDA   #$0005
            STA   L1242
            LDA   #$0000
            STA   L1D9B
            JSR   L2AF0
L10C9       JMP   L10E2

L10CC       STR   'thermometer'
L10D8       DW    $0000       ;  ref num
            ADRL  L10CC       ;  path name
            ADRL  $00000000   ;  reserved
L10E2       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L10D8
            JSR   L2027
            LDA   L10D8
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L1100

L10FE       DW    $0000
L1100       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L10FE
            ASL
            ASL
            ASL
            ASL
            ORA   L10FE
            STA   L10FE
            LDAL  $E0C022
            AND   #$FF00
            ORA   L10FE
            STAL  $E0C022
            JSR   L5231
L112F       LDA   #$0005
            STA   L1C95
            JSR   L2B1C
            STA   L1D6F
            JSR   L3915
            BCS   L112F
            JSR   L4686
            _InitCursor
            LDA   L1E10
            BNE   L1156
            _ObscureCursor
L1156       JSR   L2C8E
            LDA   L1DE7
            CMP   L1D6F
            BNE   L1164
            JMP   L1234

L1164       LDA   #$0008
            PHA
            _SetForeColor
            LDA   #$00A2
            STA   L1CF7
            JMP   L118D

	DO	VF
L1178       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L1178       STR   'That is not correct.'
	FIN
L118D       LDA   #^L1178
            STA   L1CFB
            LDA   #L1178
            STA   L1CF9
            JSR   L227E
            LDA   #$00B1
            STA   L1CF7
            JMP   L11B7

	DO	VF
L11A5       STR   'L'27'affirmation est '
	ELSE
L11A5       STR   'The statement is '
	FIN
L11B7       LDA   #^L11A5
            STA   L1CFB
            LDA   #L11A5
            STA   L1CF9
            LDA   L1D6F
            CMP   #$0054
            BNE   L11CE
            JMP   L11F8

L11CE       LDA   L1CF9
            STA   L1CFF
            LDA   L1CFB
            STA   L1D01
            LDA   L124A
            STA   L1D03
            LDA   L124A+2
            STA   L1D05
            LDA   L1D0D
            STA   L1D07
            LDA   L1D0D+2
            STA   L1D09
            JSR   L2D97
            JMP   L121F

L11F8       LDA   L1CF9
            STA   L1CFF
            LDA   L1CFB
            STA   L1D01
            LDA   L124E
            STA   L1D03
            LDA   L124E+2
            STA   L1D05
            LDA   L1D0D
            STA   L1D07
            LDA   L1D0D+2
            STA   L1D09
            JSR   L2D97
L121F       LDA   L1D0D
            STA   L1CF9
            LDA   L1D0D+2
            STA   L1CFB
            JSR   L227E
            JSR   L393A
            JMP   L123A

L1234       INC   L1D9B
            JSR   L30C1
L123A       DEC   L1242
            BEQ   L1244
            JMP   L10C9

L1242       DW    $0000
L1244       JSR   L3A9A
            JMP   L0221

L124A       ADRL  L1252
L124E       ADRL  L1259
	DO	VF
L1252       STR   'fausse.'
L1259       STR   'vrai.'
	ELSE
L1252       STR   'false.'
L1259       STR   'true.'
	FIN
L125F       _HideCursor
            JMP   L1279

L1269       STR   'actor'
L126F       DW    $0000       ;  ref num
            ADRL  L1269       ;  path name
            ADRL  $00000000   ;  reserved
L1279       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L126F
            JSR   L2027
            LDA   L126F
            STA   L1CA9
            STA   L1CB7
            JMP   L1294

L1292       DW    $0000
L1294       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L1292
            ASL
            ASL
            ASL
            ASL
            ORA   L1292
            STA   L1292
            LDAL  $E0C022
            AND   #$FF00
            ORA   L1292
            STAL  $E0C022
            JSR   L2C12
            JSR   L3053
            JSR   L4132
            LDA   #$0001
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0027
            STA   L1EF9
            LDA   #$0091
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$005A
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L1336

	DO	VF
L1324       STR   'A penny is worth:'
	ELSE
L1324       STR   'A penny is worth:'
	FIN
L1336       LDA   #^L1324
            STA   L1CFB
            LDA   #L1324
            STA   L1CF9
            JSR   L227E
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L1367

	DO	VF
L135D       STR   'one cent.'
	ELSE
L135D       STR   'one cent.'
	FIN
L1367       LDA   #^L135D
            STA   L1CFB
            LDA   #L135D
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            PEA   $0000
            _ClearScreen
            LDA   #$0002
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0023
            STA   L1EF9
            LDA   #$008E
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$005A
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L13F1

	DO	VF
L13DE       STR   'A nickel is worth:'
	ELSE
L13DE       STR   'A nickel is worth:'
	FIN
L13F1       LDA   #^L13DE
            STA   L1CFB
            LDA   #L13DE
            STA   L1CF9
            JSR   L227E
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L1426

	DO	VF
L1418       STR   'five pennies.'
	ELSE
L1418       STR   'five pennies.'
	FIN
L1426       LDA   #^L1418
            STA   L1CFB
            LDA   #L1418
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            PEA   $0000
            _ClearScreen
            LDA   #$0003
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0027
            STA   L1EF9
            LDA   #$0092
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$005A
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L14AE

	DO	VF
L149D       STR   'A dime is worth:'
	ELSE
L149D       STR   'A dime is worth:'
	FIN
L14AE       LDA   #^L149D
            STA   L1CFB
            LDA   #L149D
            STA   L1CF9
            JSR   L227E
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L14E2

	DO	VF
L14D5       STR   'ten pennies.'
	ELSE
L14D5       STR   'ten pennies.'
	FIN
L14E2       LDA   #^L14D5
            STA   L1CFB
            LDA   #L14D5
            STA   L1CF9
            JSR   L227E
            JMP   L1501

	DO	VF
L14F4       STR   'two nickels.'
	ELSE
L14F4       STR   'two nickels.'
	FIN
L1501       LDA   #^L14F4
            STA   L1CFB
            LDA   #L14F4
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            PEA   $0000
            _ClearScreen
            LDA   #$0004
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$001D
            STA   L1EF9
            LDA   #$0089
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$005A
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L158C

	DO	VF
L1578       STR   'A quarter is worth:'
	ELSE
L1578       STR   'A quarter is worth:'
	FIN
L158C       LDA   #^L1578
            STA   L1CFB
            LDA   #L1578
            STA   L1CF9
            JSR   L227E
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L15BF

	DO	VF
L15B3       STR   '25 pennies.'
	ELSE
L15B3       STR   '25 pennies.'
	FIN
L15BF       LDA   #^L15B3
            STA   L1CFB
            LDA   #L15B3
            STA   L1CF9
            JSR   L227E
            JMP   L15DC

	DO	VF
L15D1       STR   '5 nickels.'
	ELSE
L15D1       STR   '5 nickels.'
	FIN
L15DC       LDA   #^L15D1
            STA   L1CFB
            LDA   #L15D1
            STA   L1CF9
            JSR   L227E
            JMP   L1606

	DO	VF
L15EE       STR   '2 dimes and one nickel.'
	ELSE
L15EE       STR   '2 dimes and one nickel.'
	FIN
L1606       LDA   #^L15EE
            STA   L1CFB
            LDA   #L15EE
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            PEA   $0000
            _ClearScreen
            LDA   #$0005
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0014
            STA   L1EF9
            LDA   #$0086
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$005A
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L1695

	DO	VF
L167D       STR   'A half-dollar is worth:'
	ELSE
L167D       STR   'A half-dollar is worth:'
	FIN
L1695       LDA   #^L167D
            STA   L1CFB
            LDA   #L167D
            STA   L1CF9
            JSR   L227E
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L16C8

	DO	VF
L16BC       STR   '50 pennies.'
	ELSE
L16BC       STR   '50 pennies.'
	FIN
L16C8       LDA   #^L16BC
            STA   L1CFB
            LDA   #L16BC
            STA   L1CF9
            JSR   L227E
            JMP   L16E6

	DO	VF
L16DA       STR   '10 nickels.'
	ELSE
L16DA       STR   '10 nickels.'
	FIN
L16E6       LDA   #^L16DA
            STA   L1CFB
            LDA   #L16DA
            STA   L1CF9
            JSR   L227E
            JMP   L1701

	DO	VF
L16F8       STR   '5 dimes.'
	ELSE
L16F8       STR   '5 dimes.'
	FIN
L1701       LDA   #^L16F8
            STA   L1CFB
            LDA   #L16F8
            STA   L1CF9
            JSR   L227E
            JMP   L171F

	DO	VF
L1713       STR   '2 quarters.'
	ELSE
L1713       STR   '2 quarters.'
	FIN
L171F       LDA   #^L1713
            STA   L1CFB
            LDA   #L1713
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            PEA   $0000
            _ClearScreen
            LDA   #$0006
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            TAY
            LDA   L2FB3,Y
            STA   L1EFD
            LDA   L2FB5,Y
            STA   L1EFF
            LDA   L2FB7,Y
            STA   L1F01
            LDA   L2FB9,Y
            STA   L1F03
            LDA   #$0008
            STA   L1EF9
            LDA   #$003B
            STA   L1EFB
            LDA   #^L1E99
            PHA
            LDA   #L1E99
            PHA
            _PaintPixels
            JSR   L2027
            LDA   #$005A
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L17A9

	DO	VF
L1796       STR   'A dollar is worth:'
	ELSE
L1796       STR   'A dollar is worth:'
	FIN
L17A9       LDA   #^L1796
            STA   L1CFB
            LDA   #L1796
            STA   L1CF9
            JSR   L227E
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            LDA   #$0008
            PHA
            _SetForeColor
            JMP   L17DD

	DO	VF
L17D0       STR   '100 pennies.'
	ELSE
L17D0       STR   '100 pennies.'
	FIN
L17DD       LDA   #^L17D0
            STA   L1CFB
            LDA   #L17D0
            STA   L1CF9
            JSR   L227E
            JMP   L17FB

	DO	VF
L17EF       STR   '20 nickels.'
	ELSE
L17EF       STR   '20 nickels.'
	FIN
L17FB       LDA   #^L17EF
            STA   L1CFB
            LDA   #L17EF
            STA   L1CF9
            JSR   L227E
            JMP   L1817

	DO	VF
L180D       STR   '10 dimes.'
	ELSE
L180D       STR   '10 dimes.'
	FIN
L1817       LDA   #^L180D
            STA   L1CFB
            LDA   #L180D
            STA   L1CF9
            JSR   L227E
            JMP   L1835

	DO	VF
L1829       STR   '4 quarters.'
	ELSE
L1829       STR   '4 quarters.'
	FIN
L1835       LDA   #^L1829
            STA   L1CFB
            LDA   #L1829
            STA   L1CF9
            JSR   L227E
            JMP   L1857

	DO	VF
L1847       STR   '2 half-dollars.'
	ELSE
L1847       STR   '2 half-dollars.'
	FIN
L1857       LDA   #^L1847
            STA   L1CFB
            LDA   #L1847
            STA   L1CF9
            JSR   L227E
            JSR   L393A
            JMP   L186E

L186C       DW    $0000
L186E       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L186C
            ASL
            ASL
            ASL
            ASL
            ORA   L186C
            STA   L186C
            LDAL  $E0C022
            AND   #$FF00
            ORA   L186C
            STAL  $E0C022
            JSR   L2100
            JSR   L2C12
            PEA   $FFFF
            _ClearScreen
            JSR   L210F
            LDA   #$0020
            STA   L1CF5
            LDA   #$0057
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0007
            PHA
            _SetForeColor
            JMP   L18F4

	DO	VF
L18CD       STR   '     Now let'27's try some problems using'
	ELSE
L18CD       STR   '     Now let'27's try some problems using'
	FIN
L18F4       LDA   #^L18CD
            STA   L1CFB
            LDA   #L18CD
            STA   L1CF9
            JSR   L21D2
            JMP   L190D

	DO	VF
L1906       STR   'money.'
	ELSE
L1906       STR   'money.'
	FIN
L190D       LDA   #^L1906
            STA   L1CFB
            LDA   #L1906
            STA   L1CF9
            JSR   L21D2
            JSR   L393A
            JSR   L3929
            LDA   #$000A
            STA   L1C1F
            LDA   #$0000
            STA   L1D9B
            JSR   L2AF0
L1931       JMP   L1947

L1934       STR   'quizling'
L193D       DW    $0000       ;  ref num
            ADRL  L1934       ;  path name
            ADRL  $00000000   ;  reserved
L1947       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L193D
            JSR   L2027
            LDA   L193D
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L1965

L1963       DW    $0000
L1965       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0002
            STAL  $E0C034
            LDA   #$0002
            STA   L1963
            ASL
            ASL
            ASL
            ASL
            ORA   L1963
            STA   L1963
            LDAL  $E0C022
            AND   #$FF00
            ORA   L1963
            STAL  $E0C022
            JSR   L5231
            LDA   #$0008
            STA   L5366
            LDA   #$0006
            STA   L5368
            JSR   L4F05
L19A3       LDA   #$000A
            STA   L1C95
            JSR   L2B1C
            STA   L1D6F
            JSR   L3915
            BCS   L19A3
            JSR   L4BFF
            LDA   #^L1E14
            PHA
            LDA   #L1E14
            PHA
            LDA   #$0014
            PHA
            LDA   #$0027
            PHA
            LDA   #$0090
            CLC
            ADC   #$0001
            PHA
            LDA   #$0038
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L1E1C
            PHA
            LDA   #L1E1C
            PHA
            LDA   #$0047
            PHA
            LDA   #$0040
            PHA
            LDA   #$005C
            CLC
            ADC   #$0001
            PHA
            LDA   #$0050
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0041
            STA   L1E6F
            STA   L1E71
            LDA   #^L1E24
            PHA
            LDA   #L1E24
            PHA
            LDA   #$00AD
            PHA
            LDA   #$0027
            PHA
            LDA   #$0129
            CLC
            ADC   #$0001
            PHA
            LDA   #$0038
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L1E2C
            PHA
            LDA   #L1E2C
            PHA
            LDA   #$00E0
            PHA
            LDA   #$0040
            PHA
            LDA   #$00F5
            CLC
            ADC   #$0001
            PHA
            LDA   #$0050
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0042
            STA   L1E73
            STA   L1E75
            LDA   #^L1E34
            PHA
            LDA   #L1E34
            PHA
            LDA   #$0079
            PHA
            LDA   #$0040
            PHA
            LDA   #$00C2
            CLC
            ADC   #$0001
            PHA
            LDA   #$0050
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0045
            STA   L1E77
            LDA   #$0005
            STA   L1E6D
L1A93       JSR   L2AE0
            _InitCursor
            LDA   L1E10
            BNE   L1AA9
            _ObscureCursor
L1AA9       JSR   L2C8E
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   #$009B
            STA   L1CF5
            LDA   #$0093
            STA   L1CF7
            LDA   L1DE2
            STA   L1CF9
            LDA   L1DE2+2
            STA   L1CFB
            JSR   L21D2
            LDA   L1DE7
            CMP   L1D6F
            BEQ   L1ADD
            JMP   L1AF0

L1ADD       JSR   L4F8C
            JSR   L30C1
            LDA   L1D9B
            CLC
            ADC   L1D9D
            STA   L1D9B
            JMP   L1C17

L1AF0       LDA   #$005C
            STA   L1CF5
            LDA   #$00A2
            STA   L1CF7
            LDA   #$000D
            PHA
            _SetForeColor
            JMP   L1B1F

	DO	VF
L1B0A       STR   'Ce n'27'est pas la bonne r'8e'ponse.'
	ELSE
L1B0A       STR   'That is not correct.'
	FIN
L1B1F       LDA   #^L1B0A
            STA   L1CFB
            LDA   #L1B0A
            STA   L1CF9
            JSR   L220B
            LDA   L1D9D
            BNE   L1B36
            JMP   L1B7D

L1B36       DEC   L1D9D
            LDA   #$0067
            STA   L1CF5
            LDA   #$00AE
            STA   L1CF7
            LDA   #$0001
            PHA
            _SetForeColor
            JMP   L1B65

	DO	VF
L1B53       STR   'Essaye encore.'
	ELSE
L1B53       STR   'Please try again.'
	FIN
L1B65       LDA   #^L1B53
            STA   L1CFB
            LDA   #L1B53
            STA   L1CF9
            JSR   L220B
            JSR   L393A
            JSR   L2870
            JMP   L1A93

L1B7D       LDA   #$00AE
            STA   L1CF7
            LDA   #$0001
            PHA
            _SetForeColor
            LDA   L1D6F
            CMP   #$0041
            BEQ   L1B99
            JMP   L1BBD
L1B99       JMP   L1BAE

	DO	VF
L1B9C       STR   'La bo'94'te A est plus grande.'
	ELSE
L1B9C       STR   'Box A is greater.'
	FIN
L1BAE       LDA   #^L1B9C
            STA   L1CFB
            LDA   #L1B9C
            STA   L1CF9
            JMP   L1C0E

L1BBD       CMP   #$0042
            BEQ   L1BC5
            JMP   L1BE9
L1BC5       JMP   L1BDA

	DO	VF
L1BC8       STR   'La bo'94'te B est plus grande.'
	ELSE
L1BC8       STR   'Box B is greater.'
	FIN
L1BDA       LDA   #^L1BC8
            STA   L1CFB
            LDA   #L1BC8
            STA   L1CF9
            JMP   L1C0E
L1BE9       JMP   L1C02

	DO	VF
	ELSE
	FIN
L1BEC       STR   'Les deux bo'94'tes sont identiques.'
L1C02       LDA   #^L1BEC
            STA   L1CFB
            LDA   #L1BEC
            STA   L1CF9
L1C0E       JSR   L227E
            JSR   L393A
            JSR   L4F8C
L1C17       DEC   L1C1F
            BEQ   L1C21
            JMP   L1931

L1C1F       DW    $0000
L1C21       JSR   L3C8F
            JMP   L0221

L1C27       LDA   L535C
            BEQ   L1C2F
            JSR   L4F8C
L1C2F       JSR   L27D5
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L2019
            DB    $00
            DB    $00
            ADRL  L1C42
L1C42       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C83       DB    $00
            DB    $00
L1C85       DB    $00
            DB    $00
L1C87       DB    $00
            DB    $00
L1C89       DB    $00
            DB    $00
L1C8B       DB    $00
            DB    $00
L1C8D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1C95       DB    $00
            DB    $00
L1C97       DB    $00
            DB    $00
L1C99       DB    $00
            DB    $00
L1C9B       DB    $00
            DB    $00
L1C9D       DB    $00
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
L1CA9       DW    $0000       ;  ref num
L1CAB       ADRL  $00000000   ;  buffer ptr
L1CAF       ADRL  $00000000   ;  request count
L1CB3       ADRL  $00000000   ;  transfer count
L1CB7       DW    $0000       ;  ref num
L1CB9       DW    $0000       ;  ref num
L1CBB       ADRL  $00000000   ;  buffer ptr
L1CBF       ADRL  $00000000   ;  request count
L1CC3       ADRL  $00000000   ;  transfer count
L1CC7       DW    $0000       ;  ref num
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1CCF       DB    $00
            DB    $00
L1CD1       DB    $00
            DB    $00
L1CD3       DB    $00
            DB    $00
L1CD5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1CDD       DB    $00
            DB    $00
L1CDF       DB    $00
            DB    $00
L1CE1       DB    $00
            DB    $00
L1CE3       DB    $00
            DB    $00
L1CE5       DB    $00
            DB    $00
L1CE7       DB    $00
            DB    $00
L1CE9       DB    $00
            DB    $00
L1CEB       DB    $00
            DB    $00
L1CED       DB    $00
            DB    $00
L1CEF       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1CF5       DB    $00
            DB    $00
L1CF7       DB    $00
            DB    $00
L1CF9       DB    $00
            DB    $00
L1CFB       DB    $00
            DB    $00
L1CFD       DB    $09
            DB    $00
L1CFF       DB    $00
            DB    $00
L1D01       DB    $00
            DB    $00
L1D03       DB    $00
            DB    $00
L1D05       DB    $00
            DB    $00
L1D07       DB    $00
            DB    $00
L1D09       DB    $00
            DB    $00
L1D0B       DB    $02
            DB    $00
L1D0D       ADRL  L1D11
L1D11       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1D3B       ADRL  L1D3F
L1D3F       DB    $00
L1D40       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1D69       DB    $00
            DB    $00
L1D6B       DB    $0F
            DB    $00
L1D6D       DB    $00
            DB    $00
L1D6F       DB    $00
            DB    $00
L1D71       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1D9B       DB    $00
            DB    $00
L1D9D       DB    $00
            DB    $00
L1D9F       DB    $00
            DB    $00
L1DA1       DB    $00
            DB    $00
L1DA3       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            ADRL  L1DB0
            DB    $FF
L1DB0       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1DC2       DB    $00
            DB    $00
L1DC4       DB    $00
            DB    $00
L1DC6       DW    $0000       ; event code
L1DC8       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L1DD0       DW    $0000       ; mouse location
L1DD2       DW    $0000
            DW    $0000       ; modifiers
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L1DDE       DB    $00
            DB    $00
L1DE0       DB    $00
            DB    $00
L1DE2       ADRL  L1DE6
L1DE6       DB    $01
L1DE7       DB    $00
            DB    $00
L1DE9       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1DF2       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1DFA       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E02       DB    $00
            DB    $00
L1E04       DB    $00
            DB    $00
L1E06       DB    $00
            DB    $00
L1E08       DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E0C       DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E10       DB    $00
            DB    $00
L1E12       DB    $00
            DB    $00
L1E14       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E1C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E24       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E2C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E34       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E64       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E6D       DB    $00
            DB    $00
L1E6F       DB    $00
            DB    $00
L1E71       DB    $00
            DB    $00
L1E73       DB    $00
            DB    $00
L1E75       DB    $00
            DB    $00
L1E77       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E83       ADRL  L1EC5       ; ptr to source locinfo
            ADRL  L1ED5       ; ptr to dest locinfo
            ADRL  L1EFD       ; ptr to source rect
            ADRL  L1EF9       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1E99       ADRL  L1ED5       ; ptr to source locinfo
            ADRL  L1EC5       ; ptr to dest locinfo
            ADRL  L1EFD       ; ptr to source rect
            ADRL  L1EF9       ; ptr to dest point
            DW    $0000       ; mode
L1EAB       ADRL  $00000000   ; clip rgn handle
            ADRL  L1EC5       ; ptr to source locinfo
            ADRL  L1EE9       ; ptr to dest locinfo
            ADRL  L1F09       ; ptr to source rect
            ADRL  L1F05       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1EC5       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L1ED5       DW    $0000       ; SCB byte
L1ED7       ADRL  $00000000   ; Pointer to pixel image
L1EDB       DW    $0010       ; Width
L1EDD       DW    $0000       ; Bounds rect
L1EDF       DW    $0000
L1EE1       DW    $0014
L1EE3       DW    $0014
L1EE5       ADRL  $00000000
L1EE9       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L1EF9       DW    $0000
L1EFB       DW    $0000
L1EFD       DW    $0000
L1EFF       DW    $0000
L1F01       DW    $0014
L1F03       DW    $0014
L1F05       DW    $0000
            DW    $0000
L1F09       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L1F11       ADRL  L1ED5       ; ptr to source locinfo
            ADRL  L1EC5       ; ptr to dest locinfo
            ADRL  L1F3D       ; ptr to source rect
            ADRL  L1F45       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L1EE9       ; ptr to source locinfo
            ADRL  L1EC5       ; ptr to dest locinfo
            ADRL  L1F49       ; ptr to source rect
            ADRL  L1F51       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1F3D       DW    $0000
L1F3F       DW    $0000
L1F41       DW    $0014
L1F43       DW    $0014
L1F45       DW    $0000
            DW    $0000
L1F49       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L1F51       DW    $0000
            DW    $0000
L1F55       ADRL  L1EC5       ; ptr to source locinfo
            ADRL  L1F6B       ; ptr to dest locinfo
            ADRL  L1F7B       ; ptr to source rect
            ADRL  L1F83       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1F6B       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L1F7B       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L1F83       DW    $0000
            DW    $0000
L1F87       ADRL  L1F6B       ; ptr to source locinfo
            ADRL  L1EC5       ; ptr to dest locinfo
            ADRL  L1F9D       ; ptr to source rect
            ADRL  L1FA5       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L1F9D       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L1FA5       DW    $0000
            DW    $0000
L1FA9       DB    $00
            DB    $00
L1FAB       DB    $00
            DB    $00
L1FAD       DB    $00
            DB    $00
L1FAF       HEX   7200000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L1FCF       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L1FEF       HEX   0000CD000900800D720055052F02AF06
            HEX   5008B70FCF02980FD000F00CF902FF0F
            DB    $00
            DB    $00
L2011       DB    $00
            DB    $00
L2013       DB    $00
            DB    $00
L2015       DB    $00
            DB    $00
L2017       DB    $00
            DB    $00
L2019       ADRL  L201F       ;  path name
            DW    $0000       ;  flags
L201F       STR   'program'
L2027       BCS   L202A
            RTS

L202A       PHA
            LDA   #^L203B
            PHA
            LDA   #L203B
            PHA
            _SysFailMgr
            RTS

	DO	VF
L203B       STR   'Erreur applicative ... Oups !'
	ELSE
L203B       STR   'Application failure ... Oops!'
	FIN
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1DC2
            STA   L1C83
            LDA   L1DC4
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1D9F
            LDA   L1C89
            STA   L1DA1
            LDA   L1D9F
            STA   L1CBB
            LDA   L1DA1
            STA   L1CBB+2
            LDA   #$0000
            STA   L1CBF+2
            LDA   #$A000
            STA   L1CBF
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CB9
            JSR   L2027
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L1CC7
            JSR   L2027
            LDA   L1CC3
            STA   L1DA3
            LDA   #$0000
            STA   L1CED
            LDX   #$0008
L20C0       LSR   L1DA3
            BCC   L20CB
            LDA   #$0001
            STA   L1CED
L20CB       DEX
            BNE   L20C0
            LDA   L1DA3
            CLC
            ADC   L1CED
            STA   L1DA3
            RTS

L20D9       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L20D9
L20EC       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L20EC
            RTS

L2100       _GrafOff
            _HideCursor
            RTS

L210F       _GrafOn
            RTS

L2117       PEA   $0000
            PEA   $FFFF
            LDA   #^L1DC6
            PHA
            LDA   #L1DC6
            PHA
            _GetNextEvent
            PLA
            BEQ   L2151
            LDA   L1DC6
            CMP   #$0003
            BNE   L2143
            STZ   L1E10
L213A       LDA   #$0080
            STA   L1CED
            JMP   L2151

L2143       CMP   #$0001
            BNE   L2151
            LDA   #$8000
            STA   L1E10
            JMP   L213A
L2151       RTS

L2152       LDA   L1CEF
            STA   L216C
            STZ   L1CED
L215B       JSR   L2117
            LDA   L1CED
            CMP   #$0000
            BNE   L216B
            DEC   L216C
            BNE   L215B
L216B       RTS

L216C       DW    $0000
            STZ   L1CED
L2171       JSR   L2117
            LDA   L1CED
            CMP   #$0000
            BEQ   L2171
            RTS

L217D       PEA   $0000
            PEA   $FFFF
            LDA   #^L1DC6
            PHA
            LDA   #L1DC6
            PHA
            _GetNextEvent
            PLA
            BEQ   L217D
            LDA   L1DC6
            CMP   #$0003
            BNE   L217D
            LDA   L1DC8
            AND   #$007F
            CMP   #$0061
            BCC   L21AC
            SEC
            SBC   #$0020
L21AC       CMP   L1DE7
            BNE   L217D
            RTS

L21B2       PHA
            PEA   $0008
            LDA   #^L1DC6
            PHA
            LDA   #L1DC6
            PHA
            _GetNextEvent
            PLA
            BEQ   L21B2
            LDA   L1DC8
            AND   #$007F
            STA   L1DE7
            RTS

L21D2       LDA   L1CF5
            PHA
            LDA   L1CF7
            PHA
            _MoveTo
            LDA   L1CFB
            PHA
            LDA   L1CF9
            PHA
            _DrawString
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            RTS

L21FB       LDA   L1CFB
            PHA
            LDA   L1CF9
            PHA
            _DrawString
            RTS

L220B       PHA
            _GetForeColor
            PLA
            STA   L227C
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   L1CF5
            CLC
            ADC   #$0001
            PHA
            LDA   L1CF7
            CLC
            ADC   #$0001
            PHA
            _MoveTo
            LDA   L1CFB
            PHA
            LDA   L1CF9
            PHA
            _DrawString
            LDA   L227C
            PHA
            _SetForeColor
            LDA   L1CF5
            PHA
            LDA   L1CF7
            PHA
            _MoveTo
            LDA   L1CFB
            PHA
            LDA   L1CF9
            PHA
            _DrawString
            LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            RTS

L227C       DW    $0000
L227E       PHA
            LDA   L1CFB
            PHA
            LDA   L1CF9
            PHA
            _StringWidth
            PLA
            STA   L22A0
            LDA   #$0140
            SEC
            SBC   L22A0
            LSR
            STA   L1CF5
            JMP   L21D2

L22A0       DW    $0000
L22A2       JSR   L2AE0
            STZ   L1CFD
            STZ   L1D3F
L22AB       JSR   L21B2
            LDA   L1DE7
            CMP   #$0008
            BEQ   L22BE
            CMP   #$007F
            BEQ   L22BE
            JMP   L2306

L22BE       LDA   L1D69
            PHA
            _SetForeColor
            LDA   #^L1D3F
            STA   L1CFB
            LDA   #L1D3F
            STA   L1CF9
            JSR   L21D2
            LDA   L1D3F
            AND   #$00FF
            CMP   #$0002
            BCS   L22E6
            JMP   L22A2

L22E6       DEC   L1D3F
L22E9       LDA   L1D6B
            PHA
            _SetForeColor
            LDA   #^L1D3F
            STA   L1CFB
            LDA   #L1D3F
            STA   L1CF9
            JSR   L21D2
            JMP   L22AB

L2306       CMP   #$000D
            BNE   L2317
            LDA   L1D3F
            AND   #$00FF
            BNE   L2316
            JMP   L22AB
L2316       RTS

L2317       CMP   #$001B
            BNE   L231F
            JMP   L1C27

L231F       CMP   #$0030
            BCS   L2327
            JMP   L22AB

L2327       CMP   #$003A
            BCC   L232F
            JMP   L22AB

L232F       LDA   L1D3F
            AND   #$00FF
            CMP   L1D0B
            BCC   L233D
            JMP   L22AB

L233D       LDA   L1D69
            PHA
            _SetForeColor
            LDA   #^L1D3F
            STA   L1CFB
            LDA   #L1D3F
            STA   L1CF9
            JSR   L21D2
            INC   L1D3F
            LDA   L1D3F
            AND   #$00FF
            TAY
            LDA   L1DE7
            STA   L1D3F,Y
            JMP   L22E9

            JSR   L2100
            JSR   L2BEA
            JMP   L2375

L2373       DW    $0000
L2375       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L2373
            ASL
            ASL
            ASL
            ASL
            ORA   L2373
            STA   L2373
            LDAL  $E0C022
            AND   #$FF00
            ORA   L2373
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L1E04
            LDA   #$003F
            STA   L1E06
            LDA   #$007E
            ADC   #$0001
            STA   L1E02
            LDA   #$00F8
            ADC   #$0001
            STA   L1E08
            LDA   #$000A
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0041
            STA   L1E04
            LDA   #$0044
            STA   L1E06
            LDA   #$007A
            ADC   #$0001
            STA   L1E02
            LDA   #$00F3
            ADC   #$0001
            STA   L1E08
            LDA   #$000C
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0060
            STA   L1E04
            LDA   #$004E
            STA   L1E06
            LDA   #$0072
            ADC   #$0001
            STA   L1E02
            LDA   #$00E9
            ADC   #$0001
            STA   L1E08
            LDA   #$000B
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0063
            STA   L1E04
            LDA   #$0053
            STA   L1E06
            LDA   #$006F
            ADC   #$0001
            STA   L1E02
            LDA   #$0060
            ADC   #$0001
            STA   L1E08
            LDA   #$000E
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDX   #$0000
L2468       LDA   L1DE9,X
            STA   L1DFA,X
            INX
            INX
            CPX   #$0008
            BNE   L2468
            CLC
            LDA   #$0063
            STA   L1E04
            LDA   #$00C6
            STA   L1E06
            LDA   #$006F
            ADC   #$0001
            STA   L1E02
            LDA   #$00D3
            ADC   #$0001
            STA   L1E08
            LDA   #$000D
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDX   #$0000
L24A9       LDA   L1DE9,X
            STA   L1DF2,X
            INX
            INX
            CPX   #$0008
            BNE   L24A9
            PEA   $0000
            _GetForeColor
            PLA
            STA   L268B
            PEA   $0000
            _SetForeColor
            JMP   L24E2

	DO	VF
L24D1       STR   'Veux-tu vraiment'
	ELSE
L24D1       STR   'Are you sure you'
	FIN
L24E2       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L24D1
            PHA
            LDA   #L24D1
            PHA
            _DrawString
            JMP   L250F

	DO	VF
L2501       STR   'quitter le jeu ?'
	ELSE
L2501       STR   'want to quit?'
	FIN
L250F       PEA   $0064
            PEA   $0059
            _MoveTo
            LDA   #^L2501
            PHA
            LDA   #L2501
            PHA
            _DrawString
            JMP   L2532

	DO	VF
L252E       STR   'ui'
	ELSE
L252E       STR   'es'
	FIN
L2532       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L252E
            PHA
            LDA   #L252E
            PHA
            _DrawString
            JMP   L2554

	DO	VF
L2551       STR   'on'
	ELSE
L2551       STR   'o'
	FIN
L2554       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L2551
            PHA
            LDA   #L2551
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L257F

	DO	VF
L257D       STR   'O'
	ELSE
L257D       STR   'Y'
	FIN
L257F       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L257D
            PHA
            LDA   #L257D
            PHA
            _DrawString
            JMP   L25A0

L259E       STR   'N'
L25A0       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L259E
            PHA
            LDA   #L259E
            PHA
            _DrawString
            JSR   L210F
            _InitCursor
L25C6       PEA   $0000
            PEA   $FFFF
            LDA   #^L1DC6
            PHA
            LDA   #L1DC6
            PHA
            _GetNextEvent
            PLA
            BEQ   L25C6
            LDA   L1DC6
            CMP   #$0003
            BEQ   L25E9
            JMP   L2628

L25E9       _ObscureCursor
            LDA   #$0000
            STA   L1E10
            LDA   L1DC8
            AND   #$007F
            CMP   #$0061
            BCC   L2605
            SEC
            SBC   #$0020
	DO	VF
L2605       CMP   #'O'
	ELSE
L2605       CMP   #'Y'
	FIN
            BEQ   L2612
            CMP   #'N'
            BEQ   L2612
            JMP   L25C6

L2612       STA   L1DE7
            LDA   L268B
            PHA
            _SetForeColor
            _HideCursor
            RTS

L2628       CMP   #$0001
            BEQ   L2630
            JMP   L25C6

L2630       LDA   L1DD0
            STA   L1DDE
            LDA   L1DD2
            STA   L1DE0
            LDA   #$0080
            STA   L1E10
            PEA   $0000
            LDA   #^L1DDE
            PHA
            LDA   #L1DDE
            PHA
            LDA   #^L1DF2
            PHA
            LDA   #L1DF2
            PHA
            _PtInRect
            PLA
            BEQ   L2665
            LDA   #$004E
            JMP   L2612

L2665       PEA   $0000
            LDA   #^L1DDE
            PHA
            LDA   #L1DDE
            PHA
            LDA   #^L1DFA
            PHA
            LDA   #L1DFA
            PHA
            _PtInRect
            PLA
            BEQ   L2688
	DO	VF
            LDA   #'O'
            	ELSE
            LDA   #'Y'
	FIN
            JMP   L2612
L2688       JMP   L25C6

L268B       DW    $0000
            JSR   L2100
            JSR   L2BEA
            CLC
            LDA   #$0037
            STA   L1E04
            LDA   #$003B
            STA   L1E06
            LDA   #$0089
            ADC   #$0001
            STA   L1E02
            LDA   #$0104
            ADC   #$0001
            STA   L1E08
            LDA   #$000B
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$003F
            STA   L1E04
            LDA   #$0044
            STA   L1E06
            LDA   #$0081
            ADC   #$0001
            STA   L1E02
            LDA   #$00FB
            ADC   #$0001
            STA   L1E08
            LDA   #$000E
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L2719

	DO	VF
L2703       STR   'Merci d'27'avoir utilis'8e
	ELSE
L2703       STR   'Thank you for running'
	FIN
L2719       PEA   $0055
            PEA   $004F
            _MoveTo
            LDA   #^L2703
            PHA
            LDA   #L2703
            PHA
            _DrawString
            JMP   L2745

	DO	VF
L2738       STR   'le programme.'
L2745       PEA   $0072
	ELSE
L2738       STR   'the program.'
L2745       PEA   $007A
	FIN
            PEA   $005A
            _MoveTo
            LDA   #^L2738
            PHA
            LDA   #L2738
            PHA
            _DrawString
            PEA   $000B
            _SetForeColor
            JMP   L2784

	DO	VF
L276E       STR   'Eteins l'27'ordinateur'
L2784       PEA   $004B
	ELSE
L276E       STR   'Turn off the computer'
L2784       PEA   $0053
	FIN
            PEA   $006B
            _MoveTo
            LDA   #^L276E
            PHA
            LDA   #L276E
            PHA
            _DrawString
            JMP   L27AE

	DO	VF
L27A3       STR   'ou red'8e'marre.'
L27AE       PEA   $0074
	ELSE
L27A3       STR   'or reboot.'
L27AE       PEA   $0080
	FIN
            PEA   $0076
            _MoveTo
            LDA   #^L27A3
            PHA
            LDA   #L27A3
            PHA
            _DrawString
            JSR   L210F
            _HideCursor
            STP
L27D5       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L1C9B
            PHA
            _DisposeAll
            JSR   L2027
            LDA   L1C99
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L2820       _HideCursor
            LDA   L1CCF
            STA   L1C83
            LDA   L1CD1
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1CD3
            LDA   L1C89
            STA   L1CD5
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HLock
            JSR   L2027
            PEA   $00E1
            PEA   $2000
            LDA   L1CD5
            PHA
            LDA   L1CD3
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L2870       _HideCursor
            LDA   L1CD5
            PHA
            LDA   L1CD3
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HUnlock
            JSR   L2027
            RTS

            _HideCursor
            LDA   #^L1F55
            PHA
            LDA   #L1F55
            PHA
            _PaintPixels
            JSR   L2027
            RTS

            _HideCursor
            LDA   #^L1F87
            PHA
            LDA   #L1F87
            PHA
            _PaintPixels
            JSR   L2027
            RTS

L28D9       LDA   L1CCF
            STA   L1C83
            LDA   L1CD1
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1CD3
            LDA   L1C89
            STA   L1CD5
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HLock
            JSR   L2027
            PEA   $00E1
            PEA   $2000
            LDA   L1CD5
            PHA
            LDA   L1CD3
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L2922       LDA   L1CD5
            PHA
            LDA   L1CD3
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HUnlock
            JSR   L2027
            RTS

            _HideCursor
            LDA   L1EE5
            STA   L1C83
            LDA   L1EE5+2
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1ED7
            LDA   L1C89
            STA   L1ED7+2
            LDA   #^L1E83
            PHA
            LDA   #L1E83
            PHA
            _PaintPixels
            JSR   L2027
            _InitCursor
            RTS

L298C       _HideCursor
            LDA   L1EE5
            STA   L1C83
            LDA   L1EE5+2
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1ED7
            LDA   L1C89
            STA   L1ED7+2
            LDA   #^L1F11
            PHA
            LDA   #L1F11
            PHA
            _PaintPixels
            JSR   L2027
            RTS

            LDA   #^L1FA9
            STA   L1CAB+2
            LDA   #L1FA9
            STA   L1CAB
            LDA   #$0000
            STA   L1CAF+2
            LDA   #$0006
            STA   L1CAF
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            LDA   L1CCF
            STA   L1C83
            LDA   L1CD1
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1CD3
            LDA   L1C89
            STA   L1CD5
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HLock
            JSR   L2027
            LDA   L1CD3
            STA   L1CAB
            LDA   L1CD5
            STA   L1CAB+2
            LDA   #$8000
            STA   L1CAF
            LDA   #$0000
            STA   L1CAF+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L1CB7
            LDA   #$0028
            STA   L1CF7
            LDA   L1EE5
            STA   L1C83
            LDA   L1EE5+2
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1ED7
            LDA   L1C89
            STA   L1ED7+2
            LDA   L1ED7
            STA   L1CDF
            LDA   L1ED7+2
            STA   L1CE1
            LDA   L1FA9
            STA   L1CE3
L2A6F       PHA
            LDA   L1CD5
            PHA
            LDA   L1CD3
            PHA
            LDA   L1CB3
            PHA
            LDA   #^L1CDF
            PHA
            LDA   #L1CDF
            PHA
            LDA   #^L1CE3
            PHA
            LDA   #L1CE3
            PHA
            _UnPackBytes
            PLA
            LDA   L1CE3
            BNE   L2A6F
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HUnlock
            JSR   L2027
            RTS

            LDA   #$0000
            STA   L1EDD
            STA   L1EDF
            STA   L1F3D
            STA   L1F3F
            LDA   L1FAB
            STA   L1EE1
            STA   L1F41
            LDA   L1FAD
            STA   L1EE3
            STA   L1F43
            LSR
            CLC
            ADC   #$0001
            STA   L1EDB
            _HideCursor
            JSR   L298C
            RTS

L2AE0       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L2AF0       LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            _ReadTimeHex
            PLA
            STA   L2B18
            PLA
            STA   L2B1A
            PLA
            PLA
            LDA   L2B1A
            PHA
            LDA   L2B18
            PHA
            _SetRandSeed
            RTS

L2B18       DW    $0000
L2B1A       DW    $0000
L2B1C       PEA   $0000
            _Random
            PLA
            STA   L2B73
            PEA   $0000
            PEA   $0000
            LDA   L1C95
            PHA
            LDA   L2B73
            PHA
            _Multiply
            PLA
            STA   L2B75
            PLA
            STA   L2B77
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDA   L2B77
            PHA
            LDA   L2B75
            PHA
            LDA   #$0001
            PHA
            LDA   #$0000
            PHA
            _LongDivide
            JSR   L2027
            PLA
            STA   L2B73
            PLA
            PLA
            PLA
            LDA   L2B73
            RTS

L2B73       DW    $0000
L2B75       DW    $0000
L2B77       DW    $0000
L2B79       LDA   #$0000
            STA   L1E12
            LDA   L1C83
            STA   $00
            LDA   L1C85
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L1C87
            LDY   #$0002
            LDA   [$00],Y
            STA   L1C89
            LDA   L1C87
            BNE   L2BA6
            LDA   L1C89
            BNE   L2BA6
            JMP   L2BA7
L2BA6       RTS

L2BA7       LDA   L1C85
            PHA
            LDA   L1C83
            PHA
            _RestoreHandle
            JSR   L2027
            LDA   #$8000
            STA   L1E12
            JMP   L2B79

            PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L1FAF
            PHA
            LDA   #L1FAF
            PHA
            _SetColorTable
            RTS

L2BEA       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L1FCF
            PHA
            LDA   #L1FCF
            PHA
            _SetColorTable
            RTS

L2C12       PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L1FEF
            PHA
            LDA   #L1FEF
            PHA
            _SetColorTable
            RTS

L2C3A       LDA   #^L1DE9
            PHA
            LDA   #L1DE9
            PHA
            LDA   L1E06
            PHA
            LDA   L1E04
            PHA
            LDA   L1E08
            PHA
            LDA   L1E02
            PHA
            _SetRect
            RTS

            LDA   #^L1DE9
            PHA
            LDA   #L1DE9
            PHA
            _FrameRect
            RTS

L2C6A       LDA   #^L1DE9
            PHA
            LDA   #L1DE9
            PHA
            _PaintRect
            RTS

L2C7A       _PenNormal
            RTS

L2C82       LDA   L1E0C
            PHA
            _SetSolidPenPat
            RTS

L2C8E       PEA   $0000
            PEA   $FFFF
            LDA   #^L1DC6
            PHA
            LDA   #L1DC6
            PHA
            _GetNextEvent
            PLA
            BEQ   L2C8E
            LDA   L1DC6
            CMP   #$0003
            BEQ   L2CB1
            JMP   L2D0A

L2CB1       LDA   L1DC8
            AND   #$007F
            CMP   #$0061
            BCC   L2CC0
            SEC
            SBC   #$0020
L2CC0       STA   L1DE7
            _ObscureCursor
            LDA   #$0000
            STA   L1E10
            LDA   L1DE7
            CMP   #$001B
            BNE   L2CDB
            JMP   L1C27

L2CDB       LDA   #$0001
            STA   L2D95
            LDA   #$0000
            STA   L2D93
L2CE7       LDX   L2D93
            LDA   L1E6F,X
            CMP   L1DE7
            BNE   L2CF3
            RTS

L2CF3       LDA   L2D95
            CMP   L1E6D
            BEQ   L2D07
            INC   L2D95
            INC   L2D93
            INC   L2D93
            JMP   L2CE7
L2D07       JMP   L2C8E

L2D0A       CMP   #$0001
            BEQ   L2D12
            JMP   L2C8E

L2D12       LDA   L1DD0
            STA   L1DDE
            LDA   L1DD2
            STA   L1DE0
            LDA   #$0080
            STA   L1E10
            LDA   #$0000
            STA   L2D91
            STA   L2D93
            LDA   #$0001
            STA   L2D95
L2D33       LDY   #$0000
            LDX   L2D91
L2D39       LDA   L1E14,X
            STA   L1E64,Y
            INX
            INY
            CPY   #$0008
            BCC   L2D39
            PEA   $0000
            LDA   #^L1DDE
            PHA
            LDA   #L1DDE
            PHA
            LDA   #^L1E64
            PHA
            LDA   #L1E64
            PHA
            _PtInRect
            PLA
            BEQ   L2D66
            JMP   L2D87

L2D66       LDA   L2D95
            CMP   L1E6D
            BNE   L2D71
            JMP   L2C8E

L2D71       INC   L2D95
            INC   L2D93
            INC   L2D93
            LDA   L2D91
            CLC
            ADC   #$0008
            STA   L2D91
            JMP   L2D33

L2D87       LDX   L2D93
            LDA   L1E6F,X
            STA   L1DE7
            RTS

L2D91       DW    $0000
L2D93       DW    $0000
L2D95       DW    $0000
L2D97       LDA   #L2E70
            STA   $04
            LDA   #^L2E70
            STA   $06
            LDA   L1CFF
            STA   $00
            LDA   L1D01
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L2E6D
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L2DC8       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L2E6D
            BNE   L2DC8
            LDA   L2E6F
            AND   #$FF00
            ORA   L2E6D
            STA   L2E6F
            LDA   L1D03
            STA   $00
            LDA   L1D05
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L2E6D
            LDA   L2E6F
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
L2E17       LDA   [$00],Y
            STA   [$04],Y
            INY
            CPY   L2E6D
            BNE   L2E17
            LDA   L2E6F
            CLC
            ADC   L2E6D
            STA   L2E6F
            LDA   L1D07
            STA   $00
            LDA   L1D09
            STA   $02
            LDA   #L2E70
            STA   $04
            LDA   #^L2E70
            STA   $06
            LDA   L2E6F
            AND   #$00FF
            LDY   #$0000
            STA   [$00],Y
            AND   #$00FF
            STA   L2E6D
            LDA   $00
            CLC
            ADC   #$0001
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDY   #$0000
L2E62       LDA   [$04],Y
            STA   [$00],Y
            INY
            CPY   L2E6D
            BNE   L2E62
            RTS

L2E6D       DB    $00
            DB    $00
L2E6F       DB    $00
L2E70       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
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
            LDA   L1CE5
            AND   #$000F
            PHA
            LDA   L1CE7
            AND   #$000F
            JSR   L2FAA
            STA   L2FAF
            LDA   L1CE9
            AND   #$000F
            ORA   L2FAF
            JSR   L2FAA
            STA   L2FAF
            LDA   L1CEB
            AND   #$000F
            ORA   L2FAF
            PHA
            _SetColorEntry
            JSR   L2027
            RTS

L2FAA       ASL
            ASL
            ASL
            ASL
            RTS

L2FAF       DB    $00
            DB    $00
L2FB1       DB    $01
            DB    $00
L2FB3       DB    $00
            DB    $00
L2FB5       DB    $00
            DB    $00
L2FB7       DB    $00
            DB    $00
L2FB9       DB    $00
            DB    $00
L2FBB       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FC3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FCB       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FD3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FDB       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FE3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FEB       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FF3       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2FFB       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3003       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L300B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3053       JSR   L50A1
            JSR   L2100
            JSR   L5231
            JSR   L2820
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HUnlock
            JSR   L2027
            PEA   $0000
            _ClearScreen
            JSR   L210F
            LDA   L1CCF
            STA   L1C83
            LDA   L1CD1
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1CD3
            LDA   L1C89
            STA   L1CD5
            LDA   L1CD3
            STA   L1ED7
            LDA   L1CD5
            STA   L1ED7+2
            LDA   #$00A0
            STA   L1EDB
            LDA   #$0000
            STA   L1EDD
            STA   L1EDF
            LDA   #$00C8
            STA   L1EE1
            LDA   #$0140
            STA   L1EE3
            RTS

L30C1       LDA   L3117
            CMP   L3115
            BCC   L30E2
            JSR   L2AF0
            LDA   #$0000
            STA   L3117
            LDX   #$0000
L30D5       CPX   #$0027
            BCS   L30E2
            STA   L3119,X
            INX
            INX
            JMP   L30D5

L30E2       LDA   L3115
            STA   L1C95
            JSR   L2B1C
            STA   L3141
            ASL
            TAX
            LDA   L3119,X
            BNE   L30E2
            LDA   #$0001
            STA   L3119,X
            INC   L3117
            LDA   L3141
            ASL
            ASL
            TAY
            LDA   L3143,Y
            STAL  $000000
            LDA   L3143+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L3115       DB    $11
            DB    $00
L3117       DB    $00
            DB    $00
L3119       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3141       DB    $00
            DB    $00
L3143       ADRL  L3187
            ADRL  L31F2
            ADRL  L3263
            ADRL  L32CE
            ADRL  L333C
            ADRL  L33B0
            ADRL  L341B
            ADRL  L3486
            ADRL  L34F7
            ADRL  L3568
            ADRL  L35D9
            ADRL  L3656
            ADRL  L36CA
            ADRL  L3741
            ADRL  L37AC
            ADRL  L381D
            ADRL  L388E
L3187       JMP   L319C

L318A       STR   '0/GOODA'
L3192       DW    $0000       ;  ref num
            ADRL  L318A       ;  path name
            ADRL  $00000000   ;  reserved
L319C       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3192
            JSR   L2027
            LDA   L3192
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L31BA

L31B8       DW    $0000
L31BA       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0006
            STAL  $E0C034
            LDA   #$0006
            STA   L31B8
            ASL
            ASL
            ASL
            ASL
            ORA   L31B8
            STA   L31B8
            LDAL  $E0C022
            AND   #$FF00
            ORA   L31B8
            STAL  $E0C022
            JSR   L5231
            LDA   #$0004
            STA   L5366
            JMP   L38FF
L31F2       JMP   L3207

L31F5       STR   '0/GOODB'
L31FD       DW    $0000       ;  ref num
            ADRL  L31F5       ;  path name
            ADRL  $00000000   ;  reserved
L3207       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L31FD
            JSR   L2027
            LDA   L31FD
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L3225

L3223       DW    $0000
L3225       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3223
            ASL
            ASL
            ASL
            ASL
            ORA   L3223
            STA   L3223
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3223
            STAL  $E0C022
            JSR   L5231
            LDA   #$0002
            STA   L5366
            STA   L5368
            STA   L536A
            JMP   L38FF
L3263       JMP   L3278

L3266       STR   '0/GOODC'
L326E       DW    $0000       ;  ref num
            ADRL  L3266       ;  path name
            ADRL  $00000000   ;  reserved
L3278       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L326E
            JSR   L2027
            LDA   L326E
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L3296

L3294       DW    $0000
L3296       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3294
            ASL
            ASL
            ASL
            ASL
            ORA   L3294
            STA   L3294
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3294
            STAL  $E0C022
            JSR   L5231
            LDA   #$0004
            STA   L536C
            JMP   L38FF
L32CE       JMP   L32E3

L32D1       STR   '0/GOODD'
L32D9       DW    $0000       ;  ref num
            ADRL  L32D1       ;  path name
            ADRL  $00000000   ;  reserved
L32E3       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L32D9
            JSR   L2027
            LDA   L32D9
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L3301

L32FF       DW    $0000
L3301       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L32FF
            ASL
            ASL
            ASL
            ASL
            ORA   L32FF
            STA   L32FF
            LDAL  $E0C022
            AND   #$FF00
            ORA   L32FF
            STAL  $E0C022
            JSR   L5231
            LDA   #$0008
            STA   L5366
            STA   L5368
            JMP   L38FF
L333C       JMP   L3351

L333F       STR   '0/GOODE'
L3347       DW    $0000       ;  ref num
            ADRL  L333F       ;  path name
            ADRL  $00000000   ;  reserved
L3351       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3347
            JSR   L2027
            LDA   L3347
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L336F

L336D       DW    $0000
L336F       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L336D
            ASL
            ASL
            ASL
            ASL
            ORA   L336D
            STA   L336D
            LDAL  $E0C022
            AND   #$FF00
            ORA   L336D
            STAL  $E0C022
            JSR   L5231
            LDA   #$0008
            STA   L5366
            STA   L5368
            LDA   #$0003
            STA   L536A
            JMP   L38FF
L33B0       JMP   L33C5

L33B3       STR   '0/GOODF'
L33BB       DW    $0000       ;  ref num
            ADRL  L33B3       ;  path name
            ADRL  $00000000   ;  reserved
L33C5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L33BB
            JSR   L2027
            LDA   L33BB
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L33E3

L33E1       DW    $0000
L33E3       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L33E1
            ASL
            ASL
            ASL
            ASL
            ORA   L33E1
            STA   L33E1
            LDAL  $E0C022
            AND   #$FF00
            ORA   L33E1
            STAL  $E0C022
            JSR   L5231
            LDA   #$0002
            STA   L536C
            JMP   L38FF
L341B       JMP   L3430

L341E       STR   '0/GOODG'
L3426       DW    $0000       ;  ref num
            ADRL  L341E       ;  path name
            ADRL  $00000000   ;  reserved
L3430       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3426
            JSR   L2027
            LDA   L3426
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L344E

L344C       DW    $0000
L344E       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L344C
            ASL
            ASL
            ASL
            ASL
            ORA   L344C
            STA   L344C
            LDAL  $E0C022
            AND   #$FF00
            ORA   L344C
            STAL  $E0C022
            JSR   L5231
            LDA   #$0006
            STA   L536A
            JMP   L38FF
L3486       JMP   L349B

L3489       STR   '0/GOODH'
L3491       DW    $0000       ;  ref num
            ADRL  L3489       ;  path name
            ADRL  $00000000   ;  reserved
L349B       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3491
            JSR   L2027
            LDA   L3491
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L34B9

L34B7       DW    $0000
L34B9       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L34B7
            ASL
            ASL
            ASL
            ASL
            ORA   L34B7
            STA   L34B7
            LDAL  $E0C022
            AND   #$FF00
            ORA   L34B7
            STAL  $E0C022
            JSR   L5231
            LDA   #$0008
            STA   L5368
            LDA   #$000A
            STA   L536A
            JMP   L38FF
L34F7       JMP   L350C

L34FA       STR   '0/GOODI'
L3502       DW    $0000       ;  ref num
            ADRL  L34FA       ;  path name
            ADRL  $00000000   ;  reserved
L350C       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3502
            JSR   L2027
            LDA   L3502
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L352A

L3528       DW    $0000
L352A       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3528
            ASL
            ASL
            ASL
            ASL
            ORA   L3528
            STA   L3528
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3528
            STAL  $E0C022
            JSR   L5231
            LDA   #$000A
            STA   L5366
            LDA   #$0005
            STA   L5368
            JMP   L38FF
L3568       JMP   L357D

L356B       STR   '0/GOODJ'
L3573       DW    $0000       ;  ref num
            ADRL  L356B       ;  path name
            ADRL  $00000000   ;  reserved
L357D       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3573
            JSR   L2027
            LDA   L3573
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L359B

L3599       DW    $0000
L359B       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3599
            ASL
            ASL
            ASL
            ASL
            ORA   L3599
            STA   L3599
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3599
            STAL  $E0C022
            JSR   L5231
            LDA   #$0005
            STA   L5366
            LDA   #$000A
            STA   L536C
            JMP   L38FF
L35D9       JMP   L35EE

L35DC       STR   '0/GOODK'
L35E4       DW    $0000       ;  ref num
            ADRL  L35DC       ;  path name
            ADRL  $00000000   ;  reserved
L35EE       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L35E4
            JSR   L2027
            LDA   L35E4
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L360C

L360A       DW    $0000
L360C       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L360A
            ASL
            ASL
            ASL
            ASL
            ORA   L360A
            STA   L360A
            LDAL  $E0C022
            AND   #$FF00
            ORA   L360A
            STAL  $E0C022
            JSR   L5231
            LDA   #$000A
            STA   L5366
            LDA   #$000B
            STA   L5368
            LDA   #$0005
            STA   L536A
            LDA   #$000A
            STA   L536C
            JMP   L38FF
L3656       JMP   L366B

L3659       STR   '0/GOODL'
L3661       DW    $0000       ;  ref num
            ADRL  L3659       ;  path name
            ADRL  $00000000   ;  reserved
L366B       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3661
            JSR   L2027
            LDA   L3661
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L3689

L3687       DW    $0000
L3689       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L3687
            ASL
            ASL
            ASL
            ASL
            ORA   L3687
            STA   L3687
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3687
            STAL  $E0C022
            JSR   L5231
            LDA   #$0005
            STA   L5368
            LDA   #$0003
            STA   L536A
            STA   L536C
            JMP   L38FF
L36CA       JMP   L36DF

L36CD       STR   '0/GOODM'
L36D5       DW    $0000       ;  ref num
            ADRL  L36CD       ;  path name
            ADRL  $00000000   ;  reserved
L36DF       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L36D5
            JSR   L2027
            LDA   L36D5
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L36FD

L36FB       DW    $0000
L36FD       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000E
            STAL  $E0C034
            LDA   #$000E
            STA   L36FB
            ASL
            ASL
            ASL
            ASL
            ORA   L36FB
            STA   L36FB
            LDAL  $E0C022
            AND   #$FF00
            ORA   L36FB
            STAL  $E0C022
            JSR   L5231
            LDA   #$0002
            STA   L5366
            LDA   #$0003
            STA   L5368
            LDA   #$0004
            STA   L536C
            JMP   L38FF
L3741       JMP   L3756

L3744       STR   '0/GOODN'
L374C       DW    $0000       ;  ref num
            ADRL  L3744       ;  path name
            ADRL  $00000000   ;  reserved
L3756       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L374C
            JSR   L2027
            LDA   L374C
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L3774

L3772       DW    $0000
L3774       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L3772
            ASL
            ASL
            ASL
            ASL
            ORA   L3772
            STA   L3772
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3772
            STAL  $E0C022
            JSR   L5231
            LDA   #$0005
            STA   L536A
            JMP   L38FF
L37AC       JMP   L37C1

L37AF       STR   '0/GOODO'
L37B7       DW    $0000       ;  ref num
            ADRL  L37AF       ;  path name
            ADRL  $00000000   ;  reserved
L37C1       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L37B7
            JSR   L2027
            LDA   L37B7
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L37DF

L37DD       DW    $0000
L37DF       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0005
            STAL  $E0C034
            LDA   #$0005
            STA   L37DD
            ASL
            ASL
            ASL
            ASL
            ORA   L37DD
            STA   L37DD
            LDAL  $E0C022
            AND   #$FF00
            ORA   L37DD
            STAL  $E0C022
            JSR   L5231
            LDA   #$0007
            STA   L5368
            LDA   #$0005
            STA   L536C
            JMP   L38FF
L381D       JMP   L3832

L3820       STR   '0/GOODQ'
L3828       DW    $0000       ;  ref num
            ADRL  L3820       ;  path name
            ADRL  $00000000   ;  reserved
L3832       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3828
            JSR   L2027
            LDA   L3828
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L3850

L384E       DW    $0000
L3850       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L384E
            ASL
            ASL
            ASL
            ASL
            ORA   L384E
            STA   L384E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L384E
            STAL  $E0C022
            JSR   L5231
            LDA   #$000F
            STA   L5368
            LDA   #$0008
            STA   L536A
            JMP   L38FF
L388E       JMP   L38A3

L3891       STR   '0/GOODR'
L3899       DW    $0000       ;  ref num
            ADRL  L3891       ;  path name
            ADRL  $00000000   ;  reserved
L38A3       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L3899
            JSR   L2027
            LDA   L3899
            STA   L1CA9
            STA   L1CB7
            JSR   L50A1
            JMP   L38C1

L38BF       DW    $0000
L38C1       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L38BF
            ASL
            ASL
            ASL
            ASL
            ORA   L38BF
            STA   L38BF
            LDAL  $E0C022
            AND   #$FF00
            ORA   L38BF
            STAL  $E0C022
            JSR   L5231
            LDA   #$0002
            STA   L5368
            LDA   #$0003
            STA   L536A
            JMP   L38FF

L38FF       JSR   L4F05
            LDA   #$2000
            STA   L1CEF
            JSR   L2AE0
            STZ   L1CED
            JSR   L2152
            JSR   L4F8C
            RTS

L3915       LDA   L1D6F
            ASL
            TAY
            LDA   L1D71,Y
            BEQ   L3921
            SEC
            RTS

L3921       LDA   #$0001
            STA   L1D71,Y
            CLC
            RTS

L3929       LDY   #$0000
            LDA   #$0000
L392F       STA   L1D71,Y
            INY
            INY
            CPY   #$0014
            BNE   L392F
            RTS

L393A       LDA   #$000C
            STA   L1CE5
            LDA   #$0004
            PHA
            _SetForeColor
L394B       JSR   L2AE0
            CLC
            LDA   #$00BA
            STA   L1E04
            LDA   #$000B
            STA   L1E06
            LDA   #$00C7
            ADC   #$0001
            STA   L1E02
            LDA   #$0135
            ADC   #$0001
            STA   L1E08
            LDA   L1CE5
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            STZ   L1CFD
            LDA   #$00C4
            STA   L1CF7
            LDA   #$000F
            STA   L1CF5
            JMP   L39A8

	DO	VF
L3991       STR   '(espace : continuer)'
	ELSE
L3991       STR   '(spacebar to continue)'
	FIN
L39A8       LDA   #^L3991
            STA   L1CFB
            LDA   #L3991
            STA   L1CF9
            JSR   L21D2
	DO	VF
            LDA   #$00C6
	ELSE
            LDA   #$00D6
	FIN
            STA   L1CF5
            JMP   L39CE

	DO	VF
L39C0       STR   '(esc : quitter)'
	ELSE
L39C0       STR   '(esc to quit)'
	FIN
L39CE       LDA   #^L39C0
            STA   L1CFB
            LDA   #L39C0
            STA   L1CF9
            JSR   L21D2
L39DD       PEA   $0000
            PEA   $FFFF
            LDA   #^L1DC6
            PHA
            LDA   #L1DC6
            PHA
            _GetNextEvent
            PLA
            BNE   L39F8
            JMP   L39DD

L39F8       LDA   L1DC6
            CMP   #$0003
            BEQ   L3A03
            JMP   L3A22

L3A03       LDA   #$0000
            STA   L1E10
            LDA   L1DC8
            AND   #$007F
            CMP   #$001B
            BNE   L3A17
            JMP   L1C27

L3A17       CMP   #$0020
            BEQ   L3A1F
            JMP   L39DD
L3A1F       JMP   L3A30

L3A22       CMP   #$0001
            BEQ   L3A2A
            JMP   L39DD

L3A2A       LDA   #$0080
            STA   L1E10
L3A30       RTS

L3A31       STA   L3A76
            PHA
            LDA   #^L1D40
            PHA
            LDA   #L1D40
            PHA
            LDA   L3A76
            CMP   #$000A
            BCS   L3A4B
            LDA   #$0001
            JMP   L3A64

L3A4B       CMP   #$0064
            BCS   L3A56
            LDA   #$0002
            JMP   L3A64

L3A56       CMP   #$03E8
            BCS   L3A61
            LDA   #$0003
            JMP   L3A64

L3A61       LDA   #$0004
L3A64       STA   L1D3F
            PHA
            PEA   $0000
            _Int2Dec
            JSR   L2027
            RTS

L3A76       DW    $0000
L3A78       PHA
            LDA   #^L1D40
            PHA
            LDA   #L1D40
            PHA
            LDA   L1D3F
            AND   #$00FF
            PHA
            PEA   $0000
            _Dec2Int
            JSR   L2027
            PLA
            STA   L1D6D
            RTS
L3A9A       JMP   L3A9F

L3A9D       DW    $0000
L3A9F       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L3A9D
            ASL
            ASL
            ASL
            ASL
            ORA   L3A9D
            STA   L3A9D
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3A9D
            STAL  $E0C022
            JSR   L2100
            JSR   L2C12
            PEA   $FFFF
            _ClearScreen
            JSR   L210F
            CLC
            LDA   #$0036
            STA   L1E04
            LDA   #$0072
            STA   L1E06
            LDA   #$0048
            ADC   #$0001
            STA   L1E02
            LDA   #$00C5
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0038
            STA   L1E04
            LDA   #$0074
            STA   L1E06
            LDA   #$0046
            ADC   #$0001
            STA   L1E02
            LDA   #$00C3
            ADC   #$0001
            STA   L1E08
            LDA   #$000A
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L3B59

	DO	VF
L3B4E       STR   'Ton score'
L3B59       PEA   $007B
	ELSE
L3B4E       STR   'Your score'
L3B59       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L3B4E
            PHA
            LDA   #L3B4E
            PHA
            _DrawString
            LDA   #$0060
            STA   L1CF7
            LDA   #$0023
            STA   L1CF5
            LDA   #$0009
            STA   L1CFD
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L3BA8

	DO	VF
L3B95       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L3B95       STR   '     You answered '
	FIN
L3BA8       LDA   #^L3B95
            STA   L1CFB
            LDA   #L3B95
            STA   L1CF9
            JSR   L21D2
            LDA   L1D9B
            JSR   L3A31
            LDA   #^L1D3F
            STA   L1CFB
            LDA   #L1D3F
            STA   L1CF9
            JSR   L21FB
            JMP   L3BE3

	DO	VF
L3BCF       STR   ' questions sur 5'
	ELSE
L3BCF       STR   ' out of 5 questions'
	FIN
L3BE3       LDA   #^L3BCF
            STA   L1CFB
            LDA   #L3BCF
            STA   L1CF9
            JSR   L21FB
            JMP   L3C11

	DO	VF
L3BF5       STR   'correctement au premier essai.'
	ELSE
L3BF5       STR   'correctly on the first try.'
	FIN
L3C11       LDA   #^L3BF5
            STA   L1CFB
            LDA   #L3BF5
            STA   L1CF9
            JSR   L21D2
            LDA   L1D9B
            CMP   #$0005
            BEQ   L3C2B
            JMP   L3C67

L3C2B       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$0085
            STA   L1CF7
            JMP   L3C58

	DO	VF
L3C3F       STR   'C'27'est un score parfait !'
	ELSE
L3C3F       STR   'That is a perfect score!'
	FIN
L3C58       LDA   #^L3C3F
            STA   L1CFB
            LDA   #L3C3F
            STA   L1CF9
            JSR   L227E
L3C67       _InitCursor
            LDA   L1E10
            BNE   L3C7A
            _ObscureCursor
L3C7A       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L1CE5
            JSR   L394B
            RTS
L3C8F       JMP   L3C94

L3C92       DW    $0000
L3C94       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$000F
            STAL  $E0C034
            LDA   #$000F
            STA   L3C92
            ASL
            ASL
            ASL
            ASL
            ORA   L3C92
            STA   L3C92
            LDAL  $E0C022
            AND   #$FF00
            ORA   L3C92
            STAL  $E0C022
            JSR   L2100
            JSR   L2C12
            PEA   $FFFF
            _ClearScreen
            JSR   L210F
            CLC
            LDA   #$0036
            STA   L1E04
            LDA   #$0072
            STA   L1E06
            LDA   #$0048
            ADC   #$0001
            STA   L1E02
            LDA   #$00C5
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0038
            STA   L1E04
            LDA   #$0074
            STA   L1E06
            LDA   #$0046
            ADC   #$0001
            STA   L1E02
            LDA   #$00C3
            ADC   #$0001
            STA   L1E08
            LDA   #$000A
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$0006
            PHA
            _SetForeColor
            JMP   L3D4E

	DO	VF
L3D43       STR   'Ton score'
L3D4E       PEA   $007B
	ELSE
L3D43       STR   'Your score'
L3D4E       PEA   $0077
	FIN
            PEA   $0043
            _MoveTo
            LDA   #^L3D43
            PHA
            LDA   #L3D43
            PHA
            _DrawString
            LDA   #$0060
            STA   L1CF7
            LDA   #$0023
            STA   L1CF5
            LDA   #$0009
            STA   L1CFD
            LDA   #$0005
            PHA
            _SetForeColor
            JMP   L3D9D

	DO	VF
L3D8A       STR   '  Tu as r'8e'pondu '88' '
	ELSE
L3D8A       STR   '     You answered '
	FIN
L3D9D       LDA   #^L3D8A
            STA   L1CFB
            LDA   #L3D8A
            STA   L1CF9
            JSR   L21D2
            LDA   L1D9B
            JSR   L3A31
            LDA   #^L1D3F
            STA   L1CFB
            LDA   #L1D3F
            STA   L1CF9
            JSR   L21FB
            JMP   L3DD9

	DO	VF
L3DC4       STR   ' questions sur 10'
	ELSE
L3DC4       STR   ' out of 10 questions'
	FIN
L3DD9       LDA   #^L3DC4
            STA   L1CFB
            LDA   #L3DC4
            STA   L1CF9
            JSR   L21FB
            JMP   L3E07

	DO	VF
L3DEB       STR   'correctement au premier essai.'
	ELSE
L3DEB       STR   'correctly on the first try.'
	FIN
L3E07       LDA   #^L3DEB
            STA   L1CFB
            LDA   #L3DEB
            STA   L1CF9
            JSR   L21D2
            LDA   L1D9B
            CMP   #$0000
            BEQ   L3E21
            JMP   L3E57

L3E21       LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            JMP   L3E45

	DO	VF
L3E2E       STR   'C'27'est un score de 0%.'
	ELSE
L3E2E       STR   'That is a score of 0%.'
	FIN
L3E45       LDA   #^L3E2E
            STA   L1CFB
            LDA   #L3E2E
            STA   L1CF9
            JSR   L227E
            JMP   L3EFA

L3E57       LDA   L1CF7
            CLC
            ADC   L1CFD
            STA   L1CF7
            JMP   L3E78

	DO	VF
L3E64       STR   'C'27'est un score de '
	ELSE
L3E64       STR   'That is a score of '
	FIN
L3E78       LDA   #^L3E64
            STA   L1CFB
            LDA   #L3E64
            STA   L1CF9
            LDA   L1D9B
            JSR   L3A31
            LDA   L1CF9
            STA   L1CFF
            LDA   L1CFB
            STA   L1D01
            LDA   L1D3B
            STA   L1D03
            LDA   L1D3B+2
            STA   L1D05
            LDA   L1D3B
            STA   L1D07
            LDA   L1D3B+2
            STA   L1D09
            JSR   L2D97
            JMP   L3EB8

L3EB4       STR   '0%.'
L3EB8       LDA   #^L3EB4
            STA   L1CFB
            LDA   #L3EB4
            STA   L1CF9
            LDA   L1D3B
            STA   L1CFF
            LDA   L1D3B+2
            STA   L1D01
            LDA   L1CF9
            STA   L1D03
            LDA   L1CFB
            STA   L1D05
            LDA   L1D3B
            STA   L1D07
            LDA   L1D3B+2
            STA   L1D09
            JSR   L2D97
            LDA   #^L1D3F
            STA   L1CFB
            LDA   #L1D3F
            STA   L1CF9
            JSR   L227E
L3EFA       LDA   L1D9B
            CMP   #$000A
            BEQ   L3F05
            JMP   L3F41

L3F05       LDA   #$0004
            PHA
            _SetForeColor
            LDA   #$008E
            STA   L1CF7
            JMP   L3F32

	DO	VF
L3F19       STR   'C'27'est un score parfait !'
	ELSE
L3F19       STR   'That is a perfect score!'
	FIN
L3F32       LDA   #^L3F19
            STA   L1CFB
            LDA   #L3F19
            STA   L1CF9
            JSR   L227E
L3F41       _InitCursor
            LDA   L1E10
            BNE   L3F54
            _ObscureCursor
L3F54       LDA   #$000C
            PHA
            _SetForeColor
            LDA   #$0004
            STA   L1CE5
            JSR   L394B
            RTS

L3F69       LDA   #^L2FB3
            PHA
            LDA   #L2FB3
            PHA
            LDA   #$0002
            PHA
            LDA   #$0002
            PHA
            LDA   #$0013
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FBB
            PHA
            LDA   #L2FBB
            PHA
            LDA   #$0017
            PHA
            LDA   #$0002
            PHA
            LDA   #$0028
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FC3
            PHA
            LDA   #L2FC3
            PHA
            LDA   #$002C
            PHA
            LDA   #$0002
            PHA
            LDA   #$003D
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FCB
            PHA
            LDA   #L2FCB
            PHA
            LDA   #$0041
            PHA
            LDA   #$0002
            PHA
            LDA   #$0052
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FD3
            PHA
            LDA   #L2FD3
            PHA
            LDA   #$0056
            PHA
            LDA   #$0002
            PHA
            LDA   #$0067
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FDB
            PHA
            LDA   #L2FDB
            PHA
            LDA   #$006B
            PHA
            LDA   #$0002
            PHA
            LDA   #$007C
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FE3
            PHA
            LDA   #L2FE3
            PHA
            LDA   #$0080
            PHA
            LDA   #$0002
            PHA
            LDA   #$0091
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FEB
            PHA
            LDA   #L2FEB
            PHA
            LDA   #$0095
            PHA
            LDA   #$0002
            PHA
            LDA   #$00A6
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FF3
            PHA
            LDA   #L2FF3
            PHA
            LDA   #$00AA
            PHA
            LDA   #$0002
            PHA
            LDA   #$00BB
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FFB
            PHA
            LDA   #L2FFB
            PHA
            LDA   #$00BF
            PHA
            LDA   #$0002
            PHA
            LDA   #$00D0
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L3003
            PHA
            LDA   #L3003
            PHA
            LDA   #$00D6
            PHA
            LDA   #$0002
            PHA
            LDA   #$00E7
            CLC
            ADC   #$0001
            PHA
            LDA   #$0015
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L300B
            PHA
            LDA   #L300B
            PHA
            LDA   #$0001
            PHA
            LDA   #$0019
            PHA
            LDA   #$007B
            CLC
            ADC   #$0001
            PHA
            LDA   #$0036
            ADC   #$0001
            PHA
            _SetRect
            RTS

L4132       LDA   #^L2FB3
            PHA
            LDA   #L2FB3
            PHA
            LDA   #$0001
            PHA
            LDA   #$0001
            PHA
            LDA   #$001E
            CLC
            ADC   #$0001
            PHA
            LDA   #$0019
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FBB
            PHA
            LDA   #L2FBB
            PHA
            LDA   #$0021
            PHA
            LDA   #$0001
            PHA
            LDA   #$0042
            CLC
            ADC   #$0001
            PHA
            LDA   #$001D
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FC3
            PHA
            LDA   #L2FC3
            PHA
            LDA   #$0045
            PHA
            LDA   #$0001
            PHA
            LDA   #$005F
            CLC
            ADC   #$0001
            PHA
            LDA   #$0016
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FCB
            PHA
            LDA   #L2FCB
            PHA
            LDA   #$0062
            PHA
            LDA   #$0001
            PHA
            LDA   #$008D
            CLC
            ADC   #$0001
            PHA
            LDA   #$0026
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FD3
            PHA
            LDA   #L2FD3
            PHA
            LDA   #$0090
            PHA
            LDA   #$0001
            PHA
            LDA   #$00C2
            CLC
            ADC   #$0001
            PHA
            LDA   #$0029
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L2FDB
            PHA
            LDA   #L2FDB
            PHA
            LDA   #$006D
            PHA
            LDA   #$0083
            PHA
            LDA   #$013C
            CLC
            ADC   #$0001
            PHA
            LDA   #$00C5
            ADC   #$0001
            PHA
            _SetRect
            RTS

L4217       LDA   #$0006
            STA   L1CF5
            LDA   #$006C
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L1D6F
            ASL
            ASL
            TAY
            LDA   L424B,Y
            STAL  $000000
            LDA   L424B+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L424B       ADRL  L425F
            ADRL  L4306
            ADRL  L4382
            ADRL  L4432
            ADRL  L44EC
L425F       JMP   L4290

	DO	VF
L4262       STR   '     If John decides to walk to Sally'27's house'
	ELSE
L4262       STR   '     If John decides to walk to Sally'27's house'
	FIN
L4290       LDA   #^L4262
            STA   L1CFB
            LDA   #L4262
            STA   L1CF9
            JSR   L220B
            JMP   L42CB

	DO	VF
L42A2       STR   'instead of school, how much farther does'
	ELSE
L42A2       STR   'instead of school, how much farther does'
	FIN
L42CB       LDA   #^L42A2
            STA   L1CFB
            LDA   #L42A2
            STA   L1CF9
            JSR   L220B
            JMP   L42EE

	DO	VF
L42DD       STR   'he have to walk?'
	ELSE
L42DD       STR   'he have to walk?'
	FIN
L42EE       LDA   #^L42DD
            STA   L1CFB
            LDA   #L42DD
            STA   L1CF9
            JSR   L220B
            LDA   #$0064
            STA   L1D6F
            JMP   L456D
L4306       JMP   L4334

	DO	VF
L4309       STR   '     John walked to Sally'27's house and then'
	ELSE
L4309       STR   '     John walked to Sally'27's house and then'
	FIN
L4334       LDA   #^L4309
            STA   L1CFB
            LDA   #L4309
            STA   L1CF9
            JSR   L220B
            JMP   L436A

	DO	VF
L4346       STR   'to the store.  How far did he walk?'
	ELSE
L4346       STR   'to the store.  How far did he walk?'
	FIN
L436A       LDA   #^L4346
            STA   L1CFB
            LDA   #L4346
            STA   L1CF9
            JSR   L220B
            LDA   #$04BC
            STA   L1D6F
            JMP   L456D
L4382       JMP   L43B2

	DO	VF
L4385       STR   '     Sally walked past the store, to school,'
	ELSE
L4385       STR   '     Sally walked past the store, to school,'
	FIN
L43B2       LDA   #^L4385
            STA   L1CFB
            LDA   #L4385
            STA   L1CF9
            JSR   L220B
            JMP   L43EB

	DO	VF
L43C4       STR   'visited John after school, then walked'
	ELSE
L43C4       STR   'visited John after school, then walked'
	FIN
L43EB       LDA   #^L43C4
            STA   L1CFB
            LDA   #L43C4
            STA   L1CF9
            JSR   L220B
            JMP   L441A

	DO	VF
L43FD       STR   'home.  How far did she walk?'
	ELSE
L43FD       STR   'home.  How far did she walk?'
	FIN
L441A       LDA   #^L43FD
            STA   L1CFB
            LDA   #L43FD
            STA   L1CF9
            JSR   L220B
            LDA   #$07FC
            STA   L1D6F
            JMP   L456D
L4432       JMP   L445F

	DO	VF
L4435       STR   '     If Sally decides to go home from the'
	ELSE
L4435       STR   '     If Sally decides to go home from the'
	FIN
L445F       LDA   #^L4435
            STA   L1CFB
            LDA   #L4435
            STA   L1CF9
            JSR   L220B
            JMP   L449B

	DO	VF
L4471       STR   'store instead of going to school from the'
	ELSE
L4471       STR   'store instead of going to school from the'
	FIN
L449B       LDA   #^L4471
            STA   L1CFB
            LDA   #L4471
            STA   L1CF9
            JSR   L220B
            JMP   L44D4

	DO	VF
L44AD       STR   'store, how much farther will she walk?'
	ELSE
L44AD       STR   'store, how much farther will she walk?'
	FIN
L44D4       LDA   #^L44AD
            STA   L1CFB
            LDA   #L44AD
            STA   L1CF9
            JSR   L220B
            LDA   #$0118
            STA   L1D6F
            JMP   L456D
L44EC       JMP   L451B

	DO	VF
L44EF       STR   '     How far does Sally have to walk to get'
	ELSE
L44EF       STR   '     How far does Sally have to walk to get'
	FIN
L451B       LDA   #^L44EF
            STA   L1CFB
            LDA   #L44EF
            STA   L1CF9
            JSR   L220B
            JMP   L4558

	DO	VF
L452D       STR   'to school, if she goes to the store first?'
	ELSE
L452D       STR   'to school, if she goes to the store first?'
	FIN
L4558       LDA   #^L452D
            STA   L1CFB
            LDA   #L452D
            STA   L1CF9
            JSR   L220B
            LDA   #$02A8
            STA   L1D6F
L456D       LDA   #$0009
            PHA
            _SetForeColor
            LDA   #$0014
            STA   L1CF5
            LDA   #$008B
            STA   L1CF7
            JMP   L45B0

	DO	VF
L4587       STR   '    Saisis ta r'8e'ponse puis appuie sur'
	ELSE
L4587       STR   '     Please type your answer, then press'
	FIN
L45B0       LDA   #^L4587
            STA   L1CFB
            LDA   #L4587
            STA   L1CF9
            JSR   L21D2
            JMP   L45CA

	DO	VF
L45C2       STR   'ENTREE.'
	ELSE
L45C2       STR   'RETURN.'
	FIN
L45CA       LDA   #^L45C2
            STA   L1CFB
            LDA   #L45C2
            STA   L1CF9
            JSR   L21D2
            CLC
            LDA   #$0093
            STA   L1E04
            LDA   #$007E
            STA   L1E06
            LDA   #$00A1
            ADC   #$0001
            STA   L1E02
            LDA   #$00A7
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0095
            STA   L1E04
            LDA   #$0081
            STA   L1E06
            LDA   #$009F
            ADC   #$0001
            STA   L1E02
            LDA   #$00A4
            ADC   #$0001
            STA   L1E08
            LDA   #$0002
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L464E

	DO	VF
L4649       STR   'feet'
	ELSE
L4649       STR   'feet'
	FIN
L464E       PEA   $00AB
            PEA   $009E
            _MoveTo
            LDA   #^L4649
            PHA
            LDA   #L4649
            PHA
            _DrawString
            LDA   #$000F
            STA   L1D6B
            LDA   #$0002
            STA   L1D69
            LDA   #$0004
            STA   L1D0B
            LDA   #$0001
            STA   L1D9D
            JSR   L2820
            RTS

L4686       LDA   #$0050
            STA   L1CF5
            LDA   #$0032
            STA   L1CF7
            LDA   #$0009
            STA   L1CFD
            LDA   #$0009
            PHA
            _SetForeColor
            LDA   L1D6F
            ASL
            ASL
            TAY
            LDA   L46EE,Y
            STAL  $000000
            LDA   L46EE+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L46BA       DW    $0000
L46BC       CLC
            LDA   L46BA
            STA   L1E04
            LDA   #$0011
            STA   L1E06
            LDA   #$007E
            ADC   #$0001
            STA   L1E02
            LDA   #$0019
            ADC   #$0001
            STA   L1E08
            LDA   #$0007
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            RTS

L46EE       ADRL  L4702
            ADRL  L476E
            ADRL  L47E2
            ADRL  L4845
            ADRL  L48B6
L4702       LDA   #$006E
            STA   L46BA
            JSR   L46BC
            JMP   L4729

	DO	VF
L470E       STR   '     The temperature is 20'
	ELSE
L470E       STR   '     The temperature is 20'
	FIN
L4729       LDA   #^L470E
            STA   L1CFB
            LDA   #L470E
            STA   L1CF9
            JSR   L220B
            JMP   L4759

	DO	VF
L473B       STR   'degrees.  You go ice skating.'
	ELSE
L473B       STR   'degrees.  You go ice skating.'
	FIN
L4759       LDA   #^L473B
            STA   L1CFB
            LDA   #L473B
            STA   L1CF9
            JSR   L220B
            LDA   #$0054
            JMP   L4935

L476E       LDA   #$001B
            STA   L46BA
            JSR   L46BC
            JMP   L479C

	DO	VF
L477A       STR   '     The temperature inside is 95'
	ELSE
L477A       STR   '     The temperature inside is 95'
	FIN
L479C       LDA   #^L477A
            STA   L1CFB
            LDA   #L477A
            STA   L1CF9
            JSR   L220B
            JMP   L47CD

	DO	VF
L47AE       STR   'degrees.  You put on a jacket.'
	ELSE
L47AE       STR   'degrees.  You put on a jacket.'
	FIN
L47CD       LDA   #^L47AE
            STA   L1CFB
            LDA   #L47AE
            STA   L1CF9
            JSR   L220B
            LDA   #$0046
            JMP   L4935

L47E2       LDA   #$0026
            STA   L46BA
            JSR   L46BC
            JMP   L480D

	DO	VF
L47EE       STR   '     It is 85 degrees outside.'
	ELSE
L47EE       STR   '     It is 85 degrees outside.'
	FIN
L480D       LDA   #^L47EE
            STA   L1CFB
            LDA   #L47EE
            STA   L1CF9
            JSR   L220B
            JMP   L4830

	DO	VF
L481F       STR   'You go swimming.'
	ELSE
L481F       STR   'You go swimming.'
	FIN
L4830       LDA   #^L481F
            STA   L1CFB
            LDA   #L481F
            STA   L1CF9
            JSR   L220B
            LDA   #$0054
            JMP   L4935

L4845       LDA   #$000F
            STA   L46BA
            JSR   L46BC
            JMP   L486F

	DO	VF
L4851       STR   '     Your body temperature is'
	ELSE
L4851       STR   '     Your body temperature is'
	FIN
L486F       LDA   #^L4851
            STA   L1CFB
            LDA   #L4851
            STA   L1CF9
            JSR   L220B
            JMP   L48A1

	DO	VF
L4881       STR   '105 degrees.  You have a fever.'
	ELSE
L4881       STR   '105 degrees.  You have a fever.'
	FIN
L48A1       LDA   #^L4881
            STA   L1CFB
            LDA   #L4881
            STA   L1CF9
            JSR   L220B
            LDA   #$0054
            JMP   L4935

L48B6       LDA   #$002E
            STA   L46BA
            JSR   L46BC
            JMP   L48DD

	DO	VF
L48C2       STR   '     The temperature is 78'
	ELSE
L48C2       STR   '     The temperature is 78'
	FIN
L48DD       LDA   #^L48C2
            STA   L1CFB
            LDA   #L48C2
            STA   L1CF9
            JSR   L220B
            JMP   L490B

	DO	VF
L48EF       STR   'degrees.  You are shoveling'
	ELSE
L48EF       STR   'degrees.  You are shoveling'
	FIN
L490B       LDA   #^L48EF
            STA   L1CFB
            LDA   #L48EF
            STA   L1CF9
            JSR   L220B
            JMP   L4923

	DO	VF
L491D       STR   'snow.'
	ELSE
L491D       STR   'snow.'
	FIN
L4923       LDA   #^L491D
            STA   L1CFB
            LDA   #L491D
            STA   L1CF9
            JSR   L220B
            LDA   #$0046
L4935       STA   L1D6F
            LDA   #$000B
            PHA
            _SetForeColor
            LDA   #$0046
            STA   L1CF5
            LDA   #$006C
            STA   L1CF7
            JMP   L4976

	DO	VF
L4952       STR   '    Est-ce vrai ou faux ? Appuie sur'
	ELSE
L4952       STR   '     Is this true or false? Press T'
	FIN
L4976       LDA   #^L4952
            STA   L1CFB
            LDA   #L4952
            STA   L1CF9
            JSR   L220B
            JMP   L49A1

	DO	VF
L4988       STR   'V pour vrai ou F pour faux.'
	ELSE
L4988       STR   'for true or F for false.'
	FIN
L49A1       LDA   #^L4988
            STA   L1CFB
            LDA   #L4988
            STA   L1CF9
            JSR   L220B
            CLC
            LDA   #$0080
            STA   L1E04
            LDA   #$0068
            STA   L1E06
            LDA   #$008E
            ADC   #$0001
            STA   L1E02
            LDA   #$00A0
            ADC   #$0001
            STA   L1E08
            LDA   #$0000
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$007F
            STA   L1E04
            LDA   #$0067
            STA   L1E06
            LDA   #$008D
            ADC   #$0001
            STA   L1E02
            LDA   #$009F
            ADC   #$0001
            STA   L1E08
            LDA   #$0004
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0081
            STA   L1E04
            LDA   #$006A
            STA   L1E06
            LDA   #$008B
            ADC   #$0001
            STA   L1E02
            LDA   #$0076
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0081
            STA   L1E04
            LDA   #$0079
            STA   L1E06
            LDA   #$008B
            ADC   #$0001
            STA   L1E02
            LDA   #$009C
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L4A8A

	DO	VF
L4A82       STR   'V  Vrai'
	ELSE
L4A82       STR   'T  True'
	FIN
L4A8A       PEA   $006C
            PEA   $008A
            _MoveTo
            LDA   #^L4A82
            PHA
            LDA   #L4A82
            PHA
            _DrawString
            LDA   #^L1E14
            PHA
            LDA   #L1E14
            PHA
            LDA   #$0067
            PHA
            LDA   #$007F
            PHA
            LDA   #$009F
            CLC
            ADC   #$0001
            PHA
            LDA   #$008D
            ADC   #$0001
            PHA
            _SetRect
            CLC
            LDA   #$0080
            STA   L1E04
            LDA   #$00DC
            STA   L1E06
            LDA   #$008E
            ADC   #$0001
            STA   L1E02
            LDA   #$011B
            ADC   #$0001
            STA   L1E08
            LDA   #$0000
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$007F
            STA   L1E04
            LDA   #$00DB
            STA   L1E06
            LDA   #$008D
            ADC   #$0001
            STA   L1E02
            LDA   #$011A
            ADC   #$0001
            STA   L1E08
            LDA   #$0004
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0081
            STA   L1E04
            LDA   #$00DE
            STA   L1E06
            LDA   #$008B
            ADC   #$0001
            STA   L1E02
            LDA   #$00E9
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            CLC
            LDA   #$0081
            STA   L1E04
            LDA   #$00EC
            STA   L1E06
            LDA   #$008B
            ADC   #$0001
            STA   L1E02
            LDA   #$0117
            ADC   #$0001
            STA   L1E08
            LDA   #$0006
            STA   L1E0C
            JSR   L2C7A
            JSR   L2C82
            JSR   L2C3A
            JSR   L2C6A
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L4BA7

	DO	VF
L4B9E       STR   'F  Faux'
	ELSE
L4B9E       STR   'F  False'
	FIN
L4BA7       PEA   $00E0
            PEA   $008A
            _MoveTo
            LDA   #^L4B9E
            PHA
            LDA   #L4B9E
            PHA
            _DrawString
            LDA   #^L1E1C
            PHA
            LDA   #L1E1C
            PHA
            LDA   #$00DB
            PHA
            LDA   #$007F
            PHA
            LDA   #$011A
            CLC
            ADC   #$0001
            PHA
            LDA   #$008D
            ADC   #$0001
            PHA
            _SetRect
            LDA   #$0054
            STA   L1E6F
            LDA   #$0046
            STA   L1E71
            LDA   #$0002
            STA   L1E6D
            JSR   L2AE0
            RTS

L4BFF       LDA   L1D6F
            ASL
            ASL
            TAY
            LDA   L4C16,Y
            STAL  $000000
            LDA   L4C16+2,Y
            STAL  $000002
*            JML   ($0000)
            JML   $0000

L4C16       ADRL  L4C3E
            ADRL  L4C7F
            ADRL  L4CBB
            ADRL  L4CF5
            ADRL  L4D34
            ADRL  L4D6E
            ADRL  L4DA9
            ADRL  L4DE3
            ADRL  L4E1E
            ADRL  L4E5B
L4C3E       JMP   L4C4C

	DO	VF
L4C41       STR   '4 quarters'
	ELSE
L4C41       STR   '4 quarters'
	FIN
L4C4C       LDA   #^L4C41
            STA   L2013
            LDA   #L4C41
            STA   L2011
            JMP   L4C6A

	DO	VF
L4C5B       STR   '2 half-dollars'
	ELSE
L4C5B       STR   '2 half-dollars'
	FIN
L4C6A       LDA   #^L4C5B
            STA   L2017
            LDA   #L4C5B
            STA   L2015
            LDA   #$0045
            STA   L1D6F
            JMP   L4E96
L4C7F       JMP   L4C8D

	DO	VF
L4C82       STR   '20 pennies'
	ELSE
L4C82       STR   '20 pennies'
	FIN
L4C8D       LDA   #^L4C82
            STA   L2013
            LDA   #L4C82
            STA   L2011
            JMP   L4CA6

	DO	VF
L4C9C       STR   '5 nickels'
	ELSE
L4C9C       STR   '5 nickels'
	FIN
L4CA6       LDA   #^L4C9C
            STA   L2017
            LDA   #L4C9C
            STA   L2015
            LDA   #$0042
            STA   L1D6F
            JMP   L4E96
L4CBB       JMP   L4CC9

	DO	VF
L4CBE       STR   '2 quarters'
	ELSE
L4CBE       STR   '2 quarters'
	FIN
L4CC9       LDA   #^L4CBE
            STA   L2013
            LDA   #L4CBE
            STA   L2011
            JMP   L4CE0

	DO	VF
L4CD8       STR   '3 dimes'
	ELSE
L4CD8       STR   '3 dimes'
	FIN
L4CE0       LDA   #^L4CD8
            STA   L2017
            LDA   #L4CD8
            STA   L2015
            LDA   #$0041
            STA   L1D6F
            JMP   L4E96
L4CF5       JMP   L4D06

	DO	VF
L4CF8       STR   '1 half-dollar'
	ELSE
L4CF8       STR   '1 half-dollar'
	FIN
L4D06       LDA   #^L4CF8
            STA   L2013
            LDA   #L4CF8
            STA   L2011
            JMP   L4D1F

	DO	VF
L4D15       STR   '9 nickels'
	ELSE
L4D15       STR   '9 nickels'
	FIN
L4D1F       LDA   #^L4D15
            STA   L2017
            LDA   #L4D15
            STA   L2015
            LDA   #$0041
            STA   L1D6F
            JMP   L4E96
L4D34       JMP   L4D41

	DO	VF
L4D37       STR   '2 dollars'
	ELSE
L4D37       STR   '2 dollars'
	FIN
L4D41       LDA   #^L4D37
            STA   L2013
            LDA   #L4D37
            STA   L2011
            JMP   L4D59

	DO	VF
L4D50       STR   '20 dimes'
	ELSE
L4D50       STR   '20 dimes'
	FIN
L4D59       LDA   #^L4D50
            STA   L2017
            LDA   #L4D50
            STA   L2015
            LDA   #$0045
            STA   L1D6F
            JMP   L4E96
L4D6E       JMP   L4D7B

	DO	VF
L4D71       STR   '1 quarter'
	ELSE
L4D71       STR   '1 quarter'
	FIN
L4D7B       LDA   #^L4D71
            STA   L2013
            LDA   #L4D71
            STA   L2011
            JMP   L4D94

	DO	VF
L4D8A       STR   '8 nickels'
	ELSE
L4D8A       STR   '8 nickels'
	FIN
L4D94       LDA   #^L4D8A
            STA   L2017
            LDA   #L4D8A
            STA   L2015
            LDA   #$0042
            STA   L1D6F
            JMP   L4E96
L4DA9       JMP   L4DB4

	DO	VF
L4DAC       STR   '6 dimes'
	ELSE
L4DAC       STR   '6 dimes'
	FIN
L4DB4       LDA   #^L4DAC
            STA   L2013
            LDA   #L4DAC
            STA   L2011
            JMP   L4DCE

	DO	VF
L4DC3       STR   '2 quarters'
	ELSE
L4DC3       STR   '2 quarters'
	FIN
L4DCE       LDA   #^L4DC3
            STA   L2017
            LDA   #L4DC3
            STA   L2015
            LDA   #$0041
            STA   L1D6F
            JMP   L4E96
L4DE3       JMP   L4DF1

	DO	VF
L4DE6       STR   '3 quarters'
	ELSE
L4DE6       STR   '3 quarters'
	FIN
L4DF1       LDA   #^L4DE6
            STA   L2013
            LDA   #L4DE6
            STA   L2011
            JMP   L4E09

	DO	VF
L4E00       STR   '1 dollar'
	ELSE
L4E00       STR   '1 dollar'
	FIN
L4E09       LDA   #^L4E00
            STA   L2017
            LDA   #L4E00
            STA   L2015
            LDA   #$0042
            STA   L1D6F
            JMP   L4E96
L4E1E       JMP   L4E2C

	DO	VF
L4E21       STR   '10 nickels'
	ELSE
L4E21       STR   '10 nickels'
	FIN
L4E2C       LDA   #^L4E21
            STA   L2013
            LDA   #L4E21
            STA   L2011
            JMP   L4E46

	DO	VF
L4E3B       STR   '2 quarters'
	ELSE
L4E3B       STR   '2 quarters'
	FIN
L4E46       LDA   #^L4E3B
            STA   L2017
            LDA   #L4E3B
            STA   L2015
            LDA   #$0045
            STA   L1D6F
            JMP   L4E96
L4E5B       JMP   L4E6A

	DO	VF
L4E5E       STR   '100 pennies'
	ELSE
L4E5E       STR   '100 pennies'
	FIN
L4E6A       LDA   #^L4E5E
            STA   L2013
            LDA   #L4E5E
            STA   L2011
            JMP   L4E84

	DO	VF
L4E79       STR   '4 quarters'
	ELSE
L4E79       STR   '4 quarters'
	FIN
L4E84       LDA   #^L4E79
            STA   L2017
            LDA   #L4E79
            STA   L2015
            LDA   #$0045
            STA   L1D6F
L4E96       LDA   #$0019
            STA   L4F03
            LDA   L2011
            STA   L1CF9
            LDA   L2013
            STA   L1CFB
            JSR   L4ECA
            LDA   #$00B2
            STA   L4F03
            LDA   L2015
            STA   L1CF9
            LDA   L2017
            STA   L1CFB
            JSR   L4ECA
            JSR   L2820
            LDA   #$0001
            STA   L1D9D
            RTS

L4ECA       PHA
            LDA   L1CFB
            PHA
            LDA   L1CF9
            PHA
            _StringWidth
            PLA
            STA   L4F01
            LDA   #$0073
            SEC
            SBC   L4F01
            LSR
            CLC
            ADC   L4F03
            STA   L1CF5
            LDA   #$0001
            PHA
            _SetForeColor
            LDA   #$0033
            STA   L1CF7
            JMP   L220B

L4F01       DW    $0000
L4F03       DW    $0000
L4F05       LDX   #$0000
L4F08       LDA   L5366,X
            STA   L5097,X
            INX
            INX
            CPX   #$0008
            BCC   L4F08
            PEA   $0003
            _IntSource
            PHA
            PEA   $0064
            _GetSCB
            JSR   L2027
            PLA
            AND   #$000F
            PHA
            LDA   #^L5386
            PHA
            LDA   #L5386
            PHA
            _GetColorTable
            JSR   L2027
            PHA
            PEA   $0064
            _GetSCB
            JSR   L2027
            PLA
            AND   #$000F
            PHA
            LDA   #^L53A6
            PHA
            LDA   #L53A6
            PHA
            _GetColorTable
            JSR   L2027
            LDA   #^L4FCB
            PHA
            LDA   #L4FCB
            PHA
            _SetHeartBeat
            JSR   L2027
            LDA   #$8000
            STA   L535C
            PEA   $0002
            _IntSource
            RTS

L4F8C       PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L5386
            PHA
            LDA   #L5386
            PHA
            _SetColorTable
            JSR   L2027
            LDA   #^L4FCB
            PHA
            LDA   #L4FCB
            PHA
            _DelHeartBeat
            JSR   L2027
            STZ   L535C
            PEA   $0002
            _IntSource
            RTS

L4FCB       ADRL  $00000000
L4FCF       DW    $0001
            DW    $A55A
            PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L509F
L4FDC       JSR   L501D
            INC   L509F
            INC   L509F
            LDA   L509F
            CMP   #$0008
            BCC   L4FDC
            PHA
            PEA   $0064
            _GetSCB
            JSR   L2027
            PLA
            AND   #$000F
            PHA
            LDA   #^L53A6
            PHA
            LDA   #L53A6
            PHA
            _SetColorTable
            JSR   L2027
            LDA   #$0001
            STA   L4FCF
            SEP   #$30
            PLA
            PLB
            RTL

            MX    %00
L501D       LDX   L509F
            DEC   L5097,X
            BEQ   L5026
            RTS

L5026       LDA   L5366,X
            STA   L5097,X
            LDA   L536E,X
            STA   L5093
            LDA   L537E,X
            STA   L5095
L5038       LDA   L5095
            CMP   L5376,X
            BCC   L5048
            BEQ   L5048
            LDA   L536E,X
            STA   L5095
L5048       LDY   L5093
            LDA   L5386,Y
            LDY   L5095
            STA   L53A6,Y
            INC   L5095
            INC   L5095
            INC   L5093
            INC   L5093
            LDA   L5093
            CMP   L5376,X
            BCC   L5038
            BEQ   L5038
            LDA   L537E,X
            CLC
            ADC   L535E,X
            STA   L537E,X
            CMP   #$8000
            BCS   L507E
            CMP   L536E,X
            BCS   L5085
L507E       LDA   L5376,X
            STA   L537E,X
            RTS

L5085       CMP   L5376,X
            BCC   L5092
            BEQ   L5092
            LDA   L536E,X
            STA   L537E,X
L5092       RTS

L5093       DB    $00
            DB    $00
L5095       DB    $00
            DB    $00
L5097       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L509F       DB    $00
            DB    $00
L50A1       PHA
            PEA   $0064
            _GetSCB
            JSR   L2027
            PLA
            AND   #$000F
            STA   L520F
            LDA   L520F
            PHA
            LDA   #^L5211
            PHA
            LDA   #L5211
            PHA
            _GetColorTable
            JSR   L2027
            PEA   $0001
            LDA   #^L5211
            PHA
            LDA   #L5211
            PHA
            _SetColorTable
            JSR   L2027
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L1C9B
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L2027
            PLA
            STA   $00
            STA   L53C6
            PLA
            STA   $02
            STA   L53C8
            LDY   #$0000
            LDA   [$00],Y
            STA   L53CA
            LDY   #$0002
            LDA   [$00],Y
            STA   L53CC
            LDA   #^L53D4
            STA   L1CAB+2
            LDA   #L53D4
            STA   L1CAB
            LDA   #$000F
            STA   L1CAF
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            LDA   #$00E1
            STA   L1CAB+2
            LDA   #$9E00
            STA   L1CAB
            PHA
            PHA
            LDA   L53E1
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L1CAF
            PLA
            STA   L1CAF+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            LDA   #^L53E3
            STA   L1CAB+2
            LDA   #L53E3
            STA   L1CAB
            LDA   #$0002
            STA   L1CAF
            LDA   #$0000
            STA   L1CAF+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            LDA   L53CA
            STA   L1CAB
            LDA   L53CC
            STA   L1CAB+2
            LDA   #$0320
            STA   L1CAF
            LDA   #$0000
            STA   L1CAF+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            LDA   L1CCF
            STA   L1C83
            LDA   L1CD1
            STA   L1C85
            JSR   L2B79
            LDA   L1C87
            STA   L1CD3
            LDA   L1C89
            STA   L1CD5
            LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HLock
            JSR   L2027
            LDA   L1CD3
            STA   L1CAB
            LDA   L1CD5
            STA   L1CAB+2
            LDA   #$8000
            STA   L1CAF
            LDA   #$0000
            STA   L1CAF+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L1CA9
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L1CB7
            RTS

L520F       DW    $0000
L5211       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L5231       _HideCursor
            LDA   #$00E1
            STA   L1CAB+2
            LDA   #$2000
            STA   L1CAB
            LDA   L1CD3
            STA   L53CE
            LDA   L1CD5
            STA   L53D0
            LDA   #$00C8
            STA   L1C97
            LDA   #$0000
            STA   L1CED
L525C       LDA   #$0000
            STA   L53D2
            LDA   #$00A0
            STA   L1CE3
L5268       PHA
            LDA   L53D0
            PHA
            LDA   L53CE
            PHA
            LDA   L53CA
            STA   $00
            LDA   L53CC
            STA   $02
            LDA   L1CED
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L1CAB
            PHA
            LDA   #L1CAB
            PHA
            LDA   #^L1CE3
            PHA
            LDA   #L1CE3
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L53D2
            STA   L53D2
            LDA   L1CE3
            BNE   L5268
            LDA   L53CE
            CLC
            ADC   L53D2
            STA   L53CE
            LDA   L53D0
            ADC   #$0000
            STA   L53D0
            LDA   L1CED
            PHA
            PEA   $0000
            _SetSCB
            JSR   L2027
            INC   L1CED
            DEC   L1C97
            BEQ   L52D7
            JMP   L525C

L52D7       LDA   L53C8
            PHA
            LDA   L53C6
            PHA
            _DisposeHandle
            JSR   L2027
            LDA   L53CE
            CLC
            ADC   #$0009
            STA   L53CE
            LDA   L53D0
            ADC   #$0000
            STA   L53D0
            LDX   #$0000
L52FF       LDA   L53CE
            STA   $00
            LDA   L53D0
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L5316
            LDA   #$FFFE
            JMP   L5319

L5316       LDA   #$0002
L5319       STA   L535E,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L536E,X
            STA   L537E,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L5376,X
            LDA   L53CE
            CLC
            ADC   #$0008
            STA   L53CE
            INX
            INX
            CPX   #$0008
            BCS   L5349
            JMP   L52FF

L5349       LDA   L1CD1
            PHA
            LDA   L1CCF
            PHA
            _HUnlock
            JSR   L2027
            RTS

L535C       DB    $00
            DB    $00
L535E       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5366       DB    $05
            DB    $00
L5368       DB    $05
            DB    $00
L536A       DB    $05
            DB    $00
L536C       DB    $05
            DB    $00
L536E       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5376       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L537E       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L5386       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L53A6       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L53C6       DB    $00
            DB    $00
L53C8       DB    $00
            DB    $00
L53CA       DB    $00
            DB    $00
L53CC       DB    $00
            DB    $00
L53CE       DB    $00
            DB    $00
L53D0       DB    $00
            DB    $00
L53D2       DB    $00
            DB    $00
L53D4       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L53E1       DB    $00
            DB    $00
L53E3       DB    $00
            DB    $00
            JSR   L2AF0
            JSR   L2100
            JSR   L5231
            JSR   L28D9
            PEA   $0000
            _ClearScreen
            JSR   L210F
            LDA   L1CD3
            STA   $00
            LDA   L1CD5
            STA   $02
            LDA   #$2000
            STA   $04
            LDA   #$00E1
            STA   $06
            LDA   #$5000
            STA   L5442
            LDA   #$3E80
            STA   L1C95
L541E       PEA   $0000
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
            DEC   L5442
            BNE   L541E
            JSR   L2922
            RTS

L5442       DW    $0000
            JSR   L2AF0
            LDA   #$2000
            STA   $00
            LDA   #$00E1
            STA   $02
            LDA   #$4000
            STA   L548C
            LDA   #$3E80
            STA   L1C95
L545D       PEA   $0000
            _Random
            PLA
            LSR
            LSR
            LSR
            ASL
            ASL
            CMP   #$7CFF
            BCS   L545D
            TAY
            LDA   #$0000
            STA   [$00],Y
            INY
            INY
            STA   [$00],Y
            DEC   L548C
            BNE   L545D
            PEA   $0000
            _ClearScreen
            RTS

L548C       DW    $0000

