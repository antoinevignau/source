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
            STA   L0286
            JSR   L0A46
            LDA   L0286
            AND   #$F0FF
            ORA   #$0100
            STA   L0288
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L0288
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0A46
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L028A
            LDA   L028A
            TAY
            CLC
            ADC   #$0100
            STA   L028A
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L0286
            PHA
            _EMStartUp
            JSR   L0A46
            JMP   L008E

L008C       DW    $0000
L008E       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L008C
            ASL
            ASL
            ASL
            ASL
            ORA   L008C
            STA   L008C
            LDAL  $E0C022
            AND   #$FF00
            ORA   L008C
            STAL  $E0C022
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$0001
            STAL  $E0C029
            LDY   L028A
            TYA
            CLC
            ADC   #$0300
            STA   L028A
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0286
            PHA
            _QDStartUp
            JSR   L0A46
            JSR   L0CF5
            _PenNormal
            PEA   $0000
            _SetFontFlags
            PEA   $0004
            _SetTextMode
            PEA   $000F
            _SetForeColor
            PHA
            PHA
            PEA   $0000
            LDA   #$8000
            PHA
            LDA   L0288
            PHA
            PEA   $0108
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0A46
            PLA
            STA   L039F
            PLA
            STA   L039F+2
            LDA   #$8000
            STA   L03B5
            JMP   L0144

L0142       DW    $0000
L0144       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L0142
            ASL
            ASL
            ASL
            ASL
            ORA   L0142
            STA   L0142
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0142
            STAL  $E0C022
            JSR   L1FDC
            JMP   L0185

L0176       STR   'logo'
L017B       DW    $0000       ;  ref num
            ADRL  L0176       ;  path name
            ADRL  $00000000   ;  reserved
L0185       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L017B
            JSR   L0A46
            LDA   L017B
            STA   L0296
            STA   L02A4
            JSR   L1BA0
            JSR   L1D30
            LDA   #$2000
            STA   L03BF
            JSR   L1A00
            STZ   L03BD
            JSR   L0C95
            JMP   L01C3

L01B3       STR   'tpage'
L01B9       DW    $0000       ;  ref num
            ADRL  L01B3       ;  path name
            ADRL  $00000000   ;  reserved
L01C3       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01B9
            JSR   L0A46
            LDA   L01B9
            STA   L0296
            STA   L02A4
            JSR   L1BA0
            JSR   L1D30
            JSR   L1A00
            STZ   L03BD
            JSR   L0C95
            JMP   L01FF

L01EB       STR   'copyright'
L01F5       DW    $0000       ;  ref num
            ADRL  L01EB       ;  path name
            ADRL  $00000000   ;  reserved
L01FF       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01F5
            JSR   L0A46
            LDA   L01F5
            STA   L0296
            STA   L02A4
            JSR   L1BA0
            JMP   L021D

L021B       DW    $0000
L021D       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0008
            STAL  $E0C034
            LDA   #$0008
            STA   L021B
            ASL
            ASL
            ASL
            ASL
            ORA   L021B
            STA   L021B
            LDAL  $E0C022
            AND   #$FF00
            ORA   L021B
            STAL  $E0C022
            JSR   L1D30
            JSR   L1A00
            STZ   L03BD
            JSR   L0C95
            JSR   L1570
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L0262
L0262       ADRL  L0268       ;  path name
            DW    $0000       ;  flags
L0268       STR   'program'
L0270       DB    $00
            DB    $00
L0272       DB    $00
            DB    $00
L0274       DB    $00
            DB    $00
L0276       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0284       DB    $00
            DB    $00
L0286       DB    $00
            DB    $00
L0288       DB    $00
            DB    $00
L028A       DB    $00
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
L0296       DW    $0000       ;  ref num
L0298       ADRL  $00000000   ;  buffer ptr
L029C       ADRL  $00000000   ;  request count
L02A0       ADRL  $00000000   ;  transfer count
L02A4       DW    $0000       ;  ref num
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
            DB    L0318
            DB    $03
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
            ADRL  L0318
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02D2       DW    $0000       ;  ref num
L02D4       ADRL  $00000000   ;  buffer ptr
L02D8       ADRL  $00000000   ;  request count
L02DC       ADRL  $00000000   ;  transfer count
L02E0       DW    $0000       ;  ref num
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DW    $00C3
            DW    $0006
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
L02F4       DW    $0000       ;  ref num
            ADRL  $00000000   ;  buffer ptr
L02FA       ADRL  $00000000   ;  request count
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
L0318       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L039F       ADRL  $00000000
L03A3       ADRL  $00000000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03AF       DB    $00
            DB    $00
            DB    $00
            DB    $00
L03B3       DB    $00
            DB    $00
L03B5       DB    $00
            DB    $00
L03B7       ADRL  $00000000
L03BB       DW    $0000
L03BD       DB    $00
            DB    $00
L03BF       DB    $00
            DB    $00
L03C1       DB    $00
            DB    $00
L03C3       DB    $00
            DB    $00
L03C5       DW    $0000
L03C7       DW    $0000
L03C9       DA    $0000
L03CB       DW    $0000
L03CD       DW    $0009
L03CF       DB    $00
            DB    $00
L03D1       DB    $00
            DB    $00
L03D3       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            ADRL  L03E0
            DB    $FF
L03E0       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03F2       DB    $00
            DB    $00
L03F4       DB    $00
            DB    $00
L03F6       DW    $0000       ; event code
L03F8       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L0400       DW    $0000       ; mouse location
L0402       DW    $0000
            DW    $0000       ; modifiers
            ADRL  $00000000   ; task data
            ADRL  $0000FFFF   ; task mask

L040E       DW    $0000
            DW    $0000
L0412       DW    $0000
L0414       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DB    $00
L041D       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L0425       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L042D       DW    $0000
L042F       DW    $0000
L0431       DW    $0000
L0433       DW    $0000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0447       DB    $00
            DB    $00
L0449       DB    $00
            DB    $00
L044B       DB    $00
            DB    $00
L044D       DB    $00
            DB    $00
L044F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L049F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04A8       DB    $00
            DB    $00
L04AA       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04BE       ADRL  L04EA       ; ptr to source locinfo
            ADRL  L04FA       ; ptr to dest locinfo
            ADRL  L0522       ; ptr to source rect
            ADRL  L051E       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L04D4       ADRL  L04EA       ; ptr to source locinfo
            ADRL  L050E       ; ptr to dest locinfo
            ADRL  L052E       ; ptr to source rect
            ADRL  L052A       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L04EA       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L04FA       DW    $0000       ; SCB byte
L04FC       ADRL  $00000000   ; Pointer to pixel image
L0500       DW    $0010       ; Width
L0502       DW    $0000       ; Bounds rect
L0504       DW    $0000
L0506       DW    $0014
L0508       DW    $0014
L050A       DB    $00
            DB    $00
L050C       DB    $00
            DB    $00
L050E       DW    $0000       ; SCB byte
L0510       ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L051E       DW    $0000
            DW    $0000
L0522       DW    $0000
            DW    $0000
            DW    $0014
            DW    $0014
L052A       DW    $0000
            DW    $0000
L052E       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0536       ADRL  L04FA       ; ptr to source locinfo
            ADRL  L04EA       ; ptr to dest locinfo
            ADRL  L0562       ; ptr to source rect
            ADRL  L056A       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L054C       ADRL  L050E       ; ptr to source locinfo
            ADRL  L04EA       ; ptr to dest locinfo
            ADRL  L056E       ; ptr to source rect
            ADRL  L0576       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0562       DW    $0000
L0564       DW    $0000
L0566       DW    $0014
L0568       DW    $0014
L056A       DW    $0000
            DW    $0000
L056E       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0576       DW    $0000
            DW    $0000
L057A       ADRL  L04EA       ; ptr to source locinfo
            ADRL  L0590       ; ptr to dest locinfo
            ADRL  L05A0       ; ptr to source rect
            ADRL  L05A8       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0590       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L05A0       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L05A8       DW    $0000
            DW    $0000
L05AC       ADRL  L0590       ; ptr to source locinfo
            ADRL  L04EA       ; ptr to dest locinfo
            ADRL  L05C2       ; ptr to source rect
            ADRL  L05CA       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L05C2       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L05CA       DW    $0000
            DW    $0000
L05CE       DB    $00
            DB    $00
L05D0       DB    $00
            DB    $00
L05D2       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
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
L099F       HEX   0000000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L09BF       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L09DF       HEX   0000030D09002D0D720055052F02AF06
            HEX   5008600FAA0A980FD000F00FF902FF0F
            DB    $00
            DB    $00
            ADRL  L0A05
L0A05       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0A46       BCS   L0A49
            RTS

L0A49       PHA
            LDA   #^L0A5A
            PHA
            LDA   #L0A5A
            PHA
            _SysFailMgr
            RTS

	DO	VF
L0A5A       STR   'Erreur applicative ... Oups !'
	ELSE
L0A5A       STR   'Application failure ... Oops!'
	FIN
	
L0A78       LDA   #$0000
            STA   L044D
            LDA   L0270
            STA   $00
            LDA   L0272
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L0274
            LDY   #$0002
            LDA   [$00],Y
            STA   L0276
            LDA   L0274
            BNE   L0AA5
            LDA   L0276
            BNE   L0AA5
            JMP   L0AA6
L0AA5       RTS

L0AA6       LDA   L0272
            PHA
            LDA   L0270
            PHA
            _RestoreHandle
            JSR   L0A46
            LDA   #$8000
            STA   L044D
            JMP   L0A78

            LDA   #$0000
            STA   L029C+2
            LDA   #$8000
            STA   L029C
            LDA   #$00E1
            STA   L0298+2
            LDA   #$2000
            STA   L0298
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            JSR   L0A46
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L02A4
            JSR   L0A46
            RTS

            LDA   #$0000
            STA   L029C+2
            LDA   #$8000
            STA   L029C
            LDA   L039F
            STA   L0270
            LDA   L039F+2
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L0298
            LDA   L0276
            STA   L0298+2
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HLock
            JSR   L0A46
            LDA   L0298
            STA   L03A3
            LDA   L0298+2
            STA   L03A3+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            JSR   L0A46
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L02A4
            JSR   L0A46
            RTS

            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L03F2
            STA   L0270
            LDA   L03F4
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L03CF
            LDA   L0276
            STA   L03D1
            LDA   L03CF
            STA   L02D4
            LDA   L03D1
            STA   L02D4+2
            LDA   #$0000
            STA   L02D8+2
            LDA   #$A000
            STA   L02D8
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L02D2
            JSR   L0A46
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L02E0
            JSR   L0A46
            LDA   L02DC
            STA   L03D3
            LDA   #$0000
            STA   L03BD
            LDX   #$0008
L0BBB       LSR   L03D3
            BCC   L0BC6
            LDA   #$0001
            STA   L03BD
L0BC6       DEX
            BNE   L0BBB
            LDA   L03D3
            CLC
            ADC   L03BD
            STA   L03D3
            RTS

            LDA   #$00E1
            STA   L03B7+2
            LDA   #$2000
            STA   L03B7
            LDA   #$8000
            STA   L03BB
L0BE6       PEA   $0000
            LDA   L03A3+2
            PHA
            LDA   L03A3
            PHA
            LDA   L02A0
            PHA
            LDA   #^L03B7
            PHA
            LDA   #L03B7
            PHA
            LDA   #^L03BB
            PHA
            LDA   #L03BB
            PHA
            _UnPackBytes
            PLA
            LDA   L03BB
            BNE   L0BE6
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HUnlock
            JSR   L0A46
            RTS

L0C25       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L0C25
L0C38       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L0C38
            RTS

L0C4C       _GrafOff
            _HideCursor
            RTS

L0C5B       _GrafOn
            RTS

L0C63       PEA   $0000
            PEA   $FFFF
            LDA   #^L03F6
            PHA
            LDA   #L03F6
            PHA
            _GetNextEvent
            PLA
            BEQ   L0C94
            LDA   L03F6
            CMP   #$0003
            BNE   L0C8C
L0C83       LDA   #$0080
            STA   L03BD
            JMP   L0C94

L0C8C       CMP   #$0001
            BNE   L0C94
            JMP   L0C83
L0C94       RTS

L0C95       LDA   L03BF
            STA   L0CAF
            STZ   L03BD
L0C9E       JSR   L0C63
            LDA   L03BD
            CMP   #$0000
            BNE   L0CAE
            DEC   L0CAF
            BNE   L0C9E
L0CAE       RTS

L0CAF       DW    $0000
            STZ   L03BD
L0CB4       JSR   L0C63
            LDA   L03BD
            CMP   #$0000
            BEQ   L0CB4
            RTS

L0CC0       PEA   $0000
            PEA   $FFFF
            LDA   #^L03F6
            PHA
            LDA   #L03F6
            PHA
            _GetNextEvent
            PLA
            BEQ   L0CC0
            LDA   L03F6
            CMP   #$0003
            BNE   L0CC0
            LDA   L03F8
            AND   #$007F
            CMP   #$0061
            BCC   L0CEF
            SEC
            SBC   #$0020
L0CEF       CMP   L0412
            BNE   L0CC0
            RTS

L0CF5       PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L099F
            PHA
            LDA   #L099F
            PHA
            _SetColorTable
            RTS

L0D1D       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L09BF
            PHA
            LDA   #L09BF
            PHA
            _SetColorTable
            RTS

            PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L09DF
            PHA
            LDA   #L09DF
            PHA
            _SetColorTable
            RTS
            JMP   L0D72

L0D70       DW    $0000
L0D72       LDA   L0449
            STA   L0D70
L0D78       LDA   L0D70
            CMP   #$00C8
            BCS   L0D92
            PHA
            LDA   #$0001
            PHA
            _SetSCB
            INC   L0D70
            JMP   L0D78

L0D92       PEA   $0001
            LDA   #^L09BF
            PHA
            LDA   #L09BF
            PHA
            _SetColorTable
            RTS

L0DA5       LDA   #^L0414
            PHA
            LDA   #L0414
            PHA
            LDA   L0431
            PHA
            LDA   L042F
            PHA
            LDA   L0433
            PHA
            LDA   L042D
            PHA
            _SetRect
            RTS

            LDA   #^L0414
            PHA
            LDA   #L0414
            PHA
            _FrameRect
            RTS

L0DD5       LDA   #^L0414
            PHA
            LDA   #L0414
            PHA
            _PaintRect
            RTS

L0DE5       _PenNormal
            RTS

L0DED       LDA   L0447
            PHA
            _SetSolidPenPat
            RTS

L0DF9       PEA   $0000
            PEA   $FFFF
            LDA   #^L03F6
            PHA
            LDA   #L03F6
            PHA
            _GetNextEvent
            PLA
            BEQ   L0DF9
            LDA   L03F6
            CMP   #$0003
            BEQ   L0E1C
            JMP   L0E6A

L0E1C       LDA   L03F8
            AND   #$007F
            CMP   #$0061
            BCC   L0E2B
            SEC
            SBC   #$0020
L0E2B       STA   L0412
            _ObscureCursor
            LDA   #$0000
            STA   L044B
            LDA   #$0001
            STA   L0EF5
            LDA   #$0000
            STA   L0EF3
L0E47       LDX   L0EF3
            LDA   L04AA,X
            CMP   L0412
            BNE   L0E53
            RTS

L0E53       LDA   L0EF5
            CMP   L04A8
            BEQ   L0E67
            INC   L0EF5
            INC   L0EF3
            INC   L0EF3
            JMP   L0E47
L0E67       JMP   L0DF9

L0E6A       CMP   #$0001
            BEQ   L0E72
            JMP   L0DF9

L0E72       LDA   L0400
            STA   L040E
            LDA   L0402
            STA   L040E+2
            LDA   #$0080
            STA   L044B
            LDA   #$0000
            STA   L0EF1
            STA   L0EF3
            LDA   #$0001
            STA   L0EF5
L0E93       LDY   #$0000
            LDX   L0EF1
L0E99       LDA   L044F,X
            STA   L049F,Y
            INX
            INY
            CPY   #$0008
            BCC   L0E99
            PEA   $0000
            LDA   #^L040E
            PHA
            LDA   #L040E
            PHA
            LDA   #^L049F
            PHA
            LDA   #L049F
            PHA
            _PtInRect
            PLA
            BEQ   L0EC6
            JMP   L0EE7

L0EC6       LDA   L0EF5
            CMP   L04A8
            BNE   L0ED1
            JMP   L0DF9

L0ED1       INC   L0EF5
            INC   L0EF3
            INC   L0EF3
            LDA   L0EF1
            CLC
            ADC   #$0008
            STA   L0EF1
            JMP   L0E93

L0EE7       LDX   L0EF3
            LDA   L04AA,X
            STA   L0412
            RTS

L0EF1       DW    $0000
L0EF3       DW    $0000
L0EF5       DW    $0000

L0EF7       LDA   L03C5
            PHA
            LDA   L03C7
            PHA
            _MoveTo
            LDA   L03CB
            PHA
            LDA   L03C9
            PHA
            _DrawString
            LDA   L03C7
            CLC
            ADC   L03CD
            STA   L03C7
            RTS

            LDA   L03CB
            PHA
            LDA   L03C9
            PHA
            _DrawString
            RTS

            PHA
            LDA   L03CB
            PHA
            LDA   L03C9
            PHA
            _StringWidth
            PLA
            STA   L0F52
            LDA   #$0140
            SEC
            SBC   L0F52
            LSR
            STA   L03C5
            JMP   L0EF7

L0F52       DW    $0000

            CLC
            LDA   #$00B5
            STA   L042F
            LDA   #$001A
            STA   L0431
            LDA   #$00C2
            ADC   #$0001
            STA   L042D
            LDA   #$00B4
            ADC   #$0001
            STA   L0433
            LDA   #$000E
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            LDX   #$0000
L0F88       LDA   L0414,X
            STA   L041D,X
            INX
            INX
            CPX   #$0008
            BNE   L0F88
            CLC
            LDA   #$00B5
            STA   L042F
            LDA   #$00D0
            STA   L0431
            LDA   #$00C2
            ADC   #$0001
            STA   L042D
            LDA   #$0124
            ADC   #$0001
            STA   L0433
            LDA   #$000D
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            LDX   #$0000
L0FC9       LDA   L0414,X
            STA   L0425,X
            INX
            INX
            CPX   #$0008
            BNE   L0FC9
            PEA   $0000
            _GetForeColor
            PLA
            STA   L1103
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L1007

	DO	VF
L0FF2       STR   'Espace pour continuer'
L1007       PEA   $001A
	ELSE
L0FF2       STR   'Spacebar to continue'
L1007       PEA   $001E
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L0FF2
            PHA
            LDA   #L0FF2
            PHA
            _DrawString
            JMP   L1032

	DO	VF
L1026       STR   'ESC pour quitter'
L1032       PEA   $00C2
	ELSE
L1026       STR   'ESC to quit'
L1032       PEA   $00D6
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L1026
            PHA
            LDA   #L1026
            PHA
            _DrawString
L104E       PEA   $0000
            PEA   $FFFF
            LDA   #^L03F6
            PHA
            LDA   #L03F6
            PHA
            _GetNextEvent
            PLA
            BEQ   L104E
            LDA   L03F6
            CMP   #$0003
            BEQ   L1071
            JMP   L10A0

L1071       _ObscureCursor
            LDA   #$0000
            STA   L044B
            LDA   L03F8
            AND   #$007F
            CMP   #$0020
            BEQ   L1091
            CMP   #$001B
            BEQ   L1091
            JMP   L104E

L1091       STA   L0412
            LDA   L1103
            PHA
            _SetForeColor
            RTS

L10A0       CMP   #$0001
            BEQ   L10A8
            JMP   L104E

L10A8       LDA   L0400
            STA   L040E
            LDA   L0402
            STA   L040E+2
            LDA   #$0080
            STA   L044B
            PEA   $0000
            LDA   #^L040E
            PHA
            LDA   #L040E
            PHA
            LDA   #^L041D
            PHA
            LDA   #L041D
            PHA
            _PtInRect
            PLA
            BEQ   L10DD
            LDA   #$0020
            JMP   L1091

L10DD       PEA   $0000
            LDA   #^L040E
            PHA
            LDA   #L040E
            PHA
            LDA   #^L0425
            PHA
            LDA   #L0425
            PHA
            _PtInRect
            PLA
            BEQ   L1100
            LDA   #$001B
            JMP   L1091
L1100       JMP   L104E

L1103       DW    $0000
            JSR   L0C4C
            JSR   L0D1D
            JMP   L1110

L110E       DW    $0000
L1110       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L110E
            ASL
            ASL
            ASL
            ASL
            ORA   L110E
            STA   L110E
            LDAL  $E0C022
            AND   #$FF00
            ORA   L110E
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L042F
            LDA   #$003F
            STA   L0431
            LDA   #$007E
            ADC   #$0001
            STA   L042D
            LDA   #$00F8
            ADC   #$0001
            STA   L0433
            LDA   #$000A
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            CLC
            LDA   #$0041
            STA   L042F
            LDA   #$0044
            STA   L0431
            LDA   #$007A
            ADC   #$0001
            STA   L042D
            LDA   #$00F3
            ADC   #$0001
            STA   L0433
            LDA   #$000C
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            CLC
            LDA   #$0060
            STA   L042F
            LDA   #$004E
            STA   L0431
            LDA   #$0072
            ADC   #$0001
            STA   L042D
            LDA   #$00E9
            ADC   #$0001
            STA   L0433
            LDA   #$000B
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            CLC
            LDA   #$0063
            STA   L042F
            LDA   #$0053
            STA   L0431
            LDA   #$006F
            ADC   #$0001
            STA   L042D
            LDA   #$0060
            ADC   #$0001
            STA   L0433
            LDA   #$000E
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            LDX   #$0000
L1203       LDA   L0414,X
            STA   L0425,X
            INX
            INX
            CPX   #$0008
            BNE   L1203
            CLC
            LDA   #$0063
            STA   L042F
            LDA   #$00C6
            STA   L0431
            LDA   #$006F
            ADC   #$0001
            STA   L042D
            LDA   #$00D3
            ADC   #$0001
            STA   L0433
            LDA   #$000D
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            LDX   #$0000
L1244       LDA   L0414,X
            STA   L041D,X
            INX
            INX
            CPX   #$0008
            BNE   L1244
            PEA   $0000
            _GetForeColor
            PLA
            STA   L1426
            PEA   $0000
            _SetForeColor
            JMP   L127D

	DO	VF
L126C       STR   'Veux-tu vraiment'
	ELSE
L126C       STR   'Are you sure you'
	FIN
L127D       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L126C
            PHA
            LDA   #L126C
            PHA
            _DrawString
            JMP   L12AA

	DO	VF
L129C       STR   'quitter le jeu ?'
L12AA       PEA   $0058
	ELSE
L129C       STR   'want to quit?'
L12AA       PEA   $0064
	FIN
            PEA   $0059
            _MoveTo
            LDA   #^L129C
            PHA
            LDA   #L129C
            PHA
            _DrawString
            JMP   L12CD

	DO	VF
L12C9       STR   'ui'
	ELSE
L12C9       STR   'es'
	FIN
L12CD       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L12C9
            PHA
            LDA   #L12C9
            PHA
            _DrawString
            JMP   L12EF

	DO	VF
L12EC       STR   'on'
	ELSE
L12EC       STR   'o'
	FIN
L12EF       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L12EC
            PHA
            LDA   #L12EC
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L131A

	DO	VF
L1318       STR   'O'
	ELSE
L1318       STR   'Y'
	FIN
L131A       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L1318
            PHA
            LDA   #L1318
            PHA
            _DrawString
            JMP   L133B

	DO	VF
L1339       STR   'N'
	ELSE
L1339       STR   'N'
	FIN
L133B       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L1339
            PHA
            LDA   #L1339
            PHA
            _DrawString
            JSR   L0C5B
            _InitCursor
L1361       PEA   $0000
            PEA   $FFFF
            LDA   #^L03F6
            PHA
            LDA   #L03F6
            PHA
            _GetNextEvent
            PLA
            BEQ   L1361
            LDA   L03F6
            CMP   #$0003
            BEQ   L1384
            JMP   L13C3

L1384       _ObscureCursor
            LDA   #$0000
            STA   L044B
            LDA   L03F8
            AND   #$007F
            CMP   #$0061
            BCC   L13A0
            SEC
            SBC   #$0020
	DO	VF
L13A0       CMP   #'O'
	ELSE
L13A0       CMP   #'Y'	; y
	FIN
            BEQ   L13AD
            CMP   #'N'	; n
            BEQ   L13AD
            JMP   L1361

L13AD       STA   L0412
            LDA   L1426
            PHA
            _SetForeColor
            _HideCursor
            RTS

L13C3       CMP   #$0001
            BEQ   L13CB
            JMP   L1361

L13CB       LDA   L0400
            STA   L040E
            LDA   L0402
            STA   L040E+2
            LDA   #$0080
            STA   L044B
            PEA   $0000
            LDA   #^L040E
            PHA
            LDA   #L040E
            PHA
            LDA   #^L041D
            PHA
            LDA   #L041D
            PHA
            _PtInRect
            PLA
            BEQ   L1400
            LDA   #'N'
            JMP   L13AD

L1400       PEA   $0000
            LDA   #^L040E
            PHA
            LDA   #L040E
            PHA
            LDA   #^L0425
            PHA
            LDA   #L0425
            PHA
            _PtInRect
            PLA
            BEQ   L1423

	DO	VF
            LDA   #'O'
	ELSE
            LDA   #'Y'
	FIN
            JMP   L13AD
L1423       JMP   L1361

L1426       DW    $0000

            JSR   L0C4C
            JSR   L0D1D
            CLC
            LDA   #$0037
            STA   L042F
            LDA   #$003B
            STA   L0431
            LDA   #$0089
            ADC   #$0001
            STA   L042D
            LDA   #$0104
            ADC   #$0001
            STA   L0433
            LDA   #$000B
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            CLC
            LDA   #$003F
            STA   L042F
            LDA   #$0044
            STA   L0431
            LDA   #$0081
            ADC   #$0001
            STA   L042D
            LDA   #$00FB
            ADC   #$0001
            STA   L0433
            LDA   #$000E
            STA   L0447
            JSR   L0DE5
            JSR   L0DED
            JSR   L0DA5
            JSR   L0DD5
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L14B4

	DO	VF
L149E       STR   'Merci d'27'avoir utilis'8e
	ELSE
L149E       STR   'Thank you for running'
	FIN
L14B4       PEA   $0055
            PEA   $004F
            _MoveTo
            LDA   #^L149E
            PHA
            LDA   #L149E
            PHA
            _DrawString
            JMP   L14E0

	DO	VF
L14D3       STR   'le programme.'
L14E0       PEA   $0076
	ELSE
L14D3       STR   'the program.'
L14E0       PEA   $007A
	FIN
            PEA   $005A
            _MoveTo
            LDA   #^L14D3
            PHA
            LDA   #L14D3
            PHA
            _DrawString
            PEA   $000B
            _SetForeColor
            JMP   L151F

	DO	VF
L1509       STR   'Eteins l'27'ordinateur'
L151F       PEA   $004B
	ELSE
L1509       STR   'Turn off the computer'
L151F       PEA   $0053
	FIN
            PEA   $006B
            _MoveTo
            LDA   #^L1509
            PHA
            LDA   #L1509
            PHA
            _DrawString
            JMP   L1549

	DO	VF
L153E       STR   'ou red'8e'marre.'
L1549       PEA   $0074
	ELSE
L153E       STR   'or reboot.'
L1549       PEA   $0080
	FIN
            PEA   $0076
            _MoveTo
            LDA   #^L153E
            PHA
            LDA   #L153E
            PHA
            _DrawString
            JSR   L0C5B
            _HideCursor

            STP

L1570       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L0288
            PHA
            _DisposeAll
            JSR   L0A46
            LDA   L0286
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L15BB       LDA   L039F
            STA   L0270
            LDA   L039F+2
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L03A3
            LDA   L0276
            STA   L03A3+2
            PEA   $0000
            LDA   #^L03AF
            PHA
            LDA   #L03AF
            PHA
            LDA   #^L03B3
            PHA
            LDA   #L03B3
            PHA
            LDA   L03A3+2
            PHA
            LDA   L03A3
            PHA
            LDA   L03B5
            PHA
            _PackBytes
            PLA
            STA   L02FA
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L02F4
            JSR   L0A46
            LDA   L03B3
            BNE   L15BB
            RTS

            _HideCursor
            LDA   L039F
            STA   L0270
            LDA   L039F+2
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L0510
            LDA   L0276
            STA   L0510+2
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HLock
            JSR   L0A46
            LDA   #^L04D4
            PHA
            LDA   #L04D4
            PHA
            _PaintPixels
            JSR   L0A46
            RTS

            _HideCursor
            LDA   #^L054C
            PHA
            LDA   #L054C
            PHA
            _PaintPixels
            JSR   L0A46
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HUnlock
            JSR   L0A46
            RTS

            _HideCursor
            LDA   #^L057A
            PHA
            LDA   #L057A
            PHA
            _PaintPixels
            JSR   L0A46
            RTS

            _HideCursor
            LDA   #^L05AC
            PHA
            LDA   #L05AC
            PHA
            _PaintPixels
            JSR   L0A46
            RTS

            LDA   L039F
            STA   L0270
            LDA   L039F+2
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L03A3
            LDA   L0276
            STA   L03A3+2
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HLock
            JSR   L0A46
            PEA   $00E1
            PEA   $2000
            LDA   L03A3+2
            PHA
            LDA   L03A3
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

            LDA   L03A3+2
            PHA
            LDA   L03A3
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HUnlock
            JSR   L0A46
            RTS

            _HideCursor
            LDA   L050A
            STA   L0270
            LDA   L050C
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L04FC
            LDA   L0276
            STA   L04FC+2
            LDA   #^L04BE
            PHA
            LDA   #L04BE
            PHA
            _PaintPixels
            JSR   L0A46
            _InitCursor
            RTS

L176D       _HideCursor
            LDA   L050A
            STA   L0270
            LDA   L050C
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L04FC
            LDA   L0276
            STA   L04FC+2
            LDA   #^L0536
            PHA
            LDA   #L0536
            PHA
            _PaintPixels
            JSR   L0A46
            RTS

            LDA   #^L05CE
            STA   L0298+2
            LDA   #L05CE
            STA   L0298
            LDA   #$0000
            STA   L029C+2
            LDA   #$0006
            STA   L029C
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            LDA   L039F
            STA   L0270
            LDA   L039F+2
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L03A3
            LDA   L0276
            STA   L03A3+2
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HLock
            JSR   L0A46
            LDA   L03A3
            STA   L0298
            LDA   L03A3+2
            STA   L0298+2
            LDA   #$8000
            STA   L029C
            LDA   #$0000
            STA   L029C+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L02A4
            LDA   #$0028
            STA   L03C7
            LDA   L050A
            STA   L0270
            LDA   L050C
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L04FC
            LDA   L0276
            STA   L04FC+2
            LDA   L04FC
            STA   L03B7
            LDA   L04FC+2
            STA   L03B7+2
            LDA   L05CE
            STA   L03BB
L1850       PHA
            LDA   L03A3+2
            PHA
            LDA   L03A3
            PHA
            LDA   L02A0
            PHA
            LDA   #^L03B7
            PHA
            LDA   #L03B7
            PHA
            LDA   #^L03BB
            PHA
            LDA   #L03BB
            PHA
            _UnPackBytes
            PLA
            LDA   L03BB
            BNE   L1850
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HUnlock
            JSR   L0A46
            RTS

            LDA   #$0000
            STA   L0502
            STA   L0504
            STA   L0562
            STA   L0564
            LDA   L05D0
            STA   L0506
            STA   L0566
            LDA   L05D2
            STA   L0508
            STA   L0568
            LSR
            CLC
            ADC   #$0001
            STA   L0500
            _HideCursor
            JSR   L176D
            RTS

            LDA   L03C9
            STA   $00
            LDA   L03CB
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L0284
            LDA   #$0001
            STA   L1942
            PHA
            LDA   L03CB
            PHA
            LDA   L03C9
            PHA
            _StringWidth
            PLA
            STA   L1944
            LDA   #$0140
            SEC
            SBC   L1944
            LSR
            PHA
            LDA   L03C7
            PHA
            _MoveTo
L1904       LDA   L03C9
            STA   $00
            LDA   L03CB
            STA   $02
            LDY   L1942
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0061
            BCC   L191F
            SEC
            SBC   #$0020
L191F       STA   L0412
            JSR   L0CC0
            LDA   L0412
            PHA
            _DrawChar
            INC   L1942
            DEC   L0284
            BNE   L1904
            LDA   #$000D
            STA   L0412
            JSR   L0CC0
            RTS

L1942       DW    $0000
L1944       DW    $0000
            LDA   #^L049F
            PHA
            LDA   #L049F
            PHA
            LDA   L03C1
            PHA
            LDA   L03C3
            PHA
            LDA   L03C1
            CLC
            ADC   #$0079
            PHA
            LDA   L03C3
            CLC
            ADC   #$001A
            PHA
            _SetRect
            LDA   #$000F
            STA   L0447
            LDA   #$0001
            PHA
            _SetForeColor
            JSR   L0DE5
            JSR   L0DED
            LDA   #^L049F
            PHA
            LDA   #L049F
            PHA
            _PaintRect
            LDA   L03C1
            CLC
            ADC   #$0004
            STA   L03C5
            LDA   L03C3
            CLC
            ADC   #$000B
            STA   L03C7
            JMP   L19BA

	DO	VF
L19AA       STR   'Clique sur la souris'
	ELSE
L19AA       STR   'Click the mouse'
	FIN
L19BA       LDA   #^L19AA
            STA   L03CB
            LDA   #L19AA
            STA   L03C9
            JSR   L0EF7
            LDA   L03C1
            CLC
            ADC   #$0014
            STA   L03C5
            LDA   L03C3
            CLC
            ADC   #$0013
            STA   L03C7
            JMP   L19ED

	DO	VF
L19E0       STR   'pour continuer.'
	ELSE
L19E0       STR   'to continue.'
	FIN
L19ED       LDA   #^L19E0
            STA   L03CB
            LDA   #L19E0
            STA   L03C9
            JSR   L0EF7
            JSR   L0C25
            RTS

L1A00       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

            PEA   $0003
            _IntSource
            PHA
            PHA
            PEA   $000C
            _GetVector
            PLA
            STA   L1E54
            PLA
            STA   L1E54+2
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0A46
            PLA
            AND   #$000F
            PHA
            LDA   #^L1E80
            PHA
            LDA   #L1E80
            PHA
            _GetColorTable
            JSR   L0A46
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0A46
            PLA
            AND   #$000F
            PHA
            LDA   #^L1EA0
            PHA
            LDA   #L1EA0
            PHA
            _GetColorTable
            JSR   L0A46
            PEA   $000C
            LDA   #^L1AD1
            PHA
            LDA   #L1AD1
            PHA
            _SetVector
            PEA   $0002
            _IntSource
            RTS

            PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L1E80
            PHA
            LDA   #L1E80
            PHA
            _SetColorTable
            JSR   L0A46
            PEA   $000C
            LDA   L1E54+2
            PHA
            LDA   L1E54
            PHA
            _SetVector
            PEA   $0002
            _IntSource
            RTS

L1AD1       PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L1B9E
L1ADA       JSR   L1B1C
            INC   L1B9E
            INC   L1B9E
            LDA   L1B9E
            CMP   #$0008
            BCC   L1ADA
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0A46
            PLA
            AND   #$000F
            PHA
            LDA   #^L1EA0
            PHA
            LDA   #L1EA0
            PHA
            _SetColorTable
            JSR   L0A46
            SEP   #$30
            LDA   #$00
            STAL  $E0C047
            PLA
            PLB
            CLC
            RTL

            MX    %00
L1B1C       LDX   L1B9E
            DEC   L1B96,X
            BEQ   L1B25
            RTS

L1B25       LDA   L1E60,X
            STA   L1B96,X
            LDA   L1E68,X
            STA   L1B92
            LDA   L1E78,X
            STA   L1B94
L1B37       LDA   L1B94
            CMP   L1E70,X
            BCC   L1B47
            BEQ   L1B47
            LDA   L1E68,X
            STA   L1B94
L1B47       LDY   L1B92
            LDA   L1E80,Y
            LDY   L1B94
            STA   L1EA0,Y
            INC   L1B94
            INC   L1B94
            INC   L1B92
            INC   L1B92
            LDA   L1B92
            CMP   L1E70,X
            BCC   L1B37
            BEQ   L1B37
            LDA   L1E78,X
            CLC
            ADC   L1E58,X
            STA   L1E78,X
            CMP   #$8000
            BCS   L1B7D
            CMP   L1E68,X
            BCS   L1B84
L1B7D       LDA   L1E70,X
            STA   L1E78,X
            RTS

L1B84       CMP   L1E70,X
            BCC   L1B91
            BEQ   L1B91
            LDA   L1E68,X
            STA   L1E78,X
L1B91       RTS

L1B92       DB    $00
            DB    $00
L1B94       DB    $00
            DB    $00
L1B96       DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $00
L1B9E       DB    $00
            DB    $00
L1BA0       PHA
            PEA   $0064
            _GetSCB
            JSR   L0A46
            PLA
            AND   #$000F
            STA   L1D0E
            LDA   L1D0E
            PHA
            LDA   #^L1D10
            PHA
            LDA   #L1D10
            PHA
            _GetColorTable
            JSR   L0A46
            PEA   $0001
            LDA   #^L1D10
            PHA
            LDA   #L1D10
            PHA
            _SetColorTable
            JSR   L0A46
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L0288
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0A46
            PLA
            STA   $00
            STA   L1EC0
            PLA
            STA   $02
            STA   L1EC0+2
            LDY   #$0000
            LDA   [$00],Y
            STA   L1EC4
            LDY   #$0002
            LDA   [$00],Y
            STA   L1EC4+2
            LDA   #^L1ECE
            STA   L0298+2
            LDA   #L1ECE
            STA   L0298
            LDA   #$000F
            STA   L029C
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            LDA   #$00E1
            STA   L0298+2
            LDA   #$9E00
            STA   L0298
            PHA
            PHA
            LDA   L1EDB
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L029C
            PLA
            STA   L029C+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            LDA   #^L1EDD
            STA   L0298+2
            LDA   #L1EDD
            STA   L0298
            LDA   #$0002
            STA   L029C
            LDA   #$0000
            STA   L029C+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            LDA   L1EC4
            STA   L0298
            LDA   L1EC4+2
            STA   L0298+2
            LDA   #$0320
            STA   L029C
            LDA   #$0000
            STA   L029C+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            LDA   L039F
            STA   L0270
            LDA   L039F+2
            STA   L0272
            JSR   L0A78
            LDA   L0274
            STA   L03A3
            LDA   L0276
            STA   L03A3+2
            LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HLock
            JSR   L0A46
            LDA   L03A3
            STA   L0298
            LDA   L03A3+2
            STA   L0298+2
            LDA   #$8000
            STA   L029C
            LDA   #$0000
            STA   L029C+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0296
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L02A4
            RTS

L1D0E       DW    $0000
L1D10       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L1D30       LDA   #$00E1
            STA   L0298+2
            LDA   #$2000
            STA   L0298
            LDA   L03A3
            STA   L1EC8
            LDA   L03A3+2
            STA   L1EC8+2
            LDA   #$00C8
            STA   L0284
            LDA   #$0000
            STA   L03BD
L1D54       LDA   #$0000
            STA   L1ECC
            LDA   #$00A0
            STA   L03BB
L1D60       PHA
            LDA   L1EC8+2
            PHA
            LDA   L1EC8
            PHA
            LDA   L1EC4
            STA   $00
            LDA   L1EC4+2
            STA   $02
            LDA   L03BD
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L0298
            PHA
            LDA   #L0298
            PHA
            LDA   #^L03BB
            PHA
            LDA   #L03BB
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L1ECC
            STA   L1ECC
            LDA   L03BB
            BNE   L1D60
            LDA   L1EC8
            CLC
            ADC   L1ECC
            STA   L1EC8
            LDA   L1EC8+2
            ADC   #$0000
            STA   L1EC8+2
            LDA   L03BD
            PHA
            PEA   $0000
            _SetSCB
            JSR   L0A46
            INC   L03BD
            DEC   L0284
            BEQ   L1DCF
            JMP   L1D54

L1DCF       LDA   L1EC0+2
            PHA
            LDA   L1EC0
            PHA
            _DisposeHandle
            JSR   L0A46
            LDA   L1EC8
            CLC
            ADC   #$0009
            STA   L1EC8
            LDA   L1EC8+2
            ADC   #$0000
            STA   L1EC8+2
            LDX   #$0000
L1DF7       LDA   L1EC8
            STA   $00
            LDA   L1EC8+2
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L1E0E
            LDA   #$FFFE
            JMP   L1E11

L1E0E       LDA   #$0002
L1E11       STA   L1E58,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L1E68,X
            STA   L1E78,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L1E70,X
            LDA   L1EC8
            CLC
            ADC   #$0008
            STA   L1EC8
            INX
            INX
            CPX   #$0008
            BCS   L1E41
            JMP   L1DF7

L1E41       LDA   L039F+2
            PHA
            LDA   L039F
            PHA
            _HUnlock
            JSR   L0A46
            RTS

L1E54       ADRL  $00000000
L1E58       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L1E60       DW    $0005
            DW    $0005
            DW    $0005
            DW    $0005
L1E68       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L1E70       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L1E78       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L1E80       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L1EA0       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L1EC0       ADRL  $00000000
L1EC4       ADRL  $00000000
L1EC8       ADRL  $00000000
L1ECC       DW    $0000
L1ECE       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1EDB       DW    $0000
L1EDD       DW    $0000
*L1EDF       STR   '/oc.boot.disk/data2'
*L1EF3       STR   '/oc.boot.disk/data1'
L1EDF       STR   '1/data2'
L1EF3       STR   '1/data1'
L1F07       DW    $0007       ;  prefix num
            ADRL  L1EDF       ;  prefix ptr
L1F0D       DW    $0000       ;  prefix num
            ADRL  L1EF3       ;  prefix ptr
L1F13       DB    $00
L1F14       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1F54       DB    $00
L1F55       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1F95       DW    $0007       ;  prefix num
            ADRL  L1F13       ;  prefix ptr
L1F9B       DW    $0000       ;  prefix num
            ADRL  L1F54       ;  prefix ptr
L1FA1       DW    $0001       ;  prefix num
            ADRL  L1F54       ;  prefix ptr
L1FA7       DW    $0001       ;  prefix num
            ADRL  L1F13       ;  prefix ptr
L1FAD       STR   'DATA1'
L1FB3       STR   'DATA2'
L1FB9       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

L1FC9       ADRL  L1FB9       ;  buffer ptr
L1FCD       STR   '/OC.BOOT.DISK/'
L1FDC       JSL   GSOS
            DW    $0028       ; GetBootVol
            ADRL  L1FC9
            JSR   L0A46
            JSR   L2048
            BCS   L1FF1
            JMP   L2029

L1FF1       JSL   GSOS
            DW    $000A       ; GetPrefix
            ADRL  L1FA1
            JSR   L0A46
            JSL   GSOS
            DW    $000A       ; GetPrefix
            ADRL  L1FA7
            JSR   L0A46
            JSR   L2083
            JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1F95
            JSR   L0A46
            JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1F9B
            JSR   L0A46
            RTS

L2029       JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1F07
            JSR   L0A46
            JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1F0D
            JSR   L0A46
            RTS

            MX    %00
L2044       DB    $00
            DB    $00
L2046       DB    $00
            DB    $00
L2048       LDA   L1FB9
            AND   #$00FF
            STA   L2044
            LDA   L1FCD
            AND   #$00FF
            CMP   L2044
            BNE   L207B
            LDY   #$0000
L205F       INY
            LDA   L1FB9,Y
            AND   #$007F
            STA   L2046
            LDA   L1FCD,Y
            AND   #$007F
            CMP   L2046
            BNE   L207B
            CPY   L2044
            BCC   L205F
            CLC
            RTS

L207B       SEC
            RTS

L207D       DB    $00
            DB    $00
L207F       DB    $00
            DB    $00
L2081       DB    $00
            DB    $00
L2083       LDA   L1FAD
            AND   #$00FF
            STA   L207D
            STA   L2081
            LDA   L1F54
            AND   #$00FF
            TAY
            LDX   #$0001
L2099       LDA   L1FAD,X
            AND   #$00FF
            STA   L207F
            LDA   L1F55,Y
            AND   #$FF00
            ORA   L207F
            STA   L1F55,Y
            INY
            INX
            DEC   L207D
            BNE   L2099
            LDA   L1F54
            CLC
            ADC   L2081
            STA   L1F54
            LDA   L1FB3
            AND   #$00FF
            STA   L207D
            STA   L2081
            LDA   L1F13
            AND   #$00FF
            TAY
            LDX   #$0001
L20D5       LDA   L1FB3,X
            AND   #$00FF
            STA   L207F
            LDA   L1F14,Y
            AND   #$FF00
            ORA   L207F
            STA   L1F14,Y
            INY
            INX
            DEC   L207D
            BNE   L20D5
            LDA   L1F13
            CLC
            ADC   L2081
            STA   L1F13
            RTS

