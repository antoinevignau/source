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
            STA   L0278
            JSR   L0A38
            LDA   L0278
            AND   #$F0FF
            ORA   #$0100
            STA   L027A
            _MTStartUp
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $1000
            LDA   L027A
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0A38
            PLA
            STA   $00
            PLA
            STA   $02
            LDA   [$00]
            STA   L027C
            LDA   L027C
            TAY
            CLC
            ADC   #$0100
            STA   L027C
            TYA
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L0278
            PHA
            _EMStartUp
            JSR   L0A38
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
            LDY   L027C
            TYA
            CLC
            ADC   #$0300
            STA   L027C
            TYA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0278
            PHA
            _QDStartUp
            JSR   L0A38
            JSR   L0CE7
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
            LDA   L027A
            PHA
            PEA   $0108
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0A38
            PLA
            STA   L0391
            PLA
            STA   L0393
            LDA   #$8000
            STA   L03A7
            JMP   L0136

L0134       DW    $0000
L0136       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L0134
            ASL
            ASL
            ASL
            ASL
            ORA   L0134
            STA   L0134
            LDAL  $E0C022
            AND   #$FF00
            ORA   L0134
            STAL  $E0C022
            JSR   L1FC8
            JMP   L0177

L0168       STR   'logo'
L016D       DW    $0000       ;  ref num
            ADRL  L0168       ;  path name
            ADRL  $00000000   ;  reserved
L0177       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L016D
            JSR   L0A38
            LDA   L016D
            STA   L0288
            STA   L0296
            JSR   L1B85
            JSR   L1D15
            LDA   #$2000
            STA   L03B1
            JSR   L19F2
            STZ   L03AF
            JSR   L0C87
            JMP   L01B5

L01A5       STR   'tpage'
L01AB       DW    $0000       ;  ref num
            ADRL  L01A5       ;  path name
            ADRL  $00000000   ;  reserved
L01B5       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01AB
            JSR   L0A38
            LDA   L01AB
            STA   L0288
            STA   L0296
            JSR   L1B85
            JSR   L1D15
            JSR   L19F2
            STZ   L03AF
            JSR   L0C87
            JMP   L01F1

L01DD       STR   'copyright'
L01E7       DW    $0000       ;  ref num
            ADRL  L01DD       ;  path name
            ADRL  $00000000   ;  reserved
L01F1       JSL   GSOS
            DW    $0010       ; Open
            ADRL  L01E7
            JSR   L0A38
            LDA   L01E7
            STA   L0288
            STA   L0296
            JSR   L1B85
            JMP   L020F

L020D       DW    $0000
L020F       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0008
            STAL  $E0C034
            LDA   #$0008
            STA   L020D
            ASL
            ASL
            ASL
            ASL
            ORA   L020D
            STA   L020D
            LDAL  $E0C022
            AND   #$FF00
            ORA   L020D
            STAL  $E0C022
            JSR   L1D15
            JSR   L19F2
            STZ   L03AF
            JSR   L0C87
            JSR   L1562
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L0254
L0254       ADRL  L025A       ;  path name
            DW    $0000       ;  flags
L025A       STR   'program'
L0262       DB    $00
            DB    $00
L0264       DB    $00
            DB    $00
L0266       DB    $00
            DB    $00
L0268       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0276       DB    $00
            DB    $00
L0278       DB    $00
            DB    $00
L027A       DB    $00
            DB    $00
L027C       DB    $00
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
L0288       DW    $0000       ;  ref num
L028A       ADRL  $00000000   ;  buffer ptr
L028E       ADRL  $00000000   ;  request count
L0292       ADRL  $00000000   ;  transfer count
L0296       DW    $0000       ;  ref num
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
            ADRL  L030A
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
            ADRL  L030A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C4       DB    $00         ;  ref num
            DB    $00
L02C6       ADRL  $00000000   ;  buffer ptr
L02CA       ADRL  $00000000   ;  request count
L02CE       ADRL  $00000000   ;  transfer count
L02D2       DW    $0000       ;  ref num
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
L02E6       DW    $0000       ;  ref num
            ADRL  $00000000   ;  buffer ptr
L02EC       ADRL  $00000000   ;  request count
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
L030A       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0391       DB    $00
            DB    $00
L0393       DB    $00
            DB    $00
L0395       DB    $00
            DB    $00
L0397       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03A1       DB    $00
            DB    $00
            DB    $00
            DB    $00
L03A5       DB    $00
            DB    $00
L03A7       DB    $00
            DB    $00
L03A9       DB    $00
            DB    $00
L03AB       DB    $00
            DB    $00
L03AD       DB    $00
            DB    $00
L03AF       DB    $00
            DB    $00
L03B1       DB    $00
            DB    $00
L03B3       DB    $00
            DB    $00
L03B5       DB    $00
            DB    $00
L03B7       DW    $0000
L03B9       DW    $0000
L03BB       ADRL  $00000000
L03BF       DW    $0009
L03C1       DB    $00
            DB    $00
L03C3       DB    $00
            DB    $00
L03C5       DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            ADRL  L03D2
            DB    $FF
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
L03E4       DB    $00
            DB    $00
L03E6       DB    $00
            DB    $00
L03E8       DW    $0000       ; event code
L03EA       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L03F2       DW    $0000       ; mouse location
L03F4       DW    $0000
            DW    $0000       ; modifiers
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L0400       DB    $00
            DB    $00
L0402       DB    $00
            DB    $00
L0404       DB    $00
            DB    $00
L0406       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L040F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0417       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L041F       DB    $00
            DB    $00
L0421       DB    $00
            DB    $00
L0423       DB    $00
            DB    $00
L0425       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0439       DB    $00
            DB    $00
L043B       DB    $00
            DB    $00
L043D       DB    $00
            DB    $00
L043F       DB    $00
            DB    $00
L0441       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0491       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L049A       DB    $00
            DB    $00
L049C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L04B0       ADRL  L04DC       ; ptr to source locinfo
            ADRL  L04EC       ; ptr to dest locinfo
            ADRL  L0514       ; ptr to source rect
            ADRL  L0510       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L04C6       ADRL  L04DC       ; ptr to source locinfo
            ADRL  L0500       ; ptr to dest locinfo
            ADRL  L0520       ; ptr to source rect
            ADRL  L051C       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L04DC       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L04EC       DW    $0000       ; SCB byte
L04EE       ADRL  $00000000   ; Pointer to pixel image
L04F2       DW    $0010       ; Width
L04F4       DW    $0000       ; Bounds rect
L04F6       DW    $0000
L04F8       DW    $0014
L04FA       DW    $0014
L04FC       ADRL  $00000000
L0500       DW    $0000       ; SCB byte
L0502       ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L0510       DW    $0000
            DW    $0000
L0514       DW    $0000
            DW    $0000
            DW    $0014
            DW    $0014
L051C       DW    $0000
            DW    $0000
L0520       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0528       ADRL  L04EC       ; ptr to source locinfo
            ADRL  L04DC       ; ptr to dest locinfo
            ADRL  L0554       ; ptr to source rect
            ADRL  L055C       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L053E       ADRL  L0500       ; ptr to source locinfo
            ADRL  L04DC       ; ptr to dest locinfo
            ADRL  L0560       ; ptr to source rect
            ADRL  L0568       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0554       DW    $0000
L0556       DW    $0000
L0558       DW    $0014
L055A       DW    $0014
L055C       DW    $0000
            DW    $0000
L0560       DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
L0568       DW    $0000
            DW    $0000
L056C       ADRL  L04DC       ; ptr to source locinfo
            ADRL  L0582       ; ptr to dest locinfo
            ADRL  L0592       ; ptr to source rect
            ADRL  L059A       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L0582       DW    $0000       ; SCB byte
            ADRL  $00000000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $000F
            DW    $0140
L0592       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L059A       DW    $0000
            DW    $0000
L059E       ADRL  L0582       ; ptr to source locinfo
            ADRL  L04DC       ; ptr to dest locinfo
            ADRL  L05B4       ; ptr to source rect
            ADRL  L05BC       ; ptr to dest point
            DW    $0000       ; mode
            ADRL  $00000000   ; clip rgn handle
L05B4       DW    $0000
            DW    $0000
            DW    $000F
            DW    $0140
L05BC       DW    $0000
            DW    $0000
L05C0       DB    $00
            DB    $00
L05C2       DB    $00
            DB    $00
L05C4       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
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
L0991       HEX   0000000010034006720AC50F6405A608
            HEX   E90C4203FF07ED05200B300FE00EFF0F
L09B1       HEX   00001101220233032F027200880F8D0F
            HEX   F200900F000FEF07C40F700A0B01FF0F
L09D1       HEX   0000030D09002D0D720055052F02AF06
            HEX   5008600FAA0A980FD000F00FF902FF0F
            DB    $00
            DB    $00
            ADRL  L09F7
L09F7       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0A38       BCS   L0A3B
            RTS

L0A3B       PHA
            LDA   #^L0A4C
            PHA
            LDA   #L0A4C
            PHA
            _SysFailMgr
            RTS

	DO	VF
L0A4C       STR   'Erreur applicative ... Oups !'
	ELSE
L0A4C       STR   'Application failure ... Oops!'
	FIN
L0A6A       LDA   #$0000
            STA   L043F
            LDA   L0262
            STA   $00
            LDA   L0264
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            STA   L0266
            LDY   #$0002
            LDA   [$00],Y
            STA   L0268
            LDA   L0266
            BNE   L0A97
            LDA   L0268
            BNE   L0A97
            JMP   L0A98
L0A97       RTS

L0A98       LDA   L0264
            PHA
            LDA   L0262
            PHA
            _RestoreHandle
            JSR   L0A38
            LDA   #$8000
            STA   L043F
            JMP   L0A6A

            LDA   #$0000
            STA   L028E+2
            LDA   #$8000
            STA   L028E
            LDA   #$00E1
            STA   L028A+2
            LDA   #$2000
            STA   L028A
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            JSR   L0A38
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0296
            JSR   L0A38
            RTS

            LDA   #$0000
            STA   L028E+2
            LDA   #$8000
            STA   L028E
            LDA   L0391
            STA   L0262
            LDA   L0393
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L028A
            LDA   L0268
            STA   L028A+2
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HLock
            JSR   L0A38
            LDA   L028A
            STA   L0395
            LDA   L028A+2
            STA   L0397
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            JSR   L0A38
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0296
            JSR   L0A38
            RTS

            LDA   #$000F
            PHA
            _SetForeColor
            LDA   L03E4
            STA   L0262
            LDA   L03E6
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L03C1
            LDA   L0268
            STA   L03C3
            LDA   L03C1
            STA   L02C6
            LDA   L03C3
            STA   L02C6+2
            LDA   #$0000
            STA   L02CA+2
            LDA   #$A000
            STA   L02CA
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L02C4
            JSR   L0A38
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L02D2
            JSR   L0A38
            LDA   L02CE
            STA   L03C5
            LDA   #$0000
            STA   L03AF
            LDX   #$0008
L0BAD       LSR   L03C5
            BCC   L0BB8
            LDA   #$0001
            STA   L03AF
L0BB8       DEX
            BNE   L0BAD
            LDA   L03C5
            CLC
            ADC   L03AF
            STA   L03C5
            RTS

            LDA   #$00E1
            STA   L03AB
            LDA   #$2000
            STA   L03A9
            LDA   #$8000
            STA   L03AD
L0BD8       PEA   $0000
            LDA   L0397
            PHA
            LDA   L0395
            PHA
            LDA   L0292
            PHA
            LDA   #^L03A9
            PHA
            LDA   #L03A9
            PHA
            LDA   #^L03AD
            PHA
            LDA   #L03AD
            PHA
            _UnPackBytes
            PLA
            LDA   L03AD
            BNE   L0BD8
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HUnlock
            JSR   L0A38
            RTS

L0C17       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BNE   L0C17
L0C2A       PEA   $0000
            PEA   $0000
            _Button
            PLA
            CMP   #$0000
            BEQ   L0C2A
            RTS

L0C3E       _GrafOff
            _HideCursor
            RTS

L0C4D       _GrafOn
            RTS

L0C55       PEA   $0000
            PEA   $FFFF
            LDA   #^L03E8
            PHA
            LDA   #L03E8
            PHA
            _GetNextEvent
            PLA
            BEQ   L0C86
            LDA   L03E8
            CMP   #$0003
            BNE   L0C7E
L0C75       LDA   #$0080
            STA   L03AF
            JMP   L0C86

L0C7E       CMP   #$0001
            BNE   L0C86
            JMP   L0C75
L0C86       RTS

L0C87       LDA   L03B1
            STA   L0CA1
            STZ   L03AF
L0C90       JSR   L0C55
            LDA   L03AF
            CMP   #$0000
            BNE   L0CA0
            DEC   L0CA1
            BNE   L0C90
L0CA0       RTS

L0CA1       DW    $0000
            STZ   L03AF
L0CA6       JSR   L0C55
            LDA   L03AF
            CMP   #$0000
            BEQ   L0CA6
            RTS

L0CB2       PEA   $0000
            PEA   $FFFF
            LDA   #^L03E8
            PHA
            LDA   #L03E8
            PHA
            _GetNextEvent
            PLA
            BEQ   L0CB2
            LDA   L03E8
            CMP   #$0003
            BNE   L0CB2
            LDA   L03EA
            AND   #$007F
            CMP   #$0061
            BCC   L0CE1
            SEC
            SBC   #$0020
L0CE1       CMP   L0404
            BNE   L0CB2
            RTS

L0CE7       PEA   $0000
            _ClearScreen
            LDA   #$0000
            PHA
            _SetAllSCBs
            PEA   $0000
            LDA   #^L0991
            PHA
            LDA   #L0991
            PHA
            _SetColorTable
            RTS

L0D0F       PEA   $0000
            _ClearScreen
            LDA   #$0001
            PHA
            _SetAllSCBs
            PEA   $0001
            LDA   #^L09B1
            PHA
            LDA   #L09B1
            PHA
            _SetColorTable
            RTS

            PEA   $0000
            _ClearScreen
            LDA   #$0002
            PHA
            _SetAllSCBs
            PEA   $0002
            LDA   #^L09D1
            PHA
            LDA   #L09D1
            PHA
            _SetColorTable
            RTS
            JMP   L0D64

L0D62       DW    $0000
L0D64       LDA   L043B
            STA   L0D62
L0D6A       LDA   L0D62
            CMP   #$00C8
            BCS   L0D84
            PHA
            LDA   #$0001
            PHA
            _SetSCB
            INC   L0D62
            JMP   L0D6A

L0D84       PEA   $0001
            LDA   #^L09B1
            PHA
            LDA   #L09B1
            PHA
            _SetColorTable
            RTS

L0D97       LDA   #^L0406
            PHA
            LDA   #L0406
            PHA
            LDA   L0423
            PHA
            LDA   L0421
            PHA
            LDA   L0425
            PHA
            LDA   L041F
            PHA
            _SetRect
            RTS

            LDA   #^L0406
            PHA
            LDA   #L0406
            PHA
            _FrameRect
            RTS

L0DC7       LDA   #^L0406
            PHA
            LDA   #L0406
            PHA
            _PaintRect
            RTS

L0DD7       _PenNormal
            RTS

L0DDF       LDA   L0439
            PHA
            _SetSolidPenPat
            RTS

L0DEB       PEA   $0000
            PEA   $FFFF
            LDA   #^L03E8
            PHA
            LDA   #L03E8
            PHA
            _GetNextEvent
            PLA
            BEQ   L0DEB
            LDA   L03E8
            CMP   #$0003
            BEQ   L0E0E
            JMP   L0E5C

L0E0E       LDA   L03EA
            AND   #$007F
            CMP   #$0061
            BCC   L0E1D
            SEC
            SBC   #$0020
L0E1D       STA   L0404
            _ObscureCursor
            LDA   #$0000
            STA   L043D
            LDA   #$0001
            STA   L0EE7
            LDA   #$0000
            STA   L0EE5
L0E39       LDX   L0EE5
            LDA   L049C,X
            CMP   L0404
            BNE   L0E45
            RTS

L0E45       LDA   L0EE7
            CMP   L049A
            BEQ   L0E59
            INC   L0EE7
            INC   L0EE5
            INC   L0EE5
            JMP   L0E39
L0E59       JMP   L0DEB

L0E5C       CMP   #$0001
            BEQ   L0E64
            JMP   L0DEB

L0E64       LDA   L03F2
            STA   L0400
            LDA   L03F4
            STA   L0402
            LDA   #$0080
            STA   L043D
            LDA   #$0000
            STA   L0EE3
            STA   L0EE5
            LDA   #$0001
            STA   L0EE7
L0E85       LDY   #$0000
            LDX   L0EE3
L0E8B       LDA   L0441,X
            STA   L0491,Y
            INX
            INY
            CPY   #$0008
            BCC   L0E8B
            PEA   $0000
            LDA   #^L0400
            PHA
            LDA   #L0400
            PHA
            LDA   #^L0491
            PHA
            LDA   #L0491
            PHA
            _PtInRect
            PLA
            BEQ   L0EB8
            JMP   L0ED9

L0EB8       LDA   L0EE7
            CMP   L049A
            BNE   L0EC3
            JMP   L0DEB

L0EC3       INC   L0EE7
            INC   L0EE5
            INC   L0EE5
            LDA   L0EE3
            CLC
            ADC   #$0008
            STA   L0EE3
            JMP   L0E85

L0ED9       LDX   L0EE5
            LDA   L049C,X
            STA   L0404
            RTS

L0EE3       DW    $0000
L0EE5       DW    $0000
L0EE7       DW    $0000
L0EE9       LDA   L03B7
            PHA
            LDA   L03B9
            PHA
            _MoveTo
            LDA   L03BB+2
            PHA
            LDA   L03BB
            PHA
            _DrawString
            LDA   L03B9
            CLC
            ADC   L03BF
            STA   L03B9
            RTS

            LDA   L03BB+2
            PHA
            LDA   L03BB
            PHA
            _DrawString
            RTS

            PHA
            LDA   L03BB+2
            PHA
            LDA   L03BB
            PHA
            _StringWidth
            PLA
            STA   L0F44
            LDA   #$0140
            SEC
            SBC   L0F44
            LSR
            STA   L03B7
            JMP   L0EE9

L0F44       DW    $0000
            CLC
            LDA   #$00B5
            STA   L0421
            LDA   #$001A
            STA   L0423
            LDA   #$00C2
            ADC   #$0001
            STA   L041F
            LDA   #$00B4
            ADC   #$0001
            STA   L0425
            LDA   #$000E
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            LDX   #$0000
L0F7A       LDA   L0406,X
            STA   L040F,X
            INX
            INX
            CPX   #$0008
            BNE   L0F7A
            CLC
            LDA   #$00B5
            STA   L0421
            LDA   #$00D0
            STA   L0423
            LDA   #$00C2
            ADC   #$0001
            STA   L041F
            LDA   #$0124
            ADC   #$0001
            STA   L0425
            LDA   #$000D
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            LDX   #$0000
L0FBB       LDA   L0406,X
            STA   L0417,X
            INX
            INX
            CPX   #$0008
            BNE   L0FBB
            PEA   $0000
            _GetForeColor
            PLA
            STA   L10F5
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L0FF9

	DO	VF
L0FE4       STR   'Espace pour continuer'
L0FF9       PEA   $001A
	ELSE
L0FE4       STR   'Spacebar to continue'
L0FF9       PEA   $001E
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L0FE4
            PHA
            LDA   #L0FE4
            PHA
            _DrawString
            JMP   L1024

	DO	VF
L1018       STR   'ESC pour quitter'
L1024       PEA   $00C2
	ELSE
L1018       STR   'ESC to quit'
L1024       PEA   $00D6
	FIN
            PEA   $00BF
            _MoveTo
            LDA   #^L1018
            PHA
            LDA   #L1018
            PHA
            _DrawString
L1040       PEA   $0000
            PEA   $FFFF
            LDA   #^L03E8
            PHA
            LDA   #L03E8
            PHA
            _GetNextEvent
            PLA
            BEQ   L1040
            LDA   L03E8
            CMP   #$0003
            BEQ   L1063
            JMP   L1092

L1063       _ObscureCursor
            LDA   #$0000
            STA   L043D
            LDA   L03EA
            AND   #$007F
            CMP   #$0020
            BEQ   L1083
            CMP   #$001B
            BEQ   L1083
            JMP   L1040

L1083       STA   L0404
            LDA   L10F5
            PHA
            _SetForeColor
            RTS

L1092       CMP   #$0001
            BEQ   L109A
            JMP   L1040

L109A       LDA   L03F2
            STA   L0400
            LDA   L03F4
            STA   L0402
            LDA   #$0080
            STA   L043D
            PEA   $0000
            LDA   #^L0400
            PHA
            LDA   #L0400
            PHA
            LDA   #^L040F
            PHA
            LDA   #L040F
            PHA
            _PtInRect
            PLA
            BEQ   L10CF
            LDA   #$0020
            JMP   L1083

L10CF       PEA   $0000
            LDA   #^L0400
            PHA
            LDA   #L0400
            PHA
            LDA   #^L0417
            PHA
            LDA   #L0417
            PHA
            _PtInRect
            PLA
            BEQ   L10F2
            LDA   #$001B
            JMP   L1083
L10F2       JMP   L1040

L10F5       DW    $0000
            JSR   L0C3E
            JSR   L0D0F
            JMP   L1102

L1100       DW    $0000
L1102       LDAL  $E0C034
            AND   #$FFF0
            ORA   #$0000
            STAL  $E0C034
            LDA   #$0000
            STA   L1100
            ASL
            ASL
            ASL
            ASL
            ORA   L1100
            STA   L1100
            LDAL  $E0C022
            AND   #$FF00
            ORA   L1100
            STAL  $E0C022
            CLC
            LDA   #$003D
            STA   L0421
            LDA   #$003F
            STA   L0423
            LDA   #$007E
            ADC   #$0001
            STA   L041F
            LDA   #$00F8
            ADC   #$0001
            STA   L0425
            LDA   #$000A
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            CLC
            LDA   #$0041
            STA   L0421
            LDA   #$0044
            STA   L0423
            LDA   #$007A
            ADC   #$0001
            STA   L041F
            LDA   #$00F3
            ADC   #$0001
            STA   L0425
            LDA   #$000C
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            CLC
            LDA   #$0060
            STA   L0421
            LDA   #$004E
            STA   L0423
            LDA   #$0072
            ADC   #$0001
            STA   L041F
            LDA   #$00E9
            ADC   #$0001
            STA   L0425
            LDA   #$000B
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            CLC
            LDA   #$0063
            STA   L0421
            LDA   #$0053
            STA   L0423
            LDA   #$006F
            ADC   #$0001
            STA   L041F
            LDA   #$0060
            ADC   #$0001
            STA   L0425
            LDA   #$000E
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            LDX   #$0000
L11F5       LDA   L0406,X
            STA   L0417,X
            INX
            INX
            CPX   #$0008
            BNE   L11F5
            CLC
            LDA   #$0063
            STA   L0421
            LDA   #$00C6
            STA   L0423
            LDA   #$006F
            ADC   #$0001
            STA   L041F
            LDA   #$00D3
            ADC   #$0001
            STA   L0425
            LDA   #$000D
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            LDX   #$0000
L1236       LDA   L0406,X
            STA   L040F,X
            INX
            INX
            CPX   #$0008
            BNE   L1236
            PEA   $0000
            _GetForeColor
            PLA
            STA   L1418
            PEA   $0000
            _SetForeColor
            JMP   L126F

	DO	VF
L125E       STR   'Veux-tu vraiment'
	ELSE
L125E       STR   'Are you sure you'
	FIN
L126F       PEA   $0063
            PEA   $004E
            _MoveTo
            LDA   #^L125E
            PHA
            LDA   #L125E
            PHA
            _DrawString
            JMP   L129C

	DO	VF
L128E       STR   'quitter le jeu ?'
L129C       PEA   $0058
	ELSE
L128E       STR   'want to quit?'
L129C       PEA   $0064
	FIN
            PEA   $0059
            _MoveTo
            LDA   #^L128E
            PHA
            LDA   #L128E
            PHA
            _DrawString
            JMP   L12BF

	DO	VF
L12BB       STR   'ui'
	ELSE
L12BB       STR   'es'
	FIN
L12BF       PEA   $0064
            PEA   $006D
            _MoveTo
            LDA   #^L12BB
            PHA
            LDA   #L12BB
            PHA
            _DrawString
            JMP   L12E1

	DO	VF
L12DE       STR   'on'
	ELSE
L12DE       STR   'o'
	FIN
L12E1       PEA   $00D7
            PEA   $006D
            _MoveTo
            LDA   #^L12DE
            PHA
            LDA   #L12DE
            PHA
            _DrawString
            PEA   $000F
            _SetForeColor
            JMP   L130C

	DO	VF
L130A       STR   'O'
	ELSE
L130A       STR   'Y'
	FIN
L130C       PEA   $0056
            PEA   $006D
            _MoveTo
            LDA   #^L130A
            PHA
            LDA   #L130A
            PHA
            _DrawString
            JMP   L132D

	DO	VF
L132B       STR   'N'
	ELSE
L132B       STR   'N'
	FIN
L132D       PEA   $00C9
            PEA   $006D
            _MoveTo
            LDA   #^L132B
            PHA
            LDA   #L132B
            PHA
            _DrawString
            JSR   L0C4D
            _InitCursor
L1353       PEA   $0000
            PEA   $FFFF
            LDA   #^L03E8
            PHA
            LDA   #L03E8
            PHA
            _GetNextEvent
            PLA
            BEQ   L1353
            LDA   L03E8
            CMP   #$0003
            BEQ   L1376
            JMP   L13B5

L1376       _ObscureCursor
            LDA   #$0000
            STA   L043D
            LDA   L03EA
            AND   #$007F
            CMP   #$0061
            BCC   L1392
            SEC
            SBC   #$0020
	DO	VF
L1392       CMP   #'O'
	ELSE
L1392       CMP   #'Y'
	FIN
            BEQ   L139F
            CMP   #'N'
            BEQ   L139F
            JMP   L1353

L139F       STA   L0404
            LDA   L1418
            PHA
            _SetForeColor
            _HideCursor
            RTS

L13B5       CMP   #$0001
            BEQ   L13BD
            JMP   L1353

L13BD       LDA   L03F2
            STA   L0400
            LDA   L03F4
            STA   L0402
            LDA   #$0080
            STA   L043D
            PEA   $0000
            LDA   #^L0400
            PHA
            LDA   #L0400
            PHA
            LDA   #^L040F
            PHA
            LDA   #L040F
            PHA
            _PtInRect
            PLA
            BEQ   L13F2
            LDA   #$004E
            JMP   L139F

L13F2       PEA   $0000
            LDA   #^L0400
            PHA
            LDA   #L0400
            PHA
            LDA   #^L0417
            PHA
            LDA   #L0417
            PHA
            _PtInRect
            PLA
            BEQ   L1415
	DO	VF
            LDA   #'O'
	ELSE
            LDA   #'Y'
	FIN
            JMP   L139F
L1415       JMP   L1353

L1418       DW    $0000
            JSR   L0C3E
            JSR   L0D0F
            CLC
            LDA   #$0037
            STA   L0421
            LDA   #$003B
            STA   L0423
            LDA   #$0089
            ADC   #$0001
            STA   L041F
            LDA   #$0104
            ADC   #$0001
            STA   L0425
            LDA   #$000B
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            CLC
            LDA   #$003F
            STA   L0421
            LDA   #$0044
            STA   L0423
            LDA   #$0081
            ADC   #$0001
            STA   L041F
            LDA   #$00FB
            ADC   #$0001
            STA   L0425
            LDA   #$000E
            STA   L0439
            JSR   L0DD7
            JSR   L0DDF
            JSR   L0D97
            JSR   L0DC7
            LDA   #$000F
            PHA
            _SetForeColor
            JMP   L14A6

	DO	VF
L1490       STR   'Merci d'27'avoir utilis'8e
	ELSE
L1490       STR   'Thank you for running'
	FIN
L14A6       PEA   $0055
            PEA   $004F
            _MoveTo
            LDA   #^L1490
            PHA
            LDA   #L1490
            PHA
            _DrawString
            JMP   L14D2

	DO	VF
L14C5       STR   'le programmee.'
L14D2       PEA   $0076
	ELSE
L14C5       STR   'the program.'
L14D2       PEA   $007A
	FIN
            PEA   $005A
            _MoveTo
            LDA   #^L14C5
            PHA
            LDA   #L14C5
            PHA
            _DrawString
            PEA   $000B
            _SetForeColor
            JMP   L1511

	DO	VF
L14FB       STR   'Eteins l'27'ordinateur'
L1511       PEA   $004B
	ELSE
L14FB       STR   'Turn off the computer'
L1511       PEA   $0053
	FIN
            PEA   $006B
            _MoveTo
            LDA   #^L14FB
            PHA
            LDA   #L14FB
            PHA
            _DrawString
            JMP   L153B

	DO	VF
L1530       STR   'ou red'8e'marre.'
L153B       PEA   $0074
	ELSE
L1530       STR   'or reboot.'
L153B       PEA   $0080
	FIN
            PEA   $0076
            _MoveTo
            LDA   #^L1530
            PHA
            LDA   #L1530
            PHA
            _DrawString
            JSR   L0C4D
            _HideCursor
            STP
L1562       _EMShutDown
            _QDShutDown
            LDAL  $E0C029
            AND   #$FF00
            ORA   #$00C1
            STAL  $E0C029
            _SoundShutDown
            _MTShutDown
            LDA   L027A
            PHA
            _DisposeAll
            JSR   L0A38
            LDA   L0278
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L15AD       LDA   L0391
            STA   L0262
            LDA   L0393
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L0395
            LDA   L0268
            STA   L0397
            PEA   $0000
            LDA   #^L03A1
            PHA
            LDA   #L03A1
            PHA
            LDA   #^L03A5
            PHA
            LDA   #L03A5
            PHA
            LDA   L0397
            PHA
            LDA   L0395
            PHA
            LDA   L03A7
            PHA
            _PackBytes
            PLA
            STA   L02EC
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L02E6
            JSR   L0A38
            LDA   L03A5
            BNE   L15AD
            RTS

            _HideCursor
            LDA   L0391
            STA   L0262
            LDA   L0393
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L0502
            LDA   L0268
            STA   L0502+2
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HLock
            JSR   L0A38
            LDA   #^L04C6
            PHA
            LDA   #L04C6
            PHA
            _PaintPixels
            JSR   L0A38
            RTS

            _HideCursor
            LDA   #^L053E
            PHA
            LDA   #L053E
            PHA
            _PaintPixels
            JSR   L0A38
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HUnlock
            JSR   L0A38
            RTS

            _HideCursor
            LDA   #^L056C
            PHA
            LDA   #L056C
            PHA
            _PaintPixels
            JSR   L0A38
            RTS

            _HideCursor
            LDA   #^L059E
            PHA
            LDA   #L059E
            PHA
            _PaintPixels
            JSR   L0A38
            RTS

            LDA   L0391
            STA   L0262
            LDA   L0393
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L0395
            LDA   L0268
            STA   L0397
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HLock
            JSR   L0A38
            PEA   $00E1
            PEA   $2000
            LDA   L0397
            PHA
            LDA   L0395
            PHA
            PEA   $0000
            PEA   $8000
            _BlockMove
            RTS

            LDA   L0397
            PHA
            LDA   L0395
            PHA
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HUnlock
            JSR   L0A38
            RTS

            _HideCursor
            LDA   L04FC
            STA   L0262
            LDA   L04FC+2
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L04EE
            LDA   L0268
            STA   L04EE+2
            LDA   #^L04B0
            PHA
            LDA   #L04B0
            PHA
            _PaintPixels
            JSR   L0A38
            _InitCursor
            RTS

L175F       _HideCursor
            LDA   L04FC
            STA   L0262
            LDA   L04FC+2
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L04EE
            LDA   L0268
            STA   L04EE+2
            LDA   #^L0528
            PHA
            LDA   #L0528
            PHA
            _PaintPixels
            JSR   L0A38
            RTS

            LDA   #^L05C0
            STA   L028A+2
            LDA   #L05C0
            STA   L028A
            LDA   #$0000
            STA   L028E+2
            LDA   #$0006
            STA   L028E
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            LDA   L0391
            STA   L0262
            LDA   L0393
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L0395
            LDA   L0268
            STA   L0397
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HLock
            JSR   L0A38
            LDA   L0395
            STA   L028A
            LDA   L0397
            STA   L028A+2
            LDA   #$8000
            STA   L028E
            LDA   #$0000
            STA   L028E+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0296
            LDA   #$0028
            STA   L03B9
            LDA   L04FC
            STA   L0262
            LDA   L04FC+2
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L04EE
            LDA   L0268
            STA   L04EE+2
            LDA   L04EE
            STA   L03A9
            LDA   L04EE+2
            STA   L03AB
            LDA   L05C0
            STA   L03AD
L1842       PHA
            LDA   L0397
            PHA
            LDA   L0395
            PHA
            LDA   L0292
            PHA
            LDA   #^L03A9
            PHA
            LDA   #L03A9
            PHA
            LDA   #^L03AD
            PHA
            LDA   #L03AD
            PHA
            _UnPackBytes
            PLA
            LDA   L03AD
            BNE   L1842
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HUnlock
            JSR   L0A38
            RTS

            LDA   #$0000
            STA   L04F4
            STA   L04F6
            STA   L0554
            STA   L0556
            LDA   L05C2
            STA   L04F8
            STA   L0558
            LDA   L05C4
            STA   L04FA
            STA   L055A
            LSR
            CLC
            ADC   #$0001
            STA   L04F2
            _HideCursor
            JSR   L175F
            RTS

            LDA   L03BB
            STA   $00
            LDA   L03BB+2
            STA   $02
            LDY   #$0000
            LDA   [$00],Y
            AND   #$00FF
            STA   L0276
            LDA   #$0001
            STA   L1934
            PHA
            LDA   L03BB+2
            PHA
            LDA   L03BB
            PHA
            _StringWidth
            PLA
            STA   L1936
            LDA   #$0140
            SEC
            SBC   L1936
            LSR
            PHA
            LDA   L03B9
            PHA
            _MoveTo
L18F6       LDA   L03BB
            STA   $00
            LDA   L03BB+2
            STA   $02
            LDY   L1934
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0061
            BCC   L1911
            SEC
            SBC   #$0020
L1911       STA   L0404
            JSR   L0CB2
            LDA   L0404
            PHA
            _DrawChar
            INC   L1934
            DEC   L0276
            BNE   L18F6
            LDA   #$000D
            STA   L0404
            JSR   L0CB2
            RTS

L1934       BRK   $00
L1936       BRK   $00
            LDA   #^L0491
            PHA
            LDA   #L0491
            PHA
            LDA   L03B3
            PHA
            LDA   L03B5
            PHA
            LDA   L03B3
            CLC
            ADC   #$0079
            PHA
            LDA   L03B5
            CLC
            ADC   #$001A
            PHA
            _SetRect
            LDA   #$000F
            STA   L0439
            LDA   #$0001
            PHA
            _SetForeColor
            JSR   L0DD7
            JSR   L0DDF
            LDA   #^L0491
            PHA
            LDA   #L0491
            PHA
            _PaintRect
            LDA   L03B3
            CLC
            ADC   #$0004
            STA   L03B7
            LDA   L03B5
            CLC
            ADC   #$000B
            STA   L03B9
            JMP   L19AC

	DO	VF
L199C       STR   'Clique sur la souris'
	ELSE
L199C       STR   'Click the mouse'
	FIN
L19AC       LDA   #^L199C
            STA   L03BB+2
            LDA   #L199C
            STA   L03BB
            JSR   L0EE9
            LDA   L03B3
            CLC
            ADC   #$0014
            STA   L03B7
            LDA   L03B5
            CLC
            ADC   #$0013
            STA   L03B9
            JMP   L19DF

	DO	VF
L19D2       STR   'pour continuer.'
	ELSE
L19D2       STR   'to continue.'
	FIN
L19DF       LDA   #^L19D2
            STA   L03BB+2
            LDA   #L19D2
            STA   L03BB
            JSR   L0EE9
            JSR   L0C17
            RTS

L19F2       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

            PEA   $0003
            _IntSource
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0A38
            PLA
            AND   #$000F
            PHA
            LDA   #^L1E6C
            PHA
            LDA   #L1E6C
            PHA
            _GetColorTable
            JSR   L0A38
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0A38
            PLA
            AND   #$000F
            PHA
            LDA   #^L1E8C
            PHA
            LDA   #L1E8C
            PHA
            _GetColorTable
            JSR   L0A38
            LDA   #^L1AAF
            PHA
            LDA   #L1AAF
            PHA
            _SetHeartBeat
            JSR   L0A38
            PEA   $0002
            _IntSource
            RTS

            PEA   $0003
            _IntSource
            PEA   $0000
            LDA   #^L1E6C
            PHA
            LDA   #L1E6C
            PHA
            _SetColorTable
            JSR   L0A38
            LDA   #^L1AAF
            PHA
            LDA   #L1AAF
            PHA
            _DelHeartBeat
            JSR   L0A38
            PEA   $0002
            _IntSource
            RTS

L1AAF       ADRL  $00000000
L1AB3       DW    $0001
            DW    $A55A
            PHB
            PHA
            PHK
            PLB
            REP   #$30
            STZ   L1B83
L1AC0       JSR   L1B01
            INC   L1B83
            INC   L1B83
            LDA   L1B83
            CMP   #$0008
            BCC   L1AC0
            PHA
            PEA   $0064
            _GetSCB
            JSR   L0A38
            PLA
            AND   #$000F
            PHA
            LDA   #^L1E8C
            PHA
            LDA   #L1E8C
            PHA
            _SetColorTable
            JSR   L0A38
            LDA   #$0001
            STA   L1AB3
            SEP   #$30
            PLA
            PLB
            RTL

            MX    %00
L1B01       LDX   L1B83
            DEC   L1B7B,X
            BEQ   L1B0A
            RTS

L1B0A       LDA   L1E4C,X
            STA   L1B7B,X
            LDA   L1E54,X
            STA   L1B77
            LDA   L1E64,X
            STA   L1B79
L1B1C       LDA   L1B79
            CMP   L1E5C,X
            BCC   L1B2C
            BEQ   L1B2C
            LDA   L1E54,X
            STA   L1B79
L1B2C       LDY   L1B77
            LDA   L1E6C,Y
            LDY   L1B79
            STA   L1E8C,Y
            INC   L1B79
            INC   L1B79
            INC   L1B77
            INC   L1B77
            LDA   L1B77
            CMP   L1E5C,X
            BCC   L1B1C
            BEQ   L1B1C
            LDA   L1E64,X
            CLC
            ADC   L1E44,X
            STA   L1E64,X
            CMP   #$8000
            BCS   L1B62
            CMP   L1E54,X
            BCS   L1B69
L1B62       LDA   L1E5C,X
            STA   L1E64,X
            RTS

L1B69       CMP   L1E5C,X
            BCC   L1B76
            BEQ   L1B76
            LDA   L1E54,X
            STA   L1E64,X
L1B76       RTS

L1B77       DW    $0000
L1B79       DW    $0000
L1B7B       DW    $0001
            DW    $0001
            DW    $0001
            DW    $0001
L1B83       DW    $0000
L1B85       PHA
            PEA   $0064
            _GetSCB
            JSR   L0A38
            PLA
            AND   #$000F
            STA   L1CF3
            LDA   L1CF3
            PHA
            LDA   #^L1CF5
            PHA
            LDA   #L1CF5
            PHA
            _GetColorTable
            JSR   L0A38
            PEA   $0001
            LDA   #^L1CF5
            PHA
            LDA   #L1CF5
            PHA
            _SetColorTable
            JSR   L0A38
            PEA   $0001
            _SetAllSCBs
            PHA
            PHA
            PEA   $0000
            PEA   $0320
            LDA   L027A
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            JSR   L0A38
            PLA
            STA   $00
            STA   L1EAC
            PLA
            STA   $02
            STA   L1EAC+2
            LDY   #$0000
            LDA   [$00],Y
            STA   L1EB0
            LDY   #$0002
            LDA   [$00],Y
            STA   L1EB0+2
            LDA   #^L1EBA
            STA   L028A+2
            LDA   #L1EBA
            STA   L028A
            LDA   #$000F
            STA   L028E
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            LDA   #$00E1
            STA   L028A+2
            LDA   #$9E00
            STA   L028A
            PHA
            PHA
            LDA   L1EC7
            PHA
            LDA   #$0020
            PHA
            _Multiply
            PLA
            STA   L028E
            PLA
            STA   L028E+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            LDA   #^L1EC9
            STA   L028A+2
            LDA   #L1EC9
            STA   L028A
            LDA   #$0002
            STA   L028E
            LDA   #$0000
            STA   L028E+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            LDA   L1EB0
            STA   L028A
            LDA   L1EB0+2
            STA   L028A+2
            LDA   #$0320
            STA   L028E
            LDA   #$0000
            STA   L028E+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            LDA   L0391
            STA   L0262
            LDA   L0393
            STA   L0264
            JSR   L0A6A
            LDA   L0266
            STA   L0395
            LDA   L0268
            STA   L0397
            LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HLock
            JSR   L0A38
            LDA   L0395
            STA   L028A
            LDA   L0397
            STA   L028A+2
            LDA   #$8000
            STA   L028E
            LDA   #$0000
            STA   L028E+2
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0288
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0296
            RTS

L1CF3       DW    $0000
L1CF5       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L1D15       _HideCursor
            LDA   #$00E1
            STA   L028A+2
            LDA   #$2000
            STA   L028A
            LDA   L0395
            STA   L1EB4
            LDA   L0397
            STA   L1EB6
            LDA   #$00C8
            STA   L0276
            LDA   #$0000
            STA   L03AF
L1D40       LDA   #$0000
            STA   L1EB8
            LDA   #$00A0
            STA   L03AD
L1D4C       PHA
            LDA   L1EB6
            PHA
            LDA   L1EB4
            PHA
            LDA   L1EB0
            STA   $00
            LDA   L1EB0+2
            STA   $02
            LDA   L03AF
            ASL
            ASL
            TAY
            LDA   [$00],Y
            PHA
            LDA   #^L028A
            PHA
            LDA   #L028A
            PHA
            LDA   #^L03AD
            PHA
            LDA   #L03AD
            PHA
            _UnPackBytes
            PLA
            CLC
            ADC   L1EB8
            STA   L1EB8
            LDA   L03AD
            BNE   L1D4C
            LDA   L1EB4
            CLC
            ADC   L1EB8
            STA   L1EB4
            LDA   L1EB6
            ADC   #$0000
            STA   L1EB6
            LDA   L03AF
            PHA
            PEA   $0000
            _SetSCB
            JSR   L0A38
            INC   L03AF
            DEC   L0276
            BEQ   L1DBB
            JMP   L1D40

L1DBB       LDA   L1EAC+2
            PHA
            LDA   L1EAC
            PHA
            _DisposeHandle
            JSR   L0A38
            LDA   L1EB4
            CLC
            ADC   #$0009
            STA   L1EB4
            LDA   L1EB6
            ADC   #$0000
            STA   L1EB6
            LDX   #$0000
L1DE3       LDA   L1EB4
            STA   $00
            LDA   L1EB6
            STA   $02
            LDY   #$0006
            LDA   [$00],Y
            BEQ   L1DFA
            LDA   #$FFFE
            JMP   L1DFD

L1DFA       LDA   #$0002
L1DFD       STA   L1E44,X
            LDY   #$0008
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L1E54,X
            STA   L1E64,X
            INY
            LDA   [$00],Y
            AND   #$00FF
            ASL
            STA   L1E5C,X
            LDA   L1EB4
            CLC
            ADC   #$0008
            STA   L1EB4
            INX
            INX
            CPX   #$0008
            BCS   L1E2D
            JMP   L1DE3

L1E2D       LDA   L0393
            PHA
            LDA   L0391
            PHA
            _HUnlock
            JSR   L0A38
            RTS

            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E44       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E4C       DB    $05
            DB    $00
            DB    $05
            DB    $00
            DB    $05
            DB    $00
            DB    $05
            DB    $00
L1E54       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E5C       DB    $00
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
L1E6C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E8C       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L1EAC       ADRL  $00000000
L1EB0       ADRL  $00000000
L1EB4       DB    $00
            DB    $00
L1EB6       DB    $00
            DB    $00
L1EB8       DB    $00
            DB    $00
L1EBA       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1EC7       DB    $00
            DB    $00
L1EC9       DB    $00
            DB    $00
*L1ECB       STR   '/oc.prog.disk/data2'
*L1EDF       STR   '/oc.boot.disk/data1'
L1ECB       STR   '1/data2'
L1EDF       STR   '1/data1'
L1EF3       DW    $0007       ;  prefix num
            ADRL  L1ECB       ;  prefix ptr
L1EF9       DW    $0000       ;  prefix num
            ADRL  L1EDF       ;  prefix ptr
L1EFF       DB    $00
L1F00       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1F40       DB    $00
L1F41       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1F81       DW    $0007       ;  prefix num
            ADRL  L1EFF       ;  prefix ptr
L1F87       DW    $0000       ;  prefix num
            ADRL  L1F40       ;  prefix ptr
L1F8D       DW    $0001       ;  prefix num
            ADRL  L1F40       ;  prefix ptr
L1F93       DW    $0001       ;  prefix num
            ADRL  L1EFF       ;  prefix ptr
L1F99       STR   'DATA1'
L1F9F       STR   'DATA2'
L1FA5       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1FB5       ADRL  L1FA5       ;  buffer ptr
L1FB9       STR   '/OC.BOOT.DISK/'
L1FC8       JSL   GSOS
            DW    $0028       ; GetBootVol
            ADRL  L1FB5
            JSR   L0A38
            JSR   L2034
            BCS   L1FDD
            JMP   L2015

L1FDD       JSL   GSOS
            DW    $000A       ; GetPrefix
            ADRL  L1F8D
            JSR   L0A38
            JSL   GSOS
            DW    $000A       ; GetPrefix
            ADRL  L1F93
            JSR   L0A38
            JSR   L206F
            JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1F81
            JSR   L0A38
            JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1F87
            JSR   L0A38
            RTS

L2015       JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1EF3
            JSR   L0A38
            JSL   GSOS
            DW    $0009       ; SetPrefix
            ADRL  L1EF9
            JSR   L0A38
            RTS

L2030       DW    $0000
L2032       DW    $0000
L2034       LDA   L1FA5
            AND   #$00FF
            STA   L2030
            LDA   L1FB9
            AND   #$00FF
            CMP   L2030
            BNE   L2067
            LDY   #$0000
L204B       INY
            LDA   L1FA5,Y
            AND   #$007F
            STA   L2032
            LDA   L1FB9,Y
            AND   #$007F
            CMP   L2032
            BNE   L2067
            CPY   L2030
            BCC   L204B
            CLC
            RTS

L2067       SEC
            RTS

L2069       DW    $0000
L206B       DW    $0000
L206D       DW    $0000
L206F       LDA   L1F99
            AND   #$00FF
            STA   L2069
            STA   L206D
            LDA   L1F40
            AND   #$00FF
            TAY
            LDX   #$0001
L2085       LDA   L1F99,X
            AND   #$00FF
            STA   L206B
            LDA   L1F41,Y
            AND   #$FF00
            ORA   L206B
            STA   L1F41,Y
            INY
            INX
            DEC   L2069
            BNE   L2085
            LDA   L1F40
            CLC
            ADC   L206D
            STA   L1F40
            LDA   L1F9F
            AND   #$00FF
            STA   L2069
            STA   L206D
            LDA   L1EFF
            AND   #$00FF
            TAY
            LDX   #$0001
L20C1       LDA   L1F9F,X
            AND   #$00FF
            STA   L206B
            LDA   L1F00,Y
            AND   #$FF00
            ORA   L206B
            STA   L1F00,Y
            INY
            INX
            DEC   L2069
            BNE   L20C1
            LDA   L1EFF
            CLC
            ADC   L206D
            STA   L1EFF
            RTS


