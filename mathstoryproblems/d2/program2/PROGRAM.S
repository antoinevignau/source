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
            STA   L0340
            JSR   L0B00
            LDA   L0340
            AND   #$F0FF
            ORA   #$0100
            STA   L0342
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L0342
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0B00
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L0344
            LDA   L0344
            TAY
            CLC
            ADC   #$0100
            STA   L0344
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L0340
            PHA
            _EMStartUp
            JSR   L0B00
            LDY   L0344
            TYA
            CLC
            ADC   #$0300
            STA   L0344
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0340
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
            JSR   L0B00
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
            JSR   L0B00
            PLA
            STA   L0332
            PLA
            STA   L0334
            LDA   L0334
            PHA
            LDA   L0332
            PHA
            _GetClip
            JSR   L0B00
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0342
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0B00
            PLA
            STA   L0459
            PLA
            STA   L045B
            LDA   #$8000
            STA   L046F
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0342
            PHA
            PEA   $0100
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0B00
            PLA
            STA   L05C4
            PLA
            STA   L05C4+2
            JMP   L01A1

L018D       STR   'MAIN.MENU'
L0197       DW    $0000       ;  ref num
            ADRL  L018D       ;  path name
            ADRL  $00000000   ;  reserved
L01A1       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0197
            JSR   L0B00
            LDA   L0197
            STA   L0350
            STA   L035E
            JSR   L1F2D
            JMP   L01BF

L01BD       DW    $0000
L01BF       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0007
            STAL  $E0C034
            LDA   #$0007
            STA   L01BD
            ASL
            ASL
            ASL
            ASL
            ORA   L01BD
            STA   L01BD
            LDAL  $E0C022
            AND   #$FF00
            ORA   L01BD
            STAL  $E0C022
            JSR   L20BD
L01EE       _InitCursor
            _ObscureCursor
            LDA   #^L0509
            PHA
            LDA   #L0509
            PHA
            LDA   #$0042
            PHA
            LDA   #$0030
            PHA
            LDA   #$00F9
            CLC
            ADC   #$0001
            PHA
            LDA   #$0047
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L0511
            PHA
            LDA   #L0511
            PHA
            LDA   #$0016
            PHA
            LDA   #$0055
            PHA
            LDA   #$0124
            CLC
            ADC   #$0001
            PHA
            LDA   #$006F
            ADC   #$0001
            PHA
            _SetRect
            LDA   #^L0519
            PHA
            LDA   #L0519
            PHA
            LDA   #$007F
            PHA
            LDA   #$007A
            PHA
            LDA   #$00B0
            CLC
            ADC   #$0001
            PHA
            LDA   #$0090
            ADC   #$0001
            PHA
            _SetRect
            JSR   L1B83
L0271       JSR   L1A8E
            JSR   L1CDD
            LDA   L04CC
            CMP   #$0020
            BNE   L0296
            JSR   L1C2A
            INC   L1CD1
            LDA   L1CD1
            CMP   #$0003
            BCC   L0290
            STZ   L1CD1
L0290       JSR   L1B83
            JMP   L0271

L0296       CMP   #$000D
            BNE   L02A2
            LDA   L1CD1
            CLC
            ADC   #$0041
L02A2       CMP   #$0041
            BNE   L02C0
            JSR   L1C2A
            LDA   #$0000
            STA   L1CD1
            JSR   L1B83
            JSR   L15EC
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L030C
L02C0       CMP   #$0042
            BNE   L02DE
            JSR   L1C2A
            LDA   #$0001
            STA   L1CD1
            JSR   L1B83
            JSR   L15EC
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L031B
L02DE       CMP   #$0043
            BNE   L02F2
            JSR   L1C2A
            LDA   #$0002
            STA   L1CD1
            JSR   L1B83
            JMP   L02F5
L02F2       JMP   L0271

L02F5       JSR   L168F
            JSR   L11BF
            LDA   L04CC
	DO	VF
            CMP   #'O'
            	ELSE
            CMP   #'Y'
	FIN
            BEQ   L0309
            JSR   L16DF
            JMP   L01EE
L0309       JMP   L14E9

L030C       ADRL  L0312       ;  path name
            DW    $0000       ;  flags
L0312       STR   'programc'
L031B       ADRL  L0321       ;  path name
            DW    $0000       ;  flags
L0321       STR   'programd'
L032A       DB    $00
            DB    $00
L032C       DB    $00
            DB    $00
L032E       DB    $00
            DB    $00
L0330       DB    $00
            DB    $00
L0332       DB    $00
            DB    $00
L0334       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L033C       DB    $00
            DB    $00
L033E       DB    $00
            DB    $00
L0340       DB    $00
            DB    $00
L0342       DB    $00
            DB    $00
L0344       DB    $00
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
L0350       DW    $0000       ;  ref num
L0352       ADRL  $00000000   ;  buffer ptr
L0356       ADRL  $00000000   ;  request count
L035A       ADRL  $00000000   ;  transfer count
L035E       DW    $0000       ;  ref num
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
            ADRL  L03D2
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
            ADRL  L03D2
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L038C       DW    $0000       ;  ref num
L038E       ADRL  $00000000   ;  buffer ptr
L0392       ADRL  $00000000   ;  request count
L0396       ADRL  $00000000   ;  transfer count
L039A       DW    $0000       ;  ref num
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
L03AE       DW    $0000       ;  ref num
            ADRL  $00000000   ;  buffer ptr
L03B4       ADRL  $00000000   ;  request count
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
L03D2       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0459       DB    $00
            DB    $00
L045B       DB    $00
            DB    $00
L045D       DB    $00
            DB    $00
L045F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0469       DB    $00
            DB    $00
            DB    $00
            DB    $00
L046D       DB    $00
            DB    $00
L046F       DB    $00
            DB    $00
L0471       DB    $00
            DB    $00
L0473       DB    $00
            DB    $00
L0475       DB    $00
            DB    $00
L0477       DB    $00
            DB    $00
L0479       DB    $00
            DB    $00
L047B       DB    $00
            DB    $00
L047D       DB    $00
            DB    $00
L047F       DB    $00
            DB    $00
L0481       DB    $00
            DB    $00
L0483       DB    $00
            DB    $00
L0485       DB    $00
            DB    $00
L0487       DB    $09
            DB    $00
L0489       DB    $00
            DB    $00
L048B       DB    $00
            DB    $00
L048D       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            ADRL  L049A
            DB    $FF
L049A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04AC       DB    $00
            DB    $00
L04AE       DB    $00
            DB    $00
L04B0       DW    $0000       ; event code
L04B2       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L04BA       DW    $0000       ; mouse location
L04BC       DW    $0000
            DW    $0000       ; modifiers
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L04C8       DB    $00
            DB    $00
L04CA       DB    $00
            DB    $00
L04CC       DB    $00
            DB    $00
L04CE       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04D7       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04DF       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04E7       DB    $00
            DB    $00
L04E9       DB    $00
            DB    $00
L04EB       DB    $00
            DB    $00
L04ED       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0501       DB    $00
            DB    $00
L0503       DB    $00
            DB    $00
L0505       DB    $00
            DB    $00
L0507       DB    $00
            DB    $00
L0509       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0511       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0519       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0559       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0562       DB    $00
            DB    $00
L0564       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0578       ADRL  L05A4       ; ptr to source locinfo
            ADRL  L05B4       ; ptr to dest locinfo
            ADRL  L05DC       ; ptr to source rect
            ADRL  L05D8       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L05A4       ; ptr to source locinfo
            ADRL  L05C8       ; ptr to dest locinfo
            ADRL  L05E8       ; ptr to source rect
            ADRL  L05E4       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L05A4       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L05B4       DW    $0000       ; SCB byte
L05B6       ADRL  $00000000   ; Pointer to pixel image
L05BA       DW    $0010       ; Width
L05BC       DW    $0000       ; Bounds rect
L05BE       DW    $0000
L05C0       DW    $0014
L05C2       DW    $0014
L05C4       ADRL  $00000000
L05C8       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L05D8       DW    $0000
            DW    $0000
L05DC       DW    $0000
            DW    $0000
            DW    $0014
            DW    $0014
L05E4       DW    $0000
            DW    $0000
L05E8       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L05F0       ADRL  L05B4       ; ptr to source locinfo
            ADRL  L05A4       ; ptr to dest locinfo
            ADRL  L061C       ; ptr to source rect
            ADRL  L0624       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
            ADRL  L05C8       ; ptr to source locinfo
            ADRL  L05A4       ; ptr to dest locinfo
            ADRL  L0628       ; ptr to source rect
            ADRL  L0630       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L061C       DW    $0000
L061E       DW    $0000
L0620       DW    $0014
L0622       DW    $0014
L0624       DW    $0000
            DW    $0000
L0628       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0630       DW    $0000
            DW    $0000
L0634       ADRL  L05A4       ; ptr to source locinfo
            ADRL  L064A       ; ptr to dest locinfo
            ADRL  L065A       ; ptr to source rect
            ADRL  L0662       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L064A       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L065A       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L0662       DW    $0000
            DW    $0000
L0666       ADRL  L064A       ; ptr to source locinfo
            ADRL  L05A4       ; ptr to dest locinfo
            ADRL  L067C       ; ptr to source rect
            ADRL  L0684       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L067C       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L0684       DW    $0000
            DW    $0000
L0688       DB    $00
            DB    $00
L068A       DB    $00
            DB    $00
L068C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            ASC   '>> Information \N300'00
            ASC   '--Capital\N301'00
            ASC   '--Route\N302'00
            ASC   '--Language(s)\N303'00
            ASC   '--Currency\N304'00
            ASC   '$>> Options \N310'00
            ASC   '--Depart\N311'00
            ASC   '---\N312D'00
            ASC   '--Quit\N313'00
            DB    $24
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0A59       HEX   7200000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L0A79       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L0A99       HEX   0000030D09002D0D720055052F02AF06
            HEX   5008600FAA0A980FD000F00FF902FF0F
            DB    $00
            DB    $00
            ADRL  L0ABF
L0ABF       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0B00       BCS   L0B03
            RTS

L0B03       PHA
            LDA   #^L0B14
            PHA
            LDA   #L0B14
            PHA
            _SysFailMgr
            RTS

	DO	VF
L0B14       STR   'Erreur applicative ... Oups !'
	ELSE
L0B14       STR   'Application failure ... Oops!'
	FIN
L0B32       LDA   #$0000
            STA   L0507
            LDA   L032A
            STA   $00
            LDA   L032C
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L032E
            LDY   #$0002
            LDA   [$00],Y
            STA   L0330
            LDA   L032E
            BNE   L0B5F
            LDA   L0330
            BNE   L0B5F
            JMP   L0B60
L0B5F       RTS

L0B60       LDA   L032C
            PHA
            LDA   L032A
            PHA
            _RestoreHandle
            JSR   L0B00
            LDA   #$8000
            STA   L0507
            JMP   L0B32

            LDA   #$0000
            STA   L0356+2
            LDA   #$8000
            STA   L0356
            LDA   #$00E1
            STA   L0352+2
            LDA   #$2000
            STA   L0352
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            JSR   L0B00
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L035E
            JSR   L0B00
            RTS

            LDA   #$0000
            STA   L0356+2
            LDA   #$8000
            STA   L0356
            LDA   L0459
            STA   L032A
            LDA   L045B
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L0352
            LDA   L0330
            STA   L0352+2
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HLock
            JSR   L0B00
            LDA   L0352
            STA   L045D
            LDA   L0352+2
            STA   L045F
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            JSR   L0B00
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L035E
            JSR   L0B00
            RTS

            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L04AC
            STA   L032A
            LDA   L04AE
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L0489
            LDA   L0330
            STA   L048B
            LDA   L0489
            STA   L038E
            LDA   L048B
            STA   L038E+2
            LDA   #$0000
            STA   L0392+2
            LDA   #$A000
            STA   L0392
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L038C
            JSR   L0B00
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L039A
            JSR   L0B00
            LDA   L0396
            STA   L048D
            LDA   #$0000
            STA   L0477
            LDX   #$0008
L0C75       LSR   L048D
            BCC   L0C80
            LDA   #$0001
            STA   L0477
L0C80       DEX
            BNE   L0C75
            LDA   L048D
            CLC
            ADC   L0477
            STA   L048D
            RTS

            LDA   #$00E1
            STA   L0473
            LDA   #$2000
            STA   L0471
            LDA   #$8000
            STA   L0475
L0CA0       PEA   $0000
            LDA   L045F
            PHA
            LDA   L045D
            PHA
            LDA   L035A
            PHA
            LDA   #^L0471
            PHA
            LDA   #L0471
            PHA
            LDA   #^L0475
            PHA
            LDA   #L0475
            PHA
            _UnPackBytes
            PLA
            LDA   L0475
            BNE   L0CA0
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HUnlock
            JSR   L0B00
            RTS

L0CDF       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L0CDF
L0CF2       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L0CF2
            RTS

L0D06       _GrafOff
            _HideCursor
            RTS

L0D15       _GrafOn
            RTS

L0D1D       PEA   $0000
            PEA   $FFFF
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _GetNextEvent
            PLA
            BEQ   L0D4E
            LDA   L04B0
            CMP   #$0003
            BNE   L0D46
L0D3D       LDA   #$0080
            STA   L0477
            JMP   L0D4E

L0D46       CMP   #$0001
            BNE   L0D4E
            JMP   L0D3D
L0D4E       RTS

L0D4F       LDA   L0479
            STA   L0D69
            STZ   L0477
L0D58       JSR   L0D1D
            LDA   L0477
            CMP   #$0000
            BNE   L0D68
            DEC   L0D69
            BNE   L0D58
L0D68       RTS

L0D69       DW    $0000
            STZ   L0477
L0D6E       JSR   L0D1D
            LDA   L0477
            CMP   #$0000
            BEQ   L0D6E
            RTS

L0D7A       PEA   $0000
            PEA   $FFFF
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _GetNextEvent
            PLA
            BEQ   L0D7A
            LDA   L04B0
            CMP   #$0003
            BNE   L0D7A
            LDA   L04B2
            AND   #$007F
            CMP   #$0061
            BCC   L0DA9
            SEC
            SBC   #$0020
L0DA9       CMP   L04CC
            BNE   L0D7A
            RTS

            PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L0A59
            PHA
            LDA   #L0A59
            PHA
            _SetColorTable
            RTS

L0DD7       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L0A79
            PHA
            LDA   #L0A79
            PHA
            _SetColorTable
            RTS

            PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L0A99
            PHA
            LDA   #L0A99
            PHA
            _SetColorTable
            RTS
            JMP   L0E2C

L0E2A       DW    $0000
L0E2C       LDA   L0503
            STA   L0E2A
L0E32       LDA   L0E2A
            CMP   #$00C8
            BCS   L0E4C
            PHA
            LDA   #$0001
            PHA
            _SetSCB
            INC   L0E2A
            JMP   L0E32

L0E4C       PEA   $0001
            LDA   #^L0A79
            PHA
            LDA   #L0A79
            PHA
            _SetColorTable
            RTS

L0E5F       LDA   #^L04CE
            PHA
            LDA   #L04CE
            PHA
            LDA   L04EB
            PHA
            LDA   L04E9
            PHA
            LDA   L04ED
            PHA
            LDA   L04E7
            PHA
            _SetRect
            RTS

            LDA   #^L04CE
            PHA
            LDA   #L04CE
            PHA
            _FrameRect
            RTS

L0E8F       LDA   #^L04CE
            PHA
            LDA   #L04CE
            PHA
            _PaintRect
            RTS

L0E9F       _PenNormal
            RTS

L0EA7       LDA   L0501
            PHA
            _SetSolidPenPat
            RTS

L0EB3       PEA   $0000
            PEA   $FFFF
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _GetNextEvent
            PLA
            BEQ   L0EB3
            LDA   L04B0
            CMP   #$0003
            BEQ   L0ED6
            JMP   L0F24

L0ED6       LDA   L04B2
            AND   #$007F
            CMP   #$0061
            BCC   L0EE5
            SEC
            SBC   #$0020
L0EE5       STA   L04CC
            _ObscureCursor
            LDA   #$0000
            STA   L0505
            LDA   #$0001
            STA   L0FAF
            LDA   #$0000
            STA   L0FAD
L0F01       LDX   L0FAD
            LDA   L0564,X
            CMP   L04CC
            BNE   L0F0D
            RTS

L0F0D       LDA   L0FAF
            CMP   L0562
            BEQ   L0F21
            INC   L0FAF
            INC   L0FAD
            INC   L0FAD
            JMP   L0F01
L0F21       JMP   L0EB3

L0F24       CMP   #$0001
            BEQ   L0F2C
            JMP   L0EB3

L0F2C       LDA   L04BA
            STA   L04C8
            LDA   L04BC
            STA   L04CA
            LDA   #$0080
            STA   L0505
            LDA   #$0000
            STA   L0FAB
            STA   L0FAD
            LDA   #$0001
            STA   L0FAF
L0F4D       LDY   #$0000
            LDX   L0FAB
L0F53       LDA   L0509,X
            STA   L0559,Y
            INX
            INY
            CPY   #$0008
            BCC   L0F53
            PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L0559
            PHA
            LDA   #L0559
            PHA
            _PtInRect
            PLA
            BEQ   L0F80
            JMP   L0FA1

L0F80       LDA   L0FAF
            CMP   L0562
            BNE   L0F8B
            JMP   L0EB3

L0F8B       INC   L0FAF
            INC   L0FAD
            INC   L0FAD
            LDA   L0FAB
            CLC
            ADC   #$0008
            STA   L0FAB
            JMP   L0F4D

L0FA1       LDX   L0FAD
            LDA   L0564,X
            STA   L04CC
            RTS

L0FAB       DW    $0000
L0FAD       DW    $0000
L0FAF       DW    $0000
L0FB1       LDA   L047F
            PHA
            LDA   L0481
            PHA
            _MoveTo
            LDA   L0485
            PHA
            LDA   L0483
            PHA
            _DrawString
            LDA   L0481
            CLC
            ADC   L0487
            STA   L0481
            RTS

            LDA   L0485
            PHA
            LDA   L0483
            PHA
            _DrawString
            RTS

            PHA
            LDA   L0485
            PHA
            LDA   L0483
            PHA
            _StringWidth
            PLA
            STA   L100C
            LDA   #$0140
            SEC
            SBC   L100C
            LSR
            STA   L047F
            JMP   L0FB1

L100C       DW    $0000
            CLC
            LDA   #$00B5
            STA   L04E9
            LDA   #$001A
            STA   L04EB
            LDA   #$00C2
            ADC   #$0001
            STA   L04E7
            LDA   #$00B4
            ADC   #$0001
            STA   L04ED
            LDA   #$000E
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            LDX   #$0000
L1042       LDA   L04CE,X
            STA   L04D7,X
            INX
            INX
            CPX   #$0008
            BNE   L1042
            CLC
            LDA   #$00B5
            STA   L04E9
            LDA   #$00D0
            STA   L04EB
            LDA   #$00C2
            ADC   #$0001
            STA   L04E7
            LDA   #$0124
            ADC   #$0001
            STA   L04ED
            LDA   #$000D
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            LDX   #$0000
L1083       LDA   L04CE,X
            STA   L04DF,X
            INX
            INX
            CPX   #$0008
            BNE   L1083
            PEA   $0000
            _GetForeColor
            PLA
            STA   L11BD
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L10C1

	DO	VF
L10AC       STR   'Espace pour continuer'
L10C1       PEA   $001A
	ELSE
L10AC       STR   'Spacebar to continue'
L10C1       PEA   $001E
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L10AC
            PHA
            LDA   #L10AC
            PHA
            _DrawString
            JMP   L10EC

	DO	VF
L10E0       STR   'ESC pour quitter'
L10EC       PEA   $00C2
	ELSE
L10E0       STR   'ESC to quit'
L10EC       PEA   $00D6
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L10E0
            PHA
            LDA   #L10E0
            PHA
            _DrawString
L1108       PEA   $0000
            PEA   $FFFF
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _GetNextEvent
            PLA
            BEQ   L1108
            LDA   L04B0
            CMP   #$0003
            BEQ   L112B
            JMP   L115A

L112B       _ObscureCursor
            LDA   #$0000
            STA   L0505
            LDA   L04B2
            AND   #$007F
            CMP   #$0020
            BEQ   L114B
            CMP   #$001B
            BEQ   L114B
            JMP   L1108

L114B       STA   L04CC
            LDA   L11BD
            PHA
            _SetForeColor
            RTS

L115A       CMP   #$0001
            BEQ   L1162
            JMP   L1108

L1162       LDA   L04BA
            STA   L04C8
            LDA   L04BC
            STA   L04CA
            LDA   #$0080
            STA   L0505
            PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L04D7
            PHA
            LDA   #L04D7
            PHA
            _PtInRect
            PLA
            BEQ   L1197
            LDA   #$0020
            JMP   L114B

L1197       PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L04DF
            PHA
            LDA   #L04DF
            PHA
            _PtInRect
            PLA
            BEQ   L11BA
            LDA   #$001B
            JMP   L114B
L11BA       JMP   L1108

L11BD       DW    $0000
L11BF       JSR   L0D06
            JSR   L0DD7
            JMP   L11CA

L11C8       DW    $0000
L11CA       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L11C8
            ASL
            ASL
            ASL
            ASL
            ORA   L11C8
            STA   L11C8
            LDAL  $E0C022
            AND   #$FF00
            ORA   L11C8
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L04E9
            LDA   #$003F
            STA   L04EB
            LDA   #$007E
            ADC   #$0001
            STA   L04E7
            LDA   #$00F8
            ADC   #$0001
            STA   L04ED
            LDA   #$000A
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            CLC
            LDA   #$0041
            STA   L04E9
            LDA   #$0044
            STA   L04EB
            LDA   #$007A
            ADC   #$0001
            STA   L04E7
            LDA   #$00F3
            ADC   #$0001
            STA   L04ED
            LDA   #$000C
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            CLC
            LDA   #$0060
            STA   L04E9
            LDA   #$004E
            STA   L04EB
            LDA   #$0072
            ADC   #$0001
            STA   L04E7
            LDA   #$00E9
            ADC   #$0001
            STA   L04ED
            LDA   #$000B
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            CLC
            LDA   #$0063
            STA   L04E9
            LDA   #$0053
            STA   L04EB
            LDA   #$006F
            ADC   #$0001
            STA   L04E7
            LDA   #$0060
            ADC   #$0001
            STA   L04ED
            LDA   #$000E
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            LDX   #$0000
L12BD       LDA   L04CE,X
            STA   L04DF,X
            INX
            INX
            CPX   #$0008
            BNE   L12BD
            CLC
            LDA   #$0063
            STA   L04E9
            LDA   #$00C6
            STA   L04EB
            LDA   #$006F
            ADC   #$0001
            STA   L04E7
            LDA   #$00D3
            ADC   #$0001
            STA   L04ED
            LDA   #$000D
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            LDX   #$0000
L12FE       LDA   L04CE,X
            STA   L04D7,X
            INX
            INX
            CPX   #$0008
            BNE   L12FE
            PEA   $0000
            _GetForeColor
            PLA
            STA   L14E7
            PEA   $0000
            _SetForeColor
            JMP   L1337

	DO	VF
L1326       STR   'Veux-tu vraiment'
	ELSE
L1326       STR   'Are you sure you'
	FIN
L1337       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L1326
            PHA
            LDA   #L1326
            PHA
            _DrawString
            JMP   L1364

	DO	VF
L1356       STR   'quitter le jeu ?'
L1364       PEA   $0058
	ELSE
L1356       STR   'want to quit?'
L1364       PEA   $0064
	FIN
            PEA   $0059
            _MoveTo
            LDA   #^L1356
            PHA
            LDA   #L1356
            PHA
            _DrawString
            JMP   L1387

	DO	VF
L1383       STR   'ui'
	ELSE
L1383       STR   'es'
	FIN
L1387       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L1383
            PHA
            LDA   #L1383
            PHA
            _DrawString
            JMP   L13A9

	DO	VF
L13A6       STR   'on'
	ELSE
L13A6       STR   'o'
	FIN
L13A9       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L13A6
            PHA
            LDA   #L13A6
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L13D4

	DO	VF
L13D2       STR   'O'
	ELSE
L13D2       STR   'Y'
	FIN
L13D4       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L13D2
            PHA
            LDA   #L13D2
            PHA
            _DrawString
            JMP   L13F5

L13F3       STR   'N'
L13F5       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L13F3
            PHA
            LDA   #L13F3
            PHA
            _DrawString
            JSR   L0D15
            _InitCursor
            _ObscureCursor
L1422       PEA   $0000
            PEA   $FFFF
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _GetNextEvent
            PLA
            BEQ   L1422
            LDA   L04B0
            CMP   #$0003
            BEQ   L1445
            JMP   L1484

L1445       _ObscureCursor
            LDA   #$0000
            STA   L0505
            LDA   L04B2
            AND   #$007F
            CMP   #$0061
            BCC   L1461
            SEC
            SBC   #$0020
	DO	VF
L1461       CMP   #'O'
	ELSE
L1461       CMP   #'Y'
	FIN
            BEQ   L146E
            CMP   #$004E
            BEQ   L146E
            JMP   L1422

L146E       STA   L04CC
            LDA   L14E7
            PHA
            _SetForeColor
            _HideCursor
            RTS

L1484       CMP   #$0001
            BEQ   L148C
            JMP   L1422

L148C       LDA   L04BA
            STA   L04C8
            LDA   L04BC
            STA   L04CA
            LDA   #$0080
            STA   L0505
            PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L04D7
            PHA
            LDA   #L04D7
            PHA
            _PtInRect
            PLA
            BEQ   L14C1
            LDA   #$004E
            JMP   L146E

L14C1       PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L04DF
            PHA
            LDA   #L04DF
            PHA
            _PtInRect
            PLA
            BEQ   L14E4
	DO	VF
            LDA   #'O'
	ELSE
            LDA   #'Y'
	FIN
            JMP   L146E
L14E4       JMP   L1422

L14E7       DW    $0000
L14E9       JSR   L0D06
            JSR   L0DD7
            CLC
            LDA   #$0037
            STA   L04E9
            LDA   #$003B
            STA   L04EB
            LDA   #$0089
            ADC   #$0001
            STA   L04E7
            LDA   #$0104
            ADC   #$0001
            STA   L04ED
            LDA   #$000B
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            CLC
            LDA   #$003F
            STA   L04E9
            LDA   #$0044
            STA   L04EB
            LDA   #$0081
            ADC   #$0001
            STA   L04E7
            LDA   #$00FB
            ADC   #$0001
            STA   L04ED
            LDA   #$000E
            STA   L0501
            JSR   L0E9F
            JSR   L0EA7
            JSR   L0E5F
            JSR   L0E8F
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L1575

	DO	VF
L155F       STR   'Merci d'27'avoir utilis'8e
	ELSE
L155F       STR   'Thank you for running'
	FIN
L1575       PEA   $0055
            PEA   $005A
            _MoveTo
            LDA   #^L155F
            PHA
            LDA   #L155F
            PHA
            _DrawString
            JMP   L15A1

	DO	VF
L1594       STR   'le programme.'
L15A1       PEA   $0076
	ELSE
L1594       STR   'the program.'
L15A1       PEA   $007A
	FIN
            PEA   $006E
            _MoveTo
            LDA   #^L1594
            PHA
            LDA   #L1594
            PHA
            _DrawString
            JSR   L0D15
            _HideCursor
            LDA   #$2000
            STA   L0479
            JSR   L1A8E
            STZ   L0477
            JSR   L0D4F
            JSR   L1A9E
            JSR   L15EC
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L15E6
L15E6       ADRL  $00000000   ;  path name
            DW    $0000       ;  flags
L15EC       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L0342
            PHA
            _DisposeAll
            JSR   L0B00
            LDA   L0340
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L1637       LDA   L0459
            STA   L032A
            LDA   L045B
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L045D
            LDA   L0330
            STA   L045F
            PEA   $0000
            LDA   #^L0469
            PHA
            LDA   #L0469
            PHA
            LDA   #^L046D
            PHA
            LDA   #L046D
            PHA
            LDA   L045F
            PHA
            LDA   L045D
            PHA
            LDA   L046F
            PHA
            _PackBytes
            PLA
            STA   L03B4
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L03AE
            JSR   L0B00
            LDA   L046D
            BNE   L1637
            RTS

L168F       _HideCursor
            LDA   L0459
            STA   L032A
            LDA   L045B
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L045D
            LDA   L0330
            STA   L045F
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HLock
            JSR   L0B00
            PEA   $00E1
            PEA   $2000
            LDA   L045F
            PHA
            LDA   L045D
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

L16DF       _HideCursor
            LDA   L045F
            PHA
            LDA   L045D
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HUnlock
            JSR   L0B00
            RTS

            _HideCursor
            LDA   #^L0634
            PHA
            LDA   #L0634
            PHA
            _PaintPixels
            JSR   L0B00
            RTS

            _HideCursor
            LDA   #^L0666
            PHA
            LDA   #L0666
            PHA
            _PaintPixels
            JSR   L0B00
            RTS

            LDA   L0459
            STA   L032A
            LDA   L045B
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L045D
            LDA   L0330
            STA   L045F
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HLock
            JSR   L0B00
            PEA   $00E1
            PEA   $2000
            LDA   L045F
            PHA
            LDA   L045D
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

            LDA   L045F
            PHA
            LDA   L045D
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HUnlock
            JSR   L0B00
            RTS

            _HideCursor
            LDA   L05C4
            STA   L032A
            LDA   L05C4+2
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L05B6
            LDA   L0330
            STA   L05B6+2
            LDA   #^L0578
            PHA
            LDA   #L0578
            PHA
            _PaintPixels
            JSR   L0B00
            _InitCursor
            RTS

L17FB       _HideCursor
            LDA   L05C4
            STA   L032A
            LDA   L05C4+2
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L05B6
            LDA   L0330
            STA   L05B6+2
            LDA   #^L05F0
            PHA
            LDA   #L05F0
            PHA
            _PaintPixels
            JSR   L0B00
            RTS

            LDA   #^L0688
            STA   L0352+2
            LDA   #L0688
            STA   L0352
            LDA   #$0000
            STA   L0356+2
            LDA   #$0006
            STA   L0356
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            LDA   L0459
            STA   L032A
            LDA   L045B
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L045D
            LDA   L0330
            STA   L045F
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HLock
            JSR   L0B00
            LDA   L045D
            STA   L0352
            LDA   L045F
            STA   L0352+2
            LDA   #$8000
            STA   L0356
            LDA   #$0000
            STA   L0356+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L035E
            LDA   #$0028
            STA   L0481
            LDA   L05C4
            STA   L032A
            LDA   L05C4+2
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L05B6
            LDA   L0330
            STA   L05B6+2
            LDA   L05B6
            STA   L0471
            LDA   L05B6+2
            STA   L0473
            LDA   L0688
            STA   L0475
L18DE       PHA
            LDA   L045F
            PHA
            LDA   L045D
            PHA
            LDA   L035A
            PHA
            LDA   #^L0471
            PHA
            LDA   #L0471
            PHA
            LDA   #^L0475
            PHA
            LDA   #L0475
            PHA
            _UnPackBytes
            PLA
            LDA   L0475
            BNE   L18DE
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HUnlock
            JSR   L0B00
            RTS

            LDA   #$0000
            STA   L05BC
            STA   L05BE
            STA   L061C
            STA   L061E
            LDA   L068A
            STA   L05C0
            STA   L0620
            LDA   L068C
            STA   L05C2
            STA   L0622
            LSR
            CLC
            ADC   #$0001
            STA   L05BA
            _HideCursor
            JSR   L17FB
            RTS

            LDA   L0483
            STA   $00
            LDA   L0485
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L033E
            LDA   #$0001
            STA   L19D0
            PHA
            LDA   L0485
            PHA
            LDA   L0483
            PHA
            _StringWidth
            PLA
            STA   L19D2
            LDA   #$0140
            SEC
            SBC   L19D2
            LSR
            PHA
            LDA   L0481
            PHA
            _MoveTo
L1992       LDA   L0483
            STA   $00
            LDA   L0485
            STA   $02
            LDY   L19D0
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0061
            BCC   L19AD
            SEC
            SBC   #$0020
L19AD       STA   L04CC
            JSR   L0D7A
            LDA   L04CC
            PHA
            _DrawChar
            INC   L19D0
            DEC   L033E
            BNE   L1992
            LDA   #$000D
            STA   L04CC
            JSR   L0D7A
            RTS

L19D0       DW    $0000
L19D2       DW    $0000
            LDA   #^L0559
            PHA
            LDA   #L0559
            PHA
            LDA   L047B
            PHA
            LDA   L047D
            PHA
            LDA   L047B
            CLC
            ADC   #$0079
            PHA
            LDA   L047D
            CLC
            ADC   #$001A
            PHA
            _SetRect
            LDA   #$000F
            STA   L0501
            LDA   #$0001
            PHA
            _SetForeColor
            JSR   L0E9F
            JSR   L0EA7
            LDA   #^L0559
            PHA
            LDA   #L0559
            PHA
            _PaintRect
            LDA   L047B
            CLC
            ADC   #$0004
            STA   L047F
            LDA   L047D
            CLC
            ADC   #$000B
            STA   L0481
            JMP   L1A48

	DO	VF
L1A38       STR   'Clique sur la souris'
	ELSE
L1A38       STR   'Click the mouse'
	FIN
L1A48       LDA   #^L1A38
            STA   L0485
            LDA   #L1A38
            STA   L0483
            JSR   L0FB1
            LDA   L047B
            CLC
            ADC   #$0014
            STA   L047F
            LDA   L047D
            CLC
            ADC   #$0013
            STA   L0481
            JMP   L1A7B

	DO	VF
L1A6E       STR   'pour continuer.'
	ELSE
L1A6E       STR   'to continue.'
	FIN
L1A7B       LDA   #^L1A6E
            STA   L0485
            LDA   #L1A6E
            STA   L0483
            JSR   L0FB1
            JSR   L0CDF
            RTS

L1A8E       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L1A9E       LDA   #$001A
            JSR   L1AEF
            AND   #$000F
            LDX   #$0003
L1AAA       ASL
            DEX
            BPL   L1AAA
            STA   L1AEB
            LDA   #$001B
            JSR   L1AEF
            AND   #$000F
            ORA   L1AEB
            STA   L1AED
            LDA   #$001C
            JSR   L1AEF
            AND   #$000F
            STA   L1AE9
            LDAL  $E0C022
            AND   #$FF00
            ORA   L1AED
            STAL  $E0C022
            LDAL  $E0C034
            AND   #$FFF0
            ORA   L1AE9
            STAL  $E0C034
            RTS

L1AE9       DW    $0000
L1AEB       DW    $0000
L1AED       DW    $0000
L1AEF       PHA
            PHA
            _ReadBParam
            PLA
            RTS

            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            _ReadTimeHex
            PLA
            STA   L1B22
            PLA
            STA   L1B24
            PLA
            PLA
            LDA   L1B24
            PHA
            LDA   L1B22
            PHA
            _SetRandSeed
            RTS

L1B22       DW    $0000
L1B24       DW    $0000
            PEA   $0000
            _Random
            PLA
            STA   L1B7D
            PEA   $0000
            PEA   $0000
            LDA   L033C
            PHA
            LDA   L1B7D
            PHA
            _Multiply
            PLA
            STA   L1B7F
            PLA
            STA   L1B81
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDA   L1B81
            PHA
            LDA   L1B7F
            PHA
            LDA   #$0001
            PHA
            LDA   #$0000
            PHA
            _LongDivide
            JSR   L0B00
            PLA
            STA   L1B7D
            PLA
            PLA
            PLA
            LDA   L1B7D
            RTS

L1B7D       DW    $0000
L1B7F       DW    $0000
L1B81       DW    $0000
L1B83       LDA   L1CD1
            ASL
            CLC
            ADC   #$0001
            STA   L1CD3
            ADC   #$0001
            STA   L1CD5
            LDA   #$0000
            STA   L1CD7
            LDA   #$0FFF
            STA   L1CD9
            LDA   #$0000
            PHA
            LDA   L1CD3
            PHA
            LDA   L1CD7
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   #$0000
            PHA
            LDA   L1CD5
            PHA
            LDA   L1CD9
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   #$000F
            STA   L033E
L1BD2       LDA   L1CD7
            CLC
            ADC   #$0111
            STA   L1CD7
            LDA   L1CD9
            SEC
            SBC   #$0111
            STA   L1CD9
            LDA   #$0000
            PHA
            LDA   L1CD3
            PHA
            LDA   L1CD7
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   #$0000
            PHA
            LDA   L1CD5
            PHA
            LDA   L1CD9
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   L1CDB
            STA   L0479
            STZ   L0477
            JSR   L0D4F
            DEC   L033E
            LDA   L033E
            BEQ   L1C29
            JMP   L1BD2
L1C29       RTS

L1C2A       LDA   L1CD1
            ASL
            CLC
            ADC   #$0001
            STA   L1CD3
            ADC   #$0001
            STA   L1CD5
            LDA   #$0FFF
            STA   L1CD7
            LDA   #$0000
            STA   L1CD9
            LDA   #$0000
            PHA
            LDA   L1CD3
            PHA
            LDA   L1CD7
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   #$0000
            PHA
            LDA   L1CD5
            PHA
            LDA   L1CD9
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   #$000F
            STA   L033E
L1C79       LDA   L1CD7
            SEC
            SBC   #$0111
            STA   L1CD7
            LDA   L1CD9
            CLC
            ADC   #$0111
            STA   L1CD9
            LDA   #$0000
            PHA
            LDA   L1CD3
            PHA
            LDA   L1CD7
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   #$0000
            PHA
            LDA   L1CD5
            PHA
            LDA   L1CD9
            PHA
            _SetColorEntry
            JSR   L0B00
            LDA   L1CDB
            STA   L0479
            STZ   L0477
            JSR   L0D4F
            DEC   L033E
            LDA   L033E
            BEQ   L1CD0
            JMP   L1C79
L1CD0       RTS

L1CD1       DW    $0000
L1CD3       DW    $0000
L1CD5       DW    $0000
L1CD7       DW    $0000
L1CD9       DW    $0000
L1CDB       DW    $000A
L1CDD       PHA
            PEA   $FFFF
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _GetNextEvent
            PLA
            BEQ   L1CDD
            LDA   L04B0
            CMP   #$0003
            BEQ   L1CFE
            JMP   L1D1C

L1CFE       _ObscureCursor
            LDA   L04B2
            AND   #$007F
            CMP   #$0020
            BEQ   L1D18
            CMP   #$000D
            BEQ   L1D18
            JMP   L1CDD

L1D18       STA   L04CC
            RTS

L1D1C       CMP   #$0001
            BEQ   L1D24
            JMP   L1CDD

L1D24       LDA   L04BA
            STA   L04C8
            LDA   L04BC
            STA   L04CA
            PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L0509
            PHA
            LDA   #L0509
            PHA
            _PtInRect
            PLA
            BEQ   L1D54
            LDA   #$0041
L1D50       STA   L04CC
            RTS

L1D54       PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L0511
            PHA
            LDA   #L0511
            PHA
            _PtInRect
            PLA
            BEQ   L1D77
            LDA   #$0042
            JMP   L1D50

L1D77       PEA   $0000
            LDA   #^L04C8
            PHA
            LDA   #L04C8
            PHA
            LDA   #^L0519
            PHA
            LDA   #L0519
            PHA
            _PtInRect
            PLA
            BEQ   L1D9A
            LDA   #$0043
            JMP   L1D50
L1D9A       JMP   L1CDD

            PEA   $0003
            _IntSource
            PHA
            PHA
            PEA   $000C
            _GetVector
            PLA
            STA   L21E1
            PLA
            STA   L21E1+2
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0B00
            PLA
            AND   #$000F
            PHA
            LDA   #^L220D
            PHA
            LDA   #L220D
            PHA
            _GetColorTable
            JSR   L0B00
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0B00
            PLA
            AND   #$000F
            PHA
            LDA   #^L222D
            PHA
            LDA   #L222D
            PHA
            _GetColorTable
            JSR   L0B00
            PEA   $000C
            LDA   #^L1E5E
            PHA
            LDA   #L1E5E
            PHA
            _SetVector
            PEA   $0002
            _IntSource
            RTS

            PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L220D
            PHA
            LDA   #L220D
            PHA
            _SetColorTable
            JSR   L0B00
            PEA   $000C
            LDA   L21E1+2
            PHA
            LDA   L21E1
            PHA
            _SetVector
            PEA   $0002
            _IntSource
            RTS

L1E5E       PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L1F2B
L1E67       JSR   L1EA9
            INC   L1F2B
            INC   L1F2B
            LDA   L1F2B
            CMP   #$0008
            BCC   L1E67
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0B00
            PLA
            AND   #$000F
            PHA
            LDA   #^L222D
            PHA
            LDA   #L222D
            PHA
            _SetColorTable
            JSR   L0B00
            SEP   #$30
            LDA   #$00
            STAL  $E0C047
            PLA
            PLB
            CLC
            RTL

            MX    %00
L1EA9       LDX   L1F2B
            DEC   L1F23,X
            BEQ   L1EB2
            RTS

L1EB2       LDA   L21ED,X
            STA   L1F23,X
            LDA   L21F5,X
            STA   L1F1F
            LDA   L2205,X
            STA   L1F21
L1EC4       LDA   L1F21
            CMP   L21FD,X
            BCC   L1ED4
            BEQ   L1ED4
            LDA   L21F5,X
            STA   L1F21
L1ED4       LDY   L1F1F
            LDA   L220D,Y
            LDY   L1F21
            STA   L222D,Y
            INC   L1F21
            INC   L1F21
            INC   L1F1F
            INC   L1F1F
            LDA   L1F1F
            CMP   L21FD,X
            BCC   L1EC4
            BEQ   L1EC4
            LDA   L2205,X
            CLC
            ADC   L21E5,X
            STA   L2205,X
            CMP   #$8000
            BCS   L1F0A
            CMP   L21F5,X
            BCS   L1F11
L1F0A       LDA   L21FD,X
            STA   L2205,X
            RTS

L1F11       CMP   L21FD,X
            BCC   L1F1E
            BEQ   L1F1E
            LDA   L21F5,X
            STA   L2205,X
L1F1E       RTS

L1F1F       DW    $0000
L1F21       DW    $0000
L1F23       DW    $0001
            DW    $0001
            DW    $0001
            DW    $0001
L1F2B       DW    $0000
L1F2D       PHA
            PEA   $0064
            _GetSCB
            JSR   L0B00
            PLA
            AND   #$000F
            STA   L209B
            LDA   L209B
            PHA
            LDA   #^L209D
            PHA
            LDA   #L209D
            PHA
            _GetColorTable
            JSR   L0B00
            PEA   $0001
            LDA   #^L209D
            PHA
            LDA   #L209D
            PHA
            _SetColorTable
            JSR   L0B00
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L0342
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0B00
            PLA
            STA   $00
            STA   L224D
            PLA
            STA   $02
            STA   L224F
            LDY   #$0000
            LDA   [$00],Y
            STA   L2251
            LDY   #$0002
            LDA   [$00],Y
            STA   L2253
            LDA   #^L225B
            STA   L0352+2
            LDA   #L225B
            STA   L0352
            LDA   #$000F
            STA   L0356
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            LDA   #$00E1
            STA   L0352+2
            LDA   #$9E00
            STA   L0352
            PHA
            PHA
            LDA   L2268
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L0356
            PLA
            STA   L0356+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            LDA   #^L226A
            STA   L0352+2
            LDA   #L226A
            STA   L0352
            LDA   #$0002
            STA   L0356
            LDA   #$0000
            STA   L0356+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            LDA   L2251
            STA   L0352
            LDA   L2253
            STA   L0352+2
            LDA   #$0320
            STA   L0356
            LDA   #$0000
            STA   L0356+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            LDA   L0459
            STA   L032A
            LDA   L045B
            STA   L032C
            JSR   L0B32
            LDA   L032E
            STA   L045D
            LDA   L0330
            STA   L045F
            LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HLock
            JSR   L0B00
            LDA   L045D
            STA   L0352
            LDA   L045F
            STA   L0352+2
            LDA   #$8000
            STA   L0356
            LDA   #$0000
            STA   L0356+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0350
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L035E
            RTS

L209B       DW    $0000
L209D       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L20BD       LDA   #$00E1
            STA   L0352+2
            LDA   #$2000
            STA   L0352
            LDA   L045D
            STA   L2255
            LDA   L045F
            STA   L2257
            LDA   #$00C8
            STA   L033E
            LDA   #$0000
            STA   L0477
L20E1       LDA   #$0000
            STA   L2259
            LDA   #$00A0
            STA   L0475
L20ED       PHA
            LDA   L2257
            PHA
            LDA   L2255
            PHA
            LDA   L2251
            STA   $00
            LDA   L2253
            STA   $02
            LDA   L0477
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L0352
            PHA
            LDA   #L0352
            PHA
            LDA   #^L0475
            PHA
            LDA   #L0475
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L2259
            STA   L2259
            LDA   L0475
            BNE   L20ED
            LDA   L2255
            CLC
            ADC   L2259
            STA   L2255
            LDA   L2257
            ADC   #$0000
            STA   L2257
            LDA   L0477
            PHA
            PEA   $0000
            _SetSCB
            JSR   L0B00
            INC   L0477
            DEC   L033E
            BEQ   L215C
            JMP   L20E1

L215C       LDA   L224F
            PHA
            LDA   L224D
            PHA
            _DisposeHandle
            JSR   L0B00
            LDA   L2255
            CLC
            ADC   #$0009
            STA   L2255
            LDA   L2257
            ADC   #$0000
            STA   L2257
            LDX   #$0000
L2184       LDA   L2255
            STA   $00
            LDA   L2257
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L219B
            LDA   #$FFFE
            JMP   L219E

L219B       LDA   #$0002
L219E       STA   L21E5,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L21F5,X
            STA   L2205,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L21FD,X
            LDA   L2255
            CLC
            ADC   #$0008
            STA   L2255
            INX
            INX
            CPX   #$0008
            BCS   L21CE
            JMP   L2184

L21CE       LDA   L045B
            PHA
            LDA   L0459
            PHA
            _HUnlock
            JSR   L0B00
            RTS

L21E1       ADRL  $00000000
L21E5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L21ED       DB    $05
            DB    $00
            DB    $05
            DB    $00
            DB    $05
            DB    $00
            DB    $05
            DB    $00
L21F5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L21FD       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2205       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L220D       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L222D       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L224D       DB    $00
            DB    $00
L224F       DB    $00
            DB    $00
L2251       DB    $00
            DB    $00
L2253       DB    $00
            DB    $00
L2255       DB    $00
            DB    $00
L2257       DB    $00
            DB    $00
L2259       DB    $00
            DB    $00
L225B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2268       DB    $00
            DB    $00
L226A       DB    $00
            DB    $00

